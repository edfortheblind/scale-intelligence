"""Read-only captured SQL/table-reference report. Never connects to a database.

The lexer is deliberately bounded: relation-position evidence is not a SQL Server
binding engine. Unqualified names use unique captured dbo candidates; ambiguous,
CTE/temp/derived names and strings are kept out of direct-table reference credit.
"""
from __future__ import annotations
import argparse
from collections import Counter, defaultdict, deque
from dataclasses import dataclass
import hashlib
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
PRIMARY_TYPES = {'P', 'FN', 'IF', 'TF'}
COMMANDS = {'SELECT', 'INSERT', 'UPDATE', 'DELETE', 'MERGE', 'TRUNCATE'}
BOUNDARIES = COMMANDS | {'EXEC', 'EXECUTE', 'RETURN', 'DECLARE', 'IF', 'WHILE', 'BEGIN', 'END', 'GO'}
RESERVED = BOUNDARIES | set('FROM JOIN INNER LEFT RIGHT FULL CROSS OUTER ON WHERE GROUP ORDER HAVING UNION EXCEPT INTERSECT SET VALUES INTO USING WHEN THEN ELSE OUTPUT OPTION WITH AS TOP PIVOT UNPIVOT FOR OFFSET FETCH APPLY AND OR BY TABLE OVER PARTITION DISTINCT ALL NULL IS NOT NOLOCK UPDLOCK ROWLOCK READPAST HOLDLOCK INDEX'.split())

@dataclass(frozen=True)
class Token:
    kind: str
    text: str
    start: int
    end: int
    line: int
    @property
    def upper(self): return self.text.upper()


def lex_sql(text, quoted_identifiers=True):
    """Tokenize nested comments and escaped strings/identifiers without evaluation."""
    out=[];i=0;line=1;n=len(text)
    while i<n:
        a=i;ln=line;c=text[i]
        if c.isspace():
            line += c=='\n';i+=1;continue
        if text.startswith('--',i):
            i=text.find('\n',i)
            if i<0:i=n
            out.append(Token('COMMENT',text[a:i],a,i,ln));continue
        if text.startswith('/*',i):
            i+=2;depth=1
            while i<n and depth:
                if text.startswith('/*',i):depth+=1;i+=2
                elif text.startswith('*/',i):depth-=1;i+=2
                else:i+=1
            line+=text[a:i].count('\n');out.append(Token('COMMENT',text[a:i],a,i,ln));continue
        # N prefix belongs to the literal, not an identifier.
        if c=="'" or (c in 'nN' and i+1<n and text[i+1]=="'") or (c=='"' and not quoted_identifiers):
            if c in 'nN':i+=1
            quote=text[i];i+=1;value=[]
            while i<n:
                if text[i]==quote:
                    if i+1<n and text[i+1]==quote:value.append(quote);i+=2;continue
                    i+=1;break
                value.append(text[i]);i+=1
            line+=text[a:i].count('\n');out.append(Token('STRING',''.join(value),a,i,ln));continue
        if c in '["':
            close=']' if c=='[' else '"';i+=1;value=[]
            while i<n:
                if text[i]==close:
                    if i+1<n and text[i+1]==close:value.append(close);i+=2;continue
                    i+=1;break
                value.append(text[i]);i+=1
            line+=text[a:i].count('\n');out.append(Token('IDENT',''.join(value),a,i,ln));continue
        if c.isalpha() or c in '_@#' or ord(c)>127:
            i+=1
            while i<n and (text[i].isalnum() or text[i] in '_@$#' or ord(text[i])>127):i+=1
            kind='VAR' if c=='@' else 'TEMP' if c=='#' else 'WORD'
            out.append(Token(kind,text[a:i],a,i,ln));continue
        if c.isdigit():
            i+=1
            while i<n and (text[i].isdigit() or text[i]=='.'):i+=1
            out.append(Token('NUMBER',text[a:i],a,i,ln));continue
        i+=1;out.append(Token('SYMBOL',c,a,i,ln))
    return out


class CatalogNames:
    def __init__(self,objects):
        self.objects={x['object_id']:x for x in objects}
        self.qualified=defaultdict(list);self.bare=defaultdict(list)
        for x in objects:
            self.qualified[(x['schema_name'].casefold(),x['name'].casefold())].append(x)
            self.bare[x['name'].casefold()].append(x)
    def resolve(self,parts,allowed=None):
        # Cross-database/server identity cannot be established from this catalog.
        if len(parts)>2 or not parts:return None
        found=self.qualified.get(tuple(x.casefold() for x in parts),[]) if len(parts)==2 else self.bare.get(parts[0].casefold(),[])
        if allowed:found=[x for x in found if x['type'] in allowed]
        if len(found)==1:return found[0]
        return None


