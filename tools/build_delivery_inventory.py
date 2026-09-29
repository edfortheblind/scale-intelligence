"""Freeze expected corpus artifacts for a private progress-checkpoint delivery."""
import json
import os
from pathlib import Path
from collector import atomic_json, digest, now, writer_lock


def build(root):
    root=Path(root).resolve()
    files=[]
    for module in ('AIM','SDK'):
        files.extend(p for p in (root/module).rglob('*') if p.is_file())
    files.extend(root/p for p in ('01_AIM_MASTER_PROMPT.md','02_SDK_MASTER_PROMPT.md',
        '_project/preflight.json','_project/search-index.json','_project/search.sqlite'))
    entries=[]
    for path in sorted(set(files)):
        raw=path.read_bytes()
        entries.append({'path':path.relative_to(root).as_posix(),'byte_count':len(raw),'sha256':digest(raw)})
    result={'schema_version':1,'created_at':now(),'file_count':len(entries),
        'scope':'All AIM and SDK corpus artifacts plus original prompts, preflight and search index. Coverage remains separate.',
        'files':entries}
    atomic_json(root/'_project/artifact-inventory.json',result)
    return result


if __name__=='__main__':
    root=Path(__file__).resolve().parents[1]
    runtime=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'
    with writer_lock(root,runtime):
        result=build(root)
        print(json.dumps({'file_count':result['file_count'],'complete_corpus_delivered':False}))
