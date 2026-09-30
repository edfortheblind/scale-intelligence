"""Source-only table relation extraction; no SQL Server execution."""
from pathlib import Path
import sys
import unittest
import hashlib
import json
import tempfile
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
from report_table_usage import analyze_sql,lex_sql,CatalogNames,reference_status,owner_hypotheses,contract_effects,build_report

OBJECTS=[{'object_id':i,'schema_name':s,'name':n,'qualified_name':s+'.'+n,'type':t} for i,s,n,t in [(1,'dbo','ITEM','U'),(2,'dbo','WAREHOUSE','U'),(3,'dbo','A B','U'),(4,'dbo','VIEW_ITEM','V'),(5,'dbo','fn_Items','IF')]]
class TableUsageTests(unittest.TestCase):
 def analyze(self,sql):return analyze_sql(sql,OBJECTS)
 def refs(self,sql):return {(x['object_id'],x['operation']) for x in self.analyze(sql)['references']}
 def test_comments_and_values_are_not_relations(self):
  self.assertEqual(self.refs("-- SELECT * FROM ITEM\n/* nested /* DELETE ITEM */ ignored */ SELECT 'UPDATE ITEM SET x=1', N'WAREHOUSE'"),set())
 def test_nested_comments_and_escaped_strings(self):
  tokens=lex_sql("/* outer /* inner */ done */ N'can''t FROM ITEM' [A]]B] \"A\"\"B\"")
  self.assertEqual([x.kind for x in tokens],['COMMENT','STRING','IDENT','IDENT'])
  self.assertEqual(tokens[1].text,"can't FROM ITEM")
  self.assertEqual(tokens[2].text,'A]B')
 def test_qualified_and_quoted_names(self):
  self.assertEqual(self.refs('SELECT * FROM [dbo].[A B] a JOIN "dbo"."ITEM" i ON a.x=i.x'),{(3,'SELECT'),(1,'SELECT')})
 def test_update_alias_resolves_target(self):
  refs=self.refs('UPDATE i SET x=1 FROM dbo.ITEM AS i JOIN WAREHOUSE w ON i.x=w.x')
  self.assertIn((1,'UPDATE'),refs);self.assertIn((2,'RELATION_READ'),refs);self.assertNotIn((2,'UPDATE'),refs)
 def test_alias_named_like_other_table_does_not_credit_it(self):
  refs=self.refs('UPDATE ITEM SET x=1 FROM WAREHOUSE AS ITEM')
  self.assertEqual(refs,{(2,'UPDATE'),(2,'RELATION_READ')})
 def test_delete_alias_and_direct(self):
  self.assertIn((1,'DELETE'),self.refs('DELETE i FROM ITEM i WHERE x=1'))
  self.assertEqual(self.refs('DELETE FROM ITEM'),{(1,'DELETE'),(1,'RELATION_READ')})
 def test_insert_select_distinguishes_source_target(self):
  self.assertEqual(self.refs('INSERT INTO ITEM (x) SELECT x FROM WAREHOUSE'),{(1,'INSERT'),(2,'SELECT')})
 def test_cte_shadows_only_its_statement(self):
  refs=self.refs('WITH ITEM AS (SELECT x FROM WAREHOUSE) SELECT * FROM ITEM; SELECT * FROM dbo.ITEM')
  self.assertEqual(refs,{(2,'SELECT'),(1,'SELECT')})
  self.assertEqual(self.refs('WITH ITEM AS (SELECT x FROM WAREHOUSE) SELECT * FROM ITEM'),{(2,'SELECT')})
 def test_cte_column_list_and_recursive_shadow(self):
  self.assertEqual(self.refs('WITH ITEM (x) AS (SELECT x FROM WAREHOUSE UNION ALL SELECT x FROM ITEM) SELECT * FROM ITEM'),{(2,'SELECT')})
 def test_temp_and_table_variable_are_not_catalog_tables(self):
  self.assertEqual(self.refs('INSERT #ITEM SELECT * FROM @WAREHOUSE; UPDATE #ITEM SET x=2; DELETE FROM @ITEM'),set())
 def test_derived_table_alias_target_stays_unresolved(self):
  result=self.analyze('UPDATE ITEM SET x=1 FROM (SELECT x FROM WAREHOUSE) AS ITEM')
  self.assertEqual({(x['object_id'],x['operation']) for x in result['references']},{(2,'SELECT')})
  self.assertIn('DERIVED_OR_CTE_DML_TARGET',{x['reason'] for x in result['unresolved_relations']})
 def test_comma_relations_and_subquery(self):
  self.assertEqual(self.refs('SELECT * FROM ITEM i, WAREHOUSE w WHERE EXISTS (SELECT 1 FROM dbo.ITEM z)'),{(1,'SELECT'),(2,'SELECT')})
 def test_hints(self):
  self.assertEqual(self.refs('SELECT * FROM ITEM WITH (NOLOCK); SELECT * FROM WAREHOUSE (UPDLOCK)'),{(1,'SELECT'),(2,'SELECT')})
 def test_cross_database_name_not_assumed_local(self):
  self.assertEqual(self.refs('SELECT * FROM otherdb.dbo.ITEM'),set())
  self.assertTrue(self.analyze('SELECT * FROM otherdb.dbo.ITEM')['unresolved_relations'])
 def test_same_named_non_dbo_objects_remain_ambiguous(self):
  objects=OBJECTS+[{'object_id':6,'schema_name':'other','name':'ITEM','qualified_name':'other.ITEM','type':'U'}]
  self.assertEqual(analyze_sql('SELECT * FROM ITEM',objects)['references'],[])
 def test_runtime_sql_strings_separate_from_direct_relations(self):
  result=self.analyze("DECLARE @s nvarchar(max); SET @s=N'SELECT * FROM ITEM'; EXEC(@s)")
  self.assertEqual(result['references'],[]);self.assertEqual(len(result['dynamic_execution_sites']),1)
 def test_return_assignment_not_dynamic_execution(self):
  self.assertEqual(self.analyze('EXEC @result = dbo.NamedProc @a')['dynamic_execution_sites'],[])
  self.assertEqual(len(self.analyze('EXEC @proc')['dynamic_execution_sites']),1)
 def test_sp_executesql_is_dynamic(self):
  self.assertEqual(len(self.analyze("EXEC sys.sp_executesql N'SELECT * FROM ITEM'")['dynamic_execution_sites']),1)
 def test_table_named_token_is_not_usage(self):
  result=self.analyze('SELECT ITEM = 3')
  self.assertEqual(result['references'],[]);self.assertIn(1,result['lexical_mentions'])
 def test_view_function_scope_is_explicit(self):
  result=self.analyze('SELECT * FROM VIEW_ITEM JOIN dbo.fn_Items(1) f ON 1=1')
  self.assertEqual({x['object_type'] for x in result['references']},{'V','IF'})
 def test_quoted_identifier_off_uses_string(self):
  self.assertEqual(analyze_sql('SELECT "ITEM"',OBJECTS,False)['references'],[])
 def test_new_statement_clears_comma_from_state(self):
  self.assertEqual(self.refs('SELECT * FROM ITEM\nSELECT 1 AS x, WAREHOUSE = 2'),{(1,'SELECT')})
 def test_closed_subquery_cannot_leak_into_insert_column_list(self):
  self.assertEqual(self.refs('SELECT (SELECT TOP 1 x FROM ITEM) x; INSERT ITEM (x, WAREHOUSE) VALUES (1,2)'),{(1,'SELECT'),(1,'INSERT')})
 def test_output_into_destination_is_separate_write(self):
  result=self.analyze('INSERT INTO ITEM OUTPUT inserted.x INTO WAREHOUSE VALUES (1)')
  self.assertEqual({(x['object_id'],x['operation']) for x in result['references']},{(1,'INSERT'),(2,'INSERT')})
  self.assertTrue(any(x['object_id']==2 and x['context']=='OUTPUT_INTO_TARGET' for x in result['references']))
 def test_abbreviated_cross_database_name_cannot_credit_prefix(self):
  self.assertEqual(self.refs('SELECT * FROM ITEM..WAREHOUSE'),set())
  self.assertTrue(self.analyze('SELECT * FROM ITEM..WAREHOUSE')['unresolved_relations'])
 def test_foreign_key_and_mentions_only_are_not_routine_use(self):
  self.assertEqual(reference_status({'foreign_keys':[1],'mentions':[2],'catalog':{},'semantic':{},'lexical':{}}),'NO_CAPTURED_REFERENCE')
 def test_name_hypotheses_never_establish_backup_or_failure_role(self):
  for name in ['D_ITEM','ARCHIVE_PREFERENCES_ORIG20260922','RECEIPT_HEADER_03212014','Interface_Item_Failure_1024']:
   hypotheses=owner_hypotheses(name);self.assertTrue(hypotheses)
   self.assertTrue(all(x['state']=='OWNER_HYPOTHESIS_UNCONFIRMED' for x in hypotheses))
  self.assertEqual({x['kind'] for x in owner_hypotheses('Interface_Item_Failure_1024')},{'OWNER_SPECIFIC_BACKUP_OR_LEFTOVER','ITEM_MASTER_FAILURE_RECORDS'})
 def test_legacy_effect_annotations_keep_exact_json_coordinates(self):
  result=contract_effects({'effects':[{'object_id':2,'relationship':'READS'}],'writes':['ITEM (UPDATE/DELETE; insertion delegated)','WAREHOUSE (UPDATE)']},CatalogNames(OBJECTS))
  self.assertEqual([(x['object_id'],x['source_field'],x['source_index']) for x in result],[(2,'effects',0),(1,'writes',0),(2,'writes',1)])
  self.assertEqual(result[1]['reviewed_annotation'],'(UPDATE/DELETE; insertion delegated)')
 def test_legacy_effect_prefix_must_resolve_exactly(self):
  result=contract_effects({'reads':['ITEM extra (note)']},CatalogNames(OBJECTS))
  self.assertIsNone(result[0]['object_id'])
