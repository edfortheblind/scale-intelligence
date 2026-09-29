"""Resume bounded SDK acquisition using published references and the owner disposition.

Original acquisition and derivative generation use the existing single-writer
lock. This controller has a separate process lease and grants no completion gate.
"""
import argparse
from collections import Counter
import json
import os
from pathlib import Path
from urllib.parse import urljoin
import signal
import subprocess
import sys

from collector import Store, atomic_json, read_json, writer_lock, now, digest
from acquire import module_checkpoint
from run_aim import eligible


def support(root):
    from discover_sdk import parse_navigation, candidates, add_reference, nodes
    from style_data import convert_styles
    runtime = Path(os.environ['LOCALAPPDATA']) / 'TAB/SCALE-Intelligence/runtime'
    with writer_lock(root, runtime) as owner:
        store = Store(root, cache_records=True)
        reports = []
        for record in list(store.records('SDK')):
            if record['type'] != 'article' or record['status'] != 'BODY_SAVED':
                continue
            raw = (root / record['local_path']).read_bytes()
            if digest(raw) != record['sha256']:
                raise ValueError('SDK original hash mismatch: ' + record['id'])
            try:
                parser, encoding = parse_navigation(record, raw)
            except (ValueError, UnicodeError) as error:
                reports.append({'id': record['id'], 'source_sha256': record['sha256'],
                                'references': [], 'parse_errors': [str(error)]})
                continue
            bases = [n['attrs']['href'] for n in nodes(parser.root)
                     if n['tag'] == 'base' and n['attrs'].get('href')]
            base = record.get('final_url') or record['source_url']
            if bases:
                base = urljoin(base, bases[0])
            refs = [add_reference(store, record, node, attr, href,
                    base, 'article')
                    for node, attr, href in candidates(parser, 'article')]
            reports.append({'id': record['id'], 'source_sha256': record['sha256'],
                            'references': refs, 'parse_errors': parser.errors})
        atomic_json(root / 'SDK/reports/article-reference-preflight.json', reports)
        styles = convert_styles(store, 'SDK')
        module_checkpoint(store, owner, 'SDK', phase='SDK_SUPPORT_DISCOVERY', worker_running=False)
        print(json.dumps({'module': 'SDK', 'article_count': len(reports),
                          'style_count': len(styles), 'parse_error_count': sum(len(r['parse_errors']) for r in reports)}), flush=True)


