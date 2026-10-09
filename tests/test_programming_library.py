"""Identifier, provenance, pagination and HTTP boundary checks with synthetic SQL."""
import hashlib
from http.client import HTTPConnection
import json
from pathlib import Path
import sys
import tempfile
import threading
from types import SimpleNamespace
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from programming_library import ProgrammingLibrary, ProgrammingUnavailable, SNAPSHOT_ID, SCOPE
from help_knowledge import Knowledge
from render_programming import render_catalog, render_object, render_sql, table_routine_references
from serve_help import create_server

FIXTURE_SQL = b"-- <script>literal</script>\r\nSELECT N'caf\xc3\xa9';\r\n"


def article_knowledge(oid=1):
    source = {'kind': 'DEPLOYED_SQL_STATIC', 'object_id': oid,
              'qualified_name': 'dbo.FindItem',
              'source_definition_sha256': hashlib.sha256(FIXTURE_SQL).hexdigest()}
    topic = {'topic_id': 'fixture-article', 'title': 'Reviewed explanation',
             'evidence_refs': ['routine'], 'execution_steps': []}
    return SimpleNamespace(snapshot=SNAPSHOT_ID, sources={'routine': source},
                           topics={topic['topic_id']: topic}, _refs=Knowledge._refs)


def fixture(root):
    out = root / 'DB Architecture'
    for folder in ('SP layout', 'function layout', 'table layout'):
        (out / folder).mkdir(parents=True)
        (out / folder / 'README.md').write_bytes(b'# Fixture\n')
        (out / folder / 'manifest.json').write_bytes(b'{}')
    for oid, schema, name, kind in ([(1, 'dbo', 'FindItem', 'P'), (2, 'dbo', 'ItemCount', 'FN'),
                                    (3, 'dbo', 'ITEM', 'U'), (4, 'other', 'ITEM', 'U'),
                                    (5, 'dbo', 'CommentOnly', 'P'), (6, 'dbo', 'OutsidePriority', 'P')]
                                   + [(100+i, 'dbo', 'Extra'+str(i), 'U') for i in range(60)]):
        identity = {'object_id': oid, 'schema_name': schema, 'name': name, 'type': kind}
        if kind == 'U':
            folder = 'table layout'
            column = {'column_id': 1, 'name': 'SKU' if oid < 100 else 'VALUE', 'type_name': 'nvarchar',
                      'type_schema': 'sys', 'max_length': 20, 'precision': 0, 'scale': 0,
                      'is_nullable': False, 'is_identity': False, 'is_computed': False}
            row = {'snapshot_id': SNAPSHOT_ID, 'object': identity,
                   'raw_catalog_records': {'columns': [column]}, 'reviewed_roles': [],
                   'prioritized_primary_routine_ids': [1, 2, 5], 'limitations': ['No runtime proof.'],
                   'table_usage_evidence': {
                       'object_id': oid, 'qualified_name': schema + '.' + name,
                       'primary_routine_direct_ids': [1],
                       'reference_evidence': [{'module_id': 1, 'module_type': 'P',
                                               'channels': ['catalog'], 'qualification': '<script>static only</script>'}],
                       'module_path_context': {'primary_indirect_module_ids': [2],
                                               'shortest_path_examples': [],
                                               'limits': 'Examples are bounded; execution unverified.'},
                       'non_credit_observations': {'identifier_token_mentions': [
                           {'module_id': 1, 'reading_lines': [8]},
                           {'module_id': 6, 'reading_lines': [9]}]}},
                   'original_comment_mentions': [{'module_id': 5, 'source_line': 17,
                                                   'counts_as_routine_reference': False}]}
        else:
            folder = 'SP layout' if kind == 'P' else 'function layout'
            row = {'snapshot_id': SNAPSHOT_ID, 'identity': identity, 'parameters': [],
                   'source_definition_sha256': hashlib.sha256(FIXTURE_SQL).hexdigest(),
                   'return_metadata': {'kind': 'CAPTURED'}, 'reviewed_contract': {'purpose': '<script>literal</script>'},
                   'table_references': {
                       'direct_or_reviewed': [{'table_id': 3, 'classification': 'DIRECT_STATIC'}],
                       'possible_indirect': [],
                       'mentions_only': [{'table_id': 4, 'classification': 'MENTION_NOT_ACCESS'}]},
                   'limitations': ['No runtime proof.']}
            (out / folder / (str(oid)+'.sql')).write_bytes(FIXTURE_SQL)
        (out / folder / (str(oid)+'.json')).write_text(json.dumps(row), encoding='utf-8')
        (out / folder / (str(oid)+'.md')).write_bytes(b'# Original fixture\r\n')
    seal(root)


