# Work Order Line — Form 4044, Screen 1671

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4044 |
| MAIN_UI_SCREEN Object ID | 1671 |
| Label / Form resource key | Work Order Line / MNU_WORKORDERLINEDETAILS |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | record_detail_template / 6 |
| Configured path | /scale/details/workorderline |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/workorderline |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4044 |
| Inspection requirement | record_context_required |
| Form configuration table/view | WorkOrderDetailView |
| Help page reference | ManualWOCreate.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4044 |
| Inspection time (UTC) | 2026-10-02T15:27:54.357Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_WORKORDERLINEDETAILS |
| Observed configured table/view | WorkOrderDetailView |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1671 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Work Order Line is recorded as `record_detail_template`. Its saved configuration contains 1 parts, 9 groups, 44 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3893 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | Not populated |

### Part 3893: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16315 / WorkOrderDetailMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16315; default=None |
| 16316 / WorkOrderDetailMenuPanel | 16315 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16315; default=None |
| 16317 / WorkOrderDetailMainAccordion | Not populated | Not populated / Not populated | 140 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=16317; default=None |
| 16318 / WorkOrderDetailItemInfoSubAccordion | 16317 | Item Info / ITEMINFO | 50 / 1500 | Y / Y | Fixed to top=N; loading=2; nested unit=16317; default=WorkOrderDetailMenuActionSave |
| 16319 / WorkOrderDetaillQuantityInfoSubAccordion | 16317 | Quantity Info / QUANTITYINFO | 50 / 1600 | Y / Y | Fixed to top=N; loading=2; nested unit=16317; default=WorkOrderDetaillMenuActionSave |
| 16320 / WorkOrderAllocationInfoSubAccordion | 16317 | Allocation Info / ALLOCATIONINFO | 50 / 1700 | Y / Y | Fixed to top=N; loading=1; nested unit=16317; default=None |
| 16321 / WorkOrderDetailIncreaseComponentQtySubAccordion | 16317 | Increase Component Quantity / INCREASECOMPONENTQTY | 50 / 1800 | Y / Y | Fixed to top=N; loading=2; nested unit=16317; default=None |
| 16322 / WorkOrderDetailReferenceInfoSubAccordion | 16317 | Reference Info / REFERENCEINFO | 50 / 1900 | Y / Y | Fixed to top=N; loading=1; nested unit=16317; default=WorkOrderDetailMenuActionSave |
| 16323 / WorkOrderDetailUserDefinedSubAccordion | 16317 | User Defined / USERDEFINED | 50 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=16317; default=None |

