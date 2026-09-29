"""Audit SDK closure offline; acquisition permission never waives source fidelity.

This command writes SDK reports/record flags and shared state only. AIM sources,
derivatives, manifests and historical acceptance proofs remain untouched.
"""
from collections import Counter
from functools import lru_cache
import json
import os
from pathlib import Path
import re
import tempfile
from types import SimpleNamespace
from urllib.parse import unquote,urlsplit
from collector import Store,read_json,atomic_json,atomic_bytes,digest,writer_lock,now,source_identity
from article_data import nodes,text_of,TreeParser
import sdk_article_data as sdk
import verify_sdk
from sdk_state_visibility import empty_state_descriptors,state_visibility_passed
from discover_sdk import discovery_proof,parse_navigation
from sdk_link_semantics import required_external_reference,fragment_supported
from attachment_closure import attachment_dependency_proof

SHELL_URL='https://travstg.manhscale.com/SCALEHelp/SDK/webframe.html'
SHELL_SHA256='cec0eaf854ba374233abc83e1ceb8f8bc94d389def044e59ec4f37cb3d2700bc'
SHELL_RUNTIME_URL='https://travstg.manhscale.com/SCALEHelp/SDK/template/packages/core-web/script/navigation.min.js'
SHELL_RUNTIME_SHA256='a45797f01ef3ece662e53d2b17b304f0c670f3b74033a59848e5ed0f0f36b5a7'
SHELL_ROUTING_STATEMENTS=(
    'this.navigate(this.getDefaultTopic())',
    'null!=window.location.hash&&window.location.hash.length>0&&(e=window.location.hash.substring(1))',
    '$("#i-content",this._rootSelector).attr("src",e)')


def local(root,relative):
    path=(root/relative).resolve()
    if not path.is_relative_to(root.resolve()):raise ValueError('PATH_OUTSIDE_REPOSITORY')
    return path


def original(store,record):
    if record['status']!='BODY_SAVED':raise ValueError('SOURCE_NOT_CAPTURED: '+record['status'])
    raw=local(store.root,record['local_path']).read_bytes()
    if record['status']!='BODY_SAVED' or digest(raw)!=record['sha256'] or len(raw)!=record['byte_count']:
        raise ValueError('ORIGINAL_GENERATION_MISMATCH')
    if not record.get('transport_metadata_verified') or record.get('http_status')!=200:
        raise ValueError('TRANSPORT_PROOF_MISSING')
    return raw


def shell_topic_route(store,record,fragment,catalog):
    """Interpret the exact captured SDK shell's published topic-route fragment."""
    if record.get('source_url')!=SHELL_URL or fragment!='Welcome.html':return None
    raw=original(store,record)
    if digest(raw)!=SHELL_SHA256:raise ValueError('SDK_SHELL_ROUTING_SOURCE_UNVERIFIED')
    parser,_=parse_navigation(record,raw)
    source=list(nodes(parser.root))
    if not any(n['tag']=='iframe' and n['attrs'].get('id')=='i-content' and n['attrs'].get('name')=='i-content' for n in source):
        raise ValueError('SDK_SHELL_CONTENT_FRAME_UNVERIFIED')
    if not any(n['tag']=='script' and n['attrs'].get('src')=='template/packages/core-web/script/navigation.min.js' for n in source):
        raise ValueError('SDK_SHELL_ROUTING_SCRIPT_UNVERIFIED')
    runtime=next((r for r in catalog.values() if r['source_url']==SHELL_RUNTIME_URL and r['type']=='script'),None)
    if runtime is None:raise ValueError('SDK_SHELL_ROUTING_RUNTIME_MISSING')
    runtime_raw=original(store,runtime)
    if digest(runtime_raw)!=SHELL_RUNTIME_SHA256:raise ValueError('SDK_SHELL_ROUTING_RUNTIME_UNVERIFIED')
    script=runtime_raw.decode('utf-8-sig')
    if not all(statement in script for statement in SHELL_ROUTING_STATEMENTS):
        raise ValueError('SDK_SHELL_ROUTING_SEMANTICS_UNVERIFIED')
    # The shell assigns the literal hash suffix to the content iframe URL.
    # Do not treat that suffix as an element ID or infer an article alias.
    identity=source_identity(fragment,SHELL_URL)
    if identity['module']!='SDK' or catalog.get(identity['id'],{}).get('type')!='article':
        raise ValueError('SDK_SHELL_TOPIC_NOT_IN_CAPTURED_ARTICLE_CATALOG')
    return {'topic_id':identity['id'],'topic_fragment':identity['fragment'],
            'evidence':{'shell_id':record['id'],'shell_sha256':SHELL_SHA256,
                'runtime_id':runtime['id'],'runtime_sha256':SHELL_RUNTIME_SHA256,
                'route_literal':fragment,'resolved_url':identity['url'],
                'method':'Published TopFrame hash suffix is the content iframe URL.',
                'statements':list(SHELL_ROUTING_STATEMENTS)}}


