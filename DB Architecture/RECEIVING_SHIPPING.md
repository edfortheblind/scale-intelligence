# Receiving, yard links and shipping status

This batch reviews ten complete module bodies: five non-work triggers, a receipt container identifier helper, locating-rule retrieval, ship-confirm status propagation, action-to-status mapping and warehouse time conversion. It adds seven plain-language topics, 15 authored evaluation cases, 20 role records and five partial process-family associations. No family is marked completely reconciled.

The [batch ledger](mappings/batches/receiving-shipping.json) records exact snapshot `20260929T214106Z` object IDs, original definition hashes, redacted source hashes/spans, inputs, NULL/default behavior, outputs, ordered effects, configuration, errors, transaction/concurrency boundaries and missing external evidence. All ten private original module hashes were checked. No procedures, triggers, operational records or current configuration values were accessed through a database connection.

## Why a receipt trailer link changes

AIM says that yard processing requires receipts to be associated with trailer IDs. It describes trailer check-in, yard/dock movement and checkout as separate actions. The database triggers below implement part of the receipt association; they do not move a trailer physically. [AIM Yard Management, node n68](../AIM/reading/ea0dcdbe8b292306e502eb84dc28fca30d15b41c916d24a683648f70412fd7a9.md).

| Database event | What the captured body does | Important difference |
| --- | --- | --- |
| Receipt inserted | Link affected receipts to matching trailer/warehouse yard records with numeric status 0; copy stamps and use UTC now. | Inner join leaves unmatched receipts unchanged. |
| Receipt UPDATE targets trailer ID | Refresh link through a left join using the same trailer/warehouse/status match. | A missing match clears the yard link. Targeting the column is sufficient even when its value stays the same. |
| Yard record inserted | Attach existing matching receipts that have no yard link and trailing status other than 900. | No test of the inserted yard status is present. |

