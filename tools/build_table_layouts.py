"""Build complete-as-captured table layouts without database access.

The accepted capture manifest and table-use report are mandatory provenance
anchors. Output contains original default/check/filter/trigger expressions and
defaults outside the repository unless the owner explicitly chooses otherwise.
This is documentation, not executable CREATE TABLE scripting or a DACPAC.
"""
from __future__ import annotations

import argparse
from collections import Counter
import hashlib
import html
import json
import os
from pathlib import Path
import re

from programming_layout_mentions import comment_mentions

ROOT = Path(__file__).resolve().parents[1]
PRIVATE = Path(os.environ.get("LOCALAPPDATA", str(Path.home()))) / "TAB/SCALE-Intelligence/private"
PRIMARY_TYPES = {"P", "FN", "IF", "TF"}
USAGE_RELATIVE = "DB Architecture/evidence/programming-layout-table-usage.json"
DIRECT_CLASSES = (
    "tables", "columns", "identity_columns", "computed_columns", "indexes",
    "index_columns", "statistics", "stat_columns", "partitions", "masked_columns",
    "fulltext_indexes", "fulltext_columns", "external_tables",
)
GAPS = [
    "Complete means every available field and applicable row in this accepted capture, not every SQL Server catalog field or a replay-complete CREATE TABLE/DACPAC.",
    "Snapshot metadata is historical. No database was contacted, no application rows were read and no SQL was executed by this build.",
    "Vendor-base SCALE versus deployment-specific/custom/backup ownership is not established for every table; object names do not establish that classification.",
    "Absence of a captured SP/function reference does not establish that a table is unused, safe to delete, or inaccessible to application code, dynamic SQL, other databases or external clients.",
    "Column capture omits some scripting fields, including XML collection binding and certain type/storage/encryption attributes. Identity last_value and complete security principals/grants were not captured.",
    "Permissions are grouped inventory, not a complete effective-authorization model; extended properties retain names only, not property values/descriptions.",
    "Partition records retain compression and partition number, not complete physical allocation, partition boundaries/destinations, or row contents/counts. Index/storage fields are limited to those present in the raw records.",
    "Catalog dependencies, bounded lexical relation positions, reviewed effects, indirect paths, identifier mentions and SQL-shaped strings are separate evidence channels; none proves execution or a physical table scan.",
]


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def read_json(path: Path):
    return json.loads(path.read_text(encoding="utf-8"))


def checked_path(base: Path, relative: str) -> Path:
    path = (base / relative).resolve()
    if not path.is_relative_to(base.resolve()):
        raise ValueError("Provenance path escapes its source root")
    return path


def verify_file(root: Path, relative: str, expected: str) -> Path:
    path = checked_path(root, relative)
    if not path.is_file() or sha(path) != expected:
        raise ValueError(f"Source integrity failure: {relative}")
    return path


