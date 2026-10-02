# Order Line Status Insight — Form 4066, Screen 1477

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4066 |
| MAIN_UI_SCREEN Object ID | 1477 |
| Label / Form resource key | Order Line Status Insight / MNU_TPMORDERLINESTSINSIGHT |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | tpm / 7 |
| Configured path | /tpm/insights/4066 |
| Candidate runtime URL | https://trav.manhscale.com/tpm/insights/4066 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4066 |
| Inspection requirement | separate_portal |
| Form configuration table/view | METADATA_INSIGHT_TPM_ORDER_LINE_STATUS_VIEW |
| Help page reference | TpmOrderLineStatusInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4066 |
| Inspection time (UTC) | 2026-10-02T15:28:42.727Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_TPMORDERLINESTSINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_TPM_ORDER_LINE_STATUS_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1477 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Order Line Status Insight is recorded as `tpm`. Its saved configuration contains 5 parts, 15 groups, 29 controls, and 19 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3360 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 3361 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 3362 / SearchPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | InsightMenuApply |
| 3363 / ListPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |
| 3364 / DetailPane | Not populated / Not populated | 10 / 12500 | Y / Y / N | Not populated |

### Part 3360: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14096 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=14096; default=None |
| 14097 / SaveSearchModalDialogHeader | 14096 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=14096; default=None |
| 14098 / SaveSearchModalDialogBody | 14096 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=14096; default=None |
| 14099 / SaveSearchModalDialogFooter | 14096 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=14096; default=None |

#### Group 14098: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41168 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14099: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41169 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41170 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3361: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14100 / InsightMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14100; default=None |
| 14101 / InsightMenuPanel | 14100 | Not populated / Not populated | 60 / 750 | Y / Y | Fixed to top=Y; loading=0; nested unit=14100; default=None |
| 14104 / MenuExportToExcelPanel | 14100 | Not populated / Not populated | 60 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=14100; default=None |
| 14102 / InsightMenuFavoritesDropdown | 14100 | Favorites / FAVORITES | 100 / 1000 | Y / Y | Fixed to top=N; loading=0; nested unit=14100; default=None |
| 14103 / InsightListPaneMenuPanel | 14100 | Not populated / Not populated | 60 / 1100 | Y / Y | Fixed to top=Y; loading=0; nested unit=14100; default=None |

#### Group 14101: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41171 / InsightMenuApply | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 41172 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 41173 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 450 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 41174 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14104: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41178 / MenuExportToExcel | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 14103: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41175 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 41176 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 41177 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

### Part 3362: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14105 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=14105; default=None |
| 14106 / SearchPaneBasicCriteria | 14105 | Basic Criteria / BASICCRITERIA | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=14105; default=None |
| 14107 / SearchPaneAdvancedCriteria | 14105 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=14105; default=None |

#### Group 14106: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41179 / BasicCriteriaOrderNum | Order Number / TPMORDERNUMBER | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 41180 / BasicCriteriaErpOrderLineNum | Line Number / TPMLINENUMBER | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41181 / BasicCriteriaItem | Item / ITEM | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 41182 / BasicCriteriaDescription | Description / DESCRIPTION | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41183 / BasicCriteriaCompany | Company / TPMCOMPANY | 280 / 1500 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41184 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 1750 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41185 / BasicCriteriaIntOrderNum | Internal Order Number / INTERNALORDERNUM | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41186 / BasicCriteriaOrderDate | Order Date / TPMORDERDATE | 190 / 2250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14107: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41187 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 250 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3363: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14108 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=14108; default=None |
| 14109 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=14109; default=None |

#### Group 14108: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41188 / ListPaneSummaryTotalOrderNum | Orders / ORDERS | 50 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41189 / ListPaneSummaryDetails | Lines / LINES | 50 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41190 / ListPaneSummaryContainers | Total Qty / TOTALQTY | 50 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14109: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41191 / ListPaneDataGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 41191 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 13946 / Not populated | ERP_ORDER_LINE_NUM / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13955 / Not populated | INTERNAL_ORDER_DTL_NUM / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13957 / Not populated | ERP_ORDER / Not populated / Not populated | Not populated / 30 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13959 / Not populated | ERP_ORDER / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13944 / ICON | Not populated / Icon / ICON | 10 / 10 / 500 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13947 / ERP_ORDER_LINE_NUM | Not populated / Line Number / TPMLINENUMBER | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13948 / ITEM | Not populated / Item / ITEM | 10 / 10 / 1500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13949 / ITEM_DESC | Not populated / Description / DESCRIPTION | 10 / 10 / 2000 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13950 / COMPANY | Not populated / Company / TPMCOMPANY | 10 / 10 / 2500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13951 / CONDITION | Not populated / Condition / TPMCONDITION | 10 / 10 / 2750 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13952 / OPEN_QTY | Not populated / Ordered Qty / TPMORDEREDQTY | 20 / 10 / 3000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 13953 / SHIPPED_QTY | Not populated / Shipped Qty / TPMSHIPPEDQTY | 20 / 10 / 3500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 13954 / INTERNAL_ORDER_DTL_NUM | INTERNAL_ORDER_DTL_NUM / Internal Order Detail Number / TPMINTERNALORDERDETAILNUMBER | 10 / 10 / 4000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13956 / INTERNAL_ORDER_NUM | Not populated / Internal Order Number / INTERNAL_ORDER_NUM | 10 / 10 / 4500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13958 / ERP_ORDER | ERP_ORDER / Order Number / TPMORDERNUMBER | 10 / 10 / 5000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13960 / ORDER_DATE | Not populated / Order Date / TPMORDERDATE | 30 / 10 / 5500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13961 / WAREHOUSE | Not populated / Warehouse / TPMWAREHOUSE | 10 / 10 / 6000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13962 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6500 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13945 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 6510 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 3364: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14110 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=14110; default=None |