def seal(root):
    out = root / 'DB Architecture'
    rows = [{'path': p.relative_to(out).as_posix(), 'bytes': p.stat().st_size,
             'sha256': hashlib.sha256(p.read_bytes()).hexdigest()}
            for folder in ('SP layout', 'function layout', 'table layout')
            for p in sorted((out / folder).iterdir())]
    path = out / 'evidence/programming-layout-manifest.json'
    path.parent.mkdir(exist_ok=True)
    path.write_text(json.dumps(rows), encoding='utf-8')


class ProgrammingLibraryTests(unittest.TestCase):
    def setUp(self):
        temp = tempfile.TemporaryDirectory()
        self.addCleanup(temp.cleanup)
        self.root = Path(temp.name)
        fixture(self.root)
        self.library = ProgrammingLibrary(self.root)

    def test_exact_identifiers_precede_partial_names_and_keep_schema_ambiguity(self):
        for query in ('dbo.ITEM', '[dbo].[ITEM]', '3'):
            hits = self.library.search(query)['results']
            self.assertEqual(hits[0]['object_id'], 3)
            self.assertEqual(hits[0]['match_reason'], 'Exact object identifier')
        hits = self.library.search('item')['results']
        self.assertEqual([r['object_id'] for r in hits[:2]], [3, 4])
        self.assertEqual(self.library.search('ITEM', 'function')['results'][0]['object_id'], 2)

    def test_column_results_identify_the_table_and_exact_matching_column(self):
        result = self.library.search('sku')
        self.assertEqual([r['object_id'] for r in result['results']], [3, 4])
        self.assertTrue(all(r['matched_columns'] == ['SKU'] for r in result['results']))
        self.assertTrue(all(r['match_reason'] == 'Captured table column' for r in result['results']))
        self.assertEqual(self.library.search('sku', 'procedure')['total'], 0)

    def test_column_links_reach_focusable_rows_without_changing_search_payloads(self):
        result = self.library.search('sku')
        html = render_catalog(self.library, 'sku')
        for row in result['results']:
            oid = str(row['object_id'])
            self.assertEqual(row['href'], '/programming/object/' + oid + '#programming-object')
            self.assertNotIn('column_ids', row)
            self.assertIn('href="/programming/object/' + oid + '#column-1"', html)
            self.assertIn('aria-label="SKU in ' + row['qualified_name'] + '"', html)
            detail = render_object(self.library, oid)[1]
            self.assertIn('<tr id="column-1" tabindex="-1"><td>1</td><td>SKU</td>', detail)
            self.assertEqual(detail.count('id="column-1"'), 1)

    def test_partial_column_links_use_sparse_captured_ids_and_escape_names(self):
        path = self.root / 'DB Architecture/table layout/3.json'
        record = json.loads(path.read_text(encoding='utf-8'))
        original = record['raw_catalog_records']['columns'][0]
        record['raw_catalog_records']['columns'] = [
            {**original, 'column_id': 19, 'name': 'SKU_EXTRA'},
            {**original, 'column_id': 7, 'name': 'SKU <&"雪>'}]
        path.write_text(json.dumps(record), encoding='utf-8')
        seal(self.root)
        library = ProgrammingLibrary(self.root)
        html = render_catalog(library, 'sku')
        self.assertIn('href="/programming/object/3#column-19" aria-label="SKU_EXTRA in dbo.ITEM"', html)
        self.assertIn('href="/programming/object/3#column-7" aria-label="SKU &lt;&amp;&quot;雪&gt; in dbo.ITEM"', html)
        self.assertIn('>SKU &lt;&amp;&quot;雪&gt;</a>', html)
        detail = render_object(library, '3')[1]
        self.assertIn('<tr id="column-7" tabindex="-1"><td>7</td><td>SKU &lt;&amp;&quot;雪&gt;</td>', detail)
        self.assertLess(detail.index('id="column-7"'), detail.index('id="column-19"'))
        self.assertNotIn('id="column-1"', detail)

    def test_pagination_has_no_duplicates_or_hidden_tail_and_preserves_filter(self):
        first, second = self.library.search('', 'table', 1), self.library.search('', 'table', 2)
        self.assertEqual((first['total'], first['pages']), (62, 2))
        self.assertEqual(len(first['results']), 50)
        self.assertEqual(len(second['results']), 12)
        ids = [r['object_id'] for page in (first, second) for r in page['results']]
        self.assertEqual(len(set(ids)), 62)
        html = render_catalog(self.library, '', 'table', 1)
        self.assertIn('kind=table&amp;page=2', html)

    def test_invalid_filter_page_and_overlength_query_are_rejected(self):
        for kwargs in ({'kind': 'view'}, {'page': 0}, {'page': True}, {'page': 100}, {'query': 'x'*201}):
            with self.subTest(kwargs=kwargs), self.assertRaises(ValueError):
                self.library.search(**kwargs)
        self.assertEqual(self.library.search('unavailable_name')['total'], 0)

    def test_sql_and_downloads_preserve_exact_bytes_and_escape_markup(self):
        raw = (self.root / 'DB Architecture/SP layout/1.sql').read_bytes()
        self.assertEqual(self.library.artifact('1', 'sql'), raw)
        html = render_sql(self.library, '1')[1]
        self.assertNotIn('<script>', html)
        self.assertIn('&lt;script&gt;', html)
        self.assertIn('caf\u00e9', html)
        for oid, ext in [('3', 'sql'), ('../1', 'json'), ('1', 'txt')]:
            with self.assertRaises(KeyError):
                self.library.artifact(oid, ext)

    def test_views_keep_relationship_classes_limits_and_inert_contract_text(self):
        html = render_object(self.library, '1')[1]
        self.assertIn('MENTION_NOT_ACCESS', html)
        self.assertIn('Direct static references or reviewed effects', html)
        self.assertIn('Mentions and unresolved candidates only', html)
        self.assertIn('No runtime proof.', html)
        self.assertNotIn('<script>', html)
        self.assertIn('/programming/object/3#programming-object', html)
        self.assertIn('No reviewed role is recorded', render_object(self.library, '3')[1])
        self.assertIn('&lt;img', render_catalog(self.library, '<img src=x>'))

    def test_routine_articles_include_step_only_references_once(self):
        knowledge = article_knowledge()
        topic = knowledge.topics['fixture-article']
        topic['evidence_refs'] = []
        topic['execution_steps'] = [{'evidence_refs': ['routine', 'routine']}]
        knowledge.sources['same-routine'] = dict(knowledge.sources['routine'])
        topic['execution_steps'].append({'evidence_refs': ['same-routine']})
        html = render_object(self.library, '1', knowledge)[1]
        self.assertIn('<h3>Articles citing this routine</h3>', html)
        self.assertEqual(html.count('href="/topic/fixture-article#answer"'), 1)
        self.assertIn('may cover a wider process', html)
        self.assertIn('Their source qualifications still apply.', html)

    def test_function_articles_reuse_sorted_escaped_links(self):
        knowledge = article_knowledge(2)
        topic = knowledge.topics['fixture-article']
        topic.update(topic_id='x/y?雪', title='Z <script> & explanation')
        knowledge.topics['earlier'] = {**topic, 'topic_id': 'earlier', 'title': 'A explanation'}
        html = render_object(self.library, '2', knowledge)[1]
        self.assertIn('href="/topic/x%2Fy%3F%E9%9B%AA#answer"', html)
        self.assertIn('Z &lt;script&gt; &amp; explanation', html)
        self.assertNotIn('<script>', html)
        self.assertLess(html.index('/topic/earlier#answer'), html.index('/topic/x%2F'))

    def test_article_links_require_exact_snapshot_id_source_kind_and_definition_hash(self):
        for change in ({'kind': 'CATALOG_METADATA'}, {'object_id': 999},
                       {'object_id': '1'}, {'source_definition_sha256': 'different'},
                       {'source_definition_sha256': ''}, {'source_definition_sha256': None}):
            with self.subTest(change=change):
                knowledge = article_knowledge()
                knowledge.sources['routine'].update(change)
                self.assertNotIn('/topic/', render_object(self.library, '1', knowledge)[1])
        knowledge = article_knowledge()
        knowledge.snapshot = 'another-capture'
        self.assertNotIn('/topic/', render_object(self.library, '1', knowledge)[1])

    def test_missing_definition_hash_cannot_link_even_when_source_hash_is_missing(self):
        for value in (None, ''):
            with self.subTest(value=value):
                knowledge = article_knowledge()
                knowledge.sources['routine']['source_definition_sha256'] = value
                record = self.library.record('1')
                if value is None:
                    record.pop('source_definition_sha256')
                else:
                    record['source_definition_sha256'] = value
                with patch.object(self.library, 'record', return_value=record):
                    self.assertNotIn('/topic/', render_object(self.library, '1', knowledge)[1])

    def test_optional_knowledge_and_unmatched_or_table_pages_preserve_previous_html(self):
        self.assertEqual(render_object(self.library, '1'), render_object(self.library, '1', None))
        self.assertEqual(render_object(self.library, '1'), render_object(self.library, '1', article_knowledge(2)))
        self.assertEqual(render_object(self.library, '3'), render_object(self.library, '3', article_knowledge(3)))

    def test_preload_drift_fails_without_resealing(self):
        manifest = self.root / 'DB Architecture/evidence/programming-layout-manifest.json'
        before = manifest.read_bytes()
        (self.root / 'DB Architecture/SP layout/1.md').write_text('changed', encoding='utf-8')
        with self.assertRaises(ProgrammingUnavailable):
            ProgrammingLibrary(self.root)
        self.assertEqual(manifest.read_bytes(), before)

    def test_table_relationships_preserve_overlapping_classes_and_comment_only_evidence(self):
        html = render_object(self.library, '3')[1]
        related = html.split('<h3>Related routines</h3>')[1].split('<h3>Complete captured details</h3>')[0]
        self.assertIn('Direct static references or reviewed effects (1 routine)', related)
        self.assertIn('Possible delegated access (1 routine)', related)
        self.assertIn('Mentions and unresolved candidates only (2 routines)', related)
        self.assertEqual(related.count('/programming/object/1#programming-object'), 2)
        self.assertIn('/programming/object/2#programming-object', related)
        self.assertIn('/programming/object/5#programming-object', related)
        self.assertNotIn('/programming/object/6#programming-object', related)
        self.assertIn('COMMENT_IDENTIFIER_MENTION_NOT_ACCESS_CREDIT', related)
        self.assertIn('&quot;counts_as_routine_reference&quot;: false', related)
        self.assertIn('Examples are bounded; execution unverified.', related)
        self.assertIn('&lt;script&gt;static only&lt;/script&gt;', related)
        self.assertNotIn('<script>', related)

    def test_table_relationships_preserve_reviewed_scope_and_all_source_evidence(self):
        record = self.library.record('3')
        record['table_usage_evidence']['primary_routine_direct_ids'] = []
        refs = table_routine_references(record)
        evidence = refs[1]['direct_or_reviewed'][0]
        self.assertEqual(evidence['classification'], 'REVIEWED_EFFECT_SCOPE_AS_RECORDED')
        self.assertEqual(evidence['evidence'], record['table_usage_evidence']['reference_evidence'][0])
        self.assertEqual(refs[5]['mentions_only'][0]['observation'], record['original_comment_mentions'][0])
        self.assertEqual(refs[2]['possible_indirect'][0]['path_examples'], [])

    def test_table_relationships_keep_unclassified_and_empty_priority_lists_qualified(self):
        record = self.library.record('3')
        record['prioritized_primary_routine_ids'].append(999)
        with patch.object(self.library, 'record', return_value=record):
            html = render_object(self.library, '3')[1]
        self.assertIn('Relationship classification unavailable', html)
        self.assertIn('999 (outside this programming export)', html)
        self.assertIn('No access classification is inferred.', html)
        record['prioritized_primary_routine_ids'] = []
        with patch.object(self.library, 'record', return_value=record):
            html = render_object(self.library, '3')[1]
        self.assertIn('No primary routine relationship was captured. This does not establish non-use.', html)

    def test_postload_drift_is_rejected_for_every_served_artifact_type(self):
        for extension in ('sql', 'md', 'json'):
            path = self.root / ('DB Architecture/SP layout/1.' + extension)
            path.write_bytes(b'changed')
            with self.assertRaises(ProgrammingUnavailable):
                self.library.artifact('1', extension)

    def test_inconsistent_identity_is_rejected_even_with_a_matching_file_hash(self):
        path = self.root / 'DB Architecture/SP layout/1.json'
        row = json.loads(path.read_text())
        row['identity']['object_id'] = 123
        path.write_text(json.dumps(row), encoding='utf-8')
        seal(self.root)
        with self.assertRaises(ProgrammingUnavailable):
            ProgrammingLibrary(self.root)


class ProgrammingHTTPTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory()
        cls.root = Path(cls.temp.name)
        fixture(cls.root)
        cls.library = ProgrammingLibrary(cls.root)
        cls.knowledge = Knowledge()
        cls.server = create_server(0, knowledge=cls.knowledge, programming=cls.library)
        cls.thread = threading.Thread(target=cls.server.serve_forever, daemon=True)
        cls.thread.start()

    @classmethod
    def tearDownClass(cls):
        cls.server.shutdown()
        cls.server.server_close()
        cls.thread.join(timeout=5)
        cls.temp.cleanup()

    def request(self, path, method='GET', headers=None):
        connection = HTTPConnection('127.0.0.1', self.server.server_port, timeout=10)
        connection.request(method, path, headers=headers or {})
        response = connection.getresponse()
        result = response.status, dict(response.getheaders()), response.read()
        connection.close()
        return result

    def test_html_api_object_and_download_routes(self):
        for path in ('/programming', '/programming/object/1', '/programming/object/3', '/programming/sql/2'):
            status, headers, body = self.request(path)
            self.assertEqual(status, 200)
            self.assertIn(b'Captured September 29, 2026', body)
            self.assertIn("script-src 'none'", headers['Content-Security-Policy'])
        status, _, body = self.request('/api/programming/search?q=sku')
        self.assertEqual(status, 200)
        self.assertEqual(json.loads(body)['total'], 2)
        for ext in ('md', 'json', 'sql'):
            status, headers, body = self.request('/programming/file/1.' + ext)
            self.assertEqual(status, 200)
            self.assertEqual(headers['Content-Type'], 'text/plain; charset=utf-8')
            self.assertEqual(body, self.library.artifact('1', ext))

    def test_bad_queries_and_paths_are_bounded(self):
        for query in ('q=a&q=b', 'kind=view', 'page=-1', 'page=9999999', 'page=3', 'path=dbstring.txt', 'q='+'x'*201):
            self.assertEqual(self.request('/api/programming/search?' + query)[0], 400)
        for path in ('/programming/file/../dbstring.txt', '/programming/file/%2e%2e%2f1.sql',
                     '/programming/file/3.sql', '/programming/object/999', '/programming/sql/3',
                     '/programming/file/1.json/other', '/programming/file/1.html'):
            self.assertEqual(self.request(path)[0], 404)
        self.assertEqual(self.request('/programming/file/1.sql?path=other')[0], 400)

    def test_http_routine_links_use_loaded_knowledge_and_reach_existing_article(self):
        source = {**self.knowledge.sources['shipment-detail-sql'], 'object_id': 1,
                  'source_definition_sha256': hashlib.sha256(FIXTURE_SQL).hexdigest()}
        with patch.dict(self.knowledge.sources, {'shipment-detail-sql': source}):
            status, _, body = self.request('/programming/object/1')
        self.assertEqual(status, 200)
        self.assertIn(b'href="/topic/shipment-detail#answer"', body)
        status, _, body = self.request('/topic/shipment-detail')
        self.assertEqual(status, 200)
        self.assertIn(b'<article id="answer" aria-labelledby="answer-title" tabindex="-1">', body)

    def test_same_origin_and_read_only_boundaries_apply_to_new_routes(self):
        for path in ('/programming', '/programming/file/1.sql', '/api/programming/search'):
            self.assertEqual(self.request(path, method='POST')[0], 405)
            self.assertEqual(self.request(path, headers={'Host': 'external.example'})[0], 403)
            self.assertEqual(self.request(path, headers={'Origin': 'https://external.example'})[0], 403)

    def test_source_failure_is_503_while_existing_articles_remain_available(self):
        with patch.object(self.library, 'artifact', side_effect=ProgrammingUnavailable('synthetic')):
            self.assertEqual(self.request('/programming/file/1.sql')[0], 503)
            self.assertEqual(self.request('/programming/object/1')[0], 503)
            self.assertEqual(self.request('/api/topics/shipment-detail')[0], 200)


if __name__ == '__main__':
    unittest.main()
