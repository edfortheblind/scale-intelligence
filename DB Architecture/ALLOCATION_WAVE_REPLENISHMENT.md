# Allocation, wave and replenishment behavior

Snapshot `20260929T214106Z`. 45 complete module-body contracts, 63 roles and 16 bounded help topics. All conclusions are static; no database execution or current configuration/row observation.

This batch connects vendor concepts to specific deployed helper behavior. It does not certify a complete allocation, wave or replenishment flow. Private definitions remain outside the repository.

[Machine-readable contracts and exact evidence](mappings/batches/allocation-wave-replenishment.json) · [Configuration validation boundary](CONFIGURATION_VALIDATION.md)

The normal `WAVE_UpdateStatistics01` return follows COMMIT. Microsoft documents that [COMMIT resets @@ROWCOUNT](https://learn.microsoft.com/en-us/sql/t-sql/functions/rowcount-transact-sql?view=sql-server-ver17), so a zero return cannot distinguish guard rejection from the normal update path. [Nested transaction semantics](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/commit-transaction-transact-sql?view=sql-server-ver17) also require the caller context for both routines with explicit transactions. This is static analysis, not a reproduced operational incident.

## Add, remove and transfer shipment wave membership

These helpers update wave membership, selected statuses and stamps. Add assigns pending status to the header but raises detail status only when lower. Transfer leaves statuses unchanged. Remove resets wave number to zero and changes only matching pending detail statuses. None performs inventory allocation or work execution.

**Inputs and configuration:** Caller supplies wave/status values; timezone helper controls status dates.

**Expected result:** Membership/status/stamp writes under stated predicates.

**Boundary:** PREVIOUS_WAVE_NUM is assigned destination by add/transfer; it is not a reliable prior-wave history here. Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**Reviewed modules:** [WAVE_AddShipment](sql/254272311.sql), [WAVE_RemoveShipment](sql/286272425.sql), [WAVE_RemoveShipments](sql/302272482.sql), [WAVE_TransferShipment](sql/318272539.sql)

## Wave progress and statistics refresh

No. Guard rejection returns zero, and its normal COMMIT followed by RETURN @@ROWCOUNT also yields zero. The routine can refresh totals and progress while returning that same value. It guards selected step tokens with a table-exclusive lock; it is not the complete wave engine.

**Inputs and configuration:** Coded step guards and existing unit labels; effective wave master and token meanings remain external.

**Expected result:** Summary/progress fields may update; return zero is ambiguous.

**Boundary:** No elapsed-time or complete-run claim; snapshot source aggregates use NOLOCK. Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**Reviewed modules:** [WAVE_UpdateStatistics](sql/334272596.sql), [WAVE_UpdateStatistics01](sql/350272653.sql)

## Wave dialog seeds and active-wave list

The reviewed bodies only return dialog context. NewWave variants project one row; BuildWave projects constants once per master row. The active-wave list checks last-step NULL/empty and warehouse, not whether a process is currently running.

**Inputs and configuration:** Transfer defaults to N only when omitted in GetNewWave; explicit NULL is preserved.

**Expected result:** UI seed rows or selected wave list.

**Boundary:** Dialog save/run and permissions remain external. Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**Reviewed modules:** [MetaTrans_BuildWave](sql/421224901.sql), [MetaTrans_GetNewWave](sql/885226554.sql), [MetaTrans_NewWave](sql/916198314.sql), [MetadataTransActiveWavesForWarehouse](sql/277224388.sql)

## Completion status helpers

Each helper changes only its specified entity. Container/detail setters accept the supplied status directly. Header setters preserve each NULL/zero/negative status input but accept any positive input, including a lower status. Load progression uses separate asymmetric comparisons.

**Inputs and configuration:** Caller status values; warehouse timezone for header status dates.

**Expected result:** Entity status/stamp writes only.

**Boundary:** No validation of a full allowed transition, quantity-history shift or whole-wave completion. Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**Reviewed modules:** [CompleteWave_UpdateContSts](sql/1276179942.sql), [CompleteWave_UpdateDtlSts](sql/1292179999.sql), [CompleteWave_UpdateHdrSts](sql/1308180056.sql), [CompleteWave_UpdateShipLdSts](sql/1356180227.sql)

## Order condition and open quantity

The reviewed detail helper replaces OPEN_QTY using eligible status slots from only the supplied wave and matching order/ERP line. The order-header helper separately writes a supplied condition. Other waves and current header/line consistency are not automatically reconciled.

**Inputs and configuration:** Caller supplies status bounds, wave and condition.

**Expected result:** Selected-wave sum replaces open quantity.

**Boundary:** Included NULL quantities can nullify a row expression; no cross-wave quantity or whole-order completion proof. Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**Reviewed modules:** [CompleteWave_UpdateOdrDtlCond](sql/1324180113.sql), [CompleteWave_UpdateOdrHdrCond](sql/1340180170.sql)

## Replenishment cancellation quantities

No. The routine owns a transaction, removes matching instructions, subtracts source allocated and destination in-transit quantities, and calls history helpers. After the first history succeeds, a later rollback can return its previous zero code. The destination lookup also uses the request source warehouse.

**Inputs and configuration:** Typed request/work-created exclusion and null-safe identity predicates.

**Expected result:** Conditional transaction mutations/history requests or rollback.

**Boundary:** No operational defect reproduction; return code and caller transaction behavior require careful interpretation. Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**Reviewed modules:** [CancelWave_DeallocationOfRepReq](sql/988178916.sql), [TranHist_RepDeallocation](sql/142271912.sql)

## Wave cancellation load and history helpers

The load-status helper aggregates only shipments outside the wave and updates load statuses only when both aggregates are positive. With none remaining, it keeps old load statuses, then detaches matching wave headers. The history-named snapshot helper only returns data; separate helpers perform persistence.

**Inputs and configuration:** Caller wave and snapshot direction; current other-wave statuses.

**Expected result:** Load associations/status changes and separately returned snapshot data.

**Boundary:** No complete atomic cancellation or history persistence proven. Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**Reviewed modules:** [CancelWave_UpdateOrderHeader](sql/1004178973.sql), [CancelWave_UpdateShipLdSts](sql/1020179030.sql), [HIST_LocationInvForCancelledWave](sql/1032703077.sql)

## Allocation unit conversion selection

The body chooses integer conversion candidates and maximum unit sequence, with item-class fallback only when no item-specific units exist. Its outer join does not carry the grouped allocation ID back to the target, so deterministic per-request largest-pack selection is not established from this body.

**Inputs and configuration:** UOM factor, sequence, item/company/class records and coded NULL sentinel.

**Expected result:** Converted quantity/UM and dimensions, not new inventory reservations.

**Boundary:** No divide-by-zero guard or demonstrated uniqueness of multiple matching candidates. Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**Reviewed modules:** [ALC_UpdateShipAllocReqFP](sql/1834801944.sql)

## Allocation split and destination association

The split first reduces the source, then copies a new request through a destination-location join. It has no local transaction or input-bound checks. A missing destination can leave the source reduced with no new row. Equal/full split can expose division by zero in the second statement; output uses session-wide @@IDENTITY.

**Inputs and configuration:** Destination LOCATION in allocation TO_WHS supplies templates/zone.

**Expected result:** Conditional request split; separate association writes.

**Boundary:** No stock movement or atomic caller sequence proved. Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**Reviewed modules:** [DAS_SplitAllocsAcrossToLocs](sql/1388180341.sql), [DAS_UpdateAllocsToLoc](sql/1404180398.sql), [DAS_UpdateContsAllocNum](sql/1420180455.sql)

## Replenishment capacity fallback

No. Those substitutions apply only inside a matching configuration row. Output variables are not initialized; an incoming maximum can suppress fallback and no-match can retain incoming values. Item/location, item/type and class fallback queries have distinct warehouse scope and unordered company matches.

**Inputs and configuration:** Incoming output values, item/class, location/type and company candidates.

**Expected result:** Capacity settings through output parameters.

**Boundary:** No available-stock quantity, active values or replenishment amount measured. Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**Reviewed modules:** [INV_RtrvRplnLocCapacity](sql/23319493.sql)

## Marking a location for replenishment evaluation

The procedure sets RPLN_EVALUATION=Y only through the real-time-enabled branch and requests process history. It does not allocate product, create a replenishment request, create work or move stock. Vendor documentation makes subsequent work creation depend on wave steps and replenishment-master method.

**Inputs and configuration:** REAL_TIME_RPLN, RPLN_EVALUATION, culture, replenishment master and configured work-creation wave step.

**Expected result:** Evaluation or work-created flag mutation according to selected helper.

**Boundary:** No rowcount proof in mark output and no return capture from history. Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**Reviewed modules:** [MarkLocationforReplenishment](sql/197224103.sql), [WRK_UpdateAllocWorkCreated](sql/1162799550.sql), [WRK_UpdateReplenWorkCreated](sql/1258799892.sql)

## Replenishment split orientation

The original request retains the supplied quantity. The inserted request gets old minus supplied, and the separately supplied instruction is linked to the new request. No upper bound, instruction association check or local transaction guarantees a valid atomic split.

**Inputs and configuration:** Caller quantity, original request, instruction ID and current request conversion quantities.

**Expected result:** Remainder request, original retained quantity and instruction reference update.

**Boundary:** No automatic instruction quantity adjustment or physical stock transfer. Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**Reviewed modules:** [WRK_SplitReplenishmentRequest](sql/1130799436.sql)

## Replenishment counts and projections

It sums two count rows using UNION, so equal counts collapse. Its joined branch can also count several instructions for one request. The detail pane counts instruction/history rows under different predicates; the request view can duplicate rows through inventory joins without attribute identity.

**Inputs and configuration:** Include-marked flag defaults Y; item/company/destination and instruction conditions.

**Expected result:** Predicate-based numbers and projections, not guaranteed distinct request totals.

**Boundary:** No current counts or deployment frequency of duplicate identities were observed. Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**Reviewed modules:** [INVfn_DoOpenRplnExist](sql/1656705300.sql), [Replenishment_InsightDetailPaneData](sql/2085230829.sql), [REPLENISHMENT_REQUEST_VIEW](sql/588581185.sql)

## Stored wave metric meaning

This wrapper copies LAUNCH_STATISTICS.TOTAL_QTY, the same stored field used by TotalQuantity, into statistics storage. Rejected metrics use specific status-slot formulas, including baseline adjustment and nullable quantity arithmetic. These are stored reporting calculations, not measured physical execution.

**Inputs and configuration:** Statistics field metadata, original-line baseline, numeric998/999 slot predicates and resource language.

**Expected result:** Stored scalar metrics or display/count result sets.

**Boundary:** Whole-process duration, distinct work units and actual warehouse completion remain unproven. Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**Reviewed modules:** [WVST_AllocatedQuantity](sql/1610801146.sql), [WVST_LinesCompletelyRejected](sql/1658801317.sql), [WVST_LinesPartiallyRejected](sql/1674801374.sql), [WVST_RejectedQuantity](sql/1722801545.sql), [WVST_TotalLines](sql/1770801716.sql), [WVST_TotalQuantity](sql/1786801773.sql), [WVST_TotalShipments](sql/1802801830.sql), [WVST_WaveStatisticsHeaderFields](sql/1818801887.sql), [WAVE_InsightDetailPaneData](sql/270272368.sql)

## Statistics read and save contracts

The getter preserves a non-NULL incoming output when no value row matches, then replaces only NULL with zero. Missing field metadata raises severity18. The saver first reads a row ID then updates or inserts; no local transaction or uniqueness guarantee on field/source key makes it an atomic upsert.

**Inputs and configuration:** Named source/field records; nullable VALUE and nonnullable SOURCE_KEY/FIELD_ID in captured catalog.

**Expected result:** Scalar output or stored value/timestamp.

**Boundary:** Captured unique index is on OBJECT_ID, not field/source-key pair; concurrent duplicate inserts are not prevented by this helper. Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**Reviewed modules:** [STAT_GetStatisticsValue](sql/2033754648.sql), [STAT_SaveStatisticsValue](sql/2049754705.sql)

## Zero inventory cleanup after wave replenishment

Its initial candidate join includes company/lot/attributes, but the inner cleanup deliberately narrows identity only to location, item and warehouse. It chooses the minimum ID across that broader set, deletes other rows with all four quantities zero and clears lot/attribute identity on a retained all-zero row.

**Inputs and configuration:** Wave-linked replenishment destinations and stored inventory identity/quantities.

**Expected result:** Conditional zero-row deletion/identity cleanup.

**Boundary:** No actual company/lot data examined; READ_ONLY cursor does not mean a read-only procedure. Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**Reviewed modules:** [INV_LaunchCancelWithReplenish](sql/1288703989.sql)

## Review inventory

| Object | Bounded purpose |
|---|---|
| [dbo.WAVE_AddShipment](sql/254272311.sql) | Attach one shipment to a wave and assign caller-supplied pending statuses. |
| [dbo.WAVE_RemoveShipment](sql/286272425.sql) | Return a single shipment to pool wave number zero. |
| [dbo.WAVE_RemoveShipments](sql/302272482.sql) | Return all currently matching wave shipments and details to pool wave zero. |
| [dbo.WAVE_TransferShipment](sql/318272539.sql) | Transfer a single shipment and its details to a supplied wave. |
| [dbo.WAVE_UpdateStatistics](sql/334272596.sql) | Refresh stored wave totals from current shipment-header view aggregates. |
| [dbo.WAVE_UpdateStatistics01](sql/350272653.sql) | Guard selected wave-step starts and refresh progress/statistics within a local transaction. |
| [dbo.WAVE_InsightDetailPaneData](sql/270272368.sql) | Return six wave detail-pane result sets. |
| [dbo.MetadataTransActiveWavesForWarehouse](sql/277224388.sql) | List wave statistics rows considered active by last-step emptiness. |
| [dbo.MetaTrans_BuildWave](sql/421224901.sql) | Provide initial wave dialog context; no wave creation in this body. |
| [dbo.MetaTrans_GetNewWave](sql/885226554.sql) | Provide initial wave dialog context; no wave creation in this body. |
| [dbo.MetaTrans_NewWave](sql/916198314.sql) | Provide initial wave dialog context; no wave creation in this body. |
| [dbo.CompleteWave_UpdateContSts](sql/1276179942.sql) | Set a single container status. |
| [dbo.CompleteWave_UpdateDtlSts](sql/1292179999.sql) | Set a single shipment detail first status. |
| [dbo.CompleteWave_UpdateHdrSts](sql/1308180056.sql) | Apply independently optional leading/trailing shipment statuses. |
| [dbo.CompleteWave_UpdateOdrDtlCond](sql/1324180113.sql) | Replace order-line condition and open quantity from selected wave shipment history slots. |
| [dbo.CompleteWave_UpdateOdrHdrCond](sql/1340180170.sql) | Assign an order-header condition and current condition timestamp. |
| [dbo.CompleteWave_UpdateShipLdSts](sql/1356180227.sql) | Apply asymmetric supplied load-status progression rules. |
| [dbo.CancelWave_DeallocationOfRepReq](sql/988178916.sql) | Reverse source allocated and destination in-transit quantities for a replenishment request, with history calls. |
| [dbo.CancelWave_UpdateOrderHeader](sql/1004178973.sql) | Invoke shipment order-header cancellation helper for each wave shipment. |
| [dbo.CancelWave_UpdateShipLdSts](sql/1020179030.sql) | Recompute remaining load statuses then detach a wave from its loads. |
| [dbo.HIST_LocationInvForCancelledWave](sql/1032703077.sql) | Return aggregated inventory/allocation snapshots for cancellation history consumers. |
| [dbo.TranHist_RepDeallocation](sql/142271912.sql) | Pass replenishment inventory before/after quantities to transaction-history persistence. |
| [dbo.ALC_UpdateShipAllocReqFP](sql/1834801944.sql) | Choose item-unit conversion metadata for allocated shipment requests in a wave. |
| [dbo.DAS_SplitAllocsAcrossToLocs](sql/1388180341.sql) | Split an allocation request quantity to another destination location. |
| [dbo.DAS_UpdateAllocsToLoc](sql/1404180398.sql) | Change one allocation destination and its location-derived metadata. |
| [dbo.DAS_UpdateContsAllocNum](sql/1420180455.sql) | Assign a shipping container to an allocation number. |
| [dbo.INV_RtrvRplnLocCapacity](sql/23319493.sql) | Resolve replenishment capacity through item/location and class/type fallback queries. |
| [dbo.MarkLocationforReplenishment](sql/197224103.sql) | Mark a real-time-replenishment location for evaluation and request process history. |
| [dbo.WRK_SplitReplenishmentRequest](sql/1130799436.sql) | Retain supplied quantity on an original replenishment request and create a remainder request linked to an instruction. |
| [dbo.INVfn_DoOpenRplnExist](sql/1656705300.sql) | Compute a count-like open replenishment indicator for an item and destination. |
| [dbo.INV_LaunchCancelWithReplenish](sql/1288703989.sql) | Clean zero-quantity inventory identities at wave replenishment destinations. |
| [dbo.REPLENISHMENT_REQUEST_VIEW](sql/588581185.sql) | Project replenishment requests with computed measurements and source/destination inventory context. |
| [dbo.Replenishment_InsightDetailPaneData](sql/2085230829.sql) | Return replenishment detail-pane identity and work/history counts. |
| [dbo.WRK_UpdateAllocWorkCreated](sql/1162799550.sql) | Mark one request WORK_CREATED=Y. |
| [dbo.WRK_UpdateReplenWorkCreated](sql/1258799892.sql) | Mark one request WORK_CREATED=Y. |
| [dbo.WVST_AllocatedQuantity](sql/1610801146.sql) | Copy stored wave allocated quantity into the configured statistics value. |
| [dbo.WVST_TotalLines](sql/1770801716.sql) | Copy stored wave total lines into the configured statistics value. |
| [dbo.WVST_TotalQuantity](sql/1786801773.sql) | Copy stored wave total quantity into the configured statistics value. |
| [dbo.WVST_TotalShipments](sql/1802801830.sql) | Copy stored wave total shipments into the configured statistics value. |
| [dbo.WVST_LinesCompletelyRejected](sql/1658801317.sql) | Persist a wave fully-rejected-line metric adjusted for lines removed since a baseline. |
| [dbo.WVST_LinesPartiallyRejected](sql/1674801374.sql) | Persist count of wave lines with later rejected-status slots while first slot is not rejected. |
| [dbo.WVST_RejectedQuantity](sql/1722801545.sql) | Persist sum of quantities in rejected-status history slots for a wave. |
| [dbo.WVST_WaveStatisticsHeaderFields](sql/1818801887.sql) | Return localized wave header values arranged by presentation coordinates. |
| [dbo.STAT_GetStatisticsValue](sql/2033754648.sql) | Resolve a named statistics field and retrieve a scalar value by source key. |
| [dbo.STAT_SaveStatisticsValue](sql/2049754705.sql) | Insert or update a named stored statistics value. |

## Evidence and open work

Full redacted body line ranges, redacted file hashes and original-definition hashes are in each source and contract record. Targeted branch spans supplement the full-body evidence. Original constant classification verified known flag/default/direction behavior without publishing private messages or definition text.

Two lexical dynamic-SQL candidates are fixed procedure calls assigning a return code. Eleven catalog dependencies retain caller-dependent name-binding gaps; same-name candidates are recorded without marking runtime binding resolved. Five table schema records document identities/nullable columns and unique-key shape; six constraint/default records include the statistics zero default and its explicit-NULL boundary. No sequence allocator is invoked by these reviewed identity-based split bodies.

Sixteen help topics contain 33 authored evaluation cases. These cases specify required explanations and prohibited overclaims; case execution belongs to the coordinator. Four family associations remain partial. Complete application bindings, live settings, caller transaction/error policy, unreviewed dependencies, complete process measurement and accessibility acceptance remain open.
