"""Join retained Receiving configuration names to existing static DB contracts."""
from collections import defaultdict
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
BASE = ROOT / 'Snapdragon'


def read(path):
    return json.loads((ROOT / path).read_text(encoding='utf-8-sig'))


def sha(path):
    return hashlib.sha256((ROOT / path).read_bytes()).hexdigest()


def main():
    registry_path = 'Snapdragon/inventory/screen-registry.json'
    token_path = 'Snapdragon/database/safe-dependency-tokens.json'
    catalog_path = 'DB Architecture/catalog/objects.json'
    ledger_path = 'DB Architecture/mappings/object-review-ledger.json'
    roots = {4069, 2796, 2797, 2791, 2779, 2777, 2780, 4106, 4038}
    tokens, registry = read(token_path), read(registry_path)
    targets = {int(r['safe_value']) for r in tokens if r['form_id'] in roots
               and r['accepted'] and r['configuration_name'] == 'data-formId'}
    forms = roots | targets
    candidates = defaultdict(list)
    for row in registry:
        value = row.get('configuration_table_or_view')
        if row['form_id'] in forms and row['active'] == 'Y' and value:
            candidates[value].append({'form_id': row['form_id'], 'screen_id': row['main_ui_screen_id'],
                                      'source': 'FORM.TABLE_NAME', 'configuration_name': 'configuration_table_or_view'})
    for row in tokens:
        if row['form_id'] not in forms or not row['accepted']:
            continue
        if row['token_kind'] == 'stored_procedure_identifier' or row['configuration_name'] == 'data-dbtable':
            candidates[row['safe_value']].append({'form_id': row['form_id'], 'screen_id': row['main_ui_screen_id'],
                'control_id': row['screen_control_id'], 'source': row['source_table'],
                'source_object_id': row['object_id'], 'configuration_name': row['configuration_name']})
    objects = read(catalog_path)
    ledger = {r['object_id']: r for r in read(ledger_path)['records']}
    input_paths = {registry_path, token_path, catalog_path, ledger_path}
    records, evidence_errors = [], []
    for name, refs in sorted(candidates.items(), key=lambda x: x[0].casefold()):
        found = [o for o in objects if (o['qualified_name'] if '.' in name else o['name']).casefold() == name.casefold()]
        record = {'configured_name': name, 'references': refs,
                  'match_rule': 'case-insensitive exact qualified name' if '.' in name else 'unique case-insensitive unqualified catalog name',
                  'catalog_matches': [{'object_id': o['object_id'], 'qualified_name': o['qualified_name'], 'type': o['type']} for o in found],
                  'status': 'no_catalog_match' if not found else ('ambiguous_catalog_name' if len(found) != 1 else 'catalog_matched'),
                  'contract_ref': None}
        if len(found) == 1:
            object_id = found[0]['object_id']
            entry = ledger.get(object_id, {})
            ref = entry.get('semantic_contract_ref')
            record['role_review'] = entry.get('role_review', 'not_in_role_ledger')
            if ref:
                path, pointer = ref.split('#', 1)
                input_paths.add(path)
                contract = read(path)
                for key in pointer.strip('/').split('/'):
                    contract = contract[int(key)] if isinstance(contract, list) else contract[key]
                if contract['object_id'] != object_id:
                    raise ValueError(f'Contract identity mismatch: {object_id}')
                record.update(status='static_contract_reconciled', contract_ref=ref,
                    contract_sha256=sha(path), purpose=contract.get('purpose'),
                    output_shape=contract.get('output_shape', []),
                    null_and_invalid_input_behavior=contract.get('null_and_invalid_input_behavior', []),
                    inputs_defaults=contract.get('inputs_defaults', []),
                    external_handoffs_and_gaps=contract.get('external_handoffs_and_gaps', []),
                    source_definition_sha256=contract.get('source_definition_sha256'))
                verified = []
                for evidence in contract.get('evidence', []):
                    path = evidence.get('path')
                    if path and evidence.get('sha256'):
                        input_paths.add(path)
                        ok = sha(path) == evidence['sha256']
                        verified.append({'path': path, 'sha256': sha(path), 'hash_matches': ok})
                        if not ok:
                            evidence_errors.append(path)
                record['retained_evidence_hashes'] = verified
        records.append(record)
    counts = {'configured_names': len(records), 'references': sum(len(r['references']) for r in records),
              'catalog_matched': sum(len(r['catalog_matches']) == 1 for r in records),
              'static_contract_reconciled': sum(r['status'] == 'static_contract_reconciled' for r in records),
              'unmatched': sum(r['status'] == 'no_catalog_match' for r in records),
              'ambiguous': sum(r['status'] == 'ambiguous_catalog_name' for r in records)}
    result = {'schema_version': 1, 'scope': 'SD-11 retained configuration to existing static contract reconciliation',
        'root_forms': sorted(roots), 'direct_target_forms': sorted(targets), 'counts': counts,
        'input_sha256': {p: sha(p) for p in sorted(input_paths)}, 'records': records,
        'verification': {'status': 'PASS' if not evidence_errors else 'FAIL', 'source_hash_errors': evidence_errors},
        'limits': ['Exact configured names do not prove runtime resolution or caller behavior.',
                   'No catalog match is a snapshot gap; it is not proof that a configured name is invalid.',
                   'Static contracts are reused from the existing DB assessment; no routine execution or new full-body review occurred.',
                   'API/controller implementation, effective settings, selected-record behavior and permissions remain separate.',
                   'The database snapshot and the later UI configuration capture have different observation times.']}
    out = BASE / 'receiving/backend-bindings.json'
    out.parent.mkdir(exist_ok=True)
    out.write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8')
    print(json.dumps({'counts': counts, 'verification': result['verification']}, indent=2))
    raise SystemExit(bool(evidence_errors))


if __name__ == '__main__':
    main()
