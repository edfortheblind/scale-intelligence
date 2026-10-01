"""Report separate evidence-based completion measures; never invent an overall percentage."""
import argparse
import hashlib
import json
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def report(scenario_review='_project/help-question-continuation14.json',
           retrieval_review='_project/retrieval-change-continuation14.json'):
    inputs = {}
    def read(relative):
        raw = (ROOT/relative).read_bytes()
        inputs[relative] = hashlib.sha256(raw).hexdigest()
        return json.loads(raw)
    ledger = read('DB Architecture/mappings/object-review-ledger.json')
    backlog = read('DB Architecture/mappings/review-backlog.json')
    families = read('DB Architecture/mappings/functional-coverage.json')
    help_data = read('DB Architecture/mappings/help-topics.json')
    sdd = read('SDD/derived/reviewed-knowledge.json')
    sdd_coverage = read('SDD/derived/review-coverage.json')
    tables = read('SDD/derived/reviewed-tables.json')
    inventory = read('SDD/derived/inventory.json')
    runtime = read('DB Architecture/mappings/runtime-profiles.json')
    evaluation = read('help_app/evaluation.json')
    config = read('DB Architecture/mappings/configuration-guide.json')
    # Reject stale app metrics instead of silently attributing old results to new content.
    if evaluation['source_generation_sha256'] != inputs['DB Architecture/mappings/help-topics.json']:
        raise ValueError('Run the help evaluation against current knowledge before reporting completion.')
    from help_knowledge import IMPLEMENTATION_SHA256
    if evaluation['implementation_sha256'] != IMPLEMENTATION_SHA256:
        raise ValueError('Run the help evaluation against current implementation before reporting completion.')
    read('help_app/vendor-source-manifest.json')
    if evaluation.get('vendor_manifest_sha256') != inputs['help_app/vendor-source-manifest.json']:
        raise ValueError('Run the help evaluation against the current vendor citation manifest.')
    rows = []
    def metric(section, name, completed, total, meaning):
        rows.append({'section': section, 'task': name, 'completed': completed, 'total': total,
                     'percent': round(completed/total*100, 2) if total else None, 'meaning': meaning})
    counts=ledger['counts']
    metric('A', 'Functional object roles', counts['role_reviewed'], counts['eligible'], 'Bounded role evidence; not full routine or deployment acceptance.')
    metric('A', 'Module semantic contracts', counts['bounded_semantic_contracts'], counts['semantic_eligible_modules'], 'Source-defined inputs/effects/branches/errors and explicit remaining limits.')
    for types, label in [({'P'}, 'Stored procedures'), ({'FN','IF','TF'}, 'Functions'), ({'V'}, 'Views'), ({'TR'}, 'Triggers')]:
        group = [r for r in ledger['records'] if r['object_type'] in types]
        metric('A', label, sum(r['semantic_review']=='BOUNDED_STATIC_CONTRACT' for r in group), len(group), 'Bounded static contract coverage for this captured type.')
    table_roles = [r for r in ledger['records'] if r['object_type']=='U']
    metric('A', 'Table functional roles', sum(r['role_review']=='BOUNDED_ROLE_REVIEWED' for r in table_roles), len(table_roles), 'Reviewed structural/use role; not a full table behavior or operational acceptance claim.')
    usage_path = 'DB Architecture/mappings/table-usage.json'
    table_usage = None
    if (ROOT/usage_path).is_file():
        table_usage = read(usage_path)
        if any(hashlib.sha256((ROOT/path).read_bytes()).hexdigest() != digest
               for path, digest in table_usage['input_sha256'].items()):
            raise ValueError('Refresh the table-reference report against current captured inputs.')
        if table_usage['tool_sha256'] != hashlib.sha256((ROOT/'tools/report_table_usage.py').read_bytes()).hexdigest():
            raise ValueError('Refresh the table-reference report after scanner changes.')
        if {t['object_id'] for t in table_usage['tables']} != {t['object_id'] for t in table_roles}:
            raise ValueError('Table-reference report and captured table inventory differ.')
        primary = [r for r in ledger['records'] if r['object_type'] in {'P','FN','IF','TF'}]
        scanned = {int(k) for k in table_usage['module_sources']}
        metric('A', 'Tables cross-checked against captured module evidence', len(table_usage['tables']), len(table_roles),
               'Catalog dependencies, reviewed effects and bounded source scan; no unused-table or backup classification is inferred.')
        metric('A', 'Procedures and functions scanned for table references', sum(r['object_id'] in scanned for r in primary), len(primary),
               'Every retained source body checked; runtime SQL and external callers remain explicitly unresolved.')
    metric('A', 'Dynamic-execution candidates reviewed', backlog['counts']['dynamic_candidates_with_bounded_review'], backlog['counts']['dynamic_candidates'], 'Candidate disposition; does not prove runtime target or caller behavior.')
    metric('A', 'Unresolved dependency entries reviewed', backlog['counts']['unresolved_entries_with_bounded_review'], backlog['counts']['unresolved_catalog_entries'], 'Catalog NULL targets remain unresolved even after explanatory review.')
    metric('B', 'Families with reviewed introductory passages', families['counts']['families_with_reviewed_documentary_passages'], families['counts']['indexed_families'], 'Captured summary families are not all SCALE capabilities.')
    process_path='DB Architecture/mappings/process-documentary-review.json'
    process_summary = None
    if (ROOT/process_path).is_file():
        process_summary=read(process_path)
        p=process_summary['coverage']
        metric('B', 'Families with complete captured documentary review', p['families_reviewed'], p['families_total'], 'All captured process-summary bodies and local figures; not installed application behavior.')
        metric('B', 'Process-summary text bodies reviewed', p['text_articles_reviewed'], p['text_articles_total'], 'Complete retained text within the process catalog; not every AIM article.')
        metric('B', 'Process-summary image references inspected', p['image_references_inspected'], p['image_references_total'], 'Static source assets, including separately identified decorative references.')
        metric('B', 'Reviewed process refinements available in local help',
               sum(len(t.get('documentary_refinements',[])) for t in help_data['topics']),p['authored_refinements'],
               'Previously reviewed statements joined with original article/node fingerprints; deployment and production eligibility remain separate.')
    metric('B', 'Families fully reconciled to deployment', families['counts']['families_with_complete_deployment_review'], families['counts']['indexed_families'], 'Missing application/service/configuration evidence remains explicit.')
    metric('C', 'Supplied originals preserved', len(inventory['originals']), inventory['original_count'], 'Original hash verification is recorded in the validation receipt.')
    metric('C', 'Unique bodies extracted', len(inventory['documents']), inventory['unique_document_count'], 'Extraction retains fidelity exceptions; duplicate pair indexed once.')
    docs=sdd_coverage['documents']
    slides=sum(len(d['visually_inspected_static_slides']) for d in docs)
    # Supplied deck has 45 physical slides; extraction count, not authored-review count.
    slide_numbers=set()
    candidate_nodes=set()
    all_nodes=0
    for doc in inventory['documents']:
        body=read('SDD/derived/'+doc['document_path'])
        all_nodes += len(body['nodes'])
        slide_numbers.update((doc['document_id'], n['slide']) for n in body['nodes'] if n.get('slide'))
        candidate_nodes.update((doc['document_id'],n['id']) for n in body['nodes'] if n['kind']=='pdf_table_candidate')
    metric('C', 'PowerPoint static slides visually inspected', slides, len(slide_numbers), 'Static layout only; not animations, font fidelity or screen-reader acceptance.')
    metric('C', 'PDF pages visually inspected', sum(len(d['visually_inspected_pdf_pages']) for d in docs), sum(d['physical_page_count'] or 0 for d in docs), 'Physical page review; not all claims or tables on every page.')
    metric('C', 'Source assets with authored descriptions', sum(d['described_asset_count'] for d in docs), sum(d['unique_extracted_asset_count'] for d in docs), 'Per-document unique asset paths; separate from slide/page viewing.')
    cited_table_nodes={(c['document_id'],n) for t in tables['tables'] for c in t['citations'] for n in c['nodes']}
    metric('C', 'PDF table candidates reconciled', len(candidate_nodes & cited_table_nodes), len(candidate_nodes), 'Candidates are merged into logical tables; undetected/raster table denominator remains unknown.')
    rejected={(c['document_id'],c['node']) for c in tables.get('rejected_candidates',[])}
    if rejected & cited_table_nodes or not rejected <= candidate_nodes:
        raise ValueError('SDD candidate dispositions overlap or reference unknown candidates.')
    metric('C', 'PDF table candidates with reviewed disposition', len((candidate_nodes & cited_table_nodes) | rejected), len(candidate_nodes), 'Includes explicitly rejected layout/fragment artifacts; rejection is not additional semantic table review.')
    metric('C', 'Extracted nodes cited in bounded reviews', sum(d['cited_reviewed_node_count'] for d in docs), all_nodes, 'A citation does not certify every claim within the node.')
    metric('D', 'Retained runtime rows accounted for', sum(p['retained_interval_rows'] for p in runtime['profiles']), runtime['counts']['source_rows'], 'Weighted statement profiles preserve execution/replica dimensions and source row identities.')
    metric('D', 'Historical runtime IDs matched to current catalog', runtime['counts']['current_catalog_matches'], runtime['counts']['historical_object_ids'], 'Current name lookup only; historical definition identity and ID reuse are not established.')
    metric('E', 'Selected-topic presentation/citation checks', evaluation['selected_topic_contract']['passed'], evaluation['case_count'], 'Actual local HTTP checks; not semantic answer acceptance.')
    metric('E', 'Question retrieval: expected topic in first eight', evaluation['question_only_retrieval']['expected_topic_in_first_eight'], evaluation['case_count'], 'Authored questions; evaluation text is excluded from the search index. Not independent holdout.')
    metric('E', 'Question retrieval: expected topic first', evaluation['question_only_retrieval']['expected_topic_first'], evaluation['case_count'], 'Ambiguous questions may require choosing a topic. No semantic score is inferred.')
    retrieval_change_path = retrieval_review
    if not (ROOT/retrieval_change_path).is_file():
        raise ValueError('The selected retrieval comparison receipt is unavailable.')
    retrieval_change = read(retrieval_change_path)
    if retrieval_change.get('evaluation_sha256') != inputs['help_app/evaluation.json']:
        raise ValueError('Refresh the retrieval comparison against the current evaluation.')
    question_path = scenario_review
    if not (ROOT/question_path).is_file():
        raise ValueError('The selected scenario review receipt is unavailable.')
    question_review = read(question_path)
    if (question_review.get('source_generation_sha256') != inputs['DB Architecture/mappings/help-topics.json']
            or question_review.get('implementation_sha256') != IMPLEMENTATION_SHA256
            or question_review.get('vendor_manifest_sha256') != inputs['help_app/vendor-source-manifest.json']):
        raise ValueError('The scenario review is not bound to current help content and implementation.')
    q = question_review['summary']
    metric('E', 'Known user-question scenarios adequately answered', q['adequately_answered'], q['cases'],
           f"{q['adequate_content_answers']} content answers plus {q['appropriate_ambiguity_clarifications']} appropriate ambiguity clarification; {q.get('excluded_from_base_scope', 0)} historical extension case excluded by owner scope, not passed. Manual bounded review after baseline-guided repair; not untouched holdout, measured popularity, real users or accessibility acceptance.")
    result={'schema_version':1,'overall_percent':None,'overall_state':'INCOMPLETE',
            'policy':'Separate measures have different denominators. No average or structural-to-semantic completion inference.',
            'snapshot_id':ledger['snapshot_id'],'metrics':rows,'counts_without_complete_denominator':{
                'help_topics':len(help_data['topics']),'ordered_steps':sum(len(t['execution_steps']) for t in help_data['topics']),
                'aim_setting_contracts':config['setting_count'],'sdd_setting_contracts':len(sdd['configuration']),
                'sdd_claims':len(sdd['claims']),'sdd_visual_descriptions':len(sdd['diagrams']),
                'logical_pdf_tables':len(tables['tables']),
                'process_documentary_refinements':process_summary['coverage']['authored_refinements'] if process_summary else 0},
            'delivery_scope':'Local files and the existing private GitHub repository; external deployment and OneDrive upload are outside scope.',
            'unperformed_or_unestablished':['Complete functional/deployment reconciliation','Full DOCX page fidelity',
                'Whole-process elapsed timing','Complete browser/keyboard/reflow/contrast observations and a local JAWS session were not captured; current JAWS and broader display owner acceptance are closed (C14/C17)',
                'Insight navigation/SOP registration (separately initiated future task)'],
            'outside_current_delivery_scope':['External production deployment and multiuser authentication','OneDrive cloud-upload verification'],
            'question_scenario_review':question_path if question_review else None,
            'retrieval_change_review_path':retrieval_change_path if retrieval_change else None,
            'retrieval_change_review':retrieval_change,
            'table_reference_review':usage_path if table_usage else None,
            'process_documentary_detail':process_path if process_summary else None,'input_sha256':inputs}
    return result


