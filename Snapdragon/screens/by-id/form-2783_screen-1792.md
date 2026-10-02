# Transaction History Insight — Form 2783, Screen 1792

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2783 |
| MAIN_UI_SCREEN Object ID | 1792 |
| Label / Form resource key | Transaction History Insight / MNU_TRANSACTIONHISTORYINSIGHT |
| Functional area code | 80 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2783 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2783 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2783 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_TRAN_HIST_VIEW |
| Help page reference | TranHistoryInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2783 |
| Inspection time (UTC) | 2026-10-02T15:24:12.147Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_TRANSACTIONHISTORYINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_TRAN_HIST_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1792 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:14:16.855Z | loaded; runtime_inspection | https://trav.manhscale.com/scale/insights/2783; Transaction History Insight | [runtime-root.json](../../evidence/runtime-root.json) |

**Visible criteria / entry fields:** From Activity Date Time; To Activity Date Time; Transaction Type; Location; Item; Lot; Username; Work Type; Work Team; Work Unit; Warehouse; Company; Internal Key ID; LP / Container ID; Serial Number; Reference ID.

**Visible grid headers:** Field; Operand; Value; Internal ID; Reference ID; Activity Date Time; Transaction Type; Location; Item; Company; Lot; Quantity; Quantity UM; Catch Weight; Catch Weight UM; Direction; Work Type; LP / Container ID; Internal Key ID; Work Unit; Username; Work Team; Equipment Type; Warehouse; Color; Icon.

**Observed action/menu labels:** Actions; View.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Transaction History Insight is recorded as `insight`. Its saved configuration contains 6 parts, 19 groups, 39 controls, and 25 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4473 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4474 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4475 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4476 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4477 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4478 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4473: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18380 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18380; default=None |
| 18381 / SaveSearchModalDialogHeader | 18380 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18380; default=None |
| 18382 / SaveSearchModalDialogBody | 18380 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18380; default=None |
| 18383 / SaveSearchModalDialogFooter | 18380 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18380; default=None |

#### Group 18382: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52291 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18383: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52292 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52293 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4474: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18384 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18384; default=None |
| 18385 / GadgetCalculationQueryDialogHeader | 18384 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18384; default=None |
| 18386 / GadgetCalculationQueryDialogBody | 18384 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18384; default=None |
| 18387 / GadgetCalculationQueryDialogFooter | 18384 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18384; default=None |

#### Group 18386: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52294 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18387: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52295 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52296 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4475: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18388 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18388; default=None |
| 18389 / InsightMenuPanel | 18388 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18388; default=None |
| 18390 / InsightMenuFavoritesDropdown | 18388 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18388; default=None |
| 18391 / InsightListPaneMenuPanel | 18388 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18388; default=None |
| 18392 / MenuExportToExcelPanel | 18388 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18388; default=None |
| 18393 / InsightMenuActionsDropdown | 18388 | Actions / ACTIONS | 80 / 12600 | Y / Y | Fixed to top=N; loading=0; nested unit=18388; default=None |

#### Group 18389: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52297 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 52298 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 52299 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 52300 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18391: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52301 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52302 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 52303 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18392: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52304 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18393: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52305 / ListPaneMenuActionView | View / VIEW | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |

### Part 4476: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18394 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18394; default=None |
| 18395 / SearchPaneBasicCriteria | 18394 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18394; default=None |
| 18396 / SearchPaneAdvancedCriteria | 18394 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=18394; default=None |

#### Group 18395: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52306 / BasicCriteriaActivityDateTimeRange | Activity Date Time / ACTIVITYDATETIME | 190 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52307 / BasicCriteriaTransactionType | Transaction Type / TRANSACTIONTYPE | 80 / 4500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52308 / BasicCriteriaLocation | Location / LOCATION | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52310 / BasicCriteriaItem | Item / ITEM | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52309 / BasicCriteriaLot | Lot / LOT | 10 / 7500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52311 / BasicCriteriaUsername | Username / USERNAME | 80 / 8500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52312 / BasicCriteriaWorkType | Work Type / WORKTYPE | 80 / 9000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52313 / BasicCriteriaWorkTeam | Work Team / WORKTEAM | 80 / 9500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52314 / BasicCriteriaWorkUnit | Work Unit / WORKUNIT | 10 / 9500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52315 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 10000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52316 / SearchPaneComp | Company / COMPANY | 280 / 10500 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52317 / BasicCriteriaInternalKeyId | Internal Key ID / INTERNALKEYID | 10 / 11000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52318 / BasicCriteriaLpContainerId | LP / Container ID / LPCONTAINERID | 10 / 11500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52319 / BasicCriteriaSerialNumber | Serial Number / SERIALNUMBER | 10 / 12000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52320 / BasicCriteriaReferenceId | Reference ID / REFERENCEID | 10 / 12500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18396: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52321 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4477: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18397 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18397; default=None |

