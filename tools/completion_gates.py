"""Source-bound, offline AIM discovery and completion evidence.

These checks do not request resources, repair source links, or waive unavailable data.
"""
from collections import Counter
import json
import re
from pathlib import Path
from urllib.parse import unquote, urlsplit, urljoin
import xml.etree.ElementTree as ET
from collector import digest, read_json, source_identity, ROOTS, ORIGIN
from article_data import TreeParser, nodes, reference_candidates, text_of
from proof_inputs import value_hash, render_inputs, bound_report_current


def catalog_hash(records):
    values=[{k:r.get(k) for k in ('id','type','status','sha256','local_path')} for r in records]
    return digest(json.dumps(sorted(values,key=lambda x:x['id']),sort_keys=True,separators=(',',':')).encode())


def discovery_generation(store):
    """Bind the source-replayed navigation and references, excluding audit flags."""
    root=store.root;values={}
    for name in ('toc','discovery-membership','navigation-partitions'):
        path=root/'AIM/manifests'/(name+'.json')
        value=read_json(path) if path.is_file() else None
        if name=='toc' and value:
            value={k:v for k,v in value.items() if k not in ('discovery_complete','reason')}
        values[name]=value
    values['navigation']=[{'path':p.relative_to(root).as_posix(),'data':read_json(p)}
                          for p in sorted((root/'AIM/data/navigation').glob('*.json'))]
    values['resources']=[];values['article_references']=[]
    for record in sorted(store.records('AIM'),key=lambda r:r['id']):
        values['resources'].append({k:record.get(k) for k in
            ('id','source_url','final_url','occurrences','titles','breadcrumbs','discovery_sources','discovery_correction')})
        if record.get('app_data_path'):
            path=root/record['app_data_path'];data=read_json(path) if path.is_file() else {}
            values['article_references'].append({'id':record['id'],'references':data.get('references')})
    return value_hash(values)


def discovery_proof(store,records):
    path=store.root/'AIM/manifests/discovery-closure.json'
    if not path.is_file():return {'passed':False,'error':'DISCOVERY_CLOSURE_PROOF_MISSING'}
    proof=read_json(path)
    current=(proof.get('catalog_sha256')==catalog_hash(records)
             and proof.get('derived_generation_sha256')==discovery_generation(store))
    return {'passed':bool(current and proof.get('fixed_point') and proof.get('discovery_reconciled')
                           and not proof.get('issues')),'current':current,
            'error':None if current else 'DISCOVERY_CLOSURE_PROOF_STALE',
            'report_sha256':digest(path.read_bytes()),'issues':proof.get('issues',[])}


