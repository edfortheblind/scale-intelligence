# Single Unit Packing — Form 4000, Screen 1618

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4000 |
| MAIN_UI_SCREEN Object ID | 1618 |
| Label / Form resource key | Single Unit Packing / MNU_SINGLESPACKINGTRANSACTION |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | transaction_menu / 6 |
| Configured path | /scale/trans/singlesPacking |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/singlesPacking |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4000 |
| Inspection requirement | view_only_do_not_submit |
| Form configuration table/view | MetaTrans_SinglesPacking |
| Help page reference | singlespacking.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4000 |
| Inspection time (UTC) | 2026-10-02T15:26:48.482Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_SINGLESPACKINGTRANSACTION |
| Observed configured table/view | MetaTrans_SinglesPacking |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1618 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:16:50.291Z | loaded; landing | https://trav.manhscale.com/scale/trans/singlesPacking; Single Unit Packing | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:17:09.195Z | loaded; actions | https://trav.manhscale.com/scale/trans/singlesPacking; Single Unit Packing | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |

**Visible criteria / entry fields:** ToteIdEditorEditingInput.

**Observed action/menu labels:** New; Cancel.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Single Unit Packing is recorded as `transaction_menu`. Its saved configuration contains 1 parts, 6 groups, 5 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3712 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | Not populated |

### Part 3712: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 15538 / PackingMenu | Not populated | Not populated / Not populated | 70 / 10 | Y / Y | Fixed to top=Y; loading=0; nested unit=15538; default=None |
| 15539 / PackingMenuPanel | 15538 | Not populated / Not populated | 60 / 20 | Y / Y | Fixed to top=Y; loading=0; nested unit=15538; default=None |
| 15542 / PackingContainerInitiationGroup | Not populated | Not populated / Not populated | 60 / 50 | Y / Y | Fixed to top=N; loading=0; nested unit=15542; default=None |
| 15543 / PackingContainerPanel | 15542 | Not populated / Not populated | 60 / 60 | Y / Y | Fixed to top=N; loading=0; nested unit=15542; default=None |
| 15541 / PackingMenuPanelActions | 15538 | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=Y; loading=0; nested unit=15538; default=None |
| 15540 / PackingActionsDropdown | 15538 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=15538; default=None |

#### Group 15539: PackingMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45401 / ToteId | Not populated / Not populated | 260 / 30 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 15543: PackingContainerPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45404 / ToteIdEditor | Tote ID / TOTEID | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumnSinglesPacking-2\|_MetaControlPackingFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 45405 / SinglesPackingActionStart | Not populated / Not populated | 100 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumnSinglesPacking-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 15541: PackingMenuPanelActions — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45403 / PackingActionNew | New / NEW | 150 / 200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 15540: PackingActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 45402 / ListPaneMenuActionCancel | Cancel / BTN_CANCEL | 150 / 6000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 5 control attributes, 2 events, and 0 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 35170 | 45404 / ToteIdEditor | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 35171 | 45404 / ToteIdEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 35172 | 45404 / ToteIdEditor | data-msg-required | Y / Y / Y | 18 / 1 |
| 35173 | 45404 / ToteIdEditor | Lookup | Y / Y / N | 0 / 0 |
| 35174 | 45405 / SinglesPackingActionStart | data-securityCheckpoint | Y / Y / N | 2 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 15237 / click | 45402 / ListPaneMenuActionCancel | _webUi.singlesPackingTransaction.cancel | Not populated | Y / Y |
| 15238 / click | 45405 / SinglesPackingActionStart | _webUi.singlesPackingTransaction.getSinglePackingDetails | Not populated | Y / Y |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 2 selected candidate rows for this Screen: **2 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 35170 | 45404 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 35174 | 45405 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
