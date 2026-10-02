"""Bounded SD-11 configuration review; never execute captured expressions.

Only --collect connects to the read-only replica. No SQL/name/ID override exists.
Raw expressions are kept in the pre-existing private LocalAppData assessment area.
"""
import argparse
import copy
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import sys
import time

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / "Snapdragon/receiving"
MAP = OUT / "configuration-map.json"
MAP_SHA = "f5555ba0234bdf3a22bcea0fcdb9bfc09656c9eaa75c7b7a638ff5a38bc5a336"
ATTR_IDS = (40809, 40811, 40813, 40970, 40974, 40977, 40983, 40891, 40900,
            40902, 40905, 40908, 40912, 40913, 40915, 40917, 40920, 41026)
PARAM_IDS = (26538, 26539, 26540, 26541, 26542, 26543, 26544, 26545, 26546,
             26547, 26548, 26582, 26583, 26584, 26585, 26621, 26622, 26623,
             26838, 26839, 26840, 26841, 26842, 26843, 26844, 26845, 26846,
             26847, 26759, 26760, 26761, 26762, 26763, 26764, 26765, 26766,
             26767, 26768, 26769, 26770, 26771, 26772, 26773, 26774, 26775,
             26776, 26777, 26879, 26880, 26881, 26882)
spec = importlib.util.spec_from_file_location("scale_assessment", ROOT / "tools/assess_db.py")
assessment = importlib.util.module_from_spec(spec)
spec.loader.exec_module(assessment)
PRIVATE_FILE = assessment.PRIVATE / "snapdragon-navigation/receiving-enablement-raw.json"
CHECK_NAMES = frozenset(("value_hash", "value_length", "parent_id", "configuration_name", "active", "system_created"))


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def expected_rows():
    if sha(MAP) != MAP_SHA:
        raise ValueError("Approved configuration map fingerprint changed")
    mapping = json.loads(MAP.read_text(encoding="utf-8"))
    for source in mapping["source_fingerprints"]:
        if sha(ROOT / source["path"]) != source["sha256"]:
            raise ValueError("Original map input changed")
    expected = {}
    for screen in mapping["screens"]:
        controls = [c for p in screen["parts"] for g in p["groups"] for c in g["controls"]]
        for control in controls:
            common = {"form_id": screen["identity"]["form_id"],
                      "main_ui_screen_id": screen["identity"]["main_ui_screen_id"],
                      "screen_control_id": int(control["OBJECT_ID"]),
                      "control_name": control["CONTROL_NAME"], "control_label": control["label"]}
            for attribute in control["attributes"]:
                if attribute["ATTRIBUTE_NAME"] == "data-allowOnMultiSelect":
                    row = {**common, "source_table": "SCREEN_CONTROL_ATTRIBUTES", "object_id": int(attribute["OBJECT_ID"]),
                           "configuration_name": attribute["ATTRIBUTE_NAME"], "screen_control_event_id": None,
                           "active": attribute["ACTIVE"], "system_created": attribute["SYSTEM_CREATED"],
                           "value_bytes_utf16le": attribute["attribute_value_bytes"],
                           "value_sha256_utf16le": attribute["attribute_value_sha256_utf16le"]}
                    expected[(row["source_table"], row["object_id"])] = row
            for event in control["events"]:
                for parameter in event["parameters"]:
                    if parameter["PARAMETER_NAME"].startswith("EnableAction_"):
                        target_name = parameter["PARAMETER_NAME"][len("EnableAction_"):]
                        targets = [c for c in controls if c["CONTROL_NAME"] == target_name]
                        row = {**common, "source_table": "SCREEN_CONTROL_EVENT_PARAMETERS", "object_id": int(parameter["OBJECT_ID"]),
                               "configuration_name": parameter["PARAMETER_NAME"], "screen_control_event_id": int(event["OBJECT_ID"]),
                               "event_id": event["EVENT_ID"], "event_handler": event["EVENT_NAME"],
                               "target_controls": [{"screen_control_id": int(c["OBJECT_ID"]), "control_name": c["CONTROL_NAME"],
                                                    "label": c["label"]} for c in targets],
                               "active": parameter["ACTIVE"], "system_created": parameter["SYSTEM_CREATED"],
                               "value_bytes_utf16le": parameter["parameter_value_bytes"],
                               "value_sha256_utf16le": parameter["parameter_value_sha256_utf16le"]}
                        expected[(row["source_table"], row["object_id"])] = row
    if {oid for (table, oid) in expected if table == "SCREEN_CONTROL_ATTRIBUTES"} != set(ATTR_IDS):
        raise ValueError("Attribute denominator changed")
    if {oid for (table, oid) in expected if table == "SCREEN_CONTROL_EVENT_PARAMETERS"} != set(PARAM_IDS):
        raise ValueError("Parameter denominator changed")
    return mapping, expected


