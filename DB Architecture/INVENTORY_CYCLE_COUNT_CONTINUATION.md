# Inventory and cycle-count continuation

Current replica documented as-is. These explanations describe retained source behavior; they do not change or diagnose a current operational record. Version/build information is not a prerequisite for using this guide.

[Exact contracts and source bindings](mappings/batches/inventory-cycle-count-continuation.json).

## Why a cycle-count request may not be created

A request can be skipped because the minimum time since the last count has not elapsed, or because another open request already covers the same inventory identity. The duplicate check spans plans. The creation routine also uses the last insertion result, so its final return alone does not prove that nothing was created earlier.

1. Check the location, inventory identity and applicable count threshold.
2. Distinguish a time-threshold skip from an existing-request duplicate; inspect the existing request through an authorized application view.
3. Use the retained source explanation for edge cases; no SQL execution or unsupported record edit is recommended.

Sources: [CCP_CreateCCRequest](sql/1068179201.sql), [CCP_InsertCCRequest](sql/1132179429.sql), [CCP_CheckToUpdateCCRequest](sql/1052179144.sql)

## Why cycle-count plan totals may overlap

The reviewed plan recalculation includes the reviewed category in the open total. Adding open, reviewed and closed therefore can double-count requests. Plan completion also depends on having a master name and no nonclosed requests. The detail pane combines stored plan values with separately counted work and transactions.

1. Read each counter according to its source category; do not sum overlapping categories.
2. Separate a plan completion stamp from proof that all related application work is complete.

Sources: [CCB_UpdateCCPlan](sql/1036179087.sql), [CCP_InsertCCPlan](sql/1850802001.sql), [CCP_InsightDetailPaneData](sql/1148179486.sql)

## How cycle-count preferences affect work creation

Cycle-count work creation reads the user cycle-count preference for work type and team, then work-type defaults for priority and group. It also needs the source-identifier configuration. The bulk routine creates detail instructions and an aggregate parent; the logistics-unit routine creates one detail using existing work. These paths have different effects.

1. Identify which work-creation path the application uses.
2. Check the assigned preference, work type and required source-identifier setting using authorized configuration screens.
3. Review the resulting parent and detail work separately; a successful insert is not a completed count.

Sources: [CCP_CreateWorkFromRequest](sql/1100179315.sql), [CCP_CreateWorkForLogisticsUnit](sql/1084179258.sql), [CCP_UpdateWorkForNewInventory](sql/1212179714.sql)

## Why count work identity and sequence can differ

Count-request reconciliation can move or remove related work and can merge work units. Several selectors use different identity fields or scopes. Empty-location cleanup removes selected work without deleting the request; merging can remove an old parent and its remaining children. These source rules explain possible behavior but do not identify the cause of a particular stuck work unit.

1. Inspect the request, parent/detail work relationship and work-unit context in an authorized view.
2. Keep request existence, open-work count, work sequence and merge outcome separate.
3. Escalate a specific stuck record with its exact application message and sanitized state; do not infer a repair from a count alone.

Sources: [CCP_UpdateCCRequest](sql/1180179600.sql), [CCP_UpdateCCRequestWithWork](sql/1196179657.sql), [CCP_DeleteCCWorkInstrForEmptyLoc](sql/1116179372.sql), [CCP_MergeCCRequestsFromDifferentWorkUnits](sql/1164179543.sql), [CCR_InsightDetailPaneData](sql/1228179771.sql)

## Why an inventory update can affect no row

The source and destination update routines require all four initial quantities to still match. If another change has occurred, no row may be updated even when the SQL return code is zero. The caller must check the affected-row output. Clearing stock metadata also differs between the source and destination paths.

1. Compare the expected initial allocated, in-transit, on-hand and suspense quantities with the authorized current record.
2. Read the affected-row result as well as the return code; this documentation does not retry or change stock.

Sources: [INV_UpdateFromLocInv](sql/1528704844.sql), [INV_UpdateToLocInv](sql/1560704958.sql)

## How destination inventory defaults and restrictions are selected

New inventory uses location rules, item defaults and supplied source values. A missing location may be created with fixed defaults. Supplying only a volume or weight override still enables a shared override mode, so the other total can become NULL. UOM copying also has its own location and partial-mode rules.

1. Review the destination location class and multi-item rule before interpreting a rejected addition.
2. Check both override values and the applicable UOM; a missing value is not necessarily filled automatically.

Sources: [INV_InsertLocationInventory](sql/1240703818.sql), [INV_InsertLocation](sql/1224703761.sql), [INV_CopyLocUmsForDestInventory](sql/1176703590.sql), [INV_UpdateTotalsonLocInv](sql/1576705015.sql)

## Why Inventory Insight counts can differ from the selected detail

Insight detail panes combine several result sets. Inventory detail can be selected by inventory identity while its related-work counts use the caller item and location context. Load tiles mix stored totals with a line count. Lot transaction counts use item, company, lot and warehouse. These counts are useful context, not a complete diagnosis or permission to close work.

1. Confirm that the selected row and the caller context refer to the same inventory.
2. Check what each count includes before comparing it with another screen.

Sources: [INV_InsightDetailPaneData](sql/1272703932.sql), [INV_LoadInsightDetailPaneData](sql/1304704046.sql), [INV_LotInsightDetailPaneData](sql/1320704103.sql)

## Why inventory monitor tiles and drilldowns can disagree

Some monitor tiles display distinct work units while their warning thresholds count instruction rows. Drilldown summaries also differ in scope: the location-type frozen-empty tile omits the selected zone, and frozen-empty exclusions compare location names across warehouses. A difference can therefore reflect the query rules; it does not by itself prove missing inventory.

1. Compare the displayed measure with the caution/warning measure.
2. Check selected warehouse, zone and type, then the exact scope of the summary tile.

Sources: [INV_MonitorInventoryIndicatorTile](sql/1336704160.sql), [INV_MonitorLocationChartData](sql/1352704217.sql), [INV_MonitorLocationTypeChartData](sql/1368704274.sql), [INV_MonitorTemplateFieldChartData](sql/1384704331.sql)

## How inventory changes affect lot status, replenishment and history

Lot status is summarized from distinct location-inventory statuses. Replenishment evaluation uses capacity, minimum percentage and existing requests; it can mark a request without creating work. Inventory history computes before/after values from caller inputs and delegates storage. A history value is therefore not independent confirmation of an actual stock change.

1. Separate inventory state, lot summary, replenishment request and transaction history.
2. For a specific discrepancy, retain the exact screen message and relevant sanitized workflow context.

Sources: [INV_UpdateLotStatus](sql/39319550.sql), [INV_UpdateLocation](sql/1544704901.sql), [INV_SaveHistInvChg](sql/1496704730.sql), [INV_InsertArgument](sql/1208703704.sql), [INV_DeleteArgumentGroup](sql/1192703647.sql)

## Company transfer and catch-weight boundaries

Company transfer requires eligible positive stock with no allocated, in-transit or suspense quantity. It may merge destination stock and reconcile serials, lots and catch weight. Catch-weight updates have separate container and inventory paths; the container path adjusts only the immediate parent. A container weight update is not a container-close operation.

1. Check transfer eligibility and destination identity before interpreting the result.
2. Distinguish catch weight from container status and closure requirements.
3. Use application error/state evidence for an open container; these routines do not establish the cause or close it.

Sources: [INV_TransferCompany](sql/1512704787.sql), [INV_UpsertCatchWeightInfo](sql/1592705072.sql)

