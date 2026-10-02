# Order Container Status Insight — Form 4067, Screen 1657

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4067 |
| MAIN_UI_SCREEN Object ID | 1657 |
| Label / Form resource key | Order Container Status Insight / MNU_TPMORDERCONTAINERSTSINSIGHT |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | tpm / 7 |
| Configured path | /tpm/insights/4067 |
| Candidate runtime URL | https://trav.manhscale.com/tpm/insights/4067 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4067 |
| Inspection requirement | separate_portal |
| Form configuration table/view | METADATA_INSIGHT_TPM_ORDER_CONTAINER_STATUS_VIEW |
| Help page reference | TPMOrderContStatInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4067 |
| Inspection time (UTC) | 2026-10-02T15:28:44.830Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_TPMORDERCONTAINERSTSINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_TPM_ORDER_CONTAINER_STATUS_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1657 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Order Container Status Insight is recorded as `tpm`. Its saved configuration contains 5 parts, 17 groups, 31 controls, and 19 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3857 / SaveSearchModalDialog | Not populated / Not populated | 20 / 250 | Y / Y / Y | SaveSearchSaveButton |
| 3858 / InsightMenuPane | Not populated / Not populated | 10 / 500 | Y / Y / N | Not populated |
| 3859 / SearchPane | Not populated / Not populated | 10 / 750 | Y / Y / N | InsightMenuApply |
| 3860 / ListPane | Not populated / Not populated | 10 / 1000 | Y / Y / N | Not populated |
| 3861 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 3857: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16125 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=16125; default=None |
| 16126 / SaveSearchModalDialogHeader | 16125 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=16125; default=None |
| 16127 / SaveSearchModalDialogBody | 16125 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=16125; default=None |
| 16128 / SaveSearchModalDialogFooter | 16125 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=16125; default=None |

#### Group 16127: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47150 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16128: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47151 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47152 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3858: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16129 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=16129; default=None |
| 16130 / InsightMenuPanel | 16129 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=16129; default=None |
| 16131 / InsightMenuFavoritesDropdown | 16129 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=16129; default=None |
| 16132 / InsightListPaneMenuPanel | 16129 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=16129; default=None |
| 16133 / MenuExportToExcelPanel | 16129 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=16129; default=None |

#### Group 16130: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47153 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 47154 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 47155 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 47156 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16132: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47157 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 47158 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 47159 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 16133: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47160 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

### Part 3859: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16134 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=16134; default=None |
| 16135 / SearchPaneBasicCriteria | 16134 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=16134; default=None |
| 16136 / SearchPaneAdvancedCriteria | 16134 | Advanced Criteria / TPMADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=16134; default=None |

#### Group 16135: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47161 / BasicCriteriaContainerId | Not populated / containerId | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 47162 / BasicCriteriaOrderNum | Order Number / TPMORDERNUMBER | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 47163 / BasicCriteriaItem | Item / TPMITEM | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 47164 / BasicCriteriaCompany | Company / TPMCOMPANY | 280 / 700 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47165 / BasicCriteriaStatus | Status / TPMSTATUS | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47166 / BasicCriteriaWarehouse | Warehouse / TPMWAREHOUSE | 280 / 1750 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47167 / BasicCriteriaInternalOrderNum | Internal Order Number / INTERNALORDERNUM | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47168 / BasicCriteriaOrderDate | Order Date / TPMORDERDATE | 190 / 2250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47169 / ShowTopLevelContainers | Show Only Top Level / TPMSHOWONLYTOPLEVEL | 130 / 2300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16136: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47170 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3860: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16137 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=16137; default=None |
| 16138 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=16138; default=None |

