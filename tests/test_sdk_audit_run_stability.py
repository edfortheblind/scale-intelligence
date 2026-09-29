"""Source-gap failures may coexist with evidence; unstable inputs may not."""
import os
from pathlib import Path
import sys
import tempfile
import unittest

repository=Path(os.environ.get('SDK_TEST_REPOSITORY',Path(__file__).resolve().parents[1]))
sys.path[:0]=[str(Path(__file__).resolve().parents[1]/'tools'),str(repository/'tools'),str(repository/'tests')]
import audit_sdk
import test_audit_sdk
from collector import read_json,atomic_json


class SdkAuditRunStabilityTests(unittest.TestCase):
    def setUp(self):
        self.helper=test_audit_sdk.SdkAuditTests();self.helper.setUp();self.addCleanup(self.helper.doCleanups)

    def test_restored_input_bytes_do_not_rehabilitate_a_measured_unstable_run(self):
        for error in ('SDK_INPUTS_CHANGED_DURING_VERIFICATION','SDK_INPUTS_UNAVAILABLE_AFTER_VERIFICATION'):
            with self.subTest(error=error),tempfile.TemporaryDirectory() as folder:
                store,_,_,_=self.helper.fixture(folder)
                path=store.root/'SDK/reports/captured-fidelity.json';report=read_json(path)
                # Current bytes equal the initial bound generation, but the
                # verifier observed an interruption/change while gathering proof.
                report['issues'].append({'error':error});report['status']='FAILED';atomic_json(path,report)
                result=audit_sdk.capture_proof(store,{r['id']:r for r in store.records('SDK')})
                self.assertFalse(result['current']);self.assertIn('CAPTURED_RUN_INPUTS_WERE_UNSTABLE',result['issues'])

    def test_nominal_visible_count_does_not_hide_a_documentary_state_error(self):
        edge={'kind':'section','body_node':'n1'}
        proof={'current':True,'report':{'browser':[{'id':'article','visible_variants':1,'active_elements':0,'copy_payloads':[]}],
            'recovery':[{'id':'article','idempotent':True,'interruption_preserved_prior_bytes':True,'missing_derivative_recovered':True}],
            'issues':[{'id':'article','error':'DOCUMENTARY_STATE_HIDDEN','node_id':'n1'}]}}
        self.assertFalse(audit_sdk.browser_article(proof,'article',{'n1'},[edge]))
        proof['report']['issues']=[]
        self.assertTrue(audit_sdk.browser_article(proof,'article',{'n1'},[edge]))


if __name__=='__main__':unittest.main()
