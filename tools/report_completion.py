"""Report separate evidence-based completion measures; never invent an overall percentage."""
import argparse
import hashlib
import json
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def report(scenario_review='_project/help-question-continuation19.json',
           retrieval_review='_project/retrieval-change-continuation19.json'):
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
    lifecycle = read('_project/archive-disposition-continuation20.json')
    from sdd_lifecycle import check_source_identity, retired_document_map
    retired = retired_document_map(ROOT)
    original_states = Counter(check_source_identity(ROOT, 'SDD/'+item['path'], item['sha256'])
                              for item in inventory['originals'])
    central = read('SDD/derived/scale-functional-reference.json')
    from render_scale_reference import validate as validate_reference
    validate_reference(central, ROOT)
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
    metric('C', 'Supplied originals preserved', len(inventory['originals']), inventory['original_count'], 'Historical intake: seven active original hashes verified; two retired originals matched to archival attestations without reading archive bytes.')
    metric('C', 'Unique bodies extracted', len(inventory['documents']), inventory['unique_document_count'], 'Historical extraction: seven active bodies; one retired body represented by frozen metadata, not freshly reverified. Duplicate pair indexed once.')
    docs=sdd_coverage['documents']
    slides=sum(len(d['visually_inspected_static_slides']) for d in docs)
    # Supplied deck has 45 physical slides; extraction count, not authored-review count.
    slide_numbers=set()
    candidate_nodes=set()
    all_nodes=0
    for doc in inventory['documents']:
        if doc['document_id'] in retired:
            body={'nodes':retired[doc['document_id']]['node_metadata']}
        else:
            body=read('SDD/derived/'+doc['document_path'])
        all_nodes += len(body['nodes'])
        slide_numbers.update((doc['document_id'], n['slide']) for n in body['nodes'] if n.get('slide'))
        candidate_nodes.update((doc['document_id'],n['id']) for n in body['nodes'] if n['kind']=='pdf_table_candidate')
    metric('C', 'PowerPoint static slides visually inspected', slides, len(slide_numbers), 'Static layout only; not animations, font fidelity or screen-reader acceptance.')
    metric('C', 'PDF pages visually inspected', sum(len(d['visually_inspected_pdf_pages']) for d in docs), sum(d['physical_page_count'] or 0 for d in docs), 'Physical page review; not all claims or tables on every page.')
    metric('C', 'Source assets with authored descriptions', sum(d['described_asset_count'] for d in docs), sum(d['unique_extracted_asset_count'] for d in docs), 'Historical per-document unique asset paths, including retired-source attestations; not current archive-byte verification or slide/page viewing.')
    cited_table_nodes={(c['document_id'],n) for t in tables['tables'] for c in t['citations'] for n in c['nodes']}
    metric('C', 'PDF table candidates reconciled', len(candidate_nodes & cited_table_nodes), len(candidate_nodes), 'Candidates are merged into logical tables; undetected/raster table denominator remains unknown.')
    rejected={(c['document_id'],c['node']) for c in tables.get('rejected_candidates',[])}
    if rejected & cited_table_nodes or not rejected <= candidate_nodes:
        raise ValueError('SDD candidate dispositions overlap or reference unknown candidates.')
    metric('C', 'PDF table candidates with reviewed disposition', len((candidate_nodes & cited_table_nodes) | rejected), len(candidate_nodes), 'Includes explicitly rejected layout/fragment artifacts; rejection is not additional semantic table review.')
    metric('C', 'Extracted nodes cited in bounded reviews', sum(d['cited_reviewed_node_count'] for d in docs), all_nodes, 'Historical coverage includes frozen retired-node metadata. A citation does not certify every claim within the node; archive bodies were not re-read.')
    layout_path = '_project/docx-layout-continuation18.json'
    layout = read(layout_path)
    docx_inventory = {d['document_id']: d for d in inventory['documents'] if Path(d['source_path']).suffix.lower() == '.docx'}
    layout_ids = [body['document_id'] for body in layout['documents']]
    if (len(layout_ids) != len(set(layout_ids)) or not set(layout_ids) <= set(docx_inventory)
            or layout['unique_docx_bodies'] != len(docx_inventory)):
        raise ValueError('DOCX layout review must use unique bodies from the source inventory.')
    inspected_bodies = 0
    layout_identity_states = Counter()
    for body in layout['documents']:
        source = docx_inventory[body['document_id']]
        if body['source_path'] != 'SDD/'+source['source_path'] or body['source_sha256'] != source['source_sha256']:
            raise ValueError('DOCX layout review source does not match the inventory identity.')
        for path_key, hash_key in [('source_path', 'source_sha256'), ('pdf_path', 'pdf_sha256')]:
            layout_identity_states[check_source_identity(ROOT, body[path_key], body[hash_key])] += 1
        inspected_pages = {p['page'] for p in body['pages']}
        page_count = body['counts']['pages']
        if (type(page_count) is not int or page_count <= 0
                or any(type(p['page']) is not int or not 1 <= p['page'] <= page_count for p in body['pages'])
                or len(inspected_pages) != len(body['pages'])
                or body['counts']['visually_inspected_pages'] != len(inspected_pages)):
            raise ValueError('DOCX layout review requires valid unique inspected page records.')
        if inspected_pages == set(range(1, page_count + 1)):
            inspected_bodies += 1
    if inspected_bodies != layout['fully_viewed_unique_bodies']:
        raise ValueError('DOCX body and page inspection counts disagree.')
    metric('C', 'Unique DOCX bodies with every rendered page visually inspected', inspected_bodies, layout['unique_docx_bodies'],
           'Historical C18 PDF-export review. Four retired PDF hashes match archival attestations; PDFs were not opened, rendered or visually rechecked in this run. Source defects, accessibility and semantic suitability remain separate.')
    metric('D', 'Retained runtime rows accounted for', sum(p['retained_interval_rows'] for p in runtime['profiles']), runtime['counts']['source_rows'], 'Weighted statement profiles preserve execution/replica dimensions and source row identities.')
    metric('D', 'Historical runtime IDs matched to current catalog', runtime['counts']['current_catalog_matches'], runtime['counts']['historical_object_ids'], 'Current name lookup only; historical definition identity and ID reuse are not established.')
    identity_path = 'DB Architecture/mappings/runtime-identity-disposition.json'
    identities = read(identity_path)
    for source in identities['sources'].values():
        if hashlib.sha256((ROOT/source['path']).read_bytes()).hexdigest() != source['sha256']:
            raise ValueError('Refresh runtime identity dispositions after retained-source changes.')
    # Check the disposition set against the captured catalog directly.
    current_ids = {r['object_id'] for r in read('DB Architecture/catalog/objects.json')}
    unmatched_ids = {p['object_id'] for p in runtime['profiles']} - current_ids
    disposition_ids = [r['object_id'] for r in identities['records']]
    if len(disposition_ids) != len(set(disposition_ids)) or set(disposition_ids) != unmatched_ids:
        raise ValueError('Runtime identity dispositions do not match the captured unmatched ID set.')
    metric('D', 'Unmatched runtime IDs with retained-evidence disposition',
           sum(r['bounded_identity_review_complete'] for r in identities['records']), len(unmatched_ids),
           'All remain unknown identities; disposition does not recover a historical name or change catalog matching.')
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
                'central_scale_reference_chapters':len(central['chapters']),
                'central_scale_reference_entries':len(central['claims']),
                'central_scale_reference_sources':len(central['references']),
                'central_scale_reference_selected_records':central['provenance']['source_record_count'],
                'process_documentary_refinements':process_summary['coverage']['authored_refinements'] if process_summary else 0},
            'delivery_scope':'Local files and the existing private GitHub repository; external deployment and OneDrive upload are outside scope.',
            'unperformed_or_unestablished':['Complete functional/deployment reconciliation',
                'Exhaustive DOCX semantic interpretation and PDF accessibility/link behavior; completed visual-page coverage is reported separately',
                'Whole-process elapsed timing','Complete browser/keyboard/reflow/contrast observations and a local JAWS session were not captured; current JAWS and broader display owner acceptance are closed (C14/C17)',
                'Insight navigation/SOP registration (separately initiated future task)'],
            'outside_current_delivery_scope':['External production deployment and multiuser authentication','OneDrive cloud-upload verification'],
            'question_scenario_review':question_path if question_review else None,
            'retrieval_change_review_path':retrieval_change_path if retrieval_change else None,
            'retrieval_change_review':retrieval_change,
            'docx_layout_review':layout_path,
            'sdd_lifecycle':{'manifest':'_project/archive-disposition-continuation20.json',
                'active_originals_bytes_verified':original_states['ACTIVE_BYTES_VERIFIED'],
                'retired_originals_attestation_only':original_states['ARCHIVED_ATTESTATION_NOT_REVERIFIED'],
                'active_extracted_bodies':len(inventory['documents'])-len(retired),
                'retired_extracted_bodies_metadata_only':len(retired),
                'historical_layout_identity_states':dict(layout_identity_states),
                'ordinary_archive_payload_reads':0,
                'verification_scope':'Active originals are hash verified; retired originals, bodies and exports use C20 metadata attestations. Historical page review and HTTP receipts are not rerun.'},
            'runtime_identity_review':identity_path,
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
    text += ['', 'The [central SCALE functionality reference](../SDD/SCALE_FUNCTIONAL_REFERENCE.md) is the active SDD. '
             'Its seven sources are functional references, not core defaults or evidence of a current implementation. '
             'The larger SDD extraction and review counts above remain historical source-collection measures; they are not the active reference denominator.', '']
    state=data['sdd_lifecycle']
    text += [f"C20 lifecycle: **{state['active_originals_bytes_verified']} active originals** were hash verified; "
             f"**{state['retired_originals_attestation_only']} retired originals** and **{state['retired_extracted_bodies_metadata_only']} retired body** "
             'were matched to frozen metadata only. Ordinary reporting does not open archive payload. '
             'C18 export/page review and C19 HTTP evaluation remain historical performed checks. '
             'See [archive disposition and root prompt roles](ARCHIVE_DISPOSITION_C20.md).', '']
    if data.get('retrieval_change_review'):
        r=data['retrieval_change_review'];before=r['baseline_same_cases'];after=r['final_same_cases'];new=r['new_cases']
        comparison = (f"On the unchanged {before['cases']}-question subset, expected-topic top-eight retrieval changed from {before['top8']} to {after['top8']}. "
                      + (f"The {new['cases']} new cases retrieve {new['top8']} expected topics in the first eight. " if new['cases'] else 'No cases were added or rewritten. '))
        if r.get('scope_changes'):
            comparison += ('The frozen historical baseline has 725 cases. Two other-product questions are excluded and two named implementation questions have neutral replacements. '
                           'These scope changes are separately counted, never treated as recovered misses. ')
        if r.get('changed_to_clarification_case_ids'):
            comparison += (f"{len(r['changed_to_clarification_case_ids'])} unnamed-operation questions now request context; "
                           f"{r['same_case_result_lists_identical']} result lists are unchanged. No original miss was recovered and no new miss was introduced. ")
        text += ['', '## Retrieval comparison', '',
                 comparison + "Remaining misses and any individual regressions stay explicit. These authored checks do not measure semantic answer acceptance.", '',
                 f"[Exact comparison and remaining case IDs]({Path(data['retrieval_change_review_path']).name})."]
    text += ['', '## Owner acceptance and remaining technical evidence', '',
             'JAWS and the current broader display experience are owner accepted and closed. '
             'Additional owner tests are not required to close those gates. This does not turn unobserved technical checks into performed tests. '
             'The active SDD consolidates SCALE functionality without client names or material from another product. Implementation choices do not establish universal defaults or current warehouse behavior. '
             'See [current owner decisions](owner-scope-continuation19.json) and [the historical 39 search misses with next steps](SEARCH_MISSES_AND_NEXT_STEPS.md).', '']
    text += ['[DOCX PDF creation and layout findings](DOCX_LAYOUT_C18.md) and [runtime identity dispositions](../DB%20Architecture/RUNTIME_IDENTITY_DISPOSITION.md) record the new bounded review measures.', '']
    text += ['- '+item+'.' for item in data['unperformed_or_unestablished']]
    text += ['', 'Word preference: the prior diagnostic recorded `Options.UpdateLinksAtOpen=false`. '
             'The earlier value was not retained, so historical restoration cannot be verified. '
             'C18 opened verified working copies in Word for PDF creation after the owner enabled printing. No C18 Word preference writes were made; historical restoration remains unproved.', '',
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
    parser.add_argument('--scenario-review', default='_project/help-question-continuation19.json',
                        help='Current scenario receipt; historical receipts are never overwritten.')
    parser.add_argument('--retrieval-review', default='_project/retrieval-change-continuation19.json',
                        help='Current retrieval comparison bound to evaluation.json.')
    args=parser.parse_args()
    data=report(args.scenario_review, args.retrieval_review)
    (ROOT/'_project/section-progress.json').write_text(json.dumps(data,indent=2)+'\n',encoding='utf-8',newline='\n')
    (ROOT/'_project/COMPLETION_REPORT.md').write_text(markdown(data),encoding='utf-8',newline='\n')
    print(json.dumps({'measures':len(data['metrics']),'overall_percent':None,**data['counts_without_complete_denominator']}))
