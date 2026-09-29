"""Acquire a bounded AIM or SDK batch through the authorized Edge profile."""
import argparse
import json
import os
from pathlib import Path
import random
import time
from playwright.sync_api import sync_playwright
from collector import Store, writer_lock, now, atomic_json, read_json, SEEDS
from stage_transport import StageTransport, AcquisitionBlocked


def module_pilot(state, module):
    """The historical top-level pilot belongs only to AIM."""
    pilot = state.get('modules', {}).get(module, {}).get('pilot')
    if pilot is not None:
        return pilot
    return state.get('pilot', 'NOT_RUN') if module == 'AIM' else 'NOT_RUN'


def module_checkpoint(store, owner, module, *, phase=None, blockers=None, worker_running=False):
    """Track the active module without replacing the other module's evidence."""
    path = store.root / '_project/STATE.json'
    state = read_json(path)
    previous_module = state.get('module', 'AIM')
    modules = state.setdefault('modules', {})
    if previous_module != module:
        previous = modules.setdefault(previous_module, {})
        previous.setdefault('blockers', state.get('blockers', []))
    current = modules.setdefault(module, {})
    current.setdefault('pilot', module_pilot(state, module))
    if module == 'SDK' and current.get('status') in (None, 'WAITING_FOR_AIM'):
        current['status'] = 'DISCOVERY_INCOMPLETE'
    if blockers is not None:
        current['blockers'] = blockers
    state['module'] = module
    atomic_json(path, state)
    return store.checkpoint(owner, phase=phase, blockers=blockers, worker_running=worker_running)


