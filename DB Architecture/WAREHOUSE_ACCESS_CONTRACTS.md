# Warehouse access and interface routine behavior

This continuation adds 252 full procedure contracts, 252 procedure roles and 25 source-grounded topics. The owner attests that the replica is the current baseline. The explanations describe retained source as-is; no routine or database query was executed. The [batch](mappings/batches/warehouse-access-contracts.json) records complete parameters, exact retained SQL structure, projection order, source lines and hashes.

Procedure names do not establish whether a call reads or changes data. The topics below explain actual body differences. Existing table and trigger contracts remain separate; this batch takes no table-role credit.

## Does a warehouse lookup change records?

Check the exact routine. Some calls only read data, while interface claim routines also change processing markers. For example, the transaction-history RU routine is read-only, the shipment RU routine marks a batch, and the accessorial-header lookup returns every header despite accepting an accessorial-code input.

1. Identify the captured routine and its actual body; prefixes are not proof of behavior.
2. Distinguish returned rows, output parameters and explicit RETURN values.
3. For interface claims, inspect the writes before treating the returned rows as a simple lookup.

Sources: [dbo.wm_RAccessorialHeader01](sql/423320918.sql), [dbo.wm_RShipmentHeader03](sql/1543324908.sql), [dbo.wm_RUDownloadItem01](sql/202796130.sql), [dbo.wm_RUReceiptContainer05](sql/298796472.sql), [dbo.wm_RUShipmentHeader01](sql/362796700.sql), [dbo.wm_RUTransactionHistory01](sql/394796814.sql).

## Why can a customer or vendor lookup return several matches?

Several lookups include a company-specific record and a generic record whose company is blank in database terms (NULL). Most return all matches. Customer variant 04 alone limits the result to one, ranking specific ship-to and company combinations before generic combinations. Vendor and customer sort rules differ.

1. Check whether ship-to or ship-from must match exactly, may be NULL, or must be NULL on both sides.
2. Read the variant-specific ordering before interpreting the first row.
3. Treat tied preferred rows as unresolved unless another source establishes uniqueness.

Sources: [dbo.wm_RCustomer02](sql/663321773.sql), [dbo.wm_RCustomer03](sql/679321830.sql), [dbo.wm_RCustomer04](sql/1150275503.sql), [dbo.wm_RVendor02](sql/1799325820.sql), [dbo.wm_RVendor03](sql/1815325877.sql).

## How do item lookups handle company and cross-references?

Item lookups have different company rules. Some require exact company or both values NULL; others include generic items. Cross-reference joins can return the same item more than once. Item variant 03 does not prove that an item belongs to only one company; variant 11 separately counts all item rows.

1. Identify the exact item variant and company predicate.
2. Separate generic fallback from exact-or-both-NULL matching.
3. Check join multiplication and explicit uniqueness tests before assuming a single item.

Sources: [dbo.wm_RItem02](sql/967322856.sql), [dbo.wm_RItem03](sql/983322913.sql), [dbo.wm_RItem04](sql/999322970.sql), [dbo.wm_RItem05](sql/1015323027.sql), [dbo.wm_RItem06](sql/1031323084.sql), [dbo.wm_RItem07](sql/1047323141.sql), [dbo.wm_RItem08](sql/1294276016.sql), [dbo.wm_RItem11](sql/1342276187.sql), [dbo.wm_RItemCrossReference02](sql/1358276244.sql), [dbo.wm_RItemCrossReference03](sql/1063323198.sql).

## How are item units and their sequence selected?

Unit lookup 02 falls back by an entire set: exact item/company, then generic item, then item class. Other variants branch on whether an item was supplied. The sequence helper calculates a candidate number; the update helper shifts qualifying existing sequences. Neither helper creates the new unit row.

1. Distinguish set-level fallback from choosing a fallback separately for each unit.
2. Check whether a NULL item switches the lookup to item class.
3. Treat sequence calculation, shifting and insertion as separate steps with caller-owned coordination.

Sources: [dbo.wm_RItemUnitOfMeasure02](sql/1374276301.sql), [dbo.wm_RItemUnitOfMeasure03](sql/1111323369.sql), [dbo.wm_RItemUnitOfMeasure04](sql/1127323426.sql), [dbo.wm_RItemUnitOfMeasure07](sql/1198627313.sql), [dbo.wm_IItemUnitOfMeasure01](sql/590273508.sql), [dbo.wm_UItemUnitOfMeasure08](sql/1170103209.sql).

## Why do operational and upload comments differ?

Comment routines can read operational comments or an upload copy depending on interface link. Their line rules differ: one treats line zero as including an operational NULL line, another uses ordinary equality, and a positive internal number can control whether an extra filter applies. The delete routine uses exact key equality.

1. Identify operational versus upload branch from the interface-link input.
2. Compare line-zero and NULL handling in the chosen routine.
3. Do not assume a displayed comment will match the delete predicate.

Sources: [dbo.wm_RCommentText03](sql/1054275161.sql), [dbo.wm_RCommentText04](sql/1070275218.sql), [dbo.wm_RCommentText05](sql/1086275275.sql), [dbo.wm_RCommentText06](sql/1102275332.sql), [dbo.wm_DCommentText01](sql/430272938.sql).

## Which receipt and purchase-order records are selected?

Business IDs are not the only scope. Some receipt and purchase-order lookups require warehouse and an open header, while others do not. A positive purchase-order line narrows one receipt-detail lookup; zero, negative or NULL line input selects all lines for that order. Projected columns also differ between variants.

1. Use the routine with the needed warehouse and open/closed restrictions.
2. Check whether company/type/ERP-order values use ordinary equality or explicit NULL normalization.
3. Check the output projection before treating joined receipt/header rows as detail-only data.

Sources: [dbo.wm_RPurchaseOrderDetail02](sql/1582277042.sql), [dbo.wm_RPurchaseOrderDetail03](sql/1598277099.sql), [dbo.wm_RPurchaseOrderDetail04](sql/1614277156.sql), [dbo.wm_RPurchaseOrderHeader03](sql/1662277327.sql), [dbo.wm_RReceiptContainer02](sql/1303324053.sql), [dbo.wm_RReceiptContainer04](sql/1335324167.sql), [dbo.wm_RReceiptDetail02](sql/1678277384.sql), [dbo.wm_RReceiptDetail03](sql/1367324281.sql), [dbo.wm_RReceiptDetail05](sql/1694277441.sql), [dbo.wm_RReceiptDetail06](sql/1710277498.sql), [dbo.wm_RReceiptDetail07](sql/1726277555.sql), [dbo.wm_RReceiptHeader02](sql/1415324452.sql), [dbo.wm_RReceiptHeader03](sql/1431324509.sql), [dbo.wm_RReceiptHeader07](sql/1742277612.sql), [dbo.wm_RReceiptHeader08](sql/1758277669.sql).

## How are receipt upload candidates chosen?

The read-only candidate routines use container status, receipt closure and parent-container relationships. Variant 05 adds completed-detail checks. Variant 06 contains a comparison to NULL that does not act like an is-not-NULL test. A configuration branch can include closed unbatched receipts without qualifying containers; these reads do not claim a batch.

1. Identify the candidate variant and status threshold.
2. Distinguish completed-detail, header-status and closed-receipt alternatives.
3. Keep candidate selection separate from batch marking and completed delivery.

Sources: [dbo.wm_RReceiptHeader04](sql/558625033.sql), [dbo.wm_RReceiptHeader05](sql/542624976.sql), [dbo.wm_RReceiptHeader06](sql/526624919.sql).

## What changes when receipt upload batches are selected?

The three receipt RU routines mark qualifying containers and headers with a batch, then return matching headers. They differ in completion and status conditions. Company and warehouse flags also differ: variant 03 lets the warehouse line-upload flag qualify a detail even when a company exists. Clearing a batch is a separate two-table update.

1. Compare the exact RU variant; do not substitute conditions from similarly named read-only routines.
2. Apply the documented company/warehouse precedence for each marking step.
3. Account for four separate dynamic writes and a later read; there is no encompassing transaction in these bodies.

Sources: [dbo.wm_RUReceiptHeader01](sql/314796529.sql), [dbo.wm_RUReceiptHeader02](sql/330796586.sql), [dbo.wm_RUReceiptHeader03](sql/346796643.sql), [dbo.wm_UReceiptInterfaceBatch](sql/618797612.sql).

## Why can a receipt container tree include other batch roots?

The recursive receipt export has an anchor where every NULL-parent container qualifies. Its batch restriction applies to the zero-parent alternative and to recursive children. This can include roots outside the requested batch. Other container lookups read immediate children only, and shipping roots require NULL rather than the receipt rule of NULL or zero.

1. Separate a root-selection predicate from recursive child selection.
2. Apply AND-before-OR precedence to the captured anchor.
3. Treat tree output order as a text path order, not numeric container ordering or a cycle guarantee.

Sources: [dbo.wm_RReceiptContainer03](sql/1319324110.sql), [dbo.wm_RReceiptContainer04](sql/1335324167.sql), [dbo.wm_RShippingContainer04](sql/1639325250.sql), [dbo.wm_RShippingContainer05](sql/1655325307.sql), [dbo.wm_RUReceiptContainer05](sql/298796472.sql).

## How are serial numbers combined with archives and uploads?

Some serial lookups read only operational rows; others combine operational and archive rows with UNION ALL. The latter preserve duplicates. Template-aware branches usually include no-template serials and template sequence zero. Upload context can select source serial IDs through upload records rather than returning the upload record itself.

1. Check whether archives participate and whether the operation uses UNION ALL.
2. Check no-template and template-sequence-zero branches.
3. Keep upload-record identities distinct from original serial identities.

Sources: [dbo.wm_RSerialNumber02](sql/1790277783.sql), [dbo.wm_RSerialNumber06](sql/1854278011.sql), [dbo.wm_RSerialNumber07](sql/1870278068.sql), [dbo.wm_RSerialNumber08](sql/1886278125.sql), [dbo.wm_RSerialNumber09](sql/1902278182.sql), [dbo.wm_RSerialNumber10](sql/1918278239.sql), [dbo.wm_RSerialNumber11](sql/1934278296.sql).

## How are inventory attributes resolved across history and upload?

Attribute reads can use operational, archive or upload context. The history lookup combines selected operational/archive attribute columns before joining history links. The upload helper writes matching attribute rows and then deletes a caller-selected upload row even if no replacement matched; that is a mutation with separate statements.

1. Identify whether the source is operational, archive or upload data.
2. Distinguish an operational-first fallback from a union of sources.
3. Review the insert/delete helper as a multi-statement change with possible zero or multiple replacement rows.

Sources: [dbo.wm_InsertLocationInventoryAttributes](sql/638273679.sql), [dbo.wm_RLocationInventoryAttributes01](sql/1422276472.sql), [dbo.wm_RLocationInventoryAttributes03](sql/1454276586.sql), [dbo.wm_RLocationInventoryAttributes04](sql/1470276643.sql).

## Why does shipment lookup return an upload copy?

Shipment lookup context can be controlled by interface link or by a positive trailing-status input. Positive status switches several header routines to upload order headers; zero, negative or NULL switches them to operational shipment headers. Operational and upload detail filters are not always the same.

1. Identify whether context is selected by interface link or trailing status.
2. Check warehouse, company and excluded-closed-status restrictions for that exact variant.
3. Do not infer an operational status transition from a read of an upload copy.

Sources: [dbo.wm_RShipmentDetail01](sql/1479324680.sql), [dbo.wm_RShipmentDetail03](sql/1511324794.sql), [dbo.wm_RShipmentDetail04](sql/2062278752.sql), [dbo.wm_RShipmentHeader01](sql/10795446.sql), [dbo.wm_RShipmentHeader02](sql/26795503.sql), [dbo.wm_RShipmentHeader07](sql/42795560.sql), [dbo.wm_RShipmentHeader10](sql/1575325022.sql), [dbo.wm_RUploadOrderHeader01](sql/1767325706.sql), [dbo.wm_RUploadOrderHeader02](sql/1570104634.sql).

## Can shipment batch selection overwrite an existing marker?

The status-based batch selector first captures eligible unbatched shipment IDs, then marks them. The wave-based selector overwrites the batch on all headers for the wave without checking an existing batch. Both return all headers with the supplied batch, which can include earlier rows if the batch ID is reused.

1. Distinguish status/load eligibility from the wave-only update.
2. Keep selection time separate from update time for the status-based routine.
3. Treat resetting a marker as a separate update, not proof that external delivery completed.

Sources: [dbo.wm_RShipmentHeader05](sql/2082106458.sql), [dbo.wm_RUShipmentHeader01](sql/362796700.sql), [dbo.wm_RUShipmentHeader02](sql/378796757.sql), [dbo.wm_UShipmentHeader02](sql/698797897.sql).

## How are downloaded items claimed for processing?

Item claim routines change ready or NULL processing conditions to in process and attach a process stamp before returning records. Variant 02 limits its candidate IDs in order and also reports whether ready records remain. A later routine marks every row for a stamp processed. Reusing or omitting stamps can make selection misleading.

1. Provide distinct caller context when assessing a claim; the body does not validate stamp uniqueness.
2. Separate the candidate limit from the rows returned for an already-used stamp.
3. Interpret the remaining-record result as a global readiness check, not a processing-success result.

Sources: [dbo.wm_RUDownloadItem01](sql/202796130.sql), [dbo.wm_RUDownloadItem02](sql/218796187.sql), [dbo.wm_UDownloadItem01](sql/1911326219.sql).

## What is included in a downloaded order family?

Order claims can mark headers, details, containers, comments and VAS records, then return separate record sets. Linked children can make the returned family larger than the requested root limit. The processed, error and reset routines have different guards; one processed routine deliberately skips records still marked in process, and another omits VAS records.

1. Read the exact root and orphan selection rules rather than assuming every link points to a header.
2. Count the six data result sets separately from the remaining-record indicator.
3. Choose the documented status-update contract; similar routine suffixes are not interchangeable.

Sources: [dbo.wm_RUDownloadOrderHeader01](sql/234796244.sql), [dbo.wm_RUDownloadOrderHeader02](sql/250796301.sql), [dbo.wm_UDownloadOrderHeader01](sql/1927326276.sql), [dbo.wm_UDownloadOrderHeader02](sql/1943326333.sql), [dbo.wm_UDownloadOrderHeader03](sql/458797042.sql), [dbo.wm_UDownloadOrderHeader04](sql/474797099.sql).

## What can the receipt download remaining flag miss?

Receipt download claims include purchase-order and receipt records, containers, serials and appointments. The limited variant returns seven data sets, but its remaining-record flag checks only five receipt-side tables. Ready purchase-order rows can therefore remain without making that final flag positive.

1. Distinguish the seven returned record families from the five tables used for remaining-work detection.
2. Review appointment link-type filters at the stage where they actually appear.
3. Keep these database marker changes separate from receiving inventory or confirming external delivery.

Sources: [dbo.wm_RUDownloadReceiptHeader01](sql/266796358.sql), [dbo.wm_RUDownloadReceiptHeader02](sql/282796415.sql), [dbo.wm_UDownloadReceiptHeader01](sql/490797156.sql).

## Why can inventory export include zero balances?

Inventory variant 01 returns eligible nonzero location balances. Variant 02 adds zero-balance rows for item/company and warehouse combinations with no eligible nonzero inventory. That added branch is not filtered by the optional criteria applied to existing inventory. Neither base query automatically restricts rows to the warehouse used for date calculation.

1. Compare the nonzero-balance branch with the synthetic zero-balance branch.
2. Check location-class exclusion and the four quantity tests.
3. Apply filter scope separately: the date warehouse is not an automatic row warehouse filter.

Sources: [dbo.wm_RInventory01](sql/1262275902.sql), [dbo.wm_RInventory02](sql/1278275959.sql).

## Do item and lot inserts validate business rules?

These insert routines store the supplied item, unit, lot, attribute or serial values. Their bodies do not perform the broader template, conversion, expiration or uniqueness checks that a caller may need. Several return a new identity, but the item cross-reference and unit inserts have unused identity-named inputs and return no generated identity.

1. Read parameter types and declaration defaults separately from table constraints.
2. Check whether a generated identity is actually assigned to an OUTPUT parameter.
3. Keep database insertion separate from application-level business validation.

Sources: [dbo.wm_IItem01](sql/558273394.sql), [dbo.wm_IItemCrossReference01](sql/574273451.sql), [dbo.wm_IItemUnitOfMeasure01](sql/590273508.sql), [dbo.wm_ILot01](sql/606273565.sql), [dbo.wm_ILotAttribute01](sql/622273622.sql), [dbo.wm_ISerialNumber01](sql/798274249.sql).

## Do update routines preserve fields when NULL is supplied?

Most listed fields are replaced directly, including NULLs; these are broad updates, not partial patches. Exceptions are explicit: order-header NULL order date reuses its old value, shipment detail NULL export fields fall back to a header, and shipment-header load zero becomes NULL. Insert and update parameter sets also differ.

1. Identify exactly which columns the chosen update assigns.
2. Apply only its explicit fallback rules; do not generalize one exception to other fields.
3. Check omitted update columns and the lack of an old-version predicate before assuming an unchanged record.

Sources: [dbo.wm_UOrderDetail01](sql/506797213.sql), [dbo.wm_UOrderHeader01](sql/522797270.sql), [dbo.wm_UReceiptContainer01](sql/570797441.sql), [dbo.wm_UReceiptDetail01](sql/586797498.sql), [dbo.wm_UReceiptHeader01](sql/602797555.sql), [dbo.wm_UShipmentDetail01](sql/650797726.sql), [dbo.wm_UShipmentHeader01](sql/682797840.sql), [dbo.wm_UShippingContainer01](sql/730798011.sql).

## Where do shipment-detail export fields come from?

