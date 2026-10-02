# Cycle Count Plan Insight — Form 3105, Screen 1760

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3105 |
| MAIN_UI_SCREEN Object ID | 1760 |
| Label / Form resource key | Cycle Count Plan Insight / MNU_CYCLECOUNTPLANINSIGHT |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/3105 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/3105 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3105 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_CYCLE_COUNT_PLAN_VIEW |
| Help page reference | cycleCountplanInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3105 |
| Inspection time (UTC) | 2026-10-02T15:26:44.398Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_CYCLECOUNTPLANINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_CYCLE_COUNT_PLAN_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1760 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:12:24.095Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/insights/3105#search; Cycle Count Plan Insight | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

**Visible criteria / entry fields:** Plan; From Created Date; To Created Date; From Completed Date; To Completed Date; Warehouse.

**Visible grid headers:** Plan; Master Name; Created Date; Completed Date; Open; Closed; Errors; Released; Color.

**Observed action/menu labels:** View; Delete; Close; Master Plan; Quick Plan; Release.

**Page groups:** Basic Criteria; Plan Status; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Cycle Count Plan Insight is recorded as `insight`. Its saved configuration contains 6 parts, 23 groups, 43 controls, and 17 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4274 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4275 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4276 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4277 / SearchPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | InsightMenuApply |
| 4278 / ListPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |
| 4279 / DetailPane | Not populated / Not populated | 10 / 12500 | Y / Y / N | Not populated |

### Part 4274: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17697 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17697; default=None |
| 17698 / SaveSearchModalDialogHeader | 17697 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17697; default=None |
| 17699 / SaveSearchModalDialogBody | 17697 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17697; default=None |
| 17700 / SaveSearchModalDialogFooter | 17697 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17697; default=None |

#### Group 17699: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50970 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17700: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50971 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50972 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4275: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17701 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17701; default=None |
| 17702 / GadgetCalculationQueryDialogHeader | 17701 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17701; default=None |
| 17703 / GadgetCalculationQueryDialogBody | 17701 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17701; default=None |
| 17704 / GadgetCalculationQueryDialogFooter | 17701 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17701; default=None |

#### Group 17703: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50973 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17704: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50974 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50975 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4276: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17705 / InsightMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=17705; default=None |
| 17706 / InsightMenuPanel | 17705 | Not populated / Not populated | 60 / 750 | Y / Y | Fixed to top=Y; loading=0; nested unit=17705; default=None |
| 17709 / MenuExportToExcelPanel | 17705 | Not populated / Not populated | 60 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=17705; default=None |
| 17707 / InsightMenuFavoritesDropdown | 17705 | Favorites / FAVORITES | 100 / 1000 | Y / Y | Fixed to top=N; loading=0; nested unit=17705; default=None |
| 17711 / InsightMenuActionsDropdown | 17705 | Actions / ACTIONS | 80 / 1000 | Y / Y | Fixed to top=N; loading=0; nested unit=17705; default=None |
| 17708 / InsightListPaneMenuPanel | 17705 | Not populated / Not populated | 60 / 1100 | Y / Y | Fixed to top=Y; loading=0; nested unit=17705; default=None |
| 17710 / InsightMenuPrintActionsDropdown | 17705 | Print / PRINT | 80 / 15550 | Y / Y | Fixed to top=N; loading=0; nested unit=17705; default=None |

#### Group 17706: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50976 / InsightMenuApply | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 50977 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 50978 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 450 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 50979 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17709: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50984 / MenuExportToExcel | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 17711: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50987 / ListPaneMenuActionView | View / VIEW | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 50988 / ListPaneMenuActionDeleteCycleCountPlan | Delete / DELETE | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 50989 / ListPaneMenuActionCloseCycleCountPlan | Close / CLOSE | 150 / 1500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CLOSE |
| 50990 / ListPaneMenuActionNewMasterPlan | Master Plan / MASTERPLAN | 150 / 1550 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=MASTERPLAN |
| 50991 / ListPaneMenuActionQuickPlan | Quick Plan / QUICKPLAN | 150 / 1600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=QUICKPLAN |
| 50992 / ListPaneMenuActionReleaseCycleCountPlan | Release / RELEASE | 150 / 1700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=RELEASE |

#### Group 17708: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50980 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50981 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 50982 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 50983 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 17710: InsightMenuPrintActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50985 / ListPaneMenuActionPrintDefaultDocs | Print Default Docs / PRINTDEFAULTDOCS | 150 / 100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTDEFAULTDOCS |
| 50986 / ListPaneMenuActionPrintSelectedDocs | Print Selected Docs / PRINTSELECTEDDOCS | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTSELECTEDDOCS |

### Part 4277: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17712 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=17712; default=None |
| 17713 / SearchPaneBasicCriteria | 17712 | Basic Criteria / BASICCRITERIA | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=17712; default=None |
| 17714 / SearchPanePlanStatus | 17712 | Plan Status / PLANSTATUS | 50 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=17712; default=None |
| 17715 / SearchPaneAdvancedCriteria | 17712 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=17712; default=None |

#### Group 17713: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50993 / BasicCriteriaPlanNumber | Plan / PLAN | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50994 / BasicCriteriaFromCreatedDateRange | Created Date / CREATEDDATE | 190 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50995 / BasicCriteriaFromCompletedDateRange | Completed Date / COMPLETEDDATE | 190 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50996 / BasicCriteriaWarehouse | Warehouse / WAREHOUSE | 280 / 1500 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50997 / BasicCriteriaReleased | Include Released Plans / INCLUDERELEASEDPLANS | 130 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17714: SearchPanePlanStatus — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50998 / SearchPanePlanStatusActive | Show Active Plans / SHOWACTIVEPLANS | 130 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 50999 / SearchPanePlanStatusCompleted | Show Completed Plans / SHOWCOMPLETEDPLANS | 130 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17715: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51000 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 250 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4278: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17716 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=17716; default=None |
| 17717 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=17717; default=None |

#### Group 17716: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51001 / ListPaneSummaryTotalPlans | Plans / PLANS | 50 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51002 / ListPaneSummaryTotalTransactions | Requests / REQUESTS | 50 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51003 / ListPaneSummaryReviewedRequests | In Review / REVIEWED | 50 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51004 / ListPaneSummaryOpenRequests | Open / OPEN | 50 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51005 / ListPaneSummaryClosedRequests | Closed / CLOSED | 50 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17717: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51006 / ListPaneDataGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51006 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18112 / InternalPlanNum | INTERNAL_PLAN_NUM / Plan / PLAN | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18114 / MasterName | Not populated / Master Name / MASTERNAME | 10 / 10 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18115 / CreatedDate | Not populated / Created Date / CREATEDDATE | 30 / 10 / 3000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18116 / CompletedDate | Not populated / Completed Date / COMPLETEDDATE | 30 / 10 / 4000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18117 / TotalOpen | Not populated / Open / OPEN | 20 / 10 / 5000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18118 / TotalClosed | Not populated / Closed / CLOSED | 20 / 10 / 6000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18119 / TotalErrors | Not populated / Errors / ERRORS | 20 / 10 / 7000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18120 / Released | Not populated / Released / RELEASED | 40 / 10 / 8000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18121 / PercentComplete | Not populated / % Complete / PERCENTCOMPLETE | 20 / 10 / 9000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=10; DATA_SOURCE_TYPE=None |
| 18122 / PercentErrors | Not populated / % Errors / ERRORSPERCENT | 20 / 10 / 10000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=10; DATA_SOURCE_TYPE=None |
| 18123 / GroupSize | Not populated / Group Size / GROUPSIZE | 10 / 10 / 11000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18124 / InCreation | Not populated / In Creation / INCREATION | 10 / 10 / 12000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18125 / TotalReviewed | Not populated / In Review / REVIEWED | 20 / 10 / 13000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18126 / ICON | Not populated / Icon / ICON | 10 / 10 / 14000 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18127 / COLOR | Not populated / Color / COLOR | 10 / 10 / 15000 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18128 / Not populated | INTERNAL_PLAN_NUM / Not populated / Not populated | Not populated / 20 / 16000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18113 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 16010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4279: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17718 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=17718; default=None |
| 17719 / indicatorpane | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=17719; default=None |

