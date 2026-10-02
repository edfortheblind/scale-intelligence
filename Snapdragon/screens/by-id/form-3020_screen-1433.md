# Shipping Container — Form 3020, Screen 1433

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3020 |
| MAIN_UI_SCREEN Object ID | 1433 |
| Label / Form resource key | Shipping Container / MNU_SHIPPINGCONTAINERDETAILS |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | record_detail_template / 6 |
| Configured path | /scale/details/shippingcontainer |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/shippingcontainer |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3020 |
| Inspection requirement | record_context_required |
| Form configuration table/view | ShippingContainer |
| Help page reference | shipmentProcess.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3020 |
| Inspection time (UTC) | 2026-10-02T15:24:59.305Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_SHIPPINGCONTAINERDETAILS |
| Observed configured table/view | ShippingContainer |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1433 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Shipping Container is recorded as `record_detail_template`. Its saved configuration contains 1 parts, 16 groups, 84 controls, and 32 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3193 / CrudDataPane | Not populated / Not populated | 10 / 50 | Y / Y / N | ShippingContainerActionSave |

### Part 3193: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 13466 / ShippingContainerMenuPanel | 13465 | Not populated / Not populated | 60 / 50 | Y / Y | Fixed to top=Y; loading=0; nested unit=13465; default=None |
| 13465 / ShippingContainerMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13465; default=None |
| 13467 / ShippingContainerMainAccordion | Not populated | Not populated / Not populated | 140 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=13467; default=None |
| 13468 / ShippingContainerContainerContentsSubAccordion | 13467 | Container Contents / CONTAINERCONTENTS | 50 / 2000 | Y / Y | Fixed to top=N; loading=2; nested unit=13467; default=None |
| 13469 / ShippingContainerContainerInfoSubAccordion | 13467 | Not populated / CONTAINERINFO | 50 / 3000 | Y / Y | Fixed to top=N; loading=1; nested unit=13467; default=None |
| 13470 / ShippingContainerContainerStatusSubAccordion | 13467 | Status / STATUS | 50 / 3500 | Y / Y | Fixed to top=N; loading=1; nested unit=13467; default=None |
| 13471 / ShippingContainerContainerCarrierSubAccordion | 13467 | Carrier / CARRIER | 50 / 4000 | Y / Y | Fixed to top=N; loading=1; nested unit=13467; default=None |
| 13472 / ShippingContainerContainerReturnsSubAccordion | 13467 | Returns / RETURNS | 50 / 5000 | Y / Y | Fixed to top=N; loading=1; nested unit=13467; default=None |
| 13473 / ShippingContainerContainerParentContainerInfoSubAc | 13467 | Parent Container Info / PARENTCONTAINERINFO | 50 / 6000 | Y / Y | Fixed to top=N; loading=1; nested unit=13467; default=None |
| 13474 / ShippingContainerContainerCatchSubAccordion | 13467 | Catch Weight / CATCHWEIGHT | 50 / 7000 | Y / Y | Fixed to top=N; loading=1; nested unit=13467; default=None |
| 13475 / ShippingContainerContainerLotSubAccordion | 13467 | Lot / LOT | 50 / 8000 | Y / Y | Fixed to top=N; loading=1; nested unit=13467; default=None |
| 13476 / ShippingContainerContainerSerialNumberSubAccordion | 13467 | Serial Number / SERIALNUMBER | 50 / 9000 | Y / Y | Fixed to top=N; loading=1; nested unit=13467; default=None |
| 13477 / ShippingContainerContainerVASSubAccordion | 13467 | VAS Activities / VASACTIVITIES | 50 / 10000 | Y / Y | Fixed to top=N; loading=1; nested unit=13467; default=None |
| 13478 / ShippingContainerContainerQualitySubAccordion | 13467 | Quality Control / QUALITYCONTROL | 50 / 10100 | Y / Y | Fixed to top=N; loading=1; nested unit=13467; default=None |
| 13479 / ShippingContainerContainerReferenceInfoSubAccordio | 13467 | Reference Info / REFERENCEINFO | 50 / 10200 | Y / Y | Fixed to top=N; loading=1; nested unit=13467; default=None |
| 13480 / ShippingContainerContainerUserDefSubAccordion | 13467 | User Defined / USERDEFINED | 50 / 10300 | Y / Y | Fixed to top=N; loading=1; nested unit=13467; default=None |

