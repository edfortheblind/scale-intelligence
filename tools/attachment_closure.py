"""Replay the SDK attachment dependency inventory without acquiring or writing."""
from io import BytesIO
import json
from pathlib import PurePosixPath
from urllib.parse import urlsplit
import xml.etree.ElementTree as ET
import zipfile
from collector import digest, read_json, source_identity
from attachment_references import attachment_references

REPORT = 'SDK/reports/attachment-dependencies.json'
DISCOVERY_CODE = ('tools/attachment_references.py', 'tools/discover_sdk_attachments.py')


def _ordered(rows):
    return sorted(rows, key=lambda row: json.dumps(row, sort_keys=True, separators=(',', ':')))


def _local(root, relative):
    path = (root / relative).resolve()
    if not path.is_relative_to(root.resolve()):
        raise ValueError('ATTACHMENT_PATH_OUTSIDE_REPOSITORY')
    return path


def replay(store):
    """Return deterministic source-derived facts; no successful flag is trusted."""
    catalog = {r['id']: r for r in store.records('SDK')}
    references = []; diagnostics = []; sources = []; issues = []; verified = set()
    def original(record):
        raw = _local(store.root, record['local_path']).read_bytes()
        if (record['status'] != 'BODY_SAVED' or digest(raw) != record['sha256'] or
                len(raw) != record['byte_count'] or record.get('transport_metadata_verified') is not True or
                record.get('http_status') != 200):
            raise ValueError('ATTACHMENT_ORIGINAL_OR_TRANSPORT_MISMATCH: ' + record['id'])
        verified.add(record['id'])
        return raw
    for record in sorted(catalog.values(), key=lambda r: r['id']):
        if record['type'] != 'attachment':
            continue
        if record['status'] != 'BODY_SAVED':
            if record['status'] != 'INVALID_RESOLUTION':
                issues.append({'id': record['id'], 'error': 'ATTACHMENT_NOT_CAPTURED'})
            continue
        raw = original(record)
        result = attachment_references(record, raw)
        sources.append({'id': record['id'], 'source_sha256': record['sha256'],
                        'final_url': record.get('final_url') or record['source_url']})
        for diagnostic in result['diagnostics']:
            # Exact byte-level absence evidence matches discovery. Syntax is
            # preserved, and ambiguous/malformed references remain blockers.
            if record['source_url'].lower().endswith('.json') and b'$' not in raw and b'\\' not in raw:
                diagnostic.update(dependency_inventory_complete=True,
                    dependency_evidence='No dollar sign or backslash escape occurs in the original JSON example; no $ref or $id key is present. Source syntax remains unchanged.')
            diagnostics.append(diagnostic)
            if diagnostic.get('dependency_inventory_complete') is not True:
                issues.append({'id': record['id'], 'error': 'ATTACHMENT_DEPENDENCY_SCAN_INCOMPLETE'})
        # The extractor currently handles XSD/JSON. Check every captured XLSX
        # package for external relationships so a newly added workbook cannot
        # silently inherit the earlier workbook's absence evidence.
        extension = PurePosixPath(urlsplit(record.get('final_url') or record['source_url']).path).suffix.lower()
        if extension == '.xlsx':
            with zipfile.ZipFile(BytesIO(raw)) as archive:
                for part in archive.namelist():
                    if not part.endswith('.rels'):
                        continue
                    for relation in ET.fromstring(archive.read(part)):
                        if relation.get('TargetMode') == 'External':
                            issues.append({'id': record['id'], 'error': 'OOXML_EXTERNAL_RELATIONSHIP_REQUIRES_CLASSIFICATION',
                                'part': part, 'relationship_id': relation.get('Id'),
                                'relationship_type': relation.get('Type'), 'original_href': relation.get('Target')})
        for ref in result['references']:
            row = dict(ref)
            try:
                identity = source_identity(ref['original_href'], ref['effective_base'])
                if identity['module'] != 'SDK':
                    row.update(classification='deferred_cross_module', target_id=identity['id'])
                    issues.append({'error': 'ATTACHMENT_DEPENDENCY_OUTSIDE_MODULE', **row})
                elif identity['id'] == record['id']:
                    row.update(classification='same_document', target_id=record['id'], fragment=identity['fragment'])
                else:
                    target = catalog.get(identity['id'])
                    captured = bool(target and target['status'] == 'BODY_SAVED')
                    row.update(classification='internal', target_id=identity['id'], captured=captured)
                    if not captured:
                        issues.append({'error': 'ATTACHMENT_DEPENDENCY_NOT_CAPTURED', **row})
                    elif target['type'] != 'attachment':
                        issues.append({'error': 'ATTACHMENT_DEPENDENCY_TYPE_MISMATCH', **row})
                    elif target['id'] not in verified:
                        original(target)
            except ValueError as error:
                row.update(classification='outside_authorized_scope', detail=str(error))
                issues.append({'error': 'ATTACHMENT_REFERENCE_UNRESOLVED', **row})
            references.append(row)
    return {'source_generations': _ordered(sources), 'references': _ordered(references),
            'source_diagnostics': _ordered(diagnostics), 'issues': issues}


def attachment_dependency_proof(store):
    """Final-audit gate: current code, source set, original bytes and closure."""
    issues = []; proof = {'passed': False, 'path': REPORT}
    try:
        raw = _local(store.root, REPORT).read_bytes(); saved = json.loads(raw)
        code = {p: digest(_local(store.root, p).read_bytes()) for p in DISCOVERY_CODE}
        proof.update(sha256=digest(raw), code_sha256={**code,
            'tools/attachment_closure.py': digest(_local(store.root, 'tools/attachment_closure.py').read_bytes()),
            'tools/collector.py': digest(_local(store.root, 'tools/collector.py').read_bytes())})
        if saved.get('module') != 'SDK' or saved.get('code_sha256') != code:
            issues.append({'error': 'ATTACHMENT_DISCOVERY_CODE_CHANGED'})
        current = replay(store)
        for name in ('source_generations', 'references', 'source_diagnostics'):
            if _ordered(saved.get(name, [])) != current[name]:
                issues.append({'error': 'ATTACHMENT_DISCOVERY_INPUTS_CHANGED', 'field': name})
        if saved.get('fixed_point') is not True or saved.get('new_resources') != 0:
            issues.append({'error': 'ATTACHMENT_DISCOVERY_NOT_AT_FIXED_POINT'})
        if (saved.get('all_explicit_dependencies_captured') is not True or
                saved.get('dependency_scan_complete') is not True or saved.get('source_syntax_preserved') is not True or
                saved.get('missing_ids') != []):
            issues.append({'error': 'ATTACHMENT_DISCOVERY_REPORTED_GAPS'})
        issues.extend(current['issues'])
        proof.update(source_generations=current['source_generations'],
                     dependency_occurrences=len(current['references']),
                     source_syntax_diagnostics=current['source_diagnostics'])
    except (OSError, ValueError, KeyError, TypeError, ET.ParseError, zipfile.BadZipFile) as error:
        issues.append({'error': 'ATTACHMENT_CLOSURE_PROOF_UNAVAILABLE', 'detail': str(error)})
    proof.update(passed=not issues, issues=issues)
    return proof
