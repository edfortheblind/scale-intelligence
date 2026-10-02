# Movement Class Insight — Form 3110, Screen 1772

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3110 |
| MAIN_UI_SCREEN Object ID | 1772 |
| Label / Form resource key | Movement Class Insight / MNU_MOVEMENTCLASSINSIGHT |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/3110 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/3110 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3110 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | MOVEMENT_CLASS_ANALYSIS_VIEW |
| Help page reference | moveClAnalysisInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3110 |
| Inspection time (UTC) | 2026-10-02T15:26:46.477Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_MOVEMENTCLASSINSIGHT |
| Observed configured table/view | MOVEMENT_CLASS_ANALYSIS_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1772 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:14:19.563Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/insights/3110#search; Movement Class Insight | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

**Visible criteria / entry fields:** Item; Company; Item Class; Location; Location Type; Locating Zone; Converted Qty UM; Converted UM Movement Class; Location Movement Class; From Date Time; To Date Time; Warehouse.

**Visible grid headers:** Icon; Item; Description; Company; Item UM; Number of Hits; Location; Location Movement Class; Total Quantity; Quantity UM; Quantity UM Movement Class; Color.

**Observed action/menu labels:** Adjust; Transfer.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Movement Class Insight is recorded as `insight`. Its saved configuration contains 6 parts, 21 groups, 40 controls, and 33 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4349 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4350 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4351 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4352 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4353 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4354 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4349: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17955 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17955; default=None |
| 17956 / SaveSearchModalDialogHeader | 17955 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17955; default=None |
| 17957 / SaveSearchModalDialogBody | 17955 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17955; default=None |
| 17958 / SaveSearchModalDialogFooter | 17955 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17955; default=None |

#### Group 17957: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51439 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17958: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51440 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51441 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4350: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17959 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17959; default=None |
| 17960 / GadgetCalculationQueryDialogHeader | 17959 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17959; default=None |
| 17961 / GadgetCalculationQueryDialogBody | 17959 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17959; default=None |
| 17962 / GadgetCalculationQueryDialogFooter | 17959 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17959; default=None |

#### Group 17961: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51442 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17962: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51443 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51444 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4351: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17963 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17963; default=None |
| 17964 / InsightMenuPanel | 17963 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=17963; default=None |
| 17965 / InsightMenuFavoritesDropdown | 17963 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=17963; default=None |
| 17966 / InsightListPaneMenuPanel | 17963 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17963; default=None |
| 17967 / MenuExportToExcelPanel | 17963 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=17963; default=None |
| 17968 / InsightMenuActionsDropdown | 17963 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=17963; default=None |

#### Group 17964: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51445 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51446 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51447 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51448 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17966: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51449 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51450 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 51451 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51452 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 17967: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51453 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 17968: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51454 / ListPaneMenuActionAdjust | Adjust / ADJUST | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ADJUST |
| 51455 / ListPaneMenuActionTransfer | Transfer / TRANSFER | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TRANSFER |

### Part 4352: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17969 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17969; default=None |
| 17970 / SearchPaneBasicCriteria | 17969 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=17969; default=None |
| 17971 / SearchPaneAdvancedCriteria | 17969 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=17969; default=None |

#### Group 17970: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51456 / BasicCriteriaItem | Item / ITEM | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51457 / SearchPaneComp | Company / COMPANY | 280 / 2000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51458 / BasicCriteriaItemClass | Item Class / ITEMCLASS | 80 / 3000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51459 / BasicCriteriaLocation | Location / LOCATION | 10 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51460 / BasicCriteriaLocationType | Location Type / LOCATIONTYPE | 80 / 9000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51461 / BasicCriteriaLocatingZone | Locating Zone / LOCATINGZONE | 80 / 10000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51462 / BasicCriteriaConvQtyUM | Converted Qty UM / CONVERTEDQTYUM | 80 / 11000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51463 / BasicCriteriaConvUMMovClass | Converted UM Movement Class / CONVERTEDUMMOVEMENTCLASS | 80 / 12000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51464 / BasicCriteriaLocMovClass | Location Movement Class / LOCATIONMOVEMENTCLASS | 80 / 13000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51465 / BasicCriteriaDueDateRange | Date/Time / DATETIME | 190 / 14000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51466 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 15000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17971: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51467 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4353: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17972 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17972; default=None |
| 17973 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17973; default=None |

