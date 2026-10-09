"""Boundaries for source-only comment/table documentation evidence."""
import hashlib
import json
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))
from programming_layout_mentions import comment_mentions


def obj(oid, name, kind, schema="dbo"):
    return {"object_id": oid, "name": name, "type": kind,
            "schema_name": schema, "qualified_name": schema + "." + name}


OBJECTS = [obj(1, "ITEM", "U"), obj(2, "WAREHOUSE", "U"),
           obj(3, "A B", "U"), obj(4, "A]B", "U"), obj(5, 'A"B', "U"),
           obj(10, "a_proc", "P"), obj(11, "a_function", "FN"),
           obj(12, "a_view", "V"), obj(13, "an_inline_function", "IF"),
           obj(14, "a_table_function", "TF")]


class CommentMentionTests(unittest.TestCase):
    def scan(self, source, oid=10, **extra):
        return comment_mentions(OBJECTS, [{"object_id": oid, "definition": source, **extra}])

    def test_source_code_and_string_values_are_excluded(self):
        self.assertEqual(self.scan("SELECT * FROM ITEM; SELECT '-- WAREHOUSE', '/* ITEM */';"), {})

    def test_nested_comments_lines_offsets_and_deduplication(self):
        source = "SELECT N'\u2603';\r\n/* ITEM item\r\n nested /* WAREHOUSE */\n ITEM */\n-- item ITEM"
        result = self.scan(source)
        self.assertEqual([x["source_line"] for x in result[1]], [2, 4, 5])
        self.assertEqual([x["source_line"] for x in result[2]], [3])
        for rows in result.values():
            for row in rows:
                spelling = source[row["source_start_offset"]:row["source_end_offset"]]
                self.assertEqual(spelling.casefold(), row["table_qualified_name"].split(".")[1].casefold())
                self.assertEqual(row["source_definition_sha256"], hashlib.sha256(source.encode()).hexdigest())
                self.assertFalse(row["counts_as_routine_reference"])

    def test_exact_tokens_do_not_promote_substrings_variables_or_temporary_names(self):
        self.assertEqual(self.scan("-- ITEM_HISTORY @ITEM #ITEM ##ITEM ITEM$ ITEM2 xITEM"), {})
        self.assertEqual(set(self.scan("-- dbo.item and WAREHOUSE")), {1, 2})

    def test_delimited_identifiers_preserve_spaces_and_escaped_delimiters(self):
        result = self.scan('-- [A B], [A]]B], "A""B"')
        self.assertEqual(set(result), {3, 4, 5})

    def test_only_primary_routine_types_are_scanned(self):
        for oid in (10, 11, 13, 14):
            self.assertEqual(set(self.scan("-- ITEM", oid)), {1})
        self.assertEqual(self.scan("-- ITEM", 12), {})

    def test_quoted_identifier_off_does_not_turn_string_comments_into_comments(self):
        self.assertEqual(self.scan('SELECT "-- ITEM"', uses_quoted_identifier=False), {})

    def test_ambiguous_captured_names_are_not_assumed_to_bind(self):
        objects = OBJECTS + [obj(20, "ITEM", "U", "other")]
        self.assertEqual(comment_mentions(objects, [{"object_id": 10, "definition": "-- ITEM"}]), {})

    def test_raw_comment_content_is_never_emitted(self):
        result = self.scan("-- ITEM confidential-text-please-do-not-copy")
        self.assertNotIn("confidential", json.dumps(result))
        self.assertEqual(result[1][0]["status"], "COMMENT_IDENTIFIER_MENTION")

    def test_duplicates_missing_definitions_and_hash_mismatch_fail_without_source_content(self):
        module = {"object_id": 10, "definition": "-- ITEM sensitive"}
        for objects, modules in [
            (OBJECTS + [OBJECTS[0]], [module]),
            (OBJECTS, [module, module]),
            (OBJECTS, [{"object_id": 10, "definition": None}]),
            (OBJECTS, [{**module, "source_definition_sha256": "bad"}]),
        ]:
            with self.assertRaises(ValueError) as caught:
                comment_mentions(objects, modules)
            self.assertNotIn("sensitive", str(caught.exception))

    def test_result_order_is_stable(self):
        modules = [{"object_id": 11, "definition": "-- WAREHOUSE ITEM"},
                   {"object_id": 10, "definition": "-- ITEM"}]
        result = comment_mentions(OBJECTS, modules)
        self.assertEqual(result, comment_mentions(list(reversed(OBJECTS)), list(reversed(modules))))
        self.assertEqual(list(result), [1, 2])
        self.assertEqual([x["module_id"] for x in result[1]], [10, 11])


if __name__ == "__main__":
    unittest.main()
