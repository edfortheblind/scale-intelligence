"""Parse source-backed Innovasys SDK navigation; never evaluate published JavaScript."""
import argparse
from collections import Counter
import json
import os
from pathlib import Path
import re
from urllib.parse import urljoin, urlsplit

from article_data import TreeParser, nodes, text_of, decode_original, reference_candidates, classify_href
from collector import Store, ROOTS, ORIGIN, source_identity, digest, atomic_json, writer_lock, now
from static_data import LiteralParser

PARSER_VERSION = 'sdk-innovasys-navigation-3'
PUBLICATION = ORIGIN + ROOTS['SDK']
ENTRY = PUBLICATION + 'webframe.html'
# These identities come from the acquired entry and its published navigation frames.
PUBLISHED_ROLES = {'webframe.html':'shell', 'webnav.html':'navigation',
                   'webtoc.html':'toc', 'webindex.html':'index', 'websearch.html':'search'}
FRAME_ROLES = {'i-nav':'navigation', 'i-toc':'toc', 'i-index':'index', 'i-search':'search'}
DISCOVERY_MANIFESTS = ('toc', 'index', 'discovery-membership', 'navigation-partitions', 'navigation-references')
DISCOVERY_CODE = ('discover_sdk.py', 'collector.py', 'article_data.py', 'static_data.py',
                  'sdk_article_data.py', 'style_data.py')


def value_hash(value):
    return digest(json.dumps(value, sort_keys=True, separators=(',',':')).encode('utf-8'))


def discovery_inputs(store):
    """Hash actual source/artifact bytes and exact reference inventories; read-only.

    Mutable acquisition/audit timestamps and success flags are not proof inputs.
    The resource catalog is read afresh so a caller's cached Store cannot hide edits.
    """
    root = store.root.resolve()
    records = Store(root).records('SDK')
    issues, files, resource_generations, article_references = [], {}, [], []

    def bound_file(relative, required=True):
        if relative in files:
            return files[relative]
        path = (root / relative).resolve()
        if not path.is_relative_to(root):
            issues.append({'class':'DISCOVERY_INPUT_OUTSIDE_REPOSITORY', 'path':relative})
            result = {'path':relative, 'exists':False, 'sha256':None}
        elif not path.is_file():
            result = {'path':relative, 'exists':False, 'sha256':None}
            if required:
                issues.append({'class':'DISCOVERY_INPUT_MISSING', 'path':relative})
        else:
            raw = path.read_bytes()
            result = {'path':relative, 'exists':True, 'byte_count':len(raw), 'sha256':digest(raw)}
        files[relative] = result
        return result

    for name in DISCOVERY_MANIFESTS:
        bound_file('SDK/manifests/' + name + '.json')
    for folder in ('navigation','stylesheets'):
        for path in sorted((root / 'SDK/data' / folder).glob('*.json')):
            bound_file(path.relative_to(root).as_posix())
    for name in DISCOVERY_CODE:
        bound_file('tools/' + name, required=name not in ('sdk_article_data.py','style_data.py'))
    for record in records:
        fields = ('id','module','type','status','source_url','final_url','encoding','sha256','byte_count','local_path',
                  'navigation_role','occurrences','titles','breadcrumbs','discovery_sources','discovery_correction',
                  'classification_history','app_data_path')
        resource_generations.append({'id':record['id'], 'generation_sha256':value_hash({k:record.get(k) for k in fields})})
        if record['status'] == 'BODY_SAVED':
            if not record.get('local_path'):
                issues.append({'class':'SOURCE_BODY_PATH_MISSING', 'id':record['id']})
            else:
                source = bound_file(record['local_path'])
                if source.get('sha256') != record.get('sha256') or source.get('byte_count') != record.get('byte_count'):
                    issues.append({'class':'SOURCE_BODY_HASH_OR_LENGTH_MISMATCH', 'id':record['id']})
            if record['type'] == 'navigation':
                bound_file('SDK/data/navigation/' + record['id'] + '.json')
        if record['type'] == 'article' and record.get('app_data_path'):
            relative = record['app_data_path']
            path = (root / relative).resolve()
            if not path.is_relative_to(root) or not path.is_file():
                issues.append({'class':'ARTICLE_REFERENCE_INPUT_MISSING_OR_OUTSIDE_REPOSITORY', 'id':record['id']})
                article_references.append({'id':record['id'], 'path':relative, 'exists':False})
                continue
            try:
                data = json.loads(path.read_text(encoding='utf-8'))
                inventory = {'id':data.get('id'), 'source':data.get('source'), 'references':data['references']}
                article_references.append({'id':record['id'], 'path':relative, 'exists':True,
                                           'reference_inventory_sha256':value_hash(inventory)})
            except (ValueError, KeyError) as error:
                issues.append({'class':'ARTICLE_REFERENCE_INPUT_INVALID', 'id':record['id'], 'detail':str(error)})
    values = {'schema_version':1, 'parser_version':PARSER_VERSION,
              'scope':'Exact SDK navigation, TOC/index, memberships, references, parser code, and current original bytes.',
              'files':[files[k] for k in sorted(files)],
              'resource_generations':sorted(resource_generations,key=lambda x:x['id']),
              'article_reference_inventories':sorted(article_references,key=lambda x:x['id']),
              'integrity_issues':issues}
    return {**values, 'sha256':value_hash(values)}


