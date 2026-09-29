"""Discover published CSS dependencies and emit local inert stylesheet copies."""
import os
from pathlib import Path
import re
import json
from urllib.parse import urljoin
from collector import Store, source_identity, atomic_json, atomic_bytes, digest, writer_lock
from article_data import classify_href

URL = re.compile(r'url\(\s*(?:"([^"]*)"|\x27([^\x27]*)\x27|([^\s\)]+))\s*\)',re.I)
IMPORT = re.compile(r'@import\s+(?:"([^"]+)"|\x27([^\x27]+)\x27)',re.I)


def css_references(source):
    # Keep offsets by blanking comments rather than removing them.
    text=re.sub(r'/\*[\s\S]*?\*/',lambda m:' '*len(m[0]),source)
    for pattern in (URL,IMPORT):
        for match in pattern.finditer(text):
            group=next(i for i,value in enumerate(match.groups(),1) if value is not None)
            yield match.start(group),match.end(group),match[group],pattern is IMPORT


def convert_styles(store,module):
    records=store.records(module)
    report=[]
    for record in records:
        if record['type']!='stylesheet' or not record.get('local_path'):continue
        raw=(store.root/record['local_path']).read_bytes()
        if digest(raw)!=record['sha256']:raise ValueError('CSS_SOURCE_HASH_MISMATCH')
        source=raw.decode(record.get('encoding') or 'utf-8-sig',errors='strict')
        refs=[]
        for start,end,href,is_import in css_references(source):
            item={'original_href':href,'start':start,'end':end,'source_id':record['id'],'source_sha256':record['sha256']}
            boundary=max(source.rfind(';',0,start),source.rfind('{',0,start),source.rfind('}',0,start))
            declaration=re.sub(r'/\*[\s\S]*?\*/','',source[boundary+1:start])
            property_name=declaration.split(':',1)[0].strip().lower()
            item['property']=property_name
            if property_name.startswith('@namespace'):
                item.update(classification='namespace_identifier',required_for_inert_view=False,
                            reason='A CSS namespace URI identifies a vocabulary; it is not a network dependency.')
            elif property_name.startswith('-pie-') or property_name in ('behavior','-moz-binding'):
                # These are legacy executable/polyfill declarations, not standard CSS URL
                # requests. Do not pretend the stylesheet-relative URL is their target.
                item.update(classification='legacy_opaque_reference',required_for_inert_view=False,
                            reason='Preserved in original CSS; legacy polyfill is never executed.')
                wrong=source_identity(href,record['source_url'])
                wrong_path=store.root/module/'manifests/resources'/(wrong['id']+'.json')
                if wrong_path.exists():
                    previous=json.loads(wrong_path.read_text(encoding='utf-8'))
                    if previous.get('status')=='FAILED' and all(':css:' in x.get('discovery_source','') for x in previous['occurrences']):
                        previous.update(status='INVALID_RESOLUTION',discovery_correction={
                            'class':'COLLECTOR_CSS_BASE_ERROR','source_id':record['id'],'source_sha256':record['sha256'],
                            'detail':'Earlier parser treated a legacy opaque declaration as a standard stylesheet-relative fetch. Original failure retained as history.'})
                        store.save_record(previous)
            elif href.startswith(('data:','#')):
                item['classification']='embedded_or_fragment'
            else:
                try:
                    identity=source_identity(href,record['source_url'])
                    kind='stylesheet' if is_import else classify_href(href)
                    if identity['module']!=module or kind=='unclassified':
                        item['classification']='review_required'
                    else:
                        target=store.discover(module,href,record['source_url'],record['id']+'@'+record['sha256']+':css:'+str(start),kind)
                        item.update(classification='internal',target_id=target['id'],kind=kind,
                                    local_path=target.get('local_path'),captured=bool(target.get('transport_metadata_verified')))
                except ValueError as error:
                    item.update(classification='out_of_scope_dependency',reason=str(error))
            refs.append(item)
        rewritten=source
        for ref in sorted(refs,key=lambda r:r['start'],reverse=True):
            target=None
            if ref['classification']=='internal':
                if ref['kind']=='stylesheet':target=ref['target_id']+'.css'
                elif ref.get('local_path'):target='../../'+ref['local_path'].split('/',1)[1]
            elif ref['classification'] in ('embedded_or_fragment','namespace_identifier'):target=ref['original_href']
            rewritten=rewritten[:ref['start']]+(target or '')+rewritten[ref['end']:]
        rewritten=re.sub(r'(?:-pie-[\w-]+|behavior|-moz-binding)\s*:[^;{}]*(?:;|(?=}))','',rewritten,flags=re.I)
        unsafe=bool(re.search(r'expression\s*\(|behavior\s*:|-moz-binding',rewritten,re.I))
        if unsafe:
            # Preserve the original, but never load this derivative.
            rewritten='/* Source stylesheet requires static review before rendering. */'
        output=module+'/reading/assets/'+record['id']+'.css'
        atomic_bytes(store.root/output,rewritten.encode('utf-8'))
        result={'id':record['id'],'source_sha256':record['sha256'],'references':refs,'rendered_path':output,
                'rendered_sha256':digest(rewritten.encode('utf-8')),'unsafe_css_detected':unsafe,
                'direct_dependencies_captured':all(r['classification'] in ('embedded_or_fragment','legacy_opaque_reference','namespace_identifier') or r.get('captured',False) for r in refs)}
        atomic_json(store.root/module/'data/stylesheets'/(record['id']+'.json'),result)
        report.append({'id':record['id'],'dependencies':len(refs),'pending':sum(r['classification'] not in ('embedded_or_fragment','legacy_opaque_reference','namespace_identifier') and not r.get('captured') for r in refs)})
    return report


if __name__=='__main__':
    root=Path(__file__).resolve().parents[1]
    runtime=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'
    with writer_lock(root,runtime) as owner:
        store=Store(root)
        print(json.dumps(convert_styles(store,'AIM')))
        store.checkpoint(owner)
