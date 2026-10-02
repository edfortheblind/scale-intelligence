# Receipt From Purchase Order — Form 4052, Screen 1802

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4052 |
| MAIN_UI_SCREEN Object ID | 1802 |
| Label / Form resource key | Receipt From Purchase Order / MNU_RECEIPTFROMPOTRANSACTION |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/receiptFromPO |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/receiptFromPO |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4052 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | MetaTrans_GetReceiptFromPO |
| Help page reference | recFromPO.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4052 |
| Inspection time (UTC) | 2026-10-02T15:28:19.221Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_RECEIPTFROMPOTRANSACTION |
| Observed configured table/view | MetaTrans_GetReceiptFromPO |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1802 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Receipt From Purchase Order is recorded as `transaction_context`. Its saved configuration contains 1 parts, 7 groups, 25 controls, and 12 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4537 / MainDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | ReceiptFromPOActionSave |

### Part 4537: MainDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18602 / ReceiptFromPOMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=18602; default=None |
| 18603 / ReceiptFromPOMenuPanel | 18602 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=18602; default=None |
| 18605 / MainSubPanel | 18604 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18604; default=None |
| 18607 / ItemsSubAccordion | 18606 | Item Info / ITEMINFO | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=18606; default=None |
| 18604 / ReceiptFromPOMainPanel | Not populated | Not populated / Not populated | 60 / 400 | Y / Y | Fixed to top=N; loading=0; nested unit=18604; default=None |
| 18606 / ReceiptFromPOAccordion | Not populated | Not populated / Not populated | 40 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=18606; default=None |
| 18608 / SourceInfoSubAccordion | 18606 | Source / SOURCE | 50 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=18606; default=None |