def discovery_proof(store):
    """Validate a persisted proof against current bytes without reparsing or writing."""
    path = store.root / 'SDK/manifests/discovery-closure.json'
    if not path.is_file():
        return {'passed':False, 'current':False, 'error':'DISCOVERY_CLOSURE_PROOF_MISSING'}
    try:
        proof = json.loads(path.read_text(encoding='utf-8'))
        current_inputs = discovery_inputs(store)
        bound = proof.get('inputs', {})
        current = (proof.get('parser_version') == PARSER_VERSION and bound == current_inputs)
        passed = bool(current and not current_inputs['integrity_issues'] and proof.get('fixed_point')
                      and proof.get('discovery_reconciled') and not proof.get('issues'))
        return {'passed':passed, 'current':current,
                'publication_navigation_reconciled':bool(current and proof.get('publication_navigation_reconciled')),
                'error':None if current else 'DISCOVERY_CLOSURE_PROOF_STALE',
                'report_sha256':digest(path.read_bytes()), 'issues':proof.get('issues', []),
                'input_integrity_issues':current_inputs['integrity_issues']}
    except (OSError, ValueError, KeyError, TypeError) as error:
        return {'passed':False, 'current':False, 'error':'DISCOVERY_CLOSURE_PROOF_INVALID', 'detail':str(error)}


def parse_search_index(source):
    """Recognize the complete published assignment grammar, without JS evaluation."""
    parser = LiteralParser(source)
    for token in ('$', '(', 'function', '(', ')', '{', 'Innovasys', '.', 'Content', '.',
                  'Features', '.', 'buildSearchFilesAndKeywords', '=', 'function',
                  '(', 'f', ',', 's', ',', 'c', ')', '{'):
        parser.take(token)
    files, keywords = [], []
    file_ids, word_keys = set(), set()
    while True:
        parser.space()
        if parser.text[parser.pos:parser.pos+1] == '}':
            break
        start = parser.pos
        kind = parser.text[parser.pos:parser.pos+1]
        if kind not in ('f', 's'):
            raise ValueError('SDK_SEARCH_EXECUTABLE_OR_UNKNOWN_STATEMENT')
        parser.take(kind)
        parser.take('[')
        key = parser.value()
        if not isinstance(key, str):
            raise ValueError('SDK_SEARCH_STRING_KEY_REQUIRED')
        parser.take(']')
        parser.take('=')
        if kind == 'f':
            if not re.fullmatch(r'[1-9]\d*', key) or key in file_ids:
                raise ValueError('SDK_SEARCH_INVALID_OR_DUPLICATE_FILE_ID')
            parser.take('new')
            parser.take('c')
            parser.take('(')
            href = parser.value()
            parser.take(',')
            title = parser.value()
            parser.take(',')
            rank = parser.value()
            parser.take(')')
            if not isinstance(href, str) or not isinstance(title, str) or type(rank) is not int:
                raise ValueError('SDK_SEARCH_FILE_LITERAL_TYPES')
            parser.take(';')
            file_ids.add(key)
            files.append({'source_index':key, 'href':href, 'title':title, 'rank':rank,
                          'source_char_span':[start,parser.pos],
                          'literal_statement':parser.text[start:parser.pos]})
        else:
            value = parser.value()
            if not key.startswith('_') or key in word_keys or not isinstance(value, str):
                raise ValueError('SDK_SEARCH_INVALID_OR_DUPLICATE_WORD')
            end = parser.pos
            # The publication omits these semicolons and uses a line terminator (ASI).
            remainder = parser.text[parser.pos:]
            if remainder.startswith(';'):
                parser.pos += 1
                end = parser.pos
            elif not re.match(r'[ \t]*(?:\r|\n|})', remainder):
                raise ValueError('SDK_SEARCH_MISSING_STATEMENT_SEPARATOR')
            postings = []
            if value:
                for item in value.split(','):
                    match = re.fullmatch(r'([1-9]\d*):(\d+(?:\|\d+)*)', item)
                    if not match:
                        raise ValueError('SDK_SEARCH_UNSUPPORTED_POSITION_DATA')
                    postings.append({'source_index':match[1],
                                     'positions':[int(p) for p in match[2].split('|')],
                                     'literal':item})
            word_keys.add(key)
            keywords.append({'source_key':key, 'word':key[1:], 'posting_literal':value,
                             'postings':postings, 'source_char_span':[start,end],
                             'literal_statement':parser.text[start:end]})
    parser.take('}')
    parser.space()
    if parser.text[parser.pos:parser.pos+1] == ';':
        parser.pos += 1
    for token in ('}', ')', ';'):
        parser.take(token)
    parser.space()
    if parser.pos != len(parser.text):
        raise ValueError('SDK_SEARCH_TRAILING_EXECUTABLE_OR_UNKNOWN_SYNTAX')
    missing = sorted({p['source_index'] for word in keywords for p in word['postings']} - file_ids)
    issues = [{'class':'SEARCH_POSTING_UNKNOWN_FILE_ID', 'source_index':key} for key in missing]
    return {'files':files, 'keywords':keywords, 'validation_issues':issues,
            'source_char_span_convention':'Unicode codepoints after removing any leading U+FEFF; exact literal statements retained.',
            'counts':{'file_assignments':len(files), 'keyword_assignments':len(keywords),
                      'posting_entries':sum(len(word['postings']) for word in keywords),
                      'positions':sum(len(p['positions']) for word in keywords for p in word['postings'])}}


