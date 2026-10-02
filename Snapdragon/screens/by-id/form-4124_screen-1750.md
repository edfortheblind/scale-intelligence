# Intraday Labor Progress — Form 4124, Screen 1750

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime attempted; error or unresolved result. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4124 |
| MAIN_UI_SCREEN Object ID | 1750 |
| Label / Form resource key | Intraday Labor Progress / MNU_INTRADAYLABORPROGRESSINSIGHT |
| Functional area code | 90 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/4124 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/4124 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4124 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | Not populated |
| Help page reference | labor_Intraday_Labor_Progress.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4124 |
| Inspection time (UTC) | 2026-10-02T15:30:49.885Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_INTRADAYLABORPROGRESSINSIGHT |
| Observed configured table/view | Not populated |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1750 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:15:00.895Z | application_access_error; runtime_inspection | https://trav.manhscale.com/scale/General/Error?error=MSG_SECURITYVIOLATION02&formId=4124; Security Access Violation | [runtime-root.json](../../evidence/runtime-root.json) |

**Recorded error/result:** - generic: "The specified screen is not licensed for use in Manhattan SCALE. Use the navigation bar menu to proceed to a screen you have access to. Screen: Intraday Labor Progress."

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Intraday Labor Progress is recorded as `insight`. Its saved configuration contains 4 parts, 9 groups, 9 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4226 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4227 / InsightMenuPane | Not populated / Not populated | 10 / 3000 | Y / Y / N | Not populated |
| 4228 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4229 / CrudDataPane | Not populated / Not populated | 10 / 8000 | Y / Y / N | Not populated |

### Part 4226: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17537 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17537; default=None |
| 17538 / SaveSearchModalDialogHeader | 17537 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17537; default=None |
| 17539 / SaveSearchModalDialogBody | 17537 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17537; default=None |
| 17540 / SaveSearchModalDialogFooter | 17537 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17537; default=None |

#### Group 17539: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50649 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17540: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50650 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50651 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4227: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17541 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17541; default=None |
| 17542 / InsightMenuPanel | 17541 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=17541; default=None |
| 17543 / InsightMenuFavoritesDropdown | 17541 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=17541; default=None |

#### Group 17542: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50652 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 50653 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 50654 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4228: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17544 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17544; default=None |
| 17545 / SearchPaneFilterCriteria | 17544 | Filter Criteria / FILTERCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=17544; default=None |

#### Group 17545: SearchPaneFilterCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50655 / FilterCriteriaActivityType | Activity Type / ACTIVITYTYPE | 280 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50656 / FilterCriteriaWorkGroup | Work Group / WORKGROUP | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50657 / SearchPaneWhs | Warehouse / WAREHOUSE | 80 / 3000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4229: CrudDataPane

No groups associated in the saved extraction.

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 7 control attributes, 5 events, and 13 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 39781 | 50649 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 39782 | 50649 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 39783 | 50654 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 39784 | 50655 / FilterCriteriaActivityType | data-dbcolumn | Y / Y / N | 26 / 0 |
| 39785 | 50656 / FilterCriteriaWorkGroup | data-dbcolumn | Y / Y / N | 20 / 0 |
| 39786 | 50657 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 39787 | 50657 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17474 / click | 50650 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 17475 / click | 50651 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17476 / click | 50652 / InsightMenuApply | _webUi.intraDayLaborProgressInsight.searchButtonClickedForLaborMonitoring | Not populated | Y / Y |
| 17477 / click | 50653 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 17478 / click | 50654 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 25320 / 17474 | GETServiceURL | Y / Y | 76 |
| 25321 / 17474 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 25322 / 17474 | queryParameter_Function_UserName | Y / Y | 44 |
| 25323 / 17474 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25324 / 17474 | POSTServiceURL | Y / Y | 74 |
| 25325 / 17474 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 25326 / 17474 | PostData_Function_UserName | Y / Y | 44 |
| 25327 / 17474 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25328 / 17474 | PostData_Function_SearchValue | Y / Y | 98 |
| 25329 / 17474 | Post_SuccessCallback | Y / Y | 114 |
| 25330 / 17474 | ModalDialogName | Y / Y | 42 |
| 25331 / 17475 | ModalDialogName | Y / Y | 42 |
| 25332 / 17478 | ModalDialogName | Y / Y | 42 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 7 selected candidate rows for this Screen: **7 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 39783 | 50654 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39784 | 50655 / Not applicable | data-dbcolumn | database_identifier | ACTIVITY_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39785 | 50656 / Not applicable | data-dbcolumn | database_identifier | WORK_GROUP | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39787 | 50657 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25320 | 50650 / 17474 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25324 | 50650 / 17474 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25329 | 50650 / 17474 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
