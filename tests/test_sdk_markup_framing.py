"""Boundary tests for native document framing; no source changes or network."""
from pathlib import Path
import sys
import unittest
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
import verify_sdk_markup as native
import sdk_article_data as sdk
from collector import digest


class NativeDocumentFramingTests(unittest.TestCase):
    def parse(self,raw,encoding='utf-8'):
        record={'module':'SDK','encoding':encoding}
        parser,content,*_=sdk.parse_article(record,raw)
        return record,parser,content

    def test_utf8_bom_is_consumed_once_only_when_present_in_bytes(self):
        raw=b'\xef\xbb\xbf<html><head><title>Head</title></head><body>Body</body></html>'
        record,parser,content=self.parse(raw)
        source,consumed=native.browser_source_string(record,raw)
        self.assertTrue(consumed);self.assertTrue(source.startswith('<html>'))
        self.assertEqual(sdk.dom_text_of(content),'Body')
        self.assertFalse(native.browser_source_string(record,raw[3:])[1])
        self.assertTrue(native.browser_source_string(record,b'\xef\xbb\xbf'+raw)[0].startswith('\ufeff'))
        self.assertEqual(native.browser_source_string({'encoding':'utf-8-sig'},raw)[0],source)

    def test_post_body_whitespace_is_exactly_projected_without_trimming_body(self):
        raw=b'<html><head></head><body> \r\nBody\r\n </body>\r\n</html>\r\n'
        record,parser,content=self.parse(raw)
        self.assertEqual(native.trailing_document_whitespace(parser),'\n\n')
        self.assertEqual(sdk.dom_text_of(content),' \nBody\n ')
        self.assertEqual(native.expected_projection(content,parser)['body_text_sha256'],digest(b' \nBody\n \n\n'))
        frame=native.document_framing(record,raw,parser)
        self.assertEqual(frame['trailing_whitespace_characters'],2)
        self.assertEqual(frame['trailing_whitespace_sha256'],digest(b'\n\n'))

    def test_nonwhitespace_or_elements_after_body_are_not_silently_absorbed(self):
        for tail in ('hidden text','<p>outside content</p>','&nbsp;','\u00a0'):
            with self.subTest(tail=tail):
                _,parser,_=self.parse(('<html><body>Body</body>'+tail+'</html>').encode())
                with self.assertRaisesRegex(ValueError,'UNSUPPORTED_'):
                    native.trailing_document_whitespace(parser)

    def test_comments_after_body_do_not_become_documentary_text(self):
        _,parser,content=self.parse(b'<html><body>Body</body><!-- outside comment -->\r\n</html>\t')
        self.assertEqual(native.trailing_document_whitespace(parser),'\n\t')
        self.assertEqual(native.expected_projection(content,parser)['body_text_sha256'],digest(b'Body\n\t'))


if __name__=='__main__':unittest.main()
