# Shipment Insight — Form 2735, Screen 1621

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2735 |
| MAIN_UI_SCREEN Object ID | 1621 |
| Label / Form resource key | Shipment Insight / MNU_SHIPMENTINSIGHT |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / N / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2735 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2735 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2735 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_SHIPMENT_INSIGHT_VIEW |
| Help page reference | ShipmentInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2735 |
| Inspection time (UTC) | 2026-10-02T15:23:21.135Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_SHIPMENTINSIGHT |
| Observed configured table/view | METADATA_SHIPMENT_INSIGHT_VIEW |
| Screens grid loaded / record count | True / 2 |
| Screen IDs exposed as links in observed grid | 1786, 1621 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:12:35.034Z | loaded; landing | https://trav.manhscale.com/scale/insights/2735; Shipment Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:12:45.901Z | loaded; actions | https://trav.manhscale.com/scale/insights/2735; Shipment Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:12:46.934Z | loaded; criteria_open | https://trav.manhscale.com/scale/insights/2735#search; Shipment Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:12:56.257Z | loaded; advanced | https://trav.manhscale.com/scale/insights/2735#search; Shipment Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:12:56.690Z | loaded; print_menu | https://trav.manhscale.com/scale/insights/2735#search; Shipment Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |

**Visible criteria / entry fields:** Shipment ID; Item; Company; Carrier; Customer; Ship To; ERP Order; Order Type; Shipping Load; Dock Door; Wave Number; From Scheduled Ship Date; To Scheduled Ship Date; Warehouse.

**Visible grid headers:** Icon; Shipment ID; Customer Name; Carrier; Carrier Service; Scheduled Ship Date; Shipping Load; Trailing Status; Leading Status; Ship To; Ship To Name; Company; Wave Number; Field; Operand; Value.

**Observed action/menu labels:** New; Copy; Edit; Delete; New Line; Edit Accessorials; Cancel; Confirm; Consolidate; Immediate Needs; Manifest At Shipment Level; Pack; Receipt From Shipment; Remove From Load; Route; Transfer All Filtered Shipments to Load; Transfer Shipment; Split Shipment; VAS Activity; Print Preview; Print Default Docs; Print Selected Docs.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Shipment Insight is recorded as `insight`. Its saved configuration contains 6 parts, 23 groups, 70 controls, and 39 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3719 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / N / Y | SaveSearchSaveButton |
| 3720 / SplitShipmentConfirmationModalDialog | Not populated / Not populated | 20 / 2500 | Y / N / Y | SplitShipmentConfirmationCancelButton |
| 3721 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / N / N | Not populated |
| 3722 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / N / N | InsightMenuApply |
| 3723 / ListPane | Not populated / Not populated | 10 / 7500 | Y / N / N | Not populated |
| 3724 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / N / N | Not populated |

### Part 3719: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 15584 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / N | Fixed to top=N; loading=0; nested unit=15584; default=None |
| 15585 / SaveSearchModalDialogHeader | 15584 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / N | Fixed to top=N; loading=0; nested unit=15584; default=None |
| 15586 / SaveSearchModalDialogBody | 15584 | Not populated / Not populated | 120 / 5000 | Y / N | Fixed to top=N; loading=0; nested unit=15584; default=None |
| 15587 / SaveSearchModalDialogFooter | 15584 | Not populated / Not populated | 130 / 7500 | Y / N | Fixed to top=N; loading=0; nested unit=15584; default=None |

#### Group 15586: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45616 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 15587: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45617 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45618 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3720: SplitShipmentConfirmationModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 15588 / SplitShipmentConfirmationModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / N | Fixed to top=N; loading=0; nested unit=15588; default=None |
| 15589 / SplitShipmentConfirmationModalDialogHeader | 15588 | Confirmation / CONFIRMATION | 110 / 2500 | Y / N | Fixed to top=N; loading=0; nested unit=15588; default=None |
| 15590 / SplitShipmentConfirmationModalDialogBody | 15588 | Not populated / Not populated | 120 / 5000 | Y / N | Fixed to top=N; loading=0; nested unit=15588; default=None |
| 15591 / SplitShipmentConfirmationModalDialogFooter | 15588 | Not populated / Not populated | 130 / 7500 | Y / N | Fixed to top=N; loading=0; nested unit=15588; default=None |

#### Group 15590: SplitShipmentConfirmationModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45619 / SplitShipmentConfirmationMessage | One or more of the shipments chosen for confirmation are not in the proper status.  Please choose an action from the selections below. / SPLITINSTRUCTIONS | 30 / 2500 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 15591: SplitShipmentConfirmationModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45620 / SplitShipmentConfirmationSplitButton | Split / BTN_SPLIT | 100 / 2500 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45621 / SplitShipmentConfirmationSplitNotInRangeButton | Split Shipment If Not in Range / SPLITNOTINRANGE | 100 / 5000 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45622 / SplitShipmentConfirmationNoSplitButton | Do Not Split Shipment / DONOTSPLIT | 100 / 5000 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45623 / SplitShipmentConfirmationCancelButton | Cancel / CANCEL | 100 / 5000 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3721: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 15592 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / N | Fixed to top=Y; loading=0; nested unit=15592; default=None |
| 15593 / InsightMenuPanel | 15592 | Not populated / Not populated | 60 / 7500 | Y / N | Fixed to top=Y; loading=0; nested unit=15592; default=None |
| 15594 / InsightMenuFavoritesDropdown | 15592 | Favorites / FAVORITES | 100 / 10000 | Y / N | Fixed to top=N; loading=0; nested unit=15592; default=None |
| 15595 / InsightListPaneMenuPanel | 15592 | Not populated / Not populated | 60 / 11000 | Y / N | Fixed to top=Y; loading=0; nested unit=15592; default=None |
| 15596 / MenuExportToExcelPanel | 15592 | Not populated / Not populated | 60 / 12500 | Y / N | Fixed to top=N; loading=0; nested unit=15592; default=None |
| 15597 / InsightMenuActionsDropdown | 15592 | Actions / ACTIONS | 80 / 15000 | Y / N | Fixed to top=N; loading=0; nested unit=15592; default=None |
| 15598 / InsightMenuPrintActionsDropdown | 15592 | Print / PRINT | 80 / 15550 | Y / N | Fixed to top=N; loading=0; nested unit=15592; default=None |

