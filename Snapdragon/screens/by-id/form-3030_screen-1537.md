# Print Documents — Form 3030, Screen 1537

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3030 |
| MAIN_UI_SCREEN Object ID | 1537 |
| Label / Form resource key | Print Documents / MNU_PRINTSELECTEDDOCUMENTSTRANSACTION |
| Functional area code | 80 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/printselecteddocuments |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/printselecteddocuments |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3030 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | MetaTrans_GetPrintSelectedDocuments |
| Help page reference | printPaperwork.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3030 |
| Inspection time (UTC) | 2026-10-02T15:25:35.602Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_PRINTSELECTEDDOCUMENTSTRANSACTION |
| Observed configured table/view | MetaTrans_GetPrintSelectedDocuments |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1537 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Print Documents is recorded as `transaction_context`. Its saved configuration contains 1 parts, 3 groups, 9 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3501 / MainDataPane | Not populated / Not populated | 10 / 25 | Y / Y / N | PrintSelectedDocsMenuActionSubmit |

### Part 3501: MainDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14653 / PrintSelectedDocsMenu | Not populated | Not populated / Not populated | 70 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=14653; default=None |
| 14654 / PrintSelectedDocsMenuGroup | 14653 | Not populated / Not populated | 60 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=14653; default=None |
| 14655 / PrintSelectedDocsMainPanel | Not populated | Not populated / Not populated | 60 / 2000 | Y / Y | Fixed to top=N; loading=0; nested unit=14655; default=None |

#### Group 14654: PrintSelectedDocsMenuGroup — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42575 / PrintSelectedDocsMenuActionSubmit | Submit / BTN_SUBMIT | 150 / 25 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SUBMIT |
| 42577 / PrintSelectedDocsHeaderSectionId | Not populated / Not populated | 260 / 25 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 42576 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 14655: PrintSelectedDocsMainPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42578 / Idvalue | Not populated / Not populated | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=100; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 42579 / toggleDocumentPrinter | Use Document Routing for Documents / USEDOCROUTINGFORDOCS | 130 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42580 / toggleLabelPrinter | Use Document Routing for Labels / USEDOCROUTINGFORLABELS | 130 / 600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42581 / DocumentPrinter | Document Printer / DOCUMENTPRINTER | 80 / 800 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42582 / LabelPrinter | Label Printer / LABELPRINTER | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42583 / DocumentTypes | Select Documents / SELECTDOCUMENTS | 40 / 1200 | Y / Y | DATA_SOURCE_TYPE=100; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 9 control attributes, 5 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32786 | 42575 / PrintSelectedDocsMenuActionSubmit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 32787 | 42579 / toggleDocumentPrinter | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 32788 | 42579 / toggleDocumentPrinter | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 32789 | 42580 / toggleLabelPrinter | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 32790 | 42580 / toggleLabelPrinter | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 32791 | 42581 / DocumentPrinter | data-rule-required | Y / Y / Y | 8 / 0 |
| 32792 | 42581 / DocumentPrinter | data-msg-required | Y / Y / Y | 18 / 1 |
| 32793 | 42582 / LabelPrinter | data-rule-required | Y / Y / Y | 8 / 0 |
| 32794 | 42582 / LabelPrinter | data-msg-required | Y / Y / Y | 18 / 1 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14123 / click | 42575 / PrintSelectedDocsMenuActionSubmit | _webUi.printSelectedDocumentsTransaction.submitButtonClicked | Not populated | Y / Y |
| 14124 / click | 42576 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 14125 / change | 42579 / toggleDocumentPrinter | _webUi.printSelectedDocumentsTransaction.toggleDocumentPrinterChanged | Not populated | Y / Y |
| 14126 / change | 42580 / toggleLabelPrinter | _webUi.printSelectedDocumentsTransaction.toggleLabelPrinterChanged | Not populated | Y / Y |
| 14127 / igtreenodecheckstatechanged | 42583 / DocumentTypes | _webUi.printSelectedDocumentsTransaction.documentTypesCheckedStateChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19327 / 14123 | POSTServiceURL | Y / Y | 78 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 2 selected candidate rows for this Screen: **2 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32786 | 42575 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19327 | 42575 / 14123 | POSTServiceURL | relative_api_path | /general/scaleapi/printapi/printedDocs? | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