## Supporting routine contracts

### dbo.CCP_CheckToUpdateCCRequest

Decide whether a changed inventory identity should update, remove or create a cycle-count request.

1. Initialize internal action flags, check permanent assignment and existing request conditions. The supplied NewOnHandQty is never read. Existence checks use SELECT ALLOCATION_LOC or SELECT LOCATION and can emit single-column row sets.
2. When the target request condition is absent, compare positive attribute identities through a cursor and INVfn_AreInvAttributeValuesSame, then consider creation or replacement of an empty permanent-location request.
3. For an existing target request, read stored ON_HAND_QTY. A zero quantity can clear inventory identity; another request at the location can instead select the removal branch.
4. The update branch rewrites matching request identity and corresponding cycle-count work fields; it does not rewrite the work FROM_LOC_INV_ATTRIBUTES_ID. The removal branch deletes matching requests and detail work, then deletes eligible parent work whose identity is NOT IN the remaining parent references.
5. Set the caller CCAction OUTPUT to -1 only for the skip branch or 1 only for the create branch. Other paths preserve its incoming value.

Inputs and NULLs: Most item/company/lot/unit predicates are explicitly NULL-aware; attributes normalize NULL/zero in selected comparisons. Multiple matching inventory rows assign quantity without ordering. NOT IN parent cleanup is NULL-sensitive. An incoming CCAction is not reset.

Output: CCAction OUTPUT is assigned on two terminal branches only. Existence SELECT statements can return ALLOCATION_LOC from ITEM_LOCATION_ASSIGNMENT and LOCATION from CYCLE_COUNT_REQUEST. Explicit return is -1 for the final observed error, otherwise 0.

Configuration: Location/warehouse and inventory identity determine request selection; permanent assignment changes empty-location handling. Coded condition/action/type equality groups were verified privately; actual application callers remain unobserved.

Errors: The final @@ERROR check is statement-local and does not guarantee that earlier errors were detected. No TRY/CATCH or compensation.

Concurrency: Several existence checks, cursor comparisons and subsequent writes are separate statements with no local serialization.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (AFTER INSERT; enabled). Their INSERT event does not fire merely because this routine updates or deletes the table.

[Complete definition](sql/1052179144.sql).

### dbo.CCP_CreateCCRequest

Create cycle-count requests from location inventory and optionally create their work.

1. Read matching nullable-wildcard threshold/location settings. Assignment over ordered matching rows keeps the last assigned values; quantity and UOM thresholds are loaded but not used. A positive days threshold can log a too-recent-count message and return 0 without creating requests.
2. For a supplied nonzero plan, derive a launch from existing work with NOLOCK and an unordered archival fallback; otherwise request the next launch number. Load work-creation configuration only if its flag remains NULL.
3. Reuse an incomplete unnamed plan in the warehouse or create a plan using configured group size. Aggregate location quantity by item/company/location/warehouse, not lot/unit/attribute; empty SUM results can replace initialized zeros with NULL.
4. For an unsupplied plan, cursor through distinct inventory lot/unit/parent/attribute combinations. A supplied plan uses the supplied combination. Empty nonpermanent inventory can clear item identity; permanent empty handling clears locInvAttributesId but not the separately fetched invAttribId used inside the loop.
5. Call CCP_InsertCCRequest for each combination, or once when the cursor is empty. Its TotalReq output resets on every call, so the final TotalReq<=0 exit can occur after earlier successful inserts. The loop captures @@IDENTITY, not scope_identity.
6. If the final count is positive, recalculate the plan; depending on the create-work flag and whether the caller supplied a plan, call the bulk work creator or the logistics-unit work creator. Then format and save process history.

Inputs and NULLs: No general input validation. Unmatched configuration and unordered assignments can leave NULL state. Day comparison uses warehouse-local date midnight; the numeric days variable receives the fractional datediff result. No-fetch work creation can receive an unassigned cycle-count identity.

Output: No declared OUTPUT parameter or direct result query. Child result sets can propagate. RETURN 0 can mean threshold-skipped or final insertion count zero, not necessarily no earlier changes.

Configuration: Threshold selectors allow NULL wildcards for location type/work zone/movement class. A caller-supplied plan changes launch selection, inventory scope and work path. Effective stored configuration is not captured.

Errors: Checks immediate @@ERROR and selected child returns; failures return -1, with cursor cleanup on loop errors. No wrapper transaction or rollback. Later failures can follow earlier successful children.

Concurrency: NOLOCK work reads can see unstable values; plan/request existence and insertion are not serialized by this wrapper. @@IDENTITY can include nested child or trigger identities.

Triggers: No direct persistent DML; called routines retain their own trigger and effect contracts.

[Complete definition](sql/1068179201.sql).

### dbo.CCP_CreateWorkForLogisticsUnit

Create one cycle-count detail work instruction for a request and return its mobile-style work projection.

1. Read a candidate parent from WORK_INSTRUCTION_VIEW by launch/work unit and coded types, without warehouse/location or ordering; read the source identifier configuration.
2. Insert TOP 1 work detail by joining the work view and cycle-count request through launch, filtering the request ID plus work location/warehouse/types. Copy work defaults and request inventory identity. TOP 1 has no ordering.
3. Return the inserted row selected by scope_identity, including check-digit/work-zone aliases, item/lot/unit/attribute/request fields, quantities, parent and numerous explicitly NULL mobile routing fields.

Inputs and NULLs: No matching join inserts nothing and returns -1. NULL equality selectors do not match; unmatched parent/configuration can remain NULL. The parent lookup and insertion have different location/warehouse scope.

Output: One wide result row after a successful insert; includes FROM_CHECK_DIG as CHECK_DIG, FROM_WORK_ZONE as WORK_ZONE, FROM_LOC as PICKLOC, FROM_WHS as FROM_WHS1 and NULL placeholders. Complete projection is retained in cited source.

Configuration: Source identifier comes from a coded SYSTEM_CONFIG_DETAIL key/type. Existing work supplies type/team/priority/group; the request supplies inventory dimensions.

Errors: Immediately returns -1 on insert error or no inserted row; no TRY/CATCH or compensating cleanup.

Concurrency: Parent and source work are read separately from insertion. No duplicate guard or transaction makes repeating the call idempotent.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (AFTER INSERT; enabled). Their INSERT event does not fire merely because this routine updates or deletes the table. The WORK_INSTRUCTION insertion can invoke work_instruction_outgoing_pd: if any inserted row meets its coded condition, it updates outgoing_pd_loc for every row in that inserted set, not only the qualifying subset. Actual execution was not observed.

[Complete definition](sql/1084179258.sql).

### dbo.CCP_InsertCCRequest

Insert one cycle-count request unless an open request already covers the normalized inventory identity.

1. Reset TotalReq OUTPUT to 0; reject NULL location or warehouse. Count the supplied plan/group and locally increment group number when the configured nonzero group size is reached.
2. If description is NULL or the coded empty value, read item description from matching company or default-company ITEM rows without ordering.
3. Insert request timestamps, initial condition, quantities, launch and identity only when no nonclosed request matches normalized item/company/lot/unit/location/warehouse/attributes. The guard spans all plans and groups. Normalize attribute 0 to NULL.
4. Capture immediate error and row count. A zero-row insertion formats and saves history; a successful insertion sets TotalReq to this call's row count.

