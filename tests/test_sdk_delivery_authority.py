import copy
import importlib.util
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch
sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
from collector import Store, atomic_json, digest
from build_delivery_inventory import build
from verify_delivery import verify
import sdk_delivery_authority as authority


class SDKDeliveryTests(unittest.TestCase):
    def fixture(self, folder):
        root = Path(folder); store = Store(root); prompts = []
        for path in ('01_AIM_MASTER_PROMPT.md', '02_SDK_MASTER_PROMPT.md'):
            raw = path.encode(); (root/path).write_bytes(raw)
            prompts.append({'path': path, 'sha256': digest(raw)})
        atomic_json(root/'_project/preflight.json', {'prompt_inputs': prompts})
        index = b'index'; (root/'_project/search.sqlite').write_bytes(index)
        atomic_json(root/'_project/search-index.json', {'database': '_project/search.sqlite', 'sha256': digest(index)})
        atomic_json(root/authority.HISTORY, {'status': 'AWAITING_OWNER_DECISION'})
        atomic_json(root/authority.OWNER, {'baseline': {'hashes': {authority.DISPOSITION: digest((root/authority.HISTORY).read_bytes())}}})
        atomic_json(root/authority.DISPOSITION, {'owner_answer': 'Proceed'})
        atomic_json(root/authority.PILOT, {'module': 'SDK', 'status': 'FAILED'})
        atomic_json(root/authority.REVALIDATION, {'completion_granted': False})
        sdk = {'pilot': 'FAILED', 'acquisition_authorization': {'path': authority.OWNER, 'sha256': digest((root/authority.OWNER).read_bytes())},
               'acquisition_revalidation': {'path': authority.REVALIDATION, 'sha256': digest((root/authority.REVALIDATION).read_bytes())}}
        state = {'modules': {'SDK': sdk}}; atomic_json(root/'_project/STATE.json', state)
        return store, state

    def readiness(self):
        return patch('sdk_acquisition_policy.sdk_acquisition_readiness', return_value={'ready': True, 'completion_granted': False})

    def test_inventory_contains_all_five_sdk_authority_files_and_clone_gate_checks_readiness(self):
        with tempfile.TemporaryDirectory() as folder, self.readiness() as readiness:
            store, state = self.fixture(folder); inventory = build(store.root)
            listed = {r['path'] for r in inventory['files']}
            self.assertTrue(set(authority.required_sdk_authority_paths(state)) <= listed)
            self.assertEqual(len(authority.required_sdk_authority_paths(state)), 5)
            self.assertTrue(verify(store.root)['checkpoint_integrity_passed'])
            readiness.assert_called_once()

    def test_revalidation_missing_uninventoried_or_changed_fails(self):
        for mode in ('missing', 'uninventoried', 'changed'):
            with self.subTest(mode=mode), tempfile.TemporaryDirectory() as folder, self.readiness():
                store, state = self.fixture(folder); inventory = build(store.root)
                if mode == 'missing': (store.root/authority.REVALIDATION).unlink()
                elif mode == 'changed': (store.root/authority.REVALIDATION).write_bytes(b'{}')
                else:
                    inventory['files'] = [r for r in inventory['files'] if r['path'] != authority.REVALIDATION]
                    inventory['file_count'] = len(inventory['files']); atomic_json(store.root/'_project/artifact-inventory.json', inventory)
                self.assertFalse(verify(store.root)['checkpoint_integrity_passed'])

    def test_stale_readiness_blocks_delivery_without_modifying_aim(self):
        with tempfile.TemporaryDirectory() as folder:
            store, state = self.fixture(folder); before = (store.root/'_project/STATE.json').read_bytes(); build(store.root)
            with patch('sdk_acquisition_policy.sdk_acquisition_readiness', return_value={'ready': False, 'issues': ['STALE'], 'completion_granted': False}):
                self.assertFalse(verify(store.root)['checkpoint_integrity_passed'])
            self.assertEqual((store.root/'_project/STATE.json').read_bytes(), before)

    def test_history_and_pointer_cannot_be_replaced(self):
        with tempfile.TemporaryDirectory() as folder, self.readiness():
            store, state = self.fixture(folder)
            (store.root/authority.HISTORY).write_bytes(b'{}'); build(store.root)
            self.assertFalse(verify(store.root)['checkpoint_integrity_passed'])
            state['modules']['SDK']['acquisition_revalidation']['path'] = '../other.json'
            with self.assertRaises(ValueError): authority.required_sdk_authority_paths(state)

    def test_aim_only_checkpoint_does_not_acquire_sdk_requirements(self):
        self.assertEqual(authority.required_sdk_authority_paths({'modules': {'AIM': {}}}), [])


if __name__ == '__main__': unittest.main()
