"""Render curated functional ledgers; never regenerate or infer reviewed claims."""
import json
from pathlib import Path
from urllib.parse import quote

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'DB Architecture'


def read(name):
    return json.loads((OUT / 'mappings' / name).read_text(encoding='utf-8'))


def link(path, label=None):
    relative = '../' + path
    if path.startswith('DB Architecture/'):
        relative = path.removeprefix('DB Architecture/')
    return f'[{label or path}]({quote(relative, safe="/.:#-")})'


def bullets(values):
    return '\n'.join('- ' + str(value) for value in values) + '\n'


def source_text(key, source):
    if source['kind'] == 'REVIEWED_PROCESS_CLAIM':
        return (f"`{key}`: {link(source['register_path'], source['claim_id'])}; "
                f"reviewed-record SHA-256 `{source['claim_sha256']}`. Exact source articles and node fingerprints are preserved in the register. "
                'Local documentary guidance only; deployed application behavior and production indexing remain unestablished.')
    if source['kind'] == 'RETAINED_OBSERVATION':
        return (f"`{key}`: {link(source['path'])}; SHA-256 `{source['sha256']}`. "
                'Timestamped aggregate evidence; the owner accepts the current replica as the documentation baseline. Individual effective settings remain unestablished.')
    if source['kind'] == 'REVIEWED_SDD_CLAIM':
        return (f"`{key}`: {link(source['register_path'], source['claim_id'])}; "
                f"reviewed-record SHA-256 `{source['claim_sha256']}`; original documents/nodes "
                + '; '.join(c['document_id'] + ': ' + ', '.join(c['nodes']) for c in source['citations'])
                + '. Selected reviewed claim only; the SDD corpus remains outside production indexing.')
    if source['kind'] == 'VENDOR_DOCUMENTATION':
        return (f"`{key}`: {link(source['reading_path'], source.get('title', source['article_id']))}; "
                f"{source['module']} article `{source['article_id']}`, original SHA-256 "
                f"`{source['source_sha256']}`, nodes {', '.join(source['node_ids'])}.")
    if source['kind'] == 'DEPLOYED_SQL_STATIC':
        return (f"`{key}`: {link(source['reading_path'], source['qualified_name'])}; "
                f"source-definition SHA-256 `{source['source_definition_sha256']}`, "
                f"reading-copy SHA-256 `{source['reading_sha256']}`, "
                f"one-based inclusive lines {source['line_spans']}.")
    return (f"`{key}`: {link(source['path'])}; SHA-256 `{source['sha256']}`; "
            f"objects {source.get('object_ids', [])}.")


def render_help(data):
    topics = data['topics']
    cases = sum(len(t['evaluation']['cases']) for t in topics)
    lines = ['# SCALE functionality help topics', '',
             f'{len(topics)} bounded help topics; {cases} authored evaluation cases. '
             'These reviewed explanations are also served by the local help prototype. Deployment reconciliation remains incomplete.', '',
             'Answers follow what it does, what happens, what can affect it, what you can check, and sources. '
             'Screen names in sources are documentary references; verified Insight navigation and SOPs remain separate. '
             'No process, label, job or transaction was executed. Browser and keyboard observations were bounded; JAWS was owner accepted without a captured local run. Zoom/reflow, contrast and an intended-user session remain unobserved.', '',
             'The [JSON library](mappings/help-topics.json) is the curated source for this reading copy. '
             'Configuration observations retain their [scope and capture time](CONFIGURATION_VALIDATION.md).', '']
    for index, topic in enumerate(topics, 1):
        lines += [f"## {index}. {topic['title']}", '', f"**Question:** {topic['business_question']}", '',
                  '**What it does.** ' + topic['plain_answer'], '', '**What happens**', '',
                  'Trigger: ' + topic['trigger'], '']
        lines += [f"{step['order']}. {step['explanation']} Evidence: " + ', '.join(f'`{r}`' for r in step['evidence_refs']) + '.'
                  for step in topic['execution_steps']]
        lines += ['', '**What can affect it**', '', bullets(topic['configuration_dependencies']),
                  '**What you can check**', '', bullets(topic['explanation_paths']),
                  '**Expected results and limits**', '', bullets(topic['expected_results'] + topic['boundaries']),
                  '**More detail and sources**', '']
        if topic.get('documentary_refinements'):
            lines += ['Further documented behavior (these refinements are not a new execution sequence):', '']
            lines += ['- '+r['statement']+' Evidence: `'+r['evidence_ref']+'`.' for r in topic['documentary_refinements']]
            lines += ['']
        for ref in topic['evidence_refs']:
            lines += [source_text(ref, data['sources'][ref]), '']
        lines += ['Review: `' + topic['review']['semantic_state'] + '`. '
                  'Independent verification: `' + topic['review'].get('independent_verification', 'NOT_RECORDED') + '`.', '',
                  '**Answer evaluation expectations**', '',
                  'Actual local HTTP retrieval and selected-topic citation checks are reported separately in '
                  '[the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.', '']
        for case in topic['evaluation']['cases']:
            lines += ['- ' + case['question'] + ' Expected: ' + ' '.join(case['must_explain']) +
                      ' Must not claim: ' + ' '.join(case['must_not_claim'])]
        lines += ['']
    return '\n'.join(lines)


