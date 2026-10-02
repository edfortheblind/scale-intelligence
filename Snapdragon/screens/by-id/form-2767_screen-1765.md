# Immediate Needs Insight — Form 2767, Screen 1765

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2767 |
| MAIN_UI_SCREEN Object ID | 1765 |
| Label / Form resource key | Immediate Needs Insight / MNU_ImmediateNeedsInsight |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2767 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2767 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2767 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | IMMEDIATE_NEEDS_REQUEST |
| Help page reference | immNeedsInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2767 |
| Inspection time (UTC) | 2026-10-02T15:23:48.277Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_ImmediateNeedsInsight |
| Observed configured table/view | IMMEDIATE_NEEDS_REQUEST |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1765 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:13:19.745Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/insights/2767#search; Immediate Needs Insight | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

**Visible criteria / entry fields:** Request Type; Internal Request Number; Item; Company; Location; Reference ID; Internal Fulfillment Number; From Logged Date Time; To Logged Date Time; Warehouse.

**Visible grid headers:** Icon; Color; Internal Request Num; Priority; Reference ID; Item; Description; Company; To Location; License Plate.

**Observed action/menu labels:** Edit; Delete; Change Priority.

**Page groups:** Basic Criteria; Immediate Needs Type; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Immediate Needs Insight is recorded as `insight`. Its saved configuration contains 7 parts, 25 groups, 46 controls, and 21 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4304 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4305 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4306 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4307 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4308 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4309 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |
| 4310 / ChangePriorityModalDialog | Not populated / Not populated | 20 / 17500 | Y / Y / Y | ChangePrioritySaveButton |

### Part 4304: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17799 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17799; default=None |
| 17800 / SaveSearchModalDialogHeader | 17799 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17799; default=None |
| 17801 / SaveSearchModalDialogBody | 17799 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17799; default=None |
| 17802 / SaveSearchModalDialogFooter | 17799 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17799; default=None |

#### Group 17801: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51136 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17802: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51137 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51138 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4305: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17803 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17803; default=None |
| 17804 / GadgetCalculationQueryDialogHeader | 17803 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17803; default=None |
| 17805 / GadgetCalculationQueryDialogBody | 17803 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17803; default=None |
| 17806 / GadgetCalculationQueryDialogFooter | 17803 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17803; default=None |

#### Group 17805: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51139 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17806: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51140 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51141 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4306: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17807 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17807; default=None |
| 17808 / InsightMenuPanel | 17807 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=17807; default=None |
| 17809 / InsightMenuFavoritesDropdown | 17807 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=17807; default=None |
| 17810 / InsightListPaneMenuPanel | 17807 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17807; default=None |
| 17811 / MenuExportToExcelPanel | 17807 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=17807; default=None |
| 17812 / InsightMenuActionsDropdown | 17807 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=17807; default=None |

#### Group 17808: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51142 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51143 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51144 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51145 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17810: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51146 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51147 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 51148 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51149 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 17811: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51150 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 17812: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51151 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 51152 / ListPaneMenuActionView | View / VIEW | 150 / 1500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 51153 / ListPaneMenuActionDelete | Delete / DELETE | 150 / 2600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 51154 / ListPaneMenuActionChangePriority | Change Priority / CHANGEPRIORITY | 150 / 2700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CHANGEPRIORITY |

### Part 4307: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17813 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17813; default=None |
| 17814 / SearchPaneBasicCriteria | 17813 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=17813; default=None |
| 17815 / SearchPaneImmediateNeedsType | 17813 | Immediate Needs Type / IMMEDIATENEEDSTYPE | 50 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=17813; default=None |
| 17816 / SearchPaneAdvancedCriteria | 17813 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=17813; default=None |

