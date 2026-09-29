"""Offline regression tests for strict module completion and proof freshness."""
import sys
from pathlib import Path
import tempfile
import unittest
import subprocess
from unittest.mock import patch
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
from collector import Store,SEEDS,read_json,atomic_json,digest
from article_data import convert,CONVERTER
from completion_gates import catalog_hash,navigation_links,resource_proofs,reading_index_proof,completion_decision,discovery_evidence,discovery_generation,discovery_proof,visual_proof,browser_proof_current
from proof_inputs import render_inputs,immutable_equivalence
from build_navigation import render_index
from audit_module import audit


class CompletionGateTests(unittest.TestCase):
    def fixture(self,folder):
        store=Store(folder);store.checkpoint(phase='AIM_CAPTURE_READY',blockers=[])
        state=read_json(store.root/'_project/STATE.json');state['pilot']='PASSED';atomic_json(store.root/'_project/STATE.json',state)
        record=store.discover('AIM','Content/fixture.htm',SEEDS['AIM'],'fixture','article')
        store.save_original(record,b'<html><body><h1 id="present">Exact</h1></body></html>',
            {'http_status':200,'final_url':record['source_url'],'mime':'text/html'})
        convert(store,record)
        return store,record

    def test_catalog_generation_ignores_audit_flags_but_not_source_changes(self):
        record={'id':'a','type':'article','status':'BODY_SAVED','sha256':'first','local_path':'a.htm'}
        self.assertEqual(catalog_hash([record]),catalog_hash([{**record,'reading_copy_verified':True}]))
        self.assertNotEqual(catalog_hash([record]),catalog_hash([{**record,'sha256':'second'}]))

    def test_every_completion_gate_is_mandatory(self):
        gates={name:True for name in ('discovery','originals','reading','states','resources','navigation','visual')}
        self.assertTrue(completion_decision(gates))
        for name in gates:self.assertFalse(completion_decision({**gates,name:False}))
        self.assertFalse(completion_decision({}))

    def test_declared_missing_partition_and_graph_expansion_block_discovery(self):
        with tempfile.TemporaryDirectory() as folder:
            store,article=self.fixture(folder)
            help_record=store.discover('AIM','Data/HelpSystem.xml',SEEDS['AIM'],'fixture','navigation')
            store.save_original(help_record,b'<WebHelpSystem BrowseSequence="Data/BrowseSequences/Missing.js"/>',
                {'http_status':200,'final_url':help_record['source_url'],'mime':'application/xml'})
            missing=store.discover('AIM','Data/BrowseSequences/Missing.js',SEEDS['AIM'],'fixture','navigation')
            result=discovery_evidence(store,{}, {'nodes':[]},[],{article['id'],help_record['id']})
            self.assertFalse(result['discovery_reconciled'])
            self.assertIn(missing['id'],result['expected_resource_ids'])
            self.assertIn('SOURCE_CLOSURE_NOT_CAPTURED',[x['class'] for x in result['issues']])
            self.assertIn('DISCOVERY_GRAPH_EXPANDED',[x['class'] for x in result['issues']])

    def test_unclassified_inline_documentary_script_is_not_silently_pruned(self):
        with tempfile.TemporaryDirectory() as folder:
            store,record=self.fixture(folder)
            store.save_original(record,b'<html><body><script>documentary_fixture_data</script>Exact</body></html>',
                {'http_status':200,'final_url':record['source_url'],'mime':'text/html'})
            convert(store,record)
            result=discovery_evidence(store,{}, {'nodes':[]},[],{r['id'] for r in store.records('AIM')})
            self.assertFalse(result['discovery_reconciled'])
            self.assertIn('INLINE_DOCUMENTARY_DATA_REQUIRES_CLASSIFICATION',[x['class'] for x in result['issues']])

    def test_navigation_bookmarks_preserve_missing_source_anchors(self):
        with tempfile.TemporaryDirectory() as folder:
            store,record=self.fixture(folder)
            for fragment in ('present','absent'):
                record['occurrences'].append({'family':'index','source_entry':fragment,'original_href':'fixture.htm#'+fragment,
                    'resolved_url':record['source_url']+'#'+fragment,'discovery_source':'partition'})
            result=navigation_links(store,{record['id']:record})
            self.assertEqual(result['counts'],{'verified':1,'with_fragment':2,'failed':1})
            self.assertEqual(result['issues'][0]['error'],'NAVIGATION_FRAGMENT_MISSING')

    def test_changed_image_hash_invalidates_existing_decode_proof(self):
        with tempfile.TemporaryDirectory() as folder:
            store,_=self.fixture(folder)
            image=store.discover('AIM','Content/picture.png',SEEDS['AIM'],'fixture','image')
            store.save_original(image,b'synthetic image bytes',{'http_status':200,'final_url':image['source_url'],'mime':'image/png'})
            proof={'status':'PASSED','images':[{'id':image['id'],'sha256':'stale','decoded':True,'width':1,'height':1}],'attachments':[]}
            atomic_json(store.root/'AIM/reports/resource-fidelity.json',proof)
            result=resource_proofs(store,'AIM',{image['id']:image},lambda *args:True)
            self.assertFalse(result['passed'])

    def test_deleted_or_changed_reading_index_cannot_pass(self):
        with tempfile.TemporaryDirectory() as folder:
            store,record=self.fixture(folder);catalog={record['id']:record}
            toc={'node_count':1,'nodes':[{'id':'toc','resource_id':record['id'],'title':'Exact','children':[]}]}
            atomic_json(store.root/'AIM/manifests/toc.json',toc)
            self.assertFalse(reading_index_proof(store,'AIM',catalog)['passed'])
            path=store.root/'AIM/docs/INDEX.md';path.parent.mkdir(parents=True);path.write_bytes(render_index(catalog,toc))
            self.assertTrue(reading_index_proof(store,'AIM',catalog)['passed'])
            path.write_text('missing topic')
            self.assertFalse(reading_index_proof(store,'AIM',catalog)['passed'])

    def test_real_audit_transition_requires_all_proofs_and_resets_deleted_document(self):
        with tempfile.TemporaryDirectory() as folder:
            store,record=self.fixture(folder)
            atomic_json(store.root/'AIM/manifests/discovery-closure.json',{'discovery_reconciled':True,'fixed_point':True,'issues':[],
                'catalog_sha256':catalog_hash(store.records('AIM')),'derived_generation_sha256':discovery_generation(store)})
            with patch('audit_module.visual_proof',return_value={'passed':True}),patch('audit_module.reading_index_proof',return_value={'passed':True}):
                result=audit(store,'AIM')
                self.assertTrue(result['module_local_complete'])
                self.assertEqual(read_json(store.root/'_project/STATE.json')['modules']['AIM']['status'],'MODULE_LOCAL_COMPLETE')
                (store.root/record['app_data_path']).unlink()
                result=audit(store,'AIM')
                self.assertFalse(result['module_local_complete'])
                self.assertFalse(store.records('AIM')[0]['reading_copy_verified'])

    def test_discovery_requires_closure_and_current_derived_navigation(self):
        with tempfile.TemporaryDirectory() as folder:
            store,record=self.fixture(folder);catalog={record['id']:record}
            atomic_json(store.root/'AIM/reports/discovery.json',{'discovery_reconciled':True,'catalog_sha256':catalog_hash(store.records('AIM'))})
            self.assertFalse(discovery_proof(store,store.records('AIM'))['passed'])
            toc={'node_count':2,'nodes':[{'id':str(i),'resource_id':record['id'],'title':str(i),'children':[]} for i in range(2)]}
            atomic_json(store.root/'AIM/manifests/toc.json',toc)
            closure={'discovery_reconciled':True,'fixed_point':True,'issues':[],
                'catalog_sha256':catalog_hash(store.records('AIM')),'derived_generation_sha256':discovery_generation(store)}
            atomic_json(store.root/'AIM/manifests/discovery-closure.json',closure)
            self.assertTrue(discovery_proof(store,store.records('AIM'))['passed'])
            for changed in ({**toc,'nodes':list(reversed(toc['nodes']))},
                            {**toc,'nodes':toc['nodes'][:1],'node_count':1},
                            {**toc,'nodes':[{**toc['nodes'][0],'title':'Changed'},toc['nodes'][1]]}):
                atomic_json(store.root/'AIM/manifests/toc.json',changed)
                index=store.root/'AIM/docs/INDEX.md';index.parent.mkdir(parents=True,exist_ok=True)
                index.write_bytes(render_index(catalog,changed))
                self.assertTrue(reading_index_proof(store,'AIM',catalog)['passed'])
                self.assertFalse(discovery_proof(store,store.records('AIM'))['passed'])

    def test_css_only_change_invalidates_state_and_visual_evidence(self):
        with tempfile.TemporaryDirectory() as folder,patch('proof_inputs.RENDER_SEMANTICS',()):
            store,record=self.fixture(folder)
            css=store.discover('AIM','Content/source.css',SEEDS['AIM'],'fixture','stylesheet')
            store.save_original(css,b'p {color:black}',{'http_status':200,'final_url':css['source_url'],'mime':'text/css'})
            rendered=store.root/'AIM/reading.css';rendered.write_bytes(b'p {color:black}')
            atomic_json(store.root/'AIM/data/stylesheets'/(css['id']+'.json'),{'rendered_path':'AIM/reading.css'})
            inputs=render_inputs(store)
            generation={'id':record['id'],'source_sha256':record['sha256'],'reading_sha256':record['reading_paths']['html_sha256']}
            state={'status':'PASSED','converter_version':CONVERTER,'generations':[generation]}
            screenshot=store.root/'AIM/fixture.png';screenshot.write_bytes(b'screenshot fixture')
            visual={'status':'PASSED','formats':['extensive_article','table','image','dropdown','toggler','topic_popup'],
                    'generations':[generation],'screenshots':[{'path':'AIM/fixture.png','sha256':digest(screenshot.read_bytes())}]}
            for name,report in (('documentary-states',state),('visual-review',visual)):
                path=store.root/'AIM/reports'/(name+'.json');atomic_json(path,report)
                atomic_json(store.root/'AIM/reports'/(name+'-binding.json'),{'schema_version':1,'status':'PASSED','inputs':inputs,
                    'report_sha256':digest(path.read_bytes())})
            self.assertTrue(browser_proof_current(store,'states'))
            self.assertTrue(visual_proof(store,'AIM',{record['id']:record})['passed'])
            rendered.write_bytes(b'p {display:none}')
            self.assertFalse(browser_proof_current(store,'states'))
            self.assertFalse(visual_proof(store,'AIM',{record['id']:record})['passed'])

    def test_immutable_adoption_refuses_changed_dependency(self):
        with tempfile.TemporaryDirectory() as folder:
            root=Path(folder);path=root/'support.css';path.write_bytes(b'original')
            def git(*args):return subprocess.check_output(['git',*args],cwd=root,stderr=subprocess.DEVNULL)
            git('init');git('add','support.css')
            git('-c','user.name=Fixture','-c','user.email=fixture@example.invalid','commit','-m','Fixture')
            generation=lambda:{'files':[{'path':'support.css','byte_count':path.stat().st_size,'sha256':digest(path.read_bytes())}]}
            self.assertTrue(immutable_equivalence(root,'HEAD',generation())['passed'])
            path.write_bytes(b'changed')
            self.assertFalse(immutable_equivalence(root,'HEAD',generation())['passed'])


if __name__=='__main__':unittest.main()
