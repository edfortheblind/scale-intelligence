# Shipment Monitoring: Customer — Form 4013, Screen 1496

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4013 |
| MAIN_UI_SCREEN Object ID | 1496 |
| Label / Form resource key | Shipment Monitoring: Customer / MNU_SHIPMENT_MONITORING_CUST |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | monitor / 6 |
| Configured path | /scale/monitors/4013 |
| Candidate runtime URL | https://trav.manhscale.com/scale/monitors/4013 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4013 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | Not populated |
| Help page reference | shipmentmonitoringCust.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4013 |
| Inspection time (UTC) | 2026-10-02T15:26:58.734Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_SHIPMENT_MONITORING_CUST |
| Observed configured table/view | Not populated |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1496 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:17:13.606Z | loaded; landing | https://trav.manhscale.com/scale/monitors/4013; Shipment Monitoring: Customer | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Shipment Monitoring: Customer is recorded as `monitor`. Its saved configuration contains 3 parts, 6 groups, 12 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3452 / MonitorMenuPane | Not populated / Not populated | 10 / 2500 | Y / Y / N | Not populated |
| 3453 / monitorchartPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 3454 / monitorindicatorpane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |

### Part 3452: MonitorMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14388 / MonitorMenuPanel | Not populated | Not populated / Not populated | 70 / 2500 | Y / Y | Fixed to top=Y; loading=0; nested unit=14388; default= |
| 14389 / MonitorMenuBreadCrumbPanel | 14388 | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=14388; default= |
| 14390 / MonitorMenuActionPanel | 14388 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=14388; default=None |

#### Group 14389: MonitorMenuBreadCrumbPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41753 / MNU_SHIPMENT_MONITORING_CUSTBreadCrumb | Not populated / Not populated | 310 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14390: MonitorMenuActionPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41754 / MNU_SHIPMENT_MONITORING_CUSTRefresh | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=REFRESH |
| 41755 / MNU_SHIPMENT_MONITORING_CUSTInsight | Insight / INSIGHT | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=INSIGHT |

### Part 3453: monitorchartPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14391 / MonitorPaneSummary | Not populated | Not populated / Not populated | 60 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=14391; default=None |
| 14392 / ListPaneHighchart | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=14392; default=None |

#### Group 14391: MonitorPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41756 / MNU_SHIPMENT_MONITORING_CUSTSummaryTile0 | Total Shipments / TOTALSHIPMENTS | 50 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41757 / MNU_SHIPMENT_MONITORING_CUSTSummaryTile1 | Total Shipping Loads / TOTALSHIPPINGLOADS | 50 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41758 / MNU_SHIPMENT_MONITORING_CUSTSummaryTile2 | Wip Shipments / WIPSHIPMENTS | 50 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41759 / MNU_SHIPMENT_MONITORING_CUSTSummaryTile3 | Shipments Not Started / SHIPMENTSNOTSTARTED | 50 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14392: ListPaneHighchart — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41760 / MNU_SHIPMENT_MONITORING_CUSTMonitorChart | Not populated / Not populated | 290 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3454: monitorindicatorpane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14393 / indicatorpane | Not populated | Not populated / Not populated | 60 / 17500 | Y / Y | Fixed to top=N; loading=0; nested unit=14393; default=None |

