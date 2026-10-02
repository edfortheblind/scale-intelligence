"""Build the bounded SD-11 Receiving map from retained configuration only."""
from collections import Counter, defaultdict
import hashlib
import importlib.util
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
BASE = ROOT / "Snapdragon"
OUT = BASE / "receiving"
spec = importlib.util.spec_from_file_location("dossiers", BASE / "tools/build_screen_dossiers.py")
dossiers = importlib.util.module_from_spec(spec)
spec.loader.exec_module(dossiers)
INPUTS = ["evidence/menu-routes.json", "inventory/screen-registry.json", "database/forms.json",
          "database/screen-configuration-chains.json", "database/screen-interaction-map.json",
          "database/safe-dependency-tokens.json"]


def read(name):
    return dossiers.read_json(BASE / name)


def cell(value):
    return dossiers.cell(value)


def main():
    registry = read("inventory/screen-registry.json")
    forms = {int(r["FORM_ID"]): r for r in read("database/forms.json")}
    menu = [m for m in read("evidence/menu-routes.json")["routes"] if m["section"] == "Receiving"]
    active = [r for r in registry if r["active"] == "Y"]
    roots = []
    for item in menu:
        matches = [r for r in active if r["configured_path"] == item["path"]]
        if len(matches) != 1:
            raise ValueError("Receiving menu path must have exactly one active implementation")
        roots.append(matches[0])
    root_screens = {r["main_ui_screen_id"] for r in roots}
    interaction_by_screen, _ = dossiers.load_interactions(BASE)
    tokens_by_screen, _ = dossiers.load_safe_dependencies(BASE, interaction_by_screen)
    tokens = [t for screen in root_screens for t in tokens_by_screen.get(str(screen), [])]
    references = [t for t in tokens if t["accepted"] and t["token_kind"] == "form_id"]
    target_ids = sorted({int(t["safe_value"]) for t in references})
    related = [r for r in active if r["form_id"] in target_ids and r["main_ui_screen_id"] not in root_screens]
    missing = [fid for fid in target_ids if not any(r["form_id"] == fid for r in active)]
    included = roots + sorted(related, key=lambda r: r["form_id"])
    if (len(roots), len(references), len(target_ids), len(related), missing, len(included)) != (9, 31, 9, 8, [166], 17):
        raise ValueError("Approved SD-11 denominator changed; reclassify before broadening")
    chains = {r["main_ui_screen_id"]: r for r in read("database/screen-configuration-chains.json")}
    dependencies = defaultdict(list)
    screens = []
    for identity in included:
        sid = identity["main_ui_screen_id"]
        interactions = {int(r["screen_control_id"]): r for r in interaction_by_screen[str(sid)]}
        selected_tokens = tokens_by_screen.get(str(sid), [])
        token_lookup = {(t["source_table"], t["object_id"]): t for t in selected_tokens}
        incoming = defaultdict(list)
        for source_control in interactions.values():
            for event in source_control["events"]:
                for parameter in event["parameters"]:
                    if parameter["PARAMETER_NAME"].startswith("EnableAction_"):
                        incoming[parameter["PARAMETER_NAME"][len("EnableAction_"):]].append({
                            "source_control_id": source_control["screen_control_id"], "event_id": int(event["OBJECT_ID"]),
                            "parameter_id": int(parameter["OBJECT_ID"]), "parameter_name": parameter["PARAMETER_NAME"],
                            "predicate_value_state": "not retained; eligibility semantics unproved"})
        parts = []
        controls_flat = []
        for part in chains[sid]["parts"]:
            groups = []
            for group in part["groups"]:
                controls = []
                for control in group["controls"]:
                    cid = int(control["OBJECT_ID"])
                    interaction = interactions[cid]
                    attributes = []
                    for attr in interaction["attributes"]:
                        token = token_lookup.get(("SCREEN_CONTROL_ATTRIBUTES", int(attr["OBJECT_ID"])))
                        attributes.append({**attr, "safe_value": token["safe_value"] if token else None,
                                           "value_state": "accepted_token" if token and token["accepted"] else "omitted_or_not_selected"})
                    events = []
                    for event in interaction["events"]:
                        parameters = []
                        for parameter in event["parameters"]:
                            token = token_lookup.get(("SCREEN_CONTROL_EVENT_PARAMETERS", int(parameter["OBJECT_ID"])))
                            name = parameter["PARAMETER_NAME"]
                            parameters.append({**parameter, "safe_value": token["safe_value"] if token else None,
                                               "value_state": "accepted_token" if token and token["accepted"] else "omitted_or_not_selected",
                                               "binding_class": "grid_field" if "_Grid_" in name else "input_field" if "_Input_" in name else "function_binding" if "_Function_" in name else "enablement_reference" if name.startswith("EnableAction_") else "other_configuration"})
                        events.append({**event, "parameters": parameters})
                    record = {**control, "part_id": int(part["OBJECT_ID"]), "part_name": part["PART_NAME"],
                              "group_id": int(group["OBJECT_ID"]), "group_name": group["GROUP_NAME"],
                              "criterion_surface": "criteria" in group["GROUP_NAME"].lower(),
                              "action_control_surface": control["CONTROL_TYPE"] in ("100", "150"),
                              "attributes": attributes, "events": events,
                              "incoming_enablement_references": incoming[control["CONTROL_NAME"]]}
                    controls.append(record)
                    controls_flat.append(record)
                groups.append({**group, "controls": controls})
            parts.append({**part, "groups": groups})
        for token in selected_tokens:
            if token["accepted"] and (token["configuration_name"] == "data-dbtable" or token["token_kind"] in ("stored_procedure_identifier", "relative_api_path")):
                kind = "configured_table_identifier" if token["configuration_name"] == "data-dbtable" else token["token_kind"]
                dependencies[(kind, token["safe_value"])].append({k: token[k] for k in ("source_table", "object_id", "form_id", "main_ui_screen_id", "screen_control_id", "screen_control_event_id", "configuration_name")})
        form = forms[identity["form_id"]]
        if form["TABLE_NAME"]:
            dependencies[("form_table_or_data_source_name", form["TABLE_NAME"])].append({"source_table": "FORM", "form_id": identity["form_id"], "main_ui_screen_id": sid, "source_field": "TABLE_NAME"})
        counts = {"parts": len(parts), "groups": sum(len(p["groups"]) for p in parts), "controls": len(controls_flat),
                  "criterion_controls": sum(c["criterion_surface"] for c in controls_flat),
                  "action_controls_type_100_150": sum(c["action_control_surface"] for c in controls_flat),
                  "controls_with_events": sum(bool(c["events"]) for c in controls_flat),
                  "events": sum(len(c["events"]) for c in controls_flat),
                  "parameters": sum(len(e["parameters"]) for c in controls_flat for e in c["events"]),
                  "grid_columns": sum(len(c["grid_columns"]) for c in controls_flat),
                  "accepted_dependency_tokens": sum(t["accepted"] for t in selected_tokens),
                  "omitted_selected_dependency_tokens": sum(not t["accepted"] for t in selected_tokens)}
        screens.append({"identity": identity, "scope_role": "receiving_menu_root" if sid in root_screens else "direct_linked_context",
                        "form_metadata": form, "counts": counts, "parts": parts,
                        "review_state": "retained_configuration_mapped; runtime semantics unproved",
                        "gaps": ["No new selected-record runtime observation or action execution.",
                                 "Data source bodies, arbitrary parameter/attribute values and enablement predicates remain omitted.",
                                 "CONTROL_TYPE/DATA_SOURCE_TYPE/DEFAULT_STATE codes are retained without inventing enum semantics.",
                                 "Configured criteria do not establish every runtime operand, validation, required field or default."]})
    by_control = {int(c["OBJECT_ID"]): c for s in screens for p in s["parts"] for g in p["groups"] for c in g["controls"]}
    links = [{**t, "source_control_name": by_control[t["screen_control_id"]]["CONTROL_NAME"],
              "source_control_label": by_control[t["screen_control_id"]]["label"], "target_form_id": int(t["safe_value"]),
              "target_form_key": forms[int(t["safe_value"])]["FORM_KEY_NAME"],
              "active_target_screen_ids": [r["main_ui_screen_id"] for r in active if r["form_id"] == int(t["safe_value"])],
              "interpretation": "configured form association; not proof of route traversal or selected-record eligibility"} for t in references]
    totals = {key: sum(s["counts"][key] for s in screens) for key in screens[0]["counts"]}
    document = {"schema_version": 1, "task": "SD-11", "base_revision": "af82af76", "method": "retained metadata only; no DB refresh or browser work",
                "scope": {"menu_roots": len(roots), "direct_form_reference_rows": len(references), "direct_target_forms": len(target_ids),
                          "mapped_screen_implementations": len(screens), "form_identities": len({r["form_id"] for r in roots} | set(target_ids)),
                          "root_form_ids": [r["form_id"] for r in roots], "direct_target_form_ids": target_ids,
                          "unresolved_form_only_targets": [forms[fid] for fid in missing], "traversal_depth": "one hop from nine Receiving roots; no recursive expansion"},
                "denominator_rules": {"criteria": "all controls in groups whose recorded GROUP_NAME contains Criteria; other input controls remain in complete tree",
                                      "action_surface": "CONTROL_TYPE 100/150 inventory index; complete event graph retained for all other controls too",
                                      "detail": "all configured parts/groups/controls of direct linked active context implementations, plus root DetailPane structures",
                                      "required_context": "parameter binding names/selected safe tokens are documented; mandatory-value/validation semantics are not established"},
                "source_fingerprints": [{"path": "Snapdragon/" + name, "bytes": (BASE / name).stat().st_size, "sha256": hashlib.sha256((BASE / name).read_bytes()).hexdigest()} for name in INPUTS],
                "totals": totals, "form_associations": links, "screens": screens,
                "named_dependencies": [{"kind": kind, "name": name, "references": refs} for (kind, name), refs in sorted(dependencies.items())],
                "limitations": ["Metadata completeness is not SD-11 functional completion or acceptance.",
                                "Form 166 (UI_RECVAPPTSCHEDULE) is referenced but has no active MAIN_UI_SCREEN in the retained inventory; it is not silently substituted with 2765.",
                                "data-formId associations do not expose all URL/modal target values; hash-only target parameters may imply additional links not proven here.",
                                "Controls/actions may be hidden, disabled, role-specific, warehouse-specific or dependent on record status.",
                                "Services/procedures/checkpoints are configured references; no service execution, permission test or business effect is proved."]}
    OUT.mkdir(exist_ok=True)
    (OUT / "configuration-map.json").write_text(json.dumps(document, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    write_markdown(document)
    print(json.dumps({"scope": document["scope"], "totals": totals, "named_dependency_entries": len(dependencies)}))


def write_markdown(document):
    lines = ["# Receiving configuration map — SD-11", "", "This map explains the retained configuration behind nine visible Receiving destinations and their directly declared context forms. It adds no live runtime observation, database refresh, operational action or acceptance.", "",
             "The fixed scope is **9 menu roots**, **31 explicit data-formId references**, **9 unique target forms**, **17 active screen implementations**, and **18 form identities**. Eight targets have active screen metadata; **form 166 has none**. Expansion stops after this first hop. Other target values remain hash-only and may identify additional branches; they are not silently counted as resolved.", "",
             "[The machine-readable map](configuration-map.json) preserves every included part, group, control, grid column, attribute/event/parameter identity, safe selected value, parent relationship and six source-file hashes. Null safe values mean omitted or not selected, never an empty runtime requirement.", "",
             "## Implementation inventory", "", "| Role | Form / screen | Title | Controls | Criteria controls | Action controls | Events / parameters |", "|---|---|---|---:|---:|---:|---|"]
    for screen in document["screens"]:
        r, n = screen["identity"], screen["counts"]
        lines.append(f"| {screen['scope_role']} | {r['form_id']} / {r['main_ui_screen_id']} | {cell(r['label'])} | {n['controls']} | {n['criterion_controls']} | {n['action_controls_type_100_150']} | {n['events']} / {n['parameters']} |")
    lines += ["", "Criteria counts index groups named Criteria. Action-control counts index recorded control types 100/150; they do not exclude the event bindings of other controls, which remain in the complete map. Numeric enum codes are preserved without inventing a runtime meaning.", "", "## Direct form associations", "", "| Source form | Control ID / name | Attribute ID | Target form | Active target screen |", "|---|---|---|---|---|"]
    for link in document["form_associations"]:
        lines.append(f"| {link['form_id']} | {link['screen_control_id']} / {cell(link['source_control_name'])} | {link['object_id']} | {link['target_form_id']} | {', '.join(map(str,link['active_target_screen_ids'])) or 'Unresolved: no active implementation'} |")
    lines += ["", "Form 166 is `UI_RECVAPPTSCHEDULE`; form 2765 is a separate captured identity. An apparent functional relationship does not authorize replacing one ID with the other. A data-formId association is a configuration dependency, not proof that the user traversed the destination or supplied valid context."]
    for screen in document["screens"]:
        r = screen["identity"]
        lines += ["", f"## {r['label']} — form {r['form_id']}, screen {r['main_ui_screen_id']}", "", f"Configured route: `{r['configured_path']}`. Form table/data-source name: `{screen['form_metadata']['TABLE_NAME'] or 'not populated'}`. These names are references; separate backend evidence must resolve what they mean.", "", "Configured structure:"]
        for part in screen["parts"]:
            lines.append(f"- Part {part['OBJECT_ID']} `{part['PART_NAME']}`: " + "; ".join(f"group {g['OBJECT_ID']} `{g['GROUP_NAME']}` ({len(g['controls'])} controls)" for g in part["groups"]) + ".")
        controls = [c for p in screen["parts"] for g in p["groups"] for c in g["controls"]]
        criteria = [c for c in controls if c["criterion_surface"]]
        if criteria:
            lines += ["", "Configured criteria:", "", "| Control | Label / name | Database field tokens | Type / data-source type |", "|---|---|---|---|"]
            for c in criteria:
                bindings = [a["safe_value"] for a in c["attributes"] if a["ATTRIBUTE_NAME"] in ("data-dbtable", "data-dbcolumn") and a["safe_value"] is not None]
                lines.append(f"| {c['OBJECT_ID']} | {cell(c['label'] or c['CONTROL_NAME'])} | {cell(', '.join(bindings))} | {c['CONTROL_TYPE']} / {c['DATA_SOURCE_TYPE']} |")
        lines += ["", "Configured action-control bindings:", "", "| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |", "|---|---|---|---|---|"]
        for c in controls:
            if not c["action_control_surface"]:
                continue
            checkpoints = [a["safe_value"] for a in c["attributes"] if a["ATTRIBUTE_NAME"] == "data-securityCheckpoint" and a["safe_value"] is not None]
            context = [f"form={a['safe_value']} (attribute {a['OBJECT_ID']})" for a in c["attributes"] if a["ATTRIBUTE_NAME"] == "data-formId" and a["safe_value"] is not None]
            services = []
            handlers = []
            for event in c["events"]:
                handlers.append(f"{event['OBJECT_ID']} {event['EVENT_ID']} → {event['EVENT_NAME'] or '[handler omitted]'}")
                for p in event["parameters"]:
                    if p["binding_class"] in ("grid_field", "input_field", "function_binding"):
                        context.append(f"{p['PARAMETER_NAME']}={p['safe_value'] or '[value omitted]'} (parameter {p['OBJECT_ID']})")
                    if p["safe_value"] and ("ServiceURL" in p["PARAMETER_NAME"] or p["PARAMETER_NAME"] == "PostData_storedProcedure"):
                        services.append(f"{p['safe_value']} (parameter {p['OBJECT_ID']})")
            lines.append(f"| {c['OBJECT_ID']} / {cell(c['label'] or c['CONTROL_NAME'])} | {cell('; '.join(handlers))} | {cell(', '.join(checkpoints))} | {cell('; '.join(context))} | {cell('; '.join(services))} |")
        incoming = sum(len(c["incoming_enablement_references"]) for c in controls)
        lines += ["", f"There are {incoming} incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.", "", "Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact."]
    lines += ["", "## Dependency and verification boundaries", "", "The JSON `named_dependencies` array binds every selected table/data-source, procedure and API reference to its exact source row and owning screen/control. Backend object semantics belong in the separately authored backend mapping. Source hashes identify the retained snapshot, not current deployment freshness.", "", "The generator uses only local JSON and standard-library processing, reusing the existing dossier loader's dependency provenance checks. It refuses changes to the approved denominator. It performs no connection, browser action, configuration write, print, export or transaction.", "", "Rebuild: `python Snapdragon/tools/build_receiving_map.py`. Map generation covers 17/17 included implementations; full functional review/acceptance is a separate criterion and is not awarded here."]
    (OUT / "CONFIGURATION.md").write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
