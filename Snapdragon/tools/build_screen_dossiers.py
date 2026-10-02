"""Build source-grounded Snapdragon dossiers without querying or changing SCALE.

Inputs are the locally saved metadata registry/configuration chains and browser
observations. A matching runtime URL proves that route was observed, not which
MAIN_UI_SCREEN variant the application chose or that its operations succeeded.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from collections import Counter, defaultdict
from datetime import datetime, timezone
from pathlib import Path
from urllib.parse import urlsplit


MENU_SECTIONS = {
    "Favorites", "Receiving", "Order Planning", "Shipping", "Cross Application",
    "Inventory", "Work", "Performance Management", "System Management",
}


def read_json(path: Path):
    return json.loads(path.read_text(encoding="utf-8-sig"))


def unique(values):
    return list(dict.fromkeys(str(value).strip() for value in values if value is not None and str(value).strip()))


def cell(value):
    if value is None or value == "":
        return "Not populated"
    return str(value).replace("|", "\\|").replace("\r", " ").replace("\n", " ")


def canonical_route(value):
    if not value:
        return ""
    parsed = urlsplit(str(value))
    path = parsed.path or "/"
    normalized = path.rstrip("/").casefold() or "/"
    host = parsed.netloc.casefold() if parsed.hostname and parsed.hostname.casefold() != "trav.manhscale.com" else ""
    return host + normalized + ("?" + parsed.query if parsed.query else "")


def label_list(items, field="label", visible_only=False):
    result = []
    for item in items or []:
        if isinstance(item, str):
            result.append(item)
        elif isinstance(item, dict):
            if visible_only and item.get("rendered") is False:
                continue
            result.append(item.get(field) or item.get("name") or item.get("text") or "")
    return unique(result)


def field_list(items):
    result = []
    for item in items or []:
        if isinstance(item, str):
            result.append(item)
        elif isinstance(item, dict) and item.get("rendered") is not False:
            value = item.get("placeholder") or item.get("id") or item.get("label")
            if value and str(value).strip() != "Search":
                result.append(value)
    return unique(result)


def load_runtime(base: Path):
    by_route = defaultdict(list)
    sources = []
    for path in sorted((base / "evidence").glob("runtime-*.json")):
        document = read_json(path)
        rows = document if isinstance(document, list) else document.get("observations", document.get("routes", []))
        sources.append({"name": path.name, "sha256": hashlib.sha256(path.read_bytes()).hexdigest(), "observations": len(rows)})
        for row in rows:
            structure = row.get("structure", {})
            requested = row.get("path") or row.get("url") or row.get("actual_url")
            actual = row.get("actual_url") or row.get("url") or requested
            if not requested:
                continue
            actions = structure.get("actions", row.get("actions", row.get("controls", [])))
            if "controls" in row:
                actions = [control for control in actions if re.match(
                    r"^(ListPaneMenu|ListPaneAction|MenuAction(?!sDropdown)|PackingAction(?!sDropdown)|QCWorkbenchAction|CloseContainerAction)",
                    control.get("id", ""))]
            record = {
                "source": path.name,
                "name": row.get("screen") or row.get("name") or row.get("label"),
                "title": row.get("title") or structure.get("title"),
                "requested_path": requested,
                "actual_url": actual,
                "observed_at": row.get("observed_at"),
                "status": row.get("status", "loaded" if row.get("title") else "observation_only"),
                "phase": row.get("phase") or row.get("scope") or "runtime_inspection",
                "fields": field_list(structure.get("fields", row.get("fields", []))),
                "headers": label_list(structure.get("headers", row.get("headers", [])), visible_only=True),
                "actions": label_list(actions, visible_only=True),
                "tabs": [label for label in label_list(structure.get("tabs", row.get("tabs", []))) if label not in MENU_SECTIONS],
                "error": row.get("access_message") or row.get("error") or "; ".join(row.get("alerts", [])),
                "notes": row.get("notes") or row.get("limitations") or "",
            }
            by_route[canonical_route(requested)].append(record)
    return by_route, sources


def runtime_status(records, shared_entry=False):
    loaded = [row for row in records if row["status"] == "loaded"]
    if loaded:
        if shared_entry:
            return "Shared application entry observed; individual function unverified"
        return "Runtime route observed; Screen variant unconfirmed"
    if records:
        return "Runtime attempted; error or unresolved result"
    return "Metadata only; runtime not observed"


def load_form_audit(base: Path):
    path = base / "evidence" / "config-form-navigation.json"
    if not path.exists():
        return {}, None
    document = read_json(path)
    rows = document.get("results", [])
    by_form = {str(row["form_id"]): row for row in rows}
    if len(by_form) != len(rows):
        raise SystemExit("Form-configuration audit contains duplicate Form IDs.")
    source = {
        "name": path.name, "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
        "observations": len(rows), "denominator": document.get("denominator"),
        "scope": document.get("scope"),
    }
    return by_form, source


def form_audit_status(record):
    if not record:
        return "No Form-configuration browser observation"
    if record.get("status") == "loaded_matching_form":
        return "Form Properties and Screens grid inspected"
    return "Form-configuration attempt: " + str(record.get("status", "unresolved"))


def load_interactions(base: Path):
    path = base / "database" / "screen-interaction-map.json"
    if not path.exists():
        return {}, None
    rows = read_json(path)
    controls = {str(row["screen_control_id"]) for row in rows}
    if len(controls) != len(rows):
        raise SystemExit("Interaction map contains duplicate Control IDs.")
    by_screen = defaultdict(list)
    for row in rows:
        by_screen[str(row["main_ui_screen_id"])].append(row)
    return by_screen, {
        "name": path.name, "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
        "observations": len(rows),
    }


def load_safe_dependencies(base: Path, interactions_by_screen):
    path = base / "database" / "safe-dependency-tokens.json"
    if not path.exists():
        return {}, None
    rows = read_json(path)
    source_records = {}
    for controls in interactions_by_screen.values():
        for control in controls:
            for attribute in control.get("attributes", []):
                source_records[("SCREEN_CONTROL_ATTRIBUTES", str(attribute["OBJECT_ID"]))] = (control, None, attribute)
            for event in control.get("events", []):
                for parameter in event.get("parameters", []):
                    source_records[("SCREEN_CONTROL_EVENT_PARAMETERS", str(parameter["OBJECT_ID"]))] = (control, event, parameter)
    seen = set()
    by_screen = defaultdict(list)
    for row in rows:
        key = (row["source_table"], str(row["object_id"]))
        if key in seen or key not in source_records:
            raise SystemExit(f"Duplicate or unknown dependency source object: {key}")
        seen.add(key)
        control, event, original = source_records[key]
        for field in ["form_id", "main_ui_screen_id", "screen_control_id"]:
            if str(row[field]) != str(control[field]):
                raise SystemExit(f"Dependency {field} association mismatch: {key}")
        expected_event = str(event["OBJECT_ID"]) if event else None
        actual_event = str(row["screen_control_event_id"]) if row.get("screen_control_event_id") is not None else None
        name_field = "PARAMETER_NAME" if event else "ATTRIBUTE_NAME"
        value_prefix = "parameter" if event else "attribute"
        if actual_event != expected_event or row["configuration_name"] != original[name_field]:
            raise SystemExit(f"Dependency event or configuration-name association mismatch: {key}")
        if row.get("active") != original.get("ACTIVE") or row.get("system_created") != original.get("SYSTEM_CREATED"):
            raise SystemExit(f"Dependency source flags mismatch: {key}")
        if row.get("value_bytes_utf16le") != original.get(f"{value_prefix}_value_bytes") or row.get("value_sha256_utf16le") != original.get(f"{value_prefix}_value_sha256_utf16le"):
            raise SystemExit(f"Dependency fingerprint mismatch: {key}")
        if row.get("accepted") is True:
            value = row.get("safe_value")
            if not isinstance(value, str) or not value:
                raise SystemExit(f"Accepted dependency lacks a string token: {key}")
            encoded = value.encode("utf-16le")
            if len(encoded) != row["value_bytes_utf16le"] or hashlib.sha256(encoded).hexdigest().upper() != row["value_sha256_utf16le"]:
                raise SystemExit(f"Accepted dependency token differs from fingerprint: {key}")
        elif row.get("accepted") is not False or row.get("safe_value") is not None:
            raise SystemExit(f"Omitted dependency contains an unexpected value: {key}")
        by_screen[str(row["main_ui_screen_id"])].append(row)
    return by_screen, {
        "name": path.name, "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
        "observations": len(rows), "accepted": sum(row["accepted"] for row in rows),
        "omitted": sum(not row["accepted"] for row in rows),
    }


def flattened(chain):
    parts = chain.get("parts", [])
    groups = [group for part in parts for group in part.get("groups", [])]
    controls = [control for group in groups for control in group.get("controls", [])]
    columns = [column for control in controls for column in control.get("grid_columns", [])]
    return parts, groups, controls, columns


def config_description(registry, parts, groups, controls, columns):
    label = registry.get("label") or registry.get("form_key") or "Unlabeled form"
    category = registry.get("route_category", "unknown")
    parts_by_name = {part.get("PART_NAME") for part in parts}
    sentences = [
        f"{label} is recorded as `{category}`. Its saved configuration contains "
        f"{len(parts)} parts, {len(groups)} groups, {len(controls)} controls, and {len(columns)} grid-column records."
    ]
    if {"InsightMenuPane", "SearchPane", "ListPane", "DetailPane"}.issubset(parts_by_name):
        sentences.append("The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.")
    elif parts:
        sentences.append("This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.")
    else:
        sentences.append("No child configuration records were associated in this extraction. This may be an application-owned, legacy, inactive, or unresolved entry; it does not establish that the function has no implementation.")
    if registry.get("active") != "Y":
        sentences.append("The main UI Screen record is inactive in the saved metadata; it is preserved for completeness and is not counted as a confirmed active runtime screen.")
    if category in {"record_detail_template", "transaction_context"}:
        sentences.append("This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.")
    if category in {"legacy_or_unresolved", "legacy_rf"}:
        sentences.append("Treat the legacy/unresolved classification explicitly; do not manufacture a modern Insight route from the Form ID.")
    return " ".join(sentences)


def build_dossier(registry, chain, runtime_records, shared_entry=False, form_audit=None, interactions=None, dependencies=None):
    form_id, screen_id = registry["form_id"], registry["main_ui_screen_id"]
    label = registry.get("label") or registry.get("form_key") or "Unlabeled"
    parts, groups, controls, columns = flattened(chain)
    lines = [
        f"# {label} — Form {form_id}, Screen {screen_id}", "",
        "Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.", "",
        f"**Runtime evidence:** {runtime_status(runtime_records, shared_entry)}. A configured row, a working route, and a tested business function are different claims.", "",
        f"**Form configuration evidence:** {form_audit_status(form_audit)}. This is tracked separately from runtime navigation.", "",
        "[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)", "",
        "## Identity and navigation", "", "| Property | Saved value |", "|---|---|",
    ]
    identity = [
        ("Form ID", form_id), ("MAIN_UI_SCREEN Object ID", screen_id),
        ("Label / Form resource key", f"{label} / {registry.get('form_key')}"),
        ("Functional area code", registry.get("functional_area_code")),
        ("Active / System created / Show in application menu", f"{registry.get('active')} / {registry.get('system_created')} / {registry.get('show_in_app_menu')}"),
        ("Route category / path type code", f"{registry.get('route_category')} / {registry.get('path_type')}"),
        ("Configured path", registry.get("configured_path")),
        ("Candidate runtime URL", registry.get("candidate_url")),
        ("Form configuration entry", registry.get("form_configuration_url")),
        ("Inspection requirement", registry.get("inspection_requirement")),
        ("Form configuration table/view", registry.get("configuration_table_or_view")),
        ("Help page reference", registry.get("help_page_reference")),
    ]
    lines += [f"| {key} | {cell(value)} |" for key, value in identity]
    lines += ["", "The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.", "",
              "## Form configuration browser evidence", ""]
    if form_audit:
        observed_ids = form_audit.get("observed_main_ui_screen_ids", [])
        form_values = [
            ("Result", form_audit.get("status")),
            ("Requested Form configuration URL", form_audit.get("requested_url")),
            ("Inspection time (UTC)", form_audit.get("finished_at") or form_audit.get("started_at")),
            ("Form heading matches / resource key matches", f"{form_audit.get('form_heading_matches')} / {form_audit.get('form_key_matches')}"),
            ("Observed Form resource key", form_audit.get("observed_form_key")),
            ("Observed configured table/view", form_audit.get("observed_table_name")),
            ("Screens grid loaded / record count", f"{form_audit.get('screen_grid_loaded')} / {form_audit.get('grid_record_count')}"),
            ("Screen IDs exposed as links in observed grid", ", ".join(map(str, observed_ids)) or "No Screen ID links captured"),
            ("This dossier Screen ID present in observed links", str(screen_id) in {str(value) for value in observed_ids}),
            ("Mutations performed", form_audit.get("mutations_performed")),
        ]
        lines += ["| Observation | Value |", "|---|---|"]
        lines += [f"| {key} | {cell(value)} |" for key, value in form_values]
        lines += ["", "Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed."]
    else:
        lines += ["No observation for this Form ID appears in the loaded Form-configuration audit. The audit denominator covers unique Forms with active Screen records; inactive-only Forms remain mapped from replica metadata."]
    lines += ["", "## Runtime evidence", ""]
    if runtime_records:
        if shared_entry:
            lines += ["Multiple distinct Forms share this application-entry path. The observation belongs to that shared entry; it does not show that this individual mobile/application function was opened.", ""]
        lines += ["| Time (UTC) | Result / state | Actual URL / title | Evidence |", "|---|---|---|---|"]
        for row in runtime_records:
            lines.append(f"| {cell(row['observed_at'])} | {cell(row['status'])}; {cell(row['phase'])} | {cell(row['actual_url'])}; {cell(row['title'] or row['name'])} | [{row['source']}](../../evidence/{row['source']}) |")
        for name, key in [("Visible criteria / entry fields", "fields"), ("Visible grid headers", "headers"), ("Observed action/menu labels", "actions"), ("Page groups", "tabs")]:
            values = unique(value for row in runtime_records for value in row[key])
            if values:
                lines += ["", f"**{name}:** {cell('; '.join(values))}."]
        errors = unique(row["error"] for row in runtime_records)
        notes = unique(row["notes"] for row in runtime_records)
        if errors:
            lines += ["", "**Recorded error/result:** " + cell("; ".join(errors))]
        if notes:
            lines += ["", "**Observation limits:** " + cell("; ".join(notes))]
        lines += ["", "These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects."]
    else:
        lines += ["No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible."]
    lines += ["", "## Configurable architecture", "", config_description(registry, parts, groups, controls, columns), "",
              "English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.", ""]
    if parts:
        lines += ["### Screen parts", "", "| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |", "|---|---|---|---|---|"]
        for part in parts:
            lines.append(f"| {part['OBJECT_ID']} / {cell(part.get('PART_NAME'))} | {cell(part.get('label'))} / {cell(part.get('RESOURCE_KEY'))} | {cell(part.get('PART_TYPE'))} / {cell(part.get('SEQUENCE'))} | {cell(part.get('ACTIVE'))} / {cell(part.get('SYSTEM_CREATED'))} / {cell(part.get('PARTIAL_VIEW'))} | {cell(part.get('DEFAULT_ACTION'))} |")
        for part in parts:
            lines += ["", f"### Part {part['OBJECT_ID']}: {part.get('PART_NAME')}", ""]
            part_groups = part.get("groups", [])
            if not part_groups:
                lines += ["No groups associated in the saved extraction."]
                continue
            lines += ["| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |", "|---|---|---|---|---|---|"]
            for group in part_groups:
                flags = f"Fixed to top={group.get('FIXED_TO_TOP')}; loading={group.get('CONTENT_LOADING_TYPE')}; nested unit={group.get('NESTED_GROUP_UNIT')}; default={group.get('DEFAULT_ACTION')}"
                lines.append(f"| {group['OBJECT_ID']} / {cell(group.get('GROUP_NAME'))} | {cell(group.get('PARENT_GROUP_ID'))} | {cell(group.get('label'))} / {cell(group.get('RESOURCE_KEY'))} | {cell(group.get('GROUP_TYPE'))} / {cell(group.get('SEQUENCE'))} | {cell(group.get('ACTIVE'))} / {cell(group.get('SYSTEM_CREATED'))} | {cell(flags)} |")
            for group in part_groups:
                group_controls = group.get("controls", [])
                if not group_controls:
                    continue
                lines += ["", f"#### Group {group['OBJECT_ID']}: {group.get('GROUP_NAME')} — controls", "",
                          "| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |", "|---|---|---|---|---|"]
                for control in group_controls:
                    flags = "; ".join(f"{key}={control.get(key)}" for key in ["DATA_SOURCE_TYPE", "DEFAULT_STATE", "DEFAULT_ACTION", "LABEL_ORIENTATION", "SCREEN_GROUP_COLUMN_ID", "TEMPLATE_NAME", "TOOL_TIP_RESOURCE_KEY"])
                    lines.append(f"| {control['OBJECT_ID']} / {cell(control.get('CONTROL_NAME'))} | {cell(control.get('label'))} / {cell(control.get('RESOURCE_KEY'))} | {cell(control.get('CONTROL_TYPE'))} / {cell(control.get('SEQUENCE'))} | {cell(control.get('ACTIVE'))} / {cell(control.get('SYSTEM_CREATED'))} | {cell(flags)} |")
                for control in group_controls:
                    grid_columns = control.get("grid_columns", [])
                    if not grid_columns:
                        continue
                    lines += ["", f"Grid columns for control {control['OBJECT_ID']} `{control.get('CONTROL_NAME')}`:", "",
                              "| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |", "|---|---|---|---|---|"]
                    for column in grid_columns:
                        flags = "; ".join(f"{key}={column.get(key)}" for key in ["IS_PRIMARY_KEY", "IS_EDITABLE", "REQUIRED_FOR_EDIT", "ALLOW_SORT", "DECIMAL_POSITIONS", "DATA_SOURCE_TYPE"])
                        lines.append(f"| {column['OBJECT_ID']} / {cell(column.get('FIELD_NAME'))} | {cell(column.get('FIELD'))} / {cell(column.get('label'))} / {cell(column.get('RESOURCE_KEY'))} | {cell(column.get('FIELD_TYPE'))} / {cell(column.get('SQL_CLAUSE_TYPE'))} / {cell(column.get('SEQUENCE'))} / {cell(column.get('FIELD_WIDTH'))} | {cell(column.get('ACTIVE'))} / {cell(column.get('SYSTEM_CREATED'))} / {cell(column.get('HIDDEN'))} | {cell(flags)} |")
    lines += ["", "## Control attributes and event bindings", ""]
    if interactions is not None:
        attributes = [(row, attribute) for row in interactions for attribute in row.get("attributes", [])]
        events = [(row, event) for row in interactions for event in row.get("events", [])]
        parameters = [(event, parameter) for _, event in events for parameter in event.get("parameters", [])]
        lines += [f"The [interaction map](../../database/screen-interaction-map.json) associates {len(attributes)} control attributes, {len(events)} events, and {len(parameters)} event parameters with this Screen. These are configured relationships, not observed invocations.", "",
                  "Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.", ""]
        if attributes:
            lines += ["### Configured control attributes", "", "| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |", "|---:|---|---|---|---|"]
            for control, attribute in attributes:
                lines.append(f"| {attribute['OBJECT_ID']} | {control['screen_control_id']} / {cell(control.get('control_name'))} | {cell(attribute.get('ATTRIBUTE_NAME'))} | {cell(attribute.get('ACTIVE'))} / {cell(attribute.get('SYSTEM_CREATED'))} / {cell(attribute.get('IS_CONTROL_PROPERTY'))} | {cell(attribute.get('attribute_value_bytes'))} / {cell(attribute.get('token_slots_non_null'))} |")
        if events:
            lines += ["", "### Configured events", "", "| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |", "|---|---|---|---|---|"]
            for control, event in events:
                lines.append(f"| {event['OBJECT_ID']} / {cell(event.get('EVENT_ID'))} | {control['screen_control_id']} / {cell(control.get('control_name'))} | {cell(event.get('EVENT_NAME'))} | {cell(event.get('GRID_COLUMN'))} | {cell(event.get('ACTIVE'))} / {cell(event.get('SYSTEM_CREATED'))} |")
        if parameters:
            lines += ["", "### Configured event parameters", "", "| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |", "|---|---|---|---:|"]
            for event, parameter in parameters:
                lines.append(f"| {parameter['OBJECT_ID']} / {event['OBJECT_ID']} | {cell(parameter.get('PARAMETER_NAME'))} | {cell(parameter.get('ACTIVE'))} / {cell(parameter.get('SYSTEM_CREATED'))} | {cell(parameter.get('parameter_value_bytes'))} |")
        if not attributes and not events:
            lines += ["No control attributes or events were associated with this Screen in the extracted interaction map. Application-owned or inherited behavior remains possible."]
    else:
        lines += ["No interaction-map input was available for generation; control attributes, events, and parameters remain unmapped here."]
    if str(form_id) == "2796" and str(screen_id) == "1776":
        lines += ["", "The [Purchase Order configuration walkthrough](../purchase-order-configuration.md) provides a separately verified browser trace for Close control 51621, including its attribute and five actual parameter values. That one-action trace does not establish the behavior of every control on this Screen."]
    lines += ["", "## Selected dependency tokens", ""]
    if dependencies is not None:
        accepted = [row for row in dependencies if row["accepted"] is True]
        omitted_count = len(dependencies) - len(accepted)
        lines += [f"The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains {len(dependencies)} selected candidate rows for this Screen: **{len(accepted)} accepted tokens** and **{omitted_count} omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.", "",
                  "This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.", ""]
        if accepted:
            lines += ["| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |", "|---|---|---|---|---|---|"]
            for row in accepted:
                event_id = row.get("screen_control_event_id")
                lines.append(f"| {cell(row['source_table'])} / {row['object_id']} | {row['screen_control_id']} / {event_id if event_id is not None else 'Not applicable'} | {cell(row['configuration_name'])} | {cell(row['token_kind'])} | {cell(row['safe_value'])} | {cell(row['active'])} / {cell(row['system_created'])} |")
        else:
            lines += ["No accepted dependency token is associated with this Screen in the selected supplement."]
    else:
        lines += ["No safe dependency supplement was available for generation."]
    lines += ["", "## Remaining verification", "",
              "- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.",
              "- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.",
              "- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.",
              "- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.",
              "- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.", ""]
    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--base", type=Path, default=Path(__file__).resolve().parents[1])
    args = parser.parse_args()
    base = args.base.resolve()
    registry_path = base / "inventory" / "screen-registry.json"
    chain_path = base / "database" / "screen-configuration-chains.json"
    registry = read_json(registry_path)
    chains = read_json(chain_path)
    chain_by_id = {str(row["main_ui_screen_id"]): row for row in chains}
    ids = [str(row["main_ui_screen_id"]) for row in registry]
    if len(set(ids)) != len(ids) or set(ids) != set(chain_by_id):
        raise SystemExit("Registry and chains must have the same unique Screen IDs.")
    runtime_by_route, evidence_sources = load_runtime(base)
    form_audit_by_id, form_audit_source = load_form_audit(base)
    interactions_by_screen, interaction_source = load_interactions(base)
    dependencies_by_screen, dependency_source = load_safe_dependencies(base, interactions_by_screen)
    forms_by_route = defaultdict(set)
    for row in registry:
        route = canonical_route(row.get("configured_path") or row.get("candidate_url"))
        if route:
            forms_by_route[route].add(str(row["form_id"]))
    output = base / "screens" / "by-id"
    output.mkdir(parents=True, exist_ok=True)
    index_rows = []
    totals = Counter()
    for row in sorted(registry, key=lambda row: (int(row["form_id"]), int(row["main_ui_screen_id"]))):
        screen_id = str(row["main_ui_screen_id"])
        chain = chain_by_id[screen_id]
        if str(chain["form_id"]) != str(row["form_id"]):
            raise SystemExit(f"Form identity mismatch for Screen {screen_id}")
        parts, groups, controls, columns = flattened(chain)
        for key, found in [("part_count", len(parts)), ("group_count", len(groups)), ("control_count", len(controls)), ("grid_column_count", len(columns))]:
            if row.get(key) != found:
                raise SystemExit(f"{key} mismatch for Screen {screen_id}: registry={row.get(key)}, chain={found}")
        route = canonical_route(row.get("configured_path") or row.get("candidate_url"))
        records = runtime_by_route.get(route, []) if route else []
        shared_entry = len(forms_by_route.get(route, set())) > 1
        filename = f"form-{row['form_id']}_screen-{screen_id}.md"
        form_audit = form_audit_by_id.get(str(row["form_id"]))
        interactions = interactions_by_screen.get(screen_id, []) if interaction_source else None
        if interactions is not None:
            expected_controls = {str(control["OBJECT_ID"]) for control in controls}
            observed_controls = {str(control["screen_control_id"]) for control in interactions}
            if expected_controls != observed_controls or any(str(control["form_id"]) != str(row["form_id"]) for control in interactions):
                raise SystemExit(f"Interaction-map identity mismatch for Screen {screen_id}")
            totals["control_attributes"] += sum(len(control.get("attributes", [])) for control in interactions)
            totals["control_events"] += sum(len(control.get("events", [])) for control in interactions)
            totals["event_parameters"] += sum(len(event.get("parameters", [])) for control in interactions for event in control.get("events", []))
        dependencies = dependencies_by_screen.get(screen_id, []) if dependency_source else None
        if dependencies is not None:
            totals["dependency_candidates"] += len(dependencies)
            totals["accepted_dependency_tokens"] += sum(value["accepted"] for value in dependencies)
            totals["omitted_dependency_values"] += sum(not value["accepted"] for value in dependencies)
        (output / filename).write_text(build_dossier(row, chain, records, shared_entry, form_audit, interactions, dependencies), encoding="utf-8")
        status = runtime_status(records, shared_entry)
        totals[status] += 1
        totals["parts"] += len(parts)
        totals["groups"] += len(groups)
        totals["controls"] += len(controls)
        totals["grid_columns"] += len(columns)
        index_rows.append((row, filename, status, form_audit_status(form_audit)))
    index = ["# Snapdragon screen dossier index", "",
             f"Generated for **{len(registry)} MAIN_UI_SCREEN records** from the saved metadata. Each file identifies its Form ID separately from its Screen object ID. This index includes active, inactive, legacy, and context-dependent records; it is not a count of verified navigable screens.", "",
             "[Registry](../inventory/screen-registry.json) · [Configuration chains](../database/screen-configuration-chains.json) · [Configuration model](../reference/CONFIGURATION_MODEL.md) · [Shipping runtime review](shipping.md)", "",
             "Regenerate after evidence changes: `python Snapdragon/tools/build_screen_dossiers.py`.", "",
             "## Evidence coverage", "", "| Category | Screen records |", "|---|---:|"]
    index += [f"| {label} | {totals[label]} |" for label in ["Runtime route observed; Screen variant unconfirmed", "Shared application entry observed; individual function unverified", "Runtime attempted; error or unresolved result", "Metadata only; runtime not observed"]]
    index += ["", "Matching uses the saved configured path and observed requested route, preserving external hosts and exact nonempty query strings, and ignoring empty trailing question marks, URL fragments, and trailing slashes. Record context and Screen-variant selection still require verification. When distinct Forms share one path, the application-entry observation is explicitly separated from individual-function review.", ""]
    if form_audit_source:
        audit_counts = Counter(form_audit_status(row) for row in form_audit_by_id.values())
        index += ["### Separate Form-configuration audit", "",
                  f"The [Form navigation audit](../evidence/config-form-navigation.json) contains {len(form_audit_by_id)} unique Forms against its stated denominator of {form_audit_source['denominator']}. Scope: {cell(form_audit_source['scope'])}. This is a Form count, not the 254-Screen-record denominator above.", "",
                  "| Form-configuration result | Unique Forms |", "|---|---:|"]
        index += [f"| {cell(status)} | {count} |" for status, count in sorted(audit_counts.items())]
        index += ["", "Opening Form Properties and the Screens grid does not verify the runtime Screen variant or traverse all parts, groups, controls, events, and dialogs. A shared Form observation can appear in more than one Screen dossier.", ""]
    index += ["## Source snapshot", "", "| Input | Records / observations | SHA-256 |", "|---|---:|---|"]
    for path, count in [(registry_path, len(registry)), (chain_path, len(chains))]:
        index.append(f"| {path.name} | {count} | `{hashlib.sha256(path.read_bytes()).hexdigest()}` |")
    for source in evidence_sources:
        index.append(f"| {source['name']} | {source['observations']} | `{source['sha256']}` |")
    if form_audit_source:
        index.append(f"| {form_audit_source['name']} | {form_audit_source['observations']} | `{form_audit_source['sha256']}` |")
    if interaction_source:
        index.append(f"| {interaction_source['name']} | {interaction_source['observations']} | `{interaction_source['sha256']}` |")
    if dependency_source:
        index.append(f"| {dependency_source['name']} | {dependency_source['observations']} | `{dependency_source['sha256']}` |")
    if interaction_source:
        index += ["", f"The dossiers also map {totals['control_attributes']} control attributes, {totals['control_events']} events, and {totals['event_parameters']} event parameters. The original interaction map keeps attribute/parameter values omitted; see the [interaction summary](../database/interaction-map-summary.json) for extraction limits. Runtime execution is unverified."]
    if dependency_source:
        index += ["", f"The separate [safe dependency supplement](../database/safe-dependency-tokens.json) contributes {dependency_source['accepted']} accepted tokens from {dependency_source['observations']} selected candidate rows, with {dependency_source['omitted']} values omitted. Selection uses exact configuration names and strict token grammars. Each accepted token is shown only in its associated Screen dossier; this does not close backend-semantic or runtime verification."]
    index += ["", "## All screen records", "", "| Form ID | Screen ID | Name / dossier | Active | Route category | Configured path | Parts / groups / controls / columns | Runtime evidence | Form configuration evidence |", "|---:|---:|---|---|---|---|---|---|---|"]
    for row, filename, status, audit_status in index_rows:
        counts = " / ".join(str(row[key]) for key in ["part_count", "group_count", "control_count", "grid_column_count"])
        label = row.get("label") or row.get("form_key") or "Unlabeled"
        index.append(f"| {row['form_id']} | {row['main_ui_screen_id']} | [{cell(label)}](by-id/{filename}) | {cell(row.get('active'))} | {cell(row.get('route_category'))} | {cell(row.get('configured_path'))} | {counts} | {status} | {audit_status} |")
    (base / "screens" / "INDEX.md").write_text("\n".join(index) + "\n", encoding="utf-8")
    receipt = {
        "status": "PASS",
        "built_at_utc": datetime.now(timezone.utc).isoformat(),
        "dossiers": len(registry),
        "runtime_input_files": evidence_sources,
        "form_audit_input": form_audit_source,
        "interaction_input": interaction_source,
        "dependency_input": dependency_source,
        "metadata_inputs": [{"name": path.name, "sha256": hashlib.sha256(path.read_bytes()).hexdigest()} for path in [registry_path, chain_path]],
        "totals": dict(totals),
        "checks": [
            "Unique registry and chain Screen IDs match.",
            "Form identity and part/group/control/grid-column counts match for every Screen.",
            "Interaction-map Control IDs and Form identities match every Screen chain.",
            "Form-configuration audit contains unique Form IDs.",
            "Dependency source object, Form, Screen, Control, event, name, flags, and value fingerprints match the interaction map.",
            "Accepted dependency values match their UTF-16LE fingerprints; omitted records retain no payload.",
        ],
        "limits": [
            "PASS means source-to-dossier build consistency, not semantic or runtime completion.",
            "Runtime route matches do not establish selected Screen variant or operational effects.",
            "Shared application entry observations do not establish individual function navigation.",
            "Attribute and parameter values are omitted from the bulk interaction map.",
            "The separate dependency supplement contains selected strict-grammar tokens only; omitted values and unresolved backend semantics remain open.",
        ],
    }
    (base / "evidence" / "dossier-build-receipt.json").write_text(json.dumps(receipt, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(receipt, indent=2))


if __name__ == "__main__":
    main()
