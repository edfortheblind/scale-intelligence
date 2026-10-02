# Database Table View — Form 50012, Screen 1637

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 50012 |
| MAIN_UI_SCREEN Object ID | 1637 |
| Label / Form resource key | Database Table View / MNU_DBTABLEVIEWTRANSACTION |
| Functional area code | 120 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | metadata_editor / 6 |
| Configured path | /scale/trans/dbtableview |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/dbtableview |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/50012 |
| Inspection requirement | context_required_configuration_view_cancel_only |
| Form configuration table/view | MetaTrans_DbTableInfo |
| Help page reference | DbTableView.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/50012 |
| Inspection time (UTC) | 2026-10-02T15:31:56.537Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_DBTABLEVIEWTRANSACTION |
| Observed configured table/view | MetaTrans_DbTableInfo |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1637 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Database Table View is recorded as `metadata_editor`. Its saved configuration contains 1 parts, 4 groups, 3 controls, and 5 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3790 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | Not populated |

### Part 3790: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 15870 / DbTableInfoMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=15870; default=None |
| 15871 / DbTableInfoMenuPanel | 15870 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=15870; default=None |
| 15872 / DBTableINFOHeaderMainAccordion | Not populated | Not populated / Not populated | 40 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=15872; default=None |
| 15873 / DBTableINFOHeaderSubAccordion | 15872 | Select Column to Add / SELECTCOLUMNTOADD | 50 / 3000 | Y / Y | Fixed to top=N; loading=2; nested unit=15872; default=None |

#### Group 15871: DbTableInfoMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 46548 / GridColumnsMenuActionAdd | Add / BTN_ADD | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_ADD |
| 46549 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 15873: DBTableINFOHeaderSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 46550 / DbtableinfoGrid | Not populated / Not populated | 20 / 6300 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 46550 `DbtableinfoGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16153 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16154 / COLOR | Not populated / Color / COLOR | 10 / 10 / 10 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16155 / COLUMN_NAME | COLUMN_NAME / Column Name / COLUMNNAME | 10 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16156 / COLUMN_DATA_TYPE | COLUMN_DATA_TYPE / Column Data Type / COLUMNDATATYPE | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16157 / DATA_TYPE | DATA_TYPE / Data Type / DATATYPE | 10 / 10 / 50 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 6 control attributes, 3 events, and 2 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 36225 | 46548 / GridColumnsMenuActionAdd | data-formId | Y / Y / N | 10 / 0 |
| 36226 | 46548 / GridColumnsMenuActionAdd | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 36227 | 46550 / DbtableinfoGrid | data-modelClass | Y / Y / N | 102 / 0 |
| 36228 | 46550 / DbtableinfoGrid | data-dbObjectType | Y / Y / N | 4 / 0 |
| 36229 | 46550 / DbtableinfoGrid | pageSize | Y / Y / Y | 4 / 0 |
| 36230 | 46550 / DbtableinfoGrid | data-groupBy | Y / Y / Y | 10 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 15708 / click | 46548 / GridColumnsMenuActionAdd | _webUi.DbTableViewTransaction.onAddClick | Not populated | Y / Y |
| 15709 / click | 46549 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 15710 / iggridselectionrowselectionchanged | 46550 / DbtableinfoGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 22203 / 15708 | URL | Y / Y | 132 |
| 22204 / 15710 | EnableAction_GridColumnsMenuActionAdd | Y / Y | 40 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 2 selected candidate rows for this Screen: **2 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 36225 | 46548 / Not applicable | data-formId | form_id | 50001 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 36226 | 46548 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
