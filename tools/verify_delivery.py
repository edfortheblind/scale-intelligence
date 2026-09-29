"""Verify a checkpoint or clean clone; never infer complete corpus coverage."""
import argparse
import json
from pathlib import Path
from collector import Store, digest, read_json


def verify(root):
    store=Store(root)
    failures=[]
    checked={'source_files':0,'reading_files':0,'app_documents':0,'prompts':0}
    def check(relative,sha,kind):
        path=(store.root/relative).resolve()
        if not path.is_relative_to(store.root) or not path.is_file() or digest(path.read_bytes())!=sha:
            failures.append({'path':relative,'error':'HASH_MISMATCH_OR_MISSING'})
        else:checked[kind]+=1
    preflight=store.root/'_project/preflight.json'
    if preflight.exists():
        for prompt in read_json(preflight)['prompt_inputs']:
            check(prompt['path'],prompt['sha256'],'prompts')
    for module in ('AIM','SDK'):
        for path in (store.root/module/'source').rglob('*'):
            if path.is_file() and len(path.stem)==64:
                check(path.relative_to(store.root).as_posix(),path.stem,'source_files')
        for record in store.records(module):
            if record.get('local_path'):
                path=store.root/record['local_path']
                if not path.is_file() or digest(path.read_bytes())!=record['sha256']:
                    failures.append({'id':record['id'],'error':'RESOURCE_ORIGINAL_INVALID'})
            for prior in record.get('prior_bodies',[]):
                path=store.root/prior['local_path']
                if not path.is_file() or digest(path.read_bytes())!=prior['sha256']:
                    failures.append({'id':record['id'],'error':'PRIOR_ORIGINAL_INVALID'})
            if record.get('app_data_path'):
                path=store.root/record['app_data_path']
                if not path.is_file():
                    failures.append({'id':record['id'],'error':'APP_DOCUMENT_MISSING'});continue
                data=read_json(path)
                if data['source']['sha256']!=record['sha256']:
                    failures.append({'id':record['id'],'error':'APP_DOCUMENT_STALE'})
                for kind in ('html','markdown'):
                    check(data['reading'][kind],data['reading'][kind+'_sha256'],'reading_files')
                checked['app_documents']+=1
    index=store.root/'_project/search-index.json'
    if index.exists():
        metadata=read_json(index)
        path=store.root/metadata['database']
        if not path.exists() or digest(path.read_bytes())!=metadata['sha256']:
            failures.append({'error':'SEARCH_INDEX_HASH_MISMATCH'})
    return {'checkpoint_integrity_passed':not failures,'checked':checked,'failures':failures,
            'complete_corpus_delivered':False,'scope':'Artifact fidelity for this checkpoint only; coverage and final project gates remain separate.'}


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root',type=Path,default=Path(__file__).resolve().parents[1])
    args=parser.parse_args()
    result=verify(args.root)
    print(json.dumps(result,indent=2))
    raise SystemExit(0 if result['checkpoint_integrity_passed'] else 1)
