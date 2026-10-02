# Reprint Wave Labels — Form 4016, Screen 1544

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4016 |
| MAIN_UI_SCREEN Object ID | 1544 |
| Label / Form resource key | Reprint Wave Labels / MNU_REPRINTWAVELABELSTRANSACTION |
| Functional area code | 30 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/reprintwavelabels |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/reprintwavelabels |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4016 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | MetaTrans_ReprintWaveLabels |
| Help page reference | selWavePrint.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4016 |
| Inspection time (UTC) | 2026-10-02T15:27:24.145Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_REPRINTWAVELABELSTRANSACTION |
| Observed configured table/view | MetaTrans_ReprintWaveLabels |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1544 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Reprint Wave Labels is recorded as `transaction_context`. Its saved configuration contains 2 parts, 8 groups, 8 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3511 / WaveLabelReprintChoiceModalDialog | Not populated / Not populated | 20 / 50 | Y / Y / Y | ModalCancelButton |
| 3510 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | Not populated |

### Part 3511: WaveLabelReprintChoiceModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14702 / ReprintDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=14702; default=None |
| 14703 / ReprintModalChoiceDialogHeader | 14702 | Confirmation / CONFIRMATION | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=14702; default=None |
| 14704 / ReprintModalChoiceDialogBody | 14702 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=14702; default=None |
| 14705 / ReprintModalChoiceDialogFooter | 14702 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=14702; default=None |

#### Group 14704: ReprintModalChoiceDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42690 / ReprintChoiceModalBodyMessage | Not populated / MSG_MISSINGLABEL01 | 30 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14705: ReprintModalChoiceDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42691 / ModalPrintButton | Print / BTN_PRINT | 100 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_PRINT |
| 42692 / ModalRegenerateButton | Regenerate / BTN_REGENERATE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_REGENERATE |
| 42693 / ModalCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

### Part 3510: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14698 / ReprintWaveLabelMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14698; default=None |
| 14699 / ReprintWaveLabelMenuPanel | 14698 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14698; default=None |
| 14701 / ReprintWaveLabelsSubPanel | 14700 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=14700; default=ReprintWaveLabelsMenuActionPrint |
| 14700 / ReprintWaveLabelsMainPanel | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=14700; default=None |

#### Group 14699: ReprintWaveLabelMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42686 / ReprintWaveLabelsWaveNumberValue | Not populated / WaveNumber | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 42687 / ReprintWaveLabelsMenuActionPrint | Print / BTN_PRINT | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_PRINT |

#### Group 14701: ReprintWaveLabelsSubPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42688 / ReprintWaveLabelsLabelMasterValue | Label Master / LABELMASTER | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42689 / ReprintWaveLabelsLabelPrinterValue | Label Printer / LABELPRINTER | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 3 control attributes, 4 events, and 0 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32862 | 42687 / ReprintWaveLabelsMenuActionPrint | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 32863 | 42688 / ReprintWaveLabelsLabelMasterValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 32864 | 42688 / ReprintWaveLabelsLabelMasterValue | data-msg-required | Y / Y / Y | 34 / 1 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14153 / click | 42687 / ReprintWaveLabelsMenuActionPrint | _webUi.reprintWaveLabelsTransaction.invokePOSTWebService | Not populated | Y / Y |
| 14154 / click | 42691 / ModalPrintButton | _webUi.reprintWaveLabelsTransaction.reprintChoiceModalButtonClicked | Not populated | Y / Y |
| 14155 / click | 42692 / ModalRegenerateButton | _webUi.reprintWaveLabelsTransaction.reprintChoiceModalButtonClicked | Not populated | Y / Y |
| 14156 / click | 42693 / ModalCancelButton | _webUi.reprintWaveLabelsTransaction.reprintChoiceModalButtonClicked | Not populated | Y / Y |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 1 selected candidate rows for this Screen: **1 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32862 | 42687 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
