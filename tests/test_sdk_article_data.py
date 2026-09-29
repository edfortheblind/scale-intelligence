"""Synthetic regressions; these fixtures are not evidence of published coverage."""
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
import sdk_article_data as sdk
from collector import Store, SEEDS, atomic_json, digest, source_identity


class SdkArticleDataTests(unittest.TestCase):
    def parse(self, markup):
        return sdk.parse_article({'module':'SDK', 'encoding':'utf-8'}, markup.encode('utf-8'))

    def evidence(self):
        resource = {'id':'runtime', 'type':'script', 'status':'BODY_SAVED',
            'source_url':'https://travstg.manhscale.com/SCALEHelp/SDK/template/packages/core-topics/script/topics.min.js',
            'sha256':sorted(sdk.RENDERER_HASHES)[0]}
        return [{'kind':'script', 'target_id':'runtime'}], {'runtime':resource}

    def test_every_language_panel_and_exact_code_whitespace_survives(self):
        source = ('<html><head><title>Types</title></head><body>'
            '<div class="i-tab-container"><ul><li><a href="#cs">C#</a></li><li><a href="#sql">SQL</a></li></ul>'
            '<div id="cs" class="i-filtered-content-CS"><pre>  public\tclass A\r\n{}</pre></div>'
            '<div id="sql" class="i-filtered-content-SQL" style="display:none"><pre>SELECT\t1;\r\n</pre></div></div>'
            '<p>Original qualification: Windows 7 only.</p><font color="red">Exact</font></body></html>')
        parser, tree, _, _, _ = self.parse(source)
        refs, resources = self.evidence()
        states = sdk.reconcile(tree, refs, resources)
        self.assertFalse(parser.errors)
        self.assertTrue(states['static_relationships_passed'])
        tabs = [e for e in states['control_body_edges'] if e['kind'] == 'language_tab']
        self.assertEqual([e['label'] for e in tabs], ['C#', 'SQL'])
        self.assertEqual(len(sdk.inventory(tree)['variants']), 2)
        markup, errors = sdk.serialize(tree, [], {})
        self.assertFalse(errors)
        self.assertNotIn('display:none', markup)
        self.assertIn('SELECT\t1;\r\n', markup)
        self.assertIn('Original qualification: Windows 7 only.', markup)
        reread = sdk.TreeParser(); reread.feed('<body>'+markup+'</body>'); reread.close()
        body = next(n for n in sdk.nodes(reread.root) if n['tag'] == 'body')
        self.assertEqual(sdk.text_of(tree), sdk.text_of(body))
        for edge in tabs:
            self.assertIn('data-source-node="'+edge['body_node']+'"', markup)

    def test_copy_payload_is_first_td_not_pre_and_records_browser_newlines(self):
        _, tree, _, _, _ = self.parse('<body><table class="i-syntax-table"><tr><th><span class="i-copy-code">Copy Code</span></th></tr>'
            '<tr><td class="i-code">\r\n before <pre>  CODE\t1\r\n</pre> after \r</td><td>Not copied</td></tr></table></body>')
        refs, resources = self.evidence()
        states = sdk.reconcile(tree, refs, resources)
        self.assertTrue(states['static_relationships_passed'])
        copy = next(e for e in states['control_body_edges'] if e['kind'] == 'copy_code')
        self.assertEqual(copy['source_text'], '\r\n before   CODE\t1\r\n after \r')
        self.assertEqual(copy['copy_text'], '\n before   CODE\t1\n after \n')
        self.assertNotIn('Not copied', copy['copy_text'])

    def test_copy_projection_handles_pre_newline_comments_and_character_references(self):
        _, tree, _, _, _ = self.parse('<body><table><tr><th><span class="i-copy-code">Copy Code</span></th></tr>'
            '<tr><td class="i-code">\r\n prefix <pre>\r\nCODE\r\n</pre>'
            '<pre><!-- first token is a comment -->\r\nKEEP\r\n</pre>'
            '<pre>&#10;LF reference</pre><pre>&#13;CR reference</pre>'
            '<pre><span></span>\nAfter tag</pre> literal\rCR and entity&#13;CR</td></tr></table></body>')
        refs, resources = self.evidence()
        edge = next(e for e in sdk.reconcile(tree, refs, resources)['control_body_edges'] if e['kind'] == 'copy_code')
        self.assertEqual(edge['copy_text'], '\n prefix CODE\n\nKEEP\nLF reference\rCR reference\nAfter tag literal\nCR and entity\rCR')
        self.assertIn(' prefix \r\nCODE\r\n', edge['source_text'])
        self.assertIn('entity\rCR', edge['source_text'])
        self.assertTrue(any(n.get('browser_text_overrides') for n in sdk.nodes(tree)))

    def test_conditional_comment_documentary_content_requires_explicit_review(self):
        _, tree, excluded, _, _ = self.parse('<body>Static<!--[if IE]><p>Conditional document</p><![endif]--></body>')
        self.assertEqual(sdk.text_of(tree), 'Static')
        self.assertEqual(excluded[0]['reason'], 'unclassified_conditional_comment')
        self.assertIn('Conditional document', excluded[0]['comment'])

    def test_section_maps_runtime_next_sibling_and_not_similar_id(self):
        _, tree, _, _, _ = self.parse('<body><div class="i-section-heading" id="x-section-heading">Open</div>'
            '<div id="actual" class="i-section-content">Right</div><div id="x-section-content">Decoy</div></body>')
        refs, resources = self.evidence()
        states = sdk.reconcile(tree, refs, resources)
        self.assertTrue(states['static_relationships_passed'])
        body = next(n for n in sdk.nodes(tree) if n['attrs'].get('id') == 'actual')
        self.assertEqual(states['control_body_edges'][0]['body_node'], body['node_id'])

    def test_ambiguous_tab_hidden_orphan_and_unknown_renderer_fail(self):
        _, tree, _, _, _ = self.parse('<body><div class="i-tab-container"><ul><li><a href="#same">C#</a></li></ul>'
            '<div id="same">A</div><div id="same">B</div></div><div style="display:none">Orphan</div>'
            '<div class="i-section-heading">Heading</div><div class="i-section-content">Body</div></body>')
        states = sdk.reconcile(tree, [], {})
        kinds = {i['class'] for i in states['issues']}
        self.assertFalse(states['static_relationships_passed'])
        self.assertTrue({'MISSING_OR_AMBIGUOUS_TAB_BODY', 'UNMAPPED_DOCUMENTARY_STATE', 'UNVERIFIED_SDK_RENDERER_SEMANTICS'}.issubset(kinds))

    def test_runtime_and_unknown_embedded_data_are_retained_but_never_executed(self):
        _, tree, excluded, _, _ = self.parse('<body><p onclick="bad()">Keep</p><script>bad()</script>'
            '<script type="application/json">{"unobserved":"content"}</script><style>p{color:red}</style></body>')
        markup, _ = sdk.serialize(tree, [], {})
        self.assertNotIn('script', markup)
        self.assertNotIn('onclick', markup)
        self.assertEqual(len(excluded), 3)
        self.assertEqual(excluded[1]['reason'], 'unclassified_script_data')
        self.assertEqual(sdk.text_of(excluded[1]['node']), '{"unobserved":"content"}')

    def test_unknown_inputs_remain_an_explicit_fidelity_hold(self):
        _, tree, _, _, _ = self.parse('<body><label for="x">X</label><input id="x" value="original"></body>')
        markup, errors = sdk.serialize(tree, [], {})
        self.assertIn('value="original"', markup)
        self.assertIn('disabled="disabled"', markup)
        self.assertEqual(errors[0]['class'], 'UNSUPPORTED_INPUT_STATE')

    def test_head_data_scripts_remain_explicitly_unclassified(self):
        _, _, excluded, _, _ = self.parse('<html><head><script type="application/json">{"body":"dynamic"}</script></head><body>Static</body></html>')
        self.assertEqual(len(excluded), 1)
        self.assertEqual(excluded[0]['reason'], 'unclassified_script_data')

    def test_literal_extensionless_topic_and_responsive_resources_are_discovered(self):
        with tempfile.TemporaryDirectory() as folder, patch('module_policy.acceptance_readiness', return_value={'ready':True}):
            store = Store(folder, cache_records=True)
            record = store.discover('SDK', 'Page.html', SEEDS['SDK'], 'fixture', 'article')
            record['sha256'] = 'a'*64
            parser, *_ = self.parse('<html><head><link href="base.css" data-responsive-tablet="tablet.css, common.css">'
                '<script type="i-url-container/script">support.js</script></head><body>'
                '<a href="ca337a34-1de3-4705-b39f-a5c492326551" data-auto-update-caption="true">Topic</a></body></html>')
            refs = sdk.discover_references(store, record, parser)
            topics = [r for r in refs if r.get('kind') == 'article']
            self.assertEqual(len(topics), 1)
            self.assertTrue(topics[0]['resolved_url'].endswith('/ca337a34-1de3-4705-b39f-a5c492326551'))
            self.assertEqual(topics[0]['classification'], 'internal')
            self.assertEqual({r['original_href'] for r in refs}, {'base.css', 'tablet.css', 'common.css', 'support.js', 'ca337a34-1de3-4705-b39f-a5c492326551'})

    def test_conversion_never_claims_completion_and_is_idempotent(self):
        with tempfile.TemporaryDirectory() as folder, patch('module_policy.acceptance_readiness', return_value={'ready':True}):
            store = Store(folder, cache_records=True)
            record = store.discover('SDK', 'Fixture.html', SEEDS['SDK'], 'fixture', 'article')
            body = b'<html><head><title>Fixture</title></head><body><p>Literal body</p><img src="missing.png"><script type="application/json">{"content":1}</script></body></html>'
            store.save_original(record, body, {'final_url':record['source_url'], 'http_status':200, 'mime':'text/html', 'encoding':'utf-8', 'redirect_chain':[]})
            first = sdk.convert(store, record)
            artifact = (store.root/record['app_data_path']).read_bytes()
            html_body = (store.root/record['reading_paths']['html']).read_bytes()
            self.assertEqual(sdk.convert(store, record), first)
            self.assertEqual((store.root/record['app_data_path']).read_bytes(), artifact)
            self.assertEqual((store.root/record['reading_paths']['html']).read_bytes(), html_body)
            self.assertEqual((store.root/record['local_path']).read_bytes(), body)
            self.assertFalse(first['checks']['direct_assets_available'])
            self.assertFalse(first['checks']['classified_embedded_source'])
            self.assertFalse(record['reading_copy_verified'])
            self.assertFalse(record['article_local_complete'])
            data = json.loads(artifact)
            self.assertFalse(data['verification']['reading_copy_verified'])
            self.assertIn(b"script-src 'none'", html_body)
            (store.root/record['local_path']).write_bytes(body+b' changed')
            with self.assertRaisesRegex(ValueError, 'SOURCE_HASH_MISMATCH'):
                sdk.convert(store, record)


