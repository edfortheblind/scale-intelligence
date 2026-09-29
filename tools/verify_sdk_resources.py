"""Verify all captured SDK originals, images and attachment formats; no network."""
import json,os,sys
from pathlib import Path
root=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(root/'tools'))
from collector import Store,writer_lock,atomic_json,now,digest
from verify_sdk import decode_images,attachment_check
with writer_lock(root,Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime') as owner:
    store=Store(root,cache_records=True);records=[r for r in store.records('SDK') if r['status']=='BODY_SAVED']
    integrity=store.verify(module='SDK');issues=list(integrity['failures'])
    image_issues,images=decode_images(root,[r for r in records if r['type']=='image']);issues.extend(image_issues)
    attachments=[attachment_check(r,(root/r['local_path']).read_bytes()) for r in records if r['type']=='attachment']
    issues.extend({'id':a['id'],'error':'ATTACHMENT_FORMAT_FAILED'} for a in attachments if not a['passed'])
    for r in records:
        if not r.get('transport_metadata_verified') or r.get('http_status')!=200:issues.append({'id':r['id'],'error':'TRANSPORT_METADATA_MISSING'})
    report={'checked_at':now(),'module':'SDK','status':'PASSED' if not issues else 'FAILED','original_byte_integrity':integrity,
        'images':images,'attachments':attachments,'issues':issues,'scope':'Captured SDK originals only; missing source resources remain separate failures.',
        'verification_code_sha256':digest((root/'tools/verify_sdk.py').read_bytes()),
        'resource_verifier_sha256':digest(Path(__file__).read_bytes())}
    atomic_json(root/'SDK/reports/resource-fidelity.json',report)
    print(json.dumps({'saved_originals':len(records),'images_decoded':len(images),'attachments':len(attachments),'issues':issues}))
    raise SystemExit(1 if issues else 0)
