"""Discover only explicit published SDK attachment dependencies to a fixed point."""
import json,os,re
from pathlib import Path
from collector import Store,read_json,atomic_json,writer_lock,source_identity,digest,now
from attachment_references import attachment_references


def reconcile(store):
    catalog={r['id']:r for r in store.records('SDK')};before=set(catalog)
    references=[];diagnostics=[];sources=[]
    for record in list(catalog.values()):
        if record['type']!='attachment' or record['status']!='BODY_SAVED':continue
        raw=(store.root/record['local_path']).read_bytes()
        if digest(raw)!=record['sha256']:raise ValueError('Attachment hash mismatch')
        result=attachment_references(record,raw)
        sources.append({'id':record['id'],'source_sha256':record['sha256'],'final_url':record.get('final_url') or record['source_url']})
        for diagnostic in result['diagnostics']:
            # Invalid published JSON examples remain intact. No schema reference
            # can be hidden in ordinary business keys when there are no '$' or
            # backslash escapes at all; otherwise keep the diagnostic open.
            if record['source_url'].lower().endswith('.json') and b'$' not in raw and b'\\' not in raw:
                diagnostic.update(dependency_inventory_complete=True,
                    dependency_evidence='No dollar sign or backslash escape occurs in the original JSON example; no $ref or $id key is present. Source syntax remains unchanged.')
            diagnostics.append(diagnostic)
        for ref in result['references']:
            row=dict(ref)
            try:
                identity=source_identity(ref['original_href'],ref['effective_base'])
                if identity['module']!='SDK':
                    row.update(classification='deferred_cross_module',target_id=identity['id'])
                elif identity['id']==record['id']:
                    row.update(classification='same_document',target_id=record['id'],fragment=identity['fragment'])
                else:
                    target=store.discover('SDK',ref['original_href'],ref['effective_base'],ref['discovery_source'],'attachment')
                    row.update(classification='internal',target_id=target['id'],captured=target['status']=='BODY_SAVED')
            except ValueError as error:
                row.update(classification='outside_authorized_scope',detail=str(error))
            references.append(row)
    current={r['id']:r for r in store.records('SDK')}
    for row in references:
        if row['classification']=='internal':row['captured']=current[row['target_id']]['status']=='BODY_SAVED'
    report={'checked_at':now(),'module':'SDK','source_generations':sources,'references':references,'source_diagnostics':diagnostics,
        'code_sha256':{p:digest((store.root/p).read_bytes()) for p in ('tools/attachment_references.py','tools/discover_sdk_attachments.py')},
        'new_resources':len(set(current)-before),'fixed_point':set(current)==before,
        'all_explicit_dependencies_captured':all(r['classification']=='same_document' or r.get('captured') for r in references),
        'dependency_scan_complete':not any(not d['dependency_inventory_complete'] for d in diagnostics),
        'source_syntax_preserved':True,'missing_ids':sorted({r['target_id'] for r in references if r['classification']=='internal' and not r['captured']})}
    atomic_json(store.root/'SDK/reports/attachment-dependencies.json',report)
    print(json.dumps({k:report[k] for k in ('new_resources','fixed_point','all_explicit_dependencies_captured','dependency_scan_complete','missing_ids')}),flush=True)
    return report


if __name__=='__main__':
    root=Path(__file__).resolve().parents[1]
    with writer_lock(root,Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'):
        reconcile(Store(root,cache_records=True))
