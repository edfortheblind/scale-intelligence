"""Metadata and acquisition guards; no browser or network operations occur."""
from pathlib import Path
import os
import sys
import tempfile
import unittest

repository=Path(os.environ.get('SDK_TEST_REPOSITORY',Path(__file__).resolve().parents[1]))
sys.path[:0]=[str(repository/'tools'),str(repository/'tests')]
import test_verify_sdk as fidelity_fixtures
import test_acquire as acquire_fixtures
import verify_sdk
from collector import SEEDS,atomic_json,read_json


class SdkProofGuardTests(unittest.TestCase):
    def setUp(self):
        self.fidelity=fidelity_fixtures.VerifySdkTests()
        self.fidelity.setUp();self.addCleanup(self.fidelity.doCleanups)
        self.acquisition=acquire_fixtures.AcquireModuleTests()

    def passed_fixture(self,folder):
        store,selection,_,_=self.fidelity.fixture(folder)
        # These checks exercise binding/gating only. Native browser behavior and
        # actual recovery have separate tests and captured pilot evidence.
        replay=lambda _store,_catalog,documents:([],[{'id':d['id'],'idempotent':True,'interruption_preserved_prior_bytes':True,'missing_derivative_recovered':True} for d in documents])
        report=self.fidelity.run_validation(store,selection,replay=replay)
        self.assertEqual(report['status'],'PASSED',report['issues'])
        self.fidelity.save_proof(store,selection,report)
        self.assertTrue(verify_sdk.pilot_proof_current(store)['passed'])
        return store,selection

    def test_decoding_base_and_mime_metadata_changes_invalidate_proof(self):
        changes={'encoding':'windows-1252','final_url':SEEDS['SDK'].split('#')[0]+'/changed-base/Welcome.html','mime':'text/plain'}
        for field,value in changes.items():
            with self.subTest(field=field),tempfile.TemporaryDirectory() as folder:
                store,selection=self.passed_fixture(folder)
                record=next(r for r in store.records('SDK') if r['id']==selection['article_ids'][0])
                original=(store.root/record['local_path']).read_bytes()
                record[field]=value;store.save_record(record)
                result=verify_sdk.pilot_proof_current(store)
                self.assertFalse(result['passed']);self.assertIn('SDK_PILOT_INPUTS_CHANGED',result['issues'])
                self.assertEqual((store.root/record['local_path']).read_bytes(),original)

    def test_passed_status_without_bound_proof_refuses_browser_and_bulk(self):
        with tempfile.TemporaryDirectory() as folder:
            root,store=self.acquisition.fixture(folder)
            selected=self.acquisition.resource(store,'SDK','Welcome.html')
            outside=self.acquisition.resource(store,'SDK','Other.html')
            self.acquisition.selection(root,[selected])
            state=read_json(root/'_project/STATE.json');state['modules']['SDK']['pilot']='PASSED';atomic_json(root/'_project/STATE.json',state)
            before=(root/'_project/STATE.json').read_bytes()
            run=self.acquisition.run_candidate(root,folder,['--module','SDK','--kind','article','--limit','50'])
            self.assertIsInstance(run.result,ValueError);self.assertIn('SDK_PILOT_PROOF_NOT_CURRENT',str(run.result))
            run.browser.assert_not_called();run.transport_factory.assert_not_called();self.assertEqual(run.calls,[])
            self.assertEqual((root/'_project/STATE.json').read_bytes(),before)
            self.assertTrue(all(r['status']=='PENDING' and r['attempts']==0 for r in store.records('SDK')))
            self.assertEqual({r['id'] for r in store.records('SDK')},{selected['id'],outside['id']})

    def test_stale_passed_proof_refuses_explicit_bulk_id_before_browser(self):
        with tempfile.TemporaryDirectory() as folder:
            store,selection=self.passed_fixture(folder)
            outside=store.discover('SDK','OutsidePilot.html',SEEDS['SDK'],'synthetic_fixture','article')
            record=next(r for r in store.records('SDK') if r['id']==selection['article_ids'][0]);record['encoding']='windows-1252';store.save_record(record)
            before=(store.root/'_project/STATE.json').read_bytes()
            run=self.acquisition.run_candidate(store.root,folder,['--module','SDK','--kind','article','--ids',outside['id']])
            self.assertIsInstance(run.result,ValueError);self.assertIn('SDK_PILOT_INPUTS_CHANGED',str(run.result))
            run.browser.assert_not_called();run.transport_factory.assert_not_called();self.assertEqual(run.calls,[])
            self.assertEqual((store.root/'_project/STATE.json').read_bytes(),before)
            pending=next(r for r in store.records('SDK') if r['id']==outside['id'])
            self.assertEqual(pending['status'],'PENDING');self.assertEqual(pending['attempts'],0)


if __name__=='__main__':unittest.main()
