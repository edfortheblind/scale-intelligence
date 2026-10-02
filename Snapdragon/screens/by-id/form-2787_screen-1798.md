# Work Order Insight — Form 2787, Screen 1798

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2787 |
| MAIN_UI_SCREEN Object ID | 1798 |
| Label / Form resource key | Work Order Insight / MNU_WORKORDERINSIGHT |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2787 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2787 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2787 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_WORK_ORDER_HEADER_VIEW |
| Help page reference | WorkOrderInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2787 |
| Inspection time (UTC) | 2026-10-02T15:24:15.791Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_WORKORDERINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_WORK_ORDER_HEADER_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1798 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:14:49.306Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/insights/2787#search; Work Order Insight | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

**Visible criteria / entry fields:** Work Order Filters; Work Order ID; Finished Item; Company; Build Location; Warehouse; From Due Date; To Due Date.

**Visible grid headers:** Icon; Color; Work Order ID; Finished Item; Description; Company; Qty Built; Qty Available To Build; Total Qty; Build Location.

**Observed action/menu labels:** New; Edit; Delete; New Line; Allocate All; Deallocate All; Close; Confirm; Immediate Needs; Print Preview; Print Default Docs; Print Selected Docs; Release.

**Page groups:** Basic Criteria; Condition; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Work Order Insight is recorded as `insight`. Its saved configuration contains 6 parts, 22 groups, 57 controls, and 29 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4513 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4514 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4515 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4516 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4517 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4518 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4513: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18517 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18517; default=None |
| 18518 / SaveSearchModalDialogHeader | 18517 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18517; default=None |
| 18519 / SaveSearchModalDialogBody | 18517 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18517; default=None |
| 18520 / SaveSearchModalDialogFooter | 18517 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18517; default=None |

#### Group 18519: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52538 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18520: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52539 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52540 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4514: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18521 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18521; default=None |
| 18522 / GadgetCalculationQueryDialogHeader | 18521 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18521; default=None |
| 18523 / GadgetCalculationQueryDialogBody | 18521 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18521; default=None |
| 18524 / GadgetCalculationQueryDialogFooter | 18521 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18521; default=None |

#### Group 18523: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52541 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18524: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52542 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52543 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4515: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18525 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18525; default=None |
| 18526 / InsightMenuPanel | 18525 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18525; default=None |
| 18527 / InsightMenuFavoritesDropdown | 18525 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18525; default=None |
| 18528 / InsightListPaneMenuPanel | 18525 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18525; default=None |
| 18529 / MenuExportToExcelPanel | 18525 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18525; default=None |
| 18530 / InsightMenuActionsDropdown | 18525 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18525; default=None |

#### Group 18526: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52544 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 52545 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 52546 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 52547 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18528: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52548 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52549 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 52550 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 52551 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18529: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52552 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18530: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52553 / ListPaneMenuActionNew | New / NEW | 150 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEW |
| 52554 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 52555 / ListPaneMenuActionDelete | Delete / DELETE | 150 / 2600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 52556 / ListPaneMenuActionView | View / VIEW | 150 / 2750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 52557 / ListPaneMenuActionNewLine | New Line / NEWLINE | 150 / 2800 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEWLINE |
| 52558 / ListPaneMenuActionAllocateAll | Allocate All / ALLOCATEALL | 150 / 2900 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ALLOCATEALL |
| 52559 / ListPaneMenuActionDeallocateAll | Deallocate All / DEALLOCATEALL | 150 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DEALLOCATEALL |
| 52560 / ListPaneMenuActionClose | Close / CLOSE | 150 / 3250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CLOSE |
| 52561 / ListPaneMenuActionConfirm | Confirm / CONFIRM | 150 / 3500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=Confirm |
| 52562 / ListPaneMenuActionImmediateNeeds | Immediate Needs / IMMEDIATENEEDS | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=IMMEDIATENEEDS |
| 52563 / ListPaneMenuActionPrintPreviewDocs | Print Preview / PRINTPREVIEW | 150 / 4400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTPREVIEW |
| 52564 / ListPaneMenuActionPrintDefaultDocs | Print Default Docs / PRINTDEFAULTDOCS | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTDEFAULTDOCS |
| 52565 / ListPaneMenuActionPrintSelectedDocs | Print Selected Docs / PRINTSELECTEDDOCS | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTSELECTEDDOCS |
| 52566 / ListPaneMenuActionRelease | Release / RELEASE | 150 / 5500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=RELEASE |

