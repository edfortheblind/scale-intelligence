# Build Wave — Form 4024, Screen 1513

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4024 |
| MAIN_UI_SCREEN Object ID | 1513 |
| Label / Form resource key | Build Wave / MNU_BUILDWAVETRANSACTION |
| Functional area code | 30 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/buildwave |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/buildwave |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4024 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | MetaTrans_BuildWave |
| Help page reference | BuildWave.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4024 |
| Inspection time (UTC) | 2026-10-02T15:27:33.964Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_BUILDWAVETRANSACTION |
| Observed configured table/view | MetaTrans_BuildWave |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1513 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Build Wave is recorded as `transaction_context`. Its saved configuration contains 1 parts, 6 groups, 4 controls, and 3 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3475 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | BuildWaveMenuActionBuild |

### Part 3475: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14505 / BuildWaveMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14505; default=None |
| 14506 / BuildWaveMenuPanel | 14505 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14505; default=None |
| 14508 / BuildWaveTitlePanel | 14507 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=14507; default=BuildWaveMenuActionBuild |
| 14510 / BuildWaveWaveMasterSubAccordion | 14509 | Not populated / WaveMaster | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=14509; default=None |
| 14507 / BuildWaveSectionMainPanel | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=14507; default=None |
| 14509 / BuildWaveMainAccordion | Not populated | Not populated / Not populated | 40 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=14509; default=None |

#### Group 14506: BuildWaveMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42127 / BuildWaveMenuActionBuild | Build / BUILD | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_BUILD |
| 42128 / ActionCancel | Cancel / BTN_CANCEL | 150 / 350 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 14508: BuildWaveTitlePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42129 / BuildWaveWarehouse | Warehouse / WAREHOUSE | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14510: BuildWaveWaveMasterSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42130 / BuildWaveGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 42130 `BuildWaveGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14399 / WaveName | WaveName / Not populated / Name | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14400 / Description | Description / Not populated / Description | 10 / 10 / 20 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14401 / WAVEFLOW | WAVEFLOW / Not populated / Flow | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 10 control attributes, 6 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32469 | 42129 / BuildWaveWarehouse | data-rule-required | Y / Y / Y | 8 / 0 |
| 32470 | 42129 / BuildWaveWarehouse | data-msg-required | Y / Y / Y | 30 / 1 |
| 32471 | 42130 / BuildWaveGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 32472 | 42130 / BuildWaveGrid | data-queryEngineId | Y / Y / N | 40 / 0 |
| 32473 | 42130 / BuildWaveGrid | data-groupBy | Y / Y / Y | 10 / 0 |
| 32474 | 42130 / BuildWaveGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 32475 | 42130 / BuildWaveGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 32476 | 42130 / BuildWaveGrid | pageSize | Y / Y / Y | 4 / 0 |
| 32477 | 42130 / BuildWaveGrid | data-dbtable | Y / Y / N | 60 / 0 |
| 32478 | 42130 / BuildWaveGrid | data-local | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 13989 / click | 42127 / BuildWaveMenuActionBuild | _webUi.buildWaveTransaction.OnBuildClick | Not populated | Y / Y |
| 13990 / click | 42128 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 13991 / igcomboselectionchanged | 42129 / BuildWaveWarehouse | _webUi.buildWaveTransaction.OnWarehouseChange | Not populated | Y / Y |
| 13992 / iggridselectionrowselectionchanged | 42130 / BuildWaveGrid | _webUi.buildWaveTransaction.gridSelectionRowChanged | Not populated | Y / Y |
| 13993 / iggridrowselectorscheckboxstatechanging | 42130 / BuildWaveGrid | _webUi.buildWaveTransaction.gridRowSelectorsCheckBoxStateChanging | Not populated | Y / Y |
| 13994 / iggridselectionrowselectionchanging | 42130 / BuildWaveGrid | _webUi.buildWaveTransaction.gridSelectionRowChanging | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19296 / 13989 | POSTServiceURL | Y / Y | 90 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 2 selected candidate rows for this Screen: **2 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32477 | 42130 / Not applicable | data-dbtable | database_identifier | METADATA_TRANS_BUILD_WAVE_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19296 | 42127 / 13989 | POSTServiceURL | relative_api_path | /outbound/scaleapi/WavesApi/buildWaveRequests | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