def search_runtime_evidence(store, records):
    """Bind the interpreted fields to exact fragments of the archived consumer script."""
    runtime = next((r for r in records if r['source_url'] == PUBLICATION + 'template/packages/core-web/script/navigation.min.js' and r.get('status') == 'BODY_SAVED'), None)
    if not runtime:
        return {'verified':False, 'issues':['SEARCH_RUNTIME_NOT_CAPTURED']}
    body = (store.root / runtime['local_path']).read_bytes()
    if digest(body) != runtime['sha256']:
        return {'verified':False, 'issues':['SEARCH_RUNTIME_HASH_MISMATCH']}
    source,_ = decode_original(runtime, body)
    patterns = {
        'constructor_url_title_rank':'SearchFile=function(){function e(e,t,n){this.url=e,this.title=t,this.rank=n}',
        'data_builder_callback':'Innovasys.Content.Features.buildSearchFilesAndKeywords(u,d,SearchFile)',
        'keyword_prefix_and_posting_separator':'v=t["_"+s.matchedWords[g]],m=v.split(",")',
        'file_id_and_positions':'w=parseInt(m[y].split(":")[0]);var S=m[y].split(":")[1];_=$.map(S.split("|"),function(e,t){return parseInt(e)})'
    }
    evidence = []
    missing = []
    for meaning,literal in patterns.items():
        position = source.find(literal)
        if position < 0:
            missing.append(meaning)
        else:
            evidence.append({'meaning':meaning, 'source_char_span':[position,position+len(literal)], 'literal':literal})
    return {'verified':not missing, 'source_id':runtime['id'], 'source_sha256':runtime['sha256'],
            'method':'static inspection of exact consumer statements; no execution',
            'statements':evidence, 'issues':['SEARCH_RUNTIME_SEMANTICS_NOT_RECOGNIZED:'+m for m in missing]}


def search_mode_flags(parser):
    flags = {}
    for node in nodes(parser.root):
        if node['tag'] != 'script' or node['attrs'].get('src'):
            continue
        source = text_of(node)
        match = re.search(r'\bInnovasys\.overrides\s*=\s*', source)
        if match:
            literal = LiteralParser(source[match.end():])
            value = literal.value()
            if not isinstance(value, dict):
                raise ValueError('SDK_SEARCH_MODE_OBJECT_REQUIRED')
            for key in ('isFullTextSearchPositionDataAvailable','isFullTextSearchObjects'):
                if key in value:
                    flags[key] = value[key]
    return flags


class NavigationParser(TreeParser):
    """Honor HTML's optional LI end tags without repairing arbitrary malformed markup."""
    def __init__(self):
        super().__init__()
        self.optional_end_tags = []

    def close_list_item(self, reason):
        for index in range(len(self.stack)-1, 0, -1):
            tag = self.stack[index]['tag']
            if tag in ('ul', 'ol'):
                return
            if tag == 'li':
                if index != len(self.stack)-1:
                    return  # An unclosed non-optional child must remain a parse error.
                node = self.stack[index]
                self.optional_end_tags.append({'node_id':node['node_id'], 'tag':'li', 'reason':reason})
                self.stack = self.stack[:index]
                return

    def handle_starttag(self, tag, attrs):
        if tag == 'li':
            self.close_list_item('following_li_start_tag')
        super().handle_starttag(tag, attrs)

    def handle_endtag(self, tag):
        if tag in ('ul', 'ol'):
            self.close_list_item('parent_list_end_tag')
        super().handle_endtag(tag)


