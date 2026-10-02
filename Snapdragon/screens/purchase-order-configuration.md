# Purchase Order Insight: configuration walkthrough

This is the current-installation example for Sam's navigation method. It was inspected read-only on 2026-10-02. The working runtime route is [Purchase Order Insight](https://trav.manhscale.com/scale/insights/2796); its configuration starts at [Form 2796](https://trav.manhscale.com/scale/details/form/2796).

The form and screen IDs are different: **FORM_ID 2796** binds **MAIN_UI_SCREEN 1776**. The form table/view is `METADATA_INSIGHT_PURCHASE_ORDER_HEADER_VIEW`. The screen's functional area is Receiving, its menu resource is `MNU_PURCHASEORDERINSIGHT`, its configured path is `/scale/insights/2796`, and its path type is 6. [Form evidence](../evidence/form-2796-properties-screens.txt), [screen properties](../evidence/po-screen-properties.txt).

## Navigation that was followed

| Step | Open this section/link | Current object |
|---|---|---|
| 1 | Form > Screens > `/scale/insights/2796` | Screen 1776; this link opens configuration, not the runtime Insight |
| 2 | Screen > Screen Parts > InsightMenuPane | Screen Part 4375 |
| 3 | Screen Part > Screen Groups > InsightMenu | Screen Group 18045 |
| 4 | Screen Group > Child Groups > InsightMenuActionsDropdown | Screen Group 18050 |
| 5 | Screen Group > Screen Controls > ListPaneMenuActionClose | Screen Control 51621 |
| 6 | Screen Control > Screen Control Events > click | Screen Control Event 18040 |
| 7 | Event > Event Parameters | Parameter records 26518–26522 |

The current UI calls the nested group section **Child Groups**. Sam's recording calls the corresponding traversal Screen Groups. Use the section actually displayed; do not transplant the training tenant's child IDs.

## What each level configures

The screen has six parts: SaveSearchModalDialog (4373), GadgetCalculationQueryDialog (4374), InsightMenuPane (4375), SearchPane (4376), ListPane (4377) and DetailPane (4378). The first two are ModalDialog parts; the other four are Div Containers. The live table shows Sequence, Active and Resource Key. [Screen Parts evidence](../evidence/po-screen-parts.txt).

InsightMenuPane exposes Part Name, Part Type, Resource Key, Sequence, Default Action, Partial View and a Div Css Class. Its observed CSS class is `col-md-12 col-lg-12`. The part is a layout container; the controls and behavior are configured deeper in its groups. [Part properties](../evidence/po-part-properties.txt), [part-to-group link](../evidence/po-part-groups.txt).

InsightMenu is a Menu group with Immediate content loading. Group configuration exposes a resource key, sequence, default action, fixed-to-top option and style properties. Its five child groups are InsightMenuPanel (18046), InsightMenuFavoritesDropdown (18047), InsightListPaneMenuPanel (18048), MenuExportToExcelPanel (18049) and InsightMenuActionsDropdown (18050). The last is a MenuDropdown. [Group properties](../evidence/po-group-properties.txt), [child groups](../evidence/po-menu-child-groups.txt).

The Actions group's grid reports **12 configured controls**, paginated ten per page. The first page visibly includes New, Copy, Edit, View, Delete, New Line, Close, Cancel Close, Print Preview and Print Default Docs. The replica's complete group additionally maps Print Selected Docs and Receipt From PO. The runtime inspection exposed eleven Actions entries and did not expose View in that state. This demonstrates why a configured control cannot automatically be counted as a visible or enabled runtime action. [First control page](../evidence/po-action-controls-page1.txt), [full configuration graph](../database/screen-configuration-chains.json), [runtime observation](../evidence/runtime-root.json).

Sequence is not unique in this group: Edit and View both use 250; Close and Cancel Close both use 1000. Do not impose a universal uniqueness rule from training commentary.

## One action traced to its configured handler

`ListPaneMenuActionClose` (51621) is a MenuButton. Both Resource Key and Tooltip Resource Key are `CLOSE`. The editor exposes Control Properties, Style Properties, Binding Properties, Screen Control Attributes, Screen Control Events and Screen Control Grid Columns, in addition to stamp/user-defined sections. [Control properties](../evidence/po-control-properties.txt).

Its active attribute record **40740** has `data-securityCheckpoint = 21`. This is the configured checkpoint identifier; the inspection did not establish which users are authorized for it. [Attribute evidence](../evidence/po-close-attributes.txt).

Its active `click` event **18040** names `_webUi.insightListPaneActions.menuActionPerformPost`. The following five active parameter bindings were observed directly. [Event linkage](../evidence/po-close-event-link.txt), [event properties](../evidence/po-close-event-properties.txt), [parameter evidence](../evidence/po-close-event-parameters.txt).

| Parameter ID | Parameter name | Configured value |
|---|---|---|
| 26518 | ConfirmationMessageCode | `MSG_PURCHASEORDER13` |
| 26519 | POSTServiceURL | `/inbound/scaleapi/PurchaseOrderApi/PurchaseOrders-Closed?` |
| 26520 | PostData_Grid_ListPaneDataGrid_objectId | `ObjectId` |
| 26521 | PostData_Grid_ListPaneDataGrid_purchaseOrderId | `PurchaseOrderId` |
| 26522 | Post_SuccessCallback | `_webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback` |

These bindings show how the UI connects the click handler, confirmation resource, selected-grid identifiers, service endpoint and success callback. They do not establish the service's validation, transaction boundaries, multi-select behavior or successful closing of an order. The endpoint was **not invoked**. Unlike the custom example in Sam's recording, this observed configuration does not specify a stored-procedure parameter.

## Practical inspection method

Open the form configuration, identify its screen implementation, and traverse the actual linked object IDs. Read the runtime page separately to compare labels and available actions. Use the field's Resource Key to find the display text; use the event and parameter relationships to understand what a control is configured to call. Preserve base/custom and active/inactive distinctions.

Leave configuration through Cancel or X. Do not use Save, Publish, Activate, Deactivate, Delete, Preview actions with unknown effects, or operational action buttons as part of this read-only walkthrough. The event inspection returned through Cancel.

This example traces one action chain. Other action/control bindings, selected-record details, search operand behavior and service implementations remain separate review work. See the [configuration model](../reference/CONFIGURATION_MODEL.md) and [coverage criteria](../reference/COVERAGE_CRITERIA.md).