Shipment-detail insert and update preserve non-NULL caller export fields. For NULL classification, validated license or expiration, they read the corresponding header fields by business shipment ID. The lookup does not restrict warehouse or company and has no ordering when several headers share that ID.

1. Check whether each export input is NULL independently.
2. Read the header lookup key; internal shipment input does not narrow that lookup.
3. Do not treat copied values as export-license validation or regulatory approval.

Sources: [dbo.wm_IShipmentDetail01](sql/846274420.sql), [dbo.wm_UShipmentDetail01](sql/650797726.sql).

## How is a new shipping container tree identifier set?

The insert stores a QC status of zero and uses the supplied location when original pick location is NULL. If tree unit is NULL, it updates the new container to use its own identity. The captured insert trigger also initializes parentless NULL or negative tree units. The later broad update assigns tree unit directly and does not repeat the insert fallback.

1. Separate insert-supplied values from the captured trigger effect.
2. Check the procedure fallback for NULL tree unit even on a child container.
3. Do not assume the update recalculates original pick location or QC status.

Sources: [dbo.wm_IShippingContainer01](sql/910274648.sql), [dbo.wm_UShippingContainer01](sql/730798011.sql).

## What does a delete affected-row count include?

Most delete routines remove rows from one table and return that statement count. Purchase-order-header delete first removes its details and then the header, returning the sum. The body does not wrap those two deletions in a transaction. Counts do not establish that all related records were cleaned up or that a whole business operation succeeded.

1. Read the explicit target tables and their deletion order.
2. Distinguish the statement count from a sum across statements.
3. Account for constraints, trigger effects and caller transaction boundaries separately.

Sources: [dbo.wm_DOrderDetail01](sql/279320405.sql), [dbo.wm_DPurchaseOrderHeader01](sql/478273109.sql), [dbo.wm_DShipmentDetail01](sql/311320519.sql), [dbo.wm_DShipmentHeader01](sql/327320576.sql), [dbo.wm_DShippingContainer01](sql/343320633.sql), [dbo.wm_DShippingLoad01](sql/359320690.sql), [dbo.wm_DWarehouseAlert01](sql/391320804.sql).

## Do appointment and alert routines complete an operational action?

Appointment routines store schedule values; the update can change every appointment for one internal receipt. Alert routines store definitions or request records, and process-history insert records a supplied message. These bodies do not send email, execute the named action or prove that work was completed.

1. Separate a stored definition/request/history entry from execution.
2. For appointment updates, check the internal-receipt predicate rather than assuming one appointment ID.
3. Treat caller-supplied processed/closed fields as stored values until operational evidence establishes their meaning.

Sources: [dbo.wm_IAppointmentSchedule01](sql/526273280.sql), [dbo.wm_IProcessHistory01](sql/702273907.sql), [dbo.wm_IWarehouseAlert01](sql/942274762.sql), [dbo.wm_IWarehouseAlertRequest01](sql/958274819.sql), [dbo.wm_UAppointmentSchedule01](sql/442796985.sql), [dbo.wm_UWarehouseAlert01](sql/778798182.sql).

## When do packing and display defaults apply?

The outbound-QC lookup uses a user packing preference whenever that reference is non-NULL; a missing referenced preference does not fall back. Resource lookup gives matching custom keys precedence over base keys. Storage-template defaults apply to explicit NULL values, while missing configuration rows may simply produce no result.

1. Distinguish a NULL setting from a reference to a missing record.
2. Check custom-key precedence independently of whether the custom text is populated.
3. Treat these as selection rules; no current effective user setting was queried.

Sources: [dbo.wm_OutboundQCScanMode](sql/974274876.sql), [dbo.wm_RResource01](sql/1447324566.sql), [dbo.wm_RStorageTemplateDetail03](sql/1687325421.sql), [dbo.wm_RStorageTemplateHeader02](sql/1719325535.sql).

## How is catch weight added to transaction history?

The batch history read adds catch weight and unit from history attributes. Invalid numeric weight text becomes NULL, and multiple weights/units are reduced using separate maxima. This can select a weight and a unit from different attribute rows. The general candidate reader uses configured transaction types and additional adjustment-type gates.

1. Separate candidate selection from reading an already-marked batch.
2. Inspect numeric conversion and independent aggregation of weight and unit.
3. Do not infer history mutation or completed external delivery from the returned rows.

Sources: [dbo.wm_RTransactionHistory01](sql/1730105204.sql), [dbo.wm_RUTransactionHistory01](sql/394796814.sql).

## Source-bound routine details

These details are technical evidence for the thematic explanations. Source copies are inert and have redacted literals. Private literal review contributed bounded meanings, not executable definitions.

### dbo.wm_DCommentText01

Delete comments matching internal number, internal line, comment type and record type. Ordinary equality means a NULL line parameter does not delete a stored NULL line. No affected-row output parameter is declared.

Effects: reads COMMENT_TEXT; writes COMMENT_TEXT.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/430272938.sql), lines 1–23; original definition SHA-256 `2422b0f0a3b28218b21643454668bbdd374929f98dab7339d42d06490f770d1e`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_DOrderDetail01

Delete ORDER_DETAIL by INTERNAL_ORDER_DTL_NUM and assign the immediate @@ROWCOUNT to the OUTPUT parameter. No header or other child table is explicitly deleted.

Effects: reads ORDER_DETAIL; writes ORDER_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/279320405.sql), lines 1–15; original definition SHA-256 `43d595a82c300147fa511daefdd7d3c3b23c55fb6354bf5cc420d91a2def3b77`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_DPurchaseOrderDetail01

Delete PURCHASE_ORDER_DETAIL by OBJECT_ID and return the statement row count through OUTPUT.

Effects: reads PURCHASE_ORDER_DETAIL; writes PURCHASE_ORDER_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/462273052.sql), lines 1–18; original definition SHA-256 `6ca87b6f3086ec6e627057c12cc18a0b34bab8962d6ef8c09ed998eb1ea169b3`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_DPurchaseOrderHeader01

Delete purchase-order details by PURCHASE_ORDER_OBJECT_ID first, then the header by OBJECT_ID. OUTPUT sums both row counts. No explicit transaction encloses the pair, so a second-statement failure is not compensated by this body.

Effects: reads PURCHASE_ORDER_DETAIL; reads PURCHASE_ORDER_HEADER; writes PURCHASE_ORDER_DETAIL; writes PURCHASE_ORDER_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/478273109.sql), lines 1–23; original definition SHA-256 `2b4f2dd8a57a368a65953a1b76c6aa014d469a71c3fda23be7e408d27e663064`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_DShipmentAccessorials01

Delete shipment accessorials matching internal number, shipment level, code and subcode; return immediate affected-row count. NULL key components do not match through equality.

Effects: reads SHIPMENT_ACCESSORIALS; writes SHIPMENT_ACCESSORIALS.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/295320462.sql), lines 1–21; original definition SHA-256 `af2935f9f3e2f527442a9d5c0f081a73cc7c83b92cf9fd615115a8e57b13f8d1`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_DShipmentDetail01

Delete shipment detail by internal shipment line and return affected-row count; the body does not explicitly clean up its related records.

Effects: reads SHIPMENT_DETAIL; writes SHIPMENT_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/311320519.sql), lines 1–15; original definition SHA-256 `6787200e34e9e7d14a35ac92f59e8fc36f448673c294b1af427d57b43b10826b`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_DShipmentDetailVasActivity01

Delete shipment-line VAS rows by activity ID and internal line. No OUTPUT identity/count or explicit activity completion exists.

Effects: reads SHIPMENT_DETAIL_VAS_ACTIVITY; writes SHIPMENT_DETAIL_VAS_ACTIVITY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/494273166.sql), lines 1–15; original definition SHA-256 `d9904b66ec6b23d849d1a66657c6f2ed38f6190451884014f8e8e69845242fde`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_DShipmentHeader01

Delete shipment header by internal shipment number and return affected-row count. There is no explicit detail deletion in this body.

Effects: reads SHIPMENT_HEADER; writes SHIPMENT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/327320576.sql), lines 1–15; original definition SHA-256 `c8dd6d4cfcc665a022caed71d9d5a694a82320de85d0b050ccf8518e524043f3`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_DShipmentHeaderVasActivity01

Delete shipment-header VAS rows by activity ID and internal shipment. No OUTPUT count is declared.

Effects: reads SHIPMENT_HEADER_VAS_ACTIVITY; writes SHIPMENT_HEADER_VAS_ACTIVITY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/510273223.sql), lines 1–15; original definition SHA-256 `d4b1f070df5841888593879789e25f32543b158b9a162050613c3ebc231a4eea`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_DShippingContainer01

Delete shipping container by internal container number and return affected-row count; no recursive child deletion is implemented.

Effects: reads SHIPPING_CONTAINER; writes SHIPPING_CONTAINER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/343320633.sql), lines 1–15; original definition SHA-256 `f7f113156f0283392118d0fe43b43e293c452877a73b1905bc63c7cbc355c05d`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_DShippingLoad01

Delete shipping load by internal load number and return affected-row count; there is no shipment-disassociation logic.

Effects: reads SHIPPING_LOAD; writes SHIPPING_LOAD.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/359320690.sql), lines 1–15; original definition SHA-256 `3f3d3b490b0d7806eb2834b90aac20bb4a433ecd5f588e448dc497451a0fded0`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_DWarehouseAlert01

Delete warehouse alert definition by internal alert number and return affected-row count; alert requests are not explicitly deleted.

Effects: reads WAREHOUSE_ALERT; writes WAREHOUSE_ALERT.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/391320804.sql), lines 1–15; original definition SHA-256 `69b2c6761cac26797c0b90ac6359280e678b55554b02ede9e075d166ce08f4ff`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IAppointmentSchedule01

Insert appointment schedule with caller receipt, dock, start/end, user fields and stamps, then assign SCOPE_IDENTITY to ObjectId OUTPUT. No overlap check, date-order check or dock lookup is implemented.

Effects: writes APPOINTMENT_SCHEDULE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/526273280.sql), lines 1–62; original definition SHA-256 `824a5025746ae11888cb3fba1edfae0ee55505ecaa885b1fcb58798a9fc69292`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_ICommentText01

Insert comment type/text, record/internal/line references and caller stamps, then return the generated comment identity. No lookup validates record type or comment ownership.

Effects: writes COMMENT_TEXT.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/542273337.sql), lines 1–60; original definition SHA-256 `b5b9f88cb681e8aec67dd3e289aee88e8e56d307eadd85eb7bd1449038570b97`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IItem01

Insert one ITEM with the listed master attributes, rules, tracking/QC flags, categories, serial settings and export fields supplied by caller; return SCOPE_IDENTITY. It neither derives these settings from ITEM_TEMPLATE nor creates unit, lot or inventory rows.

Effects: writes ITEM.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/558273394.sql), lines 1–260; original definition SHA-256 `9b09fad688ef0f2cbace0d3f535e2e193d106ca6a5f0c764939b02de34062004`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IItemCrossReference01

Insert item cross-reference, unit/company/GTIN/application metadata and stamps. InternalItemCrossNum is declared as an input but never used; no generated identity is returned.

Effects: writes ITEM_CROSS_REFERENCE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/574273451.sql), lines 1–70; original definition SHA-256 `859785406fb7282d9d8577512022643d92b7ffa555238c43c5d029ec90135ed1`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IItemUnitOfMeasure01

Insert item-unit conversion, sequence, dimensions, weight, movement and slotting metadata. InternalItemUm is an unused input and no identity is returned. The procedure does not calculate conversion quantity or shift other sequences.

Effects: writes ITEM_UNIT_OF_MEASURE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/590273508.sql), lines 1–110; original definition SHA-256 `f2df23871927c54ea6dd6af7644018bd7a0a2ff0a09b504107bdd4ef8d922c97`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_ILot01

Insert lot/template/item/company/warehouse, expiration and frozen flag plus stamps, returning ObjectId. No expiration, freeze policy or duplicate-lot lookup is implemented.

Effects: writes LOT.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/606273565.sql), lines 1–70; original definition SHA-256 `e8cb4dce568aa06ab75dda7dcaddd1bf6d5e210829eb8fc767f6d42e2ffb1242`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_ILotAttribute01

Insert lot attribute with lot ID, template ID, value and caller metadata; return ObjectId. The body does not validate the text value against its attribute template.

Effects: writes LOT_ATTRIBUTE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/622273622.sql), lines 1–58; original definition SHA-256 `ccf762ab33c59a20163d5becc02a4b2e910f814505156cb86023398236ccec85`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_InsertLocationInventoryAttributes

Insert upload inventory-attribute rows by matching all twenty normalized attribute values against existing upload rows, plus operational item/company/warehouse/status/lot and upload record/process filters. Copy operational object/user fields and existing upload link/container/attribute fields, stamping UTC rounded to seconds. Then unconditionally delete the upload row at LOC_OBJECT_ID, even if the insert found no match. Many matching joins can insert many rows; no transaction protects insert/delete. The eighteenth SELECT alias typo does not change positional INSERT mapping.

All forty-four ISNULL replacement literals are the same one-character sentinel: each pair treats two NULLs as equal and also equates a NULL to the actual sentinel value. Empty strings remain distinct from NULL. No raw literal is reproduced here.

Effects: reads LOCATION_INVENTORY; reads LOCATION_INVENTORY_ATTRIBUTES; reads UPLOAD_LOCATION_INVENTORY_ATTRIBUTES; writes UPLOAD_LOCATION_INVENTORY_ATTRIBUTES.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/638273679.sql), lines 1–135; original definition SHA-256 `b31581673601826fecd5b28559a8bfeea8d3bc6f61139f88205ba1cb70008f67`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IOrderDetail01

Insert order detail with caller quantities, allocation flags, customer/ship-to/mark-for data, item attributes and stamps; return generated detail identity. Quantities and totals are stored directly rather than reconciled, and no allocation or shipment creation occurs.

Effects: writes ORDER_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/670273793.sql), lines 1–387; original definition SHA-256 `ebffec444c86775cd676109f56074731269df68014a77416b304d54dac967f97`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IOrderHeader01

Insert order header with caller shipping totals, customer/address/carrier/routing fields, condition and creation stamps; return internal order identity. It neither derives totals from details nor validates business transitions.

Effects: writes ORDER_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/686273850.sql), lines 1–348; original definition SHA-256 `77d6b14d5d6b43a9881a5e58020b7931aaecede4e91f4e651bff6294c6cca4f0`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IProcessHistory01

Insert a PROCESS_HISTORY entry with caller warehouse/process/action, activity time, identifiers and message; return InternalId. The body records a message without running the named process or action.

Effects: writes PROCESS_HISTORY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/702273907.sql), lines 1–72; original definition SHA-256 `98bfe309e8e2a46ec49da6b1ce0c925c59858b90e03899fd263595c874b8ac92`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IPurchaseOrderDetail01

Insert purchase-order detail including open/total quantities, header object/business IDs and item attributes; return ObjectId. The body does not recalculate quantities or create a header.

Effects: writes PURCHASE_ORDER_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/718273964.sql), lines 1–152; original definition SHA-256 `be557d9e37b60afb9cbc6542c1e08cb6ba69f68b7960416fde9cde077e547f4c`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IPurchaseOrderHeader01

Insert purchase-order header including closed/created timestamps, warehouse/company, source/ship-from data and caller status; return ObjectId. Open-versus-closed state is supplied, not independently derived.

Effects: writes PURCHASE_ORDER_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/734274021.sql), lines 1–152; original definition SHA-256 `42918610ef0a23f780e92578d794da70aa595ccbf840a23824a09a2e4c672847`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IReceiptContainer01

Insert receipt container including caller quantity/status, parent, locations, inventory/QC and upload fields, with CREATED_BY fixed to numeric 1. Return internal receipt-container identity. No movement, locating or status-flow operation executes.

Effects: writes RECEIPT_CONTAINER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/750274078.sql), lines 1–188; original definition SHA-256 `67bbde03ff255ac38127dd687d35e27f0e742bef3592d796e3c6818594150dc8`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IReceiptDetail01

Insert receipt detail with caller total/open/original quantities, unit conversions, item attributes, putaway references and purchase-order linkage; return internal receipt-line identity. The body stores supplied values without conversion or receipt balancing.

Effects: writes RECEIPT_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/766274135.sql), lines 1–258; original definition SHA-256 `57650f09c8bced882dca3cb8302bc1389b0942bddd07a22a85e661fd94421c00`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IReceiptHeader01

Insert receipt header with caller totals, leading/trailing status, lifecycle dates, carrier/source/ship-from metadata and stamps; return internal receipt identity. No detail/container creation or totals calculation occurs.

Effects: writes RECEIPT_HEADER.

The enabled captured AFTER INSERT receipt trigger can link a matching yard record and overwrite receipt stamps; caller stamps are not necessarily the final values.

Source: [complete retained body](sql/782274192.sql), lines 1–246; original definition SHA-256 `9536f5cdf50f788bf2e65a943984d69aee3efcec60290ab360ee1351452646f5`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_ISerialNumber01

Insert serial-number grouping, template/container/inventory references and caller metadata; return ObjectId. Several reference inputs are nvarchar(32), so target conversion/constraints determine admissibility; no explicit serial uniqueness or template validation occurs.

Effects: writes SERIAL_NUMBER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/798274249.sql), lines 1–71; original definition SHA-256 `fd473c4f8371dd32860061dc30868d21aa87c67297dcc8b7df04607e60777707`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IShipmentAccessorials01

Insert shipment accessorial key, detail reference, value, three freight-charge amounts and stamps. No identity OUTPUT or charge calculation is present.

Effects: writes SHIPMENT_ACCESSORIALS.

Captured AFTER INSERT/UPDATE accessorial trigger may normalize negative INTERNAL_NUM using its association logic; the direct assignment is not necessarily the final stored value.

