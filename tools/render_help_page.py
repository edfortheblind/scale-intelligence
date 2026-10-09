"""Accessible SCALE articles with optional technical references."""
from collections import Counter
from html import escape
from urllib.parse import quote, urlencode

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
    return '<div id="article-sources" tabindex="-1">'+''.join(parts)+'</div>'


def render_article_find(knowledge, topic, question, page=1):
    result = knowledge.find_in_topic(topic['topic_id'], question, page)
    action = '/topic/'+quote(topic['topic_id'], safe='')+'#article-matches'
    parts = ['<section id="article-matches" tabindex="-1" aria-labelledby="article-find-heading">',
             '<details class="article-search"'+(' open' if question.strip() else '')+'>',
             '<summary id="article-find-heading">Find in this article</summary>',
             element('p', 'Search article explanations and reviewed routine notes in '+topic['title']+
                     '. This article may cover several routines.', ' id="article-find-help"'),
             '<form action="'+escape(action, quote=True)+'" method="get">',
             '<label for="article-find">Words or question</label>',
             '<div class="search-row"><input id="article-find" name="find" type="search" '
             'aria-describedby="article-find-help" maxlength="500" value="'+escape(question, quote=True)+'">',
             '<button type="submit">Find</button></div></form>']
    if question.strip():
        parts.append('<h3>Matching passages in this article</h3>')
        if result['results']:
            start = (result['page'] - 1) * result['page_size']
            parts.append(element('p', 'Showing '+str(start + 1)+'–'+str(start + len(result['results']))+
                                 ' of '+str(result['total'])+' matching passages. Page '+str(result['page'])+
                                 ' of '+str(result['pages'])+'.', ' role="status"'))
            parts.append('<ol class="guide-results" start="'+str(start + 1)+'">')
            for match in result['results']:
                parts += ['<li>', element('p', match['label']), element('p', match['text'])]
                if match['source_id']:
                    source = knowledge.source(match['source_id'])
                    parts += [element('p', 'Source: '+source['kind_label']+' — '+source['label'], ' class="hash"'),
                              element('p', source['qualification'])]
                parts.append('</li>')
            parts.append('</ol>')
            if result['pages'] > 1:
                parts.append('<nav aria-label="Article match pages">')
                for number, label in [(page - 1, 'Previous page'), (page + 1, 'Next page')]:
                    if 1 <= number <= result['pages']:
                        href = '/topic/'+quote(topic['topic_id'], safe='')+'?'+urlencode(
                            {'find': question, 'page': number})+'#article-matches'
                        parts.append('<a href="'+escape(href, quote=True)+'">'+label+'</a> ')
                parts.append('</nav>')
            parts.append('<p><a href="#article-sources">Article sources and qualifications</a>. '
                         'Article text uses the article’s source references; it has no separate passage citation.</p>')
        else:
            parts.append(element('p', 'No matching text in this article. Try different words or search SCALE Knowledge.',
                                 ' role="status"'))
        parts.append('<p><a href="/?q='+quote(question, safe='')+'#results-heading">Search SCALE Knowledge for these words</a></p>')
    parts.append('</details></section>')
    return ''.join(parts)


def render_shell(title, content):
    template = (ROOT/'help_app/index.html').read_text(encoding='utf-8')
    return template.replace('{{TITLE}}', escape(title)).replace('{{CONTENT}}', content).encode('utf-8')


def render_page(knowledge, question='', topic_id=None, guides=None, article_find='', article_find_page=1):
    if len(question) > 500:
        raise ValueError('Use a question of 500 characters or fewer.')
    if not isinstance(article_find, str) or len(article_find) > 500:
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
        guide_matches = []
        if guides is not None:
            from render_help_guides import guide_search
            guide_matches = guides.search(question)['results']
        exact_guide = bool(guide_matches and guide_matches[0].get('evidence_scope') == 'DOCUMENTED_SRC_CATALOG_MATCH')
        parts.append('<section aria-labelledby="results-heading"><h2 id="results-heading" tabindex="-1">Search results</h2>')
        if exact_guide:
            parts.append(guide_search(guides, question, matches=guide_matches, nested=True))
            parts.append('<h3>Related articles</h3>')
        if result.get('state') == 'NEEDS_CONTEXT':
            parts.append(element('p', result['clarification'], ' role="status"'))
        elif result['results']:
            parts.append(element('p', str(len(result['results']))+' related articles.', ' role="status"'))
            parts.append('<ul id="result-list">')
            for match in result['results']:
                parts.append('<li>'+topic_link(match['topic_id'], match['title'])+element('p', match['answer']))
                if match.get('matching_detail') and match.get('matching_source_id'):
                    source = knowledge.source(match['matching_source_id'])
                    parts += ['<details class="source">',
                              element('summary', 'Matching detail and source: '+match['title']),
                              element('p', match['matching_detail']),
                              element('p', 'Source: '+source['kind_label']+' — '+source['label'], ' class="hash"'),
                              element('p', source['qualification']), '</details>']
                parts.append('</li>')
            parts.append('</ul>')
        else:
            parts.append(element('p', 'No article matched. Try the process or setting name, or browse the topics below.', ' role="status"'))
        parts.append('</section>')
        if guides is not None and not exact_guide:
            parts.append(guide_search(guides, question, matches=guide_matches))
        if guides is not None:
            from render_help_guides import tab_search
            parts.append(tab_search(guides, question))
    if topic:
        parts += ['<article id="answer" aria-labelledby="answer-title" tabindex="-1">',
                  element('h2', topic['title'], ' id="answer-title"'), element('p', topic['what_it_does'], ' class="lead"'),
                  render_article_find(knowledge, topic, article_find, article_find_page)]
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
        parts.append('<section aria-labelledby="programming-heading"><h2 id="programming-heading">Database programming reference</h2>'
                     '<p>Find captured stored procedures, functions, tables and columns.</p>'
                     '<p><a href="/programming">Find programming objects</a></p></section>')
        if guides is not None:
            from render_help_guides import guide_navigation
            parts.append(guide_navigation(guides))
        if setup:
            parts += ['<section aria-labelledby="configure-heading"><h2 id="configure-heading">Configure SCALE</h2>', topic_list(setup), '</section>']
        parts += ['<details'+('' if question.strip() else ' open')+'><summary>Warehouse processes</summary>', topic_list(processes), '</details>',
                  '<details><summary>All other articles ('+str(len(other))+')</summary>', topic_list(other), '</details></nav>']
    title = topic['title']+' | SCALE Knowledge' if topic else 'SCALE Knowledge'
    return render_shell(title, ''.join(parts))
