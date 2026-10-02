# Receipt — Form 4064, Screen 1440

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4064 |
| MAIN_UI_SCREEN Object ID | 1440 |
| Label / Form resource key | Receipt / MNU_TPMRECEIPTENTRYDETAILS |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | tpm / 7 |
| Configured path | /tpm/details/tpmreceiptentry |
| Candidate runtime URL | https://trav.manhscale.com/tpm/details/tpmreceiptentry |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4064 |
| Inspection requirement | separate_portal |
| Form configuration table/view | ReceiptHeaderView |
| Help page reference | TPMReciept.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4064 |
| Inspection time (UTC) | 2026-10-02T15:28:36.501Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_TPMRECEIPTENTRYDETAILS |
| Observed configured table/view | ReceiptHeaderView |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1440 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Receipt is recorded as `tpm`. Its saved configuration contains 1 parts, 7 groups, 25 controls, and 9 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3201 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | TpmReceiptHeaderMenuActionSave |

### Part 3201: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 13524 / TpmReceiptHeaderReferenceinfoTitleSubAccordion | 13523 | Reference Info / TPMREFERENCEINFO | 50 / 200 | Y / Y | Fixed to top=N; loading=2; nested unit=13523; default=None |
| 13521 / ReceiptMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13521; default=None |
| 13522 / TpmReceiptHeaderMenuPanel | 13521 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13521; default=None |
| 13525 / TpmReceiptHeaderSourceTitleSubAccordion | 13523 | Source / TPMSOURCE | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=13523; default=None |
| 13526 / TpmReceiptHeaderShipFromTitleSubAccordion | 13523 | Ship From / TPMSHIPFROM | 50 / 300 | Y / Y | Fixed to top=N; loading=2; nested unit=13523; default=None |
| 13527 / TpmReceiptHeaderLinesSubAccordion | 13523 | Lines / TPMLINES | 50 / 350 | Y / Y | Fixed to top=N; loading=2; nested unit=13523; default=None |
| 13523 / TpmReceiptHeaderDetailMainAccordion | Not populated | Not populated / Not populated | 140 / 2000 | Y / Y | Fixed to top=N; loading=2; nested unit=13523; default=None |

#### Group 13524: TpmReceiptHeaderReferenceinfoTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39719 / TpmReferenceinfoReceiptidValue | Receipt ID / TPMRECEIPTID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39720 / TpmReferenceinfoReceiptidtypeValue | Receipt ID Type / TPMRECEIPTIDTYPE | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39721 / TpmReferenceinfoWarehouseValue | Warehouse / TPMWAREHOUSE | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39722 / ReceiptCompanyValue | Company / TPMCOMPANY | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39723 / ReferenceinfoPurchaseorderidValue | Purchase Order ID / TPMPURCHASEORDERID | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13522: TpmReceiptHeaderMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39716 / TpmReceiptHeaderMenuActionSubmit | Submit / TPMBTN_SUBMIT | 150 / 150 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TPMBTN_SUBMIT |
| 39718 / TpmReceiptHeaderSectionReceiptId | Not populated / Not populated | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 39717 / ActionCancel | Cancel / TPMBTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TPMBTN_CANCEL |

#### Group 13525: TpmReceiptHeaderSourceTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39724 / TpmSourceSourceIdValue | Source / TPMSOURCE | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 39725 / TpmSourceNameValue | Name / TPMSOURCENAME | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39726 / TpmSourceAddressValue | Address / TPMSOURCEADDRESS | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39727 / TpmSourceCityValue | City / TPMSOURCECITY | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39728 / TpmSourceStateValue | State / TPMSOURCESTATE | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 39729 / TpmSourcePostalCodeValue | Postal Code / TPMSOURCEPOSTALCODE | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39730 / TpmSourceCountryValue | Country / TPMSOURCECOUNTRY | 80 / 1750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13526: TpmReceiptHeaderShipFromTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39731 / TpmShipFromValue | Ship From / TPMSHIPFROM | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 39732 / TpmShipFromSameasSourceValue | Use Source Address / TPMSHIPFROMUSESOURCEADD | 130 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39733 / TpmShipFromNameValue | Name / TPMSHIPFROMNAME | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39734 / TpmShipFromAddressValue | Address / TPMSHIPFROMADDRESS | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39735 / TpmShipFromCityValue | City / TPMSHIPFROMNAMECITY | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39736 / TpmShipFromStateValue | State / TPMSHIPFROMNAMESTATE | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 39737 / TpmShipFromPostalCodeValue | Postal Code / TPMSHIPFROMNAMEPOSTALCODE | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39738 / TpmShipFromCountryValue | Country / TPMSHIPFROMNAMECOUNTRY | 80 / 1750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13527: TpmReceiptHeaderLinesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39739 / AttributesMenuActionAdd | Add / TPMBTN_ADD | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowWithNav-1; TOOL_TIP_RESOURCE_KEY=TPMBTN_ADD |
| 39740 / TpmReceiptHeaderLinesGrid | Lines / TPMLINES | 20 / 2000 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 39740 `TpmReceiptHeaderLinesGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 13249 / Item | ITEM / Item / TPMITEM | 10 / 10 / 20 / 100 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13250 / ItemDesc | ITEM_DESC / Description / TPMDESCRIPTION | 10 / 10 / 30 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13251 / Company | COMPANY / Company / TPMCOMPANY | 10 / 10 / 40 / 130 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13252 / OpenQty | OPEN_QTY / Quantity / TPMQUANTITY | 20 / 10 / 50 / 120 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 13253 / QuantityUm | QUANTITY_UM / UM / TPMUM | 10 / 10 / 70 / 100 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13254 / ErpOrderLineNum | ERP_ORDER_LINE_NUM / Object ID / OBJECTID | 20 / 10 / 80 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13247 / ICON | Not populated / Icon / ICON | 10 / 10 / 90 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13255 / InternalReceiptLineNum | INTERNAL_RECEIPT_LINE_NUM / Internal Receipt Line Number / TPMINTERNALRECEIPTLINENUM | 20 / 10 / 90 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13248 / COLOR | Not populated / Color / COLOR | 10 / 10 / 100 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 21 control attributes, 8 events, and 2 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 30057 | 39716 / TpmReceiptHeaderMenuActionSubmit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 30058 | 39717 / ActionCancel | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 30059 | 39719 / TpmReferenceinfoReceiptidValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 30060 | 39719 / TpmReferenceinfoReceiptidValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 30061 | 39720 / TpmReferenceinfoReceiptidtypeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 30062 | 39720 / TpmReferenceinfoReceiptidtypeValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 30063 | 39721 / TpmReferenceinfoWarehouseValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 30064 | 39721 / TpmReferenceinfoWarehouseValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 30065 | 39724 / TpmSourceSourceIdValue | Lookup | Y / Y / N | 436 / 0 |
| 30066 | 39731 / TpmShipFromValue | Lookup | Y / Y / N | 452 / 0 |
| 30067 | 39732 / TpmShipFromSameasSourceValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 30068 | 39732 / TpmShipFromSameasSourceValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 30069 | 39739 / AttributesMenuActionAdd | data-formId | Y / Y / N | 8 / 0 |
| 30070 | 39739 / AttributesMenuActionAdd | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 30071 | 39740 / TpmReceiptHeaderLinesGrid | data-modelClass | Y / Y / N | 122 / 0 |
| 30072 | 39740 / TpmReceiptHeaderLinesGrid | data-dbtable | Y / Y / N | 28 / 0 |
| 30073 | 39740 / TpmReceiptHeaderLinesGrid | data-headerkey | Y / Y / N | 40 / 0 |
| 30074 | 39740 / TpmReceiptHeaderLinesGrid | pageSize | Y / Y / Y | 4 / 0 |
| 30075 | 39740 / TpmReceiptHeaderLinesGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 30076 | 39740 / TpmReceiptHeaderLinesGrid | data-restdelete | Y / Y / Y | 2 / 0 |
| 30077 | 39740 / TpmReceiptHeaderLinesGrid | data-local | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 12950 / click | 39716 / TpmReceiptHeaderMenuActionSubmit | _webUi.tpmReceiptEntryDetails.submit | Not populated | Y / Y |
| 12951 / click | 39717 / ActionCancel | _webUi.tpmReceiptEntryDetails.cancel | Not populated | Y / Y |
| 12952 / igtexteditorvaluechanged | 39724 / TpmSourceSourceIdValue | _webUi.tpmReceiptEntryDetails.sourceIdChanged | Not populated | Y / Y |
| 12953 / igtexteditorvaluechanged | 39731 / TpmShipFromValue | _webUi.tpmReceiptEntryDetails.shipFromIdChanged | Not populated | Y / Y |
| 12954 / change | 39732 / TpmShipFromSameasSourceValue | _webUi.tpmReceiptEntryDetails.shipFromSameAsSource | Not populated | Y / Y |
| 12955 / click | 39739 / AttributesMenuActionAdd | _webUi.tpmReceiptEntryDetails.addLines | Not populated | Y / Y |
| 12956 / iggridrendered | 39740 / TpmReceiptHeaderLinesGrid | _webUi.tpmReceiptEntryDetails.loadLinesInGrid | Not populated | Y / Y |
| 12957 / iggridupdatingrowdeleting | 39740 / TpmReceiptHeaderLinesGrid | _webUi.tpmReceiptEntryDetails.confirmLineDelete | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 17492 / 12955 | URL | Y / Y | 108 |
| 17493 / 12957 | CommitSelector | Y / Y | 34 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 6 selected candidate rows for this Screen: **5 accepted tokens** and **1 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 30057 | 39716 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 30058 | 39717 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 30069 | 39739 / Not applicable | data-formId | form_id | 3035 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 30070 | 39739 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 30072 | 39740 / Not applicable | data-dbtable | database_identifier | RECEIPT_DETAIL | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