def parse_navigation(record, body):
    if digest(body) != record['sha256']:
        raise ValueError('SOURCE_HASH_MISMATCH')
    source, encoding = decode_original(record, body)
    parser = NavigationParser()
    parser.feed(source)
    parser.close()
    return parser, encoding


def role_of(record):
    relative = urlsplit(record['source_url']).path.removeprefix(ROOTS['SDK'])
    return record.get('navigation_role') or PUBLISHED_ROLES.get(relative, 'unknown')


def list_children(node, tags):
    return [c for c in node['children'] if isinstance(c, dict) and c['tag'] in tags]


def toc_tree(parser, source_id):
    roots = [n for n in nodes(parser.root) if n['tag'] in ('ul','ol') and n['attrs'].get('id') == 'i-root']
    if len(roots) != 1:
        raise ValueError('SDK_TOC_ROOT_REQUIRED')
    visited = []

    def walk_list(container, ancestors, position):
        result = []
        for order, li in enumerate(list_children(container, {'li'})):
            anchors = list_children(li, {'a'})
            if len(anchors) != 1:
                raise ValueError('SDK_TOC_ENTRY_REQUIRES_ONE_DIRECT_ANCHOR')
            anchor = anchors[0]
            href = anchor['attrs'].get('href')
            title = text_of(anchor)
            path = position + [order]
            entry = {'id':'sdk-toc-' + source_id[:12] + '-' + li['node_id'],
                     'title':title, 'href':href, 'bookmark':urlsplit(href or '').fragment,
                     'source_node_id':li['node_id'], 'anchor_node_id':anchor['node_id'],
                     'order':order, 'order_path':path, 'breadcrumbs':ancestors + [title],
                     'source_flags':{'li':dict(li['attrs']), 'a':dict(anchor['attrs'])},
                     'container_only':href in (None, '', '#'), 'children':[]}
            visited.append(li['node_id'])
            for child in list_children(li, {'ul','ol'}):
                entry['children'].extend(walk_list(child, entry['breadcrumbs'], path))
            result.append(entry)
        return result

    tree = walk_list(roots[0], [], [])
    expected = [n['node_id'] for n in nodes(roots[0]) if n['tag'] == 'li']
    if visited != expected or len(set(visited)) != len(visited):
        raise ValueError('SDK_TOC_UNVISITED_OR_REPEATED_ENTRY')
    return tree, len(visited)


def index_tree(parser, source_id):
    roots = [n for n in nodes(parser.root) if n['attrs'].get('id') == 'i-index-body']
    if len(roots) != 1:
        raise ValueError('SDK_INDEX_ROOT_REQUIRED')
    visited = []

    def walk(container, ancestors, position):
        result = []
        previous = None
        for child in container['children']:
            if isinstance(child, str):
                if child.strip():
                    raise ValueError('SDK_INDEX_UNCLASSIFIED_TEXT')
                continue
            if child['tag'] == 'a':
                title = text_of(child)
                path = position + [len(result)]
                previous = {'id':'sdk-index-' + source_id[:12] + '-' + child['node_id'],
                            'title':title, 'href':child['attrs'].get('href'),
                            'source_node_id':child['node_id'], 'order':len(result),
                            'order_path':path, 'breadcrumbs':ancestors + [title],
                            'source_flags':dict(child['attrs']), 'children':[]}
                result.append(previous)
                visited.append(child['node_id'])
            elif child['tag'] == 'blockquote':
                if previous is None:
                    raise ValueError('SDK_INDEX_ORPHAN_SUBENTRIES')
                previous['children'].extend(walk(child, previous['breadcrumbs'], previous['order_path']))
            elif child['tag'] != 'br':
                raise ValueError('SDK_INDEX_UNSUPPORTED_ELEMENT:' + child['tag'])
        return result

    tree = walk(roots[0], [], [])
    if visited != [n['node_id'] for n in nodes(roots[0]) if n['tag'] == 'a']:
        raise ValueError('SDK_INDEX_UNVISITED_ENTRY')
    return tree, len(visited)


def default_topics(parser):
    """Only accept the observed complete single string assignment, not executable expressions."""
    for node in nodes(parser.root):
        if node['tag'] != 'script' or node['attrs'].get('src'):
            continue
        source = text_of(node).strip()
        if not re.match(r'(?:var\s+)?defaultTopic\s*=', source):
            continue
        parser_literal = LiteralParser(source)
        if source.startswith('var'):
            parser_literal.take('var')
        parser_literal.take('defaultTopic')
        parser_literal.take('=')
        href = parser_literal.value()
        parser_literal.space()
        if parser_literal.text[parser_literal.pos:parser_literal.pos+1] == ';':
            parser_literal.pos += 1
        parser_literal.space()
        if not isinstance(href, str) or parser_literal.pos != len(parser_literal.text):
            raise ValueError('SDK_DEFAULT_TOPIC_UNSUPPORTED_EXPRESSION')
        yield node, 'inline_defaultTopic', href


