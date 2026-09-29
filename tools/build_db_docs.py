"""Build inert, source-linked SCALE database documentation from private metadata."""
from __future__ import annotations
import argparse
from collections import Counter, defaultdict
import hashlib
import json
from pathlib import Path
import re
from assess_db import ROOT, PRIVATE, atomic_json

OUT = ROOT / "DB Architecture"
MODULE_TYPES = {"P", "FN", "IF", "TF", "TR", "V", "D"}
DOMAINS = [
 ("receiving", r"RECEIPT|RECEIV|PUTAWAY|RCV|PURCHASE_ORDER|INBOUND"),
 ("shipping", r"SHIP|SHP|CONTAINER|TRAILER|DOCK|LOAD|MANIFEST|BOL|PACK|WAVE|OUTBOUND"),
 ("inventory", r"INVENTORY|\bINV|^INV|ITEM|LOCATION|LOT|SERIAL|REPLEN|RPLN|CYCLE|COUNT|UM_"),
 ("work", r"WORK|PICK|TASK|LABOR|WRT|RF_|RFN|EQUIPMENT"),
 ("integration", r"INTERFACE|UPLOAD|DOWNLOAD|EDI|API|XML|JSON|HOST|WEBSERVICE|ACTION_ENDPOINT"),
 ("queue", r"QUEUE|Q_PROCESS|Q_SERVICE|BATCH|SCHEDUL|JOB|PROCESS_REQUEST"),
 ("security", r"SECUR|USER|PERMISSION|ROLE|LICENSE|AUTH|AUDIT"),
 ("configuration", r"CONFIG|FEATURE|SYSTEM|WAREHOUSE|COMPANY|RESOURCE|RSCM|STATUS|STS|META|DYNAMIC"),
 ("reporting", r"RPT|REPORT|DASH|KPI|MONITOR|INSIGHT|HISTORY|ARCHIVE|PURGE"),
 ("utilities", r"DATE|TIME|SPLIT|STRING|CONVERT|IDENTITY|NUMBER|NEXT|DBH|DHfn"),
]

def digest(data):
    return hashlib.sha256(data).hexdigest()

def redact_sql(sql, quoted_identifier=True):
    """Lex strings/comments including nested block comments; preserve line boundaries."""
    if sql is None:
        return None
    sql = sql.replace('\r\n', '\n').replace('\r', '\n')
    out, i, n = [], 0, 0
    while i < len(sql):
        start = i
        if sql.startswith("--", i):
            end = sql.find("\n", i)
            i = len(sql) if end < 0 else end
            out.append("-- [comment omitted]")
        elif sql.startswith("/*", i):
            i, depth = i + 2, 1
            while i < len(sql) and depth:
                if sql.startswith("/*", i):
                    depth, i = depth + 1, i + 2
                elif sql.startswith("*/", i):
                    depth, i = depth - 1, i + 2
                else:
                    i += 1
            out.append("/* [comment omitted] */" + "\n" * sql[start:i].count("\n"))
        elif sql[i] == "'" or (sql[i] == '"' and not quoted_identifier):
            quote, i = sql[i], i + 1
            while i < len(sql):
                if sql[i] == quote:
                    i += 1
                    if i < len(sql) and sql[i] == quote:
                        i += 1
                        continue
                    break
                i += 1
            n += 1
            out.append("'<literal:" + str(n) + ">'" + "\n" * sql[start:i].count("\n"))
        elif sql[i] == "[" or sql[i] == '"':
            endquote = "]" if sql[i] == "[" else '"'
            i += 1
            while i < len(sql):
                if sql[i] == endquote:
                    i += 1
                    if i < len(sql) and sql[i] == endquote:
                        i += 1
                        continue
                    break
                i += 1
            out.append(sql[start:i])
        else:
            out.append(sql[i])
            i += 1
    return "".join(out)

def domain(name):
    return next((key for key, expr in DOMAINS if re.search(expr, name, re.I)), "unclassified")

def load(snapshot, name):
    manifest = json.loads((snapshot / 'manifest.json').read_text(encoding='utf-8'))
    if manifest['queries'].get(name, {}).get('status') != 'CAPTURED':
        return []
    path = snapshot / (name + ".json")
    return json.loads(path.read_text(encoding="utf-8")) if path.exists() else []

