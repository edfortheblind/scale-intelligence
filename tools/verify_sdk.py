"""Verify SDK pilot/captured fidelity without inheriting AIM evidence or success."""
import argparse
from collections import Counter
from functools import partial
from http.server import ThreadingHTTPServer
from io import BytesIO
import json
import os
from pathlib import Path,PurePosixPath
import re
import tempfile
import threading
from urllib.parse import unquote,urlsplit
import zipfile
from collector import Store,read_json,atomic_json,atomic_bytes,digest,writer_lock,now
from article_data import nodes,text_of,TreeParser
from reading_audit import child_signature
from verify_pilot import offline_browser,QuietHandler
import sdk_article_data as adapter
from sdk_state_visibility import empty_state_descriptors,offline_sdk_states
from sdk_link_semantics import fragment_supported,required_external_reference

SEMANTICS=('verify_sdk.py','sdk_article_data.py','verify_pilot.py','article_data.py','reading_audit.py','style_data.py',
           'discover_sdk.py','collector.py','audit_module.py','sdk_link_semantics.py','sdk_state_visibility.py')
REQUIRED_CHECKS=('exact_decoded_text','table_cell_structure','exact_code_whitespace','headings',
                 'parse_without_repair','supported_elements','image_reference_classification','direct_assets_available')


def source_parse_check(store,record,parser,content,data):
    """Retain converter diagnostics; accept only independently proved recovery."""
    verification=data.get('verification',{})
    exact=(verification.get('parse_errors')==parser.errors and
           verification.get('source_parse_diagnostics')==adapter.source_parse_diagnostics(parser.errors))
    equivalent=False
    if exact and parser.errors and all(e=={'class':'UNMATCHED_CLOSE','tag':'strong'} for e in parser.errors):
        from verify_sdk_markup import markup_proof_current
        equivalent=markup_proof_current(store,record,parser,content) is True
    return {'passed':bool(exact and (not parser.errors or equivalent)),
            'native_equivalence_verified':equivalent}


def converter_check_failures(data,parse_check,ignore=()):
    checks=data.get('verification',{}).get('checks',{})
    keys=set(checks)|set(REQUIRED_CHECKS)
    # This is the only admissible exception, and the original false check is
    # never rewritten. Missing checks and every other false check remain errors.
    accepted_recovery=(parse_check.get('passed') is True and
                       parse_check.get('native_equivalence_verified') is True)
    return sorted(key for key in keys if key not in ignore and checks.get(key) is not True and not (
        key=='parse_without_repair' and checks.get(key) is False and accepted_recovery))


def verify_reading(root,record,data,content,catalog):
    """Independently compare SDK node structure, semantics and local mappings."""
    errors=[];source_nodes=list(nodes(content))[1:]
    refs={}
    for ref in data['references']:refs.setdefault(ref['node_id'],[]).append(ref)
    for kind in ('html','markdown'):
        parser=TreeParser();text=(root/data['reading'][kind]).read_bytes().decode('utf-8')
        parser.feed(text if kind=='html' else '<body>'+text+'</body>');parser.close()
        bodies=[n for n in nodes(parser.root) if n['tag']=='body']
        if parser.errors or len(bodies)!=1:errors.append({'check':'READING_PARSE','format':kind});continue
        body=bodies[0];ordered=list(nodes(body))[1:];mapped={n['attrs'].get('data-source-node'):n for n in ordered}
        if [n['attrs'].get('data-source-node') for n in ordered]!=[n['node_id'] for n in source_nodes]:
            errors.append({'check':'CONTENT_NODE_ORDER','format':kind})
        if text_of(body)!=text_of(content) or child_signature(body)!=child_signature(content):
            errors.append({'check':'BODY_TEXT_OR_CHILD_ORDER','format':kind})
        for node in source_nodes:
            target=mapped.get(node['node_id'])
            if not target:continue
            if target['tag']!=('div' if node['tag']=='noscript' else node['tag']) or child_signature(node)!=child_signature(target):
                errors.append({'check':'ELEMENT_OR_CHILDREN','format':kind,'node':node['node_id']})
            for attr,value in node['attrs'].items():
                if attr in adapter.SAFE_ATTRS and value is not None and target['attrs'].get(attr)!=value:
                    errors.append({'check':'SEMANTIC_ATTRIBUTE','format':kind,'node':node['node_id'],'attribute':attr})
            if any(a.startswith('on') for a in target['attrs']) or target['tag'] in ('script','iframe','object','embed','form') or (target['tag']=='input' and 'disabled' not in target['attrs']):
                errors.append({'check':'ACTIVE_CONTENT','format':kind,'node':node['node_id']})
            for ref in refs.get(node['node_id'],[]):
                attr=ref['attribute']
                if attr not in ('href','src','poster','data-src','data-original'):continue
                output_attr='src' if attr in ('data-src','data-original') else attr
                if attr=='src' and (node['attrs'].get('data-src') or node['attrs'].get('data-original')):continue
                expected=None;classification=ref['classification'];fragment=ref.get('fragment')
                if classification=='same_document':expected='#'+fragment
                elif classification=='internal':
                    resource=catalog.get(ref.get('target_id'),{})
                    if resource.get('type')=='navigation':expected='index.html'
                    elif resource.get('type')=='article':expected=resource['id']+'.html'+('#'+fragment if fragment else '')
                    elif resource.get('local_path'):expected='../'+resource['local_path'].split('/',1)[1]+('#'+fragment if fragment else '')
                elif attr=='href' and classification in ('out_of_scope_reference','deferred_cross_module'):
                    candidate=ref.get('resolved_url')
                    if candidate and urlsplit(candidate).scheme in ('http','https'):expected=candidate
                elif attr=='href' and ref['original_href'].startswith(('mailto:','tel:')):expected=ref['original_href']
                elif attr in ('src','poster') and ref['original_href'].startswith('data:image/') and not ref['original_href'].lower().startswith('data:image/svg'):
                    expected=ref['original_href']
                if target['attrs'].get(output_attr)!=expected:
                    errors.append({'check':'REFERENCE_MAPPING','format':kind,'node':node['node_id'],'attribute':attr})
    return {'passed':not errors,'errors':errors}


