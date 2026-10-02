# Work Monitoring: Group — Form 2769, Screen 1498

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2769 |
| MAIN_UI_SCREEN Object ID | 1498 |
| Label / Form resource key | Work Monitoring: Group / MNU_WORK_MONITORING_GROUP |
| Functional area code | 50 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | monitor / 6 |
| Configured path | /scale/monitors/2769 |
| Candidate runtime URL | https://trav.manhscale.com/scale/monitors/2769 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2769 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | Not populated |
| Help page reference | workmonitoringgroup.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2769 |
| Inspection time (UTC) | 2026-10-02T15:23:51.796Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_WORK_MONITORING_GROUP |
| Observed configured table/view | Not populated |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1498 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:20:25.764Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/monitors/2769; Work Monitoring: Group | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Work Monitoring: Group is recorded as `monitor`. Its saved configuration contains 3 parts, 6 groups, 16 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3458 / MonitorMenuPane | Not populated / Not populated | 10 / 2500 | Y / Y / N | Not populated |
| 3459 / monitorchartPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 3460 / monitorindicatorpane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |

### Part 3458: MonitorMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14400 / MonitorMenuPanel | Not populated | Not populated / Not populated | 70 / 2500 | Y / Y | Fixed to top=Y; loading=0; nested unit=14400; default= |
| 14401 / MonitorMenuBreadCrumbPanel | 14400 | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=14400; default= |
| 14402 / MonitorMenuActionPanel | 14400 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=14400; default=None |

#### Group 14401: MonitorMenuBreadCrumbPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41781 / breadCrumbWorkMonitor | Not populated / Not populated | 310 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14402: MonitorMenuActionPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41782 / WorkMonitorRefresh | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=REFRESH |
| 41783 / WorkMonitorInsightMenuButton | Insight / INSIGHT | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=INSIGHT |

### Part 3459: monitorchartPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14403 / MonitorPaneSummary | Not populated | Not populated / Not populated | 60 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=14403; default=None |
| 14404 / ListPaneHighchart | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=14404; default=None |

#### Group 14403: MonitorPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41784 / MonitorSummaryTilesTotalWorkUnits | Work Units / WORKUNITS | 50 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41785 / MonitorSummaryTilesTotalWorkInst | Instructions / INSTRUCTIONS | 50 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41786 / MonitorSummaryTilesTotalEstimatedTime | Est Time (M) / ESTTIMEMIN | 50 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41787 / MonitorSummaryTilesTotalLines | Open / OPEN | 50 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41788 / MonitorSummaryTilesInprocessWork | In Process / INPROCESS | 50 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41789 / MonitorSummaryTilesInternalShipmentNum | Closed Last hr / CLOSEDLASTHOUR | 50 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14404: ListPaneHighchart — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41790 / monitorColumnChart | Not populated / Not populated | 290 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3460: monitorindicatorpane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14405 / indicatorpane | Not populated | Not populated / Not populated | 60 / 17500 | Y / Y | Fixed to top=N; loading=0; nested unit=14405; default=None |

