# Screen Control Grid Columns — Form 50001, Screen 1679

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 50001 |
| MAIN_UI_SCREEN Object ID | 1679 |
| Label / Form resource key | Screen Control Grid Columns / MNU_SCREENCONTROLGRIDCOLUMNSDETAILS |
| Functional area code | 120 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | metadata_editor / 6 |
| Configured path | /scale/details/screencontrolgridcolumns |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/screencontrolgridcolumns |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/50001 |
| Inspection requirement | context_required_configuration_view_cancel_only |
| Form configuration table/view | ScreenControlGridColumns |
| Help page reference | configMetadata.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/50001 |
| Inspection time (UTC) | 2026-10-02T15:31:36.192Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_SCREENCONTROLGRIDCOLUMNSDETAILS |
| Observed configured table/view | ScreenControlGridColumns |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1679 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Screen Control Grid Columns is recorded as `metadata_editor`. Its saved configuration contains 1 parts, 8 groups, 37 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3905 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | GridColumnsMenuActionSave |

### Part 3905: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16384 / GridColumnsMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16384; default=None |
| 16385 / GridColumnsMenuPanel | 16384 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16384; default=None |
| 16386 / ScreenControlGridColumnMainAccordion | Not populated | Not populated / Not populated | 140 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=16386; default=None |
| 16387 / ControlGridColumnFieldPropertiesSubAccordion | 16386 | Field Properties / FIELDPROPERTIES | 50 / 3000 | Y / Y | Fixed to top=N; loading=0; nested unit=16386; default=None |
| 16388 / ControlGridColumnColumnPropertiesSubAccordion | 16386 | Column Properties / COLUMNPROPERTIES | 50 / 4000 | Y / Y | Fixed to top=N; loading=1; nested unit=16386; default=None |
| 16389 / ControlGridColumnDataSourcePropertiesSubAccordion | 16386 | Data Source Properties / DATASOURCEPROPERTIES | 50 / 4500 | Y / Y | Fixed to top=N; loading=1; nested unit=16386; default=None |
| 16390 / ControlGridColumnGeneralSubAccordion | 16386 | General / GENERAL | 50 / 5000 | Y / Y | Fixed to top=N; loading=1; nested unit=16386; default=None |
| 16391 / ControlGridColumnUserDefinedSubAccordion | 16386 | User Defined / USERDEFINED | 50 / 6000 | Y / Y | Fixed to top=N; loading=1; nested unit=16386; default=None |

