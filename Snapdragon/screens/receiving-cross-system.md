# Receiving, Cross Application and System Management

Observed 2026-10-02 on `trav.manhscale.com`. The [runtime evidence](../evidence/runtime-root.json) records the actual URLs, timestamps, field labels, grid headers, available actions and limits. The [screen index](INDEX.md) binds these runtime destinations to their form and screen configuration records. Action names below describe available controls; no business action was submitted.

## Receiving

The receiving screens expose three related levels: purchase orders describe the expected order; receipts track the incoming receipt; receipt lines and containers expose item/quantity and license-plate detail. The runtime criteria explicitly connect these levels through Purchase Order, Receipt ID, Item, internal receipt identifiers and Group Number. This is observed navigation/context evidence, not proof that any receipt was processed.

| Screen | Form/route | Function and observed configuration surface |
|---|---|---|
| Appointment Calendar | `/scale/trans/apptschedule` | Dock-door schedule with hourly columns, Today/previous/next and Day/7 Days views. Actions exposes New. No appointment was selected or created. |
| Purchase Order Insight | 2796 | Header-oriented lookup by PO, receipt, source, ship-from, item, company, warehouse and created-date range; includes a closed-order switch. Grid includes PO, company, status, ship-from and source. Actions include New, Copy, Edit, Delete, New Line, Close, Cancel Close, document printing and Receipt From PO. |
| Purchase Order Line Insight | 2797 | Item/quantity view of order lines, with PO and internal line identifiers. Grid distinguishes Total Qty, Open Qty and UM. Actions exposes Copy, Edit and Delete. |
| Putaway Group Insight | 2791 | Locate groups by group ID, destination location, receipt, group number and warehouse. Grid shows group, warehouse and closed state. Actions exposes Close, Open and Rename. |
| Receipt Insight | 2777 | Receipt header lookup with receipt type, item, license plate, dock, source, ship-from, receipt date and internal receipt number. Grid includes trailer, receipt/closed dates and leading/trailing status. Actions includes New, Edit/Delete, New Container/Line, trailer and appointment controls, Check in, pre-check-in containers, Close/Cancel Close, Immediate Needs, printing and Yard Check in & Out. |
| Receipt Line Insight | 2780 | Receipt/item/ERP-line view with Total Qty, Open Qty and UM; receipt and internal identifiers provide context. Actions exposes Edit, Delete and Immediate Needs. |
| Receipt Container Insight | 2779 | License-plate and group-level lookup. Grid includes license plate, group, status, item, quantity/UM, receipt and status-failed indicator. Actions includes Edit, Delete, Cancel, Immediate Needs, Locate, printing and Remove From Group. |
| Receipt Monitoring | 4106 | Summary dashboard with Receipt Dates navigation, Refresh and Insight link. Labels include Total Receipts, Total Receipt Lines, Total Receipt Value, receipts over 24 hours old, pending putaways over four hours old and receipts with QC. Numerical results and drilldown behavior were not captured. |
| Receipt Workbench | `/scale/trans/receiptWorkBench` | Entry screen requires receipt context and a Receiving Preference. It exposes lookup, New, continuation/add controls and Actions > Cancel. No receipt context was entered. Downstream workbench states remain pending. |

## Cross Application

These screens provide cross-process investigation and entry to other SCALE surfaces. A searchable field is a criterion supported by the displayed page; the presence of a field does not establish its business-data quality or retention behavior.