#### Group 16137: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47171 / ListPaneSummaryOrders | Orders / ORDERS | 50 / 100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47172 / ListPaneSummaryQuantity | Quantity / QUANTITY | 50 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47173 / ListPaneSummaryContainers | Containers / CONTAINERS | 50 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16138: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47174 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 47174 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16544 / Not populated | INTERNAL_CONTAINER_NUM / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16545 / Not populated | INTERNAL_ORDER_NUM / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16546 / Not populated | QUANTITY / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 16528 / CONTAINER_ID | Not populated / Container ID / TPMCONTAINERID | 10 / 10 / 100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16530 / ERP_ORDER | Not populated / Order Number / TPMORDERNUMBER | 10 / 10 / 200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16531 / ITEM | Not populated / Item / TPMITEM | 10 / 10 / 250 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16532 / ITEM_DESC | Not populated / Description / DESCRIPTION | 10 / 10 / 300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16533 / COMPANY | Not populated / Company / TPMCOMPANY | 10 / 10 / 400 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16538 / QUANTITY | QUANTITY / Qty / QTY | 20 / 10 / 550 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 16534 / TRACKING_NUMBER | Not populated / Tracking Number / TRACKINGNUMBER | 10 / 10 / 600 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16537 / WEIGHT | Not populated / Weight / WEIGHT | 20 / 10 / 750 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=60; DATA_SOURCE_TYPE=None |
| 16535 / SHIPPING_CONTAINER_STATUS | Not populated / Status / TPMSTATUS | 10 / 10 / 800 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16536 / PARENT_CONTAINER_ID | Not populated / Parent Container ID / TPMPARENTCONTAINERID | 10 / 10 / 900 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16539 / PARENT | Not populated / Parent / PARENT | 10 / 10 / 900 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16543 / INTERNET_TRACKING_LINK | Not populated / Not populated / Not populated | 10 / 10 / 1000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16542 / INTERNAL_CONTAINER_NUM | INTERNAL_CONTAINER_NUM / Internal Container Number / INTERNALCONTAINERNUM | 10 / 10 / 1500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16541 / COLOR | Not populated / Color / COLOR | 10 / 10 / 2000 / 1 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16540 / ICON | Not populated / Icon / ICON | 10 / 10 / 2500 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16529 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 2510 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 3861: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16139 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=16139; default=None |
| 16140 / DetailPaneHeaderPanelTrailLeadSts | Not populated | Not populated / Not populated | 60 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=16140; default=None |
| 16141 / indicatorpane | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=16141; default=None |