### Part 4516: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18531 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18531; default=None |
| 18532 / SearchPaneBasicCriteria | 18531 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18531; default=None |
| 18533 / SearchPaneCondition | 18531 | Condition / CONDITION | 50 / 10500 | Y / Y | Fixed to top=N; loading=0; nested unit=18531; default=None |
| 18534 / SearchPaneAdvancedCriteria | 18531 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=18531; default=None |

#### Group 18532: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52567 / SearchPaneFilters | Work Order Filters / WORKORDERFILTERS | 80 / 2500 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52568 / BasicCriteriaWorkOrderId | Work Order ID / WORKORDERID | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52569 / BasicCriteriaFinishedItem | Finished Item / FINISHEDITEM | 10 / 5500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52570 / BasicCriteriaBuildCompany | Company / COMPANY | 280 / 6000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52571 / BasicCriteriaBuildLocation | Build Location / BUILDLOCATION | 10 / 6500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52572 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 7000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52573 / BasicCriteriaDueDateRange | Due Date / DUEDATE | 190 / 7500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18533: SearchPaneCondition — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52574 / SearchPaneOpenCond | Include Scheduled Work Orders / INCLUDESCHEDULEDWORKORDERS | 130 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52575 / SearchPaneInProcessCond | Include in Process Work Orders / INCLUDEINPROCESSWORKORDERS | 130 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52576 / SearchPaneClosedCond | Include Closed Work Orders / INCLUDECLOSEDWORKORDERS | 130 / 7500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18534: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52577 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4517: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18535 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18535; default=None |
| 18536 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18536; default=None |

#### Group 18535: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52578 / ListPaneSummaryOrders | Orders / ORDERS | 50 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52579 / ListPaneSummaryFIBuild | Fi Built / FIBUILT | 50 / 2600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52580 / ListPaneSummaryFIAvailable | Fi Avail / FIAVAILABLE | 50 / 2700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52581 / ListPaneSummaryFITotal | Fi Total / FITOTAL | 50 / 2800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52582 / ListPaneSummaryComplete | Complete / COMPLETE | 50 / 2900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18536: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52583 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 52583 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18969 / Not populated | INTERNALWORKORDERNUM / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18970 / Not populated | QTYAVAILTOBUILD / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18971 / Not populated | QTYBUILT / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18972 / Not populated | QTYTOBEBUILT / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18955 / ICON | Not populated / Icon / ICON | 10 / 10 / 500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18957 / COLOR | Not populated / Color / COLOR | 10 / 10 / 600 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18958 / WorkOrderId | Not populated / Work Order ID / WORKORDERID | 10 / 10 / 700 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18959 / FinishedItem | Not populated / Finished Item / FINISHEDITEM | 10 / 10 / 800 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18960 / Description | Not populated / Description / ITEMDESCRIPTION | 10 / 10 / 900 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18961 / Company | Not populated / Company / COMPANY | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18962 / QtyBuilt | Not populated / Qty Built / QTYBUILT | 20 / 10 / 1100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18963 / QtyAvailToBuild | Not populated / Qty Available To Build / QTYAVAILTOBUILD | 20 / 10 / 1200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18964 / QtyToBeBuilt | Not populated / Total Qty / TOTALQTY | 20 / 10 / 1250 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18965 / BuildLocation | Not populated / Build Location / BUILDLOCATION | 10 / 10 / 1300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18966 / Condition | Not populated / Condition / CONDITION | 10 / 10 / 1350 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18967 / DueDate | Not populated / Due Date / DUEDATE | 30 / 10 / 1400 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18968 / InternalWorkOrderNum | INTERNALWORKORDERNUM / Work Order Number / INTERNALWORKORDERNUM | 10 / 10 / 1600 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18973 / ImmediateNeedsRequeestCreated | Not populated / Immediate Needs Request Created / IMMDNEEDSREQCREATED | 40 / 10 / 1700 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18974 / ImmediateNeedsNote | Not populated / Immediate Needs Note / IMMEDIATENEEDSNOTE | 10 / 10 / 1800 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18977 / ReleaseddateTime | Not populated / Released Date Time / RELEASEDDATETIME | 30 / 10 / 1800 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18975 / ImmediateNeedsResourceKey | Not populated / Immediate Needs (Resource Key) / IMMEDIATENEEDSRESOURCEKEY | 10 / 10 / 1900 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18978 / InAllocation | Not populated / In Allocation / INALLOCATION | 40 / 10 / 2000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18979 / InConfirmation | Not populated / In Confirmation / INCONFIRMATION | 40 / 10 / 2100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18980 / ComponentsAllocated | Not populated / Allocated / ALLOCATED | 40 / 10 / 2200 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18981 / DeallocateAll | Not populated / Deallocate / DEALLOCATE | 40 / 10 / 2300 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18982 / Released | Not populated / Released / RELEASED | 40 / 10 / 2400 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18983 / DependantShipmentCount | Not populated / Dependent Shipments / DEPENDENTSHIPMENTS | 20 / 10 / 2500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18976 / TotalToQty | Not populated / Total to quantity. / TOTALTOQTY | 10 / 10 / 3270 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18956 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 3280 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4518: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18537 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18537; default=None |
| 18538 / indicatorpane | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18538; default=None |

