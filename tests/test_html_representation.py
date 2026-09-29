import sys,unittest
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
from stage_transport import validate_body,AcquisitionBlocked

class HtmlRepresentationTests(unittest.TestCase):
    def test_javascript_embedded_html_is_not_document(self):
        validate_body('https://travstg.manhscale.com/SCALEHelp/SDK/example.js',
            'application/javascript',b'/*! jQuery v1.7.2 */ var s="<html><body>";')

    def test_actual_html_asset_responses_still_fail(self):
        for prefix in (b'',b'\xef\xbb\xbf  ',b'<!-- publisher -->\n'):
            with self.subTest(prefix=prefix),self.assertRaises(AcquisitionBlocked) as caught:
                validate_body('https://travstg.manhscale.com/SCALEHelp/SDK/image.png',
                    'application/octet-stream',prefix+b'<html><body>document</body></html>')
            self.assertEqual(caught.exception.code,'UNEXPECTED_HTML')

    def test_authentication_document_still_blocks(self):
        with self.assertRaises(AcquisitionBlocked) as caught:
            validate_body('https://travstg.manhscale.com/SCALEHelp/SDK/example.js',
                'text/html',b'<html><body><input type="password"></body></html>')
        self.assertEqual(caught.exception.code,'BLOCKED_AUTH')

if __name__=='__main__':unittest.main()
