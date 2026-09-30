"""Regress stale table classifications and preserve independently cited roles."""
import copy
import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from integrate_functional_batches import merge_reviewed_roles


def record(object_id, role, source, evidence_id='E1'):
    return {
        'object_id': object_id, 'object_type': 'U', 'purpose': source,
        'business_domains': [source], 'inference_limits': ['Static only'],
        'vendor_identifier_references': [],
        'functional_roles': [{'role': role, 'rationale': source,
                              'evidence_ids': [evidence_id]}],
        'evidence': [{'evidence_id': evidence_id, 'path': source,
                      'sha256': source, 'line_start': 1, 'line_end': 2}],
    }


class FunctionalBatchIntegrationTests(unittest.TestCase):
    def test_corrected_batch_does_not_retain_old_classification(self):
        base = [record(1, 'configuration', 'base.json')]
        old = {'reviewed_roles': [record(1, 'obsolete_role', 'body.sql')]}
        before = merge_reviewed_roles(base, [old])
        corrected = {'reviewed_roles': [record(1, 'audit_history', 'body.sql')]}
        after = merge_reviewed_roles(base, [corrected])
        self.assertIn('obsolete_role', [r['role'] for r in before[1]['functional_roles']])
        self.assertEqual([r['role'] for r in after[1]['functional_roles']],
                         ['configuration', 'audit_history'])

    def test_evidence_ids_colliding_across_batches_keep_exact_sources(self):
        base = [record(1, 'configuration', 'base.json')]
        batches = [{'reviewed_roles': [record(1, 'audit_history', 'history.sql')]},
                   {'reviewed_roles': [record(1, 'reporting_read_model', 'report.sql')]}]
        result = merge_reviewed_roles(base, batches)[1]
        citations = {e['evidence_id']: e['path'] for e in result['evidence']}
        self.assertEqual({r['role']: [citations[e] for e in r['evidence_ids']]
                          for r in result['functional_roles']},
                         {'configuration': ['base.json'], 'audit_history': ['history.sql'],
                          'reporting_read_model': ['report.sql']})

    def test_repeated_source_evidence_is_deduplicated_without_losing_roles(self):
        base = [record(1, 'configuration', 'base.json')]
        batches = [{'reviewed_roles': [record(1, 'audit_history', 'base.json', 'E9')]}]
        result = merge_reviewed_roles(base, batches)[1]
        self.assertEqual(len(result['evidence']), 1)
        self.assertEqual([r['evidence_ids'] for r in result['functional_roles']],
                         [['E1'], ['E1']])

    def test_removed_batch_drops_only_its_contribution_and_preserves_base(self):
        base = [record(1, 'configuration', 'base.json'), record(2, 'master_reference', 'other.json')]
        batch = {'reviewed_roles': [record(1, 'audit_history', 'body.sql'),
                                   record(3, 'transactional_state', 'new.json')]}
        self.assertEqual(set(merge_reviewed_roles(base, [batch])), {1, 2, 3})
        rebuilt = merge_reviewed_roles(base, [])
        self.assertEqual(rebuilt, {r['object_id']: r for r in base})

    def test_rebuild_is_repeatable_and_does_not_mutate_source_records(self):
        base = [record(1, 'configuration', 'base.json')]
        batches = [{'reviewed_roles': [record(1, 'configuration', 'body.sql')]}]
        original = copy.deepcopy((base, batches))
        first = merge_reviewed_roles(base, batches)
        self.assertEqual(first, merge_reviewed_roles(base, batches))
        self.assertEqual((base, batches), original)

    def test_distinct_rationales_keep_their_own_source_citations(self):
        base = [record(1, 'reporting_read_model', 'function.sql')]
        batches = [{'reviewed_roles': [record(1, 'reporting_read_model', 'cache.sql')]}]
        result = merge_reviewed_roles(base, batches)[1]
        citations = {e['evidence_id']: e['path'] for e in result['evidence']}
        self.assertEqual([(r['rationale'], [citations[e] for e in r['evidence_ids']])
                          for r in result['functional_roles']],
                         [('function.sql', ['function.sql']), ('cache.sql', ['cache.sql'])])


if __name__ == '__main__':
    unittest.main()
