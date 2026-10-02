# Update Quantity to Pack — Form 3027, Screen 1557

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3027 |
| MAIN_UI_SCREEN Object ID | 1557 |
| Label / Form resource key | Update Quantity to Pack / MNU_UPDATEQUANTITYTOPACKTRANSACTION |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/updatequantitytopack |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/updatequantitytopack |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3027 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | IUpdateQuantityToPackProcessor |
| Help page reference | updateQuanPackWin.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3027 |
| Inspection time (UTC) | 2026-10-02T15:25:06.727Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_UPDATEQUANTITYTOPACKTRANSACTION |
| Observed configured table/view | IUpdateQuantityToPackProcessor |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1557 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Update Quantity to Pack is recorded as `transaction_context`. Its saved configuration contains 1 parts, 5 groups, 12 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3527 / UpdateQtyToPackDataPane | Not populated / Not populated | 10 / 25 | Y / Y / N | Not populated |

### Part 3527: UpdateQtyToPackDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14763 / UpdateQuantityToPackGroup | Not populated | Not populated / Not populated | 70 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=14763; default=None |
| 14764 / UpdateQuantityToPackMenuPanel | 14763 | Not populated / Not populated | 60 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=14763; default=None |
| 14766 / UQTPDetailSectionQuantityToPackSubAccordion | 14765 | Quantity to Pack / QTYTOPACK | 50 / 25 | Y / Y | Fixed to top=N; loading=2; nested unit=14765; default=None |
| 14765 / UQTPDetailSectionQuantityToPackMainAccordion | Not populated | Not populated / Not populated | 40 / 50 | Y / Y | Fixed to top=N; loading=1; nested unit=14765; default=None |
| 14767 / UQTPDetailSectionItemInfoSubAccordion | 14765 | Item Info / ITEMINFO | 50 / 50 | Y / Y | Fixed to top=N; loading=2; nested unit=14765; default=None |

#### Group 14764: UpdateQuantityToPackMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42824 / UpdateQuantityToPack | Update / BTN_UPDATE | 150 / 25 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_UPDATE |
| 42826 / UpdateQuantityToPackSectionItem | Not populated / Not populated | 260 / 50 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 42825 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 14766: UQTPDetailSectionQuantityToPackSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42827 / UQTPTQuantityToPackSectionAvailableQuantityValue | Available Quantity / AVAILABLEQUANTITY | 90 / 50 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42828 / UQTPTQuantityToPackSectionAvailableQuantityUmValue | UM / UM | 80 / 75 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42829 / UQTPTQuantityToPackSectionPackQuantityValue | Pack Quantity / PACKQUANTITY | 90 / 100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42830 / UQTPTQuantityToPackSectionPackQuantityUmValue | UM / UM | 80 / 125 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14767: UQTPDetailSectionItemInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42831 / UQTPItemInfoSectionLineNumberValue | Line Number / LINENUMBER | 90 / 25 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 42832 / UQTPItemInfoSectionItemValue | Item / ITEM | 10 / 50 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42833 / UQTPItemInfoSectionCompanyValue | Not populated / Company | 80 / 75 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42834 / UQTPItemInfoSectionDescriptionValue | Description / ITEMDESCRIPTION | 10 / 100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 42835 / UQTPItemInfoSectionLotValue | Lot / LOT | 80 / 125 | Y / Y | DATA_SOURCE_TYPE=100; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 3 control attributes, 3 events, and 0 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32935 | 42829 / UQTPTQuantityToPackSectionPackQuantityValue | minValue | Y / Y / Y | 2 / 0 |
| 32936 | 42829 / UQTPTQuantityToPackSectionPackQuantityValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 32937 | 42829 / UQTPTQuantityToPackSectionPackQuantityValue | data-msg-min | Y / Y / Y | 18 / 1 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14192 / click | 42824 / UpdateQuantityToPack | _webUi.updateQtyToPack.updateQuantityToPack | Not populated | Y / Y |
| 14193 / click | 42825 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 14194 / igcomboselectionchanged | 42835 / UQTPItemInfoSectionLotValue | _webUi.updateQtyToPack.onLotChange | Not populated | Y / Y |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 0 selected candidate rows for this Screen: **0 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

No accepted dependency token is associated with this Screen in the selected supplement.

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
