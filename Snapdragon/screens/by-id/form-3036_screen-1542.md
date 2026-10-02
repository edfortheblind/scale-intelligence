# Receipt From Shipment — Form 3036, Screen 1542

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3036 |
| MAIN_UI_SCREEN Object ID | 1542 |
| Label / Form resource key | Receipt From Shipment / MNU_RECEIPTFROMSHIPTRANSACTION |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/receiptFromship |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/receiptFromship |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3036 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | MetaTrans_GetShipmentForCreateReceipt |
| Help page reference | convertShipRec.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3036 |
| Inspection time (UTC) | 2026-10-02T15:25:44.978Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_RECEIPTFROMSHIPTRANSACTION |
| Observed configured table/view | MetaTrans_GetShipmentForCreateReceipt |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1542 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Receipt From Shipment is recorded as `transaction_context`. Its saved configuration contains 1 parts, 9 groups, 25 controls, and 11 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3507 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | ReceiptFromShipmentActionSave |

### Part 3507: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14681 / ReceiptFromShipmentMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14681; default=None |
| 14682 / ReceiptFromShipmentMenuPanel | 14681 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14681; default=None |
| 14684 / ReceiptFromShipmentMainPanel | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=14684; default=None |
| 14685 / ReceiptFromShipmentPanel | 14684 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=14684; default=ReceiptFromShipmentActionSave |
| 14687 / ItemInfoSubAccordion | 14686 | Item Info / ITEMINFO | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=14686; default=None |
| 14683 / MenuActionsDropdown | 14681 | Actions / ACTIONS | 80 / 300 | Y / Y | Fixed to top=N; loading=0; nested unit=14681; default=None |
| 14686 / ItemInfoGroup | Not populated | Not populated / Not populated | 40 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=14686; default=None |
| 14688 / ReceiptFromShipShipmentInfoSubAccordion | 14686 | Not populated / ShipmentInfo | 50 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=14686; default=None |
| 14689 / ReceiptFromShipShipToSubAccordion | 14686 | Not populated / ShipTo | 50 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=14686; default=None |

#### Group 14682: ReceiptFromShipmentMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42653 / ReceiptFromShipmentMenuShipmentIdValue | Shipment ID / SHIPMENTID | 260 / 150 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 42654 / ReceiptFromShipmentActionSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |

#### Group 14685: ReceiptFromShipmentPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42657 / ReceiptFromShipmentWarehouse | Warehouse / WAREHOUSE | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42658 / ReceiptFromShipmentCompany | Not populated / Company | 80 / 300 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42659 / GoDirectlyToReceivingWorkbench | Go Directly to The Receipt Workbench / GODIRECTLYTORECWORKBENCH | 130 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14687: ItemInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42660 / ReceiptFromShipmentGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 42660 `ReceiptFromShipmentGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14499 / Icon | Not populated / Icon / ICON | 10 / 10 / 500 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14500 / Color | Not populated / Color / COLOR | 10 / 10 / 600 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14501 / ErpOrderLineNumber | ErpOrderLineNumber / Order Line Number / ORDERLINENUMBER | 20 / 10 / 800 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14502 / Item | Item / Item / ITEM | 10 / 10 / 900 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14503 / Company | Company / Company / COMPANY | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14504 / Description | Description / Description / DESCRIPTION | 10 / 10 / 1100 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14505 / ShippedQuantity | ShippedQuantity / Shipped / SHIPPEDQUANTITY | 20 / 10 / 1300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 14506 / ReturnedQuantity | ReturnedQuantity / Returned Qty / RETURNEDQTY | 20 / 10 / 1400 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 14507 / QuantityUm | QuantityUm / UM / UM | 10 / 10 / 1500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14508 / InternalShipmentNum | InternalShipmentNum / Not populated / InternalShipmentNum | 10 / 10 / 1600 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14509 / InternalShipmentLineNum | Not populated / Not populated / InternalShipmentLineNum | 20 / 10 / 1700 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 14683: MenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42655 / MenuActionSetReturnQuantityToZero | Set Returned Quantities to Zero / SETRETURNEDQTYZERO | 150 / 100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SETRETURNEDQTYZERO |
| 42656 / MenuActionCancel | Cancel / BTN_CANCEL | 150 / 150 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 14688: ReceiptFromShipShipmentInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42661 / ShipmentInfoShipmentIdValue | Shipment ID / SHIPMENTID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42662 / ShipmentInfoActualShipDateValue | Actual Ship Date Time / ACTUALSHIPDATETIME | 110 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42663 / ShipmentInfoCarrierValue | Carrier / CARRIER | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42664 / ShipmentInfoCarrierServiceValue | Carrier Service / CARRIERSERVICE | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14689: ReceiptFromShipShipToSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42665 / ShipToShipToValue | ID / ID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 42666 / ShipToNameValue | Name / NAME | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42667 / ShipToAttentionToValue | Attention To / ATTENTIONTO | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42668 / ShipToAddressValue | Address / ADDRESS | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42669 / ShipToPhoneNumberValue | Phone Number / PHONENUM | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42670 / ShipToAddress2Value | Address 2 (Optional) / ADDRESS2 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42671 / ShipToFaxNumberValue | Fax Number / FAXNUM | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42672 / ShipToAddress3Value | Address 3 (Optional) / ADDRESS3 | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42673 / ShipToEmailAddressValue | Email Address / EMAILADDRESS | 10 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42674 / ShipToCityValue | City / CITY | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 42675 / ShipToStateValue | State / STATE | 80 / 3000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 42676 / ShipToPostalCodeValue | Postal Code / POSTALCODE | 10 / 3500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 42677 / ShipToCountryValue | Country / COUNTRY | 80 / 3750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 15 control attributes, 5 events, and 2 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32844 | 42655 / MenuActionSetReturnQuantityToZero | data-divider | Y / Y / N | 8 / 0 |
| 32845 | 42657 / ReceiptFromShipmentWarehouse | data-rule-required | Y / Y / Y | 8 / 0 |
| 32846 | 42657 / ReceiptFromShipmentWarehouse | data-msg-required | Y / Y / Y | 18 / 1 |
| 32847 | 42660 / ReceiptFromShipmentGrid | data-local | Y / Y / Y | 8 / 0 |
| 32848 | 42660 / ReceiptFromShipmentGrid | data-formId | Y / Y / Y | 8 / 0 |
| 32849 | 42660 / ReceiptFromShipmentGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 32850 | 42660 / ReceiptFromShipmentGrid | data-modelClass | Y / Y / N | 118 / 0 |
| 32851 | 42660 / ReceiptFromShipmentGrid | data-addRowRequired | Y / Y / Y | 2 / 0 |
| 32852 | 42660 / ReceiptFromShipmentGrid | data-editValueRequired | Y / Y / Y | 32 / 0 |
| 32853 | 42660 / ReceiptFromShipmentGrid | data-restupdate | Y / Y / Y | 0 / 0 |
| 32854 | 42660 / ReceiptFromShipmentGrid | data-dbObjectType | Y / Y / N | 4 / 0 |
| 32855 | 42660 / ReceiptFromShipmentGrid | data-restrictionsProcessor | Y / Y / Y | 72 / 0 |
| 32856 | 42660 / ReceiptFromShipmentGrid | data-headerkey | Y / Y / N | 38 / 0 |
| 32857 | 42660 / ReceiptFromShipmentGrid | pageSize | Y / Y / Y | 4 / 0 |
| 32858 | 42660 / ReceiptFromShipmentGrid | data-groupBy | Y / Y / Y | 10 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14145 / click | 42654 / ReceiptFromShipmentActionSave | _webUi.receiptFromShipTransaction.createReceiptFromShipment | Not populated | Y / Y |
| 14146 / click | 42655 / MenuActionSetReturnQuantityToZero | _webUi.receiptFromShipTransaction.setreturnedQuantityToZero | Not populated | Y / Y |
| 14147 / click | 42656 / MenuActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 14148 / igcomboselectionchanged | 42658 / ReceiptFromShipmentCompany | _webUi.receiptFromShipTransaction.OnDropdownChange | Not populated | Y / Y |
| 14149 / iggridselectionrowselectionchanging | 42660 / ReceiptFromShipmentGrid | _webUi.receiptFromShipTransaction.onRowSelectionChanging | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19332 / 14145 | PostServiceURL | Y / Y | 130 |
| 19333 / 14145 | queryParameter_IdField | Y / Y | 38 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 3 selected candidate rows for this Screen: **2 accepted tokens** and **1 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32848 | 42660 / Not applicable | data-formId | form_id | 3036 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19332 | 42654 / 14145 | PostServiceURL | relative_api_path | /inbound/scaleapi/ReceiptHeadersApi/Created-ReceiptsFromShipment? | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
