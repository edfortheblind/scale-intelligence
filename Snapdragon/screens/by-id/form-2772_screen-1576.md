# Inventory Adjustment — Form 2772, Screen 1576

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2772 |
| MAIN_UI_SCREEN Object ID | 1576 |
| Label / Form resource key | Inventory Adjustment / MNU_INVENTORYADJUSTMENTTRANSACTION |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | transaction_menu / 6 |
| Configured path | /scale/trans/inventoryAdjustment |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/inventoryAdjustment |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2772 |
| Inspection requirement | view_only_do_not_submit |
| Form configuration table/view | MetaTrans_GetInventoryAdjustment |
| Help page reference | adjInv.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2772 |
| Inspection time (UTC) | 2026-10-02T15:23:55.413Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_INVENTORYADJUSTMENTTRANSACTION |
| Observed configured table/view | MetaTrans_GetInventoryAdjustment |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1576 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:19:01.134Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/trans/inventoryAdjustment; Inventory Adjustment | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

**Visible criteria / entry fields:** Adjustment Type.

**Observed action/menu labels:** Locate; Cancel.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Inventory Adjustment is recorded as `transaction_menu`. Its saved configuration contains 1 parts, 6 groups, 25 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3566 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | InventoryAdjustmentActionAdjust |

### Part 3566: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 15027 / InventoryAdjustmentMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=15027; default=None |
| 15028 / InventoryAdjustmentMenuPanel | 15027 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=15027; default=None |
| 15030 / InventoryAdjustmentAdjustmentTypeGroup | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=15030; default=None |
| 15029 / MenuActionsDropdown | 15027 | Actions / ACTIONS | 80 / 300 | Y / Y | Fixed to top=N; loading=0; nested unit=15027; default=None |
| 15031 / InventoryAdjustmentMainAccordion | Not populated | Not populated / Not populated | 40 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=15031; default=None |
| 15032 / InventoryAdjustmentUserDefinedSubAccordion | 15031 | User Defined Fields / UserDefinedFields | 50 / 1000 | Y / Y | Fixed to top=N; loading=2; nested unit=15031; default=None |

#### Group 15028: InventoryAdjustmentMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 44096 / InventoryAdjustmentActionAdjust | Adjust / ADJUST | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=Adjust |
| 44097 / InventoryAdjustmentActionCreateWork | Create Work / CREATEWORK | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=Adjust |

