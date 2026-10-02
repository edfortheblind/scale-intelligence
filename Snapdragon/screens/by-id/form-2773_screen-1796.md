# Wave Insight — Form 2773, Screen 1796

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2773 |
| MAIN_UI_SCREEN Object ID | 1796 |
| Label / Form resource key | Wave Insight / MNU_WAVEINSIGHT |
| Functional area code | 30 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2773 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2773 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2773 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | WAVE_InsightDetailPaneData |
| Help page reference | waveInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2773 |
| Inspection time (UTC) | 2026-10-02T15:23:57.156Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_WAVEINSIGHT |
| Observed configured table/view | WAVE_InsightDetailPaneData |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1796 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:09:15.185Z | loaded; landing | https://trav.manhscale.com/scale/insights/2773; Wave Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:09:31.716Z | loaded; actions | https://trav.manhscale.com/scale/insights/2773; Wave Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:10:03.506Z | loaded; advanced | https://trav.manhscale.com/scale/insights/2773; Wave Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:10:18.472Z | loaded; wave_status | https://trav.manhscale.com/scale/insights/2773; Wave Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |

**Visible criteria / entry fields:** Wave; Name; Flow; Warehouse; From Start Date Time; To Start Date Time; From Date Stamp; To Date Stamp.

**Visible grid headers:** Icon; Wave; Status; Name; Current Wave Step; Flow; Total Shipments; Total Lines; Released; Field; Operand; Value.

**Observed action/menu labels:** New; Edit; Delete; Build; Cancel; Reprint Documents; Reprint Labels; Release; Run; Run (Select Printers).

**Page groups:** Basic Criteria; Wave Status; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Wave Insight is recorded as `insight`. Its saved configuration contains 7 parts, 26 groups, 53 controls, and 35 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4495 / SaveSearchModalDialog | Not populated / Not populated | 20 / 250 | Y / Y / Y | SaveSearchSaveButton |
| 4497 / InsightMenuPane | Not populated / Not populated | 10 / 500 | Y / Y / N | Not populated |
| 4498 / SearchPane | Not populated / Not populated | 10 / 750 | Y / Y / N | InsightMenuApply |
| 4499 / ListPane | Not populated / Not populated | 10 / 1000 | Y / Y / N | Not populated |
| 4500 / DetailPane | Not populated / Not populated | 10 / 1250 | Y / Y / N | Not populated |
| 4501 / WaveLabelReprintChoiceModalDialog | Not populated / Not populated | 20 / 1700 | Y / Y / Y | ModalCancelButton |
| 4496 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |

### Part 4495: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18450 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18450; default=None |
| 18451 / SaveSearchModalDialogHeader | 18450 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18450; default=None |
| 18452 / SaveSearchModalDialogBody | 18450 | Not populated / Not populated | 120 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=18450; default=None |
| 18453 / SaveSearchModalDialogFooter | 18450 | Not populated / Not populated | 130 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=18450; default=None |

#### Group 18452: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52403 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18453: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52404 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52405 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4497: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18458 / InsightMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=18458; default=None |
| 18459 / InsightMenuPanel | 18458 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=18458; default=None |
| 18460 / InsightMenuFavoritesDropdown | 18458 | Favorites / FAVORITES | 100 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=18458; default=None |
| 18462 / MenuExportToExcelPanel | 18458 | Not populated / Not populated | 60 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=18458; default=None |
| 18463 / InsightMenuActionsDropdown | 18458 | Actions / ACTIONS | 80 / 1000 | Y / Y | Fixed to top=N; loading=0; nested unit=18458; default=None |
| 18461 / InsightListPaneMenuPanel | 18458 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18458; default=None |

