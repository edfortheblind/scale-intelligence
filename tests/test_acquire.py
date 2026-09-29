"""Module dispatch and pilot isolation without browser or network operations."""
import copy
import io
import os
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import MagicMock, Mock, patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
import acquire
from collector import Store, SEEDS, atomic_json, read_json, source_identity
from stage_transport import AcquisitionBlocked


class AcquireModuleTests(unittest.TestCase):
    def fixture(self, folder):
        root = Path(folder) / 'repo'
        store = Store(root)
        store.checkpoint(phase='AIM_ACCEPTED_WITH_EXCEPTIONS', blockers=[])
        state = read_json(root / '_project/STATE.json')
        state['pilot'] = 'PASSED'
        state['modules']['AIM'].update(status='ACCEPTED_WITH_EXCEPTIONS',
            acceptance={'percent': 99.71, 'exceptions': 'AIM/reports/source-gaps.json'},
            technical_status='DISCOVERY_INCOMPLETE')
        state['blockers'] = [{'code': 'SOURCE_RESOURCES_UNAVAILABLE', 'count': 8}]
        atomic_json(root / '_project/STATE.json', state)
        return root, store

    def resource(self, store, module, href, kind='article', discovered='2026-01-01'):
        identity = source_identity(href, SEEDS[module])
        record = {'id': identity['id'], 'module': module, 'source_url': identity['fetch_key'],
            'type': kind, 'status': 'PENDING', 'attempts': 0, 'discovered_at': discovered,
            'occurrences': [], 'titles': [], 'breadcrumbs': [], 'variants': []}
        store.save_record(record)
        return record

    def selection(self, root, records, module='SDK'):
        atomic_json(root / '_project/pilot-SDK.json',
                    {'module': module, 'article_ids': [r['id'] for r in records]})

    def run_candidate(self, root, folder, argv, *, policy_error=None, request_error=None):
        policy = Mock(return_value={'allowed': True}, side_effect=policy_error)
        policy_module = SimpleNamespace(require_sdk_ready=policy)
        context = SimpleNamespace(request=object(), close=Mock())
        playwright = MagicMock()
        playwright.__enter__.return_value.chromium.launch_persistent_context.return_value = context
        transport = Mock(next_allowed=0.0, clock=lambda: 0.0)
        calls = []
        def get(url):
            calls.append(url)
            if request_error:
                raise request_error
            body = b'<html><head><title>Exact</title></head><body><pre>  code\r\n</pre></body></html>'
            return body, {'http_status': 200, 'final_url': url, 'mime': 'text/html', 'encoding': 'utf-8'}
        transport.get.side_effect = get
        patches = (
            patch.object(acquire, '__file__', str(root / 'tools/acquire.py')),
            patch.dict(os.environ, LOCALAPPDATA=folder),
            patch.dict(sys.modules, module_policy=policy_module),
            patch.object(acquire, 'sync_playwright', return_value=playwright),
            patch.object(acquire, 'StageTransport', return_value=transport),
            patch('sys.stdout', new_callable=io.StringIO),
        )
        from contextlib import ExitStack
        with ExitStack() as stack:
            mocks = [stack.enter_context(p) for p in patches]
            try:
                result = acquire.main(argv)
            except Exception as error:
                result = error
        return SimpleNamespace(result=result, calls=calls, policy=policy, context=context,
                               browser=mocks[3], transport_factory=mocks[4])

    def test_sdk_never_inherits_global_aim_pilot(self):
        state = {'pilot': 'PASSED', 'modules': {'SDK': {}}}
        self.assertEqual(acquire.module_pilot(state, 'AIM'), 'PASSED')
        self.assertEqual(acquire.module_pilot(state, 'SDK'), 'NOT_RUN')
        state['modules']['SDK']['pilot'] = 'PASSED'
        self.assertEqual(acquire.module_pilot(state, 'SDK'), 'PASSED')

    def test_default_module_still_acquires_only_aim(self):
        with tempfile.TemporaryDirectory() as folder:
            root, store = self.fixture(folder)
            aim = self.resource(store, 'AIM', SEEDS['AIM'], 'navigation')
            sdk = self.resource(store, 'SDK', SEEDS['SDK'], 'navigation')
            run = self.run_candidate(root, folder, [])
            self.assertEqual(run.result, 0)
            self.assertEqual(run.calls, [aim['source_url']])
            self.assertEqual(run.transport_factory.call_args.kwargs['module'], 'AIM')
            run.policy.assert_not_called()
            self.assertEqual(store.records('SDK')[0]['id'], sdk['id'])
            self.assertEqual(store.records('SDK')[0]['status'], 'PENDING')

    def test_sdk_selects_only_its_pilot_and_preserves_accepted_aim(self):
        with tempfile.TemporaryDirectory() as folder:
            root, store = self.fixture(folder)
            selected = self.resource(store, 'SDK', 'Welcome.html')
            outside = self.resource(store, 'SDK', 'Other.html')
            aim = self.resource(store, 'AIM', 'Content/other.htm')
            self.selection(root, [selected])
            before = copy.deepcopy(read_json(root / '_project/STATE.json'))
            run = self.run_candidate(root, folder, ['--module', 'SDK', '--kind', 'article', '--limit', '50'])
            self.assertEqual(run.result, 0)
            self.assertEqual(run.calls, [selected['source_url']])
            run.policy.assert_called_once()
            self.assertEqual(run.transport_factory.call_args.kwargs['module'], 'SDK')
            self.assertEqual(run.transport_factory.call_args.kwargs['cooldown_path'].name, 'stage-cooldown.json')
            state = read_json(root / '_project/STATE.json')
            self.assertEqual(state['module'], 'SDK')
            self.assertEqual(state['modules']['SDK']['pilot'], 'NOT_RUN')
            self.assertEqual(state['pilot'], 'PASSED')
            self.assertEqual(state['modules']['AIM']['status'], before['modules']['AIM']['status'])
            self.assertEqual(state['modules']['AIM']['acceptance'], before['modules']['AIM']['acceptance'])
            self.assertEqual(state['modules']['AIM']['technical_status'], 'DISCOVERY_INCOMPLETE')
            self.assertEqual(state['modules']['AIM']['blockers'], before['blockers'])
            self.assertFalse(state['worker_running'])
            records = {r['id']: r for m in ('AIM', 'SDK') for r in store.records(m)}
            self.assertEqual(records[outside['id']]['status'], 'PENDING')
            self.assertEqual(records[aim['id']]['status'], 'PENDING')
            self.assertEqual(records[selected['id']]['status'], 'BODY_SAVED')

    def test_missing_sdk_pilot_cannot_use_aim_success(self):
        with tempfile.TemporaryDirectory() as folder:
            root, store = self.fixture(folder)
            self.resource(store, 'SDK', 'Welcome.html')
            run = self.run_candidate(root, folder, ['--module', 'SDK', '--kind', 'article'])
            self.assertIsInstance(run.result, FileNotFoundError)
            run.browser.assert_not_called()
            self.assertEqual(run.calls, [])

    def test_explicit_ids_do_not_bypass_sdk_pilot(self):
        with tempfile.TemporaryDirectory() as folder:
            root, store = self.fixture(folder)
            selected = self.resource(store, 'SDK', 'Welcome.html')
            outside = self.resource(store, 'SDK', 'Other.html')
            self.selection(root, [selected])
            run = self.run_candidate(root, folder, ['--module', 'SDK', '--kind', 'article', '--ids', outside['id']])
            self.assertIsInstance(run.result, ValueError)
            run.browser.assert_not_called()

    def test_policy_refusal_precedes_browser_and_state_changes(self):
        with tempfile.TemporaryDirectory() as folder:
            root, store = self.fixture(folder)
            self.resource(store, 'SDK', SEEDS['SDK'], 'navigation')
            before = (root / '_project/STATE.json').read_bytes()
            run = self.run_candidate(root, folder, ['--module', 'SDK'], policy_error=ValueError('SDK_NOT_READY'))
            self.assertIsInstance(run.result, ValueError)
            self.assertEqual((root / '_project/STATE.json').read_bytes(), before)
            run.browser.assert_not_called()
            run.transport_factory.assert_not_called()

    def test_sdk_seed_without_fragment_has_first_queue_position(self):
        with tempfile.TemporaryDirectory() as folder:
            root, store = self.fixture(folder)
            self.resource(store, 'SDK', 'webnav.html', 'navigation', '2025-01-01')
            seed = self.resource(store, 'SDK', SEEDS['SDK'], 'navigation', '2026-01-01')
            run = self.run_candidate(root, folder, ['--module', 'SDK', '--limit', '1'])
            self.assertEqual(run.result, 0)
            self.assertEqual(run.calls, [seed['source_url']])
            self.assertNotIn('#', run.calls[0])

    def test_sdk_draft_conversion_does_not_grant_fidelity(self):
        with tempfile.TemporaryDirectory() as folder:
            root, store = self.fixture(folder)
            selected = self.resource(store, 'SDK', 'Welcome.html')
            self.selection(root, [selected])
            run = self.run_candidate(root, folder, ['--module', 'SDK', '--kind', 'article', '--convert'])
            self.assertEqual(run.result, 0)
            record = store.records('SDK')[0]
            self.assertEqual(record['status'], 'BODY_SAVED')
            self.assertTrue((root / record['app_data_path']).is_file())
            self.assertFalse(record['reading_copy_verified'])
            self.assertFalse(record['article_local_complete'])
            self.assertEqual(record['fidelity_hold']['code'], 'SDK_ADAPTER_VERIFICATION_REQUIRED')
            self.assertNotEqual(read_json(root / '_project/STATE.json')['modules']['SDK']['status'], 'MODULE_LOCAL_COMPLETE')

    def test_sdk_auth_failure_keeps_aim_exceptions_and_stops_batch(self):
        with tempfile.TemporaryDirectory() as folder:
            root, store = self.fixture(folder)
            first = self.resource(store, 'SDK', SEEDS['SDK'], 'navigation')
            second = self.resource(store, 'SDK', 'webnav.html', 'navigation')
            run = self.run_candidate(root, folder, ['--module', 'SDK'],
                                     request_error=AcquisitionBlocked('BLOCKED_AUTH', 'Normal SSO required'))
            self.assertEqual(run.result, 0)
            self.assertEqual(run.calls, [first['source_url']])
            state = read_json(root / '_project/STATE.json')
            self.assertEqual(state['blockers'][0]['code'], 'BLOCKED_AUTH')
            self.assertEqual(state['modules']['SDK']['blockers'], state['blockers'])
            self.assertEqual(state['modules']['AIM']['blockers'][0]['count'], 8)
            self.assertEqual(state['modules']['AIM']['status'], 'ACCEPTED_WITH_EXCEPTIONS')
            self.assertEqual({r['id']: r for r in store.records('SDK')}[second['id']]['status'], 'PENDING')
            run.context.close.assert_called_once()


if __name__ == '__main__':
    unittest.main()
