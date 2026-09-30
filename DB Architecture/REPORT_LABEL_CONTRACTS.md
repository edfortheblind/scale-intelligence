# Report and label data: source contracts

This guide explains what the captured report and label procedures return. The owner attests that the replica is current. No version or build identification is required to use these explanations.

Each procedure prepares data. A result row does not itself establish a printed label, a rendered report, a completed pick, a putaway or a shipment. The plain explanations below are followed by optional source details.

The batch contains 76 complete procedure-body reviews: 67 report procedures and 9 label procedures. It adds 25 help topics and 50 authored evaluation cases. Table roles are reviewed separately. Source identifiers and hashes are retained in [the structured batch](mappings/batches/report-label-contracts.json).

## Why a GS1 label can show a fallback instead of one item or serial

The label helper checks whether the selected container can be represented by one item, lot and serial. Its search covers a limited number of nested container levels. Multiple serial rows can trigger a fallback, including the same serial present in both current and retained records. The quantity is not always a total of everything in the container.

- The direct item-container path sets quantity to 1 and uses the container type as its unit. The alternate cursor path groups descendants and retains the current group quantity.
- The descendant checks cover the selected container and up to three child levels. Active and retained serial rows are combined without deduplication.
- The header removes the first two characters of the container ID and keeps at most 18 more; it does not validate a prefix.
- The lot-expiry lookup has no warehouse filter. Multiple matching lot rows assign the expiry variable without a defined order.
- Optional technical evidence: the cursor fallback tests @@CURSOR_ROWS < 1, including negative row-count reporting. Cursor kind/defaults and runtime count behavior are unverified, so the fallback does not by itself prove that no rows qualify.

Source: [LBL_GS1AILabelDetail](sql/21223476.sql), [LBL_GS1AILabelHeader](sql/37223533.sql).

## Where location, break and finished-good label fields come from

These label routines read stored fields for the selected record. The location label converts on-hand quantity to a whole number and formats expiration as a date. The finished-good label reads the putaway unit; the break label joins its container to the shipment. Reading these fields does not move stock or print a label.

- A missing optional company keeps the location row but leaves company output blank. Integer conversion can lose fractional quantity.
- The break label requires a matching shipment; the finished-good label reads its stored item, quantity and destination directly.

Source: [LBL_LocationInventory](sql/53223590.sql), [LBL_FinishedGoodPutaway](sql/5223419.sql), [LBL_BreakLabel](sql/2104706896.sql).

## Why a work-instruction label header and details can differ

The header reads the parent work unit when the selected instruction has a parent. The detail helper either groups the children of a parent instruction or selects the chosen child. It adds quantities and chooses the smallest unit text; it does not convert quantities between units.

- Compare whether the selected instruction has a parent before comparing header and detail identities.
- A displayed unit chosen by MIN does not establish that all quantities use one unit.

Source: [LBL_WorkInstructionDetail](sql/69223647.sql), [LBL_WorkInstructionHeader](sql/85223704.sql).

## Why a cycle-count report can omit a group or repeat a request

The cycle-count detail reports select requests from a plan and join matching location inventory. A positive group number narrows the results. The other branch still excludes requests whose group is NULL. Multiple matching inventory records can repeat a request; the report does not total them into one row.

- The inventory join includes location, warehouse, item, company, lot and logistics unit. Missing inventory is allowed by the left join.
- The serial version adds helper-produced serial text; the header reads plan metadata separately.

Source: [RPT_CCListDetailsWSerns](sql/17747466.sql), [RPT_CycleCountListDetails](sql/145747922.sql), [RPT_CycleCountListHeader](sql/161747979.sql).

## Why purchase-order receipt reports show different totals or blanks

One report shows each linked receipt line, so the purchase-order quantity repeats beside several receipts. Another groups receipt quantities under purchase-order display fields. Their missing-receipt values differ: some fields become zero while others stay NULL. Repeated purchase-order quantities should not be added as separate orders.

- The receipt-row version keeps individual receipt matches. The summary groups by displayed purchase-order fields rather than the detail object ID.
- A header with no detail rows can show a line count of zero while quantity sums stay NULL.

