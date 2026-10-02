# Receipt Status Insight — Form 4072, Screen 1481

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4072 |
| MAIN_UI_SCREEN Object ID | 1481 |
| Label / Form resource key | Receipt Status Insight / MNU_TPMRECEIPTSTSINSIGHT |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | tpm / 7 |
| Configured path | /tpm/insights/4072 |
| Candidate runtime URL | https://trav.manhscale.com/tpm/insights/4072 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4072 |
| Inspection requirement | separate_portal |
| Form configuration table/view | METADATA_INSIGHT_TPM_RECEIPT_HEADER_STATUS_VIEW |
| Help page reference | OnReceiptStatus.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4072 |
| Inspection time (UTC) | 2026-10-02T15:28:53.489Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_TPMRECEIPTSTSINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_TPM_RECEIPT_HEADER_STATUS_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1481 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Receipt Status Insight is recorded as `tpm`. Its saved configuration contains 5 parts, 16 groups, 29 controls, and 14 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3380 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 3381 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 3382 / SearchPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | InsightMenuApply |
| 3383 / ListPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |
| 3384 / DetailPane | Not populated / Not populated | 10 / 12500 | Y / Y / N | Not populated |

### Part 3380: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14160 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=14160; default=None |
| 14161 / SaveSearchModalDialogHeader | 14160 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=14160; default=None |
| 14162 / SaveSearchModalDialogBody | 14160 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=14160; default=None |
| 14163 / SaveSearchModalDialogFooter | 14160 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=14160; default=None |

#### Group 14162: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41294 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14163: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41295 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41296 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3381: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14164 / InsightMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14164; default=None |
| 14165 / InsightMenuPanel | 14164 | Not populated / Not populated | 60 / 750 | Y / Y | Fixed to top=Y; loading=0; nested unit=14164; default=None |
| 14168 / MenuExportToExcelPanel | 14164 | Not populated / Not populated | 60 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=14164; default=None |
| 14166 / InsightMenuFavoritesDropdown | 14164 | Favorites / FAVORITES | 100 / 1000 | Y / Y | Fixed to top=N; loading=0; nested unit=14164; default=None |
| 14167 / InsightListPaneMenuPanel | 14164 | Not populated / Not populated | 60 / 1100 | Y / Y | Fixed to top=Y; loading=0; nested unit=14164; default=None |

#### Group 14165: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41297 / InsightMenuApply | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 41298 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 41299 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 450 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 41300 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14168: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41304 / MenuExportToExcel | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 14167: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41301 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 41302 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 41303 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

### Part 3382: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14169 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=14169; default=None |
| 14170 / SearchPaneBasicCriteria | 14169 | Basic Criteria / BASICCRITERIA | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=14169; default=None |
| 14171 / SearchPaneTPMAdvancedCriteria | 14169 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=14169; default=None |

#### Group 14170: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41305 / BasicCriteriaTPMReceiptId | Receipt ID / RECEIPTID | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 41306 / BasicCriteriaTPMReceiptIdType | Receipt ID Type / RECEIPTIDTYPE | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41307 / BasicCriteriaTPMReceiptType | Receipt Type / RECEIPTTYPE | 10 / 1200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41308 / BasicCriteriaTPMCompany | Company / COMPANY | 280 / 1250 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41309 / BasicCriteriaTPMSourceName | Source Name / SOURCENAME | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 41310 / BasicCriteriaTPMShipFrom | Ship From / SHIPFROM | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 41311 / BasicCriteriaTPMFromReceiptDate | Receipt Date / RECEIPTDATE | 190 / 1800 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41312 / BasicCriteriaTPMPurchaseOrderId | Purchase Order ID / TPMPURCHASEORDERID | 10 / 1900 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41313 / BasicCriteriaTPMInternalReceiptNum | Internal Receipt Number / INTERNALRECEIPTNUM | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41314 / BasicCriteriaTPMWarehouse | Warehouse / WAREHOUSE | 280 / 2100 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14171: SearchPaneTPMAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41315 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 250 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3383: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14172 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=14172; default=None |
| 14173 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=14173; default=None |

