# Finished Item Breakdown — Form 3064, Screen 1522

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3064 |
| MAIN_UI_SCREEN Object ID | 1522 |
| Label / Form resource key | Finished Item Breakdown / MNU_FINISHEDITEMBREAKDOWNTRANSACTION |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/finisheditembreakdown |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/finisheditembreakdown |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3064 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | IWOBreakdownProcessor |
| Help page reference | UnassembleFinItem.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3064 |
| Inspection time (UTC) | 2026-10-02T15:26:26.078Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_FINISHEDITEMBREAKDOWNTRANSACTION |
| Observed configured table/view | IWOBreakdownProcessor |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1522 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Finished Item Breakdown is recorded as `transaction_context`. Its saved configuration contains 1 parts, 7 groups, 19 controls, and 13 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3484 / CrudDataPane | Not populated / Not populated | 10 / 25 | Y / Y / N | FinishedItemBreakdownActionSave |

### Part 3484: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14561 / FinishedItemBreakdownMenuPanel | 14560 | Not populated / Not populated | 60 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=14560; default=None |
| 14563 / FinishedItemBreakdownHeaderFinishedItemInfoSubAcco | 14562 | Item / ITEM | 60 / 25 | Y / Y | Fixed to top=N; loading=0; nested unit=14562; default=None |
| 14565 / FinishedItemBreakdownHeaderComponentsSubAccordion | 14564 | Components / COMPONENTS | 50 / 25 | Y / Y | Fixed to top=N; loading=2; nested unit=14564; default=None |
| 14566 / FinishedItemBreakdownHeaderReferenceInfoSubAccordi | 14564 | Item Info / ITEMINFO | 50 / 50 | Y / Y | Fixed to top=N; loading=0; nested unit=14564; default=None |
| 14560 / FinishedItemBreakdownMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14560; default=None |
| 14562 / FinishedItemBreakdownHeaderFinishedItemInfoGroup | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=14562; default=None |
| 14564 / FinishedItemBreakdownHeaderFinishedComponentsGroup | Not populated | Not populated / Not populated | 40 / 750 | Y / Y | Fixed to top=N; loading=1; nested unit=14564; default=None |

#### Group 14561: FinishedItemBreakdownMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42307 / FinishedItemBreakdownActionSave | Save / BTN_SAVE | 150 / 50 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 42308 / FinishedItemBreakdownHeaderMenu | Not populated / Not populated | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 42306 / ActionCancel | Cancel / BTN_CANCEL | 150 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 14563: FinishedItemBreakdownHeaderFinishedItemInfoSubAcco — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42309 / FinishedItemBreakdownHeaderFinishedItemValue | Finished Item / FINISHEDITEM | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 42310 / FinishedItemBreakdownHeaderCompanyValue | Company / COMPANY | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 42311 / FinishedItemBreakdownHeaderWebImage | Not populated / Not populated | 170 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 42312 / FinishedItemBreakdownHeaderDescriptionValue | Description / DESCRIPTION | 10 / 850 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 42313 / QuantityQuantityValue | Quantity / QUANTITY | 90 / 950 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42314 / QuantityQuantityUmValue | UM / UM | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42315 / LocationCurrentLocationValue | Current Location / CURRENTLOCATION | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 42316 / LocationTransferToBuildLocValue | Transfer to Build Location / TRANSFERTOBUILDLOCATION | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 42317 / ItemRevisionNumberValue | Revision Number / REVISIONNUM | 80 / 1750 | Y / Y | DATA_SOURCE_TYPE=100; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42318 / LocateAndCreateWorkToggle | Locate and Create Work / LOCATEANDCREATEWORK | 130 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14565: FinishedItemBreakdownHeaderComponentsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42319 / FinishedItemBreakdownComponentsGrid | Components / COMPONENTS | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 42319 `FinishedItemBreakdownComponentsGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14441 / INTERNAL_BOM_DETAIL_NUM | INTERNAL_BOM_DETAIL_NUM / Internal BOM Detail Number / INTERNALBOMDETAILNUM | 10 / 10 / 10 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14442 / ICON | Not populated / Icon / ICON | 10 / 10 / 20 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14443 / COLOR | Not populated / Color / COLOR | 10 / 10 / 30 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14444 / ITEM | ITEM / Item / ITEM | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14445 / ITEM_DESC | ITEM_DESC / Description / DESCRIPTION | 10 / 10 / 50 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14446 / QTY_NEEDED_PER_ITEM | QTY_NEEDED_PER_ITEM / Quantity Needed Per Item / QTYNEEDEDPERITEM | 20 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 14447 / QUANTITY_UM | QUANTITY_UM / Quantity UM / QUANTITYUM | 10 / 10 / 70 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14448 / LOT_CONTROLLED | LOT_CONTROLLED / Lot Controlled / LOT_CONTROLLED | 10 / 10 / 80 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14449 / SerialNumInventoryTracking | SerialNumInventoryTracking / Serial Number Inventory Tracking / SerialNumInventoryTracking | 10 / 10 / 85 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14450 / COMPANY | COMPANY / Company / COMPANY | 10 / 10 / 90 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14451 / INVENTORY_STS | INVENTORY_STS / Inventory Status / INVENTORYSTS | 10 / 10 / 100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=70 |
| 14453 / ComponentExistsAtLocation | ComponentExistsAtLocation / Component Exists At Location / ComponentExistsAtLocation | 10 / 10 / 100 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14452 / LOCATING_RULE | LOCATING_RULE / Locating Rule / LOCATINGRULE | 10 / 10 / 110 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=60 |

