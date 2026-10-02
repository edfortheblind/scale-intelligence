# World Ease Insight — Form 4088, Screen 1801

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4088 |
| MAIN_UI_SCREEN Object ID | 1801 |
| Label / Form resource key | World Ease Insight / MNU_WORLDEASEINSIGHT |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/4088 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/4088 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4088 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_WORLD_EASE_GROUP_VIEW |
| Help page reference | WorldEase_insight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4088 |
| Inspection time (UTC) | 2026-10-02T15:30:05.115Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_WORLDEASEINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_WORLD_EASE_GROUP_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1801 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:15:26.223Z | loaded; landing | https://trav.manhscale.com/scale/insights/4088; World Ease Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:15:27.327Z | loaded; actions | https://trav.manhscale.com/scale/insights/4088; World Ease Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:15:44.740Z | loaded; criteria_open | https://trav.manhscale.com/scale/insights/4088#search; World Ease Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:15:45.061Z | loaded; print_menu | https://trav.manhscale.com/scale/insights/4088#search; World Ease Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:15:52.868Z | loaded; advanced | https://trav.manhscale.com/scale/insights/4088#search; World Ease Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |

**Visible criteria / entry fields:** World Ease ID; Container ID; Shipment ID; Warehouse.

**Visible grid headers:** World Ease ID; Group Status; Field; Operand; Value.

**Observed action/menu labels:** Close; Print Default Docs; Print Selected Docs.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

World Ease Insight is recorded as `insight`. Its saved configuration contains 6 parts, 21 groups, 28 controls, and 8 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4531 / SaveSearchModalDialog | Not populated / Not populated | 20 / 250 | Y / Y / Y | SaveSearchSaveButton |
| 4533 / InsightMenuPane | Not populated / Not populated | 10 / 500 | Y / Y / N | Not populated |
| 4534 / SearchPane | Not populated / Not populated | 10 / 750 | Y / Y / N | InsightMenuApply |
| 4532 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4535 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4536 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4531: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18581 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18581; default=None |
| 18582 / SaveSearchModalDialogHeader | 18581 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18581; default=None |
| 18583 / SaveSearchModalDialogBody | 18581 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18581; default=None |
| 18584 / SaveSearchModalDialogFooter | 18581 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18581; default=None |

#### Group 18583: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52673 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18584: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52674 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52675 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4533: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18589 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18589; default=None |
| 18590 / InsightMenuPanel | 18589 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18589; default=None |
| 18591 / InsightMenuFavoritesDropdown | 18589 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18589; default=None |
| 18592 / InsightListPaneMenuPanel | 18589 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18589; default=None |
| 18593 / MenuExportToExcelPanel | 18589 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18589; default=None |
| 18594 / InsightMenuActionsDropdown | 18589 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18589; default=None |
| 18595 / InsightMenuPrintActionsDropdown | 18589 | Print / PRINT | 80 / 15550 | Y / Y | Fixed to top=N; loading=0; nested unit=18589; default=None |

#### Group 18590: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52679 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 52680 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 52681 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 52682 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18592: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52683 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52684 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 52685 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18593: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52686 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18594: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52687 / ListPaneMenuActionCloseGroup | Close / CLOSE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CLOSE |

#### Group 18595: InsightMenuPrintActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52688 / ListPaneMenuActionPrintWorldEaseDocs | Print Default Docs / PRINTDEFAULTDOCS | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTDEFAULTDOCS |
| 52689 / ListPaneMenuActionPrintSelectedWorldEaseDocs | Print Selected Docs / PRINTSELECTEDDOCS | 150 / 4750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTSELECTEDDOCS |

### Part 4534: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18596 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18596; default=None |
| 18597 / SearchPaneBasicCriteria | 18596 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18596; default=None |
| 18598 / SearchPaneAdvancedCriteria | 18596 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=18596; default=None |

#### Group 18597: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52690 / BasicCriteriaWorldEaseId | World Ease ID / WORLDEASEID | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52691 / BasicCriteriaContainerId | Not populated / containerId | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52692 / BasicCriteriaShipmentId | Shipment ID / SHIPMENTID | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52693 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 1000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52694 / BasicCriteriaIncludeOpenGroups | Include Open Groups / ALWAYSINCLUDEOPENGROUPS | 130 / 1500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52695 / BasicCriteriaShowClosedGroups | Show Closed Groups / SHOWCLOSEDGROUPS | 130 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18598: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52696 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4532: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18585 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18585; default=None |
| 18586 / GadgetCalculationQueryDialogHeader | 18585 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18585; default=None |
| 18587 / GadgetCalculationQueryDialogBody | 18585 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18585; default=None |
| 18588 / GadgetCalculationQueryDialogFooter | 18585 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18585; default=None |

