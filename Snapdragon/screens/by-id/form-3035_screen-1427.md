# Receipt Line — Form 3035, Screen 1427

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3035 |
| MAIN_UI_SCREEN Object ID | 1427 |
| Label / Form resource key | Receipt Line / MNU_RECEIPTDETAILDETAILS |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | record_detail_template / 6 |
| Configured path | /scale/details/receiptdetail |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/receiptdetail |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3035 |
| Inspection requirement | record_context_required |
| Form configuration table/view | ReceiptDetail |
| Help page reference | createRecHeadDet.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3035 |
| Inspection time (UTC) | 2026-10-02T15:25:43.120Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_RECEIPTDETAILDETAILS |
| Observed configured table/view | ReceiptDetail |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1427 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Receipt Line is recorded as `record_detail_template`. Its saved configuration contains 1 parts, 11 groups, 82 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3187 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | Not populated |

### Part 3187: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 13384 / ReceiptDetailMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13384; default=None |
| 13385 / ReceiptDetailMenuPanel | 13384 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13384; default=None |
| 13387 / ReceiptDetailItemInfoSubAccordion | 13386 | Item Info / ITEMINFO | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=13386; default=ReceiptDetailMenuActionSave |
| 13386 / ReceiptDetailMainAccordion | Not populated | Not populated / Not populated | 140 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=13386; default=None |
| 13388 / ReceiptDetailQuantityInfoSubAccordion | 13386 | Quantity Info / QUANTITYINFO | 50 / 500 | Y / Y | Fixed to top=N; loading=2; nested unit=13386; default=ReceiptDetailMenuActionSave |
| 13389 / ReceiptDetailItemDimensionSubAccordion | 13386 | Item Dimensions / ITEMDIMENSIONS | 50 / 750 | Y / Y | Fixed to top=N; loading=1; nested unit=13386; default=None |
| 13390 / ReceiptDetailItemCharacteristicsSubAccordion | 13386 | Item Characteristics / ITEMCHAR | 50 / 1000 | Y / Y | Fixed to top=N; loading=1; nested unit=13386; default=None |
| 13391 / ReceiptDetailProcessingValuesSubAccordion | 13386 | Processing Values / PROCVALUES | 50 / 1250 | Y / Y | Fixed to top=N; loading=1; nested unit=13386; default=None |
| 13392 / ReceiptDetailReferenceInfoSubAccordion | 13386 | Reference Info / REFERENCEINFO | 50 / 1500 | Y / Y | Fixed to top=N; loading=1; nested unit=13386; default=ReceiptDetailMenuActionSave |
| 13393 / ReceiptDetailCategoriesSubAccordion | 13386 | Categories / CATEGORIES | 50 / 1750 | Y / Y | Fixed to top=N; loading=1; nested unit=13386; default=None |
| 13394 / ReceiptDetailUserDefinedSubAccordion | 13386 | User Defined / USERDEFINED | 50 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=13386; default=None |

