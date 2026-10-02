# Work Order Line Insight — Form 2789, Screen 1800

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2789 |
| MAIN_UI_SCREEN Object ID | 1800 |
| Label / Form resource key | Work Order Line Insight / MNU_WOLINEINSIGHT |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2789 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2789 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2789 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_WORK_ORDER_DETAIL_VIEW |
| Help page reference | workOrderLineInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2789 |
| Inspection time (UTC) | 2026-10-02T15:24:19.744Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_WOLINEINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_WORK_ORDER_DETAIL_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1800 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:15:00.610Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/insights/2789#search; Work Order Line Insight | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

**Visible criteria / entry fields:** Work Order ID; Item; Description; Company; From Location; Warehouse; Internal Work Order Number.

**Visible grid headers:** Icon; Work Order ID; Sequence; Item; Company; Description; Needed; Used; On Hand; Conv UM; Allocated; Color.

**Observed action/menu labels:** Edit; Delete; Allocate; Deallocate; Immediate Needs.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Work Order Line Insight is recorded as `insight`. Its saved configuration contains 6 parts, 21 groups, 40 controls, and 27 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4525 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4526 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4527 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4528 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4529 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4530 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4525: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18560 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18560; default=None |
| 18561 / SaveSearchModalDialogHeader | 18560 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18560; default=None |
| 18562 / SaveSearchModalDialogBody | 18560 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18560; default=None |
| 18563 / SaveSearchModalDialogFooter | 18560 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18560; default=None |

#### Group 18562: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52633 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18563: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52634 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52635 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4526: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18564 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18564; default=None |
| 18565 / GadgetCalculationQueryDialogHeader | 18564 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18564; default=None |
| 18566 / GadgetCalculationQueryDialogBody | 18564 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18564; default=None |
| 18567 / GadgetCalculationQueryDialogFooter | 18564 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18564; default=None |

#### Group 18566: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52636 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18567: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52637 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52638 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4527: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18568 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18568; default=None |
| 18569 / InsightMenuPanel | 18568 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18568; default=None |
| 18570 / InsightMenuFavoritesDropdown | 18568 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18568; default=None |
| 18571 / InsightListPaneMenuPanel | 18568 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18568; default=None |
| 18572 / MenuExportToExcelPanel | 18568 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18568; default=None |
| 18573 / InsightMenuActionsDropdown | 18568 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18568; default=None |

#### Group 18569: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52639 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 52640 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 52641 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 52642 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18571: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52643 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52644 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 52645 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 52646 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18572: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52647 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18573: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52648 / ListPaneMenuActionView | View / VIEW | 150 / 16000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 52649 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 17000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 52650 / ListPaneMenuActionDeleteWorkOrderDetails | Delete / DELETE | 150 / 17500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 52651 / ListPaneMenuActionAllocateWorkOrderDetails | Allocate / ALLOCATE | 150 / 18000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ALLOCATE |
| 52652 / ListPaneMenuActionDeallocateWorkOrderDetail | Deallocate / DEALLOCATE | 150 / 18250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DEALLOCATE |
| 52653 / ListPaneMenuActionImmediateNeeds | Immediate Needs / IMMEDIATENEEDS | 150 / 18500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=IMMEDIATENEEDS |

### Part 4528: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18574 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18574; default=None |
| 18575 / SearchPaneBasicCriteria | 18574 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18574; default=None |
| 18576 / SearchPaneAdvancedCriteria | 18574 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=18574; default=None |

#### Group 18575: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52654 / BasicCriteriaWorkOrderId | Work Order ID / WORKORDERID | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52655 / BasicCriteriaItem | Item / ITEM | 10 / 5500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52656 / BasicCriteriaDescription | Description / DESCRIPTION | 10 / 5750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52657 / BasicCriteriaCompany | Company / COMPANY | 280 / 6000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52658 / BasicCriteriaFromLocation | From Location / FROMLOCATION | 10 / 6500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52659 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 7000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52660 / BasicCriteriaInternalWorkOrderNum | Internal Work Order Number / INTERNALWORKORDERNUMBER | 90 / 7500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18576: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52661 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4529: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18577 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18577; default=None |
| 18578 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18578; default=None |

