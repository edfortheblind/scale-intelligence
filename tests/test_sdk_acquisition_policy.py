import copy
import json
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
import sdk_acquisition_policy as policy


class SdkAcquisitionPolicyTests(unittest.TestCase):
    def setUp(self):
        self.folder=tempfile.TemporaryDirectory();self.addCleanup(self.folder.cleanup)
        self.root=Path(self.folder.name);self.store=SimpleNamespace(root=self.root)
        (self.root/'original').write_bytes(b'original')
        self.data={'id':'a','content_tree':{},'inventory':{},'reading':{'html':'SDK/reading/a.html','markdown':'SDK/reading/a.md'}}
        self.catalog={'a':{'local_path':'original','app_data_path':'SDK/data/articles/a.json'}}

    def generation(self,path,sha):
        return {'catalog_identity':['unchanged'],'files':[{'path':path,'sha256':sha}],'sha256':sha}

    def test_selected_derivative_change_uses_five_value_parser_and_recovery(self):
        before=self.generation('SDK/data/articles/a.json','old');after=self.generation('SDK/data/articles/a.json','new')
        with patch.object(policy.verify_sdk.adapter,'parse_article',return_value=(None,{},'utf8','title','base')),patch.object(policy.verify_sdk.adapter,'inventory',return_value={}),patch.object(policy.verify_sdk,'verify_reading',return_value={'passed':True}),patch.object(policy.verify_sdk,'recovery_check',return_value=([],[{'id':'a'}])) as recovery:
            policy._fresh_generation(self.store,{'inputs':before},after,self.catalog,[self.data])
            recovery.assert_called_once()

    def test_changed_css_source_and_code_are_rejected(self):
        for path in ('SDK/reading/assets/a.css','SDK/data/stylesheets/a.json','SDK/source/a.html','tools/sdk_article_data.py'):
            with self.subTest(path=path),self.assertRaisesRegex(ValueError,'source, support or semantic'):
                policy._fresh_generation(self.store,{'inputs':self.generation(path,'old')},self.generation(path,'new'),self.catalog,[self.data])

    def test_changed_derivative_without_recovery_is_rejected(self):
        before=self.generation('SDK/reading/a.html','old');after=self.generation('SDK/reading/a.html','new')
        with patch.object(policy.verify_sdk.adapter,'parse_article',return_value=(None,{},'utf8','title','base')),patch.object(policy.verify_sdk.adapter,'inventory',return_value={}),patch.object(policy.verify_sdk,'verify_reading',return_value={'passed':True}),patch.object(policy.verify_sdk,'recovery_check',return_value=([{'error':'mismatch'}],[])),self.assertRaisesRegex(ValueError,'deterministic recovery'):
            policy._fresh_generation(self.store,{'inputs':before},after,self.catalog,[self.data])

    def test_new_original_identity_is_rejected(self):
        before=self.generation('SDK/data/articles/a.json','old');after=copy.deepcopy(before);after['catalog_identity']=['changed']
        with self.assertRaisesRegex(ValueError,'identity/metadata'):
            policy._fresh_generation(self.store,{'inputs':before},after,self.catalog,[self.data])

    def test_unapproved_sdk_cannot_inherit_aim_pass(self):
        result=policy.sdk_acquisition_readiness(self.store,{'pilot':'PASSED','modules':{'SDK':{'pilot':'FAILED'}}})
        self.assertFalse(result['ready']);self.assertFalse(result['completion_granted'])

    def test_passed_pilot_must_be_current(self):
        with patch.object(policy.verify_sdk,'pilot_proof_current',return_value={'passed':False,'issues':['stale']}):
            result=policy.sdk_acquisition_readiness(self.store,{'modules':{'SDK':{'pilot':'PASSED'}}})
        self.assertFalse(result['ready'])

    def test_owner_disposition_must_preserve_completion_gate(self):
        path=self.root/policy.DISPOSITION;path.parent.mkdir(parents=True)
        disposition={'module':'SDK','owner_answer':'proceed','bulk_authorized_with_failed_pilot':True,'technical_pilot_status':'FAILED','completion_exception_granted':False}
        path.write_text(json.dumps(disposition));policy._owner_answer(self.store,'proceed')
        disposition['completion_exception_granted']=True;path.write_text(json.dumps(disposition))
        with self.assertRaises(ValueError):policy._owner_answer(self.store,'proceed')


if __name__=='__main__':unittest.main()
