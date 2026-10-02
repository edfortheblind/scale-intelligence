# Manifest Insight — Form 2798, Screen 1771

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2798 |
| MAIN_UI_SCREEN Object ID | 1771 |
| Label / Form resource key | Manifest Insight / MNU_MANIFESTINSIGHT |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2798 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2798 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2798 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_MANIFEST_VIEW |
| Help page reference | manifestInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2798 |
| Inspection time (UTC) | 2026-10-02T15:24:42.556Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_MANIFESTINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_MANIFEST_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1771 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:11:20.693Z | loaded; landing | https://trav.manhscale.com/scale/insights/2798; Manifest Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:11:30.434Z | loaded; actions | https://trav.manhscale.com/scale/insights/2798; Manifest Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:11:31.462Z | loaded; criteria_open | https://trav.manhscale.com/scale/insights/2798#search; Manifest Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:11:39.303Z | loaded; advanced | https://trav.manhscale.com/scale/insights/2798#search; Manifest Insight | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |

**Visible criteria / entry fields:** Manifest Name; Rating ID; Warehouse.

**Visible grid headers:** Icon; Manifest Name; Rating ID; Shipper; Manifest Status; Ship Date; Transmit Status; Color; Field; Operand; Value.

**Observed action/menu labels:** Close; Print Container Manifest; View Containers; Print UPS Summary Barcode Label.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Manifest Insight is recorded as `insight`. Its saved configuration contains 6 parts, 20 groups, 32 controls, and 15 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4343 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4344 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4345 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4346 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4347 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4348 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |

### Part 4343: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17935 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17935; default=None |
| 17936 / SaveSearchModalDialogHeader | 17935 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17935; default=None |
| 17937 / SaveSearchModalDialogBody | 17935 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17935; default=None |
| 17938 / SaveSearchModalDialogFooter | 17935 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17935; default=None |

#### Group 17937: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51407 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17938: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51408 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51409 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4344: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17939 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17939; default=None |
| 17940 / GadgetCalculationQueryDialogHeader | 17939 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=17939; default=None |
| 17941 / GadgetCalculationQueryDialogBody | 17939 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17939; default=None |
| 17942 / GadgetCalculationQueryDialogFooter | 17939 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17939; default=None |

#### Group 17941: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51410 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17942: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51411 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51412 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4345: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17943 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17943; default=None |
| 17944 / InsightMenuPanel | 17943 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=17943; default=None |
| 17945 / InsightMenuFavoritesDropdown | 17943 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=17943; default=None |
| 17946 / InsightListPaneMenuPanel | 17943 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=17943; default=None |
| 17947 / MenuExportToExcelPanel | 17943 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=17943; default=None |
| 17948 / InsightMenuActionsDropdown | 17943 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=17943; default=None |

#### Group 17944: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51413 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51414 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51415 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51416 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17946: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51417 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51418 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 51419 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51420 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 17947: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51421 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 17948: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51424 / ListPaneMenuActionClose | Close / CLOSE | 150 / 200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CLOSE |
| 51422 / ListPaneMenuActionPrintContainerManifest | Print Container Manifest / PRINTCONTAINERMANIFEST | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTCONTAINERMANIFEST |
| 51425 / ListPaneMenuActionViewContainers | View Containers / VIEWCONTAINERS | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEWCONTAINERS |
| 51423 / ListPaneMenuActionPrintUPSSummaryBarcodeLabel | Print UPS Summary Barcode Label / PRINTUPSSUMMARY | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTUPSSUMMARY |

### Part 4346: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17949 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17949; default=None |
| 17950 / SearchPaneBasicCriteria | 17949 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=17949; default=None |
| 17951 / SearchPaneAdvancedCriteria | 17949 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=17949; default=None |

