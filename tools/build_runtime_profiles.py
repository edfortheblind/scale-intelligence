"""Derive dimension-preserving statement profiles from the retained metadata snapshot."""
from collections import defaultdict
from datetime import datetime
import hashlib
import json
import math
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT/'DB Architecture'


def read(path):
    return json.loads(path.read_text(encoding='utf-8'))


def aggregate(rows):
    groups = defaultdict(list)
    keys = set()
    for index, row in enumerate(rows):
        count = row['statement_executions']
        if type(count) is not int or count < 0:
            raise ValueError('Invalid statement count')
        for field in ['weighted_total_duration_us', 'weighted_total_cpu_us', 'min_statement_duration_us', 'max_statement_duration_us']:
            if not isinstance(row[field], (float,int)) or not math.isfinite(row[field]) or row[field] < 0:
                raise ValueError('Invalid retained duration value')
        if row['min_statement_duration_us'] > row['max_statement_duration_us']:
            raise ValueError('Inverted duration range')
        start, end = (datetime.fromisoformat(row[k].replace('Z', '+00:00')) for k in ['interval_start','interval_end'])
        if start.tzinfo is None or end.tzinfo is None or start >= end:
            raise ValueError('Invalid retained interval')
        key = (row['object_id'], row['replica_group_id'], row['execution_type_desc'], row['runtime_stats_interval_id'])
        if key in keys:
            raise ValueError('Duplicate dimension/interval row')
        keys.add(key)
        groups[key[:3]].append((index,row))
    profiles=[]
    for (object_id, replica, execution_type), entries in sorted(groups.items()):
        values=[row for _,row in entries]
        count=sum(row['statement_executions'] for row in values)
        duration=math.fsum(row['weighted_total_duration_us'] for row in values)
        cpu=math.fsum(row['weighted_total_cpu_us'] for row in values)
        profiles.append({'object_id':object_id,'replica_group_id':replica,'execution_type':execution_type,
                         'retained_interval_rows':len(values),'source_row_indices_zero_based':[i for i,_ in entries],
                         'interval_start':min(row['interval_start'] for row in values),
                         'interval_end':max(row['interval_end'] for row in values),
                         'statement_executions':count,'weighted_total_duration_us':duration,
                         'weighted_total_cpu_us':cpu,'weighted_mean_statement_ms':round(duration/count/1000,6) if count else None,
                         'weighted_mean_cpu_ms':round(cpu/count/1000,6) if count else None,
                         'min_statement_ms':min(row['min_statement_duration_us'] for row in values)/1000,
                         'max_statement_ms':max(row['max_statement_duration_us'] for row in values)/1000,
                         'continuous_coverage_established':False,'procedure_call_count_established':False,
                         'whole_process_duration_established':False})
    return profiles