def check_row(actual, expected):
    value = actual["ATTRIBUTE_VALUE"] if expected["source_table"] == "SCREEN_CONTROL_ATTRIBUTES" else actual["PARAMETER_VALUE"]
    attr = expected["source_table"] == "SCREEN_CONTROL_ATTRIBUTES"
    actual_hash = hashlib.sha256(value.encode("utf-16le")).hexdigest().upper() if value is not None else None
    actual_bytes = len(value.encode("utf-16le")) if value is not None else None
    matches = {
        "value_hash": actual_hash == expected["value_sha256_utf16le"],
        "value_length": actual_bytes == expected["value_bytes_utf16le"],
        "parent_id": int(actual["SCREEN_CONTROL_ID" if attr else "SCREEN_CONTROL_EVENT_ID"]) == expected["screen_control_id" if attr else "screen_control_event_id"],
        "configuration_name": actual["ATTRIBUTE_NAME" if attr else "PARAMETER_NAME"] == expected["configuration_name"],
        "active": actual["ACTIVE"] == expected["active"],
        "system_created": actual["SYSTEM_CREATED"] == expected["system_created"],
    }
    return value, matches, actual_hash, actual_bytes


def collect():
    import pyodbc
    _, expected = expected_rows()
    queries = {
        "identity": (assessment.QUERIES["identity"], ()),
        "attributes": ("SELECT OBJECT_ID,SCREEN_CONTROL_ID,ATTRIBUTE_NAME,ATTRIBUTE_VALUE,ACTIVE,SYSTEM_CREATED FROM dbo.SCREEN_CONTROL_ATTRIBUTES WHERE OBJECT_ID IN (" + ",".join("?" for _ in ATTR_IDS) + ") ORDER BY OBJECT_ID", tuple(sorted(ATTR_IDS))),
        "parameters": ("SELECT OBJECT_ID,SCREEN_CONTROL_EVENT_ID,PARAMETER_NAME,PARAMETER_VALUE,ACTIVE,SYSTEM_CREATED FROM dbo.SCREEN_CONTROL_EVENT_PARAMETERS WHERE OBJECT_ID IN (" + ",".join("?" for _ in PARAM_IDS) + ") ORDER BY OBJECT_ID", tuple(sorted(PARAM_IDS))),
    }
    receipt = {"started_at": assessment.utc(), "database": "travprodwbeyz", "queries": {}, "status": "STARTED"}
    connection = None
    collected = []
    try:
        settings = assessment.parse_connection((assessment.PRIVATE.parent / "credentials/replica.connection.txt").read_text(encoding="utf-8-sig").strip())
        settings["initial catalog"] = "travprodwbeyz"
        connection = pyodbc.connect(assessment.odbc_string(settings), timeout=20, autocommit=True)
        connection.timeout = 45
        for kind, (sql, ids) in queries.items():
            started = time.monotonic()
            cursor = connection.cursor()
            cursor.execute(sql, *ids)
            columns = [c[0] for c in cursor.description]
            rows = [dict(zip(columns, row)) for row in cursor.fetchall()]
            query_receipt = {"sql": sql, "bound_object_ids": ids, "sql_sha256": hashlib.sha256(sql.encode()).hexdigest(),
                             "row_count": len(rows), "elapsed_seconds": round(time.monotonic() - started, 3)}
            if kind == "identity":
                if len(rows) != 1 or rows[0]["database_name"].lower() != "travprodwbeyz" or rows[0]["updateability"] != "READ_ONLY":
                    raise ValueError("Replica identity mismatch")
                query_receipt["verified_identity"] = {"database_name": rows[0]["database_name"], "updateability": rows[0]["updateability"]}
            else:
                if {int(r["OBJECT_ID"]) for r in rows} != set(ids) or len(rows) != len(ids):
                    raise ValueError("Exact source ID set mismatch")
                table = "SCREEN_CONTROL_ATTRIBUTES" if kind == "attributes" else "SCREEN_CONTROL_EVENT_PARAMETERS"
                for row in rows:
                    baseline = expected[(table, int(row["OBJECT_ID"]))]
                    value, matches, actual_hash, actual_bytes = check_row(row, baseline)
                    collected.append({"source_table": table, "object_id": int(row["OBJECT_ID"]), "raw_value": value,
                                      "checks": matches, "observed_sha256_utf16le": actual_hash, "observed_bytes_utf16le": actual_bytes})
            receipt["queries"][kind] = query_receipt
        receipt["status"] = capture_status(collected)
    except pyodbc.Error as error:
        receipt.update(status="BLOCKED", sqlstate=str(error.args[0])[:8])
    except (ValueError, KeyError):
        receipt["status"] = "SAFETY_CHECK_BLOCKED"
    finally:
        if connection is not None:
            connection.close()
        receipt["finished_at"] = assessment.utc()
        assessment.atomic_json(PRIVATE_FILE, {"receipt": receipt, "rows": collected})
    summary = {"status": receipt["status"], "candidate_count": len(expected), "collected": len(collected),
               "baseline_matches": sum(checks_pass(r["checks"]) for r in collected)}
    print(json.dumps(summary))
    return 0 if receipt["status"] == "PASS" else 2


