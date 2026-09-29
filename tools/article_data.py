"""Deterministic source-to-app records and inert reading copies; never execute source."""
import argparse
from collections import Counter
import copy
import html
from html.parser import HTMLParser
import json
import os
from pathlib import Path
import re
from urllib.parse import urljoin, urlsplit
from collector import Store, ROOTS, source_identity, digest, atomic_bytes, atomic_json, writer_lock, now, VERSION

SCHEMA = 1
CONVERTER = 'aim-static-2'
VOID = set('area base br col embed hr img input link meta param source track wbr'.split())
SAFE_TAGS = set(('a abbr address article aside b bdi bdo blockquote br caption cite code col colgroup dd del details dfn div dl dt em '
                 'figcaption figure h1 h2 h3 h4 h5 h6 header hr i img ins kbd li main map area mark nav ol p pre q s samp section '
                 'small span strong sub summary sup table tbody td tfoot th thead time tr u ul var wbr').split())
SAFE_ATTRS = set('id name class title alt width height colspan rowspan headers scope start reversed type value lang dir align valign border cellpadding cellspacing usemap shape coords role aria-label'.split())
SKIP_TAGS = {'script', 'style'}
CHROME_CLASSES = {'MCWebHelpFramesetLink', 'MCBreadcrumbsBox_0', 'MCBreadcrumbsBox'}


class TreeParser(HTMLParser):
    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.root = {'tag':'#document','attrs':{},'children':[], 'node_id':'document'}
        self.stack = [self.root]
        self.serial = 0
        self.errors = []

    def handle_starttag(self, tag, attrs):
        self.serial += 1
        node = {'tag':tag,'attrs':dict(attrs),'children':[], 'node_id':'n' + str(self.serial)}
        self.stack[-1]['children'].append(node)
        if tag not in VOID:
            self.stack.append(node)

    def handle_startendtag(self, tag, attrs):
        self.handle_starttag(tag, attrs)
        if tag not in VOID:
            self.handle_endtag(tag)

    def handle_endtag(self, tag):
        for index in range(len(self.stack)-1, 0, -1):
            if self.stack[index]['tag'] == tag:
                if index != len(self.stack)-1:
                    self.errors.append({'class':'IMPLICIT_CLOSE','tag':tag,'open_tags':[n['tag'] for n in self.stack[index+1:]]})
                self.stack = self.stack[:index]
                return
        if tag not in VOID:
            self.errors.append({'class':'UNMATCHED_CLOSE','tag':tag})

    def handle_data(self, data):
        if self.stack[-1]['children'] and isinstance(self.stack[-1]['children'][-1],str):
            self.stack[-1]['children'][-1] += data
        else:
            self.stack[-1]['children'].append(data)

    def close(self):
        super().close()
        if len(self.stack)>1:
            self.errors.append({'class':'UNCLOSED_ELEMENTS','tags':[n['tag'] for n in self.stack[1:]]})


def nodes(tree):
    if isinstance(tree, dict):
        yield tree
        for child in tree.get('children',[]):
            yield from nodes(child)


def text_of(tree):
    if isinstance(tree,str):
        return tree
    return ''.join(text_of(child) for child in tree.get('children',[]))


def search_text(tree):
    """Derived search text only; the exact source text remains in content_text."""
    if isinstance(tree,str):return tree
    value=''.join(search_text(child) for child in tree.get('children',[]))
    block=tree['tag'] in set('article blockquote br div dl dt dd h1 h2 h3 h4 h5 h6 hr li ol p pre section table tbody td th tr ul'.split())
    return '\n'+value+'\n' if block else value


def decode_original(record, body):
    encoding = record.get('encoding')
    if not encoding:
        match = re.search(br'charset\s*=\s*["\']?([A-Za-z0-9_-]+)', body[:8192],re.I)
        encoding = match[1].decode('ascii') if match else 'utf-8'
    return body.decode(encoding,errors='strict'), encoding


