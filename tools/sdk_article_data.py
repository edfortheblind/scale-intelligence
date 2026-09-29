"""Preserve SDK source bodies and static Innovasys states without executing source.

The SDK adapter is independent of the accepted AIM converter. Originals are never
edited. Conversion is a fidelity draft; module/pilot approval remains a separate
source-bound verification step.
"""
import copy
import html
import json
import re
from urllib.parse import urljoin, urlsplit

import article_data as shared
from article_data import TreeParser, nodes, text_of, search_text, decode_original
from collector import atomic_bytes, atomic_json, digest, source_identity, VERSION
from discover_sdk import candidates, reference_kind

SCHEMA = 1
CONVERTER = 'sdk-innovasys-static-2'
SAFE_TAGS = shared.SAFE_TAGS | {'font', 'label', 'input'}
SAFE_ATTRS = shared.SAFE_ATTRS | {'for', 'color', 'face', 'size', 'checked',
    'data-title', 'data-itemid', 'data-languagename', 'data-toggleclass'}
EXECUTABLE_TYPES = {'', 'text/javascript', 'application/javascript',
    'text/ecmascript', 'application/ecmascript', 'module'}
# Exact captured renderer bytes inspected for sibling section toggles, syntax
# tabs, language filters and first-TD clipboard payloads. An unknown renderer is
# an explicit hold, rather than an inferred equivalent implementation.
RENDERER_HASHES = {
    '84ff355a3c54a8a832ecf978816a7321dad5ebcfd8c830bbb21993c3886574e8',
    'fc0b96647059feab8ae5f5b825014f55bd0faaca6fc2b26cb93e042c322d046f',
}
LEGACY_TOGGLE_HASH = '9579025296114b8ecf69158763734cd98eb66a9342a79b9549831a85bb06126d'


def literal_dom_text(value):
    """HTML input preprocessing applies to literal CR, before entity decoding."""
    return value.replace('\r\n', '\n').replace('\r', '\n')


class SdkTreeParser(TreeParser):
    """Keep exact decoded source and a separate, token-aware text projection.

    This is not an HTML5 tree-repair engine. Structural source errors remain
    errors, and independent inert-browser verification validates the projection.
    Sparse overrides only record where browser text differs from ordinary CR/LF
    normalization: PRE's immediately following LF, or numeric CR references.
    """
    def __init__(self, source):
        super().__init__()
        self.convert_charrefs = False
        self.source = source
        self.line_offsets = [0] + [m.end() for m in re.finditer('\n', source)]
        self.dom_segments = {}
        self.ignore_pre_lf = None
        self.conditional_comments = []

    def handle_starttag(self, tag, attrs):
        self.ignore_pre_lf = None
        super().handle_starttag(tag, attrs)
        if tag == 'pre':
            self.ignore_pre_lf = self.stack[-1]['node_id']

    def handle_endtag(self, tag):
        self.ignore_pre_lf = None
        super().handle_endtag(tag)

    def handle_startendtag(self, tag, attrs):
        if tag not in shared.VOID:
            self.errors.append({'class':'SELF_CLOSING_NONVOID_ELEMENT', 'tag':tag})
        super().handle_startendtag(tag, attrs)

    def append_text(self, original, browser_text):
        node = self.stack[-1]
        index = len(node['children'])
        if node['children'] and isinstance(node['children'][-1], str):
            index -= 1
        if self.ignore_pre_lf == node['node_id'] and browser_text.startswith('\n'):
            browser_text = browser_text[1:]
        self.ignore_pre_lf = None
        super().handle_data(original)
        segments = self.dom_segments.setdefault(node['node_id'], {})
        segments[index] = segments.get(index, '') + browser_text

    def handle_data(self, data):
        self.append_text(data, literal_dom_text(data))

    def reference_spelling(self, prefix, name):
        line, column = self.getpos()
        start = self.line_offsets[line-1] + column
        value = prefix + name
        return value + (';' if self.source[start+len(value):start+len(value)+1] == ';' else '')

    def handle_entityref(self, name):
        decoded = html.unescape(self.reference_spelling('&', name))
        self.append_text(decoded, decoded)

    def handle_charref(self, name):
        decoded = html.unescape(self.reference_spelling('&#', name))
        self.append_text(decoded, decoded)

    def handle_comment(self, data):
        self.ignore_pre_lf = None
        if re.search(r'\[\s*(?:if\b|endif\b)', data, re.I):
            self.conditional_comments.append({'reason':'unclassified_conditional_comment',
                'comment':data, 'source_position':list(self.getpos())})

    def handle_decl(self, decl):
        self.ignore_pre_lf = None

    def unknown_decl(self, data):
        self.ignore_pre_lf = None
        self.conditional_comments.append({'reason':'unclassified_conditional_comment',
            'comment':data, 'source_position':list(self.getpos())})

    def handle_pi(self, data):
        self.ignore_pre_lf = None

    def close(self):
        super().close()
        for node in nodes(self.root):
            overrides = {str(index):projected for index, projected in self.dom_segments.get(node['node_id'], {}).items()
                         if projected != literal_dom_text(node['children'][index])}
            if overrides:
                node['browser_text_overrides'] = overrides


