# Receipt Container Insight — Form 2779, Screen 1782

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2779 |
| MAIN_UI_SCREEN Object ID | 1782 |
| Label / Form resource key | Receipt Container Insight / MNU_RECEIPTCONTAINERINSIGHT |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2779 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2779 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2779 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_RECEIPT_CONTAINER_VIEW |
| Help page reference | ReceiptContInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2779 |
| Inspection time (UTC) | 2026-10-02T15:24:08.385Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_RECEIPTCONTAINERINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_RECEIPT_CONTAINER_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1782 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:13:01.597Z | loaded; runtime_inspection | https://trav.manhscale.com/scale/insights/2779; Receipt Container Insight | [runtime-root.json](../../evidence/runtime-root.json) |

**Visible criteria / entry fields:** License Plate; Receipt ID; ERP Order Line Number; Item; Description; Company; Warehouse; Internal Receipt Number; Internal Receipt Line Number; Group Number.

**Visible grid headers:** Field; Operand; Value; Icon; Color; License Plate; Group Number; Status; Item; Description; Company; Quantity; Quantity UM; Receipt ID; Status Failed; Receipt Type; ERP Order Line Number; Internal Receipt Number; Immediate Needs Request Created; Max Status; To Location; Locating Rule; Internal Container Number; Status (Numeric); Warehouse; Used By Immediate Need; Group Closed.

**Observed action/menu labels:** Σ; Actions; Edit; Delete; Cancel; Immediate Needs; Locate; Print Preview; Print Default Docs; Print Selected Docs; Remove From Group.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Receipt Container Insight is recorded as `insight`. Its saved configuration contains 6 parts, 20 groups, 51 controls, and 26 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4411 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4412 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4413 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4414 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4415 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4416 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4411: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18166 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18166; default=None |
| 18167 / SaveSearchModalDialogHeader | 18166 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18166; default=None |
| 18168 / SaveSearchModalDialogBody | 18166 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18166; default=None |
| 18169 / SaveSearchModalDialogFooter | 18166 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18166; default=None |

#### Group 18168: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51843 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18169: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51844 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51845 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4412: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18170 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18170; default=None |
| 18171 / GadgetCalculationQueryDialogHeader | 18170 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18170; default=None |
| 18172 / GadgetCalculationQueryDialogBody | 18170 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18170; default=None |
| 18173 / GadgetCalculationQueryDialogFooter | 18170 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18170; default=None |

#### Group 18172: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51846 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18173: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51847 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51848 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4413: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18174 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18174; default=None |
| 18175 / InsightMenuPanel | 18174 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18174; default=None |
| 18176 / InsightMenuFavoritesDropdown | 18174 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18174; default=None |
| 18177 / InsightListPaneMenuPanel | 18174 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18174; default=None |
| 18178 / MenuExportToExcelPanel | 18174 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18174; default=None |
| 18179 / InsightMenuActionsDropdown | 18174 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18174; default=None |

#### Group 18175: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51849 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51850 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51851 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51852 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18177: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51853 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51854 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 51855 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51856 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18178: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51857 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18179: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51858 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 51859 / ListPaneMenuActionDeleteContainers | Delete / DELETE | 150 / 2600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 51860 / ListPaneMenuActionCancelContainers | Cancel / CANCEL | 150 / 2700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CANCELCONTAINER |
| 51861 / ListPaneMenuActionImmediateNeeds | Immediate Needs / IMMEDIATENEEDS | 150 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=IMMEDIATENEEDS |
| 51862 / ListPaneMenuActionLocateContainers | Locate / LOCATE | 150 / 3200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CANCELCONTAINER |
| 51863 / ListPaneMenuActionPrintPreviewDocs | Print Preview / PRINTPREVIEW | 150 / 3400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTPREVIEW |
| 51864 / ListPaneMenuActionPrintReceiptContainerDocs | Print Default Docs / PRINTDEFAULTDOCS | 150 / 3500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTDEFAULTDOCS |
| 51865 / ListPaneMenuActionPrintSelectedReceiptContainerDocs | Print Selected Docs / PRINTSELECTEDDOCS | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTSELECTEDDOCS |
| 51868 / ListPaneMenuActionView | View / VIEW | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 51866 / ListPaneMenuActionRemoveContainerFromGroup | Remove From Group / REMOVEFROMNGROUP | 150 / 7000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=REMOVEFROMNGROUP |
| 51867 / ListPaneMenuActionUnlocateContainers | Unlocate / UNLOCATE | 150 / 7500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=UNLOCATE |

