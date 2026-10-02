# Inventory Transfer — Form 2775, Screen 1595

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2775 |
| MAIN_UI_SCREEN Object ID | 1595 |
| Label / Form resource key | Inventory Transfer / MNU_INVENTORYTRANSFERTRANSACTION |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | transaction_menu / 6 |
| Configured path | /scale/trans/inventoryTransfer |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/inventoryTransfer |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2775 |
| Inspection requirement | view_only_do_not_submit |
| Form configuration table/view | InventoryTransferRequestProcessor |
| Help page reference | transferInv.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2775 |
| Inspection time (UTC) | 2026-10-02T15:24:00.854Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_INVENTORYTRANSFERTRANSACTION |
| Observed configured table/view | InventoryTransferRequestProcessor |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1595 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:19:36.913Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/trans/inventoryTransfer; Inventory Transfer | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

**Visible criteria / entry fields:** Adjustment Type.

**Observed action/menu labels:** Locate; Cancel.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Inventory Transfer is recorded as `transaction_menu`. Its saved configuration contains 1 parts, 6 groups, 26 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3630 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | InventoryAdjustmentActionAdjust |

### Part 3630: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 15247 / InventoryTransferMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=15247; default=None |
| 15248 / InventoryTransferMenuPanel | 15247 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=15247; default=None |
| 15250 / InventoryTransferAdjustmentTypeGroup | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=15250; default=None |
| 15249 / MenuActionsDropdown | 15247 | Actions / ACTIONS | 80 / 300 | Y / Y | Fixed to top=N; loading=0; nested unit=15247; default=None |
| 15251 / InventoryAdjustmentMainAccordion | Not populated | Not populated / Not populated | 40 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=15251; default=None |
| 15252 / InventoryTransferUserDefinedSubAccordion | 15251 | User Defined Fields / UserDefinedFields | 50 / 1000 | Y / Y | Fixed to top=N; loading=2; nested unit=15251; default=None |

#### Group 15248: InventoryTransferMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 44630 / InventoryAdjustmentActionAdjust | Transfer / TRANSFER | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=Transfer |
| 44631 / InventoryAdjustmentActionCreateWork | Create Work / CREATEWORK | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=Transfer |