Source: [RPT_POStatusDetailsAndReceipts](sql/305748492.sql), [RPT_PurchaseOrderDetails](sql/321748549.sql), [RPT_PurchaseOrderHeader](sql/337748606.sql), [RPT_PurchaseOrderStatusDetails](sql/353748663.sql), [RPT_PurchaseOrderStatusHeader](sql/369748720.sql).

## How receipt status reports choose container quantities

Receipt status totals use selected container status numbers and only containers whose type is NULL. Empty sets can produce blank totals. The detail-with-containers report can retain a detail with no container, yet exclude a detail whose existing containers all have a non-NULL type.

- The header sums status 200, 300, 301 and 900 into separate named quantity fields. It does not change those statuses.
- The receiving worksheet repeats the receipt header total for each line; its DOCUMENT_TYPE parameter is unused.

Source: [RPT_ReceiptStatusDetails](sql/417748891.sql), [RPT_ReceiptStatusDtlsAndConts](sql/433748948.sql), [RPT_ReceiptStatusHeader](sql/449749005.sql), [RPT_ReceivingWorksheet](sql/465749062.sql).

## Which receipt containers appear on a putaway list

The detail report lists direct children of the selected receipt container. A child qualifies when it has a destination or matches the coded failed-status condition. The header describes the selected container itself. Neither report performs a putaway or recursively lists every descendant.

- Details join receipt lines and sort by destination then item. They show stored converted and base quantities separately.
- The header requires the matching receipt header and has no detail eligibility filter.

Source: [RPT_ContPutawayListDetails](sql/113747808.sql), [RPT_ContPutawayListHeader](sql/129747865.sql).

## Why packing-list versions include different containers

Packing-list variants use different container selection rules. Some use stored tree membership; the SSRS versions walk parent links from selected roots. A root may appear in one version and be excluded by another. The recursive queries do not add a shipment check to every descendant step.

- Compare the root selection and the descendant predicate in the exact routine. Stored tree membership and recursive parent traversal are not interchangeable.
- The SSRS versions use UNION ALL and a limited text path for sorting; they have no custom cycle guard or MAXRECURSION override.

Source: [RPT_ContainerPackListDetails](sql/49747580.sql), [RPT_ContainerPackListDetailsForSSRS](sql/65747637.sql), [RPT_ShipmentPackListDetails](sql/593749518.sql), [RPT_ShipmentPackListDetailsForSSRS](sql/609749575.sql).

## How serial text is added to a packing list

Serial packing lists call a helper that returns serial display text for each selected container. They do not directly join one report row per serial. The SSRS variant also walks parent links and rejoins the selected container, while other variants use stored tree membership. The source does not prove that a serial or container was physically shipped.

- The report calls RPTfn_GetShipContSernText for a container identity; the helper text is one projected value. Its internal behavior is a separate contract.
- Shipment-detail joins and the SSRS container rejoin can affect row multiplicity. The source container quantity is not a count of serial text entries.

Source: [RPT_ContPackListWSernsDetails](sql/97747751.sql), [RPT_ShipPackListWSernsDetails](sql/737750031.sql), [RPT_ShipPackListWSernsDetailsForSSRS](sql/753750088.sql).

## Which items and purchase order appear on a container contents label

The detail helper lists direct children and can also include the selected container itself when it has an item and container ID. It does not automatically include grandchildren. The header chooses one candidate purchase order without a defined order, so that value does not prove every line has the same purchase order.

- Both detail branches require a matching shipment detail. The self branch has item and container-ID checks that the direct-child branch does not have.
- Details combine with UNION ALL; a self-referential row could qualify twice. The header keeps its container when the optional purchase-order candidate is missing.

Source: [LBL_ContainerContentsDetails](sql/2120706953.sql), [LBL_ContainerContentsHeader](sql/2136707010.sql).

## Where packing-list component quantities come from

Component packing data first uses an associated positive work-order number. Without that path it can use the highest BOM revision. A positive work-order number with no matching component does not automatically fall back to the BOM. The latest revision lookup does not test an active flag or effective date.