#### Group 14172: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41316 / ListPaneSummaryReceipts | Receipts / RECEIPTS | 50 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41317 / ListPaneSummaryLines | Lines / LINES | 50 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41318 / ListPaneSummaryUnits | Units / UNITS | 50 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41319 / ListPaneSummaryVolume | Volume / VOLUME | 50 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14173: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41320 / ListPaneDataGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 41320 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14008 / RECEIPT_ID | RECEIPT_ID / Receipt ID / RECEIPTID | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14009 / RECEIPT_ID_TYPE | Not populated / Receipt ID Type / RECEIPTIDTYPE | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14010 / RECEIPT_TYPE | Not populated / Receipt Type / RECEIPTTYPE | 10 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14011 / COMPANY | Not populated / Company / COMPANY | 10 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14012 / PURCHASE_ORDER_ID | Not populated / Purchase Order ID / TPMPURCHASEORDERID | 10 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14013 / WAREHOUSE | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 70 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14014 / SOURCE_NAME | Not populated / Source Name / SOURCENAME | 10 / 10 / 80 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14015 / SHIP_FROM | Not populated / Ship From / SHIPFROM | 10 / 10 / 90 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14016 / RECEIPT_DATE | Not populated / Receipt Date / RECEIPTDATE | 30 / 10 / 100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14017 / INTERNAL_RECEIPT_NUM | INTERNAL_RECEIPT_NUM / Internal Receipt Number / INTERNALRECEIPTNUM | 10 / 10 / 100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14018 / Not populated | RECEIPT_ID / Not populated / Not populated | Not populated / 20 / 110 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14019 / Not populated | INTERNAL_RECEIPT_NUM / Internal Receipt Number / INTERNALRECEIPTNUM | Not populated / 20 / 120 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14006 / ICON | Not populated / Icon / ICON | 10 / 10 / 8600 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14007 / COLOR | Not populated / Color / COLOR | 10 / 10 / 8700 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 3384: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14174 / DetailPaneTPMReceiptHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=14174; default=None |
| 14175 / indicatorpane | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=14175; default=None |

#### Group 14174: DetailPaneTPMReceiptHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41321 / DetailPaneHeaderTPMReceiptID | Not populated / Not populated | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=445; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14175: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41322 / ReceiptInsightWavedIndicatorTileLines | Lines / LINES | 360 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 26 control attributes, 14 events, and 16 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 31509 | 41294 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 31510 | 41294 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 31511 | 41305 / BasicCriteriaTPMReceiptId | data-dbcolumn | Y / Y / N | 20 / 0 |
| 31512 | 41305 / BasicCriteriaTPMReceiptId | Lookup | Y / Y / N | 92 / 0 |
| 31513 | 41306 / BasicCriteriaTPMReceiptIdType | data-dbcolumn | Y / Y / N | 30 / 0 |
| 31514 | 41307 / BasicCriteriaTPMReceiptType | data-dbcolumn | Y / Y / N | 24 / 0 |
| 31515 | 41308 / BasicCriteriaTPMCompany | data-dbcolumn | Y / Y / N | 14 / 0 |
| 31516 | 41309 / BasicCriteriaTPMSourceName | data-dbcolumn | Y / Y / N | 22 / 0 |
| 31517 | 41309 / BasicCriteriaTPMSourceName | Lookup | Y / Y / N | 98 / 0 |
| 31518 | 41310 / BasicCriteriaTPMShipFrom | data-dbcolumn | Y / Y / N | 18 / 0 |
| 31519 | 41310 / BasicCriteriaTPMShipFrom | Lookup | Y / Y / N | 86 / 0 |
| 31520 | 41311 / BasicCriteriaTPMFromReceiptDate | data-dbcolumn | Y / Y / N | 24 / 0 |
| 31521 | 41311 / BasicCriteriaTPMFromReceiptDate | data-dateOnly | Y / Y / Y | 8 / 0 |
| 31522 | 41312 / BasicCriteriaTPMPurchaseOrderId | data-dbcolumn | Y / Y / N | 34 / 0 |
| 31523 | 41313 / BasicCriteriaTPMInternalReceiptNum | data-dbcolumn | Y / Y / N | 40 / 0 |
| 31524 | 41313 / BasicCriteriaTPMInternalReceiptNum | nullable | Y / Y / Y | 8 / 0 |
| 31525 | 41314 / BasicCriteriaTPMWarehouse | defaultValue | Y / Y / Y | 32 / 0 |
| 31526 | 41314 / BasicCriteriaTPMWarehouse | data-dbcolumn | Y / Y / N | 18 / 0 |
| 31527 | 41316 / ListPaneSummaryReceipts | data-aggregateClause | Y / Y / Y | 54 / 0 |
| 31528 | 41317 / ListPaneSummaryLines | data-aggregateClause | Y / Y / Y | 302 / 0 |
| 31529 | 41318 / ListPaneSummaryUnits | data-aggregateClause | Y / Y / Y | 288 / 0 |
| 31530 | 41319 / ListPaneSummaryVolume | data-aggregateClause | Y / Y / Y | 306 / 0 |
| 31531 | 41320 / ListPaneDataGrid | data-dbtable | Y / Y / N | 94 / 0 |
| 31532 | 41320 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 31533 | 41320 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 31534 | 41322 / ReceiptInsightWavedIndicatorTileLines | data-indicatorTileGoToInsight | Y / Y / Y | 208 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 13664 / click | 41295 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 13665 / click | 41296 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 13666 / click | 41297 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 13667 / click | 41298 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 13668 / click | 41299 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 13669 / click | 41300 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 13670 / click | 41301 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 13671 / click | 41302 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 13672 / click | 41303 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 13673 / click | 41304 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 13674 / iggridrequesterror | 41320 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 13675 / iggriddatabound | 41320 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 13676 / iggridselectionrowselectionchanged | 41320 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 13677 / iggridselectionactiverowchanged | 41320 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 18799 / 13664 | GETServiceURL | Y / Y | 76 |
| 18800 / 13664 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 18801 / 13664 | queryParameter_Function_UserName | Y / Y | 44 |
| 18802 / 13664 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 18803 / 13664 | POSTServiceURL | Y / Y | 74 |
| 18804 / 13664 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 18805 / 13664 | PostData_Function_UserName | Y / Y | 44 |
| 18806 / 13664 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 18807 / 13664 | PostData_Function_SearchValue | Y / Y | 98 |
| 18808 / 13664 | Post_SuccessCallback | Y / Y | 114 |
| 18809 / 13664 | ModalDialogName | Y / Y | 42 |
| 18810 / 13665 | ModalDialogName | Y / Y | 42 |
| 18811 / 13669 | ModalDialogName | Y / Y | 42 |
| 18812 / 13677 | POSTServiceURL | Y / Y | 72 |
| 18813 / 13677 | PostData_internalReceiptNum | Y / Y | 40 |
| 18814 / 13677 | PostData_storedProcedure | Y / Y | 52 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 16 selected candidate rows for this Screen: **16 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 31511 | 41305 / Not applicable | data-dbcolumn | database_identifier | RECEIPT_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31513 | 41306 / Not applicable | data-dbcolumn | database_identifier | RECEIPT_ID_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31514 | 41307 / Not applicable | data-dbcolumn | database_identifier | RECEIPT_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31515 | 41308 / Not applicable | data-dbcolumn | database_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31516 | 41309 / Not applicable | data-dbcolumn | database_identifier | SOURCE_NAME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31518 | 41310 / Not applicable | data-dbcolumn | database_identifier | SHIP_FROM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31520 | 41311 / Not applicable | data-dbcolumn | database_identifier | RECEIPT_DATE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31522 | 41312 / Not applicable | data-dbcolumn | database_identifier | PURCHASE_ORDER_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31523 | 41313 / Not applicable | data-dbcolumn | database_identifier | Internal_Receipt_Num | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31526 | 41314 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31531 | 41320 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_TPM_RECEIPT_HEADER_STATUS_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18799 | 41295 / 13664 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18803 | 41295 / 13664 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18808 | 41295 / 13664 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18812 | 41320 / 13677 | POSTServiceURL | relative_api_path | /general/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18814 | 41320 / 13677 | PostData_storedProcedure | stored_procedure_identifier | RCPT_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