Inputs and NULLs: NULL/zero attributes and coded empty/null identity text are normalized in the duplicate check. A NULL existing condition is excluded by the not-equal predicate. NULL group size bypasses the increment. Group number is not an OUTPUT parameter and is not recounted after increment.

Output: TotalReq is 0 or 1 for this call, not an accumulated total; no inserted identity OUTPUT. Child history results may propagate.

Configuration: Group size controls one local increment. Work-created initial flag depends on two coded create-work values. Existing request duplication ignores the caller plan/group/launch.

Errors: Insert error/row count are captured immediately, but zero-row logging can replace the error variable with a child return before the final check. No TRY/CATCH or rollback.

Concurrency: NOT EXISTS plus INSERT has no explicit locking or serializable protection; simultaneous callers can race unless target constraints prevent duplication.

Triggers: No captured DML trigger is attached to the direct persistent target tables. Transitive child effects are not inferred.

[Complete definition](sql/1132179429.sql).

### dbo.CCP_CreateWorkFromRequest

Create cycle-count detail work and an aggregate parent for a launch, then assign a work-unit identifier.

1. Resolve user cycle-count preference to work type/team, then read source-identifier configuration. The subsequent @@ROWCOUNT check refers to the configuration query, not the earlier preference query; missing work type also raises severity 18 and returns -1.
2. Load work-group/default priority. Insert detail instructions for every request in the launch joining location and warehouse; no request-condition or WORK_CREATED guard is applied.
3. Insert one aggregate parent from all same-launch work with the coded internal-number type. Common string fields use min/max sentinel comparisons; numeric comparisons use different NULL substitutes 0 and 1. Parent logistics-unit logic tests LOGISTICS_UNIT uniformity before taking MIN(PARENT_LOGISTICS_UNIT), not uniform parent units.
4. Load the configured work-unit field. When present, translate its data-object field name and execute a dynamic selection into #temp, taking an unordered returned value. Fall back to the parent identity if the result is NULL, then call WRTRV_RtrvUniqueWorkUnit.
5. Update same-launch coded detail work with parent/work-unit/stamps and then update the new parent work-unit/stamps.

Inputs and NULLs: Absent USER_PROFILE does not produce the inner ISNULL preference fallback. Unmatched work type can leave work-group/priority NULL. An aggregate parent query has no GROUP BY, so an empty input still forms an aggregate row. Dynamic field/return shape and uniqueness depend on retained child behavior and configuration.

Output: No final result query or OUTPUT parameter. NOCOUNT ON. A missing required configuration/type raises an error and returns -1; insert/update checks also return -1.

Configuration: User preference -> cycle-count preference -> work-type defaults, plus coded source-identifier and work-unit-field settings. This is a source rule, not an observed current configuration.

Errors: Checks each write immediately, but has no TRY/CATCH or rollback. Dynamic execution errors can interrupt after work has already been inserted.

Concurrency: Launch-scoped aggregation/update can include preexisting or concurrent matching work. No duplicate guard or local transaction; unique-name helper behavior is a separate contract.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (AFTER INSERT; enabled). Their INSERT event does not fire merely because this routine updates or deletes the table. The WORK_INSTRUCTION insertion can invoke work_instruction_outgoing_pd: if any inserted row meets its coded condition, it updates outgoing_pd_loc for every row in that inserted set, not only the qualifying subset. Actual execution was not observed.

[Complete definition](sql/1100179315.sql).

### dbo.CCB_UpdateCCPlan

Recalculate cycle-count plan counters and its completion timestamp.

1. Reject a NULL or nonpositive plan number with RETURN -1. Aggregate request conditions for that plan, using zero when no requests match.
2. Update TOTAL_OPEN, TOTAL_REVIEWED and TOTAL_CLOSED plus user/process/UTC stamps for the supplied plan. TOTAL_REVIEWED uses one of the two same literal categories counted in TOTAL_OPEN; these counters are not mutually exclusive.
3. Set COMPLETED_DATE to current UTC time only if no nonclosed requests remain and MASTER_NAME is non-NULL; otherwise clear it. Repeated qualifying calls replace the timestamp. Error counters and RELEASED are untouched.

Inputs and NULLs: Invalid plan IDs return -1; an absent positive plan updates no row and is not explicitly reported as failure. NULL USER_NAME is passed to the target stamp. No requests aggregate as zeros.

Output: No row result or OUTPUT parameter. NOCOUNT ON suppresses statement row counts; the body explicitly returns -1 for validation or an immediately detected update error, otherwise ends normally.

Configuration: Plan identity alone scopes both aggregation and update; there is no warehouse or user-authorization predicate. MASTER_NAME controls completion stamping.

Errors: Checks @@ERROR immediately after UPDATE and returns -1; there is no TRY/CATCH or compensation.

Concurrency: The aggregate and update have no explicit serialization. Concurrent request changes can make the stored totals stale.

Triggers: No captured DML trigger is attached to the direct persistent target tables. Transitive child effects are not inferred.

[Complete definition](sql/1036179087.sql).

### dbo.CCP_InsertCCPlan

Create an immediate cycle-count plan and return its identity.

1. Insert one plan with current UTC created/stamp time, caller group size and warehouse, NULL MASTER_NAME, IN_CREATION=N, RELEASED=Y, and all three totals zero.
2. After checking the INSERT error, assign scope_identity() to the numeric(9) OUTPUT plan number. This creates a plan row; it creates no count request or work instruction.

Inputs and NULLs: No explicit validation of group size, warehouse or user. Target type, NULL, key and foreign-key rules apply. The output is assigned only after the insertion reaches its success path.

Output: One OUTPUT parameter @iPlanNum receives scope_identity(); no row result. NOCOUNT ON is set.

Configuration: Caller supplies group size and warehouse; flags are coded values rather than effective configuration reads.

Errors: Immediately detected INSERT error returns -1; no TRY/CATCH or rollback exists.

Concurrency: The identity is scope-local. There is no duplicate-plan existence check, so separate calls can create separate plans.

Triggers: No captured DML trigger is attached to the direct persistent target tables. Transitive child effects are not inferred.

[Complete definition](sql/1850802001.sql).

### dbo.CCP_UpdateCCRequest

Visit eligible requests in a plan and reconcile them when another plan has a request at the same location.

1. Open a READ_ONLY cursor over requests for the supplied plan, warehouse and coded condition, passing NULL SYSTEM_QUANTITY as -1.
2. For each row, check for a different plan request with the same location/warehouse and another coded condition. That EXISTS does not compare item, company, lot, logistics unit or attributes.
3. Only when that check succeeds call CCP_CheckToUpdateCCRequest with the row identity dimensions and quantity. Continue cursor processing without stopping on a nonzero child return. Close/deallocate, then test the latest error variables.

Inputs and NULLs: NULL plan or warehouse equality matches no cursor rows. @Error and @CCAction are not initialized; iterations that skip the child do not reset the previous child result.

Output: No direct row result or OUTPUT declaration. Child row results may propagate. Final code checks @@ERROR then the last retained @Error; it is not an aggregate result for all iterations.

Configuration: Selection uses exact plan/warehouse and opaque condition selectors, not current-user access or a caller-confirmed process state.

Errors: A later successful child call can overwrite an earlier nonzero @Error. The final @@ERROR follows cursor cleanup, so it is not reliable retention of earlier statement errors. No TRY/CATCH exists.

Concurrency: READ_ONLY describes cursor modification capability, not an immutable snapshot or inter-call serialization.