#### Group 18459: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52409 / InsightMenuApply | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 52410 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 52411 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 650 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 52412 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18462: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52417 / MenuExportToExcel | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18463: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52418 / ListPaneMenuActionNewWave | New / NEW | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEW |
| 52419 / ListPaneMenuActionEditWave | Edit / EDIT | 150 / 1500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 52420 / ListPaneMenuActionViewWave | View / VIEW | 150 / 1750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 52421 / ListPaneMenuActionDeleteWave | Delete / DELETE | 150 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 52422 / ListPaneMenuActionBuildWave | Build / BUILDWAVE | 150 / 2250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BUILDWAVE |
| 52423 / ListPaneMenuActionCancelLaunch | Cancel / MNU_CANCELWAVE | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=MNU_CANCELWAVE |
| 52424 / ListPaneMenuActionReprintwaveDocs | Reprint Documents / REPRINTDOCS | 150 / 2600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=REPRINTDOCS |
| 52425 / ListPaneMenuActionReprintwaveLabels | Reprint Labels / REPRINTWAVELABELS | 150 / 2750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=REPRINTWAVELABELS |
| 52426 / ListPaneMenuActionReleaseWave | Release / RELEASE | 150 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=RELEASE |
| 52427 / ListPaneMenuActionRunWave | Run / RUNWAVE | 150 / 3250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=RUNWAVE |
| 52428 / ListPaneMenuActionRunWavePrinterSelection | Run (Select Printers) / RUNWAVEPRINTERSELECTION | 150 / 3500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=RUNWAVEPRINTERSELECTION |

#### Group 18461: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52413 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52414 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 52415 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 52416 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

### Part 4498: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18464 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18464; default=None |
| 18465 / SearchPaneBasicCriteria | 18464 | Basic Criteria / BASICCRITERIA | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=18464; default=None |
| 18466 / SearchPaneWaveType | 18464 | Wave Status / WAVESTATUS | 50 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=18464; default=None |
| 18467 / SearchPaneAdvancedCriteria | 18464 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=18464; default=None |

#### Group 18465: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52429 / BasicCriteriaWaveNumber | Wave / WAVE | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52430 / BasicCriteriaWaveName | Name / NAME | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52431 / BasicCriteriaWaveFlow | Flow / FLOW | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52432 / BasicCriteriaWarehouse | Warehouse / WAREHOUSE | 280 / 800 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52433 / BasicCriteriaStartedDate | Started Date Time / STARTEDDATETIME | 190 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52434 / BasicCriteriaDateTimeRange | Date Time Stamp / DATETIMESTAMP | 190 / 1500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18466: SearchPaneWaveType — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52435 / WaveTypeIncludeActiveWaves | Show Active Waves / SHOWACTIVEWAVES | 130 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52436 / WaveTypeIncludeCompletedWaves | Show Completed Waves / SHOWCOMPLETEDWAVES | 130 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52437 / WaveTypeIncludeCancelledlWaves | Show Cancelled Waves / SHOWCANCELLEDWAVES | 130 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52438 / WaveTypeIncludeReleasedlWaves | Show Released Waves / SHOWRELEASEDWAVES | 130 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18467: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52439 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 250 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4499: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18468 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18468; default=None |
| 18469 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=18469; default=None |

