# STAGE Receipt, Receipt Line and Receipt Container review

Observed **2026-10-02, 17:49:55–18:18:56 UTC**, on `travstg.manhscale.com`. All **3/3 assigned menu routes loaded**, all **3/3 default searches returned rows**, and one legitimate selected-record context was inspected for each Insight. Three corresponding record-detail types were opened and exited with **Cancel**. A later read-only Workbench load also succeeded.

The [sanitized runtime receipt](../evidence/stage-receipts-runtime.json) contains exact labels, counts, action states and limitations. These observations establish STAGE UI behavior for the sampled context. They do not establish parity with the earlier Prod replica capture, or complete all applicable review criteria. **Full functional reviews remain 0/3.** No business operation, configuration save, print or export was invoked.

## Coverage and counting

The routes were discovered in the visible STAGE Receiving menu before navigation. Initial empty grids were followed by authorized read-only searches; the initial empty state was not treated as an empty database. The default warehouse filter was retained, and the closed-record switch remained off. No business field values, receipt keys, account/warehouse values or screenshots were retained.

| Observed surface | Receipt 2777 | Receipt Line 2780 | Receipt Container 2779 |
|---|---:|---:|---:|
| Basic text/numeric/date/combo editors | 12 | 8 | 10 |
| Closed-record inclusion switch | 1 | 1 | 1 |
| Basic visible controls | 13 | 9 | 11 |
| Logical basic criteria | 12 | 9 | 11 |
| Advanced Field dropdown options | 167 | 91 | 209 |
| Representative operand families inspected | 3 | 3 | 3 |
| Actions visible before and after selection | 18 | 3 | 9 |
| Actions enabled with no selected record | 1 | 0 | 0 |
| Actions enabled for one selected record | 11 | 2 | 7 |
| Record-detail section headings | 9 | 8 | 7 |

Receipt Date From/To counts as two editors but one logical criterion. The totals are **33 basic controls / 32 logical criteria**, **467 advanced options**, and **9/9 representative operand families**. Dropdown counts describe the rendered catalogue; every field/operator/value combination was not tested. Full catalogues were inspected transiently; the receipt retains counts, boundary labels and representative samples rather than all 467 labels.

All three builders exposed the following sampled operator families:

| Family | Observed operands | Representative fields |
|---|---|---|
| Text | `!=`, `=`, contains, does not contain, is not null, is null | Receipt: Putaway Zone; Line: Receipt ID; Container: Receipt ID Type |
| Numeric | `!=`, `<`, `<=`, `=`, `>`, `>=` | Receipt: Total Lines; Line: Total Qty; Container: Quantity |
| Date | Numeric comparisons plus is not null / is null | Appointment Date; Receipt Date; Receipt Date (Receipt Container) |

The Receipt builder also exposed **All are met (AND)** and **Any are met (OR)**. Each advanced dialog was discarded through Cancel; no advanced criterion was saved or applied. The Receipt catalogue displayed **IMDCRAETED (Unknown Resource)**, an observed label issue whose cause was not investigated.

## Receipt Insight — 2777

Entry: `/scale/insights/2777`. Use this view to find receipt headers and inspect their line/container context. Basic criteria covered receipt ID/type, item, company, license plate, receiving dock, source name, ship from, receipt-date range, internal receipt number and warehouse, plus **Include Closed Receipts**. The visible result columns included receipt identity, company, trailer/location, receipt/closed dates, leading/trailing status and color.

With no selected row, only **New** was enabled among the 18 Actions entries. For the sampled row, enabled entries were **New, Edit, New Container, New Line, Assign Trailer ID, Check in, Create Pre-Check in Containers, Close, Print Preview, Print Default Docs and Print Selected Docs**. Delete, appointment actions, Cancel Close, Immediate Needs and Yard Check in & Out were disabled. These are observations of the menu's parent `li.disabled` CSS state, not proof of server eligibility or successful execution.

The visible receipt hyperlink opened `/scale/details/receipt/{record-key}`. It exposed an **editable form with Save and Cancel**, so a detail hyperlink must not be assumed to enforce read-only access. No field was changed. Nine sections were inspected: **Reference Info, Source, Ship From, Status, Carrier, Dates, Lines, Totals and User Defined**. The Lines grid exposed receipt-line detail links. Status included audit-field labels, but no user/date values were retained. Cancel returned to Receipt Insight.

No non-menu Workbench hyperlink was present in this detail form. The Insight's Check in action was not invoked. The separate read-only Workbench inquiry below provided that context safely.

## Receipt Line Insight — 2780

Entry: `/scale/insights/2780`. Basic criteria covered receipt ID/type, ERP order-line number, item, description, company, warehouse and internal receipt number, plus a closed-record switch. Results exposed receipt/type, ERP order-line number, item/description/company, total/open quantity, UM and color.

All three Actions entries were disabled without selection. Selecting one returned row enabled **Edit** and **Delete**; **Immediate Needs** remained disabled. No action was invoked, so the source-described deletion constraints and partial-failure behavior remain untested.