def dom_text_of(node):
    """Project browser textContent without altering exact source text_of()."""
    if isinstance(node, str):
        return literal_dom_text(node)
    overrides = node.get('browser_text_overrides', {})
    return ''.join(overrides.get(str(index), dom_text_of(child)) for index, child in enumerate(node.get('children', [])))


def classes(node):
    return set((node['attrs'].get('class') or '').split())


def parse_article(record, body):
    if record.get('module', 'SDK') != 'SDK':
        raise ValueError('SDK_CONVERTER_REQUIRES_SDK')
    source, encoding = decode_original(record, body)
    parser = SdkTreeParser(source)
    parser.feed(source)
    parser.close()
    bodies = [n for n in nodes(parser.root) if n['tag'] == 'body']
    if len(bodies) != 1:
        raise ValueError('ARTICLE_BODY_REQUIRED')
    excluded = []

    def prune(node):
        if isinstance(node, str):
            return node
        if node['tag'] in ('script', 'style'):
            kind = (node['attrs'].get('type') or '').lower()
            known = (node['tag'] == 'style' or kind in EXECUTABLE_TYPES or
                     kind in ('i-url-container/script', 'i-url-container/css'))
            excluded.append({'reason':'executable_or_stylesheet' if known else 'unclassified_script_data',
                             'node':copy.deepcopy(node)})
            return None
        result = {**node, 'attrs':dict(node['attrs']), 'children':[]}
        original_overrides = node.get('browser_text_overrides', {})
        remapped = {}
        for index, child in enumerate(node['children']):
            value = prune(child)
            if value is not None:
                if str(index) in original_overrides:
                    remapped[str(len(result['children']))] = original_overrides[str(index)]
                result['children'].append(value)
        result.pop('browser_text_overrides', None)
        if remapped:
            result['browser_text_overrides'] = remapped
        return result

    content = prune(bodies[0])
    excluded_ids = {entry['node']['node_id'] for entry in excluded}
    # A data script in the head can also supply documentary content. Keep it
    # visible to the hold gate even though the reading body's shell excludes it.
    for node in nodes(parser.root):
        if node['tag'] == 'script' and node['node_id'] not in excluded_ids:
            kind = (node['attrs'].get('type') or '').lower()
            if kind not in EXECUTABLE_TYPES | {'i-url-container/script', 'i-url-container/css'}:
                excluded.append({'reason':'unclassified_script_data', 'node':copy.deepcopy(node)})
    excluded.extend(parser.conditional_comments)
    titles = [text_of(n) for n in nodes(parser.root) if n['tag'] == 'title']
    title = titles[0] if titles else (record.get('titles') or [''])[0]
    return parser, content, excluded, title, encoding


