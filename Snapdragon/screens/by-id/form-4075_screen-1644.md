# Purchase Order — Form 4075, Screen 1644

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4075 |
| MAIN_UI_SCREEN Object ID | 1644 |
| Label / Form resource key | Purchase Order / MNU_TPMPURCHASEORDERENTRYDETAILS |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | tpm / 7 |
| Configured path | /tpm/details/tpmpurchaseorderentry |
| Candidate runtime URL | https://trav.manhscale.com/tpm/details/tpmpurchaseorderentry |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4075 |
| Inspection requirement | separate_portal |
| Form configuration table/view | PurchaseOrderHeaderView |
| Help page reference | TPMpurchaseorder.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4075 |
| Inspection time (UTC) | 2026-10-02T15:29:48.802Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_TPMPURCHASEORDERENTRYDETAILS |
| Observed configured table/view | PurchaseOrderHeaderView |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1644 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Purchase Order is recorded as `tpm`. Its saved configuration contains 1 parts, 7 groups, 25 controls, and 9 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3805 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | TpmPurchaseOrderMenuActionSave |

### Part 3805: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 15935 / TpmPurchaseOrderReferenceinfoTitleSubAccordion | 15934 | Reference Info / TPMREFERENCEINFO | 50 / 200 | Y / Y | Fixed to top=N; loading=2; nested unit=15934; default=None |
| 15932 / PurchaseOrderMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=15932; default=None |
| 15933 / TpmPurchaseOrderMenuPanel | 15932 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=15932; default=None |
| 15936 / TpmPurchaseOrderSourceSubAccordion | 15934 | Source / TPMSOURCE | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=15934; default=None |
| 15937 / TpmPurchaseOrderShipFromSubAccordion | 15934 | Ship From / TPMSHIPFROM | 50 / 300 | Y / Y | Fixed to top=N; loading=2; nested unit=15934; default=None |
| 15938 / TpmPurchaseOrderLinesSubAccordion | 15934 | Lines / TPMLINES | 50 / 350 | Y / Y | Fixed to top=N; loading=2; nested unit=15934; default=None |
| 15934 / TpmPurchaseOrderHeaderMainAccordion | Not populated | Not populated / Not populated | 140 / 2000 | Y / Y | Fixed to top=N; loading=2; nested unit=15934; default=None |

#### Group 15935: TpmPurchaseOrderReferenceinfoTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 46695 / TpmReferenceinfoPurchaseOrderIdValue | Purchase Order ID / TPMPURCHASEORDERID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 46696 / TpmReferenceinfoReceiptTypeValue | Receipt Type / TPMRECEIPTTYPE | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 46697 / TpmReferenceinfoWarehouseeValue | Warehouse / TPMWAREHOUSE | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 46698 / TpmReferenceInfoCompanyValue | Company / TPMCOMPANY | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 46699 / TpmReferenceInfoStatusValue | Not populated / TPMSTATUS  | 80 / 1100 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 15933: TpmPurchaseOrderMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 46692 / TpmPurchaseOrderMenuActionSubmit | Submit / TPMBTN_SUBMIT | 150 / 150 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TPMBTN_SUBMIT |
| 46694 / TpmPurchaseOrderSectionPurchaseOrderId | Not populated / Not populated | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 46693 / ActionCancel | Cancel / TPMBTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TPMBTN_CANCEL |

#### Group 15936: TpmPurchaseOrderSourceSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 46700 / TpmSourceSourceIdValue | Source / TPMSOURCE | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 46701 / TpmSourceNameValue | Name / TPMSOURCENAME | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 46702 / TpmSourceAddressValue | Address / TPMSOURCEADDRESS | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 46703 / TpmSourceCityValue | City / TPMSOURCECITY | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 46704 / TpmSourceStateValue | State / TPMSOURCESTATE | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 46705 / TpmSourcePostalCodeValue | Postal Code / TPMSOURCEPOSTALCODE | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 46706 / TpmSourceCountryValue | Country / TPMSOURCECOUNTRY | 80 / 1750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 15937: TpmPurchaseOrderShipFromSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 46707 / TpmShipFromValue | Ship From / TPMSHIPFROM | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 46708 / TpmShipFromSameasSource | Not populated / TPMSHIPFROMUSESOURCEADD  | 130 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 46709 / ShipFromNameValue | Name / TPMSHIPFROMNAME | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 46710 / TpmShipFromAddressValue | Address / TPMSHIPFROMADDRESS | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 46711 / ShipFromCityValue | City / TPMSHIPFROMNAMECITY | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 46712 / ShipFromStateValue | State / TPMSHIPFROMNAMESTATE | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 46713 / ShipFromPostalCodeValue | Postal Code / TPMSHIPFROMNAMEPOSTALCODE | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 46714 / ShipFromCountryValue | Country / TPMSHIPFROMNAMECOUNTRY | 80 / 1750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 15938: TpmPurchaseOrderLinesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 46715 / AttributesMenuActionAdd | Add / TPMBTN_ADD | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowWithNav-1; TOOL_TIP_RESOURCE_KEY=TPMBTN_ADD |
| 46716 / TpmPurchaseOrderLinesGrid | Lines / TPMLINES | 20 / 2000 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 46716 `TpmPurchaseOrderLinesGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16229 / Item | ITEM / Item / TPMITEM | 10 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16230 / ItemDesc | ITEM_DESC / Description / TPMDESCRIPTION | 10 / 10 / 30 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16231 / Company | COMPANY / Company / TPMCOMPANY | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16232 / OpenQuantity | OPEN_QUANTITY / Quantity / TPMQUANTITY | 20 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 16233 / QuantityUm | QUANTITY_UM / UM / TPMUM | 10 / 10 / 70 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16236 / ObjectId | OBJECT_ID / Object ID / OBJECTID | 20 / 10 / 80 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16237 / LineNumber | LINE_NUMBER / Line Number / TPMLINENUMBER | 20 / 10 / 90 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16234 / ICON | Not populated / Icon / ICON | 10 / 10 / 200 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16235 / COLOR | Not populated / Color / COLOR | 10 / 10 / 300 / 1 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 20 control attributes, 9 events, and 2 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 36345 | 46692 / TpmPurchaseOrderMenuActionSubmit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 36346 | 46693 / ActionCancel | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 36347 | 46695 / TpmReferenceinfoPurchaseOrderIdValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 36348 | 46695 / TpmReferenceinfoPurchaseOrderIdValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 36349 | 46697 / TpmReferenceinfoWarehouseeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 36350 | 46697 / TpmReferenceinfoWarehouseeValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 36351 | 46700 / TpmSourceSourceIdValue | Lookup | Y / Y / N | 436 / 0 |
| 36352 | 46707 / TpmShipFromValue | Lookup | Y / Y / N | 422 / 0 |
| 36353 | 46708 / TpmShipFromSameasSource | data-btn-true-resourceKey | Y / Y / N | 12 / 0 |
| 36354 | 46708 / TpmShipFromSameasSource | data-btn-false-resourceKey | Y / Y / N | 10 / 0 |
| 36355 | 46715 / AttributesMenuActionAdd | data-formId | Y / Y / N | 8 / 0 |
| 36356 | 46715 / AttributesMenuActionAdd | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 36357 | 46716 / TpmPurchaseOrderLinesGrid | data-modelClass | Y / Y / N | 134 / 0 |
| 36358 | 46716 / TpmPurchaseOrderLinesGrid | data-dbtable | Y / Y / N | 42 / 0 |
| 36359 | 46716 / TpmPurchaseOrderLinesGrid | data-headerkey | Y / Y / N | 48 / 0 |
| 36360 | 46716 / TpmPurchaseOrderLinesGrid | pageSize | Y / Y / Y | 4 / 0 |
| 36361 | 46716 / TpmPurchaseOrderLinesGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 36362 | 46716 / TpmPurchaseOrderLinesGrid | data-restdelete | Y / Y / Y | 2 / 0 |
| 36363 | 46716 / TpmPurchaseOrderLinesGrid | data-local | Y / Y / Y | 8 / 0 |
| 36364 | 46716 / TpmPurchaseOrderLinesGrid | data-groupBy | Y / Y / Y | 10 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 15761 / click | 46692 / TpmPurchaseOrderMenuActionSubmit | _webUi.tpmPurchaseOrderEntry.submit | Not populated | Y / Y |
| 15762 / click | 46693 / ActionCancel | _webUi.tpmPurchaseOrderEntry.cancel | Not populated | Y / Y |
| 15763 / igtexteditorvaluechanged | 46700 / TpmSourceSourceIdValue | _webUi.tpmPurchaseOrderEntry.sourceIdChanged | Not populated | Y / Y |
| 15764 / igtexteditorvaluechanged | 46707 / TpmShipFromValue | _webUi.tpmPurchaseOrderEntry.shipFromIdChanged | Not populated | Y / Y |
| 15765 / change | 46708 / TpmShipFromSameasSource | _webUi.tpmPurchaseOrderEntry.shipFromSameAsSource | Not populated | Y / Y |
| 15766 / click | 46715 / AttributesMenuActionAdd | _webUi.tpmPurchaseOrderEntry.addLines | Not populated | Y / Y |
| 15767 / iggridrendered | 46716 / TpmPurchaseOrderLinesGrid | _webUi.tpmPurchaseOrderEntry.loadLinesInGrid | Not populated | Y / Y |
| 15768 / iggriddatabound | 46716 / TpmPurchaseOrderLinesGrid | _webUi.tpmPurchaseOrderEntry.loadLinesInEditMode | Not populated | Y / Y |
| 15769 / iggridupdatingrowdeleting | 46716 / TpmPurchaseOrderLinesGrid | _webUi.tpmPurchaseOrderEntry.confirmLineDelete | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 22279 / 15766 | URL | Y / Y | 120 |
| 22280 / 15769 | CommitSelector | Y / Y | 34 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 6 selected candidate rows for this Screen: **5 accepted tokens** and **1 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 36345 | 46692 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36346 | 46693 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36355 | 46715 / Not applicable | data-formId | form_id | 4080 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36356 | 46715 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36358 | 46716 / Not applicable | data-dbtable | database_identifier | PURCHASE_ORDER_DETAIL | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
