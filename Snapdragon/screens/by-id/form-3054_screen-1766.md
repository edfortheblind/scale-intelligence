# Interface Error Insight — Form 3054, Screen 1766

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3054 |
| MAIN_UI_SCREEN Object ID | 1766 |
| Label / Form resource key | Interface Error Insight / MNU_INTERFACEERRORINSIGHT |
| Functional area code | 80 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/3054 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/3054 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3054 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | INTERFACE_ERROR |
| Help page reference | usingIntErrorIns.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3054 |
| Inspection time (UTC) | 2026-10-02T15:26:19.959Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_INTERFACEERRORINSIGHT |
| Observed configured table/view | INTERFACE_ERROR |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1766 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:14:08.513Z | loaded; runtime_inspection | https://trav.manhscale.com/scale/insights/3054; Interface Error Insight | [runtime-root.json](../../evidence/runtime-root.json) |

**Visible criteria / entry fields:** Interface Process; Interface Mode; Error File Path; Original File Path; Error Message; From Date Stamp; To Date Stamp; Reference Field 1; Reference Field 2; Reference Field 3; Company; Warehouse.

**Visible grid headers:** Field; Operand; Value; Icon; Color; Date Time Stamp; Interface Process; Interface Mode; Error Message; Error File Path; Original File Path; Reference Field 1; Reference Field 2; Reference Field 3; Company; Warehouse; Internal Error Number.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Interface Error Insight is recorded as `insight`. Its saved configuration contains 6 parts, 18 groups, 30 controls, and 15 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4311 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4312 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4313 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4314 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4315 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4316 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4311: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17824 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17824; default=None |
| 17825 / SaveSearchModalDialogHeader | 17824 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17824; default=None |
| 17826 / SaveSearchModalDialogBody | 17824 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17824; default=None |
| 17827 / SaveSearchModalDialogFooter | 17824 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17824; default=None |

#### Group 17826: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51182 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17827: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51183 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51184 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4312: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17828 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17828; default=None |
| 17829 / GadgetCalculationQueryDialogHeader | 17828 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17828; default=None |
| 17830 / GadgetCalculationQueryDialogBody | 17828 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17828; default=None |
| 17831 / GadgetCalculationQueryDialogFooter | 17828 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17828; default=None |

#### Group 17830: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51185 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17831: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51186 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51187 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4313: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17832 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17832; default=None |
| 17833 / InsightMenuPanel | 17832 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=17832; default=None |
| 17834 / InsightMenuFavoritesDropdown | 17832 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=17832; default=None |
| 17835 / InsightListPaneMenuPanel | 17832 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17832; default=None |
| 17836 / MenuExportToExcelPanel | 17832 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=17832; default=None |

#### Group 17833: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51188 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51189 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51190 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51191 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17835: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51192 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51193 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51194 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 17836: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51195 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

### Part 4314: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17837 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17837; default=None |
| 17838 / SearchPaneBasicCriteria | 17837 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=17837; default=None |
| 17839 / SearchPaneAdvancedCriteria | 17837 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=17837; default=None |

#### Group 17838: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51196 / BasicCriteriaProcess | Interface Process / INTERFACEPROCESS | 80 / 3000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51197 / BasicCriteriaInterfaceModes | Interface Mode / INTERFACEMODE | 80 / 3500 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51198 / BasicCriteriaErrorFilePath | Error File Path / ERRORFILEPATH | 10 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51199 / BasicCriteriaOriginalFilepath | Original File Path / ORIGINALFILEPATH | 10 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51200 / BasicCriteriaErroMsg | Error Message / ERRORMSG | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51201 / BasicCriteriaDateTimeStamp | Date Time Stamp / DATETIMESTAMP | 190 / 5400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51202 / BasicCriteriaRefrenceFiled1 | Reference Field 1 / REFERENCEID01 | 10 / 5500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51203 / BasicCriteriaRefrenceFiled2 | Reference Field 2 / REFERENCEID02 | 10 / 5600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51204 / BasicCriteriaRefrenceFiled3 | Reference Field 3 / REFERENCEID03 | 10 / 5700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51205 / SearchPaneComp | Company / COMPANY | 280 / 7400 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51206 / BasicCriteriaWarehouse | Warehouse / WAREHOUSE | 280 / 7500 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17839: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51207 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4315: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17840 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17840; default=None |

