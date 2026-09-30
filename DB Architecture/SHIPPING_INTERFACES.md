# Shipping, printing and interface behavior

Snapshot `20260929T214106Z`. This batch contains 50 bounded module contracts, 34 related table-role records and 16 help topics. It is static source evidence, not an operational run or full-domain completion.

[Machine-readable batch](mappings/batches/shipping-interfaces.json) · [Help library](HELP_TOPICS.md) · [Process families](PROCESS_FAMILIES.md)

## Material distinctions

- Presentation routines named CloseManifest, Consolidate, Split, Manifesting or Reprint can return context without performing the named operation.
- The custom reprint body inserts Ready DIF messages. It neither renders nor acknowledges a successful print; retries can duplicate requests.
- Deallocation outputMode=1 still updates inventory. XACT_ABORT does not create a transaction. Source and destination identity predicates differ.
- Split routines reject nonpositive inputs but do not fully validate source existence or upper quantity bounds. Original/clone quantity direction differs between allocation and container splits.
- Shipment numbering resets only its selected immediate children. Wave numbering wraps each shipment helper call, not the whole wave, and uses NOLOCK selection.
- Interface claim scope follows process stamps and links; claims are not exclusive or delivery acknowledgments. Cleanup variants differ in conditions, covered tables and child selection.
- Carrier and QC context lookups do not establish routing eligibility or enforce the consuming action. Label parameter lookup does not use its warehouse argument.

## Reviewed module contracts

