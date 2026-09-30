import hashlib
import json
import tempfile
import unittest
from pathlib import Path
from xml.etree import ElementTree as ET
from zipfile import ZipFile

from tools.extract_sdd import NS, extract_all, render_reading_copy, revision_state, table_rows, xml_text


class SddExtractionTests(unittest.TestCase):
    def test_text_retains_tab_break_and_deleted_text_without_field_code(self):
        el = ET.fromstring(f'<w:p xmlns:w="{NS["w"]}"><w:r><w:t>A</w:t><w:tab/><w:t>B</w:t><w:br/><w:delText>C</w:delText><w:instrText>hidden</w:instrText></w:r></w:p>')
        self.assertEqual(xml_text(el), "A\tB\nC")

    def test_table_retains_merge_semantics(self):
        el = ET.fromstring(f'<w:tbl xmlns:w="{NS["w"]}"><w:tr><w:tc><w:tcPr><w:gridSpan w:val="2"/><w:vMerge w:val="restart"/></w:tcPr><w:p><w:r><w:t>A</w:t></w:r></w:p></w:tc></w:tr></w:tbl>')
        cell = table_rows(el, "b1")[0][0]
        self.assertEqual((cell["text"], cell["grid_span"], cell["vertical_merge"]), ("A", 2, "restart"))

    def test_tracked_revisions_are_explicit(self):
        el = ET.fromstring(f'<w:p xmlns:w="{NS["w"]}"><w:del><w:r><w:delText>old</w:delText></w:r></w:del><w:ins><w:r><w:t>new</w:t></w:r></w:ins></w:p>')
        state = revision_state(el)
        self.assertEqual(state["source_text_state"], "MIXED_REVISIONS_NOT_RESOLVED")
        self.assertEqual(state["deleted_text_fragments"], ["old"])
        self.assertEqual([r["kind"] for r in state["revision_runs"]], ["del", "ins"])

    def test_duplicate_originals_have_one_document_and_unchanged_hashes(self):
        with tempfile.TemporaryDirectory() as tmp:
            src = Path(tmp) / "sources"
            src.mkdir()
            with ZipFile(src / "sample.docx", "w") as zf:
                zf.writestr("word/document.xml", f'<w:document xmlns:w="{NS["w"]}"><w:body><w:p><w:r><w:t>Sample</w:t></w:r></w:p><w:sectPr/></w:body></w:document>')
            data = (src / "sample.docx").read_bytes()
            (src / "sample duplicate.docx").write_bytes(data)
            out = src / "derived"
            first = extract_all(src, out)
            second = extract_all(src, out)
            self.assertEqual(first, second)
            self.assertEqual((first["original_count"], first["unique_document_count"]), (2, 1))
            self.assertEqual((src / "sample.docx").read_bytes(), data)
            self.assertEqual(first["originals"][1]["duplicate_of"], "sample.docx")
            document = json.loads((out / first["documents"][0]["document_path"]).read_text(encoding="utf-8"))
            self.assertEqual(document["nodes"][0]["id"], "b00001")
            self.assertEqual(document["nodes"][0]["text"], "Sample")
            self.assertFalse(document["production_index_eligible"])

    def test_output_must_not_replace_source_directory(self):
        with tempfile.TemporaryDirectory() as tmp:
            with self.assertRaises(ValueError):
                extract_all(Path(tmp), Path(tmp))

    def test_reading_copy_fences_untrusted_html_markdown_and_fences(self):
        source_text = '<img src="https://example.invalid/x">\n![source](https://example.invalid/y)\n```\n````\n<script>alert(1)</script>'
        with tempfile.TemporaryDirectory() as tmp:
            src = Path(tmp) / "sources"
            src.mkdir()
            document = ET.Element(f'{{{NS["w"]}}}document')
            body = ET.SubElement(document, f'{{{NS["w"]}}}body')
            paragraph = ET.SubElement(body, f'{{{NS["w"]}}}p')
            run = ET.SubElement(paragraph, f'{{{NS["w"]}}}r')
            ET.SubElement(run, f'{{{NS["w"]}}}t').text = source_text
            with ZipFile(src / "sample.docx", "w") as zf:
                zf.writestr("word/document.xml", ET.tostring(document))
            out = src / "derived"
            inventory = extract_all(src, out)
            item = inventory["documents"][0]
            extracted = json.loads((out / item["document_path"]).read_text(encoding="utf-8"))
            self.assertEqual(extracted["nodes"][0]["text"], source_text)
            reading = (out / item["reading_path"]).read_text(encoding="utf-8")
            self.assertIn(f"`````text\n{source_text}\n`````", reading)
            self.assertIn('<a id="b00001"></a>', reading)

    def test_source_labels_and_anchor_attributes_are_escaped(self):
        document = {"source_path": '<img onerror="x">![external](x).docx', "source_sha256": "a" * 64,
                    "nodes": [{"id": 'part-header" onclick="x', "location": '<script>![external](x)', "text": "literal"}]}
        reading = render_reading_copy(document)
        self.assertNotIn('<img', reading)
        self.assertNotIn('<script>', reading)
        self.assertNotIn('![external]', reading)
        self.assertIn('id="part-header&quot; onclick=&quot;x"', reading)

    def test_retained_corpus_originals_and_node_ids(self):
        root = Path(__file__).resolve().parents[1] / "SDD"
        inventory = json.loads((root / "derived/inventory.json").read_text(encoding="utf-8"))
        self.assertEqual((inventory["original_count"], inventory["unique_document_count"]), (9, 8))
        self.assertEqual(sum(bool(s["duplicate_of"]) for s in inventory["originals"]), 1)
        for original in inventory["originals"]:
            data = (root / original["path"]).read_bytes()
            self.assertEqual(hashlib.sha256(data).hexdigest(), original["sha256"])
            self.assertEqual(len(data), original["bytes"])
        for item in inventory["documents"]:
            document = json.loads((root / "derived" / item["document_path"]).read_text(encoding="utf-8"))
            ids = [n["id"] for n in document["nodes"]]
            self.assertEqual(len(ids), len(set(ids)))
            self.assertTrue(document["exceptions"])
            self.assertFalse(document["production_index_eligible"])
            for asset in document["assets"]:
                self.assertEqual(hashlib.sha256((root / "derived" / asset["path"]).read_bytes()).hexdigest(), asset["sha256"])

    def test_reviewed_citations_resolve_and_never_assert_live_settings(self):
        root = Path(__file__).resolve().parents[1] / "SDD/derived"
        review = json.loads((root / "reviewed-knowledge.json").read_text(encoding="utf-8"))
        sources = {p.stem: json.loads(p.read_text(encoding="utf-8")) for p in (root / "documents").glob("*.json")}
        for record in review["claims"] + review["configuration"] + review["products"] + review["diagrams"]:
            self.assertTrue(record["citations"])
            for citation in record["citations"]:
                source = sources[citation["document_id"]]
                self.assertEqual(source["source_sha256"], citation["source_sha256"])
                nodeids = {n["id"] for n in source["nodes"]}
                self.assertTrue(set(citation["nodes"]).issubset(nodeids))
                cited = [n for n in source["nodes"] if n["id"] in citation["nodes"]]
                self.assertFalse(any(n.get("source_text_state") == "MIXED_REVISIONS_NOT_RESOLVED" for n in cited))
        for record in review["configuration"]:
            for key in ("purpose", "scope", "accepted_values", "default", "precedence", "process", "validation", "deployment_state"):
                self.assertTrue(record[key])
            self.assertEqual(record["deployment_state"], "NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT")


if __name__ == "__main__":
    unittest.main()
