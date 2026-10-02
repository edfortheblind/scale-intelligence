# Screen Group — Form 50006, Screen 1680

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 50006 |
| MAIN_UI_SCREEN Object ID | 1680 |
| Label / Form resource key | Screen Group / MNU_SCREENGROUPDETAILS |
| Functional area code | 120 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | metadata_editor / 6 |
| Configured path | /scale/details/screengroup |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/screengroup |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/50006 |
| Inspection requirement | context_required_configuration_view_cancel_only |
| Form configuration table/view | ScreenGroup |
| Help page reference | configMetadata.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/50006 |
| Inspection time (UTC) | 2026-10-02T15:31:46.519Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_SCREENGROUPDETAILS |
| Observed configured table/view | ScreenGroup |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1680 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Screen Group is recorded as `metadata_editor`. Its saved configuration contains 1 parts, 10 groups, 36 controls, and 32 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3906 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | GroupMenuActionSave |

### Part 3906: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16392 / GroupMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16392; default=None |
| 16393 / GroupMenuPanel | 16392 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16392; default=None |
| 16394 / ScreenPartMainAccordion | Not populated | Not populated / Not populated | 140 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=16394; default=None |
| 16395 / ScreenGroupGroupPropertiesSubAccordion | 16394 | Group Properties / GROUPPROPERTIES | 50 / 3000 | Y / Y | Fixed to top=N; loading=0; nested unit=16394; default=None |
| 16396 / ScreenGroupStylePropertiesSubAccordion | 16394 | Style Properties / STYLEPROPERTIES | 50 / 4000 | Y / Y | Fixed to top=N; loading=1; nested unit=16394; default=None |
| 16397 / ScreenGroupChildGroupsSubAccordion | 16394 | Child Groups / CHILDGROUPS | 50 / 5000 | Y / Y | Fixed to top=N; loading=1; nested unit=16394; default=None |
| 16398 / ScreenGroupScreenControlsSubAccordion | 16394 | Screen Controls / SCREENCONTROLS | 50 / 6000 | Y / Y | Fixed to top=N; loading=1; nested unit=16394; default=None |
| 16399 / ScreenGroupScreenGroupColumnsSubAccordion | 16394 | Screen Group Columns / SCREENGROUPCOLUMNS | 50 / 7000 | Y / Y | Fixed to top=N; loading=1; nested unit=16394; default=None |
| 16400 / ScreenGroupGeneralSubAccordion | 16394 | General / GENERAL | 50 / 8000 | Y / Y | Fixed to top=N; loading=1; nested unit=16394; default=None |
| 16401 / ScreenGroupUserDefinedSubAccordion | 16394 | User Defined / USERDEFINED | 50 / 9000 | Y / Y | Fixed to top=N; loading=1; nested unit=16394; default=None |

