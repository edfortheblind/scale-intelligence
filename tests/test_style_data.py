import sys
from pathlib import Path
import tempfile
import unittest
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
from collector import Store, SEEDS, read_json
from style_data import css_references,convert_styles


class StyleDataTests(unittest.TestCase):
    def test_css_offsets_imports_and_comments(self):
        source='/* url(ignore.png) */ @import "theme.css"; .x {background:url("a.png");}'
        refs=list(css_references(source))
        self.assertEqual(sorted(r[2] for r in refs),['a.png','theme.css'])
        for start,end,href,_ in refs:self.assertEqual(source[start:end],href)

    def test_legacy_polyfill_is_not_a_standard_css_fetch(self):
        with tempfile.TemporaryDirectory() as folder:
            store=Store(folder)
            record=store.discover('AIM','Skins/a.css',SEEDS['AIM'],'fixture','stylesheet')
            body=b'@namespace MadCap url(http://example.test/schema); .a { background: url(Images/a.png); /* W3C */ -pie-background: url(Skins/Images/a.png); behavior:url(Resources/PIE.htc); }'
            store.save_original(record,body,{'http_status':200,'final_url':record['source_url'],'mime':'text/css','encoding':'utf-8'})
            convert_styles(store,'AIM')
            data=read_json(store.root/'AIM/data/stylesheets'/(record['id']+'.json'))
            self.assertEqual([r['classification'] for r in data['references']],['namespace_identifier','internal','legacy_opaque_reference','legacy_opaque_reference'])
            resources=store.records('AIM')
            self.assertEqual(len(resources),2)
            rendered=(store.root/data['rendered_path']).read_text()
            self.assertNotIn('behavior:',rendered)
            self.assertNotIn('-pie-background:',rendered)


if __name__=='__main__':unittest.main()
