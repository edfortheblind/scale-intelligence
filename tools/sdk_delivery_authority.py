"""Deliver SDK acquisition authority without modifying AIM acceptance policy."""
import re
from collector import digest, read_json

OWNER = '_project/owner-acquisition-SDK.json'
DISPOSITION = '_project/sdk-pilot-disposition.json'
HISTORY = '_project/history/sdk-pilot-disposition-before-approval.json'
PILOT = '_project/pilot-SDK.json'
REVALIDATION = '_project/sdk-acquisition-revalidation.json'


def required_sdk_authority_paths(state):
    sdk = state.get('modules', {}).get('SDK', {})
    paths = []
    if sdk.get('pilot') not in (None, 'NOT_RUN') or sdk.get('acquisition_authorization') or sdk.get('acquisition_revalidation'):
        paths.append(PILOT)
    for key, expected in (('acquisition_authorization', OWNER), ('acquisition_revalidation', REVALIDATION)):
        binding = sdk.get(key)
        if binding is None:
            continue
        if not isinstance(binding, dict) or binding.get('path') != expected or not re.fullmatch(r'[0-9a-f]{64}', binding.get('sha256', '')):
            raise ValueError('Invalid SDK authority pointer: ' + key)
        paths.append(expected)
    if sdk.get('acquisition_revalidation') and not sdk.get('acquisition_authorization'):
        raise ValueError('SDK technical revalidation lacks original owner authority')
    if sdk.get('acquisition_authorization'):
        paths.extend((DISPOSITION, HISTORY))
    return sorted(set(paths))


def verify_sdk_authority(store, state, inventoried):
    failures = []
    try:
        paths = required_sdk_authority_paths(state)
        if not paths and any(r.get('status') == 'BODY_SAVED' for r in store.records('SDK')):
            failures.append({'error': 'SDK_CAPTURED_CORPUS_AUTHORITY_STATE_MISSING'})
        for relative in paths:
            if not (store.root / relative).is_file() or relative not in inventoried:
                failures.append({'path': relative, 'error': 'SDK_AUTHORITY_MISSING_OR_UNINVENTORIED'})
        sdk = state.get('modules', {}).get('SDK', {})
        for key in ('acquisition_authorization', 'acquisition_revalidation'):
            if sdk.get(key):
                binding = sdk[key]
                if digest((store.root / binding['path']).read_bytes()) != binding['sha256']:
                    failures.append({'path': binding['path'], 'error': 'SDK_AUTHORITY_STATE_HASH_MISMATCH'})
        if sdk.get('acquisition_authorization'):
            authority = read_json(store.root / OWNER)
            if digest((store.root / HISTORY).read_bytes()) != authority['baseline']['hashes'][DISPOSITION]:
                failures.append({'path': HISTORY, 'error': 'SDK_PRIOR_DISPOSITION_BASELINE_MISMATCH'})
        if paths:
            from sdk_acquisition_policy import sdk_acquisition_readiness
            readiness = sdk_acquisition_readiness(store, state)
            if not readiness.get('ready') or readiness.get('completion_granted') is not False:
                failures.append({'error': 'SDK_ACQUISITION_AUTHORITY_INVALID_OR_STALE', 'detail': readiness})
    except (OSError, ValueError, KeyError, TypeError) as error:
        failures.append({'error': 'SDK_AUTHORITY_PROOF_UNAVAILABLE', 'detail': str(error)})
    return failures
