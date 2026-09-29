"""Behavioral tests of the foundation; synthetic data is never site evidence."""
import json
from pathlib import Path
import struct
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))
import collector as c


class ScopeTests(unittest.TestCase):
    def test_preserves_case_spaces_query_and_anchors(self):
        item = c.source_identity("Content/How .htm?view=A#field", c.SEEDS["AIM"])
        self.assertTrue(item["fetch_key"].endswith("Content/How .htm?view=A"))
        self.assertEqual(item["fragment"], "field")
        self.assertNotEqual(item["id"], c.source_identity("Content/how .htm?view=A", c.SEEDS["AIM"])["id"])
        self.assertNotEqual(item["id"], c.source_identity("Content/How .htm?view=B", c.SEEDS["AIM"])["id"])

    def test_forbidden_origins_operations_credentials_and_encoded_traversal(self):
        invalid = ["http://travstg.manhscale.com/SCALEHelp/Help/WebHelp/a.htm",
                   "https://other.example/SCALEHelp/Help/WebHelp/a.htm",
                   "https://travstg.manhscale.com:443/SCALEHelp/Help/WebHelp/a.htm",
                   "https://user:password@travstg.manhscale.com/SCALEHelp/Help/WebHelp/a.htm",
                   "/scale/trans/dashboard", "/SCALEHelp/Help/WebHelp/%252e%252e/a",
                   "/SCALEHelp/Help/WebHelp/a?token=synthetic", "a#session=synthetic",
                   "/SCALEHelp/Help/WebHelp/a\\..\\b"]
        for href in invalid:
            with self.subTest(href=href), self.assertRaises(ValueError):
                c.source_identity(href, c.SEEDS["AIM"])

    def test_shared_dependencies_require_explicit_classification(self):
        with self.assertRaises(ValueError):
            c.source_identity("/SCALEHelp/shared.css", c.SEEDS["AIM"])
        self.assertIsNone(c.source_identity("/SCALEHelp/shared.css", c.SEEDS["AIM"], True)["module"])


class StoreTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.store = c.Store(self.root)

    def asset(self):
        data = b"\x89PNG\r\n\x1a\n" + b"\x00\x00\x00\rIHDR" + struct.pack(">II", 13, 17) + b"synthetic-fixture"
        path = self.root / "fixture.png"
        path.write_bytes(data)
        manifest = self.root / "bundle.json"
        manifest.write_text("{}")
        asset = {"url": c.SEEDS["AIM"].rsplit("/", 1)[0] + "/Content/Images/a.png",
                 "path": str(path), "kind": "image", "contentType": "image/png"}
        return asset, manifest, data

    def test_duplicate_reference_retains_occurrences_not_duplicate_resources(self):
        self.store.discover("AIM", "Content/a.htm#one", c.SEEDS["AIM"], "toc-1")
        self.store.discover("AIM", "Content/a.htm#two", c.SEEDS["AIM"], "toc-2")
        self.store.discover("AIM", "Content/a.htm#two", c.SEEDS["AIM"], "toc-2")
        records = self.store.records("AIM")
        self.assertEqual(len(records), 1)
        self.assertEqual(len(records[0]["occurrences"]), 2)

    def test_windows_unsafe_names_never_become_local_names(self):
        record = self.store.discover("AIM", "Content/CON.htm?a=b", c.SEEDS["AIM"], "toc")
        self.assertRegex(record["id"], r"^[a-f0-9]{64}$")

    def test_sdk_and_cross_module_are_deferred(self):
        with self.assertRaisesRegex(ValueError, "SDK_REQUIRES"):
            self.store.discover("SDK", c.SEEDS["SDK"], c.SEEDS["SDK"], "owner")
        with self.assertRaisesRegex(ValueError, "CROSS_MODULE"):
            self.store.discover("AIM", c.SEEDS["SDK"], c.SEEDS["AIM"], "link")

    def test_atomic_failure_preserves_prior_checkpoint(self):
        path = self.root / "state.json"
        c.atomic_json(path, {"value": "old"})
        with patch.object(c.os, "replace", side_effect=OSError("interrupted")):
            with self.assertRaises(OSError):
                c.atomic_json(path, {"value": "new"})
        self.assertEqual(c.read_json(path), {"value": "old"})
        self.assertEqual(list(self.root.glob(".pending-*")), [])

    def test_import_is_byte_exact_idempotent_and_not_corpus_complete(self):
        asset, manifest, data = self.asset()
        record = self.store.import_browser_asset(asset, manifest)
        self.assertEqual((self.root / record["local_path"]).read_bytes(), data)
        self.assertEqual(record["dimensions"], {"width": 13, "height": 17})
        self.assertEqual(self.store.import_browser_asset(asset, manifest), record)
        report = self.store.verify()
        self.assertEqual(report["stored_bodies_verified"], 1)
        self.assertFalse(report["corpus_complete"])
        self.assertFalse(record["transport_metadata_verified"])

    def test_tampering_and_missing_bodies_are_detected(self):
        asset, manifest, data = self.asset()
        record = self.store.import_browser_asset(asset, manifest)
        body = self.root / record["local_path"]
        body.write_bytes(data + b"changed")
        self.assertEqual(self.store.verify()["failures"][0]["error"], "HASH_OR_LENGTH_MISMATCH")
        body.unlink()
        self.assertEqual(self.store.verify()["failures"][0]["error"], "MISSING_BODY")

    def test_interrupted_manifest_write_is_not_counted_as_capture(self):
        asset, manifest, _ = self.asset()
        original = self.store.save_record
        def fail_after_body(record):
            if record["status"] == "BODY_SAVED":
                raise OSError("interrupted before manifest commit")
            original(record)
        with patch.object(self.store, "save_record", side_effect=fail_after_body):
            with self.assertRaises(OSError):
                self.store.import_browser_asset(asset, manifest)
        self.assertEqual(self.store.verify()["stored_bodies_verified"], 0)
        self.store.import_browser_asset(asset, manifest)
        self.assertEqual(self.store.verify()["stored_bodies_verified"], 1)

    def test_html_in_asset_channel_is_rejected(self):
        asset, manifest, _ = self.asset()
        Path(asset["path"]).write_bytes(b"<!DOCTYPE html><title>Sign in</title>")
        with self.assertRaisesRegex(ValueError, "UNEXPECTED_HTML"):
            self.store.import_browser_asset(asset, manifest)
        self.assertEqual(self.store.verify()["stored_bodies_verified"], 0)

    def test_manifest_path_escape_is_detected(self):
        asset, manifest, _ = self.asset()
        record = self.store.import_browser_asset(asset, manifest)
        record["local_path"] = "../outside.png"
        self.store.save_record(record)
        self.assertEqual(self.store.verify()["failures"][0]["error"], "PATH_ESCAPE")

    def test_checkpoint_keeps_unknown_denominators_and_reconstructs_queue(self):
        self.store.discover("AIM", c.SEEDS["AIM"], c.SEEDS["AIM"], "owner")
        state = self.store.checkpoint()
        self.assertEqual(state["modules"]["AIM"]["counts"]["pending"], 1)
        coverage = c.read_json(self.root / "AIM/reports/coverage.json")
        self.assertIsNone(coverage["denominators"]["articles"])
        (self.root / "_project/STATE.json").unlink()
        self.assertEqual(self.store.checkpoint()["modules"], state["modules"])

    def test_completed_evidence_cannot_be_downgraded(self):
        state = {"modules": {"AIM": {"status": "MODULE_LOCAL_COMPLETE"}}}
        c.atomic_json(self.root / "_project/STATE.json", state)
        updated = self.store.checkpoint()
        self.assertEqual(updated["modules"]["AIM"]["status"], "MODULE_LOCAL_COMPLETE")

    def test_checkpoint_preserves_pilot_phase_and_denominators(self):
        c.atomic_json(self.root / "_project/STATE.json", {"phase":"PILOT","pilot":"IN_PROGRESS","blockers":[]})
        c.atomic_json(self.root / "AIM/reports/coverage.json", {"denominators":{"articles":10},"pilot":"IN_PROGRESS"})
        updated = self.store.checkpoint()
        self.assertEqual(updated["phase"], "PILOT")
        self.assertEqual(updated["pilot"], "IN_PROGRESS")
        self.assertEqual(updated["blockers"], [])
        self.assertEqual(c.read_json(self.root / "AIM/reports/coverage.json")["denominators"], {"articles":10})

    def test_original_non_utf8_bytes_metadata_upgrade_and_prior_body(self):
        record=self.store.discover("AIM","Content/sample.htm",c.SEEDS["AIM"],"fixture","article")
        metadata={"final_url":record["source_url"],"http_status":200,"mime":"text/html; charset=windows-1252",
                  "encoding":"windows-1252","redirect_chain":[],"set-cookie":"must-not-copy"}
        raw=b'<html><body>\x93Original\x94\r\n</body></html>'
        self.store.save_original(record,raw,metadata)
        self.assertEqual((self.root/record["local_path"]).read_bytes(),raw)
        self.assertTrue(record["transport_metadata_verified"])
        self.assertNotIn("set-cookie",record)
        old_path=record["local_path"]
        self.store.save_original(record,raw+b' ',metadata)
        self.assertEqual((self.root/old_path).read_bytes(),raw)
        self.assertEqual(record["prior_bodies"][0]["local_path"],old_path)

    def test_process_lock_excludes_other_writer_then_releases(self):
        runtime = self.root / "runtime"
        script = ("import sys; from pathlib import Path; sys.path.insert(0, sys.argv[1]); "
                  "from collector import writer_lock; "
                  "ctx=writer_lock(Path(sys.argv[2]),Path(sys.argv[3])); ctx.__enter__(); ctx.__exit__(None,None,None)")
        args = [sys.executable, "-c", script, str(Path(c.__file__).parent), str(self.root), str(runtime)]
        with c.writer_lock(self.root, runtime):
            self.assertNotEqual(subprocess.run(args, capture_output=True).returncode, 0)
        self.assertEqual(subprocess.run(args, capture_output=True).returncode, 0)


if __name__ == "__main__":
    unittest.main()
