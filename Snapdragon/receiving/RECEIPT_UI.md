# Receipt screens: UI evidence and reconstruction

Work package: SD-11 receipt subset. Current inspection: 2026-10-02, 16:47-16:50 UTC. This note covers Receipt 2777, Receipt Line 2780 and Receipt Container 2779. It combines a limited current observation with earlier browser evidence and retained configuration; it does not mark these screens fully reviewed.

## Current outcome

Receipt Insight loaded its static Basic Criteria and empty grid/detail layout. The application displayed `Token is not valid or expired`. One Actions-dropdown click left its child actions hidden while the same message remained. Dynamic work was paused without another route sweep or authentication manipulation. The temporary inspection tab was closed; original tabs were not modified. [Current sanitized evidence](../evidence/receiving-receipts-runtime.json).

| Measure | Completed / scope | Percentage / disposition |
|---|---:|---|
| Static reconstruction notes | 3 / 3 routes | 100%; documentary reconstruction only |
| Current landing structures observed | 1 / 3 routes | 33.33%; one session-limited observation |
| Current action-dropdown attempts | 1 / 3 routes | 33.33%; no successful menu expansion in this continuation |
| Current operand-option sets inspected | 0 / 3 routes | 0%; deferred for session renewal |
| Accepted full functional reviews | 0 / 3 routes | 0%; conditional/detail/action evidence remains open |

No search, record selection, business operation, print, export or configuration save was performed. Current evidence excludes input values, account values, saved searches and business rows. Basic field `disabled=false` or an action with no `aria-disabled` attribute is insufficient to prove business-action availability.

## Evidence boundaries and pending states

| State | Receipt 2777 | Receipt Line 2780 | Receipt Container 2779 |
|---|---|---|---|
| Basic criteria | Current placeholders observed; earlier labels retained | Earlier observation and configured labels | Earlier observation and configured labels |
| Advanced criteria | Earlier Field / Operand / Value structure; current expansion deferred | Same earlier structure; current visit deferred | Same earlier structure; current visit deferred |
| Operand choices | Not observed | Not observed | Not observed |
| Grid feature/column controls | Launch controls observed; options unopened | Current inspection deferred | Current inspection deferred |
| Empty detail layout | Current blank header placeholders observed | Metadata reconstruction only | Metadata reconstruction only |
| Action enablement | Current dropdown did not expand; prior labels available | Prior labels only | Prior labels only |
| Configuration child labels | Retained graph; no new editor traversal | Retained graph; no new editor traversal | Retained graph; no new editor traversal |

The earlier [runtime-root observations](../evidence/runtime-root.json) record all three pages as loaded, Actions inspected, and Advanced Criteria with Field, Operand and Value columns. They do not record the operand choices, validation behavior, selected-record states or service effects. Their header arrays do not provide per-header visibility, so the longer prior header lists below must not be treated as a current visible-column set. The [configuration graph](../database/screen-configuration-chains.json) records configured labels/relationships, including controls that may be hidden or conditional.

## Screen notes

### Receipt Insight - Form 2777, Screen 1781

The receipt-level page groups receipt identifiers, trailer/source context and receipt dates. Its configured detail header contains receipt identity and leading/trailing status, with Lines and Containers indicator controls. These labels support the receipt-header role; the indicator destinations and selected-record behavior were not exercised.

Configured runtime route: `/scale/insights/2777`. Form data source: `METADATA_INSIGHT_RECEIPT_VIEW`. Earlier successful observation: **2026-10-02T15:13:07.051Z**. [Full structural dossier](../screens/by-id/form-2777_screen-1781.md).

**Configured basic criteria** (metadata labels; prior browser placeholders corroborate the entry fields):

| Control ID | Name | English label |
|---:|---|---|
| 51816 | BasicCriteriaReceiptId | Receipt ID |
| 51817 | BasicCriteriaReceiptIdType | Receipt ID Type |
| 51818 | BasicCriteriaItem | Item |
| 51819 | SearchPaneCompany | Company |
| 51820 | BasicCriteriaReferenceLicensePlate | License Plate |
| 51821 | BasicCriteriaReceivingDock | Receiving Dock |
| 51822 | BasicCriteriaSourceName | Source Name |
| 51823 | BasicCriteriaShipFrom | Ship From |
| 51824 | BasicCriteriaReceiptDate | Receipt Date |
| 51825 | BasicCriteriaInternalReceiptNum | Internal Receipt Number |
| 51826 | SearchPaneWarehouse | Warehouse |
| 51827 | BasicCriteriaIncludeClosedRec | Include Closed Receipts |

Advanced Criteria is group **18157**, with control **51828** `SearchPaneAdvCrit`. The earlier browser observation shows **Field / Operand / Value**. Exact available fields, field-dependent operand choices, value-editor behavior, Add/remove behavior and validation remain unverified.