def analyze_sql(text,objects,quoted_identifiers=True):
    names=objects if isinstance(objects,CatalogNames) else CatalogNames(objects)
    all_tokens=lex_sql(text,quoted_identifiers);ts=[t for t in all_tokens if t.kind not in {'COMMENT','STRING'}]
    depths=[];stack=[];pairs={};depth=0
    for i,t in enumerate(ts):
        if t.text==')':depth=max(0,depth-1)
        depths.append(depth)
        if t.text=='(':stack.append(i);depth+=1
        elif t.text==')' and stack:a=stack.pop();pairs[a]=i
    def ident(i):
        if i>=len(ts) or ts[i].kind not in {'WORD','IDENT','TEMP','VAR'}:return [],i
        parts=[ts[i].text];j=i+1
        while j<len(ts) and ts[j].text=='.':
            j+=1
            if j<len(ts) and ts[j].kind in {'WORD','IDENT','TEMP','VAR'}:parts.append(ts[j].text);j+=1
            else:parts.append('')
        return parts,j
    def statement_end(i):
        d=depths[i];command=ts[i].upper;insert_select=False
        for j in range(i+1,len(ts)):
            if depths[j]<d:return j
            if depths[j]!=d:continue
            if ts[j].text==';':return j
            if ts[j].upper in BOUNDARIES:
                if command=='INSERT' and ts[j].upper=='SELECT' and not insert_select:insert_select=True;continue
                # CASE END belongs to the expression; conservative extension
                # cannot produce a table target without relation syntax.
                if ts[j].upper=='END' and any(x.upper=='CASE' for x in ts[i:j]):continue
                return j
        return len(ts)
    statements=[(i,statement_end(i)) for i,t in enumerate(ts) if t.kind=='WORD' and t.upper in COMMANDS]
    def scope(i):
        options=[(a,z) for a,z in statements if a<=i<z and depths[a]<=depths[i]]
        return max(options,key=lambda az:(depths[az[0]],az[0])) if options else (0,len(ts))
    ctes=[]
    for i,t in enumerate(ts):
        if t.upper!='WITH' or t.kind!='WORD':continue
        j=i+1;cte_names=[]
        while j<len(ts):
            parts,k=ident(j)
            if len(parts)!=1 or ts[j].kind not in {'WORD','IDENT'}:break
            if k<len(ts) and ts[k].text=='(' and k in pairs:k=pairs[k]+1
            if k+1>=len(ts) or ts[k].upper!='AS' or ts[k+1].text!='(' or k+1 not in pairs:break
            cte_names.append(parts[0].casefold());j=pairs[k+1]+1
            if j<len(ts) and ts[j].text==',':j+=1;continue
            if j<len(ts) and ts[j].upper in COMMANDS:ctes.append((i,statement_end(j),set(cte_names)))
            break
    def shadowed(parts,i):return len(parts)==1 and any(a<=i<z and parts[0].casefold() in ns for a,z,ns in ctes)
    refs=[];unresolved=[];relations=[];aliases=defaultdict(dict);mentions=defaultdict(set)
    def add(parts,i,action,context,target=None):
        if not parts:return
        if parts[0].startswith(('@','#')) or shadowed(parts,i):return
        obj=target or names.resolve(parts,{'U','V','FN','IF','TF'})
        if obj:
            refs.append({'object_id':obj['object_id'],'object_type':obj['type'],'operation':action,'line':ts[i].line,'context':context,'binding':'EXPLICIT_SCHEMA' if len(parts)==2 else 'UNIQUE_CAPTURED_NAME_NOT_RUNTIME_BINDING'})
        else:
            # Publish only source position/class, not arbitrary unresolved names.
            unresolved.append({'line':ts[i].line,'operation':action,'reason':'CROSS_DATABASE_OR_UNRESOLVED_RELATION' if len(parts)>2 else 'UNRESOLVED_RELATION'})
    # Relation clauses. Each comma continuation is tracked at its own nesting
    # depth; join conditions and subsequent clauses end that continuation.
    from_depth={}
    for i,t in enumerate(ts):
        d=depths[i]
        for closed in [key for key in from_depth if key>d]:from_depth.pop(closed,None)
        if t.text==';' or (t.kind=='WORD' and t.upper in COMMANDS|{'WHERE','GROUP','ORDER','HAVING','UNION','EXCEPT','INTERSECT','SET','VALUES','ON','OPTION','RETURN','BEGIN','END'}):from_depth.pop(d,None)
        relation=t.kind=='WORD' and t.upper in {'FROM','JOIN','APPLY','USING'}
        if t.upper=='FROM' and any(x.upper=='FETCH' for x in ts[max(0,i-3):i]):relation=False
        if t.upper=='USING' and not any(ts[a].upper=='MERGE' for a,z in statements if a<=i<z):relation=False
        if t.text==',' and d in from_depth:relation=True
        if not relation:continue
        if t.upper=='FROM':from_depth[d]=i
        j=i+1
        if j>=len(ts):continue
        if ts[j].text=='(':
            end=pairs.get(j,j)+1
            if end<len(ts) and ts[end].upper=='AS':end+=1
            if end<len(ts) and ts[end].kind in {'WORD','IDENT'} and ts[end].upper not in RESERVED:aliases[scope(i)][ts[end].text.casefold()]=None
            continue
        parts,end=ident(j)
        if not parts:continue
        obj=None if parts[0].startswith(('@','#')) or shadowed(parts,j) else names.resolve(parts,{'U','V','FN','IF','TF'})
        # Catalog table names followed by '(' in FROM are not ordinary base
        # relations; leave function/table-hint ambiguity uncredited.
        legacy_hint=(end in pairs and end+1<len(ts) and ts[end+1].upper in {'NOLOCK','UPDLOCK','ROWLOCK','READPAST','HOLDLOCK','INDEX','TABLOCK','TABLOCKX','READCOMMITTED','READUNCOMMITTED'})
        if end<len(ts) and ts[end].text=='(' and obj and obj['type']=='U' and not legacy_hint:
            unresolved.append({'line':ts[j].line,'operation':'SELECT','reason':'RELATION_WITH_PARENTHESIS_AMBIGUOUS'});obj=None
        command=ts[scope(i)[0]].upper if statements else ''
        relation_operation='SELECT' if command=='SELECT' else 'RELATION_READ'
        if obj:add(parts,j,relation_operation,'RELATION_CLAUSE',obj)
        elif not parts[0].startswith(('@','#')) and not shadowed(parts,j):add(parts,j,'SELECT','RELATION_CLAUSE') if not (end<len(ts) and ts[end].text=='(') else None
        k=end
        if legacy_hint:k=pairs[end]+1
        if k<len(ts) and ts[k].upper=='WITH' and k+1 in pairs:k=pairs[k+1]+1
        if k<len(ts) and ts[k].upper=='AS':k+=1
        alias=ts[k].text if k<len(ts) and ts[k].kind in {'WORD','IDENT'} and ts[k].upper not in RESERVED else parts[-1]
        aliases[scope(i)][alias.casefold()]=obj
        relations.append((i,j,parts,obj))
    for i,t in enumerate(ts):
        if t.kind!='WORD' or t.upper not in {'INSERT','UPDATE','DELETE','MERGE','TRUNCATE','INTO'}:continue
        action=t.upper;target_context='DML_TARGET'
        if action=='INTO':
            a,z=scope(i)
            if ts[a].upper!='SELECT':
                if not any(x.kind=='WORD' and x.upper=='OUTPUT' for x in ts[a:i]):continue
                target_context='OUTPUT_INTO_TARGET'
            action='INSERT'
        j=i+1
        if j<len(ts) and ts[j].upper=='TOP':
            j+=1
            if j in pairs:j=pairs[j]+1
            elif j<len(ts) and ts[j].kind=='NUMBER':j+=1
            if j<len(ts) and ts[j].upper=='PERCENT':j+=1
        if j<len(ts) and ts[j].upper in {'INTO','FROM','TABLE'}:j+=1
        parts,end=ident(j)
        if not parts or parts[0].upper() in RESERVED:continue
        if parts[0].startswith(('@','#')) or shadowed(parts,j):continue
        a,z=scope(i);aliasmap=aliases[(a,z)]
        if len(parts)==1 and parts[0].casefold() in aliasmap:
            target=aliasmap[parts[0].casefold()]
            if target:add(parts,j,action,'RESOLVED_DML_ALIAS',target)
            else:unresolved.append({'line':ts[j].line,'operation':action,'reason':'DERIVED_OR_CTE_DML_TARGET'})
        else:add(parts,j,action,target_context)
    # Token occurrences are a distinct, non-credit channel: column/variable
    # names can coincide with table names. Never infer use from these alone.
    for t in ts:
        if t.kind not in {'WORD','IDENT'}:continue
        obj=names.resolve([t.text],{'U'})
        if obj:mentions[obj['object_id']].add(t.line)
    dynamic=[]
    visible=[t for t in all_tokens if t.kind!='COMMENT']
    for i,t in enumerate(visible):
        if t.kind!='WORD' or t.upper not in {'EXEC','EXECUTE'}:continue
        following=visible[i+1:i+5]
        if not following:continue
        if following[0].kind=='VAR' and len(following)>1 and following[1].text=='=':following=following[2:]
        if following and (following[0].kind in {'VAR','STRING'} or following[0].text=='(' or any(x.text.casefold()=='sp_executesql' for x in following)):
            dynamic.append({'line':t.line,'state':'RUNTIME_SQL_OR_PROCEDURE_TARGET_NOT_FULLY_RESOLVED'})
    unique={tuple(sorted(x.items())):x for x in refs}
    return {'references':sorted(unique.values(),key=lambda x:(x['line'],x['object_id'],x['operation'])),'lexical_mentions':{k:sorted(v) for k,v in mentions.items()},'unresolved_relations':unresolved,'dynamic_execution_sites':dynamic,'literal_tokens':[t for t in all_tokens if t.kind=='STRING']}