#### Group 13385: ReceiptDetailMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38902 / ReceiptDetailMenuActionSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 38903 / ReceiptDetailSectionItem | Not populated / Not populated | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 38901 / ActionCancel | Cancel / BTN_CANCEL | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 13387: ReceiptDetailItemInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38904 / ItemInfoItemValue | Item / ITEM | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 38905 / ItemInfoCompanyValue | Company / COMPANY | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 38906 / ItemInfoWebImage | Not populated / Not populated | 170 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 38907 / ItemInfoItemDescriptionValue | Description / ITEMDESCRIPTION | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 38908 / ItemInfoLotControlledValue | Lot Controlled / LOTCONTROLLED | 130 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 38909 / ItemInfoLotValue | Lot / LOT | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 38910 / ItemInfoExpirationDateValue | Expiration Date / EXPIRATIONDATE | 110 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13388: ReceiptDetailQuantityInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38911 / QuantityInfoTotalQuantityValue | Total Quantity / TOTALQUANTITY | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38912 / QuantityInfoTotalQuantityUmValue | UM / UM | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38913 / QuantityInfoOpenQuantityValue | Open Quantity / OPENQUANTITY | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38914 / QuantityInfoOpenQuantityUmValue | UM / UM | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38915 / QuantityInfoOriginalTotalQuantityValue | Original Total Quantity / ORIGINALTOTALQUANTITY | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38916 / QuantityInfoOriginalTotalQuantityUmValue | UM / UM | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13389: ReceiptDetailItemDimensionSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38917 / ReceiptDetailItemDimensionsSectionLengthValue | Length / LENGTH | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38918 / ReceiptDetailItemDimensionsSectionLengthUMValue | UM / UM | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38919 / ReceiptDetailItemDimensionsSectionWidthValue | Width / WIDTH | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38920 / ReceiptDetailItemDimensionsSectionWidthUMValue | UM / UM | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38921 / ReceiptDetailItemDimensionsSectionHeightValue | Height / HEIGHT | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38922 / ReceiptDetailItemDimensionsSectionHeightUMValue | UM / UM | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38923 / ReceiptDetailItemDimensionsSectionVolumeValue | Volume / VOLUME | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38924 / ReceiptDetailItemDimensionsSectionVolumeUMValue | UM / UM | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38925 / ReceiptDetailItemDimensionsSectionTotVolValue | Total Volume / TOTALVOLUME | 90 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38926 / ReceiptDetailItemDimensionsSectionTotVolUMValue | UM / UM | 80 / 2500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38927 / ReceiptDetailItemDimensionsSectionWeightValue | Weight / WEIGHT | 90 / 2750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38928 / ReceiptDetailItemDimensionsSectionWeightUMValue | UM / UM | 80 / 3000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38929 / ReceiptDetailItemDimensionsSectionTotWtValue | Total Weight / TOTALWEIGHT | 90 / 3250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38930 / ReceiptDetailItemDimensionsSectionTotWtUMValue | UM / UM | 80 / 3500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13390: ReceiptDetailItemCharacteristicsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38931 / RDItemCharacteristicsSectionNetPriceValue | Net Price / NETPRICE | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38932 / RDItemCharacteristicsSectionListPriceValue | List Price / LISTPRICE | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38933 / RDItemCharacteristicsSectionStyleValue | LIN/Style / STYLE | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38934 / RDItemCharacteristicsSectionColorValue | Color / COLOR | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38935 / RDItemCharacteristicsSectionSizeValue | Size / SIZE | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38936 / RDItemCharacteristicsSectionDepartmentValue | Department / DEPARTMENT | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38937 / RDItemCharacteristicsSectionClassValue | Item Class / ITEMCLASS | 80 / 1750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38938 / RDItemCharacteristicsSectionDivisionValue | Division / DIVISION | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38939 / RDItemCharacteristicsSectionHazardousCodeValue | Hazardous Code / HAZARDOUSCODE | 10 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38940 / RDItemCharacteristicsSectionLocatingRuleValue | Locating Rule / LOCATINGRULE | 80 / 2500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38941 / RDICSectionCatchWeightRequiredValue | Catch Weight Required / CATCH_WEIGHT_REQD | 130 / 2750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38942 / RDICSectionSerialNumberRequiredValue | Serial Number Required / SERIAL_NUM_REQD | 130 / 3000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13391: ReceiptDetailProcessingValuesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38943 / RDProcessingValuesSectionWaveNumberValue | Wave Number / WAVENUMBER | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38944 / RDProcessingValuesSectionPutListNumberValue | Put List Number / PUTLISTNUMBER | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38945 / RDProcessingValuesSectionPutAwayLocationValue | Putaway Location / PUTLOCATION | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 38946 / RDProcessingValuesSectionPutAwayZoneValue | Putaway Zone / PUTZONE | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38947 / RDProcessingValuesSectionStatusFlowNameValue | Status Flow Name / STATUSFLOWNAME | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38948 / RDProcessingValuesSectionInventoryStatusValue | Inventory Status / INVENTORYSTS | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13392: ReceiptDetailReferenceInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38949 / RDReferenceInfoSectionRefId | Receipt ID / RECEIPTID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38950 / RDReferenceInfoSectionErpOrderNumberValue | ERP Order Number / ERPORDERNUMBER | 10 / 350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38951 / RDReferenceInfoSectionErpOrderLineNumberValue | ERP Order Line Number / ERPORDERLINENUM | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38952 / RDReferenceInfoSectionErpOrderTypeValue | ERP Order Type / ERPORDERTYPE | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38953 / RDReferenceInfoSectionInternalRcptLineNumValue | Internal Receipt Line Number / INTERNALRECEIPTLINENUM | 90 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38954 / RDReferenceInfoSectionCustomerOrderNumberValue | Customer Order Number / CUSTOMERORDERNUM | 10 / 1100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38955 / RDReferenceInfoSectionInternalReceiptDateValue | Receipt Date / RECEIPTDATE | 110 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38956 / RDReferenceInfoSectionManufacturedDateValue | Manufactured Date / MANUFACTUREDDATE | 110 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38957 / RDReferenceInfoSectionPurchaseOrderidValue | Purchase Order ID / PURCHASE_ORDER_ID | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38958 / RDReferenceInfoSectionPurchaseOrderLineNumberValue | Purchase Order Line Number / PURCHASEORDERLINENUMBER | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38959 / RDReferenceInfoSectionPriorityValue | Priority / PRIORITY | 90 / 2200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38960 / RDReferenceInfoSectionWarehouseValue | Warehouse / WAREHOUSE | 80 / 2750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38961 / RDReferenceInfoSectionUserStampValue | User Stamp / USERSTAMP | 10 / 3000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38962 / RDReferenceInfoSectionDateTimeStampValue | Date Time Stamp / DATETIMESTAMP | 120 / 3100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38963 / RDReferenceInfoSectionProcessStampValue | Process Stamp / PROCESSSTAMP | 10 / 3200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 38964 / RDReferenceInfoSectionManuallyEnteredValue | Manually Entered / MANUALLYENTERED | 130 / 3500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13393: ReceiptDetailCategoriesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38965 / ReceiptDetailCategoriesSectionCategory1Value | ISM EOL / ITEMCATEGORY1 | 270 / 250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38966 / ReceiptDetailCategoriesSectionCategory2Value | ISM ACCOUNTABLE / ITEMCATEGORY2 | 270 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38967 / ReceiptDetailCategoriesSectionCategory3Value | ISM UI / ITEMCATEGORY3 | 270 / 750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38968 / ReceiptDetailCategoriesSectionCategory4Value | Item Category 4 / ITEMCATEGORY4 | 270 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38969 / ReceiptDetailCategoriesSectionCategory5Value | Item Category 5 / ITEMCATEGORY5 | 270 / 1250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38970 / ReceiptDetailCategoriesSectionCategory6Value | Item Category 6 / ITEMCATEGORY6 | 270 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38971 / ReceiptDetailCategoriesSectionCategory7Value | Item Category 7 / ITEMCATEGORY7 | 270 / 1750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38972 / ReceiptDetailCategoriesSectionCategory8Value | Item Category 8 / ITEMCATEGORY8 | 270 / 2000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38973 / ReceiptDetailCategoriesSectionCategory9Value | Item Category 9 / ITEMCATEGORY9 | 270 / 2250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38974 / ReceiptDetailCategoriesSectionCategory10Value | Item Category 10 / ITEMCATEGORY10 | 270 / 2500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13394: ReceiptDetailUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38975 / ReceiptDetailUserDefinedSectionUserDefined1Value | User Defined Field 1 / UDRHD1 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38976 / ReceiptDetailUserDefinedSectionUserDefined2Value | User Defined Field 2 / UDRHD2 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38977 / ReceiptDetailUserDefinedSectionUserDefined3Value | User Defined Field 3 / UDRHD3 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38978 / ReceiptDetailUserDefinedSectionUserDefined4Value | User Defined Field 4 / UDRHD4 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38979 / ReceiptDetailUserDefinedSectionUserDefined5Value | User Defined Field 5 / UDRHD5 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38980 / ReceiptDetailUserDefinedSectionUserDefined6Value | User Defined Field 6 / UDRHD6 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38981 / ReceiptDetailUserDefinedSectionUserDefined7Value | User Defined Field 7 / UDRHD7 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38982 / ReceiptDetailUserDefinedSectionUserDefined8Value | User Defined Field 8 / UDRHD8 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 19 control attributes, 14 events, and 7 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 29710 | 38904 / ItemInfoItemValue | toUpper | Y / Y / Y | 8 / 0 |
| 29711 | 38904 / ItemInfoItemValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 29712 | 38904 / ItemInfoItemValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 29713 | 38904 / ItemInfoItemValue | Lookup | Y / Y / N | 112 / 0 |
| 29714 | 38905 / ItemInfoCompanyValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 29715 | 38906 / ItemInfoWebImage | data-msg-required | Y / Y / Y | 18 / 1 |
| 29716 | 38909 / ItemInfoLotValue | toUpper | Y / Y / Y | 8 / 0 |
| 29717 | 38909 / ItemInfoLotValue | Lookup | Y / Y / N | 48 / 0 |
| 29718 | 38910 / ItemInfoExpirationDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 29719 | 38911 / QuantityInfoTotalQuantityValue | data-rule-min | Y / Y / Y | 14 / 0 |
| 29720 | 38911 / QuantityInfoTotalQuantityValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 29721 | 38912 / QuantityInfoTotalQuantityUmValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 29722 | 38912 / QuantityInfoTotalQuantityUmValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 29723 | 38945 / RDProcessingValuesSectionPutAwayLocationValue | toUpper | Y / Y / Y | 8 / 0 |
| 29724 | 38945 / RDProcessingValuesSectionPutAwayLocationValue | Lookup | Y / Y / N | 126 / 0 |
| 29725 | 38955 / RDReferenceInfoSectionInternalReceiptDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 29726 | 38955 / RDReferenceInfoSectionInternalReceiptDateValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 29727 | 38955 / RDReferenceInfoSectionInternalReceiptDateValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 29728 | 38956 / RDReferenceInfoSectionManufacturedDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 12809 / click | 38902 / ReceiptDetailMenuActionSave | _webUi.receiptDetailDetails.performPut | Not populated | Y / Y |
| 12808 / click | 38901 / ActionCancel | _webUi.receiptDetailDetails.cancel | Not populated | Y / Y |
| 12810 / igtexteditorvaluechanged | 38904 / ItemInfoItemValue | _webUi.receiptDetailDetails.updateFieldsBasedOnItem | Not populated | Y / Y |
| 12811 / igcomboselectionchanged | 38905 / ItemInfoCompanyValue | _webUi.receiptDetailDetails.updateFieldsBasedOnItem | Not populated | Y / Y |
| 12812 / igcomboselectionchanged | 38906 / ItemInfoWebImage | _webUi.receiptDetailDetails.updateFieldsBasedOnItem | Not populated | Y / Y |
| 12813 / igtexteditorvaluechanged | 38909 / ItemInfoLotValue | _webUi.receiptDetailDetails.getLotDetails | Not populated | Y / Y |
| 12814 / igdatepickervaluechanged | 38910 / ItemInfoExpirationDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 12815 / ignumericeditortextchanged | 38911 / QuantityInfoTotalQuantityValue | _webUi.receiptDetailDetails.updateItemDimensionTotals | Not populated | Y / Y |
| 12816 / igcomboselectionchanged | 38912 / QuantityInfoTotalQuantityUmValue | _webUi.receiptDetailDetails.updateItemDimensionTotals | Not populated | Y / Y |
| 12817 / DOMContentLoaded | 38916 / QuantityInfoOriginalTotalQuantityUmValue | _webUi.receiptDetailDetails.updateQuantityInfoSubAccordion | Not populated | Y / Y |
| 12818 / DOMContentLoaded | 38930 / ReceiptDetailItemDimensionsSectionTotWtUMValue | _webUi.receiptDetailDetails.updateItemDimensionSubAccordion | Not populated | Y / Y |
| 12819 / DOMContentLoaded | 38942 / RDICSectionSerialNumberRequiredValue | _webUi.receiptDetailDetails.updateItemCharacteristicsFields | Not populated | Y / Y |
| 12820 / igdatepickervaluechanged | 38955 / RDReferenceInfoSectionInternalReceiptDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 12821 / igdatepickervaluechanged | 38956 / RDReferenceInfoSectionManufacturedDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 17422 / 12809 | PUTServiceURL | Y / Y | 82 |
| 17423 / 12809 | queryParameter_IdField | Y / Y | 44 |
| 17424 / 12809 | URL | Y / Y | 118 |
| 17425 / 12817 | none | Y / Y | 8 |
| 17426 / 12818 | none | Y / Y | 8 |
| 17427 / 12819 | none | Y / Y | 8 |
| 17428 / 12821 | none | Y / Y | 8 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 1 selected candidate rows for this Screen: **1 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_EVENT_PARAMETERS / 17422 | 38902 / 12809 | PUTServiceURL | relative_api_path | /inbound/scaleapi/receiptdetailsapi/save? | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
