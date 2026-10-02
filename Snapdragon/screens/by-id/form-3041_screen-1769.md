# Shipping Load Insight — Form 3041, Screen 1769

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3041 |
| MAIN_UI_SCREEN Object ID | 1769 |
| Label / Form resource key | Shipping Load Insight / MNU_LOADINSIGHT |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/3041 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/3041 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3041 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | SHIPPING_LOAD_VIEW |
| Help page reference | ShipLoadInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3041 |
| Inspection time (UTC) | 2026-10-02T15:25:52.727Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_LOADINSIGHT |
| Observed configured table/view | SHIPPING_LOAD_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1769 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:13:53.610Z | loaded; landing | https://trav.manhscale.com/scale/insights/3041; Shipping Load Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:14:00.148Z | loaded; actions | https://trav.manhscale.com/scale/insights/3041; Shipping Load Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:14:00.957Z | loaded; criteria_open | https://trav.manhscale.com/scale/insights/3041#search; Shipping Load Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:14:08.135Z | loaded; advanced | https://trav.manhscale.com/scale/insights/3041#search; Shipping Load Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |

**Visible criteria / entry fields:** Shipping Load; Leading Status; Trailing Status; Master BOL Number; BOL/PRO/Tracking Num; Carrier; From Scheduled Ship Date; To Scheduled Ship Date; Warehouse.

**Visible grid headers:** Icon; Color; Shipping Load; Carrier; PRO Number; Scheduled Ship Date; Trailing Status; Leading Status; Total Containers; Total Weight; Total Volume; Field; Operand; Value.

**Observed action/menu labels:** New; Edit; Delete; Close; Confirm; Print Preview; Print Default Docs; Print Selected Docs.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Shipping Load Insight is recorded as `insight`. Its saved configuration contains 7 parts, 25 groups, 52 controls, and 21 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4330 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4331 / SplitShipmentConfirmationModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SplitShipmentConfirmationCancelButton |
| 4332 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4333 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4334 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4335 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4336 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4330: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17889 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17889; default=None |
| 17890 / SaveSearchModalDialogHeader | 17889 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17889; default=None |
| 17891 / SaveSearchModalDialogBody | 17889 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17889; default=None |
| 17892 / SaveSearchModalDialogFooter | 17889 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17889; default=None |

#### Group 17891: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51319 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17892: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51320 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51321 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4331: SplitShipmentConfirmationModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17893 / SplitShipmentConfirmationModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17893; default=None |
| 17894 / SplitShipmentConfirmationModalDialogHeader | 17893 | Confirmation / CONFIRMATION | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17893; default=None |
| 17895 / SplitShipmentConfirmationModalDialogBody | 17893 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17893; default=None |
| 17896 / SplitShipmentConfirmationModalDialogFooter | 17893 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17893; default=None |

#### Group 17895: SplitShipmentConfirmationModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51322 / SplitShipmentConfirmationMessage | One or more of the shipments chosen for confirmation are not in the proper status.  Please choose an action from the selections below. / SPLITINSTRUCTIONS | 30 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17896: SplitShipmentConfirmationModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51323 / SplitShipmentConfirmationSplitButton | Split / BTN_SPLIT | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51324 / SplitShipmentConfirmationSplitNotInRangeButton | Split Shipment If Not in Range / SPLITNOTINRANGE | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51325 / SplitShipmentConfirmationNoSplitButton | Do Not Split Shipment / DONOTSPLIT | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51326 / SplitShipmentConfirmationCancelButton | Cancel / CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4332: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17897 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17897; default=None |
| 17898 / GadgetCalculationQueryDialogHeader | 17897 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17897; default=None |
| 17899 / GadgetCalculationQueryDialogBody | 17897 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17897; default=None |
| 17900 / GadgetCalculationQueryDialogFooter | 17897 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17897; default=None |

#### Group 17899: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51327 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17900: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51328 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51329 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4333: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17901 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17901; default=None |
| 17902 / InsightMenuPanel | 17901 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=17901; default=None |
| 17903 / InsightMenuFavoritesDropdown | 17901 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=17901; default=None |
| 17904 / InsightListPaneMenuPanel | 17901 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17901; default=None |
| 17905 / MenuExportToExcelPanel | 17901 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=17901; default=None |
| 17906 / InsightMenuActionsDropdown | 17901 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=17901; default=None |