def check_existing_output(snapshot, manifest, objects, modules):
    """Fail closed rather than leave stale generated evidence during a refresh."""
    summary_path = OUT / 'evidence/summary.json'
    if summary_path.exists():
        prior = json.loads(summary_path.read_text(encoding='utf-8'))
        if prior['snapshot_id'] != snapshot.name:
            raise ValueError('Different snapshot: use a clean checkout with generated DB output removed before rebuilding')
    object_ids = {str(o['object_id']) for o in objects}
    module_ids = {str(k) for k,v in modules.items() if v['definition']}
    for folder, allowed in [('objects',object_ids),('sql',module_ids)]:
        for path in (OUT / folder).glob('*'):
            if path.is_file() and path.stem not in allowed:
                raise ValueError(f'Stale generated artifact requires explicit clean refresh: {folder}/{path.name}')
    for name, entry in manifest['queries'].items():
        if entry['status'] != 'CAPTURED' and (OUT / 'catalog' / f'{name}.json').exists():
            raise ValueError(f'Stale catalog for unavailable source: {name}')

def group(rows, key):
    out = defaultdict(list)
    for row in rows:
        out[row[key]].append(row)
    return out

def md(value):
    return str(value).replace("|", "\\|").replace("\n", " ")

def table(headers, rows):
    return "| " + " | ".join(headers) + " |\n| " + " | ".join(["---"] * len(headers)) + " |\n" + "".join("| " + " | ".join(md(v) for v in row) + " |\n" for row in rows)

def write_text(path, content):
    path.parent.mkdir(parents=True, exist_ok=True)
    if not path.exists() or path.read_text(encoding='utf-8') != content:
        path.write_text(content, encoding='utf-8')

def process_catalog(matches, by_id):
    """Index all captured vendor process summaries, preserving unknown deployment alignment."""
    matched = group(matches, 'article_id')
    records = []
    for path in sorted((ROOT / 'AIM/data/articles').glob('*.json')):
        a = json.loads(path.read_text(encoding='utf-8'))
        if 'process summary' not in a['title'].lower():
            continue
        refs = matched[a['id']]
        record = {'process_source_id': a['id'], 'title': a['title'], 'source_sha256': a['source']['sha256'],
            'source_url': a['source']['source_url'], 'json_path': path.relative_to(ROOT).as_posix(),
            'reading_path': a['reading']['markdown'], 'content_node_ids': [node_id for node_id, text in walk_text(a['content_tree'])],
            'exact_identifier_object_ids': sorted({x['object_id'] for x in refs}),
            'lifecycle_evidence': 'CAPTURED_VENDOR_PROCESS_SUMMARY',
            'deployment_alignment': 'NOT_ESTABLISHED', 'end_to_end_runtime': 'NOT_OBSERVED'}
        records.append(record)
        text = f"# {a['title']}\n\n[Complete captured AIM process description](../../{a['reading']['markdown']}).\n\nSource article `{a['id']}`; original SHA-256 `{a['source']['sha256']}`. Preserve the source's own applicability statements. This article is documentary process evidence; its existence does not establish activated behavior in the replica deployment.\n\n"
        text += '## Database identifier evidence\n\n'
        if record['exact_identifier_object_ids']:
            text += '\n'.join(f"- [{by_id[x]['qualified_name']}](../objects/{x}.md)" for x in record['exact_identifier_object_ids']) + '\n\n'
        else:
            text += 'No identifier matched the conservative crosswalk. No database implementation is inferred from the process title.\n\n'
        text += '## Runtime and review boundary\n\nThe full vendor lifecycle is available in the linked reading. Ordered application calls, activated settings, custom exit points, observed start/end duration and production acceptance remain unverified. Use the [review plan](../PLAN.md) and [runtime contract](../RUNTIME.md); never label missing telemetry as an unused process.\n'
        write_text(OUT / 'processes' / f"{a['id']}.md", text)
    atomic_json(OUT / 'mappings/process-catalog.json', records)
    write_text(OUT / 'PROCESS_INDEX.md', '# Vendor process summary index\n\nAll locally captured AIM articles titled Process Summary. Repeated titles retain distinct article identities and content; they are not silently collapsed. Each links the complete existing vendor explanation and known exact DB identifier references.\n\n' + table(['Process summary','DB identifiers','Runtime'], [(f"[{x['title']}](processes/{x['process_source_id']}.md)",len(x['exact_identifier_object_ids']),'End-to-end unknown') for x in records]))
    return records

