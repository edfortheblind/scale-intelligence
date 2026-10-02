# Reprint Wave Documents — Form 4017, Screen 1543

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4017 |
| MAIN_UI_SCREEN Object ID | 1543 |
| Label / Form resource key | Reprint Wave Documents / MNU_REPRINTWAVEDOCSTRANSACTION |
| Functional area code | 30 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/reprintwavedocs |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/reprintwavedocs |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4017 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | MetaTrans_ReprintWaveDocs |
| Help page reference | selWavePrint.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4017 |
| Inspection time (UTC) | 2026-10-02T15:27:26.067Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_REPRINTWAVEDOCSTRANSACTION |
| Observed configured table/view | MetaTrans_ReprintWaveDocs |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1543 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Reprint Wave Documents is recorded as `transaction_context`. Its saved configuration contains 2 parts, 8 groups, 8 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3509 / WaveDocumentReprintChoiceModalDialog | Not populated / Not populated | 20 / 50 | Y / Y / Y | ModalCancelButton |
| 3508 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | Not populated |

### Part 3509: WaveDocumentReprintChoiceModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14694 / ReprintDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=14694; default=None |
| 14695 / ReprintModalChoiceDialogHeader | 14694 | Confirmation / CONFIRMATION | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=14694; default=None |
| 14696 / ReprintModalChoiceDialogBody | 14694 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=14694; default=None |
| 14697 / ReprintModalChoiceDialogFooter | 14694 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=14694; default=None |

#### Group 14696: ReprintModalChoiceDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42683 / ReprintChoiceModalBodyMessage | Not populated / MSG_PAPER01 | 30 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14697: ReprintModalChoiceDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42684 / ModalPrintButton | Print / BTN_PRINT | 100 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_PRINT |
| 42685 / ModalCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

### Part 3508: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14690 / ReprintWaveDocsMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14690; default=None |
| 14691 / ReprintWaveDocsMenuPanel | 14690 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14690; default=None |
| 14693 / ReprintWaveDocsSubPanel | 14692 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=14692; default=ReprintWaveDocsMenuActionPrint |
| 14692 / ReprintWaveDocsMainPanel | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=14692; default=None |

#### Group 14691: ReprintWaveDocsMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42678 / ReprintWaveDocsWaveNumberValue | Not populated / WaveNumber | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 42679 / ReprintWaveDocsMenuActionPrint | Print / BTN_PRINT | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_PRINT |

#### Group 14693: ReprintWaveDocsSubPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42680 / ReprintWaveDocsMasterValue | Document Master / PAPERWORKMASTER | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42681 / ReprintWaveDocsDocumentPrinterValue | Document Printer / DOCUMENTPRINTER | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42682 / ReprintWaveDocsLabelPrinterValue | Label Printer / LABELPRINTER | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 3 control attributes, 3 events, and 0 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32859 | 42679 / ReprintWaveDocsMenuActionPrint | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 32860 | 42680 / ReprintWaveDocsMasterValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 32861 | 42680 / ReprintWaveDocsMasterValue | data-msg-required | Y / Y / Y | 22 / 1 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14150 / click | 42679 / ReprintWaveDocsMenuActionPrint | _webUi.reprintWaveDocsTransaction.invokePOSTWebService | Not populated | Y / Y |
| 14151 / click | 42684 / ModalPrintButton | _webUi.reprintWaveDocsTransaction.invokePOSTWebService | Not populated | Y / Y |
| 14152 / click | 42685 / ModalCancelButton | _webUi.reprintWaveDocsTransaction.reprintChoiceModalButtonClicked | Not populated | Y / Y |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 1 selected candidate rows for this Screen: **1 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32859 | 42679 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
