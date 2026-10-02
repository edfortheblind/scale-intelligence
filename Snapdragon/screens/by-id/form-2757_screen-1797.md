# Work Insight — Form 2757, Screen 1797

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2757 |
| MAIN_UI_SCREEN Object ID | 1797 |
| Label / Form resource key | Work Insight / MNU_WORKINSIGHT |
| Functional area code | 50 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2757 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2757 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2757 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_WORK_INSIGHT_VIEW |
| Help page reference | WorkInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2757 |
| Inspection time (UTC) | 2026-10-02T15:23:23.345Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_WORKINSIGHT |
| Observed configured table/view | METADATA_WORK_INSIGHT_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1797 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:20:09.436Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/insights/2757#search; Work Insight | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

**Visible criteria / entry fields:** Work Unit; Work Type; Instruction Type; Item; Company; Reference ID; Wave Number; From Location; License Plate; Lot; User Assigned; From Aging Date Time; To Aging Date Time; Warehouse; Internal Number; Internal Number Type; Parent Container ID; Internal Container Number; Internal Line Number.

**Visible grid headers:** Work Unit; Instruction Type; Work Type; Condition; Item; Description; Company; Reference ID; From Location; Confirm Qty; To Location; Color.

**Observed action/menu labels:** Edit; Delete; Assign Team; Assign User; Change Priority; Completed By User; Confirm; Hold; Override Pick; Override Putaway; Print Preview; Print Default Docs; Print Selected Docs; Remove Hold; Unassign.

**Page groups:** Basic Criteria; Condition; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Work Insight is recorded as `insight`. Its saved configuration contains 11 parts, 41 groups, 82 controls, and 40 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4502 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4504 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4503 / AssignHoldCodeModalDialog | Not populated / Not populated | 20 / 5000 | Y / Y / Y | AssignHoldCodeSaveButton |
| 4505 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4506 / SearchPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | InsightMenuApply |
| 4507 / ListPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |
| 4508 / DetailPane | Not populated / Not populated | 10 / 12500 | Y / Y / N | Not populated |
| 4509 / ChangePriorityModalDialog | Not populated / Not populated | 20 / 15000 | Y / Y / Y | ChangePrioritySaveButton |
| 4510 / AssignUserModalDialog | Not populated / Not populated | 20 / 17500 | Y / Y / Y | AssignUserSaveButton |
| 4511 / AssignTeamModalDialog | Not populated / Not populated | 20 / 20250 | Y / Y / Y | AssignTeamSaveButton |
| 4512 / CompletedByUserModalDialog | Not populated / Not populated | 20 / 20350 | Y / Y / Y | CompletedByUserSaveButton |

### Part 4502: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18476 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18476; default=None |
| 18477 / SaveSearchModalDialogHeader | 18476 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18476; default=None |
| 18478 / SaveSearchModalDialogBody | 18476 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18476; default=None |
| 18479 / SaveSearchModalDialogFooter | 18476 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18476; default=None |

#### Group 18478: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52456 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18479: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52457 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52458 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4504: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18484 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18484; default=None |
| 18485 / GadgetCalculationQueryDialogHeader | 18484 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18484; default=None |
| 18486 / GadgetCalculationQueryDialogBody | 18484 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18484; default=None |
| 18487 / GadgetCalculationQueryDialogFooter | 18484 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18484; default=None |

#### Group 18486: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52462 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18487: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52463 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52464 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4503: AssignHoldCodeModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18480 / AssignHoldCodeModalDialogForm | Not populated | Not populated / Not populated | 90 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18480; default=None |
| 18481 / AssignHoldCodeModalDialogHeader | 18480 | Hold Code / HOLDCODE | 110 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18480; default=None |
| 18482 / AssignHoldCodeModalDialogBody | 18480 | Not populated / Not populated | 120 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18480; default=None |
| 18483 / AssignHoldCodeModalDialogFooter | 18480 | Not populated / Not populated | 130 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18480; default=None |

#### Group 18482: AssignHoldCodeModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52459 / HoldCodeEditor | Enter a Hold Code / ENTERHOLDCODE | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18483: AssignHoldCodeModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52460 / AssignHoldCodeSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52461 / AssignHoldCodeCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4505: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18488 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18488; default=None |
| 18489 / InsightMenuPanel | 18488 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18488; default=None |
| 18490 / InsightMenuFavoritesDropdown | 18488 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18488; default=None |
| 18491 / InsightListPaneMenuPanel | 18488 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18488; default=None |
| 18492 / MenuExportToExcelPanel | 18488 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18488; default=None |
| 18493 / InsightMenuActionsDropdown | 18488 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18488; default=None |

#### Group 18489: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52465 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 52466 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 52467 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 52468 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18491: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52469 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52470 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 52471 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 52472 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18492: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52473 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18493: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52474 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 1800 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 52475 / ListPaneMenuActionView | View / VIEW | 150 / 1800 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 52476 / ListPaneMenuActionDeleteWork | Delete / DELETE | 150 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 52477 / ListPaneMenuActionAssignTeam | Assign Team / ASSIGNTEAM | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ASSIGNTEAM |
| 52478 / ListPaneMenuActionAssignUser | Assign User / ASSIGNUSER | 150 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ASSIGNUSER |
| 52479 / ListPaneMenuActionChangePriority | Change Priority / CHANGEPRIORITY | 150 / 3500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CHANGEPRIORITY |
| 52480 / ListPaneMenuActionCompletedByUser | Completed By User / COMPLETEDBYUSER | 150 / 3700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CompletedByUser |
| 52481 / ListPaneMenuActionConfirmWork | Confirm / CONFIRM | 150 / 3750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CONFIRM |
| 52482 / ListPaneMenuActionAssignHoldCode | Hold / ASSIGNHOLD | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ASSIGNHOLD |
| 52483 / ListPaneMenuActionOverridePick | Override Pick / OVERRIDEPICK | 150 / 4100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=OVERRIDEPICK |
| 52484 / ListPaneMenuActionOverridePutaway | Override Putaway / OVERRIDELOCTITLE | 150 / 4200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=OVERRIDELOCTITLE |
| 52485 / ListPaneMenuActionPrintPreviewDocs | Print Preview / PRINTPREVIEW | 150 / 4400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTPREVIEW |
| 52486 / ListPaneMenuActionPrintDefaultDocuments | Print Default Docs / PRINTDEFAULTDOCS | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTDEFAULTDOCS |
| 52487 / ListPaneMenuActionPrintSelectedWorkDocs | Print Selected Docs / PRINTSELECTEDDOCS | 150 / 4750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTSELECTEDDOCS |
| 52488 / ListPaneMenuActionRemoveHoldCode | Remove Hold / REMOVEHOLD | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=REMOVEHOLD |
| 52489 / ListPaneMenuActionUnassignWork | Unassign / UNASSIGN | 150 / 5500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=UNASSIGN |

