"""Compare saved reading files with source content, independently of converter flags."""
from urllib.parse import urlsplit
from pathlib import PurePosixPath
from collector import digest
from article_data import TreeParser, nodes, text_of, SAFE_ATTRS


def child_signature(node):
    result=[]
    for child in node['children']:
        if isinstance(child,str):
            # Removing executable/chrome nodes can leave adjacent source text nodes.
            # HTML serialization joins them without changing any character or whitespace.
            if result and result[-1][0]=='text':result[-1]=('text',result[-1][1]+child)
            else:result.append(('text',child))
        else:result.append(('node',child['attrs'].get('data-source-node',child['node_id'])))
    return result


def verify_reading(root,record,data,content,catalog):
    errors=[]
    expected=[n for n in nodes(content) if n['tag']!='body']
    source_ids=[n['node_id'] for n in expected]
    variant_ids={v['node_id']:v for v in data['inventory']['variants']}
    content_refs={}
    for ref in data['references']:content_refs.setdefault(ref['node_id'],[]).append(ref)
    for kind in ('html','markdown'):
        path=root/data['reading'][kind]
        parser=TreeParser()
        text=path.read_bytes().decode('utf-8')
        parser.feed(text if kind=='html' else '<body>'+text+'</body>');parser.close()
        bodies=[n for n in nodes(parser.root) if n['tag']=='body']
        if len(bodies)!=1 or parser.errors:
            errors.append({'check':'READING_PARSE','format':kind});continue
        body=bodies[0]
        ordered=list(nodes(body))[1:]
        if [n['attrs'].get('data-source-node') for n in ordered]!=source_ids:
            errors.append({'check':'CONTENT_NODE_ORDER','format':kind})
        mapped={n['attrs'].get('data-source-node'):n for n in ordered}
        if child_signature(body)!=child_signature(content):
            errors.append({'check':'BODY_CHILD_ORDER','format':kind})
        if text_of(body)!=text_of(content):
            errors.append({'check':'EXACT_CONTENT_TEXT','format':kind})
        for source in expected:
            target=mapped.get(source['node_id'])
            if not target:continue
            if target['tag']!=('div' if source['tag']=='noscript' else source['tag']):
                errors.append({'check':'ELEMENT_TAG','format':kind,'node':source['node_id']})
            if child_signature(source)!=child_signature(target):
                errors.append({'check':'CHILD_ORDER_OR_TEXT','format':kind,'node':source['node_id']})
            for name,value in source['attrs'].items():
                if name in SAFE_ATTRS and value is not None and target['attrs'].get(name)!=value:
                    errors.append({'check':'SEMANTIC_ATTRIBUTE','format':kind,'node':source['node_id'],'attribute':name})
            if any(k.startswith('on') for k in target['attrs']) or target['tag'] in ('script','iframe','object','embed','form'):
                errors.append({'check':'ACTIVE_CONTENT','format':kind,'node':source['node_id']})
            if source['node_id'] in variant_ids and digest(text_of(target).encode('utf-8'))!=variant_ids[source['node_id']]['text_sha256']:
                errors.append({'check':'VARIANT_TEXT','format':kind,'node':source['node_id']})
            for ref in content_refs.get(source['node_id'],[]):
                attr=ref['attribute']
                if attr not in ('href','src','data-src','data-original'):continue
                output_attr='src' if attr in ('data-src','data-original') else attr
                if attr=='src' and (source['attrs'].get('data-src') or source['attrs'].get('data-original')):continue
                expected_url=None
                if ref['classification']=='same_document':expected_url='#'+ref['fragment']
                elif ref['classification']=='internal':
                    resource=catalog.get(ref['target_id'])
                    if resource and resource['type']=='article':expected_url=resource['id']+'.html'
                    elif resource and resource.get('local_path'):expected_url='../'+resource['local_path'].split('/',1)[1]
                    if expected_url and ref.get('fragment'):expected_url+='#'+ref['fragment']
                elif attr=='href' and ref['classification'] in ('out_of_scope_reference','deferred_cross_module'):
                    candidate=ref.get('resolved_url')
                    if candidate and urlsplit(candidate).scheme in ('http','https'):expected_url=candidate
                elif attr=='href' and ref['original_href'].startswith(('mailto:','tel:')):expected_url=ref['original_href']
                if target['attrs'].get(output_attr)!=expected_url:
                    errors.append({'check':'REFERENCE_MAPPING','format':kind,'node':source['node_id'],'attribute':attr})
    return {'passed':not errors,'errors':errors,'source_nodes':len(expected),'static_variant_nodes':len(variant_ids)}
