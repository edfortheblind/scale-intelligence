"""Map published AIM controls to their original documentary bodies, without execution."""
from collector import digest


def reconcile(content,references,catalog):
    from article_data import nodes, text_of
    all_nodes=list(nodes(content))
    edges=[]
    issues=[]
    conditions=[]
    def classes(n):return set((n['attrs'].get('class') or '').split())
    for node in all_nodes:
        cls=classes(node)
        if 'MCDropDown' in cls:
            descendants=list(nodes(node))
            controls=[n for n in descendants if 'MCDropDownHotSpot' in classes(n)]
            bodies=[n for n in descendants if 'MCDropDownBody' in classes(n)]
            if len(controls)!=1 or len(bodies)!=1:
                issues.append({'class':'AMBIGUOUS_DROPDOWN','node_id':node['node_id']})
            else:
                edges.append({'kind':'dropdown','control_node':controls[0]['node_id'],'body_node':bodies[0]['node_id'],
                    'body_text_sha256':digest(text_of(bodies[0]).encode('utf-8')),'representation':'expanded_static_body'})
        if 'MCToggler' in cls or 'data-mc-targets' in node['attrs']:
            names=(node['attrs'].get('data-mc-targets') or '').split(';')
            for name in names:
                bodies=[n for n in all_nodes if name and n['attrs'].get('data-mc-target-name')==name]
                if not bodies:issues.append({'class':'MISSING_TOGGLE_TARGET','node_id':node['node_id'],'target_name':name})
                for body in bodies:
                    edges.append({'kind':'toggler','control_node':node['node_id'],'body_node':body['node_id'],'target_name':name,
                        'source_control_attributes':node['attrs'],'source_body_attributes':body['attrs'],
                        'body_text_sha256':digest(text_of(body).encode('utf-8')),'representation':'expanded_static_body'})
        if 'MCTopicPopup' in cls:
            refs=[r for r in references if r['node_id']==node['node_id'] and r['attribute']=='href']
            target=catalog.get(refs[0].get('target_id')) if len(refs)==1 else None
            if not target or target['status']!='BODY_SAVED':
                issues.append({'class':'POPUP_TARGET_NOT_CAPTURED','node_id':node['node_id']})
            else:
                edges.append({'kind':'topic_popup','control_node':node['node_id'],'target_id':target['id'],'target_sha256':target['sha256'],
                    'original_href':node['attrs']['href'],'representation':'local_link_to_preserved_target_article'})
        if 'data-mc-conditions' in node['attrs']:
            conditions.append({'node_id':node['node_id'],'literal_condition':node['attrs']['data-mc-conditions'],
                'text_sha256':digest(text_of(node).encode('utf-8')),'representation':'all_published_text_retained'})
    return {'schema_version':1,'control_body_edges':edges,'condition_nodes':conditions,'issues':issues,
            'static_relationships_passed':not issues,'renderer_semantics_evidence_sha256':'7c1af71802e734ceae9e9eb001cb2b12a72ef2d9726d7518a52df93f5975d214'}
