# Putaway Group Insight — Form 2791, Screen 1778

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2791 |
| MAIN_UI_SCREEN Object ID | 1778 |
| Label / Form resource key | Putaway Group Insight / MNU_PUTAWAYGROUPINSIGHT |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2791 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2791 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2791 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_PUTAWAYGROUP_VIEW |
| Help page reference | putawaygrpwbench.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2791 |
| Inspection time (UTC) | 2026-10-02T15:24:35.207Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_PUTAWAYGROUPINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_PUTAWAYGROUP_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1778 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:12:57.016Z | loaded; runtime_inspection | https://trav.manhscale.com/scale/insights/2791; Putaway Group Insight | [runtime-root.json](../../evidence/runtime-root.json) |

**Visible criteria / entry fields:** Putaway Group ID; Putaway Location Name; Receipt ID; Group Number; Warehouse.

**Visible grid headers:** Field; Operand; Value; Icon; Putaway Group ID; Warehouse; Closed; Internal Group Number.

**Observed action/menu labels:** Σ; Actions; Close; Open; Rename.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Putaway Group Insight is recorded as `insight`. Its saved configuration contains 7 parts, 25 groups, 33 controls, and 7 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4385 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4386 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4387 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4388 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4389 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4390 / RenamePutawayGroupModalDialog | Not populated / Not populated | 20 / 7500 | Y / Y / Y | RenamePutawayGroupSaveButton |
| 4391 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4385: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18078 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18078; default=None |
| 18079 / SaveSearchModalDialogHeader | 18078 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18078; default=None |
| 18080 / SaveSearchModalDialogBody | 18078 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18078; default=None |
| 18081 / SaveSearchModalDialogFooter | 18078 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18078; default=None |

#### Group 18080: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51685 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18081: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51686 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51687 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4386: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18082 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18082; default=None |
| 18083 / GadgetCalculationQueryDialogHeader | 18082 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18082; default=None |
| 18084 / GadgetCalculationQueryDialogBody | 18082 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18082; default=None |
| 18085 / GadgetCalculationQueryDialogFooter | 18082 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18082; default=None |

#### Group 18084: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51688 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18085: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51689 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51690 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4387: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18086 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18086; default=None |
| 18087 / InsightMenuPanel | 18086 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18086; default=None |
| 18088 / InsightMenuFavoritesDropdown | 18086 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18086; default=None |
| 18089 / InsightListPaneMenuPanel | 18086 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18086; default=None |
| 18090 / MenuExportToExcelPanel | 18086 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18086; default=None |
| 18091 / InsightMenuActionsDropdown | 18086 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18086; default=None |

#### Group 18087: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51691 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51692 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51693 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51694 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18089: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51695 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51696 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 51697 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51698 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18090: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51699 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18091: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51700 / ListPaneMenuActionClosePutawayGroup | Close / CLOSEPUTGROUP | 150 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CLOSEPUTGROUP |
| 51701 / ListPaneMenuActionOpenPutawayGroup | Open / OPEN | 150 / 2050 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=OPEN |
| 51702 / ListPaneMenuActionRenamePutawayGroup | Rename / RENAMEPUTGROUP | 150 / 2100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=RENAMEPUTGROUP |

### Part 4388: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18092 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18092; default=None |
| 18093 / SearchPaneBasicCriteria | 18092 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18092; default=None |
| 18094 / SearchPaneAdvancedCriteria | 18092 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=18092; default=None |

#### Group 18093: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51703 / BasicCriteriaPutawayGroupId | Putaway Group ID / PUTAWAYGROUPID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51704 / BasicCriteriaPutawayGroupLocationName | Putaway Location Name / PUTAWAYLOCATIONNAME | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51705 / BasicCriteriaReceiptId | Receipt ID / RECEIPTID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51706 / BasicCriteriaGroupNum | Group Number / GROUPNUMBER | 90 / 300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51707 / SearchPaneWarehouse | Warehouse / WAREHOUSE | 280 / 3250 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51708 / BasicCriteriaIncludeClosedPutawayGroups | Show Closed Putaway Groups / SHOWCLOSEDPUTGRP | 130 / 3500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18094: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51709 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4389: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18095 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18095; default=None |
| 18096 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=18096; default=None |

