# Shipping Container Insight — Form 4026, Screen 1789

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4026 |
| MAIN_UI_SCREEN Object ID | 1789 |
| Label / Form resource key | Shipping Container Insight / MNU_SHIPPINGCONTAINERINSIGHT |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/4026 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/4026 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4026 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_SHIPPING_CONTAINER_VIEW |
| Help page reference | shipContInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4026 |
| Inspection time (UTC) | 2026-10-02T15:27:36.019Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_SHIPPINGCONTAINERINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_SHIPPING_CONTAINER_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1789 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:13:35.055Z | loaded; landing | https://trav.manhscale.com/scale/insights/4026; Shipping Container Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:13:36.149Z | loaded; actions | https://trav.manhscale.com/scale/insights/4026; Shipping Container Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:13:42.788Z | loaded; criteria_open | https://trav.manhscale.com/scale/insights/4026#search; Shipping Container Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:13:43.108Z | loaded; advanced | https://trav.manhscale.com/scale/insights/4026#search; Shipping Container Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:13:51.392Z | loaded; manifest_criteria | https://trav.manhscale.com/scale/insights/4026#search; Shipping Container Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |

**Visible criteria / entry fields:** Container ID; Shipment ID; Item; Current Location; Status; Container Type; QC; Warehouse; Wave Number; Internal Shipment Number; Shipping Load; Manifest Name; Manifest Status; Rating ID; Shipper Code; Tracking Number.

**Visible grid headers:** Container ID; Shipment ID; Tracking Number; Container Type; Status; Item; Description; Company; Manifest State; Field; Operand; Value.

**Observed action/menu labels:** Edit; Delete; Edit Accessorials; Close; Confirm QC; Dock Transfer; Manifest; Mark for QC; Nest; Print Preview; Print Default Docs; Print Selected Docs; Remove From Manifest; Remove From Nesting; Transfer; Update Packed Quantity; VAS Activity.

**Page groups:** Basic Criteria; Manifest Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Shipping Container Insight is recorded as `insight`. Its saved configuration contains 7 parts, 27 groups, 72 controls, and 33 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4454 / SaveSearchModalDialog | Not populated / Not populated | 20 / 250 | Y / Y / Y | SaveSearchSaveButton |
| 4456 / InsightMenuPane | Not populated / Not populated | 10 / 500 | Y / Y / N | Not populated |
| 4457 / SearchPane | Not populated / Not populated | 10 / 750 | Y / Y / N | InsightMenuApply |
| 4458 / ListPane | Not populated / Not populated | 10 / 1000 | Y / Y / N | Not populated |
| 4455 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4459 / UpdateQuantityModalDialog | Not populated / Not populated | 20 / 7500 | Y / Y / Y | UpdateQuantityUpdateButton |
| 4460 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4454: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18315 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18315; default=None |
| 18316 / SaveSearchModalDialogHeader | 18315 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18315; default=None |
| 18317 / SaveSearchModalDialogBody | 18315 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18315; default=None |
| 18318 / SaveSearchModalDialogFooter | 18315 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18315; default=None |

#### Group 18317: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52164 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18318: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52165 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52166 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4456: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18323 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18323; default=None |
| 18324 / InsightMenuPanel | 18323 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18323; default=None |
| 18325 / InsightMenuFavoritesDropdown | 18323 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18323; default=None |
| 18326 / InsightListPaneMenuPanel | 18323 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18323; default=None |
| 18327 / MenuExportToExcelPanel | 18323 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18323; default=None |
| 18328 / InsightMenuActionsDropdown | 18323 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18323; default=None |

#### Group 18324: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52170 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 52171 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 52172 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 52173 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18326: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52174 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52175 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 52176 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 52177 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18327: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52178 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18328: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52179 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 150 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 52180 / ListPaneMenuActionView | View / VIEW | 150 / 200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 52181 / ListPaneMenuActionDeleteContainer | Delete / DELETE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 52182 / ListPaneMenuActionViewAccessorials | View Accessorials / VIEWACCESSORIALS | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEWACCESSORIALS |
| 52183 / ListPaneMenuActionEditAccessorials | Edit Accessorials / EDITACCESSORIALS | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDITACCESSORIALS |
| 52185 / ListPaneMenuActionCloseContainer | Close / CLOSE | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CLOSE |
| 52184 / ListPaneMenuActionConfirmQC | Confirm QC / CONFIRMQC | 150 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CONFIRMQC |
| 52186 / ListPaneMenuActionDockTransfer | Dock Transfer / DOCKTRANSFER | 150 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DOCKTRANSFER |
| 52187 / ListPaneMenuActionManifestContainer | Manifest / MANIFEST | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=MANIFEST |
| 52188 / ListPaneMenuActionMarkForQC | Mark for QC / MARKFORQC | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=MARKFORQC |
| 52189 / ListPaneMenuActionNest | Nest / NEST | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEST |
| 52190 / ListPaneMenuActionPrintPreviewDocs | Print Preview / PRINTPREVIEW | 150 / 1400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTPREVIEW |
| 52191 / ListPaneMenuActionPrintContainerDocs | Print Default Docs / PRINTDEFAULTDOCS | 150 / 1500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTDEFAULTDOCS |
| 52192 / ListPaneMenuActionPrintSelectedContainerDocs | Print Selected Docs / PRINTSELECTEDDOCS | 150 / 1750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTSELECTEDDOCS |
| 52193 / ListPaneMenuActionRemoveContainerFromManifest | Remove From Manifest / REMOVEFROMMANIFEST | 150 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=REMOVEFROMMANIFEST |
| 52194 / ListPaneMenuActionRemoveNesting | Remove From Nesting / REMOVEFROMNESTING | 150 / 2250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=REMOVEFROMNESTING |
| 52195 / ListPaneMenuActionTransferContainer | Transfer / TRANSFER | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TRANSFERCONTAINER |
| 52196 / ListPaneMenuActionUpdateQuantity | Update Packed Quantity / UPDATEPACKEDQUANTITY | 150 / 2600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=UPDATEPACKEDQUANTITY |
| 52197 / ListPaneMenuActionContainerVasActivity | VAS Activity / VASACTIVITY | 150 / 2750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VASACTIVITY |

