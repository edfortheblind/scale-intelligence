# Shipping and Order Planning: current runtime screen review

Evidence date: 2026-10-02, current host `trav.manhscale.com`. The observed menu supplies **18 destinations**: two Order Planning Insights; eleven Shipping Insights; four Shipping transaction pages; and one Shipping monitor. All 18 routes resolved with the expected title. This file documents functionality indicated by current controls, fields, and navigation. It does not claim that operational actions were run.

Source: [runtime observations](../evidence/runtime-training-agent.json), grounded in the [observed menu inventory](../evidence/menu-sections.json). Every observation records the actual URL, title, UTC timestamp, visible field metadata, grid header labels, controls, and alerts. Input values, grid business rows, selected-record details, saved-search names, and user stamps were not persisted.

## Measured progress

| Review dimension | Completed / denominator | Progress | Meaning |
|---|---:|---:|---|
| Order Planning menu destinations reached | 2 / 2 | 100% | Planned Shipment and Wave titles/URLs verified. |
| Shipping menu destinations reached | 16 / 16 | 100% | Eleven Insights, four transactions, one monitor. |
| Runtime landing structure inspected | 18 / 18 | 100% | Controls and visible field/header metadata recorded. |
| Insight basic/criteria groups inspected | 13 / 13 | 100% | Header search control opened when necessary; labels recorded. |
| Exposed Actions dropdowns opened | 16 / 16 | 100% | Twelve Insight menus and four transaction menus; Multiple Order Pallet displayed no entries. |
| Exposed Advanced Criteria groups opened | 12 / 12 | 100% | Field/Operand/Value grid and Add affordance observed. VAS has a single Criteria group. |
| Separate Print dropdowns inspected | 2 / 2 | 100% | Shipment and World Ease. No print action invoked. |
| Current Snapdragon configuration trees completely mapped by this runtime review | 0 / 18 | 0% | Form/Screen/parts/groups/control bindings remain a separate workstream. |
| Business-action outcomes exercised | 0 / applicable actions | Not a completion percentage | No record changes, print jobs, confirmations, or operations were submitted. |

These percentages close the defined first runtime pass for the 18 menu destinations. They do not close nested detail screens, record-dependent dialogs, every optional column, configuration trees, or permission/business-rule semantics.

## Functional relationships supported by the screen surfaces

Order Planning divides work between **Planned Shipment Insight (2774)** and **Wave Insight (2773)**. Planned Shipment exposes adding an individual shipment or all filtered shipments to a wave, removing from a wave, and transfer to another wave. Wave exposes Build, Release, Run, Cancel, and document/label reprinting. These labels identify the orchestration surface; their prerequisites, state transitions, and database writes remain to be traced.

Shipping's hierarchy is visible in separate **Shipment (2735)**, **Shipment Line (2776)**, **Shipping Container (4026)**, and **Shipping Load (3041)** screens. Their filters include common shipment, wave, load, and internal-number identifiers. Actions operate at different scopes: shipment confirmation/route/split; line quantity-to-pack/deconsolidation; container QC/nesting/manifest/packed-quantity; and load close/confirm. Record-dependent links are not assumed to work merely because these shared identifiers exist.

**Manifest (2798)** adds manifest name, rating, shipper, manifest status, and transmit status. Shipping Container has a separate **Manifest Criteria** group for manifest name/status, rating ID, shipper code, and tracking number. **World Ease (4088)** presents a World Ease group ID/status with Close and document-printing menus. The exact relationship between carrier grouping, manifest closure, transmission, and physical shipment is pending source and configuration evidence.

**Tote (4091)** tracks condition, user assignment, sorting mark, and putwall location; **Tote Detail (4092)** exposes item/lot quantities and sorted quantities; **Putwall (4093)** associates a location and status with shipment/container IDs and offers Pack. This supports a tote-to-sort-to-pack workflow interpretation, but the cross-screen transitions and quantity invariants have not been exercised.

**VAS Insight: Container (3043)** exposes activity instructions, status, QC Required, and Confirm. **QC Workbench**, **Packing**, **Single Unit Packing**, and **Close Container** are transaction entry pages, with further content dependent on a container, packing identifier, or tote. Their initial menus are documented; loading an operational record and executing the workflow are outside this pass.

## Navigation and configuration observations

