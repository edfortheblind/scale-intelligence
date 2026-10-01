"""Extract owner-supplied SDD sources without changing originals.

OOXML uses the standard library. PDFs require PyMuPDF (tested with 1.28.2).
This creates provisional documentary content, never reviewed deployment facts.
"""
from __future__ import annotations

import argparse
import hashlib
import html
import json
import posixpath
import re
from pathlib import Path
from xml.etree import ElementTree as ET
from zipfile import ZipFile

NS = {"w": "http://schemas.openxmlformats.org/wordprocessingml/2006/main",
      "a": "http://schemas.openxmlformats.org/drawingml/2006/main",
      "p": "http://schemas.openxmlformats.org/presentationml/2006/main",
      "r": "http://schemas.openxmlformats.org/officeDocument/2006/relationships"}


def digest(data):
    return hashlib.sha256(data).hexdigest()


def write_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + "\n", encoding="utf-8", newline="\n")


def markdown_label(text):
    """Keep source-derived display labels from creating Markdown or HTML."""
    label = html.escape(str(text).replace("\n", " ").replace("\r", " "), quote=False)
    return re.sub(r"([\\`*_{}\[\]()#+.!|-])", r"\\\1", label)


def render_reading_copy(document):
    """Render source text as inert fenced plaintext; exact text remains in JSON."""
    title = markdown_label(Path(document["source_path"]).stem)
    lines = [f"# {title}", "", f"Original SHA-256: `{document['source_sha256']}`", "",
             "Provisional extraction; source-specific limitations remain in JSON. Source bodies below are literal text, not executable HTML or Markdown.", ""]
    for node in document["nodes"]:
        anchor = html.escape(node["id"], quote=True)
        lines.extend([f'<a id="{anchor}"></a>', f"## {markdown_label(node['id'])} — {markdown_label(node['location'])}", ""])
        if node.get("source_text_state") == "MIXED_REVISIONS_NOT_RESOLVED":
            lines.extend(["**Unresolved tracked edits: this text includes revisions and must not be treated as accepted source wording. See revision_runs and deleted_text_fragments in JSON.**", ""])
        text = node["text"]
        fence = "`" * max(3, max((len(run) for run in re.findall(r"`+", text)), default=0) + 1)
        lines.extend([fence + "text", text, fence, ""])
    return "\n".join(lines)


def xml_text(element):
    """Retain visible XML text, tabs and explicit line breaks, excluding field code."""
    chunks = []
    for e in element.iter():
        local = e.tag.rsplit("}", 1)[-1]
        if local in ("t", "delText"):
            chunks.append(e.text or "")
        elif local == "tab":
            chunks.append("\t")
        elif local in ("br", "cr"):
            chunks.append("\n")
    return "".join(chunks)


def revision_state(element):
    """Keep unresolved editing markup visible to claim consumers."""
    changes = [{"kind": e.tag.rsplit("}", 1)[-1], "text": xml_text(e)}
               for e in element.iter()
               if e.tag in {f"{{{NS['w']}}}{kind}" for kind in ("ins", "del", "moveFrom", "moveTo")}]
    deleted = [e.text or "" for e in element.iter() if e.tag == f"{{{NS['w']}}}delText"]
    return {"source_text_state": "MIXED_REVISIONS_NOT_RESOLVED" if changes or deleted else "NO_TRACKED_CHANGE_MARKUP",
            "revision_runs": changes, "deleted_text_fragments": deleted}


def rels(zf, part):
    directory, name = posixpath.split(part)
    relpart = f"{directory}/_rels/{name}.rels"
    if relpart not in zf.namelist():
        return {}
    result = {}
    for r in ET.fromstring(zf.read(relpart)):
        external = r.get("TargetMode") == "External"
        target = r.get("Target", "")
        result[r.get("Id")] = {"target": target if external else posixpath.normpath(posixpath.join(directory, target)),
                                "external": external, "type": r.get("Type", "").rsplit("/", 1)[-1]}
    return result


def asset(zf, target, out, sid):
    data = zf.read(target)
    sha = digest(data)
    dest = out / "assets" / sid / (sha + Path(target).suffix.lower())
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    return {"part": target, "path": dest.relative_to(out).as_posix(), "sha256": sha, "bytes": len(data),
            "review_state": "UNREVIEWED_VISUAL"}


def media_refs(element, relationships, assets):
    targets = []
    for e in element.iter():
        for key, value in e.attrib.items():
            if key.rsplit("}", 1)[-1] in ("embed", "link", "id") and value in relationships:
                r = relationships[value]
                if r["target"] in assets:
                    targets.append(assets[r["target"]]["path"])
    return sorted(set(targets))


