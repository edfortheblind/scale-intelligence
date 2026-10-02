# Indirect Labor Workbench — Form 4116, Screen 1738

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4116 |
| MAIN_UI_SCREEN Object ID | 1738 |
| Label / Form resource key | Indirect Labor Workbench / MNU_INDIRECTLABORWORKBENCHTRANSACTION |
| Functional area code | 90 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | transaction_menu / 6 |
| Configured path | /scale/trans/indirectlaborworkbench |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/indirectlaborworkbench |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4116 |
| Inspection requirement | view_only_do_not_submit |
| Form configuration table/view | MetaTrans_IndirectLaborWorkbenchLog |
| Help page reference | Not populated |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4116 |
| Inspection time (UTC) | 2026-10-02T15:30:41.649Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_INDIRECTLABORWORKBENCHTRANSACTION |
| Observed configured table/view | MetaTrans_IndirectLaborWorkbenchLog |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1738 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Indirect Labor Workbench is recorded as `transaction_menu`. Its saved configuration contains 1 parts, 5 groups, 6 controls, and 5 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4201 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | IndirectLaborWorkbenchSave |

### Part 4201: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17453 / IndirectLaborWorkbenchMenuPanel | 17452 | Not populated / Not populated | 60 / 200 | Y / Y | Fixed to top=Y; loading=0; nested unit=17452; default=None |
| 17452 / IndirectLaborWorkbenchMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=17452; default=None |
| 17455 / IndirectLaborWorkbenchInfoSubAccordion | 17454 | Activity Details / ACTIVITYDETAILS | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=17454; default=None |
| 17454 / IndirectLaborWorkbenchMainAccordion | Not populated | Not populated / Not populated | 40 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=17454; default=None |
| 17456 / EmployeesSubAccordion | 17454 | Employees / EMPLOYEES | 50 / 500 | Y / Y | Fixed to top=N; loading=2; nested unit=17454; default=None |

#### Group 17453: IndirectLaborWorkbenchMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50447 / IndirectLaborWorkbenchSave | Save / BTN_SAVE | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 50446 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 17455: IndirectLaborWorkbenchInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50448 / IndirectLaborWorkbenchActivityTypeValue | Activity Type / ACTIVITYTYPE | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 50449 / ActivityStartDateTimeRangeValue | Not populated / STARTDATETIME\|ENDDATETIME | 190 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17456: EmployeesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50450 / IndirectLaborWorkbenchSupervisorValue | Supervisor / SUPERVISOR | 80 / 150 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 50451 / EmployeesGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 50451 `EmployeesGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 17868 / Description | DESCRIPTION / Employee / EMPLOYEE | 10 / 10 / 20 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 17869 / SUPERVISOR_DESCRIPTION | SUPERVISOR_DESCRIPTION / Supervisor / SUPERVISOR | 10 / 10 / 30 / 320 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 17870 / Department | DEPARTMENT / Department / DEPARTMENT | 10 / 10 / 40 / 300 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 17871 / Supervisor | SUPERVISOR / Supervisor / SUPERVISOR | 10 / 10 / 50 / 1 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 17872 / UserName | USERNAME / Employee / EMPLOYEE | 10 / 10 / 60 / 1 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 13 control attributes, 2 events, and 0 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 39655 | 50448 / IndirectLaborWorkbenchActivityTypeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 39656 | 50448 / IndirectLaborWorkbenchActivityTypeValue | data-msg-required | Y / Y / Y | 18 / 0 |
| 39657 | 50449 / ActivityStartDateTimeRangeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 39658 | 50449 / ActivityStartDateTimeRangeValue | data-msg-required | Y / Y / Y | 18 / 0 |
| 39659 | 50451 / EmployeesGrid | data-modelClass | Y / Y / N | 98 / 0 |
| 39660 | 50451 / EmployeesGrid | data-groupBy | Y / Y / Y | 10 / 0 |
| 39661 | 50451 / EmployeesGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 39662 | 50451 / EmployeesGrid | pageSize | Y / Y / Y | 4 / 0 |
| 39663 | 50451 / EmployeesGrid | data-dbtable | Y / Y / N | 44 / 0 |
| 39664 | 50451 / EmployeesGrid | data-dbObjectType | Y / Y / N | 4 / 0 |
| 39665 | 50451 / EmployeesGrid | data-local | Y / Y / Y | 8 / 0 |
| 39666 | 50451 / EmployeesGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 39667 | 50451 / EmployeesGrid | rowSelectors | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17414 / click | 50446 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 17415 / igcomboselectionchanged | 50450 / IndirectLaborWorkbenchSupervisorValue | _webUi.indirectLaborWorkbenchTransaction.onSupervisorSelectionChanged | Not populated | Y / Y |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 1 selected candidate rows for this Screen: **1 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 39663 | 50451 / Not applicable | data-dbtable | database_identifier | MetaTrans_GetEmployees | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
