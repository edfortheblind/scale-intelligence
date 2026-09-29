"""Run the verified AIM collector to a source/asset fixed point, then audit.

This local controller never marks a module complete or starts SDK without its
required handoff evidence. Logs and its lease stay outside Git and OneDrive.
"""
import json
import os
from pathlib import Path
import subprocess
import sys
import signal
import argparse
from collector import Store, atomic_json, read_json, writer_lock, digest, now
from completion_gates import browser_proof_current

RETRYABLE={'DNS','CONNECTION','TIMEOUT','RATE_LIMIT','TRANSIENT_HTTP','BLOCKED_AUTH','BLOCKED_PERMISSION','BLOCKED_AUTH_OR_SCOPE','CIRCUIT_OPEN','RATE_LIMIT_WAIT','EMPTY_BODY'}


def eligible(record):
    return record['status']=='PENDING' or (record['status']=='FAILED' and record.get('last_failure',{}).get('class') in RETRYABLE)


def main(offline=False):
    root=Path(__file__).resolve().parents[1]
    private=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/private'
    runtime=private.parent/'runtime'
    private.mkdir(parents=True,exist_ok=True)
    controller={'pid':os.getpid(),'started_at':now(),'running':True,'log_location':'%LOCALAPPDATA%/TAB/SCALE-Intelligence/private/aim-controller.log'}
    def mark(phase=None,blockers=None):
        with writer_lock(root,runtime) as owner:
            store=Store(root)
            state=read_json(root/'_project/STATE.json')
            state['controller']=controller
            atomic_json(root/'_project/STATE.json',state)
            store.checkpoint(owner,phase=phase,blockers=blockers,worker_running=False)
    with writer_lock(root,runtime/'controller-lease'), (private/'aim-controller.log').open('a',encoding='utf-8',buffering=1) as log:
        if read_json(root/'_project/STATE.json').get('pilot')!='PASSED':
            raise ValueError('Verified pilot required before continuous acquisition')
        mark('AIM_CAPTURE_READY',[])
        stopping=[]
        def request_stop(signum,frame):
            stopping.append(signum)
        prior_handler=signal.signal(signal.SIGINT,request_stop)
        def step(script,*args):
            if stopping:raise RuntimeError('CONTROLLER_INTERRUPTED_AFTER_SAFE_CHILD_EXIT')
            log.write(json.dumps({'at':now(),'command':['python',script,*args]})+'\n')
            result=subprocess.run([sys.executable,'-u',script,*args],cwd=root,stdout=log,stderr=log,
                                  creationflags=subprocess.CREATE_NEW_PROCESS_GROUP if os.name=='nt' else 0)
            if stopping:raise RuntimeError('CONTROLLER_INTERRUPTED_AFTER_SAFE_CHILD_EXIT')
            state=read_json(root/'_project/STATE.json')
            if result.returncode:
                raise RuntimeError('LOCAL_STEP_FAILED: '+script)
            if any(b.get('code') in ('BLOCKED_AUTH','BLOCKED_PERMISSION','BLOCKED_AUTH_OR_SCOPE','CIRCUIT_OPEN','TLS','RATE_LIMIT_WAIT') for b in state.get('blockers',[])):
                raise RuntimeError('EXTERNAL_ACQUISITION_BLOCKER: '+state['blockers'][0]['code'])
        try:
            for cycle in range(100):
                if not offline:
                    step('tools/acquire.py','--kind','article','--limit','100','--convert')
                    for kind in ('navigation','script','stylesheet'):
                        step('tools/acquire.py','--kind',kind,'--limit','10000')
                step('tools/style_data.py')
                if not offline:
                    for kind in ('image','font','video','attachment'):
                        step('tools/acquire.py','--kind',kind,'--limit','10000')
                step('tools/discover_aim.py')
                records=Store(root).records('AIM')
                log.write(json.dumps({'at':now(),'cycle':cycle+1,'eligible_remaining':sum(eligible(r) for r in records)})+'\n')
                if offline or not any(eligible(r) for r in records):break
            else:
                raise RuntimeError('DISCOVERY_ITERATION_LIMIT_REQUIRES_REVIEW')
            step('tools/style_data.py')
            step('tools/article_data.py')
            # Reconcile the final derivative/reference generation before granting any gate.
            step('tools/discover_aim.py')
            for kind,script in (('resources','tools/verify_resources.py'),('states','tools/verify_bound_states.py')):
                if browser_proof_current(Store(root),kind):
                    log.write(json.dumps({'at':now(),'reused_source_hash_current_proof':kind})+'\n')
                else:
                    step(script)
            step('tools/build_navigation.py')
            step('tools/audit_module.py')
            audit=read_json(root/'AIM/reports/module-audit.json')
            step('tools/build_search.py',*(() if audit.get('module_local_complete') else ('--provisional',)))
            step('tools/report_source_gaps.py')
            state=read_json(root/'_project/STATE.json')
            phase='MODULE_LOCAL_COMPLETE' if audit.get('module_local_complete') else ('AIM_SOURCE_BLOCKED' if audit['source_failures'] else 'AIM_VERIFICATION_INCOMPLETE')
            controller.update(running=False,finished_at=now(),result=phase)
            mark(phase,state.get('blockers',[]))
            # No corpus-mutating step may follow the frozen delivery inventory.
            step('tools/build_delivery_inventory.py')
            step('tools/verify_delivery.py')
            log.write(json.dumps({'at':now(),'result':phase,'blockers':state.get('blockers',[])})+'\n')
        except (Exception,KeyboardInterrupt) as error:
            controller.update(running=False,finished_at=now(),result=str(error))
            state=read_json(root/'_project/STATE.json')
            blockers=state.get('blockers') or [{'code':'CONTROLLER_STEP_REQUIRES_REVIEW','detail':str(error)}]
            mark(state['phase'] if state.get('blockers') else 'CONTROLLER_STEP_REQUIRES_REVIEW',blockers)
            log.write(json.dumps({'at':now(),'stopped':str(error)})+'\n')
            return 1
        finally:
            signal.signal(signal.SIGINT,prior_handler)
    return 0


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--offline',action='store_true',help='Rebuild and verify saved AIM artifacts without Stage acquisition.')
    raise SystemExit(main(parser.parse_args().offline))
