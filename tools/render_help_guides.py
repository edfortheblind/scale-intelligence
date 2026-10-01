"""Inert HTML for the reviewed guide Markdown vocabulary and cited source text."""
from html import escape
import json
import re

from help_guides import GUIDE_SCOPE, plain


INLINE = re.compile(r'(`[^`\n]+`|\*\*[^*\n]+\*\*|(?<!\*)\*[^*\n]+\*(?!\*)|\[[^\]\n]+\]\([^)\n]+\)|\[[^\]\n]+\]\[[^\]\n]+\]|\[[A-Za-z][A-Za-z0-9_-]*\])')
INACTIVE_SOURCE_TAGS = {'script', 'style', 'iframe', 'object', 'form', 'input', 'button'}


def source_title(article):
    """Use the retained article heading; extracted metadata may name a neighbor."""
    def text(value):
        if isinstance(value, str):
            return value
        if value['tag'] in INACTIVE_SOURCE_TAGS:
            return ''
        return ''.join(text(child) for child in value.get('children', []))
    def first_h1(value):
        if isinstance(value, str) or value['tag'] in INACTIVE_SOURCE_TAGS:
            return None
        if value['tag'] == 'h1':
            return ' '.join(text(value).split()) or None
        for child in value.get('children', []):
            title = first_h1(child)
            if title:
                return title
        return None
    return first_h1(article['content_tree']) or article['title']


def inline(text, guide, library):
    parts, previous = [], 0
    for token in INLINE.finditer(text):
        parts.append(escape(text[previous:token.start()]))
        value = token[0]
        if value.startswith('`'):
            parts.append('<code>'+escape(value[1:-1])+'</code>')
        elif value.startswith('**'):
            parts.append('<strong>'+escape(value[2:-2])+'</strong>')
        elif value.startswith('*'):
            parts.append('<em>'+inline(value[1:-1], guide, library)+'</em>')
        else:
            match = re.fullmatch(r'\[([^\]]+)\](?:\(([^)]+)\)|\[([^\]]+)\])?', value)
            label, direct, reference = match.groups()
            destination = direct or guide['references'].get(reference or label)
            href = library.link(guide, destination) if destination else None
            rendered = escape(label)
            accessible_name = ''
            if href and href.startswith('/guide-source/') and re.fullmatch(r'[A-Z][A-Z0-9_-]{0,11}', label):
                source_key = href.removeprefix('/guide-source/').split('#', 1)[0]
                title = source_title(library.sources[source_key])
                accessible_name = ' aria-label="'+escape(label+': '+title+', source', quote=True)+'"'
            parts.append('<a href="'+escape(href, quote=True)+'"'+accessible_name+'>'+rendered+'</a>' if href else rendered)
        previous = token.end()
    parts.append(escape(text[previous:]))
    return ''.join(parts)


def table(rows, render, label):
    parts = ['<div class="guide-table" role="region" tabindex="0" aria-label="'+escape(label, quote=True)+'">',
             '<table><caption>'+escape(label)+'</caption><thead><tr>']
    parts.extend('<th scope="col">'+render(cell)+'</th>' for cell in rows[0])
    parts.append('</tr></thead><tbody>')
    for row in rows[1:]:
        parts += ['<tr>', *('<td>'+render(cell)+'</td>' for cell in row), '</tr>']
    return ''.join(parts)+'</tbody></table></div>'


def guide_navigation(library):
    return ('<section aria-labelledby="guides-heading"><h2 id="guides-heading">Detailed procedure guides</h2>'
            '<p>Warehouse Mobile, RF and Cross Application steps, conditions and source limits.</p><ul class="topic-list">'+
            ''.join('<li><a href="/guide/'+row['guide_id']+'#guide-content">'+escape(row['title'])+'</a></li>' for row in library.listing())+
            '</ul></section>')


def guide_search(library, question):
    matches = library.search(question)['results']
    parts = ['<section aria-labelledby="guide-results-heading"><h2 id="guide-results-heading" tabindex="-1">Procedure guide matches</h2>',
             '<p>Step-by-step procedures, conditions and source limits for your search.</p>']
    if not matches:
        parts.append('<p>No guide section matched. Browse the detailed procedure guides below.</p>')
    else:
        parts.append('<ul class="guide-results">')
        for row in matches:
            href = '/guide/'+row['guide_id']+'#'+row['anchor']
            parts.append('<li><a href="'+escape(href, quote=True)+'">'+escape(row['section_title'])+'</a><p>'+escape(row['text'])+'</p></li>')
        parts.append('</ul>')
    return ''.join(parts)+'</section>'


