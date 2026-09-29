"""Verify recorded AIM gaps using only the authorized live documentation renderer."""
import json
import os
import time
from pathlib import Path
from urllib.parse import unquote, urlsplit
from playwright.sync_api import sync_playwright, TimeoutError as BrowserTimeout
from collector import Store, SEEDS, source_identity, atomic_bytes, atomic_json, read_json, digest, now, writer_lock
from stage_transport import StageTransport, AcquisitionBlocked, validate_body


def main():
    root=Path(__file__).resolve().parents[1]
    private=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/private'
    with writer_lock(root,private.parent/'runtime') as owner:
        store=Store(root,cache_records=True)
        records={r['id']:r for r in store.records('AIM')}
        gaps=read_json(root/'AIM/reports/source-gaps.json')
        report={'started_at':now(),'method':'Live Stage documentation renderer; existing recorded targets only. Browser traffic is separate from scheduled collector requests.',
                'anchor_targets':[],'unavailable_resources':[],'scope_blocked_requests':[],
                'source_gaps_sha256':digest((root/'AIM/reports/source-gaps.json').read_bytes()),'blockers':[]}
        path=root/'AIM/reports/live-source-gaps.json'
        state=read_json(root/'_project/STATE.json')
        state['publication'].update(current_checkpoint_clean_clone_verified=False,current_local_changes_pending_publication=True)
        atomic_json(root/'_project/STATE.json',state)
        inherited=state.get('blockers',[])
        store.checkpoint(owner,phase='AIM_LIVE_SOURCE_GAP_VERIFICATION',worker_running=True)
        try:
            with sync_playwright() as p:
                context=p.chromium.launch_persistent_context(str(private/'stage-edge-profile'),channel='msedge',headless=False,
                    chromium_sandbox=True,ignore_https_errors=False,bypass_csp=False)
                try:
                    transport=StageTransport(context.request,cooldown_path=private.parent/'runtime/stage-cooldown.json')
                    body,metadata=transport.get(SEEDS['AIM'])
                    seed=next(r for r in records.values() if r['source_url']==SEEDS['AIM'])
                    if digest(body)!=seed['sha256']:raise AcquisitionBlocked('SOURCE_CHANGED','AIM entry differs from verified generation')
                    report['authenticated_control']={'status':200,'sha256':digest(body),'matches_saved_original':True}
                    denied_documents=[]
                    def route_request(route):
                        request=route.request
                        try:
                            identity=source_identity(request.url,request.url)
                            if identity['module']!='AIM':raise ValueError('OTHER_MODULE')
                            route.continue_()
                        except ValueError:
                            # Never save query strings, credentials or response bodies from blocked routes.
                            parsed=urlsplit(request.url)
                            item={'origin':parsed.scheme+'://'+parsed.netloc,'resource_type':request.resource_type}
                            if item not in report['scope_blocked_requests']:report['scope_blocked_requests'].append(item)
                            if request.is_navigation_request():denied_documents.append(item)
                            route.abort()
                    context.route('**/*',route_request)
                    page=context.new_page()
                    targets={}
                    for gap in gaps['broken_anchor_references']:
                        targets.setdefault(gap['target_id'],set()).add(unquote(gap['fragment']))
                    for identifier,fragments in sorted(targets.items()):
                        record=records[identifier]
                        denied_documents.clear()
                        response=page.goto(record['source_url'],wait_until='load',timeout=45000)
                        page.wait_for_timeout(750)
                        if denied_documents:raise AcquisitionBlocked('BLOCKED_AUTH_OR_SCOPE','Documentation navigation redirected outside authorized AIM scope')
                        raw=response.body();mime=response.headers.get('content-type','')
                        validate_body(response.url,mime,raw)
                        if response.status!=200 or digest(raw)!=record['sha256']:
                            raise AcquisitionBlocked('SOURCE_CHANGED','Live article response differs from verified original: '+identifier)
                        result=page.evaluate('''fragments => ({anchors:fragments.map(fragment => ({fragment,
                            exact: Array.from(document.querySelectorAll('[id],[name]')).filter(n => n.id === fragment || n.getAttribute('name') === fragment).map(n => ({tag:n.tagName,id:n.id,name:n.getAttribute('name')})),
                            case_insensitive: Array.from(document.querySelectorAll('[id],[name]')).filter(n => n.id.toLowerCase() === fragment.toLowerCase() || (n.getAttribute('name')||'').toLowerCase() === fragment.toLowerCase()).map(n => ({tag:n.tagName,id:n.id,name:n.getAttribute('name')}))})),
                            ready_state:document.readyState, rendered_html:document.documentElement.outerHTML})''',sorted(fragments))
                        rendered=result.pop('rendered_html').encode('utf-8')
                        validate_body(record['source_url'],'text/html',rendered)
                        rendered_path='AIM/rendered/source-gap-checks/'+digest(rendered)+'.html'
                        atomic_bytes(root/rendered_path,rendered)
                        result.update(id=identifier,url=record['source_url'],source_sha256=record['sha256'],rendered_path=rendered_path,
                                      rendered_sha256=digest(rendered),representation='live_rendered_dom_utf8_not_original_response',checked_at=now())
                        report['anchor_targets'].append(result)
                        atomic_json(path,report)
                        print(json.dumps({'target':identifier,'fragments':len(fragments),'found':sum(bool(x['exact']) for x in result['anchors'])}),flush=True)
                        time.sleep(.5)
                    for missing in gaps['missing_resources']:
                        denied_documents.clear()
                        if missing['type']=='navigation':
                            try:
                                raw,meta=transport.get(missing['url'])
                                result={'id':missing['id'],'status':200,'sha256':digest(raw),'requires_generation_reconciliation':True}
                            except AcquisitionBlocked as error:
                                result={'id':missing['id'],'failure':error.code,'detail':error.detail}
                                if error.code not in ('NOT_FOUND','HTTP_ERROR'):raise
                        else:
                            response=page.goto(missing['url'],wait_until='domcontentloaded',timeout=45000)
                            if denied_documents:raise AcquisitionBlocked('BLOCKED_AUTH_OR_SCOPE','Source gap navigation left authorized scope')
                            result={'id':missing['id'],'status':response.status,'source_url':missing['url']}
                            if response.status==200:
                                raw=response.body();validate_body(response.url,response.headers.get('content-type',''),raw)
                                result.update(sha256=digest(raw),requires_generation_reconciliation=True)
                        report['unavailable_resources'].append(result)
                        atomic_json(path,report)
                        print(json.dumps(result),flush=True)
                        time.sleep(.5)
                finally:context.close()
        except (AcquisitionBlocked,BrowserTimeout) as error:
            report['blockers']=[{'code':getattr(error,'code','TIMEOUT'),'detail':getattr(error,'detail','Live renderer timed out')}]
        finally:
            report.update(finished_at=now(),verified_anchor_targets=len(report['anchor_targets']))
            atomic_json(path,report)
            store.checkpoint(owner,phase='AIM_SOURCE_BLOCKED',worker_running=False,blockers=inherited+report['blockers'])
        print(json.dumps({'targets_checked':len(report['anchor_targets']),'missing_resources_checked':len(report['unavailable_resources']),'blockers':report['blockers']}))
        return 1 if report['blockers'] else 0


if __name__=='__main__':raise SystemExit(main())