def capture_status(rows):
    allowed = {("SCREEN_CONTROL_ATTRIBUTES", i) for i in ATTR_IDS} | {("SCREEN_CONTROL_EVENT_PARAMETERS", i) for i in PARAM_IDS}
    actual = {(r["source_table"], r["object_id"]) for r in rows}
    return "PASS" if len(rows) == 69 and actual == allowed and all(checks_pass(r["checks"]) for r in rows) else "DRIFT_DETECTED"


def checks_pass(checks):
    return set(checks) == CHECK_NAMES and all(value is True for value in checks.values())


FIELDS = frozenset(("APPOINTMENT_ID", "CLOSED", "CLOSE_DATE", "CONTAINER_STATUS", "ClosedDateTime",
                    "GROUP_CLOSED", "IMMD_NEEDS_REQ_CREATED", "INTERNAL_GROUP_NUM", "INTERNAL_RECEIPT_LINE_NUM",
                    "IS_CONTAINERS_CREATED", "IS_RECEIPT_CLOSED", "IsPurchaseOrderClosed", "LEADINGSTS",
                    "LICENSE_PLATE_ID", "Lines", "MAX_STATUS", "ObjectId", "PurchaseOrderId", "PurchaseOrderObjectId",
                    "RECEIPT_ID", "Status", "TRAILER_ID", "TRAILINGSTS", "TotalOpenQty"))
SYMBOLS = frozenset(("Closed", "False", "True", "TRUE", "NULL"))
NUMBERS = frozenset((0, 1, 100, 200))
TOKEN = re.compile(r"\s*(===|!==|==|!=|<=|>=|&&|\|\||[<>()]|[A-Za-z_][A-Za-z0-9_]*|[0-9]+)")
OPERATORS = {"===": "strictly_equals", "!==": "strictly_not_equals", "==": "loosely_equals", "!=": "loosely_not_equals",
             "<=": "less_than_or_equal", ">=": "greater_than_or_equal", "<": "less_than", ">": "greater_than"}
