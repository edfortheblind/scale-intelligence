"""Offline exact-source documentation under the owner's publication authorization.

No database connection, routine execution, upload, or source normalization occurs.
The owner explicitly authorized the complete source in this repository, Git and
GitHub on 2026-10-08. Credentials and unrelated private inputs remain excluded.
"""
from __future__ import annotations

import argparse
from collections import Counter
import datetime as dt
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
from urllib.parse import unquote

ROOT = Path(__file__).resolve().parents[1]
SNAPSHOT_ID = "20260929T214106Z"
FOLDERS = {"P": "SP layout", "FN": "function layout", "IF": "function layout",
           "TF": "function layout", "U": "table layout"}


def read(path):
    return json.loads(path.read_text(encoding="utf-8-sig"))


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    content = text.encode("utf-8")
    if not path.exists() or path.read_bytes() != content:
        path.write_bytes(content)


def verify(root, snapshot, output_root):
    """Independent completeness, exact-byte, local-link and source-binding checks."""
    errors = []
    db = root / "DB Architecture"
    objects = read(db / "catalog/objects.json")
    modules = {r["object_id"]: r for r in read(snapshot / "modules.json")}
    bindings = {r["object_id"]: r for r in read(db / "catalog/modules.json")}
    manifest = read(snapshot / "manifest.json")
    verified_inputs = 0
    for item in manifest["queries"].values():
        if item["status"] == "CAPTURED":
            path = snapshot / item["file"]
            if not path.is_file() or sha(path) != item["sha256"]:
                errors.append("Snapshot file checksum mismatch: " + item["file"])
            verified_inputs += 1
    counts = Counter()
    exact_definitions = 0
    table_columns = 0
    metadata_rows_checked = 0
    metadata_names = ('tables', 'columns', 'identity_columns', 'computed_columns',
                      'indexes', 'index_columns', 'statistics', 'stat_columns',
                      'partitions', 'masked_columns', 'fulltext_indexes',
                      'fulltext_columns', 'external_tables')
    metadata = {name: read(snapshot / (name + '.json')) for name in metadata_names
                if manifest['queries'].get(name, {}).get('status') == 'CAPTURED'}
    parameters = read(snapshot / 'parameters.json')
    structural = {name: read(snapshot / (name + '.json')) for name in (
        'key_constraints', 'check_constraints', 'default_constraints', 'foreign_keys',
        'foreign_key_columns', 'triggers', 'trigger_events')}
    expected = {name: set() for name in set(FOLDERS.values())}
    for obj in objects:
        kind = obj["type"]
        if kind not in FOLDERS:
            continue
        oid = obj["object_id"]
        folder = FOLDERS[kind]
        expected[folder].add(str(oid))
        for extension in ("md", "json"):
            path = output_root / folder / f"{oid}.{extension}"
            if not path.is_file():
                errors.append(f"Missing {folder}/{oid}.{extension}")
        counts[kind] += 1
        if kind != "U":
            path = output_root / folder / f"{oid}.sql"
            definition = modules.get(oid, {}).get("definition")
            original = definition.encode("utf-8") if definition is not None else None
            if original is None or not path.is_file() or path.read_bytes() != original:
                errors.append(f"Exact source bytes mismatch: {oid}")
            elif sha(path) != bindings[oid]["source_definition_sha256"]:
                errors.append(f"Recorded source identity mismatch: {oid}")
            else:
                exact_definitions += 1
            record_path = output_root / folder / f'{oid}.json'
            if record_path.is_file():
                record = read(record_path)
                actual = [{k: v for k, v in p.items() if k != 'declared_type'} for p in record['parameters']]
                wanted = [p for p in parameters if p['object_id'] == oid and p['parameter_id'] > 0]
                if actual != wanted:
                    errors.append(f'Routine parameter metadata mismatch: {oid}')
                flags = {k: v for k, v in modules[oid].items() if k not in {'object_id', 'definition'}}
                if record['module_flags'] != flags:
                    errors.append(f'Routine module flags mismatch: {oid}')
                actual_return = [{k: v for k, v in p.items() if k != 'declared_type'}
                                 for p in record['return_metadata']['scalar_parameters']]
                if actual_return != [p for p in parameters if p['object_id'] == oid and p['parameter_id'] == 0]:
                    errors.append(f'Routine scalar return metadata mismatch: {oid}')
                actual_columns = [{k: v for k, v in p.items() if k != 'declared_type'}
                                  for p in record['return_metadata']['columns']]
                if actual_columns != [p for p in metadata['columns'] if p['object_id'] == oid]:
                    errors.append(f'Routine return columns mismatch: {oid}')
        else:
            record_path = output_root / folder / f'{oid}.json'
            if record_path.is_file():
                record = read(record_path)
                for name, rows in metadata.items():
                    wanted = [r for r in rows if r.get('object_id') == oid]
                    if record['raw_catalog_records'].get(name) != wanted:
                        errors.append(f'Table captured metadata mismatch: {oid}/{name}')
                    metadata_rows_checked += len(wanted)
                    if name == 'columns':
                        table_columns += len(wanted)
                raw = record['raw_catalog_records']
                default_ids = {p['default_object_id'] for p in raw['columns']} - {None, 0}
                expected_structural = {
                    'key_constraints': [r for r in structural['key_constraints'] if r['parent_object_id'] == oid],
                    'check_constraints': [r for r in structural['check_constraints'] if r['parent_object_id'] == oid],
                    'default_constraints': [r for r in structural['default_constraints'] if r['parent_object_id'] == oid or r['object_id'] in default_ids],
                    'foreign_keys': [r for r in structural['foreign_keys'] if oid in (r['parent_object_id'], r['referenced_object_id'])],
                    'triggers': [r for r in structural['triggers'] if r['parent_id'] == oid],
                }
                fk_ids = {r['object_id'] for r in expected_structural['foreign_keys']}
                trigger_ids = {r['object_id'] for r in expected_structural['triggers']}
                expected_structural['foreign_key_columns'] = [r for r in structural['foreign_key_columns'] if r['constraint_object_id'] in fk_ids]
                expected_structural['trigger_events'] = [r for r in structural['trigger_events'] if r['object_id'] in trigger_ids]
                for name, wanted in expected_structural.items():
                    if raw.get(name) != wanted:
                        errors.append(f'Table structural metadata mismatch: {oid}/{name}')
                    metadata_rows_checked += len(wanted)
    for folder, ids in expected.items():
        for extension in ("md", "json", "sql"):
            found = {p.stem for p in (output_root / folder).glob(f"*.{extension}")
                     if p.stem.isdigit()}
            wanted = set() if folder == "table layout" and extension == "sql" else ids
            if found != wanted:
                errors.append(f"Output identity set mismatch: {folder}/*.{extension}")
        folder_manifest = output_root / folder / 'manifest.json'
        if not folder_manifest.is_file():
            errors.append(f'Missing folder manifest: {folder}')
        else:
            report = read(folder_manifest)
            if report['snapshot_id'] != snapshot.name:
                errors.append(f'Folder manifest snapshot mismatch: {folder}')
            for artifact in report.get('files', []):
                path = output_root / artifact['path']
                if not path.is_file() or sha(path) != artifact['sha256'] or path.stat().st_size != artifact['bytes']:
                    errors.append('Exported artifact hash mismatch: ' + artifact['path'])
            for relative, digest in report.get('source_input_sha256', {}).items():
                path = root / relative
                if not path.is_file() or sha(path) != digest:
                    errors.append('Export source binding mismatch: ' + relative)
    links = 0
    # Generated prose only; fenced SQL/JSON is source evidence, not Markdown links.
    documents = [p for folder in expected for p in (output_root / folder).glob("*.md")]
    for path in documents:
        if not path.exists():
            errors.append("Missing index: " + path.name)
            continue
        body = re.sub(r"^(`{3,}|~{3,})[^\n]*\n.*?^\1\s*$", "",
                      path.read_text(encoding="utf-8"), flags=re.M | re.S)
        for target in re.findall(r"\]\(([^)]+)\)", body):
            if target.startswith(("http://", "https://", "#", "mailto:")):
                continue
            target = unquote(target.strip("<>").split("#")[0])
            if not (path.parent / target).exists():
                errors.append(f"Broken link in {path.name}: {target}")
            links += 1
    index_paths = [str(output_root / folder / "README.md") for folder in expected]
    ignored = subprocess.run(["git", "-C", str(root), "check-ignore", "--", *index_paths],
                             capture_output=True, text=True, check=False)
    if ignored.stdout.strip():
        errors.append("Owner-authorized programming layout indexes must not be Git-ignored")
    return {"status": "PASS" if not errors else "FAIL", "errors": errors,
            "snapshot_id": snapshot.name, "source_files_hash_checked": verified_inputs,
            "routine_definitions_byte_equal": exact_definitions,
            "procedures": counts["P"], "functions": counts["FN"] + counts["IF"] + counts["TF"],
            "tables": counts["U"], "table_columns_verified": table_columns,
            "captured_table_metadata_rows_verified": metadata_rows_checked,
            "local_links_checked": links,
            "application_rows_read": False, "database_connected": False,
            "routines_executed": False}


