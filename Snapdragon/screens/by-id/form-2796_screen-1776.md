# Purchase Order Insight — Form 2796, Screen 1776

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2796 |
| MAIN_UI_SCREEN Object ID | 1776 |
| Label / Form resource key | Purchase Order Insight / MNU_PURCHASEORDERINSIGHT |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2796 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2796 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2796 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_PURCHASE_ORDER_HEADER_VIEW |
| Help page reference | purchaseOrderInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2796 |
| Inspection time (UTC) | 2026-10-02T15:24:38.885Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_PURCHASEORDERINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_PURCHASE_ORDER_HEADER_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1776 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:11:33.966Z | loaded; runtime_inspection | https://trav.manhscale.com/scale/insights/2796; Purchase Order Insight | [runtime-root.json](../../evidence/runtime-root.json) |

**Visible criteria / entry fields:** Purchase Order; Receipt ID; Source Name; Ship From; Item; Company; Warehouse; From Created Date Time; To Created Date Time.

**Visible grid headers:** Field; Operand; Value; Purchase Order; Company; Status; Ship From; Source Name; Color.

**Observed action/menu labels:** Σ; Actions; New; Copy; Edit; Delete; New Line; Close; Cancel Close; Print Preview; Print Default Docs; Print Selected Docs; Receipt From PO.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Purchase Order Insight is recorded as `insight`. Its saved configuration contains 6 parts, 21 groups, 47 controls, and 18 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4373 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4374 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4375 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4376 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4377 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4378 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4373: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18037 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18037; default=None |
| 18038 / SaveSearchModalDialogHeader | 18037 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18037; default=None |
| 18039 / SaveSearchModalDialogBody | 18037 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18037; default=None |
| 18040 / SaveSearchModalDialogFooter | 18037 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18037; default=None |

#### Group 18039: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51600 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18040: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51601 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51602 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4374: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18041 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18041; default=None |
| 18042 / GadgetCalculationQueryDialogHeader | 18041 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18041; default=None |
| 18043 / GadgetCalculationQueryDialogBody | 18041 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18041; default=None |
| 18044 / GadgetCalculationQueryDialogFooter | 18041 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18041; default=None |

#### Group 18043: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51603 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18044: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51604 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51605 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4375: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18045 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18045; default=None |
| 18046 / InsightMenuPanel | 18045 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18045; default=None |
| 18047 / InsightMenuFavoritesDropdown | 18045 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18045; default=None |
| 18048 / InsightListPaneMenuPanel | 18045 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18045; default=None |
| 18049 / MenuExportToExcelPanel | 18045 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18045; default=None |
| 18050 / InsightMenuActionsDropdown | 18045 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18045; default=None |

#### Group 18046: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51606 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51607 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51608 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51609 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18048: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51610 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51611 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 51612 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51613 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18049: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51614 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18050: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51615 / ListPaneMenuActionNew | New / NEW | 150 / 100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEW |
| 51616 / ListPaneMenuActionCopy | Copy / COPY | 150 / 200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=COPY |
| 51617 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 51618 / ListPaneMenuActionView | View / VIEW | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 51619 / ListPaneMenuActionDelete | Delete / DELETE | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 51620 / ListPaneMenuActionNewLine | New Line / NEWLINE | 150 / 950 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CONFIRM |
| 51621 / ListPaneMenuActionClose | Close / CLOSE | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CLOSE |
| 51622 / ListPaneMenuActionCancelClose | Cancel Close / CANCELCLOSE | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CLOSE |
| 51623 / ListPaneMenuActionPrintPreviewDocs | Print Preview / PRINTPREVIEW | 150 / 1900 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTPREVIEW |
| 51624 / ListPaneMenuActionPrintDefaultDocs | Print Default Docs / PRINTDEFAULTDOCS | 150 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTDEFAULTDOCS |
| 51625 / ListPaneMenuActionPrintSelectedDocs | Print Selected Docs / PRINTSELECTEDDOCS | 150 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTSELECTEDDOCS |
| 51626 / ListPaneMenuActionReceiptFromPO | Receipt From PO / RECEIPTFROMPO | 150 / 3500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=RECEIPTFROMPO |

