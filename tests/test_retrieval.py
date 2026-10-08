"""Synthetic retrieval regressions independent of the authored evaluation cases."""
import json
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
from help_knowledge import Knowledge, tokens


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


if __name__ == '__main__':
    unittest.main()