def load_verified(root: Path, snapshot: Path):
    """Validate all inputs before creating or changing any output artifact."""
    accepted_path = root / "DB Architecture/evidence/capture-manifest.json"
    accepted = read_json(accepted_path)
    manifest = read_json(snapshot / "manifest.json")
    if manifest != accepted:
        raise ValueError("Snapshot manifest differs from the accepted capture manifest")
    summary = read_json(root / "DB Architecture/evidence/summary.json")
    if summary["snapshot_id"] != snapshot.name:
        raise ValueError("Snapshot identity differs from the accepted evidence summary")
    rows = {}
    for name, entry in manifest["queries"].items():
        if entry["status"] == "CAPTURED":
            path = verify_file(snapshot, entry["file"], entry["sha256"])
            value = read_json(path)
            if not isinstance(value, list) or len(value) != entry["rows"]:
                raise ValueError(f"Captured row-count mismatch: {name}")
            rows[name] = value
        else:
            rows[name] = []
    required = {"objects", "objects_at_end", "tables", "columns", "modules"}
    if any(manifest["queries"].get(n, {}).get("status") != "CAPTURED" for n in required):
        raise ValueError("Required table layout capture is unavailable")
    if rows["objects"] != rows["objects_at_end"]:
        raise ValueError("Accepted capture object identities were not stable")
    usage_path = root / USAGE_RELATIVE
    usage = read_json(usage_path)
    if usage["snapshot_id"] != snapshot.name:
        raise ValueError("Table-use report belongs to a different snapshot")
    for relative, expected in usage["input_sha256"].items():
        verify_file(root, relative, expected)
    if usage.get("tool_sha256"):
        verify_file(root, "tools/report_table_usage.py", usage["tool_sha256"])
    originals = {r["object_id"]: r for r in rows["modules"]}
    catalog_modules = read_json(root / "DB Architecture/catalog/modules.json")
    for item in catalog_modules:
        mid = item["object_id"]
        original = originals.get(mid, {}).get("definition")
        digest = hashlib.sha256(original.encode("utf-8")).hexdigest() if original is not None else None
        if digest != item.get("source_definition_sha256"):
            raise ValueError(f"Original module definition differs from accepted source: {mid}")
    for mid, source in usage["module_sources"].items():
        original = originals.get(int(mid), {}).get("definition")
        if not isinstance(original, str) or hashlib.sha256(original.encode("utf-8")).hexdigest() != source["source_definition_sha256"]:
            raise ValueError(f"Table-use module binding mismatch: {mid}")
        verify_file(root, source["reading_path"], source["reading_sha256"])
    original_observation = usage.get("private_original_observation", {})
    if not original_observation.get("loaded") or original_observation.get("captured_original_file_sha256") != manifest["queries"]["modules"]["sha256"]:
        raise ValueError("Table-use report lacks matching original-string evidence")
    table_ids = {r["object_id"] for r in rows["objects"] if r["type"].strip() == "U"}
    if table_ids != {r["object_id"] for r in rows["tables"]} or table_ids != {r["object_id"] for r in usage["tables"]}:
        raise ValueError("Table inventory and table-use report do not cover the same tables")
    if len(table_ids) != summary["counts"]["USER_TABLE"]:
        raise ValueError("Accepted table count mismatch")
    roles = {}
    verified_role_evidence = set()
    for relative, batch_sha in usage["input_sha256"].items():
        if "/mappings/batches/" not in relative:
            continue
        batch = read_json(root / relative)
        for index, role in enumerate(batch.get("reviewed_roles", [])):
            if role.get("object_id") not in table_ids:
                continue
            if role.get("snapshot_id", snapshot.name) != snapshot.name:
                raise ValueError("Table role belongs to a different snapshot")
            for ev in role.get("evidence", []):
                binding = ev.get("path"), ev.get("sha256")
                if all(binding) and binding not in verified_role_evidence:
                    verify_file(root, *binding)
                    verified_role_evidence.add(binding)
            roles.setdefault(role["object_id"], []).append({
                "batch_path": relative, "batch_sha256": batch_sha,
                "json_pointer": f"/reviewed_roles/{index}", "record": role,
            })
    base_relative = "DB Architecture/mappings/functional-role-base.json"
    base_path = root / base_relative
    if base_path.exists():
        base = read_json(base_path)
        if base["snapshot_id"] != snapshot.name:
            raise ValueError("Base table-role catalog belongs to a different snapshot")
        for source in base.get("source_inputs", []):
            verify_file(root, source["path"], source["sha256"])
        for index, role in enumerate(base.get("records", [])):
            if role.get("object_id") not in table_ids:
                continue
            for ev in role.get("evidence", []):
                binding = ev.get("path"), ev.get("sha256")
                if all(binding) and binding not in verified_role_evidence:
                    verify_file(root, *binding)
                    verified_role_evidence.add(binding)
            roles.setdefault(role["object_id"], []).insert(0, {
                "batch_path": base_relative, "batch_sha256": sha(base_path),
                "json_pointer": f"/records/{index}", "record": role,
            })
    return manifest, rows, usage, roles


def type_text(column: dict) -> str:
    name = column["type_name"]
    schema = column.get("type_schema", "sys")
    display = name if schema == "sys" else f"[{schema}].[{name}]"
    lower = name.lower()
    if schema != "sys":
        return display
    if lower in {"varchar", "nvarchar", "char", "nchar", "varbinary", "binary"}:
        size = column["max_length"]
        width = "MAX" if size == -1 else size // 2 if lower in {"nvarchar", "nchar"} else size
        return f"{display}({width})"
    if lower in {"decimal", "numeric"}:
        return f"{display}({column['precision']},{column['scale']})"
    if lower in {"datetime2", "datetimeoffset", "time"}:
        return f"{display}({column['scale']})"
    if lower == "float":
        return f"{display}({column['precision']})"
    return display


def cell(value) -> str:
    if value is None:
        return "null"
    if isinstance(value, bool):
        return str(value).lower()
    if isinstance(value, (list, dict)):
        value = json.dumps(value, ensure_ascii=False, sort_keys=True)
    return html.escape(str(value), quote=False).replace("|", "&#124;").replace("\r\n", "<br>").replace("\n", "<br>").replace("\r", "<br>")


