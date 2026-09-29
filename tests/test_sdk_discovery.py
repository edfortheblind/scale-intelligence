import json
import os
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from collector import Store, atomic_json, digest, source_identity
from discover_sdk import (NavigationParser, toc_tree, index_tree, candidates,
                          reference_kind, default_topics, reconcile, PUBLICATION,
                          parse_search_index, search_mode_flags, search_runtime_evidence,
                          discovery_inputs, discovery_proof, report_summary,
                          PARSER_VERSION, DISCOVERY_CODE)


def search_source(body):
    return '$(function () { Innovasys.Content.Features.buildSearchFilesAndKeywords = function(f,s,c) {\n' + body + '\n}\n});\n'


def parse(text):
    parser = NavigationParser()
    parser.feed(text)
    parser.close()
    return parser


def proof_fixture(root):
    """Create a closure fixture for freshness checks, without reparsing or network."""
    atomic_json(root/'_project/STATE.json',{'modules':{'AIM':{'status':'MODULE_LOCAL_COMPLETE'}}})
    store=Store(root,cache_records=True)
    navigation=store.discover('SDK','webtoc.html',PUBLICATION,'fixture','navigation')
    article=store.discover('SDK','A.html',PUBLICATION,'fixture','article')
    for record in (navigation,article):
        store.save_original(record,b'<html><body>Fixture</body></html>',
                            {'final_url':record['source_url'],'http_status':200,'mime':'text/html'})
    navigation['navigation_role']='toc'
    store.save_record(navigation)
    article['app_data_path']='SDK/data/articles/'+article['id']+'.json'
    store.save_record(article)
    reference={'classification':'internal','target_id':article['id'],'original_href':'A.html','fragment':''}
    entry={'title':'Group','children':[{'title':'A','children':[],'resource_id':article['id']}]}
    for name,data in {
        'toc':{'nodes':[entry], 'discovery_complete':True},
        'index':{'nodes':[entry], 'discovery_complete':True},
        'discovery-membership':{'toc':[article['id']],'index':[article['id']]},
        'navigation-partitions':[{'id':navigation['id'],'role':'toc','status':'PARSED'}],
        'navigation-references':[reference],
    }.items():
        atomic_json(root/'SDK/manifests'/(name+'.json'),data)
    atomic_json(root/'SDK/data/navigation'/(navigation['id']+'.json'),
                {'source_id':navigation['id'],'source_tree':entry,'references':[reference]})
    atomic_json(root/'SDK/data/stylesheets/fixture.json',{'references':[]})
    atomic_json(root/article['app_data_path'],{'id':article['id'],'source':{'sha256':article['sha256']},
                'references':[reference],'verification':{'audited':False}})
    for name in DISCOVERY_CODE:
        path=root/'tools'/name
        path.parent.mkdir(parents=True,exist_ok=True)
        path.write_text('# Fixture parser dependency\n',encoding='utf-8')
    proof={'parser_version':PARSER_VERSION,'fixed_point':True,'discovery_reconciled':True,
           'publication_navigation_reconciled':True,'issues':[],'inputs':discovery_inputs(store)}
    atomic_json(root/'SDK/manifests/discovery-closure.json',proof)
    return store,navigation,article