### Part 4457: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18329 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18329; default=None |
| 18330 / SearchPaneBasicCriteria | 18329 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18329; default=None |
| 18331 / SearchPaneManifestCriteria | 18329 | Manifest Criteria / MANIFESTCRITERIA | 50 / 22000 | Y / Y | Fixed to top=N; loading=0; nested unit=18329; default=None |
| 18332 / SearchPaneAdvancedCriteria | 18329 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=18329; default=None |

#### Group 18330: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52198 / BasicCriteriaContainerId | Not populated / containerId | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52199 / BasicCriteriaShipmentId | Not populated / shipmentId | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52200 / BasicCriteriaItem | Item / ITEM | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52201 / BasicCriteriaCurrentLocation | Current Location / CURRENTLOCATION | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52202 / BasicCriteriaStatus | Status / STATUS | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52203 / BasicContainerType | Container Type / CONTAINERTYPE | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52204 / BasicCriteriaQC | QC / QC | 280 / 1500 | Y / Y | DATA_SOURCE_TYPE=30; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52205 / BasicCriteriaWarehouse | Warehouse / WAREHOUSE | 280 / 1750 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52206 / BasicCriteriaWaveNumber | Wave Number / WAVENUMBER | 90 / 1800 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52207 / BasicCriteriaInternalShipmentNum | Not populated / internalShipmentNum | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52208 / BasicCriteriaShippingLoadNum | Shipping Load / SHIPPINGLOAD | 90 / 2100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52209 / ShowTopLevelContainers | Show Only Top Level / SHOWONLYTOPLEVEL | 130 / 2300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52210 / BasicCriteriaShowOnlyContainersOnManifest | Show Only Manifested / SHOWONLYMANIFESTED | 130 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52211 / BasicCriteriaShowClosedContainers | Include Closed / INCLUDECLOSED | 130 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18331: SearchPaneManifestCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52212 / ManifestName | Manifest Name / MANIFESTNAME | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52213 / ManifestSts | Manifest Status / MANIFESTSTATUS | 80 / 300 | Y / Y | DATA_SOURCE_TYPE=30; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52214 / RatingId | Rating ID / RATINGID | 80 / 400 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52215 / ShipperCode | Shipper Code / SHIPPERCODE | 80 / 600 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52216 / BasicCriteriaTrackingNumber | Not populated / trackingNumber | 10 / 800 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18332: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52217 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4458: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18333 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18333; default=None |
| 18334 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18334; default=None |

