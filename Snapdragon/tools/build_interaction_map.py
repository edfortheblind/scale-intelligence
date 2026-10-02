"""Connect captured attributes/events/parameters to controls, groups, screens and forms."""
from collections import Counter, defaultdict
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DB = ROOT / "Snapdragon/database"


def read(name):
    return json.loads((DB / (name + ".json")).read_text(encoding="utf-8"))


def write(name, value):
    (DB / (name + ".json")).write_text(json.dumps(value, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def main():
    screens = {r["OBJECT_ID"]: r for r in read("main_ui_screens")}
    parts = {r["OBJECT_ID"]: r for r in read("screen_parts")}
    groups = {r["OBJECT_ID"]: r for r in read("screen_groups")}
    controls = {r["OBJECT_ID"]: r for r in read("screen_controls")}
    events = {r["OBJECT_ID"]: r for r in read("control_events")}
    parameters = read("event_parameters")
    attributes = read("control_attributes")
    columns = read("group_columns")
    params_by_event = defaultdict(list)
    events_by_control = defaultdict(list)
    attrs_by_control = defaultdict(list)
    problems = []
    for param in parameters:
        params_by_event[param["SCREEN_CONTROL_EVENT_ID"]].append(param)
        if param["SCREEN_CONTROL_EVENT_ID"] not in events:
            problems.append("event parameter orphan " + param["OBJECT_ID"])
    for event in events.values():
        events_by_control[event["SCREEN_CONTROL_ID"]].append(event)
        if event["SCREEN_CONTROL_ID"] not in controls:
            problems.append("event orphan " + event["OBJECT_ID"])
    for attr in attributes:
        attrs_by_control[attr["SCREEN_CONTROL_ID"]].append(attr)
        if attr["SCREEN_CONTROL_ID"] not in controls:
            problems.append("attribute orphan " + attr["OBJECT_ID"])
    for col in columns:
        if col["SCREEN_GROUP_ID"] not in groups:
            problems.append("group column orphan " + col["OBJECT_ID"])
    rows = []
    for control_id, control in controls.items():
        group = groups[control["SCREEN_GROUP_ID"]]
        part = parts[group["SCREEN_PART_ID"]]
        screen = screens[part["SCREEN_ID"]]
        rows.append({"form_id": int(screen["FORM_ID"]), "main_ui_screen_id": int(screen["OBJECT_ID"]),
                     "screen_part_id": int(part["OBJECT_ID"]), "screen_group_id": int(group["OBJECT_ID"]),
                     "screen_control_id": int(control_id), "control_name": control["CONTROL_NAME"],
                     "control_active": control["ACTIVE"], "control_system_created": control["SYSTEM_CREATED"],
                     "attributes": attrs_by_control[control_id],
                     "events": [{**event, "parameters": params_by_event[event["OBJECT_ID"]]} for event in events_by_control[control_id]]})
    write("screen-interaction-map", rows)
    summary = {"status": "PASS" if not problems else "FAIL", "screens": len(screens), "controls": len(controls),
               "group_columns": len(columns), "control_attributes": len(attributes), "control_events": len(events),
               "event_parameters": len(parameters), "controls_with_attributes": len({r["SCREEN_CONTROL_ID"] for r in attributes}),
               "controls_with_events": len({r["SCREEN_CONTROL_ID"] for r in events.values()}),
               "events_with_parameters": len({r["SCREEN_CONTROL_EVENT_ID"] for r in parameters}),
               "attribute_names": dict(Counter(r["ATTRIBUTE_NAME"] for r in attributes)),
               "event_names": dict(Counter(r["EVENT_NAME"] for r in events.values())),
               "parameter_names": dict(Counter(r["PARAMETER_NAME"] for r in parameters)),
               "problems": problems,
               "limits": ["Configuration relationships do not establish runtime invocation, selected records, privileges, licensing, or operational effects.",
                          "Attribute and parameter values were not returned: only SQL SHA-256 over UTF-16LE bytes and byte lengths were captured.",
                          "Token-slot values are omitted; only a non-null slot count is retained.",
                          "Non-token event/column expressions and non-identifier grid FIELD expressions are omitted from synced files.",
                          "Grid columns, field data sources, templates, default values, CSS, event code and arbitrary parameters are not fully evaluated."]}
    write("interaction-map-summary", summary)
    print(json.dumps({k: v for k, v in summary.items() if k not in ("attribute_names", "event_names", "parameter_names", "limits")}))
    if problems:
        raise ValueError(problems)


if __name__ == "__main__":
    main()
