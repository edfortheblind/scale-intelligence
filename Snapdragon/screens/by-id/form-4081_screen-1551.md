# Purchase Order Submitted — Form 4081, Screen 1551

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4081 |
| MAIN_UI_SCREEN Object ID | 1551 |
| Label / Form resource key | Purchase Order Submitted / MNU_TPMPURCHASEORDERSUBMITTEDTRANSACTION |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | tpm / 7 |
| Configured path | /tpm/trans/tpmpurchaseordersubmitted |
| Candidate runtime URL | https://trav.manhscale.com/tpm/trans/tpmpurchaseordersubmitted |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4081 |
| Inspection requirement | separate_portal |
| Form configuration table/view | MetaTrans_TpmSubmit |
| Help page reference | TPMpurchaseordersubmitted.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4081 |
| Inspection time (UTC) | 2026-10-02T15:29:56.883Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_TPMPURCHASEORDERSUBMITTEDTRANSACTION |
| Observed configured table/view | MetaTrans_TpmSubmit |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1551 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Purchase Order Submitted is recorded as `tpm`. Its saved configuration contains 1 parts, 3 groups, 10 controls, and 5 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3520 / MainDataPane | Not populated / Not populated | 10 / 25 | Y / Y / N | TpmOrderSubmitMenuActionSubmit |

### Part 3520: MainDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14726 / TpmReceiptSubmitMenu | Not populated | Not populated / Not populated | 70 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=14726; default=None |
| 14727 / TpmOrderSubmitMenuGroup | 14726 | Not populated / Not populated | 60 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=14726; default=None |
| 14728 / TpmOrderSubmitMainPanel | Not populated | Not populated / Not populated | 60 / 2000 | Y / Y | Fixed to top=N; loading=0; nested unit=14728; default=None |

#### Group 14727: TpmOrderSubmitMenuGroup — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42731 / ActionNew | New / BTN_TPMNEW | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_NEW |

#### Group 14728: TpmOrderSubmitMainPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42732 / TpmThanksSubmitReceiptConfirmLabel | Thanks for Submitting Your Purchase Order! / TPMTHANKSSUBMITPURCHASEORDER | 30 / 100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMPurchaseOrderSubmitted-15; TOOL_TIP_RESOURCE_KEY=None |
| 42733 / TpmPurchaseOrderId | Purchase Order ID / TPMPURCHASEORDERID | 30 / 200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMPurchaseOrderSubmitted-15; TOOL_TIP_RESOURCE_KEY=None |
| 42734 / TpmReceiptType | Receipt Type / TPMRECEIPTTYPE | 30 / 300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMPurchaseOrderSubmitted-15; TOOL_TIP_RESOURCE_KEY=None |
| 42735 / TpmCompany | Not populated / TpmCompany | 30 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMPurchaseOrderSubmitted-15; TOOL_TIP_RESOURCE_KEY=None |
| 42736 / tpmName | Name / TPMSHIPFROMNAME | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMPurchaseOrderSubmitted-15; TOOL_TIP_RESOURCE_KEY=None |
| 42737 / TpmWarehouse | Warehouse / TPMWAREHOUSE | 30 / 600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMPurchaseOrderSubmitted-15; TOOL_TIP_RESOURCE_KEY=None |
| 42738 / tpmAddress | Address / TPMSHIPTOADDRESS1 | 30 / 800 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMPurchaseOrderSubmitted-15; TOOL_TIP_RESOURCE_KEY=None |
| 42739 / LineNoValue | Number of Lines / TPMNUMBEROFLINES | 30 / 900 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMPurchaseOrderSubmitted-15; TOOL_TIP_RESOURCE_KEY=None |
| 42740 / PurchaseOrderHeaderLinesGrid | Not populated / Not populated | 20 / 1000 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMPurchaseOrderSubmitted-15; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 42740 `PurchaseOrderHeaderLinesGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14533 / Item | ITEM / Item / ITEM | 10 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14534 / ItemDesc | ITEM_DESC / Description / DESCRIPTION | 10 / 10 / 30 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14535 / Company | COMPANY / Company / COMPANY | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14536 / OpenQuantity | OPEN_QUANTITY / Quantity / QUANTITY | 20 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 14537 / QuantityUm | QUANTITY_UM / UM / UM | 10 / 10 / 70 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 7 control attributes, 3 events, and 0 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32893 | 42740 / PurchaseOrderHeaderLinesGrid | data-modelClass | Y / Y / N | 134 / 0 |
| 32894 | 42740 / PurchaseOrderHeaderLinesGrid | data-dbtable | Y / Y / N | 42 / 0 |
| 32895 | 42740 / PurchaseOrderHeaderLinesGrid | data-headerkey | Y / Y / N | 18 / 0 |
| 32896 | 42740 / PurchaseOrderHeaderLinesGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 32897 | 42740 / PurchaseOrderHeaderLinesGrid | pageSize | Y / Y / Y | 4 / 0 |
| 32898 | 42740 / PurchaseOrderHeaderLinesGrid | data-groupBy | Y / Y / Y | 10 / 0 |
| 32899 | 42740 / PurchaseOrderHeaderLinesGrid | data-local | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14173 / click | 42731 / ActionNew | _webUi.tpmPurchaseOrderSubmittedTransaction.newOrder | Not populated | Y / Y |
| 14174 / iggridrendered | 42740 / PurchaseOrderHeaderLinesGrid | _webUi.tpmPurchaseOrderSubmittedTransaction.loadLinesInGrid | Not populated | Y / Y |
| 14175 / iggriddatarendered | 42740 / PurchaseOrderHeaderLinesGrid | _webUi.Grid.gridDataRendered | Not populated | Y / Y |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 1 selected candidate rows for this Screen: **1 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32894 | 42740 / Not applicable | data-dbtable | database_identifier | PURCHASE_ORDER_DETAIL | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
