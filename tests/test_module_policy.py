"""Owner acceptance changes readiness, never source facts or numeric coverage."""
import copy
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
from collector import Store,atomic_json,read_json,digest
from completion_gates import catalog_hash
import module_policy as policy


class OwnerAcceptanceTests(unittest.TestCase):
    def fixture(self,folder):
        root=Path(folder);base='https://travstg.manhscale.com/SCALEHelp/Help/WebHelp/Content/'
        records=[{'id':str(i)*64,'module':'AIM','type':'article','status':'BODY_SAVED' if i<3 else 'FAILED',
                  'source_url':base+str(i)+'.htm','sha256':str(i+3)*64 if i<3 else None,
                  'local_path':'AIM/source/'+str(i)+'.htm' if i<3 else None} for i in range(1,4)]
        records[-1]['last_failure']={'class':'NOT_FOUND','detail':'HTTP 404','at':'old'}
        for record in records:atomic_json(root/'AIM/manifests/resources'/(record['id']+'.json'),record)
        gaps={'checked_at':'old','missing_resources':[{'id':records[2]['id'],'url':records[2]['source_url'],
            'type':'article','last_failure':records[2]['last_failure'],'published_occurrences':[]}],
            'broken_anchor_references':[{'source_id':records[0]['id'],'source_url':records[0]['source_url'],
                'source_sha256':records[0]['sha256'],'node_id':'n7','literal_href':'2.htm#missing','fragment':'missing',
                'target_id':records[1]['id'],'target_url':records[1]['source_url'],'target_sha256':records[1]['sha256']}]}
        atomic_json(root/'AIM/reports/source-gaps.json',gaps)
        audit={'catalog_sha256':catalog_hash(records),'counts':{'articles':{'known':3,'originals_saved':2,'structurally_verified':2}},
            'gates':{name:True for name in ('pilot_passed','original_integrity','resource_fidelity','local_reading_navigation','representative_visual_review')}}
        inventory={'schema_version':1,'file_count':1,'files':[{'path':'AIM/source/fixture.htm','byte_count':1,'sha256':'f'*64}]}
        receipt={'verified_commit':'b'*40,'checkpoint_integrity_passed':True,
                 'repository':'edfortheblind/scale-intelligence','visibility':'PRIVATE',
                 'artifact_inventory_sha256':digest(json.dumps(inventory).encode())}
        blobs={'AIM/reports/source-gaps.json':gaps,'AIM/reports/module-audit.json':audit,'_project/delivery-checkpoint.json':receipt,
               '_project/artifact-inventory.json':inventory}
        self.baseline_blobs=blobs
        store=Store(root,cache_records=True)
        with patch.object(policy,'_commit',side_effect=lambda root,commit:commit),patch.object(policy,'_git_blob',side_effect=lambda root,commit,path:json.dumps(blobs[path]).encode()):
            acceptance=policy.build_acceptance(store,'Fixture owner statement, preserved exactly.','a'*40)
        atomic_json(root/policy.ACCEPTANCE_PATH,acceptance)
        state={'modules':{'AIM':{'status':policy.ACCEPTED,'owner_acceptance':policy.ACCEPTANCE_PATH}}}
        atomic_json(root/'_project/STATE.json',state)
        return store,state,acceptance,gaps

    def test_valid_owner_acceptance_allows_sdk_without_technical_completion(self):
        with tempfile.TemporaryDirectory() as folder:
            store,state,acceptance,_=self.fixture(folder)
            result=policy.require_sdk_ready(store.root,state)
            self.assertTrue(result['ready']);self.assertEqual(result['basis'],'owner_accepted_exceptions')
            self.assertFalse(acceptance['technical_facts']['module_local_complete'])
            self.assertFalse(acceptance['technical_facts']['complete_corpus'])
            self.assertEqual(acceptance['owner_instruction'],'Fixture owner statement, preserved exactly.')
            self.assertEqual(store.records('AIM')[-1]['status'],'FAILED')
            self.assertEqual(acceptance['technical_facts']['deprecation'],'Owner hypothesis; publisher deprecation is unverified')

    def test_original_capture_percentage_is_9971_not_100(self):
        records=[{'type':'article','status':'BODY_SAVED' if i<2446 else 'FAILED'} for i in range(2453)]
        capture=policy._capture(records)
        self.assertEqual(capture['percent'],99.71)
        self.assertEqual((capture['captured'],capture['known']),(2446,2453))
        self.assertEqual(capture['denominator_status'],'KNOWN_LOWER_BOUND')

    def test_sdk_stays_blocked_without_explicit_acceptance(self):
        with tempfile.TemporaryDirectory() as folder:
            store,state,_,_=self.fixture(folder)
            state['modules']['AIM']={'status':'DISCOVERY_INCOMPLETE'}
            with self.assertRaisesRegex(ValueError,'AIM_COMPLETION_OR_OWNER_ACCEPTANCE_REQUIRED'):
                policy.require_sdk_ready(store.root,state)

    def test_missing_or_altered_acceptance_cannot_authorize_sdk(self):
        with tempfile.TemporaryDirectory() as folder:
            store,state,acceptance,_=self.fixture(folder)
            changed=copy.deepcopy(acceptance);changed['technical_facts']['module_local_complete']=True
            atomic_json(store.root/policy.ACCEPTANCE_PATH,changed)
            with self.assertRaises(ValueError):policy.require_sdk_ready(store.root,state)
            (store.root/policy.ACCEPTANCE_PATH).unlink()
            with self.assertRaises(ValueError):policy.require_sdk_ready(store.root,state)

    def test_new_missing_resource_invalidates_only_current_readiness(self):
        with tempfile.TemporaryDirectory() as folder:
            store,state,acceptance,_=self.fixture(folder)
            extra={'id':'9'*64,'module':'AIM','type':'article','status':'FAILED','source_url':'https://travstg.manhscale.com/SCALEHelp/Help/WebHelp/Content/new.htm',
                   'sha256':None,'local_path':None,'last_failure':{'class':'NOT_FOUND','detail':'HTTP 404'}}
            atomic_json(store.root/'AIM/manifests/resources'/(extra['id']+'.json'),extra)
            with self.assertRaises(ValueError):policy.require_sdk_ready(store.root,state)
            self.assertEqual(read_json(store.root/policy.ACCEPTANCE_PATH),acceptance)

    def test_changed_anchor_tuple_invalidates_acceptance(self):
        with tempfile.TemporaryDirectory() as folder:
            store,state,_,gaps=self.fixture(folder)
            gaps['broken_anchor_references'][0]['fragment']='new_missing_fragment'
            atomic_json(store.root/'AIM/reports/source-gaps.json',gaps)
            with self.assertRaises(ValueError):policy.require_sdk_ready(store.root,state)

    def test_retry_and_report_timestamps_do_not_expire_acceptance(self):
        with tempfile.TemporaryDirectory() as folder:
            store,state,_,gaps=self.fixture(folder)
            gaps['checked_at']='new';gaps['missing_resources'][0]['last_failure']['at']='new'
            atomic_json(store.root/'AIM/reports/source-gaps.json',gaps)
            record=store.records('AIM')[-1];record['last_failure']['at']='new'
            store.save_record(record)
            self.assertTrue(policy.require_sdk_ready(store.root,state)['ready'])

    def test_reaudit_preserves_acceptance_but_raw_gate_remains_false(self):
        with tempfile.TemporaryDirectory() as folder:
            store,state,_,_=self.fixture(folder)
            technical={'status':'DISCOVERY_INCOMPLETE','module_local_complete':False,'discovery_reconciled':False}
            self.assertEqual(policy.effective_module_status(store,'AIM',technical['status'],state),policy.ACCEPTED)
            self.assertFalse(technical['module_local_complete']);self.assertFalse(technical['discovery_reconciled'])
            self.assertEqual(policy.effective_module_status(store,'SDK',technical['status'],state),'DISCOVERY_INCOMPLETE')

    def test_delivery_requires_acceptance_file_only_for_accepted_state(self):
        self.assertEqual(policy.required_acceptance_paths({'modules':{}}),[])
        state={'modules':{'AIM':{'status':policy.ACCEPTED,'owner_acceptance':policy.ACCEPTANCE_PATH}}}
        self.assertEqual(policy.required_acceptance_paths(state),[policy.ACCEPTANCE_PATH])
        state['modules']['AIM']['owner_acceptance']='../different.json'
        with self.assertRaises(ValueError):policy.required_acceptance_paths(state)

    def test_technical_completion_remains_a_separate_valid_handoff(self):
        with tempfile.TemporaryDirectory() as folder:
            result=policy.require_sdk_ready(Path(folder),{'modules':{'AIM':{'status':'MODULE_LOCAL_COMPLETE'}}})
            self.assertTrue(result['ready']);self.assertEqual(result['basis'],'technical_completion')

    def test_changed_proof_hashes_are_rejected_even_with_successfully_cached_git_bundle(self):
        with tempfile.TemporaryDirectory() as folder:
            store,state,acceptance,_=self.fixture(folder)
            keys=('source_gap_report_sha256','module_audit_sha256','delivery_receipt_sha256','artifact_inventory_sha256')
            with patch.object(policy,'_git_blob',side_effect=AssertionError('Successful immutable bundle should be cached')):
                for key in keys:
                    with self.subTest(key=key):
                        changed=copy.deepcopy(acceptance);changed['baseline'][key]='0'*64
                        atomic_json(store.root/policy.ACCEPTANCE_PATH,changed)
                        result=policy.acceptance_readiness(store,state)
                        self.assertFalse(result['ready']);self.assertIn('hash mismatch',result['detail'])

    def test_changed_verified_commit_and_missing_decision_commit_are_rejected(self):
        with tempfile.TemporaryDirectory() as folder:
            store,state,acceptance,_=self.fixture(folder)
            changed=copy.deepcopy(acceptance);changed['baseline']['verified_corpus_commit']='0'*40
            atomic_json(store.root/policy.ACCEPTANCE_PATH,changed)
            self.assertIn('differs from the immutable delivery receipt',policy.acceptance_readiness(store,state)['detail'])
            changed=copy.deepcopy(acceptance);changed['baseline']['decision_commit']='0'*40
            atomic_json(store.root/policy.ACCEPTANCE_PATH,changed)
            with patch.object(policy,'_commit',side_effect=OSError('Synthetic missing Git object')):
                result=policy.acceptance_readiness(store,state)
                self.assertFalse(result['ready']);self.assertIn('Git proof unavailable',result['detail'])

    def test_receipt_must_bind_inventory_at_its_verified_commit_and_failure_is_not_cached(self):
        with tempfile.TemporaryDirectory() as folder:
            store,state,_,_=self.fixture(folder)
            policy._baseline_bundle.cache_clear()
            blobs=copy.deepcopy(self.baseline_blobs)
            original=blobs['_project/delivery-checkpoint.json']['artifact_inventory_sha256']
            blobs['_project/delivery-checkpoint.json']['artifact_inventory_sha256']='0'*64
            seen=[]
            def get_blob(root,commit,path):
                seen.append((commit,path));return json.dumps(blobs[path]).encode()
            with patch.object(policy,'_commit',side_effect=lambda root,commit:commit),patch.object(policy,'_git_blob',side_effect=get_blob):
                result=policy.acceptance_readiness(store,state)
                self.assertFalse(result['ready']);self.assertIn('does not bind',result['detail'])
                blobs['_project/delivery-checkpoint.json']['artifact_inventory_sha256']=original
                self.assertTrue(policy.acceptance_readiness(store,state)['ready'])
                count=len(seen)
                self.assertTrue(policy.acceptance_readiness(store,state)['ready'])
                self.assertEqual(len(seen),count)
                self.assertIn(('b'*40,'_project/artifact-inventory.json'),seen)

    def test_immutable_audit_bytes_must_match_recorded_report_hash(self):
        with tempfile.TemporaryDirectory() as folder:
            store,state,_,_=self.fixture(folder)
            policy._baseline_bundle.cache_clear()
            blobs=copy.deepcopy(self.baseline_blobs)
            blobs['AIM/reports/module-audit.json']['extra_report_field']='Different immutable report'
            with patch.object(policy,'_commit',side_effect=lambda root,commit:commit),patch.object(policy,'_git_blob',side_effect=lambda root,commit,path:json.dumps(blobs[path]).encode()):
                result=policy.acceptance_readiness(store,state)
                self.assertFalse(result['ready']);self.assertIn('module_audit_sha256',result['detail'])

    def test_scoped_sdk_integrity_report_never_inherits_aim_pilot(self):
        with tempfile.TemporaryDirectory() as folder:
            store=Store(folder)
            state={'pilot':'PASSED','modules':{'AIM':{},'SDK':{'pilot':'FAILED'}}}
            atomic_json(store.root/'_project/STATE.json',state)
            self.assertEqual(store.verify(module='SDK')['pilot'],'FAILED')
            self.assertEqual(store.verify(module='AIM')['pilot'],'PASSED')
            self.assertEqual(store.verify()['pilot'],'PASSED')
            state['modules']['SDK'].pop('pilot');atomic_json(store.root/'_project/STATE.json',state)
            self.assertEqual(store.verify(module='SDK')['pilot'],'NOT_RUN')


if __name__=='__main__':unittest.main()
