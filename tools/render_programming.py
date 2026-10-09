"""Native HTML views of captured programming metadata and exact source."""
from html import escape
import json
from urllib.parse import urlencode

from build_table_layouts import type_text
from build_routine_layouts import collect_refs
from programming_library import SCOPE
from render_help_guides import table
from render_help_page import topic_list

RELATIONSHIP_LABELS = {
    'direct_or_reviewed': 'Direct static references or reviewed effects',
    'possible_indirect': 'Possible delegated access',
    'mentions_only': 'Mentions and unresolved candidates only',
}


def paragraph(text):
    return '<p>' + escape(str(text)) + '</p>'


def programming_href(path, search_context=None, fragment=''):
    """Serialize a validated lookup context onto a local programming view."""
    if search_context is not None:
        query, kind, page = search_context
        path += '?' + urlencode({'q': query, 'kind': kind, 'page': page})
    return path + ('#' + fragment if fragment else '')


def return_to_results(search_context):
    if search_context is None:
        return ''
    href = programming_href('/programming', search_context, 'programming-results')
    return '<a href="' + escape(href, quote=True) + '">Return to programming results</a>'


def object_link(library, oid, search_context=None):
    row = library.objects.get(str(oid))
    if row is None:
        return escape(str(oid)) + ' (outside this programming export)'
    href = programming_href('/programming/object/' + str(row['object_id']), search_context, 'programming-object')
    return ('<a href="' + escape(href, quote=True) + '">'
            + escape(row['qualified_name']) + '</a>')


def render_catalog(library, query='', kind='all', page=1):
    result = library.search(query, kind, page)
    search_context = (query, kind, page)
    parts = ['<nav aria-label="Library"><a href="/">SCALE Knowledge</a></nav>',
             '<article class="guide"><h2>Database programming reference</h2>',
             '<p class="scope">' + escape(SCOPE) + '</p>',
             paragraph(', '.join(str(result['counts'].get(k, 0)) + ' ' + k + 's'
                                 for k in ('procedure', 'function', 'table')) + '.'),
             '<form action="/programming#programming-results" method="get">',
             '<label for="programming-query">Object name, object ID or table column</label>',
             '<p id="programming-help">Use a full identifier or part of a name, such as RECEIPT_HEADER. '
             'Select a matching column to jump to its captured row.</p>',
             '<input id="programming-query" name="q" type="search" maxlength="200" '
             'aria-describedby="programming-help" value="' + escape(query, quote=True) + '">',
             '<label for="programming-kind">Object type</label><select id="programming-kind" name="kind">']
    for value, label in [('all', 'All objects'), ('procedure', 'Stored procedures'),
                         ('function', 'Functions'), ('table', 'Tables')]:
        parts.append('<option value="' + value + '"' + (' selected' if kind == value else '') + '>' + label + '</option>')
    parts += ['</select> <button type="submit">Find objects</button></form>',
              '<h3 id="programming-results" tabindex="-1">Matching objects</h3>',
              paragraph(str(result['total']) + (' match.' if result['total'] == 1 else ' matches.')
                        + ' Page ' + str(page) + ' of ' + str(result['pages']) + '.')]
    if not result['results']:
        parts.append(paragraph('No captured object or table column matched. Try a shorter identifier or another object type.'))
    parts.append('<ul class="guide-results">')
    for row in result['results']:
        parts += ['<li>' + object_link(library, row['object_id'], search_context),
                  paragraph(row['kind'].capitalize() + '; object ID ' + str(row['object_id']) + '. ' + row['match_reason'] + '.')]
        if row['matched_columns']:
            column_ids = library.objects[str(row['object_id'])]['column_ids']
            links = []
            for name in row['matched_columns']:
                href = programming_href('/programming/object/' + str(row['object_id']), search_context,
                                        'column-' + str(column_ids[name]))
                links.append('<a href="' + escape(href, quote=True) + '" aria-label="'
                             + escape(name + ' in ' + row['qualified_name'], quote=True) + '">'
                             + escape(name) + '</a>')
            parts.append('<p>Matching columns: ' + ', '.join(links) + '</p>')
        parts.append('</li>')
    parts.append('</ul><nav aria-label="Programming results pages">')
    for number, label in [(page - 1, 'Previous page'), (page + 1, 'Next page')]:
        if 1 <= number <= result['pages']:
            href = '/programming?' + urlencode({'q': query, 'kind': kind, 'page': number}) + '#programming-results'
            parts.append('<a href="' + escape(href, quote=True) + '">' + label + '</a> ')
    return ''.join(parts) + '</nav></article>'