def capture_proof(store,catalog):
    """Recompute the complete bound input set; a PASSED word is insufficient."""
    relative='SDK/reports/captured-fidelity.json';issues=[];report={}
    try:
        raw=local(store.root,relative).read_bytes();report=json.loads(raw)
        ids=sorted(r['id'] for r in catalog.values() if r['type']=='article' and r['status']=='BODY_SAVED')
        if report.get('module')!='SDK' or report.get('mode')!='captured_fidelity' or sorted(report.get('selected_article_ids',[]))!=ids:
            issues.append('CAPTURED_SELECTION_MISMATCH')
        if len(report.get('selected_article_ids',[]))!=len(set(ids)):issues.append('CAPTURED_SELECTION_DUPLICATE')
        documents=[read_json(local(store.root,catalog[i]['app_data_path'])) for i in ids]
        support={r['target_id'] for d in documents for r in d['references'] if r['classification']=='internal' and catalog.get(r.get('target_id'),{}).get('type')!='article'}
        support,styles,_=verify_sdk.support_closure(store,catalog,support)
        current=verify_sdk.input_generation(store,catalog,set(ids)|support,documents,styles)
        if report.get('inputs')!=current or report.get('support_ids')!=sorted(support):issues.append('CAPTURED_INPUTS_CHANGED')
        for key in ('resources','browser','recovery'):
            actual=[item['id'] for item in report.get(key,[])]
            if sorted(actual)!=ids:issues.append('CAPTURED_'+key.upper()+'_EVIDENCE_INCOMPLETE')
        if report.get('converter_version')!=sdk.CONVERTER:issues.append('CAPTURED_CONVERTER_MISMATCH')
        if any(item.get('error') in {'SDK_INPUTS_CHANGED_DURING_VERIFICATION','SDK_INPUTS_UNAVAILABLE_AFTER_VERIFICATION'} for item in report.get('issues',[])):
            issues.append('CAPTURED_RUN_INPUTS_WERE_UNSTABLE')
        return {'current':not issues,'path':relative,'sha256':digest(raw),'issues':issues,'report':report}
    except (OSError,ValueError,KeyError,TypeError) as error:
        return {'current':False,'path':relative,'issues':['CAPTURED_PROOF_UNAVAILABLE: '+str(error)],'report':report}


def browser_article(proof,identifier,variants,edges,empty_source_states=()):
    if not proof['current']:return False
    report=proof['report'];view=next((r for r in report['browser'] if r['id']==identifier),{})
    recovery=next((r for r in report['recovery'] if r['id']==identifier),{})
    expected=[(e['control_node'],e['body_node'],e['copy_text_sha256']) for e in edges if e['kind']=='copy_code']
    payloads=view.get('copy_payloads',[])
    if [(e.get('control_node'),e.get('body_node'),e.get('copy_text_sha256')) for e in payloads]!=expected:return False
    if any(e.get('passed') is not True or e.get('source_dom_sha256')!=e.get('copy_text_sha256') or e.get('reading_dom_sha256')!=e.get('copy_text_sha256') for e in payloads):return False
    blocking={'DOCUMENTARY_STATE_HIDDEN','EMPTY_DOCUMENTARY_STATE_NOT_PRESERVED','DOCUMENTARY_STATE_NODE_MISSING_OR_DUPLICATED','DOM_COPY_PAYLOAD_MISMATCH','SOURCE_COPY_CONTROL_COUNT_MISMATCH','ACTIVE_VIEW_CONTENT','EXTERNAL_REQUEST_ATTEMPTED'}
    if any(i.get('error') in blocking and i.get('id',identifier)==identifier for i in report.get('issues',[])):return False
    return (state_visibility_passed(view,variants,empty_source_states) and view.get('active_elements')==0 and
            all(recovery.get(k) is True for k in ('idempotent','interruption_preserved_prior_bytes','missing_derivative_recovered')))


