"""Authority persistence tests using real SDK source/derivative fixtures.

Only Git transport and native browser/recovery execution are mocked. These
fixtures prove policy behavior, not acquired documentary fidelity.
"""
import copy
import json
import os
from pathlib import Path
import re
import sys
import tempfile
import unittest
from unittest.mock import patch

repository = Path(os.environ.get('SDK_TEST_REPOSITORY', Path(__file__).resolve().parents[1]))
sys.path[:0] = [str(Path(__file__).resolve().parents[1] / 'tools'),
               str(repository / 'tools'), str(repository / 'tests')]
import sdk_acquisition_policy as policy
import sdk_acquisition_revalidation as technical
import test_verify_sdk as fixtures
from collector import atomic_json, read_json, digest, SEEDS


class SdkAcquisitionRevalidationTests(unittest.TestCase):
    def setUp(self):
        self.fixture = fixtures.VerifySdkTests()
        self.fixture.setUp(); self.addCleanup(self.fixture.doCleanups)
        self.folder = tempfile.TemporaryDirectory(); self.addCleanup(self.folder.cleanup)
        self.store, self.selection, self.image, self.css = self.fixture.fixture(self.folder.name)
        self.root = self.store.root
        (self.root / 'tools').mkdir()
        for name in ('sdk_acquisition_policy.py', 'sdk_acquisition_revalidation.py'):
            (self.root / 'tools' / name).write_bytes((Path(technical.__file__).parent / name).read_bytes())
        (self.root / 'tools/synthetic_verifier.py').write_bytes(b'initial verifier semantics')
        semantics = patch.object(policy.verify_sdk, 'SEMANTICS', ('synthetic_verifier.py',))
        semantics.start(); self.addCleanup(semantics.stop)
        self.instruction = 'Ok, work on the concern and solve it, and proceed with the rest.'
        self.image = next(r for r in self.store.records('SDK') if r['id'] == self.image['id'])
        self.image.update(status='FAILED', local_path=None, sha256=None, byte_count=None,
                          transport_metadata_verified=False,
                          last_failure={'class': 'NOT_FOUND', 'detail': 'HTTP 404'})
        parent = next(r for r in self.store.records('SDK') if r['source_url'].endswith('/Image.html'))
        self.image['occurrences'] = [{'discovery_source': parent['id'] + '@' + parent['sha256'] + ':img:src',
                                      'original_href': 'picture.png', 'resolved_url': self.image['source_url']}]
        self.store.save_record(self.image)
        for record in self.store.records('SDK'):
            if record['type'] == 'article':
                policy.verify_sdk.adapter.convert(self.store, record)
        self.save_gap_report()
        self.refresh_pilot()
        disposition = {'module': 'SDK', 'owner_answer': self.instruction,
                       'bulk_authorized_with_failed_pilot': True,
                       'technical_pilot_status': 'FAILED', 'completion_exception_granted': False}
        atomic_json(self.root / policy.DISPOSITION, disposition)
        for path in ('01_AIM_MASTER_PROMPT.md', '02_SDK_MASTER_PROMPT.md'):
            (self.root / path).write_bytes(b'Synthetic unchanged STAGE-CHATGPT-EN-2.0 authority')
        self.baseline = {'commit': 'a' * 40,
                         'hashes': {p: digest((self.root / p).read_bytes()) for p in policy.BASELINE_PATHS},
                         'values': {p: read_json(self.root / p) for p in (policy.REPORT, policy.SELECTION, policy.GAPS, policy.DISPOSITION)}}
        baseline = patch.object(policy, '_baseline', return_value=self.baseline)
        baseline.start(); self.addCleanup(baseline.stop)
        record = policy.build_sdk_acquisition_exception(self.store, self.instruction, self.baseline['commit'])
        atomic_json(self.root / policy.AUTHORIZATION_PATH, record)
        self.state = read_json(self.root / '_project/STATE.json')
        self.state['modules']['SDK']['acquisition_authorization'] = technical._binding(self.root, policy.AUTHORIZATION_PATH)
        atomic_json(self.root / '_project/STATE.json', self.state)
        self.original_authority = (self.root / policy.AUTHORIZATION_PATH).read_bytes()
        self.assertTrue(policy.sdk_acquisition_readiness(self.store, self.state)['ready'])

    def save_gap_report(self):
        image = next(r for r in self.store.records('SDK') if r['id'] == self.image['id'])
        self.gap = {'id': image['id'], 'url': image['source_url'], 'type': 'image',
                    'last_failure': image['last_failure'], 'published_occurrences': image['occurrences']}
        atomic_json(self.root / policy.GAPS, {'missing_resources': [self.gap]})

    def refresh_pilot(self, extra_issue=None):
        replay = lambda _store, _catalog, documents: ([], [
            {'id': d['id'], 'idempotent': True, 'interruption_preserved_prior_bytes': True,
             'missing_derivative_recovered': True} for d in documents])
        report = self.fixture.run_validation(self.store, self.selection, replay=replay)
        self.assertEqual(report['status'], 'FAILED', report['issues'])
        self.assertEqual({i['error'] for i in report['issues']},
                         {'CONVERTER_CHECKS_FAILED', 'REQUIRED_SUPPORT_NOT_CAPTURED'})
        if extra_issue:
            report['issues'].append(extra_issue)
        atomic_json(self.root / policy.REPORT, report)
        self.selection.update(status='FAILED', report=policy.REPORT)
        atomic_json(self.root / policy.SELECTION, self.selection)
        state = read_json(self.root / '_project/STATE.json')
        state['modules']['SDK'].update(pilot='FAILED', pilot_proof=technical._binding(self.root, policy.REPORT))
        atomic_json(self.root / '_project/STATE.json', state)
        self.state = state
        return report

    def revalidate(self):
        record = technical.build_revalidation(self.store, 'Verified current converter and support generation.', self.state)
        atomic_json(self.root / technical.PATH, record)
        self.state['modules']['SDK']['acquisition_revalidation'] = technical._binding(self.root, technical.PATH)
        atomic_json(self.root / '_project/STATE.json', self.state)
        return record

    def test_new_current_proof_reuses_exact_authority_without_completion(self):
        (self.root / 'tools/synthetic_verifier.py').write_bytes(b'verified newer semantics')
        self.refresh_pilot()
        self.assertFalse(policy.sdk_acquisition_readiness(self.store, self.state)['ready'])
        record = self.revalidate()
        result = policy.sdk_acquisition_readiness(self.store, self.state)
        self.assertTrue(result['ready'], result); self.assertFalse(result['completion_granted'])
        self.assertEqual(record['permissions'], policy.PERMISSIONS)
        self.assertEqual(record['owner_instruction'], self.instruction)
        self.assertEqual(self.state['modules']['SDK']['pilot'], 'FAILED')
        self.assertEqual((self.root / policy.AUTHORIZATION_PATH).read_bytes(), self.original_authority)

    def test_stale_current_input_cannot_be_revalidated(self):
        (self.root / 'tools/synthetic_verifier.py').write_bytes(b'changed without new proof')
        with self.assertRaisesRegex(ValueError, 'inputs are stale'):
            self.revalidate()

    def test_no_local_fidelity_failure_is_waived(self):
        self.refresh_pilot({'error': 'DOCUMENTARY_STATE_HIDDEN', 'id': self.selection['article_ids'][-1]})
        with self.assertRaisesRegex(ValueError, 'Non-source/local'):
            self.revalidate()

    def test_original_selection_and_prompts_remain_required(self):
        self.selection['article_ids'].reverse(); self.refresh_pilot()
        with self.assertRaisesRegex(ValueError, 'representative selection changed'):
            self.revalidate()
        self.selection['article_ids'].reverse(); self.refresh_pilot()
        (self.root / '02_SDK_MASTER_PROMPT.md').write_bytes(b'changed authority')
        with self.assertRaisesRegex(ValueError, 'authority prompt changed'):
            self.revalidate()

    def test_original_owner_authority_cannot_be_expanded(self):
        record = read_json(self.root / policy.AUTHORIZATION_PATH)
        record['permissions']['module_local_complete'] = True
        atomic_json(self.root / policy.AUTHORIZATION_PATH, record)
        self.state['modules']['SDK']['acquisition_authorization'] = technical._binding(self.root, policy.AUTHORIZATION_PATH)
        with self.assertRaisesRegex(ValueError, 'acquisition-only'):
            self.revalidate()

    def test_historical_provenance_outside_pilot_requires_immutable_body(self):
        authority = read_json(self.root / policy.AUTHORIZATION_PATH)
        source = authority['evidence']['provenance_inputs'][0]
        historical = next(r for r in self.store.records('SDK') if r['id'] == source['id'])
        raw = (self.root / source['path']).read_bytes()
        self.baseline['values'][policy.REPORT]['inputs']['files'] = [
            f for f in self.baseline['values'][policy.REPORT]['inputs']['files'] if f['path'] != source['path']]
        def blob(_root, _commit, path):
            return json.dumps(historical).encode() if path.startswith('SDK/manifests/') else raw
        with patch.object(policy.module_policy, '_git_blob', side_effect=blob):
            technical._authority(self.store, self.state)
        def damaged(_root, _commit, path):
            return json.dumps(historical).encode() if path.startswith('SDK/manifests/') else raw + b'changed'
        with patch.object(policy.module_policy, '_git_blob', side_effect=damaged), self.assertRaisesRegex(ValueError, 'immutable checkpoint'):
            technical._authority(self.store, self.state)

    def test_unrelated_catalog_growth_and_more_occurrences_do_not_expire(self):
        self.revalidate()
        self.store.discover('SDK', 'Other.html', SEEDS['SDK'], 'synthetic_growth', 'article')
        image = next(r for r in self.store.records('SDK') if r['id'] == self.image['id'])
        extra = copy.deepcopy(image['occurrences'][0]); extra['discovery_source'] += ':additional'
        image['occurrences'].append(extra); self.store.save_record(image)
        # The global source-gap report grows independently. Readiness uses the
        # frozen pilot subset and verifies it against current published records.
        atomic_json(self.root / policy.GAPS, {'missing_resources': [self.gap, {'new': 'unrelated gap'}]})
        result = policy.sdk_acquisition_readiness(self.store, self.state)
        self.assertTrue(result['ready'], result)

    def test_changed_current_proof_policy_or_source_failure_refuses(self):
        record = self.revalidate()
        for kind in ('pilot', 'policy', 'css', 'failure'):
            with self.subTest(kind=kind):
                target = self.root / (policy.REPORT if kind == 'pilot' else technical.SEMANTICS[0])
                if kind == 'css':
                    target = self.root / read_json(self.root / ('SDK/data/stylesheets/' + self.css['id'] + '.json'))['rendered_path']
                before = target.read_bytes()
                image = copy.deepcopy(next(r for r in self.store.records('SDK') if r['id'] == self.image['id']))
                if kind == 'failure':
                    changed = copy.deepcopy(image); changed['last_failure']['detail'] = 'HTTP 403'; self.store.save_record(changed)
                else:
                    target.write_bytes(before + b'\n')
                result = policy.sdk_acquisition_readiness(self.store, self.state)
                self.assertFalse(result['ready'], result); self.assertFalse(result['completion_granted'])
                target.write_bytes(before); self.store.save_record(image)
        record['completion_granted'] = True
        atomic_json(self.root / technical.PATH, record)
        self.state['modules']['SDK']['acquisition_revalidation'] = technical._binding(self.root, technical.PATH)
        self.assertFalse(policy.sdk_acquisition_readiness(self.store, self.state)['ready'])

    def test_failed_refresh_does_not_fallback_to_initial_authorization(self):
        self.revalidate()
        (self.root / technical.PATH).unlink()
        result = policy.sdk_acquisition_readiness(self.store, self.state)
        self.assertFalse(result['ready']); self.assertEqual(result['basis'], 'invalid_technical_revalidation')

    def test_passed_stale_proof_keeps_specific_diagnostic(self):
        self.state['modules']['SDK']['pilot'] = 'PASSED'
        with patch.object(policy.verify_sdk, 'pilot_proof_current', return_value={'passed': False, 'issues': ['SDK_PILOT_PROOF_UNAVAILABLE: absent']}):
            result = policy.sdk_acquisition_readiness(self.store, self.state)
        self.assertEqual(result['issues'], ['SDK_PILOT_PROOF_NOT_CURRENT', 'SDK_PILOT_PROOF_UNAVAILABLE: absent'])
        self.assertFalse(result['ready'])


if __name__ == '__main__':
    unittest.main()
