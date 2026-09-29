"""SDK audit fixtures do not constitute acquired-source/browser evidence."""
import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

repository=Path(os.environ.get('SDK_TEST_REPOSITORY',Path(__file__).resolve().parents[1]))
sys.path[:0]=[str(Path(__file__).resolve().parents[1]/'tools'),str(repository/'tools'),str(repository/'tests')]
import audit_sdk
import verify_sdk
import sdk_article_data
import test_verify_sdk
from collector import Store,SEEDS,atomic_json,read_json,digest
from build_sdk_navigation import build


class SdkAuditTests(unittest.TestCase):
    def setUp(self):
        self.helper=test_verify_sdk.VerifySdkTests();self.helper.setUp();self.addCleanup(self.helper.doCleanups)
        self.discovery=patch.object(audit_sdk,'discovery_proof',return_value={'passed':True,'current':True,'issues':[]});self.discovery.start();self.addCleanup(self.discovery.stop)

    def refresh_capture(self,store,selection):
        replay=lambda _s,_c,docs:([],[{'id':d['id'],'idempotent':True,'interruption_preserved_prior_bytes':True,'missing_derivative_recovered':True} for d in docs])
        pilot=self.helper.run_validation(store,selection,replay=replay)
        self.helper.save_proof(store,selection,pilot)
        captured=self.helper.run_validation(store,selection,pilot=False,replay=replay)
        atomic_json(store.root/'SDK/reports/captured-fidelity.json',captured)
        return captured

    def fixture(self,folder):
        store,selection,image,css=self.helper.fixture(folder)
        for name in ('verify_sdk.py','verify_sdk_resources.py'):
            path=store.root/'tools'/name;path.parent.mkdir(exist_ok=True);path.write_bytes(b'Synthetic verifier generation')
        # This synthetic fixture contains no attachments. Bind a real empty
        # closure report to the fixture's code bytes instead of bypassing the gate.
        self.assertFalse(any(r['type']=='attachment' for r in store.records('SDK')))
        for name in ('attachment_references.py','discover_sdk_attachments.py','attachment_closure.py','collector.py'):
            path=store.root/'tools'/name;path.write_bytes(b'Synthetic attachment verifier generation')
        atomic_json(store.root/'SDK/reports/attachment-dependencies.json',{
            'module':'SDK','source_generations':[],'references':[],'source_diagnostics':[],
            'code_sha256':{path:digest((store.root/path).read_bytes()) for path in
                ('tools/attachment_references.py','tools/discover_sdk_attachments.py')},
            'new_resources':0,'fixed_point':True,'all_explicit_dependencies_captured':True,
            'dependency_scan_complete':True,'source_syntax_preserved':True,'missing_ids':[]})
        captured=self.refresh_capture(store,selection)
        resources={'module':'SDK','status':'PASSED','images':captured['images'],'attachments':[],'issues':[],
            'verification_code_sha256':digest((store.root/'tools/verify_sdk.py').read_bytes()),
            'resource_verifier_sha256':digest((store.root/'tools/verify_sdk_resources.py').read_bytes())}
        atomic_json(store.root/'SDK/reports/resource-fidelity.json',resources)
        tree=[{'id':'entry'+str(index),'title':'Literal '+str(index),'resource_id':identifier,'bookmark':'','children':[]} for index,identifier in enumerate(selection['article_ids'])]
        for kind in ('toc','index'):atomic_json(store.root/'SDK/manifests'/(kind+'.json'),{'nodes':tree})
        atomic_json(store.root/'SDK/manifests/discovery-membership.json',{kind:selection['article_ids'] for kind in ('toc','index','search')})
        refs=[{'source_id':'navigation','node_id':'entry'+str(i),'classification':'internal','target_id':identifier,'fragment':'','original_href':identifier+'.html'} for i,identifier in enumerate(selection['article_ids'])]
        atomic_json(store.root/'SDK/manifests/navigation-references.json',refs);build(store)
        screenshot=store.root/'SDK/reports/visual/synthetic.png';screenshot.parent.mkdir(parents=True,exist_ok=True);screenshot.write_bytes(test_verify_sdk.PNG)
        visual={'status':'PASSED','inputs':captured['inputs'],'screenshots':[{'path':screenshot.relative_to(store.root).as_posix(),'sha256':digest(screenshot.read_bytes())}],
            'generations':[{'id':v['id'],'source_sha256':v['source_sha256'],'reading_sha256':v['reading']['html_sha256']} for v in captured['resources']]}
        atomic_json(store.root/'SDK/reports/visual-review.json',visual)
        return store,selection,image,css

    def test_complete_fixture_passes_and_preserves_aim_files_and_state(self):
        with tempfile.TemporaryDirectory() as folder:
            store,_,_,_=self.fixture(folder)
            path=store.root/'AIM/data/sentinel.json';atomic_json(path,{'immutable':'original AIM generation'});before=path.read_bytes()
            aim=read_json(store.root/'_project/STATE.json')['modules']['AIM']
            result=audit_sdk.audit(store)
            self.assertTrue(result['module_local_complete'],result['gates']);self.assertEqual(result['status'],'CORPUS_COMPLETE')
            self.assertEqual(result['counts']['articles']['locally_verified'],5)
            self.assertEqual(path.read_bytes(),before);self.assertEqual(read_json(store.root/'_project/STATE.json')['modules']['AIM'],aim)
            self.assertTrue((store.root/'SDK/reports/cross-module.json').is_file())

    def test_changed_app_bytes_invalidate_capture_and_clear_previous_flags(self):
        with tempfile.TemporaryDirectory() as folder:
            store,selection,_,_=self.fixture(folder);audit_sdk.audit(store)
            record=next(r for r in store.records('SDK') if r['id']==selection['article_ids'][0]);path=store.root/record['app_data_path']
            data=read_json(path);data['changed_metadata']=True;atomic_json(path,data)
            result=audit_sdk.audit(store)
            self.assertFalse(result['gates']['captured_proof_current']);self.assertFalse(result['module_local_complete'])
            self.assertEqual(result['counts']['articles']['structurally_verified'],5)
            self.assertTrue(all(not r.get('article_local_complete') for r in store.records('SDK') if r['type']=='article'))

    def test_missing_image_remains_required_and_prevents_completion(self):
        with tempfile.TemporaryDirectory() as folder:
            store,_,image,_=self.fixture(folder);image.update(status='FAILED',last_failure={'class':'NOT_FOUND','detail':'HTTP 404'});store.save_record(image)
            result=audit_sdk.audit(store,persist=False)
            self.assertFalse(result['module_local_complete']);self.assertFalse(result['gates']['required_originals_captured'])
            self.assertEqual(result['counts']['assets']['known'],2)
            self.assertIn(image['id'],{r['id'] for r in result['source_failures']})

    def test_deleted_local_navigation_is_a_gate_failure(self):
        with tempfile.TemporaryDirectory() as folder:
            store,_,_,_=self.fixture(folder);(store.root/'SDK/reading/index.html').unlink()
            result=audit_sdk.audit(store,persist=False)
            self.assertFalse(result['gates']['local_navigation']);self.assertFalse(result['module_local_complete'])

    def test_navigation_bookmark_gap_is_not_waived_by_saved_target(self):
        with tempfile.TemporaryDirectory() as folder:
            store,selection,_,_=self.fixture(folder)
            refs=read_json(store.root/'SDK/manifests/navigation-references.json');refs[0]['fragment']='unpublished';atomic_json(store.root/'SDK/manifests/navigation-references.json',refs)
            result=audit_sdk.audit(store,persist=False)
            self.assertFalse(result['gates']['local_navigation'])
            self.assertIn('UNRESOLVED_TARGET_FRAGMENT',{r.get('result') for r in result['navigation_proof']['issues']})

    def test_resource_code_and_visual_inputs_require_current_bytes(self):
        with tempfile.TemporaryDirectory() as folder:
            store,_,_,_=self.fixture(folder);(store.root/'tools/verify_sdk_resources.py').write_bytes(b'changed verifier')
            (store.root/'SDK/reports/visual/synthetic.png').write_bytes(b'changed screenshot')
            result=audit_sdk.audit(store,persist=False)
            self.assertFalse(result['gates']['resource_fidelity']);self.assertFalse(result['gates']['representative_visual_review'])

    def test_passed_capture_word_without_all_browser_rows_is_insufficient(self):
        with tempfile.TemporaryDirectory() as folder:
            store,_,_,_=self.fixture(folder);path=store.root/'SDK/reports/captured-fidelity.json'
            report=read_json(path);report['status']='PASSED';report['browser']=[];atomic_json(path,report)
            result=audit_sdk.audit(store,persist=False)
            self.assertFalse(result['gates']['captured_proof_current'])

    def test_both_cross_module_directions_check_target_bytes_and_fragments(self):
        from article_data import convert as aim_convert
        with tempfile.TemporaryDirectory() as folder:
            store,selection,_,_=self.fixture(folder)
            aim=store.discover('AIM','Content/Cross.htm',SEEDS['AIM'],'fixture','article')
            sdk_record=next(r for r in store.records('SDK') if r['source_url'].endswith('/Welcome.html'))
            aim_bytes=('<html><head><title>Cross</title></head><body><p id="aim-anchor">Original AIM</p><a href="'+sdk_record['source_url']+'#sdk-anchor">SDK</a></body></html>').encode()
            store.save_original(aim,aim_bytes,{'http_status':200,'final_url':aim['source_url'],'mime':'text/html','encoding':'utf-8'});aim_convert(store,aim)
            sdk_bytes=('<html><head><title>Welcome.html</title></head><body><p id="sdk-anchor">Original SDK</p><a href="'+aim['source_url']+'#aim-anchor">AIM</a></body></html>').encode()
            store.save_original(sdk_record,sdk_bytes,{'http_status':200,'final_url':sdk_record['source_url'],'mime':'text/html','encoding':'utf-8'});sdk_article_data.convert(store,sdk_record)
            self.refresh_capture(store,selection)
            immutable={p:p.read_bytes() for p in (store.root/'AIM').rglob('*') if p.is_file()}
            result=audit_sdk.audit(store);cross=read_json(store.root/'SDK/reports/cross-module.json')
            self.assertTrue(result['cross_module_reconciled'],cross);self.assertEqual(len(cross['references']),2)
            for path,body in immutable.items():self.assertEqual(path.read_bytes(),body)
            # A required cross-module target disappearance remains unresolved.
            (store.root/aim['reading_paths']['html']).unlink()
            result=audit_sdk.audit(store,persist=False);self.assertFalse(result['cross_module_reconciled'])

    def test_missing_discovery_proof_never_establishes_complete_denominator(self):
        with tempfile.TemporaryDirectory() as folder:
            store,_,_,_=self.fixture(folder)
            from discover_sdk import discovery_proof
            with patch.object(audit_sdk,'discovery_proof',discovery_proof):result=audit_sdk.audit(store,persist=False)
            self.assertEqual(result['denominator_status'],'KNOWN_LOWER_BOUND');self.assertEqual(result['status'],'DISCOVERY_INCOMPLETE')

    def test_cli_preserves_rich_coverage_and_aim_files_and_updates_sdk_blockers(self):
        with tempfile.TemporaryDirectory() as folder:
            store,_,_,_=self.fixture(folder)
            path=store.root/'AIM/reports/coverage.json';atomic_json(path,{'immutable_accepted_generation':True});before=path.read_bytes()
            state=read_json(store.root/'_project/STATE.json');state['modules']['SDK']['blockers']=[{'code':'STALE_BULK_STATUS'}];atomic_json(store.root/'_project/STATE.json',state)
            with patch.object(audit_sdk,'__file__',str(store.root/'tools/audit_sdk.py')),patch.dict(os.environ,LOCALAPPDATA=folder),patch('builtins.print'):
                self.assertEqual(audit_sdk.main(),0)
            self.assertEqual(path.read_bytes(),before)
            self.assertIn('completion_gates',read_json(store.root/'SDK/reports/coverage.json'))
            self.assertIn('articles',read_json(store.root/'SDK/reports/coverage.json')['counts'])
            final=read_json(store.root/'_project/STATE.json');self.assertEqual(final['modules']['SDK']['blockers'],final['blockers']);self.assertEqual(final['blockers'],[])


if __name__=='__main__':unittest.main()
