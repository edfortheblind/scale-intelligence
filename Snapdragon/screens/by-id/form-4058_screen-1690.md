# Order — Form 4058, Screen 1690

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 4058 |
| MAIN_UI_SCREEN Object ID | 1690 |
| Label / Form resource key | Order / MNU_TPMORDERENTRYDETAILS |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | tpm / 7 |
| Configured path | /tpm/details/tpmorderentry |
| Candidate runtime URL | https://trav.manhscale.com/tpm/details/tpmorderentry |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/4058 |
| Inspection requirement | separate_portal |
| Form configuration table/view | OrderHeader |
| Help page reference | TPMorderHeader.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/4058 |
| Inspection time (UTC) | 2026-10-02T15:28:28.120Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_TPMORDERENTRYDETAILS |
| Observed configured table/view | OrderHeader |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1690 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Order is recorded as `tpm`. Its saved configuration contains 1 parts, 8 groups, 29 controls, and 13 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3914 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | TpmOrderHeaderMenuActionSave |

### Part 3914: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16479 / OrderHeaderReferenceinfoTitleSubAccordion | 16478 | Reference Info / REFERENCEINFO | 50 / 200 | Y / Y | Fixed to top=N; loading=2; nested unit=16478; default=None |
| 16476 / TPMorderHeaderMenu | Not populated | Not populated / Not populated | 150 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16476; default=None |
| 16477 / TpmOrderHeaderMenuPanel | 16476 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16476; default=None |
| 16480 / OrderHeaderCustomerTitleSubAccordion | 16478 | Not populated / Customer | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=16478; default=None |
| 16481 / OrderHeaderShiptoSubAccordion | 16478 | Ship To / TPMSHIPTO | 50 / 300 | Y / Y | Fixed to top=N; loading=2; nested unit=16478; default=None |
| 16482 / OrderHeaderLinesSubAccordion | 16478 | Lines / LINES | 50 / 350 | Y / Y | Fixed to top=N; loading=2; nested unit=16478; default=None |
| 16478 / TpmOrderHeaderDetailMainAccordion | Not populated | Not populated / Not populated | 140 / 2000 | Y / Y | Fixed to top=N; loading=2; nested unit=16478; default=None |
| 16483 / OrderHeaderCommentsSubAccordion | 16478 | Comments / TEXT | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=16478; default=None |

#### Group 16479: OrderHeaderReferenceinfoTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48596 / ReferenceinfoOrderNumValue | Order Number / TPMORDERNUMBER | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48597 / ReferenceinfoCustomerPoValue | Customer PO / TPMCUSTOMERPO | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48598 / ReferenceinfoWarehouseeValue | Warehouse / TPMWAREHOUSE | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48599 / SourceCompanyValue | Company / TPMCOMPANY | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48600 / CarrierCarrierValue | Carrier / TPMCARRIER | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48601 / CarrierCarrierServiceValue | Carrier Service / TPMCARRIERSERVICE | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 48602 / ReferenceinfoReqDeliveryType | Requested Delivery Type / TPMREQDELIVERYTYPE | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48603 / ReferenceinfoRequestedDeliveryDateValue | Requested Delivery Date / TPMREQDELIVERYDATE | 110 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16477: TpmOrderHeaderMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48593 / TpmOrderHeaderMenuActionSubmit | Submit / TPMBTN_SUBMIT | 150 / 150 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TPMBTN_SUBMIT |
| 48595 / TpmOrderHeaderSectionOrderNum | Not populated / Not populated | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 48594 / ActionCancel | Cancel / TPMBTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=TPMBTN_CANCEL |

#### Group 16480: OrderHeaderCustomerTitleSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48604 / CustomerCustomerValue | Customer / TPMCUSTOMER | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 48605 / CustomerNameValue | Name / TPMCUSTOMERNAME | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48606 / CustomerAddressValue | Address / TPMCUSTOMERADDRESS1 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48607 / CustomerCityValue | City / TPMCUSTOMERCITY | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48608 / CustomerStateValue | State / TPMCUSTOMERSTATE | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48609 / CustomerPostalCodeValue | Postal Code / TPMCUSTOMERPOSTALCODE | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48610 / CustomerCountryValue | Country / TPMCUSTOMERCOUNTRY | 80 / 1750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16481: OrderHeaderShiptoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48611 / ShiptoShipToValue | Ship To / TPMSHIPTO | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 48612 / ShipToShipToSameasCustomerValue | Use Customer Address / TPMSHIPTOSAMECUST | 130 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=20; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48613 / ShiptoNameValue | Name / TPMSHIPTONAME | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48614 / ShiptoAddressValue | Address / TPMSHIPTOADDRESS1 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48615 / ShiptoCityValue | City / TPMSHIPTOCITY | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48616 / ShiptoStateValue | State / TPMSHIPTOSTATE | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 48617 / ShiptoPostalCodeValue | Postal Code / TPMSHIPTOPOSTALCODE | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 48618 / ShiptoCountryValue | Country / TPMSHIPTOCOUNTRY | 80 / 1750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16482: OrderHeaderLinesSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48619 / AttributesMenuActionAdd | Add / TPMBTN_ADD | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowWithNav-1; TOOL_TIP_RESOURCE_KEY=TPMBTN_ADD |
| 48620 / OrderHeaderLinesGrid | Not populated / Not populated | 20 / 2000 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 48620 `OrderHeaderLinesGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16906 / Item | ITEM / Item / ITEM | 10 / 10 / 20 / 100 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16907 / ItemDesc | ITEM_DESC / Description / DESCRIPTION | 10 / 10 / 30 / 200 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16908 / Company | COMPANY / Company / COMPANY | 10 / 10 / 40 / 130 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16909 / OpenQty | OPEN_QTY / Quantity / QUANTITY | 20 / 10 / 50 / 120 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=30; DATA_SOURCE_TYPE=None |
| 16910 / QuantityUm | QUANTITY_UM / UM / UM | 10 / 10 / 70 / 100 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16911 / ErpOrderLineNum | ERP_ORDER_LINE_NUM / Object ID / OBJECTID | 20 / 10 / 80 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 16483: OrderHeaderCommentsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 48621 / OrderHeaderCommentsGrid | Not populated / Not populated | 20 / 7100 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 48621 `OrderHeaderCommentsGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 16912 / ICON | Not populated / Icon / ICON | 10 / 10 / 5 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16913 / COLOR | Not populated / Color / COLOR | 10 / 10 / 6 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16914 / CommentType | COMMENT_TYPE / Comment Type / COMMENTTYPE | 10 / 10 / 10 / 200 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=60 |
| 16915 / Text | Text / Comments / TEXT | 10 / 10 / 20 / 500 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16916 / InternalCommentId | Internal_Comment_Id / Internal Comment ID / INTERNALCOMMENTID | 20 / 10 / 40 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16917 / InternalNum | Internal_Num / Internal Number / INTERNALNUM | 20 / 10 / 50 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 16918 / RecordType | Not populated / Not populated / RecordType | 20 / 40 / 60 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 41 control attributes, 13 events, and 2 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 37850 | 48593 / TpmOrderHeaderMenuActionSubmit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37851 | 48594 / ActionCancel | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37852 | 48596 / ReferenceinfoOrderNumValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37853 | 48596 / ReferenceinfoOrderNumValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37854 | 48598 / ReferenceinfoWarehouseeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37855 | 48598 / ReferenceinfoWarehouseeValue | data-msg-required | Y / Y / Y | 30 / 1 |
| 37856 | 48600 / CarrierCarrierValue | childCombo | Y / Y / Y | 52 / 0 |
| 37857 | 48601 / CarrierCarrierServiceValue | parentCombo | Y / Y / Y | 38 / 0 |
| 37858 | 48603 / ReferenceinfoRequestedDeliveryDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 37859 | 48604 / CustomerCustomerValue | Lookup | Y / Y / N | 438 / 0 |
| 37860 | 48611 / ShiptoShipToValue | Lookup | Y / Y / N | 146 / 0 |
| 37861 | 48612 / ShipToShipToSameasCustomerValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37862 | 48612 / ShipToShipToSameasCustomerValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37863 | 48613 / ShiptoNameValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37864 | 48613 / ShiptoNameValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37865 | 48614 / ShiptoAddressValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37866 | 48614 / ShiptoAddressValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37867 | 48615 / ShiptoCityValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37868 | 48615 / ShiptoCityValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37869 | 48616 / ShiptoStateValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37870 | 48616 / ShiptoStateValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37871 | 48617 / ShiptoPostalCodeValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37872 | 48617 / ShiptoPostalCodeValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37873 | 48618 / ShiptoCountryValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37874 | 48618 / ShiptoCountryValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37875 | 48619 / AttributesMenuActionAdd | data-formId | Y / Y / N | 8 / 0 |
| 37876 | 48619 / AttributesMenuActionAdd | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37877 | 48620 / OrderHeaderLinesGrid | data-modelClass | Y / Y / N | 118 / 0 |
| 37878 | 48620 / OrderHeaderLinesGrid | data-dbtable | Y / Y / N | 24 / 0 |
| 37879 | 48620 / OrderHeaderLinesGrid | data-headerkey | Y / Y / N | 36 / 0 |
| 37880 | 48620 / OrderHeaderLinesGrid | pageSize | Y / Y / Y | 4 / 0 |
| 37881 | 48620 / OrderHeaderLinesGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 37882 | 48620 / OrderHeaderLinesGrid | data-restdelete | Y / Y / Y | 2 / 0 |
| 37883 | 48620 / OrderHeaderLinesGrid | data-local | Y / Y / Y | 8 / 0 |
| 37884 | 48621 / OrderHeaderCommentsGrid | data-gridEditable | Y / Y / Y | 8 / 0 |
| 37885 | 48621 / OrderHeaderCommentsGrid | data-restrictionsProcessor | Y / Y / Y | 86 / 0 |
| 37886 | 48621 / OrderHeaderCommentsGrid | data-defaultsProcessor | Y / Y / Y | 76 / 0 |
| 37887 | 48621 / OrderHeaderCommentsGrid | pageSize | Y / Y / Y | 4 / 0 |
| 37888 | 48621 / OrderHeaderCommentsGrid | data-modelClass | Y / Y / N | 100 / 0 |
| 37889 | 48621 / OrderHeaderCommentsGrid | data-dbtable | Y / Y / N | 24 / 0 |
| 37890 | 48621 / OrderHeaderCommentsGrid | data-headerkey | Y / Y / N | 24 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16361 / click | 48593 / TpmOrderHeaderMenuActionSubmit | _webUi.tpmOrderEntryDetails.submit | Not populated | Y / Y |
| 16362 / click | 48594 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 16363 / igcomboselectionchanged | 48598 / ReferenceinfoWarehouseeValue | _webUi.tpmOrderEntryDetails.reloadCarrierServices | Not populated | Y / Y |
| 16364 / igcomboselectionchanged | 48599 / SourceCompanyValue | _webUi.tpmOrderEntryDetails.reloadCarrierServices | Not populated | Y / Y |
| 16365 / igcomboselectionchanged | 48600 / CarrierCarrierValue | _webUi.tpmOrderEntryDetails.tpmCarrierChanged | Not populated | Y / Y |
| 16366 / igtexteditorvaluechanged | 48604 / CustomerCustomerValue | _webUi.tpmOrderEntryDetails.customerIdChanged | Not populated | Y / Y |
| 16367 / igtexteditorvaluechanged | 48611 / ShiptoShipToValue | _webUi.tpmOrderEntryDetails.shipToIdChanged | Not populated | Y / Y |
| 16368 / change | 48612 / ShipToShipToSameasCustomerValue | _webUi.tpmOrderEntryDetails.shipToSameAsCustomer | Not populated | Y / Y |
| 16369 / igcomboselectionchanged | 48618 / ShiptoCountryValue | _webUi.tpmOrderEntryDetails.shipToCountryChanged | Not populated | Y / Y |
| 16370 / click | 48619 / AttributesMenuActionAdd | _webUi.tpmOrderEntryDetails.addLines | Not populated | Y / Y |
| 16371 / iggridrendered | 48620 / OrderHeaderLinesGrid | _webUi.tpmOrderEntryDetails.loadLinesInGrid | Not populated | Y / Y |
| 16372 / iggridupdatingrowdeleting | 48620 / OrderHeaderLinesGrid | _webUi.tpmOrderEntryDetails.confirmLineDelete | Not populated | Y / Y |
| 16373 / iggridrendered | 48621 / OrderHeaderCommentsGrid | _webUi.tpmOrderEntryDetails.loadCommentsInGrid | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 23149 / 16370 | URL | Y / Y | 104 |
| 23150 / 16372 | CommitSelector | Y / Y | 34 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 7 selected candidate rows for this Screen: **6 accepted tokens** and **1 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 37850 | 48593 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37851 | 48594 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37875 | 48619 / Not applicable | data-formId | form_id | 4059 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37876 | 48619 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37878 | 48620 / Not applicable | data-dbtable | database_identifier | ORDER_DETAIL | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37889 | 48621 / Not applicable | data-dbtable | database_identifier | COMMENT_TEXT | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