def attachment_check(record,body):
    """Inspect file structure only; never extract or execute an attachment."""
    suffix=Path(urlsplit(record['source_url']).path).suffix.lower()
    check='original_hash_and_transport';valid=True;diagnostic=None
    try:
        if suffix=='.pdf':
            check='pdf_signature_and_eof';valid=body.startswith(b'%PDF-') and b'%%EOF' in body[-2048:]
        elif suffix in ('.zip','.xlsx','.docx','.pptx'):
            check='archive_directory_and_crc'
            with zipfile.ZipFile(BytesIO(body)) as archive:
                files=archive.infolist()
                valid=(sum(f.file_size for f in files)<=100*1024*1024 and
                    all(not PurePosixPath(f.filename.replace('\\','/')).is_absolute() and
                        '..' not in PurePosixPath(f.filename.replace('\\','/')).parts and ':' not in f.filename for f in files))
                if suffix!='.zip':valid=valid and '[Content_Types].xml' in archive.namelist()
                if valid:valid=archive.testzip() is None
        elif suffix in ('.txt','.sql','.cs','.ps1','.js','.json','.xml','.xsd'):
            check='strict_text_decoding';body.decode(record.get('encoding') or 'utf-8-sig',errors='strict')
    except UnicodeDecodeError as error:
        valid=False
        diagnostic={'class':'SOURCE_TEXT_ENCODING_INVALID','encoding':error.encoding,
            'byte_start':error.start,'byte_end':error.end,'reason':error.reason,
            'original_bytes_preserved':True,'replacement_or_transcoding_applied':False}
    except (ValueError,UnicodeError,OSError,zipfile.BadZipFile,RuntimeError):valid=False
    result={'id':record['id'],'sha256':record.get('sha256'),'check':check,'passed':valid}
    if diagnostic:result['source_diagnostic']=diagnostic
    return result