- Identify whether the routine is scoped to a shipment or a shipment line.
- Tied BOM candidates or multiple matching components can create multiple output rows; quantity is computed from the selected source.

Source: [RPT_ShipPackListWCompsComps](sql/689749860.sql), [RPT_ShipPackListWCompsCompsForSSRS](sql/705749917.sql), [RPT_ShipPackListWCompsDetails](sql/721749974.sql).

## Why report ship-from addresses can remain blank

Several report headers prefer a warehouse-company address, then a company address, then the warehouse. They choose the source by whether a matching row exists. A blank field in the preferred row does not automatically fall back to the same field in the next source.

- Check which address row wins before investigating an individual missing phone, country or address line.
- The SSRS packing header container count subtracts distinct non-NULL parent IDs among named containers from the named-container count; it is not a universal root count.

Source: [RPT_CommonShipmentHeaderInfo](sql/33747523.sql), [RPT_ContainerPackListHeader](sql/81747694.sql), [RPT_OrderPickListHeader](sql/273748378.sql), [RPT_ShipmentPackListHeader](sql/625749632.sql), [RPT_ShipmentPackListHeaderForSSRS](sql/641749689.sql), [RPT_BatchPickListHeader](sql/2133231000.sql).

## Why allocation and shipment pick-list backorders differ

The allocation pick list subtracts allocated quantity from requested quantity. The shipment pick list subtracts total quantity instead. Both clamp a nonpositive difference to zero, and both use their own quantity basis for extended weight and price. NULL values can leave the calculated result blank.

- Allocation rows come from shipment allocation requests and show from-location; shipment rows come from shipment detail and show pick-location.
- These procedures read existing quantities; they do not allocate or pick inventory.

Source: [RPT_AllocationPickListDetails](sql/2101230886.sql), [RPT_ShipmentPickListDetails](sql/657749746.sql).

## Why batch and order pick lists handle missing detail differently

Both detail reports select child instructions of the requested parent and use a coded instruction type. The order pick report requires a matching shipment detail. The batch pick report keeps the instruction when the shipment detail is missing, leaving its optional detail fields blank.

- The detail sort is sequence, source location and item. Parent header routines select the instruction identified by the parameter.
- Report comment helpers receive DOCUMENT_TYPE; this does not itself establish a rendered document.

Source: [RPT_OrderPickListDetails](sql/257748321.sql), [RPT_BatchPickListDetails](sql/2117230943.sql), [RPT_OrderPickListHeader](sql/273748378.sql), [RPT_BatchPickListHeader](sql/2133231000.sql).

## How a picking-group report displays container quantities

The picking-group report joins each selected group container to its shipment line and immediate parent. The displayed container type can come from the parent. Separate coded conditions decide whether the display quantity is the stored quantity or one, and whether the display unit is a quantity unit or container type.

- Only the immediate parent is consulted; there is no recursive type lookup.
- The two conditions use separately redacted literals, so their equivalence is not assumed. Rows sort by location and group position.

Source: [RPT_PickingGroupPickList](sql/289748435.sql).

## Why replenishment report rows or headers can be missing

The request detail report filters by master, launch and a coded work-created value, then groups stored quantities by location, item, lot, units and user fields. Its header takes one matching row and can show launch -1 when launch statistics are absent. A separate work-instruction report also requires item descriptions to match.

- Grouping preserves differences in destination, lot, units and user fields; it does not convert units.
- The header order does not break ties between matching warehouses. A description mismatch can exclude an instruction even when its item matches.

Source: [RPT_ReplenishmentWorkPickList](sql/481749119.sql), [RPT_ReplenPickListDetails](sql/497749176.sql), [RPT_ReplenPickListHeader](sql/513749233.sql).

## What work-order assembly, component and putaway reports show

Assembly details show stored build levels and sequences. Component picks show only details matching the coded allocated flag and use stored needed quantities. The putaway report selects a putaway unit and joins its work-order header. Reading these reports does not build, allocate or move inventory.

- Assembly instructions sort by build level and sequence; component picks sort by source location.
- The header and putaway unit must match their supplied internal identifiers; the putaway join requires an existing work-order header.

