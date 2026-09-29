"""Reconcile AIM's published navigation data using static parsing only."""
import json
import os
from pathlib import Path
from urllib.parse import urlsplit, urljoin
import xml.etree.ElementTree as ET
from collector import Store, ROOTS, ORIGIN, writer_lock, atomic_json, now
from static_data import parse_define

PUBLICATION = ORIGIN + ROOTS['AIM']


def publication_href(href):
    # MadCapHelpSystem.GetTocEntryHref combines /Content with helpSystem.GetPath.
    # This rule applies only to that data schema, never to ordinary HTML hrefs.
    return urljoin(PUBLICATION, href.lstrip('/')) if href.startswith('/Content/') else urljoin(PUBLICATION, href)


def add(store, href, parent, kind='navigation', *, base=None):
    return store.discover('AIM', href, base or parent['source_url'],
                          parent['id'] + '@' + parent['sha256'], kind)


def by_path(records, suffix):
    matches = [r for r in records if urlsplit(r['source_url']).path.endswith(suffix) and r.get('local_path')]
    return sorted(matches, key=lambda r:(not bool(urlsplit(r['source_url']).query),r['source_url']))[0] if matches else None


def toc_tree(primary, chunks):
    lookup = {}
    for number in range(primary['numchunks']):
        for href, info in chunks[number].items():
            if not len(info['i']) == len(info['t']) == len(info['b']):
                raise ValueError('Misaligned TOC entries')
            for position, index in enumerate(info['i']):
                if index in lookup:
                    raise ValueError('Duplicate TOC node identity')
                lookup[index] = dict(title=info['t'][position], href=href,
                                     bookmark=info['b'][position], chunk=number)
    visited = set()
    def walk(node, ancestors):
        index = node['i']
        if index in visited or index not in lookup:
            raise ValueError('Missing or repeated TOC node')
        visited.add(index)
        item = lookup[index]
        if item['chunk'] != node['c']:
            raise ValueError('TOC chunk mismatch')
        result = {**item, 'id': 'aim-toc-' + str(index), 'source_index': index,
                  'source_node': {k:v for k,v in node.items() if k != 'n'},
                  'breadcrumbs': ancestors + [item['title']]}
        result['children'] = [walk(child, result['breadcrumbs']) for child in node.get('n', [])]
        return result
    roots = [walk(node, []) for node in primary['tree']['n']]
    if visited != set(lookup):
        raise ValueError('TOC mapping contains unvisited nodes')
    return roots, len(visited)


