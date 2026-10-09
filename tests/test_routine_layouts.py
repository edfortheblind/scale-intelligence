"""Exact-source export, provenance failure, and SQL Server type interpretation."""
from pathlib import Path
import json
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))
import build_routine_layouts as layouts


def fixture(base):
    root, snapshot, output = base / "repo", base / layouts.SNAPSHOT_ID, base / "out"
    db = root / "DB Architecture"
    snapshot.mkdir(parents=True)
    def save(path, value):
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(layouts.json_bytes(value))
        return layouts.sha(path.read_bytes())
    objects = [{"object_id": oid, "schema_name": "dbo", "name": name, "qualified_name": "dbo." + name, "type": kind}
        for oid, name, kind in ((1, "ReadItem", "P"), (2, "fn_Name", "FN"), (3, "fn_Items", "TF"), (10, "ITEM", "U"))]
    modules = [{"object_id": oid, "definition": sql, "uses_quoted_identifier": True, "uses_ansi_nulls": True}
        for oid, sql in ((1, "-- ITEM original comment\r\nCREATE PROC dbo.ReadItem AS SELECT N'caf\u00e9' FROM dbo.ITEM;\r\n"),
                         (2, "CREATE FUNCTION dbo.fn_Name() RETURNS nvarchar(3) AS BEGIN RETURN N'caf\u00e9' END\n"),
                         (3, "CREATE FUNCTION dbo.fn_Items() RETURNS @r TABLE (name nvarchar(8)) AS BEGIN RETURN END"))]
    parameter = {"object_id": 2, "parameter_id": 0, "name": "", "type_schema": "sys", "type_name": "nvarchar", "max_length": 6,
                 "precision": 0, "scale": 0, "is_output": True, "is_readonly": False, "has_default_value": False}
    column = {"object_id": 3, "column_id": 1, "name": "name", "type_schema": "sys", "type_name": "nvarchar", "max_length": 16,
              "precision": 0, "scale": 0, "is_nullable": True, "collation_name": "Test_Collation"}
    manifest = {"status": "CAPTURE_FINISHED", "application_rows_read": False, "routines_executed": False,
                "started_at": "2026-09-29T21:41:06Z", "finished_at": "2026-09-29T21:42:11Z", "queries": {}}
    for name, rows in {"objects": objects, "objects_at_end": objects, "modules": modules, "parameters": [parameter], "columns": [column], "dependencies": []}.items():
        fingerprint = save(snapshot / (name + ".json"), rows)
        manifest["queries"][name] = {"status": "CAPTURED", "file": name + ".json", "sha256": fingerprint, "rows": len(rows)}
    save(snapshot / "manifest.json", manifest)
    source_inputs = {}
    public_modules, module_sources, contracts = [], {}, []
    for module in modules:
        oid = module["object_id"]
        fingerprint = layouts.sha(module["definition"].encode("utf-8"))
        reading = db / f"sql/{oid}.sql"
        reading.parent.mkdir(parents=True, exist_ok=True)
        reading.write_bytes(b"-- retained reading\n")
        public_modules.append({"object_id": oid, "source_definition_sha256": fingerprint, "static_features": {}})
        module_sources[str(oid)] = {"reading_path": reading.relative_to(root).as_posix(), "reading_sha256": layouts.sha(reading.read_bytes()), "source_definition_sha256": fingerprint}
        contracts.append({"object_id": oid, "snapshot_id": layouts.SNAPSHOT_ID, "source_definition_sha256": fingerprint, "purpose": "Retained purpose verbatim."})
    for path, value in (("evidence/summary.json", {"snapshot_id": layouts.SNAPSHOT_ID}), ("catalog/objects.json", objects),
                        ("catalog/modules.json", public_modules), ("catalog/dependencies.json", [])):
        source_inputs["DB Architecture/" + path] = save(db / path, value)
    batch_path = "DB Architecture/mappings/batches/fixture.json"
    batch_hash = save(root / batch_path, {"snapshot_id": layouts.SNAPSHOT_ID, "review_state": "STATIC_BOUNDED", "semantic_contracts": contracts})
    source_inputs[batch_path] = batch_hash
    usage = {"snapshot_id": layouts.SNAPSHOT_ID, "input_sha256": source_inputs,
             "private_original_observation": {"loaded": True, "captured_original_file_sha256": manifest["queries"]["modules"]["sha256"]},
             "module_sources": module_sources, "semantic_batch_bindings": [{"path": batch_path, "sha256": batch_hash, "module_ids": [1, 2, 3]}],
             "tables": [], "limitations": [], "dynamic_review_bindings": [], "unresolved_catalog_dependencies": [], "unresolved_semantic_effects": [], "cross_source_discrepancies": []}
    save(root / layouts.USAGE_RELATIVE, usage)
    return root, snapshot, output, modules


