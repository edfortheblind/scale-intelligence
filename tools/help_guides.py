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
}
EVIDENCE = {
    'mobile-navigation': 'SDD/RF/warehouse-mobile-live-navigation.json',
    'mobile-catalog': 'SDD/RF/warehouse-mobile-source-catalog.json',
    'scale-reference': 'SDD/derived/scale-functional-reference.json',
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
    return {'schema_version': 1, 'scope': GUIDE_SCOPE, 'guides': documents, 'sources': sources, 'evidence': evidence}


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
                     'blocks': blocks, 'references': refs, 'scope': GUIDE_SCOPE}
            self.guides[key] = guide
            # Central reference remains readable through its existing guide links;
            # its different source corpus is not added to procedure-guide search.
            if key != 'scale-reference':
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

    def _verified(self, relative, expected):
        path = (self.root/relative).resolve()
        if not path.is_relative_to(self.root) or any(part.casefold() in {'archive', 'archiving', '_archive', '.aekr'} for part in path.relative_to(self.root).parts):
            raise ValueError('Guide input is outside the active library.')
        raw = path.read_bytes()
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
        match = re.fullmatch(r'(AIM|SDK)/reading/([a-zA-Z0-9_-]+)\.(?:md|html)', path)
        if match and match[1].lower()+'/'+match[2] in self.sources:
            return '/guide-source/'+match[1].lower()+'/'+match[2]+('#'+fragment if fragment else '#guide-content')
        return None

    def listing(self):
        return [{'guide_id': key, 'title': guide['title'], 'sha256': guide['sha256']} for key, guide in self.guides.items() if key != 'scale-reference']

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
                                  'guide_sha256': self.guides[section['guide_id']]['sha256'],
                                  'evidence_scope': 'DOCUMENTED_SRC_CATALOG_MATCH'}][:min(max(int(limit), 1), 20)]
            return result
        stop = set('a an and are as at be by can do does for from how i in is it me my of on or the this to what when which why will with you your'.split())
        terms = [word for word in dict.fromkeys(re.findall(r'[^\W_]+', question.casefold())) if word not in stop][:40]
        if not terms:
            return result
        query = ' OR '.join('"'+term+'"' for term in terms)
        with closing(sqlite3.connect(':memory:')) as db:
            db.execute('CREATE VIRTUAL TABLE passages USING fts5(guide,title,body,tokenize="porter unicode61")')
            db.executemany('INSERT INTO passages VALUES(?,?,?)', [(s['guide_title'], s['section_title'], s['text']) for s in self.sections])
            hits = db.execute('SELECT rowid FROM passages WHERE passages MATCH ? ORDER BY bm25(passages,1,4,1),rowid LIMIT ?', (query, min(max(int(limit), 1), 20))).fetchall()
        for row, in hits:
            section = self.sections[row-1]
            result['results'].append({**section, 'text': section['text'].strip()[:360],
                                      'guide_sha256': self.guides[section['guide_id']]['sha256'],
                                      'evidence_scope': 'DOCUMENTED_GUIDE_WITH_LABELLED_NAVIGATION_OBSERVATIONS'})
        return result
