# Inventory execution and tracking

Snapshot `20260929T214106Z`. This bounded static batch reviews 11 routine bodies, supplies six help topics and 12 authored evaluation cases, and contributes 24 role records (including three previously reviewed routine roles). No process family is complete. Exact definitions, reading-copy hashes and inclusive line spans are bound in [the batch](mappings/batches/inventory.json).

No database connection or operational execution was used. The private original definitions were consulted only for reviewed branch flags and dynamic effects; their text and arbitrary strings are not published. Native author review is not independent acceptance.

## Understanding inventory quantity categories

**Why can on-hand and available inventory differ?**

On-hand means product physically at a location. Allocated means quantity reserved to leave; in-transit means quantity expected to arrive. The vendor describes available as on-hand minus allocated minus suspense. Movement code changes these categories separately, and selected availability checks can include in-transit quantity when the location rule permits it.

What happens:

1. Caller supplies separate effects for the four quantities.
2. Source/destination add, subtract or retain each category separately.
3. Selected checks consider location class and in-transit allocation rule.

What can affect it: Caller effects and LOCATION.ALLOCATE_IN_TRANSIT change reviewed branches. AIM describes adjustment types that create work, reserving transfer quantity at source and marking destination quantity in transit; the active application-to-routine mapping remains unverified.

What you can check: Confirm the selected transaction, source/destination context and relevant configuration with an authorized operator. The five existing aggregate configuration checks do not reveal these effective inventory settings.

Boundaries: Vendor formula and conditional code checks have different scopes; no universal screen-calculation equivalence claimed. No operational rows/procedures accessed. Current permissions/settings, Insight navigation and screen-reader acceptance remain unverified.

Sources: `inventory-1128703419-sql`, `inventory-1400704388-sql`, `inventory-1464704616-sql`, `inventory-tracking-aim`, `inventory-management-aim`.

## Understanding empty source inventory

**Why can inventory and unit details disappear after a movement?**

When resulting on-hand, allocated, in-transit and suspense quantities are all zero, the source routine can remove nonpermanent inventory. It handles serial, unit-of-measure and catch-weight links first. Permanent inventory follows a different retention path.

What happens:

1. Calculate four new quantities and determine permanent-row state.
2. For empty nonpermanent inventory, archive remaining serials and detach/delete unit rows based on destination effects.
3. Remove eligible catch-weight links and delete inventory using initial-quantity predicates, or update retained inventory.

What can affect it: Permanent flag, destination effects, container tracking and catch-weight rules change the path.

What you can check: Confirm the selected transaction, source/destination context and relevant configuration with an authorized operator. The five existing aggregate configuration checks do not reveal these effective inventory settings.

Boundaries: Errors do not prove rollback; caller transaction remains unreviewed. No operational rows/procedures accessed. Current permissions/settings, Insight navigation and screen-reader acceptance remain unverified.

Sources: `inventory-1400704388-sql`, `inventory-1144703476-sql`.

## Understanding destination units and attributes

**Why can destination unit details or attribute IDs change?**

Placement can create or update destination inventory, reuse equal attributes or copy an attribute set. It also transfers, copies or removes unit-of-measure details to fit the destination. Location rules and transaction context determine the path, so internal IDs need not remain the same.

What happens:

1. Validate destination context and choose existing inventory versus insertion.
2. Reuse or copy inventory attributes when required.
3. Reassign or clean unit rows with dynamic statements and fallback copy/insert handling.
4. Handle lot, location, catch-weight and history steps.

What can affect it: Location class, multi-item/container rules, status context and attribute equality affect placement.

What you can check: Confirm the selected transaction, source/destination context and relevant configuration with an authorized operator. The five existing aggregate configuration checks do not reveal these effective inventory settings.

Boundaries: Fixed dynamic targets reviewed; runtime values, nested helpers and complete atomicity remain unknown. No operational rows/procedures accessed. Current permissions/settings, Insight navigation and screen-reader acceptance remain unverified.

Sources: `inventory-1464704616-sql`.

## Understanding serial checks during movement

**Why can a serial-controlled movement be rejected?**

For selected transaction and tracking conditions, SCALE compares requested quantity with selected serial groups at the source. It then unlinks selected serial records before linking them to destination inventory. A serial-row count and a count of serial groups are different measures.

What happens:

1. Match source inventory and conditionally compare distinct serial groups with quantity.
2. Check qualifying selected linkage; clear source links and return rows updated.
3. Look up destination inventory and assign its ID to selected serials.

What can affect it: Item mode, transaction type, argument group and inventory keys govern checks.

What you can check: Confirm the selected transaction, source/destination context and relevant configuration with an authorized operator. The five existing aggregate configuration checks do not reveal these effective inventory settings.

Boundaries: No explicit destination no-match rejection: absent inventory can leave/set NULL linkage. AIM master/minor terminology does not make UPDATE row count equal master-group quantity. No operational rows/procedures accessed. Current permissions/settings, Insight navigation and screen-reader acceptance remain unverified.

Sources: `inventory-1608705129-sql`, `inventory-1416704445-sql`, `inventory-1480704673-sql`, `inventory-tracking-aim`.

## Understanding lot creation and cleanup

