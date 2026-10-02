# Purchase Order Line Insight — Form 2797, Screen 1777

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2797 |
| MAIN_UI_SCREEN Object ID | 1777 |
| Label / Form resource key | Purchase Order Line Insight / MNU_PURCHASEORDERLINEINSIGHT |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2797 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2797 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2797 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_PURCHASE_ORDER_DETAIL_VIEW |
| Help page reference | purchaseOrderLineInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2797 |
| Inspection time (UTC) | 2026-10-02T15:24:40.677Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_PURCHASEORDERLINEINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_PURCHASE_ORDER_DETAIL_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1777 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:12:21.796Z | loaded; runtime_inspection | https://trav.manhscale.com/scale/insights/2797#search; Purchase Order Line Insight | [runtime-root.json](../../evidence/runtime-root.json) |

**Visible criteria / entry fields:** Purchase Order; Receipt ID; Item; Purchase Order Line Number; Internal Order Line Number; Company; Warehouse.

**Visible grid headers:** Field; Operand; Value; Purchase Order; Purchase Order Line Number; Item; Description; Company; Total Qty; Open Qty; UM; Color.

**Observed action/menu labels:** Σ; Actions.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Purchase Order Line Insight is recorded as `insight`. Its saved configuration contains 6 parts, 20 groups, 38 controls, and 16 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4379 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4380 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4381 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4382 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4383 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4384 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4379: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18058 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18058; default=None |
| 18059 / SaveSearchModalDialogHeader | 18058 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18058; default=None |
| 18060 / SaveSearchModalDialogBody | 18058 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18058; default=None |
| 18061 / SaveSearchModalDialogFooter | 18058 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18058; default=None |

#### Group 18060: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51647 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18061: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51648 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51649 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4380: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18062 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18062; default=None |
| 18063 / GadgetCalculationQueryDialogHeader | 18062 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18062; default=None |
| 18064 / GadgetCalculationQueryDialogBody | 18062 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18062; default=None |
| 18065 / GadgetCalculationQueryDialogFooter | 18062 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18062; default=None |

#### Group 18064: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51650 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18065: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51651 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51652 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4381: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18066 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18066; default=None |
| 18067 / InsightMenuPanel | 18066 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18066; default=None |
| 18068 / InsightMenuFavoritesDropdown | 18066 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18066; default=None |
| 18069 / InsightListPaneMenuPanel | 18066 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18066; default=None |
| 18070 / MenuExportToExcelPanel | 18066 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18066; default=None |
| 18071 / InsightMenuActionsDropdown | 18066 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18066; default=None |

#### Group 18067: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51653 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51654 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51655 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51656 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18069: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51657 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51658 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 51659 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51660 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18070: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51661 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18071: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51662 / ListPaneMenuActionCopy | Copy / COPY | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=COPY |
| 51663 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 51664 / ListPaneMenuActionView | View / VIEW | 150 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 51665 / ListPaneMenuActionDelete | Delete / DELETE | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |

### Part 4382: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18072 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18072; default=None |
| 18073 / SearchPaneBasicCriteria | 18072 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18072; default=None |
| 18074 / SearchPaneAdvancedCriteria | 18072 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=18072; default=None |

#### Group 18073: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51666 / BasicCriteriaPurchaseOrderId | Purchase Order / PURCHASEORDER | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51667 / BasicCriteriaReceiptId | Receipt ID / RECEIPTID | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51668 / BasicCriteriaItem | Item / ITEM | 10 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51669 / BasicCriteriaPurchaseOrderLineNumber | Purchase Order Line Number / PURCHASEORDERLINENUMBER | 90 / 3500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51670 / BasicCriteriaInternalOrderLineNumber | Internal Order Line Number / INTERNALORDERLINENUMBER | 90 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51671 / SearchPaneComp | Company / COMPANY | 280 / 5000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51672 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 6000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51673 / BasicCriteriaIncludeClosedPurchaseOrders | Include Closed Purchase Orders / INCLUDECLOSEDPURCHASEORDERS | 130 / 8000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18074: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51674 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4383: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18075 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18075; default=None |
| 18076 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18076; default=None |

