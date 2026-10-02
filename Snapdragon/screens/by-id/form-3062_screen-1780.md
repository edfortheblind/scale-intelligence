# Quality History Insight — Form 3062, Screen 1780

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3062 |
| MAIN_UI_SCREEN Object ID | 1780 |
| Label / Form resource key | Quality History Insight / MNU_QUALITYHISTORYINSIGHT |
| Functional area code | 100 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/3062 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/3062 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3062 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_QUALITY_HISTORY_VIEW |
| Help page reference | usingQualHistIns.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3062 |
| Inspection time (UTC) | 2026-10-02T15:26:24.047Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_QUALITYHISTORYINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_QUALITY_HISTORY_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1780 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:20:50.940Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/insights/3062#search; Quality History Insight | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

**Visible criteria / entry fields:** Item; Reference Type; Reference Order; Reason Code; Username; Internal Number; From Activity Date Time; To Activity Date Time; Work Team; Work Group; Work Type; Warehouse; Company.

**Visible grid headers:** Internal ID; Reason Code Description; Reference Type; Username; Reference Order; Item; Company; Work Type; Work Team; Work Group; Activity Date Time.

**Observed action/menu labels:** View.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Quality History Insight is recorded as `insight`. Its saved configuration contains 6 parts, 19 groups, 36 controls, and 19 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4398 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4399 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4400 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4401 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4402 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4403 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4398: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18122 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18122; default=None |
| 18123 / SaveSearchModalDialogHeader | 18122 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18122; default=None |
| 18124 / SaveSearchModalDialogBody | 18122 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18122; default=None |
| 18125 / SaveSearchModalDialogFooter | 18122 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18122; default=None |

#### Group 18124: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51745 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18125: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51746 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51747 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4399: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18126 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18126; default=None |
| 18127 / GadgetCalculationQueryDialogHeader | 18126 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18126; default=None |
| 18128 / GadgetCalculationQueryDialogBody | 18126 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18126; default=None |
| 18129 / GadgetCalculationQueryDialogFooter | 18126 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18126; default=None |

#### Group 18128: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51748 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18129: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51749 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51750 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4400: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18130 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18130; default=None |
| 18131 / InsightMenuPanel | 18130 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18130; default=None |
| 18132 / InsightMenuFavoritesDropdown | 18130 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18130; default=None |
| 18133 / InsightListPaneMenuPanel | 18130 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18130; default=None |
| 18134 / MenuExportToExcelPanel | 18130 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18130; default=None |
| 18135 / InsightMenuActionsDropdown | 18130 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18130; default=None |

#### Group 18131: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51751 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51752 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51753 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51754 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18133: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51755 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51756 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51757 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18134: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51758 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18135: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51759 / ListPaneMenuActionView | View / VIEW | 150 / 2200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEW |

### Part 4401: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18136 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18136; default=None |
| 18137 / SearchPaneBasicCriteria | 18136 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18136; default=None |
| 18138 / SearchPaneAdvancedCriteria | 18136 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 60000 | Y / Y | Fixed to top=N; loading=0; nested unit=18136; default=None |

#### Group 18137: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51760 / BasicCriteriaItem | Item / ITEM | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51761 / BasicCriteriaReferenceType | Reference Type / REFERENCETYPE | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51762 / BasicCriteriaReferenceOrder | Reference Order / REFERENCEORDER | 10 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51763 / BasicCriteriaReasonCode | Reason Code / REASONCODE | 80 / 4000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51764 / BasicCriteriaUsername | Username / USERNAME | 80 / 5000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51765 / BasicCriteriaInternalInternalNum | Internal Number / INTERNALNUM | 90 / 6000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51766 / BasicCriteriaActivityDateTime | Activity Date Time / ACTIVITYDATETIME | 190 / 7000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51767 / BasicCriteriakWorkTeam | Work Team / WORKTEAM | 80 / 8000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51768 / BasicCriteriaWorkGroup | Work Group / WORKGROUP | 80 / 9000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51769 / SearchPaneWorkTypeList | Work Type / WORKTYPE | 280 / 10000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51770 / SearchPaneWarehouseList | Not populated / warehouse | 280 / 11000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51771 / SearchPaneCompanyList | Not populated / Company | 280 / 12000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18138: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51772 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4402: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18139 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18139; default=None |

