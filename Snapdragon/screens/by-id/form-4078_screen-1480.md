# Purchase Order Status Insight — Form 4078, Screen 1480

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4078 |
| MAIN_UI_SCREEN Object ID | 1480 |
| Label / Form resource key | Purchase Order Status Insight / MNU_TPMPURCHASEORDERSTSINSIGHT |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | tpm / 7 |
| Configured path | /tpm/insights/4078 |
| Candidate runtime URL | https://trav.manhscale.com/tpm/insights/4078 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4078 |
| Inspection requirement | separate_portal |
| Form configuration table/view | METADATA_INSIGHT_TPM_PURCHASE_ORDER_HEADER_VIEW |
| Help page reference | TPMpurchaseorderstatusinsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4078 |
| Inspection time (UTC) | 2026-10-02T15:29:50.742Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_TPMPURCHASEORDERSTSINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_TPM_PURCHASE_ORDER_HEADER_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1480 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Purchase Order Status Insight is recorded as `tpm`. Its saved configuration contains 5 parts, 18 groups, 35 controls, and 13 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3375 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 3376 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 3377 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 3378 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 3379 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 3375: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14142 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=14142; default=None |
| 14143 / SaveSearchModalDialogHeader | 14142 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=14142; default=None |
| 14144 / SaveSearchModalDialogBody | 14142 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=14142; default=None |
| 14145 / SaveSearchModalDialogFooter | 14142 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=14142; default=None |

#### Group 14144: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41259 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14145: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41260 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41261 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3376: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14146 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=14146; default=None |
| 14147 / InsightMenuPanel | 14146 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=14146; default=None |
| 14148 / InsightMenuFavoritesDropdown | 14146 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=14146; default=None |
| 14149 / InsightListPaneMenuPanel | 14146 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=14146; default=None |
| 14150 / MenuExportToExcelPanel | 14146 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=14146; default=None |
| 14151 / InsightMenuActionsDropdown | 14146 | Actions / TPMACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=14146; default=None |
| 14152 / InsightMenuPrintActionsDropdown | 14146 | Print / TPMPRINT | 80 / 15550 | Y / Y | Fixed to top=N; loading=0; nested unit=14146; default=None |

#### Group 14147: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41262 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 41263 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 41264 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 41265 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14149: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41266 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 41267 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 41268 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 14150: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41269 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 14151: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41270 / ListPaneMenuActionNew | New / TPMNEW | 150 / 300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TPMNEW |
| 41271 / ListPaneMenuActionEdit | Edit / TPMEDIT | 150 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TPMEDIT |
| 41272 / ListPaneMenuActionDelete | Delete / DELETE | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 41273 / ListPaneMenuActionClose | Close / TPMCLOSEPO | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TPMCLOSEPO |
| 41274 / ListPaneMenuActionTpmReceiptFromPO | Receipt From Purchase Order / TPMRECEIPTFROMPURCHASEORDER | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TPMRECEIPTFROMPURCHASEORDER |

#### Group 14152: InsightMenuPrintActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41275 / ListPaneMenuActionPrintPreviewDocs | Print Preview / TPMPRINTPREVIEW | 150 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TPMPRINTPREVIEW |

### Part 3377: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14153 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=14153; default=None |
| 14154 / SearchPaneBasicCriteria | 14153 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=14153; default=None |
| 14155 / SearchPaneAdvancedCriteria | 14153 | Advanced Criteria / TPMADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=14153; default=None |

#### Group 14154: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41276 / BasicCriteriaPurchaseOrderId | Purchase Order ID / TPMPURCHASEORDERID | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 41277 / BasicCriteriaReceiptId | Receipt ID / TPMRECEIPTID | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 41278 / BasicCriteriaSourceName | Source Name / TPMSOURCENAME02 | 10 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 41279 / BasicCriteriaShipFrom | Ship From / TPMSHIPFROM | 10 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 41280 / BasicCriteriaItem | Item / TPMITEM | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 41281 / SearchPaneComp | Company / TPMCOMPANY | 280 / 6000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41282 / SearchPaneWhs | Warehouse / TPMWAREHOUSE | 280 / 7000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41283 / BasicCriteriaCreatedDateTimeRange | Created Date Time / CREATEDDATETIME | 190 / 8000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14155: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41284 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3378: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14156 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=14156; default=None |
| 14157 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=14157; default=None |

