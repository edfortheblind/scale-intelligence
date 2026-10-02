# Inventory Attributes — Form 4015, Screen 1416

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4015 |
| MAIN_UI_SCREEN Object ID | 1416 |
| Label / Form resource key | Inventory Attributes / MNU_INVENTORYATTRIBUTESDETAILS |
| Functional area code | 20 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | record_detail_template / 6 |
| Configured path | /scale/details/inventoryattributes |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/inventoryattributes |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4015 |
| Inspection requirement | record_context_required |
| Form configuration table/view | LocationInventoryAttributesView |
| Help page reference | usingInvAttrib.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4015 |
| Inspection time (UTC) | 2026-10-02T15:27:22.077Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_INVENTORYATTRIBUTESDETAILS |
| Observed configured table/view | LocationInventoryAttributesView |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1416 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Inventory Attributes is recorded as `record_detail_template`. Its saved configuration contains 1 parts, 8 groups, 38 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3176 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | Not populated |

### Part 3176: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 13297 / InventoryAttributesMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13297; default=None |
| 13298 / InventoryAttributesMenuPanel | 13297 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=13297; default=None |
| 13300 / InventoryAttributesAttributes1To10SubAccordion | 13299 | Attributes 1-10 / ATTRIBUTES1TO10 | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=13299; default=None |
| 13299 / InventoryAttributesMainAccordion | Not populated | Not populated / Not populated | 140 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=13299; default=None |
| 13301 / InventoryAttributesAttributes11To20SubAccordion | 13299 | Attributes 11-20 / ATTRIBUTES11TO20 | 50 / 500 | Y / Y | Fixed to top=N; loading=2; nested unit=13299; default=None |
| 13302 / InventoryAttributesInventoryInfoSubAccordion | 13299 | Inventory Info / INVENTORYINFO | 50 / 750 | Y / Y | Fixed to top=N; loading=1; nested unit=13299; default=None |
| 13303 / InventoryAttributesReferenceInfoSubAccordion | 13299 | Reference Info / REFERENCEINFO | 50 / 1250 | Y / Y | Fixed to top=N; loading=1; nested unit=13299; default=None |
| 13304 / InventoryAttributesUserDefinedSubAccordion | 13299 | User Defined / USERDEFINED | 50 / 1500 | Y / Y | Fixed to top=N; loading=1; nested unit=13299; default=None |

