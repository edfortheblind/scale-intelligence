# Item Location Assignment — Form 40000, Screen 1747

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 40000 |
| MAIN_UI_SCREEN Object ID | 1747 |
| Label / Form resource key | Item Location Assignment / MNU_ITEMLOCATIONASSIGNMENTDETAILS |
| Functional area code | 520 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | record_detail_template / 6 |
| Configured path | /scale/details/itemLocationAssignment |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/itemLocationAssignment |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/40000 |
| Inspection requirement | record_context_required |
| Form configuration table/view | ItemLocationAssignment |
| Help page reference | LNitemLocAssWin.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/40000 |
| Inspection time (UTC) | 2026-10-02T15:31:04.195Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_ITEMLOCATIONASSIGNMENTDETAILS |
| Observed configured table/view | ItemLocationAssignment |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1747 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Item Location Assignment is recorded as `record_detail_template`. Its saved configuration contains 1 parts, 6 groups, 18 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4220 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | ItemLocationAssignmentDetailMenuActionSave |

### Part 4220: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 17509 / ItemLocationAssignmentDetailMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=17509; default=None |
| 17510 / ItemLocationAssignmentDetailMenuPanel | 17509 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=17509; default=None |
| 17512 / ItemLocationAssignmentDetailItemInfoSubAccordion | 17511 | Item Info / ITEMINFO | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=17511; default=None |
| 17513 / ItemLocationAssignmentDetailsLocationInfoSubAccord | 17511 | Location Info / LOCATIONINFO | 50 / 300 | Y / Y | Fixed to top=N; loading=2; nested unit=17511; default=None |
| 17511 / ItemLocationAssignmentDetailSidePane | Not populated | Not populated / Not populated | 140 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=17511; default=None |
| 17514 / ItemLocationAssignmentDetailsUserDefinedSubAccordi | 17511 | User Defined / USERDEFINED | 50 / 750 | Y / Y | Fixed to top=N; loading=1; nested unit=17511; default=None |

#### Group 17510: ItemLocationAssignmentDetailMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50549 / ItemLocationAssignmentItem | Not populated / Not populated | 260 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 50548 / ItemLocationAssignmentDetailMenuActionSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 50547 / MenuActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 17512: ItemLocationAssignmentDetailItemInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50550 / ItemLocationAssignmentInfoItemValue | Item / ITEM | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 50551 / ItemLocationAssignmentInfoCompanyValue | Company / COMPANY | 80 / 300 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 50552 / ItemInfoWebImage | Not populated / Not populated | 170 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 50553 / ItemLocationAssignmentDetailsDescrptionValue | Description / ITEMDESCRIPTION | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 50554 / ItemLocationAssignmentItemIfnoQuantityUMValue | UM / UM | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17513: ItemLocationAssignmentDetailsLocationInfoSubAccord — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50556 / ItemLocationAssignmentLocationInfoPermanentValue | Permanent Location / PERMANENTLOCATION | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 50555 / ItemLocationAssignmentLocationInfoWarehouseValue | Warehouse / WAREHOUSE | 80 / 400 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 17514: ItemLocationAssignmentDetailsUserDefinedSubAccordi — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 50557 / ItemLocationAssignmentDetailSectionUserDefined1Value | User Defined Field 1 / UDITEM_LOCASSIGN1 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 50558 / ItemLocationAssignmentDetailSectionUserDefined2Value | User Defined Field 2 / UDITEM_LOCASSIGN2 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 50559 / ItemLocationAssignmentDetailSectionUserDefined3Value | User Defined Field 3 / UDITEM_LOCASSIGN3 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 50560 / ItemLocationAssignmentDetailSectionUserDefined4Value | User Defined Field 4 / UDITEM_LOCASSIGN4 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 50561 / ItemLocationAssignmentDetailSectionUserDefined5Value | User Defined Field 5 / UDITEM_LOCASSIGN5 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 50562 / ItemLocationAssignmentDetailSectionUserDefined6Value | User Defined Field 6 / UDITEM_LOCASSIGN6 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 50563 / ItemLocationAssignmentDetailSectionUserDefined7Value | User Defined Field 7 / UDITEM_LOCASSIGN7 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 50564 / ItemLocationAssignmentDetailSectionUserDefined8Value | User Defined Field 8 / UDITEM_LOCASSIGN8 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 10 control attributes, 5 events, and 0 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 39758 | 50550 / ItemLocationAssignmentInfoItemValue | Lookup | Y / Y / N | 90 / 0 |
| 39759 | 50550 / ItemLocationAssignmentInfoItemValue | toUpper | Y / Y / Y | 8 / 0 |
| 39760 | 50550 / ItemLocationAssignmentInfoItemValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 39761 | 50550 / ItemLocationAssignmentInfoItemValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 39764 | 50556 / ItemLocationAssignmentLocationInfoPermanentValue | toUpper | Y / Y / Y | 8 / 0 |
| 39765 | 50556 / ItemLocationAssignmentLocationInfoPermanentValue | Lookup | Y / Y / N | 132 / 0 |
| 39766 | 50556 / ItemLocationAssignmentLocationInfoPermanentValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 39767 | 50556 / ItemLocationAssignmentLocationInfoPermanentValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 39762 | 50555 / ItemLocationAssignmentLocationInfoWarehouseValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 39763 | 50555 / ItemLocationAssignmentLocationInfoWarehouseValue | data-msg-required | Y / Y / Y | 18 / 1 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 17463 / click | 50548 / ItemLocationAssignmentDetailMenuActionSave | _webUi.itemLocationAssignmentDetails.save | Not populated | Y / Y |
| 17462 / click | 50547 / MenuActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 17464 / igtexteditorvaluechanged | 50550 / ItemLocationAssignmentInfoItemValue | _webUi.itemLocationAssignmentDetails.itemValueChanged | Not populated | Y / Y |
| 17465 / igcomboselectionchanged | 50551 / ItemLocationAssignmentInfoCompanyValue | _webUi.itemLocationAssignmentDetails.companySelectionChanged | Not populated | Y / Y |
| 17466 / igcomboselectionchanged | 50554 / ItemLocationAssignmentItemIfnoQuantityUMValue | _webUi.itemLocationAssignmentDetails.quantityUmSelectionChanged | Not populated | Y / Y |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 0 selected candidate rows for this Screen: **0 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

No accepted dependency token is associated with this Screen in the selected supplement.

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
