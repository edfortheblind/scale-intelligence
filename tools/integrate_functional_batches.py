"""Integrate reviewed functional fragments without Git or private-workspace dependencies.

Run after author verification, then render and verify the complete shared ledgers.
Roles are rebuilt from functional-role-base.json and current batches. Edit the
base or a batch, never the generated role ledger. Repeated runs are idempotent.
"""
import json
import hashlib
from collections import Counter
from pathlib import Path
from verify_functional_knowledge import fingerprint

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'DB Architecture'

def load(path):
    return json.loads(path.read_text(encoding='utf-8'))

def write(path,data):
    path.write_text(json.dumps(data,indent=2,ensure_ascii=False)+'\n',encoding='utf-8',newline='\n')

def merge_table(old,new):
    merged=dict(new);evidence=[];role_map={}
    for record in [old,new]:
        ids={}
        for e in record['evidence']:
            key=(e['path'],e['sha256'],e['line_start'],e['line_end'])
            match=next((x for x in evidence if (x['path'],x['sha256'],x['line_start'],x['line_end'])==key),None)
            if match is None:
                match={**e,'evidence_id':'E'+str(len(evidence)+1)};evidence.append(match)
            ids[e['evidence_id']]=match['evidence_id']
        for role in record['functional_roles']:
            # Separate source-supported explanations must retain their own citations.
            key=(role['role'],role['rationale'])
            target=role_map.setdefault(key,{'role':role['role'],'rationale':role['rationale'],'evidence_ids':[]})
            for e in role['evidence_ids']:
                if ids[e] not in target['evidence_ids']:target['evidence_ids'].append(ids[e])
    merged['evidence']=evidence;merged['functional_roles']=list(role_map.values())
    for k in ['business_domains','inference_limits']:
        merged[k]=list(dict.fromkeys(old[k]+new[k]))
    merged['vendor_identifier_references']=old['vendor_identifier_references']+[r for r in new['vendor_identifier_references'] if r not in old['vendor_identifier_references']]
    return merged

def merge_reviewed_roles(base_records, batches):
    """Rebuild only from authoritative inputs; previous output is not an input."""
    by_id = {record['object_id']: record for record in base_records}
    for batch in batches:
        for record in batch['reviewed_roles']:
            old = by_id.get(record['object_id'])
            if old and record['object_type'] == 'U':
                record = merge_table(old, record)
            elif old:
                record = {**record, 'vendor_identifier_references':
                    old['vendor_identifier_references'] + [value for value in
                    record['vendor_identifier_references'] if value not in
                    old['vendor_identifier_references']]}
            by_id[record['object_id']] = record
    return by_id

