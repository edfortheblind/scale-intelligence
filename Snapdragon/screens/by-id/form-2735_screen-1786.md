# Shipment Insight — Form 2735, Screen 1786

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2735 |
| MAIN_UI_SCREEN Object ID | 1786 |
| Label / Form resource key | Shipment Insight / MNU_SHIPMENTINSIGHT |
| Functional area code | 40 |
| Active / System created / Show in application menu | N / Y / Y |
| Route category / path type code | inactive / 6 |
| Configured path | /scale/insights/2735 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2735 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2735 |
| Inspection requirement | do_not_count_as_current_route |
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

Shipment Insight is recorded as `inactive`. Its saved configuration contains 7 parts, 27 groups, 74 controls, and 39 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions. The main UI Screen record is inactive in the saved metadata; it is preserved for completeness and is not counted as a confirmed active runtime screen.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4435 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4436 / SplitShipmentConfirmationModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SplitShipmentConfirmationCancelButton |
| 4437 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4438 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4439 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4440 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4441 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4435: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18249 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18249; default=None |
| 18250 / SaveSearchModalDialogHeader | 18249 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18249; default=None |
| 18251 / SaveSearchModalDialogBody | 18249 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18249; default=None |
| 18252 / SaveSearchModalDialogFooter | 18249 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18249; default=None |

#### Group 18251: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52014 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18252: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52015 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52016 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4436: SplitShipmentConfirmationModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18253 / SplitShipmentConfirmationModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18253; default=None |
| 18254 / SplitShipmentConfirmationModalDialogHeader | 18253 | Confirmation / CONFIRMATION | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18253; default=None |
| 18255 / SplitShipmentConfirmationModalDialogBody | 18253 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18253; default=None |
| 18256 / SplitShipmentConfirmationModalDialogFooter | 18253 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18253; default=None |

#### Group 18255: SplitShipmentConfirmationModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52017 / SplitShipmentConfirmationMessage | One or more of the shipments chosen for confirmation are not in the proper status.  Please choose an action from the selections below. / SPLITINSTRUCTIONS | 30 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18256: SplitShipmentConfirmationModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52018 / SplitShipmentConfirmationSplitButton | Split / BTN_SPLIT | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52019 / SplitShipmentConfirmationSplitNotInRangeButton | Split Shipment If Not in Range / SPLITNOTINRANGE | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52020 / SplitShipmentConfirmationNoSplitButton | Do Not Split Shipment / DONOTSPLIT | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52021 / SplitShipmentConfirmationCancelButton | Cancel / CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4437: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18257 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18257; default=None |
| 18258 / GadgetCalculationQueryDialogHeader | 18257 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18257; default=None |
| 18259 / GadgetCalculationQueryDialogBody | 18257 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18257; default=None |
| 18260 / GadgetCalculationQueryDialogFooter | 18257 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18257; default=None |

#### Group 18259: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52022 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18260: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52023 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52024 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4438: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18261 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18261; default=None |
| 18262 / InsightMenuPanel | 18261 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18261; default=None |
| 18263 / InsightMenuFavoritesDropdown | 18261 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18261; default=None |
| 18264 / InsightListPaneMenuPanel | 18261 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18261; default=None |
| 18265 / MenuExportToExcelPanel | 18261 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18261; default=None |
| 18266 / InsightMenuActionsDropdown | 18261 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18261; default=None |
| 18267 / InsightMenuPrintActionsDropdown | 18261 | Print / PRINT | 80 / 15550 | Y / Y | Fixed to top=N; loading=0; nested unit=18261; default=None |

#### Group 18262: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52025 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 52026 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 52027 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 52028 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18264: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52029 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52030 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 52031 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 52032 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18265: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52033 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18266: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52034 / ListPaneMenuActionNew | New / NEW | 150 / 2200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEW |
| 52035 / ListPaneMenuActionCopy | Copy / COPY | 150 / 2350 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=COPY |
| 52036 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 52037 / ListPaneMenuActionView | View / VIEW | 150 / 2750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 52038 / ListPaneMenuActionDeleteShipment | Delete / DELETE | 150 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 52039 / ListPaneMenuActionNewLine | New Line / NEWLINE | 150 / 3200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CONFIRM |
| 52040 / ListPaneMenuActionViewAccessorials | View Accessorials / VIEWACCESSORIALS | 150 / 3250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEWACCESSORIALS |
| 52041 / ListPaneMenuActionEditAccessorials | Edit Accessorials / EDITACCESSORIALS | 150 / 3250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDITACCESSORIALS |
| 52042 / ListPaneMenuActionCancelShipment | Cancel / CANCEL | 150 / 3300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CANCEL |
| 52043 / ListPaneMenuActionConfirmShipment | Confirm / CONFIRM | 150 / 3500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CONFIRM |
| 52044 / ListPaneMenuActionConsolidateShipment | Consolidate / CONSOLIDATE | 150 / 3750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CONSOLIDATE |
| 52045 / ListPaneMenuActionImmediateNeeds | Immediate Needs / IMMEDIATENEEDS | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=IMMEDIATENEEDS |
| 52048 / ListPaneMenuActionShipLevelManifest | Manifest At Shipment Level / MANIFESTSHIPLEVEL | 150 / 4250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=MANIFESTSHIPLEVEL |
| 52049 / ListPaneMenuActionShipLevelPack | Pack / PACK | 150 / 4570 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PACK |
| 52050 / ListPaneMenuActionReceiptFromShipment | Receipt From Shipment / RECEIPTFROMSHIPMENT | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=RECEIPTFROMSHIPMENT |
| 52051 / ListPaneMenuActionRemoveFromLoad | Remove From Load / REMOVEFROMLOAD | 150 / 5250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=REMOVEFROMLOAD |
| 52052 / ListPaneMenuActionRouteShipment | Route / ROUTE | 150 / 5500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ROUTE |
| 52046 / ListPaneMenuActionAddFilteredShipmentsToLoad | Transfer All Filtered Shipments to Load / TRANSFILTSHIPTOLOAD | 150 / 5700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ADDFILTSHIPTOWAVE |
| 52047 / ListPaneMenuActionLoadTransfer | Transfer Shipment / TRANSFERSHIPMENT | 150 / 5750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TRANSFERSHIPMENT |
| 52053 / ListPaneMenuActionSplitShipment | Split Shipment / SPLITSHIPMENT | 150 / 6000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SPLITSHIPMENT |
| 52054 / ListPaneMenuActionVasActivity | VAS Activity / VASACTIVITY | 150 / 6500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VASACTIVITY |