def build():
    source=OUT/'catalog/query_store_runtime.json'
    rows=read(source);profiles=aggregate(rows)
    objects={o['object_id']:o for o in read(OUT/'catalog/objects.json')}
    modules={m['object_id']:m for m in read(OUT/'catalog/modules.json')}
    ledger={r['object_id']:r for r in read(OUT/'mappings/object-review-ledger.json')['records']}
    topic_data=read(OUT/'mappings/help-topics.json')
    topic_ids=defaultdict(list)
    for topic in topic_data['topics']:
        refs=set(topic['evidence_refs']) | {ref for step in topic['execution_steps'] for ref in step['evidence_refs']}
        for object_id in {topic_data['sources'][ref]['object_id'] for ref in refs if topic_data['sources'][ref]['kind']=='DEPLOYED_SQL_STATIC'}:
            topic_ids[object_id].append(topic['topic_id'])
    for profile in profiles:
        oid=profile['object_id'];obj=objects.get(oid)
        profile.update(current_catalog_name=(obj['schema_name']+'.'+obj['name']) if obj else None,
                       current_source_definition_sha256=modules.get(oid,{}).get('source_definition_sha256'),
                       current_semantic_state=ledger.get(oid,{}).get('semantic_review','HISTORICAL_ID_UNRESOLVED'),
                       reviewed_topic_associations=sorted(topic_ids.get(oid,[])),
                       historical_definition_identity_established=False)
    object_ids={r['object_id'] for r in rows}
    data={'schema_version':1,'snapshot_id':'20260929T214106Z','source_path':source.relative_to(ROOT).as_posix(),
          'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),
          'counts':{'source_rows':len(rows),'historical_object_ids':len(object_ids),'current_catalog_matches':len(object_ids & objects.keys()),
                    'unresolved_historical_ids':len(object_ids-objects.keys()),'dimension_preserving_profiles':len(profiles)},
          'method':'Group only by historical object ID, replica group and execution type. SUM weighted microseconds / SUM statement executions /1000 gives weighted statement milliseconds.',
          'limits':['These aggregates are not procedure invocation counts, wall-clock process times or percentile estimates.',
                    'Current catalog names/definitions are lookup context; historical ID reuse or definition changes are not reconciled.',
                    'Earliest/latest interval boundaries do not prove continuous capture or current replica freshness.',
                    'No new query, configuration change, procedure execution or operational record access.'],
          'required_external_evidence':[{'question':'What is the elapsed duration of a complete warehouse task?',
             'why':'Several application, database and external-service stages can overlap or wait.',
             'minimum_evidence':'Existing sanitized application traces with one process correlation ID, start/end events, clock/unit definitions, retries and stage coverage.'},
             {'question':'Which service/job invokes this routine under the current configuration?',
              'why':'Static call edges omit application-side entry points and active schedules.',
              'minimum_evidence':'Sanitized deployed service/version map and scheduler configuration for that named process, excluding operational payloads.'},
             {'question':'Which historical definition produced each retained runtime group?',
              'why':'Object IDs and names can survive definition changes or be reused.',
              'minimum_evidence':'Existing deployment/version history matched to observation interval and object identity; do not infer it from current hashes.'}],
          'profiles':profiles}
    (OUT/'mappings/runtime-profiles.json').write_text(json.dumps(data,indent=2)+'\n',encoding='utf-8',newline='\n')
    lines=['# Retained statement runtime profiles','',
           'These profiles explain captured statement activity. They do not measure complete warehouse process duration. Current object names are lookup context, not proof that the historical statistics used the current definition.','',
           f"The retained {len(rows):,} rows produce {len(profiles)} separate object/replica/execution-type profiles for {len(object_ids)} historical IDs. All source row positions and dimensions remain in [runtime-profiles.json](mappings/runtime-profiles.json).",'',
           'Weighted mean = total execution-weighted microseconds / statement executions / 1,000. Execution types and replica groups are kept separate. A missing profile does not establish an unused routine.','',
           '| Current name or unresolved historical ID | Replica group | Execution type | Statement executions | Weighted mean statement ms | Retained rows |',
           '| --- | ---: | --- | ---: | ---: | ---: |']
    for p in sorted(profiles,key=lambda p:(-p['weighted_total_duration_us'],p['object_id'])):
        label=p['current_catalog_name'] or ('Unresolved ID '+str(p['object_id']))
        avg='Not defined' if p['weighted_mean_statement_ms'] is None else f"{p['weighted_mean_statement_ms']:,.3f}"
        lines.append(f"| {label} | {p['replica_group_id']} | {p['execution_type']} | {p['statement_executions']:,} | {avg} | {p['retained_interval_rows']} |")
    lines+=['','## What would establish whole-process timing','']
    for gap in data['required_external_evidence']:
        lines += ['- **'+gap['question']+'** '+gap['why']+' Minimum evidence: '+gap['minimum_evidence']]
    lines+=['','Profiles ordered by aggregate elapsed statement time are a review-priority aid, not a claim of a performance defect or user-facing latency. The original [runtime interpretation](RUNTIME.md) retains observation, role and capture limits.','']
    (OUT/'RUNTIME_PROFILES.md').write_text('\n'.join(lines),encoding='utf-8',newline='\n')
    print(json.dumps(data['counts']))


if __name__=='__main__':
    build()
