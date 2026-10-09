"""Guide and citation navigation retains the originating library search."""
from http.client import HTTPConnection
from pathlib import Path
import sys
import threading
import unittest
from urllib.parse import parse_qs, urlencode, urlsplit

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from serve_help import create_server
from tests.test_article_sources import Document


class GuideSearchContextTests(unittest.TestCase):
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

    def request(self, href):
        url = urlsplit(href)
        connection = HTTPConnection('127.0.0.1', self.server.server_port, timeout=30)
        try:
            connection.request('GET', url.path + ('?' + url.query if url.query else ''))
            response = connection.getresponse()
            return response.status, response.read().decode()
        finally:
            connection.close()

    def document(self, href):
        status, body = self.request(href)
        self.assertEqual(status, 200, href)
        return Document(body)

    def links(self, doc):
        return [n['attrs']['href'] for n in doc.nodes if n['tag'] == 'a']

    def return_link(self, doc):
        return next(p['attrs']['href'] for text, parents in doc.texts
                    if text == 'Return to search results' for p in parents if p['tag'] == 'a')

    def assert_context(self, href, question):
        self.assertEqual(parse_qs(urlsplit(href).query), {'search': [question]}, href)

    def test_exact_src_result_retains_query_and_fragment(self):
        doc = self.document('/?q=SRC400')
        link = next(h for h in self.links(doc) if urlsplit(h).path == '/guide/mobile-inventory')
        self.assert_context(link, 'SRC400')
        self.assertEqual(urlsplit(link).fragment, 'license-plate-src-400-documented-identity-incomplete-sequence')
        guide = self.document(link)
        self.assertEqual(guide.target(urlsplit(link).fragment)['attrs']['tabindex'], '-1')
        returned = self.return_link(guide)
        self.assertEqual(urlsplit(returned).fragment, 'results-heading')
        self.assertEqual(parse_qs(urlsplit(returned).query), {'q': ['SRC400']})
        self.assertEqual(self.document(returned).target('question')['attrs']['value'], 'SRC400')

    def test_guide_source_evidence_and_listing_keep_origin(self):
        question = 'receiving & license plate'
        doc = self.document('/guide/mobile-catalog?' + urlencode({'search': question}))
        links = self.links(doc)
        for prefix in ('/guide-source/', '/guide-evidence/', '/guides'):
            href = next(h for h in links if urlsplit(h).path.startswith(prefix))
            self.assert_context(href, question)
            destination = self.document(href)
            self.assertEqual(parse_qs(urlsplit(self.return_link(destination)).query), {'q': [question]})
            for onward in self.links(destination):
                if urlsplit(onward).path.startswith(('/guide/', '/guide-source/', '/guide-evidence/', '/guides')):
                    self.assert_context(onward, question)
        citations = self.document('/guide/mobile-inventory?' + urlencode({'search': question}))
        source = next(n for n in citations.nodes if n['tag'] == 'a' and
                      n['attrs']['href'].startswith('/guide-source/') and 'aria-label' in n['attrs'])
        self.assertTrue(source['attrs']['aria-label'].endswith(', source'))
        self.assert_context(source['attrs']['href'], question)

    def test_tab_claim_reconciliation_citation_and_owner_context(self):
        question = 'purchase orders'
        doc = self.document('/?' + urlencode({'q': question}))
        result_links = [n['attrs']['href'] for n in doc.nodes if n['tag'] == 'a' and
                        any(p['attrs'].get('aria-labelledby') == 'tab-results-heading' for p in n['parents'])]
        self.assertTrue(result_links)
        for href in result_links:
            self.assert_context(href, question)
        guide = self.document('/guide/tab-design?' + urlencode({'search': question}))
        links = self.links(guide)
        owner = next(h for h in links if urlsplit(h).path == '/guide-evidence/tab-po-direction')
        citation = next(h for h in links if urlsplit(h).path.startswith('/guide-source/tab/'))
        for href in (owner, citation):
            self.assert_context(href, question)
            page = self.document(href)
            if urlsplit(href).fragment:
                page.target(urlsplit(href).fragment)
            self.assertEqual(parse_qs(urlsplit(self.return_link(page)).query), {'q': [question]})
            for onward in self.links(page):
                if urlsplit(onward).path.startswith('/guide/'):
                    self.assert_context(onward, question)

    def test_context_is_inert_exact_and_blank_is_absent(self):
        question = '  <script> & "é" /+%?#  '
        source = urlsplit(next(h for h in self.links(self.document('/guide/mobile-inventory'))
                              if h.startswith('/guide-source/'))).path
        for path in ('/guides', '/guide/mobile-inventory', source, '/guide-evidence/mobile-catalog'):
            status, baseline = self.request(path)
            self.assertEqual(status, 200)
            for blank in ('', ' \t\r\n'):
                self.assertEqual(self.request(path + '?' + urlencode({'search': blank})), (200, baseline))
            status, body = self.request(path + '?' + urlencode({'search': question}))
            self.assertEqual(status, 200)
            self.assertNotIn('<script>', body)
            self.assertEqual(parse_qs(urlsplit(self.return_link(Document(body))).query), {'q': [question]})

    def test_invalid_context_is_rejected_on_every_guide_route(self):
        source = urlsplit(next(h for h in self.links(self.document('/guide/mobile-inventory'))
                              if h.startswith('/guide-source/'))).path
        for path in ('/guides', '/guide/mobile-inventory', source, '/guide-evidence/mobile-catalog'):
            for query in ('search=a&search=b', 'search=&search=', 'search=x&unknown=y',
                          'q=x', 'search=' + 'a' * 501):
                with self.subTest(path=path, query=query):
                    self.assertEqual(self.request(path + '?' + query)[0], 400)
            self.assertEqual(self.request(path + '?search=' + 'a' * 500)[0], 200)
        self.assertEqual(self.request('/guide/not-registered?search=x')[0], 404)


if __name__ == '__main__':
    unittest.main()
