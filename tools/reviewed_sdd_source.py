"""Bind selected reviewed SDD claims without indexing the unreviewed SDD corpus."""
import hashlib
import json

LEGACY_REGISTER = 'SDD/derived/reviewed-knowledge.json'
CENTRAL_REGISTER = 'SDD/derived/scale-functional-reference.json'
CENTRAL_DOCUMENTS = frozenset({
    'sdd-61bfda888fe30365', 'sdd-f46806ef53e15f07', 'sdd-56008a31665dcc23',
    'sdd-d4675a92502c23f4', 'sdd-c4c7e01f8ccad48a', 'sdd-1c25f20de1eafc3e',
    'sdd-d50ca4a96095c930',
})
REFERENCE_FIELDS = ('code', 'document_id', 'source_sha256', 'extracted_path', 'extracted_sha256')


def fingerprint(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(',', ':')).encode()).hexdigest()


def load_claim(root, source):
    root = root.resolve()
    def checked_path(relative):
        path = (root / relative).resolve()
        if not path.is_relative_to(root) or not path.is_file():
            raise ValueError('SDD source path is outside the library or missing')
        return path
    if source['register_path'] not in {LEGACY_REGISTER, CENTRAL_REGISTER}:
        raise ValueError('Only the reviewed SDD claim register is supported')
    central = source['register_path'] == CENTRAL_REGISTER
    register = json.loads(checked_path(source['register_path']).read_text(encoding='utf-8'))
    claims = [c for c in register['claims'] if c['id'] == source['claim_id']]
    if len(claims) != 1 or fingerprint(claims[0]) != source['claim_sha256']:
        raise ValueError('Reviewed SDD claim fingerprint changed')
    claim = claims[0]
    if claim['review_state'] != 'SOURCE_REVIEWED_BOUNDED' or claim['citations'] != source['citations']:
        raise ValueError('SDD claim review or citation binding changed')
    bindings = {d['document_id']: d for d in source['documents']}
    if (len(bindings) != len(source['documents'])
            or set(bindings) != {c['document_id'] for c in claim['citations']}):
        raise ValueError('SDD document bindings do not match the claim')
    if central:
        if not claim['citations'] or any(not c['nodes'] for c in claim['citations']):
            raise ValueError('Central SDD claim requires exact source nodes')
        references = register['references']
        reference_map = {r['document_id']: r for r in references}
        if (len(reference_map) != len(references)
                or len({r['code'] for r in references}) != len(references)
                or not set(reference_map) <= CENTRAL_DOCUMENTS
                or not set(bindings) <= set(reference_map)):
            raise ValueError('Central SDD reference scope or identity changed')
        for document_id, binding in bindings.items():
            reference = reference_map[document_id]
            expected = {key: reference[key] for key in REFERENCE_FIELDS}
            if (binding != expected
                    or reference['extracted_path'] != f'SDD/derived/documents/{document_id}.json'
                    or reference['code'] not in {f'R{i:02d}' for i in range(1, 8)}):
                raise ValueError('Central SDD document bindings changed')
    excerpts = [{'location': 'Reviewed claim ' + claim['id'],
                 'text': claim['statement'] + '\nLimit: ' + claim['limits']}]
    for citation in claim['citations']:
        binding = bindings[citation['document_id']]
        extracted = checked_path(binding['extracted_path'])
        if hashlib.sha256(extracted.read_bytes()).hexdigest() != binding['extracted_sha256']:
            raise ValueError('SDD original or extraction fingerprint changed')
        document = json.loads(extracted.read_text(encoding='utf-8'))
        if (document['document_id'] != citation['document_id']
                or document['source_sha256'] != citation['source_sha256']
                or (central and binding['source_sha256'] != citation['source_sha256'])):
            raise ValueError('SDD extraction identity mismatch')
        # Named originals are resolved internally; central help bindings contain
        # only neutral reference codes and opaque extraction paths.
        original = checked_path('SDD/' + document['source_path'] if central else binding['source_path'])
        if hashlib.sha256(original.read_bytes()).hexdigest() != citation['source_sha256']:
            raise ValueError('SDD original or extraction fingerprint changed')
        nodes = {n['id']: n for n in document['nodes']}
        if len(nodes) != len(document['nodes']):
            raise ValueError('SDD extraction node identity is ambiguous')
        for node_id in citation['nodes']:
            if node_id not in nodes:
                raise ValueError('SDD cited node is unavailable')
            # Expose the reviewed conclusion and exact location, never the whole body.
            label = binding['code'] if central else citation['document_id']
            location = f'{label} / {node_id}' if central else str(nodes[node_id]['location'])
            excerpts.append({'location': f'{label} / {node_id}',
                             'text': 'Source location: ' + location
                                     + '\nOriginal SHA-256: ' + citation['source_sha256']})
    return claim, excerpts
