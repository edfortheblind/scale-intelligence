# Form — Form 50009, Screen 1673

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 50009 |
| MAIN_UI_SCREEN Object ID | 1673 |
| Label / Form resource key | Form / MNU_FORMDETAILS |
| Functional area code | 120 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | metadata_editor / 6 |
| Configured path | /scale/details/form |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/form |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/50009 |
| Inspection requirement | context_required_configuration_view_cancel_only |
| Form configuration table/view | Form |
| Help page reference | configMetadata.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/50009 |
| Inspection time (UTC) | 2026-10-02T15:31:52.458Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_FORMDETAILS |
| Observed configured table/view | Form |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1673 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Form is recorded as `metadata_editor`. Its saved configuration contains 1 parts, 7 groups, 21 controls, and 8 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3899 / CrudDataPane | Not populated / Not populated | 10 / 25 | Y / Y / N | FormMenuActionSave |

### Part 3899: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16338 / FormMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16338; default=None |
| 16339 / FormMenuPanel | 16338 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16338; default=None |
| 16340 / FormMainAccordion | Not populated | Not populated / Not populated | 140 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=16340; default=None |
| 16341 / FormFormPropertiesSubAccordion | 16340 | Form Properties / FORMPROPERTIES | 50 / 3000 | Y / Y | Fixed to top=N; loading=0; nested unit=16340; default=None |
| 16342 / FormScreensSubAccordion | 16340 | Screens / SCREENS | 50 / 4000 | Y / Y | Fixed to top=N; loading=1; nested unit=16340; default=None |
| 16343 / FormGeneralSubAccordion | 16340 | General / GENERAL | 50 / 5000 | Y / Y | Fixed to top=N; loading=1; nested unit=16340; default=None |
| 16344 / FormUserDefinedSubAccordion | 16340 | User Defined / USERDEFINED | 50 / 6000 | Y / Y | Fixed to top=N; loading=1; nested unit=16340; default=None |

