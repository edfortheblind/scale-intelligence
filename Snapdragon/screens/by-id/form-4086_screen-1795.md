# Warehouse Mobile Menu Insight — Form 4086, Screen 1795

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4086 |
| MAIN_UI_SCREEN Object ID | 1795 |
| Label / Form resource key | Warehouse Mobile Menu Insight / MNU_WAREHOUSEMOBILEMENUINSIGHT |
| Functional area code | 120 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/4086 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/4086 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4086 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_WAREHOUSE_MOBILE_MENU_VIEW |
| Help page reference | WMmobileMenuInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4086 |
| Inspection time (UTC) | 2026-10-02T15:30:01.023Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_WAREHOUSEMOBILEMENUINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_WAREHOUSE_MOBILE_MENU_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1795 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:14:54.021Z | loaded; runtime_inspection | https://trav.manhscale.com/scale/insights/4086; Warehouse Mobile Menu Insight | [runtime-root.json](../../evidence/runtime-root.json) |

**Visible criteria / entry fields:** Menu Option Name; Menu Resource Key; Submenu Name; Submenu Resource Key; SRC Identifier; Parent.

**Visible grid headers:** Field; Operand; Value; Menu Option Name; Submenu Name; Sequence; SRC Identifier; Parent; Menu Resource Key; Submenu Resource Key; Object ID; Parent Object ID; Menu Group; System Created; Active; Icon; Color.

**Observed action/menu labels:** Actions; New; Edit; Delete.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Warehouse Mobile Menu Insight is recorded as `insight`. Its saved configuration contains 6 parts, 19 groups, 27 controls, and 15 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4489 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4490 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4491 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4492 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4493 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4494 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4489: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18431 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18431; default=None |
| 18432 / SaveSearchModalDialogHeader | 18431 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18431; default=None |
| 18433 / SaveSearchModalDialogBody | 18431 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18431; default=None |
| 18434 / SaveSearchModalDialogFooter | 18431 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18431; default=None |

#### Group 18433: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52376 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18434: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52377 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52378 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4490: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18435 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18435; default=None |
| 18436 / GadgetCalculationQueryDialogHeader | 18435 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18435; default=None |
| 18437 / GadgetCalculationQueryDialogBody | 18435 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18435; default=None |
| 18438 / GadgetCalculationQueryDialogFooter | 18435 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18435; default=None |

#### Group 18437: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52379 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18438: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52380 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52381 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4491: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18439 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18439; default=None |
| 18440 / InsightMenuPanel | 18439 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18439; default=None |
| 18441 / InsightMenuFavoritesDropdown | 18439 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18439; default=None |
| 18442 / InsightListPaneMenuPanel | 18439 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18439; default=None |
| 18443 / MenuExportToExcelPanel | 18439 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18439; default=None |
| 18444 / InsightMenuActionsDropdown | 18439 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18439; default=None |

#### Group 18440: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52382 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 52383 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 52384 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 52385 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18442: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52386 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52387 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 52388 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18443: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52389 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18444: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52390 / ListPaneMenuActionNew | New / NEW | 150 / 2200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEW |
| 52391 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 2300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 52392 / ListPaneMenuActionDeleteMenu | Delete / DELETE | 150 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |

### Part 4492: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18445 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18445; default=None |
| 18446 / SearchPaneBasicCriteria | 18445 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18445; default=None |
| 18447 / SearchPaneAdvancedCriteria | 18445 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=18445; default=None |

#### Group 18446: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52393 / BasicCriteriaMenuOptionName | Menu Option Name / MENUOPTIONNAME | 10 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52394 / BasicCriteriaMenuResourceKey | Menu Resource Key / MENURESOURCEKEY | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52395 / BasicCriteriaSubmenuScreenName | Submenu Name / SUBMENUNAME | 10 / 6000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52396 / BasicCriteriaSubmenuResourceKey | Submenu Resource Key / SUBMENURESOURCEKEY | 10 / 6500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52397 / BasicCriteriaSRCIdentifier | SRC Identifier / SRCIDENTIFIER | 80 / 6600 | Y / Y | DATA_SOURCE_TYPE=30; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52398 / BasicCriteriaParent | Parent / PARENT | 80 / 6700 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18447: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52399 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4493: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18448 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18448; default=None |

