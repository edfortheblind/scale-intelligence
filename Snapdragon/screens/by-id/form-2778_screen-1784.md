# Receipt Quality History Insight — Form 2778, Screen 1784

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2778 |
| MAIN_UI_SCREEN Object ID | 1784 |
| Label / Form resource key | Receipt Quality History Insight / MNU_RECEIPTQUALITYHISTORYINSIGHT |
| Functional area code | 100 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2778 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2778 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2778 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_RECEIPT_QUALITY_HISTORY |
| Help page reference | usingRecQualHistIns.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2778 |
| Inspection time (UTC) | 2026-10-02T15:24:06.542Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_RECEIPTQUALITYHISTORYINSIGHT |
| Observed configured table/view | METADATA_RECEIPT_QUALITY_HISTORY |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1784 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:20:56.310Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/insights/2778#search; Receipt Quality History Insight | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

**Visible criteria / entry fields:** Vendor Name; ERP Order Number; Receipt ID; Username; Reason Code; Inventory Status; Item; Carrier; Internal Receipt Number; From Activity Date Time; To Activity Date Time; From Receipt Date; To Receipt Date; Warehouse.

**Visible grid headers:** Internal ID; Receipt ID; Reason Code Description; Username; Item; Company; Activity Date Time.

**Observed action/menu labels:** View.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Receipt Quality History Insight is recorded as `insight`. Its saved configuration contains 6 parts, 21 groups, 36 controls, and 14 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4423 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4424 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4425 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4426 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4427 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4428 / DetailPane | Not populated / Not populated | 10 / 12500 | Y / Y / N | Not populated |

### Part 4423: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18207 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18207; default=None |
| 18208 / SaveSearchModalDialogHeader | 18207 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18207; default=None |
| 18209 / SaveSearchModalDialogBody | 18207 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18207; default=None |
| 18210 / SaveSearchModalDialogFooter | 18207 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18207; default=None |

#### Group 18209: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51934 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18210: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51935 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51936 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4424: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18211 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18211; default=None |
| 18212 / GadgetCalculationQueryDialogHeader | 18211 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18211; default=None |
| 18213 / GadgetCalculationQueryDialogBody | 18211 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18211; default=None |
| 18214 / GadgetCalculationQueryDialogFooter | 18211 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18211; default=None |

#### Group 18213: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51937 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18214: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51938 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51939 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4425: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18215 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18215; default=None |
| 18216 / InsightMenuPanel | 18215 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18215; default=None |
| 18217 / InsightMenuFavoritesDropdown | 18215 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18215; default=None |
| 18218 / InsightListPaneMenuPanel | 18215 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18215; default=None |
| 18219 / MenuExportToExcelPanel | 18215 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18215; default=None |
| 18220 / InsightMenuActionsDropdown | 18215 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18215; default=None |

#### Group 18216: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51940 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51941 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51942 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51943 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18218: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51944 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51945 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51946 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18219: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51947 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18220: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51948 / ListPaneMenuActionView | View / VIEW | 150 / 2200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |

### Part 4426: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18221 / SearchPaneMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18221; default=None |
| 18222 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18222; default=None |
| 18223 / SearchPaneBasicCriteria | 18222 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18222; default=None |
| 18224 / SearchPaneAdvancedCriteria | 18222 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=18222; default=None |

#### Group 18223: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51949 / BasicCriteriaVendorName | Vendor Name / VENDORNAME | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51950 / BasicCriteriaErpOrderNumber | ERP Order Number / ERPORDERNUMBER | 10 / 7500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51951 / BasicCriteriaReceiptId | Receipt ID / RECEIPTID | 10 / 7500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51952 / BasicCriteriaUserName | Username / USERNAME | 80 / 10000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51953 / BasicCriteriaReasonCode | Reason Code / REASONCODE | 80 / 10000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51954 / BasicCriteriaInventoryStatus | Inventory Status / INVENTORYSTATUS | 80 / 10000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51955 / BasicCriteriaItem | Item / ITEM | 10 / 12500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51956 / SearchPaneCarrierAndService | Carrier / CARRIER | 280 / 13000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51957 / BasicCriteriaInternalReceiptNumber | Internal Receipt Number / INTERNALRECEIPTNUM | 90 / 17500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51958 / BasicCriteriaActivityDateRange | Activity Date Time / ACTIVITYDATETIME | 190 / 25000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51959 / BasicCriteriaArrivedDateRange | Receipt Date / RECEIPTDATE | 190 / 25000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51960 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 26000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18224: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51961 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4427: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18225 / ListPaneMenu | Not populated | Not populated / Not populated | 70 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18225; default=None |
| 18226 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18226; default=None |