#### Group 14405: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41791 / IndicatorTileIndicator | Indicators / INDICATORS | 30 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41792 / IndicatorTileAtRiskWork | At-Risk Work / ATRISKWORK | 320 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41793 / IndicatorTilePriorityWork | Priority Work / PRIORITYWORK | 320 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41794 / IndicatorTileWorkOnHold | Work On Hold / WORKONHOLD | 320 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41795 / IndicatorTileOpenWork | Not populated / OPEN_WORK  | 320 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41796 / IndicatorTileInProgressWork | In Progress Work / INPROGRESSWORK | 320 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 45 control attributes, 2 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32139 | 41781 / breadCrumbWorkMonitor | breadcrumb | Y / Y / Y | 20 / 0 |
| 32140 | 41781 / breadCrumbWorkMonitor | breadcrumb | Y / Y / Y | 18 / 0 |
| 32141 | 41781 / breadCrumbWorkMonitor | breadcrumb | Y / Y / Y | 16 / 0 |
| 32142 | 41781 / breadCrumbWorkMonitor | breadcrumb | Y / Y / Y | 24 / 0 |
| 32143 | 41790 / monitorColumnChart | data-monitorWebService | Y / Y / Y | 106 / 0 |
| 32144 | 41790 / monitorColumnChart | data-chartType | Y / Y / Y | 12 / 0 |
| 32145 | 41790 / monitorColumnChart | data-chartCategoryMaxCount | Y / Y / Y | 4 / 0 |
| 32146 | 41790 / monitorColumnChart | data-drilldownLevel0criteria | Y / Y / Y | 40 / 0 |
| 32147 | 41790 / monitorColumnChart | data-drilldownLevel0storedprocedure | Y / Y / Y | 58 / 0 |
| 32148 | 41790 / monitorColumnChart | data-drilldownLevel1criteria | Y / Y / Y | 86 / 0 |
| 32149 | 41790 / monitorColumnChart | data-drilldownLevel1storedprocedure | Y / Y / Y | 56 / 0 |
| 32150 | 41790 / monitorColumnChart | data-drilldownLevel2criteria | Y / Y / Y | 128 / 0 |
| 32151 | 41790 / monitorColumnChart | data-drilldownLevel2storedprocedure | Y / Y / Y | 64 / 0 |
| 32152 | 41790 / monitorColumnChart | data-drilldownToInsightcriteria | Y / Y / Y | 128 / 0 |
| 32153 | 41790 / monitorColumnChart | data-drilldownToInsight | Y / Y / Y | 346 / 0 |
| 32154 | 41792 / IndicatorTileAtRiskWork | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 32155 | 41792 / IndicatorTileAtRiskWork | data-indicatorTileCriteria | Y / Y / Y | 118 / 0 |
| 32156 | 41792 / IndicatorTileAtRiskWork | data-indicatorTileGoToInsight | Y / Y / Y | 198 / 0 |
| 32157 | 41792 / IndicatorTileAtRiskWork | data-indicatorTileStoredprocedure | Y / Y / Y | 66 / 0 |
| 32158 | 41792 / IndicatorTileAtRiskWork | data-indicatorTileCautionCriteria | Y / Y / Y | 8 / 0 |
| 32159 | 41792 / IndicatorTileAtRiskWork | data-indicatorTileWarningCriteria | Y / Y / Y | 6 / 0 |
| 32160 | 41793 / IndicatorTilePriorityWork | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 32161 | 41793 / IndicatorTilePriorityWork | data-indicatorTileCriteria | Y / Y / Y | 104 / 0 |
| 32162 | 41793 / IndicatorTilePriorityWork | data-indicatorTileStoredprocedure | Y / Y / Y | 66 / 0 |
| 32163 | 41793 / IndicatorTilePriorityWork | data-indicatorTileGoToInsight | Y / Y / Y | 218 / 0 |
| 32164 | 41793 / IndicatorTilePriorityWork | data-indicatorTileCautionCriteria | Y / Y / Y | 8 / 0 |
| 32165 | 41793 / IndicatorTilePriorityWork | data-indicatorTileWarningCriteria | Y / Y / Y | 6 / 0 |
| 32166 | 41794 / IndicatorTileWorkOnHold | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 32167 | 41794 / IndicatorTileWorkOnHold | data-indicatorTileCriteria | Y / Y / Y | 86 / 0 |
| 32168 | 41794 / IndicatorTileWorkOnHold | data-indicatorTileStoredprocedure | Y / Y / Y | 66 / 0 |
| 32169 | 41794 / IndicatorTileWorkOnHold | data-indicatorTileGoToInsight | Y / Y / Y | 186 / 0 |
| 32170 | 41794 / IndicatorTileWorkOnHold | data-indicatorTileCautionCriteria | Y / Y / Y | 8 / 0 |
| 32171 | 41794 / IndicatorTileWorkOnHold | data-indicatorTileWarningCriteria | Y / Y / Y | 6 / 0 |
| 32172 | 41795 / IndicatorTileOpenWork | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 32173 | 41795 / IndicatorTileOpenWork | data-indicatorTileCriteria | Y / Y / Y | 38 / 0 |
| 32174 | 41795 / IndicatorTileOpenWork | data-indicatorTileStoredprocedure | Y / Y / Y | 66 / 0 |
| 32175 | 41795 / IndicatorTileOpenWork | data-indicatorTileGoToInsight | Y / Y / Y | 106 / 0 |
| 32176 | 41795 / IndicatorTileOpenWork | data-indicatorTileCautionCriteria | Y / Y / Y | 12 / 0 |
| 32177 | 41795 / IndicatorTileOpenWork | data-indicatorTileWarningCriteria | Y / Y / Y | 12 / 0 |
| 32178 | 41796 / IndicatorTileInProgressWork | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 32179 | 41796 / IndicatorTileInProgressWork | data-indicatorTileCriteria | Y / Y / Y | 128 / 0 |
| 32180 | 41796 / IndicatorTileInProgressWork | data-indicatorTileStoredprocedure | Y / Y / Y | 66 / 0 |
| 32181 | 41796 / IndicatorTileInProgressWork | data-indicatorTileGoToInsight | Y / Y / Y | 264 / 0 |
| 32182 | 41796 / IndicatorTileInProgressWork | data-indicatorTileCautionCriteria | Y / Y / Y | 12 / 0 |
| 32183 | 41796 / IndicatorTileInProgressWork | data-indicatorTileWarningCriteria | Y / Y / Y | 12 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 13906 / click | 41782 / WorkMonitorRefresh | _webUi.monitor.refreshButtonClicked | Not populated | Y / Y |
| 13907 / click | 41783 / WorkMonitorInsightMenuButton | _webUi.monitor.jumpToInsight | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19211 / 13907 | URL | Y / Y | 254 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 14 selected candidate rows for this Screen: **14 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32143 | 41790 / Not applicable | data-monitorWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32147 | 41790 / Not applicable | data-drilldownLevel0storedprocedure | stored_procedure_identifier | WRK_MonitorWorkGroupChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32149 | 41790 / Not applicable | data-drilldownLevel1storedprocedure | stored_procedure_identifier | WRK_MonitorWorkTypeChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32151 | 41790 / Not applicable | data-drilldownLevel2storedprocedure | stored_procedure_identifier | WRK_MonitorAssignedUserChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32154 | 41792 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32157 | 41792 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | WRK_MonitorWorkGroupIndicatorTile | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32160 | 41793 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32162 | 41793 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | WRK_MonitorWorkGroupIndicatorTile | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32166 | 41794 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32168 | 41794 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | WRK_MonitorWorkGroupIndicatorTile | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32172 | 41795 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32174 | 41795 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | WRK_MonitorWorkGroupIndicatorTile | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32178 | 41796 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32180 | 41796 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | WRK_MonitorWorkGroupIndicatorTile | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
