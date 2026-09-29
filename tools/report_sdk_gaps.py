"""Report exact SDK source failures without waiving or replacing their content."""
import json
import os
from pathlib import Path
from collector import Store,atomic_json,atomic_bytes,read_json,writer_lock,now,digest


def build(store):
    missing=[{'id':r['id'],'url':r['source_url'],'type':r['type'],
              'last_failure':r.get('last_failure'),'published_occurrences':r['occurrences']}
             for r in store.records('SDK') if r['status']=='FAILED']
    live=store.root/'SDK/reports/live-pilot-source.json'
    report={'checked_at':now(),'module':'SDK','missing_resources':missing,'complete_corpus':False,
        'owner_exception':None,'deprecation':'Not established by source evidence.',
        'live_pilot_evidence':{'path':'SDK/reports/live-pilot-source.json','sha256':digest(live.read_bytes())} if live.exists() else None,
        'scope':'Currently observed failed published URLs only. Unacquired articles may expose additional resources. AIM acceptance does not waive SDK gaps.'}
    atomic_json(store.root/'SDK/reports/source-gaps.json',report)
    lines=['# SDK source gaps','',str(len(missing))+' published resource URLs currently fail. Original references and failure records remain intact. These failures have not been waived.','',
        '| Published resource | Type | Result |','| --- | --- | --- |']
    lines.extend('| `'+r['url']+'` | '+r['type']+' | '+r['last_failure']['detail']+' |' for r in missing)
    lines+=['','See source-gaps.json for resource IDs, exact source occurrences and source-body hashes. The normal Stage browser confirms ten missing content images in WarehouseMobileExtensibility.html; the API responses for the first seven pilot article bodies match their archived source hashes.','',
        'SDK completion remains unverified. Missing source images cannot be reconstructed from descriptions or replaced with generated content. Published source repair or an explicit owner disposition is required for these exceptions.','']
    atomic_bytes(store.root/'SDK/reports/source-gaps.md','\n'.join(lines).encode())
    return report


if __name__=='__main__':
    root=Path(__file__).resolve().parents[1]
    with writer_lock(root,Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'):
        report=build(Store(root))
        print(json.dumps({'missing_resources':len(report['missing_resources']),'report':'SDK/reports/source-gaps.md'}))
