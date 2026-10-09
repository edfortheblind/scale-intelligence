"""Export exact captured routine bodies and source-bound programming documentation.

Offline only. The default rejects output inside the repository; the explicit
workspace option supports the owner's 2026-10-08 authorization to place exact SQL
in this repository, Git and GitHub. Existing source inputs are never changed.
"""
from __future__ import annotations

import argparse
from collections import Counter, defaultdict
import hashlib
import html
import json
import os
from pathlib import Path
import re
import tempfile
from urllib.parse import quote

from programming_layout_mentions import comment_mentions

ROOT = Path(__file__).resolve().parents[1]
SNAPSHOT_ID = "20260929T214106Z"
USAGE_RELATIVE = "DB Architecture/evidence/programming-layout-table-usage.json"
EXPECTED_COUNTS = {"P": 921, "FN": 66, "IF": 1, "TF": 9}
FOLDERS = {"P": "SP layout", "FN": "function layout", "IF": "function layout", "TF": "function layout"}
TYPE_NAMES = {"P": "Stored procedure", "FN": "Scalar function", "IF": "Inline table-valued function", "TF": "Table-valued function"}
BOUNDARY = (
    "This is the retained 2026-09-29 replica capture, not a new database inspection. "
    "The .sql file is the complete captured sys.sql_modules.definition encoded as UTF-8, "
    "including original comments, literals and line endings; nothing is prepended or reformatted. "
    "Captured definition text is not a complete deployment script: permissions, SET options, "
    "session context and dependencies are separate. No routine was executed. "
    "Static references do not establish branch execution, current use or runtime table scans. "
    "Vendor-base versus customer customization ownership is not established by names or comments."
)


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def read_json(path: Path):
    return json.loads(path.read_text(encoding="utf-8"))


def json_bytes(value) -> bytes:
    return (json.dumps(value, ensure_ascii=False, indent=2) + "\n").encode("utf-8")


def markdown_bytes(value: str) -> bytes:
    """Normalize authored presentation whitespace without touching source data."""
    lines = [line.expandtabs(4).rstrip() for line in value.splitlines()]
    return ("\n".join(lines).rstrip() + "\n").encode("utf-8")


def checked_path(base: Path, relative: str) -> Path:
    path = (base / relative).resolve()
    if not path.is_relative_to(base.resolve()):
        raise ValueError("Source path leaves its declared source root")
    return path


def verify_hash(path: Path, expected: str, label: str):
    if not path.is_file() or sha(path.read_bytes()) != expected:
        raise ValueError(f"Source integrity failure: {label}")


def by_id(rows, field="object_id"):
    result = {row[field]: row for row in rows}
    if len(result) != len(rows):
        raise ValueError(f"Duplicate identity in {field} catalog")
    return result


def group(rows, field):
    result = defaultdict(list)
    for row in rows:
        result[row[field]].append(row)
    return result


def type_text(row):
    """SQL Server max_length is bytes; nchar/nvarchar declarations use pairs."""
    name, schema = row["type_name"], row.get("type_schema", "sys")
    if schema != "sys":
        return f"[{schema}].[{name}]"
    if name in {"varchar", "char", "varbinary", "binary", "nvarchar", "nchar"}:
        length = row["max_length"]
        size = "max" if length == -1 else length // 2 if name.startswith("n") else length
        return f"{name}({size})"
    if name in {"decimal", "numeric"}:
        return f"{name}({row['precision']},{row['scale']})"
    if name in {"time", "datetime2", "datetimeoffset"}:
        return f"{name}({row['scale']})"
    if name == "float":
        return f"float({row['precision']})"
    return name


def md(value):
    if value is None:
        return "Not recorded"
    if isinstance(value, bool):
        return "Yes" if value else "No"
    return str(value).replace("|", "\\|").replace("\r", "").replace("\n", "<br>")


def table(headers, rows):
    rows = list(rows)
    if not rows:
        return "None captured.\n\n"
    return "| " + " | ".join(headers) + " |\n| " + " | ".join("---" for _ in headers) + " |\n" + "".join("| " + " | ".join(md(v) for v in row) + " |\n" for row in rows) + "\n"


def link_to(path: Path, folder: Path) -> str:
    try:
        return quote(Path(os.path.relpath(path, folder)).as_posix(), safe="/.:_-~")
    except ValueError:
        return path.as_uri()


