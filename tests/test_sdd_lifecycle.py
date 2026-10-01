"""An archival attestation must never become a normal archive-payload read."""
import copy
import hashlib
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from tools.sdd_lifecycle import (ACTIVE_BYTES_VERIFIED, ARCHIVED_ATTESTATION_NOT_REVERIFIED,
                                 ARCHIVE_PARTS, LIFECYCLE_PATH, check_source_identity,
                                 load_lifecycle, retired_document_map)


class SddLifecycleTests(unittest.TestCase):
    def setUp(self):
        self.folder = tempfile.TemporaryDirectory()
        self.addCleanup(self.folder.cleanup)
        self.root = Path(self.folder.name)
        self.active = self.root / 'SDD/active.docx'
        self.active.parent.mkdir()
        self.active.write_bytes(b'active source')
        self.active_hash = hashlib.sha256(self.active.read_bytes()).hexdigest()
        self.retired_hash = hashlib.sha256(b'retired source').hexdigest()
        self.data = {'schema_version': 1, 'archived': [{
            'original_path': 'SDD/retired.docx', 'archived_path': '.aekr/archive/c20/retired.docx',
            'bytes': 14, 'sha256': self.retired_hash, 'old_path_state': 'ABSENT',
        }], 'retired_documents': []}
        self.save()

    def save(self):
        target = self.root / LIFECYCLE_PATH
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(json.dumps(self.data), encoding='utf-8')

    def add_retired_metadata(self):
        extracted_hash = 'b' * 64
        self.data['archived'].append({
            'original_path': 'SDD/derived/documents/retired.json',
            'archived_path': '.aekr/archive/c20/retired.json', 'bytes': 300,
            'sha256': extracted_hash, 'old_path_state': 'ABSENT',
        })
        row = {'document_id': 'retired', 'source_sha256': self.retired_hash,
               'extracted_path': 'SDD/derived/documents/retired.json',
               'extracted_sha256': extracted_hash,
               'document_metadata': {'document_id': 'retired', 'source_path': 'retired.docx',
                                     'source_sha256': self.retired_hash, 'format': 'docx'},
               'node_metadata': [{'id': 'b00001', 'kind': 'paragraph'}],
               'assets': [], 'review_record_bindings': [{'collection': 'claims', 'index': 0, 'sha256': 'c' * 64}],
               'coverage_record_sha256': 'd' * 64}
        self.data['retired_documents'].append(row)
        self.save()
        return row

    def test_active_bytes_and_archive_attestation_are_distinct(self):
        self.assertEqual(check_source_identity(self.root, 'SDD/active.docx', self.active_hash), ACTIVE_BYTES_VERIFIED)
        # No archive destination exists: this result deliberately does not prove
        # current archive storage integrity or restoration readiness.
        self.assertEqual(check_source_identity(self.root, 'SDD/retired.docx', self.retired_hash),
                         ARCHIVED_ATTESTATION_NOT_REVERIFIED)

    def test_active_tampering_and_archived_identity_mismatch_are_rejected(self):
        self.active.write_bytes(b'changed')
        with self.assertRaisesRegex(ValueError, 'Active SDD source fingerprint'):
            check_source_identity(self.root, 'SDD/active.docx', self.active_hash)
        with self.assertRaisesRegex(ValueError, 'attestation identity'):
            check_source_identity(self.root, 'SDD/retired.docx', '0' * 64)

    def test_absent_old_path_cannot_reappear_as_current_source(self):
        (self.root / 'SDD/retired.docx').write_bytes(b'retired source')
        with self.assertRaisesRegex(ValueError, 'must be absent'):
            check_source_identity(self.root, 'SDD/retired.docx', self.retired_hash)

    def test_redirect_bytes_are_not_misreported_as_original_verification(self):
        self.data['archived'][0]['old_path_state'] = 'REDIRECT'
        self.save()
        with self.assertRaisesRegex(ValueError, 'redirect is missing'):
            check_source_identity(self.root, 'SDD/retired.docx', self.retired_hash)
        (self.root / 'SDD/retired.docx').write_text('See the current reference.', encoding='utf-8')
        self.assertEqual(check_source_identity(self.root, 'SDD/retired.docx', self.retired_hash),
                         ARCHIVED_ATTESTATION_NOT_REVERIFIED)

    def test_archive_input_and_escaping_paths_are_rejected(self):
        for relative in ['../outside', '/absolute', 'C:/outside', 'SDD\\retired.docx',
                         '.aekr/archive/c20/retired.docx', 'SDD//active.docx']:
            with self.subTest(path=relative):
                with self.assertRaises(ValueError):
                    check_source_identity(self.root, relative, self.active_hash)

    def test_case_insensitive_original_and_destination_collisions_are_rejected(self):
        first = self.data['archived'][0]
        for duplicate in [dict(first, original_path='sdd/RETIRED.docx', archived_path='.aekr/archive/c20/other.docx'),
                          dict(first, original_path='SDD/other.docx')]:
            with self.subTest(duplicate=duplicate):
                self.data['archived'] = [first, duplicate]
                self.save()
                with self.assertRaisesRegex(ValueError, 'colliding'):
                    load_lifecycle(self.root)

    def test_archive_destination_must_be_a_relative_archive_locator(self):
        for destination in ['SDD/current.docx', '../archive/source', 'C:/archive/source']:
            with self.subTest(destination=destination):
                self.data['archived'][0]['archived_path'] = destination
                self.save()
                with self.assertRaises(ValueError):
                    load_lifecycle(self.root)

    def test_retired_map_preserves_metadata_without_reconstructing_text(self):
        row = self.add_retired_metadata()
        self.assertEqual(retired_document_map(self.root), {'retired': row})
        row['node_metadata'][0]['text'] = 'Source body must not be embedded here'
        self.save()
        with self.assertRaisesRegex(ValueError, 'source text'):
            retired_document_map(self.root)

    def test_retired_source_extraction_and_node_identity_drift_are_rejected(self):
        row = self.add_retired_metadata()
        original = copy.deepcopy(row)
        mutations = [lambda r: r.update(extracted_sha256='e' * 64),
                     lambda r: r['document_metadata'].update(source_sha256='e' * 64),
                     lambda r: r['node_metadata'].append(dict(r['node_metadata'][0]))]
        for mutate in mutations:
            with self.subTest(mutation=mutate):
                self.data['retired_documents'] = [copy.deepcopy(original)]
                mutate(self.data['retired_documents'][0])
                self.save()
                with self.assertRaises(ValueError):
                    load_lifecycle(self.root)

    def test_read_trap_proves_normal_helpers_never_open_archive_payload(self):
        self.add_retired_metadata()
        destination = self.root / self.data['archived'][0]['archived_path']
        destination.parent.mkdir(parents=True)
        destination.write_bytes(b'archive payload')
        original_bytes, original_text = Path.read_bytes, Path.read_text
        def guard(path):
            if {p.casefold() for p in path.parts} & ARCHIVE_PARTS:
                raise AssertionError('Archive payload read attempted')
        def read_bytes(path):
            guard(path)
            return original_bytes(path)
        def read_text(path, *args, **kwargs):
            guard(path)
            return original_text(path, *args, **kwargs)
        with patch.object(Path, 'read_bytes', read_bytes), patch.object(Path, 'read_text', read_text):
            load_lifecycle(self.root)
            retired_document_map(self.root)
            self.assertEqual(check_source_identity(self.root, 'SDD/active.docx', self.active_hash), ACTIVE_BYTES_VERIFIED)
            self.assertEqual(check_source_identity(self.root, 'SDD/retired.docx', self.retired_hash),
                             ARCHIVED_ATTESTATION_NOT_REVERIFIED)


if __name__ == '__main__':
    unittest.main()
