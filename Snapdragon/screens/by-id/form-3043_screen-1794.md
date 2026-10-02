# VAS Insight: Container — Form 3043, Screen 1794

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3043 |
| MAIN_UI_SCREEN Object ID | 1794 |
| Label / Form resource key | VAS Insight: Container / MNU_VASWORKBENCHINSIGHT |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/3043 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/3043 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3043 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_VAS_VIEW |
| Help page reference | VASworkbench.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3043 |
| Inspection time (UTC) | 2026-10-02T15:25:56.515Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_VASWORKBENCHINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_VAS_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1794 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:15:03.746Z | loaded; landing | https://trav.manhscale.com/scale/insights/3043; VAS Insight: Container | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:15:17.476Z | loaded; actions | https://trav.manhscale.com/scale/insights/3043; VAS Insight: Container | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:15:17.577Z | loaded; criteria_open | https://trav.manhscale.com/scale/insights/3043#search; VAS Insight: Container | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |

**Visible criteria / entry fields:** Shipment ID; Container; VAS Activity; Warehouse.

**Visible grid headers:** Confirmed; Container ID; Shipment ID; VAS Activity; Instructions; Status; QC Required.

**Observed action/menu labels:** Confirm; Print Preview; Print Default Docs; Print Selected Docs.

**Page groups:** Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

VAS Insight: Container is recorded as `insight`. Its saved configuration contains 4 parts, 13 groups, 20 controls, and 15 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4486 / InsightMenuPane | Not populated / Not populated | 10 / 750 | Y / Y / N | Not populated |
| 4487 / SearchPane | Not populated / Not populated | 10 / 1000 | Y / Y / N | InsightMenuApply |
| 4488 / ListPane | Not populated / Not populated | 10 / 1250 | Y / Y / N | Not populated |
| 4485 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |

### Part 4486: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18422 / InsightMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=18422; default=None |
| 18423 / InsightMenuPanel | 18422 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=18422; default=None |
| 18424 / InsightMenuFavoritesDropdown | 18422 | Favorites / FAVORITES | 100 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=18422; default=None |
| 18426 / VasWorkbenchMenuPanel | 18422 | Not populated / Not populated | 60 / 750 | Y / Y | Fixed to top=Y; loading=0; nested unit=18422; default=None |
| 18425 / InsightListPaneMenuPanel | 18422 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18422; default=None |
| 18427 / InsightMenuActionsDropdown | 18422 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18422; default=None |

#### Group 18423: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52359 / InsightMenuApply | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 52360 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 52361 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 650 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 52362 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18426: VasWorkbenchMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52366 / MenuActionVASConfirm | Confirm / CONFIRM | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=Confirm |

#### Group 18425: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52363 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52364 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 52365 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18427: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52367 / ListPaneMenuActionPrintPreviewDocs | Print Preview / PRINTPREVIEW | 150 / 4700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTPREVIEW |
| 52368 / ListPaneMenuActionPrintVasDocs | Print Default Docs / PRINTDEFAULTDOCS | 150 / 4750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTDEFAULTDOCS |
| 52369 / ListPaneMenuActionPrintSelectedVasDocs | Print Selected Docs / PRINTSELECTEDDOCS | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTSELECTEDDOCS |

### Part 4487: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18428 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18428; default=None |
| 18429 / SearchPaneBasicCriteria | 18428 | Criteria / CRITERIA | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=18428; default=None |

#### Group 18429: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52370 / SearchCriteriaShipmentID | Shipment ID / SHIPMENT_ID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52371 / SearchCriteriaContainer | Container / CONTAINER | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52372 / CriteriaVASActivity | VAS Activity / VASACTIVITY | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52373 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 1000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52374 / CriteriaIncludeConfirmedActivities | Include Confirmed Activities / INCLUDECONFIRMEDACTIVITIES | 130 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4488: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18430 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18430; default=None |

