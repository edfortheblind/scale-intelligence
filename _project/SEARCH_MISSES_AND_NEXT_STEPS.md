# Search misses and next-session work

Prepared 2026-09-30 for owner review. This report lists every one of the **39 current stored search misses**, with the exact question, expected topic, and eight topics actually returned. It also explains the frozen deployment workstream.

## What the percentages mean

| Measure | Result | Meaning |
| --- | ---: | --- |
| Expected topic among the first eight results | **686/725 — 94.62%** | The authored question found its designated topic in the visible result set. |
| Expected topic first | **420/725 — 57.93%** | The designated topic was ranked first. |
| Expected topic absent from the first eight | **39/725 — 5.38%** | These are the cases listed below. |
| Selected-topic presentation checks | **725/725 — 100%** | Explicitly opening the designated topic preserved its required presentation and sources; this is separate from finding it through search. |

A miss means the preselected topic was absent from the first eight results. Some returned topics may still answer the question. These were authored evaluation questions, not an independent set of questions from intended users, and answer quality was not automatically scored. Reviewing the wording and expected answer is therefore part of resolving the misses.

The recorded diagnosis groups them as follows. The categories explain possible causes; all 39 remain misses.

| Recorded category | Cases | Share of the 39 misses |
| --- | ---: | ---: |
| Missing subject, such as “the routine” or “this gate” without its name | 19 | 48.72% |
| Broad subject that could refer to several operations | 13 | 33.33% |
| Specific subject with a substantive retrieval gap | 7 | 17.95% |

## How to review a case

Read the question and the expected explanation, then compare the eight returned titles. Record your comments beside the stable case ID. The useful decisions are: whether the wording makes sense, which SCALE subject you intended, whether the expected topic is appropriate, and whether a returned answer is also acceptable. A title alone is insufficient to approve an answer; the next session can open the relevant topic and its sources.

Original spelling and joined words are preserved, including `and100`, `outputs0`, `returnNULL`, and `percentage0`. Technical words in some cases come from the authored database questions: a “routine” is a database procedure or function; “NULL” means no value; “no row” means no matching result; an “atomic” operation succeeds or rolls back as one unit.

The actual result order below comes from the current stored evaluation. Full-list ranks come from the older C9 diagnostic run and are explicitly labeled historical. No fresh search run was performed to create this report. The seven specific-subject ranks were also reproduced in the C11 diagnostic probe.

## Seven specific-subject cases to review first