#### Group 18095: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51710 / ListPaneSummaryReceipts | Receipts / RECEIPTS | 50 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18096: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51711 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51711 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18492 / ICON | Not populated / Icon / ICON | 10 / 10 / 10 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18494 / GROUP_ID | Not populated / Putaway Group ID / PUTAWAYGROUPID | 10 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18495 / WAREHOUSE | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 150 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18496 / CLOSED | Not populated / Closed / CLOSED | 40 / 10 / 200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18497 / INTERNAL_GROUP_NUM | INTERNAL_GROUP_NUM / Internal Group Number / INTERNALGROUPNUM | 10 / 10 / 230 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18498 / Not populated | INTERNAL_GROUP_NUM / Not populated / Not populated | Not populated / 20 / 6750 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18493 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 6760 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4390: RenamePutawayGroupModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18097 / RenamePutawayGroupModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18097; default=None |
| 18098 / RenamePutawayGroupModalDialogHeader | 18097 | Rename Putaway Group / RENAMEPUTAWAYGROUP | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18097; default=None |
| 18099 / RenamePutawayGroupModalDialogBody | 18097 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18097; default=None |
| 18100 / RenamePutawayGroupModalDialogFooter | 18097 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18097; default=None |

#### Group 18099: RenamePutawayGroupModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51712 / RenamePutawayGroupEditor | Enter a Name / ENTERPUTGROUPNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18100: RenamePutawayGroupModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51713 / RenamePutawayGroupSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51714 / RenamePutawayGroupCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4391: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18101 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18101; default=None |
| 18102 / indicatorpane | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18102; default=None |

