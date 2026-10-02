# Inventory Status Change — Form 4056, Screen 1594

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4056 |
| MAIN_UI_SCREEN Object ID | 1594 |
| Label / Form resource key | Inventory Status Change / MNU_INVSTATUSCHANGETRANSACTION |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | transaction_menu / 6 |
| Configured path | /scale/trans/invStatusChange |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/invStatusChange |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4056 |
| Inspection requirement | view_only_do_not_submit |
| Form configuration table/view | StatusChangeRequestProcessor |
| Help page reference | adjInv.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4056 |
| Inspection time (UTC) | 2026-10-02T15:28:25.587Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_INVSTATUSCHANGETRANSACTION |
| Observed configured table/view | StatusChangeRequestProcessor |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1594 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:19:17.405Z | loaded; landing_and_labels_only | https://trav.manhscale.com/scale/trans/invStatusChange; Inventory Status Change | [runtime-source-agent.json](../../evidence/runtime-source-agent.json) |

**Visible criteria / entry fields:** Adjustment Type.

**Observed action/menu labels:** Cancel.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Inventory Status Change is recorded as `transaction_menu`. Its saved configuration contains 1 parts, 6 groups, 21 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3629 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | InventoryStatusChangeActionStatusChange |

### Part 3629: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 15241 / InventoryStatusChangeMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=15241; default=None |
| 15242 / InventoryStatusChangeMenuPanel | 15241 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=15241; default=None |
| 15244 / InventoryStatusChangeTypeGroup | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=15244; default=None |
| 15243 / MenuActionsDropdown | 15241 | Actions / ACTIONS | 80 / 300 | Y / Y | Fixed to top=N; loading=0; nested unit=15241; default=None |
| 15245 / InventoryAdjustmentMainAccordion | Not populated | Not populated / Not populated | 40 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=15245; default=None |
| 15246 / InventoryAdjustmentUserDefinedSubAccordion | 15245 | User Defined Fields / UserDefinedFields | 50 / 1000 | Y / Y | Fixed to top=N; loading=2; nested unit=15245; default=None |

#### Group 15242: InventoryStatusChangeMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 44609 / InventoryStatusChangeActionStatusChange | Save / SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=Save |

