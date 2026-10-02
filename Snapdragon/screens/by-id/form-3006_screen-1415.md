# Immediate Needs — Form 3006, Screen 1415

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3006 |
| MAIN_UI_SCREEN Object ID | 1415 |
| Label / Form resource key | Immediate Needs / MNU_IMMEDIATENEEDSDETAILS |
| Functional area code | 120 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | record_detail_template / 6 |
| Configured path | /scale/details/immediateneeds |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/immediateneeds |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3006 |
| Inspection requirement | record_context_required |
| Form configuration table/view | ImmediateNeedsRequest |
| Help page reference | reaImmdNeed.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3006 |
| Inspection time (UTC) | 2026-10-02T15:24:51.885Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_IMMEDIATENEEDSDETAILS |
| Observed configured table/view | ImmediateNeedsRequest |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1415 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Immediate Needs is recorded as `record_detail_template`. Its saved configuration contains 1 parts, 7 groups, 32 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3175 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | ImmediateNeedsRequestSave |

### Part 3175: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 13290 / ImmediateNeedsRequestGroup | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13290; default=None |
| 13291 / ImmediateNeedsRequestMenuPanelGroup | 13290 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13290; default=None |
| 13293 / ImmediateNeedsRequestItemSubAccordion | 13292 | Not populated / Item | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=13292; default=None |
| 13292 / ImmediateNeedsMainAccordion | Not populated | Not populated / Not populated | 140 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=13292; default=None |
| 13294 / ImmediateNeedsRequestInfoSubAccordion | 13292 | Immediate Needs Info / IMMEDIATENEEDSINFO | 50 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=13292; default=None |
| 13295 / ImmediateNeedsRequestReferenceInfoSubAccordion | 13292 | Reference Info / REFERENCEINFO | 50 / 750 | Y / Y | Fixed to top=N; loading=1; nested unit=13292; default=None |
| 13296 / ImmediateNeedsRequestUserDefinedSubAccordion | 13292 | User Defined / USERDEFINED | 50 / 1000 | Y / Y | Fixed to top=N; loading=1; nested unit=13292; default=None |

#### Group 13291: ImmediateNeedsRequestMenuPanelGroup — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38465 / ImmediateNeedsRequestSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 38464 / ImmNeedsRequestReferenceIdValue | Not populated / Not populated | 260 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 38466 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 13293: ImmediateNeedsRequestItemSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38467 / INRItemSectionItemValue | Item / ITEM | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 38468 / INRItemSectionCompanyValue | Company / COMPANY | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 38469 / ItemInfoWebImage | Not populated / Not populated | 170 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 38470 / INRItemSectionDescriptionValue | Description / ITEMDESCRIPTION | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13294: ImmediateNeedsRequestInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38471 / ImmediateNeedsRequestInfoSectionPriorityValue | Not populated / Priority | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38472 / ImmediateNeedsRequestInfoSectionToLocationValue | To Location / TOLOCATION | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38473 / INRInfoSectionBaseQuantityValue | Base Quantity / BASEQTY | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38474 / INRInfoSectionBaseQuantityUm | UM / UM | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38475 / INRInfoSectionQuantityValue | Quantity / QUANTITY | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38476 / INRInfoSectionQuantityUm | UM / UM | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13295: ImmediateNeedsRequestReferenceInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38480 / INRReferenceInfoSectionRequestKeyValue | Not populated / RequestKey | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 38477 / INRReferenceInfoSectionInternalRequestNumValue | Internal Request Number / INTERNALREQUESTNUMBER | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38479 / INRReferenceInfoSectionReferenceIdValue | Not populated / ReferenceId | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38481 / INRReferenceInfoSectionInternalNumberValue | Not populated / InternalNum | 90 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38482 / INRReferenceInfoSectionInternalFulFillmentValue | Not populated / InternalFulFillmentNumber | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38483 / INRReferenceInfoSectionInternalLineNumValue | Not populated / InternalLineNum | 90 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38478 / INRReferenceInfoSectionWarehouseValue | Not populated / Warehouse | 80 / 1750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38484 / INRReferenceInfoSectionUserStampValue | Not populated / UserStamp | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38485 / INRReferenceInfoSectionProcessStampValue | Not populated / ProcessStamp | 10 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38486 / INRReferenceInfoSectionDateTimeValue | Date Time Stamp / DATETIMESTAMP | 120 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38487 / INRReferenceInfoSectionLoggedDateTimeValue | Logged Date Time / LOGGEDDATETIME | 120 / 2750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13296: ImmediateNeedsRequestUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38488 / INRUserDefined1Value | User Defined Field 1 / UD_IMM_NEEDS_REQUEST1 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38489 / INRUserDefined2Value | User Defined Field 2 / UD_IMM_NEEDS_REQUEST2 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38490 / INRUserDefined3value | User Defined Field 3 / UD_IMM_NEEDS_REQUEST3 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38491 / INRUserDefined4Value | User Defined Field 4 / UD_IMM_NEEDS_REQUEST4 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38492 / INRUserDefined5Value | User Defined Field 5 / UD_IMM_NEEDS_REQUEST5 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38493 / INRUserDefined6Value | User Defined Field 6 / UD_IMM_NEEDS_REQUEST6 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38494 / INRUserDefined7Value | User Defined Field 7 / UD_IMM_NEEDS_REQUEST7 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38495 / INRUserDefined8Value | User Defined Field 8 / UD_IMM_NEEDS_REQUEST8 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 3 control attributes, 2 events, and 2 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 29557 | 38465 / ImmediateNeedsRequestSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 29558 | 38471 / ImmediateNeedsRequestInfoSectionPriorityValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 29559 | 38471 / ImmediateNeedsRequestInfoSectionPriorityValue | data-msg-min | Y / Y / Y | 18 / 2 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 12761 / click | 38465 / ImmediateNeedsRequestSave | _webUi.detailsScreenBinding.save | Not populated | Y / Y |
| 12762 / click | 38466 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 17406 / 12761 | PUTServiceURL | Y / Y | 100 |
| 17407 / 12761 | queryParameter_IdField | Y / Y | 36 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 2 selected candidate rows for this Screen: **2 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 29557 | 38465 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 17406 | 38465 / 12761 | PUTServiceURL | relative_api_path | /inventory/scaleapi/ImmediateNeedsRequestApi/save? | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