#### Group 18101: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51715 / DetailPaneHeaderPutawayGroupID | Not populated / Not populated | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=596; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51716 / DetailPaneHeaderPutawayGroupLocationName | Not populated / Not populated | 240 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=596; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18102: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51717 / PutawayGroupInsightIndicatorTileContainers | Containers / CONTAINERS | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 28 control attributes, 22 events, and 45 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40805 | 51685 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40806 | 51685 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40807 | 51694 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40808 | 51695 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40809 | 51700 / ListPaneMenuActionClosePutawayGroup | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40810 | 51700 / ListPaneMenuActionClosePutawayGroup | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40811 | 51701 / ListPaneMenuActionOpenPutawayGroup | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40812 | 51701 / ListPaneMenuActionOpenPutawayGroup | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40813 | 51702 / ListPaneMenuActionRenamePutawayGroup | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40814 | 51702 / ListPaneMenuActionRenamePutawayGroup | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40815 | 51703 / BasicCriteriaPutawayGroupId | data-dbcolumn | Y / Y / N | 16 / 0 |
| 40816 | 51704 / BasicCriteriaPutawayGroupLocationName | data-dbcolumn | Y / Y / N | 44 / 0 |
| 40817 | 51705 / BasicCriteriaReceiptId | data-dbcolumn | Y / Y / N | 20 / 0 |
| 40818 | 51705 / BasicCriteriaReceiptId | Lookup | Y / Y / N | 86 / 1 |
| 40819 | 51706 / BasicCriteriaGroupNum | data-dbcolumn | Y / Y / N | 36 / 0 |
| 40820 | 51706 / BasicCriteriaGroupNum | nullable | Y / Y / Y | 8 / 0 |
| 40821 | 51707 / SearchPaneWarehouse | defaultValue | Y / Y / Y | 32 / 0 |
| 40822 | 51707 / SearchPaneWarehouse | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40823 | 51708 / BasicCriteriaIncludeClosedPutawayGroups | data-dbcolumn | Y / Y / N | 12 / 0 |
| 40824 | 51708 / BasicCriteriaIncludeClosedPutawayGroups | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40825 | 51708 / BasicCriteriaIncludeClosedPutawayGroups | data-negativeCondition | Y / Y / N | 10 / 0 |
| 40826 | 51708 / BasicCriteriaIncludeClosedPutawayGroups | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 40827 | 51708 / BasicCriteriaIncludeClosedPutawayGroups | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 40828 | 51710 / ListPaneSummaryReceipts | data-aggregateClause | Y / Y / Y | 54 / 0 |
| 40829 | 51711 / ListPaneDataGrid | data-dbtable | Y / Y / N | 68 / 0 |
| 40830 | 51712 / RenamePutawayGroupEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40831 | 51712 / RenamePutawayGroupEditor | data-msg-required | Y / Y / Y | 40 / 1 |
| 40832 | 51717 / PutawayGroupInsightIndicatorTileContainers | data-indicatorTileGoToInsight | Y / Y / Y | 290 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18071 / click | 51686 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18072 / click | 51687 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18073 / click | 51689 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18074 / click | 51690 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18075 / click | 51691 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18076 / click | 51692 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18077 / click | 51693 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18078 / click | 51694 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18079 / click | 51695 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18080 / click | 51696 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 18081 / click | 51697 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18082 / click | 51698 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18083 / click | 51699 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18084 / click | 51700 / ListPaneMenuActionClosePutawayGroup | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 18085 / click | 51701 / ListPaneMenuActionOpenPutawayGroup | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 18086 / click | 51702 / ListPaneMenuActionRenamePutawayGroup | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18087 / iggridrequesterror | 51711 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18088 / iggriddatabound | 51711 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18089 / iggridselectionrowselectionchanged | 51711 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18090 / iggridselectionactiverowchanged | 51711 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |
| 18091 / click | 51713 / RenamePutawayGroupSaveButton | _webUi.insightListPaneActions.modalDialogPerformPost | Not populated | Y / Y |
| 18092 / click | 51714 / RenamePutawayGroupCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 26586 / 18071 | GETServiceURL | Y / Y | 76 |
| 26587 / 18071 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 26588 / 18071 | queryParameter_Function_UserName | Y / Y | 44 |
| 26589 / 18071 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26590 / 18071 | POSTServiceURL | Y / Y | 74 |
| 26591 / 18071 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 26592 / 18071 | PostData_Function_UserName | Y / Y | 44 |
| 26593 / 18071 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26594 / 18071 | PostData_Function_SearchValue | Y / Y | 98 |
| 26595 / 18071 | Post_SuccessCallback | Y / Y | 114 |
| 26596 / 18071 | ModalDialogName | Y / Y | 42 |
| 26597 / 18072 | ModalDialogName | Y / Y | 42 |
| 26598 / 18073 | POSTServiceURL | Y / Y | 144 |
| 26599 / 18073 | Form_Id | Y / Y | 8 |
| 26600 / 18073 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26601 / 18073 | PostData_Function_SearchValue | Y / Y | 98 |
| 26602 / 18073 | Post_SuccessCallback | Y / Y | 114 |
| 26603 / 18073 | ModalDialogName | Y / Y | 56 |
| 26604 / 18074 | ModalDialogName | Y / Y | 56 |
| 26605 / 18078 | ModalDialogName | Y / Y | 42 |
| 26606 / 18079 | ModalDialogName | Y / Y | 56 |
| 26607 / 18084 | POSTServiceURL | Y / Y | 88 |
| 26608 / 18084 | queryParameter_Grid_ListPaneDataGrid_groupId | Y / Y | 16 |
| 26609 / 18084 | queryParameter_Grid_ListPaneDataGrid_warehouse | Y / Y | 18 |
| 26610 / 18084 | Post_SuccessCallback | Y / Y | 140 |
| 26611 / 18084 | Post_ErrorCallback | Y / Y | 120 |
| 26612 / 18085 | POSTServiceURL | Y / Y | 110 |
| 26613 / 18085 | PostData_Grid_ListPaneDataGrid_InternalGroupNum | Y / Y | 36 |
| 26614 / 18085 | Post_SuccessCallback | Y / Y | 140 |
| 26615 / 18085 | Post_ErrorCallback | Y / Y | 120 |
| 26616 / 18086 | ModalDialogName | Y / Y | 58 |
| 26617 / 18086 | PrePopulateModalData_RenamePutawayGroupEditor | Y / Y | 16 |
| 26618 / 18090 | POSTServiceURL | Y / Y | 72 |
| 26619 / 18090 | PostData_internalGroupNum | Y / Y | 36 |
| 26620 / 18090 | PostData_storedProcedure | Y / Y | 52 |
| 26621 / 18090 | EnableAction_ListPaneMenuActionClosePutawayGroup | Y / Y | 32 |
| 26622 / 18090 | EnableAction_ListPaneMenuActionRenamePutawayGroup | Y / Y | 32 |
| 26623 / 18090 | EnableAction_ListPaneMenuActionOpenPutawayGroup | Y / Y | 30 |
| 26624 / 18091 | POSTServiceURL | Y / Y | 112 |
| 26625 / 18091 | PostData_Grid_ListPaneDataGrid_InternalGroupNum | Y / Y | 36 |
| 26626 / 18091 | queryParameter_Input_RenamePutawayGroupEditor_GroupId | Y / Y | 10 |
| 26627 / 18091 | Post_SuccessCallback | Y / Y | 140 |
| 26628 / 18091 | Post_ErrorCallback | Y / Y | 120 |
| 26629 / 18091 | ModalDialogName | Y / Y | 58 |
| 26630 / 18092 | ModalDialogName | Y / Y | 58 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 32 selected candidate rows for this Screen: **31 accepted tokens** and **1 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40807 | 51694 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40808 | 51695 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40810 | 51700 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40812 | 51701 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40814 | 51702 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40815 | 51703 / Not applicable | data-dbcolumn | database_identifier | GROUP_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40816 | 51704 / Not applicable | data-dbcolumn | database_identifier | PUTAWAY_GROUP_LOCATION | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40817 | 51705 / Not applicable | data-dbcolumn | database_identifier | RECEIPT_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40819 | 51706 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_GROUP_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40822 | 51707 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40823 | 51708 / Not applicable | data-dbcolumn | database_identifier | CLOSED | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40829 | 51711 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_PUTAWAYGROUP_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26586 | 51686 / 18071 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26590 | 51686 / 18071 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26595 | 51686 / 18071 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26598 | 51689 / 18073 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26602 | 51689 / 18073 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26608 | 51700 / 18084 | queryParameter_Grid_ListPaneDataGrid_groupId | grid_field_identifier | GROUP_ID | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26609 | 51700 / 18084 | queryParameter_Grid_ListPaneDataGrid_warehouse | grid_field_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26610 | 51700 / 18084 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26611 | 51700 / 18084 | Post_ErrorCallback | callback_identifier | _webUi.insightListPaneActions.postMethodErrorCallbackHandler | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26612 | 51701 / 18085 | POSTServiceURL | relative_api_path | /inbound/scaleapi/PutawayGroupsApi/Opened-PutawayGroup? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26613 | 51701 / 18085 | PostData_Grid_ListPaneDataGrid_InternalGroupNum | grid_field_identifier | INTERNAL_GROUP_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26614 | 51701 / 18085 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26615 | 51701 / 18085 | Post_ErrorCallback | callback_identifier | _webUi.insightListPaneActions.postMethodErrorCallbackHandler | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26618 | 51711 / 18090 | POSTServiceURL | relative_api_path | /general/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26620 | 51711 / 18090 | PostData_storedProcedure | stored_procedure_identifier | PGPT_InsightDetailPaneData | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26624 | 51713 / 18091 | POSTServiceURL | relative_api_path | /inbound/scaleapi/PutawayGroupsApi/Renamed-PutawayGroup? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26625 | 51713 / 18091 | PostData_Grid_ListPaneDataGrid_InternalGroupNum | grid_field_identifier | INTERNAL_GROUP_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26627 | 51713 / 18091 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26628 | 51713 / 18091 | Post_ErrorCallback | callback_identifier | _webUi.insightListPaneActions.postMethodErrorCallbackHandler | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