def resource_proof(store,catalog):
    issues=[];verified=[];report={};relative='SDK/reports/resource-fidelity.json'
    try:
        raw=local(store.root,relative).read_bytes();report=json.loads(raw)
        current=(report.get('module')=='SDK' and report.get('verification_code_sha256')==digest((store.root/'tools/verify_sdk.py').read_bytes()) and
                 report.get('resource_verifier_sha256')==digest((store.root/'tools/verify_sdk_resources.py').read_bytes()))
        if not current:issues.append({'error':'RESOURCE_VERIFIER_CHANGED'})
    except (OSError,ValueError,TypeError) as error:
        current=False;issues.append({'error':'RESOURCE_PROOF_UNAVAILABLE','detail':str(error)})
    images={r['id']:r for r in report.get('images',[])};attachments={r['id']:r for r in report.get('attachments',[])}
    saved_images={r['id'] for r in catalog.values() if r['type']=='image' and r['status']=='BODY_SAVED'}
    if len(images)!=len(report.get('images',[])) or set(images)!=saved_images:
        current=False;issues.append({'error':'RESOURCE_IMAGE_EVIDENCE_SET_MISMATCH'})
    for record in catalog.values():
        if record['type']=='article' or record['status']=='INVALID_RESOLUTION':continue
        errors=[]
        try:
            body=original(store,record)
            if not current:errors.append('RESOURCE_PROOF_NOT_CURRENT')
            if record['type']=='image':
                item=images.get(record['id'],{})
                if item.get('sha256')!=record['sha256'] or item.get('decoded') is not True or not item.get('width') or not item.get('height'):errors.append('IMAGE_DECODE_PROOF_MISSING_OR_STALE')
            elif record['type']=='attachment':
                item=verify_sdk.attachment_check(record,body)
                if item!=attachments.get(record['id']) or not item['passed']:errors.append('ATTACHMENT_PROOF_MISSING_OR_STALE')
            elif record['type']=='stylesheet':
                _,_,failed=verify_sdk.support_closure(store,catalog,{record['id']})
                if failed:errors.append('CSS_CLOSURE_INCOMPLETE')
        except (OSError,ValueError,KeyError,TypeError) as error:errors.append(str(error))
        if errors:issues.append({'id':record['id'],'errors':errors})
        else:verified.append(record['id'])
    if report.get('issues'):issues.append({'error':'RESOURCE_VERIFICATION_REPORTED_ISSUES','issues':report['issues']})
    return {'passed':not issues,'current':current,'verified_ids':verified,'issues':issues,
            'path':relative,'sha256':digest(local(store.root,relative).read_bytes()) if local(store.root,relative).is_file() else None}


