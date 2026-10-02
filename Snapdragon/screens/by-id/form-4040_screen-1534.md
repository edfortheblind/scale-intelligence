# Nest Container — Form 4040, Screen 1534

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4040 |
| MAIN_UI_SCREEN Object ID | 1534 |
| Label / Form resource key | Nest Container / MNU_NESTCONTAINERTRANSACTION |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/NestContainer |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/NestContainer |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4040 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | NestContainerRequestProcessor |
| Help page reference | nestCont.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4040 |
| Inspection time (UTC) | 2026-10-02T15:27:50.215Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_NESTCONTAINERTRANSACTION |
| Observed configured table/view | NestContainerRequestProcessor |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1534 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Nest Container is recorded as `transaction_context`. Its saved configuration contains 1 parts, 5 groups, 7 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3498 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | NestContainerActionNest |

### Part 3498: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14637 / NestContainerMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14637; default=None |
| 14638 / NestContainerMenuPanel | 14637 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14637; default=None |
| 14639 / MenuActionsDropdown | 14637 | Actions / ACTIONS | 80 / 300 | Y / Y | Fixed to top=N; loading=0; nested unit=14637; default=None |
| 14640 / NestContainerMainAccordion | Not populated | Not populated / Not populated | 40 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=14640; default=None |
| 14641 / NestContainerSubAccordion | 14640 | Container Info / ContainerInfo | 50 / 3000 | Y / Y | Fixed to top=N; loading=2; nested unit=14640; default=None |

#### Group 14638: NestContainerMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42554 / NestContainerActionNest | Nest / BTN_NEST | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEST |
| 42555 / NestContainerMenuActionCombine | Combine / BTN_COMBINE | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=COMBINE |

#### Group 14639: MenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42556 / MenuActionPrintSelectedDocs | Print Selected Docs / PRINTSELECTEDDOCS | 150 / 150 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTSELECTEDDOCS |
| 42557 / MenuActionCancel | Cancel / BTN_CANCEL | 150 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 14641: NestContainerSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42558 / FromContainerValue | From Container / FROMCONTAINER | 80 / 400 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 42559 / ToContainerValue | To Container / TOCONTAINER | 80 / 400 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 42560 / ContainerTypeValue | Not populated / ContainerType | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 6 control attributes, 7 events, and 2 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32761 | 42555 / NestContainerMenuActionCombine | data-formId | Y / Y / N | 4 / 0 |
| 32762 | 42555 / NestContainerMenuActionCombine | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 32763 | 42556 / MenuActionPrintSelectedDocs | data-formId | Y / Y / N | 8 / 0 |
| 32764 | 42556 / MenuActionPrintSelectedDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 32765 | 42556 / MenuActionPrintSelectedDocs | data-divider | Y / Y / N | 8 / 0 |
| 32766 | 42560 / ContainerTypeValue | data-rule-required | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14109 / click | 42554 / NestContainerActionNest | _webUi.nestContainerTransaction.nestContainer | Not populated | Y / Y |
| 14110 / click | 42555 / NestContainerMenuActionCombine | _webUi.nestContainerTransaction.combine | Not populated | Y / Y |
| 14111 / click | 42556 / MenuActionPrintSelectedDocs | _webUi.nestContainerTransaction.printSelectedDocuments | Not populated | Y / Y |
| 14112 / click | 42557 / MenuActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 14113 / igcombonomatchfound | 42559 / ToContainerValue | _webUi.nestContainerTransaction.onToContainerSelection | Not populated | Y / Y |
| 14114 / igcomboselectionchanged | 42559 / ToContainerValue | _webUi.nestContainerTransaction.onToContainerSelection | Not populated | Y / Y |
| 14115 / igcomboselectionchanged | 42560 / ContainerTypeValue | _webUi.nestContainerTransaction.onToContainerTypeSelection | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19321 / 14109 | POSTServiceURL | Y / Y | 116 |
| 19322 / 14110 | POSTServiceURL | Y / Y | 120 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 6 selected candidate rows for this Screen: **6 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32761 | 42555 / Not applicable | data-formId | form_id | 30 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32762 | 42555 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32763 | 42556 / Not applicable | data-formId | form_id | 4040 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32764 | 42556 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19321 | 42554 / 14109 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShippingContainersApi/Nested-Containers | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19322 | 42555 / 14110 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShippingContainersApi/Combined-Containers | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