#### Group 16139: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47175 / DetailPaneHeaderContainerID | Not populated / Not populated | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=519; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47176 / DetailPaneHeaderStatus | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=519; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47177 / DetailPaneHeaderItem | Not populated / Not populated | 30 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=519; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47178 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 2250 | N / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=519; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16141: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47179 / ShipContInsightIndicatorTileChildContainers | Containers / CONTAINERS | 360 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47180 / ShipContInsightIndicatorTileContents | Container Contents / CONTAINERCONTENTS | 360 / 350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 30 control attributes, 14 events, and 17 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 36865 | 47150 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 36866 | 47150 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 36867 | 47156 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 36868 | 47161 / BasicCriteriaContainerId | data-dbcolumn | Y / Y / N | 118 / 0 |
| 36869 | 47161 / BasicCriteriaContainerId | Lookup | Y / Y / N | 90 / 1 |
| 36870 | 47162 / BasicCriteriaOrderNum | data-dbcolumn | Y / Y / N | 18 / 0 |
| 36871 | 47162 / BasicCriteriaOrderNum | Lookup | Y / Y / N | 78 / 0 |
| 36872 | 47163 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 36873 | 47163 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 36874 | 47164 / BasicCriteriaCompany | data-dbcolumn | Y / Y / N | 14 / 0 |
| 36875 | 47165 / BasicCriteriaStatus | data-dbcolumn | Y / Y / N | 50 / 0 |
| 36876 | 47165 / BasicCriteriaStatus | data-dataType | Y / Y / N | 2 / 0 |
| 36877 | 47166 / BasicCriteriaWarehouse | defaultValue | Y / Y / Y | 32 / 0 |
| 36878 | 47166 / BasicCriteriaWarehouse | data-dbcolumn | Y / Y / N | 18 / 0 |
| 36879 | 47167 / BasicCriteriaInternalOrderNum | data-dbcolumn | Y / Y / N | 36 / 0 |
| 36880 | 47167 / BasicCriteriaInternalOrderNum | nullable | Y / Y / Y | 8 / 0 |
| 36881 | 47168 / BasicCriteriaOrderDate | data-dbcolumn | Y / Y / N | 20 / 0 |
| 36882 | 47168 / BasicCriteriaOrderDate | data-dateOnly | Y / Y / Y | 8 / 0 |
| 36883 | 47169 / ShowTopLevelContainers | data-dbcolumn | Y / Y / N | 12 / 0 |
| 36884 | 47169 / ShowTopLevelContainers | data-positiveCondition | Y / Y / N | 6 / 0 |
| 36885 | 47169 / ShowTopLevelContainers | data-negativeCondition | Y / Y / N | 0 / 0 |
| 36886 | 47171 / ListPaneSummaryOrders | data-aggregateClause | Y / Y / Y | 70 / 0 |
| 36887 | 47172 / ListPaneSummaryQuantity | data-aggregateClause | Y / Y / Y | 26 / 0 |
| 36888 | 47173 / ListPaneSummaryContainers | data-aggregateClause | Y / Y / Y | 58 / 0 |
| 36889 | 47174 / ListPaneDataGrid | data-dbtable | Y / Y / N | 96 / 0 |
| 36890 | 47174 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 44 / 0 |
| 36891 | 47174 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 10 / 0 |
| 36892 | 47174 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 36893 | 47179 / ShipContInsightIndicatorTileChildContainers | data-indicatorTileGoToInsight | Y / Y / Y | 452 / 0 |
| 36894 | 47180 / ShipContInsightIndicatorTileContents | data-indicatorTileGoToInsight | Y / Y / Y | 454 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16000 / click | 47151 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 16001 / click | 47152 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 16002 / click | 47153 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 16003 / click | 47154 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 16004 / click | 47155 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 16005 / click | 47156 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 16006 / click | 47157 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 16007 / click | 47158 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 16008 / click | 47159 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 16009 / click | 47160 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 16010 / iggridrequesterror | 47174 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 16011 / iggriddatabound | 47174 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 16012 / iggridselectionrowselectionchanged | 47174 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 16013 / iggridselectionactiverowchanged | 47174 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 22715 / 16000 | GETServiceURL | Y / Y | 76 |
| 22716 / 16000 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 22717 / 16000 | queryParameter_Function_UserName | Y / Y | 44 |
| 22718 / 16000 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 22719 / 16000 | POSTServiceURL | Y / Y | 74 |
| 22720 / 16000 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 22721 / 16000 | PostData_Function_UserName | Y / Y | 44 |
| 22722 / 16000 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 22723 / 16000 | PostData_Function_SearchValue | Y / Y | 98 |
| 22724 / 16000 | Post_SuccessCallback | Y / Y | 114 |
| 22725 / 16000 | ModalDialogName | Y / Y | 42 |
| 22726 / 16001 | ModalDialogName | Y / Y | 42 |
| 22727 / 16005 | ModalDialogName | Y / Y | 42 |
| 22728 / 16013 | PostRowChanged | Y / Y | 98 |
| 22729 / 16013 | POSTServiceURL | Y / Y | 74 |
| 22730 / 16013 | PostData_internalContainerNum | Y / Y | 44 |
| 22731 / 16013 | PostData_storedProcedure | Y / Y | 90 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 16 selected candidate rows for this Screen: **15 accepted tokens** and **1 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 36867 | 47156 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36870 | 47162 / Not applicable | data-dbcolumn | database_identifier | ERP_ORDER | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36872 | 47163 / Not applicable | data-dbcolumn | database_identifier | Item | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36874 | 47164 / Not applicable | data-dbcolumn | database_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36875 | 47165 / Not applicable | data-dbcolumn | database_identifier | SHIPPING_CONTAINER_STATUS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36878 | 47166 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36879 | 47167 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_ORDER_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36881 | 47168 / Not applicable | data-dbcolumn | database_identifier | ORDER_DATE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36883 | 47169 / Not applicable | data-dbcolumn | database_identifier | PARENT | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36889 | 47174 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_TPM_ORDER_CONTAINER_STATUS_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 22715 | 47151 / 16000 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 22719 | 47151 / 16000 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 22724 | 47151 / 16000 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 22729 | 47174 / 16013 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 22731 | 47174 / 16013 | PostData_storedProcedure | stored_procedure_identifier | TpmOrderContainerStatus_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