### Part 4376: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18051 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18051; default=None |
| 18052 / SearchPaneBasicCriteria | 18051 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18051; default=None |
| 18053 / SearchPaneAdvancedCriteria | 18051 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=18051; default=None |

#### Group 18052: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51627 / BasicCriteriaPurchaseOrderId | Purchase Order / PURCHASEORDER | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51628 / BasicCriteriaReceiptId | Receipt ID / RECEIPTID | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51629 / BasicCriteriaSourceName | Source Name / SOURCENAME | 10 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51630 / BasicCriteriaShipFrom | Ship From / SHIPFROM | 10 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51631 / BasicCriteriaItem | Item / ITEM | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51632 / SearchPaneComp | Company / COMPANY | 280 / 6000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51633 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 7000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51634 / BasicCriteriaCreatedDateTimeRange | Created Date Time / CREATEDDATETIME | 190 / 8000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51635 / BasicCriteriaIncludeClosedPurchaseOrders | Include Closed Purchase Orders / INCLUDECLOSEDPURCHASEORDERS | 130 / 9000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18053: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51636 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4377: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18054 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18054; default=None |
| 18055 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18055; default=None |

#### Group 18054: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51637 / ListPaneSummaryPOs | Pos / POS | 50 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51638 / ListPaneSummaryLines | Lines / LINES | 50 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51639 / ListPaneSummaryOpen | Open / OPEN | 50 / 7500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51640 / ListPaneSummaryClosed | Closed / CLOSED | 50 / 10000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18055: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51641 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51641 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18475 / Not populated | POHEADEROBJECTID / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18458 / PurchaseOrderId | Not populated / Purchase Order / PURCHASEORDER | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18460 / Company | Not populated / Company / COMPANY | 10 / 10 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18461 / Status | Not populated / Status / STATUS | 10 / 10 / 3000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18462 / ShipFrom | Not populated / Ship From / SHIPFROM | 10 / 10 / 4000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18463 / SourceName | Not populated / Source Name / SOURCENAME | 10 / 10 / 5000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18464 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6000 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18465 / SourceAddress | Not populated / Source Address / SOURCEADDRESS | 10 / 10 / 7000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18466 / SourceCity | Not populated / Source City / SOURCECITY | 10 / 10 / 8000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18467 / SourceState | Not populated / Source State / SOURCESTATE | 10 / 10 / 9000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18468 / SourcePostalCode | Not populated / Source Postal Code / SOURCEPOSTALCODE | 10 / 10 / 10000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18469 / Warehouse | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 11000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18470 / ObjectId | Not populated / Object ID / OBJECTID | 10 / 10 / 12000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18471 / ClosedDateTime | Not populated / Closed Date Time / CLOSEDDATETIME | 30 / 10 / 12500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18472 / Lines | Not populated / Lines / LINES | 20 / 10 / 13000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18473 / TotalOpenQty | Not populated / Total Open Quantity / TOTALOPENQTY | 20 / 10 / 13500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18474 / ICON | Not populated / Icon / ICON | 10 / 10 / 14000 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18459 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 14010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4378: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18056 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18056; default=None |
| 18057 / indicatorpane | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18057; default=None |