def json_detail(title, value):
    return ('<details><summary>' + escape(title) + '</summary><pre>'
            + escape(json.dumps(value, indent=2, ensure_ascii=False)) + '</pre></details>')


def table_routine_references(record):
    """Reuse the exporter's correlation; retain overlapping evidence channels."""
    refs = collect_refs({'tables': [record['table_usage_evidence']]})
    for observation in record['original_comment_mentions']:
        refs[observation['module_id']]['mentions_only'].append({
            'table_id': record['object']['object_id'],
            'qualified_name': record['table_usage_evidence']['qualified_name'],
            'layout_path': '../table layout/' + str(record['object']['object_id']) + '.md',
            'classification': 'COMMENT_IDENTIFIER_MENTION_NOT_ACCESS_CREDIT',
            'category': 'original_comment_mentions', 'observation': observation})
    return {oid: refs[oid] for oid in record['prioritized_primary_routine_ids']}


def render_related_routines(library, record, search_context=None):
    refs = table_routine_references(record)
    parts = ['<h3>Related routines</h3>', paragraph(
        'Groups retain the captured evidence: a routine can appear in more than one group. '
        'Mentions and possible paths do not establish direct or executed access. '
        'Expand Relationship evidence for source bindings and limits.')]
    for key, label in RELATIONSHIP_LABELS.items():
        matches = [(oid, groups[key]) for oid, groups in refs.items() if groups[key]]
        parts.append('<details><summary>' + escape(label) + ' (' + str(len(matches))
                     + (' routine' if len(matches) == 1 else ' routines') + ')</summary><ul>')
        for oid, evidence in matches:
            classifications = list(dict.fromkeys(row['classification'] for row in evidence))
            parts.append('<li>' + object_link(library, oid, search_context)
                         + paragraph('; '.join(classifications))
                         + json_detail('Relationship evidence', evidence) + '</li>')
        parts.append('</ul>' + ('' if matches else paragraph('None captured.')) + '</details>')
    unclassified = [oid for oid, groups in refs.items() if not any(groups.values())]
    if unclassified:
        parts += ['<h4>Relationship classification unavailable</h4>', paragraph(
            'These routines remain in the captured priority list, but no matching relationship '
            'evidence was found. No access classification is inferred.'), '<ul>']
        parts += ['<li>' + object_link(library, oid, search_context) + '</li>' for oid in unclassified]
        parts.append('</ul>')
    if not refs:
        parts.append(paragraph('No primary routine relationship was captured. This does not establish non-use.'))
    return ''.join(parts)


def render_routine_articles(knowledge, record):
    definition_hash = record.get('source_definition_sha256')
    if knowledge is None or knowledge.snapshot != record['snapshot_id'] or not definition_hash:
        return ''
    topics = []
    for topic in knowledge.topics.values():
        for ref in knowledge._refs(topic):
            source = knowledge.sources[ref]
            if (source['kind'] == 'DEPLOYED_SQL_STATIC'
                    and source['object_id'] == record['identity']['object_id']
                    and source['source_definition_sha256'] == definition_hash):
                topics.append(topic)
                break
    if not topics:
        return ''
    return ('<h3>Articles citing this routine</h3>' + paragraph(
        'These reviewed articles cite this captured routine and may cover a wider process. '
        'Their source qualifications still apply.') + topic_list(topics))


