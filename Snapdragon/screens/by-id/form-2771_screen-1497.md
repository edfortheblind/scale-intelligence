# Work Monitoring: Customer — Form 2771, Screen 1497

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2771 |
| MAIN_UI_SCREEN Object ID | 1497 |
| Label / Form resource key | Work Monitoring: Customer / MNU_WORK_MONITORING_CUSTOMER |
| Functional area code | 50 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | monitor / 6 |
| Configured path | /scale/monitors/2771 |
| Candidate runtime URL | https://trav.manhscale.com/scale/monitors/2771 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2771 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | Not populated |
| Help page reference | workmonitoringcustomer.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2771 |
| Inspection time (UTC) | 2026-10-02T15:23:53.646Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_WORK_MONITORING_CUSTOMER |
| Observed configured table/view | Not populated |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1497 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:20:11.259Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/monitors/2771; Work Monitoring: Customer | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Work Monitoring: Customer is recorded as `monitor`. Its saved configuration contains 3 parts, 6 groups, 16 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3455 / MonitorMenuPane | Not populated / Not populated | 10 / 2500 | Y / Y / N | Not populated |
| 3456 / monitorchartPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 3457 / monitorindicatorpane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |

### Part 3455: MonitorMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14394 / MonitorMenuPanel | Not populated | Not populated / Not populated | 70 / 2500 | Y / Y | Fixed to top=Y; loading=0; nested unit=14394; default= |
| 14395 / MonitorMenuBreadCrumbPanel | 14394 | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=14394; default= |
| 14396 / MonitorMenuActionPanel | 14394 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=14394; default=None |

#### Group 14395: MonitorMenuBreadCrumbPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41765 / breadCrumbWorkMonitor | Not populated / Not populated | 310 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14396: MonitorMenuActionPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41766 / WorkMonitorRefresh | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=REFRESH |
| 41767 / WorkMonitorInsightMenuButton | Insight / INSIGHT | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=INSIGHT |

### Part 3456: monitorchartPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14397 / MonitorPaneSummary | Not populated | Not populated / Not populated | 60 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=14397; default=None |
| 14398 / ListPaneHighchart | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=14398; default=None |

#### Group 14397: MonitorPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41768 / MonitorSummaryTilesTotalWorkUnits | Work Units / WORKUNITS | 50 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41769 / MonitorSummaryTilesTotalWorkInst | Instructions / INSTRUCTIONS | 50 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41770 / MonitorSummaryTilesTotalEstimatedTime | Est Time (M) / ESTTIMEMIN | 50 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41771 / MonitorSummaryTilesTotalLines | Open / OPEN | 50 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41772 / MonitorSummaryTilesInprocessWork | In Process / INPROCESS | 50 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41773 / MonitorSummaryTilesClosedWork | Closed Last hr / CLOSEDLASTHOUR | 50 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14398: ListPaneHighchart — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41774 / monitorColumnChart | Not populated / Not populated | 290 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3457: monitorindicatorpane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14399 / indicatorpane | Not populated | Not populated / Not populated | 60 / 17500 | Y / Y | Fixed to top=N; loading=0; nested unit=14399; default=None |

