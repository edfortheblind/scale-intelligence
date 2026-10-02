"""Capture an explicit allowlist of SCALE navigation configuration; never business rows.

Separate from tools/assess_db.py because this owner-authorized task reads navigation
configuration rows, rather than only SQL Server catalogs. No arbitrary SQL option.
"""
from __future__ import annotations

import argparse
import datetime as dt
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import sys
import time

ROOT = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location("scale_assessment", ROOT / "tools/assess_db.py")
assessment = importlib.util.module_from_spec(spec)
spec.loader.exec_module(assessment)

QUERIES = {
    "identity": "SELECT DB_NAME() AS database_name, SYSUTCDATETIME() AS observed_at, CAST(DATABASEPROPERTYEX(DB_NAME(),'Updateability') AS nvarchar(128)) AS updateability",
    "navigation_schema": """SELECT o.object_id, SCHEMA_NAME(o.schema_id) AS schema_name, o.name AS table_name,
c.column_id, c.name AS column_name, t.name AS type_name, c.max_length, c.is_nullable
FROM sys.tables o JOIN sys.columns c ON c.object_id=o.object_id JOIN sys.types t ON t.user_type_id=c.user_type_id
WHERE SCHEMA_NAME(o.schema_id)='dbo' AND o.name IN
('FORM','MAIN_UI_SCREEN','SCREEN_PART','SCREEN_GROUP','SCREEN_CONTROL','SCREEN_CONTROL_GRID_COLUMNS',
'DATA_RETRIEVAL_STMT_HEADER','DATA_RETRIEVAL_STMT_DETAIL','DYNAMIC_ACTION','ACTION_MENU','ACTION_MENU_OPTION',
'RESOURCE_FILE_BASE','RESOURCE_FILE_CUSTOM','FUNCTIONAL_AREA')
ORDER BY o.name,c.column_id""",
    "forms": """SELECT FORM_ID,FORM_KEY_NAME,PARENT_KEY_NAME,TABLE_NAME,USED_BY_GENERATOR,
SECURITY_ACTIVE,SYSTEM_DB_SCREEN,OBJECT_IDENTIFIER,ASSOCIATED_FORM_KEY
FROM dbo.FORM ORDER BY FORM_ID""",
    "main_ui_screens": """SELECT OBJECT_ID,FORM_ID,FUNCTIONAL_AREA,CLASS_NAME,NAMESPACE,ASSEMBLY_NAME,
MENU_RESOURCE_KEY,ACTIVE,SYSTEM_CREATED,PATH,PATH_TYPE,OBJECT_IDENTIFIER,SHOW_IN_APP_MENU
FROM dbo.MAIN_UI_SCREEN ORDER BY FORM_ID,OBJECT_ID""",
    "screen_parts": """SELECT OBJECT_ID,SCREEN_ID,PART_NAME,RESOURCE_KEY,PART_TYPE,SYSTEM_CREATED,
SEQUENCE,ACTIVE,DEFAULT_ACTION,PARTIAL_VIEW FROM dbo.SCREEN_PART ORDER BY SCREEN_ID,SEQUENCE,OBJECT_ID""",
    "screen_groups": """SELECT OBJECT_ID,SCREEN_PART_ID,GROUP_NAME,RESOURCE_KEY,PARENT_GROUP_ID,
NESTED_GROUP_UNIT,GROUP_TYPE,SYSTEM_CREATED,SEQUENCE,ACTIVE,DEFAULT_ACTION,FIXED_TO_TOP,CONTENT_LOADING_TYPE
FROM dbo.SCREEN_GROUP ORDER BY SCREEN_PART_ID,SEQUENCE,OBJECT_ID""",
    "screen_controls": """SELECT OBJECT_ID,SCREEN_GROUP_ID,CONTROL_NAME,RESOURCE_KEY,CONTROL_TYPE,
LABEL_ORIENTATION,SYSTEM_CREATED,DATA_SOURCE_TYPE,SEQUENCE,DEFAULT_STATE,ACTIVE,
TOOL_TIP_RESOURCE_KEY,DEFAULT_ACTION,SCREEN_GROUP_COLUMN_ID,TEMPLATE_NAME
FROM dbo.SCREEN_CONTROL ORDER BY SCREEN_GROUP_ID,SEQUENCE,OBJECT_ID""",
    "grid_columns": """SELECT OBJECT_ID,SCREEN_CONTROL_ID,FIELD,FIELD_NAME,FIELD_WIDTH,FIELD_TYPE,
SQL_CLAUSE_TYPE,SEQUENCE,RESOURCE_KEY,ACTIVE,SYSTEM_CREATED,HIDDEN,DECIMAL_POSITIONS,
IS_PRIMARY_KEY,IS_EDITABLE,REQUIRED_FOR_EDIT,DATA_SOURCE_TYPE,ALLOW_SORT
FROM dbo.SCREEN_CONTROL_GRID_COLUMNS ORDER BY SCREEN_CONTROL_ID,SEQUENCE,OBJECT_ID""",
    "functional_areas": "SELECT FUNCTIONAL_AREA,DESCRIPTION,SYSTEM_CREATED,ACTIVE FROM dbo.FUNCTIONAL_AREA ORDER BY FUNCTIONAL_AREA",
    "resource_languages": "SELECT RESOURCE_LANGUAGE,COUNT_BIG(*) AS resource_count FROM dbo.RESOURCE_FILE_BASE GROUP BY RESOURCE_LANGUAGE ORDER BY RESOURCE_LANGUAGE",
    "dynamic_actions": """SELECT OBJECT_ID,ACTION_ENDPOINT_ID,ACTION_NAME,ACTION_RESOURCE_KEY,ACTIVE,
ALWAYS_AVAILABLE,DESCRIPTION,FORM_ID,SECURITY_CHECKPOINT,SYSTEM_CREATED FROM dbo.DYNAMIC_ACTION ORDER BY FORM_ID,OBJECT_ID""",
    "action_menus": "SELECT OBJECT_ID,MENU_NAME,DESCRIPTION,ACTIVE,SYSTEM_CREATED FROM dbo.ACTION_MENU ORDER BY OBJECT_ID",
    "action_menu_options": "SELECT OBJECT_ID,ACTION_MENU_ID,ACTION_ID,SEQUENCE,DEFAULT_VALUE,SEPARATOR,SHORTCUT_KEY FROM dbo.ACTION_MENU_OPTION ORDER BY ACTION_MENU_ID,SEQUENCE,OBJECT_ID",
    "drilldown_links": """SELECT STMT_DETAIL_KEY_NUM,STMT_HEADER_KEY_NUM,DETAIL_DESC,ACTIVE,SYSTEM_CREATED,DRILLDOWN_FORM_ID
FROM dbo.DATA_RETRIEVAL_STMT_DETAIL WHERE DRILLDOWN_FORM_ID IS NOT NULL ORDER BY STMT_HEADER_KEY_NUM,STMT_DETAIL_KEY_NUM""",
}

