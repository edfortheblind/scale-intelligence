"""Report actual SDK publisher failures without inventing replacements."""
import json,os
from collections import Counter
from pathlib import Path
from collector import Store,atomic_json,atomic_bytes,writer_lock,now,digest


def report(root):
    store=Store(root,cache_records=True)
    catalog={r['id']:r for r in store.records('SDK')}
    missing=[]
    for record in sorted(catalog.values(),key=lambda r:r['source_url']):
        if record['status']!='FAILED':continue
        parents=[]
        for occurrence in record.get('occurrences',[]):
            marker=occurrence.get('discovery_source','').split('@',1)[0]
            parent=catalog.get(marker)
            if parent and parent.get('local_path'):
                raw=(root/parent['local_path']).read_bytes()
                if digest(raw)!=parent['sha256']:raise ValueError('Publisher evidence hash mismatch')
                proof={'id':marker,'url':parent['source_url'],'sha256':parent['sha256'],'path':parent['local_path']}
                if proof not in parents:parents.append(proof)
        missing.append({'id':record['id'],'url':record['source_url'],'type':record['type'],
            'last_failure':record['last_failure'],'failure_history':record.get('failure_history',[]),
            'published_occurrences':record.get('occurrences',[]),'published_parents':parents})
    result={'checked_at':now(),'module':'SDK','missing_resources':missing,
            'failure_counts':dict(Counter(r['last_failure']['class'] for r in missing)),
            'complete_corpus':False,'completion_exception_granted':False,
            'acquisition_authority':'_project/sdk-pilot-disposition.json',
            'source_repair_required':'Restore the exact published resources or publish authoritative corrected references. Missing originals are not manufactured or silently replaced.'}
    atomic_json(root/'SDK/reports/source-gaps.json',result)
    lines=['# SDK source gaps','',f'{len(missing)} published resources remain unavailable. Acquisition continuation is authorized; SDK completion remains ungranted.','',
           'Open the Stage dashboard and complete normal sign-in. Then open each exact URL below in the same browser session. A repaired URL should return its expected documentation or resource body. Record the status and test time; credentials remain in the browser.','',
           '| Exact published URL | Type | Last observed response |','| --- | --- | --- |']
    lines += ['| ['+r['url'].rsplit('/',1)[-1]+']('+r['url']+') | '+r['type']+' | '+r['last_failure']['detail']+' |' for r in missing]
    lines += ['','The JSON companion preserves source occurrences, hashes, parent URLs, attempt history and timestamps. No source-deprecation or URL-alias conclusion is asserted.','']
    atomic_bytes(root/'SDK/reports/source-gaps.md','\n'.join(lines).encode('utf-8'))
    print(json.dumps({'missing_resources':len(missing),'failure_counts':result['failure_counts']}))


if __name__=='__main__':
    root=Path(__file__).resolve().parents[1]
    with writer_lock(root,Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'):
        report(root)