def literal_markdown(value):
    """Display captured strings as text, never as source-authored markup."""
    # Escape HTML/entity syntax and Markdown punctuation independently. SQL's
    # [schema].[routine](...) must not become a Markdown link, and source HTML,
    # backticks, headings, images or emphasis must remain visible literal text.
    escaped = re.sub(r"([\\`*_{}\[\]()#+.!|~=-])", r"\\\1", str(value))
    return html.escape(escaped, quote=False)


def render_value(value, depth=0):
    """Preserve contract wording while escaping source-authored Markdown/HTML."""
    if isinstance(value, str):
        return literal_markdown(value) + "\n\n"
    if isinstance(value, dict):
        output = []
        for key, item in value.items():
            output.append("**" + literal_markdown(key.replace("_", " ")) + "**\n\n" + render_value(item, depth + 1))
        return "".join(output) if output else "None recorded.\n\n"
    if isinstance(value, list):
        if not value:
            return "None recorded.\n\n"
        if all(isinstance(item, (str, int, float, bool)) for item in value):
            return "".join("- " + literal_markdown(item).replace("\n", "\n  ") + "\n" for item in value) + "\n"
        return "".join(f"**Entry {index + 1}**\n\n" + render_value(item, depth + 1) for index, item in enumerate(value))
    return ("null" if value is None else str(value).lower() if isinstance(value, bool) else str(value)) + "\n\n"


def collect_refs(usage):
    """Invert the existing correlation without inventing new access credit."""
    result = defaultdict(lambda: {"direct_or_reviewed": [], "possible_indirect": [], "mentions_only": []})
    for entry in usage["tables"]:
        basic = {"table_id": entry["object_id"], "qualified_name": entry["qualified_name"],
                 "layout_path": f"../table layout/{entry['object_id']}.md"}
        direct = set(entry["primary_routine_direct_ids"])
        for evidence in entry["reference_evidence"]:
            if evidence["module_type"] in FOLDERS:
                result[evidence["module_id"]]["direct_or_reviewed"].append({**basic,
                    "classification": "DIRECT_CAPTURED_STATIC_REFERENCE" if evidence["module_id"] in direct else "REVIEWED_EFFECT_SCOPE_AS_RECORDED",
                    "confidence_boundary": "Catalog binding / bounded lexical evidence / reviewed effect scope are retained separately; execution is unverified.",
                    "evidence": evidence})
        context = entry["module_path_context"]
        for oid in context["primary_indirect_module_ids"]:
            result[oid]["possible_indirect"].append({**basic,
                "classification": "POSSIBLE_STATIC_DELEGATION_NOT_EXECUTION",
                "path_examples": [p for p in context["shortest_path_examples"] if p["module_ids"][0] == oid],
                "limits": context["limits"]})
        for category, observations in entry["non_credit_observations"].items():
            for observation in observations:
                result[observation["module_id"]]["mentions_only"].append({**basic,
                    "classification": "MENTION_OR_UNRESOLVED_CANDIDATE_ONLY_NOT_ACCESS_CREDIT",
                    "category": category, "observation": observation})
    return result


