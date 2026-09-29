"""Bind historical state evidence only after exact immutable-checkpoint comparison."""
import argparse
import json
import os
from pathlib import Path
from collector import Store,atomic_json,read_json,digest,now,writer_lock
from proof_inputs import render_inputs,immutable_equivalence


def main(commit):
    root=Path(__file__).resolve().parents[1]
    runtime=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'
    with writer_lock(root,runtime):
        inputs=render_inputs(Store(root,cache_records=True))
        relative='AIM/reports/documentary-states.json';path=root/relative
        proof=read_json(path)
        if proof.get('status')!='PASSED':raise ValueError('Cannot adopt failed historical evidence')
        evidence=immutable_equivalence(root,commit,inputs,relative)
        if not evidence['passed']:
            print(json.dumps(evidence));return 1
        atomic_json(root/'AIM/reports/documentary-states-binding.json',{
            'schema_version':1,'status':'PASSED','checked_at':now(),
            'method':'historical_proof_with_exact_immutable_input_equivalence',
            'historical_report_preserved':True,'immutable_evidence':evidence,
            'report_sha256':digest(path.read_bytes()),'inputs':inputs})
        print(json.dumps({'status':'PASSED','input_files':len(inputs['files']),'immutable_evidence':evidence}))
    return 0


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--commit',required=True)
    raise SystemExit(main(parser.parse_args().commit))
