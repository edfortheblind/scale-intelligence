import copy
from io import BytesIO
import json
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest
import zipfile
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from collector import digest, source_identity
import attachment_closure as gate


class ClosureTests(unittest.TestCase):
    def fixture(self, folder):
        root = Path(folder); records = []
        store = SimpleNamespace(root=root, records=lambda module: records)
        for name in (*gate.DISCOVERY_CODE, 'tools/attachment_closure.py', 'tools/collector.py'):
            path = root / name; path.parent.mkdir(parents=True, exist_ok=True); path.write_bytes(name.encode())
        self.add(store, 'A.xsd', b'<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"><xs:include schemaLocation="B.xsd"/></xs:schema>')
        self.add(store, 'B.xsd', b'<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"/>')
        self.bind(store)
        return store

    def add(self, store, name, body):
        url = 'https://travstg.manhscale.com/SCALEHelp/SDK/' + name
        identity = source_identity(url, url); path = 'SDK/source/downloads/' + digest(body) + Path(name).suffix
        target = store.root / path; target.parent.mkdir(parents=True, exist_ok=True); target.write_bytes(body)
        record = {'id': identity['id'], 'module': 'SDK', 'source_url': url, 'final_url': url,
                  'type': 'attachment', 'status': 'BODY_SAVED', 'local_path': path,
                  'sha256': digest(body), 'byte_count': len(body), 'transport_metadata_verified': True, 'http_status': 200}
        store.records('SDK').append(record)
        return record

    def bind(self, store):
        replay = gate.replay(store)
        report = {k: v for k, v in replay.items() if k != 'issues'}
        report.update(module='SDK', code_sha256={p: digest((store.root/p).read_bytes()) for p in gate.DISCOVERY_CODE},
                      fixed_point=True, new_resources=0, all_explicit_dependencies_captured=True,
                      dependency_scan_complete=True, source_syntax_preserved=True, missing_ids=[])
        path = store.root / gate.REPORT; path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(json.dumps(report), encoding='utf-8')
        return report

    def test_source_and_code_bound_complete_closure_passes(self):
        with tempfile.TemporaryDirectory() as folder:
            result = gate.attachment_dependency_proof(self.fixture(folder))
            self.assertTrue(result['passed']); self.assertEqual(result['dependency_occurrences'], 1)

    def test_changed_source_bytes_code_or_metadata_fails(self):
        for mutation in ('source', 'code', 'final_url', 'transport'):
            with self.subTest(mutation=mutation), tempfile.TemporaryDirectory() as folder:
                store = self.fixture(folder); record = store.records('SDK')[0]
                if mutation == 'source': (store.root / record['local_path']).write_bytes(b'corrupted')
                elif mutation == 'code': (store.root / gate.DISCOVERY_CODE[0]).write_bytes(b'changed parser')
                elif mutation == 'final_url': record['final_url'] += '?changed'
                else: record['http_status'] = 403
                self.assertFalse(gate.attachment_dependency_proof(store)['passed'])

    def test_new_attachment_with_undiscovered_child_invalidates_prior_success(self):
        with tempfile.TemporaryDirectory() as folder:
            store = self.fixture(folder)
            self.add(store, 'C.xsd', b'<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"><xs:include schemaLocation="Missing.xsd"/></xs:schema>')
            result = gate.attachment_dependency_proof(store)
            self.assertFalse(result['passed'])
            self.assertIn('ATTACHMENT_DEPENDENCY_NOT_CAPTURED', {i['error'] for i in result['issues']})

    def test_forged_success_flags_cannot_hide_missing_dependency(self):
        with tempfile.TemporaryDirectory() as folder:
            store = self.fixture(folder); store.records('SDK').pop(); self.bind(store)
            self.assertFalse(gate.attachment_dependency_proof(store)['passed'])

    def test_pending_attachment_blocks_even_if_report_claims_fixed_point(self):
        with tempfile.TemporaryDirectory() as folder:
            store = self.fixture(folder); store.records('SDK')[1]['status'] = 'PENDING'; self.bind(store)
            self.assertFalse(gate.attachment_dependency_proof(store)['passed'])

    def test_invalid_json_without_reference_syntax_is_preserved_with_absence_evidence(self):
        with tempfile.TemporaryDirectory() as folder:
            store = self.fixture(folder); record = self.add(store, 'Example.JSON', b'{"field": }'); self.bind(store)
            result = gate.attachment_dependency_proof(store)
            self.assertTrue(result['passed']); self.assertTrue(result['source_syntax_diagnostics'][0]['dependency_inventory_complete'])
            self.assertEqual((store.root / record['local_path']).read_bytes(), b'{"field": }')

    def test_ambiguous_invalid_json_reference_remains_blocked(self):
        with tempfile.TemporaryDirectory() as folder:
            store = self.fixture(folder); self.add(store, 'Example.json', b'{"$ref":"Missing.json",}'); self.bind(store)
            self.assertFalse(gate.attachment_dependency_proof(store)['passed'])

    def test_new_workbook_external_relationship_cannot_inherit_absence_evidence(self):
        with tempfile.TemporaryDirectory() as folder:
            store = self.fixture(folder); archive = BytesIO()
            with zipfile.ZipFile(archive, 'w') as z:
                z.writestr('xl/_rels/workbook.xml.rels', '<Relationships><Relationship Id="r1" TargetMode="External" Target="../linked.xlsx" Type="externalLinkPath"/></Relationships>')
            self.add(store, 'Book.xlsx', archive.getvalue()); self.bind(store)
            result = gate.attachment_dependency_proof(store)
            self.assertFalse(result['passed'])
            self.assertIn('OOXML_EXTERNAL_RELATIONSHIP_REQUIRES_CLASSIFICATION', {i['error'] for i in result['issues']})


if __name__ == '__main__': unittest.main()