| Object | Purpose | Direct persistent effect |
| --- | --- | --- |
| [dbo.MetaTrans_CloseManifest](sql/437224958.sql) | Prepare manifest-close presentation options. | None in body; called-helper effects are separate |
| [dbo.MetaTrans_GetConsolidateShipment](sql/549225357.sql) | Retrieve a shipment summary for a consolidation flow. | None in body; called-helper effects are separate |
| [dbo.MetaTrans_GetPrintSelectedDocuments](sql/901226611.sql) | Select print context, user printers and eligible document types. | None in body; called-helper effects are separate |
| [dbo.GetShippingLabelImage](sql/968702849.sql) | Retrieve stored outbound and returns label images. | None in body; called-helper effects are separate |
| [dbo.wm_RCarrier02](sql/1038275104.sql) | Retrieve an active carrier/service record. | None in body; called-helper effects are separate |
| [dbo.INT_ErrorInsightDetailPaneData](sql/1112703362.sql) | Retrieve an interface-error detail pane. | None in body; called-helper effects are separate |
| [dbo.MetaTrans_ReprintWaveDocs](sql/1141227466.sql) | Prepare document reprint context for a wave. | None in body; called-helper effects are separate |
| [dbo.MetaTrans_ReprintWaveLabels](sql/1157227523.sql) | Prepare label reprint context for a wave. | None in body; called-helper effects are separate |
| [dbo.MetaTrans_ShipmentLevelManifesting](sql/1173227580.sql) | Prepare shipment-level manifesting context. | None in body; called-helper effects are separate |
| [dbo.MetaTrans_ShipmentSelection](sql/1189227637.sql) | Select shipment records sharing the selected shipment identifier and warehouse. | None in body; called-helper effects are separate |
| [dbo.MetaTrans_ShippingContainerQC](sql/1205227694.sql) | Prepare outbound QC preferences, security checkpoint values and lookup lists. | None in body; called-helper effects are separate |
| [dbo.MetaTrans_SplitShipment](sql/1253227865.sql) | Prepare header and line selections for a shipment-split screen. | None in body; called-helper effects are separate |
| [dbo.MetaTrans_WavePrinterSelection](sql/1317228093.sql) | Prepare printer selection only for an open wave. | None in body; called-helper effects are separate |
| [dbo.SHIPCONTfn_RtrvItemContentsCount](sql/183320063.sql) | Count item-bearing rows immediately associated with a shipping container. | None in body; called-helper effects are separate |
| [dbo.SHIPCONTfn_RtrvCurrentLocation](sql/1585753052.sql) | Derive one current location from a container subtree or its immediate contents. | None in body; called-helper effects are separate |
| [dbo.SHP_GetStatusFlowFromContainer](sql/1601753109.sql) | Find one non-NULL status flow in a container and its descendants. | None in body; called-helper effects are separate |
| [dbo.SHP_MoveContainersBelowStatusToShipment](sql/1761753679.sql) | Move selected below-threshold container rows to a different shipment. | SHIPPING_CONTAINER |
| [dbo.SHP_RemoveContainerGroup](sql/1793753793.sql) | Clear a work-linked container group and its instruction grouping. | SHIPPING_CONTAINER, WORK_INSTRUCTION |
| [dbo.SHP_SetXOfYForShipment](sql/1825753907.sql) | Assign X-of-Y numbering to top-level identified containers in one shipment. | SHIPPING_CONTAINER |
| [dbo.SHP_SetXOfYForWave](sql/1841753964.sql) | Run shipment X-of-Y numbering for each shipment selected from a wave. | None in body; called-helper effects are separate |
| [dbo.SHP_TransferDtlForShipDistr](sql/1889754135.sql) | Transfer one shipment detail and associated shipment comments. | SHIPMENT_DETAIL, COMMENT_TEXT |
| [dbo.SHP_UpdateFreightCharges](sql/1905754192.sql) | Replace header freight amounts with selected container sums. | SHIPMENT_HEADER |
| [dbo.SHP_UpdateGroupPosition](sql/1921754249.sql) | Assign group/spot and optionally rename a container and its direct children. | SHIPPING_CONTAINER |
| [dbo.wm_RInterfaceDataMapDetail01](sql/871322514.sql) | Retrieve INTERFACE_DATA_MAP_DETAIL configuration with the documented selectors. | None in body; called-helper effects are separate |
| [dbo.wm_RInterfaceDataMapDetail02](sql/887322571.sql) | Retrieve INTERFACE_DATA_MAP_DETAIL configuration with the documented selectors. | None in body; called-helper effects are separate |
| [dbo.wm_RInterfaceDetail01](sql/903322628.sql) | Retrieve INTERFACE_DETAIL configuration with the documented selectors. | None in body; called-helper effects are separate |
| [dbo.wm_RInterfaceDetail02](sql/919322685.sql) | Retrieve INTERFACE_DETAIL configuration with the documented selectors. | None in body; called-helper effects are separate |
| [dbo.wm_RInterfaceHeader01](sql/935322742.sql) | Retrieve INTERFACE_HEADER configuration with the documented selectors. | None in body; called-helper effects are separate |
| [dbo.wm_RInterfaceDataMapHeader01](sql/1182275617.sql) | Retrieve INTERFACE_DATA_MAP_HEADER configuration with the documented selectors. | None in body; called-helper effects are separate |
| [dbo.wm_RInterfaceDataMapHeader02](sql/1198275674.sql) | Retrieve INTERFACE_DATA_MAP_HEADER configuration with the documented selectors. | None in body; called-helper effects are separate |
| [dbo.wm_RInterfaceDataMapHeader03](sql/1214275731.sql) | Retrieve INTERFACE_DATA_MAP_HEADER configuration with the documented selectors. | None in body; called-helper effects are separate |
| [dbo.wm_RInterfaceFlowStep01](sql/1230275788.sql) | Retrieve INTERFACE_FLOW_STEP configuration with the documented selectors. | None in body; called-helper effects are separate |
| [dbo.wm_RInterfaceFlowStep02](sql/1246275845.sql) | Retrieve INTERFACE_FLOW_STEP configuration with the documented selectors. | None in body; called-helper effects are separate |
| [dbo.wm_DDownloadItem01](sql/231320234.sql) | Delete downloaded item staging rows by process stamp. | DOWNLOAD_ITEM |
| [dbo.wm_DDownloadOrderHeader01](sql/247320291.sql) | Remove only processed order-download staging rows for a process stamp. | DOWNLOAD_ORDER_CONTAINER, DOWNLOAD_ORDER_COMMENT, DOWNLOAD_ORDER_VAS_ACTIVITY, DOWNLOAD_ORDER_DETAIL, DOWNLOAD_ORDER_HEADER |
| [dbo.wm_DDownloadOrderHeader02](sql/263320348.sql) | Remove order-download staging rows regardless of interface condition. | DOWNLOAD_ORDER_CONTAINER, DOWNLOAD_ORDER_COMMENT, DOWNLOAD_ORDER_DETAIL, DOWNLOAD_ORDER_HEADER |
| [dbo.wm_DDownloadReceiptHeader01](sql/446272995.sql) | Delete receipt-related download staging sets by process stamp. | DOWNLOAD_SERIAL_NUMBER, DOWNLOAD_APPT_SCHEDULE, DOWNLOAD_RECEIPT_CONTAINER, DOWNLOAD_RECEIPT_DETAIL, DOWNLOAD_RECEIPT_HEADER, DOWNLOAD_PURCHASE_ORDER_HEADER, DOWNLOAD_PURCHASE_ORDER_DETAIL |
| [dbo.wm_DUploadOrderHeader01](sql/375320747.sql) | Delete upload order details linked to selected headers, then those headers. | UPLOAD_ORDER_HEADER, UPLOAD_ORDER_DETAIL |
| [dbo.wm_RUUploadOrderHeader01](sql/410796871.sql) | Claim or advance an upload header batch and its linked staging records. | UPLOAD_ORDER_HEADER, UPLOAD_ORDER_DETAIL, UPLOAD_ORDER_COMMENT, UPLOAD_ORDER_CONTAINER, UPLOAD_SERIAL_NUMBER, UPLOAD_LOCATION_INVENTORY_ATTRIBUTES |
| [dbo.wm_InsertUploadSerialNumber](sql/654273736.sql) | Create upload serial-number rows from selected inventory-attribute staging rows. | UPLOAD_SERIAL_NUMBER |
| [dbo.wm_RCarrierGroupHeader02](sql/487321146.sql) | Retrieve an active carrier-group header. | None in body; called-helper effects are separate |
| [dbo.TRAV_EX01_GetPrintLabelDetails](sql/1458208345.sql) | Prepare label-print parameters for a container ID. | None in body; called-helper effects are separate |
| [dbo.TRAV_EX01_ReprintPS](sql/1877178033.sql) | Queue one DIF incoming message per qualifying container for a reprint flow. | DIF_INCOMING_MESSAGE |
| [dbo.INTERFACE_ERROR_VIEW](sql/1008058677.sql) | Expose interface-error fields as a reporting view. | None in body; called-helper effects are separate |
| [dbo.UPLOAD_ORDER_CONTAINER_VIEW](sql/76579361.sql) | Combine selected current and retained UPLOAD_ORDER_CONTAINER columns for reading. | None in body; called-helper effects are separate |
| [dbo.UPLOAD_ORDER_DETAIL_VIEW](sql/92579418.sql) | Combine selected current and retained UPLOAD_ORDER_DETAIL columns for reading. | None in body; called-helper effects are separate |
| [dbo.UPLOAD_ORDER_HEADER_VIEW](sql/108579475.sql) | Combine selected current and retained UPLOAD_ORDER_HEADER columns for reading. | None in body; called-helper effects are separate |
| [dbo.SHP_ProcessShipmentDeallocationAndHistory](sql/1777753736.sql) | Deduct allocation or in-transit inventory and optionally write per-shipment history. | LOCATION_INVENTORY, TRANSACTION_HISTORY |
| [dbo.SHP_SplitAllocRequest](sql/1857754021.sql) | Split an allocation request into a retained requested quantity and cloned remainder. | SHIPMENT_ALLOC_REQUEST |
| [dbo.SHP_SplitShippingContainer](sql/1873754078.sql) | Split a shipping-container quantity, optionally creating a parent container. | SHIPPING_CONTAINER |

