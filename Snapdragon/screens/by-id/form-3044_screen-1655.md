# Split Shipment — Form 3044, Screen 1655

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3044 |
| MAIN_UI_SCREEN Object ID | 1655 |
| Label / Form resource key | Split Shipment / MNU_SPLITSHIPMENTTRANSACTION |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/splitshipment |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/splitshipment |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3044 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | MetaTrans_SplitShipment |
| Help page reference | SplitLau.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3044 |
| Inspection time (UTC) | 2026-10-02T15:25:58.463Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_SPLITSHIPMENTTRANSACTION |
| Observed configured table/view | MetaTrans_SplitShipment |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1655 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Split Shipment is recorded as `transaction_context`. Its saved configuration contains 1 parts, 3 groups, 4 controls, and 12 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3851 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | Not populated |

### Part 3851: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16103 / SplitShipmentMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16103; default=None |
| 16104 / SplitShipmentMenuPanel | 16103 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16103; default=None |
| 16105 / SplitShipmentMainPanel | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=16105; default=None |

#### Group 16104: SplitShipmentMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47107 / SplitShipmentShipmentIdValue | Shipment ID / SHIPMENTID | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 47108 / SplitShipmentMenuActionSplit | Split / BTN_SPLIT | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_SPLIT |
| 47109 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 16105: SplitShipmentMainPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47110 / SplitAreaGrid | Not populated / Not populated | 20 / 750 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 47110 `SplitAreaGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16499 / ICON | Not populated / Icon / ICON | 10 / 10 / 500 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16500 / COLOR | Not populated / Color / COLOR | 10 / 10 / 600 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16501 / ERPOrder | ERP_ORDER / ERP Order / ERPORDER | 10 / 10 / 700 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16502 / OrderLineNumber | ERP_ORDER_LINE_NUM / Order Line Number / ORDERLINENUMBER | 20 / 10 / 800 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16503 / SplitQuantity | SPLIT_QUANTITY / Split Quantity / SPLITQUANTITY | 20 / 10 / 900 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 16504 / Item | Item / Item / ITEM | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16505 / Description | ITEM_DESC / Description / DESCRIPTION | 10 / 10 / 1100 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16506 / CustomentPO | CUSTOMER_PO / Customer PO / CUSTOMERPO | 10 / 10 / 1200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16507 / Quantity | QUANTITY_AT_STS1 / Quantity / QUANTITY | 20 / 10 / 1300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 16508 / QuantityUM | QUANTITY_UM / UM / UM | 10 / 10 / 1400 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16509 / InternalShipmentNum | INTERNAL_SHIPMENT_NUM / Not populated / InternalShipmentNum | 10 / 10 / 1500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16510 / InternalShipmentLineNum | Not populated / Not populated / InternalShipmentLineNum | 20 / 10 / 1600 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 16 control attributes, 4 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 36801 | 47108 / SplitShipmentMenuActionSplit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 36802 | 47110 / SplitAreaGrid | data-formId | Y / Y / Y | 8 / 0 |
| 36803 | 47110 / SplitAreaGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 36804 | 47110 / SplitAreaGrid | data-modelClass | Y / Y / N | 106 / 0 |
| 36805 | 47110 / SplitAreaGrid | data-addRowRequired | Y / Y / Y | 2 / 0 |
| 36806 | 47110 / SplitAreaGrid | data-editValueRequired | Y / Y / Y | 26 / 0 |
| 36807 | 47110 / SplitAreaGrid | data-restupdate | Y / Y / Y | 0 / 0 |
| 36808 | 47110 / SplitAreaGrid | data-dbtable | Y / Y / N | 38 / 0 |
| 36809 | 47110 / SplitAreaGrid | data-restrictionsProcessor | Y / Y / Y | 66 / 0 |
| 36810 | 47110 / SplitAreaGrid | data-headerkey | Y / Y / N | 42 / 0 |
| 36811 | 47110 / SplitAreaGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 36812 | 47110 / SplitAreaGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 36813 | 47110 / SplitAreaGrid | data-groupBy | Y / Y / Y | 10 / 0 |
| 36814 | 47110 / SplitAreaGrid | pageSize | Y / Y / Y | 4 / 0 |
| 36815 | 47110 / SplitAreaGrid | data-local | Y / Y / Y | 8 / 0 |
| 36816 | 47110 / SplitAreaGrid | data-AutoCommit | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 15974 / click | 47108 / SplitShipmentMenuActionSplit | _webUi.splitShipment.invokePOSTWebService | Not populated | Y / Y |
| 15975 / click | 47109 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 15976 / iggridselectionrowselectionchanging | 47110 / SplitAreaGrid | _webUi.splitShipment.activeCellFocus | Not populated | Y / Y |
| 15977 / iggridupdatingeditcellending | 47110 / SplitAreaGrid | _webUi.splitShipment.activeCellLoseFocus | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 22671 / 15974 | POSTServiceURL | Y / Y | 154 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 5 selected candidate rows for this Screen: **3 accepted tokens** and **2 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 36801 | 47108 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36802 | 47110 / Not applicable | data-formId | form_id | 3044 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36808 | 47110 / Not applicable | data-dbtable | database_identifier | SPLIT_SHIPMENT_VIEW | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
