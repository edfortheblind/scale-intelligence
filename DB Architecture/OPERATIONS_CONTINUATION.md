# Operational helpers: source contracts

This guide explains the captured operational helpers using the owner-attested current replica. It does not require a version or build identifier. Some helpers return data; others change records, queue messages or control maintenance. Their exact behavior is distinguished below.

The batch contains 165 complete procedure reviews, 39 help topics and 78 authored cases. No routine was executed. Source references, hashes, complete retained syntax and limitations are in [the structured batch](mappings/batches/operations-continuation.json).

## Why shipment detail panels can show unexpected shared fields

The panels summarize stored shipment, line and lot data. A common field may be blank when lines disagree. In the shipment header panel, the dock lookup has no shipment filter, so the returned dock can come from another shipment.

- The header common-value checks use COUNT DISTINCT, which ignores NULL values.
- The dock variable is assigned from an unfiltered shipment/load join without an ordering rule.
- These queries display data and do not pick, ship or change a dock assignment.

Source: [SHP_InsightDetailPaneData](sql/1633753223.sql), [SHP_LineInsightDetailPaneData](sql/1649753280.sql), [SHP_LotInsightDetailPaneData](sql/1665753337.sql), [SHP_InsighInPoolDetailPaneData](sql/1617753166.sql).

## Why a container panel count differs from its work count

Container panels use different scopes for children, work and order status. A child count can cover direct children while work is counted across a recursive subtree. Item and lot joins can also repeat a displayed row.

- The shipping-container panel item join can include a company-specific and generic item; the lot join omits warehouse.
- The displayed serial flag comes from item tracking configuration, not a count of recorded serials.
- The order-status panel requires a matching detail aggregate despite its LEFT JOIN.

Source: [SHPContainer_InsightListPaneData](sql/1937754306.sql), [TpmOrderContainerStatus_InsightDetailPaneData](sql/78271684.sql), [TpmOrderLineStatus_InsightDetailPaneData](sql/110271798.sql), [TpmOrderStatus_InsightDetailPaneData](sql/126271855.sql).

## Why work-order counts and putaway fields can be ambiguous

Work-order panels summarize stored work and related shipments. The same shipment can appear in two status counts when its lines lie on both sides of the boundary. Available-to-build quantity uses the smallest grouped component coverage ratio, capped at one before subtracting quantity already built.

- Putaway lookup by unit ID lacks a warehouse filter; separate unordered TOP 1 lookups need not select the same candidate.
- A zero component-needed total can cause division by zero. Missing detail groups leave coverage at one.
- A feature flag determines whether the resulting build quantity keeps fractions or is floored; negative results are not clamped.

Source: [WOD_LineInsightDetailPaneData](sql/794798239.sql), [WOH_InsightDetailPaneData](sql/810798296.sql), [WOLP_InsightDetailPaneData](sql/842798410.sql), [WOHB_UpdateQtyAvailToBuild](sql/826798353.sql).

## What receipt, purchase-order and history panels establish

These panels read the selected receipt, purchase order, container or stored history. Their result is evidence of the fields and relationships selected by the query. It does not perform receiving, putaway, inspection or a purchase-order change.

- Use the internal identifier expected by the exact panel; each body has its own joins and missing-row rules.
- A stored process or transaction-history entry is separate from independent confirmation of physical work.

Source: [RCPT_ContainerInsightDetailPaneData](sql/1925230259.sql), [RCPT_ContainerInsightListPaneData](sql/1941230316.sql), [RCPT_InsightDetailPaneData](sql/1957230373.sql), [RCPT_InsightListPaneData](sql/1973230430.sql), [RCPT_LineInsightDetailPaneData](sql/1989230487.sql), [POD_InsightDetailPaneData](sql/1813229860.sql), [POH_InsightDetailPaneData](sql/1829229917.sql), [POH_TpmInsightDetailPaneData](sql/1845229974.sql), [PROCHST_InsightDetailPaneData](sql/1861230031.sql), [QLTYHST_InsightDetailPaneData](sql/1893230145.sql), [InventoryInsightDetailPaneTransactionHistoryData](sql/1624705186.sql).

## Why a detail panel can use a different identity than expected

The panel helpers have specific identity and join rules. The tote-detail helper looks up a tote header using the supplied detail identifier directly, without following a parent relationship. The movement-analysis panel includes a context row even when its later data selection is empty.

- A name ending in DetailPaneData does not guarantee a parent lookup or one result set.
- The optional complete source contract records projected fields, joins, NULL handling and ordering for each panel.

Source: [TH_InsightDetailPaneData](sql/14271456.sql), [TRNHST_InsightDetailPaneData](sql/174272026.sql), [UA_InsightDetailPaneData](sql/190272083.sql), [MCA_InsightDetailPaneData](sql/213224160.sql), [WEG_InsightDetailPaneData](sql/382272767.sql), [DIM_InsightDetailPaneData](sql/584701481.sql), [DM_InsightDetailPaneData](sql/600701538.sql), [DOM_InsightDetailPaneData](sql/616701595.sql), [AD_InsightDetailPaneData](sql/892178574.sql), [ADT_InsightDetailPaneData](sql/924178688.sql), [RQH_InsightDetailPaneData](sql/1073751228.sql), [IN_InsightDetailPaneData](sql/1096703305.sql), [PGPT_InsightDetailPaneData](sql/1461228606.sql), [SHP_MOPInsightDetailPaneData](sql/1745753622.sql), [PWL_InsightDetailPaneData](sql/1877230088.sql), [LA_InsightDetailPaneData](sql/2072706782.sql), [TD_InsightDetailPaneData](sql/2145755047.sql).

## Why a serial uniqueness check can miss a duplicate

The check changes scope according to duplicate-serial configuration and the supplied item context. A missing object identifier is especially significant: the default NULL value makes the exclusion comparison fail to match existing serial rows, so the routine can report unique despite a duplicate.

- Receipt container context takes precedence over location inventory, then shipping container.
- One branch compares item, company and template; another compares item only; the global branch checks serial text across the table.
- The routine returns a check result and does not create a uniqueness constraint or insert a serial.

Source: [ValidateSerialNumberIsUnique](sql/206272140.sql).

## How container status changes reach a receipt header

The container helper updates the selected status and rolls the minimum child status up its parent chain. The receipt header then combines container statuses with open detail quantity and can queue a close alert. These are database changes, separate from physical receipt completion.

- A missing positive ancestor or a cycle has no explicit loop guard.
- Header close date is set on a change to the configured closed status and is not cleared on reopening.
- The alert check prevents an existing matching request in the query, but its NOLOCK check is not a concurrency guarantee.

Source: [RCB_SetStatus](sql/1909230202.sql), [RTH_UpdateHeader](sql/1121751399.sql).

## How shipment and load status rollups retry

Shipment and load helpers calculate a status range and update only when the stored old statuses still match. They retry without a fixed limit. NULL old statuses can affect both change detection and matching, while alert insertion can occur before the shipment update succeeds.

- The load fallback repeats the minimum-status test and does not reliably repair a nonpositive maximum.
- Order completion checks only detail status1 below 900; it does not inspect all ten status buckets.
- The bodies do not supply an encompassing transaction for the whole chain.