#### Group 17814: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51155 / BasicCriteriaRequestType | Not populated / RequestType | 80 / 5000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51156 / BasicCriteriaInternalReqNumber | Not populated / InternalRequestNumber | 90 / 7500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51157 / BasicCriteriaItem | Not populated / Item | 10 / 10000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51164 / SearchPaneComp | Company / COMPANY | 280 / 11000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51158 / BasicCriteriaLocation | Not populated / Location | 10 / 12500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51159 / BasicCriteriaInternalReferenceId | Not populated / ReferenceId | 10 / 15000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51160 / BasicCriteriaInternalFulfillNumber | Not populated / InternalFulfillmentNumber | 90 / 17500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51161 / BasicCriteriaFromLoggedDateRange | Not populated / LoggedDateTimeRange | 190 / 20000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51163 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 21000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51162 / BasicCriteriaDisplayReqCurrFullfiled | Not populated / FulFillRequest | 130 / 22500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17815: SearchPaneImmediateNeedsType — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51165 / SearchPaneIncludeShipAllocRequests | Include Shipment Allocation Requests / INCLUDESHIPALLOCREQUESTS | 130 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51166 / SearchPaneIncludeShortPickRequests | Include Shipment Short Pick Requests / INCLUDESHORTPICKREQUESTS | 130 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51167 / SearchPaneIncludeWorkOrderRequests | Include Work Order Requests / INCLUDEWOREQUESTS | 130 / 7500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51168 / SearchPaneIncludeReplenishRequests | Include Replenishement Requests / INCLUDEREPLENISHREQUESTS | 130 / 10000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17816: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51169 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4308: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17817 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17817; default=None |
| 17818 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17818; default=None |

#### Group 17817: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51170 / ListPaneSummaryNeeds | Needs / NEEDS | 50 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51171 / ListPaneSummaryItems | Not populated / Items | 50 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51172 / ListPaneSummaryQuantity | Quantity / QUANTITY | 50 / 7500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17818: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51173 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51173 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18194 / Not populated | PRIORITY / Not populated / Priority | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18202 / Not populated | BASE_QUANTITY / Not populated / BaseQuantity | Not populated / 20 / Not populated / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18205 / Not populated | LOGGED_DATE_TIME / Not populated / LoggedDateTime | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18206 / Not populated | INTERNAL_REQUEST_NUM / Internal Request Num / INTERNALREQUESTNUM | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18209 / Not populated | REQUEST_KEY_NUM / Request Key Number / REQUESTKEYNUM | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18189 / ICON | Not populated / Icon / ICON | 10 / 10 / 500 / 45 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18191 / COLOR | Not populated / Color / COLOR | 10 / 10 / 600 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18192 / INTERNAL_REQUEST_NUM | INTERNAL_REQUEST_NUM / Internal Request Num / INTERNALREQUESTNUM | 10 / 10 / 800 / Not populated | Y / Y / N | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18193 / PRIORITY | PRIORITY / Not populated / Priority | 20 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18195 / REFERENCE_ID | Not populated / Not populated / ReferenceId | 10 / 10 / 1100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18196 / ITEM | Not populated / Not populated / Item | 10 / 10 / 1200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18197 / ITEM_DESC | Not populated / Not populated / Description | 10 / 10 / 1300 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18198 / COMPANY | Not populated / Not populated / Company | 10 / 10 / 1400 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18199 / TO_LOCATION | Not populated / Not populated / ToLocation | 10 / 10 / 1450 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18200 / LOGISTICS_UNIT | Not populated / License Plate / LOGISTICSUNIT | 10 / 10 / 1460 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18201 / BASE_QUANTITY | BASE_QUANTITY / Not populated / BaseQuantity | 20 / 10 / 1500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18203 / BASE_QUANTITY_UM | Not populated / Not populated / Baseqtyum | 10 / 10 / 1600 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18204 / LOGGED_DATE_TIME | LOGGED_DATE_TIME / Not populated / LoggedDateTime | 30 / 10 / 1800 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18207 / REQUEST_KEY_NUM | Not populated / Request Key Number / REQUESTKEYNUM | 10 / 10 / 2100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18208 / RequestKeyNumIdentifier | REQUEST_KEY_NUM / Request Key Number (Identifier) / REQUESTKEYNUMIDENTIFIER | 10 / 10 / 2200 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18190 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 2210 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4309: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17819 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17819; default=None |

