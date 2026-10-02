# Employee Scorecard — Form 4097, Screen 1743

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime attempted; error or unresolved result. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4097 |
| MAIN_UI_SCREEN Object ID | 1743 |
| Label / Form resource key | Employee Scorecard / MNU_EMPLOYEESCORECARDINSIGHT |
| Functional area code | 90 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/4097 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/4097 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4097 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | Not populated |
| Help page reference | labor_Employee_Scorecard.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4097 |
| Inspection time (UTC) | 2026-10-02T15:30:21.720Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_EMPLOYEESCORECARDINSIGHT |
| Observed configured table/view | Not populated |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1743 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:14:58.728Z | application_access_error; runtime_inspection | https://trav.manhscale.com/scale/General/Error?error=MSG_SECURITYVIOLATION02&formId=4097; Security Access Violation | [runtime-root.json](../../evidence/runtime-root.json) |

**Recorded error/result:** - generic: "The specified screen is not licensed for use in Manhattan SCALE. Use the navigation bar menu to proceed to a screen you have access to. Screen: Employee Scorecard."

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Employee Scorecard is recorded as `insight`. Its saved configuration contains 4 parts, 9 groups, 20 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4210 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4211 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4212 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4213 / CrudDataPane | Not populated / Not populated | 10 / 8000 | Y / Y / N | Not populated |

### Part 4210: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17482 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17482; default=None |
| 17483 / SaveSearchModalDialogHeader | 17482 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17482; default=None |
| 17484 / SaveSearchModalDialogBody | 17482 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17482; default=None |
| 17485 / SaveSearchModalDialogFooter | 17482 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17482; default=None |

#### Group 17484: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50497 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17485: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50498 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50499 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4211: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17486 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17486; default=None |
| 17487 / InsightMenuPanel | 17486 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=17486; default=None |
| 17488 / InsightMenuFavoritesDropdown | 17486 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=17486; default=None |

#### Group 17487: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50500 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 50501 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 50502 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4212: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17489 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17489; default=None |
| 17490 / SearchPaneFilterCriteria | 17489 | Filter Criteria / FILTERCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=17489; default=None |

#### Group 17490: SearchPaneFilterCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50504 / FilterCriteriaUsername | Employee / EMPLOYEE | 280 / 0 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50505 / FilterCriteriaDepartment | Department / DEPARTMENT | 280 / 100 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50506 / FilterCriteriaSupervisor | Supervisor / SUPERVISOR | 280 / 200 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50507 / FilterCriteriaActivityType | Activity Type / ACTIVITYTYPE | 280 / 300 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50516 / FilterCriteriaDate | Warehouse Day / WAREHOUSEDAY | 110 / 360 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50508 / FilterCriteriaShift | Shift / SHIFT | 280 / 400 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50509 / FilterCriteriaWorkGroup | Not populated / WorkGroup | 280 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50510 / FilterCriteriaFromUtlizationPercent | From Utilization % / FROMUTILIZATIONPERCENT | 90 / 15250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50511 / FilterCriteriaToUtlizationPercent | To Utlization % / TOUTILIZATIONPERCENT | 90 / 15350 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50512 / FilterCriteriaFromThroughPercent | From Throughput % / FROMTHROUGHPUTPERCENT | 90 / 15400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50513 / FilterCriteriaToThroughputPercent | To Throughput % / TOTHROUGHPUTPERCENT | 90 / 15450 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50514 / FilterCriteriaFromThroughput | From Throughput / FROMTHROUGHPUT | 90 / 15500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50515 / FilterCriteriaToThroughput | To Throughput / TOTHROUGHPUT | 90 / 15550 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50503 / SearchPaneWhs | Warehouse / WAREHOUSE | 80 / 26000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4213: CrudDataPane