### Part 4414: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18180 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18180; default=None |
| 18181 / SearchPaneBasicCriteria | 18180 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18180; default=None |
| 18182 / SearchPaneAdvancedCriteria | 18180 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=18180; default=None |

#### Group 18181: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51869 / BasicCriteriaLicensePlateId | License Plate / LICENSEPLATE | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51870 / BasicCriteriaReceiptId | Receipt ID / RECEIPTID | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51871 / BasicCriteriaERPOrderLineNum | ERP Order Line Number / ERPORDERLINENUM | 10 / 7500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51872 / BasicCriteriaItem | Item / ITEM | 10 / 10000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51873 / BasicCriteriaDescription | Description / DESCRIPTION | 10 / 12500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51874 / BasicCriteriaCompany | Company / COMPANY | 280 / 15000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51875 / BasicCriteriaWarehouse | Warehouse / WAREHOUSE | 280 / 17500 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51876 / BasicCriteriaInternalReceiptNum | Internal Receipt Number / INTERNALRECEIPTNUM | 90 / 20000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51877 / BasicCriteriaInternalReceiptLineNum | Internal Receipt Line Number / INTERNALRECEIPTLINENUM | 90 / 22500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51878 / BasicCriteriaInternalGroupNum | Group Number / GROUPNUMBER | 90 / 25000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51879 / BasicCriteriaShowClosed | Show Closed / SHOWCLOSED | 130 / 27500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18182: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51880 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4415: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18183 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=18183; default=None |
| 18184 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18184; default=None |

#### Group 18183: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51881 / ListPaneSummaryReceipts | Receipts / RECEIPTS | 50 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51882 / ListPaneSummaryLicensePlates | License Plates / LICENSEPLATES | 50 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51883 / ListPaneSummaryQuantity | Quantity / QUANTITY | 50 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51884 / ListPaneSummaryWeight | Weight / WEIGHT | 50 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51885 / ListPaneSummaryVolume | Volume / VOLUME | 50 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18184: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51886 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51886 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18561 / ICON | Not populated / Icon / ICON | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18563 / COLOR | Not populated / Color / COLOR | 10 / 10 / 20 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18564 / LICENSE_PLATE_ID | Not populated / License Plate / LICENSEPLATE | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18565 / INTERNAL_GROUP_NUM | Not populated / Group Number / GROUPNUMBER | 10 / 10 / 35 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18566 / STATUS_NAME | Not populated / Status / STATUS | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18567 / ITEM | Not populated / Item / ITEM | 10 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18568 / ITEM_DESC | Not populated / Description / DESCRIPTION | 10 / 10 / 60 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18569 / COMPANY | Not populated / Company / COMPANY | 10 / 10 / 70 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18570 / QUANTITY | Not populated / Quantity / QUANTITY | 20 / 10 / 80 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18571 / QUANTITY_UM | Not populated / Quantity UM / QUANTITY_UM | 10 / 10 / 90 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18572 / RECEIPT_ID | Not populated / Receipt ID / RECEIPTID | 10 / 10 / 100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18573 / STATUS_FAILED | Not populated / Status Failed / STATUSFAILED | 40 / 10 / 105 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18574 / RECEIPT_TYPE | Not populated / Receipt Type / RECEIPTTYPE | 10 / 10 / 110 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18575 / ERP_ORDER_LINE_NUM | Not populated / ERP Order Line Number / ERPORDERLINENUM | 20 / 10 / 120 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18576 / INTERNAL_RECEIPT_NUM | Not populated / Internal Receipt Number / INTERNALRECEIPTNUM | 10 / 10 / 130 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18577 / IMMD_NEEDS_REQ_CREATED | Not populated / Immediate Needs Request Created / IMMDNEEDSREQCREATED | 40 / 10 / 140 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18578 / MAX_STATUS | Not populated / Max Status / MAX_STATUS | 40 / 10 / 142 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18579 / TO_LOCATION | Not populated / To Location / TOLOCATION | 10 / 10 / 145 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18580 / LOCATING_RULE | Not populated / Locating Rule / LOCATINGRULE | 10 / 10 / 145 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18581 / INTERNAL_REC_CONT_NUM | Not populated / Internal Container Number / INTERNALCONTAINERNUM | 10 / 10 / 160 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18582 / CONTAINER_STATUS | Not populated / Status (Numeric) / STATUSNUMERIC | 10 / 10 / 170 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18583 / FROM_WAREHOUSE | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 190 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18584 / USED_BY_IMMED_NEED | Not populated / Used By Immediate Need / USEDBYIMMEDNEED | 40 / 10 / 200 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18585 / Not populated | INTERNAL_REC_CONT_NUM / Not populated / Not populated | Not populated / 20 / 6750 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18586 / GROUP_CLOSED | Not populated / Group Closed / GROUPCLOSED | 40 / 10 / 7000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18562 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 7010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4416: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18185 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18185; default=None |

