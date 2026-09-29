"""Durable acquisition foundation. No network or browser authentication access.

Browser exports are imported as bytes; DOM text is never accepted as original HTML.
Completion remains blocked until a supported original-body adapter is available.
"""
from __future__ import annotations

import argparse
import contextlib
import hashlib
import json
import os
from pathlib import Path
import re
import struct
import sys
import tempfile
import time
from datetime import datetime, timezone
from urllib.parse import urljoin, urlsplit, urlunsplit, unquote, parse_qsl

VERSION = "0.2.0"
REVISION = "STAGE-CHATGPT-EN-2.0"
ORIGIN = "https://travstg.manhscale.com"
ROOTS = {"AIM": "/SCALEHelp/Help/WebHelp/", "SDK": "/SCALEHelp/SDK/"}
SEEDS = {"AIM": ORIGIN + ROOTS["AIM"] + "OnlineHelp.htm",
         "SDK": ORIGIN + ROOTS["SDK"] + "webframe.html#Welcome.html"}
BLOCKER = {
    "code": "BLOCKED_CAPABILITY", "id": "original_response_body_export",
    "detail": "Existing browser exposes read-only DOM and image/font/stylesheet/video bundles, "
              "but no documented general original HTML/XML/JavaScript response-body export. "
              "The published copyright article download timed out after 20 seconds.",
    "required": "A supported byte-preserving resource export through the existing authorized "
                "Stage browser session, including status, redirect chain, MIME and encoding.",
}


def now():
    return datetime.now(timezone.utc).isoformat()


def digest(data):
    return hashlib.sha256(data).hexdigest()


def atomic_bytes(path, data):
    """Flush and verify a sibling temporary file before atomic replacement."""
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.is_file() and path.read_bytes() == data:
        return
    fd, temp = tempfile.mkstemp(prefix=".pending-", dir=path.parent)
    try:
        with os.fdopen(fd, "wb") as stream:
            stream.write(data)
            stream.flush()
            os.fsync(stream.fileno())
        if digest(Path(temp).read_bytes()) != digest(data):
            raise ValueError("Temporary file hash mismatch")
        for attempt in range(8):
            try:
                os.replace(temp, path)
                break
            except PermissionError:
                # OneDrive/antivirus may briefly open the destination without delete sharing.
                # Keep the old checkpoint intact; never alter permissions or overwrite in place.
                if attempt == 7:
                    raise
                time.sleep(min(0.1 * 2 ** attempt, 1.6))
    finally:
        if Path(temp).exists():
            Path(temp).unlink()


def atomic_json(path, value):
    atomic_bytes(path, (json.dumps(value, indent=2, ensure_ascii=False) + "\n").encode("utf-8"))


def read_json(path):
    return json.loads(Path(path).read_text(encoding="utf-8-sig"))


def source_identity(href, base, shared_support=False):
    """Preserve URL spelling/query; deduplicate only fragments. Never request a URL."""
    url = urljoin(base, href)
    parts = urlsplit(url)
    if parts.scheme != "https" or parts.netloc != "travstg.manhscale.com":
        raise ValueError("OUT_OF_SCOPE_ORIGIN")
    if parts.username or parts.password or any(ord(c) < 32 for c in url):
        raise ValueError("UNSAFE_URL")
    if any(re.search(r"token|session|auth|signature|credential|password|secret|^sig$|^key$", key, re.I)
           for key, _ in parse_qsl(parts.query)):
        raise ValueError("SENSITIVE_URL_REQUIRES_PRIVATE_REVIEW")
    if re.search(r"(?:token|session|password|secret|signature|credential)[=:]", unquote(parts.fragment), re.I):
        raise ValueError("SENSITIVE_FRAGMENT_REQUIRES_PRIVATE_REVIEW")
    decoded = parts.path
    for _ in range(3):
        decoded = unquote(decoded)
    if "\\" in decoded or any(p in (".", "..") for p in decoded.split("/")):
        raise ValueError("UNSAFE_PATH")
    module = next((m for m, prefix in ROOTS.items() if parts.path.startswith(prefix)), None)
    if module is None and not (shared_support and parts.path.startswith("/SCALEHelp/")):
        raise ValueError("OUT_OF_SCOPE_PATH")
    key = urlunsplit((parts.scheme, parts.netloc, parts.path, parts.query, ""))
    return {"url": url, "fetch_key": key, "fragment": parts.fragment,
            "module": module, "id": digest(key.encode("utf-8"))}


