"""Focused extraction boundaries and evidence integrity for the TAB core SDDs."""
import hashlib
import html
import json
import os
import re
import shutil
import subprocess
import tempfile
import unittest
from contextlib import contextmanager
from pathlib import Path
from unittest.mock import patch
from zipfile import ZipFile

from tools import extract_tab_core


ROOT = Path(__file__).resolve().parents[1]
CORE = ROOT / "SDD/tab-core"


def sha256(data):
    return hashlib.sha256(data).hexdigest()


def canonical_node_sha256(node):
    return sha256(json.dumps(node, sort_keys=True, ensure_ascii=False,
                             separators=(",", ":")).encode("utf-8"))


def read_json(path):
    return json.loads(path.read_text(encoding="utf-8"))


def make_docx(path, text="Fixture document"):
    path.parent.mkdir(parents=True, exist_ok=True)
    body = ('<w:document xmlns:w="http://schemas.openxmlformats.org/'
            'wordprocessingml/2006/main"><w:body><w:p><w:r><w:t>'
            + html.escape(text) + '</w:t></w:r></w:p><w:sectPr/>'
            '</w:body></w:document>')
    with ZipFile(path, "w") as archive:
        archive.writestr("word/document.xml", body)
    return path


def register(root, paths):
    sources = [{"id": f"FIXTURE-{index}", "path": path.relative_to(root).as_posix(),
                "bytes": path.stat().st_size, "sha256": sha256(path.read_bytes())}
               for index, path in enumerate(paths, 1)]
    path = root / "SDD/tab-core-sources.json"
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps({"sources": sources}), encoding="utf-8")
    return sources


def file_snapshot(root):
    return {path.relative_to(root).as_posix(): path.read_bytes()
            for path in root.rglob("*") if path.is_file()}


@contextmanager
def directory_redirect(test, fixture, link, target):
    """Create a confined directory junction on Windows, symlink elsewhere."""
    fixture = fixture.resolve()
    target = target.resolve()
    test.assertTrue(target.is_relative_to(fixture))
    test.assertTrue(link.parent.resolve().is_relative_to(fixture))
    target.mkdir(parents=True)
    if os.name == "nt":
        powershell = shutil.which("pwsh") or shutil.which("powershell")
        test.assertIsNotNone(powershell, "Native PowerShell is required for the junction test")
        env = dict(os.environ, TAB_CORE_TEST_LINK=str(link), TAB_CORE_TEST_TARGET=str(target))
        subprocess.run(
            [powershell, "-NoProfile", "-NonInteractive", "-Command",
             "New-Item -ItemType Junction -Path $env:TAB_CORE_TEST_LINK "
             "-Target $env:TAB_CORE_TEST_TARGET -ErrorAction Stop | Out-Null"],
            env=env, cwd=fixture, check=True, capture_output=True, text=True,
        )
    else:
        link.symlink_to(target, target_is_directory=True)
    try:
        test.assertEqual(link.resolve(), target)
        yield
    finally:
        # Remove only the redirect, before TemporaryDirectory can traverse it.
        # os.rmdir on a Windows junction removes the junction, not its target.
        if os.name == "nt":
            os.rmdir(link)
        else:
            link.unlink()
        test.assertFalse(link.exists())
        test.assertTrue(target.is_dir())