OP_WORDS = {"strictly_equals": "strictly equals", "strictly_not_equals": "is strictly unequal to",
            "loosely_equals": "loosely equals", "loosely_not_equals": "is loosely unequal to",
            "less_than_or_equal": "is at most", "greater_than_or_equal": "is at least", "less_than": "is less than", "greater_than": "is greater than"}


class UnsupportedPredicate(ValueError):
    pass


class PredicateParser:
    """Recognize a finite configuration grammar and return an AST, never a value."""

    def __init__(self, value):
        if not isinstance(value, str) or not 0 < len(value) <= 512:
            raise UnsupportedPredicate("outside_length_bound")
        self.tokens = []
        position = 0
        while position < len(value):
            if value[position:].isspace():
                break
            match = TOKEN.match(value, position)
            if match is None:
                raise UnsupportedPredicate("outside_lexical_grammar")
            self.tokens.append(match.group(1))
            position = match.end()
        self.position = 0

    def take(self):
        if self.position >= len(self.tokens):
            raise UnsupportedPredicate("incomplete_predicate")
        item = self.tokens[self.position]
        self.position += 1
        return item

    def peek(self):
        return self.tokens[self.position] if self.position < len(self.tokens) else None

    def parse(self):
        result = self.logical_or()
        if self.peek() is not None:
            raise UnsupportedPredicate("unconsumed_tokens")
        return result

    def logical_or(self):
        clauses = [self.logical_and()]
        while self.peek() == "||":
            self.take()
            clauses.append(self.logical_and())
        return clauses[0] if len(clauses) == 1 else {"kind": "any", "clauses": clauses}

    def logical_and(self):
        clauses = [self.atom()]
        while self.peek() == "&&":
            self.take()
            clauses.append(self.atom())
        return clauses[0] if len(clauses) == 1 else {"kind": "all", "clauses": clauses}

    def atom(self):
        if self.peek() == "(":
            self.take()
            child = self.logical_or()
            if self.take() != ")":
                raise UnsupportedPredicate("unmatched_parenthesis")
            return child
        field = self.take()
        if field not in FIELDS:
            raise UnsupportedPredicate("field_outside_allowlist")
        operator = self.take()
        if operator not in OPERATORS:
            raise UnsupportedPredicate("operator_outside_allowlist")
        token = self.take()
        if token in ("true", "false"):
            operand = {"kind": "boolean_literal", "value": token == "true"}
        elif token == "null":
            operand = {"kind": "null_literal"}
        elif token in SYMBOLS:
            operand = {"kind": "unresolved_symbol", "identifier": token}
        elif token.isascii() and token.isdecimal() and int(token) in NUMBERS and token == str(int(token)):
            operand = {"kind": "integer_constant", "value": int(token)}
        else:
            raise UnsupportedPredicate("operand_outside_allowlist")
        return {"kind": "comparison", "field_identifier": field, "operator": OPERATORS[operator], "operand": operand}


def walk_ast(node):
    if node["kind"] == "comparison":
        yield node
    else:
        for child in node["clauses"]:
            yield from walk_ast(child)


def describe(node):
    if node["kind"] != "comparison":
        conjunction = " AND " if node["kind"] == "all" else " OR "
        return "(" + conjunction.join(describe(child) for child in node["clauses"]) + ")"
    operand = node["operand"]
    if operand["kind"] == "unresolved_symbol":
        right = "unresolved symbol " + operand["identifier"]
    elif operand["kind"] == "null_literal":
        right = "literal null"
    elif operand["kind"] == "boolean_literal":
        right = "literal " + str(operand["value"]).lower()
    else:
        right = "numeric constant " + str(operand["value"])
    return node["field_identifier"] + " " + OP_WORDS[node["operator"]] + " " + right


