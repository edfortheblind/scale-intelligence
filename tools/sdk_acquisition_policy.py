"""Owner-authorized SDK acquisition only; never grants fidelity or completion."""
from functools import lru_cache
import json
import re
from collector import read_json, digest, now
import module_policy
import verify_sdk

AUTHORIZATION_PATH = '_project/owner-acquisition-SDK.json'
STATUS = 'OWNER_AUTHORIZED_ACQUISITION_WITH_SOURCE_GAPS'
REPORT = 'SDK/reports/pilot.json'
SELECTION = '_project/pilot-SDK.json'
GAPS = 'SDK/reports/source-gaps.json'
DISPOSITION = '_project/sdk-pilot-disposition.json'
BASELINE_PATHS = (REPORT, SELECTION, GAPS, DISPOSITION,
                  '01_AIM_MASTER_PROMPT.md', '02_SDK_MASTER_PROMPT.md')
PERMISSIONS = {'bulk_acquisition': True, 'pilot_passed': False,
               'module_local_complete': False, 'complete_corpus': False,
               'source_gap_waiver': False}


def _hash(value):
    return digest(json.dumps(value, sort_keys=True, separators=(',', ':')).encode())


def _owner_answer(store, instruction):
    disposition = read_json(store.root / DISPOSITION)
    if (disposition.get('module') != 'SDK' or disposition.get('owner_answer') != instruction or
            disposition.get('bulk_authorized_with_failed_pilot') is not True or
            disposition.get('technical_pilot_status') != 'FAILED' or
            disposition.get('completion_exception_granted') is not False):
        raise ValueError('Owner disposition does not authorize acquisition only')


def _fresh_generation(store, report, generation, catalog, documents):
    initial = report.get('inputs') or {}
    if generation == initial:
        return
    old = {f['path']: f for f in initial.get('files', [])}
    new = {f['path']: f for f in generation['files']}
    if set(old) != set(new) or generation.get('catalog_identity') != initial.get('catalog_identity'):
        raise ValueError('SDK pilot original identity/metadata inputs changed')
    changed = [p for p in old if old[p] != new[p]]
    allowed = {catalog[d['id']]['app_data_path'] for d in documents}
    allowed.update(d['reading'][kind] for d in documents for kind in ('html', 'markdown'))
    if any(p not in allowed for p in changed):
        raise ValueError('SDK pilot source, support or semantic code inputs changed')
    # Evolving links/metadata may change derivatives. Rebuild them from the same
    # source bytes and independently verify the current trees and inert reading.
    for data in documents:
        record = catalog[data['id']]
        _, content, _, _, _ = verify_sdk.adapter.parse_article(record, (store.root / record['local_path']).read_bytes())
        if (data['content_tree'] != content or data['inventory'] != verify_sdk.adapter.inventory(content) or
                not verify_sdk.verify_reading(store.root, record, data, content, catalog)['passed']):
            raise ValueError('Changed SDK derivative fails source/reading fidelity')
    failures, recovered = verify_sdk.recovery_check(store, catalog, documents)
    if failures or sorted(r['id'] for r in recovered) != sorted(d['id'] for d in documents):
        raise ValueError('Changed SDK derivatives fail deterministic recovery')


@lru_cache(maxsize=16)
def _baseline(root, commit):
    if not re.fullmatch(r'[0-9a-f]{40}', commit or '') or module_policy._commit(root, commit) != commit:
        raise ValueError('SDK acquisition baseline must be an existing exact Git commit')
    blobs = {p: module_policy._git_blob(root, commit, p) for p in BASELINE_PATHS}
    values = {p: json.loads(blobs[p]) for p in (REPORT, SELECTION, GAPS, DISPOSITION)}
    disposition = values[DISPOSITION]
    if (disposition.get('status') != 'AWAITING_OWNER_DECISION' or
            disposition.get('module') != 'SDK' or disposition.get('pilot') != REPORT or
            disposition.get('gaps') != GAPS or disposition.get('bulk_authorized_with_failed_pilot') is not False):
        raise ValueError('Baseline does not preserve the pending SDK acquisition question')
    return {'commit': commit, 'hashes': {p: digest(raw) for p, raw in blobs.items()},
            'values': values}


