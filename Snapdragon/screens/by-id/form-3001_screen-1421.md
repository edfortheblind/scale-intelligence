# Lot — Form 3001, Screen 1421

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3001 |
| MAIN_UI_SCREEN Object ID | 1421 |
| Label / Form resource key | Lot / MNU_LOTDETAILS |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | record_detail_template / 6 |
| Configured path | /scale/details/lot |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/lot |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3001 |
| Inspection requirement | record_context_required |
| Form configuration table/view | LotView |
| Help page reference | useLots.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3001 |
| Inspection time (UTC) | 2026-10-02T15:24:44.449Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_LOTDETAILS |
| Observed configured table/view | LotView |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1421 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Lot is recorded as `record_detail_template`. Its saved configuration contains 1 parts, 8 groups, 27 controls, and 5 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3181 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | LotDetailMenuActionSave |

### Part 3181: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 13333 / LotDetailMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13333; default=None |
| 13334 / LotDetailMenuPanel | 13333 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13333; default=None |
| 13337 / LotDetailLotInfoSubAccordion | 13336 | Lot Info / LOTINFO | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=13336; default=None |
| 13338 / LotDetailsLotAttributesSubAccordion | 13336 | Lot Attributes / LOTATTRIBUTES | 50 / 300 | Y / Y | Fixed to top=N; loading=2; nested unit=13336; default=None |
| 13335 / LotDetailsActionsDropdown | 13333 | Actions / ACTIONS | 80 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=13333; default=None |
| 13336 / LotDetailSidePane | Not populated | Not populated / Not populated | 140 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=13336; default=None |
| 13339 / LotDetailsRefInfoSubAccordion | 13336 | Reference Info / REFERENCEINFO | 50 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=13336; default=None |
| 13340 / LotDetailsUserDefinedSubAccordion | 13336 | User Defined / USERDEFINED | 50 / 750 | Y / Y | Fixed to top=N; loading=1; nested unit=13336; default=None |

#### Group 13334: LotDetailMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38655 / LotDetailSectionLot | Not populated / Not populated | 260 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 38654 / LotDetailMenuActionSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |

