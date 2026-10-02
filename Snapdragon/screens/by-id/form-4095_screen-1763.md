# DIF Outgoing Message Insight — Form 4095, Screen 1763

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4095 |
| MAIN_UI_SCREEN Object ID | 1763 |
| Label / Form resource key | DIF Outgoing Message Insight / MNU_DIFOUTGOINGMESSAGEINSIGHT |
| Functional area code | 120 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/4095 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/4095 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4095 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_DIF_OUTGOING_MESSAGE |
| Help page reference | DIF_outgoing_Insight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4095 |
| Inspection time (UTC) | 2026-10-02T15:30:18.148Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_DIFOUTGOINGMESSAGEINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_DIF_OUTGOING_MESSAGE |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1763 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:13:44.996Z | loaded; runtime_inspection | https://trav.manhscale.com/scale/insights/4095; DIF Outgoing Message Insight | [runtime-root.json](../../evidence/runtime-root.json) |

**Visible criteria / entry fields:** From Date Stamp; To Date Stamp; Status; Data; Endpoint Description; Event Description; Message ID; Error Message.

**Visible grid headers:** Field; Operand; Value; Message ID; Status; Error Message; Data; Endpoint Description; Event Description; Date Time Stamp; Endpoint ID; Event ID; Icon; Color.

**Observed action/menu labels:** Actions; Reset.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

DIF Outgoing Message Insight is recorded as `insight`. Its saved configuration contains 6 parts, 19 groups, 26 controls, and 12 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4292 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4293 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4294 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4295 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4296 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4297 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4292: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17761 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17761; default=None |
| 17762 / SaveSearchModalDialogHeader | 17761 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17761; default=None |
| 17763 / SaveSearchModalDialogBody | 17761 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17761; default=None |
| 17764 / SaveSearchModalDialogFooter | 17761 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17761; default=None |

#### Group 17763: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51080 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17764: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51081 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51082 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4293: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17765 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17765; default=None |
| 17766 / GadgetCalculationQueryDialogHeader | 17765 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17765; default=None |
| 17767 / GadgetCalculationQueryDialogBody | 17765 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17765; default=None |
| 17768 / GadgetCalculationQueryDialogFooter | 17765 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17765; default=None |

#### Group 17767: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51083 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17768: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51084 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51085 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4294: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17769 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17769; default=None |
| 17770 / InsightMenuPanel | 17769 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=17769; default=None |
| 17771 / InsightMenuFavoritesDropdown | 17769 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=17769; default=None |
| 17772 / InsightListPaneMenuPanel | 17769 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17769; default=None |
| 17773 / MenuExportToExcelPanel | 17769 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=17769; default=None |
| 17774 / InsightMenuActionsDropdown | 17769 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=17769; default=None |

#### Group 17770: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51086 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51087 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51088 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51089 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17772: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51090 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51091 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51092 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 17773: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51093 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 17774: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51094 / ListPaneMenuActionReset | Reset / RESETDIFOUTGOINGMESSAGE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=RESETDIFOUTGOINGMESSAGE |

### Part 4295: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17775 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17775; default=None |
| 17776 / SearchPaneBasicCriteria | 17775 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=17775; default=None |
| 17777 / SearchPaneAdvancedCriteria | 17775 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=17775; default=None |

#### Group 17776: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51095 / BasicCriteriaDateTimeStamp | Date Time Stamp / DATETIMESTAMP | 190 / 100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51096 / BasicCriteriaStatus | Status / STATUSDESCRIPTION | 80 / 200 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51097 / BasicCriteriaData | Data / DATA | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51098 / BasicCriteriaEndpointId | Endpoint Description / ENDPOINTDESC | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51099 / BasicCriteriaEventId | Event Description / EVENTDESC | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51100 / BasicCriteriaMessageId | Message ID / MSGID | 90 / 600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51101 / BasicCriteriaErrorMessage | Error Message / ERRORMESSAGE | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17777: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51102 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4296: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17778 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17778; default=None |

