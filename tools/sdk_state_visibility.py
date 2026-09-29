"""Native reading checks retain zero-area source-empty documentary states."""
from functools import partial
from http.server import ThreadingHTTPServer
import threading
from urllib.parse import urlsplit
import sdk_article_data as sdk
from collector import digest
from verify_pilot import QuietHandler


def empty_state_descriptors(content,variant_nodes,edges):
    """Only literal whitespace-only leaf DIV bodies of known source controls."""
    by_id={n['node_id']:n for n in sdk.nodes(content)};result=[]
    for identifier in variant_nodes:
        node=by_id[identifier]
        linked={e['kind'] for e in edges if e.get('body_node')==identifier}
        matched=(sdk.classes(node)=={'i-popup-content'} and 'popup' in linked) or (
            sdk.classes(node)=={'i-section-content'} and 'section' in linked)
        if (node['tag']!='div' or not matched or set(node['attrs'])-{'id','class'} or
            any(not isinstance(child,str) or any(c not in ' \t\r\n\f' for c in child) for child in node['children'])):
            continue
        text=sdk.dom_text_of(node)
        result.append({'node_id':identifier,'source_attributes':dict(node['attrs']),
            'source_text':text,'source_text_sha256':digest(text.encode('utf-8')),
            'source_child_element_count':0,'source_semantics':'published control body is an empty structural state; retain its node and literal whitespace'})
    return result


def empty_observation_passed(expected,actual):
    return bool(actual.get('count')==1 and actual.get('tag')=='div' and
        actual.get('text')==expected['source_text'] and actual.get('child_elements')==0 and
        actual.get('attributes')==expected['source_attributes'] and actual.get('hidden_ancestors')==[])


def state_visibility_passed(view,variants,expected_empty=()):
    """Audit exact source-empty evidence without lowering the state denominator."""
    expected={item['node_id']:item for item in expected_empty}
    actual=view.get('empty_source_states',[])
    if len(actual)!=len(expected) or {item.get('node_id') for item in actual}!=set(expected):return False
    if not expected:return view.get('visible_variants')==len(variants)
    if view.get('represented_variants')!=len(variants):return False
    for item in actual:
        source=expected[item['node_id']]
        if not (item.get('passed') is True and item.get('source_text_sha256')==item.get('reading_text_sha256')==source['source_text_sha256'] and
                item.get('source_attributes')==source['source_attributes'] and item.get('child_elements')==0 and
                item.get('hidden_ancestors')==[] and type(item.get('positive_area_visible')) is bool):return False
    return view.get('visible_variants',-1)+sum(not item['positive_area_visible'] for item in actual)==len(variants)


def offline_sdk_states(root,views):
    """SDK-specific native visibility checks; AIM verifier remains unchanged."""
    from playwright.sync_api import sync_playwright
    server=ThreadingHTTPServer(('127.0.0.1',0),partial(QuietHandler,directory=str(root)))
    thread=threading.Thread(target=server.serve_forever,daemon=True);thread.start()
    port=server.server_port;issues=[];checked=[];denied=[]
    try:
        with sync_playwright() as p:
            browser=p.chromium.launch(channel='msedge',headless=True,chromium_sandbox=True)
            try:
                context=browser.new_context()
                def scoped(route):
                    url=urlsplit(route.request.url)
                    if url.scheme=='http' and url.netloc=='127.0.0.1:'+str(port):route.continue_()
                    else:denied.append({'scheme':url.scheme,'host':url.hostname});route.abort()
                context.route('**/*',scoped);page=context.new_page()
                for view in views:
                    page.goto('http://127.0.0.1:'+str(port)+'/'+view['reading']['html'],wait_until='load')
                    images=page.locator('img').evaluate_all('(items)=>items.map(el=>({node:el.dataset.sourceNode,complete:el.complete,width:el.naturalWidth,height:el.naturalHeight}))')
                    if any(not image['complete'] or not image['width'] for image in images):issues.append({'id':view['id'],'error':'OFFLINE_IMAGE_FAILED','images':images})
                    empty={entry['node_id']:entry for entry in view.get('empty_source_states',[])}
                    empty_checked=[];visible_count=0;represented=0
                    for identifier in view['variant_nodes']:
                        locator=page.locator('[data-source-node="'+identifier+'"]')
                        if locator.count()!=1:
                            issues.append({'id':view['id'],'error':'DOCUMENTARY_STATE_NODE_MISSING_OR_DUPLICATED','node_id':identifier})
                            continue
                        visible=locator.is_visible();visible_count+=visible
                        if identifier in empty:
                            expected=empty[identifier]
                            actual=locator.evaluate('''el=>{const hidden=[];for(let n=el;n;n=n.parentElement){
                                const s=getComputedStyle(n);if(s.display==='none'||s.visibility==='hidden'||s.visibility==='collapse'||s.contentVisibility==='hidden'||Number(s.opacity)===0||n.hidden)hidden.push(n.dataset.sourceNode||n.tagName.toLowerCase());}
                                return {count:1,tag:el.tagName.toLowerCase(),text:el.textContent,child_elements:el.childElementCount,
                                    attributes:Object.fromEntries([...el.attributes].filter(a=>a.name!=='data-source-node').map(a=>[a.name,a.value])),hidden_ancestors:hidden};}''')
                            passed=empty_observation_passed(expected,actual)
                            empty_checked.append({'node_id':identifier,'source_text_sha256':expected['source_text_sha256'],
                                'reading_text_sha256':digest(actual['text'].encode('utf-8')),'source_attributes':expected['source_attributes'],
                                'child_elements':actual['child_elements'],'hidden_ancestors':actual['hidden_ancestors'],
                                'positive_area_visible':visible,'passed':passed})
                            if passed:represented+=1
                            else:issues.append({'id':view['id'],'error':'EMPTY_DOCUMENTARY_STATE_NOT_PRESERVED','node_id':identifier})
                        elif visible:represented+=1
                        else:issues.append({'id':view['id'],'error':'DOCUMENTARY_STATE_HIDDEN','node_id':identifier})
                    active=page.locator('script,iframe,object,embed,form').count()
                    if active:issues.append({'id':view['id'],'error':'ACTIVE_VIEW_CONTENT'})
                    checked.append({'id':view['id'],'images':images,'visible_variants':visible_count,
                        'represented_variants':represented,'empty_source_states':empty_checked,'active_elements':active})
            finally:browser.close()
    finally:server.shutdown();server.server_close();thread.join()
    if denied:issues.append({'error':'EXTERNAL_REQUEST_ATTEMPTED','requests':denied})
    return issues,checked