def parse_article(record, body):
    source, encoding = decode_original(record,body)
    parser = TreeParser()
    parser.feed(source)
    parser.close()
    bodies = [n for n in nodes(parser.root) if n['tag']=='body']
    if len(bodies)!=1:
        raise ValueError('ARTICLE_BODY_REQUIRED')
    excluded=[]
    def prune(node):
        if isinstance(node,str):return node
        if node['tag'] in SKIP_TAGS or CHROME_CLASSES.intersection((node['attrs'].get('class') or '').split()):
            excluded.append({'reason':'executable_or_shell_chrome','node':node})
            return None
        result={**node,'children':[]}
        for child in node['children']:
            kept=prune(child)
            if kept is not None:result['children'].append(kept)
        return result
    content=prune(bodies[0])
    titles=[text_of(n) for n in nodes(parser.root) if n['tag']=='title']
    title=titles[0] if titles else (record.get('titles') or [''])[0]
    return parser,content,excluded,title,encoding


def classify_href(href, tag='', attr=''):
    path=urlsplit(href).path.lower()
    suffix=Path(path).suffix
    if suffix in ('.htm','.html','.xhtml'):return 'article'
    if suffix=='.css':return 'stylesheet'
    if suffix=='.js':return 'script'
    if suffix in ('.png','.gif','.jpg','.jpeg','.svg','.webp','.bmp','.ico','.tif','.tiff'):return 'image'
    if suffix in ('.woff','.woff2','.ttf','.otf','.eot'):return 'font'
    if suffix in ('.mp4','.webm','.avi','.wmv','.mp3','.wav','.ogg'):return 'video'
    if tag in ('img','image') or attr in ('background','data-src','data-original'):return 'image'
    if suffix:return 'attachment'
    return 'unclassified'


def reference_candidates(tree):
    for node in nodes(tree):
        tag,attrs=node['tag'],node['attrs']
        for key,value in attrs.items():
            if not value:continue
            if key in ('src','href','data-src','data-original','poster','background','data-mc-src','data-mc-popup-src'):
                yield node,key,value
            elif key in ('srcset','data-srcset'):
                # Reject data URI srcsets for explicit handling rather than splitting embedded commas.
                if 'data:' in value:
                    yield node,key,value
                else:
                    for part in value.split(','):
                        if part.strip():yield node,key,part.strip().split()[0]
            elif key=='style':
                for match in re.finditer(r'url\(\s*["\']?([^\)"\']+)["\']?\s*\)',value,re.I):
                    yield node,key,match[1]
            elif key.startswith('on') or key=='data-mc-target-name':
                for match in re.finditer(r'["\']([^"\']+\.(?:htm|html|png|gif|jpg)(?:#[^"\']*)?)["\']',value,re.I):
                    yield node,key,match[1]


def discover_references(store, record, parser):
    base=record.get('final_url') or record['source_url']
    bases=[n['attrs'].get('href') for n in nodes(parser.root) if n['tag']=='base' and n['attrs'].get('href')]
    if bases:base=urljoin(base,bases[0])
    refs=[]
    catalog={r['id']:r for r in store.records(record['module'])}
    for node,attribute,href in reference_candidates(parser.root):
        item={'node_id':node['node_id'],'tag':node['tag'],'attribute':attribute,'original_href':href,
              'effective_base':base,'source_id':record['id'],'source_sha256':record['sha256']}
        if href.startswith('#') and urljoin(base,href).split('#')[0]==record['source_url'].split('#')[0]:
            item.update(classification='same_document',target_id=record['id'],fragment=href[1:])
        elif href.startswith(('data:','javascript:','mailto:','tel:')):
            item.update(classification='inert_or_embedded_reference',target_id=None)
        else:
            resolved=urljoin(base,href)
            kind=classify_href(resolved,node['tag'],attribute)
            item['kind']=kind
            try:
                identity=source_identity(href,base)
                item.update(resolved_url=identity['url'],target_id=identity['id'],fragment=identity['fragment'])
                if identity['module']!=record['module']:
                    item['classification']='deferred_cross_module'
                elif kind=='unclassified':
                    item['classification']='classification_required'
                else:
                    # Complete edges live in this article's JSON, avoiding quadratic rewrites
                    # of shared script/style manifests as thousands of articles reference them.
                    target=catalog.get(identity['id'])
                    if target is None:
                        target=store.discover(record['module'],href,base,record['id']+'@'+record['sha256']+':'+node['node_id']+':'+attribute,kind)
                        catalog[target['id']]=target
                    item['classification']='internal'
                    item['target_type']=target['type']
            except ValueError as error:
                item.update(classification='out_of_scope_reference',target_id=None,reason=str(error))
                if 'SENSITIVE' not in str(error):item['resolved_url']=resolved
                else:item['original_href']='[redacted sensitive URL]'
        refs.append(item)
    return refs