#### Group 18226: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51962 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51962 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18622 / ICON | Not populated / Icon / ICON | 10 / 10 / 500 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18610 / INTERNAL_ID | INTERNAL_ID / Internal ID / INTERNALID | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18612 / RECEIPT_ID | RECEIPT_ID / Receipt ID / RECEIPTID | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18613 / DESCRIPTION | DESCRIPTION / Reason Code Description / REASONCODEDESCRIPTION | 10 / 10 / 2000 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18614 / USER_NAME | USER_NAME / Username / USERNAME | 10 / 10 / 3000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18615 / ITEM | ITEM / Item / ITEM | 10 / 10 / 4000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18616 / COMPANY | Company / Company / COMPANY | 10 / 10 / 5000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18617 / ACTIVITY_DATE_TIME | ACTIVITY_DATE_TIME / Activity Date Time / ACTIVITYDATETIME | 30 / 10 / 6000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18618 / warehouse | warehouse / Not populated / warehouse | 10 / 10 / 7000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18619 / INTERNAL_RECEIPT_NUM | INTERNAL_RECEIPT_NUM / Internal Receipt Number / INTERNALRECEIPTNUM | 10 / 10 / 8000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18620 / DATE_TIME_STAMP | DATE_TIME_STAMP / Date Time Stamp / DATETIMESTAMP | 30 / 10 / 9000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18621 / REASON_CODE | REASON_CODE / Reason Code / REASONCODE | 10 / 10 / 10000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18623 / COLOR | Not populated / Color / COLOR | 10 / 10 / 11000 / 1 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18611 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 11010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4428: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18227 / DetailPaneHeaderRowWorkUnit | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18227; default=None |