#### Group 18537: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52584 / DetailPaneHeaderWorkOrderID | Not populated / Not populated | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=616; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52585 / DetailPaneHeaderFinishedItem | Not populated / Not populated | 30 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=616; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52586 / DetailPaneHeaderCompany | Not populated / Not populated | 30 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=616; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52587 / DetailPaneHeaderDescription | Not populated / Not populated | 30 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=616; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52588 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=616; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18538: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52589 / WorkOrderInsightIndicatorTileLines | Lines / LINES | 360 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52590 / WorkOrderInsightIndicatorTileOpenWork | Open Work / OPENWORK | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52591 / WorkOrderInsightIndicatorTileTransactions | Transactions / TRANSACTIONS | 360 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52592 / WorkOrderInsightIndicatorTileLicensePlates | License Plates / LICENSEPLATES | 360 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52593 / WorkOrderInsightIndicatorTileDependentShipmentsAtLessThan300 | Planned Shipments / PLANNEDSHIPMENTS | 360 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52594 / WorkOrderInsightIndicatorTileDependentShipmentsAt300OrMore | Waved Shipments / WAVEDSHIPMENTS | 360 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 66 control attributes, 31 events, and 71 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 41671 | 52538 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 41672 | 52538 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 41673 | 52547 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41674 | 52548 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41675 | 52553 / ListPaneMenuActionNew | data-formId | Y / Y / N | 8 / 0 |
| 41676 | 52553 / ListPaneMenuActionNew | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41677 | 52554 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 41678 | 52554 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41679 | 52555 / ListPaneMenuActionDelete | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41680 | 52555 / ListPaneMenuActionDelete | data-formId | Y / Y / N | 8 / 0 |
| 41681 | 52555 / ListPaneMenuActionDelete | data-divider | Y / Y / N | 8 / 0 |
| 41682 | 52555 / ListPaneMenuActionDelete | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41683 | 52556 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 41684 | 52556 / ListPaneMenuActionView | data-divider | Y / Y / N | 8 / 0 |
| 41685 | 52557 / ListPaneMenuActionNewLine | data-formId | Y / Y / N | 8 / 0 |
| 41686 | 52557 / ListPaneMenuActionNewLine | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41687 | 52557 / ListPaneMenuActionNewLine | data-divider | Y / Y / N | 8 / 0 |
| 41688 | 52558 / ListPaneMenuActionAllocateAll | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41689 | 52559 / ListPaneMenuActionDeallocateAll | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41690 | 52560 / ListPaneMenuActionClose | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41691 | 52560 / ListPaneMenuActionClose | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41692 | 52561 / ListPaneMenuActionConfirm | data-formId | Y / Y / N | 8 / 0 |
| 41693 | 52561 / ListPaneMenuActionConfirm | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41694 | 52562 / ListPaneMenuActionImmediateNeeds | data-formId | Y / Y / N | 8 / 0 |
| 41695 | 52562 / ListPaneMenuActionImmediateNeeds | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41696 | 52563 / ListPaneMenuActionPrintPreviewDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41697 | 52564 / ListPaneMenuActionPrintDefaultDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41698 | 52565 / ListPaneMenuActionPrintSelectedDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41699 | 52566 / ListPaneMenuActionRelease | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41700 | 52566 / ListPaneMenuActionRelease | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41701 | 52568 / BasicCriteriaWorkOrderId | data-dbcolumn | Y / Y / N | 22 / 0 |
| 41702 | 52568 / BasicCriteriaWorkOrderId | Lookup | Y / Y / N | 86 / 1 |
| 41703 | 52569 / BasicCriteriaFinishedItem | data-dbcolumn | Y / Y / N | 12 / 0 |
| 41704 | 52569 / BasicCriteriaFinishedItem | Lookup | Y / Y / N | 70 / 0 |
| 41705 | 52570 / BasicCriteriaBuildCompany | data-dbcolumn | Y / Y / N | 14 / 0 |
| 41706 | 52571 / BasicCriteriaBuildLocation | data-dbcolumn | Y / Y / N | 26 / 0 |
| 41707 | 52571 / BasicCriteriaBuildLocation | Lookup | Y / Y / N | 88 / 1 |
| 41708 | 52572 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 41709 | 52572 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 22 / 0 |
| 41710 | 52573 / BasicCriteriaDueDateRange | data-dbcolumn | Y / Y / N | 14 / 0 |
| 41711 | 52573 / BasicCriteriaDueDateRange | data-dateOnly | Y / Y / Y | 8 / 0 |
| 41712 | 52574 / SearchPaneOpenCond | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41713 | 52574 / SearchPaneOpenCond | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41714 | 52574 / SearchPaneOpenCond | data-negativeCondition | Y / Y / N | 28 / 0 |
| 41715 | 52575 / SearchPaneInProcessCond | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41716 | 52575 / SearchPaneInProcessCond | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41717 | 52575 / SearchPaneInProcessCond | data-negativeCondition | Y / Y / N | 30 / 0 |
| 41718 | 52576 / SearchPaneClosedCond | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41719 | 52576 / SearchPaneClosedCond | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41720 | 52576 / SearchPaneClosedCond | data-negativeCondition | Y / Y / N | 22 / 0 |
| 41721 | 52579 / ListPaneSummaryFIBuild | data-aggregateClause | Y / Y / Y | 26 / 0 |
| 41722 | 52580 / ListPaneSummaryFIAvailable | data-aggregateClause | Y / Y / Y | 40 / 0 |
| 41723 | 52581 / ListPaneSummaryFITotal | data-aggregateClause | Y / Y / Y | 34 / 0 |
| 41724 | 52582 / ListPaneSummaryComplete | data-aggregateClause | Y / Y / Y | 212 / 0 |
| 41725 | 52582 / ListPaneSummaryComplete | data-Percentage | Y / Y / Y | 8 / 0 |
| 41726 | 52583 / ListPaneDataGrid | data-dbtable | Y / Y / N | 78 / 0 |
| 41727 | 52583 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 46 / 0 |
| 41728 | 52583 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 41729 | 52583 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 41730 | 52584 / DetailPaneHeaderWorkOrderID | href | Y / Y / Y | 82 / 0 |
| 41731 | 52589 / WorkOrderInsightIndicatorTileLines | data-indicatorTileGoToInsight | Y / Y / Y | 226 / 0 |
| 41732 | 52590 / WorkOrderInsightIndicatorTileOpenWork | data-indicatorTileGoToInsight | Y / Y / Y | 360 / 0 |
| 41733 | 52591 / WorkOrderInsightIndicatorTileTransactions | data-indicatorTileGoToInsight | Y / Y / Y | 296 / 0 |
| 41734 | 52592 / WorkOrderInsightIndicatorTileLicensePlates | data-indicatorTileGoToInsight | Y / Y / Y | 190 / 0 |
| 41735 | 52593 / WorkOrderInsightIndicatorTileDependentShipmentsAtLessThan300 | data-indicatorTileGoToInsight | Y / Y / Y | 388 / 0 |
| 41736 | 52594 / WorkOrderInsightIndicatorTileDependentShipmentsAt300OrMore | data-indicatorTileGoToInsight | Y / Y / Y | 388 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18557 / click | 52539 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18558 / click | 52540 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18559 / click | 52542 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18560 / click | 52543 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18561 / click | 52544 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18562 / click | 52545 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18563 / click | 52546 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18564 / click | 52547 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18565 / click | 52548 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18566 / click | 52549 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 18567 / click | 52550 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18568 / click | 52551 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18569 / click | 52552 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18570 / click | 52553 / ListPaneMenuActionNew | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18571 / click | 52554 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18572 / click | 52555 / ListPaneMenuActionDelete | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18573 / click | 52556 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18574 / click | 52557 / ListPaneMenuActionNewLine | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18575 / click | 52558 / ListPaneMenuActionAllocateAll | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 18576 / click | 52559 / ListPaneMenuActionDeallocateAll | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 18577 / click | 52560 / ListPaneMenuActionClose | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18578 / click | 52561 / ListPaneMenuActionConfirm | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18579 / click | 52562 / ListPaneMenuActionImmediateNeeds | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18580 / click | 52563 / ListPaneMenuActionPrintPreviewDocs | _webUi.dialog.printPreviewSelection | Not populated | Y / Y |
| 18581 / click | 52564 / ListPaneMenuActionPrintDefaultDocs | _webUi.insightListPaneActions.menuActionPerformGet | Not populated | Y / Y |
| 18582 / click | 52565 / ListPaneMenuActionPrintSelectedDocs | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 18583 / click | 52566 / ListPaneMenuActionRelease | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18584 / iggridrequesterror | 52583 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18585 / iggriddatabound | 52583 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18586 / iggridselectionrowselectionchanged | 52583 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18587 / iggridselectionactiverowchanged | 52583 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 27568 / 18557 | GETServiceURL | Y / Y | 76 |
| 27569 / 18557 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 27570 / 18557 | queryParameter_Function_UserName | Y / Y | 44 |
| 27571 / 18557 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27572 / 18557 | POSTServiceURL | Y / Y | 74 |
| 27573 / 18557 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 27574 / 18557 | PostData_Function_UserName | Y / Y | 44 |
| 27575 / 18557 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27576 / 18557 | PostData_Function_SearchValue | Y / Y | 98 |
| 27577 / 18557 | Post_SuccessCallback | Y / Y | 114 |
| 27578 / 18557 | ModalDialogName | Y / Y | 42 |
| 27579 / 18558 | ModalDialogName | Y / Y | 42 |
| 27580 / 18559 | POSTServiceURL | Y / Y | 144 |
| 27581 / 18559 | Form_Id | Y / Y | 8 |
| 27582 / 18559 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 27583 / 18559 | PostData_Function_SearchValue | Y / Y | 98 |
| 27584 / 18559 | Post_SuccessCallback | Y / Y | 114 |
| 27585 / 18559 | ModalDialogName | Y / Y | 56 |
| 27586 / 18560 | ModalDialogName | Y / Y | 56 |
| 27587 / 18564 | ModalDialogName | Y / Y | 42 |
| 27588 / 18565 | ModalDialogName | Y / Y | 56 |
| 27589 / 18570 | URL | Y / Y | 32 |
| 27590 / 18571 | URL | Y / Y | 152 |
| 27591 / 18572 | ConfirmationMessageCode | Y / Y | 42 |
| 27592 / 18572 | POSTServiceURL | Y / Y | 116 |
| 27593 / 18572 | PostData_Grid_ListPaneDataGrid_InternalWorkOrderNum | Y / Y | 40 |
| 27594 / 18572 | PostData_InternalWorkOrderNum | Y / Y | 40 |
| 27595 / 18572 | Post_SuccessCallback | Y / Y | 140 |
| 27596 / 18573 | URL | Y / Y | 152 |
| 27597 / 18574 | queryParameter_Grid_ListPaneDataGrid_InternalWorkOrderNum | Y / Y | 40 |
| 27598 / 18574 | URL | Y / Y | 138 |
| 27599 / 18575 | POSTServiceURL | Y / Y | 126 |
| 27600 / 18575 | queryParameter_InternalWorkOrderNum | Y / Y | 40 |
| 27601 / 18575 | Post_SuccessCallback | Y / Y | 140 |
| 27602 / 18576 | POSTServiceURL | Y / Y | 130 |
| 27603 / 18576 | queryParameter_InternalWorkOrderNum | Y / Y | 40 |
| 27604 / 18576 | Post_SuccessCallback | Y / Y | 140 |
| 27605 / 18577 | ConfirmationMessageCode | Y / Y | 40 |
| 27606 / 18577 | POSTServiceURL | Y / Y | 114 |
| 27607 / 18577 | PostData_Grid_ListPaneDataGrid_InternalWorkOrderNum | Y / Y | 40 |
| 27608 / 18577 | Post_SuccessCallback | Y / Y | 140 |
| 27609 / 18578 | queryParameter_Grid_ListPaneDataGrid_InternalWorkOrderNum | Y / Y | 40 |
| 27610 / 18578 | URL | Y / Y | 230 |
| 27611 / 18579 | URL | Y / Y | 262 |
| 27612 / 18580 | queryParameter_internalNum | Y / Y | 40 |
| 27613 / 18580 | printProcess | Y / Y | 6 |
| 27614 / 18581 | GETServiceURL | Y / Y | 54 |
| 27615 / 18581 | queryParameter_internalNum | Y / Y | 40 |
| 27616 / 18581 | queryParameter_printProcess | Y / Y | 6 |
| 27617 / 18582 | URL | Y / Y | 210 |
| 27618 / 18583 | ConfirmationMessageCode | Y / Y | 44 |
| 27619 / 18583 | POSTServiceURL | Y / Y | 118 |
| 27620 / 18583 | PostData_Grid_ListPaneDataGrid_InternalWorkOrderNum | Y / Y | 40 |
| 27621 / 18583 | Post_SuccessCallback | Y / Y | 140 |
| 27622 / 18583 | Post_ErrorCallback | Y / Y | 136 |
| 27623 / 18587 | POSTServiceURL | Y / Y | 74 |
| 27624 / 18587 | PostData_internalWorkOrderNum | Y / Y | 40 |
| 27625 / 18587 | PostData_storedProcedure | Y / Y | 50 |
| 27626 / 18587 | EnableAction_ListPaneMenuActionRelease | Y / Y | 46 |
| 27627 / 18587 | EnableAction_ListPaneMenuActionView | Y / Y | 40 |
| 27628 / 18587 | EnableAction_ListPaneMenuActionEdit | Y / Y | 40 |
| 27629 / 18587 | EnableAction_ListPaneMenuActionNewLine | Y / Y | 40 |
| 27630 / 18587 | EnableAction_ListPaneMenuActionImmediateNeeds | Y / Y | 76 |
| 27631 / 18587 | EnableAction_ListPaneMenuActionPrintDefaultDocs | Y / Y | 40 |
| 27632 / 18587 | EnableAction_ListPaneMenuActionPrintPreviewDocs | Y / Y | 40 |
| 27633 / 18587 | EnableAction_ListPaneMenuActionPrintSelectedDocs | Y / Y | 40 |
| 27634 / 18587 | EnableAction_ListPaneMenuActionDelete | Y / Y | 46 |
| 27635 / 18587 | EnableAction_ListPaneMenuActionClose | Y / Y | 40 |
| 27636 / 18587 | EnableAction_ListPaneMenuActionConfirm | Y / Y | 192 |
| 27637 / 18587 | EnableAction_ListPaneMenuActionAllocateAll | Y / Y | 212 |
| 27638 / 18587 | EnableAction_ListPaneMenuActionDeallocateAll | Y / Y | 292 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 59 selected candidate rows for this Screen: **59 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 41673 | 52547 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41674 | 52548 / Not applicable | data-securityCheckpoint | checkpoint | 28 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41675 | 52553 / Not applicable | data-formId | form_id | 3037 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41676 | 52553 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41677 | 52554 / Not applicable | data-formId | form_id | 3037 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41678 | 52554 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41680 | 52555 / Not applicable | data-formId | form_id | 3037 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41682 | 52555 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41683 | 52556 / Not applicable | data-formId | form_id | 3037 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41685 | 52557 / Not applicable | data-formId | form_id | 4044 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41686 | 52557 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41688 | 52558 / Not applicable | data-securityCheckpoint | checkpoint | 26 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41689 | 52559 / Not applicable | data-securityCheckpoint | checkpoint | 27 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41691 | 52560 / Not applicable | data-securityCheckpoint | checkpoint | 25 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41692 | 52561 / Not applicable | data-formId | form_id | 4048 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41693 | 52561 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41694 | 52562 / Not applicable | data-formId | form_id | 2767 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41695 | 52562 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41696 | 52563 / Not applicable | data-securityCheckpoint | checkpoint | 34 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41697 | 52564 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41698 | 52565 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41699 | 52566 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41701 | 52568 / Not applicable | data-dbcolumn | database_identifier | WORKORDERID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41703 | 52569 / Not applicable | data-dbcolumn | database_identifier | WHITEM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41705 | 52570 / Not applicable | data-dbcolumn | database_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41706 | 52571 / Not applicable | data-dbcolumn | database_identifier | BUILDLOCATION | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41709 | 52572 / Not applicable | data-dbcolumn | database_identifier | WHWAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41710 | 52573 / Not applicable | data-dbcolumn | database_identifier | DUEDATE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41712 | 52574 / Not applicable | data-dbcolumn | database_identifier | CONDITION | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41715 | 52575 / Not applicable | data-dbcolumn | database_identifier | CONDITION | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41718 | 52576 / Not applicable | data-dbcolumn | database_identifier | CONDITION | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41726 | 52583 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_WORK_ORDER_HEADER_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27568 | 52539 / 18557 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27572 | 52539 / 18557 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27577 | 52539 / 18557 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27580 | 52542 / 18559 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27584 | 52542 / 18559 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27591 | 52555 / 18572 | ConfirmationMessageCode | resource_code | MSG_DELETEWORKORDER01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27592 | 52555 / 18572 | POSTServiceURL | relative_api_path | /inventory/scaleapi/workOrderHeadersApi/WorkOrders-Deleted | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27593 | 52555 / 18572 | PostData_Grid_ListPaneDataGrid_InternalWorkOrderNum | grid_field_identifier | InternalWorkOrderNum | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27595 | 52555 / 18572 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27597 | 52557 / 18574 | queryParameter_Grid_ListPaneDataGrid_InternalWorkOrderNum | grid_field_identifier | InternalWorkOrderNum | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27599 | 52558 / 18575 | POSTServiceURL | relative_api_path | /inventory/scaleapi/workOrderHeadersApi/WorkOrder-AllocatedAll? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27601 | 52558 / 18575 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27602 | 52559 / 18576 | POSTServiceURL | relative_api_path | /inventory/scaleapi/workOrderHeadersApi/WorkOrder-DeallocatedAll? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27604 | 52559 / 18576 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27605 | 52560 / 18577 | ConfirmationMessageCode | resource_code | MSG_CLOSEWORKORDER01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27606 | 52560 / 18577 | POSTServiceURL | relative_api_path | /inventory/scaleapi/workOrderHeadersApi/workOrders-Closed | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27607 | 52560 / 18577 | PostData_Grid_ListPaneDataGrid_InternalWorkOrderNum | grid_field_identifier | InternalWorkOrderNum | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27608 | 52560 / 18577 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27609 | 52561 / 18578 | queryParameter_Grid_ListPaneDataGrid_InternalWorkOrderNum | grid_field_identifier | InternalWorkOrderNum | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27614 | 52564 / 18581 | GETServiceURL | relative_api_path | /general/scaleapi/PrintApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27618 | 52566 / 18583 | ConfirmationMessageCode | resource_code | MSG_RELEASEWORKORDER01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27619 | 52566 / 18583 | POSTServiceURL | relative_api_path | /inventory/scaleapi/workOrderHeadersApi/WorkOrders-Released | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27620 | 52566 / 18583 | PostData_Grid_ListPaneDataGrid_InternalWorkOrderNum | grid_field_identifier | InternalWorkOrderNum | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27621 | 52566 / 18583 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27622 | 52566 / 18583 | Post_ErrorCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultErrorCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27623 | 52583 / 18587 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27625 | 52583 / 18587 | PostData_storedProcedure | stored_procedure_identifier | WOH_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