def inventory(content):
    tags=Counter(n['tag'] for n in nodes(content))
    variants=[]
    controls=[]
    for node in nodes(content):
        attrs=node['attrs']
        evidence={k:v for k,v in attrs.items() if k in ('hidden','aria-expanded','aria-hidden','data-mc-conditions','data-mc-target-name','data-mc-targets','targets') or
                  (k=='style' and re.search(r'display\s*:\s*none|visibility\s*:\s*hidden',v or '',re.I)) or
                  (k=='class' and re.search(r'dropdown|expanding|popup|tabbody|tabpanel|tooltip|collapse|toggler',v or '',re.I))}
        if evidence:
            entry={'node_id':node['node_id'],'condition':evidence,'text_sha256':digest(text_of(node).encode('utf-8')),
                   'representation':'all_published_static_content_expanded'}
            actual_state=('hidden' in attrs or 'data-mc-conditions' in attrs or
                          re.search(r'display\s*:\s*none|visibility\s*:\s*hidden',attrs.get('style') or '',re.I) or
                          re.search(r'dropdownbody|expandingbody|popupbody|tabbody|tabpanel|tooltipbody',attrs.get('class') or '',re.I))
            (variants if actual_state else controls).append(entry)
    tables=[{'node_id':n['node_id'],
              'rows':[[{'tag':c['tag'],'text':text_of(c),'rowspan':c['attrs'].get('rowspan','1'),
                        'colspan':c['attrs'].get('colspan','1'),'headers':c['attrs'].get('headers'),'scope':c['attrs'].get('scope')}
                       for c in row['children'] if isinstance(c,dict) and c['tag'] in ('td','th')]
                      for row in nodes(n) if row['tag']=='tr'],
              'groups':[c['tag'] for c in nodes(n) if c['tag'] in ('thead','tbody','tfoot')],
              'cells':[{'tag':c['tag'],'rowspan':c['attrs'].get('rowspan','1'),
              'colspan':c['attrs'].get('colspan','1'),'headers':c['attrs'].get('headers'), 'text':text_of(c)}
              for c in nodes(n) if c['tag'] in ('td','th')]} for n in nodes(content) if n['tag']=='table']
    code=[{'node_id':n['node_id'],'tag':n['tag'],'text':text_of(n)} for n in nodes(content) if n['tag'] in ('pre','code')]
    return {'tags':dict(sorted(tags.items())),'text_sha256':digest(text_of(content).encode('utf-8')),
            'text_characters':len(text_of(content)), 'tables':tables,'code':code,'variants':variants,'documentary_controls':controls,
            'headings':[{'node_id':n['node_id'],'level':int(n['tag'][1]),'text':text_of(n)} for n in nodes(content) if re.fullmatch('h[1-6]',n['tag'])],
            'anchors':[n['attrs'][key] for n in nodes(content) for key in ('id','name') if n['attrs'].get(key)]}


def safe_style(value):
    allowed={'font-weight','font-style','font-size','font-family','text-align','text-decoration','white-space','color','background-color',
             'vertical-align','border','border-collapse','border-spacing','padding','margin','margin-left','margin-right','width','height','max-width'}
    result=[]
    for declaration in value.split(';'):
        key,sep,val=declaration.partition(':')
        if sep and key.strip().lower() in allowed and not re.search(r'url\(|expression|javascript|behavior|@',val,re.I):
            result.append(key.strip()+':'+val)
    return ';'.join(result)