def md_table(headers, rows) -> str:
    content = list(rows)
    if not content:
        return "No matching rows in the captured class. Check capture status before interpreting absence.\n"
    return "| " + " | ".join(headers) + " |\n| " + " | ".join(["---"] * len(headers)) + " |\n" + "".join("| " + " | ".join(cell(x) for x in row) + " |\n" for row in content)


def json_block(value) -> str:
    text = json.dumps(value, ensure_ascii=False, indent=2)
    longest = max((len(x) for x in re.findall(r"`+", text)), default=0)
    fence = "`" * max(3, longest + 1)
    return f"{fence}json\n{text}\n{fence}\n"


def object_name(oid, by_id):
    obj = by_id.get(oid)
    return f"{obj['schema_name']}.{obj['name']}" if obj else f"uncaptured object {oid}"


def routine_link(mid, by_id):
    obj = by_id.get(mid, {})
    name = cell(object_name(mid, by_id))
    kind = obj.get("type", "").strip()
    if kind in PRIMARY_TYPES:
        folder = "SP%20layout" if kind == "P" else "function%20layout"
        return f"[{name}](../{folder}/{mid}.md)"
    return f"{name} (`{mid}`, {kind or 'unknown type'}; outside SP/function scope)"


def selected_rows(oid, obj, rows):
    """Preserve the exact source dictionaries; derived labels live elsewhere."""
    selected = {name: [r for r in rows.get(name, []) if r.get("object_id") == oid] for name in DIRECT_CLASSES}
    cols = selected["columns"]
    default_ids = {r.get("default_object_id") for r in cols} - {None, 0}
    rule_ids = {r.get("rule_object_id") for r in cols} - {None, 0}
    selected["default_constraints"] = [r for r in rows.get("default_constraints", []) if r.get("parent_object_id") == oid or r.get("object_id") in default_ids]
    for name in ("key_constraints", "check_constraints"):
        selected[name] = [r for r in rows.get(name, []) if r.get("parent_object_id") == oid]
    selected["foreign_keys"] = [r for r in rows.get("foreign_keys", []) if oid in (r.get("parent_object_id"), r.get("referenced_object_id"))]
    fk_ids = {r["object_id"] for r in selected["foreign_keys"]}
    selected["foreign_key_columns"] = [r for r in rows.get("foreign_key_columns", []) if r.get("constraint_object_id") in fk_ids]
    selected["triggers"] = [r for r in rows.get("triggers", []) if r.get("parent_id") == oid]
    trigger_ids = {r["object_id"] for r in selected["triggers"]}
    selected["trigger_events"] = [r for r in rows.get("trigger_events", []) if r.get("object_id") in trigger_ids]
    related_ids = {oid} | default_ids | rule_ids | fk_ids | trigger_ids
    for name in ("default_constraints", "key_constraints", "check_constraints"):
        related_ids.update(r["object_id"] for r in selected[name])
    selected["objects"] = [r for r in rows["objects"] if r["object_id"] in related_ids or r.get("parent_object_id") == oid]
    selected["modules"] = [r for r in rows["modules"] if r["object_id"] in related_ids]
    selected["dependencies"] = [r for r in rows.get("dependencies", []) if r.get("referencing_id") in related_ids or r.get("referenced_id") == oid]
    schemas = {r["schema_id"]: r["name"] for r in rows.get("schemas", [])}
    type_names = {(r.get("type_schema"), r["type_name"]) for r in cols}
    selected["types"] = [r for r in rows.get("types", []) if (schemas.get(r["schema_id"]), r["name"]) in type_names]
    type_ids = {r["user_type_id"] for r in selected["types"]}
    schema_ids = {obj["schema_id"]} | {r["schema_id"] for r in selected["types"]}
    selected["schemas"] = [r for r in rows.get("schemas", []) if r["schema_id"] in schema_ids]
    selected["table_types"] = [r for r in rows.get("table_types", []) if r.get("type_table_object_id") == oid or r.get("user_type_id") in type_ids]
    spaces = {r.get("data_space_id") for r in selected["indexes"]} - {None, 0}
    for r in selected["tables"]:
        spaces.update({r.get("lob_data_space_id"), r.get("filestream_data_space_id")} - {None, 0})
    selected["data_spaces"] = [r for r in rows.get("data_spaces", []) if r.get("data_space_id") in spaces]
    selected["partition_schemes"] = [r for r in rows.get("partition_schemes", []) if r.get("data_space_id") in spaces]
    partition_ids = {r.get("function_id") for r in selected["partition_schemes"]}
    selected["partition_functions"] = [r for r in rows.get("partition_functions", []) if r.get("function_id") in partition_ids]
    selected["files"] = [r for r in rows.get("files", []) if r.get("data_space_id") in spaces]
    selected["security_predicates"] = [r for r in rows.get("security_predicates", []) if r.get("target_object_id") == oid]
    policy_ids = {r.get("object_id") for r in selected["security_predicates"]}
    selected["security_policies"] = [r for r in rows.get("security_policies", []) if r.get("object_id") in policy_ids]
    selected["schema_permissions"] = [r for r in rows.get("schema_permissions", []) if (r.get("class_desc") == "OBJECT_OR_COLUMN" and r.get("major_id") in related_ids) or (r.get("class_desc") == "SCHEMA" and r.get("major_id") == obj["schema_id"]) or r.get("class_desc") == "DATABASE"]
    selected["extended_property_inventory"] = [r for r in rows.get("extended_property_inventory", []) if (r.get("class_desc") in {"OBJECT_OR_COLUMN", "INDEX"} and r.get("major_id") in related_ids) or (r.get("class_desc") == "SCHEMA" and r.get("major_id") == obj["schema_id"]) or (r.get("class_desc") == "TYPE" and r.get("major_id") in type_ids) or r.get("class_desc") == "DATABASE"]
    return selected