#### Group 18430: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52375 / ListPaneDataGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 52375 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18850 / CONFIRMED | Not populated / Confirmed / CONFIRMED | 40 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18852 / CONTAINERID | CONTAINERID / Container ID / CONTAINERID | 10 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18853 / SHIPMENTID | SHIPMENTID / Not populated / Not populated | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18854 / VAS_ACTIVITY | VAS_ACTIVITY / VAS Activity / VASACTIVITY | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18855 / INSTRUCTIONS | INSTRUCTIONS / Not populated / Not populated | 10 / 10 / 50 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18856 / STATUS | Not populated / Not populated / Not populated | 10 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18857 / QCREQUIRED | QCREQUIRED / Not populated / Not populated | 10 / 10 / 80 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18858 / VAS_OBJECTID | VAS_OBJECTID / Object ID / OBJECT_ID | 10 / 10 / 90 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18859 / INTERNAL_CONTAINER_NUM | INTERNAL_CONTAINER_NUM / Internal Container Number / INTERNALCONTAINERNUM | 20 / 10 / 100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18860 / INTERNAL_SHIPMENT_NUM | INTERNAL_SHIPMENT_NUM / Internal Shipment Number / INTERNALSHIPMENTNUM | 10 / 10 / 110 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18861 / OBJECTID | OBJECTID / Object ID / OBJECT_ID | 20 / 10 / 120 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18862 / COMPLETED | COMPLETED / Not populated / COMPLETED | 20 / 10 / 130 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18863 / CONTAINER_STATUS | STATUS / Container Status (Numeric) / CONTSTSNUMERIC | 10 / 10 / 140 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18864 / WAREHOUSE | WAREHOUSE / Warehouse / WAREHOUSE | 10 / 10 / 150 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18851 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 160 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4485: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18418 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18418; default=None |
| 18419 / GadgetCalculationQueryDialogHeader | 18418 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18418; default=None |
| 18420 / GadgetCalculationQueryDialogBody | 18418 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18418; default=None |
| 18421 / GadgetCalculationQueryDialogFooter | 18418 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18418; default=None |