**Earlier captured grid-header labels** (not a visibility guarantee): Receipt ID; Receipt ID Type; Company; Trailer ID; Trailer Location; Receipt Date; Closed Date Time; Leading Status; Trailing Status; Receipt Type; Purchase Order ID; Source ID; Source; BOL Number; Packing List ID; BOL/PRO/Tracking Num; Seal ID; Priority; Appointment Scheduled; Internal Receipt Number; Leading Status (Numeric); Trailing Status (Numeric); Immediate Needs Request Created; QC Inspection; Scheduled Date; Icon; Color.

**Earlier visible Actions (18):** New; Edit; Delete; New Container; New Line; Assign Trailer ID; New Appointment; Edit Appointment; Delete Appointment; Cancel Close; Check in; Create Pre-Check in Containers; Close; Print Preview; Immediate Needs; Print Default Docs; Print Selected Docs; Yard Check in & Out.

The configured Actions group **18154** contains **20** controls. Its full set differs from the earlier visible menu; consult the linked dossier for configured-but-unobserved entries. No action is marked executable merely because its label exists.

**Configured detail children** (not selected-record runtime evidence):

| Group ID / name | Control IDs / configured names |
|---|---|
| 18164 / DetailPaneHeaderPanel1 | 51837 DetailPaneHeaderReceiptID; 51838 DetailPaneHeaderShipFromName; 51839 DetailPaneHeaderTrailingSts; 51840 DetailPaneHeaderLeadingSts |
| 18165 / indicatorpane | 51841 ReceiptInsightWavedIndicatorTileLines (Lines); 51842 ReceiptInsightWavedIndicatorTileContainers (Containers) |

**Configuration parts:** 4404 SaveSearchModalDialog; 4405 GadgetCalculationQueryDialog; 4406 InsightMenuPane; 4407 SearchPane; 4408 ListPane; 4410 DetailPane; 4409 AssignTrailerModalDialog.

Current blank header elements were `DetailPaneHeaderReceiptID`, `DetailPaneHeaderShipFromName`, `DetailPaneHeaderTrailingSts` and `DetailPaneHeaderLeadingSts`. The receipt-ID anchor had no usable `href`. Lines/Containers indicator containers were present. The empty pager was observed; it does not establish an executed query or the absence of receipts in the warehouse. No row-dependent accordion, link destination or detail value was inspected.

Current visible list headers: Receipt ID; Receipt ID Type; Company; Trailer ID; Trailer Location; Receipt Date; Closed Date Time; Leading Status; Trailing Status; Color. The `select columns` link and per-header `Feature chooser` controls were present. Their option menus were not opened.

### Receipt Line Insight - Form 2780, Screen 1783

The line-level page exposes receipt identity, ERP order line, item and quantity columns. Its configured detail header contains ERP line and item context, with a Containers indicator. This supports line review and its relation to container-level work; selected-record navigation was not exercised.

Configured runtime route: `/scale/insights/2780`. Form data source: `METADATA_RECEIPT_INSIGHT_VIEW`. Earlier successful observation: **2026-10-02T15:13:12.028Z**. [Full structural dossier](../screens/by-id/form-2780_screen-1783.md).

**Configured basic criteria** (metadata labels; prior browser placeholders corroborate the entry fields):

| Control ID | Name | English label |
|---:|---|---|
| 51913 | BasicCriteriaReceiptId | Receipt ID |
| 51914 | BasicCriteriaReceipttype | Receipt Type |
| 51915 | BasicCriteriaErpOrderLineNum | ERP Order Line Number |
| 51916 | BasicCriteriaItem | Item |
| 51917 | BasicCriteriaDescription | Description |
| 51918 | SearchPaneComp | Company |
| 51919 | SearchPaneWhs | Warehouse |
| 51920 | BasicCriteriaIntReceiptNum | Internal Receipt Number |
| 51921 | BasicCriteriaShowClosed | Show Closed |

Advanced Criteria is group **18202**, with control **51922** `SearchPaneAdvCrit`. The earlier browser observation shows **Field / Operand / Value**. Exact available fields, field-dependent operand choices, value-editor behavior, Add/remove behavior and validation remain unverified.

**Earlier captured grid-header labels** (not a visibility guarantee): Receipt ID; Receipt Type; ERP Order Line Number; Item; Description; Company; Total Qty; Open Qty; UM; Purchase Order ID; Purchase Order Line Number; Internal Receipt Num; Internal Receipt Line Number; Warehouse; Immediate Needs Request Created; Containers Created; Receipt Closed; Icon; Color.

**Earlier visible Actions (3):** Edit; Delete; Immediate Needs.

The configured Actions group **18199** contains **4** controls. Its full set differs from the earlier visible menu; consult the linked dossier for configured-but-unobserved entries. No action is marked executable merely because its label exists.

**Configured detail children** (not selected-record runtime evidence):

