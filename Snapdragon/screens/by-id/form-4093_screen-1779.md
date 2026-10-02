# Putwall Insight — Form 4093, Screen 1779

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4093 |
| MAIN_UI_SCREEN Object ID | 1779 |
| Label / Form resource key | Putwall Insight / MNU_PUTWALLINSIGHT |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/4093 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/4093 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4093 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_PUTWALL_LOCATION_VIEW |
| Help page reference | putwallinsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4093 |
| Inspection time (UTC) | 2026-10-02T15:30:13.851Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_PUTWALLINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_PUTWALL_LOCATION_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1779 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:12:03.148Z | loaded; landing | https://trav.manhscale.com/scale/insights/4093; Putwall Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:12:15.367Z | loaded; actions | https://trav.manhscale.com/scale/insights/4093; Putwall Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:12:16.181Z | loaded; criteria_open | https://trav.manhscale.com/scale/insights/4093#search; Putwall Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:12:31.749Z | loaded; advanced | https://trav.manhscale.com/scale/insights/4093#search; Putwall Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |

**Visible criteria / entry fields:** Putwall Location; Shipment ID; Container ID; Warehouse; Location Status.

**Visible grid headers:** Putwall Location; Location Status; Shipment ID; Container ID; Color; Field; Operand; Value.

**Observed action/menu labels:** Pack.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Putwall Insight is recorded as `insight`. Its saved configuration contains 6 parts, 19 groups, 27 controls, and 12 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4392 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4393 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4394 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4395 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4396 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4397 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4392: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18103 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18103; default=None |
| 18104 / SaveSearchModalDialogHeader | 18103 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18103; default=None |
| 18105 / SaveSearchModalDialogBody | 18103 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18103; default=None |
| 18106 / SaveSearchModalDialogFooter | 18103 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18103; default=None |

#### Group 18105: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51718 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18106: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51719 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51720 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4393: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18107 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18107; default=None |
| 18108 / GadgetCalculationQueryDialogHeader | 18107 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18107; default=None |
| 18109 / GadgetCalculationQueryDialogBody | 18107 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18107; default=None |
| 18110 / GadgetCalculationQueryDialogFooter | 18107 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18107; default=None |

#### Group 18109: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51721 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18110: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51722 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51723 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4394: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18111 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18111; default=None |
| 18112 / InsightMenuPanel | 18111 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18111; default=None |
| 18113 / InsightMenuFavoritesDropdown | 18111 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18111; default=None |
| 18114 / InsightListPaneMenuPanel | 18111 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18111; default=None |
| 18115 / MenuExportToExcelPanel | 18111 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18111; default=None |
| 18116 / InsightMenuActionsDropdown | 18111 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18111; default=None |

#### Group 18112: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51724 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51725 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51726 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51727 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18114: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51728 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51729 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 51730 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51731 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18115: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51732 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18116: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51733 / ListPaneMenuActionClear | Clear Location / CLEARLOCATION | 150 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CLEARLOCATION |
| 51734 / ListPaneMenuActionPack | Pack / PACK | 150 / 4570 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PACK |

### Part 4395: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18117 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18117; default=None |
| 18118 / SearchPaneBasicCriteria | 18117 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18117; default=None |
| 18119 / SearchPaneAdvancedCriteria | 18117 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 17500 | Y / Y | Fixed to top=N; loading=0; nested unit=18117; default=None |

#### Group 18118: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51735 / BasicCriteriaPutwallLocation | Putwall Location / WMPUTWALL | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51736 / BasicCriteriaShipmentId | Shipment ID / SHIPMENTID | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51737 / BasicCriteriaContainerId | Not populated / containerId | 10 / 6000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51738 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 9000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51739 / BasicCriteriaLocationStatus | Location Status / LOCATIONSTATUS | 280 / 10000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51740 / IncludeEmptyLocation | Include Empty Location / INCLUDEEMPTYLOCATION | 130 / 26300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18119: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51741 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4396: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18120 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18120; default=None |

