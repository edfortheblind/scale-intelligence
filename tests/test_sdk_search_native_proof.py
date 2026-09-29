"""Synthetic proof fixtures test index gates; they are not browser evidence."""
from contextlib import closing
from pathlib import Path
import sqlite3
import sys
import tempfile
import unittest
from unittest.mock import patch

candidate=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(candidate/'tools'))
import build_search
import sdk_article_data as sdk
import verify_sdk_markup as native
from collector import Store,SEEDS,atomic_json,read_json,digest


class SdkSearchNativeProofTests(unittest.TestCase):
    def fixture(self,folder):
        store=Store(Path(folder)/'repo',cache_records=True)
        with patch('module_policy.acceptance_readiness',return_value={'ready':True}):
            record=store.discover('SDK','Fixture.html',SEEDS['SDK'],'synthetic_search_native_fixture','article')
        raw=b'<html><head><title>SDK native fixture</title></head><body><p id="a">Source <strong>exact</strong></strong> phrase</p><img src="missing.png"></body></html>'
        store.save_original(record,raw,{'final_url':record['source_url'],'http_status':200,'mime':'text/html','encoding':'utf-8'})
        with patch('module_policy.acceptance_readiness',return_value={'ready':True}):
            sdk.convert(store,record)
        for relative in native.CODE:
            path=store.root/relative;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(relative,encoding='utf-8')
        parser,content,_,_,_=sdk.parse_article(record,raw)
        expected=native.expected_projection(content)
        proof={'module':'SDK','code_sha256':{p:digest((store.root/p).read_bytes()) for p in native.CODE},
            'results':[{'id':record['id'],'source_sha256':record['sha256'],'diagnostics':parser.errors,
                        'document_framing':native.document_framing(record,raw,parser),
                        'expected':expected,'actual':expected,'equivalent':True}]}
        atomic_json(store.root/native.REPORT,proof)
        return store,record,proof

    def build(self,store):
        return build_search.build(store,store.root/'_project/search.sqlite',provisional=True)

    def test_current_native_equivalence_indexes_exact_text_as_unverified_without_mutation(self):
        with tempfile.TemporaryDirectory() as folder:
            store,record,_=self.fixture(folder)
            app=store.root/record['app_data_path'];before=app.read_bytes();data=read_json(app)
            self.assertIs(data['verification']['checks']['parse_without_repair'],False)
            self.assertIs(data['verification']['checks']['direct_assets_available'],False)
            self.assertEqual(self.build(store)['counts']['articles'],1)
            self.assertEqual(app.read_bytes(),before)
            with closing(sqlite3.connect(store.root/'_project/search.sqlite')) as db:
                text,verified=db.execute('SELECT content_text,verified FROM articles').fetchone()
                self.assertEqual(text,data['content_text']);self.assertEqual(verified,0)
                self.assertEqual(db.execute("SELECT value FROM metadata WHERE key='complete_corpus'").fetchone()[0],'false')
                self.assertEqual(db.execute("SELECT count(*) FROM article_search WHERE article_search MATCH 'exact'").fetchone()[0],1)

    def test_missing_or_changed_native_proof_excludes_source_despite_stale_true_status(self):
        for mutation in ('missing','actual','code','diagnostics'):
            with self.subTest(mutation=mutation),tempfile.TemporaryDirectory() as folder:
                store,record,proof=self.fixture(folder)
                path=store.root/record['app_data_path'];data=read_json(path)
                data['verification']['reading_copy_verified']=True;atomic_json(path,data)
                if mutation=='missing':(store.root/native.REPORT).unlink()
                elif mutation=='code':(store.root/native.CODE[0]).write_text('changed',encoding='utf-8')
                else:
                    if mutation=='actual':proof['results'][0]['actual']={}
                    else:proof['results'][0]['diagnostics']=[]
                    atomic_json(store.root/native.REPORT,proof)
                self.assertEqual(self.build(store)['counts']['articles'],0)

    def test_reading_structure_is_rechecked_even_if_its_stored_hash_is_updated(self):
        with tempfile.TemporaryDirectory() as folder:
            store,record,_=self.fixture(folder);app=store.root/record['app_data_path'];data=read_json(app)
            reading=store.root/data['reading']['html'];reading.write_bytes(reading.read_bytes().replace(b'Source ',b'Altered '))
            data['reading']['html_sha256']=digest(reading.read_bytes());atomic_json(app,data)
            with self.assertRaisesRegex(ValueError,'SDK reading structure differs'):
                self.build(store)

    def test_raw_source_and_derivative_hash_mismatches_remain_errors(self):
        for target,message in [('source','Index source hash mismatch'),('reading','Reading artifact hash mismatch')]:
            with self.subTest(target=target),tempfile.TemporaryDirectory() as folder:
                store,record,_=self.fixture(folder);data=read_json(store.root/record['app_data_path'])
                path=store.root/(record['local_path'] if target=='source' else data['reading']['html'])
                path.write_bytes(path.read_bytes()+b' changed')
                with self.assertRaisesRegex(ValueError,message):self.build(store)

    def test_content_tree_and_non_strong_diagnostics_cannot_be_hidden_by_status(self):
        with tempfile.TemporaryDirectory() as folder:
            store,record,_=self.fixture(folder);app=store.root/record['app_data_path'];data=read_json(app)
            data['content_tree']['attrs']['class']='invented';atomic_json(app,data)
            with self.assertRaisesRegex(ValueError,'SDK app JSON structure differs'):self.build(store)
        with tempfile.TemporaryDirectory() as folder:
            store,record,_=self.fixture(folder);app=store.root/record['app_data_path'];data=read_json(app)
            data['verification']['parse_errors'].append({'class':'UNMATCHED_CLOSE','tag':'b'});atomic_json(app,data)
            self.assertEqual(self.build(store)['counts']['articles'],0)


if __name__=='__main__':unittest.main()