**Why can a lot appear or leave active inventory?**

A lot identifies a group of product. Movement helpers can create a missing lot and attach supplied attributes. When the remaining-inventory test permits cleanup, another helper copies the lot and attributes to history and deletes active rows. This does not by itself prove the warehouse has no stock.

What happens:

1. Read template/frozen-status context and insert a missing lot for a supported location.
2. Parse supplied attributes and insert them for the newly created lot.
3. Test remaining qualifying inventory outside departing context; copy lot/attributes before active deletion.

What can affect it: Item lot template, configured frozen status, location class and departure context govern behavior.

What you can check: Confirm the selected transaction, source/destination context and relevant configuration with an authorized operator. The five existing aggregate configuration checks do not reveal these effective inventory settings.

Boundaries: Cleanup uses row existence with exclusions, not a warehouse quantity SUM. Retention, immutability and atomic copy/delete are not established. No operational rows/procedures accessed. Current permissions/settings, Insight navigation and screen-reader acceptance remain unverified.

Sources: `inventory-1432704502-sql`, `inventory-1256703875-sql`, `inventory-1448704559-sql`, `inventory-tracking-aim`.

## Understanding a count after picking

**Why can picking lead to a request to count inventory?**

A cycle count checks physical stock against the system quantity. The vendor describes activity-driven counts after work such as picking. In the reviewed source movement, an on-hand reduction can call a threshold checker that considers location rules, time since the last count and quantity before requesting count creation or update.

What happens:

1. After on-hand reduction, sum item/company source inventory and call threshold logic.
2. Match active thresholds, check elapsed days and convert units if required.
3. Return/clean up or call request helpers when conditions permit.

What can affect it: Threshold dimensions, activation, quantity/unit and days-between matter. AIM separately describes immediate/pending preference.

What you can check: Confirm the selected transaction, source/destination context and relevant configuration with an authorized operator. The five existing aggregate configuration checks do not reveal these effective inventory settings.

Boundaries: Request helpers and effective RF preference remain unreviewed. The checker can delete matching requests/work; it is not read-only. No operational rows/procedures accessed. Current permissions/settings, Insight navigation and screen-reader acceptance remain unverified.

Sources: `inventory-1400704388-sql`, `inventory-1160703533-sql`, `inventory-cyclecount-aim`.

## Routine contracts

Each contract below states direct effects separately from named calls. A named call does not credit all effects of an unreviewed child. Parameter names, types, byte lengths, defaults and OUTPUT markers are in the JSON contract.

### dbo.INV_AdjustInv

Coordinates selected quantity and serial effects for an inventory transaction.

Evidence: [reading copy](sql/1128703419.sql), lines 40-251; original definition SHA-256 `362ff83361dded24aae929aa0cf58685200b21bb3a7991f880fca97a00e8de93`; reading SHA-256 `b77007a8973b5368936124674524c79420b1816c140e116f148a722f5a6696ce`.

**Input/default/null handling:** Attribute IDs default NULL; isNegativeAvailableAllowed defaults false; catchWeight, catchWeightUM and shipContNum default NULL. Other parameters have no declared defaults. NULL/zero quantity, both locations NULL or item NULL logs audit then returns before adjustment. Zero attribute IDs become NULL. Without a serial group, selected transaction/location/tracking-mode checks can reject. ITEM scalar lookup accepts supplied or NULL company; duplicate matches can fail rather than establish precedence.

**Outputs:** No explicit result set or OUTPUT parameter. Child result sets can flow through, including conditional inventory-ID SELECTs in pick/put.

**Reads:** ITEM, LOCATION

**Direct writes:** None directly in the reviewed body.

**Calls:** ADT_LogAudit, RSCMfn_RtrvMsg, DHfn_TransToSQLDate, INV_ValidateSerialNums, INV_PickSerialNumbers, INV_PickFromLocation, INV_PutIntoLocation, INV_PutSerialNumbers

**Configuration:** Plus/minus effect characters are caller inputs, not warehouse configuration. ITEM.SERIAL_NUM_TRACKING mode 7 and LOCATION class participate in selected checks; active values and full mode taxonomy remain unknown.

**Errors and returns:** Invalid basic input uses bare RETURN after audit; coded serial/location rejections raise severity 18 and return -1. Location calls check SQL error then child code; serial calls propagate child codes.

**Transactions:** No BEGIN/COMMIT/ROLLBACK or TRY/CATCH in this routine. Caller transaction and nested-callee transaction scope remain unverified; error/return is not a rollback guarantee.

**Concurrency:** No explicit coordinator locks. Child locking and caller transaction determine isolation.

**Triggers:** Captured catalog contains no trigger on the inventory/serial/lot/UOM/threshold tables written here. The only WORK_INSTRUCTION trigger is INSERT-only; no direct INSERT into that table occurs here. Nested-callee effects remain separate.

**External handoffs:** No direct external service/device/label/network call established in this body. Application caller and downstream interpretation remain unverified.

**Remaining gaps:** Application transaction/effect mapping and unlisted helper contracts remain open.

**Ordered effects:**

