"""Bounded original-byte capability probe in the owner-authorized Edge session.

No cookies are exported. The dedicated profile and probe bodies stay outside
OneDrive and Git. Normal SSO is performed by the owner in the visible browser.
"""
import json
import os
from pathlib import Path
import re
import sys
import time
from urllib.parse import urlsplit

from playwright.sync_api import sync_playwright, Error as BrowserError
from collector import SEEDS, source_identity, digest, atomic_bytes, atomic_json, now

PRIVATE = Path(os.environ["LOCALAPPDATA"]) / "TAB/SCALE-Intelligence/private"
PROBE = PRIVATE / "body-probe"


def report(value):
    print(json.dumps(value), flush=True)


def classify_error(error):
    message = str(error).lower()
    if any(x in message for x in ("enotfound", "name_not_resolved", "getaddrinfo")):
        return "DNS"
    if any(x in message for x in ("certificate", "cert_", "ssl", "tls")):
        return "TLS"
    if "timeout" in message or "timed out" in message:
        return "TIMEOUT"
    return "BROWSER_OR_CONNECTION"


def inspect_response(response, method):
    if response is None:
        return {"result": "NO_RESPONSE", "method": method}
    try:
        identity = source_identity(response.url, SEEDS["AIM"])
    except ValueError:
        return {"result": "BLOCKED_AUTH_OR_REDIRECT", "method": method,
                "status": response.status, "body_saved": False}
    status = response.status
    if status != 200:
        return {"result": "HTTP_" + str(status), "method": method, "body_saved": False}
    body = response.body()
    lowered = body.lower()
    if b"madcap" not in lowered or b"<html" not in lowered:
        return {"result": "UNEXPECTED_DOCUMENT", "method": method, "body_saved": False}
    if re.search(rb'<input[^>]+type\s*=\s*[\"\x27]password', lowered):
        return {"result": "BLOCKED_AUTH", "method": method, "body_saved": False}
    filename = method + "-" + digest(body) + ".html"
    atomic_bytes(PROBE / filename, body)
    result = {"result": "ORIGINAL_BYTES_SAVED", "method": method,
              "source_url": identity["fetch_key"], "http_status": status,
              "mime": response.headers.get("content-type"), "bytes": len(body),
              "sha256": digest(body), "saved_at": now(), "file": filename,
              "roundtrip_hash_matches": digest((PROBE / filename).read_bytes()) == digest(body)}
    atomic_json(PROBE / (method + ".json"), result)
    return result


def main():
    PROBE.mkdir(parents=True, exist_ok=True)
    with sync_playwright() as playwright:
        context = playwright.chromium.launch_persistent_context(
            str(PRIVATE / "stage-edge-profile"), channel="msedge", headless=False,
            chromium_sandbox=True, ignore_https_errors=False, bypass_csp=False,
            accept_downloads=True)
        page = context.new_page()
        report({"browser": "msedge", "version": context.browser.version,
                "profile": "dedicated_private_stage_profile", "command": "probe"})

        def probe():
            try:
                response = context.request.get(SEEDS["AIM"], max_redirects=0,
                                               max_retries=0, timeout=20000)
                result = inspect_response(response, "request-body")
                response.dispose()
                report(result)
            except BrowserError as error:
                report({"result": classify_error(error), "method": "request-body"})
            time.sleep(0.5)
            try:
                response = page.goto(SEEDS["AIM"], wait_until="domcontentloaded", timeout=30000)
                report(inspect_response(response, "browser-response-body"))
                report({"page_origin": urlsplit(page.url).scheme + "://" + urlsplit(page.url).netloc,
                        "documentation_url": page.url if page.url.startswith(SEEDS["AIM"]) else None})
            except BrowserError as error:
                report({"result": classify_error(error), "method": "browser-response-body"})

        probe()
        report({"state": "WAITING_FOR_OPERATOR", "commands": ["probe", "sso", "close"]})
        for command in sys.stdin:
            command = command.strip()
            if command == "close":
                break
            if command == "probe":
                probe()
            elif command == "sso":
                try:
                    page.goto("https://travstg.manhscale.com/scale/trans/dashboard",
                              wait_until="domcontentloaded", timeout=30000)
                    report({"state": "NORMAL_SSO_UI_OPEN", "authentication_response_archived": False})
                except BrowserError as error:
                    report({"state": "SSO_NAVIGATION_FAILED", "class": classify_error(error)})
        context.close()


if __name__ == "__main__":
    main()
