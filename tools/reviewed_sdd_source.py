"""Bind selected reviewed SDD claims without indexing the unreviewed SDD corpus."""
import hashlib
import json


def fingerprint(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(',', ':')).encode()).hexdigest()


def load_claim(root, source):
    root = root.resolve()
    def checked_path(relative):
        path = (root / relative).resolve()
        if not path.is_relative_to(root) or not path.is_file():
            raise ValueError('SDD source path is outside the library or missing')
        return path
    if source['register_path'] != 'SDD/derived/reviewed-knowledge.json':
        raise ValueError('Only the reviewed SDD claim register is supported')
    register = json.loads(checked_path(source['register_path']).read_text(encoding='utf-8'))
    claims = [c for c in register['claims'] if c['id'] == source['claim_id']]
    if len(claims) != 1 or fingerprint(claims[0]) != source['claim_sha256']:
        raise ValueError('Reviewed SDD claim fingerprint changed')
    claim = claims[0]
    if claim['review_state'] != 'SOURCE_REVIEWED_BOUNDED' or claim['citations'] != source['citations']:
        raise ValueError('SDD claim review or citation binding changed')
    bindings = {d['document_id']: d for d in source['documents']}
    if set(bindings) != {c['document_id'] for c in claim['citations']}:
        raise ValueError('SDD document bindings do not match the claim')
    excerpts = [{'location': 'Reviewed claim ' + claim['id'],
                 'text': claim['statement'] + '\nLimit: ' + claim['limits']}]
    for citation in claim['citations']:
        binding = bindings[citation['document_id']]
        original = checked_path(binding['source_path'])
        extracted = checked_path(binding['extracted_path'])
        if (hashlib.sha256(original.read_bytes()).hexdigest() != citation['source_sha256']
                or hashlib.sha256(extracted.read_bytes()).hexdigest() != binding['extracted_sha256']):
            raise ValueError('SDD original or extraction fingerprint changed')
        document = json.loads(extracted.read_text(encoding='utf-8'))
        if (document['document_id'] != citation['document_id']
                or document['source_sha256'] != citation['source_sha256']):
            raise ValueError('SDD extraction identity mismatch')
        nodes = {n['id']: n for n in document['nodes']}
        for node_id in citation['nodes']:
            if node_id not in nodes:
                raise ValueError('SDD cited node is unavailable')
            # Expose the reviewed conclusion and exact location, never the whole body.
            excerpts.append({'location': f"{citation['document_id']} / {node_id}",
                             'text': 'Source location: ' + str(nodes[node_id]['location'])
                                     + '\nOriginal SHA-256: ' + citation['source_sha256']})
    return claim, excerpts