def review_payload(capture, mapping, expected):
    # Recompute private-value fingerprints even though collection already checked them.
    actual = {(r["source_table"], r["object_id"]): r for r in capture["rows"]}
    integrity = len(actual) == len(capture["rows"]) == 69 and set(actual) == set(expected)
    validated_keys = set()
    for key, row in actual.items():
        if key not in expected:
            integrity = False
            continue
        value = row["raw_value"]
        value_hash = hashlib.sha256(value.encode("utf-16le")).hexdigest().upper() if value is not None else None
        value_bytes = len(value.encode("utf-16le")) if value is not None else None
        baseline = expected[key]
        valid = checks_pass(row["checks"]) and value_hash == baseline["value_sha256_utf16le"] and value_bytes == baseline["value_bytes_utf16le"]
        integrity = integrity and valid
        if valid:
            validated_keys.add(key)
    ready = capture["receipt"]["status"] == "PASS" and integrity
    records = []
    for key, baseline in sorted(expected.items()):
        raw = actual.get(key)
        record = {**baseline, "baseline_checks": raw["checks"] if raw else {}, "accepted_structural_extraction": False}
        if not ready:
            record.update(status="withheld_capture_integrity_failure", omission_reason="whole_capture_failed_closed")
        elif baseline["source_table"] == "SCREEN_CONTROL_ATTRIBUTES":
            if raw["raw_value"] in ("true", "false"):
                record.update(status="boolean_flag_parsed", accepted_structural_extraction=True,
                              multi_selection_flag=raw["raw_value"] == "true")
            else:
                record.update(status="unresolved", omission_reason="outside_exact_lowercase_boolean_grammar")
        else:
            try:
                ast = PredicateParser(raw["raw_value"]).parse()
                nodes = list(walk_ast(ast))
                symbols = sorted({n["operand"]["identifier"] for n in nodes if n["operand"]["kind"] == "unresolved_symbol"})
                record.update(status="predicate_structure_parsed", accepted_structural_extraction=True, predicate_ast=ast,
                              structural_description=describe(ast), field_identifiers=sorted({n["field_identifier"] for n in nodes}),
                              unresolved_symbols=symbols,
                              literal_operand_types_complete=not symbols)
            except UnsupportedPredicate as error:
                record.update(status="unresolved", omission_reason=str(error))
        records.append(record)
    params = [r for r in records if r["source_table"] == "SCREEN_CONTROL_EVENT_PARAMETERS"]
    attributes = [r for r in records if r["source_table"] == "SCREEN_CONTROL_ATTRIBUTES"]
    accepted = [r for r in records if r["accepted_structural_extraction"]]
    return {"schema_version": 1, "task": "SD-11", "method": "fixed configuration-ID SELECT, original fingerprint check, non-evaluating static grammar",
            "capture_receipt": capture["receipt"],
            "source_fingerprints": [{"path": "Snapdragon/receiving/configuration-map.json", "sha256": MAP_SHA}, *mapping["source_fingerprints"]],
            "scope": {"screen_implementations": 17, "candidate_bindings": 69, "enable_action_parameters": 51, "multi_selection_attributes": 18,
                      "traversal": "existing one-hop Receiving scope; no expansion"},
            "summary": {"status": "PASS" if ready else "CAPTURE_INTEGRITY_BLOCKED", "baseline_matches": len(validated_keys),
                        "accepted_structural_extractions": len(accepted), "unresolved_or_withheld": len(records) - len(accepted),
                        "parsed_predicates": sum(r["status"] == "predicate_structure_parsed" for r in params),
                        "predicates_with_unresolved_symbols": sum(bool(r.get("unresolved_symbols")) for r in params),
                        "predicates_with_only_typed_literals": sum(r.get("literal_operand_types_complete", False) for r in params),
                        "parsed_boolean_flags": sum(r["status"] == "boolean_flag_parsed" for r in attributes),
                        "multi_selection_true": sum(r.get("multi_selection_flag") is True for r in attributes),
                        "multi_selection_false": sum(r.get("multi_selection_flag") is False for r in attributes),
                        "runtime_predicates_exercised": 0},
            "grammar": {"field_identifiers": sorted(FIELDS), "unresolved_symbol_identifiers": sorted(SYMBOLS), "integer_constants": sorted(NUMBERS),
                        "comparisons": OPERATORS, "logical_operators": {"&&": "all", "||": "any"},
                        "grouping": "parentheses; comparison precedes AND, AND precedes OR", "literals": ["true", "false", "null"],
                        "allow_on_multi_select": ["true", "false"], "max_predicate_characters": 512,
                        "excludes": ["calls", "property access", "indexing", "strings", "assignment", "statements", "comments", "arithmetic", "unknown fields or constants"]},
            "limits": ["AST and descriptions describe configured expressions; they do not execute or validate the application's evaluator.",
                       "Closed, NULL, TRUE, True and False remain unresolved symbols. Case is preserved; no coercion or substitution is assumed.",
                       "A predicate with only typed literals still has unproved field types, selection handling and runtime eligibility.",
                       "Multi-selection flags are configured Boolean values, not proof of multi-row behavior, action visibility or permission.",
                       "Only six root Insights contain the 51 captured EnableAction parameters. Absence in the other 11 implementations does not prove absent validation.",
                       "No business rows, stored-routine invocation, API/HTTP requests, mutations, expression evaluation or selected-record runtime tests occurred.",
                       "Raw expressions remain solely in the private LocalAppData assessment area. Original captures and the Receiving configuration map are unchanged.",
                       "Form 166 remains a context association without an active screen implementation; this review does not resolve that limitation."],
            "records": records}


