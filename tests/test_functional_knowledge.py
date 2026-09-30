"""Reject missing coverage, unsupported completion and broken claim bindings."""
import copy
import sys
import unittest
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from verify_functional_knowledge import validate_object_ledger, validate_backlog, validate_guidance, validate_semantic_contract, validate_schema_association, fingerprint, catalog_source_object_ids


class FunctionalKnowledgeTests(unittest.TestCase):
    def test_schema_association_allows_exact_selected_columns_and_rejects_drift(self):
        fields = {'name': 'ID', 'type_name': 'int', 'is_nullable': False, 'is_identity': False, 'default_object_id': 0}
        columns = [{'object_id': 2, 'column_id': i, **fields} for i in (1, 2)]
        indexes = [{'object_id': 2, 'index_id': 1, 'name': 'PK', 'is_unique': True}]
        keys = [{'object_id': 2, 'index_id': 1, 'column_id': 1, 'key_ordinal': 1}]
        association = {'object_id': 2, 'kind': 'COLUMN_AND_INDEX_CONTRACT',
                       'columns': [{'column_id': 1, **fields}],
                       'unique_index_keys': [{'index_id': 1, 'name': 'PK', 'column_ids': [1]}]}
        self.assertEqual(validate_schema_association(association, columns, indexes, keys), [])
        association['columns'][0]['is_nullable'] = True
        self.assertTrue(validate_schema_association(association, columns, indexes, keys))
        association['columns'][0]['is_nullable'] = False
        association['unique_index_keys'][0]['column_ids'] = [2]
        self.assertTrue(validate_schema_association(association, columns, indexes, keys))

    def test_dependency_citation_identifies_caller_not_target(self):
        rows = [{'referencing_id': 2, 'referenced_id': 3}, {'referencing_id': 2, 'referenced_id': None}]
        self.assertEqual(catalog_source_object_ids(Path('dependencies.json'), rows), {2})

    def test_catalog_source_rejects_unrecognized_or_missing_identity(self):
        with self.assertRaises(KeyError):
            catalog_source_object_ids(Path('unknown.json'), [{'object_id': 2}])
        with self.assertRaises(KeyError):
            catalog_source_object_ids(Path('dependencies.json'), [{'object_id': 2}])

    def setUp(self):
        self.objects = [{'object_id': 1, 'type': 'U', 'schema_name': 'dbo', 'name': 'T'},
                        {'object_id': 2, 'type': 'P', 'schema_name': 'dbo', 'name': 'P'}]
        self.ledger = {'records': [
            {'object_id': 1, 'object_type': 'U', 'qualified_name': 'dbo.T', 'snapshot_id': 'S',
             'role_review': 'BOUNDED_ROLE_REVIEWED', 'semantic_review': 'NOT_APPLICABLE_TABLE_ROLE_REVIEW_SEPARATE', 'operational_acceptance': 'NOT_PERFORMED'},
            {'object_id': 2, 'object_type': 'P', 'qualified_name': 'dbo.P', 'snapshot_id': 'S',
             'role_review': 'UNREVIEWED', 'semantic_review': 'UNREVIEWED', 'operational_acceptance': 'NOT_PERFORMED'}],
            'counts': {'eligible': 2, 'role_reviewed': 1, 'role_unreviewed': 1,
                       'semantic_eligible_modules': 1, 'bounded_semantic_contracts': 0, 'semantic_unreviewed': 1}}

    def ledger_errors(self):
        return validate_object_ledger(self.ledger, self.objects, [{'object_id': 1}], [], 'S')

    def test_complete_ledger_preserves_unreviewed_object(self):
        self.assertEqual(self.ledger_errors(), [])

    def test_missing_unreviewed_object_rejected(self):
        self.ledger['records'].pop()
        self.assertTrue(self.ledger_errors())

    def test_duplicate_identity_rejected_even_when_count_matches(self):
        self.ledger['records'][1] = copy.deepcopy(self.ledger['records'][0])
        self.assertTrue(self.ledger_errors())

    def test_role_review_does_not_establish_semantics(self):
        self.ledger['records'][0]['semantic_review'] = 'BOUNDED_STATIC_CONTRACT'
        self.assertTrue(self.ledger_errors())

    def test_operational_acceptance_not_inferred(self):
        self.ledger['records'][0]['operational_acceptance'] = 'PASSED'
        self.assertTrue(self.ledger_errors())

    def test_backlog_preserves_unresolved_source(self):
        deps = [{'referenced_id': None, 'referencing_id': 1, 'referenced_entity_name': 'Target'}]
        backlog = {'dynamic_candidates': [], 'unresolved_dependencies': [
            {'catalog_entry_sha256': fingerprint(deps[0]), 'review_state': 'UNREVIEWED'}]}
        self.assertEqual(validate_backlog(backlog, [], deps), [])
        backlog['unresolved_dependencies'][0]['catalog_entry_sha256'] = 'wrong'
        self.assertTrue(validate_backlog(backlog, [], deps))

    def test_dynamic_review_requires_evidence(self):
        modules = [{'object_id': 2, 'source_definition_sha256': 'abc', 'static_features': {'dynamic_sql_candidate': True}}]
        backlog = {'dynamic_candidates': [{'object_id': 2, 'source_definition_sha256': 'abc', 'review_state': 'BOUNDED_STATIC_REVIEW', 'batch_refs': []}], 'unresolved_dependencies': []}
        self.assertTrue(validate_backlog(backlog, modules, []))

    def test_documentary_settings_cannot_claim_effective_values(self):
        s = {'setting_id': 'x', 'evidence_refs': ['s'], 'node_ids': ['n1'],
             'current_effective_setting': 'Y', **{k: 'documented' for k in ('purpose', 'scope', 'accepted_values', 'default', 'precedence', 'validation_method')}}
        self.assertTrue(validate_guidance({'setting_count': 1, 'settings': [s]}, {'s': {'node_ids': ['n1']}}))
        s['current_effective_setting'] = 'NOT_ESTABLISHED'
        self.assertEqual(validate_guidance({'setting_count': 1, 'settings': [s]}, {'s': {'node_ids': ['n1']}}), [])
        s['node_ids'] = ['n999']
        self.assertTrue(validate_guidance({'setting_count': 1, 'settings': [s]}, {'s': {'node_ids': ['n1']}}))

    def test_semantic_contract_cannot_use_another_modules_evidence(self):
        fields = ('inputs_defaults', 'null_and_invalid_input_behavior', 'output_shape', 'ordered_branches',
                  'configuration_scope_and_precedence', 'error_and_return_handling', 'transaction_ownership',
                  'concurrency', 'trigger_behavior', 'external_handoffs_and_gaps')
        contract = {'object_id': 2, 'snapshot_id': 'S', 'source_definition_sha256': 'abc',
                    'evidence_refs': ['own'], 'effects': [], **{k: ['Explicitly reviewed limit'] for k in fields}}
        source = {'own': {'object_id': 2, 'source_definition_sha256': 'abc'}}
        self.assertEqual(validate_semantic_contract(contract, source, {'source_definition_sha256': 'abc'}, 'S'), [])
        source['own']['object_id'] = 3
        self.assertTrue(validate_semantic_contract(contract, source, {'source_definition_sha256': 'abc'}, 'S'))

    def test_semantic_contract_requires_transaction_boundary(self):
        contract = {'object_id': 2, 'snapshot_id': 'S', 'source_definition_sha256': 'abc', 'evidence_refs': ['own']}
        errors = validate_semantic_contract(contract, {'own': {'object_id': 2, 'source_definition_sha256': 'abc'}},
                                            {'source_definition_sha256': 'abc'}, 'S')
        self.assertTrue(any('transaction_ownership' in error for error in errors))


if __name__ == '__main__':
    unittest.main()
