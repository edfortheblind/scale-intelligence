# Screen Control — Form 50005, Screen 1675

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 50005 |
| MAIN_UI_SCREEN Object ID | 1675 |
| Label / Form resource key | Screen Control / MNU_SCREENCONTROLDETAILS |
| Functional area code | 120 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | metadata_editor / 6 |
| Configured path | /scale/details/screencontrol |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/screencontrol |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/50005 |
| Inspection requirement | context_required_configuration_view_cancel_only |
| Form configuration table/view | ScreenControl |
| Help page reference | configMetadata.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/50005 |
| Inspection time (UTC) | 2026-10-02T15:31:44.488Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_SCREENCONTROLDETAILS |
| Observed configured table/view | ScreenControl |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1675 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Screen Control is recorded as `metadata_editor`. Its saved configuration contains 1 parts, 11 groups, 39 controls, and 40 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3901 / CrudDataPane | Not populated / Not populated | 10 / 25 | Y / Y / N | ScreenControlMenuActionSave |

### Part 3901: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16353 / ScreenControlMenu | Not populated | Not populated / Not populated | 150 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=16353; default=None |
| 16354 / ScreenControlMenuPanel | 16353 | Not populated / Not populated | 60 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=16353; default=None |
| 16355 / ScreenControlMainAccordion | Not populated | Not populated / Not populated | 140 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=16355; default=None |
| 16356 / ScreenControlControlPropertiesSubAccordion | 16355 | Control Properties / CONTROLPROPERTIES | 50 / 3000 | Y / Y | Fixed to top=N; loading=0; nested unit=16355; default=None |
| 16357 / ScreenControlStylePropertiesSubAccordion | 16355 | Style Properties / STYLEPROPERTIES | 50 / 4000 | Y / Y | Fixed to top=N; loading=1; nested unit=16355; default=None |
| 16358 / ScreenControlBindingPropertiesSubAccordion | 16355 | Binding Properties / BINDINGPROPERTIES | 50 / 5000 | Y / Y | Fixed to top=N; loading=1; nested unit=16355; default=None |
| 16359 / ScreenControlScreenCtrllAttributesSubAccordion | 16355 | Screen Control Attributes / SCREENCONTROLATTRIBUTES | 50 / 6000 | Y / Y | Fixed to top=N; loading=1; nested unit=16355; default=None |
| 16360 / ScreenControlScreenControlEventsSubAccordion | 16355 | Screen Control Events / SCREENCONTROLEVENTS | 50 / 7000 | Y / Y | Fixed to top=N; loading=1; nested unit=16355; default=None |
| 16361 / ScreenControlScreenCtrlGridColumnsSubAccordion | 16355 | Screen Control Grid Columns / SCREENCONTROLGRIDCOLUMNS | 50 / 8000 | Y / Y | Fixed to top=N; loading=1; nested unit=16355; default=None |
| 16362 / ScreenControlGeneralSubAccordion | 16355 | General / GENERAL | 50 / 9000 | Y / Y | Fixed to top=N; loading=1; nested unit=16355; default=None |
| 16363 / ScreenControlUserDefinedSubAccordion | 16355 | User Defined / USERDEFINED | 50 / 10000 | Y / Y | Fixed to top=N; loading=1; nested unit=16355; default=None |

