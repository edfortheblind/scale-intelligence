# Inventory Insight — Form 2723, Screen 1767

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2723 |
| MAIN_UI_SCREEN Object ID | 1767 |
| Label / Form resource key | Inventory Insight / MNU_INVENTORYINSIGHT |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2723 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2723 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2723 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | Metadata_Insight_Inventory_View |
| Help page reference | InventoryViewer.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2723 |
| Inspection time (UTC) | 2026-10-02T15:23:19.177Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_INVENTORYINSIGHT |
| Observed configured table/view | Metadata_Insight_Inventory_View |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1767 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:13:24.963Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/insights/2723#search; Inventory Insight | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

**Visible criteria / entry fields:** Location; Item; Company; Description; License Plate; Lot; From Expiration Date; To Expiration Date; Serial Number; Warehouse.

**Visible grid headers:** Icon; Frozen; Location; Item; Description; Company; AV; OH; Inventory Status; Update Catch Weight; AL; IT; SU; Lot; License Plate.

**Observed action/menu labels:** Edit; Adjust; Company Transfer; Create Count; Edit Attributes; Edit Overrides; Delete Overrides; Finished Item Breakdown; Status Change; Transfer; Update Catch Weight; Manual Replenishment; Mark for Replenishment; Freeze Lot; Print Selected Docs.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Inventory Insight is recorded as `insight`. Its saved configuration contains 7 parts, 26 groups, 65 controls, and 38 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4317 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4318 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4319 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4320 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4321 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4322 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |
| 4323 / UpdateCatchWeightModalDialog | Not populated / Not populated | 20 / 17500 | Y / Y / Y | UpdateCatchWeightSaveButton |

### Part 4317: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17842 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17842; default=None |
| 17843 / SaveSearchModalDialogHeader | 17842 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17842; default=None |
| 17844 / SaveSearchModalDialogBody | 17842 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17842; default=None |
| 17845 / SaveSearchModalDialogFooter | 17842 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17842; default=None |

#### Group 17844: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51212 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17845: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51213 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51214 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4318: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17846 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17846; default=None |
| 17847 / GadgetCalculationQueryDialogHeader | 17846 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17846; default=None |
| 17848 / GadgetCalculationQueryDialogBody | 17846 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17846; default=None |
| 17849 / GadgetCalculationQueryDialogFooter | 17846 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17846; default=None |

#### Group 17848: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51215 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17849: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51216 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51217 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4319: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17850 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17850; default=None |
| 17851 / InsightMenuPanel | 17850 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=17850; default=None |
| 17852 / InsightMenuFavoritesDropdown | 17850 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=17850; default=None |
| 17853 / InsightListPaneMenuPanel | 17850 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17850; default=None |
| 17854 / MenuExportToExcelPanel | 17850 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=17850; default=None |
| 17856 / InsightMenuActionsDropdown | 17850 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=17850; default=None |
| 17855 / InsightMenuConfigActionsDropdown | 17850 | Configs / CONFIGMENU | 80 / 16000 | Y / Y | Fixed to top=N; loading=0; nested unit=17850; default=None |

#### Group 17851: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51218 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51219 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51220 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51221 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17853: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51222 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51223 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 51224 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51225 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 17854: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51226 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 17856: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51230 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 51231 / ListPaneMenuActionView | View / VIEW | 150 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 51232 / ListPaneMenuActionAdjust | Adjust / ADJUST | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ADJUST |
| 51234 / ListPaneMenuActionCompanyTransfer | Company Transfer / COMPANYTRANSFER | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=COMPANYTRANSFER |
| 51233 / ListPaneMenuActionCountLocation | Create Count / CREATECOUNT | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CREATECOUNT |
| 51235 / ListPaneMenuActionEditInventoryAttributes | Edit Attributes / EDITATTRIBUTES | 150 / 5500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDITATTRIBUTES |
| 51236 / ListPaneMenuActionViewAttribute | View Attributes / VIEWATTRIBUTE | 150 / 5505 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEWATTRIBUTE |
| 51237 / ListPaneMenuActionDeleteInventoryAttributes | Delete Attributes / DELETEATTRIBUTES | 150 / 5800 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETEATTRIBUTES |
| 51239 / ListPaneMenuActionEditOverrides | Edit Overrides / EDITOVERRIDES | 150 / 5850 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDITOVERRIDES |
| 51238 / ListPaneMenuActionDeleteOverrides | Delete Overrides / DELETEOVERRIDES | 150 / 5900 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETEOVERRIDES |
| 51240 / ListPaneMenuActionFinishedItemBreakdown | Finished Item Breakdown / FINISHEDITEMBREAKDOWN | 150 / 6000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=FINISHEDITEMBREAKDOWN |
| 51241 / ListPaneMenuActionStatusChange | Status Change / STATUSCHANGE | 150 / 7000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=STATUSCHANGE |
| 51242 / ListPaneMenuActionTransfer | Transfer / TRANSFER | 150 / 7750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TRANSFER |
| 51243 / ListPaneMenuActionUpdateCatchWeight | Update Catch Weight / UPDATECATCHWEIGHT | 150 / 7850 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=UPDATECATCHWEIGHT |
| 51244 / ListPaneMenuActionManualReplenish | Manual Replenishment / MANUALREPLENISHMENT | 150 / 9000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=MANUALREPLENISHMENT |
| 51245 / ListPaneMenuActionReplenish | Mark for Replenishment / MARKFORREPLENISHMENT | 150 / 10000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=MARKFORREPLENISHMENT |
| 51246 / ListPaneMenuActionFreezeLot | Freeze Lot / FREEZELOT | 150 / 12500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=FREEZELOT |
| 51247 / ListPaneMenuActionPrintSelectedInventoryDocs | Print Selected Docs / PRINTSELECTEDDOCS | 150 / 13000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTSELECTEDDOCS |

