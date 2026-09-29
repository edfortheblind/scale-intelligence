"""Synthetic SDK verification tests; fixtures do not count as acquired coverage."""
import base64
from io import BytesIO
import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch
import zipfile
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
import verify_sdk as verify
import sdk_article_data as sdk
from collector import Store,SEEDS,atomic_json,read_json,digest
from style_data import convert_styles

PNG=base64.b64decode('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+j9WQAAAAASUVORK5CYII=')
RUNTIME=b'Synthetic renderer evidence; never executed.'


class VerifySdkTests(unittest.TestCase):
    def setUp(self):
        self.runtime=patch.object(sdk,'RENDERER_HASHES',{digest(RUNTIME)});self.runtime.start();self.addCleanup(self.runtime.stop)
        self.semantics=patch.object(verify,'SEMANTICS',());self.semantics.start();self.addCleanup(self.semantics.stop)

    def fixture(self,folder):
        root=Path(folder)/'repo';store=Store(root,cache_records=True)
        atomic_json(root/'_project/STATE.json',{'module':'SDK','phase':'SDK_PILOT_IN_PROGRESS','pilot':'PASSED',
            'modules':{'AIM':{'status':'MODULE_LOCAL_COMPLETE'},'SDK':{'status':'PILOT_IN_PROGRESS','pilot':'NOT_RUN'}},'publication':{}})
        def save(name,kind,raw,mime):
            record=store.discover('SDK',name,SEEDS['SDK'],'synthetic_fixture',kind)
            store.save_original(record,raw,{'http_status':200,'final_url':record['source_url'],'mime':mime,'encoding':'utf-8'})
            return record
        image=save('picture.png','image',PNG,'image/png')
        css=save('style.css','stylesheet',b'p{color:black}','text/css')
        save('runtime.js','script',RUNTIME,'application/javascript')
        convert_styles(store,'SDK')
        examples={'Welcome.html':'<p>Original welcome qualification.</p>',
            'Code.html':'<pre>'+('  SELECT\tcolumn_name FROM source_table;\r\n'*8)+'</pre>',
            'Fields.html':'<table><tr><th>Parameter</th><th>Type</th></tr><tr><td>literal_name</td><td>integer</td></tr></table>',
            'Image.html':'<img src="picture.png" alt="Original diagram caption">',
            'States.html':'<div class="i-section-heading">Section</div><div class="i-section-content" style="display:none">Exact hidden body.</div>'}
        selected=[]
        for name,body in examples.items():
            head='<script src="runtime.js"></script><link rel="stylesheet" href="style.css">' if name=='States.html' else ''
            raw=('<html><head><title>'+name+'</title>'+head+'</head><body>'+body+'</body></html>').encode()
            if name=='Welcome.html':raw=b'\xef\xbb\xbf'+raw
            record=save(name,'article',raw,'text/html');sdk.convert(store,record);selected.append(record['id'])
        selection={'module':'SDK','article_ids':selected};atomic_json(root/'_project/pilot-SDK.json',selection)
        return store,selection,image,css

    def browser(self,root,views):
        return [],[{'id':v['id'],'visible_variants':len(v['variant_nodes']),'active_elements':0} for v in views]

    def decoder(self,root,images):
        return [],[{'id':i['id'],'sha256':i['sha256'],'decoded':True,'width':1,'height':1} for i in images]

    def run_validation(self,store,selection,**kwargs):
        return verify.validate(store,selection,browser=kwargs.pop('browser',self.browser),image_decoder=kwargs.pop('image_decoder',self.decoder),**kwargs)

    def save_proof(self,store,selection,report):
        relative='SDK/reports/pilot.json';atomic_json(store.root/relative,report)
        state=read_json(store.root/'_project/STATE.json');state['modules']['SDK'].update(pilot='PASSED',pilot_proof={'path':relative,'sha256':digest((store.root/relative).read_bytes())})
        atomic_json(store.root/'_project/STATE.json',state)
        selection.update(status='PASSED',report=relative);atomic_json(store.root/'_project/pilot-SDK.json',selection)

    def test_representative_sdk_pilot_preserves_bom_code_states_and_recovers(self):
        with tempfile.TemporaryDirectory() as folder:
            store,selection,_,_=self.fixture(folder)
            originals={r['id']:(store.root/r['local_path']).read_bytes() for r in store.records('SDK') if r.get('local_path')}
            report=self.run_validation(store,selection)
            self.assertEqual(report['status'],'PASSED',report['issues'])
            self.assertTrue(all(report['formats'].values()))
            self.assertEqual(len(report['resources']),5);self.assertEqual(len(report['recovery']),5)
            self.assertFalse(report['module_local_complete'])
            for record in store.records('SDK'):
                if record.get('local_path'):self.assertEqual((store.root/record['local_path']).read_bytes(),originals[record['id']])

    def test_missing_selected_image_stays_a_pilot_failure(self):
        with tempfile.TemporaryDirectory() as folder:
            store,selection,image,_=self.fixture(folder)
            image.update(status='FAILED',transport_metadata_verified=False,local_path=None,sha256=None,byte_count=None)
            store.save_record(image)
            for r in store.records('SDK'):
                if r['type']=='article':sdk.convert(store,r)
            report=self.run_validation(store,selection)
            self.assertEqual(report['status'],'FAILED');self.assertEqual(report['selected_article_ids'],selection['article_ids'])
            self.assertIn('REQUIRED_SUPPORT_NOT_CAPTURED',{i['error'] for i in report['issues']})

    def test_aim_pilot_success_does_not_approve_incomplete_sdk_selection(self):
        with tempfile.TemporaryDirectory() as folder:
            store,selection,_,_=self.fixture(folder);selection['article_ids']=selection['article_ids'][:1]
            report=self.run_validation(store,selection)
            self.assertEqual(read_json(store.root/'_project/STATE.json')['pilot'],'PASSED')
            self.assertEqual(report['status'],'FAILED')
            self.assertIn('SDK_PILOT_SELECTION_INVALID',{i['error'] for i in report['issues']})

    def test_hidden_documentary_state_and_decode_failure_are_explicit(self):
        with tempfile.TemporaryDirectory() as folder:
            store,selection,_,_=self.fixture(folder)
            def hidden(root,views):
                _,results=self.browser(root,views)
                self.assertTrue(any(v['variant_nodes'] for v in views))
                return [{'error':'DOCUMENTARY_STATE_HIDDEN'}],results
            def damaged(root,images):return [{'error':'IMAGE_DECODING_FAILED'}],self.decoder(root,images)[1]
            report=self.run_validation(store,selection,browser=hidden,image_decoder=damaged)
            self.assertEqual(report['status'],'FAILED')
            self.assertTrue({'DOCUMENTARY_STATE_HIDDEN','IMAGE_DECODING_FAILED'}.issubset({i['error'] for i in report['issues']}))

    def test_css_only_change_during_verification_invalidates_generation(self):
        with tempfile.TemporaryDirectory() as folder:
            store,selection,_,css=self.fixture(folder)
            path=store.root/read_json(store.root/'SDK/data/stylesheets'/(css['id']+'.json'))['rendered_path']
            def changed(root,views):
                path.write_bytes(b'p{display:none}')
                return self.browser(root,views)
            report=self.run_validation(store,selection,browser=changed)
            self.assertEqual(report['status'],'FAILED')
            self.assertIn('SDK_INPUTS_CHANGED_DURING_VERIFICATION',{i['error'] for i in report['issues']})

    def test_rehashed_reading_tamper_fails_independent_source_comparison(self):
        with tempfile.TemporaryDirectory() as folder:
            store,selection,_,_=self.fixture(folder)
            record=next(r for r in store.records('SDK') if r['source_url'].endswith('/Code.html'))
            path=store.root/record['reading_paths']['html'];raw=path.read_bytes().replace(b'column_name',b'changed_name');path.write_bytes(raw)
            data=read_json(store.root/record['app_data_path']);data['reading']['html_sha256']=digest(raw);atomic_json(store.root/record['app_data_path'],data)
            report=self.run_validation(store,selection)
            self.assertEqual(report['status'],'FAILED')
            self.assertIn('READING_FIDELITY_FAILED',{i['error'] for i in report['issues']})

    def test_empty_browser_evidence_cannot_pass(self):
        with tempfile.TemporaryDirectory() as folder:
            store,selection,_,_=self.fixture(folder)
            report=self.run_validation(store,selection,browser=lambda *args:([],[]))
            self.assertEqual(report['status'],'FAILED')
            self.assertIn('SDK_BROWSER_EVIDENCE_INCOMPLETE',{i['error'] for i in report['issues']})

    def test_archive_validation_rejects_traversal_without_extraction(self):
        buffer=BytesIO()
        with zipfile.ZipFile(buffer,'w') as archive:archive.writestr('../unsafe.txt','never extracted')
        record={'id':'attachment','source_url':'https://travstg.manhscale.com/SCALEHelp/SDK/example.zip','sha256':digest(buffer.getvalue())}
        self.assertFalse(verify.attachment_check(record,buffer.getvalue())['passed'])
        self.assertFalse(verify.attachment_check({**record,'source_url':record['source_url']+'.pdf'},b'not pdf')['passed'])

    def test_pilot_proof_binds_current_app_and_style_json(self):
        for kind in ('app','style'):
            with self.subTest(kind=kind),tempfile.TemporaryDirectory() as folder:
                store,selection,_,css=self.fixture(folder)
                report=self.run_validation(store,selection);self.assertEqual(report['status'],'PASSED',report['issues'])
                self.save_proof(store,selection,report);self.assertTrue(verify.pilot_proof_current(store)['passed'])
                record=next(r for r in store.records('SDK') if r['id']==selection['article_ids'][0])
                path=store.root/(record['app_data_path'] if kind=='app' else 'SDK/data/stylesheets/'+css['id']+'.json')
                data=read_json(path);data['synthetic_changed_field']=True;atomic_json(path,data)
                result=verify.pilot_proof_current(store)
                self.assertFalse(result['passed']);self.assertIn('SDK_PILOT_INPUTS_CHANGED',result['issues'])

    def test_pilot_proof_rejects_css_change_report_mutation_and_selection_change(self):
        for kind in ('css','report','selection'):
            with self.subTest(kind=kind),tempfile.TemporaryDirectory() as folder:
                store,selection,_,css=self.fixture(folder);report=self.run_validation(store,selection)
                self.save_proof(store,selection,report)
                if kind=='css':
                    path=store.root/read_json(store.root/'SDK/data/stylesheets'/(css['id']+'.json'))['rendered_path'];path.write_bytes(b'p{display:none}')
                elif kind=='report':
                    report['checked_at']='changed';atomic_json(store.root/'SDK/reports/pilot.json',report)
                else:
                    selection['article_ids'].reverse();atomic_json(store.root/'_project/pilot-SDK.json',selection)
                result=verify.pilot_proof_current(store);self.assertFalse(result['passed'],result)

    def test_pilot_proof_cannot_omit_an_input_even_with_rebound_report(self):
        with tempfile.TemporaryDirectory() as folder:
            store,selection,_,_=self.fixture(folder);report=self.run_validation(store,selection)
            report['inputs']['files'].pop();self.save_proof(store,selection,report)
            self.assertFalse(verify.pilot_proof_current(store)['passed'])

    def test_app_json_change_during_verification_is_not_reused(self):
        with tempfile.TemporaryDirectory() as folder:
            store,selection,_,_=self.fixture(folder)
            record=next(r for r in store.records('SDK') if r['id']==selection['article_ids'][0]);path=store.root/record['app_data_path']
            def changed(root,views):
                data=read_json(path);data['synthetic_changed_field']=True;atomic_json(path,data)
                return self.browser(root,views)
            report=self.run_validation(store,selection,browser=changed)
            self.assertIn('SDK_INPUTS_CHANGED_DURING_VERIFICATION',{i['error'] for i in report['issues']})

    def test_copy_payload_requires_original_and_reading_native_dom_text(self):
        # Browser HTML parsing removes the immediate PRE newline; source text
        # remains separately exact and must not be used as the clipboard proof.
        expected='line one\nline two\r';edge={'control_node':'n1','body_node':'n2','copy_text':expected,'copy_text_sha256':digest(expected.encode())}
        view={'id':'article','copy_payloads':[edge]}
        issues,checked=verify.copy_payload_checks(view,[expected],{'n2':expected})
        self.assertFalse(issues);self.assertTrue(checked[0]['passed'])
        for source,reading in [('\n'+expected,expected),(expected,'\n'+expected),(expected,expected.replace('\r','\n'))]:
            issues,_=verify.copy_payload_checks(view,[source],{'n2':reading});self.assertEqual(issues[0]['error'],'DOM_COPY_PAYLOAD_MISMATCH')

    def test_copy_payload_missing_browser_evidence_cannot_pass(self):
        with tempfile.TemporaryDirectory() as folder:
            store,selection,_,_=self.fixture(folder)
            record=store.discover('SDK','Copy.html',SEEDS['SDK'],'synthetic_fixture','article')
            raw=b'<html><head><title>Copy</title><script src="runtime.js"></script></head><body><table><tr><td><pre>exact code</pre><a class="i-copy-code">Copy</a></td></tr></table></body></html>'
            store.save_original(record,raw,{'http_status':200,'final_url':record['source_url'],'mime':'text/html','encoding':'utf-8'});sdk.convert(store,record)
            selection['article_ids'].append(record['id'])
            report=self.run_validation(store,selection)
            self.assertIn('SDK_COPY_PAYLOAD_EVIDENCE_INCOMPLETE',{i['error'] for i in report['issues']})

    def test_main_updates_only_sdk_pilot_and_releases_interrupted_worker(self):
        with tempfile.TemporaryDirectory() as folder:
            store,_,_,_=self.fixture(folder)
            with patch.object(verify,'__file__',str(store.root/'tools/verify_sdk.py')),patch.dict(os.environ,LOCALAPPDATA=folder),patch.object(verify,'validate',side_effect=KeyboardInterrupt):
                with self.assertRaises(KeyboardInterrupt):verify.main()
            state=read_json(store.root/'_project/STATE.json')
            self.assertFalse(state['worker_running']);self.assertEqual(state['pilot'],'PASSED')
            self.assertEqual(state['modules']['SDK']['pilot'],'NOT_RUN')
            self.assertEqual(state['phase'],'SDK_VERIFICATION_INTERRUPTED')


if __name__=='__main__':unittest.main()
