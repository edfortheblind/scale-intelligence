# Labor Activity Insight — Form 3050, Screen 1768

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime attempted; error or unresolved result. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3050 |
| MAIN_UI_SCREEN Object ID | 1768 |
| Label / Form resource key | Labor Activity Insight / MNU_LABORINSIGHT |
| Functional area code | 90 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/3050 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/3050 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3050 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_LABOR_ACTIVITY_VIEW |
| Help page reference | laborActivityInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3050 |
| Inspection time (UTC) | 2026-10-02T15:26:04.325Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_LABORINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_LABOR_ACTIVITY_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1768 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:14:52.053Z | application_access_error; runtime_inspection | https://trav.manhscale.com/scale/General/Error?error=MSG_SECURITYVIOLATION02&formId=3050; Security Access Violation | [runtime-root.json](../../evidence/runtime-root.json) |

**Recorded error/result:** - generic: "The specified screen is not licensed for use in Manhattan SCALE. Use the navigation bar menu to proceed to a screen you have access to. Screen: Labor Activity Insight."

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Labor Activity Insight is recorded as `insight`. Its saved configuration contains 6 parts, 21 groups, 42 controls, and 35 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4324 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4325 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4326 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4327 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4328 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4329 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4324: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17868 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17868; default=None |
| 17869 / SaveSearchModalDialogHeader | 17868 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17868; default=None |
| 17870 / SaveSearchModalDialogBody | 17868 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17868; default=None |
| 17871 / SaveSearchModalDialogFooter | 17868 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17868; default=None |

#### Group 17870: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51277 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17871: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51278 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51279 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4325: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17872 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17872; default=None |
| 17873 / GadgetCalculationQueryDialogHeader | 17872 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17872; default=None |
| 17874 / GadgetCalculationQueryDialogBody | 17872 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17872; default=None |
| 17875 / GadgetCalculationQueryDialogFooter | 17872 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17872; default=None |

#### Group 17874: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51280 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17875: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51281 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51282 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4326: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17876 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17876; default=None |
| 17877 / InsightMenuPanel | 17876 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=17876; default=None |
| 17878 / InsightMenuFavoritesDropdown | 17876 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=17876; default=None |
| 17879 / InsightListPaneMenuPanel | 17876 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17876; default=None |
| 17880 / MenuExportToExcelPanel | 17876 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=17876; default=None |
| 17881 / InsightMenuActionsDropdown | 17876 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=17876; default=None |

#### Group 17877: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51283 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51284 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51285 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51286 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17879: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51287 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51288 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 51289 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51290 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 17880: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51291 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 17881: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51292 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 51293 / ListPaneMenuActionView | View / VIEW | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 51294 / ListPaneMenuActionDelete | Delete / DELETE | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 51295 / ListPaneMenuActionManualMassLaborEntry | Indirect Labor Workbench / MNU_INDIRECTLABORWORKBENCHTRANSACTION | 150 / 1500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=MNU_INDIRECTLABORWORKBENCHTRANSACTION |
| 51296 / ListPaneMenuActionManualLaborEntry | Manual Labor Entry / MANUALLABORENTRY | 150 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=MANUALLABORENTRY |

### Part 4327: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17882 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17882; default=None |
| 17883 / SearchPaneBasicCriteria | 17882 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=17882; default=None |
| 17884 / SearchPaneWorkCriteria | 17882 | Work Criteria / WORKCRITERIA | 50 / 11000 | Y / Y | Fixed to top=N; loading=0; nested unit=17882; default=None |
| 17885 / SearchPaneAdvancedCriteria | 17882 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=17882; default=None |

#### Group 17883: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51297 / BasicCriteriaActivityType | Activity Type / ACTIVITYTYPE | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51298 / BasicCriteriaUsername | Username / USERNAME | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51299 / BasicCriteriaLaborGroup | Labor Group / LABORGROUP | 80 / 3000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51300 / BasicCriteriaLaborType | Labor Type / LABORTYPE | 80 / 5000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51301 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 6000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51302 / BasicCriteriaItem | Item / ITEM | 10 / 7000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51303 / SearchPaneComp | Company / COMPANY | 280 / 8000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51304 / BasicCriteriaDeviceType | Device Type / DEVICETYPE | 80 / 9000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51305 / BasicCriteriaReferenceId | Reference ID / REFERENCEID | 10 / 10000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51306 / BasicCriteriaActivityDateTimeRange | Activity Date Time / ACTIVITYDATETIME | 190 / 11000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17884: SearchPaneWorkCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51307 / BasicCriteriaEquipmentType | Equipment Type / EQUIPMENTTYPE | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51308 / SearchPaneWorkTeam | Work Team / WORKTEAM | 80 / 3000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51309 / BasicCriteriaWorkUnit | Work Unit / WORKUNIT | 10 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17885: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51310 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4328: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17886 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17886; default=None |
| 17887 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17887; default=None |

