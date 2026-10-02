# DIF Incoming Message Insight — Form 4094, Screen 1762

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4094 |
| MAIN_UI_SCREEN Object ID | 1762 |
| Label / Form resource key | DIF Incoming Message Insight / MNU_DIFINCOMINGMESSAGEINSIGHT |
| Functional area code | 120 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/4094 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/4094 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4094 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_DIF_INCOMING_MESSAGE |
| Help page reference | DIF_Incoming_Insight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4094 |
| Inspection time (UTC) | 2026-10-02T15:30:16.088Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_DIFINCOMINGMESSAGEINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_DIF_INCOMING_MESSAGE |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1762 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:13:40.787Z | loaded; runtime_inspection | https://trav.manhscale.com/scale/insights/4094; DIF Incoming Message Insight | [runtime-root.json](../../evidence/runtime-root.json) |

**Visible criteria / entry fields:** From Date Stamp; To Date Stamp; Status; Data; Endpoint Description; Event Description; Message ID; Error Message.

**Visible grid headers:** Field; Operand; Value; Message ID; Status; Error Message; Data; Endpoint Description; Event Description; Date Time Stamp; Inserted Date Time; Process Start Date Time; Process End Date Time; Endpoint ID; Event ID; Icon; Color.

**Observed action/menu labels:** Actions; Reset.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

DIF Incoming Message Insight is recorded as `insight`. Its saved configuration contains 6 parts, 19 groups, 26 controls, and 15 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4286 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4287 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4288 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4289 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4290 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4291 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4286: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17742 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17742; default=None |
| 17743 / SaveSearchModalDialogHeader | 17742 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17742; default=None |
| 17744 / SaveSearchModalDialogBody | 17742 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17742; default=None |
| 17745 / SaveSearchModalDialogFooter | 17742 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17742; default=None |

#### Group 17744: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51054 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17745: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51055 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51056 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4287: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17746 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17746; default=None |
| 17747 / GadgetCalculationQueryDialogHeader | 17746 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17746; default=None |
| 17748 / GadgetCalculationQueryDialogBody | 17746 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17746; default=None |
| 17749 / GadgetCalculationQueryDialogFooter | 17746 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17746; default=None |

#### Group 17748: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51057 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17749: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51058 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51059 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4288: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17750 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17750; default=None |
| 17751 / InsightMenuPanel | 17750 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=17750; default=None |
| 17752 / InsightMenuFavoritesDropdown | 17750 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=17750; default=None |
| 17753 / InsightListPaneMenuPanel | 17750 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17750; default=None |
| 17754 / MenuExportToExcelPanel | 17750 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=17750; default=None |
| 17755 / InsightMenuActionsDropdown | 17750 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=17750; default=None |

#### Group 17751: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51060 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51061 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51062 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51063 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17753: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51064 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51065 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51066 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 17754: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51067 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 17755: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51068 / ListPaneMenuActionReset | Reset / RESETDIFINCOMINGMESSAGE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=RESETDIFINCOMINGMESSAGE |

### Part 4289: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17756 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17756; default=None |
| 17757 / SearchPaneBasicCriteria | 17756 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=17756; default=None |
| 17758 / SearchPaneAdvancedCriteria | 17756 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=17756; default=None |

#### Group 17757: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51069 / BasicCriteriaDateTimeStamp | Date Time Stamp / DATETIMESTAMP | 190 / 100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51070 / BasicCriteriaStatus | Status / STATUSDESCRIPTION | 80 / 200 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51071 / BasicCriteriaData | Data / DATA | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51072 / BasicCriteriaEndpointId | Endpoint Description / ENDPOINTDESC | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51073 / BasicCriteriaEventId | Event Description / EVENTDESC | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51074 / BasicCriteriaMessageId | Message ID / MSGID | 90 / 600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51075 / BasicCriteriaErrorMessage | Error Message / ERRORMESSAGE | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17758: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51076 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4290: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17759 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17759; default=None |