def type_text(c):
    name = c["type_name"]
    if name in {"varchar", "nvarchar", "char", "nchar", "varbinary", "binary"}:
        length = c["max_length"]
        return f"{name}({'max' if length == -1 else length // 2 if name.startswith('n') else length})"
    if name in {"decimal", "numeric"}:
        return f"{name}({c['precision']},{c['scale']})"
    return name

def walk_text(node):
    if isinstance(node, dict):
        direct = " ".join(v for v in node.get("children", []) if isinstance(v, str))
        if direct:
            yield node.get("node_id"), direct
        for child in node.get("children", []):
            yield from walk_text(child)

def crosswalk(objects):
    names = {o["name"].lower(): o for o in objects if o["type"] in {"U", "P", "V", "FN", "IF", "TF", "TR"} and len(o["name"]) >= 6}
    matches, articles = [], {}
    token = re.compile(r"(?<![\w])(?:" + "|".join(re.escape(k) for k in sorted(names, key=len, reverse=True)) + r")(?![\w])", re.I)
    for module in ["AIM", "SDK"]:
        for path in sorted((ROOT / module / "data/articles").glob("*.json")):
            article = json.loads(path.read_text(encoding="utf-8"))
            if not token.search(article.get("content_text", "")):
                continue
            seen = set()
            for node_id, text in walk_text(article["content_tree"]):
                for match in token.finditer(text):
                    obj = names[match[0].lower()]
                    # Avoid treating common prose such as "company" or "location" as identifiers.
                    qualified = re.search(r'(?:\bdbo|\[dbo\])\s*\.\s*\[?$', text[max(0,match.start()-12):match.start()], re.I)
                    specific_name = '_' in obj['name'] or (obj['type'] in {'P','FN','IF','TF','TR'} and match[0] == obj['name'])
                    if not (qualified or specific_name):
                        continue
                    pair = obj["object_id"], node_id
                    if pair in seen:
                        continue
                    seen.add(pair)
                    matches.append({"object_id": obj["object_id"], "article_id": article["id"], "module": module,
                                    "node_id": node_id, "original_sha256": article["source"]["sha256"],
                                    "evidence_type": "EXACT_IDENTIFIER_MENTION", "semantic_equivalence": "NOT_ESTABLISHED"})
            if seen:
                articles[article["id"]] = {"article_id": article["id"], "module": module, "title": article["title"],
                    "source_url": article["source"]["source_url"], "source_sha256": article["source"]["sha256"],
                    "json_path": path.relative_to(ROOT).as_posix(), "reading_path": article["reading"]["markdown"],
                    "original_path": article["source"]["local_path"], "verification": article["verification"]}
    return matches, articles