#### Group 16393: GroupMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48118 / ScreenGroupHeaderGroupName | Not populated / Not populated | 260 / 25 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 48115 / GroupMenuActionSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 48117 / ScreenMenuActionPreview | Preview / BTN_PREVIEW | 150 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_PREVIEW |
| 48116 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 16395: ScreenGroupGroupPropertiesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48119 / GroupPropertiesGroupNameValue | Group Name / GROUPNAME | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48120 / GroupPropertiesGroupTypeValue | Group Type / GROUPTYPE | 80 / 300 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48121 / GroupPropertiesContentLoadingTypeValue | Content Loading Type / CONTENTLOADINGTYPE | 80 / 340 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48122 / GroupPropertiesResourceKeyValue | Resource Key / RESOURCEKEY | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48123 / GroupPropertiesSequenceValue | Sequence / METASEQUENCE | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48124 / GroupPropertiesDefaultActionValue | Default Action / DEFAULTACTION | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48125 / GroupPropertiesFixedToTopValue | Fixed to Top / FIXEDTOTOP | 130 / 700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16396: ScreenGroupStylePropertiesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48126 / StylePropertiesDivCssClassvalue | Div Css Class / DIVCSSCLASS | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48127 / StylePropertiesRowCssClassvalue | Row Css Class / ROWCSSCLASS | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16397: ScreenGroupChildGroupsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48128 / ChildGroupsMenuActionAdd | Add / BTN_ADD | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowWithNav-1; TOOL_TIP_RESOURCE_KEY=BTN_ADD |
| 48129 / ScreenGroupChildGroupsGrid | Not populated / Not populated | 20 / 600 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 48129 `ScreenGroupChildGroupsGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16764 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16765 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16773 / Not populated | SEQUENCE / Not populated / Not populated | Not populated / 30 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16766 / GroupName | GROUP_NAME / Group Name / GROUPNAME | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16767 / GroupType | Not populated / Group Type / GROUPTYPE | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16768 / Active | Not populated / Not populated / Active | 40 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16769 / Sequence | SEQUENCE / Sequence / METASEQUENCE | 20 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16770 / ObjectId | Object_Id / Not populated / ObjectId | 20 / 10 / 60 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16771 / ParentGroupId | Parent_Group_Id / Parent Group ID / PARENTGROUPID | 20 / 10 / 70 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16772 / NestedGroupUnit | NESTED_GROUP_UNIT / Nested Group Unit / NESTEDGROUPUNIT | 20 / 10 / 70 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 16398: ScreenGroupScreenControlsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48130 / ControlsMenuActionAdd | Add / BTN_ADD | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowWithNav-1; TOOL_TIP_RESOURCE_KEY=BTN_ADD |
| 48131 / ScreenControlsGrid | Not populated / Not populated | 20 / 600 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 48131 `ScreenControlsGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16774 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16775 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16786 / Not populated | SEQUENCE / Not populated / Not populated | Not populated / 30 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16776 / ControlName | CONTROL_NAME / Control Name / CONTROLNAME | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16777 / ControlType | Not populated / Control Type / CONTROLTYPE | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16778 / Active | Not populated / Not populated / Active | 40 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16779 / ResourceKey | RESOURCE_KEY / Resource Key / RESOURCEKEY | 10 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16780 / Sequence | SEQUENCE / Sequence / METASEQUENCE | 20 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16781 / DataSource | DATA_SOURCE / Data Source / DATASOURCE | 10 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16782 / DataSourceType | DATA_SOURCE_TYPE / Data Source Type / DATASOURCETYPE | 10 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16783 / ObjectId | Object_Id / Not populated / ObjectId | 20 / 10 / 60 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16784 / ScreenGroupId | Screen_Group_Id / Screen Group ID / SCREENGROUPID | 20 / 10 / 70 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16785 / Not populated | Not populated / Not populated / Not populated | Not populated / 40 / 70 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 16399: ScreenGroupScreenGroupColumnsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48132 / GroupColumnsMenuActionAdd | Add / BTN_ADD | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowWithNav-1; TOOL_TIP_RESOURCE_KEY=BTN_ADD |
| 48133 / ScreenGroupColumnsGrid | Not populated / Not populated | 20 / 600 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 48133 `ScreenGroupColumnsGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16787 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16788 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16795 / Not populated | SEQUENCE / Not populated / Not populated | Not populated / 30 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16789 / ColumnName | COLUMN_NAME / Column Name / COLUMNNAME | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16790 / ColumnCssClass | COLUMN_CSS_CLASS / Column Css Class / COLUMNCSSCLASS | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16791 / Active | Not populated / Not populated / Active | 40 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16792 / Sequence | SEQUENCE / Sequence / METASEQUENCE | 20 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16793 / ObjectId | Object_Id / Not populated / ObjectId | 20 / 10 / 60 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16794 / ScreenGroupId | Screen_Group_Id / Screen Group ID / SCREENGROUPID | 20 / 10 / 70 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 16400: ScreenGroupGeneralSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48134 / GeneralObjectIdValue | Object ID / OBJECTID | 90 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48135 / GeneralScreenPartIdValue | Screen Part ID / SCREENPARTID | 240 / 240 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48136 / GeneralNestedGroupUnitValue | Nested Group Unit / NESTEDGROUPUNIT | 90 / 280 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48137 / GeneralParentGroupIdValue | Parent Group ID / PARENTGROUPID | 10 / 320 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48138 / GeneralActiveValue | Active / ACTIVE | 130 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48139 / GeneralSystemCreatedValue | System Created / SYSTEMCREATED | 130 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48140 / GeneralUserStampValue | User Stamp / USERSTAMP | 80 / 600 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48141 / GeneralProcessStampValue | Process Stamp / PROCESSSTAMP | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48142 / GeneralDateTimeStampValue | Date Time Stamp / DATETIMESTAMP | 120 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16401: ScreenGroupUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48143 / UserDefinedUserDefined1Value | User Defined Field 1 / UD_SCREENGROUP01 | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48144 / UserDefinedUserDefined2Value | User Defined Field 2 / UD_SCREENGROUP02 | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48145 / UserDefinedUserDefined3Value | User Defined Field 3 / UD_SCREENGROUP03 | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48146 / UserDefinedUserDefined4Value | User Defined Field 4 / UD_SCREENGROUP04 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48147 / UserDefinedUserDefined5Value | User Defined Field 5 / UD_SCREENGROUP05 | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48148 / UserDefinedUserDefined6Value | User Defined Field 6 / UD_SCREENGROUP06 | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48149 / UserDefinedUserDefined7Value | User Defined Field 7 / UD_SCREENGROUP07 | 90 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48150 / UserDefinedUserDefined8Value | User Defined Field 8 / UD_SCREENGROUP08 | 90 / 900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 41 control attributes, 12 events, and 12 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 37579 | 48115 / GroupMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37580 | 48115 / GroupMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37581 | 48119 / GroupPropertiesGroupNameValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37582 | 48119 / GroupPropertiesGroupNameValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37583 | 48120 / GroupPropertiesGroupTypeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37584 | 48120 / GroupPropertiesGroupTypeValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37585 | 48121 / GroupPropertiesContentLoadingTypeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37586 | 48121 / GroupPropertiesContentLoadingTypeValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37587 | 48123 / GroupPropertiesSequenceValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 37588 | 48123 / GroupPropertiesSequenceValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 37589 | 48125 / GroupPropertiesFixedToTopValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37590 | 48125 / GroupPropertiesFixedToTopValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37591 | 48128 / ChildGroupsMenuActionAdd | data-formId | Y / Y / N | 10 / 0 |
| 37592 | 48128 / ChildGroupsMenuActionAdd | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37593 | 48129 / ScreenGroupChildGroupsGrid | data-modelClass | Y / Y / N | 100 / 0 |
| 37594 | 48129 / ScreenGroupChildGroupsGrid | data-dbtable | Y / Y / N | 24 / 0 |
| 37595 | 48129 / ScreenGroupChildGroupsGrid | data-headerkey | Y / Y / N | 30 / 0 |
| 37596 | 48129 / ScreenGroupChildGroupsGrid | data-restdelete | Y / Y / Y | 78 / 0 |
| 37597 | 48129 / ScreenGroupChildGroupsGrid | data-restFormId | Y / Y / Y | 10 / 0 |
| 37598 | 48129 / ScreenGroupChildGroupsGrid | pageSize | Y / Y / Y | 4 / 0 |
| 37599 | 48130 / ControlsMenuActionAdd | data-formId | Y / Y / N | 10 / 0 |
| 37600 | 48130 / ControlsMenuActionAdd | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37601 | 48131 / ScreenControlsGrid | data-modelClass | Y / Y / N | 104 / 0 |
| 37602 | 48131 / ScreenControlsGrid | data-dbtable | Y / Y / N | 28 / 0 |
| 37603 | 48131 / ScreenControlsGrid | data-headerkey | Y / Y / N | 30 / 0 |
| 37604 | 48131 / ScreenControlsGrid | data-restdelete | Y / Y / Y | 82 / 0 |
| 37605 | 48131 / ScreenControlsGrid | data-restFormId | Y / Y / Y | 10 / 0 |
| 37606 | 48131 / ScreenControlsGrid | pageSize | Y / Y / Y | 4 / 0 |
| 37607 | 48132 / GroupColumnsMenuActionAdd | data-formId | Y / Y / N | 10 / 0 |
| 37608 | 48132 / GroupColumnsMenuActionAdd | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37609 | 48133 / ScreenGroupColumnsGrid | data-modelClass | Y / Y / N | 114 / 0 |
| 37610 | 48133 / ScreenGroupColumnsGrid | data-dbtable | Y / Y / N | 38 / 0 |
| 37611 | 48133 / ScreenGroupColumnsGrid | data-headerkey | Y / Y / N | 30 / 0 |
| 37612 | 48133 / ScreenGroupColumnsGrid | data-restdelete | Y / Y / Y | 90 / 0 |
| 37613 | 48133 / ScreenGroupColumnsGrid | data-restFormId | Y / Y / Y | 10 / 0 |
| 37614 | 48133 / ScreenGroupColumnsGrid | pageSize | Y / Y / Y | 4 / 0 |
| 37615 | 48135 / GeneralScreenPartIdValue | href | Y / Y / Y | 122 / 0 |
| 37616 | 48138 / GeneralActiveValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37617 | 48138 / GeneralActiveValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37618 | 48139 / GeneralSystemCreatedValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37619 | 48139 / GeneralSystemCreatedValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16267 / click | 48115 / GroupMenuActionSave | _webUi.detailsScreenBinding.save | Not populated | Y / Y |
| 16269 / click | 48117 / ScreenMenuActionPreview | _webUi.metadataBuilder.preview | Not populated | Y / Y |
| 16268 / click | 48116 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 16270 / click | 48128 / ChildGroupsMenuActionAdd | _webUi.detailsScreenActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 16271 / iggridupdatingrowdeleted | 48129 / ScreenGroupChildGroupsGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16272 / iggridrendered | 48129 / ScreenGroupChildGroupsGrid | _webUi.Grid.detailsGridRendered | Not populated | Y / Y |
| 16273 / click | 48130 / ControlsMenuActionAdd | _webUi.detailsScreenActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 16274 / iggridupdatingrowdeleted | 48131 / ScreenControlsGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16275 / iggridrendered | 48131 / ScreenControlsGrid | _webUi.Grid.detailsGridRendered | Not populated | Y / Y |
| 16276 / click | 48132 / GroupColumnsMenuActionAdd | _webUi.detailsScreenActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 16277 / iggridupdatingrowdeleted | 48133 / ScreenGroupColumnsGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16278 / iggridrendered | 48133 / ScreenGroupColumnsGrid | _webUi.Grid.detailsGridRendered | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 23093 / 16267 | PUTServiceURL | Y / Y | 76 |
| 23094 / 16267 | queryParameter_IdField | Y / Y | 16 |
| 23095 / 16267 | POSTServiceURL | Y / Y | 74 |
| 23096 / 16270 | URL | Y / Y | 148 |
| 23097 / 16271 | CommitSelector | Y / Y | 34 |
| 23098 / 16272 | EnableAction_ChildGroupsMenuActionAdd | Y / Y | 86 |
| 23099 / 16273 | URL | Y / Y | 152 |
| 23100 / 16274 | CommitSelector | Y / Y | 34 |
| 23101 / 16275 | EnableAction_ControlsMenuActionAdd | Y / Y | 86 |
| 23102 / 16276 | URL | Y / Y | 160 |
| 23103 / 16277 | CommitSelector | Y / Y | 34 |
| 23104 / 16278 | EnableAction_GroupColumnsMenuActionAdd | Y / Y | 86 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 16 selected candidate rows for this Screen: **16 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 37579 | 48115 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37580 | 48115 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37591 | 48128 / Not applicable | data-formId | form_id | 50006 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37592 | 48128 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37594 | 48129 / Not applicable | data-dbtable | database_identifier | SCREEN_GROUP | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37596 | 48129 / Not applicable | data-restdelete | relative_api_path | /general/scaleapi/screenGroupApi/delete | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37599 | 48130 / Not applicable | data-formId | form_id | 50005 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37600 | 48130 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37602 | 48131 / Not applicable | data-dbtable | database_identifier | SCREEN_CONTROL | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37604 | 48131 / Not applicable | data-restdelete | relative_api_path | /general/scaleapi/screenControlApi/delete | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37607 | 48132 / Not applicable | data-formId | form_id | 50000 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37608 | 48132 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37610 | 48133 / Not applicable | data-dbtable | database_identifier | SCREEN_GROUP_COLUMN | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37612 | 48133 / Not applicable | data-restdelete | relative_api_path | /general/scaleapi/screenGroupColumnApi/delete | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23093 | 48115 / 16267 | PUTServiceURL | relative_api_path | /general/scaleapi/screenGroupApi/save? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23095 | 48115 / 16267 | POSTServiceURL | relative_api_path | /general/scaleapi/screenGroupApi/save | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