#### Group 18603: ReceiptFromPOMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52701 / ReceiptFromPOPurchaseOrderIdValue | Purchase Order ID / PURCHASEORDERID | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 52702 / ReceiptFromPOActionSave | Save / BTN_SAVE | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 52703 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 18605: MainSubPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52704 / ReceiptIdValue | Receipt ID / RECEIPTID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 52705 / ReceiptFromPOCompany | Not populated / Company | 80 / 300 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 52706 / GoDirectlyToReceivingWorkbench | Go Directly to The Receipt Workbench / GODIRECTLYTORECWORKBENCH | 130 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18607: ItemsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52707 / ButtonUpdateAllLines | Update All Lines / UPDATEALLLINES | 150 / 125 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowWithNav-1; TOOL_TIP_RESOURCE_KEY=UPDATEALLLINES |
| 52708 / PercentageToggle | Percentage / PERCENTAGE | 130 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=ButtonUpdateAllLines; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 52709 / QuantityToggle | Quantity / QUANTITY | 130 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=ButtonUpdateAllLines; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 52710 / PercentageEditor | Not populated / Not populated | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=ButtonUpdateAllLines; LABEL_ORIENTATION=10; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 52711 / QuantityEditor | Not populated / Not populated | 90 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=ButtonUpdateAllLines; LABEL_ORIENTATION=10; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 52712 / ReceiptFromPOItemsGrid | Not populated / Not populated | 20 / 1250 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 52712 `ReceiptFromPOItemsGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 19036 / Icon | Not populated / Icon / ICON | 10 / 10 / 500 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19037 / Color | Not populated / Color / COLOR | 10 / 10 / 600 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19038 / Item | Item / Item / ITEM | 10 / 10 / 900 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19039 / Company | Company / Company / COMPANY | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19040 / Description | Description / Description / DESCRIPTION | 10 / 10 / 1100 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19041 / TotalQuantity | TotalQuantity / Total Qty / TOTALQTY | 20 / 10 / 1300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 19042 / AvailableQuantity | AvailableQuantity / Available Qty / AVAILABLEQTY | 20 / 10 / 1400 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 19043 / ReceiptQuantity | ReceiptQuantity / Receipt Qty / RECEIPTQTY | 20 / 10 / 1500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 19044 / QuantityUm | QuantityUm / UM / UM | 10 / 10 / 1600 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19045 / POHdrObjectId | POHdrObjectId / Object ID (Purchase Order Header) / POHEADEROBJECTID | 20 / 10 / 1700 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19046 / POLineObjectId | POLineObjectId / Object ID (Purchase Order Detail) / PODETAILOBJECTID | 20 / 10 / 1800 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 19047 / POLineNumber | POLineNumber / Line Number / LINENUMBER | 20 / 10 / 1900 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 18608: SourceInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 52713 / SourceInfoPurchaseOrderIdValue | ID / ID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 52714 / SourceInfoAttenTo | Attention To / ATTENTIONTO | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 52715 / SourceInfoName | Name / NAME | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 52716 / SourceInfoPhoneNum | Phone Number / PHONENUM | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 52717 / SourceInfoAddress1 | Address / ADDRESS | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 52718 / SourceInfoFaxNum | Fax Number / FAXNUM | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 52719 / SourceInfoAddress2 | Address 2 (Optional) / ADDRESS2 | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 52720 / SourceInfoEmail | Email Address / EMAILADDRESS | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 52721 / SourceInfoAddress3 | Address 3 (Optional) / ADDRESS3 | 10 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 52722 / SourceCity | City / CITY | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 52723 / SourceState | State / STATE | 80 / 2750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 52724 / SourceZip | Postal Code / POSTALCODE | 10 / 3000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 52725 / SourceCountry | Country / COUNTRY | 80 / 3250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 15 control attributes, 6 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 41828 | 52704 / ReceiptIdValue | Lookup | Y / Y / N | 70 / 0 |
| 41829 | 52704 / ReceiptIdValue | toUpper | Y / Y / Y | 8 / 0 |
| 41830 | 52710 / PercentageEditor | minValue | Y / Y / Y | 2 / 0 |
| 41831 | 52712 / ReceiptFromPOItemsGrid | data-local | Y / Y / Y | 8 / 0 |
| 41832 | 52712 / ReceiptFromPOItemsGrid | data-formId | Y / Y / Y | 8 / 0 |
| 41833 | 52712 / ReceiptFromPOItemsGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 41834 | 52712 / ReceiptFromPOItemsGrid | data-modelClass | Y / Y / N | 116 / 0 |
| 41835 | 52712 / ReceiptFromPOItemsGrid | data-addRowRequired | Y / Y / Y | 2 / 0 |
| 41836 | 52712 / ReceiptFromPOItemsGrid | data-editValueRequired | Y / Y / Y | 30 / 0 |
| 41837 | 52712 / ReceiptFromPOItemsGrid | data-restupdate | Y / Y / Y | 0 / 0 |
| 41838 | 52712 / ReceiptFromPOItemsGrid | data-dbObjectType | Y / Y / N | 4 / 0 |
| 41839 | 52712 / ReceiptFromPOItemsGrid | data-restrictionsProcessor | Y / Y / Y | 68 / 0 |
| 41840 | 52712 / ReceiptFromPOItemsGrid | data-headerkey | Y / Y / N | 16 / 0 |
| 41841 | 52712 / ReceiptFromPOItemsGrid | pageSize | Y / Y / Y | 4 / 0 |
| 41842 | 52712 / ReceiptFromPOItemsGrid | data-groupBy | Y / Y / Y | 10 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18650 / click | 52702 / ReceiptFromPOActionSave | _webUi.receiptFromPOTransaction.createReceiptFromPO | Not populated | Y / Y |
| 18651 / click | 52703 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 18652 / click | 52707 / ButtonUpdateAllLines | _webUi.receiptFromPOTransaction.updateAllLinesClicked | Not populated | Y / Y |
| 18653 / change | 52708 / PercentageToggle | _webUi.receiptFromPOTransaction.percentageToggleChanged | Not populated | Y / Y |
| 18654 / change | 52709 / QuantityToggle | _webUi.receiptFromPOTransaction.quantityToggleChanged | Not populated | Y / Y |
| 18655 / iggridselectionrowselectionchanging | 52712 / ReceiptFromPOItemsGrid | _webUi.receiptFromPOTransaction.onRowSelectionChanging | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 27747 / 18650 | PostServiceURL | Y / Y | 116 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 3 selected candidate rows for this Screen: **2 accepted tokens** and **1 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 41832 | 52712 / Not applicable | data-formId | form_id | 4052 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 27747 | 52702 / 18650 | PostServiceURL | relative_api_path | /inbound/scaleapi/ReceiptHeadersApi/Created-ReceiptsFromPO | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
