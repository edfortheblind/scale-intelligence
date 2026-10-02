# Replenishment Insight — Form 3046, Screen 1785

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3046 |
| MAIN_UI_SCREEN Object ID | 1785 |
| Label / Form resource key | Replenishment Insight / MNU_REPLENISHMENTINSIGHT |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/3046 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/3046 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3046 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | REPLENISHMENT_REQUEST |
| Help page reference | ReplenishmentInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3046 |
| Inspection time (UTC) | 2026-10-02T15:26:00.388Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_REPLENISHMENTINSIGHT |
| Observed configured table/view | REPLENISHMENT_REQUEST |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1785 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:14:25.538Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/insights/3046#search; Replenishment Insight | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

**Visible criteria / entry fields:** From Location; To Location; Item; Company; Wave Number; Original Wave Number; From Work Zone; To Work Zone; Allocation Zone; From Request Date Time; To Request Date Time; Replenishment Type; Replenishment Master; From Warehouse; Work Created.

**Visible grid headers:** Icon; Internal Request Num; Item; Company; Description; Allocated Qty; Quantity UM; Lot; From Location; To Location; Marked for Work Creation; Allocation Zone; Replenishment Type; Replenishment Master; Wave Number; Original Wave Number; From Work Zone; To Work Zone; Work Created; Color.

**Observed action/menu labels:** View; Create Work Immediately; Mark for Work Creation.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Replenishment Insight is recorded as `insight`. Its saved configuration contains 6 parts, 21 groups, 44 controls, and 24 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4429 / SaveSearchModalDialog | Not populated / Not populated | 20 / 250 | Y / Y / Y | SaveSearchSaveButton |
| 4431 / InsightMenuPane | Not populated / Not populated | 10 / 500 | Y / Y / N | Not populated |
| 4432 / SearchPane | Not populated / Not populated | 10 / 750 | Y / Y / N | InsightMenuApply |
| 4433 / ListPane | Not populated / Not populated | 10 / 800 | Y / Y / N | Not populated |
| 4434 / DetailPane | Not populated / Not populated | 10 / 1250 | Y / Y / N | Not populated |
| 4430 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |

### Part 4429: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18228 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18228; default=None |
| 18229 / SaveSearchModalDialogHeader | 18228 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18228; default=None |
| 18230 / SaveSearchModalDialogBody | 18228 | Not populated / Not populated | 120 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=18228; default=None |
| 18231 / SaveSearchModalDialogFooter | 18228 | Not populated / Not populated | 130 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=18228; default=None |

#### Group 18230: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51970 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18231: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51971 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51972 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4431: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18236 / InsightMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=18236; default=None |
| 18237 / InsightMenuPanel | 18236 | Not populated / Not populated | 60 / 750 | Y / Y | Fixed to top=Y; loading=0; nested unit=18236; default=None |
| 18240 / MenuExportToExcelPanel | 18236 | Not populated / Not populated | 60 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=18236; default=None |
| 18238 / InsightMenuFavoritesDropdown | 18236 | Favorites / FAVORITES | 100 / 1000 | Y / Y | Fixed to top=N; loading=0; nested unit=18236; default=None |
| 18241 / InsightMenuActionsDropdown | 18236 | Actions / ACTIONS | 80 / 1000 | Y / Y | Fixed to top=N; loading=0; nested unit=18236; default=None |
| 18239 / InsightListPaneMenuPanel | 18236 | Not populated / Not populated | 60 / 1100 | Y / Y | Fixed to top=Y; loading=0; nested unit=18236; default=None |

#### Group 18237: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51976 / InsightMenuApply | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51977 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51978 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 450 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51979 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18240: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51984 / MenuExportToExcel | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18241: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51985 / ListPaneMenuActionView | View / VIEW | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 51986 / ListPaneMenuActionCreateWorkImmediately | Create Work Immediately / CREATEWORKIMMEDIATELY | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CREATEWORKIMMEDIATELY |
| 51987 / ListPaneMenuActionMarkForWorkCreation | Mark for Work Creation / MARKFORWORKCREATION | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=MARKFORWORKCREATION |

#### Group 18239: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51980 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51981 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 51982 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51983 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