#### Group 18139: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51773 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51773 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18511 / ICON | Not populated / Icon / ICON | 10 / 10 / 500 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18514 / InternalId | INTERNAL_ID / Internal ID / INTERNALID | 10 / 10 / 700 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18515 / ReasonCode | Not populated / Reason Code Description / REASONCODEDESCRIPTION | 10 / 10 / 1200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18516 / ReferenceType | REFERENCE_TYPE / Reference Type / REFERENCETYPE | 10 / 10 / 1300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18517 / UserName | USER_NAME / Username / USERNAME | 10 / 10 / 1400 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18518 / Referenceorder | REFERENCE_ORDER / Reference Order / REFERENCEORDER | 10 / 10 / 1500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18519 / Item | ITEM / Item / ITEM | 10 / 10 / 1600 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18520 / Company | COMPANY / Company / COMPANY | 10 / 10 / 1700 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18521 / WorkType | WORK_TYPE / Work Type / WORKTYPE | 10 / 10 / 1800 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18522 / WorkTeam | WORK_TEAM / Work Team / WORKTEAM | 10 / 10 / 1900 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18523 / WorkGroup | WORK_GROUP / Work Group / WORKGROUP | 10 / 10 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18524 / QUALITY_HISTORY_INSIGHT_ACTIVITY_DATE_TIME | QUALITY_HISTORY_INSIGHT_ACTIVITY_DATE_TIME / Activity Date Time / ACTIVITYDATETIME | 30 / 10 / 2100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18525 / Warehouse | WAREHOUSE / Warehouse / WAREHOUSE | 10 / 10 / 2200 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18526 / InternalNum | INTERNAL_NUM / Internal Number / INTERNALNUM | 10 / 10 / 2300 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18527 / DateTimeStamp | DATE_TIME_STAMP / Date Time Stamp / DATETIMESTAMP | 30 / 10 / 2400 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18528 / ReferenceLineNum | REFERENCE_LINE_NUM / Reference Line Number / REFERENCELINENUM | 20 / 10 / 2500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18529 / ReasonCodeIdentifier | REASON_CODE / Reason Code / REASONCODE | 10 / 10 / 2600 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18513 / COLOR | Not populated / Color / COLOR | 10 / 10 / 3000 / 1 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18512 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 3010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4403: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18140 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18140; default=None |