#### Group 17855: InsightMenuConfigActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51227 / MenuActionItemLocationAssignment | Item Location Assignment / ITEMLOCATIONASSIGNMENT | 150 / 150 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ITEMLOCATIONASSIGNMENT |
| 51228 / MenuActionItemLocationCapacity | Item Location Capacity / ITEMLOCATIONCAPACITY | 150 / 200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ITEMLOCATIONCAPACITY |
| 51229 / MenuActionItemUOM | Item Unit of Measure / ITEMUNITOFMEASURE | 150 / 235 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ITEMUNITOFMEASURE |

### Part 4320: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17857 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17857; default=None |
| 17858 / SearchPaneBasicCriteria | 17857 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=17857; default=None |
| 17859 / SearchPaneAdvancedCriteria | 17857 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 17500 | Y / Y | Fixed to top=N; loading=0; nested unit=17857; default=None |

#### Group 17858: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51248 / BasicCriteriaLocation | Location / LOCATION | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51249 / BasicCriteriaItem | Item / ITEM | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51259 / SearchPaneComp | Company / COMPANY | 280 / 6000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51250 / BasicCriteriaItemDesc | Description / ITEMDESCRIPTION | 10 / 7500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51251 / BasicCriteriaLicensePlate | License Plate / LICENSEPLATE | 10 / 10000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51252 / BasicCriteriaLot | Lot / LOT | 10 / 12500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51253 / BasicCriteriaExpirationDateRange | Expiration Date / EXPIRATIONDATE | 190 / 15000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51257 / BasicCriteriaSerialNum | Serial Number / SERIALNUMBER | 10 / 15500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51258 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 16000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51254 / BasicCriteriaEmptyLocs | Include Empty Locations / INCLUDEEMPTYLOCATIONS | 130 / 17500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51255 / BasicCriteria-PermanentLocs | Only Permanent Locations / ONLYPERMANENTLOCATIONS | 130 / 20000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51256 / BasicCriteria-Aggregate | Show All Lps and Attributes / SHOWALLLPATTRIBUTE | 130 / 21000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17859: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51260 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4321: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17860 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17860; default=None |
| 17861 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17861; default=None |

#### Group 17860: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51261 / ListPaneSummaryItems | Items / ITEMS | 50 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51262 / ListPaneSummaryLocations | Locations / LOCATIONS | 50 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51263 / ListPaneSummaryLicensePlates | License Plates / LICENSEPLATES | 50 / 7500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51264 / ListPaneSummaryLots | Lots / LOTS | 50 / 10000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17861: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51265 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51265 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18225 / ICON | Not populated / Icon / ICON | 10 / 10 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18227 / FROZEN | Not populated / Frozen / FROZEN | 40 / 10 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18228 / Not populated | Location / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18229 / Not populated | Item / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18230 / Not populated | Company / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18231 / Not populated | Warehouse / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18232 / REAL_TIME_RPLN | Real_Time_Rpln / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18233 / Not populated | Lot / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18234 / Not populated | Logistics_Unit / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18235 / Not populated | Loc_Inv_Attributes_Id / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18236 / Not populated | Location / Not populated / Not populated | Not populated / 30 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18237 / LOCATION | Location / Location / LOCATION | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18238 / ITEM | Item / Item / ITEM | 10 / 10 / 2000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18239 / ITEM_DESC | Not populated / Description / DESCRIPTION | 10 / 10 / 3000 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18240 / COMPANY | Company / Company / COMPANY | 10 / 10 / 3500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18241 / AVAILABLEQTY_AV | Not populated / AV / AVAILABLEQTY_AV | 20 / 10 / 4000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18242 / ON_HAND_QTY | Not populated / OH / ONHANDQTY_OH | 20 / 10 / 5000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18243 / INVENTORY_STS | Not populated / Inventory Status / INVENTORYSTATUS | 10 / 10 / 5500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18244 / CATCH_WEIGHT | Not populated / Catch Weight / CATCH_WEIGHT | 20 / 10 / 5600 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18245 / CATCH_WEIGHT_UM | Not populated / Catch Weight UM / CATCH_WEIGHT_UM | 10 / 10 / 5610 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18254 / UPDATECATCHWEIGHT | Not populated / Update Catch Weight / UPDATECATCHWEIGHT | 40 / 10 / 5650 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18246 / ALLOCATED_QTY | Not populated / AL / ALLOCATEDQTY_AL | 20 / 10 / 6000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18247 / IN_TRANSIT_QTY | Not populated / IT / INTRANSITQTY_IT | 20 / 10 / 7000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18248 / SUSPENSE_QTY | Not populated / SU / SUSPENSEQTY_SU | 20 / 10 / 8000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18249 / LOT | Not populated / Lot / LOT | 10 / 10 / 11000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18250 / LOGISTICS_UNIT | Not populated / License Plate / LICENSE_PLATE | 10 / 10 / 12000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18251 / PARENT_LOGISTICS_UNIT | Not populated / Parent License Plate / PARENT_LICENSE_PLATE | 10 / 10 / 12500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18252 / LOC_INV_ATTRIBUTES | Not populated / Inventory Attributes / LOCATIONINVENTORYATTRIBUTES | 40 / 10 / 13000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18253 / OVERRIDES | Not populated / Overrides / OVERRIDES | 40 / 10 / 13250 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18255 / LOC_INV_ATTRIBUTES_ID | Not populated / Inventory Attribute ID / LOC_INV_ATTRIBUTES_ID | 20 / 10 / 13500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18261 / TRACK_CONTAINERS | Not populated / Track Containers / TRACKCONTAINERS | 40 / 10 / 13500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18256 / INTERNAL_LOCATION_INV | Not populated / Internal Location Inv / INTERNALLOCATIONINV | 10 / 10 / 13600 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18262 / COLOR | Not populated / Color / COLOR | 10 / 10 / 13600 / 1 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18257 / WAREHOUSE | Warehouse / Warehouse / WAREHOUSE | 10 / 10 / 14000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18258 / REAL_TIME_RPLN | Real_Time_Rpln / Real Time Replenishment / REALTIMERPLN | 10 / 10 / 15000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18259 / PERMANENT | Not populated / Permanent / PERMANENT | 40 / 10 / 20000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18260 / LOCATION_CLASS_OVERRIDES_ELIGIBLE | Not populated / Location Class Overrides Eligible / LOCATIONCLASSOVERRIDESELIGIBLE | 40 / 10 / 20000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18226 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 20010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4322: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17862 / DetailPaneHeader | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17862; default=None |
| 17863 / indicatorpane | Not populated | Not populated / Not populated | 60 / 17500 | Y / Y | Fixed to top=N; loading=0; nested unit=17863; default=None |