#### Group 17902: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51330 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51331 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51332 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51333 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17904: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51334 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51335 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 51336 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51337 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 17905: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51338 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 17906: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51339 / ListPaneMenuActionNew | New / NEW | 150 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEW |
| 51340 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 2100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 51341 / ListPaneMenuActionDeleteShippingLoad | Delete / DELETE | 150 / 2200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 51342 / ListPaneMenuActionClose | Close / CLOSE | 150 / 2400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CLOSE |
| 51347 / ListPaneMenuActionConfirm | Confirm / CONFIRM | 150 / 2400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CLOSE |
| 51343 / ListPaneMenuActionPrintPreviewDocs | Print Preview / PRINTPREVIEW | 150 / 2450 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTPREVIEW |
| 51344 / ListPaneMenuActionPrintLoadDocs | Print Default Docs / PRINTDEFAULTDOCS | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTDEFAULTDOCS |
| 51345 / ListPaneMenuActionPrintSelectedLoadDocs | Print Selected Docs / PRINTSELECTEDDOCS | 150 / 2600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTSELECTEDDOCS |
| 51346 / ListPaneMenuActionSignBoL | Sign BOL / SIGNBOL | 150 / 2700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGNBOL |

### Part 4334: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17907 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17907; default=None |
| 17908 / SearchPaneBasicCriteria | 17907 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=17907; default=None |
| 17909 / SearchPaneAdvancedCriteria | 17907 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=17907; default=None |

#### Group 17908: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51348 / BasicCriteriaShippingLoadNumber | Shipping Load / SHIPPINGLOAD | 90 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51354 / SearchPaneLeadingSts | Not populated / LeadingSts | 80 / 6000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51355 / SearchPaneTrailingSts | Not populated / TrailingSts | 80 / 6500 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51349 / BasicCriteriaMasterBolNumber | Master BOL Number / MASTERBOLNUMBER | 10 / 10000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51350 / BasicCriteriaProNumber | BOL/PRO/Tracking Num / PRONUMBER | 10 / 12500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51356 / SearchPaneCarrier | Carrier / CARRIER | 280 / 21000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51351 / BasicCriteriaScheduledShipDateRange | Scheduled Ship Date / SCHEDULEDSHIPDATE | 190 / 25000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51353 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 26000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51352 / BasicCriteriaConfirmedLoads | Include Confirmed Shipping Loads / INCLUDECONFIRMEDSHIPPINGLOADS | 130 / 27500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17909: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51357 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4335: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17910 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17910; default=None |
| 17911 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17911; default=None |

#### Group 17910: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51358 / ListPaneSummaryLoads | Loads / LOADS | 50 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51359 / ListPaneSummaryContainers | Containers / CONTAINERS | 50 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51360 / ListPaneSummaryWeight | Weight / WEIGHT | 50 / 7500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51361 / ListPaneSummaryVolume | Volume / VOLUME | 50 / 10000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17911: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51362 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51362 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18298 / ICON | Not populated / Icon / ICON | 10 / 10 / 500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18300 / COLOR | Not populated / Color / COLOR | 10 / 10 / 1000 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18301 / INTERNAL_LOAD_NUM | INTERNAL_LOAD_NUM / Shipping Load / SHIPPINGLOAD | 10 / 10 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18302 / Not populated | INTERNAL_LOAD_NUM / Internal Load Number / INTERNALLOADNUM | 10 / 20 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18303 / CARRIER | Not populated / Carrier / CARRIER | 10 / 10 / 2500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18304 / PRO_NUM_ALPHA | Not populated / PRO Number / PRONUMALPHA | 10 / 10 / 2600 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18305 / SCHEDULED_SHIP_DATE | Not populated / Scheduled Ship Date / SCHEDULEDSHIPDATE | 30 / 10 / 2700 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18306 / TRAILING_STS | Not populated / Trailing Status / TRAILINGSTS | 10 / 10 / 2800 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18307 / LEADING_STS | Not populated / Leading Status / LEADINGSTS | 10 / 10 / 3000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18308 / TOTAL_CONTAINERS | Not populated / Total Containers / TOTALCONTAINERS | 20 / 10 / 3100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18309 / TOTAL_WEIGHT | Not populated / Total Weight / TOTALWEIGHT | 20 / 10 / 3200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=60; DATA_SOURCE_TYPE=None |
| 18310 / TOTAL_VOLUME | Not populated / Total Volume / TOTALVOLUME | 20 / 10 / 3300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=50; DATA_SOURCE_TYPE=None |
| 18311 / DOCK_DOOR_LOCATION | Not populated / Dock Door / DOCKDOOR | 10 / 10 / 7000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18312 / IN_CONFIRMATION | Not populated / In Confirmation / INCONFIRMATION | 40 / 10 / 11000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18313 / LEADING_STS_FAILED | Not populated / Leading Status (Failed) / LEADINGSTSFAILED | 40 / 10 / 11500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18314 / MASTER_BOL_NUM_ALPHA | Not populated / Master BOL Number / MASTERBOLNUMALPHA | 10 / 10 / 13000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18315 / LOAD_CLOSED | Not populated / Load Closed / LOADCLOSED | 10 / 10 / 14000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18316 / LEADINGSTS | Not populated / Leading Status (Numeric) / LEADINGSTSNUMERIC | 20 / 10 / 15000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18317 / TRAILINGSTS | Not populated / Trailing Status (Numeric) / TRAILINGSTSNUMERIC | 20 / 10 / 16000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18318 / WAREHOUSE | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 17000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18299 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 17010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4336: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17912 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17912; default=None |
| 17913 / indicatorpane | Not populated | Not populated / Not populated | 60 / 17500 | Y / Y | Fixed to top=N; loading=0; nested unit=17913; default=None |