Triggers: No direct persistent DML; called routines retain their own trigger and effect contracts.

[Complete definition](sql/1180179600.sql).

### dbo.CCP_UpdateCCRequestWithWork

Select a cycle-count request and copy its supplied inventory identity into linked work.

1. Assign TOP 1 INTERNAL_COUNT_NUM to the OUTPUT parameter using warehouse, location, condition, null-aware item/company/lot/unit and asymmetric attribute matching. There is no ORDER BY.
2. If the output is NULL or zero, set it to zero and RETURN. It is not reset before SELECT; an unmatched lookup can retain a caller-provided nonzero value and continue with that ID.
3. Update the selected request identity fields and UTC/user stamps by INTERNAL_COUNT_NUM, then update every work instruction with the same INTERNAL_COUNT_NUM, including FROM_LOC_INV_ATTRIBUTES_ID. The updates do not repeat the lookup predicates.

Inputs and NULLs: Attribute zero can match a NULL stored attribute ID; NULL attribute input matches neither branch, including a stored NULL. Other listed inventory dimensions use explicit NULL equality. A preseeded nonzero output survives a no-row SELECT.

Output: @CYCLECOUNTNUM is an input/output SQL parameter, not a guaranteed fresh lookup result. No row SELECT is returned.

Configuration: Warehouse/location/condition scope applies to lookup; subsequent writes use internal count ID only. No caller access or work-condition filter is applied.

Errors: No explicit error test, TRY/CATCH, transaction or compensation. Failure of the work update does not by itself undo a prior request update.

Concurrency: TOP 1 without ordering is nondeterministic among matches. Lookup and two updates are not explicitly serialized.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (AFTER INSERT; enabled). Their INSERT event does not fire merely because this routine updates or deletes the table.

[Complete definition](sql/1196179657.sql).

### dbo.CCP_UpdateWorkForNewInventory

Renumber detail work sequence for a cycle-count plan and work unit.

1. Join work INTERNAL_NUM to request INTERNAL_COUNT_NUM, constrain two coded work types, work unit, source warehouse and plan.
2. Assign ROW_NUMBER ordered by current SEQUENCE, FROM_LOC and ITEM, then replace each selected SEQUENCE with that row number. Other work and request columns are not modified.

Inputs and NULLs: NULL plan/work unit/warehouse equals no rows. Ties on all three ordering fields have no final unique tie-breaker.

Output: No row result or OUTPUT parameter; statement row-count messages are not explicitly suppressed.

Configuration: Caller identity plus coded instruction/internal-number types defines scope; no active user setting is loaded.

Errors: No explicit return/error handler or rollback; SQL errors propagate.

Concurrency: No explicit lock or transaction gives a stable sequence under concurrent work changes.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (AFTER INSERT; enabled). Their INSERT event does not fire merely because this routine updates or deletes the table.

[Complete definition](sql/1212179714.sql).

### dbo.CCR_InsightDetailPaneData

Return cycle-count request detail and a separate open-work count.

1. Return TOP 1 request detail with left-joined ITEM thumbnail using item and NULL-aware company: SCALAR,Location,Item,Company,Description,WebThumbnailImage,Warehouse,InternalCountNum.
2. Return a separate aggregate row with SCALAR and OpenWorkCount for coded instruction/internal-number types and a nonmatching condition, using INTERNAL_REQ_NUM equal to the supplied count number.

Inputs and NULLs: Absent/NULL identity yields no first row but the COUNT result is still one row with zero. NULL work condition fails the inequality. @culture is unused.

Output: Two ordered result sets: zero-or-one detail row and one aggregate count row. TOP 1 detail has no ORDER BY; the count is not derived from the first result row.

Configuration: Internal ID only; no explicit warehouse/company authorization. Culture does not change either output.

Errors: No explicit RETURN/error handler; permission, dependency and SQL errors propagate.

Concurrency: The two SELECTs have no explicit transaction or snapshot boundary and can observe different concurrent states.

Triggers: No direct persistent DML; called routines retain their own trigger and effect contracts.

[Complete definition](sql/1228179771.sql).

### dbo.CCP_InsightDetailPaneData

Return plan detail followed by open-work, request and transaction counts.

1. Select TOP 1 plan with SCALAR,PlanNumber,MasterName,CreatedDate,Warehouse.
2. Return OpenWorkCount from WORK_INSTRUCTION using coded types, nonmatching condition and REFERENCE_ID cast from the plan ID; it has no warehouse predicate.
3. Return RequestCount by INTERNAL_PLAN_NUM. Then return Transactions by plan reference cast to varchar(10), matching plan warehouse and TRANSACTION_TYPE=40.

Inputs and NULLs: Absent/NULL plan gives no detail row but each of the three aggregates still returns a row with zero. NULL work condition is excluded by inequality. @culture is unused.

Output: Four ordered result sets: zero-or-one detail row, then three single aggregate rows. Aliases are OpenWorkCount,RequestCount,Transactions; each also includes SCALAR.

Configuration: Counts have different scope: work reference alone, requests by plan ID, transactions by reference plus warehouse/type40. Equal numeric results would not prove equivalent populations.

Errors: No explicit return/error handler or null validation; SQL errors propagate.

Concurrency: Independent SELECTs have no shared explicit snapshot; totals need not be mutually consistent under concurrent changes.

Triggers: No direct persistent DML; called routines retain their own trigger and effect contracts.

[Complete definition](sql/1148179486.sql).

### dbo.CCP_DeleteCCWorkInstrForEmptyLoc

Delete selected cycle-count work details linked to empty-item requests at a location.

1. Materialize distinct request IDs with ITEM IS NULL at supplied location/warehouse.
2. Materialize work instruction IDs whose INTERNAL_NUM matches those requests and whose coded instruction/internal-number types and condition predicate match.
3. Delete those work rows by internal instruction ID with ROWLOCK. The body does not delete requests or remove orphan parent work.

Inputs and NULLs: NULL location/warehouse matches no requests. @TYPE,@OPEN_CONDITION and @IN_PROCESS_CONDITION are declared but unused; caller values do not change the coded predicates. NULL work condition is excluded by inequality.

Output: No row result or OUTPUT parameter. No explicit NOCOUNT setting.

Configuration: An empty-item request qualifies regardless of its request CONDITION; selected work filters are hard-coded rather than the similarly named caller parameters.

Errors: No explicit error handling, return, transaction or rollback. SQL errors propagate.

Concurrency: ROWLOCK is a delete hint, not a guarantee that earlier eligibility remains unchanged or that escalation cannot occur. IDs are selected before deletion.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (AFTER INSERT; enabled). Their INSERT event does not fire merely because this routine updates or deletes the table.

[Complete definition](sql/1116179372.sql).

### dbo.CCP_MergeCCRequestsFromDifferentWorkUnits

Reassign a selected cycle-count detail from another work unit and revise plan/parent counters.