#### Group 14156: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41285 / ListPaneSummaryPOs | Pos / TPMPOS | 50 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41286 / ListPaneSummaryLines | Lines / TPMLINES | 50 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41287 / ListPaneSummaryOpen | Open / TPMOPEN | 50 / 7500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41288 / ListPaneSummaryClosed | Closed / TPMCLOSED | 50 / 10000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14157: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41289 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 41289 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14005 / Not populated | POHEADEROBJECTID / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13993 / PurchaseOrderId | Not populated / Purchase Order ID / TPMPURCHASEORDERID | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13994 / Company | Not populated / Company / TPMCOMPANY | 10 / 10 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13995 / SourceName | Not populated / Source Name / TPMSOURCENAME02 | 10 / 10 / 2500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13996 / ShipFrom | Not populated / Ship From / TPMSHIPFROM | 10 / 10 / 3000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13997 / Status | Not populated / Status / TPMSTATUS | 10 / 10 / 3500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13998 / CreatedDateTime | Not populated / Created Date Time / TPMCREATEDDATETIME | 30 / 10 / 4000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13999 / COLOR | Not populated / Color / COLOR | 10 / 10 / 4500 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14000 / Warehouse | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 11000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14001 / ObjectId | Not populated / Object ID / OBJECTID | 10 / 10 / 12000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14002 / Lines | Not populated / Lines / LINES | 20 / 10 / 13000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14003 / TotalOpenQty | Not populated / Total Open Quantity / TOTALOPENQTY | 20 / 10 / 13500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 14004 / ICON | Not populated / Icon / ICON | 10 / 10 / 14000 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 3379: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14158 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=14158; default=None |
| 14159 / indicatorpane | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=14159; default=None |