#### Group 13466: ShippingContainerMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39487 / ShippingContainerActionSave | Save / BTN_SAVE | 150 / 50 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 39489 / ShippingContainerHeaderContainerIdValue | Not populated / Not populated | 260 / 50 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 39488 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 13468: ShippingContainerContainerContentsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39490 / ContainerContentsItemValue | Item / ITEM | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 39491 / ContainerContentsCompanyValue | Company / COMPANY | 80 / 400 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 39492 / ItemInfoWebImage | Not populated / Not populated | 170 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 39493 / ItemInfoItemDescriptionValue | Description / ITEMDESCRIPTION | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 39494 / ContainerContentsLotValue | Lot / LOT | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39495 / ContainerContentsValueValue | Value / VALUE | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39497 / ContainerContentsQuantityUmValue | UM / UM | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39496 / ContainerContentsQuantityValue | Quantity / QUANTITY | 90 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39498 / ContainerContentsWeightValue | Weight / WEIGHT | 90 / 1650 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39499 / ContainerContentsWeightUmValue | UM / UM | 80 / 1700 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39500 / ContainerInfoVolumeValue | Volume / VOLUME | 90 / 2100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39501 / ContainerInfoVolumeUmValue | UM / UM | 80 / 2150 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13469: ShippingContainerContainerInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39502 / ContainerInfoContainerIdValue | Container ID / CONTAINERID | 10 / 2350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39503 / ContainerInfoContainerTypeValue | Container Type / CONTAINERTYPE | 80 / 2550 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39504 / ContainerInfoContainerClassValue | Container Class / CONTAINERCLASS | 80 / 2750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39507 / ContainerInfoLicensePlateValue | License Plate / LICENSEPLATE | 10 / 2800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39505 / ContainerInfoContainerCountNumberValue | Container Count / CONTAINERCOUNT | 90 / 3450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39506 / ContainerInfoContainerCountTotalValue | Total Containers / TOTALCONTAINERS | 90 / 3550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39508 / ContainerInfoLocationValue | Location / LOCATION | 10 / 3950 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39509 / ContainerInfoOriginalPickLocationValue | Original Pick Location / ORIGINALPICKLOCATION | 10 / 4150 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39510 / ContainerInfoLengthValue | Length / LENGTH | 90 / 4550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39511 / ContainerInfoLengthDimensionUmValue | UM / UM | 80 / 4600 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39512 / ContainerContentsWidthValue | Width / WIDTH | 90 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39513 / ContainerContentsWidthDimensionUmValue | UM / UM | 80 / 5050 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39514 / ContainerContentsHeightValue | Height / HEIGHT | 90 / 5450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39515 / ContainerContentsHeightDimensionUmValue | UM / UM | 80 / 5500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13470: ShippingContainerContainerStatusSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39516 / StatusStatusFlowNameValue | Status Flow Name / STATUSFLOWNAME | 80 / 5700 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39517 / StatusStatusNameValue | Status Name / STATUSNAME | 80 / 5900 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39518 / StatusStatusFailedValue | Status Failed / STATUSFAILED | 130 / 6100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13471: ShippingContainerContainerCarrierSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39519 / CarrierManifestStateValue | Manifest State / MANIFESTSTATE | 10 / 6300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39520 / CarrierManifestDateTimeValue | Manifest Date Time / MANIFESTDATETIME | 120 / 6500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39521 / CarrierManifestForDateValue | Manifest for Date / MANIFESTFORDATE | 110 / 6700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39522 / CarrierPlannedDeliveryDateTimeValue | Planned Delivery Date Time / PLANNEDDELIVERYDATETIME | 120 / 6900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39523 / CarrierTrackingNumberValue | Tracking Number / TRACKINGNUMBER | 10 / 7100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39526 / CarrierAccessorialChargeValue | Accessorial Charge / ACCESSORIALCHARGE | 90 / 7200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39524 / CarrierTotalFreightChargeValue | Total Freight Charge / TOTALFREIGHTCHARGE | 90 / 7300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39525 / CarrierBaseFreightChargeValue | Base Freight Charge / BASEFREIGHTCHARGE | 90 / 7500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39527 / CarrierFreightDiscountValue | Freight Discount / FREIGHTDISCOUNT | 90 / 7900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39528 / CarrierHundredWeightValue | Hundred Weight / HUNDREDWEIGHT | 130 / 8100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39529 / CarrierMSNValue | Msn / MSN | 90 / 8300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39530 / CarrierBundleIdValue | Bundle ID / BUNDLEID | 90 / 8500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39531 / CarrierWorldEaseIdValue | World Ease ID / WORLDEASEID | 90 / 8700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39532 / CarrierWorldEaseStatusValue | World Ease Status / WORLDEASESTATUS | 10 / 8900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13472: ShippingContainerContainerReturnsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39533 / ReturnsTrackingnumberValue | Tracking Number / TRACKINGNUMBER | 10 / 9100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39536 / ReturnsAccessorialchargeValue | Accessorial Charge / ACCESSORIALCHARGE | 90 / 9200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39534 / ReturnsTotalfreightchargeValue | Total Freight Charge / TOTALFREIGHTCHARGE | 90 / 9300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39535 / ReturnsBasefreightchargeValue | Base Freight Charge / BASEFREIGHTCHARGE | 90 / 9500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39537 / ReturnsFreightDiscountValue | Freight Discount / FREIGHTDISCOUNT | 90 / 9900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39538 / ReturnsMSNValue | Msn / MSN | 90 / 10100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13473: ShippingContainerContainerParentContainerInfoSubAc — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39539 / ParentcontainerinfoParentcontaineridValue | Parent Container ID / PARENTCONTAINERID | 10 / 10300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39540 / ParentcontainerinfoParentlicenseplateValue | Parent License Plate / PARENTLICENSEPLATE | 10 / 10500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39541 / ParentcontainerinfoParentValue | Parent / PARENT | 90 / 10700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13474: ShippingContainerContainerCatchSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39542 / ShippingContainerCatchWeightGrid | Not populated / Not populated | 20 / 10750 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 39542 `ShippingContainerCatchWeightGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 13183 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13184 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13185 / Item | ITEM / Item / ITEM | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13186 / Lot | LOT / Lot / LOT | 10 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13187 / SerialNum | SERIAL_NUM / Serial Num / SERIAL_NUM | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13188 / CatchWeight | CATCH_WEIGHT / Catch Weight / CATCHWEIGHT | 20 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=60; DATA_SOURCE_TYPE=None |
| 13189 / WeightUm | WEIGHT_UM / Weight UM / WEIGHTUM | 10 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 13475: ShippingContainerContainerLotSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39543 / ShippingContainerLotInfoGrid | Not populated / Not populated | 20 / 10800 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 39543 `ShippingContainerLotInfoGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 13190 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13191 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13192 / Item | ITEM / Item / ITEM | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13193 / Lot | LOT / Lot / LOT | 10 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13194 / Quantity | QUANTITY / Quantity / QUANTITY | 20 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 13195 / UM | QUANTITY_UM / UM / UM | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13196 / Lot | Not populated / Not populated / Lot | 20 / 40 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13197 / InternalContainerNum | INTERNAL_CONTAINER_NUM / Internal Container Number / INTERNALCONTAINERNUM | 10 / 10 / 180 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 13476: ShippingContainerContainerSerialNumberSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39544 / ShippingContainerSerialNumbers | Not populated / Not populated | 140 / 10850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13477: ShippingContainerContainerVASSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39545 / ShippingContainerVasActivitiesGrid | Not populated / Not populated | 20 / 10900 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 39545 `ShippingContainerVasActivitiesGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 13198 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13199 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13200 / Confirmed | Confirmed / Confirmed / VASCONFIRMED | 40 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13201 / VasActivityId | VAS_ACTIVITY_ID / VAS Activity / VASACTIVITY | 10 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=60 |
| 13202 / Instructions | INSTRUCTIONS / Instructions / INSTRUCTIONS | 10 / 10 / 30 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13203 / ApplicationLevel | Not populated / Application Level / APPLICATIONLEVEL | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13204 / InternalContainerNum | INTERNAL_CONTAINER_NUM / Internal Container Number / INTERNALCONTAINERNUM | 20 / 10 / 45 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13205 / ObjectId | OBJECT_ID / Object ID / OBJECTID | 20 / 10 / 50 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13206 / Completed | Completed / Completed? / VASCOMPLETED | 10 / 10 / 60 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13207 / UserDef1 | USER_DEF1 / User Defined Field 1 / UD_VASACTIVITY1 | 10 / 10 / 70 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13208 / UserDef2 | USER_DEF2 / User Defined Field 2 / UD_VASACTIVITY2 | 10 / 10 / 80 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13209 / UserDef3 | USER_DEF3 / User Defined Field 3 / UD_VASACTIVITY3 | 10 / 10 / 90 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13210 / UserDef4 | USER_DEF4 / User Defined Field 4 / UD_VASACTIVITY4 | 10 / 10 / 100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13211 / UserDef5 | USER_DEF5 / User Defined Field 5 / UD_VASACTIVITY5 | 10 / 10 / 110 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13212 / UserDef6 | USER_DEF6 / User Defined Field 6 / UD_VASACTIVITY6 | 10 / 10 / 120 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13213 / UserDef7 | USER_DEF7 / User Defined Field 7 / UD_VASACTIVITY7 | 20 / 10 / 130 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13214 / UserDef8 | USER_DEF8 / User Defined Field 8 / UD_VASACTIVITY8 | 20 / 10 / 140 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 13478: ShippingContainerContainerQualitySubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39546 / QualityControlQCconditionValue | QC Condition / QCCONDITION | 10 / 11100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39547 / QualityControlAssignmentreasonValue | Assignment Reason / ASSIGNMENTREASON | 10 / 11300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13479: ShippingContainerContainerReferenceInfoSubAccordio — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39548 / ReferenceinfoInternalcontainernumberValue | Internal Container Number / INTERNALCONTAINERNUM | 90 / 11500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39549 / ReferenceinfoInternalmopnumberValue | Internal Mop Number / INTERNALMOPNUMBER | 90 / 11700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39550 / ReferenceinfoInternalordernumberValue | Internal Order Number / INTERNALORDERNUM | 90 / 11900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39551 / ReferenceinfoInternalshipmentnumberValue | Internal Shipment Number / INTERNALSHIPMENTNUM | 90 / 12100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39552 / ReferenceinfoInternalshipmentallocreqnumberValue | Internal Shipment Allocation Request Number / INTERNALSHIPALLOCREQNUM | 90 / 12300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39553 / ReferenceinfoInternalshipmentlinenumberValue | Internal Shipment Line Number / INTERNALSHIPMENTLINENUM | 90 / 12500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39554 / ReferenceinfowavenumberValue | Wave Number / WAVENUMBER | 90 / 12700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39555 / ReferenceinfogroupnumberValue | Group Number / GROUPNUMBER | 90 / 12900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39556 / ReferenceinfogrouppositionValue | Group Position / GROUPPOSITION | 90 / 13100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39557 / ReferenceinfoNMFCcodeValue | Nmfc Code / NMFCCODE | 80 / 13300 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39558 / ReferenceinfohazardouscodeValue | Hazardous Code / HAZARDOUSCODE | 10 / 13500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39559 / ReferenceinfoWarehouseValue | Warehouse / WAREHOUSE | 80 / 13700 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39560 / ReferenceinfouserstampValue | User Stamp / USERSTAMP | 10 / 13900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39561 / ReferenceinfoprocessstampValue | Process Stamp / PROCESSSTAMP | 10 / 14100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39562 / ReferenceinfoDatetimestampValue | Date Time Stamp / DATETIMESTAMP | 110 / 14300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13480: ShippingContainerContainerUserDefSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39563 / ShippingContainerUserDefinedField1Value | User Defined Field 1 / UDSHIPPING_CONTAINER1 | 10 / 14500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39564 / ShippingContainerUserDefinedField2Value | User Defined Field 2 / UDSHIPPING_CONTAINER2 | 10 / 14700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39565 / ShippingContainerUserDefinedField3Value | User Defined Field 3 / UDSHIPPING_CONTAINER3 | 10 / 14900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39566 / ShippingContainerUserDefinedField4Value | User Defined Field 4 / UDSHIPPING_CONTAINER4 | 10 / 15100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39567 / ShippingContainerUserDefinedField5Value | User Defined Field 5 / UDSHIPPING_CONTAINER5 | 10 / 15300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39568 / ShippingContainerUserDefinedField6Value | User Defined Field 6 / UDSHIPPING_CONTAINER6 | 10 / 15500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39569 / ShippingContainerUserDefinedField7Value | User Defined Field 7 / UDSHIPPING_CONTAINER7 | 90 / 15700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39570 / ShippingContainerUserDefinedField8Value | User Defined Field 8 / UDSHIPPING_CONTAINER8 | 90 / 15900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 44 control attributes, 18 events, and 8 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 29913 | 39487 / ShippingContainerActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 29914 | 39495 / ContainerContentsValueValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 29915 | 39495 / ContainerContentsValueValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 29916 | 39498 / ContainerContentsWeightValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 29917 | 39498 / ContainerContentsWeightValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 29918 | 39503 / ContainerInfoContainerTypeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 29919 | 39503 / ContainerInfoContainerTypeValue | data-msg-required | Y / Y / Y | 18 / 0 |
| 29920 | 39505 / ContainerInfoContainerCountNumberValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 29921 | 39505 / ContainerInfoContainerCountNumberValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 29922 | 39506 / ContainerInfoContainerCountTotalValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 29923 | 39506 / ContainerInfoContainerCountTotalValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 29924 | 39510 / ContainerInfoLengthValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 29925 | 39510 / ContainerInfoLengthValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 29926 | 39512 / ContainerContentsWidthValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 29927 | 39512 / ContainerContentsWidthValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 29928 | 39514 / ContainerContentsHeightValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 29929 | 39514 / ContainerContentsHeightValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 29930 | 39518 / StatusStatusFailedValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 29931 | 39518 / StatusStatusFailedValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 29932 | 39521 / CarrierManifestForDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 29933 | 39528 / CarrierHundredWeightValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 29934 | 39528 / CarrierHundredWeightValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 29935 | 39542 / ShippingContainerCatchWeightGrid | data-modelClass | Y / Y / N | 100 / 0 |
| 29936 | 39542 / ShippingContainerCatchWeightGrid | data-dbtable | Y / Y / N | 52 / 0 |
| 29937 | 39542 / ShippingContainerCatchWeightGrid | data-headerkey | Y / Y / N | 26 / 0 |
| 29938 | 39542 / ShippingContainerCatchWeightGrid | pageSize | Y / Y / Y | 4 / 0 |
| 29939 | 39543 / ShippingContainerLotInfoGrid | data-modelClass | Y / Y / N | 92 / 0 |
| 29940 | 39543 / ShippingContainerLotInfoGrid | data-dbtable | Y / Y / N | 36 / 0 |
| 29941 | 39543 / ShippingContainerLotInfoGrid | data-headerkey | Y / Y / N | 44 / 0 |
| 29942 | 39543 / ShippingContainerLotInfoGrid | data-headerkey | Y / Y / N | 12 / 0 |
| 29943 | 39543 / ShippingContainerLotInfoGrid | pageSize | Y / Y / Y | 4 / 0 |
| 29944 | 39545 / ShippingContainerVasActivitiesGrid | data-securityCheckpoint | Y / Y / Y | 4 / 0 |
| 29945 | 39545 / ShippingContainerVasActivitiesGrid | data-formId | Y / Y / Y | 8 / 0 |
| 29946 | 39545 / ShippingContainerVasActivitiesGrid | data-modelClass | Y / Y / N | 100 / 0 |
| 29947 | 39545 / ShippingContainerVasActivitiesGrid | data-readonlyColumn | Y / Y / N | 18 / 0 |
| 29948 | 39545 / ShippingContainerVasActivitiesGrid | data-dbtable | Y / Y / N | 82 / 0 |
| 29949 | 39545 / ShippingContainerVasActivitiesGrid | data-headerkey | Y / Y / N | 44 / 0 |
| 29950 | 39545 / ShippingContainerVasActivitiesGrid | data-duplicateRowMsg | Y / Y / Y | 24 / 0 |
| 29951 | 39545 / ShippingContainerVasActivitiesGrid | data-restupdate | Y / Y / Y | 108 / 0 |
| 29952 | 39545 / ShippingContainerVasActivitiesGrid | data-restcreate | Y / Y / Y | 108 / 0 |
| 29953 | 39545 / ShippingContainerVasActivitiesGrid | data-restdelete | Y / Y / Y | 112 / 0 |
| 29954 | 39545 / ShippingContainerVasActivitiesGrid | data-restrictionsProcessor | Y / Y / Y | 98 / 0 |
| 29955 | 39545 / ShippingContainerVasActivitiesGrid | data-defaultsProcessor | Y / Y / Y | 90 / 0 |
| 29956 | 39545 / ShippingContainerVasActivitiesGrid | pageSize | Y / Y / Y | 4 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 12895 / click | 39487 / ShippingContainerActionSave | _webUi.shippingContainer.save | Not populated | Y / Y |
| 12896 / click | 39488 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 12897 / igcomboselectionchanged | 39503 / ContainerInfoContainerTypeValue | _webUi.shippingContainer.containerTypeChanged | Not populated | Y / Y |
| 12898 / igcomborendered | 39504 / ContainerInfoContainerClassValue | _webUi.shippingContainer.comboBoxRendered | Not populated | Y / Y |
| 12899 / ignumericeditorvaluechanged | 39510 / ContainerInfoLengthValue | _webUi.shippingContainer.updateVolumeBasedOnDimensionChange | Not populated | Y / Y |
| 12900 / igcomborendered | 39511 / ContainerInfoLengthDimensionUmValue | _webUi.shippingContainer.comboBoxRendered | Not populated | Y / Y |
| 12901 / ignumericeditorvaluechanged | 39512 / ContainerContentsWidthValue | _webUi.shippingContainer.updateVolumeBasedOnDimensionChange | Not populated | Y / Y |
| 12902 / igcomborendered | 39513 / ContainerContentsWidthDimensionUmValue | _webUi.shippingContainer.comboBoxRendered | Not populated | Y / Y |
| 12903 / ignumericeditorvaluechanged | 39514 / ContainerContentsHeightValue | _webUi.shippingContainer.updateVolumeBasedOnDimensionChange | Not populated | Y / Y |
| 12904 / igcomborendered | 39515 / ContainerContentsHeightDimensionUmValue | _webUi.shippingContainer.comboBoxRendered | Not populated | Y / Y |
| 12905 / igdateeditorvaluechanged | 39520 / CarrierManifestDateTimeValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 12906 / igdatepickervaluechanged | 39521 / CarrierManifestForDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 12907 / igdateeditorvaluechanged | 39522 / CarrierPlannedDeliveryDateTimeValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 12908 / DOMContentLoaded | 39544 / ShippingContainerSerialNumbers | _webUi.detailsScreenBinding.onReadyEventHandler | Not populated | Y / Y |
| 12909 / iggridupdatingrowdeleted | 39545 / ShippingContainerVasActivitiesGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 12910 / iggridupdatingeditrowended | 39545 / ShippingContainerVasActivitiesGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 12911 / iggridupdatingrowadded | 39545 / ShippingContainerVasActivitiesGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 12912 / iggridupdatingeditrowending | 39545 / ShippingContainerVasActivitiesGrid | _webUi.shippingContainer.gridVasActivityEditRowEnding | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 17464 / 12895 | PUTServiceURL | Y / Y | 90 |
| 17465 / 12895 | queryParameter_IdField | Y / Y | 40 |
| 17466 / 12908 | GETServiceURL | Y / Y | 114 |
| 17467 / 12908 | queryParameter_internalConatinerNumber | Y / Y | 138 |
| 17468 / 12908 | Get_SuccessCallback | Y / Y | 48 |
| 17469 / 12909 | CommitSelector | Y / Y | 34 |
| 17470 / 12910 | CommitSelector | Y / Y | 34 |
| 17471 / 12911 | CommitSelector | Y / Y | 34 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 12 selected candidate rows for this Screen: **12 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 29913 | 39487 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 29936 | 39542 / Not applicable | data-dbtable | database_identifier | Shipment_Catch_Weight_Info | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 29940 | 39543 / Not applicable | data-dbtable | database_identifier | Shipping_Container | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 29944 | 39545 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 29945 | 39545 / Not applicable | data-formId | form_id | 3020 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 29948 | 39545 / Not applicable | data-dbtable | database_identifier | Shipping_Container_VAS_Activity_Grid_View | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 29951 | 39545 / Not applicable | data-restupdate | relative_api_path | /general/scaleapi/ShippingContainerVasActivityApi/save | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 29952 | 39545 / Not applicable | data-restcreate | relative_api_path | /general/scaleapi/ShippingContainerVasActivityApi/save | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 29953 | 39545 / Not applicable | data-restdelete | relative_api_path | /general/scaleapi/ShippingContainerVasActivityApi/delete | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 17464 | 39487 / 12895 | PUTServiceURL | relative_api_path | /general/scaleapi/ShippingContainersApi/save? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 17466 | 39544 / 12908 | GETServiceURL | relative_api_path | /outbound/scaleapi/ShippingContainersApi/GetSerialNumber? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 17468 | 39544 / 12908 | Get_SuccessCallback | callback_identifier | _webUi.MiniGrid.bindData | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