#### Group 17778: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51103 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51103 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18167 / MSG_ID | MSG_ID / Message ID / MSGID | 20 / 10 / 200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18170 / STATUS | STATUS / Status / STATUS | 10 / 10 / 300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18171 / ERROR_MESSAGE | ERROR_MESSAGE / Error Message / ERRORMESSAGE | 10 / 10 / 400 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18172 / DATA | DATA / Data / DATA | 10 / 10 / 500 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18168 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 510 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18173 / ENDPOINT_DESC | ENDPOINT_DESC / Endpoint Description / ENDPOINTDESC | 10 / 10 / 600 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18174 / EVENT_DESC | EVENT_DESC / Event Description / EVENTDESC | 10 / 10 / 700 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18175 / DATE_TIME_STAMP | DATE_TIME_STAMP / Date Time Stamp / DATETIMESTAMP | 30 / 10 / 800 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18176 / ENDPOINT_ID | ENDPOINT_ID / Endpoint ID / ENDPOINTID | 20 / 10 / 900 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18177 / EVENT_ID | EVENT_ID / Event ID / EVENTID | 20 / 10 / 1000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18166 / ICON | Not populated / Icon / ICON | 10 / 10 / 99800 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18169 / COLOR | Not populated / Color / COLOR | 10 / 10 / 99900 / 1 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4297: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17779 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17779; default=None |