Evidence: [receipt INSERT trigger, lines 3–30](sql/720057651.sql#L3), [receipt UPDATE trigger, lines 3–33](sql/736057708.sql#L3), [yard INSERT trigger, lines 4–25](sql/784057879.sql#L4).

Changing only the receipt warehouse does not satisfy the trailer-column gate. Multiple matching yard records can make an UPDATE's source assignment nondeterministic. The yard status column is `nchar`, but the receipt triggers compare it with numeric zero; nonnumeric text can therefore produce an implicit-conversion failure. No stored values were inspected. Numeric 0 and 900 are source predicates, not verified deployment-specific business labels.

The receipt's yard link is nullable and has an enabled, trusted foreign key to the yard record ID. That constrains the referenced ID; it does not prove matching trailer/warehouse or a valid business state. Clearing the link is allowed by nullability. Updates made by the receipt-insert/yard-insert triggers do not target `TRAILER_ID`, so the receipt-update trigger's guarded body is not entered by those statements.

What to check: identify the initiating event, warehouse/trailer match, existing link and coded status predicates. The actual caller, permissions, nested-trigger settings and present records remain unknown. Trigger errors participate in the initiating statement transaction.

## Container tree and accessorial effects

When a shipping container is inserted without a parent and with a NULL or negative tree-unit number, its INSERT trigger sets `TREE_UNIT` to its own internal container number. Zero and positive values are left alone. Child containers are excluded even when their tree unit is missing. The trigger creates no extra container and changes no quantity or status. [Container tree trigger, lines 2–13](sql/768057822.sql#L2).

The shipping-container parent foreign key points to another container ID; it does not govern the separate `TREE_UNIT` column. The shipment foreign key is enabled but untrusted in this snapshot, so the catalog does not certify all existing associations. This is not evidence that a bad row currently exists.

The accessorial trigger handles **INSERT and UPDATE**, despite its name ending in `_a_i`. If an inserted/updated row has a negative internal number, it computes an association key from container number when nonzero, otherwise shipment number. It updates negative target rows sharing that association. The target is not restricted to inserted primary keys, so existing rows with the same association can also change. No charge calculation or carrier request is performed. [Accessorial trigger, lines 3–31](sql/752057765.sql#L3).

What to check: distinguish event, inserted-row gate and target UPDATE scope. If a replacement identifier remains negative, the accessorial gate may remain true; effective recursion settings and data constraints are required before predicting repeated behavior. No runtime defect was reproduced.

## What ship confirmation changes

AIM describes packing, dock processing, load confirmation and departure as related stages. The reviewed SQL routine implements bounded status/storage effects, not all those external stages. [AIM Packing/Shipping, node n65](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md).

1. Queue unprocessed alert requests for matching active alert definitions when the shipment status appears to advance and a matching alert/source/new-status request is not visible.
2. Write the supplied new status to the shipment header, UTC actual-ship/stamp times and warehouse-local status dates.
3. Shift and consolidate detail status/quantity slots according to the supplied limit, excluding detail rows whose first status is numeric 995.
4. Update shipping-container statuses, then the independently supplied load: leading status becomes the supplied new status and trailing status is the minimum of that load's linked shipment statuses.

Evidence: [alert/header logic, lines 26–78](sql/1809753850.sql#L26), [detail history, lines 81–286](sql/1809753850.sql#L81), [container/load effects, lines 289–306](sql/1809753850.sql#L289).

The header UPDATE does not repeat the advancing-status guard used for alert insertion. The routine does not validate that the supplied load belongs to the supplied shipment or that the requested transition is allowed. The detail algorithm retains a suffix beginning at the first qualifying history slot; it is not an independent filter of every later slot. The final detail UPDATE re-evaluates `status1 <> 995` after the preceding UPDATE assigns the new status. If the caller supplied 995, rows just assigned 995 skip that compaction step; the statements do not share a frozen original row set. Its expected history ordering therefore needs caller/invariant evidence. Included nullable historical quantities can propagate NULL into a nonnullable first-slot quantity and fail.

The body owns no transaction, rollback or error handler. Its `NOLOCK` alert reads plus `NOT EXISTS` do not guarantee duplicate-free concurrent requests. Several successful writes can precede a later failure, depending on the caller/session transaction. Repeated calls rewrite timestamps and can repeat detail processing; idempotency is unproven.

What to check: caller status/limit, shipment/load relationship, alert configuration, timezone and transaction ownership. A queued request does not establish delivered notification. Changed status does not establish carrier acceptance, label printing, physical departure or complete inventory movement.

## Container identifier generation is not a harmless lookup

`REC_CreateNewUniqueContainerId` checks proposed text against logistics units, parent logistics units and receipt container IDs. On a collision, it derives a numeric candidate from convertible maxima, or scans from one when the coded ceiling is reached. It then **updates a receipt container**, comparing the same input with `INTERNAL_REC_CONT_NUM`. The caller's intended meaning for that overloaded argument remains unresolved. [Helper, lines 9–59](sql/2103678542.sql#L9).

The numeric candidate can normalize leading zeros; alphanumeric input can fail conversion. NULL input matches no equality rows. A collision with no convertible numeric maximum can leave a NULL candidate, and an overflowing maximum can fail before the wrap search. A private literal exclusion pattern remains a documented candidate-eligibility gap; it was not copied into the output.

On the collision branch, the procedure emits a candidate result before UPDATE and another afterwards. Without a collision it emits only the final result. Receiving an early result is not proof that the change succeeded. No reservation lock, owned transaction or sequence allocator prevents concurrent callers from choosing the same candidate. The captured sequence object is not referenced by this body.

What to check: the caller's argument contract, expected result-set count, numeric format and concurrency protocol. Do not execute this helper as a configuration-only check. AIM's receipt-container check-in description does not make this helper a complete receiving workflow. [AIM Receiving, node n65](../AIM/reading/b9c3ffa9a81498cb548bdb61d00ba2dd34e5bfb79695f24b28a31d26d9eb8369.md).

## Looking up locating rules and statuses

The locating helper returns the header whose name equals the input. Its captured primary key supports at most one exact match. It has no activation filter, so an inactive header can be returned; NULL/missing names produce no row. It does not select a destination, advance rule sequences or create putaway work. The receipt-container locating-rule foreign key supports a schema association, not effective application selection. [Lookup, lines 8–15](sql/1175323597.sql#L8).

AIM describes locating as applying rule sequences and strategies. Its pre-locate path requires both Delayed Locating and Create Putaway Work; a single flag is insufficient. The captured delayed-locating default is N, but a default is not a present-tense setting. [AIM Locating, nodes n64, n102, n105, n113](../AIM/reading/4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa.md).

The action-to-status function first maps an action through generic configuration, then maps its system-status value to a numeric status within the supplied functional area. Missing mappings return NULL. Multiple qualifying status rows are assigned without ordering. No current transaction, custom flow, activation or user/warehouse authorization is checked. It is not proven to be called by the ship-confirm routine. [Action resolver, lines 18–47](sql/2113754933.sql#L18).

AIM's status concepts explain line flows and header progress, but do not supply this deployment's active mappings or prove an allowed transition for an individual shipment. [AIM Status, nodes n63, n74, n80, n89, n190](../AIM/reading/5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d.md).

## UTC timestamps and local status dates

The warehouse conversion function replaces NULL date input with UTC now, interprets the supplied datetime as UTC and converts it using `WAREHOUSE.TIME_ZONE`. Its return type is `DATETIME`, which does not preserve the offset. Ship confirmation converts that result to a calendar date for status-date columns while separately using UTC timestamps. [Timezone function, lines 13–26](sql/1000702963.sql#L13).

The declared default is NULL; scalar-function expressions should pass `DEFAULT` explicitly rather than assuming stored-procedure-style argument omission. Missing or invalid warehouse timezone has no safe fallback in this function. A caller supplying local time will still have it interpreted as UTC. No current timezone, daylight-saving boundary or actual conversion was tested.

## Evidence still required

Five unresolved static references named `inserted` are dispositioned as trigger pseudo-tables; original catalog entries remain intact. Ten constraint/default/sequence notes bind relevant schema evidence without claiming current data validity or operational execution. All five trigger bodies are associated with their captured enabled events.

Five process families receive partial associations: Receiving, Locating, Packing/Shipping, Status and Yard Management. Complete reconciliation still needs caller contracts, active settings, status meaning, receiving/locating algorithms, carrier/printing/alert handoffs and transaction/concurrency evidence. The authored question cases have not been run against a working app. Insight navigation, SOPs and user/accessibility acceptance remain separate.