#### Group 15250: InventoryTransferAdjustmentTypeGroup — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 44634 / InventoryAdjustmentAdjustmentTypeValue | Adjustment Type / ADJUSTMENTTYPE | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 44635 / LicensePlateInformationValue | License Plate / LICENSEPLATE | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=LicensePlateAdjustment; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 44636 / LocationInformationFromLocationValue | From Location / FROMLOCATION | 10 / 325 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 44637 / LicensePlateAdjustment | Not populated / Not populated | 100 / 350 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 44638 / ItemInformationWebImage | Not populated / Not populated | 170 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 44639 / LocationInformationToLocationValue | To Location / TOLOCATION | 10 / 450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 44640 / QuantityInformationStatusValue | Status / STATUS | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44641 / ItemInformationItemValue | Item / ITEM | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 44642 / ItemInformationCompanyValue | Company / COMPANY | 80 / 800 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44643 / ItemInformationDescriptionValue | Description / ITEMDESCRIPTION | 10 / 850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 44644 / ItemInformationLotValue | Lot / LOT | 10 / 900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 44645 / LocationInformationExpirationDateValue | Expiration Date / EXPIRATIONDATE | 110 / 950 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44646 / QuantityInformationQuantityValue | Quantity / QUANTITY | 90 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44647 / QuantityInformationQuantityUmValue | UM / UM | 80 / 1050 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 15249: MenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 44632 / MenuActionInventoryAdjustmentActionLocate | Locate / LOCATE | 150 / 100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=LOCATE |
| 44633 / MenuActionCancel | Cancel / BTN_CANCEL | 150 / 150 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 15252: InventoryTransferUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 44648 / UserDefinedUDF1Value | User Defined Field 1 / UD_INVTRANSFER01 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44649 / UserDefinedUDF2Value | User Defined Field 2 / UD_INVTRANSFER02 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44650 / UserDefinedUDF3Value | User Defined Field 3 / UD_INVTRANSFER03 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44651 / UserDefinedUDF4Value | User Defined Field 4 / UD_INVTRANSFER04 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44652 / UserDefinedUDF5Value | User Defined Field 5 / UD_INVTRANSFER05 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44653 / UserDefinedUDF6Value | User Defined Field 6 / UD_INVTRANSFER06 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44654 / UserDefinedUDF7Value | User Defined Field 7 / UD_INVTRANSFER07 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44655 / UserDefinedUDF8Value | User Defined Field 8 / UD_INVTRANSFER08 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 27 control attributes, 14 events, and 2 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 34275 | 44632 / MenuActionInventoryAdjustmentActionLocate | data-formId | Y / Y / N | 6 / 0 |
| 34276 | 44632 / MenuActionInventoryAdjustmentActionLocate | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 34277 | 44632 / MenuActionInventoryAdjustmentActionLocate | data-divider | Y / Y / N | 8 / 0 |
| 34278 | 44634 / InventoryAdjustmentAdjustmentTypeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 34279 | 44634 / InventoryAdjustmentAdjustmentTypeValue | data-msg-required | Y / Y / Y | 20 / 1 |
| 34280 | 44635 / LicensePlateInformationValue | toUpper | Y / Y / Y | 8 / 0 |
| 34281 | 44635 / LicensePlateInformationValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 34282 | 44635 / LicensePlateInformationValue | data-msg-required | Y / Y / Y | 36 / 1 |
| 34283 | 44636 / LocationInformationFromLocationValue | toUpper | Y / Y / Y | 8 / 0 |
| 34284 | 44636 / LocationInformationFromLocationValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 34285 | 44636 / LocationInformationFromLocationValue | data-msg-required | Y / Y / Y | 20 / 1 |
| 34286 | 44636 / LocationInformationFromLocationValue | Lookup | Y / Y / N | 108 / 0 |
| 34287 | 44639 / LocationInformationToLocationValue | toUpper | Y / Y / Y | 8 / 0 |
| 34288 | 44639 / LocationInformationToLocationValue | Lookup | Y / Y / N | 104 / 0 |
| 34289 | 44639 / LocationInformationToLocationValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 34290 | 44639 / LocationInformationToLocationValue | data-msg-required | Y / Y / Y | 20 / 1 |
| 34291 | 44640 / QuantityInformationStatusValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 34292 | 44640 / QuantityInformationStatusValue | data-msg-required | Y / Y / Y | 20 / 1 |
| 34293 | 44641 / ItemInformationItemValue | toUpper | Y / Y / Y | 8 / 0 |
| 34294 | 44641 / ItemInformationItemValue | Lookup | Y / Y / N | 68 / 0 |
| 34295 | 44641 / ItemInformationItemValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 34296 | 44641 / ItemInformationItemValue | data-msg-required | Y / Y / Y | 20 / 1 |
| 34297 | 44644 / ItemInformationLotValue | toUpper | Y / Y / Y | 8 / 0 |
| 34298 | 44644 / ItemInformationLotValue | Lookup | Y / Y / N | 62 / 0 |
| 34299 | 44645 / LocationInformationExpirationDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 34300 | 44646 / QuantityInformationQuantityValue | data-rule-numericnotequals | Y / Y / Y | 2 / 0 |
| 34301 | 44646 / QuantityInformationQuantityValue | data-msg-numericnotequals | Y / Y / Y | 24 / 1 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14824 / click | 44630 / InventoryAdjustmentActionAdjust | _webUi.inventoryTransferTransaction.invokePostForInventoryTransfer | Not populated | Y / Y |
| 14825 / click | 44631 / InventoryAdjustmentActionCreateWork | _webUi.inventoryAdjustmentTransaction.createWork | Not populated | Y / Y |
| 14826 / click | 44632 / MenuActionInventoryAdjustmentActionLocate | _webUi.inventoryAdjustmentTransaction.locate | Not populated | Y / Y |
| 14827 / click | 44633 / MenuActionCancel | _webUi.inventoryAdjustmentTransaction.cancel | Not populated | Y / Y |
| 14828 / igcombodropdownclosed | 44634 / InventoryAdjustmentAdjustmentTypeValue | _webUi.inventoryAdjustmentTransaction.getAdjustmentType | Not populated | Y / Y |
| 14829 / igtexteditorvaluechanged | 44636 / LocationInformationFromLocationValue | _webUi.inventoryTransferTransaction.getFromLocationDetails | Not populated | Y / Y |
| 14830 / click | 44637 / LicensePlateAdjustment | _webUi.inventoryAdjustmentTransaction.getLicensePlateDetails | Not populated | Y / Y |
| 14831 / igtexteditorvaluechanged | 44639 / LocationInformationToLocationValue | _webUi.inventoryTransferTransaction.getToLocationDetails | Not populated | Y / Y |
| 14832 / igtexteditorvaluechanged | 44641 / ItemInformationItemValue | _webUi.inventoryAdjustmentTransaction.getItemCompany | Not populated | Y / Y |
| 14833 / igcomboselectionchanged | 44642 / ItemInformationCompanyValue | _webUi.inventoryAdjustmentTransaction.itemCompanyChangedToFetchItemDetails | Not populated | Y / Y |
| 14834 / igtexteditorvaluechanged | 44644 / ItemInformationLotValue | _webUi.inventoryAdjustmentTransaction.getLotDetails | Not populated | Y / Y |
| 14835 / igdatepickervaluechanged | 44645 / LocationInformationExpirationDateValue | _webUi.inventoryAdjustmentTransaction.onExpirationDateChanged | Not populated | Y / Y |
| 14836 / ignumericeditorvaluechanged | 44646 / QuantityInformationQuantityValue | _webUi.inventoryAdjustmentTransaction.calculateTotalQuantityAndUM | Not populated | Y / Y |
| 14837 / igcomboselectionchanged | 44647 / QuantityInformationQuantityUmValue | _webUi.inventoryAdjustmentTransaction.calculateTotalQuantityAndUM | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 20359 / 14824 | POSTServiceURL | Y / Y | 108 |
| 20360 / 14825 | POSTServiceURL | Y / Y | 108 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 4 selected candidate rows for this Screen: **2 accepted tokens** and **2 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 34275 | 44632 / Not applicable | data-formId | form_id | 156 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 34276 | 44632 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
