# Lot Insight — Form 2768, Screen 1770

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2768 |
| MAIN_UI_SCREEN Object ID | 1770 |
| Label / Form resource key | Lot Insight / MNU_LOTINSIGHT |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2768 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2768 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2768 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | LOT_VIEW |
| Help page reference | useLots.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2768 |
| Inspection time (UTC) | 2026-10-02T15:23:50.022Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_LOTINSIGHT |
| Observed configured table/view | LOT_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1770 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:14:11.268Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/insights/2768#search; Lot Insight | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

**Visible criteria / entry fields:** Lot; Item; Company; From Expiration Date; To Expiration Date; Inventory Status; Warehouse.

**Visible grid headers:** Lot; Item; Description; Company; Inventory Status; Expiration; Locations; Frozen; Color.

**Observed action/menu labels:** Edit; Adjust; Status Change; Transfer.

**Page groups:** Basic Criteria; Condition; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Lot Insight is recorded as `insight`. Its saved configuration contains 6 parts, 21 groups, 36 controls, and 14 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4337 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4338 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4339 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4340 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4341 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4342 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4337: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17914 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17914; default=None |
| 17915 / SaveSearchModalDialogHeader | 17914 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17914; default=None |
| 17916 / SaveSearchModalDialogBody | 17914 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17914; default=None |
| 17917 / SaveSearchModalDialogFooter | 17914 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17914; default=None |

#### Group 17916: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51371 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17917: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51372 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51373 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4338: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17918 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17918; default=None |
| 17919 / GadgetCalculationQueryDialogHeader | 17918 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17918; default=None |
| 17920 / GadgetCalculationQueryDialogBody | 17918 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17918; default=None |
| 17921 / GadgetCalculationQueryDialogFooter | 17918 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17918; default=None |

#### Group 17920: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51374 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17921: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51375 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51376 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4339: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17922 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17922; default=None |
| 17923 / InsightMenuPanel | 17922 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=17922; default=None |
| 17924 / InsightMenuFavoritesDropdown | 17922 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=17922; default=None |
| 17925 / InsightListPaneMenuPanel | 17922 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17922; default=None |
| 17926 / MenuExportToExcelPanel | 17922 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=17922; default=None |
| 17927 / InsightMenuActionsDropdown | 17922 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=17922; default=None |

#### Group 17923: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51377 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51378 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51379 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51380 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17925: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51381 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51382 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51383 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 17926: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51384 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 17927: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51385 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 51386 / ListPaneMenuActionView | View / VIEW | 150 / 3050 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 51387 / ListPaneMenuActionAdjust | Adjust / ADJUST | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ADJUST |
| 51388 / ListPaneMenuActionStatusChange | Status Change / STATUSCHANGE | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=STATUSCHANGE |
| 51389 / ListPaneMenuActionTransfer | Transfer / TRANSFER | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TRANSFER |

### Part 4340: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17928 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17928; default=None |
| 17929 / SearchPaneBasicCriteria | 17928 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=17928; default=None |
| 17930 / SearchPaneCondition | 17928 | Condition / CONDITION | 50 / 11500 | Y / Y | Fixed to top=N; loading=0; nested unit=17928; default=None |
| 17931 / SearchPaneAdvancedCriteria | 17928 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=17928; default=None |

#### Group 17929: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51390 / BasicCriteriaLot | Lot / LOT | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51391 / BasicCriteriaItem | Item / ITEM | 10 / 6000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51395 / SearchPaneComp | Company / COMPANY | 280 / 7500 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51392 / BasicCriteriaExpirationDateRange | Expiration Date / EXPIRATIONDATE | 190 / 8000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51393 / BasicCriteriaInventorySTS | Inventory Status / INVENTORYSTS | 80 / 9000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51394 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 10000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17930: SearchPaneCondition — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51396 / SearchPaneConditionFrozenLot | Show Frozen Lots / SHOWFROZENLOTS | 130 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51397 / SearchPaneConditionaArchivedLot | Include Archived Lots / INCLUDEARCHIVEDLOTS | 130 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17931: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51398 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4341: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17932 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17932; default=None |

