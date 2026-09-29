import sys,unittest
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
from discover_sdk import reference_kind

class LiteralTopicTests(unittest.TestCase):
    def test_guid_href_uses_exact_published_route(self):
        base='https://travstg.manhscale.com/SCALEHelp/SDK/topic.html'
        guid='95D66AE2-08C0-496B-89BD-FDDD6CAB969E'
        for href in (guid,'{'+guid+'}','%7B'+guid+'%7D'):
            with self.subTest(href=href):
                self.assertEqual(reference_kind({'tag':'a','attrs':{}},'href',href,base,'article'),('article',None))
    def test_unrelated_or_malformed_route_remains_unclassified(self):
        base='https://travstg.manhscale.com/SCALEHelp/SDK/topic.html'
        for href in ('unknown-path','{95D66AE2-08C0-496B-89BD-FDDD6CAB969E','95D66AE2-08C0-496B-89BD-FDDD6CAB969E}'):
            self.assertEqual(reference_kind({'tag':'a','attrs':{}},'href',href,base,'article'),('unclassified',None))
if __name__=='__main__':unittest.main()