def render_guide(library, key):
    guide = library.guides[key]
    render = lambda value: inline(value, guide, library)
    parts = ['<nav aria-label="Library"><a href="/">Search SCALE Knowledge</a> · <a href="/guides">All procedure guides</a></nav>',
             '<article class="guide" id="guide-content" tabindex="-1" aria-labelledby="guide-title">',
             '<h2 id="guide-title"><span id="'+escape(guide['blocks'][0]['anchor'], quote=True)+'" tabindex="-1">'+escape(guide['title'])+'</span></h2>', '<p class="scope">'+escape(GUIDE_SCOPE)+'</p>',
             '<details class="guide-contents" open><summary>On this page</summary><nav aria-label="Guide sections"><ul>']
    parts.extend('<li><a href="#'+escape(b['anchor'], quote=True)+'">'+escape(plain(b['text']))+'</a></li>'
                 for b in guide['blocks'] if b['kind'] == 'heading' and b['level'] == 2)
    parts.append('</ul></nav></details>')
    heading = guide['title']
    for index, block in enumerate(guide['blocks']):
        kind = block['kind']
        if kind == 'heading':
            if index == 0 and block['level'] == 1:
                continue
            level = min(block['level']+1, 6)
            if block['alias'] and block['alias'] != block['anchor']:
                parts.append('<span id="'+escape(block['alias'], quote=True)+'"></span>')
            parts.append(f'<h{level} id="'+escape(block['anchor'], quote=True)+'" tabindex="-1">'+render(block['text'])+f'</h{level}>')
            heading = plain(block['text'])
        elif kind == 'paragraph':
            parts.append('<p>'+render(block['text'])+'</p>')
        elif kind == 'list':
            tag = 'ol' if block['ordered'] else 'ul'
            attribute = ' start="'+str(block['start'])+'"' if block['ordered'] else ''
            parts.append('<'+tag+attribute+'>'+''.join('<li>'+render(item)+'</li>' for item in block['items'])+'</'+tag+'>')
        elif kind == 'table':
            parts.append(table(block['rows'], render, heading))
    parts += ['<details class="references"><summary>Guide identity and evidence scope</summary>',
              '<p>'+escape(guide['path'])+'</p><p class="hash">Guide SHA-256: '+guide['sha256']+'</p>',
              '<p class="hash">Collection manifest SHA-256: '+library.manifest_sha256+'</p></details></article>']
    return guide['title'], ''.join(parts)


def render_source(library, key):
    article = library.sources[key]
    # Source text remains readable with node anchors and table/list structure.
    # No original URL, image, script, form, style or operational link is activated.
    allowed = {'p', 'div', 'span', 'b', 'strong', 'i', 'em', 'ul', 'ol', 'li', 'table', 'thead', 'tbody', 'tr', 'th', 'td', 'pre', 'code', 'blockquote', 'br'}
    def heading_depths(value):
        if isinstance(value, str) or value['tag'] in INACTIVE_SOURCE_TAGS:
            return set()
        depths = {int(value['tag'][1])} if re.fullmatch(r'h[1-6]', value['tag']) else set()
        for child in value.get('children', []):
            depths.update(heading_depths(child))
        return depths
    levels = {depth: index+3 for index, depth in enumerate(sorted(heading_depths(article['content_tree'])))}
    def node(value):
        if isinstance(value, str):
            return escape(value)
        tag = value['tag']
        if tag in INACTIVE_SOURCE_TAGS:
            return ''
        children = ''.join(node(c) for c in value.get('children', []))
        if tag == 'body':
            return children
        if tag == 'img':
            return '<span class="scope">[Source figure: '+escape(value.get('attrs', {}).get('alt') or 'not included in this text view')+']</span>'
        logical_level = None
        if re.fullmatch(r'h[1-6]', tag):
            logical_level = levels[int(tag[1])]
            tag = 'h'+str(min(logical_level, 6))
        elif tag not in allowed:
            tag = 'span'
        identity = value.get('node_id', '')
        attrs = ' id="'+escape(identity, quote=True)+'" tabindex="-1"' if identity else ''
        if logical_level and logical_level > 6:
            attrs += ' aria-level="'+str(logical_level)+'"'
        if tag in {'th', 'td'}:
            for name in ('colspan', 'rowspan'):
                number = value.get('attrs', {}).get(name, '')
                if str(number).isdigit():
                    attrs += ' '+name+'="'+str(number)+'"'
            if tag == 'th':
                attrs += ' scope="col"'
        result = '<'+tag+attrs+'>'+children+('' if tag == 'br' else '</'+tag+'>')
        return '<div class="guide-table" role="region" tabindex="0" aria-label="Source table">'+result+'</div>' if tag == 'table' else result
    title = 'Source: '+source_title(article)
    body = ('<nav aria-label="Library"><a href="/guides">All procedure guides</a></nav>'
            '<article class="guide" id="guide-content" tabindex="-1"><h2>'+escape(title)+'</h2>'
            '<p class="scope">Retained source text, not the live application. Figures and operational links are inactive in this view. '
            'Article and original-source fingerprints were checked before loading.</p>'+node(article['content_tree'])+
            '<details class="references"><summary>Source identity</summary><p>'+escape(key)+'</p><p class="hash">Original SHA-256: '+
            article['source']['sha256']+'</p></details></article>')
    return title, body


def render_evidence(library, key):
    title = {'mobile-navigation': 'Recorded navigation evidence',
             'mobile-catalog': 'Source and flow catalog evidence',
             'scale-reference': 'SCALE functionality source bindings'}[key]
    body = ('<nav aria-label="Library"><a href="/guides">All procedure guides</a></nav><article id="guide-content" tabindex="-1">'
            '<h2>'+title+'</h2><p class="scope">Recorded evidence has its stated date and limits. It is not a live status check.</p><pre>'+
            escape(json.dumps(library.evidence[key], indent=2, ensure_ascii=False))+'</pre></article>')
    return title, body
