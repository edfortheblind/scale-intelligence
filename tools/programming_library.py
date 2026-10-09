"""Read-only identifier lookup over the existing, sealed programming exports."""
from collections import Counter
import hashlib
import json
from pathlib import Path
import re

from build_programming_layout import SNAPSHOT_ID, verify_artifact_manifest

ROOT = Path(__file__).resolve().parents[1]
KINDS = {'P': 'procedure', 'FN': 'function', 'IF': 'function', 'TF': 'function', 'U': 'table'}
FOLDERS = {'procedure': 'SP layout', 'function': 'function layout', 'table': 'table layout'}
SCOPE = ('Captured September 29, 2026. This reference documents source and schema; '
         'current deployment, executed access and vendor-base ownership are not established. '
         'Table layouts contain captured metadata, not complete replayable DDL.')
PAGE_SIZE = 50


class ProgrammingUnavailable(RuntimeError):
    """A missing or changed export must not become an unverified source view."""


class ProgrammingLibrary:
    def __init__(self, root=ROOT):
        self.root = Path(root).resolve() / 'DB Architecture'
        checked = verify_artifact_manifest(self.root)
        if checked['status'] != 'PASS':
            raise ProgrammingUnavailable('Programming exports failed integrity verification.')
        raw = (self.root / 'evidence/programming-layout-manifest.json').read_bytes()
        self.manifest_sha256 = hashlib.sha256(raw).hexdigest()
        if self.manifest_sha256 != checked['output_manifest_sha256']:
            raise ProgrammingUnavailable('Programming manifest changed while loading.')
        self.files = {item['path']: item for item in json.loads(raw)}
        self.objects = {}
        for relative in sorted(self.files):
            folder, filename = relative.split('/')
            if not re.fullmatch(r'[0-9]+\.json', filename):
                continue
            record = json.loads(self._read(relative))
            identity = record.get('identity', record.get('object', {}))
            oid = str(identity['object_id'])
            kind = KINDS[identity['type'].strip()]
            if (record['snapshot_id'] != SNAPSHOT_ID or filename != oid + '.json'
                    or FOLDERS[kind] != folder or oid in self.objects):
                raise ProgrammingUnavailable('Inconsistent programming object identity.')
            extensions = ('md', 'json') if kind == 'table' else ('md', 'json', 'sql')
            if any(folder + '/' + oid + '.' + ext not in self.files for ext in extensions):
                raise ProgrammingUnavailable('Incomplete programming object exports.')
            columns = record['raw_catalog_records']['columns'] if kind == 'table' else []
            self.objects[oid] = {
                'object_id': identity['object_id'], 'name': identity['name'],
                'qualified_name': identity['schema_name'] + '.' + identity['name'],
                'kind': kind, 'folder': folder, 'columns': [c['name'] for c in columns],
            }
        self.counts = dict(Counter(row['kind'] for row in self.objects.values()))

    def _read(self, relative):
        item = self.files[relative]
        path = self.root / relative
        try:
            if path.is_symlink() or not path.resolve().is_relative_to(self.root):
                raise ProgrammingUnavailable('Programming export location changed.')
            raw = path.read_bytes()
        except OSError as exc:
            raise ProgrammingUnavailable('Programming export is unavailable.') from exc
        if len(raw) != item['bytes'] or hashlib.sha256(raw).hexdigest() != item['sha256']:
            raise ProgrammingUnavailable('Programming export changed; verify and restart the preview.')
        return raw

    def artifact(self, oid, extension):
        row = self.objects[oid]
        if extension not in {'md', 'json', 'sql'} or (extension == 'sql' and row['kind'] == 'table'):
            raise KeyError(extension)
        return self._read(row['folder'] + '/' + oid + '.' + extension)

    def record(self, oid):
        return json.loads(self.artifact(oid, 'json'))

    def search(self, query='', kind='all', page=1):
        if len(query) > 200:
            raise ValueError('Use an identifier of 200 characters or fewer.')
        if kind not in {'all', *FOLDERS}:
            raise ValueError('Choose all, procedure, function or table.')
        if type(page) is not int or page < 1:
            raise ValueError('Use a positive page number.')
        needle = query.strip().casefold()
        # Only SQL's complete bracketed identifier forms receive normalization.
        bracketed = re.fullmatch(r'\[([^\[\]]+)\](?:\.\[([^\[\]]+)\])?', needle)
        if bracketed:
            needle = '.'.join(part for part in bracketed.groups() if part is not None)
        found = []
        for row in self.objects.values():
            if kind != 'all' and row['kind'] != kind:
                continue
            name, qualified = row['name'].casefold(), row['qualified_name'].casefold()
            columns = [c for c in row['columns'] if needle and needle in c.casefold()]
            if not needle:
                rank, reason = 0, 'Captured object'
            elif needle in {name, qualified, str(row['object_id'])}:
                rank, reason = 0, 'Exact object identifier'
            elif name.startswith(needle) or qualified.startswith(needle):
                rank, reason = 1, 'Object name prefix'
            elif needle in qualified:
                rank, reason = 2, 'Object name contains identifier'
            elif columns:
                rank = 3 if any(c.casefold() == needle for c in columns) else 4
                reason = 'Captured table column'
            else:
                continue
            found.append((rank, qualified, row['object_id'], {
                **{key: row[key] for key in ('object_id', 'qualified_name', 'kind')},
                'match_reason': reason, 'matched_columns': columns,
                'href': '/programming/object/' + str(row['object_id']) + '#programming-object',
            }))
        found.sort(key=lambda item: item[:3])
        pages = max(1, (len(found) + PAGE_SIZE - 1) // PAGE_SIZE)
        if page > pages:
            raise ValueError('Page is outside the matching results.')
        start = (page - 1) * PAGE_SIZE
        return {'snapshot_id': SNAPSHOT_ID, 'manifest_sha256': self.manifest_sha256,
                'scope': SCOPE, 'query': query, 'kind': kind, 'page': page,
                'pages': pages, 'page_size': PAGE_SIZE, 'total': len(found),
                'counts': self.counts, 'results': [r[3] for r in found[start:start + PAGE_SIZE]]}
