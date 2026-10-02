# Order Status Insight — Form 4065, Screen 1658

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4065 |
| MAIN_UI_SCREEN Object ID | 1658 |
| Label / Form resource key | Order Status Insight / MNU_TPMORDERSTSINSIGHT |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | tpm / 7 |
| Configured path | /tpm/insights/4065 |
| Candidate runtime URL | https://trav.manhscale.com/tpm/insights/4065 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4065 |
| Inspection requirement | separate_portal |
| Form configuration table/view | METADATA_INSIGHT_TPM_ORDER_STATUS_VIEW |
| Help page reference | TpmOrderStatusInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4065 |
| Inspection time (UTC) | 2026-10-02T15:28:38.567Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_TPMORDERSTSINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_TPM_ORDER_STATUS_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1658 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Order Status Insight is recorded as `tpm`. Its saved configuration contains 5 parts, 16 groups, 34 controls, and 15 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3862 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 3863 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 3864 / SearchPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | InsightMenuApply |
| 3865 / ListPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |
| 3866 / DetailPane | Not populated / Not populated | 10 / 12500 | Y / Y / N | Not populated |

### Part 3862: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16142 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=16142; default=None |
| 16143 / SaveSearchModalDialogHeader | 16142 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=16142; default=None |
| 16144 / SaveSearchModalDialogBody | 16142 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=16142; default=None |
| 16145 / SaveSearchModalDialogFooter | 16142 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=16142; default=None |

#### Group 16144: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47181 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16145: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47182 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47183 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3863: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16146 / InsightMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16146; default=None |
| 16147 / InsightMenuPanel | 16146 | Not populated / Not populated | 60 / 750 | Y / Y | Fixed to top=Y; loading=0; nested unit=16146; default=None |
| 16150 / MenuExportToExcelPanel | 16146 | Not populated / Not populated | 60 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=16146; default=None |
| 16148 / InsightMenuFavoritesDropdown | 16146 | Favorites / FAVORITES | 100 / 1000 | Y / Y | Fixed to top=N; loading=0; nested unit=16146; default=None |
| 16149 / InsightListPaneMenuPanel | 16146 | Not populated / Not populated | 60 / 1100 | Y / Y | Fixed to top=Y; loading=0; nested unit=16146; default=None |

#### Group 16147: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47184 / InsightMenuApply | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 47185 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 47186 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 450 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 47187 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16150: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47191 / MenuExportToExcel | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 16149: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47188 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 47189 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 47190 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

### Part 3864: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16151 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=16151; default=None |
| 16152 / SearchPaneBasicCriteria | 16151 | Basic Criteria / BASICCRITERIA | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=16151; default=None |
| 16153 / SearchPaneAdvancedCriteria | 16151 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=16151; default=None |

#### Group 16152: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47192 / BasicCriteriaOrderNum | Order Number / TPMORDERNUMBER | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 47193 / BasicCriteriaOrderType | Order Type / TPMORDERTYPE | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47194 / BasicCriteriaCompany | Company / TPMCOMPANY | 280 / 1250 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47195 / BasicCriteriaCustomerPO | Customer PO / TPMCUSTOMERPO | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47196 / BasicCriteriaCustomerName | Name / TPMCUSTOMERNAME | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 47197 / BasicCriteriaCustomer | Customer / TPMCUSTOMER | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 47198 / BasicCriteriaCustomerPostalCode | Postal Code / TPMCUSTOMERPOSTALCODE | 90 / 2250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47199 / BasicCriteriaShipTo | Ship To / TPMSHIPTO | 90 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47200 / BasicCriteriaWarehouse | Warehouse / WAREHOUSE | 280 / 2750 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47201 / BasicCriteriaShipToPostalCode | Postal Code / TPMSHIPTOPOSTALCODE | 90 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47202 / BasicCriteriaOrderDate | Order Date / TPMORDERDATE | 190 / 3250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47203 / SearchPaneOrderConditionLastChanged | Condition Last Changed / TPMCONDITIONLASTCHANGED | 190 / 8500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16153: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47204 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 250 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3865: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16154 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=16154; default=None |
| 16155 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=16155; default=None |

