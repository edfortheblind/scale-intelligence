# Shipping Load — Form 3026, Screen 1668

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 3026 |
| MAIN_UI_SCREEN Object ID | 1668 |
| Label / Form resource key | Shipping Load / MNU_SHIPPINGLOADDETAILS |
| Functional area code | 40 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | record_detail_template / 6 |
| Configured path | /scale/details/shippingload |
| Candidate runtime URL | https://trav.manhscale.com/scale/details/shippingload |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/3026 |
| Inspection requirement | record_context_required |
| Form configuration table/view | ShippingLoadShippingAddressView |
| Help page reference | createShipLoad.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/3026 |
| Inspection time (UTC) | 2026-10-02T15:25:04.830Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_SHIPPINGLOADDETAILS |
| Observed configured table/view | ShippingLoadShippingAddressView |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1668 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Shipping Load is recorded as `record_detail_template`. Its saved configuration contains 2 parts, 14 groups, 60 controls, and 0 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy. This category depends on record/workflow context. A configured template or path is not a usable record URL until the required identifiers and entry flow are known.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3889 / CrudDataPane | Not populated / Not populated | 10 / 25 | Y / Y / N | ShippingLoadMenuActionSave |
| 3890 / AssignCarrierServiceModalDialog | Not populated / Not populated | 20 / 50 | Y / Y / Y | AssignCarrierServiceSaveButton |

### Part 3889: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16287 / ShippingLoadMenuGroup | Not populated | Not populated / Not populated | 150 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=16287; default=None |
| 16288 / ShippingLoadMenuPanel | 16287 | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=Y; loading=0; nested unit=16287; default=None |
| 16290 / ShipmentLoadInfoSubAccordion | 16289 | Shipping Load Info / ShippingLoadInfo | 50 / 250 | Y / Y | Fixed to top=N; loading=2; nested unit=16289; default=None |
| 16289 / ShipmentLoadMainAccordion | Not populated | Not populated / Not populated | 140 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=16289; default=None |
| 16291 / ShippingLoadDetailSectionDateSubAccordion | 16289 | Dates / DATES | 50 / 500 | Y / Y | Fixed to top=N; loading=1; nested unit=16289; default=None |
| 16292 / ShippingLoadDetailSectionStatusSubAccordion | 16289 | Status / STATUS | 50 / 750 | Y / Y | Fixed to top=N; loading=1; nested unit=16289; default=None |
| 16293 / ShippingLoadConsolidatorSubAccordion | 16289 | Consolidator / CONSOLIDATOR | 50 / 1000 | Y / Y | Fixed to top=N; loading=1; nested unit=16289; default=None |
| 16294 / ShippingLoadTotalsSubAccordion | 16289 | Totals / TOTALS | 50 / 1250 | Y / Y | Fixed to top=N; loading=1; nested unit=16289; default=None |
| 16295 / ShippingLoadReferenceInfoSubAccordion | 16289 | Reference Info / REFERENCEINFO | 50 / 1500 | Y / Y | Fixed to top=N; loading=1; nested unit=16289; default=None |
| 16296 / ShippingLoadUserDefinedSubAccordion | 16289 | User Defined / USERDEFINED | 50 / 1750 | Y / Y | Fixed to top=N; loading=1; nested unit=16289; default=None |

#### Group 16288: ShippingLoadMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47732 / ShippingLoadMenuActionSave | Save / BTN_SAVE | 150 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_SAVE |
| 47734 / ShippingLoadSectionInternalLoadNumber | Not populated / Not populated | 260 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |
| 47733 / ActionCancel | Cancel / BTN_CANCEL | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=BTN_CANCEL |

