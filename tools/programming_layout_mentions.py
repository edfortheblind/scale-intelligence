"""Bounded, non-credit comment mentions in captured routine definitions.

No database access, file writes, or raw comment text output occurs here. A table
name in prose can be an ordinary word: these records establish only a textual
mention, never a bound SQL reference, execution, lifecycle, or vendor origin.
"""
from __future__ import annotations

from collections import defaultdict
import hashlib
import re

from report_table_usage import lex_sql


PRIMARY_TYPES = frozenset({"P", "FN", "IF", "TF"})
_IDENTIFIER = re.compile(r'\[(?:[^\]]|\]\])*\]|"(?:[^"]|"")*"|[\w@$#]+', re.UNICODE)


def _identifier_value(text: str) -> str:
    if text.startswith("["):
        return text[1:-1].replace("]]", "]")
    if text.startswith('"'):
        return text[1:-1].replace('""', '"')
    return text


def comment_mentions(objects: list[dict], modules: list[dict]) -> dict[int, list[dict]]:
    """Return original-comment identifier mentions keyed by captured U table ID.

    Only P/FN/IF/TF definitions are scanned. Identifier spelling is matched
    case-insensitively to a unique captured table name; ambiguous names are
    omitted rather than bound by an assumed schema. Bracket/double-quote forms
    are decoded, while @variables and #temporary names remain separate tokens.
    The first occurrence for each routine/table/source-line tuple is retained.
    Lines are one-based; offsets are zero-based Python string character indices
    into the original definition (half-open), not UTF-8 byte offsets.
    """
    object_map = {obj["object_id"]: obj for obj in objects}
    if len(object_map) != len(objects):
        raise ValueError("Duplicate captured object identity")
    names: dict[str, list[dict]] = defaultdict(list)
    for obj in objects:
        if obj["type"] == "U":
            names[obj["name"].casefold()].append(obj)

    result: dict[int, list[dict]] = defaultdict(list)
    seen_modules: set[int] = set()
    seen_mentions: set[tuple[int, int, int]] = set()
    for module in sorted(modules, key=lambda row: row["object_id"]):
        module_id = module["object_id"]
        obj = object_map.get(module_id)
        if not obj or obj["type"] not in PRIMARY_TYPES:
            continue
        if module_id in seen_modules:
            raise ValueError("Duplicate captured routine identity")
        seen_modules.add(module_id)
        definition = module.get("definition")
        if not isinstance(definition, str) or not definition:
            raise ValueError("Captured routine definition unavailable")
        source_hash = hashlib.sha256(definition.encode("utf-8")).hexdigest()
        expected_hash = module.get("source_definition_sha256")
        if expected_hash is not None and expected_hash != source_hash:
            raise ValueError("Captured routine definition hash mismatch")

        for token in lex_sql(definition, module.get("uses_quoted_identifier", True)):
            if token.kind != "COMMENT":
                continue
            for match in _IDENTIFIER.finditer(token.text):
                candidates = names.get(_identifier_value(match.group()).casefold(), [])
                if len(candidates) != 1:
                    continue
                table = candidates[0]
                table_id = table["object_id"]
                line = token.line + token.text.count("\n", 0, match.start())
                identity = (module_id, table_id, line)
                if identity in seen_mentions:
                    continue
                seen_mentions.add(identity)
                result[table_id].append({
                    "module_id": module_id,
                    "module_type": obj["type"],
                    "source_line": line,
                    "source_start_offset": token.start + match.start(),
                    "source_end_offset": token.start + match.end(),
                    "offset_unit": "UNICODE_CHARACTER_HALF_OPEN",
                    "table_object_id": table_id,
                    "table_qualified_name": table.get("qualified_name") or
                        table["schema_name"] + "." + table["name"],
                    "source_definition_sha256": source_hash,
                    "status": "COMMENT_IDENTIFIER_MENTION",
                    "counts_as_routine_reference": False,
                    "binding": "UNIQUE_CAPTURED_TABLE_NAME_TOKEN_NOT_SQL_BINDING",
                })
    return {table_id: rows for table_id, rows in sorted(result.items())}