def integrate():
    help_data=load(OUT/'mappings/help-topics.json')
    role_base_path=OUT/'mappings/functional-role-base.json'
    roles=load(role_base_path)
    roles['source_inputs'].append({'path':role_base_path.relative_to(ROOT).as_posix(),
        'sha256':hashlib.sha256(role_base_path.read_bytes()).hexdigest()})
    batch_paths=sorted((OUT/'mappings/batches').glob('*.json'))
    batches=[load(path) for path in batch_paths]
    by_id=merge_reviewed_roles(roles['records'],batches)
    topic_ids={t['topic_id']:t for t in help_data['topics']}
    contracts={};dynamic={};unresolved={}
    coverage=load(OUT/'mappings/functional-coverage.json')
    process_path=OUT/'mappings/process-documentary-review.json'
    process=load(process_path) if process_path.exists() else None
    for f in coverage['families']:
     f['batch_associations']=[]
     if process:
      matches=[(i,r) for i,r in enumerate(process['families']) if r['family']==f['family']]
      if len(matches)!=1:raise ValueError('Process documentary family identity mismatch')
      i,r=matches[0]
      f['complete_documentary_review']={'source_ref':'DB Architecture/mappings/process-documentary-review.json#/families/'+str(i),
       'coverage':r['coverage'],'refinement_count':len(r['refinements']),
       'scope':'Complete captured process-summary text and static image review; installed application reconciliation remains separate.',
       'full_deployment_reconciliation':False}
    if process:
     coverage['counts']['families_with_complete_captured_documentary_review']=process['coverage']['families_reviewed']
     coverage['counts']['process_text_bodies_reviewed']=process['coverage']['text_articles_reviewed']
     coverage['counts']['process_image_references_inspected']=process['coverage']['image_references_inspected']
    for path,b in zip(batch_paths,batches):
     prefix=path.relative_to(ROOT).as_posix()
     for k,v in b['sources'].items():
      if k in help_data['sources'] and help_data['sources'][k]!=v: raise ValueError('Source collision '+k)
      help_data['sources'][k]=v
     for t in b['help_topics']:topic_ids[t['topic_id']]=t
     for i,c in enumerate(b['semantic_contracts']):
      if c['object_id'] in contracts:raise ValueError('Contract collision')
      contracts[c['object_id']]=prefix+'#/semantic_contracts/'+str(i)
     for i,r in enumerate(b.get('dynamic_review',[])):
      dynamic.setdefault(r['object_id'],[]).append(prefix+'#/dynamic_review/'+str(i))
     for key in ['unresolved_dependency_reviews','unresolved_dependencies']:
      for i,r in enumerate(b.get(key,[])):
       unresolved.setdefault((r['referencing_id'],r['referenced_entity_name']),[]).append(prefix+'#/'+key+'/'+str(i))
     for i,a in enumerate(b.get('family_associations',[])):
      family=next(f for f in coverage['families'] if f['family']==a['family'])
      family['batch_associations'].append({'batch_ref':prefix+'#/family_associations/'+str(i),**a})
    help_data['topics']=list(topic_ids.values());help_data['coverage']['topic_count']=len(topic_ids)
    help_data['coverage']['deployed_sql_modules_cited']=len({s['object_id'] for s in help_data['sources'].values() if s['kind']=='DEPLOYED_SQL_STATIC'})
    help_data['coverage']['vendor_articles_cited']=len({s['article_id'] for s in help_data['sources'].values() if s['kind']=='VENDOR_DOCUMENTATION'})
    help_data['coverage']['execution_step_count']=sum(len(t['execution_steps']) for t in topic_ids.values())
    help_data['coverage']['authored_evaluation_cases']=sum(len(t['evaluation']['cases']) for t in topic_ids.values())
    roles['records']=sorted(by_id.values(),key=lambda r:(r['object_type'],r['qualified_name'].lower()))
    roles['review_state']='AUTHOR_STATIC_REVIEW_COMPLETE_SEE_CHECKPOINT_AUDIT_SCOPE'
    objects=load(OUT/'catalog/objects.json');modules=load(OUT/'catalog/modules.json')
    eligible=[o for o in objects if o['type'] in roles['coverage']['eligible_object_types']]
    types=Counter(o['type'] for o in eligible);review_types=Counter(r['object_type'] for r in by_id.values());c=roles['coverage']
    c.update(reviewed_objects=len(by_id),eligible_objects_unreviewed=len(eligible)-len(by_id),reviewed_percentage_of_eligible=round(100*len(by_id)/len(eligible),2))
    c['by_type']={t:{'eligible':n,'reviewed':review_types[t],'unreviewed':n-review_types[t]} for t,n in types.items()}
    write(OUT/'mappings/help-topics.json',help_data);write(OUT/'mappings/functional-roles.json',roles)
    write(OUT/'mappings/functional-coverage.json',coverage)
    ledger={'schema_version':1,'snapshot_id':'20260929T214106Z','policy':'Generated identities and UNREVIEWED states do not constitute review. Role, bounded static semantics and operational acceptance are separate. Constraints/defaults/sequence stay in the structural catalog and require behavior-specific review.', 'counts':{'eligible':len(eligible),'role_reviewed':len(by_id),'role_unreviewed':len(eligible)-len(by_id),'semantic_eligible_modules':sum(o['type']!='U' for o in eligible),'bounded_semantic_contracts':len(contracts),'semantic_unreviewed':sum(o['type']!='U' for o in eligible)-len(contracts)},'records':[]}
    for o in eligible:
     oid=o['object_id'];ledger['records'].append({'snapshot_id':'20260929T214106Z','object_id':oid,'qualified_name':o['schema_name']+'.'+o['name'],'object_type':o['type'],'role_review':'BOUNDED_ROLE_REVIEWED' if oid in by_id else 'UNREVIEWED','role_record_ref':f'DB Architecture/mappings/functional-roles.json#object_id={oid}' if oid in by_id else None,'semantic_review':('NOT_APPLICABLE_TABLE_ROLE_REVIEW_SEPARATE' if o['type']=='U' else 'BOUNDED_STATIC_CONTRACT' if oid in contracts else 'UNREVIEWED'),'semantic_contract_ref':contracts.get(oid),'operational_acceptance':'NOT_PERFORMED'})
    write(OUT/'mappings/object-review-ledger.json',ledger)
    deps=[r for r in load(OUT/'catalog/dependencies.json') if r['referenced_id'] is None]
    backlog={'schema_version':1,'snapshot_id':'20260929T214106Z','policy':'Lexical dynamic candidates and unresolved catalog entries remain the original denominator. A bounded review explains only its cited scope; NULL catalog IDs are never rewritten as resolved observed IDs.','dynamic_candidates':[],'unresolved_dependencies':[]}
    for m in modules:
     if m['static_features']['dynamic_sql_candidate']:
      refs=dynamic.get(m['object_id'],[])
      backlog['dynamic_candidates'].append({'object_id':m['object_id'],'source_definition_sha256':m['source_definition_sha256'],'review_state':'BOUNDED_STATIC_REVIEW' if refs else 'UNREVIEWED','batch_refs':refs})
    for i,d in enumerate(deps):
     refs=unresolved.get((d['referencing_id'],d['referenced_entity_name']),[])
     backlog['unresolved_dependencies'].append({'entry_number':i+1,'catalog_entry_sha256':fingerprint(d),'referencing_id':d['referencing_id'],'referenced_entity_name':d['referenced_entity_name'],'catalog_referenced_id':None,'review_state':'BOUNDED_STATIC_REVIEW_CATALOG_TARGET_STILL_UNRESOLVED' if refs else 'UNREVIEWED','batch_refs':refs})
    backlog['counts']={'dynamic_candidates':len(backlog['dynamic_candidates']),'dynamic_candidates_with_bounded_review':sum(bool(r['batch_refs']) for r in backlog['dynamic_candidates']),'unresolved_catalog_entries':len(deps),'unresolved_entries_with_bounded_review':sum(bool(r['batch_refs']) for r in backlog['unresolved_dependencies'])}
    write(OUT/'mappings/review-backlog.json',backlog)
    from build_help_source_manifest import build_manifest
    build_manifest(ROOT)
    print(json.dumps({'topics':len(topic_ids),'roles':len(by_id),'contracts':len(contracts),'backlog':backlog['counts']}))

if __name__=='__main__':
    integrate()
