"""Accessible native HTML for reviewed guidance, with inert source excerpts."""
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


def render_page(knowledge, question='', topic_id=None):
    if len(question) > 500:
        raise ValueError('Use a question of 500 characters or fewer.')
    parts = ['<section aria-labelledby="search-heading" class="search-panel">',
             '<h2 id="search-heading">Find an explanation</h2>',
             '<form action="/" method="get"><label for="question">Your question or process name</label>',
             '<div class="search-row"><input id="question" name="q" type="search" maxlength="500" value="'+escape(question, quote=True)+'" placeholder="For example: Why is my shipment summary blank?">',
             '<button type="submit">Search guidance</button></div></form>',
             element('p', knowledge.summary()['scope'], ' class="scope"'),
             '<details><summary>Browse all '+str(len(knowledge.topics))+' reviewed topics</summary><ul class="topic-list">']
    for topic in sorted(knowledge.topics.values(), key=lambda t:t['title'].casefold()):
        parts.append('<li>'+topic_link(topic['topic_id'], topic['title'])+'</li>')
    parts.append('</ul></details></section>')
    if question.strip():
        result = knowledge.search(question)
        parts.append('<section aria-labelledby="results-heading"><h2 id="results-heading">Related explanations</h2>')
        if result.get('state') == 'NEEDS_CONTEXT':
            parts.append(element('p', result['clarification'], ' role="status"'))
        elif result['results']:
            parts.append(element('p', str(len(result['results']))+' related explanations. Choose a topic for its steps, configuration factors and evidence.', ' role="status"'))
            parts.append('<ul id="result-list">')
            for topic in result['results']:
                parts.append('<li>'+topic_link(topic['topic_id'], topic['title'])+element('p', topic['answer']))
                if topic.get('matching_detail'):
                    parts += ['<details><summary>Matching reviewed detail</summary>',element('p',topic['matching_detail']),
                              element('p','Source '+topic['matching_source_id']+' is available in the linked explanation.'),'</details>']
                parts.append('</li>')
            parts.append('</ul>')
        else:
            parts.append(element('p', 'No reviewed explanation matched. The available evidence does not establish an answer. Try a process name or browse the reviewed topics.', ' role="status"'))
        parts.append('</section>')
    if topic_id is not None:
        topic = knowledge.topic(topic_id)
        parts += ['<article id="answer" aria-labelledby="answer-title" tabindex="-1">',
                  element('h2', topic['title'], ' id="answer-title"'),
                  element('h3', 'What it does'), element('p', topic['what_it_does']),
                  element('h3', 'When it starts'), element('p', topic['trigger']),
                  section('What happens', [step['explanation'] for step in topic['what_happens']], True),
                  section('What can affect it', topic['what_can_affect_it']),
                  section('Expected results', topic['expected_results']),
                  section('What you can check', topic['what_you_can_check']),
                  section('What the evidence does not establish', topic['evidence_limits']),
                  element('h3', 'More detail and sources')]
        if topic['documentary_refinements']:
            parts += ['<details class="source"><summary>Further documented process behavior</summary>',
                      element('p','These source-bound refinements supplement the introductory explanation. They are not a new execution sequence or evidence of installed settings.'),'<ul>']
            for refinement in topic['documentary_refinements']:
                parts += ['<li>',element('p',refinement['statement']),element('p','Evidence: '+refinement['evidence_ref'],' class="hash"'),'</li>']
            parts += ['</ul></details>']
        if topic['reviewed_details']:
            parts += ['<details class="source"><summary>Reviewed routine behavior and limits ('+str(len(topic['reviewed_details']))+')</summary>',
                      element('p','These captured-source details explain the cited routines. Application binding, current settings and live execution remain separate evidence.')]
            for detail in topic['reviewed_details']:
                parts += ['<details>',element('summary',detail['label']),element('p',detail['review_scope'])]
                for group in detail['sections']:
                    parts += [element('h4',group['label']),'<ul>'+''.join(element('li',item) for item in group['items'])+'</ul>']
                parts += [element('p','Evidence: '+detail['source_id']+'. Reviewed batch SHA-256: '+detail['batch_sha256'],' class="hash"'),'</details>']
            parts.append('</details>')
        for source in topic['sources']:
            parts += ['<details class="source">', element('summary', source['kind_label']+': '+source['label']),
                      element('p', source['qualification']),
                      element('p', 'Source SHA-256: '+source['source_hash'], ' class="hash"')]
            if source.get('reading_hash'):
                parts.append(element('p', 'Reading-copy SHA-256: '+source['reading_hash'], ' class="hash"'))
            evidence = knowledge.source(source['source_id'])
            for excerpt in evidence['excerpts']:
                parts += [element('h4', excerpt['location']), element('pre', excerpt['text'])]
            if not evidence['excerpts']:
                parts.append(element('p', 'Object identities: '+', '.join(map(str, evidence['object_ids']))))
            parts.append('</details>')
        parts.append('</article>')
    template = (ROOT/'help_app/index.html').read_text(encoding='utf-8')
    return template.replace('{{CONTENT}}', ''.join(parts)).encode('utf-8')