Source: [SCB_SetStatus](sql/71319664.sql), [STH_UpdateHeader](sql/2065754762.sql), [STH_UpdateLoad](sql/2081754819.sql), [STH_UpdateOrderStatus](sql/1515152443.sql).

## Why quantity movement variants can leave different header statuses

Both helpers move quantity between the ten shipment-detail status buckets. The unsuffixed helper refreshes the shipment header when the leading or trailing status changes. The 01 variant stops after updating the detail.

- The source status must exist and the remaining source quantity cannot be negative.
- There is no explicit rejection of a negative move amount or a guard against an eleventh occupied status.
- UPDLOCK is present, but a transaction spanning the read and write must come from the caller.

Source: [SDB_MoveQtyToSts](sql/1457752596.sql), [SDB_MoveQtyToSts01](sql/1473752653.sql).

## What transferring a rejected detail copies and resets

The transfer helper copies a detail to another shipment, resets its status buckets and marks the original rejected. It copies existing total quantity, weight, volume and value to the new line rather than recomputing them from the supplied moved quantity. A separate cancellation helper subtracts shipment totals from an order and can subtract again if repeated.

- The transfer owns a transaction and rethrows caught errors; its rollback can include an existing caller transaction.
- Original status-bucket quantities are not all cleared when original totals become zero.
- Header child return codes are not captured by the transfer, so a nonzero return without an exception is different from a caught failure.

Source: [TransferRejectedDetail](sql/158271969.sql), [CancelShipment_UpdateOrderHeader](sql/972178859.sql).

## Why an alert request can be deleted during validation

The batch helper sends selected requests to inbound or outbound validators. A validator deletes a request when its receipt or shipment status is missing, or when a configured criterion fails. It does not send an alert or mark the batch processed.

- Inbound criteria compare text even for numeric fields. Outbound lines, value and weight use numeric casts with zero default scale.
- No criteria leaves the request intact. NULL comparisons can avoid marking a failure.
- Deletion uses the supplied request identifier without an added warehouse ownership check.

Source: [WAP_ValAllRequests](sql/215320177.sql), [WAP_ValInboundReq](sql/222272197.sql), [WAP_ValOutboundReq](sql/238272254.sql).

## Why an audit record can lack a short value

The audit logger creates a header and passes optional values to a chunk helper. That helper uses a strict length comparison, so a one-character value and a final one-character remainder after a 1998-character chunk can be omitted. Process-history logging separately depends on an activation flag that a caller may supply.

- The chunk length uses LEN, which ignores trailing spaces.
- Audit header and value writes are not wrapped in a local transaction.
- A non-NULL process-history activation flag bypasses its configuration lookup.

Source: [ADT_IAuditLogValue](sql/908178631.sql), [ADT_LogAudit](sql/940178745.sql), [HIST_SaveProcHist](sql/1064703191.sql).

## Why a history error can occur after rows were inserted

Transaction-history helpers record or infer quantities; they do not independently prove the inventory operation. The general logger inserts history and attributes before some serial checks. Without a caller rollback, a later error can leave partial history.

- The general logger captures @@IDENTITY, which can be affected by trigger inserts.
- Deallocation-history running balances depend on consecutive rows from an unordered insert, and the comparison tuple omits company.
- Supplying both wave and shipment identifiers broadens the deallocation selection through OR.

Source: [HIST_LogShipDeAlloc](sql/1048703134.sql), [HIST_SaveTransHist](sql/1080703248.sql).

## What deactivating a work unit changes

Deactivation copies the work unit to inactive storage and then deletes its active instructions. The helper has no local transaction around those two steps and does not check a completion condition. The reconciliation wrapper selects a narrower set first, updates a condition and calls deactivation.

- Copy uses NOLOCK while the later delete selects the work unit again.
- The reconciliation count applies to its filtered instructions, not every instruction for the work unit.

Source: [DeactivateWork](sql/552701367.sql), [TRAV_CC_Reconcile](sql/988842885.sql).

## Why pallet destinations can be overwritten after work creation

Work-creation callbacks collect selected work instructions and upsert pallet destinations by work-unit name. More than one destination for a work unit can overwrite the same pallet row in an unspecified order. The outgoing-location callback can replace an existing value, including with NULL when no mapping branch matches.

- EX02 also copies WORK_UNIT into instruction USER_DEF1; EX08 does not.
- Pallet renaming reads an old name from instruction USER_DEF1 and updates pallet rows without a warehouse filter.
- A stored callback definition does not establish that the application invokes it.

Source: [TRAV_EX02_WorkCreationAfterExitPoint](sql/148507908.sql), [TRAV_EX08_WorkCreationAfterExitPoint](sql/1323151759.sql), [EXP_WorkCreationAfterExitPoint](sql/1941581955.sql), [TRAV_UpdateWorkUnitName](sql/132507851.sql).

## Why escalation can change more than one instruction

Lane insertion checks only the lane/work-unit pair. The escalation jobs mark lanes by work unit and, when any instruction has missing priority or priority above three, set every instruction for that work unit to three. Existing lower priorities can therefore also change.

- The existence check and insert have no concurrency protection against duplicate pairs.
- EX08 additionally maintains pallet rows and mapped outgoing locations; its NOT IN cleanup can be suppressed by a NULL work-unit value.

Source: [TRAV_EX02LANEDataProcess](sql/1522208573.sql), [TRAV_EX02_ScheduledJob](sql/1538208630.sql), [TRAV_EX08_ScheduledJob](sql/1339151816.sql).

## What a wave or pallet queue success means

These helpers set a wave flag or insert DIF queue messages. A success output does not confirm that an external system received or processed the message. Some wrappers assign success without checking whether any row was inserted or updated.

- Wave enqueue requires the stored selection flag and looks up an event and endpoint without ordering.
- Pallet outgoing data comes from the selected work unit plus a padded next number; missing values can make the payload NULL.
- The mark-for-PS helper sets success even when no launch row matched.

Source: [TRAV_EX01_InsertDataForPS](sql/1474208402.sql), [TRAV_EX01_ResendPSData](sql/1490208459.sql), [TRAV_EXP_ReleaseWaveAfter](sql/1602208858.sql), [TRAV_EX01_MarkForPS](sql/1861177976.sql), [TRAV_EX02_SCALEtoWCSDIFOutUpdate](sql/1849317898.sql).

## Why carton export quantities and sequence differ by helper

The carton export helpers rank containers by pick-count grouping and source location. The EX01 helper casts quantity to a whole number; EX06 keeps its stored fractional quantity. Separate dimension and pallet helpers change stored values and do not establish a completed export.

- Parent-child export joins use text container IDs without warehouse or company scope.
- Dimension update matches container ID only and converts supplied text before multiplying volume.
- Pallet-weight validation can return a success-shaped row, an error-shaped row or no result set; stored weight text is converted to decimal.

Source: [TRAV_EX06_GetPackSizeWaveContainerData](sql/1355151873.sql), [TRAV_EX01_GetPackSizeWaveContainerData](sql/1833317841.sql), [TRAV_EX01_UpdateContainerDetails](sql/1746209371.sql), [TRAV_EX06UpdateMOPValues](sql/1570208744.sql), [EX06ValidateMOPNum_Weights](sql/1586208801.sql).

## Where the RF quantity warning comes from

The RF helper generates JavaScript that compares the form quantity to one configured maximum. It does not itself validate a scan or prove that the browser ran the code. Its configuration lookup has no warehouse filter even though it extracts warehouse and user from session XML.

