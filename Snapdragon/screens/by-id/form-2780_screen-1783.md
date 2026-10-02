# Receipt Line Insight — Form 2780, Screen 1783

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2780 |
| MAIN_UI_SCREEN Object ID | 1783 |
| Label / Form resource key | Receipt Line Insight / MNU_RECEIPTLINEINSIGHT |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2780 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2780 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2780 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_RECEIPT_INSIGHT_VIEW |
| Help page reference | ReceiptLineInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2780 |
| Inspection time (UTC) | 2026-10-02T15:24:10.159Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_RECEIPTLINEINSIGHT |
| Observed configured table/view | METADATA_RECEIPT_INSIGHT_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1783 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:13:12.028Z | loaded; runtime_inspection | https://trav.manhscale.com/scale/insights/2780; Receipt Line Insight | [runtime-root.json](../../evidence/runtime-root.json) |

**Visible criteria / entry fields:** Receipt ID; Receipt Type; ERP Order Line Number; Item; Description; Company; Warehouse; Internal Receipt Number.

**Visible grid headers:** Field; Operand; Value; Receipt ID; Receipt Type; ERP Order Line Number; Item; Description; Company; Total Qty; Open Qty; UM; Purchase Order ID; Purchase Order Line Number; Internal Receipt Num; Internal Receipt Line Number; Warehouse; Immediate Needs Request Created; Containers Created; Receipt Closed; Icon; Color.

**Observed action/menu labels:** Σ; Actions; Edit; Delete; Immediate Needs.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Receipt Line Insight is recorded as `insight`. Its saved configuration contains 6 parts, 21 groups, 40 controls, and 23 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4417 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4418 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4419 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4420 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4421 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4422 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4417: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18186 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18186; default=None |
| 18187 / SaveSearchModalDialogHeader | 18186 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18186; default=None |
| 18188 / SaveSearchModalDialogBody | 18186 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18186; default=None |
| 18189 / SaveSearchModalDialogFooter | 18186 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18186; default=None |

#### Group 18188: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51894 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18189: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51895 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51896 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4418: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18190 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18190; default=None |
| 18191 / GadgetCalculationQueryDialogHeader | 18190 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18190; default=None |
| 18192 / GadgetCalculationQueryDialogBody | 18190 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18190; default=None |
| 18193 / GadgetCalculationQueryDialogFooter | 18190 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18190; default=None |

#### Group 18192: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51897 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18193: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51898 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51899 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4419: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18194 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18194; default=None |
| 18195 / InsightMenuPanel | 18194 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18194; default=None |
| 18196 / InsightMenuFavoritesDropdown | 18194 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18194; default=None |
| 18197 / InsightListPaneMenuPanel | 18194 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18194; default=None |
| 18198 / MenuExportToExcelPanel | 18194 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18194; default=None |
| 18199 / InsightMenuActionsDropdown | 18194 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18194; default=None |

#### Group 18195: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51900 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51901 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51902 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51903 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18197: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51904 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51905 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 51906 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51907 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18198: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51908 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18199: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51909 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 15000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 51912 / ListPaneMenuActionView | View / VIEW | 150 / 15000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 51910 / ListPaneMenuActionDeleteReceiptDetails | Delete / DELETE | 150 / 15250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 51911 / ListPaneMenuActionImmediateNeeds | Immediate Needs / IMMEDIATENEEDS | 150 / 15500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=IMMEDIATENEEDS |

### Part 4420: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18200 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18200; default=None |
| 18201 / SearchPaneBasicCriteria | 18200 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18200; default=None |
| 18202 / SearchPaneAdvancedCriteria | 18200 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=18200; default=None |

#### Group 18201: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51913 / BasicCriteriaReceiptId | Receipt ID / RECEIPTID | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51914 / BasicCriteriaReceipttype | Receipt Type / RECEIPTTYPE | 10 / 2600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51915 / BasicCriteriaErpOrderLineNum | ERP Order Line Number / ERPORDERLINENUM | 90 / 2700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51916 / BasicCriteriaItem | Item / ITEM | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51917 / BasicCriteriaDescription | Description / DESCRIPTION | 10 / 5500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51918 / SearchPaneComp | Company / COMPANY | 280 / 6000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51919 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 26000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51920 / BasicCriteriaIntReceiptNum | Internal Receipt Number / INTERNALRECEIPTNUM | 90 / 27000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51921 / BasicCriteriaShowClosed | Show Closed / SHOWCLOSED | 130 / 29000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18202: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51922 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4421: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18203 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18203; default=None |
| 18204 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18204; default=None |

