"""Derive a navigation queue from captured configuration; no live browser claims."""
from collections import Counter, defaultdict
import csv
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DB = ROOT / "Snapdragon/database"
OUT = ROOT / "Snapdragon/inventory"
BASE = "https://trav.manhscale.com"


def read(name):
    return json.loads((DB / (name + ".json")).read_text(encoding="utf-8"))


def classify(row):
    path = (row["PATH"] or "").strip()
    if row["ACTIVE"] != "Y":
        return "inactive", "do_not_count_as_current_route"
    if not path:
        return "legacy_or_unresolved", "no_configured_web_route"
    if path.lower().startswith(("http:", "https:")):
        return "external_application", "separate_application"
    if path.startswith("/tpm/"):
        return "tpm", "separate_portal"
    if path.lower().startswith("/warehousemobile"):
        return "warehouse_mobile", "separate_mobile_scope"
    if path.lower().startswith("/rf/"):
        return "legacy_rf", "separate_mobile_scope"
    if 50000 <= int(row["FORM_ID"]) < 60000:
        return "metadata_editor", "context_required_configuration_view_cancel_only"
    if path == "/scale/general/developer":
        return "developer_portal", "read_only_inspection"
    if "/scale/insights/" in path:
        return "insight", "direct_route_candidate"
    if "/scale/monitors/" in path:
        return "monitor", "direct_route_candidate"
    if "/scale/details/" in path:
        return "record_detail_template", "record_context_required"
    if "scale/trans/" in path:
        if row["SHOW_IN_APP_MENU"] == "Y":
            return "transaction_menu", "view_only_do_not_submit"
        return "transaction_context", "context_required_do_not_submit"
    if path == "/config":
        return "configuration_portal", "view_cancel_only"
    return "other_application", "inspect_separately"


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    forms = {r["FORM_ID"]: r for r in read("forms")}
    audit_path = ROOT / "Snapdragon/evidence/config-form-navigation.json"
    form_audits = ({int(r["form_id"]): r for r in json.loads(audit_path.read_text(encoding="utf-8"))["results"]}
                   if audit_path.exists() else {})
    resources = defaultdict(dict)
    for source in ("base", "custom"):
        for r in read("resource_labels_" + source):
            resources[r["RESOURCE_KEY"]][r["RESOURCE_GROUP"].lower()] = r["TEXT"]
    parts = defaultdict(list)
    for r in read("screen_parts"):
        parts[r["SCREEN_ID"]].append(r)
    groups = defaultdict(list)
    for r in read("screen_groups"):
        groups[r["SCREEN_PART_ID"]].append(r)
    controls = defaultdict(list)
    for r in read("screen_controls"):
        controls[r["SCREEN_GROUP_ID"]].append(r)
    columns = defaultdict(list)
    for r in read("grid_columns"):
        columns[r["SCREEN_CONTROL_ID"]].append(r)
    rows = []
    chain_rows = []
    for r in read("main_ui_screens"):
        form = forms[r["FORM_ID"]]
        key = r["MENU_RESOURCE_KEY"] or form["FORM_KEY_NAME"]
        path = r["PATH"] or ""
        category, requirement = classify(r)
        form_audit = form_audits.get(int(r["FORM_ID"]), {})
        screen_parts = parts[r["OBJECT_ID"]]
        screen_groups = [g for p in screen_parts for g in groups[p["OBJECT_ID"]]]
        screen_controls = [c for g in screen_groups for c in controls[g["OBJECT_ID"]]]
        screen_columns = [c for control in screen_controls for c in columns[control["OBJECT_ID"]]]
        label = resources[key].get("text", key)
        parts_out = []
        for part in screen_parts:
            group_rows = []
            for group in groups[part["OBJECT_ID"]]:
                control_rows = []
                for control in controls[group["OBJECT_ID"]]:
                    control_rows.append({**control, "label": resources[control["RESOURCE_KEY"]].get("text"),
                                         "grid_columns": [{**column, "label": resources[column["RESOURCE_KEY"]].get("text")} for column in columns[control["OBJECT_ID"]]]})
                group_rows.append({**group, "label": resources[group["RESOURCE_KEY"]].get("text"), "controls": control_rows})
            parts_out.append({**part, "label": resources[part["RESOURCE_KEY"]].get("text"), "groups": group_rows})
        chain_rows.append({"form_id": int(r["FORM_ID"]), "main_ui_screen_id": int(r["OBJECT_ID"]), "label": label,
                           "source": "database configuration, not a live browser observation", "parts": parts_out})
        rows.append({"form_id": int(r["FORM_ID"]), "main_ui_screen_id": int(r["OBJECT_ID"]),
                     "label": label, "form_key": form["FORM_KEY_NAME"],
                     "functional_area_code": r["FUNCTIONAL_AREA"], "active": r["ACTIVE"],
                     "system_created": r["SYSTEM_CREATED"], "show_in_app_menu": r["SHOW_IN_APP_MENU"],
                     "path_type": int(r["PATH_TYPE"]), "configured_path": path,
                     "candidate_url": (BASE + "/" + path.lstrip("/")) if path and not path.lower().startswith(("http:", "https:")) else path,
                     "form_configuration_url": BASE + "/scale/details/form/" + r["FORM_ID"],
                     "route_category": category, "inspection_requirement": requirement,
                     "route_verified_live": False, "configuration_table_or_view": form["TABLE_NAME"],
                     "config_form_inspection_status": form_audit.get("status", "not_inspected"),
                     "config_form_screen_link_visible": int(r["OBJECT_ID"]) in form_audit.get("observed_main_ui_screen_ids", []),
                     "help_page_reference": resources[key].get("help"),
                     "part_count": len(screen_parts), "group_count": len(screen_groups),
                     "control_count": len(screen_controls), "grid_column_count": len(screen_columns),
                     "configured_part_names": [p["PART_NAME"] for p in screen_parts],
                     "metadata_source": "Snapdragon/database/main_ui_screens.json"})
    (OUT / "screen-registry.json").write_text(json.dumps(rows, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    with (OUT / "screen-registry.csv").open("w", encoding="utf-8-sig", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)
    summary = {"form_records": len(forms), "main_ui_screen_records": len(rows),
               "distinct_main_ui_form_ids": len({r["form_id"] for r in rows}),
               "active_screen_records": sum(r["active"] == "Y" for r in rows),
               "route_categories": dict(Counter(r["route_category"] for r in rows)),
               "inspection_requirements": dict(Counter(r["inspection_requirement"] for r in rows)),
               "live_navigation_evidence_count": 0,
               "live_navigation_evidence_scope": "runtime route only; see separate live configuration-form measure",
               "live_config_form_inspected_count": sum(r.get("status") == "loaded_matching_form" for r in form_audits.values()),
               "live_config_form_denominator": len({r["form_id"] for r in rows if r["active"] == "Y"}),
               "limitations": ["Configuration inventory is not proof of browser navigation or current-user authorization.",
                               "FORM includes forms without MAIN_UI_SCREEN and is not a screen denominator.",
                               "Repeated FORM_ID may represent base/custom or active/inactive MAIN_UI_SCREEN alternatives.",
                               "Functional area codes are retained; do not infer menu-section labels solely from these codes.",
                               "candidate_url adds a leading slash to relative configured paths; original path is retained."]}
    (OUT / "metadata-summary.json").write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    direct = [r for r in rows if r["inspection_requirement"] == "direct_route_candidate"]
    (OUT / "direct-route-candidates.json").write_text(json.dumps(direct, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    (DB / "screen-configuration-chains.json").write_text(json.dumps(chain_rows, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    report = ["# Screen configuration inventory", "", "Captured from read-only replica `travprodwbeyz`. This is configuration evidence; browser navigation and functional review are tracked separately.", "", "Counts include all captured child rows, including inactive controls and base/custom alternatives. English labels use captured resource text, with a custom label preferred when present; deployed label precedence is not established by this derivation.", "", "| Form | Main UI screen | Label | Category | Parts | Groups | Controls | Grid columns |", "|---|---|---|---|---:|---:|---:|---:|"]
    for r in rows:
        report.append("| " + " | ".join(str(r[k]).replace("|", "\\|") for k in ["form_id", "main_ui_screen_id", "label", "route_category", "part_count", "group_count", "control_count", "grid_column_count"]) + " |")
    (DB / "SCREEN_CONFIGURATION_INDEX.md").write_text("\n".join(report) + "\n", encoding="utf-8")
    current = {}
    for phase in ("inventory", "schema", "supplement", "labels", "graph-schema", "graph"):
        if not (DB / (phase + "-manifest.json")).exists():
            continue
        manifest = read(phase + "-manifest")
        for name, query in manifest["queries"].items():
            current[name] = {**query, "capture_manifest": phase + "-manifest.json", "output_file": name + ".json"}
    problems = []
    for name, receipt in current.items():
        target = DB / receipt["output_file"]
        if not target.exists() or hashlib.sha256(target.read_bytes()).hexdigest() != receipt.get("output_sha256"):
            problems.append(name + ": output hash mismatch")
    verification = {"status": "PASS" if not problems else "FAIL", "current_artifact_count": len(current), "problems": problems, "queries": current,
                    "historical_manifest_note": "Phase manifests record each execution. Shared identity/schema artifacts are superseded by later captures; this manifest selects the final matching output for each query name."}
    (DB / "current-capture-manifest.json").write_text(json.dumps(verification, indent=2) + "\n", encoding="utf-8")
    if problems:
        raise ValueError(problems)
    print(json.dumps(summary))


if __name__ == "__main__":
    main()
