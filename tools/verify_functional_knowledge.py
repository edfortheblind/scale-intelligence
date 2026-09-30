"""Offline integrity checks for reviewed knowledge, not execution or answer quality."""
import hashlib
import json


def load(path):
    return json.loads(path.read_text(encoding='utf-8'))


def fingerprint(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(',', ':')).encode()).hexdigest()


def catalog_source_object_ids(path, rows):
    """Dependency citations identify callers; object catalogs identify their own rows."""
    fields = {'objects.json': 'object_id', 'triggers.json': 'object_id',
              'dependencies.json': 'referencing_id'}
    field = fields[path.name]
    return {row[field] for row in rows}


def referenced_record(root, ref):
    path, pointer = ref.split('#/', 1)
    if not path.startswith('DB Architecture/mappings/batches/') or '..' in path.split('/'):
        raise ValueError('Review reference must stay in the declared batch directory')
    record = load(root / path)
    for key in pointer.split('/'):
        record = record[int(key)] if isinstance(record, list) else record[key]
    return record


def validate_object_ledger(ledger, objects, roles, contracts, snapshot):
    errors = []
    eligible = {o['object_id']: o for o in objects if o['type'] in {'U', 'P', 'FN', 'IF', 'TF', 'V', 'TR'}}
    rows = ledger['records']
    if len(rows) != len(eligible) or {r['object_id'] for r in rows} != set(eligible):
        errors.append('Object-review ledger does not contain each eligible object exactly once')
    reviewed = {r['object_id'] for r in roles}
    semantic = {c['object_id'] for c in contracts}
    semantic_eligible = {oid for oid, obj in eligible.items() if obj['type'] != 'U'}
    for row in rows:
        obj = eligible.get(row['object_id'], {})
        expected_role = 'BOUNDED_ROLE_REVIEWED' if row['object_id'] in reviewed else 'UNREVIEWED'
        expected_semantic = 'BOUNDED_STATIC_CONTRACT' if row['object_id'] in semantic else 'UNREVIEWED'
        if row['object_id'] not in semantic_eligible:
            expected_semantic = 'NOT_APPLICABLE_TABLE_ROLE_REVIEW_SEPARATE'
        if (row.get('snapshot_id') != snapshot or row.get('object_type') != obj.get('type')
                or row.get('qualified_name') != obj.get('schema_name', '') + '.' + obj.get('name', '')
                or row.get('role_review') != expected_role or row.get('semantic_review') != expected_semantic
                or row.get('operational_acceptance') != 'NOT_PERFORMED'):
            errors.append('Object-review ledger identity/state mismatch: ' + str(row['object_id']))
    if ledger.get('counts') != {'eligible': len(eligible), 'role_reviewed': len(reviewed),
                               'role_unreviewed': len(eligible) - len(reviewed),
                               'semantic_eligible_modules': len(semantic_eligible),
                               'bounded_semantic_contracts': len(semantic),
                               'semantic_unreviewed': len(semantic_eligible) - len(semantic)}:
        errors.append('Object-review ledger counts mismatch')
    return errors


def validate_backlog(backlog, modules, dependencies):
    errors = []
    dynamic = {m['object_id']: m for m in modules if m['static_features']['dynamic_sql_candidate']}
    rows = backlog['dynamic_candidates']
    if len(rows) != len(dynamic) or {r['object_id'] for r in rows} != set(dynamic):
        errors.append('Dynamic candidate denominator/identity mismatch')
    for row in rows:
        if row.get('source_definition_sha256') != dynamic.get(row['object_id'], {}).get('source_definition_sha256'):
            errors.append('Dynamic candidate source hash mismatch')
        if row.get('review_state') not in {'UNREVIEWED', 'BOUNDED_STATIC_REVIEW'}:
            errors.append('Unsupported dynamic completion state')
        if row.get('review_state') == 'BOUNDED_STATIC_REVIEW' and not row.get('batch_refs'):
            errors.append('Dynamic review lacks batch evidence')
    unresolved = [r for r in dependencies if r['referenced_id'] is None]
    rows = backlog['unresolved_dependencies']
    if len(rows) != len(unresolved) or [r['catalog_entry_sha256'] for r in rows] != [fingerprint(r) for r in unresolved]:
        errors.append('Unresolved dependency denominator/source mismatch')
    for row in rows:
        if row.get('review_state') not in {'UNREVIEWED', 'BOUNDED_STATIC_REVIEW_CATALOG_TARGET_STILL_UNRESOLVED'}:
            errors.append('Unsupported dependency resolution claim')
    return errors


