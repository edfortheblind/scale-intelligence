"""Single-flight GET transport through the authorized local browser context.

Does not export authentication state or create a separate HTTP cookie jar.
Normal sign-in is performed in the visible dedicated browser by the owner.
"""
import email.utils
import re
import time
from datetime import datetime, timezone
from urllib.parse import urljoin, urlsplit
from pathlib import Path

from collector import ROOTS, source_identity, atomic_json, read_json


class AcquisitionBlocked(Exception):
    def __init__(self, code, detail):
        self.code, self.detail = code, detail
        super().__init__(code + ": " + detail)


def error_class(error):
    value = str(error).lower()
    if any(x in value for x in ("enotfound", "name_not_resolved", "getaddrinfo")):
        return "DNS"
    if any(x in value for x in ("certificate", "cert_", "ssl", "tls")):
        return "TLS"
    if "timeout" in value or "timed out" in value:
        return "TIMEOUT"
    return "CONNECTION"


def retry_after(value):
    if not value:
        return 0.0
    try:
        return max(0.0, float(value))
    except ValueError:
        try:
            return max(0.0, (email.utils.parsedate_to_datetime(value) - datetime.now(timezone.utc)).total_seconds())
        except (ValueError, TypeError):
            return 0.0


def validate_body(url, mime, body):
    """Reject authentication/error representations using structure and context."""
    if not body and urlsplit(url).path.lower().endswith(('.js','.css')):
        return  # An explicitly published empty support file is still an original byte body.
    if not body:
        raise AcquisitionBlocked("EMPTY_BODY", "Empty response is not documentation")
    low = body.lower()
    # HTML strings inside JavaScript are data, not the response document.
    # Ignore only a BOM, leading whitespace and complete HTML comments.
    prefix = low.removeprefix(b"\xef\xbb\xbf").lstrip()
    while prefix.startswith(b"<!--"):
        end = prefix.find(b"-->")
        if end < 0:
            break
        prefix = prefix[end + 3:].lstrip()
    is_html = "html" in mime.lower() or bool(re.match(rb"(?:<!doctype\s+html|<(?:html|head|body))\b", prefix))
    expected_html = urlsplit(url).path.lower().endswith((".htm", ".html"))
    if is_html and re.search(rb"<input[^>]+type\s*=\s*[\"']?password", low):
        raise AcquisitionBlocked("BLOCKED_AUTH", "Authentication form detected; body not archived")
    if is_html and re.search(rb"<title[^>]*>\s*(?:sign in|log in|login|sign in to your account)\s*</title>", low):
        raise AcquisitionBlocked("BLOCKED_AUTH", "Authentication title detected; body not archived")
    if is_html and re.search(rb"<title[^>]*>\s*access denied", low):
        raise AcquisitionBlocked("BLOCKED_PERMISSION", "Access-denied title detected; body not archived")
    if is_html and re.search(rb"<title[^>]*>\s*(?:404\b|page not found|server error in|service unavailable|error\s*</title>)", low):
        raise AcquisitionBlocked("AUTH_OR_SOFT_ERROR", "Page title identifies authentication or an error")
    if is_html and not expected_html:
        raise AcquisitionBlocked("UNEXPECTED_HTML", "Non-HTML resource returned HTML")
    if expected_html and not is_html:
        raise AcquisitionBlocked("UNEXPECTED_FORMAT", "HTML resource did not return HTML")
    if is_html and not any(marker in low for marker in (b"madcap", b"innovasys", b"<body")):
        raise AcquisitionBlocked("UNEXPECTED_DOCUMENT", "Expected document structure is missing")
    secret_patterns = (rb"gh[pousr]_[A-Za-z0-9]{30,}", rb"github_pat_[A-Za-z0-9_]{30,}",
                       rb"eyJ[A-Za-z0-9_-]{15,}\.[A-Za-z0-9_-]{15,}\.[A-Za-z0-9_-]{15,}",
                       rb"-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----")
    if any(re.search(pattern, body) for pattern in secret_patterns):
        raise AcquisitionBlocked("PRIVATE_REVIEW_REQUIRED", "Possible secret-bearing response; body not archived")


