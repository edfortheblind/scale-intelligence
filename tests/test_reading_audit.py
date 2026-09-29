import sys
from pathlib import Path
import tempfile
import unittest
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
from collector import Store, SEEDS, read_json, digest
from article_data import convert, parse_article
from reading_audit import verify_reading
from audit_module import required_external_reference


class ReadingAuditTests(unittest.TestCase):
    def test_rehashed_semantic_attribute_tamper_is_detected(self):
        with tempfile.TemporaryDirectory() as folder:
            store=Store(folder)
            record=store.discover('AIM','Content/fixture.htm',SEEDS['AIM'],'fixture','article')
            raw=b'<html><body>\r\n<script>inactive()</script>\r\n<table><tr><th colspan="2">Exact</th></tr></table><pre>  x\t=1;\r\n</pre><div hidden="hidden">Variant</div></body></html>'
            store.save_original(record,raw,{'http_status':200,'final_url':record['source_url'],'mime':'text/html'})
            convert(store,record)
            data=read_json(store.root/record['app_data_path'])
            _,content,_,_,_=parse_article(record,raw)
            catalog={r['id']:r for r in store.records('AIM')}
            self.assertTrue(verify_reading(store.root,record,data,content,catalog)['passed'])
            path=store.root/data['reading']['html']
            changed=path.read_bytes().replace(b'colspan="2"',b'colspan="1"')
            path.write_bytes(changed)
            data['reading']['html_sha256']=digest(changed)
            result=verify_reading(store.root,record,data,content,catalog)
            self.assertFalse(result['passed'])
            self.assertIn('SEMANTIC_ATTRIBUTE',[e['check'] for e in result['errors']])

    def test_external_document_route_is_not_an_attachment(self):
        ref={'node_id':'n1','tag':'a','attribute':'href','kind':'attachment','original_href':'https://example.invalid/guide.aspx'}
        self.assertFalse(required_external_reference(ref,{'n1':{'attrs':{}}}))
        self.assertTrue(required_external_reference(ref,{'n1':{'attrs':{'download':''}}}))
        self.assertTrue(required_external_reference({**ref,'original_href':'https://example.invalid/guide.pdf'},{'n1':{'attrs':{}}}))


if __name__=='__main__':unittest.main()