1. Audit invalid basic input and stop; convert date strings; normalize zero attribute IDs. (reading lines 123-165)
2. Check missing serial-group branch. For a supplied group not ending in minus and source on-hand effect minus, validate serial quantity, then unlink selected serials; propagate nonzero child codes. (reading lines 167-210)
3. Call source adjustment for on-hand minus or any allocated/in-transit/suspense plus/minus effect; retain source date/status/attribute/UOM outputs. (reading lines 215-225)
4. Call destination adjustment for on-hand plus or other destination quantity plus/minus effects; then conditionally link serials when destination on-hand is plus and source-effect/serial-count conditions permit. (reading lines 229-250)

### dbo.INV_PickFromLocation

Changes source inventory quantities and coordinates empty-row, lot, count-threshold and history effects.

Evidence: [reading copy](sql/1400704388.sql), lines 82-828; original definition SHA-256 `ee688bd90536748cd6f1eeb1015d39199a62236adeb6ebe97b79d6bbde31398c`; reading SHA-256 `75f63d082a4062e9b815f5797a8c53d333828c5cf2bec75cea0e22c978d999d2`.

**Input/default/null handling:** isNegativeAvailableAllowed defaults false; catchWeight/catchWeightUM/shipContNum default NULL. OUTPUT parameters have no defaults. Matching permits NULL company and permanent-row NULL lot/container/attribute alternatives. Missing inventory can cause insertion of a zero-quantity row. Missing/blank inventory status uses SYSTEM_CONFIG_DETAIL in the create path. Multiple matching variable assignments have no deterministic tie-break.

**Outputs:** Twelve OUTPUT parameters carry source dates, status, item presentation attributes, history flag, UOM-ID list and inventory ID. Permanent-row branch emits INTERNAL_LOCATION_INV SELECT (395-401); NOCOUNT does not suppress this result.

**Reads:** ITEM, LOCATION, LOCATION_INVENTORY, LOCATION_UNIT_OF_MEASURE, SYSTEM_CONFIG_DETAIL, CATCH_WEIGHT_INFORMATION, SHIPPING_CONTAINER_CATCH_WEIGHT_INFORMATION, WORK_TYPE

**Direct writes:** LOCATION (UPDATE), LOCATION_INVENTORY (UPDATE/DELETE; insertion delegated), LOCATION_UNIT_OF_MEASURE (UPDATE/DELETE), CATCH_WEIGHT_INFORMATION (UPDATE/DELETE), SHIPPING_CONTAINER_CATCH_WEIGHT_INFORMATION (DELETE)

**Calls:** fn_GetFeatureEnabled, sp_getapplock, INV_InsertLocationInventory, RSCMfn_RtrvMsg, INV_ArchiveSerialNumbers, INV_UpdateFromLocInv, INV_ProcessLotInNewInventory, INV_ProcessLotWhenEmptyingInv, INV_CheckLocThreshold, INV_UpdateLocation, INV_SaveHistInvChg

**Configuration:** LOCATION.TRACK_CONTAINERS, ALLOCATE_IN_TRANSIT, LOCATION_CLASS and permanent flags affect branches. Catch-weight needs feature/item flag plus supplied weight/unit and work/shipping-container context. System separator/default-status lookups have key/record-type predicates without warehouse/company scope in this body.

**Errors and returns:** Most helper calls return checked SQL/nonzero child errors. Serial-archive return is assigned without an immediate check. Errors may follow prior writes. Three failed outer optimistic attempts raise severity 18; the inner missing-row loop is not separately capped by that counter. No explicit success RETURN.

**Transactions:** No BEGIN/COMMIT/ROLLBACK or TRY/CATCH in this routine. Caller transaction and nested-callee transaction scope remain unverified; error/return is not a rollback guarantee.

**Concurrency:** Application-lock result is stored but not checked; no explicit LockOwner/release or local transaction. Timeout -1 leaves waiting unbounded at this call. UPDLOCK and initial-quantity predicates protect individual operations, not demonstrated whole-flow atomicity; lock resource is concatenated without separators.

**Triggers:** Captured catalog contains no trigger on the inventory/serial/lot/UOM/threshold tables written here. The only WORK_INSTRUCTION trigger is INSERT-only; no direct INSERT into that table occurs here. Nested-callee effects remain separate.

**External handoffs:** No direct external service/device/label/network call established in this body. Application caller and downstream interpretation remain unverified.

**Remaining gaps:** Insert/update/location/history and feature helpers need separate full contracts. Caller lock ownership/release, actual values and execution remain unverified.

**Ordered effects:**

1. Resolve feature/item/attribute context; request exclusive application lock with timeout -1; read inventory WITH (UPDLOCK); insert zero-quantity inventory when no match. (reading lines 197-338)
2. Reject required-container omissions. Each quantity bucket adds, subtracts or retains requested quantity. Force-zero flags can retain already nonpositive on-hand or clamp a negative result to zero. (reading lines 341-387)
3. When all four new buckets are zero, retain permanent inventory or archive serials, detach/delete UOMs, remove eligible catch-weight links and delete nonpermanent inventory using initial quantities. Otherwise check negative availability and call source update. Count failed optimistic quantity matches toward three attempts. (reading lines 393-584)
4. Reject exhausted attempts. For initially empty inventory populate lot/container/attribute context and call lot creation; for resulting empty inventory conditionally call lot cleanup and delete remaining linked UOMs. Set source inventory ID output. (reading lines 587-677)
5. For on-hand minus, sum source item/company inventory and call cycle-count threshold logic. Update location, conditionally adjust catch weight, then save inventory-change history. (reading lines 679-827)

