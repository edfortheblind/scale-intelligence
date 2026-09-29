"""Refresh technical SDK acquisition proof without renewing or expanding authority.

The original owner instruction and immutable decision checkpoint remain intact.
A refreshed FAILED pilot may permit acquisition only when every failure is a
documented published HTTP 404 consequence. No completion exception is granted.
"""
import argparse
import json
from pathlib import Path
import os
from collector import Store, read_json, atomic_json, digest, now, writer_lock

PATH = '_project/sdk-acquisition-revalidation.json'
STATUS = 'TECHNICALLY_REVALIDATED_EXISTING_ACQUISITION_AUTHORITY'
SEMANTICS = ('tools/sdk_acquisition_policy.py', 'tools/sdk_acquisition_revalidation.py')


def _binding(root, path):
    return {'path': path, 'sha256': digest((root / path).read_bytes())}


def _authority(store, state):
    # Local imports keep the collector/policy dependency graph acyclic.
    import sdk_acquisition_policy as policy
    sdk = state.get('modules', {}).get('SDK', {})
    binding = _binding(store.root, policy.AUTHORIZATION_PATH)
    if sdk.get('acquisition_authorization') != binding:
        raise ValueError('Original SDK owner authorization binding changed')
    record = read_json(store.root / policy.AUTHORIZATION_PATH)
    if (record.get('schema_version') != 1 or record.get('module') != 'SDK' or
            record.get('status') != policy.STATUS or record.get('permissions') != policy.PERMISSIONS or
            not isinstance(record.get('owner_instruction'), str) or not record['owner_instruction'].strip()):
        raise ValueError('Original explicit acquisition-only owner authorization is required')
    policy._owner_answer(store, record['owner_instruction'])
    baseline = policy._baseline(str(store.root), record['baseline']['commit'])
    if record['baseline'] != {'commit': baseline['commit'], 'hashes': baseline['hashes']}:
        raise ValueError('Original immutable SDK decision checkpoint changed')
    for path in ('01_AIM_MASTER_PROMPT.md', '02_SDK_MASTER_PROMPT.md'):
        if digest((store.root / path).read_bytes()) != baseline['hashes'][path]:
            raise ValueError('SDK authority prompt changed: ' + path)
    initial = policy._missing_snapshot(baseline['values'][policy.GAPS])
    if (record.get('initial_missing_catalog') != initial or
            record.get('initial_missing_catalog_sha256') != policy._hash(initial)):
        raise ValueError('Original missing-resource evidence changed')
    # Validate historical provenance against the immutable initial proof rather
    # than requiring currently repaired sources/derivatives to remain old bytes.
    expected_sources = {}
    for item in initial:
        for occurrence in item['published_occurrences']:
            match = policy.re.match(r'^([0-9a-f]{64})@([0-9a-f]{64}):', occurrence['discovery_source'])
            if not match or occurrence.get('resolved_url') != item['url']:
                raise ValueError('Original published provenance is invalid')
            identifier, expected = match.groups()
            if identifier in expected_sources and expected_sources[identifier] != expected:
                raise ValueError('Original provenance source identities conflict')
            expected_sources[identifier] = expected
    evidence = record.get('evidence') or {}
    proof = baseline['values'][policy.REPORT]
    files = {f['path']: f for f in proof['inputs']['files']}
    sources = evidence.get('provenance_inputs', [])
    # Initial authorization also documented globally discovered CSS gaps whose
    # parent stylesheet was outside the pilot subset. Bind those parent bodies
    # directly to the same immutable Git checkpoint rather than dropping them.
    for source in sources:
        if source.get('path') not in files:
            raw = policy.module_policy._git_blob(str(store.root), baseline['commit'], source['path'])
            manifest = json.loads(policy.module_policy._git_blob(str(store.root), baseline['commit'],
                'SDK/manifests/resources/' + source['id'] + '.json'))
            if any(manifest.get(k) != v for k, v in
                   {'id': source['id'], 'local_path': source['path'], 'sha256': source['sha256'],
                    'byte_count': source['byte_count'], 'status': 'BODY_SAVED'}.items()):
                raise ValueError('Original provenance parent differs from its immutable manifest')
            files[source['path']] = {'path': source['path'], 'sha256': digest(raw), 'byte_count': len(raw)}
    if (evidence.get('inputs_sha256') != proof['inputs']['sha256'] or
            len(sources) != len(expected_sources) or
            {s.get('id'): s.get('sha256') for s in sources} != expected_sources or
            any(files.get(s.get('path')) != {k: s[k] for k in ('path', 'sha256', 'byte_count')}
                for s in sources)):
        raise ValueError('Original SDK proof/provenance does not match its immutable checkpoint')
    return record, baseline, binding


