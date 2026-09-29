"""One authenticated GET per observed SDK HTTP failure; preserve all history."""
import json
import os
from pathlib import Path
from playwright.sync_api import sync_playwright
from collector import Store, SEEDS, atomic_json, writer_lock, digest, now
from acquire import module_checkpoint
from stage_transport import StageTransport, AcquisitionBlocked


def main():
    root=Path(__file__).resolve().parents[1]
    private=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/private'
    runtime=private.parent/'runtime'
    with writer_lock(root,runtime) as owner:
        store=Store(root,cache_records=True)
        if store.verify(module='SDK')['failures']:
            raise ValueError('Saved SDK originals failed integrity checks')
        selected=[r for r in store.records('SDK') if r['status']=='FAILED'
                  and r.get('last_failure',{}).get('class') in ('NOT_FOUND','HTTP_ERROR','UNEXPECTED_HTML')]
        report={'started_at':now(),'module':'SDK','method':'One GET per previously observed failed URL; no guessed paths.','results':[]}
        blockers=[]
        module_checkpoint(store,owner,'SDK',phase='SDK_SOURCE_RECHECK_IN_PROGRESS',worker_running=True)
        try:
            with sync_playwright() as p:
                context=p.chromium.launch_persistent_context(str(private/'stage-edge-profile'),channel='msedge',headless=False,
                    chromium_sandbox=True,ignore_https_errors=False,bypass_csp=False)
                try:
                    transport=StageTransport(context.request,module='SDK',cooldown_path=runtime/'stage-cooldown.json')
                    url=SEEDS['SDK'].split('#',1)[0]
                    body,metadata=transport.get(url)
                    seed=next(r for r in store.records('SDK') if r['source_url']==url)
                    report['authenticated_control']={'url':url,'status':200,'sha256':digest(body),'matches_saved_original':digest(body)==seed['sha256']}
                    if digest(body)!=seed['sha256']:
                        raise AcquisitionBlocked('SOURCE_CHANGED','Entry resource changed; preserve and reconcile before proceeding')
                    for record in sorted(selected,key=lambda r:r['source_url']):
                        record.setdefault('failure_history',[]).append(record['last_failure'])
                        record['attempts']+=1
                        record['last_attempt_at']=now()
                        store.save_record(record)
                        try:
                            body,metadata=transport.get(record['source_url'])
                            store.save_original(record,body,metadata)
                            result={'id':record['id'],'url':record['source_url'],'status':'BODY_SAVED','sha256':record['sha256']}
                        except AcquisitionBlocked as error:
                            record.update(status='FAILED',last_failure={'class':error.code,'detail':error.detail,'at':now()})
                            store.save_record(record)
                            result={'id':record['id'],'url':record['source_url'],'status':'FAILED','failure':record['last_failure']}
                            if error.code not in ('NOT_FOUND','HTTP_ERROR'):
                                blockers=[{'code':error.code,'detail':error.detail}]
                        report['results'].append(result)
                        atomic_json(root/'SDK/reports/source-recheck.json',report)
                        module_checkpoint(store,owner,'SDK',worker_running=True,blockers=blockers)
                        print(json.dumps(result),flush=True)
                        if blockers:break
                finally:context.close()
        except AcquisitionBlocked as error:
            blockers=[{'code':error.code,'detail':error.detail}]
        finally:
            report.update(finished_at=now(),blockers=blockers)
            atomic_json(root/'SDK/reports/source-recheck.json',report)
            unresolved=sum(r['status']=='FAILED' for r in store.records('SDK'))
            final=blockers or ([{'code':'SDK_SOURCE_RESOURCES_UNAVAILABLE','count':unresolved,'report':'SDK/reports/source-recheck.json'}] if unresolved else [])
            module_checkpoint(store,owner,'SDK',phase='SDK_SOURCE_RECHECK_COMPLETE' if not blockers else blockers[0]['code'],worker_running=False,blockers=final)
        return 1 if blockers else 0


if __name__=='__main__':raise SystemExit(main())
