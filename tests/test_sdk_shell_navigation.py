"""Exact SDK entry shell routing must not waive ordinary anchor/target checks."""
import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

repository=Path(os.environ.get('SDK_TEST_REPOSITORY',Path(__file__).resolve().parents[1]))
sys.path[:0]=[str(Path(__file__).resolve().parents[1]/'tools'),str(repository/'tools'),str(repository/'tests')]
import audit_sdk
import test_verify_sdk
from collector import digest,SEEDS


class SdkShellNavigationTests(unittest.TestCase):
    def setUp(self):
        helper=test_verify_sdk.VerifySdkTests();helper.setUp();self.addCleanup(helper.doCleanups)
        folder=tempfile.TemporaryDirectory();self.addCleanup(folder.cleanup)
        self.store,selection,_,_=helper.fixture(folder.name)
        self.welcome=next(r for r in self.store.records('SDK') if r['id']==selection['article_ids'][0])
        shell=b'<html><head><script src="template/packages/core-web/script/navigation.min.js"></script></head><body><iframe id="i-content" name="i-content"></iframe></body></html>'
        runtime=';'.join(audit_sdk.SHELL_ROUTING_STATEMENTS).encode()
        self.shell=self.save(audit_sdk.SHELL_URL,'navigation',shell,'text/html')
        self.runtime=self.save(audit_sdk.SHELL_RUNTIME_URL,'script',runtime,'application/javascript')
        for name,value in (('SHELL_SHA256',digest(shell)),('SHELL_RUNTIME_SHA256',digest(runtime))):
            item=patch.object(audit_sdk,name,value);item.start();self.addCleanup(item.stop)

    def save(self,url,kind,raw,mime):
        r=self.store.discover('SDK',url,SEEDS['SDK'],'synthetic_fixture',kind)
        self.store.save_original(r,raw,{'http_status':200,'final_url':r['source_url'],'mime':mime,'encoding':'utf-8'})
        return r

    def check(self,record=None,fragment='Welcome.html'):
        c={r['id']:r for r in self.store.records('SDK')}
        check=audit_sdk.link_checker(self.store,{'SDK':c,'AIM':{}},{})
        return check({'classification':'internal','source_id':'entry','target_id':(record or self.shell)['id'],'fragment':fragment},'SDK')

    def test_exact_shell_route_checks_real_topic_reading(self):
        self.assertEqual(self.check(),'VERIFIED')
        route=audit_sdk.shell_topic_route(self.store,self.shell,'Welcome.html',{r['id']:r for r in self.store.records('SDK')})
        self.assertEqual(route['topic_id'],self.welcome['id'])
        self.assertEqual(route['evidence']['runtime_sha256'],self.runtime['sha256'])

    def test_saved_shell_cannot_waive_missing_topic(self):
        self.welcome['status']='FAILED';self.store.save_record(self.welcome)
        self.assertEqual(self.check(),'UNRESOLVED_TARGET_NOT_CAPTURED')

    def test_route_cannot_waive_altered_reading(self):
        path=self.store.root/self.welcome['reading_paths']['html'];path.write_bytes(path.read_bytes().replace(b'Original welcome',b'Changed welcome'))
        self.assertEqual(self.check(),'UNRESOLVED_TARGET_READING_FIDELITY')

    def test_native_article_and_navigation_anchor_failures_remain(self):
        self.assertEqual(self.check(self.welcome,'missing'),'UNRESOLVED_TARGET_FRAGMENT')
        self.assertEqual(self.check(fragment='missing'),'UNRESOLVED_NAVIGATION_FRAGMENT')
        other=self.save('other-navigation.html','navigation',b'<html><body>Navigation</body></html>','text/html')
        self.assertEqual(self.check(other),'UNRESOLVED_NAVIGATION_FRAGMENT')

    def test_source_or_runtime_generation_change_refuses_route(self):
        for record in (self.shell,self.runtime):
            with self.subTest(url=record['source_url']):
                path=self.store.root/record['local_path'];raw=path.read_bytes();path.write_bytes(raw+b' ')
                self.assertEqual(self.check(),'UNRESOLVED_TARGET_INTEGRITY')
                path.write_bytes(raw)


if __name__=='__main__':unittest.main()