def candidates(parser, role):
    yield from reference_candidates(parser.root)
    for node in nodes(parser.root):
        for attribute in ('data-responsive-tablet','data-responsive-mobile'):
            value = node['attrs'].get(attribute)
            if value:
                for href in value.split(','):
                    if href.strip():
                        yield node, attribute, href.strip()
        if node['tag'] == 'script' and node['attrs'].get('type') in ('i-url-container/script','i-url-container/css'):
            href = text_of(node).strip()
            if href:
                yield node, 'url_container_text', href
    if role == 'shell':
        yield from default_topics(parser)


def reference_kind(node, attribute, href, base, role):
    resolved = urljoin(base, href)
    relative = urlsplit(resolved).path.removeprefix(ROOTS['SDK'])
    if relative in PUBLISHED_ROLES:
        return 'navigation', PUBLISHED_ROLES[relative]
    if node['tag'] in ('frame','iframe') and attribute == 'src':
        frame_name = node['attrs'].get('id') or node['attrs'].get('name')
        if frame_name == 'i-content':
            return 'article', None
        return 'navigation', FRAME_ROLES.get(frame_name, 'unknown_frame')
    if role == 'search' and node['tag'] == 'script' and attribute == 'src' and relative == 'ftsindex.js':
        return 'navigation', 'search_index'
    if attribute == 'inline_defaultTopic':
        return 'article', None
    if attribute in ('data-responsive-tablet','data-responsive-mobile'):
        return 'stylesheet', None
    if attribute == 'url_container_text':
        return ('stylesheet' if node['attrs']['type'].endswith('/css') else 'script'), None
    return classify_href(resolved, node['tag'], attribute), None


def add_reference(store, source, node, attribute, href, base, role):
    item = {'source_id':source['id'], 'source_sha256':source['sha256'],
            'node_id':node['node_id'], 'tag':node['tag'], 'attribute':attribute,
            'original_href':href, 'effective_base':base, 'source_flags':dict(node['attrs'])}
    if href in ('', '#'):
        return {**item, 'classification':'container', 'target_id':None, 'fragment':''}
    if href.startswith(('javascript:','data:','mailto:','tel:')):
        return {**item, 'classification':'inert_or_embedded_reference', 'target_id':None}
    kind, navigation_role = reference_kind(node, attribute, href, base, role)
    item['kind'] = kind
    try:
        identity = source_identity(href, base)
    except ValueError as error:
        item.update(classification='out_of_scope_reference', target_id=None, reason=str(error))
        if 'SENSITIVE' in str(error):
            item['original_href'] = '[redacted sensitive URL]'
        else:
            item['resolved_url'] = urljoin(base, href)
        return item
    item.update(resolved_url=identity['url'], target_id=identity['id'], fragment=identity['fragment'])
    if identity['module'] != 'SDK':
        item['classification'] = 'deferred_cross_module'
    elif identity['fetch_key'] == source['source_url'] and identity['fragment']:
        item['classification'] = 'same_document'
    elif kind == 'unclassified':
        item['classification'] = 'classification_required'
    else:
        target = store.discover('SDK', href, base, source['id'] + '@' + source['sha256'] + ':' + node['node_id'] + ':' + attribute, kind)
        # A frame/shell declaration is stronger evidence than a generic HTML suffix.
        if kind == 'navigation' and target['type'] != 'navigation':
            target.setdefault('classification_history', []).append({'type':target['type'], 'reason':'published_navigation_frame_or_data', 'source_id':source['id']})
            target['type'] = 'navigation'
        if navigation_role:
            old_role = target.get('navigation_role')
            if old_role and old_role != navigation_role:
                raise ValueError('SDK_CONFLICTING_NAVIGATION_ROLE')
            target['navigation_role'] = navigation_role
        store.save_record(target)
        item.update(classification='internal', target_type=target['type'], navigation_role=navigation_role)
    return item


def register_tree(store, source, roots, family, refs):
    by_node = {(r['node_id'], r['original_href']):r for r in refs if r['attribute'] == 'href'}
    membership = set()
    def walk(items):
        for entry in items:
            node = entry.get('anchor_node_id', entry['source_node_id'])
            ref = by_node.get((node, entry.get('href')))
            entry['resource_id'] = ref.get('target_id') if ref else None
            if ref and ref['classification'] == 'internal':
                resource = next(r for r in store.records('SDK') if r['id'] == ref['target_id'])
                occurrence = {'family':family, 'source_entry':entry['id'], 'source_id':source['id'],
                              'source_sha256':source['sha256'], 'original_href':entry['href'],
                              'resolved_url':ref['resolved_url'], 'fragment':ref.get('fragment',''),
                              'order_path':entry['order_path'], 'breadcrumbs':entry['breadcrumbs'],
                              'source_flags':entry['source_flags']}
                if occurrence not in resource['occurrences']:
                    resource['occurrences'].append(occurrence)
                if entry['title'] not in resource['titles']:
                    resource['titles'].append(entry['title'])
                if entry['breadcrumbs'] not in resource['breadcrumbs']:
                    resource['breadcrumbs'].append(entry['breadcrumbs'])
                store.save_record(resource)
                membership.add(resource['id'])
            walk(entry['children'])
    walk(roots)
    return membership


