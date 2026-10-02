"""Capture strictly validated dependency tokens from selected configuration values.

This separate supplement preserves the original hash-only attribute/parameter capture.
No arbitrary SQL, parameter-name argument, business-table query or routine invocation.
"""
from collections import Counter
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import sys
import time

ROOT = Path(__file__).resolve().parents[2]
DB = ROOT / "Snapdragon/database"
spec = importlib.util.spec_from_file_location("scale_assessment", ROOT / "tools/assess_db.py")
assessment = importlib.util.module_from_spec(spec)
spec.loader.exec_module(assessment)

ATTRIBUTE_KINDS = {
    "data-dbtable": "database_identifier", "data-dbcolumn": "database_identifier",
    "data-formId": "form_id", "data-securityCheckpoint": "checkpoint",
    "data-indicatorTileStoredprocedure": "stored_procedure_identifier",
    "data-drilldownLevel0storedprocedure": "stored_procedure_identifier",
    "data-drilldownLevel1storedprocedure": "stored_procedure_identifier",
    "data-drilldownLevel2storedprocedure": "stored_procedure_identifier",
    "data-drilldownLevel3storedprocedure": "stored_procedure_identifier",
    "data-drilldownLevel4storedprocedure": "stored_procedure_identifier",
    "data-indicatorTileWebService": "relative_api_path", "data-monitorWebService": "relative_api_path",
    "data-restcreate": "relative_api_path", "data-restupdate": "relative_api_path", "data-restdelete": "relative_api_path",
    "eventsApiURL": "relative_api_path", "resourcesApiURL": "relative_api_path",
}
SERVICE_NAMES = {
    "DELETEServiceURL", "GETServiceURL", "POSTServiceURL", "PUTServiceURL", "PostServiceURL",
    "POSTAddFilteredShipmentsToWaveServiceURL", "POSTAddToWaveServiceURL", "POSTAddedToPoolURL",
    "POSTEligibleWaveURL", "POSTNewWaveURL", "POSTReturnedToPoolURL", "POSTSAddShipmentToWaveURL",
    "POSTTransferFilteredShipmentURL", "POSTTransferShipmentURL",
}
CALLBACK_NAMES = {
    "Delete_SuccessCallback", "Get_SuccessCallback", "POSTServiceErrorCallbackInsert",
    "POSTServiceSuccessCallbackInsert", "PUTServiceErrorCallbackUpdate", "Post_ErrorCallback", "Post_SuccessCallback",
}
RESOURCE_NAMES = {"ConfirmationMessageCode", "ConfirmationTitleCode", "InformationMessageCode"}
IDENTIFIER = re.compile(r"[A-Za-z_][A-Za-z0-9_]{0,127}(?:\.[A-Za-z_][A-Za-z0-9_]{0,127}){0,3}\Z")
SIMPLE_IDENTIFIER = re.compile(r"[A-Za-z_][A-Za-z0-9_]{0,127}\Z")
NUMERIC_ID = re.compile(r"[0-9]{1,9}\Z")
API_PATH = re.compile(r"/?(?:api|scale/api|[A-Za-z_][A-Za-z0-9_-]*/scaleapi)/(?:[A-Za-z_][A-Za-z0-9_-]*/)*[A-Za-z_][A-Za-z0-9_-]*/?\??\Z", re.IGNORECASE)


def read(name):
    return json.loads((DB / (name + ".json")).read_text(encoding="utf-8"))


def parameter_kind(name):
    if name in SERVICE_NAMES:
        return "relative_api_path"
    if name in CALLBACK_NAMES:
        return "callback_identifier"
    if name in RESOURCE_NAMES:
        return "resource_code"
    if name == "PostData_storedProcedure":
        return "stored_procedure_identifier"
    if re.fullmatch(r"(?:PostData|queryParameter)_Grid_[A-Za-z0-9_]+", name):
        return "grid_field_identifier"
    return None


