# Warehouse Mobile Menu — Form 4087, Screen 1669

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4087 |
| MAIN_UI_SCREEN Object ID | 1669 |
| Label / Form resource key | Warehouse Mobile Menu / MNU_WAREHOUSEMOBILEMENUDETAILS |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | record_detail_template / 6 |
| Configured path | /scale/details/warehousemobilemenu |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/warehousemobilemenu |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4087 |
| Inspection requirement | record_context_required |
| Form configuration table/view | WarehouseMobileMenu |
| Help page reference | WMmobileMenuCreate.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4087 |
| Inspection time (UTC) | 2026-10-02T15:30:03.098Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_WAREHOUSEMOBILEMENUDETAILS |
| Observed configured table/view | WarehouseMobileMenu |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1669 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Warehouse Mobile Menu is recorded as `record_detail_template`. Its saved configuration contains 1 parts, 6 groups, 24 controls, and 13 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3891 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | WarehouseMobileMenuActionSave |

### Part 3891: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16301 / WareHouseMobileMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16301; default=None |
| 16302 / WarehouseMobileMenuPanel | 16301 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16301; default=None |
| 16303 / WarehouseMobileMenuMainAccordion | Not populated | Not populated / Not populated | 140 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=16303; default=None |
| 16304 / WarehouseMobileMenuMenupOptionSubAccordion | 16303 | Menu Option / MENUOPTION | 50 / 2000 | Y / Y | Fixed to top=N; loading=2; nested unit=16303; default=None |
| 16305 / SubMenuSubAccordion | 16303 | Submenu / SUBMENU | 50 / 3000 | Y / Y | Fixed to top=N; loading=1; nested unit=16303; default=None |
| 16306 / WarehouseMobileMenuUserDefonetoeightSubAccordion | 16303 | User Defined / USERDEFINED | 50 / 17000 | Y / Y | Fixed to top=N; loading=1; nested unit=16303; default=None |