#### Group 17932: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51399 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51399 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18319 / Lot | LOT / Not populated / Lot | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18321 / Item | ITEM / Not populated / Item | 10 / 10 / 1100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18322 / DESCRIPTION | DESCRIPTION / Description / DESCRIPTION | 10 / 10 / 1150 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18323 / COMPANY | COMPANY / Not populated / Company | 10 / 10 / 1200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18324 / INVENTORY_STS | INVENTORY_STS / Inventory Status / INVENTORYSTS | 10 / 10 / 1400 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18325 / EXPIRATION_DATE | EXPIRATION_DATE / Expiration / EXPIRATION | 30 / 10 / 1500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18326 / LOCATIONS | LOCATIONS / Locations / LOCATIONS | 10 / 10 / 1600 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18327 / FROZEN | Not populated / Frozen / FROZEN | 40 / 10 / 1700 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18328 / Warehouse | WAREHOUSE / Warehouse / WAREHOUSE | 10 / 10 / 1750 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18329 / ARCHIVED_LOT | ARCHIVED_LOT / Archived Lot / ARCHIVED_LOT | 10 / 10 / 1775 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18330 / OBJECT_ID | OBJECT_ID / Not populated / objectid | 20 / 10 / 1800 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18331 / ICON | Not populated / Icon / ICON | 10 / 10 / 1900 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18332 / COLOR | Not populated / Color / COLOR | 10 / 10 / 2000 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18320 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 2010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4342: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17933 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17933; default=None |
| 17934 / indicatorpane | Not populated | Not populated / Not populated | 60 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=17934; default=None |

