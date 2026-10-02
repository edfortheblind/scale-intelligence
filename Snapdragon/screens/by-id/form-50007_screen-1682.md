# Screen Part — Form 50007, Screen 1682

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 50007 |
| MAIN_UI_SCREEN Object ID | 1682 |
| Label / Form resource key | Screen Part / MNU_SCREENPARTDETAILS |
| Functional area code | 120 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | metadata_editor / 6 |
| Configured path | /scale/details/screenpart |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/screenpart |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/50007 |
| Inspection requirement | context_required_configuration_view_cancel_only |
| Form configuration table/view | ScreenPart |
| Help page reference | configMetadata.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/50007 |
| Inspection time (UTC) | 2026-10-02T15:31:48.553Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_SCREENPARTDETAILS |
| Observed configured table/view | ScreenPart |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1682 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Screen Part is recorded as `metadata_editor`. Its saved configuration contains 1 parts, 8 groups, 28 controls, and 11 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3908 / CrudDataPane | Not populated / Not populated | 10 / 25 | Y / Y / N | PartMenuActionSave |

### Part 3908: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16409 / PartMenu | Not populated | Not populated / Not populated | 150 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=16409; default=None |
| 16410 / PartMenuPanel | 16409 | Not populated / Not populated | 60 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=16409; default=None |
| 16411 / ScreenPartMainAccordion | Not populated | Not populated / Not populated | 140 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=16411; default=None |
| 16412 / ScreenPartPartPropertiesSubAccordion | 16411 | Part Properties / PARTPROPERTIES | 50 / 3000 | Y / Y | Fixed to top=N; loading=0; nested unit=16411; default=None |
| 16413 / ScreenPartStylePropertiesSubAccordion | 16411 | Style Properties / STYLEPROPERTIES | 50 / 4000 | Y / Y | Fixed to top=N; loading=1; nested unit=16411; default=None |
| 16414 / ScreenPartScreenGroupsSubAccordion | 16411 | Screen Groups / SCREENGROUPS | 50 / 5000 | Y / Y | Fixed to top=N; loading=1; nested unit=16411; default=None |
| 16415 / ScreenPartGeneralSubAccordion | 16411 | General / GENERAL | 50 / 6000 | Y / Y | Fixed to top=N; loading=1; nested unit=16411; default=None |
| 16416 / ScreenPartUserDefinedSubAccordion | 16411 | User Defined / USERDEFINED | 50 / 7000 | Y / Y | Fixed to top=N; loading=1; nested unit=16411; default=None |