class ScopedIntegrityTests(unittest.TestCase):
    def test_sdk_scope_does_not_read_aim_original_and_default_still_checks_both(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            store = Store(root)
            for module, payload in [('AIM', b'aim original'), ('SDK', b'sdk original')]:
                path = root/module/'source'/'original.bin'
                path.parent.mkdir(parents=True)
                path.write_bytes(payload)
                store.save_record({'id':module, 'module':module, 'status':'BODY_SAVED',
                    'local_path':path.relative_to(root).as_posix(), 'sha256':digest(payload), 'byte_count':len(payload)})
            (root/'AIM/source/original.bin').write_bytes(b'tampered AIM')
            actual_read = Path.read_bytes
            visited = []
            def track(path):
                visited.append(path.resolve())
                return actual_read(path)
            with patch.object(Path, 'read_bytes', track):
                result = store.verify(module='SDK')
            self.assertEqual(result['scope'], 'SDK')
            self.assertEqual(result['stored_bodies_verified'], 1)
            self.assertTrue(result['local_integrity_passed'])
            self.assertEqual(visited, [(root/'SDK/source/original.bin').resolve()])
            final = store.verify()
            self.assertEqual(final['scope'], 'ALL_MODULES')
            self.assertFalse(final['local_integrity_passed'])
            self.assertEqual(final['failures'], [{'id':'AIM', 'error':'HASH_OR_LENGTH_MISMATCH'}])
            with self.assertRaisesRegex(ValueError, 'Unknown module'):
                store.verify(module='unknown')


if __name__ == '__main__':
    unittest.main()