- Most Insight search panes started collapsed. Opening the header link with `href="#search"` revealed Basic Criteria; the fragment changed the URL but kept the same screen.
- Advanced Criteria uses a reusable Field / Operand / Value grid with an Add control. Add was not pressed. It is a filter-definition surface, and it is separate from the business grid's column configuration.
- Each business grid exposes `select columns`, and many headers expose a Feature chooser. Visible columns are a starting layout, not the complete optional-column catalog.
- The observed accordion sometimes retained `aria-expanded=false` while its child headers/fields were displayed. Evidence therefore records the actual child content as well as the raw attribute. This merits accessibility review; it is not a screen-reader acceptance result.
- The current Wave Actions menu has ten visible entries. The historical `manh-trav3pl` training showed fourteen configured controls including three `EX01_*` custom actions. Those custom labels are absent from the current menu. Current runtime absence does not establish deletion: tenant, active Screen variant, permissions, or conditions may differ. See the [training audit](../training/README.md).
- Multiple Order Pallet's Actions dropdown opened but displayed no entries, including a second independent open. Tote Detail did not expose an Actions dropdown. Neither observation proves the underlying entity has no other available operations.
- No security warning or error page appeared in these 18 visits. This does not generalize to unvisited details or other menu sections.

## Pending work for this section

1. Resolve each runtime route to its Form, active/system-created Screen alternatives, screen parts, recursive groups, controls, attributes, events, parameters, data bindings, and security checkpoints.
2. Enumerate optional grid columns and criteria operators/field choices. The first pass records displayed columns and the advanced-filter structure only.
3. Map record-dependent detail screens and dialogs using metadata or an explicitly suitable review record; preserve business data boundaries.
4. Resolve action enabling/disabling, permission checkpoints, status prerequisites, and backend side effects from current configuration and source definitions.
5. Investigate the current/training Wave configuration difference and the empty Multiple Order Pallet Actions menu.
6. Inspect Shipment Type filters on Planned Shipment and other conditional/toggle controls beyond the captured examples; inspect monitor category drill-down and its Insight destination.
7. Validate accessible names, keyboard operation, and accordion state consistency separately.

## Screen-by-screen observations

The following catalog is generated from the saved metadata evidence. “Purpose” is a concise interpretation of observed fields and action labels; “Actions” lists affordances rather than tested outcomes. The observed timestamp windows are UTC.

### Wave Insight

