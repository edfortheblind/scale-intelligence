"""Allowlisted, fingerprinted procedure guides; separate from curated retrieval."""
from collections import Counter
from contextlib import closing
import hashlib
import json
from pathlib import Path
import posixpath
import re
import sqlite3
from urllib.parse import unquote, urlsplit

ROOT = Path(__file__).resolve().parents[1]
MANIFEST = 'help_app/guide-manifest.json'
GUIDES = {
    'mobile': 'SDD/RF/README.md',
    'cross-application': 'SDD/RF/CROSS_APPLICATION.md',
    'mobile-work': 'SDD/RF/WAREHOUSE_MOBILE_WORK_FLOWS.md',
    'mobile-inventory': 'SDD/RF/WAREHOUSE_MOBILE_INVENTORY_RECEIVING_FLOWS.md',
    'mobile-shipping': 'SDD/RF/WAREHOUSE_MOBILE_SHIPPING_SUPPORT_FLOWS.md',
    'mobile-catalog': 'SDD/RF/WAREHOUSE_MOBILE_SOURCE_CATALOG.md',
    'scale-reference': 'SDD/SCALE_FUNCTIONAL_REFERENCE.md',
    'tab-design': 'SDD/TAB_DESIGN_REFERENCE.md',
}
EVIDENCE = {
    'mobile-navigation': 'SDD/RF/warehouse-mobile-live-navigation.json',
    'mobile-catalog': 'SDD/RF/warehouse-mobile-source-catalog.json',
    'scale-reference': 'SDD/derived/scale-functional-reference.json',
    'tab-sources': 'SDD/tab-core-sources.json',
    'tab-reconciliation': 'SDD/tab-core/reconciliation.json',
    'tab-coverage': 'SDD/tab-core/text-review-coverage.json',
    'tab-visual': 'SDD/tab-core/visual-review.json',
    'tab-po-direction': 'Snapdragon/evidence/selected-context-production-20261008.json',
}
TAB_SOURCES = {
    'sdd-716ca4b42b3f00bd': ('TAB-CORE-TRAVIS', 'SDD/Travis Full Solution Design Document (SDD) v1.0.docx'),
    'sdd-a3f0962080bdc590': ('TAB-CORE-TRAV3PL', 'SDD/derived/TRAV3PL - Travis Austin 3PL Enablement Design Document v1.0.pdf'),
}
TAB_SCOPE = ('Dated TAB design: 2022 Travis base plus the explicitly scoped 2025 TRAV3PL addendum. '
             'Documentary design only; current configuration and warehouse execution are not verified. '
             'Read the cross-source reconciliation and each claim\'s qualifications before operational use.')
TAB_HELP_SCOPE = ('TAB design and reconciled answers from the dated 2022 base and 2025 addendum. '
                  'The purchase-order answer also includes a separately identified owner clarification dated October 8, 2026. '
                  'Current configuration and warehouse execution are not verified.')
TAB_OWNER_SCOPE = ('Dated owner operational direction plus documentary design context. '
                   'The owner statement is separate from the SDD evidence; current configuration and warehouse execution are not verified.')
TAB_RECONCILIATION_STATES = {
    'DOCUMENTARY_INTERPRETATION': 'Documentary interpretation',
    'OWNER_OPERATIONAL_DIRECTION_PLUS_DOCUMENTARY_CONTEXT': 'Owner operational direction with documentary context',
    'UNRESOLVED_SOURCE_DETAIL': 'Unresolved source detail',
    'UNVERIFIED_MAPPING': 'Unverified mapping',
    'UNRESOLVED_DESIGN_ITEMS': 'Unresolved design items',
    'QUALIFIED_SOURCE_AUTHORITY': 'Qualified source authority',
    'SCOPE_BOUNDARY': 'Scope boundary',
}
GUIDE_SCOPE = ('Procedures describe retained documentation. Recorded menu observations are identified '
               'separately; they do not prove installed configuration or successful warehouse execution.')