Source: [RPT_WOAssmblyInstrsDetails](sql/817750316.sql), [RPT_WOAssmblyInstrsHeader](sql/833750373.sql), [RPT_WOComponentPickListDetails](sql/849750430.sql), [RPT_WOComponentPickListHeader](sql/865750487.sql), [RPT_WOPutawayList](sql/881750544.sql).

## Why a receiving appointment is shown only at certain hours

The daily schedule creates 24 hourly rows, then attaches an appointment at its start hour or end hour. It does not fill every hour in between. The day input is compared to a date at midnight, so a time-bearing day input can leave the appointment side empty. Multiple appointments can share an hour.

- The daily schedule requires exact dock and warehouse. Its trailer annotation counts matching trailer IDs across receipt headers without a date or warehouse restriction.
- The date-range summary includes both boundary dates and counts appointment join rows, not distinct receipts; repeated appointments can repeat receipt totals.

Source: [RPT_RecApptDaySchedule](sql/385748777.sql), [RPT_RecApptHeaderInfo](sql/401748834.sql).

## Why load container detail and carrier totals do not match row for row

Load container details select containers whose parent is NULL. Carrier totals come from shipment-view totals grouped by carrier and service. Those are different sources and groupings. The header chooses one available weight unit without a tie-breaking order, so it does not prove that every container uses that unit.

- Manifest details sort shipments by route and stop and use helpers for PO and comment text. Freight-term configuration can multiply rows when its join is not unique.
- A missing warehouse suppresses the load header; the optional carrier row requires service IS NULL.

Source: [RPT_ShipContListDetails](sql/529749290.sql), [RPT_ShipContListHeader](sql/545749347.sql), [RPT_ShipContListTotals](sql/561749404.sql), [RPT_TruckManifestDetails](sql/769750145.sql), [RPT_TruckManifestHeader](sql/785750202.sql).

## Why value-added activity and container lists have different row counts

The activity report returns individual activity rows joined to an activity name. The container report returns a container when at least one activity exists, so multiple activities do not multiply that container through the EXISTS check. Neither report filters to only incomplete activities.

- Both exclude a coded container type; NULL types also fail the inequality condition.
- The container list uses NOLOCK and does not require the activity master row that the activity detail join requires.

Source: [RPT_ShipContVasActivityList](sql/577749461.sql), [RPT_ShipmentVasActivityListDetails](sql/673749803.sql).

## How consolidated and multi-stop master BOL datasets differ

Both procedures return a header and a separate container result set. The consolidated version uses a load shipping-address row for the destination and includes all container levels. The multi-stop version takes the shipment with the highest stop sequence and includes containers matching the tree root or its direct tree-parent relationship.

- Ship-from company is chosen only when the load has one distinct non-NULL company; NULL company values do not increase that count.
- The highest stop sequence has no tie breaker. Both detail outputs use customer PO when non-NULL, otherwise ERP order, without a final order guarantee.

Source: [RPT_MasterBOLConsolHeader](sql/225748207.sql), [RPT_MasterBOLMultiStopHeader](sql/241748264.sql).

## Why a commercial invoice dataset can be empty

The commercial invoice requires a matching country configuration and at least one named container. Without those matches, it can return no lines. It repeats shipment container totals beside each line and only falls back to retained detail totals when an existing container group has a NULL sum. The export declaration uses different fields and formatting rules.

- Container totals count all named container rows, including nested ones; adding repeated line totals can overcount a shipment.
- Both datasets cast quantities to whole numbers and amounts to fixed decimals. The export declaration uses the execution date and tests some flags only for NULL, not their values.

Source: [RPT_Travis_Commercial_Invoice](sql/839062125.sql), [RPT_Shippers_Export_Declaration](sql/487672785.sql).

## Why an exchange-shipment report shows receipt data

The reviewed exchange report reads receipt header and receipt detail. Its status field is the receipt trailing status, and extended price is receipt total quantity times item net price. The report name does not mean that the procedure creates an exchange shipment.

- The header filters the internal receipt number; details sort by ERP order line and item.
- NULL quantity or price leaves extended price NULL.