#### Group 17950: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51426 / BasicCriteriaManifestId | Manifest Name / MANIFESTNAME | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51427 / BasicCriteriaRatingId | Rating ID / RATINGID | 280 / 2000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51428 / SearchPaneWhs | Warehouse / WAREHOUSE | 280 / 5000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51429 / BasicCriteriaIncludeOpenManifests | Include Open Manifests / INCLUDEOPENMANIFESTS | 130 / 6000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51430 / BasicCriteriaIncludeClosedManifests | Include Closed Manifests / INCLUDECLOSEDMANIFESTS | 130 / 7000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51431 / BasicCriteriaIncludeTransmittedManifests | Include Transmission Files / INCLUDETRANSFILES | 130 / 8000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17951: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51432 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4347: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17952 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=17952; default=None |
| 17953 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=17953; default=None |

#### Group 17952: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51433 / ListPaneSummaryManifests | Manifests / MANIFESTS | 50 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51434 / ListPaneSummaryOpenManifests | Open / OPEN | 50 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51435 / ListPaneSummaryClosedManifests | Closed / CLOSED | 50 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17953: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51436 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51436 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18347 / Not populated | ManifestName / Not populated / Not populated | Not populated / 30 / Not populated / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18345 / ICON | Not populated / Icon / ICON | 10 / 10 / 100 / 45 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18333 / ManifestName | Not populated / Manifest Name / MANIFESTNAME | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18335 / RatingId | Not populated / Rating ID / RATINGID | 10 / 10 / 2500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18336 / Shipper | Not populated / Shipper / SHIPPER | 10 / 10 / 3000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18337 / ManifestStatus | Not populated / Manifest Status / MANIFESTSTATUS | 10 / 10 / 6000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18338 / ShipDate | Not populated / Ship Date / SHIPDATE | 30 / 10 / 6500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18339 / TransmitStatus | Not populated / Transmit Status / TRANSMITSTATUS | 10 / 10 / 6750 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18340 / ShipperCode | Not populated / Shipper Code / SHIPPERCODE | 10 / 10 / 6850 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18341 / Warehouse | Not populated / Warehouse / WAREHOUSE | 10 / 10 / 7000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18342 / CarrierSymbol | Not populated / Carrier Symbol / CARRIERSYMBOL | 10 / 10 / 7100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18343 / IneligibleContainers | Not populated / Ineligible Containers / INELIGIBLECONTAINERS | 10 / 10 / 7200 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18344 / ManifestError | Not populated / Manifest Error / MANIFESTERROR | 40 / 10 / 7300 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18346 / COLOR | Not populated / Color / COLOR | 10 / 10 / 9000 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18334 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 9010 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4348: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17954 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=17954; default=None |