- [Case 07: Does reservation prove stock left?](#miss-07) — `inventory-quantity-buckets:1`
- [Case 26: Are work date windows always a full local calendar day?](#miss-26) — `fn-dashboard-kpis:2`
- [Case 29: Must minimum component item and minimum line ID come from one component?](#miss-29) — `view-work-order-aggregation:1`
- [Case 30: Do two serial rows necessarily mean two separate inventory balances?](#miss-30) — `view-inventory-grain:1`
- [Case 31: Is total ordered quantity net of allocation?](#miss-31) — `view-order-quantity-and-balance:1`
- [Case 34: Does receipt selection prove upload delivered?](#miss-34) — `dynamic-configured-filters:2`
- [Case 38: Does shipment-detail fallback use internal shipment number?](#miss-38) — `warehouse-export-field-fallback:1`

C15 rewrote these seven questions after inspecting the known misses. All seven rewrites found the expected topic in the first eight, and two ranked first. Each rewrite is shown beside its original case as a diagnostic aid. This does not recover the original misses or establish independent user acceptance.

## All 39 misses

<a id="miss-01"></a>

### Case 01 — shipment-detail:2

**Exact question:** Does the routine return five result sets?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Understanding shipment detail fields — `shipment-detail`.

**Expected topic explains:** The summary combines the shipment header, containers, dock door and shipment lines. For some line-level fields, SCALE returns a blank summary when the lines contain different non-null values. A blank summary therefore does not always mean information is missing.

**Historical full-list rank:** 110 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** The routine is unnamed; many routines discuss result sets. The expected topic has a fifth-result exclusion, whereas the question uses five.

**Actual first eight topics, in order:**

1. Database and table size result sets — `performance-space-used`
2. Item, lookup and monitoring selection boundaries — `presentation-selection-boundaries`
3. Why inventory monitor tiles and drilldowns can disagree — `inventory-monitor-scope`
4. Activity summary result sets — `performance-activity-six-results`
5. How work confirmation advances related record status — `work-status-dispatch`
6. Why Inventory Insight counts can differ from the selected detail — `inventory-insight-count-scopes`
7. Maintenance commands and partial outcomes — `dynamic-maintenance-effects`
8. What the archive purge helpers can change — `operations-archive-control`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-02"></a>

### Case 02 — work-selection:3

**Exact question:** Does a profile select one deterministic detail row?

**Recorded category:** Broad subject: several SCALE topics could reasonably match. (`BROAD_SUBJECT`)

**Expected topic:** Understanding which work is offered — `work-selection`.

**Expected topic explains:** SCALE offers work using the supplied user, warehouse, work profile, locations, containers and feature settings. A work profile is a set of execution rules. Some branches prefer assigned work, apply location/priority order or limit the candidate list. Cart selection can also rewrite instruction sequence, so this procedure must not be run as a read-only diagnostic. A profile can contain several detail rows. Some options are read without the sequence number or a defined selection order, so the settings used together need not all come from the requested sequence.

**Historical full-list rank:** 17 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Profile/detail-row selection appears in multiple reviewed configuration topics. The question omits work execution. Its matching concepts are spread across the answer and routine detail.

**Actual first eight topics, in order:**

1. Item, lookup and monitoring selection boundaries — `presentation-selection-boundaries`
2. Understanding duplicate or overlapping configuration — `duplicate-configuration`
3. How work-verification controls are derived — `work-configurator-controls`
4. Understanding multi-order pallet location choices — `view-mop-selection`
5. Understanding purchase-order detail, header and TPM views — `view-purchase-order-grain`
6. Configuring a work profile and its sequence rules — `work-profile-configuration`
7. Intraday labor estimates and active-user counts — `labor-active-intraday`
8. Understanding action-to-status mapping — `status-action-resolution`

**Your review:** Which process or screen did you mean? Is this expected topic the best answer, or is a returned topic also suitable?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-03"></a>

### Case 03 — inventory-adjustment:2

**Exact question:** Does an error guarantee all earlier changes are rolled back?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Understanding an inventory adjustment — `inventory-adjustment`.

**Expected topic explains:** An adjustment can affect source quantities, destination quantities and serial numbers. The reviewed routine checks inputs and then calls the operations required by its quantity-effect flags. These flags specify which quantity categories should change. It is therefore more than editing one quantity field.

**Historical full-list rank:** 223 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** No adjustment, routine or operation is named. Rollback and caller-transaction limits apply to many distinct reviewed operations.

**Actual first eight topics, in order:**

1. Company transfer and catch-weight boundaries — `inventory-company-catch-weight`
2. Why a cycle-count request may not be created — `cycle-count-request-not-created`
3. Form setup is a sequence of metadata helper calls — `admin-form-setup`
4. Why inventory staging can be replaced before validation finishes — `operations-inventory-staging`
5. Replenishment cancellation quantities — `awr-cancel-replenishment`
6. Why count work identity and sequence can differ — `cycle-count-work-reconciliation`
7. Wave progress and statistics refresh — `awr-wave-statistics-gate`
8. What transferring a rejected detail copies and resets — `operations-rejected-detail`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-04"></a>

### Case 04 — work-monitor-drilldown:2

**Exact question:** Can two identical warehouse filters prove the same result?

**Recorded category:** Broad subject: several SCALE topics could reasonably match. (`BROAD_SUBJECT`)

**Expected topic:** Understanding a work-type drilldown — `work-monitor-drilldown`.

**Expected topic explains:** The work-type chart is scoped to one warehouse and one work group. It shows distinct work units by type and gives instruction and estimate totals for that same group. An unassigned or missing group value selects work with no group; it does not mean every group.

**Historical full-list rank:** 22 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Warehouse filters identify a broad mechanism, but not the work-type chart/work-group drilldown. Exact-word matching improves this question and regresses others.

**Actual first eight topics, in order:**

1. Performance monitor warehouse filtering — `performance-pm-membership`
2. Understanding container counts, location and status flow — `shipping-container-location-flow`
3. Zero inventory cleanup after wave replenishment — `awr-zero-inventory-cleanup`
4. Why helper names do not prove a read-only operation — `operations-miscellaneous-side-effects`
5. Transfer presentation results and helper calls — `transfer-presentation-context`
6. Labor reports and incremental export windows — `labor-report-and-export`
7. What work-created flags do and do not prove — `work-created-and-work-written`
8. Why a cycle-count request may not be created — `cycle-count-request-not-created`

**Your review:** Which process or screen did you mean? Is this expected topic the best answer, or is a returned topic also suitable?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-05"></a>

### Case 05 — work-monitor-indicators:1

**Exact question:** Does no row mean zero work?

**Recorded category:** Broad subject: several SCALE topics could reasonably match. (`BROAD_SUBJECT`)

**Expected topic:** Understanding work indicator tiles — `work-monitor-indicators`.

**Expected topic explains:** Each tile asks a different question: aging work, urgent priority, held work, open/in-process work, or assigned in-process work. It counts distinct work units and evaluates the supplied caution and warning rules separately. The reviewed tiles do not include the chart's detail-instruction restriction, so their counts need not match. A recognized tile returns one row even when its count is zero. An unknown or NULL tile selector returns no result set from these branches; absence of a result is different from an empty work count.

**Historical full-list rank:** 21 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Work is named, but not the indicator tile or selector. No-row/zero distinctions exist across many work helpers. Process-work gets an explicit-name priority.

**Actual first eight topics, in order:**

1. Work: purpose and processing — `process-work`
2. Replenishment capacity fallback — `awr-capacity-precedence`
3. Zero inventory cleanup after wave replenishment — `awr-zero-inventory-cleanup`
4. Stored wave metric meaning — `awr-wave-metrics`
5. What a wave or pallet queue success means — `operations-dif-queues`
6. How cart selection differs from spot assignment — `cart-building-and-spots`
7. Understanding inactive work storage — `work-inactive-history`
8. Why a cycle-count request may not be created — `cycle-count-request-not-created`

**Your review:** Which process or screen did you mean? Is this expected topic the best answer, or is a returned topic also suitable?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-06"></a>

### Case 06 — work-inactive-history:2

**Exact question:** Is this always one atomic operation?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Understanding inactive work storage — `work-inactive-history`.

**Expected topic explains:** The reviewed deactivation routines copy qualifying closed instructions to inactive storage and remove matching active rows. A combined view reads both locations, so moving a row out of the active table does not necessarily remove it from a monitor. Deactivation here moves work records; it does not perform an inventory movement.

**Historical full-list rank:** 15 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** This and operation do not identify deactivation, work or inactive storage. Many reviewed operations have conditional atomicity.

**Actual first eight topics, in order:**

1. Statistics read and save contracts — `awr-statistics-store`
2. Understanding DIF message view row counts — `view-dif-message-grain`
3. Why a warehouse argument does not always limit a conversion load — `operations-assignment-capacity-loads`
4. Available-quantity branch differences — `fn-available-quantity`
5. Cached dashboard reads and refreshes — `performance-cache-read-refresh`
6. Replenishment capacity fallback — `awr-capacity-precedence`
7. Catch-weight unit sources — `fn-catch-weight`
8. BOL ordinals and lot expiration selection — `fn-bol-expiration`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-07"></a>

### Case 07 — inventory-quantity-buckets:1

**Exact question:** Does reservation prove stock left?

**Recorded category:** Specific subject: a meaningful question whose expected topic ranks too low. (`SPECIFIC_SEMANTIC_SUBJECT`)

**Expected topic:** Understanding inventory quantity categories — `inventory-quantity-buckets`.

**Expected topic explains:** On-hand means product physically at a location. Allocated means quantity reserved to leave; in-transit means quantity expected to arrive. The vendor describes available as on-hand minus allocated minus suspense. Movement code changes these categories separately, and selected availability checks can include in-transit quantity when the location rule permits it.

**Historical full-list rank:** 27 in the C9 diagnostic run. C11 reproduced the same rank. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Reservation versus physical stock is meaningful, but uses stock left rather than indexed on-hand/allocated terminology. Several returned allocation/inventory topics are relevant competitors.

**Actual first eight topics, in order:**

1. Bill-of-material inventory context — `bom-detail-context`
2. Allocation split and destination association — `awr-allocation-split`
3. Identifier and sequence suggestions — `fn-suggestions`
4. Item, lookup and monitoring selection boundaries — `presentation-selection-boundaries`
5. Inventory Management: purpose and processing — `process-inventory-management`
6. Returns: purpose and processing — `process-returns`
7. Understanding locating rule retrieval — `locating-rule-lookup`
8. Receiving returns or damaged stock — `returns-damage-status`

**C15 diagnostic rewrite:** How can an inventory reservation reduce available quantity while on-hand stock stays the same?

**Rewrite result:** expected topic ranked 1 in the recorded loopback HTTP check. This was written after examining the miss; the original case remains a miss.

**Your review:** Would you ask this question as written? Is the expected explanation the best answer, and do any returned topics answer it adequately?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-08"></a>

### Case 08 — inventory-empty-source:2

**Exact question:** Does archival prove commit?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Understanding empty source inventory — `inventory-empty-source`.

**Expected topic explains:** When resulting on-hand, allocated, in-transit and suspense quantities are all zero, the source routine can remove nonpermanent inventory. It handles serial, unit-of-measure and catch-weight links first. Permanent inventory follows a different retention path.

**Historical full-list rank:** 24 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Archival does not identify empty source inventory or the movement caller. Archive/commit limitations are shared by many reviewed routines.

**Actual first eight topics, in order:**

1. What work-created flags do and do not prove — `work-created-and-work-written`
2. Why helper names do not prove a read-only operation — `operations-miscellaneous-side-effects`
3. Wave progress and statistics refresh — `awr-wave-statistics-gate`
4. Replenishment cancellation quantities — `awr-cancel-replenishment`
5. Inventory diagnostic predicates — `performance-inventory-diagnostics`
6. Index diagnostic context — `performance-index-statistics`
7. Understanding ship-confirm database changes — `ship-confirm-status-propagation`
8. Checking label prerequisites before assuming print success — `label-prerequisites`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-09"></a>

### Case 09 — ship-confirm-status-propagation:2

**Exact question:** Can the header status only advance?

**Recorded category:** Broad subject: several SCALE topics could reasonably match. (`BROAD_SUBJECT`)

**Expected topic:** Understanding ship-confirm database changes — `ship-confirm-status-propagation`.

**Expected topic explains:** The reviewed routine writes supplied shipment, detail, container and load statuses, adjusts quantities-at-status, timestamps the records and queues matching alerts. It does not prove carrier acceptance, printing, physical departure or alert delivery. Those require evidence from the calling process.

**Historical full-list rank:** 67 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Header status is named, but not ship confirmation or the shipment header. Many inbound/outbound status helpers compete.

**Actual first eight topics, in order:**

1. Status: purpose and processing — `process-status`
2. How work confirmation advances related record status — `work-status-dispatch`
3. Fixed procedure calls and lexical dynamic flags — `dynamic-fixed-exec`
4. Understanding upload claims and serial staging — `interface-upload-batch-contract`
5. How container status changes reach a receipt header — `operations-receipt-status-rollup`
6. How shipment and load status rollups retry — `operations-shipment-status-rollup`
7. Understanding status changes at ship confirmation — `ship-confirm`
8. Why does shipment lookup return an upload copy? — `warehouse-shipment-upload-context`

**Your review:** Which process or screen did you mean? Is this expected topic the best answer, or is a returned topic also suitable?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-10"></a>

### Case 10 — receipt-container-id-generation:1

**Exact question:** Can an arbitrary alphanumeric ID pass through unchanged?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Understanding receipt container identifier generation — `receipt-container-id-generation`.

**Expected topic explains:** This helper generates a numeric receipt-container identifier, even though its input parameter is text. Nonnumeric input can fail conversion, and leading zeros can disappear during numeric conversion. It checks the supplied input as an external identifier and also uses it as the internal numeric receipt-container key for the UPDATE. The name does not guarantee global uniqueness or safe concurrent allocation.

**Historical full-list rank:** 164 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** An arbitrary alphanumeric ID does not identify receipt-container generation. The indexed explanation uses numeric conversion rather than the complete question vocabulary.

**Actual first eight topics, in order:**

1. String and XML transforms — `fn-string-xml`
2. Insight, details and transaction form registrations differ — `admin-metadata-form-paths`
3. Item, lookup and monitoring selection boundaries — `presentation-selection-boundaries`
4. Understanding QC settings versus QC execution — `shipping-qc-context`
5. Index diagnostic context — `performance-index-statistics`
6. Filter definitions, ordered terms and shared attributes — `admin-filter-registration`
7. Why adding a default configuration may leave an existing value unchanged — `configuration-seed-preservation`
8. Form setup is a sequence of metadata helper calls — `admin-form-setup`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-11"></a>

### Case 11 — status-action-resolution:1

**Exact question:** Does NULL mean status zero?

**Recorded category:** Broad subject: several SCALE topics could reasonably match. (`BROAD_SUBJECT`)

**Expected topic:** Understanding action-to-status mapping — `status-action-resolution`.

**Expected topic explains:** The helper maps an action through generic configuration to a system-status identity, then to a numeric status in the requested functional area. Missing mappings yield NULL. Multiple qualifying status rows are assigned without ordering. It does not validate an individual transaction's permitted next step.

**Historical full-list rank:** 68 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** NULL/status-zero semantics are common to multiple status functions; the action-to-status lookup is unnamed.

**Actual first eight topics, in order:**

1. Status: purpose and processing — `process-status`
2. Replenishment capacity fallback — `awr-capacity-precedence`
3. Status-slot helpers — `fn-status-slots`
4. Zero inventory cleanup after wave replenishment — `awr-zero-inventory-cleanup`
5. Status flow lookup — `fn-status-flow`
6. What a wave or pallet queue success means — `operations-dif-queues`
7. Understanding status changes at ship confirmation — `ship-confirm`
8. Stored wave metric meaning — `awr-wave-metrics`

**Your review:** Which process or screen did you mean? Is this expected topic the best answer, or is a returned topic also suitable?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-12"></a>

### Case 12 — awr-wave-statistics-gate:2

**Exact question:** Are all steps serialized by this gate?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Wave progress and statistics refresh — `awr-wave-statistics-gate`.

**Expected topic explains:** No. Guard rejection returns zero, and its normal COMMIT followed by RETURN @@ROWCOUNT also yields zero. The routine can refresh totals and progress while returning that same value. It guards selected step tokens with a table-exclusive lock; it is not the complete wave engine.

**Historical full-list rank:** 23 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** This gate has no supplied name or wave context. Porter stems serialized to serial, allowing unrelated serial-number passages to compete.

**Actual first eight topics, in order:**

1. Understanding current and retained view combinations — `view-retained-unions`
2. Understanding interface configuration retrieval — `interface-configuration-selection`
3. Why a serial uniqueness check can miss a duplicate — `operations-serial-uniqueness`
4. What the shipping-load serial archive helper actually does — `serial-archive-copy-delete`
5. How are serial numbers combined with archives and uploads? — `warehouse-serial-archive-reading`
6. Understanding upload claims and serial staging — `interface-upload-batch-contract`
7. Why an alert request can be deleted during validation — `operations-warehouse-alerts`
8. Understanding catch weight and transaction attribute grain — `view-catch-weight-and-history`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-13"></a>

### Case 13 — awr-wave-dialog-selection:2

**Exact question:** Does active mean the worker is alive?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Wave dialog seeds and active-wave list — `awr-wave-dialog-selection`.

**Expected topic explains:** The reviewed bodies only return dialog context. NewWave variants project one row; BuildWave projects constants once per master row. The active-wave list checks last-step NULL/empty and warehouse, not whether a process is currently running.

**Historical full-list rank:** 52 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Active and worker do not identify the active-wave list or dialog routines. The source describes a last-step predicate rather than worker liveness.

**Actual first eight topics, in order:**

1. Understanding grouping and assignment changes — `work-group-assignment`
2. Stored wave metric meaning — `awr-wave-metrics`
3. What a wave or pallet queue success means — `operations-dif-queues`
4. Labor Management: purpose and processing — `process-labor-management`
5. Status-slot helpers — `fn-status-slots`
6. Replenishment capacity fallback — `awr-capacity-precedence`
7. Fixed procedure calls and lexical dynamic flags — `dynamic-fixed-exec`
8. Maintenance commands and partial outcomes — `dynamic-maintenance-effects`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-14"></a>

### Case 14 — awr-allocation-conversion:2

**Exact question:** Does the helper reserve more stock?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Allocation unit conversion selection — `awr-allocation-conversion`.

**Expected topic explains:** The body chooses integer conversion candidates and maximum unit sequence, with item-class fallback only when no item-specific units exist. Its outer join does not carry the grouped allocation ID back to the target, so deterministic per-request largest-pack selection is not established from this body.

**Historical full-list rank:** 14 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** The helper is unnamed; reserving stock fits many allocation/inventory helpers. The expected topic is about conversion selection.

**Actual first eight topics, in order:**

1. Identifier and sequence suggestions — `fn-suggestions`
2. Why escalation can change more than one instruction — `operations-lane-priority`
3. Bill-of-material inventory context — `bom-detail-context`
4. Why a detail model can contain defaults or more than one matching definition — `detail-model-selection`
5. Item, lookup and monitoring selection boundaries — `presentation-selection-boundaries`
6. Inventory Management: purpose and processing — `process-inventory-management`
7. Why an analytics event can appear more than once — `analytics-join-multiplicity`
8. Understanding locating rule retrieval — `locating-rule-lookup`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-15"></a>

### Case 15 — awr-capacity-precedence:1

**Exact question:** Does no row return 0 and100 automatically?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Replenishment capacity fallback — `awr-capacity-precedence`.

**Expected topic explains:** No. Those substitutions apply only inside a matching configuration row. Output variables are not initialized; an incoming maximum can suppress fallback and no-match can retain incoming values. Item/location, item/type and class fallback queries have distinct warehouse scope and unordered company matches.

**Historical full-list rank:** 19 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** No capacity, replenishment or function is named. The concatenated and100 is already split into and and 100 by the existing tokenizer.

**Actual first eight topics, in order:**

1. Understanding an automatic receipt trailer link — `receiving-trailer-link`
2. Understanding receipt and yard links — `receipt-trailer-association`
3. Small numeric transforms — `fn-checkdigit-extrema`
4. Partial binding in XML and unit searches — `dynamic-xml-and-units`
5. Why helper names do not prove a read-only operation — `operations-miscellaneous-side-effects`
6. How are item units and their sequence selected? — `warehouse-unit-fallback-sequence`
7. Receiving returns or damaged stock — `returns-damage-status`
8. Why inventory staging can be replaced before validation finishes — `operations-inventory-staging`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-16"></a>

### Case 16 — awr-replenishment-counts:1

**Exact question:** What if both branch counts equal three?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Replenishment counts and projections — `awr-replenishment-counts`.

**Expected topic explains:** It sums two count rows using UNION, so equal counts collapse. Its joined branch can also count several instructions for one request. The detail pane counts instruction/history rows under different predicates; the request view can duplicate rows through inventory joins without attribute identity.

**Historical full-list rank:** 14 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Both branch counts is mathematically meaningful but names no process/function. The source UNION equal-count behavior is present; exact-word matching substantially changes its rank.

**Actual first eight topics, in order:**

1. Understanding receipt container identifier generation — `receipt-container-id-generation`
2. Security form branches and checkpoint display — `security-form-selection`
3. Why does shipment lookup return an upload copy? — `warehouse-shipment-upload-context`
4. Partial binding in XML and unit searches — `dynamic-xml-and-units`
5. Why helper names do not prove a read-only operation — `operations-miscellaneous-side-effects`
6. How inventory changes affect lot status, replenishment and history — `inventory-lot-replenishment-history`
7. Understanding placeholder and display-only view fields — `view-presentation-rows`
8. Cycle Counting: purpose and processing — `process-cycle-counting`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-17"></a>

### Case 17 — shipping-qc-context:3

**Exact question:** Are these settings confirmed for the current warehouse?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Understanding QC settings versus QC execution — `shipping-qc-context`.

**Expected topic explains:** The context routine combines user packing-preference flags, system configuration and security checkpoint values into three result sets. It does not inspect containers, assign QC, force a pass or enforce an action itself.

**Historical full-list rank:** 31 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** These settings has no setting names or QC subject. Many source-limit passages correctly say current warehouse settings are not established.

**Actual first eight topics, in order:**

1. Understanding status changes at ship confirmation — `ship-confirm`
2. Work unit remains open: confirmation and holds — `work-completion-checks`
3. Understanding ship-confirm database changes — `ship-confirm-status-propagation`
4. Desktop packing and mobile picking/closing settings — `desktop-mobile-packing`
5. Understanding VAS confirmation and QC context — `view-vas-and-qc-displays`
6. Lot-change previews and confirmation — `lot-change-presentation`
7. How work confirmation advances related record status — `work-status-dispatch`
8. Thirty-second activity series — `performance-activity-buckets`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-18"></a>

### Case 18 — shipping-container-numbering:2

**Exact question:** Does one failed shipment roll back the entire wave automatically?

**Recorded category:** Broad subject: several SCALE topics could reasonably match. (`BROAD_SUBJECT`)

**Expected topic:** Understanding X-of-Y container numbering — `shipping-container-numbering`.

**Expected topic explains:** Shipment numbering assigns ordinals to identified top-level tree roots and resets identified immediate children to zero. Wave numbering invokes that helper inside one transaction per shipment; the body does not provide one whole-wave transaction.

**Historical full-list rank:** 25 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Shipment and wave are named, but container numbering is not. Many independent wave operations discuss failure/rollback.

**Actual first eight topics, in order:**

1. Wave: purpose and processing — `process-wave`
2. Understanding wave duration and statement timing — `whole-process-runtime`
3. Wave progress and statistics refresh — `awr-wave-statistics-gate`
4. Understanding an automatic receipt trailer link — `receiving-trailer-link`
5. Replenishment cancellation quantities — `awr-cancel-replenishment`
6. Wave dialog seeds and active-wave list — `awr-wave-dialog-selection`
7. Why helper names do not prove a read-only operation — `operations-miscellaneous-side-effects`
8. Add, remove and transfer shipment wave membership — `awr-wave-membership`

**Your review:** Which process or screen did you mean? Is this expected topic the best answer, or is a returned topic also suitable?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-19"></a>

### Case 19 — interface-upload-batch-contract:1

**Exact question:** Does In Process prevent a second claimant?

**Recorded category:** Broad subject: several SCALE topics could reasonably match. (`BROAD_SUBJECT`)

**Expected topic:** Understanding upload claims and serial staging — `interface-upload-batch-contract`.

**Expected topic explains:** The batch routine updates header and linked child staging conditions and process stamps. Its claim branch can restamp rows already In Process, and downstream child scope follows the batch stamp. The serial helper inserts selected payload rows without an explicit rerun deduplication check.

**Historical full-list rank:** 95 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** In Process identifies a shared status phrase, without upload/batch identity. Other process-state guidance competes.

**Actual first eight topics, in order:**

1. Why trace-control variants may not run as expected — `operations-trace-controls`
2. Packing/Shipping: purpose and processing — `process-packing-shipping`
3. Interface: purpose and processing — `process-interface`
4. Date-only and fractional-second transforms — `fn-date-transforms`
5. Returns: purpose and processing — `process-returns`
6. Thirty-second activity series — `performance-activity-buckets`
7. Active wave samples — `performance-wave-sampling`
8. Work Order: purpose and processing — `process-work-order`

**Your review:** Which process or screen did you mean? Is this expected topic the best answer, or is a returned topic also suitable?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-20"></a>

### Case 20 — interface-upload-batch-contract:3

**Exact question:** Will the serial helper skip records from a previous run?

**Recorded category:** Broad subject: several SCALE topics could reasonably match. (`BROAD_SUBJECT`)

**Expected topic:** Understanding upload claims and serial staging — `interface-upload-batch-contract`.

**Expected topic explains:** The batch routine updates header and linked child staging conditions and process stamps. Its claim branch can restamp rows already In Process, and downstream child scope follows the batch stamp. The serial helper inserts selected payload rows without an explicit rerun deduplication check.

**Historical full-list rank:** 17 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Serial helper omits upload staging identity. Several serial copy/archive helpers and previous-run behaviors compete.

**Actual first eight topics, in order:**

1. What the shipping-load serial archive helper actually does — `serial-archive-copy-delete`
2. Why count work identity and sequence can differ — `cycle-count-work-reconciliation`
3. Maintenance helper side effects — `performance-maintenance-ddl`
4. Lookup setup and status-flow metadata boundaries — `admin-lookup-status-metadata`
5. Weight-break configuration inserts — `performance-rate-weight-config`
6. Why trace-control variants may not run as expected — `operations-trace-controls`
7. Item measurement defaults — `fn-item-measurements`
8. Status-slot helpers — `fn-status-slots`

**Your review:** Which process or screen did you mean? Is this expected topic the best answer, or is a returned topic also suitable?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-21"></a>

### Case 21 — interface-errors-and-retained-views:1

**Exact question:** Does UNION preserve every physical source row?

**Recorded category:** Broad subject: several SCALE topics could reasonably match. (`BROAD_SUBJECT`)

**Expected topic:** Understanding interface error and retained-data views — `interface-errors-and-retained-views`.

**Expected topic explains:** The error view projects stored error fields; the detail pane selects one stored error. Three upload views combine current and retained tables with UNION distinct over selected columns. None performs delivery, retry, archive movement or freshness checks.

**Historical full-list rank:** 9 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** UNION semantics are explicit but do not identify the interface view family. The top result view-retained-unions also directly addresses UNION row preservation.

**Actual first eight topics, in order:**

1. Understanding current and retained view combinations — `view-retained-unions`
2. Stored wave metric meaning — `awr-wave-metrics`
3. How are serial numbers combined with archives and uploads? — `warehouse-serial-archive-reading`
4. Understanding lot counts and shipped-lot scope — `view-lot-and-recall`
5. Screen parts, groups and controls preserve existing definitions — `admin-screen-control-seeding`
6. Why configuration seed calls may preserve old settings — `admin-seeding-overwrite`
7. Screen counts, templates and license associations — `admin-main-ui-mapping`
8. Feature setting updates and unused removed input — `admin-feature-setting`

**Your review:** Which process or screen did you mean? Is this expected topic the best answer, or is a returned topic also suitable?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-22"></a>

### Case 22 — fn-status-slots:2

**Exact question:** Is NULL same as default zero?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Status-slot helpers — `fn-status-slots`.

**Expected topic explains:** These slot helpers use position order. One returns the count before the first zero; another stops at zero or994+, returning the previous slot. Equality helpers return the first matching slot or its quantity, without summing duplicate statuses. None sorts the inputs or validates a status transition.

**Historical full-list rank:** 43 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** NULL/default/zero has no function or status-slot identity. Many defaulting contracts differ, so selecting one silently would invent context.

**Actual first eight topics, in order:**

1. Zero inventory cleanup after wave replenishment — `awr-zero-inventory-cleanup`
2. When do packing and display defaults apply? — `warehouse-qc-resource-defaults`
3. Replenishment capacity fallback — `awr-capacity-precedence`
4. Available-quantity branch differences — `fn-available-quantity`
5. Unresolved catalog references and candidate targets — `dynamic-catalog-null`
6. Item measurement defaults — `fn-item-measurements`
7. How inventory changes affect lot status, replenishment and history — `inventory-lot-replenishment-history`
8. Unit conversion fallback — `fn-uom-precedence`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-23"></a>

### Case 23 — fn-available-quantity:1

**Exact question:** Are all no-match outputs0?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Available-quantity branch differences — `fn-available-quantity`.

**Expected topic explains:** No. SUM branches assignNULL when no rows match; the attribute-specific nonaggregate branch retains initial0 on no match and can choose one of several rows. The without-in-transit function also differs in parent logistics, lot and filter behavior, so it is not simply the first function minus transit stock.

**Historical full-list rank:** 11 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** No quantity or function is named. Existing tokens split outputs0 correctly; numeric zero and word zero remain lexically distinct.

**Actual first eight topics, in order:**

1. Why helper names do not prove a read-only operation — `operations-miscellaneous-side-effects`
2. Why an inventory update can affect no row — `inventory-optimistic-quantity-update`
3. Why inventory adjustment or transfer screens can show blank defaults — `inventory-screen-aggregate-defaults`
4. What next-number and string helpers guarantee — `operations-number-and-string-helpers`
5. Understanding deallocation output mode and history — `shipping-deallocation-history`
6. Status-slot helpers — `fn-status-slots`
7. Identifier and sequence suggestions — `fn-suggestions`
8. Understanding a count after picking — `inventory-activity-count`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-24"></a>

### Case 24 — fn-report-text:2

**Exact question:** Does text prove every value is present?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Bounded report text — `fn-report-text`.

**Expected topic explains:** They are bounded varchar2000 projections that stop before appending more text, without an omitted-count indicator. Serial helpers use UNION ALL across current/archive-named tables and sequence0 template rules. Invoice/PO/BOL helpers instead use specific DISTINCT keys. Unicode values can lose characters in varchar output.

**Historical full-list rank:** 18 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Text/every value does not identify bounded report-string helpers, serial/BOL lists or the output limit.

**Actual first eight topics, in order:**

1. Understanding placeholder and display-only view fields — `view-presentation-rows`
2. Stored labor dashboard values and refresh — `labor-dashboard-refresh`
3. Configured predicates are executable SQL text — `dynamic-configured-filters`
4. Understanding current and retained view combinations — `view-retained-unions`
5. Transfer presentation results and helper calls — `transfer-presentation-context`
6. Why do operational and upload comments differ? — `warehouse-comment-interface-context`
7. What work-created flags do and do not prove — `work-created-and-work-written`
8. Cycle-count presentation configuration — `cycle-count-presentation-defaults`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-25"></a>

### Case 25 — fn-bol-expiration:1

**Exact question:** Does missing shipment always returnNULL?

**Recorded category:** Broad subject: several SCALE topics could reasonably match. (`BROAD_SUBJECT`)

**Expected topic:** BOL ordinals and lot expiration selection — `fn-bol-expiration`.

**Expected topic explains:** BOL stop helper returns a shipment-row ordinal when found, but can return the last stored stop sequence when not found. Multi-stop formatting counts distinct stop/BOL pairs. Lot expiration chooses the greatest object ID across current/archive, not the greatest date or an explicit live-table preference.

**Historical full-list rank:** 17 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Missing shipment is broad; BOL ordinal/stop helper is unnamed. Existing tokenizer already splits returnNULL into return and null.

**Actual first eight topics, in order:**

1. Replenishment capacity fallback — `awr-capacity-precedence`
2. Statistics read and save contracts — `awr-statistics-store`
3. Understanding shipment detail fields — `shipment-detail`
4. String and XML transforms — `fn-string-xml`
5. Why inventory staging can be replaced before validation finishes — `operations-inventory-staging`
6. Small numeric transforms — `fn-checkdigit-extrema`
7. Resource and description fallback — `fn-resource-fallback`
8. Unit conversion fallback — `fn-uom-precedence`

**Your review:** Which process or screen did you mean? Is this expected topic the best answer, or is a returned topic also suitable?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-26"></a>

### Case 26 — fn-dashboard-kpis:2

**Exact question:** Are work date windows always a full local calendar day?

**Recorded category:** Specific subject: a meaningful question whose expected topic ranks too low. (`SPECIFIC_SEMANTIC_SUBJECT`)

**Expected topic:** Dashboard KPI semantics — `fn-dashboard-kpis`.

**Expected topic explains:** No. Several IDs return fixed numbers. Other branches count joined rows, calculate stored dashboard formulas or use selected timestamp intervals. Shortest/longest/average dock intervals have different no-data behavior. Work day ends are UTC start+24h and can differ from a local DST day. Unknown type/ID returns0; missing scalar data can yieldNULL or a percentage fallback0.

**Historical full-list rank:** 16 in the C9 diagnostic run. C11 reproduced the same rank. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Work/date-window/local-day question has meaningful content supported by the dashboard explanation. Relevant terms span passages and calendar helpers compete.

**Actual first eight topics, in order:**

1. Work: purpose and processing — `process-work`
2. Timezone and week helpers — `fn-timezones`
3. Inventory diagnostic count definitions — `inventory-diagnostic-counts`
4. Carrier Management: purpose and processing — `process-carrier-management`
5. Understanding work indicator tiles — `work-monitor-indicators`
6. Understanding ship-confirm database changes — `ship-confirm-status-propagation`
7. Intraday labor estimates and active-user counts — `labor-active-intraday`
8. Performance monitor daily boundaries — `performance-pm-day-boundary`

**C15 diagnostic rewrite:** For dashboard work KPIs, are date windows always a full local calendar day?

**Rewrite result:** expected topic ranked 4 in the recorded loopback HTTP check. This was written after examining the miss; the original case remains a miss.

**Your review:** Would you ask this question as written? Is the expected explanation the best answer, and do any returned topics answer it adequately?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-27"></a>

### Case 27 — fn-dashboard-kpis:3

**Exact question:** Does percentage0 always mean no work processed?

**Recorded category:** Broad subject: several SCALE topics could reasonably match. (`BROAD_SUBJECT`)

**Expected topic:** Dashboard KPI semantics — `fn-dashboard-kpis`.

**Expected topic explains:** No. Several IDs return fixed numbers. Other branches count joined rows, calculate stored dashboard formulas or use selected timestamp intervals. Shortest/longest/average dock intervals have different no-data behavior. Work day ends are UTC start+24h and can differ from a local DST day. Unknown type/ID returns0; missing scalar data can yieldNULL or a percentage fallback0.

**Historical full-list rank:** 9 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Percentage-zero/work identifies a broad metric, but not the dashboard/KPI. Existing tokenizer splits percentage0; several work metrics discuss zero.

**Actual first eight topics, in order:**

1. Work: purpose and processing — `process-work`
2. Replenishment capacity fallback — `awr-capacity-precedence`
3. Small numeric transforms — `fn-checkdigit-extrema`
4. Stored wave metric meaning — `awr-wave-metrics`
5. Understanding dock occupancy display states — `view-dock-display-states`
6. Replenishment: purpose and processing — `process-replenishment`
7. Available-quantity branch differences — `fn-available-quantity`
8. Why inventory monitor tiles and drilldowns can disagree — `inventory-monitor-scope`

**Your review:** Which process or screen did you mean? Is this expected topic the best answer, or is a returned topic also suitable?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-28"></a>

### Case 28 — view-retained-unions:3

**Exact question:** Do retained table references mean archive jobs ran during this review?

**Recorded category:** Broad subject: several SCALE topics could reasonably match. (`BROAD_SUBJECT`)

**Expected topic:** Understanding current and retained view combinations — `view-retained-unions`.

**Expected topic explains:** UNION ALL views preserve duplicate rows across current and retained sources. UNION views remove identical full projected rows, while different values for the same identifier can remain. These views provide no current-source preference.

**Historical full-list rank:** 42 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Retained table references and archive jobs identify an evidence limit common across retained-source views, rather than a unique view family.

**Actual first eight topics, in order:**

1. Maintenance commands and partial outcomes — `dynamic-maintenance-effects`
2. What the archive purge helpers can change — `operations-archive-control`
3. Why movement totals may not equal transaction totals — `operations-movement-analysis`
4. What the shipping-load serial archive helper actually does — `serial-archive-copy-delete`
5. Understanding serial checks during movement — `inventory-serial-linkage`
6. Identifier and sequence suggestions — `fn-suggestions`
7. How do item lookups handle company and cross-references? — `warehouse-item-company-matching`
8. Why an alert request can be deleted during validation — `operations-warehouse-alerts`

**Your review:** Which process or screen did you mean? Is this expected topic the best answer, or is a returned topic also suitable?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-29"></a>

### Case 29 — view-work-order-aggregation:1

**Exact question:** Must minimum component item and minimum line ID come from one component?

**Recorded category:** Specific subject: a meaningful question whose expected topic ranks too low. (`SPECIFIC_SEMANTIC_SUBJECT`)

**Expected topic:** Understanding work-order summary quantities — `view-work-order-aggregation`.

**Expected topic explains:** The summary independently takes MIN of many component fields while grouping by work order. Components, shipment details and instructions join before SUM(TO_QTY), so fanout can multiply that sum. COUNT DISTINCT protects the dependent shipment count only; COMPLETE is an alias of requested build quantity. Because each minimum is calculated separately, the summary can combine values from different components and should not be read as one component record.

**Historical full-list rank:** 10 in the C9 diagnostic run. C11 reproduced the same rank. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Independent minimum component fields is specific and source-supported. The question omits work order; competing component topics and process-item priority displace rank ten. C7 already clarified prose; no repeated prose edit is justified here.

**Actual first eight topics, in order:**

1. Item: purpose and processing — `process-item`
2. Where packing-list component quantities come from — `report-label-packing-components`
3. Work Order: purpose and processing — `process-work-order`
4. Why a detail model can contain defaults or more than one matching definition — `detail-model-selection`
5. What work-order assembly, component and putaway reports show — `report-label-work-orders`
6. Immediate Needs: purpose and processing — `process-immediate-needs`
7. Status: purpose and processing — `process-status`
8. Why work-order counts and putaway fields can be ambiguous — `operations-work-order-pane`

**C15 diagnostic rewrite:** In the work-order summary view, can the minimum component item and minimum line ID refer to different components?

**Rewrite result:** expected topic ranked 4 in the recorded loopback HTTP check. This was written after examining the miss; the original case remains a miss.

**Your review:** Would you ask this question as written? Is the expected explanation the best answer, and do any returned topics answer it adequately?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-30"></a>

### Case 30 — view-inventory-grain:1

**Exact question:** Do two serial rows necessarily mean two separate inventory balances?

**Recorded category:** Specific subject: a meaningful question whose expected topic ranks too low. (`SPECIFIC_SEMANTIC_SUBJECT`)

**Expected topic:** Understanding inventory detail and aggregate grain — `view-inventory-grain`.

**Expected topic explains:** Detailed inventory joins serial numbers, which can repeat inventory quantities. The aggregate view groups location, item, company, lot, permanent state and location dimensions, uses MIN/sentinels for other fields, and counts distinct logistics units. Availability uses raw nullable quantity arithmetic and clamps negative or nonmatching comparisons to zero.

**Historical full-list rank:** 12 in the C9 diagnostic run. C11 reproduced the same rank. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Serial rows versus inventory balances is specific, source-supported and competes with several genuinely relevant inventory/serial explanations.

**Actual first eight topics, in order:**

1. Why can inventory export include zero balances? — `warehouse-inventory-balance-variants`
2. Understanding an inventory adjustment — `inventory-adjustment`
3. Understanding ordered quantity and balance aggregates — `view-order-quantity-and-balance`
4. Understanding catch weight and transaction attribute grain — `view-catch-weight-and-history`
5. Stored wave metric meaning — `awr-wave-metrics`
6. Understanding inventory quantity categories — `inventory-quantity-buckets`
7. How destination inventory defaults and restrictions are selected — `inventory-location-create-defaults`
8. Understanding serial checks during movement — `inventory-serial-linkage`

**C15 diagnostic rewrite:** In inventory detail versus aggregate views, do two serial rows always mean two separate inventory balances?

**Rewrite result:** expected topic ranked 4 in the recorded loopback HTTP check. This was written after examining the miss; the original case remains a miss.

**Your review:** Would you ask this question as written? Is the expected explanation the best answer, and do any returned topics answer it adequately?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-31"></a>

### Case 31 — view-order-quantity-and-balance:1

**Exact question:** Is total ordered quantity net of allocation?

**Recorded category:** Specific subject: a meaningful question whose expected topic ranks too low. (`SPECIFIC_SEMANTIC_SUBJECT`)

**Expected topic:** Understanding ordered quantity and balance aggregates — `view-order-quantity-and-balance`.

**Expected topic explains:** It sums total shipment-detail quantity for headers with trailing status below 900, grouped by item, raw company, unit and warehouse. Inventory balance separately sums selected nonzero inventory buckets where location-class configuration qualifies. Display company/unit fallbacks do not change the raw GROUP BY keys.

**Historical full-list rank:** 11 in the C9 diagnostic run. C11 reproduced the same rank. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Total ordered quantity versus allocation is specific and source-supported. Porter/lexical ranking and many quantity aggregates affect its rank.

**Actual first eight topics, in order:**

1. Allocation: purpose and processing — `process-allocation`
2. Why purchase-order receipt reports show different totals or blanks — `report-label-po-receipts`
3. Why allocation and shipment pick-list backorders differ — `report-label-pick-quantities`
4. Why an exchange-shipment report shows receipt data — `report-label-exchange`
5. Stored wave metric meaning — `awr-wave-metrics`
6. How receipt status reports choose container quantities — `report-label-receipt-status`
7. Allocation split and destination association — `awr-allocation-split`
8. Understanding purchase-order detail, header and TPM views — `view-purchase-order-grain`

**C15 diagnostic rewrite:** In ITEM_ORDER_QUANTITY_VIEW, is total ordered quantity net of allocations?

**Rewrite result:** expected topic ranked 3 in the recorded loopback HTTP check. This was written after examining the miss; the original case remains a miss.

**Your review:** Would you ask this question as written? Is the expected explanation the best answer, and do any returned topics answer it adequately?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-32"></a>

### Case 32 — view-document-file-name:2

**Exact question:** What can a missing selected separator cause?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Understanding managed-document file-name extraction — `view-document-file-name`.

**Expected topic explains:** The document-management view projects metadata and derives a file name through reverse, substring and a selected path separator. It does not open or retrieve the document. A non-NULL source without the selected separator can yield a negative substring length; NULL source propagates NULL.

**Historical full-list rank:** 12 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** The selected separator is unnamed and no file/document/path context is supplied. The expected explanation is present, and tokenizer choice changes competing matches.

**Actual first eight topics, in order:**

1. Keeping container contents together or separate — `packing-classes-and-criteria`
2. Dashboard cache completeness and expiration — `performance-cache-rebuild`
3. Fixed procedure calls and lexical dynamic flags — `dynamic-fixed-exec`
4. Why trace-control variants may not run as expected — `operations-trace-controls`
5. Why carton export quantities and sequence differ by helper — `operations-packsize-export`
6. Why work-order counts and putaway fields can be ambiguous — `operations-work-order-pane`
7. Action menus, missing endpoints and repeated rules — `admin-action-registration`
8. What can the receipt download remaining flag miss? — `warehouse-download-receipt-family`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-33"></a>

### Case 33 — dynamic-download-claims:2

**Exact question:** Does a successful first stage guarantee the full batch?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Download selection changes queue state — `dynamic-download-claims`.

**Expected topic explains:** They update ready interface rows and process stamps before returning selected data. A returned batch is not proof of downstream processing or one atomic claim across every stage.

**Historical full-list rank:** 11 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** First stage/full batch names no download operation. Many independent batch/transaction workflows have similar success limitations.

**Actual first eight topics, in order:**

1. Understanding upload claims and serial staging — `interface-upload-batch-contract`
2. Dashboard update locking — `performance-dashboard-lock`
3. What generic configuration staging changes — `operations-configuration-loads`
4. Why inventory staging can be replaced before validation finishes — `operations-inventory-staging`
5. Why a warehouse argument does not always limit a conversion load — `operations-assignment-capacity-loads`
6. What changes when receipt upload batches are selected? — `warehouse-receipt-batch-marking`
7. What next-number and string helpers guarantee — `operations-number-and-string-helpers`
8. Unit conversion fallback — `fn-uom-precedence`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-34"></a>

### Case 34 — dynamic-configured-filters:2

**Exact question:** Does receipt selection prove upload delivered?

**Recorded category:** Specific subject: a meaningful question whose expected topic ranks too low. (`SPECIFIC_SEMANTIC_SUBJECT`)

**Expected topic:** Configured predicates are executable SQL text — `dynamic-configured-filters`.

**Expected topic explains:** Values such as batch ID and warehouse date are bound, but stored FILTER_CONFIG_DETAIL predicate text is appended as SQL syntax. Receipt variants also mark upload/batch state. A receipt batch mark identifies rows selected for subsequent processing. It does not establish that an external system received the receipt; that outcome requires separate delivery evidence.

**Historical full-list rank:** 12 in the C9 diagnostic run. C11 reproduced the same rank. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Receipt selection versus upload delivery is meaningful, but several receipt/upload topics already explain the same boundary. C7 clarified this answer; no repeated prose edit is justified.

**Actual first eight topics, in order:**

1. What changes when receipt upload batches are selected? — `warehouse-receipt-batch-marking`
2. Understanding upload claims and serial staging — `interface-upload-batch-contract`
3. How are receipt upload candidates chosen? — `warehouse-receipt-upload-candidates`
4. Unresolved catalog references and candidate targets — `dynamic-catalog-null`
5. Why helper names do not prove a read-only operation — `operations-miscellaneous-side-effects`
6. Understanding print selection and wave reprint context — `shipping-print-selection-contract`
7. Checking label prerequisites before assuming print success — `label-prerequisites`
8. What work-created flags do and do not prove — `work-created-and-work-written`

**C15 diagnostic rewrite:** When a configured receipt filter selects rows, does that prove an upload was delivered?

**Rewrite result:** expected topic ranked 1 in the recorded loopback HTTP check. This was written after examining the miss; the original case remains a miss.

**Your review:** Would you ask this question as written? Is the expected explanation the best answer, and do any returned topics answer it adequately?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-35"></a>

### Case 35 — dynamic-fixed-reporting:2

**Exact question:** Is its source the captured local shipment table?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Fixed reports and an external query — `dynamic-fixed-reporting`.

**Expected topic explains:** Several wrappers execute one fixed SELECT string without binding their declared report arguments. PM_SHIPPED_TODAY_BY_MINUTE uses a four-part external target whose definition is outside the local snapshot.

**Historical full-list rank:** 117 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Its source supplies no report name; local shipment table is insufficient to identify the external fixed report.

**Actual first eight topics, in order:**

1. Stored wave metric meaning — `awr-wave-metrics`
2. Database and table size result sets — `performance-space-used`
3. How shipment and load status rollups retry — `operations-shipment-status-rollup`
4. Why shipment monitor tiles do not add up — `operations-shipment-monitors`
5. Why shipment detail panels can show unexpected shared fields — `operations-shipment-pane`
6. Understanding shipment detail fields — `shipment-detail`
7. Unit conversion fallback — `fn-uom-precedence`
8. Generated INSERT text versus executed DML — `dynamic-script-generator`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-36"></a>

### Case 36 — performance-inventory-diagnostics:2

**Exact question:** Should every returned item be automatically corrected or written off?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Inventory diagnostic predicates — `performance-inventory-diagnostics`.

**Expected topic explains:** It identifies rows that satisfy that query's comparison. The queries use different keys, warehouse sides and exclusions. Some compare aggregates, some omit logistics units, and several use NOLOCK. A finding needs context before it becomes a confirmed defect.

**Historical full-list rank:** 155 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Every returned item does not identify the inventory diagnostic or finding. Corrected/written off are not a unique process identity.

**Actual first eight topics, in order:**

1. Item: purpose and processing — `process-item`
2. Understanding lot, license-plate and serial prompts — `lot-and-tracking-prompts`
3. Container will not close: packing, QC, VAS and weight — `container-close-checks`
4. Work unit remains open: confirmation and holds — `work-completion-checks`
5. Understanding work monitor totals — `work-monitor`
6. Understanding a work-type drilldown — `work-monitor-drilldown`
7. Understanding work indicator tiles — `work-monitor-indicators`
8. How work-verification controls are derived — `work-configurator-controls`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-37"></a>

### Case 37 — operations-accessorial-selection:1

**Exact question:** Does a NULL stored override always remain NULL?

**Recorded category:** Missing subject: the question does not identify the operation or function. (`MISSING_REFERENT`)

**Expected topic:** Why accessorial choices or values are missing — `operations-accessorial-selection`.

**Expected topic explains:** Accessorial choices depend on the shipment carrier and service matching rating configuration. Container branches apply extra per-container and contents rules. A missing required join can return no choices; an existing override value may fall back to the detail default when it is NULL.

**Historical full-list rank:** 26 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Stored override is shared terminology without accessorial/shipment/carrier identity. Many NULL/default contracts compete.

**Actual first eight topics, in order:**

1. Why a warehouse argument does not always limit a conversion load — `operations-assignment-capacity-loads`
2. Understanding managed-document file-name extraction — `view-document-file-name`
3. Item measurement defaults — `fn-item-measurements`
4. Available-quantity branch differences — `fn-available-quantity`
5. Cached dashboard reads and refreshes — `performance-cache-read-refresh`
6. Replenishment capacity fallback — `awr-capacity-precedence`
7. Catch-weight unit sources — `fn-catch-weight`
8. BOL ordinals and lot expiration selection — `fn-bol-expiration`

**Your review:** What operation, screen, or function did you mean? Does the expected explanation match that intent?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-38"></a>

### Case 38 — warehouse-export-field-fallback:1

**Exact question:** Does shipment-detail fallback use internal shipment number?

**Recorded category:** Specific subject: a meaningful question whose expected topic ranks too low. (`SPECIFIC_SEMANTIC_SUBJECT`)

**Expected topic:** Where do shipment-detail export fields come from? — `warehouse-export-field-fallback`.

**Expected topic explains:** Shipment-detail insert and update preserve non-NULL caller export fields. For NULL classification, validated license or expiration, they read the corresponding header fields by business shipment ID. The lookup does not restrict warehouse or company and has no ordering when several headers share that ID.

**Historical full-list rank:** 28 in the C9 diagnostic run. C11 reproduced the same rank. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Shipment-detail fallback/internal shipment number identifies a meaningful lookup distinction, but does not name export fields. Incidental shipment-detail topic-ID priority and strong competing shipment topics affect ranking.

**Actual first eight topics, in order:**

1. Understanding shipment detail fields — `shipment-detail`
2. Transfer presentation results and helper calls — `transfer-presentation-context`
3. Understanding X-of-Y container numbering — `shipping-container-numbering`
4. Understanding shipment selection, consolidation, split and manifest context — `shipping-presentation-selection`
5. Why packing-list versions include different containers — `report-label-packing-scope`
6. Why custom container labels show unexpected counts or RFID text — `operations-custom-labels`
7. Why accessorial choices or values are missing — `operations-accessorial-selection`
8. Why an exchange-shipment report shows receipt data — `report-label-exchange`

**C15 diagnostic rewrite:** For shipment-detail export, does fallback use the internal shipment number?

**Rewrite result:** expected topic ranked 2 in the recorded loopback HTTP check. This was written after examining the miss; the original case remains a miss.

**Your review:** Would you ask this question as written? Is the expected explanation the best answer, and do any returned topics answer it adequately?

**Your notes:** _Not reviewed by the owner in this report._

<a id="miss-39"></a>

### Case 39 — close-container-model-boundary:2

**Exact question:** Can a missing container still produce display rows?

**Recorded category:** Broad subject: several SCALE topics could reasonably match. (`BROAD_SUBJECT`)

**Expected topic:** What the close-container model can explain — `close-container-model-boundary`.

**Expected topic explains:** This routine reads a container and its shipment, proposes container-count numbers and returns a carrier-change restriction after finding a previously closed-status container. It does not close the current container. A cause for a container that remains open needs the actual action and its current error or state.

**Historical full-list rank:** 32 in the C9 diagnostic run. The current stored evaluation only establishes absence from its first eight for this case.

**Recorded C9 diagnosis:** Missing container/display rows names no screen or close-container model. Several container presentation models can return default rows.

**Actual first eight topics, in order:**

1. When do packing and display defaults apply? — `warehouse-qc-resource-defaults`
2. Stored wave metric meaning — `awr-wave-metrics`
3. Why purchase-order receipt reports show different totals or blanks — `report-label-po-receipts`
4. Packing preference and checkpoint display — `packing-presentation-configuration`
5. Why saved wave statistics can be NULL or negative — `operations-wave-statistics`
6. How a picking-group report displays container quantities — `report-label-picking-group`
7. Presentation defaults and business actions — `presentation-seed-actions`
8. Item measurement defaults — `fn-item-measurements`

**Your review:** Which process or screen did you mean? Is this expected topic the best answer, or is a returned topic also suitable?

**Your notes:** _Not reviewed by the owner in this report._

## Active next-session work

1. **Search:** use your case comments to check question intent and expected answers. Continue a bounded retrieval improvement with the unchanged 725-case baseline; record recoveries and regressions. Add separately identified independent questions when available. Do not replace original questions with the successful C15 rewrites and call the original misses repaired.
2. **DOCX page layout:** continue the approved review of the four unique document bodies. The purpose is to check whether extraction preserved tables, diagrams, reading order, and page context that could affect the knowledge. It is source fidelity work, not redesigning the supplied documents. Earlier local export attempts produced no PDF; a reliable render/export path remains needed.
3. **Display acceptance:** the owner accepts the display for this scope, in addition to the earlier JAWS closure. That is sufficient to record owner acceptance and proceed. It does not create unobserved zoom, reflow, contrast, or screen-reader test results.
4. **SDD meaning:** continue reviewing useful SCALE base knowledge. The supplied SDDs describe other deployments and are reference examples. A setting, customization, or proposed workflow in an SDD is not proof that TAB uses it. Keep vendor-supported base behavior, implementation choices, and uncertain claims distinguishable; preserve citations and document identity.
5. **Bounded historical runtime identity:** retain the 154/163 current-catalog matches (94.48%) and the nine unresolved IDs. Resolving identities from existing evidence is separate from executing or timing deployed processes.

These work items have different denominators. The 24.08% SDD citation fraction measures cited nodes, including repeated or non-substantive nodes in the denominator; it is not a percentage of SCALE functionality understood. Do not combine these measures into a single project completion percentage.

## Frozen final workstream: actual TAB behavior and timing

**Current result: 0/34 captured process families reconciled to deployment — 0%. Status: frozen by the owner.**

The knowledge work explains what SCALE documentation and captured code support. The later deployment work will establish how an actual TAB process is wired together and how long the complete process takes. For example, a user action may call an application, put work on a service queue, run several database statements, and finish later. Knowing the database statements alone does not identify that whole path or its elapsed time.

When this workstream is reopened, the planned evidence needs to connect:

- The process and initiating event to the actual TAB application, service, and relevant configuration.
- Each observed stage to correlated start/end timestamps, including queue or waiting time where relevant.
- The final outcome to the same process instance, using minimal metadata and aggregate timing evidence without importing transaction rows.

The existing 1,795 Query Store rows summarize historical database statement activity. They do not establish application stages, procedure-call counts, queue waits, or complete process duration. They cannot close this workstream by themselves.

The direction is to finish the active source/help/document work first, then agree a new evidence strategy with the owner and the appropriate deployment sources. No deployment investigation, workload execution, or timing collection is authorized by this report. The 34 families are the captured review inventory, not a claim that SCALE has only 34 capabilities.

See [the freeze decision](DEPLOYMENT_FREEZE_C15.md) and [minimum deployment evidence](REQUIRED_EVIDENCE_C14.md).

## Evidence and report verification

- [Current stored evaluation](../help_app/evaluation.json): exact 725-case metrics, questions, expected IDs, and ordered result IDs.
- [Help topic library](../DB%20Architecture/mappings/help-topics.json): current topic titles and expected-topic explanations.
- [C9 diagnosis](retrieval-diagnosis-continuation9.json): all 39 classifications, explanations, and historical full-list ranks.
- [C11 diagnosis](retrieval-diagnosis-continuation11.json): seven reproduced specific-subject ranks and rejection of a candidate that introduced a miss.
- [C15 diagnostic rewrites](retrieval-context-probe-continuation15.json): seven contextualized questions and their recorded HTTP ranks.

Evaluation SHA-256: `419b6d51bf2f8ec0025741431c469c1c3a3de35ac593a819a8608088b96f7cb1`.

Verification matched all 39 report cases to the stored evaluation by stable ID, exact question, expected topic, and ordered eight results; matched all current topic titles; and checked the 19/13/7 category counts and the C9/C11 historical-rank agreement. Report creation changed no questions, expectations, search code, ranking, or source evidence. This is a review document, not a retrieval repair or new acceptance test.
