# Receiving data and presentation dependencies

The retained Receiving configuration names **30 database-facing dependencies** across 37 references. **24/30 (80%)** match a unique object in the existing database snapshot. Those matches comprise **22 modules with existing static contracts** and **two tables**. Six names remain unmatched in that snapshot. Every candidate has a disposition in [backend-bindings.json](backend-bindings.json).

This reconciliation connects installed UI configuration names to previously reviewed database definitions. It does not establish the application's effective query, action implementation, current permissions or successful execution. The database snapshot is dated 2026-09-29; the UI configuration capture is dated 2026-10-02. No routine was executed and no business rows were queried.

## How the six Insight lists obtain their context

| Insight | Named list-view reference in configuration | What the existing static contract establishes |
|---|---|---|
| Purchase Order 2796 | [METADATA_INSIGHT_PURCHASE_ORDER_HEADER_VIEW](../../DB%20Architecture/objects/1216059418.md) | A header can appear once per associated line. Headers without lines remain. A related receipt is selected without a deterministic choice among multiple matches. |
| Purchase Order Line 2797 | [METADATA_INSIGHT_PURCHASE_ORDER_DETAIL_VIEW](../../DB%20Architecture/objects/1200059361.md) | A line remains when its optional header is missing. Receipt selection is not deterministic among multiple matches. Status display logic does not close or receive an order. |
| Putaway Group 2791 | [METADATA_INSIGHT_PUTAWAYGROUP_VIEW](../../DB%20Architecture/objects/1232059475.md) | Groups are combined with optional locations and containers. Several containers can produce several rows for one group. This view does not filter closed groups or execute putaway. |
| Receipt 2777 | [METADATA_INSIGHT_RECEIPT_VIEW](../../DB%20Architecture/objects/66359551.md) | Header, line, appointment, immediate-need and container relationships can multiply rows. Header totals repeat. The immediate-needs join has no warehouse predicate in this definition. |
| Receipt Line 2780 | [METADATA_INSIGHT_RECEIPT_LINE_VIEW](../../DB%20Architecture/objects/1280059646.md) | Containers and immediate-needs requests can multiply a line's rows. A missing header preserves the line. The immediate-needs join has no warehouse predicate in this definition. |
| Receipt Container 2779 | [METADATA_INSIGHT_RECEIPT_CONTAINER_VIEW](../../DB%20Architecture/objects/1264059589.md) | Optional header, line and group matches enrich each container. Header totals repeat; pre-check-in quantity may be NULL. The computed maximum status considers immediate children. |

These are the shapes of the underlying read models. The application's grouping, filtering and selected columns can change what an operator sees. **Do not count raw view rows as unique orders, receipts or lines, or sum repeated header totals, without reconciling the screen's query.** A configuration change to a field, grouping or summary can change the interpretation even when the source view stays the same.

Receipt Line has two different retained references: its Form `TABLE_NAME` is `METADATA_RECEIPT_INSIGHT_VIEW` (unmatched), while grid control **51927**, attribute **41051** `data-dbtable`, names `METADATA_INSIGHT_RECEIPT_LINE_VIEW` (matched). Both remain in the map. The matched grid reference does not repair the Form value or establish which reference the runtime uses.

## What selecting a record supplies to the detail pane

| Configured procedure | Returned context | Relevant limit |
|---|---|---|
| [POH_InsightDetailPaneData](../../DB%20Architecture/objects/1829229917.md) | Three result sets: PO header identity, receipt count and line count | An absent header can leave the first set empty while aggregate sets still return counts. Receipt business IDs are deduplicated independently of internal receipt identity. |
| [POD_InsightDetailPaneData](../../DB%20Architecture/objects/1813229860.md) | PO line identity plus optional item description/image | Missing item data leaves display fields NULL; `TOP 1` is unordered. It does not return received quantity or update the PO. |
| [PGPT_InsightDetailPaneData](../../DB%20Architecture/objects/1461228606.md) | Putaway group identity, warehouse, location and container count | A missing group returns no row. Separate minimum aggregates can come from different source rows. |
| [RCPT_InsightDetailPaneData](../../DB%20Architecture/objects/1957230373.md) | Receipt identity, ship-from, leading/trailing status, line/container totals and warehouse | An absent source row returns no pane row. `NOLOCK` does not guarantee a consistent committed result. |
| [RCPT_LineInsightDetailPaneData](../../DB%20Architecture/objects/1989230487.md) | Receipt/line/item context, then a distinct container count | Missing line context can coexist with a zero count result. Separate reads can disagree during concurrent changes. |
| [RCPT_ContainerInsightDetailPaneData](../../DB%20Architecture/objects/1925230259.md) | Container/item identity, description/image, status and warehouse | `NOLOCK` and unordered `TOP 1` limit consistency and deterministic selection. No container status is written. |