#### Group 17954: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51437 / DetailPaneHeaderManifestName | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=589; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51438 / DetailPaneHeaderRatingId | Not populated / Not populated | 30 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=589; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 22 control attributes, 21 events, and 43 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40550 | 51407 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40551 | 51407 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40552 | 51416 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40553 | 51417 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40556 | 51424 / ListPaneMenuActionClose | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40554 | 51422 / ListPaneMenuActionPrintContainerManifest | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40555 | 51423 / ListPaneMenuActionPrintUPSSummaryBarcodeLabel | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40557 | 51426 / BasicCriteriaManifestId | data-dbcolumn | Y / Y / N | 24 / 0 |
| 40558 | 51427 / BasicCriteriaRatingId | data-dbcolumn | Y / Y / N | 16 / 0 |
| 40559 | 51428 / SearchPaneWhs | defaultValue | Y / Y / Y | 32 / 0 |
| 40560 | 51428 / SearchPaneWhs | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40561 | 51429 / BasicCriteriaIncludeOpenManifests | data-dbcolumn | Y / Y / N | 28 / 0 |
| 40562 | 51429 / BasicCriteriaIncludeOpenManifests | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40563 | 51429 / BasicCriteriaIncludeOpenManifests | data-negativeCondition | Y / Y / N | 18 / 0 |
| 40564 | 51430 / BasicCriteriaIncludeClosedManifests | data-dbcolumn | Y / Y / N | 28 / 0 |
| 40565 | 51430 / BasicCriteriaIncludeClosedManifests | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40566 | 51430 / BasicCriteriaIncludeClosedManifests | data-negativeCondition | Y / Y / N | 22 / 0 |
| 40567 | 51431 / BasicCriteriaIncludeTransmittedManifests | data-dbcolumn | Y / Y / N | 28 / 0 |
| 40568 | 51431 / BasicCriteriaIncludeTransmittedManifests | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40569 | 51431 / BasicCriteriaIncludeTransmittedManifests | data-negativeCondition | Y / Y / N | 14 / 0 |
| 40570 | 51436 / ListPaneDataGrid | data-dbtable | Y / Y / N | 60 / 0 |
| 40571 | 51436 / ListPaneDataGrid | data-queryEngineId | Y / Y / N | 50 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17912 / click | 51408 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 17913 / click | 51409 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17914 / click | 51411 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 17915 / click | 51412 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 17916 / click | 51413 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 17917 / click | 51414 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 17918 / click | 51415 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 17919 / click | 51416 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17920 / click | 51417 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 17921 / click | 51418 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 17922 / click | 51419 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 17923 / click | 51420 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 17924 / click | 51421 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 17927 / click | 51424 / ListPaneMenuActionClose | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 17925 / click | 51422 / ListPaneMenuActionPrintContainerManifest | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 17928 / click | 51425 / ListPaneMenuActionViewContainers | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 17926 / click | 51423 / ListPaneMenuActionPrintUPSSummaryBarcodeLabel | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 17929 / iggridrequesterror | 51436 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 17930 / iggriddatabound | 51436 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 17931 / iggridselectionrowselectionchanged | 51436 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 17932 / iggridselectionactiverowchanged | 51436 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 26271 / 17912 | GETServiceURL | Y / Y | 76 |
| 26272 / 17912 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 26273 / 17912 | queryParameter_Function_UserName | Y / Y | 44 |
| 26274 / 17912 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26275 / 17912 | POSTServiceURL | Y / Y | 74 |
| 26276 / 17912 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 26277 / 17912 | PostData_Function_UserName | Y / Y | 44 |
| 26278 / 17912 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26279 / 17912 | PostData_Function_SearchValue | Y / Y | 98 |
| 26280 / 17912 | Post_SuccessCallback | Y / Y | 114 |
| 26281 / 17912 | ModalDialogName | Y / Y | 42 |
| 26282 / 17913 | ModalDialogName | Y / Y | 42 |
| 26283 / 17914 | POSTServiceURL | Y / Y | 144 |
| 26284 / 17914 | Form_Id | Y / Y | 8 |
| 26285 / 17914 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26286 / 17914 | PostData_Function_SearchValue | Y / Y | 98 |
| 26287 / 17914 | Post_SuccessCallback | Y / Y | 114 |
| 26288 / 17914 | ModalDialogName | Y / Y | 56 |
| 26289 / 17915 | ModalDialogName | Y / Y | 56 |
| 26290 / 17919 | ModalDialogName | Y / Y | 42 |
| 26291 / 17920 | ModalDialogName | Y / Y | 56 |
| 26307 / 17927 | URL | Y / Y | 80 |
| 26292 / 17925 | POSTServiceURL | Y / Y | 86 |
| 26293 / 17925 | PostData_Grid_ListPaneDataGrid_ManifestName | Y / Y | 24 |
| 26294 / 17925 | PostData_Grid_ListPaneDataGrid_RatingId | Y / Y | 16 |
| 26295 / 17925 | PostData_Grid_ListPaneDataGrid_ShipperCode | Y / Y | 22 |
| 26296 / 17925 | PostData_Grid_ListPaneDataGrid_Warehouse | Y / Y | 18 |
| 26297 / 17925 | PostData_ContainerManifest | Y / Y | 8 |
| 26298 / 17925 | PostData_DocumentType | Y / Y | 4 |
| 26299 / 17925 | Post_SuccessCallback | Y / Y | 140 |
| 26308 / 17928 | URL | Y / Y | 586 |
| 26300 / 17926 | POSTServiceURL | Y / Y | 86 |
| 26301 / 17926 | PostData_Grid_ListPaneDataGrid_ManifestName | Y / Y | 24 |
| 26302 / 17926 | PostData_Grid_ListPaneDataGrid_RatingId | Y / Y | 16 |
| 26303 / 17926 | PostData_Grid_ListPaneDataGrid_ShipperCode | Y / Y | 22 |
| 26304 / 17926 | PostData_Grid_ListPaneDataGrid_Warehouse | Y / Y | 18 |
| 26305 / 17926 | PostData_DocumentType | Y / Y | 6 |
| 26306 / 17926 | Post_SuccessCallback | Y / Y | 140 |
| 26309 / 17932 | BindDetailPaneWithGridData | Y / Y | 8 |
| 26310 / 17932 | EnableAction_ListPaneMenuActionViewContainers | Y / Y | 46 |
| 26311 / 17932 | EnableAction_ListPaneMenuActionPrintContainerManifest | Y / Y | 50 |
| 26312 / 17932 | EnableAction_ListPaneMenuActionPrintUPSSummaryBarcodeLabel | Y / Y | 164 |
| 26313 / 17932 | EnableAction_ListPaneMenuActionClose | Y / Y | 46 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 29 selected candidate rows for this Screen: **29 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40552 | 51416 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40553 | 51417 / Not applicable | data-securityCheckpoint | checkpoint | 28 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40554 | 51422 / Not applicable | data-securityCheckpoint | checkpoint | 26 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40555 | 51423 / Not applicable | data-securityCheckpoint | checkpoint | 27 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40556 | 51424 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40557 | 51426 / Not applicable | data-dbcolumn | database_identifier | MANIFESTNAME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40558 | 51427 / Not applicable | data-dbcolumn | database_identifier | RATINGID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40560 | 51428 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40561 | 51429 / Not applicable | data-dbcolumn | database_identifier | MANIFESTSTATUS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40564 | 51430 / Not applicable | data-dbcolumn | database_identifier | MANIFESTSTATUS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40567 | 51431 / Not applicable | data-dbcolumn | database_identifier | TRANSMITSTATUS | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40570 | 51436 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_MANIFEST_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26271 | 51408 / 17912 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26275 | 51408 / 17912 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26280 | 51408 / 17912 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26283 | 51411 / 17914 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26287 | 51411 / 17914 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26292 | 51422 / 17925 | POSTServiceURL | relative_api_path | /general/scaleapi/PrintApi/PrintedManifests | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26293 | 51422 / 17925 | PostData_Grid_ListPaneDataGrid_ManifestName | grid_field_identifier | ManifestName | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26294 | 51422 / 17925 | PostData_Grid_ListPaneDataGrid_RatingId | grid_field_identifier | RatingId | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26295 | 51422 / 17925 | PostData_Grid_ListPaneDataGrid_ShipperCode | grid_field_identifier | ShipperCode | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26296 | 51422 / 17925 | PostData_Grid_ListPaneDataGrid_Warehouse | grid_field_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26299 | 51422 / 17925 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26300 | 51423 / 17926 | POSTServiceURL | relative_api_path | /general/scaleapi/PrintApi/PrintedManifests | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26301 | 51423 / 17926 | PostData_Grid_ListPaneDataGrid_ManifestName | grid_field_identifier | ManifestName | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26302 | 51423 / 17926 | PostData_Grid_ListPaneDataGrid_RatingId | grid_field_identifier | RatingId | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26303 | 51423 / 17926 | PostData_Grid_ListPaneDataGrid_ShipperCode | grid_field_identifier | ShipperCode | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26304 | 51423 / 17926 | PostData_Grid_ListPaneDataGrid_Warehouse | grid_field_identifier | Warehouse | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26306 | 51423 / 17926 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