#### Group 17718: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51007 / DetailPaneHeaderPlanNumber | Not populated / Not populated | 240 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=578; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51008 / DetailPaneHeaderMasterName | Not populated / Not populated | 30 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=578; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51009 / DetailPaneHeaderCreatedDate | Not populated / Not populated | 30 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=578; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17719: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51010 / InventoryInsightIndicatorTileRequests | Requests / REQUESTS | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51012 / InventoryInsightIndicatorTileTransactions | Transactions / TRANSACTIONS | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51011 / InventoryInsightIndicatorTileOpenWork | Open Work / OPEN_WORK | 360 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 49 control attributes, 25 events, and 51 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40116 | 50970 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40117 | 50970 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40118 | 50979 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40119 | 50980 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40120 | 50985 / ListPaneMenuActionPrintDefaultDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40121 | 50986 / ListPaneMenuActionPrintSelectedDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40122 | 50987 / ListPaneMenuActionView | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40123 | 50987 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 40124 | 50988 / ListPaneMenuActionDeleteCycleCountPlan | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40125 | 50988 / ListPaneMenuActionDeleteCycleCountPlan | data-divider | Y / Y / N | 8 / 0 |
| 40126 | 50988 / ListPaneMenuActionDeleteCycleCountPlan | data-formId | Y / Y / N | 8 / 0 |
| 40127 | 50988 / ListPaneMenuActionDeleteCycleCountPlan | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40128 | 50989 / ListPaneMenuActionCloseCycleCountPlan | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40129 | 50989 / ListPaneMenuActionCloseCycleCountPlan | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40130 | 50990 / ListPaneMenuActionNewMasterPlan | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40131 | 50990 / ListPaneMenuActionNewMasterPlan | data-formId | Y / Y / N | 8 / 0 |
| 40132 | 50991 / ListPaneMenuActionQuickPlan | data-formId | Y / Y / N | 8 / 0 |
| 40133 | 50991 / ListPaneMenuActionQuickPlan | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40134 | 50992 / ListPaneMenuActionReleaseCycleCountPlan | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40135 | 50992 / ListPaneMenuActionReleaseCycleCountPlan | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40136 | 50993 / BasicCriteriaPlanNumber | data-dbcolumn | Y / Y / N | 34 / 0 |
| 40137 | 50994 / BasicCriteriaFromCreatedDateRange | data-dbcolumn | Y / Y / N | 24 / 0 |
| 40138 | 50994 / BasicCriteriaFromCreatedDateRange | data-dateOnly | Y / Y / Y | 8 / 0 |
| 40139 | 50995 / BasicCriteriaFromCompletedDateRange | data-dbcolumn | Y / Y / N | 28 / 0 |
| 40140 | 50995 / BasicCriteriaFromCompletedDateRange | data-dateOnly | Y / Y / Y | 8 / 0 |
| 40141 | 50996 / BasicCriteriaWarehouse | defaultValue | Y / Y / Y | 32 / 0 |
| 40142 | 50996 / BasicCriteriaWarehouse | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40143 | 50997 / BasicCriteriaReleased | data-dbcolumn | Y / Y / N | 16 / 0 |
| 40144 | 50997 / BasicCriteriaReleased | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40145 | 50997 / BasicCriteriaReleased | data-negativeCondition | Y / Y / N | 12 / 0 |
| 40146 | 50998 / SearchPanePlanStatusActive | data-dbcolumn | Y / Y / N | 28 / 0 |
| 40147 | 50998 / SearchPanePlanStatusActive | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40148 | 50998 / SearchPanePlanStatusActive | data-negativeCondition | Y / Y / N | 22 / 0 |
| 40149 | 50999 / SearchPanePlanStatusCompleted | data-dbcolumn | Y / Y / N | 28 / 0 |
| 40150 | 50999 / SearchPanePlanStatusCompleted | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40151 | 50999 / SearchPanePlanStatusCompleted | data-negativeCondition | Y / Y / N | 14 / 0 |
| 40152 | 51002 / ListPaneSummaryTotalTransactions | data-aggregateClause | Y / Y / Y | 46 / 0 |
| 40153 | 51003 / ListPaneSummaryReviewedRequests | data-aggregateClause | Y / Y / Y | 38 / 0 |
| 40154 | 51004 / ListPaneSummaryOpenRequests | data-aggregateClause | Y / Y / Y | 30 / 0 |
| 40155 | 51005 / ListPaneSummaryClosedRequests | data-aggregateClause | Y / Y / Y | 34 / 0 |
| 40156 | 51006 / ListPaneDataGrid | data-dbtable | Y / Y / N | 76 / 0 |
| 40157 | 51006 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 34 / 0 |
| 40158 | 51006 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 40159 | 51006 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 40160 | 51007 / DetailPaneHeaderPlanNumber | href | Y / Y / Y | 62 / 0 |
| 40161 | 51009 / DetailPaneHeaderCreatedDate | data-format | Y / Y / N | 8 / 0 |
| 40162 | 51010 / InventoryInsightIndicatorTileRequests | data-indicatorTileGoToInsight | Y / Y / Y | 260 / 0 |
| 40164 | 51012 / InventoryInsightIndicatorTileTransactions | data-indicatorTileGoToInsight | Y / Y / Y | 358 / 0 |
| 40163 | 51011 / InventoryInsightIndicatorTileOpenWork | data-indicatorTileGoToInsight | Y / Y / Y | 428 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17662 / click | 50971 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 17663 / click | 50972 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17664 / click | 50974 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 17665 / click | 50975 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17666 / click | 50976 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 17667 / click | 50977 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 17668 / click | 50978 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 17669 / click | 50979 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17670 / click | 50980 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17671 / click | 50981 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 17672 / click | 50982 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 17673 / click | 50983 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 17674 / click | 50984 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 17675 / click | 50985 / ListPaneMenuActionPrintDefaultDocs | _webUi.insightListPaneActions.menuActionPerformGet | Not populated | Y / Y |
| 17676 / click | 50986 / ListPaneMenuActionPrintSelectedDocs | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 17677 / click | 50987 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17678 / click | 50988 / ListPaneMenuActionDeleteCycleCountPlan | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 17679 / click | 50989 / ListPaneMenuActionCloseCycleCountPlan | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 17680 / click | 50990 / ListPaneMenuActionNewMasterPlan | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17681 / click | 50991 / ListPaneMenuActionQuickPlan | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17682 / click | 50992 / ListPaneMenuActionReleaseCycleCountPlan | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 17683 / iggridrequesterror | 51006 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 17684 / iggriddatabound | 51006 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 17685 / iggridselectionrowselectionchanged | 51006 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 17686 / iggridselectionactiverowchanged | 51006 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 25743 / 17662 | GETServiceURL | Y / Y | 76 |
| 25744 / 17662 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 25745 / 17662 | queryParameter_Function_UserName | Y / Y | 44 |
| 25746 / 17662 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25747 / 17662 | POSTServiceURL | Y / Y | 74 |
| 25748 / 17662 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 25749 / 17662 | PostData_Function_UserName | Y / Y | 44 |
| 25750 / 17662 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25751 / 17662 | PostData_Function_SearchValue | Y / Y | 98 |
| 25752 / 17662 | Post_SuccessCallback | Y / Y | 114 |
| 25753 / 17662 | ModalDialogName | Y / Y | 42 |
| 25754 / 17663 | ModalDialogName | Y / Y | 42 |
| 25755 / 17664 | POSTServiceURL | Y / Y | 144 |
| 25756 / 17664 | Form_Id | Y / Y | 8 |
| 25757 / 17664 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 25758 / 17664 | PostData_Function_SearchValue | Y / Y | 98 |
| 25759 / 17664 | Post_SuccessCallback | Y / Y | 114 |
| 25760 / 17664 | ModalDialogName | Y / Y | 56 |
| 25761 / 17665 | ModalDialogName | Y / Y | 56 |
| 25762 / 17669 | ModalDialogName | Y / Y | 42 |
| 25763 / 17670 | ModalDialogName | Y / Y | 56 |
| 25764 / 17675 | GETServiceURL | Y / Y | 54 |
| 25765 / 17675 | queryParameter_internalNum | Y / Y | 20 |
| 25766 / 17675 | queryParameter_printProcess | Y / Y | 4 |
| 25767 / 17676 | URL | Y / Y | 168 |
| 25768 / 17677 | URL | Y / Y | 112 |
| 25769 / 17678 | ConfirmationMessageCode | Y / Y | 36 |
| 25770 / 17678 | POSTServiceURL | Y / Y | 124 |
| 25771 / 17678 | PostData_Grid_ListPaneDataGrid_InternalPlanNum | Y / Y | 30 |
| 25772 / 17678 | Post_SuccessCallback | Y / Y | 140 |
| 25773 / 17678 | Post_ErrorCallback | Y / Y | 120 |
| 25774 / 17679 | ConfirmationMessageCode | Y / Y | 16 |
| 25775 / 17679 | POSTServiceURL | Y / Y | 122 |
| 25776 / 17679 | PostData_Grid_ListPaneDataGrid_InternalPlanNum | Y / Y | 30 |
| 25777 / 17679 | Post_SuccessCallback | Y / Y | 140 |
| 25778 / 17679 | Post_ErrorCallback | Y / Y | 120 |
| 25779 / 17680 | URL | Y / Y | 32 |
| 25780 / 17681 | URL | Y / Y | 32 |
| 25781 / 17682 | POSTServiceURL | Y / Y | 126 |
| 25782 / 17682 | PostData_Grid_ListPaneDataGrid_InternalPlanNum | Y / Y | 30 |
| 25783 / 17682 | Post_SuccessCallback | Y / Y | 140 |
| 25784 / 17682 | Post_ErrorCallback | Y / Y | 120 |
| 25785 / 17686 | POSTServiceURL | Y / Y | 72 |
| 25786 / 17686 | PostData_internalPlanNum | Y / Y | 30 |
| 25787 / 17686 | PostData_storedProcedure | Y / Y | 50 |
| 25788 / 17686 | EnableAction_ListPaneMenuActionView | Y / Y | 48 |
| 25789 / 17686 | EnableAction_ListPaneMenuActionReleaseCycleCountPlan | Y / Y | 128 |
| 25790 / 17686 | EnableAction_ListPaneMenuActionCloseCycleCountPlan | Y / Y | 84 |
| 25791 / 17686 | EnableAction_ListPaneMenuActionDeleteCycleCountPlan | Y / Y | 76 |
| 25792 / 17686 | EnableAction_ListPaneMenuActionPrintSelectedDocs | Y / Y | 100 |
| 25793 / 17686 | EnableAction_ListPaneMenuActionPrintDefaultDocs | Y / Y | 100 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 44 selected candidate rows for this Screen: **44 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40118 | 50979 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40119 | 50980 / Not applicable | data-securityCheckpoint | checkpoint | 27 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40120 | 50985 / Not applicable | data-securityCheckpoint | checkpoint | 26 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40121 | 50986 / Not applicable | data-securityCheckpoint | checkpoint | 25 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40122 | 50987 / Not applicable | data-securityCheckpoint | checkpoint | 6 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40123 | 50987 / Not applicable | data-formId | form_id | 4041 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40126 | 50988 / Not applicable | data-formId | form_id | 4041 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40127 | 50988 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40129 | 50989 / Not applicable | data-securityCheckpoint | checkpoint | 27 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40130 | 50990 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40131 | 50990 / Not applicable | data-formId | form_id | 3038 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40132 | 50991 / Not applicable | data-formId | form_id | 3080 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40133 | 50991 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40134 | 50992 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40136 | 50993 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_PLAN_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40137 | 50994 / Not applicable | data-dbcolumn | database_identifier | CREATED_DATE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40139 | 50995 / Not applicable | data-dbcolumn | database_identifier | COMPLETED_DATE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40142 | 50996 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40143 | 50997 / Not applicable | data-dbcolumn | database_identifier | RELEASED | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40146 | 50998 / Not applicable | data-dbcolumn | database_identifier | COMPLETED_DATE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40149 | 50999 / Not applicable | data-dbcolumn | database_identifier | COMPLETED_DATE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40156 | 51006 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_CYCLE_COUNT_PLAN_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25743 | 50971 / 17662 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25747 | 50971 / 17662 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25752 | 50971 / 17662 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25755 | 50974 / 17664 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25759 | 50974 / 17664 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25764 | 50985 / 17675 | GETServiceURL | relative_api_path | /general/scaleapi/PrintApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25769 | 50988 / 17678 | ConfirmationMessageCode | resource_code | MSG_DELETECCPLAN01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25770 | 50988 / 17678 | POSTServiceURL | relative_api_path | /Inventory/scaleapi/CycleCountPlansApi/Deleted-CycleCountPlans | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25771 | 50988 / 17678 | PostData_Grid_ListPaneDataGrid_InternalPlanNum | grid_field_identifier | InternalPlanNum | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25772 | 50988 / 17678 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25773 | 50988 / 17678 | Post_ErrorCallback | callback_identifier | _webUi.insightListPaneActions.postMethodErrorCallbackHandler | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25774 | 50989 / 17679 | ConfirmationMessageCode | resource_code | MSG_CC35 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25775 | 50989 / 17679 | POSTServiceURL | relative_api_path | /Inventory/scaleapi/CycleCountPlansApi/Closed-CycleCountPlans | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25776 | 50989 / 17679 | PostData_Grid_ListPaneDataGrid_InternalPlanNum | grid_field_identifier | InternalPlanNum | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25777 | 50989 / 17679 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25778 | 50989 / 17679 | Post_ErrorCallback | callback_identifier | _webUi.insightListPaneActions.postMethodErrorCallbackHandler | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25781 | 50992 / 17682 | POSTServiceURL | relative_api_path | /Inventory/scaleapi/CycleCountPlansApi/Released-CycleCountPlans | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25782 | 50992 / 17682 | PostData_Grid_ListPaneDataGrid_InternalPlanNum | grid_field_identifier | InternalPlanNum | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25783 | 50992 / 17682 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25784 | 50992 / 17682 | Post_ErrorCallback | callback_identifier | _webUi.insightListPaneActions.postMethodErrorCallbackHandler | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25785 | 51006 / 17686 | POSTServiceURL | relative_api_path | /general/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25787 | 51006 / 17686 | PostData_storedProcedure | stored_procedure_identifier | CCP_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
