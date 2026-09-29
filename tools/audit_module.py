"""Report module coverage without converting successful URLs into a denominator."""
import argparse
from collections import Counter
import json
import os
from pathlib import Path
from urllib.parse import unquote, urlsplit
from collector import Store, read_json, atomic_json, atomic_bytes, digest, writer_lock, now
from article_data import TreeParser, nodes, text_of, parse_article, inventory, CONVERTER
from reading_audit import verify_reading
from completion_gates import catalog_hash, navigation_links, resource_proofs, visual_proof, completion_decision, reading_index_proof, discovery_proof
from proof_inputs import render_inputs,bound_report_current


def required_external_reference(ref,source_nodes):
    """Distinguish document navigation from a required file by its source role."""
    if ref.get('tag') not in ('a','area') or ref.get('attribute')!='href':return True
    node=source_nodes.get(ref.get('node_id'),{})
    if 'download' in node.get('attrs',{}):return True
    if ref.get('kind') in ('image','stylesheet','font','video','script'):return True
    if ref.get('kind')=='attachment':
        suffix=Path(urlsplit(ref.get('resolved_url') or ref['original_href']).path).suffix.lower()
        # Dynamic document routes are editorial navigation, not downloadable attachments.
        return suffix not in ('.aspx','.asp','.php','.jsp','.jspx','.cgi','.cfm','.do','.action')
    return False


def css_closure(store,module,identifier,catalog,seen=None):
    seen=set() if seen is None else seen
    if identifier in seen:return True
    seen.add(identifier)
    record=catalog.get(identifier)
    if not record or record['status']!='BODY_SAVED':return False
    try:
        data=read_json(store.root/module/'data/stylesheets'/(identifier+'.json'))
        if data['source_sha256']!=record['sha256'] or data.get('unsafe_css_detected'):
            return False
        if digest((store.root/record['local_path']).read_bytes())!=record['sha256']:
            return False
        if digest((store.root/data['rendered_path']).read_bytes())!=data['rendered_sha256']:
            return False
        if not data['direct_dependencies_captured']:return False
        for ref in data['references']:
            if ref['classification']!='internal':continue
            target=catalog.get(ref['target_id'])
            if not target or target['status']!='BODY_SAVED':return False
            if digest((store.root/target['local_path']).read_bytes())!=target['sha256']:return False
            if ref['kind']=='stylesheet' and not css_closure(store,module,target['id'],catalog,seen):
                return False
        return True
    except (OSError,ValueError,KeyError,TypeError):return False