#### Group 18140: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51774 / DetailPaneHeaderInternalId | Not populated / Not populated | 240 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=598; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51775 / DetailPaneHeaderWorkType | Not populated / Not populated | 30 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=598; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51776 / DetailPaneHeaderReasonCodeDesc | Not populated / Not populated | 30 / 6000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=598; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51777 / DetailPaneHeaderItem | Not populated / Not populated | 30 / 6500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=598; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51778 / DetailPaneHeaderItemDesc | Not populated / Not populated | 30 / 7000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=598; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51779 / DetailPaneHeaderCompany | Not populated / Not populated | 30 / 7500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=598; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51780 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 8000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=598; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 28 control attributes, 17 events, and 26 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40854 | 51745 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40855 | 51745 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40856 | 51754 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40857 | 51755 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40858 | 51759 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 40859 | 51759 / ListPaneMenuActionView | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40860 | 51760 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 40861 | 51760 / BasicCriteriaItem | Lookup | Y / Y / N | 66 / 0 |
| 40862 | 51761 / BasicCriteriaReferenceType | data-dbcolumn | Y / Y / N | 28 / 0 |
| 40863 | 51761 / BasicCriteriaReferenceType | Lookup | Y / Y / N | 104 / 0 |
| 40864 | 51762 / BasicCriteriaReferenceOrder | data-dbcolumn | Y / Y / N | 30 / 0 |
| 40865 | 51762 / BasicCriteriaReferenceOrder | Lookup | Y / Y / N | 108 / 1 |
| 40866 | 51763 / BasicCriteriaReasonCode | data-dbcolumn | Y / Y / N | 22 / 0 |
| 40867 | 51764 / BasicCriteriaUsername | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40868 | 51765 / BasicCriteriaInternalInternalNum | data-dbcolumn | Y / Y / N | 24 / 0 |
| 40869 | 51765 / BasicCriteriaInternalInternalNum | minValue | Y / Y / Y | 2 / 0 |
| 40870 | 51765 / BasicCriteriaInternalInternalNum | nullable | Y / Y / Y | 8 / 0 |
| 40871 | 51766 / BasicCriteriaActivityDateTime | data-dbcolumn | Y / Y / N | 84 / 0 |
| 40872 | 51766 / BasicCriteriaActivityDateTime | allowTodayOnlySelection | Y / Y / Y | 8 / 0 |
| 40873 | 51767 / BasicCriteriakWorkTeam | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40874 | 51768 / BasicCriteriaWorkGroup | data-dbcolumn | Y / Y / N | 20 / 0 |
| 40875 | 51769 / SearchPaneWorkTypeList | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40876 | 51770 / SearchPaneWarehouseList | defaultValue | Y / Y / Y | 32 / 0 |
| 40877 | 51770 / SearchPaneWarehouseList | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40878 | 51771 / SearchPaneCompanyList | data-dbcolumn | Y / Y / N | 14 / 0 |
| 40879 | 51773 / ListPaneDataGrid | data-dbtable | Y / Y / N | 74 / 0 |
| 40880 | 51773 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 24 / 0 |
| 40881 | 51774 / DetailPaneHeaderInternalId | href | Y / Y / Y | 112 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18112 / click | 51746 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18113 / click | 51747 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18114 / click | 51749 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18115 / click | 51750 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18116 / click | 51751 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18117 / click | 51752 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18118 / click | 51753 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18119 / click | 51754 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18120 / click | 51755 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18121 / click | 51756 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18122 / click | 51757 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18123 / click | 51758 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18124 / click | 51759 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18125 / iggridrequesterror | 51773 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18126 / iggriddatabound | 51773 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18127 / iggridselectionrowselectionchanged | 51773 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18128 / iggridselectionactiverowchanged | 51773 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 26665 / 18112 | GETServiceURL | Y / Y | 76 |
| 26666 / 18112 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 26667 / 18112 | queryParameter_Function_UserName | Y / Y | 44 |
| 26668 / 18112 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26669 / 18112 | POSTServiceURL | Y / Y | 74 |
| 26670 / 18112 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 26671 / 18112 | PostData_Function_UserName | Y / Y | 44 |
| 26672 / 18112 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26673 / 18112 | PostData_Function_SearchValue | Y / Y | 98 |
| 26674 / 18112 | Post_SuccessCallback | Y / Y | 114 |
| 26675 / 18112 | ModalDialogName | Y / Y | 42 |
| 26676 / 18113 | ModalDialogName | Y / Y | 42 |
| 26677 / 18114 | POSTServiceURL | Y / Y | 144 |
| 26678 / 18114 | Form_Id | Y / Y | 8 |
| 26679 / 18114 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26680 / 18114 | PostData_Function_SearchValue | Y / Y | 98 |
| 26681 / 18114 | Post_SuccessCallback | Y / Y | 114 |
| 26682 / 18114 | ModalDialogName | Y / Y | 56 |
| 26683 / 18115 | ModalDialogName | Y / Y | 56 |
| 26684 / 18119 | ModalDialogName | Y / Y | 42 |
| 26685 / 18120 | ModalDialogName | Y / Y | 56 |
| 26686 / 18124 | URL | Y / Y | 112 |
| 26687 / 18128 | EnableAction_ListPaneMenuActionView | Y / Y | 38 |
| 26688 / 18128 | POSTServiceURL | Y / Y | 74 |
| 26689 / 18128 | PostData_internalId | Y / Y | 20 |
| 26690 / 18128 | PostData_storedProcedure | Y / Y | 58 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 24 selected candidate rows for this Screen: **24 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40856 | 51754 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40857 | 51755 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40858 | 51759 / Not applicable | data-formId | form_id | 3055 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40859 | 51759 / Not applicable | data-securityCheckpoint | checkpoint | 6 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40860 | 51760 / Not applicable | data-dbcolumn | database_identifier | ITEM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40862 | 51761 / Not applicable | data-dbcolumn | database_identifier | REFERENCE_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40864 | 51762 / Not applicable | data-dbcolumn | database_identifier | REFERENCE_ORDER | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40866 | 51763 / Not applicable | data-dbcolumn | database_identifier | REASON_CODE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40867 | 51764 / Not applicable | data-dbcolumn | database_identifier | USER_NAME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40868 | 51765 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40871 | 51766 / Not applicable | data-dbcolumn | database_identifier | QUALITY_HISTORY_INSIGHT_ACTIVITY_DATE_TIME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40873 | 51767 / Not applicable | data-dbcolumn | database_identifier | WORK_TEAM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40874 | 51768 / Not applicable | data-dbcolumn | database_identifier | WORK_GROUP | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40875 | 51769 / Not applicable | data-dbcolumn | database_identifier | WORK_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40877 | 51770 / Not applicable | data-dbcolumn | database_identifier | warehouse | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40878 | 51771 / Not applicable | data-dbcolumn | database_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40879 | 51773 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_QUALITY_HISTORY_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26665 | 51746 / 18112 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26669 | 51746 / 18112 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26674 | 51746 / 18112 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26677 | 51749 / 18114 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26681 | 51749 / 18114 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26688 | 51773 / 18128 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26690 | 51773 / 18128 | PostData_storedProcedure | stored_procedure_identifier | QLTYHST_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
