"""Synthetic provenance and metadata tests; no production/database access."""
from pathlib import Path
import hashlib
import json
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))
from build_table_layouts import USAGE_RELATIVE, build, load_verified, selected_rows, type_text


def digest(data):
    return hashlib.sha256(data).hexdigest()


def write_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


def obj(oid, name, kind="U", parent=0):
    return {"object_id": oid, "schema_id": 1, "schema_name": "dbo", "name": name, "type": kind, "parent_object_id": parent}


def column(oid, cid, name, kind="nvarchar", size=20, default=0):
    return {"object_id": oid, "column_id": cid, "name": name, "type_schema": "sys", "type_name": kind,
            "max_length": size, "precision": 0, "scale": 0, "is_nullable": True,
            "is_identity": False, "is_computed": False, "default_object_id": default, "rule_object_id": 0,
            "collation_name": None, "is_sparse": False, "future_capture_field": "preserve-me"}


def usage_row(oid):
    return {"object_id": oid, "primary_routine_any_evidence_ids": [], "primary_routine_direct_ids": [],
            "primary_routine_direct_status": "NO_CAPTURED_REFERENCE", "reference_evidence": [],
            "module_path_context": {"primary_indirect_module_ids": [], "limits": "Static possibilities only.",
                                    "shortest_path_examples": [], "view_path_examples": [], "attached_trigger_paths": []},
            "non_credit_observations": {"identifier_token_mentions": [], "original_string_mentions": [], "catalog_null_target_candidates": []}}


class TableLayoutTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.base = Path(self.temp.name)
        self.root = self.base / "repo"
        self.snapshot = self.base / "snapshot1"
        self.output = self.base / "outputs"
        self.objects = [obj(1, "ITEM"), obj(2, "OTHER"), obj(3, "Proc", "P"), obj(4, "DF_ITEM", "D", 1)]
        self.definition = "CREATE PROCEDURE dbo.Proc AS\r\n-- OTHER mention only\r\nSELECT 1;\r\n"
        self.rows = {"objects": self.objects, "objects_at_end": self.objects,
                     "tables": [{"object_id": 1}, {"object_id": 2}],
                     "columns": [column(1, 1, "Name", default=4), column(2, 1, "Value")],
                     "modules": [{"object_id": 3, "definition": self.definition, "uses_quoted_identifier": True}],
                     "default_constraints": [{"object_id": 4, "name": "DF_ITEM", "parent_object_id": 1, "parent_column_id": 1, "definition": "(N'exact | value <b>')"}],
                     "schemas": [{"schema_id": 1, "name": "dbo"}, {"schema_id": 4, "name": "sys"}],
                     "types": [{"user_type_id": 231, "schema_id": 4, "name": "nvarchar"}]}
        queries = {}
        for name, value in self.rows.items():
            path = self.snapshot / f"{name}.json"
            write_json(path, value)
            queries[name] = {"status": "CAPTURED", "file": path.name, "sha256": digest(path.read_bytes()), "rows": len(value)}
        queries["job_step_metadata"] = {"status": "UNAVAILABLE", "reason": "synthetic"}
        self.manifest = {"queries": queries}
        write_json(self.snapshot / "manifest.json", self.manifest)
        write_json(self.root / "DB Architecture/evidence/capture-manifest.json", self.manifest)
        summary = {"snapshot_id": self.snapshot.name, "counts": {"USER_TABLE": 2}}
        write_json(self.root / "DB Architecture/evidence/summary.json", summary)
        module_hash = digest(self.definition.encode("utf-8"))
        write_json(self.root / "DB Architecture/catalog/modules.json", [{"object_id": 3, "source_definition_sha256": module_hash}])
        sql = self.root / "DB Architecture/sql/3.sql"
        sql.parent.mkdir(parents=True, exist_ok=True)
        sql.write_bytes(b"CREATE PROCEDURE dbo.Proc AS\n-- [comment omitted]\nSELECT 1;\n")
        self.usage = {"snapshot_id": self.snapshot.name, "tables": [usage_row(1), usage_row(2)],
                      "input_sha256": {"DB Architecture/catalog/modules.json": digest((self.root / "DB Architecture/catalog/modules.json").read_bytes())},
                      "private_original_observation": {"loaded": True, "captured_original_file_sha256": queries["modules"]["sha256"]},
                      "module_sources": {"3": {"source_definition_sha256": module_hash, "reading_path": "DB Architecture/sql/3.sql", "reading_sha256": digest(sql.read_bytes())}},
                      "limitations": ["synthetic bound"]}
        write_json(self.root / USAGE_RELATIVE, self.usage)

    def test_byte_lengths_scale_and_alias_type(self):
        self.assertEqual(type_text(column(1, 1, "a", size=40)), "nvarchar(20)")
        self.assertEqual(type_text(column(1, 1, "a", size=-1)), "nvarchar(MAX)")
        self.assertEqual(type_text(column(1, 1, "a", "varchar", 40)), "varchar(40)")
        self.assertEqual(type_text({**column(1, 1, "a", "decimal"), "precision": 18, "scale": 4}), "decimal(18,4)")
        self.assertEqual(type_text({**column(1, 1, "a", "time"), "scale": 7}), "time(7)")
        self.assertEqual(type_text({**column(1, 1, "a", "float"), "precision": 53}), "float(53)")
        self.assertEqual(type_text({**column(1, 1, "a", "nvarchar"), "type_schema": "dbo"}), "[dbo].[nvarchar]")

    def test_build_preserves_unknown_fields_expressions_and_comment_only_priority(self):
        result = build(self.root, self.snapshot, self.output)
        self.assertEqual(result["table_count"], 2)
        self.assertEqual(result["column_count"], 2)
        self.assertEqual(result["priority_counts"], {"SP_FUNCTION_REFERENCE_OR_MENTION_OR_PATH": 1, "ALL_TABLE_FALLBACK_NO_CAPTURED_PRIMARY_EVIDENCE": 1})
        item = json.loads((self.output / "table layout/1.json").read_text(encoding="utf-8"))
        other = json.loads((self.output / "table layout/2.json").read_text(encoding="utf-8"))
        self.assertEqual(item["raw_catalog_records"]["columns"], self.rows["columns"][:1])
        self.assertEqual(item["raw_catalog_records"]["default_constraints"], self.rows["default_constraints"])
        self.assertEqual(item["capture_classes"]["job_step_metadata"]["status"], "UNAVAILABLE")
        self.assertFalse(other["original_comment_mentions"][0]["counts_as_routine_reference"])
        self.assertEqual(other["original_comment_mentions"][0]["source_line"], 2)
        self.assertEqual(other["table_usage_evidence"]["primary_routine_direct_ids"], [])
        text = (self.output / "table layout/2.md").read_text(encoding="utf-8")
        self.assertIn("../SP%20layout/3.md", text)
        self.assertIn("No captured direct/contract reference evidence", text)
        first_bytes = (self.output / "table layout/1.json").read_bytes()
        build(self.root, self.snapshot, self.output)
        self.assertEqual(first_bytes, (self.output / "table layout/1.json").read_bytes())

    def test_tampered_snapshot_fails_before_output(self):
        path = self.snapshot / "columns.json"
        path.write_text("[]", encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "Source integrity failure"):
            build(self.root, self.snapshot, self.output)
        self.assertFalse(self.output.exists())

    def test_manifest_rebinding_cannot_replace_accepted_capture(self):
        self.manifest["queries"]["columns"]["sha256"] = "0" * 64
        write_json(self.snapshot / "manifest.json", self.manifest)
        with self.assertRaisesRegex(ValueError, "accepted capture manifest"):
            load_verified(self.root, self.snapshot)

    def test_stale_usage_input_fails_before_output(self):
        self.usage["input_sha256"]["DB Architecture/catalog/modules.json"] = "0" * 64
        write_json(self.root / USAGE_RELATIVE, self.usage)
        with self.assertRaisesRegex(ValueError, "Source integrity failure"):
            build(self.root, self.snapshot, self.output)
        self.assertFalse(self.output.exists())

    def test_workspace_output_requires_explicit_switch(self):
        output = self.root / "DB Architecture"
        with self.assertRaisesRegex(ValueError, "allow-workspace-local"):
            build(self.root, self.snapshot, output)
        build(self.root, self.snapshot, output, allow_workspace_local=True)
        self.assertIn("2026-10-08", (output / "table layout/README.md").read_text(encoding="utf-8"))

    def test_foreign_keys_include_both_directions_and_exact_pairs(self):
        foreign = [{"object_id": 10, "parent_object_id": 1, "referenced_object_id": 2}, {"object_id": 11, "parent_object_id": 2, "referenced_object_id": 1}]
        pairs = [{"constraint_object_id": 10, "constraint_column_id": 1, "parent_object_id": 1, "parent_column_id": 1, "referenced_object_id": 2, "referenced_column_id": 1}, {"constraint_object_id": 11, "constraint_column_id": 1, "parent_object_id": 2, "parent_column_id": 1, "referenced_object_id": 1, "referenced_column_id": 1}]
        self.rows.update(foreign_keys=foreign, foreign_key_columns=pairs)
        selected = selected_rows(1, self.objects[0], self.rows)
        self.assertEqual(selected["foreign_keys"], foreign)
        self.assertEqual(selected["foreign_key_columns"], pairs)
        self.assertEqual(selected["types"], self.rows["types"])

    def test_unrecognized_output_is_not_overwritten(self):
        folder = self.output / "table layout"
        folder.mkdir(parents=True)
        marker = folder / "owner-notes.md"
        marker.write_text("Keep this", encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "Unrecognized existing files"):
            build(self.root, self.snapshot, self.output)
        self.assertEqual(marker.read_text(encoding="utf-8"), "Keep this")
        self.assertFalse((folder / "1.json").exists())


if __name__ == "__main__":
    unittest.main()