#### Group 18203: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51923 / ListPaneSummaryShipments | Receipts / RECEIPTS | 50 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51924 / ListPaneSummaryDetails | Lines / LINES | 50 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51925 / ListPaneSummaryTotalQty | Total Qty / TOTALQTY | 50 / 7500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51926 / ListPaneSummaryRemainingQty | Open Qty / OPENQTY | 50 / 10000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18204: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51927 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51927 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18587 / Not populated | RECEIPT_ID / Not populated / Not populated | Not populated / 30 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18589 / Not populated | RECEIPT_ID / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18590 / Not populated | INTERNAL_RECEIPT_LINE_NUM / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18593 / RECEIPT_ID | Not populated / Receipt ID / RECEIPTID | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18594 / RECEIPT_TYPE | Not populated / Receipt Type / RECEIPTTYPE | 10 / 10 / 1200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18595 / ERP_ORDER_LINE_NUM | Not populated / ERP Order Line Number / ERP_ORDER_LINE_NUM | 20 / 10 / 1400 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18596 / ITEM | Not populated / Item / ITEM | 10 / 10 / 1600 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18597 / ITEM_DESC | Not populated / Description / DESCRIPTION | 10 / 10 / 1800 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18598 / COMPANY | Not populated / Company / COMPANY | 10 / 10 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18599 / TOTAL_QTY | Not populated / Total Qty / TOTALQTY | 20 / 10 / 2200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18600 / OPEN_QTY | Not populated / Open Qty / OPENQTY | 20 / 10 / 2400 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18601 / QUANTITY_UM | Not populated / UM / UM | 10 / 10 / 2600 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18602 / PURCHASE_ORDER_ID | Not populated / Purchase Order ID / PURCHASEORDERID | 10 / 10 / 2800 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18603 / PURCHASE_ORDER_LINE_NUMBER | Not populated / Purchase Order Line Number / PURCHASEORDERLINENUMBER | 10 / 10 / 3000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18604 / INTERNAL_RECEIPT_NUM | Not populated / Internal Receipt Num / INTERNAL_RECEIPT_NUM | 10 / 10 / 3200 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18605 / INTERNAL_RECEIPT_LINE_NUM | Not populated / Internal Receipt Line Number / INTERNALRECEIPTLINENUM | 10 / 10 / 3400 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18606 / WAREHOUSE | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 14000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18607 / IMMD_NEEDS_REQ_CREATED | Not populated / Immediate Needs Request Created / IMMDNEEDSREQCREATED | 40 / 10 / 15000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18608 / IS_CONTAINERS_CREATED | Not populated / Containers Created / CONTAINERS_CREATED | 40 / 10 / 15500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18609 / IS_RECEIPT_CLOSED | Not populated / Receipt Closed / RECEIPTCLOSED | 40 / 10 / 16000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18591 / ICON | Not populated / Icon / ICON | 10 / 10 / 16100 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18592 / COLOR | Not populated / Color / COLOR | 10 / 10 / 16200 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18588 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 16210 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4422: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18205 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18205; default=None |
| 18206 / indicatorpane | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18206; default=None |