def prioritized(usage, primary_ids, comments=()):
    ids = set(usage["primary_routine_any_evidence_ids"])
    ids.update(usage["module_path_context"]["primary_indirect_module_ids"])
    for key in ("identifier_token_mentions", "original_string_mentions", "catalog_null_target_candidates"):
        ids.update(r["module_id"] for r in usage["non_credit_observations"].get(key, []) if r["module_id"] in primary_ids)
    ids.update(r["module_id"] for r in comments if r["module_id"] in primary_ids)
    return sorted(ids)


def references_md(usage, by_id, module_sources):
    text = "## SP/function relationships\n\n"
    text += "Source channels remain separate. Lexical lines refer to the retained reading with preserved source line breaks; string lines refer to the original captured definition. A relation read is source syntax, not evidence of a physical execution-plan scan.\n\n"
    for evidence in usage["reference_evidence"]:
        mid = evidence["module_id"]
        text += f"### {routine_link(mid, by_id)}\n\n"
        text += f"Channels: {', '.join(evidence['channels'])}.\n\n"
        text += md_table(["Lexical operation", "Source line", "Context", "Binding"], [(r["operation"], r["line"], r["context"], r["binding"]) for r in evidence["lexical_relation_evidence"]]) + "\n"
        if evidence["catalog_dependency_records"]:
            text += "Captured catalog dependency (no operation inferred):\n\n" + json_block(evidence["catalog_dependency_records"]) + "\n"
        if evidence["reviewed_effects"]:
            text += "Reviewed effects; preserve each stated direct/called/dynamic scope:\n\n" + md_table(["Relationship", "Scope", "Annotation", "Evidence source", "Coordinate"], [(r["relationship"], r["scope"], r.get("reviewed_annotation"), r["batch_path"], r.get("json_pointer")) for r in evidence["reviewed_effects"]]) + "\n"
        sites = module_sources.get(str(mid), {}).get("dynamic_execution_sites", [])
        if sites:
            text += "Module-level dynamic execution sites (not proof that this table was accessed):\n\n" + json_block(sites) + "\n"
    if not usage["reference_evidence"]:
        text += "No captured direct/contract reference evidence for this table.\n\n"
    paths = usage["module_path_context"]
    text += "### Indirect module paths\n\n" + paths["limits"] + "\n\n"
    text += "\n".join(f"- {routine_link(mid, by_id)}" for mid in paths["primary_indirect_module_ids"]) + "\n\n" if paths["primary_indirect_module_ids"] else "No captured indirect primary-routine path.\n\n"
    for key in ("shortest_path_examples", "view_path_examples", "attached_trigger_paths"):
        if paths[key]:
            text += f"{key}:\n\n" + json_block(paths[key]) + "\n"
    text += "### Identifier mentions and original strings\n\nThese do not receive direct-table-use credit. SQL-shaped strings remain execution-unproven.\n\n"
    for key in ("identifier_token_mentions", "original_string_mentions", "catalog_null_target_candidates"):
        observations = usage["non_credit_observations"].get(key, [])
        if observations:
            text += f"{key}:\n\n"
            for row in observations:
                text += f"- {routine_link(row['module_id'], by_id)}: {cell({k: v for k, v in row.items() if k != 'module_id'})}\n"
            text += "\n"
    return text


