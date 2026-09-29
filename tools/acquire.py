"""Acquire an explicit bounded AIM batch through the authorized Edge profile."""
import argparse
import json
import os
from pathlib import Path
import random
import time
from playwright.sync_api import sync_playwright
from collector import Store, writer_lock, now, atomic_json, read_json, SEEDS
from stage_transport import StageTransport, AcquisitionBlocked


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--kind',choices=['navigation','script','article','image','stylesheet','attachment','font','video'],default='navigation')
    parser.add_argument('--ids',nargs='*')
    parser.add_argument('--limit',type=int,default=12)
    parser.add_argument('--convert',action='store_true',help='Generate app JSON and draft reading copies after each original article commit.')
    args=parser.parse_args()
    root=Path(__file__).resolve().parents[1]
    private=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/private'
    runtime=private.parent/'runtime'
    store=Store(root,cache_records=True)
    blocked=[]
    saved=0
    with writer_lock(root,runtime) as owner:
        report=store.verify()
        if report['failures']: raise ValueError('Saved bodies failed integrity verification')
        def conversion_missing(record):
            return args.convert and record['type']=='article' and (not record.get('app_data_path') or
                not (root/record['app_data_path']).is_file() or
                any(not (root/record.get('reading_paths',{}).get(k,'missing')).is_file() for k in ('html','markdown')))
        retryable={'DNS','CONNECTION','TIMEOUT','RATE_LIMIT','TRANSIENT_HTTP','BLOCKED_AUTH','BLOCKED_PERMISSION','BLOCKED_AUTH_OR_SCOPE','CIRCUIT_OPEN','RATE_LIMIT_WAIT','EMPTY_BODY'}
        queue=[r for r in store.records('AIM') if r['type']==args.kind and
               (not (r.get('transport_metadata_verified') and r['status']=='BODY_SAVED') or conversion_missing(r)) and
               (r['status']=='PENDING' or conversion_missing(r) or (r['status']=='FAILED' and r.get('last_failure',{}).get('class') in retryable))]
        if args.ids: queue=[r for r in queue if r['id'] in args.ids]
        if not queue:
            print(json.dumps({'batch_saved':0,'eligible_resources':0,'worker_running':False}),flush=True)
            return 0
        queue.sort(key=lambda r:(r['source_url']!=SEEDS['AIM'],r['discovered_at'],r['source_url']))
        state=read_json(root/'_project/STATE.json')
        if args.kind=='article':
            if state.get('pilot')!='PASSED':
                selection=read_json(root/'_project/pilot-AIM.json')
                queue=[r for r in queue if r['id'] in selection['article_ids']]
                if not queue:
                    raise ValueError('No eligible pilot articles; verify or explicitly revise the pilot selection')
        phase='DISCOVERY_IN_PROGRESS' if args.kind!='article' else ('AIM_CAPTURE_IN_PROGRESS' if state.get('pilot')=='PASSED' else 'PILOT_IN_PROGRESS')
        store.checkpoint(owner,phase=phase,blockers=[],worker_running=True)
        try:
            with sync_playwright() as playwright:
                context=playwright.chromium.launch_persistent_context(str(private/'stage-edge-profile'),channel='msedge',
                    headless=False,chromium_sandbox=True,ignore_https_errors=False,bypass_csp=False)
                transport=StageTransport(context.request,cooldown_path=runtime/'stage-cooldown.json')
                try:
                    for record in queue[:args.limit]:
                        if record.get('transport_metadata_verified') and record['status']=='BODY_SAVED' and conversion_missing(record):
                            from article_data import convert
                            convert(store,record)
                            store.checkpoint(owner,worker_running=True)
                            print(json.dumps({'conversion_recovered':record['id'],'network_request':False}),flush=True)
                            continue
                        for attempt in range(1,4):
                            record['attempts']+=1
                            record['last_attempt_at']=now()
                            store.save_record(record)
                            try:
                                body,metadata=transport.get(record['source_url'])
                                store.save_original(record,body,metadata)
                                if args.convert and record['type']=='article':
                                    from article_data import convert
                                    try:
                                        convert(store,record)
                                        record.pop('conversion_failure',None)
                                        store.save_record(record)
                                    except (ValueError,UnicodeError) as error:
                                        record['conversion_failure']={'class':'PARSE_OR_FIDELITY','detail':str(error),'at':now()}
                                        store.save_record(record)
                                saved+=1
                                print(json.dumps({'saved':record['id'],'type':record['type'],'bytes':len(body),'batch_saved':saved}),flush=True)
                                break
                            except AcquisitionBlocked as error:
                                record.update(status='FAILED',last_failure={'class':error.code,'detail':error.detail,'at':now()})
                                store.save_record(record)
                                print(json.dumps({'resource':record['id'],'failure':error.code,'attempt':attempt}),flush=True)
                                if error.code in ('BLOCKED_AUTH','BLOCKED_PERMISSION','BLOCKED_AUTH_OR_SCOPE','CIRCUIT_OPEN','TLS','RATE_LIMIT_WAIT'):
                                    blocked=[{'code':error.code,'detail':error.detail}]
                                    break
                                if error.code not in ('DNS','CONNECTION','TIMEOUT','RATE_LIMIT','TRANSIENT_HTTP') or attempt==3:
                                    break
                                if transport.next_allowed-transport.clock()>60:
                                    blocked=[{'code':'RATE_LIMIT','detail':'Retry-After exceeds this bounded operation; resume later'}]
                                    break
                                time.sleep((2**(attempt-1))+random.Random(record['id']+str(attempt)).random())
                        store.checkpoint(owner,blockers=blocked,worker_running=True)
                        if blocked: break
                finally:
                    context.close()
        finally:
            state=store.checkpoint(owner,phase=blocked[0]['code'] if blocked else 'DISCOVERY_INCOMPLETE',blockers=blocked,worker_running=False)
            atomic_json(root/'_project/local-integrity.json',store.verify())
        print(json.dumps({'batch_saved':saved,'phase':state['phase'],'blocked':blocked,'worker_running':False}),flush=True)


if __name__=='__main__':main()