1. Read the current work unit parent with a scalar subquery and obtain its plan through an unordered TOP 1 detail. A duplicate parent/user scalar query can error.
2. Assign output instruction/request IDs from another work unit using location, warehouse, item and nullable company/lot/unit/attribute equality, excluding a coded condition only when USER_ASSIGNED is non-NULL. Multiple candidates have no ORDER BY; no candidate leaves incoming output values unchanged.
3. Move the selected request to the destination plan and set LAUNCH_NUMBER to that plan ID; increment destination TOTAL_OPEN. The variable later used as source INTERNAL_PLAN_NUM was assigned from the old work LAUNCH_NUM, so source-plan correctness depends on that identity convention.
4. Recount remaining nonclosed requests for that source identity; update its TOTAL_OPEN or delete its plan. Reparent/move the selected work, copy a parent USER_ASSIGNED value, use MAX(SEQUENCE)+1, assign reference/launch from destination plan, and increment destination parent children.
5. Recount old-parent work with a coded nonclosed predicate; update NUMBER_OF_CHILDREN if positive. Otherwise delete both the old parent and all work rows with that parent, including rows omitted from that open count.

Inputs and NULLs: No validation or initial clearing of output IDs. NULL item uses plain equality and matches no item; nullable attributes match NULL only, not zero equivalence. Empty destination MAX(SEQUENCE) stays NULL. NULL values in compound NOT/inequality predicates follow three-valued logic.

Output: @currentIns and @currentCCReq OUTPUT values are not reset before selection. No row result. NOCOUNT ON is set.

Configuration: Current-parent lookups use work unit and coded type without warehouse qualification. Destination plan/launch equivalence is assumed in assignments, not verified.

Errors: No TRY/CATCH, explicit transaction or error return. A later scalar-subquery or constraint failure can follow earlier successful changes.

Concurrency: Unordered variable assignment and TOP 1, MAX+1 sequence and increment/recount/delete sequences are not serialized; no lock hints protect candidate ownership.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (AFTER INSERT; enabled). Their INSERT event does not fire merely because this routine updates or deletes the table.

[Complete definition](sql/1164179543.sql).

### dbo.INV_SaveHistInvChg

Derive inventory before/after history values and pass them to transaction-history storage.

1. Return 0 immediately for the coded disabled-history flag. For a coded shipping transaction, replace work type using the user shipping preference; missing user does not produce the nested ISNULL default.
2. Calculate after quantities from each plus/minus effect. The on-hand subtraction branch can clamp at zero under coded force flags, but preserves an already nonpositive initial amount. Resolve inventory status from totals and initial status, then choose direction and after-status; suspense quantity change subsequently overrides direction.
3. Resolve history identity, signed quantity (one coded type uses ABS before the reversal branch), preferred receipt/container identifier and fallback destination company. A non-NULL reversal flag negates quantity regardless of its text value.
4. Use transaction-specific branches to obtain missing license plate/container values from location/work, clear initial status for one inbound case, or read a parent shipping container. Only selected transaction types set internalContainerNum.
5. Call HIST_SaveTransHist with computed before/after quantities/status/direction/container, source/caller fields, expiration and optional attributes/catch weight. Propagate its history-active OUTPUT and checked return.

Inputs and NULLs: NULL quantity arithmetic propagates and can prevent sum comparisons. Direction defaults to the nonzero side when iFromTo is NULL. History-active OUTPUT is not initialized by this wrapper. Exact opaque transaction/status selector groups remain source-bound technical evidence.

Output: History-active OUTPUT may be changed by the child; no direct row projection. NOCOUNT ON; disabled history returns 0 without a history write.

Configuration: User shipping preference applies for one coded transaction. Location class/container tracking changes container fallback. Caller supplies initial quantities rather than this routine rereading inventory.

Errors: Immediately checks child execution error then child return; no TRY/CATCH or wrapper compensation.

Concurrency: Source location/work/container reads are separate and do not atomically bind to caller-supplied initial quantities.

Triggers: No direct persistent DML; called routines retain their own trigger and effect contracts.

[Complete definition](sql/1496704730.sql).

### dbo.INV_UpdateLotStatus

Synchronize a lot status with the distinct statuses of its location inventory.

1. Collect up to two distinct inventory statuses for the item, NULL-aware company, lot and warehouse.
2. Use the sole distinct status only when exactly one row was collected; otherwise propose NULL. Compare with an unordered current LOT status using coded NULL sentinels, then update matching lots and stamps only if different.

Inputs and NULLs: NULL lot/item/warehouse do not match equality. Zero rows, two statuses, or a single NULL status all propose NULL. Duplicate LOT matches can all be updated despite the TOP 1 comparison.

Output: No explicit result, OUTPUT parameter or return-code protocol; row-count messages are not suppressed.

Configuration: Item/company/lot/warehouse scope only, with no quantity, frozen-lot or active-location filter.

Errors: No explicit error handling.

Concurrency: Status collection and lot update are separate; concurrent changes can invalidate the proposed summary.

Triggers: No captured DML trigger is attached to the direct persistent target tables. Transitive child effects are not inferred.

[Complete definition](sql/39319550.sql).

### dbo.INV_CopyLocUmsForDestInventory

Copy location UOM definitions to matching destination inventory rows.

1. Return early when isPartial=N and fromIntLocInv is NULL. This early guard uses N even though the subsequent partial source-selection branch uses Y.
2. Insert DISTINCT UOM values joined by item and NULL-aware company to destination LOCATION. The non-Y mode excludes the input inventory row and selects its UOM; Y mode instead selects UOM from fromIntLocInv. Copy target inventory user fields and warehouse; set INTERNAL_CONTAINER_NUM NULL.

Inputs and NULLs: A NULL partial flag satisfies neither equality nor inequality branches. NULL source-container rows qualify even when a specific container was supplied. Missing source/destination gives no insertion.

Output: No result row or OUTPUT declaration; statement counts remain enabled.

Configuration: No destination warehouse predicate and no source/destination warehouse join. Location names repeated across warehouses can broaden the destination scope.

Errors: No explicit error handling or duplicate guard against existing target UOM rows.

Concurrency: DISTINCT deduplicates the current SELECT, not prior calls or concurrent insertions.

Triggers: No captured DML trigger is attached to the direct persistent target tables. Transitive child effects are not inferred.

[Complete definition](sql/1176703590.sql).

### dbo.INV_DeleteArgumentGroup

Remove all inventory argument rows for one group.

1. Delete INVENTORY_ARGUMENT rows whose GROUP_ID equals the supplied group.
2. Return -1 on the immediately observed DELETE error; otherwise end normally.

Inputs and NULLs: NULL group matches no rows. Missing group is not explicitly a failure.

Output: No row result or OUTPUT; NOCOUNT ON.

Configuration: Group ID alone scopes deletion; no user, warehouse or argument-name predicate.

Errors: Immediate @@ERROR check only.

Concurrency: One DELETE statement; no wrapper transaction or retry protocol.

Triggers: No captured DML trigger is attached to the direct persistent target tables. Transitive child effects are not inferred.

[Complete definition](sql/1192703647.sql).

### dbo.INV_InsertArgument

Store an inventory operation argument and validate a special serial-number argument.

1. For the coded serial argument name, insert the argument first, then SELECT supplied group/coded name/OBJECT_ID from SERIAL_NUMBER where OBJECT_ID equals the argument value.
2. Capture that SELECT row count; when zero, raise severity 18 and return -1. Otherwise return. Other argument names are inserted directly.

Inputs and NULLs: No general NULL validation. Comparing numeric OBJECT_ID with text argument can require conversion. An invalid serial reference can leave the inserted argument behind.

Output: The serial branch emits a three-column row result; the normal branch emits no row result. NOCOUNT ON.

Configuration: One coded argument name selects serial validation; no warehouse/company predicate on the serial identity.

Errors: The serial @@ERROR check follows a separate rowcount-assignment statement and is not an immediate INSERT/SELECT error capture. Normal insertion checks @@ERROR immediately.