def discover_references(store, record, parser):
    base = record.get('final_url') or record['source_url']
    bases = [n['attrs'].get('href') for n in nodes(parser.root)
             if n['tag'] == 'base' and n['attrs'].get('href')]
    if bases:
        base = urljoin(base, bases[0])
    refs = []
    catalog = {r['id']:r for r in store.records('SDK')}
    for node, attribute, href in candidates(parser, 'article'):
        item = {'node_id':node['node_id'], 'tag':node['tag'], 'attribute':attribute,
                'original_href':href, 'effective_base':base, 'source_id':record['id'],
                'source_sha256':record['sha256'], 'source_flags':dict(node['attrs'])}
        if href in ('', '#'):
            item.update(classification='container', target_id=None, fragment='')
        elif href.startswith(('data:', 'javascript:', 'mailto:', 'tel:')):
            item.update(classification='inert_or_embedded_reference', target_id=None)
        else:
            kind, navigation_role = reference_kind(node, attribute, href, base, 'article')
            # The publisher marks these links as topic captions; retain the
            # literal route (including extensionless GUIDs), never add a suffix.
            if kind == 'unclassified' and node['tag'] == 'a' and attribute == 'href' and node['attrs'].get('data-auto-update-caption') == 'true':
                kind = 'article'
                item['classification_evidence'] = 'published_topic_auto_update_caption'
            item['kind'] = kind
            try:
                identity = source_identity(href, base)
                item.update(resolved_url=identity['url'], target_id=identity['id'], fragment=identity['fragment'])
                if identity['module'] != 'SDK':
                    item['classification'] = 'deferred_cross_module'
                elif identity['fetch_key'] == record['source_url'].split('#')[0] and identity['fragment']:
                    item['classification'] = 'same_document'
                elif kind == 'unclassified':
                    item['classification'] = 'classification_required'
                else:
                    target = catalog.get(identity['id'])
                    if target is None:
                        target = store.discover('SDK', href, base,
                            record['id']+'@'+record['sha256']+':'+node['node_id']+':'+attribute, kind)
                        if navigation_role:
                            target['navigation_role'] = navigation_role
                            store.save_record(target)
                        catalog[target['id']] = target
                    item.update(classification='internal', target_type=target['type'])
            except ValueError as error:
                item.update(classification='out_of_scope_reference', target_id=None, reason=str(error))
                if 'SENSITIVE' in str(error):
                    item['original_href'] = '[redacted sensitive URL]'
                else:
                    item['resolved_url'] = urljoin(base, href)
        refs.append(item)
    return refs


def is_shell_state(node):
    cls = classes(node)
    return (node['tag'] == 'label' and any(c.startswith('i-language-filter-') or c.endswith('-label') or
            c in ('i-collapse-all', 'i-expand-all', 'i-show-all-dropdowns', 'i-hide-all-dropdowns') for c in cls) or
            'i-view-in-frame-link' in cls or node['attrs'].get('id') == 'i-language-options')


def state_kinds(node):
    cls = classes(node)
    kinds = []
    if 'i-section-content' in cls:
        kinds.append('section')
    if 'i-dropdown-content' in cls:
        kinds.append('dropdown')
    if any(c.startswith('i-filtered-content-') for c in cls) and node['tag'] != 'li':
        kinds.append('language_variant')
    if cls.intersection({'hs-collapsed', 'hs-expanded'}):
        kinds.append('legacy_toggle')
    return kinds


def inventory(content):
    result = shared.inventory(content)
    by_id = {n['node_id']:n for n in nodes(content)}
    variants = [v for v in result['variants'] if not is_shell_state(by_id[v['node_id']])]
    selected = {v['node_id'] for v in variants}
    for node in nodes(content):
        kinds = state_kinds(node)
        if kinds and node['node_id'] not in selected:
            variants.append({'node_id':node['node_id'], 'condition':dict(node['attrs']),
                'text_sha256':digest(text_of(node).encode('utf-8')),
                'representation':'all_published_static_content_expanded', 'state_kinds':kinds})
            selected.add(node['node_id'])
    order = {n['node_id']:i for i, n in enumerate(nodes(content))}
    result['variants'] = sorted(variants, key=lambda v:order[v['node_id']])
    result['code_cells'] = [{'node_id':n['node_id'], 'text':text_of(n),
        'text_sha256':digest(text_of(n).encode('utf-8'))} for n in nodes(content) if 'i-code' in classes(n)]
    return result