PROCEDURE_DETAIL_LABELS = {
    'DEDICATED_PROCEDURE': 'Dedicated primary procedure',
    'SHARED_CONFIRMATION_FLOW': 'Shared confirmation flow',
    'SHARED_INITIATION_FLOW': 'Shared initiation flow',
    'POSITIVE_ADJUSTMENT_SEQUENCE_ONLY': 'Positive steps only; negative sequence incomplete',
    'AMBIGUOUS_SRC_LABEL': 'Context unresolved',
    'LIMITED_NARRATIVE_INCOMPLETE_SEQUENCE': 'Limited narrative; complete sequence missing',
    'NO_DISTINCT_STEP_SEQUENCE_RETAINED': 'No distinct steps retained',
}


def fingerprint(raw):
    return hashlib.sha256(raw).hexdigest()


def active_bytes(root, relative):
    root = Path(root).resolve()
    path = (root/relative).resolve()
    if not path.is_relative_to(root) or any(part.casefold() in {'archive', 'archiving', '_archive', '.aekr'} for part in path.relative_to(root).parts):
        raise ValueError('Guide input is outside the active library.')
    return path.read_bytes()


def tab_sources(root, registry, bindings=None):
    """Bind only the two reviewed TAB packets to their exact registered originals."""
    rows = registry['sources']
    registered = {row['id']: row for row in rows}
    if len(rows) != len(TAB_SOURCES) or set(registered) != {value[0] for value in TAB_SOURCES.values()}:
        raise ValueError('TAB source register differs from its allowlist.')
    if bindings is not None and set(bindings) != set(TAB_SOURCES):
        raise ValueError('TAB source manifest differs from its allowlist.')
    result, documents = {}, {}
    for identity, (source_id, original_path) in TAB_SOURCES.items():
        row = registered[source_id]
        if row['path'] != original_path:
            raise ValueError('TAB source path differs from its allowlist.')
        original = active_bytes(root, original_path)
        if len(original) != row['bytes'] or fingerprint(original) != row['sha256']:
            raise ValueError('TAB original fingerprint changed: '+original_path)
        document_path = 'SDD/tab-core/documents/'+identity+'.json'
        raw = active_bytes(root, document_path)
        binding = {'document_path': document_path, 'document_sha256': fingerprint(raw),
                   'source_path': original_path, 'source_sha256': row['sha256']}
        if bindings is not None and bindings[identity] != binding:
            raise ValueError('TAB document/source binding changed: '+identity)
        document = json.loads(raw)
        if (document['document_id'] != identity or document['core_source_id'] != source_id
                or document['source_path'] != original_path or document['source_sha256'] != row['sha256']):
            raise ValueError('TAB document identity differs from its registered source.')
        nodes = document['nodes']
        if (len({node['id'] for node in nodes}) != len(nodes)
                or any(not re.fullmatch(r'[A-Za-z0-9_-]+', node['id']) for node in nodes)):
            raise ValueError('TAB source node identities are invalid or duplicated.')
        result[identity] = binding
        documents['tab/'+identity] = {**document, 'title': row['title'], 'qualification': row['qualification']}
    return result, documents


def local_target(path, destination):
    target = urlsplit(destination.strip('<>'))
    if target.scheme or target.netloc or target.query:
        return None
    relative = posixpath.normpath(posixpath.join(posixpath.dirname(path), unquote(target.path))) if target.path else path
    return relative, unquote(target.fragment)


def markdown_links(text):
    yield from re.findall(r'\[[^\]\n]+\]\(([^)\n]+)\)', text)
    yield from re.findall(r'^\[[^\]\n]+\]:\s*(\S+)\s*$', text, re.M)


def make_manifest(root=ROOT):
    """Explicit authoring command; never silently accepts changed inputs at startup."""
    root = Path(root)
    documents, sources = {}, {}
    for key, path in GUIDES.items():
        raw = (root/path).read_bytes()
        text = raw.decode('utf-8-sig')
        documents[key] = {'path': path, 'sha256': fingerprint(raw)}
        for link in markdown_links(text):
            target = local_target(path, link)
            match = re.fullmatch(r'(AIM|SDK)/reading/([a-zA-Z0-9_-]+)\.(?:md|html)', target[0]) if target else None
            if not match:
                continue
            module, identity = match.groups()
            source_key = module.lower()+'/'+identity
            article_path = f'{module}/data/articles/{identity}.json'
            article_raw = (root/article_path).read_bytes()
            article = json.loads(article_raw)
            source = article['source']
            source_path = source['local_path']
            if not source_path.startswith(module+'/source/') or '..' in Path(source_path).parts:
                raise ValueError('Guide source path is outside its retained module.')
            if fingerprint((root/source_path).read_bytes()) != source['sha256']:
                raise ValueError('Guide source original fingerprint changed: '+article_path)
            sources[source_key] = {'article_path': article_path, 'article_sha256': fingerprint(article_raw),
                                   'source_path': source_path, 'source_sha256': source['sha256']}
    evidence = {key: {'path': path, 'sha256': fingerprint((root/path).read_bytes())} for key, path in EVIDENCE.items()}
    bindings, _ = tab_sources(root, json.loads(active_bytes(root, EVIDENCE['tab-sources'])))
    return {'schema_version': 1, 'scope': GUIDE_SCOPE, 'guides': documents, 'sources': sources,
            'tab_sources': bindings, 'evidence': evidence}


