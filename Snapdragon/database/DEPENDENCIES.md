# Selected configuration dependencies

The replica supplement maps **2,306 selected configuration values across 142 Screen records**, from 2,351 candidate attribute/parameter rows. The remaining 45 values are omitted. Values appear beside their owning controls in the [254 screen dossiers](../screens/INDEX.md).

This answers where a screen points: its configured table/column names, linked form IDs, permission checkpoints, service paths, stored-procedure identifiers, callbacks and grid-field bindings. It does not prove that a dependency exists, that the current role can invoke it, or what the invocation does.

| Dependency kind | Accepted rows | Distinct values | Meaning and limit |
|---|---:|---:|---|
| Database identifiers | 617 | 353 | Configured table/column tokens; object existence and effective query semantics require follow-up |
| Security checkpoints | 477 | 24 | Configured checkpoint identifiers; current-user permission outcomes are unverified |
| Linked form IDs | 220 | 94 | Form references inside control attributes; not automatically standalone runtime URLs |
| Relative API paths | 451 | 184 | Configured static-looking service paths; no request was issued |
| Stored-procedure identifiers | 95 | 74 | Named procedure dependencies; no routine was executed |
| Callback identifiers | 218 | 21 | Configured client callback names; implementation and runtime effects are unverified |
| Message/resource codes | 71 | 65 | Confirmation/information resource references; not translated message text |
| Grid-field identifiers | 157 | 46 | Field names supplying action/query parameters; no selected record values |

Rows may repeat a dependency on several controls or screens. Distinct counts are calculated within each kind, not across unrelated identifier namespaces. Active/system flags are retained in the supplement and dossiers; these totals include inactive configuration.

## Trace a configured action

1. Locate the Form and Screen in the [screen index](../screens/INDEX.md).
2. Follow the Screen part, parent group and control IDs in that dossier.
3. Read the control's event handler and event parameter names.
4. Match the selected dependency values by source object ID, control ID and event ID. Keep attribute IDs separate from parameter IDs.
5. Use the [configuration model](../reference/CONFIGURATION_MODEL.md) and available source definitions to establish semantics. A descriptive API or procedure name alone does not establish business behavior.

For Purchase Order 2796 / Screen 1776, the [browser-verified Close walkthrough](../screens/purchase-order-configuration.md) connects control 51621 to event 18040, checkpoint 21 and five parameters. Its configured service path is `/inbound/scaleapi/PurchaseOrderApi/PurchaseOrders-Closed?`; the trailing question mark contains no query payload. Reading this binding did not submit a Close request.

## Collection and verification

The [manifest](safe-dependency-token-manifest.json) records fixed SELECT statements, exact configuration-name allowlists, token grammars, read-only replica identity and the output hash. Collection reads only the selected configuration tables. Accepted strings must fit bounded identifier, numeric-ID or relative service-path grammar. No trimming, unquoting or expression evaluation is applied.

Relative paths permit an `api`, `scale/api` or one-area `scaleapi` prefix and bounded ASCII path segments. They exclude external hosts, traversal, fragments and populated query strings. Only an empty terminal `?` is accepted. This syntax check does not establish endpoint semantics or prove that every path segment is free of record-like content.

Rejected values are not retained; their source IDs, byte lengths, hashes and omission category remain auditable. The original 21 hash-only capture artifacts are unchanged. Each supplement row matches its original UTF-16LE fingerprint and parent relationships. Raw SQL expressions, arbitrary attribute/parameter values, business rows and credentials remain outside this package.

Evidence: [selected tokens](safe-dependency-tokens.json), [summary](safe-dependency-token-summary.json), [manifest](safe-dependency-token-manifest.json), [offline verification](../evidence/verification.json). The [collector](../tools/collect_safe_dependency_tokens.py) is separate from ordinary offline dossier generation.