| Screen | Form/route | Function and observed controls |
|---|---|---|
| Document Management Insight | 4105 | Find document references by reference ID/type/category, notes, file name, company, warehouse and timestamp. Grid exposes reference identity, notes, file name and date. No Actions menu was exposed in this inspection. |
| Interface Error Insight | 3054 | Investigate interface errors using process/mode, error/original file paths, message, date, reference fields and company/warehouse. Grid shows process, mode, message, error path and reference field. No Actions menu was exposed. |
| Process History Insight | 3066 | Look up process/action history by time, process, action, username, message, four identifiers and warehouse. View is exposed in Actions. The UI spells its identifier labels `Identifer`; evidence retains that spelling. |
| Transaction History Insight | 2783 | Investigate transaction history by time/type, location, item, lot, work context, LP/container, serial/reference and company/warehouse. Grid includes quantity/UM, catch weight/UM and direction. View is exposed; no record was selected. |
| Configuration | `/config` | Seven setup categories are displayed: Required Setup, Inbound, Outbound, Inventory Control, Work, System and SCALE Extend. SCALE Extend opens the modern Insight Architect. Its View All catalog lists one custom screen: Shipment Insight, form 2735, screen 1621, active. Publish/Activate/Deactivate/Delete/Edit controls were observed without invoking them. |
| Warehouse Mobile | `/WarehouseMobile` | Existing session opens a menu of 16 named functions, including receiving, inventory, work, putwall, nesting and QC. The menu is documented in [the landing evidence](../evidence/warehouse-mobile-landing.txt). No mobile workflow was started. |
| RF | `/RF/logon.aspx` | Existing session opens a Selection field and 12 numbered menu links, plus Ok/Logout. [The landing evidence](../evidence/rf-landing.txt) preserves labels only. No workflow or Ok action was invoked. |

## System Management

| Screen | Form/route | Function and observed controls |
|---|---|---|
| Activity Architect | `/WarehouseMobile/activityArchitect` | Screenflow catalog grouped into Receiving, Shipping, Cross Application, Inventory and Work, with Actions. This catalog inspection does not close the previously deferred mobile procedure gaps. |
| Audit Log Insight | 3067 | Diagnostic lookup by logged time, process stamp, method, class, exception, username and warehouse; Actions exposes View. |
| Background Job Queue Insight | 2795 | Request-time, process-type and process-status lookup. Actions exposes Reset. The effect and eligibility of Reset remain untested. |
| DIF Incoming Message Insight | 4094 | Incoming-message lookup by timestamp/status, data, endpoint/event description, message ID and error. Actions exposes Reset. Message bodies were not stored. |
| DIF Outgoing Message Insight | 4095 | Corresponding outgoing-message lookup with the same observed criteria and Reset action. Message bodies were not stored. |
| User Activity Insight | 3070 | Activity/session lookup by username, equipment, time, user type, region and assignment. Grid includes login, last-action and logoff times. Actions exposes Log Off Vocollect User; it was not invoked. |

## Additional configured routes

The replica identifies six Insight/Monitor routes absent from the visible menu. Warehouse Mobile Menu Insight **4086** loads successfully and exposes menu/submenu names and resource keys, SRC Identifier, parent and sequence, with New/Edit/Delete actions. This is configuration metadata about mobile navigation; it does not establish the correctness of a mobile procedure.

Labor Activity Insight **3050**, Labor Monitoring **3051**, Employee Scorecard **4097**, Employee Timeline **4121**, and Intraday Labor Progress **4124** each display an application message stating that the specified screen is **not licensed**. These are attempted routes with no inspected functional page. The message is recorded as observed; it is not generalized to other warning pages, and no license or permission change was attempted.

## Shared criteria and configuration model

The inspected Insight pages expose Basic Criteria and Advanced Criteria. Expanding Advanced Criteria shows an Add control and a Field/Operand/Value grid. Criteria were not entered, search outcomes were not validated and saved-search persistence was not tested. Grid column selectors, grouping/summary icons and export controls are present where recorded; no export was created.

For the exact configuration bindings, follow the [screen index](INDEX.md), [configuration model](../reference/CONFIGURATION_MODEL.md), and [Purchase Order walkthrough](purchase-order-configuration.md). Configured controls are not automatically visible or enabled: role, license, warehouse, selected records, custom implementation and current state can affect them. A menu label alone does not establish its handler, multi-selection behavior or successful outcome.

Pending per-screen work includes selected-record detail tabs, field/operand options and validation, action enablement and event/parameter/service bindings, conditional workbench states and return behavior. These remain separate from the completed landing/label inspection. No business rows, saved searches, account values, credential material or exported transaction files are part of this documentation.