#### Group 14566: FinishedItemBreakdownHeaderReferenceInfoSubAccordi — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42320 / ItemDescriptionValue | Description / ITEMDESCRIPTION | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 42321 / ItemLotValue | Lot / LOT | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42322 / ItemLicensePlateValue | License Plate / LICENSEPLATE | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42323 / QuantityAvailableQtyValue | Available Qty / AVAILABLEQTY | 90 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42324 / QuantityAvailableQuantityUmValue | UM / UM | 80 / 1750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 28 control attributes, 6 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32592 | 42309 / FinishedItemBreakdownHeaderFinishedItemValue | toUpper | Y / Y / Y | 8 / 0 |
| 32593 | 42309 / FinishedItemBreakdownHeaderFinishedItemValue | Lookup | Y / Y / N | 108 / 0 |
| 32594 | 42313 / QuantityQuantityValue | data-rule-min | Y / Y / Y | 2 / 0 |
| 32595 | 42313 / QuantityQuantityValue | data-msg-min | Y / Y / Y | 54 / 1 |
| 32596 | 42314 / QuantityQuantityUmValue | mode | Y / Y / Y | 16 / 0 |
| 32597 | 42315 / LocationCurrentLocationValue | toUpper | Y / Y / Y | 8 / 0 |
| 32598 | 42315 / LocationCurrentLocationValue | Lookup | Y / Y / N | 92 / 0 |
| 32599 | 42315 / LocationCurrentLocationValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 32600 | 42315 / LocationCurrentLocationValue | data-msg-required | Y / Y / Y | 54 / 1 |
| 32601 | 42316 / LocationTransferToBuildLocValue | toUpper | Y / Y / Y | 8 / 0 |
| 32602 | 42316 / LocationTransferToBuildLocValue | Lookup | Y / Y / N | 98 / 0 |
| 32603 | 42317 / ItemRevisionNumberValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 32604 | 42317 / ItemRevisionNumberValue | data-msg-required | Y / Y / Y | 54 / 1 |
| 32605 | 42318 / LocateAndCreateWorkToggle | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 32606 | 42318 / LocateAndCreateWorkToggle | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 32607 | 42319 / FinishedItemBreakdownComponentsGrid | data-modelClass | Y / Y / N | 122 / 0 |
| 32608 | 42319 / FinishedItemBreakdownComponentsGrid | data-editValueRequired | Y / Y / Y | 26 / 0 |
| 32609 | 42319 / FinishedItemBreakdownComponentsGrid | data-restupdate | Y / Y / Y | 0 / 0 |
| 32610 | 42319 / FinishedItemBreakdownComponentsGrid | data-gridEditMode | Y / Y / Y | 6 / 0 |
| 32611 | 42319 / FinishedItemBreakdownComponentsGrid | data-addRowRequired | Y / Y / Y | 2 / 0 |
| 32612 | 42319 / FinishedItemBreakdownComponentsGrid | data-dbObjectType | Y / Y / N | 4 / 0 |
| 32613 | 42319 / FinishedItemBreakdownComponentsGrid | data-headerkey | Y / Y / N | 46 / 0 |
| 32614 | 42319 / FinishedItemBreakdownComponentsGrid | pageSize | Y / Y / Y | 8 / 0 |
| 32615 | 42321 / ItemLotValue | toUpper | Y / Y / Y | 8 / 0 |
| 32616 | 42322 / ItemLicensePlateValue | toUpper | Y / Y / Y | 8 / 0 |
| 32617 | 42322 / ItemLicensePlateValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 32618 | 42322 / ItemLicensePlateValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 32619 | 42324 / QuantityAvailableQuantityUmValue | mode | Y / Y / Y | 16 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14029 / click | 42307 / FinishedItemBreakdownActionSave | _webUi.finishedItemBreakDownTransaction.OnSaveClick | Not populated | Y / Y |
| 14028 / click | 42306 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 14030 / igtexteditorvaluechanged | 42315 / LocationCurrentLocationValue | _webUi.finishedItemBreakDownTransaction.OnLocationChange | Not populated | Y / Y |
| 14031 / igcomboselectionchanged | 42317 / ItemRevisionNumberValue | _webUi.finishedItemBreakDownTransaction.OnRevisionNumberChange | Not populated | Y / Y |
| 14032 / iggridupdatingeditrowended | 42319 / FinishedItemBreakdownComponentsGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 14033 / igtexteditorvaluechanged | 42322 / ItemLicensePlateValue | _webUi.finishedItemBreakDownTransaction.onLogisticsUnitChange | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19306 / 14032 | CommitSelector | Y / Y | 34 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 1 selected candidate rows for this Screen: **0 accepted tokens** and **1 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

No accepted dependency token is associated with this Screen in the selected supplement.

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