The row exposed both a receipt-header link and an ERP order-line link. The latter opened `/scale/details/receiptdetail/{record-key}` with Save/Cancel and editable controls. Eight section structures were inspected: **Item Info, Quantity Info, Item Dimensions, Item Characteristics, Processing Values, Reference Info, Categories and User Defined**. The labels distinguish total/open/original quantity, locating and putaway fields, ERP/internal/PO identities and item categories. Cancel returned to Receipt Line Insight.

## Receipt Container Insight — 2779

Entry: `/scale/insights/2779`. Basic criteria covered license plate, receipt ID, ERP order-line number, item/description, company, warehouse, internal receipt/line numbers and group number, plus **Show Closed**. Results exposed LP, group, status, item/description/company, quantity/UM, receipt ID and Status Failed, alongside icon/color columns. Status was present as a result column; this pass did not observe it as a separate basic editor.

All nine Actions entries were disabled without selection. For the sampled row, **Edit, Delete, Locate, Print Preview, Print Default Docs, Print Selected Docs and Remove From Group** were enabled; **Cancel** and **Immediate Needs** remained disabled. Unlocate was not exposed in this Insight menu. Its separate presence in the loaded Workbench does not establish Insight availability.

The LP hyperlink opened `/scale/details/receiptcontainer/{record-key}`. The result row also exposed receipt-header and Putaway Group Insight links; their selected-context branches were not traversed here. The detail form had editable controls and Save/Cancel. Seven section headings were reviewed: **Container Info, Contents, Status, Dates, Serial Number, Reference Info and User Defined**. Six exposed field labels. The expanded **Serial Number** panel was empty for this selected record; that is not coverage of a serial-controlled workflow. Cancel returned to Receipt Container Insight.

Across the three detail forms, **24/24 section headings** were inspected: **23 sections exposed field/grid labels**, while one conditional serial section was empty. Field-label inventories are in the JSON receipt. These counts describe the selected-record layouts; different records, roles and preferences may expose different controls or prompts.

## Workbench follow-up

A later inquiry at approximately **18:14–18:18 UTC** resolved the missing selected-receipt context from the [earlier Workbench shell review](STAGE_MONITOR_WORKBENCH.md). That earlier lookup's no-response observations remain valid history.

The retained primary help article [Checking In and Locating Product](../../AIM/reading/a357eac1f7ebf1b8fcf6edee90c086783da65f07d18fbdcc06236891e314cebc.md), **node n253**, explicitly describes the receipt-ID **Arrow** as displaying associated lines and containers. Subsequent Full Line/Check In steps perform processing. The original and reading-file SHA-256 hashes were rechecked against the prior source receipt before using this distinction.

A receipt ID was read transiently from a visible Receipt Insight result, entered into the already observed `/scale/trans/receiptWorkBench` screen and loaded using the right-arrow control. The preference remained unchanged. The identifier was never printed or saved, and its transient automation variable was cleared immediately after use.

All **3/3 loaded section structures** were inspected:

| Section | Observed structure |
|---|---|
| Lines | Populated grid with Line, Item, Description, Total Qty, Open Qty and UM |
| Containers | Populated grid with LP, Status, Type, Child, Item, Description, Qty, UM and Destination |
| Receipt Info | Receipt Type, Warehouse, Internal Receipt Number and quantity/count/weight/volume/value label groups |

Top Actions exposed **New Line** and **Cancel**, both enabled. The Container Actions menu exposed **Locate, Unlocate, Assign to Putaway Group, Check in, Check in All, Cancel Check in, Cancel Container, Immediate Needs and Putaway Group Insight**; all nine were disabled with no container selected. Processing labels **Partial Line, Full Line, All Lines, Cancel All, Unlocate All and Locate All** were visible but unused. Parent Container, Item and Company input controls were also present; no Quick Scan entry was submitted.

No line/container selection matrix, nested-child navigation, conditional prompt or operation was tested in the Workbench. The review left through the already observed Receipt Insight route, verified its title and closed the temporary inspection tab. The owner's Dashboard and Warehouse Mobile tabs remained open.

## Remaining work

- Exercise eligible read-only lookup, advanced-filter application, sorting/grouping, pagination and saved-search branches under a bounded plan. This pass only inspected representative advanced operands and performed default basic searches.
- Inspect multiple/mixed selections, additional status populations and alternate role/preference contexts. Enabled styling alone does not establish transaction eligibility.
- Traverse applicable selected-record tiles, serial-controlled and nested-container branches, and Workbench selected-line/container states without operational effects.
- Reconcile effective STAGE configuration and backend bindings with current UI evidence; the earlier Prod configuration map is separate evidence.
- Validate conditional errors and processing outcomes only under a separately defined safe test scope. No mutation was needed for this documentation pass.

No application error or authentication warning was observed on these bounded paths. This does not negate the separately recorded Monitor failures. Existing evidence, the six owner-deferred mobile gaps and the **0/34 deployment/correlated-timing boundary** remain unchanged.