### Part 4432: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18242 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18242; default=None |
| 18243 / SearchPaneBasicCriteria | 18242 | Basic Criteria / BASICCRITERIA | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=18242; default=None |
| 18244 / SearchPaneAdvancedCriteria | 18242 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=18242; default=None |

#### Group 18243: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51988 / BasicCriteriaFromLocation | From Location / FROMLOC | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51989 / BasicCriteriaToLocation | To Location / TOLOC | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51990 / BasicCriteriaItem | Item / ITEM | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51991 / SearchPaneCompany | Company / COMPANY | 280 / 1000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51992 / BasicCriteriaWaveNumber | Wave Number / LAUNCHNUM | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51993 / BasicCriteriaOriginalWaveNumber | Original Wave Number / ORIGINALWAVENUM | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51994 / BasicCriteriaFromWorkZone | From Work Zone / FROMWORKZONE | 80 / 1750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51995 / BasicCriteriaToWrkZone | To Work Zone / TOWORKZONE | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51996 / BasicCriteriaAllocationZone | Allocation Zone / ALLOCATIONZONE | 80 / 2250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51997 / BasicCriteriaFromRequestDateRange | Request Date Time / REQUESTDATETIME | 190 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51998 / BasicCriteriaReplenishmentType | Replenishment Type / REPLENISHMENTTYPE | 80 / 2750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51999 / BasicCriteriaReplenishmentMaster | Replenishment Master / REPLENISHMENTMASTER | 80 / 3000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52000 / SearchPaneWarehouse | From Warehouse / FROMWHS | 280 / 3250 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52001 / BasicCriteriaWorkCreated | Work Created / WORKCREATED | 80 / 3500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18244: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52002 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 250 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4433: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18245 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18245; default=None |
| 18246 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=18246; default=None |

#### Group 18245: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52003 / ListPaneSummaryRequests | Requests / REQUESTS | 50 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52004 / ListPaneSummaryForwardLocation | To Location / TOLOCATION | 50 / 2750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52005 / ListPaneSummaryReserveLocation | From Location / FROMLOCATION | 50 / 3000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18246: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52006 / ListPaneDataGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 52006 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18624 / ICON | Not populated / Icon / ICON | 10 / 10 / 250 / 45 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18627 / InternalReplenishReqNum | Not populated / Internal Request Num / INTERNALREQUESTNUM | 10 / 10 / 600 / Not populated | Y / Y / N | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18628 / Item | Not populated / Not populated / Not populated | 10 / 10 / 750 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18629 / Company | Not populated / Company / COMPANY | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18630 / ItemDesc | Not populated / Description / ITEM_DESCRIPTION | 10 / 10 / 1250 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18631 / AllocatedQuantity | Not populated / Allocated Qty / ALLOCATEDQTY | 20 / 10 / 1500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18632 / QuantityUm | Not populated / Quantity UM / QUANTITYUM | 10 / 10 / 1750 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18633 / Lot | Not populated / Lot / LOT | 10 / 10 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18634 / FromLocation | Not populated / From Location / FROMLOC | 10 / 10 / 2250 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18635 / ToLocation | Not populated / To Location / TOLOC | 10 / 10 / 2750 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18636 / MarkedForWorkCreation | Not populated / Marked for Work Creation / MARKEDFORWORKCREATION | 40 / 10 / 3000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18637 / AllocationZone | Not populated / Allocation Zone / ALLOCATIONZONE | 10 / 10 / 3250 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18638 / ReplenishmentType | Not populated / Replenishment Type / REPLENISHMENTTYPE | 10 / 10 / 3500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18639 / ReplenishmentMaster | Not populated / Replenishment Master / REPLENISHMENTMASTER | 10 / 10 / 3750 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18640 / LaunchNum | Not populated / Wave Number / LAUNCHNUM | 10 / 10 / 4000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18641 / OriginalWaveNum | Not populated / Original Wave Number / ORIGINALWAVENUM | 10 / 10 / 4250 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18642 / FromWorkZone | Not populated / From Work Zone / FROMWORKZONE | 10 / 10 / 4500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18643 / ToWorkZone | Not populated / To Work Zone / TOWORKZONE | 10 / 10 / 4750 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18644 / WorkCreated | Not populated / Work Created / WORKCREATED | 10 / 10 / 5000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18645 / FromWarehouse | Not populated / From Warehouse / FROMWHS | 10 / 10 / 5200 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18646 / DateTimeStamp | Not populated / Date Time Stamp / DATE_TIME_STAMP | 30 / 10 / 5250 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18647 / InternalReplenishReqNum | INTERNAL_RPLN_REQ_NUM / Internal Request Num / INTERNALREQUESTNUM | 10 / 20 / 5500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18626 / COLOR | Not populated / Color / COLOR | 10 / 10 / 5600 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18625 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 5610 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4434: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18247 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18247; default=None |
| 18248 / indicatorpane | Not populated | Not populated / Not populated | 60 / 17500 | Y / Y | Fixed to top=N; loading=0; nested unit=18248; default=None |

