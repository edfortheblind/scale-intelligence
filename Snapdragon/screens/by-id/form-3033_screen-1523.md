# Inventory — Form 3033, Screen 1523

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3033 |
| MAIN_UI_SCREEN Object ID | 1523 |
| Label / Form resource key | Inventory / MNU_INVENTORYTRANSACTION |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/inventory |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/inventory |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3033 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | MetaTrans_GetInventory |
| Help page reference | InventoryViewer.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3033 |
| Inspection time (UTC) | 2026-10-02T15:25:39.408Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_INVENTORYTRANSACTION |
| Observed configured table/view | MetaTrans_GetInventory |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1523 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Inventory is recorded as `transaction_context`. Its saved configuration contains 1 parts, 13 groups, 70 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3485 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | InventoryMenuActionSave |

### Part 3485: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14567 / InventoryMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14567; default=None |
| 14568 / InventoryMenuPanel | 14567 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14567; default=None |
| 14570 / InventoryLocationInfoSubAccordion | 14569 | Location Info / LOCATIONINFO | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=14569; default=None |
| 14569 / InventoryMainAccordion | Not populated | Not populated / Not populated | 140 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=14569; default=None |
| 14571 / InventoryItemInfoSubAccordion | 14569 | Item Info / ITEMINFO | 50 / 500 | Y / Y | Fixed to top=N; loading=2; nested unit=14569; default=None |
| 14572 / InventoryQuantitiesSubAccordion | 14569 | Quantities / QUANTITIES | 50 / 750 | Y / Y | Fixed to top=N; loading=2; nested unit=14569; default=None |
| 14573 / InventoryDatesSubAccordion | 14569 | Dates / DATES | 50 / 1000 | Y / Y | Fixed to top=N; loading=1; nested unit=14569; default=None |
| 14574 / LocationInventorySerialNumberSubAccordion | 14569 | Serial Number / SERIALNUMBER | 50 / 1150 | Y / Y | Fixed to top=N; loading=1; nested unit=14569; default=None |
| 14575 / InventoryTotalsSubAccordion | 14569 | Totals / TOTALS | 50 / 1250 | Y / Y | Fixed to top=N; loading=1; nested unit=14569; default=None |
| 14576 / AttributesSubAccordion | 14569 | Attributes / ATTRIBUTES | 50 / 1500 | Y / Y | Fixed to top=N; loading=1; nested unit=14569; default=None |
| 14577 / InventoryZonesSubAccordion | 14569 | Zones / ZONES | 50 / 1750 | Y / Y | Fixed to top=N; loading=1; nested unit=14569; default=None |
| 14578 / InventoryReferenceInfoSubAccordion | 14569 | Reference Info / REFERENCEINFO | 50 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=14569; default=None |
| 14579 / InventoryUserDefSubAccordion | 14569 | User Defined / USERDEFINED | 50 / 2250 | Y / Y | Fixed to top=N; loading=1; nested unit=14569; default=None |