#### Group 17819: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51174 / DetailPaneHeaderInternalReqNum | Not populated / Not populated | 240 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=583; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51175 / DetailPaneHeaderItem | Not populated / Not populated | 30 / 3500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=583; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51176 / DetailPaneHeaderItemDesc | Not populated / Not populated | 30 / 3750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=583; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51177 / DetailPaneHeaderCompany | Not populated / Not populated | 30 / 4000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=583; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51178 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 4500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=583; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4310: ChangePriorityModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17820 / ChangePriorityModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17820; default=None |
| 17821 / ChangePriorityModalDialogHeader | 17820 | Change Priority / CHANGEPRIORITY | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17820; default=None |
| 17822 / ChangePriorityModalDialogBody | 17820 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17820; default=None |
| 17823 / ChangePriorityModalDialogFooter | 17820 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17820; default=None |

#### Group 17822: ChangePriorityModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51179 / ChangePriorityEditor | Enter a Priority / ENTERPRIORITY | 90 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17823: ChangePriorityModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51180 / ChangePrioritySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51181 / ChangePriorityCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 51 control attributes, 23 events, and 41 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40267 | 51136 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40268 | 51136 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40269 | 51145 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40270 | 51146 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40271 | 51151 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 40272 | 51151 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40273 | 51152 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 40274 | 51153 / ListPaneMenuActionDelete | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40275 | 51153 / ListPaneMenuActionDelete | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40276 | 51153 / ListPaneMenuActionDelete | data-divider | Y / Y / N | 8 / 0 |
| 40277 | 51154 / ListPaneMenuActionChangePriority | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40278 | 51154 / ListPaneMenuActionChangePriority | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40279 | 51155 / BasicCriteriaRequestType | data-dbcolumn | Y / Y / N | 30 / 0 |
| 40280 | 51156 / BasicCriteriaInternalReqNumber | data-dbcolumn | Y / Y / N | 40 / 0 |
| 40281 | 51156 / BasicCriteriaInternalReqNumber | minValue | Y / Y / Y | 2 / 0 |
| 40282 | 51156 / BasicCriteriaInternalReqNumber | nullable | Y / Y / Y | 8 / 0 |
| 40283 | 51157 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 40284 | 51157 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 40297 | 51164 / SearchPaneComp | data-dbcolumn | Y / Y / N | 14 / 0 |
| 40285 | 51158 / BasicCriteriaLocation | data-dbcolumn | Y / Y / N | 22 / 0 |
| 40286 | 51158 / BasicCriteriaLocation | Lookup | Y / Y / N | 78 / 1 |
| 40287 | 51159 / BasicCriteriaInternalReferenceId | data-dbcolumn | Y / Y / N | 24 / 0 |
| 40288 | 51160 / BasicCriteriaInternalFulfillNumber | data-dbcolumn | Y / Y / N | 48 / 0 |
| 40289 | 51160 / BasicCriteriaInternalFulfillNumber | minValue | Y / Y / Y | 2 / 0 |
| 40290 | 51160 / BasicCriteriaInternalFulfillNumber | nullable | Y / Y / Y | 8 / 0 |
| 40291 | 51161 / BasicCriteriaFromLoggedDateRange | data-dbcolumn | Y / Y / N | 32 / 0 |
| 40295 | 51163 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 40296 | 51163 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40292 | 51162 / BasicCriteriaDisplayReqCurrFullfiled | data-dbcolumn | Y / Y / N | 48 / 0 |
| 40293 | 51162 / BasicCriteriaDisplayReqCurrFullfiled | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40294 | 51162 / BasicCriteriaDisplayReqCurrFullfiled | data-negativeCondition | Y / Y / N | 22 / 0 |
| 40298 | 51165 / SearchPaneIncludeShipAllocRequests | data-dbcolumn | Y / Y / N | 30 / 0 |
| 40299 | 51165 / SearchPaneIncludeShipAllocRequests | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40300 | 51165 / SearchPaneIncludeShipAllocRequests | data-negativeCondition | Y / Y / N | 16 / 0 |
| 40301 | 51166 / SearchPaneIncludeShortPickRequests | data-dbcolumn | Y / Y / N | 30 / 0 |
| 40302 | 51166 / SearchPaneIncludeShortPickRequests | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40303 | 51166 / SearchPaneIncludeShortPickRequests | data-negativeCondition | Y / Y / N | 16 / 0 |
| 40304 | 51167 / SearchPaneIncludeWorkOrderRequests | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40305 | 51167 / SearchPaneIncludeWorkOrderRequests | data-dbcolumn | Y / Y / N | 30 / 0 |
| 40306 | 51167 / SearchPaneIncludeWorkOrderRequests | data-negativeCondition | Y / Y / N | 16 / 0 |
| 40307 | 51168 / SearchPaneIncludeReplenishRequests | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40308 | 51168 / SearchPaneIncludeReplenishRequests | data-dbcolumn | Y / Y / N | 30 / 0 |
| 40309 | 51168 / SearchPaneIncludeReplenishRequests | data-negativeCondition | Y / Y / N | 16 / 0 |
| 40310 | 51170 / ListPaneSummaryNeeds | data-aggregateClause | Y / Y / Y | 54 / 0 |
| 40311 | 51172 / ListPaneSummaryQuantity | data-aggregateClause | Y / Y / Y | 26 / 0 |
| 40312 | 51173 / ListPaneDataGrid | data-dbtable | Y / Y / N | 46 / 0 |
| 40313 | 51173 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 40314 | 51173 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 40315 | 51174 / DetailPaneHeaderInternalReqNum | href | Y / Y / Y | 84 / 0 |
| 40316 | 51179 / ChangePriorityEditor | data-rule-min | Y / Y / Y | 2 / 0 |
| 40317 | 51179 / ChangePriorityEditor | data-msg-min | Y / Y / Y | 18 / 1 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17760 / click | 51137 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 17761 / click | 51138 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17762 / click | 51140 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 17763 / click | 51141 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17764 / click | 51142 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 17765 / click | 51143 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 17766 / click | 51144 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 17767 / click | 51145 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17768 / click | 51146 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17769 / click | 51147 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 17770 / click | 51148 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 17771 / click | 51149 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 17772 / click | 51150 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 17773 / click | 51151 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17774 / click | 51152 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17775 / click | 51153 / ListPaneMenuActionDelete | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 17776 / click | 51154 / ListPaneMenuActionChangePriority | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17777 / iggridrequesterror | 51173 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 17778 / iggriddatabound | 51173 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 17779 / iggridselectionrowselectionchanged | 51173 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 17780 / iggridselectionactiverowchanged | 51173 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |
| 17781 / click | 51180 / ChangePrioritySaveButton | _webUi.insightListPaneActions.modalDialogPerformPostForSelection | Not populated | Y / Y |
| 17782 / click | 51181 / ChangePriorityCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 25920 / 17760 | GETServiceURL | Y / Y | 76 |
| 25921 / 17760 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 25922 / 17760 | queryParameter_Function_UserName | Y / Y | 44 |
| 25923 / 17760 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25924 / 17760 | POSTServiceURL | Y / Y | 74 |
| 25925 / 17760 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 25926 / 17760 | PostData_Function_UserName | Y / Y | 44 |
| 25927 / 17760 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25928 / 17760 | PostData_Function_SearchValue | Y / Y | 98 |
| 25929 / 17760 | Post_SuccessCallback | Y / Y | 114 |
| 25930 / 17760 | ModalDialogName | Y / Y | 42 |
| 25931 / 17761 | ModalDialogName | Y / Y | 42 |
| 25932 / 17762 | POSTServiceURL | Y / Y | 144 |
| 25933 / 17762 | Form_Id | Y / Y | 8 |
| 25934 / 17762 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 25935 / 17762 | PostData_Function_SearchValue | Y / Y | 98 |
| 25936 / 17762 | Post_SuccessCallback | Y / Y | 114 |
| 25937 / 17762 | ModalDialogName | Y / Y | 56 |
| 25938 / 17763 | ModalDialogName | Y / Y | 56 |
| 25939 / 17767 | ModalDialogName | Y / Y | 42 |
| 25940 / 17768 | ModalDialogName | Y / Y | 56 |
| 25941 / 17773 | URL | Y / Y | 156 |
| 25942 / 17774 | URL | Y / Y | 156 |
| 25943 / 17775 | ConfirmationMessageCode | Y / Y | 28 |
| 25944 / 17775 | POSTServiceURL | Y / Y | 146 |
| 25945 / 17775 | PostData_Grid_ListPaneDataGrid_InternalRequestNum | Y / Y | 40 |
| 25946 / 17775 | Post_SuccessCallback | Y / Y | 140 |
| 25947 / 17776 | ModalDialogName | Y / Y | 50 |
| 25948 / 17780 | POSTServiceURL | Y / Y | 74 |
| 25949 / 17780 | PostData_internalrequestnum | Y / Y | 40 |
| 25950 / 17780 | PostData_storedProcedure | Y / Y | 48 |
| 25951 / 17780 | EnableAction_ListPaneMenuActionView | Y / Y | 48 |
| 25952 / 17780 | EnableAction_ListPaneMenuActionEdit | Y / Y | 48 |
| 25953 / 17780 | EnableAction_ListPaneMenuActionDelete | Y / Y | 48 |
| 25954 / 17780 | EnableAction_ListPaneMenuActionChangePriority | Y / Y | 48 |
| 25955 / 17781 | POSTServiceURL | Y / Y | 160 |
| 25956 / 17781 | PostData_Grid_ListPaneDataGrid_InternalRequestNum | Y / Y | 40 |
| 25957 / 17781 | PostData_Input_ChangePriorityEditor_Priority | Y / Y | 10 |
| 25958 / 17781 | Post_SuccessCallback | Y / Y | 140 |
| 25959 / 17781 | ModalDialogName | Y / Y | 50 |
| 25960 / 17782 | ModalDialogName | Y / Y | 50 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 36 selected candidate rows for this Screen: **36 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40269 | 51145 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40270 | 51146 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40271 | 51151 / Not applicable | data-formId | form_id | 3006 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40272 | 51151 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40273 | 51152 / Not applicable | data-formId | form_id | 3006 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40275 | 51153 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40278 | 51154 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40279 | 51155 / Not applicable | data-dbcolumn | database_identifier | REQUEST_KEY_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40280 | 51156 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_REQUEST_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40283 | 51157 / Not applicable | data-dbcolumn | database_identifier | ITEM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40285 | 51158 / Not applicable | data-dbcolumn | database_identifier | TO_LOCATION | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40287 | 51159 / Not applicable | data-dbcolumn | database_identifier | REFERENCE_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40288 | 51160 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_FULFILLMENT_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40291 | 51161 / Not applicable | data-dbcolumn | database_identifier | LOGGED_DATE_TIME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40292 | 51162 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_FULFILLMENT_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40296 | 51163 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40297 | 51164 / Not applicable | data-dbcolumn | database_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40298 | 51165 / Not applicable | data-dbcolumn | database_identifier | REQUEST_KEY_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40301 | 51166 / Not applicable | data-dbcolumn | database_identifier | REQUEST_KEY_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40305 | 51167 / Not applicable | data-dbcolumn | database_identifier | REQUEST_KEY_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40308 | 51168 / Not applicable | data-dbcolumn | database_identifier | REQUEST_KEY_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40312 | 51173 / Not applicable | data-dbtable | database_identifier | IMMEDIATE_NEEDS_REQUEST | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25920 | 51137 / 17760 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25924 | 51137 / 17760 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25929 | 51137 / 17760 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25932 | 51140 / 17762 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25936 | 51140 / 17762 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25943 | 51153 / 17775 | ConfirmationMessageCode | resource_code | MSG_IMMNEEDS04 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25944 | 51153 / 17775 | POSTServiceURL | relative_api_path | /general/scaleapi/ImmediateNeedsRequestApi/immediateNeedsRequests-deleted | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25945 | 51153 / 17775 | PostData_Grid_ListPaneDataGrid_InternalRequestNum | grid_field_identifier | INTERNAL_REQUEST_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25946 | 51153 / 17775 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25948 | 51173 / 17780 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25950 | 51173 / 17780 | PostData_storedProcedure | stored_procedure_identifier | IN_InsightDetailPaneData | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25955 | 51180 / 17781 | POSTServiceURL | relative_api_path | /general/scaleapi/ImmediateNeedsRequestApi/ImmediateNeedsRequests-PriorityEdited | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25956 | 51180 / 17781 | PostData_Grid_ListPaneDataGrid_InternalRequestNum | grid_field_identifier | INTERNAL_REQUEST_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25958 | 51180 / 17781 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