- A missing maximum can make the generated return value NULL; duplicate configuration rows can fail the scalar lookup.
- The XML helper parameterizes the document but concatenates the supplied XPath and namespace syntax.
- Informational source messages include session/debug content; none was generated during this review.

Source: [TRAV_EXP_RfCheckInAddValidationJavascript](sql/940582439.sql), [GetXMLAttributeValueByAttributeName](sql/1016703020.sql).

## Why inventory staging can be replaced before validation finishes

Inventory staging is cleared globally before the selected warehouse conversion rows are copied and checked. A validation error can therefore leave the new staging data in place. The loader later processes positive quantities with an empty processing flag, using a child inventory-adjustment routine.

- The loader commits each successful adjustment before marking staging and updating received timestamps.
- Some grouped validation subqueries can fail when more than one offending group exists.
- The received-date update omits the inventory attribute identifier and may stamp several matching records.

Source: [POPULATE_INVENTORY_STAGING](sql/1228687575.sql), [LOAD_INVENTORY](sql/1244687632.sql).

## Why a warehouse argument does not always limit a conversion load

The assignment and capacity conversion routines use warehouse scope inconsistently. Their cleanup and staging clears can affect every warehouse. Capacity loader v2 ignores the warehouse argument for insertion and marks every staging row after its bulk operation.

- Assignment load inserts the assignment first, commits, then creates or marks permanent inventory and updates staging.
- Capacity population copies all conversion rows after a global staging clear.
- Capacity loader reads @@ERROR only after a separate SET statement, so its error check is not a reliable capture of the insert error.

Source: [POPULATE_Staging_ILA](sql/401540614.sql), [LOAD_ILA](sql/417540671.sql), [POPULATE_STAGING_ILC](sql/1116687176.sql), [LOAD_ILC_v2](sql/1132687233.sql).

## What generic configuration staging changes

Generic configuration population normalizes raw rows and validates a requested record type, then clears the whole staging table before copying that type. The loader inserts selected staged rows one at a time. The separate configuration-summary helper counts selected existing configuration; it does not load those rows.

- Raw normalization is broader than the requested record type.
- Loader success commits the configuration insert before marking its staging row processed.
- Existing configuration conflicts are checked during population; the loader itself does not perform an upsert.

Source: [POPULATE_Generic_Config_Dtl](sql/1161315447.sql), [Load_Generic_Config_Dtl](sql/1145315390.sql), [LoadAdditionalConfigsSummary](sql/181224046.sql).

## Why accessorial choices or values are missing

Accessorial choices depend on the shipment carrier and service matching rating configuration. Container branches apply extra per-container and contents rules. A missing required join can return no choices; an existing override value may fall back to the detail default when it is NULL.

- Detail lookup only runs for a positive header identifier.
- Override lookups are scalar and can fail if multiple matching assignments exist.
- These helpers list configuration and stored values; they do not rate or charge the shipment.

Source: [GetAccessorialDetails](sql/808702279.sql), [GetAvailableAccessorials](sql/856702450.sql).

## How a parent logistics unit is assigned

The parent-logistics helper identifies group inventory in a requested location class and updates it only when the candidate class is not spread over multiple locations. Its joins and the separate consolidation lookup have scope limits that can affect which record is chosen.

- The parent-logistics LOCATION join uses location text without warehouse equality; company is not matched.
- The consolidation helper selects one container ID candidate before its final warehouse filter, without trying another candidate when that filter fails.
- The receipt attribute lookup returns attribute rows linked by receipt-container IDs; it does not create attributes.

Source: [PG_UpdateParentLogisticsUnit](sql/1445228549.sql), [FetchLPDetails](sql/648701709.sql), [GetConsolidateAfterPutaway](sql/872702507.sql), [Rtv_LocationInventoryAttributes](sql/1137751456.sql).

## What rewriting server paths affects

The path setter rewrites a fixed set of configuration keys and the PDF directory of every warehouse. It chooses separators using fixed HTTPS patterns. It does not check whether a directory exists or whether the application can use it.

- The warehouse PDF-directory UPDATE has no WHERE clause.
- NULL input takes the alternate branch and can write NULL through concatenation.
- The path reader returns UNION ALL rows without deduplicating or accessing the paths. Private paths are not reproduced here.

Source: [TOOLBOX_GetServerPathValues](sql/46271570.sql), [TOOLBOX_SetServerPathValues](sql/62271627.sql).

## Why maintenance dummy mode is not a preview

The maintenance procedures execute their queued commands. Their dummy mode broadens selection and is not a dry run. Other helpers can reseed a shipping-load identity or alter columns and overwrite values. These definitions are documented for understanding and were not executed.

- Even an invalid maintenance operation can reach persistent log-table creation.
- The two Azure maintenance variants use different index options and statistics sampling commands.
- The column helper in check-constraint mode can run an unfiltered UPDATE setting the column to the supplied default.

Source: [AzureSQLMaintenance](sql/956178802.sql), [AzureSQLMaintenance_1](sql/2122646805.sql), [WC_UpdateWorkStats](sql/366272710.sql), [TRAV_RESEED_DB](sql/1893178090.sql), [dba_UpdateColumn](sql/1536724527.sql).

## What the archive purge helpers can change

The archive helpers contain destructive database operations. The simple purge helper builds TRUNCATE commands for catalog-selected names behind fixed server/database checks. The runbook rewrites archive preferences, filter records and scheduled-job settings, and immediately runs eligible truncations and delete loops. Process-history and transaction-history type purges have no age predicate. A routine name or stored definition is not proof that a purge was executed.

- The simple guard combines its server and database allowlists with OR, not AND.
- Dynamic targets depend on the catalog and fixed patterns; no archive rows or database were accessed.
- Runbook delete limits apply per cursor pass, not to the whole invocation. Selected TRUNCATE operations have no row cap, and the body has no encompassing transaction or rollback handler.

Source: [PURGE_ARCHIVE_TABLES](sql/777873938.sql), [ArchivePurgeRunbook](sql/337540386.sql).

## Why trace-control variants may not run as expected

These routines control tracing and event sessions, which is separate from reading ordinary help data. Captured variants have compatibility concerns: one uses legacy column names, and another passes two arguments to a captured child that accepts one. No trace was started or read.

- Event-session condition 1 drops and recreates three sessions before starting them; condition 0 stops them.
- The SQL trace string filter is declared without a length and can truncate to one character.
- Fixed target locations remain private; platform dispatch is optional technical evidence and does not require a user build identifier.

Source: [trace_ILS](sql/1419152101.sql), [PMN_Trace](sql/1765229689.sql), [PMN_EVENT_SESSION](sql/1653229290.sql), [PMN_Cycle_Trace](sql/1637229233.sql), [cycle_trace](sql/2117582582.sql).

## Why movement totals may not equal transaction totals

Movement analysis replaces a warehouse summary using recent history, optional retained history and zero-hit inventory. Joined inventory or generic item rows can multiply history. UNION can also collapse equal aggregates from current and retained sources. Zero-hit rows use on-hand quantity, while hit rows use movement quantity.

- The permanent-only branch joins inventory without matching item, logistics unit or attribute ID.
- The date window ends at tomorrow UTC midnight.
- The delete and rebuild have no local transaction.

