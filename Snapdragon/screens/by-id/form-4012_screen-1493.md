# Inventory Monitoring — Form 4012, Screen 1493

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4012 |
| MAIN_UI_SCREEN Object ID | 1493 |
| Label / Form resource key | Inventory Monitoring / MNU_INVENTORY_MONITORING |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | monitor / 6 |
| Configured path | /scale/monitors/4012 |
| Candidate runtime URL | https://trav.manhscale.com/scale/monitors/4012 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4012 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_INVENTORY_VIEW |
| Help page reference | inventorymonitoring.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4012 |
| Inspection time (UTC) | 2026-10-02T15:26:56.623Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_INVENTORY_MONITORING |
| Observed configured table/view | METADATA_INSIGHT_INVENTORY_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1493 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:19:51.032Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/monitors/4012; Inventory Monitoring | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Inventory Monitoring is recorded as `monitor`. Its saved configuration contains 3 parts, 6 groups, 13 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3443 / MonitorMenuPane | Not populated / Not populated | 10 / 2500 | Y / Y / N | Not populated |
| 3444 / monitorchartPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 3445 / monitorindicatorpane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |

### Part 3443: MonitorMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14370 / MonitorMenuPanel | Not populated | Not populated / Not populated | 70 / 2500 | Y / Y | Fixed to top=Y; loading=0; nested unit=14370; default= |
| 14371 / MonitorMenuBreadCrumbPanel | 14370 | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=14370; default= |
| 14372 / MonitorMenuActionPanel | 14370 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=14370; default=None |

#### Group 14371: MonitorMenuBreadCrumbPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41718 / MNU_INVENTORY_MONITORINGBreadCrumb | Not populated / Not populated | 310 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14372: MonitorMenuActionPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41719 / MNU_INVENTORY_MONITORINGRefresh | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=REFRESH |
| 41720 / MNU_INVENTORY_MONITORINGInsight | Insight / INSIGHT | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=INSIGHT |

### Part 3444: monitorchartPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14373 / MonitorPaneSummary | Not populated | Not populated / Not populated | 60 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=14373; default=None |
| 14374 / ListPaneHighchart | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=14374; default=None |

#### Group 14373: MonitorPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41721 / MNU_INVENTORY_MONITORINGSummaryTile0 | Total Locations / TOTALLOCATIONS | 50 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41722 / MNU_INVENTORY_MONITORINGSummaryTile1 | Empty Locations / EMPTYLOCATIONS | 50 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41723 / MNU_INVENTORY_MONITORINGSummaryTile2 | Percent Empty / PERCENTEMPTY | 50 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41724 / MNU_INVENTORY_MONITORINGSummaryTile3 | Not populated / FROZENEMPTY  | 50 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14374: ListPaneHighchart — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41725 / MNU_INVENTORY_MONITORINGMonitorChart | Not populated / Not populated | 290 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3445: monitorindicatorpane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14375 / indicatorpane | Not populated | Not populated / Not populated | 60 / 17500 | Y / Y | Fixed to top=N; loading=0; nested unit=14375; default=None |

