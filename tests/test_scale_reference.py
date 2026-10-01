"""Guard the neutral, source-bound central reference against scope drift."""
import copy
import json
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
from render_scale_reference import REGISTER, MARKDOWN, validate, render_markdown


class ScaleReferenceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.data=json.loads((ROOT/REGISTER).read_text(encoding='utf-8'))

    def test_rendered_reference_has_valid_source_provenance(self):
        validate(self.data)
        self.assertEqual((ROOT/MARKDOWN).read_text(encoding='utf-8'),render_markdown(self.data))

    def test_other_product_source_is_rejected(self):
        data=copy.deepcopy(self.data)
        data['references'][0]['document_id']='sdd-de62bfaf88f5d35b'
        with self.assertRaisesRegex(ValueError,'seven SCALE'):
            validate(data)

    def test_client_named_content_is_rejected(self):
        data=copy.deepcopy(self.data)
        data['claims'][0]['paragraphs'].append('Covetrus configuration is a universal default.')
        with self.assertRaisesRegex(ValueError,'name entered'):
            validate(data)

    def test_citation_cannot_add_unreviewed_nodes(self):
        data=copy.deepcopy(self.data)
        data['claims'][0]['citations'][0]['nodes'].append('unreviewed-node')
        with self.assertRaisesRegex(ValueError,'contributing records'):
            validate(data)


if __name__=='__main__':
    unittest.main()