#### Group 13337: LotDetailLotInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38658 / LotInfoLotValue | Lot / LOT | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 38659 / LotInfoLotTemplateValue | Lot Template / LOTTEMPLATE | 80 / 300 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 38660 / ItemInfoWebImage | Not populated / Not populated | 170 / 325 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 38661 / LotInfoItemValue | Item / ITEM | 10 / 350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38662 / LotDetailCompanyValue | Company / COMPANY | 80 / 400 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38663 / ItemInfoItemDescriptionValue | Description / ITEMDESCRIPTION | 10 / 450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 38664 / LotDetailInventoryStsValue | Inventory Status / INVENTORYSTATUS | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38665 / LotDetailsExpirationDateValue | Expiration Date / EXPIRATIONDATE | 110 / 550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38666 / LotDetailsFrozenValue | Frozen / FROZEN | 130 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13338: LotDetailsLotAttributesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38667 / LotAttributesGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 38667 `LotAttributesGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 13083 / Attribute | Attribute / Attribute / ATTRIBUTE | 10 / 10 / 750 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13084 / Value | Value / Value / LOTATTRIBUTEVALUE | 10 / 10 / 800 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13080 / Icon | Not populated / Icon / ICON | 10 / 10 / 850 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13081 / Color | Not populated / Color / COLOR | 10 / 10 / 900 / 1 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 13082 / ObjectId | ObjectId / Object ID / OBJECTID | 20 / 10 / 950 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 13335: LotDetailsActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38656 / ListPaneMenuActionInventory | Inventory / INVENTORY | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=INVENTORY |
| 38657 / MenuActionCancel | Cancel / BTN_CANCEL | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 13339: LotDetailsRefInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38668 / RefInfoObjectIdValue | Object ID / OBJECTID | 10 / 150 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 38669 / RefInfoUserStampValue | User Stamp / USERSTAMP | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38670 / RefInfoProcessStampValue | Process Stamp / PROCESSSTAMP | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38671 / RefInfoDateTimeStampValue | Date Time Stamp / DATETIMESTAMP | 120 / 350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38672 / RefInfoWarehouseValue | Warehouse / WAREHOUSE | 80 / 400 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13340: LotDetailsUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38673 / LotDetailSectionUserDefined1Value | User Defined Field 1 / UDLOTDETAIL1 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38674 / LotDetailSectionUserDefined2Value | User Defined Field 2 / UDLOTDETAIL2 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38675 / LotDetailSectionUserDefined3Value | User Defined Field 3 / UDLOTDETAIL3 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38676 / LotDetailSectionUserDefined4Value | User Defined Field 4 / UDLOTDETAIL4 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38677 / LotDetailSectionUserDefined5Value | User Defined Field 5 / UDLOTDETAIL5 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38678 / LotDetailSectionUserDefined6Value | User Defined Field 6 / UDLOTDETAIL6 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38679 / LotDetailSectionUserDefined7Value | User Defined Field 7 / UDLOTDETAIL7 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38680 / LotDetailSectionUserDefined8Value | User Defined Field 8 / UDLOTDETAIL8 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 19 control attributes, 8 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 29643 | 38656 / ListPaneMenuActionInventory | data-formId | Y / Y / N | 8 / 0 |
| 29644 | 38656 / ListPaneMenuActionInventory | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 29645 | 38656 / ListPaneMenuActionInventory | data-divider | Y / Y / N | 8 / 0 |
| 29646 | 38658 / LotInfoLotValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 29647 | 38658 / LotInfoLotValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 29648 | 38664 / LotDetailInventoryStsValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 29649 | 38664 / LotDetailInventoryStsValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 29650 | 38665 / LotDetailsExpirationDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 29651 | 38666 / LotDetailsFrozenValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 29652 | 38666 / LotDetailsFrozenValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 29653 | 38667 / LotAttributesGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 29654 | 38667 / LotAttributesGrid | data-local | Y / Y / Y | 8 / 0 |
| 29655 | 38667 / LotAttributesGrid | data-modelClass | Y / Y / N | 96 / 0 |
| 29656 | 38667 / LotAttributesGrid | data-addRowRequired | Y / Y / Y | 2 / 0 |
| 29657 | 38667 / LotAttributesGrid | data-editValueRequired | Y / Y / Y | 10 / 0 |
| 29658 | 38667 / LotAttributesGrid | data-restupdate | Y / Y / Y | 0 / 0 |
| 29659 | 38667 / LotAttributesGrid | data-dbObjectType | Y / Y / N | 4 / 0 |
| 29660 | 38667 / LotAttributesGrid | pageSize | Y / Y / Y | 4 / 0 |
| 29661 | 38667 / LotAttributesGrid | data-groupBy | Y / Y / Y | 10 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 12781 / click | 38654 / LotDetailMenuActionSave | _webUi.lotDetails.save | Not populated | Y / Y |
| 12782 / click | 38656 / ListPaneMenuActionInventory | _webUi.detailsScreenActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 12783 / click | 38657 / MenuActionCancel | _webUi.lotDetails.cancel | Not populated | Y / Y |
| 12784 / igcomboselectionchanged | 38664 / LotDetailInventoryStsValue | _webUi.lotDetails.inventoryStatusSelectionChanged | Not populated | Y / Y |
| 12785 / igdatepickervaluechanged | 38665 / LotDetailsExpirationDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 12786 / change | 38666 / LotDetailsFrozenValue | _webUi.lotDetails.frozenClick | Not populated | Y / Y |
| 12787 / iggriddatarendering | 38667 / LotAttributesGrid | _webUi.lotDetails.onLotAttributesGridDataRendering | Not populated | Y / Y |
| 12788 / iggridupdatingeditcellended | 38667 / LotAttributesGrid | _webUi.lotDetails.attributeGridEdtingCellEnded | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 17410 / 12782 | URL | Y / Y | 278 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 3 selected candidate rows for this Screen: **2 accepted tokens** and **1 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 29643 | 38656 / Not applicable | data-formId | form_id | 2723 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 29644 | 38656 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
