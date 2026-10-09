"""Offline mutation checks for the retained programming export baseline."""
import contextlib
import hashlib
import io
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
import build_programming_layout as layouts


def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2) + '\n', encoding='utf-8')


def inventory(out):
    return [{'path': p.relative_to(out).as_posix(), 'bytes': len(p.read_bytes()),
             'sha256': hashlib.sha256(p.read_bytes()).hexdigest()}
            for folder in sorted(set(layouts.FOLDERS.values()))
            for p in sorted((out / folder).rglob('*')) if p.is_file()]


def fixture(base):
    root, snapshot, out = base / 'repo', base / layouts.SNAPSHOT_ID, base / 'out'
    definition = 'CREATE PROC dbo.ReadItem AS SELECT 1;\r\n'
    objects = [{'object_id': 1, 'type': 'P'}, {'object_id': 2, 'type': 'U'}]
    rows = {'modules': [{'object_id': 1, 'definition': definition}], 'parameters': [],
            'columns': [{'object_id': 2, 'column_id': 1, 'name': 'ITEM', 'default_object_id': 0}],
            **{key: [] for key in ('key_constraints', 'check_constraints', 'default_constraints',
                                  'foreign_keys', 'foreign_key_columns', 'triggers', 'trigger_events')}}
    for name, value in rows.items():
        save(snapshot / (name + '.json'), value)
    save(snapshot / 'manifest.json', {'queries': {
        name: {'status': 'CAPTURED', 'file': name + '.json',
               'sha256': layouts.sha(snapshot / (name + '.json'))} for name in rows}})
    save(root / 'DB Architecture/catalog/objects.json', objects)
    save(root / 'DB Architecture/catalog/modules.json', [{'object_id': 1,
         'source_definition_sha256': hashlib.sha256(definition.encode()).hexdigest()}])
    for folder in set(layouts.FOLDERS.values()):
        path = out / folder
        path.mkdir(parents=True)
        (path / 'README.md').write_text('# Captured reference\n', encoding='utf-8')
        # Historical routine folder manifests intentionally have no files array.
        save(path / 'manifest.json', {'snapshot_id': snapshot.name})
    (out / 'SP layout/1.sql').write_bytes(definition.encode())
    (out / 'SP layout/1.md').write_text('# ReadItem\n\nCaptured purpose.\n', encoding='utf-8')
    save(out / 'SP layout/1.json', {'parameters': [], 'module_flags': {},
         'return_metadata': {'scalar_parameters': [], 'columns': []},
         'reviewed_contract': {'purpose': 'Captured purpose.'}, 'table_references': []})
    (out / 'table layout/2.md').write_text('# ITEM\n', encoding='utf-8')
    save(out / 'table layout/2.json', {'raw_catalog_records': {
        key: value for key, value in rows.items() if key not in {'modules', 'parameters'}}})
    save(out / 'evidence/programming-layout-manifest.json', inventory(out))
    return root, snapshot, out


class ProgrammingLayoutVerificationTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.base = Path(self.temp.name)
        self.root, self.snapshot, self.out = fixture(self.base)
        self.manifest = self.out / 'evidence/programming-layout-manifest.json'
        self.original_manifest = self.manifest.read_bytes()

    def verify(self):
        return layouts.verify(self.root, self.snapshot, self.out)

    def command(self, *extra, build=False):
        args = ['build_programming_layout.py', '--root', str(self.root), '--snapshot',
                str(self.snapshot), '--output-root', str(self.out)]
        args += ([] if build else ['--verify-only']) + list(extra)
        with patch.object(sys, 'argv', args), contextlib.redirect_stdout(io.StringIO()) as output:
            code = layouts.main()
        return code, json.loads(output.getvalue())

    def test_intact_capture_verifies_against_complete_retained_inventory(self):
        result = self.verify()
        self.assertEqual(result['status'], 'PASS', result['errors'])
        self.assertEqual(result['output_files'], 11)
        self.assertEqual(result['output_manifest_sha256'], layouts.sha(self.manifest))
        self.assertEqual(self.manifest.read_bytes(), self.original_manifest)

    def test_changed_routine_prose_fails_without_resealing(self):
        path = self.out / 'SP layout/1.md'
        path.write_text('# ReadItem\n\nAn invented behavior.\n', encoding='utf-8')
        self.assertEqual(self.verify()['status'], 'FAIL')
        code, result = self.command()
        self.assertEqual(code, 1)
        self.assertEqual(result['status'], 'FAIL')
        self.assertEqual(self.manifest.read_bytes(), self.original_manifest)

    def test_changed_contract_or_reference_fails_with_unchanged_sql_and_metadata(self):
        path = self.out / 'SP layout/1.json'
        original = path.read_bytes()
        for field, value in [('reviewed_contract', {'purpose': 'Invented purpose.'}),
                             ('table_references', [{'table_id': 999}])]:
            with self.subTest(field=field):
                record = json.loads(original)
                record[field] = value
                save(path, record)
                self.assertEqual(self.verify()['status'], 'FAIL')
        self.assertEqual(self.manifest.read_bytes(), self.original_manifest)

    def test_added_deleted_and_renamed_artifacts_fail(self):
        path = self.out / 'function layout/unregistered.txt'
        path.write_text('unexpected', encoding='utf-8')
        self.assertEqual(self.verify()['status'], 'FAIL')
        path.unlink()
        original = self.out / 'SP layout/1.md'
        renamed = self.out / 'SP layout/renamed.md'
        original.rename(renamed)
        self.assertEqual(self.verify()['status'], 'FAIL')
        renamed.unlink()
        self.assertEqual(self.verify()['status'], 'FAIL')

    def test_missing_and_malformed_manifest_fail_without_recreation(self):
        for content in [b'{broken', b'{}', b'[]']:
            with self.subTest(content=content):
                self.manifest.write_bytes(content)
                self.assertEqual(self.verify()['status'], 'FAIL')
                self.assertEqual(self.manifest.read_bytes(), content)
        self.manifest.unlink()
        code, result = self.command()
        self.assertEqual((code, result['status']), (1, 'FAIL'))
        self.assertFalse(self.manifest.exists())

    def test_duplicate_omitted_unsafe_paths_and_invalid_fingerprints_fail(self):
        original = json.loads(self.original_manifest)
        candidates = [original + [original[0]], original[1:]]
        for path in ['../outside.txt', '/absolute.txt', 'SP layout/../outside.txt',
                     'SP layout\\1.sql', 'SP layout//1.sql', 'C:/outside.txt']:
            candidates.append([{**original[0], 'path': path}, *original[1:]])
        for changes in [{'sha256': 'x'}, {'bytes': -1}, {'bytes': True}, {'bytes': '12'}]:
            candidates.append([{**original[0], **changes}, *original[1:]])
        for index, candidate in enumerate(candidates):
            with self.subTest(index=index):
                save(self.manifest, candidate)
                self.assertEqual(self.verify()['status'], 'FAIL')

    def test_verify_only_preserves_existing_receipt_and_all_files(self):
        receipt = self.out / 'evidence/programming-layout-verification.json'
        receipt.write_bytes(b'historical receipt\n')
        before = {p: p.read_bytes() for p in self.out.rglob('*') if p.is_file()}
        code, result = self.command()
        self.assertEqual((code, result['status']), (0, 'PASS'))
        self.assertEqual({p: p.read_bytes() for p in self.out.rglob('*') if p.is_file()}, before)

    def test_explicit_new_receipt_preserves_baseline(self):
        report = self.root / '_project/new-verification.json'
        code, result = self.command('--verification-output', str(report))
        self.assertEqual((code, result['status']), (0, 'PASS'))
        self.assertEqual(json.loads(report.read_text())['status'], 'PASS')
        self.assertEqual(self.manifest.read_bytes(), self.original_manifest)

    def test_explicit_receipt_cannot_overwrite_or_enter_source_export_folders(self):
        for target in [self.manifest, self.out / 'SP layout/1.json',
                       self.out / 'function layout/new.json', self.snapshot / 'new.json',
                       self.out / 'evidence/programming-layout-build-summary.json',
                       self.root / 'DB Architecture/evidence/programming-layout-table-usage.json',
                       self.root / 'new.txt']:
            with self.subTest(target=target), self.assertRaises(SystemExit):
                self.command('--verification-output', str(target))
        self.assertEqual(self.manifest.read_bytes(), self.original_manifest)

    def test_index_is_required_even_if_removed_from_manifest(self):
        (self.out / 'function layout/README.md').unlink()
        save(self.manifest, inventory(self.out))
        self.assertEqual(self.verify()['status'], 'FAIL')

    def test_invalid_json_artifact_fails_before_parsing_it(self):
        (self.out / 'SP layout/1.json').write_bytes(b'{broken')
        self.assertEqual(self.verify()['status'], 'FAIL')

    def test_successful_explicit_build_can_establish_new_baseline(self):
        with patch('build_routine_layouts.build', return_value={}), \
                patch('build_table_layouts.build', return_value={}), \
                patch('report_table_usage.build_report', return_value={}):
            (self.out / 'SP layout/1.md').write_text('# Regenerated reference\n', encoding='utf-8')
            code, result = self.command(build=True)
        self.assertEqual((code, result['status']), (0, 'PASS'))
        self.assertNotEqual(self.manifest.read_bytes(), self.original_manifest)
        self.assertEqual(self.verify()['status'], 'PASS')

    def test_failed_explicit_build_does_not_promote_new_baseline(self):
        with patch('build_routine_layouts.build', return_value={}), \
                patch('build_table_layouts.build', return_value={}), \
                patch('report_table_usage.build_report', return_value={}):
            (self.out / 'SP layout/1.sql').write_bytes(b'not captured SQL')
            code, result = self.command(build=True)
        self.assertEqual((code, result['status']), (1, 'FAIL'))
        self.assertEqual(self.manifest.read_bytes(), self.original_manifest)


if __name__ == '__main__':
    unittest.main()