#### Group 18056: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51642 / DetailPaneHeaderPurchaseOrderId | Not populated / Not populated | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=594; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51643 / DetailPaneHeaderShipFrom | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=594; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51644 / DetailPaneHeaderStatus | Not populated / Not populated | 30 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=594; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18057: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51645 / PurchaseOrderInsightIndicatorTileReceipts | Receipts / RECEIPTS | 360 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51646 / PurchaseOrderInsightIndicatorTileLines | Lines / LINES | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 49 control attributes, 29 events, and 63 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40723 | 51600 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40724 | 51600 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40725 | 51609 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40726 | 51610 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40727 | 51615 / ListPaneMenuActionNew | data-formId | Y / Y / N | 8 / 0 |
| 40728 | 51615 / ListPaneMenuActionNew | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40729 | 51616 / ListPaneMenuActionCopy | data-formId | Y / Y / N | 8 / 0 |
| 40730 | 51616 / ListPaneMenuActionCopy | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40731 | 51617 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 40732 | 51617 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40733 | 51618 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 40734 | 51619 / ListPaneMenuActionDelete | data-formId | Y / Y / N | 8 / 0 |
| 40735 | 51619 / ListPaneMenuActionDelete | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40736 | 51619 / ListPaneMenuActionDelete | data-divider | Y / Y / N | 8 / 0 |
| 40737 | 51620 / ListPaneMenuActionNewLine | data-formId | Y / Y / N | 8 / 0 |
| 40738 | 51620 / ListPaneMenuActionNewLine | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40739 | 51620 / ListPaneMenuActionNewLine | data-divider | Y / Y / N | 8 / 0 |
| 40740 | 51621 / ListPaneMenuActionClose | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40741 | 51622 / ListPaneMenuActionCancelClose | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40742 | 51623 / ListPaneMenuActionPrintPreviewDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40743 | 51624 / ListPaneMenuActionPrintDefaultDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40744 | 51625 / ListPaneMenuActionPrintSelectedDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40745 | 51626 / ListPaneMenuActionReceiptFromPO | data-formId | Y / Y / N | 8 / 0 |
| 40746 | 51626 / ListPaneMenuActionReceiptFromPO | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40747 | 51627 / BasicCriteriaPurchaseOrderId | data-dbcolumn | Y / Y / N | 46 / 0 |
| 40748 | 51627 / BasicCriteriaPurchaseOrderId | Lookup | Y / Y / N | 104 / 1 |
| 40749 | 51628 / BasicCriteriaReceiptId | data-dbcolumn | Y / Y / N | 20 / 0 |
| 40750 | 51628 / BasicCriteriaReceiptId | Lookup | Y / Y / N | 86 / 1 |
| 40751 | 51629 / BasicCriteriaSourceName | data-dbcolumn | Y / Y / N | 22 / 0 |
| 40752 | 51629 / BasicCriteriaSourceName | Lookup | Y / Y / N | 92 / 0 |
| 40753 | 51630 / BasicCriteriaShipFrom | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40754 | 51630 / BasicCriteriaShipFrom | Lookup | Y / Y / N | 80 / 0 |
| 40755 | 51631 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 40756 | 51631 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 40757 | 51632 / SearchPaneComp | data-dbcolumn | Y / Y / N | 14 / 0 |
| 40758 | 51633 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 40759 | 51633 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40760 | 51634 / BasicCriteriaCreatedDateTimeRange | data-dbcolumn | Y / Y / N | 34 / 0 |
| 40761 | 51635 / BasicCriteriaIncludeClosedPurchaseOrders | data-dbcolumn | Y / Y / N | 28 / 0 |
| 40762 | 51635 / BasicCriteriaIncludeClosedPurchaseOrders | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40763 | 51635 / BasicCriteriaIncludeClosedPurchaseOrders | data-negativeCondition | Y / Y / N | 22 / 0 |
| 40764 | 51638 / ListPaneSummaryLines | data-aggregateClause | Y / Y / Y | 20 / 0 |
| 40765 | 51639 / ListPaneSummaryOpen | data-aggregateClause | Y / Y / Y | 256 / 0 |
| 40766 | 51640 / ListPaneSummaryClosed | data-aggregateClause | Y / Y / Y | 264 / 0 |
| 40767 | 51641 / ListPaneDataGrid | data-dbtable | Y / Y / N | 86 / 0 |
| 40768 | 51641 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 18 / 0 |
| 40769 | 51642 / DetailPaneHeaderPurchaseOrderId | href | Y / Y / Y | 58 / 0 |
| 40770 | 51645 / PurchaseOrderInsightIndicatorTileReceipts | data-indicatorTileGoToInsight | Y / Y / Y | 442 / 0 |
| 40771 | 51646 / PurchaseOrderInsightIndicatorTileLines | data-indicatorTileGoToInsight | Y / Y / Y | 458 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18021 / click | 51601 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18022 / click | 51602 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18023 / click | 51604 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18024 / click | 51605 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18025 / click | 51606 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18026 / click | 51607 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18027 / click | 51608 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18028 / click | 51609 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18029 / click | 51610 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18030 / click | 51611 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 18031 / click | 51612 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18032 / click | 51613 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18033 / click | 51614 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18034 / click | 51615 / ListPaneMenuActionNew | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18035 / click | 51616 / ListPaneMenuActionCopy | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18036 / click | 51617 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18037 / click | 51618 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18038 / click | 51619 / ListPaneMenuActionDelete | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 18039 / click | 51620 / ListPaneMenuActionNewLine | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18040 / click | 51621 / ListPaneMenuActionClose | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 18041 / click | 51622 / ListPaneMenuActionCancelClose | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 18042 / click | 51623 / ListPaneMenuActionPrintPreviewDocs | _webUi.dialog.printPreviewSelection | Not populated | Y / Y |
| 18043 / click | 51624 / ListPaneMenuActionPrintDefaultDocs | _webUi.insightListPaneActions.menuActionPerformGet | Not populated | Y / Y |
| 18044 / click | 51625 / ListPaneMenuActionPrintSelectedDocs | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 18045 / click | 51626 / ListPaneMenuActionReceiptFromPO | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18046 / iggridrequesterror | 51641 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18047 / iggriddatabound | 51641 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18048 / iggridselectionrowselectionchanged | 51641 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18049 / iggridselectionactiverowchanged | 51641 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 26486 / 18021 | GETServiceURL | Y / Y | 76 |
| 26487 / 18021 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 26488 / 18021 | queryParameter_Function_UserName | Y / Y | 44 |
| 26489 / 18021 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26490 / 18021 | POSTServiceURL | Y / Y | 74 |
| 26491 / 18021 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 26492 / 18021 | PostData_Function_UserName | Y / Y | 44 |
| 26493 / 18021 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26494 / 18021 | PostData_Function_SearchValue | Y / Y | 98 |
| 26495 / 18021 | Post_SuccessCallback | Y / Y | 114 |
| 26496 / 18021 | ModalDialogName | Y / Y | 42 |
| 26497 / 18022 | ModalDialogName | Y / Y | 42 |
| 26498 / 18023 | POSTServiceURL | Y / Y | 144 |
| 26499 / 18023 | Form_Id | Y / Y | 8 |
| 26500 / 18023 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26501 / 18023 | PostData_Function_SearchValue | Y / Y | 98 |
| 26502 / 18023 | Post_SuccessCallback | Y / Y | 114 |
| 26503 / 18023 | ModalDialogName | Y / Y | 56 |
| 26504 / 18024 | ModalDialogName | Y / Y | 56 |
| 26505 / 18028 | ModalDialogName | Y / Y | 42 |
| 26506 / 18029 | ModalDialogName | Y / Y | 56 |
| 26507 / 18034 | URL | Y / Y | 32 |
| 26508 / 18035 | URL | Y / Y | 124 |
| 26509 / 18036 | URL | Y / Y | 104 |
| 26510 / 18037 | URL | Y / Y | 104 |
| 26511 / 18038 | ConfirmationMessageCode | Y / Y | 28 |
| 26512 / 18038 | POSTServiceURL | Y / Y | 116 |
| 26513 / 18038 | PostData_Grid_ListPaneDataGrid_objectId | Y / Y | 16 |
| 26514 / 18038 | PostData_Grid_ListPaneDataGrid_purchaseOrderId | Y / Y | 30 |
| 26515 / 18038 | Post_SuccessCallback | Y / Y | 140 |
| 26516 / 18039 | queryParameter_Grid_ListPaneDataGrid_ObjectId | Y / Y | 16 |
| 26517 / 18039 | URL | Y / Y | 118 |
| 26518 / 18040 | ConfirmationMessageCode | Y / Y | 38 |
| 26519 / 18040 | POSTServiceURL | Y / Y | 114 |
| 26520 / 18040 | PostData_Grid_ListPaneDataGrid_objectId | Y / Y | 16 |
| 26521 / 18040 | PostData_Grid_ListPaneDataGrid_purchaseOrderId | Y / Y | 30 |
| 26522 / 18040 | Post_SuccessCallback | Y / Y | 140 |
| 26523 / 18041 | ConfirmationMessageCode | Y / Y | 38 |
| 26524 / 18041 | POSTServiceURL | Y / Y | 132 |
| 26525 / 18041 | PostData_Grid_ListPaneDataGrid_objectId | Y / Y | 16 |
| 26526 / 18041 | PostData_Grid_ListPaneDataGrid_purchaseOrderId | Y / Y | 30 |
| 26527 / 18041 | Post_SuccessCallback | Y / Y | 140 |
| 26528 / 18042 | queryParameter_internalNum | Y / Y | 16 |
| 26529 / 18042 | printProcess | Y / Y | 6 |
| 26530 / 18043 | GETServiceURL | Y / Y | 54 |
| 26531 / 18043 | queryParameter_internalNum | Y / Y | 16 |
| 26532 / 18043 | queryParameter_printProcess | Y / Y | 6 |
| 26533 / 18044 | URL | Y / Y | 162 |
| 26534 / 18045 | URL | Y / Y | 128 |
| 26535 / 18049 | POSTServiceURL | Y / Y | 74 |
| 26536 / 18049 | PostData_ObjectId | Y / Y | 16 |
| 26537 / 18049 | PostData_storedProcedure | Y / Y | 50 |
| 26538 / 18049 | EnableAction_ListPaneMenuActionCopy | Y / Y | 24 |
| 26539 / 18049 | EnableAction_ListPaneMenuActionEdit | Y / Y | 24 |
| 26540 / 18049 | EnableAction_ListPaneMenuActionView | Y / Y | 24 |
| 26541 / 18049 | EnableAction_ListPaneMenuActionClose | Y / Y | 90 |
| 26542 / 18049 | EnableAction_ListPaneMenuActionDelete | Y / Y | 48 |
| 26543 / 18049 | EnableAction_ListPaneMenuActionPrintDefaultDocs | Y / Y | 48 |
| 26544 / 18049 | EnableAction_ListPaneMenuActionPrintPreviewDocs | Y / Y | 48 |
| 26545 / 18049 | EnableAction_ListPaneMenuActionPrintSelectedDocs | Y / Y | 48 |
| 26546 / 18049 | EnableAction_ListPaneMenuActionNewLine | Y / Y | 90 |
| 26547 / 18049 | EnableAction_ListPaneMenuActionCancelClose | Y / Y | 90 |
| 26548 / 18049 | EnableAction_ListPaneMenuActionReceiptFromPO | Y / Y | 154 |