def render_object(library, oid, knowledge=None, search_context=None):
    if search_context is not None:
        library.search(*search_context)
    row, record = library.objects[oid], library.record(oid)
    navigation = ('<a href="/programming">Find programming objects</a>'
                  if search_context is None else return_to_results(search_context))
    parts = ['<nav aria-label="Library">' + navigation + '</nav>',
             '<article class="guide" id="programming-object" tabindex="-1"><h2>' + escape(row['qualified_name']) + '</h2>',
             paragraph(row['kind'].capitalize() + '; object ID ' + oid + '.'),
             '<p class="scope">' + escape(SCOPE) + '</p>', '<ul>']
    for ext, label in [('md', 'Download complete programming documentation (Markdown)'),
                       ('json', 'Download complete metadata and evidence (JSON)')]:
        parts.append('<li><a download href="/programming/file/' + oid + '.' + ext + '">' + label + '</a></li>')
    if row['kind'] != 'table':
        href = programming_href('/programming/sql/' + oid, search_context, 'programming-sql')
        parts.append('<li><a href="' + escape(href, quote=True) + '">Read complete captured SQL</a> · '
                     '<a download href="/programming/file/' + oid + '.sql">Download exact SQL</a></li>')
    parts.append('</ul>')
    if row['kind'] == 'table':
        parts.append('<h3>Reviewed table role</h3>')
        if not record['reviewed_roles']:
            parts.append(paragraph('No reviewed role is recorded. The captured structural layout remains available.'))
        for role in record['reviewed_roles']:
            # Keep scope, confidence, rationale and source bindings beside the purpose.
            parts.append(json_detail('Retained role and its qualifications', role))
        columns = sorted(record['raw_catalog_records']['columns'], key=lambda c: c['column_id'])
        rows = [['Ordinal', 'Column', 'Declared type', 'Nullable', 'Identity', 'Computed']]
        rows += [[str(c['column_id']), c['name'], type_text(c), str(c['is_nullable']),
                  str(c['is_identity']), str(c['is_computed'])] for c in columns]
        parts += ['<h3 id="columns" tabindex="-1">Captured columns</h3>',
                  paragraph('Defaults, computed expressions, indexes, keys and all additional captured fields are in Complete captured details below and the downloads.'),
                  table(rows, escape, 'Captured table columns',
                        row_ids=['column-' + str(c['column_id']) for c in columns])]
        parts.append(render_related_routines(library, record, search_context))
    else:
        parts.append(render_routine_articles(knowledge, record))
        parts.append('<h3>Parameters</h3>')
        rows = [['Position', 'Name', 'Declared type', 'Output', 'Read-only']]
        rows += [[str(p['parameter_id']), p['name'], p['declared_type'], str(p['is_output']), str(p['is_readonly'])]
                 for p in record['parameters']]
        parts.append(table(rows, escape, 'Captured routine parameters') if len(rows) > 1 else paragraph('No parameters captured.'))
        parts.append(paragraph('Declaration defaults and validation remain in the exact SQL; catalog default flags do not establish all T-SQL defaults.'))
        parts.append(json_detail('Return metadata and limits', record['return_metadata']))
        parts.append(json_detail('Retained reviewed contract and source bindings', record['reviewed_contract']))
        parts.append('<h3>Related tables</h3>')
        for key, rows in record['table_references'].items():
            parts += ['<h4>' + escape(RELATIONSHIP_LABELS.get(key, key.replace('_', ' '))) + '</h4><ul>']
            for ref in rows:
                parts.append('<li>' + object_link(library, ref['table_id'], search_context) + paragraph(ref['classification'])
                             + json_detail('Relationship evidence', ref) + '</li>')
            parts.append('</ul>')
            if not rows:
                parts.append(paragraph('None captured.'))
        parts.append(paragraph('Static relationships, indirect paths and mentions do not establish executed table access.'))
    parts += ['<h3>Complete captured details</h3>',
              paragraph('Expand a section for the complete exported fields and qualifications.')]
    for key, value in record.items():
        if key in ({'reviewed_roles'} if row['kind'] == 'table' else
                   {'parameters', 'return_metadata', 'reviewed_contract', 'table_references'}):
            continue
        parts.append(json_detail(key.replace('_', ' ').capitalize(), value))
    parts.append('<p class="hash">Export manifest SHA-256: ' + library.manifest_sha256 + '</p></article>')
    return row['qualified_name'], ''.join(parts)


def render_sql(library, oid, search_context=None):
    if search_context is not None:
        library.search(*search_context)
    row = library.objects[oid]
    raw = library.artifact(oid, 'sql')
    title = 'Captured SQL: ' + row['qualified_name']
    navigation = object_link(library, oid, search_context)
    if search_context is not None:
        navigation += ' · ' + return_to_results(search_context)
    return title, ('<nav aria-label="Library">' + navigation + '</nav>'
                  '<article class="guide" id="programming-sql" tabindex="-1"><h2>' + escape(title) + '</h2>'
                  '<p class="scope">' + escape(SCOPE) + '</p>'
                  '<p>Displayed as inert text. The download preserves the exact captured UTF-8 bytes and line endings.</p>'
                  '<p><a download href="/programming/file/' + oid + '.sql">Download exact SQL</a></p>'
                  '<pre>' + escape(raw.decode('utf-8')) + '</pre></article>')