#### Group 14375: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41726 / IndicatorTileIndicator | Indicators / INDICATORS | 30 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41727 / MNU_INVENTORY_MONITORINGIndicatorTile0 | Locations Less Than 10 On Hand / LOCATIONSLESS10ONHAND | 320 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41728 / MNU_INVENTORY_MONITORINGIndicatorTile1 | Pending Replenishments / PENDINGREPLEN | 320 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41729 / MNU_INVENTORY_MONITORINGIndicatorTile2 | Pending Cycle Counts / PENDINGCYCLECOUNTS | 320 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41730 / MNU_INVENTORY_MONITORINGIndicatorTile3 | Empty Permanent Locations - With None Available (in Transit) / EMPTYPERMLOCSNONAVAILTRANS | 320 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 38 control attributes, 2 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 31952 | 41718 / MNU_INVENTORY_MONITORINGBreadCrumb | breadcrumb | Y / Y / Y | 26 / 0 |
| 31953 | 41718 / MNU_INVENTORY_MONITORINGBreadCrumb | breadcrumb | Y / Y / Y | 24 / 0 |
| 31954 | 41718 / MNU_INVENTORY_MONITORINGBreadCrumb | breadcrumb | Y / Y / Y | 24 / 0 |
| 31955 | 41725 / MNU_INVENTORY_MONITORINGMonitorChart | data-monitorWebService | Y / Y / Y | 106 / 0 |
| 31956 | 41725 / MNU_INVENTORY_MONITORINGMonitorChart | data-chartType | Y / Y / Y | 12 / 0 |
| 31957 | 41725 / MNU_INVENTORY_MONITORINGMonitorChart | data-chartCategoryMaxCount | Y / Y / Y | 4 / 0 |
| 31958 | 41725 / MNU_INVENTORY_MONITORINGMonitorChart | data-drilldownLevel0criteria | Y / Y / Y | 122 / 0 |
| 31959 | 41725 / MNU_INVENTORY_MONITORINGMonitorChart | data-drilldownLevel0storedprocedure | Y / Y / Y | 56 / 0 |
| 31960 | 41725 / MNU_INVENTORY_MONITORINGMonitorChart | data-drilldownLevel1criteria | Y / Y / Y | 180 / 0 |
| 31961 | 41725 / MNU_INVENTORY_MONITORINGMonitorChart | data-drilldownLevel1storedprocedure | Y / Y / Y | 64 / 0 |
| 31962 | 41725 / MNU_INVENTORY_MONITORINGMonitorChart | data-drilldownLevel2criteria | Y / Y / Y | 238 / 0 |
| 31963 | 41725 / MNU_INVENTORY_MONITORINGMonitorChart | data-drilldownLevel2storedprocedure | Y / Y / Y | 66 / 0 |
| 31964 | 41725 / MNU_INVENTORY_MONITORINGMonitorChart | data-drilldownToInsightcriteria | Y / Y / Y | 304 / 0 |
| 31965 | 41725 / MNU_INVENTORY_MONITORINGMonitorChart | data-drilldownToInsight | Y / Y / Y | 548 / 0 |
| 31966 | 41727 / MNU_INVENTORY_MONITORINGIndicatorTile0 | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 31967 | 41727 / MNU_INVENTORY_MONITORINGIndicatorTile0 | data-indicatorTileCriteria | Y / Y / Y | 196 / 0 |
| 31968 | 41727 / MNU_INVENTORY_MONITORINGIndicatorTile0 | data-indicatorTileGoToInsight | Y / Y / Y | 466 / 0 |
| 31969 | 41727 / MNU_INVENTORY_MONITORINGIndicatorTile0 | data-indicatorTileStoredprocedure | Y / Y / Y | 66 / 0 |
| 31970 | 41727 / MNU_INVENTORY_MONITORINGIndicatorTile0 | data-indicatorTileCautionCriteria | Y / Y / Y | 0 / 0 |
| 31971 | 41727 / MNU_INVENTORY_MONITORINGIndicatorTile0 | data-indicatorTileWarningCriteria | Y / Y / Y | 0 / 0 |
| 31972 | 41728 / MNU_INVENTORY_MONITORINGIndicatorTile1 | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 31973 | 41728 / MNU_INVENTORY_MONITORINGIndicatorTile1 | data-indicatorTileCriteria | Y / Y / Y | 92 / 0 |
| 31974 | 41728 / MNU_INVENTORY_MONITORINGIndicatorTile1 | data-indicatorTileGoToInsight | Y / Y / Y | 192 / 0 |
| 31975 | 41728 / MNU_INVENTORY_MONITORINGIndicatorTile1 | data-indicatorTileStoredprocedure | Y / Y / Y | 66 / 0 |
| 31976 | 41728 / MNU_INVENTORY_MONITORINGIndicatorTile1 | data-indicatorTileCautionCriteria | Y / Y / Y | 0 / 0 |
| 31977 | 41728 / MNU_INVENTORY_MONITORINGIndicatorTile1 | data-indicatorTileWarningCriteria | Y / Y / Y | 0 / 0 |
| 31978 | 41729 / MNU_INVENTORY_MONITORINGIndicatorTile2 | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 31979 | 41729 / MNU_INVENTORY_MONITORINGIndicatorTile2 | data-indicatorTileCriteria | Y / Y / Y | 94 / 0 |
| 31980 | 41729 / MNU_INVENTORY_MONITORINGIndicatorTile2 | data-indicatorTileGoToInsight | Y / Y / Y | 190 / 0 |
| 31981 | 41729 / MNU_INVENTORY_MONITORINGIndicatorTile2 | data-indicatorTileStoredprocedure | Y / Y / Y | 66 / 0 |
| 31982 | 41729 / MNU_INVENTORY_MONITORINGIndicatorTile2 | data-indicatorTileCautionCriteria | Y / Y / Y | 6 / 0 |
| 31983 | 41729 / MNU_INVENTORY_MONITORINGIndicatorTile2 | data-indicatorTileWarningCriteria | Y / Y / Y | 6 / 0 |
| 31984 | 41730 / MNU_INVENTORY_MONITORINGIndicatorTile3 | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 31985 | 41730 / MNU_INVENTORY_MONITORINGIndicatorTile3 | data-indicatorTileCriteria | Y / Y / Y | 198 / 0 |
| 31986 | 41730 / MNU_INVENTORY_MONITORINGIndicatorTile3 | data-indicatorTileGoToInsight | Y / Y / Y | 466 / 0 |
| 31987 | 41730 / MNU_INVENTORY_MONITORINGIndicatorTile3 | data-indicatorTileStoredprocedure | Y / Y / Y | 66 / 0 |
| 31988 | 41730 / MNU_INVENTORY_MONITORINGIndicatorTile3 | data-indicatorTileCautionCriteria | Y / Y / Y | 0 / 0 |
| 31989 | 41730 / MNU_INVENTORY_MONITORINGIndicatorTile3 | data-indicatorTileWarningCriteria | Y / Y / Y | 0 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 13896 / click | 41719 / MNU_INVENTORY_MONITORINGRefresh | _webUi.monitor.refreshButtonClicked | Not populated | Y / Y |
| 13897 / click | 41720 / MNU_INVENTORY_MONITORINGInsight | _webUi.monitor.jumpToInsight | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19206 / 13897 | URL | Y / Y | 550 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 12 selected candidate rows for this Screen: **12 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 31955 | 41725 / Not applicable | data-monitorWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31959 | 41725 / Not applicable | data-drilldownLevel0storedprocedure | stored_procedure_identifier | INV_MonitorLocationChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31961 | 41725 / Not applicable | data-drilldownLevel1storedprocedure | stored_procedure_identifier | INV_MonitorLocationTypeChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31963 | 41725 / Not applicable | data-drilldownLevel2storedprocedure | stored_procedure_identifier | INV_MonitorTemplateFieldChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31966 | 41727 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31969 | 41727 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | INV_MonitorInventoryIndicatorTile | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31972 | 41728 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31975 | 41728 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | INV_MonitorInventoryIndicatorTile | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31978 | 41729 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31981 | 41729 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | INV_MonitorInventoryIndicatorTile | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31984 | 41730 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 31987 | 41730 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | INV_MonitorInventoryIndicatorTile | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