#### Group 17759: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51077 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51077 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18152 / MSG_ID | MSG_ID / Message ID / MSGID | 20 / 10 / 200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18155 / STATUS | STATUS / Status / STATUS | 10 / 10 / 300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18156 / ERROR_MESSAGE | ERROR_MESSAGE / Error Message / ERRORMESSAGE | 10 / 10 / 400 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18157 / DATA | DATA / Data / DATA | 10 / 10 / 500 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18153 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 510 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18158 / ENDPOINT_DESC | ENDPOINT_DESC / Endpoint Description / ENDPOINTDESC | 10 / 10 / 600 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18159 / EVENT_DESC | EVENT_DESC / Event Description / EVENTDESC | 10 / 10 / 700 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18160 / DATE_TIME_STAMP | DATE_TIME_STAMP / Date Time Stamp / DATETIMESTAMP | 30 / 10 / 800 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18161 / INSERTED_DATE_TIME | INSERTED_DATE_TIME / Inserted Date Time / INSERTEDDATETIME | 30 / 10 / 900 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18162 / PROCESS_START_DATE_TIME | PROCESS_START_DATE_TIME / Process Start Date Time / PROCESSSTARTDATETIME | 30 / 10 / 1000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18163 / PROCESS_END_DATE_TIME | PROCESS_END_DATE_TIME / Process End Date Time / PROCESSENDDATETIME | 30 / 10 / 1100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18164 / ENDPOINT_ID | ENDPOINT_ID / Endpoint ID / ENDPOINTID | 20 / 10 / 1200 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18165 / EVENT_ID | EVENT_ID / Event ID / EVENTID | 20 / 10 / 1300 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18151 / ICON | Not populated / Icon / ICON | 10 / 10 / 99800 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18154 / COLOR | Not populated / Color / COLOR | 10 / 10 / 99900 / 1 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4291: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17760 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17760; default=None |