#### Group 16339: FormMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47914 / FormHeaderFormId | Not populated / Not populated | 260 / 25 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47912 / FormMenuActionSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 47913 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 16341: FormFormPropertiesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47915 / FormPropertiesFormKeyNameValue | Form Key Name / FORMKEYNAME | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47916 / FormPropertiesTableNameValue | Table Name / TABLENAME | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47917 / FormPropertiesAssociatedFormKeyValue | Associated Form Key / ASSOCIATEDFORMKEY | 10 / 340 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47918 / FormPropertiesSecurityActiveValue | Security Active / SECURITYACTIVE | 130 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16342: FormScreensSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47919 / ScreensMenuActionAdd | Add / BTN_ADD | 150 / 346 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowWithNav-1; TOOL_TIP_RESOURCE_KEY=BTN_ADD |
| 47920 / ScreensGrid | Not populated / Not populated | 20 / 350 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 47920 `ScreensGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16701 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16702 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16703 / Path | PATH / Path / PATH | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16706 / MenuResourceKey | MENU_RESOURCE_KEY / Menu Resource Key / MENURESOURCEKEY | 10 / 10 / 35 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16704 / Active | Not populated / Not populated / Active | 40 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16705 / SystemCreated | Not populated / System Created / SYSTEMCREATED | 40 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16707 / FormId | FORM_ID / Form ID / FORMID | 20 / 10 / 70 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16708 / ObjectId | Object_Id / Not populated / ObjectId | 20 / 10 / 80 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 16343: FormGeneralSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47921 / GeneralFormIdValue | Form ID / FORMID | 90 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47924 / GeneralDateTimeStampValue | Date Time Stamp / DATETIMESTAMP | 120 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47922 / GeneralUserStampValue | User Stamp / USERSTAMP | 80 / 300 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47923 / GeneralProcessStampValue | Process Stamp / PROCESSSTAMP | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16344: FormUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47925 / UserDefinedUserDefined1Value | User Defined Field 1 / UD_FORM01 | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47926 / UserDefinedUserDefined2Value | User Defined Field 2 / UD_FORM02 | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47927 / UserDefinedUserDefined3Value | User Defined Field 3 / UD_FORM03 | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47928 / UserDefinedUserDefined4Value | User Defined Field 4 / UD_FORM04 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47929 / UserDefinedUserDefined5Value | User Defined Field 5 / UD_FORM05 | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47930 / UserDefinedUserDefined6Value | User Defined Field 6 / UD_FORM06 | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47931 / UserDefinedUserDefined7Value | User Defined Field 7 / UD_FORM07 | 90 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47932 / UserDefinedUserDefined8Value | User Defined Field 8 / UD_FORM08 | 90 / 900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 19 control attributes, 5 events, and 6 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 37433 | 47912 / FormMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37434 | 47912 / FormMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37435 | 47915 / FormPropertiesFormKeyNameValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37436 | 47915 / FormPropertiesFormKeyNameValue | data-msg-required | Y / Y / Y | 18 / 0 |
| 37437 | 47916 / FormPropertiesTableNameValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37438 | 47916 / FormPropertiesTableNameValue | data-msg-required | Y / Y / Y | 18 / 0 |
| 37439 | 47918 / FormPropertiesSecurityActiveValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37440 | 47918 / FormPropertiesSecurityActiveValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37441 | 47919 / ScreensMenuActionAdd | data-formId | Y / Y / N | 10 / 0 |
| 37442 | 47919 / ScreensMenuActionAdd | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37443 | 47920 / ScreensGrid | data-modelClass | Y / Y / N | 102 / 0 |
| 37444 | 47920 / ScreensGrid | data-dbtable | Y / Y / N | 28 / 0 |
| 37445 | 47920 / ScreensGrid | data-headerkey | Y / Y / N | 14 / 0 |
| 37446 | 47920 / ScreensGrid | data-restdelete | Y / Y / Y | 80 / 0 |
| 37447 | 47920 / ScreensGrid | data-restFormId | Y / Y / Y | 10 / 0 |
| 37448 | 47920 / ScreensGrid | pageSize | Y / Y / Y | 4 / 0 |
| 37449 | 47921 / GeneralFormIdValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 37450 | 47921 / GeneralFormIdValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 37451 | 47922 / GeneralUserStampValue | data-caseInsensitiveBinding | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16228 / click | 47912 / FormMenuActionSave | _webUi.detailsScreenBinding.save | Not populated | Y / Y |
| 16229 / click | 47913 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 16230 / click | 47919 / ScreensMenuActionAdd | _webUi.detailsScreenActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 16231 / iggridupdatingrowdeleted | 47920 / ScreensGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16232 / iggridrendered | 47920 / ScreensGrid | _webUi.Grid.detailsGridRendered | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 23050 / 16228 | PUTServiceURL | Y / Y | 62 |
| 23051 / 16228 | queryParameter_IdField | Y / Y | 12 |
| 23052 / 16228 | POSTServiceURL | Y / Y | 60 |
| 23053 / 16230 | URL | Y / Y | 128 |
| 23054 / 16231 | CommitSelector | Y / Y | 34 |
| 23055 / 16232 | EnableAction_ScreensMenuActionAdd | Y / Y | 86 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 8 selected candidate rows for this Screen: **8 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 37433 | 47912 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37434 | 47912 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37441 | 47919 / Not applicable | data-formId | form_id | 50008 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37442 | 47919 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37444 | 47920 / Not applicable | data-dbtable | database_identifier | MAIN_UI_SCREEN | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37446 | 47920 / Not applicable | data-restdelete | relative_api_path | /general/scaleapi/mainUiScreenApi/delete | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23050 | 47912 / 16228 | PUTServiceURL | relative_api_path | /general/scaleapi/formApi/save? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23052 | 47912 / 16228 | POSTServiceURL | relative_api_path | /general/scaleapi/formApi/save | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
