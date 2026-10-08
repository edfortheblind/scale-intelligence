"""Cross-source answers retain full qualifications and distinct owner evidence."""
import copy
from html import escape
import json
from pathlib import Path
import sys
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
from help_guides import EVIDENCE, GuideLibrary, MANIFEST, ROOT, TAB_OWNER_SCOPE, TAB_SCOPE, fingerprint
from render_help_guides import render_evidence, render_guide, tab_search


class TabReconciliationTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.library = GuideLibrary()

    def load_changed(self, key, change):
        value = copy.deepcopy(self.library.evidence[key])
        change(value)
        raw = json.dumps(value).encode('utf-8')
        manifest = copy.deepcopy(self.library.manifest)
        manifest['evidence'][key]['sha256'] = fingerprint(raw)
        replacements = {(ROOT/EVIDENCE[key]).resolve(): raw,
                        (ROOT/MANIFEST).resolve(): json.dumps(manifest).encode('utf-8')}
        original = Path.read_bytes
        with patch.object(Path, 'read_bytes', lambda path: replacements.get(path.resolve(), None)
                          if path.resolve() in replacements else original(path)):
            return GuideLibrary()

    def test_po_answer_was_absent_from_individual_claims_and_is_now_reconciled(self):
        result = self.library.search_tab_design('Does TAB use purchase orders PO?')
        legacy_text = ' '.join(row['text'] for row in result['results'])
        self.assertNotIn("Travis doesn't use PO", legacy_text)
        self.assertNotIn('Travis does not use PO', legacy_text)
        row = next(row for row in result['reconciliations'] if row['id'] == 'R04')
        self.assertIn('does not use purchase orders (PO)', row['resolution'])
        self.assertEqual(row['owner_evidence']['statement'], "Travis doesn't use PO")
        self.assertEqual(row['owner_evidence']['date'], '2026-10-08')
        self.assertEqual(row['scope'], TAB_OWNER_SCOPE)
        self.assertEqual(row['evidence_scope'], 'OWNER_OPERATIONAL_DIRECTION_PLUS_DOCUMENTARY_CONTEXT')
        self.assertFalse(row['current_runtime_verified'])

    def test_receipt_container_answer_retains_conditional_change_and_shipping_exclusion(self):
        result = self.library.search_tab_design('receipt container downloads')
        row = next(row for row in result['reconciliations'] if row['id'] == 'R03')
        self.assertIn('original excludes receipt container downloads', row['resolution'])
        self.assertIn('customer-supplied receipt container data to be interfaced when available', row['resolution'])
        self.assertIn('shipping container downloads remain excluded in both sources', row['resolution'])
        self.assertEqual(row['scope'], TAB_SCOPE)
        self.assertEqual(row['evidence_scope'], 'DOCUMENTARY_DESIGN_ONLY')
        self.assertNotIn('owner_evidence', row)

    def test_all_twelve_full_resolutions_and_supporting_claims_reach_the_guide(self):
        _, html = render_guide(self.library, 'tab-design')
        source_rows = self.library.evidence['tab-reconciliation']['reconciliations']
        self.assertEqual(len(self.library.tab_reconciliations), 12)
        for source in source_rows:
            with self.subTest(identity=source['id']):
                row = next(row for row in self.library.search_tab_design(source['id'])['reconciliations']
                           if row['id'] == source['id'])
                self.assertEqual(row['resolution'], source['resolution'])
                self.assertEqual(row['claim_ids'], source['claim_ids'])
                anchor = 'id="'+row['anchor']+'" tabindex="-1"'
                self.assertEqual(html.count(anchor), 1)
                landing = html.split(anchor, 1)[1].split('<h', 1)[0]
                self.assertIn(escape(source['resolution']), landing)
                self.assertIn(escape(row['state_label']), landing)
                self.assertIn(escape(row['scope']), landing)
                self.assertNotIn(source['state'], landing)
                for claim in row['supporting_claims']:
                    self.assertIn('href="'+claim['href']+'"', landing)
                    self.assertIn('id="'+claim['href'].split('#')[1]+'"', html)
        row = next(row for row in self.library.tab_reconciliations if row['id'] == 'R06')
        self.assertEqual(row['state_label'], 'Unresolved source detail')
        self.assertIn('unresolved', row['resolution'])

    def test_reconciled_answers_precede_individual_claims_with_full_limits(self):
        html = tab_search(self.library, 'receipt confirmation')
        self.assertLess(html.index('Reconciled answers'), html.index('Individual source claims'))
        for row in self.library.search_tab_design('receipt confirmation')['reconciliations']:
            self.assertIn(escape(row['resolution']), html)
            self.assertIn(escape(row['state_label']), html)
            self.assertIn(escape(row['scope']), html)
            for claim in row['supporting_claims']:
                self.assertIn('href="'+claim['href']+'"', html)

    def test_owner_proof_is_separate_and_displays_only_the_dated_statement_and_limits(self):
        _, html = render_evidence(self.library, 'tab-po-direction')
        owner = self.library.evidence['tab-po-direction']['authority']
        for field in ['owner_clarification', 'clarification_date', 'interpretation']:
            self.assertIn(escape(owner[field]), html)
        for technical_field in ['S3-PROD-01', 'synthetic_record_offer', 'Token is not valid', 'form_id', 'S3 stays 4/6']:
            self.assertNotIn(technical_field, html)
        search = tab_search(self.library, 'purchase orders PO')
        self.assertIn('href="/guide-evidence/tab-po-direction#guide-content"', search)
        self.assertIn(escape(owner['owner_clarification']), search)
        _, guide = render_guide(self.library, 'tab-design')
        landing = guide.split('id="r04" tabindex="-1"', 1)[1].split('<h4', 1)[0]
        for field in ['owner_clarification', 'clarification_date', 'interpretation']:
            self.assertIn(escape(owner[field]), landing)

    def test_reconciliation_changes_cannot_change_original_claim_or_procedure_results(self):
        library = copy.copy(self.library)
        questions = ['receipt container', 'purchase orders PO', 'R04', 'short pick', 'SRC400']
        claims = [library.search_tab_design(question)['results'] for question in questions]
        procedures = [library.search(question) for question in questions]
        library.tab_reconciliations = [{**row, 'text': 'receipt container purchase orders short pick SRC400 '*50}
                                       for row in library.tab_reconciliations]
        self.assertEqual([library.search_tab_design(question)['results'] for question in questions], claims)
        self.assertEqual([library.search(question) for question in questions], procedures)

    def test_reconciliation_bounds_and_empty_queries(self):
        for question in ['', 'the and a', 'unrecognizablezxqv']:
            self.assertEqual(self.library.search_tab_design(question)['reconciliations'], [])
        self.assertLessEqual(len(self.library.search_tab_design('receipt', 999)['reconciliations']), 12)
        self.assertLessEqual(len(self.library.search_tab_design('receipt', 1)['reconciliations']), 1)

    def test_invalid_reconciliation_identities_claims_states_or_runtime_fail_closed(self):
        mutations = [
            lambda rows: rows.pop(),
            lambda rows: rows.append(copy.deepcopy(rows[0])),
            lambda rows: rows[1].update(id='R01'),
            lambda rows: rows[0].update(id='R99'),
            lambda rows: rows[0].update(claim_ids=[]),
            lambda rows: rows[0].update(claim_ids=['UNKNOWN']),
            lambda rows: rows[0].update(claim_ids=[rows[0]['claim_ids'][0]]*2),
            lambda rows: rows[0].update(state='RUNTIME_VERIFIED'),
            lambda rows: rows[0].update(current_runtime_verified=True),
            lambda rows: rows[0].update(resolution=''),
        ]
        for index, mutation in enumerate(mutations):
            with self.subTest(case=index), self.assertRaisesRegex(ValueError, 'TAB reconciliation'):
                self.load_changed('tab-reconciliation', lambda value: mutation(value['reconciliations']))

    def test_owner_binding_cannot_be_removed_redirected_or_given_to_other_records(self):
        mutations = [
            lambda rows: rows[3].pop('owner_evidence_id'),
            lambda rows: rows[3].update(owner_evidence_id='tab-sources'),
            lambda rows: rows[0].update(owner_evidence_id='tab-po-direction'),
            lambda rows: rows[3].update(state='DOCUMENTARY_INTERPRETATION'),
            lambda rows: rows[0].update(state='OWNER_OPERATIONAL_DIRECTION_PLUS_DOCUMENTARY_CONTEXT'),
        ]
        for index, mutation in enumerate(mutations):
            with self.subTest(case=index), self.assertRaisesRegex(ValueError, 'owner evidence binding'):
                self.load_changed('tab-reconciliation', lambda value: mutation(value['reconciliations']))

    def test_owner_authority_fields_cannot_be_changed_even_with_a_rebuilt_manifest(self):
        for field in ['owner_clarification', 'clarification_date', 'interpretation']:
            with self.subTest(field=field), self.assertRaisesRegex(ValueError, 'owner clarification binding'):
                self.load_changed('tab-po-direction', lambda value: value['authority'].update({field: 'changed'}))

    def test_missing_reconciliation_guide_anchor_fails_closed(self):
        path = self.library.manifest['guides']['tab-design']['path']
        raw = (ROOT/path).read_bytes().replace(b'<a id="r01"></a>', b'<a id="missing-r01"></a>')
        manifest = copy.deepcopy(self.library.manifest)
        manifest['guides']['tab-design']['sha256'] = fingerprint(raw)
        replacements = {(ROOT/path).resolve(): raw, (ROOT/MANIFEST).resolve(): json.dumps(manifest).encode('utf-8')}
        original = Path.read_bytes
        with patch.object(Path, 'read_bytes', lambda path: replacements[path.resolve()]
                          if path.resolve() in replacements else original(path)):
            with self.assertRaisesRegex(ValueError, 'TAB reconciliation'):
                GuideLibrary()

    def test_untrusted_reconciliation_and_owner_text_is_inert_and_untruncated(self):
        library = copy.copy(self.library)
        row = copy.deepcopy(next(row for row in library.tab_reconciliations if row['id'] == 'R04'))
        row['resolution'] = 'qualification '*100+'<script>unsafe</script> FINAL LIMIT'
        row['owner_evidence']['statement'] = '<img src=x onerror=alert(1)>'
        library.tab_reconciliations = [row]
        html = tab_search(library, 'R04')
        self.assertIn(escape(row['resolution']), html)
        self.assertIn(escape(row['owner_evidence']['statement']), html)
        self.assertNotIn('<script>', html)
        self.assertNotIn('<img', html)
        library.evidence = copy.deepcopy(library.evidence)
        library.evidence['tab-po-direction']['authority']['owner_clarification'] = row['owner_evidence']['statement']
        self.assertIn(escape(row['owner_evidence']['statement']), render_evidence(library, 'tab-po-direction')[1])


if __name__ == '__main__':
    unittest.main()
