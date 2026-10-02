# Work Order — Form 3037, Screen 1447

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3037 |
| MAIN_UI_SCREEN Object ID | 1447 |
| Label / Form resource key | Work Order / MNU_WORKORDERDETAILS |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | record_detail_template / 6 |
| Configured path | /scale/details/workorder |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/workorder |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3037 |
| Inspection requirement | record_context_required |
| Form configuration table/view | WorkOrderHeader |
| Help page reference | ManualWOCreate.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3037 |
| Inspection time (UTC) | 2026-10-02T15:25:47.007Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_WORKORDERDETAILS |
| Observed configured table/view | WorkOrderHeader |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1447 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Work Order is recorded as `record_detail_template`. Its saved configuration contains 1 parts, 11 groups, 54 controls, and 31 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3208 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | WorkOrderHeaderMenuActionSave |

### Part 3208: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 13583 / WorkOrderComponentsTitleSubAccordion | 13579 | Components / COMPONENTS | 50 / 100 | Y / Y | Fixed to top=N; loading=2; nested unit=13579; default=None |
| 13580 / WorkOrderHeaderReferenceinfoTitleSubAccordion | 13579 | Reference Info / REFERENCEINFO | 50 / 200 | Y / Y | Fixed to top=N; loading=2; nested unit=13579; default=WorkOrderHeaderMenuActionSave |
| 13577 / WorkOrderHeaderMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13577; default=None |
| 13578 / WorkOrderHeaderMenuPanel | 13577 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13577; default=None |
| 13581 / WorkOrderQuantityInfoTitleSubAccordion | 13579 | Quantity Info / QUANTITYINFO | 50 / 600 | Y / Y | Fixed to top=N; loading=0; nested unit=13579; default=None |
| 13582 / WorkOrderDatesInfoTitleSubAccordion | 13579 | Dates / DATES | 50 / 800 | Y / Y | Fixed to top=N; loading=1; nested unit=13579; default=None |
| 13584 / WorkOrderItemDimensionsTitleSubAccordion | 13579 | Item Dimensions / ITEMDIMENSIONS | 50 / 1100 | Y / Y | Fixed to top=N; loading=2; nested unit=13579; default=None |
| 13585 / WorkOrderItemCharacteristicsTitleSubAccordion | 13579 | Item Characteristics / ITEMCHARACTERISTICS | 50 / 1200 | Y / Y | Fixed to top=N; loading=2; nested unit=13579; default=None |
| 13586 / WorkOrderLicensePlatesTitleSubAccordion | 13579 | License Plates / LICENSEPLATES | 50 / 1400 | Y / Y | Fixed to top=N; loading=1; nested unit=13579; default=None |
| 13579 / WorkOrderHeaderDetailMainAccordion | Not populated | Not populated / Not populated | 140 / 2000 | Y / Y | Fixed to top=N; loading=2; nested unit=13579; default=None |
| 13587 / WorkOrderHeaderUserDefinedTitleSubAccordion | 13579 | User Defined / USERDEFINED | 50 / 2250 | Y / Y | Fixed to top=N; loading=1; nested unit=13579; default=None |