#### Group 18577: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52662 / ListPaneSummaryComponents | Components / COMPONENTS | 50 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52663 / ListPaneSummaryNeeded | Needed / NEEDED | 50 / 2600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52664 / ListPaneSummaryUsed | Used / USED | 50 / 2700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18578: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52665 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 52665 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 19026 / Not populated | INTERNALWRKORDLINENUM / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19027 / Not populated | INTERNALWORKORDERNUM / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19001 / ICON | Not populated / Icon / ICON | 10 / 10 / 250 / 45 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19003 / WorkOrderId | Not populated / Work Order ID / WORKORDERID | 10 / 10 / 500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19004 / Sequence | Not populated / Sequence / SEQUENCE | 10 / 10 / 700 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19005 / Item | Not populated / Item / ITEM | 10 / 10 / 750 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19006 / Company | Not populated / Company / COMPANY | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19007 / Description | Not populated / Description / DESCRIPTION | 10 / 10 / 1250 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19008 / Needed | Not populated / Needed / NEEDED | 20 / 10 / 1500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 19009 / Used | Not populated / Used / USED | 20 / 10 / 1750 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 19010 / OnHand | Not populated / On Hand / ONHAND | 20 / 10 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 19011 / ConvUm | Not populated / Conv UM / CONVUM | 10 / 10 / 2100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19012 / Allocated | Not populated / Allocated / ALLOCATED | 10 / 10 / 2250 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19013 / OrigTotalQtyNeeded | Not populated / Orig Total Qty Needed / ORIGINALTOTALQTYNEEDED | 20 / 10 / 2500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 19014 / Lot | Not populated / Lot / LOT | 10 / 10 / 3000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19015 / FromLocation | Not populated / From Location / FROMLOCATION | 10 / 10 / 3250 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19016 / InternalWorkOrderLineNum | INTERNALWRKORDLINENUM / Internal Work Order Line Number / INTERNALWORKORDERLINENUMBER | 10 / 10 / 4250 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19017 / InternalWorkOrderNum | INTERNALWORKORDERNUM / Internal Work Order Number / INTERNALWORKORDERNUMBER | 10 / 10 / 4500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19018 / COLOR | Not populated / Color / COLOR | 10 / 10 / 5000 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19020 / ImmediateNeedsNote | Not populated / Immediate Needs Note / IMMEDIATENEEDSNOTE | 10 / 10 / 5250 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19021 / ImmediateNeedsResourceKey | Not populated / Immediate Needs (Resource Key) / IMMEDIATENEEDSRESOURCEKEY | 10 / 10 / 5500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19023 / ImmediateNeedsRequestCreated | Not populated / Immediate Needs / IMMEDIATENEEDS | 40 / 10 / 6000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19019 / InAllocation | Not populated / In Allocation / INALLOCATION | 40 / 10 / 7000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19022 / Level | Not populated / Level / LEVEL | 20 / 10 / 8000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19024 / Condition | Not populated / Condition / CONDITION | 10 / 10 / 8500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19025 / ToQty | Not populated / Not populated / ToQty | 10 / 10 / 9000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 19002 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 9010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4530: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18579 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18579; default=None |
| 18580 / indicatorpane | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18580; default=None |

