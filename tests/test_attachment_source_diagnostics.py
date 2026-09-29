import sys,unittest
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
from verify_sdk import attachment_check
from collector import digest

class OriginalTextDiagnostics(unittest.TestCase):
    def test_invalid_source_json_encoding_is_preserved_and_reported(self):
        raw=b'{"key": "\x93source\x94"}'
        record={'id':'example','source_url':'https://travstg.manhscale.com/SCALEHelp/SDK/example.json',
                'sha256':digest(raw),'encoding':None}
        result=attachment_check(record,raw)
        self.assertFalse(result['passed'])
        self.assertEqual(result['sha256'],digest(raw))
        self.assertEqual(result['source_diagnostic']['class'],'SOURCE_TEXT_ENCODING_INVALID')
        self.assertTrue(result['source_diagnostic']['original_bytes_preserved'])
        self.assertFalse(result['source_diagnostic']['replacement_or_transcoding_applied'])

if __name__=='__main__':unittest.main()