#### Group 18468: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52440 / ListPaneSummaryWaves | Waves / WAVES | 50 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52441 / ListPaneSummaryShipments | Shipments / SHIPMENTS | 50 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52442 / ListPaneSummaryLines | Lines / LINES | 50 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52443 / ListPaneSummaryUnits | Units / UNITS | 50 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18469: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52444 / ListPaneDataGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 52444 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18884 / WAVE_STATUS | WAVE_STATUS / Not populated / Not populated | Not populated / 50 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18889 / Not populated | TOTAL_SHIPMENTS / Total Shipments / TOTALSHIPMENTS | Not populated / 30 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18895 / Not populated | TOTAL_SHIPMENTS / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18880 / ICON | Not populated / Icon / ICON | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18882 / WAVE_NUMBER | INTERNAL_LAUNCH_NUM / Wave / WAVE | 20 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18883 / WAVE_STATUS | Not populated / Status / STATUS | 10 / 10 / 35 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18885 / WAVE_NAME | Not populated / Name / NAME | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18886 / CURRENT_LAUNCH_STEP | Not populated / Current Wave Step / CURRENTLAUNCHSTEP | 10 / 10 / 45 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18887 / WAVE_FLOW | Not populated / Flow / FLOW | 10 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18890 / TOTAL_SHIPMENTS | TOTAL_SHIPMENTS / Total Shipments / TOTALSHIPMENTS | 20 / 10 / 65 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18891 / TOTAL_LINES | Not populated / Total Lines / TOTALLINES | 20 / 10 / 70 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18901 / RELEASED | Not populated / Released / RELEASED | 40 / 10 / 70 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18892 / WAVE_MODE | Not populated / Mode / MODE | 10 / 10 / 75 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18893 / WAVE_DATE_TIME_STARTED | Not populated / Started Date Time / STARTEDDATETIME | 30 / 10 / 90 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18894 / WAVE_DATE_TIME_ENDED | Not populated / Ended Date Time / ENDEDDATETIME | 30 / 10 / 100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18896 / TOTAL_QTY | Not populated / Total Quantity / TOTAL_QTY | 20 / 10 / 130 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18897 / LAST_LAUNCH_STEP | Not populated / Last Wave Step / LASTLAUNCHSTEP | 10 / 10 / 140 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18898 / ACTIVE | Not populated / Active / ACTIVE | 40 / 10 / 150 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18903 / CANCEL_LAUNCH | Not populated / Cancel Wave / CANCELLAUNCH | 40 / 10 / 150 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18899 / COMPLETED | Not populated / Completed / Completed | 40 / 10 / 160 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18904 / WAREHOUSE | WAREHOUSE / Warehouse / WAREHOUSE | 10 / 10 / 160 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18900 / IN_CANCELLATION | Not populated / In Cancellation / INCANCELLATION | 40 / 10 / 165 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18902 / CANCELLED | Not populated / Cancelled / CANCELLED | 40 / 10 / 170 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18888 / RELEASED_IDENTIFIER | Not populated / Released (Identifier) / RELEASED_IDENTIFIER | 10 / 10 / 180 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18905 / WAVE_LABEL_STATUS | Not populated / Wave Label Status / WAVELABELSTATUS | 10 / 10 / 190 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18906 / Not populated | METADATA_INSIGHT_WAVE_VIEW.WAREHOUSE / Not populated / Not populated | Not populated / 20 / 200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18907 / Not populated | METADATA_INSIGHT_WAVE_VIEW.RELEASED / Not populated / Not populated | Not populated / 20 / 210 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18908 / Not populated | METADATA_INSIGHT_WAVE_VIEW.WAVE_DATE_TIME_STARTED / Not populated / Not populated | Not populated / 20 / 220 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18909 / Not populated | METADATA_INSIGHT_WAVE_VIEW.CURRENT_LAUNCH_STEP / Not populated / Not populated | Not populated / 20 / 230 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18910 / Not populated | METADATA_INSIGHT_WAVE_VIEW.LAST_LAUNCH_STEP / Not populated / Not populated | Not populated / 20 / 240 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18911 / Not populated | INTERNAL_LAUNCH_NUM / Not populated / Not populated | Not populated / 20 / 250 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18912 / Not populated | Not populated / Not populated / Not populated | Not populated / 30 / 260 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18913 / Not populated | Not populated / Not populated / Not populated | Not populated / 30 / 270 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18914 / COLOR | Not populated / Color / COLOR | 10 / 10 / 280 / 1 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18881 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 290 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4500: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18470 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18470; default=None |
| 18471 / indicatorpane | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=18471; default=None |

