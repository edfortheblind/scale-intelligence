"""Validate selected reviewed process refinements for the local help prototype."""
import hashlib
import json

REGISTER='DB Architecture/mappings/process-documentary-review.json'


def fingerprint(value):
    return hashlib.sha256(json.dumps(value,ensure_ascii=False,sort_keys=True,separators=(',',':')).encode()).hexdigest()


def load_refinement(root, source, cache=None):
    root=root.resolve()
    cache={} if cache is None else cache
    def checked(relative, expected, parse=False):
        path=(root/relative).resolve()
        if not path.is_relative_to(root) or not path.is_file():
            raise ValueError('Process source path is outside the library or missing')
        if relative not in cache:
            raw=path.read_bytes()
            cache[relative]=(hashlib.sha256(raw).hexdigest(),raw)
        digest,raw=cache[relative]
        if digest!=expected:raise ValueError('Process source fingerprint changed: '+relative)
        if not parse:return None
        key=('json',relative)
        if key not in cache:cache[key]=json.loads(raw)
        return cache[key]
    if source['register_path']!=REGISTER:
        raise ValueError('Only the reviewed process documentary register is supported')
    register=checked(REGISTER,source['register_sha256'],True)
    families=[f for f in register['families'] if f['id']==source['family_id']]
    if len(families)!=1:raise ValueError('Reviewed process family is unavailable')
    records=[r for r in families[0]['refinements'] if r['id']==source['claim_id']]
    if len(records)!=1:raise ValueError('Reviewed process claim is unavailable')
    claim=records[0]
    unsigned={k:v for k,v in claim.items() if k!='record_sha256'}
    if fingerprint(unsigned)!=claim['record_sha256'] or claim['record_sha256']!=source['claim_sha256']:
        raise ValueError('Reviewed process claim fingerprint changed')
    if (claim['review_state']!='AUTHOR_REVIEWED_SOURCE_BOUND'
            or claim['deployment_alignment']!='NOT_ESTABLISHED'
            or claim['production_index_eligible'] is not False):
        raise ValueError('Process review qualification changed')
    excerpts=[{'location':claim['id'],'text':claim['statement']}]
    for citation in claim['sources']:
        if citation['module']!='AIM':raise ValueError('Unsupported process source module')
        checked(citation['source_path'],citation['source_sha256'])
        article=checked(citation['json_path'],citation['json_sha256'],True)
        if (article['source']['sha256']!=citation['source_sha256']
                or article['source']['local_path']!=citation['source_path']
                or citation['json_path']!='AIM/data/articles/'+citation['article_id']+'.json'):
            raise ValueError('Process article identity mismatch')
        key=('nodes',citation['json_path'])
        if key not in cache:
            nodes={}
            def walk(node):
                if isinstance(node,dict):
                    if 'node_id' in node:
                        if node['node_id'] in nodes:raise ValueError('Duplicate process source node')
                        nodes[node['node_id']]=node
                    for item in node.values():walk(item)
                elif isinstance(node,list):
                    for item in node:walk(item)
            walk(article['content_tree']);cache[key]=nodes
        nodes=cache[key]
        if set(citation['node_ids'])!=set(citation['node_fingerprints']):
            raise ValueError('Process citation node bindings differ')
        for node_id in citation['node_ids']:
            if node_id not in nodes or fingerprint(nodes[node_id])!=citation['node_fingerprints'][node_id]:
                raise ValueError('Process cited node fingerprint changed')
        excerpts.append({'location':citation['title'],
                         'text':'AIM article '+citation['article_id']+'; nodes '+', '.join(citation['node_ids'])+
                                '\nOriginal SHA-256: '+citation['source_sha256']+
                                '\nReading-copy SHA-256: '+citation['json_sha256']})
    return claim,excerpts
