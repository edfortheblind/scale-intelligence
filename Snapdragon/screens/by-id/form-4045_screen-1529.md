# Location Unit of Measure — Form 4045, Screen 1529

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4045 |
| MAIN_UI_SCREEN Object ID | 1529 |
| Label / Form resource key | Location Unit of Measure / MNU_LOCATIONUNITMEASURETRANSACTION |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/locationunitmeasure |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/locationunitmeasure |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4045 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | MetaTrans_GetLocationInventory |
| Help page reference | LocationUM.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4045 |
| Inspection time (UTC) | 2026-10-02T15:27:56.440Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_LOCATIONUNITMEASURETRANSACTION |
| Observed configured table/view | MetaTrans_GetLocationInventory |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1529 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Location Unit of Measure is recorded as `transaction_context`. Its saved configuration contains 1 parts, 5 groups, 8 controls, and 9 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3491 / CrudDataPane | Not populated / Not populated | 10 / 25 | Y / Y / N | TransferShipmentMenuActionSave |

### Part 3491: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14609 / TransferShipmentMenu | Not populated | Not populated / Not populated | 70 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=14609; default=None |
| 14610 / TransferShipmentMenuGroup | 14609 | Not populated / Not populated | 60 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=14609; default=None |
| 14611 / TransferShipmentMainAccordion | Not populated | Not populated / Not populated | 40 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=14611; default=None |
| 14612 / LocationUMOverrideValuesSubAccordion | 14611 | Override Values / OVERRIDEVALUES | 50 / 2000 | Y / Y | Fixed to top=N; loading=2; nested unit=14611; default=None |
| 14613 / LocationUMItemInfoSubAccordion | 14611 | Item Info / ITEMINFO | 50 / 3000 | Y / Y | Fixed to top=N; loading=0; nested unit=14611; default=None |

#### Group 14610: TransferShipmentMenuGroup — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42499 / EditOverrideMenuActionSave | Save / SAVE | 150 / 25 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SAVE |
| 42500 / EditOverrideMenuActionCancel | Cancel / BTN_CANCEL | 150 / 50 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 14612: LocationUMOverrideValuesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42501 / OverrideValuesGrid | Not populated / Not populated | 20 / 750 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 42501 `OverrideValuesGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14465 / QuantityUm | QUANTITY_UM / UM / UM | 10 / 10 / 650 / 80 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14466 / ConversionQty | CONVERSION_QTY / Conversion Qty / CONVERSIONQTY | 20 / 10 / 675 / 180 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 14467 / Weight | WEIGHT / Weight / WEIGHT | 20 / 10 / 700 / 100 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=60; DATA_SOURCE_TYPE=None |
| 14468 / WeightUm | WEIGHT_UM / Weight UM / WEIGHTUM | 10 / 10 / 1000 / 170 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=70 |
| 14469 / Length | LENGTH / Length / LENGTH | 20 / 10 / 1100 / 100 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=20; DATA_SOURCE_TYPE=None |
| 14470 / Width | WIDTH / Width / WIDTH | 20 / 10 / 1200 / 100 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=20; DATA_SOURCE_TYPE=None |
| 14471 / Height | HEIGHT / Height / HEIGHT | 20 / 10 / 1300 / 100 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=20; DATA_SOURCE_TYPE=None |
| 14472 / DimensionUm | DIMENSION_UM / Dimension UM / DIMENSIONUM | 10 / 10 / 1400 / 170 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=70 |
| 14473 / InternalLocUm | Not populated / Internal Loc UM / INTERNALLOCUM | 20 / 10 / 1600 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 14613: LocationUMItemInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42502 / ItemInfoItemvalue | Item / ITEM | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42503 / ItemInfoCompanyValue | Company / COMPANY | 80 / 400 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42504 / ItemInfoDescriptionValue | Description / DESCRIPTION | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 42505 / ItemInfoLocationValue | Location / LOCATION | 10 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42506 / ItemInfoWarehouseValue | Warehouse / WAREHOUSE | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 12 control attributes, 2 events, and 0 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32728 | 42499 / EditOverrideMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 32729 | 42501 / OverrideValuesGrid | data-formId | Y / Y / Y | 8 / 0 |
| 32730 | 42501 / OverrideValuesGrid | data-gridEditMode | Y / Y / Y | 8 / 0 |
| 32731 | 42501 / OverrideValuesGrid | data-addRowRequired | Y / Y / Y | 2 / 0 |
| 32732 | 42501 / OverrideValuesGrid | data-restupdate | Y / Y / Y | 0 / 0 |
| 32733 | 42501 / OverrideValuesGrid | data-headerkey | Y / Y / N | 42 / 0 |
| 32734 | 42501 / OverrideValuesGrid | data-hideColumnSummaries | Y / Y / Y | 8 / 0 |
| 32735 | 42501 / OverrideValuesGrid | data-hideColumnSorting | Y / Y / Y | 8 / 0 |
| 32736 | 42501 / OverrideValuesGrid | data-hideColumnFiltering | Y / Y / Y | 8 / 0 |
| 32737 | 42501 / OverrideValuesGrid | data-groupBy | Y / Y / Y | 10 / 0 |
| 32738 | 42501 / OverrideValuesGrid | data-restrictNegativeValues | Y / Y / Y | 80 / 0 |
| 32739 | 42501 / OverrideValuesGrid | pageSize | Y / Y / Y | 4 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14092 / click | 42499 / EditOverrideMenuActionSave | _webUi.locationUnitMeasureTransaction.invokePOSTWebService | Not populated | Y / Y |
| 14093 / click | 42500 / EditOverrideMenuActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 3 selected candidate rows for this Screen: **2 accepted tokens** and **1 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32728 | 42499 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32729 | 42501 / Not applicable | data-formId | form_id | 3044 | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
