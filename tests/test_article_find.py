"""Explicit article context finds literal reviewed text without global inference."""
import copy
from html import escape
from http.client import HTTPConnection
from pathlib import Path
import sys
import threading
import unittest
from unittest.mock import patch
from urllib.parse import quote, urlencode

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
from help_knowledge import Knowledge
from render_help_page import render_article_find, render_page
from serve_help import create_server


class ArticleFindTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.knowledge = Knowledge()

    def fixture(self):
        knowledge = copy.copy(self.knowledge)
        topic = copy.deepcopy(knowledge.topics['shipment-detail'])
        topic.update(topic_id='fixture', title='Selected fixture', plain_answer='',
                     input_context=[], configuration_dependencies=[], expected_results=[],
                     explanation_paths=[], trigger='', boundaries=[], execution_steps=[],
                     documentary_refinements=[])
        knowledge.topics = {'fixture': topic}
        knowledge._details = lambda selected: []
        return knowledge, topic

    def test_selected_shipment_finds_existing_result_count_without_global_context(self):
        question = 'Does the routine return five result sets?'
        self.assertEqual(self.knowledge.search(question)['state'], 'NEEDS_CONTEXT')
        with patch.object(self.knowledge, 'search', side_effect=AssertionError('Global search called')):
            result = self.knowledge.find_in_topic('shipment-detail', question)
        self.assertEqual(result['topic_id'], 'shipment-detail')
        self.assertEqual(result['state'], 'ARTICLE_MATCHES')
        self.assertEqual(result['results'][0]['text'], self.knowledge.topics['shipment-detail']['expected_results'][0])
        self.assertIn('not a fifth result set', result['results'][0]['text'])
        self.assertIsNone(result['results'][0]['source_id'])

    def test_scope_excludes_other_articles_and_aggregate_body(self):
        knowledge, topic = self.fixture()
        topic.update(plain_answer='Quartz setting.', expected_results=['Quartz result.'])
        knowledge.topics['other'] = {**topic, 'topic_id': 'other', 'plain_answer': 'Unrelatedneedle'}
        result = knowledge.find_in_topic('fixture', 'quartz')
        self.assertEqual({r['text'] for r in result['results']}, {'Quartz setting.', 'Quartz result.'})
        self.assertEqual(result['total'], 2)
        self.assertEqual(knowledge.find_in_topic('fixture', 'unrelatedneedle')['total'], 0)

    def test_deduplication_complete_pages_and_stable_order(self):
        knowledge, topic = self.fixture()
        topic['plain_answer'] = 'Quartz repeated.'
        topic['expected_results'] = ['Quartz repeated.']*3 + ['Quartz note '+str(i) for i in range(10)]
        result = knowledge.find_in_topic('fixture', 'quartz')
        self.assertEqual(result['total'], 11)
        self.assertEqual(len(result['results']), 8)
        self.assertEqual(len({r['text'] for r in result['results']}), 8)
        self.assertEqual((result['page'], result['pages'], result['page_size']), (1, 2, 8))
        second = knowledge.find_in_topic('fixture', 'quartz', 2)
        self.assertEqual((second['page'], second['pages'], second['total']), (2, 2, 11))
        combined = result['results'] + second['results']
        self.assertEqual([r['text'] for r in combined],
                         ['Quartz repeated.'] + ['Quartz note '+str(i) for i in range(10)])
        self.assertEqual(len({(r['text'], r['source_id']) for r in combined}), 11)
        self.assertEqual(knowledge.find_in_topic('fixture', 'quartz', 1), result)
        self.assertEqual(knowledge.find_in_topic('fixture', 'quartz', 2), second)
        with self.assertRaises(ValueError):
            knowledge.find_in_topic('fixture', 'quartz', 3)

    def test_later_page_reaches_retained_shipment_passage_with_exact_source(self):
        first = self.knowledge.find_in_topic('shipment-detail', 'shipment door')
        second = self.knowledge.find_in_topic('shipment-detail', 'shipment door', 2)
        self.assertEqual(first['total'], 13)
        self.assertEqual(len(first['results']), 8)
        self.assertEqual(len(second['results']), 5)
        ninth = second['results'][0]
        self.assertEqual(ninth['source_id'], 'shipment-detail-sql')
        self.assertEqual(ninth['label'], 'dbo.SHP_InsightDetailPaneData — Ordered behavior')
        self.assertIn('NO WHERE filter at all', ninth['text'])
        self.assertNotIn(ninth, first['results'])
        source = self.knowledge.source(ninth['source_id'])
        body = render_page(self.knowledge, topic_id='shipment-detail', article_find='shipment door',
                           article_find_page=2).decode()
        match_section = body.split('Matching passages in this article', 1)[1].split('</section>', 1)[0]
        self.assertIn(escape(ninth['text']), match_section)
        self.assertIn(escape(source['qualification']), match_section)
        self.assertIn(escape(source['label']), match_section)

    def test_common_notes_remain_searchable_and_distinct_sources_are_preserved(self):
        knowledge, topic = self.fixture()
        text = 'Shared transaction caution quartz.'
        details = [{'label': 'Routine '+str(i), 'source_id': 'source-'+str(i),
                    'sections': [{'label': 'Limits', 'items': [text, text]}]} for i in range(10)]
        knowledge._details = lambda selected: details
        result = knowledge.find_in_topic('fixture', 'quartz')
        self.assertEqual(result['total'], 10)
        combined = result['results'] + knowledge.find_in_topic('fixture', 'quartz', 2)['results']
        self.assertEqual([r['source_id'] for r in combined], ['source-'+str(i) for i in range(10)])

    def test_refinements_keep_exact_attribution(self):
        knowledge, topic = self.fixture()
        topic['documentary_refinements'] = [{'statement': 'Quartz documented rule.', 'evidence_ref': 'reviewed-source'}]
        result = knowledge.find_in_topic('fixture', 'quartz')['results']
        self.assertEqual(result, [{'text': 'Quartz documented rule.', 'label': 'Additional process details',
                                   'source_id': 'reviewed-source'}])

    def test_empty_stop_only_unknown_terms_unknown_topic_and_length(self):
        for query in ('', '   '):
            self.assertEqual(self.knowledge.find_in_topic('shipment-detail', query)['state'], 'EMPTY_QUERY')
        for query in ('the and does', 'zzqvunknownsubjectz', '" OR *'):
            result = self.knowledge.find_in_topic('shipment-detail', query)
            self.assertEqual(result['state'], 'NO_REVIEWED_MATCH')
            self.assertEqual(result['total'], 0)
        with self.assertRaises(KeyError):
            self.knowledge.find_in_topic('not-an-article', '')
        for query in (None, 'x'*501):
            with self.assertRaises(ValueError):
                self.knowledge.find_in_topic('shipment-detail', query)
        self.assertEqual(self.knowledge.find_in_topic('shipment-detail', 'x'*500)['total'], 0)

    def test_page_types_and_empty_result_bounds(self):
        for page in (0, -1, True, False, None, '1', 1.0):
            with self.subTest(page=page), self.assertRaises(ValueError):
                self.knowledge.find_in_topic('shipment-detail', 'shipment', page)
        for query in ('', '   ', 'the and does', 'zzqvunknownsubjectz'):
            with self.subTest(query=query):
                result = self.knowledge.find_in_topic('shipment-detail', query)
                self.assertEqual((result['page'], result['pages'], result['page_size'], result['total']),
                                 (1, 1, 8, 0))
                with self.assertRaises(ValueError):
                    self.knowledge.find_in_topic('shipment-detail', query, 2)
        with self.assertRaises(ValueError):
            render_page(self.knowledge, topic_id='shipment-detail', article_find='', article_find_page=2)

    def test_pagination_preserves_encoded_context_focus_numbering_and_new_query_reset(self):
        query = '  shipment + door & "detail" # /?  '
        topic = {'topic_id': 'selected/id +?', 'title': 'Selected article'}
        result = {'page': 2, 'pages': 3, 'page_size': 8, 'total': 17,
                  'results': [{'text': 'Text '+str(i), 'label': 'Article text', 'source_id': None}
                              for i in range(8)]}
        with patch.object(self.knowledge, 'find_in_topic', return_value=result) as find:
            body = render_article_find(self.knowledge, topic, query, 2)
        find.assert_called_once_with(topic['topic_id'], query, 2)
        self.assertIn('Showing 9–16 of 17 matching passages. Page 2 of 3.', body)
        self.assertIn('<ol class="guide-results" start="9">', body)
        self.assertIn('id="article-matches" tabindex="-1"', body)
        for page, label in ((1, 'Previous page'), (3, 'Next page')):
            href = '/topic/'+quote(topic['topic_id'], safe='')+'?'+urlencode(
                {'find': query, 'page': page})+'#article-matches'
            self.assertIn('href="'+escape(href, quote=True)+'">'+label+'</a>', body)
        form = body.split('<form ', 1)[1].split('</form>', 1)[0]
        self.assertIn('action="/topic/selected%2Fid%20%2B%3F#article-matches"', form)
        self.assertIn('name="find"', form)
        self.assertIn('value="'+escape(query, quote=True)+'"', form)
        self.assertNotIn('name="page"', form)

    def test_scoped_renderer_keeps_global_form_and_source_qualification(self):
        query = 'ISNUMERIC'
        page = render_page(self.knowledge, topic_id='labor-log-and-consolidation', article_find=query).decode()
        source = self.knowledge.source('lya-sql-776702165')
        self.assertIn('<form action="/#results-heading" method="get">', page)
        self.assertIn('<form action="/topic/labor-log-and-consolidation#article-matches" method="get">', page)
        self.assertIn('name="find"', page)
        self.assertIn('id="article-matches" tabindex="-1"', page)
        self.assertEqual(page.count('id="article-matches"'), 1)
        self.assertIn('<details class="article-search" open>', page)
        self.assertIn(escape(source['qualification']), page)
        self.assertIn(escape(source['label']), page)
        self.assertIn('may cover several routines', page)
        self.assertEqual(page.count('href="#article-sources"'), 1)
        self.assertIn('id="article-sources" tabindex="-1"', page)

    def test_scoped_query_passage_labels_and_sources_are_inert(self):
        attack = '<img src=x onerror="alert(1)">'
        result = {'total': 1, 'page': 1, 'pages': 1, 'page_size': 8,
                  'results': [{'text': attack, 'label': attack, 'source_id': 'shipment-detail-sql'}]}
        with patch.object(self.knowledge, 'find_in_topic', return_value=result), \
             patch.object(self.knowledge, 'source', wraps=self.knowledge.source) as source:
            original = self.knowledge.source('shipment-detail-sql')
            source.side_effect = lambda sid: ({**original, 'label': attack, 'qualification': attack}
                                               if sid == 'shipment-detail-sql' else self.knowledge.citations[sid])
            page = render_page(self.knowledge, topic_id='shipment-detail', article_find=attack).decode()
        self.assertNotIn(attack, page)
        self.assertIn(escape(attack), page)
        self.assertIn('value="'+escape(attack, quote=True)+'"', page)

    def test_blank_find_is_ordinary_article_and_unknown_query_has_explicit_global_link(self):
        page = render_page(self.knowledge, topic_id='shipment-detail', article_find='   ').decode()
        self.assertIn('id="article-matches" tabindex="-1"', page)
        self.assertNotIn('Matching passages in this article', page)
        self.assertNotIn('<details class="article-search" open>', page)
        self.assertIn('id="answer"', page)
        with patch.object(self.knowledge, 'search', side_effect=AssertionError('Global search called')):
            page = render_page(self.knowledge, topic_id='shipment-detail', article_find='zzqvunknownsubjectz').decode()
        self.assertIn('No matching text in this article.', page)
        self.assertIn('/?q=zzqvunknownsubjectz#results-heading', page)
        self.assertIn('not a fifth result set', page)


