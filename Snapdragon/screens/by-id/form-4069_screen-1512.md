# Appointment Calendar — Form 4069, Screen 1512

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4069 |
| MAIN_UI_SCREEN Object ID | 1512 |
| Label / Form resource key | Appointment Calendar / MNU_APPTSCHEDULETRANSACTION |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | transaction_menu / 6 |
| Configured path | /scale/trans/apptschedule |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/apptschedule |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4069 |
| Inspection requirement | view_only_do_not_submit |
| Form configuration table/view | MetaTrans_APPTSCHEDULE |
| Help page reference | apptCalendar.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4069 |
| Inspection time (UTC) | 2026-10-02T15:28:49.221Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_APPTSCHEDULETRANSACTION |
| Observed configured table/view | MetaTrans_APPTSCHEDULE |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1512 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:16:41.070Z | loaded; runtime_inspection | https://trav.manhscale.com/scale/trans/apptschedule; Appointment Calendar | [runtime-root.json](../../evidence/runtime-root.json) |

**Visible grid headers:** Dock Doors; 12am; 1am; 2am; 3am; 4am; 5am; 6am; 7am; 8am; 9am; 10am; 11am; 12pm; 1pm; 2pm; 3pm; 4pm; 5pm; 6pm; 7pm; 8pm; 9pm; 10pm; 11pm.

**Observation limits:** Calendar landing and Actions dropdown inspected; no appointment created or selected.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Appointment Calendar is recorded as `transaction_menu`. Its saved configuration contains 1 parts, 5 groups, 2 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3474 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | Not populated |

### Part 3474: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14501 / ApptScheduleMenuPanel | 14500 | Not populated / Not populated | 60 / 100 | Y / Y | Fixed to top=Y; loading=0; nested unit=14500; default=None |
| 14502 / ApptScheduleActionPanel | 14500 | Actions / ACTIONS | 80 / 200 | Y / Y | Fixed to top=N; loading=0; nested unit=14500; default=None |
| 14500 / ApptScheduleMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14500; default=None |
| 14504 / ApptScheduleCalendarPanel | 14503 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=14503; default=None |
| 14503 / ApptScheduleCalendarGroup | Not populated | Not populated / Not populated | 60 / 400 | Y / Y | Fixed to top=N; loading=0; nested unit=14503; default=None |

#### Group 14502: ApptScheduleActionPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42125 / ListPaneMenuActionNew | New / NEW | 150 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEW |

#### Group 14504: ApptScheduleCalendarPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42126 / ApptScheduleCalendar | Not populated / Not populated | 370 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 32 control attributes, 1 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32437 | 42125 / ListPaneMenuActionNew | data-formId | Y / Y / N | 8 / 0 |
| 32438 | 42125 / ListPaneMenuActionNew | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 32439 | 42126 / ApptScheduleCalendar | scrollTimeOffsetForToday | Y / Y / Y | 2 / 0 |
| 32440 | 42126 / ApptScheduleCalendar | scrollTime | Y / Y / Y | 14 / 0 |
| 32441 | 42126 / ApptScheduleCalendar | slotDuration | Y / Y / Y | 16 / 0 |
| 32442 | 42126 / ApptScheduleCalendar | minTime | Y / Y / Y | 16 / 0 |
| 32443 | 42126 / ApptScheduleCalendar | maxTime | Y / Y / Y | 16 / 0 |
| 32444 | 42126 / ApptScheduleCalendar | displayNowIndicator | Y / Y / Y | 8 / 0 |
| 32445 | 42126 / ApptScheduleCalendar | header | Y / Y / Y | 160 / 0 |
| 32446 | 42126 / ApptScheduleCalendar | defaultView | Y / Y / Y | 22 / 0 |
| 32447 | 42126 / ApptScheduleCalendar | views | Y / Y / Y | 120 / 0 |
| 32448 | 42126 / ApptScheduleCalendar | buttonTextForViews | Y / Y / Y | 60 / 0 |
| 32449 | 42126 / ApptScheduleCalendar | resourceLabelResourceKey | Y / Y / Y | 18 / 0 |
| 32450 | 42126 / ApptScheduleCalendar | resourceAreaWidth | Y / Y / Y | 6 / 0 |
| 32451 | 42126 / ApptScheduleCalendar | heightPercentage | Y / Y / Y | 8 / 0 |
| 32452 | 42126 / ApptScheduleCalendar | resourceIdField | Y / Y / Y | 8 / 0 |
| 32453 | 42126 / ApptScheduleCalendar | eventIdField | Y / Y / Y | 16 / 0 |
| 32454 | 42126 / ApptScheduleCalendar | eventTitleField | Y / Y / Y | 18 / 0 |
| 32455 | 42126 / ApptScheduleCalendar | eventStartField | Y / Y / Y | 24 / 0 |
| 32456 | 42126 / ApptScheduleCalendar | eventEndField | Y / Y / Y | 22 / 0 |
| 32457 | 42126 / ApptScheduleCalendar | eventDetailViewButtonResourceKey | Y / Y / Y | 30 / 0 |
| 32458 | 42126 / ApptScheduleCalendar | dateRangeSelectable | Y / Y / Y | 8 / 0 |
| 32459 | 42126 / ApptScheduleCalendar | eventDetailEditButtonResourceKey | Y / Y / Y | 30 / 0 |
| 32460 | 42126 / ApptScheduleCalendar | eventDetailScreenFormId | Y / Y / Y | 8 / 0 |
| 32461 | 42126 / ApptScheduleCalendar | eventDetailScreenURL | Y / Y / Y | 190 / 0 |
| 32462 | 42126 / ApptScheduleCalendar | onDateRangeSelect | Y / Y / Y | 96 / 0 |
| 32463 | 42126 / ApptScheduleCalendar | onDateRangeUnselect | Y / Y / Y | 96 / 0 |
| 32464 | 42126 / ApptScheduleCalendar | dateRangeUnselectCancel | Y / Y / Y | 34 / 0 |
| 32465 | 42126 / ApptScheduleCalendar | viewRenderEvent | Y / Y / Y | 86 / 0 |
| 32466 | 42126 / ApptScheduleCalendar | resourcesApiURL | Y / Y / Y | 118 / 0 |
| 32467 | 42126 / ApptScheduleCalendar | eventsApiURL | Y / Y / Y | 70 / 0 |
| 32468 | 42126 / ApptScheduleCalendar | eventDetailFields | Y / Y / Y | 168 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 13988 / click | 42125 / ListPaneMenuActionNew | _webUi.apptScheduleTransaction.newAppointmentClicked | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19295 / 13988 | URL | Y / Y | 126 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 4 selected candidate rows for this Screen: **4 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32437 | 42125 / Not applicable | data-formId | form_id | 2765 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32438 | 42125 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32466 | 42126 / Not applicable | resourcesApiURL | relative_api_path | /inbound/scaleapi/recappscheduleapi/receiving-DockLocations | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32467 | 42126 / Not applicable | eventsApiURL | relative_api_path | /inbound/scaleapi/recappscheduleapi | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
