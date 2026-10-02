# Tote Insight — Form 4091, Screen 1790

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4091 |
| MAIN_UI_SCREEN Object ID | 1790 |
| Label / Form resource key | Tote Insight / MNU_TOTEINSIGHT |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/4091 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/4091 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4091 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_TOTE_VIEW |
| Help page reference | Toteinsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4091 |
| Inspection time (UTC) | 2026-10-02T15:30:09.311Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_TOTEINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_TOTE_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1790 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:14:39.004Z | loaded; landing | https://trav.manhscale.com/scale/insights/4091; Tote Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:14:54.083Z | loaded; actions | https://trav.manhscale.com/scale/insights/4091; Tote Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:14:54.953Z | loaded; criteria_open | https://trav.manhscale.com/scale/insights/4091#search; Tote Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:15:01.694Z | loaded; advanced | https://trav.manhscale.com/scale/insights/4091#search; Tote Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |

**Visible criteria / entry fields:** Tote ID; Shipment ID; Container ID; Condition; User Assigned; Mark for Sorting; Putwall Location; Warehouse.

**Visible grid headers:** Tote ID; Condition; Assigned User; Mark for Sorting; Color; Field; Operand; Value.

**Observed action/menu labels:** Unassign.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Tote Insight is recorded as `insight`. Its saved configuration contains 6 parts, 20 groups, 30 controls, and 12 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4461 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4462 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4463 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4464 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4465 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4466 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4461: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18342 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18342; default=None |
| 18343 / SaveSearchModalDialogHeader | 18342 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18342; default=None |
| 18344 / SaveSearchModalDialogBody | 18342 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18342; default=None |
| 18345 / SaveSearchModalDialogFooter | 18342 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18342; default=None |

#### Group 18344: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52236 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18345: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52237 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52238 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4462: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18346 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18346; default=None |
| 18347 / GadgetCalculationQueryDialogHeader | 18346 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18346; default=None |
| 18348 / GadgetCalculationQueryDialogBody | 18346 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18346; default=None |
| 18349 / GadgetCalculationQueryDialogFooter | 18346 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18346; default=None |

#### Group 18348: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52239 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18349: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52240 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52241 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4463: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18350 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18350; default=None |
| 18351 / InsightMenuPanel | 18350 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18350; default=None |
| 18352 / InsightMenuFavoritesDropdown | 18350 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18350; default=None |
| 18353 / InsightListPaneMenuPanel | 18350 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18350; default=None |
| 18354 / MenuExportToExcelPanel | 18350 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18350; default=None |
| 18355 / InsightMenuActionsDropdown | 18350 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18350; default=None |

#### Group 18351: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52242 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 52243 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 52244 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 52245 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18353: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52246 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52247 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 52248 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18354: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52249 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18355: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52250 / ListPaneMenuActionUnassignTote | Unassign / UNASSIGN | 150 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=UNASSIGN |

### Part 4464: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18356 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18356; default=None |
| 18357 / SearchPaneBasicCriteria | 18356 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18356; default=None |
| 18358 / SearchPaneAdvancedCriteria | 18356 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=18356; default=None |

#### Group 18357: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52251 / BasicCriteriaToteId | Tote ID / TOTEID | 10 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52252 / BasicCriteriaShipmentId | Not populated / shipmentId | 10 / 4040 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52253 / BasicCriteriaContainerId | Not populated / containerId | 10 / 4050 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52254 / BasicCriteriaCondition | Condition / CONDITION | 280 / 4060 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52255 / BasicCriteriaUserAssigned | User Assigned / USERASSIGNED | 80 / 5000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52256 / BasicCriteriaMarkForSorting | Mark for Sorting / MARKFORSORTING | 80 / 6100 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52257 / BasicCriteriaPutwalLocation | Putwall Location / WMPUTWALL | 10 / 6200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52258 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 26000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52259 / IncludeSortCompleted | Include Sorted / INCLUDESORTED | 130 / 26300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52260 / IncludeNotEligible | Include Not Eligible / INCLUDENOTELIGIBLE | 130 / 26500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18358: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52261 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4465: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18359 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18359; default=None |

