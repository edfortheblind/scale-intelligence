# Shipment Line Insight — Form 2776, Screen 1787

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2776 |
| MAIN_UI_SCREEN Object ID | 1787 |
| Label / Form resource key | Shipment Line Insight / MNU_SHIPMENTLINEINSIGHT |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2776 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2776 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2776 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_SHIPMENT_INSIGHT_VIEW |
| Help page reference | shipLineInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2776 |
| Inspection time (UTC) | 2026-10-02T15:24:02.714Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_SHIPMENTLINEINSIGHT |
| Observed configured table/view | METADATA_SHIPMENT_INSIGHT_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1787 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:13:13.248Z | loaded; landing | https://trav.manhscale.com/scale/insights/2776; Shipment Line Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:13:14.303Z | loaded; actions | https://trav.manhscale.com/scale/insights/2776; Shipment Line Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:13:25.257Z | loaded; criteria_open | https://trav.manhscale.com/scale/insights/2776#search; Shipment Line Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:13:25.579Z | loaded; advanced | https://trav.manhscale.com/scale/insights/2776#search; Shipment Line Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |

**Visible criteria / entry fields:** Shipment ID; ERP Order; Line Number; Item; Description; Company; Warehouse; Wave Number; Internal Shipment Number; Shipping Load.

**Visible grid headers:** Icon; Line Number; Shipment ID; Item; Description; Company; Total Qty; Color; Field; Operand; Value.

**Observed action/menu labels:** Copy; Edit; Delete; Cancel; Deconsolidate; Immediate Needs; Transfer; Update Quantity to Pack.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Shipment Line Insight is recorded as `insight`. Its saved configuration contains 6 parts, 20 groups, 45 controls, and 31 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4442 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4443 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4444 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4445 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4446 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4447 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4442: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18276 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18276; default=None |
| 18277 / SaveSearchModalDialogHeader | 18276 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18276; default=None |
| 18278 / SaveSearchModalDialogBody | 18276 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18276; default=None |
| 18279 / SaveSearchModalDialogFooter | 18276 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18276; default=None |

#### Group 18278: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52088 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18279: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52089 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52090 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4443: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18280 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18280; default=None |
| 18281 / GadgetCalculationQueryDialogHeader | 18280 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18280; default=None |
| 18282 / GadgetCalculationQueryDialogBody | 18280 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18280; default=None |
| 18283 / GadgetCalculationQueryDialogFooter | 18280 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18280; default=None |

#### Group 18282: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52091 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18283: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52092 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52093 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4444: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18284 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18284; default=None |
| 18285 / InsightMenuPanel | 18284 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18284; default=None |
| 18286 / InsightMenuFavoritesDropdown | 18284 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18284; default=None |
| 18287 / InsightListPaneMenuPanel | 18284 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18284; default=None |
| 18288 / MenuExportToExcelPanel | 18284 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18284; default=None |
| 18289 / InsightMenuActionsDropdown | 18284 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18284; default=None |

#### Group 18285: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52094 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 52095 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 52096 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 52097 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18287: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52098 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52099 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 52100 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 52101 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18288: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52102 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18289: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52103 / ListPaneMenuActionCopy | Copy / COPY | 150 / 2350 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=COPY |
| 52104 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 52105 / ListPaneMenuActionView | View / VIEW | 150 / 3500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 52106 / ListPaneMenuActionDeleteLine | Delete / DELETE | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 52108 / ListPaneMenuActionCancelLine | Cancel / CANCEL | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CANCEL |
| 52109 / ListPaneMenuActionDeconsolidate | Deconsolidate / DECONSOLIDATE | 150 / 4600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DECONSOLIDATE |
| 52107 / ListPaneMenuActionImmediateNeeds | Immediate Needs / IMMEDIATENEEDS | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=IMMEDIATENEEDS |
| 52110 / ListPaneMenuActionLineTransfer | Transfer / TRANSFER | 150 / 5500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TRANSFER |
| 52111 / ListPaneMenuActionUpdateQtyToPack | Update Quantity to Pack / UPDATEQUANTITYTOPACK | 150 / 5750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=UPDATEQUANTITYTOPACK |