#### Group 16316: WorkOrderDetailMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47852 / WorkOrderDetailMenuActionSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 47853 / WorkOrderDetailSectionItem | Not populated / Not populated | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 47851 / ActionCancel | Cancel / BTN_CANCEL | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 16318: WorkOrderDetailItemInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47854 / ItemInfoItemValue | Item / ITEM | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 47855 / ItemInfoCompanyValue | Company / COMPANY | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 47856 / ItemInfoWebImage | Not populated / Not populated | 170 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 47857 / ItemInfoItemDescriptionValue | Description / ITEMDESCRIPTION | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 47858 / ItemInfoLicensePlateValue | License Plate / LICENSEPLATE | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47859 / ItemInfoLotValue | Lot / LOT | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 47860 / ItemInfoBuildLevelValue | Build Level / BUILDLEVEL | 90 / 1350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47861 / ItemInfoBuildSequenceValue | Build Sequence / BUILDSEQUENCE | 90 / 1450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 47862 / ItemInfoImmediatesNeedsNoteValue | Immediate Needs Note / IMMEDIATENEEDSNOTE | 90 / 1550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47863 / ItemInfoInventoryTracked | Inventory Tracked / INVENTORYTRACKED | 130 / 1650 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16319: WorkOrderDetaillQuantityInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47864 / QuantityInfoQtyNeededPerItem12 | Quantity Needed Per Item / QTYNEEDEDPERITEM | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47865 / QuantityInfoTotalQuantityUmValue | UM / UM | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47866 / QuantityInfoTotalQtyNeededValue | Total Needed / TOTALQTYNEEDED | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47867 / QuantityInfoOpenQuantityUmValue | UM / UM | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47868 / QuantityInfoOrigQtyNeededValue | Original Total Qty Needed / ORIGTOTALQTYNEEDED | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47869 / QuantityInfoOriginalTotalQuantityUmValue | UM / UM | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 47870 / QuantityInfoOriginalTotalQtyUsedValue | Total Used / TOTALQTYUSED | 90 / 1600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47871 / QuantityInfoOriginalTotalQtyUsedUmValue | UM / UM | 80 / 1700 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16320: WorkOrderAllocationInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47872 / WorkOrderAllocationInfoAllocationRule | Allocation Rule / ALLOCATIONRULE | 80 / 200 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47873 / WorkOrderAllocationInfoLocationValue | Location / LOCATION | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 47874 / WorkOrderAllocationInfoAllocated | Allocated / ALLOCATED | 130 / 300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16321: WorkOrderDetailIncreaseComponentQtySubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47875 / WorkOrderIncreaseCompQtyEligible | Eligible / ELIGIBLE | 130 / 300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 47876 / IncreaseComponentQtyComputedQtyAmount | Compute As Amount / COMPUTEASAMOUNT | 130 / 350 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47877 / IncreaseComponentQtyComputedQtyPercent | Compute As Percent / COMPUTEASPERCENT | 130 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 47878 / WorkOrderDetailMinimumReqQty | Minimum Required Qty / MINIMUMREQQTY | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47879 / WorkOrderDetailIncreasedQty | Increase Qty / INCREASEQTY | 90 / 850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 47880 / WorkOrderDetailIncreasedCompQtyUm | UM / UM | 80 / 900 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16322: WorkOrderDetailReferenceInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47881 / WDReferenceInfoSectionRefId1 | Work Order ID / WORKORDERID | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47882 / WDReferenceInfoSectionWarehouseValue | Warehouse / WAREHOUSE | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 47883 / WDReferenceInfoSectionInternalWorkorderLinenum | Internal Work Order Line Number / INTERNALWORKORDERLINENUM | 90 / 3000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47884 / WDReferenceInfoSectionUserStampValue | User Stamp / USERSTAMP | 80 / 4000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 47885 / WDReferenceInfoSectionProcessStampValue | Process Stamp / PROCESSSTAMP | 10 / 5000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47886 / WDReferenceInfoSectionDateTimeStampValue | Date Time Stamp / DATETIMESTAMP | 120 / 6000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16323: WorkOrderDetailUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47887 / WorkOrderDetailUserDefinedSectionUserDefined1Value | User Defined Field 1 / UD_WODETAIL1 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47888 / WorkOrderDetailUserDefinedSectionUserDefined2Value | User Defined Field 2 / UD_WODETAIL2 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47889 / WorkOrderDetailUserDefinedSectionUserDefined3Value | User Defined Field 3 / UD_WODETAIL3 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47890 / WorkOrderDetailUserDefinedSectionUserDefined4Value | User Defined Field 4 / UD_WODETAIL4 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47891 / WorkOrderDetailUserDefinedSectionUserDefined5Value | User Defined Field 5 / UD_WODETAIL5 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47892 / WorkOrderDetailUserDefinedSectionUserDefined6Value | User Defined Field 6 / UD_WODETAIL6 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47893 / WorkOrderDetailUserDefinedSectionUserDefined7Value | User Defined Field 7 / UD_WODETAIL7 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47894 / WorkOrderDetailUserDefinedSectionUserDefined8Value | User Defined Field 8 / UD_WODETAIL8 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 26 control attributes, 8 events, and 3 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 37398 | 47852 / WorkOrderDetailMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37399 | 47852 / WorkOrderDetailMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37400 | 47854 / ItemInfoItemValue | toUpper | Y / Y / Y | 8 / 0 |
| 37401 | 47854 / ItemInfoItemValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37402 | 47854 / ItemInfoItemValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37403 | 47854 / ItemInfoItemValue | Lookup | Y / Y / N | 54 / 0 |
| 37404 | 47858 / ItemInfoLicensePlateValue | toUpper | Y / Y / Y | 8 / 0 |
| 37405 | 47859 / ItemInfoLotValue | toUpper | Y / Y / Y | 8 / 0 |
| 37406 | 47860 / ItemInfoBuildLevelValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 37407 | 47860 / ItemInfoBuildLevelValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 37408 | 47861 / ItemInfoBuildSequenceValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 37409 | 47861 / ItemInfoBuildSequenceValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 37410 | 47863 / ItemInfoInventoryTracked | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37411 | 47863 / ItemInfoInventoryTracked | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37412 | 47864 / QuantityInfoQtyNeededPerItem12 | data-rule-min | Y / Y / Y | 14 / 0 |
| 37413 | 47864 / QuantityInfoQtyNeededPerItem12 | data-msg-min | Y / Y / Y | 18 / 1 |
| 37414 | 47873 / WorkOrderAllocationInfoLocationValue | toUpper | Y / Y / Y | 8 / 0 |
| 37415 | 47873 / WorkOrderAllocationInfoLocationValue | Lookup | Y / Y / N | 108 / 0 |
| 37416 | 47874 / WorkOrderAllocationInfoAllocated | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37417 | 47874 / WorkOrderAllocationInfoAllocated | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37418 | 47875 / WorkOrderIncreaseCompQtyEligible | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37419 | 47875 / WorkOrderIncreaseCompQtyEligible | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37420 | 47876 / IncreaseComponentQtyComputedQtyAmount | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37421 | 47876 / IncreaseComponentQtyComputedQtyAmount | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37422 | 47877 / IncreaseComponentQtyComputedQtyPercent | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37423 | 47877 / IncreaseComponentQtyComputedQtyPercent | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16207 / click | 47852 / WorkOrderDetailMenuActionSave | _webUi.workOrderLineDetails.save | Not populated | Y / Y |
| 16206 / click | 47851 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 16208 / igtexteditorvaluechanged | 47854 / ItemInfoItemValue | _webUi.workOrderLineDetails.itemValueChanged | Not populated | Y / Y |
| 16209 / ignumericeditorvaluechanged | 47864 / QuantityInfoQtyNeededPerItem12 | _webUi.workOrderLineDetails.qtyNeededPerItemChanged | Not populated | Y / Y |
| 16210 / igcomboselectionchanged | 47865 / QuantityInfoTotalQuantityUmValue | _webUi.workOrderLineDetails.qtyUmChanged | Not populated | Y / Y |
| 16211 / change | 47875 / WorkOrderIncreaseCompQtyEligible | _webUi.workOrderLineDetails.eligibleToggled | Not populated | Y / Y |
| 16212 / change | 47876 / IncreaseComponentQtyComputedQtyAmount | _webUi.workOrderLineDetails.increaseAmountToggled | Not populated | Y / Y |
| 16213 / change | 47877 / IncreaseComponentQtyComputedQtyPercent | _webUi.workOrderLineDetails.increasePercentToggled | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 23031 / 16207 | POSTServiceURL | Y / Y | 88 |
| 23032 / 16207 | PUTServiceURL | Y / Y | 90 |
| 23033 / 16207 | queryParameter_IdField | Y / Y | 42 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 4 selected candidate rows for this Screen: **4 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 37398 | 47852 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37399 | 47852 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23031 | 47852 / 16207 | POSTServiceURL | relative_api_path | /inventory/scaleapi/workOrderDetailsApi/save | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23032 | 47852 / 16207 | PUTServiceURL | relative_api_path | /inventory/scaleapi/workOrderDetailsApi/save? | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