### dbo.INV_PutIntoLocation

Creates or updates destination inventory and transfers, copies or cleans up unit-of-measure records.

Evidence: [reading copy](sql/1464704616.sql), lines 102-1234; original definition SHA-256 `6c20f44f12558f31d9ca6765c33a8952275f46ab5718fbe209f5266735494142`; reading SHA-256 `8986ffa4b9635c50100e3f8b6b00a2b4a29f3cc25f0f8357337d80ac760579de`.

**Input/default/null handling:** isNegativeAvailableAllowed defaults false; catchWeight/catchWeightUM/shipContNum default NULL. toLocInvAttributeId is OUTPUT without default. Non-NULL source expiration takes precedence over supplied expiration. Selected location/transaction branches recalculate aging/received dates. Existing/source/supplied/default status precedence is branch-specific. Receipt-container lookup accepts either container ID without warehouse predicate or tie-break.

**Outputs:** OUTPUT toLocInvAttributeId can change through reuse/copy/clearing. Permanent-row branch emits INTERNAL_LOCATION_INV SELECT (726-732); helper result sets remain unreviewed.

**Reads:** LOCATION, ITEM, RECEIPT_CONTAINER, LOCATION_INVENTORY, LOCATION_INVENTORY_ATTRIBUTES, LOCATION_UNIT_OF_MEASURE, WORK_INSTRUCTION, SYSTEM_CONFIG_DETAIL

**Direct writes:** LOCATION_INVENTORY_ATTRIBUTES (INSERT), LOCATION_UNIT_OF_MEASURE (INSERT/UPDATE/DELETE including dynamic), LOCATION_INVENTORY (DELETE; insert/update delegated), CATCH_WEIGHT_INFORMATION (DELETE), SHIPPING_CONTAINER_CATCH_WEIGHT_INFORMATION (DELETE)

**Calls:** fn_GetFeatureEnabled, INVfn_AreInvAttributeValuesSame, sp_getapplock, INV_InsertLocationInventory, sp_executesql, INV_CopyLocUmsForDestInventory, INV_ArchiveSerialNumbers, INV_UpdateToLocInv, INV_ProcessLotInNewInventory, INV_ProcessLotWhenEmptyingInv, RSCMfn_RtrvMsg, INV_UpdateLocation, INV_UpsertCatchWeightInfo, INV_SaveHistInvChg

**Configuration:** Location class, MULTI_ITEM/container rules, ALLOCATE_IN_TRANSIT and permanent flags affect branches and lock resource breadth. Feature/item catch-weight flag is read; feature-function precedence not reviewed. No universal warehouse/company status precedence established.

**Errors and returns:** Checked SQL/child errors return -1/child code; coded business/optimistic failures raise severity 18. Several UOM-copy calls and the serial-archive call lack immediate return-code handling. Dynamic executions do not all receive immediate checks.

**Transactions:** No BEGIN/COMMIT/ROLLBACK or TRY/CATCH in this routine. Caller transaction and nested-callee transaction scope remain unverified; error/return is not a rollback guarantee.

**Concurrency:** Three failed optimistic attempts are bounded; application-lock return is not checked; timeout -1 and no local transaction/release. Attribute copies use @@IDENTITY; no captured attribute-table trigger, not a cross-version identity guarantee. Dynamic expressions concatenate inputs with selective replacements. Fixed targets reviewed; input safety and atomicity unverified.

**Triggers:** Captured catalog contains no trigger on the inventory/serial/lot/UOM/threshold tables written here. The only WORK_INSTRUCTION trigger is INSERT-only; no direct INSERT into that table occurs here. Nested-callee effects remain separate.

**External handoffs:** No direct external service/device/label/network call established in this body. Application caller and downstream interpretation remain unverified.

**Remaining gaps:** Nine dynamic sites have fixed-table effects reviewed, but runtime input grammar, nested helper effects and caller transaction remain open.

**Ordered effects:**

1. Validate destination container; derive feature/receipt/date/status/UOM-copy context; optionally reuse equal attributes. (reading lines 225-450)
2. Request exclusive application lock, read inventory WITH (UPDLOCK), choose create/update. Nonzero inventory with a different status can choose create, subject to location-class exclusions. Copy attributes when needed; delegate insertion. (reading lines 452-595)
3. After successful creation, dynamically reassign/remove carried UOMs and optionally copy destination UOMs. Failed insertion increments optimistic counter. (reading lines 601-680)
4. Calculate four buckets. For all-zero nonpermanent inventory archive serials, detach UOMs, remove eligible catch-weight links and delete using initial quantities. Otherwise handle empty permanent rows, optional attribute copies and negative-availability guard, then delegate update. (reading lines 686-888)
5. On successful update, dynamic branches delete duplicates, reassign UOMs, retrieve source location and clean eligible leftovers. Fallback UOM insert/copy follows the loop. (reading lines 893-1104)
6. Handle lot creation/cleanup; reject exhausted attempts; dynamically delete carried UOMs still unlinked; update location; conditionally upsert catch weight; save history. (reading lines 1106-1233)