#### Group 17886: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51311 / ListPaneSummaryUsers | Users / USERS | 50 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51312 / ListPaneSummaryTotalQuantity | Total Quantity / TOTALQUANTITY | 50 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51313 / ListPaneSummaryTotalTime | Total Time / TOTALTIME | 50 / 7500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51314 / ListPaneSummaryAverageRate | Average Rate / AVERAGERATE | 50 / 10000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17887: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51315 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51315 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18294 / Not populated | INTERNAL_DETAIL_NUM / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18284 / InternalDetailNumber | Not populated / Internal Line Number / INTERNALDETAILNUM | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18263 / ActivityType | Not populated / Activity Type / ACTIVITYTYPE | 10 / 10 / 500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18265 / StartDateTime | Not populated / Start Date Time / STARTDATETIME | 30 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18266 / EndDateTime | Not populated / End Date Time / ENDDATETIME | 30 / 10 / 1500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18267 / TotalActualTime | Not populated / Total Actual Time / TOTALACTUALTIME | 10 / 10 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18268 / ActualRate | Not populated / Actual Rate (Per Min) / ACTUALRATE | 20 / 10 / 2500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18269 / UserName | Not populated / Username / USERNAME | 10 / 10 / 3000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18270 / ActivityScreen | Not populated / Activity Screen / ACTIVITYSCREEN | 10 / 10 / 3500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18271 / LaborGroup | Not populated / Labor Group / LABORGROUP | 10 / 10 / 4000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18272 / COLOR | Not populated / Color / COLOR | 10 / 10 / 4500 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18273 / WorkTeam | Not populated / Work Team / WORKTEAM | 10 / 10 / 5000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18274 / WorkGroup | Not populated / Work Group / WORKGROUP | 10 / 10 / 5500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18275 / EquipmentType | Not populated / Equipment Type / EQUIPMENTTYPE | 10 / 10 / 6000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18276 / GoalQuantity | Not populated / Goal Quantity / GOALQUANTITY | 20 / 10 / 6500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18277 / PercentOfGoal | Not populated / Percent of Goal / PERCENTOFGOAL | 20 / 10 / 7000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=10; DATA_SOURCE_TYPE=None |
| 18278 / Warehouse | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 7500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18279 / Item | Not populated / Item / ITEM | 10 / 10 / 8000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18280 / Company | Not populated / Company / COMPANY | 10 / 10 / 8500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18281 / TotalLaborCost | Not populated / Total Labor Cost / TOTALLABORCOST | 20 / 10 / 9500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=40; DATA_SOURCE_TYPE=None |
| 18282 / DeviceType | Not populated / Device Type / DEVICETYPE | 10 / 10 / 10000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18283 / Manual | Not populated / Manual / MANUAL | 40 / 10 / 10500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18285 / WaveNumber | Not populated / Wave Number / WAVENUM | 10 / 10 / 11500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18286 / LaborType | Not populated / Labor Type / LABORTYPE | 10 / 10 / 12000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18287 / WorkUnit | Not populated / Work Unit / WORKUNIT | 10 / 10 / 12500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18288 / ReferenceId | Not populated / Reference ID / REFERENCEID | 10 / 10 / 13000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18289 / TotalQuantity | Not populated / Total Quantity / TOTALQUANTITY | 20 / 10 / 13500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18290 / QuantityUm | Not populated / Quantity UM / QUANTITYUM | 10 / 10 / 14000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18291 / FromLocation | Not populated / From Location / FROMLOCATION | 10 / 10 / 14500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18292 / ToLocation | Not populated / To Location / TOLOCATION | 10 / 10 / 15000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18293 / ICON | Not populated / Icon / ICON | 10 / 10 / 15500 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18264 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 15510 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18295 / Consolidated | Not populated / Consolidated / CONSOLIDATED | 40 / 10 / 16000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18296 / WarehouseDay | Not populated / Warehouse Day / WAREHOUSEDAY | 30 / 10 / 16500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18297 / Shift | Not populated / Shift / SHIFT | 10 / 10 / 17000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4329: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17888 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17888; default=None |

