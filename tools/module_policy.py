"""Explicit owner acceptance is a work disposition, never falsified coverage.

Imports from collector and completion_gates are intentionally local: collector
can call this policy without a module-import cycle. This module never writes.
"""
import json
import re
from pathlib import Path
from functools import lru_cache
import subprocess

ACCEPTED = 'OWNER_ACCEPTED_COMPLETE_WITH_EXCEPTIONS'
ACCEPTANCE_PATH = '_project/owner-acceptance-AIM.json'
ANCHOR_FIELDS = ('source_id','source_url','source_sha256','node_id','literal_href',
                 'fragment','target_id','target_url','target_sha256')


def _hash(value):
    from collector import digest
    return digest(json.dumps(value,sort_keys=True,separators=(',',':')).encode())


def stable_exceptions(report):
    """Retain exact occurrences and source identities; omit attempt timestamps."""
    missing=[{'id':item['id'],'url':item['url'],'type':item['type'],
        'failure_class':item['last_failure']['class'],'failure_detail':item['last_failure']['detail']}
        for item in report['missing_resources']]
    anchors=[{key:item[key] for key in ANCHOR_FIELDS} for item in report['broken_anchor_references']]
    return {'missing_resources':sorted(missing,key=lambda item:item['id']),
            'broken_anchor_references':sorted(anchors,key=lambda item:tuple(item[k] for k in ANCHOR_FIELDS))}


def _git_blob(root,commit,path):
    return subprocess.check_output(['git','show',commit+':'+path],cwd=root,stderr=subprocess.PIPE)


def _commit(root,commit):
    return subprocess.check_output(['git','rev-parse',commit+'^{commit}'],cwd=root,text=True,stderr=subprocess.PIPE).strip()


@lru_cache(maxsize=16)
def _baseline_bundle(root,commit):
    """Cache only a successfully checked immutable Git bundle, never permission.

    Every readiness call still compares mutable acceptance fields, current
    catalog and current exceptions against this independently loaded evidence.
    Failed Git reads/invalid bundles raise and therefore are not cached.
    """
    from collector import digest
    if not re.fullmatch('[0-9a-f]{40}',commit):
        raise ValueError('Immutable decision commit identity missing')
    try:
        if _commit(root,commit)!=commit:
            raise ValueError('Decision commit does not resolve to its recorded identity')
        paths={'source_gap_report_sha256':'AIM/reports/source-gaps.json',
               'module_audit_sha256':'AIM/reports/module-audit.json',
               'delivery_receipt_sha256':'_project/delivery-checkpoint.json'}
        raw={key:_git_blob(root,commit,path) for key,path in paths.items()}
        gaps=json.loads(raw['source_gap_report_sha256'])
        audit=json.loads(raw['module_audit_sha256'])
        receipt=json.loads(raw['delivery_receipt_sha256'])
        verified=receipt.get('verified_commit','')
        if not re.fullmatch('[0-9a-f]{40}',verified) or _commit(root,verified)!=verified:
            raise ValueError('Verified corpus commit is missing or does not resolve exactly')
        if receipt.get('checkpoint_integrity_passed') is not True or receipt.get('repository')!='edfortheblind/scale-intelligence' or receipt.get('visibility')!='PRIVATE':
            raise ValueError('Verified private baseline delivery required')
        inventory_raw=_git_blob(root,verified,'_project/artifact-inventory.json')
        inventory_hash=digest(inventory_raw)
        if receipt.get('artifact_inventory_sha256')!=inventory_hash:
            raise ValueError('Baseline delivery receipt does not bind the verified commit inventory')
        inventory=json.loads(inventory_raw)
        if inventory.get('schema_version')!=1 or not inventory.get('files') or inventory.get('file_count')!=len(inventory['files']):
            raise ValueError('Verified baseline artifact inventory is invalid')
        counts=audit['counts']['articles']
        required=('pilot_passed','original_integrity','resource_fidelity','local_reading_navigation','representative_visual_review')
        if any(audit.get('gates',{}).get(gate) is not True for gate in required) or counts['structurally_verified']!=counts['originals_saved']:
            raise ValueError('Immutable baseline lacks verified non-excepted local gates')
        return {'hashes':{**{key:digest(body) for key,body in raw.items()},
                          'artifact_inventory_sha256':inventory_hash},
                'gaps':gaps,'audit':audit,'receipt':receipt,'exceptions':stable_exceptions(gaps),
                'verified_corpus_commit':verified}
    except (OSError,subprocess.CalledProcessError) as error:
        raise ValueError('Immutable baseline Git proof unavailable') from error