Source: [complete retained body](sql/814274306.sql), lines 1–69; original definition SHA-256 `63c7a841e4bcff31d2a4a278e14114815acd0acc90528c4a6b4eff546ba6328f`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IShipmentAllocRequest01

Insert a shipment-allocation request with caller allocation/request quantities, from/to routing, container/item data and work-created flag; return identity. LogisticsUnit and ParentLogisticsUnit alone have NULL declaration defaults. Storing an allocation request does not allocate inventory or create work in this body.

Effects: writes SHIPMENT_ALLOC_REQUEST.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/830274363.sql), lines 1–309; original definition SHA-256 `92b6b93d383c13861dc2150c2c366d5f25f1a99e8a6a81d05e4e606fe042b6f1`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IShipmentDetail01

Before inserting shipment detail, read export classification, validated license and expiration from SHIPMENT_HEADER by business shipment ID only. Replace each NULL caller value with that lookup value, then insert listed fields including ten status/quantity buckets and return identity. Multiple same-ID headers have no defined lookup order, warehouse or company restriction; non-NULL caller export values take precedence.

Effects: reads SHIPMENT_HEADER; writes SHIPMENT_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/846274420.sql), lines 1–483; original definition SHA-256 `083878955ff2cb74f4752fe658075528cd12dc92809b0bfcc420bb1e8817bbf3`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IShipmentDetailVasActivity01

Insert shipment-line VAS activity reference and instructions with caller user/stamp data; return ObjectId. This creates an association, not evidence that the activity was performed.

Effects: writes SHIPMENT_DETAIL_VAS_ACTIVITY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/862274477.sql), lines 1–56; original definition SHA-256 `64afa194fdb0b8e08ec82fcb42224657b3671ec0d0996c59ccf2f66df9a87454`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IShipmentHeader01

Insert shipment header with caller status, freight/address/routing/export fields, extended user fields 9 through 20 and entered weight/volume/value; return identity. No carrier call, shipment release or detail creation is implemented.

Effects: writes SHIPMENT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/878274534.sql), lines 1–507; original definition SHA-256 `f180fd95f208b020552f201e391022611def5f648d70cc2911cf6d8fbe04ea19`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IShipmentHeaderVasActivity01

Insert shipment-header VAS activity reference/instructions and caller metadata, returning ObjectId; no activity execution occurs.

Effects: writes SHIPMENT_HEADER_VAS_ACTIVITY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/894274591.sql), lines 1–56; original definition SHA-256 `9e80f938b0d39cea255b3fd3716c0953780c91f686fbfdfb4bf8853bbf3ad4d2`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IShippingContainer01

Insert shipping container with caller shipment/parent/quantity/manifest metadata, QC_STATUS fixed to zero and ORIGINAL_PICK_LOC falling back to Location when NULL. OriginalPickLoc is the sole NULL-default input. If TreeUnit is NULL, update the newly inserted row to use its own identity as TREE_UNIT and set the OUTPUT identity in that update; otherwise assign SCOPE_IDENTITY directly. Insert plus follow-up update are not explicitly transactional.

Effects: writes SHIPPING_CONTAINER.

The captured INSERT trigger initializes NULL/negative TREE_UNIT on parentless containers. This procedure additionally assigns its new identity whenever caller TreeUnit is NULL, including nonroot containers. SCOPE_IDENTITY stays within procedure scope.

Source: [complete retained body](sql/910274648.sql), lines 1–235; original definition SHA-256 `21161401feb735fb1943dda5041a497a46a1f9bd59bb604d4d46d62ff3a934fe`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IShippingLoad01

Insert shipping load with caller leading/trailing status, dates, carrier, closure/confirmation flags and dock; return internal load identity. The body does not verify a load's operational readiness.

Effects: writes SHIPPING_LOAD.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/926274705.sql), lines 1–109; original definition SHA-256 `9a80681a34c96f8e2b2097238e1e4e81fe904d237c1b648a4f8b7b8ab43f4787`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IWarehouseAlert01

Insert warehouse-alert definition with action, message/template, active/system flags, title/description and stamps; return alert identity. No email or notification is sent.

Effects: writes WAREHOUSE_ALERT.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/942274762.sql), lines 1–74; original definition SHA-256 `884a2224fc447125ede5d0b069fa92bd3a1881f5624dfe183c8345947b6a33e6`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_IWarehouseAlertRequest01

Insert warehouse-alert request with caller source/warehouse, processed/reviewed/closed metadata, message and identifier; return request identity. Processed state is supplied and does not prove notification delivery.

Effects: writes WAREHOUSE_ALERT_REQUEST.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/958274819.sql), lines 1–92; original definition SHA-256 `c1f15668f4caec2605ceabafbf85cebc3606ccb72947c2d1983e9bfab3286697`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_OutboundQCScanMode

Read outbound-QC setting from the packing preference named on USER_PROFILE when a non-NULL preference exists; otherwise read the fixed default preference. A non-NULL but missing preference row yields no result and does not trigger fallback. Only WM_QC_SETTING is projected; no setting is changed.

The fallback literal names the default packing preference. A user-selected preference has precedence even when its referenced preference row is absent.

Effects: reads PACKING_PREFERENCES; reads USER_PROFILE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/974274876.sql), lines 1–16; original definition SHA-256 `6ced4c95fc0775c8c1ebaa726049157b01e41609bbeb635ee8f3f6d7fe125806`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RAccessorialDetail02

Read accessorial detail for the complete rating ID, rating service and accessorial-code equality tuple. All detail columns are returned; no ordering or active test is present.

Effects: reads ACCESSORIAL_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/407320861.sql), lines 1–20; original definition SHA-256 `38c088d2448bb1e65dfc8734ebd1de7795a04772d56eb7aa6651b4a1d5c7a0a9`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RAccessorialHeader01

Read every accessorial header. The declared accessorial-code input is unused: it does not restrict the result. All columns and all qualifying database-visible rows are returned without ordering.

Effects: reads ACCESSORIAL_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/423320918.sql), lines 1–7; original definition SHA-256 `ad427eda18d38991216a72198845f76a8f6ef68e12e71822b8a2aea039c58bec`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RAccessorialHeader02

Read accessorial headers matching rating ID and rating service. The body has no accessorial-code or active restriction and returns all columns without ordering.

Effects: reads ACCESSORIAL_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/439320975.sql), lines 1–16; original definition SHA-256 `49228759a594c4a033db021e690ee9c67e606e08a76cf5da7ce52362ce1f465c`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RAllocationRuleHeader01

Read all allocation-rule header columns by allocation name; no active restriction appears.

Effects: reads ALLOCATION_RULE_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/455321032.sql), lines 1–12; original definition SHA-256 `2ca46d54cebe15829126aaa0ccaa2be595a88b355574d65c302330f70da6ee86`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RAllocationRuleHeader02

Read allocation-rule header by allocation name plus the fixed ACTIVE selector. The string selector needs its bound literal interpretation; it is not a caller-supplied flag.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads ALLOCATION_RULE_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/471321089.sql), lines 1–14; original definition SHA-256 `6dc3bbbdd1befaababa5d34e248d47dca4054a4ae47355b640787336cb3d36b6`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RAppIdentifier01

Read application-identifier metadata by exact APP_IDENTIFIER; all columns are returned without ordering.

Effects: reads APP_IDENTIFIER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/990274933.sql), lines 1–16; original definition SHA-256 `6382d06e66f302e285722360fc63040f39ca61df0ee32b8faa66e58faa2ede1b`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RAppointmentSchedule02

Read appointment schedule by OBJECT_ID; this does not reserve, update or validate an appointment slot.

Effects: reads APPOINTMENT_SCHEDULE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1006274990.sql), lines 1–15; original definition SHA-256 `0da0348fcec70059ff59433d8aea888e2d931a02a66472af44f4a47f04e9e7c5`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RAppointmentSchedule03

Read appointment schedules by INTERNAL_RECEIPT_NUM; the result can contain several appointments and has no ORDER BY.

Effects: reads APPOINTMENT_SCHEDULE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1022275047.sql), lines 1–15; original definition SHA-256 `b3c8fd6ae263819f41b34858f05d6e2f124bf32b0528cae8194ef6ed873f03f7`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RCommentText01

Read comment text by INTERNAL_COMMENT_ID; all comment columns are returned.

Effects: reads COMMENT_TEXT.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/503321203.sql), lines 1–12; original definition SHA-256 `87db0376d46e0d3c7a2debf6c682d317170d4275b418b469936fd95825529db9`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RCommentText02

Read comment text by INTERNAL_COMMENT_ID. This captured body has the same row predicate as variant 01; the suffix does not add another behavior.

Effects: reads COMMENT_TEXT.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/519321260.sql), lines 1–12; original definition SHA-256 `d732561ef9ece011b85a7c2591ac6745837ace4b4a3bd38b77129c8ab9f70490`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RCommentText03

Return distinct COMMENT_TYPE values for the internal-number, internal-line-number and record-type tuple. NULL line input is not made equivalent to a stored NULL line.

Effects: reads COMMENT_TEXT.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1054275161.sql), lines 1–21; original definition SHA-256 `227747a79ecb46d9e733b113f6858c5a03df87a413736410ae7b670018319499`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RCommentText04

Branch on interface-link ID equal to zero. Zero reads COMMENT_TEXT by internal comment identity; every other value, including NULL, takes the upload branch matching INTERFACE_RECORD_ID and INTERFACE_LINK_ID. The branch tables can have different wildcard output shapes.

Effects: reads COMMENT_TEXT; reads UPLOAD_ORDER_COMMENT.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1070275218.sql), lines 1–20; original definition SHA-256 `8efaea286d4321f8ff47c328722fd8852dcb7252136a54c00756d8568b1d5074`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RCommentText05

For zero interface link read operational comments by internal number/type; line zero also matches a stored NULL line. Otherwise join upload comments to operational comments for record type, normalize upload line NULL to zero, filter interface link, and return UC.*. The join can multiply upload rows; no DISTINCT is used.

Effects: reads COMMENT_TEXT; reads UPLOAD_ORDER_COMMENT.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1086275275.sql), lines 1–29; original definition SHA-256 `506bddd81ded6848c6e01fcff73d42d2757ea6973a08ad879d48f6db3627ca75`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RCommentText06

Read upload comments by line and interface link. Apply internal-number equality only when the input is positive; zero, negative and NULL inputs remove that restriction.

Effects: reads UPLOAD_ORDER_COMMENT.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1102275332.sql), lines 1–17; original definition SHA-256 `1126e6016289a48c6812c93c52ad7cf656202d2677feaaca7e7cac1878f4c5cc`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RCommentType01

Read comment-type metadata by exact type without an ACTIVE test.

Effects: reads COMMENT_TYPE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/535321317.sql), lines 1–12; original definition SHA-256 `20f4dba20e57c03884ccfabad199f6c4aa73976d48cd7de0374c4f81088e31fc`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RCommentType02

Read comment-type metadata by exact type plus the fixed ACTIVE selector.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads COMMENT_TYPE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/551321374.sql), lines 1–14; original definition SHA-256 `2c3d20d8567d995d73ae52d02dbf2d6391f82f1ec8aa1ccea2f1fc5cf61b1f52`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RCompany01

Read companies with COMPANY LIKE the caller pattern. SQL wildcard characters retain LIKE semantics; this is not exact company equality.

Effects: reads COMPANY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/567321431.sql), lines 1–16; original definition SHA-256 `26210399a18c6d9e973856bd1b02304a32adc5d10705bbd6d38c0900977cf826`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RCompany02

Read company by exact equality and the fixed ACTIVE selector. This differs from the LIKE-based variant 01.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads COMPANY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1118275389.sql), lines 1–20; original definition SHA-256 `6075999d9390291fc567da106b989e48252e6ef6abe5e9c2effc76b56ce29882`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RConsolidatedShipmentHeader

Choose an unordered TOP 1 shipment-detail internal shipment for warehouse plus ERP order, then return its header only if the fixed CONSOLIDATED selector matches. Other candidate shipments are not tried if the chosen header fails that test.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads SHIPMENT_DETAIL; reads SHIPMENT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1134275446.sql), lines 1–56; original definition SHA-256 `fcaa9e68ee7d59c1bc91a144b5b258d816ce5fc442803cbab5c1c69f787e419f`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RContainerClass01

Read all container-class columns by exact class, with no active filter.

Effects: reads CONTAINER_CLASS.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/583321488.sql), lines 1–12; original definition SHA-256 `96877f7d79b633abd9bd7b55e50de53c67771609c3850c5189bf997d7e578af2`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RContainerClass02

Read container-class metadata by exact class plus the fixed ACTIVE selector.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads CONTAINER_CLASS.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/599321545.sql), lines 1–14; original definition SHA-256 `695413eb210e0671e6579baf779b050017eceea272f9176c354702d2da280097`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RContainerType01

Read all container-type columns by exact type, with no active filter.

Effects: reads CONTAINER_TYPE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/615321602.sql), lines 1–12; original definition SHA-256 `e71b43d3ee3060487c668378cbf9974dc08de890b9991f878daa2728651951ff`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RContainerType02

Read container-type metadata by exact type plus the fixed ACTIVE selector.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads CONTAINER_TYPE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/631321659.sql), lines 1–14; original definition SHA-256 `b2c016044dd5b566807066d9078a46db4dba76b42c51f2ec9d9016b1e3465aa9`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RContainerType03

Return every container type carrying the fixed USE_AS_DEFAULT selector. No input, TOP, uniqueness check or ACTIVE restriction makes this a guaranteed single default.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads CONTAINER_TYPE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/647321716.sql), lines 1–5; original definition SHA-256 `aeaad1d3d4b187ffcc2a13eb0e30a7a1791dacb4e88fed5a3c0a1e3c810cb64a`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RCustomer02

Read customer matches including a company-specific row or a NULL-company fallback. Order COMPANY ascending, which puts NULL first; the body returns all matching rows rather than selecting one.

Effects: reads CUSTOMER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/663321773.sql), lines 1–17; original definition SHA-256 `61ecdc262dac18e41071e3adfcc84e51506872f0627f45812ecd6022e28af813`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RCustomer03

Require customer and exact-or-both-NULL ship-to, then allow requested company or NULL-company fallback. Order ship-to descending then company descending; no TOP chooses one row.

Effects: reads CUSTOMER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/679321830.sql), lines 1–19; original definition SHA-256 `eeeae98980d16d61fa9e9c6ab2a6a3c6f09b99ecb37edc67007666cb5821e99c`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RCustomer04

Limit customer output with SET ROWCOUNT 1. Allow requested or NULL ship-to/company, ranking both specific first, ship-to-specific next, company-specific next, both generic last. Ties have no additional order. The procedure does not explicitly reset ROWCOUNT inside the body.

Effects: reads CUSTOMER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1150275503.sql), lines 1–34; original definition SHA-256 `6fc2a30d08607d0084d6035ca31b076bbb20c339fe1ab972da48bb117ea643c2`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RCustomStatusFlowHeader01

Read custom-status-flow header by FLOW_NAME without active filtering or transition execution.

Effects: reads CUSTOM_STATUS_FLOW_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/695321887.sql), lines 1–12; original definition SHA-256 `fbaaa382321ab18285cbdc9ef92287d0c3ad1874fa4b15831d985483bee16b8f`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RCustomStatusFlowHeader02

Read custom-status-flow header by FLOW_NAME and the fixed ACTIVE selector; no transition is executed.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads CUSTOM_STATUS_FLOW_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/711321944.sql), lines 1–14; original definition SHA-256 `d2496bc1e0c5f6e69504fd44314791e3ffbaee2a7eaa9b1eaee7009f6c49b682`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RDataRetrievalStmtDetail01

Read data-retrieval statement detail by detail key and fixed ACTIVE selector, ordered by DETAIL_DESC. The stored retrieval text is returned, not executed.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads DATA_RETRIEVAL_STMT_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/727322001.sql), lines 1–15; original definition SHA-256 `929a6023aa57bed8996fa09809c4c20dc55c43759ac605e0b2fb48f15ebec4d6`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RDataRetrievalStmtDetail02

Read data-retrieval statement details for a header key and fixed ACTIVE selector, ordered by DETAIL_DESC. This does not execute a stored retrieval.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads DATA_RETRIEVAL_STMT_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/743322058.sql), lines 1–15; original definition SHA-256 `eb5dec8016b0d6ffa5198d86cf0d087e9ee0787c1f9fdc3d350f76715fadb2eb`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RDataRetrievalStmtHeader01

Read a data-retrieval header by header key, without an ACTIVE check or query execution.

Effects: reads DATA_RETRIEVAL_STMT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/759322115.sql), lines 1–13; original definition SHA-256 `f77a0e7b594c27555dda37114a440fa720d34db6ef3a42361665acb5d885b3be`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RDataRetrievalStmtToken01

Read all token-definition columns for a retrieval-header key; there is no sequence order or token substitution.

Effects: reads DATA_RETRIEVAL_STMT_TOKEN.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/775322172.sql), lines 1–13; original definition SHA-256 `363496648921be311f3fc41f78c9840538e81edaa7c858758ad257f99f2527f0`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RDataRetrievalStmtToken02

Read a retrieval-token definition by internal token number; no token substitution occurs.

Effects: reads DATA_RETRIEVAL_STMT_TOKEN.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/791322229.sql), lines 1–13; original definition SHA-256 `b7191982bb12e14dd16cff0ccb9c2ae8bbc255ef7aacfa966c3f61eee35ed60a`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RFunctionalAreaStatusFlow01

Read functional-area status-flow rows by functional area and system status. The procedure does not change statuses or verify an allowed transition.

Effects: reads FUNCTIONAL_AREA_STATUS_FLOW.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/807322286.sql), lines 1–15; original definition SHA-256 `48b0c2e79601913786d27b3c0f5d2a9aacecf4eb706d8e9fa639a4f806ba96b2`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RGenericAddressDetail01