def sha(path): return hashlib.sha256(path.read_bytes()).hexdigest()
def load(path): return json.loads(path.read_text(encoding='utf-8-sig'))

LIMITS = [
    'A captured source reference establishes a static relationship, not that a module ran, a branch was reached, or a table is currently active.',
    'NO_CAPTURED_REFERENCE means none of the credited channels in this exact retained corpus identified the table. It does not establish that the table is unused, obsolete, a backup, safe to delete, or absent from external application SQL.',
    'Dynamic SQL, runtime-selected identifiers, external callers, client-generated SQL, uncaptured jobs and historical/other database code can use tables without a resolvable reference here.',
    'The bounded lexer recognizes named SQL relation/DML positions and local aliases/CTEs; it is not the SQL Server binder. Unqualified names assume a unique captured name, not verified caller/default-schema resolution. Unsupported or ambiguous syntax remains explicit.',
    'DDL, DBCC, permission statements and metadata-function arguments are not comprehensively classified by the parser. Their table relationships depend on captured catalog dependencies or reviewed effects; unmatched identifiers/string arguments remain non-credit observations.',
    'Identifier tokens and string-contained names are separate non-credit observations. Column names and configuration text can match table names; neither proves an executed table access.',
    'Foreign keys are structural relationships and never count as procedure/function usage. View paths are catalog/source paths; attached trigger paths are possibilities, not proof the event fired.',
    'Owner backup/leftover and item-master-failure suggestions are hypotheses. Name patterns and missing references do not validate them. No deletion recommendation is made.',
    'Current replica status is owner-attested. This task documents the captured source as-is and requires no application version/build or extension development.',
]


