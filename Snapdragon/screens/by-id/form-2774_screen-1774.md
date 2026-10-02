# Planned Shipment Insight — Form 2774, Screen 1774

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2774 |
| MAIN_UI_SCREEN Object ID | 1774 |
| Label / Form resource key | Planned Shipment Insight / MNU_PLANNEDSHIPMENTINSIGHT |
| Functional area code | 30 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2774 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2774 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2774 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_SHIPMENT_INSIGHT_VIEW |
| Help page reference | usingPlannedShipInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2774 |
| Inspection time (UTC) | 2026-10-02T15:23:58.924Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_PLANNEDSHIPMENTINSIGHT |
| Observed configured table/view | METADATA_SHIPMENT_INSIGHT_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1774 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:10:28.670Z | loaded; landing | https://trav.manhscale.com/scale/insights/2774; Planned Shipment Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:10:29.756Z | loaded; actions | https://trav.manhscale.com/scale/insights/2774; Planned Shipment Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:11:10.625Z | loaded; criteria_open | https://trav.manhscale.com/scale/insights/2774#search; Planned Shipment Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:11:18.711Z | loaded; advanced | https://trav.manhscale.com/scale/insights/2774#search; Planned Shipment Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |

**Visible criteria / entry fields:** Planned Shipment Filters; Shipment ID; Item; Company; Carrier; Customer; Customer Name; Customer PO; Ship To; ERP Order; Order Type; Wave; From Scheduled Ship Date; To Scheduled Ship Date; Warehouse.

**Visible grid headers:** Icon; Wave; Shipment ID; Customer Name; Carrier; Carrier Service; Scheduled Ship Date; Color; Field; Operand; Value.

**Observed action/menu labels:** New; Copy; Edit; Delete; New Line; Add Shipment to Wave; Add All Filtered Shipments to Wave; Clear Rejection Note; Consolidate; Immediate Needs; Print Preview; Print Default Docs; Print Selected Docs; Remove From Wave; Route; Split Shipment; Transfer to Another Wave.

**Page groups:** Basic Criteria; Shipment Type; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Planned Shipment Insight is recorded as `insight`. Its saved configuration contains 6 parts, 22 groups, 59 controls, and 44 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4361 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4362 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4363 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4364 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4365 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4366 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4361: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17996 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17996; default=None |
| 17997 / SaveSearchModalDialogHeader | 17996 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17996; default=None |
| 17998 / SaveSearchModalDialogBody | 17996 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17996; default=None |
| 17999 / SaveSearchModalDialogFooter | 17996 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17996; default=None |

#### Group 17998: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51512 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17999: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51513 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51514 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4362: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18000 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18000; default=None |
| 18001 / GadgetCalculationQueryDialogHeader | 18000 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18000; default=None |
| 18002 / GadgetCalculationQueryDialogBody | 18000 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18000; default=None |
| 18003 / GadgetCalculationQueryDialogFooter | 18000 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18000; default=None |

#### Group 18002: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51515 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18003: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51516 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51517 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4363: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18004 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18004; default=None |
| 18005 / InsightMenuPanel | 18004 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18004; default=None |
| 18006 / InsightMenuFavoritesDropdown | 18004 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18004; default=None |
| 18007 / InsightListPaneMenuPanel | 18004 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18004; default=None |
| 18008 / MenuExportToExcelPanel | 18004 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18004; default=None |
| 18009 / InsightMenuActionsDropdown | 18004 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18004; default=None |