#### Group 18470: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52445 / DetailPaneHeaderWaveNumber | Wave Number / INTERNALLAUNCHNUM | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=614; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52446 / DetailPaneHeaderWaveName | Wave Name / LAUNCHNAME | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=614; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18471: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52447 / WaveInsightIndicatorTilePlannedShipments | Planned Shipments / PLANNEDSHIPMENTS | 360 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52448 / WaveInsightIndicatorTileWavedShipments | Waved Shipments / WAVEDSHIPMENTS | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52449 / WaveInsightIndicatorTileLines | Lines / LINES | 360 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52450 / WaveInsightIndicatorTileContainers | Containers / CONTAINERS | 360 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52451 / WaveInsightIndicatorTileWorkUnits | Work Units / WORKUNITS | 360 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4501: WaveLabelReprintChoiceModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18472 / ReprintDialogForm | Not populated | Not populated / Not populated | 90 / 2000 | Y / Y | Fixed to top=N; loading=0; nested unit=18472; default=None |
| 18473 / ReprintModalChoiceDialogHeader | 18472 | Confirmation / CONFIRMATION | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18472; default=None |
| 18474 / ReprintModalChoiceDialogBody | 18472 | Not populated / Not populated | 120 / 3000 | Y / Y | Fixed to top=N; loading=0; nested unit=18472; default=None |
| 18475 / ReprintModalChoiceDialogFooter | 18472 | Not populated / Not populated | 130 / 4000 | Y / Y | Fixed to top=N; loading=0; nested unit=18472; default=None |

#### Group 18474: ReprintModalChoiceDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52452 / ReprintChoiceModalBodyMessage | Not populated / MSG_MISSINGLABEL01 | 30 / 3500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18475: ReprintModalChoiceDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52453 / ModalPrintButton | Print / BTN_PRINT | 100 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_PRINT |
| 52454 / ModalRegenerateButton | Regenerate / BTN_REGENERATE | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_REGENERATE |
| 52455 / ModalCancelButton | Cancel / BTN_CANCEL | 100 / 5500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

### Part 4496: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18454 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18454; default=None |
| 18455 / GadgetCalculationQueryDialogHeader | 18454 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18454; default=None |
| 18456 / GadgetCalculationQueryDialogBody | 18454 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18454; default=None |
| 18457 / GadgetCalculationQueryDialogFooter | 18454 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18454; default=None |

