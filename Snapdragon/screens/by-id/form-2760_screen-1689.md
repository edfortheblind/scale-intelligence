# Shipment — Form 2760, Screen 1689

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2760 |
| MAIN_UI_SCREEN Object ID | 1689 |
| Label / Form resource key | Shipment / MNU_SHIPMENTDETAILS |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | record_detail_template / 6 |
| Configured path | /scale/details/shipment |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/shipment |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2760 |
| Inspection requirement | record_context_required |
| Form configuration table/view | ShipmentHeaderView |
| Help page reference | createShipment.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2760 |
| Inspection time (UTC) | 2026-10-02T15:23:44.780Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_SHIPMENTDETAILS |
| Observed configured table/view | ShipmentHeaderView |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1689 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Shipment is recorded as `record_detail_template`. Its saved configuration contains 1 parts, 19 groups, 164 controls, and 44 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3913 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | ShipmentHeaderMenuActionSave |

### Part 3913: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16457 / ShipmentMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16457; default=None |
| 16458 / ShipmentHeaderMenuPanel | 16457 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16457; default=None |
| 16459 / ShipmentHeaderMainAccordion | Not populated | Not populated / Not populated | 140 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=16459; default=None |
| 16460 / ShipmentHeaderReferenceInfoSubAccordion | 16459 | Reference Info / REFERENCEINFO | 50 / 2000 | Y / Y | Fixed to top=N; loading=2; nested unit=16459; default=None |
| 16461 / ShipmentHeaderCustomerSubAccordion | 16459 | Customer / CUSTOMER | 50 / 3000 | Y / Y | Fixed to top=N; loading=2; nested unit=16459; default=None |
| 16474 / ShipmentHeaderShiptoSubAccordion | 16459 | Ship To / SHIPTO | 50 / 3500 | Y / Y | Fixed to top=N; loading=1; nested unit=16459; default=None |
| 16475 / ShipmentHeaderCarrierSubAccordion | 16459 | Carrier / CARRIER | 50 / 4000 | Y / Y | Fixed to top=N; loading=1; nested unit=16459; default=None |
| 16462 / ShipmentHeaderStatusSubAccordion | 16459 | Status / STATUS | 50 / 5000 | Y / Y | Fixed to top=N; loading=1; nested unit=16459; default=None |
| 16463 / ShipmentHeaderDatesSubAccordion | 16459 | Dates / DATES | 50 / 7000 | Y / Y | Fixed to top=N; loading=1; nested unit=16459; default=None |
| 16464 / ShipmentHeaderLinesSubAccordion | 16459 | Lines / LINES | 50 / 8000 | Y / Y | Fixed to top=N; loading=1; nested unit=16459; default=None |
| 16465 / ShipmentHeaderTotalsSubAccordion | 16459 | Totals / TOTALS | 50 / 9000 | Y / Y | Fixed to top=N; loading=1; nested unit=16459; default=None |
| 16466 / ShipmentHeaderCommentsSubAccordion | 16459 | Comments / TEXT | 50 / 10000 | Y / Y | Fixed to top=N; loading=1; nested unit=16459; default=None |
| 16467 / ShipmentHeaderVASActivitiesSubAccordion | 16459 | VAS Activities / VASACTIVITIES | 50 / 12000 | Y / Y | Fixed to top=N; loading=1; nested unit=16459; default=None |
| 16468 / ShipmentHeaderInternationalSubAccordion | 16459 | International / INTERNATIONAL | 50 / 13000 | Y / Y | Fixed to top=N; loading=1; nested unit=16459; default=None |
| 16469 / ShipmentHeaderFreightBillToSubAccordion | 16459 | Freight Bill To / FREIGHTBILLTO | 50 / 14000 | Y / Y | Fixed to top=N; loading=1; nested unit=16459; default=None |
| 16470 / ShipmentHeaderIntermediateConsigneeSubAccordion | 16459 | Intermediate Consignee / INTERMEDIATECONSIGNEE | 50 / 15000 | Y / Y | Fixed to top=N; loading=1; nested unit=16459; default=None |
| 16471 / ShipmentHeaderCategoriesSubAccordion | 16459 | Categories / CATEGORIES | 50 / 16000 | Y / Y | Fixed to top=N; loading=1; nested unit=16459; default=None |
| 16472 / ShipmentHeaderUserDefonetoeightSubAccordion | 16459 | User Defined 1-8 / USERDEFINED1_8 | 50 / 17000 | Y / Y | Fixed to top=N; loading=1; nested unit=16459; default=None |
| 16473 / ShipmentHeaderUserDefninetotwentySubAccordion | 16459 | User Defined 9-20 / USERDEFINED9_20 | 50 / 18000 | Y / Y | Fixed to top=N; loading=1; nested unit=16459; default=None |

