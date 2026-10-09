"""Native HTML views of captured programming metadata and exact source."""
from html import escape
import json
from urllib.parse import urlencode

from build_table_layouts import type_text
from programming_library import SCOPE
from render_help_guides import table


def paragraph(text):
    return '<p>' + escape(str(text)) + '</p>'


def object_link(library, oid):
    row = library.objects.get(str(oid))
    if row is None:
        return escape(str(oid)) + ' (outside this programming export)'
    return ('<a href="/programming/object/' + str(row['object_id']) + '#programming-object">'
            + escape(row['qualified_name']) + '</a>')


def render_catalog(library, query='', kind='all', page=1):
    result = library.search(query, kind, page)
    parts = ['<nav aria-label="Library"><a href="/">SCALE Knowledge</a></nav>',
             '<article class="guide"><h2>Database programming reference</h2>',
             '<p class="scope">' + escape(SCOPE) + '</p>',
             paragraph(', '.join(str(result['counts'].get(k, 0)) + ' ' + k + 's'
                                 for k in ('procedure', 'function', 'table')) + '.'),
             '<form action="/programming#programming-results" method="get">',
             '<label for="programming-query">Object name, object ID or table column</label>',
             '<p id="programming-help">Use a full identifier or part of a name, such as RECEIPT_HEADER. '
             'Column matches identify tables containing that column.</p>',
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
        parts += ['<li>' + object_link(library, row['object_id']),
                  paragraph(row['kind'].capitalize() + '; object ID ' + str(row['object_id']) + '. ' + row['match_reason'] + '.')]
        if row['matched_columns']:
            parts.append(paragraph('Matching columns: ' + ', '.join(row['matched_columns'])))
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


def render_object(library, oid):
    row, record = library.objects[oid], library.record(oid)
    parts = ['<nav aria-label="Library"><a href="/programming">Find programming objects</a></nav>',
             '<article class="guide" id="programming-object" tabindex="-1"><h2>' + escape(row['qualified_name']) + '</h2>',
             paragraph(row['kind'].capitalize() + '; object ID ' + oid + '.'),
             '<p class="scope">' + escape(SCOPE) + '</p>', '<ul>']
    for ext, label in [('md', 'Download complete programming documentation (Markdown)'),
                       ('json', 'Download complete metadata and evidence (JSON)')]:
        parts.append('<li><a download href="/programming/file/' + oid + '.' + ext + '">' + label + '</a></li>')
    if row['kind'] != 'table':
        parts.append('<li><a href="/programming/sql/' + oid + '#programming-sql">Read complete captured SQL</a> · '
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
                  table(rows, escape, 'Captured table columns')]
        parts += ['<h3>Related routines</h3>',
                  paragraph('These routines have reference, mention or possible-path evidence. This list does not establish direct or executed access; inspect each evidence record before interpreting it.'), '<ul>']
        parts += ['<li>' + object_link(library, item) + '</li>' for item in record['prioritized_primary_routine_ids']]
        parts.append('</ul>')
        if not record['prioritized_primary_routine_ids']:
            parts.append(paragraph('No primary routine relationship was captured. This does not establish non-use.'))
    else:
        parts.append('<h3>Parameters</h3>')
        rows = [['Position', 'Name', 'Declared type', 'Output', 'Read-only']]
        rows += [[str(p['parameter_id']), p['name'], p['declared_type'], str(p['is_output']), str(p['is_readonly'])]
                 for p in record['parameters']]
        parts.append(table(rows, escape, 'Captured routine parameters') if len(rows) > 1 else paragraph('No parameters captured.'))
        parts.append(paragraph('Declaration defaults and validation remain in the exact SQL; catalog default flags do not establish all T-SQL defaults.'))
        parts.append(json_detail('Return metadata and limits', record['return_metadata']))
        parts.append(json_detail('Retained reviewed contract and source bindings', record['reviewed_contract']))
        parts.append('<h3>Related tables</h3>')
        labels = {'direct_or_reviewed': 'Direct static references or reviewed effects',
                  'possible_indirect': 'Possible delegated access', 'mentions_only': 'Mentions and unresolved candidates only'}
        for key, rows in record['table_references'].items():
            parts += ['<h4>' + escape(labels.get(key, key.replace('_', ' '))) + '</h4><ul>']
            for ref in rows:
                parts.append('<li>' + object_link(library, ref['table_id']) + paragraph(ref['classification'])
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


def render_sql(library, oid):
    row = library.objects[oid]
    raw = library.artifact(oid, 'sql')
    title = 'Captured SQL: ' + row['qualified_name']
    return title, ('<nav aria-label="Library">' + object_link(library, oid) + '</nav>'
                  '<article class="guide" id="programming-sql" tabindex="-1"><h2>' + escape(title) + '</h2>'
                  '<p class="scope">' + escape(SCOPE) + '</p>'
                  '<p>Displayed as inert text. The download preserves the exact captured UTF-8 bytes and line endings.</p>'
                  '<p><a download href="/programming/file/' + oid + '.sql">Download exact SQL</a></p>'
                  '<pre>' + escape(raw.decode('utf-8')) + '</pre></article>')