def write_markdown(document):
    summary = document["summary"]
    if summary["status"] != "PASS":
        (OUT / "ENABLEMENT.md").write_text("# Receiving action enablement\n\nCapture integrity failed. All 69 structural extractions are withheld. See [the review receipt](enablement-review.json). No source expressions were evaluated.\n", encoding="utf-8")
        return
    lines = ["# Receiving action enablement", "", "This bounded SD-11 supplement describes 69 retained configuration bindings from the 17 Receiving implementations: 51 `EnableAction_*` parameters and 18 `data-allowOnMultiSelect` attributes. The fixed read-only replica capture matched every original UTF-16LE fingerprint, length, parent, configuration name and flag. No business records or actions were accessed.", "",
             f"Structural extraction: **{summary['accepted_structural_extractions']}/69 ({summary['accepted_structural_extractions'] / 69 * 100:.2f}%)**. Predicates: **{summary['parsed_predicates']}/51**. Boolean flags: **{summary['parsed_boolean_flags']}/18** ({summary['multi_selection_true']} true, {summary['multi_selection_false']} false). Runtime predicates exercised: **0/51**.", "",
             f"The parser preserves field names, comparison distinctions and AND/OR grouping. **{summary['predicates_with_unresolved_symbols']}/51 predicates contain unresolved bare symbols** (`Closed`, `NULL`, `TRUE`, `True`, `False`); these are not converted to enum/Boolean/null literals. The remaining **{summary['predicates_with_only_typed_literals']}/51** use typed literal operands, but field types, evaluator behavior, selection handling and server eligibility remain unproved. Numeric status constants are not assigned business status names here.", "",
             "The `EnableAction_` suffix joins to an exact control name within the same implementation. These are recorded bindings from the grid's active-row-change event to action controls; a matching name is not a successful runtime transition. The multi-selection flag likewise records intent, not verified behavior.", "",
             "Sources: [configuration-map.json](configuration-map.json), [machine-readable review and exact query receipts](enablement-review.json), [fixed collector and parser](../tools/collect_receiving_enablement.py). The review includes source hashes and all source IDs. Raw expressions remain outside this repository.", "",
             "## Per-form extraction", "", "| Form | Screen | Predicates parsed / candidates | Flags parsed / candidates | Symbol-bearing predicates |", "|---|---|---:|---:|---:|"]
    for screen in document["source_screen_index"]:
        selected = [r for r in document["records"] if r["main_ui_screen_id"] == screen["main_ui_screen_id"]]
        params = [r for r in selected if r["source_table"] == "SCREEN_CONTROL_EVENT_PARAMETERS"]
        attrs = [r for r in selected if r["source_table"] == "SCREEN_CONTROL_ATTRIBUTES"]
        parsed_params = sum(r['status'] == 'predicate_structure_parsed' for r in params)
        parsed_attrs = sum(r['status'] == 'boolean_flag_parsed' for r in attrs)
        lines.append(f"| {screen['form_id']} | {screen['main_ui_screen_id']} | {parsed_params}/{len(params)} | {parsed_attrs}/{len(attrs)} | {sum(bool(r.get('unresolved_symbols')) for r in params)} |")
    lines += ["", "Zero entries means this exact captured binding family was absent; it does not mean no enablement or validation exists elsewhere.", "", "## Action predicate bindings", ""]
    for fid in sorted({r["form_id"] for r in document["records"] if r["source_table"] == "SCREEN_CONTROL_EVENT_PARAMETERS"}):
        rows = [r for r in document["records"] if r["form_id"] == fid and r["source_table"] == "SCREEN_CONTROL_EVENT_PARAMETERS"]
        first = rows[0]
        lines += [f"### Form {fid} / screen {first['main_ui_screen_id']}", "",
                  f"Source grid control `{first['screen_control_id']}`, event record `{first['screen_control_event_id']}`: `{first['event_id']}` → `{first['event_handler']}`.", "",
                  "| Action control | Parameter ID | Structural description |", "|---|---|---|"]
        for row in rows:
            target = "; ".join(f"{t['control_name']} ({t['screen_control_id']})" for t in row["target_controls"]) or "No matching control"
            lines.append(f"| {target} | {row['object_id']} | {row.get('structural_description', row.get('omission_reason'))} |")
        lines.append("")
    lines += ["## Multi-selection attributes", "", "| Form / screen | Control | Attribute ID | Configured Boolean |", "|---|---|---|---|"]
    for row in document["records"]:
        if row["source_table"] == "SCREEN_CONTROL_ATTRIBUTES":
            value = str(row["multi_selection_flag"]).lower() if "multi_selection_flag" in row else "withheld"
            lines.append(f"| {row['form_id']} / {row['main_ui_screen_id']} | {row['control_name']} ({row['screen_control_id']}) | {row['object_id']} | {value} |")
    lines += ["", "## Boundaries and validation", ""]
    lines.extend("- " + limit for limit in document["limits"])
    lines += ["", "The parser accepts only whitelisted field identifiers, numeric constants 0/1/100/200, exact lowercase Boolean/null literals, the five explicitly unresolved symbols, comparisons, AND/OR and parentheses. It rejects calls, strings, property/index access, statements, assignments, comments, arithmetic and unknown identifiers. It never evaluates input.", "",
              "A drift in any source value, parent, name or flag blocks the whole capture from semantic extraction. Offline negative checks cover metadata drift, private-value tampering and out-of-grammar inputs. Source hashes are rechecked before each offline build. Original configuration-map counts remain unchanged; this separate supplement resolves only the bounded extraction task.", ""]
    (OUT / "ENABLEMENT.md").write_text("\n".join(lines), encoding="utf-8")