#### Group 18267: InsightMenuPrintActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52055 / ListPaneMenuActionPrintPreviewDocs | Print Preview / PRINTPREVIEW | 150 / 4300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTPREVIEW |
| 52056 / ListPaneMenuActionPrintShipmentDocs | Print Default Docs / PRINTDEFAULTDOCS | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTDEFAULTDOCS |
| 52057 / ListPaneMenuActionPrintSelectedShipmentDocs | Print Selected Docs / PRINTSELECTEDDOCS | 150 / 4750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTSELECTEDDOCS |

### Part 4439: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18268 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18268; default=None |
| 18269 / SearchPaneBasicCriteria | 18268 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18268; default=None |
| 18270 / SearchPaneAdvancedCriteria | 18268 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=18268; default=None |

#### Group 18269: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52058 / BasicCriteriaShipmentId | Shipment ID / SHIPMENTID | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52059 / BasicCriteriaItem | Item / ITEM | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52070 / SearchPaneComp | Company / COMPANY | 280 / 6000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52071 / SearchPaneCarrierAndService | Carrier / CARRIER | 280 / 6500 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52060 / BasicCriteriaCustomer | Customer / CUSTOMER | 10 / 10000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52061 / BasicCriteriaShipTo | Ship To / SHIPTO | 10 / 12500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52062 / BasicCriteriaErpOrder | ERP Order / ERPORDER | 10 / 15000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52063 / BasicCriteriaOrderType | Order Type / ORDERTYPE | 10 / 17500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52064 / BasicCriteriaShippingLoad | Shipping Load / SHIPPINGLOAD | 90 / 20000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52072 / SearchPaneDockDoor | Dock Door / DOCKDOOR | 280 / 21000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52065 / BasicCriteriaWaveNumber | Wave Number / WAVENUMBER | 90 / 22500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52066 / BasicCriteriaScheduledShipDateRange | Scheduled Ship Date / SCHEDULEDSHIPDATE | 190 / 25000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52069 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 26000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52067 / BasicCriteriaConfirmedShipments | Include Confirmed Shipments / INCLUDECONFIRMEDSHIPMENTS | 130 / 27500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52068 / BasicCriteriaShowCrossDockPending | Show Only Cross Dock Pending Shipments / SHOWCROSSDOCKPENDING | 130 / 27700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18270: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52073 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4440: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18271 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18271; default=None |
| 18272 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18272; default=None |