CORE_NAMES = list(QUERIES)[:8]
SUPPLEMENT_NAMES = ["identity", "functional_areas", "resource_languages", "dynamic_actions", "action_menus", "action_menu_options", "drilldown_links"]
RESOURCE_KEYS = """SELECT FORM_KEY_NAME AS RESOURCE_KEY FROM dbo.FORM
UNION SELECT MENU_RESOURCE_KEY FROM dbo.MAIN_UI_SCREEN
UNION SELECT RESOURCE_KEY FROM dbo.SCREEN_PART
UNION SELECT RESOURCE_KEY FROM dbo.SCREEN_GROUP
UNION SELECT RESOURCE_KEY FROM dbo.SCREEN_CONTROL
UNION SELECT RESOURCE_KEY FROM dbo.SCREEN_CONTROL_GRID_COLUMNS
UNION SELECT ACTION_RESOURCE_KEY FROM dbo.DYNAMIC_ACTION"""
for source in ("BASE", "CUSTOM"):
    QUERIES["resource_labels_" + source.lower()] = (
        "SELECT r.RESOURCE_LANGUAGE,r.RESOURCE_GROUP,r.RESOURCE_KEY,r.TEXT,r.FIELD_LENGTH,r.DECIMAL_POS "
        "FROM dbo.RESOURCE_FILE_" + source + " r JOIN (" + RESOURCE_KEYS + ") k ON k.RESOURCE_KEY=r.RESOURCE_KEY "
        "WHERE r.RESOURCE_LANGUAGE='en-US' ORDER BY r.RESOURCE_GROUP,r.RESOURCE_KEY")