#### Group 14568: InventoryMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42325 / InventoryMenuActionSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 42326 / ActionCancel | Cancel / BTN_CANCEL | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |
| 42327 / InventoryHeaderLocationValue | Not populated / Not populated | 260 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14570: InventoryLocationInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42328 / LocationInfoLocationValue | Location / LOCATION | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42329 / LocationInfoInventoryStsValue | Inventory Status / INVENTORYSTS | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42330 / LocationInfoLicensePlateValue | License Plate / LICENSEPLATE | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42331 / LocationInfoParentLicensePlateValue | Parent License Plate / PARENTLICENSEPLATE | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42332 / LocationInfoLocationTemplateValue | Location Template / LOCATIONTEMPLATE | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42333 / LocationInfoPermanentValue | Permanent / PERMANENT | 130 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14571: InventoryItemInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42334 / ItemInfoItemValue | Item / ITEM | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 42335 / ItemInfoCompanyValue | Company / COMPANY | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 42336 / ItemInfoWebImage | Not populated / Not populated | 170 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 42337 / ItemInfoDescriptionValue | Description / ITEMDESCRIPTION | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 42338 / ItemInfoLotValue | Lot / LOT | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14572: InventoryQuantitiesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42339 / QuantitiesAvailableValue | Available / AVAILABLE | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42340 / QuantitiesAvailableUMValue | UM / UM | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42341 / QuantitiesOnHandValue | On Hand / ONHAND | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42342 / QuantitiesOnHandUmValue | UM / UM | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42343 / QuantitiesInTransitValue | In Transit / INTRANSIT | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42344 / QuantitiesInTransitUmValue | UM / UM | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42345 / QuantitiesAllocatedValue | Allocated / ALLOCATED | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42346 / QuantitiesAllocatedUmValue | UM / UM | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42347 / QuantitiesSuspenseValue | Suspense / SUSPENSE | 90 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42348 / QuantitiesSuspenseUmValue | UM / UM | 80 / 2750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14573: InventoryDatesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42349 / DatesAgingDateValue | Aging Date Time / AGINGDATETIME | 110 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42350 / DatesExpirationDateValue | Expiration Date / EXPIRATIONDATE | 110 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42351 / DatesManufacturedDateValue | Manufactured Date / MANUFACTUREDDATE | 110 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42352 / DatesReceivedDatesValue | Received Date Time / RECEIVEDDATETIME | 110 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14574: LocationInventorySerialNumberSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42353 / LocationInventorySerialNumbers | Not populated / Not populated | 140 / 10850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14575: InventoryTotalsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42354 / TotalsValueValue | Value / VALUE | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42355 / TotalsCostValue | Cost / COST | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42356 / TotalsWeightValue | Weight / WEIGHT | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42357 / TotalsWeightUmValue | UM / UM | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42358 / TotalsVolumeValue | Volume / VOLUME | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42359 / TotalsVolumeUmValue | UM / UM | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14576: AttributesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42360 / AttributesAttribute1Value | Attribute 1 / LOCINVATTRIBUTE1 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42361 / AttributesAttribute2Value | Attribute 2 / LOCINVATTRIBUTE2 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42362 / AttributesAttribute3Value | Attribute 3 / LOCINVATTRIBUTE3 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42363 / AttributesAttribute4Value | Attribute 4 / LOCINVATTRIBUTE4 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42364 / AttributesAttribute5Value | Attribute 5 / LOCINVATTRIBUTE5 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42365 / AttributesAttribute6Value | Attribute 6 / LOCINVATTRIBUTE6 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42366 / AttributesAttribute7Value | Attribute 7 / LOCINVATTRIBUTE7 | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42367 / AttributesAttribute8Value | Attribute 8 / LOCINVATTRIBUTE8 | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42368 / AttributesAttribute9Value | Attribute 9 / LOCINVATTRIBUTE9 | 10 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42369 / AttributesAttribute10Value | Attribute 10 / LOCINVATTRIBUTE10 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42370 / AttributesAttribute11Value | Attribute 11 / LOCINVATTRIBUTE11 | 10 / 2750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42371 / AttributesAttribute12Value | Attribute 12 / LOCINVATTRIBUTE12 | 10 / 3000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42372 / AttributesAttribute13Value | Attribute 13 / LOCINVATTRIBUTE13 | 10 / 3250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42373 / AttributesAttribute14Value | Attribute 14 / LOCINVATTRIBUTE14 | 10 / 3500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42374 / AttributesAttribute15Value | Attribute 15 / LOCINVATTRIBUTE15 | 10 / 3750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42375 / AttributesAttribute16Value | Attribute 16 / LOCINVATTRIBUTE16 | 10 / 4000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42376 / AttributesAttribute17Value | Attribute 17 / LOCINVATTRIBUTE17 | 10 / 4250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42377 / AttributesAttribute18Value | Attribute 18 / LOCINVATTRIBUTE18 | 10 / 4500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42378 / AttributesAttribute19Value | Attribute 19 / LOCINVATTRIBUTE19 | 10 / 4750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42379 / AttributesAttribute20Value | Attribute 20 / LOCINVATTRIBUTE20 | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14577: InventoryZonesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42380 / ZonesAllocationValue | Allocation / ALLOCATION | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42381 / ZonesLocatingValue | Locating / LOCATING | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42382 / ZonesWorkValue | Work / WORK | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14578: InventoryReferenceInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42383 / ReferenceInfoUserStampValue | User Stamp / USERSTAMP | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42384 / ReferenceInfoProcessStampValue | Process Stamp / PROCESSSTAMP | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42385 / InventoryDateTimeStampValue | Date Time Stamp / DATETIMESTAMP | 110 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42386 / InventoryWarehouseValue | Warehouse / WAREHOUSE | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14579: InventoryUserDefSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42387 / UserDefinedField1Value | User Defined Field 1 / UDLOCATION_INVENTORY1 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42388 / UserDefinedField2Value | User Defined Field 2 / UDLOCATION_INVENTORY2 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42389 / UserDefinedField3Value | User Defined Field 3 / UDLOCATION_INVENTORY3 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42390 / UserDefinedField4Value | User Defined Field 4 / UDLOCATION_INVENTORY4 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42391 / UserDefinedField5Value | User Defined Field 5 / UDLOCATION_INVENTORY5 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42392 / UserDefinedField6Value | User Defined Field 6 / UDLOCATION_INVENTORY6 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42393 / UserDefinedField7Value | User Defined Field 7 / UDLOCATION_INVENTORY7 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42394 / UserDefinedField8Value | User Defined Field 8 / UDLOCATION_INVENTORY8 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 8 control attributes, 11 events, and 3 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32620 | 42328 / LocationInfoLocationValue | toUpper | Y / Y / Y | 8 / 0 |
| 32621 | 42330 / LocationInfoLicensePlateValue | toUpper | Y / Y / Y | 8 / 0 |
| 32622 | 42331 / LocationInfoParentLicensePlateValue | toUpper | Y / Y / Y | 8 / 0 |
| 32623 | 42333 / LocationInfoPermanentValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 32624 | 42333 / LocationInfoPermanentValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 32625 | 42338 / ItemInfoLotValue | toUpper | Y / Y / Y | 8 / 0 |
| 32626 | 42350 / DatesExpirationDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 32627 | 42351 / DatesManufacturedDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14034 / click | 42325 / InventoryMenuActionSave | _webUi.inventoryTransaction.OnSaveClick | Not populated | Y / Y |
| 14035 / click | 42326 / ActionCancel | _webUi.inventoryTransaction.OnCancelClick | Not populated | Y / Y |
| 14036 / DOMContentLoaded | 42353 / LocationInventorySerialNumbers | _webUi.detailsScreenBinding.onReadyEventHandler | Not populated | Y / Y |
| 14037 / igtexteditorkeydown | 42387 / UserDefinedField1Value | _webUi.inventoryTransaction.userDefValueKeydown | Not populated | Y / Y |
| 14038 / igtexteditorkeydown | 42388 / UserDefinedField2Value | _webUi.inventoryTransaction.userDefValueKeydown | Not populated | Y / Y |
| 14039 / igtexteditorkeydown | 42389 / UserDefinedField3Value | _webUi.inventoryTransaction.userDefValueKeydown | Not populated | Y / Y |
| 14040 / igtexteditorkeydown | 42390 / UserDefinedField4Value | _webUi.inventoryTransaction.userDefValueKeydown | Not populated | Y / Y |
| 14041 / igtexteditorkeydown | 42391 / UserDefinedField5Value | _webUi.inventoryTransaction.userDefValueKeydown | Not populated | Y / Y |
| 14042 / igtexteditorkeydown | 42392 / UserDefinedField6Value | _webUi.inventoryTransaction.userDefValueKeydown | Not populated | Y / Y |
| 14043 / ignumericeditorkeydown | 42393 / UserDefinedField7Value | _webUi.inventoryTransaction.userDefValueKeydown | Not populated | Y / Y |
| 14044 / ignumericeditorkeydown | 42394 / UserDefinedField8Value | _webUi.inventoryTransaction.userDefValueKeydown | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19307 / 14036 | GETServiceURL | Y / Y | 130 |
| 19308 / 14036 | queryParameter_internalLocationInv | Y / Y | 156 |
| 19309 / 14036 | Get_SuccessCallback | Y / Y | 92 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 2 selected candidate rows for this Screen: **2 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_EVENT_PARAMETERS / 19307 | 42353 / 14036 | GETServiceURL | relative_api_path | /Inventory/scaleapi/LocationInventoryApi/inventory-SerialNumbers? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19309 | 42353 / 14036 | Get_SuccessCallback | callback_identifier | _webUi.MiniGrid.bindDataForVariableColulmnGrid | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