def run(root, max_cycles=20):
    private = Path(os.environ['LOCALAPPDATA']) / 'TAB/SCALE-Intelligence/private'
    runtime = private.parent / 'runtime'
    private.mkdir(parents=True, exist_ok=True)
    controller = {'pid': os.getpid(), 'started_at': now(), 'running': True,
                  'module': 'SDK', 'scope': 'acquisition_only',
                  'log_location': '%LOCALAPPDATA%/TAB/SCALE-Intelligence/private/sdk-controller.log'}

    def mark(phase, blockers):
        with writer_lock(root, runtime) as owner:
            store = Store(root, cache_records=True)
            state = read_json(root / '_project/STATE.json')
            state['controller'] = controller
            atomic_json(root / '_project/STATE.json', state)
            module_checkpoint(store, owner, 'SDK', phase=phase, blockers=blockers, worker_running=False)

    stopping = []
    previous = signal.signal(signal.SIGINT, lambda signum, frame: stopping.append(signum))
    try:
        with writer_lock(root, runtime / 'controller-lease'), (private / 'sdk-controller.log').open('a', encoding='utf-8', buffering=1) as log:
            def step(script, *args):
                if stopping:
                    raise RuntimeError('CONTROLLER_INTERRUPTED_AFTER_SAFE_CHILD_EXIT')
                command = [sys.executable, '-B', '-u', script, *args]
                log.write(json.dumps({'at': now(), 'command': command}) + '\n')
                result = subprocess.run(command, cwd=root, stdout=log, stderr=log,
                    creationflags=subprocess.CREATE_NEW_PROCESS_GROUP if os.name == 'nt' else 0)
                if stopping:
                    raise RuntimeError('CONTROLLER_INTERRUPTED_AFTER_SAFE_CHILD_EXIT')
                if result.returncode:
                    raise RuntimeError('LOCAL_STEP_FAILED:' + script + ':exit=' + str(result.returncode))
                state = read_json(root / '_project/STATE.json')
                blockers = state.get('blockers', [])
                if any(b.get('code') in {'BLOCKED_AUTH','BLOCKED_PERMISSION','BLOCKED_AUTH_OR_SCOPE','CIRCUIT_OPEN','TLS','RATE_LIMIT','RATE_LIMIT_WAIT'} for b in blockers):
                    raise RuntimeError('EXTERNAL_ACQUISITION_BLOCKER:' + str(blockers))

            try:
                # acquire.py revalidates the exact owner exception before every article batch.
                mark('SDK_CAPTURE_READY', [])
                for cycle in range(max_cycles):
                    before = [(r['id'], r['status'], r.get('sha256')) for r in Store(root).records('SDK')]
                    step('tools/acquire.py', '--module', 'SDK', '--kind', 'article', '--limit', '100', '--convert')
                    step('tools/run_sdk.py', '--support-only')
                    for kind in ('navigation', 'script', 'stylesheet'):
                        step('tools/acquire.py', '--module', 'SDK', '--kind', kind, '--limit', '1000')
                    step('tools/run_sdk.py', '--support-only')
                    for kind in ('image', 'font', 'video', 'attachment'):
                        step('tools/acquire.py', '--module', 'SDK', '--kind', kind, '--limit', '1000')
                    step('tools/discover_sdk_attachments.py')
                    step('tools/discover_sdk.py')
                    records = Store(root).records('SDK')
                    remaining = sum(eligible(r) for r in records)
                    if not remaining:
                        # A complete derivative pass can reveal further literal links.
                        step('tools/run_sdk.py', '--support-only')
                        step('tools/sdk_article_data.py')
                        step('tools/discover_sdk.py')
                        step('tools/discover_sdk_attachments.py')
                        records = Store(root).records('SDK')
                        remaining = sum(eligible(r) for r in records)
                    snapshot = {'at': now(), 'cycle': cycle + 1, 'eligible_remaining': remaining,
                                'statuses': dict(Counter(r['status'] for r in records))}
                    print(json.dumps(snapshot), flush=True)
                    log.write(json.dumps(snapshot) + '\n')
                    if not remaining:
                        break
                    after = [(r['id'], r['status'], r.get('sha256')) for r in records]
                    if sorted(before) == sorted(after):
                        raise RuntimeError('NO_ACQUISITION_PROGRESS_REQUIRES_REVIEW')
                else:
                    raise RuntimeError('DISCOVERY_ITERATION_LIMIT_REQUIRES_REVIEW')
                records = Store(root).records('SDK')
                failed = sum(r['status'] == 'FAILED' for r in records)
                phase = 'SDK_CAPTURE_FIXED_POINT_REQUIRES_VERIFICATION'
                blockers = ([{'code': 'SDK_SOURCE_RESOURCES_UNAVAILABLE', 'count': failed}] if failed else [])
                controller.update(running=False, finished_at=now(), result=phase)
                mark(phase, blockers)
                return 0
            except (Exception, KeyboardInterrupt) as error:
                controller.update(running=False, finished_at=now(), result=str(error))
                state = read_json(root / '_project/STATE.json')
                blockers = state.get('blockers') or [{'code': 'SDK_CONTROLLER_REVIEW_REQUIRED', 'detail': str(error)}]
                mark('SDK_CONTROLLER_STOPPED', blockers)
                log.write(json.dumps({'at': now(), 'stopped': str(error)}) + '\n')
                print(json.dumps({'stopped': str(error)}), flush=True)
                return 1
    finally:
        signal.signal(signal.SIGINT, previous)


if __name__ == '__main__':
    cli = argparse.ArgumentParser(description=__doc__)
    cli.add_argument('--support-only', action='store_true')
    cli.add_argument('--max-cycles', type=int, default=20)
    args = cli.parse_args()
    if not 1 <= args.max_cycles <= 100:
        cli.error('--max-cycles must be between 1 and 100')
    root = Path(__file__).resolve().parents[1]
    if args.support_only:
        support(root)
    else:
        raise SystemExit(run(root, args.max_cycles))