def table_rows(element, prefix):
    rows = []
    for ri, row in enumerate(element.findall("w:tr", NS), 1):
        cells = []
        for ci, cell in enumerate(row.findall("w:tc", NS), 1):
            span = cell.find("w:tcPr/w:gridSpan", NS)
            merge = cell.find("w:tcPr/w:vMerge", NS)
            cells.append({"id": f"{prefix}-r{ri}-c{ci}",
                          "text": "\n".join(xml_text(p) for p in cell.findall(".//w:p", NS)),
                          "grid_span": int(span.get(f"{{{NS['w']}}}val", "1")) if span is not None else 1,
                          "vertical_merge": (merge.get(f"{{{NS['w']}}}val", "continue") if merge is not None else None)})
        rows.append(cells)
    return rows


def extract_ooxml(path, out, sid):
    nodes, assets, exceptions = [], {}, []
    with ZipFile(path) as zf:
        for name in zf.namelist():
            if "/media/" in name and not name.endswith("/"):
                assets[name] = asset(zf, name, out, sid)
        if path.suffix.lower() == ".docx":
            part = "word/document.xml"
            root = ET.fromstring(zf.read(part))
            relationships = rels(zf, part)
            styles = {}
            if "word/styles.xml" in zf.namelist():
                for style in ET.fromstring(zf.read("word/styles.xml")).findall("w:style", NS):
                    name = style.find("w:name", NS)
                    styles[style.get(f"{{{NS['w']}}}styleId")] = name.get(f"{{{NS['w']}}}val", "") if name is not None else ""
            section = []
            body = root.find("w:body", NS)
            for i, element in enumerate(body, 1):
                kind = element.tag.rsplit("}", 1)[-1]
                if kind == "sectPr":
                    continue
                node = {"id": f"b{i:05d}", "kind": kind, "location": f"{part}/body/*[{i}]"}
                node.update(revision_state(element))
                if kind == "tbl":
                    node["rows"] = table_rows(element, node["id"])
                    node["text"] = "\n".join("\t".join(c["text"] for c in r) for r in node["rows"])
                else:
                    node["text"] = xml_text(element)
                    st = element.find("w:pPr/w:pStyle", NS)
                    node["style"] = styles.get(st.get(f"{{{NS['w']}}}val"), "") if st is not None else ""
                    if node["style"].lower().startswith("heading"):
                        section = [node["text"]]
                node["section"] = section[:]
                node["assets"] = media_refs(element, relationships, assets)
                nodes.append(node)
            extras = [n for n in zf.namelist() if n.startswith("word/") and n.endswith(".xml")
                      and (Path(n).name.startswith(("header", "footer")) or Path(n).name in ("footnotes.xml", "endnotes.xml", "comments.xml"))]
            for n in sorted(extras):
                ancillary = ET.fromstring(zf.read(n))
                nodes.append({"id": "part-" + Path(n).stem, "kind": "ancillary", "location": n,
                              "text": "\n".join(xml_text(p) for p in ancillary.findall(".//w:p", NS)),
                              **revision_state(ancillary)})
            changes = sum(n["source_text_state"] == "MIXED_REVISIONS_NOT_RESOLVED" for n in nodes)
            exceptions += ["DOCX page layout not rendered; cite XML body nodes and headings, not pages.",
                           "Numbering/field instructions and layout are not reconstructed; cached visible text is retained.",
                           f"Nodes with tracked editing markup: {changes}; source_text_state, revision_runs and deleted_text_fragments preserve unresolved revisions. Do not use their merged text as an accepted claim."]
        else:
            presentation = ET.fromstring(zf.read("ppt/presentation.xml"))
            pr = rels(zf, "ppt/presentation.xml")
            for slide_number, slide_ref in enumerate(presentation.findall("p:sldIdLst/p:sldId", NS), 1):
                part = pr[slide_ref.get(f"{{{NS['r']}}}id")]["target"]
                root = ET.fromstring(zf.read(part))
                relationships = rels(zf, part)
                for shape_number, shape in enumerate(root.findall("p:cSld/p:spTree/*", NS), 1):
                    node = {"id": f"s{slide_number:03d}-sh{shape_number:03d}", "kind": "slide_shape",
                            "slide": slide_number, "location": f"{part}/spTree/*[{shape_number}]",
                            "text": "\n".join(xml_text(p) for p in shape.findall(".//a:p", NS)),
                            "assets": media_refs(shape, relationships, assets)}
                    tables = []
                    for table in shape.findall(".//a:tbl", NS):
                        tables.append([["\n".join(xml_text(p) for p in c.findall(".//a:p", NS))
                                        for c in r.findall("a:tc", NS)] for r in table.findall("a:tr", NS)])
                    if tables:
                        node["tables"] = tables
                    nodes.append(node)
                for r in relationships.values():
                    if r["type"] == "notesSlide" and not r["external"]:
                        nr = ET.fromstring(zf.read(r["target"]))
                        nodes.append({"id": f"s{slide_number:03d}-notes", "kind": "slide_notes", "slide": slide_number,
                                      "location": r["target"], "text": "\n".join(xml_text(p) for p in nr.findall(".//a:p", NS))})
            exceptions += ["Slide shape order is XML order, not a verified visual or assistive-technology reading order.",
                           "Full slide layout, animations and master/layout text are not rendered or transcribed."]
        exceptions.append("Images preserved by exact bytes; embedded objects, SmartArt relationships and image text require separate visual review.")
    return nodes, list(assets.values()), exceptions


