# Purchase Order — Form 4049, Screen 1423

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4049 |
| MAIN_UI_SCREEN Object ID | 1423 |
| Label / Form resource key | Purchase Order / MNU_PURCHASEORDERDETAILS |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | record_detail_template / 6 |
| Configured path | /scale/details/purchaseorder |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/purchaseorder |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4049 |
| Inspection requirement | record_context_required |
| Form configuration table/view | PurchaseOrderHeaderView |
| Help page reference | procPO.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4049 |
| Inspection time (UTC) | 2026-10-02T15:28:12.863Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_PURCHASEORDERDETAILS |
| Observed configured table/view | PurchaseOrderHeaderView |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1423 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Purchase Order is recorded as `record_detail_template`. Its saved configuration contains 1 parts, 10 groups, 57 controls, and 9 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3183 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | Not populated |

### Part 3183: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 13347 / InventoryAttributesMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13347; default=None |
| 13348 / InventoryAttributesMenuPanel | 13347 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13347; default=None |
| 13350 / PurchaseOrderReferenceInfoSubAccordion | 13349 | Reference Info / REFERENCEINFO | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=13349; default=None |
| 13349 / PurchaseOrderMainAccordion | Not populated | Not populated / Not populated | 140 / 500 | Y / Y | Fixed to top=N; loading=2; nested unit=13349; default=None |
| 13351 / PurchaseOrderSourceSubAccordion | 13349 | Source / SOURCE | 50 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=13349; default=None |
| 13352 / PurchaseOrderShipFromSubAccordion | 13349 | Ship From / SHIPFROM | 50 / 750 | Y / Y | Fixed to top=N; loading=1; nested unit=13349; default=None |
| 13353 / PurchaseOrderLinesSubAccordion | 13349 | Lines / LINES | 50 / 1000 | Y / Y | Fixed to top=N; loading=1; nested unit=13349; default=None |
| 13354 / PurchaseOrderDatesSubAccordion | 13349 | Dates / DATES | 50 / 1250 | Y / Y | Fixed to top=N; loading=1; nested unit=13349; default=None |
| 13355 / PurchaseOrderTotalsSubAccordion | 13349 | Totals / TOTALS | 50 / 1500 | Y / Y | Fixed to top=N; loading=1; nested unit=13349; default=None |
| 13356 / PurchaseOrderUserDefinedSubAccordion | 13349 | User Defined / USERDEFINED | 50 / 1750 | Y / Y | Fixed to top=N; loading=1; nested unit=13349; default=None |