def decode_images(root,records):
    """Decode original SDK images in a local-only isolated Edge renderer."""
    from playwright.sync_api import sync_playwright
    if not records:return [],[]
    server=ThreadingHTTPServer(('127.0.0.1',0),partial(QuietHandler,directory=str(root)))
    thread=threading.Thread(target=server.serve_forever,daemon=True);thread.start()
    origin='http://127.0.0.1:'+str(server.server_port);decoded=[];denied=[]
    try:
        with sync_playwright() as p:
            browser=p.chromium.launch(channel='msedge',headless=True,chromium_sandbox=True)
            try:
                context=browser.new_context()
                def local_only(route):
                    if route.request.url.startswith(origin+'/'):route.continue_()
                    else:denied.append(route.request.url);route.abort()
                context.route('**/*',local_only);page=context.new_page()
                page.goto(origin+'/',wait_until='domcontentloaded',timeout=15000)
                for offset in range(0,len(records),20):
                    decoded.extend(page.evaluate('''async entries => Promise.all(entries.map(async e => {
                      const img=new Image();img.src=e.url;
                      try {await Promise.race([img.decode(),new Promise((_,reject)=>setTimeout(()=>reject(new Error('timeout')),10000))]);
                        return {id:e.id,sha256:e.sha256,decoded:true,width:img.naturalWidth,height:img.naturalHeight};}
                      catch {return {id:e.id,sha256:e.sha256,decoded:false};}
                    }))''',[{'id':r['id'],'sha256':r['sha256'],'url':origin+'/'+r['local_path']} for r in records[offset:offset+20]]))
            finally:browser.close()
    finally:server.shutdown();server.server_close();thread.join()
    issues=[{'id':r['id'],'error':'IMAGE_DECODING_FAILED'} for r in decoded if not r.get('decoded') or not r.get('width') or not r.get('height')]
    if denied:issues.append({'error':'IMAGE_EXTERNAL_REQUEST_ATTEMPTED','count':len(denied)})
    return issues,decoded


def support_closure(store,catalog,identifiers):
    """Visit every required non-topic edge, including recursive CSS dependencies."""
    pending=list(identifiers);seen=set();issues=[];styles=[]
    while pending:
        identifier=pending.pop()
        if identifier in seen:continue
        seen.add(identifier);record=catalog.get(identifier)
        if not record or record['status']!='BODY_SAVED':
            issues.append({'id':identifier,'error':'REQUIRED_SUPPORT_NOT_CAPTURED'});continue
        if record['type']!='stylesheet':continue
        path=store.root/'SDK/data/stylesheets'/(identifier+'.json')
        try:
            style=read_json(path)
            if style['source_sha256']!=record['sha256'] or style['unsafe_css_detected'] or not style['direct_dependencies_captured']:
                issues.append({'id':identifier,'error':'CSS_CLOSURE_INCOMPLETE'})
            rendered=store.root/style['rendered_path']
            if digest(rendered.read_bytes())!=style['rendered_sha256']:
                issues.append({'id':identifier,'error':'CSS_RENDERED_HASH_MISMATCH'})
            styles.append({'path':style['rendered_path'],'sha256':style['rendered_sha256']})
            for ref in style['references']:
                if ref['classification']=='internal':pending.append(ref['target_id'])
                elif ref['classification'] not in ('namespace_identifier','legacy_opaque_reference','embedded_or_fragment'):
                    issues.append({'id':identifier,'error':'CSS_REFERENCE_UNRESOLVED'})
        except (OSError,KeyError,ValueError,TypeError) as error:
            issues.append({'id':identifier,'error':'CSS_PROOF_MISSING_OR_INVALID','detail':str(error)})
    return seen,styles,issues


def input_generation(store,catalog,identifiers,documents,styles):
    paths=set()
    for identifier in identifiers:
        record=catalog.get(identifier,{})
        if record.get('local_path'):paths.add(record['local_path'])
        if record.get('type')=='stylesheet':paths.add('SDK/data/stylesheets/'+identifier+'.json')
    for data in documents:
        paths.add(catalog[data['id']]['app_data_path'])
        paths.update(data['reading'][kind] for kind in ('html','markdown'))
    if any(data.get('verification',{}).get('source_parse_diagnostics',{}).get('native_equivalence_required') is True for data in documents):
        paths.update(('SDK/reports/source-markup.json','tools/verify_sdk_markup.py'))
    paths.update(item['path'] for item in styles)
    paths.update('tools/'+name for name in SEMANTICS)
    files=[]
    for relative in sorted(paths):
        path=(store.root/relative).resolve()
        if not path.is_relative_to(store.root):raise ValueError('Input outside repository')
        raw=path.read_bytes();files.append({'path':relative,'byte_count':len(raw),'sha256':digest(raw)})
    catalog_identity=[{k:catalog[i].get(k) for k in ('id','module','source_url','final_url','encoding','mime','type','status','local_path','app_data_path','sha256','byte_count','transport_metadata_verified','http_status')}
                      for i in sorted(identifiers) if i in catalog]
    return {'files':files,'catalog_identity':catalog_identity,
            'sha256':digest(json.dumps({'files':files,'catalog_identity':catalog_identity},sort_keys=True,separators=(',',':')).encode())}


