# Shipment Header Archive Viewer — Form 2500, Screen 34

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** No Form-configuration browser observation. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2500 |
| MAIN_UI_SCREEN Object ID | 34 |
| Label / Form resource key | Shipment Header Archive Viewer / UI_VWR_AR_SHIPMENTHEADER |
| Functional area code | 60 |
| Active / System created / Show in application menu | N / Y / Y |
| Route category / path type code | inactive / 1 |
| Configured path | Not populated |
| Candidate runtime URL | Not populated |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2500 |
| Inspection requirement | do_not_count_as_current_route |
| Form configuration table/view | AR_SHIPMENT_HEADER |
| Help page reference | procDataArch.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

No observation for this Form ID appears in the loaded Form-configuration audit. The audit denominator covers unique Forms with active Screen records; inactive-only Forms remain mapped from replica metadata.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Shipment Header Archive Viewer is recorded as `inactive`. Its saved configuration contains 0 parts, 0 groups, 0 controls, and 0 grid-column records. No child configuration records were associated in this extraction. This may be an application-owned, legacy, inactive, or unresolved entry; it does not establish that the function has no implementation. The main UI Screen record is inactive in the saved metadata; it is preserved for completeness and is not counted as a confirmed active runtime screen.

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