def reconcile(content, references, resources):
    all_nodes = list(nodes(content))
    by_id = {}
    parents = {}
    for node in all_nodes:
        if node['attrs'].get('id'):
            by_id.setdefault(node['attrs']['id'], []).append(node)
        for child in node['children']:
            if isinstance(child, dict):
                parents[child['node_id']] = node
    edges, issues = [], []
    covered = set()
    evidence = []
    for ref in references:
        target = resources.get(ref.get('target_id'), {})
        if ref.get('kind') == 'script' and target.get('status') == 'BODY_SAVED' and target.get('sha256') in RENDERER_HASHES | {LEGACY_TOGGLE_HASH}:
            evidence.append({'id':target['id'], 'source_url':target['source_url'], 'sha256':target['sha256']})
    known_renderer = any(e['sha256'] in RENDERER_HASHES for e in evidence)
    known_legacy = any(e['sha256'] == LEGACY_TOGGLE_HASH for e in evidence)

    def add(kind, control, body, **extra):
        covered.add(body['node_id'])
        edge = {'kind':kind, 'control_node':control['node_id'] if control else None,
                'body_node':body['node_id'], 'body_text_sha256':digest(text_of(body).encode('utf-8')),
                'source_body_attributes':dict(body['attrs']), 'representation':'expanded_static_body'}
        if control:
            edge['source_control_attributes'] = dict(control['attrs'])
        edge.update(extra)
        edges.append(edge)

    def next_element(node):
        parent = parents.get(node['node_id'])
        if parent is None:
            return None
        children = [n for n in parent['children'] if isinstance(n, dict)]
        index = next(i for i, n in enumerate(children) if n['node_id'] == node['node_id'])
        return children[index+1] if index+1 < len(children) else None

    for node in all_nodes:
        cls, attrs = classes(node), node['attrs']
        for heading, body_class, kind in [('i-section-heading', 'i-section-content', 'section'),
                                          ('i-dropdown-heading', 'i-dropdown-content', 'dropdown')]:
            if heading in cls:
                target = next_element(node)
                if target and body_class in classes(target):
                    add(kind, node, target)
                else:
                    issues.append({'class':'MISSING_SIBLING_STATE_BODY', 'node_id':node['node_id'], 'kind':kind})
        if 'i-tab-container' in cls:
            lists = [n for n in node['children'] if isinstance(n, dict) and n['tag'] in ('ul', 'ol')]
            controls = [n for group in lists for n in nodes(group) if n['tag'] == 'a']
            if not controls:
                issues.append({'class':'MISSING_TAB_CONTROLS', 'node_id':node['node_id']})
            descendants = {n['node_id'] for n in nodes(node)}
            for control in controls:
                href = control['attrs'].get('href') or ''
                targets = by_id.get(href[1:], []) if href.startswith('#') and len(href) > 1 else []
                targets = [target for target in targets if target['node_id'] in descendants]
                if len(targets) != 1:
                    issues.append({'class':'MISSING_OR_AMBIGUOUS_TAB_BODY', 'node_id':control['node_id'], 'original_href':href})
                else:
                    add('language_tab', control, targets[0], label=text_of(control), container_node=node['node_id'])
        if 'i-toggle-language-checkbox' in cls:
            toggle = attrs.get('data-toggleclass')
            targets = [n for n in all_nodes if toggle and toggle in classes(n) and n['tag'] != 'li']
            if not targets:
                issues.append({'class':'MISSING_LANGUAGE_FILTER_BODY', 'node_id':node['node_id']})
            for target in targets:
                add('language_filter', node, target, language=attrs.get('data-languagename'))
        if 'i-copy-code' in cls:
            ancestor = parents.get(node['node_id'])
            while ancestor and ancestor['tag'] != 'table':
                ancestor = parents.get(ancestor['node_id'])
            cells = [n for n in nodes(ancestor) if n['tag'] == 'td'] if ancestor else []
            if not cells:
                issues.append({'class':'MISSING_COPY_CODE_CELL', 'node_id':node['node_id']})
            else:
                original = text_of(cells[0])
                normalized = dom_text_of(cells[0])
                add('copy_code', node, cells[0], source_text=original,
                    copy_text=normalized, copy_text_sha256=digest(normalized.encode('utf-8')),
                    copy_derivation='first descendant td of closest table; literal CR/CRLF normalization before entity decoding and immediate PRE LF suppression; independently verify against inert browser textContent',
                    representation='original_code_cell_and_explicit_copy_payload')
        if 'i-popup-link' in cls:
            selector = attrs.get('data-popup-contentsource') or ''
            targets = by_id.get(selector[1:], []) if re.fullmatch(r'#[A-Za-z0-9_:-]+', selector) else []
            if selector and len(targets) == 1:
                add('shell_popup' if is_shell_state(targets[0]) else 'popup', node, targets[0])
            elif selector or attrs.get('data-popup-content') is not None:
                issues.append({'class':'UNSUPPORTED_POPUP_CONTENT', 'node_id':node['node_id']})
        for attribute, value in attrs.items():
            if attribute.startswith('on') and value and 'HSToggleSection' in value:
                match = re.fullmatch(r'\s*(?:javascript:)?\s*HSToggleSection\(\s*[\"\']([^\"\']+)[\"\']\s*\)\s*;?\s*(?:return\s+false\s*;?)?\s*', value)
                targets = by_id.get(match[1], []) if match else []
                if len(targets) != 1:
                    issues.append({'class':'UNSUPPORTED_LEGACY_TOGGLE', 'node_id':node['node_id']})
                else:
                    add('legacy_toggle', node, targets[0])
    for node in all_nodes:
        if state_kinds(node) == ['language_variant'] and node['node_id'] not in covered:
            add('language_variant', None, node, language=node['attrs'].get('data-itemid') or node['attrs'].get('data-title'))
    for variant in inventory(content)['variants']:
        if variant['node_id'] not in covered:
            issues.append({'class':'UNMAPPED_DOCUMENTARY_STATE', 'node_id':variant['node_id']})
    if any(e['kind'] != 'legacy_toggle' for e in edges) and not known_renderer:
        issues.append({'class':'UNVERIFIED_SDK_RENDERER_SEMANTICS'})
    if any(e['kind'] == 'legacy_toggle' for e in edges) and not known_legacy:
        issues.append({'class':'UNVERIFIED_LEGACY_TOGGLE_SEMANTICS'})
    return {'schema_version':1, 'control_body_edges':edges, 'condition_nodes':[],
            'issues':issues, 'static_relationships_passed':not issues,
            'renderer_semantics_evidence':sorted(evidence, key=lambda e:e['id']),
            'representation':'all source-published static states retained and expanded; no source JavaScript execution'}


