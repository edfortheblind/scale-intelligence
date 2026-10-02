# Close Container — Form 3029, Screen 1664

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3029 |
| MAIN_UI_SCREEN Object ID | 1664 |
| Label / Form resource key | Close Container / MNU_CLOSECONTAINERTRANSACTION |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | transaction_menu / 6 |
| Configured path | /scale/trans/closecontainer |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/closecontainer |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3029 |
| Inspection requirement | view_only_do_not_submit |
| Form configuration table/view | MetaTrans_GetCloseContainer |
| Help page reference | CloseContainer.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3029 |
| Inspection time (UTC) | 2026-10-02T15:25:33.657Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_CLOSECONTAINERTRANSACTION |
| Observed configured table/view | MetaTrans_GetCloseContainer |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1664 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:15:55.540Z | loaded; landing | https://trav.manhscale.com/scale/trans/closecontainer; Close Container | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:16:06.780Z | loaded; actions | https://trav.manhscale.com/scale/trans/closecontainer; Close Container | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |
| 2026-10-02T15:16:21.982Z | loaded; user_defined | https://trav.manhscale.com/scale/trans/closecontainer; Close Container | [runtime-training-agent.json](../../evidence/runtime-training-agent.json) |

**Visible criteria / entry fields:** ContainerInfoContainerIdValueEditingInput; ContainerInfoWeightValueEditingInput; UserDefinedUDF1ValueEditingInput; UserDefinedUDF2ValueEditingInput; UserDefinedUDF3ValueEditingInput; UserDefinedUDF4ValueEditingInput; UserDefinedUDF5ValueEditingInput; UserDefinedUDF6ValueEditingInput; UserDefinedUDF7ValueEditingInput; UserDefinedUDF8ValueEditingInput.

**Observed action/menu labels:** Close; Edit; Use Scale Weight; Cancel.

**Page groups:** Container Info; User Defined.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Close Container is recorded as `transaction_menu`. Its saved configuration contains 1 parts, 8 groups, 28 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3885 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | CloseContainerActionClose |

### Part 3885: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16238 / CloseContainerMenuPanel | 16237 | Not populated / Not populated | 60 / 100 | Y / Y | Fixed to top=Y; loading=0; nested unit=16237; default=None |
| 16239 / CloseContainerActionPanel | 16237 | Not populated / Not populated | 60 / 200 | Y / Y | Fixed to top=N; loading=0; nested unit=16237; default=None |
| 16237 / CloseContainerMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16237; default=None |
| 16243 / CloseContainerContainerInfoSubAccordion | 16242 | Not populated / CONTAINERINFO | 50 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=16242; default=None |
| 16240 / MenuActionsDropdown | 16237 | Actions / ACTIONS | 80 / 300 | Y / Y | Fixed to top=N; loading=0; nested unit=16237; default=None |
| 16241 / CloseContainerContainerIdGroup | Not populated | Not populated / Not populated | 60 / 400 | Y / Y | Fixed to top=N; loading=0; nested unit=16241; default=None |
| 16242 / CloseContainerMainAccordion | Not populated | Not populated / Not populated | 40 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=16242; default=None |
| 16244 / CloseContainerUserDefinedSubAccordion | 16242 | User Defined / USERDEFINED | 50 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=16242; default=None |

#### Group 16238: CloseContainerMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47434 / CloseContainerMenuContainerIdValue | Container ID / CONTAINERID | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16239: CloseContainerActionPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47435 / CloseContainerActionClose | Close / BTN_CLOSE | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLOSE |
| 47436 / CloseContainerActionEndShipment | End Shipment / ENDSHIPMENT | 150 / 600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ENDSHIPMENT |

