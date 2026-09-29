"""Run the fixed, reviewed SCALE configuration aggregate allowlist.

Separate from assess_db: this tool reads explicitly authorized configuration
flags, never transactional records, arbitrary values, or application routines.
"""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import time

from assess_db import ROOT, PRIVATE, QUERIES, atomic_json, odbc_string, parse_connection, utc

CAP = 10001
TIMEOUT_SECONDS = 15
SPECS = (
    {"id": "allocation_rule_activation", "table": "ALLOCATION_RULE_HEADER", "object_id": 1725249201,
     "columns": (("ACTIVE", 3, "nchar", 2),), "scope": "All allocation-rule header configuration rows"},
    {"id": "locating_rule_flags", "table": "LOCATING_RULE_HEADER", "object_id": 1266819575,
     "columns": (("ACTIVE", 3, "nchar", 2), ("DELAYED_LOCATING", 15, "nchar", 2)),
     "scope": "All locating-rule header configuration rows"},
    {"id": "work_profile_flags", "table": "WORK_PROFILE_DETAIL", "object_id": 1544392571,
     "columns": (("GROUP_ON_RF", 18, "nchar", 2), ("AUTOMATIC_PUTAWAY", 22, "nchar", 2),
                 ("USE_CROSS_DOCK_LP", 27, "nchar", 2), ("ASSIGN_MULTIPLE_WORK_UNITS", 33, "char", 1)),
     "scope": "All work-profile detail configuration rows; no profile identity returned"},
    {"id": "standard_status_flow_flags", "table": "FUNCTIONAL_AREA_STATUS_FLOW", "object_id": 1942297979,
     "columns": (("MANDATORY", 4, "nchar", 2), ("IN_DEFAULT_FLOW", 6, "nchar", 2),
                 ("CHANGE_ALLOWED", 7, "nchar", 2), ("INCLUDE_IN_INTERFACE_UPLOAD", 23, "nchar", 2)),
     "filter_column": ("FUNCTIONAL_AREA", 1, "nvarchar", 50),
     "scope": "Combined Inbound/Outbound status-flow configuration only"},
    {"id": "custom_status_flow_activation", "table": "CUSTOM_STATUS_FLOW_HEADER", "object_id": 2137774673,
     "columns": (("ACTIVE", 4, "nchar", 2),), "filter_column": ("FUNCTIONAL_AREA", 3, "nvarchar", 50),
     "scope": "Combined Inbound/Outbound custom status-flow header configuration only"},
)


def query_for(spec):
    """Identifiers come only from reviewed constants; callers cannot supply SQL."""
    if spec not in SPECS:
        raise ValueError("Unknown allowlist specification")
    flags = [c[0] for c in spec["columns"]]
    where = " WHERE [FUNCTIONAL_AREA] IN (?, ?)" if "filter_column" in spec else ""
    parameters = (CAP, "Inbound", "Outbound") if where else (CAP,)
    projections = ["COUNT_BIG(*) AS sampled_rows",
                   f"CASE WHEN COUNT_BIG(*) >= {CAP} THEN 1 ELSE 0 END AS cap_hit"]
    for flag in flags:
        for bucket, predicate in (("y", f"[{flag}] = N'Y'"), ("n", f"[{flag}] = N'N'"),
                                  ("null", f"[{flag}] IS NULL"),
                                  ("other", f"[{flag}] IS NOT NULL AND [{flag}] NOT IN (N'Y', N'N')")):
            projections.append(f"COUNT_BIG(CASE WHEN {predicate} THEN 1 END) AS [{flag.lower()}_{bucket}]")
    query = ("WITH bounded AS (SELECT TOP (?) " + ", ".join(f"[{f}]" for f in flags) +
             f" FROM [dbo].[{spec['table']}]" + where + ")\nSELECT " +
             ",\n".join(projections) + " FROM bounded OPTION (MAXDOP 1)")
    return query, parameters


def validate_result(spec, result):
    expected = {"sampled_rows", "cap_hit"} | {
        f"{column[0].lower()}_{bucket}" for column in spec["columns"] for bucket in ("y", "n", "null", "other")}
    if set(result) != expected or any(type(v) is not int or v < 0 for v in result.values()):
        raise ValueError("Unexpected aggregate output shape or type")
    count = result["sampled_rows"]
    if count > CAP or result["cap_hit"] != int(count >= CAP):
        raise ValueError("Invalid aggregate cap")
    for column in spec["columns"]:
        if sum(result[f"{column[0].lower()}_{b}"] for b in ("y", "n", "null", "other")) != count:
            raise ValueError("Invalid aggregate bucket totals")
    return result


def validate_schema(spec, rows):
    expected = list(spec["columns"]) + ([spec["filter_column"]] if "filter_column" in spec else [])
    observed = {r[0]: tuple(r) for r in rows}
    if any(observed.get(c[0]) != c + (False, False, None) for c in expected):
        raise ValueError("Configuration allowlist schema changed")


def validate_identity(identity, expected):
    if (identity["database_name"] != expected["database_name"] or identity["updateability"] != "READ_ONLY"
            or identity["engine_edition"] != expected["engine_edition"]
            or identity["collation_name"] != expected["collation_name"] or identity["status"] != "ONLINE"):
        raise ValueError("Replica identity/read-only check failed")


