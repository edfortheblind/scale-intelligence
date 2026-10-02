# Cancel Wave — Form 4020, Screen 1558

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4020 |
| MAIN_UI_SCREEN Object ID | 1558 |
| Label / Form resource key | Cancel Wave / MNU_WAVECANCELTRANSACTION |
| Functional area code | 30 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/wavecancel |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/wavecancel |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4020 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | IWaveRequestProcessor |
| Help page reference | Cancelwave.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4020 |
| Inspection time (UTC) | 2026-10-02T15:27:29.853Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_WAVECANCELTRANSACTION |
| Observed configured table/view | IWaveRequestProcessor |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1558 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Cancel Wave is recorded as `transaction_context`. Its saved configuration contains 1 parts, 3 groups, 4 controls, and 7 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3528 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | Not populated |

### Part 3528: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14768 / WaveCancelMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14768; default=None |
| 14769 / WaveCancelMenuPanel | 14768 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14768; default=None |
| 14770 / WaveCancelMainPanel | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=14770; default=None |

#### Group 14769: WaveCancelMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42838 / WaveCancelActionAddToWave | Add to Wave / BTN_ADDALLTOWAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_ADDALLTOWAVE |
| 42837 / WaveCancelActionReturnToPool | Return to Pool / BTN_RETURNALLTOPOOL | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_RETURNALLTOPOOL |
| 42836 / ActionCancel | Cancel / BTN_CANCEL | 150 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 14770: WaveCancelMainPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42839 / WaveCancelGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 42839 `WaveCancelGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14555 / ICON | Not populated / Icon / ICON | 10 / 10 / 10 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14557 / InternalLaunchNum | InternalLaunchNum / Wave Number / WAVENUMBER | 90 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14556 / COLOR | Not populated / Color / COLOR | 10 / 10 / 20 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14558 / LaunchName | LaunchName / Wave Name / WAVENAME | 10 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14559 / WarehousValue | WarehousValue / Not populated / Warehouse | 10 / 10 / 30 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14560 / LaunchFlowName | LaunchFlowName / Wave Flow / WAVEFLOW | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14561 / TotalShipments | TotalShipments / Total Shipments / TOTALSHIPMENTS | 90 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 6 control attributes, 4 events, and 3 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32938 | 42839 / WaveCancelGrid | data-formId | Y / Y / Y | 8 / 0 |
| 32939 | 42839 / WaveCancelGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 32940 | 42839 / WaveCancelGrid | data-groupBy | Y / Y / Y | 10 / 0 |
| 32941 | 42839 / WaveCancelGrid | data-headerkey | Y / Y / N | 34 / 0 |
| 32942 | 42839 / WaveCancelGrid | pageSize | Y / Y / Y | 4 / 0 |
| 32943 | 42839 / WaveCancelGrid | data-local | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14197 / click | 42838 / WaveCancelActionAddToWave | _webUi.cancelWaveTransaction.onAddToWave | Not populated | Y / Y |
| 14196 / click | 42837 / WaveCancelActionReturnToPool | _webUi.cancelWaveTransaction.onReturnToPool | Not populated | Y / Y |
| 14195 / click | 42836 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 14198 / iggridselectionrowselectionchanging | 42839 / WaveCancelGrid | _webUi.cancelWaveTransaction.gridSelectionRowChanging | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19352 / 14197 | POSTEligibleWaveURL | Y / Y | 104 |
| 19353 / 14197 | POSTSAddShipmentToWaveURL | Y / Y | 104 |
| 19351 / 14196 | POSTReturnedToPoolURL | Y / Y | 108 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 4 selected candidate rows for this Screen: **3 accepted tokens** and **1 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32938 | 42839 / Not applicable | data-formId | form_id | 4020 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19351 | 42837 / 14196 | POSTReturnedToPoolURL | relative_api_path | /outbound/scaleapi/WavesApi/cancelwaves-returnedtopool | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19352 | 42838 / 14197 | POSTEligibleWaveURL | relative_api_path | /outbound/scaleapi/WavesApi/cancelwave-eligiblewaves | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