def guide_blocks(text):
    """Parse the small authored Markdown vocabulary, retaining every prose block."""
    lines = text.splitlines()
    # Current reviewed manuals use flat lists, prose, headings and pipe tables.
    # Fail before publishing a silently flattened future nested/code structure.
    if any(re.match(r'^(?: {2,}\S|\t|\s*```|\s*~~~|\s*>\s)', line) for line in lines) or re.search(r'!\[[^\]]*\]\(', text):
        raise ValueError('Unsupported guide Markdown structure; review renderer support before publishing.')
    refs = dict(re.findall(r'^\[([^\]\n]+)\]:\s*(\S+)\s*$', text, re.M))
    blocks, counts, pending = [], Counter(), None
    index = 0
    while index < len(lines):
        line = lines[index].strip()
        index += 1
        if not line or re.fullmatch(r'\[[^\]]+\]:\s*\S+', line):
            continue
        anchor = re.fullmatch(r'<a id="([a-zA-Z0-9_-]+)"></a>', line)
        if anchor:
            pending = anchor[1]
            continue
        heading = re.match(r'^(#{1,6})\s+(.+)$', line)
        if heading:
            title = heading[2]
            slug = re.sub(r'[^\w\s-]', '', title.casefold()).strip().replace(' ', '-')
            counts[slug] += 1
            automatic = slug if counts[slug] == 1 else slug+'-'+str(counts[slug]-1)
            blocks.append({'kind': 'heading', 'level': len(heading[1]), 'text': title,
                           'anchor': pending or automatic, 'alias': automatic if pending != automatic else None})
            pending = None
            continue
        if line.startswith('|') and index < len(lines) and re.fullmatch(r'[|\s:-]+', lines[index].strip()):
            rows = [line]
            index += 1
            while index < len(lines) and lines[index].strip().startswith('|'):
                rows.append(lines[index].strip())
                index += 1
            blocks.append({'kind': 'table', 'rows': [[c.strip().replace('\\|', '|') for c in re.split(r'(?<!\\)\|', row.strip('|'))] for row in rows]})
            continue
        item = re.match(r'^(?:(\d+)\.\s+|[-*]\s+)(.*)$', line)
        if item:
            ordered = item[1] is not None
            items = [item[2]]
            while index < len(lines):
                match = re.match(r'^(?:(\d+)\.\s+|[-*]\s+)(.*)$', lines[index].strip())
                if not match or (match[1] is not None) != ordered:
                    break
                items.append(match[2])
                index += 1
            blocks.append({'kind': 'list', 'ordered': ordered, 'start': int(item[1]) if ordered else None, 'items': items})
            continue
        paragraph = [line]
        while index < len(lines) and lines[index].strip() and not re.match(r'^(?:#|<a id=|\||\d+\.\s|[-*]\s|\[[^\]]+\]:)', lines[index].strip()):
            paragraph.append(lines[index].strip())
            index += 1
        blocks.append({'kind': 'paragraph', 'text': ' '.join(paragraph)})
    return blocks, refs


def plain(value):
    value = re.sub(r'\[([^\]]+)\](?:\([^)]+\)|\[[^\]]+\])', r'\1', value)
    value = re.sub(r'\[[A-Z][A-Z0-9_-]*\]', '', value)
    return re.sub(r'[*`]', '', value).strip()


