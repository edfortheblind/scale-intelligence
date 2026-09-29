import sys
from pathlib import Path
import tempfile
import subprocess
import unittest
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
from collector import Store,SEEDS
from article_data import convert
from verify_delivery import verify


class DeliveryTests(unittest.TestCase):
    def test_git_clone_preserves_original_and_reading_code_bytes(self):
        with tempfile.TemporaryDirectory() as folder:
            base=Path(folder).resolve()
            root=base/'repo';root.mkdir()
            store=Store(root)
            record=store.discover('AIM','Content/fixture.htm',SEEDS['AIM'],'synthetic-fixture','article')
            original=b'<html><head><title>Fixture</title></head><body><pre>  x\t=1;\r\n  y=2;\r\n</pre></body></html>'
            store.save_original(record,original,{'http_status':200,'final_url':record['source_url'],'mime':'text/html','encoding':'utf-8'})
            convert(store,record)
            (root/'.gitattributes').write_bytes((Path(__file__).resolve().parents[1]/'.gitattributes').read_bytes())
            def git(*args,cwd=root):
                return subprocess.run(['git','-c','core.autocrlf=true','-c','user.name=Collector Test','-c','user.email=collector-test@example.invalid',*args],cwd=cwd,capture_output=True,check=True)
            git('init','-q');git('add','.');git('commit','-qm','Synthetic round-trip fixture')
            clone=base/'clone'
            git('clone','-q',str(root),str(clone),cwd=base)
            self.assertTrue(verify(clone)['checkpoint_integrity_passed'])
            self.assertEqual((clone/record['local_path']).read_bytes(),original)
            (clone/record['reading_paths']['markdown']).write_text('tampered',encoding='utf-8')
            self.assertFalse(verify(clone)['checkpoint_integrity_passed'])


if __name__=='__main__':unittest.main()