def extract_pdf(path, out, sid):
    import pymupdf
    nodes = []
    assets = {}
    exceptions = ["PDF text uses positional blocks; reading order and table cells require visual confirmation.",
                  "Table detection is heuristic; candidate grids are not fidelity-certified.",
                  "Vector diagrams and text inside raster images are not OCR-transcribed; inspect cited page renders."]
    with pymupdf.open(path) as doc:
        for page_index, page in enumerate(doc):
            pno = page_index + 1
            blocks = page.get_text("blocks", sort=True)
            for bi, block in enumerate(blocks, 1):
                if block[6] == 0:
                    nodes.append({"id": f"p{pno:03d}-b{bi:03d}", "kind": "pdf_text", "page": pno,
                                  "location": f"PDF page {pno}, block {bi}", "bbox": list(block[:4]), "text": block[4]})
            for ti, table in enumerate(page.find_tables().tables, 1):
                rows = table.extract()
                nodes.append({"id": f"p{pno:03d}-t{ti:03d}", "kind": "pdf_table_candidate", "page": pno,
                              "location": f"PDF page {pno}, detected table {ti}", "bbox": list(table.bbox),
                              "rows": rows, "text": "\n".join("\t".join(c or "" for c in row) for row in rows)})
            for item in page.get_images(full=True):
                xref = item[0]
                if xref in assets:
                    assets[xref]["pages"].append(pno)
                    continue
                data = doc.extract_image(xref)
                if not data:
                    continue
                sha = digest(data["image"])
                dest = out / "assets" / sid / (sha + "." + data["ext"])
                dest.parent.mkdir(parents=True, exist_ok=True)
                dest.write_bytes(data["image"])
                assets[xref] = {"xref": xref, "path": dest.relative_to(out).as_posix(), "sha256": sha,
                                "bytes": len(data["image"]), "pages": [pno], "review_state": "UNREVIEWED_VISUAL"}
        page_count = len(doc)
    return nodes, list(assets.values()), exceptions, page_count


def extract_all(source, out):
    if out.resolve() == source.resolve() or source.resolve().is_relative_to(out.resolve()):
        raise ValueError("Output must not overwrite the source directory")
    inventory_path = out / "inventory.json"
    if inventory_path.is_file():
        previous = json.loads(inventory_path.read_text(encoding="utf-8"))
        if any(not (source / item["path"]).is_file() for item in previous["originals"]):
            raise ValueError("Existing inventory includes missing original sources; refuse regeneration")
    originals, documents, seen = [], [], {}
    for path in sorted(source.iterdir(), key=lambda p: (len(p.name), p.name)):
        if path.suffix.lower() not in (".pdf", ".docx", ".pptx") or not path.is_file():
            continue
        data = path.read_bytes()
        sha = digest(data)
        sid = "sdd-" + sha[:16]
        record = {"path": path.name, "bytes": len(data), "sha256": sha, "document_id": sid,
                  "duplicate_of": seen.get(sha)}
        originals.append(record)
        if sha in seen:
            continue
        seen[sha] = path.name
        if path.suffix.lower() == ".pdf":
            nodes, assets, exceptions, pages = extract_pdf(path, out, sid)
        else:
            nodes, assets, exceptions = extract_ooxml(path, out, sid)
            pages = None
        document = {"schema_version": 1, "document_id": sid, "source_path": path.name,
                    "source_sha256": sha, "format": path.suffix[1:].lower(), "page_count": pages,
                    "extraction_state": "EXTRACTED_WITH_FIDELITY_EXCEPTIONS", "semantic_review": "PARTIAL_SEE_REVIEW_REGISTER",
                    "production_index_eligible": False, "nodes": nodes, "assets": assets, "exceptions": exceptions}
        write_json(out / "documents" / (sid + ".json"), document)
        reading = out / "reading" / (sid + ".md")
        reading.parent.mkdir(parents=True, exist_ok=True)
        reading.write_text(render_reading_copy(document), encoding="utf-8", newline="\n")
        documents.append({"document_id": sid, "source_path": path.name, "source_sha256": sha,
                          "document_path": f"documents/{sid}.json", "reading_path": f"reading/{sid}.md",
                          "node_count": len(nodes), "asset_count": len(assets), "page_count": pages})
    inventory = {"schema_version": 1, "original_count": len(originals), "unique_document_count": len(documents),
                 "originals": originals, "documents": documents,
                 "index_status": "PROVISIONAL_NOT_IN_PRODUCTION_SEARCH"}
    write_json(out / "inventory.json", inventory)
    return inventory


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=Path("SDD"))
    parser.add_argument("--out", type=Path, default=Path("SDD/derived"))
    args = parser.parse_args()
    result = extract_all(args.source, args.out)
    print(json.dumps({"originals": result["original_count"], "unique_documents": result["unique_document_count"]}))