#### Group 17779: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51104 / DetailPaneHeaderMsgID | Not populated / Not populated | 30 / 100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=581; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51105 / DetailPaneHeaderStatus | Not populated / Not populated | 30 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=581; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 21 control attributes, 17 events, and 29 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40230 | 51080 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40231 | 51080 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40232 | 51089 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40233 | 51090 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40234 | 51094 / ListPaneMenuActionReset | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40235 | 51094 / ListPaneMenuActionReset | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40236 | 51095 / BasicCriteriaDateTimeStamp | data-dbcolumn | Y / Y / N | 30 / 0 |
| 40237 | 51095 / BasicCriteriaDateTimeStamp | allowTodayOnlySelection | Y / Y / Y | 8 / 0 |
| 40238 | 51096 / BasicCriteriaStatus | data-dbcolumn | Y / Y / N | 12 / 0 |
| 40239 | 51097 / BasicCriteriaData | data-dbcolumn | Y / Y / N | 8 / 0 |
| 40240 | 51098 / BasicCriteriaEndpointId | data-dbcolumn | Y / Y / N | 26 / 0 |
| 40241 | 51099 / BasicCriteriaEventId | data-dbcolumn | Y / Y / N | 20 / 0 |
| 40242 | 51100 / BasicCriteriaMessageId | data-dbcolumn | Y / Y / N | 12 / 0 |
| 40243 | 51100 / BasicCriteriaMessageId | nullable | Y / Y / Y | 8 / 0 |
| 40244 | 51101 / BasicCriteriaErrorMessage | data-dbcolumn | Y / Y / N | 26 / 0 |
| 40245 | 51103 / ListPaneDataGrid | data-dbtable | Y / Y / N | 74 / 0 |
| 40246 | 51103 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 12 / 0 |
| 40247 | 51103 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 16 / 0 |
| 40248 | 51103 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 22 / 0 |
| 40249 | 51103 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 40250 | 51103 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17724 / click | 51081 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 17725 / click | 51082 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17726 / click | 51084 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 17727 / click | 51085 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17728 / click | 51086 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 17729 / click | 51087 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 17730 / click | 51088 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 17731 / click | 51089 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17732 / click | 51090 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17733 / click | 51091 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 17734 / click | 51092 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 17735 / click | 51093 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 17736 / click | 51094 / ListPaneMenuActionReset | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 17737 / iggridrequesterror | 51103 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 17738 / iggriddatabound | 51103 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 17739 / iggridselectionrowselectionchanged | 51103 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 17740 / iggridselectionactiverowchanged | 51103 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 25861 / 17724 | GETServiceURL | Y / Y | 76 |
| 25862 / 17724 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 25863 / 17724 | queryParameter_Function_UserName | Y / Y | 44 |
| 25864 / 17724 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25865 / 17724 | POSTServiceURL | Y / Y | 74 |
| 25866 / 17724 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 25867 / 17724 | PostData_Function_UserName | Y / Y | 44 |
| 25868 / 17724 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25869 / 17724 | PostData_Function_SearchValue | Y / Y | 98 |
| 25870 / 17724 | Post_SuccessCallback | Y / Y | 114 |
| 25871 / 17724 | ModalDialogName | Y / Y | 42 |
| 25872 / 17725 | ModalDialogName | Y / Y | 42 |
| 25873 / 17726 | POSTServiceURL | Y / Y | 144 |
| 25874 / 17726 | Form_Id | Y / Y | 8 |
| 25875 / 17726 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 25876 / 17726 | PostData_Function_SearchValue | Y / Y | 98 |
| 25877 / 17726 | Post_SuccessCallback | Y / Y | 114 |
| 25878 / 17726 | ModalDialogName | Y / Y | 56 |
| 25879 / 17727 | ModalDialogName | Y / Y | 56 |
| 25880 / 17731 | ModalDialogName | Y / Y | 42 |
| 25881 / 17732 | ModalDialogName | Y / Y | 56 |
| 25882 / 17736 | ConfirmationMessageCode | Y / Y | 32 |
| 25883 / 17736 | POSTServiceURL | Y / Y | 126 |
| 25884 / 17736 | PostData_Grid_ListPaneDataGrid_MsgId | Y / Y | 12 |
| 25885 / 17736 | Post_SuccessCallback | Y / Y | 140 |
| 25886 / 17740 | POSTServiceURL | Y / Y | 74 |
| 25887 / 17740 | PostData_msgID | Y / Y | 12 |
| 25888 / 17740 | PostData_storedProcedure | Y / Y | 50 |
| 25889 / 17740 | EnableAction_ListPaneMenuActionReset | Y / Y | 116 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 22 selected candidate rows for this Screen: **22 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40232 | 51089 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40233 | 51090 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40235 | 51094 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40236 | 51095 / Not applicable | data-dbcolumn | database_identifier | DATE_TIME_STAMP | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40238 | 51096 / Not applicable | data-dbcolumn | database_identifier | STATUS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40239 | 51097 / Not applicable | data-dbcolumn | database_identifier | DATA | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40240 | 51098 / Not applicable | data-dbcolumn | database_identifier | ENDPOINT_DESC | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40241 | 51099 / Not applicable | data-dbcolumn | database_identifier | EVENT_DESC | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40242 | 51100 / Not applicable | data-dbcolumn | database_identifier | MSG_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40244 | 51101 / Not applicable | data-dbcolumn | database_identifier | ERROR_MESSAGE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40245 | 51103 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_DIF_OUTGOING_MESSAGE | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25861 | 51081 / 17724 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25865 | 51081 / 17724 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25870 | 51081 / 17724 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25873 | 51084 / 17726 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25877 | 51084 / 17726 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25882 | 51094 / 17736 | ConfirmationMessageCode | resource_code | MSG_DIFMESSAGE02 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25883 | 51094 / 17736 | POSTServiceURL | relative_api_path | /general/scaleapi/DIFMessageHandlerApi/DIFOutgoingMessage-Reset | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25884 | 51094 / 17736 | PostData_Grid_ListPaneDataGrid_MsgId | grid_field_identifier | MSG_ID | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25885 | 51094 / 17736 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25886 | 51103 / 17740 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25888 | 51103 / 17740 | PostData_storedProcedure | stored_procedure_identifier | DOM_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