def copy_payload_checks(view,source_payloads,reading_payloads):
    """Compare actual browser DOM payloads to explicit source-bound code cells."""
    expected=view.get('copy_payloads',[]);issues=[];checked=[]
    if len(source_payloads)!=len(expected):
        issues.append({'id':view['id'],'error':'SOURCE_COPY_CONTROL_COUNT_MISMATCH'})
    for ordinal,edge in enumerate(expected):
        source=source_payloads[ordinal] if ordinal<len(source_payloads) else None
        reading=reading_payloads.get(edge['body_node'])
        passed=source==reading==edge['copy_text'] and digest(edge['copy_text'].encode('utf-8'))==edge['copy_text_sha256']
        checked.append({'control_node':edge['control_node'],'body_node':edge['body_node'],
                        'source_dom_sha256':digest(source.encode('utf-8')) if source is not None else None,
                        'reading_dom_sha256':digest(reading.encode('utf-8')) if reading is not None else None,
                        'copy_text_sha256':edge['copy_text_sha256'],'passed':passed})
        if not passed:issues.append({'id':view['id'],'error':'DOM_COPY_PAYLOAD_MISMATCH','control_node':edge['control_node'],'body_node':edge['body_node']})
    return issues,checked


def offline_sdk_browser(root,views):
    """Reuse inert-view checks; independently parse originals without source JS."""
    from playwright.sync_api import sync_playwright
    issues,checked=offline_sdk_states(root,views)
    by_id={item['id']:item for item in checked}
    for item in checked:item['copy_payloads']=[]
    copying=[view for view in views if view.get('copy_payloads')]
    if not copying:return issues,checked
    server=ThreadingHTTPServer(('127.0.0.1',0),partial(QuietHandler,directory=str(root)))
    thread=threading.Thread(target=server.serve_forever,daemon=True);thread.start()
    origin='http://127.0.0.1:'+str(server.server_port)
    try:
        with sync_playwright() as p:
            browser=p.chromium.launch(channel='msedge',headless=True,chromium_sandbox=True)
            try:
                context=browser.new_context(java_script_enabled=False)
                # This second pass measures native HTML parsing only. Source
                # scripts, CSS, images and all external routes remain blocked.
                context.route('**/*',lambda route:route.continue_() if route.request.resource_type=='document' and route.request.url.startswith(origin+'/') else route.abort())
                page=context.new_page()
                for view in copying:
                    page.goto(origin+'/'+view['source_path'],wait_until='domcontentloaded')
                    source=page.locator('.i-copy-code').evaluate_all('(items)=>items.map(el=>el.closest("table")?.querySelector("td")?.textContent ?? null)')
                    page.goto(origin+'/'+view['reading']['html'],wait_until='domcontentloaded')
                    reading=page.locator('[data-source-node]').evaluate_all('(items)=>Object.fromEntries(items.map(el=>[el.dataset.sourceNode,el.textContent]))')
                    failures,result=copy_payload_checks(view,source,reading);issues.extend(failures)
                    by_id[view['id']]['copy_payloads']=result
            finally:browser.close()
    finally:server.shutdown();server.server_close();thread.join()
    return issues,checked