#### Group 13583: WorkOrderComponentsTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 40025 / WorkOrderComponentsGrid | Not populated / Not populated | 20 / 100 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 40025 `WorkOrderComponentsGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 13270 / BuildSequence | BUILD_SEQUENCE / Sequence / SEQUENCE | 20 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13271 / Item | ITEM / Item / ITEM | 10 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13272 / Company | COMPANY / Company / COMPANY | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13273 / ItemDesc | ITEM_DESC / Description / DESCRIPTION | 10 / 10 / 40 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13274 / TotalConvertedQtyNeeded | TOTAL_CONVERTED_QTY_NEEDED / Needed / NEEDED | 20 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 13275 / TotalQtyUsed | TOTAL_QTY_USED / Used / USED | 20 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 13276 / OrigTotalQtyNeeded | ORIG_TOTAL_QTY_NEEDED / Orig Needed / ORIGNEEDED | 20 / 10 / 70 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 13277 / OnHandQty | ON_HAND_QTY / On Hand / ONHAND | 20 / 10 / 80 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 13278 / Lot | LOT / Lot / LOT | 10 / 10 / 90 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13279 / FromLocation | FROM_LOCATION / From Location / FROMLOCATION | 10 / 10 / 100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13280 / ImmediateNeedsNote | Not populated / Immediate Needs Note / IMMEDIATENEEDSNOTE | 10 / 10 / 110 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13281 / InternalWorkOrderNum | INTERNAL_WORK_ORDER_NUM / Internal Work Order Number / INTERNALWORKORDERNUMBER | 20 / 10 / 115 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13282 / InternalWorkOrderLineNum | INTERNAL_WRK_ORD_LINE_NUM / Internal Work Order Line Number / INTERNALWORKORDERLINENUMBER | 20 / 10 / 120 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13283 / Allocated | Not populated / Allocated / ALLOCATED | 40 / 10 / 130 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13284 / ConvertedUm | CONVERTED_UM / Conv UM / CONVUM | 10 / 10 / 140 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13285 / BuildLevel | BUILD_LEVEL / Level / LEVEL | 20 / 10 / 150 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13286 / Color | Not populated / Color / COLOR | 10 / 10 / 170 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13287 / ImmediateNeedsResourceKey | IMMEDIATE_NEEDS_NOTE / Immediate Needs (Resource Key) / IMMEDIATENEEDSRESOURCEKEY | 10 / 10 / 180 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13269 / Icon | Not populated / Icon / ICON | 10 / 10 / 200 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 13580: WorkOrderHeaderReferenceinfoTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 40001 / ReferenceinfoWorkOrderidValue | Work Order ID / WORKORDERID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 40002 / ReferenceinfoConditionValue | Condition / CONDITION | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 40003 / ItemInfoWebImage | Not populated / Not populated | 170 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 40004 / ReferenceinfoFinishedItemValue | Finished Item / FINISHEDITEM | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 40005 / ReferenceinfoCompanyValue | Company / COMPANY | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40006 / ReferenceinfoFinishedItemDescValue | Description / ITEMDESCRIPTION | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 40007 / ReferenceinfoBuildLocationValue | Build Location / BUILDLOCATION | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 40008 / FinishedItemInfoRevisionNumValue | Revision Number / REVISIONNUM | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40009 / ReferenceInfoQtyToBeBuiltValue | Quantity to Be Built / QUANTTOBEBUILT | 90 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40010 / ReferenceInfoQtyUMValue | UM / UM | 80 / 2500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40011 / ReferenceinfoInternalWorkOrderNumValue | Work Order Number / INTERNALWORKORDERNUM | 90 / 2750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40012 / ReferenceinfoWarehouseeValue | Warehouse / WAREHOUSE | 80 / 3000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40013 / ReferenceinfoInstructionsValue | Instructions / INSTRUCTIONS | 10 / 3250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 40014 / ReferenceinfoManuallyenteredValue | Manually Entered / MANUALLYENTERED | 130 / 3500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13578: WorkOrderHeaderMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39998 / WorkOrderHeaderMenuActionSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 40000 / WorkOrderHeaderSectionWorkOrderId | Not populated / Not populated | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 39999 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 13581: WorkOrderQuantityInfoTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 40015 / QuantityInfoBaseQtyToBeBuiltValue | Base Quantity To Be Built / BASEQTYTOBEBUILT | 90 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40016 / QuantityInfoBaseQtyUMValue | UM / UM | 80 / 400 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40017 / QuantityInfoQtyAvailableToBuildValue | Quantity Available to Build / QUANTAVAILTOBUILD | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40018 / QuantityInfoQtyBuiltValue | Quantity Built / QUANTBUILT | 90 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13582: WorkOrderDatesInfoTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 40019 / DatesInfoDueDateValue | Due Date / DUEDATE | 110 / 100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40020 / DatesInfoCreatedDateValue | Created Date Time / CREATEDDATETIME | 110 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40021 / DatesInfoReleasedDateValue | Released Date Time / RELEASEDDATETIME | 110 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40022 / DatesInfoCompletionDateValue | Completion Date Time / COMPLETIONDATEANDTIME | 110 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40023 / DatesInfoPlannedUnitBuiltTimeValue | Planned Unit Build Time (Min) / PLNDUNITBLDTIME | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40024 / DatesInfoImmediateNeedsNoteValue | Immediate Needs Note / IMMEDIATENEEDSNOTE | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13584: WorkOrderItemDimensionsTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 40026 / ItemCharacteristicsInfoLengthValue | Length / LENGTH | 90 / 100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40027 / ItemCharacteristicsInfoLengthUMValue | UM / UM | 80 / 200 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40028 / ItemCharacteristicsInfoWidthValue | Width / WIDTH | 90 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40029 / ItemCharacteristicsInfoWidthUMValue | UM / UM | 80 / 400 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40030 / ItemCharacteristicsInfoHeightValue | Height / HEIGHT | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40031 / ItemCharacteristicsInfoHeightUMValue | UM / UM | 80 / 600 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40032 / ItemCharacteristicsInfoVolumeValue | Volume / VOLUME | 90 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40033 / ItemCharacteristicsInfoVolumeUMValue | UM / UM | 80 / 800 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40034 / ItemCharacteristicsInfoWeightValue | Weight Per Piece / WEIGHTPERPIECE | 90 / 900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40035 / ItemCharacteristicsInfoWeightUMValue | UM / UM | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13585: WorkOrderItemCharacteristicsTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 40036 / ItemCharacteristicsInfoClassValue | Class / CLASS | 80 / 1100 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40037 / ItemCharacteristicsInfoSizeValue | Size / SIZE | 10 / 1200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40038 / ItemCharacteristicsInfoStyleValue | LIN/Style / STYLE | 10 / 1300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40039 / ItemCharacteristicsInfoColorValue | Color / COLOR | 10 / 1400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40040 / ItemCharacteristicsInfoItemValueValue | Value / VALUE | 90 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40041 / ItemCharacteristicsInfoItemCostValue | Cost / COST | 90 / 1600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40042 / ItemCharacteristicsInfoInventoryTrackedValue | Inventory Tracked / INVENTORYTRACKED | 130 / 1700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13586: WorkOrderLicensePlatesTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 40043 / WorkOrderLicensePlateGrid | Not populated / Not populated | 20 / 100 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 40043 `WorkOrderLicensePlateGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 13288 / PutawayUnitId | PUTAWAY_UNIT_ID / License Plate / PUTAWAYUNITID | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13289 / Item | ITEM / Item / ITEM | 10 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13290 / Company | COMPANY / Company / COMPANY | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13292 / Quantity | QUANTITY / Quantity / QUANTITY | 20 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 13293 / QuantityUm | QUANTITY_UM / UM / UM | 10 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13294 / Location | LOCATION / Location / LOCATION | 10 / 10 / 70 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13295 / WorkCreated | Not populated / Work Created / WORKCREATED | 10 / 10 / 80 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13291 / Lot | LOT / Lot / LOT | 10 / 10 / 85 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13296 / InternalPutawayNum | INTERNAL_PUTAWAY_NUM / Internal Putaway Number / INTERNALPUTAWAYNUMBER | 20 / 10 / 90 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13297 / InternalWorkOrderNum | INTERNAL_WORK_ORDER_NUM / Internal Work Order Number / INTERNALWORKORDERNUMBER | 20 / 10 / 100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13298 / Icon | Not populated / Icon / ICON | 10 / 10 / 110 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13299 / Color | Not populated / Color / COLOR | 10 / 10 / 120 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 13587: WorkOrderHeaderUserDefinedTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 40044 / WorkOrderHeaderUserDefinedField1Value | User Defined Field 1 / UD_WOHEADER1 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40045 / WorkOrderHeaderUserDefinedField2Value | User Defined Field 2 / UD_WOHEADER2 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40046 / WorkOrderHeaderUserDefinedField3Value | User Defined Field 3 / UD_WOHEADER3 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40047 / WorkOrderHeaderUserDefinedField4Value | User Defined Field 4 / UD_WOHEADER4 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40048 / WorkOrderHeaderUserDefinedField5Value | User Defined Field 5 / UD_WOHEADER5 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40049 / WorkOrderHeaderUserDefinedField6Value | User Defined Field 6 / UD_WOHEADER6 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40050 / WorkOrderHeaderUserDefinedField7Value | User Defined Field 7 / UD_WOHEADER7 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 40051 / WorkOrderHeaderUserDefinedField8Value | User Defined Field 8 / UD_WOHEADER8 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 30 control attributes, 16 events, and 7 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 30163 | 39998 / WorkOrderHeaderMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 30164 | 39998 / WorkOrderHeaderMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 30165 | 40004 / ReferenceinfoFinishedItemValue | toUpper | Y / Y / Y | 8 / 0 |
| 30166 | 40004 / ReferenceinfoFinishedItemValue | Lookup | Y / Y / N | 80 / 0 |
| 30167 | 40004 / ReferenceinfoFinishedItemValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 30168 | 40004 / ReferenceinfoFinishedItemValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 30169 | 40007 / ReferenceinfoBuildLocationValue | toUpper | Y / Y / Y | 8 / 0 |
| 30170 | 40007 / ReferenceinfoBuildLocationValue | Lookup | Y / Y / N | 98 / 0 |
| 30171 | 40009 / ReferenceInfoQtyToBeBuiltValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 30172 | 40009 / ReferenceInfoQtyToBeBuiltValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 30173 | 40011 / ReferenceinfoInternalWorkOrderNumValue | data-caseInsensitiveBinding | Y / Y / Y | 8 / 0 |
| 30174 | 40013 / ReferenceinfoInstructionsValue | textMode | Y / Y / Y | 18 / 0 |
| 30175 | 40015 / QuantityInfoBaseQtyToBeBuiltValue | disabled | Y / Y / Y | 8 / 1 |
| 30176 | 40016 / QuantityInfoBaseQtyUMValue | disabled | Y / Y / Y | 8 / 1 |
| 30177 | 40019 / DatesInfoDueDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 30178 | 40025 / WorkOrderComponentsGrid | rendered | Y / Y / Y | 90 / 0 |
| 30179 | 40025 / WorkOrderComponentsGrid | data-dbtable | Y / Y / N | 34 / 0 |
| 30180 | 40025 / WorkOrderComponentsGrid | data-headerkey | Y / Y / N | 46 / 0 |
| 30181 | 40025 / WorkOrderComponentsGrid | data-modelClass | Y / Y / N | 116 / 0 |
| 30182 | 40025 / WorkOrderComponentsGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 40 / 0 |
| 30183 | 40025 / WorkOrderComponentsGrid | data-removeGroupSeparatorFromNumericColumns | Y / Y / N | 48 / 0 |
| 30184 | 40025 / WorkOrderComponentsGrid | pageSize | Y / Y / Y | 4 / 0 |
| 30185 | 40029 / ItemCharacteristicsInfoWidthUMValue | disabled | Y / Y / Y | 8 / 1 |
| 30186 | 40031 / ItemCharacteristicsInfoHeightUMValue | disabled | Y / Y / Y | 8 / 1 |
| 30187 | 40032 / ItemCharacteristicsInfoVolumeValue | disabled | Y / Y / Y | 8 / 1 |
| 30188 | 40042 / ItemCharacteristicsInfoInventoryTrackedValue | disabled | Y / Y / Y | 8 / 1 |
| 30189 | 40043 / WorkOrderLicensePlateGrid | data-dbtable | Y / Y / N | 46 / 0 |
| 30190 | 40043 / WorkOrderLicensePlateGrid | data-headerkey | Y / Y / N | 46 / 0 |
| 30191 | 40043 / WorkOrderLicensePlateGrid | data-modelClass | Y / Y / N | 120 / 0 |
| 30192 | 40043 / WorkOrderLicensePlateGrid | pageSize | Y / Y / Y | 4 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 12983 / click | 39998 / WorkOrderHeaderMenuActionSave | _webUi.workOrderDetails.save | Not populated | Y / Y |
| 12984 / click | 39999 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 12985 / igtexteditorvaluechanged | 40004 / ReferenceinfoFinishedItemValue | _webUi.workOrderDetails.itemValueChanged | Not populated | Y / Y |
| 12986 / igcomboselectionchanged | 40005 / ReferenceinfoCompanyValue | _webUi.workOrderDetails.companyValueChanged | Not populated | Y / Y |
| 12987 / igcomboselectionchanged | 40008 / FinishedItemInfoRevisionNumValue | _webUi.workOrderDetails.revisionNumberChanged | Not populated | Y / Y |
| 12988 / DOMContentLoaded | 40008 / FinishedItemInfoRevisionNumValue | _webUi.workOrderDetails.finishedItemInfoLoaded | Not populated | Y / Y |
| 12989 / ignumericeditorvaluechanging | 40009 / ReferenceInfoQtyToBeBuiltValue | _webUi.workOrderDetails.quantityToBeBuiltChanging | Not populated | Y / Y |
| 12990 / ignumericeditorblur | 40009 / ReferenceInfoQtyToBeBuiltValue | _webUi.workOrderDetails.quantityToBeBuiltChanged | Not populated | Y / Y |
| 12991 / DOMContentLoaded | 40010 / ReferenceInfoQtyUMValue | _webUi.workOrderDetails.quantityInfoLoaded | Not populated | Y / Y |
| 12992 / igcombodropdownclosed | 40010 / ReferenceInfoQtyUMValue | _webUi.workOrderDetails.quantityUmChanged | Not populated | Y / Y |
| 12993 / igdatepickervaluechanged | 40019 / DatesInfoDueDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 12994 / ignumericeditorblur | 40026 / ItemCharacteristicsInfoLengthValue | _webUi.workOrderDetails.calculateVolume | Not populated | Y / Y |
| 12995 / ignumericeditorblur | 40028 / ItemCharacteristicsInfoWidthValue | _webUi.workOrderDetails.calculateVolume | Not populated | Y / Y |
| 12996 / ignumericeditorblur | 40030 / ItemCharacteristicsInfoHeightValue | _webUi.workOrderDetails.calculateVolume | Not populated | Y / Y |
| 12997 / DOMContentLoaded | 40035 / ItemCharacteristicsInfoWeightUMValue | _webUi.workOrderDetails.itemDimensionsLoaded | Not populated | Y / Y |
| 12998 / DOMContentLoaded | 40042 / ItemCharacteristicsInfoInventoryTrackedValue | _webUi.workOrderDetails.itemCharacteristicsLoaded | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 17517 / 12983 | POSTServiceURL | Y / Y | 88 |
| 17518 / 12983 | PUTServiceURL | Y / Y | 90 |
| 17519 / 12983 | queryParameter_IdField | Y / Y | 40 |
| 17520 / 12988 | none | Y / Y | 8 |
| 17521 / 12991 | none | Y / Y | 8 |
| 17522 / 12997 | none | Y / Y | 8 |
| 17523 / 12998 | none | Y / Y | 8 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 6 selected candidate rows for this Screen: **6 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 30163 | 39998 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 30164 | 39998 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 30179 | 40025 / Not applicable | data-dbtable | database_identifier | WORK_ORDER_DETAIL | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 30189 | 40043 / Not applicable | data-dbtable | database_identifier | WORK_ORDER_PUTAWAY_UNIT | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 17517 | 39998 / 12983 | POSTServiceURL | relative_api_path | /inventory/scaleapi/workOrderHeadersApi/save | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 17518 | 39998 / 12983 | PUTServiceURL | relative_api_path | /inventory/scaleapi/workOrderHeadersApi/save? | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
