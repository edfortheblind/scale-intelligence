"""Immutable inputs for browser evidence; mutable audit flags are excluded."""
import json
import subprocess
from collector import digest, read_json

RENDER_SEMANTICS = ('article_data.py','style_data.py','documentary_states.py',
    'verify_states.py','verify_pilot.py','reading_audit.py','collector.py','static_data.py')


def value_hash(value):
    return digest(json.dumps(value,sort_keys=True,separators=(',',':')).encode())


def render_inputs(store):
    """Conservatively bind all originals, reading HTML, CSS and verifier code.

    This includes every recursive support dependency, including resources shared
    by pages without documentary controls. Hash actual bytes, not manifest claims.
    """
    paths=set()
    for record in store.records('AIM'):
        if record['status']!='BODY_SAVED':continue
        paths.add(record['local_path'])
        if record['type']=='article':paths.add(record['reading_paths']['html'])
        elif record['type']=='stylesheet':
            data=read_json(store.root/'AIM/data/stylesheets'/(record['id']+'.json'))
            paths.add(data['rendered_path'])
    paths.update('tools/'+name for name in RENDER_SEMANTICS)
    entries=[]
    for relative in sorted(paths):
        path=(store.root/relative).resolve()
        if not path.is_relative_to(store.root):raise ValueError('Render input outside repository')
        raw=path.read_bytes()
        entries.append({'path':relative,'byte_count':len(raw),'sha256':digest(raw)})
    return {'schema_version':1,'scope':'All captured AIM originals, reading HTML, recursive support bytes, and execution semantics',
            'files':entries,'sha256':value_hash(entries)}


def bound_report_current(store,name,inputs):
    path=store.root/'AIM/reports'/(name+'.json')
    binding_path=store.root/'AIM/reports'/(name+'-binding.json')
    if not path.is_file() or not binding_path.is_file():return False
    binding=read_json(binding_path)
    return (binding.get('schema_version')==1 and binding.get('status')=='PASSED'
        and binding.get('report_sha256')==digest(path.read_bytes())
        and binding.get('inputs',{}).get('sha256')==inputs['sha256']
        and binding.get('inputs',{}).get('files')==inputs['files'])


def immutable_equivalence(root,commit,inputs,report_path=None):
    """Require byte identity with an immutable commit before adopting old proof."""
    resolved=subprocess.check_output(['git','rev-parse',commit+'^{commit}'],cwd=root,text=True).strip()
    listing=subprocess.check_output(['git','ls-tree','-r','-z',resolved],cwd=root)
    blobs={}
    for entry in listing.split(b'\0'):
        if not entry:continue
        metadata,path=entry.split(b'\t',1)
        blobs[path.decode()]=metadata.split()[2].decode()
    entries=list(inputs['files'])
    if report_path:
        raw=(root/report_path).read_bytes()
        entries.append({'path':report_path,'sha256':digest(raw),'byte_count':len(raw)})
    issues=[]
    process=subprocess.Popen(['git','cat-file','--batch'],cwd=root,stdin=subprocess.PIPE,stdout=subprocess.PIPE)
    try:
        for entry in entries:
            blob=blobs.get(entry['path'])
            if not blob:issues.append({'path':entry['path'],'error':'ABSENT_FROM_IMMUTABLE_CHECKPOINT'});continue
            process.stdin.write((blob+'\n').encode());process.stdin.flush()
            header=process.stdout.readline().split()
            raw=process.stdout.read(int(header[2]));process.stdout.read(1)
            if len(raw)!=entry['byte_count'] or digest(raw)!=entry['sha256']:
                issues.append({'path':entry['path'],'error':'CHANGED_SINCE_IMMUTABLE_CHECKPOINT'})
    finally:
        process.stdin.close();process.stdout.close();process.wait()
    return {'commit':resolved,'report_blob':blobs.get(report_path),'compared_files':len(entries),
            'passed':not issues,'issues':issues}