def document_check(store,record,catalog):
    """Source replay plus exact reading comparisons; never update app JSON."""
    errors=[];data={};content=None
    try:
        body=original(store,record);data=read_json(local(store.root,record['app_data_path']))
        if record['module']=='SDK':
            parser,content,_,title,_=sdk.parse_article(record,body);inv=sdk.inventory(content)
            parse_check=verify_sdk.source_parse_check(store,record,parser,content,data)
            if data.get('source_context')!=sdk.source_context(record,parser,content):errors.append('SOURCE_CONTEXT_METADATA_MISMATCH')
            if data.get('converter_version')!=sdk.CONVERTER:errors.append('CONVERTER_GENERATION_MISMATCH')
            reading=verify_sdk.verify_reading(store.root,record,data,content,catalog)
        else:
            from article_data import parse_article,inventory
            from reading_audit import verify_reading
            parser,content,_,title,_=parse_article(record,body);inv=inventory(content)
            parse_check={'passed':not parser.errors,'native_equivalence_verified':False}
            reading=verify_reading(store.root,record,data,content,catalog)
        if not parse_check['passed'] or data['source']['sha256']!=record['sha256'] or content!=data['content_tree'] or text_of(content)!=data['content_text'] or title!=data['title'] or inv!=data['inventory']:
            errors.append('SOURCE_TO_APP_FIDELITY_FAILED')
        if not reading['passed']:errors.append('READING_FIDELITY_FAILED')
        for kind in ('html','markdown'):
            if digest(local(store.root,data['reading'][kind]).read_bytes())!=data['reading'][kind+'_sha256']:errors.append('READING_HASH_MISMATCH')
        if record['module']=='SDK':
            view=TreeParser();view.feed(local(store.root,data['reading']['html']).read_bytes().decode('utf-8'));view.close()
            reading_inv=sdk.inventory(next(n for n in nodes(view.root) if n['tag']=='body'))
            simplify=lambda values:[{k:v for k,v in item.items() if k!='node_id'} for item in values]
            for key in ('tables','code','code_cells'):
                if simplify(inv[key])!=simplify(reading_inv[key]):errors.append('EXACT_'+key.upper()+'_MISMATCH')
            state=sdk.reconcile(content,data['references'],catalog)
            if state!=data.get('documentary_states') or state.get('issues') or state.get('static_relationships_passed') is not True:errors.append('DOCUMENTARY_RELATIONSHIPS_FAILED')
            for key in verify_sdk.converter_check_failures(data,parse_check,ignore=('direct_assets_available',)):
                errors.append('CONVERTER_'+key.upper())
        return {'passed':not errors,'errors':errors,'data':data,'source_nodes':{n['node_id']:n for n in nodes(parser.root)}}
    except (OSError,ValueError,KeyError,TypeError,StopIteration) as error:
        return {'passed':False,'errors':errors+['DOCUMENT_CHECK_FAILED: '+str(error)],'data':data,'source_nodes':{}}


def link_checker(store,catalogs,documents):
    @lru_cache(None)
    def target(module,identifier,fragment):
        record=catalogs[module].get(identifier)
        if not record:return 'UNRESOLVED_TARGET_NOT_DISCOVERED'
        if record['status']!='BODY_SAVED':return 'UNRESOLVED_TARGET_NOT_CAPTURED'
        try:
            raw=original(store,record)
            if record['type']=='article':
                check=documents.get(identifier)
                if check is None:check=document_check(store,record,catalogs[module]);documents[identifier]=check
                if not check['passed']:return 'UNRESOLVED_TARGET_READING_FIDELITY'
                if fragment and not fragment_supported(fragment,check['data']['inventory']['anchors']):return 'UNRESOLVED_TARGET_FRAGMENT'
            elif fragment and record['type']=='navigation':
                route=shell_topic_route(store,record,fragment,catalogs[module]) if module=='SDK' else None
                if route:return target('SDK',route['topic_id'],route['topic_fragment'])
                parser,_=parse_navigation(record,raw)
                anchors={n['attrs'].get('id') for n in nodes(parser.root)}|{n['attrs'].get('name') for n in nodes(parser.root) if n['tag']=='a'}
                if not fragment_supported(fragment,anchors):return 'UNRESOLVED_NAVIGATION_FRAGMENT'
            return 'VERIFIED'
        except (OSError,ValueError,KeyError,TypeError):return 'UNRESOLVED_TARGET_INTEGRITY'
    def check(ref,module):
        classification=ref['classification']
        if classification=='same_document':return target(module,ref['source_id'],ref.get('fragment',''))
        if classification=='internal':return target(module,ref.get('target_id'),ref.get('fragment',''))
        if classification=='deferred_cross_module':
            try:
                identity=source_identity(ref.get('resolved_url') or ref['original_href'],ref.get('effective_base') or catalogs[module][ref['source_id']]['source_url'])
                if identity['module']==module or identity['id']!=ref.get('target_id'):return 'UNRESOLVED_CROSS_MODULE_IDENTITY'
                return target(identity['module'],identity['id'],identity['fragment'])
            except (ValueError,KeyError,TypeError):return 'UNRESOLVED_CROSS_MODULE_IDENTITY'
        if classification=='classification_required':return 'UNRESOLVED_CLASSIFICATION'
        return 'EDITORIAL_OR_INERT_REFERENCE'
    return check