def load_verified(root: Path, snapshot: Path):
    """Validate the entire retained source chain before opening any output file."""
    if snapshot.name != SNAPSHOT_ID:
        raise ValueError("This exporter requires the documented 20260929T214106Z snapshot")
    manifest = read_json(snapshot / "manifest.json")
    if manifest.get("status") != "CAPTURE_FINISHED" or manifest.get("application_rows_read") is not False or manifest.get("routines_executed") is not False:
        raise ValueError("Unexpected capture provenance")
    captured = {}
    for name, entry in manifest["queries"].items():
        if entry["status"] == "CAPTURED":
            path = checked_path(snapshot, entry["file"])
            verify_hash(path, entry["sha256"], "snapshot " + name)
            rows = read_json(path)
            if not isinstance(rows, list) or len(rows) != entry["rows"]:
                raise ValueError("Snapshot row-count mismatch: " + name)
            captured[name] = rows
    for name in ("objects", "objects_at_end", "modules", "parameters", "columns", "dependencies"):
        if name not in captured:
            raise ValueError("Required source unavailable: " + name)
    if captured["objects"] != captured["objects_at_end"]:
        raise ValueError("Captured object catalog was not stable")
    db = root / "DB Architecture"
    summary = read_json(db / "evidence/summary.json")
    usage = read_json(root / USAGE_RELATIVE)
    if summary["snapshot_id"] != SNAPSHOT_ID or usage["snapshot_id"] != SNAPSHOT_ID:
        raise ValueError("Snapshot identity mismatch in repository evidence")
    for path, expected in usage["input_sha256"].items():
        verify_hash(checked_path(root, path), expected, path)
    observation = usage["private_original_observation"]
    if observation.get("loaded") is not True or observation["captured_original_file_sha256"] != manifest["queries"]["modules"]["sha256"]:
        raise ValueError("Private original provenance mismatch")
    objects = by_id(read_json(db / "catalog/objects.json"))
    originals = by_id(captured["objects"])
    if set(objects) != set(originals):
        raise ValueError("Object catalog identities differ")
    for oid, obj in objects.items():
        if any(obj[key].strip() != originals[oid][key].strip() for key in ("schema_name", "name", "type")):
            raise ValueError(f"Object identity differs: {oid}")
    modules = by_id(captured["modules"])
    public_modules = by_id(read_json(db / "catalog/modules.json"))
    if set(modules) != set(public_modules):
        raise ValueError("Module catalog identities differ")
    for oid, module in modules.items():
        definition = module.get("definition")
        if not isinstance(definition, str) or not definition:
            raise ValueError(f"Module definition unavailable: {oid}")
        if sha(definition.encode("utf-8")) != public_modules[oid]["source_definition_sha256"]:
            raise ValueError(f"Original definition hash mismatch: {oid}")
        reading = usage["module_sources"][str(oid)]
        if reading["source_definition_sha256"] != public_modules[oid]["source_definition_sha256"]:
            raise ValueError(f"Usage module fingerprint mismatch: {oid}")
        verify_hash(checked_path(root, reading["reading_path"]), reading["reading_sha256"], f"module reading {oid}")
    routines = {oid: obj for oid, obj in objects.items() if obj["type"] in FOLDERS}
    if dict(Counter(obj["type"] for obj in routines.values())) != EXPECTED_COUNTS:
        raise ValueError("Routine counts differ from documented capture")
    if set(routines) - set(modules):
        raise ValueError("Routine body missing from capture")
    contracts = {}
    for binding in usage["semantic_batch_bindings"]:
        path = checked_path(root, binding["path"])
        verify_hash(path, binding["sha256"], binding["path"])
        batch = read_json(path)
        if batch["snapshot_id"] != SNAPSHOT_ID:
            raise ValueError("Reviewed contract snapshot mismatch")
        for index, contract in enumerate(batch["semantic_contracts"]):
            oid = contract["object_id"]
            if oid not in routines or oid not in binding["module_ids"]:
                continue
            if oid in contracts or contract.get("snapshot_id") != SNAPSHOT_ID or contract["source_definition_sha256"] != public_modules[oid]["source_definition_sha256"]:
                raise ValueError(f"Reviewed contract identity mismatch: {oid}")
            contracts[oid] = {"source_path": binding["path"], "source_sha256": binding["sha256"],
                "json_pointer": f"/semantic_contracts/{index}", "batch_review_state": batch.get("review_state", "NOT_RECORDED_AT_BATCH_LEVEL"),
                "contract": contract, "evidence_sources": batch.get("sources", {}),
                "global_limits": batch.get("global_limits", [])}
    if set(contracts) != set(routines):
        raise ValueError("A routine is missing its retained reviewed contract")
    return manifest, captured, objects, modules, public_modules, usage, contracts, routines


def evidence_source_ids(value):
    result = set()
    if isinstance(value, dict):
        for key, child in value.items():
            if key == "evidence_refs" and isinstance(child, list):
                result.update(child)
            else:
                result.update(evidence_source_ids(child))
    elif isinstance(value, list):
        for child in value:
            result.update(evidence_source_ids(child))
    return result


