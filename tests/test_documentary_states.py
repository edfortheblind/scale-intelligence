import sys
from pathlib import Path
import unittest
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
from article_data import TreeParser
from documentary_states import reconcile


class StateTests(unittest.TestCase):
    def test_toggler_pairs_all_named_bodies_and_preserves_empty_condition(self):
        parser=TreeParser();parser.feed('<body><a class="MCToggler" data-mc-targets="t1;t2">Toggle</a><div data-mc-target-name="t1">A</div><div data-mc-target-name="t1">B</div><p data-mc-target-name="t2" data-mc-conditions="">C</p></body>');parser.close()
        result=reconcile(parser.root,[],{})
        self.assertEqual(len(result['control_body_edges']),3)
        self.assertEqual(result['condition_nodes'][0]['literal_condition'],'')
        self.assertTrue(result['static_relationships_passed'])

    def test_missing_popup_target_is_a_gap(self):
        parser=TreeParser();parser.feed('<a class="MCTopicPopup" href="missing.htm">Popup</a>');parser.close()
        result=reconcile(parser.root,[{'node_id':'n1','attribute':'href','target_id':'missing'}],{})
        self.assertFalse(result['static_relationships_passed'])
        self.assertEqual(result['issues'][0]['class'],'POPUP_TARGET_NOT_CAPTURED')


if __name__=='__main__':unittest.main()
