# Shipment Consolidation — Form 3028, Screen 1516

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3028 |
| MAIN_UI_SCREEN Object ID | 1516 |
| Label / Form resource key | Shipment Consolidation / MNU_CONSOLIDATESHIPMENTTRANSACTION |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | transaction_context / 6 |
| Configured path | /scale/trans/consolidateshipment |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/consolidateshipment |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3028 |
| Inspection requirement | context_required_do_not_submit |
| Form configuration table/view | MetaTrans_GetConsolidateShipment |
| Help page reference | ConsolidateShipment.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3028 |
| Inspection time (UTC) | 2026-10-02T15:25:08.907Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_CONSOLIDATESHIPMENTTRANSACTION |
| Observed configured table/view | MetaTrans_GetConsolidateShipment |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1516 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Shipment Consolidation is recorded as `transaction_context`. Its saved configuration contains 1 parts, 9 groups, 33 controls, and 28 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3478 / CrudDataPane | Not populated / Not populated | 10 / 250 | Y / Y / N | Not populated |

### Part 3478: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14525 / ConsolidateShipmentConsolidationTotalsSubAccordion | 14524 | Not populated / ConsolidationTotals | 50 / 200 | Y / Y | Fixed to top=N; loading=2; nested unit=14524; default=None |
| 14522 / ConsolidateShipmentMenu | Not populated | Not populated / Not populated | 70 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14522; default=None |
| 14523 / ConsolidateShipmentMenuPanel | 14522 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=14522; default=None |
| 14526 / ConsolidateShipmentAllCriteriaSubAccordion | 14524 | Shipments - All Criteria Met / SHIPMENTSALLCRITERIAMET | 50 / 250 | Y / Y | Fixed to top=N; loading=1; nested unit=14524; default=None |
| 14527 / ConsolidateShipmentRequiredCriteriaSubAccordion | 14524 | Shipments - Required Criteria Met / SHIPMENTSREQUIREDCRITERIAMET | 50 / 300 | Y / Y | Fixed to top=N; loading=1; nested unit=14524; default=None |
| 14528 / ConsolidateShipmentShipmentTotalsSubAccordion | 14524 | Not populated / ShipmentTotals | 50 / 400 | Y / Y | Fixed to top=N; loading=0; nested unit=14524; default=None |
| 14524 / ConsolidateShipmentMainAccordion | Not populated | Not populated / Not populated | 40 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=14524; default=None |
| 14529 / ConsolidateShipmentShipmentInfoSubAccordion | 14524 | Not populated / ShipmentInfo | 50 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=14524; default=None |
| 14530 / ConsolidateShipmentShipToSubAccordion | 14524 | Not populated / ShipTo | 50 / 750 | Y / Y | Fixed to top=N; loading=0; nested unit=14524; default=None |