def discovery_evidence(store, parsed, toc, parse_errors, before_ids):
    """Replay captured source references and every declared navigation family."""
    records=store.records('AIM');catalog={r['id']:r for r in records}
    by_url={r['source_url']:r for r in records}
    publication=ORIGIN+ROOTS['AIM'];issues=list(parse_errors);partitions=[];empty=[]
    expected=set();replayed=0;formats=Counter();source_generations=[];classifications=[]
    for relative in ('OnlineHelp.htm','Data/HelpSystem.xml'):
        record=by_url.get(publication+relative)
        if not record or record['status']!='BODY_SAVED':
            issues.append({'class':'PUBLICATION_ENTRY_NOT_CAPTURED','url':publication+relative})
    script_text=b'\n'.join((store.root/r['local_path']).read_bytes()
        for r in records if r['type']=='script' and r['status']=='BODY_SAVED')
    list_marker_unhandled=not re.search(br'''["'](?:data-mc-)?continue["']''',script_text,re.I)
    def require(href,base,source):
        nonlocal replayed
        identity=source_identity(href,base)
        if identity['module']!='AIM':return
        replayed+=1;expected.add(identity['id'])
        if identity['id'] not in catalog:
            issues.append({'class':'UNDISCOVERED_REFERENCE','source':source,'url':identity['fetch_key']})
    for record in records:
        if record['status']=='INVALID_RESOLUTION':
            correction=record.get('discovery_correction',{})
            parent=catalog.get(correction.get('source_id'),{})
            if correction.get('class')!='COLLECTOR_CSS_BASE_ERROR' or correction.get('source_sha256')!=parent.get('sha256'):
                issues.append({'id':record['id'],'class':'UNPROVEN_DISCOVERY_EXCLUSION'})
            continue
        if record['type'] in ('article','navigation') and record['status']!='BODY_SAVED':
            issues.append({'id':record['id'],'class':'SOURCE_CLOSURE_NOT_CAPTURED','type':record['type']})
            continue
        if not record.get('local_path'):continue
        raw=(store.root/record['local_path']).read_bytes()
        if digest(raw)!=record['sha256']:
            issues.append({'id':record['id'],'class':'SOURCE_HASH_MISMATCH'});continue
        source_generations.append({'id':record['id'],'sha256':record['sha256']})
        path=urlsplit(record['source_url']).path
        if record['type']=='navigation':
            if path.endswith('.js'):
                obj=parsed.get(record['id'])
                if obj is None:issues.append({'id':record['id'],'class':'UNPARSED_NAVIGATION'});continue
                partitions.append({'id':record['id'],'sha256':record['sha256'],'schema':Path(path).name})
                if isinstance(obj,dict) and 'numchunks' in obj and 'prefix' in obj:
                    for number in range(obj['numchunks']):require(obj['prefix']+str(number)+'.js',record['source_url'],record['id'])
                if path.endswith('/Search.js'):
                    for key,family in (('t','SearchTopic'),('m','SearchMicroContent'),('u','SearchUrl'),('s','SearchStem'),('p','SearchPhrase')):
                        bounds=obj.get(key)
                        if not isinstance(bounds,list):issues.append({'id':record['id'],'class':'UNSUPPORTED_SEARCH_FAMILY','family':key});continue
                        if not bounds:empty.append({'id':record['id'],'sha256':record['sha256'],'family':family,'evidence':'published boundary array is empty'})
                        for number in range(len(bounds)):require(family+'_Chunk'+str(number)+'.js',record['source_url'],record['id'])
                elif path.endswith('/Concepts.js'):
                    if obj:issues.append({'id':record['id'],'class':'CONCEPT_SCHEMA_REQUIRES_ADAPTER'})
                    else:empty.append({'id':record['id'],'sha256':record['sha256'],'family':'concepts','evidence':'published object is empty'})
                elif path.endswith('/Language.js') and isinstance(obj,dict) and set(obj).issubset({'skin','component','toc'}) and 'skin' in obj:
                    classifications.append({'id':record['id'],'sha256':record['sha256'],'class':'skin_localization_dictionary'})
                elif '/BrowseSequences/' in path:
                    # Do not invent a schema for the currently unavailable partition.
                    issues.append({'id':record['id'],'class':'BROWSE_SEQUENCE_SCHEMA_REQUIRES_ADAPTER'})
                elif not any(name in path for name in ('/Tocs/','/Index','/SearchTopic_Chunk','/SearchUrl_Chunk','/SearchStem_Chunk','/SearchPhrase_Chunk')):
                    issues.append({'id':record['id'],'class':'NAVIGATION_SCHEMA_REQUIRES_ADAPTER'})
            elif path.endswith('.xml'):
                xml=ET.fromstring(raw)
                if path.endswith('/HelpSystem.xml'):
                    for name in ('Toc','Index','Concepts','BrowseSequence','SearchDatabase','Alias','Synonyms','Glossary','SearchFilterSet','DefaultUrl'):
                        if xml.get(name):require(xml.get(name),publication,record['id'])
                        else:empty.append({'id':record['id'],'sha256':record['sha256'],'family':name,'evidence':'not declared in HelpSystem'})
                    if xml.findall('.//Subsystem') or xml.findall('.//SubSystem'):
                        issues.append({'id':record['id'],'class':'SUBPROJECT_SCHEMA_REQUIRES_ADAPTER'})
                elif path.endswith('/Alias.xml') and xml.tag=='CatapultAliasFile' and not list(xml):
                    empty.append({'id':record['id'],'sha256':record['sha256'],'family':'aliases','evidence':'empty published alias root'})
                elif path.endswith('/Synonyms.xml') and xml.tag=='MadCapSynonyms' and all(not list(n) and not (n.text or '').strip() for n in xml):
                    empty.append({'id':record['id'],'sha256':record['sha256'],'family':'synonyms','evidence':'empty published synonym groups'})
                else:issues.append({'id':record['id'],'class':'XML_NAVIGATION_SCHEMA_REQUIRES_ADAPTER'})
        if record['type']=='article' or (record['type']=='navigation' and path.endswith(('.htm','.html'))):
            parser=TreeParser();parser.feed(raw.decode(record.get('encoding') or 'utf-8-sig'));parser.close()
            if parser.errors:issues.append({'id':record['id'],'class':'REFERENCE_SOURCE_PARSE'})
            base=record.get('final_url') or record['source_url']
            bases=[n['attrs']['href'] for n in nodes(parser.root) if n['tag']=='base' and n['attrs'].get('href')]
            if bases:base=urljoin(base,bases[0])
            source_refs=list(reference_candidates(parser.root))
            for node,attr,href in source_refs:
                if href.startswith(('#','javascript:','mailto:','tel:')):continue
                if href.startswith(('data:','blob:')):
                    issues.append({'id':record['id'],'class':'EMBEDDED_RESOURCE_REQUIRES_CAPTURE','node':node['node_id']});continue
                try:require(href,base,record['id'])
                except ValueError as error:
                    if str(error) not in ('OUT_OF_SCOPE_ORIGIN','OUT_OF_SCOPE_PATH'):
                        issues.append({'id':record['id'],'class':str(error)})
            if record['type']=='article':
                data=read_json(store.root/record['app_data_path']) if record.get('app_data_path') else {}
                actual=[(n['node_id'],a,h) for n,a,h in source_refs]
                preserved=[(r['node_id'],r['attribute'],r['original_href']) for r in data.get('references',[])]
                if actual!=preserved:issues.append({'id':record['id'],'class':'ARTICLE_REFERENCE_REPLAY_MISMATCH'})
                body=next((n for n in nodes(parser.root) if n['tag']=='body'),parser.root)
                for node in nodes(body):
                    if node['tag'] in ('script','style') and text_of(node).strip():
                        formats['inline_'+node['tag']]+=1
                        issues.append({'id':record['id'],'class':'INLINE_DOCUMENTARY_DATA_REQUIRES_CLASSIFICATION','tag':node['tag'],'node':node['node_id']})
                    for attr,value in node['attrs'].items():
                        known={'data-mc-alt2','data-mc-conditions','data-mc-target-name','data-mc-targets','data-mc-generated-bookmark',
                               'data-mc-autonum','data-mc-allow-multiple','data-mc-state','data-mc-width','data-mc-height'}
                        if attr=='data-mc-continue' and value=='true' and node['tag'] in ('ol','ul') and list_marker_unhandled:
                            known.add(attr)
                            classifications.append({'id':record['id'],'sha256':record['sha256'],'node':node['node_id'],
                                'class':'inert_authoring_list_metadata','attribute':attr,'literal_value':value,
                                'evidence':'Native HTML list semantics retained; no acquired renderer script contains the continuation attribute name.'})
                        if (attr.startswith('on') and value) or (attr.startswith('data-') and attr not in known):
                            formats['unclassified_interactive_attribute']+=1
                            issues.append({'id':record['id'],'class':'INTERACTIVE_ATTRIBUTE_REQUIRES_CLASSIFICATION','attribute':attr,'node':node['node_id']})
                    cls=node['attrs'].get('class') or ''
                    if any(name in cls for name in ('MCTextPopup','MCExpanding','MCSlideshow','MCPopupThumbnail','MCTab')):
                        issues.append({'id':record['id'],'class':'DOCUMENTARY_CONTROL_REQUIRES_ADAPTER','node':node['node_id']})
                    if node['tag'] in ('canvas','svg','object','embed','video','audio','iframe'):
                        formats[node['tag']]+=1
                        issues.append({'id':record['id'],'class':'RENDERED_FORMAT_REQUIRES_ADAPTER','tag':node['tag']})
                    for attr in ('srcset','data-src','data-original','data-srcset','data-mc-src','data-mc-popup-src'):
                        if node['attrs'].get(attr):
                            formats[attr]+=1
                            issues.append({'id':record['id'],'class':'ADDITIONAL_ASSET_FORMAT_REQUIRES_PROOF','attribute':attr})
            else:
                for node in nodes(parser.root):
                    if node['tag']=='iframe' and not node['attrs'].get('src'):
                        name=node['attrs'].get('id')
                        if name not in ('topic','pulse','community-frame-html5'):
                            issues.append({'id':record['id'],'class':'UNCLASSIFIED_EMPTY_FRAME','node':node['node_id']})
                        formats['shell_frame_'+str(name)]+=1
        if record['type']=='stylesheet':
            style_path=store.root/'AIM/data/stylesheets'/(record['id']+'.json')
            style=read_json(style_path) if style_path.exists() else {}
            if style.get('source_sha256')!=record['sha256']:
                issues.append({'id':record['id'],'class':'CSS_REFERENCE_PROOF_MISSING_OR_STALE'});continue
            for ref in style['references']:
                if ref['classification']=='internal':require(ref['original_href'],record['source_url'],record['id'])
                elif ref['classification'] not in ('namespace_identifier','legacy_opaque_reference','embedded_or_fragment'):
                    issues.append({'id':record['id'],'class':'CSS_REFERENCE_UNRESOLVED'})
    current_ids={r['id'] for r in records}
    stable=current_ids==set(before_ids)
    if not stable:issues.append({'class':'DISCOVERY_GRAPH_EXPANDED','new_ids':sorted(current_ids-set(before_ids))})
    if not toc:issues.append({'class':'TOC_NOT_RECONCILED'})
    return {'catalog_sha256':catalog_hash(records),'derived_generation_sha256':discovery_generation(store),
        'fixed_point':stable,'reference_replay_count':replayed,
        'expected_resource_ids':sorted(expected),'partitions':partitions,'empty_or_undeclared_families':empty,
        'source_generations':source_generations,'observed_additional_formats':{k:formats[k] for k in sorted(set(formats)|{
            'canvas','svg','object','embed','video','audio','iframe','srcset','data-src','data-original','data-srcset','data-mc-src',
            'data-mc-popup-src','inline_script','inline_style','unclassified_interactive_attribute'})},
        'source_classifications':classifications,
        'feature_scope':'All captured article originals and shell references; unavailable articles remain explicit gaps.',
        'issues':issues,'discovery_reconciled':not issues}