#### Group 16154: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47205 / ListPaneSummaryTotalOrderNum | Orders / ORDERS | 50 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47206 / ListPaneSummaryDetails | Lines / LINES | 50 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47207 / ListPaneSummaryContainers | Containers / CONTAINERS | 50 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16155: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47208 / ListPaneDataGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 47208 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16549 / Not populated | INTERNAL_ORDER_NUM / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16550 / Not populated | ERP_ORDER / Not populated / Not populated | Not populated / 30 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16552 / Not populated | ERP_ORDER / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16547 / INTERNAL_ORDER_NUM | INTERNAL_ORDER_NUM / Internal Order Number / INTERNAL_ORDER_NUM | 10 / 10 / 1000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16551 / ERP_ORDER | ERP_ORDER / Order Number / TPMORDERNUMBER | 10 / 10 / 1500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16553 / ORDER_TYPE | Not populated / Order Type / TPMORDERTYPE | 10 / 10 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16554 / WAREHOUSE | Not populated / Warehouse / TPMWAREHOUSE | 10 / 10 / 2500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16555 / COMPANY | Not populated / Company / TPMCOMPANY | 10 / 10 / 3000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16556 / CUSTOMER_NAME | Not populated / Name / TPMCUSTOMERNAME | 10 / 10 / 3500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16557 / SHIP_TO | Not populated / Ship To / SHIPTO | 10 / 10 / 4000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16558 / ORDER_DATE | Not populated / Order Date / TPMORDERDATE | 30 / 10 / 4500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16559 / ORDER_CONDITION | Not populated / Condition / TPMCONDITION | 10 / 10 / 5000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16560 / COLOR | Not populated / Color / COLOR | 10 / 10 / 5500 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16561 / ICON | Not populated / Icon / ICON | 10 / 10 / 6000 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16548 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 6010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 3866: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16156 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=16156; default=None |
| 16157 / indicatorpane | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=16157; default=None |