### Part 4506: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18494 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18494; default=None |
| 18495 / SearchPaneBasicCriteria | 18494 | Basic Criteria / BASICCRITERIA | 50 / 12500 | Y / Y | Fixed to top=N; loading=2; nested unit=18494; default=None |
| 18496 / SearchPaneCondition | 18494 | Condition / CONDITION | 50 / 17500 | Y / Y | Fixed to top=N; loading=0; nested unit=18494; default=None |
| 18497 / SearchPaneAdvancedCriteria | 18494 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 25000 | Y / Y | Fixed to top=N; loading=0; nested unit=18494; default=None |

#### Group 18495: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52490 / BasicCriteriaWorkUnit | Work Unit / WORKUNIT | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52499 / SearchPaneWrkTyp | Work Type / WORKTYPE | 280 / 3500 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52500 / SearchPaneInstType | Instruction Type / INSTRUCTIONTYPE | 80 / 3600 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52491 / BasicCriteriaItem | Item / ITEM | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52506 / SearchPaneComp | Company / COMPANY | 280 / 6000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52492 / BasicCriteriaReferenceId | Reference ID / REFERENCEID | 10 / 7500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52493 / BasicCriteriaWaveNumber | Wave Number / WAVENUMBER | 90 / 10000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52494 / BasicCriteriaFromLoc | From Location / FROMLOC | 10 / 12500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52495 / BasicCriteriaLicensePlate | License Plate / LICENSEPLATE | 10 / 15000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52496 / BasicCriteriaLot | Lot / LOT | 10 / 17500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52497 / BasicCriteriaUserAssigned | User Assigned / USERASSIGNED | 80 / 20000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52498 / BasicCriteriaAgingDateTimeRange | Aging Date Time / AGINGDATETIME | 190 / 22500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52501 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 24000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52502 / BasicCriteriaInternalNum | Not populated / InternalNum | 90 / 25000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52503 / BasicCriteriaInternalNumType | Not populated / InternalNumType | 10 / 26000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52504 / BasicCriteriaParentContainerId | Parent Container ID / PARENTCONTAINERID | 10 / 26250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52505 / BasicCriteriaInternalContainerNum | Internal Container Number / INTERNALCONTAINERNUM | 90 / 26500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52507 / BasicCriteriaInternalLineNum | Not populated / InternalLineNum | 90 / 27000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18496: SearchPaneCondition — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52508 / SearchPaneOpenCond | Include Open Work / INCLUDEOPENWORK | 130 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52509 / SearchPaneInProcessCond | Include in Process Work / INCLUDEINPROCESSWORK | 130 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52510 / SearchPaneClosedCond | Include Closed Work / INCLUDECLOSEDWORK | 130 / 7500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18497: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52511 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4507: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18498 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18498; default=None |
| 18499 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18499; default=None |

