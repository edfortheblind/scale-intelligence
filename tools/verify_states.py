"""Verify every captured AIM documentary state in the inert offline reading views."""
from collections import Counter
import json
import os
from pathlib import Path
from collector import Store,read_json,atomic_json,digest,writer_lock,now
from article_data import parse_article,CONVERTER
from documentary_states import reconcile
from verify_pilot import offline_browser


def main():
    root=Path(__file__).resolve().parents[1]
    runtime=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'
    with writer_lock(root,runtime) as owner:
        store=Store(root,cache_records=True)
        records={r['id']:r for r in store.records('AIM')}
        issues=[];results={};counts=Counter();generations=[]
        store.checkpoint(owner,phase='AIM_STATE_VERIFICATION',worker_running=True)
        try:
            for record in records.values():
                if record['type']!='article' or record['status']!='BODY_SAVED':continue
                data=read_json(root/record['app_data_path'])
                raw=(root/record['local_path']).read_bytes()
                if digest(raw)!=data['source']['sha256'] or data['source']['sha256']!=record['sha256'] or data['converter_version']!=CONVERTER:
                    raise ValueError('Stale source or converter generation')
                if digest((root/data['reading']['html']).read_bytes())!=data['reading']['html_sha256']:
                    raise ValueError('Reading file does not match rendered generation')
                _,content,_,_,_=parse_article(record,raw)
                actual=reconcile(content,data['references'],records)
                if actual!=data.get('documentary_states'):issues.append({'id':record['id'],'error':'STATE_GRAPH_MISMATCH'})
                issues.extend({'id':record['id'],**issue} for issue in actual['issues'])
                for edge in actual['control_body_edges']:
                    counts[edge['kind']+'_edges']+=1
                    if edge['kind']=='topic_popup':
                        target=records[edge['target_id']];target_data=read_json(root/target['app_data_path'])
                        if digest((root/target['local_path']).read_bytes())!=target['sha256'] or target_data['source']['sha256']!=target['sha256'] or digest((root/target_data['reading']['html']).read_bytes())!=target_data['reading']['html_sha256']:
                            raise ValueError('Popup target generation mismatch')
                        results[target['id']]={'id':target['id'],'reading':target_data['reading'],'variant_nodes':[v['node_id'] for v in target_data['inventory']['variants']]}
                counts['condition_nodes']+=len(actual['condition_nodes'])
                counts['static_variant_nodes']+=len(data['inventory']['variants'])
                generations.append({'id':record['id'],'source_sha256':record['sha256'],'reading_sha256':data['reading']['html_sha256']})
                if data['inventory']['variants'] or actual['control_body_edges']:
                    results[record['id']]={'id':record['id'],'reading':data['reading'],'variant_nodes':[v['node_id'] for v in data['inventory']['variants']]}
            browser_issues,browser_results=offline_browser(root,list(results.values()))
            issues.extend(browser_issues)
            renderer=root/'AIM/source/assets/7c1af71802e734ceae9e9eb001cb2b12a72ef2d9726d7518a52df93f5975d214.js'
            if not renderer.is_file() or digest(renderer.read_bytes())!=renderer.stem:
                issues.append({'error':'RENDERER_SEMANTICS_EVIDENCE_INVALID'})
            report={'checked_at':now(),'status':'PASSED' if not issues else 'FAILED','module':'AIM','converter_version':CONVERTER,
                    'counts':dict(counts),'generations':generations,'browser':browser_results,'issues':issues,
                    'scope':'Every published static state and linked popup in captured AIM articles. Missing source resources remain separate gaps.'}
            atomic_json(root/'AIM/reports/documentary-states.json',report)
            print(json.dumps({'status':report['status'],'counts':report['counts'],'browser_pages':len(browser_results),'issues':issues}),flush=True)
        finally:
            store.checkpoint(owner,phase='AIM_AUDIT_REQUIRES_REVIEW',worker_running=False)
    return 0 if not issues else 1


if __name__=='__main__':raise SystemExit(main())
