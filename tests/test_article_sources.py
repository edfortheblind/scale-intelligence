"""Exact article source navigation preserves evidence and scoped search context."""
import copy
from html import escape
from html.parser import HTMLParser
from http.client import HTTPConnection
from pathlib import Path
import sys
import threading
from types import SimpleNamespace
import unittest
from unittest.mock import patch
from urllib.parse import parse_qs, quote, unquote, urlencode, urlsplit

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
from help_knowledge import Knowledge
from render_help_page import render_page
from serve_help import create_server


class Document(HTMLParser):
    def __init__(self, body):
        super().__init__()
        self.nodes, self.stack, self.texts = [], [], []
        self.feed(body)

    def handle_starttag(self, tag, attrs):
        node = {'tag': tag, 'attrs': dict(attrs), 'parents': self.stack[:]}
        self.nodes.append(node)
        if tag not in {'meta', 'link', 'input', 'br', 'hr', 'img'}:
            self.stack.append(node)

    def handle_endtag(self, tag):
        for index in range(len(self.stack)-1, -1, -1):
            if self.stack[index]['tag'] == tag:
                del self.stack[index:]
                break

    def handle_data(self, data):
        self.texts.append((data, self.stack[:]))

    def target(self, identifier):
        nodes = [n for n in self.nodes if n['attrs'].get('id') == identifier]
        if len(nodes) != 1:
            raise AssertionError('Expected one destination: '+identifier)
        return nodes[0]

    def source_links(self):
        return [n for n in self.nodes if n['tag'] == 'a' and
                'source' in parse_qs(urlsplit(n['attrs']['href']).query)]


class ArticleSourceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.knowledge = Knowledge()

    def test_many_source_article_matches_link_their_existing_sources(self):
        topic_id, query = 'configuration-seed-preservation', 'accessorial'
        topic = self.knowledge.topic(topic_id)
        matches = self.knowledge.find_in_topic(topic_id, query)['results']
        self.assertEqual((len(topic['sources']), len(matches)), (31, 6))
        self.assertEqual(matches[0]['source_id'], 'work-config-1692181424')
        body = render_page(self.knowledge, topic_id=topic_id, article_find=query).decode()
        doc = Document(body)
        links = doc.source_links()
        self.assertEqual(len(links), len(matches))
        for match, link in zip(matches, links):
            url = urlsplit(link['attrs']['href'])
            self.assertEqual(unquote(url.path), '/topic/'+topic_id)
            self.assertEqual(parse_qs(url.query), {'find': [query], 'page': ['1'],
                                                 'source': [match['source_id']]})
            target = doc.target(unquote(url.fragment))
            self.assertEqual((target['tag'], target['attrs']['tabindex']), ('details', '-1'))
            self.assertNotIn('open', target['attrs'])
            self.assertIn(escape(self.knowledge.source(match['source_id'])['qualification']), body)
        self.assertIn('href="#article-sources"', body)

    def test_selected_source_opens_only_required_disclosures_and_keeps_hash_closed(self):
        sid, query = 'shipment-detail-sql', 'shipment door'
        body = render_page(self.knowledge, topic_id='shipment-detail', article_find=query,
                           article_find_page=2, article_source=sid).decode()
        doc = Document(body)
        link = next(n for n in doc.source_links() if parse_qs(urlsplit(n['attrs']['href']).query)['source'] == [sid])
        target = doc.target(unquote(urlsplit(link['attrs']['href']).fragment))
        self.assertIn('open', target['attrs'])
        self.assertEqual([n['attrs'].get('class') for n in target['parents'] if n['tag'] == 'details'],
                         ['references'])
        self.assertTrue(all('open' in n['attrs'] for n in target['parents'] if n['tag'] == 'details'))
        opened_sources = [n for n in doc.nodes if n['tag'] == 'details' and
                          n['attrs'].get('class') == 'source' and 'open' in n['attrs']]
        self.assertEqual(opened_sources, [target])
        nested = [n for n in doc.nodes if n['tag'] == 'details' and target in n['parents']]
        self.assertEqual(len(nested), 1)
        self.assertNotIn('open', nested[0]['attrs'])
        qualification = self.knowledge.source(sid)['qualification']
        self.assertTrue(any(text == qualification and target in parents for text, parents in doc.texts))
        return_link = next(n for n in doc.nodes if n['tag'] == 'a' and target in n['parents'])
        self.assertEqual(return_link['attrs']['href'], '/topic/shipment-detail?find=shipment+door&page=2#article-matches')
        self.assertIn('Showing 9–13 of 13 matching passages. Page 2 of 2.', body)
        self.assertIn('<ol class="guide-results" start="9">', body)
        form = body.split('action="/topic/shipment-detail#article-matches"', 1)[1].split('</form>', 1)[0]
        self.assertNotIn('name="source"', form)
        self.assertNotIn('name="page"', form)

    def test_plain_article_passages_receive_no_invented_source_links(self):
        body = render_page(self.knowledge, topic_id='shipment-detail', article_find='shipment door',
                           article_find_page=2).decode()
        doc = Document(body)
        article_items = [parents[-2] for text, parents in doc.texts if text == 'Article text']
        self.assertEqual(len(article_items), 2)
        self.assertFalse(any(any(parent is item for parent in link['parents'])
                             for item in article_items for link in doc.source_links()))
        self.assertIn('it has no separate passage citation', body)

    def test_global_matching_detail_uses_exact_source_without_inventing_scoped_query(self):
        body = render_page(self.knowledge, question='ISNUMERIC').decode()
        links = Document(body).source_links()
        self.assertTrue(links)
        first = urlsplit(links[0]['attrs']['href'])
        self.assertEqual(first.path, '/topic/labor-log-and-consolidation')
        self.assertEqual(parse_qs(first.query), {'source': ['lya-sql-776702165'], 'search': ['ISNUMERIC']})
        opened = render_page(self.knowledge, topic_id='labor-log-and-consolidation',
                             article_source='lya-sql-776702165').decode()
        target = Document(opened).target(unquote(first.fragment))
        self.assertIn('open', target['attrs'])
        self.assertNotIn('Return to matching passages', opened)

    def test_special_identifiers_labels_and_query_round_trip_without_collisions_or_markup(self):
        topic = copy.deepcopy(self.knowledge.topic('shipment-detail'))
        topic['topic_id'] = 'selected /+?&é'
        ids = ['source /+?&é', 'source%20/+?&é']
        attack = '<img src=x onerror="alert(1)">'
        sources = {sid: {**topic['sources'][0], 'source_id': sid, 'label': attack,
                         'qualification': attack, 'excerpts': [], 'object_ids': [12]} for sid in ids}
        topic['sources'] = list(sources.values())
        query = '  shipment + & "detail" # /? é  '
        result = {'total': 10, 'page': 2, 'pages': 2, 'page_size': 8,
                  'results': [{'text': attack, 'label': attack, 'source_id': sid} for sid in ids]}
        with patch.object(self.knowledge, 'topic', return_value=topic), \
                patch.object(self.knowledge, 'source', side_effect=sources.__getitem__), \
                patch.object(self.knowledge, 'find_in_topic', return_value=result):
            body = render_page(self.knowledge, topic_id=topic['topic_id'], article_find=query,
                               article_find_page=2, article_source=ids[0]).decode()
        self.assertNotIn(attack, body)
        self.assertIn(escape(attack), body)
        doc = Document(body)
        destinations = []
        for sid, link in zip(ids, doc.source_links()):
            url = urlsplit(link['attrs']['href'])
            self.assertEqual(unquote(url.path), '/topic/'+topic['topic_id'])
            self.assertEqual(parse_qs(url.query), {'find': [query], 'page': ['2'], 'source': [sid]})
            target = doc.target(unquote(url.fragment))
            self.assertEqual(bytes.fromhex(target['attrs']['id'].removeprefix('article-source-')).decode(), sid)
            destinations.append(target['attrs']['id'])
        self.assertEqual(len(set(destinations)), 2)
        target = doc.target(destinations[0])
        back = next(n for n in doc.nodes if n['tag'] == 'a' and target in n['parents'])
        self.assertEqual(parse_qs(urlsplit(back['attrs']['href']).query), {'find': [query], 'page': ['2']})

    def test_requested_source_requires_membership_before_reading_evidence(self):
        for sid in ('missing-source', 'lya-sql-776702165'):
            with self.subTest(source=sid), patch.object(self.knowledge, 'source') as source:
                with self.assertRaises(KeyError):
                    render_page(self.knowledge, topic_id='shipment-detail', article_source=sid)
                source.assert_not_called()
        for sid in ('', '   ', 3, False):
            with self.subTest(source=sid), self.assertRaises(ValueError):
                render_page(self.knowledge, topic_id='shipment-detail', article_source=sid)