#### Group 16458: ShipmentHeaderMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48429 / ShipmentHeaderMenuActionSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 48431 / ShipmentHeaderSectionShipmentId | Not populated / Not populated | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 48430 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 16460: ShipmentHeaderReferenceInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48432 / ReferenceInfoShipmentIdValue | Shipment ID / SHIPMENTID | 10 / 7250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48433 / ReferenceInfoErpOrderValue | ERP Order / ERPORDER | 10 / 7350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48434 / ReferenceInfoInternalShipmentNumValue | Internal Shipment Number / INTERNALSHIPMENTNUM | 90 / 7450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48435 / ReferenceInfoInternalOrderNumValue | Internal Order Number / INTERNALORDERNUM | 90 / 7550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48436 / ReferenceInfoShippingLoadNumValue | Shipping Load Number / SHIPPINGLOADNUMBER | 90 / 7650 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48437 / ReferenceInfoWaveNumberValue | Wave Number / WAVENUMBER | 90 / 7750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48438 / ReferenceInfoStoreDistributionValue | Store Distribution / STOREDISTRIBUTION | 10 / 7850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48439 / ReferenceInfoOrderTypeValue | Order Type / ORDERTYPE | 10 / 7950 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48440 / ReferenceInfoProcessTypeValue | Process Type / PROCESSTYPE | 80 / 8050 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48441 / ReferenceInfoConsolidationLocationLabel | Consolidation Location / CONSOLIDATIONLOCATION | 10 / 8100 | N / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48442 / ReferenceInfoConsolidationLocationValue | Consolidation Location / CONSOLIDATIONLOCATION | 10 / 8150 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48443 / ReferenceInfoAlternateEmailAddrValue | Alternate Email Address / ALTERNATEEMAILADDRESS | 10 / 8250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48444 / ReferenceInfoWarehouseValue | Warehouse / WAREHOUSE | 80 / 8350 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48445 / ReferenceInfoAllocateCompleteValue | Allocate Complete / ALLOCATECOMPLETE | 130 / 8450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48446 / ReferenceInfoConsolidationAllowedValue | Consolidation Allowed / CONSOLIDATIONALLOWED | 130 / 8550 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48447 / ReferenceInfoConsolidatedValue | Consolidated / CONSOLIDATED | 130 / 8650 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48448 / ReferenceInfoManuallyEnteredValue | Manually Entered / MANUALLYENTERED | 130 / 8750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16461: ShipmentHeaderCustomerSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48450 / CustomerCustomerValue | Customer / CUSTOMER | 10 / 225 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 48449 / CustomerCompanyValue | Company / COMPANY | 80 / 325 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48453 / CustomerNameValue | Name / NAME | 10 / 425 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48452 / CustomerAttentionToValue | Attention To / ATTENTIONTO | 10 / 525 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48454 / CustomerAddressValue | Address / ADDRESS | 10 / 625 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48461 / CustomerPhoneNumberValue | Phone Number / PHONENUM | 10 / 725 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48455 / CustomerAddressTwoValue | Address 2 (Optional) / ADDRESS2 | 10 / 825 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48462 / CustomerFaxNumberValue | Fax Number / FAXNUM | 10 / 925 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48456 / CustomerAddressThreeValue | Address 3 (Optional) / ADDRESS3 | 10 / 1025 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48463 / CustomerEmailAddressValue | Email Address / EMAILADDRESS | 10 / 1125 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48457 / CustomerCityValue | City / CITY | 10 / 1225 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48451 / CustomerResidentialValue | Residential / RESIDENTIAL | 130 / 1325 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48458 / CustomerStateValue | State / STATE | 80 / 1425 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48459 / CustomerPostalCodeValue | Postal Code / POSTALCODE | 10 / 1425 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48460 / CustomerCountryValue | Country / COUNTRY | 80 / 1525 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16474: ShipmentHeaderShiptoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48564 / ShiptoShipToValue | Ship To / SHIPTO | 10 / 1650 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 48563 / ShipToShipToSameasCustomerValue | Use Customer Address / USECUSTOMERADDRESS | 130 / 1750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48567 / ShiptoNameValue | Name / NAME | 10 / 1850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48566 / ShiptoAttentionToValue | Attention To / ATTENTIONTO | 10 / 1950 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48568 / ShiptoAddressValue | Address / ADDRESS | 10 / 2050 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48575 / ShiptoPhoneNumberValue | Phone Number / PHONENUM | 10 / 2150 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48569 / ShiptoAddressTwoValue | Address 2 (Optional) / ADDRESS2 | 10 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48576 / ShiptoFaxNumberValue | Fax Number / FAXNUM | 10 / 2350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48570 / ShiptoAddressThreeValue | Address 3 (Optional) / ADDRESS3 | 10 / 2450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48577 / ShiptoEmailAddressValue | Email Address / EMAILADDRESS | 10 / 2550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48571 / ShiptoCityValue | City / CITY | 10 / 2650 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48565 / ShiptoResidentialValue | Residential / RESIDENTIAL | 130 / 2750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48572 / ShiptoStateValue | State / STATE | 80 / 2850 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48573 / ShiptoPostalCodeValue | Postal Code / POSTALCODE | 10 / 2950 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48574 / ShiptoCountryValue | Country / COUNTRY | 80 / 3050 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16475: ShipmentHeaderCarrierSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48578 / CarrierCarrierNameValue | Carrier / CARRIER | 80 / 4050 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48579 / CarrierCarrierServiceValue | Carrier Service / CARRIERSERVICE | 80 / 4150 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48580 / CarrierCarrierGroupValue | Carrier Group / CARRIERGROUP | 80 / 4250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48581 / CarrierCarrierTypeValue | Carrier Type / CARRIERTYPE | 80 / 4350 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48582 / CarrierShipperCodeValue | Shipper Code / SHIPPERCODE | 80 / 4450 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48583 / CarrierBaseFreightValue | Base Freight / BASEFREIGHT | 90 / 4550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48584 / CarrierTotalFreightValue | Total Freight / TOTALFREIGHT | 90 / 4650 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48585 / CarrierBOLNumberValue | BOL Number / BOLNUMBER | 10 / 4750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48586 / CarrierProNumberValue | BOL/PRO/Tracking Num / PRONUMBER | 10 / 4850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48587 / CarrierLiabilityTermsValue | Liability Terms / LIABILITYTERMS | 10 / 4950 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48588 / CarrierFreightTermsValue | Freight Terms / FREIGHTTERMS | 80 / 5050 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48589 / CarrierStopSequenceValue | Stop Sequence / STOPSEQUENCE | 90 / 5150 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48590 / CarrierStopValue | Stop / STOP | 10 / 5250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48591 / CarrierRoutingCodeValue | Routing Code / ROUTINGCODE | 10 / 5350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48592 / CarrierRouteValue | Route / ROUTE | 10 / 5450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16462: ShipmentHeaderStatusSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48464 / StatusLeadingStatusValue | Leading Status / LEADINGSTS | 80 / 3050 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48465 / StatusLeadingStatusDate | Date / DATE | 110 / 3100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48466 / StatusTrailingStatusValue | Trailing Status / TRAILINGSTS | 80 / 3200 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48467 / StatusTrailingStatusDate | Date / DATE | 110 / 3250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48468 / StatusPriorityValue | Priority / PRIORITY | 90 / 3350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48471 / StatusWaveStepValue | Wave Step / WAVESTEP | 10 / 3375 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48469 / StatusRejectionNoteValue | Rejection Note / REJECTIONNOTE | 10 / 3450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48470 / StatusImmediateNeedsNoteValue | Immediate Needs Note / IMMEDIATENEEDSNOTE | 10 / 3550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48472 / StatusCreatedByValue | Created By / CREATEDBY | 80 / 3750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48473 / StatusCreatedByDate | Date / DATE | 110 / 3800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48474 / StatusLastUpdatedByValue | Last Updated By / LASTUPDATEDBY | 80 / 3900 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48475 / StatusLastUpdatedByDate | Date / DATE | 110 / 3950 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16463: ShipmentHeaderDatesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48476 / DatesPlannedShipDateValue | Planned Ship Date / PLANNEDSHIPDATE | 110 / 5550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48477 / DatesScheduledShipDateValue | Scheduled Ship Date / SCHEDULEDSHIPDATE | 110 / 5650 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48478 / DatesActualShipDateValue | Actual Ship Date Time / ACTUALSHIPDATETIME | 110 / 5750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48479 / DatesRequestedDeliveryTypeValue | Requested Delivery Type / REQUESTEDDELIVERYTYPE | 80 / 5850 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48480 / DatesPlannedDeliveryDateValue | Planned Delivery Date / PLANNEDDELIVERYDATE | 110 / 5950 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48481 / DatesActualDeliveryDateValue | Actual Delivery Date / ACTUALDELIVERYDATETIME | 110 / 6050 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48482 / DatesRequestedDeliveryDateValue | Requested Delivery Date / REQUESTEDDELIVERYDATE | 110 / 6150 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16464: ShipmentHeaderLinesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48483 / ShipmentHeaderLinesGrid | Requested Delivery Date / REQUESTEDDELIVERYDATE | 20 / 6300 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 48483 `ShipmentHeaderLinesGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16862 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16863 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16864 / Item | ITEM / Item / ITEM | 10 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16865 / ItemDesc | ITEM_DESC / Description / DESCRIPTION | 10 / 10 / 30 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16866 / Company | COMPANY / Company / COMPANY | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16867 / TotalQty | TOTAL_QTY / Total Qty / TOTALQTY | 20 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 16868 / RemainingQty | Not populated / Remaining Qty / REMAININGQTY | 20 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 16869 / QuantityUm | QUANTITY_UM / UM / UM | 10 / 10 / 70 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16870 / InternalShipmentLineNum | INTERNAL_SHIPMENT_LINE_NUM / Internal Shipment Line Number / INTERNALSHIPMENTLINENUM | 20 / 10 / 90 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16871 / Not populated | INTERNAL_SHIPMENT_LINE_NUM / Not populated / Not populated | Not populated / 30 / 90 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 16465: ShipmentHeaderTotalsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48484 / TotalsTotalLinesValue | Total Lines / TOTALLINES | 90 / 6450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48485 / TotalsTotalContainersValue | Total Containers / TOTALCONTAINERS | 90 / 6550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48486 / TotalsTotalUnitsValue | Total Quantity / TOTALQUANTITY | 90 / 6650 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48491 / TotalsTotalValueValue | Total Value / TOTALVALUE | 90 / 6660 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48487 / TotalsTotalWeightValue | Total Weight / TOTALWEIGHT | 90 / 6750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48488 / TotalsTotalWeightUM | UM / UM | 80 / 6800 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48489 / TotalsTotalVolumeValue | Total Volume / TOTALVOLUME | 90 / 6900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48490 / TotalsTotalVolumeUM | UM / UM | 80 / 6950 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16466: ShipmentHeaderCommentsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48492 / ShipmentHeaderCommentsGrid | Not populated / Not populated | 20 / 7100 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 48492 `ShipmentHeaderCommentsGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16872 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16873 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16874 / CommentType | COMMENT_TYPE / Comment Type / COMMENTTYPE | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=60 |
| 16875 / Text | Text / Comments / TEXT | 10 / 10 / 20 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16876 / RecordType | Record_Type / Record Type / RECORDTYPE | 10 / 10 / 30 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16877 / InternalCommentId | Internal_Comment_Id / Internal Comment ID / INTERNALCOMMENTID | 20 / 10 / 40 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16878 / InternalNum | Internal_Num / Internal Number / INTERNALNUM | 20 / 10 / 50 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16879 / InternalLineNum | Internal_Line_Num / Internal Line Number / INTERNALLINENUM | 20 / 10 / 60 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16880 / UserDef1 | USER_DEF1 / User Defined Field 1 / UD_SHIPCOMMENT_01 | 10 / 10 / 70 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16881 / UserDef2 | USER_DEF2 / User Defined Field 2 / UD_SHIPCOMMENT_02 | 10 / 10 / 80 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16882 / UserDef3 | USER_DEF3 / User Defined Field 3 / UD_SHIPCOMMENT_03 | 10 / 10 / 90 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16883 / UserDef4 | USER_DEF4 / User Defined Field 4 / UD_SHIPCOMMENT_04 | 10 / 10 / 100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16884 / UserDef5 | USER_DEF5 / User Defined Field 5 / UD_SHIPCOMMENT_05 | 10 / 10 / 110 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16885 / UserDef6 | USER_DEF6 / User Defined Field 6 / UD_SHIPCOMMENT_06 | 10 / 10 / 120 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16886 / UserDef7 | USER_DEF7 / User Defined Field 7 / UD_SHIPCOMMENT_07 | 20 / 10 / 130 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16887 / UserDef8 | USER_DEF8 / User Defined Field 8 / UD_SHIPCOMMENT_08 | 20 / 10 / 140 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16888 / RecordType | Not populated / Not populated / RecordType | 20 / 40 / 150 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16889 / InternalLineNum | Not populated / Not populated / RecordType | 20 / 40 / 160 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 16467: ShipmentHeaderVASActivitiesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48493 / ShipmentHeaderVasActivitiesGrid | Not populated / Not populated | 20 / 9000 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 48493 `ShipmentHeaderVasActivitiesGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16890 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16891 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16892 / Confirmed | Confirmed / Confirmed / VASCONFIRMED | 40 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16893 / VasActivityId | VAS_ACTIVITY_ID / VAS Activity / VASACTIVITY | 10 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=60 |
| 16894 / Instructions | INSTRUCTIONS / Instructions / INSTRUCTIONS | 10 / 10 / 30 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16895 / ApplicationLevel | Not populated / Application Level / APPLICATIONLEVEL | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16896 / InternalShipmentNum | INTERNAL_SHIPMENT_NUM / Internal Shipment Number / INTERNALSHIPMENTNUM | 20 / 10 / 45 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16897 / ObjectId | OBJECT_ID / Object ID / OBJECTID | 20 / 10 / 50 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16898 / UserDef1 | USER_DEF1 / User Defined Field 1 / UD_VASACTIVITY1 | 10 / 10 / 70 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16899 / UserDef2 | USER_DEF2 / User Defined Field 2 / UD_VASACTIVITY2 | 10 / 10 / 80 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16900 / UserDef3 | USER_DEF3 / User Defined Field 3 / UD_VASACTIVITY3 | 10 / 10 / 90 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16901 / UserDef4 | USER_DEF4 / User Defined Field 4 / UD_VASACTIVITY4 | 10 / 10 / 100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16902 / UserDef5 | USER_DEF5 / User Defined Field 5 / UD_VASACTIVITY5 | 10 / 10 / 110 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16903 / UserDef6 | USER_DEF6 / User Defined Field 6 / UD_VASACTIVITY6 | 10 / 10 / 120 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16904 / UserDef7 | USER_DEF7 / User Defined Field 7 / UD_VASACTIVITY7 | 20 / 10 / 130 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16905 / UserDef8 | USER_DEF8 / User Defined Field 8 / UD_VASACTIVITY8 | 20 / 10 / 140 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 16468: ShipmentHeaderInternationalSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48494 / InternationalExportTaxIdValue | Export Tax ID / EXPORTTAXID | 10 / 550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48495 / InternationalPartiesValue | Parties / PARTIES | 10 / 650 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48496 / InternationalLoadingPierValue | Loading Pier / LOADINGPIER | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48497 / InternationalTransportationModeValue | Transportation Mode / TRANSPORTATIONMODE | 10 / 850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48498 / InternationalExportPortValue | Export Port / EXPORTPORT | 10 / 950 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48499 / InternationalUnloadingPortValue | Unloading Port / UNLOADINGPORT | 10 / 1050 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48500 / InternationalFTZValue | FTZ / FTZ | 10 / 1150 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48501 / InternationalContainerizedValue | Containerized / CONTAINERIZED | 130 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48502 / InternationalValidatedLicenseValue | Validated License / VALIDATEDLICENSE | 10 / 1350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48503 / InternationalECCNValue | ECCN / ECCN | 10 / 1450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48504 / InternationalLicenseExpirationDateValue | License Expiration Date / LICENSEEXPDATE | 110 / 1550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48505 / InternationalAuthorizedEmployeeNameValue | Authorized Employee Name / AUTHORIZEDEMPLNAME | 10 / 1650 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48506 / InternationalAuthorizedEmployeeTitleValue | Authorized Employee Title / AUTHORIZEDEMPLTITLE | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16469: ShipmentHeaderFreightBillToSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48507 / FreightBillBillToValue | Bill To / FREIGHTBILLTOID | 10 / 550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48508 / FreightBillAttentionToValue | Attention To / ATTENTIONTO | 10 / 650 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48509 / FreightBillNameValue | Name / NAME | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48517 / FreightBillPhoneNumberValue | Phone Number / PHONENUM | 10 / 850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48510 / FreightBillAddressValue | Address / ADDRESS | 10 / 950 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48518 / FreightBillFaxNumberValue | Fax Number / FAXNUM | 10 / 950 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48511 / FreightBillAddress2Value | Address 2 (Optional) / ADDRESS2 | 10 / 1050 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48519 / FreightBillEmailAddressValue | Email Address / EMAILADDRESS | 10 / 1050 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48512 / FreightBillAddress3Value | Address 3 (Optional) / ADDRESS3 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48513 / FreightBillCityValue | City / CITY | 10 / 1450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48514 / FreightBillStateValue | State / STATE | 80 / 1550 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48515 / FreightBillZipValue | Postal Code / POSTALCODE | 10 / 1650 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48516 / FreightBillCountryValue | Country / COUNTRY | 80 / 1750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16470: ShipmentHeaderIntermediateConsigneeSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48520 / IntermediateConsigneeAccountNumValue | Account Number / ACCOUNTNUMBER | 10 / 550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 48521 / IntermediateConsigneeAttentionToValue | Attention To / ATTENTIONTO | 10 / 650 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48522 / IntermediateConsigneeNameValue | Name / NAME | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48530 / IntermediateConsigneePhoneNumberValue | Phone Number / PHONENUM | 10 / 850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48523 / IntermediateConsigneeAddressValue | Address / ADDRESS | 10 / 950 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48531 / IntermediateConsigneeFaxNumbervalue | Fax Number / FAXNUM | 10 / 1050 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48524 / IntermediateConsigneeAddress2Value | Address 2 (Optional) / ADDRESS2 | 10 / 1150 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48532 / IntermediateConsigneeEmailAddressValue | Email Address / EMAILADDRESS | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48525 / IntermediateConsigneeAddress3Value | Address 3 (Optional) / ADDRESS3 | 10 / 1350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48526 / IntermediateConsigneeCityValue | City / CITY | 10 / 1550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48527 / IntermediateConsigneeSTateValue | State / STATE | 80 / 1650 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48528 / IntermediateConsigneePostalCodeValue | Postal Code / POSTALCODE | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48529 / IntermediateConsigneeCountryValue | Country / COUNTRY | 80 / 1850 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16471: ShipmentHeaderCategoriesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48533 / CategoriesCategory1Value | Customer Category 1 / CUSTOMERCATEGORY1 | 270 / 550 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48534 / CategoriesCategory2Value | Customer Category 2 / CUSTOMERCATEGORY2 | 270 / 650 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48535 / CategoriesCategory3Value | Customer Category 3 / CUSTOMERCATEGORY3 | 270 / 750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48536 / CategoriesCategory4Value | Customer Category 4 / CUSTOMERCATEGORY4 | 270 / 850 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48537 / CategoriesCategory5Value | Customer Category 5 / CUSTOMERCATEGORY5 | 270 / 950 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48538 / CategoriesCategory6Value | Customer Category 6 / CUSTOMERCATEGORY6 | 270 / 1050 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48539 / CategoriesCategory7Value | Customer Category 7 / CUSTOMERCATEGORY7 | 270 / 1150 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48540 / CategoriesCategory8Value | Customer Category 8 / CUSTOMERCATEGORY8 | 270 / 1250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48541 / CategoriesCategory9Value | Customer Category 9 / CUSTOMERCATEGORY9 | 270 / 1350 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48542 / CategoriesCategory10Value | Customer Category 10 / CUSTOMERCATEGORY10 | 270 / 1450 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16472: ShipmentHeaderUserDefonetoeightSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48543 / UserDefUserDefinedfield1Value | User Defined Field 1 / UDSHH1 | 10 / 550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48544 / UserDefUserDefinedfield2Value | User Defined Field 2 / UDSHH2 | 10 / 650 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48545 / UserDefUserDefinedfield3Value | User Defined Field 3 / UDSHH3 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48546 / UserDefUserDefinedfield4Value | User Defined Field 4 / UDSHH4 | 10 / 850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48547 / UserDefUserDefinedfield5Value | User Defined Field 5 / UDSHH5 | 10 / 950 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48548 / UserDefUserDefinedfield6Value | User Defined Field 6 / UDSHH6 | 10 / 1050 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48549 / UserDefUserDefinedfield7Value | User Defined Field 7 / UDSHH7 | 90 / 1150 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48550 / UserDefUserDefinedfield8Value | User Defined Field 8 / UDSHH8 | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16473: ShipmentHeaderUserDefninetotwentySubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48551 / UserDefUserDefinedfield9Value | User Defined Field 9 / UDSHH9 | 90 / 550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48552 / UserDefUserDefinedfield10Value | User Defined Field 10 / UDSHH10 | 90 / 650 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48553 / UserDefUserDefinedfield11Value | User Defined Field 11 / UDSHH11 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48554 / UserDefUserDefinedfield12Value | User Defined Field 12 / UDSHH12 | 10 / 850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48555 / UserDefUserDefinedfield13Value | User Defined Field 13 / UDSHH13 | 10 / 950 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48556 / UserDefUserDefinedfield14Value | User Defined Field 14 / UDSHH14 | 10 / 1050 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48557 / UserDefUserDefinedfield15Value | User Defined Field 15 / UDSHH15 | 10 / 1150 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48558 / UserDefUserDefinedfield16Value | User Defined Field 16 / UDSHH16 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48559 / UserDefUserDefinedfield17Value | User Defined Field 17 / UDSHH17 | 110 / 1350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48560 / UserDefUserDefinedfield18Value | User Defined Field 18 / UDSHH18 | 110 / 1450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48561 / UserDefUserDefinedfield19Value | User Defined Field 19 / UDSHH19 | 110 / 1550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48562 / UserDefUserDefinedfield20Value | User Defined Field 20 / UDSHH20 | 110 / 1650 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 86 control attributes, 32 events, and 14 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 37764 | 48429 / ShipmentHeaderMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37765 | 48429 / ShipmentHeaderMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37766 | 48429 / ShipmentHeaderMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37767 | 48432 / ReferenceInfoShipmentIdValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37768 | 48432 / ReferenceInfoShipmentIdValue | data-msg-required | Y / Y / Y | 18 / 0 |
| 37769 | 48444 / ReferenceInfoWarehouseValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37770 | 48444 / ReferenceInfoWarehouseValue | data-msg-required | Y / Y / Y | 18 / 0 |
| 37771 | 48445 / ReferenceInfoAllocateCompleteValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37772 | 48445 / ReferenceInfoAllocateCompleteValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37773 | 48446 / ReferenceInfoConsolidationAllowedValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37774 | 48446 / ReferenceInfoConsolidationAllowedValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37775 | 48447 / ReferenceInfoConsolidatedValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37776 | 48447 / ReferenceInfoConsolidatedValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37777 | 48448 / ReferenceInfoManuallyEnteredValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37778 | 48448 / ReferenceInfoManuallyEnteredValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37779 | 48450 / CustomerCustomerValue | Lookup | Y / Y / N | 592 / 0 |
| 37780 | 48451 / CustomerResidentialValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37781 | 48451 / CustomerResidentialValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37782 | 48465 / StatusLeadingStatusDate | data-dateOnly | Y / Y / Y | 8 / 0 |
| 37783 | 48467 / StatusTrailingStatusDate | data-dateOnly | Y / Y / Y | 8 / 0 |
| 37784 | 48468 / StatusPriorityValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 37785 | 48468 / StatusPriorityValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 37786 | 48476 / DatesPlannedShipDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 37787 | 48477 / DatesScheduledShipDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 37788 | 48477 / DatesScheduledShipDateValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37789 | 48477 / DatesScheduledShipDateValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37790 | 48480 / DatesPlannedDeliveryDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 37791 | 48481 / DatesActualDeliveryDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 37792 | 48482 / DatesRequestedDeliveryDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 37793 | 48482 / DatesRequestedDeliveryDateValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37794 | 48482 / DatesRequestedDeliveryDateValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37795 | 48483 / ShipmentHeaderLinesGrid | data-modelClass | Y / Y / N | 108 / 0 |
| 37796 | 48483 / ShipmentHeaderLinesGrid | data-dbtable | Y / Y / N | 30 / 0 |
| 37797 | 48483 / ShipmentHeaderLinesGrid | data-headerkey | Y / Y / N | 42 / 0 |
| 37798 | 48483 / ShipmentHeaderLinesGrid | pageSize | Y / Y / Y | 4 / 0 |
| 37799 | 48492 / ShipmentHeaderCommentsGrid | data-securityCheckpoint | Y / Y / Y | 4 / 0 |
| 37800 | 48492 / ShipmentHeaderCommentsGrid | data-formId | Y / Y / Y | 8 / 0 |
| 37801 | 48492 / ShipmentHeaderCommentsGrid | data-restFormId | Y / Y / Y | 8 / 0 |
| 37802 | 48492 / ShipmentHeaderCommentsGrid | data-modelClass | Y / Y / N | 94 / 0 |
| 37803 | 48492 / ShipmentHeaderCommentsGrid | data-dbtable | Y / Y / N | 24 / 0 |
| 37804 | 48492 / ShipmentHeaderCommentsGrid | data-headerkey | Y / Y / N | 24 / 0 |
| 37805 | 48492 / ShipmentHeaderCommentsGrid | data-restupdate | Y / Y / Y | 96 / 0 |
| 37806 | 48492 / ShipmentHeaderCommentsGrid | data-restcreate | Y / Y / Y | 96 / 0 |
| 37807 | 48492 / ShipmentHeaderCommentsGrid | data-restdelete | Y / Y / Y | 100 / 0 |
| 37808 | 48492 / ShipmentHeaderCommentsGrid | data-restrictionsProcessor | Y / Y / Y | 86 / 0 |
| 37809 | 48492 / ShipmentHeaderCommentsGrid | data-defaultsProcessor | Y / Y / Y | 76 / 0 |
| 37810 | 48492 / ShipmentHeaderCommentsGrid | pageSize | Y / Y / Y | 4 / 0 |
| 37811 | 48493 / ShipmentHeaderVasActivitiesGrid | data-readonlyColumn | Y / Y / Y | 18 / 0 |
| 37812 | 48493 / ShipmentHeaderVasActivitiesGrid | data-securityCheckpoint | Y / Y / Y | 4 / 0 |
| 37813 | 48493 / ShipmentHeaderVasActivitiesGrid | data-formId | Y / Y / Y | 8 / 0 |
| 37814 | 48493 / ShipmentHeaderVasActivitiesGrid | data-modelClass | Y / Y / N | 100 / 0 |
| 37815 | 48493 / ShipmentHeaderVasActivitiesGrid | data-dbtable | Y / Y / N | 76 / 0 |
| 37816 | 48493 / ShipmentHeaderVasActivitiesGrid | data-headerkey | Y / Y / N | 42 / 0 |
| 37817 | 48493 / ShipmentHeaderVasActivitiesGrid | data-restFormId | Y / Y / Y | 8 / 0 |
| 37818 | 48493 / ShipmentHeaderVasActivitiesGrid | data-duplicateRowMsg | Y / Y / Y | 24 / 0 |
| 37819 | 48493 / ShipmentHeaderVasActivitiesGrid | data-restupdate | Y / Y / Y | 102 / 0 |
| 37820 | 48493 / ShipmentHeaderVasActivitiesGrid | data-restcreate | Y / Y / Y | 102 / 0 |
| 37821 | 48493 / ShipmentHeaderVasActivitiesGrid | data-restdelete | Y / Y / Y | 106 / 0 |
| 37822 | 48493 / ShipmentHeaderVasActivitiesGrid | data-restrictionsProcessor | Y / Y / Y | 92 / 0 |
| 37823 | 48493 / ShipmentHeaderVasActivitiesGrid | data-defaultsProcessor | Y / Y / Y | 82 / 0 |
| 37824 | 48493 / ShipmentHeaderVasActivitiesGrid | pageSize | Y / Y / Y | 4 / 0 |
| 37825 | 48501 / InternationalContainerizedValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37826 | 48501 / InternationalContainerizedValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37827 | 48504 / InternationalLicenseExpirationDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 37828 | 48520 / IntermediateConsigneeAccountNumValue | Lookup | Y / Y / N | 144 / 0 |
| 37831 | 48564 / ShiptoShipToValue | Lookup | Y / Y / N | 64 / 0 |
| 37829 | 48563 / ShipToShipToSameasCustomerValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37830 | 48563 / ShipToShipToSameasCustomerValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37834 | 48567 / ShiptoNameValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37835 | 48567 / ShiptoNameValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37836 | 48568 / ShiptoAddressValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37837 | 48568 / ShiptoAddressValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37838 | 48571 / ShiptoCityValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37839 | 48571 / ShiptoCityValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37832 | 48565 / ShiptoResidentialValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37833 | 48565 / ShiptoResidentialValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37840 | 48572 / ShiptoStateValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37841 | 48572 / ShiptoStateValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37842 | 48573 / ShiptoPostalCodeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37843 | 48573 / ShiptoPostalCodeValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37844 | 48574 / ShiptoCountryValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37845 | 48574 / ShiptoCountryValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37846 | 48578 / CarrierCarrierNameValue | childCombo | Y / Y / Y | 52 / 0 |
| 37847 | 48579 / CarrierCarrierServiceValue | parentCombo | Y / Y / Y | 46 / 0 |
| 37848 | 48589 / CarrierStopSequenceValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 37849 | 48589 / CarrierStopSequenceValue | data-msg-min | Y / Y / Y | 18 / 1 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16329 / click | 48429 / ShipmentHeaderMenuActionSave | _webUi.shipmentHeader.performPost | Not populated | Y / Y |
| 16330 / click | 48430 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 16331 / igcomboselectionchanged | 48444 / ReferenceInfoWarehouseValue | _webUi.shipmentHeader.reloadCarrierServices | Not populated | Y / Y |
| 16333 / igtexteditorvaluechanged | 48450 / CustomerCustomerValue | _webUi.shipmentHeader.customerIdChanged | Not populated | Y / Y |
| 16332 / igcomboselectionchanged | 48449 / CustomerCompanyValue | _webUi.shipmentHeader.reloadCarrierServices | Not populated | Y / Y |
| 16334 / igdatepickervaluechanged | 48476 / DatesPlannedShipDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16335 / igdatepickervaluechanged | 48477 / DatesScheduledShipDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16336 / igdatepickervaluechanged | 48478 / DatesActualShipDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16337 / igcomboselectionchanged | 48479 / DatesRequestedDeliveryTypeValue | _webUi.shipmentHeader.requestedDeliveryTypeChange | Not populated | Y / Y |
| 16338 / igdatepickervaluechanged | 48480 / DatesPlannedDeliveryDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16339 / igdatepickervaluechanged | 48481 / DatesActualDeliveryDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16340 / igdatepickervaluechanged | 48482 / DatesRequestedDeliveryDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16341 / iggridupdatingrowdeleted | 48492 / ShipmentHeaderCommentsGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16342 / iggridupdatingrowadded | 48492 / ShipmentHeaderCommentsGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16343 / iggridupdatingeditrowended | 48492 / ShipmentHeaderCommentsGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16344 / iggridupdatingrowdeleted | 48493 / ShipmentHeaderVasActivitiesGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16345 / iggridupdatingrowadded | 48493 / ShipmentHeaderVasActivitiesGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16346 / iggridupdatingeditrowended | 48493 / ShipmentHeaderVasActivitiesGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16347 / igcomboselectionchanged | 48493 / ShipmentHeaderVasActivitiesGrid | _webUi.shipmentHeader.vasActivityChanged | VasActivityId | Y / Y |
| 16348 / iggridupdatingeditrowending | 48493 / ShipmentHeaderVasActivitiesGrid | _webUi.shipmentHeader.gridVasActivityEditRowEnding | Not populated | Y / Y |
| 16349 / igdatepickervaluechanged | 48504 / InternationalLicenseExpirationDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16350 / igtexteditorvaluechanged | 48520 / IntermediateConsigneeAccountNumValue | _webUi.shipmentHeader.intermediateConsigneeChanged | Not populated | Y / Y |
| 16351 / igdatepickervaluechanged | 48559 / UserDefUserDefinedfield17Value | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16352 / igdatepickervaluechanged | 48560 / UserDefUserDefinedfield18Value | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16353 / igdatepickervaluechanged | 48561 / UserDefUserDefinedfield19Value | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16354 / igdatepickervaluechanged | 48562 / UserDefUserDefinedfield20Value | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16356 / igtexteditorvaluechanged | 48564 / ShiptoShipToValue | _webUi.shipmentHeader.shipToChanged | Not populated | Y / Y |
| 16355 / change | 48563 / ShipToShipToSameasCustomerValue | _webUi.shipmentHeader.shipToSameAsCustomer | Not populated | Y / Y |
| 16357 / DOMContentLoaded | 48572 / ShiptoStateValue | _webUi.detailsScreenBinding.onReadyEventHandler | Not populated | Y / Y |
| 16358 / igcomboselectionchanged | 48574 / ShiptoCountryValue | _webUi.shipmentHeader.shipToCountryChanged | Not populated | Y / Y |
| 16359 / igcomboselectionchanged | 48578 / CarrierCarrierNameValue | _webUi.shipmentHeader.carrierChanged | Not populated | Y / Y |
| 16360 / igcomboselectionchanged | 48579 / CarrierCarrierServiceValue | _webUi.shipmentHeader.carrierServiceChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 23135 / 16329 | PUTServiceURL | Y / Y | 84 |
| 23136 / 16329 | POSTServiceErrorCallbackInsert | Y / Y | 78 |
| 23137 / 16329 | PUTServiceErrorCallbackUpdate | Y / Y | 82 |
| 23138 / 16329 | queryParameter_IdField | Y / Y | 38 |
| 23139 / 16329 | POSTServiceURL | Y / Y | 82 |
| 23140 / 16341 | CommitSelector | Y / Y | 34 |
| 23141 / 16342 | CommitSelector | Y / Y | 34 |
| 23142 / 16343 | CommitSelector | Y / Y | 34 |
| 23143 / 16344 | CommitSelector | Y / Y | 34 |
| 23144 / 16345 | CommitSelector | Y / Y | 34 |
| 23145 / 16346 | CommitSelector | Y / Y | 34 |
| 23146 / 16357 | GETServiceURL | Y / Y | 66 |
| 23147 / 16357 | queryParameter_id | Y / Y | 118 |
| 23148 / 16357 | Get_SuccessCallback | Y / Y | 112 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 22 selected candidate rows for this Screen: **22 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 37764 | 48429 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37765 | 48429 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37766 | 48429 / Not applicable | data-securityCheckpoint | checkpoint | 4 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37796 | 48483 / Not applicable | data-dbtable | database_identifier | Shipment_Detail | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37799 | 48492 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37800 | 48492 / Not applicable | data-formId | form_id | 2760 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37803 | 48492 / Not applicable | data-dbtable | database_identifier | COMMENT_TEXT | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37805 | 48492 / Not applicable | data-restupdate | relative_api_path | /general/scaleapi/ShipmentHeaderCommentsApi/save | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37806 | 48492 / Not applicable | data-restcreate | relative_api_path | /general/scaleapi/ShipmentHeaderCommentsApi/save | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37807 | 48492 / Not applicable | data-restdelete | relative_api_path | /general/scaleapi/ShipmentHeaderCommentsApi/delete | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37812 | 48493 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37813 | 48493 / Not applicable | data-formId | form_id | 2760 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37815 | 48493 / Not applicable | data-dbtable | database_identifier | Shipment_Header_VAS_Activity_Grid_View | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37819 | 48493 / Not applicable | data-restupdate | relative_api_path | /general/scaleapi/ShipmentHeaderVasActivityApi/save | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37820 | 48493 / Not applicable | data-restcreate | relative_api_path | /general/scaleapi/ShipmentHeaderVasActivityApi/save | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37821 | 48493 / Not applicable | data-restdelete | relative_api_path | /general/scaleapi/ShipmentHeaderVasActivityApi/delete | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23135 | 48429 / 16329 | PUTServiceURL | relative_api_path | /general/scaleapi/ShipmentHeadersApi/save? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23136 | 48429 / 16329 | POSTServiceErrorCallbackInsert | callback_identifier | _webUi.shipmentHeader.errorCallbackSave | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23137 | 48429 / 16329 | PUTServiceErrorCallbackUpdate | callback_identifier | _webUi.shipmentHeader.errorCallbackUpdate | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23139 | 48429 / 16329 | POSTServiceURL | relative_api_path | /general/scaleapi/ShipmentHeadersApi/save | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23146 | 48572 / 16357 | GETServiceURL | relative_api_path | /general/scaleapi/CountryApi/GET? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23148 | 48572 / 16357 | Get_SuccessCallback | callback_identifier | _webUi.shipmentHeader.successCallbackShipToCountryChange | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
