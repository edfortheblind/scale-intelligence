"""Synthetic native-proof gate tests; these do not constitute browser evidence."""
import copy
import json
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest

sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
import sdk_article_data as sdk
import verify_sdk as verify
import verify_sdk_markup as native
from collector import atomic_json,digest


class SourceMarkupGateTests(unittest.TestCase):
    def fixture(self,folder):
        root=Path(folder).resolve();store=SimpleNamespace(root=root)
        raw=b'<body><p id="a">Exact<strong>Bold</strong></strong> tail</p></body>'
        source=root/'SDK/source/html/source.html';source.parent.mkdir(parents=True);source.write_bytes(raw)
        record={'id':'article','module':'SDK','type':'article','status':'BODY_SAVED','local_path':'SDK/source/html/source.html',
                'sha256':digest(raw),'encoding':'utf-8','app_data_path':'SDK/data/articles/article.json'}
        parser,content,_,_,_=sdk.parse_article(record,raw)
        for name in set(native.CODE)|{'tools/'+name for name in verify.SEMANTICS}:
            path=root/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(name,encoding='utf-8')
        expected=native.expected_projection(content)
        report={'module':'SDK','code_sha256':{p:digest((root/p).read_bytes()) for p in native.CODE},
            'results':[{'id':'article','source_sha256':record['sha256'],'diagnostics':parser.errors,
                        'document_framing':native.document_framing(record,raw,parser),
                        'expected':expected,'actual':expected,'equivalent':True}]}
        atomic_json(root/native.REPORT,report)
        data={'id':'article','verification':{'parse_errors':copy.deepcopy(parser.errors),
            'source_parse_diagnostics':sdk.source_parse_diagnostics(parser.errors),
            'checks':{k:k!='parse_without_repair' for k in verify.REQUIRED_CHECKS}},
            'reading':{'html':'SDK/reading/article.html','markdown':'SDK/reading/article.md'}}
        for relative in [record['app_data_path'],*data['reading'].values()]:
            path=root/relative;path.parent.mkdir(parents=True,exist_ok=True);path.write_text('synthetic',encoding='utf-8')
        return store,record,parser,content,data,report

    def test_only_current_native_proof_allows_false_parse_check(self):
        with tempfile.TemporaryDirectory() as folder:
            store,record,parser,content,data,_=self.fixture(folder)
            check=verify.source_parse_check(store,record,parser,content,data)
            self.assertEqual(check,{'passed':True,'native_equivalence_verified':True})
            self.assertFalse(verify.converter_check_failures(data,check))
            self.assertIs(data['verification']['checks']['parse_without_repair'],False)
            self.assertEqual(data['verification']['parse_errors'],parser.errors)
            (store.root/native.REPORT).unlink()
            check=verify.source_parse_check(store,record,parser,content,data)
            self.assertFalse(check['passed'])
            self.assertIn('parse_without_repair',verify.converter_check_failures(data,check))

    def test_changed_source_code_diagnostics_or_native_result_rejects_proof(self):
        for field in ('source','code','diagnostics','actual','equivalent','duplicate'):
            with self.subTest(field=field),tempfile.TemporaryDirectory() as folder:
                store,record,parser,content,data,report=self.fixture(folder)
                if field=='source':(store.root/record['local_path']).write_bytes(b'changed')
                elif field=='code':(store.root/native.CODE[0]).write_text('changed',encoding='utf-8')
                elif field=='diagnostics':report['results'][0]['diagnostics']=[]
                elif field=='actual':report['results'][0]['actual']={**report['results'][0]['actual'],'anchors_sha256':'wrong'}
                elif field=='equivalent':report['results'][0]['equivalent']=False
                else:report['results'].append(copy.deepcopy(report['results'][0]))
                atomic_json(store.root/native.REPORT,report)
                self.assertFalse(verify.source_parse_check(store,record,parser,content,data)['passed'])

    def test_non_strong_error_or_altered_stored_diagnostics_remain_blocking(self):
        with tempfile.TemporaryDirectory() as folder:
            store,record,parser,content,data,_=self.fixture(folder)
            data['verification']['parse_errors']=[]
            self.assertFalse(verify.source_parse_check(store,record,parser,content,data)['passed'])
            parser.errors.append({'class':'UNMATCHED_CLOSE','tag':'b'})
            data['verification']['parse_errors']=copy.deepcopy(parser.errors)
            data['verification']['source_parse_diagnostics']=sdk.source_parse_diagnostics(parser.errors)
            self.assertFalse(verify.source_parse_check(store,record,parser,content,data)['passed'])

    def test_native_proof_never_waives_other_failed_or_missing_checks(self):
        with tempfile.TemporaryDirectory() as folder:
            store,record,parser,content,data,_=self.fixture(folder)
            check=verify.source_parse_check(store,record,parser,content,data)
            data['verification']['checks']['supported_elements']=False
            del data['verification']['checks']['headings']
            self.assertEqual(verify.converter_check_failures(data,check),['headings','supported_elements'])
            del data['verification']['checks']['parse_without_repair']
            self.assertIn('parse_without_repair',verify.converter_check_failures(data,check))

    def test_captured_inputs_bind_native_report_and_helper_only_when_required(self):
        with tempfile.TemporaryDirectory() as folder:
            store,record,_,_,data,report=self.fixture(folder);catalog={record['id']:record}
            first=verify.input_generation(store,catalog,{record['id']},[data],[])
            paths={entry['path'] for entry in first['files']}
            self.assertTrue({native.REPORT,'tools/verify_sdk_markup.py'}.issubset(paths))
            report['checked_at']='changed';atomic_json(store.root/native.REPORT,report)
            self.assertNotEqual(first['sha256'],verify.input_generation(store,catalog,{record['id']},[data],[])['sha256'])
            data['verification']['source_parse_diagnostics']=sdk.source_parse_diagnostics([])
            (store.root/native.REPORT).unlink();(store.root/'tools/verify_sdk_markup.py').unlink()
            clean=verify.input_generation(store,catalog,{record['id']},[data],[])
            self.assertFalse({native.REPORT,'tools/verify_sdk_markup.py'}&{entry['path'] for entry in clean['files']})


if __name__=='__main__':unittest.main()
