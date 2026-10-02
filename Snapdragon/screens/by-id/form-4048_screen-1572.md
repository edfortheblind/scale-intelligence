# Work Order Confirmation — Form 4048, Screen 1572

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4048 |
| MAIN_UI_SCREEN Object ID | 1572 |
| Label / Form resource key | Work Order Confirmation / MNU_WORKORDERCONFIRMATIONTRANSACTION |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/workorderConfirm |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/workorderConfirm |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4048 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | WorkOrderConfirmationDataLoader |
| Help page reference | procWorkOrder.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4048 |
| Inspection time (UTC) | 2026-10-02T15:28:10.817Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_WORKORDERCONFIRMATIONTRANSACTION |
| Observed configured table/view | WorkOrderConfirmationDataLoader |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1572 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Work Order Confirmation is recorded as `transaction_context`. Its saved configuration contains 1 parts, 8 groups, 17 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3550 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | WorkOrderConfirmMenuActionSave |

### Part 3550: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14967 / WorkOrderConfirmMenuPanel | 14966 | Not populated / Not populated | 60 / 100 | Y / Y | Fixed to top=Y; loading=0; nested unit=14966; default=None |
| 14968 / WorkOrderConfirmActionPanel | 14966 | Not populated / Not populated | 60 / 200 | Y / Y | Fixed to top=N; loading=0; nested unit=14966; default=None |
| 14966 / WorkOrderConfirmMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14966; default=None |
| 14970 / WorkOrderConfirmationMainPanel | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=14970; default=None |
| 14971 / WorkOrderConfirmationPanel | 14970 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=14970; default=WorkOrderConfirmationActionSave |
| 14973 / ItemInfoSubAccordion | 14972 | Item Info / ITEMINFO | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=14972; default=None |
| 14969 / MenuActionsDropdown | 14966 | Actions / ACTIONS | 80 / 300 | Y / Y | Fixed to top=N; loading=0; nested unit=14966; default=None |
| 14972 / ItemInfoGroup | Not populated | Not populated / Not populated | 40 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=14972; default=None |

#### Group 14967: WorkOrderConfirmMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 43935 / WorkOrderConfirmHeaderItemValue | Not populated / Not populated | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14968: WorkOrderConfirmActionPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 43936 / WorkOrderConfirmMenuActionConfirm | Confirm / BTN_CONFIRM | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CONFIRM |

#### Group 14971: WorkOrderConfirmationPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 43939 / ConfirmationInfoQuantity | Quantity / QUANTITY | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 43940 / ConfirmationInfoQtyUM | UM / UM | 80 / 300 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 43941 / ConfirmationInfoQtyAvailToBuild | Quantity Available to Confirm / QUANTAVAILTOCONFIRM | 90 / 350 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 43942 / ConfirmationInfoQtyAvailToBuildUM | UM / UM | 80 / 400 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 43944 / ConfirmationInfoWorkOrderId | Work Order ID / WORKORDERID | 10 / 450 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 43943 / ConfirmationInfoPutawayLoc | Putaway Location / PUTLOCATION | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14973: ItemInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 43945 / ItemInfoItemValue | Item / ITEM | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 43946 / ItemInfoCompanyValue | Company / COMPANY | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 43947 / ItemInfoWebImage | Not populated / Not populated | 170 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowImageColumn-3; TOOL_TIP_RESOURCE_KEY=None |
| 43948 / ItemInfoDescriptionValue | Description / ITEMDESCRIPTION | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 43949 / ItemInfoLotValue | Lot / LOT | 10 / 800 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 43950 / ItemInfoExpirationDate | Expiration Date / EXPIRATIONDATE | 110 / 900 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 43951 / ItemInfoLicenseValue | License Plate / LICENSEPLATE | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14969: MenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 43937 / MenuActionLocate | Locate / LOCATE | 150 / 300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=LOCATE |
| 43938 / MenuActionCancel | Cancel / BTN_CANCEL | 150 / 800 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 15 control attributes, 6 events, and 0 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 33499 | 43937 / MenuActionLocate | data-divider | Y / Y / N | 8 / 0 |
| 33500 | 43937 / MenuActionLocate | data-formId | Y / Y / N | 6 / 0 |
| 33501 | 43937 / MenuActionLocate | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 33502 | 43939 / ConfirmationInfoQuantity | data-rule-min | Y / Y / Y | 14 / 0 |
| 33503 | 43939 / ConfirmationInfoQuantity | data-msg-min | Y / Y / Y | 18 / 1 |
| 33504 | 43943 / ConfirmationInfoPutawayLoc | toUpper | Y / Y / Y | 8 / 0 |
| 33505 | 43943 / ConfirmationInfoPutawayLoc | Lookup | Y / Y / N | 88 / 0 |
| 33506 | 43943 / ConfirmationInfoPutawayLoc | data-rule-required | Y / Y / Y | 8 / 0 |
| 33507 | 43943 / ConfirmationInfoPutawayLoc | data-msg-required | Y / Y / Y | 18 / 1 |
| 33508 | 43949 / ItemInfoLotValue | toUpper | Y / Y / Y | 8 / 0 |
| 33509 | 43949 / ItemInfoLotValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 33510 | 43949 / ItemInfoLotValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 33511 | 43950 / ItemInfoExpirationDate | data-dateOnly | Y / Y / Y | 8 / 0 |
| 33512 | 43951 / ItemInfoLicenseValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 33513 | 43951 / ItemInfoLicenseValue | data-msg-required | Y / Y / Y | 18 / 1 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14453 / click | 43936 / WorkOrderConfirmMenuActionConfirm | _webUi.workOrderConfirmationTransaction.confirm | Not populated | Y / Y |
| 14454 / click | 43937 / MenuActionLocate | _webUi.workOrderConfirmationTransaction.locate | Not populated | Y / Y |
| 14455 / click | 43938 / MenuActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 14456 / ignumericeditorvaluechanged | 43939 / ConfirmationInfoQuantity | _webUi.workOrderConfirmationTransaction.quantityChanged | Not populated | Y / Y |
| 14457 / igtexteditorvaluechanged | 43943 / ConfirmationInfoPutawayLoc | _webUi.workOrderConfirmationTransaction.putawayLocChanged | Not populated | Y / Y |
| 14458 / igtexteditorvaluechanged | 43949 / ItemInfoLotValue | _webUi.workOrderConfirmationTransaction.lotChanged | Not populated | Y / Y |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 2 selected candidate rows for this Screen: **2 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 33500 | 43937 / Not applicable | data-formId | form_id | 156 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 33501 | 43937 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