class TabCoreExtractionTests(unittest.TestCase):
    def test_later_identity_mismatch_does_not_write_any_output(self):
        for mismatch in ("bytes", "sha256"):
            with self.subTest(mismatch=mismatch), tempfile.TemporaryDirectory() as tmp:
                root = Path(tmp)
                first = make_docx(root / "SDD/first.docx", "First valid source")
                second = make_docx(root / "SDD/second.docx", "Later source")
                sources = register(root, [first, second])
                sources[1][mismatch] = (sources[1]["bytes"] + 1 if mismatch == "bytes"
                                        else "0" * 64)
                (root / "SDD/tab-core-sources.json").write_text(
                    json.dumps({"sources": sources}), encoding="utf-8")
                out = root / "SDD/tab-core"
                out.mkdir()
                (out / "inventory.json").write_bytes(b"existing inventory must survive")
                before = file_snapshot(root)
                with patch.object(extract_tab_core, "extract_ooxml") as ooxml, \
                        patch.object(extract_tab_core, "extract_pdf") as pdf:
                    with self.assertRaisesRegex(ValueError, "identity changed: FIXTURE-2"):
                        extract_tab_core.extract_registered(root)
                    ooxml.assert_not_called()
                    pdf.assert_not_called()
                self.assertEqual(file_snapshot(root), before)

    def test_only_registered_sources_are_extracted_and_inputs_are_preserved(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            first = make_docx(root / "SDD/first.docx", "First registered")
            second = make_docx(root / "SDD/derived/second.docx", "Original under derived")
            register(root, [first, second])
            legacy = root / "SDD/derived/inventory.json"
            legacy.write_bytes(b'{"historical": "unchanged"}\n')
            # A directory-wide source scan would attempt this invalid DOCX.
            (root / "SDD/unregistered.docx").write_bytes(b"not a zip; not registered")
            before = file_snapshot(root)
            result = extract_tab_core.extract_registered(root)
            self.assertEqual(result["original_count"], 2)
            self.assertEqual({row["source_path"] for row in result["documents"]},
                             {"SDD/first.docx", "SDD/derived/second.docx"})
            after = file_snapshot(root)
            for name, content in before.items():
                self.assertEqual(after[name], content, name)
            self.assertTrue(all(name.startswith("SDD/tab-core/")
                                for name in after.keys() - before.keys()))
            for item in result["documents"]:
                document = read_json(root / "SDD/tab-core" / item["document_path"])
                self.assertEqual(len(document["nodes"]), 1)
                self.assertFalse(document["production_index_eligible"])

    def test_source_outside_sdd_is_rejected_before_extraction(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            outside = make_docx(root / "outside.docx")
            register(root, [outside])
            before = file_snapshot(root)
            with patch.object(extract_tab_core, "extract_ooxml") as extract:
                with self.assertRaisesRegex(ValueError, "original under SDD"):
                    extract_tab_core.extract_registered(root)
                extract.assert_not_called()
            self.assertEqual(file_snapshot(root), before)
            self.assertFalse((root / "SDD/tab-core").exists())

    def test_source_inside_output_is_rejected_before_extraction(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            source = make_docx(root / "SDD/tab-core/source.docx")
            register(root, [source])
            before = file_snapshot(root)
            with patch.object(extract_tab_core, "extract_ooxml") as extract:
                with self.assertRaisesRegex(ValueError, "outside extraction output"):
                    extract_tab_core.extract_registered(root)
                extract.assert_not_called()
            self.assertEqual(file_snapshot(root), before)

    def check_output_redirect(self, descendant):
        with tempfile.TemporaryDirectory() as tmp:
            fixture = Path(tmp).resolve()
            root = fixture / "project"
            source = make_docx(root / "SDD/source.docx")
            register(root, [source])
            out = root / "SDD/tab-core"
            if descendant:
                (out / "assets").mkdir(parents=True)
                (out / "inventory.json").write_bytes(b"original output inventory")
                link = out / "assets/redirected"
            else:
                link = out
            target = fixture / "redirect-target"
            with directory_redirect(self, fixture, link, target):
                sentinel = target / "sentinel.txt"
                sentinel.write_bytes(b"redirect target must not change")
                before_target = file_snapshot(target)
                with patch.object(extract_tab_core, "extract_ooxml") as ooxml, \
                        patch.object(extract_tab_core, "extract_pdf") as pdf:
                    with self.assertRaisesRegex(ValueError, "redirected path"):
                        extract_tab_core.extract_registered(root)
                    ooxml.assert_not_called()
                    pdf.assert_not_called()
                self.assertEqual(file_snapshot(target), before_target)
                self.assertFalse((out / "documents").exists())
                self.assertFalse((out / "reading").exists())
                if descendant:
                    self.assertEqual((out / "inventory.json").read_bytes(),
                                     b"original output inventory")
            self.assertEqual(sentinel.read_bytes(), b"redirect target must not change")

    def test_output_root_directory_redirect_is_rejected_before_writes(self):
        self.check_output_redirect(descendant=False)

    def test_output_descendant_directory_redirect_is_rejected_before_writes(self):
        self.check_output_redirect(descendant=True)


class TabCoreEvidenceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.registry = read_json(ROOT / "SDD/tab-core-sources.json")
        cls.inventory = read_json(CORE / "inventory.json")
        cls.review = read_json(CORE / "reconciliation.json")
        cls.coverage = read_json(CORE / "text-review-coverage.json")
        cls.documents = {item["document_id"]: read_json(CORE / item["document_path"])
                         for item in cls.inventory["documents"]}
        cls.nodes = {sid: {n["id"]: n for n in document["nodes"]}
                     for sid, document in cls.documents.items()}

    def assert_bound_reference(self, ref):
        document = self.documents[ref["document_id"]]
        node = self.nodes[ref["document_id"]][ref["node_id"]]
        self.assertEqual(ref["source_sha256"], document["source_sha256"])
        self.assertEqual(ref["location"], node["location"])
        self.assertEqual(ref["text_sha256"], sha256(node["text"].encode("utf-8")))
        self.assertEqual(ref["node_canonical_sha256"], canonical_node_sha256(node))

    def test_registered_originals_and_inventory_have_exact_identities(self):
        sources = self.registry["sources"]
        self.assertEqual(len(sources), 2)
        self.assertEqual(len({s["id"] for s in sources}), len(sources))
        self.assertEqual(self.inventory["original_count"], len(sources))
        identities = [{k: s[k] for k in ("id", "path", "bytes", "sha256")} for s in sources]
        self.assertEqual(self.inventory["source_identity_sha256"],
                         sha256(json.dumps(identities, sort_keys=True).encode("utf-8")))
        registered = {source["id"]: source for source in sources}
        self.assertEqual({item["core_source_id"] for item in self.inventory["documents"]},
                         set(registered))
        self.assertEqual(len(self.inventory["documents"]), len(registered))
        for item in self.inventory["documents"]:
            with self.subTest(source=item["core_source_id"]):
                source = registered[item["core_source_id"]]
                path = (ROOT / source["path"]).resolve()
                self.assertTrue(path.is_relative_to(ROOT / "SDD"))
                self.assertFalse(path.is_relative_to(CORE))
                data = path.read_bytes()
                self.assertEqual(len(data), source["bytes"])
                self.assertEqual(sha256(data), source["sha256"])
                self.assertEqual(item["document_id"], "sdd-" + source["sha256"][:16])
                document = self.documents[item["document_id"]]
                for key in ("source_path", "source_sha256", "core_source_id", "document_id"):
                    self.assertEqual(document[key], item[key])
                self.assertEqual(item["source_path"], source["path"])
                self.assertEqual(item["source_sha256"], source["sha256"])
                self.assertEqual(item["node_count"], len(document["nodes"]))
                self.assertEqual(item["asset_count"], len(document["assets"]))
                self.assertEqual(item["page_count"], document["page_count"])
                self.assertFalse(document["production_index_eligible"])
                self.assertTrue(document["exceptions"])

    def test_every_claim_reference_binds_exact_text_and_canonical_node(self):
        self.assertTrue(self.review["claims"])
        ids = [claim["id"] for claim in self.review["claims"]]
        self.assertEqual(len(ids), len(set(ids)))
        for claim in self.review["claims"]:
            with self.subTest(claim=claim["id"]):
                self.assertTrue(claim["refs"])
                self.assertTrue(claim["statement"].strip())
                self.assertIs(claim["current_runtime_verified"], False)
                for ref in claim["refs"]:
                    self.assert_bound_reference(ref)
        for reconciliation in self.review["reconciliations"]:
            with self.subTest(reconciliation=reconciliation["id"]):
                self.assertTrue(reconciliation["claim_ids"])
                self.assertTrue(set(reconciliation["claim_ids"]) <= set(ids))
                self.assertIs(reconciliation["current_runtime_verified"], False)
        self.assertIs(self.review["production_index_eligible"], False)
        self.assertEqual(self.review["help_search_integration"],
                         "SEPARATE_TAB_DESIGN_SEARCH_AND_SOURCE_VIEWS")

    def test_coverage_contains_every_exact_node_including_identified_blanks(self):
        rows = self.coverage["documents"]
        self.assertEqual({row["document_id"] for row in rows}, set(self.documents))
        self.assertEqual(len(rows), len(self.documents))
        for row in rows:
            with self.subTest(document=row["document_id"]):
                sid = row["document_id"]
                nodes = self.documents[sid]["nodes"]
                source_ids = [node["id"] for node in nodes]
                observed_ids = [ref["node_id"] for ref in row["nodes"]]
                self.assertEqual(len(source_ids), len(set(source_ids)))
                self.assertEqual(len(observed_ids), len(set(observed_ids)))
                self.assertEqual(set(observed_ids), set(source_ids))
                self.assertEqual(row["nodes_read"], len(source_ids))
                item = next(i for i in self.inventory["documents"] if i["document_id"] == sid)
                self.assertEqual(row["packet_sha256"],
                                 sha256((CORE / item["document_path"]).read_bytes()))
                self.assertEqual(row["source_sha256"], self.documents[sid]["source_sha256"])
                self.assertEqual(row["text_review_state"], "ALL_EXTRACTED_TEXT_NODES_READ")
                self.assertIn("not a count of accepted procedures", row["qualification"])
                for ref in row["nodes"]:
                    self.assert_bound_reference(ref)
                    node = self.nodes[sid][ref["node_id"]]
                    self.assertEqual(ref["kind"], node["kind"])
                    self.assertIs(ref["nonempty"], bool(node["text"].strip()))

    def test_reading_copies_retain_all_anchors_and_literal_node_text(self):
        for item in self.inventory["documents"]:
            with self.subTest(document=item["document_id"]):
                body = (CORE / item["reading_path"]).read_text(encoding="utf-8")
                nodes = self.documents[item["document_id"]]["nodes"]
                observed = re.findall(r'<a id="([^"]+)"></a>', body)
                self.assertEqual(observed, [html.escape(n["id"], quote=True) for n in nodes])
                self.assertIn(item["source_sha256"], body)
                sections = re.split(r'<a id="[^"]+"></a>', body)[1:]
                for node, section in zip(nodes, sections):
                    # Text is fenced and inert; exact content must remain inside its own node.
                    self.assertRegex(section, r"(?m)^`{3,}text$")
                    self.assertIn("\n" + node["text"] + "\n", section)

    def test_generated_assets_match_hashes_sizes_and_node_references(self):
        for document in self.documents.values():
            with self.subTest(document=document["document_id"]):
                assets = {asset["path"]: asset for asset in document["assets"]}
                self.assertEqual(len(assets), len(document["assets"]))
                for asset in assets.values():
                    path = (CORE / asset["path"]).resolve()
                    self.assertTrue(path.is_relative_to(CORE / "assets"))
                    data = path.read_bytes()
                    self.assertEqual(len(data), asset["bytes"])
                    self.assertEqual(sha256(data), asset["sha256"])
                for node in document["nodes"]:
                    self.assertTrue(set(node.get("assets", [])) <= set(assets), node["id"])


if __name__ == "__main__":
    unittest.main()