Read generic-address detail by identifier and record type, with exact equality on both values.

Effects: reads GENERIC_ADDRESS_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1166275560.sql), lines 1–19; original definition SHA-256 `2f8a7200fb29c797a4f355a75fdd62613d163fac3985d7d13b3d43b2cda2e4cc`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RGenericConfigDetail01

Read generic-configuration detail by record type and identifier without active filtering.

Effects: reads GENERIC_CONFIG_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/823322343.sql), lines 1–14; original definition SHA-256 `8666f9dfe628956513cdccea123855118ac6dbaeb41bbefc149a44d198aafda0`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RGenericConfigDetail02

Read generic-configuration detail by record type, identifier and the fixed ACTIVE selector.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads GENERIC_CONFIG_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/839322400.sql), lines 1–16; original definition SHA-256 `1edc652fc2a0bd3c504700b90492e956c281918fd33ff1126018ab7fc6bccdc8`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RGenericConfigDetail03

Read generic-configuration details for a record type and fixed ACTIVE selector, ordered by DESCRIPTION.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads GENERIC_CONFIG_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/855322457.sql), lines 1–15; original definition SHA-256 `272ae997068a64332a398464a2ce1702b78241419a8da46b6693a42ddf1919e9`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RInventory01

Build and execute dynamic inventory SQL. Resolve a warehouse-local date, optionally extract filter criteria from named filter text, compose the query and pass the date to sp_executesql. The warehouse input is used for date derivation; direct row restriction requires inspecting the embedded SQL. Full dynamic text is reviewed separately in private evidence.

Private dynamic body: read LOCATION_INVENTORY left joined to CATCH_WEIGHT_INFORMATION by internal location-inventory ID. Exclude location classes whose generic configuration disables inclusion; require at least one non-NULL, nonzero allocated, on-hand, in-transit or suspense quantity. Add location and inventory-attribute left joins only when nonempty extracted filter criteria exist. The optional criteria are enclosed in parentheses. Return 48 expressions in the listed order, including internal identity twice (first under its own name and later OBJECT_ID), a newly generated UTC stamp, catch weight and catch-weight unit. Order by INTERNAL_LOCATION_INV. The warehouse input supplies only WarehouseDate for use by optional filter text; the base query has no warehouse equality predicate. Blank or missing filter criteria skip the extra filter, while multiple named configuration rows cause the scalar subquery to fail. Text after the first WHERE marker is used; absent markers are not explicitly rejected. The filter content is dynamic syntax rather than a parameter value.

Effects: reads CATCH_WEIGHT_INFORMATION; reads FILTER_CONFIG_DETAIL; reads GENERIC_CONFIG_DETAIL; reads LOCATION; reads LOCATION_INVENTORY; reads LOCATION_INVENTORY_ATTRIBUTES; calls GetWarehouseTimezoneValue; calls sp_executesql.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1262275902.sql), lines 1–113; original definition SHA-256 `388bf2fb844dea9d364e52d496ebc55224bb9e802b798f7139202733ab88822a`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RInventory02

Build and execute the second dynamic inventory query with a warehouse-local date and optional named filter criteria. This is a different embedded projection/query, not evidence of mutation from its suffix. Full dynamic text is reviewed separately in private evidence.

Private dynamic body: use the same nonzero location-inventory eligibility and location-class exclusion as variant 01, projecting 47 fields with OBJECT_ID first and no second internal-identity column. Append UNION ALL synthetic zero-balance rows from ITEM cross joined with every WAREHOUSE when no eligible nonzero inventory exists for that item, normalized company and warehouse. Synthetic rows take item descriptive/user fields and warehouse code, zero quantities/cost/value/volume/weight, fresh UTC timestamp and NULL location/attribute/catch-weight fields. The optional stored filter is applied only to the first inventory branch, not the synthetic branch or its NOT EXISTS test. There is no final ORDER BY, item/warehouse ACTIVE restriction or direct filterWarehouse equality. The normalized company comparison equates NULL with its fixed single-character sentinel.

Effects: reads CATCH_WEIGHT_INFORMATION; reads FILTER_CONFIG_DETAIL; reads GENERIC_CONFIG_DETAIL; reads ITEM; reads LOCATION; reads LOCATION_INVENTORY; reads LOCATION_INVENTORY_ATTRIBUTES; reads WAREHOUSE; calls GetWarehouseTimezoneValue; calls sp_executesql.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1278275959.sql), lines 1–181; original definition SHA-256 `e65fc078c83708ba673f822f136d8419f0e9e6f326433cdd69f29032c56a82f5`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItem01

Read item by INTERNAL_ITEM_NUM, returning all item columns without company fallback.

Effects: reads ITEM.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/951322799.sql), lines 1–13; original definition SHA-256 `6c6d4be6293cc392635807a93b023a034655089a4844e17ad8d556bcaaad4e51`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItem02

Read item by item code and company equality, additionally matching both company values NULL. It does not fall back to a NULL-company item for a non-NULL requested company.

Effects: reads ITEM.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/967322856.sql), lines 1–16; original definition SHA-256 `f4bf752f718d736d3aec71dcabe678e6a0f1d81d2568abe5d9b0d57c8d39cf1a`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItem03

Read item rows whose company appears in per-company groups having COUNT(DISTINCT COMPANY)=1. Grouping already separates companies, so this does not enforce one company across the item. NULL-company groups do not qualify.

Effects: reads ITEM.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/983322913.sql), lines 1–19; original definition SHA-256 `92c6aaf834a30991538a05ab1bc22c87af86a83191b8bd75b7d3a40237bc0543`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItem04

Read item rows for a code with non-NULL company; no particular company is selected.

Effects: reads ITEM.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/999322970.sql), lines 1–16; original definition SHA-256 `7edfc644c19d5e67000ac922fd10fde4d6ec980f46e14a37e99e44d378d57dc3`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItem05

Read generic item rows for a code where company IS NULL.

Effects: reads ITEM.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1015323027.sql), lines 1–16; original definition SHA-256 `9d5db87cd4591ddfbb7768121b88595a85f7ac8a2d278acfc43c90c14f2d6634`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItem06

Join company-specific item rows to generic item-unit rows sharing item code and exclude items whose storage template equals the requested template. SELECT * includes both tables, and matching unit rows can multiply each item. NULL storage template fails the inequality.

Effects: reads ITEM; reads ITEM_UNIT_OF_MEASURE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1031323084.sql), lines 1–19; original definition SHA-256 `a8cb09c869ec30d377cad7600003f877068941a3d7e395b60815492020d118da`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItem07

Read item matches for requested company plus generic NULL-company rows. Both may be returned with no ordering or preference rule.

Effects: reads ITEM.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1047323141.sql), lines 1–18; original definition SHA-256 `3e83b111dbd9afe9f125ad197823dbb51c0f6b92d7c35b1e54d9086b3e3b3e20`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItem08

Resolve cross-reference item text through ITEM_CROSS_REFERENCE and return ITEM.*. Either side's NULL company broadens the item-to-cross-reference join; NULL caller company broadens the cross-reference filter. No DISTINCT removes duplicate item results.

Effects: reads ITEM; reads ITEM_CROSS_REFERENCE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1294276016.sql), lines 1–20; original definition SHA-256 `bfe2fb8d09b32f7a5b46af094a7b5ebd755982c183e2bce6d34ded7042229b12`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItem09

Read requested-or-generic company item matches restricted by the fixed LOT_CONTROLLED selector. No single-row preference is imposed.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads ITEM.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1310276073.sql), lines 1–26; original definition SHA-256 `9f972f3b90a2d33061dd63b47ae983a55e2bfe9a1f142795b1c9e63543b35481`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItem10

Read requested-or-generic company item matches restricted by the fixed CATCH_WEIGHT_REQD selector. No single-row preference is imposed.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads ITEM.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1326276130.sql), lines 1–24; original definition SHA-256 `3eee598b64d836ee52341d7ef63c1c898a79c3e5a502ef1cb1e7c2916a4a84da`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItem11

Read a company-specific item only when a separate count finds exactly one item row for that code across all companies, including generic rows in the count.

Effects: reads ITEM.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1342276187.sql), lines 1–19; original definition SHA-256 `33781c9e7e56953de582a9e967bed611ca34469ff104e8c1a66ecc3fc10cf9c3`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItemCrossReference02

Read item cross-reference by item and cross-reference code, comparing company values after literal-based ISNULL normalization. Normalization can equate NULL with the sentinel string.

Both company-normalization literals are the same nonempty one-character sentinel; NULL equals NULL or that exact sentinel value, while empty string remains distinct.

Effects: reads ITEM_CROSS_REFERENCE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1358276244.sql), lines 1–20; original definition SHA-256 `57f208adf502e1aa2a020e778ab58b08fd166b0453f0a5c029bd9f70b84e5550`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItemCrossReference03

Read item cross-references by item with literal-based ISNULL company normalization. This is not the broad requested-or-generic fallback predicate.

Both company-normalization literals are the same nonempty one-character sentinel; NULL equals NULL or that exact sentinel value, while empty string remains distinct.

Effects: reads ITEM_CROSS_REFERENCE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1063323198.sql), lines 1–17; original definition SHA-256 `b28edde52649e3d3b0a40908e1a75750ab2945b1e4b6fe6616af22d949a3a0c4`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItemTemplate01

Read ITEM_TEMPLATE by exact template name; all columns are returned without an ACTIVE restriction.

Effects: reads ITEM_TEMPLATE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1079323255.sql), lines 1–13; original definition SHA-256 `b43982a677fd16908861915d9cedc5e9dc9fe2b9dab501b2f6356d7395fc558f`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItemUnitOfMeasure01

Read item-unit metadata by INTERNAL_ITEM_UM; all columns are returned.

Effects: reads ITEM_UNIT_OF_MEASURE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1095323312.sql), lines 1–13; original definition SHA-256 `b6a32e4958e6e1ab1979926407399e7bf7bc13ff7d48384de9712aa681d6d0bc`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItemUnitOfMeasure02

Return item/company units first; use generic item units only if exact company units do not exist; use item-class units only if requested-or-generic item units do not exist. UNION removes duplicate complete rows, and final company DESC order is present. This is set-level fallback, not per-unit fallback.

The literals inside EXISTS projections are irrelevant to membership; those subqueries test row existence, not the projection value.

Effects: reads ITEM_UNIT_OF_MEASURE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1374276301.sql), lines 1–40; original definition SHA-256 `9c8b466bf824b5132c162de3c0ace4894e678e31e75ff11f6669034205cdd85c`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItemUnitOfMeasure03

If item is non-NULL, read that item and quantity unit for requested-or-generic company ordered by COMPANY ascending. Otherwise read item-class and quantity-unit rows without company filtering or ordering.

Effects: reads ITEM_UNIT_OF_MEASURE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1111323369.sql), lines 1–26; original definition SHA-256 `8b6901c374f26fc47d089d3adc00b2167edc168fba794af6885c077ce7618109`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItemUnitOfMeasure04

If item is non-NULL, read item and unit sequence for requested-or-generic company ordered by COMPANY ascending. Otherwise read item-class and sequence without company filtering or ordering.

Effects: reads ITEM_UNIT_OF_MEASURE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1127323426.sql), lines 1–25; original definition SHA-256 `f65bd443214253bffee4b79909281d1d4802d3aeaf0b02626d5ed559dbee8bb8`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItemUnitOfMeasure05

Read every company-specific item-unit row for an item code; no requested company or unit filter exists.

Effects: reads ITEM_UNIT_OF_MEASURE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1143323483.sql), lines 1–16; original definition SHA-256 `2211bf5ca7677d864acd8fe970ecf898b5d073a126c648052d76404ace02a2c1`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItemUnitOfMeasure06

Read generic NULL-company item-unit rows for an item code.

Effects: reads ITEM_UNIT_OF_MEASURE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1159323540.sql), lines 1–17; original definition SHA-256 `0e1c735182b81757ceda80c61015645ae6dcf2c76af66f86b9d18f05dc6479dc`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RItemUnitOfMeasure07

Compute an insertion sequence from a storage-template unit sequence. Item presence chooses item/company or item-class paths; unordered TOP 1 item template lookups and unordered variable assignment can select ambiguous candidates. A found sequence below one returns -1; otherwise return ISNULL(MAX(existing preceding unit sequence),0)+1. A NULL template sequence takes the ELSE path and returns 1 because the preceding comparison finds no rows. No unit row is inserted.

All four storage-template fallback literals name the default template; this fallback applies when the selected item's template is NULL. No matching item yields no template row instead of automatically creating a default item.

Effects: reads ITEM; reads ITEM_UNIT_OF_MEASURE; reads STORAGE_TEMPLATE_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1198627313.sql), lines 1–79; original definition SHA-256 `df9f82f4dda8ff9d4548afecc282aeb8d4c226999d6a6fb3ddb76d48495be330`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RLaunchStatistics01

Read launch statistics by INTERNAL_LAUNCH_NUM, without aggregation or launch execution.

Effects: reads LAUNCH_STATISTICS.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1390276358.sql), lines 1–14; original definition SHA-256 `3bef5f3b04e7bb26647708fe0d1833c8bce3ce4523cf1a388a0fbb397d0dfa8b`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RLocation01

Read location by exact location and warehouse, with no class restriction.

Effects: reads LOCATION.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1191323654.sql), lines 1–18; original definition SHA-256 `68e676d19c7b8a94d47fa70b959a41af8a1c1aecfba1edc44c3eca116fd457de`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RLocation02

Read location by location, warehouse and the fixed LOCATION_CLASS selector.

The private LOCATION_CLASS selector denotes the pick-and-drop class.

Effects: reads LOCATION.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1207323711.sql), lines 1–19; original definition SHA-256 `6025fe3574ce2eb6390f33419017f102067532bf20c0d61f92f4a76ba09eb35b`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RLocation03

Read all locations in a warehouse carrying the fixed LOCATION_CLASS selector; no location input or ordering is present.

The private LOCATION_CLASS selector denotes receiving pre-check-in locations.

Effects: reads LOCATION.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1223323768.sql), lines 1–17; original definition SHA-256 `6e1a86aa3504ad9bc63a193993b007024d56b8444f681f553e0109e781d53752`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RLocation04

Read a location using the dock-named input, warehouse and fixed LOCATION_CLASS selector. The input name alone does not establish that every matching row is a valid operational dock.

The private LOCATION_CLASS selector denotes receiving dock locations.

Effects: reads LOCATION.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1406276415.sql), lines 1–16; original definition SHA-256 `5497986c0f3e93784e08e44b8cf02f7c4e8772be729676b1f347ad0cd30ee3f2`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RLocationInventoryAttributes01

For interface link zero read operational location-inventory attributes by internal shipping-container number; otherwise read upload attributes by that number and interface link. A NULL link takes the upload branch but fails equality.

Effects: reads LOCATION_INVENTORY_ATTRIBUTES; reads UPLOAD_LOCATION_INVENTORY_ATTRIBUTES.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1422276472.sql), lines 1–22; original definition SHA-256 `c4ddde67312621a2640edde82ec4bef47c0652bb38647c755facdb62f89c5076`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RLocationInventoryAttributes02

Read location-inventory attributes by OBJECT_ID from the operational table only.

Effects: reads LOCATION_INVENTORY_ATTRIBUTES.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1438276529.sql), lines 1–26; original definition SHA-256 `1e49148841056c0bf4a62c92934a30f28ffdef847a78bf4c30daca5116997b64`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RLocationInventoryAttributes03

Return object ID and twenty inventory attributes from the UNION of operational and archive attribute projections, joined to transaction-history attributes by attribute value/object ID. Filter link ID and fixed attribute type. UNION deduplicates the projected attribute records, but repeated history links can multiply the output.

The private attribute-type selector identifies inventory-attribute references in transaction history.

Effects: reads AR_LOCATION_INVENTORY_ATTRIBUTES; reads LOCATION_INVENTORY_ATTRIBUTES; reads TRANS_HIST_ATTRIBUTES.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1454276586.sql), lines 1–27; original definition SHA-256 `63e7a295cb8d0a90aa10293d55c8b5a1fe9ea50488ae9004a9d1d0e55c189c91`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RLocationInventoryAttributes04

If operational location-inventory attributes exist for the object ID, return those rows; otherwise read the archive table. Separate existence/read statements have no locking to freeze the branch decision.

Effects: reads AR_LOCATION_INVENTORY_ATTRIBUTES; reads LOCATION_INVENTORY_ATTRIBUTES.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1470276643.sql), lines 1–15; original definition SHA-256 `4c14a825be1b0297a95d62adedd0113e761873e83176350e52f0bc5f64b1fbdd`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RLot01

Read lot by lot, item and warehouse with literal-normalized company equality. No active, status or expiration test appears.

Both company-normalization literals use the same nonempty one-character sentinel; two NULL values match, and the sentinel itself can collide with NULL.

Effects: reads LOT.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1486276700.sql), lines 1–25; original definition SHA-256 `462c02abcafd13e52289cb282543a640ccd7233ae875569583bb26846b0d25f9`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RLotAttribute01

Read lot-attribute rows by LOT_ID; this does not read or enforce the template definition.

Effects: reads LOT_ATTRIBUTE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1502276757.sql), lines 1–18; original definition SHA-256 `f469545a3318f798a0a85497de5cf9769e7f227bc8e7ab1e918427435a12266e`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RLotAttributeTemplate01

Despite the AttributeTemplate name, the actual body reads LOT_TEMPLATE by LOT_TEMPLATE, with no LOT_ATTRIBUTE table access.

Effects: reads LOT_TEMPLATE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1518276814.sql), lines 1–18; original definition SHA-256 `373f8c10d52e1a2312431ab2b19965fb2f992a0e42f248efbe67bb80e5b8013b`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RLotTemplate01

Read LOT_TEMPLATE by name and return all columns without active filtering.

