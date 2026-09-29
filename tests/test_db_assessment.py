"""Boundary tests for the metadata-only database documentation workflow."""
import importlib.util
from pathlib import Path
import re
import sys
import unittest
import tempfile
import json

TOOLS = Path(__file__).resolve().parents[1] / "tools"
sys.path.insert(0, str(TOOLS))
from assess_db import parse_connection, odbc_string, QUERIES
from build_db_docs import redact_sql, type_text, walk_text, load

class DatabaseAssessmentTests(unittest.TestCase):
    def test_quoted_connection_values_are_preserved_without_splitting(self):
        result = parse_connection('Data Source=host;Initial Catalog=db;User ID=user;Password="a;b""c}";Authentication=SqlPassword')
        self.assertEqual(result['password'], 'a;b"c}')
        odbc = odbc_string(result)
        self.assertIn('PWD={a;b"c}}}', odbc)
        self.assertIn('ApplicationIntent={ReadOnly}', odbc)
        self.assertIn('Encrypt={yes}', odbc)
        self.assertIn('TrustServerCertificate={no}', odbc)

    def test_duplicate_or_malformed_settings_fail_without_contents(self):
        for source in ['Password=secret;password=again', 'Password=secret;broken']:
            with self.assertRaises(ValueError) as caught:
                parse_connection(source)
            self.assertNotIn('secret', str(caught.exception))

    def test_unimplemented_authentication_fails_closed(self):
        with self.assertRaises(ValueError):
            odbc_string({'authentication': 'ActiveDirectoryPassword'})

    def test_fixed_queries_are_catalog_selects_without_effects(self):
        for name, sql in QUERIES.items():
            with self.subTest(query=name):
                self.assertTrue(sql.lstrip().upper().startswith('SELECT '))
                clean = re.sub(r"'(?:''|[^'])*'", "''", sql)
                self.assertIsNone(re.search(r'\b(EXEC|EXECUTE|INSERT|UPDATE|DELETE|MERGE|ALTER|CREATE|DROP|TRUNCATE|DBCC|INTO|OPENROWSET|OPENQUERY)\b', clean, re.I))
                for source in re.findall(r'\b(?:FROM|JOIN)\s+([\w.]+)', clean, re.I):
                    self.assertTrue(source.startswith('sys.') or source in {'msdb.dbo.sysjobs', 'msdb.dbo.sysjobsteps'}, source)

    def test_runtime_never_collects_text_plans_or_messages(self):
        for name, sql in QUERIES.items():
            if 'runtime' in name or 'job_step' in name:
                self.assertIsNone(re.search(r'\b(query_sql_text|query_plan|command|message|sql_handle|plan_handle)\b', sql, re.I))
        self.assertIn('r.replica_group_id', QUERIES['query_store_runtime'])
        self.assertIn('r.count_executions)*r.avg_duration', QUERIES['query_store_runtime'])

    def test_redaction_removes_literals_comments_and_nested_payloads(self):
        source = "SELECT N'private;''value', [Password], \"Column\" /* outer SECRET /* inner */ value */ -- account\nFROM dbo.X WHERE status='Open';"
        result = redact_sql(source)
        for secret in ['private', 'SECRET', 'account', "'Open'", 'inner']:
            self.assertNotIn(secret, result)
        self.assertIn('[Password]', result)
        self.assertIn('FROM dbo.X', result)
        self.assertIn("N'<literal:1>'", result)

    def test_double_quotes_as_strings_when_quoted_identifier_off(self):
        self.assertNotIn('secret', redact_sql('SELECT "secret"', False))
        self.assertIn('identifier', redact_sql('SELECT "identifier"', True))

    def test_sql_escaped_identifier_and_string_comment_markers(self):
        result = redact_sql("SELECT [a]]b], '/*secret*/', '--hidden' FROM dbo.[X]")
        self.assertIn('[a]]b]', result)
        self.assertNotIn('secret', result)
        self.assertNotIn('hidden', result)

    def test_redaction_null_and_unterminated_input(self):
        self.assertIsNone(redact_sql(None))
        self.assertNotIn('secret', redact_sql("SELECT 'secret"))
        self.assertNotIn('secret', redact_sql('SELECT /* secret'))

    def test_unicode_lengths_and_max_types(self):
        self.assertEqual(type_text({'type_name':'nvarchar','max_length':80}), 'nvarchar(40)')
        self.assertEqual(type_text({'type_name':'nvarchar','max_length':-1}), 'nvarchar(max)')

    def test_citation_nodes_are_preserved_without_source_rewriting(self):
        node = {'node_id':'n1','children':['prefix',{'node_id':'n2','children':['dbo.TABLE_X']}]}
        self.assertEqual(list(walk_text(node)), [('n1','prefix'),('n2','dbo.TABLE_X')])

    def test_failed_refresh_cannot_reuse_prior_source_rows(self):
        with tempfile.TemporaryDirectory() as tmp:
            p = Path(tmp)
            (p/'manifest.json').write_text(json.dumps({'queries':{'modules':{'status':'UNAVAILABLE'}}}))
            (p/'modules.json').write_text('[{"object_id":1,"definition":"stale"}]')
            self.assertEqual(load(p,'modules'), [])

if __name__ == '__main__':
    unittest.main()