def navigation_links(store,catalog):
    """Validate publication occurrences, retaining duplicate navigation positions."""
    references=[];seen=set();issues=[];counts=Counter();cache={}
    for record in catalog.values():
        for occurrence in record.get('occurrences',[]):
            if 'family' not in occurrence and 'toc_node' not in occurrence:continue
            marker=json.dumps(occurrence,sort_keys=True)
            if marker in seen:continue
            seen.add(marker)
            href=occurrence['resolved_url'];fragment=unquote(urlsplit(href).fragment)
            item={'target_id':record['id'],'original_href':occurrence['original_href'],'resolved_url':href,
                  'family':occurrence.get('family','toc'),'source_id':occurrence.get('discovery_source'),
                  'source_entry':occurrence.get('source_entry',occurrence.get('toc_node')),'fragment':fragment}
            if record['status']!='BODY_SAVED':item['error']='NAVIGATION_TARGET_NOT_CAPTURED'
            elif record['type']=='article':
                if record['id'] not in cache:
                    path=store.root/record.get('app_data_path','missing')
                    cache[record['id']]=read_json(path) if path.is_file() else {}
                data=cache[record['id']]
                if data.get('source',{}).get('sha256')!=record['sha256']:item['error']='NAVIGATION_TARGET_GENERATION_MISSING'
                elif fragment and fragment not in data.get('inventory',{}).get('anchors',[]):item['error']='NAVIGATION_FRAGMENT_MISSING'
            if item.get('error'):issues.append(item);counts['failed']+=1
            else:counts['verified']+=1
            if fragment:counts['with_fragment']+=1
            references.append(item)
    return {'catalog_sha256':catalog_hash(catalog.values()),'counts':dict(counts),'references':references,'issues':issues,'passed':not issues}


