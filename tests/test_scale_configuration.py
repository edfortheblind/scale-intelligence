"""Verify configuration-read boundaries without a database connection."""
import json
from pathlib import Path
import re
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))
from check_scale_configuration import CAP, SPECS, query_for, read_check, validate_identity, validate_result, validate_schema


class ConfigurationBoundaryTests(unittest.TestCase):
    def result(self, spec, count=0):
        return {"sampled_rows": count, "cap_hit": int(count == CAP), **{
            f"{c[0].lower()}_{b}": count if b == "y" else 0
            for c in spec["columns"] for b in ("y", "n", "null", "other")}}

    def test_allowlist_is_fixed_and_aggregate_only(self):
        self.assertEqual(len(SPECS), 5)
        for spec in SPECS:
            sql, params = query_for(spec)
            self.assertEqual(params, (CAP, "Inbound", "Outbound") if "filter_column" in spec else (CAP,))
            self.assertIn("TOP (?)", sql)
            self.assertEqual(re.findall(r"FROM \[dbo\]\.\[([^]]+)\]", sql), [spec["table"]])
            self.assertIsNone(re.search(r"\b(EXEC|EXECUTE|INSERT|UPDATE|DELETE|MERGE|ALTER|CREATE|DROP|INTO|OPENQUERY|OPENROWSET)\b", sql, re.I))
            self.assertNotIn("SYSTEM_VALUE", sql)
            self.assertNotIn("USER_STAMP", sql)
        with self.assertRaises(ValueError):
            query_for({"id": "ad_hoc", "table": "SHIPMENT_HEADER"})

    def test_empty_and_capped_outputs(self):
        for spec in SPECS:
            self.assertEqual(validate_result(spec, self.result(spec))["sampled_rows"], 0)
            self.assertEqual(validate_result(spec, self.result(spec, CAP))["cap_hit"], 1)

    def test_raw_text_and_extra_fields_are_rejected(self):
        spec = SPECS[0]
        for change in ({"active_y": "secret"}, {"extra": "secret"}, {"active_y": True}):
            with self.assertRaises(ValueError):
                validate_result(spec, self.result(spec) | change)

    def test_inconsistent_counts_and_caps_are_rejected(self):
        for change in ({"sampled_rows": CAP + 1}, {"cap_hit": 1}, {"active_y": -1}, {"active_y": 1}):
            with self.assertRaises(ValueError):
                validate_result(SPECS[0], self.result(SPECS[0]) | change)

    def test_schema_changes_are_rejected_before_configuration_select(self):
        spec = SPECS[0]
        valid = [spec["columns"][0] + (False, False, None)]
        validate_schema(spec, valid)
        for rows in ([], [("ACTIVE", 3, "nchar", 4, False, False, None)],
                     [("ACTIVE", 3, "nchar", 2, False, True, None)],
                     [("ACTIVE", 3, "nchar", 2, False, False, 1)]):
            with self.assertRaises(ValueError):
                validate_schema(spec, rows)

    def test_replica_identity_and_readonly_fail_closed(self):
        expected = {"database_name": "example", "engine_edition": 5, "collation_name": "example_CI_AS"}
        identity = expected | {"updateability": "READ_ONLY", "status": "ONLINE"}
        validate_identity(identity, expected)
        for change in ({"database_name": "another"}, {"updateability": "READ_WRITE"}, {"engine_edition": 3}, {"collation_name": "changed"}, {"status": "OFFLINE"}):
            with self.assertRaises(ValueError):
                validate_identity(identity | change, expected)

    def test_snapshot_agrees_with_all_fourteen_column_contracts(self):
        root = Path(__file__).resolve().parents[1]
        reviewed = 0
        for spec in SPECS:
            record = json.loads((root / f"DB Architecture/objects/{spec['object_id']}.json").read_text())
            self.assertEqual(record["name"], spec["table"])
            self.assertEqual(record["type"], "U")
            rows = [(c["name"], c["column_id"], c["type_name"], c["max_length"], c["is_nullable"], c["is_computed"], c.get("encryption_type")) for c in record["columns"]]
            validate_schema(spec, rows)
            reviewed += len(spec["columns"]) + int("filter_column" in spec)
        self.assertEqual(reviewed, 14)

    def test_schema_failure_never_executes_data_query(self):
        class Cursor:
            calls = []
            closed = False
            def execute(self, *args): self.calls.append(args)
            def fetchall(self): return []
            def close(self): self.closed = True
        class Connection:
            cur = Cursor()
            def cursor(self): return self.cur
        conn = Connection()
        audit = {'configuration_select_attempted': False}
        with self.assertRaises(ValueError):
            read_check(conn, SPECS[0], audit)
        self.assertEqual(len(conn.cur.calls), 1)
        self.assertIn("sys.columns", conn.cur.calls[0][0])
        self.assertTrue(conn.cur.closed)
        self.assertFalse(audit['configuration_select_attempted'])


if __name__ == "__main__":
    unittest.main()