def serialize(content, refs, resources, module='SDK'):
    if module != 'SDK':
        raise ValueError('SDK_CONVERTER_REQUIRES_SDK')
    refmap = {(r['node_id'], r['attribute'], r['original_href']):r for r in refs}
    exceptions = []

    def local_reference(node, key, value):
        ref = refmap.get((node['node_id'], key, value))
        if not ref:
            return value if key == 'href' and value.startswith('#') and value != '#' else None
        if ref['classification'] == 'same_document':
            return '#' + ref['fragment']
        if ref['classification'] == 'internal':
            target = resources.get(ref['target_id'])
            if not target:
                return None
            fragment = '#' + ref['fragment'] if ref.get('fragment') else ''
            if target['type'] == 'article':
                return target['id'] + '.html' + fragment
            if target['type'] == 'navigation':
                return 'index.html'
            if target.get('local_path'):
                return '../' + target['local_path'].split('/', 1)[1] + fragment
        if key == 'href' and ref['classification'] in ('deferred_cross_module', 'out_of_scope_reference'):
            url = ref.get('resolved_url')
            if url and urlsplit(url).scheme in ('https', 'http'):
                return url
        if key == 'href' and value.startswith(('mailto:', 'tel:')):
            return value
        if key in ('src', 'poster') and value.startswith('data:image/') and not value.lower().startswith('data:image/svg'):
            return value
        return None

    def render(node):
        if isinstance(node, str):
            return html.escape(node, quote=False)
        tag = node['tag']
        if tag == 'body':
            return ''.join(render(c) for c in node['children'])
        if tag == 'noscript':
            tag = 'div'
        if tag not in SAFE_TAGS:
            exceptions.append({'node_id':node['node_id'], 'tag':tag, 'class':'UNSUPPORTED_ELEMENT'})
            tag = 'div'
        if tag == 'input' and not ('i-toggle-language-checkbox' in classes(node) and node['attrs'].get('type') == 'checkbox'):
            exceptions.append({'node_id':node['node_id'], 'tag':tag, 'class':'UNSUPPORTED_INPUT_STATE'})
        attrs = []
        for key, value in node['attrs'].items():
            if key in SAFE_ATTRS and value is not None:
                attrs.append((key, value))
            elif key == 'style' and value:
                style = shared.safe_style(value)
                if style:
                    attrs.append(('style', style))
            elif key in ('href', 'src', 'poster') and value:
                target = local_reference(node, key, value)
                if target:
                    attrs.append((key, target))
            elif key == 'srcset' and value and 'data:' not in value:
                options = []
                for candidate in value.split(','):
                    parts = candidate.strip().split()
                    if parts:
                        target = local_reference(node, key, parts[0])
                        if target:
                            options.append(' '.join([target] + parts[1:]))
                if options:
                    attrs.append(('srcset', ', '.join(options)))
        lazy = node['attrs'].get('data-src') or node['attrs'].get('data-original')
        if tag == 'img' and lazy:
            key = 'data-src' if node['attrs'].get('data-src') else 'data-original'
            target = local_reference(node, key, lazy)
            if target:
                attrs = [(k, v) for k, v in attrs if k != 'src']
                attrs.append(('src', target))
        if tag == 'details':
            attrs.append(('open', 'open'))
        if tag == 'input':
            attrs.append(('disabled', 'disabled'))
        if tag == 'img':
            attrs.append(('loading', 'eager'))
        attrs.append(('data-source-node', node['node_id']))
        attr_text = ''.join(' '+k+'="'+html.escape(str(v), quote=True)+'"' for k, v in attrs)
        return '<'+tag+attr_text+'>'+('' if tag in shared.VOID else ''.join(render(c) for c in node['children'])+'</'+tag+'>')
    return render(content), exceptions