class GuideLibrary:
    def __init__(self, root=ROOT):
        self.root = Path(root).resolve()
        raw = (self.root/MANIFEST).read_bytes()
        self.manifest_sha256 = fingerprint(raw)
        self.manifest = json.loads(raw)
        if self.manifest.get('schema_version') != 1:
            raise ValueError('Unsupported guide manifest version.')
        if set(self.manifest['guides']) != set(GUIDES) or set(self.manifest['evidence']) != set(EVIDENCE):
            raise ValueError('Guide manifest has an unexpected document allowlist.')
        self.guides, self.sources, self.evidence, self.sections = {}, {}, {}, []
        for key, path in GUIDES.items():
            binding = self.manifest['guides'][key]
            if binding['path'] != path:
                raise ValueError('Guide path differs from its allowlist.')
            text = self._verified(path, binding['sha256']).decode('utf-8-sig')
            blocks, refs = guide_blocks(text)
            title = next(b['text'] for b in blocks if b['kind'] == 'heading')
            guide = {'guide_id': key, 'title': title, 'path': path, 'sha256': binding['sha256'],
                     'blocks': blocks, 'references': refs, 'scope': TAB_HELP_SCOPE if key == 'tab-design' else GUIDE_SCOPE}
            self.guides[key] = guide
            # Central reference remains readable through its existing guide links;
            # its different source corpus is not added to procedure-guide search.
            if key not in {'scale-reference', 'tab-design'}:
                self._sections(guide)
        for key, binding in self.manifest['sources'].items():
            match = re.fullmatch(r'(aim|sdk)/([a-zA-Z0-9_-]+)', key)
            if not match or binding['article_path'] != f'{match[1].upper()}/data/articles/{match[2]}.json':
                raise ValueError('Guide source identity is outside its allowlist.')
            article = json.loads(self._verified(binding['article_path'], binding['article_sha256']))
            original = article['source']
            if (article['id'] != match[2] or article['module'].casefold() != match[1]
                    or original['local_path'] != binding['source_path'] or original['sha256'] != binding['source_sha256']
                    or not binding['source_path'].startswith(match[1].upper()+'/source/')
                    or '..' in Path(binding['source_path']).parts):
                raise ValueError('Guide source binding changed.')
            self._verified(binding['source_path'], binding['source_sha256'])
            self.sources[key] = article
        for key, path in EVIDENCE.items():
            binding = self.manifest['evidence'][key]
            if binding['path'] != path:
                raise ValueError('Guide evidence path differs from its allowlist.')
            self.evidence[key] = json.loads(self._verified(path, binding['sha256']))
        _, documents = tab_sources(self.root, self.evidence['tab-sources'], self.manifest.get('tab_sources', {}))
        self.sources.update(documents)
        self.tab_sections = []
        anchors = {block['anchor'] for block in self.guides['tab-design']['blocks'] if block['kind'] == 'heading'}
        nodes = {key: {node['id']: node for node in doc['nodes']} for key, doc in documents.items()}
        seen = set()
        for claim in self.evidence['tab-reconciliation']['claims']:
            anchor = claim['id'].lower()
            if (anchor not in anchors or anchor in seen or claim['evidence_class'] != 'DOCUMENTARY_DESIGN_ONLY'
                    or claim['current_runtime_verified'] is not False or not claim['refs']):
                raise ValueError('TAB claim identity or documentary qualification is invalid.')
            seen.add(anchor)
            for ref in claim['refs']:
                document = documents.get('tab/'+ref['document_id'])
                node = nodes.get('tab/'+ref['document_id'], {}).get(ref['node_id'])
                if (node is None or ref['source_sha256'] != document['source_sha256']
                        or ref['location'] != node['location'] or ref['text_sha256'] != fingerprint(node['text'].encode('utf-8'))
                        or ref['node_canonical_sha256'] != fingerprint(json.dumps(node, sort_keys=True, ensure_ascii=False, separators=(',', ':')).encode('utf-8'))):
                    raise ValueError('TAB claim source node binding changed.')
            self.tab_sections.append({**claim, 'guide_id': 'tab-design', 'guide_title': self.guides['tab-design']['title'],
                                      'section_title': claim['id']+': '+claim['topic'], 'anchor': anchor,
                                      'text': claim['statement']+'\n'+' '.join(claim['conditions_and_limits'])})
        self._tab_reconciliations(anchors)

    def _tab_reconciliations(self, anchors):
        rows = self.evidence['tab-reconciliation']['reconciliations']
        expected = {'R'+str(number).zfill(2) for number in range(1, 13)}
        if (not isinstance(rows, list) or len(rows) != len(expected)
                or any(not isinstance(row, dict) or not isinstance(row.get('id'), str) for row in rows)
                or {row['id'] for row in rows} != expected):
            raise ValueError('TAB reconciliation identities differ from the reviewed twelve records.')
        authority = self.evidence['tab-po-direction'].get('authority', {})
        expected_authority = {
            'owner_clarification': "Travis doesn't use PO",
            'clarification_date': '2026-10-08',
            'interpretation': 'Owner-reported operational non-use; not new technical acceptance, database-wide absence or proof of application behavior.',
        }
        if any(authority.get(key) != value for key, value in expected_authority.items()):
            raise ValueError('TAB owner clarification binding changed.')
        claims = {claim['id']: claim for claim in self.tab_sections}
        self.tab_reconciliations = []
        for row in rows:
            anchor = row['id'].lower()
            claim_ids = row.get('claim_ids', [])
            state = row.get('state')
            is_owner = row['id'] == 'R04'
            if (anchor not in anchors or not isinstance(state, str) or state not in TAB_RECONCILIATION_STATES
                    or row.get('current_runtime_verified') is not False
                    or not isinstance(row.get('topic'), str) or not row['topic'].strip()
                    or not isinstance(row.get('resolution'), str) or not row['resolution'].strip()
                    or not isinstance(claim_ids, list) or not claim_ids
                    or any(not isinstance(identity, str) or identity not in claims for identity in claim_ids)
                    or len(set(claim_ids)) != len(claim_ids)):
                raise ValueError('TAB reconciliation claim, state or guide binding is invalid.')
            if (row.get('owner_evidence_id') != ('tab-po-direction' if is_owner else None)
                    or (state == 'OWNER_OPERATIONAL_DIRECTION_PLUS_DOCUMENTARY_CONTEXT') != is_owner):
                raise ValueError('TAB reconciliation owner evidence binding is invalid.')
            section = {**row, 'guide_id': 'tab-design', 'guide_title': self.guides['tab-design']['title'],
                       'section_title': row['id']+': '+row['topic'], 'anchor': anchor, 'text': row['resolution'],
                       'state_label': TAB_RECONCILIATION_STATES[state],
                       'scope': TAB_OWNER_SCOPE if is_owner else TAB_SCOPE,
                       'evidence_scope': state if is_owner else 'DOCUMENTARY_DESIGN_ONLY',
                       'supporting_claims': [{'id': identity, 'topic': claims[identity]['topic'],
                                              'href': '/guide/tab-design#'+claims[identity]['anchor']}
                                             for identity in claim_ids]}
            if is_owner:
                section['owner_evidence'] = {'id': 'tab-po-direction', 'statement': authority['owner_clarification'],
                                             'date': authority['clarification_date'], 'interpretation': authority['interpretation'],
                                             'href': '/guide-evidence/tab-po-direction#guide-content'}
            self.tab_reconciliations.append(section)

    def _verified(self, relative, expected):
        raw = active_bytes(self.root, relative)
        if fingerprint(raw) != expected:
            raise ValueError('Guide fingerprint changed: '+relative+'. Rebuild the reviewed guide manifest.')
        return raw

    def _sections(self, guide):
        current, parents = None, {}
        for block in guide['blocks']:
            if block['kind'] == 'heading':
                level = block['level']
                parents = {depth: value for depth, value in parents.items() if depth < level}
                parents[level] = plain(block['text'])
                current = {'guide_id': guide['guide_id'], 'guide_title': guide['title'],
                           'section_title': ' — '.join(parents.values()), 'anchor': block['anchor'], 'text': ''}
                self.sections.append(current)
            elif current is not None:
                values = block.get('items', [block.get('text', '')]) if block['kind'] != 'table' else [' '.join(row) for row in block['rows']]
                current['text'] += '\n'+' '.join(plain(v) for v in values)

    def link(self, guide, destination):
        target = local_target(guide['path'], destination)
        if not target:
            return None
        path, fragment = target
        for key, relative in GUIDES.items():
            if path == relative:
                return '/guide/'+key+('#'+fragment if fragment else '#guide-content')
        for key, relative in EVIDENCE.items():
            if path == relative:
                return '/guide-evidence/'+key+'#guide-content'
        for identity in TAB_SOURCES:
            if path == 'SDD/tab-core/reading/'+identity+'.md':
                return '/guide-source/tab/'+identity+('#'+fragment if fragment else '#guide-content')
        match = re.fullmatch(r'(AIM|SDK)/reading/([a-zA-Z0-9_-]+)\.(?:md|html)', path)
        if match and match[1].lower()+'/'+match[2] in self.sources:
            return '/guide-source/'+match[1].lower()+'/'+match[2]+('#'+fragment if fragment else '#guide-content')
        return None

    def listing(self):
        return [{'guide_id': key, 'title': guide['title'], 'sha256': guide['sha256']} for key, guide in self.guides.items() if key not in {'scale-reference', 'tab-design'}]

    def search(self, question, limit=6):
        if not isinstance(question, str) or len(question) > 500:
            raise ValueError('Use a question of 500 characters or fewer.')
        result = {'scope': GUIDE_SCOPE, 'manifest_sha256': self.manifest_sha256, 'results': []}
        identifier = re.fullmatch(r'\s*SRC\s*([0-9]+)\s*', question, flags=re.I)
        if identifier:
            flow = next((row for row in self.evidence['mobile-catalog']['src_base_flows']
                         if row['src_identifier'] == int(identifier[1])), None)
            if flow is None:
                return result
            target = self.link(self.guides['mobile-catalog'], flow['documentation_candidate'])
            section = next((row for row in self.sections
                            if '/guide/'+row['guide_id']+'#'+row['anchor'] == target), None)
            if section is None:
                raise ValueError('The documented SRC destination is unavailable.')
            state = PROCEDURE_DETAIL_LABELS[flow['procedure_detail_state']]
            result['results'] = [{**section,
                                  'section_title': 'SRC '+str(flow['src_identifier'])+': '+flow['user_task'],
                                  'text': state+'. '+flow['limit'],
                                  'text_truncated': False,
                                  'guide_sha256': self.guides[section['guide_id']]['sha256'],
                                  'evidence_scope': 'DOCUMENTED_SRC_CATALOG_MATCH'}][:min(max(int(limit), 1), 20)]
            return result
        for section in self._search_sections(question, self.sections, limit):
            section_text = section['text'].strip()
            result['results'].append({**section, 'text': section_text[:360],
                                      'text_truncated': len(section_text) > 360,
                                      'guide_sha256': self.guides[section['guide_id']]['sha256'],
                                      'evidence_scope': 'DOCUMENTED_GUIDE_WITH_LABELLED_NAVIGATION_OBSERVATIONS'})
        return result

    def search_tab_design(self, question, limit=6):
        if not isinstance(question, str) or len(question) > 500:
            raise ValueError('Use a question of 500 characters or fewer.')
        return {'scope': TAB_HELP_SCOPE, 'manifest_sha256': self.manifest_sha256,
                'results': [{**section, 'scope': TAB_SCOPE,
                             'guide_sha256': self.guides['tab-design']['sha256'],
                             'evidence_scope': 'DOCUMENTARY_DESIGN_ONLY'}
                            for section in self._search_sections(question, self.tab_sections, limit)],
                'reconciliations': [{**section, 'guide_sha256': self.guides['tab-design']['sha256']}
                                    for section in self._search_sections(question, self.tab_reconciliations, limit)]}

    @staticmethod
    def _search_sections(question, sections, limit):
        stop = set('a an and are as at be by can do does for from how i in is it me my of on or the this to what when which why will with you your'.split())
        terms = [word for word in dict.fromkeys(re.findall(r'[^\W_]+', question.casefold())) if word not in stop][:40]
        if not terms:
            return []
        query = ' OR '.join('"'+term+'"' for term in terms)
        with closing(sqlite3.connect(':memory:')) as db:
            db.execute('CREATE VIRTUAL TABLE passages USING fts5(guide,title,body,tokenize="porter unicode61")')
            db.executemany('INSERT INTO passages VALUES(?,?,?)', [(s['guide_title'], s['section_title'], s['text']) for s in sections])
            hits = db.execute('SELECT rowid FROM passages WHERE passages MATCH ? ORDER BY bm25(passages,1,4,1),rowid LIMIT ?', (query, min(max(int(limit), 1), 20))).fetchall()
        return [sections[row-1] for row, in hits]
