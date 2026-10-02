# Labor Monitoring — Form 3051, Screen 1494

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime attempted; error or unresolved result. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3051 |
| MAIN_UI_SCREEN Object ID | 1494 |
| Label / Form resource key | Labor Monitoring / MNU_LABOR_MONITORING |
| Functional area code | 90 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | monitor / 6 |
| Configured path | /scale/monitors/3051 |
| Candidate runtime URL | https://trav.manhscale.com/scale/monitors/3051 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3051 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | Not populated |
| Help page reference | laborMonitoringScreen.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3051 |
| Inspection time (UTC) | 2026-10-02T15:26:06.263Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_LABOR_MONITORING |
| Observed configured table/view | Not populated |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1494 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:16:15.608Z | application_access_error; runtime_inspection | https://trav.manhscale.com/scale/General/Error?error=MSG_SECURITYVIOLATION02&formId=3051; Security Access Violation | [runtime-root.json](../../evidence/runtime-root.json) |

**Recorded error/result:** The specified screen is not licensed for use in Manhattan SCALE. Screen: Labor Monitoring.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Labor Monitoring is recorded as `monitor`. Its saved configuration contains 3 parts, 6 groups, 11 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3446 / MonitorMenuPane | Not populated / Not populated | 10 / 2500 | Y / Y / N | Not populated |
| 3447 / monitorchartPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 3448 / monitorindicatorpane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |

### Part 3446: MonitorMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14376 / MonitorMenuPanel | Not populated | Not populated / Not populated | 70 / 2500 | Y / Y | Fixed to top=Y; loading=0; nested unit=14376; default= |
| 14377 / MonitorMenuBreadCrumbPanel | 14376 | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=14376; default= |
| 14378 / MonitorMenuActionPanel | 14376 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=14376; default=None |

#### Group 14377: MonitorMenuBreadCrumbPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41731 / MNU_LABOR_MONITORINGBreadCrumb | Not populated / Not populated | 310 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14378: MonitorMenuActionPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41732 / MNU_LABOR_MONITORINGRefresh | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=REFRESH |
| 41733 / LaborMonitorInsightMenuButton | Insight / INSIGHT | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=INSIGHT |

### Part 3447: monitorchartPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14379 / MonitorPaneSummary | Not populated | Not populated / Not populated | 60 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=14379; default=None |
| 14380 / ListPaneHighchart | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=14380; default=None |

#### Group 14379: MonitorPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41734 / MNU_LABOR_MONITORINGSummaryTile0 | Total Estimated Time / TOTALESTIMATEDTIME | 50 / 1 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41735 / MNU_LABOR_MONITORINGSummaryTile1 | Work Closed Last Hour / WORKLASTHOUR | 50 / 2 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41736 / MNU_LABOR_MONITORINGSummaryTile2 | Users Closing Work Last Hour / USERSLASTHOUR | 50 / 3 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14380: ListPaneHighchart — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41737 / MNU_LABOR_MONITORINGMonitorChart | Not populated / Not populated | 290 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3448: monitorindicatorpane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14381 / indicatorpane | Not populated | Not populated / Not populated | 60 / 17500 | Y / Y | Fixed to top=N; loading=0; nested unit=14381; default=None |