def resource_proofs(store,module,catalog,css_check):
    path=store.root/module/'reports/resource-fidelity.json'
    report=read_json(path) if path.is_file() else {}
    images={r['id']:r for r in report.get('images',[])};attachments={r['id']:r for r in report.get('attachments',[])}
    issues=[];verified=[]
    for record in catalog.values():
        if record['status']!='BODY_SAVED':continue
        errors=[]
        if not record.get('transport_metadata_verified') or record.get('http_status')!=200:errors.append('TRANSPORT_PROOF_MISSING')
        path=store.root/record['local_path']
        if not path.is_file() or path.stat().st_size!=record['byte_count'] or digest(path.read_bytes())!=record['sha256']:errors.append('ORIGINAL_INTEGRITY_FAILED')
        proof=None
        if record['type']=='image':
            proof=images.get(record['id'],{})
            if not proof.get('decoded') or not proof.get('width') or not proof.get('height'):errors.append('IMAGE_PROOF_MISSING')
        elif record['type']=='attachment':
            proof=attachments.get(record['id'],{})
            if not proof.get('passed'):errors.append('ATTACHMENT_PROOF_MISSING')
        if proof is not None and (report.get('status')!='PASSED' or proof.get('sha256')!=record['sha256']):errors.append('RESOURCE_PROOF_MISSING_OR_STALE')
        if record['type']=='stylesheet' and not css_check(store,module,record['id'],catalog):errors.append('CSS_CLOSURE_INCOMPLETE')
        if errors:issues.append({'id':record['id'],'errors':errors})
        else:verified.append(record['id'])
    return {'verified_ids':verified,'issues':issues,'passed':not issues}


