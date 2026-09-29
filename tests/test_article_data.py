import sys
from pathlib import Path
import tempfile
import unittest
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
from collector import Store, SEEDS, atomic_json
from article_data import parse_article, serialize, inventory, text_of, search_text, TreeParser, nodes, reference_candidates, convert
from build_search import build
import sqlite3
from contextlib import closing


class ArticleDataTests(unittest.TestCase):
    def fixture(self):
        return (b'<html data-mc-runtime-file-type="Topic"><head><title>A &amp; B</title><script>doNotExecute()</script></head><body>'
                b'<p class="MCWebHelpFramesetLink"><a href="../OnlineHelp.htm">Open topic with navigation</a></p>'
                b'<h1>A &amp; B</h1><p>Exact <strong>words</strong>.</p><table><tr><th rowspan="2">H</th><td colspan="2">C</td></tr>'
                b'<tr><td>A</td><td>B</td></tr></table><pre>  SELECT\t1;\r\n    -- preserve\r\n</pre>'
                b'<div class="MCDropDownBody" style="display:none"><p>Hidden documentary text</p></div>'
                b'<p onclick="unsafe()">Keep this.</p></body></html>')

    def test_exact_text_code_table_and_hidden_variants(self):
        parser,content,excluded,title,encoding=parse_article({'encoding':'utf-8'},self.fixture())
        markup,exceptions=serialize(content,[],{},'AIM')
        self.assertEqual(title,'A & B')
        self.assertNotIn('onclick',markup)
        self.assertNotIn('display:none',markup)
        self.assertNotIn('Open topic with navigation',markup)
        self.assertIn('Hidden documentary text',markup)
        self.assertIn('  SELECT\t1;\r\n    -- preserve\r\n',markup)
        self.assertIn('rowspan="2"',markup)
        self.assertIn('colspan="2"',markup)
        self.assertEqual(len(inventory(content)['variants']),1)
        reread=TreeParser();reread.feed('<body>'+markup+'</body>')
        self.assertEqual(text_of(content),text_of(next(n for n in nodes(reread.root) if n['tag']=='body')))
        self.assertFalse(exceptions)

    def test_srcset_lazy_and_background_dependencies(self):
        parser=TreeParser();parser.feed('<body><img src="a.png" srcset="b.png 2x, c.png 3x" data-src="d.png"><div style="background:url(e.png)"></div></body>')
        self.assertEqual([ref[2] for ref in reference_candidates(parser.root)],['a.png','b.png','c.png','d.png','e.png'])

    def test_truncation_fallback_text_and_search_boundaries(self):
        parser=TreeParser();parser.feed('<body><p>Unclosed');parser.close()
        self.assertTrue(parser.errors)
        _,content,_,_,_=parse_article({'encoding':'utf-8'},b'<html><head><title>Test</title></head><body><p>Alpha</p><p>Beta</p><noscript>Fallback</noscript></body></html>')
        markup,_=serialize(content,[],{},'AIM')
        self.assertIn('Fallback',markup)
        self.assertNotIn('AlphaBeta',search_text(content))

    def test_table_row_boundaries_are_part_of_inventory(self):
        results=[]
        for table in ['<table><tr><td>A</td><td>B</td></tr></table>','<table><tr><td>A</td></tr><tr><td>B</td></tr></table>']:
            parser=TreeParser();parser.feed(table);parser.close()
            results.append(inventory(parser.root)['tables'][0]['rows'])
        self.assertNotEqual(results[0],results[1])

    def test_provisional_search_build_is_explicit_and_reproducible(self):
        with tempfile.TemporaryDirectory() as folder:
            store=Store(folder)
            record=store.discover('AIM','Content/test.htm',SEEDS['AIM'],'fixture','article')
            store.save_original(record,self.fixture(),{'final_url':record['source_url'],'http_status':200,'mime':'text/html','encoding':'utf-8','redirect_chain':[]})
            result=convert(store,record)
            atomic_json(store.root/'AIM/manifests/toc.json',{'nodes':[{'id':'group','title':'Container','breadcrumbs':['Container'],'resource_id':None,'children':[{'id':'topic','title':'A & B','resource_id':record['id'],'breadcrumbs':['Container','A & B'],'children':[]}]}]})
            self.assertTrue(result['checks']['exact_decoded_text'])
            output=Path(folder)/'_project/search.sqlite'
            report=build(store,output,True)
            first=output.read_bytes()
            build(store,output,True)
            self.assertEqual(first,output.read_bytes())
            self.assertTrue(report['provisional'])
            self.assertEqual(report['counts']['navigation'],2)
            with closing(sqlite3.connect(output)) as db:
                self.assertEqual(db.execute("SELECT title FROM article_search WHERE article_search MATCH ?",('Hidden',)).fetchall(),[('A & B',)])
            self.assertEqual(build(store,output,False)['counts']['articles'],0)
            record['sha256']='0'*64
            store.save_record(record)
            with self.assertRaisesRegex(ValueError,'Stale'):build(store,output,True)


if __name__=='__main__':unittest.main()