#### Group 18227: DetailPaneHeaderRowWorkUnit — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51963 / DetailPaneHeaderInternalId | Not populated / Not populated | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=602; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51964 / DetailPaneHeaderReceiptId | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=602; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51965 / DetailPaneHeaderReasonCodeDescription | Not populated / Not populated | 30 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=602; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51966 / DetailPaneHeaderItem | Not populated / Not populated | 30 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=602; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51967 / DetailPaneHeaderDescription | Not populated / Not populated | 30 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=602; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51968 / DetailPaneHeaderCompany | Company / COMPANY | 30 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=602; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51969 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=602; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 30 control attributes, 17 events, and 25 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 41060 | 51934 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 41061 | 51934 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 41062 | 51943 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41063 | 51944 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41064 | 51948 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 41065 | 51948 / ListPaneMenuActionView | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41066 | 51949 / BasicCriteriaVendorName | data-dbcolumn | Y / Y / N | 22 / 0 |
| 41067 | 51949 / BasicCriteriaVendorName | Lookup | Y / Y / N | 92 / 0 |
| 41068 | 51950 / BasicCriteriaErpOrderNumber | data-dbcolumn | Y / Y / N | 26 / 0 |
| 41069 | 51950 / BasicCriteriaErpOrderNumber | Lookup | Y / Y / N | 90 / 1 |
| 41070 | 51951 / BasicCriteriaReceiptId | data-dbcolumn | Y / Y / N | 20 / 0 |
| 41071 | 51951 / BasicCriteriaReceiptId | Lookup | Y / Y / N | 86 / 1 |
| 41072 | 51952 / BasicCriteriaUserName | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41073 | 51953 / BasicCriteriaReasonCode | data-dbcolumn | Y / Y / N | 22 / 0 |
| 41074 | 51954 / BasicCriteriaInventoryStatus | data-dbcolumn | Y / Y / N | 32 / 0 |
| 41075 | 51955 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 41076 | 51955 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 41077 | 51956 / SearchPaneCarrierAndService | data-parentdbcolumn | Y / Y / N | 14 / 0 |
| 41078 | 51956 / SearchPaneCarrierAndService | data-childdbcolumn | Y / Y / N | 30 / 0 |
| 41079 | 51957 / BasicCriteriaInternalReceiptNumber | data-dbcolumn | Y / Y / N | 40 / 0 |
| 41080 | 51957 / BasicCriteriaInternalReceiptNumber | minValue | Y / Y / Y | 2 / 0 |
| 41081 | 51957 / BasicCriteriaInternalReceiptNumber | nullable | Y / Y / Y | 8 / 0 |
| 41082 | 51958 / BasicCriteriaActivityDateRange | data-dbcolumn | Y / Y / N | 36 / 0 |
| 41083 | 51958 / BasicCriteriaActivityDateRange | allowTodayOnlySelection | Y / Y / Y | 8 / 0 |
| 41084 | 51959 / BasicCriteriaArrivedDateRange | data-dbcolumn | Y / Y / N | 38 / 0 |
| 41085 | 51959 / BasicCriteriaArrivedDateRange | data-dateOnly | Y / Y / Y | 8 / 0 |
| 41086 | 51960 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 41087 | 51960 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41088 | 51962 / ListPaneDataGrid | data-dbtable | Y / Y / N | 64 / 0 |
| 41089 | 51963 / DetailPaneHeaderInternalId | href | Y / Y / Y | 112 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18217 / click | 51935 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18218 / click | 51936 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18219 / click | 51938 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18220 / click | 51939 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18221 / click | 51940 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18222 / click | 51941 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18223 / click | 51942 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18224 / click | 51943 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18225 / click | 51944 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18226 / click | 51945 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18227 / click | 51946 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18228 / click | 51947 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18229 / click | 51948 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18230 / iggridrequesterror | 51962 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18231 / iggriddatabound | 51962 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18232 / iggridselectionrowselectionchanged | 51962 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18233 / iggridselectionactiverowchanged | 51962 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 26883 / 18217 | GETServiceURL | Y / Y | 76 |
| 26884 / 18217 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 26885 / 18217 | queryParameter_Function_UserName | Y / Y | 44 |
| 26886 / 18217 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26887 / 18217 | POSTServiceURL | Y / Y | 74 |
| 26888 / 18217 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 26889 / 18217 | PostData_Function_UserName | Y / Y | 44 |
| 26890 / 18217 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26891 / 18217 | PostData_Function_SearchValue | Y / Y | 98 |
| 26892 / 18217 | Post_SuccessCallback | Y / Y | 114 |
| 26893 / 18217 | ModalDialogName | Y / Y | 42 |
| 26894 / 18218 | ModalDialogName | Y / Y | 42 |
| 26895 / 18219 | POSTServiceURL | Y / Y | 144 |
| 26896 / 18219 | Form_Id | Y / Y | 8 |
| 26897 / 18219 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26898 / 18219 | PostData_Function_SearchValue | Y / Y | 98 |
| 26899 / 18219 | Post_SuccessCallback | Y / Y | 114 |
| 26900 / 18219 | ModalDialogName | Y / Y | 56 |
| 26901 / 18220 | ModalDialogName | Y / Y | 56 |
| 26902 / 18224 | ModalDialogName | Y / Y | 42 |
| 26903 / 18225 | ModalDialogName | Y / Y | 56 |
| 26904 / 18229 | URL | Y / Y | 112 |
| 26905 / 18233 | POSTServiceURL | Y / Y | 74 |
| 26906 / 18233 | PostData_internalid | Y / Y | 22 |
| 26907 / 18233 | PostData_storedProcedure | Y / Y | 50 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 23 selected candidate rows for this Screen: **23 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 41062 | 51943 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41063 | 51944 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41064 | 51948 / Not applicable | data-formId | form_id | 3095 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41065 | 51948 / Not applicable | data-securityCheckpoint | checkpoint | 6 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41066 | 51949 / Not applicable | data-dbcolumn | database_identifier | VENDOR_NAME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41068 | 51950 / Not applicable | data-dbcolumn | database_identifier | ERP_ORDER_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41070 | 51951 / Not applicable | data-dbcolumn | database_identifier | RECEIPT_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41072 | 51952 / Not applicable | data-dbcolumn | database_identifier | USER_NAME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41073 | 51953 / Not applicable | data-dbcolumn | database_identifier | REASON_CODE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41074 | 51954 / Not applicable | data-dbcolumn | database_identifier | INVENTORY_STATUS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41075 | 51955 / Not applicable | data-dbcolumn | database_identifier | Item | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41079 | 51957 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_RECEIPT_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41082 | 51958 / Not applicable | data-dbcolumn | database_identifier | Activity_Date_Time | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41084 | 51959 / Not applicable | data-dbcolumn | database_identifier | ACTUAL_RECEIPT_DATE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41087 | 51960 / Not applicable | data-dbcolumn | database_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41088 | 51962 / Not applicable | data-dbtable | database_identifier | METADATA_RECEIPT_QUALITY_HISTORY | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26883 | 51935 / 18217 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26887 | 51935 / 18217 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26892 | 51935 / 18217 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26895 | 51938 / 18219 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26899 | 51938 / 18219 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26905 | 51962 / 18233 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26907 | 51962 / 18233 | PostData_storedProcedure | stored_procedure_identifier | RQH_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
