# Shipment Selection — Form 4037, Screen 1683

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4037 |
| MAIN_UI_SCREEN Object ID | 1683 |
| Label / Form resource key | Shipment Selection / MNU_SHIPMENTSELECTIONTRANSACTION |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/shipmentselection |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/shipmentselection |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4037 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | MetaTrans_ShipmentSelection |
| Help page reference | WinShipmentSelect.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4037 |
| Inspection time (UTC) | 2026-10-02T15:27:46.074Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_SHIPMENTSELECTIONTRANSACTION |
| Observed configured table/view | MetaTrans_ShipmentSelection |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1683 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Shipment Selection is recorded as `transaction_context`. Its saved configuration contains 1 parts, 4 groups, 4 controls, and 11 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3909 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | Not populated |

### Part 3909: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16417 / ShipmentSelectionMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16417; default=None |
| 16418 / ShipmentSelectionMenuPanel | 16417 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16417; default=None |
| 16420 / ShipmentSelectionInfoSubPanel | 16419 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=16419; default=None |
| 16419 / ShipmentSelectionMainPanel | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=16419; default=None |

#### Group 16418: ShipmentSelectionMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48203 / ShipmentSelectionShipmentIdValue | Shipment ID / SHIPMENTID | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 48204 / ShipmentSelectionActionSelect | Select / BTN_SELECT | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SELECT |
| 48205 / ShipmentSelectionActionCancel | Not populated / BTN_Cancel | 150 / 600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_Cancel |

#### Group 16420: ShipmentSelectionInfoSubPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48206 / SelectShipmentGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 48206 `SelectShipmentGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16819 / ScheduledShipDate | SCHEDULED_SHIP_DATE / Not populated / ScheduledShipDate | 30 / 10 / 800 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16820 / TrailingStatus | Not populated / Trailing Status / TRAILINGSTS | 10 / 10 / 1000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16821 / LeadingStatus | Not populated / Leading Status / LEADINGSTS | 10 / 10 / 1100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16822 / Carrier | CARRIER / Carrier / CARRIER | 10 / 10 / 1200 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16823 / CarrierService | CARRIER_SERVICE / Carrier Service / CARRIERSERVICE | 10 / 10 / 1300 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16824 / ShipTo | SHIP_TO / Ship To / SHIPTO | 10 / 10 / 1400 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16825 / ShipToName | SHIP_TO_NAME / Ship To Name / SHIPTONAME | 10 / 10 / 1500 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16826 / InternalShipmentNum | INTERNAL_SHIPMENT_NUM / Internal Shipment Number / INTERNALSHIPMENTNUM | 10 / 10 / 1600 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16827 / Warehouse | Warehouse / Not populated / Warehouse | 20 / 10 / 1700 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16828 / ICON | Not populated / Icon / ICON | 10 / 10 / 1750 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16829 / COLOR | Not populated / Color / COLOR | 10 / 10 / 1800 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 7 control attributes, 3 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 37662 | 48206 / SelectShipmentGrid | data-formId | Y / Y / Y | 8 / 0 |
| 37663 | 48206 / SelectShipmentGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 37664 | 48206 / SelectShipmentGrid | data-modelClass | Y / Y / N | 114 / 0 |
| 37665 | 48206 / SelectShipmentGrid | data-headerkey | Y / Y / N | 42 / 0 |
| 37666 | 48206 / SelectShipmentGrid | data-groupBy | Y / Y / Y | 10 / 0 |
| 37667 | 48206 / SelectShipmentGrid | pageSize | Y / Y / Y | 4 / 0 |
| 37668 | 48206 / SelectShipmentGrid | data-queryEngineId | Y / Y / N | 54 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16291 / click | 48204 / ShipmentSelectionActionSelect | _webUi.shipmentSelectionTransaction.transferToSelectedShipment | Not populated | Y / Y |
| 16292 / click | 48205 / ShipmentSelectionActionCancel | _webUi.shipmentSelectionTransaction.cancel | Not populated | Y / Y |
| 16293 / iggridselectionrowselectionchanged | 48206 / SelectShipmentGrid | _webUi.shipmentSelectionTransaction.gridRowSelectionChanging | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 23117 / 16291 | POSTServiceURL | Y / Y | 124 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 2 selected candidate rows for this Screen: **2 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 37662 | 48206 / Not applicable | data-formId | form_id | 4037 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23117 | 48204 / 16291 | POSTServiceURL | relative_api_path | /outbound/scaleapi/shippingcontainersapi/TransferredContainer? | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
