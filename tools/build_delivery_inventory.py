"""Freeze expected corpus artifacts for a private progress-checkpoint delivery."""
import json
import os
from pathlib import Path
from collector import atomic_json, digest, now, writer_lock, read_json


def build(root):
    from module_policy import required_acceptance_paths
    from sdk_delivery_authority import required_sdk_authority_paths
    root=Path(root).resolve()
    files=[]
    for module in ('AIM','SDK'):
        # Interrupted atomic writes are explicitly uncommitted recovery leftovers.
        files.extend(p for p in (root/module).rglob('*') if p.is_file() and not p.name.startswith('.pending-'))
    files.extend(root/p for p in ('01_AIM_MASTER_PROMPT.md','02_SDK_MASTER_PROMPT.md',
        '_project/preflight.json','_project/search-index.json','_project/search.sqlite'))
    state_path=root/'_project/STATE.json'
    state=read_json(state_path) if state_path.is_file() else {}
    files.extend(root/p for p in required_acceptance_paths(state))
    files.extend(root/p for p in required_sdk_authority_paths(state))
    entries=[]
    for path in sorted(set(files)):
        raw=path.read_bytes()
        entries.append({'path':path.relative_to(root).as_posix(),'byte_count':len(raw),'sha256':digest(raw)})
    result={'schema_version':1,'created_at':now(),'file_count':len(entries),
        'scope':'All AIM and SDK corpus artifacts plus original prompts, preflight, search index, and required AIM acceptance and SDK acquisition authority. Coverage remains separate.',
        'files':entries}
    atomic_json(root/'_project/artifact-inventory.json',result)
    return result


if __name__=='__main__':
    root=Path(__file__).resolve().parents[1]
    runtime=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'
    with writer_lock(root,runtime):
        result=build(root)
        print(json.dumps({'file_count':result['file_count'],'complete_corpus_delivered':False}))