#### Group 14399: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41775 / IndicatorTileIndicator | Indicators / INDICATORS | 30 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41776 / IndicatorTileAtRiskWork | At-Risk Work / ATRISKWORK | 320 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41777 / IndicatorTilePriorityWork | Priority Work / PRIORITYWORK | 320 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41778 / IndicatorTileWorkOnHold | Work On Hold / WORKONHOLD | 320 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41779 / IndicatorTileOpenWork | Open Work / OPENWORK | 320 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41780 / IndicatorTileInProgressWork | In Progress Work / INPROGRESSWORK | 320 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 50 control attributes, 2 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32089 | 41765 / breadCrumbWorkMonitor | breadcrumb | Y / Y / Y | 34 / 0 |
| 32090 | 41765 / breadCrumbWorkMonitor | breadcrumb | Y / Y / Y | 48 / 0 |
| 32091 | 41765 / breadCrumbWorkMonitor | breadcrumb | Y / Y / Y | 16 / 0 |
| 32092 | 41765 / breadCrumbWorkMonitor | breadcrumb | Y / Y / Y | 12 / 0 |
| 32093 | 41765 / breadCrumbWorkMonitor | breadcrumb | Y / Y / Y | 18 / 0 |
| 32094 | 41774 / monitorColumnChart | data-monitorWebService | Y / Y / Y | 106 / 0 |
| 32095 | 41774 / monitorColumnChart | data-chartType | Y / Y / Y | 12 / 0 |
| 32096 | 41774 / monitorColumnChart | data-chartCategoryMaxCount | Y / Y / Y | 4 / 0 |
| 32097 | 41774 / monitorColumnChart | data-drilldownLevel0criteria | Y / Y / Y | 96 / 0 |
| 32098 | 41774 / monitorColumnChart | data-drilldownLevel0storedprocedure | Y / Y / Y | 72 / 0 |
| 32099 | 41774 / monitorColumnChart | data-drilldownLevel1criteria | Y / Y / Y | 162 / 0 |
| 32100 | 41774 / monitorColumnChart | data-drilldownLevel1storedprocedure | Y / Y / Y | 64 / 0 |
| 32101 | 41774 / monitorColumnChart | data-drilldownLevel2criteria | Y / Y / Y | 222 / 0 |
| 32102 | 41774 / monitorColumnChart | data-drilldownLevel2storedprocedure | Y / Y / Y | 68 / 0 |
| 32103 | 41774 / monitorColumnChart | data-drilldownLevel3criteria | Y / Y / Y | 278 / 0 |
| 32104 | 41774 / monitorColumnChart | data-drilldownLevel3storedprocedure | Y / Y / Y | 74 / 0 |
| 32105 | 41774 / monitorColumnChart | data-drilldownLevel4criteria | Y / Y / Y | 326 / 0 |
| 32106 | 41774 / monitorColumnChart | data-drilldownLevel4storedprocedure | Y / Y / Y | 72 / 0 |
| 32107 | 41774 / monitorColumnChart | data-drilldownToInsightcriteria | Y / Y / Y | 326 / 0 |
| 32108 | 41774 / monitorColumnChart | data-drilldownToInsight | Y / Y / Y | 622 / 0 |
| 32109 | 41776 / IndicatorTileAtRiskWork | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 32110 | 41776 / IndicatorTileAtRiskWork | data-indicatorTileCriteria | Y / Y / Y | 118 / 0 |
| 32111 | 41776 / IndicatorTileAtRiskWork | data-indicatorTileGoToInsight | Y / Y / Y | 200 / 0 |
| 32112 | 41776 / IndicatorTileAtRiskWork | data-indicatorTileStoredprocedure | Y / Y / Y | 64 / 0 |
| 32113 | 41776 / IndicatorTileAtRiskWork | data-indicatorTileCautionCriteria | Y / Y / Y | 8 / 0 |
| 32114 | 41776 / IndicatorTileAtRiskWork | data-indicatorTileWarningCriteria | Y / Y / Y | 6 / 0 |
| 32115 | 41777 / IndicatorTilePriorityWork | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 32116 | 41777 / IndicatorTilePriorityWork | data-indicatorTileCriteria | Y / Y / Y | 106 / 0 |
| 32117 | 41777 / IndicatorTilePriorityWork | data-indicatorTileStoredprocedure | Y / Y / Y | 64 / 0 |
| 32118 | 41777 / IndicatorTilePriorityWork | data-indicatorTileGoToInsight | Y / Y / Y | 218 / 0 |
| 32119 | 41777 / IndicatorTilePriorityWork | data-indicatorTileCautionCriteria | Y / Y / Y | 8 / 0 |
| 32120 | 41777 / IndicatorTilePriorityWork | data-indicatorTileWarningCriteria | Y / Y / Y | 6 / 0 |
| 32121 | 41778 / IndicatorTileWorkOnHold | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 32122 | 41778 / IndicatorTileWorkOnHold | data-indicatorTileCriteria | Y / Y / Y | 86 / 0 |
| 32123 | 41778 / IndicatorTileWorkOnHold | data-indicatorTileStoredprocedure | Y / Y / Y | 64 / 0 |
| 32124 | 41778 / IndicatorTileWorkOnHold | data-indicatorTileGoToInsight | Y / Y / Y | 186 / 0 |
| 32125 | 41778 / IndicatorTileWorkOnHold | data-indicatorTileCautionCriteria | Y / Y / Y | 8 / 0 |
| 32126 | 41778 / IndicatorTileWorkOnHold | data-indicatorTileWarningCriteria | Y / Y / Y | 6 / 0 |
| 32127 | 41779 / IndicatorTileOpenWork | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 32128 | 41779 / IndicatorTileOpenWork | data-indicatorTileCriteria | Y / Y / Y | 38 / 0 |
| 32129 | 41779 / IndicatorTileOpenWork | data-indicatorTileStoredprocedure | Y / Y / Y | 64 / 0 |
| 32130 | 41779 / IndicatorTileOpenWork | data-indicatorTileGoToInsight | Y / Y / Y | 106 / 0 |
| 32131 | 41779 / IndicatorTileOpenWork | data-indicatorTileCautionCriteria | Y / Y / Y | 12 / 0 |
| 32132 | 41779 / IndicatorTileOpenWork | data-indicatorTileWarningCriteria | Y / Y / Y | 12 / 0 |
| 32133 | 41780 / IndicatorTileInProgressWork | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 32134 | 41780 / IndicatorTileInProgressWork | data-indicatorTileCriteria | Y / Y / Y | 128 / 0 |
| 32135 | 41780 / IndicatorTileInProgressWork | data-indicatorTileStoredprocedure | Y / Y / Y | 64 / 0 |
| 32136 | 41780 / IndicatorTileInProgressWork | data-indicatorTileGoToInsight | Y / Y / Y | 264 / 0 |
| 32137 | 41780 / IndicatorTileInProgressWork | data-indicatorTileCautionCriteria | Y / Y / Y | 12 / 0 |
| 32138 | 41780 / IndicatorTileInProgressWork | data-indicatorTileWarningCriteria | Y / Y / Y | 12 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 13904 / click | 41766 / WorkMonitorRefresh | _webUi.monitor.refreshButtonClicked | Not populated | Y / Y |
| 13905 / click | 41767 / WorkMonitorInsightMenuButton | _webUi.monitor.jumpToInsight | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19210 / 13905 | URL | Y / Y | 622 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 16 selected candidate rows for this Screen: **16 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32094 | 41774 / Not applicable | data-monitorWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32098 | 41774 / Not applicable | data-drilldownLevel0storedprocedure | stored_procedure_identifier | WRK_MonitorCustomerCategoryChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32100 | 41774 / Not applicable | data-drilldownLevel1storedprocedure | stored_procedure_identifier | WRK_MonitorCustomerNameChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32102 | 41774 / Not applicable | data-drilldownLevel2storedprocedure | stored_procedure_identifier | WRK_MonitorCustomerShipToChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32104 | 41774 / Not applicable | data-drilldownLevel3storedprocedure | stored_procedure_identifier | WRK_MonitorCustomerWorkGroupChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32106 | 41774 / Not applicable | data-drilldownLevel4storedprocedure | stored_procedure_identifier | WRK_MonitorCustomerWorkTypeChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32109 | 41776 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32112 | 41776 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | WRK_MonitorCustomerIndicatorTile | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32115 | 41777 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32117 | 41777 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | WRK_MonitorCustomerIndicatorTile | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32121 | 41778 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32123 | 41778 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | WRK_MonitorCustomerIndicatorTile | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32127 | 41779 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32129 | 41779 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | WRK_MonitorCustomerIndicatorTile | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32133 | 41780 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32135 | 41780 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | WRK_MonitorCustomerIndicatorTile | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