def read_check(connection, spec, audit=None):
    schema_sql = """SELECT c.name,c.column_id,t.name,c.max_length,c.is_nullable,c.is_computed,c.encryption_type
      FROM sys.columns c JOIN sys.types t ON c.user_type_id=t.user_type_id
      JOIN sys.objects o ON c.object_id=o.object_id JOIN sys.schemas s ON o.schema_id=s.schema_id
      WHERE o.object_id=? AND s.name=N'dbo' AND o.name=? AND o.type=N'U'"""
    cursor = connection.cursor()
    try:
        cursor.execute(schema_sql, spec["object_id"], spec["table"])
        validate_schema(spec, cursor.fetchall())
        query, parameters = query_for(spec)
        if audit is not None:
            audit['configuration_select_attempted'] = True
        cursor.execute(query, parameters)
        names = [c[0] for c in cursor.description]
        rows = cursor.fetchmany(2)
        if len(rows) != 1:
            raise ValueError("Expected exactly one aggregate row")
        return validate_result(spec, dict(zip(names, rows[0])))
    finally:
        cursor.close()


def collect():
    import pyodbc

    PRIVATE.mkdir(parents=True, exist_ok=True)
    # Share the existing collector lock: only one assessment connection at a time.
    lock = PRIVATE / "collector.lock"
    try:
        lock_file = lock.open("x", encoding="utf-8")
    except FileExistsError:
        print("Configuration validation not started: collector lock exists.")
        return 1
    connection = None
    receipt = {"schema_version": 1, "started_at": utc(), "status": "UNAVAILABLE", "checks": [],
               "authorization": "Owner: Read a reviewed configuration allowlist now",
               "structural_snapshot_id": "20260929T214106Z",
               "configuration_rows_read": False, "transactional_rows_read": False,
               "routines_executed": False, "retained_values": "aggregate integer counts only",
               "maximum_source_rows_per_check": CAP, "query_timeout_seconds": TIMEOUT_SECONDS,
               "collector_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
               "replica_freshness": "NOT_ESTABLISHED",
               "interpretation": "Counts describe sampled configuration rows, not selected user profiles, effective task behavior or process duration."}
    try:
        credential = PRIVATE.parent / "credentials/replica.connection.txt"
        settings = parse_connection(credential.read_text(encoding="utf-8-sig").strip())
        connection = pyodbc.connect(odbc_string(settings), timeout=20, autocommit=True)
        connection.timeout = TIMEOUT_SECONDS
        connection.execute("SET LOCK_TIMEOUT 5000; SET DEADLOCK_PRIORITY LOW;").close()
        cursor = connection.cursor()
        try:
            cursor.execute(QUERIES["identity"])
            identity = dict(zip([x[0] for x in cursor.description], cursor.fetchone()))
        finally:
            cursor.close()
        expected = json.loads((ROOT / "DB Architecture/catalog/database.json").read_text(encoding="utf-8"))[0]
        validate_identity(identity, expected)
        receipt["identity_verified"] = True
        receipt["connection_updateability"] = "READ_ONLY"
        receipt["tls_certificate_validation"] = True
        for spec in SPECS:
            query, parameters = query_for(spec)
            check = {"check_id": spec["id"], "object_id": spec["object_id"], "table": "dbo." + spec["table"],
                     "scope": spec["scope"], "started_at": utc(),
                     "configuration_select_attempted": False,
                     "query_sha256": hashlib.sha256(query.encode("utf-8")).hexdigest(),
                     "bound_parameters": parameters}
            started = time.monotonic()
            try:
                check["result"] = read_check(connection, spec, check)
                check["status"] = "CAPPED_INCOMPLETE" if check["result"]["cap_hit"] else "OBSERVED"
            except (pyodbc.Error, ValueError):
                # Driver messages may contain connection identifiers or values. Do not persist them.
                check["status"] = "UNAVAILABLE"
                check["error"] = "Query, schema or output validation failed; driver details withheld"
            check["finished_at"] = utc()
            check["client_elapsed_seconds"] = round(time.monotonic() - started, 3)
            receipt["checks"].append(check)
        receipt["status"] = "OBSERVED" if all(c["status"] == "OBSERVED" for c in receipt["checks"]) else "PARTIAL"
    except (OSError, KeyError, ValueError, pyodbc.Error):
        receipt["error"] = "Preflight or connection failed; sensitive exception details withheld"
    finally:
        if connection is not None:
            try:
                connection.close()
            except pyodbc.Error:
                receipt["connection_close"] = "UNCONFIRMED; driver details withheld"
                receipt["status"] = "PARTIAL"
        lock_file.close()
        lock.unlink()
    receipt["finished_at"] = utc()
    receipt["configuration_rows_read"] = (True if any('result' in c for c in receipt['checks']) else
                                           None if any(c.get('configuration_select_attempted') for c in receipt['checks']) else False)
    stamp = receipt["started_at"].replace(":", "").replace("-", "")
    atomic_json(PRIVATE / "configuration-validation" / (stamp + ".json"), receipt)
    atomic_json(ROOT / "DB Architecture/evidence/configuration-observations.json", receipt)
    print(json.dumps({"status": receipt["status"], "checks": len(receipt["checks"]),
                      "output": "DB Architecture/evidence/configuration-observations.json"}))
    return 0 if receipt["status"] == "OBSERVED" else 1


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--execute-reviewed-allowlist", action="store_true")
    args = parser.parse_args()
    if not args.execute_reviewed_allowlist:
        parser.error("Execution requires --execute-reviewed-allowlist and current owner authority")
    return collect()


if __name__ == "__main__":
    raise SystemExit(main())
