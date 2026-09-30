import copy
from pathlib import Path
import sys
import unittest
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
from build_runtime_profiles import aggregate


class RuntimeProfileTests(unittest.TestCase):
    def setUp(self):
        self.row={'object_id':1,'replica_group_id':1,'execution_type_desc':'Regular','runtime_stats_interval_id':1,
                  'interval_start':'2026-09-01T00:00:00Z','interval_end':'2026-09-01T01:00:00Z',
                  'statement_executions':2,'weighted_total_duration_us':2000,'weighted_total_cpu_us':1000,
                  'min_statement_duration_us':500,'max_statement_duration_us':1500}

    def test_weighting_uses_executions_not_average_of_averages(self):
        other={**self.row,'runtime_stats_interval_id':2,'statement_executions':8,'weighted_total_duration_us':80000}
        p=aggregate([self.row,other])[0]
        self.assertEqual(p['weighted_mean_statement_ms'],8.2)
        self.assertFalse(p['whole_process_duration_established'])

    def test_replica_and_execution_types_are_separate(self):
        rows=[self.row,{**self.row,'replica_group_id':2},{**self.row,'execution_type_desc':'Aborted'}]
        self.assertEqual(len(aggregate(rows)),3)

    def test_zero_count_has_no_mean(self):
        row={**self.row,'statement_executions':0,'weighted_total_duration_us':0,'weighted_total_cpu_us':0}
        self.assertIsNone(aggregate([row])[0]['weighted_mean_statement_ms'])

    def test_duplicate_rows_nonfinite_and_invalid_interval_rejected(self):
        with self.assertRaises(ValueError):aggregate([self.row,self.row])
        for updates in [{'weighted_total_duration_us':float('nan')},{'statement_executions':-1},
                        {'interval_end':'2026-08-31T00:00:00Z'}]:
            with self.subTest(updates=updates),self.assertRaises(ValueError):aggregate([{**self.row,**updates}])


if __name__=='__main__':unittest.main()
