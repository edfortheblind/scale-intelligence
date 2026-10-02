# Receipt Container — Form 3005, Screen 1666

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3005 |
| MAIN_UI_SCREEN Object ID | 1666 |
| Label / Form resource key | Receipt Container / MNU_RECEIPTCONTAINERDETAILS |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | record_detail_template / 6 |
| Configured path | /scale/details/receiptcontainer |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/receiptcontainer |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3005 |
| Inspection requirement | record_context_required |
| Form configuration table/view | ReceiptContainerView |
| Help page reference | procReceipt.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3005 |
| Inspection time (UTC) | 2026-10-02T15:24:50.007Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_RECEIPTCONTAINERDETAILS |
| Observed configured table/view | ReceiptContainerView |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1666 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Receipt Container is recorded as `record_detail_template`. Its saved configuration contains 1 parts, 10 groups, 59 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3887 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | Not populated |

### Part 3887: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16255 / ReceiptContainerMenuGroup | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16255; default=None |
| 16256 / ReceiptContainerMenuPanel | 16255 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16255; default=None |
| 16257 / ReceiptContainerDetailMainAccordion | Not populated | Not populated / Not populated | 140 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=16257; default=None |
| 16258 / ReceiptContainerContainersInfoSubAccordion | 16257 | Container Info / ContainerInfo | 50 / 500 | Y / Y | Fixed to top=N; loading=2; nested unit=16257; default=ReceiptContainerMenu |
| 16259 / ReceiptContainerContentsSubAccordion | 16257 | Not populated / Contents | 50 / 600 | Y / Y | Fixed to top=N; loading=1; nested unit=16257; default=None |
| 16260 / ReceiptContainerStatusInfoSubAccordion | 16257 | Not populated / Status | 50 / 750 | Y / Y | Fixed to top=N; loading=1; nested unit=16257; default=None |
| 16261 / ReceiptContainerDatesInfoSubAccordion | 16257 | Not populated / Dates | 50 / 1250 | Y / Y | Fixed to top=N; loading=1; nested unit=16257; default=None |
| 16262 / ReceiptContainerSerialNumberSubAccordion | 16257 | Serial Number / SERIALNUMBER | 50 / 1400 | Y / Y | Fixed to top=N; loading=1; nested unit=16257; default=None |
| 16263 / ReceiptContainerReferenceinfoSubAccordion | 16257 | Reference Info / REFERENCEINFO | 50 / 1500 | Y / Y | Fixed to top=N; loading=1; nested unit=16257; default=None |
| 16264 / ReceiptContainerUserDefinedSubAccordion | 16257 | User Defined / USERDEFINED | 50 / 1750 | Y / Y | Fixed to top=N; loading=1; nested unit=16257; default=None |