def reading_index_proof(store,module,catalog):
    from build_navigation import render_index
    toc_path=store.root/module/'manifests/toc.json';path=store.root/module/'docs/INDEX.md'
    if not toc_path.is_file() or not path.is_file():return {'passed':False,'issues':[{'error':'READING_INDEX_MISSING'}]}
    toc=read_json(toc_path);issues=[];count=0
    if path.read_bytes()!=render_index(catalog,toc):issues.append({'error':'READING_INDEX_CONTENT_MISMATCH'})
    def walk(items):
        nonlocal count
        for item in items:
            count+=1;record=catalog.get(item.get('resource_id'))
            if record and record.get('reading_paths'):
                target=(store.root/record['reading_paths']['markdown']).resolve()
                if not target.is_relative_to(store.root) or not target.is_file() or digest(target.read_bytes())!=record['reading_paths']['markdown_sha256']:
                    issues.append({'error':'READING_INDEX_TARGET_INVALID','id':record['id']})
            elif item.get('resource_id') and not record:issues.append({'error':'READING_INDEX_TARGET_UNMAPPED','id':item['resource_id']})
            walk(item.get('children',[]))
    walk(toc['nodes'])
    if count!=toc.get('node_count'):issues.append({'error':'READING_INDEX_NODE_COUNT'})
    return {'passed':not issues,'issues':issues,'node_count':count,'sha256':digest(path.read_bytes())}


def visual_proof(store,module,catalog,inputs=None):
    path=store.root/module/'reports/visual-review.json'
    proof=read_json(path) if path.is_file() else {}
    required={'extensive_article','table','image','dropdown','toggler','topic_popup'}
    if proof.get('status')!='PASSED' or not required.issubset(set(proof.get('formats',[]))) or not proof.get('generations'):
        return {'passed':False,'error':'REPRESENTATIVE_VISUAL_PROOF_REQUIRED'}
    if not bound_report_current(store,'visual-review',inputs or render_inputs(store)):
        return {'passed':False,'error':'REPRESENTATIVE_VISUAL_SUPPORT_PROOF_MISSING_OR_STALE'}
    for generation in proof['generations']:
        record=catalog.get(generation['id'],{})
        if record.get('sha256')!=generation.get('source_sha256') or record.get('reading_paths',{}).get('html_sha256')!=generation.get('reading_sha256'):
            return {'passed':False,'error':'REPRESENTATIVE_VISUAL_PROOF_STALE'}
    if not proof.get('screenshots'):return {'passed':False,'error':'REPRESENTATIVE_VISUAL_IMAGES_MISSING'}
    for item in proof['screenshots']:
        image=(store.root/item['path']).resolve()
        if not image.is_relative_to(store.root) or not image.is_file() or digest(image.read_bytes())!=item['sha256']:
            return {'passed':False,'error':'REPRESENTATIVE_VISUAL_IMAGE_INVALID'}
    return {'passed':True,'report':'AIM/reports/visual-review.json','report_sha256':digest(path.read_bytes())}


def completion_decision(gates):
    """One strict conjunction; success cannot be inferred from capture percentages."""
    return bool(gates) and all(value is True for value in gates.values())


def browser_proof_current(store,kind,inputs=None):
    """Avoid repeating browser checks when their immutable input generations match."""
    records={r['id']:r for r in store.records('AIM') if r['status']=='BODY_SAVED'}
    name='resource-fidelity' if kind=='resources' else 'documentary-states'
    path=store.root/'AIM/reports'/(name+'.json')
    if not path.is_file():return False
    report=read_json(path)
    if report.get('status')!='PASSED':return False
    if kind=='resources':
        proofs={r['id']:r for r in report.get('images',[])+report.get('attachments',[])}
        return all(proofs.get(r['id'],{}).get('sha256')==r['sha256'] for r in records.values() if r['type'] in ('image','attachment'))
    from article_data import CONVERTER
    if report.get('converter_version')!=CONVERTER:return False
    if not bound_report_current(store,'documentary-states',inputs or render_inputs(store)):return False
    proofs={r['id']:r for r in report.get('generations',[])}
    for record in records.values():
        if record['type']!='article':continue
        proof=proofs.get(record['id'],{});reading=record.get('reading_paths',{})
        if proof.get('source_sha256')!=record['sha256'] or proof.get('reading_sha256')!=reading.get('html_sha256'):return False
        path=store.root/reading.get('html','missing')
        if not path.is_file() or digest(path.read_bytes())!=proof['reading_sha256']:return False
    return True
