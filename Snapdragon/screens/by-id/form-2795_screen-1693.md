# Background Job Queue Insight — Form 2795, Screen 1693

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2795 |
| MAIN_UI_SCREEN Object ID | 1693 |
| Label / Form resource key | Background Job Queue Insight / MNU_BACKJOBINSIGHT |
| Functional area code | 120 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2795 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2795 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2795 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_BACK_JOB_VIEW |
| Help page reference | backgrndJobQueueInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2795 |
| Inspection time (UTC) | 2026-10-02T15:24:37.047Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_BACKJOBINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_BACK_JOB_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1693 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:13:36.028Z | loaded; runtime_inspection | https://trav.manhscale.com/scale/insights/2795; Background Job Queue Insight | [runtime-root.json](../../evidence/runtime-root.json) |

**Visible criteria / entry fields:** From Request Date Time; To Request Date Time; Process Type; Process Status.

**Visible grid headers:** Field; Operand; Value; Request Date Time; Process Type; Process Status; Color; Internal Request Number; Icon.

**Observed action/menu labels:** Actions; Reset.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Background Job Queue Insight is recorded as `insight`. Its saved configuration contains 5 parts, 15 groups, 18 controls, and 8 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3927 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 3928 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 3929 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 3930 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 3931 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 3927: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16521 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=16521; default=None |
| 16522 / SaveSearchModalDialogHeader | 16521 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=16521; default=None |
| 16523 / SaveSearchModalDialogBody | 16521 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=16521; default=None |
| 16524 / SaveSearchModalDialogFooter | 16521 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=16521; default=None |

#### Group 16523: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48671 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16524: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48672 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 48673 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3928: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16525 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=16525; default=None |
| 16526 / InsightMenuPanel | 16525 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=16525; default=None |
| 16527 / InsightMenuFavoritesDropdown | 16525 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=16525; default=None |
| 16528 / InsightListPaneMenuPanel | 16525 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=16525; default=None |
| 16529 / MenuExportToExcelPanel | 16525 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=16525; default=None |
| 16530 / InsightMenuActionsDropdown | 16525 | Actions / ACTIONS | 80 / 12600 | Y / Y | Fixed to top=N; loading=0; nested unit=16525; default=None |

#### Group 16526: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48674 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 48675 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 48676 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 48677 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16528: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48678 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 48679 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 16529: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48680 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 16530: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48681 / ListPaneMenuActionResetRequest | Reset / RESET | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=RESET |

### Part 3929: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16531 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=16531; default=None |
| 16532 / SearchPaneBasicCriteria | 16531 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=16531; default=None |
| 16533 / SearchPaneAdvancedCriteria | 16531 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=16531; default=None |

#### Group 16532: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48682 / BasicCriteriaRequestDateTimeRange | Request Date Time / REQUESTDATETIME | 190 / 100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 48683 / BasicCriteriaProcessType | Process Type / QUEUEPROCESSTYPE | 80 / 200 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 48684 / BasicCriteriaStatus | Process Status / QUEUEPROCESSSTATUS | 80 / 300 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16533: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48685 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 3930: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16534 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=16534; default=None |

#### Group 16534: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48686 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 48686 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16948 / Not populated | INTERNAL_REQ_NUM / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16943 / RequestDateTime | Not populated / Request Date Time / REQUESTDATETIME | 30 / 10 / 100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16944 / ProcessType | Not populated / Process Type / QUEUEPROCESSTYPE | 10 / 10 / 200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16945 / ProcessStatus | Not populated / Process Status / QUEUEPROCESSSTATUS | 10 / 10 / 300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16941 / COLOR | Not populated / Color / COLOR | 10 / 10 / 350 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16946 / InternalReqNum | INTERNAL_REQ_NUM / Internal Request Number / INTERNALREQUESTNUMBER | 10 / 10 / 400 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16947 / ICON | Not populated / Icon / ICON | 10 / 10 / 500 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16942 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 510 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 3931: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16535 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=16535; default=None |

