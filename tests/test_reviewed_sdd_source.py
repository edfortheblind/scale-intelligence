"""Provenance and neutral presentation for selected central SDD claims."""
import copy
import hashlib
import json
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from reviewed_sdd_source import CENTRAL_REGISTER, LEGACY_REGISTER, fingerprint, load_claim


class ReviewedSDDSourceTests(unittest.TestCase):
    def setUp(self):
        self.folder = tempfile.TemporaryDirectory()
        self.addCleanup(self.folder.cleanup)
        self.root = Path(self.folder.name)
        self.did = 'sdd-61bfda888fe30365'
        self.original = self.root / 'SDD/Private Customer design.docx'
        self.original.parent.mkdir(parents=True)
        self.original.write_bytes(b'retained original bytes')
        self.original_hash = hashlib.sha256(self.original.read_bytes()).hexdigest()
        self.extracted_path = f'SDD/derived/documents/{self.did}.json'
        self.document = {
            'document_id': self.did, 'source_path': self.original.name,
            'source_sha256': self.original_hash,
            'nodes': [{'id': 'b00001', 'location': 'Private Customer heading',
                       'text': 'UNREVIEWED RAW BODY SHOULD NOT BE RETURNED'}],
        }
        self.write(self.extracted_path, self.document)
        self.reference = {
            'code': 'R01', 'document_id': self.did, 'source_sha256': self.original_hash,
            'extracted_path': self.extracted_path,
            'extracted_sha256': hashlib.sha256((self.root / self.extracted_path).read_bytes()).hexdigest(),
        }
        self.claim = {
            'id': 'reference_functionality', 'statement': 'Reviewed functional explanation.',
            'limits': 'Availability depends on release and configuration.',
            'review_state': 'SOURCE_REVIEWED_BOUNDED',
            'classification': 'REFERENCE_FUNCTIONALITY_WITH_LOCAL_LIMITS',
            'citations': [{'document_id': self.did, 'source_sha256': self.original_hash,
                           'nodes': ['b00001']}],
        }
        self.register = {'claims': [self.claim], 'references': [self.reference]}
        self.source = {
            'register_path': CENTRAL_REGISTER, 'claim_id': self.claim['id'],
            'claim_sha256': fingerprint(self.claim), 'citations': copy.deepcopy(self.claim['citations']),
            'documents': [copy.deepcopy(self.reference)],
        }
        self.write(CENTRAL_REGISTER, self.register)

    def write(self, relative, value):
        target = self.root / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(json.dumps(value), encoding='utf-8')

    def test_central_claim_resolves_private_original_without_disclosing_it(self):
        claim, excerpts = load_claim(self.root, self.source)
        self.assertEqual(claim, self.claim)
        self.assertEqual(excerpts[1]['location'], 'R01 / b00001')
        visible = json.dumps(excerpts)
        self.assertIn(self.original_hash, visible)
        self.assertNotIn('Private Customer', visible)
        self.assertNotIn('UNREVIEWED RAW BODY', visible)
        self.assertNotIn('source_path', visible)

    def test_original_tampering_is_rejected(self):
        self.original.write_bytes(b'changed')
        with self.assertRaisesRegex(ValueError, 'fingerprint'):
            load_claim(self.root, self.source)

    def test_extraction_tampering_is_rejected(self):
        self.document['nodes'][0]['text'] = 'changed'
        self.write(self.extracted_path, self.document)
        with self.assertRaisesRegex(ValueError, 'fingerprint'):
            load_claim(self.root, self.source)

    def test_missing_cited_node_is_rejected_even_with_updated_claim_hash(self):
        self.claim['citations'][0]['nodes'] = ['missing']
        self.source['citations'] = copy.deepcopy(self.claim['citations'])
        self.source['claim_sha256'] = fingerprint(self.claim)
        self.write(CENTRAL_REGISTER, self.register)
        with self.assertRaisesRegex(ValueError, 'unavailable'):
            load_claim(self.root, self.source)

    def test_other_product_reference_is_rejected_even_when_not_cited(self):
        prohibited = dict(self.reference, document_id='sdd-de62bfaf88f5d35b', code='R08')
        self.register['references'].append(prohibited)
        self.write(CENTRAL_REGISTER, self.register)
        with self.assertRaisesRegex(ValueError, 'scope'):
            load_claim(self.root, self.source)

    def test_duplicate_source_binding_is_rejected(self):
        self.source['documents'].append(copy.deepcopy(self.reference))
        with self.assertRaisesRegex(ValueError, 'bindings'):
            load_claim(self.root, self.source)

    def test_central_binding_must_match_reference_and_contain_no_named_path(self):
        for key, value in [('code', 'R02'), ('source_path', 'SDD/Private Customer design.docx'),
                           ('extracted_path', 'SDD/derived/other.json')]:
            with self.subTest(key=key):
                source = copy.deepcopy(self.source)
                source['documents'][0][key] = value
                with self.assertRaisesRegex(ValueError, 'bindings'):
                    load_claim(self.root, source)

    def test_private_original_path_cannot_escape_library(self):
        self.document['source_path'] = '../../outside.docx'
        self.write(self.extracted_path, self.document)
        self.reference['extracted_sha256'] = hashlib.sha256((self.root / self.extracted_path).read_bytes()).hexdigest()
        self.source['documents'] = [copy.deepcopy(self.reference)]
        self.write(CENTRAL_REGISTER, self.register)
        with self.assertRaisesRegex(ValueError, 'outside the library'):
            load_claim(self.root, self.source)

    def test_legacy_register_remains_available_to_historical_consumers(self):
        self.write(LEGACY_REGISTER, {'claims': [self.claim]})
        self.source['register_path'] = LEGACY_REGISTER
        self.source['documents'] = [{
            'document_id': self.did, 'source_path': 'SDD/' + self.original.name,
            'extracted_path': self.extracted_path,
            'extracted_sha256': self.reference['extracted_sha256'],
        }]
        claim, excerpts = load_claim(self.root, self.source)
        self.assertEqual(claim['id'], self.claim['id'])
        self.assertEqual(excerpts[1]['location'], self.did + ' / b00001')

    def test_unapproved_register_path_is_rejected(self):
        self.source['register_path'] = self.extracted_path
        with self.assertRaisesRegex(ValueError, 'register'):
            load_claim(self.root, self.source)


if __name__ == '__main__':
    unittest.main()