def _missing_snapshot(gaps):
    result = []
    for item in gaps['missing_resources']:
        failure = item.get('last_failure', {})
        if failure.get('class') != 'NOT_FOUND' or failure.get('detail') != 'HTTP 404':
            raise ValueError('Only documented HTTP 404 source gaps permit acquisition')
        occurrences = item.get('published_occurrences')
        if not occurrences:
            raise ValueError('Source gap lacks published provenance')
        result.append({'id': item['id'], 'url': item['url'], 'type': item['type'],
                       'failure': {'class': 'NOT_FOUND', 'detail': 'HTTP 404'},
                       'published_occurrences': sorted(occurrences, key=_hash)})
    if not result or len({r['id'] for r in result}) != len(result):
        raise ValueError('Initial missing-resource catalog is empty or duplicated')
    return sorted(result, key=lambda item: item['id'])


def _provenance(store, catalog, missing):
    """Verify initial identities; additional discoveries/occurrences do not expire them."""
    sources = {}
    for item in missing:
        record = catalog[item['id']]
        if (record.get('module') != 'SDK' or record.get('status') != 'FAILED' or
                record.get('source_url') != item['url'] or record.get('type') != item['type'] or
                any(record.get('last_failure', {}).get(k) != v for k, v in item['failure'].items())):
            raise ValueError('Initial source failure identity or HTTP 404 classification changed')
        for occurrence in item['published_occurrences']:
            if not any(all(current.get(k) == v for k, v in occurrence.items())
                       for current in record.get('occurrences', [])):
                raise ValueError('Initial published occurrence is no longer in the catalog')
            match = re.match(r'^([0-9a-f]{64})@([0-9a-f]{64}):', occurrence['discovery_source'])
            if not match or occurrence.get('resolved_url') != item['url']:
                raise ValueError('Initial source-gap provenance is not an exact published identity')
            identifier, expected = match.groups()
            source = catalog[identifier]
            if source.get('status') != 'BODY_SAVED' or source.get('sha256') != expected:
                raise ValueError('Published source-gap evidence changed')
            raw = (store.root / source['local_path']).read_bytes()
            if digest(raw) != expected:
                raise ValueError('Published source-gap original bytes changed')
            sources[identifier] = {'id': identifier, 'path': source['local_path'],
                                   'sha256': expected, 'byte_count': len(raw)}
    return [sources[k] for k in sorted(sources)]


