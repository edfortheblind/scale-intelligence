"""Programming lookup context stays distinct from captured source and API data."""
from html.parser import HTMLParser
from http.client import HTTPConnection
import json
from pathlib import Path
import sys
import tempfile
import threading
import unittest
from unittest.mock import patch
from urllib.parse import urlencode, urlsplit, parse_qs

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from help_knowledge import Knowledge
from programming_library import ProgrammingLibrary, ProgrammingUnavailable
from render_programming import render_catalog, render_object, render_sql
from serve_help import create_server
from tests.test_programming_library import fixture, FIXTURE_SQL, article_knowledge


class Links(HTMLParser):
    def __init__(self, html):
        super().__init__()
        self.links = []
        self.feed(html)

    def handle_starttag(self, tag, attrs):
        if tag == 'a':
            self.links.append(dict(attrs))


class ProgrammingContextTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory()
        cls.root = Path(cls.temp.name)
        fixture(cls.root)
        cls.library = ProgrammingLibrary(cls.root)
        cls.server = create_server(0, knowledge=Knowledge(), programming=cls.library)
        cls.thread = threading.Thread(target=cls.server.serve_forever, daemon=True)
        cls.thread.start()

    @classmethod
    def tearDownClass(cls):
        cls.server.shutdown()
        cls.server.server_close()
        cls.thread.join(timeout=5)
        cls.temp.cleanup()

    def request(self, path):
        connection = HTTPConnection('127.0.0.1', self.server.server_port, timeout=10)
        connection.request('GET', path.split('#')[0])
        response = connection.getresponse()
        result = response.status, response.read()
        connection.close()
        return result

    def test_catalog_links_retain_exact_filtered_second_page(self):
        result = self.library.search('VALUE', 'table', 2)
        self.assertEqual((result['total'], result['pages']), (60, 2))
        html = render_catalog(self.library, 'VALUE', 'table', 2)
        hrefs = [a['href'] for a in Links(html).links]
        for row in result['results']:
            prefix = '/programming/object/' + str(row['object_id']) + '?q=VALUE&kind=table&page=2'
            self.assertIn(prefix + '#programming-object', hrefs)
            self.assertIn(prefix + '#column-1', hrefs)
            self.assertEqual(row['href'], '/programming/object/' + str(row['object_id']) + '#programming-object')

    def test_served_column_related_routine_sql_round_trip_retains_context(self):
        query = 'q=VALUE&kind=table&page=2'
        catalog = '/programming?' + query + '#programming-results'
        status, body = self.request(catalog)
        self.assertEqual(status, 200)
        original = body
        column_link = next(a['href'] for a in Links(body.decode()).links if a['href'].endswith('#column-1'))
        self.assertEqual(parse_qs(urlsplit(column_link).query), {'q': ['VALUE'], 'kind': ['table'], 'page': ['2']})
        status, body = self.request(column_link)
        self.assertEqual(status, 200)
        self.assertIn(b'<tr id="column-1" tabindex="-1">', body)
        routine = '/programming/object/1?' + query + '#programming-object'
        self.assertIn(routine, [a['href'] for a in Links(body.decode()).links])
        status, body = self.request(routine)
        self.assertEqual(status, 200)
        sql = '/programming/sql/1?' + query + '#programming-sql'
        hrefs = [a['href'] for a in Links(body.decode()).links]
        self.assertIn(sql, hrefs)
        self.assertIn('/programming/object/3?' + query + '#programming-object', hrefs)
        self.assertIn(catalog, hrefs)
        status, body = self.request(sql)
        self.assertEqual(status, 200)
        hrefs = [a['href'] for a in Links(body.decode()).links]
        self.assertIn(routine, hrefs)
        self.assertIn(catalog, hrefs)
        self.assertIn(b'&lt;script&gt;literal&lt;/script&gt;', body)
        self.assertEqual(self.request(catalog), (200, original))
        self.assertIn(b'value="VALUE"', original)
        self.assertIn(b'<option value="table" selected>', original)
        self.assertIn(b'Page 2 of 2.', original)

    def test_query_bytes_are_encoded_once_and_remain_inert(self):
        query = '  <script>"&雪 +#?=</script>  '
        context = (query, 'table', 1)
        encoded = urlencode({'q': query, 'kind': 'table', 'page': 1})
        for view in ('object', 'sql'):
            status, body = self.request('/programming/' + view + '/1?' + encoded)
            self.assertEqual(status, 200)
            html = body.decode()
            self.assertNotIn('<script>', html)
            for link in Links(html).links:
                target = urlsplit(link['href'])
                if target.query:
                    self.assertEqual(parse_qs(target.query), {'q': [query], 'kind': ['table'], 'page': ['1']})
                    self.assertFalse(target.netloc)
        self.assertIn(encoded.replace('&', '&amp;'), render_object(self.library, '1', search_context=context)[1])

    def test_details_reject_invalid_context_and_keep_file_query_boundary(self):
        invalid = ('q=a&q=b', 'kind=table&kind=table', 'page=1&page=1', 'next=https://outside.example',
                   'q=' + 'x' * 201, 'kind=view', 'kind=', 'page=', 'page=0', 'page=-1',
                   'page=01', 'page=1.0', 'page=1000000', 'page=3', 'q=unknown&page=2')
        for view in ('object', 'sql'):
            for query in invalid:
                with self.subTest(view=view, query=query):
                    self.assertEqual(self.request('/programming/' + view + '/1?' + query)[0], 400)
        for extension in ('md', 'json', 'sql'):
            for query in ('q=', 'kind=all', 'page=1'):
                self.assertEqual(self.request('/programming/file/1.' + extension + '?' + query)[0], 400)
        for context in [('x' * 201, 'all', 1), ('', 'view', 1), ('', 'all', True),
                        ('', 'all', 0), ('VALUE', 'table', 3)]:
            for renderer in (render_object, render_sql):
                with self.subTest(renderer=renderer.__name__, context=context), self.assertRaises(ValueError):
                    renderer(self.library, '1', search_context=context)

    def test_partial_blank_and_whitespace_contexts_keep_exact_defaults(self):
        for query, expected in [('q=', ('', 'all', '1')), ('kind=table', ('', 'table', '1')),
                                ('page=2', ('', 'all', '2')), ('q=++', ('  ', 'all', '1')),
                                ('q=' + 'x' * 200, ('x' * 200, 'all', '1'))]:
            status, body = self.request('/programming/object/1?' + query)
            self.assertEqual(status, 200)
            self.assertIn(b'Return to programming results', body)
            link = next(a['href'] for a in Links(body.decode()).links if urlsplit(a['href']).path == '/programming')
            values = parse_qs(urlsplit(link).query, keep_blank_values=True)
            self.assertEqual(values, dict(zip(('q', 'kind', 'page'), ([v] for v in expected))))
            self.assertEqual(urlsplit(link).fragment, 'programming-results')

    def test_new_catalog_search_resets_page_and_api_contract_remains_unchanged(self):
        html = render_catalog(self.library, 'VALUE', 'table', 2)
        form = html.split('<form ', 1)[1].split('</form>', 1)[0]
        self.assertNotIn('name="page"', form)
        self.assertNotIn('name="search"', form)
        status, body = self.request('/programming?q=VALUE&kind=table')
        self.assertEqual(status, 200)
        self.assertIn(b'Page 1 of 2.', body)
        status, body = self.request('/api/programming/search?q=VALUE&kind=table&page=2')
        self.assertEqual(status, 200)
        self.assertEqual(json.loads(body), self.library.search('VALUE', 'table', 2))

    def test_direct_views_articles_and_downloads_keep_prior_contracts(self):
        direct_object = render_object(self.library, '1', article_knowledge())[1]
        self.assertIn('href="/programming">Find programming objects</a>', direct_object)
        self.assertIn('href="/programming/sql/1#programming-sql"', direct_object)
        self.assertIn('href="/topic/fixture-article#answer"', direct_object)
        self.assertNotIn('Return to programming results', direct_object)
        direct_sql = render_sql(self.library, '1')[1]
        self.assertIn('href="/programming/object/1#programming-object"', direct_sql)
        self.assertNotIn('Return to programming results', direct_sql)
        contextual = render_object(self.library, '1', article_knowledge(), ('VALUE', 'table', 2))[1]
        self.assertIn('href="/topic/fixture-article#answer"', contextual)
        for html in (direct_object, direct_sql, contextual, render_sql(self.library, '1', ('VALUE', 'table', 2))[1]):
            for link in Links(html).links:
                if 'download' in link:
                    self.assertEqual(urlsplit(link['href']).query, '')
        self.assertEqual(self.request('/programming/file/1.sql'), (200, FIXTURE_SQL))

    def test_context_keeps_unavailable_export_and_unknown_object_responses(self):
        for view in ('object', 'sql'):
            self.assertEqual(self.request('/programming/' + view + '/999?q=VALUE')[0], 404)
            with patch.object(self.library, 'artifact', side_effect=ProgrammingUnavailable('synthetic')):
                self.assertEqual(self.request('/programming/' + view + '/1?q=VALUE')[0], 503)
        self.assertEqual(self.request('/programming/sql/3?q=VALUE')[0], 404)


if __name__ == '__main__':
    unittest.main()