#### Group 14158: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41290 / DetailPaneHeaderPurchaseOrderId | Not populated / Not populated | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=444; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41291 / DetailPaneHeaderStatus | Not populated / Not populated | 30 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=444; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14159: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41292 / PurchaseOrderInsightIndicatorTileReceipts | Receipts / TPMRECEIPTS | 360 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41293 / PurchaseOrderInsightIndicatorTileLines | Lines / TPMLINES | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 33 control attributes, 20 events, and 34 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 31475 | 41259 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 31476 | 41259 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 31478 | 41270 / ListPaneMenuActionNew | data-formId | Y / Y / N | 8 / 0 |
| 31479 | 41270 / ListPaneMenuActionNew | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 31480 | 41271 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 31481 | 41271 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 31482 | 41272 / ListPaneMenuActionDelete | data-formId | Y / Y / N | 8 / 0 |
| 31483 | 41272 / ListPaneMenuActionDelete | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 31484 | 41272 / ListPaneMenuActionDelete | data-divider | Y / Y / N | 8 / 0 |
| 31485 | 41273 / ListPaneMenuActionClose | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 31486 | 41274 / ListPaneMenuActionTpmReceiptFromPO | data-formId | Y / Y / N | 8 / 0 |
| 31487 | 41274 / ListPaneMenuActionTpmReceiptFromPO | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 31488 | 41275 / ListPaneMenuActionPrintPreviewDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 31489 | 41276 / BasicCriteriaPurchaseOrderId | data-dbcolumn | Y / Y / N | 46 / 0 |
| 31490 | 41276 / BasicCriteriaPurchaseOrderId | Lookup | Y / Y / N | 104 / 1 |
| 31491 | 41277 / BasicCriteriaReceiptId | data-dbcolumn | Y / Y / N | 20 / 0 |
| 31492 | 41277 / BasicCriteriaReceiptId | Lookup | Y / Y / N | 86 / 1 |
| 31493 | 41278 / BasicCriteriaSourceName | data-dbcolumn | Y / Y / N | 22 / 0 |
| 31494 | 41278 / BasicCriteriaSourceName | Lookup | Y / Y / N | 92 / 0 |
| 31495 | 41279 / BasicCriteriaShipFrom | data-dbcolumn | Y / Y / N | 18 / 0 |
| 31496 | 41279 / BasicCriteriaShipFrom | Lookup | Y / Y / N | 80 / 0 |
| 31497 | 41280 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 31498 | 41280 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 31499 | 41281 / SearchPaneComp | data-dbcolumn | Y / Y / N | 30 / 0 |
| 31500 | 41282 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 31501 | 41283 / BasicCriteriaCreatedDateTimeRange | data-dbcolumn | Y / Y / N | 34 / 0 |
| 31502 | 41286 / ListPaneSummaryLines | data-aggregateClause | Y / Y / Y | 20 / 0 |
| 31503 | 41287 / ListPaneSummaryOpen | data-aggregateClause | Y / Y / Y | 256 / 0 |
| 31504 | 41288 / ListPaneSummaryClosed | data-aggregateClause | Y / Y / Y | 264 / 0 |
| 31505 | 41289 / ListPaneDataGrid | data-dbtable | Y / Y / N | 94 / 0 |
| 31506 | 41289 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 18 / 0 |
| 31507 | 41292 / PurchaseOrderInsightIndicatorTileReceipts | data-indicatorTileGoToInsight | Y / Y / Y | 236 / 0 |
| 31508 | 41293 / PurchaseOrderInsightIndicatorTileLines | data-indicatorTileGoToInsight | Y / Y / Y | 206 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 13644 / click | 41260 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 13645 / click | 41261 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 13646 / click | 41262 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 13647 / click | 41263 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 13648 / click | 41264 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 13649 / click | 41265 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 13650 / click | 41266 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 13651 / click | 41267 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 13652 / click | 41268 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 13653 / click | 41269 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 13654 / click | 41270 / ListPaneMenuActionNew | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 13655 / click | 41271 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 13656 / click | 41272 / ListPaneMenuActionDelete | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 13657 / click | 41273 / ListPaneMenuActionClose | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 13658 / click | 41274 / ListPaneMenuActionTpmReceiptFromPO | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 13659 / click | 41275 / ListPaneMenuActionPrintPreviewDocs | _webUi.tpmPurchaseOrderStsInsight.printPreviewActionClicked | Not populated | Y / Y |
| 13660 / iggridrequesterror | 41289 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 13661 / iggriddatabound | 41289 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 13662 / iggridselectionrowselectionchanged | 41289 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 13663 / iggridselectionactiverowchanged | 41289 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 18765 / 13644 | GETServiceURL | Y / Y | 76 |
| 18766 / 13644 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 18767 / 13644 | queryParameter_Function_UserName | Y / Y | 44 |
| 18768 / 13644 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 18769 / 13644 | POSTServiceURL | Y / Y | 74 |
| 18770 / 13644 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 18771 / 13644 | PostData_Function_UserName | Y / Y | 44 |
| 18772 / 13644 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 18773 / 13644 | PostData_Function_SearchValue | Y / Y | 98 |
| 18774 / 13644 | Post_SuccessCallback | Y / Y | 114 |
| 18775 / 13644 | ModalDialogName | Y / Y | 42 |
| 18776 / 13645 | ModalDialogName | Y / Y | 42 |
| 18777 / 13649 | ModalDialogName | Y / Y | 42 |
| 18778 / 13654 | URL | Y / Y | 76 |
| 18779 / 13655 | URL | Y / Y | 148 |
| 18780 / 13656 | ConfirmationMessageCode | Y / Y | 30 |
| 18781 / 13656 | POSTServiceURL | Y / Y | 116 |
| 18782 / 13656 | PostData_Grid_ListPaneDataGrid_objectId | Y / Y | 16 |
| 18783 / 13656 | PostData_Grid_ListPaneDataGrid_purchaseOrderId | Y / Y | 30 |
| 18784 / 13656 | Post_SuccessCallback | Y / Y | 140 |
| 18785 / 13657 | ConfirmationMessageCode | Y / Y | 54 |
| 18786 / 13657 | POSTServiceURL | Y / Y | 114 |
| 18787 / 13657 | PostData_Grid_ListPaneDataGrid_objectId | Y / Y | 16 |
| 18788 / 13657 | PostData_Grid_ListPaneDataGrid_purchaseOrderId | Y / Y | 30 |
| 18789 / 13657 | Post_SuccessCallback | Y / Y | 140 |
| 18790 / 13658 | URL | Y / Y | 128 |
| 18791 / 13663 | POSTServiceURL | Y / Y | 74 |
| 18792 / 13663 | PostData_ObjectId | Y / Y | 16 |
| 18793 / 13663 | PostData_storedProcedure | Y / Y | 56 |
| 18794 / 13663 | EnableAction_ListPaneMenuActionEdit | Y / Y | 34 |
| 18795 / 13663 | EnableAction_ListPaneMenuActionDelete | Y / Y | 34 |
| 18796 / 13663 | EnableAction_ListPaneMenuActionClose | Y / Y | 90 |
| 18797 / 13663 | EnableAction_ListPaneMenuActionTpmReceiptFromPO | Y / Y | 142 |
| 18798 / 13663 | EnableAction_ListPaneMenuActionPrintPreviewDocs | Y / Y | 34 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 34 selected candidate rows for this Screen: **34 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 31478 | 41270 / Not applicable | data-formId | form_id | 4075 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31479 | 41270 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31480 | 41271 / Not applicable | data-formId | form_id | 4075 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31481 | 41271 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31482 | 41272 / Not applicable | data-formId | form_id | 4075 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31483 | 41272 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31485 | 41273 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31486 | 41274 / Not applicable | data-formId | form_id | 4085 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31487 | 41274 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31488 | 41275 / Not applicable | data-securityCheckpoint | checkpoint | 34 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31489 | 41276 / Not applicable | data-dbcolumn | database_identifier | POHEADERPURCHASEORDERID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31491 | 41277 / Not applicable | data-dbcolumn | database_identifier | RECEIPT_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31493 | 41278 / Not applicable | data-dbcolumn | database_identifier | SOURCE_NAME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31495 | 41279 / Not applicable | data-dbcolumn | database_identifier | SHIP_FROM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31497 | 41280 / Not applicable | data-dbcolumn | database_identifier | Item | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31499 | 41281 / Not applicable | data-dbcolumn | database_identifier | POHEADERCOMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31500 | 41282 / Not applicable | data-dbcolumn | database_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31501 | 41283 / Not applicable | data-dbcolumn | database_identifier | CREATED_DATE_TIME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31505 | 41289 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_TPM_PURCHASE_ORDER_HEADER_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18765 | 41260 / 13644 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18769 | 41260 / 13644 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18774 | 41260 / 13644 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18780 | 41272 / 13656 | ConfirmationMessageCode | resource_code | MSG_TPMDELETE01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18781 | 41272 / 13656 | POSTServiceURL | relative_api_path | /inbound/scaleapi/PurchaseOrderApi/PurchaseOrders-Deleted? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18782 | 41272 / 13656 | PostData_Grid_ListPaneDataGrid_objectId | grid_field_identifier | ObjectId | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18783 | 41272 / 13656 | PostData_Grid_ListPaneDataGrid_purchaseOrderId | grid_field_identifier | PurchaseOrderId | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18784 | 41272 / 13656 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18785 | 41273 / 13657 | ConfirmationMessageCode | resource_code | MSG_TPMPURCHASEORDERCLOSE01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18786 | 41273 / 13657 | POSTServiceURL | relative_api_path | /inbound/scaleapi/PurchaseOrderApi/PurchaseOrders-Closed? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18787 | 41273 / 13657 | PostData_Grid_ListPaneDataGrid_objectId | grid_field_identifier | ObjectId | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18788 | 41273 / 13657 | PostData_Grid_ListPaneDataGrid_purchaseOrderId | grid_field_identifier | PurchaseOrderId | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18789 | 41273 / 13657 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18791 | 41289 / 13663 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 18793 | 41289 / 13663 | PostData_storedProcedure | stored_procedure_identifier | POH_TpmInsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