#### Group 18397: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52322 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 52322 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18832 / Not populated | INTERNAL_ID / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18831 / InternalId | INTERNAL_ID / Internal ID / INTERNALID | 10 / 10 / 700 / Not populated | Y / Y / N | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18826 / ReferenceId | Not populated / Reference ID / REFERENCEID | 10 / 10 / 800 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18813 / ActivityDateTime | Not populated / Activity Date Time / ACTIVITYDATETIME | 30 / 10 / 900 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18814 / TransactionType | Not populated / Transaction Type / TRANSACTIONTYPE | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18818 / Location | Not populated / Location / LOCATION | 10 / 10 / 1100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18819 / Item | Not populated / Item / ITEM | 10 / 10 / 1200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18820 / Company | Not populated / Company / COMPANY | 10 / 10 / 1300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18821 / Lot | Not populated / Lot / LOT | 10 / 10 / 1400 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18823 / Quantity | Not populated / Quantity / QUANTITY | 20 / 10 / 1500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18824 / QuantityUm | Not populated / Quantity UM / QUANTITYUM | 10 / 10 / 1600 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18809 / CATCH_WEIGHT | Not populated / Catch Weight / CATCH_WEIGHT | 20 / 10 / 1650 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18810 / CATCH_WEIGHT_UM | Not populated / Catch Weight UM / CATCH_WEIGHT_UM | 10 / 10 / 1660 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18815 / Direction | Not populated / Direction / DIRECTION | 10 / 10 / 1700 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18816 / WorkType | Not populated / Work Type / WORKTYPE | 10 / 10 / 1800 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18822 / ContainerId | Not populated / LP / Container ID / LPCONTAINERID | 10 / 10 / 1900 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18825 / InternalKeyId | Not populated / Internal Key ID / INTERNALKEYID | 10 / 10 / 2000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18827 / WorkUnit | Not populated / Work Unit / WORKUNIT | 10 / 10 / 2100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18828 / UserName | Not populated / Username / USERNAME | 10 / 10 / 2200 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18829 / WorkTeam | Not populated / Work Team / WORKTEAM | 10 / 10 / 2300 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18830 / EquipmentType | Not populated / Equipment Type / EQUIPMENTTYPE | 10 / 10 / 2400 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18817 / Warehouse | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 2500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18812 / COLOR | Not populated / Color / COLOR | 10 / 10 / 2550 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18808 / ICON | Not populated / Icon / ICON | 10 / 10 / 2600 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18811 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 2610 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4478: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18398 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18398; default=None |

