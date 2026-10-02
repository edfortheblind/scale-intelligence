# Lookup — Form 40020, Screen 1549

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 40020 |
| MAIN_UI_SCREEN Object ID | 1549 |
| Label / Form resource key | Lookup / MNU_TPMLOOKUPTRANSACTION |
| Functional area code | 80 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | tpm / 7 |
| Configured path | /tpm/trans/tpmlookup |
| Candidate runtime URL | https://trav.manhscale.com/tpm/trans/tpmlookup |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/40020 |
| Inspection requirement | separate_portal |
| Form configuration table/view | MetaTrans_GetLookup |
| Help page reference | Not populated |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/40020 |
| Inspection time (UTC) | 2026-10-02T15:31:12.291Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_TPMLOOKUPTRANSACTION |
| Observed configured table/view | MetaTrans_GetLookup |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1549 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Lookup is recorded as `tpm`. Its saved configuration contains 3 parts, 5 groups, 5 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3516 / LookupMenuPane | Not populated / Not populated | 10 / 750 | Y / Y / N | Not populated |
| 3517 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | LookupMenuApply |
| 3518 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |

### Part 3516: LookupMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14718 / LookupMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14718; default=None |
| 14719 / LookupMenuPanel | 14718 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14718; default=None |

#### Group 14719: LookupMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42722 / LookupMenuApply | Not populated / Not populated | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 42723 / LookupMenuActionClearFilters | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 42724 / LookupMenuActionSaveSearch | Not populated / Not populated | 150 / 750 | N / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 42725 / LookupSelect | Select / BTN_SELECT | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_SELECT |

### Part 3517: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14720 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=14720; default=None |
| 14721 / SearchPaneBasicCriteria | 14720 | Basic Criteria / BASICCRITERIA | 160 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=14720; default=None |

### Part 3518: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14722 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=14722; default=None |

#### Group 14722: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42726 / LookupGrid | Not populated / Not populated | 340 / 2500 | Y / Y | DATA_SOURCE_TYPE=110; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 3 control attributes, 4 events, and 0 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32888 | 42725 / LookupSelect | disabled | Y / Y / Y | 2 / 0 |
| 32889 | 42726 / LookupGrid | data-groupBy | Y / Y / Y | 10 / 0 |
| 32890 | 42726 / LookupGrid | pageSize | Y / Y / Y | 4 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14166 / click | 42722 / LookupMenuApply | _webUi.tpmlookuptransaction.searchButtonClicked | Not populated | Y / Y |
| 14167 / click | 42723 / LookupMenuActionClearFilters | _webUi.tpmlookuptransaction.clearButtonClicked | Not populated | Y / Y |
| 14168 / click | 42725 / LookupSelect | _webUi.tpmlookuptransaction.selectButtonClicked | Not populated | Y / Y |
| 14169 / iggridselectionrowselectionchanged | 42726 / LookupGrid | _webUi.tpmlookuptransaction.gridRowSelectionChanged | Not populated | Y / Y |

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