#### Group 18448: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52400 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 52400 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18876 / MENU_GROUP | MENU_GROUP / Not populated / Not populated | Not populated / 50 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18865 / MENU_OPTION_NAME | MENU_OPTION_NAME / Menu Option Name / MENUOPTIONNAME | 10 / 10 / 100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18866 / SUBMENU_NAME | SUBMENU_NAME / Submenu Name / SUBMENUNAME | 10 / 10 / 300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18868 / SEQUENCE | SEQUENCE / Sequence / SEQUENCE | 10 / 10 / 400 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18869 / SRC_IDENTIFIER | Not populated / SRC Identifier / SRCIDENTIFIER | 10 / 10 / 450 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18870 / PARENT | PARENT / Parent / PARENT | 10 / 10 / 500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18871 / MENU_RESOURCE_KEY | MENU_RESOURCE_KEY / Menu Resource Key / MENURESOURCEKEY | 10 / 10 / 550 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18872 / SUBMENU_RESOURCE_KEY | SUBMENU_RESOURCE_KEY / Submenu Resource Key / SUBMENURESOURCEKEY | 10 / 10 / 600 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18873 / OBJECT_ID | OBJECT_ID / Object ID / OBJECT_ID | 10 / 10 / 700 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18874 / PARENT_OBJECT_ID | PARENT_OBJECT_ID / Parent Object ID / PARENT_OBJECT_ID | 10 / 10 / 800 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18875 / MENU_GROUP | MENU_GROUP / Menu Group / MENUGROUP | 10 / 10 / 1000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18877 / SYSTEM_CREATED | Not populated / System Created / SYSTEMCREATED | 10 / 10 / 1150 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18867 / ACTIVE | Not populated / Active / ACTIVE | 10 / 10 / 1175 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18878 / ICON | Not populated / Icon / ICON | 10 / 10 / 1200 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18879 / COLOR | Not populated / Color / COLOR | 10 / 10 / 3750 / 1 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4494: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18449 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18449; default=None |