Route: [https://trav.manhscale.com/scale/insights/2773](https://trav.manhscale.com/scale/insights/2773). Observed 2026-10-02T15:09:15.185Z to 2026-10-02T15:10:18.472Z.

Inspect and manage wave preparation, release/run controls, and wave document/label printing.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | Wave; Name; Flow; Warehouse; From Start Date Time; To Start Date Time; From Date Stamp; To Date Stamp |
| Business grid headers | Icon; Wave; Status; Name; Current Wave Step; Flow; Total Shipments; Total Lines; Released |
| Actions and print entries | New; Edit; Delete; Build; Cancel; Reprint Documents; Reprint Labels; Release; Run; Run (Select Printers) |
| Page groups | Basic Criteria; Wave Status; Advanced Criteria |
| States inspected | landing; actions; advanced; wave_status |

Additional visible toggle labels: Today Only: Date Time Stamp; Show Active Waves; Show Completed Waves; Show Cancelled Waves; Show Released Waves. Current dropdown entries differ from the historical training.


### Planned Shipment Insight

Route: [https://trav.manhscale.com/scale/insights/2774](https://trav.manhscale.com/scale/insights/2774). Observed 2026-10-02T15:10:28.670Z to 2026-10-02T15:11:18.711Z.

Inspect planned shipments and assign, remove, or transfer them between waves.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | Planned Shipment Filters; Shipment ID; Item; Company; Carrier; Customer; Customer Name; Customer PO; Ship To; ERP Order; Order Type; Wave; From Scheduled Ship Date; To Scheduled Ship Date; Warehouse |
| Business grid headers | Icon; Wave; Shipment ID; Customer Name; Carrier; Carrier Service; Scheduled Ship Date; Color |
| Actions and print entries | New; Copy; Edit; Delete; New Line; Add Shipment to Wave; Add All Filtered Shipments to Wave; Clear Rejection Note; Consolidate; Immediate Needs; Print Preview; Print Default Docs; Print Selected Docs; Remove From Wave; Route; Split Shipment; Transfer to Another Wave |
| Page groups | Basic Criteria; Shipment Type; Advanced Criteria |
| States inspected | landing; actions; criteria_open; advanced |


### Manifest Insight

Route: [https://trav.manhscale.com/scale/insights/2798](https://trav.manhscale.com/scale/insights/2798). Observed 2026-10-02T15:11:20.693Z to 2026-10-02T15:11:39.303Z.

Inspect carrier/shipper manifest state and expose closure, container review, and manifest/UPS-summary printing.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | Manifest Name; Rating ID; Warehouse |
| Business grid headers | Icon; Manifest Name; Rating ID; Shipper; Manifest Status; Ship Date; Transmit Status; Color |
| Actions and print entries | Close; Print Container Manifest; View Containers; Print UPS Summary Barcode Label |
| Page groups | Basic Criteria; Advanced Criteria |
| States inspected | landing; actions; criteria_open; advanced |


### Multiple Order Pallet Insight

Route: [https://trav.manhscale.com/scale/insights/2785](https://trav.manhscale.com/scale/insights/2785). Observed 2026-10-02T15:11:41.218Z to 2026-10-02T15:19:50.654Z.

Inspect pallet/container associations, shipment/load association, location, and status.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | Multiple Order Pallet ID; Container ID; Shipment ID; Shipping Load Number; Location; Status Name; Warehouse |
| Business grid headers | Multiple Order Pallet ID; Container ID; Status Name; Shipment ID; Carrier; Carrier Service; Location; Shipping Load Number |
| Actions and print entries | No entries observed; see caveat |
| Page groups | Basic Criteria; Advanced Criteria |
| States inspected | landing; actions; criteria_open; advanced; actions_recheck_landing; actions_rechecked |

Include Closed toggle label also observed. Actions was opened twice with no item labels returned; retain as an unresolved configuration/visibility finding.


### Putwall Insight

Route: [https://trav.manhscale.com/scale/insights/4093](https://trav.manhscale.com/scale/insights/4093). Observed 2026-10-02T15:12:03.148Z to 2026-10-02T15:12:31.749Z.

Inspect putwall location occupancy/status and associated shipment/container, with a Pack entry.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | Putwall Location; Shipment ID; Container ID; Warehouse; Location Status |
| Business grid headers | Putwall Location; Location Status; Shipment ID; Container ID; Color |
| Actions and print entries | Pack |
| Page groups | Basic Criteria; Advanced Criteria |
| States inspected | landing; actions; criteria_open; advanced |


### Shipment Insight

Route: [https://trav.manhscale.com/scale/insights/2735](https://trav.manhscale.com/scale/insights/2735). Observed 2026-10-02T15:12:35.034Z to 2026-10-02T15:12:56.690Z.

Inspect shipment headers and expose shipment lifecycle, load transfer, routing, split, packing, VAS, and print controls.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | Shipment ID; Item; Company; Carrier; Customer; Ship To; ERP Order; Order Type; Shipping Load; Dock Door; Wave Number; From Scheduled Ship Date; To Scheduled Ship Date; Warehouse |
| Business grid headers | Icon; Shipment ID; Customer Name; Carrier; Carrier Service; Scheduled Ship Date; Shipping Load; Trailing Status; Leading Status; Ship To; Ship To Name; Company; Wave Number |
| Actions and print entries | New; Copy; Edit; Delete; New Line; Edit Accessorials; Cancel; Confirm; Consolidate; Immediate Needs; Manifest At Shipment Level; Pack; Receipt From Shipment; Remove From Load; Route; Transfer All Filtered Shipments to Load; Transfer Shipment; Split Shipment; VAS Activity; Print Preview; Print Default Docs; Print Selected Docs |
| Page groups | Basic Criteria; Advanced Criteria |
| States inspected | landing; actions; criteria_open; advanced; print_menu |


### Shipment Line Insight

Route: [https://trav.manhscale.com/scale/insights/2776](https://trav.manhscale.com/scale/insights/2776). Observed 2026-10-02T15:13:13.248Z to 2026-10-02T15:13:25.579Z.

Inspect shipment item lines and expose line cancellation, transfer, deconsolidation, and quantity-to-pack updates.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | Shipment ID; ERP Order; Line Number; Item; Description; Company; Warehouse; Wave Number; Internal Shipment Number; Shipping Load |
| Business grid headers | Icon; Line Number; Shipment ID; Item; Description; Company; Total Qty; Color |
| Actions and print entries | Copy; Edit; Delete; Cancel; Deconsolidate; Immediate Needs; Transfer; Update Quantity to Pack |
| Page groups | Basic Criteria; Advanced Criteria |
| States inspected | landing; actions; criteria_open; advanced |


### Shipping Container Insight

Route: [https://trav.manhscale.com/scale/insights/4026](https://trav.manhscale.com/scale/insights/4026). Observed 2026-10-02T15:13:35.055Z to 2026-10-02T15:13:51.392Z.

Inspect container status/tracking and expose QC, packing quantity, nesting, location transfer, manifest, and document controls.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | Container ID; Shipment ID; Item; Current Location; Status; Container Type; QC; Warehouse; Wave Number; Internal Shipment Number; Shipping Load; Manifest Name; Manifest Status; Rating ID; Shipper Code; Tracking Number |
| Business grid headers | Container ID; Shipment ID; Tracking Number; Container Type; Status; Item; Description; Company; Manifest State |
| Actions and print entries | Edit; Delete; Edit Accessorials; Close; Confirm QC; Dock Transfer; Manifest; Mark for QC; Nest; Print Preview; Print Default Docs; Print Selected Docs; Remove From Manifest; Remove From Nesting; Transfer; Update Packed Quantity; VAS Activity |
| Page groups | Basic Criteria; Manifest Criteria; Advanced Criteria |
| States inspected | landing; actions; criteria_open; advanced; manifest_criteria |


### Shipping Load Insight

Route: [https://trav.manhscale.com/scale/insights/3041](https://trav.manhscale.com/scale/insights/3041). Observed 2026-10-02T15:13:53.610Z to 2026-10-02T15:14:08.135Z.

Inspect load carrier/status/capacity totals and expose load maintenance, closure/confirmation, and printing.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | Shipping Load; Leading Status; Trailing Status; Master BOL Number; BOL/PRO/Tracking Num; Carrier; From Scheduled Ship Date; To Scheduled Ship Date; Warehouse |
| Business grid headers | Icon; Color; Shipping Load; Carrier; PRO Number; Scheduled Ship Date; Trailing Status; Leading Status; Total Containers; Total Weight; Total Volume |
| Actions and print entries | New; Edit; Delete; Close; Confirm; Print Preview; Print Default Docs; Print Selected Docs |
| Page groups | Basic Criteria; Advanced Criteria |
| States inspected | landing; actions; criteria_open; advanced |


### Tote Detail Insight

Route: [https://trav.manhscale.com/scale/insights/4092](https://trav.manhscale.com/scale/insights/4092). Observed 2026-10-02T15:14:09.842Z to 2026-10-02T15:14:37.017Z.

Inspect tote item/lot contents and sorted versus total quantity, including putwall placement.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | Tote ID; Item; Company; Description; Lot; Warehouse; Internal Tote Number |
| Business grid headers | Tote ID; Item; Description; Company; Lot; Quantity; Quantity UM; Sorted Quantity; Sorted Quantity UM; Putwall Location; Color |
| Actions and print entries | No entries observed; see caveat |
| Page groups | Basic Criteria; Advanced Criteria |
| States inspected | landing; criteria_open; advanced |

No Actions dropdown was exposed on the observed landing.


### Tote Insight

Route: [https://trav.manhscale.com/scale/insights/4091](https://trav.manhscale.com/scale/insights/4091). Observed 2026-10-02T15:14:39.004Z to 2026-10-02T15:15:01.694Z.

Inspect tote condition, assigned user, sorting mark, and associated shipment/container/putwall; expose Unassign.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | Tote ID; Shipment ID; Container ID; Condition; User Assigned; Mark for Sorting; Putwall Location; Warehouse |
| Business grid headers | Tote ID; Condition; Assigned User; Mark for Sorting; Color |
| Actions and print entries | Unassign |
| Page groups | Basic Criteria; Advanced Criteria |
| States inspected | landing; actions; criteria_open; advanced |


### VAS Insight: Container

Route: [https://trav.manhscale.com/scale/insights/3043](https://trav.manhscale.com/scale/insights/3043). Observed 2026-10-02T15:15:03.746Z to 2026-10-02T15:15:17.577Z.

Inspect container VAS activities, instructions, confirmation/status, and QC requirement; expose Confirm and document printing.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | Shipment ID; Container; VAS Activity; Warehouse |
| Business grid headers | Confirmed; Container ID; Shipment ID; VAS Activity; Instructions; Status; QC Required |
| Actions and print entries | Confirm; Print Preview; Print Default Docs; Print Selected Docs |
| Page groups | Criteria |
| States inspected | landing; actions; criteria_open |

Only the Criteria group was exposed; no Advanced Criteria tab. Confirm is a direct toolbar action; the dropdown contains three print options.


### World Ease Insight

Route: [https://trav.manhscale.com/scale/insights/4088](https://trav.manhscale.com/scale/insights/4088). Observed 2026-10-02T15:15:26.223Z to 2026-10-02T15:15:52.868Z.

Inspect World Ease group identity/status and expose group closure plus document printing.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | World Ease ID; Container ID; Shipment ID; Warehouse |
| Business grid headers | World Ease ID; Group Status |
| Actions and print entries | Close; Print Default Docs; Print Selected Docs |
| Page groups | Basic Criteria; Advanced Criteria |
| States inspected | landing; actions; criteria_open; print_menu; advanced |


### Close Container

Route: [https://trav.manhscale.com/scale/trans/closecontainer](https://trav.manhscale.com/scale/trans/closecontainer). Observed 2026-10-02T15:15:55.540Z to 2026-10-02T15:16:21.982Z.

Enter a container and weight, review user-defined fields, and expose container close/edit/scale-weight controls.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | ContainerInfoContainerIdValueEditingInput; ContainerInfoWeightValueEditingInput; UserDefinedUDF1ValueEditingInput; UserDefinedUDF2ValueEditingInput; UserDefinedUDF3ValueEditingInput; UserDefinedUDF4ValueEditingInput; UserDefinedUDF5ValueEditingInput; UserDefinedUDF6ValueEditingInput; UserDefinedUDF7ValueEditingInput; UserDefinedUDF8ValueEditingInput |
| Business grid headers | No business grid exposed in this landing |
| Actions and print entries | Close; Edit; Use Scale Weight; Cancel |
| Page groups | Container Info; User Defined |
| States inspected | landing; actions; user_defined |

Friendly associated labels verified for Container ID and Weight. User Defined expands eight editor controls UDF1 through UDF8; data types and business meanings require configuration mapping.


### Packing

Route: [https://trav.manhscale.com/scale/trans/packing](https://trav.manhscale.com/scale/trans/packing). Observed 2026-10-02T15:16:23.455Z to 2026-10-02T15:16:35.363Z.

Begin a packing workflow from a packing identifier and team. Record-dependent workflow stages were not opened.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | PackingIdEditorEditingInput |
| Business grid headers | No business grid exposed in this landing |
| Actions and print entries | New; Cancel |
| Page groups | No accordion groups exposed |
| States inspected | landing; actions |

Team label confirmed. The identifier editor lacks a captured descriptive placeholder; its UI control ID is preserved rather than assigning an unverified business key name.


### QC Workbench

Route: [https://trav.manhscale.com/scale/trans/qcworkbench?](https://trav.manhscale.com/scale/trans/qcworkbench?). Observed 2026-10-02T15:16:36.740Z to 2026-10-02T15:16:49.020Z.

Begin a container quality-control workflow. Counted-quantity and force-pass controls are exposed but were not executed.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | QcContainerIdEditingInput |
| Business grid headers | No business grid exposed in this landing |
| Actions and print entries | New; Clear Counted Quantities; Fill All Counted Quantities; Force QC Pass; Cancel |
| Page groups | No accordion groups exposed |
| States inspected | landing; actions |

Only entry state inspected. No container was entered and no counted quantity or force-pass action was invoked.


### Single Unit Packing

Route: [https://trav.manhscale.com/scale/trans/singlesPacking](https://trav.manhscale.com/scale/trans/singlesPacking). Observed 2026-10-02T15:16:50.291Z to 2026-10-02T15:17:09.195Z.

Begin a single-unit packing workflow using a tote identifier. Record-dependent workflow stages were not opened.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | ToteIdEditorEditingInput |
| Business grid headers | No business grid exposed in this landing |
| Actions and print entries | New; Cancel |
| Page groups | No accordion groups exposed |
| States inspected | landing; actions |

Only entry state inspected. No tote was entered.


### Shipment Monitoring: Customer

Route: [https://trav.manhscale.com/scale/monitors/4013](https://trav.manhscale.com/scale/monitors/4013). Observed 2026-10-02T15:17:13.606Z to 2026-10-02T15:17:13.606Z.

Monitor by Customer Category 1; Refresh and Insight navigation affordances are exposed. Category drill-down was not exercised.

| Surface | Observed metadata |
|---|---|
| Criteria / entry fields | No entry fields exposed in this landing |
| Business grid headers | No business grid exposed in this landing |
| Actions and print entries | No entries observed; see caveat |
| Page groups | No accordion groups exposed |
| States inspected | landing |

Observed links: Customer Category 1, Refresh, Insight. No business-grid headers, criteria panel, or action dropdown were exposed in this landing observation.