#### Group 18271: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52074 / ListPaneSummaryLoads | Loads / LOADS | 50 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52075 / ListPaneSummaryShipments | Shipments / SHIPMENTS | 50 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52076 / ListPaneSummaryDetails | Lines / LINES | 50 / 7500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52077 / ListPaneSummaryContainers | Containers / CONTAINERS | 50 / 10000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18272: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52078 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 52078 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18648 / Not populated | Shipment_Id / Not populated / Not populated | Not populated / 30 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18667 / Not populated | Shipment_Id / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18668 / Not populated | TOTAL_LINES / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18669 / Not populated | TOTAL_CONTAINERS / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18670 / Not populated | Internal_Shipment_Num / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18650 / ICON | Not populated / Icon / ICON | 10 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18651 / SHIPMENT_ID | Shipment_Id / Shipment ID / SHIPMENTID | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18652 / CUSTOMER_NAME | Not populated / Customer Name / CUSTOMERNAME | 10 / 10 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18653 / SHIPMENT_HEADER_CARRIER | Not populated / Carrier / CARRIER | 10 / 10 / 2500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18654 / CARRIER_SERVICE | Not populated / Carrier Service / CARRIERSERVICE | 10 / 10 / 2600 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18655 / SCHEDULED_SHIP_DATE | Not populated / Scheduled Ship Date / SCHEDULEDSHIPDATE | 30 / 10 / 2700 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18656 / SHIPPING_LOAD_NUM | Not populated / Shipping Load / SHIPPINGLOAD | 10 / 10 / 2800 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18657 / TRAILING_STS | Not populated / Trailing Status / TRAILINGSTS | 10 / 10 / 2900 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18658 / LEADING_STS | Not populated / Leading Status / LEADINGSTS | 10 / 10 / 3000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18659 / SHIP_TO | Not populated / Ship To / SHIPTO | 10 / 10 / 3100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18660 / SHIP_TO_NAME | Not populated / Ship To Name / SHIPTONAME | 10 / 10 / 3200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18661 / COMPANY | Not populated / Company / COMPANY | 10 / 10 / 3300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18662 / LAUNCH_NUM | Not populated / Wave Number / WAVENUMBER | 10 / 10 / 3350 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18663 / CUSTOMER | Not populated / Customer / CUSTOMER | 10 / 10 / 3400 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18664 / ORDER_TYPE | Not populated / Order Type / ORDERTYPE | 10 / 10 / 12000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18665 / WAREHOUSE | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 14000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18666 / INTERNAL_SHIPMENT_NUM | Internal_Shipment_Num / Internal Shipment Number / INTERNALSHIPMENTNUM | 10 / 10 / 15000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18671 / IN_DELETION | Not populated / In Deletion / INDELETION | 40 / 10 / 16000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18672 / LOCKED | Not populated / Locked / LOCKED | 40 / 10 / 16500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18673 / IN_CONFIRMATION | Not populated / In Confirmation / INCONFIRMATION | 40 / 10 / 17000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18674 / RELEASED | Not populated / Released / RELEASED | 40 / 10 / 17500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18675 / LEADINGSTS | Not populated / Leading Status (Numeric) / LEADINGSTSNUMERIC | 20 / 10 / 18000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18676 / TRAILINGSTS | Not populated / Trailing Status (Numeric) / TRAILINGSTSNUMERIC | 20 / 10 / 19000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18677 / IMMD_NEEDS_REQ_CREATED | Not populated / Immediate Needs Request Created / IMMDNEEDSREQCREATED | 40 / 10 / 20000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18678 / CREATION_DATE_TIME_STAMP | Not populated / Creation Date Time / CREATIONDATETIMESTAMP | 30 / 10 / 20200 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18679 / PLANNED_SHIP_DATE | Not populated / Planned Ship Date / PLANNEDSHIPDATE | 30 / 10 / 20300 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18680 / REQUESTED_DELIVERY_DATE | Not populated / Requested Delivery Date / REQUESTED_DELIVERY_DATE | 30 / 10 / 20400 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18681 / SHIPMENT_HEADER_TOTAL_QTY | Not populated / Total Quantity / TOTALQUANTITY | 20 / 10 / 20500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18682 / TOTAL_WEIGHT | Not populated / Total Weight / TOTALWEIGHT | 20 / 10 / 20600 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=60; DATA_SOURCE_TYPE=None |
| 18683 / LAUNCH_NAME | Not populated / Wave Name / WAVENAME | 10 / 10 / 20700 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18684 / IMMEDIATE_NEEDS_NOTE | Not populated / Immediate Needs Note (Shipment Header) / SHIPMENTHEADERIMMEDIATENEEDSNOTE | 10 / 10 / 20800 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18685 / CUSTOMER_PO | Not populated / Customer PO / CUSTOMERPO | 10 / 10 / 20900 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18686 / COLOR | Not populated / Color / COLOR | 10 / 10 / 21000 / 1 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18649 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 21010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4441: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18273 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18273; default=None |
| 18274 / DetailPaneHeaderPanelTrailLeadSts | Not populated | Not populated / Not populated | 60 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18274; default=None |
| 18275 / indicatorpane | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18275; default=None |