#### Group 17760: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51078 / DetailPaneHeaderMsgID | Not populated / Not populated | 30 / 100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=580; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51079 / DetailPaneHeaderStatus | Not populated / Not populated | 30 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=580; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 21 control attributes, 17 events, and 29 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40209 | 51054 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40210 | 51054 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40211 | 51063 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40212 | 51064 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40213 | 51068 / ListPaneMenuActionReset | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40214 | 51068 / ListPaneMenuActionReset | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40215 | 51069 / BasicCriteriaDateTimeStamp | data-dbcolumn | Y / Y / N | 30 / 0 |
| 40216 | 51069 / BasicCriteriaDateTimeStamp | allowTodayOnlySelection | Y / Y / Y | 8 / 0 |
| 40217 | 51070 / BasicCriteriaStatus | data-dbcolumn | Y / Y / N | 12 / 0 |
| 40218 | 51071 / BasicCriteriaData | data-dbcolumn | Y / Y / N | 8 / 0 |
| 40219 | 51072 / BasicCriteriaEndpointId | data-dbcolumn | Y / Y / N | 26 / 0 |
| 40220 | 51073 / BasicCriteriaEventId | data-dbcolumn | Y / Y / N | 20 / 0 |
| 40221 | 51074 / BasicCriteriaMessageId | data-dbcolumn | Y / Y / N | 12 / 0 |
| 40222 | 51074 / BasicCriteriaMessageId | nullable | Y / Y / Y | 8 / 0 |
| 40223 | 51075 / BasicCriteriaErrorMessage | data-dbcolumn | Y / Y / N | 26 / 0 |
| 40224 | 51077 / ListPaneDataGrid | data-dbtable | Y / Y / N | 74 / 0 |
| 40225 | 51077 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 12 / 0 |
| 40226 | 51077 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 16 / 0 |
| 40227 | 51077 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 22 / 0 |
| 40228 | 51077 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 40229 | 51077 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17707 / click | 51055 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 17708 / click | 51056 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17709 / click | 51058 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 17710 / click | 51059 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17711 / click | 51060 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 17712 / click | 51061 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 17713 / click | 51062 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 17714 / click | 51063 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17715 / click | 51064 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17716 / click | 51065 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 17717 / click | 51066 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 17718 / click | 51067 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 17719 / click | 51068 / ListPaneMenuActionReset | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 17720 / iggridrequesterror | 51077 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 17721 / iggriddatabound | 51077 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 17722 / iggridselectionrowselectionchanged | 51077 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 17723 / iggridselectionactiverowchanged | 51077 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 25832 / 17707 | GETServiceURL | Y / Y | 76 |
| 25833 / 17707 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 25834 / 17707 | queryParameter_Function_UserName | Y / Y | 44 |
| 25835 / 17707 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25836 / 17707 | POSTServiceURL | Y / Y | 74 |
| 25837 / 17707 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 25838 / 17707 | PostData_Function_UserName | Y / Y | 44 |
| 25839 / 17707 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25840 / 17707 | PostData_Function_SearchValue | Y / Y | 98 |
| 25841 / 17707 | Post_SuccessCallback | Y / Y | 114 |
| 25842 / 17707 | ModalDialogName | Y / Y | 42 |
| 25843 / 17708 | ModalDialogName | Y / Y | 42 |
| 25844 / 17709 | POSTServiceURL | Y / Y | 144 |
| 25845 / 17709 | Form_Id | Y / Y | 8 |
| 25846 / 17709 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 25847 / 17709 | PostData_Function_SearchValue | Y / Y | 98 |
| 25848 / 17709 | Post_SuccessCallback | Y / Y | 114 |
| 25849 / 17709 | ModalDialogName | Y / Y | 56 |
| 25850 / 17710 | ModalDialogName | Y / Y | 56 |
| 25851 / 17714 | ModalDialogName | Y / Y | 42 |
| 25852 / 17715 | ModalDialogName | Y / Y | 56 |
| 25853 / 17719 | ConfirmationMessageCode | Y / Y | 32 |
| 25854 / 17719 | POSTServiceURL | Y / Y | 126 |
| 25855 / 17719 | PostData_Grid_ListPaneDataGrid_MsgId | Y / Y | 12 |
| 25856 / 17719 | Post_SuccessCallback | Y / Y | 140 |
| 25857 / 17723 | POSTServiceURL | Y / Y | 74 |
| 25858 / 17723 | PostData_msgID | Y / Y | 12 |
| 25859 / 17723 | PostData_storedProcedure | Y / Y | 50 |
| 25860 / 17723 | EnableAction_ListPaneMenuActionReset | Y / Y | 116 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 22 selected candidate rows for this Screen: **22 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40211 | 51063 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40212 | 51064 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40214 | 51068 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40215 | 51069 / Not applicable | data-dbcolumn | database_identifier | DATE_TIME_STAMP | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40217 | 51070 / Not applicable | data-dbcolumn | database_identifier | STATUS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40218 | 51071 / Not applicable | data-dbcolumn | database_identifier | DATA | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40219 | 51072 / Not applicable | data-dbcolumn | database_identifier | ENDPOINT_DESC | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40220 | 51073 / Not applicable | data-dbcolumn | database_identifier | EVENT_DESC | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40221 | 51074 / Not applicable | data-dbcolumn | database_identifier | MSG_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40223 | 51075 / Not applicable | data-dbcolumn | database_identifier | ERROR_MESSAGE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40224 | 51077 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_DIF_INCOMING_MESSAGE | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25832 | 51055 / 17707 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25836 | 51055 / 17707 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25841 | 51055 / 17707 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25844 | 51058 / 17709 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25848 | 51058 / 17709 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25853 | 51068 / 17719 | ConfirmationMessageCode | resource_code | MSG_DIFMESSAGE02 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25854 | 51068 / 17719 | POSTServiceURL | relative_api_path | /general/scaleapi/DIFMessageHandlerApi/DIFIncomingMessage-Reset | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25855 | 51068 / 17719 | PostData_Grid_ListPaneDataGrid_MsgId | grid_field_identifier | MSG_ID | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25856 | 51068 / 17719 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25857 | 51077 / 17723 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25859 | 51077 / 17723 | PostData_storedProcedure | stored_procedure_identifier | DIM_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
