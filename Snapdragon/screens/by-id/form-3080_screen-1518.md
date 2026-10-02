# Cycle Count Quick Plan — Form 3080, Screen 1518

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3080 |
| MAIN_UI_SCREEN Object ID | 1518 |
| Label / Form resource key | Cycle Count Quick Plan / MNU_CCQUICKPLANTRANSACTION |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/ccquickplan |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/ccquickplan |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3080 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | MetaTrans_CycleCountQuickPlan |
| Help page reference | cycleCountQuickPlan.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3080 |
| Inspection time (UTC) | 2026-10-02T15:26:36.252Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_CCQUICKPLANTRANSACTION |
| Observed configured table/view | MetaTrans_CycleCountQuickPlan |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1518 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Cycle Count Quick Plan is recorded as `transaction_context`. Its saved configuration contains 1 parts, 10 groups, 48 controls, and 11 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3480 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | InventoryMenuActionSave |

### Part 3480: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14535 / QuickPlanMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14535; default=None |
| 14536 / QuickPlanMenuPanel | 14535 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14535; default=None |
| 14538 / PlanPreferencesInfoSubAccordion | 14537 | Plan Preferences / VIEW_PLANPREFERENCES | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=14537; default=None |
| 14537 / QuickPlanMainAccordion | Not populated | Not populated / Not populated | 140 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=14537; default=None |
| 14539 / LocationInventorySubAccordion | 14537 | Location Inventory / VIEW_LOCATIONINVENTORY | 50 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=14537; default=None |
| 14540 / ItemCharacteristicsSubAccordion | 14537 | Item Characteristics / VIEW_ITEMCHARACTERISTICS | 50 / 750 | Y / Y | Fixed to top=N; loading=1; nested unit=14537; default=None |
| 14541 / ItemCategoriesSubAccordion | 14537 | Item Categories / VIEW_ITEMCATEGORIES | 50 / 1000 | Y / Y | Fixed to top=N; loading=1; nested unit=14537; default=None |
| 14542 / LocatingZonesSubAccordion | 14537 | Locating Zones / VIEW_LOCATINGZONES | 50 / 1250 | Y / Y | Fixed to top=N; loading=1; nested unit=14537; default=None |
| 14543 / LocationTypesSubAccordion | 14537 | Location Types / VIEW_LOCATIONTYPES | 50 / 1500 | Y / Y | Fixed to top=N; loading=1; nested unit=14537; default=None |
| 14544 / QuickPlanUserDefSubAccordion | 14537 | Item User Defined / VIEW_ITEMUSERDEFINED | 50 / 1750 | Y / Y | Fixed to top=N; loading=1; nested unit=14537; default=None |