#### Group 18273: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52079 / DetailPaneHeaderShipmentID | Not populated / Not populated | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=604; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52080 / DetailPaneHeaderCustomer | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=604; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52081 / DetailPaneHeaderShipTo | Not populated / Not populated | 30 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=604; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52082 / DetailPaneHeaderCarrier | Not populated / Not populated | 30 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=604; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52083 / DetailPaneHeaderService | Not populated / Not populated | 30 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=604; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18274: DetailPaneHeaderPanelTrailLeadSts — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52084 / DetailPaneHeaderTrailingSts | Not populated / Not populated | 30 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=605; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52085 / DetailPaneHeaderLeadingSts | Not populated / Not populated | 30 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=605; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18275: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52086 / ShipmentInsightWavedIndicatorTileLines | Lines / LINES | 360 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52087 / ShipmentInsightWavedIndicatorTileContainers | Containers / CONTAINERS | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 93 control attributes, 45 events, and 117 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 41132 | 52014 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 41133 | 52014 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 41134 | 52028 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41135 | 52029 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41136 | 52034 / ListPaneMenuActionNew | data-formId | Y / Y / N | 8 / 0 |
| 41137 | 52034 / ListPaneMenuActionNew | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41138 | 52035 / ListPaneMenuActionCopy | data-formId | Y / Y / N | 8 / 0 |
| 41139 | 52035 / ListPaneMenuActionCopy | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41140 | 52036 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 41141 | 52036 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41142 | 52037 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 41143 | 52038 / ListPaneMenuActionDeleteShipment | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41144 | 52038 / ListPaneMenuActionDeleteShipment | data-formId | Y / Y / N | 8 / 0 |
| 41145 | 52038 / ListPaneMenuActionDeleteShipment | data-divider | Y / Y / N | 8 / 0 |
| 41146 | 52038 / ListPaneMenuActionDeleteShipment | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41147 | 52039 / ListPaneMenuActionNewLine | data-formId | Y / Y / N | 8 / 0 |
| 41148 | 52039 / ListPaneMenuActionNewLine | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41149 | 52039 / ListPaneMenuActionNewLine | data-divider | Y / Y / N | 8 / 0 |
| 41150 | 52040 / ListPaneMenuActionViewAccessorials | data-formId | Y / Y / N | 8 / 0 |
| 41151 | 52041 / ListPaneMenuActionEditAccessorials | data-formId | Y / Y / N | 8 / 0 |
| 41152 | 52041 / ListPaneMenuActionEditAccessorials | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41153 | 52042 / ListPaneMenuActionCancelShipment | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41154 | 52042 / ListPaneMenuActionCancelShipment | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41155 | 52043 / ListPaneMenuActionConfirmShipment | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41156 | 52043 / ListPaneMenuActionConfirmShipment | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41157 | 52044 / ListPaneMenuActionConsolidateShipment | data-formId | Y / Y / N | 8 / 0 |
| 41158 | 52044 / ListPaneMenuActionConsolidateShipment | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41159 | 52045 / ListPaneMenuActionImmediateNeeds | data-formId | Y / Y / N | 8 / 0 |
| 41160 | 52045 / ListPaneMenuActionImmediateNeeds | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41166 | 52048 / ListPaneMenuActionShipLevelManifest | data-formId | Y / Y / N | 8 / 0 |
| 41167 | 52048 / ListPaneMenuActionShipLevelManifest | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41168 | 52049 / ListPaneMenuActionShipLevelPack | data-formId | Y / Y / N | 8 / 0 |
| 41169 | 52049 / ListPaneMenuActionShipLevelPack | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41170 | 52050 / ListPaneMenuActionReceiptFromShipment | data-formId | Y / Y / N | 8 / 0 |
| 41171 | 52050 / ListPaneMenuActionReceiptFromShipment | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41172 | 52051 / ListPaneMenuActionRemoveFromLoad | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41173 | 52051 / ListPaneMenuActionRemoveFromLoad | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41174 | 52052 / ListPaneMenuActionRouteShipment | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41161 | 52046 / ListPaneMenuActionAddFilteredShipmentsToLoad | data-formId | Y / Y / N | 8 / 0 |
| 41162 | 52046 / ListPaneMenuActionAddFilteredShipmentsToLoad | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41163 | 52047 / ListPaneMenuActionLoadTransfer | data-formId | Y / Y / N | 8 / 0 |
| 41164 | 52047 / ListPaneMenuActionLoadTransfer | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41165 | 52047 / ListPaneMenuActionLoadTransfer | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41175 | 52053 / ListPaneMenuActionSplitShipment | data-formId | Y / Y / N | 8 / 0 |
| 41176 | 52053 / ListPaneMenuActionSplitShipment | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41177 | 52054 / ListPaneMenuActionVasActivity | data-formId | Y / Y / N | 8 / 0 |
| 41178 | 52054 / ListPaneMenuActionVasActivity | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41179 | 52055 / ListPaneMenuActionPrintPreviewDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41180 | 52056 / ListPaneMenuActionPrintShipmentDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41181 | 52057 / ListPaneMenuActionPrintSelectedShipmentDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41182 | 52058 / BasicCriteriaShipmentId | data-dbcolumn | Y / Y / N | 22 / 0 |
| 41183 | 52058 / BasicCriteriaShipmentId | Lookup | Y / Y / N | 88 / 1 |
| 41184 | 52059 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 41185 | 52059 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 41209 | 52070 / SearchPaneComp | data-dbcolumn | Y / Y / N | 14 / 0 |
| 41210 | 52071 / SearchPaneCarrierAndService | data-parentdbcolumn | Y / Y / N | 46 / 0 |
| 41211 | 52071 / SearchPaneCarrierAndService | data-childdbcolumn | Y / Y / N | 30 / 0 |
| 41186 | 52060 / BasicCriteriaCustomer | data-dbcolumn | Y / Y / N | 16 / 0 |
| 41187 | 52060 / BasicCriteriaCustomer | Lookup | Y / Y / N | 78 / 0 |
| 41188 | 52061 / BasicCriteriaShipTo | data-dbcolumn | Y / Y / N | 14 / 0 |
| 41189 | 52061 / BasicCriteriaShipTo | Lookup | Y / Y / N | 68 / 0 |
| 41190 | 52062 / BasicCriteriaErpOrder | data-dbcolumn | Y / Y / N | 50 / 0 |
| 41191 | 52062 / BasicCriteriaErpOrder | Lookup | Y / Y / N | 78 / 1 |
| 41192 | 52063 / BasicCriteriaOrderType | data-dbcolumn | Y / Y / N | 52 / 0 |
| 41193 | 52064 / BasicCriteriaShippingLoad | data-dbcolumn | Y / Y / N | 34 / 0 |
| 41194 | 52064 / BasicCriteriaShippingLoad | Lookup | Y / Y / N | 106 / 1 |
| 41195 | 52064 / BasicCriteriaShippingLoad | nullable | Y / Y / Y | 8 / 0 |
| 41212 | 52072 / SearchPaneDockDoor | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41213 | 52072 / SearchPaneDockDoor | data-dataType | Y / Y / N | 2 / 0 |
| 41196 | 52065 / BasicCriteriaWaveNumber | data-dbcolumn | Y / Y / N | 20 / 0 |
| 41197 | 52065 / BasicCriteriaWaveNumber | Lookup | Y / Y / N | 106 / 1 |
| 41198 | 52065 / BasicCriteriaWaveNumber | nullable | Y / Y / Y | 8 / 0 |
| 41199 | 52066 / BasicCriteriaScheduledShipDateRange | data-dbcolumn | Y / Y / N | 38 / 0 |
| 41200 | 52066 / BasicCriteriaScheduledShipDateRange | data-dateOnly | Y / Y / Y | 8 / 0 |
| 41207 | 52069 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 41208 | 52069 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41201 | 52067 / BasicCriteriaConfirmedShipments | data-dbcolumn | Y / Y / N | 56 / 0 |
| 41202 | 52067 / BasicCriteriaConfirmedShipments | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41203 | 52067 / BasicCriteriaConfirmedShipments | data-negativeCondition | Y / Y / N | 10 / 0 |
| 41204 | 52068 / BasicCriteriaShowCrossDockPending | data-dbcolumn | Y / Y / N | 56 / 0 |
| 41205 | 52068 / BasicCriteriaShowCrossDockPending | data-positiveCondition | Y / Y / N | 8 / 0 |
| 41206 | 52068 / BasicCriteriaShowCrossDockPending | data-negativeCondition | Y / Y / N | 0 / 0 |
| 41214 | 52076 / ListPaneSummaryDetails | data-aggregateClause | Y / Y / Y | 32 / 0 |
| 41215 | 52077 / ListPaneSummaryContainers | data-aggregateClause | Y / Y / Y | 42 / 0 |
| 41216 | 52078 / ListPaneDataGrid | data-dbtable | Y / Y / N | 60 / 0 |
| 41217 | 52078 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 20 / 0 |
| 41218 | 52078 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 42 / 0 |
| 41219 | 52078 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 34 / 0 |
| 41220 | 52078 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 41221 | 52078 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 41222 | 52079 / DetailPaneHeaderShipmentID | href | Y / Y / Y | 164 / 0 |
| 41223 | 52086 / ShipmentInsightWavedIndicatorTileLines | data-indicatorTileGoToInsight | Y / Y / Y | 262 / 0 |
| 41224 | 52087 / ShipmentInsightWavedIndicatorTileContainers | data-indicatorTileGoToInsight | Y / Y / Y | 374 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18254 / click | 52015 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18255 / click | 52016 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18256 / click | 52018 / SplitShipmentConfirmationSplitButton | _webUi.shipmentInsight.splitShipmentConfirmation | Not populated | Y / Y |
| 18257 / click | 52019 / SplitShipmentConfirmationSplitNotInRangeButton | _webUi.shipmentInsight.splitShipmentConfirmation | Not populated | Y / Y |
| 18258 / click | 52020 / SplitShipmentConfirmationNoSplitButton | _webUi.shipmentInsight.splitShipmentConfirmation | Not populated | Y / Y |
| 18259 / click | 52021 / SplitShipmentConfirmationCancelButton | _webUi.shipmentInsight.splitShipmentConfirmation | Not populated | Y / Y |
| 18260 / click | 52023 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18261 / click | 52024 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18262 / click | 52025 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18263 / click | 52026 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18264 / click | 52027 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18265 / click | 52028 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18266 / click | 52029 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18267 / click | 52030 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 18268 / click | 52031 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18269 / click | 52032 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18270 / click | 52033 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18271 / click | 52034 / ListPaneMenuActionNew | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18272 / click | 52035 / ListPaneMenuActionCopy | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18273 / click | 52036 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18274 / click | 52037 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18275 / click | 52038 / ListPaneMenuActionDeleteShipment | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18276 / click | 52039 / ListPaneMenuActionNewLine | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18277 / click | 52040 / ListPaneMenuActionViewAccessorials | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18278 / click | 52041 / ListPaneMenuActionEditAccessorials | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18279 / click | 52042 / ListPaneMenuActionCancelShipment | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18280 / click | 52043 / ListPaneMenuActionConfirmShipment | _webUi.shipmentInsight.shipmentConfirmation | Not populated | Y / Y |
| 18281 / click | 52044 / ListPaneMenuActionConsolidateShipment | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18282 / click | 52045 / ListPaneMenuActionImmediateNeeds | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18285 / click | 52048 / ListPaneMenuActionShipLevelManifest | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18286 / click | 52049 / ListPaneMenuActionShipLevelPack | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18287 / click | 52050 / ListPaneMenuActionReceiptFromShipment | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18288 / click | 52051 / ListPaneMenuActionRemoveFromLoad | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18289 / click | 52052 / ListPaneMenuActionRouteShipment | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 18283 / click | 52046 / ListPaneMenuActionAddFilteredShipmentsToLoad | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTabWithPost | Not populated | Y / Y |
| 18284 / click | 52047 / ListPaneMenuActionLoadTransfer | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTabWithPost | Not populated | Y / Y |
| 18290 / click | 52053 / ListPaneMenuActionSplitShipment | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18291 / click | 52054 / ListPaneMenuActionVasActivity | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18292 / click | 52055 / ListPaneMenuActionPrintPreviewDocs | _webUi.dialog.printPreviewSelection | Not populated | Y / Y |
| 18293 / click | 52056 / ListPaneMenuActionPrintShipmentDocs | _webUi.insightListPaneActions.menuActionPerformGet | Not populated | Y / Y |
| 18294 / click | 52057 / ListPaneMenuActionPrintSelectedShipmentDocs | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 18295 / iggridrequesterror | 52078 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18296 / iggriddatabound | 52078 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18297 / iggridselectionrowselectionchanged | 52078 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18298 / iggridselectionactiverowchanged | 52078 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 26942 / 18254 | GETServiceURL | Y / Y | 76 |
| 26943 / 18254 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 26944 / 18254 | queryParameter_Function_UserName | Y / Y | 44 |
| 26945 / 18254 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26946 / 18254 | POSTServiceURL | Y / Y | 74 |
| 26947 / 18254 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 26948 / 18254 | PostData_Function_UserName | Y / Y | 44 |
| 26949 / 18254 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26950 / 18254 | PostData_Function_SearchValue | Y / Y | 98 |
| 26951 / 18254 | Post_SuccessCallback | Y / Y | 114 |
| 26952 / 18254 | ModalDialogName | Y / Y | 42 |
| 26953 / 18255 | ModalDialogName | Y / Y | 42 |
| 26954 / 18256 | splitType | Y / Y | 2 |
| 26955 / 18256 | modelDialog | Y / Y | 72 |
| 26956 / 18257 | splitType | Y / Y | 2 |
| 26957 / 18257 | modelDialog | Y / Y | 72 |
| 26958 / 18258 | splitType | Y / Y | 2 |
| 26959 / 18258 | modelDialog | Y / Y | 72 |
| 26960 / 18259 | modelDialog | Y / Y | 72 |
| 26961 / 18260 | POSTServiceURL | Y / Y | 144 |
| 26962 / 18260 | Form_Id | Y / Y | 8 |
| 26963 / 18260 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26964 / 18260 | PostData_Function_SearchValue | Y / Y | 98 |
| 26965 / 18260 | Post_SuccessCallback | Y / Y | 114 |
| 26966 / 18260 | ModalDialogName | Y / Y | 56 |
| 26967 / 18261 | ModalDialogName | Y / Y | 56 |
| 26968 / 18265 | ModalDialogName | Y / Y | 42 |
| 26969 / 18266 | ModalDialogName | Y / Y | 56 |
| 26970 / 18271 | URL | Y / Y | 32 |
| 26971 / 18272 | URL | Y / Y | 154 |
| 26972 / 18273 | URL | Y / Y | 148 |
| 26973 / 18274 | URL | Y / Y | 148 |
| 26974 / 18275 | ConfirmationMessageCode | Y / Y | 40 |
| 26975 / 18275 | POSTServiceURL | Y / Y | 110 |
| 26976 / 18275 | PostData_Grid_ListPaneDataGrid_InternalShipmentNum | Y / Y | 42 |
| 26977 / 18275 | Post_SuccessCallback | Y / Y | 140 |
| 26978 / 18276 | queryParameter_Grid_ListPaneDataGrid_InternalShipmentNum | Y / Y | 42 |
| 26979 / 18276 | URL | Y / Y | 136 |
| 26980 / 18277 | queryParameter_Grid_ListPaneDataGrid_InternalNum | Y / Y | 42 |
| 26981 / 18277 | URL | Y / Y | 188 |
| 26982 / 18277 | queryParameter_InternalNumType | Y / Y | 16 |
| 26983 / 18278 | queryParameter_Grid_ListPaneDataGrid_InternalNum | Y / Y | 42 |
| 26984 / 18278 | URL | Y / Y | 188 |
| 26985 / 18278 | queryParameter_InternalNumType | Y / Y | 16 |
| 26986 / 18279 | ConfirmationMessageCode | Y / Y | 40 |
| 26987 / 18279 | POSTServiceURL | Y / Y | 114 |
| 26988 / 18279 | PostData_Grid_ListPaneDataGrid_InternalShipmentNum | Y / Y | 42 |
| 26989 / 18279 | Post_SuccessCallback | Y / Y | 140 |
| 26990 / 18280 | PostData_InternalShipmentNum | Y / Y | 38 |
| 26991 / 18281 | URL | Y / Y | 188 |
| 26992 / 18282 | URL | Y / Y | 254 |
| 26998 / 18285 | URL | Y / Y | 172 |
| 26999 / 18286 | queryParameter_Grid_ListPaneDataGrid_CustomerValue | Y / Y | 16 |
| 27000 / 18286 | queryParameter_Grid_ListPaneDataGrid_CustomerPO | Y / Y | 22 |
| 27001 / 18286 | URL | Y / Y | 580 |
| 27002 / 18286 | queryParameter_ShipmentID | Y / Y | 20 |
| 27003 / 18286 | queryParameter_ErpOrder | Y / Y | 16 |
| 27004 / 18286 | queryParameter_CustomerValue | Y / Y | 26 |
| 27005 / 18286 | queryParameter_CustomerPO | Y / Y | 20 |
| 27006 / 18286 | queryParameter_Invoice | Y / Y | 14 |
| 27007 / 18286 | queryParameter_PickListId | Y / Y | 20 |
| 27008 / 18286 | queryParameter_UserDef1 | Y / Y | 16 |
| 27009 / 18286 | queryParameter_UserDef2 | Y / Y | 16 |
| 27010 / 18286 | queryParameter_UserDef3 | Y / Y | 16 |
| 27011 / 18286 | queryParameter_UserDef4 | Y / Y | 16 |
| 27012 / 18286 | queryParameter_UserDef5 | Y / Y | 16 |
| 27013 / 18286 | queryParameter_UserDef6 | Y / Y | 16 |
| 27014 / 18286 | queryParameter_UserDef7 | Y / Y | 16 |
| 27015 / 18286 | queryParameter_UserDef8 | Y / Y | 16 |
| 27016 / 18287 | URL | Y / Y | 188 |
| 27017 / 18288 | ConfirmationMessageCode | Y / Y | 40 |
| 27018 / 18288 | POSTServiceURL | Y / Y | 116 |
| 27019 / 18288 | PostData_Grid_ListPaneDataGrid_InternalShipmentNum | Y / Y | 42 |
| 27020 / 18288 | Post_SuccessCallback | Y / Y | 140 |
| 27021 / 18289 | POSTServiceURL | Y / Y | 104 |
| 27022 / 18289 | PostData_InternalShipmentNum | Y / Y | 38 |
| 27023 / 18289 | Post_SuccessCallback | Y / Y | 140 |
| 26993 / 18283 | POSTServiceURL | Y / Y | 146 |
| 26994 / 18283 | PostData_Grid_ListPaneDataGrid_InternalShipmentNumber | Y / Y | 42 |
| 26995 / 18283 | CheckForFilters | Y / Y | 8 |
| 26996 / 18284 | POSTServiceURL | Y / Y | 102 |
| 26997 / 18284 | PostData_Grid_ListPaneDataGrid_InternalShipmentNumber | Y / Y | 42 |
| 27024 / 18290 | URL | Y / Y | 188 |
| 27025 / 18291 | URL | Y / Y | 316 |
| 27026 / 18292 | queryParameter_Grid_ListPaneDataGrid_internalNum | Y / Y | 42 |
| 27027 / 18292 | printProcess | Y / Y | 4 |
| 27028 / 18293 | GETServiceURL | Y / Y | 54 |
| 27029 / 18293 | queryParameter_internalNum | Y / Y | 38 |
| 27030 / 18293 | queryParameter_printProcess | Y / Y | 4 |
| 27031 / 18294 | URL | Y / Y | 204 |
| 27032 / 18298 | POSTServiceURL | Y / Y | 74 |
| 27033 / 18298 | PostData_internalShipmentNum | Y / Y | 42 |
| 27034 / 18298 | PostData_storedProcedure | Y / Y | 50 |
| 27035 / 18298 | EnableAction_ListPaneMenuActionPrintShipmentDocs | Y / Y | 42 |
| 27036 / 18298 | EnableAction_ListPaneMenuActionPrintSelectedShipmentDocs | Y / Y | 42 |
| 27037 / 18298 | EnableAction_ListPaneMenuActionPrintPreviewDocs | Y / Y | 42 |
| 27038 / 18298 | EnableAction_ListPaneMenuActionShipLevelManifest | Y / Y | 156 |
| 27039 / 18298 | EnableAction_ListPaneMenuActionView | Y / Y | 90 |
| 27040 / 18298 | EnableAction_ListPaneMenuActionNew | Y / Y | 8 |
| 27041 / 18298 | EnableAction_ListPaneMenuActionCopy | Y / Y | 90 |
| 27042 / 18298 | EnableAction_ListPaneMenuActionVasActivity | Y / Y | 90 |
| 27043 / 18298 | EnableAction_ListPaneMenuActionReceiptFromShipment | Y / Y | 148 |
| 27044 / 18298 | EnableAction_ListPaneMenuActionEdit | Y / Y | 42 |
| 27045 / 18298 | EnableAction_ListPaneMenuActionViewAccessorials | Y / Y | 172 |
| 27046 / 18298 | EnableAction_ListPaneMenuActionEditAccessorials | Y / Y | 172 |
| 27047 / 18298 | EnableAction_ListPaneMenuActionCancelShipment | Y / Y | 180 |
| 27048 / 18298 | EnableAction_ListPaneMenuActionConfirmShipment | Y / Y | 274 |
| 27049 / 18298 | EnableAction_ListPaneMenuActionConsolidateShipment | Y / Y | 266 |
| 27050 / 18298 | EnableAction_ListPaneMenuActionLoadTransfer | Y / Y | 124 |
| 27051 / 18298 | EnableAction_ListPaneMenuActionRemoveFromLoad | Y / Y | 142 |
| 27052 / 18298 | EnableAction_ListPaneMenuActionDeleteShipment | Y / Y | 184 |
| 27053 / 18298 | EnableAction_ListPaneMenuActionSplitShipment | Y / Y | 128 |
| 27054 / 18298 | EnableAction_ListPaneMenuActionImmediateNeeds | Y / Y | 112 |
| 27055 / 18298 | EnableAction_ListPaneMenuActionRouteShipment | Y / Y | 228 |
| 27056 / 18298 | EnableAction_ListPaneMenuActionNewLine | Y / Y | 184 |
| 27057 / 18298 | EnableAction_ListPaneMenuActionShipLevelPack | Y / Y | 220 |
| 27058 / 18298 | EnableAction_ListPaneMenuActionAddFilteredShipmentsToLoad_filterBadge | Y / Y | 30 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 88 selected candidate rows for this Screen: **86 accepted tokens** and **2 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 41134 | 52028 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41135 | 52029 / Not applicable | data-securityCheckpoint | checkpoint | 29 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41136 | 52034 / Not applicable | data-formId | form_id | 2760 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41137 | 52034 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41138 | 52035 / Not applicable | data-formId | form_id | 2760 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41139 | 52035 / Not applicable | data-securityCheckpoint | checkpoint | 4 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41140 | 52036 / Not applicable | data-formId | form_id | 2760 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41141 | 52036 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41142 | 52037 / Not applicable | data-formId | form_id | 2760 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41144 | 52038 / Not applicable | data-formId | form_id | 2760 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41146 | 52038 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41147 | 52039 / Not applicable | data-formId | form_id | 3017 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41148 | 52039 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41150 | 52040 / Not applicable | data-formId | form_id | 4050 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41151 | 52041 / Not applicable | data-formId | form_id | 4050 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41152 | 52041 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41154 | 52042 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41156 | 52043 / Not applicable | data-securityCheckpoint | checkpoint | 27 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41157 | 52044 / Not applicable | data-formId | form_id | 3028 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41158 | 52044 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41159 | 52045 / Not applicable | data-formId | form_id | 2767 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41160 | 52045 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41161 | 52046 / Not applicable | data-formId | form_id | 3025 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41162 | 52046 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41163 | 52047 / Not applicable | data-formId | form_id | 3025 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41165 | 52047 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41166 | 52048 / Not applicable | data-formId | form_id | 3031 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41167 | 52048 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41168 | 52049 / Not applicable | data-formId | form_id | 4007 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41169 | 52049 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41170 | 52050 / Not applicable | data-formId | form_id | 3036 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41171 | 52050 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41173 | 52051 / Not applicable | data-securityCheckpoint | checkpoint | 32 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41174 | 52052 / Not applicable | data-securityCheckpoint | checkpoint | 35 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41175 | 52053 / Not applicable | data-formId | form_id | 3044 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41176 | 52053 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41177 | 52054 / Not applicable | data-formId | form_id | 3043 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41178 | 52054 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41179 | 52055 / Not applicable | data-securityCheckpoint | checkpoint | 34 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41180 | 52056 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41181 | 52057 / Not applicable | data-securityCheckpoint | checkpoint | 33 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41182 | 52058 / Not applicable | data-dbcolumn | database_identifier | Shipment_Id | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41184 | 52059 / Not applicable | data-dbcolumn | database_identifier | Item | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41186 | 52060 / Not applicable | data-dbcolumn | database_identifier | Customer | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41188 | 52061 / Not applicable | data-dbcolumn | database_identifier | Ship_To | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41190 | 52062 / Not applicable | data-dbcolumn | database_identifier | Shipment_Header_Erp_Order | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41192 | 52063 / Not applicable | data-dbcolumn | database_identifier | Shipment_Header_Order_Type | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41193 | 52064 / Not applicable | data-dbcolumn | database_identifier | Shipping_Load_Num | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41196 | 52065 / Not applicable | data-dbcolumn | database_identifier | Launch_Num | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41199 | 52066 / Not applicable | data-dbcolumn | database_identifier | Scheduled_Ship_Date | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41201 | 52067 / Not applicable | data-dbcolumn | database_identifier | Shipment_Header_Trailing_Sts | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41204 | 52068 / Not applicable | data-dbcolumn | database_identifier | Shipment_Header_Trailing_Sts | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41208 | 52069 / Not applicable | data-dbcolumn | database_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41209 | 52070 / Not applicable | data-dbcolumn | database_identifier | Company | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41212 | 52072 / Not applicable | data-dbcolumn | database_identifier | Dock_Door | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41216 | 52078 / Not applicable | data-dbtable | database_identifier | Metadata_Insight_Shipment_View | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26942 | 52015 / 18254 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26946 | 52015 / 18254 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26951 | 52015 / 18254 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26961 | 52023 / 18260 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26965 | 52023 / 18260 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26974 | 52038 / 18275 | ConfirmationMessageCode | resource_code | MSG_DELETESHIPMENT01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26975 | 52038 / 18275 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShipmentHeadersApi/Shipments-Deleted | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26976 | 52038 / 18275 | PostData_Grid_ListPaneDataGrid_InternalShipmentNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26977 | 52038 / 18275 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26978 | 52039 / 18276 | queryParameter_Grid_ListPaneDataGrid_InternalShipmentNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26980 | 52040 / 18277 | queryParameter_Grid_ListPaneDataGrid_InternalNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26983 | 52041 / 18278 | queryParameter_Grid_ListPaneDataGrid_InternalNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26986 | 52042 / 18279 | ConfirmationMessageCode | resource_code | MSG_CANCELSHIPMENT01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26987 | 52042 / 18279 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShipmentHeadersApi/Shipments-Cancelled | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26988 | 52042 / 18279 | PostData_Grid_ListPaneDataGrid_InternalShipmentNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26989 | 52042 / 18279 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26994 | 52046 / 18283 | PostData_Grid_ListPaneDataGrid_InternalShipmentNumber | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26997 | 52047 / 18284 | PostData_Grid_ListPaneDataGrid_InternalShipmentNumber | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26999 | 52049 / 18286 | queryParameter_Grid_ListPaneDataGrid_CustomerValue | grid_field_identifier | CUSTOMER | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27000 | 52049 / 18286 | queryParameter_Grid_ListPaneDataGrid_CustomerPO | grid_field_identifier | CUSTOMER_PO | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27017 | 52051 / 18288 | ConfirmationMessageCode | resource_code | MSG_REMOVESHIPMENT01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27018 | 52051 / 18288 | POSTServiceURL | relative_api_path | /outbound/scaleapi/shipmentheadersapi/Shipments-Unassigned | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27019 | 52051 / 18288 | PostData_Grid_ListPaneDataGrid_InternalShipmentNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27020 | 52051 / 18288 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27021 | 52052 / 18289 | POSTServiceURL | relative_api_path | /outbound/scaleapi/shipmentheadersapi/RouteShipment? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27023 | 52052 / 18289 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27026 | 52055 / 18292 | queryParameter_Grid_ListPaneDataGrid_internalNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27028 | 52056 / 18293 | GETServiceURL | relative_api_path | /general/scaleapi/PrintApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27032 | 52078 / 18298 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27034 | 52078 / 18298 | PostData_storedProcedure | stored_procedure_identifier | SHP_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