class ArticleFindHTTPTests(unittest.TestCase):
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
        conn = HTTPConnection('127.0.0.1', self.server.server_port, timeout=10)
        try:
            conn.request('GET', path)
            response = conn.getresponse()
            return response.status, response.read().decode()
        finally:
            conn.close()

    def test_scoped_get_routes_query_and_preserves_article(self):
        status, body = self.request('/topic/shipment-detail?find='+quote('Does the routine return five result sets?'))
        self.assertEqual(status, 200)
        self.assertIn('id="article-matches"', body)
        self.assertIn('not a fifth result set', body)
        self.assertIn('id="answer"', body)
        self.assertNotIn('Enter the operation or routine name', body)
        status, body = self.request('/topic/shipment-detail?find=')
        self.assertEqual(status, 200)
        self.assertIn('id="article-matches" tabindex="-1"', body)
        self.assertNotIn('Matching passages in this article', body)

    def test_invalid_parameters_lengths_and_missing_topic(self):
        for suffix in ('find=a&find=b', 'find=a&path=secret', 'q=shipment', 'find='+'x'*501):
            with self.subTest(suffix=suffix):
                self.assertEqual(self.request('/topic/shipment-detail?'+suffix)[0], 400)
        self.assertEqual(self.request('/topic/shipment-detail?find='+'x'*500)[0], 200)
        self.assertEqual(self.request('/topic/unknown-article?find=shipment')[0], 404)
        self.assertEqual(self.request('/api/search?find=shipment')[0], 400)

    def test_native_pagination_route_and_boundaries(self):
        first_status, first = self.request('/topic/shipment-detail?find=shipment+door')
        self.assertEqual(first_status, 200)
        self.assertIn('Showing 1–8 of 13 matching passages. Page 1 of 2.', first)
        self.assertIn('href="/topic/shipment-detail?find=shipment+door&amp;page=2#article-matches">Next page</a>', first)
        self.assertNotIn('Previous page', first)
        status, body = self.request('/topic/shipment-detail?find=shipment+door&page=2')
        self.assertEqual(status, 200)
        self.assertIn('Showing 9–13 of 13 matching passages. Page 2 of 2.', body)
        self.assertIn('<ol class="guide-results" start="9">', body)
        self.assertIn('id="article-matches" tabindex="-1"', body)
        self.assertIn('id="answer"', body)
        self.assertIn('Previous page', body)
        self.assertNotIn('Next page', body)
        self.assertEqual(self.request('/topic/shipment-detail?find=&page=1')[0], 200)
        self.assertEqual(self.request('/topic/unknown-article?find=shipment&page=2')[0], 404)
        for page in ('', '0', '-1', '+1', '01', '1.0', 'true', '1000000', '999999', '3'):
            with self.subTest(page=page):
                self.assertEqual(self.request('/topic/shipment-detail?find=shipment+door&page='+quote(page))[0], 400)
        for suffix in ('page=1', 'page=2', 'find=&page=2', 'find=the+and&page=2',
                       'find=zzqvunknownsubjectz&page=2', 'find=shipment&page=1&page=2',
                       'find=shipment&find=door&page=2', 'find=shipment&page=2&path=secret'):
            with self.subTest(suffix=suffix):
                self.assertEqual(self.request('/topic/shipment-detail?'+suffix)[0], 400)
        self.assertEqual(self.request('/api/search?q=shipment&page=2')[0], 400)


if __name__ == '__main__':
    unittest.main()