#### Group 18185: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51887 / DetailPaneHeaderContainerID | Not populated / Not populated | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=600; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51888 / DetailPaneHeaderContainerType | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=600; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51889 / DetailPaneHeaderContainerStatus | Not populated / Not populated | 30 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=600; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51890 / DetailPaneHeaderItem | Not populated / Not populated | 30 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=600; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51893 / DetailPaneHeaderCompany | Not populated / Not populated | 30 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=600; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51891 / DetailPaneHeaderItemDesc | Not populated / Not populated | 30 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=600; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51892 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 3000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=600; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 56 control attributes, 28 events, and 63 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40964 | 51843 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40965 | 51843 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40966 | 51852 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40967 | 51853 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40968 | 51858 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 40969 | 51858 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40970 | 51859 / ListPaneMenuActionDeleteContainers | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40971 | 51859 / ListPaneMenuActionDeleteContainers | data-divider | Y / Y / N | 8 / 0 |
| 40972 | 51859 / ListPaneMenuActionDeleteContainers | data-formId | Y / Y / N | 8 / 0 |
| 40973 | 51859 / ListPaneMenuActionDeleteContainers | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40974 | 51860 / ListPaneMenuActionCancelContainers | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40975 | 51860 / ListPaneMenuActionCancelContainers | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40976 | 51861 / ListPaneMenuActionImmediateNeeds | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40977 | 51862 / ListPaneMenuActionLocateContainers | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40978 | 51862 / ListPaneMenuActionLocateContainers | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40979 | 51863 / ListPaneMenuActionPrintPreviewDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40980 | 51864 / ListPaneMenuActionPrintReceiptContainerDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40981 | 51865 / ListPaneMenuActionPrintSelectedReceiptContainerDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40985 | 51868 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 40982 | 51866 / ListPaneMenuActionRemoveContainerFromGroup | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40983 | 51867 / ListPaneMenuActionUnlocateContainers | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40984 | 51867 / ListPaneMenuActionUnlocateContainers | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40986 | 51869 / BasicCriteriaLicensePlateId | data-dbcolumn | Y / Y / N | 24 / 0 |
| 40987 | 51869 / BasicCriteriaLicensePlateId | Lookup | Y / Y / N | 106 / 1 |
| 40988 | 51870 / BasicCriteriaReceiptId | data-dbcolumn | Y / Y / N | 20 / 0 |
| 40989 | 51870 / BasicCriteriaReceiptId | Lookup | Y / Y / N | 86 / 1 |
| 40990 | 51871 / BasicCriteriaERPOrderLineNum | data-dbcolumn | Y / Y / N | 36 / 0 |
| 40991 | 51872 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 40992 | 51872 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 40993 | 51873 / BasicCriteriaDescription | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40994 | 51874 / BasicCriteriaCompany | data-dbcolumn | Y / Y / N | 14 / 0 |
| 40995 | 51875 / BasicCriteriaWarehouse | defaultValue | Y / Y / Y | 32 / 0 |
| 40996 | 51875 / BasicCriteriaWarehouse | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40997 | 51876 / BasicCriteriaInternalReceiptNum | data-dbcolumn | Y / Y / N | 40 / 0 |
| 40998 | 51876 / BasicCriteriaInternalReceiptNum | nullable | Y / Y / Y | 8 / 0 |
| 40999 | 51877 / BasicCriteriaInternalReceiptLineNum | data-dbcolumn | Y / Y / N | 50 / 0 |
| 41000 | 51877 / BasicCriteriaInternalReceiptLineNum | nullable | Y / Y / Y | 8 / 0 |
| 41001 | 51878 / BasicCriteriaInternalGroupNum | data-dbcolumn | Y / Y / N | 36 / 0 |
| 41002 | 51878 / BasicCriteriaInternalGroupNum | nullable | Y / Y / Y | 8 / 0 |
| 41003 | 51879 / BasicCriteriaShowClosed | data-dbcolumn | Y / Y / N | 32 / 0 |
| 41004 | 51879 / BasicCriteriaShowClosed | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41005 | 51879 / BasicCriteriaShowClosed | data-negativeCondition | Y / Y / N | 8 / 0 |
| 41006 | 51879 / BasicCriteriaShowClosed | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 41007 | 51879 / BasicCriteriaShowClosed | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 41008 | 51882 / ListPaneSummaryLicensePlates | data-aggregateClause | Y / Y / Y | 38 / 0 |
| 41009 | 51883 / ListPaneSummaryQuantity | data-aggregateClause | Y / Y / Y | 26 / 0 |
| 41010 | 51884 / ListPaneSummaryWeight | data-aggregateClause | Y / Y / Y | 22 / 0 |
| 41011 | 51885 / ListPaneSummaryVolume | data-aggregateClause | Y / Y / Y | 34 / 0 |
| 41012 | 51886 / ListPaneDataGrid | data-dbtable | Y / Y / N | 78 / 0 |
| 41013 | 51886 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 36 / 0 |
| 41014 | 51886 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 40 / 0 |
| 41015 | 51886 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 50 / 0 |
| 41016 | 51886 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 42 / 0 |
| 41017 | 51886 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 41018 | 51886 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 41019 | 51887 / DetailPaneHeaderContainerID | href | Y / Y / Y | 82 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18168 / click | 51844 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18169 / click | 51845 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18170 / click | 51847 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18171 / click | 51848 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18172 / click | 51849 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18173 / click | 51850 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18174 / click | 51851 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18175 / click | 51852 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18176 / click | 51853 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18177 / click | 51854 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 18178 / click | 51855 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18179 / click | 51856 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18180 / click | 51857 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18181 / click | 51858 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18182 / click | 51859 / ListPaneMenuActionDeleteContainers | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18183 / click | 51860 / ListPaneMenuActionCancelContainers | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18184 / click | 51861 / ListPaneMenuActionImmediateNeeds | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18185 / click | 51862 / ListPaneMenuActionLocateContainers | _webUi.receiptContainerInsight.locateReceiptContainer | Not populated | Y / Y |
| 18186 / click | 51863 / ListPaneMenuActionPrintPreviewDocs | _webUi.dialog.printPreviewSelection | Not populated | Y / Y |
| 18187 / click | 51864 / ListPaneMenuActionPrintReceiptContainerDocs | _webUi.insightListPaneActions.menuActionPerformGet | Not populated | Y / Y |
| 18188 / click | 51865 / ListPaneMenuActionPrintSelectedReceiptContainerDocs | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 18191 / click | 51868 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18189 / click | 51866 / ListPaneMenuActionRemoveContainerFromGroup | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 18190 / click | 51867 / ListPaneMenuActionUnlocateContainers | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18192 / iggridrequesterror | 51886 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18193 / iggriddatabound | 51886 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18194 / iggridselectionrowselectionchanged | 51886 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18195 / iggridselectionactiverowchanged | 51886 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 26785 / 18168 | GETServiceURL | Y / Y | 76 |
| 26786 / 18168 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 26787 / 18168 | queryParameter_Function_UserName | Y / Y | 44 |
| 26788 / 18168 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26789 / 18168 | POSTServiceURL | Y / Y | 74 |
| 26790 / 18168 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 26791 / 18168 | PostData_Function_UserName | Y / Y | 44 |
| 26792 / 18168 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26793 / 18168 | PostData_Function_SearchValue | Y / Y | 98 |
| 26794 / 18168 | Post_SuccessCallback | Y / Y | 114 |
| 26795 / 18168 | ModalDialogName | Y / Y | 42 |
| 26796 / 18169 | ModalDialogName | Y / Y | 42 |
| 26797 / 18170 | POSTServiceURL | Y / Y | 144 |
| 26798 / 18170 | Form_Id | Y / Y | 8 |
| 26799 / 18170 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26800 / 18170 | PostData_Function_SearchValue | Y / Y | 98 |
| 26801 / 18170 | Post_SuccessCallback | Y / Y | 114 |
| 26802 / 18170 | ModalDialogName | Y / Y | 56 |
| 26803 / 18171 | ModalDialogName | Y / Y | 56 |
| 26804 / 18175 | ModalDialogName | Y / Y | 42 |
| 26805 / 18176 | ModalDialogName | Y / Y | 56 |
| 26806 / 18181 | URL | Y / Y | 144 |
| 26807 / 18182 | ConfirmationMessageCode | Y / Y | 38 |
| 26808 / 18182 | POSTServiceURL | Y / Y | 114 |
| 26809 / 18182 | PostData_Grid_ListPaneDataGrid_InternalReceiptContainerNum | Y / Y | 42 |
| 26810 / 18182 | Post_SuccessCallback | Y / Y | 140 |
| 26811 / 18183 | ConfirmationMessageCode | Y / Y | 38 |
| 26812 / 18183 | POSTServiceURL | Y / Y | 118 |
| 26813 / 18183 | PostData_Grid_ListPaneDataGrid_InternalReceiptContainerNum | Y / Y | 42 |
| 26814 / 18183 | Post_SuccessCallback | Y / Y | 140 |
| 26815 / 18183 | Post_ErrorCallback | Y / Y | 120 |
| 26816 / 18184 | URL | Y / Y | 290 |
| 26817 / 18185 | POSTServiceURL | Y / Y | 114 |
| 26818 / 18185 | Post_SuccessCallback | Y / Y | 140 |
| 26819 / 18186 | queryParameter_Grid_ListPaneDataGrid_internalNum | Y / Y | 42 |
| 26820 / 18186 | printProcess | Y / Y | 4 |
| 26821 / 18187 | GETServiceURL | Y / Y | 54 |
| 26822 / 18187 | queryParameter_Grid_ListPaneDataGrid_internalNum | Y / Y | 42 |
| 26823 / 18187 | queryParameter_printProcess | Y / Y | 4 |
| 26824 / 18188 | URL | Y / Y | 200 |
| 26834 / 18191 | URL | Y / Y | 144 |
| 26825 / 18189 | POSTServiceURL | Y / Y | 146 |
| 26826 / 18189 | queryParameter_Grid_ListPaneDataGrid_internalReceiptContainerNum | Y / Y | 42 |
| 26827 / 18189 | Post_SuccessCallback | Y / Y | 140 |
| 26828 / 18190 | ConfirmationMessageCode | Y / Y | 34 |
| 26829 / 18190 | POSTServiceURL | Y / Y | 132 |
| 26830 / 18190 | PostData_Grid_ListPaneDataGrid_InternalReceiptContainerNum | Y / Y | 42 |
| 26831 / 18190 | PostData_Grid_ListPaneDataGrid_InternalReceiptNum | Y / Y | 40 |
| 26832 / 18190 | Post_SuccessCallback | Y / Y | 112 |
| 26833 / 18190 | Post_ErrorCallback | Y / Y | 108 |
| 26835 / 18195 | POSTServiceURL | Y / Y | 74 |
| 26836 / 18195 | PostData_internalRecContNum | Y / Y | 42 |
| 26837 / 18195 | PostData_storedProcedure | Y / Y | 70 |
| 26838 / 18195 | EnableAction_ListPaneMenuActionPrintSelectedReceiptContainerDocs | Y / Y | 50 |
| 26839 / 18195 | EnableAction_ListPaneMenuActionPrintPreviewDocs | Y / Y | 50 |
| 26840 / 18195 | EnableAction_ListPaneMenuActionPrintReceiptContainerDocs | Y / Y | 50 |
| 26841 / 18195 | EnableAction_ListPaneMenuActionImmediateNeeds | Y / Y | 62 |
| 26842 / 18195 | EnableAction_ListPaneMenuActionCancelContainers | Y / Y | 46 |
| 26843 / 18195 | EnableAction_ListPaneMenuActionDeleteContainers | Y / Y | 142 |
| 26844 / 18195 | EnableAction_ListPaneMenuActionLocateContainers | Y / Y | 48 |
| 26845 / 18195 | EnableAction_ListPaneMenuActionRemoveContainerFromGroup | Y / Y | 104 |
| 26846 / 18195 | EnableAction_ListPaneMenuActionEdit | Y / Y | 50 |
| 26847 / 18195 | EnableAction_ListPaneMenuActionUnlocateContainers | Y / Y | 164 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 57 selected candidate rows for this Screen: **57 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40966 | 51852 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40967 | 51853 / Not applicable | data-securityCheckpoint | checkpoint | 29 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40968 | 51858 / Not applicable | data-formId | form_id | 3005 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40969 | 51858 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40972 | 51859 / Not applicable | data-formId | form_id | 3005 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40973 | 51859 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40975 | 51860 / Not applicable | data-securityCheckpoint | checkpoint | 25 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40976 | 51861 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40978 | 51862 / Not applicable | data-securityCheckpoint | checkpoint | 26 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40979 | 51863 / Not applicable | data-securityCheckpoint | checkpoint | 34 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40980 | 51864 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40981 | 51865 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40982 | 51866 / Not applicable | data-securityCheckpoint | checkpoint | 27 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40984 | 51867 / Not applicable | data-securityCheckpoint | checkpoint | 28 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40985 | 51868 / Not applicable | data-formId | form_id | 3005 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40986 | 51869 / Not applicable | data-dbcolumn | database_identifier | CONTAINER_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40988 | 51870 / Not applicable | data-dbcolumn | database_identifier | RECEIPT_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40990 | 51871 / Not applicable | data-dbcolumn | database_identifier | ERP_ORDER_LINE_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40991 | 51872 / Not applicable | data-dbcolumn | database_identifier | ITEM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40993 | 51873 / Not applicable | data-dbcolumn | database_identifier | ITEM_DESC | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40994 | 51874 / Not applicable | data-dbcolumn | database_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40996 | 51875 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40997 | 51876 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_RECEIPT_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40999 | 51877 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_RECEIPT_LINE_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41001 | 51878 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_GROUP_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41003 | 51879 / Not applicable | data-dbcolumn | database_identifier | CONTAINER_STATUS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41012 | 51886 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_RECEIPT_CONTAINER_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26785 | 51844 / 18168 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26789 | 51844 / 18168 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26794 | 51844 / 18168 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26797 | 51847 / 18170 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26801 | 51847 / 18170 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26807 | 51859 / 18182 | ConfirmationMessageCode | resource_code | MSG_DELETERECCONT01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26808 | 51859 / 18182 | POSTServiceURL | relative_api_path | /inbound/scaleapi/receiptContainersApi/deleted-Containers | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26809 | 51859 / 18182 | PostData_Grid_ListPaneDataGrid_InternalReceiptContainerNum | grid_field_identifier | INTERNAL_REC_CONT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26810 | 51859 / 18182 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26811 | 51860 / 18183 | ConfirmationMessageCode | resource_code | MSG_CANCELRECCONT01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26812 | 51860 / 18183 | POSTServiceURL | relative_api_path | /inbound/scaleapi/receiptContainersApi/cancelled-Containers | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26813 | 51860 / 18183 | PostData_Grid_ListPaneDataGrid_InternalReceiptContainerNum | grid_field_identifier | INTERNAL_REC_CONT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26814 | 51860 / 18183 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26815 | 51860 / 18183 | Post_ErrorCallback | callback_identifier | _webUi.insightListPaneActions.postMethodErrorCallbackHandler | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26817 | 51862 / 18185 | POSTServiceURL | relative_api_path | /inbound/scaleapi/receiptContainersApi/located-Containers | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26818 | 51862 / 18185 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26819 | 51863 / 18186 | queryParameter_Grid_ListPaneDataGrid_internalNum | grid_field_identifier | INTERNAL_REC_CONT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26821 | 51864 / 18187 | GETServiceURL | relative_api_path | /general/scaleapi/PrintApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26822 | 51864 / 18187 | queryParameter_Grid_ListPaneDataGrid_internalNum | grid_field_identifier | INTERNAL_REC_CONT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26825 | 51866 / 18189 | POSTServiceURL | relative_api_path | /inbound/scaleapi/receiptContainersApi/Removed-ContainerFromPutawayGroup? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26826 | 51866 / 18189 | queryParameter_Grid_ListPaneDataGrid_internalReceiptContainerNum | grid_field_identifier | INTERNAL_REC_CONT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26827 | 51866 / 18189 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26828 | 51867 / 18190 | ConfirmationMessageCode | resource_code | MSG_UNLOCATEALL01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26829 | 51867 / 18190 | POSTServiceURL | relative_api_path | /inbound/scaleapi/receiptContainersApi/Unlocated-ReceiptContainers | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26830 | 51867 / 18190 | PostData_Grid_ListPaneDataGrid_InternalReceiptContainerNum | grid_field_identifier | INTERNAL_REC_CONT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26831 | 51867 / 18190 | PostData_Grid_ListPaneDataGrid_InternalReceiptNum | grid_field_identifier | INTERNAL_RECEIPT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26832 | 51867 / 18190 | Post_SuccessCallback | callback_identifier | _webUi.receiptContainerInsight.successCallbackOnUnlocate | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26833 | 51867 / 18190 | Post_ErrorCallback | callback_identifier | _webUi.receiptContainerInsight.errorCallbackOnUnlocate | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26835 | 51886 / 18195 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26837 | 51886 / 18195 | PostData_storedProcedure | stored_procedure_identifier | RCPT_ContainerInsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