### dbo.INV_ValidateSerialNums

Checks selected serial groups against quantity for qualifying transactions.

Evidence: [reading copy](sql/1608705129.sql), lines 15-104; original definition SHA-256 `635cdaa6102b251268a77aa102478e353ad7c6338c735be219e55fc28293dc79`; reading SHA-256 `70213db8195a3b7768feef0636aea877a4a94807ac056c4de7dcbaeb68f836be`.

**Input/default/null handling:** fromLocInvAttributeId defaults NULL; no other defaults. NULL company and permanent NULL keys can match. No inventory, NULL group, unsupported transaction/mode or zero serial arguments bypass the count comparison.

**Outputs:** No explicit result set or OUTPUT parameter.

**Reads:** LOCATION_INVENTORY, LOCATION, ITEM, INVENTORY_ARGUMENT, SERIAL_NUMBER

**Direct writes:** None directly in the reviewed body.

**Calls:** None directly in the reviewed body.

**Configuration:** ITEM tracking mode and location class select checks; not every transaction is covered.

**Errors and returns:** Mismatch raises severity 18 then returns -1; implicit SQL failures are not caught.

**Transactions:** No BEGIN/COMMIT/ROLLBACK or TRY/CATCH in this routine. Caller transaction and nested-callee transaction scope remain unverified; error/return is not a rollback guarantee.

**Concurrency:** No lock hints. Inventory multi-match has no tie-break; duplicate scalar ITEM matches can fail. Validation and later unlink are separate.

**Triggers:** Captured catalog contains no trigger on the inventory/serial/lot/UOM/threshold tables written here. The only WORK_INSTRUCTION trigger is INSERT-only; no direct INSERT into that table occurs here. Nested-callee effects remain separate.

**External handoffs:** No direct external service/device/label/network call established in this body. Application caller and downstream interpretation remain unverified.

**Remaining gaps:** DISTINCT group count is the code rule; no actual serial list/quantity or full master/minor lifecycle was validated.

**Ordered effects:**

1. Find qualifying source inventory and scalar item tracking mode. (reading lines 34-65)
2. For matching inventory, supplied group and selected transactions in tracking mode 7, first count serial arguments. Only when positive, compare DISTINCT serial GROUP_ID values at that inventory with requested quantity and reject mismatch. (reading lines 68-98)

### dbo.INV_PickSerialNumbers

Unlinks selected serial records from source inventory and location containers.

Evidence: [reading copy](sql/1416704445.sql), lines 15-69; original definition SHA-256 `41ed0b852e3c05fc6e788779755b0fdfd82181718a504824e167b6d297f54627`; reading SHA-256 `e763924616e0e97b2f8d56b00a30978cb815a76741550b7a1e65fefd04d9e535`.

**Input/default/null handling:** No defaults; sernCount is OUTPUT. NULL group matches no ordinary group rows. Selected argument values are cast numeric without validation here.

**Outputs:** sernCount receives UPDATE row count, not distinct master/group count. No explicit result set.

**Reads:** ITEM, INVENTORY_ARGUMENT, SERIAL_NUMBER

**Direct writes:** SERIAL_NUMBER (UPDATE)

**Calls:** None directly in the reviewed body.

**Configuration:** Precheck depends on transaction/mode; unlinking itself is not limited to mode 7.

**Errors and returns:** Precheck failure raises severity 18 and returns -1; checked update error returns -1.

**Transactions:** No BEGIN/COMMIT/ROLLBACK or TRY/CATCH in this routine. Caller transaction and nested-callee transaction scope remain unverified; error/return is not a rollback guarantee.

**Concurrency:** Precheck uses NOLOCK on SERIAL_NUMBER; precheck/update is not demonstrated atomic.

**Triggers:** Captured catalog contains no trigger on the inventory/serial/lot/UOM/threshold tables written here. The only WORK_INSTRUCTION trigger is INSERT-only; no direct INSERT into that table occurs here. Nested-callee effects remain separate.

**External handoffs:** No direct external service/device/label/network call established in this body. Application caller and downstream interpretation remain unverified.

**Remaining gaps:** Argument integrity, application serialization and current linkage remain unknown.

**Ordered effects:**

1. For selected transactions in tracking mode 7, compare selected linked-serial count to serial-argument count; reject mismatch. (reading lines 27-54)
2. Set LOC_INV_NUM and LOC_CONT_NUM to NULL for selected serial object IDs; capture UPDATE row count/error. (reading lines 57-66)

### dbo.INV_PutSerialNumbers

Associates selected serial records with destination inventory.

Evidence: [reading copy](sql/1480704673.sql), lines 14-48; original definition SHA-256 `561ea31684660c57b362b2c48503a9ab9d363ff0d628392be422d2c7f578ba1f`; reading SHA-256 `e74eed30a9c38f95239e7174a80c3a36689bca0de3ecdc49c5eacb4a55752a1d`.