### Part 4445: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18290 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18290; default=None |
| 18291 / SearchPaneBasicCriteria | 18290 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18290; default=None |
| 18292 / SearchPaneAdvancedCriteria | 18290 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=18290; default=None |

#### Group 18291: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52112 / BasicCriteriaShipmentId | Shipment ID / SHIPMENTID | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52113 / BasicCriteriaErpOrder | ERP Order / ERPORDER | 10 / 2600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52114 / BasicCriteriaErpOrderLineNum | Line Number / LINENUMBER | 90 / 2700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52115 / BasicCriteriaItem | Item / ITEM | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52116 / BasicCriteriaDescription | Description / DESCRIPTION | 10 / 5500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52117 / SearchPaneComp | Company / COMPANY | 280 / 6000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52118 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 26000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52119 / BasicCriteriaWaveNumber | Wave Number / WAVENUMBER | 90 / 26100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52120 / BasicCriteriaIntShipNum | Internal Shipment Number / INTERNALSHIPMENTNUM | 90 / 27000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52121 / BasicCriteriaShippingLoadNum | Shipping Load / SHIPPINGLOAD | 90 / 28000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52122 / BasicCriteriaShowClosed | Show Closed / SHOWCLOSED | 130 / 29000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18292: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52123 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4446: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18293 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18293; default=None |
| 18294 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18294; default=None |

#### Group 18293: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52124 / ListPaneSummaryShipments | Shipments / SHIPMENTS | 50 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52125 / ListPaneSummaryDetails | Lines / LINES | 50 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52126 / ListPaneSummaryTotalQty | Total Qty / TOTALQTY | 50 / 7500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18294: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52127 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 52127 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18690 / Not populated | SHIPMENT_ID / Not populated / Not populated | Not populated / 30 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18691 / Not populated | SHIPMENT_ID / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18692 / Not populated | INTERNAL_SHIPMENT_LINE_NUM / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18687 / ICON | Not populated / Icon / ICON | 10 / 10 / 500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18693 / ERP_ORDER_LINE_NUM | Not populated / Line Number / LINENUMBER | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18694 / SHIPMENT_ID | Not populated / Shipment ID / SHIPMENTID | 10 / 10 / 1200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18695 / ITEM | Not populated / Item / ITEM | 10 / 10 / 1300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18696 / ITEM_DESC | Not populated / Description / DESCRIPTION | 10 / 10 / 1400 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18697 / COMPANY | Not populated / Company / COMPANY | 10 / 10 / 1500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18698 / TOTAL_QTY | Not populated / Total Qty / TOTALQTY | 20 / 10 / 1600 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18699 / VAS_ACTIVITY_ID | Not populated / VAS / VAS | 40 / 10 / 1700 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18700 / ERP_ORDER | Not populated / ERP Order / ERP_ORDER | 10 / 10 / 1800 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18701 / INTERNAL_SHIPMENT_NUM | Not populated / Internal Shipment Number / INTERNALSHIPMENTNUM | 10 / 10 / 1900 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18702 / INTERNAL_SHIPMENT_LINE_NUM | Not populated / Internal Shipment Line Number / INTERNAL_SHIPMENT_LINE_NUM | 10 / 10 / 2000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18703 / STATUS1 | Not populated / Status 1 / STATUS1 | 10 / 10 / 13900 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18704 / STATUS1NUMERIC | Not populated / Status 1 (Numeric) / STATUS1NUMERIC | 20 / 10 / 14000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18705 / RELEASED | Not populated / Released / RELEASED | 40 / 10 / 14100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18706 / IN_DELETION | Not populated / In Deletion / INDELETION | 40 / 10 / 14200 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18707 / IN_CONFIRMATION | Not populated / In Confirmation / INCONFIRMATION | 40 / 10 / 14300 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18708 / IMMD_NEEDS_REQ_CREATED | Not populated / Immediate Needs Request Created / IMMDNEEDSREQCREATED | 40 / 10 / 15000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18709 / LEADING_STS | Not populated / Leading Status / LEADING_STS | 10 / 10 / 15150 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18710 / SHIPMENT_LEADING_STS | Not populated / Leading Status (Numeric) / LEADINGSTSNUMERIC | 20 / 10 / 15250 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18711 / TRAILING_STS | Not populated / Trailing Status / TRAILING_STS | 10 / 10 / 15350 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18712 / SHIPMENT_TRAILING_STS | Not populated / Trailing Status (Numeric) / TRAILINGSTSNUMERIC | 20 / 10 / 15500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18713 / CUSTOMER_PO | Not populated / Customer PO / CUSTOMERPO | 10 / 10 / 15750 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18714 / INTERNAL_ORDER_NUM | Not populated / Internal Order Number / INTERNALORDERNUM | 10 / 10 / 16000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18715 / ALLOCATION_REJECTED_QTY | Not populated / Allocation Rejected Quantity / ALLOCATIONREJECTEDQTY | 20 / 10 / 16250 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18716 / IMMEDIATE_NEEDS_NOTE | Not populated / Immediate Needs Note / IMMEDIATENEEDSNOTE | 10 / 10 / 16500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18717 / LAUNCH_NUM | Not populated / Wave Number / LAUNCH_NUM | 10 / 10 / 17000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18689 / COLOR | Not populated / Color / COLOR | 10 / 10 / 20250 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18688 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 20260 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4447: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18295 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18295; default=None |