#### Group 18075: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51675 / ListPaneSummaryPOs | Pos / POS | 50 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51676 / ListPaneSummaryLines | Lines / LINES | 50 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51677 / ListPaneSummaryTotalQty | Total Qty / TOTALQTY | 50 / 7500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51678 / ListPaneSummaryOpenQty | Open Qty / OPENQTY | 50 / 10000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18076: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51679 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51679 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18491 / Not populated | PODETAILOBJECTID / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18476 / PurchaseOrderId | Not populated / Purchase Order / PURCHASEORDER | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18488 / LineNumber | Not populated / Purchase Order Line Number / PURCHASEORDERLINENUMBER | 20 / 10 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18479 / Item | Not populated / Item / ITEM | 10 / 10 / 3000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18480 / ItemDesc | Not populated / Description / DESCRIPTION | 10 / 10 / 3500 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18481 / Company | Not populated / Company / COMPANY | 10 / 10 / 4000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18482 / TotalQuantity | Not populated / Total Qty / TOTALQTY | 20 / 10 / 4300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18483 / OpenQuantity | Not populated / Open Qty / OPENQTY | 20 / 10 / 4600 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18484 / QuantityUm | Not populated / UM / UM | 10 / 10 / 4800 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18485 / COLOR | Not populated / Color / COLOR | 10 / 10 / 5000 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18486 / ICON | Not populated / Icon / ICON | 10 / 10 / 6000 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18487 / Warehouse | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 7000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18478 / ObjectId | Not populated / Internal Order Line Number / INTERNALORDERLINENUMBER | 20 / 10 / 8000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18490 / IsPurchaseOrderClosed | Not populated / Purchase Order Closed / PURCHASEORDERCLOSED | 40 / 10 / 9000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18489 / PurchaseOrderObjectId | Not populated / Purchase Order Object ID / PURCHASEORDEROBJECTID | 20 / 10 / 10000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18477 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 10010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4384: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18077 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18077; default=None |

