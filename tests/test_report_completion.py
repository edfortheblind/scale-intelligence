"""Completion reports must not silently omit or reuse stale scenario evidence."""
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
import report_completion


class ReportReceiptTests(unittest.TestCase):
    def altered_receipt(self, relative, mutate):
        target = report_completion.ROOT / relative
        original_read = Path.read_bytes
        def read(path):
            raw = original_read(path)
            if path == target:
                data = json.loads(raw)
                mutate(data)
                return json.dumps(data).encode('utf-8')
            return raw
        return patch.object(Path, 'read_bytes', read)

    def test_missing_selected_review_is_rejected(self):
        with tempfile.TemporaryDirectory() as folder:
            with self.assertRaisesRegex(ValueError, 'scenario review receipt is unavailable'):
                report_completion.report(str(Path(folder) / 'missing.json'))

    def test_review_from_another_generation_is_rejected(self):
        with tempfile.TemporaryDirectory() as folder:
            path = Path(folder) / 'stale.json'
            path.write_text(json.dumps({'source_generation_sha256': '0' * 64}), encoding='utf-8')
            with self.assertRaisesRegex(ValueError, 'not bound to current help content'):
                report_completion.report(str(path))

    def test_duplicate_docx_body_cannot_inflate_coverage(self):
        def duplicate(data):
            data['documents'].append(data['documents'][0])
            data['fully_viewed_unique_bodies'] += 1
        with self.altered_receipt('_project/docx-layout-continuation18.json', duplicate):
            with self.assertRaisesRegex(ValueError, 'unique bodies'):
                report_completion.report()

    def test_docx_denominator_must_match_inventory(self):
        with self.altered_receipt('_project/docx-layout-continuation18.json', lambda d: d.update(unique_docx_bodies=1)):
            with self.assertRaisesRegex(ValueError, 'unique bodies'):
                report_completion.report()

    def test_duplicate_docx_page_cannot_count_as_inspection(self):
        def duplicate(data):
            data['documents'][0]['pages'].append(data['documents'][0]['pages'][0])
        with self.altered_receipt('_project/docx-layout-continuation18.json', duplicate):
            with self.assertRaisesRegex(ValueError, 'unique inspected page records'):
                report_completion.report()

    def test_empty_docx_body_cannot_pass_full_page_review(self):
        def empty(data):
            body = data['documents'][0]
            body['pages'] = []
            body['counts'].update(pages=0, visually_inspected_pages=0)
        with self.altered_receipt('_project/docx-layout-continuation18.json', empty):
            with self.assertRaisesRegex(ValueError, 'unique inspected page records'):
                report_completion.report()

    def test_duplicate_runtime_identity_cannot_exceed_denominator(self):
        def duplicate(data):
            data['records'].append(data['records'][0])
        with self.altered_receipt('DB Architecture/mappings/runtime-identity-disposition.json', duplicate):
            with self.assertRaisesRegex(ValueError, 'unmatched ID set'):
                report_completion.report()

    def test_ordinary_report_reference_and_help_never_open_archive(self):
        from help_knowledge import Knowledge
        from render_scale_reference import validate
        original_open = Path.open
        archive = report_completion.ROOT / 'archive'
        def active_only(path, *args, **kwargs):
            if path.resolve().is_relative_to(archive):
                raise AssertionError('Ordinary consumer attempted to open archive payload')
            return original_open(path, *args, **kwargs)
        with patch.object(Path, 'open', active_only):
            data = report_completion.report()
            central = json.loads((report_completion.ROOT/'SDD/derived/scale-functional-reference.json').read_text(encoding='utf-8'))
            validate(central, report_completion.ROOT)
            Knowledge()
        state = data['sdd_lifecycle']
        self.assertEqual(state['active_originals_bytes_verified'], 7)
        self.assertEqual(state['retired_originals_attestation_only'], 2)
        self.assertEqual(state['retired_extracted_bodies_metadata_only'], 1)
        self.assertEqual(state['historical_layout_identity_states'], {
            'ACTIVE_BYTES_VERIFIED': 3, 'ARCHIVED_ATTESTATION_NOT_REVERIFIED': 5})


if __name__ == '__main__':
    unittest.main()