class SdkDiscoveryTests(unittest.TestCase):
    def test_current_discovery_proof_is_read_only_and_ignores_audit_only_flags(self):
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory)
            store,navigation,article=proof_fixture(root)
            before={p.relative_to(root).as_posix():(p.read_bytes(),p.stat().st_mtime_ns)
                    for p in root.rglob('*') if p.is_file()}
            self.assertTrue(discovery_proof(store)['passed'])
            self.assertEqual(before,{p.relative_to(root).as_posix():(p.read_bytes(),p.stat().st_mtime_ns)
                                     for p in root.rglob('*') if p.is_file()})
            data=json.loads((root/article['app_data_path']).read_text())
            data['verification']['audited']=True
            atomic_json(root/article['app_data_path'],data)
            article['visual_verified']=True
            store.save_record(article)
            self.assertTrue(discovery_proof(store)['passed'])

    def test_all_navigation_artifacts_bind_labels_hierarchy_memberships_and_references(self):
        mutations=[
            ('toc.json',lambda v:v['nodes'][0].__setitem__('title','Edited label')),
            ('toc.json',lambda v:v['nodes'].__setitem__(slice(None),v['nodes'][0]['children'])),
            ('index.json',lambda v:v['nodes'][0].__setitem__('title','Edited index label')),
            ('index.json',lambda v:v['nodes'][0]['children'].append({'title':'Extra','children':[]})),
            ('discovery-membership.json',lambda v:v['toc'].clear()),
            ('navigation-references.json',lambda v:v.append(dict(v[0]))),
            ('navigation-partitions.json',lambda v:v[0].__setitem__('role','index')),
        ]
        for name,mutate in mutations:
            with self.subTest(name=name),tempfile.TemporaryDirectory() as directory:
                root=Path(directory)
                store,_,_=proof_fixture(root)
                self.assertTrue(discovery_proof(store)['passed'])
                path=root/'SDK/manifests'/name
                data=json.loads(path.read_text())
                mutate(data)
                atomic_json(path,data)
                result=discovery_proof(store)
                self.assertFalse(result['current'])
                self.assertFalse(result['passed'])
                self.assertEqual(result['error'],'DISCOVERY_CLOSURE_PROOF_STALE')

    def test_parsed_navigation_and_article_reference_lists_are_bound(self):
        for target in ('navigation','article','stylesheet'):
            with self.subTest(target=target),tempfile.TemporaryDirectory() as directory:
                root=Path(directory)
                store,nav,article=proof_fixture(root)
                path=(root/'SDK/data/navigation'/(nav['id']+'.json') if target=='navigation' else
                      root/article['app_data_path'] if target=='article' else root/'SDK/data/stylesheets/fixture.json')
                data=json.loads(path.read_text())
                data['references'].append({'classification':'internal','original_href':'Changed.html','target_id':'different'})
                atomic_json(path,data)
                self.assertFalse(discovery_proof(store)['current'])

    def test_current_original_bytes_parser_code_and_file_inventory_are_bound(self):
        for target in ('source','parser','missing_tree','extra_tree','missing_parser'):
            with self.subTest(target=target),tempfile.TemporaryDirectory() as directory:
                root=Path(directory)
                store,nav,article=proof_fixture(root)
                if target=='source':
                    (root/nav['local_path']).write_bytes(b'<html>Changed original</html>')
                elif target=='parser':
                    (root/'tools/discover_sdk.py').write_text('# Changed code\n')
                elif target=='missing_tree':
                    (root/'SDK/data/navigation'/(nav['id']+'.json')).unlink()
                elif target=='extra_tree':
                    atomic_json(root/'SDK/data/navigation/extra.json',{'references':[]})
                else:
                    (root/'tools/article_data.py').unlink()
                result=discovery_proof(store)
                self.assertFalse(result['current'])
                self.assertFalse(result['passed'])
                if target=='source':
                    self.assertTrue(any(i['class']=='SOURCE_BODY_HASH_OR_LENGTH_MISMATCH' for i in result['input_integrity_issues']))

    def test_manifest_occurrences_and_breadcrumbs_are_read_fresh_despite_store_cache(self):
        for field in ('occurrences','breadcrumbs'):
            with self.subTest(field=field),tempfile.TemporaryDirectory() as directory:
                root=Path(directory)
                cached,nav,article=proof_fixture(root)
                cached.records('SDK')
                other=Store(root)
                fresh=next(r for r in other.records('SDK') if r['id']==article['id'])
                fresh[field].append({'changed':True} if field=='occurrences' else ['Changed'])
                other.save_record(fresh)
                self.assertFalse(discovery_proof(cached)['current'])

    def test_source_gaps_keep_publication_navigation_distinct_from_full_discovery(self):
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory)
            store,_,_=proof_fixture(root)
            path=root/'SDK/manifests/discovery-closure.json'
            proof=json.loads(path.read_text())
            proof['discovery_reconciled']=False
            proof['issues']=[{'class':'RESOURCE_NOT_CAPTURED','type':'image','status':'HTTP_404'}]
            atomic_json(path,proof)
            result=discovery_proof(store)
            self.assertTrue(result['current'])
            self.assertTrue(result['publication_navigation_reconciled'])
            self.assertFalse(result['passed'])

    def test_missing_or_invalid_proof_cannot_pass(self):
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory)
            store=Store(root)
            self.assertEqual(discovery_proof(store)['error'],'DISCOVERY_CLOSURE_PROOF_MISSING')
            path=root/'SDK/manifests/discovery-closure.json'
            path.parent.mkdir(parents=True,exist_ok=True)
            path.write_text('{')
            self.assertEqual(discovery_proof(store)['error'],'DISCOVERY_CLOSURE_PROOF_INVALID')

    def test_cli_summary_omits_issue_details(self):
        report={key:False for key in ('module','status','discovery_reconciled','publication_navigation_reconciled',
                'navigation_parsed','toc_nodes','roots','index_occurrences','membership_counts','new_resources','fixed_point')}
        report['issues']=[{'class':'Example','private':'detail'}]
        report['parse_errors']=[{'detail':'full error'}]
        result=report_summary(report)
        self.assertEqual(result['issue_count'],1)
        self.assertNotIn('issues',result)
        self.assertNotIn('parse_errors',result)

    def test_search_preserves_titles_rank_words_and_ordered_duplicate_positions(self):
        source=search_source('f["2"]=new c("A.html#x","A \\"quoted\\" title",4);\n'
                             'f["1"]=new c("A.html#y","Duplicate",0);\n'
                             's["__word"]="2:9|2|2,1:0"\n')
        data=parse_search_index('\ufeff'+source)
        self.assertEqual([x['source_index'] for x in data['files']],['2','1'])
        self.assertEqual(data['files'][0]['title'],'A "quoted" title')
        self.assertEqual(data['files'][0]['rank'],4)
        self.assertEqual(data['keywords'][0]['word'],'_word')
        self.assertEqual(data['keywords'][0]['posting_literal'],'2:9|2|2,1:0')
        self.assertEqual(data['keywords'][0]['postings'][0]['positions'],[9,2,2])
        self.assertEqual(data['counts'],{'file_assignments':2,'keyword_assignments':1,'posting_entries':2,'positions':4})
        for value in data['files']+data['keywords']:
            start,end=value['source_char_span']
            self.assertEqual(source[start:end],value['literal_statement'])

    def test_search_rejects_execution_duplicate_assignment_and_wrong_schema(self):
        bad=['alert(1);', 'f["1"]=new c(run(),"A",0);', 'f["1"]=new c("A.html","A",false);',
             'f["1"]=new c("A.html","A",0);\nf["1"]=new c("B.html","B",0);',
             's["_a"]="1:0"\ns["_a"]="1:1"', 's["_a"]="1:0" s["_b"]="1:1"',
             's["_a"]="1:abc"']
        for body in bad:
            with self.subTest(body=body),self.assertRaises(ValueError):parse_search_index(search_source(body))
        with self.assertRaises(ValueError):parse_search_index(search_source('')+'run();')

    def test_search_unknown_posting_target_is_preserved_and_reported(self):
        data=parse_search_index(search_source('f["1"]=new c("A.html","A",0);\ns["_a"]="2:3"'))
        self.assertEqual(data['keywords'][0]['postings'][0]['source_index'],'2')
        self.assertEqual(data['validation_issues'],[{'class':'SEARCH_POSTING_UNKNOWN_FILE_ID','source_index':'2'}])

    def test_search_modes_are_source_literals_not_assumed(self):
        flags=search_mode_flags(parse('<script>Innovasys = {}; Innovasys.overrides = {isFullTextSearchPositionDataAvailable:true,isFullTextSearchObjects:true};</script>'))
        self.assertEqual(flags,{'isFullTextSearchPositionDataAvailable':True,'isFullTextSearchObjects':True})
        self.assertEqual(search_mode_flags(parse('<script>unrelated();</script>')), {})
        with self.assertRaises(ValueError):search_mode_flags(parse('<script>Innovasys.overrides=run();</script>'))

    def test_missing_runtime_cannot_prove_search_semantics(self):
        with tempfile.TemporaryDirectory() as directory:
            evidence=search_runtime_evidence(Store(Path(directory)),[])
            self.assertFalse(evidence['verified'])
            self.assertEqual(evidence['issues'],['SEARCH_RUNTIME_NOT_CAPTURED'])

    def test_optional_li_end_tags_keep_full_sibling_and_container_order(self):
        p = parse('<body><ul id="i-root"><li rel="-1"><a href="#">Group</a><ul>'
                  '<li data-is-new="True"><a href="A.html#x">Same</a>'
                  '<li><a href="A.html#y">Same</a></ul>'
                  '<li><a href="B.html">After</a></ul></body>')
        self.assertFalse(p.errors)
        tree,count = toc_tree(p,'s'*64)
        self.assertEqual(count,4)
        self.assertEqual([x['title'] for x in tree],['Group','After'])
        self.assertTrue(tree[0]['container_only'])
        self.assertEqual([x['bookmark'] for x in tree[0]['children']],['x','y'])
        self.assertEqual(tree[0]['children'][1]['breadcrumbs'],['Group','Same'])
        self.assertEqual(tree[0]['children'][0]['source_flags']['li'],{'data-is-new':'True'})
        self.assertEqual(len(p.optional_end_tags),4)

    def test_malformed_nonoptional_element_and_unclosed_list_are_not_silently_repaired(self):
        p = parse('<body><ul id="i-root"><li><a href="A.html">A<li><a href="B.html">B</a></ul></body>')
        self.assertTrue(p.errors)
        self.assertTrue(parse('<body><ul id="i-root"><li><a href="A.html">A</a></body>').errors)

    def test_index_blockquotes_are_ordered_subentries_not_deduplicated(self):
        p = parse('<div id="i-index-body"><a href="A.html">Class</a><blockquote>'
                  '<a href="A_members.html">Members</a><br><a href="A.html">Overview</a><br>'
                  '</blockquote><a href="B.html">Class</a><br></div>')
        tree,count = index_tree(p,'s'*64)
        self.assertEqual(count,4)
        self.assertEqual([x['title'] for x in tree],['Class','Class'])
        self.assertEqual(tree[0]['children'][1]['breadcrumbs'],['Class','Overview'])
        self.assertEqual(tree[0]['children'][1]['href'],'A.html')
        with self.assertRaisesRegex(ValueError,'ORPHAN'):
            index_tree(parse('<div id="i-index-body"><blockquote><a href="A.html">A</a></blockquote></div>'),'s')

    def test_original_source_flags_and_fragment_urls_are_preserved(self):
        p = parse('<ul id="i-root"><li rel="1" data-is-new="False"><a target="i-content" href="A File.html#A%20B">A</a></li></ul>')
        tree,_=toc_tree(p,'s')
        self.assertEqual(tree[0]['href'],'A File.html#A%20B')
        self.assertEqual(tree[0]['bookmark'],'A%20B')
        self.assertEqual(tree[0]['source_flags']['a']['target'],'i-content')

    def test_shell_frames_and_search_data_classify_before_generic_html_js(self):
        iframe={'tag':'iframe','attrs':{'id':'i-toc'},'node_id':'n1','children':[]}
        script={'tag':'script','attrs':{},'node_id':'n2','children':[]}
        anchor={'tag':'a','attrs':{},'node_id':'n3','children':[]}
        self.assertEqual(reference_kind(iframe,'src','webtoc.html',PUBLICATION+'webnav.html','navigation'),('navigation','toc'))
        self.assertEqual(reference_kind(iframe,'src','publishedOther.html',PUBLICATION+'webnav.html','navigation'),('navigation','toc'))
        self.assertEqual(reference_kind(script,'src','ftsindex.js',PUBLICATION+'websearch.html','search'),('navigation','search_index'))
        self.assertEqual(reference_kind(script,'src','template/navigation.min.js',PUBLICATION,'search'),('script',None))
        self.assertEqual(reference_kind(anchor,'href','Welcome.html',PUBLICATION,'toc'),('article',None))

    def test_responsive_attribute_and_url_container_dependencies_are_explicit(self):
        p=parse('<link href="toc.css" data-responsive-tablet="bootstrap.css, toc.responsive.css" '
                'data-responsive-mobile="toc.responsive.css"><script type="i-url-container/script" '
                'data-responsive-display-modes="tablet,mobile">jquery.mobile.js</script>'
                '<script type="i-url-container/css">jquery.mobile.css</script>')
        rows=list(candidates(p,'toc'))
        self.assertEqual([href for _,_,href in rows],['toc.css','bootstrap.css','toc.responsive.css','toc.responsive.css','jquery.mobile.js','jquery.mobile.css'])
        for n,a,h in rows:
            kind,_=reference_kind(n,a,h,PUBLICATION,'toc')
            self.assertEqual(kind,'script' if h.endswith('.js') else 'stylesheet')

    def test_default_topic_only_accepts_complete_literal_assignment(self):
        p=parse('<script>var defaultTopic="Welcome.html";</script>')
        self.assertEqual([h for _,_,h in default_topics(p)],['Welcome.html'])
        with self.assertRaises(ValueError):
            list(default_topics(parse('<script>var defaultTopic="A.html" + run();</script>')))
        with self.assertRaises(ValueError):
            list(default_topics(parse('<script>var defaultTopic=run();</script>')))

    def test_reconcile_retains_occurrences_and_stays_incomplete_without_search_schema(self):
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory)
            atomic_json(root/'_project/STATE.json',{'modules':{'AIM':{'status':'MODULE_LOCAL_COMPLETE'}}})
            store=Store(root,cache_records=True)
            docs={
                'webframe.html':'<html><body><iframe id="i-nav" src="webnav.html"></iframe><script>var defaultTopic="Welcome.html";</script></body></html>',
                'webnav.html':'<html><body><iframe id="i-toc" src="webtoc.html"></iframe><iframe id="i-index" src="webindex.html"></iframe><iframe id="i-search" src="websearch.html"></iframe></body></html>',
                'webtoc.html':'<html><body><ul id="i-root"><li><a href="#">Group</a><ul><li><a href="A.html#one">Same</a><li><a href="A.html#two">Same</a></ul></ul></body></html>',
                'webindex.html':'<html><body><div id="i-index-body"><a href="A.html">Same</a><br><a href="B.html">Same</a><br></div></body></html>',
                'websearch.html':'<html><head><script src="ftsindex.js"></script></head><body></body></html>'}
            for name,body in docs.items():
                record=store.discover('SDK',name,PUBLICATION,'fixture','navigation')
                store.save_original(record,body.encode(),{'final_url':PUBLICATION+name,'http_status':200,'mime':'text/html'})
            first=reconcile(store)
            self.assertFalse(first['discovery_reconciled'])
            self.assertFalse(first['parse_errors'])
            self.assertEqual(first['membership_counts'],{'toc':1,'index':2,'default_topic':1,'search':0})
            self.assertEqual(first['toc_nodes'],3)
            self.assertTrue(discovery_proof(store)['current'])
            target=next(r for r in store.records('SDK') if r['source_url']==PUBLICATION+'A.html')
            self.assertEqual(len([o for o in target['occurrences'] if o.get('family')=='toc']),2)
            before=json.dumps(store.records('SDK'),sort_keys=True)
            second=reconcile(store)
            self.assertEqual(json.dumps(store.records('SDK'),sort_keys=True),before)
            self.assertTrue(second['fixed_point'])
            self.assertFalse(second['discovery_reconciled'])
            search=next(r for r in store.records('SDK') if r['source_url']==PUBLICATION+'ftsindex.js')
            self.assertEqual((search['type'],search['navigation_role']),('navigation','search_index'))
            fts=search_source('f["1"]=new c("A.html","A",4);\n'
                              'f["2"]=new c("B.html","B",0);\n'
                              'f["3"]=new c("SearchOnly.html","Only in search",1);\n'
                              's["_word"]="1:2|3,3:0"')
            store.save_original(search,fts.encode(),{'final_url':PUBLICATION+'ftsindex.js','http_status':200,'mime':'text/javascript'})
            result=reconcile(store)
            self.assertFalse(result['parse_errors'])
            self.assertEqual(result['membership_counts']['search'],3)
            self.assertTrue(any(r['source_url']==PUBLICATION+'SearchOnly.html' for r in store.records('SDK')))
            saved=json.loads((root/'SDK/data/navigation'/(search['id']+'.json')).read_text())
            self.assertEqual(saved['data']['keywords'][0]['posting_literal'],'1:2|3,3:0')
            self.assertFalse(result['discovery_reconciled'])
            self.assertTrue(any(i['class']=='SEARCH_RUNTIME_UNVERIFIED' for i in result['issues']))


if __name__=='__main__':unittest.main()
