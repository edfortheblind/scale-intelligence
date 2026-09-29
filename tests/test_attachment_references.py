import sys
from pathlib import Path
import unittest
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from attachment_references import attachment_references


class AttachmentReferenceTests(unittest.TestCase):
    def record(self, suffix):
        return {'id': 'a'*64, 'sha256': 'b'*64,
                'source_url': 'https://travstg.manhscale.com/SCALEHelp/SDK/old/source' + suffix,
                'final_url': 'https://travstg.manhscale.com/SCALEHelp/SDK/current/source' + suffix}

    def test_xsd_final_url_and_inherited_base_preserve_literal(self):
        raw = b'<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" xml:base="../shared/"><xs:include schemaLocation="A%20B.xsd"/><xs:import schemaLocation="Types.xsd"/><xs:redefine schemaLocation="../base.xsd"/></xs:schema>'
        result = attachment_references(self.record('.xsd'), raw)
        self.assertEqual(len(result['references']), 3)
        self.assertEqual(result['references'][0]['original_href'], 'A%20B.xsd')
        self.assertEqual(result['references'][0]['resolved_url'], 'https://travstg.manhscale.com/SCALEHelp/SDK/shared/A%20B.xsd')
        self.assertEqual(result['references'][2]['resolved_url'], 'https://travstg.manhscale.com/SCALEHelp/SDK/base.xsd')

    def test_only_xsd_namespace_and_schema_location_are_dependencies(self):
        raw = b'<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"><include schemaLocation="ignored.xsd"/><xs:import namespace="https://example.test"/><xs:element name="https://example.test"/></xs:schema>'
        self.assertEqual(attachment_references(self.record('.xsd'), raw)['references'], [])

    def test_json_ref_respects_id_and_pointer_without_field_url_inference(self):
        result = attachment_references(self.record('.JSON'), b'{"$id":"../types/","a/b":{"$ref":"Thing.json#/$defs/A"},"endpoint":"https://example.test"}')
        ref = result['references'][0]
        self.assertEqual(len(result['references']), 1)
        self.assertEqual(ref['locator'], '/a~1b/$ref')
        self.assertEqual(ref['resolved_url'], 'https://travstg.manhscale.com/SCALEHelp/SDK/types/Thing.json#/$defs/A')

    def test_invalid_original_is_diagnostic_not_repaired(self):
        raw = b'{"$ref": "Example.json", "value": }'
        result = attachment_references(self.record('.json'), raw)
        self.assertEqual(result['references'], [])
        self.assertFalse(result['diagnostics'][0]['dependency_inventory_complete'])
        self.assertEqual(raw, b'{"$ref": "Example.json", "value": }')

    def test_doctype_has_no_resolution_or_inferred_reference(self):
        result = attachment_references(self.record('.xsd'), b'<!DOCTYPE schema SYSTEM "https://example.test/dtd"><schema/>')
        self.assertEqual(result['references'], [])
        self.assertEqual(len(result['diagnostics']), 1)


if __name__ == '__main__':
    unittest.main()
