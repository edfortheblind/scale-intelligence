# Receiving Appointment Schedule — Form 2765, Screen 1539

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2765 |
| MAIN_UI_SCREEN Object ID | 1539 |
| Label / Form resource key | Receiving Appointment Schedule / MNU_RECAPPSCHEDULETRANSACTION |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/recappschedule |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/recappschedule |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2765 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | MetaTrans_GetRecAppSchedule |
| Help page reference | RecvApptSchedule.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2765 |
| Inspection time (UTC) | 2026-10-02T15:23:46.458Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_RECAPPSCHEDULETRANSACTION |
| Observed configured table/view | MetaTrans_GetRecAppSchedule |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1539 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Receiving Appointment Schedule is recorded as `transaction_context`. Its saved configuration contains 1 parts, 6 groups, 26 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3504 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | RecAppScheduleMenuActionSave |

### Part 3504: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14662 / RecApptScheduleMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14662; default=None |
| 14663 / RecApptScheduleMenuPanel | 14662 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14662; default=None |
| 14664 / RecAppScheduleMainAccordion | Not populated | Not populated / Not populated | 40 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=14664; default=None |
| 14665 / RecAppScheduleScheduleSubAccordion | 14664 | Schedule / SCHEDULE | 50 / 3000 | Y / Y | Fixed to top=N; loading=2; nested unit=14664; default=None |
| 14666 / RecAppScheduleShipFromSubAccordion | 14664 | Ship From / SHIPFROM | 50 / 4000 | Y / Y | Fixed to top=N; loading=1; nested unit=14664; default=None |
| 14667 / RecAppScheduleUserDefinedSubAccordion | 14664 | User Defined / USERDEFINED | 50 / 6000 | Y / Y | Fixed to top=N; loading=1; nested unit=14664; default=None |

#### Group 14663: RecApptScheduleMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42593 / RecApptScheduleMenuActionSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 42594 / ActionCancel | Cancel / BTN_CANCEL | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |
| 42595 / RecApptSchedulerHeaderSectionReceiptId | Not populated / Not populated | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14665: RecAppScheduleScheduleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42596 / ScheduleReceiptIdValue | Receipt ID / RECEIPTID | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 42597 / ScheduleTrailerIdValue | Trailer ID / TRAILERID | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42598 / ScheduleStartDateTimeRangeValue | Not populated / STARTDATE\|STARTTIME\|ENDDATE\|ENDTIME | 200 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlRowNarrowColumn-4; TOOL_TIP_RESOURCE_KEY=None |
| 42599 / ScheduleReceivingDockValue | Receiving Dock / RECEIVINGDOCK | 80 / 600 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42600 / ScheduleCarrierValue | Carrier Name / CARRIERNAME | 80 / 700 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42601 / ScheduleWarehouseValue | Warehouse / WAREHOUSE | 80 / 800 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14666: RecAppScheduleShipFromSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42602 / ShipFromShipFromValue | ID / ID | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42603 / ShipFromCityValue | City / CITY | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42604 / ShipFromNameValue | Name / NAME | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42605 / ShipFromStateValue | State / STATE | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42606 / ShipFromAddress1Value | Address / ADDRESS | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42607 / ShipFromPostalCodeValue | Postal Code / POSTALCODE | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42608 / ShipFromAddress2Value | Address 2 (Optional) / ADDRESS2 | 10 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42609 / ShipFromCountryValue | Country / COUNTRY | 80 / 900 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42610 / ShipFromAddress3Value | Address 3 (Optional) / ADDRESS3 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14667: RecAppScheduleUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42611 / UserDefinedUserDefined1Value | User Defined Field 1 / UD_RECEIVINGAPPOINTMENTSCHEDULE1 | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42612 / UserDefinedUserDefined2Value | User Defined Field 2 / UD_RECEIVINGAPPOINTMENTSCHEDULE2 | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42613 / UserDefinedUserDefined3Value | User Defined Field 3 / UD_RECEIVINGAPPOINTMENTSCHEDULE3 | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42614 / UserDefinedUserDefined4Value | User Defined Field 4 / UD_RECEIVINGAPPOINTMENTSCHEDULE4 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42615 / UserDefinedUserDefined5Value | User Defined Field 5 / UD_RECEIVINGAPPOINTMENTSCHEDULE5 | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42616 / UserDefinedUserDefined6Value | User Defined Field 6 / UD_RECEIVINGAPPOINTMENTSCHEDULE6 | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42617 / UserDefinedUserDefined7Value | User Defined Field 7 / UD_RECEIVINGAPPOINTMENTSCHEDULE7 | 90 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42618 / UserDefinedUserDefined8Value | User Defined Field 8 / UD_RECEIVINGAPPOINTMENTSCHEDULE8 | 90 / 900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 14 control attributes, 6 events, and 2 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32803 | 42593 / RecApptScheduleMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 32804 | 42596 / ScheduleReceiptIdValue | Lookup | Y / Y / N | 198 / 0 |
| 32805 | 42596 / ScheduleReceiptIdValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 32806 | 42596 / ScheduleReceiptIdValue | data-msg-required | Y / Y / Y | 18 / 0 |
| 32807 | 42598 / ScheduleStartDateTimeRangeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 32808 | 42598 / ScheduleStartDateTimeRangeValue | data-msg-required | Y / Y / Y | 18 / 0 |
| 32809 | 42598 / ScheduleStartDateTimeRangeValue | hoursspinDelta | Y / Y / Y | 2 / 0 |
| 32810 | 42598 / ScheduleStartDateTimeRangeValue | minutesspinDelta | Y / Y / Y | 4 / 0 |
| 32811 | 42599 / ScheduleReceivingDockValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 32812 | 42599 / ScheduleReceivingDockValue | data-msg-required | Y / Y / Y | 18 / 0 |
| 32813 | 42617 / UserDefinedUserDefined7Value | data-rule-required | Y / Y / Y | 8 / 0 |
| 32814 | 42617 / UserDefinedUserDefined7Value | data-msg-required | Y / Y / Y | 18 / 1 |
| 32815 | 42618 / UserDefinedUserDefined8Value | data-rule-required | Y / Y / Y | 8 / 0 |
| 32816 | 42618 / UserDefinedUserDefined8Value | data-msg-required | Y / Y / Y | 18 / 1 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14130 / click | 42593 / RecApptScheduleMenuActionSave | _webUi.detailsScreenBinding.invokePUTWebService | Not populated | Y / Y |
| 14131 / click | 42594 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 14132 / igtexteditorvaluechanged | 42596 / ScheduleReceiptIdValue | _webUi.recAppScheduleTransaction.receiptIdChanged | Not populated | Y / Y |
| 14133 / igdatepickervaluechanged | 42598 / ScheduleStartDateTimeRangeValue | Not populated | Not populated | Y / Y |
| 14134 / igcombodatabound | 42605 / ShipFromStateValue | _webUi.recAppScheduleTransaction.comboDatabound | Not populated | Y / Y |
| 14135 / igcombodatabound | 42609 / ShipFromCountryValue | _webUi.recAppScheduleTransaction.comboDatabound | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19328 / 14130 | PUTServiceURL | Y / Y | 82 |
| 19329 / 14130 | queryParameter_IdField | Y / Y | 64 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 2 selected candidate rows for this Screen: **2 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32803 | 42593 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19328 | 42593 / 14130 | PUTServiceURL | relative_api_path | /inbound/scaleapi/recappscheduleapi/save? | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