def build(snapshot):
    manifest = json.loads((snapshot / "manifest.json").read_text(encoding="utf-8"))
    for name, entry in manifest["queries"].items():
        if entry["status"] == "CAPTURED":
            if digest((snapshot / entry["file"]).read_bytes()) != entry["sha256"]:
                raise ValueError(f"Source integrity failure: {name}")
    objects = load(snapshot, "objects")
    for obj in objects:
        obj["type"] = obj["type"].strip()
        obj["qualified_name"] = obj["schema_name"] + "." + obj["name"]
        obj["domain_candidate"] = domain(obj["name"])
    by_id = {o["object_id"]: o for o in objects}
    modules = {x["object_id"]: x for x in load(snapshot, "modules")}
    check_existing_output(snapshot, manifest, objects, modules)
    columns, params = group(load(snapshot, "columns"), "object_id"), group(load(snapshot, "parameters"), "object_id")
    deps = group(load(snapshot, "dependencies"), "referencing_id")
    indexes = group(load(snapshot, "indexes"), "object_id")
    fks = group(load(snapshot, "foreign_keys"), "parent_object_id")
    runtime = group(load(snapshot, "query_store_runtime"), "object_id")
    matches, articles = crosswalk(objects)
    object_matches = group(matches, "object_id")
    OUT.mkdir(parents=True, exist_ok=True)
    for name, entry in manifest["queries"].items():
        if entry["status"] != "CAPTURED" or name in {"modules", "objects_at_end", "runtime_catalog_columns"}:
            continue
        rows = load(snapshot, name)
        for row in rows:
            for key in ["definition", "filter_definition", "predicate_definition", "masking_function"]:
                if key in row:
                    row[key] = redact_sql(row[key])
            for endpoint_field in ['referenced_server_name', 'partner_server', 'partner_database']:
                if row.get(endpoint_field):
                    row[endpoint_field] = "<external-endpoint-omitted>"
            if row.get('base_object_name'):
                row['base_object_name'] = '<synonym-target-omitted-pending-review>'
        atomic_json(OUT / "catalog" / f"{name}.json", rows)
    atomic_json(OUT / "catalog/objects.json", objects)
    safe_modules, cards, summaries = [], [], []
    for obj in objects:
        oid = obj["object_id"]
        module = modules.get(oid)
        sql = redact_sql(module["definition"], bool(module["uses_quoted_identifier"])) if module else None
        features = {name: bool(sql and re.search(expr, sql, re.I)) for name, expr in {
            "dynamic_sql_candidate": r"\bsp_executesql\b|\bEXEC(?:UTE)?\s*\(?\s*@",
            "transaction_control": r"\bBEGIN\s+TRAN|\bCOMMIT|\bROLLBACK",
            "try_catch": r"\bBEGIN\s+TRY|\bBEGIN\s+CATCH",
            "raises_error": r"\bTHROW\b|\bRAISERROR\b",
            "cursor": r"\bCURSOR\b", "loop": r"\bWHILE\b",
            "read_uncommitted_hint": r"\bNOLOCK\b|\bREADUNCOMMITTED\b",
        }.items()}
        verbs = sorted(set(re.findall(r"\b(?:SELECT|INSERT|UPDATE|DELETE|MERGE|EXECUTE|EXEC|TRUNCATE)\b", sql or "", re.I)))
        if module:
            record = {k: v for k, v in module.items() if k != "definition"}
            record.update(source_definition_sha256=digest(module["definition"].encode("utf-8")) if module["definition"] else None,
                          redaction="ALL_STRING_LITERALS_AND_COMMENTS", static_features=features)
            if sql:
                path = OUT / "sql" / f"{oid}.sql"
                path.parent.mkdir(exist_ok=True)
                write_text(path, "-- DOCUMENTATION ONLY: literals/comments removed; do not execute.\n" + sql)
                record.update(redacted_path=path.relative_to(OUT).as_posix(), redacted_sha256=digest(path.read_bytes()))
            safe_modules.append(record)
        resolved = sorted({x["referenced_id"] for x in deps[oid] if x["referenced_id"] in by_id})
        cardinality = Counter(x["replica_group_id"] for x in runtime[oid])
        runtime_summary = {"evidence": "QUERY_STORE_STATEMENT_AGGREGATES" if runtime[oid] else "NO_OBJECT_LINKED_RUNTIME_OBSERVED",
            "interval_rows": len(runtime[oid]), "replica_groups": sorted(cardinality),
            "statement_executions": sum(x["statement_executions"] for x in runtime[oid]),
            "process_duration_available": False}
        card = {"schema_version": 1, "snapshot_id": snapshot.name, **obj,
            "columns": columns[oid], "parameters": params[oid], "dependency_object_ids": resolved,
            "dependency_evidence": "SQL_CATALOG_STATIC_REFERENCES_NOT_EXECUTION_TRACE",
            "static_features": features, "statement_tokens": verbs,
            "runtime": runtime_summary, "article_reference_count": len(object_matches[oid]),
            "semantic_review_status": "STRUCTURAL_CONTRACT_EXTRACTED_BUSINESS_SEMANTICS_NOT_INDIVIDUALLY_REVIEWED"}
        if module:
            card["module"] = safe_modules[-1]
        atomic_json(OUT / "objects" / f"{oid}.json", card)
        cards.append(card)
        if obj["type"] not in {"U", "P", "FN", "IF", "TF", "TR", "V", "SO"}:
            continue
        lines = [f"# {obj['qualified_name']}", "", f"{obj['type_desc']} · snapshot `{snapshot.name}` · object `{oid}`.", "",
                 "Evidence: catalog structure and static SQL. Business semantics require the cited documentation and reviewed process dossiers; names alone do not prove behavior.", ""]
        if columns[oid]:
            lines += ["## Columns", "", table(["Column", "Type", "Nullable", "Identity", "Computed"],
                [(x["name"], type_text(x), x["is_nullable"], x["is_identity"], x["is_computed"]) for x in columns[oid]])]
        if params[oid]:
            lines += ["## Parameters / return type", "", table(["Position", "Name", "Type", "Output", "Read only"],
                [(x["parameter_id"], x["name"] or "RETURN", type_text(x), x["is_output"], x["is_readonly"]) for x in params[oid]]),
                "T-SQL parameter defaults are not reliably exposed by sys.parameters. Consult the source definition; string defaults are redacted here.", ""]
        if module:
            lines += ["## Static implementation", "", f"[Redacted SQL](../sql/{oid}.sql). Original definition SHA-256: `{safe_modules[-1]['source_definition_sha256']}`.", "",
                "Statement tokens (lexical, not access-mode proof): " + (", ".join(verbs) or "none") + ".",
                "Features detected: " + (", ".join(k for k, v in features.items() if v) or "none of the monitored patterns") + ".", "",
                "String literals and comments are omitted, including dynamic SQL content and status constants. This copy cannot establish exact predicates or execute correctly.", ""]
        if indexes[oid]:
            lines += ["## Indexes", "", table(["Name", "Type", "Unique", "Primary key", "Disabled"],
                [(x["name"], x["type_desc"], x["is_unique"], x["is_primary_key"], x["is_disabled"]) for x in indexes[oid]])]
        if fks[oid]:
            lines += ["## Foreign keys", "", table(["Constraint", "Target", "Delete", "Update", "Trusted"],
                [(x["name"], by_id.get(x["referenced_object_id"], {}).get("qualified_name", x["referenced_object_id"]),
                  x["delete_referential_action_desc"], x["update_referential_action_desc"], not x["is_not_trusted"]) for x in fks[oid]])]
        if resolved:
            lines += ["## Static dependencies", ""] + [f"- [{by_id[x]['qualified_name']}]({x}.md)" for x in resolved if by_id[x]["type"] in {"U","P","FN","IF","TF","TR","V","SO"}] + [""]
        lines += ["## Runtime evidence", "", f"{runtime_summary['evidence']}: {runtime_summary['interval_rows']} object/replica/interval rows; {runtime_summary['statement_executions']} statement executions. These are not whole-procedure calls or end-to-end process durations.", ""]
        refs = object_matches[oid]
        if refs:
            lines += ["## AIM / SDK identifier references", ""]
            seen = set()
            for ref in refs:
                if ref["article_id"] in seen:
                    continue
                seen.add(ref["article_id"])
                a = articles[ref["article_id"]]
                lines.append(f"- [{a['module']}: {a['title']}](../../{a['reading_path']}) — `{a['article_id']}`, node `{ref['node_id']}`. Exact identifier mention; semantic equivalence unverified.")
        write_text(OUT / "objects" / f"{oid}.md", "\n".join(lines) + "\n")
        summaries.append([f"[{obj['qualified_name']}](objects/{oid}.md)", obj["type"], obj["domain_candidate"], len(columns[oid]), len(params[oid]), len(resolved), len(refs), len(runtime[oid])])
    atomic_json(OUT / "catalog/modules.json", safe_modules)
    atomic_json(OUT / "mappings/identifier-crosswalk.json", matches)
    atomic_json(OUT / "mappings/articles.json", list(articles.values()))
    atomic_json(OUT / "evidence/capture-manifest.json", manifest)
    atomic_json(OUT / "catalog/dependency-edges.json", [{"from_object_id": oid, "to_object_id": target,
        "kind": "STATIC_SQL_REFERENCE"} for oid, rows in deps.items() for target in sorted({x["referenced_id"] for x in rows if x["referenced_id"] in by_id})])
    overview = {"snapshot_id": snapshot.name, "objects": len(objects), "counts": dict(Counter(o["type_desc"] for o in objects)),
        "columns": sum(map(len, columns.values())), "parameters": sum(map(len, params.values())),
        "sql_modules": len(modules), "missing_definitions": sum(x["definition"] is None for x in modules.values()),
        "foreign_keys": sum(map(len, fks.values())), "indexes_including_heaps": sum(map(len, indexes.values())),
        "static_dependencies": sum(map(len, deps.values())),
        "unresolved_dependencies": sum(x["referenced_id"] is None for rows in deps.values() for x in rows),
        "crosswalk_mentions": len(matches), "crosswalk_objects": len(object_matches), "crosswalk_articles": len(articles),
        "runtime_objects": len([k for k,v in runtime.items() if v]), "runtime_rows": sum(map(len, runtime.values())),
        "domain_candidates": dict(Counter(o["domain_candidate"] for o in objects if o["type"] in {"U","P","FN","IF","TF","TR","V"})),
        "static_feature_counts": {k: sum(c["static_features"][k] for c in cards if c["object_id"] in modules) for k in next(iter(cards))["static_features"]},
        "schema_catalog_stable": load(snapshot, "objects") == load(snapshot, "objects_at_end"),
        "captured_query_classes": sum(x["status"] == "CAPTURED" for x in manifest["queries"].values()),
        "unavailable_query_classes": [k for k,v in manifest["queries"].items() if v["status"] != "CAPTURED"]}
    # defaultdict lookups must not inflate exact-match coverage.
    overview['crosswalk_objects'] = len({x['object_id'] for x in matches})
    runtime_ids = {k for k,v in runtime.items() if v}
    overview['runtime_resolved_objects'] = len(runtime_ids & by_id.keys())
    overview['runtime_unresolved_object_ids'] = sorted(runtime_ids - by_id.keys())
    processes = process_catalog(matches, by_id)
    overview['process_summary_articles'] = len(processes)
    overview['process_summary_titles'] = len({x['title'] for x in processes})
    overview['process_summary_families'] = len({x['title'].split(' Process Summary')[0] for x in processes})
    atomic_json(OUT / "evidence/summary.json", overview)
    (OUT / "OBJECT_INDEX.md").write_text("# Object index\n\nDomains are name-based navigation candidates, not approved semantic classifications. Runtime rows are Query Store statement aggregates.\n\n" + table(["Object", "Type", "Domain candidate", "Columns", "Parameters", "Dependencies", "Doc mentions", "Runtime rows"], summaries), encoding="utf-8")
    (OUT / "SCHEMA.md").write_text("# Schema and physical layout\n\n" + table(["Object class", "Count"], sorted(overview["counts"].items())) + "\nAll observed user objects belong to dbo. The catalog JSON supplies complete observed columns, keys, constraints, index composition, types, storage and dependencies. [Object index](OBJECT_INDEX.md) links individual dictionaries.\n\n" + table(["Logical file", "Type", "Size pages", "Growth", "Percent growth"], [(x["name"],x["type_desc"],x["size"],x["growth"],x["is_percent_growth"]) for x in load(snapshot,"files")]) + "\nFile size is allocated catalog metadata, not row volume. Physical paths, row samples, histogram values, identity last values and partition row counts were not collected.\n", encoding="utf-8")
    for label in sorted(set(c["domain_candidate"] for c in cards)):
        subset = [r for r in summaries if r[2] == label]
        path = OUT / "domains" / f"{label}.md"
        path.parent.mkdir(exist_ok=True)
        path.write_text(f"# {label.title()} navigation candidates\n\nClassified by object names. Confirm semantics with definitions and AIM/SDK evidence. Links resolve from the root [object index](../OBJECT_INDEX.md).\n\n" + table(["Object", "Type", "Domain", "Columns", "Parameters", "Dependencies", "Doc mentions", "Runtime rows"], [[r[0].replace('](objects/', '](../objects/'), *r[1:]] for r in subset]), encoding="utf-8")
    print(json.dumps(overview, indent=2))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("snapshot", type=Path)
    build(parser.parse_args().snapshot)
