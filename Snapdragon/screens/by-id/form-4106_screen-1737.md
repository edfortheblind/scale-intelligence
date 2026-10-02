# Receipt Monitoring — Form 4106, Screen 1737

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4106 |
| MAIN_UI_SCREEN Object ID | 1737 |
| Label / Form resource key | Receipt Monitoring / MNU_RECEIPT_MONITORING |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | monitor / 6 |
| Configured path | /scale/monitors/4106 |
| Candidate runtime URL | https://trav.manhscale.com/scale/monitors/4106 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4106 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | Not populated |
| Help page reference | receiptmonitoring.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4106 |
| Inspection time (UTC) | 2026-10-02T15:30:39.613Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_RECEIPT_MONITORING |
| Observed configured table/view | Not populated |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1737 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:16:01.215Z | loaded; runtime_inspection | https://trav.manhscale.com/scale/monitors/4106; Receipt Monitoring | [runtime-root.json](../../evidence/runtime-root.json) |

**Observation limits:** Monitor landing inspected; aggregate numerical values excluded; drill-down actions not executed.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Receipt Monitoring is recorded as `monitor`. Its saved configuration contains 3 parts, 6 groups, 11 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4198 / MonitorMenuPane | Not populated / Not populated | 10 / 2500 | Y / Y / N | Not populated |
| 4199 / monitorchartPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4200 / monitorindicatorpane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |

### Part 4198: MonitorMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17446 / MonitorMenuPanel | Not populated | Not populated / Not populated | 70 / 2500 | Y / Y | Fixed to top=Y; loading=0; nested unit=17446; default= |
| 17447 / MonitorMenuBreadCrumbPanel | 17446 | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17446; default= |
| 17448 / MonitorMenuActionPanel | 17446 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17446; default=None |

#### Group 17447: MonitorMenuBreadCrumbPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50435 / MNU_RECEIPT_MONITORINGBreadCrumb | Not populated / Not populated | 310 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17448: MonitorMenuActionPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50436 / MNU_RECEIPT_MONITORINGRefresh | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=REFRESH |
| 50437 / WorkMonitorInsightMenuButton | Insight / INSIGHT | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=INSIGHT |

### Part 4199: monitorchartPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17449 / MonitorPaneSummary | Not populated | Not populated / Not populated | 60 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=17449; default=None |
| 17450 / ListPaneHighchart | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=17450; default=None |

#### Group 17449: MonitorPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50438 / MNU_RECEIPT_MONITORINGSummaryTile0 | Total Receipts / TOTALRECEIPTS | 50 / 1 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50439 / MNU_RECEIPT_MONITORINGSummaryTile1 | Total Receipt Lines / TOTALRECLINES | 50 / 2 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50440 / MNU_RECEIPT_MONITORINGSummaryTile2 | Total Receipt Value / TOTALRECVALUE | 50 / 3 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17450: ListPaneHighchart — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50441 / MNU_RECEIPT_MONITORINGMonitorChart | Not populated / Not populated | 290 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4200: monitorindicatorpane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17451 / indicatorpane | Not populated | Not populated / Not populated | 60 / 17500 | Y / Y | Fixed to top=N; loading=0; nested unit=17451; default=None |