def accept(value, kind):
    if value is None or value == "":
        return False
    if kind == "relative_api_path":
        return len(value) <= 240 and API_PATH.fullmatch(value) is not None
    if kind == "form_id":
        return NUMERIC_ID.fullmatch(value) is not None
    if kind == "checkpoint":
        return NUMERIC_ID.fullmatch(value) is not None or SIMPLE_IDENTIFIER.fullmatch(value) is not None
    if kind in ("grid_field_identifier", "resource_code"):
        return SIMPLE_IDENTIFIER.fullmatch(value) is not None
    return IDENTIFIER.fullmatch(value) is not None


def main():
    import pyodbc
    attr_known = {r["ATTRIBUTE_NAME"] for r in read("control_attributes")}
    param_known = {r["PARAMETER_NAME"] for r in read("event_parameters")}
    attr_names = sorted(attr_known & set(ATTRIBUTE_KINDS))
    param_names = sorted(name for name in param_known if parameter_kind(name))
    queries = {
        "identity": (assessment.QUERIES["identity"], []),
        "attributes": ("SELECT OBJECT_ID,SCREEN_CONTROL_ID,ATTRIBUTE_NAME,ATTRIBUTE_VALUE,ACTIVE,SYSTEM_CREATED "
                       "FROM dbo.SCREEN_CONTROL_ATTRIBUTES WHERE ATTRIBUTE_NAME IN (" + ",".join("?" for _ in attr_names) + ") ORDER BY OBJECT_ID", attr_names),
        "parameters": ("SELECT OBJECT_ID,SCREEN_CONTROL_EVENT_ID,PARAMETER_NAME,PARAMETER_VALUE,ACTIVE,SYSTEM_CREATED "
                       "FROM dbo.SCREEN_CONTROL_EVENT_PARAMETERS WHERE PARAMETER_NAME IN (" + ",".join("?" for _ in param_names) + ") ORDER BY OBJECT_ID", param_names),
    }
    controls = {str(r["screen_control_id"]): r for r in read("screen-interaction-map")}
    events = {r["OBJECT_ID"]: r for r in read("control_events")}
    manifest = {"schema_version": 1, "started_at": assessment.utc(), "expected_database": "travprodwbeyz",
                "scope": "selected_configuration_dependency_tokens_only", "business_rows_read": False,
                "routines_executed": False, "mutations_executed": False, "queries": {},
                "rules": {"attribute_kinds": ATTRIBUTE_KINDS, "parameter_names": param_names,
                          "identifier_regex": IDENTIFIER.pattern, "simple_identifier_regex": SIMPLE_IDENTIFIER.pattern,
                          "numeric_id_regex": NUMERIC_ID.pattern, "relative_api_path_regex": API_PATH.pattern,
                          "relative_api_path_max_length": 240,
                          "rejected_values_retained": False, "strings_are_not_trimmed_or_unquoted": True}}
    connection = None
    output = []
    try:
        settings = assessment.parse_connection((assessment.PRIVATE.parent / "credentials/replica.connection.txt").read_text(encoding="utf-8-sig").strip())
        settings["initial catalog"] = "travprodwbeyz"
        connection = pyodbc.connect(assessment.odbc_string(settings), timeout=20, autocommit=True)
        connection.timeout = 45
        for name, (sql, bindings) in queries.items():
            started = time.monotonic()
            cursor = connection.cursor()
            cursor.execute(sql, *bindings)
            columns = [c[0] for c in cursor.description]
            rows = [dict(zip(columns, row)) for row in cursor.fetchall()]
            receipt = {"sql": sql, "sql_sha256": hashlib.sha256(sql.encode()).hexdigest(), "bound_configuration_names": bindings,
                       "row_count": len(rows), "status": "PASS", "elapsed_seconds": round(time.monotonic() - started, 3)}
            if name == "identity":
                if rows[0]["database_name"].lower() != "travprodwbeyz" or rows[0]["updateability"] != "READ_ONLY":
                    raise ValueError("Replica identity/read-only status mismatch")
                receipt["result"] = rows
            else:
                for row in rows:
                    field_name = row["ATTRIBUTE_NAME"] if name == "attributes" else row["PARAMETER_NAME"]
                    kind = ATTRIBUTE_KINDS[field_name] if name == "attributes" else parameter_kind(field_name)
                    value = row["ATTRIBUTE_VALUE"] if name == "attributes" else row["PARAMETER_VALUE"]
                    valid = accept(value, kind)
                    control_id = str(row["SCREEN_CONTROL_ID"]) if name == "attributes" else events[str(row["SCREEN_CONTROL_EVENT_ID"])]["SCREEN_CONTROL_ID"]
                    owner = controls[control_id]
                    output.append({"source_table": "SCREEN_CONTROL_ATTRIBUTES" if name == "attributes" else "SCREEN_CONTROL_EVENT_PARAMETERS",
                                   "object_id": int(row["OBJECT_ID"]), "form_id": owner["form_id"],
                                   "main_ui_screen_id": owner["main_ui_screen_id"], "screen_control_id": int(control_id),
                                   "screen_control_event_id": int(row["SCREEN_CONTROL_EVENT_ID"]) if name == "parameters" else None,
                                   "configuration_name": field_name, "token_kind": kind, "active": row["ACTIVE"], "system_created": row["SYSTEM_CREATED"],
                                   "accepted": valid, "safe_value": value if valid else None,
                                   "value_bytes_utf16le": len(value.encode("utf-16le")) if value is not None else None,
                                   "value_sha256_utf16le": hashlib.sha256(value.encode("utf-16le")).hexdigest().upper() if value is not None else None,
                                   "omission_reason": None if valid else ("empty_or_null" if not value else "outside_strict_token_grammar")})
                receipt["accepted_count"] = sum(r["accepted"] for r in output if r["source_table"] == ("SCREEN_CONTROL_ATTRIBUTES" if name == "attributes" else "SCREEN_CONTROL_EVENT_PARAMETERS"))
            manifest["queries"][name] = receipt
        path = DB / "safe-dependency-tokens.json"
        assessment.atomic_json(path, output)
        manifest.update(status="PASS", output_file=path.name, output_sha256=hashlib.sha256(path.read_bytes()).hexdigest())
        accepted = [r for r in output if r["accepted"]]
        summary = {"status": "PASS", "candidate_rows": len(output), "accepted_rows": len(accepted), "omitted_rows": len(output) - len(accepted),
                   "accepted_by_kind": dict(Counter(r["token_kind"] for r in accepted)),
                   "accepted_by_source": dict(Counter(r["source_table"] for r in accepted)),
                   "screens_with_accepted_tokens": len({r["main_ui_screen_id"] for r in accepted}),
                   "distinct_values_by_kind": {kind: len({r["safe_value"] for r in accepted if r["token_kind"] == kind}) for kind in sorted({r["token_kind"] for r in accepted})},
                   "limits": ["Tokens are configuration dependencies, not proof of successful API/routine execution or installed behavior.",
                              "Only selected captured names and strict token grammar are allowed; rejected values are not retained.",
                              "Paths have an api, scale/api or one-area/scaleapi prefix and static-looking ASCII path segments. Only a terminal empty question mark is allowed; no query payloads, fragments, traversal, or external hosts. Path grammar does not prove endpoint semantics.",
                              "Grid-field values are binding field identifiers, not selected record values.",
                              "Original hash-only captures and their receipts are unchanged."]}
        assessment.atomic_json(DB / "safe-dependency-token-summary.json", summary)
        print(json.dumps({k: v for k, v in summary.items() if k != "limits"}))
    except pyodbc.Error as error:
        manifest.update(status="BLOCKED", sqlstate=str(error.args[0])[:8])
    except (ValueError, KeyError):
        manifest.update(status="SAFETY_CHECK_BLOCKED")
    finally:
        if connection is not None:
            connection.close()
        manifest["finished_at"] = assessment.utc()
        assessment.atomic_json(DB / "safe-dependency-token-manifest.json", manifest)
    return 0 if manifest.get("status") == "PASS" else 2


if __name__ == "__main__":
    sys.exit(main())
