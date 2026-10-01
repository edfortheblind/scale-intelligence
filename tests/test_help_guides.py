"""Procedure-guide rendering, discovery and read-only resource boundaries."""
from html.parser import HTMLParser
from http.client import HTTPConnection
import copy
import json
from pathlib import Path
import re
import sys
import tempfile
import threading
import unittest
from urllib.parse import quote, urlsplit

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
from help_guides import GuideLibrary, ROOT, MANIFEST, GUIDES, guide_blocks, fingerprint
from help_knowledge import Knowledge
from render_help_guides import render_guide, render_source, source_title, guide_search, inline
from serve_help import create_server


class Elements(HTMLParser):
    def __init__(self, html):
        super().__init__()
        self.ids, self.links = [], []
        self.feed(html)

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        if 'id' in attrs:
            self.ids.append(attrs['id'])
        if tag == 'a' and 'href' in attrs:
            self.links.append(attrs['href'])


class GuideTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.guides = GuideLibrary()

    def test_all_searchable_sections_resolve_to_unique_focusable_fragments(self):
        for key in self.guides.guides:
            _, html = render_guide(self.guides, key)
            parsed = Elements(html)
            self.assertEqual(len(parsed.ids), len(set(parsed.ids)), key)
            for section in self.guides.sections:
                if section['guide_id'] == key:
                    self.assertIn(section['anchor'], parsed.ids)
                    self.assertIn('id="'+section['anchor']+'" tabindex="-1"', html)

    def test_step_numbering_table_headers_and_inert_markup(self):
        blocks, _ = guide_blocks('# Test\n\n3. Third step\n4. Fourth step\n\n| Field | Meaning |\n| --- | --- |\n| LP | License plate |')
        self.assertEqual(blocks[1]['start'], 3)
        library = copy.copy(self.guides)
        library.guides = dict(library.guides)
        guide = dict(library.guides['mobile'])
        guide.update(blocks=blocks, references={})
        library.guides['mobile'] = guide
        _, html = render_guide(library, 'mobile')
        self.assertIn('<ol start="3"><li>Third step</li><li>Fourth step</li></ol>', html)
        self.assertIn('<th scope="col">Field</th>', html)
        self.assertIn('role="region" tabindex="0"', html)
        attack = '<img src=x onerror=alert(1)> [Run](javascript:alert(1))'
        rendered = inline(attack, guide, library)
        self.assertNotIn('<img', rendered)
        self.assertNotIn('href=', rendered)
        self.assertIn('&lt;img', rendered)
        self.assertEqual(inline('*Sources: <script>unsafe</script>*', guide, library),
                         '<em>Sources: &lt;script&gt;unsafe&lt;/script&gt;</em>')

    def test_new_unsupported_markdown_fails_instead_of_flattening(self):
        for text in ['# Test\n1. Main\n   - Nested condition', '# Test\n```\ncode\n```', '# Test\n> Quote', '# Test\n![figure](image.png)']:
            with self.subTest(text=text), self.assertRaisesRegex(ValueError, 'Unsupported guide Markdown'):
                guide_blocks(text)

    def test_sources_render_readable_text_without_operational_links(self):
        key = next(iter(self.guides.sources))
        _, html = render_source(self.guides, key)
        self.assertIn('Retained source text', html)
        self.assertIn('Original SHA-256:', html)
        self.assertNotIn('href="https:', html)
        self.assertNotIn('<script', html)
        self.assertNotIn('<form', html)
        self.assertNotIn('<img', html)
        self.assertNotIn('&lt;p data-source-node=', html)

    def test_links_only_resolve_to_explicit_local_resources(self):
        guide = self.guides.guides['mobile']
        for target in ['../../.aekr/private.md', '../../archive/old.md', 'file:///C:/secret.txt', 'https://example.com', '//example.com', '/../../credentials']:
            self.assertIsNone(self.guides.link(guide, target))
        self.assertEqual(self.guides.link(guide, 'WAREHOUSE_MOBILE_WORK_FLOWS.md#pick-confirmation'), '/guide/mobile-work#pick-confirmation')

    def test_source_citations_have_descriptive_accessible_names(self):
        guide = self.guides.guides['mobile-inventory']
        html = inline('[R]', guide, self.guides)
        self.assertIn('aria-label="R: Using Warehouse Mobile - Receiving, source"', html)
        self.assertIn('>R</a>', html)
        descriptive = inline('[Warehouse Mobile Receiving][R]', guide, self.guides)
        self.assertIn('>Warehouse Mobile Receiving</a>', descriptive)
        self.assertNotIn('aria-label=', descriptive)

    def test_source_body_title_takes_precedence_over_neighbor_metadata(self):
        key = 'aim/7850f745854156f9817432e534eb93bf1aa0c4fe36b8f7b7c0751962fd0c42ac'
        source = self.guides.sources[key]
        self.assertEqual(source['title'], 'Warehouse Mobile Close Container')
        self.assertEqual(source_title(source), 'Using Warehouse Mobile - Shipping Container QC')
        title, _ = render_source(self.guides, key)
        self.assertEqual(title, 'Source: Using Warehouse Mobile - Shipping Container QC')
        guide = dict(self.guides.guides['mobile-shipping'])
        guide['references'] = {'QC': '../../AIM/reading/'+key.split('/')[1]+'.md'}
        self.assertIn('aria-label="QC: Using Warehouse Mobile - Shipping Container QC, source"', inline('[QC]', guide, self.guides))
        self.assertNotIn('aria-label=', inline('[Shipping Container QC][QC]', guide, self.guides))
        self.assertEqual(source_title({'title': 'Fallback', 'content_tree': {'tag': 'body', 'children': []}}), 'Fallback')

    def test_source_heading_depths_are_normalized_without_initial_skips(self):
        library = copy.copy(self.guides)
        key = next(iter(library.sources))
        article = dict(library.sources[key])
        article['content_tree'] = {'tag': 'body', 'children': [
            {'tag': 'h1', 'node_id': 'n1', 'children': ['Title']},
            {'tag': 'h2', 'node_id': 'n2', 'children': ['Overview']},
            {'tag': 'h4', 'node_id': 'n4', 'children': ['Primary']},
            {'tag': 'h5', 'node_id': 'n5', 'children': ['Conditional']},
            {'tag': 'h6', 'node_id': 'n6', 'children': ['Nested condition']},
        ]}
        library.sources = {key: article}
        _, html = render_source(library, key)
        for level, node_id, text in [(3, 'n1', 'Title'), (4, 'n2', 'Overview'), (5, 'n4', 'Primary'), (6, 'n5', 'Conditional')]:
            self.assertIn(f'<h{level} id="{node_id}" tabindex="-1">{text}</h{level}>', html)
        self.assertIn('<h6 id="n6" tabindex="-1" aria-level="7">Nested condition</h6>', html)
        self.assertNotIn('<h7', html)

    def test_guide_drift_is_rejected_before_use(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            (root/'help_app').mkdir()
            (root/MANIFEST).write_bytes((ROOT/MANIFEST).read_bytes())
            path = root/GUIDES['mobile']
            path.parent.mkdir(parents=True)
            path.write_text('# Changed without review', encoding='utf-8')
            with self.assertRaisesRegex(ValueError, 'Guide fingerprint changed'):
                GuideLibrary(root)

    def test_source_drift_and_path_escape_are_rejected(self):
        with tempfile.TemporaryDirectory() as folder:
            library = GuideLibrary.__new__(GuideLibrary)
            library.root = Path(folder).resolve()
            (library.root/'source.txt').write_text('changed', encoding='utf-8')
            with self.assertRaisesRegex(ValueError, 'fingerprint'):
                library._verified('source.txt', fingerprint(b'original'))
            for path in ['../secret.txt', '.aekr/private.txt', 'archive/old.txt']:
                with self.assertRaisesRegex(ValueError, 'outside the active library'):
                    library._verified(path, 'unused')

    def test_guide_search_is_bounded_and_preserves_provenance(self):
        result = self.guides.search('Assign Printer')
        self.assertTrue(result['results'])
        self.assertEqual(result['manifest_sha256'], self.guides.manifest_sha256)
        self.assertTrue(all(row['guide_sha256'] for row in result['results']))
        self.assertLessEqual(len(self.guides.search('container', 999)['results']), 20)
        self.assertEqual(self.guides.search('')['results'], [])
        self.assertEqual(self.guides.search('unrecognizablezxqv')['results'], [])
        with self.assertRaises(ValueError):
            self.guides.search('x'*501)
        self.assertNotIn('scale-reference', {r['guide_id'] for r in self.guides.sections})

    def test_explicit_src_identifiers_use_declared_catalog_destinations_and_limits(self):
        catalog = self.guides.evidence['mobile-catalog']['src_base_flows']
        for flow in catalog:
            number = flow['src_identifier']
            forms = [f'SRC{number}', f'SRC {number}', f'  sRc  {number}  ']
            results = [self.guides.search(query) for query in forms]
            with self.subTest(src=number):
                self.assertEqual(results[0], results[1])
                self.assertEqual(results[1], results[2])
                self.assertEqual(len(results[0]['results']), 1)
                hit = results[0]['results'][0]
                expected = self.guides.link(self.guides.guides['mobile-catalog'], flow['documentation_candidate'])
                self.assertEqual('/guide/'+hit['guide_id']+'#'+hit['anchor'], expected)
                self.assertIn(flow['user_task'], hit['section_title'])
                self.assertIn(flow['limit'], hit['text'])
                self.assertNotIn(flow['procedure_detail_state'], hit['text'])
                self.assertEqual(hit['guide_sha256'], self.guides.guides[hit['guide_id']]['sha256'])
                self.assertEqual(results[0]['manifest_sha256'], self.guides.manifest_sha256)

    def test_explicit_src_unknown_bounds_and_full_escaped_qualification(self):
        self.assertEqual(self.guides.search('SRC999999')['results'], [])
        with self.assertRaises(ValueError):
            self.guides.search('SRC'+'4'*498)
        library = copy.copy(self.guides)
        library.evidence = dict(library.evidence)
        catalog = copy.deepcopy(library.evidence['mobile-catalog'])
        library.evidence['mobile-catalog'] = catalog
        flow = catalog['src_base_flows'][0]
        flow['limit'] = 'Documented qualification. '*30+'<script>unsafe</script> Final limitation.'
        query = 'SRC'+str(flow['src_identifier'])
        self.assertIn(flow['limit'], library.search(query)['results'][0]['text'])
        html = guide_search(library, query)
        self.assertIn('Final limitation.', html)
        self.assertNotIn('<script>', html)
        self.assertIn('&lt;script&gt;', html)
        flow['documentation_candidate'] = '../../.aekr/private.md'
        with self.assertRaises(ValueError):
            library.search(query)

    def test_non_identifier_queries_keep_freeform_results(self):
        library = copy.copy(self.guides)
        library.sections = [
            {'guide_id': 'mobile-work', 'guide_title': 'Fixture', 'section_title': 'Work',
             'anchor': 'work', 'text': 'SRC400 ASRC400 SRC400x SRC_400 400 inquiry'},
            {'guide_id': 'mobile-inventory', 'guide_title': 'Fixture', 'section_title': 'Inventory',
             'anchor': 'inventory', 'text': 'SRC400 ASRC400 SRC400x SRC_400 400 inquiry'},
        ]
        for query in ['inquiry', 'SRC400 inquiry', 'SRC 400 inquiry', '400', 'ASRC400', 'SRC400x', 'SRC_400', '"SRC400"']:
            with self.subTest(query=query):
                self.assertEqual([row['anchor'] for row in library.search(query)['results']], ['work', 'inventory'])


class GuideHTTPTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.knowledge = Knowledge()
        cls.guides = GuideLibrary()
        cls.server = create_server(0, cls.knowledge, cls.guides)
        cls.thread = threading.Thread(target=cls.server.serve_forever, daemon=True)
        cls.thread.start()

    @classmethod
    def tearDownClass(cls):
        cls.server.shutdown()
        cls.server.server_close()
        cls.thread.join(timeout=2)

    def request(self, path, method='GET'):
        connection = HTTPConnection('127.0.0.1', self.server.server_port, timeout=10)
        connection.request(method, path)
        response = connection.getresponse()
        result = response.status, dict(response.getheaders()), response.read()
        connection.close()
        return result

    def test_curated_api_contract_stays_separate_and_exact(self):
        query = 'Assign Printer'
        status, _, body = self.request('/api/search?q='+quote(query))
        self.assertEqual(status, 200)
        self.assertEqual(json.loads(body), self.knowledge.search(query))
        status, _, body = self.request('/api/guide-search?q='+quote(query))
        self.assertEqual(status, 200)
        self.assertTrue(json.loads(body)['results'])
        _, _, page = self.request('/?q='+quote(query))
        self.assertIn(b'Procedure guide matches', page)
        self.assertIn(b'id="result-list"', page)
        self.assertIn(b'Detailed procedure guides', page)

    def test_exact_src_match_follows_focus_target_before_related_articles(self):
        status, _, page = self.request('/?q=SRC400')
        self.assertEqual(status, 200)
        self.assertIn(b'<form action="/#results-heading"', page)
        focus = page.index(b'<h2 id="results-heading" tabindex="-1">')
        guides = page.index(b'id="guide-results-heading"')
        exact = page.index(b'SRC 400: Transfer between warehouses by license plate')
        articles = page.index(b'id="result-list"')
        self.assertLess(focus, guides)
        self.assertLess(guides, exact)
        self.assertLess(exact, articles)
        self.assertIn(b'<h3 id="guide-results-heading" tabindex="-1">', page)
        self.assertEqual(page.count(b'id="guide-results-heading"'), 1)
        self.assertIn(b'No distinct steps retained', page)
        _, _, ordinary = self.request('/?q=Assign%20Printer')
        self.assertLess(ordinary.index(b'id="result-list"'), ordinary.index(b'id="guide-results-heading"'))
        self.assertIn(b'<h2 id="guide-results-heading" tabindex="-1">', ordinary)

    def test_all_guide_links_are_allowed_routes_and_fragments_exist(self):
        cache = {}
        for key in self.guides.guides:
            status, headers, body = self.request('/guide/'+key)
            self.assertEqual(status, 200, key)
            self.assertIn("script-src 'none'", headers['Content-Security-Policy'])
            for href in Elements(body.decode()).links:
                url = urlsplit(href)
                target = url.path or '/guide/'+key
                if target not in cache:
                    code, _, content = self.request(target)
                    self.assertEqual(code, 200, href)
                    cache[target] = Elements(content.decode()).ids
                if url.fragment:
                    self.assertIn(url.fragment, cache[target], href)

    def test_unknown_resources_query_limits_and_writes_are_rejected(self):
        for path in ['/guide/unknown', '/guide/../../secret', '/guide-source/aim/unknown', '/guide-evidence/unknown']:
            self.assertEqual(self.request(path)[0], 404)
        for query in ['q=a&q=b', 'q=a&other=b', 'q='+'x'*501]:
            self.assertEqual(self.request('/api/guide-search?'+query)[0], 400)
        self.assertEqual(self.request('/guide/mobile', 'POST')[0], 405)


if __name__ == '__main__':
    unittest.main()
