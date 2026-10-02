# New Wave — Form 4031, Screen 1535

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4031 |
| MAIN_UI_SCREEN Object ID | 1535 |
| Label / Form resource key | New Wave / MNU_NEWWAVETRANSACTION |
| Functional area code | 30 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/newwave |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/newwave |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4031 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | MetaTrans_GetNewWave |
| Help page reference | CreatLaurec.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4031 |
| Inspection time (UTC) | 2026-10-02T15:27:38.015Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_NEWWAVETRANSACTION |
| Observed configured table/view | MetaTrans_GetNewWave |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1535 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

New Wave is recorded as `transaction_context`. Its saved configuration contains 1 parts, 5 groups, 6 controls, and 5 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3499 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | Not populated |

### Part 3499: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14642 / NewWaveMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14642; default=None |
| 14643 / NewWaveMenuPanel | 14642 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14642; default=None |
| 14645 / NewWaveCreateFromWaveMasterSubAccordion | 14644 | Create From Wave Master / CREATEFROMWAVEMASTER | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=14644; default=None |
| 14644 / NewWaveMainAccordion | Not populated | Not populated / Not populated | 40 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=14644; default=None |
| 14646 / NewWaveCreateCustomWaveSubAccordion | 14644 | Create Custom Wave / CREATECUSTOMWAVE | 50 / 500 | Y / Y | Fixed to top=N; loading=2; nested unit=14644; default=None |

#### Group 14643: NewWaveMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42562 / NewWaveActionSave | Save / BTN_SAVE | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 42561 / AddWaveActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 14645: NewWaveCreateFromWaveMasterSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42563 / WaveMasterGrid | Wave Master / LAUNCHMASTER | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 42563 `WaveMasterGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14482 / WaveName | WaveName / Not populated / WaveName | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14483 / Description | Description / Not populated / Description | 10 / 10 / 20 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14484 / WAVEFLOW | WAVEFLOW / Wave Flow / WAVEFLOW | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 14646: NewWaveCreateCustomWaveSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42564 / CreateCustomWaveWaveNameValue | Wave Name / LAUNCHNAME | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42565 / CreateCustomWaveAutoReleaseValue | Auto Release / AUTORELEASE | 130 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42566 / WaveFlowGrid | Wave Flow / LAUNCHFLOW | 20 / 750 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 42566 `WaveFlowGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14485 / WaveFlow | WaveFlow / Not populated / WaveFlow | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14486 / Description | Description / Not populated / Description | 10 / 10 / 20 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 13 control attributes, 5 events, and 4 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32767 | 42563 / WaveMasterGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 32768 | 42563 / WaveMasterGrid | data-queryEngineId | Y / Y / N | 40 / 0 |
| 32769 | 42563 / WaveMasterGrid | data-groupBy | Y / Y / Y | 10 / 0 |
| 32770 | 42563 / WaveMasterGrid | pageSize | Y / Y / Y | 4 / 0 |
| 32771 | 42563 / WaveMasterGrid | data-dbtable | Y / Y / N | 62 / 0 |
| 32772 | 42563 / WaveMasterGrid | data-local | Y / Y / Y | 8 / 0 |
| 32773 | 42565 / CreateCustomWaveAutoReleaseValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 32774 | 42565 / CreateCustomWaveAutoReleaseValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 32775 | 42566 / WaveFlowGrid | data-groupBy | Y / Y / Y | 10 / 0 |
| 32776 | 42566 / WaveFlowGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 32777 | 42566 / WaveFlowGrid | pageSize | Y / Y / Y | 4 / 0 |
| 32778 | 42566 / WaveFlowGrid | data-dbtable | Y / Y / N | 58 / 0 |
| 32779 | 42566 / WaveFlowGrid | data-local | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14117 / click | 42562 / NewWaveActionSave | _webUi.newWave.save | Not populated | Y / Y |
| 14116 / click | 42561 / AddWaveActionCancel | _webUi.newWave.cancelClicked | Not populated | Y / Y |
| 14118 / iggridselectionrowselectionchanged | 42563 / WaveMasterGrid | _webUi.newWave.waveMasterRowChanged | Not populated | Y / Y |
| 14119 / igtexteditorvaluechanged | 42564 / CreateCustomWaveWaveNameValue | _webUi.newWave.waveNameChanged | Not populated | Y / Y |
| 14120 / iggridselectionrowselectionchanged | 42566 / WaveFlowGrid | _webUi.newWave.waveFlowRowChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19323 / 14117 | PUTServiceURL | Y / Y | 84 |
| 19324 / 14117 | POSTAddToWaveServiceURL | Y / Y | 92 |
| 19325 / 14117 | POSTAddFilteredShipmentsToWaveServiceURL | Y / Y | 122 |
| 19326 / 14117 | RedirectURL | Y / Y | 40 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 5 selected candidate rows for this Screen: **5 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32771 | 42563 / Not applicable | data-dbtable | database_identifier | METADATA_TRANS_WAVE_MASTER_VIEW | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32778 | 42566 / Not applicable | data-dbtable | database_identifier | METADATA_TRANS_WAVE_FLOW_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19323 | 42562 / 14117 | PUTServiceURL | relative_api_path | /outbound/scaleapi/wavesapi/waves-newWave? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19324 | 42562 / 14117 | POSTAddToWaveServiceURL | relative_api_path | /outbound/scaleapi/wavesapi/waves-AddedToWave? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19325 | 42562 / 14117 | POSTAddFilteredShipmentsToWaveServiceURL | relative_api_path | /outbound/scaleapi/wavesapi/waves-AddFilteredShipmentsToWave? | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
