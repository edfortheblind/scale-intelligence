# Cycle Count Request Insight — Form 3101, Screen 1761

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3101 |
| MAIN_UI_SCREEN Object ID | 1761 |
| Label / Form resource key | Cycle Count Request Insight / MNU_CYCLECOUNTREQUESTINSIGHT |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/3101 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/3101 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3101 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_CYCLE_COUNT_REQUEST_VIEW |
| Help page reference | CycleCountReqInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3101 |
| Inspection time (UTC) | 2026-10-02T15:26:42.365Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_CYCLECOUNTREQUESTINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_CYCLE_COUNT_REQUEST_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1761 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:13:14.269Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/insights/3101#search; Cycle Count Request Insight | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

**Visible criteria / entry fields:** Cycle Count Request Filters; Location; Plan Number; Count Number; Group Number; Item; Lot; Warehouse; Company.

**Visible grid headers:** Count Number; Plan; Status; Item; Company; Lot; Location; Quantity Counted; System Quantity; Work Created; License Plate; Group Number; Inventory Attributes; Color.

**Observed action/menu labels:** Delete; Confirm; Reconcile.

**Page groups:** Basic Criteria; Status; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Cycle Count Request Insight is recorded as `insight`. Its saved configuration contains 6 parts, 22 groups, 41 controls, and 22 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4280 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4281 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4282 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4283 / SearchPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | InsightMenuApply |
| 4284 / ListPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |
| 4285 / DetailPane | Not populated / Not populated | 10 / 12500 | Y / Y / N | Not populated |

### Part 4280: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17720 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17720; default=None |
| 17721 / SaveSearchModalDialogHeader | 17720 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17720; default=None |
| 17722 / SaveSearchModalDialogBody | 17720 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17720; default=None |
| 17723 / SaveSearchModalDialogFooter | 17720 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17720; default=None |

#### Group 17722: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51013 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17723: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51014 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51015 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4281: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17724 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17724; default=None |
| 17725 / GadgetCalculationQueryDialogHeader | 17724 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17724; default=None |
| 17726 / GadgetCalculationQueryDialogBody | 17724 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17724; default=None |
| 17727 / GadgetCalculationQueryDialogFooter | 17724 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17724; default=None |

#### Group 17726: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51016 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17727: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51017 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51018 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4282: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17728 / InsightMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=17728; default=None |
| 17729 / InsightMenuPanel | 17728 | Not populated / Not populated | 60 / 750 | Y / Y | Fixed to top=Y; loading=0; nested unit=17728; default=None |
| 17732 / MenuExportToExcelPanel | 17728 | Not populated / Not populated | 60 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=17728; default=None |
| 17730 / InsightMenuFavoritesDropdown | 17728 | Favorites / FAVORITES | 100 / 1000 | Y / Y | Fixed to top=N; loading=0; nested unit=17728; default=None |
| 17733 / InsightMenuActionsDropdown | 17728 | Actions / ACTIONS | 80 / 1000 | Y / Y | Fixed to top=N; loading=0; nested unit=17728; default=None |
| 17731 / InsightListPaneMenuPanel | 17728 | Not populated / Not populated | 60 / 1100 | Y / Y | Fixed to top=Y; loading=0; nested unit=17728; default=None |

#### Group 17729: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51019 / InsightMenuApply | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51020 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51021 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 450 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51022 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17732: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51027 / MenuExportToExcel | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 17733: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51028 / ListPaneMenuActionDeleteCycleCountRequests | Delete / DELETE | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 51029 / ListPaneMenuActionConfirm | Confirm / CONFIRM | 150 / 600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CONFIRM |
| 51030 / ListPaneMenuActionReconcile | Reconcile / RECONCILE | 150 / 700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=RECONCILE |

#### Group 17731: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51023 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51024 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 51025 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51026 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

### Part 4283: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17734 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=17734; default=None |
| 17735 / SearchPaneBasicCriteria | 17734 | Basic Criteria / BASICCRITERIA | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=17734; default=None |
| 17736 / SearchPaneStatus | 17734 | Status / STATUS | 50 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=17734; default=None |
| 17737 / SearchPaneAdvancedCriteria | 17734 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=17734; default=None |

#### Group 17735: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51031 / SearchPaneFilters | Cycle Count Request Filters / CYCLECOUNTREQUESTFILTERS | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51032 / BasicCriteriaLocation | Location / LOCATION | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51033 / BasicCriteriaPlanNumber | Plan Number / PLANNUMBER | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51034 / BasicCriteriaCountNumber | Count Number / COUNTNUMBER | 90 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51035 / BasicCriteriaGroupNumber | Group Number / GROUPNUMBER | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51036 / BasicCriteriaItem | Item / ITEM | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51037 / BasicCriteriaLot | Lot / LOT | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51038 / BasicCriteriaWarehouse | Warehouse / WAREHOUSE | 280 / 2000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51039 / BasicCriteriaCompany | Company / COMPANY | 280 / 2250 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17736: SearchPaneStatus — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51040 / SearchPaneStatusOpen | Open / OPEN | 130 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51041 / SearchPaneStatusPendingReview | Pending Review / PENDINGREVIEW | 130 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51042 / SearchPaneStatusClosed | Closed / CLOSED | 130 / 7500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17737: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51043 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 250 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4284: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17738 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=17738; default=None |
| 17739 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=17739; default=None |

