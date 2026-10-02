# Company Transfer — Form 4090, Screen 1525

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4090 |
| MAIN_UI_SCREEN Object ID | 1525 |
| Label / Form resource key | Company Transfer / MNU_INVENTORYCOMPANYTRANSFERTRANSACTION |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | transaction_menu / 6 |
| Configured path | /scale/trans/inventoryCompanyTransfer |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/inventoryCompanyTransfer |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4090 |
| Inspection requirement | view_only_do_not_submit |
| Form configuration table/view | CompanyTransferRequestProcessor |
| Help page reference | Company_transfer.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4090 |
| Inspection time (UTC) | 2026-10-02T15:30:07.196Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_INVENTORYCOMPANYTRANSFERTRANSACTION |
| Observed configured table/view | CompanyTransferRequestProcessor |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1525 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:17:55.249Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/trans/inventoryCompanyTransfer; Company Transfer | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

**Visible criteria / entry fields:** Adjustment Type.

**Observed action/menu labels:** Cancel.

**Observation limits:** Additional transaction fields depend on Adjustment Type selection; no type selected and no transfer submitted.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Company Transfer is recorded as `transaction_menu`. Its saved configuration contains 1 parts, 6 groups, 23 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3487 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | InventoryCompanyTransferActionTransfer |

### Part 3487: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14586 / InventoryCompanyTransferMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14586; default=None |
| 14587 / InventoryCompanyTransferMenuPanel | 14586 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14586; default=None |
| 14589 / InventoryCompanyTransferAdjustmentTypeGroup | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=14589; default=None |
| 14588 / MenuActionsDropdown | 14586 | Actions / ACTIONS | 80 / 300 | Y / Y | Fixed to top=N; loading=0; nested unit=14586; default=None |
| 14590 / InventoryCompanyTransferMainAccordion | Not populated | Not populated / Not populated | 40 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=14590; default=None |
| 14591 / InventoryCompanyTransferUserDefinedSubAccordion | 14590 | Not populated / USERDEFINEDFIELDS | 50 / 1000 | Y / Y | Fixed to top=N; loading=0; nested unit=14590; default=None |

#### Group 14587: InventoryCompanyTransferMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42420 / InventoryCompanyTransferActionTransfer | Transfer / BTN_TRANSFER | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_TRANSFER |

