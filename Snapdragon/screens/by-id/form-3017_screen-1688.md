# Shipment Line — Form 3017, Screen 1688

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3017 |
| MAIN_UI_SCREEN Object ID | 1688 |
| Label / Form resource key | Shipment Line / MNU_SHIPMENTDETAILDETAILS |
| Functional area code | 120 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | record_detail_template / 6 |
| Configured path | /scale/details/shipmentdetail |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/shipmentdetail |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3017 |
| Inspection requirement | record_context_required |
| Form configuration table/view | ShipmentDetail |
| Help page reference | createShipDetail.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3017 |
| Inspection time (UTC) | 2026-10-02T15:24:57.449Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_SHIPMENTDETAILDETAILS |
| Observed configured table/view | ShipmentDetail |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1688 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Shipment Line is recorded as `record_detail_template`. Its saved configuration contains 1 parts, 22 groups, 155 controls, and 32 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3912 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | ShipmentDetailSave |

### Part 3912: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16435 / ShipmentDetailMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16435; default=None |
| 16436 / ShipmentDetailMenuPanel | 16435 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16435; default=None |
| 16438 / ShipmentDetailItemInfoSubAccordion | 16437 | Item Info / ITEMINFO | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=16437; default=None |
| 16437 / ShipmentDetailMainAccordion | Not populated | Not populated / Not populated | 140 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=16437; default=None |
| 16439 / ShipmentDetailQuantityInfoSubAccordion | 16437 | Quantity Info / QUANTITYINFO | 50 / 500 | Y / Y | Fixed to top=N; loading=2; nested unit=16437; default=None |
| 16440 / ShipmentDetailItemDimensionsSubAccordion | 16437 | Item Dimensions / ITEMDIMENSIONS | 50 / 750 | Y / Y | Fixed to top=N; loading=1; nested unit=16437; default=None |
| 16441 / ShipmentDetailItemCharacteristicsSubAccordion | 16437 | Item Characteristics / ITEMCHAR | 50 / 1000 | Y / Y | Fixed to top=N; loading=1; nested unit=16437; default=None |
| 16442 / ShipmentDetailDatesSubAccordion | 16437 | Dates / DATES | 50 / 1250 | Y / Y | Fixed to top=N; loading=1; nested unit=16437; default=None |
| 16443 / ShipmentDetailStatusSubAccordion | 16437 | Status / STATUS | 50 / 1500 | Y / Y | Fixed to top=N; loading=1; nested unit=16437; default=None |
| 16444 / ShipmentDetailAdvancedAllocationSubAccordion | 16437 | Advanced Allocation / ADVANCEDALLOCATION | 50 / 1750 | Y / Y | Fixed to top=N; loading=1; nested unit=16437; default=None |
| 16445 / ShipmentDetailPackingSubAccordion | 16437 | Packing / PACKING | 50 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=16437; default=None |
| 16446 / ShipmentDetailBillOfMaterialsSubAccordion | 16437 | Bill of Materials / BILLOFMATERIALS | 50 / 2250 | Y / Y | Fixed to top=N; loading=1; nested unit=16437; default=None |
| 16447 / ShipmentDetailPickingSubAccordion | 16437 | Picking / PICKING | 50 / 2500 | Y / Y | Fixed to top=N; loading=1; nested unit=16437; default=None |
| 16448 / ShipmentDetailImmediateNeedsSubAccordion | 16437 | Immediate Needs / IMMEDIATENEEDS | 50 / 2750 | Y / Y | Fixed to top=N; loading=1; nested unit=16437; default=None |
| 16450 / ShipmentDetailCommentsSectionSubAccordion | 16437 | Comments / TEXT | 50 / 3000 | Y / Y | Fixed to top=N; loading=1; nested unit=16437; default=None |
| 16449 / ShipmentDetailVasActivitiesSubAccordion | 16437 | VAS Activities / VASACTIVITIESTAB | 50 / 3250 | Y / Y | Fixed to top=N; loading=1; nested unit=16437; default=None |
| 16451 / ShipmentDetailReferenceInfoSubAccordion | 16437 | Reference Info / REFERENCEINFO | 50 / 3500 | Y / Y | Fixed to top=N; loading=1; nested unit=16437; default=None |
| 16452 / ShipmentDetailClassificationSubAccordion | 16437 | Classification / CLASSIFICATION | 50 / 3750 | Y / Y | Fixed to top=N; loading=1; nested unit=16437; default=None |
| 16453 / ShipmentDetailMarkForSubAccordion | 16437 | Mark for / MARK_FOR | 50 / 4000 | Y / Y | Fixed to top=N; loading=1; nested unit=16437; default=None |
| 16454 / ShipmentDetailInternationalSubAccordion | 16437 | International / INTERNATIONAL | 50 / 4250 | Y / Y | Fixed to top=N; loading=1; nested unit=16437; default=None |
| 16455 / ShipmentDetailCategoriesSubAccordion | 16437 | Categories / CATEGORIES | 50 / 4500 | Y / Y | Fixed to top=N; loading=1; nested unit=16437; default=None |
| 16456 / ShipmentDetailUserDefinedSubAccordion | 16437 | User Defined / USERDEFINED | 50 / 4750 | Y / Y | Fixed to top=N; loading=0; nested unit=16437; default=None |