## Understanding print selection and wave reprint context

Print-selection procedures return entity context, eligible document definitions and user printer defaults. Wave reprint procedures also return context. Rendering, dispatch and successful physical output need separate evidence.

1. Read the selected user printer defaults and entity context for the print-process code.
2. Match eligible DOCUMENT_TYPE slots and default flags, then apply the captured feature-dependent exclusion.
3. Hand the selection to the configured application/renderer; confirm completion separately.

Checks: Compare process code, entity ID, user profile and document process/default pairs. Printer selection requires CLOSED N; the two reprint context getters do not. Manifest-close context returns flags only.

Boundary: An unsupported process can change result-set count. Feature/document selector labels remain opaque in the public copy. Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

## Finding stored labels and label-print parameters

The image getter returns ordinary and returns images for an internal container number and ignores its document-type parameter. The separate label-parameter helper looks up text container ID without using its warehouse argument.

1. Identify whether the request is for stored binary images or print parameters.
2. Image lookup selects returns flag Y and ordinary flag N; parameter lookup uses text container ID and fixed document/process selectors.
3. Inspect missing or ambiguous matches before attributing the result to a printer.

Checks: The Warehouse argument does not constrain the parameter helper. Repeated matching images/IDs use unordered variable assignment.

Boundary: Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

## Understanding queued reprint requests

It selects non-NULL container IDs in the specified wave at numeric status 300 and inserts Ready DIF messages. A message is a request; downstream DIF processing and printing are separate.

1. Select qualifying container IDs through a cursor.
2. Concatenate each ID into a fixed message envelope and insert a Ready DIF request.
3. Require downstream processing and printer evidence to establish completion.

Checks: No deduplication check is performed. Supplied username and error/success output parameters are unused. Routing constants and status meaning need separate deployment evidence.