#### Group 14525: ConsolidateShipmentConsolidationTotalsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42168 / ConsolidationTotalsTotalLinesValue | Total Lines / TOTALLINES | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 42169 / ConsolidationTotalsTotalWeightValue | Total Weight / TOTALWEIGHT | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42170 / ConsolidationTotalsTotalWeightUmValue | UM / UM | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42171 / ConsolidationTotalsTotalVolumeValue | Total Volume / TOTALVOLUME | 90 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42172 / ConsolidationTotalsTotalVolumeUmValue | UM / UM | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14523: ConsolidateShipmentMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42165 / ConsolidateShipmentMenuShipmentIdValue | Shipment ID / SHIPMENTID | 260 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 42166 / ConsolidateShipmentActionConsolidate | Not populated / Consolidate | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=Consolidate |
| 42167 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 14526: ConsolidateShipmentAllCriteriaSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42173 / ConsolidateShipmentsAllCriteriaGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 42173 `ConsolidateShipmentsAllCriteriaGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14402 / Shipment_Id | Shipment_Id / Not populated / ShipmentId | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14403 / Total_Lines | Total_Lines / Not populated / Totallines | 20 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14404 / Customer | Customer / Not populated / Customer | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14405 / Customer_Name | Customer_Name / Not populated / CustomerName | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14406 / Ship_To | Ship_To / Not populated / ShipTo | 10 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14407 / Ship_To_Name | Ship_To_Name / Not populated / ShipToName | 10 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14408 / Carrier | Carrier / Not populated / Carrier | 10 / 10 / 70 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14409 / Carrier_Service | Carrier_Service / Not populated / CarrierService | 10 / 10 / 80 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14410 / Freight_Terms | Freight_Terms / Not populated / FreightTerms | 10 / 10 / 90 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14411 / Scheduled_Ship_Date | Scheduled_Ship_Date / Not populated / ScheduledShipDate | 30 / 10 / 100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14412 / Total_Weight | Total_Weight / Not populated / TotalWeight | 20 / 10 / 110 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=60; DATA_SOURCE_TYPE=None |
| 14413 / Total_Volume | Total_Volume / Not populated / TotalVolume | 20 / 10 / 120 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=50; DATA_SOURCE_TYPE=None |
| 14414 / Internal_Shipment_Num | Internal_Shipment_Num / Internal Shipment Number / INTERNAL_SHIPMENT_NUM | 20 / 10 / 130 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14415 / IN_DELETION | IN_DELETION / In Deletion / INDELETION | 40 / 10 / 140 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 14527: ConsolidateShipmentRequiredCriteriaSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42174 / ConsolidateShipmentsRequiredCriteriaGrid | Not populated / Not populated | 20 / 250 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 42174 `ConsolidateShipmentsRequiredCriteriaGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14416 / Shipment_Id | Shipment_Id / Not populated / ShipmentId | 10 / 10 / 10 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14417 / Total_Lines | Total_Lines / Not populated / Totallines | 20 / 10 / 20 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14418 / Customer | Customer / Not populated / Customer | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14419 / Customer_Name | Customer_Name / Not populated / CustomerName | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14420 / Ship_To | Ship_To / Not populated / ShipTo | 10 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14421 / Ship_To_Name | Ship_To_Name / Not populated / ShipToName | 10 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14422 / Carrier | Carrier / Not populated / Carrier | 10 / 10 / 70 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14423 / Carrier_Service | Carrier_Service / Not populated / CarrierService | 10 / 10 / 80 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14424 / Freight_Terms | Freight_Terms / Not populated / FreightTerms | 10 / 10 / 90 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14425 / Scheduled_Ship_Date | Scheduled_Ship_Date / Not populated / ScheduledShipDate | 30 / 10 / 100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14426 / Total_Weight | Total_Weight / Not populated / TotalWeight | 20 / 10 / 110 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=60; DATA_SOURCE_TYPE=None |
| 14427 / Total_Volume | Total_Volume / Not populated / TotalVolume | 20 / 10 / 120 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=50; DATA_SOURCE_TYPE=None |
| 14428 / Internal_Shipment_Num | Internal_Shipment_Num / Internal Shipment Number / INTERNAL_SHIPMENT_NUM | 10 / 10 / 130 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14429 / IN_DELETION | IN_DELETION / In Deletion / INDELETION | 40 / 10 / 140 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 14528: ConsolidateShipmentShipmentTotalsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42175 / ShipmentTotalsTotalLinesValue | Total Lines / TOTALLINES | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 42176 / ShipmentTotalsTotalWeightValue | Total Weight / TOTALWEIGHT | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42177 / ShipmentTotalsTotalWeightUmValue | UM / UM | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42178 / ShipmentTotalsTotalVolumeValue | Total Volume / TOTALVOLUME | 90 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42179 / ShipmentTotalsTotalVolumeUmValue | UM / UM | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14529: ConsolidateShipmentShipmentInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42180 / ShipmentInfoShipmentIdValue | Shipment ID / SHIPMENTID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42181 / ShipmentInfoScheduledShipDateValue | Scheduled Ship Date / SCHEDULEDSHIPDATE | 110 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42182 / ShipmentInfoCarrierValue | Carrier / CARRIER | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42183 / ShipmentInfoCarrierServiceValue | Carrier Service / CARRIERSERVICE | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42184 / ShipmentInfoFreightTermsValue | Freight Terms / FREIGHTTERMS | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14530: ConsolidateShipmentShipToSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 42185 / ShipToShipToValue | Ship To / SHIPTO | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 42186 / ShipToNameValue | Name / NAME | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42187 / ShipToAttentionToValue | Attention To / ATTENTIONTO | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42188 / ShipToAddressValue | Address / ADDRESS | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42195 / ShipToPhoneNumberValue | Phone Number / PHONENUM | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42189 / ShipToAddress2Value | Address 2 (Optional) / ADDRESS2 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42196 / ShipToFaxNumberValue | Fax Number / FAXNUM | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42190 / ShipToAddress3Value | Address 3 (Optional) / ADDRESS3 | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42197 / ShipToEmailAddressValue | Email Address / EMAILADDRESS | 10 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 42191 / ShipToCityValue | City / CITY | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 42192 / ShipToStateValue | State / STATE | 80 / 2750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 42193 / ShipToZipValue | Postal Code / POSTALCODE | 10 / 3000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 42194 / ShipToCountryValue | Country / COUNTRY | 80 / 3250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 20 control attributes, 8 events, and 1 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32516 | 42173 / ConsolidateShipmentsAllCriteriaGrid | data-queryEngineId | Y / Y / N | 62 / 0 |
| 32517 | 42173 / ConsolidateShipmentsAllCriteriaGrid | data-modelClass | Y / Y / N | 122 / 0 |
| 32518 | 42173 / ConsolidateShipmentsAllCriteriaGrid | data-headerkey | Y / Y / N | 22 / 0 |
| 32519 | 42173 / ConsolidateShipmentsAllCriteriaGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 32520 | 42173 / ConsolidateShipmentsAllCriteriaGrid | clearSelection | Y / Y / N | 10 / 0 |
| 32521 | 42173 / ConsolidateShipmentsAllCriteriaGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 32522 | 42173 / ConsolidateShipmentsAllCriteriaGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 32523 | 42173 / ConsolidateShipmentsAllCriteriaGrid | pageSize | Y / Y / Y | 4 / 0 |
| 32524 | 42173 / ConsolidateShipmentsAllCriteriaGrid | data-groupBy | Y / Y / Y | 10 / 0 |
| 32525 | 42174 / ConsolidateShipmentsRequiredCriteriaGrid | data-queryEngineId | Y / Y / N | 62 / 0 |
| 32526 | 42174 / ConsolidateShipmentsRequiredCriteriaGrid | data-groupBy | Y / Y / Y | 10 / 0 |
| 32527 | 42174 / ConsolidateShipmentsRequiredCriteriaGrid | data-modelClass | Y / Y / N | 122 / 0 |
| 32528 | 42174 / ConsolidateShipmentsRequiredCriteriaGrid | data-loadDefaults | Y / Y / N | 10 / 0 |
| 32529 | 42174 / ConsolidateShipmentsRequiredCriteriaGrid | clearSelection | Y / Y / N | 10 / 0 |
| 32530 | 42174 / ConsolidateShipmentsRequiredCriteriaGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 32531 | 42174 / ConsolidateShipmentsRequiredCriteriaGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 32532 | 42174 / ConsolidateShipmentsRequiredCriteriaGrid | pageSize | Y / Y / Y | 4 / 0 |
| 32533 | 42181 / ShipmentInfoScheduledShipDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 32534 | 42182 / ShipmentInfoCarrierValue | childCombo | Y / Y / Y | 62 / 0 |
| 32535 | 42183 / ShipmentInfoCarrierServiceValue | parentCombo | Y / Y / Y | 48 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 14009 / click | 42166 / ConsolidateShipmentActionConsolidate | _webUi.consolidateShipmentTransaction.consolidateShipments | Not populated | Y / Y |
| 14010 / click | 42167 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 14011 / iggridrowselectorscheckboxstatechanging | 42173 / ConsolidateShipmentsAllCriteriaGrid | _webUi.consolidateShipmentTransaction.gridRowSelectorsCheckBoxStateChanging | Not populated | Y / Y |
| 14012 / iggridrowselectorsrowselectorclicked | 42173 / ConsolidateShipmentsAllCriteriaGrid | _webUi.consolidateShipmentTransaction.gridRowSelectorsRowSelectorClicked | Not populated | Y / Y |
| 14013 / iggridselectionrowselectionchanging | 42173 / ConsolidateShipmentsAllCriteriaGrid | _webUi.consolidateShipmentTransaction.gridSelectionRowChanging | Not populated | Y / Y |
| 14014 / iggridrowselectorscheckboxstatechanging | 42174 / ConsolidateShipmentsRequiredCriteriaGrid | _webUi.consolidateShipmentTransaction.gridRowSelectorsCheckBoxStateChanging | Not populated | Y / Y |
| 14015 / iggridrowselectorsrowselectorclicked | 42174 / ConsolidateShipmentsRequiredCriteriaGrid | _webUi.consolidateShipmentTransaction.gridRowSelectorsRowSelectorClicked | Not populated | Y / Y |
| 14016 / iggridselectionrowselectionchanging | 42174 / ConsolidateShipmentsRequiredCriteriaGrid | _webUi.consolidateShipmentTransaction.gridSelectionRowChanging | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19302 / 14009 | POSTServiceURL | Y / Y | 166 |

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