def _current(store, state, baseline, missing=None):
    import sdk_acquisition_policy as policy
    verify = policy.verify_sdk
    sdk = state['modules']['SDK']
    report = read_json(store.root / policy.REPORT)
    selection = read_json(store.root / policy.SELECTION)
    report_binding = _binding(store.root, policy.REPORT)
    if sdk.get('pilot') != 'FAILED' or sdk.get('pilot_proof') != report_binding:
        raise ValueError('A current bound technical FAILED pilot is required')
    if selection.get('article_ids') != baseline['values'][policy.SELECTION]['article_ids']:
        raise ValueError('The originally authorized representative selection changed')
    catalog = {r['id']: r for r in store.records('SDK')}
    ids = selection['article_ids']
    documents = [read_json(store.root / catalog[i]['app_data_path']) for i in ids]
    support = {r['target_id'] for d in documents for r in d['references']
               if r['classification'] == 'internal' and catalog.get(r.get('target_id'), {}).get('type') != 'article'}
    support, styles, _ = verify.support_closure(store, catalog, support)
    generation = verify.input_generation(store, catalog, set(ids) | support, documents, styles)
    # A technical revalidation requires newly verified current bytes. It cannot
    # adopt an old browser result merely by reconstructing changed derivatives.
    if generation != report.get('inputs'):
        raise ValueError('Refreshed SDK pilot inputs are stale; rerun the affected pilot checks')
    missing_ids = {i for i in support if catalog.get(i, {}).get('status') != 'BODY_SAVED'}
    if missing is None:
        gaps = read_json(store.root / policy.GAPS)
        missing = policy._missing_snapshot({'missing_resources': [r for r in gaps['missing_resources'] if r['id'] in missing_ids]})
    if {r['id'] for r in missing} != missing_ids or len(missing) != len(missing_ids):
        raise ValueError('Current pilot support gaps lack exact published failure evidence')
    evidence = policy._check_failed_pilot(store, report, selection, missing)
    return {'pilot': report_binding, 'selection': _binding(store.root, policy.SELECTION),
            'input_generation_sha256': generation['sha256'], 'evidence': evidence,
            'pilot_missing_catalog': missing, 'pilot_missing_catalog_sha256': policy._hash(missing)}


def _semantics(store):
    return [_binding(store.root, path) for path in SEMANTICS]


def build_revalidation(store, reason, state=None):
    """Return a record only. Caller persists it and its state binding atomically."""
    import sdk_acquisition_policy as policy
    if not isinstance(reason, str) or not reason.strip():
        raise ValueError('A technical revalidation reason is required')
    state = read_json(store.root / '_project/STATE.json') if state is None else state
    authority, baseline, binding = _authority(store, state)
    current = _current(store, state, baseline)
    return {'schema_version': 1, 'module': 'SDK', 'status': STATUS, 'recorded_at': now(),
            'reason': reason, 'original_authorization': binding,
            'owner_instruction': authority['owner_instruction'],
            'baseline_commit': baseline['commit'], 'permissions': dict(policy.PERMISSIONS),
            'technical_pilot_status': 'FAILED', 'completion_granted': False,
            'policy_semantics': _semantics(store), 'current': current,
            'scope': 'Technical revalidation of existing owner-authorized acquisition only. Original source failures remain historical facts; current source gaps remain unresolved. No renewed owner approval or completion waiver is inferred.'}


def revalidation_readiness(store, state=None):
    """Check the refreshed proof; never falls back to stale initial evidence."""
    import sdk_acquisition_policy as policy
    state = read_json(store.root / '_project/STATE.json') if state is None else state
    try:
        sdk = state['modules']['SDK']
        if sdk.get('acquisition_revalidation') != _binding(store.root, PATH):
            raise ValueError('SDK technical revalidation binding changed')
        record = read_json(store.root / PATH)
        authority, baseline, binding = _authority(store, state)
        if (record.get('schema_version') != 1 or record.get('module') != 'SDK' or
                record.get('status') != STATUS or record.get('permissions') != policy.PERMISSIONS or
                record.get('completion_granted') is not False or record.get('technical_pilot_status') != 'FAILED' or
                record.get('original_authorization') != binding or
                record.get('owner_instruction') != authority['owner_instruction'] or
                record.get('baseline_commit') != baseline['commit']):
            raise ValueError('SDK technical revalidation expanded or changed owner authority')
        if record.get('policy_semantics') != _semantics(store):
            raise ValueError('SDK acquisition policy changed since technical revalidation')
        current = _current(store, state, baseline, record['current']['pilot_missing_catalog'])
        if current != record.get('current'):
            raise ValueError('SDK pilot proof changed since technical revalidation')
        return {'ready': True, 'basis': 'technically_revalidated_existing_owner_authority',
                'authorization': policy.AUTHORIZATION_PATH, 'revalidation': PATH,
                'technical_pilot': 'FAILED', 'completion_granted': False, 'issues': []}
    except (OSError, ValueError, KeyError, TypeError) as error:
        return {'ready': False, 'basis': 'invalid_technical_revalidation',
                'completion_granted': False, 'issues': [str(error)]}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--reason', required=True)
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[1]
    runtime = Path(os.environ['LOCALAPPDATA']) / 'TAB/SCALE-Intelligence/runtime'
    with writer_lock(root, runtime):
        store = Store(root, cache_records=True)
        state = read_json(root / '_project/STATE.json')
        record = build_revalidation(store, args.reason, state)
        # Crash between these atomic writes is fail-closed. Rerunning finishes
        # the same transition without changing the original owner authorization.
        atomic_json(root / PATH, record)
        state['modules']['SDK']['acquisition_revalidation'] = _binding(root, PATH)
        atomic_json(root / '_project/STATE.json', state)
        result = revalidation_readiness(store, state)
        if not result['ready']:
            raise ValueError('; '.join(result['issues']))
        print(json.dumps(result))


if __name__ == '__main__':
    main()