Effects: reads LOT_TEMPLATE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1534276871.sql), lines 1–18; original definition SHA-256 `7c18ba367c433098db3bbb748a8bb813f7e44ba0db1901df9ce4feff4cdfd03b`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RLotTemplate02

Return only LOT_TEMPLATE for the requested name plus fixed ACTIVE selector; no TOP suppresses duplicate matches.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads LOT_TEMPLATE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1550276928.sql), lines 1–16; original definition SHA-256 `f4aa526322b6e2e57f0a8b326a6be6d288f54f6feccb951e479aa45576688c1d`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_ROrderHeader01

Read order header by INTERNAL_ORDER_NUM without joining order details.

Effects: reads ORDER_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1239323825.sql), lines 1–12; original definition SHA-256 `df1e128dafff29bc9db7d32b057a342ec7aa363db79e9fbae7c9bd798b179e11`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RPackingClass01

Read packing-class metadata by class without an ACTIVE condition.

Effects: reads PACKING_CLASS.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1255323882.sql), lines 1–12; original definition SHA-256 `7e9b3261a670a1e2dfa56db118dbf71d0e19ae61f4e28e5692c533b9c7ec6bd0`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RPackingClass02

Read packing-class metadata by class and the fixed ACTIVE selector.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads PACKING_CLASS.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1271323939.sql), lines 1–14; original definition SHA-256 `1af6b6a60e719e709f3b3b7b98d3741c209178522c0d9212a8ceab01a2036816`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RPurchaseOrderDetail01

Read purchase-order detail by its OBJECT_ID.

Effects: reads PURCHASE_ORDER_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1566276985.sql), lines 1–15; original definition SHA-256 `83f14f9ce6f02a1717282e7c74e20fedf79dcc560a13937e3437ef18caf6a636`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RPurchaseOrderDetail02

Return only detail OBJECT_ID, LINE_NUMBER and ITEM for the purchase-order object ID; order by line number, item and company even though company is not projected.

Effects: reads PURCHASE_ORDER_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1582277042.sql), lines 1–22; original definition SHA-256 `a18babf85c66a77272278670ad74cc64b4254bc79c1b366852412041ce84dbf7`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RPurchaseOrderDetail03

Read purchase-order detail by business order ID and line number with no warehouse or header-closed test.

Effects: reads PURCHASE_ORDER_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1598277099.sql), lines 1–17; original definition SHA-256 `2b887d559c8ebe63a8b17f7354a454be655ee4afa35e775b511b59275b81e0cf`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RPurchaseOrderDetail04

Join purchase-order detail to its header object ID, require order ID, line and warehouse, and require header CLOSED_DATE_TIME NULL. Return POD.* followed by the explicitly listed header fields; no ordering or TOP is present.

Effects: reads PURCHASE_ORDER_DETAIL; reads PURCHASE_ORDER_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1614277156.sql), lines 1–54; original definition SHA-256 `383eff7047a50a896e121edb15b65e6ea6c4f1683cb3e9d785dd04e3df7178a4`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RPurchaseOrderHeader01

Read purchase-order header by OBJECT_ID with no closed-date restriction.

Effects: reads PURCHASE_ORDER_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1630277213.sql), lines 1–15; original definition SHA-256 `4de69be63e9d63ff8176e967b6f1d4e260faa1bf5ed3703d831ddbb2e352e74a`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RPurchaseOrderHeader02

Read purchase-order headers by business ID without warehouse restriction.

Effects: reads PURCHASE_ORDER_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1646277270.sql), lines 1–16; original definition SHA-256 `5f06cffa95172bd8b38cde790709434e3af7cb506711dfb43dd9a9935ee50af2`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RPurchaseOrderHeader03

Read purchase-order headers by business ID and warehouse without testing whether closed.

Effects: reads PURCHASE_ORDER_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1662277327.sql), lines 1–19; original definition SHA-256 `b84018983b39d570a004221a799b201cfef220aebda8f6f88fbd5cae9c65eb30`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptContainer01

Read receipt container by INTERNAL_REC_CONT_NUM only.

Effects: reads RECEIPT_CONTAINER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1287323996.sql), lines 1–17; original definition SHA-256 `6093c099c69d7ce01973ca355d9c7c5524ebad7960d00557421dfdda6cb98ca2`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptContainer02

Read RC.* by container ID joined to an open receipt header using both internal receipt number and receipt ID. NULL warehouse uses header warehouse itself, which still excludes NULL header warehouses under equality.

Effects: reads RECEIPT_CONTAINER; reads RECEIPT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1303324053.sql), lines 1–23; original definition SHA-256 `d8e85ef48a15d41e9fe9f6e738c001ce1b6394b27e2863bbee170d71c3d7065e`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptContainer03

Read receipt containers whose PARENT equals the supplied internal container number; this is an immediate-child query, not recursive descent.

Effects: reads RECEIPT_CONTAINER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1319324110.sql), lines 1–17; original definition SHA-256 `5615321aa51fcfc9f83a81efafd9c0bf40a5b6b60d42b70edcdb1c667f8c154e`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptContainer04

Read top-level receipt containers for an internal receipt number where PARENT is NULL or zero.

Effects: reads RECEIPT_CONTAINER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1335324167.sql), lines 1–18; original definition SHA-256 `b57b8b05948d3ad4b744dc2ebb0156df252da077404de0b0be2827fd29eb5448`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptDetail01

Read receipt detail by INTERNAL_RECEIPT_LINE_NUM only.

Effects: reads RECEIPT_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1351324224.sql), lines 1–18; original definition SHA-256 `d3809abcf96f3d96494e939b65c441c1c5fd58bcac80355b3c97c31b4a53b140`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptDetail02

Read receipt details by receipt ID, literal-normalized ERP order and ordinary ERP line equality. No warehouse or open-header restriction appears.

Both ERP-order normalization literals use the same nonempty one-character sentinel; two NULL orders match, and the sentinel itself can collide with NULL. ERP line remains ordinary equality.

Effects: reads RECEIPT_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1678277384.sql), lines 1–22; original definition SHA-256 `ceaa1e2c606ff00eb98023ab256fd1b2befa7611907372c88787e4de45735d4a`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptDetail03

Read receipt detail by receipt ID, item and ordinary company equality. NULL company is not treated as a generic match.

Effects: reads RECEIPT_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1367324281.sql), lines 1–22; original definition SHA-256 `bc1e7dd728460f1a1abec21b853780c8508bc8d00920146c4b8a538abadda8f7`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptDetail04

Read all receipt details by internal receipt number without line order.

Effects: reads RECEIPT_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1383324338.sql), lines 1–18; original definition SHA-256 `2a99983d96dcbe1ff786ad033c576bf56d275c91544294eb80a17291f6011ead`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptDetail05

Read receipt details for purchase-order ID; apply purchase-order line equality only for a positive input. Zero, negative and NULL line inputs select all order lines.

Effects: reads RECEIPT_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1694277441.sql), lines 1–27; original definition SHA-256 `a137bc4a5f232d22739e20c24fafbe9e6b2df99faf96a493f0bca2d9aa413484`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptDetail06

Join receipt detail/header by internal number; filter receipt ID, normalized receipt-ID type, receipt type and ERP order, ordinary ERP line equality and open header. SELECT * includes both tables; no warehouse filter exists.

All receipt-type and ERP-order normalization pairs use the same nonempty one-character sentinel; NULLs match each other and collide with that sentinel. ERP line remains ordinary equality.

Effects: reads RECEIPT_DETAIL; reads RECEIPT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1710277498.sql), lines 1–33; original definition SHA-256 `da30be58ef1a647b4e183517ba587d299c173e92ec899f0f7c1f98ff73736672`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptDetail07

Use the same detail/header and normalized type/order predicates as variant 06, additionally requiring warehouse equality. SELECT * includes both tables and only open headers qualify.

All receipt-type and ERP-order normalization pairs use the same nonempty one-character sentinel; NULLs match each other and collide with that sentinel. ERP line and warehouse remain ordinary equality.

Effects: reads RECEIPT_DETAIL; reads RECEIPT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1726277555.sql), lines 1–35; original definition SHA-256 `04d0825306cfc00543acd148bd34524e46a86212f412129971c8906734efae58`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptHeader01

Read receipt header by internal receipt number without an open/closed condition.

Effects: reads RECEIPT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1399324395.sql), lines 1–18; original definition SHA-256 `a5b89a1655364654fe06cad60b77684e67251c293427f5311eba23decddc0616`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptHeader02

Read open receipt headers by receipt ID and ordinary receipt-ID-type equality. NULL type input does not match a stored NULL type.

Effects: reads RECEIPT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1415324452.sql), lines 1–21; original definition SHA-256 `508147730ab10df14bc0e914fafd22469022c8b6afa2e97ee371f2afcbd4e29b`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptHeader03

Read receipt headers by receipt ID and warehouse without testing CLOSE_DATE.

Effects: reads RECEIPT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1431324509.sql), lines 1–22; original definition SHA-256 `54042188db26b0835dff8ee832308694a46e2363df37a76845438e9ca1750dac`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptHeader04

Select receipt headers eligible through unbatched line containers reaching the status threshold, or line containers on closed receipts, plus their parent containers. A system-config branch additionally includes closed, unbatched headers even without qualifying containers. The IN predicate prevents duplicate subquery IDs from duplicating a header result; no upload marker is written. A missing or NULL configuration value takes ELSE.

The private system key in the interface record-type group controls inclusion of closed receipts without containers; the tested value is affirmative. No effective setting value was queried.

Effects: reads RECEIPT_CONTAINER; reads RECEIPT_HEADER; reads SYSTEM_CONFIG_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/558625033.sql), lines 1–99; original definition SHA-256 `aca8d2e9934014c733538e844fa7590c1a377c662df3bc5f6dd737e20a23a8a9`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptHeader05

Select upload-candidate receipt headers with the same closed-receipt and parent-container alternatives as variant 04. The threshold path additionally requires receipt-detail OPEN_QTY=0 and no container below the threshold for that detail. The configured extra branch includes closed unbatched headers without containers. This returns candidates without claiming them or marking upload complete.

The private system key in the interface record-type group controls inclusion of closed receipts without containers; the tested value is affirmative. No effective setting value was queried.

Effects: reads RECEIPT_CONTAINER; reads RECEIPT_DETAIL; reads RECEIPT_HEADER; reads SYSTEM_CONFIG_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/542624976.sql), lines 1–139; original definition SHA-256 `0058a08761daa5f70af4d7608a439552141b2ee600487af623e9cc1c32722bf3`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptHeader06

Select upload-candidate receipt headers with threshold paths additionally testing equal leading/trailing header status, or a literal CLOSE_DATE <> NULL expression plus minimum container status. That comparison is retained exactly; under ANSI NULL semantics it is UNKNOWN, not an IS NOT NULL test. Separate closed-receipt branches still exist. Configured inclusion of closed unbatched headers is optional; no upload state is changed.

The private system key in the interface record-type group controls inclusion of closed receipts without containers; the tested value is affirmative. Captured module metadata confirms ANSI_NULLS enabled, so CLOSE_DATE <> NULL does not mean a closed receipt.

Effects: reads RECEIPT_CONTAINER; reads RECEIPT_HEADER; reads SYSTEM_CONFIG_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/526624919.sql), lines 1–148; original definition SHA-256 `5c770d6726a7a2b999a721058e4719aa80a9abbc159d492c05a1245e612f6ab3`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptHeader07

Read open receipt headers by receipt ID, receipt-ID type, receipt type and warehouse using ordinary equality for every parameter. NULL types do not match stored NULLs.

Effects: reads RECEIPT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1742277612.sql), lines 1–28; original definition SHA-256 `0d96504694f5826f4e50a834ffb8096e68295fc343d91f4ae0937662b368ea53`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RReceiptHeader08

Read open receipt headers by receipt ID, receipt-ID type and warehouse. Receipt type is deliberately absent from this variant's filters.

Effects: reads RECEIPT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1758277669.sql), lines 1–26; original definition SHA-256 `acc1b76f3f9b5217cf8a16c0192ca42c80b9ded3884fed69f8a116cd902ef8aa`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RResource01

Return six resource fields from custom resources for language/group, UNION base resources only for keys absent from matching custom resources. Custom presence controls precedence independent of text content; UNION removes duplicate complete rows. A NULL in the NOT IN key subquery would affect base-row eligibility under SQL NULL semantics; no ORDER BY exists.

Effects: reads RESOURCE_FILE_BASE; reads RESOURCE_FILE_CUSTOM.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1447324566.sql), lines 1–20; original definition SHA-256 `0ed3a9addeb3fdde99eb299b5d542b7d77d6c0c9fb43c3192b6d2aab0843a120`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RSerialNumber01

Read operational serial number by OBJECT_ID only.

Effects: reads SERIAL_NUMBER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1774277726.sql), lines 1–15; original definition SHA-256 `2229a3589ed682c59c3e9a2124039aba9bc05d94c987c66da000b8201d016b80`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RSerialNumber02

Read serial number and receipt-container matches with no template, UNION ALL matching serial rows whose template has sequence zero. All serial fields are returned and duplicates are preserved.

Effects: reads SERIAL_NUMBER; reads SERIAL_NUM_TEMPLATE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1790277783.sql), lines 1–28; original definition SHA-256 `c625af79ce03aed899ab40de39620ba5022f0a79f5d3fdd541bb6a6b7d64a037`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RSerialNumber03

Read other serial rows in the specified group using OBJECT_ID inequality. NULL excluded-object input makes that inequality UNKNOWN and yields no rows.

Effects: reads SERIAL_NUMBER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1806277840.sql), lines 1–17; original definition SHA-256 `011e169d96f48c9c9dcc06c85324ea55fcf03159370333c8db98010f8338a429`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RSerialNumber04

Read receipt-container serials with no template or a sequence-zero template using UNION ALL. No archive table is read.

Effects: reads SERIAL_NUMBER; reads SERIAL_NUM_TEMPLATE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1822277897.sql), lines 1–24; original definition SHA-256 `42396a52243435c75abed6dd7fbb29ec186b7d2751643078453e2d1ef5364e01`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RSerialNumber05

Read shipping-container serials with no template or a sequence-zero template using UNION ALL. No archive table is read.

Effects: reads SERIAL_NUMBER; reads SERIAL_NUM_TEMPLATE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1838277954.sql), lines 1–24; original definition SHA-256 `e53d364915e0febbc2666a1343f358a02a7ddd828717a5448be788178e6d321e`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RSerialNumber06

Read receipt-container serials from operational and archive tables, including no-template and sequence-zero-template branches. UNION ALL preserves duplicates across all four branches.

Effects: reads AR_SERIAL_NUMBER; reads SERIAL_NUMBER; reads SERIAL_NUM_TEMPLATE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1854278011.sql), lines 1–43; original definition SHA-256 `1e4cccf8c73bb4a5e4b043765be5e152578b1a331d16dc5f791ccff20cba3fed`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RSerialNumber07

Return operational and archive serial rows for OBJECT_ID using UNION ALL, without preferring the operational record or removing duplicates.

Effects: reads AR_SERIAL_NUMBER; reads SERIAL_NUMBER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1870278068.sql), lines 1–24; original definition SHA-256 `983a0bb38735f4261280229197222b17d38ccbb4c2ac877de074f0c687bd64c3`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RSerialNumber08

Read serial text plus receipt-container matches from operational and archive tables, separately including no-template and sequence-zero-template rows. UNION ALL preserves all matching rows.

Effects: reads AR_SERIAL_NUMBER; reads SERIAL_NUMBER; reads SERIAL_NUM_TEMPLATE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1886278125.sql), lines 1–49; original definition SHA-256 `3fb61e191a079cb6887285f2846eccdd45681e0305f62c65ed71f3207a3220ab`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RSerialNumber09

For zero interface link, return operational and archive group siblings excluding OBJECT_ID. Otherwise find source serial IDs through upload rows filtered by group, upload OBJECT_ID inequality and link, then return matching operational/archive rows. The excluded identity in the upload branch belongs to UPLOAD_SERIAL_NUMBER, not the source serial row.

Effects: reads AR_SERIAL_NUMBER; reads SERIAL_NUMBER; reads UPLOAD_SERIAL_NUMBER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1902278182.sql), lines 1–40; original definition SHA-256 `860ffcc5956b7e50a61b1fbdbf7ac450a434736f61e8cb408bb8dfb107d62e12`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RSerialNumber10

Read shipping-container serials across operational/archive and no-template/sequence-zero branches. For nonzero interface link, source IDs must be referenced by upload serial rows for that container/link; template branches additionally require source SHIP_CONT_NUM equality. UNION ALL preserves duplicates.

Effects: reads AR_SERIAL_NUMBER; reads SERIAL_NUMBER; reads SERIAL_NUM_TEMPLATE; reads UPLOAD_SERIAL_NUMBER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1918278239.sql), lines 1–89; original definition SHA-256 `4d94faaaf51cef20bf3ec739abca5042be9342d4b72667c1e8e2a521143731d2`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RSerialNumber11

Read operational/archive serials referenced by transaction-history attributes for the link and fixed attribute-type selectors. Include no-template and sequence-zero-template branches with UNION ALL; repeated attribute links can repeat serial rows.

All four attribute-type selectors identify serial-number references in transaction history.

Effects: reads AR_SERIAL_NUMBER; reads SERIAL_NUMBER; reads SERIAL_NUM_TEMPLATE; reads TRANS_HIST_ATTRIBUTES.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1934278296.sql), lines 1–52; original definition SHA-256 `42e979211bc937f9594265843785b9f6672ca2f95aef8590b1572567995d0ff8`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RSerialNumber12

Read serial-number rows from the operational table by LOC_INV_NUM, without a template or status restriction.

