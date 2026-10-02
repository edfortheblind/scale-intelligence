# Order Submitted — Form 4061, Screen 1437

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4061 |
| MAIN_UI_SCREEN Object ID | 1437 |
| Label / Form resource key | Order Submitted / MNU_TPMORDERSUBMITDETAILS |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | tpm / 7 |
| Configured path | /tpm/details/tpmordersubmit |
| Candidate runtime URL | https://trav.manhscale.com/tpm/details/tpmordersubmit |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4061 |
| Inspection requirement | separate_portal |
| Form configuration table/view | OrderHeader |
| Help page reference | Not populated |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4061 |
| Inspection time (UTC) | 2026-10-02T15:28:32.318Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_TPMORDERSUBMITDETAILS |
| Observed configured table/view | OrderHeader |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1437 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Order Submitted is recorded as `tpm`. Its saved configuration contains 1 parts, 3 groups, 12 controls, and 11 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3198 / MainDataPane | Not populated / Not populated | 10 / 25 | Y / Y / N | TpmOrderSubmitMenuActionSubmit |

### Part 3198: MainDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 13507 / TpmOrderSubmitMenu | Not populated | Not populated / Not populated | 70 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=13507; default=None |
| 13508 / TpmOrderSubmitMenuGroup | 13507 | Not populated / Not populated | 60 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=13507; default=None |
| 13509 / TpmOrderSubmitMainPanel | Not populated | Not populated / Not populated | 60 / 2000 | Y / Y | Fixed to top=N; loading=0; nested unit=13509; default=None |

#### Group 13508: TpmOrderSubmitMenuGroup — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39670 / ActionNew | New / BTN_TPMNEW | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_NEW |

#### Group 13509: TpmOrderSubmitMainPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 39671 / TpmOrderSubmitConfirmLabel | Thanks for Submitting Your Order! / TPMTHANKSSUBMITORDER | 30 / 100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMOrderSubmit-15; TOOL_TIP_RESOURCE_KEY=None |
| 39672 / OrderNum | Order Number / TPMORDERNUMBER | 30 / 200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMOrderSubmit-15; TOOL_TIP_RESOURCE_KEY=None |
| 39673 / SourceCompanyValue | Company / TPMCOMPANY | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMOrderSubmit-15; TOOL_TIP_RESOURCE_KEY=None |
| 39674 / ShiptoNameValue | Name / TPMSHIPTONAME | 30 / 600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMOrderSubmit-15; TOOL_TIP_RESOURCE_KEY=None |
| 39675 / CarrierCarrierValue | Carrier / TPMCARRIER | 30 / 700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMOrderSubmit-15; TOOL_TIP_RESOURCE_KEY=None |
| 39676 / ShiptoAddressValue | Address / TPMSHIPTOADDRESS1 | 30 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMOrderSubmit-15; TOOL_TIP_RESOURCE_KEY=None |
| 39677 / CarrierCarrierServiceValue | Carrier Service / CARRIERSERVICE | 30 / 800 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMOrderSubmit-15; TOOL_TIP_RESOURCE_KEY=None |
| 39678 / ReferenceinfoReqDeliveryDate | Requested Delivery Date / TPMREQDELIVERYDATE | 30 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMOrderSubmit-15; TOOL_TIP_RESOURCE_KEY=None |
| 39679 / LineNoValue | Number of Lines / TPMNUMBEROFLINES | 30 / 1850 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMOrderSubmit-15; TOOL_TIP_RESOURCE_KEY=None |
| 39680 / OrderHeaderLinesGrid | Not populated / Not populated | 20 / 2000 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMOrderSubmit-15; TOOL_TIP_RESOURCE_KEY=None |
| 39681 / OrderHeaderCommentsGrid | Not populated / Not populated | 20 / 3000 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlTPMOrderSubmit-15; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 39680 `OrderHeaderLinesGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 13227 / Item | ITEM / Item / ITEM | 10 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13228 / ItemDesc | ITEM_DESC / Description / DESCRIPTION | 10 / 10 / 30 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13229 / Company | COMPANY / Company / COMPANY | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13230 / OpenQty | OPEN_QTY / Quantity / QUANTITY | 20 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 13231 / QuantityUm | QUANTITY_UM / UM / UM | 10 / 10 / 70 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

Grid columns for control 39681 `OrderHeaderCommentsGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 13232 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13233 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13234 / CommentType | COMMENT_TYPE / Comment Type / COMMENTTYPE | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=60 |
| 13235 / Text | Text / Comments / TEXT | 10 / 10 / 20 / 500 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13236 / InternalCommentId | Internal_Comment_Id / Internal Comment ID / INTERNALCOMMENTID | 20 / 10 / 40 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13237 / InternalNum | Internal_Num / Internal Number / INTERNALNUM | 20 / 10 / 50 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 8 control attributes, 3 events, and 0 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 30021 | 39680 / OrderHeaderLinesGrid | data-modelClass | Y / Y / N | 118 / 0 |
| 30022 | 39680 / OrderHeaderLinesGrid | data-dbtable | Y / Y / N | 24 / 0 |
| 30023 | 39680 / OrderHeaderLinesGrid | data-headerkey | Y / Y / N | 36 / 0 |
| 30024 | 39680 / OrderHeaderLinesGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 30025 | 39681 / OrderHeaderCommentsGrid | data-modelClass | Y / Y / N | 100 / 0 |
| 30026 | 39681 / OrderHeaderCommentsGrid | data-dbtable | Y / Y / N | 24 / 0 |
| 30027 | 39681 / OrderHeaderCommentsGrid | data-headerkey | Y / Y / N | 24 / 0 |
| 30028 | 39681 / OrderHeaderCommentsGrid | data-loadDefaults | Y / Y / N | 10 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 12935 / click | 39670 / ActionNew | _webUi.tpmOrderSubmitDetails.newOrder | Not populated | Y / Y |
| 12936 / iggridrendered | 39680 / OrderHeaderLinesGrid | _webUi.tpmOrderSubmitDetails.loadLinesInGrid | Not populated | Y / Y |
| 12937 / iggridrendered | 39681 / OrderHeaderCommentsGrid | _webUi.tpmOrderSubmitDetails.loadCommentsInGrid | Not populated | Y / Y |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 2 selected candidate rows for this Screen: **2 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 30022 | 39680 / Not applicable | data-dbtable | database_identifier | ORDER_DETAIL | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 30026 | 39681 / Not applicable | data-dbtable | database_identifier | COMMENT_TEXT | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