#### Group 18005: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51518 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51519 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51520 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51521 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18007: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51522 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51523 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 51524 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51525 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18008: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51526 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18009: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51527 / ListPaneMenuActionNew | New / NEW | 150 / 2200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEW |
| 51528 / ListPaneMenuActionCopy | Copy / COPY | 150 / 2350 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=COPY |
| 51529 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 51530 / ListPaneMenuActionView | View / VIEW | 150 / 2750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 51531 / ListPaneMenuActionDeleteShipment | Delete / DELETE | 150 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 51532 / ListPaneMenuActionNewLine | New Line / NEWLINE | 150 / 3050 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ADDSHIPMENTTOWAVE |
| 51533 / ListPaneMenuActionAddShipmentToWave | Add Shipment to Wave / ADDSHIPMENTTOWAVE | 150 / 3100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ADDSHIPMENTTOWAVE |
| 51534 / ListPaneMenuActionAddFilteredShipmentsToWave | Add All Filtered Shipments to Wave / ADDFILTSHIPTOWAVE | 150 / 3200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ADDFILTSHIPTOWAVE |
| 51535 / ListPaneMenuActionClearRejectionNote | Clear Rejection Note / CLEARREJECTIONNOTE | 150 / 3250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CLEARREJECTIONNOTE |
| 51536 / ListPaneMenuActionConsolidateShipment | Consolidate / CONSOLIDATE | 150 / 3500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CONSOLIDATE |
| 51537 / ListPaneMenuActionImmediateNeeds | Immediate Needs / IMMEDIATENEEDS | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=IMMEDIATENEEDS |
| 51538 / ListPaneMenuActionPrintPreviewDocs | Print Preview / PRINTPREVIEW | 150 / 4700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTPREVIEW |
| 51539 / ListPaneMenuActionPrintShipmentDocs | Print Default Docs / PRINTDEFAULTDOCS | 150 / 4750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTDEFAULTDOCS |
| 51540 / ListPaneMenuActionPrintSelectedShipmentDocs | Print Selected Docs / PRINTSELECTEDDOCS | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTSELECTEDDOCS |
| 51541 / ListPaneMenuActionRemoveShipmentFromWave | Remove From Wave / REMOVEFROMWAVE | 150 / 5200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=REMOVEFROMWAVE |
| 51542 / ListPaneMenuActionRouteShipment | Route / ROUTE | 150 / 5275 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ROUTE |
| 51543 / ListPaneMenuActionSplitShipment | Split Shipment / SPLITSHIPMENT | 150 / 5300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SPLITSHIPMENT |
| 51544 / ListPaneMenuActionTransferShipmentToAnotherWave | Transfer to Another Wave / TRANSFERTOANOTHERWAVE | 150 / 5400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TRANSFERTOANOTHERWAVE |

### Part 4364: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18010 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18010; default=None |
| 18011 / SearchPaneBasicCriteria | 18010 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18010; default=None |
| 18012 / SearchPaneShipmentType | 18010 | Shipment Type / SHIPMENTTYPE | 50 / 20000 | Y / Y | Fixed to top=N; loading=0; nested unit=18010; default=None |
| 18013 / SearchPaneAdvancedCriteria | 18010 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=18010; default=None |

#### Group 18011: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51545 / SearchPaneFilters | Planned Shipment Filters / UI_FLTPLANSHIPFLTRS | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51546 / BasicCriteriaShipmentId | Shipment ID / SHIPMENTID | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51547 / BasicCriteriaItem | Item / ITEM | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51557 / SearchPaneComp | Company / COMPANY | 280 / 6000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51558 / SearchPaneCarrierAndService | Carrier / CARRIER | 280 / 6500 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51548 / BasicCriteriaCustomer | Customer / CUSTOMER | 10 / 10000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51549 / BasicCriteriaCustomerName | Customer Name / CUSTOMERNAME | 10 / 11000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51550 / BasicCriteriaCustomerPO | Customer PO / CUSTOMERPO | 10 / 12000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51551 / BasicCriteriaShipTo | Ship To / SHIPTO | 10 / 12500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51552 / BasicCriteriaErpOrder | ERP Order / ERPORDER | 10 / 15000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51553 / BasicCriteriaOrderType | Order Type / ORDERTYPE | 10 / 17500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51554 / BasicCriteriaWaveNumber | Wave / WAVE | 90 / 22500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51555 / BasicCriteriaScheduledShipDateRange | Scheduled Ship Date / SCHEDULEDSHIPDATE | 190 / 25000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51556 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 26000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18012: SearchPaneShipmentType — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51559 / ShipmentTypeInPoolShipments | Show in Pool Shipments / SHOWINPOOLSHIPMENTS | 130 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51560 / ShipmentTypeWavedShipments | Show Shipments On Wave / SHOWSHIPMENTSONWAVE | 130 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18013: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51561 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4365: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18014 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18014; default=None |
| 18015 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18015; default=None |

