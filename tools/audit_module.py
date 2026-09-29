"""Report module coverage without converting successful URLs into a denominator."""
import argparse
from collections import Counter
import json
import os
from pathlib import Path
from urllib.parse import unquote, urlsplit
from collector import Store, read_json, atomic_json, digest, writer_lock, now
from article_data import TreeParser, nodes, text_of, parse_article


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
    link_counts=Counter()
    variant_counts=Counter()
    for record in articles:
        if record['status']!='BODY_SAVED':continue
        try:
            path=store.root/record.get('app_data_path','missing')
            if not path.is_file():
                issues.append({'id':record['id'],'error':'MISSING_APP_DOCUMENT','detail':record.get('conversion_failure')});continue
            data=read_json(path)
            errors=[]
            if data['source']['sha256']!=record['sha256']:errors.append('STALE_SOURCE_GENERATION')
            source=(store.root/record['local_path']).read_bytes()
            if digest(source)!=record['sha256']:errors.append('SOURCE_HASH_MISMATCH')
            _,content,_,title,_=parse_article(record,source)
            if content!=data['content_tree'] or text_of(content)!=data['content_text'] or title!=data['title']:
                errors.append('SOURCE_TO_APP_MISMATCH')
            for key,value in data['verification']['checks'].items():
                if not value:errors.append(key)
            for kind in ('html','markdown'):
                derivative=store.root/data['reading'][kind]
                if not derivative.is_file() or digest(derivative.read_bytes())!=data['reading'][kind+'_sha256']:
                    errors.append('READING_HASH_MISMATCH')
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
                        if not css_closure(store,module,target['id'],catalog):
                            errors.append('CSS_CLOSURE_INCOMPLETE')
                elif classification=='deferred_cross_module':link_counts['deferred_cross_module']+=1
                elif classification=='classification_required':
                    errors.append('UNCLASSIFIED_REFERENCE');link_counts['unclassified']+=1
                elif classification=='out_of_scope_reference':
                    if ref.get('tag') not in ('a','area') or ref.get('kind') in ('image','stylesheet','attachment','font','video','script'):
                        errors.append('REQUIRED_DEPENDENCY_OUTSIDE_SCOPE');link_counts['required_outside_scope']+=1
                    else:link_counts['external_reference']+=1
            variant_counts['discovered']+=len(data['inventory']['variants'])
            if errors:
                issues.append({'id':record['id'],'errors':dict(Counter(errors))})
            else:
                verified.append(record['id'])
                variant_counts['verified_in_static_copy']+=len(data['inventory']['variants'])
        except (OSError,ValueError,KeyError,TypeError) as error:
            issues.append({'id':record['id'],'error':'ARTICLE_AUDIT_FAILED','detail':type(error).__name__+': '+str(error)})
    # Navigation completeness and article-link closure cannot be inferred from a high capture ratio.
    navigation_complete=all(r['status']=='BODY_SAVED' for r in navigation)
    discovery_report=read_json(store.root/module/'reports/discovery.json') if (store.root/module/'reports/discovery.json').exists() else {}
    discovery_complete=navigation_complete and discovery_report.get('discovery_reconciled',False)
    counts={'articles':{'known':len(articles),'originals_saved':sum(r['status']=='BODY_SAVED' for r in articles),'structurally_verified':len(verified)},
            'assets':{'known':len(assets),'originals_saved':sum(r['status']=='BODY_SAVED' for r in assets)},
            'attachments':{'known':len(attachments),'originals_saved':sum(r['status']=='BODY_SAVED' for r in attachments)},
            'navigation':{'known':len(navigation),'originals_saved':sum(r['status']=='BODY_SAVED' for r in navigation)},
            'variants':dict(variant_counts),'links':dict(link_counts),'invalid_resolution_history':sum(r['status']=='INVALID_RESOLUTION' for r in records)}
    report={'checked_at':now(),'module':module,'status':'DISCOVERY_INCOMPLETE' if not discovery_complete else 'FIDELITY_VERIFICATION_INCOMPLETE',
            'discovery_reconciled':discovery_complete,'denominator_status':'LOWER_BOUND_UNTIL_PUBLICATION_AND_LINK_CLOSURE_RECONCILE',
            'counts':counts,'source_failures':failures,'fidelity_issues':issues,'structurally_verified_article_ids':verified,
            'module_local_complete':False,'pilot':read_json(store.root/'_project/STATE.json').get('pilot','NOT_RUN')}
    atomic_json(store.root/module/'reports/module-audit.json',report)
    atomic_json(store.root/module/'reports/errors.json',{'source_failures':failures,'fidelity_issues':issues})
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
