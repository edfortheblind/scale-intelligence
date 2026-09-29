"""Build source-ordered SDK reading navigation without inventing article content."""
import html
import json
import os
from pathlib import Path
import re
from collector import Store,read_json,atomic_bytes,atomic_json,writer_lock,digest


def build(store):
    records={r['id']:r for r in store.records('SDK')}
    toc=read_json(store.root/'SDK/manifests/toc.json')
    index=read_json(store.root/'SDK/manifests/index.json')
    membership=read_json(store.root/'SDK/manifests/discovery-membership.json')
    occurrences=[]
    def label(value):
        escaped=re.sub(r'([\\`*{}\[\]()#+.!_>|-])',r'\\\1',html.escape(value,quote=False))
        return re.sub(r'[ \t]+$',lambda match:''.join('&#'+str(ord(char))+';' for char in match[0]),escaped)
    def destination(identifier,fragment=''):
        record=records.get(identifier)
        if record and record.get('reading_paths'):
            return '../../'+record['reading_paths']['markdown']+('#'+fragment.lstrip('#') if fragment else '')
        return None
    lines=['# SDK reading index','','TOC order and labels follow the original publication. Availability notes are collector metadata.','']
    def walk(entries,depth=0):
        for item in entries:
            identifier=item.get('resource_id');link=destination(identifier,item.get('bookmark') or '')
            text=label(item['title'])
            if link:text='['+text+']('+link+')'
            elif identifier:text+=' — '+('source unavailable' if records.get(identifier,{}).get('status')=='FAILED' else 'queued for collection or verification')
            lines.append('  '*depth+'- '+text)
            occurrences.append({'source_entry':item['id'],'resource_id':identifier,'depth':depth,'reading_href':link})
            walk(item['children'],depth+1)
    walk(toc['nodes'])
    lines+=['','## Published index destinations outside the TOC','']
    seen=set(membership['toc'])
    def supplement(entries):
        for item in entries:
            identifier=item.get('resource_id')
            if identifier and identifier not in seen:
                seen.add(identifier);link=destination(identifier)
                lines.append('- '+('['+label(item['title'])+']('+link+')' if link else label(item['title'])+' — queued for collection or verification'))
            supplement(item['children'])
    supplement(index['nodes'])
    lines+=['','## Published search destinations outside the TOC and index','']
    for identifier in membership['search']:
        if identifier in seen:continue
        record=records[identifier];link=destination(identifier);title=record.get('title') or next(iter(record.get('titles',[])),record['source_url'].rsplit('/',1)[-1])
        lines.append('- '+('['+label(title)+']('+link+')' if link else label(title)+' — queued for collection or verification'))
    raw=('\n'.join(lines)+'\n').encode()
    atomic_bytes(store.root/'SDK/docs/INDEX.md',raw)
    def html_entries(entries):
        output=['<ul>']
        for item in entries:
            record=records.get(item.get('resource_id'),{})
            title=html.escape(item['title'])
            if record.get('reading_paths'):
                fragment=item.get('bookmark') or ''
                target=record['id']+'.html'+('#'+fragment.lstrip('#') if fragment else '')
                title='<a href="'+html.escape(target,quote=True)+'">'+title+'</a>'
            output.append('<li>'+title+html_entries(item['children'])+'</li>')
        output.append('</ul>')
        return ''.join(output) if entries else ''
    page='<!doctype html><html lang="en"><head><meta charset="utf-8"><meta http-equiv="Content-Security-Policy" content="default-src \'none\'; style-src \'unsafe-inline\'; base-uri \'none\'; form-action \'none\'"><title>SDK reading index</title><style>body{max-width:80rem;margin:2rem auto;font:16px/1.5 system-ui}li{margin:.2rem 0}</style></head><body><h1>SDK reading index</h1><p>Original publication labels and order. Links open available reading copies; unlinked destinations remain queued or unavailable.</p><h2>Contents</h2>'+html_entries(toc['nodes'])+'<h2>Published index</h2>'+html_entries(index['nodes'])+'</body></html>'
    atomic_bytes(store.root/'SDK/reading/index.html',page.encode())
    report={'schema_version':1,'module':'SDK','path':'SDK/docs/INDEX.md','sha256':digest(raw),'toc_nodes':len(occurrences),
        'html_path':'SDK/reading/index.html','html_sha256':digest(page.encode()),
        'occurrences':occurrences,'inputs':{p:digest((store.root/p).read_bytes()) for p in ('SDK/manifests/toc.json','SDK/manifests/index.json','SDK/manifests/discovery-membership.json')},
        'scope':'Original navigation labels and hierarchy with local reading destinations when captured. Availability does not imply source completeness.'}
    atomic_json(store.root/'SDK/reports/local-navigation.json',report)
    return report


if __name__=='__main__':
    root=Path(__file__).resolve().parents[1]
    with writer_lock(root,Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'):
        result=build(Store(root,cache_records=True))
        print(json.dumps({'path':result['path'],'toc_nodes':result['toc_nodes']}))