#### Group 18014: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51562 / ListPaneSummaryShipments | Shipments / SHIPMENTS | 50 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51563 / ListPaneSummaryDetails | Lines / LINES | 50 / 7500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51564 / ListPaneSummaryTotalQuantity | Units / UNITS | 50 / 7500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18015: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51565 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51565 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18400 / Not populated | LAUNCH_NUM / Wave Number / LAUNCH_NUM | Not populated / 30 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18402 / Not populated | LAUNCH_NUM / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18406 / LAUNCH_NUM | LAUNCH_NUM / Not populated / Not populated | Not populated / 50 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18407 / Not populated | Shipment_Id / Not populated / Not populated | Not populated / 30 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18408 / Not populated | Shipment_Id / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18409 / Not populated | TOTAL_LINES / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18410 / Not populated | SHIPMENT_HEADER_TOTAL_QTY / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18425 / Not populated | Internal_Shipment_Num / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18403 / ICON | Not populated / Icon / ICON | 10 / 10 / 400 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18405 / LAUNCH_NUM | LAUNCH_NUM / Wave / WAVE | 10 / 10 / 700 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18411 / SHIPMENT_ID | Shipment_Id / Shipment ID / SHIPMENTID | 10 / 10 / 800 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18412 / CUSTOMER_NAME | Not populated / Customer Name / CUSTOMERNAME | 10 / 10 / 900 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18413 / SHIPMENT_HEADER_CARRIER | Not populated / Carrier / CARRIER | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18414 / CARRIER_SERVICE | Not populated / Carrier Service / CARRIERSERVICE | 10 / 10 / 1100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18415 / SCHEDULED_SHIP_DATE | Not populated / Scheduled Ship Date / SCHEDULEDSHIPDATE | 30 / 10 / 1200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18416 / CUSTOMER | Not populated / Customer / CUSTOMER | 10 / 10 / 1300 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18417 / SHIP_TO | Not populated / Ship To / SHIPTO | 10 / 10 / 1400 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18418 / SHIP_TO_NAME | Not populated / Ship To Name / SHIPTONAME | 10 / 10 / 1500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18419 / LEADING_STS | Not populated / Leading Status / LEADINGSTS | 10 / 10 / 1600 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18420 / TRAILING_STS | Not populated / Trailing Status / TRAILINGSTS | 10 / 10 / 1700 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18421 / ORDER_TYPE | Not populated / Order Type / ORDERTYPE | 10 / 10 / 1800 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18422 / COMPANY | Not populated / Company / COMPANY | 10 / 10 / 1900 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18423 / WAREHOUSE | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 2000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18424 / INTERNAL_SHIPMENT_NUM | Internal_Shipment_Num / Internal Shipment Number / INTERNALSHIPMENTNUM | 10 / 10 / 2100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18426 / REJECTION_NOTE | Not populated / Rejection Note / REJECTIONNOTE | 10 / 10 / 2200 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18429 / HAS_DETAIL_LINKED_TO_WO | Not populated / Has Line Linked to Work Order / HASLINELINKEDTOWO | 40 / 10 / 2200 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18427 / IN_DELETION | Not populated / In Deletion / INDELETION | 40 / 10 / 2300 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18428 / IN_CONFIRMATION | Not populated / In Confirmation / INCONFIRMATION | 40 / 10 / 2400 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18430 / LOCKED | Not populated / Locked / LOCKED | 40 / 10 / 2500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18431 / RELEASED | Not populated / Released / RELEASED | 40 / 10 / 2600 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18432 / LEADINGSTS | Not populated / Leading Status (Numeric) / LEADINGSTSNUMERIC | 20 / 10 / 2700 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18433 / TRAILINGSTS | Not populated / Trailing Status (Numeric) / TRAILINGSTSNUMERIC | 20 / 10 / 2800 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18434 / IMMD_NEEDS_REQ_CREATED | Not populated / Immediate Needs Request Created / IMMDNEEDSREQCREATED | 40 / 10 / 2900 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18404 / COLOR | Not populated / Color / COLOR | 10 / 10 / 3000 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18435 / CUSTOMER_PO | Not populated / Customer PO / CUSTOMERPO | 10 / 10 / 3000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18436 / CREATION_DATE_TIME_STAMP | Not populated / Creation Date Time / CREATIONDATETIMESTAMP | 30 / 10 / 3100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18437 / PLANNED_SHIP_DATE | Not populated / Planned Ship Date / PLANNEDSHIPDATE | 30 / 10 / 3200 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18438 / REQUESTED_DELIVERY_DATE | Not populated / Requested Delivery Date / REQUESTED_DELIVERY_DATE | 30 / 10 / 3300 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18439 / SHIPMENT_HEADER_TOTAL_QTY | Not populated / Total Quantity (Shipment Header) / SHIPMENTHEADERTOTALQTY | 20 / 10 / 3400 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18440 / TOTAL_WEIGHT | Not populated / Total Weight / TOTALWEIGHT | 20 / 10 / 3500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=60; DATA_SOURCE_TYPE=None |
| 18441 / LAUNCH_NAME | Not populated / Wave Name / WAVENAME | 10 / 10 / 3600 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18442 / IMMEDIATE_NEEDS_NOTE | Not populated / Immediate Needs Note (Shipment Header) / SHIPMENTHEADERIMMEDIATENEEDSNOTE | 10 / 10 / 5700 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18443 / HAS_REJECTION_NOTE | Not populated / Has Rejection Note / HASREJECTIONNOTE | 40 / 10 / 5800 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18401 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 5810 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4366: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18016 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18016; default=None |
| 18017 / indicatorpane | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18017; default=None |