def audit(store,module):
    records=store.records(module)
    catalog={r['id']:r for r in records}
    articles=[r for r in records if r['type']=='article' and r['status']!='INVALID_RESOLUTION']
    assets=[r for r in records if r['type'] in ('image','stylesheet','font','video') and r['status']!='INVALID_RESOLUTION']
    attachments=[r for r in records if r['type']=='attachment' and r['status']!='INVALID_RESOLUTION']
    navigation=[r for r in records if r['type']=='navigation' and r['status']!='INVALID_RESOLUTION']
    failures=[{'id':r['id'],'source_url':r['source_url'],'type':r['type'],'failure':r.get('last_failure')} for r in records if r['status']=='FAILED']
    issues=[]
    verified=[]
    reading_verified=[]
    link_counts=Counter()
    variant_counts=Counter()
    css_results={}
    integrity=store.verify()
    resource_validation=resource_proofs(store,module,catalog,css_closure)
    resource_verified=set(resource_validation['verified_ids'])
    state_path=store.root/module/'reports/documentary-states.json'
    state_report=read_json(state_path) if state_path.exists() else {}
    state_generations={r['id']:r for r in state_report.get('generations',[])}
    try:render_generation=render_inputs(store)
    except (OSError,ValueError,KeyError,TypeError):render_generation={'sha256':None,'files':[]}
    states_bound=bound_report_current(store,'documentary-states',render_generation)
    for record in articles:
        if record['status']!='BODY_SAVED':
            record.update(reading_copy_verified=False,intra_module_links_verified=False,article_local_complete=False)
            store.save_record(record)
            continue
        try:
            path=store.root/record.get('app_data_path','missing')
            if not path.is_file():
                record.update(reading_copy_verified=False,intra_module_links_verified=False,article_local_complete=False)
                store.save_record(record)
                issues.append({'id':record['id'],'error':'MISSING_APP_DOCUMENT','detail':record.get('conversion_failure')});continue
            data=read_json(path)
            errors=[]
            if data['source']['sha256']!=record['sha256']:errors.append('STALE_SOURCE_GENERATION')
            source=(store.root/record['local_path']).read_bytes()
            if digest(source)!=record['sha256']:errors.append('SOURCE_HASH_MISMATCH')
            parser,content,_,title,_=parse_article(record,source)
            source_nodes={n['node_id']:n for n in nodes(parser.root)}
            if content!=data['content_tree'] or text_of(content)!=data['content_text'] or title!=data['title']:
                errors.append('SOURCE_TO_APP_MISMATCH')
            if inventory(content)!=data['inventory']:errors.append('SOURCE_INVENTORY_MISMATCH')
            static_states_passed=not data['inventory']['variants']
            if module=='AIM':
                from documentary_states import reconcile
                relationships=reconcile(content,data['references'],catalog)
                if relationships!=data.get('documentary_states') or relationships['issues']:
                    errors.append('DOCUMENTARY_RELATIONSHIP_MISMATCH')
                if data['inventory']['variants'] or relationships['control_body_edges']:
                    generation=state_generations.get(record['id'],{})
                    static_states_passed=(states_bound and state_report.get('status')=='PASSED' and state_report.get('converter_version')==CONVERTER and
                        generation.get('source_sha256')==record['sha256'] and generation.get('reading_sha256')==data['reading']['html_sha256'])
                    if not static_states_passed:errors.append('DOCUMENTARY_STATE_PROOF_MISSING_OR_STALE')
            for key,value in data['verification']['checks'].items():
                if not value:errors.append(key)
            for kind in ('html','markdown'):
                derivative=store.root/data['reading'][kind]
                if not derivative.is_file() or digest(derivative.read_bytes())!=data['reading'][kind+'_sha256']:
                    errors.append('READING_HASH_MISMATCH')
            actual_reading=verify_reading(store.root,record,data,content,catalog)
            if not actual_reading['passed']:
                errors.extend('READING_'+item['check'] for item in actual_reading['errors'])
            if any(ref['classification']=='internal' and catalog.get(ref.get('target_id'),{}).get('type')!='article'
                   and ref.get('target_id') not in resource_verified for ref in data['references']):
                errors.append('REQUIRED_SUPPORT_RESOURCE_PROOF_MISSING')
            reading_errors=list(errors)
            for ref in data['references']:
                classification=ref['classification']
                if classification=='same_document':
                    if ref.get('fragment') and unquote(ref['fragment']) not in data['inventory']['anchors']:
                        errors.append('MISSING_FRAGMENT');link_counts['failed']+=1
                    else:link_counts['verified']+=1
                elif classification=='internal':
                    target=catalog.get(ref['target_id'])
                    if not target or target['status']!='BODY_SAVED':
                        errors.append('INTERNAL_TARGET_NOT_CAPTURED');link_counts['pending_or_failed']+=1
                    elif target['type']=='article' and ref.get('fragment'):
                        target_json=store.root/target.get('app_data_path','missing')
                        if not target_json.is_file() or unquote(ref['fragment']) not in read_json(target_json)['inventory']['anchors']:
                            errors.append('TARGET_FRAGMENT_NOT_VERIFIED');link_counts['pending_or_failed']+=1
                        else:link_counts['verified']+=1
                    else:link_counts['verified']+=1
                    if target and target['type']=='stylesheet':
                        if target['id'] not in css_results:
                            css_results[target['id']]=css_closure(store,module,target['id'],catalog)
                        if not css_results[target['id']]:
                            errors.append('CSS_CLOSURE_INCOMPLETE')
                elif classification=='deferred_cross_module':link_counts['deferred_cross_module']+=1
                elif classification=='classification_required':
                    errors.append('UNCLASSIFIED_REFERENCE');link_counts['unclassified']+=1
                elif classification=='out_of_scope_reference':
                    if required_external_reference(ref,source_nodes):
                        errors.append('REQUIRED_DEPENDENCY_OUTSIDE_SCOPE');link_counts['required_outside_scope']+=1
                    else:link_counts['external_reference']+=1
            variant_counts['discovered']+=len(data['inventory']['variants'])
            if static_states_passed:variant_counts['verified_in_static_copy']+=len(data['inventory']['variants'])
            if errors:
                issues.append({'id':record['id'],'errors':dict(Counter(errors))})
            else:
                verified.append(record['id'])
            if not reading_errors:reading_verified.append(record['id'])
            # Reading preservation and source-link health are different facts. Neither
            # by itself grants module completion or closes an unavailable source URL.
            data['verification'].update(reading_copy_verified=not reading_errors,
                intra_module_links_verified=not errors,article_local_complete=not errors,
                audit_source_sha256=record['sha256'],audit_converter_version=CONVERTER,
                pending=sorted(set(errors)))
            record.update(reading_copy_verified=not reading_errors,intra_module_links_verified=not errors,
                article_local_complete=not errors)
            # Re-audits need not rewrite unchanged derivatives on synced storage.
            if read_json(path)!=data:atomic_json(path,data)
            store.save_record(record)
        except (OSError,ValueError,KeyError,TypeError) as error:
            issues.append({'id':record['id'],'error':'ARTICLE_AUDIT_FAILED','detail':type(error).__name__+': '+str(error)})
            record.update(reading_copy_verified=False,intra_module_links_verified=False,article_local_complete=False)
            store.save_record(record)
    # Navigation completeness and article-link closure cannot be inferred from a high capture ratio.
    navigation_complete=all(r['status']=='BODY_SAVED' for r in navigation)
    discovery_validation=discovery_proof(store,records)
    discovery_complete=navigation_complete and discovery_validation['passed']
    nav_links=navigation_links(store,catalog)
    atomic_json(store.root/module/'reports/navigation-links.json',nav_links)
    visual=visual_proof(store,module,catalog,render_generation)
    local_index=reading_index_proof(store,module,catalog)
    required=[r for r in records if r['status']!='INVALID_RESOLUTION']
    scripts=[r for r in required if r['type']=='script']
    pilot=read_json(store.root/'_project/STATE.json').get('pilot','NOT_RUN')
    gates={'pilot_passed':pilot=='PASSED','discovery_reconciled':bool(discovery_complete),
        'required_originals_captured':bool(articles) and all(r['status']=='BODY_SAVED' for r in required),
        'original_integrity':integrity['local_integrity_passed'],'resource_fidelity':resource_validation['passed'],
        'article_reading_and_links':bool(articles) and len(verified)==len(articles),
        'navigation_links':nav_links['passed'],'local_reading_navigation':local_index['passed'],
        'representative_visual_review':visual['passed']}
    complete=completion_decision(gates)
    counts={'articles':{'known':len(articles),'originals_saved':sum(r['status']=='BODY_SAVED' for r in articles),
            'structurally_verified':len(reading_verified),'locally_verified':len(verified)},
            'assets':{'known':len(assets),'originals_saved':sum(r['status']=='BODY_SAVED' for r in assets)},
            'attachments':{'known':len(attachments),'originals_saved':sum(r['status']=='BODY_SAVED' for r in attachments)},
            'navigation':{'known':len(navigation),'originals_saved':sum(r['status']=='BODY_SAVED' for r in navigation)},
            'scripts':{'known':len(scripts),'originals_saved':sum(r['status']=='BODY_SAVED' for r in scripts)},
            'variants':dict(variant_counts),'links':dict(link_counts),'invalid_resolution_history':sum(r['status']=='INVALID_RESOLUTION' for r in records)}
    counts['navigation_links']=nav_links['counts']
    status='MODULE_LOCAL_COMPLETE' if complete else ('DISCOVERY_INCOMPLETE' if not discovery_complete else 'FIDELITY_VERIFICATION_INCOMPLETE')
    report={'checked_at':now(),'module':module,'status':status,
            'discovery_reconciled':bool(discovery_complete),'denominator_status':'RECONCILED' if discovery_complete else 'KNOWN_LOWER_BOUND',
            'counts':counts,'source_failures':failures,'fidelity_issues':issues,'structurally_verified_article_ids':reading_verified,
            'locally_verified_article_ids':verified,'module_local_complete':complete,'pilot':pilot,'gates':gates,
            'resource_proof':resource_validation,'visual_proof':visual,'local_navigation_proof':local_index,
            'discovery_proof':discovery_validation,'state_support_proof_current':states_bound,'catalog_sha256':catalog_hash(records)}
    report['original_byte_integrity']=integrity
    atomic_json(store.root/module/'reports/module-audit.json',report)
    atomic_json(store.root/module/'reports/errors.json',{'source_failures':failures,'fidelity_issues':issues})
    known={'articles':len(articles),'variants':variant_counts['discovered'],'assets':len(assets),'attachments':len(attachments),
           'scripts':len(scripts),'navigation':len(navigation),
           'internal_links':sum(link_counts[k] for k in ('verified','pending_or_failed','failed'))+sum(nav_links['counts'].get(k,0) for k in ('verified','failed'))}
    numerators={'articles':len(verified),'variants':variant_counts['verified_in_static_copy'],
        'assets':sum(r['id'] in resource_validation['verified_ids'] for r in assets),
        'attachments':sum(r['id'] in resource_validation['verified_ids'] for r in attachments),
        'scripts':sum(r['id'] in resource_validation['verified_ids'] for r in scripts),
        'navigation':sum(r['id'] in resource_validation['verified_ids'] for r in navigation),
        'internal_links':link_counts['verified']+nav_links['counts'].get('verified',0)}
    ratios={k:{'verified':numerators[k],'known':v,'percent':round(100*numerators[k]/v,4) if v else None,
               'basis':'complete publication' if discovery_complete else 'known inventory only; missing sources may expose more'} for k,v in known.items()}
    atomic_json(store.root/module/'reports/coverage.json',{'module':module,'status':status,'pilot':pilot,
        'discovery_reconciled':bool(discovery_complete),'denominator_status':report['denominator_status'],
        'denominators':known if discovery_complete else {k:None for k in known},'known_denominators':known,
        'ratios':ratios if discovery_complete else None,'known_inventory_ratios':ratios,
        'required_resources':len(required),'saved_originals':sum(r['status']=='BODY_SAVED' for r in required),
        'reading_copies_verified':len(reading_verified),'completion_gates':gates})
    summary=['# AIM coverage','','Status: **'+status+'**.','',
        str(sum(r['status']=='BODY_SAVED' for r in required))+' original bodies are saved from '+str(len(required))+' currently known required resources. The '+str(counts['invalid_resolution_history'])+' corrected collector-resolution records remain preserved separately.' if module=='AIM' else 'Coverage is evaluated against the recorded module inventory.',
        '',str(len(reading_verified))+' captured articles pass reading-preservation checks; '+str(len(verified))+' pass all article checks including source links.',
        'Known article inventory: '+str(len(articles))+'. Unavailable source material remains in the denominator.',
        '',('The publication denominator is reconciled.' if discovery_complete else 'All percentages in coverage.json are explicitly known-inventory ratios. The complete publication denominator remains unknown until missing source closure is resolved.'),
        '',str(len(failures))+' required resource requests remain unresolved. See source-gaps.md for exact published URLs and source anchor failures.',
        '', '## Completion gates','']
    summary.extend('- '+name+': '+('PASS' if value else 'BLOCKED') for name,value in gates.items())
    summary.extend(['','Passing local reading or resource checks does not waive source failures. Cross-module topic references are deferred only where explicitly recorded.',''])
    atomic_bytes(store.root/module/'reports/coverage.md','\n'.join(summary).encode('utf-8'))
    state=read_json(store.root/'_project/STATE.json')
    state['modules'][module]['status']=status
    blockers=[]
    if failures:blockers.append({'code':'SOURCE_RESOURCES_UNAVAILABLE','count':len(failures),'report':module+'/reports/source-gaps.json'})
    if issues:blockers.append({'code':'SOURCE_LINK_OR_FIDELITY_GAPS','articles':len(issues),'report':module+'/reports/errors.json'})
    if nav_links['issues']:blockers.append({'code':'NAVIGATION_SOURCE_GAPS','count':len(nav_links['issues']),'report':module+'/reports/navigation-links.json'})
    if not discovery_complete:blockers.append({'code':'DISCOVERY_INCOMPLETE','report':module+'/manifests/discovery-closure.json'})
    if resource_validation['issues']:blockers.append({'code':'RESOURCE_FIDELITY_GAPS','count':len(resource_validation['issues'])})
    if not visual['passed']:blockers.append({'code':visual['error']})
    if not local_index['passed']:blockers.append({'code':'LOCAL_READING_INDEX_GAPS','issues':local_index['issues']})
    state.update(phase='MODULE_LOCAL_COMPLETE' if complete else ('AIM_SOURCE_BLOCKED' if failures else 'AIM_VERIFICATION_INCOMPLETE'),
        blockers=blockers,worker_running=False,updated_at=now(),
        next_invocation='Continue SDK under the supplied SDK master prompt.' if complete else 'Repair the source gaps or local proof failures listed in AIM/reports/module-audit.json; rerun the offline completion pipeline.')
    state.setdefault('publication',{}).update(current_local_changes_pending_publication=True,current_checkpoint_clean_clone_verified=False)
    atomic_json(store.root/'_project/STATE.json',state)
    return report


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--module',choices=['AIM','SDK'],default='AIM')
    args=parser.parse_args()
    root=Path(__file__).resolve().parents[1]
    runtime=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'
    with writer_lock(root,runtime) as owner:
        store=Store(root,cache_records=True)
        result=audit(store,args.module)
        print(json.dumps({'module':args.module,'status':result['status'],'counts':result['counts'],'source_failures':len(result['source_failures']),'fidelity_issues':len(result['fidelity_issues'])}),flush=True)
        store.checkpoint(owner)