#### Group 18456: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52406 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18457: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52407 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52408 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 62 control attributes, 31 events, and 59 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 41517 | 52403 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 41518 | 52403 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 41519 | 52412 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41520 | 52413 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41521 | 52418 / ListPaneMenuActionNewWave | data-formId | Y / Y / N | 8 / 0 |
| 41522 | 52418 / ListPaneMenuActionNewWave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41523 | 52419 / ListPaneMenuActionEditWave | data-formId | Y / Y / N | 8 / 0 |
| 41524 | 52419 / ListPaneMenuActionEditWave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41525 | 52420 / ListPaneMenuActionViewWave | data-formId | Y / Y / N | 8 / 0 |
| 41526 | 52421 / ListPaneMenuActionDeleteWave | data-formId | Y / Y / N | 8 / 0 |
| 41527 | 52421 / ListPaneMenuActionDeleteWave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41528 | 52421 / ListPaneMenuActionDeleteWave | data-divider | Y / Y / N | 8 / 0 |
| 41529 | 52422 / ListPaneMenuActionBuildWave | data-formId | Y / Y / N | 8 / 0 |
| 41530 | 52422 / ListPaneMenuActionBuildWave | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41531 | 52422 / ListPaneMenuActionBuildWave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41532 | 52423 / ListPaneMenuActionCancelLaunch | data-formId | Y / Y / N | 8 / 0 |
| 41533 | 52423 / ListPaneMenuActionCancelLaunch | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41534 | 52423 / ListPaneMenuActionCancelLaunch | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41535 | 52424 / ListPaneMenuActionReprintwaveDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41536 | 52425 / ListPaneMenuActionReprintwaveLabels | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41537 | 52426 / ListPaneMenuActionReleaseWave | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41538 | 52426 / ListPaneMenuActionReleaseWave | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41539 | 52427 / ListPaneMenuActionRunWave | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41540 | 52428 / ListPaneMenuActionRunWavePrinterSelection | data-formId | Y / Y / N | 8 / 0 |
| 41541 | 52428 / ListPaneMenuActionRunWavePrinterSelection | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41542 | 52429 / BasicCriteriaWaveNumber | data-dbcolumn | Y / Y / N | 38 / 0 |
| 41543 | 52429 / BasicCriteriaWaveNumber | Lookup | Y / Y / N | 106 / 1 |
| 41544 | 52429 / BasicCriteriaWaveNumber | nullable | Y / Y / Y | 8 / 0 |
| 41545 | 52430 / BasicCriteriaWaveName | data-dbcolumn | Y / Y / N | 22 / 0 |
| 41546 | 52430 / BasicCriteriaWaveName | Lookup | Y / Y / N | 88 / 1 |
| 41547 | 52431 / BasicCriteriaWaveFlow | data-dbcolumn | Y / Y / N | 22 / 0 |
| 41548 | 52432 / BasicCriteriaWarehouse | defaultValue | Y / Y / Y | 32 / 0 |
| 41549 | 52432 / BasicCriteriaWarehouse | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41550 | 52433 / BasicCriteriaStartedDate | data-dbcolumn | Y / Y / N | 44 / 0 |
| 41551 | 52434 / BasicCriteriaDateTimeRange | data-dbcolumn | Y / Y / N | 30 / 0 |
| 41552 | 52434 / BasicCriteriaDateTimeRange | allowTodayOnlySelection | Y / Y / Y | 8 / 0 |
| 41553 | 52434 / BasicCriteriaDateTimeRange | todayOnly-On | Y / Y / Y | 10 / 0 |
| 41554 | 52435 / WaveTypeIncludeActiveWaves | data-dbcolumn | Y / Y / N | 12 / 0 |
| 41555 | 52435 / WaveTypeIncludeActiveWaves | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41556 | 52435 / WaveTypeIncludeActiveWaves | data-negativeCondition | Y / Y / N | 10 / 0 |
| 41557 | 52436 / WaveTypeIncludeCompletedWaves | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41558 | 52436 / WaveTypeIncludeCompletedWaves | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41559 | 52436 / WaveTypeIncludeCompletedWaves | data-negativeCondition | Y / Y / N | 10 / 0 |
| 41560 | 52437 / WaveTypeIncludeCancelledlWaves | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41561 | 52437 / WaveTypeIncludeCancelledlWaves | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41562 | 52437 / WaveTypeIncludeCancelledlWaves | data-negativeCondition | Y / Y / N | 10 / 0 |
| 41563 | 52438 / WaveTypeIncludeReleasedlWaves | data-dbcolumn | Y / Y / N | 16 / 0 |
| 41564 | 52438 / WaveTypeIncludeReleasedlWaves | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41565 | 52438 / WaveTypeIncludeReleasedlWaves | data-negativeCondition | Y / Y / N | 12 / 0 |
| 41566 | 52441 / ListPaneSummaryShipments | data-aggregateClause | Y / Y / Y | 40 / 0 |
| 41567 | 52442 / ListPaneSummaryLines | data-aggregateClause | Y / Y / Y | 32 / 0 |
| 41568 | 52443 / ListPaneSummaryUnits | data-aggregateClause | Y / Y / Y | 28 / 0 |
| 41569 | 52444 / ListPaneDataGrid | data-dbtable | Y / Y / N | 52 / 0 |
| 41570 | 52444 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 22 / 0 |
| 41571 | 52444 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 41572 | 52444 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 41573 | 52445 / DetailPaneHeaderWaveNumber | href | Y / Y / Y | 112 / 0 |
| 41574 | 52447 / WaveInsightIndicatorTilePlannedShipments | data-indicatorTileGoToInsight | Y / Y / Y | 318 / 0 |
| 41575 | 52448 / WaveInsightIndicatorTileWavedShipments | data-indicatorTileGoToInsight | Y / Y / Y | 186 / 0 |
| 41576 | 52449 / WaveInsightIndicatorTileLines | data-indicatorTileGoToInsight | Y / Y / Y | 186 / 0 |
| 41577 | 52450 / WaveInsightIndicatorTileContainers | data-indicatorTileGoToInsight | Y / Y / Y | 204 / 0 |
| 41578 | 52451 / WaveInsightIndicatorTileWorkUnits | data-indicatorTileGoToInsight | Y / Y / Y | 186 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18482 / click | 52404 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18483 / click | 52405 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18484 / click | 52407 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18485 / click | 52408 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18486 / click | 52409 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18487 / click | 52410 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18488 / click | 52411 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18489 / click | 52412 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18490 / click | 52413 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18491 / click | 52414 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 18492 / click | 52415 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18493 / click | 52416 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18494 / click | 52417 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18495 / click | 52418 / ListPaneMenuActionNewWave | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18496 / click | 52419 / ListPaneMenuActionEditWave | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18497 / click | 52420 / ListPaneMenuActionViewWave | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18498 / click | 52421 / ListPaneMenuActionDeleteWave | _webUi.insightListPaneActions.menuActionPerformDelete | Not populated | Y / Y |
| 18499 / click | 52422 / ListPaneMenuActionBuildWave | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18500 / click | 52423 / ListPaneMenuActionCancelLaunch | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTabWithPost | Not populated | Y / Y |
| 18501 / click | 52424 / ListPaneMenuActionReprintwaveDocs | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 18502 / click | 52425 / ListPaneMenuActionReprintwaveLabels | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 18503 / click | 52426 / ListPaneMenuActionReleaseWave | _webUi.waveInsight.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18504 / click | 52427 / ListPaneMenuActionRunWave | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18505 / click | 52428 / ListPaneMenuActionRunWavePrinterSelection | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 18506 / iggridrequesterror | 52444 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18507 / iggriddatabound | 52444 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18508 / iggridselectionrowselectionchanged | 52444 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18509 / iggridselectionactiverowchanged | 52444 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |
| 18510 / click | 52453 / ModalPrintButton | _webUi.waveInsight.reprintChoiceModalButtonClicked | Not populated | Y / Y |
| 18511 / click | 52454 / ModalRegenerateButton | _webUi.waveInsight.reprintChoiceModalButtonClicked | Not populated | Y / Y |
| 18512 / click | 52455 / ModalCancelButton | _webUi.waveInsight.reprintChoiceModalButtonClicked | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 27398 / 18482 | GETServiceURL | Y / Y | 76 |
| 27399 / 18482 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 27400 / 18482 | queryParameter_Function_UserName | Y / Y | 44 |
| 27401 / 18482 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27402 / 18482 | POSTServiceURL | Y / Y | 74 |
| 27403 / 18482 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 27404 / 18482 | PostData_Function_UserName | Y / Y | 44 |
| 27405 / 18482 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27406 / 18482 | PostData_Function_SearchValue | Y / Y | 98 |
| 27407 / 18482 | Post_SuccessCallback | Y / Y | 114 |
| 27408 / 18482 | ModalDialogName | Y / Y | 42 |
| 27409 / 18483 | ModalDialogName | Y / Y | 42 |
| 27410 / 18484 | POSTServiceURL | Y / Y | 144 |
| 27411 / 18484 | Form_Id | Y / Y | 8 |
| 27412 / 18484 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 27413 / 18484 | PostData_Function_SearchValue | Y / Y | 98 |
| 27414 / 18484 | Post_SuccessCallback | Y / Y | 114 |
| 27415 / 18484 | ModalDialogName | Y / Y | 56 |
| 27416 / 18485 | ModalDialogName | Y / Y | 56 |
| 27417 / 18489 | ModalDialogName | Y / Y | 42 |
| 27418 / 18490 | ModalDialogName | Y / Y | 56 |
| 27419 / 18495 | URL | Y / Y | 40 |
| 27420 / 18496 | URL | Y / Y | 112 |
| 27421 / 18497 | URL | Y / Y | 112 |
| 27422 / 18498 | ConfirmationMessageCode | Y / Y | 24 |
| 27423 / 18498 | ConfirmationTitleCode | Y / Y | 20 |
| 27424 / 18498 | DELETEServiceURL | Y / Y | 70 |
| 27425 / 18498 | queryParameter_internalLaunchNumber | Y / Y | 20 |
| 27426 / 18498 | Delete_SuccessCallback | Y / Y | 140 |
| 27427 / 18499 | URL | Y / Y | 44 |
| 27428 / 18500 | PostData_Grid_ListPaneDataGrid_internalLaunchNum | Y / Y | 22 |
| 27429 / 18500 | POSTServiceURL | Y / Y | 90 |
| 27430 / 18501 | URL | Y / Y | 148 |
| 27431 / 18502 | URL | Y / Y | 148 |
| 27432 / 18503 | ConfirmationMessageCode | Y / Y | 24 |
| 27433 / 18503 | ConfirmationTitleCode | Y / Y | 22 |
| 27434 / 18503 | POSTServiceURL | Y / Y | 84 |
| 27435 / 18503 | PostData_Grid_ListPaneDataGrid_InternalLaunchNumber | Y / Y | 22 |
| 27436 / 18503 | Post_SuccessCallback | Y / Y | 140 |
| 27437 / 18503 | Post_ErrorCallback | Y / Y | 98 |
| 27438 / 18504 | ConfirmationMessageCode | Y / Y | 24 |
| 27439 / 18504 | ConfirmationTitleCode | Y / Y | 14 |
| 27440 / 18504 | POSTServiceURL | Y / Y | 86 |
| 27441 / 18504 | PostData_Grid_ListPaneDataGrid_InternalLaunchNumber | Y / Y | 22 |
| 27442 / 18504 | Post_SuccessCallback | Y / Y | 140 |
| 27443 / 18505 | URL | Y / Y | 132 |
| 27444 / 18505 | queryParameter_internalLaunchNumber | Y / Y | 20 |
| 27445 / 18509 | POSTServiceURL | Y / Y | 74 |
| 27446 / 18509 | PostData_storedProcedure | Y / Y | 52 |
| 27447 / 18509 | PostData_InternalLaunchNum | Y / Y | 22 |
| 27448 / 18509 | EnableAction_ListPaneMenuActionEditWave | Y / Y | 40 |
| 27449 / 18509 | EnableAction_ListPaneMenuActionViewWave | Y / Y | 40 |
| 27450 / 18509 | EnableAction_ListPaneMenuActionDeleteWave | Y / Y | 126 |
| 27451 / 18509 | EnableAction_ListPaneMenuActionRunWave | Y / Y | 126 |
| 27452 / 18509 | EnableAction_ListPaneMenuActionReleaseWave | Y / Y | 36 |
| 27453 / 18509 | EnableAction_ListPaneMenuActionReprintwaveDocs | Y / Y | 136 |
| 27454 / 18509 | EnableAction_ListPaneMenuActionReprintwaveLabels | Y / Y | 136 |
| 27455 / 18509 | EnableAction_ListPaneMenuActionRunWavePrinterSelection | Y / Y | 126 |
| 27456 / 18509 | EnableAction_ListPaneMenuActionCancelLaunch | Y / Y | 44 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 53 selected candidate rows for this Screen: **52 accepted tokens** and **1 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 41519 | 52412 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41520 | 52413 / Not applicable | data-securityCheckpoint | checkpoint | 26 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41521 | 52418 / Not applicable | data-formId | form_id | 4031 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41522 | 52418 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41523 | 52419 / Not applicable | data-formId | form_id | 3003 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41524 | 52419 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41525 | 52420 / Not applicable | data-formId | form_id | 3003 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41526 | 52421 / Not applicable | data-formId | form_id | 3003 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41527 | 52421 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41529 | 52422 / Not applicable | data-formId | form_id | 4024 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41531 | 52422 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41532 | 52423 / Not applicable | data-formId | form_id | 4020 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41533 | 52423 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41535 | 52424 / Not applicable | data-securityCheckpoint | checkpoint | 25 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41536 | 52425 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41538 | 52426 / Not applicable | data-securityCheckpoint | checkpoint | 29 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41540 | 52428 / Not applicable | data-formId | form_id | 4023 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41541 | 52428 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41542 | 52429 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_LAUNCH_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41545 | 52430 / Not applicable | data-dbcolumn | database_identifier | LAUNCH_NAME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41547 | 52431 / Not applicable | data-dbcolumn | database_identifier | LAUNCH_FLOW | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41549 | 52432 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41550 | 52433 / Not applicable | data-dbcolumn | database_identifier | WAVE_DATE_TIME_STARTED | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41551 | 52434 / Not applicable | data-dbcolumn | database_identifier | DATE_TIME_STAMP | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41554 | 52435 / Not applicable | data-dbcolumn | database_identifier | ACTIVE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41557 | 52436 / Not applicable | data-dbcolumn | database_identifier | COMPLETED | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41560 | 52437 / Not applicable | data-dbcolumn | database_identifier | CANCELLED | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41563 | 52438 / Not applicable | data-dbcolumn | database_identifier | RELEASED | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41569 | 52444 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_WAVE_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27398 | 52404 / 18482 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27402 | 52404 / 18482 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27407 | 52404 / 18482 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27410 | 52407 / 18484 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27414 | 52407 / 18484 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27422 | 52421 / 18498 | ConfirmationMessageCode | resource_code | MSG_LAUNCH18 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27423 | 52421 / 18498 | ConfirmationTitleCode | resource_code | DELETEWAVE | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27424 | 52421 / 18498 | DELETEServiceURL | relative_api_path | /outbound/scaleapi/WavesApi/Delete? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27426 | 52421 / 18498 | Delete_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27428 | 52423 / 18500 | PostData_Grid_ListPaneDataGrid_internalLaunchNum | grid_field_identifier | WAVE_NUMBER | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27432 | 52426 / 18503 | ConfirmationMessageCode | resource_code | MSG_LAUNCH46 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27433 | 52426 / 18503 | ConfirmationTitleCode | resource_code | RELEASEWAVE | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27434 | 52426 / 18503 | POSTServiceURL | relative_api_path | /outbound/scaleapi/WavesApi/waves-Released | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27435 | 52426 / 18503 | PostData_Grid_ListPaneDataGrid_InternalLaunchNumber | grid_field_identifier | WAVE_NUMBER | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27436 | 52426 / 18503 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27437 | 52426 / 18503 | Post_ErrorCallback | callback_identifier | _webUi.waveInsight.reprintWaveLabelsErrorCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27438 | 52427 / 18504 | ConfirmationMessageCode | resource_code | MSG_LAUNCH20 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27439 | 52427 / 18504 | ConfirmationTitleCode | resource_code | RUNWAVE | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27440 | 52427 / 18504 | POSTServiceURL | relative_api_path | /outbound/scaleapi/WavesApi/waves-Submitted | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27441 | 52427 / 18504 | PostData_Grid_ListPaneDataGrid_InternalLaunchNumber | grid_field_identifier | WAVE_NUMBER | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27442 | 52427 / 18504 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27445 | 52444 / 18509 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27446 | 52444 / 18509 | PostData_storedProcedure | stored_procedure_identifier | WAVE_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
