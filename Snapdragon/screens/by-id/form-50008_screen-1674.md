# Screen — Form 50008, Screen 1674

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 50008 |
| MAIN_UI_SCREEN Object ID | 1674 |
| Label / Form resource key | Screen / MNU_MAINUISCREENDETAILS |
| Functional area code | 120 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | metadata_editor / 6 |
| Configured path | /scale/details/mainuiscreen |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/mainuiscreen |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/50008 |
| Inspection requirement | context_required_configuration_view_cancel_only |
| Form configuration table/view | MainUIScreen |
| Help page reference | configMetadata.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/50008 |
| Inspection time (UTC) | 2026-10-02T15:31:50.521Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_MAINUISCREENDETAILS |
| Observed configured table/view | MainUIScreen |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1674 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Screen is recorded as `metadata_editor`. Its saved configuration contains 1 parts, 8 groups, 29 controls, and 10 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3900 / CrudDataPane | Not populated / Not populated | 10 / 25 | Y / Y / N | ScreenMenuActionSave |

### Part 3900: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16345 / ScreenMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16345; default=None |
| 16346 / ScreenMenuPanel | 16345 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16345; default=None |
| 16347 / MenuActionsDropdown | 16345 | Actions / ACTIONS | 80 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=16345; default=None |
| 16348 / MainUIScreenMainAccordion | Not populated | Not populated / Not populated | 140 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=16348; default=None |
| 16349 / MainUIScreenScreenPropertiesSubAccordion | 16348 | Screen Properties / SCREENPROPERTIES | 50 / 3000 | Y / Y | Fixed to top=N; loading=0; nested unit=16348; default=None |
| 16350 / MainUIScreenScreenPartsSubAccordion | 16348 | Screen Parts / SCREENPARTS | 50 / 4000 | Y / Y | Fixed to top=N; loading=1; nested unit=16348; default=None |
| 16351 / MainUIScreenGeneralSubAccordion | 16348 | General / GENERAL | 50 / 5000 | Y / Y | Fixed to top=N; loading=1; nested unit=16348; default=None |
| 16352 / MainUIScreenUserDefinedSubAccordion | 16348 | User Defined / USERDEFINED | 50 / 6000 | Y / Y | Fixed to top=N; loading=1; nested unit=16348; default=None |

#### Group 16346: ScreenMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47935 / ScreenHeaderPath | Not populated / Not populated | 260 / 25 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47934 / ScreenMenuActionPreview | Preview / BTN_PREVIEW | 150 / 75 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_PREVIEW |
| 47933 / ScreenMenuActionSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |

#### Group 16347: MenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47936 / ScreenMenuActionExport | Export / EXPORT | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORT |
| 47937 / MenuActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 16349: MainUIScreenScreenPropertiesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47938 / ScreenPropertiesFunctionalAreaValue | Functional Area / FUNCTIONALAREA | 80 / 200 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47939 / ScreenPropertiesWindowResourceKeyValue | Menu Resource Key / MENURESOURCEKEY | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47940 / ScreenPropertiesPathValue | Path / PATH | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47941 / ScreenPropertiesPathTypeValue | Path Type / PATHTYPE | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47944 / ScreenPropertiesDetailsIdValue | Defaults ID / DEFAULTSID | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47943 / ScreenPropertiesRestrictionsIdValue | Restrictions ID / RESTRICTIONSID | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47942 / ScreenPropertiesShowinAppMenuValue | Show in App Menu / SHOWINAPPMENU | 130 / 800 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16350: MainUIScreenScreenPartsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47945 / PartsMenuActionAdd | Add / BTN_ADD | 150 / 145 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowWithNav-1; TOOL_TIP_RESOURCE_KEY=BTN_ADD |
| 47946 / ScreenPartsLinesGrid | Not populated / Not populated | 20 / 150 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 47946 `ScreenPartsLinesGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16709 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16710 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16718 / Not populated | SEQUENCE / Not populated / Not populated | Not populated / 30 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16711 / PartName | PART_NAME / Part Name / PARTNAME | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16712 / PartType | Not populated / Part Type / PARTTYPE | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16713 / Active | Not populated / Not populated / Active | 40 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16714 / ResourceKey | RESOURCE_KEY / Resource Key / RESOURCEKEY | 10 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16715 / Sequence | Sequence / Sequence / METASEQUENCE | 20 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16716 / ScreenId | SCREEN_ID / Screen ID / SCREENID | 20 / 10 / 70 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16717 / ObjectId | Object_Id / Not populated / ObjectId | 20 / 10 / 90 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 16351: MainUIScreenGeneralSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47947 / GeneralObjectIdValue | Object ID / OBJECTID | 90 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47948 / GeneralFormIdValue | Form ID / FORMID | 240 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47949 / GeneralActiveValue | Active / ACTIVE | 130 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47950 / GeneralSystemCreatedValue | System Created / SYSTEMCREATED | 130 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47951 / GeneralUserStampValue | User Stamp / USERSTAMP | 80 / 600 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47952 / GeneralProcessStampValue | Process Stamp / PROCESSSTAMP | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47953 / GeneralDateTimeStampValue | Date Time Stamp / DATETIMESTAMP | 120 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16352: MainUIScreenUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47954 / UserDefinedUserDefined1Value | User Defined Field 1 / UD_SCREEN01 | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47955 / UserDefinedUserDefined2Value | User Defined Field 2 / UD_SCREEN02 | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47956 / UserDefinedUserDefined3Value | User Defined Field 3 / UD_SCREEN03 | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47957 / UserDefinedUserDefined4Value | User Defined Field 4 / UD_SCREEN04 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47958 / UserDefinedUserDefined5Value | User Defined Field 5 / UD_SCREEN05 | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47959 / UserDefinedUserDefined6Value | User Defined Field 6 / UD_SCREEN06 | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47960 / UserDefinedUserDefined7Value | User Defined Field 7 / UD_SCREEN07 | 90 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47961 / UserDefinedUserDefined8Value | User Defined Field 8 / UD_SCREEN08 | 90 / 900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 25 control attributes, 7 events, and 9 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 37452 | 47933 / ScreenMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37453 | 47933 / ScreenMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37454 | 47936 / ScreenMenuActionExport | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 37455 | 47936 / ScreenMenuActionExport | data-divider | Y / Y / N | 8 / 0 |
| 37456 | 47938 / ScreenPropertiesFunctionalAreaValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37457 | 47938 / ScreenPropertiesFunctionalAreaValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37458 | 47939 / ScreenPropertiesWindowResourceKeyValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37459 | 47939 / ScreenPropertiesWindowResourceKeyValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37460 | 47940 / ScreenPropertiesPathValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37461 | 47940 / ScreenPropertiesPathValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37462 | 47942 / ScreenPropertiesShowinAppMenuValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37463 | 47942 / ScreenPropertiesShowinAppMenuValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37464 | 47945 / PartsMenuActionAdd | data-formId | Y / Y / N | 10 / 0 |
| 37465 | 47945 / PartsMenuActionAdd | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37466 | 47946 / ScreenPartsLinesGrid | data-modelClass | Y / Y / N | 98 / 0 |
| 37467 | 47946 / ScreenPartsLinesGrid | data-dbtable | Y / Y / N | 22 / 0 |
| 37468 | 47946 / ScreenPartsLinesGrid | data-headerkey | Y / Y / N | 18 / 0 |
| 37469 | 47946 / ScreenPartsLinesGrid | data-restdelete | Y / Y / Y | 76 / 0 |
| 37470 | 47946 / ScreenPartsLinesGrid | data-restFormId | Y / Y / Y | 10 / 0 |
| 37471 | 47946 / ScreenPartsLinesGrid | pageSize | Y / Y / Y | 4 / 0 |
| 37472 | 47948 / GeneralFormIdValue | href | Y / Y / Y | 98 / 0 |
| 37473 | 47949 / GeneralActiveValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37474 | 47949 / GeneralActiveValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37475 | 47950 / GeneralSystemCreatedValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37476 | 47950 / GeneralSystemCreatedValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16234 / click | 47934 / ScreenMenuActionPreview | _webUi.metadataBuilder.preview | Not populated | Y / Y |
| 16233 / click | 47933 / ScreenMenuActionSave | _webUi.detailsScreenBinding.save | Not populated | Y / Y |
| 16235 / click | 47936 / ScreenMenuActionExport | _webUi.metadataActions.menuActionPerformPost | Not populated | Y / Y |
| 16236 / click | 47937 / MenuActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 16237 / click | 47945 / PartsMenuActionAdd | _webUi.detailsScreenActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 16238 / iggridupdatingrowdeleted | 47946 / ScreenPartsLinesGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16239 / iggridrendered | 47946 / ScreenPartsLinesGrid | _webUi.Grid.detailsGridRendered | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 23056 / 16233 | PUTServiceURL | Y / Y | 78 |
| 23057 / 16233 | queryParameter_IdField | Y / Y | 16 |
| 23058 / 16233 | POSTServiceURL | Y / Y | 76 |
| 23059 / 16235 | POSTServiceURL | Y / Y | 90 |
| 23060 / 16235 | queryParameter_ObjectId | Y / Y | 16 |
| 23061 / 16235 | queryParameter_PassValue_isNewVersion | Y / Y | 8 |
| 23062 / 16237 | URL | Y / Y | 148 |
| 23063 / 16238 | CommitSelector | Y / Y | 34 |
| 23064 / 16239 | EnableAction_PartsMenuActionAdd | Y / Y | 86 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 10 selected candidate rows for this Screen: **10 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 37452 | 47933 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37453 | 47933 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37454 | 47936 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37464 | 47945 / Not applicable | data-formId | form_id | 50007 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37465 | 47945 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37467 | 47946 / Not applicable | data-dbtable | database_identifier | Screen_Part | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37469 | 47946 / Not applicable | data-restdelete | relative_api_path | /general/scaleapi/screenPartApi/delete | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23056 | 47933 / 16233 | PUTServiceURL | relative_api_path | /general/scaleapi/mainUiScreenApi/save? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23058 | 47933 / 16233 | POSTServiceURL | relative_api_path | /general/scaleapi/mainUiScreenApi/save | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23059 | 47936 / 16235 | POSTServiceURL | relative_api_path | /general/scaleapi/MetadataSQLCreatorApi/save? | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