#### Group 14110: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41192 / DetailPaneLineNumber | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=441; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41193 / DetailPaneItem | Not populated / Not populated | 30 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=441; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41194 / DetailPaneCompany | Not populated / Not populated | 30 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=441; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41195 / DetailPaneItemDecsription | Not populated / Not populated | 30 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=441; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41196 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=441; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 22 control attributes, 14 events, and 16 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 31401 | 41168 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 31402 | 41168 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 31403 | 41179 / BasicCriteriaOrderNum | data-dbcolumn | Y / Y / N | 18 / 0 |
| 31404 | 41179 / BasicCriteriaOrderNum | Lookup | Y / Y / N | 78 / 0 |
| 31405 | 41180 / BasicCriteriaErpOrderLineNum | data-dbcolumn | Y / Y / N | 36 / 0 |
| 31406 | 41180 / BasicCriteriaErpOrderLineNum | nullable | Y / Y / Y | 8 / 0 |
| 31407 | 41181 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 31408 | 41181 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 31409 | 41182 / BasicCriteriaDescription | data-dbcolumn | Y / Y / N | 18 / 0 |
| 31410 | 41183 / BasicCriteriaCompany | data-dbcolumn | Y / Y / N | 14 / 0 |
| 31411 | 41184 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 31412 | 41184 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 31413 | 41185 / BasicCriteriaIntOrderNum | data-dbcolumn | Y / Y / N | 36 / 0 |
| 31414 | 41185 / BasicCriteriaIntOrderNum | nullable | Y / Y / Y | 8 / 0 |
| 31415 | 41186 / BasicCriteriaOrderDate | data-dbcolumn | Y / Y / N | 20 / 0 |
| 31416 | 41186 / BasicCriteriaOrderDate | data-dateOnly | Y / Y / Y | 8 / 0 |
| 31417 | 41188 / ListPaneSummaryTotalOrderNum | data-aggregateClause | Y / Y / Y | 68 / 0 |
| 31418 | 41190 / ListPaneSummaryContainers | data-aggregateClause | Y / Y / Y | 26 / 0 |
| 31419 | 41191 / ListPaneDataGrid | data-dbtable | Y / Y / N | 86 / 0 |
| 31420 | 41191 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 44 / 0 |
| 31421 | 41191 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 10 / 0 |
| 31422 | 41191 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 13602 / click | 41169 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 13603 / click | 41170 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 13604 / click | 41171 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 13605 / click | 41172 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 13606 / click | 41173 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 13607 / click | 41174 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 13608 / click | 41175 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 13609 / click | 41176 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 13610 / click | 41177 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 13611 / click | 41178 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 13612 / iggridrequesterror | 41191 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 13613 / iggriddatabound | 41191 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 13614 / iggridselectionrowselectionchanged | 41191 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 13615 / iggridselectionactiverowchanged | 41191 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 18717 / 13602 | GETServiceURL | Y / Y | 76 |
| 18718 / 13602 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 18719 / 13602 | queryParameter_Function_UserName | Y / Y | 44 |
| 18720 / 13602 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 18721 / 13602 | POSTServiceURL | Y / Y | 74 |
| 18722 / 13602 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 18723 / 13602 | PostData_Function_UserName | Y / Y | 44 |
| 18724 / 13602 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 18725 / 13602 | PostData_Function_SearchValue | Y / Y | 98 |
| 18726 / 13602 | Post_SuccessCallback | Y / Y | 114 |
| 18727 / 13602 | ModalDialogName | Y / Y | 42 |
| 18728 / 13603 | ModalDialogName | Y / Y | 42 |
| 18729 / 13607 | ModalDialogName | Y / Y | 42 |
| 18730 / 13615 | POSTServiceURL | Y / Y | 72 |
| 18731 / 13615 | PostData_internalOrderDetailNum | Y / Y | 44 |
| 18732 / 13615 | PostData_storedProcedure | Y / Y | 80 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 14 selected candidate rows for this Screen: **14 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 31403 | 41179 / Not applicable | data-dbcolumn | database_identifier | ERP_ORDER | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31405 | 41180 / Not applicable | data-dbcolumn | database_identifier | ERP_ORDER_LINE_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31407 | 41181 / Not applicable | data-dbcolumn | database_identifier | ITEM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31409 | 41182 / Not applicable | data-dbcolumn | database_identifier | ITEM_DESC | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31410 | 41183 / Not applicable | data-dbcolumn | database_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31412 | 41184 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31413 | 41185 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_ORDER_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31415 | 41186 / Not applicable | data-dbcolumn | database_identifier | ORDER_DATE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31419 | 41191 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_TPM_ORDER_LINE_STATUS_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18717 | 41169 / 13602 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18721 | 41169 / 13602 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18726 | 41169 / 13602 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18730 | 41191 / 13615 | POSTServiceURL | relative_api_path | /general/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18732 | 41191 / 13615 | PostData_storedProcedure | stored_procedure_identifier | TpmOrderLineStatus_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