#### Group 18359: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52262 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 52262 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18782 / Not populated | OBJECT_ID / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18771 / TOTE_ID | Not populated / Tote ID / TOTEID | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18773 / TOTE_CONDITION | Not populated / Condition / CONDITION | 10 / 10 / 1100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18774 / USER_ASSIGNED | Not populated / Assigned User / ASSIGNEDUSER | 10 / 10 / 1150 / 250 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18775 / MARK_FOR_SORTING | Not populated / Mark for Sorting / MARKFORSORTING | 40 / 10 / 1200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18776 / PROCESS_STAMP | Not populated / Process Stamp / PROCESSSTAMP | 10 / 10 / 1400 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18777 / DATE_TIME_STAMP | Not populated / Date Time Stamp / DATETIMESTAMP | 30 / 10 / 1500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18778 / Warehouse | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 1750 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18779 / OBJECT_ID | OBJECT_ID / Not populated / objectid | 20 / 10 / 1800 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18780 / ICON | Not populated / Icon / ICON | 10 / 10 / 1900 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18781 / COLOR | Not populated / Color / COLOR | 10 / 10 / 2000 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18772 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 2010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4466: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18360 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18360; default=None |
| 18361 / indicatorpane | Not populated | Not populated / Not populated | 60 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18361; default=None |