#### Group 17840: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51208 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51208 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18223 / ICON | Not populated / Icon / ICON | 10 / 10 / 500 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18224 / COLOR | Not populated / Color / COLOR | 10 / 10 / 600 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18210 / DATE_TIME_STAMP | DATE_TIME_STAMP / Date Time Stamp / DATETIMESTAMP | 30 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18212 / INTERFACE_PROCESS | INTERFACE_PROCESS / Interface Process / INTERFACEPROCESS | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18213 / INTERFACE_MODE | INTERFACE_MODE / Interface Mode / INTERFACEMODE | 10 / 10 / 1100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18214 / ERROR_MSG | ERROR_MSG / Error Message / ERRORMESSAGE | 10 / 10 / 1200 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18215 / ERROR_FILE_PATH | ERROR_FILE_PATH / Error File Path / ERRORFILEPATH | 10 / 10 / 1300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18216 / ORIGINAL_FILE_PATH | ORIGINAL_FILE_PATH / Original File Path / ORIGINALFILEPATH | 10 / 10 / 1400 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18217 / REFERENCE_ID01 | REFERENCE_ID01 / Not populated / Referencefield1 | 10 / 10 / 1500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18218 / REFERENCE_ID02 | REFERENCE_ID02 / Not populated / Referencefield2 | 10 / 10 / 1500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18219 / REFERENCE_ID03 | REFERENCE_ID03 / Not populated / Referencefield3 | 10 / 10 / 1500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18220 / COMPANY | COMPANY / Not populated / Company | 10 / 10 / 1600 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18221 / WAREHOUSE | WAREHOUSE / Warehouse / WAREHOUSE | 10 / 10 / 1700 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18222 / INTERNAL_ERROR_NUMBER | INTERNAL_ERROR_NUMBER / Internal Error Number / INTERNAL_ERROR_NUMBER | 20 / 10 / 1800 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18211 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 1810 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4316: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17841 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17841; default=None |