Source: [RPT_ExchangeShipmentDetails](sql/177748036.sql), [RPT_ExchangeShipmentHeader](sql/193748093.sql).

## How the unsuffixed 1348 procedure selects and formats its data

The unsuffixed 1348 procedure starts with a selected parent container and its direct children by text container identifiers. It reads each matched shipment line, uses line metadata for formatting, and applies its eligibility expression. It does not execute a printer. The chosen quantity can differ from the stored line total when status 2 is 999.

- Completed quantity adds qualifying quantities from ten status slots using threshold 600. Eligibility compares that sum with requested quantity, with a separate coded MARK_FOR override.
- Formatting uses detail user_def6 and detail priority; another prefixed field uses detail user_def5. The procedure does not join item cross-reference.
- The effective total quantity becomes quantity_at_sts1 when status2 is 999. Integer and fixed-width formatting can lose fractions or width; DISTINCT removes identical projected rows.

Source: [RPT_1348](sql/2071678428.sql).

## Why 1348 reprints and named variants can produce different results

The captured 1348 procedures are separate implementations. Some take a container number, others a shipment ID or load input. Several reprint variants calculate an eligibility flag without filtering on it. Older variants also use different status thresholds, metadata sources and item-reference joins. A date suffix alone does not establish which version an application selects.

- The shipment-ID reprints join both shipment and line identities; the load reprint joins its detail by line and compares a text load input directly with SHIPPING_LOAD_NUM.
- Archive2 adds item/unit cross-reference; the 20220315 variant joins cross-reference by item alone; the unsuffixed body instead uses detail user_def5.
- The 20200807 variant tests the length of header priority but formats detail priority. The 20170913 variant formats header priority and uses threshold 650.

Source: [RPT_1348_Reprinting_byLOAD](sql/1943677972.sql), [RPT_1348_Reprinting_Archive2](sql/1959678029.sql), [RPT_1348_Reprinting_Archive](sql/1975678086.sql), [RPT_1348_bak20121206](sql/1991678143.sql), [RPT_1348_bak20120921](sql/2007678200.sql), [RPT_1348_20220315](sql/2023678257.sql), [RPT_1348_20200807](sql/2039678314.sql), [RPT_1348_20170913](sql/2055678371.sql), [RPT_1348](sql/2071678428.sql).

## Optional technical comparison: 1348 variants

These are distinct captured objects. Their names, including date and archive suffixes, do not establish which application caller selects them. The source files are retained reading copies of the current baseline, not operational print instructions.

| Procedure | Input and selection | Distinguishing behavior |
| --- | --- | --- |
| RPT_1348 | Parent internal container; OK filter | Threshold 600; detail user_def6, priority and user_def5; MARK_FOR equality override; no cross-reference join. |
| RPT_1348_20220315 | Parent internal container; OK filter | Threshold 600; mostly header user_def6; detail priority; item-only cross-reference join; mark_for_name LIKE override. |
| RPT_1348_20200807 | Parent internal container; OK filter | Threshold 600; header priority length but detail priority value; no cross-reference join. |
| RPT_1348_20170913 | Parent internal container; OK filter | Threshold 650; header priority and user_def6; attention without added prefix. |
| RPT_1348_bak20121206 | Parent internal container; completion equality | Threshold 650; status2=999 quantity substitution; description includes optional size; total quantity projected twice. |
| RPT_1348_bak20120921 | Parent internal container; completion equality | Threshold 650; unmodified total quantity and description; total quantity projected twice. |
| RPT_1348_Reprinting_Archive | Shipment ID; no final OK filter | SCI views; detail join uses shipment and line; threshold 650; no cross-reference join. |
| RPT_1348_Reprinting_Archive2 | Shipment ID; no final OK filter | SCI views; item/unit cross-reference without company/type restriction; reference values can multiply results. |
| RPT_1348_Reprinting_byLOAD | Text load input; no final OK filter | SCI views; SHIPPING_LOAD_NUM compared directly with text parameter; detail joins by line; threshold 650. |

All nine use DISTINCT over projected fields and NOLOCK reads. None declares a final ORDER BY. Text container-ID joins do not add warehouse/company scope. Opaque literal predicates and aliases remain explicit gaps; equality between independently redacted placeholders is not assumed.