#### Group 18205: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51928 / DetailPaneHeaderErpOrderLineNum | Not populated / Not populated | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=601; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51929 / DetailPaneHeaderItem | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=601; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51930 / DetailPaneHeaderCompany | Not populated / Not populated | 30 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=601; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51931 / DetailPaneHeaderItemDesc | Not populated / Not populated | 30 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=601; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51932 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=601; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18206: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51933 / ReceiptLineInsightIndicatorTileContainers | Containers / CONTAINERS | 360 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 40 control attributes, 21 events, and 35 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 41020 | 51894 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 41021 | 51894 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 41022 | 51903 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41023 | 51904 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41024 | 51909 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 41025 | 51909 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41031 | 51912 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 41026 | 51910 / ListPaneMenuActionDeleteReceiptDetails | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41027 | 51910 / ListPaneMenuActionDeleteReceiptDetails | data-formId | Y / Y / N | 8 / 0 |
| 41028 | 51910 / ListPaneMenuActionDeleteReceiptDetails | data-divider | Y / Y / N | 8 / 0 |
| 41029 | 51910 / ListPaneMenuActionDeleteReceiptDetails | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41030 | 51911 / ListPaneMenuActionImmediateNeeds | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41032 | 51913 / BasicCriteriaReceiptId | data-dbcolumn | Y / Y / N | 20 / 0 |
| 41033 | 51913 / BasicCriteriaReceiptId | Lookup | Y / Y / N | 86 / 1 |
| 41034 | 51914 / BasicCriteriaReceipttype | data-dbcolumn | Y / Y / N | 24 / 0 |
| 41035 | 51915 / BasicCriteriaErpOrderLineNum | data-dbcolumn | Y / Y / N | 36 / 0 |
| 41036 | 51915 / BasicCriteriaErpOrderLineNum | nullable | Y / Y / Y | 8 / 0 |
| 41037 | 51916 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 41038 | 51916 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 41039 | 51917 / BasicCriteriaDescription | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41040 | 51918 / SearchPaneComp | data-dbcolumn | Y / Y / N | 14 / 0 |
| 41041 | 51919 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 41042 | 51919 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41043 | 51920 / BasicCriteriaIntReceiptNum | data-dbcolumn | Y / Y / N | 40 / 0 |
| 41044 | 51920 / BasicCriteriaIntReceiptNum | nullable | Y / Y / Y | 8 / 0 |
| 41045 | 51921 / BasicCriteriaShowClosed | data-dbcolumn | Y / Y / N | 20 / 0 |
| 41046 | 51921 / BasicCriteriaShowClosed | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41047 | 51921 / BasicCriteriaShowClosed | data-negativeCondition | Y / Y / N | 14 / 0 |
| 41048 | 51923 / ListPaneSummaryShipments | data-aggregateClause | Y / Y / Y | 72 / 0 |
| 41049 | 51925 / ListPaneSummaryTotalQty | data-aggregateClause | Y / Y / Y | 264 / 0 |
| 41050 | 51926 / ListPaneSummaryRemainingQty | data-aggregateClause | Y / Y / Y | 260 / 0 |
| 41051 | 51927 / ListPaneDataGrid | data-dbtable | Y / Y / N | 68 / 0 |
| 41052 | 51927 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 40 / 0 |
| 41053 | 51927 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 50 / 0 |
| 41054 | 51927 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 52 / 0 |
| 41055 | 51927 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 36 / 0 |
| 41056 | 51927 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 41057 | 51927 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 41058 | 51928 / DetailPaneHeaderErpOrderLineNum | href | Y / Y / Y | 86 / 0 |
| 41059 | 51933 / ReceiptLineInsightIndicatorTileContainers | data-indicatorTileGoToInsight | Y / Y / Y | 310 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18196 / click | 51895 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18197 / click | 51896 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18198 / click | 51898 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18199 / click | 51899 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18200 / click | 51900 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18201 / click | 51901 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18202 / click | 51902 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18203 / click | 51903 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18204 / click | 51904 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18205 / click | 51905 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 18206 / click | 51906 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18207 / click | 51907 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18208 / click | 51908 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18209 / click | 51909 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18212 / click | 51912 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18210 / click | 51910 / ListPaneMenuActionDeleteReceiptDetails | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18211 / click | 51911 / ListPaneMenuActionImmediateNeeds | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18213 / iggridrequesterror | 51927 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18214 / iggriddatabound | 51927 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18215 / iggridselectionrowselectionchanged | 51927 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18216 / iggridselectionactiverowchanged | 51927 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 26848 / 18196 | GETServiceURL | Y / Y | 76 |
| 26849 / 18196 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 26850 / 18196 | queryParameter_Function_UserName | Y / Y | 44 |
| 26851 / 18196 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26852 / 18196 | POSTServiceURL | Y / Y | 74 |
| 26853 / 18196 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 26854 / 18196 | PostData_Function_UserName | Y / Y | 44 |
| 26855 / 18196 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26856 / 18196 | PostData_Function_SearchValue | Y / Y | 98 |
| 26857 / 18196 | Post_SuccessCallback | Y / Y | 114 |
| 26858 / 18196 | ModalDialogName | Y / Y | 42 |
| 26859 / 18197 | ModalDialogName | Y / Y | 42 |
| 26860 / 18198 | POSTServiceURL | Y / Y | 144 |
| 26861 / 18198 | Form_Id | Y / Y | 8 |
| 26862 / 18198 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26863 / 18198 | PostData_Function_SearchValue | Y / Y | 98 |
| 26864 / 18198 | Post_SuccessCallback | Y / Y | 114 |
| 26865 / 18198 | ModalDialogName | Y / Y | 56 |
| 26866 / 18199 | ModalDialogName | Y / Y | 56 |
| 26867 / 18203 | ModalDialogName | Y / Y | 42 |
| 26868 / 18204 | ModalDialogName | Y / Y | 56 |
| 26869 / 18209 | URL | Y / Y | 160 |
| 26875 / 18212 | URL | Y / Y | 160 |
| 26870 / 18210 | ConfirmationMessageCode | Y / Y | 46 |
| 26871 / 18210 | POSTServiceURL | Y / Y | 116 |
| 26872 / 18210 | PostData_Grid_ListPaneDataGrid_InternalReceiptLineNum | Y / Y | 50 |
| 26873 / 18210 | Post_SuccessCallback | Y / Y | 140 |
| 26874 / 18211 | URL | Y / Y | 290 |
| 26876 / 18216 | POSTServiceURL | Y / Y | 74 |
| 26877 / 18216 | PostData_internalReceiptLineNum | Y / Y | 50 |
| 26878 / 18216 | PostData_storedProcedure | Y / Y | 60 |
| 26879 / 18216 | EnableAction_ListPaneMenuActionEdit | Y / Y | 58 |
| 26880 / 18216 | EnableAction_ListPaneMenuActionDeleteReceiptDetails | Y / Y | 108 |
| 26881 / 18216 | EnableAction_ListPaneMenuActionImmediateNeeds | Y / Y | 56 |
| 26882 / 18216 | EnableAction_ListPaneMenuActionView | Y / Y | 58 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 29 selected candidate rows for this Screen: **29 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 41022 | 51903 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41023 | 51904 / Not applicable | data-securityCheckpoint | checkpoint | 25 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41024 | 51909 / Not applicable | data-formId | form_id | 3035 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41025 | 51909 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41027 | 51910 / Not applicable | data-formId | form_id | 3035 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41029 | 51910 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41030 | 51911 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41031 | 51912 / Not applicable | data-formId | form_id | 3035 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41032 | 51913 / Not applicable | data-dbcolumn | database_identifier | Receipt_Id | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41034 | 51914 / Not applicable | data-dbcolumn | database_identifier | Receipt_Type | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41035 | 51915 / Not applicable | data-dbcolumn | database_identifier | Erp_Order_Line_Num | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41037 | 51916 / Not applicable | data-dbcolumn | database_identifier | Item | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41039 | 51917 / Not applicable | data-dbcolumn | database_identifier | Item_Desc | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41040 | 51918 / Not applicable | data-dbcolumn | database_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41042 | 51919 / Not applicable | data-dbcolumn | database_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41043 | 51920 / Not applicable | data-dbcolumn | database_identifier | Internal_Receipt_Num | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41045 | 51921 / Not applicable | data-dbcolumn | database_identifier | CLOSE_DATE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41051 | 51927 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_RECEIPT_LINE_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26848 | 51895 / 18196 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26852 | 51895 / 18196 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26857 | 51895 / 18196 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26860 | 51898 / 18198 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26864 | 51898 / 18198 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26870 | 51910 / 18210 | ConfirmationMessageCode | resource_code | MSG_DELETERECEIPTLINE07 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26871 | 51910 / 18210 | POSTServiceURL | relative_api_path | /inbound/scaleapi/ReceiptDetailsApi/Deleted-ReceiptDetails | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26872 | 51910 / 18210 | PostData_Grid_ListPaneDataGrid_InternalReceiptLineNum | grid_field_identifier | INTERNAL_RECEIPT_LINE_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26873 | 51910 / 18210 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26876 | 51927 / 18216 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26878 | 51927 / 18216 | PostData_storedProcedure | stored_procedure_identifier | RCPT_LineInsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