#### Group 13348: InventoryAttributesMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38701 / PurchaseOrderHeaderSectionPurchaseOrderId | Not populated / Not populated | 260 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 38703 / PurchaseOrderActionSave | Save / BTN_SAVE | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 38702 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 13350: PurchaseOrderReferenceInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38704 / ReferenceinfoPurchaseOrderIdValue | Purchase Order / PURHCASEORDER | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38705 / ReferenceinfoWarehouseValue | Warehouse / WAREHOUSE | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38706 / ReferenceinfoReceiptTypeValue | Receipt Type / RECEIPTTYPE | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38707 / ReferenceinfoStatusValue | Status / STATUS | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38708 / ReferenceinfoObjectIdValue | Object ID / OBJECTID | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13351: PurchaseOrderSourceSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38709 / SourceSourceIdValue | Source ID / SOURCEID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 38710 / SourceCompanyValue | Company / COMPANY | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38711 / SourceNameValue | Name / NAME | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38712 / SourceAttentionToValue | Attention To / ATTENTIONTO | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38713 / SourceAddressValue | Address / ADDRESS | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38714 / SourcePhoneNumValue | Phone Number / PHONENUM | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38715 / SourceAddress2Value | Address 2 (Optional) / ADDRESS2 | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38716 / SourceFaxNumValue | Fax Number / FAXNUM | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38717 / SourceAddress3Value | Address 3 (Optional) / ADDRESS3 | 10 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38718 / SourceEmailAddressValue | Email Address / EMAILADDRESS | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38719 / SourceCityValue | City / CITY | 10 / 2750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38720 / SourceStateValue | State / STATE | 80 / 3000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38721 / SourcePostalCodeValue | Postal Code / POSTALCODE | 10 / 3250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38722 / SourceCountryValue | Country / COUNTRY | 80 / 3500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13352: PurchaseOrderShipFromSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38723 / ShipFromSourceIdValue | Ship From / SHIPFROMID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 38724 / ShipFromUseSourceAddressValue | Use Source Address / USESOURCEADDRESS | 130 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38725 / ShipFromNameValue | Name / NAME | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38726 / ShipFromAttentionToValue | Attention To / ATTENTIONTO | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38727 / ShipFromAddressValue | Address / ADDRESS | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38728 / ShipFromPhoneNumValue | Phone Number / PHONENUM | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38729 / ShipFromAddress2Value | Address 2 (Optional) / ADDRESS2 | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38730 / ShipFromFaxNumValue | Fax Number / FAXNUM | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38731 / ShipFromAddress3Value | Address 3 (Optional) / ADDRESS3 | 10 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38732 / ShipFromEmailAddressValue | Email Address / EMAILADDRESS | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38733 / ShipFromCityValue | City / CITY | 10 / 2750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38734 / ShipFromStateValue | State / STATE | 80 / 3000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38735 / ShipFromPostalCodeValue | Postal Code / POSTALCODE | 10 / 3250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38736 / ShipFromCountryValue | Country / COUNTRY | 80 / 3500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13353: PurchaseOrderLinesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38737 / PurchaseOrderLinesGrid | Requested Delivery Date / REQUESTEDDELIVERYDATE | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 38737 `PurchaseOrderLinesGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 13085 / Item | ITEM / Item / ITEM | 10 / 10 / 250 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13086 / Company | COMPANY / Company / COMPANY | 10 / 10 / 500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13087 / Description | ITEM_DESC / Description / DESCRIPTION | 10 / 10 / 750 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13088 / OpenQuantity | OPEN_QUANTITY / Open Quantity / OPENQUANTITY | 20 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 13089 / TotalQuantity | TOTAL_QUANTITY / Total Quantity / TOTALQUANTITY | 20 / 10 / 1250 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 13090 / QuantityUm | QUANTITY_UM / UM / UM | 10 / 10 / 1500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13091 / ObjectId | OBJECT_ID / Object ID / OBJECTID | 20 / 10 / 2000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13092 / COLOR | Not populated / Color / COLOR | 10 / 10 / 2500 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13093 / ICON | Not populated / Icon / ICON | 10 / 10 / 3000 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 13354: PurchaseOrderDatesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38738 / DatesCreatedOnValue | Created Date Time / CREATEDDATETIME | 110 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38739 / DatesClosedValue | Closed Date Time / CLOSEDDATETIME | 110 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38740 / DatesDatetimestampValue | Date Time Stamp / DATETIMESTAMP | 110 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38741 / DatesUserstampdValue | User Stamp / USERSTAMP | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38742 / DatesProcessstampdValue | Process Stamp / PROCESSSTAMP | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13355: PurchaseOrderTotalsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38743 / TotalsTotalLinesValue | Total Lines / TOTALLINES | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38744 / TotalsTotalQuantityValue | Total Quantity / TOTALQUANTITY | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38745 / TotalsOpenQuantityValue | Open Quantity / OPENQUANTITY | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38746 / TotalsTotalValueValue | Total Value / TOTALVALUE | 90 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38747 / TotalsTotalWeightValue | Total Weight / TOTALWEIGHT | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38748 / TotalsWeightUmValue | UM / UM | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38749 / TotalsTotalVolumeValue | Total Volume / TOTALVOLUME | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13356: PurchaseOrderUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38750 / UserDefinedUserDefinedField1Value | User Defined 1 / UDPOHEADER1 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38751 / UserDefinedUserDefinedField2Value | User Defined 2 / UDPOHEADER2 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38752 / UserDefinedUserDefinedField3Value | User Defined 3 / UDPOHEADER3 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38753 / UserDefinedUserDefinedField4Value | User Defined 4 / UDPOHEADER4 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38754 / UserDefinedUserDefinedField5Value | User Defined 5 / UDPOHEADER5 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38755 / UserDefinedUserDefinedField6Value | User Defined 6 / UDPOHEADER6 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38756 / UserDefinedUserDefinedField7Value | User Defined 7 / UDPOHEADER7 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |
| 38757 / UserDefinedUserDefinedField8Value | User Defined 8 / UDPOHEADER8 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 12 control attributes, 5 events, and 4 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 29667 | 38703 / PurchaseOrderActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 29668 | 38703 / PurchaseOrderActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 29669 | 38704 / ReferenceinfoPurchaseOrderIdValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 29670 | 38704 / ReferenceinfoPurchaseOrderIdValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 29671 | 38709 / SourceSourceIdValue | Lookup | Y / Y / N | 66 / 0 |
| 29672 | 38723 / ShipFromSourceIdValue | Lookup | Y / Y / N | 74 / 0 |
| 29673 | 38724 / ShipFromUseSourceAddressValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 29674 | 38724 / ShipFromUseSourceAddressValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 29675 | 38737 / PurchaseOrderLinesGrid | data-modelClass | Y / Y / N | 116 / 0 |
| 29676 | 38737 / PurchaseOrderLinesGrid | data-dbtable | Y / Y / N | 42 / 0 |
| 29677 | 38737 / PurchaseOrderLinesGrid | data-headerkey | Y / Y / N | 48 / 0 |
| 29678 | 38737 / PurchaseOrderLinesGrid | pageSize | Y / Y / Y | 4 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 12791 / click | 38703 / PurchaseOrderActionSave | _webUi.purchaseOrderDetails.save | Not populated | Y / Y |
| 12790 / click | 38702 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 12792 / igtexteditorvaluechanged | 38709 / SourceSourceIdValue | _webUi.purchaseOrderDetails.sourceIdChanged | Not populated | Y / Y |
| 12793 / igtexteditorvaluechanged | 38723 / ShipFromSourceIdValue | _webUi.purchaseOrderDetails.shipFromIdChanged | Not populated | Y / Y |
| 12794 / change | 38724 / ShipFromUseSourceAddressValue | _webUi.purchaseOrderDetails.useSourceAddressToggled | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 17411 / 12791 | POSTServiceURL | Y / Y | 78 |
| 17412 / 12791 | PUTServiceURL | Y / Y | 80 |
| 17413 / 12791 | PUTServiceErrorCallbackUpdate | Y / Y | 94 |
| 17414 / 12791 | queryParameter_IdField | Y / Y | 16 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 6 selected candidate rows for this Screen: **6 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 29667 | 38703 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 29668 | 38703 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 29676 | 38737 / Not applicable | data-dbtable | database_identifier | PURCHASE_ORDER_DETAIL | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 17411 | 38703 / 12791 | POSTServiceURL | relative_api_path | /inbound/scaleapi/PurchaseOrderApi/save | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 17412 | 38703 / 12791 | PUTServiceURL | relative_api_path | /inbound/scaleapi/PurchaseOrderApi/save? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 17413 | 38703 / 12791 | PUTServiceErrorCallbackUpdate | callback_identifier | _webUi.purchaseOrderDetails.errorCallbackUpdate | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