#### Group 14381: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41738 / IndicatorTileIndicator | Indicators / INDICATORS | 30 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41739 / MNU_LABOR_MONITORINGIndicatorTile0 | Activities Done Last Hour / COMPLETEDLASTHOUR | 320 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41740 / MNU_LABOR_MONITORINGIndicatorTile1 | Users Completing Activities Last Hour / USERSCOMPLETEDLASTHOUR | 320 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41741 / MNU_LABOR_MONITORINGIndicatorTile2 | Work Units Closed Today / WORKUNITSCLOSEDTODAY | 320 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 32 control attributes, 2 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 31990 | 41731 / MNU_LABOR_MONITORINGBreadCrumb | breadcrumb | Y / Y / Y | 22 / 0 |
| 31991 | 41731 / MNU_LABOR_MONITORINGBreadCrumb | breadcrumb | Y / Y / Y | 18 / 0 |
| 31992 | 41731 / MNU_LABOR_MONITORINGBreadCrumb | breadcrumb | Y / Y / Y | 10 / 0 |
| 31993 | 41737 / MNU_LABOR_MONITORINGMonitorChart | data-monitorWebService | Y / Y / Y | 106 / 0 |
| 31994 | 41737 / MNU_LABOR_MONITORINGMonitorChart | data-chartType | Y / Y / Y | 12 / 0 |
| 31995 | 41737 / MNU_LABOR_MONITORINGMonitorChart | data-chartCategoryMaxCount | Y / Y / Y | 4 / 0 |
| 31996 | 41737 / MNU_LABOR_MONITORINGMonitorChart | data-drilldownLevel0criteria | Y / Y / Y | 42 / 0 |
| 31997 | 41737 / MNU_LABOR_MONITORINGMonitorChart | data-drilldownLevel0storedprocedure | Y / Y / Y | 62 / 0 |
| 31998 | 41737 / MNU_LABOR_MONITORINGMonitorChart | data-drilldownLevel1criteria | Y / Y / Y | 92 / 0 |
| 31999 | 41737 / MNU_LABOR_MONITORINGMonitorChart | data-drilldownLevel1storedprocedure | Y / Y / Y | 58 / 0 |
| 32000 | 41737 / MNU_LABOR_MONITORINGMonitorChart | data-drilldownLevel2criteria | Y / Y / Y | 136 / 0 |
| 32001 | 41737 / MNU_LABOR_MONITORINGMonitorChart | data-drilldownLevel2storedprocedure | Y / Y / Y | 60 / 0 |
| 32002 | 41737 / MNU_LABOR_MONITORINGMonitorChart | data-drilldownToInsightcriteria | Y / Y / Y | 134 / 0 |
| 32003 | 41737 / MNU_LABOR_MONITORINGMonitorChart | data-drilldownToInsight | Y / Y / Y | 350 / 0 |
| 32004 | 41739 / MNU_LABOR_MONITORINGIndicatorTile0 | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 32005 | 41739 / MNU_LABOR_MONITORINGIndicatorTile0 | data-indicatorTileCriteria | Y / Y / Y | 154 / 0 |
| 32006 | 41739 / MNU_LABOR_MONITORINGIndicatorTile0 | data-indicatorTileGoToInsight | Y / Y / Y | 616 / 0 |
| 32007 | 41739 / MNU_LABOR_MONITORINGIndicatorTile0 | data-indicatorTileStoredprocedure | Y / Y / Y | 60 / 0 |
| 32008 | 41739 / MNU_LABOR_MONITORINGIndicatorTile0 | data-indicatorTileCautionCriteria | Y / Y / Y | 0 / 0 |
| 32009 | 41739 / MNU_LABOR_MONITORINGIndicatorTile0 | data-indicatorTileWarningCriteria | Y / Y / Y | 0 / 0 |
| 32010 | 41740 / MNU_LABOR_MONITORINGIndicatorTile1 | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 32011 | 41740 / MNU_LABOR_MONITORINGIndicatorTile1 | data-indicatorTileCriteria | Y / Y / Y | 200 / 0 |
| 32012 | 41740 / MNU_LABOR_MONITORINGIndicatorTile1 | data-indicatorTileGoToInsight | Y / Y / Y | 696 / 0 |
| 32013 | 41740 / MNU_LABOR_MONITORINGIndicatorTile1 | data-indicatorTileStoredprocedure | Y / Y / Y | 60 / 0 |
| 32014 | 41740 / MNU_LABOR_MONITORINGIndicatorTile1 | data-indicatorTileCautionCriteria | Y / Y / Y | 0 / 0 |
| 32015 | 41740 / MNU_LABOR_MONITORINGIndicatorTile1 | data-indicatorTileWarningCriteria | Y / Y / Y | 0 / 0 |
| 32016 | 41741 / MNU_LABOR_MONITORINGIndicatorTile2 | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 32017 | 41741 / MNU_LABOR_MONITORINGIndicatorTile2 | data-indicatorTileCriteria | Y / Y / Y | 228 / 0 |
| 32018 | 41741 / MNU_LABOR_MONITORINGIndicatorTile2 | data-indicatorTileGoToInsight | Y / Y / Y | 440 / 0 |
| 32019 | 41741 / MNU_LABOR_MONITORINGIndicatorTile2 | data-indicatorTileStoredprocedure | Y / Y / Y | 60 / 0 |
| 32020 | 41741 / MNU_LABOR_MONITORINGIndicatorTile2 | data-indicatorTileCautionCriteria | Y / Y / Y | 0 / 0 |
| 32021 | 41741 / MNU_LABOR_MONITORINGIndicatorTile2 | data-indicatorTileWarningCriteria | Y / Y / Y | 0 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 13898 / click | 41732 / MNU_LABOR_MONITORINGRefresh | _webUi.monitor.refreshButtonClicked | Not populated | Y / Y |
| 13899 / click | 41733 / LaborMonitorInsightMenuButton | _webUi.monitor.jumpToInsight | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19207 / 13899 | URL | Y / Y | 258 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 10 selected candidate rows for this Screen: **10 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 31993 | 41737 / Not applicable | data-monitorWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31997 | 41737 / Not applicable | data-drilldownLevel0storedprocedure | stored_procedure_identifier | LBR_MonitorLaborGroupsChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31999 | 41737 / Not applicable | data-drilldownLevel1storedprocedure | stored_procedure_identifier | LBR_MonitorWorkTypesChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32001 | 41737 / Not applicable | data-drilldownLevel2storedprocedure | stored_procedure_identifier | LBR_MonitorLaborUsersChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32004 | 41739 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32007 | 41739 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | LBR_MonitorLaborIndicatorTiles | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32010 | 41740 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32013 | 41740 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | LBR_MonitorLaborIndicatorTiles | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32016 | 41741 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32019 | 41741 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | LBR_MonitorLaborIndicatorTiles | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
