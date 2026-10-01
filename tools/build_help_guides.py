"""Build/check fingerprints for the explicitly reviewed procedure guide collection."""
import argparse
import json

from help_guides import MANIFEST, ROOT, make_manifest


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    result = make_manifest()
    path = ROOT/MANIFEST
    if args.check:
        if json.loads(path.read_text(encoding='utf-8')) != result:
            raise SystemExit('Guide manifest differs from the current reviewed files.')
    else:
        path.write_text(json.dumps(result, indent=2)+'\n', encoding='utf-8', newline='\n')
    print(json.dumps({'guides': len(result['guides']), 'cited_sources': len(result['sources']), 'evidence_files': len(result['evidence']), 'check': args.check}))