#### Group 15244: InventoryStatusChangeTypeGroup — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 44611 / InventoryStatusChangeTypeValue | Adjustment Type / ADJUSTMENTTYPE | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 44612 / LicensePlateInformationValue | License Plate / LICENSEPLATE | 10 / 300 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=LicensePlateAdjustment; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 44613 / LocationInformationLocationValue | Location / LOCATION | 10 / 350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 44614 / LicensePlateAdjustment | Not populated / Not populated | 100 / 400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 44615 / ItemInformationWebImage | Not populated / Not populated | 170 / 450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaImageButtonControlRow-5; TOOL_TIP_RESOURCE_KEY=None |
| 44616 / ItemInformationItemValue | Item / ITEM | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 44617 / ItemInformationCompanyValue | Company / COMPANY | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44618 / ItemInformationDescriptionValue | Description / ITEMDESCRIPTION | 10 / 1100 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 44619 / ItemInformationLotValue | Lot / LOT | 10 / 1200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 44620 / QuantityInformationStatusValue | Status / STATUS | 80 / 2750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 44621 / InventoryStatusChangeAllLocation | All Locations / ALLLOCATIONS | 130 / 3000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 15243: MenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 44610 / MenuActionCancel | Cancel / BTN_CANCEL | 150 / 150 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 15246: InventoryAdjustmentUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 44622 / UserDefinedUDF1Value | User Defined Field 1 / UD_INVSTATUSCHANGE01 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44623 / UserDefinedUDF2Value | User Defined Field 2 / UD_INVSTATUSCHANGE02 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44624 / UserDefinedUDF3Value | User Defined Field 3 / UD_INVSTATUSCHANGE03 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44625 / UserDefinedUDF4Value | User Defined Field 4 / UD_INVSTATUSCHANGE04 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44626 / UserDefinedUDF5Value | User Defined Field 5 / UD_INVSTATUSCHANGE05 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44627 / UserDefinedUDF6Value | User Defined Field 6 / UD_INVSTATUSCHANGE06 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44628 / UserDefinedUDF7Value | User Defined Field 7 / UD_INVSTATUSCHANGE07 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 44629 / UserDefinedUDF8Value | User Defined Field 8 / UD_INVSTATUSCHANGE08 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 19 control attributes, 8 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 34256 | 44611 / InventoryStatusChangeTypeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 34257 | 44611 / InventoryStatusChangeTypeValue | data-msg-required | Y / Y / Y | 20 / 1 |
| 34258 | 44612 / LicensePlateInformationValue | toUpper | Y / Y / Y | 8 / 0 |
| 34259 | 44612 / LicensePlateInformationValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 34260 | 44612 / LicensePlateInformationValue | data-msg-required | Y / Y / Y | 36 / 1 |
| 34261 | 44613 / LocationInformationLocationValue | toUpper | Y / Y / Y | 8 / 0 |
| 34262 | 44613 / LocationInformationLocationValue | Lookup | Y / Y / N | 100 / 0 |
| 34263 | 44613 / LocationInformationLocationValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 34264 | 44613 / LocationInformationLocationValue | data-msg-required | Y / Y / Y | 20 / 1 |
| 34265 | 44616 / ItemInformationItemValue | toUpper | Y / Y / Y | 8 / 0 |
| 34266 | 44616 / ItemInformationItemValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 34267 | 44616 / ItemInformationItemValue | data-msg-required | Y / Y / Y | 20 / 1 |
| 34268 | 44616 / ItemInformationItemValue | Lookup | Y / Y / N | 68 / 0 |
| 34269 | 44619 / ItemInformationLotValue | toUpper | Y / Y / Y | 8 / 0 |
| 34270 | 44619 / ItemInformationLotValue | Lookup | Y / Y / N | 62 / 0 |
| 34271 | 44620 / QuantityInformationStatusValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 34272 | 44620 / QuantityInformationStatusValue | data-msg-required | Y / Y / Y | 20 / 1 |
| 34273 | 44621 / InventoryStatusChangeAllLocation | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 34274 | 44621 / InventoryStatusChangeAllLocation | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14816 / click | 44609 / InventoryStatusChangeActionStatusChange | _webUi.invStatusChangeTransaction.invokePOSTWebServiceForStatusChange | Not populated | Y / Y |
| 14817 / click | 44610 / MenuActionCancel | _webUi.invStatusChangeTransaction.cancel | Not populated | Y / Y |
| 14818 / igcombodropdownclosed | 44611 / InventoryStatusChangeTypeValue | _webUi.invStatusChangeTransaction.getAdjustmentType | Not populated | Y / Y |
| 14819 / igtexteditorvaluechanged | 44613 / LocationInformationLocationValue | _webUi.invStatusChangeTransaction.getLocationDetails | Not populated | Y / Y |
| 14820 / click | 44614 / LicensePlateAdjustment | _webUi.invStatusChangeTransaction.getLicensePlateDetails | Not populated | Y / Y |
| 14821 / igtexteditorvaluechanged | 44616 / ItemInformationItemValue | _webUi.invStatusChangeTransaction.getItemCompany | Not populated | Y / Y |
| 14822 / igcomboselectionchanged | 44617 / ItemInformationCompanyValue | _webUi.invStatusChangeTransaction.itemCompanyChangedToFetchItemDetails | Not populated | Y / Y |
| 14823 / igtexteditorvaluechanged | 44619 / ItemInformationLotValue | _webUi.invStatusChangeTransaction.getLotDetails | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 20358 / 14816 | POSTServiceURL | Y / Y | 128 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 1 selected candidate rows for this Screen: **1 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_EVENT_PARAMETERS / 20358 | 44609 / 14816 | POSTServiceURL | relative_api_path | /Inventory/scaleapi/LocationInventoryApi/InventoryStatus-Changed | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
