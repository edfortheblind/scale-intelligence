# Inventory, Work and Performance Management

All **23 configured menu destinations were attempted** on 2026-10-02. Twenty-two loaded their expected SCALE page. Supply Chain Intelligence reached a server Runtime Error. These are landing-page and label observations; selected-record details, advanced filter definitions, event behavior and effective permissions remain to be reviewed. The later replica pass indexed the part/group/control/attribute/event/parameter relationships; structural capture does not complete their meaning or conditional behavior.

Evidence: [runtime-source-agent.json](../evidence/runtime-source-agent.json), observed 10:12–10:21 AM America/Chicago. Entry destinations came from the live menu recorded in [menu-sections.json](../evidence/menu-sections.json). The evidence retains titles, routes, field labels, column headings, tab names, action labels and monitor labels. It retains no business rows, user values or credentials. No search, operational action, save, export, print or configuration change was executed.

| Section | Menu destinations attempted | Expected landing loaded | Fully mapped dossiers |
| --- | --- | --- | --- |
| Inventory | 16/16 (100%) | 16/16 (100%) | 0/16 |
| Work | 3/3 (100%) | 3/3 (100%) | 0/3 |
| Performance Management | 4/4 (100%) | 3/4 (75%) | 0/4 |
| Assigned subset | 23/23 (100%) | 22/23 (95.65%) | 0/23 |

The denominators are this assigned menu subset, not all possible SCALE forms. A visible action is evidence of a configured label; it does not establish authorization, successful execution or transaction semantics. Empty action lists mean no action labels were observed in that landing state.

## Inventory

Eleven Insight pages exposed a search pane, result-column structure and available menu labels. Every one showed Basic Criteria and Advanced Criteria tabs; several also showed a status, condition or request-type tab. The complete observed field and action lists are in the evidence JSON.

