import sys,unittest
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
from sdk_link_semantics import fragment_supported,required_external_reference,EDITORIAL
class SdkLinkSemanticsTests(unittest.TestCase):
    def test_top_is_native_document_position_without_invented_source_anchor(self):
        self.assertTrue(fragment_supported('top',[]));self.assertTrue(fragment_supported('%74op',[]))
        self.assertTrue(fragment_supported('TOP',[]));self.assertTrue(fragment_supported('section',['section']))
        self.assertFalse(fragment_supported('missing',[]))
    def test_editorial_exception_requires_exact_source_node_and_href(self):
        sha,node_id,href=next(iter(EDITORIAL))
        ref={'source_sha256':sha,'node_id':node_id,'original_href':href,'tag':'a','attribute':'href','kind':'script'}
        node={'tag':'a','attrs':{'href':href}}
        self.assertFalse(required_external_reference(ref,{node_id:node}))
        self.assertTrue(required_external_reference({**ref,'source_sha256':'changed'},{node_id:node}))
        self.assertTrue(required_external_reference(ref,{node_id:{'tag':'a','attrs':{'href':href,'download':''}}}))
    def test_embedded_resource_cannot_inherit_editorial_exception(self):
        sha,node_id,href=next(iter(EDITORIAL))
        ref={'source_sha256':sha,'node_id':node_id,'original_href':href,'tag':'script','attribute':'src','kind':'script'}
        self.assertTrue(required_external_reference(ref,{node_id:{'tag':'script','attrs':{'src':href}}}))
if __name__=='__main__':unittest.main()
