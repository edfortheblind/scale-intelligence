"""Verify all captured originals and decode required images offline without changing bytes."""
from functools import partial
from http.server import ThreadingHTTPServer
from io import BytesIO
import json
import os
from pathlib import Path
import threading
from urllib.parse import urlsplit
import zipfile
from playwright.sync_api import sync_playwright
from collector import Store,atomic_json,digest,now,writer_lock
from verify_pilot import QuietHandler


def main():
    root=Path(__file__).resolve().parents[1]
    runtime=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'
    with writer_lock(root,runtime) as owner:
        store=Store(root,cache_records=True)
        records=[r for r in store.records('AIM') if r['status']=='BODY_SAVED']
        integrity=store.verify();issues=list(integrity['failures'])
        attachments=[]
        for record in records:
            if not record.get('transport_metadata_verified') or record.get('http_status')!=200:
                issues.append({'id':record['id'],'error':'TRANSPORT_METADATA_MISSING'})
            if record['type']!='attachment':continue
            body=(root/record['local_path']).read_bytes()
            suffix=Path(urlsplit(record['source_url']).path).suffix.lower()
            valid=True;check='original_hash_and_transport'
            if suffix=='.pdf':valid=body.startswith(b'%PDF-') and b'%%EOF' in body[-2048:];check='pdf_signature_and_eof'
            elif suffix=='.xlsx':
                check='xlsx_zip_directory_and_crc'
                with zipfile.ZipFile(BytesIO(body)) as archive:
                    total=sum(f.file_size for f in archive.infolist())
                    valid=total<=100*1024*1024 and '[Content_Types].xml' in archive.namelist()
                    if valid:valid=archive.testzip() is None
            elif suffix=='.txt':
                check='text_decoding'
                try:body.decode(record.get('encoding') or 'utf-8-sig',errors='strict')
                except UnicodeError:valid=False
            if not valid:issues.append({'id':record['id'],'error':'ATTACHMENT_FORMAT_VALIDATION'})
            attachments.append({'id':record['id'],'sha256':record['sha256'],'check':check,'passed':valid})
        images=[r for r in records if r['type']=='image']
        server=ThreadingHTTPServer(('127.0.0.1',0),partial(QuietHandler,directory=str(root)))
        thread=threading.Thread(target=server.serve_forever,daemon=True);thread.start()
        origin='http://127.0.0.1:'+str(server.server_port)
        decoded=[];denied=[]
        try:
            with sync_playwright() as p:
                browser=p.chromium.launch(channel='msedge',headless=True,chromium_sandbox=True)
                try:
                    context=browser.new_context()
                    def allow_local(route):
                        if route.request.url.startswith(origin+'/'):route.continue_()
                        else:denied.append(route.request.url);route.abort()
                    context.route('**/*',allow_local)
                    page=context.new_page()
                    page.goto(origin+'/',wait_until='domcontentloaded',timeout=15000)
                    for offset in range(0,len(images),20):
                        batch=images[offset:offset+20]
                        result=page.evaluate('''async entries => await Promise.all(entries.map(async e => {
                            const img=new Image(); img.src=e.url;
                            try { await Promise.race([img.decode(),new Promise((_,reject)=>setTimeout(()=>reject(new Error('decode timeout')),10000))]); return {id:e.id,width:img.naturalWidth,height:img.naturalHeight,decoded:true}; }
                            catch {return {id:e.id,decoded:false};}
                        }))''',[{'id':r['id'],'url':origin+'/'+r['local_path']} for r in batch])
                        decoded.extend(result)
                        print(json.dumps({'images_checked':len(decoded),'images_total':len(images)}),flush=True)
                        for item in result:
                            if not item['decoded'] or not item.get('width') or not item.get('height'):
                                issues.append({'id':item['id'],'error':'IMAGE_DECODING_FAILED'})
                finally:browser.close()
        finally:server.shutdown();server.server_close();thread.join()
        if denied:issues.append({'error':'EXTERNAL_REQUEST_ATTEMPTED','count':len(denied)})
        catalog={r['id']:r for r in images}
        for item in decoded:
            record=catalog[item['id']]
            item['sha256']=record['sha256']
            if item['decoded']:
                record['dimensions']={'width':item['width'],'height':item['height']}
                store.save_record(record)
        report={'checked_at':now(),'module':'AIM','status':'PASSED' if not issues else 'FAILED',
                'original_byte_integrity':integrity,'images':decoded,'attachments':attachments,'issues':issues,
                'scope':'Captured originals only. Unavailable source resources remain coverage gaps.'}
        atomic_json(root/'AIM/reports/resource-fidelity.json',report)
        store.checkpoint(owner,worker_running=False)
        print(json.dumps({'status':report['status'],'saved_originals':len(records),'images':len(decoded),'attachments':len(attachments),'issues':issues}),flush=True)
    return 0 if not issues else 1


if __name__=='__main__':raise SystemExit(main())