#### Group 18420: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52356 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18421: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52357 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52358 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 23 control attributes, 16 events, and 18 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 41476 | 52363 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41477 | 52366 / MenuActionVASConfirm | disabled | Y / Y / Y | 2 / 0 |
| 41478 | 52366 / MenuActionVASConfirm | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41479 | 52367 / ListPaneMenuActionPrintPreviewDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41480 | 52368 / ListPaneMenuActionPrintVasDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41481 | 52369 / ListPaneMenuActionPrintSelectedVasDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41482 | 52370 / SearchCriteriaShipmentID | data-dbcolumn | Y / Y / N | 20 / 0 |
| 41483 | 52370 / SearchCriteriaShipmentID | Lookup | Y / Y / N | 90 / 1 |
| 41484 | 52371 / SearchCriteriaContainer | data-dbcolumn | Y / Y / N | 22 / 0 |
| 41485 | 52371 / SearchCriteriaContainer | Lookup | Y / Y / N | 88 / 1 |
| 41486 | 52372 / CriteriaVASActivity | data-dbcolumn | Y / Y / N | 24 / 0 |
| 41487 | 52373 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 41488 | 52373 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41489 | 52374 / CriteriaIncludeConfirmedActivities | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41490 | 52374 / CriteriaIncludeConfirmedActivities | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41491 | 52374 / CriteriaIncludeConfirmedActivities | data-negativeCondition | Y / Y / N | 10 / 0 |
| 41492 | 52375 / ListPaneDataGrid | data-formId | Y / Y / Y | 8 / 0 |
| 41493 | 52375 / ListPaneDataGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 41494 | 52375 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 41495 | 52375 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 41496 | 52375 / ListPaneDataGrid | data-restupdate | Y / Y / Y | 0 / 0 |
| 41497 | 52375 / ListPaneDataGrid | data-addRowRequired | Y / Y / Y | 2 / 0 |
| 41498 | 52375 / ListPaneDataGrid | data-dbtable | Y / Y / N | 50 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18447 / click | 52357 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18448 / click | 52358 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18449 / click | 52359 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18450 / click | 52360 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18451 / click | 52361 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18452 / click | 52363 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18453 / click | 52364 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18454 / click | 52365 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18455 / click | 52366 / MenuActionVASConfirm | _webUi.vasWorkbenchInsight.confirmVas | Not populated | Y / Y |
| 18456 / click | 52367 / ListPaneMenuActionPrintPreviewDocs | _webUi.dialog.printPreviewSelection | Not populated | Y / Y |
| 18457 / click | 52368 / ListPaneMenuActionPrintVasDocs | _webUi.insightListPaneActions.menuActionPerformGet | Not populated | Y / Y |
| 18458 / click | 52369 / ListPaneMenuActionPrintSelectedVasDocs | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 18459 / iggridrequesterror | 52375 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18460 / iggriddatabound | 52375 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18461 / iggridselectionrowselectionchanged | 52375 / ListPaneDataGrid | _webUi.vasWorkbenchInsight.gridSelectionRowChanged | Not populated | Y / Y |
| 18462 / iggridselectionactiverowchanged | 52375 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 27346 / 18447 | POSTServiceURL | Y / Y | 144 |
| 27347 / 18447 | Form_Id | Y / Y | 8 |
| 27348 / 18447 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 27349 / 18447 | PostData_Function_SearchValue | Y / Y | 98 |
| 27350 / 18447 | Post_SuccessCallback | Y / Y | 114 |
| 27351 / 18447 | ModalDialogName | Y / Y | 56 |
| 27352 / 18448 | ModalDialogName | Y / Y | 56 |
| 27353 / 18452 | ModalDialogName | Y / Y | 56 |
| 27354 / 18456 | queryParameter_Grid_ListPaneDataGrid_internalNum | Y / Y | 42 |
| 27355 / 18456 | printProcess | Y / Y | 6 |
| 27356 / 18457 | GETServiceURL | Y / Y | 54 |
| 27357 / 18457 | queryParameter_Grid_ListPaneDataGrid_internalNum | Y / Y | 42 |
| 27358 / 18457 | queryParameter_printProcess | Y / Y | 6 |
| 27359 / 18458 | URL | Y / Y | 206 |
| 27360 / 18458 | queryParameter_Grid_ListPaneDataGrid_InternalShipmentNum | Y / Y | 42 |
| 27361 / 18462 | EnableAction_ListPaneMenuActionPrintVasDocs | Y / Y | 60 |
| 27362 / 18462 | EnableAction_ListPaneMenuActionPrintPreviewDocs | Y / Y | 60 |
| 27363 / 18462 | EnableAction_ListPaneMenuActionPrintSelectedVasDocs | Y / Y | 60 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 19 selected candidate rows for this Screen: **18 accepted tokens** and **1 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 41476 | 52363 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41478 | 52366 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41479 | 52367 / Not applicable | data-securityCheckpoint | checkpoint | 34 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41480 | 52368 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41481 | 52369 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41482 | 52370 / Not applicable | data-dbcolumn | database_identifier | SHIPMENTID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41484 | 52371 / Not applicable | data-dbcolumn | database_identifier | CONTAINERID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41486 | 52372 / Not applicable | data-dbcolumn | database_identifier | VAS_OBJECTID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41488 | 52373 / Not applicable | data-dbcolumn | database_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41489 | 52374 / Not applicable | data-dbcolumn | database_identifier | CONFIRMED | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41492 | 52375 / Not applicable | data-formId | form_id | 3043 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41498 | 52375 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_VAS_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27346 | 52357 / 18447 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27350 | 52357 / 18447 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27354 | 52367 / 18456 | queryParameter_Grid_ListPaneDataGrid_internalNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27356 | 52368 / 18457 | GETServiceURL | relative_api_path | /general/scaleapi/PrintApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27357 | 52368 / 18457 | queryParameter_Grid_ListPaneDataGrid_internalNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27360 | 52369 / 18458 | queryParameter_Grid_ListPaneDataGrid_InternalShipmentNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