def output_guard(root: Path, output_root: Path, paths, allow_workspace_local=False):
    if output_root.is_relative_to(root):
        if not allow_workspace_local:
            raise ValueError("Exact SQL output inside the repository requires explicit --allow-workspace-local")
    for path in paths:
        if path.is_symlink() or not path.resolve().is_relative_to(output_root):
            raise ValueError("Output destination resolves outside its selected root")
    for folder in set(FOLDERS.values()):
        target = output_root / folder
        if target.exists():
            allowed = {p.name for p in paths if p.parent == target}
            if any(p.name not in allowed or not p.is_file() for p in target.iterdir()):
                raise ValueError("Output contains unrecognized/stale files; choose a clean output root")


def write_atomic(path: Path, content: bytes):
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.exists() and path.read_bytes() == content:
        return
    handle, name = tempfile.mkstemp(prefix=".pending-", dir=path.parent)
    try:
        with os.fdopen(handle, "wb") as stream:
            stream.write(content)
        os.replace(name, path)
    finally:
        if os.path.exists(name):
            os.unlink(name)


def routine_doc(record, root, folder):
    obj, oid = record["identity"], record["identity"]["object_id"]
    text = f"# {obj['qualified_name']}\n\n{TYPE_NAMES[obj['type']]}; object ID `{oid}`.\n\n"
    text += f"[Complete as-is SQL]({oid}.sql) · [Structured documentation]({oid}.json) · [Index](README.md)\n\n"
    text += BOUNDARY + "\n\n"
    text += f"Snapshot `{record['snapshot_id']}`; original-definition SHA-256 `{record['source_definition_sha256']}`.\n\n"
    text += "## Identity and module options\n\n" + table(["Property", "Captured value"], obj.items())
    text += table(["Module option", "Captured value"], record["module_flags"].items())
    text += "## Parameters\n\n" + table(["ID", "Name", "Declared type", "Direction", "Read-only", "Bytes", "Catalog default flag"],
        ((p["parameter_id"], p["name"], p["declared_type"], "INPUT/OUTPUT" if p.get("is_output") else "INPUT", p.get("is_readonly"), p["max_length"], p.get("has_default_value")) for p in record["parameters"]))
    text += "T-SQL declaration defaults and validation rules remain in the exact SQL and reviewed contract. A false catalog default flag does not prove that no declaration default exists. Character declaration lengths are converted from captured bytes for nchar/nvarchar; alias types retain their schema-qualified names.\n\n"
    text += "## Return metadata\n\n"
    returns = record["return_metadata"]
    if returns["kind"] == "SCALAR":
        text += table(["Type", "Bytes", "Precision", "Scale"], ((p["declared_type"], p["max_length"], p["precision"], p["scale"]) for p in returns["scalar_parameters"]))
    elif returns["kind"] == "TABLE":
        text += table(["Ordinal", "Name", "Type", "Nullable", "Collation"], ((c["column_id"], c["name"], c["declared_type"], c["is_nullable"], c["collation_name"]) for c in returns["columns"]))
    else:
        text += "Procedure rowsets, OUTPUT values and explicit RETURN behavior are described in the retained contract below. Captured parameter metadata is not a result-set schema.\n\n"
    text += "## Tables referenced by this routine\n\n"
    for label, key in (("Direct references and reviewed effects", "direct_or_reviewed"), ("Possible delegated table access", "possible_indirect"), ("Mentions and unresolved candidates only", "mentions_only")):
        text += "### " + label + "\n\n"
        text += table(["Table layout", "Evidence class", "Evidence detail"], (
            (f"[{r['qualified_name']}]({quote(r['layout_path'], safe='/._-')})", r["classification"],
             ", ".join(r.get("evidence", {}).get("channels", [])) or r.get("category") or "Static path membership; see structured documentation for retained path examples")
            for r in record["table_references"][key]))
    text += "Evidence details, relation line coordinates, reviewed-effect scope, and paths are retained in the companion JSON. Token or string mentions receive no executed-access credit; indirect paths remain possibilities. Source line coordinates retain their original/redacted coordinate-system labels.\n\n"
    text += "## Captured dependencies\n\n"
    text += table(["Target", "Target ID", "Target column ID", "Caller dependent", "Ambiguous", "Database"], (
        (d.get("target_qualified_name") or ".".join(str(d.get(k)) for k in ("referenced_schema_name", "referenced_entity_name") if d.get(k)), d.get("referenced_id"), d.get("referenced_minor_id"), d.get("is_caller_dependent"), d.get("is_ambiguous"), d.get("referenced_database_name"))
        for d in record["dependencies"]))
    text += "Null target IDs remain unresolved; matching a name alone does not establish local identity.\n\n"
    text += "## Retained reviewed logic contract\n\n"
    binding = record["reviewed_contract"]
    text += f"Source: [{binding['source_path']}]({link_to(root / binding['source_path'], folder)}), JSON pointer `{binding['json_pointer']}`, SHA-256 `{binding['source_sha256']}`.\n\n"
    text += "The following fields reproduce the existing review, including its limitations and review status. This export adds exact source access and does not claim a new semantic or runtime review.\n\n"
    for key, value in binding["contract"].items():
        text += "### " + key.replace("_", " ").capitalize() + "\n\n" + render_value(value)
    text += "## Reviewed evidence sources\n\n"
    for source_id, source in binding["evidence_sources"].items():
        text += f"### {source_id}\n\n"
        for key in ("reading_path", "path", "json_path"):
            if source.get(key):
                text += f"[{source[key]}]({link_to(root / source[key], folder)})\n\n"
        text += render_value(source)
    text += "## Dynamic SQL and unresolved scope\n\n" + render_value(record["unresolved_and_dynamic"])
    text += "## Capture and interpretation limits\n\n" + render_value(record["limitations"])
    return text