def owner_hypotheses(name):
    result=[]
    if name.upper().startswith('D_'):
        result.append({'kind':'D_PREFIX_BACKUP_OR_LEFTOVER','state':'OWNER_HYPOTHESIS_UNCONFIRMED','basis':'Owner suggested D_ tables might be backup/leftover tables; the prefix alone does not establish purpose or current use.'})
    if re.search(r'(?:^|_)(?:ORIG)?(?:\d{8}|\d{6})(?:$|_)',name,re.I) or re.search(r'(?:^|_)fy\d{4}(?:$|_)',name,re.I):
        result.append({'kind':'DATE_LIKE_NAME_BACKUP_OR_LEFTOVER','state':'OWNER_HYPOTHESIS_UNCONFIRMED','basis':'A date-like name is a triage hint only; no creation/copy/retention lifecycle follows from it.'})
    if name.casefold()=='interface_item_failure_1024':
        result.append({'kind':'OWNER_SPECIFIC_BACKUP_OR_LEFTOVER','state':'OWNER_HYPOTHESIS_UNCONFIRMED','basis':'Owner suggested this exact table might be a backup. The 1024 suffix is not treated as a proven date, and neither a name nor missing captured references proves a backup lifecycle.'})
        result.append({'kind':'ITEM_MASTER_FAILURE_RECORDS','state':'OWNER_HYPOTHESIS_UNCONFIRMED','basis':'Owner suggested item-master failures. Six named fields and 154 generic fields do not establish a producer, consumer, field meanings or failure workflow.'})
    return result


def reference_status(channels):
    return 'REFERENCED_IN_CAPTURED_SOURCE' if any(channels.get(k) for k in ('catalog','semantic','lexical')) else 'NO_CAPTURED_REFERENCE'


def contract_effects(contract,names):
    """Retain actual JSON coordinates, including annotated legacy lists."""
    out=[]
    for i,e in enumerate(contract.get('effects',[])):
        out.append({**e,'source_field':'effects','source_index':i,'reviewed_annotation':None})
    for field,rel in [('reads','READS'),('writes','WRITES'),('calls','CALLS')]:
        for i,value in enumerate(contract.get(field,[])):
            prefix=value if isinstance(value,str) else '';annotation=None
            if '(' in prefix and prefix.rstrip().endswith(')'):
                cut=prefix.index('(');annotation=prefix[cut:].strip();prefix=prefix[:cut].strip()
            ts=lex_sql(prefix);parts=[];valid=True
            for j,t in enumerate(ts):
                if j%2==0 and t.kind in {'WORD','IDENT'}:parts.append(t.text)
                elif j%2==1 and t.text=='.':continue
                else:valid=False
            target=names.resolve(parts) if valid and len(ts)%2==1 else None
            out.append({'relationship':rel,'object_id':target['object_id'] if target else None,'source_field':field,'source_index':i,'reviewed_annotation':annotation})
    return out