**Input/default/null handling:** No defaults. Company/lot/container compare with null-normalized equality; NULL attribute ID matches as zero. No matched inventory leaves locInvNum NULL; serial UPDATE can set NULL linkage without explicit no-match error.

**Outputs:** No result set/OUTPUT; no affected-row-count success requirement.

**Reads:** LOCATION_INVENTORY, INVENTORY_ARGUMENT

**Direct writes:** SERIAL_NUMBER (UPDATE)

**Calls:** None directly in the reviewed body.

**Configuration:** Supplied identity context governs matching; no configuration read.

**Errors and returns:** SQL checks after lookup/update return -1; no requirement for matching destination or serial rows.

**Transactions:** No BEGIN/COMMIT/ROLLBACK or TRY/CATCH in this routine. Caller transaction and nested-callee transaction scope remain unverified; error/return is not a rollback guarantee.

**Concurrency:** No lock/uniqueness check or ordered multi-match choice.

**Triggers:** Captured catalog contains no trigger on the inventory/serial/lot/UOM/threshold tables written here. The only WORK_INSTRUCTION trigger is INSERT-only; no direct INSERT into that table occurs here. Nested-callee effects remain separate.

**External handoffs:** No direct external service/device/label/network call established in this body. Application caller and downstream interpretation remain unverified.

**Remaining gaps:** Destination existence and key uniqueness require caller/data evidence.

**Ordered effects:**

1. Resolve destination by location/warehouse/item/company/lot/container/attributes. (reading lines 29-38)
2. Update selected serial LOC_INV_NUM. LOC_CONT_NUM is not restored here. (reading lines 40-47)

### dbo.INV_ArchiveSerialNumbers

Copies serial records to history before conditionally removing active records.

Evidence: [reading copy](sql/1144703476.sql), lines 11-54; original definition SHA-256 `8084142916ec21e90dc8dac17e3a94bcec1c29b8e7a014b78866de919dddde28`; reading SHA-256 `04dd003e9e71b5835e433bb4d09046ce0bfd11ea201ffa3bad6b7299ebf88dc0`.

**Input/default/null handling:** stTransType defaults NULL. NULL locInvNum matches no ordinary linkage; NULL transaction uses generic copy/delete path.

**Outputs:** No explicit result set/OUTPUT.

**Reads:** SERIAL_NUMBER

**Direct writes:** AR_SERIAL_NUMBER (INSERT), SERIAL_NUMBER (DELETE)

**Calls:** None directly in the reviewed body.

**Configuration:** Transaction input selects the exception branch; no configuration read.

**Errors and returns:** Insert failure returns -1; explicit THROW follows insertion. Final DELETE lacks a subsequent explicit error-code check.

**Transactions:** No BEGIN/COMMIT/ROLLBACK or TRY/CATCH in this routine. Caller transaction and nested-callee transaction scope remain unverified; error/return is not a rollback guarantee.

**Concurrency:** Copy/delete have no local transaction or lock hints; caller rollback must be verified before claiming atomic archival.

**Triggers:** Captured catalog contains no trigger on the inventory/serial/lot/UOM/threshold tables written here. The only WORK_INSTRUCTION trigger is INSERT-only; no direct INSERT into that table occurs here. Nested-callee effects remain separate.

**External handoffs:** No direct external service/device/label/network call established in this body. Application caller and downstream interpretation remain unverified.

**Remaining gaps:** Private exception text/transaction label not published; retention, immutability and external archival not established.

**Ordered effects:**

1. Copy matching serial rows to AR_SERIAL_NUMBER with transaction-dependent field handling; capture error/row count. (reading lines 20-44)
2. A transaction-specific branch throws 51000 after nonempty insertion and before deletion. Otherwise delete active serial rows only when rows were copied. (reading lines 46-51)

### dbo.INV_ProcessLotInNewInventory

Creates a missing lot identity and attaches supplied lot attributes.

Evidence: [reading copy](sql/1432704502.sql), lines 17-113; original definition SHA-256 `9b2752c744893bc557774452348a3ceca5cb15a04f65b4ad08cbe1b6702e0b41`; reading SHA-256 `3f5cd7b8b517b41c09ea4cb9df5422be5f94fd61aa93668b0dca27ea12d2b261`.

**Input/default/null handling:** No defaults. NULL expiration is converted from a private sentinel through DHfn_TransToSQLDate; its value/meaning is not published. Item template matching permits generic company; no deterministic duplicate precedence. NULL argument group skips attributes.

**Outputs:** No result set/OUTPUT; inserted identity used internally.

**Reads:** LOCATION, ITEM, SYSTEM_CONFIG_DETAIL, LOT

**Direct writes:** LOT (INSERT)

**Calls:** DHfn_TransToSQLDate, INV_InsertLotAttributes

**Configuration:** Item lot template and unscoped frozen-status config govern creation. Existing LOT stays unchanged even if new inputs differ.

**Errors and returns:** Insert error returns -1; nonzero attribute helper result becomes -1. No explicit success RETURN.

**Transactions:** No BEGIN/COMMIT/ROLLBACK or TRY/CATCH in this routine. Caller transaction and nested-callee transaction scope remain unverified; error/return is not a rollback guarantee.