The [Purchase Order configuration walkthrough](../purchase-order-configuration.md) provides a separately verified browser trace for Close control 51621, including its attribute and five actual parameter values. That one-action trace does not establish the behavior of every control on this Screen.

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 54 selected candidate rows for this Screen: **54 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40725 | 51609 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40726 | 51610 / Not applicable | data-securityCheckpoint | checkpoint | 26 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40727 | 51615 / Not applicable | data-formId | form_id | 4049 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40728 | 51615 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40729 | 51616 / Not applicable | data-formId | form_id | 4049 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40730 | 51616 / Not applicable | data-securityCheckpoint | checkpoint | 4 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40731 | 51617 / Not applicable | data-formId | form_id | 4049 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40732 | 51617 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40733 | 51618 / Not applicable | data-formId | form_id | 4049 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40734 | 51619 / Not applicable | data-formId | form_id | 4049 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40735 | 51619 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40737 | 51620 / Not applicable | data-formId | form_id | 4051 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40738 | 51620 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40740 | 51621 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40741 | 51622 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40742 | 51623 / Not applicable | data-securityCheckpoint | checkpoint | 34 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40743 | 51624 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40744 | 51625 / Not applicable | data-securityCheckpoint | checkpoint | 25 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40745 | 51626 / Not applicable | data-formId | form_id | 4052 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40746 | 51626 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40747 | 51627 / Not applicable | data-dbcolumn | database_identifier | POHEADERPURCHASEORDERID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40749 | 51628 / Not applicable | data-dbcolumn | database_identifier | RECEIPT_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40751 | 51629 / Not applicable | data-dbcolumn | database_identifier | SOURCE_NAME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40753 | 51630 / Not applicable | data-dbcolumn | database_identifier | SHIP_FROM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40755 | 51631 / Not applicable | data-dbcolumn | database_identifier | Item | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40757 | 51632 / Not applicable | data-dbcolumn | database_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40759 | 51633 / Not applicable | data-dbcolumn | database_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40760 | 51634 / Not applicable | data-dbcolumn | database_identifier | CREATED_DATE_TIME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40761 | 51635 / Not applicable | data-dbcolumn | database_identifier | POHEADERSTATUS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40767 | 51641 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_PURCHASE_ORDER_HEADER_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26486 | 51601 / 18021 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26490 | 51601 / 18021 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26495 | 51601 / 18021 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26498 | 51604 / 18023 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26502 | 51604 / 18023 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26511 | 51619 / 18038 | ConfirmationMessageCode | resource_code | MSG_PODELETE01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26512 | 51619 / 18038 | POSTServiceURL | relative_api_path | /inbound/scaleapi/PurchaseOrderApi/PurchaseOrders-Deleted? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26513 | 51619 / 18038 | PostData_Grid_ListPaneDataGrid_objectId | grid_field_identifier | ObjectId | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26514 | 51619 / 18038 | PostData_Grid_ListPaneDataGrid_purchaseOrderId | grid_field_identifier | PurchaseOrderId | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26515 | 51619 / 18038 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26516 | 51620 / 18039 | queryParameter_Grid_ListPaneDataGrid_ObjectId | grid_field_identifier | ObjectId | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26518 | 51621 / 18040 | ConfirmationMessageCode | resource_code | MSG_PURCHASEORDER13 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26519 | 51621 / 18040 | POSTServiceURL | relative_api_path | /inbound/scaleapi/PurchaseOrderApi/PurchaseOrders-Closed? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26520 | 51621 / 18040 | PostData_Grid_ListPaneDataGrid_objectId | grid_field_identifier | ObjectId | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26521 | 51621 / 18040 | PostData_Grid_ListPaneDataGrid_purchaseOrderId | grid_field_identifier | PurchaseOrderId | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26522 | 51621 / 18040 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26523 | 51622 / 18041 | ConfirmationMessageCode | resource_code | MSG_PURCHASEORDER02 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26524 | 51622 / 18041 | POSTServiceURL | relative_api_path | /inbound/scaleapi/PurchaseOrderApi/ClosedPurchaseOrders-Cancelled? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26525 | 51622 / 18041 | PostData_Grid_ListPaneDataGrid_objectId | grid_field_identifier | ObjectId | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26526 | 51622 / 18041 | PostData_Grid_ListPaneDataGrid_purchaseOrderId | grid_field_identifier | PurchaseOrderId | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26527 | 51622 / 18041 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26530 | 51624 / 18043 | GETServiceURL | relative_api_path | /general/scaleapi/PrintApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26535 | 51641 / 18049 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26537 | 51641 / 18049 | PostData_storedProcedure | stored_procedure_identifier | POH_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