def build_report(root=ROOT, private_modules=None, require_complete_contracts=False):
    root=Path(root).resolve();db=root/'DB Architecture';input_hashes={}
    def read_input(relative):
        path=root/relative;input_hashes[relative]=sha(path);return load(path)
    summary=read_input('DB Architecture/evidence/summary.json')
    catalog={n:read_input('DB Architecture/catalog/'+n+'.json') for n in ['objects','modules','dependencies','foreign_keys','foreign_key_columns','triggers']}
    names=CatalogNames(catalog['objects']);objects=names.objects;modules={x['object_id']:x for x in catalog['modules']};tables={oid:o for oid,o in objects.items() if o['type']=='U'}
    primary={oid for oid in modules if objects[oid]['type'] in PRIMARY_TYPES}
    eligible_contracts={oid for oid in modules if objects[oid]['type'] in PRIMARY_TYPES|{'V','TR'}}
    per_table={oid:{'catalog':defaultdict(list),'semantic':defaultdict(list),'lexical':defaultdict(list)} for oid in tables}
    lexical_mentions={oid:{} for oid in tables};literal_mentions={oid:{} for oid in tables}
    module_bindings={};module_graph=defaultdict(set);unresolved_dependencies=[];semantic_unresolved=[];dynamic_reviews=[]
    contract_ids=set();batch_bindings=[]
    for path in sorted((db/'mappings/batches').glob('*.json')):
        relative=path.relative_to(root).as_posix();batch=read_input(relative);contracts=batch.get('semantic_contracts',[])
        if contracts:batch_bindings.append({'path':relative,'sha256':input_hashes[relative],'module_ids':[c['object_id'] for c in contracts]})
        for ci,c in enumerate(contracts):
            mid=c['object_id']
            if mid in contract_ids:raise ValueError('Duplicate semantic contract '+str(mid))
            if mid not in modules or c['source_definition_sha256']!=modules[mid]['source_definition_sha256']:raise ValueError('Semantic contract snapshot/source mismatch '+str(mid))
            contract_ids.add(mid)
            for e in contract_effects(c,names):
                target=e.get('object_id');rel=e.get('relationship')
                binding={'batch_path':relative,'batch_sha256':input_hashes[relative],'contract_index':ci,'source_field':e['source_field'],'source_index':e['source_index'],'json_pointer':f'/semantic_contracts/{ci}/{e["source_field"]}/{e["source_index"]}','relationship':rel,'reviewed_annotation':e['reviewed_annotation'],'scope':e.get('scope','REVIEWED_CONTRACT_EFFECT; DIRECT_VERSUS_CALLED_SCOPE_NOT_STANDARDIZED')}
                if target in tables and rel in {'READS','WRITES'}:per_table[target]['semantic'][mid].append(binding)
                elif target in modules and rel in {'CALLS','READS'}:module_graph[mid].add(target)
                elif target is None and rel in {'READS','WRITES'}:semantic_unresolved.append({'module_id':mid,'batch_path':relative,'contract_index':ci,'source_field':e['source_field'],'source_index':e['source_index'],'relationship':rel,'reason':'NO_CAPTURED_TABLE_OBJECT_ID'})
        for review in batch.get('dynamic_review',[]):
            dynamic_reviews.append({'module_id':review['object_id'],'batch_path':relative,'batch_sha256':input_hashes[relative],'review_state':review.get('review_state'),'source_definition_sha256':review.get('source_definition_sha256')})
    missing_contracts=sorted(eligible_contracts-contract_ids)
    if require_complete_contracts and missing_contracts:raise ValueError('Final semantic batch coverage is incomplete: '+str(len(missing_contracts)))
    for i,d in enumerate(catalog['dependencies']):
        mid=d['referencing_id'];target=d.get('referenced_id')
        if mid not in modules:continue
        if target in tables:
            per_table[target]['catalog'][mid].append({'row_index':i,'referencing_minor_id':d.get('referencing_minor_id'),'referenced_minor_id':d.get('referenced_minor_id'),'is_schema_bound_reference':d.get('is_schema_bound_reference'),'is_ambiguous':d.get('is_ambiguous'),'is_caller_dependent':d.get('is_caller_dependent')})
        elif target in modules:module_graph[mid].add(target)
        elif target is None:
            parts=[d.get('referenced_schema_name'),d.get('referenced_entity_name')];parts=[p for p in parts if p]
            candidate=names.resolve(parts,{'U'}) if not d.get('referenced_database_name') and not d.get('referenced_server_name') else None
            unresolved_dependencies.append({'module_id':mid,'row_index':i,'candidate_table_id':candidate['object_id'] if candidate else None,'reason':'CATALOG_NULL_TARGET_ID_NOT_RESOLVED_BY_NAME_ONLY'})
    originals={};private_provenance={'loaded':False,'definition_count':0,'scope':'Optional original strings not inspected in this run.'}
    if private_modules:
        originals={x['object_id']:x for x in load(Path(private_modules))}
        private_provenance={'loaded':True,'captured_original_file_sha256':sha(Path(private_modules)),'definition_count':len(originals),'scope':'Exact captured original hashes checked. Only known catalog table identities and line coordinates from strings are published; raw original SQL/string values are omitted.'}
    for mid,m in sorted(modules.items()):
        relative='DB Architecture/'+m['redacted_path'];path=root/relative
        if sha(path)!=m['redacted_sha256']:raise ValueError('Retained module hash mismatch '+str(mid))
        text=path.read_text(encoding='utf-8');result=analyze_sql(text,names,m.get('uses_quoted_identifier',True))
        module_bindings[str(mid)]={'qualified_name':objects[mid]['qualified_name'],'object_type':objects[mid]['type'],'reading_path':relative,'reading_sha256':m['redacted_sha256'],'source_definition_sha256':m['source_definition_sha256'],'reading_lines':len(text.splitlines()),'semantic_contract_present':mid in contract_ids,'dynamic_execution_sites':result['dynamic_execution_sites'],'unresolved_relation_positions':result['unresolved_relations'],'catalog_dynamic_candidate':m.get('static_features',{}).get('dynamic_sql_candidate',False)}
        for ref in result['references']:
            target=ref['object_id']
            if target in tables:per_table[target]['lexical'][mid].append({k:v for k,v in ref.items() if k not in {'object_id','object_type'}})
            elif target in modules:module_graph[mid].add(target)
        for target,lines in result['lexical_mentions'].items():lexical_mentions[target][mid]=lines
        if originals:
            original=originals.get(mid,{}).get('definition')
            if not isinstance(original,str) or hashlib.sha256(original.encode('utf-8')).hexdigest()!=m['source_definition_sha256']:raise ValueError('Captured original hash mismatch '+str(mid))
            # String identifiers and SQL-shaped fragments are observations only.
            # They are NOT executed SQL or an inferred caller relationship.
            for tok in lex_sql(original,m.get('uses_quoted_identifier',True)):
                if tok.kind!='STRING':continue
                found=set()
                for inner in lex_sql(tok.text):
                    if inner.kind in {'WORD','IDENT'}:
                        target=names.resolve([inner.text],{'U'})
                        if target:found.add(target['object_id'])
                if not found:continue
                fragment=set()
                if re.search(r'\b(?:SELECT|INSERT|UPDATE|DELETE|MERGE|TRUNCATE)\b',tok.text,re.I):
                    fragment={x['object_id'] for x in analyze_sql(tok.text,names)['references'] if x['object_type']=='U'}
                for target in found:
                    literal_mentions[target].setdefault(mid,[]).append({'original_line':tok.line,'classification':'SQL_SHAPED_LITERAL_REFERENCE_EXECUTION_UNPROVEN' if target in fragment else 'LITERAL_IDENTIFIER_MENTION_NOT_TABLE_USAGE'})
    table_records=[];discrepancies=[];discrepancy_counts=Counter();status_counts=Counter();primary_counts=Counter();hypothesis_counts=Counter();reference_channel_counts=Counter()
    # Catalog/explicit module paths use a graph of static relationships. Retain
    # shortest examples, not a claim that a caller executed this path.
    reverse=defaultdict(set)
    for caller,targets in module_graph.items():
        for target in targets:reverse[target].add(caller)
    for tid,o in sorted(tables.items(),key=lambda x:x[1]['qualified_name'].casefold()):
        channels=per_table[tid];direct=set().union(*(set(v) for v in channels.values()));status=reference_status(channels);status_counts[status]+=1
        source_direct=set(channels['catalog'])|set(channels['lexical'])
        p_direct=sorted(source_direct&primary);pstatus='REFERENCED_IN_CAPTURED_SOURCE' if p_direct else 'NO_CAPTURED_DIRECT_PRIMARY_REFERENCE';primary_counts[pstatus]+=1
        evidence=[]
        for mid in sorted(direct):
            present=[k for k in ['catalog','semantic','lexical'] if mid in channels[k]]
            evidence.append({'module_id':mid,'module_type':objects[mid]['type'],'channels':present,'catalog_dependency_records':channels['catalog'].get(mid,[]),'reviewed_effects':channels['semantic'].get(mid,[]),'lexical_relation_evidence':channels['lexical'].get(mid,[])})
            classification='+'.join(present);discrepancy_counts[classification]+=1
            if len(present)!=3:
                discrepancies.append({'table_id':tid,'module_id':mid,'present_channels':present,'semantic_contract_present':mid in contract_ids,'interpretation':'Cross-source coverage difference; not automatically an error. SQL catalog binding, reviewed effect scope, parser limits and dynamic SQL differ.'})
        for key in channels:
            if channels[key]:reference_channel_counts[key]+=1
        fk_out=[x for x in catalog['foreign_keys'] if x['parent_object_id']==tid];fk_in=[x for x in catalog['foreign_keys'] if x['referenced_object_id']==tid]
        # Reverse shortest paths from directly referencing modules.
        paths={mid:[mid] for mid in source_direct};queue=deque(sorted(source_direct))
        while queue:
            node=queue.popleft()
            for caller in sorted(reverse[node]):
                if caller not in paths:paths[caller]=[caller]+paths[node];queue.append(caller)
        indirect={mid:path for mid,path in paths.items() if mid in primary and mid not in source_direct}
        via_views={mid:path for mid,path in paths.items() if mid in primary and any(objects[x]['type']=='V' for x in path)}
        trigger_paths=[]
        for tr in catalog['triggers']:
            if tr['object_id'] in direct:
                trigger_paths.append({'attached_table_id':tr['parent_id'],'trigger_module_id':tr['object_id'],'target_table_id':tid,'is_disabled':tr['is_disabled'],'scope':'ATTACHMENT_AND_TRIGGER_SOURCE_ONLY; EVENT_MATCH_AND_ACTUAL_FIRING_NOT_ESTABLISHED'})
        hypotheses=owner_hypotheses(o['name'])
        for h in hypotheses:hypothesis_counts[h['kind']]+=1
        reasons=[]
        if status=='REFERENCED_IN_CAPTURED_SOURCE':reasons.append('At least one captured catalog dependency, reviewed explicit table effect or bounded SQL relation position identifies this table.')
        else:reasons.append('No credited catalog-ID dependency, reviewed table effect or bounded named relation position found across the retained modules.')
        if not p_direct:reasons.append('No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.')
        if literal_mentions[tid]:reasons.append('Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.')
        if lexical_mentions[tid] and not channels['lexical']:reasons.append('Identifier tokens occur outside a recognized relation position; column/alias text may explain them.')
        if status=='NO_CAPTURED_REFERENCE' and (fk_in or fk_out):reasons.append('Foreign-key relationships exist; they do not count as routine usage.')
        if tid==1644689057:reasons.append('Functional purpose remains unresolved. The owner item-master-failure suggestion is retained only as a hypothesis; no role credit is added.')
        table_records.append({'object_id':tid,'qualified_name':o['qualified_name'],'reference_status':status,'primary_routine_direct_status':pstatus,'primary_routine_direct_ids':p_direct,'primary_routine_reviewed_effect_ids':sorted(set(channels['semantic'])&primary),'primary_routine_any_evidence_ids':sorted(direct&primary),'other_module_direct_ids':sorted(source_direct-primary),'other_module_reviewed_effect_ids':sorted(set(channels['semantic'])-primary),'reference_evidence':evidence,'module_path_context':{'primary_indirect_module_count':len(indirect),'primary_indirect_module_ids':sorted(indirect),'shortest_path_examples':[{'module_ids':path,'table_id':tid} for mid,path in sorted(indirect.items())[:12]],'primary_paths_containing_view_count':len(via_views),'view_path_examples':[{'module_ids':path,'table_id':tid} for mid,path in sorted(via_views.items())[:12]],'attached_trigger_paths':trigger_paths,'limits':'Paths are static possibilities. At most 12 shortest path examples are shown; complete indirect module IDs and counts are retained. Trigger activation requires matching events and runtime execution.'},'structural_foreign_keys':{'outgoing_ids':[x['object_id'] for x in fk_out],'incoming_ids':[x['object_id'] for x in fk_in],'outgoing':fk_out,'incoming':fk_in,'counted_as_routine_use':False},'non_credit_observations':{'identifier_token_mentions':[{'module_id':mid,'reading_lines':lines} for mid,lines in sorted(lexical_mentions[tid].items())],'original_string_mentions':[{'module_id':mid,'mentions':mentions} for mid,mentions in sorted(literal_mentions[tid].items())],'catalog_null_target_candidates':[x for x in unresolved_dependencies if x['candidate_table_id']==tid]},'owner_hypotheses':hypotheses,'reasons':reasons,'deletion_or_unused_conclusion':'NOT_ESTABLISHED'})
    counts={'tables':len(tables),'retained_source_modules':len(modules),'primary_routine_modules':len(primary),'primary_module_types':dict(sorted(Counter(objects[mid]['type'] for mid in primary).items())),'other_source_module_types':dict(sorted(Counter(objects[mid]['type'] for mid in modules if mid not in primary).items())),'semantic_contract_modules':len(contract_ids),'semantic_contract_eligible_modules':len(eligible_contracts),'semantic_contract_missing_modules':len(missing_contracts),'table_statuses':dict(status_counts),'primary_direct_statuses':dict(primary_counts),'tables_by_reference_channel':dict(reference_channel_counts),'module_table_channel_combinations':dict(sorted(discrepancy_counts.items())),'cross_source_discrepancies':len(discrepancies),'dynamic_execution_modules':sum(bool(x['dynamic_execution_sites']) for x in module_bindings.values()),'dynamic_execution_sites':sum(len(x['dynamic_execution_sites']) for x in module_bindings.values()),'unresolved_catalog_dependency_records':len(unresolved_dependencies),'unresolved_semantic_effects':len(semantic_unresolved),'owner_hypothesis_counts':dict(hypothesis_counts)}
    return {'schema_version':1,'artifact_kind':'CAPTURED_TABLE_USAGE_CORRELATION','snapshot_id':summary['snapshot_id'],'review_state':'AUTOMATED_CAPTURED_CORRELATION_WITH_EXPLICIT_LIMITS','scope':'All captured P/FN/IF/TF source bodies versus all U tables; views/triggers/default modules and structural FKs are separately identified. No runtime use, unused-table finding or new role/semantic credit.','status_definition':{'REFERENCED_IN_CAPTURED_SOURCE':'At least one credited catalog target ID, reviewed table effect or bounded static relation/DML position identifies the table in a captured module.','NO_CAPTURED_REFERENCE':'No credited reference in this retained module corpus; never proof of unused/backup/obsolete status.'},'counts':counts,'input_sha256':input_hashes,'tool_sha256':sha(root/'tools/report_table_usage.py'),'private_original_observation':private_provenance,'module_sources':module_bindings,'semantic_batch_bindings':batch_bindings,'missing_semantic_contract_module_ids':missing_contracts,'dynamic_review_bindings':dynamic_reviews,'unresolved_catalog_dependencies':unresolved_dependencies,'unresolved_semantic_effects':semantic_unresolved,'cross_source_discrepancies':discrepancies,'tables':table_records,'limitations':LIMITS}