def main():
    private = Path(os.environ.get("LOCALAPPDATA", str(Path.home()))) / "TAB/SCALE-Intelligence/private"
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=ROOT)
    parser.add_argument("--snapshot", type=Path, default=private / "db-assessment" / SNAPSHOT_ID)
    parser.add_argument("--output-root", type=Path)
    parser.add_argument("--verify-only", action="store_true")
    args = parser.parse_args()
    root, snapshot = args.root.resolve(), args.snapshot.resolve()
    out = (args.output_root or root / 'DB Architecture').resolve()
    if out == snapshot or out.is_relative_to(snapshot):
        raise SystemExit("Exact-source output must not modify the original snapshot.")
    receipt_dir = out / 'evidence'
    if not args.verify_only:
        from build_routine_layouts import build as build_routines
        from build_table_layouts import build as build_tables
        from report_table_usage import build_report
        correlation = build_report(root, private_modules=snapshot / 'modules.json', require_complete_contracts=True)
        write(root / 'DB Architecture/evidence/programming-layout-table-usage.json', json.dumps(correlation, indent=2, ensure_ascii=False) + '\n')
        routine_summary = build_routines(root, snapshot, out, allow_workspace_local=True)
        table_summary = build_tables(root, snapshot, out, allow_workspace_local=True)
        write(receipt_dir / "programming-layout-build-summary.json", json.dumps({"routines": routine_summary, "tables": table_summary}, indent=2) + "\n")
    result = verify(root, snapshot, out)
    if result["status"] == "PASS":
        files = [{"path": p.relative_to(out).as_posix(), "bytes": p.stat().st_size, "sha256": sha(p)}
                 for p in sorted(p for folder in set(FOLDERS.values()) for p in (out / folder).rglob('*')) if p.is_file()]
        write(receipt_dir / "programming-layout-manifest.json", json.dumps(files, indent=2) + "\n")
        result["output_files"] = len(files)
        result["output_manifest_sha256"] = sha(receipt_dir / "programming-layout-manifest.json")
    result["verified_at"] = dt.datetime.now(dt.timezone.utc).isoformat()
    write(receipt_dir / "programming-layout-verification.json", json.dumps(result, indent=2) + "\n")
    print(json.dumps(result, indent=2))
    return 0 if result["status"] == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