#### Group 16290: ShipmentLoadInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47735 / ShippingLoadInfoSectionInternalLoadNumberValue | Internal Load Number / INTERNALLOADNUM | 10 / 150 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 47736 / ShippingLoadInfoSectionCarrierValue | Not populated / carrier | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47737 / ShippingLoadInfoSectionRouteValue | Route / ROUTE | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47738 / ShippingLoadInfoSectionSealIdValue | Seal ID / SEALID | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47739 / ShippingLoadInfoSectionTrailerIdValue | Trailer ID / TRAILERID | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47740 / ShippingLoadInfoSectionDockDoorValue | Dock Door / DOCKDOOR | 80 / 1250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47741 / ShippingLoadInfoSectionProNumberValue | BOL/PRO/Tracking Num / PRONUMBER | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47742 / ShippingLoadInfoSectionMasterBOLNumberValue | Master BOL Number / MASTERBOLNUMBER | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47743 / ShippingLoadInfoSectionMasterBOLTypeValue | Master BOL Type / MASTERBOLTYPE | 80 / 2000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47744 / ShippingLoadInfoSectionVesselValue | Vessel / VESSEL | 10 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47745 / ShippingLoadInfoSectionVoyageValue | Voyage / VOYAGE | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 47746 / ShippingLoadInfoSectionClosedValue | Closed / CLOSED | 130 / 2750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16291: ShippingLoadDetailSectionDateSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47748 / DatesSectionActualShipDateTimeValue | Actual Ship Date Time / ActualShipDateTimes | 110 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47747 / DatesSectionScheduledShipDateValue | Scheduled Ship Date / SCHEDULEDSHIPDATE | 110 / 550 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47749 / DatesSectionPlannedDepartureDateTimeValue | Planned Departure Date Time / PLANNEDDEPARTUREDATETIME | 110 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47750 / DatesSectionActualDepartureDateTimeValue | Actual Departure Date Time / ACTUALDEPARTUREDATETIME | 110 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16292: ShippingLoadDetailSectionStatusSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47751 / StatusSectionLeadingStatusValue | Leading Status / LEADING_STS | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47752 / StatusSectionLeadingStatusDateValue | Leading Status Date / LEADING_STS_DATE | 110 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47753 / StatusSectionTrailingStatusValue | Trailing Status / TRAILING_STS | 80 / 750 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47754 / StatusSectionTrailingStatusDateValue | Trailing Status Date / TRAILING_STS_DATE | 110 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47755 / StatusSectionLeadingStatusFailedValue | Leading Status Failed / LEADING_STS_FAILED | 130 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47756 / StatusSectionTrailingStatusFailedValue | Trailing Status Failed / TRAILING_STS_FAILED | 130 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16293: ShippingLoadConsolidatorSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47757 / ConsolidatorSectionConsolidatorIdValue | Not populated / consolidatorID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1\|_MetaControlFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 47759 / ConsolidatorSectionNameValue | Name / NAME | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47758 / ConsolidatorSectionAttentionToValue | Attention To / ATTENTIONTO | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47760 / ConsolidatorSectionAddressValue | Address / ADDRESS | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47761 / ConsolidatorSectionPhoneNumberValue | Phone Number / PHONENUM | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47762 / ConsolidatorSectionAddressTwoValue | Address 2 (Optional) / ADDRESS2 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47763 / ConsolidatorSectionFaxNumberValue | Fax Number / FAXNUM | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47764 / ConsolidatorSectionAddressThreeValue | Address 3 (Optional) / ADDRESS3 | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47765 / ConsolidatorSectionEmailAddressValue | Email Address / EMAILADDRESS | 10 / 2250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47766 / ConsolidatorSectionCityValue | City / CITY | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 47767 / ConsolidatorSectionStateValue | State / STATE | 80 / 2750 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 47768 / ConsolidatorSectionZipValue | Postal Code / POSTALCODE | 10 / 3000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 47769 / ConsolidatorSectionCountryValue | Country / COUNTRY | 80 / 3250 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16294: ShippingLoadTotalsSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47770 / TotalsSectionTotalShipmentsValue | Total Shipments / TOTALSHIPMENTS | 90 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47771 / TotalsSectionTotalContainersValue | Not populated / TotalContainers | 90 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47772 / TotalsSectionTotalWeightValue | Total Weight / TOTALWEIGHT | 90 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47773 / TotalsSectionTotalWeightUmValue | UM / UM | 80 / 1000 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47774 / TotalsSectionTotalVolumeValue | Total Volume / TOTALVOLUME | 90 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47775 / TotalsSectionTotalVolumeUmValue | UM / UM | 80 / 1500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16295: ShippingLoadReferenceInfoSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47776 / RefrenceInfoSectionWarehouseValue | Not populated / Warehouse | 80 / 250 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47777 / RefrenceInfoSectionDateTimeStampValue | Not populated / DateTimeStamp | 120 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47778 / RefrenceInfoSectionUserStampValue | Not populated / UserStamp | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47779 / RefrenceInfoSectionProcessStampValue | Process Stamp / PROCESSSTAMP | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47780 / RefrenceInfoSectionManuallyEnteredValue | Manually Entered / MANUALLYENTERED | 130 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=30; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16296: ShippingLoadUserDefinedSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47781 / UserDefinedSectionUserDefined1Value | TCN / SHIPLOAD1 | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47782 / UserDefinedSectionUserDefined2Value | User Defined Field 2 / SHIPLOAD2 | 10 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47783 / UserDefinedSectionUserDefined3value | DISPO Number / SHIPLOAD3 | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47784 / UserDefinedSectionUserDefined4Value | User Defined Field 4 / SHIPLOAD4 | 10 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47785 / UserDefinedSectionUserDefined5Value | DRMO (Y/N) / SHIPLOAD5 | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47786 / UserDefinedSectionUserDefined6Value | User Defined Field 6 / SHIPLOAD6 | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47787 / UserDefinedSectionUserDefined7Value | Cost / SHIPLOAD7 | 90 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 47788 / UserDefinedSectionUserDefined8Value | User Defined Field 8 / SHIPLOAD8 | 90 / 2000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |

