"""TAB design search stays source-bound, qualified and separate from procedures."""
import copy
from html import escape
from http.client import HTTPConnection
import json
from pathlib import Path
import re
import sys
import threading
import unittest
from unittest.mock import patch
from urllib.parse import quote

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
from help_guides import EVIDENCE, GuideLibrary, MANIFEST, ROOT, TAB_SCOPE, TAB_SOURCES, fingerprint, make_manifest
from help_knowledge import Knowledge
from render_help_guides import inline, render_guide, render_source, tab_search
from serve_help import create_server


class TabHelpTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.guides = GuideLibrary()

    def changed_inputs(self, replacements, operation):
        original = Path.read_bytes
        replacements = {(ROOT/path).resolve(): raw for path, raw in replacements.items()}
        def read(path):
            return replacements[path.resolve()] if path.resolve() in replacements else original(path)
        with patch.object(Path, 'read_bytes', read):
            return operation()

    def manifest_bytes(self, manifest):
        return json.dumps(manifest).encode('utf-8')

    def test_every_claim_has_full_search_qualifications_and_a_focusable_landing(self):
        self.assertEqual(len(self.guides.tab_sections), 69)
        _, html = render_guide(self.guides, 'tab-design')
        for claim in self.guides.tab_sections:
            with self.subTest(claim=claim['id']):
                hits = self.guides.search_tab_design(claim['id'])['results']
                hit = next(row for row in hits if row['id'] == claim['id'])
                self.assertEqual(hit['statement'], claim['statement'])
                self.assertEqual(hit['conditions_and_limits'], claim['conditions_and_limits'])
                self.assertEqual(hit['refs'], claim['refs'])
                self.assertFalse(hit['current_runtime_verified'])
                self.assertEqual(hit['evidence_class'], 'DOCUMENTARY_DESIGN_ONLY')
                self.assertEqual(hit['scope'], TAB_SCOPE)
                anchor = 'id="'+claim['anchor']+'" tabindex="-1"'
                self.assertEqual(html.count(anchor), 1)
                landing = html.split(anchor, 1)[1].split('<h4', 1)[0]
                self.assertIn(escape(TAB_SCOPE), landing)
                self.assertIn('href="#how-the-two-designs-fit-together"', landing)
                for limit in claim['conditions_and_limits']:
                    self.assertIn(escape(limit), landing)

    def test_long_qualifiers_are_escaped_without_truncation(self):
        library = copy.copy(self.guides)
        claim = copy.deepcopy(library.tab_sections[0])
        claim['conditions_and_limits'] = ['condition '*100+'<script>unsafe</script> FINAL LIMIT']
        library.tab_sections = [claim]
        hit = library.search_tab_design(claim['id'])['results'][0]
        self.assertEqual(hit['conditions_and_limits'], claim['conditions_and_limits'])
        html = tab_search(library, claim['id'])
        self.assertIn('FINAL LIMIT', html)
        self.assertIn('&lt;script&gt;unsafe&lt;/script&gt;', html)
        self.assertNotIn('<script>', html)

    def test_every_claim_exposes_all_cited_passages_after_its_explanation(self):
        _, html = render_guide(self.guides, 'tab-design')
        citation_count = 0
        for claim in self.guides.tab_sections:
            with self.subTest(claim=claim['id']):
                landing = html.split('id="'+claim['anchor']+'" tabindex="-1"', 1)[1]
                landing = re.split(r'<h[2-6]\b', landing, maxsplit=1)[0]
                disclosure = re.search(r'<details class="tab-citations">(.*?)</details>', landing)
                self.assertIsNotNone(disclosure)
                citations = disclosure.group(1)
                self.assertIn('<summary>All '+str(len(claim['refs']))+' cited source passages</summary>', citations)
                self.assertLess(landing.index(escape(claim['statement'])), disclosure.start())
                for limit in claim['conditions_and_limits']:
                    self.assertLess(landing.index(escape(limit)), disclosure.start())
                actual = re.findall(r'<a href="([^"]+)">([^<]+)</a>', citations)
                expected = []
                for ref in claim['refs']:
                    source = self.guides.sources['tab/'+ref['document_id']]
                    node = next(node for node in source['nodes'] if node['id'] == ref['node_id'])
                    self.assertEqual(ref['location'], node['location'])
                    href = '/guide-source/tab/'+ref['document_id']+'#'+ref['node_id']
                    label = ref['node_id']+': '+source['title']+' — '+ref['location']
                    expected.append((escape(href, quote=True), escape(label)))
                self.assertEqual(actual, expected)
                citation_count += len(actual)
        self.assertEqual(citation_count, 510)
        self.assertEqual(html.count('<details class="tab-citations">'), 69)

    def test_complete_citation_disclosure_escapes_source_text_and_link_attributes(self):
        library = copy.copy(self.guides)
        library.tab_sections = copy.deepcopy(self.guides.tab_sections)
        library.sources = copy.deepcopy(self.guides.sources)
        claim = library.tab_sections[0]
        ref = claim['refs'][0]
        source = library.sources['tab/'+ref['document_id']]
        source['title'] = '<script>hostile title</script>'
        ref['location'] = '<img src=x onerror=alert(1)>'
        ref['node_id'] = 'node" onclick="alert(1)'
        _, html = render_guide(library, 'tab-design')
        disclosure = re.search(r'<details class="tab-citations">(.*?)</details>', html)
        self.assertIsNotNone(disclosure)
        citations = disclosure.group(1)
        href = '/guide-source/tab/'+ref['document_id']+'#'+ref['node_id']
        label = ref['node_id']+': '+source['title']+' — '+ref['location']
        self.assertIn('href="'+escape(href, quote=True)+'"', citations)
        self.assertIn(escape(label), citations)
        for active in ['<script>', '<img', ' onclick="']:
            self.assertNotIn(active, citations)

    def test_tab_node_citations_have_source_titles_and_keep_exact_visible_labels(self):
        guide = self.guides.guides['tab-design']
        tested_types = set()
        for identity in TAB_SOURCES:
            source = self.guides.sources['tab/'+identity]
            for node in source['nodes']:
                node_id = node['id']
                rendered = inline('['+node_id+'](tab-core/reading/'+identity+'.md#'+node_id+')', guide, self.guides)
                with self.subTest(source=identity, node=node_id):
                    self.assertIn('aria-label="'+escape(node_id+': '+source['title']+', source', quote=True)+'"', rendered)
                    self.assertIn('>'+node_id+'</a>', rendered)
                    self.assertIn('href="/guide-source/tab/'+identity+'#'+node_id+'"', rendered)
                if node_id.startswith('part-comments'):
                    tested_types.add('comment')
                elif node_id.startswith('b'):
                    tested_types.add('docx_text')
                elif node_id.startswith('p'):
                    tested_types.add('pdf_text')
        self.assertEqual(tested_types, {'comment', 'docx_text', 'pdf_text'})

    def test_tab_search_never_changes_the_procedure_corpus_or_results(self):
        library = copy.copy(self.guides)
        questions = ['Assign Printer', 'receipt container', 'short pick', 'SRC400', 'SRC 440']
        expected = [library.search(question) for question in questions]
        library.tab_sections = [{**library.tab_sections[0], 'text': 'Assign Printer receipt container short pick '*100}]
        self.assertEqual([library.search(question) for question in questions], expected)
        self.assertNotIn('tab-design', {row['guide_id'] for row in library.sections})
        self.assertNotIn('tab-design', {row['guide_id'] for row in library.listing()})
        self.assertNotIn('scale-reference', {row['guide_id'] for row in library.sections})

    def test_search_bounds_and_empty_terms(self):
        for question in ['', 'the and a', 'unrecognizablezxqv']:
            self.assertEqual(self.guides.search_tab_design(question)['results'], [])
        for question in ['x'*501, None, 10]:
            with self.assertRaises(ValueError):
                self.guides.search_tab_design(question)
        self.assertLessEqual(len(self.guides.search_tab_design('receipt', 999)['results']), 20)

    def test_source_nodes_are_exact_literal_text_with_inert_untrusted_markup(self):
        library = copy.copy(self.guides)
        library.sources = dict(library.sources)
        key = 'tab/'+next(iter(TAB_SOURCES))
        doc = copy.deepcopy(library.sources[key])
        doc['nodes'] = [{'id': 'b00005', 'location': '<b>Word location</b>',
                         'text': '<script>alert(1)</script>\n<img src=x onerror=alert(1)> [Run](https://example.com)'}]
        library.sources[key] = doc
        _, html = render_source(library, key)
        self.assertIn('id="b00005" tabindex="-1"', html)
        self.assertIn(escape(doc['nodes'][0]['text']), html)
        self.assertIn('&lt;b&gt;Word location&lt;/b&gt;', html)
        for active in ['<script>', '<img', 'href="https:']:
            self.assertNotIn(active, html)
        self.assertIn('Original SHA-256:', html)

    def test_all_tab_source_nodes_have_unique_anchors(self):
        for identity in TAB_SOURCES:
            key = 'tab/'+identity
            _, html = render_source(self.guides, key)
            for node in self.guides.sources[key]['nodes']:
                self.assertEqual(html.count('id="'+node['id']+'" tabindex="-1"'), 1)
                self.assertIn(escape(node['text']), html)

    def test_missing_or_extra_tab_manifest_binding_fails_closed(self):
        for replacement in [{}, {**self.guides.manifest['tab_sources'], 'unknown': {}}]:
            manifest = copy.deepcopy(self.guides.manifest)
            manifest['tab_sources'] = replacement
            with self.assertRaisesRegex(ValueError, 'TAB source manifest'):
                self.changed_inputs({MANIFEST: self.manifest_bytes(manifest)}, GuideLibrary)

    def test_damaged_original_is_rejected_at_build_and_startup(self):
        original_path = next(iter(TAB_SOURCES.values()))[1]
        for operation in [make_manifest, GuideLibrary]:
            with self.subTest(operation=operation.__name__), self.assertRaisesRegex(ValueError, 'TAB original fingerprint'):
                self.changed_inputs({original_path: b'damaged original'}, operation)

    def test_damaged_document_is_rejected_before_serving(self):
        binding = next(iter(self.guides.manifest['tab_sources'].values()))
        path = binding['document_path']
        with self.assertRaisesRegex(ValueError, 'TAB document/source binding'):
            self.changed_inputs({path: b'{"damaged":true}'}, GuideLibrary)

    def test_manifest_cannot_admit_an_arbitrary_original_path(self):
        register = copy.deepcopy(self.guides.evidence['tab-sources'])
        register['sources'][0]['path'] = '../private.docx'
        raw = self.manifest_bytes(register)
        manifest = copy.deepcopy(self.guides.manifest)
        manifest['evidence']['tab-sources']['sha256'] = fingerprint(raw)
        replacements = {MANIFEST: self.manifest_bytes(manifest), EVIDENCE['tab-sources']: raw}
        for operation in [make_manifest, GuideLibrary]:
            with self.subTest(operation=operation.__name__), self.assertRaisesRegex(ValueError, 'TAB source path'):
                self.changed_inputs(replacements, operation)

    def test_rebound_document_cannot_hide_a_missing_claim_node(self):
        identity = next(iter(TAB_SOURCES))
        path = 'SDD/tab-core/documents/'+identity+'.json'
        document = json.loads((ROOT/path).read_bytes())
        claimed = self.guides.tab_sections[0]['refs'][0]['node_id']
        document['nodes'] = [node for node in document['nodes'] if node['id'] != claimed]
        raw = self.manifest_bytes(document)
        manifest = copy.deepcopy(self.guides.manifest)
        manifest['tab_sources'][identity]['document_sha256'] = fingerprint(raw)
        with self.assertRaisesRegex(ValueError, 'TAB claim source node binding'):
            self.changed_inputs({MANIFEST: self.manifest_bytes(manifest), path: raw}, GuideLibrary)


class TabHelpHTTPTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.guides = GuideLibrary()
        cls.knowledge = Knowledge()
        cls.server = create_server(0, cls.knowledge, cls.guides)
        cls.thread = threading.Thread(target=cls.server.serve_forever, daemon=True)
        cls.thread.start()

    @classmethod
    def tearDownClass(cls):
        cls.server.shutdown()
        cls.server.server_close()
        cls.thread.join(timeout=2)

    def request(self, path):
        connection = HTTPConnection('127.0.0.1', self.server.server_port, timeout=10)
        connection.request('GET', path)
        response = connection.getresponse()
        result = response.status, dict(response.getheaders()), response.read()
        connection.close()
        return result

    def test_home_browsing_and_search_expose_separate_tab_design_group(self):
        _, _, home = self.request('/')
        self.assertIn(b'TAB design reference', home)
        self.assertIn(b'href="/guide/tab-design#guide-content"', home)
        query = 'receipt container'
        _, _, page = self.request('/?q='+quote(query))
        for group in [b'Search results', b'Procedure guide matches', b'TAB design matches']:
            self.assertIn(group, page)
        self.assertIn(escape(TAB_SCOPE).encode(), page)
        code, _, body = self.request('/api/tab-design-search?q='+quote(query))
        self.assertEqual(code, 200)
        self.assertEqual(json.loads(body), self.guides.search_tab_design(query))
        _, _, body = self.request('/api/search?q='+quote(query))
        self.assertEqual(json.loads(body), self.knowledge.search(query))
        _, _, body = self.request('/api/guide-search?q='+quote(query))
        self.assertEqual(json.loads(body), self.guides.search(query))

    def test_tab_source_evidence_routes_and_invalid_paths(self):
        for identity in TAB_SOURCES:
            code, headers, body = self.request('/guide-source/tab/'+identity)
            self.assertEqual(code, 200)
            self.assertIn("script-src 'none'", headers['Content-Security-Policy'])
            self.assertIn(b'Original SHA-256:', body)
        for key in ['tab-sources', 'tab-reconciliation', 'tab-coverage', 'tab-visual', 'tab-po-direction']:
            self.assertEqual(self.request('/guide-evidence/'+key)[0], 200)
        for path in ['/guide-source/tab/unknown', '/guide-source/tab/../../.aekr/private',
                     '/guide-source/tab/%2e%2e%2fprivate', '/SDD/tab-core-sources.json']:
            self.assertEqual(self.request(path)[0], 404)
        for query in ['q=a&q=b', 'q=a&other=b', 'q='+'x'*501]:
            self.assertEqual(self.request('/api/tab-design-search?'+query)[0], 400)

    def test_reconciled_po_answer_and_dated_owner_proof_are_served_together(self):
        status, _, body = self.request('/api/tab-design-search?q=PO')
        self.assertEqual(status, 200)
        row = next(row for row in json.loads(body)['reconciliations'] if row['id'] == 'R04')
        status, headers, body = self.request(row['owner_evidence']['href'].split('#')[0])
        self.assertEqual(status, 200)
        self.assertIn("script-src 'none'", headers['Content-Security-Policy'])
        self.assertIn(escape(row['owner_evidence']['statement']).encode(), body)
        self.assertIn(row['owner_evidence']['date'].encode(), body)
        self.assertNotIn(b'S3-PROD-01', body)


if __name__ == '__main__':
    unittest.main()