Concurrency: No transaction ties insertion to serial validation; serial state can change independently.

Triggers: No captured DML trigger is attached to the direct persistent target tables. Transitive child effects are not inferred.

[Complete definition](sql/1208703704.sql).

### dbo.INV_InsertLocation

Insert a location using the routine's fixed defaults.

1. Insert location/warehouse/user, coded active/class/status/multi-item/tracking/verification flags, zero picking/putaway sequence and TEMPLATE_FIELD1 equal to location.
2. Use UTC for the stamp and warehouse-local current date for LAST_CYCLE_COUNT_DATE; check the immediate INSERT error.

Inputs and NULLs: No explicit validation or existence guard; target constraints apply to NULL or duplicate location keys.

Output: No row result or OUTPUT parameter; NOCOUNT ON; insertion error returns -1.

Configuration: Defaults are coded in the procedure, not copied from a location template. Caller supplies warehouse/location.

Errors: Immediate @@ERROR check; no compensation.

Concurrency: Repeated/concurrent calls can conflict on target constraints; no upsert behavior.

Triggers: No captured DML trigger is attached to the direct persistent target tables. Transitive child effects are not inferred.

[Complete definition](sql/1224703761.sql).

### dbo.INV_InsertLocationInventory

Create a location-inventory row using quantity effects, source attributes and item defaults.

1. Enable override mode if either volume or weight override is non-NULL; normalize attribute ID 0 to NULL. Read destination location metadata, or call INV_InsertLocation if absent. The new location is not reread; only TEMPLATE_FIELD1 is set locally.
2. Read item cost/value/volume/weight/UOM/description defaults. Fill a NULL inventory-status OUTPUT from source status. Reject coded location/allocation cases and coded single-item conflicts, except the configured reference-type exemption.
3. Insert each quantity as supplied quantity only for its coded effect; otherwise zero. Source description/color/size/style and dates take precedence when non-NULL; no-lot expiration uses a coded date helper. Cost/value use on-hand effect. A shared override flag makes both volume and weight use their override inputs even if only one was supplied.
4. Capture immediate error, row count and @@IDENTITY into outputs and return that error.

Inputs and NULLs: The unsupplied side of a volume/weight override can produce NULL totals. Item helper absence can leave defaults NULL. Existing other-item conflict uses ITEM <> input and no company distinction. Newly created location metadata remains locally NULL.

Output: Inventory status, row count and inventory identity are OUTPUT parameters. Identity uses @@IDENTITY, which is not limited to this scope. No own row query; child outputs can propagate.

Configuration: Location class/multi-item flags, item defaults and one reference-type exemption affect the path. No observed stored setting is asserted.

Errors: Child creation errors propagate; explicit validation raises severity 18/-1. Final INSERT returns immediate @@ERROR.

Concurrency: Location existence checks and conflict checks are separate from insertion. Caller transaction and target constraints govern races.

Triggers: No captured DML trigger is attached to the direct persistent target tables. Transitive child effects are not inferred.

[Complete definition](sql/1240703818.sql).

### dbo.INV_InsightDetailPaneData

Return inventory Insight detail and related-work counts for an identity, item or location context.

1. A positive inventory identity selects the base row solely by identity, then returns TOP 1 detail with the caller warehouse displayed. Work/needs/BOM counts still use caller item/location/company/lot/warehouse, not values read from that row.
2. Without a positive identity, a nonempty item selects location inventory with company-match OR company-NULL and lot-match OR lot-NULL. Return TOP 1 item detail, a separate exact lot row, an optional exact license-plate row, and related counts.
3. Without item context, return a coded placeholder detail row and a location-scoped open-work count. Work counts include source/outgoing and destination/incoming locations, a coded instruction type and nonclosed condition.

Inputs and NULLs: culture is unused. NULL/empty logistics unit omits its work filter. Item fallback admits default-company/no-lot rows even for supplied company/lot. TOP 1 projections are unordered; counts still return zero after missing base data.

Output: Variable result-set count and shape: identity branch four; item branch five or six depending on license plate; location-only branch two. Counts are OPEN_WORK_INST, IMM_NEEDS and BomCount.

Configuration: Counts have different scopes: immediate needs use item/company/warehouse, BOM uses item/company only. Detail inventory ID does not validate the caller context.

Errors: No explicit error handling or return protocol.

Concurrency: Details are materialized once but subsequent counts are separate reads; no common snapshot is requested.

Triggers: No direct persistent DML; called routines retain their own trigger and effect contracts.

[Complete definition](sql/1272703932.sql).

### dbo.INV_LoadInsightDetailPaneData

Return load Insight header and summary values.

1. Materialize matching load-view rows by internal load identity.
2. Return TOP 1 carrier/date/warehouse and translated leading/trailing statuses, then TOP 1 stored shipment/container totals plus a live count of shipment-detail lines.

Inputs and NULLs: NULL or absent load produces two empty result sets. Both TOP 1 selections lack ordering.

Output: Two result sets: SCALAR/HEADER_INTERNAL_LOAD_NUM/CARRIER/ScheduledShipDate/LEADING_STS/TRAILING_STS/WAREHOUSE; then SCALAR/TotalShipments/TotalContainers/TotalLines. NOCOUNT ON.

Configuration: Internal load ID only; status names use coded functional-area selectors.

Errors: No explicit error handling.

Concurrency: Stored header values and later detail count can reflect different moments.

Triggers: No direct persistent DML; called routines retain their own trigger and effect contracts.

[Complete definition](sql/1304704046.sql).

### dbo.INV_LotInsightDetailPaneData

Return lot Insight detail, location count and transaction-history count.

1. Materialize LOT_VIEW by OBJECT_ID; return TOP 1 lot/item description/company/object/warehouse/thumbnail/ArchivedLot joined to ITEM with NULL-aware company.
2. Return TOP 1 stored LocationsCount and an aggregate TotalTransactions joined by lot/warehouse/item/NULL-aware company.

Inputs and NULLs: culture is unused. Missing/NULL object gives empty detail/location sets but one transaction count row equal to zero. Duplicate lot-view matches can multiply history joins.

Output: Three result sets: detail, LocationsCount, TotalTransactions. TOP 1 is unordered; NOCOUNT is not set.

Configuration: History scope uses inventory dimensions, not lot OBJECT_ID in history or a date restriction.

Errors: No explicit error handling.

Concurrency: Lot rows are materialized before history is counted; no shared snapshot requested.

Triggers: No direct persistent DML; called routines retain their own trigger and effect contracts.

[Complete definition](sql/1320704103.sql).

### dbo.INV_MonitorInventoryIndicatorTile

Calculate one inventory-monitor indicator and its caution/warning values.

1. Parse filter text and assign warehouse from the coded filter name. Dispatch among four coded indicator names; an unknown name returns no result set.
2. Almost-empty counts distinct locations with row quantity >0 and <10. Pending replenishment and cycle-count display distinct work units but calculate critical levels from row counts (WORK_UNIT or INTERNAL_INSTRUCTION_NUM), so displayed and threshold counts differ.
3. Permanent zero-on-hand indicator filters permanent/status/in-transit rows, then uses a NOT IN inventory subquery whose company expression contains Company = NULL; preserve this source condition rather than assuming a correct NULL-aware company match.

Inputs and NULLs: culture is unused. Missing warehouse produces aggregate zeros for recognized indicators. SQL NULL comparison and NOT IN NULL behavior affect the last branch.

