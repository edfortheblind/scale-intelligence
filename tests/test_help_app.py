"""Behavior and access boundaries of the read-only local help browser."""
import copy
from http.client import HTTPConnection
import json
from pathlib import Path
import sys
import tempfile
import threading
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
from help_knowledge import Knowledge, ROOT
from serve_help import create_server
from render_help_page import render_page
from reviewed_sdd_source import load_claim
from reviewed_process_source import load_refinement


class HelpKnowledgeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.knowledge = Knowledge()

    def test_curated_answer_preserves_exact_text_and_citations(self):
        original = self.knowledge.topics['shipment-detail']
        answer = self.knowledge.topic('shipment-detail')
        self.assertEqual(answer['what_it_does'], original['plain_answer'])
        self.assertIn('shipment-detail-sql', [s['source_id'] for s in answer['sources']])
        self.assertEqual(len(answer['what_happens']), len(original['execution_steps']))
        self.assertTrue(answer['evidence_limits'])

    def test_source_markup_and_search_are_inert_in_native_html(self):
        attack = '<img src=x onerror=alert(1)>'
        data = copy.copy(self.knowledge)
        data.topics = copy.deepcopy(data.topics)
        data.topics['shipment-detail']['plain_answer'] = attack
        rendered = render_page(data, question=attack, topic_id='shipment-detail').decode()
        self.assertIn('&lt;img src=x onerror=alert(1)&gt;', rendered)
        self.assertNotIn(attack, rendered)
        self.assertNotIn('<script', rendered)
        self.assertIn('href="#main"', rendered)
        self.assertIn('label for="question"', rendered)

    def test_blank_invoice_question_retrieves_explanation(self):
        result = self.knowledge.search('Why is the invoice blank in my summary?')
        self.assertEqual(result['results'][0]['topic_id'], 'shipment-detail')

    def test_explicit_process_name_outranks_incidental_confirmation(self):
        result = self.knowledge.search('Help me confirm the locating behavior')
        self.assertEqual(result['results'][0]['topic_id'], 'process-locating')

    def test_unrecognized_query_does_not_invent_an_answer(self):
        result = self.knowledge.search('zzqvunknownsubjectz')
        self.assertEqual(result['state'], 'NO_REVIEWED_MATCH')
        self.assertEqual(result['results'], [])

    def test_fts_operators_are_literal_input(self):
        result = self.knowledge.search('" OR title:* - ( SELECT 1; DROP TABLE topics; --')
        self.assertIn(result['state'], {'NO_REVIEWED_MATCH', 'REVIEWED_MATCHES'})
        self.assertEqual(self.knowledge.topic('shipment-detail')['topic_id'], 'shipment-detail')

    def test_limits_and_empty_input(self):
        self.assertEqual(self.knowledge.search('')['state'], 'EMPTY_QUERY')
        with self.assertRaises(ValueError):
            self.knowledge.search('a'*501)
        with self.assertRaises(KeyError):
            self.knowledge.topic('../credentials')
        with self.assertRaises(ValueError):
            render_page(self.knowledge, ' '*501)

    def test_source_paths_cannot_escape_root(self):
        with self.assertRaises(ValueError):
            self.knowledge._path('../outside.txt')

    def test_modified_source_hash_prevents_startup(self):
        data = copy.deepcopy(self.knowledge.data)
        source = next(s for s in data['sources'].values() if s['kind'] == 'DEPLOYED_SQL_STATIC')
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            (root/'DB Architecture/mappings').mkdir(parents=True)
            (root/'DB Architecture/sql').mkdir()
            source['reading_path'] = 'DB Architecture/sql/tampered.sql'
            (root/source['reading_path']).write_text('changed source', encoding='utf-8')
            data['sources'] = {'tampered': source}
            (root/'DB Architecture/mappings/help-topics.json').write_text(json.dumps(data), encoding='utf-8')
            with self.assertRaisesRegex(ValueError, 'fingerprint'):
                Knowledge(root)

    def test_evaluation_questions_are_excluded_from_search_index(self):
        # Prevent answer-key leakage: only reviewed narrative is indexed.
        unique = 'zspecificheldoutphraseq'
        topic = self.knowledge.topics['shipment-detail']
        self.assertNotIn(unique, ' '.join(self.knowledge.rows[0]))
        self.assertNotIn('must_not_claim', ' '.join(self.knowledge.rows[0]))
        self.assertNotIn('Five SELECT statements necessarily produce five results.', ' '.join(self.knowledge.rows[0]))

    def test_sdd_claim_fingerprint_drift_is_rejected(self):
        source = copy.deepcopy(self.knowledge.sources['sdd-boundary-land-product-boundary'])
        source['claim_sha256'] = 'changed'
        with self.assertRaisesRegex(ValueError, 'fingerprint'):
            load_claim(ROOT, source)

    def test_sdd_answer_preserves_product_limit_and_excludes_raw_body(self):
        answer = self.knowledge.topic('product-version-compatibility')
        self.assertIn('Manhattan Active Warehouse Management', answer['what_it_does'])
        source = self.knowledge.source('sdd-boundary-land-product-boundary')
        self.assertIn('ineligible for production indexing', source['qualification'])
        self.assertEqual(len(source['excerpts']), 3)
        self.assertTrue(all('Source location:' in e['text'] for e in source['excerpts'][1:]))

    def test_sdd_claim_cannot_bind_another_document(self):
        source = copy.deepcopy(self.knowledge.sources['sdd-boundary-land-product-boundary'])
        source['documents'][0]['document_id'] = 'unreviewed'
        with self.assertRaisesRegex(ValueError, 'bindings'):
            load_claim(ROOT, source)

    def test_vendor_text_tampering_with_unchanged_original_hash_is_rejected(self):
        source=next(s for s in self.knowledge.sources.values() if s['kind']=='VENDOR_DOCUMENTATION')
        relative=f"{source['module']}/data/articles/{source['article_id']}.json"
        with tempfile.TemporaryDirectory() as folder:
            root=Path(folder)
            original=root/source['source_path']; original.parent.mkdir(parents=True)
            original.write_bytes((ROOT/source['source_path']).read_bytes())
            target=root/relative; target.parent.mkdir(parents=True)
            article=json.loads((ROOT/relative).read_text(encoding='utf-8'))
            article['title']='Altered title while original hash stays unchanged'
            target.write_text(json.dumps(article),encoding='utf-8')
            copied=copy.copy(self.knowledge);copied.root=root.resolve()
            with self.assertRaisesRegex(ValueError,'fingerprint'):
                copied._load_source('tampered-vendor',source)

    def test_stale_vendor_manifest_generation_is_rejected(self):
        with tempfile.TemporaryDirectory() as folder:
            root=Path(folder);(root/'DB Architecture/mappings').mkdir(parents=True);(root/'help_app').mkdir()
            (root/'DB Architecture/mappings/help-topics.json').write_bytes(self.knowledge.path.read_bytes())
            manifest=copy.deepcopy(self.knowledge.vendor_manifest)
            manifest['knowledge_generation_sha256']='older generation'
            (root/'help_app/vendor-source-manifest.json').write_text(json.dumps(manifest),encoding='utf-8')
            with self.assertRaisesRegex(ValueError,'another knowledge generation'):
                Knowledge(root)

    def test_changed_reviewed_contract_is_rejected_before_indexing(self):
        relative,binding=next(iter(self.knowledge.vendor_manifest['semantic_batches'].items()))
        with tempfile.TemporaryDirectory() as folder:
            root=Path(folder)
            (root/'DB Architecture/mappings').mkdir(parents=True)
            (root/'help_app').mkdir()
            (root/'DB Architecture/mappings/help-topics.json').write_bytes(self.knowledge.path.read_bytes())
            manifest=copy.deepcopy(self.knowledge.vendor_manifest)
            manifest['semantic_batches']={relative:binding}
            (root/'help_app/vendor-source-manifest.json').write_text(json.dumps(manifest),encoding='utf-8')
            target=root/relative;target.parent.mkdir(parents=True)
            batch=json.loads((ROOT/relative).read_text(encoding='utf-8'))
            batch['semantic_contracts'][0]['purpose']='Altered behavior without a reviewed manifest update'
            target.write_text(json.dumps(batch),encoding='utf-8')
            # Isolate contract verification from the separately tested source loaders.
            with patch.object(Knowledge,'_load_source',return_value={}):
                with self.assertRaisesRegex(ValueError,'Source fingerprint changed: DB Architecture/mappings/batches/'):
                    Knowledge(root)

    def test_routine_detail_search_preserves_the_supporting_source(self):
        result=self.knowledge.search('ISNUMERIC')
        match=next(r for r in result['results'] if r['topic_id']=='labor-log-and-consolidation')
        self.assertIn('ISNUMERIC',match['matching_detail'])
        self.assertEqual(self.knowledge.sources[match['matching_source_id']]['object_id'],776702165)
        detail=next(d for d in self.knowledge.topic(match['topic_id'])['reviewed_details'] if d['object_id']==776702165)
        self.assertTrue(detail['batch_sha256'])

    def test_routine_detail_markup_is_inert(self):
        copied=copy.copy(self.knowledge)
        copied.contracts=copy.deepcopy(self.knowledge.contracts)
        payload='<script>unexpected()</script>'
        copied.contracts[776702165]['sections'][0]['items'].append(payload)
        html=render_page(copied,topic_id='labor-log-and-consolidation').decode()
        self.assertNotIn(payload,html)
        self.assertIn('&lt;script&gt;unexpected()&lt;/script&gt;',html)
        self.assertIn('Reviewed routine behavior and limits',html)

    def test_process_refinements_keep_qualifications_and_exact_nodes(self):
        topic=self.knowledge.topic('process-allocation')
        self.assertEqual(len(topic['documentary_refinements']),4)
        refinement=topic['documentary_refinements'][0]
        source=self.knowledge.source(refinement['evidence_ref'])
        self.assertEqual(source['excerpts'][0]['text'],refinement['statement'])
        self.assertIn('nodes n',source['excerpts'][1]['text'])
        self.assertIn('unestablished',source['qualification'])
        html=render_page(self.knowledge,topic_id='process-allocation').decode()
        self.assertIn('not a new execution sequence',html)

    def test_process_claim_identity_drift_is_rejected(self):
        source=copy.deepcopy(next(s for s in self.knowledge.sources.values() if s['kind']=='REVIEWED_PROCESS_CLAIM'))
        source['claim_sha256']='changed'
        with self.assertRaisesRegex(ValueError,'claim fingerprint changed'):
            load_refinement(ROOT,source)

    def test_process_original_tampering_is_rejected(self):
        source=next(s for s in self.knowledge.sources.values() if s['kind']=='REVIEWED_PROCESS_CLAIM')
        register=json.loads((ROOT/source['register_path']).read_text(encoding='utf-8'))
        family=next(f for f in register['families'] if f['id']==source['family_id'])
        claim=next(c for c in family['refinements'] if c['id']==source['claim_id'])
        original_relative=claim['sources'][0]['source_path']
        with tempfile.TemporaryDirectory() as folder:
            root=Path(folder)
            target=root/source['register_path'];target.parent.mkdir(parents=True)
            target.write_bytes((ROOT/source['register_path']).read_bytes())
            original=root/original_relative;original.parent.mkdir(parents=True)
            original.write_text('Altered vendor original',encoding='utf-8')
            with self.assertRaisesRegex(ValueError,'Process source fingerprint changed: AIM/source/'):
                load_refinement(root,source)


class HelpHTTPTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.server = create_server(0)
        cls.thread = threading.Thread(target=cls.server.serve_forever, daemon=True)
        cls.thread.start()

    @classmethod
    def tearDownClass(cls):
        cls.server.shutdown()
        cls.server.server_close()
        cls.thread.join(timeout=2)

    def request(self, path, method='GET', headers=None):
        conn = HTTPConnection('127.0.0.1', self.server.server_port, timeout=5)
        conn.request(method, path, headers=headers or {})
        response = conn.getresponse()
        result = (response.status, dict(response.getheaders()), response.read())
        conn.close()
        return result

    def test_browser_assets_and_answer_endpoint(self):
        status, headers, body = self.request('/')
        self.assertEqual(status, 200)
        self.assertIn(b'SCALE Knowledge', body)
        self.assertIn("frame-ancestors 'none'", headers['Content-Security-Policy'])
        self.assertIn("script-src 'none'", headers['Content-Security-Policy'])
        status, _, body = self.request('/api/topics/shipment-detail')
        self.assertEqual(status, 200)
        self.assertTrue(json.loads(body)['sources'])
        status, _, body = self.request('/topic/shipment-detail')
        self.assertEqual(status, 200)
        self.assertIn(b'What you can check', body)
        self.assertIn(b'Source SHA-256', body)

    def test_arbitrary_files_and_traversal_are_not_served(self):
        for path in ['/dbstring.txt', '/.aekr/WORK.md', '/../README.md', '/%2e%2e/README.md', '/DB%20Architecture/catalog/objects.json']:
            with self.subTest(path=path):
                self.assertEqual(self.request(path)[0], 404)

    def test_dns_rebinding_and_external_origin_rejected(self):
        self.assertEqual(self.request('/api/status', headers={'Host': 'external.example'})[0], 403)
        self.assertEqual(self.request('/api/status', headers={'Origin': 'https://external.example'})[0], 403)

    def test_mutations_and_duplicate_query_are_rejected(self):
        self.assertEqual(self.request('/api/topics', method='POST')[0], 405)
        self.assertEqual(self.request('/api/search?q=a&q=b')[0], 400)
        self.assertEqual(self.request('/api/search?path=secret')[0], 400)

    def test_second_server_cannot_reuse_active_preview_port(self):
        with self.assertRaises(OSError):
            create_server(self.server.server_port, self.server.RequestHandlerClass.keywords['knowledge'])


if __name__ == '__main__':
    unittest.main()
