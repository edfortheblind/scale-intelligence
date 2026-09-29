"""Exercise controller sequencing without a browser or Stage requests."""
import os
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
from collector import Store, atomic_json, read_json, SEEDS
from article_data import convert
from audit_module import audit
from style_data import convert_styles
import run_aim


class ControllerTests(unittest.TestCase):
    def fixture(self,folder):
        root=Path(folder)/'repo'
        store=Store(root)
        store.checkpoint(phase='AIM_CAPTURE_READY',blockers=[])
        state=read_json(root/'_project/STATE.json')
        state['pilot']='PASSED'
        atomic_json(root/'_project/STATE.json',state)
        return root,store

    def test_auth_block_stops_children_and_preserves_saved_progress(self):
        with tempfile.TemporaryDirectory() as folder:
            root,store=self.fixture(folder)
            resource=store.discover('AIM','Content/fixture.htm',SEEDS['AIM'],'fixture','article')
            store.save_original(resource,b'<html><body>Exact text</body></html>',{'http_status':200,'final_url':resource['source_url'],'mime':'text/html'})
            calls=[]
            def child(command,**kwargs):
                calls.append(command)
                store.checkpoint(phase='BLOCKED_AUTH',blockers=[{'code':'BLOCKED_AUTH','detail':'Normal SSO required'}])
                return SimpleNamespace(returncode=0)
            with patch.object(run_aim,'__file__',str(root/'tools/run_aim.py')),patch.dict(os.environ,LOCALAPPDATA=folder),patch.object(run_aim.subprocess,'run',side_effect=child):
                self.assertEqual(run_aim.main(),1)
            state=read_json(root/'_project/STATE.json')
            self.assertEqual(len(calls),1)
            self.assertFalse(state['controller']['running'])
            self.assertEqual(state['blockers'][0]['code'],'BLOCKED_AUTH')
            self.assertEqual(store.verify()['stored_bodies_verified'],1)

    def test_navigation_discovery_reenters_capture_before_final_audit(self):
        with tempfile.TemporaryDirectory() as folder:
            root,store=self.fixture(folder)
            calls=[]
            def child(command,**kwargs):
                script=command[2]
                calls.append(script)
                if script=='tools/discover_aim.py' and calls.count(script)==1:
                    store.discover('AIM','Content/new.htm',SEEDS['AIM'],'fixture','article')
                elif script=='tools/acquire.py' and command[4]=='article':
                    for record in store.records('AIM'):
                        store.save_original(record,b'<html><body>New</body></html>',{'http_status':200,'final_url':record['source_url'],'mime':'text/html'})
                elif script=='tools/audit_module.py':
                    atomic_json(root/'AIM/reports/module-audit.json',{'source_failures':[],'fidelity_issues':[]})
                return SimpleNamespace(returncode=0)
            with patch.object(run_aim,'__file__',str(root/'tools/run_aim.py')),patch.dict(os.environ,LOCALAPPDATA=folder),patch.object(run_aim.subprocess,'run',side_effect=child):
                self.assertEqual(run_aim.main(),0)
            self.assertEqual(calls.count('tools/discover_aim.py'),2)
            self.assertEqual(calls.count('tools/audit_module.py'),1)
            state=read_json(root/'_project/STATE.json')
            self.assertNotEqual(state['modules']['AIM']['status'],'MODULE_LOCAL_COMPLETE')
            self.assertFalse(state['controller']['running'])

    def test_audit_reports_missing_targets_without_granting_completion(self):
        with tempfile.TemporaryDirectory() as folder:
            root,store=self.fixture(folder)
            record=store.discover('AIM','Content/fixture.htm',SEEDS['AIM'],'fixture','article')
            source=b'<html><head><title>Fixture</title></head><body><a href="missing.htm">Exact link</a></body></html>'
            store.save_original(record,source,{'http_status':200,'final_url':record['source_url'],'mime':'text/html'})
            convert(store,record)
            result=audit(store,'AIM')
            self.assertFalse(result['module_local_complete'])
            self.assertFalse(result['discovery_reconciled'])
            self.assertEqual(result['fidelity_issues'][0]['errors']['INTERNAL_TARGET_NOT_CAPTURED'],1)
            self.assertEqual(result['counts']['articles']['structurally_verified'],0)

    def test_recursive_css_and_damaged_json_are_audited_independently(self):
        with tempfile.TemporaryDirectory() as folder:
            root,store=self.fixture(folder)
            def save(href,kind,body):
                record=store.discover('AIM',href,SEEDS['AIM'],'fixture',kind)
                store.save_original(record,body,{'http_status':200,'final_url':record['source_url'],'mime':'text/html' if kind=='article' else 'text/css'})
                return record
            a=save('Content/a.css','stylesheet',b'@import "b.css";')
            b=save('Content/b.css','stylesheet',b'body {background:url(missing.png)}')
            convert_styles(store,'AIM')
            record=save('Content/fixture.htm','article',b'<html><head><title>Fixture</title><link rel="stylesheet" href="a.css"></head><body>Exact</body></html>')
            convert(store,record)
            broken=save('Content/broken.htm','article',b'<html><body>Other</body></html>')
            convert(store,broken)
            (root/broken['app_data_path']).write_text('{broken json')
            result=audit(store,'AIM')
            by_id={item['id']:item for item in result['fidelity_issues']}
            self.assertEqual(by_id[record['id']]['errors']['CSS_CLOSURE_INCOMPLETE'],1)
            self.assertEqual(by_id[broken['id']]['error'],'ARTICLE_AUDIT_FAILED')

    def test_interrupt_waits_for_child_exit_then_stops_controller(self):
        with tempfile.TemporaryDirectory() as folder:
            root,store=self.fixture(folder)
            calls=[]
            def child(command,**kwargs):
                calls.append(command)
                run_aim.signal.getsignal(run_aim.signal.SIGINT)(run_aim.signal.SIGINT,None)
                store.checkpoint(phase='DISCOVERY_INCOMPLETE',blockers=[])
                return SimpleNamespace(returncode=0)
            with patch.object(run_aim,'__file__',str(root/'tools/run_aim.py')),patch.dict(os.environ,LOCALAPPDATA=folder),patch.object(run_aim.subprocess,'run',side_effect=child):
                self.assertEqual(run_aim.main(),1)
            state=read_json(root/'_project/STATE.json')
            self.assertEqual(len(calls),1)
            self.assertFalse(state['controller']['running'])
            self.assertEqual(state['controller']['result'],'CONTROLLER_INTERRUPTED_AFTER_SAFE_CHILD_EXIT')


if __name__=='__main__':unittest.main()