class RoutineLayoutsTests(unittest.TestCase):
    def test_authored_markdown_has_clean_whitespace_and_one_eof_newline(self):
        source = "# Heading  \r\n\r\n  \tSQL excerpt\t  \r\n\tchild\t\r\n\r\n \t\r\n"
        cleaned = layouts.markdown_bytes(source)
        self.assertEqual(cleaned, b"# Heading\n\n    SQL excerpt\n    child\n")
        self.assertNotIn(b"\t", cleaned)
        self.assertNotIn(b"\r", cleaned)
        self.assertFalse(cleaned.endswith(b"\n\n"))
        self.assertTrue(all(line == line.rstrip() for line in cleaned.splitlines()))

    def test_type_lengths_and_schema(self):
        row = {"type_schema": "sys", "type_name": "nvarchar", "max_length": 50, "precision": 19, "scale": 5}
        self.assertEqual(layouts.type_text(row), "nvarchar(25)")
        self.assertEqual(layouts.type_text({**row, "max_length": -1}), "nvarchar(max)")
        self.assertEqual(layouts.type_text({**row, "type_name": "varbinary"}), "varbinary(50)")
        self.assertEqual(layouts.type_text({**row, "type_name": "numeric"}), "numeric(19,5)")
        self.assertEqual(layouts.type_text({**row, "type_name": "datetime2", "scale": 7}), "datetime2(7)")
        self.assertEqual(layouts.type_text({**row, "type_schema": "dbo", "type_name": "Label"}), "[dbo].[Label]")

    def test_exact_bytes_function_returns_and_original_comments(self):
        with tempfile.TemporaryDirectory() as temp:
            root, snapshot, out, modules = fixture(Path(temp))
            with patch.object(layouts, "EXPECTED_COUNTS", {"P": 1, "FN": 1, "TF": 1}):
                result = layouts.build(root, snapshot, out)
            self.assertEqual(result["exact_sql_files"], 3)
            for module in modules:
                folder = "SP layout" if module["object_id"] == 1 else "function layout"
                self.assertEqual((out / folder / f"{module['object_id']}.sql").read_bytes(), module["definition"].encode("utf-8"))
            scalar = json.loads((out / "function layout/2.json").read_text())
            self.assertEqual(scalar["parameters"], [])
            self.assertEqual(scalar["return_metadata"]["scalar_parameters"][0]["declared_type"], "nvarchar(3)")
            tabular = json.loads((out / "function layout/3.json").read_text())
            self.assertEqual(tabular["return_metadata"]["columns"][0]["declared_type"], "nvarchar(8)")
            proc = json.loads((out / "SP layout/1.json").read_text())
            self.assertEqual(proc["table_references"]["mentions_only"][0]["table_id"], 10)
            self.assertFalse(proc["table_references"]["mentions_only"][0]["observation"]["counts_as_routine_reference"])
            self.assertIn("Retained purpose verbatim", (out / "SP layout/1.md").read_text())
            self.assertEqual(proc["reviewed_contract"]["contract"]["purpose"], "Retained purpose verbatim.")

    def test_contract_markup_is_literal_while_authored_links_remain_links(self):
        source = "CREATE FUNCTION [dbo].[p]( @x nvarchar(2)) AS SELECT '<script>x</script>', '[label](missing.sql)', '&copy;', '`code`', '**bold**'"
        rendered = layouts.render_value({"declaration": source, "notes": [source]})
        self.assertNotIn("](", rendered)
        self.assertNotIn("<script>", rendered)
        self.assertIn(r"\[dbo\]\.\[p\]\(", rendered)
        self.assertIn("&lt;script&gt;x&lt;/script&gt;", rendered)
        self.assertIn("&amp;copy;", rendered)
        self.assertIn(r"\`code\`", rendered)
        self.assertIn(r"\*\*bold\*\*", rendered)
        self.assertIn("[SQL](1.sql)", layouts.table(["Source"], [("[SQL](1.sql)",)]))
        self.assertEqual(source, json.loads(layouts.json_bytes({"source": source}))["source"])

    def test_tampered_snapshot_fails_before_output(self):
        with tempfile.TemporaryDirectory() as temp:
            root, snapshot, out, _ = fixture(Path(temp))
            (snapshot / "modules.json").write_bytes(b"[]")
            with self.assertRaisesRegex(ValueError, "Source integrity failure"):
                layouts.build(root, snapshot, out)
            self.assertFalse(out.exists())

    def test_wrong_original_fingerprint_fails_before_output(self):
        with tempfile.TemporaryDirectory() as temp:
            root, snapshot, out, _ = fixture(Path(temp))
            path = root / "DB Architecture/catalog/modules.json"
            rows = json.loads(path.read_text()); rows[0]["source_definition_sha256"] = "0" * 64
            path.write_bytes(layouts.json_bytes(rows))
            usage_path = root / layouts.USAGE_RELATIVE
            usage = json.loads(usage_path.read_text())
            usage["input_sha256"]["DB Architecture/catalog/modules.json"] = layouts.sha(path.read_bytes())
            usage_path.write_bytes(layouts.json_bytes(usage))
            with self.assertRaisesRegex(ValueError, "Original definition hash mismatch"):
                layouts.build(root, snapshot, out)
            self.assertFalse(out.exists())

    def test_workspace_output_requires_explicit_opt_in(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp).resolve()
            out = root / "DB Architecture"
            path = out / "SP layout/1.sql"
            with self.assertRaisesRegex(ValueError, "explicit"):
                layouts.output_guard(root, out, [path])
            layouts.output_guard(root, out, [path], allow_workspace_local=True)

    def test_unknown_output_file_blocks_refresh(self):
        with tempfile.TemporaryDirectory() as temp:
            base = Path(temp).resolve(); root = base / "repo"; out = base / "out"
            existing = out / "SP layout/unrelated.txt"
            existing.parent.mkdir(parents=True); existing.write_text("preserve")
            with self.assertRaisesRegex(ValueError, "unrecognized/stale"):
                layouts.output_guard(root, out, [out / "SP layout/1.sql"])
            self.assertEqual(existing.read_text(), "preserve")


if __name__ == "__main__":
    unittest.main()