#### Group 18498: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52512 / ListPaneSummaryWorkUnits | Work Units / WORKUNITS | 50 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52513 / ListPaneSummaryRemainingPicks | Open / OPENPICKS | 50 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52514 / ListPaneSummaryRemainingUnits | Open Qty / OPENQTY | 50 / 7500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52515 / ListPaneSummaryPickedUnits | Picked Qty / PICKEDQTY | 50 / 10000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18499: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52516 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 52516 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18915 / Not populated | Internal_Instruction_Num / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18917 / Not populated | Work_Unit / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18918 / Not populated | Instruction_Type / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18919 / WORK_UNIT | Work_Unit / Not populated / Not populated | Not populated / 50 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18920 / Not populated | Work_Unit / Not populated / Not populated | Not populated / 30 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18923 / WORK_UNIT | Work_Unit / Work Unit / WORKUNIT | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18921 / Not populated | Not populated / Not populated / Not populated | Not populated / 30 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18924 / INSTRUCTION_TYPE | Not populated / Instruction Type / INSTRUCTIONTYPE | 10 / 10 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18922 / Not populated | Internal_Instruction_Num / Not populated / Not populated | Not populated / 30 / 3000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18925 / WORK_TYPE | Not populated / Work Type / WORKTYPE | 10 / 10 / 3000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18926 / WORK_INSTRUCTION_CONDITION | Not populated / Condition / CONDITION | 10 / 10 / 4000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18927 / ITEM | Not populated / Item / ITEM | 10 / 10 / 5000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18928 / ITEM_DESC | Not populated / Description / DESCRIPTION | 10 / 10 / 6000 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18929 / COMPANY | Not populated / Company / COMPANY | 10 / 10 / 6500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18930 / REFERENCE_ID | Not populated / Reference ID / REFERENCEID | 10 / 10 / 7000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18931 / FROM_LOC | Not populated / From Location / FROMLOCATION | 10 / 10 / 8000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18932 / FROM_LOC_CLASS | Not populated / Location Class / LOCATIONCLASS | 10 / 10 / 8200 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18933 / CONFIRM_QTY | Not populated / Confirm Qty / CONFIRMQTY | 20 / 10 / 8500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18934 / TO_LOC | Not populated / To Location / TOLOCATION | 10 / 10 / 9000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18935 / FROM_QTY | Not populated / From Qty / FROMQTY_SHORT | 20 / 10 / 10000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18936 / TO_QTY | Not populated / To Qty / TOQTY_SHORT | 20 / 10 / 11000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18937 / LOT | Not populated / Lot / LOT | 10 / 10 / 12000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18938 / LOGISTICS_UNIT | Not populated / License Plate / LICENSEPLATE | 10 / 10 / 13000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18939 / FROM_LOC_INV_ATTRIBUTES_ID | Not populated / From Inv Attributes / FROMINVENTORYATTRIBUTES | 40 / 10 / 14000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18940 / TO_LOC_INV_ATTRIBUTES_ID | Not populated / To Inv Attributes / TOINVENTORYATTRIBUTES | 40 / 10 / 15000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18941 / USER_ASSIGNED | Not populated / Assigned User / ASSIGNEDUSER | 10 / 10 / 16000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18942 / HOLD_CODE | Not populated / Hold Code / HOLDCODE | 10 / 10 / 18000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18952 / WORK_INSTRUCTION_PRIORITY | Not populated / Priority / PRIORITY | 20 / 10 / 18500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18943 / LAUNCH_NUM | Not populated / Wave Number / WAVENUMBER | 10 / 10 / 19000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18944 / FROM_WHS | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 20000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18945 / TO_WHS | Not populated / To Warehouse / TOWHS | 10 / 10 / 20500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18946 / INTERNAL_INSTRUCTION_NUM | Internal_Instruction_Num / Internal Instruction Number / INTERNALINSTRUCTIONNUM | 10 / 10 / 21000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18947 / INTERNAL_NUM_TYPE | Not populated / Internal Number Type / INTERNALNUMTYPE | 10 / 10 / 21500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18948 / TEAM_ASSIGNED | Not populated / Assigned Team / ASSIGNEDTEAM | 10 / 10 / 22000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18949 / QUANTITY_UM | Not populated / Quantity UM / QUANTITY_UM | 10 / 10 / 23000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18953 / COMPLETED_BY_USER | Not populated / Completed By User / COMPLETEDBYUSER | 10 / 10 / 24000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18916 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 24010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18954 / SRC_IDENTIFIER | Not populated / SRC Identifier / SRCIDENTIFIER | 10 / 10 / 25000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18950 / ICON | Not populated / Icon / ICON | 10 / 10 / 26000 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18951 / COLOR | Not populated / Color / COLOR | 10 / 10 / 27000 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4508: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18500 / DetailPaneHeaderRowWorkUnit | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18500; default=None |

#### Group 18500: DetailPaneHeaderRowWorkUnit — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52517 / DetailPaneHeaderWorkUnit | Not populated / Not populated | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=615; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52518 / DetailPaneHeaderWorkType | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=615; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52519 / DetailPaneHeaderCondition | Not populated / Not populated | 30 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=615; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52520 / DetailPaneHeaderFromLocation | Not populated / Not populated | 30 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=615; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52521 / DetailPaneHeaderToLocation | Not populated / Not populated | 30 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=615; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52522 / DetailPaneHeaderItem | Not populated / Not populated | 30 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=615; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52523 / DetailPaneHeaderItemDesc | Not populated / Not populated | 30 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=615; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52524 / DetailPaneHeaderCompany | Not populated / Not populated | 30 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=615; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52525 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 2250 | N / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=615; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4509: ChangePriorityModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18501 / ChangePriorityModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18501; default=None |
| 18502 / ChangePriorityModalDialogHeader | 18501 | Change Priority / CHANGEPRIORITY | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18501; default=None |
| 18503 / ChangePriorityModalDialogBody | 18501 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18501; default=None |
| 18504 / ChangePriorityModalDialogFooter | 18501 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18501; default=None |

#### Group 18503: ChangePriorityModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52526 / ChangePriorityEditor | Enter a Priority / ENTERPRIORITY | 90 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18504: ChangePriorityModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52527 / ChangePrioritySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52528 / ChangePriorityCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4510: AssignUserModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18505 / AssignUserModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18505; default=None |
| 18506 / AssignUserModalDialogHeader | 18505 | Assign User / ASSIGNUSER | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18505; default=None |
| 18507 / AssignUserModalDialogBody | 18505 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18505; default=None |
| 18508 / AssignUserModalDialogFooter | 18505 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18505; default=None |

#### Group 18507: AssignUserModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52529 / AssignUserComboBox | Enter a Username / ENTERAUSERNAME | 80 / 2500 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18508: AssignUserModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52530 / AssignUserSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52531 / AssignUserCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4511: AssignTeamModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18509 / AssignTeamModalDialogForm | Not populated | Not populated / Not populated | 90 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18509; default=None |
| 18510 / AssignTeamModalDialogHeader | 18509 | Assign Team / ASSIGNTEAM | 110 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18509; default=None |
| 18511 / AssignTeamModalDialogBody | 18509 | Not populated / Not populated | 120 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=18509; default=None |
| 18512 / AssignTeamModalDialogFooter | 18509 | Not populated / Not populated | 130 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=18509; default=None |

#### Group 18511: AssignTeamModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52532 / AssignTeamComboBox | Enter a Work Team / ENTERAWORKTEAM | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=30; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18512: AssignTeamModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52533 / AssignTeamSaveButton | Save / BTN_SAVE | 100 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52534 / AssignTeamCancelButton | Cancel / BTN_CANCEL | 100 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4512: CompletedByUserModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18513 / CompletedByUserModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18513; default=None |
| 18514 / CompletedByUserModalDialogHeader | 18513 | Completed By User / COMPLETEDBYUSER | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18513; default=None |
| 18515 / CompletedByUserModalDialogBody | 18513 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18513; default=None |
| 18516 / CompletedByUserModalDialogFooter | 18513 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18513; default=None |