### Part 3890: AssignCarrierServiceModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 16297 / AssignCarrierServiceModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=16297; default=None |
| 16298 / AssignCarrierServiceModalDialogHeader | 16297 | Select Carrier Service / UI_CARRIERSERVICESELECT | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=16297; default=None |
| 16299 / AssignCarrierServiceModalDialogBody | 16297 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=16297; default=None |
| 16300 / AssignCarrierServiceModalDialogFooter | 16297 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=16297; default=None |

#### Group 16299: AssignCarrierServiceModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47789 / AssignCarrierServiceComboBox | One or more shipments have a different carrier than the destination load.  Please select a carrier service to be applied to all of these shipments. / MULTICARRIERSERVICES | 80 / 2500 | Y / Y | DATA_SOURCE_TYPE=60; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 16300: AssignCarrierServiceModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 47790 / AssignCarrierServiceSaveButton | Ok / BTN_OK | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 47791 / AssignCarrierServiceCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 18 control attributes, 9 events, and 12 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 37348 | 47732 / ShippingLoadMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37349 | 47732 / ShippingLoadMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 37350 | 47736 / ShippingLoadInfoSectionCarrierValue | data-rule-required | Y / Y / Y | 8 / 0 |
| 37351 | 47736 / ShippingLoadInfoSectionCarrierValue | data-msg-required | Y / Y / Y | 18 / 1 |
| 37352 | 47746 / ShippingLoadInfoSectionClosedValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37353 | 47746 / ShippingLoadInfoSectionClosedValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37354 | 47747 / DatesSectionScheduledShipDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 37355 | 47752 / StatusSectionLeadingStatusDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 37356 | 47754 / StatusSectionTrailingStatusDateValue | data-dateOnly | Y / Y / Y | 8 / 0 |
| 37357 | 47755 / StatusSectionLeadingStatusFailedValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37358 | 47755 / StatusSectionLeadingStatusFailedValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37359 | 47756 / StatusSectionTrailingStatusFailedValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37360 | 47756 / StatusSectionTrailingStatusFailedValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37361 | 47757 / ConsolidatorSectionConsolidatorIdValue | Lookup | Y / Y / N | 112 / 0 |
| 37362 | 47780 / RefrenceInfoSectionManuallyEnteredValue | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 37363 | 47780 / RefrenceInfoSectionManuallyEnteredValue | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 37364 | 47787 / UserDefinedSectionUserDefined7Value | data-rule-required | Y / Y / Y | 8 / 0 |
| 37365 | 47788 / UserDefinedSectionUserDefined8Value | data-rule-required | Y / Y / Y | 8 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 16190 / click | 47732 / ShippingLoadMenuActionSave | _webUi.shippingLoadDetails.invokePUTWebService | Not populated | Y / Y |
| 16191 / click | 47733 / ActionCancel | _webUi.detailsScreenBinding.cancel | Not populated | Y / Y |
| 16193 / igdatepickervaluechanged | 47748 / DatesSectionActualShipDateTimeValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16192 / igdatepickervaluechanged | 47747 / DatesSectionScheduledShipDateValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16194 / igdatepickervaluechanged | 47749 / DatesSectionPlannedDepartureDateTimeValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16195 / igdatepickervaluechanged | 47750 / DatesSectionActualDepartureDateTimeValue | _webUi.detailsScreenBinding.onDateControlsValueChanged | Not populated | Y / Y |
| 16196 / igtexteditorvaluechanged | 47757 / ConsolidatorSectionConsolidatorIdValue | _webUi.shippingLoadDetails.consolidatorValueChanged | Not populated | Y / Y |
| 16197 / click | 47790 / AssignCarrierServiceSaveButton | _webUi.shippingLoadDetails.invokePUTWebService | Not populated | Y / Y |
| 16198 / click | 47791 / AssignCarrierServiceCancelButton | _webUi.shippingLoadDetails.hideModalDialog | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 23006 / 16190 | PUTServiceURL | Y / Y | 80 |
| 23007 / 16190 | POSTServiceURL | Y / Y | 78 |
| 23008 / 16190 | POSTServiceSuccessCallbackInsert | Y / Y | 100 |
| 23009 / 16190 | POSTServiceErrorCallbackInsert | Y / Y | 80 |
| 23010 / 16190 | queryParameter_IdField | Y / Y | 30 |
| 23011 / 16190 | InformationDialogControlId | Y / Y | 56 |
| 23012 / 16190 | InformationDialogId | Y / Y | 62 |
| 23013 / 16190 | InformationMessageCode | Y / Y | 20 |
| 23014 / 16197 | PUTServiceURL | Y / Y | 80 |
| 23015 / 16197 | DetailScreen_DialogData | Y / Y | 86 |
| 23016 / 16197 | ModalDialogName | Y / Y | 62 |
| 23017 / 16198 | ModalDialogName | Y / Y | 62 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 8 selected candidate rows for this Screen: **8 accepted tokens** and **0 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 37348 | 47732 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 37349 | 47732 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23006 | 47732 / 16190 | PUTServiceURL | relative_api_path | /outbound/scaleapi/ShippingLoadApi/save? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23007 | 47732 / 16190 | POSTServiceURL | relative_api_path | /outbound/scaleapi/ShippingLoadApi/save | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23008 | 47732 / 16190 | POSTServiceSuccessCallbackInsert | callback_identifier | _webUi.shippingLoadDetails.saveLoadSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23009 | 47732 / 16190 | POSTServiceErrorCallbackInsert | callback_identifier | _webUi.shippingLoadDetails.errorCallBack | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23013 | 47732 / 16190 | InformationMessageCode | resource_code | MSG_CARR05 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 23014 | 47790 / 16197 | PUTServiceURL | relative_api_path | /outbound/scaleapi/ShippingLoadApi/save? | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