#### Group 18333: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52218 / ListPaneSummaryLoads | Loads / LOADS | 50 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52219 / ListPaneSummaryShipments | Shipments / SHIPMENTS | 50 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52220 / ListPaneSummaryContainers | Containers / CONTAINERS | 50 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52221 / ListPaneSummaryLocations | Locations / LOCATIONS | 50 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18334: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52222 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 52222 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18738 / Not populated | CONTAINER_ID / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18740 / Not populated | INTERNAL_CONTAINER_NUM / Not populated / Not populated | Not populated / 20 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18741 / CONTAINER_ID | Not populated / Not populated / containerId | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18742 / SHIPMENT_ID | Not populated / Shipment ID / SHIPMENTID | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18743 / TRACKING_NUMBER | Not populated / Tracking Number / TRACKINGNUMBER | 10 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18766 / CONTAINER_TYPE | Not populated / Container Type / CONTAINER_TYPE | 10 / 10 / 55 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18744 / SHIPPING_CONTAINER_STATUS | Not populated / Status / STATUS | 10 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18745 / ITEM | Not populated / Item / ITEM | 10 / 10 / 70 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18746 / ITEM_DESC | Not populated / Not populated / ItemDescription | 10 / 10 / 80 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18747 / COMPANY | Not populated / Company / COMPANY | 10 / 10 / 90 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18748 / MANIFEST_STATE | Not populated / Manifest State / MANIFESTSTATE | 10 / 10 / 95 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18749 / INTERNAL_SHIPMENT_NUM | Not populated / Not populated / internalShipmentNum | 10 / 10 / 100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18750 / INTERNAL_CONTAINER_NUM | Not populated / Not populated / internalContainerNum | 10 / 10 / 110 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18751 / PARENT_CONTAINER_ID | Not populated / Not populated / parentContainerId | 10 / 10 / 120 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18752 / LOCATION | Not populated / Location / LOCATION | 10 / 10 / 130 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18753 / WAREHOUSE | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 140 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18754 / SHIPPING_LOAD_NUM | Not populated / Shipping Load Number / SHIPPINGLOADNUM | 10 / 10 / 150 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18755 / STATUSNUMERIC | Not populated / Status (Numeric) / STATUSNUMERIC | 20 / 10 / 160 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18756 / IN_DELETION | Not populated / Shipment in Deletion / SHIPMENTINDELETION | 40 / 10 / 170 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18757 / PARENT | Not populated / Parent / PARENT | 10 / 10 / 190 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18758 / VAS | Not populated / VAS / VAS | 10 / 10 / 200 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18759 / QCSTATUS | Not populated / QC Status / QCSTATUS | 10 / 10 / 210 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18760 / CONTENTS_COUNT | Not populated / Contents Count / CONTENTSCOUNT | 20 / 10 / 220 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18761 / CARRIER | Not populated / Carrier / CARRIER | 10 / 10 / 250 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18762 / CARRIERSERVICE | Not populated / Carrier Service / CARRIERSERVICE | 10 / 10 / 300 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18763 / WEIGHT | Not populated / Weight / WEIGHT | 20 / 10 / 350 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=60; DATA_SOURCE_TYPE=None |
| 18764 / TOTALFREIGHTCHARGE | Not populated / Total Freight Charge / TOTALFREIGHTCHARGE | 20 / 10 / 400 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=40; DATA_SOURCE_TYPE=None |
| 18765 / MSN | Not populated / Msn / MSN | 20 / 10 / 450 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18767 / QUANTITY | Not populated / Quantity / QUANTITY | 20 / 10 / 550 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 18768 / ICON | Not populated / Icon / ICON | 10 / 10 / 575 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18769 / COLOR | Not populated / Color / COLOR | 10 / 10 / 600 / 1 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18739 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 610 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18770 / QCCONDITION | Not populated / Not populated / Not populated | 10 / 10 / 620 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4455: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18319 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18319; default=None |
| 18320 / GadgetCalculationQueryDialogHeader | 18319 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18319; default=None |
| 18321 / GadgetCalculationQueryDialogBody | 18319 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18319; default=None |
| 18322 / GadgetCalculationQueryDialogFooter | 18319 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18319; default=None |

#### Group 18321: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52167 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18322: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52168 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52169 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4459: UpdateQuantityModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18335 / UpdateQuantityModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18335; default=None |
| 18336 / UpdateQuantityModalDialogHeader | 18335 | Update Packed Quantity / UPDATEPACKEDQUANTITY | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18335; default=None |
| 18337 / UpdateQuantityModalDialogBody | 18335 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18335; default=None |
| 18338 / UpdateQuantityModalDialogFooter | 18335 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18335; default=None |

#### Group 18337: UpdateQuantityModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52223 / UpdateQuantityEditor | Quantity / QUANTITY | 90 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18338: UpdateQuantityModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52224 / UpdateQuantityUpdateButton | Update / BTN_UPDATE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52225 / UpdateQuantityCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4460: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18339 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18339; default=None |
| 18340 / DetailPaneHeaderPanelTrailLeadSts | Not populated | Not populated / Not populated | 60 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18340; default=None |
| 18341 / indicatorpane | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18341; default=None |