#### Group 18360: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52263 / DetailPaneHeaderToteId | Not populated / Not populated | 30 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=609; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52264 / DetailPaneHeaderCondition | Not populated / Not populated | 30 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=609; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18361: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52265 / ToteInsightIndicatorTileLines | Details / DETAILS | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 26 control attributes, 17 events, and 30 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 41383 | 52236 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 41384 | 52236 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 41385 | 52245 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41386 | 52246 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41387 | 52250 / ListPaneMenuActionUnassignTote | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41388 | 52251 / BasicCriteriaToteId | data-dbcolumn | Y / Y / N | 14 / 0 |
| 41389 | 52252 / BasicCriteriaShipmentId | data-dbcolumn | Y / Y / N | 22 / 0 |
| 41390 | 52252 / BasicCriteriaShipmentId | Lookup | Y / Y / N | 88 / 1 |
| 41391 | 52253 / BasicCriteriaContainerId | data-dbcolumn | Y / Y / N | 118 / 0 |
| 41392 | 52253 / BasicCriteriaContainerId | Lookup | Y / Y / N | 90 / 1 |
| 41393 | 52254 / BasicCriteriaCondition | data-dbcolumn | Y / Y / N | 28 / 0 |
| 41394 | 52255 / BasicCriteriaUserAssigned | data-dbcolumn | Y / Y / N | 26 / 0 |
| 41395 | 52256 / BasicCriteriaMarkForSorting | data-dbcolumn | Y / Y / N | 32 / 0 |
| 41396 | 52257 / BasicCriteriaPutwalLocation | data-dbcolumn | Y / Y / N | 34 / 0 |
| 41397 | 52258 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 41398 | 52258 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41399 | 52259 / IncludeSortCompleted | data-dbcolumn | Y / Y / N | 12 / 0 |
| 41400 | 52259 / IncludeSortCompleted | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41401 | 52259 / IncludeSortCompleted | data-negativeCondition | Y / Y / N | 10 / 0 |
| 41402 | 52260 / IncludeNotEligible | data-dbcolumn | Y / Y / N | 24 / 0 |
| 41403 | 52260 / IncludeNotEligible | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41404 | 52260 / IncludeNotEligible | data-negativeCondition | Y / Y / N | 10 / 0 |
| 41405 | 52262 / ListPaneDataGrid | data-dbtable | Y / Y / N | 52 / 0 |
| 41406 | 52262 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 41407 | 52262 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 41408 | 52265 / ToteInsightIndicatorTileLines | data-indicatorTileGoToInsight | Y / Y / Y | 256 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18380 / click | 52237 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18381 / click | 52238 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18382 / click | 52240 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18383 / click | 52241 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18384 / click | 52242 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18385 / click | 52243 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18386 / click | 52244 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18387 / click | 52245 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18388 / click | 52246 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18389 / click | 52247 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18390 / click | 52248 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18391 / click | 52249 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18392 / click | 52250 / ListPaneMenuActionUnassignTote | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18393 / iggridrequesterror | 52262 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18394 / iggriddatabound | 52262 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18395 / iggridselectionrowselectionchanged | 52262 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18396 / iggridselectionactiverowchanged | 52262 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 27237 / 18380 | GETServiceURL | Y / Y | 76 |
| 27238 / 18380 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 27239 / 18380 | queryParameter_Function_UserName | Y / Y | 44 |
| 27240 / 18380 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27241 / 18380 | POSTServiceURL | Y / Y | 74 |
| 27242 / 18380 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 27243 / 18380 | PostData_Function_UserName | Y / Y | 44 |
| 27244 / 18380 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27245 / 18380 | PostData_Function_SearchValue | Y / Y | 98 |
| 27246 / 18380 | Post_SuccessCallback | Y / Y | 114 |
| 27247 / 18380 | ModalDialogName | Y / Y | 42 |
| 27248 / 18381 | ModalDialogName | Y / Y | 42 |
| 27249 / 18382 | POSTServiceURL | Y / Y | 144 |
| 27250 / 18382 | Form_Id | Y / Y | 8 |
| 27251 / 18382 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 27252 / 18382 | PostData_Function_SearchValue | Y / Y | 98 |
| 27253 / 18382 | Post_SuccessCallback | Y / Y | 114 |
| 27254 / 18382 | ModalDialogName | Y / Y | 56 |
| 27255 / 18383 | ModalDialogName | Y / Y | 56 |
| 27256 / 18387 | ModalDialogName | Y / Y | 42 |
| 27257 / 18388 | ModalDialogName | Y / Y | 56 |
| 27258 / 18392 | ConfirmationMessageCode | Y / Y | 36 |
| 27259 / 18392 | POSTServiceURL | Y / Y | 90 |
| 27260 / 18392 | PostData_Grid_ListPaneDataGrid_ObjectId | Y / Y | 18 |
| 27261 / 18392 | PostData_Grid_ListPaneDataGrid_Warehouse | Y / Y | 18 |
| 27262 / 18392 | Post_SuccessCallback | Y / Y | 140 |
| 27263 / 18396 | POSTServiceURL | Y / Y | 74 |
| 27264 / 18396 | PostData_objectid | Y / Y | 18 |
| 27265 / 18396 | PostData_storedProcedure | Y / Y | 48 |
| 27266 / 18396 | EnableAction_ListPaneMenuActionUnassignTote | Y / Y | 198 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 26 selected candidate rows for this Screen: **25 accepted tokens** and **1 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 41385 | 52245 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41386 | 52246 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41387 | 52250 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41388 | 52251 / Not applicable | data-dbcolumn | database_identifier | TOTE_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41389 | 52252 / Not applicable | data-dbcolumn | database_identifier | Shipment_Id | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41393 | 52254 / Not applicable | data-dbcolumn | database_identifier | TOTE_CONDITION | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41394 | 52255 / Not applicable | data-dbcolumn | database_identifier | User_Assigned | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41395 | 52256 / Not applicable | data-dbcolumn | database_identifier | MARK_FOR_SORTING | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41396 | 52257 / Not applicable | data-dbcolumn | database_identifier | PUT_WALL_LOCATION | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41398 | 52258 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41399 | 52259 / Not applicable | data-dbcolumn | database_identifier | SORTED | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41402 | 52260 / Not applicable | data-dbcolumn | database_identifier | NOT_ELIGIBLE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41405 | 52262 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_TOTE_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27237 | 52237 / 18380 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27241 | 52237 / 18380 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27246 | 52237 / 18380 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27249 | 52240 / 18382 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27253 | 52240 / 18382 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27258 | 52250 / 18392 | ConfirmationMessageCode | resource_code | MSG_TOTEUNASSIGN02 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27259 | 52250 / 18392 | POSTServiceURL | relative_api_path | /outbound/scaleapi/putwallApi/Tote-Unassigned | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27260 | 52250 / 18392 | PostData_Grid_ListPaneDataGrid_ObjectId | grid_field_identifier | OBJECT_ID | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27261 | 52250 / 18392 | PostData_Grid_ListPaneDataGrid_Warehouse | grid_field_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27262 | 52250 / 18392 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27263 | 52262 / 18396 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27265 | 52262 / 18396 | PostData_storedProcedure | stored_procedure_identifier | TH_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