Boundary: A rerun can enqueue duplicates. A partial failure can leave earlier messages. No escaping function wraps the interpolated ID. Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

## Understanding QC settings versus QC execution

The context routine combines user packing-preference flags, system configuration and security checkpoint values into three result sets. It does not inspect containers, assign QC, force a pass or enforce an action itself.

1. Resolve the existing user packing preference and its NULL fallback.
2. Read checkpoint values for menu 4005 and relevant action IDs.
3. Return scalar options and two lookup lists; leave action enforcement to the consuming application.

Checks: Missing user is different from existing user with a NULL preference. No ACTIVE packing-preference filter is applied. Warehouse is passed through rather than filtering configuration.

Boundary: Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

## Understanding active carrier and group lookup

The carrier getter requires an exact active carrier/service combination, with explicit NULL-service matching. The group getter requires an exact active group. Neither routine performs rating or applies the full routing policy.

1. Match the requested carrier/service or group identity.
2. Require the captured active Y flag.
3. Apply routing, calendars, inheritance and authorization through separately evidenced components.

Checks: NULL service matches NULL service only. Carrier and group names are exact selectors, not wildcard selection.

Boundary: Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

## Understanding shipment selection, consolidation, split and manifest context

The reviewed presentation procedures retrieve selected shipment data. ShipmentSelection can return multiple same-ID, same-warehouse shipments without a company predicate. Consolidate, Split and Manifesting context procedures do not perform those operations.

1. Resolve the supplied internal shipment number.
2. Retrieve operation-specific header and line/context data.
3. Separate retrieved context from later authorized mutation, carrier interaction and confirmation.

Checks: ShipmentSelection joins by SHIPMENT_ID and WAREHOUSE, not company. Split context exposes QUANTITY_AT_STS1 rather than summing all status slots.

Boundary: Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

## Understanding X-of-Y container numbering

Shipment numbering assigns ordinals to identified top-level tree roots and resets identified immediate children to zero. Wave numbering invokes that helper inside one transaction per shipment; the body does not provide one whole-wave transaction.

1. Capture qualifying shipment roots using NOLOCK and order by internal ID.
2. Assign root ordinal/total and reset identified immediate children.
3. For a wave, capture shipments and invoke the helper in separate BEGIN/COMMIT pairs.

Checks: Unidentified or deeper descendant rows are outside the explicit child-reset set. Ambient caller transactions alter persistence of nested COMMITs. Both helper membership reads and wave selection use NOLOCK.

Boundary: Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

## Understanding container counts, location and status flow

The helpers answer different questions: a row count over selected immediate contents, one distinct location under a branch-specific scope, and one unordered non-NULL status flow from a recursive subtree. None alone proves every descendant is consistent.

1. Distinguish row count from item quantities and distinct items.
2. Determine whether the location helper uses tree-unit rows or its direct-child fallback.
3. Treat a returned status flow as one candidate, not unanimous subtree agreement.

Checks: Location fallback applies ITEM IS NOT NULL only to its self-row arm. A NULL location group can contribute to the multiple-location result. Status-flow TOP 1 has no precedence or explicit recursion override.

Boundary: Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

## Understanding shipping group and transfer mutations

These helpers have narrow and different scopes: one moves below-threshold container IDs, one transfers a detail and comments, one updates group/spot and optional names, and one clears work-linked groups. Caller orchestration must coordinate broader shipment consistency.

1. Inspect the captured row selector and whether it is rechecked at mutation time.
2. Apply only the documented container, detail/comment or work-group changes.
3. Check broader line, allocation, header and hierarchy consistency in caller logic.

Checks: Container move captures status eligibility once. Group spot MAX+1 lacks a serialization protocol. Remove-group work joins do not repeat a warehouse restriction on every group member.

Boundary: Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

## Understanding split quantity boundaries and output IDs

Both split helpers reject NULL or nonpositive inputs, but neither completely enforces an upper quantity bound. The allocation helper leaves requested quantity on the original and remainder on the clone; the container helper leaves remainder on the original and requested quantity on the clone.

1. Validate source existence, positive quantity and upper bound in the caller before invoking mutation.
2. Observe each helper cloning and scaling its documented original/clone quantities.
3. Coordinate the work inside an appropriate caller transaction and handle returned IDs/errors without assuming outputs were cleared.

Checks: Missing source is not rejected by a row-count check. Zero source quantities can cause division by zero. Container parent output is assigned only in the optional parent branch.

Boundary: No routine was executed; these are source-observed boundaries, not an operational incident or a proposed production change. Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