#### Group 18398: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52323 / DetailPaneHeaderReferenceId | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=611; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52324 / DetailPaneHeaderTransactionType | Not populated / Not populated | 30 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=611; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52325 / DetailPaneHeaderLocation | Not populated / Not populated | 30 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=611; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52326 / DetailPaneHeaderItem | Not populated / Not populated | 30 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=611; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52327 / DetailPaneHeaderItemDesc | Not populated / Not populated | 30 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=611; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52328 / DetailPaneHeaderCompany | Not populated / Not populated | 30 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=611; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52329 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 2250 | N / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=611; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 32 control attributes, 17 events, and 26 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 41426 | 52291 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 41427 | 52291 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 41428 | 52300 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41429 | 52301 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41430 | 52305 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 41431 | 52305 / ListPaneMenuActionView | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41432 | 52306 / BasicCriteriaActivityDateTimeRange | data-dbcolumn | Y / Y / N | 50 / 0 |
| 41433 | 52306 / BasicCriteriaActivityDateTimeRange | allowTodayOnlySelection | Y / Y / Y | 8 / 0 |
| 41434 | 52307 / BasicCriteriaTransactionType | data-dataType | Y / Y / N | 2 / 0 |
| 41435 | 52307 / BasicCriteriaTransactionType | data-dbcolumn | Y / Y / N | 32 / 0 |
| 41436 | 52308 / BasicCriteriaLocation | data-dbcolumn | Y / Y / N | 16 / 0 |
| 41437 | 52308 / BasicCriteriaLocation | Lookup | Y / Y / N | 80 / 1 |
| 41440 | 52310 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 41441 | 52310 / BasicCriteriaItem | Lookup | Y / Y / N | 66 / 0 |
| 41438 | 52309 / BasicCriteriaLot | data-dbcolumn | Y / Y / N | 6 / 0 |
| 41439 | 52309 / BasicCriteriaLot | Lookup | Y / Y / N | 60 / 1 |
| 41442 | 52311 / BasicCriteriaUsername | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41443 | 52312 / BasicCriteriaWorkType | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41444 | 52313 / BasicCriteriaWorkTeam | data-dbcolumn | Y / Y / N | 16 / 0 |
| 41445 | 52314 / BasicCriteriaWorkUnit | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41446 | 52314 / BasicCriteriaWorkUnit | Lookup | Y / Y / N | 84 / 1 |
| 41447 | 52315 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 41448 | 52315 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41449 | 52316 / SearchPaneComp | data-dbcolumn | Y / Y / N | 14 / 0 |
| 41450 | 52317 / BasicCriteriaInternalKeyId | data-dbcolumn | Y / Y / N | 30 / 0 |
| 41451 | 52317 / BasicCriteriaInternalKeyId | Lookup | Y / Y / N | 106 / 1 |
| 41452 | 52318 / BasicCriteriaLpContainerId | data-dbcolumn | Y / Y / N | 24 / 0 |
| 41453 | 52318 / BasicCriteriaLpContainerId | Lookup | Y / Y / N | 104 / 1 |
| 41454 | 52319 / BasicCriteriaSerialNumber | data-dbcolumn | Y / Y / N | 26 / 0 |
| 41455 | 52320 / BasicCriteriaReferenceId | data-dbcolumn | Y / Y / N | 24 / 0 |
| 41456 | 52320 / BasicCriteriaReferenceId | Lookup | Y / Y / N | 94 / 1 |
| 41457 | 52322 / ListPaneDataGrid | data-dbtable | Y / Y / N | 62 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18413 / click | 52292 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18414 / click | 52293 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18415 / click | 52295 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18416 / click | 52296 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18417 / click | 52297 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18418 / click | 52298 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18419 / click | 52299 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18420 / click | 52300 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18421 / click | 52301 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18422 / click | 52302 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18423 / click | 52303 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18424 / click | 52304 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18425 / click | 52305 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18426 / iggridrequesterror | 52322 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18427 / iggriddatabound | 52322 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18428 / iggridselectionrowselectionchanged | 52322 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18429 / iggridselectionactiverowchanged | 52322 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 27291 / 18413 | GETServiceURL | Y / Y | 76 |
| 27292 / 18413 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 27293 / 18413 | queryParameter_Function_UserName | Y / Y | 44 |
| 27294 / 18413 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27295 / 18413 | POSTServiceURL | Y / Y | 74 |
| 27296 / 18413 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 27297 / 18413 | PostData_Function_UserName | Y / Y | 44 |
| 27298 / 18413 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27299 / 18413 | PostData_Function_SearchValue | Y / Y | 98 |
| 27300 / 18413 | Post_SuccessCallback | Y / Y | 114 |
| 27301 / 18413 | ModalDialogName | Y / Y | 42 |
| 27302 / 18414 | ModalDialogName | Y / Y | 42 |
| 27303 / 18415 | POSTServiceURL | Y / Y | 144 |
| 27304 / 18415 | Form_Id | Y / Y | 8 |
| 27305 / 18415 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 27306 / 18415 | PostData_Function_SearchValue | Y / Y | 98 |
| 27307 / 18415 | Post_SuccessCallback | Y / Y | 114 |
| 27308 / 18415 | ModalDialogName | Y / Y | 56 |
| 27309 / 18416 | ModalDialogName | Y / Y | 56 |
| 27310 / 18420 | ModalDialogName | Y / Y | 42 |
| 27311 / 18421 | ModalDialogName | Y / Y | 56 |
| 27312 / 18425 | URL | Y / Y | 112 |
| 27313 / 18429 | POSTServiceURL | Y / Y | 74 |
| 27314 / 18429 | PostData_internalId | Y / Y | 20 |
| 27315 / 18429 | PostData_storedProcedure | Y / Y | 56 |
| 27316 / 18429 | EnableAction_ListPaneMenuActionView | Y / Y | 28 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 27 selected candidate rows for this Screen: **27 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 41428 | 52300 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41429 | 52301 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41430 | 52305 / Not applicable | data-formId | form_id | 4035 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41431 | 52305 / Not applicable | data-securityCheckpoint | checkpoint | 6 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41432 | 52306 / Not applicable | data-dbcolumn | database_identifier | TRANSHISTACTIVITYDATETIME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41435 | 52307 / Not applicable | data-dbcolumn | database_identifier | TRANSACTION_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41436 | 52308 / Not applicable | data-dbcolumn | database_identifier | LOCATION | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41438 | 52309 / Not applicable | data-dbcolumn | database_identifier | LOT | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41440 | 52310 / Not applicable | data-dbcolumn | database_identifier | ITEM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41442 | 52311 / Not applicable | data-dbcolumn | database_identifier | USER_NAME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41443 | 52312 / Not applicable | data-dbcolumn | database_identifier | WORK_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41444 | 52313 / Not applicable | data-dbcolumn | database_identifier | WORKTEAM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41445 | 52314 / Not applicable | data-dbcolumn | database_identifier | WORK_UNIT | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41448 | 52315 / Not applicable | data-dbcolumn | database_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41449 | 52316 / Not applicable | data-dbcolumn | database_identifier | Company | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41450 | 52317 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_KEY_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41452 | 52318 / Not applicable | data-dbcolumn | database_identifier | CONTAINER_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41454 | 52319 / Not applicable | data-dbcolumn | database_identifier | SERIAL_NUMBER | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41455 | 52320 / Not applicable | data-dbcolumn | database_identifier | REFERENCE_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41457 | 52322 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_TRAN_HIST_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27291 | 52292 / 18413 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27295 | 52292 / 18413 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27300 | 52292 / 18413 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27303 | 52295 / 18415 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27307 | 52295 / 18415 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27313 | 52322 / 18429 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27315 | 52322 / 18429 | PostData_storedProcedure | stored_procedure_identifier | TRNHST_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