#### Group 18295: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52128 / DetailPaneHeaderErpOrderLineNum | Not populated / Not populated | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=606; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52129 / DetailPaneHeaderItem | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=606; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52130 / DetailPaneHeaderCompany | Not populated / Not populated | 30 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=606; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52131 / DetailPaneHeaderItemDesc | Not populated / Not populated | 30 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=606; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52132 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=606; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 56 control attributes, 26 events, and 54 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 41225 | 52088 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 41226 | 52088 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 41227 | 52097 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41228 | 52098 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41229 | 52103 / ListPaneMenuActionCopy | data-formId | Y / Y / N | 8 / 0 |
| 41230 | 52103 / ListPaneMenuActionCopy | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41231 | 52104 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 41232 | 52104 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41233 | 52105 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 41234 | 52106 / ListPaneMenuActionDeleteLine | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41235 | 52106 / ListPaneMenuActionDeleteLine | data-formId | Y / Y / N | 4 / 0 |
| 41236 | 52106 / ListPaneMenuActionDeleteLine | data-divider | Y / Y / N | 8 / 0 |
| 41237 | 52106 / ListPaneMenuActionDeleteLine | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41240 | 52108 / ListPaneMenuActionCancelLine | data-formId | Y / Y / N | 8 / 0 |
| 41241 | 52108 / ListPaneMenuActionCancelLine | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41242 | 52109 / ListPaneMenuActionDeconsolidate | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41243 | 52109 / ListPaneMenuActionDeconsolidate | data-formId | Y / Y / N | 8 / 0 |
| 41244 | 52109 / ListPaneMenuActionDeconsolidate | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41238 | 52107 / ListPaneMenuActionImmediateNeeds | data-formId | Y / Y / N | 8 / 0 |
| 41239 | 52107 / ListPaneMenuActionImmediateNeeds | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41245 | 52110 / ListPaneMenuActionLineTransfer | data-formId | Y / Y / N | 8 / 0 |
| 41246 | 52110 / ListPaneMenuActionLineTransfer | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41247 | 52111 / ListPaneMenuActionUpdateQtyToPack | data-formId | Y / Y / N | 8 / 0 |
| 41248 | 52111 / ListPaneMenuActionUpdateQtyToPack | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41249 | 52112 / BasicCriteriaShipmentId | data-dbcolumn | Y / Y / N | 22 / 0 |
| 41250 | 52112 / BasicCriteriaShipmentId | Lookup | Y / Y / N | 88 / 1 |
| 41251 | 52113 / BasicCriteriaErpOrder | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41252 | 52113 / BasicCriteriaErpOrder | Lookup | Y / Y / N | 78 / 1 |
| 41253 | 52114 / BasicCriteriaErpOrderLineNum | data-dbcolumn | Y / Y / N | 36 / 0 |
| 41254 | 52114 / BasicCriteriaErpOrderLineNum | nullable | Y / Y / Y | 8 / 0 |
| 41255 | 52115 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 41256 | 52115 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 41257 | 52116 / BasicCriteriaDescription | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41258 | 52117 / SearchPaneComp | data-dbcolumn | Y / Y / N | 14 / 0 |
| 41259 | 52118 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 41260 | 52118 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41261 | 52119 / BasicCriteriaWaveNumber | data-dbcolumn | Y / Y / N | 20 / 0 |
| 41262 | 52119 / BasicCriteriaWaveNumber | Lookup | Y / Y / N | 106 / 1 |
| 41263 | 52119 / BasicCriteriaWaveNumber | nullable | Y / Y / Y | 8 / 0 |
| 41264 | 52120 / BasicCriteriaIntShipNum | data-dbcolumn | Y / Y / N | 42 / 0 |
| 41265 | 52120 / BasicCriteriaIntShipNum | nullable | Y / Y / Y | 8 / 0 |
| 41266 | 52121 / BasicCriteriaShippingLoadNum | data-dbcolumn | Y / Y / N | 34 / 0 |
| 41267 | 52121 / BasicCriteriaShippingLoadNum | nullable | Y / Y / Y | 8 / 0 |
| 41268 | 52122 / BasicCriteriaShowClosed | data-dbcolumn | Y / Y / N | 46 / 0 |
| 41269 | 52122 / BasicCriteriaShowClosed | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41270 | 52122 / BasicCriteriaShowClosed | data-negativeCondition | Y / Y / N | 12 / 0 |
| 41271 | 52124 / ListPaneSummaryShipments | data-aggregateClause | Y / Y / Y | 74 / 0 |
| 41272 | 52126 / ListPaneSummaryTotalQty | data-aggregateClause | Y / Y / Y | 28 / 0 |
| 41273 | 52127 / ListPaneDataGrid | data-dbtable | Y / Y / N | 74 / 0 |
| 41274 | 52127 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 42 / 0 |
| 41275 | 52127 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 54 / 0 |
| 41276 | 52127 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 36 / 0 |
| 41277 | 52127 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 36 / 0 |
| 41278 | 52127 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 41279 | 52127 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 41280 | 52128 / DetailPaneHeaderErpOrderLineNum | href | Y / Y / Y | 88 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18299 / click | 52089 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18300 / click | 52090 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18301 / click | 52092 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18302 / click | 52093 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18303 / click | 52094 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18304 / click | 52095 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18305 / click | 52096 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18306 / click | 52097 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18307 / click | 52098 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18308 / click | 52099 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 18309 / click | 52100 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18310 / click | 52101 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18311 / click | 52102 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18312 / click | 52103 / ListPaneMenuActionCopy | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18313 / click | 52104 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18314 / click | 52105 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18315 / click | 52106 / ListPaneMenuActionDeleteLine | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18317 / click | 52108 / ListPaneMenuActionCancelLine | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 18318 / click | 52109 / ListPaneMenuActionDeconsolidate | _webUi.shipmentLineInsight.deconsolidateOrders | Not populated | Y / Y |
| 18316 / click | 52107 / ListPaneMenuActionImmediateNeeds | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18319 / click | 52110 / ListPaneMenuActionLineTransfer | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18320 / click | 52111 / ListPaneMenuActionUpdateQtyToPack | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18321 / iggridrequesterror | 52127 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18322 / iggriddatabound | 52127 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18323 / iggridselectionrowselectionchanged | 52127 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18324 / iggridselectionactiverowchanged | 52127 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 27059 / 18299 | GETServiceURL | Y / Y | 76 |
| 27060 / 18299 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 27061 / 18299 | queryParameter_Function_UserName | Y / Y | 44 |
| 27062 / 18299 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27063 / 18299 | POSTServiceURL | Y / Y | 74 |
| 27064 / 18299 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 27065 / 18299 | PostData_Function_UserName | Y / Y | 44 |
| 27066 / 18299 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27067 / 18299 | PostData_Function_SearchValue | Y / Y | 98 |
| 27068 / 18299 | Post_SuccessCallback | Y / Y | 114 |
| 27069 / 18299 | ModalDialogName | Y / Y | 42 |
| 27070 / 18300 | ModalDialogName | Y / Y | 42 |
| 27071 / 18301 | POSTServiceURL | Y / Y | 144 |
| 27072 / 18301 | Form_Id | Y / Y | 8 |
| 27073 / 18301 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 27074 / 18301 | PostData_Function_SearchValue | Y / Y | 98 |
| 27075 / 18301 | Post_SuccessCallback | Y / Y | 114 |
| 27076 / 18301 | ModalDialogName | Y / Y | 56 |
| 27077 / 18302 | ModalDialogName | Y / Y | 56 |
| 27078 / 18306 | ModalDialogName | Y / Y | 42 |
| 27079 / 18307 | ModalDialogName | Y / Y | 56 |
| 27080 / 18312 | URL | Y / Y | 134 |
| 27081 / 18313 | URL | Y / Y | 164 |
| 27082 / 18314 | URL | Y / Y | 164 |
| 27083 / 18315 | ConfirmationMessageCode | Y / Y | 20 |
| 27084 / 18315 | ConfirmationTitleCode | Y / Y | 36 |
| 27085 / 18315 | POSTServiceURL | Y / Y | 122 |
| 27086 / 18315 | PostData_Grid_ListPaneDataGrid_InternalShipmentLineNum | Y / Y | 52 |
| 27087 / 18315 | Post_SuccessCallback | Y / Y | 140 |
| 27089 / 18317 | ConfirmationMessageCode | Y / Y | 40 |
| 27090 / 18317 | ConfirmationTitleCode | Y / Y | 36 |
| 27091 / 18317 | POSTServiceURL | Y / Y | 128 |
| 27092 / 18317 | queryParameter_InternalShipmentLineNum | Y / Y | 46 |
| 27093 / 18317 | Post_SuccessCallback | Y / Y | 140 |
| 27094 / 18318 | ConfirmationMessageCode | Y / Y | 38 |
| 27095 / 18318 | ConfirmationTitleCode | Y / Y | 38 |
| 27096 / 18318 | POSTServiceURL | Y / Y | 120 |
| 27088 / 18316 | URL | Y / Y | 280 |
| 27097 / 18319 | queryParameter_InternalShipmentLineNum | Y / Y | 46 |
| 27098 / 18319 | URL | Y / Y | 212 |
| 27099 / 18320 | URL | Y / Y | 212 |
| 27100 / 18320 | queryParameter_InternalShipmentLineNum | Y / Y | 46 |
| 27101 / 18324 | POSTServiceURL | Y / Y | 74 |
| 27102 / 18324 | PostData_internalShipmentLineNum | Y / Y | 52 |
| 27103 / 18324 | PostData_storedProcedure | Y / Y | 58 |
| 27104 / 18324 | EnableAction_ListPaneMenuActionEdit | Y / Y | 60 |
| 27105 / 18324 | EnableAction_ListPaneMenuActionView | Y / Y | 60 |
| 27106 / 18324 | EnableAction_ListPaneMenuActionCancelLine | Y / Y | 338 |
| 27107 / 18324 | EnableAction_ListPaneMenuActionDeleteLine | Y / Y | 274 |
| 27108 / 18324 | EnableAction_ListPaneMenuActionImmediateNeeds | Y / Y | 62 |
| 27109 / 18324 | EnableAction_ListPaneMenuActionLineTransfer | Y / Y | 60 |
| 27110 / 18324 | EnableAction_ListPaneMenuActionUpdateQtyToPack | Y / Y | 198 |
| 27111 / 18324 | EnableAction_ListPaneMenuActionCopy | Y / Y | 404 |
| 27112 / 18324 | EnableAction_ListPaneMenuActionDeconsolidate | Y / Y | 274 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 50 selected candidate rows for this Screen: **50 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 41227 | 52097 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41228 | 52098 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41229 | 52103 / Not applicable | data-formId | form_id | 3017 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41230 | 52103 / Not applicable | data-securityCheckpoint | checkpoint | 4 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41231 | 52104 / Not applicable | data-formId | form_id | 3017 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41232 | 52104 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41233 | 52105 / Not applicable | data-formId | form_id | 3017 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41235 | 52106 / Not applicable | data-formId | form_id | 10 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41237 | 52106 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41238 | 52107 / Not applicable | data-formId | form_id | 2767 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41239 | 52107 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41240 | 52108 / Not applicable | data-formId | form_id | 2776 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41241 | 52108 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41243 | 52109 / Not applicable | data-formId | form_id | 2776 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41244 | 52109 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41245 | 52110 / Not applicable | data-formId | form_id | 3042 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41246 | 52110 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41247 | 52111 / Not applicable | data-formId | form_id | 3027 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41248 | 52111 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41249 | 52112 / Not applicable | data-dbcolumn | database_identifier | Shipment_Id | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41251 | 52113 / Not applicable | data-dbcolumn | database_identifier | Erp_Order | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41253 | 52114 / Not applicable | data-dbcolumn | database_identifier | Erp_Order_Line_Num | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41255 | 52115 / Not applicable | data-dbcolumn | database_identifier | Item | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41257 | 52116 / Not applicable | data-dbcolumn | database_identifier | Item_Desc | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41258 | 52117 / Not applicable | data-dbcolumn | database_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41260 | 52118 / Not applicable | data-dbcolumn | database_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41261 | 52119 / Not applicable | data-dbcolumn | database_identifier | Launch_Num | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41264 | 52120 / Not applicable | data-dbcolumn | database_identifier | Internal_Shipment_Num | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41266 | 52121 / Not applicable | data-dbcolumn | database_identifier | SHIPPING_LOAD_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41268 | 52122 / Not applicable | data-dbcolumn | database_identifier | SHIPMENT_DETAIL_STATUS1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41273 | 52127 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_SHIPMENT_DETAIL_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27059 | 52089 / 18299 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27063 | 52089 / 18299 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27068 | 52089 / 18299 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27071 | 52092 / 18301 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27075 | 52092 / 18301 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27083 | 52106 / 18315 | ConfirmationMessageCode | resource_code | MSG_DLTVER | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27084 | 52106 / 18315 | ConfirmationTitleCode | resource_code | DELETESHIPMENTLINE | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27085 | 52106 / 18315 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShipmentDetailsApi/shipmentDetails-Deleted | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27086 | 52106 / 18315 | PostData_Grid_ListPaneDataGrid_InternalShipmentLineNum | grid_field_identifier | INTERNAL_SHIPMENT_LINE_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27087 | 52106 / 18315 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27089 | 52108 / 18317 | ConfirmationMessageCode | resource_code | MSG_CANCELSHIPLINE01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27090 | 52108 / 18317 | ConfirmationTitleCode | resource_code | CANCELSHIPMENTLINE | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27091 | 52108 / 18317 | POSTServiceURL | relative_api_path | /outbound/scaleapi/shipmentDetailsApi/shipmentDetails-Cancelled? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27093 | 52108 / 18317 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27094 | 52109 / 18318 | ConfirmationMessageCode | resource_code | MSG_DECONSOLIDATE02 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27095 | 52109 / 18318 | ConfirmationTitleCode | resource_code | DECONSOLIDATEORDERS | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27096 | 52109 / 18318 | POSTServiceURL | relative_api_path | /outbound/scaleapi/shipmentHeadersApi/orders-Deconsolidated? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27101 | 52127 / 18324 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27103 | 52127 / 18324 | PostData_storedProcedure | stored_procedure_identifier | SHP_LineInsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
