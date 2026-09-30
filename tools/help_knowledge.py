"""Read-only retrieval of reviewed SCALE guidance; no model or warehouse connection."""
import hashlib
import json
from contextlib import closing
from pathlib import Path
import re
import sqlite3
from collections import Counter

from article_data import nodes as article_nodes, search_text as article_text
from reviewed_sdd_source import load_claim
from reviewed_process_source import load_refinement

ROOT = Path(__file__).resolve().parents[1]
GENERAL_SCOPE = ('These are reviewed general explanations. Current warehouse records, individual '
                 'permissions, effective settings and end-to-end process times are not established by this library.')
KINDS = {'VENDOR_DOCUMENTATION': 'Vendor documentation', 'DEPLOYED_SQL_STATIC': 'Captured SQL source',
         'CATALOG_METADATA': 'Captured database metadata', 'REVIEWED_SDD_CLAIM': 'Reviewed implementation example',
         'REVIEWED_PROCESS_CLAIM': 'Reviewed process documentation',
         'RETAINED_OBSERVATION': 'Retained observation with time and scope limits'}
IMPLEMENTATION_FILES = ['tools/help_knowledge.py', 'tools/serve_help.py', 'tools/render_help_page.py', 'tools/reviewed_sdd_source.py', 'tools/reviewed_process_source.py', 'tools/article_data.py']
IMPLEMENTATION_SHA256 = hashlib.sha256(json.dumps(
    {p: hashlib.sha256((ROOT/p).read_bytes()).hexdigest() for p in IMPLEMENTATION_FILES},
    sort_keys=True).encode()).hexdigest()

# These are authored explanations from reviewed routine contracts, not SQL bodies,
# execution traces, evaluation questions, expected answers or source metadata.
DETAIL_FIELDS = [
    ('Purpose', ('purpose',)),
    ('Inputs and defaults', ('inputs_defaults', 'inputs')),
    ('Missing or invalid input', ('null_and_invalid_input_behavior',)),
    ('Results', ('output_shape', 'outputs')),
    ('Ordered behavior', ('ordered_branches', 'ordered_effects')),
    ('Status and quantity effects', ('status_and_quantity_effects',)),
    ('Configuration and precedence', ('configuration_scope_and_precedence', 'configuration')),
    ('Errors and return handling', ('error_and_return_handling', 'error_return')),
    ('Transaction boundary', ('transaction_ownership',)),
    ('Concurrent changes', ('concurrency',)),
    ('Triggers', ('trigger_behavior',)),
    ('Limits and handoffs', ('external_handoffs_and_gaps', 'external_handoffs', 'gaps')),
]


def explanation_values(value):
    """Keep explanation text; exclude source hashes, refs and record metadata."""
    if isinstance(value, str):
        yield value
    elif isinstance(value, list):
        for item in value:
            yield from explanation_values(item)
    elif isinstance(value, dict):
        for key in ('explanation', 'description', 'behavior', 'name', 'type', 'default', 'null_behavior'):
            if key in value:
                yield from explanation_values(value[key])


def read(path):
    return json.loads(path.read_text(encoding='utf-8'))


def text_values(value):
    if isinstance(value, str):
        yield value
    elif isinstance(value, list):
        for item in value:
            yield from text_values(item)
    elif isinstance(value, dict):
        for item in value.values():
            yield from text_values(item)


def tokens(value):
    # Quoted unicode tokens become data, never FTS query operators.
    # Split identifier case and adjacent words/numbers on both sides of search.
    result = []
    for word in re.findall(r'[^\W_]+', value, flags=re.UNICODE):
        result.append(word.casefold())
        parts = re.sub(r'([a-z])([A-Z])', r'\1 \2', word)
        parts = re.sub(r'([A-Z])([A-Z][a-z])', r'\1 \2', parts)
        parts = re.sub(r'(?<=[^\W\d_])(?=\d)|(?<=\d)(?=[^\W\d_])', ' ', parts)
        if parts != word:
            result.extend(parts.casefold().split())
    return result