Source: [MOVECLS_MineMovementClassAnalysisData](sql/1381228321.sql), [MCA_InsightDetailPaneData](sql/213224160.sql).

## Why shipment monitor tiles do not add up

Monitor charts and tiles use different status and time predicates. Total shipments, work in progress and picking not started are separate queries, not a required partition. Some load tiles display row counts while their caution and warning checks use distinct load counts.

- WIP uses leading status above 300 and trailing below 700; not-started requires both statuses 300.
- Future-load selection compares a timestamp to today at midnight, so a later time today can qualify.
- Labor last-hour queries use UTC and have no upper time bound.

Source: [SHP_MonitorCustomerCategoryChartData](sql/1681753394.sql), [SHP_MonitorCustomerShipToChartData](sql/1697753451.sql), [SHP_MonitorShipmentChartData](sql/1713753508.sql), [SHP_MonitorShipmentIndicatorTile](sql/1729753565.sql), [LBR_MonitorWorkTypesChartData](sql/165223989.sql).

## Why receipt date charts and purchase-order drill-down disagree

Receipt date categories overlap, so their totals should not be added as separate receipts. The purchase-order drill-down assigns grouped results to variables and returns one chart row, so several purchase orders can collapse to one unordered group. Its week definitions also differ between chart/value and count queries.

- The date chart totals all open headers in its summary, including headers without a receipt date.
- The PO chart uses DATEPART week/year while its count summary uses an explicit week range.
- Receipt aging uses UTC timestamps; the quality tile does not require an open header.

Source: [RCPT_MonitorReceiptsDatesChartData](sql/2005230544.sql), [RCPT_MonitorReceiptsIndicatorTiles](sql/2021230601.sql), [RCPT_MonitorReceiptsPoChartData](sql/2037230658.sql), [RCPT_MonitorReceiptsTypesChartData](sql/2053230715.sql), [RCPT_MonitorReceiptsVendorNamesChartData](sql/2069230772.sql).

## Why shipping dashboards ignore supplied filters or count lines

Several shipping dashboards use fixed queries even when their signatures accept dates, columns or warehouse. Some count detail rows, others group by ERP order before counting. A fixed gadget returns 55 without reading operational data. These differences explain why similarly named totals can disagree.

- Finished-today chart queries include all planned dates from today onward, not only today.
- Grid defaults use datetime zero, not the current date.
- The per-minute helper reads a fixed external object; no remote connection was made in this review.

Source: [PM_UNSHIPPED_BY_BUILDING_PRIORITY](sql/436196604.sql), [PM_TODAY_SHIPPING_QUANTITY](sql/452196661.sql), [PM_TODAY_SHIPPING_COMPLETED](sql/468196718.sql), [PM_SHIPPED_TODAY_BY_MINUTE](sql/484196775.sql), [PM_FUTURE_SHIPPING](sql/596197174.sql), [TRAV_Gadget_AFZeroDay](sql/1307151702.sql), [ShipRec_FinishedToday_STZChart](sql/1995154153.sql), [ShipRec_FinishedToday_MCChart](sql/2011154210.sql), [ShipRec_FinishedToday_Grid2](sql/2027154267.sql), [ShipRec_FinishedToday_Grid1](sql/2043154324.sql), [ShipRec_FinishedToday_AFChart](sql/2059154381.sql), [ShipRec_CurrentWorkTotals](sql/2075154438.sql).

## How generic dashboard metrics choose count or sum

Generic metric helpers use the caller-selected table and columns to build a query. They sum only when metadata says the selected type is exactly numeric; other types use COUNT, apart from the COUNT(*) special case. The date interval includes both endpoints.

- Table and column syntax is concatenated; only data values are parameterized.
- An omitted warehouse still excludes rows whose relevant warehouse fields are NULL.
- Only the shipment helper adds a final grouping order.

Source: [PM_RECEIPTHEADER01](sql/1493228720.sql), [PM_SHIPMENTHEADER01](sql/1509228777.sql), [PM_WORKINSTRUCTION01](sql/1589229062.sql).

## Why saved wave statistics can be NULL or negative

Wave statistics use specific container predicates and previously saved values. Rejected and consolidated shipments are residual formulas, not direct counts of those states. Missing prior values can produce NULL, and the formulas do not clamp negative results.

- Full-container statistic counts qualifying rows, while pallet statistic counts distinct tree units.
- Immediate-needs quantity sums status 997 across ten buckets and does not replace every NULL with zero.
- Each helper saves through STAT_SaveStatisticsValue; it is not a read-only display query.

Source: [WVST_FullContainers](sql/1626801203.sql), [WVST_ImmediateNeedsQuantity](sql/1642801260.sql), [WVST_LooseContainers](sql/1690801431.sql), [WVST_Pallets](sql/1706801488.sql), [WVST_ShipmentsConsolidated](sql/1738801602.sql), [WVST_ShipmentsRejected](sql/1754801659.sql).

## Why custom container labels show unexpected counts or RFID text

Custom label headers combine container data with shipment-level RFID rules and a container breakdown. Their label-count expression is based on header join rows, which work-instruction matches can multiply. The details list direct children plus an eligible self item, with separate row numbering in each branch.

- RFID classification can inspect all shipment details instead of only the selected container’s line.
- The standalone RFID helper uses a scalar subquery that can fail for multiple joined detail rows.
- The unsuffixed header adds an item-category field; its date-named variant remains a separate implementation.

Source: [TRAV_LBL_ContainerContentsHeader_20160212](sql/1259151531.sql), [TRAV_LBL_ContainerContentsHeader](sql/1275151588.sql), [TRAV_LBL_ContainerContentsDetails](sql/1291151645.sql), [TRAVIS_RFID_totag](sql/1211151360.sql), [TRAV_BreakLabel](sql/1387151987.sql).

## What next-number and string helpers guarantee

The number helpers update or consume counters according to their own rules. They do not complete the business operation that later uses the number. String helpers use SQL substring and replacement behavior; a replacement token can overlap a longer numbered token.

- The general next-number update returns the prior counter value and changes the stored next value.
- A missing counter key can leave the caller output unchanged.
- The element helper uses LEN and caller position directly; empty delimiters can prevent useful progress.

Source: [NNR_RtrvNextLaunchNum](sql/55319607.sql), [NNR_GETNEXTGROUPNUMBER](sql/1397228378.sql), [NNR_GetNextNumber](sql/1413228435.sql), [NNR_GetNextNumberWithResult](sql/1429228492.sql), [SH_FillStringWithVarData](sql/135319892.sql), [SH_GetNextElement](sql/151319949.sql).

## Why helper names do not prove a read-only operation

The exact body determines what a helper does. TRAV_EXEC_PROC creates a fixed metadata view, empty-load cleanup deletes load headers, and return-date update changes shipment dates through a cross-database workday function. Other helpers only select preview metadata, security context or recent history.

- The return-date update joins back by shipment ID without warehouse or company scope.
- The unit-reference helper concatenates identifiers and values into SQL; its list loop lacks an increment and can repeat indefinitely.
- Preview selection does not print a document, and build metadata is optional technical provenance rather than a user prerequisite.

