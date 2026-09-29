"""Run the unchanged state verifier and bind its entire immutable input generation."""
import os
from pathlib import Path
import subprocess
import sys
from collector import Store,atomic_json,digest,now,writer_lock
from proof_inputs import render_inputs


def main():
    root=Path(__file__).resolve().parents[1]
    before=render_inputs(Store(root,cache_records=True))
    result=subprocess.run([sys.executable,'-B',str(root/'tools/verify_states.py')],cwd=root)
    if result.returncode:return result.returncode
    runtime=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'
    with writer_lock(root,runtime):
        after=render_inputs(Store(root,cache_records=True))
        if before!=after:raise ValueError('State verification inputs changed during execution')
        path=root/'AIM/reports/documentary-states.json'
        atomic_json(root/'AIM/reports/documentary-states-binding.json',{
            'schema_version':1,'status':'PASSED','checked_at':now(),'method':'verified_execution_with_stable_inputs',
            'report_sha256':digest(path.read_bytes()),'inputs':after})
    return 0


if __name__=='__main__':raise SystemExit(main())
