import sys
from pathlib import Path
import unittest
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from discover_aim import toc_tree, publication_href, PUBLICATION


class DiscoveryTests(unittest.TestCase):
    def test_containers_duplicates_and_breadcrumbs(self):
        primary = {'numchunks':1,'tree':{'n':[{'i':0,'c':0,'n':[{'i':1,'c':0},{'i':2,'c':0}]}]}}
        chunks = {0:{'___':{'i':[0],'t':['Group'],'b':['']}, '/Content/A.htm':{'i':[1,2],'t':['Same','Same'],'b':['#a','#b']}}}
        roots, count = toc_tree(primary,chunks)
        self.assertEqual(count,3)
        self.assertEqual(roots[0]['children'][1]['breadcrumbs'],['Group','Same'])
        self.assertEqual(roots[0]['children'][1]['bookmark'],'#b')
        self.assertEqual(publication_href('/Content/A.htm'),PUBLICATION+'Content/A.htm')

    def test_missing_or_extra_nodes_prevent_reconciliation(self):
        primary={'numchunks':1,'tree':{'n':[{'i':0,'c':0}]}}
        chunks={0:{'/Content/A.htm':{'i':[0,1],'t':['A','B'],'b':['','']}}}
        with self.assertRaisesRegex(ValueError,'unvisited'):toc_tree(primary,chunks)


if __name__=='__main__':unittest.main()
