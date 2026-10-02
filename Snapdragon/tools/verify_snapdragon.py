"""Verify saved Snapdragon documentation, graph identity and observation coverage offline."""
from __future__ import annotations

import hashlib
import json
from pathlib import Path
import re
from datetime import datetime, timezone
from urllib.parse import unquote, urlsplit

BASE = Path(__file__).resolve().parents[1]
ROOT = BASE.parent


def read(name):
    return json.loads((BASE / name).read_text(encoding="utf-8-sig"))


def main():
    checks, failures = [], []

    def check(name, condition, details):
        checks.append({"name": name, "status": "PASS" if condition else "FAIL", "details": details})
        if not condition:
            failures.append(name)

    json_files = sorted(BASE.rglob("*.json"))
    invalid = []
    for path in json_files:
        try:
            json.loads(path.read_text(encoding="utf-8-sig"))
        except Exception as error:
            invalid.append({"path": str(path.relative_to(BASE)), "error": str(error)})
    check("json_parse", not invalid, {"files": len(json_files), "invalid": invalid})

    registry, chains = read("inventory/screen-registry.json"), read("database/screen-configuration-chains.json")
    identity = {(x["form_id"], x["main_ui_screen_id"]) for x in registry}
    chain_identity = {(x["form_id"], x["main_ui_screen_id"]) for x in chains}
    check("screen_identity", len(identity) == len(registry) == 254 and identity == chain_identity,
          {"registry": len(registry), "chains": len(chains), "distinct_forms": len({x[0] for x in identity})})
    parts = [p for s in chains for p in s["parts"]]
    groups = [g for p in parts for g in p["groups"]]
    controls = [c for g in groups for c in g["controls"]]
    columns = [c for ctrl in controls for c in ctrl["grid_columns"]]
    graph_counts = dict(zip(("parts", "groups", "controls", "grid_columns"), map(len, (parts, groups, controls, columns))))
    check("structural_graph_counts", list(graph_counts.values()) == [463, 1872, 4949, 1635], graph_counts)
    interaction = read("database/interaction-map-summary.json")
    check("interaction_graph_receipt", interaction.get("status") == "PASS" and interaction.get("screens") == 254,
          {k: interaction[k] for k in ("screens", "controls", "group_columns", "control_attributes", "control_events", "event_parameters")})

    receipt = read("database/current-capture-manifest.json")
    hash_errors = []
    for name, query in receipt["queries"].items():
        output = BASE / "database" / query["output_file"]
        actual_hash = hashlib.sha256(output.read_bytes()).hexdigest()
        if actual_hash != query["output_sha256"] or len(json.loads(output.read_text())) != query["row_count"]:
            hash_errors.append(name)
        if hashlib.sha256(query["sql"].encode()).hexdigest() != query["sql_sha256"]:
            hash_errors.append(name + ":sql")
    check("current_capture_hashes", not hash_errors, {"artifacts": len(receipt["queries"]), "errors": hash_errors})

    token_receipt = read("database/safe-dependency-token-manifest.json")
    tokens = read("database/safe-dependency-tokens.json")
    token_summary = read("database/safe-dependency-token-summary.json")
    token_errors = []
    token_path = BASE / "database" / token_receipt["output_file"]
    if hashlib.sha256(token_path.read_bytes()).hexdigest() != token_receipt["output_sha256"]:
        token_errors.append("output_hash")
    originals = {
        "SCREEN_CONTROL_ATTRIBUTES": {str(r["OBJECT_ID"]): r for r in read("database/control_attributes.json")},
        "SCREEN_CONTROL_EVENT_PARAMETERS": {str(r["OBJECT_ID"]): r for r in read("database/event_parameters.json")},
    }
    owners = {str(r["screen_control_id"]): r for r in read("database/screen-interaction-map.json")}
    events = {str(r["OBJECT_ID"]): r for r in read("database/control_events.json")}
    rules = token_receipt["rules"]
    seen_tokens = set()
    for row in tokens:
        token_id = (row["source_table"], str(row["object_id"]))
        original = originals[token_id[0]][token_id[1]]
        is_attribute = token_id[0] == "SCREEN_CONTROL_ATTRIBUTES"
        prefix = "attribute" if is_attribute else "parameter"
        name = original["ATTRIBUTE_NAME" if is_attribute else "PARAMETER_NAME"]
        parent_control = str(original["SCREEN_CONTROL_ID"]) if is_attribute else str(events[str(original["SCREEN_CONTROL_EVENT_ID"])]["SCREEN_CONTROL_ID"])
        owner = owners[parent_control]
        valid = (token_id not in seen_tokens and name == row["configuration_name"]
                 and parent_control == str(row["screen_control_id"])
                 and str(owner["main_ui_screen_id"]) == str(row["main_ui_screen_id"])
                 and str(owner["form_id"]) == str(row["form_id"])
                 and original[prefix + "_value_bytes"] == row["value_bytes_utf16le"]
                 and original[prefix + "_value_sha256_utf16le"] == row["value_sha256_utf16le"])
        seen_tokens.add(token_id)
        valid = valid and (name in rules["attribute_kinds"] if is_attribute else name in rules["parameter_names"])
        if row["accepted"]:
            value, kind = row["safe_value"], row["token_kind"]
            encoded = value.encode("utf-16le")
            valid = valid and len(encoded) == row["value_bytes_utf16le"] and hashlib.sha256(encoded).hexdigest().upper() == row["value_sha256_utf16le"]
            grammar = {"relative_api_path": "relative_api_path_regex", "form_id": "numeric_id_regex",
                       "grid_field_identifier": "simple_identifier_regex", "resource_code": "simple_identifier_regex"}.get(kind, "identifier_regex")
            valid = valid and (bool(re.fullmatch(rules[grammar], value, re.I)) if kind != "checkpoint" else
                               bool(re.fullmatch(rules["numeric_id_regex"], value) or re.fullmatch(rules["simple_identifier_regex"], value)))
            if kind == "relative_api_path":
                valid = valid and len(value) <= rules["relative_api_path_max_length"]
        else:
            valid = valid and row["safe_value"] is None and bool(row["omission_reason"])
        if not valid:
            token_errors.append(":".join(token_id))
    accepted = sum(r["accepted"] for r in tokens)
    counts_match = (len(tokens) == token_summary["candidate_rows"] == 2351 and
                    accepted == token_summary["accepted_rows"] == 2306 and
                    len(tokens) - accepted == token_summary["omitted_rows"] == 45)
    check("safe_dependency_tokens", not token_errors and counts_match and token_receipt["status"] == "PASS",
          {"candidates": len(tokens), "accepted": accepted, "omitted": len(tokens) - accepted, "errors": token_errors})

    coverage = read("inventory/coverage.json")
    input_errors = [name for name, expected in coverage["input_sha256"].items()
                    if hashlib.sha256((BASE / name).read_bytes()).hexdigest() != expected]
    check("coverage_input_hashes", not input_errors, {"inputs": len(coverage["input_sha256"]), "errors": input_errors})
    coverage_expected = {"menu_destinations":63, "menu_attempted":63, "menu_loaded":62,
                         "runtime_unique_routes_attempted":69, "runtime_unique_routes_loaded":63,
                         "numeric_insight_monitor_routes":53, "numeric_routes_attempted":53,
                         "numeric_routes_loaded":48, "active_form_configuration_verified":211, "dossiers_written":254}
    check("coverage_counts", all(coverage.get(k) == v for k, v in coverage_expected.items()),
          {k: coverage.get(k) for k in coverage_expected})
    dossiers = list((BASE / "screens/by-id").glob("*.md"))
    check("dossier_identity", len(dossiers) == 254 and all(
        (BASE / "screens/by-id" / f"form-{f}_screen-{s}.md").is_file() for f, s in identity), {"files": len(dossiers)})

    missing, link_count = [], 0
    for path in BASE.rglob("*.md"):
        body = path.read_text(encoding="utf-8")
        targets = re.findall(r"(?<!!)\[[^\]]*\]\((<[^>]+>|[^)]+)\)", body)
        targets += re.findall(r"(?m)^\[[^\]]+\]:\s*(<[^>]+>|\S+)", body)
        for raw_target in targets:
            target = raw_target.strip().strip("<>")
            if target.startswith(("http:", "https:", "mailto:", "#")):
                continue
            target = unquote(target.split("#", 1)[0])
            if not target:
                continue
            link_count += 1
            if not (path.parent / target).resolve().exists():
                missing.append({"file": path.relative_to(BASE).as_posix(), "target": target})
    # verification.json is created below; its prospective handoff link is valid.
    missing = [x for x in missing if x["target"] != "evidence/verification.json"]
    check("local_markdown_links", not missing, {"links": link_count, "missing": missing})

    forbidden = re.compile(r"-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----|\b(?:Password|Pwd)\s*=\s*[^;\s'\"]{4,}|\bgh[pousr]_[A-Za-z0-9]{20,}", re.I)
    secret_hits = []
    for path in BASE.rglob("*"):
        if path.is_file() and path.suffix in {".json", ".md", ".txt", ".csv"}:
            if forbidden.search(path.read_text(encoding="utf-8", errors="replace")):
                secret_hits.append(path.relative_to(BASE).as_posix())
    check("credential_pattern_scan", not secret_hits, {"matching_files": secret_hits, "limit":"Pattern check, not proof against every possible secret."})

    result = {"status":"PASS" if not failures else "FAIL", "verified_at":datetime.now(timezone.utc).isoformat(),
              "command":"python Snapdragon/tools/verify_snapdragon.py", "exit_code": 0 if not failures else 1,
              "checks_passed": len(checks)-len(failures), "checks_failed":len(failures), "checks_skipped":0,
              "checks":checks, "not_run":["Warehouse transactions", "Configuration save/activation/publication", "Operational action calls", "Real-role accessibility acceptance", "Help application regression suite (unchanged application)"]}
    (BASE / "evidence/verification.json").write_text(json.dumps(result, indent=2)+"\n", encoding="utf-8")
    print(json.dumps({k:result[k] for k in ("status", "checks_passed", "checks_failed", "checks_skipped")}, indent=2))
    if failures:
        print(json.dumps([c for c in checks if c["status"] == "FAIL"], indent=2))
    raise SystemExit(result["exit_code"])


if __name__ == "__main__":
    main()
