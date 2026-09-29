import sys
from pathlib import Path
import unittest
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from static_data import parse_define


class StaticDataTests(unittest.TestCase):
    def test_hierarchy_strings_and_trailing_commas(self):
        data = parse_define("define({numchunks:2,tree:{n:[{i:0,n:[{i:1},]},]},x:'a\\n\\u0041\\\'b',ok:true});")
        self.assertEqual(data['tree']['n'][0]['n'][0]['i'], 1)
        self.assertEqual(data['x'], "a\nA'b")
        self.assertTrue(data['ok'])

    def test_executable_data_and_duplicate_keys_rejected(self):
        for value in ["define(function(){return {}});", "define({x:alert(1)});", "define({x:1});alert(1)", "define({x:1,x:2});"]:
            with self.subTest(value=value), self.assertRaises(ValueError):
                parse_define(value)


if __name__ == '__main__': unittest.main()