def navigation_proof(store,catalog,check):
    """Replay the reading index builder in temp storage and check every target."""
    import build_sdk_navigation
    issues=[];files=[];links=[];shell_routes=[]
    try:
        with tempfile.TemporaryDirectory(prefix='sdk-navigation-audit-') as folder:
            root=Path(folder)
            for name in ('toc','index','discovery-membership'):
                relative='SDK/manifests/'+name+'.json';path=root/relative;path.parent.mkdir(parents=True,exist_ok=True)
                path.write_bytes(local(store.root,relative).read_bytes())
            build_sdk_navigation.build(SimpleNamespace(root=root,records=lambda module:list(catalog.values())))
            for relative in ('SDK/docs/INDEX.md','SDK/reading/index.html','SDK/reports/local-navigation.json'):
                expected=(root/relative).read_bytes();actual=local(store.root,relative).read_bytes()
                if actual!=expected:issues.append({'error':'LOCAL_NAVIGATION_REPLAY_MISMATCH','path':relative})
                files.append({'path':relative,'sha256':digest(actual)})
                if relative.endswith('.html'):
                    parser=TreeParser();parser.feed(actual.decode('utf-8'));parser.close()
                    hrefs=[n['attrs']['href'] for n in nodes(parser.root) if n['tag']=='a' and n['attrs'].get('href')]
                elif relative.endswith('.md'):hrefs=re.findall(r'\]\(([^)]+)\)',actual.decode('utf-8'))
                else:hrefs=[]
                for href in hrefs:
                    parts=urlsplit(href)
                    target=(local(store.root,relative).parent/unquote(parts.path)).resolve()
                    if parts.scheme or not target.is_relative_to(store.root) or not target.is_file():
                        issues.append({'error':'LOCAL_NAVIGATION_TARGET_MISSING','path':relative,'href':href})
                    elif parts.fragment:
                        tree=TreeParser();tree.feed(target.read_bytes().decode('utf-8'));tree.close()
                        anchors={n['attrs'].get('id') for n in nodes(tree.root)}|{n['attrs'].get('name') for n in nodes(tree.root) if n['tag']=='a'}
                        if not fragment_supported(parts.fragment,anchors):issues.append({'error':'LOCAL_NAVIGATION_FRAGMENT_MISSING','path':relative,'href':href})
        refs=read_json(store.root/'SDK/manifests/navigation-references.json')
        for ref in refs:
            result=check(ref,'SDK');links.append({'source_id':ref['source_id'],'node_id':ref['node_id'],'original_href':ref['original_href'],'target_id':ref.get('target_id'),'fragment':ref.get('fragment',''),'result':result})
            if result.startswith('UNRESOLVED'):issues.append({'error':'NAVIGATION_REFERENCE_GAP',**links[-1]})
        # Source occurrences include TOC bookmarks even if a navigation ref
        # points only to the article; validate each distinct published occurrence.
        for record in catalog.values():
            for occurrence in record.get('occurrences',[]):
                fragment=occurrence.get('fragment') or occurrence.get('bookmark') or ''
                if fragment:
                    ref={'classification':'internal','source_id':occurrence.get('source_id'),'target_id':record['id'],'fragment':fragment}
                    result=check(ref,'SDK')
                    if record['type']=='navigation':
                        route=shell_topic_route(store,record,fragment,catalog)
                        if route:shell_routes.append({**route,'result':result})
                    if result!='VERIFIED':issues.append({'error':'NAVIGATION_OCCURRENCE_FRAGMENT_GAP','id':record['id'],'fragment':fragment,'result':result})
    except (OSError,ValueError,KeyError,TypeError) as error:issues.append({'error':'LOCAL_NAVIGATION_PROOF_UNAVAILABLE','detail':str(error)})
    return {'passed':not issues,'issues':issues,'files':files,'links':links,'shell_topic_routes':shell_routes}


def visual_proof(store,capture,documents):
    """Supplementary sampling is bound to captured inputs and screenshot bytes."""
    try:
        raw=(store.root/'SDK/reports/visual-review.json').read_bytes();report=json.loads(raw)
        passed=(capture['current'] and report.get('status')=='PASSED' and report.get('inputs')==capture['report'].get('inputs'))
        formats=set()
        for generation in report.get('generations',[]):
            data=documents[generation['id']]['data']
            passed=passed and generation['source_sha256']==data['source']['sha256'] and generation['reading_sha256']==data['reading']['html_sha256']
            if data['inventory']['code']:formats.add('code')
            if data['inventory']['tables']:formats.add('table')
            if data['inventory']['tags'].get('img'):formats.add('image')
            if data['documentary_states']['control_body_edges']:formats.add('documentary_state')
        screenshots=report.get('screenshots',[])
        passed=bool(passed and screenshots and formats=={'code','table','image','documentary_state'})
        for shot in screenshots:passed=passed and digest(local(store.root,shot['path']).read_bytes())==shot['sha256']
        return {'passed':bool(passed),'path':'SDK/reports/visual-review.json','sha256':digest(raw)}
    except (OSError,ValueError,KeyError,TypeError):return {'passed':False,'error':'SDK_VISUAL_PROOF_MISSING_OR_STALE'}