#### Group 18579: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52666 / DetailPaneHeaderComponentSequence | Not populated / Not populated | 240 / 550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=618; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52667 / DetailPaneHeaderComponentItem | Not populated / Not populated | 30 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=618; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52668 / DetailPaneHeaderCompany | Not populated / Not populated | 30 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=618; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52669 / DetailPaneHeaderDescription | Not populated / Not populated | 30 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=618; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52670 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=618; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18580: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52671 / WorkOrderInsightIndicatorTileOpenWork | Open Work / OPENWORK | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52672 / WorkOrderInsightIndicatorTileTransactions | Transactions / TRANSACTIONS | 360 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 38 control attributes, 23 events, and 42 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 41764 | 52633 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 41765 | 52633 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 41766 | 52642 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41767 | 52643 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41768 | 52648 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 41769 | 52649 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 41770 | 52649 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41771 | 52650 / ListPaneMenuActionDeleteWorkOrderDetails | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41772 | 52650 / ListPaneMenuActionDeleteWorkOrderDetails | data-formId | Y / Y / N | 8 / 0 |
| 41773 | 52650 / ListPaneMenuActionDeleteWorkOrderDetails | data-divider | Y / Y / N | 8 / 0 |
| 41774 | 52650 / ListPaneMenuActionDeleteWorkOrderDetails | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41775 | 52651 / ListPaneMenuActionAllocateWorkOrderDetails | data-formId | Y / Y / N | 8 / 0 |
| 41776 | 52651 / ListPaneMenuActionAllocateWorkOrderDetails | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41777 | 52652 / ListPaneMenuActionDeallocateWorkOrderDetail | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41778 | 52653 / ListPaneMenuActionImmediateNeeds | data-formId | Y / Y / N | 8 / 0 |
| 41779 | 52653 / ListPaneMenuActionImmediateNeeds | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41780 | 52654 / BasicCriteriaWorkOrderId | data-dbcolumn | Y / Y / N | 22 / 0 |
| 41781 | 52654 / BasicCriteriaWorkOrderId | Lookup | Y / Y / N | 86 / 1 |
| 41782 | 52655 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 12 / 0 |
| 41783 | 52655 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 41784 | 52656 / BasicCriteriaDescription | data-dbcolumn | Y / Y / N | 20 / 0 |
| 41785 | 52657 / BasicCriteriaCompany | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41786 | 52658 / BasicCriteriaFromLocation | data-dbcolumn | Y / Y / N | 24 / 0 |
| 41787 | 52658 / BasicCriteriaFromLocation | Lookup | Y / Y / N | 86 / 1 |
| 41788 | 52659 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 41789 | 52659 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 22 / 0 |
| 41790 | 52660 / BasicCriteriaInternalWorkOrderNum | data-dbcolumn | Y / Y / N | 40 / 0 |
| 41791 | 52662 / ListPaneSummaryComponents | data-aggregateClause | Y / Y / Y | 44 / 0 |
| 41792 | 52663 / ListPaneSummaryNeeded | data-aggregateClause | Y / Y / Y | 56 / 0 |
| 41793 | 52664 / ListPaneSummaryUsed | data-aggregateClause | Y / Y / Y | 34 / 0 |
| 41794 | 52665 / ListPaneDataGrid | data-dbtable | Y / Y / N | 78 / 0 |
| 41795 | 52665 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 46 / 0 |
| 41796 | 52665 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 56 / 0 |
| 41797 | 52665 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 41798 | 52665 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 41799 | 52666 / DetailPaneHeaderComponentSequence | href | Y / Y / Y | 90 / 0 |
| 41800 | 52671 / WorkOrderInsightIndicatorTileOpenWork | data-indicatorTileGoToInsight | Y / Y / Y | 360 / 0 |
| 41801 | 52672 / WorkOrderInsightIndicatorTileTransactions | data-indicatorTileGoToInsight | Y / Y / Y | 368 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18608 / click | 52634 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18609 / click | 52635 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18610 / click | 52637 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18611 / click | 52638 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18612 / click | 52639 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18613 / click | 52640 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18614 / click | 52641 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18615 / click | 52642 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18616 / click | 52643 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18617 / click | 52644 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 18618 / click | 52645 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18619 / click | 52646 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18620 / click | 52647 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18621 / click | 52648 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18622 / click | 52649 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18623 / click | 52650 / ListPaneMenuActionDeleteWorkOrderDetails | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18624 / click | 52651 / ListPaneMenuActionAllocateWorkOrderDetails | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18625 / click | 52652 / ListPaneMenuActionDeallocateWorkOrderDetail | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 18626 / click | 52653 / ListPaneMenuActionImmediateNeeds | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18627 / iggridrequesterror | 52665 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18628 / iggriddatabound | 52665 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18629 / iggridselectionrowselectionchanged | 52665 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18630 / iggridselectionactiverowchanged | 52665 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 27672 / 18608 | GETServiceURL | Y / Y | 76 |
| 27673 / 18608 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 27674 / 18608 | queryParameter_Function_UserName | Y / Y | 44 |
| 27675 / 18608 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27676 / 18608 | POSTServiceURL | Y / Y | 74 |
| 27677 / 18608 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 27678 / 18608 | PostData_Function_UserName | Y / Y | 44 |
| 27679 / 18608 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27680 / 18608 | PostData_Function_SearchValue | Y / Y | 98 |
| 27681 / 18608 | Post_SuccessCallback | Y / Y | 114 |
| 27682 / 18608 | ModalDialogName | Y / Y | 42 |
| 27683 / 18609 | ModalDialogName | Y / Y | 42 |
| 27684 / 18610 | POSTServiceURL | Y / Y | 144 |
| 27685 / 18610 | Form_Id | Y / Y | 8 |
| 27686 / 18610 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 27687 / 18610 | PostData_Function_SearchValue | Y / Y | 98 |
| 27688 / 18610 | Post_SuccessCallback | Y / Y | 114 |
| 27689 / 18610 | ModalDialogName | Y / Y | 56 |
| 27690 / 18611 | ModalDialogName | Y / Y | 56 |
| 27691 / 18615 | ModalDialogName | Y / Y | 42 |
| 27692 / 18616 | ModalDialogName | Y / Y | 56 |
| 27693 / 18621 | URL | Y / Y | 168 |
| 27694 / 18622 | URL | Y / Y | 168 |
| 27695 / 18623 | ConfirmationMessageCode | Y / Y | 36 |
| 27696 / 18623 | POSTServiceURL | Y / Y | 128 |
| 27697 / 18623 | PostData_Grid_ListPaneDataGrid_InternalWorkOrderLineNum | Y / Y | 48 |
| 27698 / 18623 | Post_SuccessCallback | Y / Y | 140 |
| 27699 / 18624 | URL | Y / Y | 212 |
| 27700 / 18625 | POSTServiceURL | Y / Y | 136 |
| 27701 / 18625 | queryParameter_InternalWorkOrderLineNum | Y / Y | 48 |
| 27702 / 18625 | Post_SuccessCallback | Y / Y | 140 |
| 27703 / 18626 | URL | Y / Y | 418 |
| 27704 / 18630 | POSTServiceURL | Y / Y | 74 |
| 27705 / 18630 | PostData_internalWorkOrderLineNum | Y / Y | 48 |
| 27706 / 18630 | PostData_internalWorkOrderNum | Y / Y | 40 |
| 27707 / 18630 | PostData_storedProcedure | Y / Y | 58 |
| 27708 / 18630 | EnableAction_ListPaneMenuActionImmediateNeeds | Y / Y | 74 |
| 27709 / 18630 | EnableAction_ListPaneMenuActionDeleteWorkOrderDetails | Y / Y | 40 |
| 27710 / 18630 | EnableAction_ListPaneMenuActionAllocateWorkOrderDetails | Y / Y | 122 |
| 27711 / 18630 | EnableAction_ListPaneMenuActionDeallocateWorkOrderDetail | Y / Y | 194 |
| 27712 / 18630 | EnableAction_ListPaneMenuActionEdit | Y / Y | 40 |
| 27713 / 18630 | EnableAction_ListPaneMenuActionView | Y / Y | 40 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 33 selected candidate rows for this Screen: **33 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 41766 | 52642 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41767 | 52643 / Not applicable | data-securityCheckpoint | checkpoint | 25 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41768 | 52648 / Not applicable | data-formId | form_id | 4044 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41769 | 52649 / Not applicable | data-formId | form_id | 4044 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41770 | 52649 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41772 | 52650 / Not applicable | data-formId | form_id | 4044 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41774 | 52650 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41775 | 52651 / Not applicable | data-formId | form_id | 4047 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41776 | 52651 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41777 | 52652 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41778 | 52653 / Not applicable | data-formId | form_id | 2767 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41779 | 52653 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41780 | 52654 / Not applicable | data-dbcolumn | database_identifier | WORKORDERID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41782 | 52655 / Not applicable | data-dbcolumn | database_identifier | WDITEM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41784 | 52656 / Not applicable | data-dbcolumn | database_identifier | WDITEMDESC | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41785 | 52657 / Not applicable | data-dbcolumn | database_identifier | WDCOMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41786 | 52658 / Not applicable | data-dbcolumn | database_identifier | FROMLOCATION | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41789 | 52659 / Not applicable | data-dbcolumn | database_identifier | WHWAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41790 | 52660 / Not applicable | data-dbcolumn | database_identifier | INTERNALWORKORDERNUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41794 | 52665 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_WORK_ORDER_DETAIL_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27672 | 52634 / 18608 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27676 | 52634 / 18608 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27681 | 52634 / 18608 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27684 | 52637 / 18610 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27688 | 52637 / 18610 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27695 | 52650 / 18623 | ConfirmationMessageCode | resource_code | MSG_WORKORDERDEL01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27696 | 52650 / 18623 | POSTServiceURL | relative_api_path | /inventory/scaleapi/workOrderDetailsApi/WorkOrderDetails-Deleted | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27697 | 52650 / 18623 | PostData_Grid_ListPaneDataGrid_InternalWorkOrderLineNum | grid_field_identifier | InternalWorkOrderLineNum | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27698 | 52650 / 18623 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27700 | 52652 / 18625 | POSTServiceURL | relative_api_path | /inventory/scaleapi/workOrderDetailsApi/WorkOrderDetail-Deallocated? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27702 | 52652 / 18625 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27704 | 52665 / 18630 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27707 | 52665 / 18630 | PostData_storedProcedure | stored_procedure_identifier | WOD_LineInsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