def pilot_proof_current(store):
    """Return a boolean gate plus reasons; success must bind the actual report."""
    issues=[];relative='SDK/reports/pilot.json'
    try:
        state=read_json(store.root/'_project/STATE.json');sdk=state['modules']['SDK']
        selection=read_json(store.root/'_project/pilot-SDK.json');raw=(store.root/relative).read_bytes();report=json.loads(raw)
        if sdk.get('pilot')!='PASSED' or selection.get('status')!='PASSED' or report.get('status')!='PASSED' or report.get('module')!='SDK' or report.get('mode')!='pilot':
            issues.append('SDK_PILOT_NOT_PASSED')
        if sdk.get('pilot_proof')!={'path':relative,'sha256':digest(raw)} or selection.get('report')!=relative:
            issues.append('SDK_PILOT_REPORT_BINDING_INVALID')
        ids=selection['article_ids']
        if report.get('selected_article_ids')!=ids or len(ids)<5 or len(ids)!=len(set(ids)):
            issues.append('SDK_PILOT_SELECTION_CHANGED')
        catalog={r['id']:r for r in store.records('SDK')}
        documents=[read_json(store.root/catalog[i]['app_data_path']) for i in ids]
        support={r['target_id'] for d in documents for r in d['references'] if r['classification']=='internal' and catalog.get(r.get('target_id'),{}).get('type')!='article'}
        support,styles,failures=support_closure(store,catalog,support)
        if failures:issues.append('SDK_PILOT_SUPPORT_CHANGED')
        if report.get('support_ids')!=sorted(support):issues.append('SDK_PILOT_SUPPORT_SELECTION_CHANGED')
        generation=input_generation(store,catalog,set(ids)|support,documents,styles)
        if report.get('inputs')!=generation:issues.append('SDK_PILOT_INPUTS_CHANGED')
        if report.get('issues') or not all(report.get('formats',{}).get(k) is True for k in ('welcome','substantial_code','parameter_or_field_table','image_bearing','tab_or_expandable')):
            issues.append('SDK_PILOT_EVIDENCE_INCOMPLETE')
    except (OSError,ValueError,KeyError,TypeError) as error:
        issues.append('SDK_PILOT_PROOF_UNAVAILABLE: '+str(error))
    return {'passed':not issues,'report':relative,'issues':issues}


def recovery_check(store,catalog,documents):
    """Rebuild only in a disposable store, including an interrupted atomic write."""
    from unittest.mock import patch
    issues=[];results=[]
    with tempfile.TemporaryDirectory(prefix='scale-sdk-recovery-') as folder:
        clone=Store(Path(folder),cache_records=True)
        for record in catalog.values():clone.save_record(record)
        # Every reference already exists in the catalog. A new discovery is a
        # regression, not permission to create a new authenticated session here.
        def unexpected_discovery(*args,**kwargs):raise ValueError('REPLAY_DISCOVERED_NEW_REFERENCE')
        for record in catalog.values():
            if record['status']=='BODY_SAVED' and (record['type']!='article' or record['id'] in {d['id'] for d in documents}):
                path=clone.root/record['local_path'];path.parent.mkdir(parents=True,exist_ok=True)
                path.write_bytes((store.root/record['local_path']).read_bytes())
        for directory in ('SDK/data/stylesheets','SDK/reading/assets'):
            for path in (store.root/directory).glob('*'):
                if not path.is_file():continue
                target=clone.root/path.relative_to(store.root);target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(path.read_bytes())
        with patch.object(clone,'discover',side_effect=unexpected_discovery):
            for original in documents:
                identifier=original['id'];record=next(r for r in clone.records('SDK') if r['id']==identifier)
                try:
                    adapter.convert(clone,record)
                    first=read_json(clone.root/record['app_data_path'])
                    for key in ('content_tree','content_text','inventory','references','documentary_states','reading'):
                        if first.get(key)!=original.get(key):raise ValueError('REBUILD_DIFFERS_FROM_CAPTURED_'+key.upper())
                    first_hash=digest((clone.root/record['app_data_path']).read_bytes())
                    adapter.convert(clone,record)
                    if digest((clone.root/record['app_data_path']).read_bytes())!=first_hash:raise ValueError('NONDETERMINISTIC_REBUILD')
                    target=clone.root/first['reading']['html'];before=target.read_bytes()
                    with patch('collector.os.replace',side_effect=OSError('Synthetic interrupted atomic replacement')):
                        try:atomic_bytes(target,b'Synthetic incomplete replacement')
                        except OSError:pass
                        else:raise ValueError('INTERRUPTION_NOT_EXERCISED')
                    if target.read_bytes()!=before:raise ValueError('INTERRUPTED_WRITE_CHANGED_VERIFIED_FILE')
                    target.unlink();adapter.convert(clone,record)
                    if target.read_bytes()!=before:raise ValueError('MISSING_DERIVATIVE_RECOVERY_MISMATCH')
                    results.append({'id':identifier,'idempotent':True,'interruption_preserved_prior_bytes':True,'missing_derivative_recovered':True})
                except (OSError,ValueError,KeyError,TypeError) as error:
                    issues.append({'id':identifier,'error':'SDK_REBUILD_OR_RECOVERY_FAILED','detail':str(error)})
    return issues,results


