# Unnamed historical runtime identities

All nine historical IDs without a captured current-catalog name now have a bounded retained-evidence disposition. Their historical names, object types, definitions and causes of absence remain unknown. The catalog-name match stays **154/163 (94.48%)**; **9/9** measures only completion of this bounded review.

The nine profiles bind **1,377 retained rows** and **1,251,029 statement executions**. Every profile keeps replica group **1**, role type **1** and execution type **Regular**. These are historical statement aggregates, not procedure call counts or whole-process elapsed times.

The [identity ledger](mappings/runtime-identity-disposition.json) records source SHA-256 values, exact JSON profile pointers, raw-row ranges and interval IDs. Raw-row ranges below are inclusive and zero-based in [query_store_runtime.json](catalog/query_store_runtime.json); profile indices are zero-based in [runtime-profiles.json](mappings/runtime-profiles.json).

| Historical object ID | Profile index | Raw row range | Rows | Statement executions | Weighted mean statement ms |
| --- | ---: | --- | ---: | ---: | ---: |
| 140123840 | 4 | 111-132 | 22 | 13,854 | 0.725468 |
| 558937363 | 21 | 163-169 | 7 | 3,622 | 0.968784 |
| 622937591 | 26 | 175-180 | 6 | 87 | 12.301713 |
| 638937648 | 28 | 183-188 | 6 | 310 | 4.292142 |
| 776650110 | 39 | 211-944 | 734 | 637,756 | 2.402267 |
| 906798638 | 49 | 962-1267 | 306 | 315,302 | 3.291512 |
| 1195463633 | 81 | 1335-1389 | 55 | 54,236 | 2.512664 |
| 1574556943 | 125 | 1485-1511 | 27 | 6,645 | 0.193238 |
| 1811797812 | 140 | 1538-1751 | 214 | 219,217 | 2.120550 |

| Historical object ID | Earliest retained interval start (UTC) | Latest retained interval end (UTC) |
| --- | --- | --- |
| 140123840 | 2026-02-12T15:00:00Z | 2026-02-14T16:00:00Z |
| 558937363 | 2026-08-14T13:00:00Z | 2026-08-14T20:00:00Z |
| 622937591 | 2026-08-14T13:00:00Z | 2026-08-14T20:00:00Z |
| 638937648 | 2026-08-14T13:00:00Z | 2026-08-14T20:00:00Z |
| 776650110 | 2025-11-16T16:00:00Z | 2026-02-14T17:00:00Z |
| 906798638 | 2026-08-17T10:00:00Z | 2026-09-19T20:00:00Z |
| 1195463633 | 2026-08-11T12:00:00Z | 2026-08-15T21:00:00Z |
| 1574556943 | 2026-02-12T15:00:00Z | 2026-02-14T17:00:00Z |
| 1811797812 | 2026-02-17T11:00:00Z | 2026-03-14T20:00:00Z |

No row in the captured 3,022-object catalog or 1,142-module catalog matches any of these nine IDs. The retained aggregate fields provide no historical object name or definition. The procedure, function and trigger cache-statistics exports are empty and supply no missing mapping. The review does not infer deletion, renaming, replacement, non-use, or a particular deployment change.

Historical identity would require an existing versioned inventory or deployment history explicitly mapping the numeric ID to its name/type/definition over the retained intervals. That is a future evidence option, not a request to query the warehouse or unfreeze deployed-process work. Current-name matches for the other 154 IDs also do not prove historical definition identity.

The interval boundaries do not establish continuous observation, and the role catalog does not prove current topology. No new connection, operational execution, monitoring change or transactional data was used. Deployed-process reconciliation and correlated timing remain frozen at **0/34**. See [runtime interpretation](RUNTIME.md) for the retained telemetry limits.