#### Group 16256: ReceiptContainerMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47518 / ReceiptContainerMenu | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 47520 / ReceiptContainerSectionContainerId | Not populated / Not populated | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 47519 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 16258: ReceiptContainerContainersInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47521 / ReceiptContainerInfoSectionLicensePlateValue | License Plate / RECEIVINGLICENSEPLATE | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47522 / ReceiptContParentContSectionParentContIdValue | Parent License Plate / PARENTLICENSEPLATE | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47523 / ReceiptContainerInfoSectionContainerTypeValue | Not populated / ContainerType | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47524 / ReceiptContainerInfoSectionContainerClassValue | Not populated / ContainerClass | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47525 / ReceiptContainerInfoSectionLocatingRuleValue | Not populated / LocatingRule | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47526 / ReceiptContainerInfoSectionInventoryStatusValue | Inventory Status / INVENTORYSTS | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47527 / ReceiptContainerInfoSectionFromWarehouseValue | Not populated / FromWarehouse | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47528 / ReceiptContainerInfoSectionToWarehouseValue | Not populated / ToWarehouse | 80 / 1750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47529 / ReceiptContainerContentsSectionFromLocationValue | Not populated / FromLocation | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47530 / ReceiptContainerContentsSectionToLocationValue | Not populated / ToLocation | 10 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 47531 / ReceiptContainerContentsSectionOutPdLocValue | Outgoing P&D / OUTPDLOC | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47532 / ReceiptContainerContentsSectionInPdLocValue | Incoming P&D / INPDLOC | 10 / 2750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 47533 / ReceiptContainerContentsSectionLengthValue | Not populated / Length | 90 / 3000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47534 / ReceiptContainerContentsSectionLengthUm | UM / UM | 80 / 3250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47535 / ReceiptContainerContentsSectionWidthValue | Not populated / Width | 90 / 3500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47536 / INRInfoSectionWidthUm | UM / UM | 80 / 3750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47537 / ReceiptContainerContentsSectionHeightValue | Not populated / Height | 90 / 4000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47538 / INRInfoSectionHeightUm | UM / UM | 80 / 4250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16259: ReceiptContainerContentsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47539 / ReceiptContainerContentsSectionItemValue | Not populated / Item | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 47540 / ReceiptContainerContentsSectionCompanyValue | Not populated / Company | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 47541 / ItemInfoWebImage | Not populated / Not populated | 170 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 47542 / ReceiptContainerContentsSectionItemDescValue | Description / ITEMDESCRIPTION | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 47543 / ReceiptContainerContentsSectionItemClassValue | Not populated / ItemClass | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47544 / ReceiptContainerContentsSectionLotValue | Not populated / Lot | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 47545 / ReceiptContainerContentsSectionQtyValue | Quantity / QUANTITY | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47546 / INRInfoSectionQuantityUm | UM / UM | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47547 / ReceiptContainerContentsSectionTotalQtyValue | Total Quantity / TOTAL_QTY | 90 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47548 / INRInfoSectionTotalQuantityUm | UM / UM | 80 / 2500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47549 / ReceiptContainerContentsSectionWeightValue | Total Weight / TOTALWEIGHT | 90 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47550 / INRInfoSectionWeightUm | UM / UM | 80 / 2750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16260: ReceiptContainerStatusInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47551 / ReceiptContainerStausSectionStatusFlowValue | Status Flow Name / STATUSFLOWNAME | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47552 / ReceiptContainerStausSectionStatusNameValue | Status Name / STATUSNAME | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47553 / ReceiptContainerStausSectionStatusFailedValue | Status Failed / STATUSFAILED | 130 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16261: ReceiptContainerDatesInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47554 / ReceiptContDatesSectionReceiptDateValue | Receipt Date / RECEIPTDATE | 110 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47555 / ReceiptContDatesSectionExpirationDateValue | Expiration Date / EXPIRATIONDATE | 110 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47556 / ReceiptContDatesSectionManufacturedDateValue | Manufactured Date / MANUFACTUREDDATE | 110 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16262: ReceiptContainerSerialNumberSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47557 / ReceiptContainerSerialNumbers | Not populated / Not populated | 140 / 10850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16263: ReceiptContainerReferenceinfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47558 / ReferenceinfoInternalReceiptLineNumberValue | Internal Receipt Line Number / INTERNALRECEIPTLINENUM | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47559 / ReferenceinfoReceiptIdValue | Receipt ID / RECEIPTID | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47560 / ReferenceinfoReceiptIdTypeValue | Receipt ID Type / RECEIPTIDTYPE | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47561 / ReferenceinfoReasonCodeValue | Reason Code / REASONCODE | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47562 / ReferenceinfoDispositionCodeValue | Disposition Code / DISPOSITIONCODE | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47563 / ReferenceinfoInterfaceUploadBatchIdValue | Interface Upload Batch ID / INTERFACEUPLOADBATCHID | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47564 / ReferenceinfoRfidEpcValue | RFID EPC / RFIDEPC | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47565 / ReferenceinfoRfidUriValue | RFID URI / RFIDURI | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47566 / RferenceInfoSectionUserStampValue | User Stamp / USERSTAMP | 10 / 3000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47567 / ReferenceInfoSectionDateTimeStampValue | Date Time Stamp / DATETIMESTAMP | 120 / 3100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47568 / ReferenceInfoSectionProcessStampValue | Process Stamp / PROCESSSTAMP | 10 / 3200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16264: ReceiptContainerUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47569 / ReceiptContainerUserDefinedField1Value | User Defined Field 1 / UD_RECEIPTCONTAINER1 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47570 / ReceiptContainerUserDefinedField2Value | User Defined Field 2 / UD_RECEIPTCONTAINER2 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47571 / ReceiptContainerUserDefinedField3Value | User Defined Field 3 / UD_RECEIPTCONTAINER3 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47572 / ReceiptContainerUserDefinedField4Value | User Defined Field 4 / UD_RECEIPTCONTAINER4 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47573 / ReceiptContainerUserDefinedField5Value | User Defined Field 5 / UD_RECEIPTCONTAINER5 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47574 / ReceiptContainerUserDefinedField6Value | User Defined Field 6 / UD_RECEIPTCONTAINER6 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47575 / ReceiptContainerUserDefinedField7Value | User Defined Field 7 / UD_RECEIPTCONTAINER7 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47576 / ReceiptContainerUserDefinedField8Value | User Defined Field 8 / UD_RECEIPTCONTAINER8 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 23 control attributes, 5 events, and 3 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 37257 | 47518 / ReceiptContainerMenu | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37258 | 47518 / ReceiptContainerMenu | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37259 | 47521 / ReceiptContainerInfoSectionLicensePlateValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37260 | 47521 / ReceiptContainerInfoSectionLicensePlateValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37261 | 47521 / ReceiptContainerInfoSectionLicensePlateValue | toUpper | Y / Y / Y | 8 / 0 |
| 37262 | 47523 / ReceiptContainerInfoSectionContainerTypeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37263 | 47523 / ReceiptContainerInfoSectionContainerTypeValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37264 | 47529 / ReceiptContainerContentsSectionFromLocationValue | toUpper | Y / Y / Y | 8 / 0 |
| 37265 | 47530 / ReceiptContainerContentsSectionToLocationValue | toUpper | Y / Y / Y | 8 / 0 |
| 37266 | 47530 / ReceiptContainerContentsSectionToLocationValue | data-dbcolumn | Y / Y / N | 20 / 0 |
| 37267 | 47530 / ReceiptContainerContentsSectionToLocationValue | Lookup | Y / Y / N | 128 / 0 |
| 37268 | 47531 / ReceiptContainerContentsSectionOutPdLocValue | toUpper | Y / Y / Y | 8 / 0 |
| 37269 | 47532 / ReceiptContainerContentsSectionInPdLocValue | toUpper | Y / Y / Y | 8 / 0 |
| 37270 | 47532 / ReceiptContainerContentsSectionInPdLocValue | data-dbcolumn | Y / Y / N | 26 / 0 |
| 37271 | 47532 / ReceiptContainerContentsSectionInPdLocValue | Lookup | Y / Y / N | 122 / 0 |
| 37272 | 47544 / ReceiptContainerContentsSectionLotValue | toUpper | Y / Y / Y | 8 / 0 |
| 37273 | 47544 / ReceiptContainerContentsSectionLotValue | data-dbcolumn | Y / Y / N | 6 / 0 |
| 37274 | 47544 / ReceiptContainerContentsSectionLotValue | Lookup | Y / Y / N | 100 / 0 |
| 37275 | 47553 / ReceiptContainerStausSectionStatusFailedValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37276 | 47553 / ReceiptContainerStausSectionStatusFailedValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37277 | 47554 / ReceiptContDatesSectionReceiptDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 37278 | 47555 / ReceiptContDatesSectionExpirationDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 37279 | 47556 / ReceiptContDatesSectionManufacturedDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16156 / click | 47518 / ReceiptContainerMenu | _webUi.receiptDetails.save | Not populated | Y / Y |
| 16157 / click | 47519 / ActionCancel | _webUi.receiptDetails.cancel | Not populated | Y / Y |
| 16158 / igdatepickervaluechanged | 47554 / ReceiptContDatesSectionReceiptDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16159 / igdatepickervaluechanged | 47556 / ReceiptContDatesSectionManufacturedDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16160 / DOMContentLoaded | 47557 / ReceiptContainerSerialNumbers | _webUi.receiptDetails.serialNumbersLoaded | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 22990 / 16156 | PUTServiceURL | Y / Y | 88 |
| 22991 / 16156 | queryParameter_IdField | Y / Y | 36 |
| 22992 / 16156 | POSTServiceURL | Y / Y | 86 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 7 selected candidate rows for this Screen: **7 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 37257 | 47518 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37258 | 47518 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37266 | 47530 / Not applicable | data-dbcolumn | database_identifier | ToLocation | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37270 | 47532 / Not applicable | data-dbcolumn | database_identifier | IncomingPdLoc | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37273 | 47544 / Not applicable | data-dbcolumn | database_identifier | LOT | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 22990 | 47518 / 16156 | PUTServiceURL | relative_api_path | /inbound/scaleapi/receiptContainersApi/save? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 22992 | 47518 / 16156 | POSTServiceURL | relative_api_path | /inbound/scaleapi/receiptContainersApi/save | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