def table_markdown(record, by_id, all_columns, module_sources):
    obj, raw, usage = record["object"], record["raw_catalog_records"], record["table_usage_evidence"]
    oid = obj["object_id"]
    columns = sorted(raw["columns"], key=lambda r: r["column_id"])
    column_names = {r["column_id"]: r["name"] for r in columns}
    def col_name(cid):
        return column_names.get(cid, "RID (column_id=0)" if cid == 0 else f"uncaptured column {cid}")
    identity = {r["column_id"]: r for r in raw["identity_columns"]}
    computed = {r["column_id"]: r for r in raw["computed_columns"]}
    defaults = {r["object_id"]: r for r in raw["default_constraints"]}
    text = f"# {object_name(oid, by_id)} — captured table layout\n\n"
    text += f"Snapshot `{record['snapshot_id']}`; object ID `{oid}`. Priority: **{record['priority']}**.\n\n"
    text += f"[Exact captured metadata and evidence]({oid}.json). This file retains original SQL expressions. Vendor-base/custom ownership and runtime activity are not established.\n\n"
    text += f"SP/function direct status: `{usage['primary_routine_direct_status']}`. {len(record['prioritized_primary_routine_ids'])} primary routines have any captured relationship/mention/path evidence.\n\n"
    text += "## Reviewed programming role\n\n"
    if record["reviewed_roles"]:
        for binding in record["reviewed_roles"]:
            role = binding["record"]
            text += role.get("purpose", "No purpose statement captured.") + "\n\n"
            text += f"Review: `{role.get('review_state')}`; scope `{role.get('review_scope')}`; confidence `{role.get('confidence')}`. Source `{binding['batch_path']}{binding['json_pointer']}`.\n\n"
            for finding in role.get("schema_and_use_findings", []):
                text += f"- {finding}\n"
            text += "\n"
    else:
        text += "No reviewed table-role narrative was found in the bound review batches. The layout and routine evidence are supplied without inventing a business meaning.\n\n"
    text += "## Ordered columns\n\n`max_length` is stored bytes; nchar/nvarchar declarations use byte-pairs (MAX remains MAX). Legacy text/ntext/image values can describe in-row pointer metadata, not maximum content capacity. Precision/scale are reproduced separately.\n\n"
    colrows = []
    for c in columns:
        ident = identity.get(c["column_id"])
        default = defaults.get(c.get("default_object_id"), {})
        comp = computed.get(c["column_id"], {})
        colrows.append((c["column_id"], c["name"], type_text(c), c["max_length"], c["precision"], c["scale"], c["is_nullable"], f"seed={ident['seed_value']}; increment={ident['increment_value']}; not_for_replication={ident.get('is_not_for_replication')}" if ident else c["is_identity"], comp.get("definition", "NOT_CAPTURED" if c["is_computed"] else ""), default.get("definition", f"bound object {c.get('default_object_id')}" if c.get("default_object_id") else ""), c.get("collation_name")))
    text += md_table(["Ordinal", "Column", "Declared type", "Captured bytes", "Precision", "Scale", "Nullable", "Identity", "Computed expression", "Default expression", "Collation"], colrows) + "\n"
    text += "Sparse, column-set, ROWGUIDCOL, generated-always, encryption, rule/default IDs and every additional captured field remain in the exact-record appendix.\n\n"
    text += "## Primary and unique constraints\n\n"
    def index_cols(index_id, included=False):
        found = [r for r in raw["index_columns"] if r["index_id"] == index_id and bool(r["is_included_column"]) == included and (included or r["key_ordinal"] > 0)]
        found.sort(key=lambda r: r["index_column_id"] if included else r["key_ordinal"])
        return ", ".join(col_name(r["column_id"]) + (" DESC" if r["is_descending_key"] else " ASC") for r in found)
    text += md_table(["Constraint", "Kind", "Backing index", "Ordered key columns"], [(r["name"], r["type_desc"], r["unique_index_id"], index_cols(r["unique_index_id"])) for r in raw["key_constraints"]]) + "\n"
    text += "## Indexes and heaps\n\n"
    text += md_table(["ID", "Name", "Kind", "Unique", "Keys", "Included", "Filter", "Disabled", "Hypothetical", "Data space", "Fill factor"], [(r["index_id"], r["name"], r["type_desc"], r["is_unique"], index_cols(r["index_id"]), index_cols(r["index_id"], True), r.get("filter_definition"), r["is_disabled"], r["is_hypothetical"], r["data_space_id"], r["fill_factor"]) for r in sorted(raw["indexes"], key=lambda r: r["index_id"])]) + "\n"
    text += "Index-column records also preserve included/descending/partition ordinals, and index records retain locking and duplicate-key settings in the appendix.\n\n"
    text += "## Incoming and outgoing foreign keys\n\n"
    fkrows = []
    for fk in raw["foreign_keys"]:
        pairs = sorted([r for r in raw["foreign_key_columns"] if r["constraint_object_id"] == fk["object_id"]], key=lambda r: r["constraint_column_id"])
        paired = "; ".join(f"{object_name(r['parent_object_id'], by_id)}.{all_columns.get((r['parent_object_id'], r['parent_column_id']), r['parent_column_id'])} → {object_name(r['referenced_object_id'], by_id)}.{all_columns.get((r['referenced_object_id'], r['referenced_column_id']), r['referenced_column_id'])}" for r in pairs)
        direction = "OUTGOING + INCOMING (self-reference)" if fk["parent_object_id"] == fk["referenced_object_id"] == oid else "OUTGOING" if fk["parent_object_id"] == oid else "INCOMING"
        fkrows.append((fk["name"], direction, paired, fk["delete_referential_action_desc"], fk["update_referential_action_desc"], fk["is_disabled"], not fk["is_not_trusted"], fk["is_not_for_replication"]))
    text += md_table(["FK", "Direction", "Ordered column pairs", "Delete", "Update", "Disabled", "Trusted", "Not for replication"], fkrows) + "\n"
    text += "## Check constraints\n\n" + md_table(["Name", "Column ID (0 = table)", "Expression", "Disabled", "Trusted", "Not for replication"], [(r["name"], r["parent_column_id"], r["definition"], r["is_disabled"], not r["is_not_trusted"], r["is_not_for_replication"]) for r in raw["check_constraints"]]) + "\n"
    text += "## Triggers\n\n" + md_table(["ID", "Name", "Kind", "Disabled", "Instead of", "Not for replication", "Events"], [(r["object_id"], r["name"], r["type_desc"], r["is_disabled"], r["is_instead_of_trigger"], r["is_not_for_replication"], [e for e in raw["trigger_events"] if e["object_id"] == r["object_id"]]) for r in raw["triggers"]]) + "\n"
    text += "Applicable captured trigger definitions and settings are retained unchanged in `modules` in the appendix. Static trigger attachment does not prove activation.\n\n"
    text += "## Statistics\n\n"
    statrows = []
    for stat in sorted(raw["statistics"], key=lambda r: r["stats_id"]):
        sc = sorted([r for r in raw["stat_columns"] if r["stats_id"] == stat["stats_id"]], key=lambda r: r["stats_column_id"])
        statrows.append((stat["stats_id"], stat["name"], ", ".join(col_name(r["column_id"]) for r in sc), stat["auto_created"], stat["user_created"], stat["no_recompute"], stat.get("filter_definition"), stat["is_temporary"], stat["is_incremental"]))
    text += md_table(["ID", "Name", "Ordered columns", "Auto", "User", "No recompute", "Filter", "Temporary", "Incremental"], statrows) + "\n"
    text += "## Storage, partition, type and security metadata\n\n"
    for name in ("tables", "partitions", "data_spaces", "files", "partition_schemes", "partition_functions", "types", "schemas", "table_types", "masked_columns", "security_predicates", "security_policies", "schema_permissions", "extended_property_inventory", "external_tables", "fulltext_indexes", "fulltext_columns"):
        text += f"### {name}\n\nCapture status: `{record['capture_classes'].get(name, {}).get('status', 'NOT_CAPTURED')}`.\n\n" + json_block(raw[name]) + "\n"
    text += references_md(usage, by_id, module_sources)
    text += "## Original comment mentions\n\nComment-name matches are textual mentions only, not SQL bindings or table-use credit. Offsets are zero-based Unicode character positions in the original definition.\n\n"
    for mention in record["original_comment_mentions"]:
        text += f"- {routine_link(mention['module_id'], by_id)}: original line {mention['source_line']}; character offsets {mention['source_start_offset']}–{mention['source_end_offset']}; `{mention['status']}`.\n"
    if not record["original_comment_mentions"]:
        text += "No bounded original-comment identifier match.\n"
    text += "\n"
    text += "## Capture limits and provenance\n\n" + "\n".join(f"- {x}" for x in record["limitations"]) + "\n\n"
    text += f"Accepted manifest SHA-256 `{record['provenance']['accepted_capture_manifest_sha256']}`; table-use report SHA-256 `{record['provenance']['table_usage_sha256']}`.\n\n"
    text += "## Exact applicable catalog records\n\nAll applicable original source dictionaries are reproduced here. Empty lists mean zero selected records only when the associated class was captured; full query statuses and source hashes are in the paired JSON. Object IDs remain local to this captured database.\n\n" + json_block(raw)
    return text


