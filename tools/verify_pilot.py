"""Verify the selected AIM pilot from originals through an offline browser view."""
from functools import partial
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
import json
import os
from pathlib import Path
import subprocess
import sys
import threading
from urllib.parse import unquote, urlsplit
from playwright.sync_api import sync_playwright
from collector import Store, read_json, atomic_json, atomic_bytes, digest, writer_lock, now
from article_data import convert, TreeParser, nodes, text_of


class QuietHandler(SimpleHTTPRequestHandler):
    def log_message(self, *args):pass


def validate(store, selection):
    records={r['id']:r for r in store.records('AIM')}
    selected=[records[i] for i in selection['article_ids']]
    issues=[]
    results=[]
    branches=set()
    totals={'articles':len(selected),'tables':0,'images':0,'variants':0,'characters':0,'outgoing_topics_deferred':0}
    for record in selected:
        if not record.get('app_data_path'):
            issues.append({'id':record['id'],'error':'MISSING_APP_DATA'});continue
        data=read_json(store.root/record['app_data_path'])
        if not all(data['verification']['checks'].values()):
            issues.append({'id':record['id'],'error':'CONTENT_CHECKS_FAILED'})
        for breadcrumbs in record.get('breadcrumbs',[]):
            if breadcrumbs:branches.add(breadcrumbs[0])
        inv=data['inventory']
        totals['tables']+=inv['tags'].get('table',0)
        totals['images']+=inv['tags'].get('img',0)
        totals['variants']+=len(inv['variants'])
        totals['characters']+=inv['text_characters']
        view=TreeParser();view.feed((store.root/data['reading']['html']).read_bytes().decode('utf-8'));view.close()
        by_source={n['attrs'].get('data-source-node'):n for n in nodes(view.root) if n['attrs'].get('data-source-node')}
        for variant in inv['variants']:
            node=by_source.get(variant['node_id'])
            if not node or digest(text_of(node).encode('utf-8'))!=variant['text_sha256']:
                issues.append({'id':record['id'],'error':'VARIANT_TEXT_MISMATCH','node_id':variant['node_id']})
        for ref in data['references']:
            if ref['classification']=='classification_required':
                issues.append({'id':record['id'],'error':'UNCLASSIFIED_REFERENCE','node_id':ref['node_id']})
            if ref['classification']=='same_document' and ref.get('fragment') and unquote(ref['fragment']) not in inv['anchors']:
                issues.append({'id':record['id'],'error':'MISSING_SAME_DOCUMENT_ANCHOR','fragment':ref['fragment']})
            if ref.get('classification')!='internal':continue
            target=records.get(ref['target_id'])
            if not target:
                issues.append({'id':record['id'],'error':'UNMAPPED_INTERNAL_REFERENCE'});continue
            if target['type']=='article':
                if target['id'] not in selection['article_ids']:
                    totals['outgoing_topics_deferred']+=1
                continue
            if target['status']!='BODY_SAVED' or not target.get('transport_metadata_verified'):
                issues.append({'id':record['id'],'error':'MISSING_SUPPORT_RESOURCE','target_id':target['id']})
            if target['type']=='stylesheet':
                style_path=store.root/'AIM/data/stylesheets'/(target['id']+'.json')
                if not style_path.exists():issues.append({'id':record['id'],'error':'CSS_NOT_CONVERTED'});continue
                style=read_json(style_path)
                if not style['direct_dependencies_captured'] or style['unsafe_css_detected']:
                    issues.append({'id':record['id'],'error':'CSS_DEPENDENCY_GAP','target_id':target['id']})
        # Re-run conversion to establish deterministic source-to-JSON/view resume.
        before={key:digest((store.root/data['reading'][key]).read_bytes()) for key in ('html','markdown')}
        before_json=digest((store.root/record['app_data_path']).read_bytes())
        convert(store,record)
        after={key:digest((store.root/data['reading'][key]).read_bytes()) for key in ('html','markdown')}
        if before!=after or before_json!=digest((store.root/record['app_data_path']).read_bytes()):
            issues.append({'id':record['id'],'error':'NONDETERMINISTIC_REBUILD'})
        results.append({'id':record['id'],'source_sha256':record['sha256'],'reading':data['reading'],
                        'variant_nodes':[v['node_id'] for v in inv['variants']]})
    formats={'five_or_more_articles':len(selected)>=5,'multiple_branches':len(branches)>=2,
             'extensive_article':any(read_json(store.root/r['app_data_path'])['inventory']['text_characters']>=8000 for r in selected if r.get('app_data_path')),
             'tables':totals['tables']>0,'images':totals['images']>0,'documentary_states':totals['variants']>0}
    if not all(formats.values()):issues.append({'error':'PILOT_FORMAT_COVERAGE','checks':formats})
    integrity=store.verify()
    if integrity['failures']:issues.extend(integrity['failures'])
    return issues,results,totals,formats