Effects: reads SERIAL_NUMBER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1950278353.sql), lines 1–15; original definition SHA-256 `4778c5fcf902263eaff7ade0bce373e5105064e747e17fa3022ef52155b5ec8d`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RSerialNumTemplate01

Return TOP 1 NAME for a serial template name carrying the fixed ACTIVE selector, ordered by NAME. Only the name is projected; the order does not distinguish same-name rows.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads SERIAL_NUM_TEMPLATE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1966278410.sql), lines 1–18; original definition SHA-256 `872dad2d87cb7e33b19183b8c1f3e4bb4d8dd6970564db4697dac0f986b691eb`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RSerialNumTemplate02

Read serial-number template by OBJECT_ID, without ACTIVE filtering.

Effects: reads SERIAL_NUM_TEMPLATE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1982278467.sql), lines 1–15; original definition SHA-256 `0d3f9fc73076bdb7dbefdb7c97c09008fea563e02345ee24e38407a873e5355b`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RSerialNumTemplate03

Read serial-number template rows by exact name and description; ordinary equality does not match NULL descriptions.

Effects: reads SERIAL_NUM_TEMPLATE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1998278524.sql), lines 1–17; original definition SHA-256 `94e6d24f4551e9e9aaa9f233212d2408e92162fcb75afd3b79dda3cc4b100901`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RSerialNumTemplate04

Read serial-number template rows by name and sequence with no ordering or active filter.

Effects: reads SERIAL_NUM_TEMPLATE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/2014278581.sql), lines 1–17; original definition SHA-256 `3abe6d8566e059ad49891fda89fa3d2830c19f7c2440871bfbe12546bf8cbd05`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentAccessorials01

Read shipment accessorials by internal number, shipment-level flag, code and subcode. Every comparison is ordinary equality; no NULL normalization or business-level decoding is performed.

Effects: reads SHIPMENT_ACCESSORIALS.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1463324623.sql), lines 1–19; original definition SHA-256 `3e56170970ef04d631cbe2369572c39404650b966c7b4c6f482d9dc4a664d50e`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentAllocRequest01

Read shipment-allocation request by INTERNAL_SHIP_ALLOC_NUM; no allocation operation runs.

Effects: reads SHIPMENT_ALLOC_REQUEST.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/2030278638.sql), lines 1–14; original definition SHA-256 `693abc3dc8100aa9a72df222b858173c01ecd0945c908d2cc82789989f0e10ef`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentAllocRequest02

Read all shipment-allocation requests by INTERNAL_SHIPMENT_LINE_NUM; no allocation operation runs.

Effects: reads SHIPMENT_ALLOC_REQUEST.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/2046278695.sql), lines 1–14; original definition SHA-256 `8777cd376b878b809250fe7ef48ba1ac716fd174eb6a9d8275932189c6ec6a40`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentDetail01

For zero interface link read SHIPMENT_DETAIL by internal line; otherwise read UPLOAD_ORDER_DETAIL by internal line and link. Wildcard result schema follows the selected table.

Effects: reads SHIPMENT_DETAIL; reads UPLOAD_ORDER_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1479324680.sql), lines 1–20; original definition SHA-256 `0124afd264304c7c3d7751ed1e145fc616c77b5467e70d801adddd8788c9d869`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentDetail02

Select operational or upload detail by interface-link zero/nonzero, filtering shipment ID, item and exact-or-both-NULL company. Upload additionally filters interface link; generic fallback for a non-NULL company is absent.

Effects: reads SHIPMENT_DETAIL; reads UPLOAD_ORDER_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1495324737.sql), lines 1–27; original definition SHA-256 `5c173e3ec3e654084dc4795d555b74f1968c76b29983e960fa7aa6cb6c94c3d9`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentDetail03

For zero interface link return operational shipment lines whose related-line number is NULL or zero. The upload branch returns lines by shipment/link without the related-line exclusion.

Effects: reads SHIPMENT_DETAIL; reads UPLOAD_ORDER_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1511324794.sql), lines 1–27; original definition SHA-256 `13985fd1478e74ea1bf4a718cc360b9df337c3d561144c3148b75eb735e47240`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentDetail04

Read operational or upload detail by shipment ID and ERP line while excluding internal shipments whose operational header has the caller's closed status. The upload branch also filters link. NOT IN semantics apply; the procedure itself neither closes a shipment nor validates the meaning of the caller's status.

Effects: reads SHIPMENT_DETAIL; reads SHIPMENT_HEADER; reads UPLOAD_ORDER_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/2062278752.sql), lines 1–32; original definition SHA-256 `fd9f25e72ee627628b80661bf1e988837c2acc48bec7800990b6d5495479a920`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentDetail05

Read immediate shipment-detail rows related to the supplied internal line; no recursive traversal or main-line read is performed.

Effects: reads SHIPMENT_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1527324851.sql), lines 1–14; original definition SHA-256 `cd4074295954f226a22911d09bf1bf717a47aaacf20ab9751803feec1b3b96d3`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentDetail06

Read shipment detail by internal line and literal-normalized company equality, without upload or archive branches.

Company normalization uses the same nonempty one-character sentinel on both sides; two NULL companies match and the sentinel value collides with NULL.

Effects: reads SHIPMENT_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/2078278809.sql), lines 1–18; original definition SHA-256 `82d9e7c03e3387b1789a32de84f697b5911d3bf903885e3bf5e243e4ba4418a0`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentDetail07

Read shipment detail by internal shipment, warehouse, ordinary ERP-line equality and ERP-order equality or both ERP-order values NULL.

Effects: reads SHIPMENT_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/2094278866.sql), lines 1–47; original definition SHA-256 `de06c2d9681fdd2373a9579cb7c012f9ed521bac65229c66ab64bf969291f37d`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentDetailVasActivity01

Read shipment-line value-added-service activity rows by internal line, without completing or executing any activity.

Effects: reads SHIPMENT_DETAIL_VAS_ACTIVITY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/2110278923.sql), lines 1–14; original definition SHA-256 `48c8e0c17e4b7e1441c197c283e9a126f55a1c683479408c84a6faedacbc5a2e`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentDetailVasActivity02

Read shipment-line value-added-service activity by OBJECT_ID.

Effects: reads SHIPMENT_DETAIL_VAS_ACTIVITY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/2126278980.sql), lines 1–15; original definition SHA-256 `6d66ee892e426eefa64798fd604e79e06c226a1b4f6ee491f720cef479f17b54`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentDetailVasActivity03

Read shipment-line value-added-service activity by activity ID and internal shipment line.

Effects: reads SHIPMENT_DETAIL_VAS_ACTIVITY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/2142279037.sql), lines 1–17; original definition SHA-256 `800c3f39760a3a057f2017ff797be369116ab7c044cc93284e080e9d433a7100`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentHeader01

Positive trailing-status input selects UPLOAD_ORDER_HEADER by internal shipment and exact trailing status. Zero, negative or NULL status selects SHIPMENT_HEADER by internal shipment without status restriction. The routine is a read in both branches.

Effects: reads SHIPMENT_HEADER; reads UPLOAD_ORDER_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/10795446.sql), lines 1–26; original definition SHA-256 `fea4a5d0e2d18128ea587176fad0161b0f44258a983552d874443f7892036c94`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentHeader02

Positive trailing-status input reads upload order headers by shipment ID and exact status; otherwise read operational shipment headers by shipment ID without status restriction.

Effects: reads SHIPMENT_HEADER; reads UPLOAD_ORDER_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/26795503.sql), lines 1–23; original definition SHA-256 `0ba056a43d479f09249280b432874bc9b6437ba8517f41d9715d1f5d88984cc7`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentHeader03

Return integer status 1 if any SHIPMENT_HEADER row matches the shipment ID, otherwise 0. SELECT assigns a variable; it does not return a row result set. This is an existence result, not operational success/failure validation.

Effects: reads SHIPMENT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1543324908.sql), lines 1–19; original definition SHA-256 `dceceb30e35e2b91b4109bf06fc3bcacff1ef11b370f19846330aa3fb4ca7ad7`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentHeader04

Read all shipment headers matching business shipment ID; no warehouse or status filter exists.

Effects: reads SHIPMENT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1559324965.sql), lines 1–15; original definition SHA-256 `43eef186d2e7327c14bb08eb4bf61dd917e554bce9e42c14e210654b2ea54fa3`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentHeader05

Read shipment headers with NULL upload batch and trailing status at least the requested threshold but below 997. There is no write, locking claim or batch-size limit.

Effects: reads SHIPMENT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/2082106458.sql), lines 1–16; original definition SHA-256 `188a74612c50191117c6389a2640d09e5f191189c368ad036ff797c5965f7a66`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentHeader06

Read shipment headers for LAUNCH_NUM; the routine does not launch, allocate or release them.

Effects: reads SHIPMENT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/2066106401.sql), lines 1–14; original definition SHA-256 `c503c9f2478991e822a01c97fd02e9541d12fde7797ba6397dba79e2c64e8c85`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentHeader07

Read shipment ID and warehouse from upload headers at a positive requested trailing status; otherwise read operational headers without status filtering.

Effects: reads SHIPMENT_HEADER; reads UPLOAD_ORDER_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/42795560.sql), lines 1–23; original definition SHA-256 `072879e97eb61e9eff6cc23c080327f783de3d9d2b6e6733a2d070ca6f017697`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentHeader08

Read operational shipment header by internal shipment and warehouse.

Effects: reads SHIPMENT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/58795617.sql), lines 1–18; original definition SHA-256 `6da79133ddf6372a3f629e1d2ddadc4dcdf504549156b3d0f67e114809e8b5ad`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentHeader09

Read operational shipment header by internal shipment with literal-normalized company equality.

Company normalization uses the same nonempty one-character sentinel on both sides; two NULL companies match and the sentinel value collides with NULL.

Effects: reads SHIPMENT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/74795674.sql), lines 1–18; original definition SHA-256 `bd2c11b79cd2a6a1ae0810d1ad7f11c946a563f1d70ae33caf8bd6b794a60714`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentHeader10

Positive trailing status reads upload headers; otherwise read operational headers. Both branches filter shipment ID, warehouse and exact-or-both-NULL company; only upload applies status equality.

Effects: reads SHIPMENT_HEADER; reads UPLOAD_ORDER_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1575325022.sql), lines 1–25; original definition SHA-256 `27406d6fe5317ce6c64f852e8e5bbcfcb15e70df168b34872ffd317c6855b2a6`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentHeaderVasActivity01

Read shipment-header value-added-service activities by internal shipment, without executing or completing them.

Effects: reads SHIPMENT_HEADER_VAS_ACTIVITY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/90795731.sql), lines 1–14; original definition SHA-256 `e9071944714cf505cc38c4b44ae73b61ad668f28999cf6e9dee1eaeb5794cb44`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentHeaderVasActivity02

Read shipment-header value-added-service activity by OBJECT_ID.

Effects: reads SHIPMENT_HEADER_VAS_ACTIVITY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/106795788.sql), lines 1–15; original definition SHA-256 `dd3aa865155f0ef3ebc2910f7e70d8f7a9c3f0e3c0368262b28e90acfa314ac8`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShipmentHeaderVasActivity03

Read shipment-header value-added-service activity by activity ID and internal shipment.

Effects: reads SHIPMENT_HEADER_VAS_ACTIVITY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/122795845.sql), lines 1–17; original definition SHA-256 `776d76664dc6bddf8ef92b9184c349e95fad9a9e11b6241a8d787d5222648965`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShippingContainer01

Read operational shipping container for zero interface link, otherwise upload order container for internal container and link. No parent or status restriction appears.

Effects: reads SHIPPING_CONTAINER; reads UPLOAD_ORDER_CONTAINER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1591325079.sql), lines 1–19; original definition SHA-256 `aeff4aefa43621c5e0660c55b610f1f5e9ec3df320232ab05d614a912d4d256e`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShippingContainer02

Read every operational shipping container matching business container ID; no warehouse filter is present.

Effects: reads SHIPPING_CONTAINER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1607325136.sql), lines 1–14; original definition SHA-256 `d564a671b14a683f39b9eeb315d7132bdcb06c07ee067d8353c2217c73c3fa41`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShippingContainer03

Read child containers by parent identifier and shipment lines having the supplied ERP line number. Upload uses INTERFACE_PARENT_LINK_ID plus link; operational uses PARENT_CONTAINER_ID. The shipment-detail subquery is not restricted by shipment or warehouse, so ERP line alone is not a globally unique business selector.

Effects: reads SHIPMENT_DETAIL; reads SHIPPING_CONTAINER; reads UPLOAD_ORDER_CONTAINER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1623325193.sql), lines 1–28; original definition SHA-256 `602c6dc0a883326ccc8c2a7ed1334a11b722f0d623d999e99edcb8fb07463ee0`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShippingContainer04

Read top-level containers for an internal shipment: operational PARENT must be NULL, or upload INTERFACE_PARENT_LINK_ID must be NULL plus link equality. Unlike receipt roots, zero is not explicitly accepted as a root.

Effects: reads SHIPPING_CONTAINER; reads UPLOAD_ORDER_CONTAINER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1639325250.sql), lines 1–22; original definition SHA-256 `1cde22ea8a3e3c770e1eba75d0035b47eb5b7141871f72fca9a4a9572d08d7cf`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShippingContainer05

Read immediate children using a text-typed parent input. Operational branch compares PARENT; upload branch compares INTERFACE_PARENT_LINK_ID and link. Target-column conversion can reject nonnumeric text when compared with a numeric parent.

Effects: reads SHIPPING_CONTAINER; reads UPLOAD_ORDER_CONTAINER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1655325307.sql), lines 1–20; original definition SHA-256 `9a05f5ed0a7c3ce5669c7a2614ec4b2e4df2a9314f4444572023f6f923918b3d`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShippingContainer06

Return child containers of the fixed container-type selector, UNION the addressed item-bearing container when it does not have that type. Join operational shipment detail for ERP order/line and left join pallet metadata for pallet ID. Upload branch uses link and upload parent fields; UNION removes identical full projected rows. No recursion or ORDER BY exists.

All four container-type literals use the same single-character special type. The child branch requires that type; the addressed item-bearing-container branch excludes it. A NULL container type passes neither equality nor inequality branch.

Effects: reads MULTI_ORDER_PALLET; reads SHIPMENT_DETAIL; reads SHIPPING_CONTAINER; reads UPLOAD_ORDER_CONTAINER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/138795902.sql), lines 1–53; original definition SHA-256 `c5811d172d07443e2d652582cb660b2cd6bb9493a8241790a7cdc200e67cd88f`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShippingContainer07

Read container by business ID from operational storage for interface link zero, otherwise from upload storage with link equality.

Effects: reads SHIPPING_CONTAINER; reads UPLOAD_ORDER_CONTAINER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/154795959.sql), lines 1–19; original definition SHA-256 `d46b7369301db902540228a0810b93744d303ec3a201622b1cd3e2d936201a53`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RShippingLoad01

Read shipping load by INTERNAL_LOAD_NUM; no load-status test or dispatch occurs.

Effects: reads SHIPPING_LOAD.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1671325364.sql), lines 1–13; original definition SHA-256 `246f5e1a46aa12934ed9028d567ff45bb9c1bde3db7afbd6293d11a29511c7e7`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RStorageTemplateDetail02

Read all storage-template details by template ordered by SEQUENCE.

Effects: reads STORAGE_TEMPLATE_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/170796016.sql), lines 1–15; original definition SHA-256 `3285c2679eb9e3924b25c47507b504ba80c769f3f14072a3ccb50c10c87771fb`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RStorageTemplateDetail03

Read storage-template detail rows having the minimum sequence for the requested template, with NULL template input replaced by fixed literal selectors. All tied minimum rows can return; no TOP 1 is used.

Both fallback literals name the same default storage template. NULL caller input uses that template; absent rows still yield no result.

Effects: reads STORAGE_TEMPLATE_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1687325421.sql), lines 1–16; original definition SHA-256 `4626a63dd5cc28752023c412dd436f8eae143982478d384f84e504a2e5d3a36f`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RStorageTemplateHeader01

Read storage-template header by exact template name without an ACTIVE test.

Effects: reads STORAGE_TEMPLATE_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1703325478.sql), lines 1–14; original definition SHA-256 `ed1001b8d0f8ad430eabc2e8c03dfc4f97280dd125206afafe73cb2ce4c7e142`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RStorageTemplateHeader02

Read storage-template headers whose names occur in generic-configuration SYS1VALUE for the item-class identifier and fixed record type. A NULL SYS1VALUE uses the fixed fallback literal, but a missing configuration row yields no candidate. No ACTIVE filter exists.

The fixed record-type category is item-class configuration, and NULL SYS1VALUE maps to the default storage-template name.

Effects: reads GENERIC_CONFIG_DETAIL; reads STORAGE_TEMPLATE_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1719325535.sql), lines 1–17; original definition SHA-256 `67c7d3f0fb9f72313dd72f50cdf555c03095cca02f6bd57a76f09bc424e14ee8`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RSystemConfigDetail01

Read system-configuration detail by exact system key and record type. No user-specific override or effective-setting precedence is evaluated.

Effects: reads SYSTEM_CONFIG_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/186796073.sql), lines 1–10; original definition SHA-256 `7fedbac1728218c9041b8904599087d79529245f03128ed540c3006458772777`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RTransactionHistory01

Read unbatched transaction-history rows for configured transaction types whose SYS2VALUE matches a fixed selector. Type patterns receive an additional gate: rows outside all three patterns pass, while a matching pattern requires reference type in adjustment types flagged for upload. Configuration and pattern literals are reviewed separately; this does not mark rows uploaded.

The private category denotes history transaction-type configuration and the upload-enabled value is affirmative. Prefix patterns begin with numeric character pairs forty, fifty and sixty followed by a wildcard. Types matching any of these patterns require an affirmative INCLUDE_IN_INTERFACE_UPLOAD adjustment-type reference. The body reads configuration; it does not establish current configured values.