def render_roles(data):
    c = data['coverage']
    lines = ['# Reviewed database functional roles', '',
             f"{c['reviewed_objects']}/{c['eligible_objects']} eligible objects have bounded role reviews "
             f"({c['reviewed_percentage_of_eligible']}%). {c['eligible_objects_unreviewed']} remain unreviewed. "
             'A role review is not a complete routine semantic contract, deployment proof or operational acceptance.', '',
             'Domain and role are separate; multiple roles may apply. The [complete object review ledger](mappings/object-review-ledger.json) '
             'explicitly retains every eligible object and unreviewed state. '
             'The [curated role records](mappings/functional-roles.json) bind the evidence below.', '',
             '## Coverage', '', '| Type | Eligible | Reviewed | Unreviewed |', '| --- | ---: | ---: | ---: |']
    for kind, counts in c['by_type'].items():
        lines += [f"| {kind} | {counts['eligible']} | {counts['reviewed']} | {counts['unreviewed']} |"]
    lines += ['', '## Role definitions', '']
    for role, meaning in data['role_taxonomy'].items():
        lines += [f'- `{role}`: {meaning}']
    for record in data['records']:
        lines += ['', '## ' + record['qualified_name'], '', record['purpose'], '',
                  'Domains: ' + ', '.join(record['business_domains']) + '.', '',
                  bullets([r['role'] + ': ' + r['rationale'] + ' Evidence: ' + ', '.join(r['evidence_ids']) + '.'
                           for r in record['functional_roles']])]
        for ev in record['evidence']:
            lines += [f"{ev['evidence_id']}: {link(ev['path'])}, lines {ev['line_start']}-{ev['line_end']}; "
                      f"SHA-256 `{ev['sha256']}`. {ev['description']}", '']
        lines += ['Limits: ' + ' '.join(record['inference_limits']), '']
    return '\n'.join(lines)