#### Group 13298: InventoryAttributesMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38496 / InventoryAttributesMenuActionSave | Save / BTN_SAVE | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 38497 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 13300: InventoryAttributesAttributes1To10SubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38498 / Attributes1To10Attribute1Value | Attribute 1 / LOCINVATTRIBUTE1 | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38499 / Attributes1To10Attribute2Value | Attribute 2 / LOCINVATTRIBUTE2 | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38500 / Attributes1To10Attribute3Value | Attribute 3 / LOCINVATTRIBUTE3 | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38501 / Attributes1To10Attribute4Value | Attribute 4 / LOCINVATTRIBUTE4 | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38502 / Attributes1To10Attribute5Value | Attribute 5 / LOCINVATTRIBUTE5 | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38503 / Attributes1To10Attribute6Value | Attribute 6 / LOCINVATTRIBUTE6 | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38504 / Attributes1To10Attribute7Value | Attribute 7 / LOCINVATTRIBUTE7 | 80 / 1750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38505 / Attributes1To10Attribute8Value | Attribute 8 / LOCINVATTRIBUTE8 | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38506 / Attributes1To10Attribute9Value | Attribute 9 / LOCINVATTRIBUTE9 | 80 / 2250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38507 / Attributes1To10Attribute10Value | Attribute 10 / LOCINVATTRIBUTE10 | 80 / 2500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13301: InventoryAttributesAttributes11To20SubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38508 / Attributes11To20Attribute11Value | Attribute 11 / LOCINVATTRIBUTE11 | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38509 / Attributes11To20Attribute12Value | Attribute 12 / LOCINVATTRIBUTE12 | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38510 / Attributes11To20Attribute13Value | Attribute 13 / LOCINVATTRIBUTE13 | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38511 / Attributes11To20Attribute14Value | Attribute 14 / LOCINVATTRIBUTE14 | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38512 / Attributes11To20Attribute15Value | Attribute 15 / LOCINVATTRIBUTE15 | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38513 / Attributes11To20Attribute16Value | Attribute 16 / LOCINVATTRIBUTE16 | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38514 / Attributes11To20Attribute17Value | Attribute 17 / LOCINVATTRIBUTE17 | 80 / 1750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38515 / Attributes11To20Attribute18Value | Attribute 18 / LOCINVATTRIBUTE18 | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38516 / Attributes11To20Attribute19Value | Attribute 19 / LOCINVATTRIBUTE19 | 80 / 2250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38517 / Attributes11To20Attribute20Value | Attribute 20 / LOCINVATTRIBUTE20 | 80 / 2500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13302: InventoryAttributesInventoryInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38518 / InventoryInfoLocationValue | Location / LOCATION | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38519 / InventoryInfoLicensePlateValue | License Plate / LICENSEPLATE | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38520 / InventoryInfoItemValue | Item / ITEM | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38521 / InventoryInfoCompanyValue | Company / COMPANY | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13303: InventoryAttributesReferenceInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38522 / ReferenceInfoUserStampValue | User Stamp / USERSTAMP | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38523 / ReferenceInfoProcessStampValue | Process Stamp / PROCESSSTAMP | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38524 / ReferenceInfoDateTimeStampValue | Date Time Stamp / DATETIMESTAMP | 120 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38525 / ReferenceInfoStatusDateTimeStampValue | Last Updated / LASTUPDATED | 120 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 13304: InventoryAttributesUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 38526 / UserDefinedUDF1Value | User Defined Field 1 / UD_INVENTORYATTRIBUTE01 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38527 / UserDefinedUDF2Value | User Defined Field 2 / UD_INVENTORYATTRIBUTE02 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38528 / UserDefinedUDF3Value | User Defined Field 3 / UD_INVENTORYATTRIBUTE03 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38529 / UserDefinedUDF4Value | User Defined Field 4 / UD_INVENTORYATTRIBUTE04 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38530 / UserDefinedUDF5Value | User Defined Field 5 / UD_INVENTORYATTRIBUTE05 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38531 / UserDefinedUDF6Value | User Defined Field 6 / UD_INVENTORYATTRIBUTE06 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38532 / UserDefinedUDF7Value | User Defined Field 7 / UD_INVENTORYATTRIBUTE07 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 38533 / UserDefinedUDF8Value | User Defined Field 8 / UD_INVENTORYATTRIBUTE08 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 21 control attributes, 2 events, and 0 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 29560 | 38496 / InventoryAttributesMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 29561 | 38498 / Attributes1To10Attribute1Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29562 | 38499 / Attributes1To10Attribute2Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29563 | 38500 / Attributes1To10Attribute3Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29564 | 38501 / Attributes1To10Attribute4Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29565 | 38502 / Attributes1To10Attribute5Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29566 | 38503 / Attributes1To10Attribute6Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29567 | 38504 / Attributes1To10Attribute7Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29568 | 38505 / Attributes1To10Attribute8Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29569 | 38506 / Attributes1To10Attribute9Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29570 | 38507 / Attributes1To10Attribute10Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29571 | 38508 / Attributes11To20Attribute11Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29572 | 38509 / Attributes11To20Attribute12Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29573 | 38510 / Attributes11To20Attribute13Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29574 | 38511 / Attributes11To20Attribute14Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29575 | 38512 / Attributes11To20Attribute15Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29576 | 38513 / Attributes11To20Attribute16Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29577 | 38514 / Attributes11To20Attribute17Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29578 | 38515 / Attributes11To20Attribute18Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29579 | 38516 / Attributes11To20Attribute19Value | data-customValueConfig | Y / Y / Y | 38 / 0 |
| 29580 | 38517 / Attributes11To20Attribute20Value | data-customValueConfig | Y / Y / Y | 38 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 12763 / click | 38496 / InventoryAttributesMenuActionSave | _webUi.inventoryAttributesDetails.invokePUTWebService | Not populated | Y / Y |
| 12764 / click | 38497 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 1 selected candidate rows for this Screen: **1 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 29560 | 38496 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