#### Group 16385: GridColumnsMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48081 / GridColumnsHeaderField | Not populated / Not populated | 260 / 25 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 48078 / GridColumnsMenuActionSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 48080 / ScreenMenuActionPreview | Preview / BTN_PREVIEW | 150 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_PREVIEW |
| 48079 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 16387: ControlGridColumnFieldPropertiesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48082 / FieldPropertiesFieldNameValue | Field Name / FIELDNAME | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48083 / FieldPropertiesFieldValue | Field / FIELD | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48084 / FieldPropertiesSQlClauseTypeValue | SQL Clause Type / SQLCLAUSETYPE | 80 / 400 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48085 / FieldPropertiesFieldTypeValue | Field Type / FIELDTYPE | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48086 / FieldPropertiesResourceKeyValue | Resource Key / RESOURCEKEY | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48087 / FieldPropertiesIsPrimaryKeyValue | Is Primary Key / ISPRIMARYKEY | 130 / 700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16388: ControlGridColumnColumnPropertiesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48088 / ColumnPropertiesWidthValue | Width / FIELDWIDTH | 90 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48089 / ColumnPropertiesSequenceValue | Sequence / METASEQUENCE | 90 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48090 / ColumnPropertiesDecimalPositionsValue | Decimal Positions / DECIMALPOSITIONS | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48091 / ColumnPropertiesColumnTemplateValue | Column Template / COLUMNTEMPLATE | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48092 / ColumnPropertiesValidationMessageValue | Validation Message / VALIDATIONMESSAGE | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48093 / ColumnPropertiesIsEditableValue | Is Editable / ISEDITABLE | 130 / 800 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48094 / ColumnPropertiesRequiredForEditValue | Required for Edit / REQUIREDFOREDIT | 130 / 900 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48095 / ColumnPropertiesHiddenValue | Hidden / HIDDEN | 130 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48096 / ColumnPropertiesAllowSortValue | Allow Sort / ALLOWSORT | 130 / 1100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16389: ControlGridColumnDataSourcePropertiesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48097 / DataSourcePropertiesDataSourceTypeValue | Data Source Type / DATASOURCETYPE | 80 / 200 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48098 / DataSourcePropertiesDataSourceValue | Data Source / DATASOURCE | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48099 / DataSourcePropertiesBindToForInsertValue | Bind to for Insert / BINDTOFORINSERT | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16390: ControlGridColumnGeneralSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48100 / GeneralObjectIdValue | Object ID / OBJECTID | 90 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48101 / GeneralScreenControlIdValue | Screen Control ID / SCREENCONTROLID | 240 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48102 / GeneralActiveValue | Active / ACTIVE | 130 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48103 / GeneralSystemCreatedValue | System Created / SYSTEMCREATED | 130 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48104 / GeneralUserStampValue | User Stamp / USERSTAMP | 80 / 600 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48105 / GeneralProcessStampValue | Process Stamp / PROCESSSTAMP | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48106 / GeneralDateTimeStampValue | Date Time Stamp / DATETIMESTAMP | 120 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16391: ControlGridColumnUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48107 / UserDefinedUserDefined1Value | User Defined Field 1 / UD_SCREENCONTROLGRIDCOLUMN01 | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48108 / UserDefinedUserDefined2Value | User Defined Field 2 / UD_SCREENCONTROLGRIDCOLUMN02 | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48109 / UserDefinedUserDefined3Value | User Defined Field 3 / UD_SCREENCONTROLGRIDCOLUMN03 | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48110 / UserDefinedUserDefined4Value | User Defined Field 4 / UD_SCREENCONTROLGRIDCOLUMN04 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48111 / UserDefinedUserDefined5Value | User Defined Field 5 / UD_SCREENCONTROLGRIDCOLUMN05 | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48112 / UserDefinedUserDefined6Value | User Defined Field 6 / UD_SCREENCONTROLGRIDCOLUMN06 | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48113 / UserDefinedUserDefined7Value | User Defined Field 7 / UD_SCREENCONTROLGRIDCOLUMN07 | 90 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48114 / UserDefinedUserDefined8Value | User Defined Field 8 / UD_SCREENCONTROLGRIDCOLUMN08 | 90 / 900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 23 control attributes, 3 events, and 3 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 37556 | 48078 / GridColumnsMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37557 | 48078 / GridColumnsMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37558 | 48084 / FieldPropertiesSQlClauseTypeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37559 | 48084 / FieldPropertiesSQlClauseTypeValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37560 | 48087 / FieldPropertiesIsPrimaryKeyValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37561 | 48087 / FieldPropertiesIsPrimaryKeyValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37562 | 48088 / ColumnPropertiesWidthValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 37563 | 48088 / ColumnPropertiesWidthValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 37564 | 48089 / ColumnPropertiesSequenceValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 37565 | 48089 / ColumnPropertiesSequenceValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 37566 | 48093 / ColumnPropertiesIsEditableValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37567 | 48093 / ColumnPropertiesIsEditableValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37568 | 48094 / ColumnPropertiesRequiredForEditValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37569 | 48094 / ColumnPropertiesRequiredForEditValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37570 | 48095 / ColumnPropertiesHiddenValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37571 | 48095 / ColumnPropertiesHiddenValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37572 | 48096 / ColumnPropertiesAllowSortValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37573 | 48096 / ColumnPropertiesAllowSortValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37574 | 48101 / GeneralScreenControlIdValue | href | Y / Y / Y | 134 / 0 |
| 37575 | 48102 / GeneralActiveValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37576 | 48102 / GeneralActiveValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37577 | 48103 / GeneralSystemCreatedValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37578 | 48103 / GeneralSystemCreatedValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16264 / click | 48078 / GridColumnsMenuActionSave | _webUi.detailsScreenBinding.save | Not populated | Y / Y |
| 16266 / click | 48080 / ScreenMenuActionPreview | _webUi.metadataBuilder.preview | Not populated | Y / Y |
| 16265 / click | 48079 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 23090 / 16264 | PUTServiceURL | Y / Y | 102 |
| 23091 / 16264 | queryParameter_IdField | Y / Y | 16 |
| 23092 / 16264 | POSTServiceURL | Y / Y | 100 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 4 selected candidate rows for this Screen: **4 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 37556 | 48078 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37557 | 48078 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23090 | 48078 / 16264 | PUTServiceURL | relative_api_path | /general/scaleapi/screenControlGridColumnsApi/save? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23092 | 48078 / 16264 | POSTServiceURL | relative_api_path | /general/scaleapi/screenControlGridColumnsApi/save | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