def render_families(data):
    lines = ['# Reviewed process-family passages', '',
             'All 34 captured families have introductory text-passage reviews. Expanded full-body and static-figure review '
             'is linked separately below when available, preserving the original introductory evidence. '
             'Zero families have full deployment reconciliation. These headings are not an exhaustive SCALE capability denominator.', '']
    for family in data['families']:
        r = family['documentary_review']
        lines += ['## ' + family['family'], '', r['user_goal'], '', 'Trigger: ' + r['initiating_event'], '',
                  *[f'{i}. {stage}' for i, stage in enumerate(r['documented_stages'], 1)], '',
                  'Configuration: ' + ' '.join(r['configuration_decisions']), '', r['error_handling'], '']
        for gap in r['evidence_gaps']:
            lines += ['Open evidence question: ' + gap['question'], '']
        expanded=family.get('complete_documentary_review')
        if expanded:
            c=expanded['coverage']
            lines += [f"Expanded captured documentary review: {c['text_articles_reviewed']}/{c['text_articles_total']} text bodies, "
                      f"{c['image_references_inspected']}/{c['image_references_total']} static image references, "
                      f"{expanded['refinement_count']} source-bound refinements. "
                      '[Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and '
                      +link(expanded['source_ref'].split('#')[0], 'exact family evidence')+'. '
                      'This does not establish installed application behavior.', '']
        for association in family.get('batch_associations', []):
            path = association['batch_ref'].split('#')[0]
            text = association.get('claim', 'Related bounded help topics: ' + ', '.join(association.get('help_topic_ids', [])))
            lines += ['Partial deployed association: ' + text + ' ' + link(path, 'Exact reviewed batch') + '.', '']
        for source in r['sources']:
            lines += [source_text('family-source', source), '']
    return '\n'.join(lines)


def render_config(data, sources):
    lines = ['# Configuration guide', '',
             f"{data['setting_count']} reviewed documentary setting contracts. " + data['boundary'], '',
             'These are captured vendor rules, not instructions to change configuration or statements of current effective values. '
             'Defaults, missing values and precedence remain explicit when unestablished. '
             'See [reviewed observations](CONFIGURATION_VALIDATION.md) and [SDD reconciliation](../SDD/README.md) for separate evidence classes.', '']
    for s in data['settings']:
        lines += ['## ' + s['label'], '', s['purpose'], '', 'Scope: ' + s['scope'] + '.', '',
                  'Accepted/documented values: ' + s['accepted_values'], '', 'Default: ' + s['default'], '',
                  'Precedence and dependencies: ' + s['precedence'], '',
                  'Validation: ' + s['validation_method'], '', 'Missing or conflicting setting: ' + s['missing_duplicate_unexpected'], '']
        if 'observation_reference' in s:
            lines += [s['observation_reference']['scope'], '']
        for ref in s['evidence_refs']:
            lines += [source_text(ref, sources[ref]) + ' Setting-specific nodes: ' + ', '.join(s['node_ids']) + '.', '']
    return '\n'.join(lines)


def render_acceptance(data):
    lines = ['# Help acceptance contract', '',
             'Cross-cutting cases supplement per-topic questions. Actual HTTP retrieval and selected-topic citation checks '
             'are reported in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are '
             'not automatically scored. The owner accepted JAWS without a captured local session; broader intended-user and display acceptance remain unobserved.', '']
    for case in data['cases']:
        lines += ['## '+case['case_id'], '', case['question'], '',
                  'Expected: '+case['expected_explanation'], '', 'Forbidden: '+case['forbidden_claim'], '',
                  'Related help topic IDs: '+', '.join(case['topic_ids'])+'.', '']
    lines += ['## Timing evidence required', '',
              'Full process timing needs sanitized correlation identity, initiation and terminal event timestamps, '
              'clock/timezone conventions, queue waiting, application stages, database-call boundaries, retries and '
              'external acknowledgments. Retained statement counts and weighted durations cannot reconstruct these stages. '
              'This task does not create workload, jobs, reports, labels or monitoring changes.', '']
    return '\n'.join(lines)


def rendered_documents():
    help_data = read('help-topics.json')
    return {'HELP_TOPICS.md': render_help(help_data),
            'FUNCTIONAL_ROLES.md': render_roles(read('functional-roles.json')),
            'PROCESS_FAMILIES.md': render_families(read('functional-coverage.json')),
            'CONFIGURATION_GUIDE.md': render_config(read('configuration-guide.json'), help_data['sources']),
            'HELP_ACCEPTANCE.md': render_acceptance(read('help-acceptance.json'))}


if __name__ == '__main__':
    for name, text in rendered_documents().items():
        (OUT / name).write_text(text.rstrip() + '\n', encoding='utf-8', newline='\n')
        print(name)