## Understanding deallocation output mode and history

No. Both direction branches update inventory first. outputMode=1 returns captured before-state and allocation information and skips history; other modes write calculated history. The procedure sets XACT_ABORT and rethrows errors but begins no transaction.

1. Select requests through the OR of nonzero wave and shipment selectors.
2. Deduct source allocated quantity or destination in-transit quantity and capture before/after inventory.
3. Choose output rows without history for mode 1, or insert calculated per-shipment history for other modes.

Checks: Both zero selectors select nothing; two supplied nonzero selectors broaden selection by OR. Source matching includes logistics unit/attribute identity; destination matching does not. History expiry/status calculations do not update those fields in inventory.

Boundary: Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

## Understanding header freight rollups

The routine sums four stored charge fields from selected manifest-state containers with a text parent-container test, then replaces header values. SQL SUM can return NULL when no eligible amounts exist; the body does not turn that into zero.

1. Select shipment containers by captured manifest states and parent-text-ID rule.
2. Sum total/base freight, discount and accessorial amount.
3. Replace header amounts with the aggregate variables.

Checks: Parent selection uses PARENT_CONTAINER_ID text, not tree root metadata. Manifest state constants are source predicates; active state distribution was not queried.

Boundary: Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

## Understanding interface configuration retrieval

The getters retrieve map headers/details, interface headers/details and flow-step rows. Only the detail-by-header getter explicitly orders by SEQUENCE. Flow-step retrieval does not execute a step and does not specify step order.

1. Choose the correct key, record type, direction and mode for the requested getter.
2. Apply exact predicates or the prefix LIKE pattern.
3. Let a separately evidenced executor determine enabled steps, execution order and transport behavior.

Checks: Map prefix is not escaped as literal text. No ACTIVE predicate appears in the reviewed interface-detail getters. Map-header Mode uses numeric(9) in one variant and numeric(1) in another.

Boundary: Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

## Understanding upload claims and serial staging

The batch routine updates header and linked child staging conditions and process stamps. Its claim branch can restamp rows already In Process, and downstream child scope follows the batch stamp. The serial helper inserts selected payload rows without an explicit rerun deduplication check.

1. Claim matching-detail non-Processed headers or advance matching-detail In Process headers.
2. Update linked child records using batch-stamped parent/link selections.
3. Create selected serial payload rows; rely on separately evidenced transport/acknowledgment for delivery completion.

Checks: BatchId reuse can broaden child selection. NULL interface conditions fail equality/inequality filters. Claim result uses unordered TOP 1; later result returns all batch-stamped headers.

Boundary: Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

## Understanding interface cleanup differences

No. Order cleanup 01 restricts Processed rows and includes VAS activity; cleanup 02 ignores condition and omits VAS. Receipt cleanup deletes seven table sets by stamp with one appointment link-type filter. Upload cleanup deletes linked details and headers only.

1. Identify the exact routine and its stamp, condition and link predicates.
2. Follow the observed DELETE order and direct row-count behavior.
3. Coordinate caller transaction, constraints and any omitted dependent cleanup before operational use.

Checks: No reviewed cleanup checks transport acknowledgment. Receipt cleanup deletes purchase-order header before detail. Upload child selection follows header link IDs, not child stamp.

Boundary: Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

## Understanding interface error and retained-data views

The error view projects stored error fields; the detail pane selects one stored error. Three upload views combine current and retained tables with UNION distinct over selected columns. None performs delivery, retry, archive movement or freshness checks.

1. Use source identity and query predicates to distinguish error details from current/retained upload projections.
2. Account for UNION removing duplicate projected rows and the absence of source precedence.
3. Require independent current processing and delivery evidence.

Checks: Views have no built-in warehouse/company/process-stamp or age filter. Omitted processing columns may distinguish source rows that collapse in the projection.

Boundary: Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

## Evidence and completion limits

All 50 retained bodies were read completely. Each is bound to its redacted-file hash/line span and original-definition hash; private original structure equivalence and guarded control values were checked separately. No original SQL/comments/raw literal collection is copied into this batch. Table roles use explicit catalog columns plus a reviewed usage. Six AIM family sources support only their cited text passages.

The sole unresolved catalog call in this batch remains caller-dependent despite the same-name helper candidate. None of these 50 modules is in the existing dynamic-SQL candidate set; no dynamic-review progress is claimed. Forty-eight authored help cases require separate app evaluation.

Complete shipping/interface acceptance still needs installed caller/service bindings, current effective settings, physical/remote acknowledgments, error recovery and concurrency evidence. No full-family reconciliation is claimed.