def serialize(content, refs, resources, module):
    refmap={(r['node_id'],r['attribute'],r['original_href']):r for r in refs}
    exceptions=[]
    def local_reference(node,key,value):
        ref=refmap.get((node['node_id'],key,value))
        if not ref:return value if key=='href' and value.startswith('#') else None
        if ref['classification']=='same_document':return '#'+ref['fragment']
        if ref['classification']=='internal':
            target=resources.get(ref['target_id'])
            if not target:return None
            if target['type']=='article':return target['id']+'.html'+('#'+ref['fragment'] if ref.get('fragment') else '')
            if target.get('local_path'):return '../'+target['local_path'].split('/',1)[1]+('#'+ref['fragment'] if ref.get('fragment') else '')
        if key=='href' and ref['classification'] in ('deferred_cross_module','out_of_scope_reference'):
            url=ref.get('resolved_url')
            if url and urlsplit(url).scheme in ('https','http'):return url
        if key=='href' and value.startswith(('mailto:','tel:')):return value
        return None
    def render(node):
        if isinstance(node,str):return html.escape(node,quote=False)
        tag=node['tag']
        if tag=='body':return ''.join(render(c) for c in node['children'])
        if tag=='noscript':tag='div'
        if tag not in SAFE_TAGS:
            exceptions.append({'node_id':node['node_id'],'tag':tag,'class':'UNSUPPORTED_ELEMENT'})
            tag='div'
        attrs=[]
        for key,value in node['attrs'].items():
            if key in SAFE_ATTRS and value is not None:
                attrs.append((key,value))
            elif key=='style' and value:
                style=safe_style(value)
                if style:attrs.append(('style',style))
            elif key in ('href','src','poster') and value:
                target=local_reference(node,key,value)
                if target:attrs.append((key,target))
            elif key=='srcset' and value and 'data:' not in value:
                options=[]
                for candidate in value.split(','):
                    parts=candidate.strip().split()
                    if parts:
                        target=local_reference(node,key,parts[0])
                        if target:options.append(' '.join([target]+parts[1:]))
                if options:attrs.append(('srcset',', '.join(options)))
        lazy=node['attrs'].get('data-src') or node['attrs'].get('data-original')
        if tag=='img' and lazy:
            key='data-src' if node['attrs'].get('data-src') else 'data-original'
            target=local_reference(node,key,lazy)
            if target:
                attrs=[(k,v) for k,v in attrs if k!='src']
                attrs.append(('src',target))
        if tag=='details':attrs.append(('open','open'))
        if tag=='img':attrs.append(('loading','eager'))
        attrs.append(('data-source-node',node['node_id']))
        attr_text=''.join(' '+k+'="'+html.escape(str(v),quote=True)+'"' for k,v in attrs)
        return '<'+tag+attr_text+'>'+('' if tag in VOID else ''.join(render(c) for c in node['children'])+'</'+tag+'>')
    return render(content),exceptions