#### Group 18247: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52007 / DetailPaneHeaderInternalRequestNum | Internal Request Num / INTERNALREQUESTNUM | 240 / 100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=603; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52008 / DetailPaneHeaderItem | Item / ITEM | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=603; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52009 / DetailPaneHeaderCompany | Company / COMPANY | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=603; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52010 / DetailPaneHeaderItemDesc | Not populated / Not populated | 30 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=603; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52011 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=603; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18248: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52012 / InventoryInsightIndicatorTileOpenWork | Open Work / OPEN_WORK | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52013 / ReplenishmentInsightIndicatorTileTransactions | Transactions / TRANSACTIONS | 360 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4430: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18232 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18232; default=None |
| 18233 / GadgetCalculationQueryDialogHeader | 18232 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18232; default=None |
| 18234 / GadgetCalculationQueryDialogBody | 18232 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18232; default=None |
| 18235 / GadgetCalculationQueryDialogFooter | 18232 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18232; default=None |

#### Group 18234: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51973 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18235: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51974 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51975 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 42 control attributes, 20 events, and 34 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 41090 | 51970 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 41091 | 51970 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 41092 | 51979 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41093 | 51980 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41094 | 51985 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 41095 | 51985 / ListPaneMenuActionView | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41096 | 51985 / ListPaneMenuActionView | data-divider | Y / Y / N | 8 / 0 |
| 41097 | 51986 / ListPaneMenuActionCreateWorkImmediately | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41098 | 51986 / ListPaneMenuActionCreateWorkImmediately | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41099 | 51987 / ListPaneMenuActionMarkForWorkCreation | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41100 | 51987 / ListPaneMenuActionMarkForWorkCreation | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41101 | 51988 / BasicCriteriaFromLocation | data-dbcolumn | Y / Y / N | 16 / 0 |
| 41102 | 51988 / BasicCriteriaFromLocation | Lookup | Y / Y / N | 86 / 1 |
| 41103 | 51989 / BasicCriteriaToLocation | data-dbcolumn | Y / Y / N | 12 / 0 |
| 41104 | 51989 / BasicCriteriaToLocation | Lookup | Y / Y / N | 82 / 1 |
| 41105 | 51990 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 41106 | 51990 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 41107 | 51991 / SearchPaneCompany | data-dbcolumn | Y / Y / N | 14 / 0 |
| 41108 | 51992 / BasicCriteriaWaveNumber | data-dbcolumn | Y / Y / N | 20 / 0 |
| 41109 | 51993 / BasicCriteriaOriginalWaveNumber | data-dbcolumn | Y / Y / N | 34 / 0 |
| 41110 | 51994 / BasicCriteriaFromWorkZone | data-dbcolumn | Y / Y / N | 28 / 0 |
| 41111 | 51995 / BasicCriteriaToWrkZone | data-dbcolumn | Y / Y / N | 24 / 0 |
| 41112 | 51996 / BasicCriteriaAllocationZone | data-dbcolumn | Y / Y / N | 30 / 0 |
| 41113 | 51997 / BasicCriteriaFromRequestDateRange | data-dbcolumn | Y / Y / N | 30 / 0 |
| 41114 | 51998 / BasicCriteriaReplenishmentType | data-dbcolumn | Y / Y / N | 36 / 0 |
| 41115 | 51999 / BasicCriteriaReplenishmentMaster | data-dbcolumn | Y / Y / N | 40 / 0 |
| 41116 | 52000 / SearchPaneWarehouse | defaultValue | Y / Y / Y | 32 / 0 |
| 41117 | 52000 / SearchPaneWarehouse | data-dbcolumn | Y / Y / N | 16 / 0 |
| 41118 | 52001 / BasicCriteriaWorkCreated | data-dbcolumn | Y / Y / N | 24 / 0 |
| 41119 | 52001 / BasicCriteriaWorkCreated | data-positiveCondition | Y / Y / N | 10 / 0 |
| 41120 | 52001 / BasicCriteriaWorkCreated | data-negativeCondition | Y / Y / N | 10 / 0 |
| 41121 | 52004 / ListPaneSummaryForwardLocation | data-aggregateClause | Y / Y / Y | 44 / 0 |
| 41122 | 52005 / ListPaneSummaryReserveLocation | data-aggregateClause | Y / Y / Y | 48 / 0 |
| 41123 | 52006 / ListPaneDataGrid | data-dbtable | Y / Y / N | 42 / 0 |
| 41124 | 52006 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 20 / 0 |
| 41125 | 52006 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 34 / 0 |
| 41126 | 52006 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 60 / 0 |
| 41127 | 52006 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 41128 | 52006 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 41129 | 52007 / DetailPaneHeaderInternalRequestNum | href | Y / Y / Y | 164 / 0 |
| 41130 | 52012 / InventoryInsightIndicatorTileOpenWork | data-indicatorTileGoToInsight | Y / Y / Y | 304 / 0 |
| 41131 | 52013 / ReplenishmentInsightIndicatorTileTransactions | data-indicatorTileGoToInsight | Y / Y / Y | 390 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18234 / click | 51971 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18235 / click | 51972 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18236 / click | 51974 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18237 / click | 51975 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18238 / click | 51976 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18239 / click | 51977 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18240 / click | 51978 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18241 / click | 51979 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18242 / click | 51980 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18243 / click | 51981 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 18244 / click | 51982 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18245 / click | 51983 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18246 / click | 51984 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18247 / click | 51985 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18248 / click | 51986 / ListPaneMenuActionCreateWorkImmediately | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18249 / click | 51987 / ListPaneMenuActionMarkForWorkCreation | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18250 / iggridrequesterror | 52006 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18251 / iggriddatabound | 52006 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18252 / iggridselectionrowselectionchanged | 52006 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18253 / iggridselectionactiverowchanged | 52006 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 26908 / 18234 | GETServiceURL | Y / Y | 76 |
| 26909 / 18234 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 26910 / 18234 | queryParameter_Function_UserName | Y / Y | 44 |
| 26911 / 18234 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26912 / 18234 | POSTServiceURL | Y / Y | 74 |
| 26913 / 18234 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 26914 / 18234 | PostData_Function_UserName | Y / Y | 44 |
| 26915 / 18234 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26916 / 18234 | PostData_Function_SearchValue | Y / Y | 98 |
| 26917 / 18234 | Post_SuccessCallback | Y / Y | 114 |
| 26918 / 18234 | ModalDialogName | Y / Y | 42 |
| 26919 / 18235 | ModalDialogName | Y / Y | 42 |
| 26920 / 18236 | POSTServiceURL | Y / Y | 144 |
| 26921 / 18236 | Form_Id | Y / Y | 8 |
| 26922 / 18236 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26923 / 18236 | PostData_Function_SearchValue | Y / Y | 98 |
| 26924 / 18236 | Post_SuccessCallback | Y / Y | 114 |
| 26925 / 18236 | ModalDialogName | Y / Y | 56 |
| 26926 / 18237 | ModalDialogName | Y / Y | 56 |
| 26927 / 18241 | ModalDialogName | Y / Y | 42 |
| 26928 / 18242 | ModalDialogName | Y / Y | 56 |
| 26929 / 18247 | URL | Y / Y | 164 |
| 26930 / 18248 | POSTServiceURL | Y / Y | 140 |
| 26931 / 18248 | PostData_Grid_ListPaneDataGrid_InternalRplnReqNum | Y / Y | 46 |
| 26932 / 18248 | Post_SuccessCallback | Y / Y | 140 |
| 26933 / 18249 | POSTServiceURL | Y / Y | 160 |
| 26934 / 18249 | PostData_Grid_ListPaneDataGrid_InternalRplnReqNum | Y / Y | 46 |
| 26935 / 18249 | Post_SuccessCallback | Y / Y | 140 |
| 26936 / 18253 | POSTServiceURL | Y / Y | 74 |
| 26937 / 18253 | PostData_InternalReplenishReqNum | Y / Y | 46 |
| 26938 / 18253 | PostData_storedProcedure | Y / Y | 70 |
| 26939 / 18253 | EnableAction_ListPaneMenuActionCreateWorkImmediately | Y / Y | 36 |
| 26940 / 18253 | EnableAction_ListPaneMenuActionMarkForWorkCreation | Y / Y | 106 |
| 26941 / 18253 | EnableAction_ListPaneMenuActionView | Y / Y | 64 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 34 selected candidate rows for this Screen: **34 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 41092 | 51979 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41093 | 51980 / Not applicable | data-securityCheckpoint | checkpoint | 26 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41094 | 51985 / Not applicable | data-formId | form_id | 3004 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41095 | 51985 / Not applicable | data-securityCheckpoint | checkpoint | 6 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41098 | 51986 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41100 | 51987 / Not applicable | data-securityCheckpoint | checkpoint | 25 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41101 | 51988 / Not applicable | data-dbcolumn | database_identifier | From_Loc | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41103 | 51989 / Not applicable | data-dbcolumn | database_identifier | To_Loc | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41105 | 51990 / Not applicable | data-dbcolumn | database_identifier | Item | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41107 | 51991 / Not applicable | data-dbcolumn | database_identifier | Company | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41108 | 51992 / Not applicable | data-dbcolumn | database_identifier | Launch_Num | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41109 | 51993 / Not applicable | data-dbcolumn | database_identifier | Original_Wave_Num | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41110 | 51994 / Not applicable | data-dbcolumn | database_identifier | From_Work_Zone | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41111 | 51995 / Not applicable | data-dbcolumn | database_identifier | To_Work_Zone | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41112 | 51996 / Not applicable | data-dbcolumn | database_identifier | Allocation_Zone | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41113 | 51997 / Not applicable | data-dbcolumn | database_identifier | Date_Time_Stamp | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41114 | 51998 / Not applicable | data-dbcolumn | database_identifier | Replenishment_Type | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41115 | 51999 / Not applicable | data-dbcolumn | database_identifier | Replenishment_Master | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41117 | 52000 / Not applicable | data-dbcolumn | database_identifier | From_Whs | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41118 | 52001 / Not applicable | data-dbcolumn | database_identifier | Work_Created | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41123 | 52006 / Not applicable | data-dbtable | database_identifier | REPLENISHMENT_REQUEST | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26908 | 51971 / 18234 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26912 | 51971 / 18234 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26917 | 51971 / 18234 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26920 | 51974 / 18236 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26924 | 51974 / 18236 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26930 | 51986 / 18248 | POSTServiceURL | relative_api_path | /Inventory/scaleapi/ReplenishmentApi/ReplenishmentRequests-WorkCreated | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26931 | 51986 / 18248 | PostData_Grid_ListPaneDataGrid_InternalRplnReqNum | grid_field_identifier | InternalReplenishReqNum | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26932 | 51986 / 18248 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26933 | 51987 / 18249 | POSTServiceURL | relative_api_path | /Inventory/scaleapi/ReplenishmentApi/ReplenishmentRequests-MarkedForWorkCreation | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26934 | 51987 / 18249 | PostData_Grid_ListPaneDataGrid_InternalRplnReqNum | grid_field_identifier | InternalReplenishReqNum | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26935 | 51987 / 18249 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26936 | 52006 / 18253 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26938 | 52006 / 18253 | PostData_storedProcedure | stored_procedure_identifier | Replenishment_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