#### Group 15593: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45624 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 45625 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 45626 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 45627 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 15595: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45628 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 45629 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 45630 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 15596: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45631 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 15597: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45632 / ListPaneMenuActionNew | New / NEW | 150 / 2200 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEW |
| 45633 / ListPaneMenuActionCopy | Copy / COPY | 150 / 2350 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=COPY |
| 45634 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 2500 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 45635 / ListPaneMenuActionView | View / VIEW | 150 / 2750 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 45636 / ListPaneMenuActionDeleteShipment | Delete / DELETE | 150 / 3000 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 45637 / ListPaneMenuActionNewLine | New Line / NEWLINE | 150 / 3200 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CONFIRM |
| 45638 / ListPaneMenuActionViewAccessorials | View Accessorials / VIEWACCESSORIALS | 150 / 3250 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEWACCESSORIALS |
| 45639 / ListPaneMenuActionEditAccessorials | Edit Accessorials / EDITACCESSORIALS | 150 / 3250 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDITACCESSORIALS |
| 45640 / ListPaneMenuActionCancelShipment | Cancel / CANCEL | 150 / 3300 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CANCEL |
| 45641 / ListPaneMenuActionConfirmShipment | Confirm / CONFIRM | 150 / 3500 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CONFIRM |
| 45642 / ListPaneMenuActionConsolidateShipment | Consolidate / CONSOLIDATE | 150 / 3750 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CONSOLIDATE |
| 45643 / ListPaneMenuActionImmediateNeeds | Immediate Needs / IMMEDIATENEEDS | 150 / 4000 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=IMMEDIATENEEDS |
| 45646 / ListPaneMenuActionShipLevelManifest | Manifest At Shipment Level / MANIFESTSHIPLEVEL | 150 / 4250 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=MANIFESTSHIPLEVEL |
| 45647 / ListPaneMenuActionShipLevelPack | Pack / PACK | 150 / 4570 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PACK |
| 45648 / ListPaneMenuActionReceiptFromShipment | Receipt From Shipment / RECEIPTFROMSHIPMENT | 150 / 5000 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=RECEIPTFROMSHIPMENT |
| 45649 / ListPaneMenuActionRemoveFromLoad | Remove From Load / REMOVEFROMLOAD | 150 / 5250 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=REMOVEFROMLOAD |
| 45650 / ListPaneMenuActionRouteShipment | Route / ROUTE | 150 / 5500 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ROUTE |
| 45644 / ListPaneMenuActionAddFilteredShipmentsToLoad | Transfer All Filtered Shipments to Load / TRANSFILTSHIPTOLOAD | 150 / 5700 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ADDFILTSHIPTOWAVE |
| 45645 / ListPaneMenuActionLoadTransfer | Transfer Shipment / TRANSFERSHIPMENT | 150 / 5750 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TRANSFERSHIPMENT |
| 45651 / ListPaneMenuActionSplitShipment | Split Shipment / SPLITSHIPMENT | 150 / 6000 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SPLITSHIPMENT |
| 45652 / ListPaneMenuActionVasActivity | VAS Activity / VASACTIVITY | 150 / 6500 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VASACTIVITY |

#### Group 15598: InsightMenuPrintActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45653 / ListPaneMenuActionPrintPreviewDocs | Print Preview / PRINTPREVIEW | 150 / 4300 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTPREVIEW |
| 45654 / ListPaneMenuActionPrintShipmentDocs | Print Default Docs / PRINTDEFAULTDOCS | 150 / 4500 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTDEFAULTDOCS |
| 45655 / ListPaneMenuActionPrintSelectedShipmentDocs | Print Selected Docs / PRINTSELECTEDDOCS | 150 / 4750 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTSELECTEDDOCS |

### Part 3722: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 15599 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / N | Fixed to top=N; loading=0; nested unit=15599; default=None |
| 15600 / SearchPaneBasicCriteria | 15599 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / N | Fixed to top=N; loading=2; nested unit=15599; default=None |
| 15601 / SearchPaneAdvancedCriteria | 15599 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / N | Fixed to top=N; loading=0; nested unit=15599; default=None |

#### Group 15600: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45656 / BasicCriteriaShipmentId | Shipment ID / SHIPMENTID | 10 / 2500 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 45657 / BasicCriteriaItem | Item / ITEM | 10 / 5000 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 45668 / SearchPaneComp | Company / COMPANY | 280 / 6000 | Y / N | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45669 / SearchPaneCarrierAndService | Carrier / CARRIER | 280 / 6500 | Y / N | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45658 / BasicCriteriaCustomer | Customer / CUSTOMER | 10 / 10000 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 45659 / BasicCriteriaShipTo | Ship To / SHIPTO | 10 / 12500 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 45660 / BasicCriteriaErpOrder | ERP Order / ERPORDER | 10 / 15000 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 45661 / BasicCriteriaOrderType | Order Type / ORDERTYPE | 10 / 17500 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45662 / BasicCriteriaShippingLoad | Shipping Load / SHIPPINGLOAD | 90 / 20000 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 45670 / SearchPaneDockDoor | Dock Door / DOCKDOOR | 280 / 21000 | Y / N | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45663 / BasicCriteriaWaveNumber | Wave Number / WAVENUMBER | 90 / 22500 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 45664 / BasicCriteriaScheduledShipDateRange | Scheduled Ship Date / SCHEDULEDSHIPDATE | 190 / 25000 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45667 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 26000 | Y / N | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45665 / BasicCriteriaConfirmedShipments | Include Confirmed Shipments / INCLUDECONFIRMEDSHIPMENTS | 130 / 27500 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45666 / BasicCriteriaShowCrossDockPending | Show Only Cross Dock Pending Shipments / SHOWCROSSDOCKPENDING | 130 / 27700 | Y / N | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 15601: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45671 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / N | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3723: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 15602 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / N | Fixed to top=N; loading=0; nested unit=15602; default=None |
| 15603 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / N | Fixed to top=N; loading=0; nested unit=15603; default=None |