class ArticleSourceHTTPTests(unittest.TestCase):
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

    def request(self, path):
        connection = HTTPConnection('127.0.0.1', self.server.server_port, timeout=10)
        try:
            connection.request('GET', path)
            response = connection.getresponse()
            return response.status, response.read().decode()
        finally:
            connection.close()

    def test_source_route_keeps_find_page_and_rejects_invalid_source_or_context(self):
        status, body = self.request('/topic/shipment-detail?'+urlencode(
            {'find': 'shipment door', 'page': 2, 'source': 'shipment-detail-sql'}))
        self.assertEqual(status, 200)
        self.assertIn('Showing 9–13 of 13 matching passages', body)
        self.assertIn('Return to matching passages', body)
        self.assertEqual(self.request('/topic/shipment-detail?source=shipment-detail-sql')[0], 200)
        for query in ('source=', 'source=+++', 'source=a&source=b', 'source=shipment-detail-sql&page=1',
                      'source=shipment-detail-sql&find=shipment+door&page=3',
                      'source=shipment-detail-sql&find=shipment&page=0',
                      'source=shipment-detail-sql&find=a&find=b',
                      'source=shipment-detail-sql&find=&page=2',
                      'source=shipment-detail-sql&path=secret'):
            with self.subTest(query=query):
                self.assertEqual(self.request('/topic/shipment-detail?'+query)[0], 400)
        for path in ('/topic/shipment-detail?source=missing-source',
                     '/topic/shipment-detail?source=lya-sql-776702165',
                     '/topic/unknown-article?source=shipment-detail-sql'):
            with self.subTest(path=path):
                self.assertEqual(self.request(path)[0], 404)
        self.assertEqual(self.request('/api/search?q=shipment&source=shipment-detail-sql')[0], 400)
        self.assertEqual(self.request('/?source=shipment-detail-sql')[0], 400)

    def test_http_decodes_special_topic_source_and_query_exactly_once(self):
        existing = self.server.RequestHandlerClass.keywords
        topic = copy.deepcopy(existing['knowledge'].topic('shipment-detail'))
        topic_id, sid, query = 'topic /+?&é', 'source %2F /+?&é', '  shipment + & /? é  '
        topic['topic_id'] = topic_id
        source = {**existing['knowledge'].source('shipment-detail-sql'), 'source_id': sid}
        topic['sources'] = [source]
        topics, sources = {topic_id: topic}, {sid: source}
        result = {'total': 1, 'page': 1, 'pages': 1, 'page_size': 8,
                  'results': [{'text': 'Captured note', 'label': 'Reviewed behavior', 'source_id': sid}]}
        knowledge = SimpleNamespace(topic=topics.__getitem__, source=sources.__getitem__,
                                    find_in_topic=lambda *args: result)
        server = create_server(0, knowledge=knowledge, guides=existing['guides'])
        thread = threading.Thread(target=server.serve_forever, daemon=True)
        thread.start()
        connection = HTTPConnection('127.0.0.1', server.server_port, timeout=10)
        try:
            connection.request('GET', '/topic/'+quote(topic_id, safe='')+'?'+urlencode(
                {'find': query, 'page': 1, 'source': sid}))
            response = connection.getresponse()
            body = response.read().decode()
            self.assertEqual(response.status, 200)
            doc = Document(body)
            link = doc.source_links()[0]
            url = urlsplit(link['attrs']['href'])
            self.assertEqual(unquote(url.path), '/topic/'+topic_id)
            self.assertEqual(parse_qs(url.query), {'find': [query], 'page': ['1'], 'source': [sid]})
            self.assertIn('open', doc.target(unquote(url.fragment))['attrs'])
        finally:
            connection.close()
            server.shutdown()
            server.server_close()
            thread.join(timeout=2)


if __name__ == '__main__':
    unittest.main()