#### Group 16436: ShipmentDetailMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48274 / ShipmentDetailSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 48276 / ShipmentDetailSectionItem | Not populated / Not populated | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 48275 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 16438: ShipmentDetailItemInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48277 / ShipmentDetailItemInfoSectionItemValue | Item / ITEM | 10 / 100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 48278 / ShipmentDetailItemInfoSectionCompanyValue | Company / COMPANY | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 48279 / ItemInfoWebImage | Not populated / Not populated | 170 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 48280 / ShipmentDetailItemInfoSectionDescrptionValue | Description / ITEMDESCRIPTION | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 48281 / ShipmentDetailItemInfoSectionCINValue | Customer Item Number / CUSTOMERITEMNUM | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48282 / ShipmentDetailItemInfoSectionOIOValue | Original Item Ordered / ORIGINALITEMORDERED | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48283 / ShipmentDetailItemInfoSectionLicensePlateValue | License Plate / LOGISTICSUNIT | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48284 / ShipmentDetailItemInfoSectionPLPValue | Parent License Plate / PARENTLICENSEPLATE | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48285 / ShipmentDetailItemInfoSectionLotValue | Lot / LOT | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48286 / ShipmentDetailItemInfoSectionIAIValue | Inventory Attribute ID / locInvAttribID | 10 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48287 / ShipmentDetailItemInfoSectionLotControlledValue | Lot Controlled / LOTCONTROLLED | 130 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16439: ShipmentDetailQuantityInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48288 / ShipmentDetailQuantityInfoSectionRQValue1 | Requested Quantity / REQUESTQTY | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48289 / ShipmentDetailQuantityInfoSectionRQValue2 | UM / UM | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48290 / ShipmentDetailQuantityInfoSectionQuantityValue1 | Quantity / QUANTITY | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48291 / ShipmentDetailQuantityInfoSectionQuantityValue2 | UM / UM | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48292 / ShipmentDetailQuantityInfoSectionARQValue1 | Allocation Rejected Quantity / ALLOCATIONREJECTEDQUANTITY | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48293 / ShipmentDetailQuantityInfoSectionARQValue2 | UM / UM | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16440: ShipmentDetailItemDimensionsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48294 / ShipmentDetailItemDimensionsSectionLengthValue1 | Item Length / ITEMLENGTH | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48295 / ShipmentDetailItemDimensionsSectionLengthValue2 | UM / UNITOFMEASURE | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48296 / ShipmentDetailItemDimensionsSectionWidthValue1 | Item Width / ITEMWIDTH | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48297 / ShipmentDetailItemDimensionsSectionWidthValue2 | UM / UNITOFMEASURE | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48298 / ShipmentDetailItemDimensionsSectionHeightValue1 | Item Height / ITEMHEIGHT | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48299 / ShipmentDetailItemDimensionsSectionHeightValue2 | UM / UNITOFMEASURE | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48300 / ShipmentDetailItemDimensionsSectionVolumeValue1 | Item Volume / ITEMVOLUME | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48301 / ShipmentDetailItemDimensionsSectionVolumeValue2 | UM / UNITOFMEASURE | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48302 / ShipmentDetailItemDimensionsSectionTVValue1 | Total Volume / TOTALVOLUME | 90 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48303 / ShipmentDetailItemDimensionsSectionTVValue2 | UM / UNITOFMEASURE | 80 / 2500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48304 / ShipmentDetailItemDimensionsSectionWeightValue1 | Weight Per Piece / WEIGHTPERPIECE | 90 / 2750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48305 / ShipmentDetailItemDimensionsSectionWeightValue2 | UM / UNITOFMEASURE | 80 / 3000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48306 / ShipmentDetailItemDimensionsSectionTWValue1 | Total Weight / TOTALWEIGHT | 90 / 3250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48307 / ShipmentDetailItemDimensionsSectionTWValue2 | UM / UNITOFMEASURE | 80 / 3500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16441: ShipmentDetailItemCharacteristicsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48308 / ShipmentDetailItemCharacteristicsSectionNPValue | Item Net Price / ITEMNETPRICE | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48309 / ShipmentDetailItemCharacteristicsSectionLPValue | Item List Price / ITEMLISTPRICE | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48310 / ShipmentDetailICSectionStyleValue | Item Style / ITEMSTYLE | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48311 / ShipmentDetailICSectionColorValue | Item Color / ITEMCOLOR | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48312 / ShipmentDetailICSectionSizeValue | Item Size / ITEMSIZE | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48313 / ShipmentDetailICSectionClassValue | Item Class / ITEMCLASS | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48314 / ShipmentDetailICSectionDepartmentValue | Item dept. / ITEMDEPT | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48315 / ShipmentDetailICSectionAllocationRuleValue | Allocation Rule / ALLOCATIONRULE | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48316 / ShipmentDetailICSectionCatchWeightRequiredValue | Catch Weight Reqd / CATCHWEIGHTREQUIRED | 130 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48317 / ShipmentDetailICSectionSerialNumberRequiredValue | Serial Number Required / SERIALNUMBERREQUIRED | 130 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16442: ShipmentDetailDatesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48318 / ShipmentDetailDatesSectionInterfaceDateValue | Interface Date / INTERFACEDATE | 110 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48319 / ShipmentDetailDatesSectionOrderDateValue | Order Date / ORDERDATE | 110 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48320 / ShipmentDetailDatesSectionRDDValue | Requested Delivery Date / REQUESTED_DELIVERY_DATE | 110 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48321 / ShipmentDetailDatesSectionRDTValue | Requested Delivery Type / REQUESTED_DELIVERY_TYPE | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16443: ShipmentDetailStatusSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48322 / ShipmentDetailStatusSectionStatus1Value1 | Status 1 / STATUS1 | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48323 / ShipmentDetailStatusSectionStatus1Value2 | Quantity At Status 1 / QUANTITYATSTS1 | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48324 / ShipmentDetailStatusSectionStatus2Value1 | Status 2 / STATUS2 | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48325 / ShipmentDetailStatusSectionStatus2Value2 | Quantity At Status 2 / QUANTITYATSTS2 | 90 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48326 / ShipmentDetailStatusSectionStatus3Value1 | Status 3 / STATUS3 | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48327 / ShipmentDetailStatusSectionStatus3Value2 | Quantity At Status 3 / QUANTITYATSTS3 | 90 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48328 / ShipmentDetailStatusSectionStatus4Value1 | Status 4 / STATUS4 | 80 / 1750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48329 / ShipmentDetailStatusSectionStatus4Value2 | Quantity At Status 4 / QUANTITYATSTS4 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48330 / ShipmentDetailStatusSectionStatus5Value1 | Status 5 / STATUS5 | 80 / 2250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48331 / ShipmentDetailStatusSectionStatus5Value2 | Quantity At Status 5 / QUANTITYATSTS5 | 90 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48332 / ShipmentDetailStatusSectionStatus6Value1 | Status 6 / STATUS6 | 80 / 2750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48333 / ShipmentDetailStatusSectionStatus6Value2 | Quantity At Status 6 / QUANTITYATSTS6 | 90 / 3000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 48334 / ShipmentDetailStatusSectionStatus7Value1 | Status 7 / STATUS7 | 80 / 3250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48335 / ShipmentDetailStatusSectionStatus7Value2 | Quantity At Status 7 / QUANTITYATSTS7 | 90 / 3500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48336 / ShipmentDetailStatusSectionStatus8Value1 | Status 8 / STATUS8 | 80 / 3750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48337 / ShipmentDetailStatusSectionStatus8Value2 | Quantity At Status 8 / QUANTITYATSTS8 | 90 / 4000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48338 / ShipmentDetailStatusSectionStatus9Value1 | Status 9 / STATUS9 | 80 / 4250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48339 / ShipmentDetailStatusSectionStatus9Value2 | Quantity At Status 9 / QUANTITYATSTS9 | 90 / 4500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48340 / ShipmentDetailStatusSectionStatus10Value1 | Status 10 / STATUS10 | 80 / 4750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48341 / ShipmentDetailStatusSectionStatus10Value2 | Quantity At Status 10 / QUANTITYATSTS10 | 90 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16444: ShipmentDetailAdvancedAllocationSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48342 / ShipmentDetailAdvancedAllocationSectionAFLQValue | Allocate Full Location Quantity / ALLOCATEFULLLOCQTY | 130 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48343 / ShipmentDetailAdvancedAllocationSectionAPAValue | Allow Percent Allocation / ALLOWPCTALLOCATION | 130 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48344 / SDAdvancedAllocationSectionMinAPValue | Minimum Allocation Percentage / MINIMUMALLOCPCT | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48345 / SDAdvancedAllocationSectionMaxAPValue | Maximum Allocation Percentage / MAXIMUMALLOCPCT | 90 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16445: ShipmentDetailPackingSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48346 / ShipmentDetailPackingSectionPackingClassValue | Packing Class / PACKINGCLASS | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48347 / ShipmentDetailPackingSectionPackingCategoryValue | Packing Category / PACKINGCATEGORY | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48348 / ShipmentDetailPackingSectionFullCQValue1 | Full Container Quantity / FULLCONTAINERQUANTITY | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48349 / ShipmentDetailPackingSectionFullCQValue2 | Full Container Quantity UM / FULLCONTAINERQUANTITYUM | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48350 / ShipmentDetailPackingSectionTASValue | Treat As Loose / TREATASLOOSE | 130 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16446: ShipmentDetailBillOfMaterialsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48351 / ShipmentDetailBillOfMaterialsSectionIWOLNValue | Internal Work Order Number / INTERNALWORKORDERNUMBER | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48352 / ShipmentDetailBillOfMaterialsSectionBOMAValue | Shipment BOM Action / SHIPMENTBOMACTION | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48353 / ShipmentDetailBillOfMaterialsSectionPWNValue | Previous Wave / PREVWAVENUM | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48354 / ShipmentDetailBillOfMaterialsSectionRLNValue | Related Line Number / RELATEDINTERNALLINENUM | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48355 / ShipmentDetailBillOfMaterialsSectionQNPIValue | Quantity Needed Per Item / QTYNEEDEDPERITEM | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16447: ShipmentDetailPickingSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48356 / ShipmentDetailPickingSectionPickLocationValue | Pick Location / PICKLOC | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 48357 / ShipmentDetailPickingSectionPickZoneValue | Pick Zone / PICKZONE | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48358 / SDPickingSectionSecondaryPickLocationValue | Secondary Pick Location / SECONDARYPICKLOC | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 48359 / SDPickingSectionSecondaryPickZoneValue | Secondary Pick Zone / SECONDARYPICKZONE | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48360 / SDPickingSectionStatusFlowNameValue | Status Flow Name / STATUSFLOWNAME | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16448: ShipmentDetailImmediateNeedsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48361 / ShipmentDetailImmediateNeedsSectionEligibleValue | Eligible / ELIGIBLE | 130 / 250 | Y / Y | DATA_SOURCE_TYPE=30; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48362 / ShipmentDetailImmediateNeedsSectionLRValue | Locating Rule / LOCATINGRULE | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48363 / ShipmentDetailImmediateNeedsSectionNoteValue | Note / NOTE | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16450: ShipmentDetailCommentsSectionSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48365 / ShipmentDetailCommentsGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 48365 `ShipmentDetailCommentsGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16846 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16847 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16848 / CommentType | COMMENT_TYPE / Comment Type / COMMENTTYPE | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=60 |
| 16849 / Text | Text / Comments / TEXT | 10 / 10 / 20 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16850 / RecordType | Record_Type / Record Type / RECORDTYPE | 10 / 10 / 30 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16851 / InternalCommentId | Internal_Comment_Id / Internal Comment ID / INTERNALCOMMENTID | 20 / 10 / 40 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16852 / InternalNum | Internal_Num / Internal Number / INTERNALNUM | 20 / 10 / 50 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16853 / InternalLineNum | Internal_Line_Num / Internal Line Number / INTERNALLINENUM | 20 / 10 / 60 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16854 / UserDef1 | USER_DEF1 / User Defined Field 1 / UD_SHIPCOMMENT_01 | 10 / 10 / 70 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16855 / UserDef2 | USER_DEF2 / User Defined Field 2 / UD_SHIPCOMMENT_02 | 10 / 10 / 80 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16856 / UserDef3 | USER_DEF3 / User Defined Field 3 / UD_SHIPCOMMENT_03 | 10 / 10 / 90 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16857 / UserDef4 | USER_DEF4 / User Defined Field 4 / UD_SHIPCOMMENT_04 | 10 / 10 / 100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16858 / UserDef5 | USER_DEF5 / User Defined Field 5 / UD_SHIPCOMMENT_05 | 10 / 10 / 110 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16859 / UserDef6 | USER_DEF6 / User Defined Field 6 / UD_SHIPCOMMENT_06 | 10 / 10 / 120 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16860 / UserDef7 | USER_DEF7 / User Defined Field 7 / UD_SHIPCOMMENT_07 | 20 / 10 / 130 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16861 / UserDef8 | USER_DEF8 / User Defined Field 8 / UD_SHIPCOMMENT_08 | 20 / 10 / 140 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 16449: ShipmentDetailVasActivitiesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48364 / ShipmentDetailVASActivitySectionGrid | VAS Activities / VASACTIVITIESTAB | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 48364 `ShipmentDetailVASActivitySectionGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16830 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16831 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16832 / Confirmed | Confirmed / Confirmed / VASCONFIRMED | 40 / 10 / 7 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16833 / VasActivityId | VAS_ACTIVITY_ID / Not populated / VasActivity | 10 / 10 / 8 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=60 |
| 16834 / Instructions | INSTRUCTIONS / Instructions / INSTRUCTIONS | 10 / 10 / 9 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16835 / ApplicationLevel | Not populated / Application Level / APPLICATIONLEVEL | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16837 / ObjectId | OBJECT_ID / Object ID / OBJECTID | 20 / 10 / 11 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16836 / InternalShipmentLineNum | INTERNAL_SHIPMENT_LINE_NUM / Internal Shipment Line Number / INTERNALSHIPMENTLINENUM | 20 / 10 / 12 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16838 / UserDef1 | USER_DEF1 / User Defined Field 1 / UD_VASACTIVITY1 | 10 / 10 / 13 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16839 / UserDef2 | USER_DEF2 / User Defined Field 2 / UD_VASACTIVITY2 | 10 / 10 / 14 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16840 / UserDef3 | USER_DEF3 / User Defined Field 3 / UD_VASACTIVITY3 | 10 / 10 / 15 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16841 / UserDef4 | USER_DEF4 / User Defined Field 4 / UD_VASACTIVITY4 | 10 / 10 / 16 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16842 / UserDef5 | USER_DEF5 / User Defined Field 5 / UD_VASACTIVITY5 | 10 / 10 / 17 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16843 / UserDef6 | USER_DEF6 / User Defined Field 6 / UD_VASACTIVITY6 | 10 / 10 / 18 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16844 / UserDef7 | USER_DEF7 / User Defined Field 7 / UD_VASACTIVITY7 | 20 / 10 / 19 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16845 / UserDef8 | USER_DEF8 / User Defined Field 8 / UD_VASACTIVITY8 | 20 / 10 / 20 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 16451: ShipmentDetailReferenceInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48366 / ShipmentDetailReferenceInfoSectionShipIdValue | Shipment ID / SHIPMENTNUM | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48367 / ShipmentDetailReferenceInfoSectionStoreDistValue | Store Distribution / STOREDISTRIBUTION | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48368 / ShipmentDetailReferenceInfoSectionISNValue | Internal Shipment Number / INTERNAL_SHIPMENT_NUM | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48369 / ShipmentDetailReferenceInfoSectionISLNValue | Internal Shipment Line Number / INTERNAL_SHIPMENT_LINE_NUM | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48370 / ShipmentDetailReferenceInfoSectionOrderNumValue | Order Number / ORDERNUMBER | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48371 / ShipmentDetailReferenceInfoSectionOrderLNumValue | Order Line Number / ORDER_LINE_NUM | 90 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48372 / ShipmentDetailReferenceInfoSectionOrderTypeValue | Order Type / ORDERTYPE | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48373 / ShipmentDetailReferenceInfoSectionWaveNumValue | Wave Number / LAUNCHNUMBER | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48374 / ShipmentDetailReferenceInfoSectionPriorityValue | Priority / PRIORITY | 90 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48375 / ShipmentDetailReferenceInfoSectionCustPOValue | Customer PO / CUSTOMERPONUM | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48376 / ShipmentDetailReferenceInfoSectionINumValue | Invoice Number / INVOICENUM | 10 / 2750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48377 / ShipmentDetailReferenceInfoSectionPLIValue | Pick List ID / PICKLISTID | 10 / 3000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48378 / ShipmentDetailReferenceInfoSectionWarehouseValue | Warehouse / WAREHOUSE | 80 / 3250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48379 / ShipmentDetailReferenceInfoSectionMEValue | Manually Entered / MANUALLYENTERED | 130 / 3500 | Y / Y | DATA_SOURCE_TYPE=30; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48380 / ShipmentDetailReferenceInfoSectionUserStampValue | User Stamp / USERSTAMP | 10 / 3750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48381 / ShipmentDetailReferenceInfoSectionPStampValue | Process Stamp / PROCESSSTAMP | 10 / 4000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48382 / ShipmentDetailReferenceInfoSectionDTStampValue | Date Time Stamp / DATETIMESTAMP | 120 / 4250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16452: ShipmentDetailClassificationSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48383 / ShipmentDetailClassificationSectionNMFCCodeValue | Nmfc Code / NMFCCODE | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48384 / ShipmentDetailClassificationSectionHCodeValue | Hazardous Code / HAZARDOUSCODE | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48385 / ShipmentDetailClassificationSectionCNumValue | Catalog Number / CATALOGNUM | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48386 / ShipmentDetailClassificationSectionMNumValue | Manufacture Number / MANUFACTURENUM | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48387 / ShipmentDetailClassificationSectionMCodeValue | Merchandise Code / MERCHANDISECODE | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16453: ShipmentDetailMarkForSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48388 / ShipmentDetailMarkForSectionMarkForIdValue | Mark for ID / MARKFORID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 48389 / ShipmentDetailMarkForSectionNameValue | Name / NAME | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48390 / ShipmentDetailMarkForSectionATValue | Attention To / ATTENTIONTO | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48391 / ShipmentDetailMarkForSectionAddress1Value | Address / ADDRESS | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48392 / ShipmentDetailMarkForSectionPhoneNumValue | Phone Number / PHONENUM | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48393 / ShipmentDetailMarkForSectionAddress2Value | Address 2 (Optional) / ADDRESS2 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48394 / ShipmentDetailMarkForSectionFaxNumValue | Fax Number / FAXNUM | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48395 / ShipmentDetailMarkForSectionAddress3Value | Address 3 (Optional) / ADDRESS3 | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48396 / ShipmentDetailMarkForSectionEmailAddrValue | Email Address / EMAILADDRESS | 10 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48397 / ShipmentDetailMarkForSectionCityValue | City / CITY | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48398 / ShipmentDetailMarkForSectionStateValue | State / STATE | 80 / 2750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48399 / ShipmentDetailMarkForSectionZipValue | Postal Code / POSTALCODE | 10 / 3000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48400 / ShipmentDetailMarkForSectionCountryValue | Country / COUNTRY | 80 / 3250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16454: ShipmentDetailInternationalSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48401 / ShipmentDetailInternationalSectionPCValue | Preference Criterion / PREFERENCECRITERION | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48402 / ShipmentDetailInternationalSectionCOOValue | Country of Origin / COUNTRYOFORIGIN | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48403 / ShipmentDetailInternationalSectionHCValue | Harmonized Code / HARMONIZEDCODE | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48404 / ShipmentDetailInternationalSectionNetCostValue | Net Cost / NETCOST | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48405 / ShipmentDetailInternationalSectionHDLabel | Harmonized Description / HARMONIZEDDESCRIPTION | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48406 / ShipmentDetailInternationalSectionEDValue | Export Description / EXPORTDESCRIPTION | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48407 / ShipmentDetailInternationalSectionProducerValue | Producer / PRODUCER | 130 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48408 / ShipmentDetailInternationalSectionECCNLabel | ECCN / ECCN | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48409 / ShipmentDetailInternationalSectionValidateLicenseLabel | Validated License / VALIDATEDLICENSE | 10 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48410 / ShipmentDetailInternationalSectionLicenseExpDateValue | License Expiration Date / LICENSEEXPDATE | 110 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16455: ShipmentDetailCategoriesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48411 / ShipmentDetailCategoriesSectionCategory1Value | ISM EOL / ITEMCATEGORY1 | 270 / 250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48412 / ShipmentDetailCategoriesSectionCategory2Value | ISM ACCOUNTABLE / ITEMCATEGORY2 | 270 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48413 / ShipmentDetailCategoriesSectionCategory3Value | ISM UI / ITEMCATEGORY3 | 270 / 750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48414 / ShipmentDetailCategoriesSectionCategory4Value | Item Category 4 / ITEMCATEGORY4 | 270 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48415 / ShipmentDetailCategoriesSectionCategory5Value | Item Category 5 / ITEMCATEGORY5 | 270 / 1250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48416 / ShipmentDetailCategoriesSectionCategory6Value | Item Category 6 / ITEMCATEGORY6 | 270 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48417 / ShipmentDetailCategoriesSectionCategory7Value | Item Category 7 / ITEMCATEGORY7 | 270 / 1750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48418 / ShipmentDetailCategoriesSectionCategory8Value | Item Category 8 / ITEMCATEGORY8 | 270 / 2000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48419 / ShipmentDetailCategoriesSectionCategory9Value | Item Category 9 / ITEMCATEGORY9 | 270 / 2250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48420 / ShipmentDetailCategoriesSectionCategory10Value | Item Category 10 / ITEMCATEGORY10 | 270 / 2500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16456: ShipmentDetailUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48421 / ShipmentDetailUserDefinedSectionUserDefined1Value | Condition Code to Allocate / UDSHD1 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48422 / ShipmentDetailUserDefinedSectionUserDefined2Value | User Defined Field 2 / UDSHD2 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48423 / ShipmentDetailUserDefinedSectionUserDefined3Value | User Defined Field 3 / UDSHD3 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48424 / ShipmentDetailUserDefinedSectionUserDefined4Value | User Defined Field 4 / UDSHD4 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48425 / ShipmentDetailUserDefinedSectionUserDefined5Value | User Defined Field 5 / UDSHD5 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48426 / ShipmentDetailUserDefinedSectionUserDefined6Value | User Defined Field 6 / UDSHD6 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48427 / ShipmentDetailUserDefinedSectionUserDefined7Value | User Defined Field 7 / UDSHD7 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48428 / ShipmentDetailUserDefinedSectionUserDefined8Value | User Defined Field 8 / UDSHD8 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 68 control attributes, 29 events, and 13 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 37696 | 48274 / ShipmentDetailSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37697 | 48274 / ShipmentDetailSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37698 | 48277 / ShipmentDetailItemInfoSectionItemValue | toUpper | Y / Y / Y | 8 / 0 |
| 37699 | 48277 / ShipmentDetailItemInfoSectionItemValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37700 | 48277 / ShipmentDetailItemInfoSectionItemValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37701 | 48277 / ShipmentDetailItemInfoSectionItemValue | Lookup | Y / Y / N | 196 / 0 |
| 37702 | 48283 / ShipmentDetailItemInfoSectionLicensePlateValue | toUpper | Y / Y / Y | 8 / 0 |
| 37703 | 48284 / ShipmentDetailItemInfoSectionPLPValue | toUpper | Y / Y / Y | 8 / 0 |
| 37704 | 48285 / ShipmentDetailItemInfoSectionLotValue | toUpper | Y / Y / Y | 8 / 0 |
| 37705 | 48287 / ShipmentDetailItemInfoSectionLotControlledValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37706 | 48287 / ShipmentDetailItemInfoSectionLotControlledValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37707 | 48300 / ShipmentDetailItemDimensionsSectionVolumeValue1 | maxLength | Y / Y / Y | 4 / 0 |
| 37708 | 48300 / ShipmentDetailItemDimensionsSectionVolumeValue1 | maxValue | Y / Y / Y | 26 / 0 |
| 37709 | 48302 / ShipmentDetailItemDimensionsSectionTVValue1 | maxLength | Y / Y / Y | 4 / 0 |
| 37710 | 48302 / ShipmentDetailItemDimensionsSectionTVValue1 | maxValue | Y / Y / Y | 26 / 0 |
| 37711 | 48306 / ShipmentDetailItemDimensionsSectionTWValue1 | maxLength | Y / Y / Y | 4 / 0 |
| 37712 | 48306 / ShipmentDetailItemDimensionsSectionTWValue1 | maxValue | Y / Y / Y | 26 / 0 |
| 37713 | 48316 / ShipmentDetailICSectionCatchWeightRequiredValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37714 | 48316 / ShipmentDetailICSectionCatchWeightRequiredValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37715 | 48317 / ShipmentDetailICSectionSerialNumberRequiredValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37716 | 48317 / ShipmentDetailICSectionSerialNumberRequiredValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37717 | 48318 / ShipmentDetailDatesSectionInterfaceDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 37718 | 48319 / ShipmentDetailDatesSectionOrderDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 37719 | 48320 / ShipmentDetailDatesSectionRDDValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 37720 | 48342 / ShipmentDetailAdvancedAllocationSectionAFLQValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37721 | 48342 / ShipmentDetailAdvancedAllocationSectionAFLQValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37722 | 48343 / ShipmentDetailAdvancedAllocationSectionAPAValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37723 | 48343 / ShipmentDetailAdvancedAllocationSectionAPAValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37724 | 48350 / ShipmentDetailPackingSectionTASValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37725 | 48350 / ShipmentDetailPackingSectionTASValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37726 | 48356 / ShipmentDetailPickingSectionPickLocationValue | toUpper | Y / Y / Y | 8 / 0 |
| 37727 | 48356 / ShipmentDetailPickingSectionPickLocationValue | Lookup | Y / Y / N | 126 / 0 |
| 37728 | 48358 / SDPickingSectionSecondaryPickLocationValue | toUpper | Y / Y / Y | 8 / 0 |
| 37729 | 48358 / SDPickingSectionSecondaryPickLocationValue | Lookup | Y / Y / N | 120 / 0 |
| 37730 | 48361 / ShipmentDetailImmediateNeedsSectionEligibleValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37731 | 48361 / ShipmentDetailImmediateNeedsSectionEligibleValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37732 | 48364 / ShipmentDetailVASActivitySectionGrid | data-readonlyColumn | Y / Y / Y | 18 / 0 |
| 37733 | 48364 / ShipmentDetailVASActivitySectionGrid | data-securityCheckpoint | Y / Y / Y | 4 / 0 |
| 37734 | 48364 / ShipmentDetailVASActivitySectionGrid | data-formId | Y / Y / Y | 8 / 0 |
| 37735 | 48364 / ShipmentDetailVASActivitySectionGrid | data-restFormId | Y / Y / Y | 8 / 0 |
| 37736 | 48364 / ShipmentDetailVASActivitySectionGrid | data-modelClass | Y / Y / N | 100 / 0 |
| 37737 | 48364 / ShipmentDetailVASActivitySectionGrid | data-dbtable | Y / Y / N | 76 / 0 |
| 37738 | 48364 / ShipmentDetailVASActivitySectionGrid | data-headerkey | Y / Y / N | 52 / 0 |
| 37739 | 48364 / ShipmentDetailVASActivitySectionGrid | data-duplicateRowMsg | Y / Y / Y | 24 / 0 |
| 37740 | 48364 / ShipmentDetailVASActivitySectionGrid | data-restupdate | Y / Y / Y | 98 / 0 |
| 37741 | 48364 / ShipmentDetailVASActivitySectionGrid | data-restcreate | Y / Y / Y | 98 / 0 |
| 37742 | 48364 / ShipmentDetailVASActivitySectionGrid | data-restdelete | Y / Y / Y | 98 / 0 |
| 37743 | 48364 / ShipmentDetailVASActivitySectionGrid | data-restrictionsProcessor | Y / Y / Y | 92 / 0 |
| 37744 | 48364 / ShipmentDetailVASActivitySectionGrid | data-defaultsProcessor | Y / Y / Y | 82 / 0 |
| 37745 | 48364 / ShipmentDetailVASActivitySectionGrid | data-copyData | Y / Y / Y | 2 / 0 |
| 37746 | 48364 / ShipmentDetailVASActivitySectionGrid | pageSize | Y / Y / Y | 4 / 0 |
| 37747 | 48365 / ShipmentDetailCommentsGrid | data-formId | Y / Y / Y | 8 / 0 |
| 37748 | 48365 / ShipmentDetailCommentsGrid | data-modelClass | Y / Y / N | 94 / 0 |
| 37749 | 48365 / ShipmentDetailCommentsGrid | data-dbtable | Y / Y / N | 24 / 0 |
| 37750 | 48365 / ShipmentDetailCommentsGrid | data-restFormId | Y / Y / Y | 8 / 0 |
| 37751 | 48365 / ShipmentDetailCommentsGrid | data-headerkey | Y / Y / N | 34 / 0 |
| 37752 | 48365 / ShipmentDetailCommentsGrid | data-restupdate | Y / Y / Y | 100 / 0 |
| 37753 | 48365 / ShipmentDetailCommentsGrid | data-restcreate | Y / Y / Y | 100 / 0 |
| 37754 | 48365 / ShipmentDetailCommentsGrid | data-restdelete | Y / Y / Y | 104 / 0 |
| 37755 | 48365 / ShipmentDetailCommentsGrid | data-restrictionsProcessor | Y / Y / Y | 88 / 0 |
| 37756 | 48365 / ShipmentDetailCommentsGrid | data-defaultsProcessor | Y / Y / Y | 80 / 0 |
| 37757 | 48365 / ShipmentDetailCommentsGrid | data-copyData | Y / Y / Y | 2 / 0 |
| 37758 | 48365 / ShipmentDetailCommentsGrid | pageSize | Y / Y / Y | 4 / 0 |
| 37759 | 48379 / ShipmentDetailReferenceInfoSectionMEValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37760 | 48379 / ShipmentDetailReferenceInfoSectionMEValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37761 | 48388 / ShipmentDetailMarkForSectionMarkForIdValue | Lookup | Y / Y / N | 116 / 0 |
| 37762 | 48407 / ShipmentDetailInternationalSectionProducerValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37763 | 48407 / ShipmentDetailInternationalSectionProducerValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16300 / click | 48274 / ShipmentDetailSave | _webUi.shipmentDetailDetails.save | Not populated | Y / Y |
| 16301 / click | 48275 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 16302 / igtexteditorvaluechanged | 48277 / ShipmentDetailItemInfoSectionItemValue | _webUi.shipmentDetailDetails.itemValueChanged | Not populated | Y / Y |
| 16303 / igcomboselectionchanged | 48278 / ShipmentDetailItemInfoSectionCompanyValue | _webUi.shipmentDetailDetails.itemValueChanged | Not populated | Y / Y |
| 16304 / ignumericeditorblur | 48288 / ShipmentDetailQuantityInfoSectionRQValue1 | _webUi.shipmentDetailDetails.requestedQtyChanged | Not populated | Y / Y |
| 16305 / igcomboselectionchanged | 48289 / ShipmentDetailQuantityInfoSectionRQValue2 | _webUi.shipmentDetailDetails.quantityUmSelectionChanged | Not populated | Y / Y |
| 16306 / blur | 48290 / ShipmentDetailQuantityInfoSectionQuantityValue1 | Not populated | Not populated | Y / Y |
| 16307 / blur | 48294 / ShipmentDetailItemDimensionsSectionLengthValue1 | _webUi.shipmentDetailDetails.itemDimensionsOnBlurEventHandler | Not populated | Y / Y |
| 16308 / blur | 48296 / ShipmentDetailItemDimensionsSectionWidthValue1 | _webUi.shipmentDetailDetails.itemDimensionsOnBlurEventHandler | Not populated | Y / Y |
| 16309 / blur | 48298 / ShipmentDetailItemDimensionsSectionHeightValue1 | _webUi.shipmentDetailDetails.itemDimensionsOnBlurEventHandler | Not populated | Y / Y |
| 16310 / blur | 48304 / ShipmentDetailItemDimensionsSectionWeightValue1 | _webUi.shipmentDetailDetails.weightChangeEventHandler | Not populated | Y / Y |
| 16311 / DOMContentLoaded | 48315 / ShipmentDetailICSectionAllocationRuleValue | _webUi.shipmentDetailDetails.itemCharacteristicsLoaded | Not populated | Y / Y |
| 16312 / igdatepickervaluechanged | 48318 / ShipmentDetailDatesSectionInterfaceDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16313 / igdatepickervaluechanged | 48319 / ShipmentDetailDatesSectionOrderDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16314 / change | 48343 / ShipmentDetailAdvancedAllocationSectionAPAValue | _webUi.shipmentDetailDetails.validatePercent | Not populated | Y / Y |
| 16315 / change | 48361 / ShipmentDetailImmediateNeedsSectionEligibleValue | _webUi.shipmentDetailDetails.immediateNeedsEligibleEventHandler | Not populated | Y / Y |
| 16316 / iggridupdatingrowdeleted | 48364 / ShipmentDetailVASActivitySectionGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16317 / iggridupdatingrowadded | 48364 / ShipmentDetailVASActivitySectionGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16318 / iggridupdatingeditrowended | 48364 / ShipmentDetailVASActivitySectionGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16319 / igcomboselectionchanged | 48364 / ShipmentDetailVASActivitySectionGrid | _webUi.shipmentDetailDetails.vasActivityChanged | VasActivityId | Y / Y |
| 16320 / iggridupdatingeditrowending | 48364 / ShipmentDetailVASActivitySectionGrid | _webUi.shipmentDetailDetails.gridVasActivityEditRowEnding | Not populated | Y / Y |
| 16321 / iggridupdatingrowadded | 48365 / ShipmentDetailCommentsGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16322 / iggridupdatingrowdeleted | 48365 / ShipmentDetailCommentsGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16323 / iggridupdatingeditrowended | 48365 / ShipmentDetailCommentsGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16324 / igtexteditorvaluechanged | 48388 / ShipmentDetailMarkForSectionMarkForIdValue | _webUi.shipmentDetailDetails.markForChanged | Not populated | Y / Y |
| 16325 / igcomboselectionchanged | 48403 / ShipmentDetailInternationalSectionHCValue | _webUi.shipmentDetailDetails.harmonyComboHandler | Not populated | Y / Y |
| 16326 / DOMContentLoaded | 48403 / ShipmentDetailInternationalSectionHCValue | _webUi.shipmentDetailDetails.harmonyComboHandler | Not populated | Y / Y |
| 16327 / igdatepickervaluechanged | 48410 / ShipmentDetailInternationalSectionLicenseExpDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16328 / DOMContentLoaded | 48420 / ShipmentDetailCategoriesSectionCategory10Value | _webUi.shipmentDetailDetails.updateCategoriesFields | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 23122 / 16300 | PUTServiceURL | Y / Y | 76 |
| 23123 / 16300 | queryParameter_IdField | Y / Y | 46 |
| 23124 / 16300 | POSTServiceURL | Y / Y | 84 |
| 23125 / 16300 | URL | Y / Y | 136 |
| 23126 / 16311 | none | Y / Y | 8 |
| 23127 / 16316 | CommitSelector | Y / Y | 34 |
| 23128 / 16317 | CommitSelector | Y / Y | 34 |
| 23129 / 16318 | CommitSelector | Y / Y | 34 |
| 23130 / 16321 | CommitSelector | Y / Y | 34 |
| 23131 / 16322 | CommitSelector | Y / Y | 34 |
| 23132 / 16323 | CommitSelector | Y / Y | 34 |
| 23133 / 16326 | none | Y / Y | 8 |
| 23134 / 16328 | none | Y / Y | 8 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 15 selected candidate rows for this Screen: **15 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 37696 | 48274 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37697 | 48274 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37733 | 48364 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37734 | 48364 / Not applicable | data-formId | form_id | 3017 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37737 | 48364 / Not applicable | data-dbtable | database_identifier | Shipment_Detail_VAS_Activity_Grid_View | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37740 | 48364 / Not applicable | data-restupdate | relative_api_path | /outbound/scaleapi/ShipmentDetailsVasActivityApi/ | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37741 | 48364 / Not applicable | data-restcreate | relative_api_path | /outbound/scaleapi/ShipmentDetailsVasActivityApi/ | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37742 | 48364 / Not applicable | data-restdelete | relative_api_path | /outbound/scaleapi/ShipmentDetailsVasActivityApi/ | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37747 | 48365 / Not applicable | data-formId | form_id | 3017 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37749 | 48365 / Not applicable | data-dbtable | database_identifier | COMMENT_TEXT | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37752 | 48365 / Not applicable | data-restupdate | relative_api_path | /outbound/scaleapi/ShipmentDetailsCommentsApi/save | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37753 | 48365 / Not applicable | data-restcreate | relative_api_path | /outbound/scaleapi/ShipmentDetailsCommentsApi/save | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37754 | 48365 / Not applicable | data-restdelete | relative_api_path | /outbound/scaleapi/ShipmentDetailsCommentsApi/delete | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23122 | 48274 / 16300 | PUTServiceURL | relative_api_path | /outbound/scaleapi/ShipmentDetailsApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23124 | 48274 / 16300 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShipmentDetailsApi/save | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
