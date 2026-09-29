"""Build a lightweight local reading index from the preserved published TOC."""
import html
import os
from pathlib import Path
import re
from collector import Store,read_json,atomic_bytes,writer_lock


def main():
    root=Path(__file__).resolve().parents[1]
    runtime=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'
    with writer_lock(root,runtime):
        records={r['id']:r for r in Store(root).records('AIM')}
        toc=read_json(root/'AIM/manifests/toc.json')
        lines=['# AIM reading index','','Publication order and labels follow the preserved TOC. Availability notes below are project metadata.','']
        def walk(items,level=0):
            for item in items:
                label=re.sub(r'([\\`*{}\[\]()#+.!_>|-])',r'\\\1',html.escape(item['title'],quote=False))
                record=records.get(item.get('resource_id'))
                if record and record.get('reading_paths'):
                    fragment=item.get('bookmark') or ''
                    label='['+label+'](../../'+record['reading_paths']['markdown']+fragment+')'
                elif record:label+=' — source unavailable; see [gap report](../reports/source-gaps.md).'
                lines.append('  '*level+'- '+label)
                walk(item['children'],level+1)
        walk(toc['nodes'])
        atomic_bytes(root/'AIM/docs/INDEX.md',('\n'.join(lines)+'\n').encode('utf-8'))
        print('AIM/docs/INDEX.md: '+str(toc['node_count'])+' published navigation nodes')


if __name__=='__main__':main()