Source: [TRAV_EXEC_PROC](sql/1788793680.sql), [TRAV_delete_empty_loads](sql/1371151930.sql), [TRAV_SetShipByAndDeliverByForReturns](sql/1243151474.sql), [AddViewerActionRules](sql/2099048.sql), [DeleteDefaultViewerSettings](sql/336720252.sql), [GetGenericImageData](sql/888702564.sql), [GetPreviewDocument](sql/952702792.sql), [SpGetBuildVersion](sql/1969754420.sql), [GET_SHIPMENT_SECURITY_INFO](sql/792702222.sql), [ITM_DoesUmReferenceExist](sql/1800705813.sql), [TRAV_Wave_Allocation_Failure](sql/1227151417.sql), [ThrowError](sql/30271513.sql).

## What the INSERT script generator actually returns

This helper dynamically reads matching tables and returns text for INSERT statements. It does not execute those returned INSERT or IDENTITY_INSERT commands. No generated export or application rows were collected for this documentation.

- A NULL table-name mask selects broadly; generated table reads have no row filter.
- Legacy type rules and bounded string buffers can truncate or misrepresent wide names, values and rows.
- The returned text is not a verified backup, migration or successful restore.

Source: [sp_generate_insert_script](sql/1953754363.sql).

## Why a configuration summary can omit a selected group

The summary builds selected count queries from a JSON selection. It reads configuration and only writes local temporary state. An empty selection can produce no result set; that differs from a count query returning zero.

- The reviewed dynamic templates read 73 fixed source tables through 78 SELECT templates; an invocation need not select them all.
- System configuration has an extra detail-side exclusion, so its LEFT JOIN does not guarantee an empty header appears with zero.
- Counts differ by branch: some count rows, some non-NULL detail fields, and the carrier-reference branch counts distinct rating identifiers. There is no final result ordering.

Source: [LoadAdditionalConfigsSummary](sql/181224046.sql).

## Complete source index

Each procedure body was read in full. The structured contract preserves exact retained source expressions and the manual interpretation; dynamic and external target limits remain explicit.

