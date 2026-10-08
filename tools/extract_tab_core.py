"""Extract only registered TAB core SDDs with the existing SDD extraction helpers.

Originals and the historical SDD/derived inventory are never rewritten.
PDF extraction uses the existing PyMuPDF 1.28.2 dependency.
"""
from __future__ import annotations

import json
from pathlib import Path

if __package__:
    from .extract_sdd import digest, extract_ooxml, extract_pdf, render_reading_copy, write_json
else:
    from extract_sdd import digest, extract_ooxml, extract_pdf, render_reading_copy, write_json


ROOT = Path(__file__).resolve().parents[1]


def validate_output_tree(out):
    """Reject redirected output paths before any helper can write assets."""
    pending = [out]
    while pending:
        path = pending.pop()
        resolved = path.resolve()
        if resolved != path or not resolved.is_relative_to(out):
            raise ValueError("Core extraction output contains a redirected path")
        if path.is_dir():
            pending.extend(path.iterdir())


def extract_registered(root=ROOT):
    root = Path(root).resolve()
    registry = json.loads((root / "SDD/tab-core-sources.json").read_text(encoding="utf-8"))
    out = root / "SDD/tab-core"
    validate_output_tree(out)
    sources = []
    # Verify the complete source set before writing any extraction output.
    for source in registry["sources"]:
        path = (root / source["path"]).resolve()
        if not path.is_relative_to(root / "SDD") or path.is_relative_to(out):
            raise ValueError("Core source must be an original under SDD, outside extraction output")
        data = path.read_bytes()
        if len(data) != source["bytes"] or digest(data) != source["sha256"]:
            raise ValueError(f"Core source identity changed: {source['id']}")
        if path.suffix.lower() not in {".docx", ".pdf"}:
            raise ValueError("Unsupported core SDD format")
        sources.append((source, path))

    documents = []
    for source, path in sources:
        sid = "sdd-" + source["sha256"][:16]
        if path.suffix.lower() == ".pdf":
            nodes, assets, exceptions, pages = extract_pdf(path, out, sid)
        else:
            nodes, assets, exceptions = extract_ooxml(path, out, sid)
            pages = None
        document = {
            "schema_version": 1, "document_id": sid, "core_source_id": source["id"],
            "source_path": source["path"], "source_sha256": source["sha256"],
            "format": path.suffix[1:].lower(), "page_count": pages,
            "extraction_state": "EXTRACTED_WITH_FIDELITY_EXCEPTIONS",
            "semantic_review": "SEE_TAB_RECONCILIATION_REGISTER",
            "production_index_eligible": False,
            "nodes": nodes, "assets": assets, "exceptions": exceptions,
        }
        document_path = f"documents/{sid}.json"
        reading_path = f"reading/{sid}.md"
        write_json(out / document_path, document)
        (out / "reading").mkdir(parents=True, exist_ok=True)
        (out / reading_path).write_text(render_reading_copy(document), encoding="utf-8", newline="\n")
        documents.append({
            "core_source_id": source["id"], "source_path": source["path"],
            "source_sha256": source["sha256"], "document_id": sid,
            "document_path": document_path, "reading_path": reading_path,
            "node_count": len(nodes), "asset_count": len(assets), "page_count": pages,
        })
    identities = [{k: s[k] for k in ("id", "path", "bytes", "sha256")} for s, _ in sources]
    inventory = {
        "schema_version": 1, "source_registry": "SDD/tab-core-sources.json",
        "source_identity_sha256": digest(json.dumps(identities, sort_keys=True).encode("utf-8")),
        "documents": documents, "original_count": len(sources),
        "index_status": "DOCUMENTARY_SOURCE_PACKET_NOT_IN_HELP_SEARCH",
    }
    write_json(out / "inventory.json", inventory)
    return inventory


if __name__ == "__main__":
    result = extract_registered()
    print(json.dumps(result, indent=2))