def convert_draft(store, record):
    """Preserve shared draft conversion; SDK verification needs its own adapter."""
    if record['module'] == 'SDK':
        from sdk_article_data import convert
    else:
        from article_data import convert
    result = convert(store, record)
    if record['module'] == 'SDK':
        record.update(reading_copy_verified=False, article_local_complete=False,
                      fidelity_hold={'code': 'SDK_ADAPTER_VERIFICATION_REQUIRED',
                                     'detail': 'SDK draft conversion requires independent pilot and module fidelity verification.'})
        store.save_record(record)
    return result


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--module', choices=['AIM', 'SDK'], default='AIM')
    parser.add_argument('--kind', choices=['navigation', 'script', 'article', 'image', 'stylesheet', 'attachment', 'font', 'video'], default='navigation')
    parser.add_argument('--ids', nargs='*')
    parser.add_argument('--limit', type=int, default=12)
    parser.add_argument('--convert', action='store_true', help='Generate draft app JSON and reading copies after each original article commit.')
    args = parser.parse_args(argv)
    if args.limit < 1:
        parser.error('--limit must be positive')
    module = args.module
    root = Path(__file__).resolve().parents[1]
    private = Path(os.environ['LOCALAPPDATA']) / 'TAB/SCALE-Intelligence/private'
    runtime = private.parent / 'runtime'
    store = Store(root, cache_records=True)
    blocked = []
    saved = 0
    with writer_lock(root, runtime) as owner:
        state = read_json(root / '_project/STATE.json')
        if module == 'SDK':
            from module_policy import require_sdk_ready
            require_sdk_ready(store.root, state)
        report = store.verify(module='SDK' if module == 'SDK' else None)
        if report['failures']:
            raise ValueError('Saved bodies failed integrity verification')

        def checkpoint(**kwargs):
            return module_checkpoint(store, owner, module, **kwargs)

        def conversion_missing(record):
            return args.convert and record['type'] == 'article' and (not record.get('app_data_path') or
                not (root / record['app_data_path']).is_file() or
                any(not (root / record.get('reading_paths', {}).get(k, 'missing')).is_file() for k in ('html', 'markdown')))

        retryable = {'DNS', 'CONNECTION', 'TIMEOUT', 'RATE_LIMIT', 'TRANSIENT_HTTP', 'BLOCKED_AUTH', 'BLOCKED_PERMISSION', 'BLOCKED_AUTH_OR_SCOPE', 'CIRCUIT_OPEN', 'RATE_LIMIT_WAIT', 'EMPTY_BODY'}
        queue = [r for r in store.records(module) if r['type'] == args.kind and
                 (not (r.get('transport_metadata_verified') and r['status'] == 'BODY_SAVED') or conversion_missing(r)) and
                 (r['status'] == 'PENDING' or conversion_missing(r) or
                  (r['status'] == 'FAILED' and r.get('last_failure', {}).get('class') in retryable))]
        if args.ids:
            queue = [r for r in queue if r['id'] in args.ids]
        if not queue:
            print(json.dumps({'module': module, 'batch_saved': 0, 'eligible_resources': 0, 'worker_running': False}), flush=True)
            return 0
        seed = SEEDS[module].split('#', 1)[0]
        queue.sort(key=lambda r: (r['source_url'] != seed, r['discovered_at'], r['source_url']))
        pilot_passed = module_pilot(state, module) == 'PASSED'
        if module == 'SDK' and args.kind == 'article' and pilot_passed:
            from verify_sdk import pilot_proof_current
            proof = pilot_proof_current(store)
            if not proof['passed']:
                raise ValueError('SDK_PILOT_PROOF_NOT_CURRENT: ' + '; '.join(proof['issues']))
        if args.kind == 'article' and not pilot_passed:
            selection = read_json(root / ('_project/pilot-' + module + '.json'))
            if selection.get('module', module) != module:
                raise ValueError('Pilot selection belongs to another module')
            queue = [r for r in queue if r['id'] in selection['article_ids']]
            if not queue:
                raise ValueError('No eligible pilot articles; verify or explicitly revise the pilot selection')
        if args.kind == 'article':
            phase = module + '_CAPTURE_IN_PROGRESS' if pilot_passed else ('PILOT_IN_PROGRESS' if module == 'AIM' else 'SDK_PILOT_IN_PROGRESS')
        else:
            phase = 'DISCOVERY_IN_PROGRESS' if module == 'AIM' else 'SDK_DISCOVERY_IN_PROGRESS'
        checkpoint(phase=phase, blockers=[], worker_running=True)
        try:
            with sync_playwright() as playwright:
                context = playwright.chromium.launch_persistent_context(str(private / 'stage-edge-profile'), channel='msedge',
                    headless=False, chromium_sandbox=True, ignore_https_errors=False, bypass_csp=False)
                transport = StageTransport(context.request, module=module, cooldown_path=runtime / 'stage-cooldown.json')
                try:
                    for record in queue[:args.limit]:
                        if record.get('transport_metadata_verified') and record['status'] == 'BODY_SAVED' and conversion_missing(record):
                            convert_draft(store, record)
                            checkpoint(worker_running=True)
                            print(json.dumps({'module': module, 'conversion_recovered': record['id'], 'network_request': False}), flush=True)
                            continue
                        for attempt in range(1, 4):
                            record['attempts'] += 1
                            record['last_attempt_at'] = now()
                            store.save_record(record)
                            try:
                                body, metadata = transport.get(record['source_url'])
                                store.save_original(record, body, metadata)
                                if args.convert and record['type'] == 'article':
                                    try:
                                        convert_draft(store, record)
                                        record.pop('conversion_failure', None)
                                        store.save_record(record)
                                    except (ValueError, UnicodeError) as error:
                                        record['conversion_failure'] = {'class': 'PARSE_OR_FIDELITY', 'detail': str(error), 'at': now()}
                                        store.save_record(record)
                                saved += 1
                                print(json.dumps({'module': module, 'saved': record['id'], 'type': record['type'], 'bytes': len(body), 'batch_saved': saved}), flush=True)
                                break
                            except AcquisitionBlocked as error:
                                record.update(status='FAILED', last_failure={'class': error.code, 'detail': error.detail, 'at': now()})
                                store.save_record(record)
                                print(json.dumps({'module': module, 'resource': record['id'], 'failure': error.code, 'attempt': attempt}), flush=True)
                                if error.code in ('BLOCKED_AUTH', 'BLOCKED_PERMISSION', 'BLOCKED_AUTH_OR_SCOPE', 'CIRCUIT_OPEN', 'TLS', 'RATE_LIMIT_WAIT'):
                                    blocked = [{'code': error.code, 'detail': error.detail}]
                                    break
                                if error.code not in ('DNS', 'CONNECTION', 'TIMEOUT', 'RATE_LIMIT', 'TRANSIENT_HTTP') or attempt == 3:
                                    break
                                if transport.next_allowed - transport.clock() > 60:
                                    blocked = [{'code': 'RATE_LIMIT', 'detail': 'Retry-After exceeds this bounded operation; resume later'}]
                                    break
                                time.sleep((2 ** (attempt - 1)) + random.Random(record['id'] + str(attempt)).random())
                        checkpoint(blockers=blocked, worker_running=True)
                        if blocked:
                            break
                finally:
                    context.close()
        finally:
            incomplete = 'DISCOVERY_INCOMPLETE' if module == 'AIM' else 'SDK_DISCOVERY_INCOMPLETE'
            state = checkpoint(phase=blocked[0]['code'] if blocked else incomplete, blockers=blocked, worker_running=False)
            integrity_path = root / ('SDK/reports/local-integrity.json' if module == 'SDK' else '_project/local-integrity.json')
            atomic_json(integrity_path, store.verify(module='SDK' if module == 'SDK' else None))
        print(json.dumps({'module': module, 'batch_saved': saved, 'phase': state['phase'], 'blocked': blocked, 'worker_running': False}), flush=True)
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
