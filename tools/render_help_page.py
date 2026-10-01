"""Accessible SCALE articles with optional technical references."""
from collections import Counter
from html import escape
from urllib.parse import quote

from help_knowledge import ROOT


def element(tag, text, attributes=''):
    return f'<{tag}{attributes}>{escape(str(text))}</{tag}>'


def section(title, items, ordered=False):
    if not items:
        return ''
    tag = 'ol' if ordered else 'ul'
    return element('h3', title)+f'<{tag}>'+''.join(element('li', item) for item in items)+f'</{tag}>'


def topic_link(topic_id, title):
    return f'<a href="/topic/{quote(topic_id, safe="")}#answer">{escape(title)}</a>'


def topic_list(topics):
    return '<ul class="topic-list">'+''.join(
        '<li>'+topic_link(t['topic_id'], t['title'])+'</li>'
        for t in sorted(topics, key=lambda t: t['title'].casefold()))+'</ul>'


def render_references(knowledge, topic):
    parts = ['<details class="references"><summary>Technical reference and sources</summary>']
    if topic['documentary_refinements']:
        parts += ['<details class="source"><summary>Additional process details</summary>',
                  element('p', 'These details describe individual process rules, not a new execution sequence.'), '<ul>']
        for refinement in topic['documentary_refinements']:
            parts += ['<li>', element('p', refinement['statement']),
                      element('p', 'Source: '+refinement['evidence_ref'], ' class="hash"'), '</li>']
        parts.append('</ul></details>')
    if topic['reviewed_details']:
        parts += ['<details class="source"><summary>Reviewed routine behavior and limits</summary>']
        # Identical contract notes apply to the named routines below. Present
        # each once, preserving its section and routine identities.
        occurrences = Counter((s['label'], text) for detail in topic['reviewed_details']
                              for s in detail['sections'] for text in set(s['items']))
        shared = {key for key, count in occurrences.items() if count > 1}
        if shared:
            parts.append(element('h4', 'Shared routine notes'))
            for label, text in sorted(shared):
                names = [d['label'] for d in topic['reviewed_details']
                         if any(s['label'] == label and text in s['items'] for s in d['sections'])]
                parts += [element('p', label+': '+text), element('p', 'Applies to: '+', '.join(names), ' class="hash"')]
        for detail in topic['reviewed_details']:
            parts += ['<details>', element('summary', detail['label'])]
            for group in detail['sections']:
                items = [text for text in dict.fromkeys(group['items']) if (group['label'], text) not in shared]
                if items:
                    parts += [element('h4', group['label']), '<ul>'+''.join(element('li', item) for item in items)+'</ul>']
            parts += [element('p', 'Source: '+detail['source_id']+'. Batch SHA-256: '+detail['batch_sha256'], ' class="hash"'), '</details>']
        parts.append('</details>')
    qualifications = list(dict.fromkeys(s['qualification'] for s in topic['sources']))
    if qualifications:
        parts += ['<details class="source"><summary>About these sources</summary>']
        parts += [element('p', text) for text in qualifications]
        parts.append('</details>')
    for source in topic['sources']:
        parts += ['<details class="source">', element('summary', source['kind_label']+': '+source['label'])]
        evidence = knowledge.source(source['source_id'])
        for excerpt in evidence['excerpts']:
            parts += [element('h4', excerpt['location']), element('pre', excerpt['text'])]
        if not evidence['excerpts']:
            parts.append(element('p', 'Object identities: '+', '.join(map(str, evidence['object_ids']))))
        parts += ['<details>', element('summary', 'Source identity'),
                  element('p', 'Source SHA-256: '+source['source_hash'], ' class="hash"')]
        if source.get('reading_hash'):
            parts.append(element('p', 'Reading-copy SHA-256: '+source['reading_hash'], ' class="hash"'))
        parts.append('</details></details>')
    parts.append('</details>')
    return ''.join(parts)


def render_page(knowledge, question='', topic_id=None):
    if len(question) > 500:
        raise ValueError('Use a question of 500 characters or fewer.')
    topic = knowledge.topic(topic_id) if topic_id is not None else None
    parts = []
    if topic:
        parts += ['<nav aria-label="Library"><a href="/">Browse topics</a></nav>',
                  '<details class="article-search"><summary>Search SCALE Knowledge</summary>']
    else:
        parts += ['<section aria-labelledby="search-heading" class="search-panel">',
                  '<h2 id="search-heading">Find an answer</h2>']
    parts += ['<form action="/#results-heading" method="get"><label for="question">Search by process, screen or setting</label>',
              '<p id="search-help">Include the name of the process or setting in your question.</p>',
              '<div class="search-row"><input id="question" name="q" type="search" aria-describedby="search-help" maxlength="500" value="'+escape(question, quote=True)+'" placeholder="For example: How do I configure packing?">',
              '<button type="submit">Search</button></div></form>',
              '</details>' if topic else '</section>']
    if question.strip():
        result = knowledge.search(question)
        parts.append('<section aria-labelledby="results-heading"><h2 id="results-heading" tabindex="-1">Search results</h2>')
        if result.get('state') == 'NEEDS_CONTEXT':
            parts.append(element('p', result['clarification'], ' role="status"'))
        elif result['results']:
            parts.append(element('p', str(len(result['results']))+' related articles.', ' role="status"'))
            parts.append('<ul id="result-list">')
            for match in result['results']:
                parts.append('<li>'+topic_link(match['topic_id'], match['title'])+element('p', match['answer'])+'</li>')
            parts.append('</ul>')
        else:
            parts.append(element('p', 'No article matched. Try the process or setting name, or browse the topics below.', ' role="status"'))
        parts.append('</section>')
    if topic:
        parts += ['<article id="answer" aria-labelledby="answer-title" tabindex="-1">',
                  element('h2', topic['title'], ' id="answer-title"'), element('p', topic['what_it_does'], ' class="lead"')]
        if topic['trigger']:
            parts.append(element('p', topic['trigger']))
        parts += [section('How to configure' if topic['article_type'] == 'configuration' else 'How it works',
                          [step['explanation'] for step in topic['what_happens']], True),
                  section('Settings and prerequisites', topic['what_can_affect_it']),
                  section('Results', topic['expected_results']),
                  section('Troubleshooting', topic['what_you_can_check']),
                  section('Limits', topic['evidence_limits'])]
        if topic['related_topics']:
            parts += [element('h3', 'Related articles'), topic_list(topic['related_topics'])]
        parts += [render_references(knowledge, topic), '</article>']
    else:
        setup = [t for t in knowledge.topics.values() if t.get('article_type') == 'configuration']
        processes = [t for t in knowledge.topics.values() if t['topic_id'].startswith('process-') and t not in setup]
        other = [t for t in knowledge.topics.values() if t not in setup and t not in processes]
        parts += ['<nav aria-label="Browse topics" class="browse">']
        if setup:
            parts += ['<section aria-labelledby="configure-heading"><h2 id="configure-heading">Configure SCALE</h2>', topic_list(setup), '</section>']
        parts += ['<details'+('' if question.strip() else ' open')+'><summary>Warehouse processes</summary>', topic_list(processes), '</details>',
                  '<details><summary>All other articles ('+str(len(other))+')</summary>', topic_list(other), '</details></nav>']
    template = (ROOT/'help_app/index.html').read_text(encoding='utf-8')
    title = topic['title']+' | SCALE Knowledge' if topic else 'SCALE Knowledge'
    return template.replace('{{TITLE}}', escape(title)).replace('{{CONTENT}}', ''.join(parts)).encode('utf-8')