#### Group 14589: InventoryCompanyTransferAdjustmentTypeGroup — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42422 / InventoryCompanyTransferAdjustmentTypeValue | Adjustment Type / ADJUSTMENTTYPE | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 42423 / LocationInformationLicensePlateValue | License Plate / LICENSEPLATE | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=LicensePlateAdjustment; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 42424 / LocationInformationFromLocationValue | Location / LOCATION | 10 / 350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 42425 / LicensePlateAdjustment | Not populated / Not populated | 100 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 42426 / ItemInformationWebImage | Not populated / Not populated | 170 / 450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 42427 / ItemInformationItemValue | Item / ITEM | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 42428 / ItemInformationFromCompanyValue | From Company / FROMCOMPANY | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42429 / ItemInformationToCompanyValue | To Company / TOCOMPANY | 80 / 1100 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 42430 / ItemInformationDescriptionValue | Description / ITEMDESCRIPTION | 10 / 1200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 42431 / QuantityInformationAllInventoryInWarehouseToggle | All Inventory in Warehouse / ALLINVENTORYINWAREHOUSE | 130 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42432 / QuantityInformationAllLotsToggle | All Lots / ALLLOTS | 130 / 1400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42433 / QuantityInformationStatusValue | Status (Leave Blank for No Status Change) / COMPTRANSTATUS | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42434 / QuantityInformationEntireLocationQuantityValue | Entire Location Quantity / ENTIRELOCATIONQUANTITY | 130 / 2100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14588: MenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42421 / MenuActionCancel | Cancel / BTN_CANCEL | 150 / 150 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 14591: InventoryCompanyTransferUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42435 / UserDefinedUDF1Value | User Defined Field 1 / UD_INVCOMPTRANSFER01 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42436 / UserDefinedUDF2Value | User Defined Field 2 / UD_INVCOMPTRANSFER02 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42437 / UserDefinedUDF3Value | User Defined Field 3 / UD_INVCOMPTRANSFER03 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42438 / UserDefinedUDF4Value | User Defined Field 4 / UD_INVCOMPTRANSFER04 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42439 / UserDefinedUDF5Value | User Defined Field 5 / UD_INVCOMPTRANSFER05 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42440 / UserDefinedUDF6Value | User Defined Field 6 / UD_INVCOMPTRANSFER06 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42441 / UserDefinedUDF7Value | User Defined Field 7 / UD_INVCOMPTRANSFER07 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42442 / UserDefinedUDF8Value | User Defined Field 8 / UD_INVCOMPTRANSFER08 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 21 control attributes, 9 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32651 | 42422 / InventoryCompanyTransferAdjustmentTypeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 32652 | 42422 / InventoryCompanyTransferAdjustmentTypeValue | data-msg-required | Y / Y / Y | 20 / 1 |
| 32653 | 42423 / LocationInformationLicensePlateValue | toUpper | Y / Y / Y | 8 / 0 |
| 32654 | 42423 / LocationInformationLicensePlateValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 32655 | 42423 / LocationInformationLicensePlateValue | data-msg-required | Y / Y / Y | 36 / 1 |
| 32656 | 42424 / LocationInformationFromLocationValue | toUpper | Y / Y / Y | 8 / 0 |
| 32657 | 42424 / LocationInformationFromLocationValue | Lookup | Y / Y / N | 100 / 0 |
| 32658 | 42424 / LocationInformationFromLocationValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 32659 | 42424 / LocationInformationFromLocationValue | data-msg-required | Y / Y / Y | 28 / 1 |
| 32660 | 42427 / ItemInformationItemValue | toUpper | Y / Y / Y | 8 / 0 |
| 32661 | 42427 / ItemInformationItemValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 32662 | 42427 / ItemInformationItemValue | data-msg-required | Y / Y / Y | 20 / 1 |
| 32663 | 42427 / ItemInformationItemValue | Lookup | Y / Y / N | 68 / 0 |
| 32664 | 42429 / ItemInformationToCompanyValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 32665 | 42429 / ItemInformationToCompanyValue | data-msg-required | Y / Y / Y | 26 / 1 |
| 32666 | 42431 / QuantityInformationAllInventoryInWarehouseToggle | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 32667 | 42431 / QuantityInformationAllInventoryInWarehouseToggle | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 32668 | 42432 / QuantityInformationAllLotsToggle | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 32669 | 42432 / QuantityInformationAllLotsToggle | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 32670 | 42434 / QuantityInformationEntireLocationQuantityValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 32671 | 42434 / QuantityInformationEntireLocationQuantityValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14059 / click | 42420 / InventoryCompanyTransferActionTransfer | _webUi.inventoryCompanyTransferTransaction.invokePOSTWebServiceForCompanyTransfer | Not populated | Y / Y |
| 14060 / click | 42421 / MenuActionCancel | _webUi.inventoryCompanyTransferTransaction.cancel | Not populated | Y / Y |
| 14061 / igcombodropdownclosed | 42422 / InventoryCompanyTransferAdjustmentTypeValue | _webUi.inventoryCompanyTransferTransaction.getAdjustmentType | Not populated | Y / Y |
| 14062 / igtexteditorvaluechanged | 42423 / LocationInformationLicensePlateValue | _webUi.inventoryCompanyTransferTransaction.onLPChange | Not populated | Y / Y |
| 14063 / igtexteditorvaluechanged | 42424 / LocationInformationFromLocationValue | _webUi.inventoryCompanyTransferTransaction.getLocationDetails | Not populated | Y / Y |
| 14064 / click | 42425 / LicensePlateAdjustment | _webUi.inventoryCompanyTransferTransaction.getLicensePlateDetails | Not populated | Y / Y |
| 14065 / igtexteditorvaluechanged | 42427 / ItemInformationItemValue | _webUi.inventoryCompanyTransferTransaction.getItemCompany | Not populated | Y / Y |
| 14066 / igcomboselectionchanged | 42428 / ItemInformationFromCompanyValue | _webUi.inventoryCompanyTransferTransaction.itemCompanyChangedToFetchItemDetails | Not populated | Y / Y |
| 14067 / change | 42431 / QuantityInformationAllInventoryInWarehouseToggle | _webUi.inventoryCompanyTransferTransaction.toggleAllLocationsCompanyTransfer | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19312 / 14059 | POSTServiceURL | Y / Y | 146 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 1 selected candidate rows for this Screen: **1 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_EVENT_PARAMETERS / 19312 | 42420 / 14059 | POSTServiceURL | relative_api_path | /Inventory/scaleapi/InventoryManagementApi/InventoryTransaction-Processed | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