def validate_guidance(guide, sources):
    errors = []
    settings = guide['settings']
    if guide['setting_count'] != len(settings) or len({s['setting_id'] for s in settings}) != len(settings):
        errors.append('Configuration guidance count/identity mismatch')
    for setting in settings:
        if not setting['evidence_refs'] or not setting['node_ids']:
            errors.append('Configuration setting lacks source locations')
        nodes = set()
        for ref in setting['evidence_refs']:
            if ref not in sources:
                errors.append('Configuration setting source is unresolved: ' + ref)
            nodes.update(sources.get(ref, {}).get('node_ids', []))
        if not set(setting['node_ids']) <= nodes:
            errors.append('Configuration setting node outside cited source')
        if setting['current_effective_setting'] != 'NOT_ESTABLISHED':
            errors.append('Documentary configuration presented as effective setting')
        for field in ('purpose', 'scope', 'accepted_values', 'default', 'precedence', 'validation_method'):
            if not setting.get(field):
                errors.append('Missing configuration contract dimension: ' + field)
    return errors


def validate_semantic_contract(contract, sources, module, snapshot):
    errors = []
    identity = str(contract.get('object_id'))
    if (contract.get('snapshot_id') != snapshot
            or contract.get('source_definition_sha256') != module.get('source_definition_sha256')):
        errors.append('Semantic contract source/snapshot mismatch: ' + identity)
    refs = contract.get('evidence_refs', [])
    bound = [sources[ref] for ref in refs if ref in sources]
    if (not refs or len(bound) != len(refs)
            or not any(s.get('object_id') == contract.get('object_id')
                       and s.get('source_definition_sha256') == module.get('source_definition_sha256')
                       for s in bound)):
        errors.append('Semantic contract lacks its own module evidence: ' + identity)
    # The two independently authored batches retain their documented field names.
    dimensions = [('inputs', 'inputs_defaults'), ('outputs', 'output_shape'),
                  ('ordered_effects', 'ordered_branches'), ('configuration', 'configuration_scope_and_precedence'),
                  ('error_return', 'error_and_return_handling'), ('transaction_ownership',), ('concurrency',),
                  ('trigger_behavior',), ('external_handoffs', 'external_handoffs_and_gaps')]
    for alternatives in dimensions:
        if not any(contract.get(field) for field in alternatives):
            errors.append('Semantic contract missing dimension ' + '/'.join(alternatives) + ': ' + identity)
    if 'inputs' in contract:
        if not all(contract['inputs'].get(k) for k in ('defaults', 'null_handling')):
            errors.append('Semantic input default/null contract missing: ' + identity)
        if not all(k in contract for k in ('reads', 'writes', 'calls')):
            errors.append('Semantic relationship classes missing: ' + identity)
    elif not contract.get('null_and_invalid_input_behavior') or 'effects' not in contract:
        errors.append('Semantic null/effect contract missing: ' + identity)
    if contract.get('operational_execution_verified', False):
        errors.append('Static contract cannot establish operational execution: ' + identity)
    return errors


