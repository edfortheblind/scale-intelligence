"""Recheck only previously observed failed AIM URLs through the authorized Edge session."""
import json
import os
from pathlib import Path
from playwright.sync_api import sync_playwright
from collector import Store, SEEDS, read_json, atomic_json, writer_lock, digest, now
from stage_transport import StageTransport, AcquisitionBlocked


def main():
    root=Path(__file__).resolve().parents[1]
    private=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/private'
    runtime=private.parent/'runtime'
    with writer_lock(root,runtime) as owner:
        store=Store(root,cache_records=True)
        integrity=store.verify()
        if integrity['failures']:raise ValueError('Saved originals failed integrity checks')
        selected=[r for r in store.records('AIM') if r['status']=='FAILED' and r.get('last_failure',{}).get('class') in ('NOT_FOUND','HTTP_ERROR')]
        report={'started_at':now(),'module':'AIM','method':'One GET per previously observed failed URL; no guessed paths.','results':[]}
        blockers=[]
        store.checkpoint(owner,phase='AIM_SOURCE_RECHECK_IN_PROGRESS',worker_running=True)
        try:
            with sync_playwright() as p:
                context=p.chromium.launch_persistent_context(str(private/'stage-edge-profile'),channel='msedge',headless=False,
                    chromium_sandbox=True,ignore_https_errors=False,bypass_csp=False)
                try:
                    transport=StageTransport(context.request,cooldown_path=runtime/'stage-cooldown.json')
                    body,metadata=transport.get(SEEDS['AIM'])
                    seed=next(r for r in store.records('AIM') if r['source_url']==SEEDS['AIM'])
                    report['authenticated_control']={'url':SEEDS['AIM'],'status':200,'sha256':digest(body),'matches_saved_original':digest(body)==seed['sha256']}
                    if digest(body)!=seed['sha256']:
                        raise AcquisitionBlocked('SOURCE_CHANGED','Entry resource changed; preserve and reconcile before proceeding')
                    for record in selected:
                        record.setdefault('failure_history',[]).append(record['last_failure'])
                        record['attempts']+=1
                        record['last_attempt_at']=now()
                        store.save_record(record)
                        try:
                            body,metadata=transport.get(record['source_url'])
                            store.save_original(record,body,metadata)
                            result={'id':record['id'],'url':record['source_url'],'status':'BODY_SAVED','sha256':record['sha256']}
                        except AcquisitionBlocked as error:
                            record['last_failure']={'class':error.code,'detail':error.detail,'at':now()}
                            store.save_record(record)
                            result={'id':record['id'],'url':record['source_url'],'status':'FAILED','failure':record['last_failure']}
                            if error.code not in ('NOT_FOUND','HTTP_ERROR'):
                                blockers=[{'code':error.code,'detail':error.detail}]
                        report['results'].append(result)
                        atomic_json(root/'AIM/reports/source-recheck.json',report)
                        store.checkpoint(owner,worker_running=True,blockers=blockers)
                        print(json.dumps(result),flush=True)
                        if blockers:break
                finally:context.close()
        except AcquisitionBlocked as error:
            blockers=[{'code':error.code,'detail':error.detail}]
        finally:
            report.update(finished_at=now(),blockers=blockers)
            atomic_json(root/'AIM/reports/source-recheck.json',report)
            unresolved=sum(r['status']=='FAILED' for r in store.records('AIM'))
            final_blockers=blockers or ([{'code':'SOURCE_RESOURCES_UNAVAILABLE','count':unresolved,'report':'AIM/reports/source-recheck.json'}] if unresolved else [])
            store.checkpoint(owner,phase=blockers[0]['code'] if blockers else 'AIM_SOURCE_RECHECK_COMPLETE',worker_running=False,blockers=final_blockers)
        return 1 if blockers else 0


if __name__=='__main__':raise SystemExit(main())