#### Group 16354: ScreenControlMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47965 / ScreenControlHeaderControlName | Not populated / Not populated | 260 / 25 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47962 / ScreenControlMenuActionSave | Save / BTN_SAVE | 150 / 50 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 47964 / ScreenMenuActionPreview | Preview / BTN_PREVIEW | 150 / 75 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_PREVIEW |
| 47963 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 16356: ScreenControlControlPropertiesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47966 / ControlPropertiesControlNameValue | Control Name / CONTROLNAME | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47967 / ControlPropertiesControlTypeValue | Control Type / CONTROLTYPE | 80 / 300 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47968 / ControlPropertiesResourceKeyValue | Resource Key / RESOURCEKEY | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47969 / ControlPropertiesToolTipResourceKeyValue | Tooltip Resource Key / TOOLTIPRESOURCEKEY | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47970 / ControlPropertiesLabelOrientationValue | Label Orientation / LABELORIENTATION | 80 / 600 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47971 / ControlPropertiesSequenceValue | Sequence / METASEQUENCE | 90 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47972 / ControlPropertiesDefaultStateValue | Default State / DEFAULTSTATE | 80 / 800 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47973 / ControlPropertiesDefaultActionValue | Default Action / DEFAULTACTION | 10 / 900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16357: ScreenControlStylePropertiesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47974 / StylePropertiesTemplateNameValue | Template Name / TEMPLATENAME | 10 / 125 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47975 / StylePropertiesDivCssClassValue | Div Css Class / DIVCSSCLASS | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47976 / StylePropertiesControlCssClassValue | Control Css Class / CONTROLCSSCLASS | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47977 / StylePropertiesScreenGroupColumnIdValue | Screen Group Column ID / SCREENGROUPCOLUMNID | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16358: ScreenControlBindingPropertiesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47978 / BindingPropDataSourceTypeValue | Data Source Type / DATASOURCETYPE | 80 / 200 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47979 / BindingPropDataSourceValue | Data Source / METADATASOURCE | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16359: ScreenControlScreenCtrllAttributesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47980 / AttributesMenuActionAdd | Add / BTN_ADD | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowWithNav-1; TOOL_TIP_RESOURCE_KEY=BTN_ADD |
| 47981 / ScreenControlAttributesGrid | Not populated / Not populated | 20 / 600 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 47981 `ScreenControlAttributesGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16719 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16720 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16721 / AttributeName | ATTRIBUTE_NAME / Attribute Name / ATTRIBUTENAME | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16737 / Not populated | OBJECT_ID / Not populated / Not populated | Not populated / 30 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16722 / AttributeValue | ATTRIBUTE_VALUE / Attribute Value / ATTRIBUTEVALUE | 10 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16723 / IsControlProperty | Not populated / Is Control Property / ISCONTROLPROPERTY | 40 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16725 / Token1 | TOKEN1 / Token 1 / TOKEN1 | 10 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16726 / Token2 | TOKEN2 / Token 2 / TOKEN2 | 10 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16727 / Token3 | TOKEN3 / Token 3 / TOKEN3 | 10 / 10 / 70 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16728 / Token4 | TOKEN4 / Token 4 / TOKEN4 | 10 / 10 / 80 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16729 / Token5 | TOKEN5 / Token 5 / TOKEN5 | 10 / 10 / 90 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16730 / Token6 | TOKEN6 / Token 6 / TOKEN6 | 10 / 10 / 100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16731 / Token7 | TOKEN7 / Token 7 / TOKEN7 | 10 / 10 / 110 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16732 / Token8 | TOKEN8 / Token 8 / TOKEN8 | 10 / 10 / 120 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16733 / Token9 | TOKEN9 / Token 9 / TOKEN9 | 10 / 10 / 130 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16734 / Token10 | TOKEN10 / Token 10 / TOKEN10 | 10 / 10 / 140 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16724 / Active | Not populated / Active / ACTIVE | 40 / 10 / 150 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16735 / ObjectId | OBJECT_ID / Object ID / OBJECTID | 10 / 10 / 160 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16736 / ScreenControlId | SCREEN_CONTROL_ID / Screen Control ID / SCREENCONTROLID | 10 / 10 / 180 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 16360: ScreenControlScreenControlEventsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47982 / EventsMenuActionAdd | Add / BTN_ADD | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowWithNav-1; TOOL_TIP_RESOURCE_KEY=BTN_ADD |
| 47983 / ScreenControlEventsGrid | Not populated / Not populated | 20 / 600 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 47983 `ScreenControlEventsGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16738 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16739 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16740 / EventId | EVENT_ID / Event ID / EVENTID | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16745 / Not populated | OBJECT_ID / Not populated / Not populated | Not populated / 30 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16741 / EventName | EVENT_NAME / Event Name / EVENTNAME | 10 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16742 / Active | Not populated / Active / ACTIVE | 40 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16743 / ObjectId | OBJECT_ID / Object ID / OBJECTID | 10 / 10 / 150 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16744 / ScreenControlId | SCREEN_CONTROL_ID / Screen Control ID / SCREENCONTROLID | 10 / 10 / 150 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 16361: ScreenControlScreenCtrlGridColumnsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47984 / GridColumnsMenuActionAdd | Add / BTN_ADD | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowWithNav-1; TOOL_TIP_RESOURCE_KEY=BTN_ADD |
| 47985 / ScreenControlGridColumnsGrid | Not populated / Not populated | 20 / 600 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 47985 `ScreenControlGridColumnsGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16746 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16747 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16748 / FieldName | FIELD_NAME / Field Name / FIELDNAME | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16749 / SqlClauseType | Not populated / SQL Clause Type / SQLCLAUSETYPE | 10 / 10 / 15 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16750 / Field | FIELD / Field / FIELD | 10 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16758 / Not populated | SEQUENCE / Not populated / Not populated | Not populated / 30 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16751 / FieldWidth | FIELD_WIDTH / Width / FIELDWIDTH | 20 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16752 / Sequence | SEQUENCE / Sequence / SEQUENCE | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16753 / ResourceKey | RESOURCE_KEY / Resource Key / RESOURCEKEY | 10 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16754 / Active | Not populated / Active / ACTIVE | 40 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16755 / Hidden | Not populated / Hidden / HIDDEN | 40 / 10 / 70 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16756 / AllowSort | Not populated / Allow Sort / ALLOWSORT | 40 / 10 / 75 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16757 / ObjectId | OBJECT_ID / Object ID / OBJECTID | 10 / 10 / 80 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 16362: ScreenControlGeneralSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47986 / GeneralObjectIdValue | Object ID / OBJECTID | 90 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47987 / GeneralScreenGroupIdValue | Screen Group ID / SCREENGROUPID | 240 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47988 / GeneralActiveValue | Active / ACTIVE | 130 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47989 / GeneralSystemCreatedValue | System Created / SYSTEMCREATED | 130 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47990 / GeneralUserStampValue | User Stamp / USERSTAMP | 80 / 600 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47991 / GeneralProcessStampValue | Process Stamp / PROCESSSTAMP | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47992 / GeneralDateTimeStampValue | Date Time Stamp / DATETIMESTAMP | 120 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16363: ScreenControlUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47993 / UserDefinedUserDefined1Value | User Defined Field 1 / UD_SCREENCONTROL01 | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47994 / UserDefinedUserDefined2Value | User Defined Field 2 / UD_SCREENCONTROL02 | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47995 / UserDefinedUserDefined3Value | User Defined Field 3 / UD_SCREENCONTROL03 | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47996 / UserDefinedUserDefined4Value | User Defined Field 4 / UD_SCREENCONTROL04 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47997 / UserDefinedUserDefined5Value | User Defined Field 5 / UD_SCREENCONTROL05 | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47998 / UserDefinedUserDefined6Value | User Defined Field 6 / UD_SCREENCONTROL06 | 10 / 700 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47999 / UserDefinedUserDefined7Value | User Defined Field 7 / UD_SCREENCONTROL07 | 90 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48000 / UserDefinedUserDefined8Value | User Defined Field 8 / UD_SCREENCONTROL08 | 90 / 900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 38 control attributes, 12 events, and 13 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 37477 | 47962 / ScreenControlMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37478 | 47962 / ScreenControlMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37479 | 47966 / ControlPropertiesControlNameValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37480 | 47966 / ControlPropertiesControlNameValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37481 | 47967 / ControlPropertiesControlTypeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37482 | 47967 / ControlPropertiesControlTypeValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37483 | 47971 / ControlPropertiesSequenceValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 37484 | 47971 / ControlPropertiesSequenceValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 37485 | 47977 / StylePropertiesScreenGroupColumnIdValue | href | Y / Y / Y | 156 / 0 |
| 37486 | 47980 / AttributesMenuActionAdd | data-formId | Y / Y / N | 10 / 0 |
| 37487 | 47980 / AttributesMenuActionAdd | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37488 | 47981 / ScreenControlAttributesGrid | data-modelClass | Y / Y / N | 124 / 0 |
| 37489 | 47981 / ScreenControlAttributesGrid | data-dbtable | Y / Y / N | 50 / 0 |
| 37490 | 47981 / ScreenControlAttributesGrid | data-headerkey | Y / Y / N | 34 / 0 |
| 37491 | 47981 / ScreenControlAttributesGrid | data-restdelete | Y / Y / Y | 102 / 0 |
| 37492 | 47981 / ScreenControlAttributesGrid | data-restFormId | Y / Y / Y | 10 / 0 |
| 37493 | 47981 / ScreenControlAttributesGrid | pageSize | Y / Y / Y | 4 / 0 |
| 37494 | 47982 / EventsMenuActionAdd | data-formId | Y / Y / N | 10 / 0 |
| 37495 | 47982 / EventsMenuActionAdd | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37496 | 47983 / ScreenControlEventsGrid | data-modelClass | Y / Y / N | 114 / 0 |
| 37497 | 47983 / ScreenControlEventsGrid | data-dbtable | Y / Y / N | 40 / 0 |
| 37498 | 47983 / ScreenControlEventsGrid | data-headerkey | Y / Y / N | 34 / 0 |
| 37499 | 47983 / ScreenControlEventsGrid | data-restdelete | Y / Y / Y | 92 / 0 |
| 37500 | 47983 / ScreenControlEventsGrid | data-restFormId | Y / Y / Y | 10 / 0 |
| 37501 | 47983 / ScreenControlEventsGrid | pageSize | Y / Y / Y | 4 / 0 |
| 37502 | 47984 / GridColumnsMenuActionAdd | data-formId | Y / Y / N | 10 / 0 |
| 37503 | 47984 / GridColumnsMenuActionAdd | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37504 | 47985 / ScreenControlGridColumnsGrid | data-modelClass | Y / Y / N | 126 / 0 |
| 37505 | 47985 / ScreenControlGridColumnsGrid | data-dbtable | Y / Y / N | 54 / 0 |
| 37506 | 47985 / ScreenControlGridColumnsGrid | data-headerkey | Y / Y / N | 34 / 0 |
| 37507 | 47985 / ScreenControlGridColumnsGrid | data-restdelete | Y / Y / Y | 104 / 0 |
| 37508 | 47985 / ScreenControlGridColumnsGrid | data-restFormId | Y / Y / Y | 10 / 0 |
| 37509 | 47985 / ScreenControlGridColumnsGrid | pageSIze | Y / Y / Y | 4 / 0 |
| 37510 | 47987 / GeneralScreenGroupIdValue | href | Y / Y / Y | 126 / 0 |
| 37511 | 47988 / GeneralActiveValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37512 | 47988 / GeneralActiveValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37513 | 47989 / GeneralSystemCreatedValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37514 | 47989 / GeneralSystemCreatedValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16240 / click | 47962 / ScreenControlMenuActionSave | _webUi.detailsScreenBinding.save | Not populated | Y / Y |
| 16242 / click | 47964 / ScreenMenuActionPreview | _webUi.metadataBuilder.preview | Not populated | Y / Y |
| 16241 / click | 47963 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 16243 / click | 47980 / AttributesMenuActionAdd | _webUi.detailsScreenActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 16244 / iggridupdatingrowdeleted | 47981 / ScreenControlAttributesGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16245 / iggridrendered | 47981 / ScreenControlAttributesGrid | _webUi.Grid.detailsGridRendered | Not populated | Y / Y |
| 16246 / click | 47982 / EventsMenuActionAdd | _webUi.detailsScreenActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 16247 / iggridupdatingrowdeleted | 47983 / ScreenControlEventsGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16248 / iggridrendered | 47983 / ScreenControlEventsGrid | _webUi.Grid.detailsGridRendered | Not populated | Y / Y |
| 16249 / click | 47984 / GridColumnsMenuActionAdd | _webUi.detailsScreenActions.onAddClick | Not populated | Y / Y |
| 16250 / iggridupdatingrowdeleted | 47985 / ScreenControlGridColumnsGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16251 / iggridrendered | 47985 / ScreenControlGridColumnsGrid | _webUi.Grid.detailsGridRendered | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 23065 / 16240 | PUTServiceURL | Y / Y | 80 |
| 23066 / 16240 | queryParameter_IdField | Y / Y | 16 |
| 23067 / 16240 | POSTServiceURL | Y / Y | 78 |
| 23068 / 16243 | URL | Y / Y | 176 |
| 23069 / 16244 | CommitSelector | Y / Y | 34 |
| 23070 / 16245 | EnableAction_AttributesMenuActionAdd | Y / Y | 86 |
| 23071 / 16246 | URL | Y / Y | 166 |
| 23072 / 16247 | CommitSelector | Y / Y | 34 |
| 23073 / 16248 | EnableAction_EventsMenuActionAdd | Y / Y | 86 |
| 23074 / 16249 | URL | Y / Y | 178 |
| 23075 / 16249 | URL_ChooseColumn | Y / Y | 150 |
| 23076 / 16250 | CommitSelector | Y / Y | 34 |
| 23077 / 16251 | EnableAction_GridColumnsMenuActionAdd | Y / Y | 86 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 16 selected candidate rows for this Screen: **16 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 37477 | 47962 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37478 | 47962 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37486 | 47980 / Not applicable | data-formId | form_id | 50002 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37487 | 47980 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37489 | 47981 / Not applicable | data-dbtable | database_identifier | Screen_Control_Attributes | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37491 | 47981 / Not applicable | data-restdelete | relative_api_path | /general/scaleapi/screenControlAttributesApi/delete | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37494 | 47982 / Not applicable | data-formId | form_id | 50004 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37495 | 47982 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37497 | 47983 / Not applicable | data-dbtable | database_identifier | Screen_Control_Event | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37499 | 47983 / Not applicable | data-restdelete | relative_api_path | /general/scaleapi/screenControlEventApi/delete | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37502 | 47984 / Not applicable | data-formId | form_id | 50012 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37503 | 47984 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37505 | 47985 / Not applicable | data-dbtable | database_identifier | Screen_Control_Grid_Columns | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37507 | 47985 / Not applicable | data-restdelete | relative_api_path | /general/scaleapi/screenControlGridColumnsApi/delete | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23065 | 47962 / 16240 | PUTServiceURL | relative_api_path | /general/scaleapi/screenControlApi/save? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23067 | 47962 / 16240 | POSTServiceURL | relative_api_path | /general/scaleapi/screenControlApi/save | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