class StageTransport:
    def __init__(self, request, *, module="AIM", clock=time.monotonic, sleep=time.sleep, cooldown_path=None):
        self.request, self.module = request, module
        self.clock, self.sleep = clock, sleep
        self.next_allowed = 0.0
        self.origin_failures = 0
        self.cooldown_path = Path(cooldown_path) if cooldown_path else None
        if self.cooldown_path and self.cooldown_path.exists():
            remaining = read_json(self.cooldown_path).get('retry_not_before_epoch', 0) - time.time()
            self.next_allowed = self.clock() + max(0, remaining)

    def admit(self, url):
        identity = source_identity(url, url)
        if identity["module"] != self.module:
            raise AcquisitionBlocked("DEFERRED_CROSS_MODULE", "Other module is not eligible for acquisition yet")
        return identity["fetch_key"]

    def pace(self):
        if self.next_allowed - self.clock() > 60:
            raise AcquisitionBlocked('RATE_LIMIT_WAIT', 'Persisted Retry-After cooldown is still active')
        self.sleep(max(0.0, self.next_allowed - self.clock()))
        self.next_allowed = self.clock() + 0.5

    def get(self, url):
        current = self.admit(url)
        chain = []
        if self.origin_failures >= 3:
            raise AcquisitionBlocked("CIRCUIT_OPEN", "Three origin-level failures; new requests paused")
        for _ in range(9):
            self.pace()
            try:
                response = self.request.get(current, max_redirects=0, max_retries=0, timeout=30000)
            except Exception as error:
                self.origin_failures += 1
                raise AcquisitionBlocked(error_class(error), "Request failed; private error detail omitted") from None
            try:
                status = response.status
                headers = response.headers
                if status in (301, 302, 303, 307, 308):
                    target = urljoin(current, headers.get("location", ""))
                    try:
                        target = self.admit(target)
                    except (ValueError, AcquisitionBlocked):
                        raise AcquisitionBlocked("BLOCKED_AUTH_OR_SCOPE", "Redirect leaves eligible documentation; it was not followed") from None
                    chain.append({"source_url": current, "status": status, "target_url": target})
                    if target == current or len(chain) == 9:
                        raise AcquisitionBlocked("REDIRECT_LOOP", "Redirect chain could not be resolved")
                    current = target
                    continue
                if status in (401, 403):
                    raise AcquisitionBlocked("BLOCKED_AUTH" if status == 401 else "BLOCKED_PERMISSION", "Server refused documentation access")
                if status in (429, 500, 502, 503, 504):
                    self.origin_failures += 1
                    delay = retry_after(headers.get("retry-after"))
                    self.next_allowed = max(self.next_allowed, self.clock() + delay)
                    if delay and self.cooldown_path:
                        atomic_json(self.cooldown_path, {'retry_not_before_epoch':time.time() + delay})
                    raise AcquisitionBlocked("RATE_LIMIT" if status == 429 else "TRANSIENT_HTTP", "HTTP " + str(status))
                if status != 200:
                    raise AcquisitionBlocked("NOT_FOUND" if status == 404 else "HTTP_ERROR", "HTTP " + str(status))
                final_url = self.admit(response.url)
                mime = headers.get("content-type", "application/octet-stream")
                try:
                    body = response.body()
                except Exception as error:
                    self.origin_failures += 1
                    raise AcquisitionBlocked(error_class(error), 'Response body could not be read') from None
                validate_body(final_url, mime, body)
                charset = re.search(r"charset=([^;\s]+)", mime, re.I)
                self.origin_failures = 0
                return body, {"final_url": final_url, "http_status": status,
                              "mime": mime, "encoding": charset.group(1).strip("\"'") if charset else None,
                              "redirect_chain": chain}
            finally:
                response.dispose()
        raise AcquisitionBlocked("REDIRECT_LOOP", "Redirect limit reached")