#### Group 16156: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47209 / DetailPaneOrderNumber | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=520; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47210 / DetailPaneCustomerName | Not populated / Not populated | 30 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=520; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47211 / DetailPaneCustomerID | Not populated / Not populated | 30 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=520; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47212 / DetailPaneOrderCondition | Company / COMPANY | 30 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=520; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16157: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47213 / ShipmentInsightWavedIndicatorTileLines | Lines / LINES | 360 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47214 / ShipmentInsightWavedIndicatorTileContainers | Containers / CONTAINERS | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 33 control attributes, 14 events, and 16 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 36895 | 47181 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 36896 | 47181 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 36897 | 47192 / BasicCriteriaOrderNum | data-dbcolumn | Y / Y / N | 18 / 0 |
| 36898 | 47192 / BasicCriteriaOrderNum | Lookup | Y / Y / N | 78 / 0 |
| 36899 | 47193 / BasicCriteriaOrderType | data-dbcolumn | Y / Y / N | 20 / 0 |
| 36900 | 47193 / BasicCriteriaOrderType | nullable | Y / Y / Y | 8 / 0 |
| 36901 | 47194 / BasicCriteriaCompany | data-dbcolumn | Y / Y / N | 14 / 0 |
| 36902 | 47195 / BasicCriteriaCustomerPO | data-dbcolumn | Y / Y / N | 22 / 0 |
| 36903 | 47195 / BasicCriteriaCustomerPO | nullable | Y / Y / Y | 8 / 0 |
| 36904 | 47196 / BasicCriteriaCustomerName | data-dbcolumn | Y / Y / N | 26 / 0 |
| 36905 | 47196 / BasicCriteriaCustomerName | Lookup | Y / Y / N | 78 / 0 |
| 36906 | 47197 / BasicCriteriaCustomer | data-dbcolumn | Y / Y / N | 16 / 0 |
| 36907 | 47197 / BasicCriteriaCustomer | Lookup | Y / Y / N | 78 / 0 |
| 36908 | 47198 / BasicCriteriaCustomerPostalCode | data-dbcolumn | Y / Y / N | 40 / 0 |
| 36909 | 47198 / BasicCriteriaCustomerPostalCode | nullable | Y / Y / Y | 8 / 0 |
| 36910 | 47199 / BasicCriteriaShipTo | data-dbcolumn | Y / Y / N | 14 / 0 |
| 36911 | 47199 / BasicCriteriaShipTo | nullable | Y / Y / Y | 8 / 0 |
| 36912 | 47200 / BasicCriteriaWarehouse | defaultValue | Y / Y / Y | 32 / 0 |
| 36913 | 47200 / BasicCriteriaWarehouse | data-dbcolumn | Y / Y / N | 18 / 0 |
| 36914 | 47201 / BasicCriteriaShipToPostalCode | data-dbcolumn | Y / Y / N | 38 / 0 |
| 36915 | 47201 / BasicCriteriaShipToPostalCode | nullable | Y / Y / Y | 8 / 0 |
| 36916 | 47202 / BasicCriteriaOrderDate | data-dbcolumn | Y / Y / N | 20 / 0 |
| 36917 | 47202 / BasicCriteriaOrderDate | data-dateOnly | Y / Y / Y | 8 / 0 |
| 36918 | 47203 / SearchPaneOrderConditionLastChanged | data-dbcolumn | Y / Y / N | 38 / 0 |
| 36919 | 47203 / SearchPaneOrderConditionLastChanged | data-dateOnly | Y / Y / Y | 8 / 0 |
| 36920 | 47206 / ListPaneSummaryDetails | data-aggregateClause | Y / Y / Y | 32 / 0 |
| 36921 | 47207 / ListPaneSummaryContainers | data-aggregateClause | Y / Y / Y | 42 / 0 |
| 36922 | 47208 / ListPaneDataGrid | data-dbtable | Y / Y / N | 76 / 0 |
| 36923 | 47208 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 36 / 0 |
| 36924 | 47208 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 36925 | 47208 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 36926 | 47213 / ShipmentInsightWavedIndicatorTileLines | data-indicatorTileGoToInsight | Y / Y / Y | 200 / 0 |
| 36927 | 47214 / ShipmentInsightWavedIndicatorTileContainers | data-indicatorTileGoToInsight | Y / Y / Y | 284 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16014 / click | 47182 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 16015 / click | 47183 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 16016 / click | 47184 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 16017 / click | 47185 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 16018 / click | 47186 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 16019 / click | 47187 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 16020 / click | 47188 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 16021 / click | 47189 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 16022 / click | 47190 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 16023 / click | 47191 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 16024 / iggridrequesterror | 47208 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 16025 / iggriddatabound | 47208 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 16026 / iggridselectionrowselectionchanged | 47208 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 16027 / iggridselectionactiverowchanged | 47208 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 22732 / 16014 | GETServiceURL | Y / Y | 76 |
| 22733 / 16014 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 22734 / 16014 | queryParameter_Function_UserName | Y / Y | 44 |
| 22735 / 16014 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 22736 / 16014 | POSTServiceURL | Y / Y | 74 |
| 22737 / 16014 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 22738 / 16014 | PostData_Function_UserName | Y / Y | 44 |
| 22739 / 16014 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 22740 / 16014 | PostData_Function_SearchValue | Y / Y | 98 |
| 22741 / 16014 | Post_SuccessCallback | Y / Y | 114 |
| 22742 / 16014 | ModalDialogName | Y / Y | 42 |
| 22743 / 16015 | ModalDialogName | Y / Y | 42 |
| 22744 / 16019 | ModalDialogName | Y / Y | 42 |
| 22745 / 16027 | POSTServiceURL | Y / Y | 72 |
| 22746 / 16027 | PostData_internalOrderNum | Y / Y | 36 |
| 22747 / 16027 | PostData_storedProcedure | Y / Y | 72 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 18 selected candidate rows for this Screen: **18 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 36897 | 47192 / Not applicable | data-dbcolumn | database_identifier | ERP_ORDER | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36899 | 47193 / Not applicable | data-dbcolumn | database_identifier | ORDER_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36901 | 47194 / Not applicable | data-dbcolumn | database_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36902 | 47195 / Not applicable | data-dbcolumn | database_identifier | CUSTOMER_PO | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36904 | 47196 / Not applicable | data-dbcolumn | database_identifier | CUSTOMER_NAME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36906 | 47197 / Not applicable | data-dbcolumn | database_identifier | CUSTOMER | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36908 | 47198 / Not applicable | data-dbcolumn | database_identifier | CUSTOMER_POSTAL_CODE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36910 | 47199 / Not applicable | data-dbcolumn | database_identifier | SHIP_TO | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36913 | 47200 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36914 | 47201 / Not applicable | data-dbcolumn | database_identifier | SHIP_TO_POSTAL_CODE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36916 | 47202 / Not applicable | data-dbcolumn | database_identifier | ORDER_DATE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36918 | 47203 / Not applicable | data-dbcolumn | database_identifier | CONDITION_DATE_TIME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36922 | 47208 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_TPM_ORDER_STATUS_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 22732 | 47182 / 16014 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 22736 | 47182 / 16014 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 22741 | 47182 / 16014 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 22745 | 47208 / 16027 | POSTServiceURL | relative_api_path | /general/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 22747 | 47208 / 16027 | PostData_storedProcedure | stored_procedure_identifier | TpmOrderStatus_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