#### Group 18515: CompletedByUserModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52535 / CompletedByUserComboBox | Enter a Username / ENTERAUSERNAME | 80 / 2500 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18516: CompletedByUserModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52536 / CompletedByUserSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52537 / CompletedByUserCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 92 control attributes, 44 events, and 111 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 41579 | 52456 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 41580 | 52456 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 41581 | 52459 / HoldCodeEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 41582 | 52459 / HoldCodeEditor | data-msg-required | Y / Y / Y | 40 / 0 |
| 41583 | 52468 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41584 | 52469 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41585 | 52474 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 41586 | 52474 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41587 | 52475 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 41588 | 52476 / ListPaneMenuActionDeleteWork | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41589 | 52476 / ListPaneMenuActionDeleteWork | data-formId | Y / Y / N | 8 / 0 |
| 41590 | 52476 / ListPaneMenuActionDeleteWork | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41591 | 52476 / ListPaneMenuActionDeleteWork | data-divider | Y / Y / N | 8 / 0 |
| 41592 | 52477 / ListPaneMenuActionAssignTeam | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41593 | 52477 / ListPaneMenuActionAssignTeam | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41594 | 52478 / ListPaneMenuActionAssignUser | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41595 | 52478 / ListPaneMenuActionAssignUser | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41596 | 52479 / ListPaneMenuActionChangePriority | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41597 | 52479 / ListPaneMenuActionChangePriority | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41598 | 52480 / ListPaneMenuActionCompletedByUser | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41599 | 52480 / ListPaneMenuActionCompletedByUser | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41600 | 52481 / ListPaneMenuActionConfirmWork | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41601 | 52481 / ListPaneMenuActionConfirmWork | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41602 | 52482 / ListPaneMenuActionAssignHoldCode | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41603 | 52482 / ListPaneMenuActionAssignHoldCode | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41604 | 52483 / ListPaneMenuActionOverridePick | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41605 | 52483 / ListPaneMenuActionOverridePick | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 41606 | 52484 / ListPaneMenuActionOverridePutaway | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41607 | 52484 / ListPaneMenuActionOverridePutaway | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 41608 | 52485 / ListPaneMenuActionPrintPreviewDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41609 | 52486 / ListPaneMenuActionPrintDefaultDocuments | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41610 | 52487 / ListPaneMenuActionPrintSelectedWorkDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41611 | 52488 / ListPaneMenuActionRemoveHoldCode | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41612 | 52488 / ListPaneMenuActionRemoveHoldCode | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41613 | 52489 / ListPaneMenuActionUnassignWork | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41614 | 52489 / ListPaneMenuActionUnassignWork | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41615 | 52490 / BasicCriteriaWorkUnit | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41616 | 52490 / BasicCriteriaWorkUnit | Lookup | Y / Y / N | 80 / 1 |
| 41631 | 52499 / SearchPaneWrkTyp | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41632 | 52500 / SearchPaneInstType | data-dbcolumn | Y / Y / N | 32 / 0 |
| 41617 | 52491 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 41618 | 52491 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 41641 | 52506 / SearchPaneComp | data-dbcolumn | Y / Y / N | 14 / 0 |
| 41619 | 52492 / BasicCriteriaReferenceId | data-dbcolumn | Y / Y / N | 24 / 0 |
| 41620 | 52492 / BasicCriteriaReferenceId | Lookup | Y / Y / N | 88 / 1 |
| 41621 | 52493 / BasicCriteriaWaveNumber | data-dbcolumn | Y / Y / N | 20 / 0 |
| 41622 | 52493 / BasicCriteriaWaveNumber | Lookup | Y / Y / N | 106 / 1 |
| 41623 | 52493 / BasicCriteriaWaveNumber | nullable | Y / Y / Y | 8 / 0 |
| 41624 | 52494 / BasicCriteriaFromLoc | data-dbcolumn | Y / Y / N | 16 / 0 |
| 41625 | 52494 / BasicCriteriaFromLoc | Lookup | Y / Y / N | 76 / 1 |
| 41626 | 52495 / BasicCriteriaLicensePlate | data-dbcolumn | Y / Y / N | 28 / 0 |
| 41627 | 52496 / BasicCriteriaLot | data-dbcolumn | Y / Y / N | 6 / 0 |
| 41628 | 52496 / BasicCriteriaLot | Lookup | Y / Y / N | 48 / 1 |
| 41629 | 52497 / BasicCriteriaUserAssigned | data-dbcolumn | Y / Y / N | 26 / 0 |
| 41630 | 52498 / BasicCriteriaAgingDateTimeRange | data-dbcolumn | Y / Y / N | 30 / 0 |
| 41633 | 52501 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 16 / 0 |
| 41634 | 52501 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 41635 | 52502 / BasicCriteriaInternalNum | data-dbcolumn | Y / Y / N | 24 / 0 |
| 41636 | 52502 / BasicCriteriaInternalNum | nullable | Y / Y / Y | 8 / 0 |
| 41637 | 52503 / BasicCriteriaInternalNumType | data-dbcolumn | Y / Y / N | 34 / 0 |
| 41638 | 52504 / BasicCriteriaParentContainerId | data-dbcolumn | Y / Y / N | 38 / 0 |
| 41639 | 52505 / BasicCriteriaInternalContainerNum | data-dbcolumn | Y / Y / N | 44 / 0 |
| 41640 | 52505 / BasicCriteriaInternalContainerNum | nullable | Y / Y / Y | 8 / 0 |
| 41642 | 52507 / BasicCriteriaInternalLineNum | data-dbcolumn | Y / Y / N | 34 / 0 |
| 41643 | 52507 / BasicCriteriaInternalLineNum | nullable | Y / Y / Y | 8 / 0 |
| 41644 | 52508 / SearchPaneOpenCond | data-dbcolumn | Y / Y / N | 52 / 0 |
| 41645 | 52508 / SearchPaneOpenCond | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41646 | 52508 / SearchPaneOpenCond | data-negativeCondition | Y / Y / N | 18 / 0 |
| 41647 | 52509 / SearchPaneInProcessCond | data-dbcolumn | Y / Y / N | 52 / 0 |
| 41648 | 52509 / SearchPaneInProcessCond | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41649 | 52509 / SearchPaneInProcessCond | data-negativeCondition | Y / Y / N | 30 / 0 |
| 41650 | 52510 / SearchPaneClosedCond | data-dbcolumn | Y / Y / N | 52 / 0 |
| 41651 | 52510 / SearchPaneClosedCond | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41652 | 52510 / SearchPaneClosedCond | data-negativeCondition | Y / Y / N | 22 / 0 |
| 41653 | 52513 / ListPaneSummaryRemainingPicks | data-aggregateClause | Y / Y / Y | 30 / 0 |
| 41654 | 52514 / ListPaneSummaryRemainingUnits | data-aggregateClause | Y / Y / Y | 26 / 0 |
| 41655 | 52515 / ListPaneSummaryPickedUnits | data-aggregateClause | Y / Y / Y | 30 / 0 |
| 41656 | 52516 / ListPaneDataGrid | data-dbtable | Y / Y / N | 52 / 0 |
| 41657 | 52516 / ListPaneDataGrid | data-queryEngineId | Y / Y / N | 64 / 0 |
| 41658 | 52516 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 48 / 0 |
| 41659 | 52516 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 20 / 0 |
| 41660 | 52516 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 41661 | 52516 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 41662 | 52517 / DetailPaneHeaderWorkUnit | href | Y / Y / Y | 160 / 0 |
| 41663 | 52526 / ChangePriorityEditor | data-rule-min | Y / Y / Y | 2 / 0 |
| 41664 | 52526 / ChangePriorityEditor | data-msg-min | Y / Y / Y | 18 / 1 |
| 41665 | 52529 / AssignUserComboBox | data-rule-required | Y / Y / Y | 8 / 0 |
| 41666 | 52529 / AssignUserComboBox | data-msg-required | Y / Y / Y | 32 / 1 |
| 41667 | 52532 / AssignTeamComboBox | data-rule-required | Y / Y / Y | 8 / 0 |
| 41668 | 52532 / AssignTeamComboBox | data-msg-required | Y / Y / Y | 32 / 1 |
| 41669 | 52535 / CompletedByUserComboBox | data-rule-required | Y / Y / Y | 8 / 0 |
| 41670 | 52535 / CompletedByUserComboBox | data-msg-required | Y / Y / Y | 30 / 1 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18513 / click | 52457 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18514 / click | 52458 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18515 / click | 52460 / AssignHoldCodeSaveButton | _webUi.insightListPaneActions.modalDialogPerformPostForSelection | Not populated | Y / Y |
| 18516 / click | 52461 / AssignHoldCodeCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18517 / click | 52463 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18518 / click | 52464 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18519 / click | 52465 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18520 / click | 52466 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18521 / click | 52467 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18522 / click | 52468 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18523 / click | 52469 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18524 / click | 52470 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 18525 / click | 52471 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18526 / click | 52472 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18527 / click | 52473 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18528 / click | 52474 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18529 / click | 52475 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18530 / click | 52476 / ListPaneMenuActionDeleteWork | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18531 / click | 52477 / ListPaneMenuActionAssignTeam | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18532 / click | 52478 / ListPaneMenuActionAssignUser | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18533 / click | 52479 / ListPaneMenuActionChangePriority | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18534 / click | 52480 / ListPaneMenuActionCompletedByUser | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18535 / click | 52481 / ListPaneMenuActionConfirmWork | _webUi.workInsight.menuActionConfirmWorkForSelection | Not populated | Y / Y |
| 18536 / click | 52482 / ListPaneMenuActionAssignHoldCode | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18537 / click | 52483 / ListPaneMenuActionOverridePick | _webUi.workInsight.menuActionOverridePick | Not populated | Y / Y |
| 18538 / click | 52484 / ListPaneMenuActionOverridePutaway | _webUi.workInsight.menuActionOverridePutaway | Not populated | Y / Y |
| 18539 / click | 52485 / ListPaneMenuActionPrintPreviewDocs | _webUi.dialog.printPreviewSelection | Not populated | Y / Y |
| 18540 / click | 52486 / ListPaneMenuActionPrintDefaultDocuments | _webUi.insightListPaneActions.menuActionPerformGet | Not populated | Y / Y |
| 18541 / click | 52487 / ListPaneMenuActionPrintSelectedWorkDocs | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 18542 / click | 52488 / ListPaneMenuActionRemoveHoldCode | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18543 / click | 52489 / ListPaneMenuActionUnassignWork | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18544 / iggridrequesterror | 52516 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18545 / iggriddatabound | 52516 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18546 / iggriddatarendered | 52516 / ListPaneDataGrid | _webUi.Grid.gridDataRendered | Not populated | Y / Y |
| 18547 / iggridselectionrowselectionchanged | 52516 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18548 / iggridselectionactiverowchanged | 52516 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |
| 18549 / click | 52527 / ChangePrioritySaveButton | _webUi.insightListPaneActions.modalDialogPerformPostForSelection | Not populated | Y / Y |
| 18550 / click | 52528 / ChangePriorityCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18551 / click | 52530 / AssignUserSaveButton | _webUi.insightListPaneActions.modalDialogPerformPostWithConfirmationForSelection | Not populated | Y / Y |
| 18552 / click | 52531 / AssignUserCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18553 / click | 52533 / AssignTeamSaveButton | _webUi.insightListPaneActions.modalDialogPerformPostWithConfirmationForSelection | Not populated | Y / Y |
| 18554 / click | 52534 / AssignTeamCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18555 / click | 52536 / CompletedByUserSaveButton | _webUi.insightListPaneActions.modalDialogPerformPostWithConfirmationForSelection | Not populated | Y / Y |
| 18556 / click | 52537 / CompletedByUserCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 27457 / 18513 | GETServiceURL | Y / Y | 76 |
| 27458 / 18513 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 27459 / 18513 | queryParameter_Function_UserName | Y / Y | 44 |
| 27460 / 18513 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27461 / 18513 | POSTServiceURL | Y / Y | 74 |
| 27462 / 18513 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 27463 / 18513 | PostData_Function_UserName | Y / Y | 44 |
| 27464 / 18513 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27465 / 18513 | PostData_Function_SearchValue | Y / Y | 98 |
| 27466 / 18513 | Post_SuccessCallback | Y / Y | 114 |
| 27467 / 18513 | ModalDialogName | Y / Y | 42 |
| 27468 / 18514 | ModalDialogName | Y / Y | 42 |
| 27469 / 18515 | POSTServiceURL | Y / Y | 142 |
| 27470 / 18515 | PostData_Grid_ListPaneDataGrid_InternalInstructionNum | Y / Y | 48 |
| 27471 / 18515 | PostData_Input_HoldCodeEditor_HoldCode | Y / Y | 10 |
| 27472 / 18515 | Post_SuccessCallback | Y / Y | 140 |
| 27473 / 18515 | ModalDialogName | Y / Y | 50 |
| 27474 / 18516 | ModalDialogName | Y / Y | 50 |
| 27475 / 18517 | POSTServiceURL | Y / Y | 144 |
| 27476 / 18517 | Form_Id | Y / Y | 8 |
| 27477 / 18517 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 27478 / 18517 | PostData_Function_SearchValue | Y / Y | 98 |
| 27479 / 18517 | Post_SuccessCallback | Y / Y | 114 |
| 27480 / 18517 | ModalDialogName | Y / Y | 56 |
| 27481 / 18518 | ModalDialogName | Y / Y | 56 |
| 27482 / 18522 | ModalDialogName | Y / Y | 42 |
| 27483 / 18523 | ModalDialogName | Y / Y | 56 |
| 27484 / 18528 | URL | Y / Y | 160 |
| 27485 / 18529 | URL | Y / Y | 160 |
| 27486 / 18530 | ConfirmationMessageCode | Y / Y | 22 |
| 27487 / 18530 | ConfirmationTitleCode | Y / Y | 20 |
| 27488 / 18530 | POSTServiceURL | Y / Y | 126 |
| 27489 / 18530 | PostData_Grid_ListPaneDataGrid_InternalInstructionNum | Y / Y | 48 |
| 27490 / 18530 | Post_SuccessCallback | Y / Y | 140 |
| 27491 / 18531 | ModalDialogName | Y / Y | 42 |
| 27492 / 18532 | ModalDialogName | Y / Y | 42 |
| 27493 / 18533 | ModalDialogName | Y / Y | 50 |
| 27494 / 18534 | ModalDialogName | Y / Y | 52 |
| 27495 / 18535 | ConfirmationMessageCode | Y / Y | 34 |
| 27496 / 18535 | POSTServiceURL | Y / Y | 128 |
| 27497 / 18535 | Post_SuccessCallback | Y / Y | 140 |
| 27498 / 18535 | componentUrl | Y / Y | 110 |
| 27499 / 18536 | ModalDialogName | Y / Y | 50 |
| 27500 / 18537 | componentUrl | Y / Y | 120 |
| 27501 / 18538 | componentUrl | Y / Y | 120 |
| 27502 / 18539 | queryParameter_internalNum | Y / Y | 44 |
| 27503 / 18539 | printProcess | Y / Y | 6 |
| 27504 / 18540 | GETServiceURL | Y / Y | 54 |
| 27505 / 18540 | queryParameter_internalNum | Y / Y | 44 |
| 27506 / 18540 | queryParameter_printProcess | Y / Y | 6 |
| 27507 / 18541 | URL | Y / Y | 218 |
| 27508 / 18542 | ConfirmationMessageCode | Y / Y | 40 |
| 27509 / 18542 | POSTServiceURL | Y / Y | 122 |
| 27510 / 18542 | PostData_Grid_ListPaneDataGrid_InternalInstructionNum | Y / Y | 48 |
| 27511 / 18542 | Post_SuccessCallback | Y / Y | 140 |
| 27512 / 18543 | ConfirmationMessageCode | Y / Y | 36 |
| 27513 / 18543 | POSTServiceURL | Y / Y | 116 |
| 27514 / 18543 | PostData_Grid_ListPaneDataGrid_WorkUnit | Y / Y | 18 |
| 27515 / 18543 | Post_SuccessCallback | Y / Y | 140 |
| 27516 / 18548 | POSTServiceURL | Y / Y | 74 |
| 27517 / 18548 | PostData_internalinstructionnum | Y / Y | 48 |
| 27518 / 18548 | PostData_storedProcedure | Y / Y | 50 |
| 27519 / 18548 | EnableAction_ListPaneMenuActionUnassignWork | Y / Y | 244 |
| 27520 / 18548 | EnableAction_DetailPaneMenuActionUnassignWork | Y / Y | 244 |
| 27521 / 18548 | EnableAction_ListPaneMenuActionPrintDefaultDocuments | Y / Y | 50 |
| 27522 / 18548 | EnableAction_ListPaneMenuActionPrintPreviewDocs | Y / Y | 50 |
| 27523 / 18548 | EnableAction_ListPaneMenuActionPrintSelectedWorkDocs | Y / Y | 50 |
| 27524 / 18548 | EnableAction_ListPaneMenuActionAssignHoldCode | Y / Y | 74 |
| 27525 / 18548 | EnableAction_DetailPaneMenuActionAssignHoldCode | Y / Y | 74 |
| 27526 / 18548 | EnableAction_ListPaneMenuActionRemoveHoldCode | Y / Y | 118 |
| 27527 / 18548 | EnableAction_DetailPaneMenuActionRemoveHoldCode | Y / Y | 118 |
| 27528 / 18548 | EnableAction_ListPaneMenuActionView | Y / Y | 50 |
| 27529 / 18548 | EnableAction_DetailPaneMenuActionView | Y / Y | 50 |
| 27530 / 18548 | EnableAction_ListPaneMenuActionEdit | Y / Y | 50 |
| 27531 / 18548 | EnableAction_DetailPaneMenuActionEdit | Y / Y | 50 |
| 27532 / 18548 | EnableAction_ListPaneMenuActionChangePriority | Y / Y | 74 |
| 27533 / 18548 | EnableAction_DetailPaneMenuActionChangePriority | Y / Y | 74 |
| 27534 / 18548 | EnableAction_ListPaneMenuActionConfirmWork | Y / Y | 466 |
| 27535 / 18548 | EnableAction_ListPaneMenuActionAssignUser | Y / Y | 136 |
| 27536 / 18548 | EnableAction_ListPaneMenuActionCompletedByUser | Y / Y | 74 |
| 27537 / 18548 | EnableAction_DetailPaneMenuActionAssignUser | Y / Y | 136 |
| 27538 / 18548 | EnableAction_ListPaneMenuActionDeleteWork | Y / Y | 72 |
| 27539 / 18548 | EnableAction_DetailPaneMenuActionDeleteWork | Y / Y | 72 |
| 27540 / 18548 | EnableAction_ListPaneMenuActionAssignTeam | Y / Y | 136 |
| 27541 / 18548 | EnableAction_ListPaneMenuActionOverridePick | Y / Y | 434 |
| 27542 / 18548 | EnableAction_ListPaneMenuActionOverridePutaway | Y / Y | 442 |
| 27543 / 18548 | EnableAction_DetailPaneMenuActionAssignTeam | Y / Y | 136 |
| 27544 / 18549 | POSTServiceURL | Y / Y | 138 |
| 27545 / 18549 | PostData_Grid_ListPaneDataGrid_InternalInstructionNum | Y / Y | 48 |
| 27546 / 18549 | PostData_Input_ChangePriorityEditor_Priority | Y / Y | 10 |
| 27547 / 18549 | Post_SuccessCallback | Y / Y | 140 |
| 27548 / 18549 | ModalDialogName | Y / Y | 50 |
| 27549 / 18550 | ModalDialogName | Y / Y | 50 |
| 27550 / 18551 | POSTServiceURL | Y / Y | 134 |
| 27551 / 18551 | PostData_Grid_ListPaneDataGrid_WorkUnit | Y / Y | 18 |
| 27552 / 18551 | PostData_Input_AssignUserComboBox_User | Y / Y | 26 |
| 27553 / 18551 | Post_SuccessCallback | Y / Y | 140 |
| 27554 / 18551 | ModalDialogName | Y / Y | 42 |
| 27555 / 18552 | ModalDialogName | Y / Y | 42 |
| 27556 / 18553 | POSTServiceURL | Y / Y | 134 |
| 27557 / 18553 | PostData_Grid_ListPaneDataGrid_WorkUnit | Y / Y | 18 |
| 27558 / 18553 | PostData_Input_AssignTeamComboBox_Team | Y / Y | 26 |
| 27559 / 18553 | Post_SuccessCallback | Y / Y | 140 |
| 27560 / 18553 | ModalDialogName | Y / Y | 42 |
| 27561 / 18554 | ModalDialogName | Y / Y | 42 |
| 27562 / 18555 | POSTServiceURL | Y / Y | 156 |
| 27563 / 18555 | PostData_Grid_ListPaneDataGrid_InternalInstructionNum | Y / Y | 48 |
| 27564 / 18555 | PostData_Input_CompletedByUserComboBox_User | Y / Y | 26 |
| 27565 / 18555 | Post_SuccessCallback | Y / Y | 140 |
| 27566 / 18555 | ModalDialogName | Y / Y | 52 |
| 27567 / 18556 | ModalDialogName | Y / Y | 52 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 81 selected candidate rows for this Screen: **81 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 41583 | 52468 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41584 | 52469 / Not applicable | data-securityCheckpoint | checkpoint | 20 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41585 | 52474 / Not applicable | data-formId | form_id | 2759 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41586 | 52474 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41587 | 52475 / Not applicable | data-formId | form_id | 2759 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41589 | 52476 / Not applicable | data-formId | form_id | 2759 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41590 | 52476 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41593 | 52477 / Not applicable | data-securityCheckpoint | checkpoint | 28 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41595 | 52478 / Not applicable | data-securityCheckpoint | checkpoint | 27 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41597 | 52479 / Not applicable | data-securityCheckpoint | checkpoint | 26 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41599 | 52480 / Not applicable | data-securityCheckpoint | checkpoint | 36 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41601 | 52481 / Not applicable | data-securityCheckpoint | checkpoint | 30 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41603 | 52482 / Not applicable | data-securityCheckpoint | checkpoint | 25 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41604 | 52483 / Not applicable | data-securityCheckpoint | checkpoint | 37 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41606 | 52484 / Not applicable | data-securityCheckpoint | checkpoint | 35 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41608 | 52485 / Not applicable | data-securityCheckpoint | checkpoint | 34 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41609 | 52486 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41610 | 52487 / Not applicable | data-securityCheckpoint | checkpoint | 29 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41612 | 52488 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41614 | 52489 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41615 | 52490 / Not applicable | data-dbcolumn | database_identifier | Work_Unit | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41617 | 52491 / Not applicable | data-dbcolumn | database_identifier | Item | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41619 | 52492 / Not applicable | data-dbcolumn | database_identifier | Reference_Id | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41621 | 52493 / Not applicable | data-dbcolumn | database_identifier | Launch_Num | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41624 | 52494 / Not applicable | data-dbcolumn | database_identifier | From_Loc | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41626 | 52495 / Not applicable | data-dbcolumn | database_identifier | Logistics_Unit | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41627 | 52496 / Not applicable | data-dbcolumn | database_identifier | Lot | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41629 | 52497 / Not applicable | data-dbcolumn | database_identifier | User_Assigned | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41630 | 52498 / Not applicable | data-dbcolumn | database_identifier | Aging_Date_Time | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41631 | 52499 / Not applicable | data-dbcolumn | database_identifier | Work_Type | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41632 | 52500 / Not applicable | data-dbcolumn | database_identifier | INSTRUCTION_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41633 | 52501 / Not applicable | data-dbcolumn | database_identifier | From_Whs | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41635 | 52502 / Not applicable | data-dbcolumn | database_identifier | Internal_Num | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41637 | 52503 / Not applicable | data-dbcolumn | database_identifier | Internal_Num_Type | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41638 | 52504 / Not applicable | data-dbcolumn | database_identifier | PARENT_CONTAINER_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41639 | 52505 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_CONTAINER_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41641 | 52506 / Not applicable | data-dbcolumn | database_identifier | Company | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41642 | 52507 / Not applicable | data-dbcolumn | database_identifier | Internal_Line_Num | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41644 | 52508 / Not applicable | data-dbcolumn | database_identifier | Work_Instruction_Condition | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41647 | 52509 / Not applicable | data-dbcolumn | database_identifier | Work_Instruction_Condition | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41650 | 52510 / Not applicable | data-dbcolumn | database_identifier | Work_Instruction_Condition | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41656 | 52516 / Not applicable | data-dbtable | database_identifier | Metadata_Insight_Work_View | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27457 | 52457 / 18513 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27461 | 52457 / 18513 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27466 | 52457 / 18513 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27469 | 52460 / 18515 | POSTServiceURL | relative_api_path | /general/scaleapi/workInstructionsApi/workInstructions-HoldCodeAssigned | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27470 | 52460 / 18515 | PostData_Grid_ListPaneDataGrid_InternalInstructionNum | grid_field_identifier | INTERNAL_INSTRUCTION_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27472 | 52460 / 18515 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27475 | 52463 / 18517 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27479 | 52463 / 18517 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27486 | 52476 / 18530 | ConfirmationMessageCode | resource_code | MSG_DLTWORK | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27487 | 52476 / 18530 | ConfirmationTitleCode | resource_code | DELETEWORK | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27488 | 52476 / 18530 | POSTServiceURL | relative_api_path | /outbound/scaleapi/WorkInstructionsApi/WorkInstructions-Deleted | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27489 | 52476 / 18530 | PostData_Grid_ListPaneDataGrid_InternalInstructionNum | grid_field_identifier | INTERNAL_INSTRUCTION_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27490 | 52476 / 18530 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27495 | 52481 / 18535 | ConfirmationMessageCode | resource_code | MSG_CONFIRMWORK01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27496 | 52481 / 18535 | POSTServiceURL | relative_api_path | /general/scaleapi/workInstructionsApi/workInstructions-confirmed | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27497 | 52481 / 18535 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27504 | 52486 / 18540 | GETServiceURL | relative_api_path | /general/scaleapi/PrintApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27508 | 52488 / 18542 | ConfirmationMessageCode | resource_code | MSG_REMOVEHOLDCODE07 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27509 | 52488 / 18542 | POSTServiceURL | relative_api_path | /general/scaleapi/workInstructionsApi/WorkInstructions-Unheld | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27510 | 52488 / 18542 | PostData_Grid_ListPaneDataGrid_InternalInstructionNum | grid_field_identifier | INTERNAL_INSTRUCTION_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27511 | 52488 / 18542 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27512 | 52489 / 18543 | ConfirmationMessageCode | resource_code | MSG_WORKUNASSIGN04 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27513 | 52489 / 18543 | POSTServiceURL | relative_api_path | /general/scaleapi/WorkInstructionsApi/WorkUnits-Unassigned | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27514 | 52489 / 18543 | PostData_Grid_ListPaneDataGrid_WorkUnit | grid_field_identifier | WORK_UNIT | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27515 | 52489 / 18543 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27516 | 52516 / 18548 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27518 | 52516 / 18548 | PostData_storedProcedure | stored_procedure_identifier | WRK_InsightDetailPaneData | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27544 | 52527 / 18549 | POSTServiceURL | relative_api_path | /general/scaleapi/workInstructionsApi/workInstructions-PriorityEdited | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27545 | 52527 / 18549 | PostData_Grid_ListPaneDataGrid_InternalInstructionNum | grid_field_identifier | INTERNAL_INSTRUCTION_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27547 | 52527 / 18549 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27550 | 52530 / 18551 | POSTServiceURL | relative_api_path | /general/scaleapi/workInstructionsApi/workInstructions-UserAssigned | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27551 | 52530 / 18551 | PostData_Grid_ListPaneDataGrid_WorkUnit | grid_field_identifier | WORK_UNIT | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27553 | 52530 / 18551 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27556 | 52533 / 18553 | POSTServiceURL | relative_api_path | /general/scaleapi/workInstructionsApi/workInstructions-TeamAssigned | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27557 | 52533 / 18553 | PostData_Grid_ListPaneDataGrid_WorkUnit | grid_field_identifier | WORK_UNIT | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27559 | 52533 / 18553 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27562 | 52536 / 18555 | POSTServiceURL | relative_api_path | /general/scaleapi/workInstructionsApi/workInstructions-CompletedByUserAssigned | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27563 | 52536 / 18555 | PostData_Grid_ListPaneDataGrid_InternalInstructionNum | grid_field_identifier | INTERNAL_INSTRUCTION_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27565 | 52536 / 18555 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