def validate(store,selection,*,pilot=True,browser=None,image_decoder=None,replay=None):
    browser=offline_sdk_browser if browser is None else browser
    image_decoder=decode_images if image_decoder is None else image_decoder
    replay=recovery_check if replay is None else replay
    catalog={r['id']:r for r in store.records('SDK')};ids=selection.get('article_ids',[])
    issues=[];documents=[];views=[];support=set();totals=Counter();formats={key:False for key in
        ('welcome','substantial_code','parameter_or_field_table','image_bearing','tab_or_expandable')}
    if selection.get('module')!='SDK' or len(ids)!=len(set(ids)) or (pilot and len(ids)<5):
        issues.append({'error':'SDK_PILOT_SELECTION_INVALID','selected':len(ids)})
    for identifier in ids:
        record=catalog.get(identifier)
        if not record or record.get('module')!='SDK' or record['type']!='article' or record['status']!='BODY_SAVED':
            issues.append({'id':identifier,'error':'SELECTED_SDK_ARTICLE_NOT_CAPTURED'});continue
        try:
            raw=(store.root/record['local_path']).read_bytes();data=read_json(store.root/record['app_data_path'])
            if digest(raw)!=record['sha256'] or len(raw)!=record['byte_count'] or data['source']['sha256']!=record['sha256']:
                raise ValueError('SOURCE_GENERATION_MISMATCH')
            if data.get('module')!='SDK' or data.get('converter_version')!=adapter.CONVERTER:raise ValueError('SDK_CONVERTER_GENERATION_MISMATCH')
            parser,content,_,title,_=adapter.parse_article(record,raw);inv=adapter.inventory(content)
            parse_check=source_parse_check(store,record,parser,content,data)
            if not parse_check['passed'] or content!=data['content_tree'] or text_of(content)!=data['content_text'] or title!=data['title'] or inv!=data['inventory'] or data.get('source_context')!=adapter.source_context(record,parser,content):
                issues.append({'id':identifier,'error':'SOURCE_TO_APP_FIDELITY_FAILED'})
            failed_checks=converter_check_failures(data,parse_check)
            if failed_checks:
                issues.append({'id':identifier,'error':'CONVERTER_CHECKS_FAILED','checks':data['verification']['checks'],'failed_checks':failed_checks})
            state=adapter.reconcile(content,data['references'],catalog)
            if state!=data.get('documentary_states') or state.get('issues') or state.get('static_relationships_passed') is not True:
                issues.append({'id':identifier,'error':'SDK_DOCUMENTARY_STATE_MAPPING_FAILED','issues':state.get('issues',[])})
            actual=verify_reading(store.root,record,data,content,catalog)
            issues.extend({'id':identifier,'error':'READING_FIDELITY_FAILED',**entry} for entry in actual['errors'])
            for kind in ('html','markdown'):
                if digest((store.root/data['reading'][kind]).read_bytes())!=data['reading'][kind+'_sha256']:
                    issues.append({'id':identifier,'error':'READING_HASH_MISMATCH','format':kind})
            # Compare complete table and code inventories, separately from text.
            view=TreeParser();view.feed((store.root/data['reading']['html']).read_bytes().decode('utf-8'));view.close()
            body=next(n for n in nodes(view.root) if n['tag']=='body');reading=adapter.inventory(body)
            for key in ('tables','code','code_cells'):
                simplify=lambda entries:[{k:v for k,v in entry.items() if k!='node_id'} for entry in entries]
                if simplify(inv[key])!=simplify(reading[key]):issues.append({'id':identifier,'error':'EXACT_'+key.upper()+'_MISMATCH'})
            for ref in data['references']:
                category=ref['classification'];target=catalog.get(ref.get('target_id'))
                if category=='same_document' and ref.get('fragment') and not fragment_supported(ref['fragment'],inv['anchors']):
                    issues.append({'id':identifier,'error':'MISSING_SAME_DOCUMENT_ANCHOR','fragment':ref['fragment']})
                elif category=='internal':
                    if not target:issues.append({'id':identifier,'error':'UNMAPPED_INTERNAL_REFERENCE'});continue
                    if target['type']=='article':
                        if target['id'] not in ids:totals['topic_links_outside_selected_scope']+=1
                        elif ref.get('fragment'):
                            target_data=read_json(store.root/target['app_data_path'])
                            if not fragment_supported(ref['fragment'],target_data['inventory']['anchors']):
                                issues.append({'id':identifier,'error':'SELECTED_TOPIC_ANCHOR_MISSING','target_id':target['id'],'fragment':ref['fragment']})
                    else:support.add(target['id'])
                elif category=='classification_required':issues.append({'id':identifier,'error':'UNCLASSIFIED_REFERENCE'})
                elif category=='deferred_cross_module':totals['cross_module_links_deferred']+=1
                elif category=='out_of_scope_reference':
                    if required_external_reference(ref,{n['node_id']:n for n in nodes(parser.root)}):
                        issues.append({'id':identifier,'error':'REQUIRED_DEPENDENCY_OUTSIDE_SCOPE'})
            edges=state.get('control_body_edges',[])
            variants=sorted({v['node_id'] for v in inv['variants']}|{edge['body_node'] for edge in edges if edge.get('body_node')})
            views.append({'id':identifier,'source_sha256':record['sha256'],'source_path':record['local_path'],
                          'reading':data['reading'],'variant_nodes':variants,
                          'empty_source_states':empty_state_descriptors(content,variants,edges),
                          'copy_payloads':[{k:edge[k] for k in ('control_node','body_node','copy_text','copy_text_sha256')} for edge in edges if edge['kind']=='copy_code']})
            documents.append(data);totals.update(articles=1,tables=len(inv['tables']),code_blocks=len(inv['code']),images=inv['tags'].get('img',0),documentary_states=len(variants))
            formats['welcome']|=urlsplit(record['source_url']).path.endswith('/Welcome.html')
            formats['substantial_code']|=any(len(c['text'])>=200 and len(c['text'].splitlines())>=4 for c in inv['code'])
            formats['parameter_or_field_table']|=any(t['rows'] and len(t['rows'][0])>=2 and re.search(r'parameter|property|field', ' '.join(c['text'] for c in t['rows'][0]),re.I) is not None for t in inv['tables'])
            formats['image_bearing']|=inv['tags'].get('img',0)>0
            formats['tab_or_expandable']|=any(edge['kind'] in ('section','language_tab') for edge in edges)
        except (OSError,ValueError,KeyError,TypeError,StopIteration) as error:
            issues.append({'id':identifier,'error':'SDK_ARTICLE_VERIFICATION_FAILED','detail':str(error)})
    support,styles,css_issues=support_closure(store,catalog,support);issues.extend(css_issues)
    attachments=[];images=[];integrity=[]
    for identifier in sorted(set(ids)|support):
        record=catalog.get(identifier)
        if not record or record['status']!='BODY_SAVED':continue
        try:
            raw=(store.root/record['local_path']).read_bytes()
            if digest(raw)!=record['sha256'] or len(raw)!=record['byte_count'] or not record.get('transport_metadata_verified') or record.get('http_status')!=200:
                raise ValueError('Source hash, length or transport proof mismatch')
            integrity.append(identifier)
            if record['type']=='image':images.append(record)
            if record['type']=='attachment':
                check=attachment_check(record,raw);attachments.append(check)
                if not check['passed']:issues.append({'id':identifier,'error':'ATTACHMENT_FORMAT_FAILED'})
        except (OSError,ValueError,KeyError,TypeError) as error:
            issues.append({'id':identifier,'error':'SDK_RESOURCE_INTEGRITY_FAILED','detail':str(error)})
    try:before=input_generation(store,catalog,set(ids)|support,documents,styles)
    except (OSError,ValueError,KeyError,TypeError) as error:
        before=None;issues.append({'error':'SDK_INPUT_GENERATION_FAILED','detail':str(error)})
    evidence={}
    for name,run,args in (('browser',browser,(store.root,views)),('images',image_decoder,(store.root,images)),('recovery',replay,(store,catalog,documents))):
        try:
            failures,results=run(*args);issues.extend(failures);evidence[name]=results
        except Exception as error:
            issues.append({'error':'SDK_'+name.upper()+'_CHECK_FAILED','detail':type(error).__name__+': '+str(error)})
            evidence[name]=[]
    for name,expected in (('browser',views),('images',images),('recovery',documents)):
        actual_ids=[r['id'] for r in evidence[name]]
        if sorted(actual_ids)!=sorted(r['id'] for r in expected):
            issues.append({'error':'SDK_'+name.upper()+'_EVIDENCE_INCOMPLETE'})
    browser_by_id={item['id']:item for item in evidence['browser']}
    for view in views:
        expected=[(e['control_node'],e['body_node'],e['copy_text_sha256']) for e in view['copy_payloads']]
        payloads=browser_by_id.get(view['id'],{}).get('copy_payloads',[])
        actual=[(e.get('control_node'),e.get('body_node'),e.get('copy_text_sha256')) for e in payloads]
        if actual!=expected or any(e.get('passed') is not True or e.get('source_dom_sha256')!=e.get('copy_text_sha256') or e.get('reading_dom_sha256')!=e.get('copy_text_sha256') for e in payloads):
            issues.append({'id':view['id'],'error':'SDK_COPY_PAYLOAD_EVIDENCE_INCOMPLETE'})
    try:
        if before!=input_generation(store,catalog,set(ids)|support,documents,styles):issues.append({'error':'SDK_INPUTS_CHANGED_DURING_VERIFICATION'})
    except (OSError,ValueError,KeyError,TypeError):issues.append({'error':'SDK_INPUTS_UNAVAILABLE_AFTER_VERIFICATION'})
    if pilot and not all(formats.values()):issues.append({'error':'SDK_PILOT_FORMAT_COVERAGE','checks':formats})
    if not ids:issues.append({'error':'NO_SDK_ARTICLES_SELECTED'})
    return {'checked_at':now(),'module':'SDK','mode':'pilot' if pilot else 'captured_fidelity','status':'PASSED' if not issues else 'FAILED',
        'converter_version':adapter.CONVERTER,'selected_article_ids':ids,'counts':dict(totals),'formats':formats,'resources':views,
        'support_ids':sorted(support),'originals_verified':integrity,'attachments':attachments,'inputs':before,**evidence,'issues':issues,
        'module_local_complete':False,'scope':'Selected SDK originals, reading files, required support and documentary states only. Pilot success permits full SDK acquisition; discovery, corpus-wide links, visual review and final delivery remain separate gates.'}


