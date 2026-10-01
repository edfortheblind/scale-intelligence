"""Validate active SDD bytes or frozen archive attestations without archive reads."""
import hashlib
import json
from pathlib import PurePosixPath
import re


LIFECYCLE_PATH = '_project/archive-disposition-continuation20.json'
ARCHIVE_PARTS = {'archive', '_archive', 'archiving'}
ACTIVE_BYTES_VERIFIED = 'ACTIVE_BYTES_VERIFIED'
ARCHIVED_ATTESTATION_NOT_REVERIFIED = 'ARCHIVED_ATTESTATION_NOT_REVERIFIED'


def _relative(value, archived=False):
    if (not isinstance(value, str) or not value or '\\' in value or ':' in value
            or value.startswith('/') or any(p in {'', '.', '..'} for p in value.split('/'))):
        raise ValueError('Invalid SDD lifecycle relative path')
    has_archive = bool({p.casefold() for p in PurePosixPath(value).parts} & ARCHIVE_PARTS)
    if has_archive != archived:
        raise ValueError('SDD lifecycle path crosses the active/archive boundary')
    return value


def _sha(value):
    if not isinstance(value, str) or not re.fullmatch('[0-9a-f]{64}', value):
        raise ValueError('Invalid SDD lifecycle SHA-256')
    return value


def _active_path(root, relative):
    relative = _relative(relative)
    target = (root / relative).resolve()
    if not target.is_relative_to(root) or set(p.casefold() for p in target.relative_to(root).parts) & ARCHIVE_PARTS:
        raise ValueError('SDD source path is outside the active library')
    return target


def load_lifecycle(root):
    """Read only the active disposition manifest; archive destinations are locators."""
    root = root.resolve()
    data = json.loads(_active_path(root, LIFECYCLE_PATH).read_text(encoding='utf-8'))
    if (data.get('schema_version') != 1 or not isinstance(data.get('archived'), list)
            or not isinstance(data.get('retired_documents'), list)):
        raise ValueError('Invalid SDD lifecycle manifest')
    originals, destinations = {}, set()
    for row in data['archived']:
        original = _relative(row['original_path'])
        destination = _relative(row['archived_path'], archived=True)
        _sha(row['sha256'])
        if (type(row['bytes']) is not int or row['bytes'] < 0
                or row['old_path_state'] not in {'ABSENT', 'REDIRECT'}
                or original.casefold() in originals or destination.casefold() in destinations):
            raise ValueError('Invalid or colliding SDD archive entry')
        originals[original.casefold()] = row
        destinations.add(destination.casefold())
    retired = set()
    for row in data['retired_documents']:
        identity = row['document_id']
        if not isinstance(identity, str) or not identity or identity in retired:
            raise ValueError('Duplicate or invalid retired SDD identity')
        retired.add(identity)
        _sha(row['source_sha256'])
        _sha(row['extracted_sha256'])
        _sha(row['coverage_record_sha256'])
        extracted = _relative(row['extracted_path'])
        binding = originals.get(extracted.casefold())
        metadata = row['document_metadata']
        if (binding is None or binding['sha256'] != row['extracted_sha256']
                or metadata['document_id'] != identity
                or metadata['source_sha256'] != row['source_sha256']
                or 'nodes' in metadata or 'text' in metadata):
            raise ValueError('Retired SDD extraction identity changed')
        source = originals.get(_relative('SDD/' + metadata['source_path']).casefold())
        if source is None or source['sha256'] != row['source_sha256']:
            raise ValueError('Retired SDD original identity changed')
        nodes = row['node_metadata']
        if (not isinstance(nodes, list) or len({n['id'] for n in nodes}) != len(nodes)
                or any(set(n) - {'id', 'kind', 'source_text_state', 'slide'} for n in nodes)
                or any(not isinstance(n['id'], str) or not n['id'] or not isinstance(n['kind'], str) for n in nodes)):
            raise ValueError('Retired SDD node identities are invalid or contain source text')
        asset_paths = set()
        for asset in row['assets']:
            asset_path = _relative('SDD/derived/' + asset['path'])
            asset_binding = originals.get(asset_path.casefold())
            if (asset_path.casefold() in asset_paths or asset_binding is None
                    or asset_binding['sha256'] != asset['sha256']
                    or asset_binding['bytes'] != asset['bytes']):
                raise ValueError('Retired SDD asset identity changed')
            asset_paths.add(asset_path.casefold())
        records = set()
        for record in row['review_record_bindings']:
            key = (record['collection'], record['index'])
            _sha(record['sha256'])
            if (record['collection'] not in {'products', 'claims', 'configuration', 'diagrams', 'tables'}
                    or type(record['index']) is not int or record['index'] < 0 or key in records):
                raise ValueError('Invalid retired SDD review record binding')
            records.add(key)
    return data


def retired_document_map(root):
    """Return frozen metadata rows, never reconstructed or freshly verified bodies."""
    return {row['document_id']: row for row in load_lifecycle(root)['retired_documents']}


def check_source_identity(root, relative, expected_sha256):
    """Distinguish a current byte check from a historical archival attestation."""
    root = root.resolve()
    relative = _relative(relative)
    _sha(expected_sha256)
    lifecycle = load_lifecycle(root)
    archived = next((row for row in lifecycle['archived']
                     if row['original_path'].casefold() == relative.casefold()), None)
    target = _active_path(root, relative)
    if archived is not None:
        if archived['sha256'] != expected_sha256:
            raise ValueError('Archived SDD attestation identity changed')
        if archived['old_path_state'] == 'ABSENT' and (target.exists() or target.is_symlink()):
            raise ValueError('Archived SDD old path must be absent')
        if archived['old_path_state'] == 'REDIRECT' and not target.is_file():
            raise ValueError('Archived SDD redirect is missing')
        return ARCHIVED_ATTESTATION_NOT_REVERIFIED
    if not target.is_file() or hashlib.sha256(target.read_bytes()).hexdigest() != expected_sha256:
        raise ValueError('Active SDD source fingerprint changed or is missing')
    return ACTIVE_BYTES_VERIFIED