def convert(store, record):
    body=(store.root/record['local_path']).read_bytes()
    if digest(body)!=record['sha256']:raise ValueError('SOURCE_HASH_MISMATCH')
    parser,content,excluded,title,encoding=parse_article(record,body)
    references=discover_references(store,record,parser)
    resources={r['id']:r for r in store.records(record['module'])}
    source_inventory=inventory(content)
    markup,exceptions=serialize(content,references,resources,record['module'])
    check=TreeParser();check.feed('<body>'+markup+'</body>');check.close()
    reading=next(n for n in nodes(check.root) if n['tag']=='body')
    reading_inventory=inventory(reading)
    fidelity_checks={
        'exact_decoded_text':text_of(content)==text_of(reading),
        'table_cell_structure':[{k:v for k,v in t.items() if k!='node_id'} for t in source_inventory['tables']]==[{k:v for k,v in t.items() if k!='node_id'} for t in reading_inventory['tables']],
        'exact_code_whitespace':[(n['tag'],n['text']) for n in source_inventory['code']]==[(n['tag'],n['text']) for n in reading_inventory['code']],
        'headings':[(n['level'],n['text']) for n in source_inventory['headings']]==[(n['level'],n['text']) for n in reading_inventory['headings']],
        'parse_without_repair':not parser.errors,
        'supported_elements':not exceptions,
    }
    content_ids={n['node_id'] for n in nodes(content)}
    content_refs=[ref for ref in references if ref['node_id'] in content_ids]
    missing_image_mapping=[ref for ref in content_refs if (ref['tag'] in ('img','image','source') or ref['attribute'] in ('background','style')) and
                           ref.get('classification') not in ('internal','same_document')]
    fidelity_checks['image_reference_classification']=not missing_image_mapping
    required=[r for r in references if r.get('classification')=='internal' and r.get('kind') not in ('article','script')]
    missing=sorted({r['target_id'] for r in required if not resources.get(r['target_id'],{}).get('transport_metadata_verified')})
    fidelity_checks['direct_assets_available']=not missing
    # Full CSS/variant/anchor closure is a separate gate; this is never an automatic pilot pass.
    data={'schema_version':SCHEMA,'id':record['id'],'module':record['module'],'title':title,
          'source':{k:record.get(k) for k in ('source_url','final_url','sha256','byte_count','local_path','acquired_at')},
          'encoding':encoding,'collector_version':VERSION,'converter_version':CONVERTER,
          'titles':record.get('titles',[]),'breadcrumbs':record.get('breadcrumbs',[]),
          'content_tree':content,'content_text':text_of(content),'search_text':search_text(content),'inventory':source_inventory,'references':references,
          'excluded_shell_nodes':excluded,'format_exceptions':exceptions,
          'verification':{'checks':fidelity_checks,'missing_direct_assets':missing,'unresolved_image_references':missing_image_mapping,'parse_errors':parser.errors,
                          'content_checks_passed':all(fidelity_checks.values()),'reading_copy_verified':False,
                          'pending':['CSS dependency closure','documentary variant reconciliation','internal anchor/link audit']}}
    if record['module']=='AIM':
        from documentary_states import reconcile
        data['documentary_states']=reconcile(content,references,resources)
    prefix=record['module']+'/reading/'+record['id']
    csp="default-src 'none'; img-src 'self' data:; style-src 'unsafe-inline'; font-src 'none'; media-src 'none'; object-src 'none'; frame-src 'none'; script-src 'none'; base-uri 'none'; form-action 'none'"
    styles=[]
    for ref in references:
        if ref.get('kind')=='stylesheet' and ref.get('target_id'):
            style_path=store.root/record['module']/'data/stylesheets'/(ref['target_id']+'.json')
            if style_path.is_file():
                style=json.loads(style_path.read_text(encoding='utf-8'))
                if style.get('direct_dependencies_captured') and not style.get('unsafe_css_detected'):
                    styles.append('<link rel="stylesheet" href="assets/'+ref['target_id']+'.css">')
    csp=csp.replace("style-src 'unsafe-inline'", "style-src 'self' 'unsafe-inline'")
    document='<!doctype html><html lang="en"><head><meta charset="utf-8"><meta http-equiv="Content-Security-Policy" content="'+csp+'"><title>'+html.escape(title)+'</title>'+''.join(styles)+'<style>body{max-width:80rem;margin:2rem auto;padding:0 1rem;font:16px/1.5 system-ui}table{border-collapse:collapse}td,th{border:1px solid #aaa;padding:.4rem}img{max-width:100%;height:auto}pre{white-space:pre-wrap}.MCDropDownBody,.MCExpandingBody,[role="tabpanel"]{display:block!important;visibility:visible!important}</style></head><body>'+markup+'</body></html>'
    atomic_bytes(store.root/(prefix+'.html'),document.encode('utf-8'))
    atomic_bytes(store.root/(prefix+'.md'),markup.encode('utf-8'))
    data['reading']={'html':prefix+'.html','markdown':prefix+'.md','html_sha256':digest(document.encode('utf-8')),'markdown_sha256':digest(markup.encode('utf-8')),
                     'format':'HTML in Markdown preserves mixed inline content and table structure; inert HTML companion supplies offline rendering.'}
    relative=record['module']+'/data/articles/'+record['id']+'.json'
    atomic_json(store.root/relative,data)
    record.update(app_data_path=relative,reading_paths=data['reading'],title=title,variants=source_inventory['variants'],
                  content_checks_passed=data['verification']['content_checks_passed'],reading_copy_verified=False)
    store.save_record(record)
    return {'id':record['id'],'title':title,'characters':source_inventory['text_characters'],'checks':fidelity_checks,'missing_assets':len(missing)}


if __name__=='__main__':
    args=argparse.ArgumentParser(description=__doc__)
    args.add_argument('--module',choices=['AIM','SDK'],default='AIM')
    options=args.parse_args()
    root=Path(__file__).resolve().parents[1]
    store=Store(root,cache_records=True)
    runtime=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'
    with writer_lock(root,runtime) as owner:
        store.checkpoint(owner,phase='DERIVATIVES_IN_PROGRESS',worker_running=True)
        try:
            for record in store.records(options.module):
                if record['type']=='article' and record.get('local_path'):
                    print(json.dumps(convert(store,record)),flush=True)
        finally:
            store.checkpoint(owner,phase='FIDELITY_VERIFICATION_IN_PROGRESS',worker_running=False)
