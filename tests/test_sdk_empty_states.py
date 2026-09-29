"""Empty state evidence must preserve exact source content and full coverage."""
import copy
from pathlib import Path
import sys
import unittest
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
import sdk_article_data as sdk
from sdk_state_visibility import empty_state_descriptors,empty_observation_passed,state_visibility_passed


class EmptyStateTests(unittest.TestCase):
    def source(self,inside='\r\n\r\n',extra=''):
        return sdk.parse_article({'module':'SDK','encoding':'utf-8'},
            ('<body><div id="x" class="i-popup-content"'+extra+'>'+inside+'</div></body>').encode())[1]

    def descriptor(self,content):
        node=list(sdk.nodes(content))[1]
        return empty_state_descriptors(content,[node['node_id']],[{'kind':'popup','body_node':node['node_id']}])

    def test_only_exact_source_empty_leaf_is_classified_and_retained(self):
        content=self.source();descriptor=self.descriptor(content)
        self.assertEqual(len(descriptor),1);self.assertEqual(descriptor[0]['source_text'],'\n\n')
        self.assertEqual(sdk.text_of(content),'\r\n\r\n')
        for inside,extra in [('Meaningful text',''),('\u00a0',''),('<img src="diagram.png">',''),('<span></span>',''),('', ' title="Meaningful title"'),('', ' style="background-image:url(a.png)"')]:
            with self.subTest(inside=inside,extra=extra):self.assertFalse(self.descriptor(self.source(inside,extra)))

    def test_exact_empty_node_still_fails_hidden_ancestors_or_changed_content(self):
        source=self.descriptor(self.source())[0]
        actual={'count':1,'tag':'div','text':'\n\n','child_elements':0,'attributes':source['source_attributes'],'hidden_ancestors':[]}
        self.assertTrue(empty_observation_passed(source,actual))
        for field,value in [('count',0),('text',''),('child_elements',1),('hidden_ancestors',['parent']),('attributes',{})]:
            with self.subTest(field=field):self.assertFalse(empty_observation_passed(source,{**actual,field:value}))

    def test_audit_keeps_all_states_and_rejects_invented_or_stale_empty_evidence(self):
        source=self.descriptor(self.source())[0];variants={source['node_id'],'other'}
        row={'node_id':source['node_id'],'source_text_sha256':source['source_text_sha256'],'reading_text_sha256':source['source_text_sha256'],
             'source_attributes':source['source_attributes'],'child_elements':0,'hidden_ancestors':[],'positive_area_visible':False,'passed':True}
        view={'visible_variants':1,'represented_variants':2,'empty_source_states':[row]}
        self.assertTrue(state_visibility_passed(view,variants,[source]))
        self.assertFalse(state_visibility_passed(view,variants,[]))
        for field,value in [('reading_text_sha256','changed'),('hidden_ancestors',['parent']),('passed',False)]:
            modified=copy.deepcopy(view);modified['empty_source_states'][0][field]=value
            self.assertFalse(state_visibility_passed(modified,variants,[source]))
        self.assertFalse(state_visibility_passed({**view,'represented_variants':1},variants,[source]))
        self.assertFalse(state_visibility_passed({**view,'visible_variants':0},variants,[source]))


if __name__=='__main__':unittest.main()