#### Group 18016: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51566 / DetailPaneHeaderShipmentID | Not populated / Not populated | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=592; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51567 / DetailPaneHeaderShipToName | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=592; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51568 / DetailPaneHeaderTrailingSts | Not populated / Not populated | 30 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=592; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51569 / DetailPaneHeaderLeadingSts | Not populated / Not populated | 30 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=592; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18017: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51570 / ShipmentInsightWavedIndicatorTileLines | Lines / LINES | 360 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 75 control attributes, 35 events, and 83 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40626 | 51521 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40627 | 51522 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40628 | 51527 / ListPaneMenuActionNew | data-formId | Y / Y / N | 8 / 0 |
| 40629 | 51527 / ListPaneMenuActionNew | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40630 | 51528 / ListPaneMenuActionCopy | data-formId | Y / Y / N | 8 / 0 |
| 40631 | 51528 / ListPaneMenuActionCopy | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40632 | 51529 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 40633 | 51529 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40634 | 51530 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 40635 | 51531 / ListPaneMenuActionDeleteShipment | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40636 | 51531 / ListPaneMenuActionDeleteShipment | data-formId | Y / Y / N | 8 / 0 |
| 40637 | 51531 / ListPaneMenuActionDeleteShipment | data-divider | Y / Y / N | 8 / 0 |
| 40638 | 51531 / ListPaneMenuActionDeleteShipment | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40639 | 51532 / ListPaneMenuActionNewLine | data-formId | Y / Y / N | 8 / 0 |
| 40640 | 51532 / ListPaneMenuActionNewLine | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40641 | 51532 / ListPaneMenuActionNewLine | data-divider | Y / Y / N | 8 / 0 |
| 40642 | 51533 / ListPaneMenuActionAddShipmentToWave | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40643 | 51533 / ListPaneMenuActionAddShipmentToWave | data-formId | Y / Y / N | 8 / 0 |
| 40644 | 51533 / ListPaneMenuActionAddShipmentToWave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40645 | 51534 / ListPaneMenuActionAddFilteredShipmentsToWave | data-formId | Y / Y / N | 8 / 0 |
| 40646 | 51534 / ListPaneMenuActionAddFilteredShipmentsToWave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40647 | 51535 / ListPaneMenuActionClearRejectionNote | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40648 | 51535 / ListPaneMenuActionClearRejectionNote | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40649 | 51536 / ListPaneMenuActionConsolidateShipment | data-formId | Y / Y / N | 8 / 0 |
| 40650 | 51536 / ListPaneMenuActionConsolidateShipment | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40651 | 51537 / ListPaneMenuActionImmediateNeeds | data-formId | Y / Y / N | 8 / 0 |
| 40652 | 51537 / ListPaneMenuActionImmediateNeeds | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40653 | 51538 / ListPaneMenuActionPrintPreviewDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40654 | 51539 / ListPaneMenuActionPrintShipmentDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40655 | 51540 / ListPaneMenuActionPrintSelectedShipmentDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40656 | 51541 / ListPaneMenuActionRemoveShipmentFromWave | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40657 | 51541 / ListPaneMenuActionRemoveShipmentFromWave | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40658 | 51542 / ListPaneMenuActionRouteShipment | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40659 | 51543 / ListPaneMenuActionSplitShipment | data-formId | Y / Y / N | 8 / 0 |
| 40660 | 51543 / ListPaneMenuActionSplitShipment | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40661 | 51544 / ListPaneMenuActionTransferShipmentToAnotherWave | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40662 | 51544 / ListPaneMenuActionTransferShipmentToAnotherWave | data-formId | Y / Y / N | 8 / 0 |
| 40663 | 51544 / ListPaneMenuActionTransferShipmentToAnotherWave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40664 | 51546 / BasicCriteriaShipmentId | data-dbcolumn | Y / Y / N | 22 / 0 |
| 40665 | 51546 / BasicCriteriaShipmentId | Lookup | Y / Y / N | 88 / 1 |
| 40666 | 51547 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 40667 | 51547 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 40683 | 51557 / SearchPaneComp | data-dbcolumn | Y / Y / N | 14 / 0 |
| 40684 | 51558 / SearchPaneCarrierAndService | data-parentdbcolumn | Y / Y / N | 46 / 0 |
| 40685 | 51558 / SearchPaneCarrierAndService | data-childdbcolumn | Y / Y / N | 30 / 0 |
| 40668 | 51548 / BasicCriteriaCustomer | data-dbcolumn | Y / Y / N | 16 / 0 |
| 40669 | 51548 / BasicCriteriaCustomer | Lookup | Y / Y / N | 78 / 0 |
| 40670 | 51549 / BasicCriteriaCustomerName | data-dbcolumn | Y / Y / N | 26 / 0 |
| 40671 | 51550 / BasicCriteriaCustomerPO | data-dbcolumn | Y / Y / N | 22 / 0 |
| 40672 | 51551 / BasicCriteriaShipTo | data-dbcolumn | Y / Y / N | 14 / 0 |
| 40673 | 51551 / BasicCriteriaShipTo | Lookup | Y / Y / N | 68 / 0 |
| 40674 | 51552 / BasicCriteriaErpOrder | data-dbcolumn | Y / Y / N | 50 / 0 |
| 40675 | 51552 / BasicCriteriaErpOrder | Lookup | Y / Y / N | 78 / 1 |
| 40676 | 51553 / BasicCriteriaOrderType | data-dbcolumn | Y / Y / N | 52 / 0 |
| 40677 | 51554 / BasicCriteriaWaveNumber | data-dbcolumn | Y / Y / N | 20 / 0 |
| 40678 | 51554 / BasicCriteriaWaveNumber | nullable | Y / Y / Y | 8 / 0 |
| 40679 | 51555 / BasicCriteriaScheduledShipDateRange | data-dbcolumn | Y / Y / N | 38 / 0 |
| 40680 | 51555 / BasicCriteriaScheduledShipDateRange | data-dateOnly | Y / Y / Y | 8 / 0 |
| 40681 | 51556 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 40682 | 51556 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40686 | 51559 / ShipmentTypeInPoolShipments | data-dbcolumn | Y / Y / N | 10 / 0 |
| 40687 | 51559 / ShipmentTypeInPoolShipments | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40688 | 51559 / ShipmentTypeInPoolShipments | data-negativeCondition | Y / Y / N | 6 / 0 |
| 40689 | 51560 / ShipmentTypeWavedShipments | data-dbcolumn | Y / Y / N | 10 / 0 |
| 40690 | 51560 / ShipmentTypeWavedShipments | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40691 | 51560 / ShipmentTypeWavedShipments | data-negativeCondition | Y / Y / N | 6 / 0 |
| 40692 | 51563 / ListPaneSummaryDetails | data-aggregateClause | Y / Y / Y | 32 / 0 |
| 40693 | 51564 / ListPaneSummaryTotalQuantity | data-aggregateClause | Y / Y / Y | 60 / 0 |
| 40694 | 51565 / ListPaneDataGrid | data-dbtable | Y / Y / N | 70 / 0 |
| 40695 | 51565 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 20 / 0 |
| 40696 | 51565 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 42 / 0 |
| 40697 | 51565 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 40698 | 51565 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 40699 | 51566 / DetailPaneHeaderShipmentID | href | Y / Y / Y | 164 / 0 |
| 40700 | 51570 / ShipmentInsightWavedIndicatorTileLines | data-indicatorTileGoToInsight | Y / Y / Y | 204 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17969 / click | 51513 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 17970 / click | 51516 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 17971 / click | 51517 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17972 / click | 51518 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 17973 / click | 51519 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 17974 / click | 51520 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 17975 / click | 51521 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17976 / click | 51522 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17977 / click | 51523 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 17978 / click | 51524 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 17979 / click | 51525 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 17980 / click | 51526 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 17981 / click | 51527 / ListPaneMenuActionNew | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17982 / click | 51528 / ListPaneMenuActionCopy | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17983 / click | 51529 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17984 / click | 51530 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17985 / click | 51531 / ListPaneMenuActionDeleteShipment | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 17986 / click | 51532 / ListPaneMenuActionNewLine | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17987 / click | 51533 / ListPaneMenuActionAddShipmentToWave | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTabWithPost | Not populated | Y / Y |
| 17988 / click | 51534 / ListPaneMenuActionAddFilteredShipmentsToWave | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTabWithPost | Not populated | Y / Y |
| 17989 / click | 51535 / ListPaneMenuActionClearRejectionNote | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 17990 / click | 51536 / ListPaneMenuActionConsolidateShipment | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17991 / click | 51537 / ListPaneMenuActionImmediateNeeds | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17992 / click | 51538 / ListPaneMenuActionPrintPreviewDocs | _webUi.dialog.printPreviewSelection | Not populated | Y / Y |
| 17993 / click | 51539 / ListPaneMenuActionPrintShipmentDocs | _webUi.insightListPaneActions.menuActionPerformGet | Not populated | Y / Y |
| 17994 / click | 51540 / ListPaneMenuActionPrintSelectedShipmentDocs | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 17995 / click | 51541 / ListPaneMenuActionRemoveShipmentFromWave | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 17996 / click | 51542 / ListPaneMenuActionRouteShipment | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 17997 / click | 51543 / ListPaneMenuActionSplitShipment | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17998 / click | 51544 / ListPaneMenuActionTransferShipmentToAnotherWave | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTabWithPost | Not populated | Y / Y |
| 17999 / iggridrequesterror | 51565 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18000 / iggriddatabound | 51565 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18001 / iggriddatarendered | 51565 / ListPaneDataGrid | _webUi.Grid.gridDataRendered | Not populated | Y / Y |
| 18002 / iggridselectionrowselectionchanged | 51565 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18003 / iggridselectionactiverowchanged | 51565 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 26377 / 17969 | GETServiceURL | Y / Y | 76 |
| 26378 / 17969 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 26379 / 17969 | queryParameter_Function_UserName | Y / Y | 44 |
| 26380 / 17969 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26381 / 17969 | POSTServiceURL | Y / Y | 74 |
| 26382 / 17969 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 26383 / 17969 | PostData_Function_UserName | Y / Y | 44 |
| 26384 / 17969 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26385 / 17969 | PostData_Function_SearchValue | Y / Y | 98 |
| 26386 / 17969 | Post_SuccessCallback | Y / Y | 114 |
| 26387 / 17969 | ModalDialogName | Y / Y | 42 |
| 26388 / 17970 | POSTServiceURL | Y / Y | 144 |
| 26389 / 17970 | Form_Id | Y / Y | 8 |
| 26390 / 17970 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26391 / 17970 | PostData_Function_SearchValue | Y / Y | 98 |
| 26392 / 17970 | Post_SuccessCallback | Y / Y | 114 |
| 26393 / 17970 | ModalDialogName | Y / Y | 56 |
| 26394 / 17971 | ModalDialogName | Y / Y | 56 |
| 26395 / 17975 | ModalDialogName | Y / Y | 42 |
| 26396 / 17976 | ModalDialogName | Y / Y | 56 |
| 26397 / 17981 | URL | Y / Y | 86 |
| 26398 / 17982 | URL | Y / Y | 146 |
| 26399 / 17983 | URL | Y / Y | 148 |
| 26400 / 17984 | URL | Y / Y | 148 |
| 26401 / 17985 | ConfirmationMessageCode | Y / Y | 40 |
| 26402 / 17985 | POSTServiceURL | Y / Y | 110 |
| 26403 / 17985 | PostData_Grid_ListPaneDataGrid_InternalShipmentNum | Y / Y | 42 |
| 26404 / 17985 | Post_SuccessCallback | Y / Y | 140 |
| 26405 / 17986 | URL | Y / Y | 172 |
| 26406 / 17987 | POSTServiceURL | Y / Y | 104 |
| 26407 / 17987 | PostData_Grid_ListPaneDataGrid_InternalShipmentNumber | Y / Y | 42 |
| 26408 / 17988 | POSTServiceURL | Y / Y | 104 |
| 26409 / 17988 | PostData_Grid_ListPaneDataGrid_InternalShipmentNumber | Y / Y | 42 |
| 26410 / 17988 | CheckForFilters | Y / Y | 8 |
| 26411 / 17989 | ConfirmationMessageCode | Y / Y | 38 |
| 26412 / 17989 | ConfirmationTitleCode | Y / Y | 36 |
| 26413 / 17989 | POSTServiceURL | Y / Y | 126 |
| 26414 / 17989 | PostData_Grid_ListPaneDataGrid_InternalShipmentNum | Y / Y | 42 |
| 26415 / 17989 | Post_SuccessCallback | Y / Y | 140 |
| 26416 / 17990 | URL | Y / Y | 188 |
| 26417 / 17991 | URL | Y / Y | 254 |
| 26418 / 17992 | queryParameter_internalNum | Y / Y | 38 |
| 26419 / 17992 | printProcess | Y / Y | 4 |
| 26420 / 17993 | GETServiceURL | Y / Y | 54 |
| 26421 / 17993 | queryParameter_internalNum | Y / Y | 38 |
| 26422 / 17993 | queryParameter_printProcess | Y / Y | 4 |
| 26423 / 17994 | URL | Y / Y | 204 |
| 26424 / 17995 | ConfirmationMessageCode | Y / Y | 24 |
| 26425 / 17995 | ConfirmationTitleCode | Y / Y | 28 |
| 26426 / 17995 | POSTServiceURL | Y / Y | 100 |
| 26427 / 17995 | PostData_Grid_ListPaneDataGrid_InternalShipmentNumber | Y / Y | 42 |
| 26428 / 17995 | PostData_Grid_ListPaneDataGrid_WaveNumber | Y / Y | 20 |
| 26429 / 17995 | Post_SuccessCallback | Y / Y | 140 |
| 26430 / 17996 | POSTServiceURL | Y / Y | 104 |
| 26431 / 17996 | PostData_InternalShipmentNum | Y / Y | 38 |
| 26432 / 17996 | Post_SuccessCallback | Y / Y | 140 |
| 26433 / 17997 | URL | Y / Y | 188 |
| 26434 / 17998 | POSTServiceURL | Y / Y | 136 |
| 26435 / 17998 | PostData_Grid_ListPaneDataGrid_InternalShipmentNumber | Y / Y | 42 |
| 26436 / 18003 | POSTServiceURL | Y / Y | 74 |
| 26437 / 18003 | PostData_internalShipmentNum | Y / Y | 42 |
| 26438 / 18003 | PostData_storedProcedure | Y / Y | 60 |
| 26439 / 18003 | EnableAction_ListPaneMenuActionPrintShipmentDocs | Y / Y | 124 |
| 26440 / 18003 | EnableAction_ListPaneMenuActionPrintPreviewDocs | Y / Y | 42 |
| 26441 / 18003 | EnableAction_ListPaneMenuActionClearRejectionNote | Y / Y | 96 |
| 26442 / 18003 | EnableAction_ListPaneMenuActionPrintSelectedShipmentDocs | Y / Y | 42 |
| 26443 / 18003 | EnableAction_ListPaneMenuActionShipLevelManifest | Y / Y | 106 |
| 26444 / 18003 | EnableAction_ListPaneMenuActionNewLine | Y / Y | 142 |
| 26445 / 18003 | EnableAction_DetailPaneMenuActionPrintContainerDocs | Y / Y | 10 |
| 26446 / 18003 | EnableAction_DetailPaneMenuActionPrintSelectedContainerDocs | Y / Y | 10 |
| 26447 / 18003 | EnableAction_ListPaneMenuActionView | Y / Y | 90 |
| 26448 / 18003 | EnableAction_ListPaneMenuActionNew | Y / Y | 8 |
| 26449 / 18003 | EnableAction_ListPaneMenuActionCopy | Y / Y | 180 |
| 26450 / 18003 | EnableAction_ListPaneMenuActionEdit | Y / Y | 42 |
| 26451 / 18003 | EnableAction_ListPaneMenuActionDeleteShipment | Y / Y | 132 |
| 26452 / 18003 | EnableAction_ListPaneMenuActionSplitShipment | Y / Y | 128 |
| 26453 / 18003 | EnableAction_ListPaneMenuActionImmediateNeeds | Y / Y | 112 |
| 26454 / 18003 | EnableAction_ListPaneMenuActionRouteShipment | Y / Y | 172 |
| 26455 / 18003 | EnableAction_ListPaneMenuActionConsolidateShipment | Y / Y | 164 |
| 26456 / 18003 | EnableAction_ListPaneMenuActionRemoveShipmentFromWave | Y / Y | 88 |
| 26457 / 18003 | EnableAction_ListPaneMenuActionAddShipmentToWave | Y / Y | 178 |
| 26458 / 18003 | EnableAction_ListPaneMenuActionTransferShipmentToAnotherWave | Y / Y | 132 |
| 26459 / 18003 | EnableAction_ListPaneMenuActionAddFilteredShipmentsToWave_filterBadge | Y / Y | 30 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 77 selected candidate rows for this Screen: **74 accepted tokens** and **3 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40626 | 51521 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40627 | 51522 / Not applicable | data-securityCheckpoint | checkpoint | 25 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40628 | 51527 / Not applicable | data-formId | form_id | 2760 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40629 | 51527 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40630 | 51528 / Not applicable | data-formId | form_id | 2760 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40631 | 51528 / Not applicable | data-securityCheckpoint | checkpoint | 4 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40632 | 51529 / Not applicable | data-formId | form_id | 2760 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40633 | 51529 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40634 | 51530 / Not applicable | data-formId | form_id | 2760 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40636 | 51531 / Not applicable | data-formId | form_id | 2760 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40638 | 51531 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40639 | 51532 / Not applicable | data-formId | form_id | 3017 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40640 | 51532 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40643 | 51533 / Not applicable | data-formId | form_id | 3049 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40644 | 51533 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40645 | 51534 / Not applicable | data-formId | form_id | 3049 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40646 | 51534 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40648 | 51535 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40649 | 51536 / Not applicable | data-formId | form_id | 3028 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40650 | 51536 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40651 | 51537 / Not applicable | data-formId | form_id | 2767 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40652 | 51537 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40653 | 51538 / Not applicable | data-securityCheckpoint | checkpoint | 34 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40654 | 51539 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40655 | 51540 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40657 | 51541 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40658 | 51542 / Not applicable | data-securityCheckpoint | checkpoint | 35 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40659 | 51543 / Not applicable | data-formId | form_id | 3044 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40660 | 51543 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40662 | 51544 / Not applicable | data-formId | form_id | 3049 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40663 | 51544 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40664 | 51546 / Not applicable | data-dbcolumn | database_identifier | Shipment_Id | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40666 | 51547 / Not applicable | data-dbcolumn | database_identifier | Item | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40668 | 51548 / Not applicable | data-dbcolumn | database_identifier | Customer | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40670 | 51549 / Not applicable | data-dbcolumn | database_identifier | CUSTOMER_NAME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40671 | 51550 / Not applicable | data-dbcolumn | database_identifier | CUSTOMER_PO | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40672 | 51551 / Not applicable | data-dbcolumn | database_identifier | Ship_To | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40674 | 51552 / Not applicable | data-dbcolumn | database_identifier | Shipment_Header_Erp_Order | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40676 | 51553 / Not applicable | data-dbcolumn | database_identifier | Shipment_Header_Order_Type | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40677 | 51554 / Not applicable | data-dbcolumn | database_identifier | Launch_Num | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40679 | 51555 / Not applicable | data-dbcolumn | database_identifier | Scheduled_Ship_Date | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40682 | 51556 / Not applicable | data-dbcolumn | database_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40683 | 51557 / Not applicable | data-dbcolumn | database_identifier | Company | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40686 | 51559 / Not applicable | data-dbcolumn | database_identifier | WAVED | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40689 | 51560 / Not applicable | data-dbcolumn | database_identifier | WAVED | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40694 | 51565 / Not applicable | data-dbtable | database_identifier | Metadata_Insight_Shipment_Pool_View | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26377 | 51513 / 17969 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26381 | 51513 / 17969 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26386 | 51513 / 17969 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26388 | 51516 / 17970 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26392 | 51516 / 17970 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26401 | 51531 / 17985 | ConfirmationMessageCode | resource_code | MSG_DELETESHIPMENT01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26402 | 51531 / 17985 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShipmentHeadersApi/Shipments-Deleted | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26403 | 51531 / 17985 | PostData_Grid_ListPaneDataGrid_InternalShipmentNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26404 | 51531 / 17985 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26407 | 51533 / 17987 | PostData_Grid_ListPaneDataGrid_InternalShipmentNumber | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26409 | 51534 / 17988 | PostData_Grid_ListPaneDataGrid_InternalShipmentNumber | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26411 | 51535 / 17989 | ConfirmationMessageCode | resource_code | MSG_REJECTIONNOTE01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26412 | 51535 / 17989 | ConfirmationTitleCode | resource_code | CLEARREJECTIONNOTE | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26413 | 51535 / 17989 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShipmentHeadersApi/shipments-NoRejectionNote | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26414 | 51535 / 17989 | PostData_Grid_ListPaneDataGrid_InternalShipmentNum | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26415 | 51535 / 17989 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26420 | 51539 / 17993 | GETServiceURL | relative_api_path | /general/scaleapi/PrintApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26424 | 51541 / 17995 | ConfirmationMessageCode | resource_code | MSG_LAUNCH32 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26425 | 51541 / 17995 | ConfirmationTitleCode | resource_code | REMOVEFROMWAVE | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26426 | 51541 / 17995 | POSTServiceURL | relative_api_path | /outbound/scaleapi/WavesApi/waves-removedshipments | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26427 | 51541 / 17995 | PostData_Grid_ListPaneDataGrid_InternalShipmentNumber | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26428 | 51541 / 17995 | PostData_Grid_ListPaneDataGrid_WaveNumber | grid_field_identifier | LAUNCH_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26429 | 51541 / 17995 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26430 | 51542 / 17996 | POSTServiceURL | relative_api_path | /outbound/scaleapi/shipmentheadersapi/RouteShipment? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26432 | 51542 / 17996 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26435 | 51544 / 17998 | PostData_Grid_ListPaneDataGrid_InternalShipmentNumber | grid_field_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26436 | 51565 / 18003 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26438 | 51565 / 18003 | PostData_storedProcedure | stored_procedure_identifier | SHP_InsighInPoolDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
