# Screen Control Event — Form 50004, Screen 1678

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 50004 |
| MAIN_UI_SCREEN Object ID | 1678 |
| Label / Form resource key | Screen Control Event / MNU_SCREENCONTROLEVENTDETAILS |
| Functional area code | 120 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | metadata_editor / 6 |
| Configured path | /scale/details/screencontrolevent |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/screencontrolevent |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/50004 |
| Inspection requirement | context_required_configuration_view_cancel_only |
| Form configuration table/view | ScreenControlEvent |
| Help page reference | configMetadata.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/50004 |
| Inspection time (UTC) | 2026-10-02T15:31:42.507Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_SCREENCONTROLEVENTDETAILS |
| Observed configured table/view | ScreenControlEvent |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1678 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Screen Control Event is recorded as `metadata_editor`. Its saved configuration contains 1 parts, 7 groups, 24 controls, and 5 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3904 / CrudDataPane | Not populated / Not populated | 10 / 25 | Y / Y / N | EventMenuActionSave |

### Part 3904: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16377 / EventMenu | Not populated | Not populated / Not populated | 150 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=16377; default=None |
| 16378 / EventMenuPanel | 16377 | Not populated / Not populated | 60 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=16377; default=None |
| 16379 / ScreenControlEventMainAccordion | Not populated | Not populated / Not populated | 140 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=16379; default=None |
| 16380 / ScreenControlEventEventPropertiesSubAccordion | 16379 | Event Properties / EVENTPROPERTIES | 50 / 3000 | Y / Y | Fixed to top=N; loading=0; nested unit=16379; default=None |
| 16381 / ScreenControlEventEventParametersSubAccordion | 16379 | Event Parameters / EVENTPARAMETERS | 50 / 4000 | Y / Y | Fixed to top=N; loading=1; nested unit=16379; default=None |
| 16382 / ScreenControlEventGeneralSubAccordion | 16379 | General / GENERAL | 50 / 5000 | Y / Y | Fixed to top=N; loading=1; nested unit=16379; default=None |
| 16383 / ScreenControlEventUserDefinedSubAccordion | 16379 | User Defined / USERDEFINED | 50 / 6000 | Y / Y | Fixed to top=N; loading=1; nested unit=16379; default=None |

#### Group 16378: EventMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48057 / EventHeaderEventId | Not populated / Not populated | 260 / 25 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 48054 / EventMenuActionSave | Save / BTN_SAVE | 150 / 50 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 48056 / ScreenMenuActionPreview | Preview / BTN_PREVIEW | 150 / 75 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_PREVIEW |
| 48055 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 16380: ScreenControlEventEventPropertiesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48058 / EventPropertiesEventIdValue | Event ID / EVENTID | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48059 / EventPropertiesEventNameValue | Event Name / EVENTNAME | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48060 / EventPropertiesGridColumnValue | Grid Column / GRIDCOLUMN | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=10; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=GRIDCOLUMN |

#### Group 16381: ScreenControlEventEventParametersSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48061 / EventParametersMenuActionAdd | Add / BTN_ADD | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowWithNav-1; TOOL_TIP_RESOURCE_KEY=BTN_ADD |
| 48062 / ScreenControlEventParametersGrid | Not populated / Not populated | 20 / 600 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 48062 `ScreenControlEventParametersGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16759 / ParameterName | Parameter_Name / Parameter Name / PARAMETERNAME | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16760 / ParameterValue | Parameter_Value / Parameter Value / PARAMETERVALUE | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16761 / Active | Not populated / Not populated / Active | 40 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16762 / ObjectId | Object_Id / Not populated / ObjectId | 20 / 10 / 60 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16763 / ScreenControlEventId | Screen_Control_Event_Id / Screen Control Event ID / SCREENCONTROLEVENTID | 20 / 10 / 70 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 16382: ScreenControlEventGeneralSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48063 / GeneralObjectIdValue | Object ID / OBJECTID | 90 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48064 / GeneralScreenControlIdValue | Screen Control ID / SCREENCONTROLID | 240 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48065 / GeneralActiveValue | Active / ACTIVE | 130 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48066 / GeneralSystemCreatedValue | System Created / SYSTEMCREATED | 130 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48067 / GeneralUserStampValue | User Stamp / USERSTAMP | 80 / 600 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48068 / GeneralProcessStampValue | Process Stamp / PROCESSSTAMP | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48069 / GeneralDateTimeStampValue | Date Time Stamp / DATETIMESTAMP | 120 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16383: ScreenControlEventUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48070 / UserDefinedUserDefined1Value | User Defined Field 1 / UD_SCREENCONTROLEVENT01 | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48071 / UserDefinedUserDefined2Value | User Defined Field 2 / UD_SCREENCONTROLEVENT02 | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48072 / UserDefinedUserDefined3Value | User Defined Field 3 / UD_SCREENCONTROLEVENT03 | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48073 / UserDefinedUserDefined4Value | User Defined Field 4 / UD_SCREENCONTROLEVENT04 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48074 / UserDefinedUserDefined5Value | User Defined Field 5 / UD_SCREENCONTROLEVENT05 | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48075 / UserDefinedUserDefined6Value | User Defined Field 6 / UD_SCREENCONTROLEVENT06 | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48076 / UserDefinedUserDefined7Value | User Defined Field 7 / UD_SCREENCONTROLEVENT07 | 90 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48077 / UserDefinedUserDefined8Value | User Defined Field 8 / UD_SCREENCONTROLEVENT08 | 90 / 900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 19 control attributes, 6 events, and 6 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 37537 | 48054 / EventMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37538 | 48054 / EventMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37539 | 48058 / EventPropertiesEventIdValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37540 | 48058 / EventPropertiesEventIdValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37541 | 48059 / EventPropertiesEventNameValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37542 | 48059 / EventPropertiesEventNameValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37543 | 48061 / EventParametersMenuActionAdd | data-formId | Y / Y / N | 10 / 0 |
| 37544 | 48061 / EventParametersMenuActionAdd | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37545 | 48062 / ScreenControlEventParametersGrid | data-modelClass | Y / Y / N | 134 / 0 |
| 37546 | 48062 / ScreenControlEventParametersGrid | data-dbtable | Y / Y / N | 62 / 0 |
| 37547 | 48062 / ScreenControlEventParametersGrid | data-headerkey | Y / Y / N | 46 / 0 |
| 37548 | 48062 / ScreenControlEventParametersGrid | data-restdelete | Y / Y / Y | 112 / 0 |
| 37549 | 48062 / ScreenControlEventParametersGrid | data-restFormId | Y / Y / Y | 10 / 0 |
| 37550 | 48062 / ScreenControlEventParametersGrid | pageSize | Y / Y / Y | 4 / 0 |
| 37551 | 48064 / GeneralScreenControlIdValue | href | Y / Y / Y | 134 / 0 |
| 37552 | 48065 / GeneralActiveValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37553 | 48065 / GeneralActiveValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37554 | 48066 / GeneralSystemCreatedValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37555 | 48066 / GeneralSystemCreatedValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16258 / click | 48054 / EventMenuActionSave | _webUi.detailsScreenBinding.save | Not populated | Y / Y |
| 16260 / click | 48056 / ScreenMenuActionPreview | _webUi.metadataBuilder.preview | Not populated | Y / Y |
| 16259 / click | 48055 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 16261 / click | 48061 / EventParametersMenuActionAdd | _webUi.detailsScreenActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 16262 / iggridupdatingrowdeleted | 48062 / ScreenControlEventParametersGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16263 / iggridrendered | 48062 / ScreenControlEventParametersGrid | _webUi.Grid.detailsGridRendered | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 23084 / 16258 | PUTServiceURL | Y / Y | 90 |
| 23085 / 16258 | queryParameter_IdField | Y / Y | 16 |
| 23086 / 16258 | POSTServiceURL | Y / Y | 88 |
| 23087 / 16261 | URL | Y / Y | 196 |
| 23088 / 16262 | CommitSelector | Y / Y | 34 |
| 23089 / 16263 | EnableAction_EventParametersMenuActionAdd | Y / Y | 86 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 8 selected candidate rows for this Screen: **8 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 37537 | 48054 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37538 | 48054 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37543 | 48061 / Not applicable | data-formId | form_id | 50003 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37544 | 48061 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37546 | 48062 / Not applicable | data-dbtable | database_identifier | Screen_Control_Event_Parameters | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37548 | 48062 / Not applicable | data-restdelete | relative_api_path | /general/scaleapi/screenControlEventParametersApi/delete | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23084 | 48054 / 16258 | PUTServiceURL | relative_api_path | /general/scaleapi/screenControlEventApi/save? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23086 | 48054 / 16258 | POSTServiceURL | relative_api_path | /general/scaleapi/screenControlEventApi/save | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