#### Group 17862: DetailPaneHeader — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51266 / DetailPaneHeaderLocation | Not populated / Not populated | 30 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=585; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51267 / DetailPaneHeaderItem | Not populated / Not populated | 30 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=585; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51268 / DetailPaneHeaderItemDesc | Not populated / Not populated | 30 / 5500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=585; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51269 / DetailPaneHeaderCompany | Not populated / Not populated | 30 / 6000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=585; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51270 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 12500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=585; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17863: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51271 / InventoryInsightIndicatorTileOpenWork | Open Work / OPEN_WORK | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51272 / InventoryInsightIndicatorTileImmNeeds | Immediate Needs / IMMEDIATENEEDS | 360 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4323: UpdateCatchWeightModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17864 / UpdateCatchWeightModalDialogForm | Not populated | Not populated / Not populated | 90 / 2700 | Y / Y | Fixed to top=N; loading=0; nested unit=17864; default=None |
| 17865 / UpdateCatchWeightModalDialogHeader | 17864 | Update Catch Weight / UPDATECATCHWEIGHT | 110 / 2700 | Y / Y | Fixed to top=N; loading=0; nested unit=17864; default=None |
| 17866 / UpdateCatchWeightModalDialogBody | 17864 | Not populated / Not populated | 120 / 2700 | Y / Y | Fixed to top=N; loading=0; nested unit=17864; default=None |
| 17867 / UpdateCatchWeightModalDialogFooter | 17864 | Not populated / Not populated | 130 / 2700 | Y / Y | Fixed to top=N; loading=0; nested unit=17864; default=None |