Effects: reads ADJUSTMENT_TYPE; reads GENERIC_CONFIG_DETAIL; reads TRANSACTION_HISTORY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1730105204.sql), lines 1–33; original definition SHA-256 `b1a9a6dc71687c16644352c192e8941b0ef54906bafc50373845b344fd516c8a`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RUDownloadItem01

Claim every ready-or-NULL DOWNLOAD_ITEM row by setting in-process condition and caller process stamp, then return a marker column plus rows for that stamp excluding a fixed condition. There is no batch limit or separate transaction; reused stamps can return previously claimed rows, and NULL stamp can claim rows that its subsequent equality cannot return.

Private conditions: claim ready or NULL rows as in process; output excludes processed rows. The leading unnamed literal is an item-download record marker. Its raw spelling is not part of this explanation.

Effects: reads DOWNLOAD_ITEM; writes DOWNLOAD_ITEM.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/202796130.sql), lines 1–32; original definition SHA-256 `0481d364c1d5dfa9f69c2f5210e91dd7be58f4dbd87e9a84c31080762a5dd2ba`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RUDownloadItem02

Use dynamic TOP-limited item claiming, then return marker plus item rows for process stamp ordered by interface record ID, followed by AreRecordsRemaining. The remaining-record test is global, not restricted to the claimed stamp. Embedded SQL and condition meanings are reviewed separately; no general success OUTPUT exists.

Private dynamic stage updates DOWNLOAD_ITEM IDs selected with TOP MaxRecords among ready-or-NULL rows ordered by INTERFACE_RECORD_ID. It assigns in-process condition and process stamp through parameters. MaxRecords is interpolated as numeric text with no validation; negative or NULL limits are not handled explicitly. The first result set excludes processed rows and has an item-download marker plus all columns; AreRecordsRemaining returns a string-valued affirmative/negative digit according to any ready-or-NULL row remaining.

Effects: reads DOWNLOAD_ITEM; writes DOWNLOAD_ITEM; calls sp_executesql.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/218796187.sql), lines 1–51; original definition SHA-256 `d3c4dc47d509aff7982a0cedfde1a3664a003dc8637ede157efb6bd7d0b6446f`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RUDownloadOrderHeader01

Claim order headers, their details/containers, eligible comments and VAS records, and ready orphan records across those tables using successive UPDATEs. Detail/container parent paths do not require the child's ready condition. Orphan comment/VAS tests use OR between absent-header and absent-detail checks. Return six marker-prefixed result sets: header, detail, container, comment, header-level VAS, line-level VAS. NOLOCK parent reads and no enclosing transaction leave an interleaving window; process-stamp reuse broadens returned rows.

Private conditions: ready or NULL records are claimed as in process; linked-header/detail eligibility and returned rows exclude processed and error conditions. Six leading markers distinguish shipment header, detail, container, comment, header VAS and detail VAS records. Header VAS uses ERP line NULL or nonpositive; detail VAS uses positive line. Marker values are not reproduced.

Effects: reads DOWNLOAD_ORDER_COMMENT; reads DOWNLOAD_ORDER_CONTAINER; reads DOWNLOAD_ORDER_DETAIL; reads DOWNLOAD_ORDER_HEADER; reads DOWNLOAD_ORDER_VAS_ACTIVITY; writes DOWNLOAD_ORDER_COMMENT; writes DOWNLOAD_ORDER_CONTAINER; writes DOWNLOAD_ORDER_DETAIL; writes DOWNLOAD_ORDER_HEADER; writes DOWNLOAD_ORDER_VAS_ACTIVITY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/234796244.sql), lines 1–162; original definition SHA-256 `b694675765365f3d3d777111a525b0333b4a5c432433bc382303c44b912924bf`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RUDownloadOrderHeader02

Claim limited order-family roots using five dynamic stages with a decreasing MaxRecords variable, then propagate the stamp to linked detail/container/comment/VAS rows. Container propagation includes three repeated INTERFACE_LINK_ID passes plus a parent-link pass, not unlimited recursion. Return six interface-record-ordered result sets plus global AreRecordsRemaining across five tables. Linked children can exceed the requested root limit; @@ROWCOUNT after EXEC is not documented here as a proven exact budget mechanism.

Private dynamic stage order is order header, orphan detail, orphan container, orphan comment, orphan VAS. Each TOP subquery is ordered by INTERFACE_RECORD_ID and selects ready-or-NULL rows; only the header lacks orphan tests. Container orphan conditions are NULL link OR link absent from headers OR link absent from containers OR parent link absent from containers. Comment/VAS orphan tests use OR across absent header/detail. All stages mark in process; returned rows exclude processed and error. The aggregate uses UNION of table counts, so equal count values deduplicate, but the final greater-than-zero test still expresses whether any included count is positive. No SQL error recovery validates the budget or stored condition values.

Effects: reads DOWNLOAD_ORDER_COMMENT; reads DOWNLOAD_ORDER_CONTAINER; reads DOWNLOAD_ORDER_DETAIL; reads DOWNLOAD_ORDER_HEADER; reads DOWNLOAD_ORDER_VAS_ACTIVITY; writes DOWNLOAD_ORDER_COMMENT; writes DOWNLOAD_ORDER_CONTAINER; writes DOWNLOAD_ORDER_DETAIL; writes DOWNLOAD_ORDER_HEADER; writes DOWNLOAD_ORDER_VAS_ACTIVITY; calls sp_executesql.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/250796301.sql), lines 1–313; original definition SHA-256 `1cfe27215a2d90d97ac2c1a01d30f88b94b86546a65d56460d8ca03c49bc26d4`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RUDownloadReceiptHeader01

Claim purchase-order and receipt headers, related or orphan details/containers, appointment and serial records using successive writes, then return seven marker-prefixed result sets without ORDER BY. Appointment matching in this body queries DOWNLOAD_APPT_SCHEDULE itself; serial orphan detection consults receipt-header and serial tables, so expected business linkage must not replace the actual predicates. No encompassing transaction guarantees a family claim.

Private conditions: ready or NULL records are marked in process; result sets and most parent eligibility exclude processed records, without the order family's additional error exclusion. Appointment link-type selector denotes receiving. Seven unnamed record markers distinguish purchase-order header/detail, receipt header/detail/container, serial and appointment sets; their values are not reproduced.

Effects: reads DOWNLOAD_APPT_SCHEDULE; reads DOWNLOAD_PURCHASE_ORDER_DETAIL; reads DOWNLOAD_PURCHASE_ORDER_HEADER; reads DOWNLOAD_RECEIPT_CONTAINER; reads DOWNLOAD_RECEIPT_DETAIL; reads DOWNLOAD_RECEIPT_HEADER; reads DOWNLOAD_SERIAL_NUMBER; writes DOWNLOAD_APPT_SCHEDULE; writes DOWNLOAD_PURCHASE_ORDER_DETAIL; writes DOWNLOAD_PURCHASE_ORDER_HEADER; writes DOWNLOAD_RECEIPT_CONTAINER; writes DOWNLOAD_RECEIPT_DETAIL; writes DOWNLOAD_RECEIPT_HEADER; writes DOWNLOAD_SERIAL_NUMBER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/266796358.sql), lines 1–149; original definition SHA-256 `a7c0b80d20999809d02df268cd010036560a1175067d1b28b6651e480587377c`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RUDownloadReceiptHeader02

Claim receipt/purchase-order download roots using seven dynamic TOP stages and decrement the budget between stages; then propagate to linked detail/container/appointment/serial records. Return seven ordered data result sets plus AreRecordsRemaining. The final remaining-record query covers receipt/header/detail/container/appointment/serial tables but omits both purchase-order tables. Propagated children can exceed MaxRecords, and no overall atomic claim is implemented.

Private dynamic stage order is purchase-order header, orphan purchase-order detail, receipt header, orphan receipt detail, orphan receipt container, orphan receiving appointment, orphan serial. Each TOP selection orders INTERFACE_RECORD_ID and requires ready-or-NULL condition. Container orphan detection uses OR for absence from receipt-header/container; serial detection uses AND for absence from receipt-header and serial tables. Propagated appointments do not repeat the dynamic stage's receiving-link-type filter. Returned rows exclude processed but not error condition. AreRecordsRemaining uses only five receipt-side tables, omitting both purchase-order tables; equal counts deduplicate under UNION without altering the positive-existence interpretation.

Effects: reads DOWNLOAD_APPT_SCHEDULE; reads DOWNLOAD_PURCHASE_ORDER_DETAIL; reads DOWNLOAD_PURCHASE_ORDER_HEADER; reads DOWNLOAD_RECEIPT_CONTAINER; reads DOWNLOAD_RECEIPT_DETAIL; reads DOWNLOAD_RECEIPT_HEADER; reads DOWNLOAD_SERIAL_NUMBER; writes DOWNLOAD_APPT_SCHEDULE; writes DOWNLOAD_PURCHASE_ORDER_DETAIL; writes DOWNLOAD_PURCHASE_ORDER_HEADER; writes DOWNLOAD_RECEIPT_CONTAINER; writes DOWNLOAD_RECEIPT_DETAIL; writes DOWNLOAD_RECEIPT_HEADER; writes DOWNLOAD_SERIAL_NUMBER; calls sp_executesql.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/282796415.sql), lines 1–323; original definition SHA-256 `648d41b1389bca28b2af1a67aac280c09df55a5979374df476e2a5e2a351c6ce`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RUploadOrderDetail01

Read upload order detail by internal shipment line with no interface-link restriction.

Effects: reads UPLOAD_ORDER_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1735325592.sql), lines 1–6; original definition SHA-256 `6ff30f234a2d576aea56e938e847b19a3c6f4af9494e5befce279dd6219f5867`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RUploadOrderDetail02

Read upload order detail by internal shipment and interface link; no related-line exclusion exists.

Effects: reads UPLOAD_ORDER_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1751325649.sql), lines 1–10; original definition SHA-256 `b619805ce1cf0fafee3b2e9f87e18684c64770f024f7f61fde38d91032054390`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RUploadOrderHeader01

Read upload order header by internal shipment, exact trailing status and interface record ID. There is no branch to operational headers.

Effects: reads UPLOAD_ORDER_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1767325706.sql), lines 1–15; original definition SHA-256 `a49016103888bc154292eb9ae05788281403595e1122150927f6de810d277a2d`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RUploadOrderHeader02

Read upload order headers for one fixed interface-condition selector, with no caller input, batch limit or ordering.

The fixed interface condition denotes system-deletion upload records.

Effects: reads UPLOAD_ORDER_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1570104634.sql), lines 1–16; original definition SHA-256 `b5b42afbcbbf1ba3c0669a9ebf1dcbbb44a2fc1f139623ad4f7fcdc8e5f234d1`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RUReceiptContainer05

Read an interface-shaped receipt-container tree using a recursive CTE. The anchor predicate is PARENT IS NULL OR (PARENT=0 AND batch-related condition), so every NULL-parent row qualifies regardless of batch. Recursive children require the batch. Roots link to receipt identity; children link to parent container. Return the explicit interface projection excluding tree, sorted lexically by a varchar(128) path. No MAXRECURSION override, cycle guard, write or transaction exists despite RU naming.

Private constants create a receiving-interface-batch process label, a new-action label, a processed-condition label and slash-separated tree path. The projected UTC stamp is rounded to seconds. These are returned interface labels, not writes to the source container rows.

Effects: reads RECEIPT_CONTAINER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/298796472.sql), lines 1–280; original definition SHA-256 `2ea9347a7a42f8c1a926028cc9cbcfba0af697cb4c0b637c170c3a2528321b26`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RUReceiptHeader01

Execute four dynamic receipt-upload batch-marking statements with optional stored filter criteria, then return the UNION of headers referenced by batch-marked containers and headers directly batch-marked. Dynamic statement bodies are reviewed separately. Warehouse input supplies the warehouse-local date; it is not automatically a row filter. Missing named filter text can NULL the concatenated query when the name condition still passes.

Private statements in order: (1) batch unbatched receipt line-containers with status at least Sts, joined to their header; (2) batch unbatched parent containers with line number NULL/zero whose children already bear BatchId; (3) batch closed unbatched headers joined to receipt detail, warehouse and optional company when detail-company settings permit zero-quantity-line uploads, using warehouse fallback only for a NULL detail company; (4) batch closed unbatched headers with TOTAL_CONTAINERS=0 when company allows zero-container uploads, using warehouse fallback only for NULL header company. Step 3 does not itself test a detail quantity despite its flag name. Each optional filter is appended after AND without added parentheses, so OR in stored text retains SQL operator precedence. Four executions are separate; no encompassing transaction exists.

Effects: reads COMPANY; reads FILTER_CONFIG_DETAIL; reads RECEIPT_CONTAINER; reads RECEIPT_DETAIL; reads RECEIPT_HEADER; reads WAREHOUSE; writes RECEIPT_CONTAINER; writes RECEIPT_HEADER; calls GetWarehouseTimezoneValue; calls sp_executesql.

The captured receipt UPDATE trigger exists, but this body updates upload batch without targeting TRAILER_ID, so its documented trailer-column gate does not enter for that statement.

Source: [complete retained body](sql/314796529.sql), lines 1–140; original definition SHA-256 `eb37f482b9d009aee040d6d00903b039d6073b4faeeef4ef5a46c1c95f61d2e9`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RUReceiptHeader02

Execute the receipt-detail-completion variant of four dynamic batch-marking statements, then UNION related/direct batch headers. Full private SQL establishes the extra OPEN_QTY and sibling-container tests; the shared wrapper alone cannot distinguish this variant. Stored filter text is concatenated while status, batch and warehouse date are parameterized.

Private first statement requires unbatched positive-line containers at or above Sts, matching header and detail, and (detail OPEN_QTY=0 OR exactly one closed matching header), plus no container below Sts for that detail. Second statement marks parents and additionally joins RECEIPT_DETAIL by receipt number. Third/fourth header statements use the same company-first, NULL-company warehouse fallback as RUReceiptHeader01; the line-upload flag does not add an explicit quantity predicate. Filters are appended without parentheses. The dynamic variant is not identical to the read-only RReceiptHeader05 conditions.

Effects: reads COMPANY; reads FILTER_CONFIG_DETAIL; reads RECEIPT_CONTAINER; reads RECEIPT_DETAIL; reads RECEIPT_HEADER; reads WAREHOUSE; writes RECEIPT_CONTAINER; writes RECEIPT_HEADER; calls GetWarehouseTimezoneValue; calls sp_executesql.

The captured receipt UPDATE trigger exists, but this body updates upload batch without targeting TRAILER_ID, so its documented trailer-column gate does not enter for that statement.

Source: [complete retained body](sql/330796586.sql), lines 1–157; original definition SHA-256 `37360be2efe79e5dac8f52afbdab88c6e1fa82a03eeba2ec55bd7f1db20e7570`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RUReceiptHeader03

Execute the receipt-status variant of four dynamic batch-marking statements, then UNION related/direct batch headers. Private SQL preserves the status/closed-date predicate as written, including NULL-comparison behavior. Stored filter criteria are appended rather than independently validated.

Private first statement requires unbatched positive-line containers at or above Sts and either header leading/trailing statuses both at least Sts, or header CLOSE_DATE IS NOT NULL with minimum container status at least Sts. Unlike read-only RReceiptHeader06, it uses IS NOT NULL and >= status comparisons. Parent marking is followed by the two closed-header flag branches. In the third statement warehouse UPLOAD_REC_LINES_ZERO_QTY can authorize inclusion even with non-NULL detail company; the fourth zero-container statement still limits warehouse fallback to NULL header company. Optional filters are appended without parentheses.

Effects: reads COMPANY; reads FILTER_CONFIG_DETAIL; reads RECEIPT_CONTAINER; reads RECEIPT_DETAIL; reads RECEIPT_HEADER; reads WAREHOUSE; writes RECEIPT_CONTAINER; writes RECEIPT_HEADER; calls GetWarehouseTimezoneValue; calls sp_executesql.

The captured receipt UPDATE trigger exists, but this body updates upload batch without targeting TRAILER_ID, so its documented trailer-column gate does not enter for that statement.

Source: [complete retained body](sql/346796643.sql), lines 1–148; original definition SHA-256 `454bd71df901d53cd87b55fa63f728b62a11e8ab79d8cbcbad7faf7d2456afec`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RUShipmentHeader01

Capture eligible shipment IDs using a NOLOCK shipment read joined to a shipping load, requiring NULL upload batch, trailing status in the requested-to-below-997 interval and load not carrying the confirmation selector. Update those IDs to BatchId, then return all headers already bearing BatchId. The update does not recheck eligibility; no transaction prevents another worker from claiming the same selected IDs.

The excluded IN_CONFIRMATION selector is affirmative. NULL load confirmation fails the inequality, and shipments lacking a matching shipping load fail the inner join.

Effects: reads SHIPMENT_HEADER; reads SHIPPING_LOAD; writes SHIPMENT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/362796700.sql), lines 1–32; original definition SHA-256 `f92c971152f7344666dc342ba35eddace8bc23e5043a5030897cb35f209923bf`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RUShipmentHeader02

Overwrite upload batch for every shipment header in the requested launch number, even if already batched, then return all headers with the supplied batch ID. The returned set can include prior same-batch rows outside this wave. No status, NULL-batch or shipping-load test exists.

Effects: reads SHIPMENT_HEADER; writes SHIPMENT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/378796757.sql), lines 1–22; original definition SHA-256 `04c0760f00d5f3bd7f006528e39bf7dee407da986677b43ed712dd90e74d2663`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RUTransactionHistory01

Despite RU naming, perform a read only: return transaction history for upload batch plus maximum numeric catch-weight attribute and maximum weight-unit attribute via OUTER APPLY. TRY_CAST invalid weights become NULL; maxima are calculated independently and can come from different attribute rows. Order by activity timestamp without a tie breaker.