#### Group 18339: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52226 / DetailPaneHeaderContainerID | Not populated / Not populated | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=608; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52227 / DetailPaneHeaderStatus | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=608; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52228 / DetailPaneHeaderItem | Not populated / Not populated | 30 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=608; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52229 / DetailPaneHeaderItemDesc | Not populated / Not populated | 30 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=608; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52230 / DetailPaneHeaderCompany | Not populated / Not populated | 30 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=608; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52231 / DetailPaneHeaderWebImage | Not populated / Not populated | 170 / 2250 | N / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=608; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18341: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52232 / ShipContInsightIndicatorTileChildContainers | Containers / CONTAINERS | 360 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52233 / ShipContInsightIndicatorTileContents | Container Contents / CONTAINERCONTENTS | 360 / 350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52234 / ShipmentInsightWavedIndicatorTileOpenWork | Open Work / OPENWORK | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 52235 / ShipmentInsightWavedIndicatorTileTransactions | Transactions / TRANSACTIONS | 360 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 86 control attributes, 38 events, and 100 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 41297 | 52164 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 41298 | 52164 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 41299 | 52173 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41300 | 52174 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41301 | 52179 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 41302 | 52179 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41303 | 52180 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 41304 | 52181 / ListPaneMenuActionDeleteContainer | data-formId | Y / Y / N | 4 / 0 |
| 41305 | 52181 / ListPaneMenuActionDeleteContainer | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41306 | 52181 / ListPaneMenuActionDeleteContainer | data-divider | Y / Y / N | 8 / 0 |
| 41307 | 52182 / ListPaneMenuActionViewAccessorials | data-formId | Y / Y / N | 8 / 0 |
| 41308 | 52183 / ListPaneMenuActionEditAccessorials | data-formId | Y / Y / N | 8 / 0 |
| 41309 | 52183 / ListPaneMenuActionEditAccessorials | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41312 | 52185 / ListPaneMenuActionCloseContainer | data-formId | Y / Y / N | 8 / 0 |
| 41313 | 52185 / ListPaneMenuActionCloseContainer | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41310 | 52184 / ListPaneMenuActionConfirmQC | data-formId | Y / Y / N | 8 / 0 |
| 41311 | 52184 / ListPaneMenuActionConfirmQC | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41314 | 52186 / ListPaneMenuActionDockTransfer | data-formId | Y / Y / N | 8 / 0 |
| 41315 | 52186 / ListPaneMenuActionDockTransfer | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41316 | 52187 / ListPaneMenuActionManifestContainer | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41317 | 52188 / ListPaneMenuActionMarkForQC | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41318 | 52188 / ListPaneMenuActionMarkForQC | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41319 | 52189 / ListPaneMenuActionNest | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 41320 | 52189 / ListPaneMenuActionNest | data-formId | Y / Y / N | 4 / 0 |
| 41321 | 52189 / ListPaneMenuActionNest | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41322 | 52190 / ListPaneMenuActionPrintPreviewDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41323 | 52191 / ListPaneMenuActionPrintContainerDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41324 | 52192 / ListPaneMenuActionPrintSelectedContainerDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41325 | 52193 / ListPaneMenuActionRemoveContainerFromManifest | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41326 | 52194 / ListPaneMenuActionRemoveNesting | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41327 | 52195 / ListPaneMenuActionTransferContainer | data-formId | Y / Y / N | 8 / 0 |
| 41328 | 52195 / ListPaneMenuActionTransferContainer | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41329 | 52196 / ListPaneMenuActionUpdateQuantity | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 41330 | 52196 / ListPaneMenuActionUpdateQuantity | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 41331 | 52197 / ListPaneMenuActionContainerVasActivity | data-formId | Y / Y / N | 8 / 0 |
| 41332 | 52197 / ListPaneMenuActionContainerVasActivity | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 41333 | 52198 / BasicCriteriaContainerId | data-dbcolumn | Y / Y / N | 118 / 0 |
| 41334 | 52198 / BasicCriteriaContainerId | Lookup | Y / Y / N | 90 / 1 |
| 41335 | 52199 / BasicCriteriaShipmentId | data-dbcolumn | Y / Y / N | 22 / 0 |
| 41336 | 52199 / BasicCriteriaShipmentId | Lookup | Y / Y / N | 88 / 1 |
| 41337 | 52200 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 41338 | 52200 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 41339 | 52201 / BasicCriteriaCurrentLocation | data-dbcolumn | Y / Y / N | 16 / 0 |
| 41340 | 52202 / BasicCriteriaStatus | data-dbcolumn | Y / Y / N | 50 / 0 |
| 41341 | 52202 / BasicCriteriaStatus | data-dataType | Y / Y / N | 2 / 0 |
| 41342 | 52203 / BasicContainerType | data-dbcolumn | Y / Y / N | 28 / 0 |
| 41343 | 52204 / BasicCriteriaQC | data-dbcolumn | Y / Y / N | 16 / 0 |
| 41344 | 52205 / BasicCriteriaWarehouse | defaultValue | Y / Y / Y | 32 / 0 |
| 41345 | 52205 / BasicCriteriaWarehouse | data-dbcolumn | Y / Y / N | 18 / 0 |
| 41346 | 52206 / BasicCriteriaWaveNumber | data-dbcolumn | Y / Y / N | 20 / 0 |
| 41347 | 52206 / BasicCriteriaWaveNumber | Lookup | Y / Y / N | 106 / 1 |
| 41348 | 52206 / BasicCriteriaWaveNumber | nullable | Y / Y / Y | 8 / 0 |
| 41349 | 52207 / BasicCriteriaInternalShipmentNum | nullable | Y / Y / Y | 8 / 0 |
| 41350 | 52207 / BasicCriteriaInternalShipmentNum | data-dbcolumn | Y / Y / N | 42 / 0 |
| 41351 | 52208 / BasicCriteriaShippingLoadNum | data-dbcolumn | Y / Y / N | 34 / 0 |
| 41352 | 52208 / BasicCriteriaShippingLoadNum | nullable | Y / Y / Y | 8 / 0 |
| 41353 | 52209 / ShowTopLevelContainers | data-dbcolumn | Y / Y / N | 12 / 0 |
| 41354 | 52209 / ShowTopLevelContainers | data-positiveCondition | Y / Y / N | 6 / 0 |
| 41355 | 52209 / ShowTopLevelContainers | data-negativeCondition | Y / Y / N | 0 / 0 |
| 41356 | 52210 / BasicCriteriaShowOnlyContainersOnManifest | data-dbcolumn | Y / Y / N | 28 / 0 |
| 41357 | 52210 / BasicCriteriaShowOnlyContainersOnManifest | data-positiveCondition | Y / Y / N | 20 / 0 |
| 41358 | 52210 / BasicCriteriaShowOnlyContainersOnManifest | data-negativeCondition | Y / Y / N | 0 / 0 |
| 41359 | 52211 / BasicCriteriaShowClosedContainers | data-dbcolumn | Y / Y / N | 64 / 0 |
| 41360 | 52211 / BasicCriteriaShowClosedContainers | data-positiveCondition | Y / Y / N | 0 / 0 |
| 41361 | 52211 / BasicCriteriaShowClosedContainers | data-negativeCondition | Y / Y / N | 12 / 0 |
| 41362 | 52212 / ManifestName | data-dbcolumn | Y / Y / N | 24 / 1 |
| 41363 | 52213 / ManifestSts | data-dbcolumn | Y / Y / N | 28 / 0 |
| 41364 | 52214 / RatingId | data-dbcolumn | Y / Y / N | 16 / 0 |
| 41365 | 52215 / ShipperCode | data-dbcolumn | Y / Y / N | 22 / 0 |
| 41366 | 52216 / BasicCriteriaTrackingNumber | data-dbcolumn | Y / Y / N | 30 / 0 |
| 41367 | 52220 / ListPaneSummaryContainers | data-aggregateClause | Y / Y / Y | 58 / 0 |
| 41368 | 52221 / ListPaneSummaryLocations | data-aggregateClause | Y / Y / Y | 48 / 0 |
| 41369 | 52222 / ListPaneDataGrid | data-dbtable | Y / Y / N | 80 / 0 |
| 41370 | 52222 / ListPaneDataGrid | data-queryEngineId | Y / Y / N | 68 / 0 |
| 41371 | 52222 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 42 / 0 |
| 41372 | 52222 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 44 / 0 |
| 41373 | 52222 / ListPaneDataGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 34 / 0 |
| 41374 | 52222 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 41375 | 52222 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 41376 | 52223 / UpdateQuantityEditor | data-rule-range | Y / Y / Y | 10 / 0 |
| 41377 | 52223 / UpdateQuantityEditor | data-msg-range | Y / Y / Y | 18 / 2 |
| 41378 | 52226 / DetailPaneHeaderContainerID | href | Y / Y / Y | 88 / 0 |
| 41379 | 52232 / ShipContInsightIndicatorTileChildContainers | data-indicatorTileGoToInsight | Y / Y / Y | 452 / 0 |
| 41380 | 52233 / ShipContInsightIndicatorTileContents | data-indicatorTileGoToInsight | Y / Y / Y | 532 / 0 |
| 41381 | 52234 / ShipmentInsightWavedIndicatorTileOpenWork | data-indicatorTileGoToInsight | Y / Y / Y | 280 / 0 |
| 41382 | 52235 / ShipmentInsightWavedIndicatorTileTransactions | data-indicatorTileGoToInsight | Y / Y / Y | 366 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18342 / click | 52165 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18343 / click | 52166 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18344 / click | 52168 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18345 / click | 52169 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18346 / click | 52170 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18347 / click | 52171 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18348 / click | 52172 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18349 / click | 52173 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18350 / click | 52174 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18351 / click | 52175 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 18352 / click | 52176 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18353 / click | 52177 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18354 / click | 52178 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18355 / click | 52179 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18356 / click | 52180 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18357 / click | 52181 / ListPaneMenuActionDeleteContainer | _webUi.insightListPaneActions.menuActionPerformDelete | Not populated | Y / Y |
| 18358 / click | 52182 / ListPaneMenuActionViewAccessorials | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18359 / click | 52183 / ListPaneMenuActionEditAccessorials | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18361 / click | 52185 / ListPaneMenuActionCloseContainer | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18360 / click | 52184 / ListPaneMenuActionConfirmQC | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18362 / click | 52186 / ListPaneMenuActionDockTransfer | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18363 / click | 52187 / ListPaneMenuActionManifestContainer | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 18364 / click | 52188 / ListPaneMenuActionMarkForQC | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18365 / click | 52189 / ListPaneMenuActionNest | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTabWithPost | Not populated | Y / Y |
| 18366 / click | 52190 / ListPaneMenuActionPrintPreviewDocs | _webUi.dialog.printPreviewSelection | Not populated | Y / Y |
| 18367 / click | 52191 / ListPaneMenuActionPrintContainerDocs | _webUi.insightListPaneActions.menuActionPerformGet | Not populated | Y / Y |
| 18368 / click | 52192 / ListPaneMenuActionPrintSelectedContainerDocs | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 18369 / click | 52193 / ListPaneMenuActionRemoveContainerFromManifest | _webUi.shippingContainerInsight.removeFromManifest | Not populated | Y / Y |
| 18370 / click | 52194 / ListPaneMenuActionRemoveNesting | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 18371 / click | 52195 / ListPaneMenuActionTransferContainer | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18372 / click | 52196 / ListPaneMenuActionUpdateQuantity | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18373 / click | 52197 / ListPaneMenuActionContainerVasActivity | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18374 / iggridrequesterror | 52222 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18375 / iggriddatabound | 52222 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18376 / iggridselectionrowselectionchanged | 52222 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18377 / iggridselectionactiverowchanged | 52222 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |
| 18378 / click | 52224 / UpdateQuantityUpdateButton | _webUi.shippingContainerInsight.updateContainerQuantity | Not populated | Y / Y |
| 18379 / click | 52225 / UpdateQuantityCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 27137 / 18342 | GETServiceURL | Y / Y | 76 |
| 27138 / 18342 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 27139 / 18342 | queryParameter_Function_UserName | Y / Y | 44 |
| 27140 / 18342 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27141 / 18342 | POSTServiceURL | Y / Y | 74 |
| 27142 / 18342 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 27143 / 18342 | PostData_Function_UserName | Y / Y | 44 |
| 27144 / 18342 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 27145 / 18342 | PostData_Function_SearchValue | Y / Y | 98 |
| 27146 / 18342 | Post_SuccessCallback | Y / Y | 114 |
| 27147 / 18342 | ModalDialogName | Y / Y | 42 |
| 27148 / 18343 | ModalDialogName | Y / Y | 42 |
| 27149 / 18344 | POSTServiceURL | Y / Y | 144 |
| 27150 / 18344 | Form_Id | Y / Y | 8 |
| 27151 / 18344 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 27152 / 18344 | PostData_Function_SearchValue | Y / Y | 98 |
| 27153 / 18344 | Post_SuccessCallback | Y / Y | 114 |
| 27154 / 18344 | ModalDialogName | Y / Y | 56 |
| 27155 / 18345 | ModalDialogName | Y / Y | 56 |
| 27156 / 18349 | ModalDialogName | Y / Y | 42 |
| 27157 / 18350 | ModalDialogName | Y / Y | 56 |
| 27158 / 18355 | URL | Y / Y | 164 |
| 27159 / 18356 | URL | Y / Y | 164 |
| 27160 / 18357 | ConfirmationMessageCode | Y / Y | 42 |
| 27161 / 18357 | ConfirmationTitleCode | Y / Y | 30 |
| 27162 / 18357 | DELETEServiceURL | Y / Y | 80 |
| 27163 / 18357 | queryParameter_ID | Y / Y | 4 |
| 27164 / 18357 | queryParameter_warehouse | Y / Y | 18 |
| 27165 / 18357 | Delete_SuccessCallback | Y / Y | 140 |
| 27166 / 18358 | queryParameter_Grid_ListPaneDataGrid_InternalNum | Y / Y | 44 |
| 27167 / 18358 | URL | Y / Y | 188 |
| 27168 / 18358 | queryParameter_InternalNumType | Y / Y | 18 |
| 27169 / 18359 | queryParameter_Grid_ListPaneDataGrid_InternalNum | Y / Y | 44 |
| 27170 / 18359 | URL | Y / Y | 188 |
| 27171 / 18359 | queryParameter_InternalNumType | Y / Y | 18 |
| 27174 / 18361 | URL | Y / Y | 230 |
| 27175 / 18361 | queryParameter_InternalContainerNumber | Y / Y | 46 |
| 27172 / 18360 | URL | Y / Y | 116 |
| 27173 / 18360 | queryParameter_ID | Y / Y | 4 |
| 27176 / 18362 | URL | Y / Y | 206 |
| 27177 / 18362 | queryParameter_InternalContainerNumber | Y / Y | 46 |
| 27178 / 18363 | POSTServiceURL | Y / Y | 138 |
| 27179 / 18363 | PostData_InternalContainerNumber | Y / Y | 46 |
| 27180 / 18363 | Post_SuccessCallback | Y / Y | 140 |
| 27181 / 18364 | POSTServiceURL | Y / Y | 140 |
| 27182 / 18364 | PostData_Grid_ListPaneDataGrid_InternalContainerNumber | Y / Y | 44 |
| 27183 / 18364 | PostData_Grid_ListPaneDataGrid_ShipmentID | Y / Y | 22 |
| 27184 / 18364 | PostData_Grid_ListPaneDataGrid_ContainerId | Y / Y | 24 |
| 27185 / 18364 | Post_SuccessCallback | Y / Y | 140 |
| 27186 / 18365 | POSTServiceURL | Y / Y | 96 |
| 27187 / 18365 | PostData_Grid_ListPaneDataGrid_InternalContainerNumber | Y / Y | 44 |
| 27188 / 18365 | PostData_Grid_ListPaneDataGrid_ContainerId | Y / Y | 24 |
| 27189 / 18366 | queryParameter_internalNum | Y / Y | 46 |
| 27190 / 18366 | printProcess | Y / Y | 4 |
| 27191 / 18367 | GETServiceURL | Y / Y | 54 |
| 27192 / 18367 | queryParameter_internalNum | Y / Y | 46 |
| 27193 / 18367 | queryParameter_printProcess | Y / Y | 4 |
| 27194 / 18368 | URL | Y / Y | 220 |
| 27195 / 18368 | queryParameter_InternalContainerNumber | Y / Y | 46 |
| 27196 / 18369 | DELETEServiceURL | Y / Y | 150 |
| 27197 / 18369 | queryParameter_InternalContainerNumber | Y / Y | 46 |
| 27198 / 18369 | Delete_SuccessCallback | Y / Y | 140 |
| 27199 / 18370 | POSTServiceURL | Y / Y | 112 |
| 27200 / 18370 | Post_ErrorCallback | Y / Y | 134 |
| 27201 / 18370 | queryParameter_Grid_ListPaneDataGrid_InternalContainerNumber | Y / Y | 44 |
| 27202 / 18371 | URL | Y / Y | 206 |
| 27203 / 18371 | queryParameter_InternalContainerNumber | Y / Y | 46 |
| 27204 / 18372 | ModalDialogName | Y / Y | 50 |
| 27205 / 18372 | PrePopulateModalData_UpdateQuantityEditor | Y / Y | 16 |
| 27206 / 18373 | URL | Y / Y | 376 |
| 27207 / 18373 | queryParameter_ID | Y / Y | 4 |
| 27208 / 18377 | PostRowChanged | Y / Y | 92 |
| 27209 / 18377 | POSTServiceURL | Y / Y | 74 |
| 27210 / 18377 | PostData_internalContainerNum | Y / Y | 44 |
| 27211 / 18377 | PostData_storedProcedure | Y / Y | 64 |
| 27212 / 18377 | EnableAction_ListPaneMenuActionEdit | Y / Y | 166 |
| 27213 / 18377 | EnableAction_ListPaneMenuActionView | Y / Y | 96 |
| 27214 / 18377 | EnableAction_ListPaneMenuActionDeleteContainer | Y / Y | 176 |
| 27215 / 18377 | EnableAction_ListPaneMenuActionPrintContainerDocs | Y / Y | 34 |
| 27216 / 18377 | EnableAction_ListPaneMenuActionPrintPreviewDocs | Y / Y | 34 |
| 27217 / 18377 | EnableAction_ListPaneMenuActionPrintSelectedContainerDocs | Y / Y | 34 |
| 27218 / 18377 | EnableAction_ListPaneMenuActionCloseContainer | Y / Y | 40 |
| 27219 / 18377 | EnableAction_ListPaneMenuActionContainerVasActivity | Y / Y | 74 |
| 27220 / 18377 | EnableAction_ListPaneMenuActionManifestContainer | Y / Y | 236 |
| 27221 / 18377 | EnableAction_ListPaneMenuActionRemoveContainerFromManifest | Y / Y | 144 |
| 27222 / 18377 | EnableAction_ListPaneMenuActionMarkForQC | Y / Y | 252 |
| 27223 / 18377 | EnableAction_ListPaneMenuActionTransferContainer | Y / Y | 128 |
| 27224 / 18377 | EnableAction_ListPaneMenuActionUpdateQuantity | Y / Y | 176 |
| 27225 / 18377 | EnableAction_ListPaneMenuActionDockTransfer | Y / Y | 38 |
| 27226 / 18377 | EnableAction_ListPaneMenuActionNest | Y / Y | 246 |
| 27227 / 18377 | EnableAction_ListPaneMenuActionRemoveNesting | Y / Y | 110 |
| 27228 / 18377 | EnableAction_ListPaneMenuActionViewAccessorials | Y / Y | 74 |
| 27229 / 18377 | EnableAction_ListPaneMenuActionEditAccessorials | Y / Y | 74 |
| 27230 / 18377 | EnableAction_ListPaneMenuActionConfirmQC | Y / Y | 84 |
| 27231 / 18378 | POSTServiceURL | Y / Y | 150 |
| 27232 / 18378 | queryParameter_Input_UpdateQuantityEditor_NewQuantity | Y / Y | 10 |
| 27233 / 18378 | Post_SuccessCallback | Y / Y | 140 |
| 27234 / 18378 | Post_ErrorCallback | Y / Y | 126 |
| 27235 / 18378 | ModalDialogName | Y / Y | 50 |
| 27236 / 18379 | ModalDialogName | Y / Y | 50 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 82 selected candidate rows for this Screen: **80 accepted tokens** and **2 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 41299 | 52173 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41300 | 52174 / Not applicable | data-securityCheckpoint | checkpoint | 28 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41301 | 52179 / Not applicable | data-formId | form_id | 3020 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41302 | 52179 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41303 | 52180 / Not applicable | data-formId | form_id | 3020 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41304 | 52181 / Not applicable | data-formId | form_id | 56 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41305 | 52181 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41307 | 52182 / Not applicable | data-formId | form_id | 4050 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41308 | 52183 / Not applicable | data-formId | form_id | 4050 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41309 | 52183 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41310 | 52184 / Not applicable | data-formId | form_id | 4005 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41311 | 52184 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41312 | 52185 / Not applicable | data-formId | form_id | 3029 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41313 | 52185 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41314 | 52186 / Not applicable | data-formId | form_id | 3024 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41315 | 52186 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41316 | 52187 / Not applicable | data-securityCheckpoint | checkpoint | 25 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41318 | 52188 / Not applicable | data-securityCheckpoint | checkpoint | 29 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41320 | 52189 / Not applicable | data-formId | form_id | 30 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41321 | 52189 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41322 | 52190 / Not applicable | data-securityCheckpoint | checkpoint | 35 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41323 | 52191 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41324 | 52192 / Not applicable | data-securityCheckpoint | checkpoint | 34 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41325 | 52193 / Not applicable | data-securityCheckpoint | checkpoint | 26 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41326 | 52194 / Not applicable | data-securityCheckpoint | checkpoint | 30 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41327 | 52195 / Not applicable | data-formId | form_id | 3011 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41328 | 52195 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41330 | 52196 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41331 | 52197 / Not applicable | data-formId | form_id | 3043 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41332 | 52197 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41335 | 52199 / Not applicable | data-dbcolumn | database_identifier | Shipment_Id | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41337 | 52200 / Not applicable | data-dbcolumn | database_identifier | Item | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41339 | 52201 / Not applicable | data-dbcolumn | database_identifier | LOCATION | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41340 | 52202 / Not applicable | data-dbcolumn | database_identifier | SHIPPING_CONTAINER_STATUS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41342 | 52203 / Not applicable | data-dbcolumn | database_identifier | CONTAINER_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41343 | 52204 / Not applicable | data-dbcolumn | database_identifier | QCSTATUS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41345 | 52205 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41346 | 52206 / Not applicable | data-dbcolumn | database_identifier | Launch_Num | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41350 | 52207 / Not applicable | data-dbcolumn | database_identifier | INTERNAL_SHIPMENT_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41351 | 52208 / Not applicable | data-dbcolumn | database_identifier | SHIPPING_LOAD_NUM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41353 | 52209 / Not applicable | data-dbcolumn | database_identifier | PARENT | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41356 | 52210 / Not applicable | data-dbcolumn | database_identifier | MANIFEST_STATE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41359 | 52211 / Not applicable | data-dbcolumn | database_identifier | SHIPPING_CONTAINER_STATUS_CLOSED | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41362 | 52212 / Not applicable | data-dbcolumn | database_identifier | ManifestName | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41363 | 52213 / Not applicable | data-dbcolumn | database_identifier | ManifestStatus | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41364 | 52214 / Not applicable | data-dbcolumn | database_identifier | RATINGID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41365 | 52215 / Not applicable | data-dbcolumn | database_identifier | SHIPPERCODE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41366 | 52216 / Not applicable | data-dbcolumn | database_identifier | Tracking_Number | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 41369 | 52222 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_SHIPPING_CONTAINER_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27137 | 52165 / 18342 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27141 | 52165 / 18342 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27146 | 52165 / 18342 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27149 | 52168 / 18344 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27153 | 52168 / 18344 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27160 | 52181 / 18357 | ConfirmationMessageCode | resource_code | MSG_DELETECONTAINER01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27161 | 52181 / 18357 | ConfirmationTitleCode | resource_code | DELETECONTAINER | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27162 | 52181 / 18357 | DELETEServiceURL | relative_api_path | /general/scaleapi/ShippingContainersApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27165 | 52181 / 18357 | Delete_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27166 | 52182 / 18358 | queryParameter_Grid_ListPaneDataGrid_InternalNum | grid_field_identifier | INTERNAL_CONTAINER_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27169 | 52183 / 18359 | queryParameter_Grid_ListPaneDataGrid_InternalNum | grid_field_identifier | INTERNAL_CONTAINER_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27178 | 52187 / 18363 | POSTServiceURL | relative_api_path | /general/scaleapi/shippingContainersApi/shippingContainers-Manifested | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27180 | 52187 / 18363 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27181 | 52188 / 18364 | POSTServiceURL | relative_api_path | /general/scaleapi/shippingContainersApi/shippingContainers-MarkedForQC | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27182 | 52188 / 18364 | PostData_Grid_ListPaneDataGrid_InternalContainerNumber | grid_field_identifier | INTERNAL_CONTAINER_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27183 | 52188 / 18364 | PostData_Grid_ListPaneDataGrid_ShipmentID | grid_field_identifier | SHIPMENT_ID | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27184 | 52188 / 18364 | PostData_Grid_ListPaneDataGrid_ContainerId | grid_field_identifier | CONTAINER_ID | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27185 | 52188 / 18364 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27187 | 52189 / 18365 | PostData_Grid_ListPaneDataGrid_InternalContainerNumber | grid_field_identifier | INTERNAL_CONTAINER_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27188 | 52189 / 18365 | PostData_Grid_ListPaneDataGrid_ContainerId | grid_field_identifier | CONTAINER_ID | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27191 | 52191 / 18367 | GETServiceURL | relative_api_path | /general/scaleapi/PrintApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27196 | 52193 / 18369 | DELETEServiceURL | relative_api_path | /general/scaleapi/shippingContainersApi/shippingContainers-RemovedManifest? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27198 | 52193 / 18369 | Delete_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27199 | 52194 / 18370 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShippingContainersApi/Removed-Nesting | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27200 | 52194 / 18370 | Post_ErrorCallback | callback_identifier | _webUi.shippingContainerInsight.successCallBackForRemoveFromNesting | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27201 | 52194 / 18370 | queryParameter_Grid_ListPaneDataGrid_InternalContainerNumber | grid_field_identifier | INTERNAL_CONTAINER_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27209 | 52222 / 18377 | POSTServiceURL | relative_api_path | /outbound/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27211 | 52222 / 18377 | PostData_storedProcedure | stored_procedure_identifier | SHPContainer_InsightListPaneData | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27231 | 52224 / 18378 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShippingContainersApi/shippingContainers-QuantityUpdated | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27233 | 52224 / 18378 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27234 | 52224 / 18378 | Post_ErrorCallback | callback_identifier | _webUi.shippingContainerInsight.updateContainerQtyErrorCallback | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