#### Group 17841: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51209 / DetailPaneHeaderInterfaceProcess | Not populated / Not populated | 30 / 2600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=584; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51210 / DetailPaneHeaderInterfaceReferenceId01 | Not populated / Not populated | 30 / 2700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=584; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51211 / DetailPaneHeaderInterfaceErrorMsg | Not populated / Not populated | 30 / 2800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=584; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 18 control attributes, 16 events, and 24 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40318 | 51182 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40319 | 51182 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40320 | 51191 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40321 | 51192 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40322 | 51196 / BasicCriteriaProcess | data-dbcolumn | Y / Y / N | 34 / 0 |
| 40323 | 51197 / BasicCriteriaInterfaceModes | data-dbcolumn | Y / Y / N | 28 / 0 |
| 40324 | 51198 / BasicCriteriaErrorFilePath | data-dbcolumn | Y / Y / N | 30 / 0 |
| 40325 | 51199 / BasicCriteriaOriginalFilepath | data-dbcolumn | Y / Y / N | 36 / 0 |
| 40326 | 51200 / BasicCriteriaErroMsg | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40327 | 51201 / BasicCriteriaDateTimeStamp | data-dbcolumn | Y / Y / N | 30 / 0 |
| 40328 | 51201 / BasicCriteriaDateTimeStamp | allowTodayOnlySelection | Y / Y / Y | 8 / 0 |
| 40329 | 51202 / BasicCriteriaRefrenceFiled1 | data-dbcolumn | Y / Y / N | 28 / 0 |
| 40330 | 51203 / BasicCriteriaRefrenceFiled2 | data-dbcolumn | Y / Y / N | 28 / 0 |
| 40331 | 51204 / BasicCriteriaRefrenceFiled3 | data-dbcolumn | Y / Y / N | 28 / 0 |
| 40332 | 51205 / SearchPaneComp | data-dbcolumn | Y / Y / N | 14 / 0 |
| 40333 | 51206 / BasicCriteriaWarehouse | defaultValue | Y / Y / Y | 32 / 0 |
| 40334 | 51206 / BasicCriteriaWarehouse | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40335 | 51208 / ListPaneDataGrid | data-dbtable | Y / Y / N | 30 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17783 / click | 51183 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 17784 / click | 51184 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17785 / click | 51186 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 17786 / click | 51187 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17787 / click | 51188 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 17788 / click | 51189 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 17789 / click | 51190 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 17790 / click | 51191 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17791 / click | 51192 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17792 / click | 51193 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 17793 / click | 51194 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 17794 / click | 51195 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 17795 / iggridrequesterror | 51208 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 17796 / iggriddatabound | 51208 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 17797 / iggridselectionrowselectionchanged | 51208 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 17798 / iggridselectionactiverowchanged | 51208 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 25961 / 17783 | GETServiceURL | Y / Y | 76 |
| 25962 / 17783 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 25963 / 17783 | queryParameter_Function_UserName | Y / Y | 44 |
| 25964 / 17783 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25965 / 17783 | POSTServiceURL | Y / Y | 74 |
| 25966 / 17783 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 25967 / 17783 | PostData_Function_UserName | Y / Y | 44 |
| 25968 / 17783 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25969 / 17783 | PostData_Function_SearchValue | Y / Y | 98 |
| 25970 / 17783 | Post_SuccessCallback | Y / Y | 114 |
| 25971 / 17783 | ModalDialogName | Y / Y | 42 |
| 25972 / 17784 | ModalDialogName | Y / Y | 42 |
| 25973 / 17785 | POSTServiceURL | Y / Y | 144 |
| 25974 / 17785 | Form_Id | Y / Y | 8 |
| 25975 / 17785 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 25976 / 17785 | PostData_Function_SearchValue | Y / Y | 98 |
| 25977 / 17785 | Post_SuccessCallback | Y / Y | 114 |
| 25978 / 17785 | ModalDialogName | Y / Y | 56 |
| 25979 / 17786 | ModalDialogName | Y / Y | 56 |
| 25980 / 17790 | ModalDialogName | Y / Y | 42 |
| 25981 / 17791 | ModalDialogName | Y / Y | 56 |
| 25982 / 17798 | POSTServiceURL | Y / Y | 74 |
| 25983 / 17798 | PostData_internalerrornumber | Y / Y | 42 |
| 25984 / 17798 | PostData_storedProcedure | Y / Y | 60 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 21 selected candidate rows for this Screen: **21 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40320 | 51191 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40321 | 51192 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40322 | 51196 / Not applicable | data-dbcolumn | database_identifier | INTERFACE_PROCESS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40323 | 51197 / Not applicable | data-dbcolumn | database_identifier | INTERFACE_MODE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40324 | 51198 / Not applicable | data-dbcolumn | database_identifier | ERROR_FILE_PATH | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40325 | 51199 / Not applicable | data-dbcolumn | database_identifier | ORIGINAL_FILE_PATH | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40326 | 51200 / Not applicable | data-dbcolumn | database_identifier | ERROR_MSG | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40327 | 51201 / Not applicable | data-dbcolumn | database_identifier | DATE_TIME_STAMP | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40329 | 51202 / Not applicable | data-dbcolumn | database_identifier | REFERENCE_ID01 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40330 | 51203 / Not applicable | data-dbcolumn | database_identifier | REFERENCE_ID01 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40331 | 51204 / Not applicable | data-dbcolumn | database_identifier | REFERENCE_ID03 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40332 | 51205 / Not applicable | data-dbcolumn | database_identifier | Company | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40334 | 51206 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40335 | 51208 / Not applicable | data-dbtable | database_identifier | INTERFACE_ERROR | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25961 | 51183 / 17783 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25965 | 51183 / 17783 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25970 | 51183 / 17783 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25973 | 51186 / 17785 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25977 | 51186 / 17785 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25982 | 51208 / 17798 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25984 | 51208 / 17798 | PostData_storedProcedure | stored_procedure_identifier | INT_ErrorInsightDetailPaneData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