#### Group 17738: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51044 / ListPaneSummaryTotalRequests | Total Requests / SUMMARYTOTALREQUESTS | 50 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51045 / ListPaneSummaryTotalCountedQuantity | Total Counted Qty / TOTALCOUNTEDQTY | 50 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51046 / ListPaneSummaryTotalSystemQuantity | Total System Qty / TOTALSYSTEMQTY | 50 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17739: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51047 / ListPaneDataGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51047 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18129 / InternalCountNum | INTERNAL_COUNT_NUM / Count Number / COUNTNUMBER | 10 / 10 / 3000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18130 / InternalPlanNum | Not populated / Plan / PLAN | 10 / 10 / 3500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18132 / Condition | Not populated / Status / STATUS | 10 / 10 / 4000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18133 / Item | Not populated / Item / ITEM | 10 / 10 / 5000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18134 / Company | Not populated / Company / COMPANY | 10 / 10 / 6000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18135 / Lot | Not populated / Lot / LOT | 10 / 10 / 7000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18136 / Location | Not populated / Location / LOCATION | 10 / 10 / 8000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18137 / QuantityCounted | Not populated / Quantity Counted / QUANTITYCOUNTED | 20 / 10 / 9000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18138 / SystemQuantity | Not populated / System Quantity / SYSTEMQUANTITY | 20 / 10 / 10000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18139 / WorkCreated | Not populated / Work Created / WORKCREATED | 40 / 10 / 11000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18140 / LogisticsUnit | Not populated / License Plate / LICENSEPLATE | 10 / 10 / 12000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18141 / GroupNumber | GROUP_NUMBER / Group Number / GROUPNUMBER | 20 / 10 / 13000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18142 / LocInvAttributesId | Not populated / Inventory Attributes / LOCATIONINVENTORYATTRIBUTES | 40 / 10 / 14000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18143 / ICON | Not populated / Icon / ICON | 10 / 10 / 14250 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18144 / COLOR | Not populated / Color / COLOR | 10 / 10 / 14500 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18145 / InternalCountNum | INTERNAL_COUNT_NUM / Count Number / COUNTNUMBER | 10 / 20 / 15000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18146 / GroupNumber | GROUP_NUMBER / Group Number / GROUPNUMBER | 20 / 20 / 16000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18147 / InCreation | Not populated / In Creation / INCREATION | 40 / 10 / 17000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18150 / Warehouse | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 17500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18148 / Reconcile | Not populated / Not populated / Reconcile | 40 / 10 / 18000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18149 / Confirm | Not populated / Not populated / Confirm | 40 / 10 / 19000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18131 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 19010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4285: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17740 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=17740; default=None |
| 17741 / indicatorpane | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=17741; default=None |