def register_search(store, record, parsed):
    refs, membership = [], set()
    for entry in parsed['files']:
        node = {'node_id':'search-file-' + entry['source_index'], 'tag':'#search-file',
                'attrs':{'source_index':entry['source_index'], 'rank':entry['rank']}, 'children':[]}
        ref = add_reference(store, record, node, 'search_file_url', entry['href'], record['source_url'], 'search_index')
        refs.append(ref)
        entry['resource_id'] = ref.get('target_id')
        if ref['classification'] == 'internal':
            target = next(r for r in store.records('SDK') if r['id'] == ref['target_id'])
            occurrence = {'family':'search', 'source_id':record['id'], 'source_sha256':record['sha256'],
                          'source_entry':entry['source_index'], 'original_href':entry['href'],
                          'resolved_url':ref['resolved_url'], 'fragment':ref.get('fragment',''),
                          'title':entry['title'], 'rank':entry['rank'],
                          'source_char_span':entry['source_char_span']}
            if occurrence not in target['occurrences']:
                target['occurrences'].append(occurrence)
            if entry['title'] not in target['titles']:
                target['titles'].append(entry['title'])
            store.save_record(target)
            membership.add(target['id'])
    return refs, membership


def discovery_closure(store, records, partitions, refs, membership, search, mode_flags,
                      runtime, errors, fixed_point):
    issues = list(errors)
    parsed_roles = {p['role'] for p in partitions if p['status'] == 'PARSED'}
    for role in set(PUBLISHED_ROLES.values()) | {'search_index'}:
        if role not in parsed_roles:
            issues.append({'class':'MISSING_PARSED_NAVIGATION_ROLE', 'role':role})
    if search is None:
        issues.append({'class':'SEARCH_DATA_NOT_PARSED'})
    else:
        issues.extend(search['validation_issues'])
        if not search['files']:
            issues.append({'class':'SEARCH_HAS_NO_PUBLISHED_TOPICS'})
    if any(mode_flags.get(k) is not True for k in ('isFullTextSearchPositionDataAvailable','isFullTextSearchObjects')):
        issues.append({'class':'SEARCH_PUBLISHED_MODE_FLAGS_UNVERIFIED'})
    if not runtime['verified']:
        issues.append({'class':'SEARCH_RUNTIME_UNVERIFIED', 'detail':runtime['issues']})
    family_comparison = {name:sorted(ids-membership['search']) for name,ids in membership.items() if name != 'search'}
    for family,missing in family_comparison.items():
        if missing:
            issues.append({'class':'NAVIGATION_DESTINATIONS_ABSENT_FROM_SEARCH', 'family':family, 'resource_ids':missing})
    publication_reconciled = not issues
    catalog = {r['id']:r for r in records}
    for record in records:
        if record['status'] == 'INVALID_RESOLUTION':
            continue
        if record['status'] != 'BODY_SAVED':
            issues.append({'class':'RESOURCE_NOT_CAPTURED', 'id':record['id'], 'type':record['type'], 'status':record['status']})
        if record['type'] != 'article' or record['status'] != 'BODY_SAVED':
            continue
        path = store.root / record.get('app_data_path', 'missing')
        if not path.is_file():
            issues.append({'class':'ARTICLE_REFERENCES_NOT_PARSED', 'id':record['id']})
            continue
        try:
            data = json.loads(path.read_text(encoding='utf-8'))
            if data['source']['sha256'] != record['sha256']:
                raise ValueError('SOURCE_GENERATION_MISMATCH')
            for ref in data['references']:
                if ref['classification'] == 'internal':
                    target = catalog.get(ref.get('target_id'))
                    if not target or target['status'] != 'BODY_SAVED':
                        issues.append({'class':'ARTICLE_REFERENCE_NOT_CAPTURED', 'id':record['id'], 'target_id':ref.get('target_id')})
                elif ref['classification'] == 'classification_required':
                    issues.append({'class':'UNCLASSIFIED_ARTICLE_REFERENCE', 'id':record['id'], 'node_id':ref['node_id']})
        except (ValueError, KeyError, OSError) as error:
            issues.append({'class':'ARTICLE_REFERENCE_DATA_INVALID', 'id':record['id'], 'detail':str(error)})
    for ref in refs:
        if ref['classification'] == 'classification_required':
            issues.append({'class':'UNCLASSIFIED_NAVIGATION_REFERENCE', 'id':ref['source_id'], 'node_id':ref['node_id']})
    if not fixed_point:
        issues.append({'class':'RESOURCE_GRAPH_NOT_AT_FIXED_POINT'})
    signature = [{'id':r['id'], 'sha256':r.get('sha256'), 'status':r['status'], 'type':r['type']} for r in sorted(records,key=lambda r:r['id'])]
    return {'schema_version':1, 'module':'SDK', 'parser_version':PARSER_VERSION,
            'publication_navigation_reconciled':publication_reconciled,
            'discovery_reconciled':not issues, 'fixed_point':fixed_point,
            'catalog_sha256':digest(json.dumps(signature,sort_keys=True,separators=(',',':')).encode()),
            'family_destinations_absent_from_search':family_comparison,
            'search_runtime_evidence':runtime, 'search_mode_flags':mode_flags,
            'issues':issues,
            'limits':'Discovery reconciliation does not establish article fidelity, documentary states, image/CSS closure, or delivery completion.'}


