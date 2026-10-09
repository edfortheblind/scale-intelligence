"""Synthetic retrieval regressions independent of the authored evaluation cases."""
import json
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
from help_knowledge import Knowledge, tokens, topic_name_context


def topic(identity, title, answer='', boundaries=(), evaluation=None):
    return {'topic_id': identity, 'title': title, 'business_question': '',
            'plain_answer': answer, 'trigger': '', 'input_context': [],
            'configuration_dependencies': [], 'expected_results': [],
            'explanation_paths': [], 'execution_steps': [], 'evidence_refs': [],
            'boundaries': list(boundaries), 'evaluation': evaluation or {}}


class RetrievalTests(unittest.TestCase):
    def knowledge(self, topics):
        folder = tempfile.TemporaryDirectory()
        self.addCleanup(folder.cleanup)
        root = Path(folder.name)
        path = root/'DB Architecture/mappings/help-topics.json'
        path.parent.mkdir(parents=True)
        path.write_text(json.dumps({'snapshot_id': 'synthetic', 'sources': {},
                                    'topics': topics}), encoding='utf-8')
        return Knowledge(root)

    def test_displayed_boundary_is_searchable(self):
        data = self.knowledge([topic('example', 'Example', boundaries=[
            'A purple warning does not establish that the transfer completed.'])])
        self.assertEqual([r['topic_id'] for r in data.search('purple warning')['results']], ['example'])

    def test_evaluation_text_never_enters_retrieval(self):
        data = self.knowledge([topic('example', 'Example', evaluation={
            'cases': [{'question': 'testquestiononly', 'expected': 'testansweronly',
                       'must_not_claim': ['testforbiddenonly']}]})])
        for word in ['testquestiononly', 'testansweronly', 'testforbiddenonly']:
            with self.subTest(word=word):
                self.assertEqual(data.search(word)['results'], [])

    def test_whole_word_does_not_match_unrelated_prefixes(self):
        data = self.knowledge([topic('camera', 'Capture capacity',
                                     'Capture capacity applies to the camera.')])
        self.assertEqual(data.search('cap')['results'], [])

    def test_identifier_and_number_boundaries_match_plain_words(self):
        data = self.knowledge([topic('example', 'Example',
                                     'serialCount has a maximum100 threshold.')])
        self.assertIn('count', tokens('serialCount'))
        # A standalone result noun requests its subject under the clarification
        # policy; token splitting remains distinct from query intent.
        self.assertEqual(data.search('count')['state'], 'NEEDS_CONTEXT')
        for question in ['serial count', 'maximum 100', '100']:
            with self.subTest(question=question):
                self.assertEqual([r['topic_id'] for r in data.search(question)['results']], ['example'])

    def test_exact_identifier_retains_its_specificity(self):
        data = self.knowledge([topic('exact', 'Example', 'serialCount is available.'),
                               topic('other', 'Serial number counts', 'A serial number is counted.')])
        self.assertEqual(data.search('serialCount')['results'][0]['topic_id'], 'exact')

    def test_each_adjacent_letter_number_component_is_searchable(self):
        for identifier, components in [('X1Y2', ['x', '1', 'y', '2']),
                                       ('1b2', ['1', 'b', '2']),
                                       ('A12B34C', ['12', 'b', '34', 'c'])]:
            data = self.knowledge([topic('example', 'Example', identifier)])
            for question in components + [identifier]:
                with self.subTest(identifier=identifier, question=question):
                    self.assertEqual([r['topic_id'] for r in data.search(question)['results']], ['example'])

    def test_short_boundary_is_not_hidden_by_large_topic(self):
        data = self.knowledge([
            topic('large', 'Maintenance guidance', 'Ordinary unrelated information. '*1000,
                  ['Orphaned labels are excluded.']),
            topic('decoy', 'Orphaned reports', 'The report discusses orphaned files.')])
        self.assertEqual(data.search('orphaned labels')['results'][0]['topic_id'], 'large')

    def test_reviewed_question_is_not_hidden_by_large_topic(self):
        large = topic('large', 'Aster workflow', 'General guidance. '*1000)
        large['business_question'] = 'Why does robot calibration remain pending?'
        data = self.knowledge([
            large,
            topic('decoy', 'Pending calibration',
                  'Calibration may be pending when an unrelated reader is offline.')])
        self.assertEqual(data.search('calibration pending')['results'][0]['topic_id'], 'large')

    def named_topic_fixture(self, prefix='process-'):
        return self.knowledge([
            topic(prefix+'assembly', 'Assembly', 'General overview.'),
            topic(prefix+'assembly-order', 'Assembly order', 'General process.'),
            topic('detail', 'Completion status', 'Completion status is a quantity.')])

    def test_compound_topic_does_not_also_boost_contained_topic(self):
        data = self.named_topic_fixture()
        result = data.search('assembly order completion status')['results']
        self.assertEqual([r['topic_id'] for r in result],
                         ['process-assembly-order', 'detail', 'process-assembly'])

    def test_independent_shorter_topic_keeps_its_boost(self):
        data = self.named_topic_fixture()
        result = data.search('assembly order and assembly completion status')['results']
        self.assertEqual([r['topic_id'] for r in result[:2]],
                         ['process-assembly-order', 'process-assembly'])

    def test_standalone_shorter_topic_keeps_its_boost(self):
        data = self.named_topic_fixture()
        result = data.search('assembly completion status')['results']
        self.assertEqual(result[0]['topic_id'], 'process-assembly')

    def test_partial_word_does_not_name_a_topic(self):
        data = self.named_topic_fixture()
        result = data.search('reassembly order completion status')['results']
        self.assertEqual(result[0]['topic_id'], 'detail')

    def test_nonprocess_topic_names_keep_the_same_preference(self):
        data = self.named_topic_fixture(prefix='')
        result = data.search('assembly order completion status')['results']
        self.assertEqual([r['topic_id'] for r in result],
                         ['assembly-order', 'detail', 'assembly'])
        independent = data.search('assembly and assembly order completion status')['results']
        self.assertEqual([r['topic_id'] for r in independent[:2]],
                         ['assembly-order', 'assembly'])

    def compound_modifier_fixture(self):
        return self.knowledge([
            topic('process-widget', 'Widget', 'General overview.'),
            topic('package-constraints', 'Package constraints',
                  'Widget-bearing cartons have identifiers.')])

    def test_attached_modifier_or_identifier_does_not_name_its_fragment(self):
        data = self.compound_modifier_fixture()
        for question in ('widget-bearing cartons', 'non-widget-bearing cartons',
                         'widget_bearing cartons', 'WIDGET_BEARING cartons'):
            with self.subTest(question=question):
                ids = [r['topic_id'] for r in data.search(question)['results']]
                self.assertEqual(ids[0], 'package-constraints')
                self.assertIn('process-widget', ids)  # Ordinary FTS is preserved.

    def test_separate_topic_mentions_and_spaced_punctuation_keep_preference(self):
        data = self.compound_modifier_fixture()
        for question in ('widget and widget-bearing cartons', 'widget-bearing cartons and widget',
                         'widget - configuration'):
            with self.subTest(question=question):
                self.assertEqual(data.search(question)['results'][0]['topic_id'], 'process-widget')

    def test_complete_compound_and_camelcase_topic_names_keep_preference(self):
        data = self.named_topic_fixture()
        for question in ('assembly-order completion status', 'assembly_order completion status',
                         'AssemblyOrder completion status'):
            with self.subTest(question=question):
                self.assertEqual(data.search(question)['results'][0]['topic_id'], 'process-assembly-order')

    def test_name_context_preserves_search_token_normalization(self):
        for question in ('', 'Widget-bearing, X1Y2!', 'non_widget-bearing',
                         'XMLReaderOrder + café', 'Item - configuration', 'one--two___three'):
            with self.subTest(question=question):
                self.assertEqual(topic_name_context(question)[0], ' ' + ' '.join(tokens(question)) + ' ')

    def test_mixed_identifier_compound_keeps_complete_expanded_name_only(self):
        data = self.knowledge([
            topic('process-assembly-order-bearing', 'Assembly order bearing', 'General overview.'),
            topic('process-order-bearing', 'Order bearing', 'General overview.'),
            topic('process-assemblyorder', 'AssemblyOrder', 'General overview.'),
            topic('detail', 'Completion status', 'Completion status is a quantity.')])
        for question in ('AssemblyOrder-bearing completion status',
                         'assemblyOrder_bearing completion status'):
            with self.subTest(question=question):
                ids = [r['topic_id'] for r in data.search(question)['results']]
                self.assertEqual(ids[:2], ['process-assembly-order-bearing', 'detail'])
        independent = data.search('AssemblyOrder-bearing and order-bearing completion status')['results']
        self.assertEqual([r['topic_id'] for r in independent[:2]],
                         ['process-assembly-order-bearing', 'process-order-bearing'])


if __name__ == '__main__':
    unittest.main()