## Complete source index

Each linked file was read through its complete retained body. The JSON contract preserves input declarations, output descriptions, direct dependencies, branch order, null/quantity behavior, source hash and full line bounds.

| Procedure | Reviewed purpose | Retained lines |
| --- | --- | --- |
| [dbo.LBL_FinishedGoodPutaway](sql/5223419.sql) | Read the item and destination of a finished-good putaway unit. | 1–30 |
| [dbo.RPT_CCListDetailsWSerns](sql/17747466.sql) | Read cycle-count detail with serial text. | 1–85 |
| [dbo.LBL_GS1AILabelDetail](sql/21223476.sql) | Prepare bounded GS1 application-identifier detail fields for a shipping container. | 1–264 |
| [dbo.RPT_CommonShipmentHeaderInfo](sql/33747523.sql) | Read common shipment header display and ship-from precedence. | 1–166 |
| [dbo.LBL_GS1AILabelHeader](sql/37223533.sql) | Read warehouse address and a shortened container identifier for label header data. | 1–51 |
| [dbo.RPT_ContainerPackListDetails](sql/49747580.sql) | Read packing rows from the selected container tree. | 1–88 |
| [dbo.LBL_LocationInventory](sql/53223590.sql) | Read label-facing location inventory quantities and descriptive fields. | 1–39 |
| [dbo.RPT_ContainerPackListDetailsForSSRS](sql/65747637.sql) | Read a recursive container subtree with hierarchy coordinates. | 1–127 |
| [dbo.LBL_WorkInstructionDetail](sql/69223647.sql) | Group the selected work instruction or its children for detail label data. | 1–36 |
| [dbo.RPT_ContainerPackListHeader](sql/81747694.sql) | Read container packing header and associated shipment display. | 1–145 |
| [dbo.LBL_WorkInstructionHeader](sql/85223704.sql) | Resolve the parent-or-self work unit for label header data. | 1–29 |
| [dbo.RPT_ContPackListWSernsDetails](sql/97747751.sql) | Read packing tree rows with serial-number display text. | 1–89 |
| [dbo.RPT_ContPutawayListDetails](sql/113747808.sql) | Project direct receipt-container children eligible for a putaway list. | 1–74 |
| [dbo.RPT_ContPutawayListHeader](sql/129747865.sql) | Project the selected receipt-container putaway header. | 1–80 |
| [dbo.RPT_CycleCountListDetails](sql/145747922.sql) | Read cycle-count detail without serial aggregation. | 1–86 |
| [dbo.RPT_CycleCountListHeader](sql/161747979.sql) | Read cycle-count plan header metadata. | 1–43 |
| [dbo.RPT_ExchangeShipmentDetails](sql/177748036.sql) | Project receipt detail rows used by an exchange-shipment report. | 1–54 |
| [dbo.RPT_ExchangeShipmentHeader](sql/193748093.sql) | Project receipt header used by an exchange-shipment report. | 1–58 |
| [dbo.RPT_MasterBOLConsolHeader](sql/225748207.sql) | Return consolidated master bill-of-lading header and a separate container detail result set. | 1–211 |
| [dbo.RPT_MasterBOLMultiStopHeader](sql/241748264.sql) | Return multi-stop master bill-of-lading header and a separate bounded tree-level container result. | 1–212 |
| [dbo.RPT_OrderPickListDetails](sql/257748321.sql) | Project child work instructions with shipment-line details for an order pick list. | 1–72 |
| [dbo.RPT_OrderPickListHeader](sql/273748378.sql) | Read order-picking work header with shipment and origin display. | 1–144 |
| [dbo.RPT_PickingGroupPickList](sql/289748435.sql) | Project a shipping-container picking group with parent container type and display quantities. | 1–83 |
| [dbo.RPT_POStatusDetailsAndReceipts](sql/305748492.sql) | Read purchase-order lines alongside each linked receipt line. | 1–66 |
| [dbo.RPT_PurchaseOrderDetails](sql/321748549.sql) | Read purchase-order detail with extended weight and price. | 1–39 |
| [dbo.RPT_PurchaseOrderHeader](sql/337748606.sql) | Read purchase-order header and origin address. | 1–41 |
| [dbo.RPT_PurchaseOrderStatusDetails](sql/353748663.sql) | Summarize linked receipt quantities under purchase-order detail display fields. | 1–66 |
| [dbo.RPT_PurchaseOrderStatusHeader](sql/369748720.sql) | Read purchase-order header with detail counts and sums. | 1–53 |
| [dbo.RPT_RecApptDaySchedule](sql/385748777.sql) | Build a 24-hour receiving appointment display for one day, dock and warehouse. | 1–112 |
| [dbo.RPT_RecApptHeaderInfo](sql/401748834.sql) | Aggregate receiving appointments by day,dock and warehouse. | 1–65 |
| [dbo.RPT_ReceiptStatusDetails](sql/417748891.sql) | Read receipt-line status quantities and open value. | 1–40 |
| [dbo.RPT_ReceiptStatusDtlsAndConts](sql/433748948.sql) | Read receipt lines with untyped-container status details. | 1–70 |
| [dbo.RPT_ReceiptStatusHeader](sql/449749005.sql) | Read receipt header with separate detail and container status aggregates. | 1–101 |
| [dbo.RPT_ReceivingWorksheet](sql/465749062.sql) | Read receiving worksheet rows and warehouse address. | 1–56 |
| [dbo.RPT_ReplenishmentWorkPickList](sql/481749119.sql) | Project replenishment child work instructions with matching item dimensions. | 1–65 |
| [dbo.RPT_Shippers_Export_Declaration](sql/487672785.sql) | Project an export declaration dataset from shipment header/details and optional company. | 1–116 |
| [dbo.RPT_ReplenPickListDetails](sql/497749176.sql) | Aggregate eligible replenishment requests for a master and launch. | 1–89 |
| [dbo.RPT_ReplenPickListHeader](sql/513749233.sql) | Project one replenishment header for a master and launch. | 1–56 |
| [dbo.RPT_ShipContListDetails](sql/529749290.sql) | Project root shipping containers belonging to shipments on a load. | 1–58 |
| [dbo.RPT_ShipContListHeader](sql/545749347.sql) | Project load carrier and warehouse-address header with one sample weight unit. | 1–76 |
| [dbo.RPT_ShipContListTotals](sql/561749404.sql) | Aggregate shipment view totals by carrier and service for a load. | 1–49 |
| [dbo.RPT_ShipContVasActivityList](sql/577749461.sql) | Project value-added activity details for qualifying shipment containers. | 1–45 |
| [dbo.RPT_ShipmentPackListDetails](sql/593749518.sql) | Read all container trees associated with a shipment. | 1–74 |
| [dbo.RPT_ShipmentPackListDetailsForSSRS](sql/609749575.sql) | Read shipment-rooted recursive packing hierarchies. | 1–96 |
| [dbo.RPT_ShipmentPackListHeader](sql/625749632.sql) | Read shipment packing header and origin address. | 1–138 |
| [dbo.RPT_ShipmentPackListHeaderForSSRS](sql/641749689.sql) | Read shipment packing header with derived packing count. | 1–250 |
| [dbo.RPT_ShipmentPickListDetails](sql/657749746.sql) | Project shipment detail rows for a pick list. | 1–78 |
| [dbo.RPT_ShipmentVasActivityListDetails](sql/673749803.sql) | Project shipment containers that have at least one value-added activity row. | 1–44 |
| [dbo.RPT_ShipPackListWCompsComps](sql/689749860.sql) | Calculate component quantities for every selected shipment line. | 1–94 |
| [dbo.RPT_ShipPackListWCompsCompsForSSRS](sql/705749917.sql) | Calculate component quantities for one shipment line. | 1–72 |
| [dbo.RPT_ShipPackListWCompsDetails](sql/721749974.sql) | Read shipment parent lines and one level of related component lines. | 1–77 |
| [dbo.RPT_ShipPackListWSernsDetails](sql/737750031.sql) | Read shipment container trees with serial display text. | 1–74 |
| [dbo.RPT_ShipPackListWSernsDetailsForSSRS](sql/753750088.sql) | Read recursive shipment packing hierarchy with serial text. | 1–112 |
| [dbo.RPT_TruckManifestDetails](sql/769750145.sql) | Project shipment manifest detail rows for a load. | 1–83 |
| [dbo.RPT_TruckManifestHeader](sql/785750202.sql) | Project load-level truck-manifest header. | 1–70 |
| [dbo.RPT_WOAssmblyInstrsDetails](sql/817750316.sql) | Project work-order assembly component instructions in stored build sequence. | 1–57 |
| [dbo.RPT_WOAssmblyInstrsHeader](sql/833750373.sql) | Project the assembly instruction header from a work order. | 1–53 |
| [dbo.RPT_Travis_Commercial_Invoice](sql/839062125.sql) | Project commercial-invoice line data with repeated shipment container totals. | 1–81 |
| [dbo.RPT_WOComponentPickListDetails](sql/849750430.sql) | Project allocated work-order components for a component pick list. | 1–55 |
| [dbo.RPT_WOComponentPickListHeader](sql/865750487.sql) | Project work-order component-pick header. | 1–56 |
| [dbo.RPT_WOPutawayList](sql/881750544.sql) | Project a single selected work-order putaway unit with its work-order header. | 1–68 |
| [dbo.RPT_1348_Reprinting_byLOAD](sql/1943677972.sql) | Project1348 reprint data selected by a load identifier. | 1–160 |
| [dbo.RPT_1348_Reprinting_Archive2](sql/1959678029.sql) | Project1348 shipment-ID reprint form including item cross-reference. | 1–172 |
| [dbo.RPT_1348_Reprinting_Archive](sql/1975678086.sql) | Project1348 shipment-ID reprint form without item cross-reference. | 1–167 |
| [dbo.RPT_1348_bak20121206](sql/1991678143.sql) | Project the20121206 backup1348 dataset for one parent container. | 1–84 |
| [dbo.RPT_1348_bak20120921](sql/2007678200.sql) | Project the20120921 backup1348 dataset for one parent container. | 1–80 |
| [dbo.RPT_1348_20220315](sql/2023678257.sql) | Project20220315 variant1348 dataset with item cross-reference lookup. | 1–175 |
| [dbo.RPT_1348_20200807](sql/2039678314.sql) | Project20200807 variant1348 dataset with mixed priority sources. | 1–168 |
| [dbo.RPT_1348_20170913](sql/2055678371.sql) | Project20170913 variant1348 dataset with header-sourced formatting. | 1–160 |
| [dbo.RPT_1348](sql/2071678428.sql) | Project the unsuffixed1348 form dataset for a parent container using detail metadata. | 1–210 |
| [dbo.RPT_AllocationPickListDetails](sql/2101230886.sql) | Project allocation-request rows for a shipment pick report. | 1–78 |
| [dbo.LBL_BreakLabel](sql/2104706896.sql) | Read shipment and carrier identifiers for a container break label. | 1–37 |
| [dbo.RPT_BatchPickListDetails](sql/2117230943.sql) | Project batch-pick child instructions with optional shipment details. | 1–80 |
| [dbo.LBL_ContainerContentsDetails](sql/2120706953.sql) | Read direct container contents and optional self-item label details. | 1–76 |
| [dbo.RPT_BatchPickListHeader](sql/2133231000.sql) | Project the requested batch parent instruction and optional shipment/header contact fields. | 1–101 |
| [dbo.LBL_ContainerContentsHeader](sql/2136707010.sql) | Read container/shipment header fields with one candidate customer purchase order. | 1–70 |

## Verification and remaining limits

Author checks validate exact captured identities, source hashes and complete line bounds, existing contract-schema requirements, dependency IDs, role taxonomy, topic references and evaluation-case structure. They do not execute the report, query warehouse rows or claim independent peer approval.

No existing semantic contracts, source manifests, SQL reading copies or table-role records are changed by this batch. No physical printer, rendering engine or operational process was invoked. Application caller selection, opaque literal meanings and end-to-end execution remain outside the stated evidence.