#### Group 15030: InventoryAdjustmentAdjustmentTypeGroup — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 44100 / InventoryAdjustmentAdjustmentTypeValue | Adjustment Type / ADJUSTMENTTYPE | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 44101 / LicensePlateInformationValue | License Plate / LICENSEPLATE | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=LicensePlateAdjustment; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 44102 / LocationInformationLocationValue | Location / LOCATION | 10 / 350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 44103 / LicensePlateAdjustment | Not populated / Not populated | 100 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 44104 / ItemInformationWebImage | Not populated / Not populated | 170 / 450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 44105 / ItemInformationItemValue | Item / ITEM | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 44106 / ItemInformationCompanyValue | Company / COMPANY | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44107 / ItemInformationDescriptionValue | Description / ITEMDESCRIPTION | 10 / 1100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 44108 / ItemInformationLotValue | Lot / LOT | 10 / 1200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 44109 / LocationInformationExpirationDateValue | Expiration Date / EXPIRATIONDATE | 110 / 1300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44110 / QuantityInformationQuantityValue | Quantity / QUANTITY | 90 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44111 / QuantityInformationQuantityUmValue | UM / UM | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44112 / QuantityInformationStatusValue | Status / STATUS | 80 / 2750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 15029: MenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 44098 / MenuActionInventoryAdjustmentActionLocate | Locate / LOCATE | 150 / 100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=LOCATE |
| 44099 / MenuActionCancel | Cancel / BTN_CANCEL | 150 / 150 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 15032: InventoryAdjustmentUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 44113 / UserDefinedUDF1Value | User Defined Field 1 / UD_INVADJUSTMENT01 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44114 / UserDefinedUDF2Value | User Defined Field 2 / UD_INVADJUSTMENT02 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44115 / UserDefinedUDF3Value | User Defined Field 3 / UD_INVADJUSTMENT03 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44116 / UserDefinedUDF4Value | User Defined Field 4 / UD_INVADJUSTMENT04 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44117 / UserDefinedUDF5Value | User Defined Field 5 / UD_INVADJUSTMENT05 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44118 / UserDefinedUDF6Value | User Defined Field 6 / UD_INVADJUSTMENT06 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44119 / UserDefinedUDF7Value | User Defined Field 7 / UD_INVADJUSTMENT07 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44120 / UserDefinedUDF8Value | User Defined Field 8 / UD_INVADJUSTMENT08 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 25 control attributes, 14 events, and 2 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 33697 | 44098 / MenuActionInventoryAdjustmentActionLocate | data-formId | Y / Y / N | 6 / 0 |
| 33698 | 44098 / MenuActionInventoryAdjustmentActionLocate | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 33699 | 44098 / MenuActionInventoryAdjustmentActionLocate | data-divider | Y / Y / N | 8 / 0 |
| 33700 | 44100 / InventoryAdjustmentAdjustmentTypeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 33701 | 44100 / InventoryAdjustmentAdjustmentTypeValue | data-msg-required | Y / Y / Y | 20 / 1 |
| 33702 | 44101 / LicensePlateInformationValue | toUpper | Y / Y / Y | 8 / 0 |
| 33703 | 44101 / LicensePlateInformationValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 33704 | 44101 / LicensePlateInformationValue | data-msg-required | Y / Y / Y | 36 / 1 |
| 33705 | 44102 / LocationInformationLocationValue | toUpper | Y / Y / Y | 8 / 0 |
| 33706 | 44102 / LocationInformationLocationValue | Lookup | Y / Y / N | 100 / 0 |
| 33707 | 44102 / LocationInformationLocationValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 33708 | 44102 / LocationInformationLocationValue | data-msg-required | Y / Y / Y | 20 / 1 |
| 33709 | 44105 / ItemInformationItemValue | toUpper | Y / Y / Y | 8 / 0 |
| 33710 | 44105 / ItemInformationItemValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 33711 | 44105 / ItemInformationItemValue | data-msg-required | Y / Y / Y | 20 / 1 |
| 33712 | 44105 / ItemInformationItemValue | Lookup | Y / Y / N | 68 / 0 |
| 33713 | 44108 / ItemInformationLotValue | toUpper | Y / Y / Y | 8 / 0 |
| 33714 | 44108 / ItemInformationLotValue | Lookup | Y / Y / N | 62 / 0 |
| 33715 | 44109 / LocationInformationExpirationDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 33716 | 44110 / QuantityInformationQuantityValue | data-rule-numericnotequals | Y / Y / Y | 2 / 0 |
| 33717 | 44110 / QuantityInformationQuantityValue | data-msg-numericnotequals | Y / Y / Y | 24 / 1 |
| 33718 | 44111 / QuantityInformationQuantityUmValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 33719 | 44111 / QuantityInformationQuantityUmValue | data-msg-required | Y / Y / Y | 16 / 0 |
| 33720 | 44112 / QuantityInformationStatusValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 33721 | 44112 / QuantityInformationStatusValue | data-msg-required | Y / Y / Y | 20 / 1 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14540 / click | 44096 / InventoryAdjustmentActionAdjust | _webUi.inventoryAdjustmentTransaction.invokePOSTWebServiceForAdjustment | Not populated | Y / Y |
| 14541 / click | 44097 / InventoryAdjustmentActionCreateWork | _webUi.inventoryAdjustmentTransaction.createWork | Not populated | Y / Y |
| 14542 / click | 44098 / MenuActionInventoryAdjustmentActionLocate | _webUi.inventoryAdjustmentTransaction.locate | Not populated | Y / Y |
| 14543 / click | 44099 / MenuActionCancel | _webUi.inventoryAdjustmentTransaction.cancel | Not populated | Y / Y |
| 14544 / igcombodropdownclosed | 44100 / InventoryAdjustmentAdjustmentTypeValue | _webUi.inventoryAdjustmentTransaction.getAdjustmentType | Not populated | Y / Y |
| 14545 / igtexteditorvaluechanged | 44101 / LicensePlateInformationValue | _webUi.inventoryAdjustmentTransaction.LPChanged | Not populated | Y / Y |
| 14546 / igtexteditorvaluechanged | 44102 / LocationInformationLocationValue | _webUi.inventoryAdjustmentTransaction.getLocationDetails | Not populated | Y / Y |
| 14547 / click | 44103 / LicensePlateAdjustment | _webUi.inventoryAdjustmentTransaction.getLicensePlateDetails | Not populated | Y / Y |
| 14548 / igtexteditorvaluechanged | 44105 / ItemInformationItemValue | _webUi.inventoryAdjustmentTransaction.getItemCompany | Not populated | Y / Y |
| 14549 / igcomboselectionchanged | 44106 / ItemInformationCompanyValue | _webUi.inventoryAdjustmentTransaction.itemCompanyChangedToFetchItemDetails | Not populated | Y / Y |
| 14550 / igtexteditorvaluechanged | 44108 / ItemInformationLotValue | _webUi.inventoryAdjustmentTransaction.getLotDetails | Not populated | Y / Y |
| 14551 / igdatepickervaluechanged | 44109 / LocationInformationExpirationDateValue | _webUi.inventoryAdjustmentTransaction.onExpirationDateChanged | Not populated | Y / Y |
| 14552 / ignumericeditorvaluechanged | 44110 / QuantityInformationQuantityValue | _webUi.inventoryAdjustmentTransaction.calculateTotalQuantityAndUM | Not populated | Y / Y |
| 14553 / igcomboselectionchanged | 44111 / QuantityInformationQuantityUmValue | _webUi.inventoryAdjustmentTransaction.calculateTotalQuantityAndUM | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19808 / 14540 | POSTServiceURL | Y / Y | 108 |
| 19809 / 14541 | POSTServiceURL | Y / Y | 108 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 4 selected candidate rows for this Screen: **2 accepted tokens** and **2 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 33697 | 44098 / Not applicable | data-formId | form_id | 156 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 33698 | 44098 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