def audit(store,persist=True):
    catalogs={m:{r['id']:r for r in store.records(m)} for m in ('AIM','SDK')};catalog=catalogs['SDK']
    required=[r for r in catalog.values() if r['status']!='INVALID_RESOLUTION'];articles=[r for r in required if r['type']=='article']
    captured=capture_proof(store,catalog);resources=resource_proof(store,catalog);discovery=discovery_proof(store)
    attachment_dependencies=attachment_dependency_proof(store)
    discovery_reconciled=discovery['passed'] and attachment_dependencies['passed']
    verified_resources=set(resources['verified_ids']);documents={};article_results=[];links=[];cross=[]
    for record in articles:
        documents[record['id']]=document_check(store,record,catalog) if record['status']=='BODY_SAVED' else {'passed':False,'errors':['SOURCE_NOT_CAPTURED'],'data':{},'source_nodes':{}}
    check_link=link_checker(store,catalogs,documents)
    for record in articles:
        check=documents[record['id']];data=check['data'];errors=list(check['errors']);link_errors=[];support_errors=[]
        variants=set();state_ok=False
        if data.get('inventory'):
            variants={v['node_id'] for v in data['inventory']['variants']}|{e['body_node'] for e in data.get('documentary_states',{}).get('control_body_edges',[]) if e.get('body_node')}
        if check['passed']:
            edges=data['documentary_states']['control_body_edges']
            variants={v['node_id'] for v in data['inventory']['variants']}|{e['body_node'] for e in edges if e.get('body_node')}
            state_ok=browser_article(captured,record['id'],variants,edges,empty_state_descriptors(data['content_tree'],sorted(variants),edges))
            if not state_ok:errors.append('BROWSER_STATE_OR_RECOVERY_PROOF_MISSING_OR_STALE')
        for ref in data.get('references',[]):
            if ref['classification']=='deferred_cross_module':continue
            result=check_link(ref,'SDK')
            if ref['classification']=='out_of_scope_reference' and required_external_reference(ref,check['source_nodes']):result='UNRESOLVED_REQUIRED_DEPENDENCY_OUTSIDE_SCOPE'
            row={k:ref.get(k) for k in ('source_id','node_id','attribute','original_href','target_id','fragment','classification')};row['result']=result;links.append(row)
            if result.startswith('UNRESOLVED'):link_errors.append(row)
            if ref['classification']=='internal' and catalog.get(ref.get('target_id'),{}).get('type')!='article' and ref.get('target_id') not in verified_resources:support_errors.append(ref.get('target_id'))
        complete=not errors and not link_errors and not support_errors
        article_results.append({'id':record['id'],'structural_reading_verified':check['passed'],'documentary_states_verified':state_ok,
            'reading_copy_verified':not errors and not support_errors,'intra_module_links_verified':not link_errors and check['passed'],
            'article_local_complete':complete,'variant_count':len(variants),'errors':errors,'link_issues':link_errors,'support_issues':sorted(set(support_errors))})
        if persist:
            record.update(reading_copy_verified=not errors and not support_errors,intra_module_links_verified=not link_errors and check['passed'],article_local_complete=complete)
            store.save_record(record)
    # Reconcile both directions in a new SDK report; do not edit AIM derivatives.
    for module in ('AIM','SDK'):
        for record in catalogs[module].values():
            if record['type']!='article' or record['status']!='BODY_SAVED' or not record.get('app_data_path'):continue
            try:
                data=read_json(local(store.root,record['app_data_path']))
                refs=[r for r in data['references'] if r['classification']=='deferred_cross_module']
                if not refs:continue
                source_check=documents.get(record['id']) or document_check(store,record,catalogs[module]);documents[record['id']]=source_check
                for ref in refs:
                    result=check_link(ref,module) if source_check['passed'] else 'UNRESOLVED_SOURCE_REFERENCE_FIDELITY'
                    target_data=documents.get(ref.get('target_id'),{}).get('data',{})
                    cross.append({'source_module':module,**{k:ref.get(k) for k in ('source_id','node_id','attribute','original_href','resolved_url','target_id','fragment')},
                        'source_sha256':record.get('sha256'),'target_source_sha256':target_data.get('source',{}).get('sha256'),
                        'target_reading_sha256':target_data.get('reading',{}).get('html_sha256'),'result':result,'was_deferred_cross_module':True})
            except (OSError,ValueError,KeyError,TypeError) as error:cross.append({'source_module':module,'source_id':record['id'],'result':'UNRESOLVED_CROSS_MODULE_INVENTORY','detail':str(error)})
    navigation=navigation_proof(store,catalog,check_link);visual=visual_proof(store,captured,documents)
    integrity=store.verify(module='SDK');pilot=verify_sdk.pilot_proof_current(store)
    gates={'pilot_verified':pilot['passed'],'discovery_reconciled':discovery_reconciled,
        'attachment_dependencies_closed':attachment_dependencies['passed'],
        'required_originals_captured':bool(articles) and all(r['status']=='BODY_SAVED' for r in required),
        'original_integrity':integrity['local_integrity_passed'],'resource_fidelity':resources['passed'],
        'captured_proof_current':captured['current'],'all_articles_verified':bool(articles) and all(r['article_local_complete'] for r in article_results),
        'local_navigation':navigation['passed'],'representative_visual_review':visual['passed']}
    complete=all(gates.values());cross_passed=all(r['result']=='VERIFIED' for r in cross)
    status='CORPUS_COMPLETE' if complete and cross_passed else ('MODULE_LOCAL_COMPLETE' if complete else ('DISCOVERY_INCOMPLETE' if not discovery_reconciled else 'FIDELITY_VERIFICATION_INCOMPLETE'))
    counts={'articles':{'known':len(articles),'originals_saved':sum(r['status']=='BODY_SAVED' for r in articles),
        'structurally_verified':sum(r['structural_reading_verified'] for r in article_results),'reading_verified':sum(r['reading_copy_verified'] for r in article_results),'locally_verified':sum(r['article_local_complete'] for r in article_results)},
        'variants':{'known':sum(r['variant_count'] for r in article_results),'verified':sum(r['variant_count'] for r in article_results if r['documentary_states_verified'])},
        'internal_links':dict(Counter(r['result'] for r in links if r['classification'] in ('internal','same_document'))),
        'cross_module_links':dict(Counter(r['result'] for r in cross))}
    internal=[r for r in links if r['classification'] in ('internal','same_document')]
    nav_links=[r for r in navigation['links'] if r['result']!='EDITORIAL_OR_INERT_REFERENCE']
    counts['internal_links'].update(known=len(internal)+len(nav_links),verified=sum(r['result']=='VERIFIED' for r in internal+nav_links),
                                    article_occurrences=len(internal),navigation_occurrences=len(nav_links))
    counts['cross_module_links'].update(known=len(cross),verified=sum(r['result']=='VERIFIED' for r in cross),deferred=0)
    for name,types in (('assets',{'image','stylesheet','font','video'}),('attachments',{'attachment'}),('navigation',{'navigation'}),('scripts',{'script'})):
        subset=[r for r in required if r['type'] in types];counts[name]={'known':len(subset),'originals_saved':sum(r['status']=='BODY_SAVED' for r in subset),'verified':sum(r['id'] in verified_resources for r in subset)}
    report={'checked_at':now(),'module':'SDK','status':status,'module_local_complete':complete,'corpus_complete':complete and cross_passed,
        'denominator_status':'RECONCILED' if discovery_reconciled else 'KNOWN_LOWER_BOUND','counts':counts,'gates':gates,
        'source_failures':[{'id':r['id'],'source_url':r['source_url'],'type':r['type'],'status':r['status'],'failure':r.get('last_failure')} for r in required if r['status']!='BODY_SAVED'],
        'articles':article_results,'capture_proof':{k:v for k,v in captured.items() if k!='report'},'resource_proof':resources,
        'discovery_proof':discovery,'attachment_dependency_proof':attachment_dependencies,'navigation_proof':navigation,'visual_proof':visual,'pilot_proof':pilot,'original_integrity':integrity,
        'cross_module_reconciled':cross_passed,'cross_module_scope':'Both directions; target document/anchor preservation is checked. Source-module completion and accepted AIM exceptions remain separate.'}
    if persist:
        atomic_json(store.root/'SDK/reports/module-audit.json',report)
        atomic_json(store.root/'SDK/reports/links.json',{'module':'SDK','links':links,'cross_module':cross})
        atomic_json(store.root/'SDK/reports/cross-module.json',{'checked_at':report['checked_at'],'status':'PASSED' if cross_passed else 'UNRESOLVED','references':cross,'deferred':0})
        ratios={k:{**v,'percent':round(100*v.get('verified',v.get('locally_verified',0))/v['known'],4) if v['known'] else None,
                   'basis':'reconciled publication' if discovery_reconciled else 'known inventory only',
                   'not_applicable':bool(v['known']==0 and discovery_reconciled),
                   'absence_evidence':'Current bound discovery closure and zero matching catalog/reference entries.' if v['known']==0 and discovery_reconciled else None} for k,v in counts.items() if 'known' in v}
        atomic_json(store.root/'SDK/reports/coverage.json',{'module':'SDK','status':status,'denominator_status':report['denominator_status'],'counts':counts,'known_inventory_ratios':ratios,'completion_gates':gates})
        atomic_bytes(store.root/'SDK/reports/coverage.md',('\n'.join(['# SDK coverage','',status+'.',
            str(counts['articles']['originals_saved'])+' of '+str(len(articles))+' known article originals saved; '+str(counts['articles']['locally_verified'])+' fully verified.',
            'Denominator: '+report['denominator_status']+'. Acquisition permission does not waive missing source material.','']+
            ['- '+k+': '+('PASS' if v else 'BLOCKED') for k,v in gates.items()])+'\n').encode())
        blockers=[{'code':k.upper(),'report':'SDK/reports/module-audit.json'} for k,v in gates.items() if not v]
        if not cross_passed:blockers.append({'code':'CROSS_MODULE_REFERENCES_UNRESOLVED','report':'SDK/reports/cross-module.json'})
        state=read_json(store.root/'_project/STATE.json');state['modules']['SDK'].update(status=status,module_local_complete=complete,corpus_complete=complete and cross_passed,
            blockers=blockers,counts={'discovered':len(catalog),'pending':sum(r['status']=='PENDING' for r in catalog.values()),
            'bodies_saved':sum(r['status']=='BODY_SAVED' for r in catalog.values()),'articles_verified':counts['articles']['reading_verified'],
            'failed':sum(r['status']=='FAILED' for r in catalog.values())})
        state.update(module='SDK',phase=status,updated_at=now(),worker_running=False,blockers=blockers,
            next_invocation='Resolve the specific SDK source/proof/link gaps, rerun affected verification, then rerun tools/audit_sdk.py.')
        state.setdefault('publication',{}).update(current_local_changes_pending_publication=True,current_checkpoint_clean_clone_verified=False)
        atomic_json(store.root/'_project/STATE.json',state)
    return report


def main():
    root=Path(__file__).resolve().parents[1]
    with writer_lock(root,Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime') as owner:
        # The shared checkpoint also rewrites AIM coverage. Keep this operation
        # SDK-only and leave the final rich SDK coverage report intact.
        state_path=root/'_project/STATE.json';state=read_json(state_path)
        state.update(module='SDK',phase='SDK_FINAL_AUDIT',worker_running=True,updated_at=now(),
            writer={'protocol':'external_os_file_lock','last_operation':owner,'heartbeat_at':now()})
        atomic_json(state_path,state)
        try:report=audit(Store(root,cache_records=True))
        except BaseException:
            state=read_json(state_path);blocker={'code':'SDK_AUDIT_INTERRUPTED','detail':'Resume from saved originals and current proofs; no completion was granted.'}
            state.update(phase='SDK_AUDIT_INTERRUPTED',worker_running=False,updated_at=now(),blockers=[blocker])
            state['modules']['SDK']['blockers']=[blocker];atomic_json(state_path,state)
            raise
        print(json.dumps({'status':report['status'],'counts':report['counts'],'gates':report['gates']}),flush=True)
    return 0 if report['corpus_complete'] else 1


if __name__=='__main__':raise SystemExit(main())
