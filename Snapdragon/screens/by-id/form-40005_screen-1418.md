# Item Location Capacity — Form 40005, Screen 1418

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 40005 |
| MAIN_UI_SCREEN Object ID | 1418 |
| Label / Form resource key | Item Location Capacity / MNU_ITEMLOCATIONCAPACITYDETAILS |
| Functional area code | 520 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | record_detail_template / 6 |
| Configured path | /scale/details/itemLocationCapacity |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/itemLocationCapacity |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/40005 |
| Inspection requirement | record_context_required |
| Form configuration table/view | ItemLocationCapacity |
| Help page reference | LNitemLocCapWin.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/40005 |
| Inspection time (UTC) | 2026-10-02T15:31:06.227Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_ITEMLOCATIONCAPACITYDETAILS |
| Observed configured table/view | ItemLocationCapacity |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1418 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Item Location Capacity is recorded as `record_detail_template`. Its saved configuration contains 1 parts, 7 groups, 24 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3178 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | ItemLocationCapacityDetailMenuActionSave |

### Part 3178: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 13311 / ItemLocationCapacityDetailMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13311; default=None |
| 13312 / ItemLocationCapacityDetailMenuPanel | 13311 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13311; default=None |
| 13314 / ItemLocationCapacityDetailItemInfoSubAccordion | 13313 | Item Info / ITEMINFO | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=13313; default=None |
| 13315 / ItemLocationCapacityLocationInfoSubAccordion | 13313 | Location Info / LOCATIONINFO | 50 / 300 | Y / Y | Fixed to top=N; loading=2; nested unit=13313; default=None |
| 13313 / ItemLocationCapacityDetailSidePane | Not populated | Not populated / Not populated | 140 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=13313; default=None |
| 13316 / ItemLocationCapacityReplenishmentInfoSubAccordion | 13313 | Replenishment Info / REPLENISHMENTINFO | 50 / 500 | Y / Y | Fixed to top=N; loading=2; nested unit=13313; default=None |
| 13317 / ItemLocationCapacityDetailsUserDefinedSubAccordion | 13313 | User Defined / USERDEFINED | 50 / 750 | Y / Y | Fixed to top=N; loading=1; nested unit=13313; default=None |

#### Group 13312: ItemLocationCapacityDetailMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38554 / ItemLocationCapacityItem | Not populated / Not populated | 260 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 38553 / ItemLocationCapacityDetailMenuActionSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 38552 / MenuActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 13314: ItemLocationCapacityDetailItemInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38555 / ItemLocationCapacityInfoItemValue | Item / ITEM | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 38556 / ItemLocationCapacityInfoCompanyValue | Company / COMPANY | 80 / 300 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 38557 / ItemInfoWebImage | Not populated / Not populated | 170 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 38558 / ItemLocationCapacityDetailsDescrptionValue | Description / ITEMDESCRIPTION | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 38559 / ItemLocationCapacityMaximumQuantityValue | Not populated / MAXIMUMQUANTITY  | 90 / 850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38560 / ItemLocationCapacityQuantityUMValue | UM / UM | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13315: ItemLocationCapacityLocationInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38561 / ItemLocationCapacityLocationToggle | Not populated / ApplyCapacityBy | 130 / 150 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 38562 / ItemLocationCapacityLocationValue | Location / LOCATION | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 38563 / ItemLocationCapacityWarehouseValue | Warehouse / WAREHOUSE | 80 / 400 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38564 / ItemLocationCapacityLocationTypeValue | Location Type / LOCATIONTYPE | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13316: ItemLocationCapacityReplenishmentInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38565 / ItemLocationCapacityMinimumReplenishmentValue | Minimum Replenishment Threshold Percent / MINREPTHRESHPERCENT | 90 / 150 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38566 / ItemLocationCapacityTopOffReplenishmentThresholdValue | Top-Off Minimum Replenishment Threshold / TOPOFFMINREPLENISHMENTHRESHOLD | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38567 / ItemLocationCapacityMaxFillReplenishmentValue | Maximum Replenishment Fill Percent / MAXRPLNPCT | 90 / 350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13317: ItemLocationCapacityDetailsUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38568 / ItemLocationCapacityDetailSectionUserDefined1Value | User Defined Field 1 / UDILC01 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38569 / ItemLocationCapacityDetailSectionUserDefined2Value | User Defined Field 2 / UDILC02 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38570 / ItemLocationCapacityDetailSectionUserDefined3Value | User Defined Field 3 / UDILC03 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38571 / ItemLocationCapacityDetailSectionUserDefined4Value | User Defined Field 4 / UDILC04 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38572 / ItemLocationCapacityDetailSectionUserDefined5Value | User Defined Field 5 / UDILC05 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38573 / ItemLocationCapacityDetailSectionUserDefined6Value | User Defined Field 6 / UDILC06 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38574 / ItemLocationCapacityDetailSectionUserDefined7Value | User Defined Field 7 / UDILC07 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38575 / ItemLocationCapacityDetailSectionUserDefined8Value | User Defined Field 8 / UDILC08 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 24 control attributes, 6 events, and 0 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 29591 | 38555 / ItemLocationCapacityInfoItemValue | Lookup | Y / Y / N | 86 / 0 |
| 29592 | 38555 / ItemLocationCapacityInfoItemValue | toUpper | Y / Y / Y | 8 / 0 |
| 29593 | 38555 / ItemLocationCapacityInfoItemValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 29594 | 38555 / ItemLocationCapacityInfoItemValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 29595 | 38559 / ItemLocationCapacityMaximumQuantityValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 29596 | 38559 / ItemLocationCapacityMaximumQuantityValue | data-msg-min | Y / Y / Y | 18 / 1 |
| 29597 | 38560 / ItemLocationCapacityQuantityUMValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 29598 | 38560 / ItemLocationCapacityQuantityUMValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 29599 | 38561 / ItemLocationCapacityLocationToggle | data-btn-true-resourceKey | Y / Y / N | 16 / 0 |
| 29600 | 38561 / ItemLocationCapacityLocationToggle | data-btn-false-resourceKey | Y / Y / N | 24 / 0 |
| 29601 | 38562 / ItemLocationCapacityLocationValue | toUpper | Y / Y / Y | 8 / 0 |
| 29602 | 38562 / ItemLocationCapacityLocationValue | Lookup | Y / Y / N | 102 / 0 |
| 29603 | 38562 / ItemLocationCapacityLocationValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 29604 | 38562 / ItemLocationCapacityLocationValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 29605 | 38563 / ItemLocationCapacityWarehouseValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 29606 | 38563 / ItemLocationCapacityWarehouseValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 29607 | 38564 / ItemLocationCapacityLocationTypeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 29608 | 38564 / ItemLocationCapacityLocationTypeValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 29609 | 38565 / ItemLocationCapacityMinimumReplenishmentValue | data-rule-range | Y / Y / Y | 14 / 0 |
| 29610 | 38565 / ItemLocationCapacityMinimumReplenishmentValue | data-msg-range | Y / Y / Y | 18 / 2 |
| 29611 | 38566 / ItemLocationCapacityTopOffReplenishmentThresholdValue | data-rule-range | Y / Y / Y | 14 / 0 |
| 29612 | 38566 / ItemLocationCapacityTopOffReplenishmentThresholdValue | data-msg-range | Y / Y / Y | 18 / 2 |
| 29613 | 38567 / ItemLocationCapacityMaxFillReplenishmentValue | data-rule-range | Y / Y / Y | 14 / 0 |
| 29614 | 38567 / ItemLocationCapacityMaxFillReplenishmentValue | data-msg-range | Y / Y / Y | 18 / 2 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 12770 / click | 38553 / ItemLocationCapacityDetailMenuActionSave | _webUi.itemLocationCapacityDetails.save | Not populated | Y / Y |
| 12769 / click | 38552 / MenuActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 12771 / igtexteditorvaluechanged | 38555 / ItemLocationCapacityInfoItemValue | _webUi.itemLocationCapacityDetails.itemValueChanged | Not populated | Y / Y |
| 12772 / igcomboselectionchanged | 38556 / ItemLocationCapacityInfoCompanyValue | _webUi.itemLocationCapacityDetails.companySelectionChanged | Not populated | Y / Y |
| 12773 / ignumericeditorvaluechanged | 38559 / ItemLocationCapacityMaximumQuantityValue | _webUi.itemLocationCapacityDetails.maximumQtyChanged | Not populated | Y / Y |
| 12774 / change | 38561 / ItemLocationCapacityLocationToggle | _webUi.itemLocationCapacityDetails.locationToggleChanges | Not populated | Y / Y |

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