def convert(store, record):
    if record['module'] != 'SDK':
        raise ValueError('SDK_CONVERTER_REQUIRES_SDK')
    body = (store.root/record['local_path']).read_bytes()
    if digest(body) != record['sha256']:
        raise ValueError('SOURCE_HASH_MISMATCH')
    parser, content, excluded, title, encoding = parse_article(record, body)
    references = discover_references(store, record, parser)
    resources = {r['id']:r for r in store.records('SDK')}
    source_inventory = inventory(content)
    markup, exceptions = serialize(content, references, resources)
    check = TreeParser()
    check.feed('<body>'+markup+'</body>')
    check.close()
    reading = next(n for n in nodes(check.root) if n['tag'] == 'body')
    reading_inventory = inventory(reading)
    states = reconcile(content, references, resources)
    checks = {
        'exact_decoded_text':text_of(content) == text_of(reading),
        'table_cell_structure':[{k:v for k,v in t.items() if k != 'node_id'} for t in source_inventory['tables']] == [{k:v for k,v in t.items() if k != 'node_id'} for t in reading_inventory['tables']],
        'exact_code_whitespace':[(n['tag'], n['text']) for n in source_inventory['code']] == [(n['tag'], n['text']) for n in reading_inventory['code']],
        'exact_code_cells':[n['text'] for n in source_inventory['code_cells']] == [n['text'] for n in reading_inventory['code_cells']],
        'headings':[(n['level'], n['text']) for n in source_inventory['headings']] == [(n['level'], n['text']) for n in reading_inventory['headings']],
        'parse_without_repair':not parser.errors and not check.errors,
        'supported_elements':not exceptions,
        'classified_embedded_source':not any(e['reason'] in ('unclassified_script_data', 'unclassified_conditional_comment') for e in excluded),
        'static_documentary_states':states['static_relationships_passed'],
    }
    content_ids = {n['node_id'] for n in nodes(content)}
    unresolved_images = [r for r in references if r['node_id'] in content_ids and
        (r['tag'] in ('img', 'image', 'source') or r['attribute'] in ('background', 'style')) and
        r.get('classification') not in ('internal', 'same_document') and
        not (r['original_href'].startswith('data:image/') and not r['original_href'].lower().startswith('data:image/svg'))]
    checks['image_reference_classification'] = not unresolved_images
    # Inline/background resource rewrites need an explicit adapter before those
    # visual representations may pass; retaining their bytes alone is not enough.
    checks['inline_visual_references_supported'] = not any(r['node_id'] in content_ids and
        r['attribute'] in ('background', 'style') for r in references)
    required = [r for r in references if r.get('classification') == 'internal' and r.get('kind') not in ('article', 'navigation')]
    missing = sorted({r['target_id'] for r in required if not resources.get(r['target_id'], {}).get('transport_metadata_verified')})
    checks['direct_assets_available'] = not missing
    checks['required_reference_scope'] = not any(r['classification'] in ('classification_required', 'out_of_scope_reference') and
        (r.get('kind') != 'article' and not (r['tag'] in ('a', 'area') and r['attribute'] == 'href')) for r in references)
    data = {'schema_version':SCHEMA, 'id':record['id'], 'module':'SDK', 'title':title,
        'source':{k:record.get(k) for k in ('source_url', 'final_url', 'sha256', 'byte_count', 'local_path', 'acquired_at')},
        'encoding':encoding, 'collector_version':VERSION, 'converter_version':CONVERTER,
        'titles':record.get('titles', []), 'breadcrumbs':record.get('breadcrumbs', []),
        'content_tree':content, 'content_text':text_of(content), 'search_text':search_text(content),
        'inventory':source_inventory, 'references':references, 'documentary_states':states,
        'excluded_shell_nodes':excluded, 'format_exceptions':exceptions,
        'verification':{'checks':checks, 'missing_direct_assets':missing, 'unresolved_image_references':unresolved_images,
            'parse_errors':parser.errors, 'content_checks_passed':all(checks.values()), 'reading_copy_verified':False,
            'pending':['CSS dependency closure', 'offline documentary state visibility', 'internal anchor/link audit']}}
    prefix = 'SDK/reading/'+record['id']
    csp = "default-src 'none'; img-src 'self' data:; style-src 'self' 'unsafe-inline'; font-src 'none'; media-src 'none'; object-src 'none'; frame-src 'none'; script-src 'none'; base-uri 'none'; form-action 'none'"
    styles = []
    for ref in references:
        if ref.get('kind') == 'stylesheet' and ref.get('target_id') and ref['attribute'] == 'href':
            style_path = store.root/'SDK/data/stylesheets'/(ref['target_id']+'.json')
            if style_path.is_file():
                style = json.loads(style_path.read_text(encoding='utf-8'))
                if style.get('direct_dependencies_captured') and not style.get('unsafe_css_detected'):
                    styles.append('<link rel="stylesheet" href="assets/'+ref['target_id']+'.css">')
    # Do not run responsive/mobile styles simultaneously with their desktop
    # counterpart. They remain archived dependencies. Reveal all source states
    # after the published desktop styles, including language-filtered panels.
    css = ('body{max-width:80rem;margin:2rem auto;padding:0 1rem;font:16px/1.5 system-ui}'
           'table{border-collapse:collapse}td,th{border:1px solid #aaa;padding:.4rem}'
           'img{max-width:100%;height:auto}pre{white-space:pre-wrap}'
           '.i-section-content,.i-dropdown-content,.i-popup-content,[class*="i-filtered-content-"],'
           '.hs-collapsed,.hs-expanded,[role="tabpanel"]{display:block!important;visibility:visible!important}'
           '.i-body-content,.i-header-content,.i-footer-content,.i-after-header-content{position:static!important;height:auto!important;overflow:visible!important}')
    document = '<!doctype html><html lang="en"><head><meta charset="utf-8"><meta http-equiv="Content-Security-Policy" content="'+csp+'"><title>'+html.escape(title)+'</title>'+''.join(styles)+'<style>'+css+'</style></head><body>'+markup+'</body></html>'
    atomic_bytes(store.root/(prefix+'.html'), document.encode('utf-8'))
    atomic_bytes(store.root/(prefix+'.md'), markup.encode('utf-8'))
    data['reading'] = {'html':prefix+'.html', 'markdown':prefix+'.md',
        'html_sha256':digest(document.encode('utf-8')), 'markdown_sha256':digest(markup.encode('utf-8')),
        'format':'HTML in Markdown preserves source ordering and technical structures; inert HTML companion expands all captured static states.'}
    relative = 'SDK/data/articles/'+record['id']+'.json'
    atomic_json(store.root/relative, data)
    record.update(app_data_path=relative, reading_paths=data['reading'], title=title, variants=source_inventory['variants'],
                  content_checks_passed=data['verification']['content_checks_passed'], reading_copy_verified=False,
                  article_local_complete=False, fidelity_hold='SDK_MODULE_VERIFICATION_REQUIRED')
    store.save_record(record)
    return {'id':record['id'], 'title':title, 'characters':source_inventory['text_characters'],
            'checks':checks, 'missing_assets':len(missing), 'state_issues':states['issues']}


if __name__ == '__main__':
    import os
    from pathlib import Path
    from collector import Store, writer_lock
    root = Path(__file__).resolve().parents[1]
    with writer_lock(root, Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime') as owner:
        store = Store(root, cache_records=True)
        from module_policy import require_sdk_ready
        require_sdk_ready(root)
        store.checkpoint(owner, phase='SDK_DERIVATIVES_IN_PROGRESS', worker_running=True)
        try:
            for record in store.records('SDK'):
                if record['type'] == 'article' and record['status'] == 'BODY_SAVED':
                    result = convert(store, record)
                    print(json.dumps({'id':result['id'], 'failed_checks':[k for k,v in result['checks'].items() if not v]}), flush=True)
        finally:
            store.checkpoint(owner, phase='SDK_FIDELITY_VERIFICATION_IN_PROGRESS', worker_running=False)