#### Group 16302: WarehouseMobileMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47792 / WarehouseMobileMenuActionSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 47794 / MenupOptionMenuOptionNameLabel | Not populated / Not populated | 260 / 350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 47793 / ActionCancel | Cancel / BTN_CANCEL | 150 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 16304: WarehouseMobileMenuMenupOptionSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47795 / MenupOptionMenuOptionNameValue | Menu Option Name / MENUOPTIONNAME | 10 / 7250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47796 / MenupOptionMenuResourceKeyValue | Menu Resource Key / MENURESOURCEKEY | 10 / 7350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47797 / MenupOptionFormIdNumValue | Form ID / FORMID | 90 / 7450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47798 / MenupOptionSequenceNumValue | Sequence / SEQUENCE | 90 / 7550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47799 / MenupOptionObjectIdNumValue | Object ID / OBJECTID | 90 / 7650 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47800 / MenupOptionParentValue | Parent / PARENT | 80 / 7700 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47801 / MenupOptionSrcIdentifierValue | SRC Identifier / SRCIDENTIFIER | 80 / 7750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47802 / MenupOptionActiveValue | Active / ACTIVE | 130 / 7800 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 47803 / MenupOptionSystemCreatedValue | System Created / SYSTEMCREATED | 130 / 7850 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16305: SubMenuSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47804 / SubMenuSubmenuNameValue | Submenu Name / SUBMENUNAME | 10 / 525 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47805 / SubMenuSubmenuResourceKeyValue | Submenu Resource Key / SUBMENURESOURCEKEY | 10 / 525 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47806 / EventParametersMenuActionAdd | Add / BTN_ADD | 150 / 600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowWithNav-1; TOOL_TIP_RESOURCE_KEY=BTN_ADD |
| 47807 / WarehouseMobileMenuGrid | Not populated / Not populated | 20 / 9000 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 47807 `WarehouseMobileMenuGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16682 / MenuOptionName | MENU_OPTION_NAME / Menu Option Name / MENUOPTIONNAME | 10 / 10 / 5 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16683 / MenuResourceKey | MENU_RESOURCE_KEY / Menu Resource Key / MENURESOURCEKEY | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16684 / Sequence | SEQUENCE / Sequence / SEQUENCE | 20 / 10 / 15 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16685 / SrcIdentifier | Not populated / SRC Identifier / SRCIDENTIFIER | 10 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16686 / Active | Not populated / Active / ACTIVE | 10 / 10 / 25 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16687 / SystemCreated | Not populated / System Created / SYSTEMCREATED | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16688 / ObjectId | OBJECT_ID / Object ID / OBJECTID | 20 / 10 / 35 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16692 / ParentObjectId | PARENT_OBJECT_ID / Object ID / OBJECTID | 20 / 10 / 35 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16689 / SubmenuName | SUBMENU_NAME / Submenu Name / SUBMENUNAME | 10 / 10 / 40 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16690 / SubmenuResourceKey | SUBMENU_RESOURCE_KEY / Submenu Resource Key / SUBMENURESOURCEKEY | 10 / 10 / 45 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16691 / SubmenuAuthorization | SUBMENU_AUTHORIZATION / Submenu Authorization / SUBMENUAUTHORIZATION | 10 / 10 / 50 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16693 / ICON | Not populated / Icon / ICON | 10 / 10 / 55 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16694 / COLOR | Not populated / Color / COLOR | 10 / 10 / 60 / 1 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 16306: WarehouseMobileMenuUserDefonetoeightSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47808 / UserDefUserDefinedfield1Value | User Defined Field 1 / UDWAREHOUSEMOBILEMENU01 | 10 / 550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47809 / UserDefUserDefinedfield2Value | User Defined Field 2 / UDWAREHOUSEMOBILEMENU02 | 10 / 650 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47810 / UserDefUserDefinedfield3Value | User Defined Field 3 / UDWAREHOUSEMOBILEMENU03 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47811 / UserDefUserDefinedfield4Value | User Defined Field 4 / UDWAREHOUSEMOBILEMENU04 | 10 / 850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47812 / UserDefUserDefinedfield5Value | User Defined Field 5 / UDWAREHOUSEMOBILEMENU05 | 10 / 950 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47813 / UserDefUserDefinedfield6Value | User Defined Field 6 / UDWAREHOUSEMOBILEMENU06 | 10 / 1050 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47814 / UserDefUserDefinedfield7Value | User Defined Field 7 / UDWAREHOUSEMOBILEMENU07 | 90 / 1150 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47815 / UserDefUserDefinedfield8Value | User Defined Field 8 / UDWAREHOUSEMOBILEMENU08 | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 27 control attributes, 5 events, and 11 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 37366 | 47792 / WarehouseMobileMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37367 | 47792 / WarehouseMobileMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37368 | 47795 / MenupOptionMenuOptionNameValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37369 | 47795 / MenupOptionMenuOptionNameValue | data-msg-required | Y / Y / Y | 18 / 0 |
| 37370 | 47797 / MenupOptionFormIdNumValue | minValue | Y / Y / Y | 2 / 0 |
| 37371 | 47797 / MenupOptionFormIdNumValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 37372 | 47797 / MenupOptionFormIdNumValue | maxValue | Y / Y / Y | 10 / 0 |
| 37373 | 47797 / MenupOptionFormIdNumValue | data-rule-required | Y / Y / Y | 10 / 0 |
| 37374 | 47797 / MenupOptionFormIdNumValue | data-msg-required | Y / Y / Y | 18 / 0 |
| 37375 | 47798 / MenupOptionSequenceNumValue | minValue | Y / Y / Y | 2 / 0 |
| 37376 | 47798 / MenupOptionSequenceNumValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 37377 | 47798 / MenupOptionSequenceNumValue | maxValue | Y / Y / Y | 4 / 0 |
| 37378 | 47801 / MenupOptionSrcIdentifierValue | data-restrictionsProcessor | Y / Y / Y | 80 / 0 |
| 37379 | 47802 / MenupOptionActiveValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37380 | 47802 / MenupOptionActiveValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37381 | 47803 / MenupOptionSystemCreatedValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37382 | 47803 / MenupOptionSystemCreatedValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37383 | 47806 / EventParametersMenuActionAdd | data-formId | Y / Y / N | 8 / 0 |
| 37384 | 47806 / EventParametersMenuActionAdd | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37385 | 47807 / WarehouseMobileMenuGrid | data-formId | Y / Y / Y | 8 / 0 |
| 37386 | 47807 / WarehouseMobileMenuGrid | data-modelClass | Y / Y / N | 116 / 0 |
| 37387 | 47807 / WarehouseMobileMenuGrid | data-dbtable | Y / Y / N | 42 / 0 |
| 37388 | 47807 / WarehouseMobileMenuGrid | data-headerkey | Y / Y / N | 32 / 0 |
| 37389 | 47807 / WarehouseMobileMenuGrid | data-restdelete | Y / Y / Y | 112 / 0 |
| 37390 | 47807 / WarehouseMobileMenuGrid | data-restrictionsProcessor | Y / Y / Y | 88 / 0 |
| 37391 | 47807 / WarehouseMobileMenuGrid | data-defaultsProcessor | Y / Y / Y | 88 / 0 |
| 37392 | 47807 / WarehouseMobileMenuGrid | pageSize | Y / Y / Y | 4 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16199 / click | 47792 / WarehouseMobileMenuActionSave | _webUi.warehouseMobileMenu.performPost | Not populated | Y / Y |
| 16200 / click | 47793 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 16201 / click | 47806 / EventParametersMenuActionAdd | _webUi.detailsScreenActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 16202 / iggridupdatingrowdeleted | 47807 / WarehouseMobileMenuGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 16203 / iggridrendered | 47807 / WarehouseMobileMenuGrid | _webUi.Grid.detailsGridRendered | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 23018 / 16199 | PUTServiceURL | Y / Y | 110 |
| 23019 / 16199 | POSTServiceErrorCallbackInsert | Y / Y | 80 |
| 23020 / 16199 | PUTServiceErrorCallbackUpdate | Y / Y | 80 |
| 23021 / 16199 | queryParameter_IdField | Y / Y | 16 |
| 23022 / 16199 | URL | Y / Y | 94 |
| 23023 / 16199 | POSTServiceURL | Y / Y | 108 |
| 23024 / 16199 | POSTServiceSuccessCallbackInsert | Y / Y | 100 |
| 23025 / 16201 | URL | Y / Y | 172 |
| 23026 / 16202 | CommitSelector | Y / Y | 34 |
| 23027 / 16203 | EnableAction_EventParametersMenuActionAdd | Y / Y | 188 |
| 23028 / 16203 | EnableAction_EventParametersMenuActionSave | Y / Y | 10 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 12 selected candidate rows for this Screen: **12 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 37366 | 47792 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37367 | 47792 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37383 | 47806 / Not applicable | data-formId | form_id | 4087 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37384 | 47806 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37385 | 47807 / Not applicable | data-formId | form_id | 4087 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37387 | 47807 / Not applicable | data-dbtable | database_identifier | WAREHOUSE_MOBILE_MENU | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37389 | 47807 / Not applicable | data-restdelete | relative_api_path | /general/scaleapi/WhsMobileMenuApi/WhsMobileMenu-Deleted | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23018 | 47792 / 16199 | PUTServiceURL | relative_api_path | /general/scaleapi/WhsMobileMenuApi/UpdateWshMobileMenu? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23019 | 47792 / 16199 | POSTServiceErrorCallbackInsert | callback_identifier | _webUi.warehouseMobileMenu.errorCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23020 | 47792 / 16199 | PUTServiceErrorCallbackUpdate | callback_identifier | _webUi.warehouseMobileMenu.errorCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23023 | 47792 / 16199 | POSTServiceURL | relative_api_path | /general/scaleapi/WhsMobileMenuApi/CreateWshMobileMenu | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23024 | 47792 / 16199 | POSTServiceSuccessCallbackInsert | callback_identifier | _webUi.warehouseMobileMenu.saveLoadSuccessCallback | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