#### Group 15602: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45672 / ListPaneSummaryLoads | Loads / LOADS | 50 / 2500 | Y / N | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45673 / ListPaneSummaryShipments | Shipments / SHIPMENTS | 50 / 5000 | Y / N | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45674 / ListPaneSummaryDetails | Lines / LINES | 50 / 7500 | Y / N | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45675 / ListPaneSummaryContainers | Containers / CONTAINERS | 50 / 10000 | Y / N | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 15603: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45676 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / N | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 45676 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 15701 / Not populated | Shipment_Id / Not populated / Not populated | Not populated / 30 / Not populated / Not populated | Y / N / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15720 / Not populated | Shipment_Id / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / N / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15721 / Not populated | TOTAL_LINES / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15722 / Not populated | TOTAL_CONTAINERS / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15723 / Not populated | Internal_Shipment_Num / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / N / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15703 / ICON | Not populated / Icon / ICON | 10 / 10 / 50 / Not populated | Y / N / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15704 / SHIPMENT_ID | Shipment_Id / Shipment ID / SHIPMENTID | 10 / 10 / 1000 / Not populated | Y / N / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15705 / CUSTOMER_NAME | Not populated / Customer Name / CUSTOMERNAME | 10 / 10 / 2000 / Not populated | Y / N / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15706 / SHIPMENT_HEADER_CARRIER | Not populated / Carrier / CARRIER | 10 / 10 / 2500 / Not populated | Y / N / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15707 / CARRIER_SERVICE | Not populated / Carrier Service / CARRIERSERVICE | 10 / 10 / 2600 / Not populated | Y / N / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15708 / SCHEDULED_SHIP_DATE | Not populated / Scheduled Ship Date / SCHEDULEDSHIPDATE | 30 / 10 / 2700 / Not populated | Y / N / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15709 / SHIPPING_LOAD_NUM | Not populated / Shipping Load / SHIPPINGLOAD | 10 / 10 / 2800 / Not populated | Y / N / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15710 / TRAILING_STS | Not populated / Trailing Status / TRAILINGSTS | 10 / 10 / 2900 / Not populated | Y / N / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15711 / LEADING_STS | Not populated / Leading Status / LEADINGSTS | 10 / 10 / 3000 / Not populated | Y / N / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15712 / SHIP_TO | Not populated / Ship To / SHIPTO | 10 / 10 / 3100 / Not populated | Y / N / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15713 / SHIP_TO_NAME | Not populated / Ship To Name / SHIPTONAME | 10 / 10 / 3200 / Not populated | Y / N / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15714 / COMPANY | Not populated / Company / COMPANY | 10 / 10 / 3300 / Not populated | Y / N / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15715 / LAUNCH_NUM | Not populated / Wave Number / WAVENUMBER | 10 / 10 / 3350 / Not populated | Y / N / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15716 / CUSTOMER | Not populated / Customer / CUSTOMER | 10 / 10 / 3400 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15717 / ORDER_TYPE | Not populated / Order Type / ORDERTYPE | 10 / 10 / 12000 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15718 / WAREHOUSE | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 14000 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15719 / INTERNAL_SHIPMENT_NUM | Internal_Shipment_Num / Internal Shipment Number / INTERNALSHIPMENTNUM | 10 / 10 / 15000 / Not populated | Y / N / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15724 / IN_DELETION | Not populated / In Deletion / INDELETION | 40 / 10 / 16000 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15725 / LOCKED | Not populated / Locked / LOCKED | 40 / 10 / 16500 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15726 / IN_CONFIRMATION | Not populated / In Confirmation / INCONFIRMATION | 40 / 10 / 17000 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15727 / RELEASED | Not populated / Released / RELEASED | 40 / 10 / 17500 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15728 / LEADINGSTS | Not populated / Leading Status (Numeric) / LEADINGSTSNUMERIC | 20 / 10 / 18000 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15729 / TRAILINGSTS | Not populated / Trailing Status (Numeric) / TRAILINGSTSNUMERIC | 20 / 10 / 19000 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15730 / IMMD_NEEDS_REQ_CREATED | Not populated / Immediate Needs Request Created / IMMDNEEDSREQCREATED | 40 / 10 / 20000 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15731 / CREATION_DATE_TIME_STAMP | Not populated / Creation Date Time / CREATIONDATETIMESTAMP | 30 / 10 / 20200 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15732 / PLANNED_SHIP_DATE | Not populated / Planned Ship Date / PLANNEDSHIPDATE | 30 / 10 / 20300 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15733 / REQUESTED_DELIVERY_DATE | Not populated / Requested Delivery Date / REQUESTED_DELIVERY_DATE | 30 / 10 / 20400 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15734 / SHIPMENT_HEADER_TOTAL_QTY | Not populated / Total Quantity / TOTALQUANTITY | 20 / 10 / 20500 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 15735 / TOTAL_WEIGHT | Not populated / Total Weight / TOTALWEIGHT | 20 / 10 / 20600 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=60; DATA_SOURCE_TYPE=None |
| 15736 / LAUNCH_NAME | Not populated / Wave Name / WAVENAME | 10 / 10 / 20700 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15737 / IMMEDIATE_NEEDS_NOTE | Not populated / Immediate Needs Note (Shipment Header) / SHIPMENTHEADERIMMEDIATENEEDSNOTE | 10 / 10 / 20800 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15738 / CUSTOMER_PO | Not populated / Customer PO / CUSTOMERPO | 10 / 10 / 20900 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15739 / COLOR | Not populated / Color / COLOR | 10 / 10 / 21000 / 1 | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 15702 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 21010 / Not populated | Y / N / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 3724: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 15604 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / N | Fixed to top=N; loading=0; nested unit=15604; default=None |
| 15605 / DetailPaneHeaderPanelTrailLeadSts | Not populated | Not populated / Not populated | 60 / 10000 | Y / N | Fixed to top=N; loading=0; nested unit=15605; default=None |
| 15606 / indicatorpane | Not populated | Not populated / Not populated | 60 / 15000 | Y / N | Fixed to top=N; loading=0; nested unit=15606; default=None |