Output: One indicator-specific aggregate result with caution/warning helper values, or no result for an unrecognized selector. Aliases are partly coded strings in the reading copy. NOCOUNT ON.

Configuration: Warehouse comes from parsed criteria; caution/warning expressions pass to a helper. The almost-empty quantity threshold is fixed at 10, not read from configuration.

Errors: No explicit error handling; parser/helper behavior is a separate contract.

Concurrency: Each selected aggregate reads its current matching rows; no routine-local snapshot or locks.

Triggers: No direct persistent DML; called routines retain their own trigger and effect contracts.

[Complete definition](sql/1336704160.sql).

### dbo.INV_MonitorLocationChartData

Summarize warehouse locations by locating zone and return four location tiles.

1. Parse warehouse; group active coded-status locations by locating zone, with localized NULL category and DATA descending.
2. Calculate total/empty counts by summing distinct-location counts grouped by location and status. Compute percentage and frozen-empty count, then return four separate tiles. The frozen-empty exclusion reads LOCATION_INVENTORY location names across all warehouses.

Inputs and NULLs: No matching active locations yields NULL SUM totals/empty counts; percentage ELSE is 0. NOT IN is NULL-sensitive. Duplicate warehouse filters assign an unordered value.

Output: Five result sets: zone chart (CATEGORY,DATA,DESCRIPTION,axis/title/drilldown metadata), then TOTAL_LOCATIONS, EMPTY_LOCATIONS, PERCENT_EMPTY, FROZEN_EMPTY. Chart ties have no further order.

Configuration: Warehouse filter scopes outer queries; culture affects only NULL-category resource. Location/status grouping can count a location more than once if view rows expose differing statuses.

Errors: Final @@ERROR/GOTO only observes the latest statement; it is not comprehensive error capture. Normal return 0, NOCOUNT restored OFF.

Concurrency: Separate chart and tile queries have no shared snapshot; counts can drift between results.

Triggers: No direct persistent DML; called routines retain their own trigger and effect contracts.

[Complete definition](sql/1352704217.sql).

### dbo.INV_MonitorLocationTypeChartData

Drill inventory location charts from a locating zone to location type.

1. Parse warehouse and locating zone; translate one coded zone sentinel to NULL. Filter chart and total/empty counts to exact zone or NULL-to-NULL, then group chart by LOCATION_TYPE and order DATA descending.
2. Calculate percentage from summed location/status groups. Frozen-empty tile omits the selected zone and excludes location names found anywhere in LOCATION_INVENTORY. Return chart plus four tiles.

Inputs and NULLs: NULL zone means only NULL LOCATING_ZONE, not all zones. Empty SUM totals can be NULL. NOT IN can be affected by NULL inventory locations.

Output: Five result sets with chart category/data/description/axis/title metadata and four scalar summary tiles; NextDrillDownLevel=2.

Configuration: Outer warehouse restriction applies; selected zone is not applied to the frozen-empty tile. culture localizes the NULL type label.

Errors: Only final @@ERROR/GOTO handling; normal return 0 and NOCOUNT OFF.

Concurrency: Five result sets come from separate statements without a common snapshot.

Triggers: No direct persistent DML; called routines retain their own trigger and effect contracts.

[Complete definition](sql/1368704274.sql).

### dbo.INV_MonitorTemplateFieldChartData

Drill location charts to template-field values within a zone and location type.

1. Parse warehouse/zone/type and translate coded sentinels to NULL. Group active coded-status rows by TEMPLATE_FIELD1, with exact-or-both-NULL zone/type filters.
2. Count distinct locations for total and empty separately, calculate percentage, and count frozen-empty locations using the same outer filters but a global inventory location-name exclusion. Return four tiles after the chart.

Inputs and NULLs: NULL zone/type selects only NULL values, not wildcards. Empty COUNT returns 0. Percentage zero branch uses an opaque string converted to FLOAT; do not infer its spelling.

Output: Five result sets; chart NextDrillDownLevel=-1 and DATA descending; tiles TOTAL_LOCATIONS/EMPTY_LOCATIONS/PERCENT_EMPTY/FROZEN_EMPTY.

Configuration: culture localizes the NULL template-field category. Inner NOT IN inventory exclusion has no warehouse restriction.

Errors: Final @@ERROR/GOTO only; no general TRY/CATCH. Normal path returns 0 and NOCOUNT OFF.

Concurrency: Independent chart/tile queries can differ under concurrent changes.

Triggers: No direct persistent DML; called routines retain their own trigger and effect contracts.

[Complete definition](sql/1384704331.sql).

### dbo.INV_UpdateFromLocInv

Replace source inventory quantities with an optimistic quantity-match guard.

1. Determine metadata-empty state from new allocated/in-transit/on-hand quantities and INITIAL suspense quantity; read default status if that condition holds.
2. Update by inventory ID AND equality of all four initial quantities. Replace quantities, clear LOT when all four NEW quantities are zero, and scale cost/value from existing on-hand. Volume/weight override deltas are bypassed when existing on-hand is zero.
3. Metadata-empty state clears dates/user fields/logistics links and uses default status, except a previously NULL AGING_DATE is filled with UTC before the empty-state branch. Assign attribute ID directly. Capture source metadata OUTPUT values within the same UPDATE and return immediate error/row count.

Inputs and NULLs: NULL initial quantities fail equality and can yield zero updated rows without an error. OUTPUT metadata is not reset before an unmatched UPDATE. Attribute default NULL overwrites an existing attribute ID.

Output: Nine metadata OUTPUT values plus row-count OUTPUT; return is immediate UPDATE error, so 0 does not establish a matched row. NOCOUNT ON.

Configuration: Coded default inventory-status setting is used only for the metadata-empty branch.

Errors: Immediate @@ERROR/@@ROWCOUNT captured. Caller must inspect row count; no retry or rollback.

Concurrency: Quantity equality is an optimistic guard; it does not compare other metadata or perform a retry.

Triggers: No captured DML trigger is attached to the direct persistent target tables. Transitive child effects are not inferred.

[Complete definition](sql/1528704844.sql).

### dbo.INV_UpdateTotalsonLocInv

Recalculate inventory volume and weight totals from current UOM dimensions.

1. Read item/company/quantity UOM for the inventory identity.
2. For the coded override flag, use matching location-UOM weight and length*width*height; otherwise get item defaults through INVfn_RtrvItemInfo with NULL location/warehouse/override context.
3. Update total volume/weight as per-item values times current on-hand, plus user/process/UTC stamps.

Inputs and NULLs: No matching UOM/helper row leaves per-item values NULL, which can overwrite totals with NULL. Multiple UOM matches assign without ordering.

Output: No result set, OUTPUT parameter or explicit return/error protocol; NOCOUNT is not set.

Configuration: A coded flag selects location-UOM dimensions versus item-default helper. No conversion factor is applied in this body.

Errors: No explicit error handling or validation of negative/NULL dimensions.

Concurrency: Defaults are read before the UPDATE; on-hand used by the UPDATE can have changed.

Triggers: No captured DML trigger is attached to the direct persistent target tables. Transitive child effects are not inferred.

[Complete definition](sql/1576705015.sql).

### dbo.INV_UpdateLocation

Reevaluate a location status and replenishment flag after an inventory change.

