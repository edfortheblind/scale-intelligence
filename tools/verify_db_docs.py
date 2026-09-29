"""Verify the current DB documentation generation without database access."""
import hashlib
import json
from pathlib import Path
import re
from urllib.parse import unquote
from assess_db import ROOT, PRIVATE, atomic_json, parse_connection, utc
from build_db_docs import OUT, walk_text

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def read(path):
    return json.loads(path.read_text(encoding='utf-8'))

def verify():
    errors, checks = [], {}
    objects = read(OUT/'catalog/objects.json')
    objects_by_id = {x['object_id']:x for x in objects}
    summary = read(OUT/'evidence/summary.json')
    counts = read(OUT/'catalog/object_counts.json')
    actual = {}
    for obj in objects:
        actual[obj['type_desc']] = actual.get(obj['type_desc'],0)+1
    if actual != {x['type_desc']:x['object_count'] for x in counts}:
        errors.append('Object-class counts differ from independent catalog counts')
    records = list((OUT/'objects').glob('*.json'))
    if len(objects_by_id) != len(objects) or len(records) != len(objects) or len(objects) != summary['objects']:
        errors.append('Object count/identity mismatch')
    for path in records:
        row=read(path)
        if row['object_id'] not in objects_by_id or row['snapshot_id'] != summary['snapshot_id']:
            errors.append('Object record generation mismatch: '+path.name)
    checks['object_records'] = len(records)
    runtime_ids={x['object_id'] for x in read(OUT/'catalog/query_store_runtime.json')}
    unresolved=sorted(runtime_ids-objects_by_id.keys())
    if summary.get('runtime_unresolved_object_ids') != unresolved or summary.get('runtime_resolved_objects') != len(runtime_ids & objects_by_id.keys()):
        errors.append('Runtime current/historical identity reconciliation mismatch')
    checks['runtime_current_ids']=len(runtime_ids & objects_by_id.keys())
    checks['runtime_unresolved_ids']=len(unresolved)
    modules = read(OUT/'catalog/modules.json')
    for module in modules:
        path = OUT / module.get('redacted_path','missing')
        if not path.is_file() or sha(path) != module.get('redacted_sha256'):
            errors.append('Module hash mismatch: '+str(module['object_id']))
    checks['module_hashes'] = len(modules)
    articles = {a['article_id']:a for a in read(OUT/'mappings/articles.json')}
    nodes = {}
    for article in articles.values():
        original = ROOT/article['original_path']
        if not original.is_file() or sha(original) != article['source_sha256']:
            errors.append('Article original hash mismatch: '+article['article_id'])
        source = read(ROOT/article['json_path'])
        if source['source']['sha256'] != article['source_sha256']:
            errors.append('Article JSON source mismatch: '+article['article_id'])
        nodes[article['article_id']] = dict(walk_text(source['content_tree']))
    matches = read(OUT/'mappings/identifier-crosswalk.json')
    for ref in matches:
        article = articles.get(ref['article_id'])
        text = nodes.get(ref['article_id'],{}).get(ref['node_id'],'')
        obj = objects_by_id.get(ref['object_id'],{})
        if not article or ref['original_sha256'] != article['source_sha256'] or not re.search(r'(?<!\w)'+re.escape(obj.get('name','!MISSING!'))+r'(?!\w)',text,re.I):
            errors.append('Invalid identifier citation: '+str(ref['object_id'])+'/'+ref['article_id'])
    checks['article_hashes'] = len(articles)
    checks['identifier_citations'] = len(matches)
    processes=read(OUT/'mappings/process-catalog.json')
    for record in processes:
        source=read(ROOT/record['json_path'])
        if sha(ROOT/source['source']['local_path']) != record['source_sha256']:
            errors.append('Process original hash mismatch: '+record['process_source_id'])
    checks['process_sources'] = len(processes)
    links=0
    for path in OUT.rglob('*.md'):
        text=path.read_text(encoding='utf-8')
        for target in re.findall(r'\]\(([^)]+)\)',text):
            if target.startswith(('https://','http://','#')):
                continue
            target=unquote(target.strip('<>').split('#')[0])
            if not (path.parent/target).exists():
                errors.append('Missing local link: '+path.relative_to(ROOT).as_posix()+' -> '+target)
            links+=1
    checks['local_links']=links
    # Read only the task-authorized connection input; never emit secret values.
    credential = PRIVATE.parent/'credentials/replica.connection.txt'
    if not credential.exists():
        credential = ROOT/'dbstring.txt'
    if credential.exists():
        settings=parse_connection(credential.read_text(encoding='utf-8-sig').strip())
        protected=[value for key,value in settings.items() if key in {'password','user id','data source'} and len(value)>=4]
        scans=list(OUT.rglob('*'))+[ROOT/'tools/assess_db.py',ROOT/'tools/build_db_docs.py',ROOT/'tools/verify_db_docs.py',ROOT/'tests/test_db_assessment.py']
        for path in scans:
            if path.is_file():
                text=path.read_text(encoding='utf-8',errors='replace')
                if any(value in text for value in protected):
                    errors.append('Protected connection value detected in '+path.relative_to(ROOT).as_posix())
        checks['protected_connection_value_scan']='PASS' if not any('Protected connection' in x for x in errors) else 'FAIL'
    else:
        errors.append('Credential input unavailable for non-disclosing exposure check')
    checked_paths=[p for p in OUT.rglob('*') if p.is_file() and p.name not in {'verification.json','output-manifest.json','REVIEW.md'}]
    checked_paths += [ROOT/p for p in ['tools/assess_db.py','tools/build_db_docs.py','tools/verify_db_docs.py','tests/test_db_assessment.py','requirements-db-assessment.txt']]
    inventory=[{'path':p.relative_to(ROOT).as_posix(),'bytes':p.stat().st_size,'sha256':sha(p)} for p in sorted(checked_paths)]
    atomic_json(OUT/'evidence/output-manifest.json',inventory)
    result={'verified_at':utc(),'status':'PASS' if not errors else 'FAIL','checks':checks,'errors':errors,
            'output_manifest_sha256':sha(OUT/'evidence/output-manifest.json'),
            'scope':'DB assessment outputs and changed tools only; no database queries, app acceptance, or publication'}
    atomic_json(OUT/'evidence/verification.json',result)
    print(json.dumps(result,indent=2))
    return 1 if errors else 0

if __name__=='__main__':
    raise SystemExit(verify())
