# Transfer Shipment — Form 3025, Screen 1555

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3025 |
| MAIN_UI_SCREEN Object ID | 1555 |
| Label / Form resource key | Transfer Shipment / MNU_TRANSFERSHIPMENTTRANSACTION |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/transfershipment |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/transfershipment |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3025 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | TransferShipmentsRequestProcessor |
| Help page reference | createShipLoad.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3025 |
| Inspection time (UTC) | 2026-10-02T15:25:02.978Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_TRANSFERSHIPMENTTRANSACTION |
| Observed configured table/view | TransferShipmentsRequestProcessor |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1555 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Transfer Shipment is recorded as `transaction_context`. Its saved configuration contains 2 parts, 11 groups, 24 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3524 / CrudDataPane | Not populated / Not populated | 10 / 25 | Y / Y / N | TransferShipmentMenuActionSave |
| 3525 / AssignCarrierServiceModalDialog | Not populated / Not populated | 20 / 50 | Y / Y / Y | AssignCarrierServiceSaveButton |

### Part 3524: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14745 / TransferShipmentMenu | Not populated | Not populated / Not populated | 70 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=14745; default=None |
| 14746 / TransferShipmentMenuGroup | 14745 | Not populated / Not populated | 60 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=14745; default=None |
| 14747 / MenuActionsDropdown | 14745 | Actions / ACTIONS | 80 / 300 | Y / Y | Fixed to top=N; loading=0; nested unit=14745; default=None |
| 14748 / TransferShipmentMainAccordion | Not populated | Not populated / Not populated | 40 / 2000 | Y / Y | Fixed to top=N; loading=1; nested unit=14748; default=None |
| 14749 / TransferShipmentDestinationLoadSubAccordion | 14748 | Destination Load / DESTINATIONLOAD | 50 / 2000 | Y / Y | Fixed to top=N; loading=2; nested unit=14748; default=None |
| 14750 / TransferShipmentShipmentSubAccordion | 14748 | Shipment / SHIPMENT | 50 / 3000 | Y / Y | Fixed to top=N; loading=2; nested unit=14748; default=None |
| 14751 / TransferShipmentLoadSubAccordion | 14748 | Load / LOAD | 50 / 5000 | Y / Y | Fixed to top=N; loading=1; nested unit=14748; default=None |

#### Group 14746: TransferShipmentMenuGroup — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42781 / TransferShipmentMenuActionSave | Transfer / BTN_TRANSFER | 150 / 25 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_TRANSFER |
| 42782 / TransferShipmentHeaderSectionShipmentId | Not populated / Not populated | 260 / 25 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14747: MenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42783 / MenuActionTransferShipmentNew | New / NEW | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEW |
| 42784 / MenuActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 14749: TransferShipmentDestinationLoadSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42785 / DestinationLoadLoadvalue | Shipping Load Number / SHIPPING_LOAD_NUM | 90 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14750: TransferShipmentShipmentSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42786 / ShipmentShipmentidvalue | Not populated / ShipmentId | 10 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42787 / ShipmentWarehouseValue | Warehouse / WAREHOUSE | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42788 / ShipmentCarrierValue | Carrier / CARRIER | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42789 / ShipmentCarrierServiceValue | Carrier Service / CARRIERSERVICE | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42790 / ShipmentLeadingStatusValue | Leading Status / LEADINGSTS | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42791 / ShipmentTrailingStatusValue | Trailing Status / TRAILINGSTS | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14751: TransferShipmentLoadSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42792 / LoadShippingLoadNumberValue | Shipping Load Number / SHIPPINGLOADNUM | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42793 / LoadScheduledShipDateValue | Scheduled Ship Date / SCHEDULEDSHIPDATE | 110 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42794 / LoadLeadingStatusValue | Leading Status / LEADINGSTS | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42795 / LoadTrailingStatusValue | Trailing Status / TRAILINGSTS | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42796 / LoadTotalContainersValue | Total Containers / TOTALCONTAINERS | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42797 / LoadTotalShipmentsValue | Total Shipments / TOTALSHIPMENTS | 90 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42798 / LoadTotalWeightValue | Total Weight / TOTALWEIGHT | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42799 / LoadTotalWeightUmValue | UM / UM | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42800 / LoadTotalVolumeValue | Total Volume / TOTALVOLUME | 90 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42801 / LoadTotalVolumeUmValue | UM / UM | 80 / 2500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