#### Group 18449: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52401 / DetailPaneHeaderMenuOptionName | Not populated / Not populated | 240 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=613; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52402 / DetailPaneHeaderSRCIdentifier | Not populated / Not populated | 30 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=613; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 18 control attributes, 19 events, and 34 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 41499 | 52376 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 41500 | 52376 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 41501 | 52385 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41502 | 52386 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41503 | 52390 / ListPaneMenuActionNew | data-formId | Y / Y / N | 8 / 0 |
| 41504 | 52390 / ListPaneMenuActionNew | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41505 | 52391 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 41506 | 52391 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41507 | 52392 / ListPaneMenuActionDeleteMenu | data-formId | Y / Y / N | 8 / 0 |
| 41508 | 52392 / ListPaneMenuActionDeleteMenu | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41509 | 52393 / BasicCriteriaMenuOptionName | data-dbcolumn | Y / Y / N | 32 / 0 |
| 41510 | 52394 / BasicCriteriaMenuResourceKey | data-dbcolumn | Y / Y / N | 34 / 0 |
| 41511 | 52395 / BasicCriteriaSubmenuScreenName | data-dbcolumn | Y / Y / N | 24 / 0 |
| 41512 | 52396 / BasicCriteriaSubmenuResourceKey | data-dbcolumn | Y / Y / N | 40 / 0 |
| 41513 | 52397 / BasicCriteriaSRCIdentifier | data-dbcolumn | Y / Y / N | 28 / 0 |
| 41514 | 52398 / BasicCriteriaParent | data-dbcolumn | Y / Y / N | 32 / 0 |
| 41515 | 52400 / ListPaneDataGrid | data-dbtable | Y / Y / N | 86 / 0 |
| 41516 | 52401 / DetailPaneHeaderMenuOptionName | href | Y / Y / Y | 58 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18463 / click | 52377 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18464 / click | 52378 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18465 / click | 52380 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18466 / click | 52381 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18467 / click | 52382 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18468 / click | 52383 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18469 / click | 52384 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18470 / click | 52385 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18471 / click | 52386 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18472 / click | 52387 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18473 / click | 52388 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18474 / click | 52389 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18475 / click | 52390 / ListPaneMenuActionNew | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18476 / click | 52391 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18477 / click | 52392 / ListPaneMenuActionDeleteMenu | _webUi.insightListPaneActions.menuActionPerformDelete | Not populated | Y / Y |
| 18478 / iggridrequesterror | 52400 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18479 / iggriddatabound | 52400 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18480 / iggridselectionrowselectionchanged | 52400 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18481 / iggridselectionactiverowchanged | 52400 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 27364 / 18463 | GETServiceURL | Y / Y | 76 |
| 27365 / 18463 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 27366 / 18463 | queryParameter_Function_UserName | Y / Y | 44 |
| 27367 / 18463 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27368 / 18463 | POSTServiceURL | Y / Y | 74 |
| 27369 / 18463 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 27370 / 18463 | PostData_Function_UserName | Y / Y | 44 |
| 27371 / 18463 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27372 / 18463 | PostData_Function_SearchValue | Y / Y | 98 |
| 27373 / 18463 | Post_SuccessCallback | Y / Y | 114 |
| 27374 / 18463 | ModalDialogName | Y / Y | 42 |
| 27375 / 18464 | ModalDialogName | Y / Y | 42 |
| 27376 / 18465 | POSTServiceURL | Y / Y | 144 |
| 27377 / 18465 | Form_Id | Y / Y | 8 |
| 27378 / 18465 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 27379 / 18465 | PostData_Function_SearchValue | Y / Y | 98 |
| 27380 / 18465 | Post_SuccessCallback | Y / Y | 114 |
| 27381 / 18465 | ModalDialogName | Y / Y | 56 |
| 27382 / 18466 | ModalDialogName | Y / Y | 56 |
| 27383 / 18470 | ModalDialogName | Y / Y | 42 |
| 27384 / 18471 | ModalDialogName | Y / Y | 56 |
| 27385 / 18475 | URL | Y / Y | 32 |
| 27386 / 18476 | URL | Y / Y | 104 |
| 27387 / 18477 | ConfirmationMessageCode | Y / Y | 50 |
| 27388 / 18477 | DELETEServiceURL | Y / Y | 114 |
| 27389 / 18477 | queryParameter_Grid_ListPaneDataGrid_id | Y / Y | 18 |
| 27390 / 18477 | Delete_SuccessCallback | Y / Y | 140 |
| 27391 / 18481 | POSTServiceURL | Y / Y | 74 |
| 27392 / 18481 | PostData_objectid | Y / Y | 18 |
| 27393 / 18481 | PostData_storedProcedure | Y / Y | 52 |
| 27394 / 18481 | EnableAction_ListPaneMenuActionNew | Y / Y | 8 |
| 27395 / 18481 | EnableAction_ListPaneMenuActionView | Y / Y | 50 |
| 27396 / 18481 | EnableAction_ListPaneMenuActionEdit | Y / Y | 36 |
| 27397 / 18481 | EnableAction_ListPaneMenuActionDeleteMenu | Y / Y | 42 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 26 selected candidate rows for this Screen: **26 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 41501 | 52385 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41502 | 52386 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41503 | 52390 / Not applicable | data-formId | form_id | 4087 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41504 | 52390 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41505 | 52391 / Not applicable | data-formId | form_id | 4087 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41506 | 52391 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41507 | 52392 / Not applicable | data-formId | form_id | 4087 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41508 | 52392 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41509 | 52393 / Not applicable | data-dbcolumn | database_identifier | MENU_OPTION_NAME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41510 | 52394 / Not applicable | data-dbcolumn | database_identifier | MENU_RESOURCE_KEY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41511 | 52395 / Not applicable | data-dbcolumn | database_identifier | SUBMENU_NAME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41512 | 52396 / Not applicable | data-dbcolumn | database_identifier | SUBMENU_RESOURCE_KEY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41513 | 52397 / Not applicable | data-dbcolumn | database_identifier | SRC_IDENTIFIER | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41514 | 52398 / Not applicable | data-dbcolumn | database_identifier | PARENT_OBJECT_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41515 | 52400 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_WAREHOUSE_MOBILE_MENU_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27364 | 52377 / 18463 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27368 | 52377 / 18463 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27373 | 52377 / 18463 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27376 | 52380 / 18465 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27380 | 52380 / 18465 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27387 | 52392 / 18477 | ConfirmationMessageCode | resource_code | MSG_WAREHOUSEMOBILEMENU04 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27388 | 52392 / 18477 | DELETEServiceURL | relative_api_path | /general/scaleapi/WhsMobileMenuApi/WhsMobileMenu-Deleted? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27389 | 52392 / 18477 | queryParameter_Grid_ListPaneDataGrid_id | grid_field_identifier | OBJECT_ID | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27390 | 52392 / 18477 | Delete_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27391 | 52400 / 18481 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27393 | 52400 / 18481 | PostData_storedProcedure | stored_procedure_identifier | WHSM_InsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