def validate_schema_association(association, columns, indexes, index_columns):
    """Selected columns must be exact; every unique key retains its ordered columns."""
    oid = association['object_id']
    fields = ['column_id', 'name', 'type_name', 'is_nullable', 'is_identity', 'default_object_id']
    by_id = {row['column_id']: {k: row[k] for k in fields}
             for row in columns if row['object_id'] == oid}
    selected = association['columns']
    ids = [row['column_id'] for row in selected]
    expected_keys = []
    for idx in indexes:
        if idx['object_id'] == oid and idx['is_unique']:
            key_columns = sorted([row for row in index_columns if row['object_id'] == oid
                                  and row['index_id'] == idx['index_id'] and row['key_ordinal'] > 0],
                                 key=lambda row: row['key_ordinal'])
            expected_keys.append({'index_id': idx['index_id'], 'name': idx['name'],
                                  'column_ids': [row['column_id'] for row in key_columns]})
    valid = (association['kind'] == 'COLUMN_AND_INDEX_CONTRACT'
             and bool(selected) and len(ids) == len(set(ids))
             and all(row == by_id.get(row['column_id']) for row in selected)
             and association['unique_index_keys'] == expected_keys)
    return [] if valid else ['Schema association column/key mismatch: ' + str(oid)]


def verify_extension(root, out, objects, modules, help_data, roles, coverage, snapshot):
    from render_functional_docs import rendered_documents
    from build_runtime_profiles import aggregate
    errors, checks = [], {}
    batches = [load(p) for p in sorted((out / 'mappings/batches').glob('*.json'))]
    contracts = [c for b in batches for c in b['semantic_contracts']]
    if len({c['object_id'] for c in contracts}) != len(contracts):
        errors.append('Duplicate semantic contracts across batches')
    module_map = {m['object_id']: m for m in modules}
    catalog_columns = load(out / 'catalog/columns.json')
    catalog_indexes = load(out / 'catalog/indexes.json')
    catalog_index_columns = load(out / 'catalog/index_columns.json')
    for batch in batches:
        if batch['snapshot_id'] != snapshot:
            errors.append('Functional batch snapshot mismatch')
        for ref, source in batch['sources'].items():
            if help_data['sources'].get(ref) != source:
                errors.append('Functional batch source not integrated: ' + ref)
        catalogs = batch.get('catalog_sources', {})
        for source in catalogs.values():
            if hashlib.sha256((root / source['path']).read_bytes()).hexdigest() != source['sha256']:
                errors.append('Batch catalog hash mismatch: ' + source['path'])
        for record in batch.get('constraint_default_sequence_reviews', []):
            if record['object_id'] not in {o['object_id'] for o in objects} or not set(record['catalog_refs']) <= catalogs.keys():
                errors.append('Constraint/default/sequence association mismatch')
        for association in batch.get('schema_associations', []):
            errors += validate_schema_association(association, catalog_columns, catalog_indexes, catalog_index_columns)
            if not set(association['catalog_refs']) <= catalogs.keys():
                errors.append('Schema association catalog reference mismatch: '+str(association['object_id']))
        for contract in batch['semantic_contracts']:
            if contract['object_id'] not in module_map:
                errors.append('Semantic contract does not bind an observed module')
            errors += validate_semantic_contract(contract, batch['sources'],
                                                 module_map.get(contract['object_id'], {}), snapshot)
    ledger = load(out / 'mappings/object-review-ledger.json')
    errors += validate_object_ledger(ledger, objects, roles['records'], contracts, snapshot)
    for row in ledger['records']:
        ref = row.get('semantic_contract_ref')
        if ref:
            try:
                if referenced_record(root, ref)['object_id'] != row['object_id']:
                    raise ValueError('Wrong object')
            except (ValueError, KeyError, IndexError, OSError):
                errors.append('Semantic ledger reference mismatch: ' + str(row['object_id']))
    backlog = load(out / 'mappings/review-backlog.json')
    errors += validate_backlog(backlog, modules, load(out / 'catalog/dependencies.json'))
    for row in backlog['dynamic_candidates'] + backlog['unresolved_dependencies']:
        for ref in row['batch_refs']:
            try:
                record = referenced_record(root, ref)
                fields = ['object_id'] if 'object_id' in row else ['referencing_id', 'referenced_entity_name']
                if any(record.get(field) != row[field] for field in fields):
                    raise ValueError('Wrong review subject')
            except (ValueError, KeyError, IndexError, OSError):
                errors.append('Backlog batch reference mismatch: ' + ref)
    guide = load(out / 'mappings/configuration-guide.json')
    errors += validate_guidance(guide, help_data['sources'])
    reviewed = 0
    for family in coverage['families']:
        review = family.get('documentary_review')
        if not review:
            continue
        reviewed += 1
        if family['status'] != 'DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN' or not review['evidence_gaps']:
            errors.append('Unsupported family completion or missing gap: ' + family['family'])
        for source in review['sources']:
            if source not in help_data['sources'].values():
                errors.append('Family source not integrated: ' + family['family'])
        for association in family.get('batch_associations', []):
            try:
                source = referenced_record(root, association['batch_ref'])
                if source != {k: v for k, v in association.items() if k != 'batch_ref'}:
                    raise ValueError('Stale family association')
            except (ValueError, KeyError, IndexError, OSError):
                errors.append('Family batch association mismatch: ' + family['family'])
    if coverage['counts']['families_with_reviewed_documentary_passages'] != reviewed:
        errors.append('Documentary family count mismatch')
    if coverage['counts']['families_with_complete_deployment_review'] != 0:
        errors.append('Full deployment reconciliation not established by these batches')
    comparisons = load(out / 'mappings/source-reconciliation.json')
    sdd = load(root / comparisons['sdd_register_path'])
    topic_ids = {t['topic_id'] for t in help_data['topics']}
    object_ids = {o['object_id'] for o in objects}
    for row in comparisons['records']:
        if (not set(row['topic_ids']) <= topic_ids or not set(row['object_ids']) <= object_ids
                or not set(row['aim_refs']) <= help_data['sources'].keys() or not row['minimum_evidence']):
            errors.append('Source-reconciliation reference/gap mismatch: ' + row['reconciliation_id'])
        for group, ids in row['sdd_refs'].items():
            if not set(ids) <= {r['id'] for r in sdd[group]}:
                errors.append('Source-reconciliation SDD claim mismatch: ' + row['reconciliation_id'])
    acceptance = load(out / 'mappings/help-acceptance.json')
    if len({c['case_id'] for c in acceptance['cases']}) != len(acceptance['cases']):
        errors.append('Acceptance case identity collision')
    for case in acceptance['cases']:
        if (not set(case['topic_ids']) <= topic_ids or not case['expected_explanation'] or not case['forbidden_claim']
                or case['result'] != 'EXPECTATION_DEFINED_SEE_SEPARATE_HTTP_RECEIPT'):
            errors.append('Acceptance reference/boundary mismatch: ' + case['case_id'])
    runtime_path = out / 'catalog/query_store_runtime.json'
    runtime = load(out / 'mappings/runtime-profiles.json')
    runtime_expected = aggregate(load(runtime_path))
    if runtime['source_sha256'] != hashlib.sha256(runtime_path.read_bytes()).hexdigest():
        errors.append('Runtime profile source hash mismatch')
    if len(runtime['profiles']) != len(runtime_expected):
        errors.append('Runtime profile count mismatch')
    for actual, expected in zip(runtime['profiles'], runtime_expected):
        if any(actual.get(key) != value for key, value in expected.items()):
            errors.append('Runtime weighted profile or source-row binding mismatch')
        if actual.get('historical_definition_identity_established') is not False:
            errors.append('Runtime current definition overclaim')
    checks['dimension_preserving_runtime_profiles'] = len(runtime['profiles'])
    checks['retained_runtime_rows_accounted_for'] = sum(p['retained_interval_rows'] for p in runtime['profiles'])
    documents = rendered_documents()
    for name, text in documents.items():
        if (out / name).read_text(encoding='utf-8') != text.rstrip() + '\n':
            errors.append('Curated reading copy is stale: ' + name)
    checks.update(object_review_ledger_records=len(ledger['records']), bounded_semantic_contracts=len(contracts),
                  dynamic_candidates_tracked=len(backlog['dynamic_candidates']),
                  unresolved_dependencies_tracked=len(backlog['unresolved_dependencies']),
                  configuration_setting_contracts=guide['setting_count'],
                  families_with_reviewed_passages=reviewed, curated_reading_copies=len(documents),
                  source_reconciliations=len(comparisons['records']),
                  cross_cutting_acceptance_expectations=len(acceptance['cases']))
    return errors, checks