**Concurrency:** NOT EXISTS/INSERT has no explicit serialization. Identity primary key does not prove business-key uniqueness. Uses @@IDENTITY; no captured LOT trigger.

**Triggers:** Captured catalog contains no trigger on the inventory/serial/lot/UOM/threshold tables written here. The only WORK_INSTRUCTION trigger is INSERT-only; no direct INSERT into that table occurs here. Nested-callee effects remain separate.

**External handoffs:** No direct external service/device/label/network call established in this body. Application caller and downstream interpretation remain unverified.

**Remaining gaps:** Location-class label, expiration sentinel, effective config and concurrency require further evidence.

**Ordered effects:**

1. Return for one location class; read item template/frozen-status setting; derive FROZEN; fill missing expiration through date helper. (reading lines 38-65)
2. Insert LOT only when matching lot/item/company-or-generic/warehouse is absent. Capture @@IDENTITY/error/row count; return if no insertion. (reading lines 69-105)
3. For supplied argument group, insert attributes for new lot identity. (reading lines 108-111)

### dbo.INV_ProcessLotWhenEmptyingInv

Copies eligible empty-lot records and attributes to history, then removes active rows.

Evidence: [reading copy](sql/1448704559.sql), lines 22-175; original definition SHA-256 `9c536bc1ce6c131124da2001272c85a187f6cf05a6e0e8469071a37153ed244a`; reading SHA-256 `ab5e0948a8c84b089c949d96817e91f33021fc81cbdd87f6809a36893826964d`.

**Input/default/null handling:** logisticsUnit defaults NULL. Company matches supplied or NULL-company record. Container NULL comparison explicitly includes supplied NULL/stored non-NULL; other NULL comparisons retain SQL semantics. NULL selected lot ID skips writes.

**Outputs:** No explicit result set/OUTPUT.

**Reads:** LOT, LOCATION_INVENTORY, LOCATION, LOT_ATTRIBUTE

**Direct writes:** AR_LOT (INSERT), AR_LOT_ATTRIBUTE (INSERT), LOT_ATTRIBUTE (DELETE), LOT (DELETE)

**Calls:** None directly in the reviewed body.

**Configuration:** Location class and supplied departure context govern exclusions; no configuration table read.

**Errors and returns:** Checked attribute-copy/delete failures return -1. First AR_LOT insert lacks an immediate dedicated check before next insert.

**Transactions:** No BEGIN/COMMIT/ROLLBACK or TRY/CATCH in this routine. Caller transaction and nested-callee transaction scope remain unverified; error/return is not a rollback guarantee.

**Concurrency:** Selection/copy/deletion separate without explicit locks or transaction. Multi-match lot assignment has no tie-break.

**Triggers:** Captured catalog contains no trigger on the inventory/serial/lot/UOM/threshold tables written here. The only WORK_INSTRUCTION trigger is INSERT-only; no direct INSERT into that table occurs here. Nested-callee effects remain separate.

**External handoffs:** No direct external service/device/label/network call established in this body. Application caller and downstream interpretation remain unverified.

**Remaining gaps:** No warehouse-wide empty-stock conclusion follows from a predicate excluding departing context and one class.

**Ordered effects:**

1. Find lot only when no qualifying inventory exists at another location or qualifying different container, excluding one location class. Tests row existence, not quantity SUM. (reading lines 38-75)
2. Copy selected lot and its attributes to AR_LOT and AR_LOT_ATTRIBUTE. (reading lines 77-165)
3. Delete active attributes then lot, checking each delete. (reading lines 167-171)

### dbo.INV_InsertLotAttributes

Converts lot-attribute arguments into stored attribute rows.

Evidence: [reading copy](sql/1256703875.sql), lines 17-55; original definition SHA-256 `9a6c77a44c7a5865ec1e0275b993a8987a72d53c0b9366b91fdbc21b8127cc6d`; reading SHA-256 `a1a3c696a9ef59cbeb3bd70f6a1a07ad5d2b91da8542a0667d0440d40c07fee5`.

**Input/default/null handling:** No defaults. NULL group skips insertion. Argument text splits at first comma; prefix casts numeric and remainder is value. No delimiter, numeric-prefix, length or duplicate-attribute validation here.

**Outputs:** No result set/OUTPUT; returns @@ERROR.

**Reads:** INVENTORY_ARGUMENT

**Direct writes:** LOT_ATTRIBUTE (INSERT)

**Calls:** None directly in the reviewed body.

**Configuration:** Argument category fixed; LOT_ATTRIBUTE foreign keys can reject unknown lot/template identities.

**Errors and returns:** Parsing/conversion/FK/length errors may raise; no TRY/CATCH converts every failure to nominal return.

**Transactions:** No BEGIN/COMMIT/ROLLBACK or TRY/CATCH in this routine. Caller transaction and nested-callee transaction scope remain unverified; error/return is not a rollback guarantee.

**Concurrency:** INSERT SELECT lacks duplicate guard; retries not proven idempotent.

**Triggers:** Captured catalog contains no trigger on the inventory/serial/lot/UOM/threshold tables written here. The only WORK_INSTRUCTION trigger is INSERT-only; no direct INSERT into that table occurs here. Nested-callee effects remain separate.