def markdown(data):
    text=['# Completion by task and section', '',
          'The knowledge foundation is incomplete. Percentages below measure named tasks against explicit captured denominators; '
          'there is no defensible overall completion percentage. '+data['delivery_scope'], '',
          'The owner has frozen deployed process behavior and correlated timing as the final workstream. Its 0/34 measure remains open and required; see [the deployment freeze](DEPLOYMENT_FREEZE_C15.md). Other captured percentages retain their original denominators. The [active completion audit](ACTIVE_COMPLETION_AUDIT_C15.md) identifies measures whose ceiling is a documented disposition rather than missing work.', '',
          '| Section | Task | Complete / total | Progress | Meaning |',
          '| --- | --- | ---: | ---: | --- |']
    for r in data['metrics']:
        pct=f"{r['percent']:.2f}%" if r['percent'] is not None else 'Unknown denominator'
        text.append(f"| {r['section']} | {r['task']} | {r['completed']:,} / {r['total']:,} | {pct} | {r['meaning']} |")
    text += ['', '## Delivered counts without an exhaustive denominator', '']
    text += [f"- {key.replace('_',' ')}: **{value:,}**." for key,value in data['counts_without_complete_denominator'].items()]
    if data.get('retrieval_change_review'):
        r=data['retrieval_change_review'];before=r['baseline_same_cases'];after=r['final_same_cases'];new=r['new_cases']
        text += ['', '## Retrieval comparison', '',
                 f"On the unchanged {before['cases']}-question subset, expected-topic top-eight retrieval changed from {before['top8']} to {after['top8']}. The {new['cases']} new cases retrieve {new['top8']} expected topics in the first eight. Remaining misses and any individual regressions stay explicit. These authored checks do not measure semantic answer acceptance.", '',
                 f"[Exact comparison and remaining case IDs]({Path(data['retrieval_change_review_path']).name})."]
    text += ['', '## Owner acceptance and remaining technical evidence', '',
             'JAWS and the current broader display experience are owner accepted and closed. '
             'Additional owner tests are not required to close those gates. This does not turn unobserved technical checks into performed tests. '
             'DOCX page review is approved to continue next session. SDDs are references from other deployments; supported SCALE base concepts may be incorporated, while site-specific choices do not establish TAB behavior. '
             'See [current owner decisions](owner-scope-continuation17.json) and [all 39 search misses with next steps](SEARCH_MISSES_AND_NEXT_STEPS.md).', '']
    text += ['- '+item+'.' for item in data['unperformed_or_unestablished']]
    text += ['', 'Word preference: the prior diagnostic recorded `Options.UpdateLinksAtOpen=false`. '
             'The earlier value was not retained, so historical restoration cannot be verified. '
             'This continuation made no Word preference writes or document opens.', '',
             'Detailed source hashes and reproducible counters: [section-progress.json](section-progress.json). '
             'Current validation, review and delivery state: [project status](../PROJECT_STATUS.md). '
             'Earlier continuation and publication receipts remain unchanged historical evidence.', '']
    if data.get('question_scenario_review'):
        text += ['[Question research, baseline and follow-up review](HELP_QUESTION_REVIEW.md). Questions remain outside the search index.', '']
    if data.get('table_reference_review'):
        text += ['[Table-reference evidence and owner hypotheses](../DB%20Architecture/TABLE_USAGE_REVIEW.md). Missing references do not establish that a table is unused or safe to delete.', '']
    return '\n'.join(text)


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--scenario-review', default='_project/help-question-continuation14.json',
                        help='Current scenario receipt; historical receipts are never overwritten.')
    parser.add_argument('--retrieval-review', default='_project/retrieval-change-continuation14.json',
                        help='Current retrieval comparison bound to evaluation.json.')
    args=parser.parse_args()
    data=report(args.scenario_review, args.retrieval_review)
    (ROOT/'_project/section-progress.json').write_text(json.dumps(data,indent=2)+'\n',encoding='utf-8',newline='\n')
    (ROOT/'_project/COMPLETION_REPORT.md').write_text(markdown(data),encoding='utf-8',newline='\n')
    print(json.dumps({'measures':len(data['metrics']),'overall_percent':None,**data['counts_without_complete_denominator']}))
