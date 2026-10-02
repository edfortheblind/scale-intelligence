# Slotting Interface — Form 2555, Screen 55

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2555 |
| MAIN_UI_SCREEN Object ID | 55 |
| Label / Form resource key | Slotting Interface / UI_SLOTINTERFACE |
| Functional area code | 530 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | legacy_or_unresolved / 1 |
| Configured path | Not populated |
| Candidate runtime URL | Not populated |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2555 |
| Inspection requirement | no_configured_web_route |
| Form configuration table/view | Not populated |
| Help page reference | slotInt.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2555 |
| Inspection time (UTC) | 2026-10-02T15:23:07.360Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | UI_SLOTINTERFACE |
| Observed configured table/view | Not populated |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | No Screen ID links captured |
| This dossier Screen ID present in observed links | False |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Slotting Interface is recorded as `legacy_or_unresolved`. Its saved configuration contains 0 parts, 0 groups, 0 controls, and 0 grid-column records. No child configuration records were associated in this extraction. This may be an application-owned, legacy, inactive, or unresolved entry; it does not establish that the function has no implementation. Treat the legacy/unresolved classification explicitly; do not manufacture a modern Insight route from the Form ID.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.


## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 0 control attributes, 0 events, and 0 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

No control attributes or events were associated with this Screen in the extracted interaction map. Application-owned or inherited behavior remains possible.

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
