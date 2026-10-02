# Yard Check in & Out — Form 3052, Screen 1562

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3052 |
| MAIN_UI_SCREEN Object ID | 1562 |
| Label / Form resource key | Yard Check in & Out / MNU_YARDCHECKINOUTTRANSACTION |
| Functional area code | 130 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | transaction_menu / 6 |
| Configured path | /scale/trans/yardcheckinout |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/yardcheckinout |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3052 |
| Inspection requirement | view_only_do_not_submit |
| Form configuration table/view | MetaTrans_GetTrailerDetails |
| Help page reference | yardCheckInOut.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3052 |
| Inspection time (UTC) | 2026-10-02T15:26:08.237Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_YARDCHECKINOUTTRANSACTION |
| Observed configured table/view | MetaTrans_GetTrailerDetails |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1562 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Yard Check in & Out is recorded as `transaction_menu`. Its saved configuration contains 1 parts, 7 groups, 16 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3532 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | YardCheckInOutActionCheckIn |

### Part 3532: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14789 / YardCheckInOutMenuPanel | 14788 | Not populated / Not populated | 60 / 100 | Y / Y | Fixed to top=Y; loading=0; nested unit=14788; default=None |
| 14788 / YardCheckInOutMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14788; default=None |
| 14792 / YardCheckInCheckOutMenuPanel | 14791 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=14791; default=None |
| 14790 / MenuActionsDropdown | 14788 | Actions / ACTIONS | 80 / 300 | Y / Y | Fixed to top=N; loading=0; nested unit=14788; default=None |
| 14791 / YardCheckInCheckOutIdGroup | Not populated | Not populated / Not populated | 60 / 400 | Y / Y | Fixed to top=N; loading=0; nested unit=14791; default=None |
| 14793 / UserDefinedFieldsMainAccordion | Not populated | Not populated / Not populated | 40 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=14793; default=None |
| 14794 / UserDefinedSubAccordion | 14793 | User Defined / USERDEFINED | 50 / 500 | Y / Y | Fixed to top=N; loading=2; nested unit=14793; default=None |

#### Group 14789: YardCheckInOutMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42874 / YardCheckInOutActionCheckOut | Check Out / BTN_CHECKOUT | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CHECKOUT |
| 42875 / YardCheckInOutActionCheckIn | Check in / BTN_CHECKIN | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CHECKIN |

#### Group 14792: YardCheckInCheckOutMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42877 / TrailerInfoTrailerIdValue | Trailer ID / TRAILERID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42878 / TrailerInfoAppointmentDateTimeValue | Appointment Date Time / APPOINTMENTDATETIME | 110 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42879 / TrailerInfoCurrentYardLocValue | Initial Yard Location / INITIALYARDLOCATION | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 42880 / TrailerInfoDestinationYardLocValue | Destination Yard Location / DESTIONATIONYARDLOCATION | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 42881 / TrailerInfoDestinationReceivingDockValue | Destination Receiving Dock / DESTINATIONRECDOCK | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14790: MenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42876 / MenuActionCancel | Cancel / BTN_CANCEL | 150 / 800 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 14794: UserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42882 / UserDefinedUDF1Value | User Defined Field 1 / UD_YARDDTL1 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42883 / UserDefinedUDF2Value | User Defined Field 2 / UD_YARDDTL2 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42884 / UserDefinedUDF3Value | User Defined Field 3 / UD_YARDDTL3 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42885 / UserDefinedUDF4Value | User Defined Field 4 / UD_YARDDTL4 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42886 / UserDefinedUDF5Value | User Defined Field 5 / UD_YARDDTL5 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42887 / UserDefinedUDF6Value | User Defined Field 6 / UD_YARDDTL6 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42888 / UserDefinedUDF7Value | User Defined Field 7 / UD_YARDDTL7 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42889 / UserDefinedUDF8Value | User Defined Field 8 / UD_YARDDTL8 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 7 control attributes, 4 events, and 2 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32960 | 42877 / TrailerInfoTrailerIdValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 32961 | 42877 / TrailerInfoTrailerIdValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 32962 | 42879 / TrailerInfoCurrentYardLocValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 32963 | 42879 / TrailerInfoCurrentYardLocValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 32964 | 42879 / TrailerInfoCurrentYardLocValue | Lookup | Y / Y / N | 114 / 0 |
| 32965 | 42880 / TrailerInfoDestinationYardLocValue | Lookup | Y / Y / N | 122 / 0 |
| 32966 | 42881 / TrailerInfoDestinationReceivingDockValue | Lookup | Y / Y / N | 128 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14209 / click | 42874 / YardCheckInOutActionCheckOut | _webUi.yardCheckinOutTransaction.onCheckOutClick | Not populated | Y / Y |
| 14210 / click | 42875 / YardCheckInOutActionCheckIn | _webUi.yardCheckinOutTransaction.onCheckInClick | Not populated | Y / Y |
| 14211 / click | 42876 / MenuActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 14212 / igtexteditorvaluechanged | 42877 / TrailerInfoTrailerIdValue | _webUi.yardCheckinOutTransaction.getTrailerDetails | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19355 / 14209 | POSTServiceURL | Y / Y | 90 |
| 19356 / 14210 | POSTServiceURL | Y / Y | 88 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 2 selected candidate rows for this Screen: **2 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_EVENT_PARAMETERS / 19355 | 42874 / 14209 | POSTServiceURL | relative_api_path | /inbound/scaleapi/YardsApi/Trailer-CheckedOut | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19356 | 42875 / 14210 | POSTServiceURL | relative_api_path | /inbound/scaleapi/YardsApi/Trailer-CheckedIn | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