#### Group 17866: UpdateCatchWeightModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51273 / UpdateCatchWeightEditor | Catch Weight / CATCH_WEIGHT | 90 / 2700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51274 / CatchWeightUMEditor | Catch Weight UM / CATCH_WEIGHT_UM | 10 / 2700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17867: UpdateCatchWeightModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51275 / UpdateCatchWeightSaveButton | Save / BTN_SAVE | 100 / 2700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51276 / UpdateCatchWeightCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 87 control attributes, 40 events, and 136 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40336 | 51212 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40337 | 51212 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40338 | 51221 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40339 | 51222 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40340 | 51227 / MenuActionItemLocationAssignment | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40341 | 51227 / MenuActionItemLocationAssignment | data-formId | Y / Y / N | 10 / 0 |
| 40342 | 51227 / MenuActionItemLocationAssignment | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40343 | 51228 / MenuActionItemLocationCapacity | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40344 | 51228 / MenuActionItemLocationCapacity | data-formId | Y / Y / N | 10 / 0 |
| 40345 | 51228 / MenuActionItemLocationCapacity | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40346 | 51229 / MenuActionItemUOM | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40347 | 51229 / MenuActionItemUOM | data-formId | Y / Y / N | 10 / 0 |
| 40348 | 51229 / MenuActionItemUOM | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40349 | 51230 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 40350 | 51230 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40351 | 51230 / ListPaneMenuActionEdit | data-divider | Y / Y / N | 8 / 0 |
| 40352 | 51231 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 40353 | 51231 / ListPaneMenuActionView | data-divider | Y / Y / N | 8 / 0 |
| 40354 | 51232 / ListPaneMenuActionAdjust | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40355 | 51232 / ListPaneMenuActionAdjust | data-formId | Y / Y / N | 8 / 0 |
| 40356 | 51232 / ListPaneMenuActionAdjust | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40359 | 51234 / ListPaneMenuActionCompanyTransfer | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40360 | 51234 / ListPaneMenuActionCompanyTransfer | data-formId | Y / Y / N | 8 / 0 |
| 40361 | 51234 / ListPaneMenuActionCompanyTransfer | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40357 | 51233 / ListPaneMenuActionCountLocation | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40358 | 51233 / ListPaneMenuActionCountLocation | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40362 | 51235 / ListPaneMenuActionEditInventoryAttributes | data-formId | Y / Y / N | 8 / 0 |
| 40363 | 51235 / ListPaneMenuActionEditInventoryAttributes | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40364 | 51236 / ListPaneMenuActionViewAttribute | data-formId | Y / Y / N | 8 / 0 |
| 40365 | 51237 / ListPaneMenuActionDeleteInventoryAttributes | data-formId | Y / Y / N | 8 / 0 |
| 40366 | 51237 / ListPaneMenuActionDeleteInventoryAttributes | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40370 | 51239 / ListPaneMenuActionEditOverrides | data-formId | Y / Y / N | 8 / 0 |
| 40371 | 51239 / ListPaneMenuActionEditOverrides | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40367 | 51238 / ListPaneMenuActionDeleteOverrides | data-formId | Y / Y / N | 8 / 0 |
| 40368 | 51238 / ListPaneMenuActionDeleteOverrides | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40369 | 51238 / ListPaneMenuActionDeleteOverrides | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40372 | 51240 / ListPaneMenuActionFinishedItemBreakdown | data-formId | Y / Y / N | 8 / 0 |
| 40373 | 51240 / ListPaneMenuActionFinishedItemBreakdown | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40374 | 51241 / ListPaneMenuActionStatusChange | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40375 | 51241 / ListPaneMenuActionStatusChange | data-formId | Y / Y / N | 8 / 0 |
| 40376 | 51241 / ListPaneMenuActionStatusChange | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40377 | 51242 / ListPaneMenuActionTransfer | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40378 | 51242 / ListPaneMenuActionTransfer | data-formId | Y / Y / N | 8 / 0 |
| 40379 | 51242 / ListPaneMenuActionTransfer | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40380 | 51243 / ListPaneMenuActionUpdateCatchWeight | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40381 | 51243 / ListPaneMenuActionUpdateCatchWeight | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40382 | 51244 / ListPaneMenuActionManualReplenish | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40383 | 51244 / ListPaneMenuActionManualReplenish | data-formId | Y / Y / N | 8 / 0 |
| 40384 | 51244 / ListPaneMenuActionManualReplenish | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40385 | 51245 / ListPaneMenuActionReplenish | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40386 | 51245 / ListPaneMenuActionReplenish | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40387 | 51245 / ListPaneMenuActionReplenish | data-divider | Y / Y / N | 8 / 0 |
| 40388 | 51246 / ListPaneMenuActionFreezeLot | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40389 | 51246 / ListPaneMenuActionFreezeLot | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40390 | 51247 / ListPaneMenuActionPrintSelectedInventoryDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40391 | 51248 / BasicCriteriaLocation | data-dbcolumn | Y / Y / N | 16 / 0 |
| 40392 | 51248 / BasicCriteriaLocation | Lookup | Y / Y / N | 78 / 1 |
| 40393 | 51249 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 40394 | 51249 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 40414 | 51259 / SearchPaneComp | data-dbcolumn | Y / Y / N | 14 / 0 |
| 40395 | 51250 / BasicCriteriaItemDesc | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40396 | 51251 / BasicCriteriaLicensePlate | data-dbcolumn | Y / Y / N | 28 / 0 |
| 40397 | 51252 / BasicCriteriaLot | data-dbcolumn | Y / Y / N | 6 / 0 |
| 40398 | 51252 / BasicCriteriaLot | Lookup | Y / Y / N | 48 / 1 |
| 40399 | 51253 / BasicCriteriaExpirationDateRange | data-dbcolumn | Y / Y / N | 30 / 0 |
| 40400 | 51253 / BasicCriteriaExpirationDateRange | data-dateOnly | Y / Y / Y | 8 / 0 |
| 40411 | 51257 / BasicCriteriaSerialNum | data-dbcolumn | Y / Y / N | 26 / 0 |
| 40412 | 51258 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 40413 | 51258 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40401 | 51254 / BasicCriteriaEmptyLocs | data-dbcolumn | Y / Y / N | 8 / 0 |
| 40402 | 51254 / BasicCriteriaEmptyLocs | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40403 | 51254 / BasicCriteriaEmptyLocs | data-negativeCondition | Y / Y / N | 22 / 0 |
| 40404 | 51255 / BasicCriteria-PermanentLocs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40405 | 51255 / BasicCriteria-PermanentLocs | data-positiveCondition | Y / Y / N | 10 / 0 |
| 40406 | 51255 / BasicCriteria-PermanentLocs | data-negativeCondition | Y / Y / N | 0 / 0 |
| 40407 | 51256 / BasicCriteria-Aggregate | data-dbcolumn | Y / Y / N | 22 / 0 |
| 40408 | 51256 / BasicCriteria-Aggregate | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40409 | 51256 / BasicCriteria-Aggregate | data-negativeCondition | Y / Y / N | 82 / 0 |
| 40410 | 51256 / BasicCriteria-Aggregate | data-useOriginalTableForSummary | Y / Y / N | 8 / 0 |
| 40415 | 51265 / ListPaneDataGrid | data-dbtable | Y / Y / N | 62 / 0 |
| 40416 | 51265 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 40417 | 51265 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 40418 | 51271 / InventoryInsightIndicatorTileOpenWork | data-indicatorTileGoToInsight | Y / Y / Y | 866 / 0 |
| 40419 | 51272 / InventoryInsightIndicatorTileImmNeeds | data-indicatorTileGoToInsight | Y / Y / Y | 224 / 0 |
| 40420 | 51273 / UpdateCatchWeightEditor | data-rule-min | Y / Y / Y | 2 / 0 |
| 40421 | 51273 / UpdateCatchWeightEditor | data-msg-min | Y / Y / Y | 18 / 1 |
| 40422 | 51274 / CatchWeightUMEditor | disabled | Y / Y / Y | 8 / 1 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17799 / click | 51213 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 17800 / click | 51214 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17801 / click | 51216 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 17802 / click | 51217 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17803 / click | 51218 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 17804 / click | 51219 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 17805 / click | 51220 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 17806 / click | 51221 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17807 / click | 51222 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17808 / click | 51223 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 17809 / click | 51224 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 17810 / click | 51225 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 17811 / click | 51226 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 17812 / click | 51227 / MenuActionItemLocationAssignment | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17813 / click | 51228 / MenuActionItemLocationCapacity | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17814 / click | 51229 / MenuActionItemUOM | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17815 / click | 51230 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17816 / click | 51231 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17817 / click | 51232 / ListPaneMenuActionAdjust | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17819 / click | 51234 / ListPaneMenuActionCompanyTransfer | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTabWithPost | Not populated | Y / Y |
| 17818 / click | 51233 / ListPaneMenuActionCountLocation | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 17820 / click | 51235 / ListPaneMenuActionEditInventoryAttributes | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17821 / click | 51236 / ListPaneMenuActionViewAttribute | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17822 / click | 51237 / ListPaneMenuActionDeleteInventoryAttributes | _webUi.insightListPaneActions.menuActionPerformDelete | Not populated | Y / Y |
| 17824 / click | 51239 / ListPaneMenuActionEditOverrides | _webUi.inventoryInsight.editOverrides | Not populated | Y / Y |
| 17823 / click | 51238 / ListPaneMenuActionDeleteOverrides | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 17825 / click | 51240 / ListPaneMenuActionFinishedItemBreakdown | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17826 / click | 51241 / ListPaneMenuActionStatusChange | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTabWithPost | Not populated | Y / Y |
| 17827 / click | 51242 / ListPaneMenuActionTransfer | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTabWithPost | Not populated | Y / Y |
| 17828 / click | 51243 / ListPaneMenuActionUpdateCatchWeight | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17829 / click | 51244 / ListPaneMenuActionManualReplenish | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 17830 / click | 51245 / ListPaneMenuActionReplenish | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 17831 / click | 51246 / ListPaneMenuActionFreezeLot | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 17832 / click | 51247 / ListPaneMenuActionPrintSelectedInventoryDocs | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 17833 / iggridrequesterror | 51265 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 17834 / iggriddatabound | 51265 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 17835 / iggridselectionrowselectionchanged | 51265 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 17836 / iggridselectionactiverowchanged | 51265 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |
| 17837 / click | 51275 / UpdateCatchWeightSaveButton | _webUi.inventoryInsight.updateCatchWeight | Not populated | Y / Y |
| 17838 / click | 51276 / UpdateCatchWeightCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 25985 / 17799 | GETServiceURL | Y / Y | 76 |
| 25986 / 17799 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 25987 / 17799 | queryParameter_Function_UserName | Y / Y | 44 |
| 25988 / 17799 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25989 / 17799 | POSTServiceURL | Y / Y | 74 |
| 25990 / 17799 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 25991 / 17799 | PostData_Function_UserName | Y / Y | 44 |
| 25992 / 17799 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 25993 / 17799 | PostData_Function_SearchValue | Y / Y | 98 |
| 25994 / 17799 | Post_SuccessCallback | Y / Y | 114 |
| 25995 / 17799 | ModalDialogName | Y / Y | 42 |
| 25996 / 17800 | ModalDialogName | Y / Y | 42 |
| 25997 / 17801 | POSTServiceURL | Y / Y | 144 |
| 25998 / 17801 | Form_Id | Y / Y | 8 |
| 25999 / 17801 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26000 / 17801 | PostData_Function_SearchValue | Y / Y | 98 |
| 26001 / 17801 | Post_SuccessCallback | Y / Y | 114 |
| 26002 / 17801 | ModalDialogName | Y / Y | 56 |
| 26003 / 17802 | ModalDialogName | Y / Y | 56 |
| 26004 / 17806 | ModalDialogName | Y / Y | 42 |
| 26005 / 17807 | ModalDialogName | Y / Y | 56 |
| 26006 / 17812 | URL | Y / Y | 194 |
| 26007 / 17812 | queryParameter_Item | Y / Y | 8 |
| 26008 / 17812 | queryParameter_Company | Y / Y | 14 |
| 26009 / 17812 | queryParameter_Location | Y / Y | 16 |
| 26010 / 17812 | queryParameter_Warehouse | Y / Y | 18 |
| 26011 / 17812 | queryParameter_InternalLocationInv | Y / Y | 38 |
| 26012 / 17813 | URL | Y / Y | 194 |
| 26013 / 17813 | queryParameter_Item | Y / Y | 8 |
| 26014 / 17813 | queryParameter_Company | Y / Y | 14 |
| 26015 / 17813 | queryParameter_Location | Y / Y | 16 |
| 26016 / 17813 | queryParameter_Warehouse | Y / Y | 18 |
| 26017 / 17814 | URL | Y / Y | 102 |
| 26018 / 17814 | queryParameter_Item | Y / Y | 8 |
| 26019 / 17814 | queryParameter_Company | Y / Y | 14 |
| 26020 / 17815 | URL | Y / Y | 120 |
| 26021 / 17815 | queryParameter_InternalLocationInv | Y / Y | 38 |
| 26022 / 17816 | URL | Y / Y | 120 |
| 26023 / 17816 | queryParameter_InternalLocationInv | Y / Y | 38 |
| 26024 / 17817 | URL | Y / Y | 428 |
| 26025 / 17817 | queryParameter_Location | Y / Y | 16 |
| 26026 / 17817 | queryParameter_Item | Y / Y | 8 |
| 26027 / 17817 | queryParameter_Company | Y / Y | 14 |
| 26028 / 17817 | queryParameter_Warehouse | Y / Y | 18 |
| 26029 / 17817 | queryParameter_Lot | Y / Y | 6 |
| 26030 / 17817 | queryParameter_Status | Y / Y | 12 |
| 26031 / 17817 | queryParameter_Grid_ListPaneDataGrid_LicensePlate | Y / Y | 28 |
| 26032 / 17817 | queryParameter_Grid_ListPaneDataGrid_LocInvAttributesId | Y / Y | 42 |
| 26040 / 17819 | POSTServiceURL | Y / Y | 98 |
| 26041 / 17819 | PostData_Grid_ListPaneDataGrid_InternalLocationInv | Y / Y | 42 |
| 26033 / 17818 | ConfirmationMessageCode | Y / Y | 34 |
| 26034 / 17818 | POSTServiceURL | Y / Y | 88 |
| 26035 / 17818 | PostData_Grid_ListPaneDataGrid_Location | Y / Y | 16 |
| 26036 / 17818 | PostData_Grid_ListPaneDataGrid_Item | Y / Y | 8 |
| 26037 / 17818 | PostData_Grid_ListPaneDataGrid_Company | Y / Y | 14 |
| 26038 / 17818 | PostData_Grid_ListPaneDataGrid_Description | Y / Y | 16 |
| 26039 / 17818 | PostData_Grid_ListPaneDataGrid_Warehouse | Y / Y | 18 |
| 26042 / 17820 | URL | Y / Y | 116 |
| 26043 / 17820 | queryParameter_InternalLocationInv | Y / Y | 38 |
| 26044 / 17821 | URL | Y / Y | 116 |
| 26045 / 17821 | queryParameter_InternalLocationInv | Y / Y | 38 |
| 26046 / 17822 | ConfirmationMessageCode | Y / Y | 56 |
| 26047 / 17822 | DELETEServiceURL | Y / Y | 146 |
| 26048 / 17822 | queryParameter_Grid_ListPaneDataGrid_LocInvAttributesId | Y / Y | 42 |
| 26049 / 17822 | Delete_SuccessCallback | Y / Y | 140 |
| 26050 / 17823 | ConfirmationMessageCode | Y / Y | 34 |
| 26051 / 17823 | POSTServiceURL | Y / Y | 120 |
| 26052 / 17823 | PostData_Grid_ListPaneDataGrid_InternalLocationInv | Y / Y | 42 |
| 26053 / 17823 | Post_SuccessCallback | Y / Y | 140 |
| 26054 / 17823 | Post_ErrorCallback | Y / Y | 136 |
| 26055 / 17825 | URL | Y / Y | 312 |
| 26056 / 17825 | queryParameter_Location | Y / Y | 16 |
| 26057 / 17825 | queryParameter_Item | Y / Y | 8 |
| 26058 / 17825 | queryParameter_Company | Y / Y | 14 |
| 26059 / 17825 | queryParameter_Lot | Y / Y | 6 |
| 26060 / 17825 | queryParameter_LicensePlate | Y / Y | 24 |
| 26061 / 17825 | queryParameter_Warehouse | Y / Y | 18 |
| 26062 / 17826 | POSTServiceURL | Y / Y | 80 |
| 26063 / 17826 | PostData_Grid_ListPaneDataGrid_InternalLocationInv | Y / Y | 42 |
| 26064 / 17826 | PostData_Grid_ListPaneDataGrid_InventoryStatus | Y / Y | 26 |
| 26065 / 17827 | POSTServiceURL | Y / Y | 84 |
| 26066 / 17827 | PostData_Grid_ListPaneDataGrid_InternalLocationInv | Y / Y | 42 |
| 26067 / 17828 | ModalDialogName | Y / Y | 56 |
| 26068 / 17828 | PrePopulateModalData_UpdateCatchWeightEditor | Y / Y | 24 |
| 26069 / 17828 | PrePopulateModalData_CatchWeightUMEditor | Y / Y | 30 |
| 26070 / 17829 | URL | Y / Y | 60 |
| 26071 / 17830 | ConfirmationMessageCode | Y / Y | 38 |
| 26072 / 17830 | POSTServiceURL | Y / Y | 124 |
| 26073 / 17830 | PostData_Grid_ListPaneDataGrid_Location | Y / Y | 16 |
| 26074 / 17830 | PostData_Grid_ListPaneDataGrid_Warehouse | Y / Y | 18 |
| 26075 / 17830 | Post_SuccessCallback | Y / Y | 140 |
| 26076 / 17831 | ConfirmationMessageCode | Y / Y | 30 |
| 26077 / 17831 | POSTServiceURL | Y / Y | 74 |
| 26078 / 17831 | PostData_Grid_ListPaneDataGrid_Lot | Y / Y | 6 |
| 26079 / 17831 | PostData_Grid_ListPaneDataGrid_Warehouse | Y / Y | 18 |
| 26080 / 17831 | PostData_Grid_ListPaneDataGrid_Company | Y / Y | 14 |
| 26081 / 17831 | PostData_Grid_ListPaneDataGrid_Item | Y / Y | 8 |
| 26082 / 17831 | Post_SuccessCallback | Y / Y | 140 |
| 26083 / 17832 | URL | Y / Y | 206 |
| 26084 / 17832 | queryParameter_InternalLocationInv | Y / Y | 38 |
| 26085 / 17836 | POSTServiceURL | Y / Y | 74 |
| 26086 / 17836 | PostData_INTERNALLOCATIONINV | Y / Y | 42 |
| 26087 / 17836 | PostData_ITEM | Y / Y | 8 |
| 26088 / 17836 | PostData_LOCATION | Y / Y | 16 |
| 26089 / 17836 | PostData_COMPANY | Y / Y | 14 |
| 26090 / 17836 | PostData_WAREHOUSE | Y / Y | 18 |
| 26091 / 17836 | PostData_LOT | Y / Y | 6 |
| 26092 / 17836 | PostData_LOGISTICSUNIT | Y / Y | 28 |
| 26093 / 17836 | PostData_storedProcedure | Y / Y | 50 |
| 26094 / 17836 | EnableAction_ListPaneMenuActionEdit | Y / Y | 118 |
| 26095 / 17836 | EnableAction_ListPaneMenuActionDeleteOverrides | Y / Y | 174 |
| 26096 / 17836 | EnableAction_ListPaneMenuActionEditOverrides | Y / Y | 292 |
| 26097 / 17836 | EnableAction_ListPaneMenuActionView | Y / Y | 118 |
| 26098 / 17836 | EnableAction_ListPaneMenuActionAdjust | Y / Y | 56 |
| 26099 / 17836 | EnableAction_ListPaneMenuActionUpdateCatchWeight | Y / Y | 84 |
| 26100 / 17836 | EnableAction_ListPaneMenuActionManualReplenish | Y / Y | 8 |
| 26101 / 17836 | EnableAction_ListPaneMenuActionCountLocation | Y / Y | 34 |
| 26102 / 17836 | EnableAction_ListPaneMenuActionReplenish | Y / Y | 40 |
| 26103 / 17836 | EnableAction_ListPaneMenuActionEditInventoryAttributes | Y / Y | 246 |
| 26104 / 17836 | EnableAction_ListPaneMenuActionFreezeLot | Y / Y | 56 |
| 26105 / 17836 | EnableAction_ListPaneMenuActionPrintSelectedInventoryDocs | Y / Y | 104 |
| 26106 / 17836 | EnableAction_ListPaneMenuActionTransfer | Y / Y | 84 |
| 26107 / 17836 | EnableAction_ListPaneMenuActionCompanyTransfer | Y / Y | 180 |
| 26108 / 17836 | EnableAction_ListPaneMenuActionFinishedItemBreakdown_BomCount_DetailPane | Y / Y | 24 |
| 26109 / 17836 | EnableAction_ListPaneMenuActionViewAttribute | Y / Y | 172 |
| 26110 / 17836 | EnableAction_ListPaneMenuActionDeleteInventoryAttributes | Y / Y | 174 |
| 26111 / 17836 | EnableAction_ListPaneMenuActionStatusChange | Y / Y | 268 |
| 26112 / 17836 | EnableAction_MenuActionItemLocationAssignment | Y / Y | 8 |
| 26113 / 17836 | EnableAction_MenuActionItemLocationCapacity | Y / Y | 8 |
| 26114 / 17836 | EnableAction_MenuActionItemUOM | Y / Y | 24 |
| 26115 / 17837 | POSTServiceURL | Y / Y | 124 |
| 26116 / 17837 | queryParameter_Input_UpdateCatchWeightEditor_NewCatchWeight | Y / Y | 10 |
| 26117 / 17837 | PostData_Grid_ListPaneDataGrid_InternalLocationInv | Y / Y | 42 |
| 26118 / 17837 | Post_SuccessCallback | Y / Y | 140 |
| 26119 / 17837 | ModalDialogName | Y / Y | 56 |
| 26120 / 17838 | ModalDialogName | Y / Y | 56 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 97 selected candidate rows for this Screen: **92 accepted tokens** and **5 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40338 | 51221 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40339 | 51222 / Not applicable | data-securityCheckpoint | checkpoint | 27 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40341 | 51227 / Not applicable | data-formId | form_id | 40000 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40342 | 51227 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40344 | 51228 / Not applicable | data-formId | form_id | 40005 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40345 | 51228 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40347 | 51229 / Not applicable | data-formId | form_id | 40010 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40348 | 51229 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40349 | 51230 / Not applicable | data-formId | form_id | 3033 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40350 | 51230 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40352 | 51231 / Not applicable | data-formId | form_id | 3033 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40355 | 51232 / Not applicable | data-formId | form_id | 2772 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40356 | 51232 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40358 | 51233 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40360 | 51234 / Not applicable | data-formId | form_id | 4090 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40361 | 51234 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40362 | 51235 / Not applicable | data-formId | form_id | 4015 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40363 | 51235 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40364 | 51236 / Not applicable | data-formId | form_id | 4015 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40365 | 51237 / Not applicable | data-formId | form_id | 4015 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40366 | 51237 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40367 | 51238 / Not applicable | data-formId | form_id | 4045 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40368 | 51238 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40370 | 51239 / Not applicable | data-formId | form_id | 4045 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40371 | 51239 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40372 | 51240 / Not applicable | data-formId | form_id | 3064 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40373 | 51240 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40375 | 51241 / Not applicable | data-formId | form_id | 4056 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40376 | 51241 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40378 | 51242 / Not applicable | data-formId | form_id | 2775 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40379 | 51242 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40381 | 51243 / Not applicable | data-securityCheckpoint | checkpoint | 26 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40383 | 51244 / Not applicable | data-formId | form_id | 3010 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40384 | 51244 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40386 | 51245 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40389 | 51246 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40390 | 51247 / Not applicable | data-securityCheckpoint | checkpoint | 25 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40391 | 51248 / Not applicable | data-dbcolumn | database_identifier | Location | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40393 | 51249 / Not applicable | data-dbcolumn | database_identifier | Item | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40395 | 51250 / Not applicable | data-dbcolumn | database_identifier | Item_Desc | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40396 | 51251 / Not applicable | data-dbcolumn | database_identifier | Logistics_unit | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40397 | 51252 / Not applicable | data-dbcolumn | database_identifier | Lot | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40399 | 51253 / Not applicable | data-dbcolumn | database_identifier | Expiration_Date | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40401 | 51254 / Not applicable | data-dbcolumn | database_identifier | ITEM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40404 | 51255 / Not applicable | data-dbcolumn | database_identifier | Permanent | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40407 | 51256 / Not applicable | data-dbcolumn | database_identifier | TableOrView | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40411 | 51257 / Not applicable | data-dbcolumn | database_identifier | SERIAL_NUMBER | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40413 | 51258 / Not applicable | data-dbcolumn | database_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40414 | 51259 / Not applicable | data-dbcolumn | database_identifier | Company | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40415 | 51265 / Not applicable | data-dbtable | database_identifier | Metadata_Insight_Inventory_View | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25985 | 51213 / 17799 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25989 | 51213 / 17799 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25994 | 51213 / 17799 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 25997 | 51216 / 17801 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26001 | 51216 / 17801 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26031 | 51232 / 17817 | queryParameter_Grid_ListPaneDataGrid_LicensePlate | grid_field_identifier | LOGISTICS_UNIT | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26032 | 51232 / 17817 | queryParameter_Grid_ListPaneDataGrid_LocInvAttributesId | grid_field_identifier | LOC_INV_ATTRIBUTES_ID | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26033 | 51233 / 17818 | ConfirmationMessageCode | resource_code | MSG_CREATECOUNT01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26035 | 51233 / 17818 | PostData_Grid_ListPaneDataGrid_Location | grid_field_identifier | LOCATION | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26036 | 51233 / 17818 | PostData_Grid_ListPaneDataGrid_Item | grid_field_identifier | ITEM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26037 | 51233 / 17818 | PostData_Grid_ListPaneDataGrid_Company | grid_field_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26038 | 51233 / 17818 | PostData_Grid_ListPaneDataGrid_Description | grid_field_identifier | LOCATION | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26039 | 51233 / 17818 | PostData_Grid_ListPaneDataGrid_Warehouse | grid_field_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26041 | 51234 / 17819 | PostData_Grid_ListPaneDataGrid_InternalLocationInv | grid_field_identifier | INTERNAL_LOCATION_INV | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26046 | 51237 / 17822 | ConfirmationMessageCode | resource_code | MSG_VERIFYDELINVATTRIBUTES01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26048 | 51237 / 17822 | queryParameter_Grid_ListPaneDataGrid_LocInvAttributesId | grid_field_identifier | LOC_INV_ATTRIBUTES_ID | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26049 | 51237 / 17822 | Delete_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26050 | 51238 / 17823 | ConfirmationMessageCode | resource_code | MSG_OVERRIDELOC01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26051 | 51238 / 17823 | POSTServiceURL | relative_api_path | /Inventory/scaleapi/LocationInventoryApi/UMOverrides-Deleted | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26052 | 51238 / 17823 | PostData_Grid_ListPaneDataGrid_InternalLocationInv | grid_field_identifier | INTERNAL_LOCATION_INV | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26053 | 51238 / 17823 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26054 | 51238 / 17823 | Post_ErrorCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultErrorCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26063 | 51241 / 17826 | PostData_Grid_ListPaneDataGrid_InternalLocationInv | grid_field_identifier | INTERNAL_LOCATION_INV | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26064 | 51241 / 17826 | PostData_Grid_ListPaneDataGrid_InventoryStatus | grid_field_identifier | INVENTORY_STS | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26066 | 51242 / 17827 | PostData_Grid_ListPaneDataGrid_InternalLocationInv | grid_field_identifier | INTERNAL_LOCATION_INV | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26071 | 51245 / 17830 | ConfirmationMessageCode | resource_code | MSG_MARKREPLENISH04 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26072 | 51245 / 17830 | POSTServiceURL | relative_api_path | /general/scaleapi/locationApi/locations-MarkedForReplenishment | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26073 | 51245 / 17830 | PostData_Grid_ListPaneDataGrid_Location | grid_field_identifier | LOCATION | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26074 | 51245 / 17830 | PostData_Grid_ListPaneDataGrid_Warehouse | grid_field_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26075 | 51245 / 17830 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26076 | 51246 / 17831 | ConfirmationMessageCode | resource_code | MSG_FREEZELOT02 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26077 | 51246 / 17831 | POSTServiceURL | relative_api_path | /general/scaleapi/LotApi/UpdateStatus | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26078 | 51246 / 17831 | PostData_Grid_ListPaneDataGrid_Lot | grid_field_identifier | LOT | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26079 | 51246 / 17831 | PostData_Grid_ListPaneDataGrid_Warehouse | grid_field_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26080 | 51246 / 17831 | PostData_Grid_ListPaneDataGrid_Company | grid_field_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26081 | 51246 / 17831 | PostData_Grid_ListPaneDataGrid_Item | grid_field_identifier | ITEM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26082 | 51246 / 17831 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26085 | 51265 / 17836 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26093 | 51265 / 17836 | PostData_storedProcedure | stored_procedure_identifier | INV_InsightDetailPaneData | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26115 | 51275 / 17837 | POSTServiceURL | relative_api_path | /general/scaleapi/CatchWeightInformationApi/update-catchweight | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26117 | 51275 / 17837 | PostData_Grid_ListPaneDataGrid_InternalLocationInv | grid_field_identifier | INTERNAL_LOCATION_INV | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26118 | 51275 / 17837 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