#### Group 17972: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51468 / ListPaneSummaryTotalQty | Total Quantity / TOTALQUANTITY | 50 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51469 / ListPaneSummaryNoOfHits | Number of Hits / NUMBEROFHITS | 50 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51470 / ListPaneSummaryLocations | Locations / LOCATIONS | 50 / 7500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17973: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51471 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51471 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18348 / Not populated | CONVERTED_QTY_UM / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18350 / Not populated | ITEM / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18351 / Not populated | LOCATION / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18352 / ConvertedQuantityUm | CONVERTED_QTY_UM / Not populated / Not populated | Not populated / 50 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18353 / Not populated | CONVERTED_QTY_UM / Not populated / Not populated | Not populated / 30 / 100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18354 / Not populated | ITEM / Not populated / Not populated | Not populated / 30 / 200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18355 / ICON | Not populated / Icon / ICON | 10 / 10 / 500 / 45 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18357 / Item | ITEM / Not populated / Item | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18358 / Description | Not populated / Description / DESCRIPTION | 10 / 10 / 1500 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18359 / Company | Not populated / Company / COMPANY | 10 / 10 / 1750 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18356 / ItemUm | Not populated / Item UM / ITEMUM | 10 / 10 / 1900 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18360 / NumberOfHits | Not populated / Number of Hits / NUMBEROFHITS | 20 / 10 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18361 / Location | Not populated / Location / LOCATION | 10 / 10 / 2500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18362 / LocationMovementClass | Not populated / Location Movement Class / LOCATIONMOVEMENTCLASS | 10 / 10 / 3000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18363 / TotalQuantity | Not populated / Total Quantity / TOTALQUANTITY | 20 / 10 / 3500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18364 / QuantityUm | Not populated / Quantity UM / QUANTITYUM | 10 / 10 / 4000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18365 / QuantityUmMovementClass | Not populated / Quantity UM Movement Class / QUANTITYUMMOVEMENTCLASS | 10 / 10 / 4500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18366 / COLOR | Not populated / Color / COLOR | 10 / 10 / 5000 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18367 / ConvertedQuantity | Not populated / Converted Qty / CONVERTEDQTY | 20 / 10 / 5500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18368 / ConvertedQuantityUm | CONVERTED_QTY_UM / Converted Qty UM / CONVERTEDQTYUM | 10 / 10 / 6000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18369 / ConvertedUmMovementClass | Not populated / Converted UM Movement Class / CONVERTEDUMMOVEMENTCLASS | 10 / 10 / 6500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18370 / LocationType | Not populated / Location Type / LOCATIONTYPE | 10 / 10 / 7000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18371 / LocatingZone | Not populated / Locating Zone / LOCATINGZONE | 10 / 10 / 7500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18372 / ItemClass | Not populated / Item Class / ITEMCLASS | 10 / 10 / 8000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18373 / TotalValue | Not populated / Total Value / TOTALVALUE | 20 / 10 / 8500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=40; DATA_SOURCE_TYPE=None |
| 18374 / TotalCost | Not populated / Total Cost / TOTALCOST | 20 / 10 / 9000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=40; DATA_SOURCE_TYPE=None |
| 18375 / TotalWeight | Not populated / Total Weight / TOTALWEIGHT | 20 / 10 / 9500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=60; DATA_SOURCE_TYPE=None |
| 18376 / DateTimeStamp | Not populated / Date Time Stamp / DATETIMESTAMP | 30 / 10 / 10000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18377 / NumberOfDays | Not populated / Number of Days / NUMBEROFDAYS | 20 / 10 / 10500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18378 / Warehouse | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 11000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18379 / Permanent | Not populated / Permanent / PERMANENT | 10 / 10 / 12000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18380 / ObjectId | Not populated / Object ID / OBJECTID | 10 / 10 / 13000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18349 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 13010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4354: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17974 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17974; default=None |
| 17975 / indicatorpane | Not populated | Not populated / Not populated | 60 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=17975; default=None |

