"""Synthetic boundary cases for source-backed SDK formats; not coverage evidence."""
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
import sdk_article_data as sdk


class MemberFilterTests(unittest.TestCase):
    def parse(self, source):
        return sdk.parse_article({'module':'SDK','encoding':'utf-8'}, source.encode('utf-8'))

    def evidence(self, sha=None):
        return ([{'kind':'script','target_id':'renderer'}],
                {'renderer':{'id':'renderer','status':'BODY_SAVED','type':'script',
                 'source_url':'https://travstg.manhscale.com/SCALEHelp/SDK/template/packages/core-dotnet/script/dx.net.min.js',
                 'sha256':sha or sdk.MEMBER_FILTER_HASH}})

    def test_member_filters_retain_all_rows_and_explicit_control_membership(self):
        source=('<body><label class="i-members-all">Members Options: Show All</label>'
            '<label class="i-members-filtered" style="display:none">Members Options: Filtered</label>'
            '<div id="i-member-filter-checkboxes" class="i-popup-content">'
            '<input id="i-inherited-checkbox" type="checkbox" class="i-toggle-filter-checkbox" '
            'checked="false" data-toggleclass="i-inherited-member">'
            '<input id="i-protected-checkbox" type="checkbox" class="i-toggle-filter-checkbox" '
            'checked="true" data-toggleclass="ProtectedMember"></div>'
            '<table><tr class="i-inherited-member"><td>Inherited public</td></tr></table>'
            '<div class="ProtectedMember"><table><tr class="i-inherited-member">'
            '<td>Inherited protected</td></tr></table></div></body>')
        parser,content,_,_,_=self.parse(source)
        self.assertFalse(parser.errors)
        refs,resources=self.evidence()
        state=sdk.reconcile(content,refs,resources)
        self.assertTrue(state['static_relationships_passed'])
        self.assertEqual([len(c['target_nodes']) for c in state['filter_controls']],[2,1])
        # HTML Boolean attributes depend on presence, not a spelling of "false".
        self.assertTrue(state['filter_controls'][0]['source_checked_attribute_present'])
        self.assertEqual([e['kind'] for e in state['control_body_edges']],['member_filter']*3)
        self.assertEqual(len(sdk.inventory(content)['variants']),3)
        markup,errors=sdk.serialize(content,[],{})
        self.assertFalse(errors)
        self.assertEqual(markup.count('disabled="disabled"'),2)
        self.assertIn('checked="false"',markup)
        self.assertIn('Members Options: Filtered',markup)
        reading=sdk.TreeParser();reading.feed('<body>'+markup+'</body>');reading.close()
        self.assertEqual(sdk.text_of(content),sdk.text_of(reading.root))
        self.assertEqual(len(sdk.inventory(content)['tables']),len(sdk.inventory(reading.root)['tables']))

    def test_member_checkbox_with_no_matching_members_is_recorded_without_invention(self):
        _,content,_,_,_=self.parse('<body><input id="i-protected-checkbox" type="checkbox" '
            'class="i-toggle-filter-checkbox" checked data-toggleclass="ProtectedMember"></body>')
        refs,resources=self.evidence()
        state=sdk.reconcile(content,refs,resources)
        self.assertTrue(state['static_relationships_passed'])
        self.assertEqual(state['filter_controls'][0]['target_nodes'],[])
        self.assertEqual(state['control_body_edges'],[])

    def test_member_filters_require_exact_member_renderer_not_generic_topics(self):
        _,content,_,_,_=self.parse('<body><input id="i-inherited-checkbox" type="checkbox" '
            'class="i-toggle-filter-checkbox" data-toggleclass="i-inherited-member"></body>')
        other=next(h for h in sdk.RENDERER_HASHES if h!=sdk.MEMBER_FILTER_HASH)
        refs,resources=self.evidence(other)
        issues=sdk.reconcile(content,refs,resources)['issues']
        self.assertTrue(any(i['class']=='UNVERIFIED_MEMBER_FILTER_SEMANTICS' for i in issues))

    def test_unknown_or_changed_filter_control_remains_unsupported(self):
        for attributes in ('id="other" type="checkbox" data-toggleclass="i-inherited-member"',
                           'id="i-inherited-checkbox" type="text" data-toggleclass="i-inherited-member"',
                           'id="i-inherited-checkbox" type="checkbox" data-toggleclass="other"'):
            with self.subTest(attributes=attributes):
                _,content,_,_,_=self.parse('<body><input class="i-toggle-filter-checkbox" '+attributes+'></body>')
                refs,resources=self.evidence()
                self.assertTrue(any(i['class']=='UNSUPPORTED_MEMBER_FILTER_CONTROL'
                                    for i in sdk.reconcile(content,refs,resources)['issues']))
                self.assertTrue(any(i['class']=='UNSUPPORTED_INPUT_STATE'
                                    for i in sdk.serialize(content,[],{})[1]))

    def test_widget_property_static_wrapper_preserves_tag_attributes_and_children(self):
        _,content,_,_,_=self.parse('<body><innovasys:widgetproperty layout="block" name="Content">'
            '\r\n<table><tr><td>Exact &amp; content</td></tr></table>\r\n'
            '</innovasys:widgetproperty></body>')
        markup,errors=sdk.serialize(content,[],{})
        self.assertFalse(errors)
        self.assertIn('<innovasys:widgetproperty layout="block" name="Content"',markup)
        self.assertIn('\r\n<table',markup)
        reading=sdk.TreeParser();reading.feed('<body>'+markup+'</body>');reading.close()
        self.assertFalse(reading.errors)
        self.assertEqual(sdk.text_of(content),sdk.text_of(reading.root))

    def test_unknown_widget_property_is_not_silently_classified(self):
        _,content,_,_,_=self.parse('<body><innovasys:widgetproperty layout="inline" name="Other">'
                                  'Unknown</innovasys:widgetproperty></body>')
        self.assertEqual(sdk.serialize(content,[],{})[1][0]['class'],'UNSUPPORTED_WIDGET_PROPERTY')

    def test_exact_empty_inline_section_marker_is_preserved(self):
        _,content,_,_,_=self.parse('<body><innovasys:widgetproperty layout="inline" name="SectionId">'
                                  '</innovasys:widgetproperty></body>')
        markup,errors=sdk.serialize(content,[],{})
        self.assertFalse(errors)
        self.assertIn('<innovasys:widgetproperty layout="inline" name="SectionId"',markup)
        self.assertIn('</innovasys:widgetproperty>',markup)
        _,content,_,_,_=self.parse('<body><innovasys:widgetproperty layout="inline" name="SectionId">'
                                  'Not an empty marker</innovasys:widgetproperty></body>')
        self.assertEqual(sdk.serialize(content,[],{})[1][0]['class'],'UNSUPPORTED_WIDGET_PROPERTY')

    def test_unmatched_strong_and_unrelated_hidden_content_still_require_review(self):
        parser,content,_,_,_=self.parse('<body><table><tr class="i-inherited-member"><td>'
            '(Inherited from <a>object</a></strong>)</td></tr></table>'
            '<div style="display:none">Unknown hidden content</div></body>')
        self.assertEqual(parser.errors,[{'class':'UNMATCHED_CLOSE','tag':'strong'}])
        refs,resources=self.evidence()
        issues=sdk.reconcile(content,refs,resources)['issues']
        self.assertTrue(any(i['class']=='UNMAPPED_DOCUMENTARY_STATE' for i in issues))

    def test_source_no_op_heading_keeps_unrelated_content_and_no_invented_body(self):
        _,content,_,_,_=self.parse('<body><div class="i-section-heading">Step 4</div>\r\n'
            '<ol><li>Exact following content</li></ol></body>')
        refs,resources=self.evidence()
        states=sdk.reconcile(content,refs,resources)
        self.assertTrue(states['static_relationships_passed'])
        self.assertFalse(states['control_body_edges'])
        self.assertEqual(states['no_op_controls'][0]['required_next_sibling_class'],'i-section-content')
        self.assertEqual(states['no_op_controls'][0]['class'],'SOURCE_CONTROL_WITHOUT_MATCHING_BODY')
        markup,errors=sdk.serialize(content,[],{})
        self.assertFalse(errors)
        self.assertIn('Exact following content',markup)
        reading=sdk.TreeParser();reading.feed('<body>'+markup+'</body>');reading.close()
        self.assertEqual(sdk.text_of(content),sdk.text_of(reading.root))
        # Without the inspected source renderer this relationship is unknown.
        unsupported=sdk.reconcile(content,[],{})
        self.assertFalse(unsupported['static_relationships_passed'])
        self.assertFalse(unsupported['no_op_controls'])
        self.assertEqual(unsupported['issues'][0]['class'],'MISSING_SIBLING_STATE_BODY')

    def test_no_op_control_does_not_hide_an_unrelated_hidden_body(self):
        _,content,_,_,_=self.parse('<body><div class="i-section-heading">Step</div>'
                                  '<ol style="display:none"><li>Unmapped hidden state</li></ol></body>')
        refs,resources=self.evidence()
        states=sdk.reconcile(content,refs,resources)
        self.assertFalse(states['static_relationships_passed'])
        self.assertEqual(len(states['no_op_controls']),1)
        self.assertTrue(any(i['class']=='UNMAPPED_DOCUMENTARY_STATE' for i in states['issues']))

    def test_source_diagnostics_classification_never_accepts_or_suppresses_errors(self):
        errors=[{'class':'UNMATCHED_CLOSE','tag':'strong'}]*2
        classified=sdk.source_parse_diagnostics(errors)
        self.assertEqual(classified['original_diagnostics'],errors)
        self.assertEqual(classified['native_equivalence_candidates'],errors)
        self.assertTrue(classified['native_equivalence_required'])
        self.assertFalse(classified['native_equivalence_verified'])
        self.assertFalse(classified['blocking_diagnostics'])
        errors.append({'class':'UNMATCHED_CLOSE','tag':'b'})
        mixed=sdk.source_parse_diagnostics(errors)
        self.assertEqual(mixed['classification'],'unsupported_source_structure')
        self.assertEqual(mixed['blocking_diagnostics'],[{'class':'UNMATCHED_CLOSE','tag':'b'}])
        self.assertEqual(len(classified['original_diagnostics']),2)
        self.assertEqual(sdk.source_parse_diagnostics([])['classification'],'no_source_parse_diagnostics')

    def test_exact_empty_nosearch_xml_remains_publication_metadata(self):
        parser,content,_,_,_=self.parse('<body>Before<xml><MSHelp:NoSearch/></xml>After</body>')
        self.assertFalse(parser.errors)
        metadata=sdk.publication_metadata(parser,content)
        self.assertEqual(len(metadata),1)
        self.assertEqual(metadata[0]['source_self_closing_token'],'<MSHelp:NoSearch/>')
        markup,errors=sdk.serialize(content,[],{})
        self.assertFalse(errors)
        self.assertIn('<xml',markup)
        self.assertIn('<mshelp:nosearch',markup)
        self.assertIn('</mshelp:nosearch></xml>',markup)
        reading=sdk.TreeParser();reading.feed('<body>'+markup+'</body>');reading.close()
        self.assertEqual(sdk.text_of(content),sdk.text_of(reading.root))

    def test_nonempty_or_changed_xml_is_not_accepted_as_nosearch_metadata(self):
        for source in ('<xml><MSHelp:NoSearch/>Extra</xml>',
                       '<xml class="changed"><MSHelp:NoSearch/></xml>',
                       '<xml><MSHelp:NoSearch value="changed"/></xml>',
                       '<xml><MSHelp:NoSearch>Content</MSHelp:NoSearch></xml>',
                       '<MSHelp:NoSearch/>'):
            with self.subTest(source=source):
                parser,content,_,_,_=self.parse('<body>'+source+'</body>')
                self.assertFalse(sdk.publication_metadata(parser,content))
                self.assertTrue(any(e['class']=='UNSUPPORTED_PUBLICATION_METADATA' for e in sdk.serialize(content,[],{})[1]))

    def test_fallback_role_requires_reviewed_exact_source_hash(self):
        parser,content,_,_,_=self.parse('<body><h1>Topic Not Found</h1><xml><MSHelp:NoSearch/></xml></body>')
        self.assertEqual(sdk.source_context({'source_url':'_topic_not_found.html','sha256':'unknown'},parser,content)['document_role'],'documentary_topic')


if __name__=='__main__':unittest.main()