@contextlib.contextmanager
def writer_lock(root, runtime):
    """OS lock releases on process exit; stale metadata never grants ownership."""
    runtime = Path(runtime) / digest(str(Path(root).resolve()).casefold().encode())[:20]
    runtime.mkdir(parents=True, exist_ok=True)
    with (runtime / "writer.lock").open("a+b") as lock:
        lock.seek(0, os.SEEK_END)
        if lock.tell() == 0:
            lock.write(b"0")
            lock.flush()
        lock.seek(0)
        if os.name == "nt":
            import msvcrt
            msvcrt.locking(lock.fileno(), msvcrt.LK_NBLCK, 1)
        else:
            import fcntl
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        owner = {"pid": os.getpid(), "acquired_at": now(), "root": str(Path(root).resolve())}
        atomic_json(runtime / "owner.json", owner)
        try:
            yield owner
        finally:
            atomic_json(runtime / "owner.json", {**owner, "released_at": now()})
            lock.seek(0)
            if os.name == "nt":
                msvcrt.locking(lock.fileno(), msvcrt.LK_UNLCK, 1)
            else:
                fcntl.flock(lock, fcntl.LOCK_UN)


class Store:
    def __init__(self, root, *, cache_records=False):
        self.root = Path(root).resolve()
        self.cache_records = cache_records
        self._records = {}

    def records(self, module):
        if self.cache_records and module in self._records:
            return [self._records[module][key] for key in sorted(self._records[module])]
        result = [read_json(p) for p in sorted((self.root / module / "manifests/resources").glob("*.json"))]
        if self.cache_records:
            self._records[module] = {r['id']:r for r in result}
        return result

    def save_record(self, record):
        atomic_json(self.root / record["module"] / "manifests/resources" / (record["id"] + ".json"), record)
        if self.cache_records and record['module'] in self._records:
            self._records[record['module']][record['id']] = record

    def discover(self, module, href, base, discovery_source, kind="unclassified"):
        identity = source_identity(href, base)
        if identity["module"] != module:
            raise ValueError("CROSS_MODULE_DEFERRED")
        if module == "SDK":
            state_path = self.root / "_project/STATE.json"
            state = read_json(state_path) if state_path.exists() else {}
            if state.get("modules", {}).get("AIM", {}).get("status") not in ("MODULE_LOCAL_COMPLETE", "CORPUS_COMPLETE"):
                raise ValueError("SDK_REQUIRES_AIM_LOCAL_COMPLETE")
        path = self.root / module / "manifests/resources" / (identity["id"] + ".json")
        record = read_json(path) if path.exists() else {
            "id": identity["id"], "module": module, "source_url": identity["fetch_key"],
            "type": kind, "occurrences": [], "status": "PENDING", "attempts": 0,
            "titles": [], "breadcrumbs": [], "variants": [], "discovered_at": now(),
            "http_status": None, "mime": None, "encoding": None, "final_url": None,
            "local_path": None, "sha256": None, "byte_count": None,
            "verification": "NOT_CAPTURED",
            "additional_occurrence_index": module + "/data/articles/*.json:references[target_id]",
        }
        occurrence = {"original_href": href, "resolved_url": identity["url"],
                      "fragment": identity["fragment"], "discovery_source": discovery_source}
        if occurrence not in record["occurrences"]:
            record["occurrences"].append(occurrence)
        self.save_record(record)
        return record

    def import_browser_asset(self, asset, bundle_manifest):
        identity = source_identity(asset["url"], SEEDS["AIM"])
        if identity["module"] != "AIM":
            raise ValueError("AIM_PHASE_ONLY")
        if asset["kind"] not in ("image", "font", "stylesheet", "video"):
            raise ValueError("UNSUPPORTED_BROWSER_EXPORT_KIND")
        record = self.discover("AIM", asset["url"], SEEDS["AIM"], "browser.pageAssets", asset["kind"])
        data = Path(asset["path"]).read_bytes()
        if not data:
            raise ValueError("EMPTY_ASSET")
        mime = asset.get("contentType") or "application/octet-stream"
        if "html" in mime or data.lstrip()[:40].lower().startswith((b"<!doctype html", b"<html")):
            raise ValueError("UNEXPECTED_HTML_ASSET_REQUIRES_PRIVATE_REVIEW")
        suffix = Path(urlsplit(asset["url"]).path).suffix
        if not re.fullmatch(r"\.[A-Za-z0-9]{1,8}", suffix):
            suffix = ".bin"
        content_hash = digest(data)
        relative = "AIM/source/assets/" + content_hash + suffix
        existing = self.root / relative
        if (record.get("sha256") == content_hash and existing.is_file()
                and digest(existing.read_bytes()) == content_hash):
            return record
        atomic_bytes(self.root / relative, data)
        record.update(status="BODY_SAVED", local_path=relative, sha256=content_hash,
                      byte_count=len(data), mime=mime, encoding=None, acquired_at=now(),
                      attempts=record["attempts"] + 1, verification="LOCAL_BYTES_VERIFIED",
                      extraction_method="browser.pageAssets.bundle",
                      collector_version=VERSION, representation="exported_resource_body",
                      metadata_limitations=["HTTP status and final redirect chain not exposed by exporter"],
                      transport_metadata_verified=False, reading_copy_verified=False,
                      bundle_manifest_sha256=digest(Path(bundle_manifest).read_bytes()))
        if data.startswith(b"\x89PNG\r\n\x1a\n") and len(data) >= 24:
            record["dimensions"] = dict(zip(("width", "height"), struct.unpack(">II", data[16:24])))
        self.save_record(record)
        return record

    def save_original(self, record, body, metadata):
        """Commit decoded transport bytes without text conversion or DOM serialization."""
        identity = source_identity(metadata["final_url"], record["source_url"])
        if identity["module"] != record["module"] or metadata["http_status"] != 200:
            raise ValueError("UNACCEPTABLE_RESPONSE")
        if not isinstance(body, bytes) or (not body and record['type'] not in ('script','stylesheet')):
            raise ValueError("ORIGINAL_BYTES_REQUIRED")
        kind = record["type"]
        folder = {"article": "html", "navigation": "navigation", "script": "assets",
                  "stylesheet": "assets", "image": "assets", "font": "assets",
                  "video": "assets", "attachment": "downloads"}.get(kind)
        if folder is None:
            raise ValueError("CLASSIFICATION_REQUIRED")
        extension = Path(urlsplit(record["source_url"]).path).suffix
        if not re.fullmatch(r"\.[A-Za-z0-9]{1,8}", extension):
            extension = ".bin"
        sha = digest(body)
        relative = record["module"] + "/source/" + folder + "/" + sha + extension
        prior = {key: record.get(key) for key in ("sha256", "local_path", "acquired_at", "byte_count")}
        if prior["sha256"] and prior["sha256"] != sha:
            record.setdefault("prior_bodies", []).append(prior)
        atomic_bytes(self.root / relative, body)
        # Authentication headers and other ambient response data never enter manifests.
        for key in ("final_url", "http_status", "mime", "encoding", "redirect_chain"):
            if key in metadata:
                record[key] = metadata[key]
        record.update(sha256=sha, byte_count=len(body), local_path=relative,
                      status="BODY_SAVED", acquired_at=now(), verification="LOCAL_BYTES_VERIFIED",
                      extraction_method="playwright.APIResponse.body", collector_version=VERSION,
                      representation="http_content_decoded_body", transport_metadata_verified=True,
                      metadata_limitations=[], reading_copy_verified=False, empty_body=(len(body) == 0))
        record.pop("last_failure", None)
        self.save_record(record)
        return record

    def verify(self):
        failures, count = [], 0
        for module in ROOTS:
            for record in self.records(module):
                if not record.get("local_path"):
                    continue
                path = (self.root / record["local_path"]).resolve()
                if not path.is_relative_to(self.root):
                    failures.append({"id": record["id"], "error": "PATH_ESCAPE"})
                    continue
                if not path.is_file():
                    failures.append({"id": record["id"], "error": "MISSING_BODY"})
                    continue
                data = path.read_bytes()
                if digest(data) != record["sha256"] or len(data) != record["byte_count"]:
                    failures.append({"id": record["id"], "error": "HASH_OR_LENGTH_MISMATCH"})
                    continue
                count += 1
        state_path = self.root / "_project/STATE.json"
        state = read_json(state_path) if state_path.exists() else {}
        return {"checked_at": now(), "stored_bodies_verified": count, "failures": failures,
                "local_integrity_passed": not failures, "corpus_complete": False,
                "discovery": "DISCOVERY_INCOMPLETE", "pilot": state.get("pilot", "NOT_RUN")}

    def checkpoint(self, owner=None, *, phase=None, blockers=None, worker_running=False):
        state_path = self.root / "_project/STATE.json"
        previous = read_json(state_path) if state_path.exists() else {}
        if phase and previous.get("phase") == "PROJECT_COMPLETE" and phase != "PROJECT_COMPLETE":
            raise ValueError("Explicit revalidation is required before reopening a completed project")
        modules = {}
        for module in ROOTS:
            records = self.records(module)
            counts = {"discovered": len(records), "pending": sum(r["status"] == "PENDING" for r in records),
                      "bodies_saved": sum(r["status"] == "BODY_SAVED" for r in records),
                      "articles_verified": sum(r.get("type") == "article" and r.get("reading_copy_verified", False) for r in records),
                      "failed": sum(r["status"] == "FAILED" for r in records)}
            old_module = previous.get("modules", {}).get(module, {})
            modules[module] = {**old_module,
                               "status": old_module.get("status", "DISCOVERY_INCOMPLETE" if module == "AIM" else "WAITING_FOR_AIM"),
                               "counts": counts, "manifests": module + "/manifests/resources/"}
            coverage_path = self.root / module / "reports/coverage.json"
            coverage = read_json(coverage_path) if coverage_path.exists() else {"module": module,
                        "denominators": {k: None for k in ("articles", "variants", "assets", "attachments", "internal_links")},
                        "ratios": None, "pilot": "NOT_RUN", "discovery_reconciled": False,
                        "reason": "Complete published inventory has not been acquired."}
            coverage.update(status=modules[module]["status"], counts=counts,
                            pilot=previous.get("pilot", "NOT_RUN") if module == "AIM" else old_module.get("pilot", "NOT_RUN"))
            atomic_json(coverage_path, coverage)
        state = {**previous, "scope_revision": REVISION, "collector_version": VERSION,
                 "phase": phase or previous.get("phase", "BLOCKED_CAPABILITY"),
                 "module": previous.get("module", "AIM"), "updated_at": now(),
                 "worker_running": worker_running, "writer": {"protocol": "external_os_file_lock", "last_operation": owner,
                                                                 "heartbeat_at": now()},
                 "modules": modules, "blockers": blockers if blockers is not None else previous.get("blockers", [BLOCKER]),
                 "pilot": previous.get("pilot", "NOT_RUN"),
                 "next_invocation": previous.get("next_invocation", ".\\tools\\scale-int.ps1 preflight")}
        atomic_json(state_path, state)
        return state


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("operation", choices=["preflight", "discover", "capture", "resume", "verify", "status", "publish"])
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--references", type=Path)
    parser.add_argument("--bundle", type=Path)
    args = parser.parse_args()
    store = Store(args.root)
    runtime = Path(os.environ.get("LOCALAPPDATA", tempfile.gettempdir())) / "TAB/SCALE-Intelligence/runtime"
    if args.operation == "status":
        print(json.dumps(read_json(store.root / "_project/STATE.json"), indent=2))
        return 0
    with writer_lock(store.root, runtime) as owner:
        if args.operation == "discover":
            if not args.references:
                parser.error("discover requires a machine-produced --references JSON file")
            for item in read_json(args.references):
                store.discover(**item)
        elif args.operation == "capture":
            if not args.bundle:
                parser.error("capture requires a --bundle manifest from browser.pageAssets.bundle")
            bundle = read_json(args.bundle)
            for asset in bundle["assets"]:
                store.import_browser_asset(asset, args.bundle)
        elif args.operation == "preflight":
            for name in ("01_AIM_MASTER_PROMPT.md", "02_SDK_MASTER_PROMPT.md"):
                candidates = [store.root / "prompts" / name, store.root / name]
                selected = next((p for p in candidates if p.exists()), None)
                if selected is None or REVISION not in selected.read_text(encoding="utf-8-sig"):
                    raise ValueError("Required revision unavailable: " + name)
            store.discover("AIM", SEEDS["AIM"], SEEDS["AIM"], "owner_authorized_entry", "navigation")
        if args.operation in ("verify", "resume", "publish"):
            report = store.verify()
            atomic_json(store.root / "_project/local-integrity.json", report)
            if report["failures"]:
                print(json.dumps(report, indent=2))
                return 1
        state = store.checkpoint(owner)
        if args.operation == "publish":
            print("BLOCKED: corpus publication gate requires complete discovery, fidelity and clean-clone evidence.")
            return 2
        print(json.dumps({"phase": state["phase"], "modules": state["modules"],
                          "operation": args.operation, "worker_running": False}, indent=2))
        return 2 if args.operation == "resume" else 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except (OSError, ValueError, KeyError) as exc:
        print(type(exc).__name__ + ": operation failed; inspect input or lock without disclosing private values", file=sys.stderr)
        sys.exit(1)