#### Group 17974: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51472 / DetailPaneHeaderItem | Not populated / Not populated | 30 / 100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=590; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51473 / DetailPaneHeaderItemDesc | Not populated / Not populated | 30 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=590; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51474 / DetailPaneHeaderCompany | Not populated / Not populated | 30 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=590; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51475 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 400 | N / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=590; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51476 / DetailPaneHeaderNumberOfHits | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=590; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51477 / DetailPaneHeaderLocation | Not populated / Not populated | 30 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=590; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17975: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51478 / MovementClassInsightIndicatorTileLocations | Locations / LOCATIONS | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 27 control attributes, 19 events, and 39 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40572 | 51439 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40573 | 51439 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40574 | 51448 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40575 | 51449 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40576 | 51454 / ListPaneMenuActionAdjust | data-formId | Y / Y / N | 8 / 0 |
| 40577 | 51454 / ListPaneMenuActionAdjust | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40578 | 51455 / ListPaneMenuActionTransfer | data-formId | Y / Y / N | 8 / 0 |
| 40579 | 51455 / ListPaneMenuActionTransfer | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40580 | 51456 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 40581 | 51456 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 40582 | 51457 / SearchPaneComp | data-dbcolumn | Y / Y / N | 14 / 0 |
| 40583 | 51458 / BasicCriteriaItemClass | data-dbcolumn | Y / Y / N | 20 / 0 |
| 40584 | 51459 / BasicCriteriaLocation | data-dbcolumn | Y / Y / N | 16 / 0 |
| 40585 | 51459 / BasicCriteriaLocation | Lookup | Y / Y / N | 70 / 0 |
| 40586 | 51460 / BasicCriteriaLocationType | data-dbcolumn | Y / Y / N | 26 / 0 |
| 40587 | 51461 / BasicCriteriaLocatingZone | data-dbcolumn | Y / Y / N | 26 / 0 |
| 40588 | 51462 / BasicCriteriaConvQtyUM | data-dbcolumn | Y / Y / N | 32 / 0 |
| 40589 | 51463 / BasicCriteriaConvUMMovClass | data-dbcolumn | Y / Y / N | 54 / 0 |
| 40590 | 51464 / BasicCriteriaLocMovClass | data-dbcolumn | Y / Y / N | 46 / 0 |
| 40591 | 51465 / BasicCriteriaDueDateRange | data-dbcolumn | Y / Y / N | 30 / 0 |
| 40592 | 51466 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 40593 | 51466 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40594 | 51468 / ListPaneSummaryTotalQty | data-aggregateClause | Y / Y / Y | 38 / 0 |
| 40595 | 51469 / ListPaneSummaryNoOfHits | data-aggregateClause | Y / Y / Y | 38 / 0 |
| 40596 | 51471 / ListPaneDataGrid | data-dbtable | Y / Y / N | 56 / 0 |
| 40597 | 51471 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 18 / 0 |
| 40598 | 51478 / MovementClassInsightIndicatorTileLocations | data-indicatorTileGoToInsight | Y / Y / Y | 220 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17933 / click | 51440 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 17934 / click | 51441 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17935 / click | 51443 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 17936 / click | 51444 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17937 / click | 51445 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 17938 / click | 51446 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 17939 / click | 51447 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 17940 / click | 51448 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17941 / click | 51449 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17942 / click | 51450 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 17943 / click | 51451 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 17944 / click | 51452 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 17945 / click | 51453 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 17946 / click | 51454 / ListPaneMenuActionAdjust | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17947 / click | 51455 / ListPaneMenuActionTransfer | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17948 / iggridrequesterror | 51471 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 17949 / iggriddatabound | 51471 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 17950 / iggridselectionrowselectionchanged | 51471 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 17951 / iggridselectionactiverowchanged | 51471 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 26314 / 17933 | GETServiceURL | Y / Y | 76 |
| 26315 / 17933 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 26316 / 17933 | queryParameter_Function_UserName | Y / Y | 44 |
| 26317 / 17933 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26318 / 17933 | POSTServiceURL | Y / Y | 74 |
| 26319 / 17933 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 26320 / 17933 | PostData_Function_UserName | Y / Y | 44 |
| 26321 / 17933 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26322 / 17933 | PostData_Function_SearchValue | Y / Y | 98 |
| 26323 / 17933 | Post_SuccessCallback | Y / Y | 114 |
| 26324 / 17933 | ModalDialogName | Y / Y | 42 |
| 26325 / 17934 | ModalDialogName | Y / Y | 42 |
| 26326 / 17935 | POSTServiceURL | Y / Y | 144 |
| 26327 / 17935 | Form_Id | Y / Y | 8 |
| 26328 / 17935 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26329 / 17935 | PostData_Function_SearchValue | Y / Y | 98 |
| 26330 / 17935 | Post_SuccessCallback | Y / Y | 114 |
| 26331 / 17935 | ModalDialogName | Y / Y | 56 |
| 26332 / 17936 | ModalDialogName | Y / Y | 56 |
| 26333 / 17940 | ModalDialogName | Y / Y | 42 |
| 26334 / 17941 | ModalDialogName | Y / Y | 56 |
| 26335 / 17946 | URL | Y / Y | 200 |
| 26336 / 17946 | queryParameter_Item | Y / Y | 8 |
| 26337 / 17946 | queryParameter_Company | Y / Y | 14 |
| 26338 / 17946 | queryParameter_Grid_DetailPaneDetailsReferenceInfo_Warehouse | Y / Y | 18 |
| 26339 / 17947 | URL | Y / Y | 196 |
| 26340 / 17947 | queryParameter_Item | Y / Y | 8 |
| 26341 / 17947 | queryParameter_Company | Y / Y | 14 |
| 26342 / 17947 | queryParameter_Grid_DetailPaneDetailsReferenceInfo_Warehouse | Y / Y | 18 |
| 26343 / 17951 | POSTServiceURL | Y / Y | 74 |
| 26344 / 17951 | PostData_ObjectId | Y / Y | 16 |
| 26345 / 17951 | PostData_Item | Y / Y | 8 |
| 26346 / 17951 | PostData_Company | Y / Y | 14 |
| 26347 / 17951 | PostData_Location | Y / Y | 16 |
| 26348 / 17951 | PostData_Warehouse | Y / Y | 18 |
| 26349 / 17951 | PostData_NumberOfHits | Y / Y | 24 |
| 26350 / 17951 | PostData_storedProcedure | Y / Y | 50 |
| 26351 / 17951 | EnableAction_ListPaneMenuActionAdjust | Y / Y | 26 |
| 26352 / 17951 | EnableAction_ListPaneMenuActionTransfer | Y / Y | 26 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 27 selected candidate rows for this Screen: **27 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40574 | 51448 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40575 | 51449 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40576 | 51454 / Not applicable | data-formId | form_id | 2772 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40577 | 51454 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40578 | 51455 / Not applicable | data-formId | form_id | 2775 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40579 | 51455 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40580 | 51456 / Not applicable | data-dbcolumn | database_identifier | Item | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40582 | 51457 / Not applicable | data-dbcolumn | database_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40583 | 51458 / Not applicable | data-dbcolumn | database_identifier | ITEM_CLASS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40584 | 51459 / Not applicable | data-dbcolumn | database_identifier | LOCATION | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40586 | 51460 / Not applicable | data-dbcolumn | database_identifier | LOCATION_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40587 | 51461 / Not applicable | data-dbcolumn | database_identifier | LOCATING_ZONE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40588 | 51462 / Not applicable | data-dbcolumn | database_identifier | CONVERTED_QTY_UM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40589 | 51463 / Not applicable | data-dbcolumn | database_identifier | CONVERTED_UM_MOVEMENT_CLASS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40590 | 51464 / Not applicable | data-dbcolumn | database_identifier | LOCATION_MOVEMENT_CLASS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40591 | 51465 / Not applicable | data-dbcolumn | database_identifier | DATE_TIME_STAMP | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40593 | 51466 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40596 | 51471 / Not applicable | data-dbtable | database_identifier | MOVEMENT_CLASS_ANALYSIS_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26314 | 51440 / 17933 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26318 | 51440 / 17933 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26323 | 51440 / 17933 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26326 | 51443 / 17935 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26330 | 51443 / 17935 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26338 | 51454 / 17946 | queryParameter_Grid_DetailPaneDetailsReferenceInfo_Warehouse | grid_field_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26342 | 51455 / 17947 | queryParameter_Grid_DetailPaneDetailsReferenceInfo_Warehouse | grid_field_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26343 | 51471 / 17951 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26350 | 51471 / 17951 | PostData_storedProcedure | stored_procedure_identifier | MCA_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