#### Group 17888: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51316 / DetailPaneHeaderActivityScreen | Not populated / Not populated | 30 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=586; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51317 / DetailPaneHeaderActivityType | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=586; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51318 / DetailPaneHeaderUserName | Not populated / Not populated | 30 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=586; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 40 control attributes, 22 events, and 35 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40423 | 51277 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40424 | 51277 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40425 | 51286 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40426 | 51287 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40427 | 51292 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 40428 | 51292 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40429 | 51293 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 40430 | 51294 / ListPaneMenuActionDelete | data-formId | Y / Y / N | 8 / 0 |
| 40431 | 51294 / ListPaneMenuActionDelete | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40432 | 51294 / ListPaneMenuActionDelete | data-divider | Y / Y / N | 8 / 0 |
| 40433 | 51295 / ListPaneMenuActionManualMassLaborEntry | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40434 | 51295 / ListPaneMenuActionManualMassLaborEntry | data-formId | Y / Y / N | 8 / 0 |
| 40435 | 51295 / ListPaneMenuActionManualMassLaborEntry | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40436 | 51296 / ListPaneMenuActionManualLaborEntry | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40437 | 51296 / ListPaneMenuActionManualLaborEntry | data-formId | Y / Y / N | 8 / 0 |
| 40438 | 51296 / ListPaneMenuActionManualLaborEntry | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40439 | 51297 / BasicCriteriaActivityType | data-dbcolumn | Y / Y / N | 26 / 0 |
| 40440 | 51298 / BasicCriteriaUsername | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40441 | 51299 / BasicCriteriaLaborGroup | data-dbcolumn | Y / Y / N | 22 / 0 |
| 40442 | 51300 / BasicCriteriaLaborType | data-dbcolumn | Y / Y / N | 20 / 0 |
| 40443 | 51301 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 40444 | 51301 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40445 | 51302 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 40446 | 51302 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 40447 | 51303 / SearchPaneComp | data-dbcolumn | Y / Y / N | 14 / 0 |
| 40448 | 51304 / BasicCriteriaDeviceType | data-dbcolumn | Y / Y / N | 22 / 0 |
| 40449 | 51305 / BasicCriteriaReferenceId | data-dbcolumn | Y / Y / N | 24 / 0 |
| 40450 | 51306 / BasicCriteriaActivityDateTimeRange | data-dbcolumn | Y / Y / N | 30 / 0 |
| 40451 | 51306 / BasicCriteriaActivityDateTimeRange | allowTodayOnlySelection | Y / Y / Y | 8 / 0 |
| 40452 | 51307 / BasicCriteriaEquipmentType | data-dbcolumn | Y / Y / N | 28 / 0 |
| 40453 | 51308 / SearchPaneWorkTeam | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40454 | 51309 / BasicCriteriaWorkUnit | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40455 | 51309 / BasicCriteriaWorkUnit | Lookup | Y / Y / N | 80 / 1 |
| 40456 | 51311 / ListPaneSummaryUsers | data-aggregateClause | Y / Y / Y | 50 / 0 |
| 40457 | 51312 / ListPaneSummaryTotalQuantity | data-aggregateClause | Y / Y / Y | 38 / 0 |
| 40458 | 51313 / ListPaneSummaryTotalTime | data-aggregateClause | Y / Y / Y | 28 / 0 |
| 40459 | 51314 / ListPaneSummaryAverageRate | data-aggregateClause | Y / Y / Y | 158 / 0 |
| 40460 | 51315 / ListPaneDataGrid | data-dbtable | Y / Y / N | 72 / 0 |
| 40461 | 51315 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 44 / 0 |
| 40462 | 51315 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 22 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17839 / click | 51278 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 17840 / click | 51279 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17841 / click | 51281 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 17842 / click | 51282 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17843 / click | 51283 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 17844 / click | 51284 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 17845 / click | 51285 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 17846 / click | 51286 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17847 / click | 51287 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17848 / click | 51288 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 17849 / click | 51289 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 17850 / click | 51290 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 17851 / click | 51291 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 17852 / click | 51292 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17853 / click | 51293 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17854 / click | 51294 / ListPaneMenuActionDelete | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 17855 / click | 51295 / ListPaneMenuActionManualMassLaborEntry | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17856 / click | 51296 / ListPaneMenuActionManualLaborEntry | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17857 / iggridrequesterror | 51315 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 17858 / iggriddatabound | 51315 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 17859 / iggridselectionrowselectionchanged | 51315 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 17860 / iggridselectionactiverowchanged | 51315 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 26121 / 17839 | GETServiceURL | Y / Y | 76 |
| 26122 / 17839 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 26123 / 17839 | queryParameter_Function_UserName | Y / Y | 44 |
| 26124 / 17839 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26125 / 17839 | POSTServiceURL | Y / Y | 74 |
| 26126 / 17839 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 26127 / 17839 | PostData_Function_UserName | Y / Y | 44 |
| 26128 / 17839 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26129 / 17839 | PostData_Function_SearchValue | Y / Y | 98 |
| 26130 / 17839 | Post_SuccessCallback | Y / Y | 114 |
| 26131 / 17839 | ModalDialogName | Y / Y | 42 |
| 26132 / 17840 | ModalDialogName | Y / Y | 42 |
| 26133 / 17841 | POSTServiceURL | Y / Y | 144 |
| 26134 / 17841 | Form_Id | Y / Y | 8 |
| 26135 / 17841 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26136 / 17841 | PostData_Function_SearchValue | Y / Y | 98 |
| 26137 / 17841 | Post_SuccessCallback | Y / Y | 114 |
| 26138 / 17841 | ModalDialogName | Y / Y | 56 |
| 26139 / 17842 | ModalDialogName | Y / Y | 56 |
| 26140 / 17846 | ModalDialogName | Y / Y | 42 |
| 26141 / 17847 | ModalDialogName | Y / Y | 56 |
| 26142 / 17852 | URL | Y / Y | 152 |
| 26143 / 17853 | URL | Y / Y | 152 |
| 26144 / 17854 | ConfirmationMessageCode | Y / Y | 34 |
| 26145 / 17854 | POSTServiceURL | Y / Y | 98 |
| 26146 / 17854 | PostData_Grid_ListPaneDataGrid_InternalDetailNumber | Y / Y | 40 |
| 26147 / 17854 | Post_SuccessCallback | Y / Y | 140 |
| 26148 / 17855 | URL | Y / Y | 94 |
| 26149 / 17856 | URL | Y / Y | 58 |
| 26150 / 17860 | POSTServiceURL | Y / Y | 74 |
| 26151 / 17860 | PostData_InternalDetailNumber | Y / Y | 40 |
| 26152 / 17860 | PostData_storedProcedure | Y / Y | 48 |
| 26153 / 17860 | EnableAction_ListPaneMenuActionEdit | Y / Y | 48 |
| 26154 / 17860 | EnableAction_ListPaneMenuActionView | Y / Y | 48 |
| 26155 / 17860 | EnableAction_ListPaneMenuActionDelete | Y / Y | 48 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 36 selected candidate rows for this Screen: **36 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40425 | 51286 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40426 | 51287 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40427 | 51292 / Not applicable | data-formId | form_id | 4053 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40428 | 51292 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40429 | 51293 / Not applicable | data-formId | form_id | 4053 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40430 | 51294 / Not applicable | data-formId | form_id | 4053 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40431 | 51294 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40434 | 51295 / Not applicable | data-formId | form_id | 4116 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40435 | 51295 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40437 | 51296 / Not applicable | data-formId | form_id | 3053 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40438 | 51296 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40439 | 51297 / Not applicable | data-dbcolumn | database_identifier | ACTIVITY_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40440 | 51298 / Not applicable | data-dbcolumn | database_identifier | USER_NAME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40441 | 51299 / Not applicable | data-dbcolumn | database_identifier | LABOR_GROUP | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40442 | 51300 / Not applicable | data-dbcolumn | database_identifier | LABOR_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40444 | 51301 / Not applicable | data-dbcolumn | database_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40445 | 51302 / Not applicable | data-dbcolumn | database_identifier | Item | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40447 | 51303 / Not applicable | data-dbcolumn | database_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40448 | 51304 / Not applicable | data-dbcolumn | database_identifier | DEVICE_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40449 | 51305 / Not applicable | data-dbcolumn | database_identifier | REFERENCE_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40450 | 51306 / Not applicable | data-dbcolumn | database_identifier | START_DATE_TIME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40452 | 51307 / Not applicable | data-dbcolumn | database_identifier | EQUIPMENT_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40453 | 51308 / Not applicable | data-dbcolumn | database_identifier | WORK_TEAM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40454 | 51309 / Not applicable | data-dbcolumn | database_identifier | Work_Unit | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40460 | 51315 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_LABOR_ACTIVITY_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26121 | 51278 / 17839 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26125 | 51278 / 17839 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26130 | 51278 / 17839 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26133 | 51281 / 17841 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26137 | 51281 / 17841 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26144 | 51294 / 17854 | ConfirmationMessageCode | resource_code | MSG_LABORDETAIL03 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26145 | 51294 / 17854 | POSTServiceURL | relative_api_path | /general/scaleapi/LaborApi/LaborActivity-Deleted? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26146 | 51294 / 17854 | PostData_Grid_ListPaneDataGrid_InternalDetailNumber | grid_field_identifier | InternalDetailNumber | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26147 | 51294 / 17854 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26150 | 51315 / 17860 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26152 | 51315 / 17860 | PostData_storedProcedure | stored_procedure_identifier | LA_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