def build():
    mapping, expected = expected_rows()
    capture = json.loads(PRIVATE_FILE.read_text(encoding="utf-8"))
    document = review_payload(capture, mapping, expected)
    document["private_capture_sha256"] = sha(PRIVATE_FILE)
    document["collector_sha256"] = sha(Path(__file__))
    document["source_screen_index"] = [{"form_id": s["identity"]["form_id"], "main_ui_screen_id": s["identity"]["main_ui_screen_id"]} for s in mapping["screens"]]
    document["validation"] = self_tests(capture, mapping, expected)
    assessment.atomic_json(OUT / "enablement-review.json", document)
    write_markdown(document)
    print(json.dumps(document["summary"]))
    return 0 if document["summary"]["status"] == "PASS" else 2


def self_tests(capture, mapping, expected):
    results = []

    def check(name, passed):
        if not passed:
            raise ValueError("Offline validation failed: " + name)
        results.append({"name": name, "status": "PASS"})

    for value, expected_kind in (("ObjectId > 0", "comparison"), ("CLOSED === false", "comparison"),
                                 ("CLOSE_DATE === null", "comparison"), ("CLOSED === False", "comparison"),
                                 ("Status !== Closed", "comparison"),
                                 ("ObjectId > 0 || Status === 100 && Lines > 0", "any"),
                                 ("(ObjectId > 0 || Status === 100) && Lines > 0", "all")):
        ast = PredicateParser(value).parse()
        check("positive_grammar_case_" + str(len(results) + 1), ast["kind"] == expected_kind)
    check("symbol_case_not_coerced", PredicateParser("CLOSED === False").parse()["operand"] == {"kind": "unresolved_symbol", "identifier": "False"})
    check("AND_precedes_OR", PredicateParser("ObjectId > 0 || Status === 100 && Lines > 0").parse()["clauses"][1]["kind"] == "all")
    rejected = ["run()", "ObjectId.value > 0", "ObjectId[0] > 0", "ObjectId = 0", "ObjectId > 0; run()",
                "ObjectId > 0 //comment", "ObjectId > 0 /*comment*/", "ObjectId > '0'", 'ObjectId > "0"',
                "ObjectId + 1 > 0", "Unknown > 0", "Status === Unknown", "ObjectId > 999", "ObjectId > 00",
                "ObjectId >", "(ObjectId > 0", "ObjectId > 0)", "!CLOSED", "ObjectId > 0 ObjectId > 0", "ObjectId > ٠"]
    for index, value in enumerate(rejected, 1):
        try:
            PredicateParser(value).parse()
        except UnsupportedPredicate:
            check("rejected_grammar_class_" + str(index), True)
        else:
            check("rejected_grammar_class_" + str(index), False)
    for name in sorted(CHECK_NAMES):
        changed = copy.deepcopy(capture)
        changed["rows"][0]["checks"][name] = False
        check("collector_non_PASS_on_" + name + "_drift", capture_status(changed["rows"]) != "PASS")
        reviewed = review_payload(changed, mapping, expected)
        check("offline_withholds_all_on_" + name + "_drift", reviewed["summary"]["status"] != "PASS" and reviewed["summary"]["accepted_structural_extractions"] == 0)
    for scenario in ("empty_checks", "missing_check", "non_boolean_check", "private_value_tamper", "missing_row", "duplicate_row", "failed_receipt"):
        changed = copy.deepcopy(capture)
        if scenario == "empty_checks":
            changed["rows"][0]["checks"] = {}
        elif scenario == "missing_check":
            changed["rows"][0]["checks"].pop("parent_id")
        elif scenario == "non_boolean_check":
            changed["rows"][0]["checks"]["parent_id"] = 1
        elif scenario == "private_value_tamper":
            changed["rows"][0]["raw_value"] += " "
        elif scenario == "missing_row":
            changed["rows"].pop()
        elif scenario == "duplicate_row":
            changed["rows"][-1] = copy.deepcopy(changed["rows"][0])
        else:
            changed["receipt"]["status"] = "DRIFT_DETECTED"
        reviewed = review_payload(changed, mapping, expected)
        check("offline_withholds_all_on_" + scenario, reviewed["summary"]["status"] != "PASS" and reviewed["summary"]["accepted_structural_extractions"] == 0)
    return {"method": "offline positive/negative parser checks and synthetic drift against a private in-memory copy; no DB or expressions executed",
            "passed": len(results), "failed": 0, "checks": results}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--collect", action="store_true", help="perform the single fixed read-only capture")
    args = parser.parse_args()
    if args.collect:
        return collect()
    return build()


if __name__ == "__main__":
    sys.exit(main())