def offline_browser(root,results):
    server=ThreadingHTTPServer(('127.0.0.1',0),partial(QuietHandler,directory=str(root)))
    thread=threading.Thread(target=server.serve_forever,daemon=True);thread.start()
    port=server.server_port
    denied=[]
    issues=[]
    checked=[]
    try:
        with sync_playwright() as playwright:
            browser=playwright.chromium.launch(channel='msedge',headless=True,chromium_sandbox=True)
            try:
                context=browser.new_context()
                def route_request(route):
                    url=urlsplit(route.request.url)
                    if url.scheme=='http' and url.netloc=='127.0.0.1:'+str(port):route.continue_()
                    else:
                        denied.append({'scheme':url.scheme,'host':url.hostname});route.abort()
                context.route('**/*',route_request)
                page=context.new_page()
                for result in results:
                    page.goto('http://127.0.0.1:'+str(port)+'/'+result['reading']['html'],wait_until='load')
                    images=page.locator('img').evaluate_all('(items) => items.map(el => ({node:el.dataset.sourceNode,complete:el.complete,width:el.naturalWidth,height:el.naturalHeight}))')
                    if any(not img['complete'] or not img['width'] for img in images):
                        issues.append({'id':result['id'],'error':'OFFLINE_IMAGE_FAILED','images':images})
                    for node in result['variant_nodes']:
                        if not page.locator('[data-source-node="'+node+'"]').is_visible():
                            issues.append({'id':result['id'],'error':'DOCUMENTARY_STATE_HIDDEN','node_id':node})
                    active=page.locator('script,iframe,object,embed,form').count()
                    if active:issues.append({'id':result['id'],'error':'ACTIVE_VIEW_CONTENT'})
                    checked.append({'id':result['id'],'images':images,'visible_variants':len(result['variant_nodes']),'active_elements':active})
            finally:browser.close()
    finally:
        server.shutdown();server.server_close();thread.join()
    if denied:issues.append({'error':'EXTERNAL_REQUEST_ATTEMPTED','requests':denied})
    return issues,checked


if __name__=='__main__':
    root=Path(__file__).resolve().parents[1]
    runtime=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'
    with writer_lock(root,runtime) as owner:
        store=Store(root,cache_records=True)
        selection=read_json(root/'_project/pilot-AIM.json')
        store.checkpoint(owner,phase='PILOT_VERIFICATION',worker_running=True)
        test=subprocess.run([sys.executable,'-m','unittest','discover','-s','tests','-q'],cwd=root,capture_output=True,text=True)
        atomic_bytes(root/'_project/test-results.txt',(test.stdout+test.stderr).encode('utf-8'))
        issues,results,totals,formats=validate(store,selection)
        if test.returncode:issues.append({'error':'AUTOMATED_TEST_FAILURE','exit_code':test.returncode})
        browser_issues,browser_results=offline_browser(root,results)
        issues.extend(browser_issues)
        report={'checked_at':now(),'status':'PASSED' if not issues else 'FAILED','counts':totals,'formats':formats,
                'resources':results,'browser':browser_results,'issues':issues,'tests_exit_code':test.returncode,
                'scope':'Selected original articles, assets and static documentary states. Outgoing topics outside the pilot remain queued for corpus link validation; this is not module completion.'}
        atomic_json(root/'AIM/reports/pilot.json',report)
        state=read_json(root/'_project/STATE.json');state['pilot']=report['status'];atomic_json(root/'_project/STATE.json',state)
        selection['status']=report['status'];selection['report']='AIM/reports/pilot.json';atomic_json(root/'_project/pilot-AIM.json',selection)
        store.checkpoint(owner,phase='AIM_CAPTURE_READY' if not issues else 'PILOT_REPAIR_REQUIRED',worker_running=False)
        print(json.dumps({'status':report['status'],'counts':totals,'issues':issues}),flush=True)
        sys.exit(1 if issues else 0)