def _check_failed_pilot(store, report, selection, missing):
    if (report.get('status') != 'FAILED' or report.get('module') != 'SDK' or
            report.get('mode') != 'pilot' or report.get('module_local_complete') is not False or
            selection.get('module') != 'SDK' or selection.get('status') != 'FAILED' or
            selection.get('report') != REPORT or report.get('converter_version') != verify_sdk.adapter.CONVERTER):
        raise ValueError('A complete, technically FAILED SDK pilot report is required')
    ids = selection['article_ids']
    if len(ids) < 5 or len(ids) != len(set(ids)) or report.get('selected_article_ids') != ids:
        raise ValueError('SDK pilot selection is incomplete or changed')
    if not all(report.get('formats', {}).get(k) is True for k in
               ('welcome', 'substantial_code', 'parameter_or_field_table', 'image_bearing', 'tab_or_expandable')):
        raise ValueError('SDK pilot representative format evidence is incomplete')
    catalog = {r['id']: r for r in store.records('SDK')}
    documents = [read_json(store.root / catalog[i]['app_data_path']) for i in ids]
    by_id = {d['id']: d for d in documents}
    allowed = {r['id'] for r in missing}
    provenance = _provenance(store, catalog, missing)
    support = {r['target_id'] for d in documents for r in d['references']
               if r['classification'] == 'internal' and catalog.get(r.get('target_id'), {}).get('type') != 'article'}
    support, styles, failures = verify_sdk.support_closure(store, catalog, support)
    if report.get('support_ids') != sorted(support):
        raise ValueError('SDK pilot support selection changed')
    generation = verify_sdk.input_generation(store, catalog, set(ids) | support, documents, styles)
    _fresh_generation(store, report, generation, catalog, documents)
    for field in ('resources', 'browser', 'recovery'):
        if sorted(r['id'] for r in report.get(field, [])) != sorted(ids):
            raise ValueError('SDK pilot evidence is partial: ' + field)
    if any(r.get('active_elements') != 0 for r in report['browser']) or any(
            r.get(k) is not True for r in report['recovery'] for k in
            ('idempotent', 'interruption_preserved_prior_bytes', 'missing_derivative_recovered')):
        raise ValueError('SDK pilot browser/recovery evidence failed')
    # Check all current closure failures as well as every historical pilot issue.
    issues = report.get('issues')
    if not issues:
        raise ValueError('FAILED pilot has no diagnostic evidence')
    for issue in issues + failures:
        error = issue.get('error'); identifier = issue.get('id')
        if error == 'REQUIRED_SUPPORT_NOT_CAPTURED':
            if identifier not in allowed:
                raise ValueError('Undocumented support failure')
        elif error == 'CONVERTER_CHECKS_FAILED':
            data = by_id[identifier]; checks = data['verification']['checks']
            absent = data['verification'].get('missing_direct_assets', [])
            if (issue.get('checks') != checks or not absent or not set(absent) <= allowed or
                    {k for k, v in checks.items() if v is not True} != {'direct_assets_available'}):
                raise ValueError('Local converter fidelity failure cannot be waived for acquisition')
        elif error == 'CSS_CLOSURE_INCOMPLETE':
            data = read_json(store.root / ('SDK/data/stylesheets/' + identifier + '.json'))
            absent = {r['target_id'] for r in data['references'] if r['classification'] == 'internal'
                      and catalog[r['target_id']]['status'] != 'BODY_SAVED'}
            if (data.get('unsafe_css_detected') is not False or
                    data['source_sha256'] != catalog[identifier]['sha256'] or
                    not absent or not absent <= allowed):
                raise ValueError('CSS failure is not solely documented source HTTP 404')
        elif error == 'OFFLINE_IMAGE_FAILED':
            bad = [i for i in issue.get('images', []) if not i.get('complete') or not i.get('width') or not i.get('height')]
            refs = by_id[identifier]['references']
            if not bad or any(not any(r.get('node_id') == img.get('node') and r.get('tag') == 'img'
                    and r.get('classification') == 'internal' and r.get('target_id') in allowed for r in refs) for img in bad):
                raise ValueError('Offline image failure is not solely documented source HTTP 404')
        else:
            raise ValueError('Non-source/local pilot failure cannot be waived: ' + str(error))
    return {'inputs_sha256': report['inputs']['sha256'], 'provenance_inputs': provenance}


def build_sdk_acquisition_exception(store, exact_owner_instruction, baseline_commit):
    """Return a reviewable record only; caller saves it under the writer lock."""
    if not isinstance(exact_owner_instruction, str) or not exact_owner_instruction.strip():
        raise ValueError('Exact owner instruction is required')
    _owner_answer(store, exact_owner_instruction)
    baseline = _baseline(str(store.root), baseline_commit)
    for path in (REPORT, SELECTION, GAPS, '01_AIM_MASTER_PROMPT.md', '02_SDK_MASTER_PROMPT.md'):
        if digest((store.root / path).read_bytes()) != baseline['hashes'][path]:
            raise ValueError('Current authority/pilot differs from the immutable decision checkpoint: ' + path)
    values = baseline['values']; missing = _missing_snapshot(values[GAPS])
    evidence = _check_failed_pilot(store, values[REPORT], values[SELECTION], missing)
    return {'schema_version': 1, 'module': 'SDK', 'status': STATUS, 'recorded_at': now(),
            'owner_instruction': exact_owner_instruction, 'permissions': dict(PERMISSIONS),
            'baseline': {'commit': baseline_commit, 'hashes': baseline['hashes']},
            'initial_missing_catalog': missing, 'initial_missing_catalog_sha256': _hash(missing),
            'evidence': evidence, 'scope': 'Continue SDK acquisition only. Initial and newly discovered source gaps remain unresolved; pilot and completion evidence remain separate.'}