def render_report(report):
    c=report['counts'];states=c['table_statuses'];out=['# Captured table usage review','',f"All {c['tables']} captured tables were compared with {c['primary_routine_modules']} stored procedures/functions and {c['retained_source_modules']} total retained source modules. This is a source-correlation report; it does not identify unused tables.",'',f"Snapshot: `{report['snapshot_id']}`. The owner accepts the current replica as the documentation baseline.",'','| Measure | Count |','| --- | ---: |']
    for label,value in [('Tables with a credited captured reference',states.get('REFERENCED_IN_CAPTURED_SOURCE',0)),('Tables with no credited captured reference',states.get('NO_CAPTURED_REFERENCE',0)),('P/FN/IF/TF modules scanned',c['primary_routine_modules']),('All retained source modules scanned',c['retained_source_modules']),('Reviewed semantic contracts correlated',c['semantic_contract_modules']),('Eligible modules missing a reviewed contract',c['semantic_contract_missing_modules']),('Runtime SQL/target sites unresolved by this scanner',c['dynamic_execution_sites']),('Cross-source channel differences',c['cross_source_discrepancies'])]:out.append(f'| {label} | {value} |')
    out += ['', '## How to read the result','', 'A catalog target ID, a reviewed READS/WRITES effect, or a named relation/DML position can establish a captured reference. The JSON records each channel separately, with exact module, source and batch hashes. Contract-associated references retain their original field/index and annotation; their direct or delegated scope is not assumed. Direct module counts use catalog or lexical relation evidence. Precise SELECT/INSERT/UPDATE/DELETE tokens are attributed only by the bounded source parser; a reviewed WRITES effect does not by itself specify which DML statement occurred.','', 'Foreign keys and token/string mentions are separate. A literal containing a table name may be configuration text or part of runtime-built SQL; it is not credited as an executed reference. Static view/module paths and attached-trigger paths do not prove that an application follows them.','', 'The 518-table denominator includes custom, staging and alternate record shapes. A missing reference cannot exclude application-generated SQL, external code, dynamic identifiers or uncaptured historical consumers. No percentage of unused tables is calculated.','', '## Owner hypotheses','', 'The owner suggested that D_ or date-like names might indicate backup/leftover tables. For Interface_Item_Failure_1024 the owner suggested both a backup table and an item-master-failure purpose; 1024 is not treated as a proven date. These hypotheses remain unconfirmed. The following entries retain their actual captured-reference status; neither a name nor a missing reference establishes lifecycle or purpose.','', '| Table | Captured reference status | Owner hypothesis |','| --- | --- | --- |']
    for t in report['tables']:
        if t['owner_hypotheses']:out.append(f"| `{t['qualified_name']}` | {t['reference_status']} | "+'; '.join(h['kind'] for h in t['owner_hypotheses'])+' |')
    out += ['', '## Tables without a credited captured reference','', 'Review the JSON non-credit observations, unresolved runtime SQL and external-caller limits before interpreting this list. This list is not a deletion or cleanup recommendation.','']
    for t in report['tables']:
        if t['reference_status']=='NO_CAPTURED_REFERENCE':out.append(f"- `{t['qualified_name']}` ({t['object_id']}): "+' '.join(t['reasons'][1:]))
    out += ['', '## All table results','', '| Table | Source status | Direct SP/function modules | Other direct modules | FK in / out |','| --- | --- | ---: | ---: | --- |']
    for t in report['tables']:
        fk=t['structural_foreign_keys'];out.append(f"| [`{t['qualified_name']}`](objects/{t['object_id']}.json) | {t['reference_status']} | {len(t['primary_routine_direct_ids'])} | {len(t['other_module_direct_ids'])} | {len(fk['incoming_ids'])} / {len(fk['outgoing_ids'])} |")
    out += ['', '## Evidence and limits','', '[Exact table/module evidence, cross-source differences and input hashes](mappings/table-usage.json).','']+['- '+x for x in report['limitations']]
    return '\n'.join(out)+'\n'


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root',type=Path,default=ROOT)
    parser.add_argument('--private-modules',type=Path,help='Optional authorized exact captured modules.json; original text is never written to the report.')
    parser.add_argument('--require-complete-contracts',action='store_true')
    parser.add_argument('--output-json',type=Path)
    parser.add_argument('--output-markdown',type=Path)
    args=parser.parse_args();report=build_report(args.root,args.private_modules,args.require_complete_contracts)
    jp=args.output_json or args.root/'DB Architecture/mappings/table-usage.json';mp=args.output_markdown or args.root/'DB Architecture/TABLE_USAGE_REVIEW.md'
    for p in [jp,mp]:p.parent.mkdir(parents=True,exist_ok=True)
    jp.write_text(json.dumps(report,indent=2,ensure_ascii=False)+'\n',encoding='utf-8',newline='\n');mp.write_text(render_report(report),encoding='utf-8',newline='\n')
    print(json.dumps({'counts':report['counts'],'files':[{'path':str(p),'sha256':sha(p),'bytes':p.stat().st_size} for p in [jp,mp]]}))

if __name__=='__main__':main()
