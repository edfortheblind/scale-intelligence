# Safe dependency-token supplement

This supplement adds selected dependency values to the original hash-only attribute and event-parameter capture. It preserves the original 21 capture artifacts and receipts. No business-table queries, routine calls, API requests or configuration changes were made.

The collector considered **2,351 configuration rows**, accepted **2,306** and omitted **45**. Accepted tokens belong to **142 main-screen records**. These are static configuration references, not evidence that a procedure or endpoint was executed successfully.

| Accepted token category | References | Distinct values |
|---|---:|---:|
| Database table/column identifier | 617 | 353 |
| Security checkpoint | 477 | 24 |
| Form ID | 220 | 94 |
| Relative API path | 451 | 184 |
| Stored-procedure identifier | 95 | 74 |
| Callback identifier | 218 | 21 |
| Confirmation/information resource code | 71 | 65 |
| Grid-binding field identifier | 157 | 46 |

The accepted source rows are **1,416 attributes** and **890 event parameters**. The 45 omissions consist of 13 empty/null API-path values, 29 API-path values outside the strict grammar, and three database-identifier values outside the strict grammar. Rejected values are not retained by this supplement; their original hash, byte length and omission reason remain available.

## Selection and grammar

The fixed query selects only actual captured names from explicit name allowlists. Attributes cover `data-dbtable`, `data-dbcolumn`, `data-formId`, `data-securityCheckpoint`, specifically named stored-procedure attributes, and specifically named API-service attributes. Parameters cover named service URLs, `PostData_storedProcedure`, grid-binding parameter names, confirmation/information resource codes and named callbacks. Generic payload, input-value, free-text, query-value, SQL and script parameter names are excluded.

Identifier tokens must be ASCII identifiers; database/procedure/callback identifiers may have up to four dotted components. Form IDs must contain one to nine digits. Checkpoints may be numeric or a simple identifier. Grid fields and resource codes must be simple identifiers. Values are not trimmed, unquoted, evaluated or converted into executable code.

API paths must be relative and begin with `api/`, `scale/api/`, or a single ASCII area segment followed by `/scaleapi/`, with an optional leading slash. Subsequent segments must be static-looking ASCII identifiers; purely numeric segments are excluded. The only allowed question mark is a final empty `?`. Queries with values, fragments, traversal, external hosts, whitespace and quoted expressions are rejected. **Path grammar alone does not prove endpoint semantics.** Exact selected configuration-name context and recorded source hashes qualify the result.

For example, the Purchase Order Insight close action, control **51621**, has checkpoint **21**, confirmation resource `MSG_PURCHASEORDER13`, path `/inbound/scaleapi/PurchaseOrderApi/PurchaseOrders-Closed?`, grid-binding fields `ObjectId` and `PurchaseOrderId`, and callback `_webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback`. These are configured references; this audit did not close a purchase order or call the endpoint.

## Schema and evidence

[safe-dependency-tokens.json](safe-dependency-tokens.json) contains one row per selected attribute/parameter. `source_table` and `object_id` identify the source configuration row. `form_id`, `main_ui_screen_id` and `screen_control_id` come from the existing control-to-group-to-part-to-screen relationships. Parameters additionally have `screen_control_event_id`; attributes have null there. `accepted` determines whether `safe_value` is present. `token_kind`, `configuration_name`, active/system-created flags, UTF-16LE byte length, source hash and omission reason are retained.

[The manifest](safe-dependency-token-manifest.json) records exact SQL, bound configuration-name allowlists, grammar, replica identity, timings, row counts and output hash. [The summary](safe-dependency-token-summary.json) contains the counts above. [The verification receipt](safe-dependency-token-verification.json) confirms source-hash matching, original-artifact preservation and accepted/rejected grammar cases.

Commands completed with exit code **0**:

```powershell
python Snapdragon/tools/collect_safe_dependency_tokens.py
python -m py_compile Snapdragon/tools/collect_safe_dependency_tokens.py
```

All 2,351 value hashes match their existing hash-only source rows. This supplement supplies references suitable for dependency mapping; source-code reconciliation, conditional behavior, permissions, execution and save/apply acceptance remain separate work.