#### Group 17451: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50442 / IndicatorTileIndicator | Indicators / INDICATORS | 30 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50443 / MNU_RECEIPT_MONITORINGIndicatorTile0 | Receipts Over 24 Hours Old / RECOVERHOURS | 320 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50444 / MNU_RECEIPT_MONITORINGIndicatorTile1 | Pending Putaways Over 4 Hours Old / PENDPUTHOURS | 320 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50445 / MNU_RECEIPT_MONITORINGIndicatorTile2 | Receipts With QC / RECWITHQC | 320 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 35 control attributes, 2 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 39620 | 50435 / MNU_RECEIPT_MONITORINGBreadCrumb | breadcrumb | Y / Y / Y | 24 / 0 |
| 39621 | 50435 / MNU_RECEIPT_MONITORINGBreadCrumb | breadcrumb | Y / Y / Y | 22 / 0 |
| 39622 | 50435 / MNU_RECEIPT_MONITORINGBreadCrumb | breadcrumb | Y / Y / Y | 26 / 0 |
| 39623 | 50435 / MNU_RECEIPT_MONITORINGBreadCrumb | breadcrumb | Y / Y / Y | 20 / 0 |
| 39624 | 50441 / MNU_RECEIPT_MONITORINGMonitorChart | data-monitorWebService | Y / Y / Y | 106 / 0 |
| 39625 | 50441 / MNU_RECEIPT_MONITORINGMonitorChart | data-chartType | Y / Y / Y | 12 / 0 |
| 39626 | 50441 / MNU_RECEIPT_MONITORINGMonitorChart | data-chartCategoryMaxCount | Y / Y / Y | 4 / 0 |
| 39627 | 50441 / MNU_RECEIPT_MONITORINGMonitorChart | data-drilldownLevel0criteria | Y / Y / Y | 42 / 0 |
| 39628 | 50441 / MNU_RECEIPT_MONITORINGMonitorChart | data-drilldownLevel0storedprocedure | Y / Y / Y | 68 / 0 |
| 39629 | 50441 / MNU_RECEIPT_MONITORINGMonitorChart | data-drilldownLevel1criteria | Y / Y / Y | 96 / 0 |
| 39630 | 50441 / MNU_RECEIPT_MONITORINGMonitorChart | data-drilldownLevel1storedprocedure | Y / Y / Y | 68 / 0 |
| 39631 | 50441 / MNU_RECEIPT_MONITORINGMonitorChart | data-drilldownLevel2criteria | Y / Y / Y | 150 / 0 |
| 39632 | 50441 / MNU_RECEIPT_MONITORINGMonitorChart | data-drilldownLevel2storedprocedure | Y / Y / Y | 80 / 0 |
| 39633 | 50441 / MNU_RECEIPT_MONITORINGMonitorChart | data-drilldownLevel3criteria | Y / Y / Y | 210 / 0 |
| 39634 | 50441 / MNU_RECEIPT_MONITORINGMonitorChart | data-drilldownLevel3storedprocedure | Y / Y / Y | 62 / 0 |
| 39635 | 50441 / MNU_RECEIPT_MONITORINGMonitorChart | data-drilldownToInsightcriteria | Y / Y / Y | 282 / 0 |
| 39636 | 50441 / MNU_RECEIPT_MONITORINGMonitorChart | data-drilldownToInsight | Y / Y / Y | 480 / 0 |
| 39637 | 50443 / MNU_RECEIPT_MONITORINGIndicatorTile0 | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 39638 | 50443 / MNU_RECEIPT_MONITORINGIndicatorTile0 | data-indicatorTileCriteria | Y / Y / Y | 154 / 0 |
| 39639 | 50443 / MNU_RECEIPT_MONITORINGIndicatorTile0 | data-indicatorTileGoToInsight | Y / Y / Y | 242 / 0 |
| 39640 | 50443 / MNU_RECEIPT_MONITORINGIndicatorTile0 | data-indicatorTileStoredprocedure | Y / Y / Y | 68 / 0 |
| 39641 | 50443 / MNU_RECEIPT_MONITORINGIndicatorTile0 | data-indicatorTileCautionCriteria | Y / Y / Y | 6 / 0 |
| 39642 | 50443 / MNU_RECEIPT_MONITORINGIndicatorTile0 | data-indicatorTileWarningCriteria | Y / Y / Y | 0 / 0 |
| 39643 | 50444 / MNU_RECEIPT_MONITORINGIndicatorTile1 | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 39644 | 50444 / MNU_RECEIPT_MONITORINGIndicatorTile1 | data-indicatorTileCriteria | Y / Y / Y | 222 / 0 |
| 39645 | 50444 / MNU_RECEIPT_MONITORINGIndicatorTile1 | data-indicatorTileGoToInsight | Y / Y / Y | 390 / 0 |
| 39646 | 50444 / MNU_RECEIPT_MONITORINGIndicatorTile1 | data-indicatorTileStoredprocedure | Y / Y / Y | 68 / 0 |
| 39647 | 50444 / MNU_RECEIPT_MONITORINGIndicatorTile1 | data-indicatorTileCautionCriteria | Y / Y / Y | 4 / 0 |
| 39648 | 50444 / MNU_RECEIPT_MONITORINGIndicatorTile1 | data-indicatorTileWarningCriteria | Y / Y / Y | 0 / 0 |
| 39649 | 50445 / MNU_RECEIPT_MONITORINGIndicatorTile2 | data-indicatorTileWebService | Y / Y / Y | 106 / 0 |
| 39650 | 50445 / MNU_RECEIPT_MONITORINGIndicatorTile2 | data-indicatorTileCriteria | Y / Y / Y | 74 / 0 |
| 39651 | 50445 / MNU_RECEIPT_MONITORINGIndicatorTile2 | data-indicatorTileGoToInsight | Y / Y / Y | 208 / 0 |
| 39652 | 50445 / MNU_RECEIPT_MONITORINGIndicatorTile2 | data-indicatorTileStoredprocedure | Y / Y / Y | 68 / 0 |
| 39653 | 50445 / MNU_RECEIPT_MONITORINGIndicatorTile2 | data-indicatorTileCautionCriteria | Y / Y / Y | 0 / 0 |
| 39654 | 50445 / MNU_RECEIPT_MONITORINGIndicatorTile2 | data-indicatorTileWarningCriteria | Y / Y / Y | 0 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17412 / click | 50436 / MNU_RECEIPT_MONITORINGRefresh | _webUi.monitor.refreshButtonClicked | Not populated | Y / Y |
| 17413 / click | 50437 / WorkMonitorInsightMenuButton | _webUi.monitor.jumpToInsight | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 25230 / 17413 | URL | Y / Y | 480 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 11 selected candidate rows for this Screen: **11 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 39624 | 50441 / Not applicable | data-monitorWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39628 | 50441 / Not applicable | data-drilldownLevel0storedprocedure | stored_procedure_identifier | RCPT_MonitorReceiptsDatesChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39630 | 50441 / Not applicable | data-drilldownLevel1storedprocedure | stored_procedure_identifier | RCPT_MonitorReceiptsTypesChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39632 | 50441 / Not applicable | data-drilldownLevel2storedprocedure | stored_procedure_identifier | RCPT_MonitorReceiptsVendorNamesChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39634 | 50441 / Not applicable | data-drilldownLevel3storedprocedure | stored_procedure_identifier | RCPT_MonitorReceiptsPOChartData | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39637 | 50443 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39640 | 50443 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | RCPT_MonitorReceiptsIndicatorTiles | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39643 | 50444 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39646 | 50444 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | RCPT_MonitorReceiptsIndicatorTiles | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39649 | 50445 / Not applicable | data-indicatorTileWebService | relative_api_path | /general/scaleapi/GenericMonitorDataRetrievalApi/Post | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 39652 | 50445 / Not applicable | data-indicatorTileStoredprocedure | stored_procedure_identifier | RCPT_MonitorReceiptsIndicatorTiles | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