def reconcile(store):
    initial = store.records('SDK')
    initial_ids = {r['id'] for r in initial}
    errors, partitions, references = [], [], []
    membership = {'toc':set(), 'index':set(), 'default_topic':set(), 'search':set()}
    toc = index = search = None
    mode_flags = {}
    runtime = search_runtime_evidence(store, initial)
    for record in initial:
        if record['type'] != 'navigation' or record.get('status') != 'BODY_SAVED':
            continue
        role = role_of(record)
        if role in ('unknown','unknown_frame') and not record['source_url'].endswith('/ftsindex.js'):
            errors.append({'id':record['id'], 'class':'UNKNOWN_NAVIGATION_ROLE', 'role':role})
        if Path(urlsplit(record['source_url']).path).suffix.lower() not in ('.html','.htm'):
            if role == 'search_index' or record['source_url'] == PUBLICATION + 'ftsindex.js':
                try:
                    body = (store.root / record['local_path']).read_bytes()
                    if digest(body) != record['sha256']:
                        raise ValueError('SOURCE_HASH_MISMATCH')
                    source,encoding = decode_original(record, body)
                    search = parse_search_index(source)
                    refs, membership['search'] = register_search(store, record, search)
                    references.extend(refs)
                    search_data = {'schema_version':1, 'parser_version':PARSER_VERSION,
                                   'source_id':record['id'], 'source_sha256':record['sha256'],
                                   'role':'search_index', 'encoding':encoding, 'data':search,
                                   'runtime_evidence':runtime, 'references':refs}
                    atomic_json(store.root / 'SDK/data/navigation' / (record['id'] + '.json'), search_data)
                    partitions.append({'id':record['id'], 'source_sha256':record['sha256'], 'role':'search_index',
                                       'status':'PARSED', 'counts':search['counts']})
                except (ValueError, UnicodeError, OSError) as error:
                    errors.append({'id':record['id'], 'class':'SDK_STATIC_SEARCH_PARSE', 'detail':str(error)})
            else:
                partitions.append({'id':record['id'], 'source_sha256':record['sha256'], 'role':role,
                                   'status':'STATIC_SCHEMA_REVIEW_REQUIRED'})
                errors.append({'id':record['id'], 'class':'UNKNOWN_NAVIGATION_DATA_SCHEMA'})
            continue
        try:
            parser, encoding = parse_navigation(record, (store.root / record['local_path']).read_bytes())
            if parser.errors:
                raise ValueError('SDK_NAVIGATION_PARSE_ERRORS:' + json.dumps(parser.errors))
            bases = [n['attrs']['href'] for n in nodes(parser.root) if n['tag'] == 'base' and n['attrs'].get('href')]
            base = urljoin(record.get('final_url') or record['source_url'], bases[0]) if bases else record.get('final_url') or record['source_url']
            refs = [add_reference(store, record, n, a, h, base, role) for n,a,h in candidates(parser, role)]
            references.extend(refs)
            if role == 'search':
                mode_flags = search_mode_flags(parser)
            data = {'schema_version':1, 'parser_version':PARSER_VERSION, 'source_id':record['id'],
                    'source_sha256':record['sha256'], 'role':role, 'encoding':encoding,
                    'source_tree':parser.root, 'references':refs, 'parse_errors':parser.errors,
                    'optional_html_end_tags':parser.optional_end_tags}
            atomic_json(store.root / 'SDK/data/navigation' / (record['id'] + '.json'), data)
            partitions.append({'id':record['id'], 'source_sha256':record['sha256'], 'role':role, 'status':'PARSED'})
            if role in ('toc','index'):
                roots, count = (toc_tree if role == 'toc' else index_tree)(parser, record['id'])
                membership[role] |= register_tree(store, record, roots, role, refs)
                manifest = {'schema_version':1, 'module':'SDK', 'parser_version':PARSER_VERSION,
                            'status':role.upper() + '_PARSED', 'source':{'id':record['id'],'sha256':record['sha256']},
                            'node_count':count, 'root_count':len(roots), 'nodes':roots,
                            'discovery_complete':False, 'reason':'Search data and article/resource closure remain separate gates.'}
                atomic_json(store.root / ('SDK/manifests/' + role + '.json'), manifest)
                if role == 'toc':toc = manifest
                else:index = manifest
            for ref in refs:
                if ref['attribute'] == 'inline_defaultTopic' and ref['classification'] == 'internal':
                    membership['default_topic'].add(ref['target_id'])
        except (ValueError, UnicodeError, OSError) as error:
            errors.append({'id':record['id'], 'class':'SDK_STATIC_NAVIGATION_PARSE', 'detail':str(error)})
    current = store.records('SDK')
    atomic_json(store.root / 'SDK/manifests/navigation-references.json', references)
    atomic_json(store.root / 'SDK/manifests/navigation-partitions.json', partitions)
    atomic_json(store.root / 'SDK/manifests/discovery-membership.json', {k:sorted(v) for k,v in membership.items()})
    fixed_point = initial_ids == {r['id'] for r in current}
    proof = discovery_closure(store,current,partitions,references,membership,search,mode_flags,runtime,errors,fixed_point)
    input_issues = discovery_inputs(store)['integrity_issues']
    proof['issues'].extend(input_issues)
    proof['discovery_reconciled'] = bool(proof['discovery_reconciled'] and not input_issues)
    for manifest,name in ((toc,'toc'),(index,'index')):
        if manifest:
            manifest['discovery_complete'] = proof['discovery_reconciled']
            manifest['reason'] = 'Source-bound navigation and reference closure; see manifests/discovery-closure.json.'
            atomic_json(store.root / ('SDK/manifests/' + name + '.json'), manifest)
    # Bind the final tree manifests, after writing their completion fields.
    # The proof and report are excluded from their own inputs.
    proof['inputs'] = discovery_inputs(store)
    atomic_json(store.root / 'SDK/manifests/discovery-closure.json', proof)
    report = {'checked_at':now(), 'module':'SDK', 'parser_version':PARSER_VERSION,
              'status':'DISCOVERY_RECONCILED' if proof['discovery_reconciled'] else 'DISCOVERY_INCOMPLETE',
              'discovery_reconciled':proof['discovery_reconciled'],
              'publication_navigation_reconciled':proof['publication_navigation_reconciled'],
              'toc_nodes':toc['node_count'] if toc else None, 'roots':toc['root_count'] if toc else None,
              'index_occurrences':index['node_count'] if index else None,
              'membership_counts':{k:len(v) for k,v in membership.items()},
              'parse_errors':errors, 'navigation_parsed':sum(p['status']=='PARSED' for p in partitions),
              'new_resources':len({r['id'] for r in current} - initial_ids),
              'fixed_point':fixed_point,
              'known_navigation_pending':[r['id'] for r in current if r['type']=='navigation' and r['status']!='BODY_SAVED'],
              'search_reconciliation':{'status':'PARSED_AND_RUNTIME_VERIFIED' if search and not search['validation_issues'] and runtime['verified'] else 'INCOMPLETE',
                                      'counts':search['counts'] if search else None,
                                      'runtime_evidence':runtime, 'published_mode_flags':mode_flags},
              'catalog_sha256':proof['catalog_sha256'], 'issues':proof['issues'],
              'closure_report':'SDK/manifests/discovery-closure.json'}
    atomic_json(store.root / 'SDK/reports/discovery.json', report)
    return report


def report_summary(report):
    return {**{key:report[key] for key in ('module', 'status', 'discovery_reconciled',
              'publication_navigation_reconciled', 'navigation_parsed', 'toc_nodes',
              'roots', 'index_occurrences', 'membership_counts', 'new_resources', 'fixed_point')},
            'issue_count':len(report['issues'])}


if __name__ == '__main__':
    cli = argparse.ArgumentParser(description=__doc__)
    cli.add_argument('--root', type=Path, default=Path(__file__).resolve().parents[1])
    args = cli.parse_args()
    runtime = Path(os.environ['LOCALAPPDATA']) / 'TAB/SCALE-Intelligence/runtime'
    with writer_lock(args.root, runtime) as owner:
        store = Store(args.root, cache_records=True)
        store.checkpoint(owner, phase='SDK_DISCOVERY_IN_PROGRESS', worker_running=True)
        try:
            print(json.dumps(report_summary(reconcile(store))), flush=True)
        finally:
            store.checkpoint(owner, phase='SDK_DISCOVERY_INCOMPLETE', worker_running=False)
