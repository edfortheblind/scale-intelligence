"""Produce source-hashed evidence for unresolved published URLs and anchors."""
import json
import os
from pathlib import Path
from urllib.parse import unquote,urlsplit
from collector import Store,read_json,atomic_json,atomic_bytes,writer_lock,digest,now,ORIGIN
from article_data import parse_article,nodes


def main():
    root=Path(__file__).resolve().parents[1]
    runtime=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'
    with writer_lock(root,runtime) as owner:
        store=Store(root,cache_records=True)
        records={r['id']:r for r in store.records('AIM')}
        missing=[{'id':r['id'],'url':r['source_url'],'type':r['type'],'last_failure':r['last_failure'],
                  'published_occurrences':r['occurrences']} for r in records.values() if r['status']=='FAILED']
        anchor_cache={};broken=[];outside=[]
        for record in records.values():
            if record['type']!='article' or record['status']!='BODY_SAVED':continue
            data=read_json(root/record['app_data_path'])
            for ref in data['references']:
                if ref['classification']=='out_of_scope_reference' and ref.get('resolved_url','').startswith(ORIGIN+'/'):
                    outside.append({'source_id':record['id'],'source_url':record['source_url'],'source_sha256':record['sha256'],
                                    'node_id':ref['node_id'],'literal_href':ref['original_href'],'resolved_url':ref['resolved_url'],'acquired':False})
                if ref['classification'] not in ('same_document','internal') or not ref.get('fragment'):continue
                target=records.get(ref['target_id'])
                if not target or target['type']!='article' or target['status']!='BODY_SAVED':continue
                if target['id'] not in anchor_cache:
                    raw=(root/target['local_path']).read_bytes()
                    if digest(raw)!=target['sha256']:raise ValueError('Original hash mismatch')
                    parser,_,_,_,_=parse_article(target,raw)
                    anchor_cache[target['id']]={n['attrs'][a] for n in nodes(parser.root) for a in ('id','name') if n['attrs'].get(a)}
                if unquote(ref['fragment']) not in anchor_cache[target['id']]:
                    broken.append({'source_id':record['id'],'source_url':record['source_url'],'source_sha256':record['sha256'],
                        'node_id':ref['node_id'],'literal_href':ref['original_href'],'fragment':ref['fragment'],
                        'target_id':target['id'],'target_url':target['source_url'],'target_sha256':target['sha256'],
                        'target_anchor_exists_in_original':False,'target_anchor_invented':False})
        report={'checked_at':now(),'module':'AIM','missing_resources':missing,'broken_anchor_references':broken,
                'same_origin_references_outside_authorized_roots':outside,'complete_corpus':False,
                'required_source_action':'Restore or correct the published resource targets and anchor destinations on Stage. Recollect affected source generations and reconcile; never fabricate replacements.'}
        atomic_json(root/'AIM/reports/source-gaps.json',report)
        lines=['# AIM source gaps','',f'{len(missing)} unavailable resources and {len(broken)} anchor references remain unresolved. Originals and literal links are preserved.','',
               '## Resource requests','', '| Published URL | Result |','| --- | --- |']
        lines.extend('| `'+r['url']+'` | '+r['last_failure']['detail']+' |' for r in missing)
        lines+=['','## Broken anchors','', '| Referring article | Literal href | Target original SHA-256 |','| --- | --- | --- |']
        lines.extend('| `'+r['source_url'].rsplit('/',1)[-1]+'` | `'+r['literal_href']+'` | `'+r['target_sha256']+'` |' for r in broken)
        lines+=['','See `source-gaps.json` for source hashes, node locations, publication occurrences, and scoped references. These findings require source repair or an explicit collection-order exception; neither constitutes corpus completion.','']
        atomic_bytes(root/'AIM/reports/source-gaps.md','\n'.join(lines).encode('utf-8'))
        print(json.dumps({'missing_resources':len(missing),'broken_anchor_references':len(broken),'outside_authorized_roots':len(outside)}))


if __name__=='__main__':main()