def reconcile(store):
    records = store.records('AIM')
    help_record = by_path(records, '/Data/HelpSystem.xml')
    if not help_record:
        raise ValueError('Published HelpSystem.xml required')
    help_xml = ET.fromstring((store.root / help_record['local_path']).read_bytes())
    for attr in ['Toc','Index','Concepts','BrowseSequence','SearchDatabase','Alias','Synonyms','Glossary','SearchFilterSet']:
        if help_xml.get(attr):
            add(store, help_xml.get(attr), help_record, base=PUBLICATION)
    if help_xml.get('DefaultUrl'):
        add(store, help_xml.get('DefaultUrl'), help_record, 'article', base=PUBLICATION)
    parsed, errors = {}, []
    memberships={name:set() for name in ('toc','index','search_topic','search_url','alias')}
    partitions=[]
    for record in records:
        if record['type'] != 'navigation' or not record.get('local_path'):
            continue
        path = urlsplit(record['source_url']).path
        if path.endswith('.js'):
            try:
                obj = parse_define((store.root / record['local_path']).read_text(encoding='utf-8-sig'))
                parsed[record['id']] = obj
                atomic_json(store.root/'AIM/data/navigation'/(record['id']+'.json'),
                            {'schema_version':1,'source_id':record['id'],'source_sha256':record['sha256'],'data':obj})
                partitions.append({'id':record['id'],'sha256':record['sha256'],'status':'PARSED','family':Path(path).name})
                if isinstance(obj, dict) and 'numchunks' in obj and 'prefix' in obj:
                    for number in range(obj['numchunks']):
                        add(store, obj['prefix'] + str(number) + '.js', record)
                if path.endswith('/Data/Search.js'):
                    # Captured MadCapHelpSystem.LoadTopicChunk and MadCapSearch.Load*Chunk
                    # derive these families from the published boundary arrays.
                    for key, family in [('t','SearchTopic'),('m','SearchMicroContent'),('u','SearchUrl'),('s','SearchStem'),('p','SearchPhrase')]:
                        if not isinstance(obj.get(key), list):
                            raise ValueError('Unsupported search partition map')
                        for number in range(len(obj[key])):
                            add(store, family + '_Chunk' + str(number) + '.js', record)
                def topic(href,title,family,entry_id):
                    resolved=publication_href(href) if href.startswith('/Content/') else urljoin(record['source_url'],href)
                    target=add(store,resolved,record,'article')
                    if title and title not in target['titles']:
                        target['titles'].append(title)
                    item={'original_href':href,'resolved_url':resolved,'discovery_source':record['id'],
                          'source_entry':entry_id,'family':family}
                    if item not in target['occurrences']:target['occurrences'].append(item)
                    store.save_record(target)
                    memberships[family].add(target['id'])
                if '/SearchTopic_Chunk' in path:
                    for key,value in obj.items():
                        topic(value['u'],value.get('t'),'search_topic',key)
                elif '/SearchUrl_Chunk' in path:
                    for href,identifier in obj.items():
                        topic(href,None,'search_url',str(identifier))
                elif '/Index_Chunk' in path:
                    def entries(value,trail):
                        if isinstance(value,dict):
                            if isinstance(value.get('u'),str):topic(value['u'],value.get('t'),'index','/'.join(trail))
                            for key,child in value.items():entries(child,trail+[key])
                        elif isinstance(value,list):
                            for number,child in enumerate(value):entries(child,trail+[str(number)])
                    entries(obj,[])
            except (ValueError, UnicodeError) as error:
                errors.append({'id':record['id'], 'class':'STATIC_DATA_PARSE', 'detail':str(error)})
    primary = by_path(records, '/Data/Tocs/Primary.js')
    toc = None
    if primary and primary['id'] in parsed:
        data = parsed[primary['id']]
        chunks, evidence = {}, []
        for number in range(data['numchunks']):
            chunk = by_path(records, '/Data/Tocs/' + data['prefix'] + str(number) + '.js')
            if chunk and chunk['id'] in parsed:
                chunks[number] = parsed[chunk['id']]
                evidence.append({'id':chunk['id'], 'sha256':chunk['sha256']})
        if len(chunks) == data['numchunks']:
            roots, count = toc_tree(data, chunks)
            def register(nodes):
                for node in nodes:
                    if node['href'] != '___':
                        href = publication_href(node['href'] + node['bookmark'])
                        record = add(store, href, primary, 'article')
                        occurrence = {'original_href':node['href'], 'bookmark':node['bookmark'],
                                      'toc_node':node['id'], 'resolution':'MadCap publication-relative TOC schema',
                                      'discovery_source':primary['id'], 'resolved_url':href}
                        if occurrence not in record['occurrences']:
                            record['occurrences'].append(occurrence)
                        if node['title'] not in record['titles']:
                            record['titles'].append(node['title'])
                        if node['breadcrumbs'] not in record['breadcrumbs']:
                            record['breadcrumbs'].append(node['breadcrumbs'])
                        store.save_record(record)
                        node['resource_id'] = record['id']
                        memberships['toc'].add(record['id'])
                    else:
                        node['resource_id'] = None
                    register(node['children'])
            register(roots)
            toc = {'schema_version':1, 'module':'AIM', 'status':'TOC_RECONCILED',
                   'source':{'id':primary['id'],'sha256':primary['sha256']}, 'partitions':evidence,
                   'node_count':count, 'root_count':len(roots), 'nodes':roots,
                   'discovery_complete':False, 'reason':'Index, search, aliases and article/resource closure remain separate gates.'}
            atomic_json(store.root / 'AIM/manifests/toc.json', toc)
    atomic_json(store.root/'AIM/manifests/discovery-membership.json',{name:sorted(ids) for name,ids in memberships.items()})
    atomic_json(store.root/'AIM/manifests/navigation-partitions.json',partitions)
    report = {'checked_at':now(), 'toc_nodes':toc['node_count'] if toc else None,
              'roots':toc['root_count'] if toc else None, 'parse_errors':errors,
              'discovery_reconciled':False, 'navigation_parsed':len(parsed),
              'membership_counts':{name:len(ids) for name,ids in memberships.items()}}
    atomic_json(store.root / 'AIM/reports/discovery.json', report)
    return report


if __name__ == '__main__':
    root = Path(__file__).resolve().parents[1]
    runtime = Path(os.environ['LOCALAPPDATA']) / 'TAB/SCALE-Intelligence/runtime'
    with writer_lock(root, runtime) as owner:
        store = Store(root,cache_records=True)
        store.checkpoint(owner,phase='DISCOVERY_IN_PROGRESS',worker_running=True)
        try:
            print(json.dumps(reconcile(store)), flush=True)
        finally:
            store.checkpoint(owner,phase='DISCOVERY_INCOMPLETE',worker_running=False)