def _verified_binding(root,baseline):
    bundle=_baseline_bundle(str(Path(root).resolve()),baseline['decision_commit'])
    for key,expected in bundle['hashes'].items():
        if baseline.get(key)!=expected:
            raise ValueError('Immutable baseline proof hash mismatch: '+key)
    if baseline.get('verified_corpus_commit')!=bundle['verified_corpus_commit']:
        raise ValueError('Accepted verified commit differs from the immutable delivery receipt')
    if baseline.get('catalog_sha256')!=bundle['audit'].get('catalog_sha256'):
        raise ValueError('Accepted catalog differs from immutable baseline audit')
    if baseline.get('exception_set_sha256')!=_hash(bundle['exceptions']):
        raise ValueError('Accepted exception set differs from immutable baseline source report')
    return bundle


def _capture(records):
    articles=[r for r in records if r['type']=='article' and r['status']!='INVALID_RESOLUTION']
    saved=sum(r['status']=='BODY_SAVED' for r in articles)
    return {'metric':'known_article_original_capture','captured':saved,'known':len(articles),
            'percent':round(100*saved/len(articles),2) if articles else None,
            'denominator_status':'KNOWN_LOWER_BOUND','publication_coverage_100_percent':False}


def _validate_exception_catalog(records,exceptions):
    catalog={r['id']:r for r in records}
    missing=exceptions['missing_resources']
    if len({r['id'] for r in missing})!=len(missing) or {r['id'] for r in records if r['status']=='FAILED'}!={r['id'] for r in missing}:
        raise ValueError('Missing resource exceptions do not match failed source records')
    for item in missing:
        current=catalog[item['id']]
        if current['type']!=item['type'] or current['source_url']!=item['url']:
            raise ValueError('Missing resource identity mismatch')
        if current['last_failure']['class']!=item['failure_class'] or current['last_failure']['detail']!=item['failure_detail']:
            raise ValueError('Missing resource failure classification changed')
    for anchor in exceptions['broken_anchor_references']:
        for role in ('source','target'):
            current=catalog[anchor[role+'_id']]
            if current['status']!='BODY_SAVED' or current['sha256']!=anchor[role+'_sha256'] or current['source_url']!=anchor[role+'_url']:
                raise ValueError('Anchor exception source generation mismatch')


def build_acceptance(store,user_instruction,baseline_commit):
    """Return a record for the parent to atomically save with the owner decision.

    The exact latest owner statement is a required argument, never reconstructed
    from a summary. The baseline must already contain the accepted AIM audit and
    its verified private delivery receipt. No source status or hash is changed.
    """
    from collector import read_json,digest,now
    from completion_gates import catalog_hash
    if not isinstance(user_instruction,str) or not user_instruction.strip():
        raise ValueError('Exact owner instruction required')
    commit=_commit(store.root,baseline_commit)
    bundle=_baseline_bundle(str(store.root.resolve()),commit)
    gaps=bundle['gaps'];audit=bundle['audit'];receipt=bundle['receipt']
    records=store.records('AIM');catalog=catalog_hash(records)
    current=stable_exceptions(read_json(store.root/'AIM/reports/source-gaps.json'))
    baseline=stable_exceptions(gaps)
    _validate_exception_catalog(records,current)
    if current!=baseline or catalog!=audit.get('catalog_sha256'):
        raise ValueError('AIM differs from the owner-accepted immutable baseline')
    capture=_capture(records)
    article_counts=audit['counts']['articles']
    if capture['captured']!=article_counts['originals_saved'] or capture['known']!=article_counts['known']:
        raise ValueError('Baseline article counts do not match AIM catalog')
    required=('pilot_passed','original_integrity','resource_fidelity','local_reading_navigation','representative_visual_review')
    if any(audit.get('gates',{}).get(gate) is not True for gate in required):
        raise ValueError('Baseline lacks verified non-excepted local gates')
    if article_counts['structurally_verified']!=article_counts['originals_saved']:
        raise ValueError('Accepted baseline has unreadable captured articles')
    if not receipt.get('checkpoint_integrity_passed') or receipt.get('repository')!='edfortheblind/scale-intelligence' or receipt.get('visibility')!='PRIVATE':
        raise ValueError('Verified private baseline delivery required')
    return {'schema_version':1,'module':'AIM','status':ACCEPTED,'recorded_at':now(),
        'authority':'Explicit owner instruction in the current project conversation',
        'owner_instruction':user_instruction,'measured_capture':capture,
        'baseline':{'decision_commit':commit,'verified_corpus_commit':receipt['verified_commit'],
            'catalog_sha256':catalog,'exception_set_sha256':_hash(baseline),
            **bundle['hashes']},
        'exceptions':baseline,
        'permissions':{'proceed_to_SDK':True,'final_project_completion_with_these_AIM_exceptions':True},
        'technical_facts':{'module_local_complete':False,'discovery_reconciled':False,
            'complete_corpus':False,'missing_source_records_preserved':True,
            'deprecation':'Owner hypothesis; publisher deprecation is unverified'},
        'scope':'Only this immutable AIM generation and its exact documented exceptions are accepted. SDK and new or changed gaps are not waived. Historical rendering evidence remains bound to the code that actually executed it.'}