#### Group 14393: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41761 / IndicatorTileIndicator | Indicators / INDICATORS | 30 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41762 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile0 | Loads Pending Confirm / LOADSPENDINGCONFIRM | 320 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41763 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile1 | Future Loads / FUTURELOADS | 320 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 41764 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile2 | Shipments With No Carrier Assigned / SHIPMENTSWITHNOCARI | 320 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 32 control attributes, 2 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32057 | 41753 / MNU_SHIPMENT_MONITORING_CUSTBreadCrumb | breadcrumb | Y / Y / Y | 34 / 0 |
| 32058 | 41753 / MNU_SHIPMENT_MONITORING_CUSTBreadCrumb | breadcrumb | Y / Y / Y | 18 / 0 |
| 32059 | 41753 / MNU_SHIPMENT_MONITORING_CUSTBreadCrumb | breadcrumb | Y / Y / Y | 24 / 0 |
| 32060 | 41760 / MNU_SHIPMENT_MONITORING_CUSTMonitorChart | data-monitorWebService | Y / Y / Y | 106 / 0 |
| 32061 | 41760 / MNU_SHIPMENT_MONITORING_CUSTMonitorChart | data-chartType | Y / Y / Y | 12 / 0 |
| 32062 | 41760 / MNU_SHIPMENT_MONITORING_CUSTMonitorChart | data-chartCategoryMaxCount | Y / Y / Y | 4 / 0 |
| 32063 | 41760 / MNU_SHIPMENT_MONITORING_CUSTMonitorChart | data-drilldownLevel0criteria | Y / Y / Y | 146 / 0 |
| 32064 | 41760 / MNU_SHIPMENT_MONITORING_CUSTMonitorChart | data-drilldownLevel0storedprocedure | Y / Y / Y | 56 / 0 |
| 32065 | 41760 / MNU_SHIPMENT_MONITORING_CUSTMonitorChart | data-drilldownLevel1criteria | Y / Y / Y | 214 / 0 |
| 32066 | 41760 / MNU_SHIPMENT_MONITORING_CUSTMonitorChart | data-drilldownLevel1storedprocedure | Y / Y / Y | 72 / 0 |
| 32067 | 41760 / MNU_SHIPMENT_MONITORING_CUSTMonitorChart | data-drilldownLevel2criteria | Y / Y / Y | 262 / 0 |
| 32068 | 41760 / MNU_SHIPMENT_MONITORING_CUSTMonitorChart | data-drilldownLevel2storedprocedure | Y / Y / Y | 68 / 0 |
| 32069 | 41760 / MNU_SHIPMENT_MONITORING_CUSTMonitorChart | data-drilldownToInsightcriteria | Y / Y / Y | 262 / 0 |
| 32070 | 41760 / MNU_SHIPMENT_MONITORING_CUSTMonitorChart | data-drilldownToInsight | Y / Y / Y | 586 / 0 |
| 32071 | 41762 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile0 | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 32072 | 41762 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile0 | data-indicatorTileCriteria | Y / Y / Y | 152 / 0 |
| 32073 | 41762 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile0 | data-indicatorTileGoToInsight | Y / Y / Y | 378 / 0 |
| 32074 | 41762 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile0 | data-indicatorTileStoredprocedure | Y / Y / Y | 64 / 0 |
| 32075 | 41762 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile0 | data-indicatorTileCautionCriteria | Y / Y / Y | 0 / 0 |
| 32076 | 41762 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile0 | data-indicatorTileWarningCriteria | Y / Y / Y | 0 / 0 |
| 32077 | 41763 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile1 | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 32078 | 41763 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile1 | data-indicatorTileCriteria | Y / Y / Y | 226 / 0 |
| 32079 | 41763 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile1 | data-indicatorTileGoToInsight | Y / Y / Y | 478 / 0 |
| 32080 | 41763 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile1 | data-indicatorTileStoredprocedure | Y / Y / Y | 64 / 0 |
| 32081 | 41763 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile1 | data-indicatorTileCautionCriteria | Y / Y / Y | 0 / 0 |
| 32082 | 41763 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile1 | data-indicatorTileWarningCriteria | Y / Y / Y | 0 / 0 |
| 32083 | 41764 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile2 | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 32084 | 41764 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile2 | data-indicatorTileCriteria | Y / Y / Y | 210 / 0 |
| 32085 | 41764 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile2 | data-indicatorTileGoToInsight | Y / Y / Y | 432 / 0 |
| 32086 | 41764 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile2 | data-indicatorTileStoredprocedure | Y / Y / Y | 64 / 0 |
| 32087 | 41764 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile2 | data-indicatorTileCautionCriteria | Y / Y / Y | 0 / 0 |
| 32088 | 41764 / MNU_SHIPMENT_MONITORING_CUSTIndicatorTile2 | data-indicatorTileWarningCriteria | Y / Y / Y | 0 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 13902 / click | 41754 / MNU_SHIPMENT_MONITORING_CUSTRefresh | _webUi.monitor.refreshButtonClicked | Not populated | Y / Y |
| 13903 / click | 41755 / MNU_SHIPMENT_MONITORING_CUSTInsight | _webUi.monitor.jumpToInsight | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19209 / 13903 | URL | Y / Y | 518 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 10 selected candidate rows for this Screen: **10 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32060 | 41760 / Not applicable | data-monitorWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32064 | 41760 / Not applicable | data-drilldownLevel0storedprocedure | stored_procedure_identifier | SHP_MonitorShipmentChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32066 | 41760 / Not applicable | data-drilldownLevel1storedprocedure | stored_procedure_identifier | SHP_MonitorCustomerCategoryChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32068 | 41760 / Not applicable | data-drilldownLevel2storedprocedure | stored_procedure_identifier | SHP_MonitorCustomerShipToChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32071 | 41762 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32074 | 41762 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | SHP_MonitorShipmentIndicatorTile | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32077 | 41763 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32080 | 41763 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | SHP_MonitorShipmentIndicatorTile | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32083 | 41764 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32086 | 41764 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | SHP_MonitorShipmentIndicatorTile | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