def main(mode='pilot'):
    root=Path(__file__).resolve().parents[1];runtime=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'
    with writer_lock(root,runtime) as owner:
        store=Store(root,cache_records=True)
        from module_policy import require_sdk_ready
        require_sdk_ready(root)
        selection=read_json(root/'_project/pilot-SDK.json') if mode=='pilot' else {'module':'SDK','article_ids':[r['id'] for r in store.records('SDK') if r['type']=='article' and r['status']=='BODY_SAVED']}
        store.checkpoint(owner,phase='SDK_PILOT_VERIFICATION' if mode=='pilot' else 'SDK_FIDELITY_VERIFICATION',worker_running=True)
        try:report=validate(store,selection,pilot=mode=='pilot')
        except BaseException:
            store.checkpoint(owner,phase='SDK_VERIFICATION_INTERRUPTED',blockers=[{'code':'SDK_VERIFICATION_INTERRUPTED','detail':'No new verification result was granted; resume from saved SDK records.'}],worker_running=False)
            raise
        relative='SDK/reports/'+('pilot.json' if mode=='pilot' else 'captured-fidelity.json')
        atomic_json(root/relative,report)
        state=read_json(root/'_project/STATE.json');sdk=state['modules']['SDK']
        if mode=='pilot':
            sdk['pilot']=report['status'];sdk['status']='CAPTURE_READY' if report['status']=='PASSED' else 'PILOT_REPAIR_REQUIRED'
            sdk['pilot_proof']={'path':relative,'sha256':digest((root/relative).read_bytes())}
            selection.update(status=report['status'],report=relative);atomic_json(root/'_project/pilot-SDK.json',selection)
        state.setdefault('publication',{}).update(current_local_changes_pending_publication=True,current_checkpoint_clean_clone_verified=False)
        atomic_json(root/'_project/STATE.json',state)
        blockers=[] if report['status']=='PASSED' else [{'code':'SDK_PILOT_FIDELITY_GAPS' if mode=='pilot' else 'SDK_FIDELITY_GAPS','report':relative,'issues':len(report['issues'])}]
        store.checkpoint(owner,phase='SDK_CAPTURE_READY' if mode=='pilot' and not blockers else ('SDK_PILOT_REPAIR_REQUIRED' if mode=='pilot' else 'SDK_FIDELITY_AUDITED'),blockers=blockers,worker_running=False)
        print(json.dumps({'status':report['status'],'counts':report['counts'],'formats':report['formats'],'issues':report['issues']}),flush=True)
    return 0 if report['status']=='PASSED' else 1


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--mode',choices=('pilot','captured'),default='pilot')
    raise SystemExit(main(parser.parse_args().mode))
