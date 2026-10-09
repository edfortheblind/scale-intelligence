"""Global article navigation retains a query independently of article matches."""
from http.client import HTTPConnection
from pathlib import Path
import sys
import threading
import unittest
from unittest.mock import patch
from urllib.parse import parse_qs, urlencode, urlsplit

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
from help_knowledge import Knowledge
from render_help_page import render_page
from serve_help import create_server
from tests.test_article_sources import Document


class ArticleSearchContextTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.knowledge = Knowledge()
        cls.server = create_server(0, knowledge=cls.knowledge)
        cls.thread = threading.Thread(target=cls.server.serve_forever, daemon=True)
        cls.thread.start()

    @classmethod
    def tearDownClass(cls):
        cls.server.shutdown()
        cls.server.server_close()
        cls.thread.join(timeout=2)

    def request(self, href):
        url = urlsplit(href)
        connection = HTTPConnection('127.0.0.1', self.server.server_port, timeout=10)
        try:
            connection.request('GET', url.path + ('?' + url.query if url.query else ''))
            response = connection.getresponse()
            return response.status, response.read().decode()
        finally:
            connection.close()

    def document(self, href):
        status, body = self.request(href)
        self.assertEqual(status, 200)
        return Document(body)

    def link(self, doc, label):
        return next(p['attrs']['href'] for text, parents in doc.texts if text == label
                    for p in parents if p['tag'] == 'a')

    def test_global_article_and_source_links_retain_original_search(self):
        question = 'ISNUMERIC'
        doc = Document(render_page(self.knowledge, question=question).decode())
        links = [n for n in doc.nodes if n['tag'] == 'a' and
                 any(p['attrs'].get('id') == 'result-list' for p in n['parents'])]
        self.assertTrue(links)
        self.assertTrue(doc.source_links())
        for link in links:
            self.assertEqual(parse_qs(urlsplit(link['attrs']['href']).query)['search'], [question])

    def test_global_source_has_search_return_without_scoped_search(self):
        doc = self.document('/?q=ISNUMERIC')
        doc = self.document(doc.source_links()[0]['attrs']['href'])
        href = self.link(doc, 'Return to search results')
        self.assertEqual(parse_qs(urlsplit(href).query), {'q': ['ISNUMERIC']})
        self.assertEqual(urlsplit(href).fragment, 'results-heading')
        self.assertEqual(doc.target('question')['attrs']['value'], 'ISNUMERIC')
        self.assertEqual(doc.target('article-find')['attrs']['value'], '')
        self.assertFalse(any(text == 'Return to matching passages' for text, _ in doc.texts))
        self.assertFalse(any(n['attrs'].get('id') == 'result-list' for n in doc.nodes))

    def test_global_article_scoped_page_source_and_both_return_paths(self):
        doc = self.document('/?q=shipment+door')
        article = next(n['attrs']['href'] for n in doc.nodes if n['tag'] == 'a' and
                       urlsplit(n['attrs']['href']).path == '/topic/shipment-detail' and
                       urlsplit(n['attrs']['href']).fragment == 'answer')
        doc = self.document(article)
        self.assertEqual(doc.target('question')['attrs']['value'], 'shipment door')
        form = next(p for p in doc.target('article-find')['parents'] if p['tag'] == 'form')
        values = {n['attrs']['name']: n['attrs'].get('value', '') for n in doc.nodes
                  if n['tag'] == 'input' and form in n['parents']}
        values['find'] = 'shipment door'
        doc = self.document(urlsplit(form['attrs']['action']).path+'?'+urlencode(values))
        next_page = self.link(doc, 'Next page')
        self.assertEqual(parse_qs(urlsplit(next_page).query),
                         {'search': ['shipment door'], 'find': ['shipment door'], 'page': ['2']})
        doc = self.document(next_page)
        source = doc.source_links()[0]['attrs']['href']
        doc = self.document(source)
        self.assertIn('open', doc.target(urlsplit(source).fragment)['attrs'])
        back = self.link(doc, 'Return to matching passages')
        self.assertEqual(parse_qs(urlsplit(back).query), parse_qs(urlsplit(next_page).query))
        doc = self.document(back)
        self.assertTrue(any('Showing 9–13 of 13' in text for text, _ in doc.texts))
        returned = self.document(self.link(doc, 'Return to search results'))
        self.assertEqual(returned.target('question')['attrs']['value'], 'shipment door')
        returned.target('results-heading')

    def test_context_is_inert_and_independent_of_article_query(self):
        query = '  ISNUMERIC & "é" /+%? <tag>  '
        with patch.object(self.knowledge, 'search', side_effect=AssertionError('global search executed')):
            body = render_page(self.knowledge, topic_id='shipment-detail', search_context=query,
                               article_find='shipment door', article_find_page=2,
                               article_source='shipment-detail-sql').decode()
        doc = Document(body)
        self.assertEqual(doc.target('question')['attrs']['value'], query)
        self.assertEqual(doc.target('article-find')['attrs']['value'], 'shipment door')
        self.assertNotIn('<tag>', body)
        self.assertEqual(parse_qs(urlsplit(self.link(doc, 'Return to search results')).query), {'q': [query]})
        for link in doc.source_links():
            self.assertEqual(parse_qs(urlsplit(link['attrs']['href']).query)['search'], [query])
        related_topic = next(t['topic_id'] for t in self.knowledge.topics.values()
                             if self.knowledge.topic(t['topic_id'])['related_topics'])
        related_doc = Document(render_page(self.knowledge, topic_id=related_topic, search_context=query).decode())
        related = [n for n in related_doc.nodes if n['tag'] == 'a' and
                   urlsplit(n['attrs']['href']).path.startswith('/topic/') and
                   urlsplit(n['attrs']['href']).fragment == 'answer']
        self.assertTrue(related)
        for link in related:
            self.assertEqual(parse_qs(urlsplit(link['attrs']['href']).query), {'search': [query]})
        href = '/topic/shipment-detail?'+urlencode({'search': query, 'source': 'shipment-detail-sql'})
        self.assertEqual(self.document(href).target('question')['attrs']['value'], query)

    def test_new_article_search_resets_page_source_and_preserves_origin(self):
        doc = self.document('/topic/shipment-detail?'+urlencode(
            {'search': 'original query', 'find': 'shipment door', 'page': 2, 'source': 'shipment-detail-sql'}))
        form = next(p for p in doc.target('article-find')['parents'] if p['tag'] == 'form')
        fields = {n['attrs']['name']: n['attrs'].get('value', '') for n in doc.nodes
                  if n['tag'] == 'input' and form in n['parents']}
        self.assertEqual(fields, {'search': 'original query', 'find': 'shipment door'})
        fields['find'] = 'door'
        doc = self.document(urlsplit(form['attrs']['action']).path+'?'+urlencode(fields))
        self.assertEqual(doc.target('question')['attrs']['value'], 'original query')
        self.assertTrue(any('Page 1 of ' in text for text, _ in doc.texts))
        global_form = next(p for p in doc.target('question')['parents'] if p['tag'] == 'form')
        self.assertEqual(global_form['attrs']['action'], '/#results-heading')
        self.assertEqual([n['attrs']['name'] for n in doc.nodes if n['tag'] == 'input' and
                          global_form in n['parents']], ['q'])

    def test_blank_context_is_absent_and_invalid_context_is_rejected(self):
        baseline = render_page(self.knowledge, topic_id='shipment-detail')
        for value in ('', ' \t\r\n'):
            self.assertEqual(render_page(self.knowledge, topic_id='shipment-detail', search_context=value), baseline)
            status, body = self.request('/topic/shipment-detail?'+urlencode({'search': value}))
            self.assertEqual(status, 200)
            self.assertEqual(body.encode(), baseline)
        for query in ('search=a&search=b', 'search=&search=', 'search=x&unknown=y',
                      'search=x&page=1', 'search=x&source=', 'search=x&find=shipment&page=0',
                      'search='+('a'*501)):
            with self.subTest(query=query):
                self.assertEqual(self.request('/topic/shipment-detail?'+query)[0], 400)
        self.assertEqual(self.request('/topic/shipment-detail?search='+('a'*500))[0], 200)
        self.assertEqual(self.request('/topic/shipment-detail?search=x&source=foreign')[0], 404)
        for value in (None, 1, 'a'*501):
            with self.subTest(value=value), self.assertRaises(ValueError):
                render_page(self.knowledge, topic_id='shipment-detail', search_context=value)


if __name__ == '__main__':
    unittest.main()
