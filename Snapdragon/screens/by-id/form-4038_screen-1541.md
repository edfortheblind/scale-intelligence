# Receipt Workbench — Form 4038, Screen 1541

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4038 |
| MAIN_UI_SCREEN Object ID | 1541 |
| Label / Form resource key | Receipt Workbench / MNU_RECEIPTWORKBENCHTRANSACTION |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | transaction_menu / 6 |
| Configured path | /scale/trans/receiptWorkBench |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/receiptWorkBench |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4038 |
| Inspection requirement | view_only_do_not_submit |
| Form configuration table/view | MetaTrans_ReceiptWorkbench |
| Help page reference | checkLocate.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4038 |
| Inspection time (UTC) | 2026-10-02T15:27:48.140Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_RECEIPTWORKBENCHTRANSACTION |
| Observed configured table/view | MetaTrans_ReceiptWorkbench |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1541 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:17:08.696Z | loaded; runtime_inspection | https://trav.manhscale.com/scale/trans/receiptWorkBench; Receipt Workbench | [runtime-root.json](../../evidence/runtime-root.json) |

**Visible criteria / entry fields:** ReceiptIdEditorEditingInput.

**Observation limits:** Entry screen inspected. Receiving preference options present; no receipt lookup, New, Continue or transactional action executed.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Receipt Workbench is recorded as `transaction_menu`. Its saved configuration contains 1 parts, 6 groups, 9 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3506 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | RECEIPTActionStart |

### Part 3506: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14675 / RECEIPTMenu | Not populated | Not populated / Not populated | 70 / 10 | Y / Y | Fixed to top=Y; loading=0; nested unit=14675; default=None |
| 14676 / RECEIPTMenuPanel | 14675 | Not populated / Not populated | 60 / 20 | Y / Y | Fixed to top=Y; loading=0; nested unit=14675; default=None |
| 14679 / RECEIPTContainerInitiationGroup | Not populated | Not populated / Not populated | 60 / 50 | Y / Y | Fixed to top=N; loading=0; nested unit=14679; default=None |
| 14680 / RECEIPTContainerPanel | 14679 | Not populated / Not populated | 60 / 60 | Y / Y | Fixed to top=N; loading=0; nested unit=14679; default=None |
| 14678 / RECEIPTMenuPanelActions | 14675 | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=Y; loading=0; nested unit=14675; default=None |
| 14677 / RECEIPTActionsDropdown | 14675 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=14675; default=None |

#### Group 14676: RECEIPTMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42644 / ReceiptId | Not populated / Not populated | 260 / 30 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14680: RECEIPTContainerPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42649 / ReceiptIdEditor | Receipt ID / RECEIPTID | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaRECEIPTWorkbenchControlGridRow-5\|_MetaControlReceiptWorkbenchFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 42652 / ReceivingPreferenceCombo | Receiving Preference / RECEIVINGPREFERENCE | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaRECEIPTWorkbenchControlGridRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 42650 / RECEIPTActionStart | Not populated / Not populated | 100 / 900 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaRECEIPTWorkbenchControlGridRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 42651 / RECEIPTActionCreate | Not populated / Not populated | 100 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaRECEIPTWorkbenchControlGridRow-5; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14678: RECEIPTMenuPanelActions — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42648 / RECEIPTActionRefresh | Not populated / Not populated | 150 / 100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 42647 / RECEIPTActionNew | New / NEW | 150 / 200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14677: RECEIPTActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42645 / ReceiptListPaneMenuActionNewLine | New Line / NEWLINE | 150 / 2230 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEWLINE |
| 42646 / MenuActionCancel | Cancel / BTN_CANCEL | 150 / 15100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 13 control attributes, 3 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32831 | 42645 / ReceiptListPaneMenuActionNewLine | data-divider | Y / Y / N | 8 / 0 |
| 32832 | 42645 / ReceiptListPaneMenuActionNewLine | data-formId | Y / Y / N | 8 / 0 |
| 32833 | 42645 / ReceiptListPaneMenuActionNewLine | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 32834 | 42648 / RECEIPTActionRefresh | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 32835 | 42649 / ReceiptIdEditor | Lookup | Y / Y / N | 176 / 0 |
| 32836 | 42649 / ReceiptIdEditor | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 32837 | 42649 / ReceiptIdEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 32838 | 42649 / ReceiptIdEditor | data-msg-required | Y / Y / Y | 18 / 1 |
| 32842 | 42652 / ReceivingPreferenceCombo | data-rule-required | Y / Y / Y | 8 / 0 |
| 32843 | 42652 / ReceivingPreferenceCombo | data-msg-required | Y / Y / Y | 18 / 1 |
| 32839 | 42650 / RECEIPTActionStart | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 32840 | 42651 / RECEIPTActionCreate | data-formId | Y / Y / N | 8 / 0 |
| 32841 | 42651 / RECEIPTActionCreate | data-securityCheckpoint | Y / Y / N | 2 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14142 / click | 42646 / MenuActionCancel | _webUi.receiptWorkbenchTransaction.cancel | Not populated | Y / Y |
| 14143 / click | 42650 / RECEIPTActionStart | _webUi.receiptWorkbenchTransaction.loadReceiptWorkBenchScreen | Not populated | Y / Y |
| 14144 / click | 42651 / RECEIPTActionCreate | _webUi.receiptWorkbenchTransaction.openCreateReceipt | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19331 / 14144 | URL | Y / Y | 68 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 7 selected candidate rows for this Screen: **7 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32832 | 42645 / Not applicable | data-formId | form_id | 3035 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32833 | 42645 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32834 | 42648 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32836 | 42649 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32839 | 42650 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32840 | 42651 / Not applicable | data-formId | form_id | 3034 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32841 | 42651 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
