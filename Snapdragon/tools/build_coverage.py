"""Recompute bounded Snapdragon coverage from retained evidence; no network access."""
from __future__ import annotations

from collections import Counter
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
from urllib.parse import urlsplit

BASE = Path(__file__).resolve().parents[1]


def read(relative):
    return json.loads((BASE / relative).read_text(encoding="utf-8-sig"))


def key(value):
    parsed = urlsplit(value)
    path = parsed.path.rstrip("/").casefold() or "/"
    host = parsed.netloc.casefold() if parsed.hostname and parsed.hostname.casefold() != "trav.manhscale.com" else ""
    return host + path + ("?" + parsed.query if parsed.query else "")


def percent(a, b):
    return round(a * 100 / b, 2) if b else None


def main():
    menu = read("evidence/menu-routes.json")["routes"]
    registry = read("inventory/screen-registry.json")
    raw = read("evidence/runtime-root.json")
    raw += read("evidence/runtime-source-agent.json")["routes"]
    for observation in read("evidence/runtime-training-agent.json")["observations"]:
        raw.append({**observation, "name": observation["screen"], "path": observation["url"],
                    "status": "loaded" if observation.get("title") and not observation.get("alerts") else "requires_review"})
    routes = {}
    for observation in raw:
        route_key = key(observation.get("path") or observation.get("url") or observation["actual_url"])
        row = routes.setdefault(route_key, {"canonical_path": route_key, "names": [], "statuses": [], "observations": 0})
        name = observation.get("name") or observation.get("label")
        if name not in row["names"]:
            row["names"].append(name)
        if observation["status"] not in row["statuses"]:
            row["statuses"].append(observation["status"])
        row["observations"] += 1
    section_rows = []
    for section in dict.fromkeys(row["section"] for row in menu):
        items = [row for row in menu if row["section"] == section]
        attempted = sum(key(row["path"]) in routes for row in items)
        loaded = sum("loaded" in routes.get(key(row["path"]), {}).get("statuses", []) for row in items)
        section_rows.append({"section": section, "denominator": len(items), "attempted": attempted,
                             "loaded": loaded, "attempted_pct": percent(attempted, len(items)),
                             "loaded_pct": percent(loaded, len(items)), "fully_reviewed": 0})
    config = read("evidence/config-form-navigation.json")
    latest = {row["form_id"]: row for row in config["results"]}
    active_forms = {row["form_id"] for row in registry if row["active"] == "Y"}
    config_ok = sum(latest.get(fid, {}).get("status") == "loaded_matching_form" for fid in active_forms)
    numeric = [row for row in registry if row["route_category"] in {"insight", "monitor"}]
    numeric_keys = {key(row["configured_path"]) for row in numeric}
    numeric_loaded = sum("loaded" in routes.get(k, {}).get("statuses", []) for k in numeric_keys)
    result = {
        "generated_at": datetime.now(timezone.utc).isoformat(), "observation_date": "2026-10-02",
        "scope": "Snapshot structural inventory and read-only landing/configuration inspection; not end-to-end procedure acceptance",
        "form_rows": len(read("database/forms.json")), "screen_records": len(registry),
        "distinct_screen_forms": len({r["form_id"] for r in registry}), "active_screen_records": sum(r["active"] == "Y" for r in registry),
        "screen_categories": dict(Counter(row["route_category"] for row in registry)),
        "menu_sections": section_rows, "menu_destinations": len(menu),
        "menu_attempted": sum(x["attempted"] for x in section_rows),
        "menu_loaded": sum(x["loaded"] for x in section_rows),
        "runtime_unique_routes_attempted": len(routes),
        "runtime_unique_routes_loaded": sum("loaded" in row["statuses"] for row in routes.values()),
        "numeric_insight_monitor_routes": len(numeric_keys),
        "numeric_routes_attempted": sum(k in routes for k in numeric_keys), "numeric_routes_loaded": numeric_loaded,
        "active_form_configuration_denominator": len(active_forms),
        "active_form_configuration_attempted": len(active_forms.intersection(latest)),
        "active_form_configuration_verified": config_ok,
        "active_form_configuration_pct": percent(config_ok, len(active_forms)),
        "active_form_configuration_pending": sorted(fid for fid in active_forms if latest.get(fid, {}).get("status") != "loaded_matching_form"),
        "dossiers_written": len(list((BASE / "screens/by-id").glob("*.md"))),
        "full_functional_configuration_reviewed": 0,
        "full_review_note": "No dossier has every applicable criterion in reference/COVERAGE_CRITERIA.md accepted. Structural dossiers and observed landings remain useful completed phases.",
        "routes": sorted(routes.values(), key=lambda x: x["canonical_path"]),
    }
    inputs = ["evidence/menu-routes.json", "inventory/screen-registry.json", "evidence/runtime-root.json",
              "evidence/runtime-source-agent.json", "evidence/runtime-training-agent.json", "evidence/config-form-navigation.json"]
    receiving = None
    if (BASE / "receiving/progress.json").exists():
        receiving = read("receiving/progress.json")
        result["receiving_continuation"] = receiving
        inputs.append("receiving/progress.json")
    stage = None
    if (BASE / "receiving/stage-progress.json").exists():
        stage = read("receiving/stage-progress.json")
        result["stage_continuation"] = stage
        inputs.append("receiving/stage-progress.json")
    acceptance = None
    if (BASE / "receiving/owner-acceptance.json").exists():
        acceptance = read("receiving/owner-acceptance.json")
        result["owner_acceptance"] = acceptance
        inputs.append("receiving/owner-acceptance.json")
    focused = None
    if (BASE / "receiving/focused-progress.json").exists():
        focused = read("receiving/focused-progress.json")
        result["focused_continuation"] = focused
        inputs.append("receiving/focused-progress.json")
    result["input_sha256"] = {name: hashlib.sha256((BASE / name).read_bytes()).hexdigest() for name in inputs}
    (BASE / "inventory/coverage.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    lines = ["# Snapdragon progress", "", "Observation date: 2026-10-02. Recomputed from [coverage.json](inventory/coverage.json).", "",
             "This is a completed discovery/structural-documentation pass with detailed follow-up still open. Percentages below measure the stated phase, not whole-SCALE completion.", "",
             "| Phase | Completed / denominator | Progress |", "|---|---:|---:|",
             "| Visible menu sections inventoried | 8 / 8 | 100% |",
             f"| Screen metadata records mapped | {len(registry)} / {len(registry)} | 100% |",
             f"| Screen dossiers generated | {result['dossiers_written']} / {len(registry)} | {percent(result['dossiers_written'], len(registry))}% |",
             f"| Visible menu destinations attempted | {result['menu_attempted']} / {len(menu)} | {percent(result['menu_attempted'], len(menu))}% |",
             f"| Visible menu destinations loaded | {result['menu_loaded']} / {len(menu)} | {percent(result['menu_loaded'], len(menu))}% |",
             f"| Configured numeric Insight/Monitor routes attempted | {result['numeric_routes_attempted']} / {len(numeric_keys)} | {percent(result['numeric_routes_attempted'], len(numeric_keys))}% |",
             f"| Configured numeric Insight/Monitor routes loaded | {numeric_loaded} / {len(numeric_keys)} | {percent(numeric_loaded, len(numeric_keys))}% |",
             f"| Active-form configuration pages verified | {config_ok} / {len(active_forms)} | {percent(config_ok, len(active_forms))}% |",
             f"| Every applicable review criterion verified | 0 / {len(active_forms)} | 0% |", "",
             "Full review includes conditional states, record detail branches, action/dependency semantics and the other applicable evidence criteria. No overall blended percentage is calculated. Warehouse execution is not required or authorized by this documentation pass.", "",
             "## Progress by visible menu section", "", "| Section | Attempted | Loaded | Loaded % | Remaining landing issue |", "|---|---:|---:|---:|---|"]
    for row in section_rows:
        lines.append(f"| {row['section']} | {row['attempted']}/{row['denominator']} | {row['loaded']}/{row['denominator']} | {row['loaded_pct']}% | " + ("Supply Chain Intelligence application error" if row['loaded'] < row['denominator'] else "None in landing pass") + " |")
    if receiving:
        lines += ["", "## SD-11 Receiving continuation", "",
                  "The table below measures separate Receiving work packages. The original landing sweep above retains its original observation scope.", "",
                  "| Task / measure | Completed / denominator | Progress | State |", "|---|---:|---:|---|"]
        for task in receiving["work_packages"]:
            value = percent(task["completed"], task["denominator"])
            progress = f"{value}%" if value is not None else "N/A"
            lines.append(f"| {task['id']} - {task['measure']} | {task['completed']}/{task['denominator']} | {progress} | {task['status']} |")
        lines += ["", receiving["qualification"], "",
                  "Read [the Receiving session report](receiving/SESSION_REPORT.md), [functional guide](receiving/FUNCTIONAL_GUIDE.md), [configuration map](receiving/CONFIGURATION.md) and [backend reconciliation](receiving/BACKEND_BINDINGS.md).", ""]
    if stage:
        lines += ["", "## Renewed Stage Receiving and Mobile review", "",
                  "Observed at travstg.manhscale.com. These new UI observations do not replace the earlier Production snapshot or prove environment parity.", "",
                  "| Task / measure | Completed / denominator | Progress |", "|---|---:|---:|"]
        for task in stage["work_packages"]:
            lines.append(f"| {task['id']} - {task['measure']} | {task['completed']}/{task['denominator']} | {percent(task['completed'], task['denominator'])}% |")
        lines += ["", stage["qualification"], "", "Read [the Stage session report](receiving/STAGE_SESSION_REPORT.md) for screen-level findings, remaining work and evidence.", ""]
    if acceptance:
        lines += ["", "## Owner acceptance and current focus", "",
                  f"The owner accepted the delivered work through `{acceptance['accepted_delivery_commit'][:8]}` with its reported limits. [Acceptance record](receiving/owner-acceptance.json). Only selected-record contexts (S3) and Monitor chart levels (S7) are the current continuation. Prior measurements above remain their dated evidence; owner acceptance is distinct from verification of every technical criterion.", ""]
    if focused:
        lines += ["| Current task | Observed / denominator | Progress | Evidence environment |", "|---|---:|---:|---|"]
        for task in focused["work_packages"]:
            lines.append(f"| {task['id']} - {task['measure']} | {task['completed']}/{task['denominator']} | {percent(task['completed'], task['denominator'])}% | {task['evidence_environment']} |")
        lines += ["", focused["qualification"], "", "Read [the focused continuation report](receiving/FOCUSED_SESSION_REPORT.md) for attempts, results and remaining requirements.", ""]
    lines += ["", "Each section has an initial functional note and mapped labels; full per-screen review remains open in every section.", "",
              "## Completed", "", "- Reviewed Sam's transcript, supplied notes and selected visual frames at a pinned private repository commit.",
             "- Captured 917 FORM rows and classified all 254 screen implementations; preserved inactive and context-dependent entries.",
              "- Captured parts, groups, controls, grid definitions, resource labels and supplementary configuration mappings.",
              "- Mapped 2,306 selected dependency values across 142 screens; 45 candidate values remain omitted. See [dependency mapping](database/DEPENDENCIES.md).",
              "- Navigated all 63 current menu destinations and six additional configured Insight/Monitor routes; recorded outcomes.",
              "- Authored section notes, a current-installation Purchase Order configuration walkthrough, and 254 structural dossiers.", "",
              "## Pending and access limitations", "", "- Supply Chain Intelligence: configured external application returns an ASP.NET runtime error.",
              "- Five Labor routes: SCALE states that the screen is not licensed. This is the exact observed application category, not a diagnosis of every warning.",
              "- Selected-record Details, context-dependent Transactions, TPM pages, mobile flow states and inactive/legacy entries need their own disposition and applicable functional review; a form-configuration visit is not a runtime visit.",
              "- Shared `/WarehouseMobile` entry does not validate every mobile FORM_ID. Preserve the six previously owner-deferred mobile gaps.",
              "- Action enablement, event/parameter meanings, data-source behavior, conditional criteria, detail tabs and service dependencies remain to be reviewed beyond the demonstrated chain.",
              "- Multi-role/warehouse differences, replica freshness and operational outcomes remain unverified. No configuration save, business transaction, print or export was performed.", "",
              "See [the roadmap](ROADMAP.md), [the resume entry](RESUME.md), [screen index](screens/INDEX.md), and [completion criteria](reference/COVERAGE_CRITERIA.md).", ""]
    (BASE / "STATUS.md").write_text("\n".join(lines), encoding="utf-8")
    nav = ["# Observed navigation map", "", "Observed 2026-10-02. These links come from the visible menu and configured route inventory. Opening a link does not execute an action; do not submit operational controls while inspecting.", "",
           "The Form link opens configuration. Form IDs and Screen implementation IDs differ. Shared application routes and unresolved identifiers retain explicit qualification.", ""]
    for section in dict.fromkeys(row["section"] for row in menu):
        nav += ["## " + section, "", "| Screen | Runtime route | Form configuration | Observation |", "|---|---|---|---|"]
        for item in [r for r in menu if r["section"] == section]:
            matches = [r for r in registry if r["active"] == "Y" and key(r["configured_path"]) == key(item["path"])]
            forms = sorted({r["form_id"] for r in matches})
            form_cell = ", ".join(f"[{fid}](https://trav.manhscale.com/scale/details/form/{fid})" for fid in forms) if len(forms) < 4 else "Shared application entry; see screen index"
            form_cell = form_cell or "No single matched form"
            url = item["path"] if item["path"].lower().startswith("http") else "https://trav.manhscale.com" + item["path"]
            outcome = "Loaded" if "loaded" in routes.get(key(item["path"]), {}).get("statuses", []) else "Application runtime error"
            nav.append(f"| {item['name']} | [Open]({url}) | {form_cell} | {outcome} |")
        nav.append("")
    nav += ["## Additional configured numeric routes", "", "| Screen | Form | Runtime route | Observation |", "|---|---:|---|---|"]
    menu_keys = {key(r["path"]) for r in menu}
    for item in numeric:
        if key(item["configured_path"]) not in menu_keys:
            outcome = "Loaded" if "loaded" in routes.get(key(item["configured_path"]), {}).get("statuses", []) else "SCALE reports not licensed"
            nav.append(f"| {item['label']} | [{item['form_id']}]({item['form_configuration_url']}) | [Open]({item['candidate_url']}) | {outcome} |")
    nav += ["", "See [all 254 implementations](screens/INDEX.md), [progress](STATUS.md) and [the PO configuration traversal](screens/purchase-order-configuration.md).", ""]
    (BASE / "NAVIGATION.md").write_text("\n".join(nav), encoding="utf-8")
    print(json.dumps({k: result[k] for k in ("menu_attempted", "menu_loaded", "runtime_unique_routes_attempted", "runtime_unique_routes_loaded", "numeric_routes_attempted", "numeric_routes_loaded", "active_form_configuration_verified", "dossiers_written")}, indent=2))


if __name__ == "__main__":
    main()