QUERIES["graph_schema"] = """SELECT o.object_id,SCHEMA_NAME(o.schema_id) AS schema_name,o.name AS table_name,
c.column_id,c.name AS column_name,t.name AS type_name,c.max_length,c.is_nullable
FROM sys.tables o JOIN sys.columns c ON c.object_id=o.object_id JOIN sys.types t ON t.user_type_id=c.user_type_id
WHERE SCHEMA_NAME(o.schema_id)='dbo' AND o.name IN
('SCREEN_GROUP_COLUMN','SCREEN_CONTROL_ATTRIBUTES','SCREEN_CONTROL_EVENT','SCREEN_CONTROL_EVENT_PARAMETERS')
ORDER BY o.name,c.column_id"""
QUERIES["group_columns"] = """SELECT OBJECT_ID,SCREEN_GROUP_ID,COLUMN_NAME,COLUMN_CSS_CLASS,SEQUENCE,ACTIVE,SYSTEM_CREATED
FROM dbo.SCREEN_GROUP_COLUMN ORDER BY SCREEN_GROUP_ID,SEQUENCE,OBJECT_ID"""
QUERIES["control_attributes"] = """SELECT OBJECT_ID,SCREEN_CONTROL_ID,ATTRIBUTE_NAME,ACTIVE,SYSTEM_CREATED,IS_CONTROL_PROPERTY,
DATALENGTH(ATTRIBUTE_VALUE) AS attribute_value_bytes,
CONVERT(varchar(64),HASHBYTES('SHA2_256',CONVERT(varbinary(max),ATTRIBUTE_VALUE)),2) AS attribute_value_sha256_utf16le,
(CASE WHEN TOKEN1 IS NOT NULL THEN 1 ELSE 0 END + CASE WHEN TOKEN2 IS NOT NULL THEN 1 ELSE 0 END +
CASE WHEN TOKEN3 IS NOT NULL THEN 1 ELSE 0 END + CASE WHEN TOKEN4 IS NOT NULL THEN 1 ELSE 0 END +
CASE WHEN TOKEN5 IS NOT NULL THEN 1 ELSE 0 END + CASE WHEN TOKEN6 IS NOT NULL THEN 1 ELSE 0 END +
CASE WHEN TOKEN7 IS NOT NULL THEN 1 ELSE 0 END + CASE WHEN TOKEN8 IS NOT NULL THEN 1 ELSE 0 END +
CASE WHEN TOKEN9 IS NOT NULL THEN 1 ELSE 0 END + CASE WHEN TOKEN10 IS NOT NULL THEN 1 ELSE 0 END) AS token_slots_non_null
FROM dbo.SCREEN_CONTROL_ATTRIBUTES ORDER BY SCREEN_CONTROL_ID,OBJECT_ID"""
QUERIES["control_events"] = """SELECT OBJECT_ID,SCREEN_CONTROL_ID,EVENT_ID,EVENT_NAME,ACTIVE,SYSTEM_CREATED,GRID_COLUMN
FROM dbo.SCREEN_CONTROL_EVENT ORDER BY SCREEN_CONTROL_ID,OBJECT_ID"""
QUERIES["event_parameters"] = """SELECT OBJECT_ID,SCREEN_CONTROL_EVENT_ID,PARAMETER_NAME,ACTIVE,SYSTEM_CREATED,
DATALENGTH(PARAMETER_VALUE) AS parameter_value_bytes,
CONVERT(varchar(64),HASHBYTES('SHA2_256',CONVERT(varbinary(max),PARAMETER_VALUE)),2) AS parameter_value_sha256_utf16le
FROM dbo.SCREEN_CONTROL_EVENT_PARAMETERS ORDER BY SCREEN_CONTROL_EVENT_ID,OBJECT_ID"""


