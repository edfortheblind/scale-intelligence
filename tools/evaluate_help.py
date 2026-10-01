"""Execute authored questions through local help; report retrieval and semantic limits separately."""
import argparse
import hashlib
import json
from pathlib import Path
import threading
from urllib.parse import quote, urlsplit
from urllib.request import urlopen

from help_knowledge import Knowledge, ROOT


def evaluate(knowledge, base_url=None):
    def request(path):
        with urlopen(base_url+path, timeout=15) as response:
            return json.loads(response.read())
    if base_url:
        target=urlsplit(base_url)
        if target.scheme!='http' or target.hostname not in {'127.0.0.1','localhost','::1'} or target.path not in {'','/'} or target.username or target.query or target.fragment:
            raise ValueError('HTTP evaluation is limited to the local help preview.')
        base_url=base_url.rstrip('/')
        status=request('/api/status')
        if (status.get('topic_generation_sha256') != knowledge.generation_sha256
                or status.get('implementation_sha256') != knowledge.summary()['implementation_sha256']
                or status.get('vendor_manifest_sha256') != knowledge.vendor_manifest_sha256):
            raise ValueError('Restart the help server after code or knowledge updates before evaluating.')
    cross = json.loads((knowledge.root/'DB Architecture/mappings/help-acceptance.json').read_text(encoding='utf-8'))
    cases = []
    for topic in knowledge.topics.values():
        for i, case in enumerate(topic['evaluation']['cases']):
            cases.append({'case_id': topic['topic_id']+':'+str(i+1), 'question': case['question'],
                          'expected_topics': [topic['topic_id']], 'case_kind': 'TOPIC_QUESTION'})
    for case in cross['cases']:
        cases.append({'case_id': 'boundary:'+case['case_id'], 'question': case['question'],
                      'expected_topics': case['topic_ids'], 'case_kind': 'CROSS_CUTTING_BOUNDARY'})
    results = []
    for case in cases:
        response = request('/api/search?q='+quote(case['question'],safe='')) if base_url else knowledge.search(case['question'])
        ids = [t['topic_id'] for t in response['results']]
        ranks = [ids.index(t)+1 for t in case['expected_topics'] if t in ids]
        topic_answers = [request('/api/topics/'+quote(t,safe='')) if base_url else knowledge.topic(t) for t in case['expected_topics']]
        integrity = all(a['what_it_does'] and a['sources'] and a['scope']
                        and isinstance(a['evidence_limits'], list)
                        and all(s['source_id'] in knowledge.citations for s in a['sources']) for a in topic_answers)
        results.append({**case, 'returned_topics': ids, 'best_expected_rank': min(ranks) if ranks else None,
                        'expected_topic_in_first_eight': bool(ranks), 'selected_topic_contract_passed': bool(integrity),
                        'semantic_answer_quality': 'NOT_AUTOMATICALLY_SCORED',
                        'note': 'Selected-topic checks use explicit topic context; free-query retrieval is measured separately.'})
    return {'schema_version': 1, 'evaluation_mode': 'LOCAL_HTTP_HELP_APP' if base_url else 'LOCAL_CURATED_HELP_ENGINE', 'case_count': len(results),
            'question_only_retrieval': {'expected_topic_first': sum(r['best_expected_rank'] == 1 for r in results),
                                      'expected_topic_in_first_eight': sum(r['expected_topic_in_first_eight'] for r in results),
                                      'misses': sum(not r['expected_topic_in_first_eight'] for r in results)},
            'selected_topic_contract': {'passed': sum(r['selected_topic_contract_passed'] for r in results),
                                        'failed': sum(not r['selected_topic_contract_passed'] for r in results)},
            'source_generation_sha256': knowledge.generation_sha256,
            'vendor_manifest_sha256': knowledge.vendor_manifest_sha256,
            'implementation_sha256': knowledge.summary()['implementation_sha256'],
            'evaluation_questions_in_search_index': False, 'independent_holdout_set': False, 'warehouse_connection': False,
            'limits': ['Deterministic retrieval and selected-topic presentation are distinct measurements.',
                       'Expected explanations and forbidden claims require independent semantic review; no automated semantic PASS is inferred.',
                       'This is not an LLM evaluation, real user test, accessibility certification or warehouse-process execution.'],
            'results': results}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, default=ROOT/'help_app/evaluation.json')
    transport=parser.add_mutually_exclusive_group()
    transport.add_argument('--url', help='Optional running loopback preview URL for actual HTTP evaluation.')
    transport.add_argument('--serve', action='store_true', help='Start and stop an isolated ephemeral loopback server for actual HTTP evaluation.')
    args = parser.parse_args()
    knowledge=Knowledge()
    if args.serve:
        from serve_help import create_server
        with create_server(0,knowledge) as server:
            thread=threading.Thread(target=server.serve_forever,daemon=True)
            thread.start()
            try:
                result=evaluate(knowledge,f'http://127.0.0.1:{server.server_port}')
            finally:
                server.shutdown()
                thread.join(timeout=5)
    else:
        result = evaluate(knowledge,args.url)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2)+'\n', encoding='utf-8', newline='\n')
    print(json.dumps({k:v for k,v in result.items() if k != 'results'}, indent=2))
    raise SystemExit(bool(result['selected_topic_contract']['failed']))