def sdk_acquisition_readiness(store, state=None):
    """Acquisition gate only. This result must never be used as a completion gate."""
    state = state if state is not None else read_json(store.root / '_project/STATE.json')
    sdk = state.get('modules', {}).get('SDK', {})
    if sdk.get('pilot') == 'PASSED':
        proof = verify_sdk.pilot_proof_current(store)
        issues = [] if proof['passed'] else ['SDK_PILOT_PROOF_NOT_CURRENT', *proof['issues']]
        return {'ready': proof['passed'], 'basis': 'current_passed_pilot', 'issues': issues, 'completion_granted': False}
    if sdk.get('acquisition_revalidation') is not None:
        from sdk_acquisition_revalidation import revalidation_readiness
        return revalidation_readiness(store, state)
    binding = sdk.get('acquisition_authorization')
    if binding is None:
        return {'ready': False, 'basis': 'pilot_only', 'issues': ['SDK_ACQUISITION_AUTHORIZATION_REQUIRED'], 'completion_granted': False}
    try:
        raw = (store.root / AUTHORIZATION_PATH).read_bytes(); record = json.loads(raw)
        if binding != {'path': AUTHORIZATION_PATH, 'sha256': digest(raw)}:
            raise ValueError('SDK acquisition authorization binding changed')
        if (record.get('schema_version') != 1 or record.get('module') != 'SDK' or
                record.get('status') != STATUS or record.get('permissions') != PERMISSIONS or
                not isinstance(record.get('owner_instruction'), str) or not record['owner_instruction'].strip()):
            raise ValueError('Explicit acquisition-only owner authorization is required')
        _owner_answer(store, record['owner_instruction'])
        baseline = _baseline(str(store.root), record['baseline']['commit'])
        if record['baseline'] != {'commit': baseline['commit'], 'hashes': baseline['hashes']}:
            raise ValueError('Immutable SDK baseline binding changed')
        for path in (REPORT, SELECTION, '01_AIM_MASTER_PROMPT.md', '02_SDK_MASTER_PROMPT.md'):
            if digest((store.root / path).read_bytes()) != baseline['hashes'][path]:
                raise ValueError('Current authority/pilot differs from immutable baseline: ' + path)
        if sdk.get('pilot') != 'FAILED' or sdk.get('pilot_proof') != {'path': REPORT, 'sha256': baseline['hashes'][REPORT]}:
            raise ValueError('SDK technical FAILED pilot proof must remain recorded')
        missing = _missing_snapshot(baseline['values'][GAPS])
        if record.get('initial_missing_catalog') != missing or record.get('initial_missing_catalog_sha256') != _hash(missing):
            raise ValueError('Initial source-gap catalog/provenance binding changed')
        current = _check_failed_pilot(store, baseline['values'][REPORT], baseline['values'][SELECTION], missing)
        if record.get('evidence') != current:
            raise ValueError('SDK initial input generation/provenance changed')
        return {'ready': True, 'basis': 'owner_authorized_acquisition_with_source_gaps',
                'authorization': AUTHORIZATION_PATH, 'technical_pilot': 'FAILED', 'completion_granted': False, 'issues': []}
    except (OSError, ValueError, KeyError, TypeError) as error:
        return {'ready': False, 'basis': 'invalid_authorization', 'issues': [str(error)], 'completion_granted': False}