#### Group 18120: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51742 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51742 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18500 / Not populated | LOCATION / Not populated / Not populated | Not populated / 20 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18501 / LOCATION | Not populated / Putwall Location / WMPUTWALL | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18502 / LOCATION_STS | Not populated / Location Status / LOCATIONSTATUS | 10 / 10 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18503 / SHIPMENT_ID | Not populated / Shipment ID / SHIPMENTID | 10 / 10 / 3500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18504 / CONTAINER_ID | Not populated / Container ID / CONTAINERID | 10 / 10 / 4000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18510 / COLOR | Not populated / Color / COLOR | 10 / 10 / 13600 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18505 / WAREHOUSE | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 14000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18506 / SORT_COMPLETED | Not populated / Sort Completed / SORTCOMPLETED | 40 / 10 / 15000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18507 / ICON | Not populated / Icon / ICON | 10 / 10 / 19000 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18508 / INTERNAL_SHIPMENT_NUM | Not populated / Internal Shipment Number / INTERNALSHIPMENTNUM | 10 / 10 / 20000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18509 / INTERNAL_CONTAINER_NUM | Not populated / Internal Container Number / INTERNALCONTAINERNUM | 10 / 10 / 20000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18499 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 20010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4397: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18121 / DetailPaneHeader | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18121; default=None |