class Knowledge:
    def __init__(self, root=ROOT):
        self.root = Path(root).resolve()
        self.path = self.root/'DB Architecture/mappings/help-topics.json'
        raw = self.path.read_bytes()
        self.data = json.loads(raw)
        self.generation_sha256 = hashlib.sha256(raw).hexdigest()
        self.snapshot = self.data['snapshot_id']
        self.topics = {t['topic_id']: t for t in self.data['topics']}
        if len(self.topics) != len(self.data['topics']):
            raise ValueError('Duplicate help topic identity')
        self.sources = self.data['sources']
        self.vendor_manifest = {'articles': {}}
        self.vendor_manifest_sha256 = None
        if any(s['kind'] == 'VENDOR_DOCUMENTATION' for s in self.sources.values()):
            manifest_raw=(self.root/'help_app/vendor-source-manifest.json').read_bytes()
            self.vendor_manifest=json.loads(manifest_raw)
            self.vendor_manifest_sha256=hashlib.sha256(manifest_raw).hexdigest()
            if self.vendor_manifest['knowledge_generation_sha256'] != self.generation_sha256:
                raise ValueError('Vendor citation manifest belongs to another knowledge generation')
        self._process_cache={}
        self.citations = {key: self._load_source(key, source) for key, source in self.sources.items()}
        for topic in self.topics.values():
            for key in self._refs(topic):
                if key not in self.citations:
                    raise ValueError('Missing source binding')
        self.contracts = {}
        for relative, binding in self.vendor_manifest.get('semantic_batches', {}).items():
            if not re.fullmatch(r'DB Architecture/mappings/batches/[a-zA-Z0-9_-]+\.json', relative):
                raise ValueError('Unsupported semantic batch path')
            batch=json.loads(self._verified_text(relative, binding['sha256']))
            contracts=batch['semantic_contracts']
            if sorted(c['object_id'] for c in contracts) != binding['object_ids']:
                raise ValueError('Semantic batch identity mismatch')
            for contract in contracts:
                oid=contract['object_id']
                if oid in self.contracts or contract['snapshot_id'] != self.snapshot:
                    raise ValueError('Duplicate or stale semantic contract')
                refs=[key for key,s in self.sources.items()
                      if s['kind']=='DEPLOYED_SQL_STATIC' and s['object_id']==oid
                      and s['source_definition_sha256']==contract['source_definition_sha256']]
                if not refs:
                    raise ValueError('Semantic contract has no verified SQL source')
                sections=[]
                for label, keys in DETAIL_FIELDS:
                    items=[text for field in keys for text in explanation_values(contract.get(field))]
                    if items:sections.append({'label':label,'items':items})
                self.contracts[oid]={'object_id':oid,'label':contract['qualified_name'],
                    'source_definition_sha256':contract['source_definition_sha256'],
                    'review_scope':contract['review_scope'],'sections':sections,
                    'batch_path':relative,'batch_sha256':binding['sha256']}
        # Each request creates its own in-memory SQLite connection. There is no
        # shared mutable connection, persistent derived database or external index.
        # Exact repeated contract boilerplate is shown in answers but omitted
        # from retrieval. Rank bounded passages so a long multi-routine topic
        # is not penalized merely for containing more reviewed source detail.
        common=Counter(text for c in self.contracts.values() for s in c['sections'] for text in set(s['items']))
        self.rows = []
        for topic in self.topics.values():
            body = {k: topic[k] for k in ('plain_answer','input_context',
                    'configuration_dependencies','expected_results','explanation_paths',
                    'trigger','boundaries')}
            body['steps']=[s['explanation'] for s in topic['execution_steps']]
            self.rows.append((topic['topic_id'], topic['title'], topic['business_question'],
                              ' '.join(text_values(body)), ''))
            # Keep the reviewed heading searchable without the length penalty
            # of its full topic. This is authored guidance, not evaluation text.
            if topic['business_question'].strip():
                self.rows.append((topic['topic_id'], topic['title'],
                                  topic['business_question'], '', ''))
            for passage in dict.fromkeys(text_values(body)):
                self.rows.append((topic['topic_id'], topic['title'], '', passage, ''))
            for refinement in topic.get('documentary_refinements', []):
                ref=refinement['evidence_ref']
                source=self.sources[ref]
                if source['kind']!='REVIEWED_PROCESS_CLAIM' or self.citations[ref]['excerpts'][0]['text']!=refinement['statement']:
                    raise ValueError('Process refinement text differs from its reviewed citation')
                self.rows.append((topic['topic_id'],topic['title'],'',refinement['statement'],ref))
            for detail in self._details(topic):
                for section in detail['sections']:
                    passage=' '.join(text for text in section['items'] if common[text]<5)
                    if passage:
                        self.rows.append((topic['topic_id'],detail['label'],'',passage,detail['source_id']))
        self.search_rows = [(key, ' '.join(tokens(title)), ' '.join(tokens(prompt)),
                             ' '.join(tokens(body)), source)
                            for key,title,prompt,body,source in self.rows]

    def _details(self, topic):
        by_id={}
        for ref in self._refs(topic):
            source=self.sources[ref]
            if source['kind']=='DEPLOYED_SQL_STATIC' and source['object_id'] in self.contracts:
                detail=self.contracts[source['object_id']]
                by_id.setdefault(source['object_id'], {**detail,'source_id':ref})
        return list(by_id.values())

    def _path(self, relative):
        path = (self.root/relative).resolve()
        if not path.is_relative_to(self.root) or not path.is_file():
            raise ValueError('Source path is outside the knowledge library or unavailable')
        return path

    def _verified_text(self, relative, expected):
        path = self._path(relative)
        raw = path.read_bytes()
        if hashlib.sha256(raw).hexdigest() != expected:
            raise ValueError('Source fingerprint changed: '+relative)
        return raw.decode('utf-8')

    def _load_source(self, key, source):
        kind = source['kind']
        result = {'source_id': key, 'kind': kind, 'kind_label': KINDS[kind], 'snapshot_id': self.snapshot}
        if kind == 'DEPLOYED_SQL_STATIC':
            text = self._verified_text(source['reading_path'], source['reading_sha256'])
            lines = text.splitlines()
            excerpts = []
            for start, end in source['line_spans']:
                if not 1 <= start <= end <= len(lines):
                    raise ValueError('Invalid source line span')
                excerpts.append({'location': f'Lines {start}-{end}', 'text': '\n'.join(lines[start-1:end])})
            result.update(label=source['qualified_name'], source_hash=source['source_definition_sha256'],
                          reading_hash=source['reading_sha256'], excerpts=excerpts,
                          qualification='Captured source only. Strings/comments are redacted. This is not an executable script or a verified application workflow.')
        elif kind == 'VENDOR_DOCUMENTATION':
            self._verified_text(source['source_path'], source['source_sha256'])
            module, article_id = source['module'], source['article_id']
            if module not in {'AIM', 'SDK'} or not re.fullmatch(r'[a-zA-Z0-9_-]+', article_id):
                raise ValueError('Unsupported vendor identity')
            article_path=f'{module}/data/articles/{article_id}.json'
            binding=self.vendor_manifest['articles'][article_path]
            article=json.loads(self._verified_text(article_path,binding['article_sha256']))
            if (article['source']['sha256'] != source['source_sha256']
                    or article['source']['local_path'] != source['source_path']
                    or binding['source_sha256'] != source['source_sha256']
                    or binding['source_path'] != source['source_path']):
                raise ValueError('Vendor document generation changed')
            # A cited paragraph/list/table can contain its words in child nodes.
            # Keep that exact subtree, with readable block boundaries, rather
            # than displaying only whitespace stored directly on its parent.
            nodes = {node['node_id']: node for node in article_nodes(article['content_tree'])}
            result.update(label=article['title'], source_hash=source['source_sha256'],
                          reading_hash=binding['article_sha256'],
                          article_id=article_id, module=module,
                          excerpts=[{'location': node, 'text': article_text(nodes[node]).strip()}
                                    for node in source['node_ids']],
                          qualification='Only the cited passages support this answer. Product/version and deployed configuration may differ.')
        elif kind == 'REVIEWED_SDD_CLAIM':
            claim, excerpts = load_claim(self.root, source)
            result.update(label=source['claim_id'], source_hash=source['claim_sha256'],
                          excerpts=excerpts, classification=claim['classification'],
                          qualification='Selected reviewed claim only, used in this local prototype. '
                          'The SDD corpus remains ineligible for production indexing. ' + claim['limits'])
        elif kind == 'REVIEWED_PROCESS_CLAIM':
            claim,excerpts=load_refinement(self.root,source,self._process_cache)
            result.update(label=source['claim_id'],source_hash=source['claim_sha256'],
                          excerpts=excerpts,classification=claim['claim_class'],
                          qualification='Reviewed vendor process statement used in the local prototype. '
                                        'Installed application behavior and production index eligibility remain unestablished. '
                                        'Source conflicts and deployment limits are preserved.')
        elif kind == 'RETAINED_OBSERVATION':
            allowed = {'DB Architecture/evidence/configuration-observations.json': 'Configuration aggregate checks',
                       'DB Architecture/catalog/query_store_runtime.json': 'Query Store statement aggregates'}
            if source['path'] not in allowed:
                raise ValueError('Observation source is not allowlisted')
            observation = json.loads(self._verified_text(source['path'], source['sha256']))
            if isinstance(observation, list):
                description = (f"{len(observation)} retained rows for {len({r['object_id'] for r in observation})} historical object IDs. "
                               'Statement statistics do not establish procedure calls or complete process duration.')
            else:
                description = 'Capture began '+observation['started_at']+'. Checks: '+', '.join(c['check_id'] for c in observation['checks'])+'.'
            result.update(label=allowed[source['path']], source_hash=source['sha256'],
                          excerpts=[{'location': source['path'], 'text': description}],
                          qualification='Timestamped aggregate evidence. The owner accepts the current replica as the documentation baseline; individual effective settings and end-to-end process duration are not established.')
        elif kind == 'CATALOG_METADATA':
            self._verified_text(source['path'], source['sha256'])
            result.update(label=Path(source['path']).name, source_hash=source['sha256'],
                          object_ids=source['object_ids'], excerpts=[],
                          qualification='Snapshot metadata establishes captured structure; it does not establish current activation or runtime behavior.')
        else:
            raise ValueError('Unreviewed source class')
        return result

    @staticmethod
    def _refs(topic):
        return list(dict.fromkeys(topic['evidence_refs'] +
                    [ref for step in topic['execution_steps'] for ref in step['evidence_refs']]))

    def summary(self):
        return {'snapshot_id': self.snapshot, 'topic_count': len(self.topics), 'scope': GENERAL_SCOPE,
                'reviewed_routine_contracts':len(self.contracts),
                'reviewed_process_refinements':sum(s['kind']=='REVIEWED_PROCESS_CLAIM' for s in self.sources.values()),
                'answer_mode': 'REVIEWED_CURATED_TEXT', 'live_database_access': False,
                'implementation_sha256': IMPLEMENTATION_SHA256,
                'vendor_manifest_sha256': self.vendor_manifest_sha256,
                'topic_generation_sha256': self.generation_sha256}

    def topic(self, topic_id):
        topic = self.topics[topic_id]
        return {'topic_id': topic_id, 'title': topic['title'], 'business_question': topic['business_question'],
                'what_it_does': topic['plain_answer'], 'trigger': topic['trigger'],
                'input_context': topic['input_context'],
                'what_happens': [{'order': s['order'], 'explanation': s['explanation'], 'evidence_refs': s['evidence_refs']}
                                 for s in topic['execution_steps']],
                'what_can_affect_it': topic['configuration_dependencies'],
                'expected_results': topic['expected_results'], 'what_you_can_check': topic['explanation_paths'],
                'evidence_limits': topic['boundaries'], 'scope': GENERAL_SCOPE,
                'reviewed_details': self._details(topic),
                'documentary_refinements': topic.get('documentary_refinements', []),
                'sources': [{k: v for k, v in self.citations[key].items() if k != 'excerpts'} for key in self._refs(topic)]}

    def source(self, source_id):
        return self.citations[source_id]

    def search(self, question, limit=8):
        if not isinstance(question, str) or len(question) > 500:
            raise ValueError('Use a question of 500 characters or fewer.')
        terms = list(dict.fromkeys(tokens(question)))[:40]
        if not terms:
            return {'question': question, 'state': 'EMPTY_QUERY', 'scope': GENERAL_SCOPE, 'results': []}
        # A demonstrative such as "this setting" identifies no searchable
        # subject. Ask for the missing context instead of ranking unrelated
        # settings merely because they contain common configuration words.
        generic = set(('a an and are as at be by can could do does for from how i in is it me my of on or our '
                       'please should tell the their there these this that those to was we what when which who why will with '
                       'would you your explain understand configure configuration configurations setting settings '
                       'option options field fields mean means meaning work works change set setup use using enable '
                       'disable need want help about affect affects behavior behaviour plain language show where '
                       'explanation explanations explains explained explaining comes source sources documentation documented evidence simple terms').split())
        configuration_words = {'configure', 'configuration', 'configurations', 'setting', 'settings', 'option', 'options', 'field', 'fields'}
        named_work = 'work' in terms and not set(terms) & {'this', 'that', 'these', 'those', 'it'}
        if set(terms) & configuration_words and not set(terms) - generic and not named_work:
            return {'question': question, 'state': 'NEEDS_CONTEXT', 'scope': GENERAL_SCOPE,
                    'clarification': 'Enter the setting or field name, the screen where you see it, and what you want it to do. For example: Packing Preferences — Validate Item. Do not include credentials or transaction data.',
                    'results': []}
        # Common words do not distinguish processes. Never index evaluation
        # questions/expectations: held-out retrieval remains an actual check.
        stop = set('a an and are as at be by can do does for from how i in is it me my of on or our the their there these this to was we what when which who why will with you your'.split())
        terms = [t for t in terms if t not in stop]
        if not terms:
            return {'question': question, 'state': 'NO_REVIEWED_MATCH', 'scope': GENERAL_SCOPE, 'results': []}
        query = ' OR '.join('"'+t+'"' for t in terms)
        with closing(sqlite3.connect(':memory:')) as db:
            db.execute('CREATE VIRTUAL TABLE topics USING fts5(id UNINDEXED,title,question,body,source_id UNINDEXED,tokenize="porter unicode61")')
            db.executemany('INSERT INTO topics VALUES(?,?,?,?,?)', self.search_rows)
            passages = db.execute('SELECT id,bm25(topics,0,4,5,1,0) AS rank,rowid FROM topics WHERE topics MATCH ? ORDER BY rank,id,rowid', (query,)).fetchall()
        best={}
        for key, rank, row_id in passages:
            _, _, _, passage, source_id = self.rows[row_id-1]
            best.setdefault(key, (rank,passage,source_id))
        rows=[(key,value[0]) for key,value in best.items()]
        # An explicitly named reviewed process outranks incidental words such as
        # "confirm" in a question. This uses stable topic names, never answer keys.
        query_words = ' '+' '.join(tokens(question))+' '
        def named_process(key):
            phrase = key.removeprefix('process-').replace('-', ' ')
            return len(phrase.split()) if ' '+phrase+' ' in query_words else 0
        rows.sort(key=lambda row: (-named_process(row[0]), row[1], row[0]))
        rows = rows[:min(max(int(limit), 1), 20)]
        results = [{'topic_id': key, 'title': self.topics[key]['title'],
                    'question': self.topics[key]['business_question'],
                    'answer': self.topics[key]['plain_answer'],
                    'matching_detail':best[key][1] if best[key][2] else None,
                    'matching_source_id':best[key][2] or None,
                    'evidence_scope': 'REVIEWED_GENERAL_GUIDANCE'} for key, _ in rows]
        return {'question': question, 'state': 'REVIEWED_MATCHES' if results else 'NO_REVIEWED_MATCH',
                'scope': GENERAL_SCOPE, 'results': results}