| Group ID / name | Control IDs / configured names |
|---|---|
| 18205 / DetailPaneHeaderPanel1 | 51928 DetailPaneHeaderErpOrderLineNum; 51929 DetailPaneHeaderItem; 51930 DetailPaneHeaderCompany; 51931 DetailPaneHeaderItemDesc; 51932 DetailPaneHeaderWebImage |
| 18206 / indicatorpane | 51933 ReceiptLineInsightIndicatorTileContainers (Containers) |

**Configuration parts:** 4417 SaveSearchModalDialog; 4418 GadgetCalculationQueryDialog; 4419 InsightMenuPane; 4420 SearchPane; 4421 ListPane; 4422 DetailPane.

### Receipt Container Insight - Form 2779, Screen 1782

The container-level page exposes license plate, receipt/ERP-line context, item, quantity and location-related columns. Its configured detail header contains container identity/type/status and item context. Locate and group-related action labels indicate additional workflows, but their prerequisites and operational results were not exercised.

Configured runtime route: `/scale/insights/2779`. Form data source: `METADATA_INSIGHT_RECEIPT_CONTAINER_VIEW`. Earlier successful observation: **2026-10-02T15:13:01.597Z**. [Full structural dossier](../screens/by-id/form-2779_screen-1782.md).

**Configured basic criteria** (metadata labels; prior browser placeholders corroborate the entry fields):

| Control ID | Name | English label |
|---:|---|---|
| 51869 | BasicCriteriaLicensePlateId | License Plate |
| 51870 | BasicCriteriaReceiptId | Receipt ID |
| 51871 | BasicCriteriaERPOrderLineNum | ERP Order Line Number |
| 51872 | BasicCriteriaItem | Item |
| 51873 | BasicCriteriaDescription | Description |
| 51874 | BasicCriteriaCompany | Company |
| 51875 | BasicCriteriaWarehouse | Warehouse |
| 51876 | BasicCriteriaInternalReceiptNum | Internal Receipt Number |
| 51877 | BasicCriteriaInternalReceiptLineNum | Internal Receipt Line Number |
| 51878 | BasicCriteriaInternalGroupNum | Group Number |
| 51879 | BasicCriteriaShowClosed | Show Closed |

Advanced Criteria is group **18182**, with control **51880** `SearchPaneAdvCrit`. The earlier browser observation shows **Field / Operand / Value**. Exact available fields, field-dependent operand choices, value-editor behavior, Add/remove behavior and validation remain unverified.

**Earlier captured grid-header labels** (not a visibility guarantee): Icon; Color; License Plate; Group Number; Status; Item; Description; Company; Quantity; Quantity UM; Receipt ID; Status Failed; Receipt Type; ERP Order Line Number; Internal Receipt Number; Immediate Needs Request Created; Max Status; To Location; Locating Rule; Internal Container Number; Status (Numeric); Warehouse; Used By Immediate Need; Group Closed.

**Earlier visible Actions (9):** Edit; Delete; Cancel; Immediate Needs; Locate; Print Preview; Print Default Docs; Print Selected Docs; Remove From Group.

The configured Actions group **18179** contains **11** controls. Its full set differs from the earlier visible menu; consult the linked dossier for configured-but-unobserved entries. No action is marked executable merely because its label exists.

**Configured detail children** (not selected-record runtime evidence):

| Group ID / name | Control IDs / configured names |
|---|---|
| 18185 / DetailPaneHeaderPanel1 | 51887 DetailPaneHeaderContainerID; 51888 DetailPaneHeaderContainerType; 51889 DetailPaneHeaderContainerStatus; 51890 DetailPaneHeaderItem; 51893 DetailPaneHeaderCompany; 51891 DetailPaneHeaderItemDesc; 51892 DetailPaneHeaderWebImage |

**Configuration parts:** 4411 SaveSearchModalDialog; 4412 GadgetCalculationQueryDialog; 4413 InsightMenuPane; 4414 SearchPane; 4415 ListPane; 4416 DetailPane.

## Resume after session renewal

1. In a new temporary tab, open the three configured routes and confirm that the expired-token message is absent. Preserve these failed/current observations rather than replacing them.
2. Expand Advanced Criteria and inspect its field selector and representative operand lists for text, numeric and date fields, without submitting a search. Record editor/operand differences and validation that can be observed without business queries.
3. Inspect a grid feature chooser and column chooser without changing or saving preferences. Record labels, visibility and the Cancel/X return path.
4. Inspect action-menu labels and disabled/selection clues in the empty state. Do not invoke the action. Link each semantic claim to its configured handler, parameter, checkpoint or product documentation.
5. Selected-record detail branches remain pending until legitimate context can be supplied within the read-only scope. Use visible read-only navigation when a representative record is necessary; retain layout and labels only. Do not invent IDs, invoke operational actions or retain business values.

Use the [coverage criteria](../reference/COVERAGE_CRITERIA.md). These notes do not satisfy the complete Search, List, Detail, Actions or Configuration dimensions on their own.
