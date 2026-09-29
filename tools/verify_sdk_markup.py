"""Compare saved SDK source recovery with the browser's inert HTML parser.

Original bytes and parser diagnostics remain intact. This proof covers only
unmatched closing strong tags, and cannot waive another parsing or fidelity gap.
"""
import json
import os
from pathlib import Path
from playwright.sync_api import sync_playwright
from collector import Store, read_json, atomic_json, writer_lock, digest, now
from article_data import nodes, decode_original
import sdk_article_data as sdk

CODE = ('tools/sdk_article_data.py', 'tools/verify_sdk_markup.py')
REPORT = 'SDK/reports/source-markup.json'


def value_hash(value):
    return digest(json.dumps(value,ensure_ascii=False,sort_keys=True,separators=(',',':')).encode('utf-8'))


def eligible_diagnostics(parser):
    return bool(parser.errors) and all(error=={'class':'UNMATCHED_CLOSE','tag':'strong'} for error in parser.errors)


def trailing_document_whitespace(parser):
    """Native HTML parsing appends post-body document whitespace to body text.

    This is a document-framing projection, never a trim of documentary text.
    Any non-whitespace text or element after the sole body remains unsupported.
    """
    suffix=[];past_body=False
    def visit(node):
        nonlocal past_body
        if isinstance(node,str):
            if past_body:
                if any(c not in ' \t\r\n\f' for c in node):
                    raise ValueError('UNSUPPORTED_NONWHITESPACE_AFTER_BODY')
                suffix.append(sdk.literal_dom_text(node))
            return
        if past_body:raise ValueError('UNSUPPORTED_ELEMENT_AFTER_BODY')
        if node['tag']=='body':
            past_body=True
            return
        for child in node['children']:visit(child)
    visit(parser.root)
    if not past_body:raise ValueError('SOURCE_BODY_REQUIRED')
    return ''.join(suffix)


def browser_source_string(record,raw):
    """Consume the observed UTF-8 byte-order mark as the byte parser does."""
    source,_=decode_original(record,raw)
    consumed=raw.startswith(b'\xef\xbb\xbf')
    if consumed and source.startswith('\ufeff'):source=source[1:]
    return source,consumed


def document_framing(record,raw,parser):
    _,consumed=browser_source_string(record,raw)
    suffix=trailing_document_whitespace(parser)
    return {'utf8_bom_consumed':consumed,'trailing_whitespace_characters':len(suffix),
            'trailing_whitespace_sha256':digest(suffix.encode('utf-8'))}


def expected_projection(content,parser=None):
    elements=list(nodes(content))
    suffix=trailing_document_whitespace(parser) if parser is not None else ''
    return {'body_text_sha256':digest((sdk.dom_text_of(content)+suffix).encode('utf-8')),
            'strong_texts_sha256':value_hash([sdk.dom_text_of(n) for n in elements if n['tag']=='strong']),
            'anchors_sha256':value_hash([{'tag':n['tag'],'attribute':attr,'value':n['attrs'][attr]}
                for n in elements for attr in ('id','name') if n['attrs'].get(attr)])}


def markup_proof_current(store,record,parser,content):
    """Current native equivalence for this exact source and diagnostic list."""
    if not eligible_diagnostics(parser):return False
    try:
        proof=read_json(store.root/REPORT)
        if proof.get('module')!='SDK' or proof.get('code_sha256')!={p:digest((store.root/p).read_bytes()) for p in CODE}:return False
        rows=[r for r in proof['results'] if r['id']==record['id']]
        if len(rows)!=1:return False
        row=rows[0];expected=expected_projection(content,parser)
        raw=(store.root/record['local_path']).read_bytes()
        return bool(row.get('equivalent') is True and row.get('diagnostics')==parser.errors
            and row.get('source_sha256')==record['sha256']==digest(raw)
            and row.get('document_framing')==document_framing(record,raw,parser)
            and row.get('expected')==expected and row.get('actual')==expected)
    except (OSError,ValueError,KeyError,TypeError):return False


def main():
    root=Path(__file__).resolve().parents[1]
    with writer_lock(root,Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'):
        store=Store(root,cache_records=True)
        report={'checked_at':now(),'module':'SDK','method':'Native inert DOMParser; byte-order mark consumed as encoding metadata and exact post-body document whitespace included in the expected native projection. No source JavaScript executed and all browser network requests blocked.',
                'code_sha256':{p:digest((root/p).read_bytes()) for p in CODE},'results':[]}
        with sync_playwright() as p:
            browser=p.chromium.launch(channel='msedge',headless=True,chromium_sandbox=True)
            try:
                context=browser.new_context(java_script_enabled=True)
                context.route('**/*',lambda route:route.abort())
                page=context.new_page()
                for record in store.records('SDK'):
                    if record['type']!='article' or record['status']!='BODY_SAVED':continue
                    raw=(root/record['local_path']).read_bytes()
                    if digest(raw)!=record['sha256']:raise ValueError('Saved source hash mismatch')
                    parser,content,_,_,_=sdk.parse_article(record,raw)
                    if not eligible_diagnostics(parser):continue
                    source,_=browser_source_string(record,raw)
                    observed=page.evaluate('''source => {
                      const doc=new DOMParser().parseFromString(source,'text/html');
                      const body=doc.body;
                      body.querySelectorAll('script,style').forEach(n=>n.remove());
                      const elements=[body,...body.querySelectorAll('*')];
                      return {text:body.textContent,strong:elements.filter(n=>n.tagName.toLowerCase()==='strong').map(n=>n.textContent),
                        anchors:elements.flatMap(n=>['id','name'].filter(a=>n.getAttribute(a)).map(a=>({tag:n.tagName.toLowerCase(),attribute:a,value:n.getAttribute(a)})))};
                    }''',source)
                    expected=expected_projection(content,parser)
                    actual={'body_text_sha256':digest(observed['text'].encode('utf-8')),
                            'strong_texts_sha256':value_hash(observed['strong']),
                            'anchors_sha256':value_hash(observed['anchors'])}
                    report['results'].append({'id':record['id'],'source_sha256':record['sha256'],'diagnostics':parser.errors,
                        'document_framing':document_framing(record,raw,parser),
                        'expected':expected,'actual':actual,'equivalent':actual==expected})
            finally:browser.close()
        report['status']='PASSED' if all(r['equivalent'] for r in report['results']) else 'FAILED'
        atomic_json(root/REPORT,report)
        print(json.dumps({'status':report['status'],'articles':len(report['results']),
            'diagnostic_count':sum(len(r['diagnostics']) for r in report['results']),
            'failed_ids':[r['id'] for r in report['results'] if not r['equivalent']]}),flush=True)
        return 0 if report['status']=='PASSED' else 1


if __name__=='__main__':raise SystemExit(main())