No groups associated in the saved extraction.

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 26 control attributes, 5 events, and 13 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 39715 | 50497 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 39716 | 50497 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 39717 | 50502 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 39720 | 50504 / FilterCriteriaUsername | data-dbcolumn | Y / Y / N | 18 / 0 |
| 39721 | 50505 / FilterCriteriaDepartment | data-dbcolumn | Y / Y / N | 20 / 0 |
| 39722 | 50506 / FilterCriteriaSupervisor | data-dbcolumn | Y / Y / N | 20 / 0 |
| 39723 | 50507 / FilterCriteriaActivityType | data-dbcolumn | Y / Y / N | 26 / 0 |
| 39738 | 50516 / FilterCriteriaDate | data-dbcolumn | Y / Y / N | 26 / 0 |
| 39739 | 50516 / FilterCriteriaDate | data-dateOnly | Y / Y / Y | 8 / 0 |
| 39740 | 50516 / FilterCriteriaDate | data-defaultTopLabel | Y / Y / N | 8 / 0 |
| 39724 | 50508 / FilterCriteriaShift | data-dbcolumn | Y / Y / N | 10 / 0 |
| 39725 | 50509 / FilterCriteriaWorkGroup | data-dbcolumn | Y / Y / N | 20 / 0 |
| 39726 | 50510 / FilterCriteriaFromUtlizationPercent | data-dbcolumn | Y / Y / N | 48 / 0 |
| 39727 | 50510 / FilterCriteriaFromUtlizationPercent | nullable | Y / Y / Y | 8 / 0 |
| 39728 | 50511 / FilterCriteriaToUtlizationPercent | data-dbcolumn | Y / Y / N | 44 / 0 |
| 39729 | 50511 / FilterCriteriaToUtlizationPercent | nullable | Y / Y / Y | 8 / 0 |
| 39730 | 50512 / FilterCriteriaFromThroughPercent | data-dbcolumn | Y / Y / N | 46 / 0 |
| 39731 | 50512 / FilterCriteriaFromThroughPercent | nullable | Y / Y / Y | 8 / 0 |
| 39732 | 50513 / FilterCriteriaToThroughputPercent | data-dbcolumn | Y / Y / N | 42 / 0 |
| 39733 | 50513 / FilterCriteriaToThroughputPercent | nullable | Y / Y / Y | 8 / 0 |
| 39734 | 50514 / FilterCriteriaFromThroughput | data-dbcolumn | Y / Y / N | 30 / 0 |
| 39735 | 50514 / FilterCriteriaFromThroughput | nullable | Y / Y / Y | 8 / 0 |
| 39736 | 50515 / FilterCriteriaToThroughput | data-dbcolumn | Y / Y / N | 26 / 0 |
| 39737 | 50515 / FilterCriteriaToThroughput | nullable | Y / Y / Y | 8 / 0 |
| 39718 | 50503 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 39719 | 50503 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17441 / click | 50498 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 17442 / click | 50499 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17443 / click | 50500 / InsightMenuApply | _webUi.employeeScorecardInsight.searchButtonClickedForEmpScoreCard | Not populated | Y / Y |
| 17444 / click | 50501 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 17445 / click | 50502 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 25267 / 17441 | GETServiceURL | Y / Y | 76 |
| 25268 / 17441 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 25269 / 17441 | queryParameter_Function_UserName | Y / Y | 44 |
| 25270 / 17441 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25271 / 17441 | POSTServiceURL | Y / Y | 74 |
| 25272 / 17441 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 25273 / 17441 | PostData_Function_UserName | Y / Y | 44 |
| 25274 / 17441 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25275 / 17441 | PostData_Function_SearchValue | Y / Y | 98 |
| 25276 / 17441 | Post_SuccessCallback | Y / Y | 114 |
| 25277 / 17441 | ModalDialogName | Y / Y | 42 |
| 25278 / 17442 | ModalDialogName | Y / Y | 42 |
| 25279 / 17445 | ModalDialogName | Y / Y | 42 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 18 selected candidate rows for this Screen: **18 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 39717 | 50502 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39719 | 50503 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39720 | 50504 / Not applicable | data-dbcolumn | database_identifier | USER_NAME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39721 | 50505 / Not applicable | data-dbcolumn | database_identifier | DEPARTMENT | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39722 | 50506 / Not applicable | data-dbcolumn | database_identifier | SUPERVISOR | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39723 | 50507 / Not applicable | data-dbcolumn | database_identifier | ACTIVITY_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39724 | 50508 / Not applicable | data-dbcolumn | database_identifier | SHIFT | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39725 | 50509 / Not applicable | data-dbcolumn | database_identifier | WORK_GROUP | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39726 | 50510 / Not applicable | data-dbcolumn | database_identifier | FROM_UTILIZATION_PERCENT | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39728 | 50511 / Not applicable | data-dbcolumn | database_identifier | TO_UTILIZATION_PERCENT | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39730 | 50512 / Not applicable | data-dbcolumn | database_identifier | FROM_THROUGHPUT_PERCENT | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39732 | 50513 / Not applicable | data-dbcolumn | database_identifier | TO_THROUGHPUT_PERCENT | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39734 | 50514 / Not applicable | data-dbcolumn | database_identifier | FROM_THROUGHPUT | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39736 | 50515 / Not applicable | data-dbcolumn | database_identifier | TO_THROUGHPUT | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39738 | 50516 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE_DAY | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25267 | 50498 / 17441 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25271 | 50498 / 17441 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25276 | 50498 / 17441 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
