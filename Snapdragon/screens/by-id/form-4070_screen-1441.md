# Receipt Line — Form 4070, Screen 1441

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4070 |
| MAIN_UI_SCREEN Object ID | 1441 |
| Label / Form resource key | Receipt Line / MNU_TPMRECEIPTLINEENTRYDETAILS |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | tpm / 7 |
| Configured path | /tpm/details/tpmreceiptlineentry |
| Candidate runtime URL | https://trav.manhscale.com/tpm/details/tpmreceiptlineentry |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4070 |
| Inspection requirement | separate_portal |
| Form configuration table/view | ReceiptDetail |
| Help page reference | TPMRecieptLine.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4070 |
| Inspection time (UTC) | 2026-10-02T15:28:51.384Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_TPMRECEIPTLINEENTRYDETAILS |
| Observed configured table/view | ReceiptDetail |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1441 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Receipt Line is recorded as `tpm`. Its saved configuration contains 1 parts, 4 groups, 11 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3202 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | TpmReceiptLineEntryMenuActionSave |

### Part 3202: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 13531 / ReceiptLineItemInfoTitleSubAccordion | 13530 | Item Info / TPMITEMINFO | 50 / 200 | Y / Y | Fixed to top=N; loading=2; nested unit=13530; default=None |
| 13528 / TpmReceiptLineEntryMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13528; default=None |
| 13529 / TpmReceiptLineEntryMenuPanel | 13528 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13528; default=None |
| 13530 / TpmReceiptLineEntryMainAccordion | Not populated | Not populated / Not populated | 140 / 2000 | Y / Y | Fixed to top=N; loading=2; nested unit=13530; default=None |

#### Group 13531: ReceiptLineItemInfoTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39744 / ReceiptLineItemInfoItemValue | Item / TPMITEM | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 39745 / ReceiptLineItemInfoCompanyValue | Company / TPMCOMPANY | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 39746 / ItemInfoWebImage | Not populated / Not populated | 170 / 850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 39747 / ReceiptLineItemInfoDescription | Description / TPMDESCRIPTION | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 39748 / ItemInfoLotControlledValue | Lot Controlled / TPMLOTCONTROLLED | 130 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 39749 / ItemInfoLotValue | Lot / TPMLOT | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 39750 / ReceiptLineItemInfoCompanyValueQty | Quantity / TPMQUANTITY | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 39751 / ReceiptLineItemInfoQtyUMValue | UM / TPMUM | 80 / 2250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13529: TpmReceiptLineEntryMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39741 / TpmReceiptLineMenuActionSubmit | Save / TPMBTN_SAVE | 150 / 150 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TPMBTN_SAVE |
| 39743 / TpmReceiptDetailSectionItem | Not populated / Not populated | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 39742 / ActionCancel | Cancel / TPMBTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TPMBTN_CANCEL |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 10 control attributes, 3 events, and 2 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 30078 | 39741 / TpmReceiptLineMenuActionSubmit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 30079 | 39742 / ActionCancel | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 30080 | 39744 / ReceiptLineItemInfoItemValue | toUpper | Y / Y / Y | 8 / 0 |
| 30081 | 39744 / ReceiptLineItemInfoItemValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 30082 | 39744 / ReceiptLineItemInfoItemValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 30083 | 39744 / ReceiptLineItemInfoItemValue | Lookup | Y / Y / N | 76 / 0 |
| 30084 | 39749 / ItemInfoLotValue | toUpper | Y / Y / Y | 8 / 0 |
| 30085 | 39749 / ItemInfoLotValue | Lookup | Y / Y / N | 48 / 0 |
| 30086 | 39751 / ReceiptLineItemInfoQtyUMValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 30087 | 39751 / ReceiptLineItemInfoQtyUMValue | data-msg-required | Y / Y / Y | 18 / 1 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 12958 / click | 39741 / TpmReceiptLineMenuActionSubmit | _webUi.tpmReceiptLineEntryDetails.save | Not populated | Y / Y |
| 12959 / click | 39742 / ActionCancel | _webUi.tpmReceiptLineEntryDetails.cancel | Not populated | Y / Y |
| 12960 / igtexteditorvaluechanged | 39744 / ReceiptLineItemInfoItemValue | _webUi.tpmReceiptLineEntryDetails.itemValueChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 17494 / 12958 | URL | Y / Y | 64 |
| 17495 / 12959 | URL | Y / Y | 56 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 2 selected candidate rows for this Screen: **2 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 30078 | 39741 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 30079 | 39742 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