The configured association and returned field names explain the intended pane data. Live selected-record navigation and the exact frontend binding still need observation. A detail-pane retrieval procedure does not establish a Close, Delete, Check in or Locate action's backend behavior.

## Receipt Monitoring

Five configured routines divide monitoring into date categories, receipt types, vendor names, purchase-order context and indicator tiles. The existing contracts identify a drill sequence from dates through type and vendor to a PO result. That is a configured/static relationship; this session did not execute chart drilldowns.

- [Dates](../../DB%20Architecture/objects/2005230544.md) returns **overlapping warehouse-calendar categories**, then receipt, line and value totals. Adding chart buckets together can double-count receipts.
- [Types](../../DB%20Architecture/objects/2053230715.md) groups the selected date context by receipt type and returns summary totals.
- [Vendors](../../DB%20Architecture/objects/2069230772.md) uses the selected date/type context and returns vendor categories and summary totals.
- [Purchase orders](../../DB%20Architecture/objects/2037230658.md) returns a PO drill result and totals. The captured source gives the line tile a marker also named `SUMMARYTILE_TOTAL_RECEIPTS`; actual frontend handling remains unverified.
- [Indicators](../../DB%20Architecture/objects/2021230601.md) returns one requested receipt-aging, putaway-aging or QC indicator. An unknown tile selector returns no result. The caution/warning results are separate from proof of a warehouse exception.

These routines take filter context. Missing filter values remain NULL; duplicate filter keys can be assigned without ordering. This mapping does not supply a current warehouse setting or confirm that a displayed threshold has its default value.

## Workbench and related entry screens

[MetaTrans_ReceiptWorkbench](../../DB%20Architecture/objects/1125227409.md) prepares **ten result sets** containing presentation models, receiving preferences, locating rules, generic choices, statuses and companies. It also returns visibility/security flags. Those outputs prepare the screen; this procedure does not check in, locate, cancel, print or close records.

The reviewed contract distinguishes preference fallback selection from the returned preference dataset: authorization filtering used during fallback does not mean every returned preference row was filtered the same way. Missing user context can leave fallback unresolved. This is a source-level boundary, not a reproduced permission defect or current-user authorization result.

[MetaTrans_ApptSchedule](../../DB%20Architecture/objects/405224844.md) supplies an appointment presentation seed rather than reserving a dock. [MetaTrans_GetRecAppSchedule](../../DB%20Architecture/objects/917226668.md) returns receipt and appointment models; an absent appointment may produce a default, NULL-filled row. [MetaTrans_GetTrailerDetails](../../DB%20Architecture/objects/997226953.md) similarly returns a seed row even when receipt context was not found. A blank model is therefore not, by itself, evidence that a record was created or validated.

[MetaTrans_GetReceiptFromPO](../../DB%20Architecture/objects/933226725.md) selects the PO context for receipt presentation. It does not create a receipt. The separate action/controller contract would be needed to establish creation, validation and commit behavior.

## Unmatched names and table-only bindings

Six configured names have **no exact object match in the retained snapshot**:

- `METADATA_RECEIPT_INSIGHT_VIEW`
- `PurchaseOrderDetailView`
- `PurchaseOrderHeaderView`
- `ReceiptContainerView`
- `ReceiptDetail`
- `ReceiptHeaderView`

Some names may resolve through application models or other runtime mechanisms, but that has not been established. Do not silently replace them with similarly named SQL objects. The map preserves each owning form/control and the exact source identifier for follow-up.

`PURCHASE_ORDER_DETAIL` and `RECEIPT_DETAIL` match physical tables. A table match establishes schema identity, not a stored routine contract or permission to read/write its records.

## Evidence and reproducibility

The [machine-readable mapping](backend-bindings.json) retains all 37 source references, exact catalog identities, contract JSON pointers, original-definition fingerprints and hashes of the reused redacted evidence. All referenced retained evidence hashes matched. Existing static contracts were reused without relabeling them as a new full-body review.

Regenerate the deterministic join with `python Snapdragon/tools/build_receiving_backend.py`. This command reads local retained metadata and contracts only. It makes no database connection. Parent configuration and action bindings are in [CONFIGURATION.md](CONFIGURATION.md); operator-oriented behavior is in [FUNCTIONAL_GUIDE.md](FUNCTIONAL_GUIDE.md).
