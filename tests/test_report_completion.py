"""Completion reports must not silently omit or reuse stale scenario evidence."""
import json
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
import report_completion


class ReportReceiptTests(unittest.TestCase):
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


if __name__ == '__main__':
    unittest.main()
