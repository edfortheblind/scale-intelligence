# User Activity Insight — Form 3070, Screen 1793

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3070 |
| MAIN_UI_SCREEN Object ID | 1793 |
| Label / Form resource key | User Activity Insight / MNU_USERACTIVITYINSIGHT |
| Functional area code | 120 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/3070 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/3070 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3070 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_USER_ACTIVITY_VIEW |
| Help page reference | useractwin.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3070 |
| Inspection time (UTC) | 2026-10-02T15:26:32.165Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_USERACTIVITYINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_USER_ACTIVITY_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1793 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:13:50.413Z | loaded; runtime_inspection | https://trav.manhscale.com/scale/insights/3070; User Activity Insight | [runtime-root.json](../../evidence/runtime-root.json) |

**Visible criteria / entry fields:** Username; Equipment Type; From Activity Date Time; To Activity Date Time; User Type; Region; Assignment ID.

**Visible grid headers:** Field; Operand; Value; Logon Date Time; Username; User Type; Device; Equipment Type; Last Action Date Time; Logoff Date Time; Color.

**Observed action/menu labels:** Actions; Log Off Vocollect User.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

User Activity Insight is recorded as `insight`. Its saved configuration contains 6 parts, 19 groups, 26 controls, and 17 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4479 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4480 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4481 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4482 / SearchPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | InsightMenuApply |
| 4483 / ListPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |
| 4484 / DetailPane | Not populated / Not populated | 10 / 12500 | Y / Y / N | Not populated |

### Part 4479: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18399 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18399; default=None |
| 18400 / SaveSearchModalDialogHeader | 18399 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18399; default=None |
| 18401 / SaveSearchModalDialogBody | 18399 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18399; default=None |
| 18402 / SaveSearchModalDialogFooter | 18399 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18399; default=None |

#### Group 18401: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52330 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18402: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52331 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52332 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4480: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18403 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18403; default=None |
| 18404 / GadgetCalculationQueryDialogHeader | 18403 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18403; default=None |
| 18405 / GadgetCalculationQueryDialogBody | 18403 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18403; default=None |
| 18406 / GadgetCalculationQueryDialogFooter | 18403 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18403; default=None |

#### Group 18405: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52333 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18406: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52334 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52335 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4481: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18407 / InsightMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=18407; default=None |
| 18408 / InsightMenuPanel | 18407 | Not populated / Not populated | 60 / 750 | Y / Y | Fixed to top=Y; loading=0; nested unit=18407; default=None |
| 18411 / MenuExportToExcelPanel | 18407 | Not populated / Not populated | 60 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=18407; default=None |
| 18409 / InsightMenuFavoritesDropdown | 18407 | Favorites / FAVORITES | 100 / 1000 | Y / Y | Fixed to top=N; loading=0; nested unit=18407; default=None |
| 18412 / InsightMenuActionsDropdown | 18407 | Actions / ACTIONS | 80 / 1000 | Y / Y | Fixed to top=N; loading=0; nested unit=18407; default=None |
| 18410 / InsightListPaneMenuPanel | 18407 | Not populated / Not populated | 60 / 1100 | Y / Y | Fixed to top=Y; loading=0; nested unit=18407; default=None |

#### Group 18408: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52336 / InsightMenuApply | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 52337 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 52338 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 450 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 52339 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18411: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52343 / MenuExportToExcel | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18412: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52344 / ListPaneMenuActionLogOff | Log Off Vocollect User / LOGOFFVOCOLLECTUSER | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=LOGOFFVOCOLLECTUSER |

#### Group 18410: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52340 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52341 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 52342 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

### Part 4482: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18413 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18413; default=None |
| 18414 / SearchPaneBasicCriteria | 18413 | Basic Criteria / BASICCRITERIA | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=18413; default=None |
| 18415 / SearchPaneAdvancedCriteria | 18413 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=18413; default=None |