def build(root: Path, snapshot: Path, output_root: Path, *, allow_workspace_local=False) -> dict:
    root, snapshot, output_root = root.resolve(), snapshot.resolve(), output_root.resolve()
    if output_root == snapshot or output_root.is_relative_to(snapshot) or snapshot.is_relative_to(output_root):
        raise ValueError("Output must be separate from the source snapshot")
    manifest, captured, objects, modules, public_modules, usage, contracts, routines = load_verified(root, snapshot)
    parameters, columns = group(captured["parameters"], "object_id"), group(captured["columns"], "object_id")
    dependencies = group(captured["dependencies"], "referencing_id")
    refs = collect_refs(usage)
    for table_id, observations in comment_mentions(list(objects.values()), list(modules.values())).items():
        for observation in observations:
            refs[observation["module_id"]]["mentions_only"].append({"table_id": table_id,
                "qualified_name": objects[table_id]["qualified_name"], "layout_path": f"../table layout/{table_id}.md",
                "classification": "COMMENT_IDENTIFIER_MENTION_NOT_ACCESS_CREDIT", "category": "original_comment_mentions",
                "observation": observation})
    artifacts, indexes = {}, defaultdict(list)
    source_hashes = {USAGE_RELATIVE: sha((root / USAGE_RELATIVE).read_bytes()),
                     **usage["input_sha256"]}
    total_bytes = 0
    for oid, obj in sorted(routines.items(), key=lambda item: (item[1]["qualified_name"].casefold(), item[0])):
        folder = output_root / FOLDERS[obj["type"]]
        original = modules[oid]["definition"].encode("utf-8")
        total_bytes += len(original)
        params = [{**p, "declared_type": type_text(p)} for p in sorted(parameters[oid], key=lambda p: p["parameter_id"])]
        return_metadata = {"kind": "SCALAR" if obj["type"] == "FN" else "TABLE" if obj["type"] in {"IF", "TF"} else "PROCEDURE_CONTRACT",
            "scalar_parameters": [p for p in params if p["parameter_id"] == 0],
            "columns": [{**c, "declared_type": type_text(c)} for c in sorted(columns[oid], key=lambda c: c["column_id"])]}
        binding = dict(contracts[oid])
        source_ids = evidence_source_ids(binding["contract"])
        binding["evidence_sources"] = {key: value for key, value in binding["evidence_sources"].items() if key in source_ids}
        record = {"schema_version": 1, "artifact_kind": "AS_IS_ROUTINE_LAYOUT", "snapshot_id": SNAPSHOT_ID,
            "capture_started_at": manifest["started_at"], "capture_finished_at": manifest["finished_at"],
            "identity": obj, "source_definition_sha256": public_modules[oid]["source_definition_sha256"],
            "exact_sql_path": f"{oid}.sql", "encoding": "UTF-8", "sql_bytes": len(original),
            "module_flags": {key: value for key, value in modules[oid].items() if key not in {"object_id", "definition"}},
            "static_features": public_modules[oid].get("static_features", {}),
            "parameters": [p for p in params if p["parameter_id"] > 0], "return_metadata": return_metadata,
            "table_references": refs[oid], "dependencies": [{**d, "target_qualified_name": objects.get(d.get("referenced_id"), {}).get("qualified_name")} for d in dependencies[oid]],
            "reviewed_contract": binding,
            "unresolved_and_dynamic": {"captured_module_observation": usage["module_sources"][str(oid)],
                "dynamic_review_bindings": [r for r in usage["dynamic_review_bindings"] if r["module_id"] == oid],
                "unresolved_catalog_dependencies": [r for r in usage["unresolved_catalog_dependencies"] if r["module_id"] == oid],
                "unresolved_semantic_effects": [r for r in usage["unresolved_semantic_effects"] if r["module_id"] == oid],
                "cross_source_discrepancies": [r for r in usage["cross_source_discrepancies"] if r["module_id"] == oid]},
            "definition_ownership": "NOT_ESTABLISHED", "operational_execution_verified": False,
            "limitations": [BOUNDARY, *usage["limitations"], *binding["global_limits"]]}
        artifacts[folder / f"{oid}.sql"] = original
        artifacts[folder / f"{oid}.json"] = json_bytes(record)
        artifacts[folder / f"{oid}.md"] = markdown_bytes(routine_doc(record, root, folder))
        indexes[FOLDERS[obj["type"]]].append({"object_id": oid, "qualified_name": obj["qualified_name"], "type": obj["type"], "source_definition_sha256": record["source_definition_sha256"], "bytes": len(original)})
    for name, entries in indexes.items():
        folder = output_root / name
        text = f"# SCALE {name}\n\n{len(entries)} complete routine definitions from snapshot `{SNAPSHOT_ID}` (2026-09-29).\n\n"
        text += BOUNDARY + "\n\nOn 2026-10-08 the owner explicitly authorized these complete source exports in this repository, Git and GitHub, including public source publication. The captured originals remain unchanged. These files document source; no database execution occurred.\n\n"
        text += "Every original definition was checked against the retained module catalog fingerprint before export. Each routine has a byte-preserving .sql file, a programming reference .md file, and a .json record containing complete retained metadata and reviewed contract fields.\n\n"
        text += "[Capture and hash manifest](manifest.json) · [Table layouts](../table%20layout/README.md)\n\n"
        text += table(["Routine", "Type", "As-is SQL", "Structured record", "UTF-8 bytes"], ((f"[{e['qualified_name']}]({e['object_id']}.md)", TYPE_NAMES[e["type"]], f"[SQL]({e['object_id']}.sql)", f"[JSON]({e['object_id']}.json)", e["bytes"]) for e in entries))
        text += "## Interpretation limits\n\n" + render_value(usage["limitations"])
        artifacts[folder / "README.md"] = markdown_bytes(text)
        artifacts[folder / "manifest.json"] = json_bytes({"schema_version": 1, "artifact_kind": "AS_IS_ROUTINE_EXPORT", "snapshot_id": SNAPSHOT_ID,
            "capture_started_at": manifest["started_at"], "capture_finished_at": manifest["finished_at"], "routine_count": len(entries),
            "counts_by_type": dict(Counter(e["type"] for e in entries)), "snapshot_manifest_sha256": sha((snapshot / "manifest.json").read_bytes()),
            "snapshot_modules_sha256": manifest["queries"]["modules"]["sha256"], "source_input_sha256": source_hashes,
            "routines": entries, "limitations": [BOUNDARY, *usage["limitations"]]})
    output_guard(root, output_root, artifacts, allow_workspace_local)
    for path, content in artifacts.items():
        write_atomic(path, content)
    return {"stored_procedures": len(indexes["SP layout"]), "functions": len(indexes["function layout"]),
            "exact_sql_files": len(routines), "routine_documents": len(routines), "routine_json_records": len(routines),
            "indexes": len(indexes), "manifests": len(indexes), "sql_bytes": total_bytes}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--snapshot", type=Path, required=True)
    parser.add_argument("--output-root", type=Path, required=True)
    parser.add_argument("--root", type=Path, default=ROOT)
    parser.add_argument("--allow-workspace-local", action="store_true")
    args = parser.parse_args()
    print(json.dumps(build(args.root, args.snapshot, args.output_root, allow_workspace_local=args.allow_workspace_local), sort_keys=True))


if __name__ == "__main__":
    main()