**External handoffs:** No direct external service/device/label/network call established in this body. Application caller and downstream interpretation remain unverified.

**Remaining gaps:** Argument producer and upstream validation remain unreviewed.

**Ordered effects:**

1. For supplied group, select lot-attribute category, parse template ID/value at first comma, insert with lot ID/stamps. (reading lines 26-47)
2. Return current SQL error code. (reading lines 50-50)

### dbo.INV_CheckLocThreshold

Evaluates activity-driven count thresholds after source quantity changes.

Evidence: [reading copy](sql/1160703533.sql), lines 4-205; original definition SHA-256 `2883358067877b581e4e951f5f0518cdd4998a2a913bd3bfc34fd8387ff7978a`; reading SHA-256 `1723eed69b74a258bec467e61523165fb454c8a3088169c068050265307c7065`.

**Input/default/null handling:** No defaults. NULL location-type/work-zone/movement-class threshold values act as broad matches. No rule returns 0. Missing last-count date bypasses day gate. Optional unit conversion follows NULL/different-unit conditions; NULL arithmetic not replaced with assumed defaults.

**Outputs:** No explicit result set/OUTPUT; early non-error paths return 0.

**Reads:** CYCLE_COUNT_THRESHOLD, LOCATION, LOCATION_INVENTORY, CYCLE_COUNT_REQUEST

**Direct writes:** CYCLE_COUNT_REQUEST (DELETE), WORK_INSTRUCTION (DELETE)

**Calls:** GetWarehouseTimezoneValue, RSCMfn_RtrvMsg, SH_FillStringWithVarData, HIST_SaveProcHist, ITMfn_CalcQtyForReqUm, CCP_CheckToUpdateCCRequest, CCP_CreateCCRequest

**Configuration:** Threshold dimensions, active flag, quantity/unit and days-between govern eligibility. Duplicate matching rows have no unique tie-break. AIM preference for immediate RF versus pending request is application-level; effective preference not established here.

**Errors and returns:** Early exits return 0; checked helper errors return -1/child code. First request-helper return can be overwritten by later creation; direct DELETEs lack immediate checks.

**Transactions:** No BEGIN/COMMIT/ROLLBACK or TRY/CATCH in this routine. Caller transaction and nested-callee transaction scope remain unverified; error/return is not a rollback guarantee.

**Concurrency:** No explicit locks/transaction; count-then-create not proof of duplicate prevention.

**Triggers:** Captured catalog contains no trigger on the inventory/serial/lot/UOM/threshold tables written here. The only WORK_INSTRUCTION trigger is INSERT-only; no direct INSERT into that table occurs here. Nested-callee effects remain separate.

**External handoffs:** No direct external service/device/label/network call established in this body. Application caller and downstream interpretation remain unverified.

**Remaining gaps:** Request creation/update helpers remain unreviewed. This is cycle-count behavior, not a reviewed replenishment trigger.

**Ordered effects:**

1. Read active threshold matches; ORDER BY assigns variables across all rows without TOP. Do not claim first/most-specific row wins. (reading lines 43-67)
2. If too soon since last count, write process history and return; convert threshold quantity when units differ. (reading lines 71-116)
3. Above-threshold path can delete matching requests/cycle-count work when the specific inventory key is empty, then returns. Zero item quantity with positive location total also returns. (reading lines 119-180)
4. Call request-update checker, count coded empty-item requests, and call creation helper only for action 1 with none found. Check final error/child result. (reading lines 184-203)

## Dynamic execution and unresolved references

Five lexical candidates were reviewed: four contain only named procedure calls with return-value variables; destination placement contains nine constructed-query sites. The fixed dynamic targets are LOCATION_UNIT_OF_MEASURE and a LOCATION_INVENTORY read used by cleanup. Input safety, caller isolation and nested-helper effects remain open.

28 catalog-unresolved dependencies have explicit named-call evidence and same-name catalog candidates. They remain unresolved for runtime name resolution; no alias or procedure-binding guarantee is invented.

## Evidence limits and next work

Source/destination movement can emit conditional inventory-ID result sets. Error returns do not guarantee rollback. Serial placement has no explicit missing-destination guard. Lot cleanup checks remaining qualifying rows with exclusions, not a warehouse quantity total. Threshold selection assigns variables across ordered matches without TOP; intended specificity precedence is not certified.

Review INV_InsertLocationInventory, INV_UpdateFromLocInv, INV_UpdateToLocInv, INV_CopyLocUmsForDestInventory, INV_UpdateLocation, INV_SaveHistInvChg, INV_UpsertCatchWeightInfo and the CCP request helpers next. Continue receipt/locating/replenishment callers after these child boundaries, without treating role assignments or authored questions as runtime acceptance.

Outcome: DONE_WITH_CONCERNS

Delivery state: Additive local inventory batch and readable contracts; coordinator integration/independent verification separate.

Product state: Bounded static semantics and novice help; full family/caller/runtime/configuration/app acceptance remains open.

Gate/authority state: Authorized documentation-only continuation; no DB effects, publication, deployment or final owner acceptance claimed.