#### Group 17740: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51048 / DetailPaneHeaderLocation | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=579; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51049 / DetailPaneHeaderItem | Not populated / Not populated | 30 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=579; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51050 / DetailPaneHeaderDescription | Not populated / Not populated | 30 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=579; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51051 / DetailPaneHeaderCompany | Company / COMPANY | 30 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=579; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51052 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=579; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17741: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51053 / InventoryInsightIndicatorTileOpenWork | Open Work / OPEN_WORK | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 44 control attributes, 20 events, and 38 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40165 | 51013 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40166 | 51013 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40167 | 51022 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40168 | 51023 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40169 | 51028 / ListPaneMenuActionDeleteCycleCountRequests | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40170 | 51028 / ListPaneMenuActionDeleteCycleCountRequests | data-formId | Y / Y / N | 6 / 0 |
| 40171 | 51028 / ListPaneMenuActionDeleteCycleCountRequests | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40172 | 51028 / ListPaneMenuActionDeleteCycleCountRequests | data-divider | Y / Y / N | 8 / 0 |
| 40173 | 51029 / ListPaneMenuActionConfirm | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40174 | 51029 / ListPaneMenuActionConfirm | data-formId | Y / Y / N | 8 / 0 |
| 40175 | 51029 / ListPaneMenuActionConfirm | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40176 | 51030 / ListPaneMenuActionReconcile | data-formId | Y / Y / N | 8 / 0 |
| 40177 | 51030 / ListPaneMenuActionReconcile | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40178 | 51030 / ListPaneMenuActionReconcile | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40179 | 51032 / BasicCriteriaLocation | data-dbcolumn | Y / Y / N | 16 / 0 |
| 40180 | 51032 / BasicCriteriaLocation | Lookup | Y / Y / N | 78 / 1 |
| 40181 | 51033 / BasicCriteriaPlanNumber | data-dbcolumn | Y / Y / N | 34 / 0 |
| 40182 | 51033 / BasicCriteriaPlanNumber | nullable | Y / Y / Y | 8 / 0 |
| 40183 | 51034 / BasicCriteriaCountNumber | data-dbcolumn | Y / Y / N | 36 / 0 |
| 40184 | 51034 / BasicCriteriaCountNumber | minValue | Y / Y / Y | 2 / 0 |
| 40185 | 51035 / BasicCriteriaGroupNumber | data-dbcolumn | Y / Y / N | 24 / 0 |
| 40186 | 51035 / BasicCriteriaGroupNumber | nullable | Y / Y / Y | 8 / 0 |
| 40187 | 51036 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 40188 | 51036 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 40189 | 51037 / BasicCriteriaLot | data-dbcolumn | Y / Y / N | 6 / 0 |
| 40190 | 51037 / BasicCriteriaLot | Lookup | Y / Y / N | 48 / 1 |
| 40191 | 51038 / BasicCriteriaWarehouse | defaultValue | Y / Y / Y | 32 / 0 |
| 40192 | 51038 / BasicCriteriaWarehouse | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40193 | 51039 / BasicCriteriaCompany | data-dbcolumn | Y / Y / N | 14 / 0 |
| 40194 | 51040 / SearchPaneStatusOpen | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40195 | 51040 / SearchPaneStatusOpen | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40196 | 51040 / SearchPaneStatusOpen | data-negativeCondition | Y / Y / N | 18 / 0 |
| 40197 | 51041 / SearchPaneStatusPendingReview | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40198 | 51041 / SearchPaneStatusPendingReview | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40199 | 51041 / SearchPaneStatusPendingReview | data-negativeCondition | Y / Y / N | 38 / 0 |
| 40200 | 51042 / SearchPaneStatusClosed | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40201 | 51042 / SearchPaneStatusClosed | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40202 | 51042 / SearchPaneStatusClosed | data-negativeCondition | Y / Y / N | 22 / 0 |
| 40203 | 51045 / ListPaneSummaryTotalCountedQuantity | data-aggregateClause | Y / Y / Y | 40 / 0 |
| 40204 | 51046 / ListPaneSummaryTotalSystemQuantity | data-aggregateClause | Y / Y / Y | 38 / 0 |
| 40205 | 51047 / ListPaneDataGrid | data-dbtable | Y / Y / N | 82 / 0 |
| 40206 | 51047 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 40207 | 51047 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 40208 | 51053 / InventoryInsightIndicatorTileOpenWork | data-indicatorTileGoToInsight | Y / Y / Y | 338 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17687 / click | 51014 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 17688 / click | 51015 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17689 / click | 51017 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 17690 / click | 51018 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17691 / click | 51019 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 17692 / click | 51020 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 17693 / click | 51021 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 17694 / click | 51022 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17695 / click | 51023 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17696 / click | 51024 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 17697 / click | 51025 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 17698 / click | 51026 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 17699 / click | 51027 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 17700 / click | 51028 / ListPaneMenuActionDeleteCycleCountRequests | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 17701 / click | 51029 / ListPaneMenuActionConfirm | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 17702 / click | 51030 / ListPaneMenuActionReconcile | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17703 / iggridrequesterror | 51047 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 17704 / iggriddatabound | 51047 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 17705 / iggridselectionrowselectionchanged | 51047 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 17706 / iggridselectionactiverowchanged | 51047 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 25794 / 17687 | GETServiceURL | Y / Y | 76 |
| 25795 / 17687 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 25796 / 17687 | queryParameter_Function_UserName | Y / Y | 44 |
| 25797 / 17687 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25798 / 17687 | POSTServiceURL | Y / Y | 74 |
| 25799 / 17687 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 25800 / 17687 | PostData_Function_UserName | Y / Y | 44 |
| 25801 / 17687 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25802 / 17687 | PostData_Function_SearchValue | Y / Y | 98 |
| 25803 / 17687 | Post_SuccessCallback | Y / Y | 114 |
| 25804 / 17687 | ModalDialogName | Y / Y | 42 |
| 25805 / 17688 | ModalDialogName | Y / Y | 42 |
| 25806 / 17689 | POSTServiceURL | Y / Y | 144 |
| 25807 / 17689 | Form_Id | Y / Y | 8 |
| 25808 / 17689 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 25809 / 17689 | PostData_Function_SearchValue | Y / Y | 98 |
| 25810 / 17689 | Post_SuccessCallback | Y / Y | 114 |
| 25811 / 17689 | ModalDialogName | Y / Y | 56 |
| 25812 / 17690 | ModalDialogName | Y / Y | 56 |
| 25813 / 17694 | ModalDialogName | Y / Y | 42 |
| 25814 / 17695 | ModalDialogName | Y / Y | 56 |
| 25815 / 17700 | ConfirmationMessageCode | Y / Y | 34 |
| 25816 / 17700 | POSTServiceURL | Y / Y | 136 |
| 25817 / 17700 | PostData_Grid_ListPaneDataGrid_InternalCountNum | Y / Y | 32 |
| 25818 / 17700 | Post_SuccessCallback | Y / Y | 140 |
| 25819 / 17700 | Post_ErrorCallback | Y / Y | 120 |
| 25820 / 17701 | ConfirmationMessageCode | Y / Y | 16 |
| 25821 / 17701 | POSTServiceURL | Y / Y | 140 |
| 25822 / 17701 | PostData_Grid_ListPaneDataGrid_InternalCountNum | Y / Y | 32 |
| 25823 / 17701 | Post_SuccessCallback | Y / Y | 140 |
| 25824 / 17701 | Post_ErrorCallback | Y / Y | 120 |
| 25825 / 17702 | URL | Y / Y | 214 |
| 25826 / 17706 | POSTServiceURL | Y / Y | 72 |
| 25827 / 17706 | PostData_internalCountNum | Y / Y | 32 |
| 25828 / 17706 | PostData_storedProcedure | Y / Y | 50 |
| 25829 / 17706 | EnableAction_ListPaneMenuActionDeleteCycleCountRequests | Y / Y | 76 |
| 25830 / 17706 | EnableAction_ListPaneMenuActionConfirm | Y / Y | 26 |
| 25831 / 17706 | EnableAction_ListPaneMenuActionReconcile | Y / Y | 30 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 37 selected candidate rows for this Screen: **37 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40167 | 51022 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40168 | 51023 / Not applicable | data-securityCheckpoint | checkpoint | 25 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40170 | 51028 / Not applicable | data-formId | form_id | 132 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40171 | 51028 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40174 | 51029 / Not applicable | data-formId | form_id | 3101 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40175 | 51029 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40176 | 51030 / Not applicable | data-formId | form_id | 3039 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40177 | 51030 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40179 | 51032 / Not applicable | data-dbcolumn | database_identifier | LOCATION | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40181 | 51033 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_PLAN_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40183 | 51034 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_COUNT_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40185 | 51035 / Not applicable | data-dbcolumn | database_identifier | GROUP_NUMBER | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40187 | 51036 / Not applicable | data-dbcolumn | database_identifier | ITEM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40189 | 51037 / Not applicable | data-dbcolumn | database_identifier | LOT | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40192 | 51038 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40193 | 51039 / Not applicable | data-dbcolumn | database_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40194 | 51040 / Not applicable | data-dbcolumn | database_identifier | CONDITION | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40197 | 51041 / Not applicable | data-dbcolumn | database_identifier | CONDITION | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40201 | 51042 / Not applicable | data-dbcolumn | database_identifier | CONDITION | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40205 | 51047 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_CYCLE_COUNT_REQUEST_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25794 | 51014 / 17687 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25798 | 51014 / 17687 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25803 | 51014 / 17687 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25806 | 51017 / 17689 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25810 | 51017 / 17689 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25815 | 51028 / 17700 | ConfirmationMessageCode | resource_code | MSG_DELETECCREQ01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25816 | 51028 / 17700 | POSTServiceURL | relative_api_path | /Inventory/scaleapi/CycleCountRequestsApi/Deleted-CycleCountRequests | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25817 | 51028 / 17700 | PostData_Grid_ListPaneDataGrid_InternalCountNum | grid_field_identifier | InternalCountNum | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25818 | 51028 / 17700 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25819 | 51028 / 17700 | Post_ErrorCallback | callback_identifier | _webUi.insightListPaneActions.postMethodErrorCallbackHandler | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25820 | 51029 / 17701 | ConfirmationMessageCode | resource_code | MSG_CC38 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25821 | 51029 / 17701 | POSTServiceURL | relative_api_path | /Inventory/scaleapi/CycleCountRequestsApi/Confirmed-CycleCountRequests | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25822 | 51029 / 17701 | PostData_Grid_ListPaneDataGrid_InternalCountNum | grid_field_identifier | InternalCountNum | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25823 | 51029 / 17701 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25824 | 51029 / 17701 | Post_ErrorCallback | callback_identifier | _webUi.insightListPaneActions.postMethodErrorCallbackHandler | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25826 | 51047 / 17706 | POSTServiceURL | relative_api_path | /general/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25828 | 51047 / 17706 | PostData_storedProcedure | stored_procedure_identifier | CCR_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