class CorrelationTests(unittest.TestCase):
 def setUp(self):
  self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.root=Path(self.tmp.name)
  def save(relative,data):
   p=self.root/relative;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(json.dumps(data),encoding='utf-8')
  self.save=save
  objects=[{'object_id':i,'schema_name':'dbo','name':n,'qualified_name':'dbo.'+n,'type':t} for i,n,t in [(1,'ITEM','U'),(2,'WAREHOUSE','U'),(3,'D_BACKUP','U'),(10,'P','P'),(11,'VIEW_ITEM','V'),(12,'tr','TR'),(13,'Zero','D')]]
  definitions={10:'CREATE PROCEDURE dbo.P AS SELECT * FROM dbo.VIEW_ITEM',11:'CREATE VIEW dbo.VIEW_ITEM AS SELECT * FROM dbo.ITEM',12:'CREATE TRIGGER dbo.tr ON dbo.ITEM AFTER UPDATE AS DELETE FROM dbo.WAREHOUSE',13:'CREATE DEFAULT dbo.Zero AS 0'}
  modules=[]
  for oid,text in definitions.items():
   p=self.root/f'DB Architecture/sql/{oid}.sql';p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,encoding='utf-8');digest=hashlib.sha256(p.read_bytes()).hexdigest()
   modules.append({'object_id':oid,'redacted_path':f'sql/{oid}.sql','redacted_sha256':digest,'source_definition_sha256':digest,'uses_quoted_identifier':True,'static_features':{}})
  self.modules={x['object_id']:x for x in modules}
  deps=[{'referencing_id':a,'referenced_id':b,'referencing_minor_id':0,'referenced_minor_id':0} for a,b in [(10,11),(11,1),(12,2)]]
  save('DB Architecture/evidence/summary.json',{'snapshot_id':'fixture'})
  for n,data in [('objects',objects),('modules',modules),('dependencies',deps),('foreign_keys',[{'object_id':99,'parent_object_id':3,'referenced_object_id':1}]),('foreign_key_columns',[]),('triggers',[{'object_id':12,'parent_id':1,'is_disabled':False}])]:save('DB Architecture/catalog/'+n+'.json',data)
  self.batch={'semantic_contracts':[{'object_id':10,'source_definition_sha256':self.modules[10]['source_definition_sha256'],'reads':['WAREHOUSE (indirect reviewed effect)']},{'object_id':11,'source_definition_sha256':self.modules[11]['source_definition_sha256'],'effects':[{'relationship':'READS','object_id':1}]},{'object_id':12,'source_definition_sha256':self.modules[12]['source_definition_sha256'],'effects':[{'relationship':'WRITES','object_id':2}]}]}
  save('DB Architecture/mappings/batches/fixture.json',self.batch)
  p=self.root/'tools/report_table_usage.py';p.parent.mkdir();p.write_text('fixture tool hash binding',encoding='utf-8')
 def test_distinct_contract_catalog_path_and_fk_channels(self):
  report=build_report(self.root,require_complete_contracts=True);tables={t['object_id']:t for t in report['tables']}
  self.assertEqual(report['counts']['tables'],3);self.assertEqual(report['counts']['primary_routine_modules'],1)
  self.assertEqual(tables[3]['reference_status'],'NO_CAPTURED_REFERENCE')
  self.assertEqual(tables[3]['structural_foreign_keys']['outgoing_ids'],[99])
  self.assertFalse(tables[3]['structural_foreign_keys']['counted_as_routine_use'])
  self.assertEqual(tables[1]['module_path_context']['primary_paths_containing_view_count'],1)
  self.assertEqual(tables[2]['primary_routine_direct_ids'],[])
  self.assertEqual(tables[2]['primary_routine_reviewed_effect_ids'],[10])
  self.assertEqual(tables[2]['module_path_context']['attached_trigger_paths'][0]['attached_table_id'],1)
  effect=next(e for e in tables[2]['reference_evidence'] if e['module_id']==10)['reviewed_effects'][0]
  self.assertEqual(effect['json_pointer'],'/semantic_contracts/0/reads/0')
  self.assertEqual(effect['reviewed_annotation'],'(indirect reviewed effect)')
  self.assertIn('DB Architecture/catalog/dependencies.json',report['input_sha256'])
 def test_final_contract_completeness_guard(self):
  self.batch['semantic_contracts'].pop();self.save('DB Architecture/mappings/batches/fixture.json',self.batch)
  with self.assertRaisesRegex(ValueError,'coverage is incomplete'):build_report(self.root,require_complete_contracts=True)
 def test_original_hash_mismatch_rejected_without_disclosing_text(self):
  p=self.root/'private.json';p.write_text(json.dumps([{'object_id':10,'definition':'not captured'}]))
  with self.assertRaisesRegex(ValueError,'Captured original hash mismatch'):build_report(self.root,private_modules=p)

if __name__=='__main__':unittest.main()