| Screen / form | Context visible on the landing page | Observed action examples and mapping priorities |
| --- | --- | --- |
| [Cycle Count Plan / 3105](https://trav.manhscale.com/scale/insights/3105) | Plan/master identity, creation/completion dates, open/closed/error/released columns; Basic Criteria, Plan Status, Advanced Criteria. | View, Delete, Close, Master Plan, Quick Plan, Release. Map plan-to-request drilldown and release conditions. |
| [Cycle Count Request / 3101](https://trav.manhscale.com/scale/insights/3101) | Count/plan/status, item/company/lot/location, counted/system quantities, work flag, license plate and group number. | Delete, Confirm, Reconcile. Map request status rules and count-versus-system comparison. |
| [Immediate Needs / 2767](https://trav.manhscale.com/scale/insights/2767) | Request number, priority, reference, item/company, destination and license plate; Immediate Needs Type tab. | Edit, Delete, Change Priority. Map request type, internal fulfillment context and generated work relationship. |
| [Inventory / 2723](https://trav.manhscale.com/scale/insights/2723) | Location/item/company, inventory status, lot/license plate, frozen indicator and abbreviated quantity columns AV/OH/AL/IT/SU. | Adjust, Company Transfer, Create Count, attributes/overrides, breakdown, Status Change, Transfer, catch weight, replenishment and Freeze Lot. Abbreviations and action prerequisites need source/metadata reconciliation. |
| [Lot / 2768](https://trav.manhscale.com/scale/insights/2768) | Lot/item/company, status, expiration, locations and frozen indicator; Condition tab. | Edit, Adjust, Status Change, Transfer. Map lot-to-location and expiration/status dependencies. |
| [Movement Class / 3110](https://trav.manhscale.com/scale/insights/3110) | Item/unit, number of hits, location and quantity-unit movement classes, quantity and UM; location type, zone, converted UM and time-range filters. | Adjust, Transfer. Map calculation window, movement classifications and location/UM relationships. |
| [Replenishment / 3046](https://trav.manhscale.com/scale/insights/3046) | Request, allocated quantity, source/destination, work-creation flag, allocation/work zones, replenishment type/master and wave references. | View, Create Work Immediately, Mark for Work Creation. Map the distinction between request, marked state and created work. |
| [Shipped Lot / 2790](https://trav.manhscale.com/scale/insights/2790) | Item/company/lot, actual ship date, shipment, quantity/UM, container and ship-to headings. | No action labels observed. Map shipment/container links and historical retention source. |
| [Work Order / 2787](https://trav.manhscale.com/scale/insights/2787) | Work-order and finished-item identity, built/available/total quantity, build location; Condition tab. | New/Edit/Delete/New Line, Allocate/Deallocate All, Close, Confirm, Immediate Needs, document actions and Release. Map work-order lifecycle and component/finished-item relationships. |
| [Work Order License Plate / 3075](https://trav.manhscale.com/scale/insights/3075) | Work order/license plate, item/company, quantity/UM and location. | Print Preview, Print Default Docs, Print Selected Docs. Map license-plate relationship and document configuration. |
| [Work Order Line / 2789](https://trav.manhscale.com/scale/insights/2789) | Work order/sequence/item/company, needed/used/on-hand quantity, converted UM and allocated state. | Edit, Delete, Allocate, Deallocate, Immediate Needs. Map line allocation and component quantity contracts. |

Four transaction pages initially displayed **Adjustment Type**. Their additional context fields were not expanded by selecting a type. The following toolbar and Actions-menu labels were observed without being executed:

| Transaction route | Main toolbar | Actions menu |
| --- | --- | --- |
| [/scale/trans/inventoryCompanyTransfer](https://trav.manhscale.com/scale/trans/inventoryCompanyTransfer) | Transfer | Cancel |
| [/scale/trans/inventoryAdjustment](https://trav.manhscale.com/scale/trans/inventoryAdjustment) | Adjust; Create Work | Locate; Cancel |
| [/scale/trans/invStatusChange](https://trav.manhscale.com/scale/trans/invStatusChange) | Save | Cancel |
| [/scale/trans/inventoryTransfer](https://trav.manhscale.com/scale/trans/inventoryTransfer) | Transfer; Create Work | Locate; Cancel |

These transaction pages need a subsequent configuration-led review of adjustment types, field requirements, source/destination context, quantity handling and work-creation behavior. A successful landing proves none of the effects of Transfer, Adjust, Save or Create Work.

[Inventory Monitoring / 4012](https://trav.manhscale.com/scale/monitors/4012) showed a Locating Zones breadcrumb and an Insight link. Summary labels included Total Locations, Empty Locations, Percent Empty and Frozen Empty. Indicator labels included Locations Less Than 10 On Hand, Pending Replenishments, Pending Cycle Counts, and Empty Permanent Locations - With None Available (in Transit). Indicator values and warehouse data were not retained. Chart drilldowns, the Insight target and the calculation definitions remain unverified.

## Work

[Work Insight / 2757](https://trav.manhscale.com/scale/insights/2757) showed work unit, instruction/work type, condition, item/company/reference, source/destination and confirmation-quantity columns. Basic filters covered work and instruction type, reference/wave, item/company, location, license plate/lot, user assigned, aging range, warehouse, internal identifiers and parent container. Condition and Advanced Criteria tabs were present.

Its menu labels covered Edit/Delete, Assign Team/User, Change Priority, Completed By User, Confirm, Hold/Remove Hold, Override Pick/Putaway, Unassign and document actions. Follow-up mapping must distinguish assignment from completion, condition from hold, instruction from work-unit scope, and the checkpoint or selected-record requirement of each action.

The two work monitors share the observed measures and indicators but start with different grouping labels:

| Screen | Initial grouping | Shared observed labels |
| --- | --- | --- |
| [Work Monitoring: Customer / 2771](https://trav.manhscale.com/scale/monitors/2771) | Customer Category 1 | Work Units, Instructions, Est Time (M), Open, In Process, Closed Last hr |
| [Work Monitoring: Group / 2769](https://trav.manhscale.com/scale/monitors/2769) | Work Groups | At-Risk Work, Priority Work, Work On Hold, Open Work, In Progress Work |

Both displayed an Insight link. Their grouping transitions, drilldown filters, calculation sources and target Insight identity remain to be traced. No monitor values or work records were copied.

## Performance Management

[Quality History Insight / 3062](https://trav.manhscale.com/scale/insights/3062) showed reason description, reference type/order, username, item/company, work type/team/group and activity date headings. Basic filters also included reason code, internal number, activity range and warehouse. Its observed action label was View. These are investigation entry points; the review did not read employee history or infer performance outcomes.

[Receipt Quality History Insight / 2778](https://trav.manhscale.com/scale/insights/2778) showed receipt ID, reason description, username, item/company and activity date headings. Basic filters included vendor name, ERP order, receipt, reason, inventory status, item, carrier, internal receipt number, activity/receipt-date ranges and warehouse. View was the observed action. Receipt-to-quality linkage and reason-code configuration still need mapping.

[Warehouse Dashboard](https://trav.manhscale.com/scale/trans/dashboard) loaded the expected shell with refresh and settings controls. No tiles appeared in the inspected landing DOM. The settings control was not opened. This counts as shell reachability, not dashboard content verification or proof that no dashboard is configured.

[Supply Chain Intelligence](http://OCIEAPP/SCI) was the exact externally hosted menu target. It resolved to `http://ocieapp/SCI` and displayed **Runtime Error** with **Server Error in '/' Application**. The error description says details cannot be viewed remotely under the current custom-error settings. This is an application failure, not a browser certificate warning. No authentication, server setting change, or attempt to reveal the hidden error details was made.

## Remaining work

1. Use the completed [form inspection and structural registry](../database/DATABASE_EVIDENCE.md) to bind each runtime function to the relevant implementation and controls. The active/custom implementation selected at runtime still needs explicit evidence where alternatives share a route.
2. Expand each applicable status/condition/advanced criterion branch and inventory its choices, operators, defaults and field bindings without saving filters.
3. Review the captured part/group/control/attribute/column/event/parameter relationships and link their meanings to UI labels, data sources and checkpoints. Begin with the [selected dependency tokens](../database/SAFE_DEPENDENCY_TOKENS.md); arbitrary attribute/parameter values remain omitted from the original bulk output. Review additional values necessary for a bounded behavior claim through the authorized configuration interface.
4. Document read-only selected-record detail structure using approved nontransactional evidence or a controlled example; retain no warehouse rows.
5. Resolve monitor drilldowns and dashboard configuration structure without activating operational functions.
6. Record the SCI application error for the system owner; retry only after the destination or service state changes.

See [the configuration model](../reference/CONFIGURATION_MODEL.md) for product-level architecture and [coverage criteria](../reference/COVERAGE_CRITERIA.md) for closure rules. This initial pass and the later structural capture do not close these remaining functional/configuration semantics tasks.