#### Group 17912: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51363 / DetailPaneHeaderInternalLoadNum | Not populated / Not populated | 240 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=587; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51364 / DetailPaneHeaderCarrier | Not populated / Not populated | 30 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=587; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51365 / DetailPaneHeaderScheduledShipDate | Not populated / Not populated | 30 / 5400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=587; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51366 / DetailPaneHeaderLeadingSts | Not populated / Not populated | 30 / 5500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=587; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51367 / DetailPaneHeaderService | Not populated / Not populated | 30 / 5600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=587; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17913: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51368 / LoadInsightIndicatorTileShipments | Shipments / SHIPMENTS | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51369 / LoadInsightIndicatorTileLines | Lines / LINES | 360 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51370 / LoadInsightIndicatorTileContainers | Containers / CONTAINERS | 360 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 48 control attributes, 30 events, and 65 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40463 | 51319 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40464 | 51319 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40465 | 51333 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40466 | 51334 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40467 | 51339 / ListPaneMenuActionNew | data-formId | Y / Y / N | 8 / 0 |
| 40468 | 51339 / ListPaneMenuActionNew | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40469 | 51340 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 40470 | 51340 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40471 | 51341 / ListPaneMenuActionDeleteShippingLoad | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40472 | 51341 / ListPaneMenuActionDeleteShippingLoad | data-formId | Y / Y / N | 8 / 0 |
| 40473 | 51341 / ListPaneMenuActionDeleteShippingLoad | data-divider | Y / Y / N | 8 / 0 |
| 40474 | 51341 / ListPaneMenuActionDeleteShippingLoad | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40475 | 51342 / ListPaneMenuActionClose | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40476 | 51342 / ListPaneMenuActionClose | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40481 | 51347 / ListPaneMenuActionConfirm | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40482 | 51347 / ListPaneMenuActionConfirm | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40477 | 51343 / ListPaneMenuActionPrintPreviewDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40478 | 51344 / ListPaneMenuActionPrintLoadDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40479 | 51345 / ListPaneMenuActionPrintSelectedLoadDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40480 | 51346 / ListPaneMenuActionSignBoL | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40483 | 51348 / BasicCriteriaShippingLoadNumber | data-dbcolumn | Y / Y / N | 34 / 0 |
| 40484 | 51348 / BasicCriteriaShippingLoadNumber | Lookup | Y / Y / N | 118 / 1 |
| 40485 | 51348 / BasicCriteriaShippingLoadNumber | nullable | Y / Y / Y | 8 / 0 |
| 40495 | 51354 / SearchPaneLeadingSts | data-dbcolumn | Y / Y / N | 22 / 0 |
| 40496 | 51355 / SearchPaneTrailingSts | data-dbcolumn | Y / Y / N | 24 / 0 |
| 40486 | 51349 / BasicCriteriaMasterBolNumber | data-dbcolumn | Y / Y / N | 40 / 0 |
| 40487 | 51350 / BasicCriteriaProNumber | data-dbcolumn | Y / Y / N | 26 / 0 |
| 40497 | 51356 / SearchPaneCarrier | data-dbcolumn | Y / Y / N | 14 / 0 |
| 40498 | 51356 / SearchPaneCarrier | data-dataType | Y / Y / N | 2 / 0 |
| 40488 | 51351 / BasicCriteriaScheduledShipDateRange | data-dbcolumn | Y / Y / N | 38 / 0 |
| 40489 | 51351 / BasicCriteriaScheduledShipDateRange | data-dateOnly | Y / Y / Y | 8 / 0 |
| 40493 | 51353 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 40494 | 51353 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40490 | 51352 / BasicCriteriaConfirmedLoads | data-dbcolumn | Y / Y / N | 24 / 0 |
| 40491 | 51352 / BasicCriteriaConfirmedLoads | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40492 | 51352 / BasicCriteriaConfirmedLoads | data-negativeCondition | Y / Y / N | 10 / 0 |
| 40499 | 51359 / ListPaneSummaryContainers | data-aggregateClause | Y / Y / Y | 42 / 0 |
| 40500 | 51360 / ListPaneSummaryWeight | data-aggregateClause | Y / Y / Y | 34 / 0 |
| 40501 | 51361 / ListPaneSummaryVolume | data-aggregateClause | Y / Y / Y | 34 / 0 |
| 40502 | 51362 / ListPaneDataGrid | data-dbtable | Y / Y / N | 36 / 0 |
| 40503 | 51362 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 34 / 0 |
| 40504 | 51362 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 40505 | 51362 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 40506 | 51363 / DetailPaneHeaderInternalLoadNum | href | Y / Y / Y | 168 / 0 |
| 40507 | 51365 / DetailPaneHeaderScheduledShipDate | data-format | Y / Y / N | 8 / 0 |
| 40508 | 51368 / LoadInsightIndicatorTileShipments | data-indicatorTileGoToInsight | Y / Y / Y | 288 / 0 |
| 40509 | 51369 / LoadInsightIndicatorTileLines | data-indicatorTileGoToInsight | Y / Y / Y | 278 / 0 |
| 40510 | 51370 / LoadInsightIndicatorTileContainers | data-indicatorTileGoToInsight | Y / Y / Y | 372 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17861 / click | 51320 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 17862 / click | 51321 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17863 / click | 51323 / SplitShipmentConfirmationSplitButton | _webUi.loadInsight.splitShipmentConfirmation | Not populated | Y / Y |
| 17864 / click | 51324 / SplitShipmentConfirmationSplitNotInRangeButton | _webUi.loadInsight.splitShipmentConfirmation | Not populated | Y / Y |
| 17865 / click | 51325 / SplitShipmentConfirmationNoSplitButton | _webUi.loadInsight.splitShipmentConfirmation | Not populated | Y / Y |
| 17866 / click | 51326 / SplitShipmentConfirmationCancelButton | _webUi.loadInsight.splitShipmentConfirmation | Not populated | Y / Y |
| 17867 / click | 51328 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 17868 / click | 51329 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17869 / click | 51330 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 17870 / click | 51331 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 17871 / click | 51332 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 17872 / click | 51333 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17873 / click | 51334 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17874 / click | 51335 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 17875 / click | 51336 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 17876 / click | 51337 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 17877 / click | 51338 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 17878 / click | 51339 / ListPaneMenuActionNew | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17879 / click | 51340 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17880 / click | 51341 / ListPaneMenuActionDeleteShippingLoad | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 17881 / click | 51342 / ListPaneMenuActionClose | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 17886 / click | 51347 / ListPaneMenuActionConfirm | _webUi.loadInsight.confirmLoad | Not populated | Y / Y |
| 17882 / click | 51343 / ListPaneMenuActionPrintPreviewDocs | _webUi.dialog.printPreviewSelection | Not populated | Y / Y |
| 17883 / click | 51344 / ListPaneMenuActionPrintLoadDocs | _webUi.insightListPaneActions.menuActionPerformGet | Not populated | Y / Y |
| 17884 / click | 51345 / ListPaneMenuActionPrintSelectedLoadDocs | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 17885 / click | 51346 / ListPaneMenuActionSignBoL | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17887 / iggridrequesterror | 51362 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 17888 / iggriddatabound | 51362 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 17889 / iggridselectionrowselectionchanged | 51362 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 17890 / iggridselectionactiverowchanged | 51362 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 26156 / 17861 | GETServiceURL | Y / Y | 76 |
| 26157 / 17861 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 26158 / 17861 | queryParameter_Function_UserName | Y / Y | 44 |
| 26159 / 17861 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26160 / 17861 | POSTServiceURL | Y / Y | 74 |
| 26161 / 17861 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 26162 / 17861 | PostData_Function_UserName | Y / Y | 44 |
| 26163 / 17861 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26164 / 17861 | PostData_Function_SearchValue | Y / Y | 98 |
| 26165 / 17861 | Post_SuccessCallback | Y / Y | 114 |
| 26166 / 17861 | ModalDialogName | Y / Y | 42 |
| 26167 / 17862 | ModalDialogName | Y / Y | 42 |
| 26168 / 17863 | splitMode | Y / Y | 2 |
| 26169 / 17863 | POSTServiceURL | Y / Y | 116 |
| 26170 / 17863 | modelDialog | Y / Y | 72 |
| 26171 / 17864 | splitMode | Y / Y | 2 |
| 26172 / 17864 | POSTServiceURL | Y / Y | 116 |
| 26173 / 17864 | modelDialog | Y / Y | 72 |
| 26174 / 17865 | splitMode | Y / Y | 2 |
| 26175 / 17865 | POSTServiceURL | Y / Y | 116 |
| 26176 / 17865 | modelDialog | Y / Y | 72 |
| 26177 / 17866 | POSTServiceURL | Y / Y | 116 |
| 26178 / 17866 | modelDialog | Y / Y | 72 |
| 26179 / 17867 | POSTServiceURL | Y / Y | 144 |
| 26180 / 17867 | Form_Id | Y / Y | 8 |
| 26181 / 17867 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26182 / 17867 | PostData_Function_SearchValue | Y / Y | 98 |
| 26183 / 17867 | Post_SuccessCallback | Y / Y | 114 |
| 26184 / 17867 | ModalDialogName | Y / Y | 56 |
| 26185 / 17868 | ModalDialogName | Y / Y | 56 |
| 26186 / 17872 | ModalDialogName | Y / Y | 42 |
| 26187 / 17873 | ModalDialogName | Y / Y | 56 |
| 26188 / 17878 | URL | Y / Y | 32 |
| 26189 / 17879 | URL | Y / Y | 168 |
| 26190 / 17880 | ConfirmationMessageCode | Y / Y | 32 |
| 26191 / 17880 | POSTServiceURL | Y / Y | 112 |
| 26192 / 17880 | PostData_Grid_ListPaneDataGrid_InternalLoadNum | Y / Y | 34 |
| 26193 / 17880 | Post_SuccessCallback | Y / Y | 140 |
| 26194 / 17881 | ConfirmationMessageCode | Y / Y | 30 |
| 26195 / 17881 | POSTServiceURL | Y / Y | 110 |
| 26196 / 17881 | PostData_Grid_ListPaneDataGrid_InternalLoadNum | Y / Y | 34 |
| 26197 / 17881 | Post_SuccessCallback | Y / Y | 140 |
| 26206 / 17886 | POSTServiceURL | Y / Y | 118 |
| 26207 / 17886 | ConfirmationMessageCode | Y / Y | 22 |
| 26208 / 17886 | Post_SuccessCallback | Y / Y | 140 |
| 26198 / 17882 | queryParameter_internalNum | Y / Y | 48 |
| 26199 / 17882 | printProcess | Y / Y | 4 |
| 26200 / 17883 | GETServiceURL | Y / Y | 54 |
| 26201 / 17883 | queryParameter_internalNum | Y / Y | 48 |
| 26202 / 17883 | queryParameter_printProcess | Y / Y | 4 |
| 26203 / 17884 | URL | Y / Y | 224 |
| 26204 / 17885 | URL | Y / Y | 174 |
| 26205 / 17885 | queryParameter_InternalLoadNum | Y / Y | 34 |
| 26209 / 17890 | POSTServiceURL | Y / Y | 74 |
| 26210 / 17890 | PostData_internalLoadNum | Y / Y | 34 |
| 26211 / 17890 | PostData_storedProcedure | Y / Y | 58 |
| 26212 / 17890 | EnableAction_ListPaneMenuActionClose | Y / Y | 32 |
| 26213 / 17890 | EnableAction_ListPaneMenuActionNew | Y / Y | 8 |
| 26214 / 17890 | EnableAction_ListPaneMenuActionEdit | Y / Y | 42 |
| 26215 / 17890 | EnableAction_ListPaneMenuActionDeleteShippingLoad | Y / Y | 42 |
| 26216 / 17890 | EnableAction_ListPaneMenuActionPrintLoadDocs | Y / Y | 42 |
| 26217 / 17890 | EnableAction_ListPaneMenuActionPrintPreviewDocs | Y / Y | 42 |
| 26218 / 17890 | EnableAction_ListPaneMenuActionPrintSelectedLoadDocs | Y / Y | 42 |
| 26219 / 17890 | EnableAction_ListPaneMenuActionConfirm | Y / Y | 180 |
| 26220 / 17890 | EnableAction_ListPaneMenuActionSignBoL | Y / Y | 42 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 47 selected candidate rows for this Screen: **47 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40465 | 51333 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40466 | 51334 / Not applicable | data-securityCheckpoint | checkpoint | 26 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40467 | 51339 / Not applicable | data-formId | form_id | 3026 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40468 | 51339 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40469 | 51340 / Not applicable | data-formId | form_id | 3026 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40470 | 51340 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40472 | 51341 / Not applicable | data-formId | form_id | 3026 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40474 | 51341 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40476 | 51342 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40477 | 51343 / Not applicable | data-securityCheckpoint | checkpoint | 34 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40478 | 51344 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40479 | 51345 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40480 | 51346 / Not applicable | data-securityCheckpoint | checkpoint | 38 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40481 | 51347 / Not applicable | data-securityCheckpoint | checkpoint | 25 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40483 | 51348 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_LOAD_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40486 | 51349 / Not applicable | data-dbcolumn | database_identifier | master_bol_num_alpha | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40487 | 51350 / Not applicable | data-dbcolumn | database_identifier | PRO_NUM_ALPHA | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40488 | 51351 / Not applicable | data-dbcolumn | database_identifier | SCHEDULED_SHIP_DATE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40490 | 51352 / Not applicable | data-dbcolumn | database_identifier | TRAILING_STS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40494 | 51353 / Not applicable | data-dbcolumn | database_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40495 | 51354 / Not applicable | data-dbcolumn | database_identifier | LEADING_STS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40496 | 51355 / Not applicable | data-dbcolumn | database_identifier | TRAILING_STS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40497 | 51356 / Not applicable | data-dbcolumn | database_identifier | CARRIER | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40502 | 51362 / Not applicable | data-dbtable | database_identifier | SHIPPING_LOAD_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26156 | 51320 / 17861 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26160 | 51320 / 17861 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26165 | 51320 / 17861 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26169 | 51323 / 17863 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShippingLoadApi/ShippingLoads-Confirmed | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26172 | 51324 / 17864 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShippingLoadApi/ShippingLoads-Confirmed | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26175 | 51325 / 17865 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShippingLoadApi/ShippingLoads-Confirmed | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26177 | 51326 / 17866 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShippingLoadApi/ShippingLoads-Confirmed | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26179 | 51328 / 17867 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26183 | 51328 / 17867 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26190 | 51341 / 17880 | ConfirmationMessageCode | resource_code | MSG_DELETELOAD01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26191 | 51341 / 17880 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShippingLoadApi/ShippingLoads-Deleted | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26192 | 51341 / 17880 | PostData_Grid_ListPaneDataGrid_InternalLoadNum | grid_field_identifier | INTERNAL_LOAD_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26193 | 51341 / 17880 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26194 | 51342 / 17881 | ConfirmationMessageCode | resource_code | MSG_CLOSELOAD01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26195 | 51342 / 17881 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShippingLoadApi/ShippingLoads-Closed | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26196 | 51342 / 17881 | PostData_Grid_ListPaneDataGrid_InternalLoadNum | grid_field_identifier | INTERNAL_LOAD_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26197 | 51342 / 17881 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26200 | 51344 / 17883 | GETServiceURL | relative_api_path | /general/scaleapi/PrintApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26206 | 51347 / 17886 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShippingLoadApi/ShippingLoads-Confirmed? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26207 | 51347 / 17886 | ConfirmationMessageCode | resource_code | MSG_SHIP119 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26208 | 51347 / 17886 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26209 | 51362 / 17890 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26211 | 51362 / 17890 | PostData_storedProcedure | stored_procedure_identifier | INV_LoadInsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