def acceptance_readiness(store,state=None):
    """Authorize handoff only; final artifact integrity is an independent gate."""
    from collector import read_json
    from completion_gates import catalog_hash
    try:
        state=read_json(store.root/'_project/STATE.json') if state is None else state
        module=state.get('modules',{}).get('AIM',{})
        if module.get('status') in ('MODULE_LOCAL_COMPLETE','CORPUS_COMPLETE'):
            return {'ready':True,'basis':'technical_completion','acceptance':None}
        if module.get('status')!=ACCEPTED or module.get('owner_acceptance')!=ACCEPTANCE_PATH:
            return {'ready':False,'reason':'AIM_COMPLETION_OR_OWNER_ACCEPTANCE_REQUIRED'}
        path=(store.root/ACCEPTANCE_PATH).resolve()
        if not path.is_relative_to(store.root):raise ValueError('Acceptance path outside root')
        record=read_json(path)
        if record.get('schema_version')!=1 or record.get('module')!='AIM' or record.get('status')!=ACCEPTED:
            raise ValueError('Invalid acceptance identity')
        instruction=record.get('owner_instruction')
        if not isinstance(instruction,str) or not instruction.strip() or record.get('permissions',{}).get('proceed_to_SDK') is not True:
            raise ValueError('Explicit handoff permission missing')
        baseline=record['baseline']
        if any(not re.fullmatch('[0-9a-f]{40}',baseline.get(k,'')) for k in ('decision_commit','verified_corpus_commit')):
            raise ValueError('Immutable commit identity missing')
        _verified_binding(store.root,baseline)
        records=store.records('AIM')
        if catalog_hash(records)!=baseline['catalog_sha256']:raise ValueError('Accepted AIM catalog changed')
        current=stable_exceptions(read_json(store.root/'AIM/reports/source-gaps.json'))
        _validate_exception_catalog(records,current)
        if current!=record['exceptions'] or _hash(current)!=baseline['exception_set_sha256']:
            raise ValueError('Accepted AIM exception set changed')
        if _capture(records)!=record['measured_capture']:raise ValueError('Accepted capture metric changed')
        if any(record.get('technical_facts',{}).get(k) is not False for k in ('module_local_complete','discovery_reconciled','complete_corpus')):
            raise ValueError('Acceptance must retain technical incompleteness')
        return {'ready':True,'basis':'owner_accepted_exceptions','acceptance':ACCEPTANCE_PATH,
                'status':ACCEPTED,'record':record}
    except (OSError,ValueError,KeyError,TypeError,AttributeError) as error:
        return {'ready':False,'reason':'AIM_OWNER_ACCEPTANCE_INVALID_OR_STALE','detail':str(error)}


def effective_module_status(store,module,technical_status,state=None):
    """Apply after auditing; raw technical fields and failures remain unchanged."""
    if module=='AIM':
        disposition=acceptance_readiness(store,state)
        if disposition['ready'] and disposition['basis']=='owner_accepted_exceptions':return ACCEPTED
    return technical_status


def required_acceptance_paths(state):
    """Delivery inventory/clone verification must include the referenced policy."""
    module=state.get('modules',{}).get('AIM',{})
    if module.get('status')!=ACCEPTED:return []
    if module.get('owner_acceptance')!=ACCEPTANCE_PATH:raise ValueError('Accepted AIM lacks required acceptance path')
    return [ACCEPTANCE_PATH]


def require_sdk_ready(root,state=None):
    """Public acquisition guard; reject before queue, conversion or browser work."""
    from collector import Store
    result=acceptance_readiness(Store(Path(root),cache_records=True),state)
    if not result['ready']:raise ValueError(result['reason']+(': '+result['detail'] if result.get('detail') else ''))
    return result