#### Group 18414: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52345 / BasicCriteriaUsername | Username / USERNAME | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52346 / BasicCriteriaEquipmentType | Equipment Type / EQUIPMENTTYPE | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52347 / BasicCriteriaActivityDateTimeRange | Activity Date Time / ACTIVITYDATETIME | 190 / 1500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52348 / BasicCriteriaUserType | User Type / USERTYPE | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52349 / BasicCriteriaVocollectRegion | Region / REGION | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52350 / BasicCriteriaAssignmentId | Assignment ID / ASSIGNMENTID | 10 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18415: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52351 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 250 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4483: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18416 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=18416; default=None |

#### Group 18416: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52352 / ListPaneDataGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 52352 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18847 / Not populated | LOGON_DATE_TIME / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18848 / Not populated | LOGOFF_DATE_TIME / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18849 / Not populated | USER_TYPE_IDENTIFIER / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18833 / LogonDateTime | LOGON_DATE_TIME / Logon Date Time / LOGONDATETIME | 30 / 10 / 500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18835 / UserName | Not populated / Username / USERNAME | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18836 / UserType | Not populated / User Type / USERTYPE | 10 / 10 / 1500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18837 / Device | Not populated / Device / DEVICE | 10 / 10 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18838 / EquipmentType | Not populated / Equipment Type / EQUIPMENTTYPE | 10 / 10 / 2500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18839 / LastActionDateTime | Not populated / Last Action Date Time / LASTACTIONDATETIME | 30 / 10 / 3000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18840 / LogoffDateTime | LOGOFF_DATE_TIME / Logoff Date Time / LOGOFFDATETIME | 30 / 10 / 3500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18841 / LogoffNote | Not populated / Logoff Note / LOGOFFNOTE | 10 / 10 / 4000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18842 / VocollectRegion | Not populated / Vocollect Region / VOCOLLECTREGION | 20 / 10 / 4500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18843 / VocollectAssignmentId | Not populated / Vocollect Assignment ID / VOCOLLECTASSIGNID | 20 / 10 / 5000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18844 / Guid | Not populated / Guid / GUID | 10 / 10 / 5500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18845 / ICON | Not populated / Icon / ICON | 10 / 10 / 6000 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18846 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6500 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18834 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 6510 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4484: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18417 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18417; default=None |