#### Group 16410: PartMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48178 / ScreenPartHeaderPartName | Not populated / Not populated | 260 / 25 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 48175 / PartMenuActionSave | Save / BTN_SAVE | 150 / 50 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 48177 / ScreenMenuActionPreview | Preview / BTN_PREVIEW | 150 / 75 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_PREVIEW |
| 48176 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 16412: ScreenPartPartPropertiesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48179 / PartPropertiesPartNameValue | Part Name / PARTNAME | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48180 / PartPropertiesPartTypeValue | Part Type / PARTTYPE | 80 / 300 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48181 / PartPropertiesResourceKeyValue | Resource Key / RESOURCEKEY | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48182 / PartPropertiesSequenceValue | Sequence / METASEQUENCE | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48183 / PartPropertiesDefaultActionValue | Default Action / DEFAULTACTION | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48184 / PartPropertiesPartialViewValue | Partial View / PARTIALVIEW | 130 / 700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16413: ScreenPartStylePropertiesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48185 / StylePropertiesDivCssClassvalue | Div Css Class / DIVCSSCLASS | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16414: ScreenPartScreenGroupsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48186 / GroupsMenuActionAdd | Add / BTN_ADD | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowWithNav-1; TOOL_TIP_RESOURCE_KEY=BTN_ADD |
| 48187 / ScreenGroupGrid | Not populated / Not populated | 20 / 600 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 48187 `ScreenGroupGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16808 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16809 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16818 / Not populated | SEQUENCE / Not populated / Not populated | Not populated / 30 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16810 / GroupName | GROUP_NAME / Group Name / GROUPNAME | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16811 / GroupType | Not populated / Group Type / GROUPTYPE | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16812 / Active | Not populated / Not populated / Active | 40 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16813 / Sequence | Sequence / Sequence / METASEQUENCE | 20 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16814 / ParentGroupId | Parent_Group_Id / Parent Group ID / PARENTGROUPID | 20 / 10 / 70 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16817 / Not populated | Not populated / Not populated / Not populated | Not populated / 40 / 70 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16815 / NestedGroupUnit | Nested_Group_Unit / Nested Group Unit / NESTEDGROUPUNIT | 20 / 10 / 80 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16816 / ObjectId | Object_Id / Not populated / ObjectId | 20 / 10 / 90 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 16415: ScreenPartGeneralSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48188 / GeneralObjectIdValue | Object ID / OBJECTID | 90 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48189 / GeneralScreenIdValue | Screen ID / SCREENID | 240 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48190 / GeneralActiveValue | Active / ACTIVE | 130 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48191 / GeneralSystemCreatedValue | System Created / SYSTEMCREATED | 130 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48192 / GeneralUserStampValue | User Stamp / USERSTAMP | 80 / 600 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48193 / GeneralProcessStampValue | Process Stamp / PROCESSSTAMP | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48194 / GeneralDateTimeStampValue | Date Time Stamp / DATETIMESTAMP | 120 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16416: ScreenPartUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48195 / UserDefinedUserDefined1Value | User Defined Field 1 / UD_SCREENPART01 | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48196 / UserDefinedUserDefined2Value | User Defined Field 2 / UD_SCREENPART02 | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48197 / UserDefinedUserDefined3Value | User Defined Field 3 / UD_SCREENPART03 | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48198 / UserDefinedUserDefined4Value | User Defined Field 4 / UD_SCREENPART04 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48199 / UserDefinedUserDefined5Value | User Defined Field 5 / UD_SCREENPART05 | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48200 / UserDefinedUserDefined6Value | User Defined Field 6 / UD_SCREENPART06 | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48201 / UserDefinedUserDefined7Value | User Defined Field 7 / UD_SCREENPART07 | 90 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48202 / UserDefinedUserDefined8Value | User Defined Field 8 / UD_SCREENPART08 | 90 / 900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 23 control attributes, 6 events, and 6 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 37639 | 48175 / PartMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37640 | 48175 / PartMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37641 | 48179 / PartPropertiesPartNameValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37642 | 48179 / PartPropertiesPartNameValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37643 | 48180 / PartPropertiesPartTypeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37644 | 48180 / PartPropertiesPartTypeValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37645 | 48182 / PartPropertiesSequenceValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37646 | 48182 / PartPropertiesSequenceValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37647 | 48184 / PartPropertiesPartialViewValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37648 | 48184 / PartPropertiesPartialViewValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37649 | 48186 / GroupsMenuActionAdd | data-formId | Y / Y / N | 10 / 0 |
| 37650 | 48186 / GroupsMenuActionAdd | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37651 | 48187 / ScreenGroupGrid | data-modelClass | Y / Y / N | 100 / 0 |
| 37652 | 48187 / ScreenGroupGrid | data-dbtable | Y / Y / N | 24 / 0 |
| 37653 | 48187 / ScreenGroupGrid | data-headerkey | Y / Y / N | 28 / 0 |
| 37654 | 48187 / ScreenGroupGrid | data-restdelete | Y / Y / Y | 78 / 0 |
| 37655 | 48187 / ScreenGroupGrid | data-restFormId | Y / Y / Y | 10 / 0 |
| 37656 | 48187 / ScreenGroupGrid | pageSize | Y / Y / Y | 4 / 0 |
| 37657 | 48189 / GeneralScreenIdValue | href | Y / Y / Y | 106 / 0 |
| 37658 | 48190 / GeneralActiveValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37659 | 48190 / GeneralActiveValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37660 | 48191 / GeneralSystemCreatedValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37661 | 48191 / GeneralSystemCreatedValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16285 / click | 48175 / PartMenuActionSave | _webUi.detailsScreenBinding.save | Not populated | Y / Y |
| 16287 / click | 48177 / ScreenMenuActionPreview | _webUi.metadataBuilder.preview | Not populated | Y / Y |
| 16286 / click | 48176 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 16288 / click | 48186 / GroupsMenuActionAdd | _webUi.detailsScreenActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 16289 / iggridupdatingrowdeleted | 48187 / ScreenGroupGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16290 / iggridrendered | 48187 / ScreenGroupGrid | _webUi.Grid.detailsGridRendered | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 23111 / 16285 | PUTServiceURL | Y / Y | 74 |
| 23112 / 16285 | queryParameter_IdField | Y / Y | 16 |
| 23113 / 16285 | POSTServiceURL | Y / Y | 72 |
| 23114 / 16288 | URL | Y / Y | 146 |
| 23115 / 16289 | CommitSelector | Y / Y | 34 |
| 23116 / 16290 | EnableAction_GroupsMenuActionAdd | Y / Y | 86 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 8 selected candidate rows for this Screen: **8 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 37639 | 48175 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37640 | 48175 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37649 | 48186 / Not applicable | data-formId | form_id | 50006 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37650 | 48186 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37652 | 48187 / Not applicable | data-dbtable | database_identifier | Screen_Group | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37654 | 48187 / Not applicable | data-restdelete | relative_api_path | /general/scaleapi/screenGroupApi/delete | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23111 | 48175 / 16285 | PUTServiceURL | relative_api_path | /general/scaleapi/screenPartApi/save? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23113 | 48175 / 16285 | POSTServiceURL | relative_api_path | /general/scaleapi/screenPartApi/save | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