#### Group 18077: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51680 / DetailPaneHeaderPurchaseOrderLineNumber | Not populated / Not populated | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=595; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51681 / DetailPaneHeaderItem | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=595; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51682 / DetailPaneHeaderCompany | Not populated / Not populated | 30 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=595; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51683 / DetailPaneHeaderItemDesc | Not populated / Not populated | 30 / 850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=595; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51684 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=595; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 33 control attributes, 21 events, and 37 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40772 | 51647 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40773 | 51647 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40774 | 51656 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40775 | 51657 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40776 | 51662 / ListPaneMenuActionCopy | data-formId | Y / Y / N | 8 / 0 |
| 40777 | 51662 / ListPaneMenuActionCopy | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40778 | 51663 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 40779 | 51663 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40780 | 51664 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 40781 | 51665 / ListPaneMenuActionDelete | data-formId | Y / Y / N | 8 / 0 |
| 40782 | 51665 / ListPaneMenuActionDelete | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40783 | 51666 / BasicCriteriaPurchaseOrderId | data-dbcolumn | Y / Y / N | 46 / 0 |
| 40784 | 51666 / BasicCriteriaPurchaseOrderId | Lookup | Y / Y / N | 104 / 1 |
| 40785 | 51667 / BasicCriteriaReceiptId | data-dbcolumn | Y / Y / N | 20 / 0 |
| 40786 | 51667 / BasicCriteriaReceiptId | Lookup | Y / Y / N | 86 / 1 |
| 40787 | 51668 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 40788 | 51668 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 40789 | 51669 / BasicCriteriaPurchaseOrderLineNumber | data-dbcolumn | Y / Y / N | 36 / 0 |
| 40790 | 51669 / BasicCriteriaPurchaseOrderLineNumber | nullable | Y / Y / Y | 8 / 0 |
| 40791 | 51670 / BasicCriteriaInternalOrderLineNumber | data-dbcolumn | Y / Y / N | 32 / 0 |
| 40792 | 51670 / BasicCriteriaInternalOrderLineNumber | nullable | Y / Y / Y | 8 / 0 |
| 40793 | 51671 / SearchPaneComp | data-dbcolumn | Y / Y / N | 14 / 0 |
| 40794 | 51672 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 40795 | 51672 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40796 | 51673 / BasicCriteriaIncludeClosedPurchaseOrders | data-dbcolumn | Y / Y / N | 28 / 0 |
| 40797 | 51673 / BasicCriteriaIncludeClosedPurchaseOrders | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40798 | 51673 / BasicCriteriaIncludeClosedPurchaseOrders | data-negativeCondition | Y / Y / N | 22 / 0 |
| 40799 | 51675 / ListPaneSummaryPOs | data-aggregateClause | Y / Y / Y | 80 / 0 |
| 40800 | 51676 / ListPaneSummaryLines | data-aggregateClause | Y / Y / Y | 20 / 0 |
| 40801 | 51677 / ListPaneSummaryTotalQty | data-aggregateClause | Y / Y / Y | 38 / 0 |
| 40802 | 51678 / ListPaneSummaryOpenQty | data-aggregateClause | Y / Y / Y | 36 / 0 |
| 40803 | 51679 / ListPaneDataGrid | data-dbtable | Y / Y / N | 86 / 0 |
| 40804 | 51680 / DetailPaneHeaderPurchaseOrderLineNumber | href | Y / Y / Y | 58 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18050 / click | 51648 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18051 / click | 51649 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18052 / click | 51651 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18053 / click | 51652 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18054 / click | 51653 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18055 / click | 51654 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18056 / click | 51655 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18057 / click | 51656 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18058 / click | 51657 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18059 / click | 51658 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 18060 / click | 51659 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18061 / click | 51660 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18062 / click | 51661 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18063 / click | 51662 / ListPaneMenuActionCopy | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18064 / click | 51663 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18065 / click | 51664 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18066 / click | 51665 / ListPaneMenuActionDelete | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 18067 / iggridrequesterror | 51679 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18068 / iggriddatabound | 51679 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18069 / iggridselectionrowselectionchanged | 51679 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18070 / iggridselectionactiverowchanged | 51679 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 26549 / 18050 | GETServiceURL | Y / Y | 76 |
| 26550 / 18050 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 26551 / 18050 | queryParameter_Function_UserName | Y / Y | 44 |
| 26552 / 18050 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26553 / 18050 | POSTServiceURL | Y / Y | 74 |
| 26554 / 18050 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 26555 / 18050 | PostData_Function_UserName | Y / Y | 44 |
| 26556 / 18050 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26557 / 18050 | PostData_Function_SearchValue | Y / Y | 98 |
| 26558 / 18050 | Post_SuccessCallback | Y / Y | 114 |
| 26559 / 18050 | ModalDialogName | Y / Y | 42 |
| 26560 / 18051 | ModalDialogName | Y / Y | 42 |
| 26561 / 18052 | POSTServiceURL | Y / Y | 144 |
| 26562 / 18052 | Form_Id | Y / Y | 8 |
| 26563 / 18052 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26564 / 18052 | PostData_Function_SearchValue | Y / Y | 98 |
| 26565 / 18052 | Post_SuccessCallback | Y / Y | 114 |
| 26566 / 18052 | ModalDialogName | Y / Y | 56 |
| 26567 / 18053 | ModalDialogName | Y / Y | 56 |
| 26568 / 18057 | ModalDialogName | Y / Y | 42 |
| 26569 / 18058 | ModalDialogName | Y / Y | 56 |
| 26570 / 18063 | URL | Y / Y | 110 |
| 26571 / 18064 | URL | Y / Y | 104 |
| 26572 / 18065 | URL | Y / Y | 104 |
| 26573 / 18066 | ConfirmationMessageCode | Y / Y | 36 |
| 26574 / 18066 | POSTServiceURL | Y / Y | 138 |
| 26575 / 18066 | PostData_Grid_ListPaneDataGrid_ObjectId | Y / Y | 16 |
| 26576 / 18066 | PostData_Grid_ListPaneDataGrid_PurchaseOrderId | Y / Y | 30 |
| 26577 / 18066 | PostData_Grid_ListPaneDataGrid_LineNumber | Y / Y | 20 |
| 26578 / 18066 | Post_SuccessCallback | Y / Y | 140 |
| 26579 / 18070 | POSTServiceURL | Y / Y | 74 |
| 26580 / 18070 | PostData_ObjectId | Y / Y | 16 |
| 26581 / 18070 | PostData_storedProcedure | Y / Y | 50 |
| 26582 / 18070 | EnableAction_ListPaneMenuActionCopy | Y / Y | 112 |
| 26583 / 18070 | EnableAction_ListPaneMenuActionEdit | Y / Y | 50 |
| 26584 / 18070 | EnableAction_ListPaneMenuActionView | Y / Y | 50 |
| 26585 / 18070 | EnableAction_ListPaneMenuActionDelete | Y / Y | 54 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 31 selected candidate rows for this Screen: **31 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40774 | 51656 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40775 | 51657 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40776 | 51662 / Not applicable | data-formId | form_id | 4051 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40777 | 51662 / Not applicable | data-securityCheckpoint | checkpoint | 4 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40778 | 51663 / Not applicable | data-formId | form_id | 4051 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40779 | 51663 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40780 | 51664 / Not applicable | data-formId | form_id | 4051 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40781 | 51665 / Not applicable | data-formId | form_id | 4051 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40782 | 51665 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40783 | 51666 / Not applicable | data-dbcolumn | database_identifier | PODETAILPURCHASEORDERID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40785 | 51667 / Not applicable | data-dbcolumn | database_identifier | RECEIPT_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40787 | 51668 / Not applicable | data-dbcolumn | database_identifier | Item | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40789 | 51669 / Not applicable | data-dbcolumn | database_identifier | PODETAILLINENUMBER | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40791 | 51670 / Not applicable | data-dbcolumn | database_identifier | PODETAILOBJECTID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40793 | 51671 / Not applicable | data-dbcolumn | database_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40795 | 51672 / Not applicable | data-dbcolumn | database_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40796 | 51673 / Not applicable | data-dbcolumn | database_identifier | POHEADERSTATUS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40803 | 51679 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_PURCHASE_ORDER_DETAIL_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26549 | 51648 / 18050 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26553 | 51648 / 18050 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26558 | 51648 / 18050 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26561 | 51651 / 18052 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26565 | 51651 / 18052 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26573 | 51665 / 18066 | ConfirmationMessageCode | resource_code | MSG_POLINEDELETE01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26574 | 51665 / 18066 | POSTServiceURL | relative_api_path | /inbound/scaleapi/PurchaseOrderDetailsApi/PurchaseOrderLines-Deleted? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26575 | 51665 / 18066 | PostData_Grid_ListPaneDataGrid_ObjectId | grid_field_identifier | ObjectId | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26576 | 51665 / 18066 | PostData_Grid_ListPaneDataGrid_PurchaseOrderId | grid_field_identifier | PurchaseOrderId | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26577 | 51665 / 18066 | PostData_Grid_ListPaneDataGrid_LineNumber | grid_field_identifier | LineNumber | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26578 | 51665 / 18066 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26579 | 51679 / 18070 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26581 | 51679 / 18070 | PostData_storedProcedure | stored_procedure_identifier | POD_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
