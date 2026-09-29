"""Owner work acceptance survives maintenance without changing technical facts."""
import json
import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
from collector import Store,SEEDS,atomic_json,read_json,digest
from article_data import convert
from module_policy import ACCEPTED,ACCEPTANCE_PATH,build_acceptance
import module_policy
import audit_module
import run_aim
import report_source_gaps
import build_delivery_inventory
import verify_delivery


class OwnerAcceptanceIntegrationTests(unittest.TestCase):
    def fixture(self,folder):
        root=Path(folder)/'repo';store=Store(root,cache_records=True)
        store.checkpoint(phase='AIM_SOURCE_BLOCKED',blockers=[])
        state=read_json(root/'_project/STATE.json');state['pilot']='PASSED';atomic_json(root/'_project/STATE.json',state)
        source=store.discover('AIM','Content/fixture.htm',SEEDS['AIM'],'fixture','article')
        store.save_original(source,b'<html><body><a href="missing.htm">Exact published link</a></body></html>',
                            {'http_status':200,'final_url':source['source_url'],'mime':'text/html'})
        convert(store,source)
        missing=next(r for r in store.records('AIM') if r['id']!=source['id'])
        missing.update(status='FAILED',last_failure={'class':'NOT_FOUND','detail':'HTTP 404','at':'old'})
        store.save_record(missing)
        gaps={'checked_at':'old','missing_resources':[{'id':missing['id'],'url':missing['source_url'],'type':'article',
            'last_failure':missing['last_failure'],'published_occurrences':missing['occurrences']}],
            'broken_anchor_references':[]}
        atomic_json(root/'AIM/reports/source-gaps.json',gaps)
        with patch.object(audit_module,'visual_proof',return_value={'passed':True}),patch.object(audit_module,'reading_index_proof',return_value={'passed':True}):
            audit=audit_module.audit(store,'AIM')
        inventory={'schema_version':1,'file_count':1,'files':[{'path':'AIM/source/fixture.htm','byte_count':1,'sha256':'f'*64}]}
        receipt={'verified_commit':'b'*40,'checkpoint_integrity_passed':True,
                 'repository':'edfortheblind/scale-intelligence','visibility':'PRIVATE',
                 'artifact_inventory_sha256':digest(json.dumps(inventory).encode())}
        blobs={'AIM/reports/source-gaps.json':gaps,'AIM/reports/module-audit.json':audit,'_project/delivery-checkpoint.json':receipt,
               '_project/artifact-inventory.json':inventory}
        with patch.object(module_policy,'_commit',side_effect=lambda root,commit:commit),patch.object(module_policy,'_git_blob',side_effect=lambda root,commit,path:json.dumps(blobs[path]).encode()):
            acceptance=build_acceptance(store,'Fixture: accept the documented AIM exceptions and proceed to SDK.','a'*40)
        atomic_json(root/ACCEPTANCE_PATH,acceptance)
        state=read_json(root/'_project/STATE.json')
        state['modules']['AIM'].update(status=ACCEPTED,owner_acceptance=ACCEPTANCE_PATH)
        state.update(module='SDK',phase='SDK_DISCOVERY_IN_PROGRESS',blockers=[{'code':'SDK_FIXTURE_BLOCKER'}],next_invocation='Continue SDK.')
        atomic_json(root/'_project/STATE.json',state)
        for name in ('01_AIM_MASTER_PROMPT.md','02_SDK_MASTER_PROMPT.md'):(root/name).write_text('Fixture prompt')
        atomic_json(root/'_project/preflight.json',{'prompt_inputs':[]})
        database=b'Fixture search database';(root/'_project/search.sqlite').write_bytes(database)
        atomic_json(root/'_project/search-index.json',{'database':'_project/search.sqlite','sha256':digest(database)})
        return root,store,state,missing

    def test_reaudit_retains_owner_status_and_active_sdk_phase(self):
        with tempfile.TemporaryDirectory() as folder:
            root,store,prior,missing=self.fixture(folder)
            with patch.object(audit_module,'visual_proof',return_value={'passed':True}),patch.object(audit_module,'reading_index_proof',return_value={'passed':True}):
                result=audit_module.audit(store,'AIM')
            state=read_json(root/'_project/STATE.json')
            self.assertEqual(result['work_status'],ACCEPTED)
            self.assertFalse(result['module_local_complete']);self.assertFalse(result['discovery_reconciled'])
            self.assertEqual(state['modules']['AIM']['status'],ACCEPTED)
            for key in ('phase','module','blockers','next_invocation'):self.assertEqual(state[key],prior[key])
            self.assertEqual(next(r for r in store.records('AIM') if r['id']==missing['id'])['status'],'FAILED')
            self.assertEqual(read_json(root/'AIM/reports/coverage.json')['technical_status'],'DISCOVERY_INCOMPLETE')

    def test_accepted_aim_driver_starts_no_children_and_preserves_sdk_state(self):
        with tempfile.TemporaryDirectory() as folder:
            root,_,_,_=self.fixture(folder);before=(root/'_project/STATE.json').read_bytes()
            with patch.object(run_aim,'__file__',str(root/'tools/run_aim.py')),patch.dict(os.environ,LOCALAPPDATA=folder),patch.object(run_aim.subprocess,'run') as child:
                self.assertEqual(run_aim.main(offline=True),0)
            child.assert_not_called()
            self.assertEqual((root/'_project/STATE.json').read_bytes(),before)

    def test_source_gap_regeneration_preserves_exceptions_and_discloses_acceptance(self):
        with tempfile.TemporaryDirectory() as folder:
            root,_,_,_=self.fixture(folder)
            with patch.object(report_source_gaps,'__file__',str(root/'tools/report_source_gaps.py')),patch.dict(os.environ,LOCALAPPDATA=folder):
                report_source_gaps.main()
            report=read_json(root/'AIM/reports/source-gaps.json')
            self.assertFalse(report['complete_corpus']);self.assertEqual(report['work_status'],ACCEPTED)
            self.assertEqual(len(report['missing_resources']),1)
            self.assertIn('publisher deprecation is unverified',(root/'AIM/reports/source-gaps.md').read_text())

    def test_inventory_includes_and_verifier_requires_acceptance(self):
        with tempfile.TemporaryDirectory() as folder:
            root,_,_,_=self.fixture(folder)
            inventory=build_delivery_inventory.build(root)
            self.assertIn(ACCEPTANCE_PATH,{entry['path'] for entry in inventory['files']})
            self.assertTrue(verify_delivery.verify(root)['checkpoint_integrity_passed'])
            inventory['files']=[entry for entry in inventory['files'] if entry['path']!=ACCEPTANCE_PATH]
            inventory['file_count']=len(inventory['files']);atomic_json(root/'_project/artifact-inventory.json',inventory)
            result=verify_delivery.verify(root)
            self.assertFalse(result['checkpoint_integrity_passed'])
            self.assertIn('MANDATORY_OWNER_ACCEPTANCE_MISSING_OR_UNINVENTORIED',{item['error'] for item in result['failures']})

    def test_deleted_acceptance_blocks_clone_verification(self):
        with tempfile.TemporaryDirectory() as folder:
            root,_,_,_=self.fixture(folder);build_delivery_inventory.build(root)
            (root/ACCEPTANCE_PATH).unlink()
            result=verify_delivery.verify(root)
            self.assertFalse(result['checkpoint_integrity_passed'])
            self.assertIn('OWNER_ACCEPTANCE_INVALID_OR_STALE',{item['error'] for item in result['failures']})

    def test_nonaccepted_checkpoint_does_not_require_acceptance(self):
        with tempfile.TemporaryDirectory() as folder:
            root,_,state,_=self.fixture(folder)
            state['modules']['AIM']['status']='DISCOVERY_INCOMPLETE'
            atomic_json(root/'_project/STATE.json',state);(root/ACCEPTANCE_PATH).unlink()
            inventory=build_delivery_inventory.build(root)
            self.assertNotIn(ACCEPTANCE_PATH,{entry['path'] for entry in inventory['files']})
            self.assertTrue(verify_delivery.verify(root)['checkpoint_integrity_passed'])


if __name__=='__main__':unittest.main()