def write_text(path: Path, value: str):
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.exists() and path.read_bytes() == value.encode("utf-8"):
        return
    temp = path.with_name(path.name + ".tmp")
    temp.write_bytes(value.encode("utf-8"))
    temp.replace(path)


def build(root: Path, snapshot: Path, output_root: Path, *, allow_workspace_local: bool = False) -> dict:
    root, snapshot, output_root = root.resolve(), snapshot.resolve(), output_root.resolve()
    if output_root.is_relative_to(root) and not allow_workspace_local:
        raise ValueError("Original expressions in workspace output require --allow-workspace-local")
    manifest, rows, usage, roles = load_verified(root, snapshot)
    by_id = {r["object_id"]: r for r in rows["objects"]}
    tables = [r for r in rows["objects"] if r["type"].strip() == "U"]
    primary_ids = {oid for oid, obj in by_id.items() if obj["type"].strip() in PRIMARY_TYPES}
    by_usage = {r["object_id"]: r for r in usage["tables"]}
    comments = comment_mentions([{**r, "type": r["type"].strip()} for r in rows["objects"]], rows["modules"])
    all_columns = {(r["object_id"], r["column_id"]): r["name"] for r in rows["columns"]}
    folder = output_root / "table layout"
    expected = {f"{r['object_id']}{suffix}" for r in tables for suffix in (".md", ".json")} | {"README.md", "manifest.json"}
    if folder.exists():
        unknown = [p.name for p in folder.iterdir() if p.name not in expected or not p.is_file()]
        if unknown:
            raise ValueError("Unrecognized existing files in table layout; use a clean output root")
        previous = folder / "manifest.json"
        if previous.exists() and read_json(previous).get("snapshot_id") != snapshot.name:
            raise ValueError("Existing table layouts belong to another snapshot")
    provenance = {
        "snapshot_id": snapshot.name,
        "accepted_capture_manifest_sha256": sha(root / "DB Architecture/evidence/capture-manifest.json"),
        "private_capture_manifest_sha256": sha(snapshot / "manifest.json"),
        "table_usage_path": USAGE_RELATIVE,
        "table_usage_sha256": sha(root / USAGE_RELATIVE),
        "builder_sha256": sha(Path(__file__)),
        "comment_mention_tool_sha256": sha(Path(__file__).with_name("programming_layout_mentions.py")),
        "source_verification": "ALL_CAPTURED_CLASS_HASHES_AND_ROW_COUNTS_ACCEPTED_MANIFEST_INPUT_BINDINGS_AND_ORIGINAL_MODULE_HASHES_CHECKED",
    }
    files, index = [], []
    tables.sort(key=lambda obj: (not bool(prioritized(by_usage[obj["object_id"]], primary_ids, comments.get(obj["object_id"], []))), object_name(obj["object_id"], by_id).casefold()))
    for obj in tables:
        oid = obj["object_id"]
        table_usage = by_usage[oid]
        priority_ids = prioritized(table_usage, primary_ids, comments.get(oid, []))
        raw = selected_rows(oid, obj, rows)
        record = {
            "schema_version": 1, "artifact_kind": "CAPTURED_TABLE_PROGRAMMING_LAYOUT",
            "snapshot_id": snapshot.name, "object": obj,
            "priority": "SP_FUNCTION_REFERENCE_OR_MENTION_OR_PATH" if priority_ids else "ALL_TABLE_FALLBACK_NO_CAPTURED_PRIMARY_EVIDENCE",
            "prioritized_primary_routine_ids": priority_ids,
            "vendor_base_scale_classification": "NOT_ESTABLISHED",
            "layout_completeness": "ALL_APPLICABLE_CAPTURED_FIELDS_AND_RECORDS_NOT_REPLAY_COMPLETE_DDL",
            "raw_catalog_records": raw,
            "capture_classes": manifest["queries"],
            "database_capture_context": {name: rows.get(name, []) for name in ("database", "permissions", "database_scoped_configurations", "xml_schema_collections")},
            "reviewed_roles": roles.get(oid, []),
            "table_usage_evidence": table_usage,
            "original_comment_mentions": comments.get(oid, []),
            "module_source_bindings": {mid: source for mid, source in usage["module_sources"].items() if int(mid) in set(priority_ids) | {r["module_id"] for r in table_usage["reference_evidence"]}},
            "limitations": GAPS + usage.get("limitations", []), "provenance": provenance,
        }
        paths = [folder / f"{oid}.json", folder / f"{oid}.md"]
        write_text(paths[0], json.dumps(record, ensure_ascii=False, indent=2) + "\n")
        write_text(paths[1], table_markdown(record, by_id, all_columns, usage["module_sources"]))
        files.extend({"path": p.relative_to(output_root).as_posix(), "sha256": sha(p), "bytes": p.stat().st_size} for p in paths)
        index.append({"object_id": oid, "qualified_name": object_name(oid, by_id), "priority": record["priority"], "primary_routines": len(priority_ids), "direct_primary_routines": len(table_usage["primary_routine_direct_ids"]), "columns": len(raw["columns"]), "reviewed_role": bool(record["reviewed_roles"])})
    counts = dict(Counter(r["priority"] for r in index))
    result = {
        "schema_version": 1, "artifact_kind": "CAPTURED_TABLE_LAYOUT_MANIFEST",
        "snapshot_id": snapshot.name, "table_count": len(tables), "document_count": len(files),
        "column_count": sum(r["columns"] for r in index), "priority_counts": counts,
        "reviewed_table_roles": sum(r["reviewed_role"] for r in index),
        "captured_primary_routines": len(primary_ids), "provenance": provenance,
        "limitations": GAPS, "tables": index, "files": files,
    }
    text = f"# Captured table programming layouts\n\nSnapshot `{snapshot.name}`: **{len(tables)} tables**, **{result['column_count']} columns**, {len(primary_ids)} SP/functions considered. Each table has a readable layout and exact-record JSON. Original expressions are preserved.\n\n"
    if allow_workspace_local:
        text += "The owner authorized original source and layout documentation in this repository, Git and GitHub on 2026-10-08. The original assessment snapshot remains unchanged.\n\n"
    text += "Tables with SP/function source, reviewed, indirect-path or mention evidence are listed first. All other captured tables are retained as a completeness fallback. These groups do not classify vendor-base SCALE, custom/backup ownership, runtime activity, or deletion safety.\n\n"
    text += "A routine reference does not prove a physical table scan. Sources preserve distinct catalog dependencies, lexical relation operations/lines, reviewed effects, indirect module paths, identifier mentions and original SQL-string observations.\n\n"
    # Build links outside generic cell escaping so Markdown remains clickable.
    text += "| Table | Priority | Primary routines with evidence | Direct primary routines | Columns | Reviewed role |\n| --- | --- | --- | --- | --- | --- |\n"
    for row in index:
        text += f"| [{cell(row['qualified_name'])}]({row['object_id']}.md) | {row['priority']} | {row['primary_routines']} | {row['direct_primary_routines']} | {row['columns']} | {row['reviewed_role']} |\n"
    text += "\n## Limits\n\n" + "\n".join(f"- {x}" for x in GAPS) + "\n\n[Artifact hashes and full table index](manifest.json).\n"
    write_text(folder / "README.md", text)
    write_text(folder / "manifest.json", json.dumps(result, ensure_ascii=False, indent=2) + "\n")
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=ROOT)
    parser.add_argument("--snapshot", type=Path, default=PRIVATE / "db-assessment/20260929T214106Z")
    parser.add_argument("--output-root", type=Path)
    parser.add_argument("--allow-workspace-local", action="store_true", help="Explicitly authorize original-expression output inside the repository")
    args = parser.parse_args()
    output = args.output_root or PRIVATE / "db-layouts" / args.snapshot.name / "DB Architecture"
    result = build(args.root, args.snapshot, output, allow_workspace_local=args.allow_workspace_local)
    print(json.dumps({k: result[k] for k in ("snapshot_id", "table_count", "document_count", "column_count", "priority_counts", "reviewed_table_roles", "captured_primary_routines")}, indent=2))


if __name__ == "__main__":
    main()