#### Group 16535: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48687 / DetailPaneHeaderProcessType | Not populated / Not populated | 30 / 100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=526; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 48688 / DetailPaneHeaderStatus | Not populated / Not populated | 30 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=526; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 13 control attributes, 14 events, and 21 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 37916 | 48671 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 37917 | 48671 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 37918 | 48677 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 37919 | 48681 / ListPaneMenuActionResetRequest | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 37920 | 48681 / ListPaneMenuActionResetRequest | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 37921 | 48682 / BasicCriteriaRequestDateTimeRange | data-dbcolumn | Y / Y / N | 30 / 0 |
| 37922 | 48682 / BasicCriteriaRequestDateTimeRange | allowTodayOnlySelection | Y / Y / Y | 8 / 0 |
| 37923 | 48683 / BasicCriteriaProcessType | data-dbcolumn | Y / Y / N | 32 / 0 |
| 37924 | 48684 / BasicCriteriaStatus | data-dbcolumn | Y / Y / N | 36 / 0 |
| 37925 | 48686 / ListPaneDataGrid | data-dbtable | Y / Y / N | 60 / 0 |
| 37926 | 48686 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 40 / 0 |
| 37927 | 48686 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 37928 | 48686 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16408 / click | 48672 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 16409 / click | 48673 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 16410 / click | 48674 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 16411 / click | 48675 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 16412 / click | 48676 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 16413 / click | 48677 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 16414 / click | 48678 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 16415 / click | 48679 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 16416 / click | 48680 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 16417 / click | 48681 / ListPaneMenuActionResetRequest | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 16418 / iggridrequesterror | 48686 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 16419 / iggriddatabound | 48686 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 16420 / iggridselectionrowselectionchanged | 48686 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 16421 / iggridselectionactiverowchanged | 48686 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 23202 / 16408 | GETServiceURL | Y / Y | 76 |
| 23203 / 16408 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 23204 / 16408 | queryParameter_Function_UserName | Y / Y | 44 |
| 23205 / 16408 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 23206 / 16408 | POSTServiceURL | Y / Y | 74 |
| 23207 / 16408 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 23208 / 16408 | PostData_Function_UserName | Y / Y | 44 |
| 23209 / 16408 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 23210 / 16408 | PostData_Function_SearchValue | Y / Y | 98 |
| 23211 / 16408 | Post_SuccessCallback | Y / Y | 114 |
| 23212 / 16408 | ModalDialogName | Y / Y | 42 |
| 23213 / 16409 | ModalDialogName | Y / Y | 42 |
| 23214 / 16413 | ModalDialogName | Y / Y | 42 |
| 23215 / 16417 | ConfirmationMessageCode | Y / Y | 28 |
| 23216 / 16417 | POSTServiceURL | Y / Y | 138 |
| 23217 / 16417 | PostData_Grid_ListPaneDataGrid_InternalReqNum | Y / Y | 28 |
| 23218 / 16417 | Post_SuccessCallback | Y / Y | 140 |
| 23219 / 16421 | POSTServiceURL | Y / Y | 74 |
| 23220 / 16421 | PostData_internalReqNum | Y / Y | 28 |
| 23221 / 16421 | PostData_storedProcedure | Y / Y | 50 |
| 23222 / 16421 | EnableAction_ListPaneMenuActionResetRequest | Y / Y | 166 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 15 selected candidate rows for this Screen: **15 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 37918 | 48677 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37920 | 48681 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37921 | 48682 / Not applicable | data-dbcolumn | database_identifier | REQUESTDATETIME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37923 | 48683 / Not applicable | data-dbcolumn | database_identifier | QUEUEPROCESSTYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37924 | 48684 / Not applicable | data-dbcolumn | database_identifier | QUEUEPROCESSSTATUS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37925 | 48686 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_BACK_JOB_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23202 | 48672 / 16408 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23206 | 48672 / 16408 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23211 | 48672 / 16408 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23215 | 48681 / 16417 | ConfirmationMessageCode | resource_code | MSG_BKGRDJOB01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23216 | 48681 / 16417 | POSTServiceURL | relative_api_path | /general/scaleapi/QueueProcessRequestsApi/QueuedProcessRequests-Reset | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23217 | 48681 / 16417 | PostData_Grid_ListPaneDataGrid_InternalReqNum | grid_field_identifier | InternalReqNum | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23218 | 48681 / 16417 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23219 | 48686 / 16421 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23221 | 48686 / 16421 | PostData_storedProcedure | stored_procedure_identifier | BJQ_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