The private attribute selectors represent catch weight and catch-weight unit. TRY_CAST uses numeric(14,5); multiple values aggregate independently, and invalid weight text contributes NULL.

Effects: reads TRANSACTION_HISTORY; reads TRANS_HIST_ATTRIBUTES.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/394796814.sql), lines 1–47; original definition SHA-256 `f0c4c8c009a04f0e9799463342769335f29379b0d0a56cf6846348611d39e9b8`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RVasActivity01

Read VAS activity definition by NAME without an ACTIVE restriction or activity execution.

Effects: reads VAS_ACTIVITY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/426796928.sql), lines 1–15; original definition SHA-256 `a709c37ead195af25527f2717975cae57f4941791537ce8ff20d08cebe403f30`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RVendor02

Read vendor by source ID, requested-or-NULL ship-from and requested-or-NULL company; order ship-from descending then company ascending. The procedure returns all matches, so generic company can sort before specific company within a ship-from value.

Effects: reads VENDOR.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1799325820.sql), lines 1–22; original definition SHA-256 `42decbef14f27719c2714867ab66eb7fd68d24fd883cde21ee19c93073151086`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RVendor03

Read vendor by source ID and requested-or-NULL company ordered by company ascending. No TOP makes this a guaranteed single preferred vendor record.

Effects: reads VENDOR.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1815325877.sql), lines 1–20; original definition SHA-256 `9f9c5f782ccad87a0fb4f41957da0e40fab8df6ac790b9c718e85d6abcdcb6e3`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RWarehouse01

Read warehouse metadata by warehouse code, without active filtering.

Effects: reads WAREHOUSE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1831325934.sql), lines 1–13; original definition SHA-256 `19577254a6520a45484e9bbf9122aea045a50d20bd8acc9078890353512b92fa`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RWarehouse02

Read warehouse metadata by code and fixed ACTIVE selector.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads WAREHOUSE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1847325991.sql), lines 1–15; original definition SHA-256 `bb94219eaa4151ab592f18af9339833e4cc94a3e6589fa23d194539a7d725cc7`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RWarehouse03

Read all warehouses carrying the fixed ACTIVE selector; no input or ORDER BY exists.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads WAREHOUSE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1863326048.sql), lines 1–7; original definition SHA-256 `ffcfcd6fdac46498e69b74355d905bd9fc65387f5dbafaa3c645668c1ac35c00`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RWarehouseAlert01

Read warehouse-alert definition by internal alert number, without requiring ACTIVE.

Effects: reads WAREHOUSE_ALERT.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1879326105.sql), lines 1–13; original definition SHA-256 `f67d73f629e71ef5af0b20a46e90af49409d49627a0b78291e3573347e0fa76a`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_RWarehouseAlert02

Read warehouse-alert definitions by alert type and fixed ACTIVE selector; no notification is sent.

Private scalar review confirms that the fixed flag selector is the affirmative value. This is a predicate in the source, not an observation of any stored row or effective setting.

Effects: reads WAREHOUSE_ALERT.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1895326162.sql), lines 1–16; original definition SHA-256 `948c87049fadb0d1614f9bd3806751db895bb39ede97bec6ff62aa1ef30e2c0c`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UAppointmentSchedule01

Replace appointment dock, start/end, user fields and stamps for every row sharing INTERNAL_RECEIPT_NUM. The update is not keyed by appointment OBJECT_ID and can affect several appointments. No schedule-conflict check or affected-row OUTPUT is present.

Effects: writes APPOINTMENT_SCHEDULE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/442796985.sql), lines 1–47; original definition SHA-256 `d37094b7432d2e1f30c5efcb82ff571032d3554f582f2928e65c800ae2fdad6b`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UDownloadItem01

Set DOWNLOAD_ITEM interface condition for every row with the process stamp and report @@ROWCOUNT. No current-condition eligibility guard appears.

The assigned interface condition denotes processed. All rows for the stamp are updated regardless of previous state.

Effects: writes DOWNLOAD_ITEM.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1911326219.sql), lines 1–17; original definition SHA-256 `aa51da01a60ebe04171beb023b292c015ca825eefcea8504a95b892f6bdcdc3d`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UDownloadOrderHeader01

Update download order container, comment, VAS, detail and header in that order for the process stamp, excluding a fixed current condition in each table. Sum row counts into OUTPUT. Ordinary inequality excludes NULL current conditions too; no transaction wraps the five updates.

The assigned condition denotes processed, while rows currently in process are excluded. NULL current condition is also excluded by inequality. This is not an in-process-to-processed transition.

Effects: writes DOWNLOAD_ORDER_COMMENT; writes DOWNLOAD_ORDER_CONTAINER; writes DOWNLOAD_ORDER_DETAIL; writes DOWNLOAD_ORDER_HEADER; writes DOWNLOAD_ORDER_VAS_ACTIVITY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1927326276.sql), lines 1–45; original definition SHA-256 `e76a0399e40cb6ac69b5229d1f0ca1f22d53d12ac3e50bf940ca05584fcf1703`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UDownloadOrderHeader02

Set the download condition for container, comment, detail and header by process stamp, summing row counts. Unlike variants 01/03/04 this body does not update VAS rows and has no current-condition guard.

The assigned condition denotes processed; every stamp-matching row in its four target tables is eligible.

Effects: writes DOWNLOAD_ORDER_COMMENT; writes DOWNLOAD_ORDER_CONTAINER; writes DOWNLOAD_ORDER_DETAIL; writes DOWNLOAD_ORDER_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1943326333.sql), lines 1–35; original definition SHA-256 `8cb58cec7e599bf15f5036aad781e4c8f49b682feb2aefbaf40791433a5a0842`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UDownloadOrderHeader03

Reset interface condition to NULL only for stamp-matching download container/comment/VAS/detail/header rows carrying the fixed condition. Keep process stamp, sum affected counts and do not delete rows.

Only error-condition rows for the stamp are reset to NULL, enabling later ready-or-NULL claim logic. This body does not clear the process stamp.

Effects: writes DOWNLOAD_ORDER_COMMENT; writes DOWNLOAD_ORDER_CONTAINER; writes DOWNLOAD_ORDER_DETAIL; writes DOWNLOAD_ORDER_HEADER; writes DOWNLOAD_ORDER_VAS_ACTIVITY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/458797042.sql), lines 1–44; original definition SHA-256 `d058d1988a3694ba9b0762d173619f32d11fce02e0162cbe47cda19978048461`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UDownloadOrderHeader04

Change one fixed current interface condition to another across download container/comment/VAS/detail/header rows for the process stamp, summing counts. No explicit transaction or recovery is present.

Only in-process rows for the stamp are changed to error condition.

Effects: writes DOWNLOAD_ORDER_COMMENT; writes DOWNLOAD_ORDER_CONTAINER; writes DOWNLOAD_ORDER_DETAIL; writes DOWNLOAD_ORDER_HEADER; writes DOWNLOAD_ORDER_VAS_ACTIVITY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/474797099.sql), lines 1–44; original definition SHA-256 `7cfcc7325acc54dd6b94e11ebc621a6d4cbcf020016cd94847a3f7aedff86f1a`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UDownloadReceiptHeader01

Set interface condition by process stamp across receipt container, detail, header, serial, receiving-linked appointment, purchase-order header and detail in that order. Sum row counts; only appointments have an additional link-type selector. No current-condition guard or global transaction exists.

All assigned conditions denote processed, with receiving link type additionally required for appointment rows.

Effects: writes DOWNLOAD_APPT_SCHEDULE; writes DOWNLOAD_PURCHASE_ORDER_DETAIL; writes DOWNLOAD_PURCHASE_ORDER_HEADER; writes DOWNLOAD_RECEIPT_CONTAINER; writes DOWNLOAD_RECEIPT_DETAIL; writes DOWNLOAD_RECEIPT_HEADER; writes DOWNLOAD_SERIAL_NUMBER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/490797156.sql), lines 1–55; original definition SHA-256 `1a08ceea9b5f8f13583c398a31a665b5352078de11abc4d61ab7fea58c6a50fe`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UItemUnitOfMeasure08

Increment matching item-unit SEQUENCE by one only when a same-scope target-sequence row for another unit exists, an immediately preceding-sequence row exists, and conversion quantity exceeds the input. Item non-NULL uses requested-or-generic company scope; item NULL uses item class. This shifts qualifying rows in one UPDATE but does not insert the requested unit, guarantee contiguous results or prevent concurrent resequencing.

Effects: reads ITEM_UNIT_OF_MEASURE; writes ITEM_UNIT_OF_MEASURE.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/1170103209.sql), lines 1–44; original definition SHA-256 `422cf97e2ee33d1b806e2f310a1b01932b8a6330f3558244c70719e095678405`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UOrderDetail01

Replace the listed ORDER_DETAIL fields by internal detail ID, including caller quantities, status-flow and business references, then return row count. NULL values overwrite existing listed fields; there is no partial-update or old-version predicate.

Effects: writes ORDER_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/506797213.sql), lines 1–270; original definition SHA-256 `9dc4a9a23c1f536cca320eb1c6223bbaeeb26dc700bf1fe4c3cfe6b221ead8fc`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UOrderHeader01

When OrderDate is NULL, first read the existing ORDER_DATE by internal order ID and reuse it; then replace the listed header fields and return row count. Other NULL fields overwrite directly. The separate read/update has no version check and can overwrite a concurrent change.

Effects: reads ORDER_HEADER; writes ORDER_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/522797270.sql), lines 1–251; original definition SHA-256 `e010ae5cd8d70bee18e112f9d63bb0d6acd62483318be1fc6bb64c4ab7b80cd5`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UPurchaseOrderDetail01

Replace listed purchase-order detail fields by OBJECT_ID, including open/total quantities and parent IDs. No affected-row OUTPUT, old-value guard or quantity recomputation is present.

Effects: writes PURCHASE_ORDER_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/538797327.sql), lines 1–107; original definition SHA-256 `75343f25742f496695adc984a05e999b25558c6eb35baef89bba2401309352de`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UPurchaseOrderHeader01

Replace listed purchase-order header fields by OBJECT_ID, including closed/created times, status, warehouse and addresses. NULL inputs write NULL; no lifecycle-transition validation is performed.

Effects: writes PURCHASE_ORDER_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/554797384.sql), lines 1–106; original definition SHA-256 `8632bea779e298ec848ce5cd46ae020cc18849f97484b2467001521acb97bcb5`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UReceiptContainer01

Replace listed receipt-container fields by internal receipt-container ID, including quantity/status, parent/location, upload batch and QC metadata; return row count. EPC, URI and CREATED_BY are not assigned by this update although the insert supplies them.

Effects: writes RECEIPT_CONTAINER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/570797441.sql), lines 1–125; original definition SHA-256 `2370b64f78d2c7c9d295787ae41d8fdc4aa8f7ff868ddf4ebc20b02d94025cb5`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UReceiptDetail01

Replace receipt-detail fields by internal receipt line, including total/open/original quantities, conversion values and purchase-order linkage; return row count. The body neither recalculates these values nor updates a header/container.

Effects: writes RECEIPT_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/586797498.sql), lines 1–179; original definition SHA-256 `ea0966696619afe9c2db323b75cc22280076b5478bfacec0f6393315fe08a87a`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UReceiptHeader01

Replace receipt-header fields by internal receipt number, including totals, close time, leading/trailing status and creation stamps; return row count. Upload batch is not assigned by this body.

Effects: writes RECEIPT_HEADER.

This UPDATE explicitly targets TRAILER_ID, so the captured AFTER UPDATE receipt trigger can refresh or clear the yard link and overwrite stamps, even if the trailer value is unchanged.

Source: [complete retained body](sql/602797555.sql), lines 1–170; original definition SHA-256 `4b0fd5c1c02fad4d6488f971621280cf611b2b06344adfb180b16154fc4d6339`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UReceiptInterfaceBatch

Clear upload batch on matching receipt headers first, then receipt containers. No row result or affected-row OUTPUT is declared, and no explicit transaction encloses both updates.

Effects: writes RECEIPT_CONTAINER; writes RECEIPT_HEADER.

The captured receipt UPDATE trigger exists, but this body updates upload batch without targeting TRAILER_ID, so its documented trailer-column gate does not enter for that statement.

Source: [complete retained body](sql/618797612.sql), lines 1–14; original definition SHA-256 `535d325b205407dba77f0931d69e972dbdadcf99aa450a1654ba0f3bba9f5caf`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UShipmentAccessorials01

Replace accessorial value, freight charges, user fields and stamps for the full internal-number/level/code/subcode tuple; return row count. The same key inputs are assigned back; ACCESSORIAL_DETAIL_ID is not changed by this update.

Effects: writes SHIPMENT_ACCESSORIALS.

Captured AFTER INSERT/UPDATE accessorial trigger may normalize negative INTERNAL_NUM using its association logic; the direct assignment is not necessarily the final stored value.

Source: [complete retained body](sql/634797669.sql), lines 1–53; original definition SHA-256 `de0b9b4d9b834e55faf0b2d4c5392e4b7f3974956d016a478c7bae02382470be`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UShipmentDetail01

Resolve NULL export classification/license/expiration inputs from an unordered header lookup by business shipment ID, then replace listed shipment-detail fields by internal line and report row count. Caller non-NULL export values win. LOGISTICS_UNIT is not updated although the insert accepts it; no optimistic concurrency predicate protects the broad replacement.

Effects: reads SHIPMENT_HEADER; writes SHIPMENT_DETAIL.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/650797726.sql), lines 1–332; original definition SHA-256 `a951f773f7166f4a4a27e7e4406dbfa85258fa503a8e44ad0b699a4251b0eb20`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UShipmentDetailVasActivity01

Update only INSTRUCTIONS of shipment-line VAS activity by OBJECT_ID; no stamp fields, completion flags or row-count OUTPUT are assigned.

Effects: writes SHIPMENT_DETAIL_VAS_ACTIVITY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/666797783.sql), lines 1–16; original definition SHA-256 `219ed0f6f715dc3c15d15ee8a16ee006d65e6ca26a81ec1784f3518572142ed2`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UShipmentHeader01

Replace listed shipment-header fields by internal shipment and return row count. Convert ShippingLoadNum zero to NULL; other values pass through. Extended user fields 9 through 20 and INTERNAL_CARRIER_NUM are absent from this update although supplied by the insert; creation fields are replaced.

Effects: writes SHIPMENT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/682797840.sql), lines 1–325; original definition SHA-256 `c43a342ccae0e721c05ca72a58940376477deb2c75caab84c61eb90f0f0043fa`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UShipmentHeader02

Clear shipment-header upload batch and replace PROCESS_STAMP with a fixed literal for rows in BatchId. No row-count OUTPUT is declared and no upload table is modified.

The fixed process-stamp value identifies this reset procedure rather than preserving the prior caller process stamp.

Effects: writes SHIPMENT_HEADER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/698797897.sql), lines 1–13; original definition SHA-256 `35e2902d3b3b7638b587b338703fa39978eb0315b02a91b9edda6d5f60d6d1d6`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UShipmentHeaderVasActivity01

Update only INSTRUCTIONS of shipment-header VAS activity by OBJECT_ID; no completion or execution occurs.

Effects: writes SHIPMENT_HEADER_VAS_ACTIVITY.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/714797954.sql), lines 1–16; original definition SHA-256 `540df4586a29060ed5255e8451b26b8b4ba211dfaeb0178e7ac34eca17a60480`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UShippingContainer01

Replace listed shipping-container fields by internal container and return row count. TREE_UNIT is assigned directly, including NULL, unlike the insert's self-identity fallback. ORIGINAL_PICK_LOC, pallet conversion fields, EPC/URI and QC_STATUS are not assigned here.

Effects: writes SHIPPING_CONTAINER.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/730798011.sql), lines 1–151; original definition SHA-256 `83c9ea247d28b260513786f126bb5ad53b58713d8aebf4f21d845875f0057885`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UShippingLoad01

Replace shipping-load status/date/carrier/closure/confirmation/dock and caller metadata by internal load, then return row count. No dispatch, shipment update or status-transition validation occurs.

Effects: writes SHIPPING_LOAD.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/746798068.sql), lines 1–77; original definition SHA-256 `95811c251abadca8627f77a0a559d93e6de5d4fd774cdc3b6a7695e1acf9df81`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

### dbo.wm_UWarehouseAlert01

Replace warehouse-alert definition fields by internal alert number and return row count. Updating action/template/message metadata does not send email or change existing alert-request records.

Effects: writes WAREHOUSE_ALERT.

No relevant captured DML trigger event is established for this body's direct operation. Read-only statements do not themselves fire DML triggers; foreign-key actions and transitive function/caller behavior are separate.

Source: [complete retained body](sql/778798182.sql), lines 1–57; original definition SHA-256 `86dc02bf12a7060526a3b43d2b67914348dcb837de9a863b7cfc5f71ed483dfd`. Exact declarations, output projections and column mappings are in the [contract batch](mappings/batches/warehouse-access-contracts.json).

## Evidence limits

The owner attests that the replica represents the current baseline; this work documents the retained captured source as-is. No new database connection or execution was performed.
Static source explains the stated routine behavior. Caller bindings, effective data/configuration, transaction isolation, permissions and end-user outcomes remain separately bounded.
Private strings and dynamic SQL were reviewed where necessary; public material contains only non-sensitive interpretations, identifiers and source fingerprints. It is not executable recovery SQL.
No table-role credit, new dynamic-backlog credit or unresolved-dependency resolution is claimed by this batch. Existing reviewed contracts are preserved.

The bodies contain no explicit transaction or custom error handler. Caller/session behavior and target constraints remain relevant. Recorded row counts and interface markers are not proof of successful end-to-end warehouse work. Stored filter text is concatenated as SQL syntax in the dynamic routines; its actual configured contents and transitive behavior were not acquired.