def sanitize_rows(name, rows):
    """Keep SQL expressions private; publish identifiers and expression hashes only."""
    if name in ("control_events", "group_columns"):
        fields = ("EVENT_ID", "EVENT_NAME", "GRID_COLUMN") if name == "control_events" else ("COLUMN_CSS_CLASS",)
        omitted = []
        for row in rows:
            for field in fields:
                value = row.get(field)
                pattern = r"[\w.:-]+" if name == "control_events" else r"[\w\s:-]+"
                if value and not re.fullmatch(pattern, value):
                    omitted.append({"OBJECT_ID": row["OBJECT_ID"], "field": field, "value": value})
                    row[field] = None
                    row[field + "_OMITTED"] = True
                    row[field + "_SHA256"] = hashlib.sha256(value.encode()).hexdigest()
                    row[field + "_LENGTH"] = len(value)
        if omitted:
            assessment.atomic_json(assessment.PRIVATE / "snapdragon-navigation" / (name + "-expressions.json"), omitted)
        return rows, {"non_token_values_omitted": len(omitted), "private_expression_storage": bool(omitted)}
    if name != "grid_columns":
        return rows, {}
    omitted = []
    for row in rows:
        value = row.get("FIELD")
        if value and not re.fullmatch(r"[\w.\[\]]+", value):
            omitted.append({"OBJECT_ID": row["OBJECT_ID"], "FIELD": value})
            row["FIELD"] = None
            row["FIELD_EXPRESSION_OMITTED"] = True
            row["FIELD_EXPRESSION_SHA256"] = hashlib.sha256(value.encode()).hexdigest()
            row["FIELD_EXPRESSION_LENGTH"] = len(value)
    if omitted:
        private_path = assessment.PRIVATE / "snapdragon-navigation" / "grid-field-expressions.json"
        assessment.atomic_json(private_path, omitted)
    return rows, {"sql_field_expressions_omitted": len(omitted), "private_expression_storage": bool(omitted)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--phase", choices=("schema", "inventory", "supplement", "labels", "graph-schema", "graph"), default="schema")
    args = parser.parse_args()
    import pyodbc
    connection_file = assessment.PRIVATE.parent / "credentials/replica.connection.txt"
    settings = assessment.parse_connection(connection_file.read_text(encoding="utf-8-sig").strip())
    # Reuse existing private server/authentication material, but bind only to the
    # database explicitly named by the owner for this navigation task.
    settings["initial catalog"] = "travprodwbeyz"
    output = ROOT / "Snapdragon/database"
    output.mkdir(parents=True, exist_ok=True)
    manifest = {"schema_version": 1, "started_at": assessment.utc(), "phase": args.phase,
                "expected_database": "travprodwbeyz", "scope": "navigation_configuration_only",
                "transactional_rows_read": False, "configuration_rows_read": args.phase not in ("schema", "graph-schema"),
                "routines_executed": False, "mutations_executed": False, "queries": {},
                "excluded": ["user identities", "security assignments", "saved searches", "business records", "credential values"],
                "read_only_intent_is_not_access_control": True}
    names = {"schema": ["identity", "navigation_schema"], "inventory": CORE_NAMES, "supplement": SUPPLEMENT_NAMES,
             "labels": ["identity", "resource_labels_base", "resource_labels_custom"],
             "graph-schema": ["graph_schema"],
             "graph": ["group_columns", "control_attributes", "control_events", "event_parameters"]}[args.phase]
    connection = None
    try:
        connection = pyodbc.connect(assessment.odbc_string(settings), timeout=20, autocommit=True)
        connection.timeout = 45
        for name in names:
            sql = QUERIES[name]
            receipt = {"sql": sql, "sql_sha256": hashlib.sha256(sql.encode()).hexdigest(), "started_at": assessment.utc()}
            started = time.monotonic()
            try:
                cursor = connection.cursor()
                cursor.execute(sql)
                columns = [x[0] for x in cursor.description]
                rows = [dict(zip(columns, row)) for row in cursor.fetchall()]
                if name == "identity" and (not rows or rows[0]["database_name"].lower() != "travprodwbeyz"):
                    raise ValueError("Unexpected database identity")
                rows, sanitization = sanitize_rows(name, rows)
                receipt.update(sanitization)
                assessment.atomic_json(output / (name + ".json"), rows)
                receipt.update(status="PASS", row_count=len(rows), output_sha256=hashlib.sha256((output / (name + ".json")).read_bytes()).hexdigest())
            except pyodbc.Error as error:
                receipt.update(status="QUERY_BLOCKED", sqlstate=str(error.args[0])[:8])
            finally:
                receipt.update(elapsed_seconds=round(time.monotonic() - started, 3), finished_at=assessment.utc())
                manifest["queries"][name] = receipt
        manifest["status"] = "PASS" if all(x["status"] == "PASS" for x in manifest["queries"].values()) else "PARTIAL"
    except pyodbc.Error as error:
        manifest.update(status="CONNECTION_BLOCKED", sqlstate=str(error.args[0])[:8])
    except ValueError:
        manifest.update(status="SAFETY_CHECK_BLOCKED")
    finally:
        if connection is not None:
            connection.close()
        manifest["finished_at"] = assessment.utc()
        assessment.atomic_json(output / (args.phase + "-manifest.json"), manifest)
    print(json.dumps({"status": manifest["status"], "queries": {k: {f: v[f] for f in ("status", "row_count") if f in v} for k, v in manifest["queries"].items()}}))
    return 0 if manifest["status"] == "PASS" else 2


if __name__ == "__main__":
    sys.exit(main())
