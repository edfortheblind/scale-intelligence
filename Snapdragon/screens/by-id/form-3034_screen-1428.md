# Receipt — Form 3034, Screen 1428

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3034 |
| MAIN_UI_SCREEN Object ID | 1428 |
| Label / Form resource key | Receipt / MNU_RECEIPTDETAILS |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | record_detail_template / 6 |
| Configured path | /scale/details/receipt |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/receipt |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3034 |
| Inspection requirement | record_context_required |
| Form configuration table/view | ReceiptHeaderView |
| Help page reference | createRecHeadDet.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3034 |
| Inspection time (UTC) | 2026-10-02T15:25:41.192Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_RECEIPTDETAILS |
| Observed configured table/view | ReceiptHeaderView |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1428 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Receipt is recorded as `record_detail_template`. Its saved configuration contains 1 parts, 12 groups, 83 controls, and 13 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3188 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | ReceiptHeaderMenuActionSave |

### Part 3188: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 13398 / ReceiptHeaderReferenceinfoTitleSubAccordion | 13397 | Reference Info / REFERENCEINFO | 50 / 200 | Y / Y | Fixed to top=N; loading=2; nested unit=13397; default=None |
| 13395 / ReceiptMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13395; default=None |
| 13396 / ReceiptHeaderMenuPanel | 13395 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13395; default=None |
| 13399 / ReceiptHeaderSourceTitleSubAccordion | 13397 | Source / SOURCE | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=13397; default=None |
| 13400 / ReceiptHeaderShipFromTitleSubAccordion | 13397 | Ship From / SHIPFROM | 50 / 500 | Y / Y | Fixed to top=N; loading=2; nested unit=13397; default=None |
| 13401 / ReceiptHeaderStatusTitleSubAccordion | 13397 | Status / STATUS | 50 / 750 | Y / Y | Fixed to top=N; loading=1; nested unit=13397; default=None |
| 13402 / ReceiptHeaderCarrierTitleSubAccordion | 13397 | Carrier / CARRIER | 50 / 1000 | Y / Y | Fixed to top=N; loading=1; nested unit=13397; default=None |
| 13403 / ReceiptHeaderDatesTitleSubAccordion | 13397 | Dates / DATES | 50 / 1250 | Y / Y | Fixed to top=N; loading=1; nested unit=13397; default=None |
| 13404 / ReceiptHeaderLinesTitleSubAccordion | 13397 | Lines / LINES | 50 / 1500 | Y / Y | Fixed to top=N; loading=1; nested unit=13397; default=None |
| 13405 / ReceiptHeaderTotalsTitleSubAccordion | 13397 | Totals / TOTALS | 50 / 1750 | Y / Y | Fixed to top=N; loading=1; nested unit=13397; default=None |
| 13397 / ReceiptHeaderDetailMainAccordion | Not populated | Not populated / Not populated | 140 / 2000 | Y / Y | Fixed to top=N; loading=2; nested unit=13397; default=None |
| 13406 / ReceiptHeaderUserDefinedTitleSubAccordion | 13397 | User Defined / USERDEFINED | 50 / 2250 | Y / Y | Fixed to top=N; loading=1; nested unit=13397; default=None |

#### Group 13398: ReceiptHeaderReferenceinfoTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38986 / ReferenceinfoReceiptidValue | Receipt ID / RECEIPTID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38987 / ReferenceinfoReceiptidtypeValue | Receipt ID Type / RECEIPTIDTYPE | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38988 / ReferenceinfoReceipttypeValue | Receipt Type / RECEIPTTYPE | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38989 / ReferenceinfoWarehouseeValue | Warehouse / WAREHOUSE | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38990 / ReferenceinfoInternalreceiptnumValue | Internal Receipt Number / INTERNALRECEIPTNUM | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38991 / ReferenceinfoPurchaseorderidValue | Purchase Order ID / PURCHASEORDERID | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38992 / ReferenceinfoErpordernumberValue | ERP Order Number / ERPORDERNUM | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38993 / ReferenceinfoErpordertypeValue | ERP Order Type / ERPORDERTYPE | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38994 / ReferenceinfoManuallyenteredValue | Manually Entered / MANUALLYENTERED | 130 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13396: ReceiptHeaderMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38983 / ReceiptHeaderMenuActionSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 38985 / ReceiptHeaderSectionReceiptId | Not populated / Not populated | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 38984 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 13399: ReceiptHeaderSourceTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38995 / SourceSourceIdValue | Source ID / SOURCEID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 38996 / SourceCompanyValue | Company / COMPANY | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38997 / SourceNameValue | Name / NAME | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38998 / SourceAttentionToValue | Attention To / ATTENTIONTO | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38999 / SourceAddressValue | Address 1 / ADDRESS1 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39000 / SourcePhoneNumberValue | Phone Number / PHONENUM | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39001 / SourceAddress2Value | Address 2 (Optional) / ADDRESS2 | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39002 / SourceFaxNumberValue | Fax Number / FAXNUM | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39003 / SourceAddress3Value | Address 3 (Optional) / ADDRESS3 | 10 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39004 / SourceEmailAddressValue | Email Address / EMAILADDRESS | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39005 / SourceCityValue | City / CITY | 10 / 2750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 39006 / SourceStateValue | State / STATE | 80 / 3000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 39007 / SourceZipValue | Postal Code / POSTALCODE | 10 / 3250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 39008 / SourceCountryValue | Country / COUNTRY | 80 / 3500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13400: ReceiptHeaderShipFromTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39009 / ShipFromShipFromIdValue | Ship From / SHIPFROMID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 39010 / ShipFromShipFromSameasSourceValue | Use Source Address / USESOURCEADDRESS | 130 / 375 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39011 / ShipFromNameValue | Name / NAME | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39012 / ShipFromAttentionToValue | Attention To / ATTENTIONTO | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39013 / ShipFromAddressValue | Address 1 / ADDRESS1 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39014 / ShipFromPhoneNumberValue | Phone Number / PHONENUM | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39015 / ShipFromAddress2Value | Address 2 (Optional) / ADDRESS2 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39016 / ShipFromFaxNumberValue | Fax Number / FAXNUM | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39017 / ShipFromAddress3Value | Address 3 (Optional) / ADDRESS3 | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39018 / ShipFromEmailAddressValue | Email Address / EMAILADDRESS | 10 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39019 / ShipFromCityValue | City / CITY | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 39020 / ShipFromStateValue | State / STATE | 80 / 2750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 39021 / ShipFromZipValue | Postal Code / POSTALCODE | 10 / 3000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 39022 / ShipFromCountryValue | Country / COUNTRY | 80 / 3250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13401: ReceiptHeaderStatusTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39023 / StatusLeadingStatusValue | Leading Status / LEADINGSTS | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39024 / StatusLeadingStatusDateValue | Leading Status Date / LEADINGSTSDATE | 110 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39025 / StatusTrailingStatusValue | Trailing Status / TRAILINGSTS | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39026 / StatusTrailingStatusDateValue | Trailing Status Date / TRAILINGSTSDATE | 110 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39027 / StatusPriorityValue | Priority / PRIORITY | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 39028 / StatusCreatedByValue | Created By / CREATEDBY | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39029 / StatusCreationDateTimeStampValue | Creation Date Time / CREATIONDATETIMESTAMP | 110 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39030 / StatusLastUpdatedByValue | Last Updated By / LASTUPDATEDBY | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39031 / StatusDateTimeStampValue | Date Time Stamp / DATETIMESTAMP | 110 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13402: ReceiptHeaderCarrierTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39032 / CarrierCarrierValue | Carrier / CARRIER | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39033 / CarrierCarrierServiceValue | Carrier Service / CARRIERSERVICE | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 39034 / CarrierLicensePlateValue | License Plate / RECEIVINGLICENSEPLATE | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39035 / CarrierPackinglistidValue | Packing List ID / PACKINGLISTID | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39036 / CarrierSealidValue | Seal ID / SEALID | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39037 / CarrierTrailerIdValue | Trailer ID / TRAILERID | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39038 / CarrierBOLnumberValue | BOL Number / BOLNUMBER | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39039 / CarrierPronumberValue | BOL/PRO/Tracking Num / PRONUMBER | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13403: ReceiptHeaderDatesTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39040 / DatesScheduledDateValue | Scheduled Date / SCHEDULEDDATE | 110 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39041 / DatesArrivedDateValue | Arrived Date Time / ARRIVEDDATETIME | 110 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39042 / DatesStartedCheckInValue | Started Check in / STARTEDUNITIZATION | 110 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39043 / DatesEndedCheckInValue | Ended Check in / ENDEDUNITIZATION | 110 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 39044 / DatesReceiptDateValue | Receipt Date / RECEIPTDATE | 110 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39045 / DatesCloseDateValue | Closed Date Time / CLOSEDDATETIME | 110 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39046 / DatesReceivingDockValue | Receiving Dock / RECEIVINGDOCK | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39047 / DatesApptdatetimeValue | Appointment Date Time / APPTDATETIME | 120 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13404: ReceiptHeaderLinesTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39048 / AttributesMenuActionAdd | Add / BTN_ADD | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowWithNav-1; TOOL_TIP_RESOURCE_KEY=BTN_ADD |
| 39049 / ReceiptHeaderLinesGrid | Not populated / Not populated | 20 / 6300 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 39049 `ReceiptHeaderLinesGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 13094 / Icon | Not populated / Icon / ICON | 10 / 10 / 10 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13095 / Color | Not populated / Color / COLOR | 10 / 10 / 20 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13096 / ErpOrderLineNum | ERP_ORDER_LINE_NUM / ERP Order Line Number / ERPORDERLINENUM | 20 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13097 / Item | ITEM / Item / ITEM | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13098 / Company | COMPANY / Company / COMPANY | 10 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13099 / ItemDesc | ITEM_DESC / Description / DESCRIPTION | 10 / 10 / 60 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13100 / TotalQty | TOTAL_QTY / Total Quantity / TOTALQUANTITY | 20 / 10 / 70 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 13101 / OpenQty | OPEN_QTY / Open Quantity / OPENQUANTITY | 20 / 10 / 80 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 13102 / ErpOrderNum | ERP_ORDER_NUM / ERP Order / ERPORDER | 10 / 10 / 90 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13103 / TotalWeight | TOTAL_WEIGHT / Total Weight / TOTALWEIGHT | 20 / 10 / 100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=60; DATA_SOURCE_TYPE=None |
| 13104 / Value | VALUE / Total Value / TOTALVALUE | 20 / 10 / 110 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=40; DATA_SOURCE_TYPE=None |
| 13105 / Not populated | ERP_ORDER_LINE_NUM / Not populated / Not populated | Not populated / 30 / 120 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13106 / InternalReceiptLineNum | INTERNAL_RECEIPT_LINE_NUM / Internal Receipt Line Number / INTERNALRECEIPTLINENUM | 20 / 10 / 130 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 13405: ReceiptHeaderTotalsTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39050 / TotalsTotallinesValue | Total Lines / TOTALLINES | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39051 / TotalsTotalContainersValue | Total Containers / TOTALCONTAINERS | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39052 / TotalsTotalUnitsValue | Total Units / TOTALUNITS | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39053 / TotalsTotalvalueValue | Total Value / TOTALVALUE | 90 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39054 / TotalsTotalweightValue | Total Weight / TOTALWEIGHT | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39055 / TotalsTotalweightUmValue | UM / UM | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39056 / TotalsTotalvolumeValue | Total Volume / TOTALVOLUME | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39057 / TotalsTotalvolumeUmValue | UM / UM | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13406: ReceiptHeaderUserDefinedTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39058 / ReceiptHeaderUserDefinedField1Value | User Defined Field 1 / UDRH1 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39059 / ReceiptHeaderUserDefinedField2Value | User Defined Field 2 / UDRH2 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39060 / ReceiptHeaderUserDefinedField3Value | User Defined Field 3 / UDRH3 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39061 / ReceiptHeaderUserDefinedField4Value | User Defined Field 4 / UDRH4 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39062 / ReceiptHeaderUserDefinedField5Value | User Defined Field 5 / UDRH5 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39063 / ReceiptHeaderUserDefinedField6Value | User Defined Field 6 / UDRH6 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39064 / ReceiptHeaderUserDefinedField7Value | User Defined Field 7 / UDRH7 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39065 / ReceiptHeaderUserDefinedField8Value | User Defined Field 8 / UDRH8 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 27 control attributes, 12 events, and 8 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 29729 | 38983 / ReceiptHeaderMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 29730 | 38983 / ReceiptHeaderMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 29731 | 38986 / ReferenceinfoReceiptidValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 29732 | 38986 / ReferenceinfoReceiptidValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 29733 | 38986 / ReferenceinfoReceiptidValue | toUpper | Y / Y / Y | 8 / 0 |
| 29734 | 38987 / ReferenceinfoReceiptidtypeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 29735 | 38987 / ReferenceinfoReceiptidtypeValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 29736 | 38991 / ReferenceinfoPurchaseorderidValue | disabled | Y / Y / Y | 8 / 0 |
| 29737 | 38994 / ReferenceinfoManuallyenteredValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 29738 | 38994 / ReferenceinfoManuallyenteredValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 29739 | 38995 / SourceSourceIdValue | Lookup | Y / Y / N | 172 / 0 |
| 29740 | 39009 / ShipFromShipFromIdValue | Lookup | Y / Y / N | 184 / 0 |
| 29741 | 39010 / ShipFromShipFromSameasSourceValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 29742 | 39010 / ShipFromShipFromSameasSourceValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 29743 | 39024 / StatusLeadingStatusDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 29744 | 39026 / StatusTrailingStatusDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 29745 | 39032 / CarrierCarrierValue | childCombo | Y / Y / Y | 52 / 0 |
| 29746 | 39033 / CarrierCarrierServiceValue | parentCombo | Y / Y / Y | 38 / 0 |
| 29747 | 39040 / DatesScheduledDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 29748 | 39044 / DatesReceiptDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 29749 | 39048 / AttributesMenuActionAdd | data-formId | Y / Y / N | 8 / 0 |
| 29750 | 39048 / AttributesMenuActionAdd | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 29751 | 39049 / ReceiptHeaderLinesGrid | data-dbtable | Y / Y / N | 28 / 0 |
| 29752 | 39049 / ReceiptHeaderLinesGrid | data-headerkey | Y / Y / N | 40 / 0 |
| 29753 | 39049 / ReceiptHeaderLinesGrid | data-modelClass | Y / Y / N | 118 / 0 |
| 29754 | 39049 / ReceiptHeaderLinesGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 44 / 0 |
| 29755 | 39049 / ReceiptHeaderLinesGrid | pageSize | Y / Y / Y | 4 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 12822 / click | 38983 / ReceiptHeaderMenuActionSave | _webUi.receiptDetails.save | Not populated | Y / Y |
| 12823 / click | 38984 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 12824 / igtexteditorvaluechanged | 38995 / SourceSourceIdValue | _webUi.receiptDetails.sourceIdChanged | Not populated | Y / Y |
| 12825 / igtexteditorvaluechanged | 39009 / ShipFromShipFromIdValue | _webUi.receiptDetails.shipFromIdChanged | Not populated | Y / Y |
| 12826 / change | 39010 / ShipFromShipFromSameasSourceValue | _webUi.receiptDetails.useSourceAddressToggled | Not populated | Y / Y |
| 12827 / igcomboselectionchanged | 39032 / CarrierCarrierValue | _webUi.receiptDetails.carrierChanged | Not populated | Y / Y |
| 12828 / igcomboselectionchanged | 39033 / CarrierCarrierServiceValue | _webUi.receiptDetails.carrierChanged | Not populated | Y / Y |
| 12829 / igdatepickervaluechanged | 39040 / DatesScheduledDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 12830 / igdatepickervaluechanged | 39041 / DatesArrivedDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 12831 / igdatepickervaluechanged | 39044 / DatesReceiptDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 12832 / click | 39048 / AttributesMenuActionAdd | _webUi.detailsScreenActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 12833 / DOMContentLoaded | 39049 / ReceiptHeaderLinesGrid | _webUi.receiptDetails.disableAddButton | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 17429 / 12822 | POSTServiceURL | Y / Y | 80 |
| 17430 / 12822 | POSTServiceErrorCallbackInsert | Y / Y | 70 |
| 17431 / 12822 | PUTServiceErrorCallbackUpdate | Y / Y | 70 |
| 17432 / 12822 | PUTServiceURL | Y / Y | 82 |
| 17433 / 12822 | queryParameter_IdField | Y / Y | 36 |
| 17434 / 12822 | URL | Y / Y | 90 |
| 17435 / 12832 | URL | Y / Y | 118 |
| 17436 / 12833 | none | Y / Y | 8 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 9 selected candidate rows for this Screen: **9 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 29729 | 38983 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 29730 | 38983 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 29749 | 39048 / Not applicable | data-formId | form_id | 3035 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 29750 | 39048 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 29751 | 39049 / Not applicable | data-dbtable | database_identifier | RECEIPT_DETAIL | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 17429 | 38983 / 12822 | POSTServiceURL | relative_api_path | /inbound/scaleapi/receiptHeadersApi/save | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 17430 | 38983 / 12822 | POSTServiceErrorCallbackInsert | callback_identifier | _webUi.receiptDetails.errorCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 17431 | 38983 / 12822 | PUTServiceErrorCallbackUpdate | callback_identifier | _webUi.receiptDetails.errorCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 17432 | 38983 / 12822 | PUTServiceURL | relative_api_path | /inbound/scaleapi/receiptHeadersApi/save? | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
