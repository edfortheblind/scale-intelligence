"""Exercise the installed search builder using disposable module sources."""
from contextlib import closing
import json
from pathlib import Path
import sqlite3
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
from collector import Store, SEEDS, atomic_json
import article_data
import sdk_article_data
from build_search import build


class SearchModuleDispatchTests(unittest.TestCase):
    def fixture(self, root, module):
        store = Store(root, cache_records=True)
        with patch('module_policy.acceptance_readiness', return_value={'ready':True}):
            record = store.discover(module, 'Fixture.html', SEEDS[module], 'synthetic-search-dispatch', 'article')
        raw = ('<html><head><title>'+module+' fixture</title></head><body>'
               '<div class="MCBreadcrumbsBox">SDK keeps this exact source text.</div>'
               '<pre>  SELECT\t1;\r\n</pre></body></html>').encode()
        store.save_original(record, raw, {'final_url':record['source_url'], 'http_status':200,
            'mime':'text/html', 'encoding':'utf-8', 'redirect_chain':[]})
        (sdk_article_data if module == 'SDK' else article_data).convert(store, record)
        return store, record

    def test_each_module_uses_its_own_source_parser_and_converter(self):
        with tempfile.TemporaryDirectory() as folder:
            _, aim = self.fixture(folder, 'AIM')
            store, sdk = self.fixture(folder, 'SDK')
            output = Path(folder)/'_project/search.sqlite'
            report = build(store, output, provisional=True)
            self.assertEqual(report['counts']['articles'], 2)
            with closing(sqlite3.connect(output)) as db:
                actual = dict(db.execute('SELECT module,content_text FROM articles'))
                self.assertNotIn('SDK keeps', actual['AIM'])
                self.assertIn('SDK keeps this exact source text.', actual['SDK'])
                self.assertIn('  SELECT\t1;\r\n', actual['SDK'])
                self.assertEqual(db.execute("SELECT module FROM article_search WHERE article_search MATCH 'keeps'").fetchall(), [('SDK',)])

    def test_sdk_with_aim_converter_version_is_rejected(self):
        with tempfile.TemporaryDirectory() as folder:
            store, record = self.fixture(folder, 'SDK')
            path = store.root/record['app_data_path']
            data = json.loads(path.read_text()); data['converter_version'] = article_data.CONVERTER
            atomic_json(path, data)
            with self.assertRaisesRegex(ValueError, 'Unsupported app JSON converter'):
                build(store, store.root/'_project/search.sqlite', provisional=True)

    def test_sdk_content_or_original_mutation_is_rejected(self):
        with tempfile.TemporaryDirectory() as folder:
            store, record = self.fixture(folder, 'SDK')
            path = store.root/record['app_data_path']
            data = json.loads(path.read_text()); data['content_text'] += ' not in the source'
            atomic_json(path, data)
            with self.assertRaisesRegex(ValueError, 'App JSON content differs'):
                build(store, store.root/'_project/search.sqlite', provisional=True)
            sdk_article_data.convert(store, record)
            (store.root/record['local_path']).write_bytes(b'changed source')
            with self.assertRaisesRegex(ValueError, 'Index source hash mismatch'):
                build(store, store.root/'_project/search.sqlite', provisional=True)


if __name__ == '__main__':
    unittest.main()