| Procedure | Reviewed behavior | Source lines |
| --- | --- | --- |
| [dbo.AddViewerActionRules](sql/2099048.sql) | Bind a viewer action rule to the viewer header data source through a child procedure. | 1–35 |
| [dbo.TH_InsightDetailPaneData](sql/14271456.sql) | Read tote header and a separate tote line-count view result. | 1–28 |
| [dbo.ThrowError](sql/30271513.sql) | Raise an application error using the caller message. | 1–6 |
| [dbo.TOOLBOX_GetServerPathValues](sql/46271570.sql) | List selected server-path configuration values and path flags. | 1–50 |
| [dbo.NNR_RtrvNextLaunchNum](sql/55319607.sql) | Consume a launch-statistics identity and return it through OUTPUT. | 1–45 |
| [dbo.TOOLBOX_SetServerPathValues](sql/62271627.sql) | Rewrite fixed server-path configuration keys and every warehouse PDF directory. | 1–157 |
| [dbo.SCB_SetStatus](sql/71319664.sql) | Set one shipping-container status and propagate minimum child status through positive parents. | 1–58 |
| [dbo.TpmOrderContainerStatus_InsightDetailPaneData](sql/78271684.sql) | Prepare shipping-container status pane fields and immediate-child counts. | 1–52 |
| [dbo.TpmOrderLineStatus_InsightDetailPaneData](sql/110271798.sql) | Read one order-line pane with optional item thumbnail. | 1–33 |
| [dbo.TpmOrderStatus_InsightDetailPaneData](sql/126271855.sql) | Read order header summary and separately count stored tree-root containers. | 1–37 |
| [dbo.TRAV_UpdateWorkUnitName](sql/132507851.sql) | Rename pallet work-unit references using a JSON-derived new work unit. | 1–36 |
| [dbo.SH_FillStringWithVarData](sql/135319892.sql) | Substitute sequential data-list elements into a caller string. | 1–32 |
| [dbo.TRAV_EX02_WorkCreationAfterExitPoint](sql/148507908.sql) | Record pallet destinations after work creation and preserve the original work-unit name. | 1–99 |
| [dbo.SH_GetNextElement](sql/151319949.sql) | Extract the next delimiter-separated list element while advancing an OUTPUT pointer. | 1–31 |
| [dbo.TransferRejectedDetail](sql/158271969.sql) | Copy a rejected shipment detail to another shipment, mark the original rejected and copy comments. | 1–417 |
| [dbo.LBR_MonitorWorkTypesChartData](sql/165223989.sql) | Summarize estimated work and last-hour completions for a labor group and warehouse. | 1–95 |
| [dbo.TRNHST_InsightDetailPaneData](sql/174272026.sql) | Read one transaction-history identity with item thumbnail and transaction-type description. | 1–30 |
| [dbo.LoadAdditionalConfigsSummary](sql/181224046.sql) | Build a selected configuration-count summary from a JSON selection document. The retained body constructs dynamic UNION SELECT statements over a fixed set of configuration tables; it does not load or change those configuration rows. | 1–1348 |
| [dbo.UA_InsightDetailPaneData](sql/190272083.sql) | Read user activity session display fields. | 1–22 |
| [dbo.ValidateSerialNumberIsUnique](sql/206272140.sql) | Check serial uniqueness under global and item-scoped duplicate rules. | 1–140 |
| [dbo.MCA_InsightDetailPaneData](sql/213224160.sql) | Combine caller-supplied movement-class context, item metadata and location count. | 1–35 |
| [dbo.WAP_ValAllRequests](sql/215320177.sql) | Dispatch validation of unprocessed warehouse-alert requests in a batch. | 1–50 |
| [dbo.WAP_ValInboundReq](sql/222272197.sql) | Delete an inbound alert request when its receipt context or configured criteria fail. | 1–158 |
| [dbo.WAP_ValOutboundReq](sql/238272254.sql) | Delete an outbound alert request when its shipment context or configured criteria fail. | 1–209 |
| [dbo.DeleteDefaultViewerSettings](sql/336720252.sql) | Remove default viewer action-menu bindings and menu records. | 1–23 |
| [dbo.ArchivePurgeRunbook](sql/337540386.sql) | Perform a maintenance runbook that rewrites archive/filter/scheduled-job configuration and can immediately truncate or delete retained history tables. It is a mutating operational routine, not a read-only archive report. | 1–1247 |
| [dbo.WC_UpdateWorkStats](sql/366272710.sql) | Refresh optimizer statistics for the work-instruction table through a fixed dynamic command. | 1–14 |
| [dbo.WEG_InsightDetailPaneData](sql/382272767.sql) | Read one world-ease group container sample and distinct container count. | 1–31 |
| [dbo.POPULATE_Staging_ILA](sql/401540614.sql) | Normalize assignment conversion rows, validate location/item rules and replace assignment staging. | 1–325 |
| [dbo.LOAD_ILA](sql/417540671.sql) | Load staged item-location assignments and establish permanent location inventory. | 1–219 |
| [dbo.PM_UNSHIPPED_BY_BUILDING_PRIORITY](sql/436196604.sql) | Count shipment-detail join rows by two fixed item-category groups and three priority bands. | 1–109 |
| [dbo.PM_TODAY_SHIPPING_QUANTITY](sql/452196661.sql) | Sum shipping quantities for recent status changes grouped by allocation prefix and carrier class. | 1–36 |
| [dbo.PM_TODAY_SHIPPING_COMPLETED](sql/468196718.sql) | Count grouped ERP orders for recent status changes by allocation prefix and carrier class. | 1–54 |
| [dbo.PM_SHIPPED_TODAY_BY_MINUTE](sql/484196775.sql) | Read today-and-later shipping-per-minute totals from a fixed external object. | 1–43 |
| [dbo.DeactivateWork](sql/552701367.sql) | Copy a work unit into inactive work storage, then delete its active instructions. | 1–216 |
| [dbo.DIM_InsightDetailPaneData](sql/584701481.sql) | Read incoming interface message status by message ID. | 1–18 |
| [dbo.PM_FUTURE_SHIPPING](sql/596197174.sql) | Return up to nine formatted planned-date groups with completion row counts. | 1–57 |
| [dbo.DM_InsightDetailPaneData](sql/600701538.sql) | Read document reference labels using configured resource language. | 1–33 |
| [dbo.DOM_InsightDetailPaneData](sql/616701595.sql) | Read outgoing interface message status by message ID. | 1–18 |
| [dbo.FetchLPDetails](sql/648701709.sql) | Read location, lot and attribute identity for a license plate in one warehouse. | 1–19 |
| [dbo.PURGE_ARCHIVE_TABLES](sql/777873938.sql) | Conditionally truncate tables chosen by fixed archive-name patterns. | 1–32 |
| [dbo.GET_SHIPMENT_SECURITY_INFO](sql/792702222.sql) | Project shipment warehouse and company context for a security consumer. | 1–59 |
| [dbo.WOD_LineInsightDetailPaneData](sql/794798239.sql) | Read work-order line metadata and separate header/work/history counts. | 1–60 |
| [dbo.GetAccessorialDetails](sql/808702279.sql) | Return accessorial detail choices with shipment/container override values. | 1–99 |
| [dbo.WOH_InsightDetailPaneData](sql/810798296.sql) | Read work-order metadata with component, work, dependent-shipment, history and putaway counts. | 1–94 |
| [dbo.WOHB_UpdateQtyAvailToBuild](sql/826798353.sql) | Recompute a work order available-to-build quantity from grouped component coverage. | 1–99 |
| [dbo.WOLP_InsightDetailPaneData](sql/842798410.sql) | Read putaway license-plate metadata, open work and history count. | 1–59 |
| [dbo.GetAvailableAccessorials](sql/856702450.sql) | List applicable accessorial headers for shipment or container context. | 1–66 |
| [dbo.GetConsolidateAfterPutaway](sql/872702507.sql) | Read shipment/carrier consolidation information for a container identifier. | 1–60 |
| [dbo.GetGenericImageData](sql/888702564.sql) | Return two signature images and warehouse-formatted dates. | 1–35 |
| [dbo.AD_InsightDetailPaneData](sql/892178574.sql) | Read archive preference display metadata. | 1–20 |
| [dbo.ADT_IAuditLogValue](sql/908178631.sql) | Split an audit value into rows of up to1998 characters. | 1–52 |
| [dbo.ADT_InsightDetailPaneData](sql/924178688.sql) | Read audit-log pane fields through a local temporary copy. | 1–27 |
| [dbo.ADT_LogAudit](sql/940178745.sql) | Insert an audit header and optional parameter/return/stack/message value chunks. | 1–170 |
| [dbo.TRAV_EXP_RfCheckInAddValidationJavascript](sql/940582439.sql) | Return JavaScript that checks an RF form quantity against one configuration maximum. | 1–71 |
| [dbo.GetPreviewDocument](sql/952702792.sql) | List document types eligible for print preview for a process. | 1–33 |
| [dbo.AzureSQLMaintenance](sql/956178802.sql) | Queue and execute index/statistics maintenance with optional persistent logging. | 1–246 |
| [dbo.CancelShipment_UpdateOrderHeader](sql/972178859.sql) | Subtract shipment totals from its parent order when a shipping-load link exists. | 1–55 |
| [dbo.TRAV_CC_Reconcile](sql/988842885.sql) | Reconcile selected single-instruction work units and deactivate their work. | 1–60 |
| [dbo.GetXMLAttributeValueByAttributeName](sql/1016703020.sql) | Extract XML values through a dynamically composed namespace/XPath query. | 1–51 |
| [dbo.HIST_LogShipDeAlloc](sql/1048703134.sql) | Append inferred before/after transaction history for shipment deallocation. | 1–208 |
| [dbo.HIST_SaveProcHist](sql/1064703191.sql) | Conditionally append a process-history record using a caller-cacheable activation flag. | 1–69 |
| [dbo.RQH_InsightDetailPaneData](sql/1073751228.sql) | Read receipt quality-history pane with optional item metadata. | 1–29 |
| [dbo.HIST_SaveTransHist](sql/1080703248.sql) | Conditionally append transaction history and serial/catch-weight/location attributes, with post-insert validation. | 1–384 |
| [dbo.IN_InsightDetailPaneData](sql/1096703305.sql) | Read immediate-needs request pane using local temporary request rows. | 1–30 |
| [dbo.POPULATE_STAGING_ILC](sql/1116687176.sql) | Normalize capacity-conversion rows, validate them and replace capacity staging. | 1–293 |
| [dbo.RTH_UpdateHeader](sql/1121751399.sql) | Refresh receipt header status from open detail quantity and container statuses, then queue close alerts. | 1–125 |
| [dbo.LOAD_ILC_v2](sql/1132687233.sql) | Bulk insert unprocessed capacity staging rows, then mark staging globally. | 1–77 |
| [dbo.Rtv_LocationInventoryAttributes](sql/1137751456.sql) | Retrieve location inventory attribute rows linked to a receipt container. | 1–15 |
| [dbo.Load_Generic_Config_Dtl](sql/1145315390.sql) | Insert selected staged generic configuration rows into live configuration. | 1–135 |
| [dbo.POPULATE_Generic_Config_Dtl](sql/1161315447.sql) | Normalize raw generic configuration data, validate a requested type and replace its staging load. | 1–304 |
| [dbo.TRAVIS_RFID_totag](sql/1211151360.sql) | Classify a shipping container against a fixed item-class set for RFID tagging. | 1–31 |
| [dbo.TRAV_Wave_Allocation_Failure](sql/1227151417.sql) | Read recent allocation-failure process-history messages for a wave. | 1–67 |
| [dbo.POPULATE_INVENTORY_STAGING](sql/1228687575.sql) | Replace inventory staging from one warehouse conversion set and mark validation failures. | 1–649 |
| [dbo.TRAV_SetShipByAndDeliverByForReturns](sql/1243151474.sql) | Replace planned shipment and delivery dates for shipments in two fixed customer categories. | 1–38 |
| [dbo.LOAD_INVENTORY](sql/1244687632.sql) | Apply positive staged inventory adjustments and mark each selected row. | 1–207 |
| [dbo.TRAV_LBL_ContainerContentsHeader_20160212](sql/1259151531.sql) | Project custom container-label header, RFID classification and shipment container breakdown. | 1–147 |
| [dbo.TRAV_LBL_ContainerContentsHeader](sql/1275151588.sql) | Project custom container-label header, RFID classification and shipment container breakdown. | 1–148 |
| [dbo.TRAV_LBL_ContainerContentsDetails](sql/1291151645.sql) | Project direct container contents plus an eligible self item for custom labels. | 1–73 |
| [dbo.TRAV_Gadget_AFZeroDay](sql/1307151702.sql) | Return a fixed gadget value. | 1–54 |
| [dbo.TRAV_EX08_WorkCreationAfterExitPoint](sql/1323151759.sql) | Record pallet destinations for the EX08 work-creation selection. | 1–97 |
| [dbo.TRAV_EX08_ScheduledJob](sql/1339151816.sql) | Escalate lane work and maintain pallet/destination assignments through several independent steps. | 1–136 |
| [dbo.TRAV_EX06_GetPackSizeWaveContainerData](sql/1355151873.sql) | Project carton contents and a pick-location sequence for a numeric wave. | 1–129 |
| [dbo.TRAV_delete_empty_loads](sql/1371151930.sql) | Delete shipping-load headers with no shipment-header reference. | 1–18 |
| [dbo.MOVECLS_MineMovementClassAnalysisData](sql/1381228321.sql) | Replace movement-class analysis for a warehouse using transaction activity and zero-hit inventory. | 1–209 |
| [dbo.TRAV_BreakLabel](sql/1387151987.sql) | Return container type and launch number for a break-label lookup. | 1–19 |
| [dbo.NNR_GETNEXTGROUPNUMBER](sql/1397228378.sql) | Get a next-number candidate not currently used as a work group. | 1–25 |
| [dbo.NNR_GetNextNumber](sql/1413228435.sql) | Return the current next-number value while advancing or wrapping its stored counter. | 1–31 |
| [dbo.trace_ILS](sql/1419152101.sql) | Control three SQL trace streams and report their status, with variant-specific dispatch. | 1–391 |
| [dbo.NNR_GetNextNumberWithResult](sql/1429228492.sql) | Expose the next-number helper as a numeric result set. | 1–28 |
| [dbo.PG_UpdateParentLogisticsUnit](sql/1445228549.sql) | Set parent logistics unit for group inventory in a single location of the requested class. | 1–53 |
| [dbo.SDB_MoveQtyToSts](sql/1457752596.sql) | Move a quantity between the ten status buckets of a shipment detail. | 1–414 |
| [dbo.PGPT_InsightDetailPaneData](sql/1461228606.sql) | Aggregate one putaway group pane from the metadata view. | 1–28 |
| [dbo.SDB_MoveQtyToSts01](sql/1473752653.sql) | Move a quantity between the ten status buckets of a shipment detail. | 1–403 |
| [dbo.TRAV_EX01_InsertDataForPS](sql/1474208402.sql) | Queue a wave identifier as an incoming DIF message when its wave flag matches the fixed selection value. | 1–40 |
| [dbo.TRAV_EX01_ResendPSData](sql/1490208459.sql) | Request resend of a selected wave through the incoming DIF queue after two existence checks. | 1–34 |
| [dbo.PM_RECEIPTHEADER01](sql/1493228720.sql) | Compose a grouped metric query from caller-selected table, columns, date range and warehouse. | 1–119 |
| [dbo.PM_SHIPMENTHEADER01](sql/1509228777.sql) | Compose a grouped metric query from caller-selected table, columns, date range and warehouse. | 1–120 |
| [dbo.STH_UpdateOrderStatus](sql/1515152443.sql) | Set order header and detail conditions after load-related shipments have no status1 below900. | 1–77 |
| [dbo.TRAV_EX02LANEDataProcess](sql/1522208573.sql) | Insert a lane/work-unit association if the pair is absent. | 1–13 |
| [dbo.dba_UpdateColumn](sql/1536724527.sql) | Add or alter a table column, adjust defaults/checks and propagate to related table variants. | 1–117 |
| [dbo.TRAV_EX02_ScheduledJob](sql/1538208630.sql) | Mark selected lane work units escalated and set their work-instruction priorities. | 1–49 |
| [dbo.TRAV_EX06UpdateMOPValues](sql/1570208744.sql) | Store supplied pallet number and weight text on a multi-order pallet. | 1–12 |
| [dbo.EX06ValidateMOPNum_Weights](sql/1586208801.sql) | Return a multi-order pallet number and decimal weight when an unfinished container exists. | 1–34 |
| [dbo.PM_WORKINSTRUCTION01](sql/1589229062.sql) | Compose a grouped metric query from caller-selected table, columns, date range and warehouse. | 1–142 |
| [dbo.TRAV_EXP_ReleaseWaveAfter](sql/1602208858.sql) | Forward a released-wave callback to the wave DIF enqueue routine. | 1–21 |
| [dbo.SHP_InsighInPoolDetailPaneData](sql/1617753166.sql) | Read shipment-pool pane fields from the shipment header view. | 1–28 |
| [dbo.InventoryInsightDetailPaneTransactionHistoryData](sql/1624705186.sql) | Read the ten most recent transactions for a location and optional item/company. | 1–31 |
| [dbo.WVST_FullContainers](sql/1626801203.sql) | Save a wave full-container row count. | 1–33 |
| [dbo.SHP_InsightDetailPaneData](sql/1633753223.sql) | Read shipment pane metadata, root-container count, dock display and common line fields. | 1–90 |
| [dbo.PMN_Cycle_Trace](sql/1637229233.sql) | Cycle PMN_Trace with a caller start-date string. | 1–14 |
| [dbo.WVST_ImmediateNeedsQuantity](sql/1642801260.sql) | Save a wave quantity at status997 across ten shipment-detail buckets. | 1–37 |
| [dbo.SHP_LineInsightDetailPaneData](sql/1649753280.sql) | Read shipment-line pane fields with optional item thumbnail. | 1–34 |
| [dbo.PMN_EVENT_SESSION](sql/1653229290.sql) | Stop or replace/start three database Extended Events sessions. | 1–106 |
| [dbo.SHP_LotInsightDetailPaneData](sql/1665753337.sql) | Read shipped-lot pane fields for one container. | 1–24 |
| [dbo.SHP_MonitorCustomerCategoryChartData](sql/1681753394.sql) | Return shipment drill-down counts and four summary tiles. | 1–63 |
| [dbo.WVST_LooseContainers](sql/1690801431.sql) | Save a count of loose-container candidates for a wave. | 1–45 |
| [dbo.SHP_MonitorCustomerShipToChartData](sql/1697753451.sql) | Return shipment drill-down counts and four summary tiles. | 1–69 |
| [dbo.WVST_Pallets](sql/1706801488.sql) | Save a count of distinct tree units with direct nested-container evidence. | 1–33 |
| [dbo.SHP_MonitorShipmentChartData](sql/1713753508.sql) | Return shipment drill-down counts and four summary tiles. | 1–47 |
| [dbo.SHP_MonitorShipmentIndicatorTile](sql/1729753565.sql) | Return one selected shipment/load indicator with caution and warning levels. | 1–62 |
| [dbo.WVST_ShipmentsConsolidated](sql/1738801602.sql) | Derive and save consolidated shipments from previously stored wave statistics. | 1–42 |
| [dbo.SHP_MOPInsightDetailPaneData](sql/1745753622.sql) | Read one multi-order pallet pane identity and display status. | 1–21 |
| [dbo.TRAV_EX01_UpdateContainerDetails](sql/1746209371.sql) | Replace dimensions and volume on all shipping containers with a supplied container ID. | 1–27 |
| [dbo.WVST_ShipmentsRejected](sql/1754801659.sql) | Derive and save rejected shipments from previously stored wave statistics. | 1–42 |
| [dbo.PMN_Trace](sql/1765229689.sql) | Control three SQL trace streams and report their status, with variant-specific dispatch. | 1–434 |
| [dbo.TRAV_EXEC_PROC](sql/1788793680.sql) | Create a fixed shipping-container metadata view through dynamic SQL. | 1–69 |
| [dbo.ITM_DoesUmReferenceExist](sql/1800705813.sql) | Check whether a unit of measure is referenced by discovered columns or comma-separated lists. | 1–108 |
| [dbo.POD_InsightDetailPaneData](sql/1813229860.sql) | Read purchase-order line identity with item master display fields. | 1–30 |
| [dbo.POH_InsightDetailPaneData](sql/1829229917.sql) | Read purchase-order header and separate receipt/line counts. | 1–42 |
| [dbo.TRAV_EX01_GetPackSizeWaveContainerData](sql/1833317841.sql) | Project carton contents and a pick-location sequence from a text wave identifier. | 1–59 |
| [dbo.POH_TpmInsightDetailPaneData](sql/1845229974.sql) | Read the TPM purchase-order header and receipt/line counts. | 1–40 |
| [dbo.TRAV_EX02_SCALEtoWCSDIFOutUpdate](sql/1849317898.sql) | Queue a pallet-request DIF outgoing message for a work unit. | 1–45 |
| [dbo.TRAV_EX01_MarkForPS](sql/1861177976.sql) | Set the fixed PS-selection flag on a wave. | 1–23 |
| [dbo.PROCHST_InsightDetailPaneData](sql/1861230031.sql) | Read four process-history pane result sets from a local temporary copy. | 1–57 |
| [dbo.PWL_InsightDetailPaneData](sql/1877230088.sql) | Read put-wall location status and linked shipment identities. | 1–23 |
| [dbo.TRAV_RESEED_DB](sql/1893178090.sql) | Reseed one fixed identity target to 86000. | 1–13 |
| [dbo.QLTYHST_InsightDetailPaneData](sql/1893230145.sql) | Read quality-history pane metadata through a temporary copy. | 1–32 |
| [dbo.RCB_SetStatus](sql/1909230202.sql) | Set receipt-container status, roll the minimum child status up ancestors and refresh receipt header. | 1–67 |
| [dbo.RCPT_ContainerInsightDetailPaneData](sql/1925230259.sql) | Read receipt-container pane identity and status description. | 1–35 |
| [dbo.SHPContainer_InsightListPaneData](sql/1937754306.sql) | Read shipping-container pane data with recursive work count and direct-child counts. | 1–93 |
| [dbo.RCPT_ContainerInsightListPaneData](sql/1941230316.sql) | Read the receipt-container internal identity for a list pane. | 1–21 |
| [dbo.EXP_WorkCreationAfterExitPoint](sql/1941581955.sql) | Assign outgoing pick/drop locations for selected launch work and invoke an optional EX08 hook. | 1–70 |
| [dbo.sp_generate_insert_script](sql/1953754363.sql) | Generate INSERT script text by dynamically reading rows from catalog-selected tables. | 1–223 |
| [dbo.RCPT_InsightDetailPaneData](sql/1957230373.sql) | Read receipt header pane statuses and totals from metadata view. | 1–31 |
| [dbo.SpGetBuildVersion](sql/1969754420.sql) | Read and shorten a stored build string for technical display. | 1–15 |
| [dbo.RCPT_InsightListPaneData](sql/1973230430.sql) | Read receipt internal and business identities for a list pane. | 1–18 |
| [dbo.RCPT_LineInsightDetailPaneData](sql/1989230487.sql) | Read receipt-line pane metadata and its distinct container count. | 1–39 |
| [dbo.ShipRec_FinishedToday_STZChart](sql/1995154153.sql) | Count completed and incomplete shipment-detail rows by planned date for a fixed customer category. | 1–40 |
| [dbo.RCPT_MonitorReceiptsDatesChartData](sql/2005230544.sql) | Count open receipts in overlapping warehouse-calendar date categories. | 1–104 |
| [dbo.ShipRec_FinishedToday_MCChart](sql/2011154210.sql) | Count completed and incomplete shipment-detail rows by planned date for a fixed customer category. | 1–39 |
| [dbo.RCPT_MonitorReceiptsIndicatorTiles](sql/2021230601.sql) | Return one selected receipt-aging, putaway-aging or quality-inspection indicator. | 1–60 |
| [dbo.ShipRec_FinishedToday_Grid2](sql/2027154267.sql) | Group planned-day ERP orders by trailing status and carrier type. | 1–67 |
| [dbo.RCPT_MonitorReceiptsPoChartData](sql/2037230658.sql) | Return a purchase-order drill result and totals for an open receipt vendor/type/date selection. | 1–150 |
| [dbo.ShipRec_FinishedToday_Grid1](sql/2043154324.sql) | Group completed-day ERP-order representatives into two carrier buckets by building. | 1–48 |
| [dbo.RCPT_MonitorReceiptsTypesChartData](sql/2053230715.sql) | Drill open receipt date selection into receipt types and summary totals. | 1–124 |
| [dbo.ShipRec_FinishedToday_AFChart](sql/2059154381.sql) | Count completed and incomplete shipment-detail rows by planned date for a fixed customer category. | 1–42 |
| [dbo.STH_UpdateHeader](sql/2065754762.sql) | Roll shipment detail/root-container status into the header and linked load. | 1–224 |
| [dbo.RCPT_MonitorReceiptsVendorNamesChartData](sql/2069230772.sql) | Drill an open receipt type/date selection into vendor names. | 1–136 |
| [dbo.LA_InsightDetailPaneData](sql/2072706782.sql) | Read labor activity pane labels and user identity. | 1–23 |
| [dbo.ShipRec_CurrentWorkTotals](sql/2075154438.sql) | Pivot current shipment-detail row counts into fixed customer groups and status bands. | 1–86 |
| [dbo.STH_UpdateLoad](sql/2081754819.sql) | Roll linked shipment status range into a shipping-load header. | 1–111 |
| [dbo.cycle_trace](sql/2117582582.sql) | Cycle the trace_ILS helper using stop/start selector values. | 1–6 |
| [dbo.AzureSQLMaintenance_1](sql/2122646805.sql) | Queue and execute index/statistics maintenance with optional persistent logging. | 1–269 |
| [dbo.TD_InsightDetailPaneData](sql/2145755047.sql) | Read tote-detail fields and an independently selected tote header identifier. | 1–24 |

## Evidence limits

- The owner attests that the replica is current. These explanations use its captured source; no version/build gate is imposed.
- No database connection, application rows, operational SQL, procedure execution, report/label rendering, printer, trace capture, maintenance or archive purge was performed.
- Full procedure-body interpretation is separate from table roles, active application wiring, effective configuration, external delivery and operational acceptance.
- Private literals were inspected only where necessary for dynamic or opaque behavior. Private server names, URLs, paths and raw literal payloads are not published.
- Retained source expressions and aliases remain literal-redacted. Exact source hashes and line coordinates bind each contract; no historical-looking name establishes active caller selection.

Author validation covers identities, hashes, complete line bounds, schema dimensions, source references, role taxonomy and case structure. It does not replace independent peer review or demonstrate runtime behavior.