#### Group 18121: DetailPaneHeader — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51743 / DetailPaneHeaderPutwallLocation | Not populated / Not populated | 30 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=597; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51744 / DetailPaneHeaderLocationStatus | Not populated / Not populated | 30 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=597; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 21 control attributes, 19 events, and 34 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40833 | 51718 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40834 | 51718 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40835 | 51727 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40836 | 51728 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40837 | 51733 / ListPaneMenuActionClear | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40838 | 51734 / ListPaneMenuActionPack | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40839 | 51735 / BasicCriteriaPutwallLocation | data-dbcolumn | Y / Y / N | 16 / 0 |
| 40840 | 51735 / BasicCriteriaPutwallLocation | Lookup | Y / Y / N | 78 / 1 |
| 40841 | 51736 / BasicCriteriaShipmentId | data-dbcolumn | Y / Y / N | 22 / 0 |
| 40842 | 51736 / BasicCriteriaShipmentId | Lookup | Y / Y / N | 88 / 1 |
| 40843 | 51737 / BasicCriteriaContainerId | data-dbcolumn | Y / Y / N | 24 / 0 |
| 40844 | 51737 / BasicCriteriaContainerId | Lookup | Y / Y / N | 90 / 1 |
| 40845 | 51738 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 40846 | 51738 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40847 | 51739 / BasicCriteriaLocationStatus | data-dbcolumn | Y / Y / N | 24 / 0 |
| 40848 | 51740 / IncludeEmptyLocation | data-dbcolumn | Y / Y / N | 10 / 0 |
| 40849 | 51740 / IncludeEmptyLocation | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40850 | 51740 / IncludeEmptyLocation | data-negativeCondition | Y / Y / N | 10 / 0 |
| 40851 | 51742 / ListPaneDataGrid | data-dbtable | Y / Y / N | 76 / 0 |
| 40852 | 51742 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 40853 | 51742 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18093 / click | 51719 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18094 / click | 51720 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18095 / click | 51722 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18096 / click | 51723 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18097 / click | 51724 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18098 / click | 51725 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18099 / click | 51726 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18100 / click | 51727 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18101 / click | 51728 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18102 / click | 51729 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 18103 / click | 51730 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18104 / click | 51731 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18105 / click | 51732 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18106 / click | 51733 / ListPaneMenuActionClear | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18107 / click | 51734 / ListPaneMenuActionPack | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18108 / iggridrequesterror | 51742 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18109 / iggriddatabound | 51742 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18110 / iggridselectionrowselectionchanged | 51742 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18111 / iggridselectionactiverowchanged | 51742 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 26631 / 18093 | GETServiceURL | Y / Y | 76 |
| 26632 / 18093 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 26633 / 18093 | queryParameter_Function_UserName | Y / Y | 44 |
| 26634 / 18093 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26635 / 18093 | POSTServiceURL | Y / Y | 74 |
| 26636 / 18093 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 26637 / 18093 | PostData_Function_UserName | Y / Y | 44 |
| 26638 / 18093 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26639 / 18093 | PostData_Function_SearchValue | Y / Y | 98 |
| 26640 / 18093 | Post_SuccessCallback | Y / Y | 114 |
| 26641 / 18093 | ModalDialogName | Y / Y | 42 |
| 26642 / 18094 | ModalDialogName | Y / Y | 42 |
| 26643 / 18095 | POSTServiceURL | Y / Y | 144 |
| 26644 / 18095 | Form_Id | Y / Y | 8 |
| 26645 / 18095 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26646 / 18095 | PostData_Function_SearchValue | Y / Y | 98 |
| 26647 / 18095 | Post_SuccessCallback | Y / Y | 114 |
| 26648 / 18095 | ModalDialogName | Y / Y | 56 |
| 26649 / 18096 | ModalDialogName | Y / Y | 56 |
| 26650 / 18100 | ModalDialogName | Y / Y | 42 |
| 26651 / 18101 | ModalDialogName | Y / Y | 56 |
| 26652 / 18106 | ConfirmationMessageCode | Y / Y | 38 |
| 26653 / 18106 | POSTServiceURL | Y / Y | 92 |
| 26654 / 18106 | PostData_Grid_ListPaneDataGrid_PutwallLocation | Y / Y | 16 |
| 26655 / 18106 | PostData_Grid_ListPaneDataGrid_Warehouse | Y / Y | 18 |
| 26656 / 18106 | Post_SuccessCallback | Y / Y | 140 |
| 26657 / 18107 | URL | Y / Y | 188 |
| 26658 / 18107 | queryParameter_Grid_ListPaneDataGrid_Location | Y / Y | 16 |
| 26659 / 18107 | queryParameter_Grid_ListPaneDataGrid_ShipmentId | Y / Y | 22 |
| 26660 / 18111 | POSTServiceURL | Y / Y | 74 |
| 26661 / 18111 | PostData_location | Y / Y | 16 |
| 26662 / 18111 | PostData_storedProcedure | Y / Y | 50 |
| 26663 / 18111 | EnableAction_ListPaneMenuActionClear | Y / Y | 48 |
| 26664 / 18111 | EnableAction_ListPaneMenuActionPack | Y / Y | 132 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 25 selected candidate rows for this Screen: **25 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40835 | 51727 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40836 | 51728 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40837 | 51733 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40838 | 51734 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40839 | 51735 / Not applicable | data-dbcolumn | database_identifier | Location | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40841 | 51736 / Not applicable | data-dbcolumn | database_identifier | Shipment_Id | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40843 | 51737 / Not applicable | data-dbcolumn | database_identifier | CONTAINER_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40846 | 51738 / Not applicable | data-dbcolumn | database_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40847 | 51739 / Not applicable | data-dbcolumn | database_identifier | Location_Sts | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40848 | 51740 / Not applicable | data-dbcolumn | database_identifier | EMPTY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40851 | 51742 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_PUTWALL_LOCATION_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26631 | 51719 / 18093 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26635 | 51719 / 18093 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26640 | 51719 / 18093 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26643 | 51722 / 18095 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26647 | 51722 / 18095 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26652 | 51733 / 18106 | ConfirmationMessageCode | resource_code | MSG_CLEARLOCATION02 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26653 | 51733 / 18106 | POSTServiceURL | relative_api_path | /outbound/scaleapi/putwallApi/location-cleared | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26654 | 51733 / 18106 | PostData_Grid_ListPaneDataGrid_PutwallLocation | grid_field_identifier | LOCATION | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26655 | 51733 / 18106 | PostData_Grid_ListPaneDataGrid_Warehouse | grid_field_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26656 | 51733 / 18106 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26658 | 51734 / 18107 | queryParameter_Grid_ListPaneDataGrid_Location | grid_field_identifier | LOCATION | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26659 | 51734 / 18107 | queryParameter_Grid_ListPaneDataGrid_ShipmentId | grid_field_identifier | SHIPMENT_ID | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26660 | 51742 / 18111 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26662 | 51742 / 18111 | PostData_storedProcedure | stored_procedure_identifier | PWL_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
