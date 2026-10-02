# Receipt From Purchase Order — Form 4085, Screen 1552

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4085 |
| MAIN_UI_SCREEN Object ID | 1552 |
| Label / Form resource key | Receipt From Purchase Order / MNU_TPMRECEIPTFROMPOTRANSACTION |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | tpm / 7 |
| Configured path | /tpm/trans/tpmReceiptFromPO |
| Candidate runtime URL | https://trav.manhscale.com/tpm/trans/tpmReceiptFromPO |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4085 |
| Inspection requirement | separate_portal |
| Form configuration table/view | MetaTrans_GetTpmReceiptFromPO |
| Help page reference | TPMRecieptFromPO.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4085 |
| Inspection time (UTC) | 2026-10-02T15:29:58.908Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_TPMRECEIPTFROMPOTRANSACTION |
| Observed configured table/view | MetaTrans_GetTpmReceiptFromPO |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1552 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Receipt From Purchase Order is recorded as `tpm`. Its saved configuration contains 1 parts, 7 groups, 13 controls, and 12 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3521 / MainDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | TpmReceiptFromPOActionSave |

### Part 3521: MainDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14729 / TpmReceiptFromPOMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14729; default=None |
| 14730 / TpmReceiptFromPOMenuPanel | 14729 | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=Y; loading=0; nested unit=14729; default=None |
| 14731 / ReceiptFromPOMainPanel | Not populated | Not populated / Not populated | 60 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=14731; default=None |
| 14732 / MainSubPanel | 14731 | Not populated / Not populated | 60 / 1000 | Y / Y | Fixed to top=N; loading=0; nested unit=14731; default=None |
| 14733 / ReceiptFromPOAccordion | Not populated | Not populated / Not populated | 40 / 1250 | Y / Y | Fixed to top=N; loading=1; nested unit=14733; default=None |
| 14734 / TpmShipFromInfoSubAccordion | 14733 | Ship From / TPMSHIPFROM | 50 / 1500 | Y / Y | Fixed to top=N; loading=2; nested unit=14733; default=None |
| 14735 / TpmItemsSubAccordion | 14733 | Item Info / TPMITEMINFO | 50 / 1750 | Y / Y | Fixed to top=N; loading=2; nested unit=14733; default=None |

#### Group 14730: TpmReceiptFromPOMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42741 / TpmReceiptFromPOPurchaseOrderIdValue | Purchase Order ID / TPMPURCHASEORDERID | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 42742 / TpmReceiptFromPOActionSubmit | Submit / TPMBTN_SUBMIT | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=TPMBTN_SUBMIT |
| 42743 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 14732: MainSubPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42744 / TpmReceiptFromPOCompany | Company / TPMCOMPANY | 80 / 300 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42745 / TpmReceiptFromPOWarehouse | Warehouse / TPMWAREHOUSE | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14734: TpmShipFromInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42746 / ShipFromInfo | Ship From / TPMSHIPFROM | 10 / 100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 42747 / ShipFromInfoName | Name / TPMSHIPFROMNAME | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42748 / ShipFromInfoAddress | Address / TPMSHIPFROMADDRESS | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 42749 / ShipFromCity | City / TPMSHIPFROMNAMECITY | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42750 / ShipFromState | State / TPMSHIPFROMNAMESTATE | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 42751 / ShipFromPostalCode | Postal Code / TPMSHIPFROMNAMEPOSTALCODE | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42752 / ShipFromCountry | Country / TPMSHIPFROMNAMECOUNTRY | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14735: TpmItemsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42753 / TpmReceiptFromPOItemsGrid | Not populated / Not populated | 20 / 1250 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 42753 `TpmReceiptFromPOItemsGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14538 / Item | Item / Item / TPMITEM | 10 / 10 / 100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14539 / Company | Company / Company / TPMCOMPANY | 10 / 10 / 200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14540 / Description | Description / Description / TPMDESCRIPTION | 10 / 10 / 300 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14541 / TotalQuantity | TotalQuantity / Total Quantity / TPMTOTALQUANTITY | 20 / 10 / 400 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 14542 / AvailableQuantity | AvailableQuantity / Available Quantity / TPMAVAILABLEQUANTITY | 20 / 10 / 500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 14543 / ReceiptQuantity | ReceiptQuantity / Receipt Quantity / TPMRECEIPTQUANTITY | 20 / 10 / 600 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 14544 / QuantityUm | QuantityUm / UM / TPMUM | 10 / 10 / 700 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14545 / POHdrObjectId | POHdrObjectId / Object ID (Purchase Order Header) / TPMPOHEADEROBJECTID | 20 / 10 / 800 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14546 / POLineObjectId | POLineObjectId / Object ID (Purchase Order Detail) / TPMPODETAILOBJECTID | 20 / 10 / 900 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14547 / POLineNumber | POLineNumber / Line Number / TPMLINENUMBER | 20 / 10 / 1000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14548 / Icon | Not populated / Icon / ICON | 10 / 10 / 1500 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14549 / Color | Not populated / Color / COLOR | 10 / 10 / 2000 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 12 control attributes, 4 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32900 | 42746 / ShipFromInfo | Lookup | Y / Y / N | 364 / 0 |
| 32901 | 42753 / TpmReceiptFromPOItemsGrid | data-local | Y / Y / Y | 8 / 0 |
| 32902 | 42753 / TpmReceiptFromPOItemsGrid | data-formId | Y / Y / Y | 8 / 0 |
| 32903 | 42753 / TpmReceiptFromPOItemsGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 32904 | 42753 / TpmReceiptFromPOItemsGrid | data-modelClass | Y / Y / N | 116 / 0 |
| 32905 | 42753 / TpmReceiptFromPOItemsGrid | data-addRowRequired | Y / Y / Y | 2 / 0 |
| 32906 | 42753 / TpmReceiptFromPOItemsGrid | data-editValueRequired | Y / Y / Y | 30 / 0 |
| 32907 | 42753 / TpmReceiptFromPOItemsGrid | data-restupdate | Y / Y / Y | 0 / 0 |
| 32908 | 42753 / TpmReceiptFromPOItemsGrid | data-dbObjectType | Y / Y / N | 4 / 0 |
| 32909 | 42753 / TpmReceiptFromPOItemsGrid | data-headerkey | Y / Y / N | 16 / 0 |
| 32910 | 42753 / TpmReceiptFromPOItemsGrid | pageSize | Y / Y / Y | 4 / 0 |
| 32911 | 42753 / TpmReceiptFromPOItemsGrid | data-groupBy | Y / Y / Y | 10 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14176 / click | 42742 / TpmReceiptFromPOActionSubmit | _webUi.tpmReceiptFromPOTransaction.createReceiptFromPO | Not populated | Y / Y |
| 14177 / click | 42743 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 14178 / igtexteditorvaluechanged | 42746 / ShipFromInfo | _webUi.tpmReceiptFromPOTransaction.shipFromIdChanged | Not populated | Y / Y |
| 14179 / iggridupdatingeditcellended | 42753 / TpmReceiptFromPOItemsGrid | _webUi.tpmReceiptFromPOTransaction.activeCellLoseFocus | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19336 / 14176 | PostServiceURL | Y / Y | 112 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 3 selected candidate rows for this Screen: **2 accepted tokens** and **1 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32902 | 42753 / Not applicable | data-formId | form_id | 4085 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19336 | 42742 / 14176 | PostServiceURL | relative_api_path | /inbound/scaleapi/TpmReceiptApi/CreatedTpmReceiptsFromPO | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
