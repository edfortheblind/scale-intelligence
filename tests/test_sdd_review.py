"""Cross-artifact checks for the bounded SDD review overlays."""
import hashlib
import json
import unittest
from pathlib import Path
from tools.sdd_lifecycle import retired_document_map

ROOT = Path(__file__).resolve().parents[1] / 'SDD' / 'derived'


class SddReviewTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.docs = {p.stem: json.loads(p.read_text(encoding='utf-8')) for p in (ROOT / 'documents').glob('*.json')}
        cls.active_document_ids = set(cls.docs)
        cls.retired = retired_document_map(ROOT.parent.parent)
        for identity, frozen in cls.retired.items():
            if identity in cls.docs:
                raise ValueError('Retired SDD body remains in active review discovery')
            cls.docs[identity] = dict(frozen['document_metadata'], nodes=frozen['node_metadata'], assets=frozen['assets'])
        cls.review = json.loads((ROOT / 'reviewed-knowledge.json').read_text(encoding='utf-8'))
        cls.tables = json.loads((ROOT / 'reviewed-tables.json').read_text(encoding='utf-8'))
        cls.coverage = json.loads((ROOT / 'review-coverage.json').read_text(encoding='utf-8'))

    def test_retired_review_rows_are_frozen_historical_identities(self):
        self.assertEqual(len(self.active_document_ids), 7)
        self.assertEqual(set(self.retired), {'sdd-de62bfaf88f5d35b'})
        def fingerprint(value):
            return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(',', ':')).encode()).hexdigest()
        for identity, frozen in self.retired.items():
            expected = {(b['collection'], b['index']): b['sha256'] for b in frozen['review_record_bindings']}
            actual = {(collection, i): fingerprint(record)
                      for collection in ('products', 'claims', 'configuration', 'diagrams')
                      for i, record in enumerate(self.review[collection])
                      if any(c['document_id'] == identity for c in record['citations'])}
            self.assertEqual(actual, expected)
            coverage = next(row for row in self.coverage['documents'] if row['document_id'] == identity)
            self.assertEqual(fingerprint(coverage), frozen['coverage_record_sha256'])

    def test_citation_union_matches_document_denominators(self):
        records = sum((self.review[k] for k in ('products', 'claims', 'configuration', 'diagrams')), []) + self.tables['tables']
        self.assertEqual(set(self.docs), {c['document_id'] for c in self.coverage['documents']})
        for c in self.coverage['documents']:
            sid = c['document_id']
            d = self.docs[sid]
            ids = {n['id'] for n in d['nodes']}
            cited = {n for r in records for ref in r['citations'] if ref['document_id'] == sid for n in ref['nodes']}
            self.assertTrue(cited <= ids)
            self.assertEqual(c['source_sha256'], d['source_sha256'])
            self.assertEqual(c['cited_reviewed_node_ids'], sorted(cited))
            self.assertEqual(c['cited_reviewed_node_count'] + c['nodes_not_cited_by_review_count'], len(ids))
            self.assertEqual(c['extracted_node_count'], len(ids))
            unique_assets = {a['path'] for a in d['assets']}
            described = set(c['described_asset_paths'])
            self.assertTrue(described <= unique_assets)
            self.assertEqual(c['unique_extracted_asset_count'], len(unique_assets))
            self.assertEqual(c['described_asset_count'] + c['assets_without_authored_description_count'], len(unique_assets))
            if d.get('page_count'):
                pages = c['visually_inspected_pdf_pages']
                self.assertEqual(pages, sorted(set(pages)))
                self.assertTrue(all(1 <= p <= d['page_count'] for p in pages))
                self.assertEqual(len(pages) + c['pdf_pages_not_visually_inspected_count'], d['page_count'])

    def test_every_pdf_candidate_has_one_disposition(self):
        for c in self.tables['coverage']:
            source = self.docs[c['document_id']]
            candidates = {n['id'] for n in source['nodes'] if '-t' in n['id'] and 'rows' in n}
            reviewed, rejected, pending = (set(c[k]) for k in ('candidates_supporting_reviewed_tables', 'rejected_candidates', 'unreviewed_candidate_ids'))
            self.assertFalse(reviewed & rejected or reviewed & pending or rejected & pending)
            self.assertEqual(reviewed | rejected | pending, candidates)
            self.assertEqual(c['candidate_count'], len(candidates))
            supporting = {n for t in self.tables['tables'] for ref in t['citations'] if ref['document_id'] == c['document_id'] for n in ref['nodes']}
            # Raster tables use a page text anchor plus a separately hash-bound
            # image; their existence does not enlarge the heuristic candidates.
            self.assertEqual(reviewed, supporting & candidates)
        for t in self.tables['tables']:
            self.assertTrue(t['rows'])
            self.assertTrue(all(len(row) == len(t['columns']) for row in t['rows']))
            for ref in t['citations']:
                self.assertEqual(ref['source_sha256'], self.docs[ref['document_id']]['source_sha256'])
                coverage = next(c for c in self.coverage['documents'] if c['document_id'] == ref['document_id'])
                self.assertTrue(set(t['source_pages']) <= set(coverage['visually_inspected_pdf_pages']))

    def test_raster_table_sources_bind_retained_image_bytes_and_page(self):
        raster_tables = [t for t in self.tables['tables'] if t.get('source_assets')]
        self.assertEqual({t['id'] for t in raster_tables}, {
            'grupo-p008-raster-criteria', 'grupo-p008-raster-storage', 'grupo-p008-raster-lines'})
        for table in raster_tables:
            documents = [self.docs[ref['document_id']] for ref in table['citations']]
            for asset in table['source_assets']:
                retained = [a for d in documents for a in d['assets'] if a['path'] == asset['path']]
                self.assertTrue(retained)
                self.assertTrue(any(asset['page'] in a.get('pages', []) for a in retained))
                self.assertIn(asset['page'], table['source_pages'])
                self.assertEqual(hashlib.sha256((ROOT / asset['path']).read_bytes()).hexdigest(), asset['sha256'])

    def test_raster_capacity_source_disagreement_is_preserved(self):
        tables = {t['id']: t for t in self.tables['tables']}
        line_table = tables['grupo-p008-raster-lines']
        storage = tables['grupo-p008-raster-storage']
        self.assertEqual(len(line_table['rows']), 24)
        self.assertEqual(sum(int(r[1]) for r in line_table['rows']), 14163)
        self.assertEqual(next(r[4] for r in storage['rows'] if r[1] == 'Empaque II'), '14,168')
        self.assertIn('five-garment discrepancy', line_table['normalization'])

    def test_blank_cells_and_split_page_continuations_are_preserved(self):
        tables = {t['id']: t for t in self.tables['tables']}
        disposition = tables['grupo-p036-t001']
        self.assertEqual(next(row for row in disposition['rows'] if row[0] == 'Cuarentena'), ['Cuarentena', ''])
        knipper = tables['knipper-standard-wave']
        self.assertEqual(len(knipper['rows']), 19)
        self.assertEqual(knipper['rows'][0], ['10', 'Start Wave'])
        self.assertEqual(knipper['rows'][-1], ['1000', 'Complete Wave'])
        online = tables['grupo-wave-online']
        self.assertEqual(online['source_pages'], [57, 58])
        self.assertIn(['117', 'Set Alloc Zone on Work Online'], online['rows'])
        self.assertEqual(online['rows'][-1], ['140', 'Complete Wave'])

    def test_review_never_promotes_deployment_or_mawm_equivalence(self):
        for overlay in (self.review, self.tables, self.coverage):
            self.assertFalse(overlay['production_index_eligible'])
        for record in self.review['configuration']:
            self.assertEqual(record['deployment_state'], 'NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT')
            if any(c['document_id'] == 'sdd-de62bfaf88f5d35b' for c in record['citations']):
                self.assertIn('MAWM', record['scope'])
                self.assertIn('excluded from SCALE', record['scope'])
        self.assertTrue(any('most-available-first' in c['statement'] and 'First In, First Out' in c['statement'] for c in self.review['claims']))


if __name__ == '__main__':
    unittest.main()
