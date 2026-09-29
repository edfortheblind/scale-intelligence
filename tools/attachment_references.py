"""Read-only explicit dependency extraction from preserved SDK attachments."""
import json
from pathlib import PurePosixPath
from urllib.parse import urljoin, urlsplit
import xml.etree.ElementTree as ET

XSD = '{http://www.w3.org/2001/XMLSchema}'
XML_BASE = '{http://www.w3.org/XML/1998/namespace}base'


def attachment_references(record, body):
    """No file/network mutation. Re-run over newly saved dependencies to closure."""
    refs = []; diagnostics = []
    base = record.get('final_url') or record['source_url']
    extension = PurePosixPath(urlsplit(base).path).suffix.lower()
    def add(literal, locator, kind, effective_base):
        refs.append({'source_id': record['id'], 'source_sha256': record['sha256'],
                     'original_href': literal, 'effective_base': effective_base,
                     'resolved_url': urljoin(effective_base, literal),
                     'locator': locator, 'kind': kind,
                     'discovery_source': record['id'] + '@' + record['sha256'] + ':' + locator})
    def xml_walk(element, locator, inherited_base):
        effective = urljoin(inherited_base, element.get(XML_BASE, ''))
        if element.tag in {XSD + name for name in ('include', 'import', 'redefine')}:
            literal = element.get('schemaLocation')
            if literal is not None and literal.strip():
                add(literal, locator + '/@schemaLocation', 'xsd_schema_location', effective)
        for index, child in enumerate(element):
            xml_walk(child, locator + '/' + child.tag.rsplit('}', 1)[-1] + '[' + str(index + 1) + ']', effective)
    def json_walk(value, pointer, inherited_base):
        if isinstance(value, dict):
            effective = urljoin(inherited_base, value['$id']) if isinstance(value.get('$id'), str) else inherited_base
            if isinstance(value.get('$ref'), str):
                add(value['$ref'], pointer + '/$ref', 'json_ref', effective)
            for key, child in value.items():
                json_walk(child, pointer + '/' + key.replace('~', '~0').replace('/', '~1'), effective)
        elif isinstance(value, list):
            for index, child in enumerate(value):
                json_walk(child, pointer + '/' + str(index), inherited_base)
    try:
        if extension == '.xsd':
            # Do not resolve entity declarations or any external XML resource.
            if b'<!DOCTYPE' in body.upper() or b'<!ENTITY' in body.upper():
                raise ValueError('XML entity/DOCTYPE declaration requires separate inert inspection')
            xml_walk(ET.fromstring(body), '/schema', base)
        elif extension == '.json':
            json_walk(json.loads(body), '', base)
    except (ValueError, UnicodeError, ET.ParseError) as error:
        refs = []
        diagnostics.append({'code': 'SOURCE_ATTACHMENT_PARSE_DIAGNOSTIC', 'source_id': record['id'],
                            'source_sha256': record['sha256'], 'detail': str(error),
                            'original_bytes_preserved': True, 'dependency_inventory_complete': False})
    return {'references': refs, 'diagnostics': diagnostics}