1. Read current location status/replenishment flags/type. For zero new quantities, choose coded empty status only if no location inventory has any positive quantity; otherwise use direction-sensitive coded status transitions.
2. For the coded source on-hand effect and an existing location, inspect eligible replenishment requests. Where reevaluation applies, read item class (including default-company rows), retrieve capacity/minimum percentage/UOM, and convert capacity if needed.
3. Sum on-hand by item/company/location/warehouse across lots/units. Missing capacity/percentage together or negative on-hand can set the reevaluation flag. At/below threshold, or zero-capacity with positive percentage, check open replenishment; mark one pending request ordered by priority then allocated quantity descending, or flag the location when none is marked.
4. Update LOCATION only if status differs or normalized reevaluation flag differs. REAL_TIME_RPLN is read but never used.

Inputs and NULLs: NULL status comparisons may suppress transitions; capacity and percentage have distinct both-NULL, positive and zero branches. Quantity SUM defaults zero. Request ordering has no unique tie-breaker.

Output: No row result or OUTPUT parameter. NOCOUNT ON; selected child failures return their code, immediate location-update error returns -1.

Configuration: Location type, item class and capacity/UOM helpers determine threshold. No effective settings or current request are fetched for this documentation.

Errors: Child capacity errors and final location UPDATE checked; replenishment UPDATE errors are not comprehensively captured. No compensation.

Concurrency: Existence checks, SUM, request selection/update and location update are separate; concurrent work can change the decision.

Triggers: No captured DML trigger is attached to the direct persistent target tables. Transitive child effects are not inferred.

[Complete definition](sql/1544704901.sql).

### dbo.INV_UpdateToLocInv

Replace destination inventory quantities and merge metadata using explicit precedence.

1. Set empty flag when all four new quantities are zero; fetch default inventory status. Set user-field fill flag when all four initial quantities are zero. Either supplied volume/weight override enables the shared override flag.
2. Load item totals only when initial on-hand is zero and differs from new on-hand. Update only the identity with all four initial quantities still equal.
3. For nonempty inventory, dates prefer existing values, then source values, then caller/default time, except expiration: after existing expiration, a NULL lot selects the coded date helper before source/caller expiration. Preserve existing UOM/license plate; parent license plate can change for a non-NULL different input. Status prefers caller, existing, then source. Empty state clears dates/lot/logistics and uses default status.
4. Scale cost/value by initial positive on-hand, else item defaults. Shared override mode applies both override inputs to volume/weight deltas. Set attribute ID directly, and fill user fields only for initially empty inventory. Capture immediate error and row count.

Inputs and NULLs: NULL initial quantities cause no match. A NULL parent input does not clear a non-NULL parent except in empty state. A single supplied override can make the other total NULL. Item values can remain NULL when no helper call occurs.

Output: Row-count OUTPUT and immediate UPDATE error return; a zero return can accompany zero matching rows. NOCOUNT ON.

Configuration: Coded default status used for empty state; item defaults depend on item/company/UOM/location/warehouse. Existing metadata has explicit precedence.

Errors: Immediate error/row count captured; no general validation, retry or compensation.

Concurrency: Four initial-quantity equalities provide an optimistic update guard; metadata changes are not compared.

Triggers: No captured DML trigger is attached to the direct persistent target tables. Transitive child effects are not inferred.

[Complete definition](sql/1560704958.sql).

### dbo.INV_UpsertCatchWeightInfo

Insert or adjust catch weight for inventory or shipping containers.

1. A nonzero shipping-container ID selects container mode. Insert missing catch-weight information, set container weight and apply the difference to its immediate parent. Existing catch-weight rows instead accumulate for the same inventory ID or replace weight for a changed ID.
2. For a nonpositive supplied weight and positive initial quantity, container mode can derive a proportional quantity-change delta from existing catch weight. Re-read newest OBJECT_ID catch weight and update container/parent only when that resulting weight is positive.
3. Without container ID, insert missing inventory catch weight. Otherwise classify the work type by work group, optionally derive a proportional delta for the coded non-cycle-count case, retain existing UOM when caller UOM is NULL, and add the delta to existing weight.

Inputs and NULLs: NULL arithmetic can propagate. Container existence is checked by container alone, but proportional lookup also requires inventory ID; no match can retain the original input. Inventory update uses CATCH_WEIGHT + delta without ISNULL. UOM is preserved only when actually loaded.

Output: No result or OUTPUT parameter. Unconditional RETURN 0 at the end is not proof every statement succeeded; NOCOUNT ON.

Configuration: Work-type/group controls the inventory proportional-delta branch; the shipping branch does not use that work-type test.

Errors: No explicit error checks, TRY/CATCH or compensation.

Concurrency: Existence checks and multirow updates are separate; container parent deltas can race and are not propagated recursively.

Triggers: Captured attached triggers: ship_container_tree_unit_a_i (AFTER INSERT; enabled). Their INSERT event does not fire merely because this routine updates or deletes the table.

[Complete definition](sql/1592705072.sql).

### dbo.INV_TransferCompany

Transfer eligible stock to another company, merging destination inventory and reconciling related records.

1. Validate required item/status/location/warehouse/destination company; permit NULL source company when a companyless ITEM exists. Invalid input logs audit then returns normally if logging succeeds.
2. Read source by inventory identity with zero allocated/in-transit/suspense and positive on-hand, joining its location. This lookup does not verify supplied item/company/location/warehouse against the row. No eligible row logs audit and returns.
3. Load destination-company item values. Positive destination attribute ID uses caller destination inventory ID without validating that row; only when source attributes are NULL or zero does the alternate branch search matching destination company/location/lot/logistics/parent with NULL/zero attributes. Positive source attributes with no positive destination attribute skip that lookup. The search omits warehouse and assigns without ordering.
4. If destination exists, add source quantities, move serial links, under both the feature and item catch-weight gates add destination catch weight and delete source catch weight; source inventory is deleted outside those gates. Then retain destination identity. No destination catch-weight row is inserted when absent.
5. Update the retained inventory company/status/item metadata/user fields/expiration and recompute totals. For a lot, clone lot/attributes when old-company stock remains and no new-company stock exists; delete old lot/attributes when only new-company stock remains; change lot company when neither remains; leave both-present case unchanged.
6. Update retained inventory UOM company; insert serial-number arguments; optionally read destination catch weight; call inventory-history wrapper; then delete the entire argument group.

Inputs and NULLs: Destination search normalizes NULL identity dimensions but omits warehouse. Item/default-company and old-lot queries can match more than one row. Passing the same source/destination identity is not explicitly prevented. Default destination attribute ID is not itself written to inventory here.

Output: No direct row query or OUTPUT parameter. Child outputs can propagate. Validation rejection can return ordinary success after audit; no transfer result object is returned.

Configuration: Two feature helper calls gate catch-weight behavior; current feature values are unobserved. Catch-weight-required ITEM existence is not company-scoped.

Errors: Most writes and child returns are checked, but several SELECT checks reuse stale iError. A late failure leaves earlier effects unless caller transaction rolls them back. Argument cleanup is skipped after earlier returns.

Concurrency: No local transaction or optimistic recheck of source quantities. Destination existence/lot decisions can race; merging and deleting source are separate statements.

Triggers: No captured DML trigger is attached to the direct persistent target tables. Transitive child effects are not inferred.

[Complete definition](sql/1512704787.sql).

## Shared boundaries

Every body was read completely. None establishes caller transaction ownership or current user permission. No inventory, work, report, label, configuration or service was executed. Individual NULL, ordering and output differences remain explicit.