#### Group 18587: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52676 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18588: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52677 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52678 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4535: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18599 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=18599; default=None |

#### Group 18599: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52697 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 52697 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 19035 / Not populated | WORLD_EASE_ID / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19028 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19029 / WorldEaseId | WORLD_EASE_ID / World Ease ID / WORLDEASEID | 20 / 10 / 300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19030 / WorldEaseGroupStatus | Not populated / Group Status / WORLDEASEGROUPSTATUS | 10 / 10 / 400 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19031 / WAREHOUSE | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19032 / ShipperCode | Not populated / Shipper Code / SHIPPERCODE | 10 / 10 / 600 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19033 / ICON | Not populated / Icon / ICON | 10 / 10 / 700 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19034 / COLOR | Not populated / Color / COLOR | 10 / 10 / 800 / 1 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4536: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18600 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18600; default=None |
| 18601 / indicatorpane | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18601; default=None |

#### Group 18600: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52698 / DetailPaneHeaderWorldEaseId | Not populated / Not populated | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=619; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52699 / DetailPaneHeaderWorldEaseGroupStatus | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=619; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18601: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52700 / WorldEaseInsightIndicatorTileContainers | Containers / CONTAINERS | 360 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 26 control attributes, 19 events, and 33 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 41802 | 52673 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 41803 | 52673 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 41804 | 52682 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41805 | 52683 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41806 | 52687 / ListPaneMenuActionCloseGroup | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41807 | 52687 / ListPaneMenuActionCloseGroup | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 41808 | 52688 / ListPaneMenuActionPrintWorldEaseDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41809 | 52689 / ListPaneMenuActionPrintSelectedWorldEaseDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41810 | 52690 / BasicCriteriaWorldEaseId | data-dbcolumn | Y / Y / N | 26 / 0 |
| 41811 | 52690 / BasicCriteriaWorldEaseId | nullable | Y / Y / Y | 8 / 0 |
| 41812 | 52691 / BasicCriteriaContainerId | data-dbcolumn | Y / Y / N | 24 / 0 |
| 41813 | 52691 / BasicCriteriaContainerId | Lookup | Y / Y / N | 90 / 1 |
| 41814 | 52692 / BasicCriteriaShipmentId | data-dbcolumn | Y / Y / N | 22 / 0 |
| 41815 | 52692 / BasicCriteriaShipmentId | Lookup | Y / Y / N | 88 / 1 |
| 41816 | 52693 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 41817 | 52693 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41818 | 52694 / BasicCriteriaIncludeOpenGroups | data-dbcolumn | Y / Y / N | 46 / 0 |
| 41819 | 52694 / BasicCriteriaIncludeOpenGroups | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41820 | 52694 / BasicCriteriaIncludeOpenGroups | data-negativeCondition | Y / Y / N | 8 / 0 |
| 41821 | 52695 / BasicCriteriaShowClosedGroups | data-dbcolumn | Y / Y / N | 46 / 0 |
| 41822 | 52695 / BasicCriteriaShowClosedGroups | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41823 | 52695 / BasicCriteriaShowClosedGroups | data-negativeCondition | Y / Y / N | 8 / 0 |
| 41824 | 52697 / ListPaneDataGrid | data-dbtable | Y / Y / N | 76 / 0 |
| 41825 | 52697 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 41826 | 52697 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 41827 | 52700 / WorldEaseInsightIndicatorTileContainers | data-indicatorTileGoToInsight | Y / Y / Y | 402 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18631 / click | 52674 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18632 / click | 52675 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18633 / click | 52677 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18634 / click | 52678 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18635 / click | 52679 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18636 / click | 52680 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18637 / click | 52681 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18638 / click | 52682 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18639 / click | 52683 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18640 / click | 52684 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18641 / click | 52685 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18642 / click | 52686 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18643 / click | 52687 / ListPaneMenuActionCloseGroup | _webUi.worldEaseInsight.closeManifestGroup | Not populated | Y / Y |
| 18644 / click | 52688 / ListPaneMenuActionPrintWorldEaseDocs | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 18645 / click | 52689 / ListPaneMenuActionPrintSelectedWorldEaseDocs | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 18646 / iggridrequesterror | 52697 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18647 / iggriddatabound | 52697 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18648 / iggridselectionrowselectionchanged | 52697 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18649 / iggridselectionactiverowchanged | 52697 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 27714 / 18631 | GETServiceURL | Y / Y | 76 |
| 27715 / 18631 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 27716 / 18631 | queryParameter_Function_UserName | Y / Y | 44 |
| 27717 / 18631 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27718 / 18631 | POSTServiceURL | Y / Y | 74 |
| 27719 / 18631 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 27720 / 18631 | PostData_Function_UserName | Y / Y | 44 |
| 27721 / 18631 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27722 / 18631 | PostData_Function_SearchValue | Y / Y | 98 |
| 27723 / 18631 | Post_SuccessCallback | Y / Y | 114 |
| 27724 / 18631 | ModalDialogName | Y / Y | 42 |
| 27725 / 18632 | ModalDialogName | Y / Y | 42 |
| 27726 / 18633 | POSTServiceURL | Y / Y | 144 |
| 27727 / 18633 | Form_Id | Y / Y | 8 |
| 27728 / 18633 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 27729 / 18633 | PostData_Function_SearchValue | Y / Y | 98 |
| 27730 / 18633 | Post_SuccessCallback | Y / Y | 114 |
| 27731 / 18633 | ModalDialogName | Y / Y | 56 |
| 27732 / 18634 | ModalDialogName | Y / Y | 56 |
| 27733 / 18638 | ModalDialogName | Y / Y | 42 |
| 27734 / 18639 | ModalDialogName | Y / Y | 56 |
| 27735 / 18644 | POSTServiceURL | Y / Y | 96 |
| 27736 / 18644 | PostData_internalNum | Y / Y | 22 |
| 27737 / 18644 | PostData_Grid_ListPaneDataGrid_ShipperCode | Y / Y | 22 |
| 27738 / 18644 | PostData_Grid_ListPaneDataGrid_Warehouse | Y / Y | 18 |
| 27739 / 18644 | PostData_printProcess | Y / Y | 6 |
| 27740 / 18645 | URL | Y / Y | 174 |
| 27741 / 18649 | POSTServiceURL | Y / Y | 74 |
| 27742 / 18649 | PostData_WorldEaseId | Y / Y | 22 |
| 27743 / 18649 | PostData_storedProcedure | Y / Y | 50 |
| 27744 / 18649 | EnableAction_ListPaneMenuActionCloseGroup | Y / Y | 62 |
| 27745 / 18649 | EnableAction_ListPaneMenuActionPrintWorldEaseDocs | Y / Y | 62 |
| 27746 / 18649 | EnableAction_ListPaneMenuActionPrintSelectedWorldEaseDocs | Y / Y | 62 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 22 selected candidate rows for this Screen: **22 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 41804 | 52682 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41805 | 52683 / Not applicable | data-securityCheckpoint | checkpoint | 26 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41806 | 52687 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41808 | 52688 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41809 | 52689 / Not applicable | data-securityCheckpoint | checkpoint | 25 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41810 | 52690 / Not applicable | data-dbcolumn | database_identifier | WORLD_EASE_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41812 | 52691 / Not applicable | data-dbcolumn | database_identifier | CONTAINER_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41814 | 52692 / Not applicable | data-dbcolumn | database_identifier | SHIPMENT_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41817 | 52693 / Not applicable | data-dbcolumn | database_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41818 | 52694 / Not applicable | data-dbcolumn | database_identifier | WORLD_EASE_GROUP_STATUS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41821 | 52695 / Not applicable | data-dbcolumn | database_identifier | WORLD_EASE_GROUP_STATUS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41824 | 52697 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_WORLD_EASE_GROUP_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27714 | 52674 / 18631 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27718 | 52674 / 18631 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27723 | 52674 / 18631 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27726 | 52677 / 18633 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27730 | 52677 / 18633 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27735 | 52688 / 18644 | POSTServiceURL | relative_api_path | /general/scaleapi/PrintApi/PrintedDocs-WorldEase | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27737 | 52688 / 18644 | PostData_Grid_ListPaneDataGrid_ShipperCode | grid_field_identifier | ShipperCode | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27738 | 52688 / 18644 | PostData_Grid_ListPaneDataGrid_Warehouse | grid_field_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27741 | 52697 / 18649 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27743 | 52697 / 18649 | PostData_storedProcedure | stored_procedure_identifier | WEG_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
