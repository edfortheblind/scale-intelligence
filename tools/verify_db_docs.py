"""Verify the current DB documentation generation without database access."""
import hashlib
import json
from pathlib import Path
import re
from urllib.parse import unquote
from assess_db import ROOT, PRIVATE, parse_connection, utc
from build_db_docs import OUT, walk_text
from check_scale_configuration import SPECS, query_for, validate_result

TOOL_PATHS = ['tools/assess_db.py', 'tools/build_db_docs.py', 'tools/verify_db_docs.py',
              'tools/check_scale_configuration.py', 'tests/test_db_assessment.py',
              'tests/test_scale_configuration.py', 'requirements-db-assessment.txt']

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def read(path):
    return json.loads(path.read_text(encoding='utf-8'))

def write_receipt(path, value):
    pending = path.with_suffix(path.suffix+'.pending')
    pending.write_text(json.dumps(value, indent=2, ensure_ascii=False)+'\n', encoding='utf-8', newline='\n')
    pending.replace(path)

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
    config = read(OUT/'evidence/configuration-observations.json')
    if (config['collector_sha256'] != sha(ROOT/'tools/check_scale_configuration.py')
            or config['structural_snapshot_id'] != summary['snapshot_id']
            or config.get('transactional_rows_read') is not False
            or config.get('routines_executed') is not False
            or config.get('identity_verified') is not True
            or config.get('connection_updateability') != 'READ_ONLY'
            or config.get('tls_certificate_validation') is not True):
        errors.append('Configuration observation provenance or boundary mismatch')
    observations = config['checks']
    if [x['check_id'] for x in observations] != [s['id'] for s in SPECS]:
        errors.append('Configuration check coverage mismatch')
    else:
        for spec, observation in zip(SPECS, observations):
            query, params = query_for(spec)
            if (observation['query_sha256'] != hashlib.sha256(query.encode('utf-8')).hexdigest()
                    or observation['bound_parameters'] != list(params)
                    or observation['object_id'] != spec['object_id']):
                errors.append('Configuration query binding mismatch: '+spec['id'])
            if 'result' in observation:
                try:
                    validate_result(spec, observation['result'])
                    expected_status = 'CAPPED_INCOMPLETE' if observation['result']['cap_hit'] else 'OBSERVED'
                    if observation['status'] != expected_status:
                        errors.append('Configuration result status mismatch: '+spec['id'])
                except ValueError:
                    errors.append('Configuration aggregate validation failed: '+spec['id'])
            elif observation['status'] != 'UNAVAILABLE':
                errors.append('Configuration result missing: '+spec['id'])
    checks['configuration_checks'] = len(observations)
    coverage = read(OUT/'mappings/functional-coverage.json')
    families = {r['title'].split(' Process Summary')[0] for r in processes}
    if {f['family'] for f in coverage['families']} != families or coverage['counts']['indexed_families'] != len(families):
        errors.append('Functional process-family coverage mismatch')
    process_by_id = {p['process_source_id']: p for p in processes}
    for family in coverage['families']:
        for source in family['sources']:
            original = process_by_id.get(source['article_id'], {})
            if source['source_sha256'] != original.get('source_sha256') or source['title'] != original.get('title'):
                errors.append('Functional family source mismatch: '+source['article_id'])
    checks['functional_process_families'] = len(families)
    help_data = read(OUT/'mappings/help-topics.json')
    module_by_id = {m['object_id']: m for m in modules}
    if help_data['snapshot_id'] != summary['snapshot_id']:
        errors.append('Help snapshot mismatch')
    for source_id, source in help_data['sources'].items():
        if source['kind'] == 'DEPLOYED_SQL_STATIC':
            module = module_by_id.get(source['object_id'], {})
            path = ROOT/source['reading_path']
            if (source['source_definition_sha256'] != module.get('source_definition_sha256')
                    or source['reading_sha256'] != module.get('redacted_sha256')
                    or source['reading_path'] != 'DB Architecture/'+module.get('redacted_path', '')
                    or sha(path) != source['reading_sha256']):
                errors.append('Help SQL fingerprint mismatch: '+source_id)
            line_count = len(path.read_text(encoding='utf-8').splitlines())
            if any(not 1 <= start <= end <= line_count for start, end in source['line_spans']):
                errors.append('Help SQL line span invalid: '+source_id)
        elif source['kind'] == 'VENDOR_DOCUMENTATION':
            article = read(ROOT/source['module']/'data/articles'/(source['article_id']+'.json'))
            node_ids = dict(walk_text(article['content_tree']))
            if (source['source_sha256'] != article['source']['sha256']
                    or source['source_path'] != article['source']['local_path']
                    or sha(ROOT/source['source_path']) != source['source_sha256']
                    or any(n not in node_ids for n in source['node_ids'])):
                errors.append('Help vendor citation mismatch: '+source_id)
        elif source['kind'] == 'CATALOG_METADATA':
            path = ROOT/source['path']
            if sha(path) != source['sha256']:
                errors.append('Help catalog hash mismatch: '+source_id)
            source_objects = {r['object_id'] for r in read(path)}
            if not set(source['object_ids']) <= source_objects:
                errors.append('Help catalog object mismatch: '+source_id)
        else:
            errors.append('Unknown help source kind: '+source_id)
    topics = help_data['topics']
    if len({t['topic_id'] for t in topics}) != len(topics) or help_data['coverage']['topic_count'] != len(topics):
        errors.append('Help topic count/identity mismatch')
    for topic in topics:
        refs = list(topic['evidence_refs'])
        for step in topic['execution_steps']:
            refs.extend(step['evidence_refs'])
        if any(ref not in help_data['sources'] for ref in refs):
            errors.append('Help topic contains unresolved evidence reference: '+topic['topic_id'])
        if [s['order'] for s in topic['execution_steps']] != list(range(1, len(topic['execution_steps'])+1)):
            errors.append('Help execution step order invalid: '+topic['topic_id'])
    checks['help_topics'] = len(topics)
    checks['help_source_bindings'] = len(help_data['sources'])
    checks['help_evaluation_cases_authored_not_executed'] = sum(len(t['evaluation']['cases']) for t in topics)
    roles = read(OUT/'mappings/functional-roles.json')
    reviewed_roles = roles['records']
    role_coverage = roles['coverage']
    eligible = [o for o in objects if o['type'] in role_coverage['eligible_object_types']]
    if (roles['snapshot_id'] != summary['snapshot_id'] or role_coverage['eligible_objects'] != len(eligible)
            or role_coverage['reviewed_objects'] != len(reviewed_roles)
            or role_coverage['eligible_objects_unreviewed'] != len(eligible)-len(reviewed_roles)
            or len({r['object_id'] for r in reviewed_roles}) != len(reviewed_roles)
            or role_coverage['reviewed_percentage_of_eligible'] != round(100*len(reviewed_roles)/len(eligible), 2)):
        errors.append('Functional role coverage/identity mismatch')
    for source in roles['source_inputs']:
        if sha(ROOT/source['path']) != source['sha256']:
            errors.append('Role source input mismatch: '+source['path'])
    role_spans = 0
    for record in reviewed_roles:
        obj = objects_by_id.get(record['object_id'], {})
        if (record['snapshot_id'] != summary['snapshot_id'] or record['object_type'] != obj.get('type')
                or record['qualified_name'] != obj.get('schema_name', '')+'.'+obj.get('name', '')):
            errors.append('Functional role object mismatch: '+str(record['object_id']))
        evidence_ids = {e['evidence_id'] for e in record['evidence']}
        for role in record['functional_roles']:
            if role['role'] not in roles['role_taxonomy'] or not set(role['evidence_ids']) <= evidence_ids:
                errors.append('Functional role evidence reference invalid: '+str(record['object_id']))
        for evidence in record['evidence']:
            path = ROOT/evidence['path']
            if sha(path) != evidence['sha256']:
                errors.append('Functional role evidence hash mismatch: '+evidence['path'])
            lines = path.read_text(encoding='utf-8').splitlines()
            if not 1 <= evidence['line_start'] <= evidence['line_end'] <= len(lines):
                errors.append('Functional role evidence span invalid: '+evidence['path'])
            if evidence['kind'] == 'REDACTED_SQL':
                module = module_by_id.get(int(path.stem), {})
                if evidence['source_definition_sha256'] != module.get('source_definition_sha256'):
                    errors.append('Functional role definition mismatch: '+evidence['path'])
            role_spans += 1
        for reference in record['vendor_identifier_references']:
            if not any(m['object_id'] == record['object_id'] and m['article_id'] == reference['article_id']
                       and m['node_id'] == reference['node_id'] and m['original_sha256'] == reference['original_sha256']
                       for m in matches):
                errors.append('Functional role vendor citation mismatch: '+str(record['object_id']))
    checks['reviewed_functional_roles'] = len(reviewed_roles)
    checks['functional_role_evidence_spans'] = role_spans
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
        scans=list(OUT.rglob('*'))+[ROOT/p for p in TOOL_PATHS]
        for path in scans:
            if path.is_file():
                text=path.read_text(encoding='utf-8',errors='replace')
                if any(value in text for value in protected):
                    errors.append('Protected connection value detected in '+path.relative_to(ROOT).as_posix())
        checks['protected_connection_value_scan']='PASS' if not any('Protected connection' in x for x in errors) else 'FAIL'
    else:
        errors.append('Credential input unavailable for non-disclosing exposure check')
    checked_paths=[p for p in OUT.rglob('*') if p.is_file() and p.name not in {'verification.json','output-manifest.json','REVIEW.md'}]
    checked_paths += [ROOT/p for p in TOOL_PATHS]
    inventory=[{'path':p.relative_to(ROOT).as_posix(),'bytes':p.stat().st_size,'sha256':sha(p)} for p in sorted(checked_paths)]
    write_receipt(OUT/'evidence/output-manifest.json',inventory)
    result={'verified_at':utc(),'status':'PASS' if not errors else 'FAIL','checks':checks,'errors':errors,
            'output_manifest_sha256':sha(OUT/'evidence/output-manifest.json'),
            'scope':'DB assessment outputs and changed tools only; no database queries, app acceptance, or publication'}
    write_receipt(OUT/'evidence/verification.json',result)
    print(json.dumps(result,indent=2))
    return 1 if errors else 0

if __name__=='__main__':
    raise SystemExit(verify())