### Part 3525: AssignCarrierServiceModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14752 / AssignCarrierServiceModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=14752; default=None |
| 14753 / AssignCarrierServiceModalDialogHeader | 14752 | Select Carrier Service / UI_CARRIERSERVICESELECT | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=14752; default=None |
| 14754 / AssignCarrierServiceModalDialogBody | 14752 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=14752; default=None |
| 14755 / AssignCarrierServiceModalDialogFooter | 14752 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=14752; default=None |

#### Group 14754: AssignCarrierServiceModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42802 / AssignCarrierServiceComboBox | One or more shipments have a different carrier than the destination load.  Please select a carrier service to be applied to all of these shipments. / MULTICARRIERSERVICES | 80 / 2500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14755: AssignCarrierServiceModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42803 / AssignCarrierServiceSaveButton | Ok / BTN_OK | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 42804 / AssignCarrierServiceCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 9 control attributes, 5 events, and 11 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32919 | 42781 / TransferShipmentMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 32920 | 42783 / MenuActionTransferShipmentNew | data-formId | Y / Y / N | 8 / 0 |
| 32921 | 42783 / MenuActionTransferShipmentNew | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 32922 | 42783 / MenuActionTransferShipmentNew | data-divider | Y / Y / N | 8 / 0 |
| 32923 | 42785 / DestinationLoadLoadvalue | data-rule-required | Y / Y / Y | 8 / 0 |
| 32924 | 42785 / DestinationLoadLoadvalue | data-rule-min | Y / Y / Y | 2 / 0 |
| 32925 | 42785 / DestinationLoadLoadvalue | data-msg-min | Y / Y / Y | 18 / 1 |
| 32926 | 42785 / DestinationLoadLoadvalue | Lookup | Y / Y / N | 104 / 0 |
| 32927 | 42793 / LoadScheduledShipDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14184 / click | 42781 / TransferShipmentMenuActionSave | _webUi.transferShipmentTransaction.invokePOSTWebService | Not populated | Y / Y |
| 14185 / click | 42783 / MenuActionTransferShipmentNew | _webUi.transferShipmentTransaction.newLoadClicked | Not populated | Y / Y |
| 14186 / click | 42784 / MenuActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 14187 / click | 42803 / AssignCarrierServiceSaveButton | _webUi.transferShipmentTransaction.invokePOSTWebService | Not populated | Y / Y |
| 14188 / click | 42804 / AssignCarrierServiceCancelButton | _webUi.transferShipmentTransaction.hideModalDialog | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19338 / 14184 | POSTTransferShipmentURL | Y / Y | 108 |
| 19339 / 14184 | POSTTransferFilteredShipmentURL | Y / Y | 136 |
| 19340 / 14184 | InformationDialogControlId | Y / Y | 56 |
| 19341 / 14184 | InformationDialogId | Y / Y | 62 |
| 19342 / 14184 | InformationMessageCode | Y / Y | 20 |
| 19343 / 14185 | URL | Y / Y | 98 |
| 19344 / 14187 | POSTTransferShipmentURL | Y / Y | 108 |
| 19345 / 14187 | POSTTransferFilteredShipmentURL | Y / Y | 136 |
| 19346 / 14187 | DetailScreen_DialogData | Y / Y | 86 |
| 19347 / 14187 | ModalDialogName | Y / Y | 62 |
| 19348 / 14188 | ModalDialogName | Y / Y | 62 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 8 selected candidate rows for this Screen: **8 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32919 | 42781 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32920 | 42783 / Not applicable | data-formId | form_id | 3026 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32921 | 42783 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19338 | 42781 / 14184 | POSTTransferShipmentURL | relative_api_path | /outbound/scaleapi/shipmentHeadersApi/DestinationLoad? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19339 | 42781 / 14184 | POSTTransferFilteredShipmentURL | relative_api_path | /outbound/scaleapi/shipmentHeadersApi/FilteredShipments-Transferred? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19342 | 42781 / 14184 | InformationMessageCode | resource_code | MSG_CARR05 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19344 | 42803 / 14187 | POSTTransferShipmentURL | relative_api_path | /outbound/scaleapi/shipmentHeadersApi/DestinationLoad? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 19345 | 42803 / 14187 | POSTTransferFilteredShipmentURL | relative_api_path | /outbound/scaleapi/shipmentHeadersApi/FilteredShipments-Transferred? | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