#### Group 16243: CloseContainerContainerInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47444 / ContainerInfoContainerCountValue | Not populated / ContainerCount | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47445 / ContainerInfoTotalContainersValue | Total Containers / TOTALCONTAINERS | 90 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47446 / ContainerInfoCarrierValue | Carrier / CARRIER | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47447 / ContainerInfoCarrierServiceValue | Carrier Service / CARRIERSERVICE | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47448 / ContainerInfoContainerTypeValue | Container Type / CONTAINERTYPE | 80 / 1750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47449 / ContainerInfoLengthValue | Length / LENGTH | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47450 / ContainerInfoWidthValue | Width / WIDTH | 90 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47451 / ContainerInfoHeightValue | Height / HEIGHT | 90 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47452 / ContainerInfoNMFCCodeValue | Nmfc Code / NMFCCODE | 80 / 2750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47453 / ContainerInfoTrackingnumberValue | Tracking Number / TRACKINGNUMBER | 10 / 3000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16240: MenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47437 / MenuActionViewContainer | View / VIEW | 150 / 300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 47438 / MenuActionEditContainer | Edit / EDIT | 150 / 350 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 47439 / MenuActionPrintSelectedDocs | Print Selected Docs / PRINTSELECTEDDOCS | 150 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTSELECTEDDOCS |
| 47440 / MenuActionUseScaleWeight | Use Scale Weight / USESCALEWEIGHT | 150 / 600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=USESCALEWEIGHT |
| 47441 / MenuActionCancel | Cancel / BTN_CANCEL | 150 / 800 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 16241: CloseContainerContainerIdGroup — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47442 / ContainerInfoContainerIdValue | Container ID / CONTAINERID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 47443 / ContainerInfoWeightValue | Weight / WEIGHT | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16244: CloseContainerUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47454 / UserDefinedUDF1Value | User Defined Field 1 / UD_CLOSECONTAINER1 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47455 / UserDefinedUDF2Value | User Defined Field 2 / UD_CLOSECONTAINER2 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47456 / UserDefinedUDF3Value | User Defined Field 3 / UD_CLOSECONTAINER3 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47457 / UserDefinedUDF4Value | User Defined Field 4 / UD_CLOSECONTAINER4 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47458 / UserDefinedUDF5Value | User Defined Field 5 / UD_CLOSECONTAINER5 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47459 / UserDefinedUDF6Value | User Defined Field 6 / UD_CLOSECONTAINER6 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47460 / UserDefinedUDF7Value | User Defined Field 7 / UD_CLOSECONTAINER7 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47461 / UserDefinedUDF8Value | User Defined Field 8 / UD_CLOSECONTAINER8 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 35 control attributes, 12 events, and 5 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 37212 | 47437 / MenuActionViewContainer | data-formId | Y / Y / N | 8 / 0 |
| 37213 | 47437 / MenuActionViewContainer | data-divider | Y / Y / N | 8 / 0 |
| 37214 | 47438 / MenuActionEditContainer | data-formId | Y / Y / N | 8 / 0 |
| 37215 | 47438 / MenuActionEditContainer | data-divider | Y / Y / N | 8 / 0 |
| 37216 | 47438 / MenuActionEditContainer | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37217 | 47439 / MenuActionPrintSelectedDocs | data-formId | Y / Y / N | 8 / 0 |
| 37218 | 47439 / MenuActionPrintSelectedDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 37219 | 47440 / MenuActionUseScaleWeight | data-useCheckbox | Y / Y / Y | 8 / 0 |
| 37220 | 47440 / MenuActionUseScaleWeight | data-divider | Y / Y / N | 8 / 0 |
| 37221 | 47442 / ContainerInfoContainerIdValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37222 | 47442 / ContainerInfoContainerIdValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37223 | 47442 / ContainerInfoContainerIdValue | Lookup | Y / Y / N | 100 / 0 |
| 37224 | 47443 / ContainerInfoWeightValue | minValue | Y / Y / Y | 2 / 0 |
| 37225 | 47443 / ContainerInfoWeightValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 37226 | 47443 / ContainerInfoWeightValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 37227 | 47444 / ContainerInfoContainerCountValue | maxLength | Y / Y / Y | 2 / 0 |
| 37228 | 47444 / ContainerInfoContainerCountValue | minValue | Y / Y / Y | 2 / 0 |
| 37229 | 47444 / ContainerInfoContainerCountValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 37230 | 47444 / ContainerInfoContainerCountValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 37231 | 47445 / ContainerInfoTotalContainersValue | minValue | Y / Y / Y | 2 / 0 |
| 37232 | 47445 / ContainerInfoTotalContainersValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 37233 | 47445 / ContainerInfoTotalContainersValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 37234 | 47446 / ContainerInfoCarrierValue | childCombo | Y / Y / Y | 64 / 0 |
| 37235 | 47447 / ContainerInfoCarrierServiceValue | parentCombo | Y / Y / Y | 50 / 0 |
| 37236 | 47448 / ContainerInfoContainerTypeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37237 | 47448 / ContainerInfoContainerTypeValue | data-msg-required | Y / Y / Y | 30 / 1 |
| 37238 | 47449 / ContainerInfoLengthValue | minValue | Y / Y / Y | 2 / 0 |
| 37239 | 47449 / ContainerInfoLengthValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 37240 | 47449 / ContainerInfoLengthValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 37241 | 47450 / ContainerInfoWidthValue | minValue | Y / Y / Y | 2 / 0 |
| 37242 | 47450 / ContainerInfoWidthValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 37243 | 47450 / ContainerInfoWidthValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 37244 | 47451 / ContainerInfoHeightValue | minValue | Y / Y / Y | 2 / 0 |
| 37245 | 47451 / ContainerInfoHeightValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 37246 | 47451 / ContainerInfoHeightValue | data-msg-min | Y / Y / Y | 18 / 1 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16137 / click | 47435 / CloseContainerActionClose | _webUi.closeContainerTransaction.closeContainer | Not populated | Y / Y |
| 16138 / click | 47436 / CloseContainerActionEndShipment | _webUi.closeContainerTransaction.endShipmentClicked | Not populated | Y / Y |
| 16139 / click | 47437 / MenuActionViewContainer | _webUi.detailsScreenActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 16140 / click | 47438 / MenuActionEditContainer | _webUi.detailsScreenActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 16141 / click | 47439 / MenuActionPrintSelectedDocs | _webUi.detailsScreenActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 16142 / click | 47440 / MenuActionUseScaleWeight | _webUi.closeContainerTransaction.useScaleWeightClicked | Not populated | Y / Y |
| 16143 / click | 47441 / MenuActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 16144 / igtexteditorvaluechanged | 47442 / ContainerInfoContainerIdValue | _webUi.closeContainerTransaction.containerIdChanged | Not populated | Y / Y |
| 16145 / blur | 47443 / ContainerInfoWeightValue | _webUi.closeContainerTransaction.textboxWeightOnBlur | Not populated | Y / Y |
| 16146 / igcomboselectionchanged | 47446 / ContainerInfoCarrierValue | _webUi.closeContainerTransaction.carrierChanged | Not populated | Y / Y |
| 16147 / igcomboselectionchanged | 47447 / ContainerInfoCarrierServiceValue | _webUi.closeContainerTransaction.carrierChanged | Not populated | Y / Y |
| 16148 / igcomboselectionchanged | 47448 / ContainerInfoContainerTypeValue | _webUi.closeContainerTransaction.containerTypeComboSelectionChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 22981 / 16137 | POSTServiceURL | Y / Y | 108 |
| 22982 / 16138 | URL | Y / Y | 74 |
| 22983 / 16139 | URL | Y / Y | 252 |
| 22984 / 16140 | URL | Y / Y | 252 |
| 22985 / 16141 | URL | Y / Y | 308 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 6 selected candidate rows for this Screen: **5 accepted tokens** and **1 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 37212 | 47437 / Not applicable | data-formId | form_id | 3020 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37214 | 47438 / Not applicable | data-formId | form_id | 3020 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37216 | 47438 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37217 | 47439 / Not applicable | data-formId | form_id | 3029 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37218 | 47439 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