#### Group 17933: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51400 / DetailPaneHeaderLot | Not populated / Not populated | 240 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=588; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51401 / DetailPaneHeaderItem | Not populated / Not populated | 30 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=588; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51402 / DetailPaneHeaderItemDesc | Not populated / Not populated | 30 / 5500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=588; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51403 / DetailPaneHeaderCompany | Not populated / Not populated | 30 / 6000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=588; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51404 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 7500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=588; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17934: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51405 / LotInsightIndicatorTileLocations | Locations / LOCATIONS | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51406 / LotInsightIndicatorTileTransactions | Transactions / TRANSACTIONS | 360 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 39 control attributes, 21 events, and 50 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40511 | 51371 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40512 | 51371 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40513 | 51380 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40514 | 51381 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40515 | 51385 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 40516 | 51385 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40517 | 51385 / ListPaneMenuActionEdit | data-divider | Y / Y / N | 8 / 0 |
| 40518 | 51386 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 40519 | 51386 / ListPaneMenuActionView | data-divider | Y / Y / N | 8 / 0 |
| 40520 | 51387 / ListPaneMenuActionAdjust | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40521 | 51387 / ListPaneMenuActionAdjust | data-formId | Y / Y / N | 8 / 0 |
| 40522 | 51387 / ListPaneMenuActionAdjust | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40523 | 51388 / ListPaneMenuActionStatusChange | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40524 | 51388 / ListPaneMenuActionStatusChange | data-formId | Y / Y / N | 8 / 0 |
| 40525 | 51388 / ListPaneMenuActionStatusChange | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40526 | 51389 / ListPaneMenuActionTransfer | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40527 | 51389 / ListPaneMenuActionTransfer | data-formId | Y / Y / N | 8 / 0 |
| 40528 | 51389 / ListPaneMenuActionTransfer | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40529 | 51390 / BasicCriteriaLot | data-dbcolumn | Y / Y / N | 6 / 0 |
| 40530 | 51391 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 40531 | 51391 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 40537 | 51395 / SearchPaneComp | data-dbcolumn | Y / Y / N | 14 / 0 |
| 40532 | 51392 / BasicCriteriaExpirationDateRange | data-dbcolumn | Y / Y / N | 30 / 0 |
| 40533 | 51392 / BasicCriteriaExpirationDateRange | data-dateOnly | Y / Y / Y | 8 / 0 |
| 40534 | 51393 / BasicCriteriaInventorySTS | data-dbcolumn | Y / Y / N | 26 / 0 |
| 40535 | 51394 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 40536 | 51394 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40538 | 51396 / SearchPaneConditionFrozenLot | data-dbcolumn | Y / Y / N | 12 / 0 |
| 40539 | 51396 / SearchPaneConditionFrozenLot | data-positiveCondition | Y / Y / N | 12 / 0 |
| 40540 | 51396 / SearchPaneConditionFrozenLot | data-negativeCondition | Y / Y / N | 10 / 0 |
| 40541 | 51397 / SearchPaneConditionaArchivedLot | data-dbcolumn | Y / Y / N | 24 / 0 |
| 40542 | 51397 / SearchPaneConditionaArchivedLot | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40543 | 51397 / SearchPaneConditionaArchivedLot | data-negativeCondition | Y / Y / N | 8 / 0 |
| 40544 | 51399 / ListPaneDataGrid | data-dbtable | Y / Y / N | 16 / 0 |
| 40545 | 51399 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 40546 | 51399 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 40547 | 51400 / DetailPaneHeaderLot | href | Y / Y / Y | 138 / 0 |
| 40548 | 51405 / LotInsightIndicatorTileLocations | data-indicatorTileGoToInsight | Y / Y / Y | 274 / 0 |
| 40549 | 51406 / LotInsightIndicatorTileTransactions | data-indicatorTileGoToInsight | Y / Y / Y | 380 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17891 / click | 51372 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 17892 / click | 51373 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17893 / click | 51375 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 17894 / click | 51376 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17895 / click | 51377 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 17896 / click | 51378 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 17897 / click | 51379 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 17898 / click | 51380 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17899 / click | 51381 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17900 / click | 51382 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 17901 / click | 51383 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 17902 / click | 51384 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 17903 / click | 51385 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17904 / click | 51386 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17905 / click | 51387 / ListPaneMenuActionAdjust | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17906 / click | 51388 / ListPaneMenuActionStatusChange | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17907 / click | 51389 / ListPaneMenuActionTransfer | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17908 / iggridrequesterror | 51399 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 17909 / iggriddatabound | 51399 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 17910 / iggridselectionrowselectionchanged | 51399 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 17911 / iggridselectionactiverowchanged | 51399 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 26221 / 17891 | GETServiceURL | Y / Y | 76 |
| 26222 / 17891 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 26223 / 17891 | queryParameter_Function_UserName | Y / Y | 44 |
| 26224 / 17891 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26225 / 17891 | POSTServiceURL | Y / Y | 74 |
| 26226 / 17891 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 26227 / 17891 | PostData_Function_UserName | Y / Y | 44 |
| 26228 / 17891 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26229 / 17891 | PostData_Function_SearchValue | Y / Y | 98 |
| 26230 / 17891 | Post_SuccessCallback | Y / Y | 114 |
| 26231 / 17891 | ModalDialogName | Y / Y | 42 |
| 26232 / 17892 | ModalDialogName | Y / Y | 42 |
| 26233 / 17893 | POSTServiceURL | Y / Y | 144 |
| 26234 / 17893 | Form_Id | Y / Y | 8 |
| 26235 / 17893 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26236 / 17893 | PostData_Function_SearchValue | Y / Y | 98 |
| 26237 / 17893 | Post_SuccessCallback | Y / Y | 114 |
| 26238 / 17893 | ModalDialogName | Y / Y | 56 |
| 26239 / 17894 | ModalDialogName | Y / Y | 56 |
| 26240 / 17898 | ModalDialogName | Y / Y | 42 |
| 26241 / 17899 | ModalDialogName | Y / Y | 56 |
| 26242 / 17903 | URL | Y / Y | 138 |
| 26243 / 17903 | queryParameter_ObjectId | Y / Y | 16 |
| 26244 / 17903 | queryParameter_Grid_ListPaneDataGrid_ArchivedLot | Y / Y | 24 |
| 26245 / 17904 | URL | Y / Y | 138 |
| 26246 / 17904 | queryParameter_ObjectId | Y / Y | 16 |
| 26247 / 17904 | queryParameter_Grid_ListPaneDataGrid_ArchivedLot | Y / Y | 24 |
| 26248 / 17905 | URL | Y / Y | 234 |
| 26249 / 17905 | queryParameter_Item | Y / Y | 8 |
| 26250 / 17905 | queryParameter_Company | Y / Y | 14 |
| 26251 / 17905 | queryParameter_Grid_DetailPaneDetailsReferenceInfo_Warehouse | Y / Y | 18 |
| 26252 / 17905 | queryParameter_Lot | Y / Y | 6 |
| 26253 / 17905 | queryParameter_Grid_DetailPaneDetailsLotInfo_Inventorystatus | Y / Y | 30 |
| 26254 / 17906 | URL | Y / Y | 226 |
| 26255 / 17906 | queryParameter_Grid_ListPaneDataGrid_InternalLocationInv | Y / Y | 42 |
| 26256 / 17906 | queryParameter_Warehouse | Y / Y | 18 |
| 26257 / 17907 | URL | Y / Y | 230 |
| 26258 / 17907 | queryParameter_Item | Y / Y | 8 |
| 26259 / 17907 | queryParameter_Company | Y / Y | 14 |
| 26260 / 17907 | queryParameter_Grid_DetailPaneDetailsReferenceInfo_Warehouse | Y / Y | 18 |
| 26261 / 17907 | queryParameter_Lot | Y / Y | 6 |
| 26262 / 17907 | queryParameter_Grid_DetailPaneDetailsLotInfo_Inventorystatus | Y / Y | 30 |
| 26263 / 17911 | POSTServiceURL | Y / Y | 74 |
| 26264 / 17911 | PostData_objectid | Y / Y | 18 |
| 26265 / 17911 | PostData_storedProcedure | Y / Y | 56 |
| 26266 / 17911 | EnableAction_ListPaneMenuActionView | Y / Y | 24 |
| 26267 / 17911 | EnableAction_ListPaneMenuActionAdjust | Y / Y | 24 |
| 26268 / 17911 | EnableAction_ListPaneMenuActionStatusChange | Y / Y | 64 |
| 26269 / 17911 | EnableAction_ListPaneMenuActionTransfer | Y / Y | 24 |
| 26270 / 17911 | EnableAction_ListPaneMenuActionEdit | Y / Y | 24 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 34 selected candidate rows for this Screen: **34 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40513 | 51380 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40514 | 51381 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40515 | 51385 / Not applicable | data-formId | form_id | 3001 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40516 | 51385 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40518 | 51386 / Not applicable | data-formId | form_id | 3001 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40521 | 51387 / Not applicable | data-formId | form_id | 2772 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40522 | 51387 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40524 | 51388 / Not applicable | data-formId | form_id | 4056 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40525 | 51388 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40527 | 51389 / Not applicable | data-formId | form_id | 2775 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40528 | 51389 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40529 | 51390 / Not applicable | data-dbcolumn | database_identifier | LOT | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40530 | 51391 / Not applicable | data-dbcolumn | database_identifier | Item | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40532 | 51392 / Not applicable | data-dbcolumn | database_identifier | EXPIRATION_DATE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40534 | 51393 / Not applicable | data-dbcolumn | database_identifier | INVENTORY_STS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40536 | 51394 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40537 | 51395 / Not applicable | data-dbcolumn | database_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40538 | 51396 / Not applicable | data-dbcolumn | database_identifier | FROZEN | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40541 | 51397 / Not applicable | data-dbcolumn | database_identifier | ARCHIVED_LOT | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40544 | 51399 / Not applicable | data-dbtable | database_identifier | LOT_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26221 | 51372 / 17891 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26225 | 51372 / 17891 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26230 | 51372 / 17891 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26233 | 51375 / 17893 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26237 | 51375 / 17893 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26244 | 51385 / 17903 | queryParameter_Grid_ListPaneDataGrid_ArchivedLot | grid_field_identifier | ARCHIVED_LOT | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26247 | 51386 / 17904 | queryParameter_Grid_ListPaneDataGrid_ArchivedLot | grid_field_identifier | ARCHIVED_LOT | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26251 | 51387 / 17905 | queryParameter_Grid_DetailPaneDetailsReferenceInfo_Warehouse | grid_field_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26253 | 51387 / 17905 | queryParameter_Grid_DetailPaneDetailsLotInfo_Inventorystatus | grid_field_identifier | Inventorystatus | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26255 | 51388 / 17906 | queryParameter_Grid_ListPaneDataGrid_InternalLocationInv | grid_field_identifier | INTERNAL_LOCATION_INV | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26260 | 51389 / 17907 | queryParameter_Grid_DetailPaneDetailsReferenceInfo_Warehouse | grid_field_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26262 | 51389 / 17907 | queryParameter_Grid_DetailPaneDetailsLotInfo_Inventorystatus | grid_field_identifier | Inventorystatus | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26263 | 51399 / 17911 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26265 | 51399 / 17911 | PostData_storedProcedure | stored_procedure_identifier | INV_LotInsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
