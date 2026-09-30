"""Bind reviewed vendor derivative bytes during deliberate knowledge integration."""
import hashlib
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]


def build_manifest(root=ROOT):
    root=Path(root).resolve()
    raw=(root/'DB Architecture/mappings/help-topics.json').read_bytes()
    knowledge=json.loads(raw)
    records={}
    for source in knowledge['sources'].values():
        if source['kind'] != 'VENDOR_DOCUMENTATION':
            continue
        module, article_id=source['module'],source['article_id']
        if module not in {'AIM','SDK'} or not re.fullmatch(r'[a-zA-Z0-9_-]+',article_id):
            raise ValueError('Unsupported vendor source identity')
        relative=f'{module}/data/articles/{article_id}.json'
        article_raw=(root/relative).read_bytes()
        article=json.loads(article_raw)
        original=(root/source['source_path']).resolve()
        if (not original.is_relative_to(root)
                or hashlib.sha256(original.read_bytes()).hexdigest() != source['source_sha256']
                or article['source']['sha256'] != source['source_sha256']
                or article['source']['local_path'] != source['source_path']):
            raise ValueError('Vendor original/extraction identity mismatch')
        record={'article_sha256':hashlib.sha256(article_raw).hexdigest(),
                'source_path':source['source_path'],'source_sha256':source['source_sha256']}
        if relative in records and records[relative] != record:
            raise ValueError('Vendor source identity collision')
        records[relative]=record
    batches={}
    for path in sorted((root/'DB Architecture/mappings/batches').glob('*.json')):
        batch_raw=path.read_bytes()
        batch=json.loads(batch_raw)
        if batch.get('semantic_contracts'):
            batches[path.relative_to(root).as_posix()]={
                'sha256':hashlib.sha256(batch_raw).hexdigest(),
                'object_ids':sorted(c['object_id'] for c in batch['semantic_contracts'])}
    manifest={'schema_version':2,'knowledge_generation_sha256':hashlib.sha256(raw).hexdigest(),
              'scope':'Exact parsed vendor files and reviewed semantic batches used by help, bound during deliberate integration. '
                      'Startup verifies these fingerprints and never refreshes them automatically.',
              'articles':dict(sorted(records.items())), 'semantic_batches':batches}
    (root/'help_app/vendor-source-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n',encoding='utf-8',newline='\n')
    return manifest


if __name__=='__main__':
    manifest=build_manifest()
    print(json.dumps({'vendor_derivatives_bound':len(manifest['articles'])}))