#### Group 14536: QuickPlanMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42206 / CCQuickPlanActionCreatePlan | Create / CREATE | 150 / 600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CREATE |
| 42207 / QuickPlanHeaderDescriptionValue | Not populated / Not populated | 260 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 42205 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 14538: PlanPreferencesInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42208 / PlanPreferencesDescriptionValue | Description / DESCRIPTION | 10 / 100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 42209 / PlanPreferencesMaxCountsValue | Maximum Number of Counts / MAXIMUMNUMCOUNTS | 90 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42210 / PlanPreferencesCountsPerGroupValue | Counts Per Group / COUNTSPERGROUP | 90 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42211 / PlanPreferencesPositiveAdjTypeValue | Positive Adjustment Type / POSITIVEADJTYPE | 80 / 400 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42212 / PlanPreferencesNegetiveAdjTypeValue | Negative Adjustment Type / NEGATIVEADJTYPE | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42213 / PlanPreferencesCreateWorkValue | Create Work / CREATEWORK | 130 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42214 / PlanPreferencesUpdateCyleCountsValue | Update Cycle Counts / UPDATECYCLECOUNTS | 130 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14539: LocationInventorySubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42215 / LocationInventoryLocationValue | Location / LOCATION | 10 / 100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 42216 / LocationInventoryWarehouseValue | Warehouse / WAREHOUSE | 80 / 200 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42217 / LocationInventoryItemValue | Item / ITEM | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 42218 / LocationInventoryCompanyValue | Company / COMPANY | 80 / 400 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42219 / LocationInventoryLotValue | Lot / LOT | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 42220 / LocationInventoryInventoryStsValue | Inventory Status / INVENTORYSTATUS | 80 / 600 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42221 / LocationInventoryExpiresByValue | Expires By (in Days) / EXPIRESBYINDAYS | 90 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42222 / LocationInventoryItemClassValue | Item Class / ITEMCLASS | 80 / 800 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14540: ItemCharacteristicsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42223 / ItemCharacteristicsDepartmentValue | Department / DEPARTMENT | 10 / 100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42224 / ItemCharacteristicsDivisionValue | Division / DIVISION | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42225 / PlanPreferencesListPriceValue | List Price / LISTPRICE | 90 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42226 / ItemCharacteristicsSizeValue | Item Size / ITEMSIZE | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42227 / ItemCharacteristicsColorValue | Item Color / ITEMCOLOR | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42228 / ItemCharacteristicsStyleValue | Item Style / ITEMSTYLE | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42229 / ItemCharInculdeMultiItemLocValue | Include Multi-Item Locations / INCLUDEMULTIITEMLOC | 130 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42230 / ItemCharInculdePermanentLocValue | Include Permanent Locations / INCLUDEPERMANENTLOC | 130 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42231 / ItemCharInculdeLPTrackedLocValue | Include License Plate Tracked Locations / LISTCENSEPLATETRACKEDLOCATIONS | 130 / 900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42232 / ItemCharInculdeSerialNumTrackedLocValue | Include Serial Number Tracked Items / INCLUDESERIALNUMBERTRACKEDITEMS | 130 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14541: ItemCategoriesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42233 / ItemCategoriesCategory1Value | ISM EOL / ITEMCATEGORY1 | 80 / 100 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42234 / ItemCategoriesCategory2Value | ISM ACCOUNTABLE / ITEMCATEGORY2 | 80 / 200 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42235 / ItemCategoriesCategory3Value | ISM UI / ITEMCATEGORY3 | 80 / 300 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42236 / ItemCategoriesCategory4Value | Item Category 4 / ITEMCATEGORY4 | 80 / 400 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42237 / ItemCategoriesCategory5Value | Item Category 5 / ITEMCATEGORY5 | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42238 / ItemCategoriesCategory6Value | Item Category 6 / ITEMCATEGORY6 | 80 / 600 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42239 / ItemCategoriesCategory7Value | Item Category 7 / ITEMCATEGORY7 | 80 / 700 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42240 / ItemCategoriesCategory8Value | Item Category 8 / ITEMCATEGORY8 | 80 / 800 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42241 / ItemCategoriesCategory9Value | Item Category 9 / ITEMCATEGORY9 | 80 / 900 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42242 / ItemCategoriesCategory10Value | Item Category 10 / ITEMCATEGORY10 | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14542: LocatingZonesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42243 / LocatingZonesGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 42243 `LocatingZonesGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14430 / Zone | ZONE / Zone / ZONE | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14431 / Description | DESCRIPTION / Description / DESCRIPTION | 10 / 10 / 20 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14432 / COLOR | Not populated / Color / COLOR | 10 / 10 / 30 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14433 / ICON | Not populated / Icon / ICON | 10 / 10 / 40 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 14543: LocationTypesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42244 / LocationTypesGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 42244 `LocationTypesGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14434 / LocationType | LOCATIONTYPE / Location Type / LOCATIONTYPE | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14435 / Length | LENGTH / Length / LENGTH | 20 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=20; DATA_SOURCE_TYPE=None |
| 14436 / Width | WIDTH / Width / WIDTH | 20 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=20; DATA_SOURCE_TYPE=None |
| 14437 / Height | HEIGHT / Height / HEIGHT | 20 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=20; DATA_SOURCE_TYPE=None |
| 14438 / Um | UM / UM / UM | 10 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14439 / COLOR | Not populated / Color / COLOR | 10 / 10 / 60 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14440 / ICON | Not populated / Icon / ICON | 10 / 10 / 70 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 14544: QuickPlanUserDefSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42245 / UserDefinedField1Value | USER_DEF1 / UDITEM1 | 10 / 100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42246 / UserDefinedField2Value | USER_DEF2 / UDITEM2 | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42247 / UserDefinedField3Value | USER_DEF3 / UDITEM3 | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42248 / UserDefinedField4Value | USER_DEF4 / UDITEM4 | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42249 / UserDefinedField5Value | USER_DEF5 / UDITEM5 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42250 / UserDefinedField6Value | USER_DEF6 / UDITEM6 | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42251 / UserDefinedField7Value | User Defined Field 7 / UDITEM7 | 90 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42252 / UserDefinedField8Value | User Defined Field 8 / UDITEM8 | 90 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 41 control attributes, 4 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32540 | 42208 / PlanPreferencesDescriptionValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 32541 | 42208 / PlanPreferencesDescriptionValue | data-msg-required | Y / Y / Y | 18 / 0 |
| 32542 | 42208 / PlanPreferencesDescriptionValue | maxLength | Y / Y / Y | 4 / 0 |
| 32543 | 42209 / PlanPreferencesMaxCountsValue | nullable | Y / Y / Y | 8 / 0 |
| 32544 | 42213 / PlanPreferencesCreateWorkValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 32545 | 42213 / PlanPreferencesCreateWorkValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 32546 | 42214 / PlanPreferencesUpdateCyleCountsValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 32547 | 42214 / PlanPreferencesUpdateCyleCountsValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 32548 | 42215 / LocationInventoryLocationValue | toUpper | Y / Y / Y | 8 / 0 |
| 32549 | 42215 / LocationInventoryLocationValue | Lookup | Y / Y / N | 96 / 0 |
| 32550 | 42217 / LocationInventoryItemValue | toUpper | Y / Y / Y | 8 / 0 |
| 32551 | 42217 / LocationInventoryItemValue | Lookup | Y / Y / N | 72 / 0 |
| 32552 | 42219 / LocationInventoryLotValue | toUpper | Y / Y / Y | 8 / 0 |
| 32553 | 42219 / LocationInventoryLotValue | Lookup | Y / Y / N | 66 / 0 |
| 32554 | 42221 / LocationInventoryExpiresByValue | nullable | Y / Y / Y | 8 / 0 |
| 32555 | 42229 / ItemCharInculdeMultiItemLocValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 32556 | 42229 / ItemCharInculdeMultiItemLocValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 32557 | 42230 / ItemCharInculdePermanentLocValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 32558 | 42230 / ItemCharInculdePermanentLocValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 32559 | 42231 / ItemCharInculdeLPTrackedLocValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 32560 | 42231 / ItemCharInculdeLPTrackedLocValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 32561 | 42232 / ItemCharInculdeSerialNumTrackedLocValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 32562 | 42232 / ItemCharInculdeSerialNumTrackedLocValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 32563 | 42243 / LocatingZonesGrid | data-modelClass | Y / Y / N | 106 / 0 |
| 32564 | 42243 / LocatingZonesGrid | data-groupBy | Y / Y / Y | 10 / 0 |
| 32565 | 42243 / LocatingZonesGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 32566 | 42243 / LocatingZonesGrid | pageSize | Y / Y / Y | 4 / 0 |
| 32567 | 42243 / LocatingZonesGrid | data-dbtable | Y / Y / N | 52 / 0 |
| 32568 | 42243 / LocatingZonesGrid | data-dbObjectType | Y / Y / N | 4 / 0 |
| 32569 | 42243 / LocatingZonesGrid | data-local | Y / Y / Y | 8 / 0 |
| 32570 | 42243 / LocatingZonesGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 32571 | 42243 / LocatingZonesGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 32572 | 42244 / LocationTypesGrid | data-modelClass | Y / Y / N | 106 / 0 |
| 32573 | 42244 / LocationTypesGrid | data-groupBy | Y / Y / Y | 10 / 0 |
| 32574 | 42244 / LocationTypesGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 32575 | 42244 / LocationTypesGrid | pageSize | Y / Y / Y | 4 / 0 |
| 32576 | 42244 / LocationTypesGrid | data-dbtable | Y / Y / N | 52 / 0 |
| 32577 | 42244 / LocationTypesGrid | data-dbObjectType | Y / Y / N | 4 / 0 |
| 32578 | 42244 / LocationTypesGrid | data-local | Y / Y / Y | 8 / 0 |
| 32579 | 42244 / LocationTypesGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 32580 | 42244 / LocationTypesGrid | rowSelectors | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14020 / click | 42206 / CCQuickPlanActionCreatePlan | _webUi.ccQuickPlanTransaction.createQuickPlan | Not populated | Y / Y |
| 14019 / click | 42205 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 14021 / iggridselectionrowselectionchanged | 42243 / LocatingZonesGrid | _webUi.ccQuickPlanTransaction.locatingZonesChanged | Not populated | Y / Y |
| 14022 / iggridselectionrowselectionchanged | 42244 / LocationTypesGrid | _webUi.ccQuickPlanTransaction.locationTypesChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19303 / 14020 | POSTServiceURL | Y / Y | 112 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 3 selected candidate rows for this Screen: **3 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32567 | 42243 / Not applicable | data-dbtable | database_identifier | MetaTrans_GetLocatingZones | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32576 | 42244 / Not applicable | data-dbtable | database_identifier | MetaTrans_GetLocationTypes | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19303 | 42206 / 14020 | POSTServiceURL | relative_api_path | /inventory/scaleapi/cycleCountPlansApi/QuickPlan-Created | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