#### Group 15604: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45677 / DetailPaneHeaderShipmentID | Not populated / Not populated | 240 / 250 | Y / N | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=492; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45678 / DetailPaneHeaderCustomer | Not populated / Not populated | 30 / 500 | Y / N | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=492; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45679 / DetailPaneHeaderShipTo | Not populated / Not populated | 30 / 750 | Y / N | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=492; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45680 / DetailPaneHeaderCarrier | Not populated / Not populated | 30 / 1000 | Y / N | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=492; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45681 / DetailPaneHeaderService | Not populated / Not populated | 30 / 1250 | Y / N | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=492; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 15605: DetailPaneHeaderPanelTrailLeadSts — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45682 / DetailPaneHeaderTrailingSts | Not populated / Not populated | 30 / 1500 | Y / N | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=493; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45683 / DetailPaneHeaderLeadingSts | Not populated / Not populated | 30 / 1750 | Y / N | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=493; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 15606: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45684 / ShipmentInsightWavedIndicatorTileLines | Lines / LINES | 360 / 250 | Y / N | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 45685 / ShipmentInsightWavedIndicatorTileContainers | Containers / CONTAINERS | 360 / 500 | Y / N | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 88 control attributes, 42 events, and 109 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 35314 | 45616 / SaveSearchNameEditor | data-rule-required | Y / N / Y | 8 / 0 |
| 35315 | 45616 / SaveSearchNameEditor | data-msg-required | Y / N / Y | 32 / 0 |
| 35316 | 45627 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / N / N | 4 / 0 |
| 35317 | 45632 / ListPaneMenuActionNew | data-formId | Y / N / N | 8 / 0 |
| 35318 | 45632 / ListPaneMenuActionNew | data-securityCheckpoint | Y / N / N | 2 / 0 |
| 35319 | 45633 / ListPaneMenuActionCopy | data-formId | Y / N / N | 8 / 0 |
| 35320 | 45633 / ListPaneMenuActionCopy | data-securityCheckpoint | Y / N / N | 2 / 0 |
| 35321 | 45634 / ListPaneMenuActionEdit | data-formId | Y / N / N | 8 / 0 |
| 35322 | 45634 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / N / N | 2 / 0 |
| 35323 | 45635 / ListPaneMenuActionView | data-formId | Y / N / N | 8 / 0 |
| 35324 | 45636 / ListPaneMenuActionDeleteShipment | data-allowOnMultiSelect | Y / N / N | 8 / 0 |
| 35325 | 45636 / ListPaneMenuActionDeleteShipment | data-formId | Y / N / N | 8 / 0 |
| 35326 | 45636 / ListPaneMenuActionDeleteShipment | data-divider | Y / N / N | 8 / 0 |
| 35327 | 45636 / ListPaneMenuActionDeleteShipment | data-securityCheckpoint | Y / N / N | 2 / 0 |
| 35328 | 45637 / ListPaneMenuActionNewLine | data-formId | Y / N / N | 8 / 0 |
| 35329 | 45637 / ListPaneMenuActionNewLine | data-securityCheckpoint | Y / N / N | 2 / 0 |
| 35330 | 45637 / ListPaneMenuActionNewLine | data-divider | Y / N / N | 8 / 0 |
| 35331 | 45638 / ListPaneMenuActionViewAccessorials | data-formId | Y / N / N | 8 / 0 |
| 35332 | 45639 / ListPaneMenuActionEditAccessorials | data-formId | Y / N / N | 8 / 0 |
| 35333 | 45639 / ListPaneMenuActionEditAccessorials | data-securityCheckpoint | Y / N / N | 2 / 0 |
| 35334 | 45640 / ListPaneMenuActionCancelShipment | data-allowOnMultiSelect | Y / N / N | 8 / 0 |
| 35335 | 45640 / ListPaneMenuActionCancelShipment | data-securityCheckpoint | Y / N / N | 4 / 0 |
| 35336 | 45641 / ListPaneMenuActionConfirmShipment | data-allowOnMultiSelect | Y / N / N | 8 / 0 |
| 35337 | 45641 / ListPaneMenuActionConfirmShipment | data-securityCheckpoint | Y / N / N | 4 / 0 |
| 35338 | 45642 / ListPaneMenuActionConsolidateShipment | data-formId | Y / N / N | 8 / 0 |
| 35339 | 45642 / ListPaneMenuActionConsolidateShipment | data-securityCheckpoint | Y / N / N | 2 / 0 |
| 35340 | 45643 / ListPaneMenuActionImmediateNeeds | data-formId | Y / N / N | 8 / 0 |
| 35341 | 45643 / ListPaneMenuActionImmediateNeeds | data-securityCheckpoint | Y / N / N | 2 / 0 |
| 35347 | 45646 / ListPaneMenuActionShipLevelManifest | data-formId | Y / N / N | 8 / 0 |
| 35348 | 45646 / ListPaneMenuActionShipLevelManifest | data-securityCheckpoint | Y / N / N | 2 / 0 |
| 35349 | 45647 / ListPaneMenuActionShipLevelPack | data-formId | Y / N / N | 8 / 0 |
| 35350 | 45647 / ListPaneMenuActionShipLevelPack | data-securityCheckpoint | Y / N / N | 2 / 0 |
| 35351 | 45648 / ListPaneMenuActionReceiptFromShipment | data-formId | Y / N / N | 8 / 0 |
| 35352 | 45648 / ListPaneMenuActionReceiptFromShipment | data-securityCheckpoint | Y / N / N | 2 / 0 |
| 35353 | 45649 / ListPaneMenuActionRemoveFromLoad | data-allowOnMultiSelect | Y / N / N | 8 / 0 |
| 35354 | 45649 / ListPaneMenuActionRemoveFromLoad | data-securityCheckpoint | Y / N / N | 4 / 0 |
| 35355 | 45650 / ListPaneMenuActionRouteShipment | data-securityCheckpoint | Y / N / N | 4 / 0 |
| 35345 | 45645 / ListPaneMenuActionLoadTransfer | data-allowOnMultiSelect | Y / N / N | 8 / 0 |
| 35356 | 45651 / ListPaneMenuActionSplitShipment | data-formId | Y / N / N | 8 / 0 |
| 35357 | 45651 / ListPaneMenuActionSplitShipment | data-securityCheckpoint | Y / N / N | 2 / 0 |
| 35358 | 45652 / ListPaneMenuActionVasActivity | data-formId | Y / N / N | 8 / 0 |
| 35359 | 45652 / ListPaneMenuActionVasActivity | data-securityCheckpoint | Y / N / N | 2 / 0 |
| 35360 | 45653 / ListPaneMenuActionPrintPreviewDocs | data-securityCheckpoint | Y / N / N | 4 / 0 |
| 35361 | 45654 / ListPaneMenuActionPrintShipmentDocs | data-securityCheckpoint | Y / N / N | 4 / 0 |
| 35362 | 45655 / ListPaneMenuActionPrintSelectedShipmentDocs | data-securityCheckpoint | Y / N / N | 4 / 0 |
| 35363 | 45656 / BasicCriteriaShipmentId | data-dbcolumn | Y / N / N | 22 / 0 |
| 35364 | 45656 / BasicCriteriaShipmentId | Lookup | Y / N / N | 88 / 1 |
| 35365 | 45657 / BasicCriteriaItem | data-dbcolumn | Y / N / N | 8 / 0 |
| 35366 | 45657 / BasicCriteriaItem | Lookup | Y / N / N | 54 / 0 |
| 35390 | 45668 / SearchPaneComp | data-dbcolumn | Y / N / N | 14 / 0 |
| 35391 | 45669 / SearchPaneCarrierAndService | data-parentdbcolumn | Y / N / N | 46 / 0 |
| 35392 | 45669 / SearchPaneCarrierAndService | data-childdbcolumn | Y / N / N | 30 / 0 |
| 35367 | 45658 / BasicCriteriaCustomer | data-dbcolumn | Y / N / N | 16 / 0 |
| 35368 | 45658 / BasicCriteriaCustomer | Lookup | Y / N / N | 78 / 0 |
| 35369 | 45659 / BasicCriteriaShipTo | data-dbcolumn | Y / N / N | 14 / 0 |
| 35370 | 45659 / BasicCriteriaShipTo | Lookup | Y / N / N | 68 / 0 |
| 35371 | 45660 / BasicCriteriaErpOrder | data-dbcolumn | Y / N / N | 50 / 0 |
| 35372 | 45660 / BasicCriteriaErpOrder | Lookup | Y / N / N | 78 / 1 |
| 35373 | 45661 / BasicCriteriaOrderType | data-dbcolumn | Y / N / N | 52 / 0 |
| 35374 | 45662 / BasicCriteriaShippingLoad | data-dbcolumn | Y / N / N | 34 / 0 |
| 35375 | 45662 / BasicCriteriaShippingLoad | Lookup | Y / N / N | 106 / 1 |
| 35376 | 45662 / BasicCriteriaShippingLoad | nullable | Y / N / Y | 8 / 0 |
| 35393 | 45670 / SearchPaneDockDoor | data-dbcolumn | Y / N / N | 18 / 0 |
| 35394 | 45670 / SearchPaneDockDoor | data-dataType | Y / N / N | 2 / 0 |
| 35377 | 45663 / BasicCriteriaWaveNumber | data-dbcolumn | Y / N / N | 20 / 0 |
| 35378 | 45663 / BasicCriteriaWaveNumber | Lookup | Y / N / N | 106 / 1 |
| 35379 | 45663 / BasicCriteriaWaveNumber | nullable | Y / N / Y | 8 / 0 |
| 35380 | 45664 / BasicCriteriaScheduledShipDateRange | data-dbcolumn | Y / N / N | 38 / 0 |
| 35381 | 45664 / BasicCriteriaScheduledShipDateRange | data-dateOnly | Y / N / Y | 8 / 0 |
| 35388 | 45667 / SearchPaneWhs | defaultValue | Y / N / Y | 32 / 0 |
| 35389 | 45667 / SearchPaneWhs | data-dbcolumn | Y / N / N | 18 / 0 |
| 35382 | 45665 / BasicCriteriaConfirmedShipments | data-dbcolumn | Y / N / N | 56 / 0 |
| 35383 | 45665 / BasicCriteriaConfirmedShipments | data-positiveCondition | Y / N / N | 0 / 0 |
| 35384 | 45665 / BasicCriteriaConfirmedShipments | data-negativeCondition | Y / N / N | 10 / 0 |
| 35385 | 45666 / BasicCriteriaShowCrossDockPending | data-dbcolumn | Y / N / N | 56 / 0 |
| 35386 | 45666 / BasicCriteriaShowCrossDockPending | data-positiveCondition | Y / N / N | 8 / 0 |
| 35387 | 45666 / BasicCriteriaShowCrossDockPending | data-negativeCondition | Y / N / N | 0 / 0 |
| 35395 | 45674 / ListPaneSummaryDetails | data-aggregateClause | Y / N / Y | 32 / 0 |
| 35396 | 45675 / ListPaneSummaryContainers | data-aggregateClause | Y / N / Y | 42 / 0 |
| 35397 | 45676 / ListPaneDataGrid | data-dbtable | Y / N / N | 60 / 0 |
| 35398 | 45676 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / N / N | 20 / 0 |
| 35399 | 45676 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / N / N | 42 / 0 |
| 35400 | 45676 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / N / N | 34 / 0 |
| 35401 | 45676 / ListPaneDataGrid | multipleSelection | Y / N / Y | 8 / 0 |
| 35402 | 45676 / ListPaneDataGrid | rowSelectors | Y / N / Y | 8 / 0 |
| 35403 | 45677 / DetailPaneHeaderShipmentID | href | Y / N / Y | 164 / 0 |
| 35404 | 45684 / ShipmentInsightWavedIndicatorTileLines | data-indicatorTileGoToInsight | Y / N / Y | 262 / 0 |
| 35405 | 45685 / ShipmentInsightWavedIndicatorTileContainers | data-indicatorTileGoToInsight | Y / N / Y | 374 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 15300 / click | 45617 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / N |
| 15301 / click | 45618 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / N |
| 15302 / click | 45620 / SplitShipmentConfirmationSplitButton | _webUi.shipmentInsight.splitShipmentConfirmation | Not populated | Y / N |
| 15303 / click | 45621 / SplitShipmentConfirmationSplitNotInRangeButton | _webUi.shipmentInsight.splitShipmentConfirmation | Not populated | Y / N |
| 15304 / click | 45622 / SplitShipmentConfirmationNoSplitButton | _webUi.shipmentInsight.splitShipmentConfirmation | Not populated | Y / N |
| 15305 / click | 45623 / SplitShipmentConfirmationCancelButton | _webUi.shipmentInsight.splitShipmentConfirmation | Not populated | Y / N |
| 15306 / click | 45624 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / N |
| 15307 / click | 45625 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / N |
| 15308 / click | 45626 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / N |
| 15309 / click | 45627 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / N |
| 15310 / click | 45628 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / N |
| 15311 / click | 45629 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / N |
| 15312 / click | 45630 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / N |
| 15313 / click | 45631 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / N |
| 15314 / click | 45632 / ListPaneMenuActionNew | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / N |
| 15315 / click | 45633 / ListPaneMenuActionCopy | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / N |
| 15316 / click | 45634 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / N |
| 15317 / click | 45635 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / N |
| 15318 / click | 45636 / ListPaneMenuActionDeleteShipment | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / N |
| 15319 / click | 45637 / ListPaneMenuActionNewLine | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / N |
| 15320 / click | 45638 / ListPaneMenuActionViewAccessorials | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / N |
| 15321 / click | 45639 / ListPaneMenuActionEditAccessorials | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / N |
| 15322 / click | 45640 / ListPaneMenuActionCancelShipment | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / N |
| 15323 / click | 45641 / ListPaneMenuActionConfirmShipment | _webUi.shipmentInsight.shipmentConfirmation | Not populated | Y / N |
| 15324 / click | 45642 / ListPaneMenuActionConsolidateShipment | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / N |
| 15325 / click | 45643 / ListPaneMenuActionImmediateNeeds | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / N |
| 15328 / click | 45646 / ListPaneMenuActionShipLevelManifest | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / N |
| 15329 / click | 45647 / ListPaneMenuActionShipLevelPack | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / N |
| 15330 / click | 45648 / ListPaneMenuActionReceiptFromShipment | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / N |
| 15331 / click | 45649 / ListPaneMenuActionRemoveFromLoad | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / N |
| 15332 / click | 45650 / ListPaneMenuActionRouteShipment | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / N |
| 15326 / click | 45644 / ListPaneMenuActionAddFilteredShipmentsToLoad | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTabWithPost | Not populated | Y / N |
| 15327 / click | 45645 / ListPaneMenuActionLoadTransfer | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTabWithPost | Not populated | Y / N |
| 15333 / click | 45651 / ListPaneMenuActionSplitShipment | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / N |
| 15334 / click | 45652 / ListPaneMenuActionVasActivity | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / N |
| 15335 / click | 45653 / ListPaneMenuActionPrintPreviewDocs | _webUi.dialog.printPreviewSelection | Not populated | Y / N |
| 15336 / click | 45654 / ListPaneMenuActionPrintShipmentDocs | _webUi.insightListPaneActions.menuActionPerformGet | Not populated | Y / N |
| 15337 / click | 45655 / ListPaneMenuActionPrintSelectedShipmentDocs | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / N |
| 15338 / iggridrequesterror | 45676 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / N |
| 15339 / iggriddatabound | 45676 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / N |
| 15340 / iggridselectionrowselectionchanged | 45676 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / N |
| 15341 / iggridselectionactiverowchanged | 45676 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / N |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 21331 / 15300 | GETServiceURL | Y / N | 76 |
| 21332 / 15300 | queryParameter_Function_ScreenPartId | Y / N | 98 |
| 21333 / 15300 | queryParameter_Function_UserName | Y / N | 44 |
| 21334 / 15300 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / N | 10 |
| 21335 / 15300 | POSTServiceURL | Y / N | 74 |
| 21336 / 15300 | PostData_Function_ScreenPartId | Y / N | 98 |
| 21337 / 15300 | PostData_Function_UserName | Y / N | 44 |
| 21338 / 15300 | PostData_Input_SaveSearchNameEditor_SearchName | Y / N | 10 |
| 21339 / 15300 | PostData_Function_SearchValue | Y / N | 98 |
| 21340 / 15300 | Post_SuccessCallback | Y / N | 114 |
| 21341 / 15300 | ModalDialogName | Y / N | 42 |
| 21342 / 15301 | ModalDialogName | Y / N | 42 |
| 21343 / 15302 | splitType | Y / N | 2 |
| 21344 / 15302 | modelDialog | Y / N | 72 |
| 21345 / 15303 | splitType | Y / N | 2 |
| 21346 / 15303 | modelDialog | Y / N | 72 |
| 21347 / 15304 | splitType | Y / N | 2 |
| 21348 / 15304 | modelDialog | Y / N | 72 |
| 21349 / 15305 | modelDialog | Y / N | 72 |
| 21350 / 15309 | ModalDialogName | Y / N | 42 |
| 21351 / 15314 | URL | Y / N | 32 |
| 21352 / 15315 | URL | Y / N | 154 |
| 21353 / 15316 | URL | Y / N | 148 |
| 21354 / 15317 | URL | Y / N | 148 |
| 21355 / 15318 | ConfirmationMessageCode | Y / N | 40 |
| 21356 / 15318 | POSTServiceURL | Y / N | 110 |
| 21357 / 15318 | PostData_Grid_ListPaneDataGrid_InternalShipmentNum | Y / N | 42 |
| 21358 / 15318 | Post_SuccessCallback | Y / N | 140 |
| 21359 / 15319 | queryParameter_Grid_ListPaneDataGrid_InternalShipmentNum | Y / N | 42 |
| 21360 / 15319 | URL | Y / N | 136 |
| 21361 / 15320 | queryParameter_Grid_ListPaneDataGrid_InternalNum | Y / N | 42 |
| 21362 / 15320 | URL | Y / N | 188 |
| 21363 / 15320 | queryParameter_InternalNumType | Y / N | 16 |
| 21364 / 15321 | queryParameter_Grid_ListPaneDataGrid_InternalNum | Y / N | 42 |
| 21365 / 15321 | URL | Y / N | 188 |
| 21366 / 15321 | queryParameter_InternalNumType | Y / N | 16 |
| 21367 / 15322 | ConfirmationMessageCode | Y / N | 40 |
| 21368 / 15322 | POSTServiceURL | Y / N | 114 |
| 21369 / 15322 | PostData_Grid_ListPaneDataGrid_InternalShipmentNum | Y / N | 42 |
| 21370 / 15322 | Post_SuccessCallback | Y / N | 140 |
| 21371 / 15323 | PostData_InternalShipmentNum | Y / N | 38 |
| 21372 / 15324 | URL | Y / N | 188 |
| 21373 / 15325 | URL | Y / N | 254 |
| 21379 / 15328 | URL | Y / N | 172 |
| 21380 / 15329 | queryParameter_Grid_ListPaneDataGrid_CustomerValue | Y / N | 16 |
| 21381 / 15329 | queryParameter_Grid_ListPaneDataGrid_CustomerPO | Y / N | 22 |
| 21382 / 15329 | URL | Y / N | 580 |
| 21383 / 15329 | queryParameter_ShipmentID | Y / N | 20 |
| 21384 / 15329 | queryParameter_ErpOrder | Y / N | 16 |
| 21385 / 15329 | queryParameter_CustomerValue | Y / N | 26 |
| 21386 / 15329 | queryParameter_CustomerPO | Y / N | 20 |
| 21387 / 15329 | queryParameter_Invoice | Y / N | 14 |
| 21388 / 15329 | queryParameter_PickListId | Y / N | 20 |
| 21389 / 15329 | queryParameter_UserDef1 | Y / N | 16 |
| 21390 / 15329 | queryParameter_UserDef2 | Y / N | 16 |
| 21391 / 15329 | queryParameter_UserDef3 | Y / N | 16 |
| 21392 / 15329 | queryParameter_UserDef4 | Y / N | 16 |
| 21393 / 15329 | queryParameter_UserDef5 | Y / N | 16 |
| 21394 / 15329 | queryParameter_UserDef6 | Y / N | 16 |
| 21395 / 15329 | queryParameter_UserDef7 | Y / N | 16 |
| 21396 / 15329 | queryParameter_UserDef8 | Y / N | 16 |
| 21397 / 15330 | URL | Y / N | 188 |
| 21398 / 15331 | ConfirmationMessageCode | Y / N | 40 |
| 21399 / 15331 | POSTServiceURL | Y / N | 116 |
| 21400 / 15331 | PostData_Grid_ListPaneDataGrid_InternalShipmentNum | Y / N | 42 |
| 21401 / 15331 | Post_SuccessCallback | Y / N | 140 |
| 21402 / 15332 | POSTServiceURL | Y / N | 104 |
| 21403 / 15332 | PostData_InternalShipmentNum | Y / N | 38 |
| 21404 / 15332 | Post_SuccessCallback | Y / N | 140 |
| 21374 / 15326 | POSTServiceURL | Y / N | 146 |
| 21375 / 15326 | PostData_Grid_ListPaneDataGrid_InternalShipmentNumber | Y / N | 42 |
| 21376 / 15326 | CheckForFilters | Y / N | 8 |
| 21377 / 15327 | POSTServiceURL | Y / N | 102 |
| 21378 / 15327 | PostData_Grid_ListPaneDataGrid_InternalShipmentNumber | Y / N | 42 |
| 21405 / 15333 | URL | Y / N | 188 |
| 21406 / 15334 | URL | Y / N | 316 |
| 21407 / 15335 | queryParameter_Grid_ListPaneDataGrid_internalNum | Y / N | 42 |
| 21408 / 15335 | printProcess | Y / N | 4 |
| 21409 / 15336 | GETServiceURL | Y / N | 54 |
| 21410 / 15336 | queryParameter_internalNum | Y / N | 38 |
| 21411 / 15336 | queryParameter_printProcess | Y / N | 4 |
| 21412 / 15337 | URL | Y / N | 204 |
| 21413 / 15341 | POSTServiceURL | Y / N | 74 |
| 21414 / 15341 | PostData_internalShipmentNum | Y / N | 42 |
| 21415 / 15341 | PostData_storedProcedure | Y / N | 50 |
| 21416 / 15341 | EnableAction_ListPaneMenuActionPrintShipmentDocs | Y / N | 42 |
| 21417 / 15341 | EnableAction_ListPaneMenuActionPrintSelectedShipmentDocs | Y / N | 42 |
| 21418 / 15341 | EnableAction_ListPaneMenuActionPrintPreviewDocs | Y / N | 42 |
| 21419 / 15341 | EnableAction_ListPaneMenuActionShipLevelManifest | Y / N | 156 |
| 21420 / 15341 | EnableAction_ListPaneMenuActionView | Y / N | 90 |
| 21421 / 15341 | EnableAction_ListPaneMenuActionNew | Y / N | 8 |
| 21422 / 15341 | EnableAction_ListPaneMenuActionCopy | Y / N | 90 |
| 21423 / 15341 | EnableAction_ListPaneMenuActionVasActivity | Y / N | 90 |
| 21424 / 15341 | EnableAction_ListPaneMenuActionReceiptFromShipment | Y / N | 148 |
| 21425 / 15341 | EnableAction_ListPaneMenuActionEdit | Y / N | 42 |
| 21426 / 15341 | EnableAction_ListPaneMenuActionViewAccessorials | Y / N | 172 |
| 21427 / 15341 | EnableAction_ListPaneMenuActionEditAccessorials | Y / N | 172 |
| 21428 / 15341 | EnableAction_ListPaneMenuActionCancelShipment | Y / N | 180 |
| 21429 / 15341 | EnableAction_ListPaneMenuActionConfirmShipment | Y / N | 274 |
| 21430 / 15341 | EnableAction_ListPaneMenuActionConsolidateShipment | Y / N | 266 |
| 21431 / 15341 | EnableAction_ListPaneMenuActionLoadTransfer | Y / N | 124 |
| 21432 / 15341 | EnableAction_ListPaneMenuActionRemoveFromLoad | Y / N | 142 |
| 21433 / 15341 | EnableAction_ListPaneMenuActionDeleteShipment | Y / N | 184 |
| 21434 / 15341 | EnableAction_ListPaneMenuActionSplitShipment | Y / N | 128 |
| 21435 / 15341 | EnableAction_ListPaneMenuActionImmediateNeeds | Y / N | 112 |
| 21436 / 15341 | EnableAction_ListPaneMenuActionRouteShipment | Y / N | 228 |
| 21437 / 15341 | EnableAction_ListPaneMenuActionNewLine | Y / N | 184 |
| 21438 / 15341 | EnableAction_ListPaneMenuActionShipLevelPack | Y / N | 220 |
| 21439 / 15341 | EnableAction_ListPaneMenuActionAddFilteredShipmentsToLoad_filterBadge | Y / N | 30 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 81 selected candidate rows for this Screen: **79 accepted tokens** and **2 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 35316 | 45627 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35317 | 45632 / Not applicable | data-formId | form_id | 2760 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35318 | 45632 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35319 | 45633 / Not applicable | data-formId | form_id | 2760 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35320 | 45633 / Not applicable | data-securityCheckpoint | checkpoint | 4 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35321 | 45634 / Not applicable | data-formId | form_id | 2760 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35322 | 45634 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35323 | 45635 / Not applicable | data-formId | form_id | 2760 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35325 | 45636 / Not applicable | data-formId | form_id | 2760 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35327 | 45636 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35328 | 45637 / Not applicable | data-formId | form_id | 3017 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35329 | 45637 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35331 | 45638 / Not applicable | data-formId | form_id | 4050 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35332 | 45639 / Not applicable | data-formId | form_id | 4050 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35333 | 45639 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35335 | 45640 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35337 | 45641 / Not applicable | data-securityCheckpoint | checkpoint | 27 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35338 | 45642 / Not applicable | data-formId | form_id | 3028 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35339 | 45642 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35340 | 45643 / Not applicable | data-formId | form_id | 2767 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35341 | 45643 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35347 | 45646 / Not applicable | data-formId | form_id | 3031 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35348 | 45646 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35349 | 45647 / Not applicable | data-formId | form_id | 4007 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35350 | 45647 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35351 | 45648 / Not applicable | data-formId | form_id | 3036 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35352 | 45648 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35354 | 45649 / Not applicable | data-securityCheckpoint | checkpoint | 32 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35355 | 45650 / Not applicable | data-securityCheckpoint | checkpoint | 35 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35356 | 45651 / Not applicable | data-formId | form_id | 3044 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35357 | 45651 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35358 | 45652 / Not applicable | data-formId | form_id | 3043 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35359 | 45652 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35360 | 45653 / Not applicable | data-securityCheckpoint | checkpoint | 34 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35361 | 45654 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35362 | 45655 / Not applicable | data-securityCheckpoint | checkpoint | 33 | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35363 | 45656 / Not applicable | data-dbcolumn | database_identifier | Shipment_Id | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35365 | 45657 / Not applicable | data-dbcolumn | database_identifier | Item | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35367 | 45658 / Not applicable | data-dbcolumn | database_identifier | Customer | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35369 | 45659 / Not applicable | data-dbcolumn | database_identifier | Ship_To | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35371 | 45660 / Not applicable | data-dbcolumn | database_identifier | Shipment_Header_Erp_Order | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35373 | 45661 / Not applicable | data-dbcolumn | database_identifier | Shipment_Header_Order_Type | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35374 | 45662 / Not applicable | data-dbcolumn | database_identifier | Shipping_Load_Num | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35377 | 45663 / Not applicable | data-dbcolumn | database_identifier | Launch_Num | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35380 | 45664 / Not applicable | data-dbcolumn | database_identifier | Scheduled_Ship_Date | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35382 | 45665 / Not applicable | data-dbcolumn | database_identifier | Shipment_Header_Trailing_Sts | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35385 | 45666 / Not applicable | data-dbcolumn | database_identifier | Shipment_Header_Trailing_Sts | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35389 | 45667 / Not applicable | data-dbcolumn | database_identifier | Warehouse | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35390 | 45668 / Not applicable | data-dbcolumn | database_identifier | Company | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35393 | 45670 / Not applicable | data-dbcolumn | database_identifier | Dock_Door | Y / N |
| SCREEN_CONTROL_ATTRIBUTES / 35397 | 45676 / Not applicable | data-dbtable | database_identifier | Metadata_Insight_Shipment_View | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21331 | 45617 / 15300 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21335 | 45617 / 15300 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21340 | 45617 / 15300 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21355 | 45636 / 15318 | ConfirmationMessageCode | resource_code | MSG_DELETESHIPMENT01 | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21356 | 45636 / 15318 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShipmentHeadersApi/Shipments-Deleted | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21357 | 45636 / 15318 | PostData_Grid_ListPaneDataGrid_InternalShipmentNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21358 | 45636 / 15318 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21359 | 45637 / 15319 | queryParameter_Grid_ListPaneDataGrid_InternalShipmentNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21361 | 45638 / 15320 | queryParameter_Grid_ListPaneDataGrid_InternalNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21364 | 45639 / 15321 | queryParameter_Grid_ListPaneDataGrid_InternalNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21367 | 45640 / 15322 | ConfirmationMessageCode | resource_code | MSG_CANCELSHIPMENT01 | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21368 | 45640 / 15322 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShipmentHeadersApi/Shipments-Cancelled | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21369 | 45640 / 15322 | PostData_Grid_ListPaneDataGrid_InternalShipmentNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21370 | 45640 / 15322 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21375 | 45644 / 15326 | PostData_Grid_ListPaneDataGrid_InternalShipmentNumber | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21378 | 45645 / 15327 | PostData_Grid_ListPaneDataGrid_InternalShipmentNumber | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21380 | 45647 / 15329 | queryParameter_Grid_ListPaneDataGrid_CustomerValue | grid_field_identifier | CUSTOMER | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21381 | 45647 / 15329 | queryParameter_Grid_ListPaneDataGrid_CustomerPO | grid_field_identifier | CUSTOMER_PO | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21398 | 45649 / 15331 | ConfirmationMessageCode | resource_code | MSG_REMOVESHIPMENT01 | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21399 | 45649 / 15331 | POSTServiceURL | relative_api_path | /outbound/scaleapi/shipmentheadersapi/Shipments-Unassigned | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21400 | 45649 / 15331 | PostData_Grid_ListPaneDataGrid_InternalShipmentNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21401 | 45649 / 15331 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21402 | 45650 / 15332 | POSTServiceURL | relative_api_path | /outbound/scaleapi/shipmentheadersapi/RouteShipment? | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21404 | 45650 / 15332 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21407 | 45653 / 15335 | queryParameter_Grid_ListPaneDataGrid_internalNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21409 | 45654 / 15336 | GETServiceURL | relative_api_path | /general/scaleapi/PrintApi? | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21413 | 45676 / 15341 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / N |
| SCREEN_CONTROL_EVENT_PARAMETERS / 21415 | 45676 / 15341 | PostData_storedProcedure | stored_procedure_identifier | SHP_InsightDetailPaneData | Y / N |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