#### Group 18417: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52353 / DetailPaneHeaderUserType | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=612; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52354 / DetailPaneHeaderUserName | Not populated / Not populated | 30 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=612; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52355 / DetailPaneHeaderDevice | Not populated / Not populated | 30 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=612; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 18 control attributes, 17 events, and 29 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 41458 | 52330 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 41459 | 52330 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 41460 | 52339 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41461 | 52340 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41462 | 52344 / ListPaneMenuActionLogOff | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41463 | 52344 / ListPaneMenuActionLogOff | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41464 | 52345 / BasicCriteriaUsername | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41465 | 52346 / BasicCriteriaEquipmentType | data-dbcolumn | Y / Y / N | 28 / 0 |
| 41466 | 52347 / BasicCriteriaActivityDateTimeRange | data-dbcolumn | Y / Y / N | 30 / 0 |
| 41467 | 52347 / BasicCriteriaActivityDateTimeRange | allowTodayOnlySelection | Y / Y / Y | 8 / 0 |
| 41468 | 52348 / BasicCriteriaUserType | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41469 | 52349 / BasicCriteriaVocollectRegion | data-dbcolumn | Y / Y / N | 32 / 0 |
| 41470 | 52349 / BasicCriteriaVocollectRegion | Lookup | Y / Y / N | 110 / 0 |
| 41471 | 52350 / BasicCriteriaAssignmentId | data-dbcolumn | Y / Y / N | 34 / 0 |
| 41472 | 52350 / BasicCriteriaAssignmentId | Lookup | Y / Y / N | 108 / 0 |
| 41473 | 52352 / ListPaneDataGrid | data-dbtable | Y / Y / N | 70 / 0 |
| 41474 | 52352 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 41475 | 52352 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18430 / click | 52331 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18431 / click | 52332 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18432 / click | 52334 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18433 / click | 52335 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18434 / click | 52336 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18435 / click | 52337 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18436 / click | 52338 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18437 / click | 52339 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18438 / click | 52340 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18439 / click | 52341 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18440 / click | 52342 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18441 / click | 52343 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18442 / click | 52344 / ListPaneMenuActionLogOff | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18443 / iggridrequesterror | 52352 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18444 / iggriddatabound | 52352 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18445 / iggridselectionrowselectionchanged | 52352 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18446 / iggridselectionactiverowchanged | 52352 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 27317 / 18430 | GETServiceURL | Y / Y | 76 |
| 27318 / 18430 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 27319 / 18430 | queryParameter_Function_UserName | Y / Y | 44 |
| 27320 / 18430 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27321 / 18430 | POSTServiceURL | Y / Y | 74 |
| 27322 / 18430 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 27323 / 18430 | PostData_Function_UserName | Y / Y | 44 |
| 27324 / 18430 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27325 / 18430 | PostData_Function_SearchValue | Y / Y | 98 |
| 27326 / 18430 | Post_SuccessCallback | Y / Y | 114 |
| 27327 / 18430 | ModalDialogName | Y / Y | 42 |
| 27328 / 18431 | ModalDialogName | Y / Y | 42 |
| 27329 / 18432 | POSTServiceURL | Y / Y | 144 |
| 27330 / 18432 | Form_Id | Y / Y | 8 |
| 27331 / 18432 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 27332 / 18432 | PostData_Function_SearchValue | Y / Y | 98 |
| 27333 / 18432 | Post_SuccessCallback | Y / Y | 114 |
| 27334 / 18432 | ModalDialogName | Y / Y | 56 |
| 27335 / 18433 | ModalDialogName | Y / Y | 56 |
| 27336 / 18437 | ModalDialogName | Y / Y | 42 |
| 27337 / 18438 | ModalDialogName | Y / Y | 56 |
| 27338 / 18442 | ConfirmationMessageCode | Y / Y | 42 |
| 27339 / 18442 | POSTServiceURL | Y / Y | 92 |
| 27340 / 18442 | PostData_Grid_ListPaneDataGrid_Guid | Y / Y | 8 |
| 27341 / 18442 | Post_SuccessCallback | Y / Y | 140 |
| 27342 / 18446 | POSTServiceURL | Y / Y | 72 |
| 27343 / 18446 | PostData_guId | Y / Y | 8 |
| 27344 / 18446 | PostData_storedProcedure | Y / Y | 48 |
| 27345 / 18446 | EnableAction_ListPaneMenuActionLogOff | Y / Y | 98 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 21 selected candidate rows for this Screen: **21 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 41460 | 52339 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41461 | 52340 / Not applicable | data-securityCheckpoint | checkpoint | 25 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41462 | 52344 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41464 | 52345 / Not applicable | data-dbcolumn | database_identifier | USER_NAME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41465 | 52346 / Not applicable | data-dbcolumn | database_identifier | EQUIPMENT_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41466 | 52347 / Not applicable | data-dbcolumn | database_identifier | LOGON_DATE_TIME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41468 | 52348 / Not applicable | data-dbcolumn | database_identifier | USER_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41469 | 52349 / Not applicable | data-dbcolumn | database_identifier | VOCOLLECT_REGION | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41471 | 52350 / Not applicable | data-dbcolumn | database_identifier | VOCOLLECTASSIGNID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41473 | 52352 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_USER_ACTIVITY_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27317 | 52331 / 18430 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27321 | 52331 / 18430 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27326 | 52331 / 18430 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27329 | 52334 / 18432 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27333 | 52334 / 18432 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27338 | 52344 / 18442 | ConfirmationMessageCode | resource_code | MSG_LOGOFFVOCOLLECT03 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27339 | 52344 / 18442 | POSTServiceURL | relative_api_path | /general/scaleapi/vocollectapi/Users-LoggedOff | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27340 | 52344 / 18442 | PostData_Grid_ListPaneDataGrid_Guid | grid_field_identifier | Guid | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27341 | 52344 / 18442 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27342 | 52352 / 18446 | POSTServiceURL | relative_api_path | /general/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27344 | 52352 / 18446 | PostData_storedProcedure | stored_procedure_identifier | UA_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
