# Receipt Insight — Form 2777, Screen 1781

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Runtime route observed; Screen variant unconfirmed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 2777 |
| MAIN_UI_SCREEN Object ID | 1781 |
| Label / Form resource key | Receipt Insight / MNU_RECEIPTINSIGHT |
| Functional area code | 10 |
| Active / System created / Show in application menu | Y / Y / Y |
| Route category / path type code | insight / 6 |
| Configured path | /scale/insights/2777 |
| Candidate runtime URL | https://trav.manhscale.com/scale/insights/2777 |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/2777 |
| Inspection requirement | direct_route_candidate |
| Form configuration table/view | METADATA_INSIGHT_RECEIPT_VIEW |
| Help page reference | ReceiptInsight.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/2777 |
| Inspection time (UTC) | 2026-10-02T15:24:04.728Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_RECEIPTINSIGHT |
| Observed configured table/view | METADATA_INSIGHT_RECEIPT_VIEW |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1781 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

| Time (UTC) | Result / state | Actual URL / title | Evidence |
|---|---|---|---|
| 2026-10-02T15:13:07.051Z | loaded; runtime_inspection | https://trav.manhscale.com/scale/insights/2777; Receipt Insight | [runtime-root.json](../../evidence/runtime-root.json) |

**Visible criteria / entry fields:** Receipt ID; Receipt ID Type; Item; Company; License Plate; Receiving Dock; Source Name; Ship From; From Receipt Date; To Receipt Date; Internal Receipt Number; Warehouse.

**Visible grid headers:** Field; Operand; Value; Receipt ID; Receipt ID Type; Company; Trailer ID; Trailer Location; Receipt Date; Closed Date Time; Leading Status; Trailing Status; Receipt Type; Purchase Order ID; Source ID; Source; BOL Number; Packing List ID; BOL/PRO/Tracking Num; Seal ID; Priority; Appointment Scheduled; Internal Receipt Number; Leading Status (Numeric); Trailing Status (Numeric); Immediate Needs Request Created; QC Inspection; Scheduled Date; Icon; Color.

**Observed action/menu labels:** Σ; Actions; New; Edit; Delete; New Container; New Line; Assign Trailer ID; New Appointment; Edit Appointment; Delete Appointment; Cancel Close; Check in; Create Pre-Check in Containers; Close; Print Preview; Immediate Needs; Print Default Docs; Print Selected Docs; Yard Check in & Out.

**Page groups:** Basic Criteria; Advanced Criteria.

These observations establish the displayed route and controls only. They do not establish active-Screen selection, authorization for each action, or successful operational effects.

## Configurable architecture

Receipt Insight is recorded as `insight`. Its saved configuration contains 7 parts, 25 groups, 62 controls, and 31 grid-column records. The four named panes expose a menu/search/list/detail composition. Follow the part and parent-group relationships below to locate filters, grid controls, detail content, and menu actions.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 4404 / SaveSearchModalDialog | Not populated / Not populated | 20 / 2500 | Y / Y / Y | SaveSearchSaveButton |
| 4405 / GadgetCalculationQueryDialog | Not populated / Not populated | 20 / 4000 | Y / Y / Y | GadgetCalculationQuerySaveButton |
| 4406 / InsightMenuPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | Not populated |
| 4407 / SearchPane | Not populated / Not populated | 10 / 5000 | Y / Y / N | InsightMenuApply |
| 4408 / ListPane | Not populated / Not populated | 10 / 7500 | Y / Y / N | Not populated |
| 4410 / DetailPane | Not populated / Not populated | 10 / 10000 | Y / Y / N | Not populated |
| 4409 / AssignTrailerModalDialog | Not populated / Not populated | 20 / 15000 | Y / Y / Y | AssignTrailerSaveButton |

### Part 4404: SaveSearchModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18141 / SaveSearchModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18141; default=None |
| 18142 / SaveSearchModalDialogHeader | 18141 | Save Search Criteria / SAVESEARCHCRITERIA | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18141; default=None |
| 18143 / SaveSearchModalDialogBody | 18141 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18141; default=None |
| 18144 / SaveSearchModalDialogFooter | 18141 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18141; default=None |

#### Group 18143: SaveSearchModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51781 / SaveSearchNameEditor | Enter a Name for The Search / ENTERSEARCHNAME | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18144: SaveSearchModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51782 / SaveSearchSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51783 / SaveSearchCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4405: GadgetCalculationQueryDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18145 / GadgetCalculationQueryDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18145; default=None |
| 18146 / GadgetCalculationQueryDialogHeader | 18145 | Save criteria as tile / INSIGHTSAVETILECRITERIA01 | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18145; default=None |
| 18147 / GadgetCalculationQueryDialogBody | 18145 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18145; default=None |
| 18148 / GadgetCalculationQueryDialogFooter | 18145 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18145; default=None |

#### Group 18147: GadgetCalculationQueryDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51784 / GadgetCalculationQueryNameEditor | Enter a name / INSIGHTSAVETILECRITERIA02 | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18148: GadgetCalculationQueryDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51785 / GadgetCalculationQuerySaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51786 / GadgetCalculationQueryCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4406: InsightMenuPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18149 / InsightMenu | Not populated | Not populated / Not populated | 70 / 5000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18149; default=None |
| 18150 / InsightMenuPanel | 18149 | Not populated / Not populated | 60 / 7500 | Y / Y | Fixed to top=Y; loading=0; nested unit=18149; default=None |
| 18151 / InsightMenuFavoritesDropdown | 18149 | Favorites / FAVORITES | 100 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=18149; default=None |
| 18152 / InsightListPaneMenuPanel | 18149 | Not populated / Not populated | 60 / 11000 | Y / Y | Fixed to top=Y; loading=0; nested unit=18149; default=None |
| 18153 / MenuExportToExcelPanel | 18149 | Not populated / Not populated | 60 / 12500 | Y / Y | Fixed to top=N; loading=0; nested unit=18149; default=None |
| 18154 / InsightMenuActionsDropdown | 18149 | Actions / ACTIONS | 80 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18149; default=None |

#### Group 18150: InsightMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51787 / InsightMenuApply | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_APPLY |
| 51788 / InsightMenuActionClearFilters | Not populated / Not populated | 150 / 4000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_CLEAR |
| 51789 / InsightMenuActionStopSearch | Not populated / Not populated | 150 / 4500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=BTN_STOP |
| 51790 / InsightMenuActionSaveSearch | Not populated / Not populated | 150 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18152: InsightListPaneMenuPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51791 / GadgetCalculationQueryMenuAction | Not populated / Not populated | 150 / 500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51792 / InsightMenuActionToggleSummary | Σ / SIGMA | 150 / 1000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=SIGMA |
| 51793 / InsightMenuActionToggleGroupBy | Not populated / Not populated | 150 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |
| 51794 / InsightMenuActionCollapse | Not populated / Not populated | 150 / 1300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY= |

#### Group 18153: MenuExportToExcelPanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51795 / MenuExportToExcel | Not populated / Not populated | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EXPORTTOEXCEL |

#### Group 18154: InsightMenuActionsDropdown — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51796 / ListPaneMenuActionNew | New / NEW | 150 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEW |
| 51797 / ListPaneMenuActionEdit | Edit / EDIT | 150 / 2100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDIT |
| 51798 / ListPaneMenuActionView | View / VIEW | 150 / 2200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEW |
| 51799 / ListPaneMenuActionDeleteReceipt | Delete / DELETE | 150 / 2300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETE |
| 51800 / ListPaneMenuActionNewContainer | New Container / NEWRECEIPTCONTAINER | 150 / 2400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEWRECEIPTCONTAINER |
| 51801 / ListPaneMenuActionNewLine | New Line / NEWLINE | 150 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=NEWLINE |
| 51802 / ListPaneMenuActionAssignTrailer | Assign Trailer ID / ASSIGNTRAILERID | 150 / 2600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=ASSIGNTRAILERID |
| 51803 / ListPaneMenuActionNewAppointment | New Appointment / MNU_NEWAPPOINTMENT | 150 / 2700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=MNU_NEWAPPOINTMENT |
| 51804 / ListPaneMenuActionEditAppointment | Edit Appointment / EDITAPPOINTMENT | 150 / 2800 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=EDITAPPOINTMENT |
| 51805 / ListPaneMenuActionViewAppointment | View Appointment / VIEWAPPOINTMENT | 150 / 2900 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=VIEWAPPOINTMENT |
| 51806 / ListPaneMenuActionDeleteAppointment | Delete Appointment / DELETEAPPOINTMENT | 150 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=DELETEAPPOINTMENT |
| 51807 / ListPaneMenuActionCancelClose | Cancel Close / CANCELCLOSE | 150 / 3100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CANCELCLOSE |
| 51808 / ListPaneMenuActionCheckin | Check in / CHECKIN | 150 / 3200 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CHECKIN |
| 51809 / ListPaneMenuActionCreatePreCheckInContainers | Create Pre-Check in Containers / CREATEPRECHECKINCONTAINERS | 150 / 3300 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CREATEPRECHECKINCONTAINERS |
| 51810 / ListPaneMenuActionCloseReceipt | Close / CLOSE | 150 / 3400 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=CLOSE |
| 51811 / ListPaneMenuActionPrintPreviewDocs | Print Preview / PRINTPREVIEW | 150 / 3500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTPREVIEW |
| 51812 / ListPaneMenuActionImmediateNeeds | Immediate Needs / IMMEDIATENEEDS | 150 / 3600 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=IMMEDIATENEEDS |
| 51813 / ListPaneMenuActionPrintReceiptDocs | Print Default Docs / PRINTDEFAULTDOCS | 150 / 3700 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTDEFAULTDOCS |
| 51814 / ListPaneMenuActionPrintSelectedReceiptDocs | Print Selected Docs / PRINTSELECTEDDOCS | 150 / 3800 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=PRINTSELECTEDDOCS |
| 51815 / ListPaneMenuActionYardCheckInOut | Yard Check in & Out / YARDCHECKINANDOUT | 150 / 3900 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=YARDCHECKINANDOUT |

### Part 4407: SearchPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18155 / SearchPaneCriteria | Not populated | Not populated / Not populated | 40 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18155; default=None |
| 18156 / SearchPaneBasicCriteria | 18155 | Basic Criteria / BASICCRITERIA | 50 / 10000 | Y / Y | Fixed to top=N; loading=2; nested unit=18155; default=None |
| 18157 / SearchPaneAdvancedCriteria | 18155 | Advanced Criteria / ADVANCEDCRITERIA | 50 / 22500 | Y / Y | Fixed to top=N; loading=0; nested unit=18155; default=None |

#### Group 18156: SearchPaneBasicCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51816 / BasicCriteriaReceiptId | Receipt ID / RECEIPTID | 10 / 250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51817 / BasicCriteriaReceiptIdType | Receipt ID Type / RECEIPTIDTYPE | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51818 / BasicCriteriaItem | Item / ITEM | 10 / 750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51819 / SearchPaneCompany | Company / COMPANY | 280 / 1000 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51820 / BasicCriteriaReferenceLicensePlate | License Plate / LICENSEPLATE | 10 / 1250 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51821 / BasicCriteriaReceivingDock | Receiving Dock / RECEIVINGDOCK | 10 / 1500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51822 / BasicCriteriaSourceName | Source Name / SOURCENAME | 10 / 1750 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51823 / BasicCriteriaShipFrom | Ship From / SHIPFROM | 10 / 2000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=\|_MetaControlInsightFilterLookup-2; TOOL_TIP_RESOURCE_KEY=None |
| 51824 / BasicCriteriaReceiptDate | Receipt Date / RECEIPTDATE | 190 / 3000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51825 / BasicCriteriaInternalReceiptNum | Internal Receipt Number / INTERNALRECEIPTNUM | 90 / 3100 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51826 / SearchPaneWarehouse | Warehouse / WAREHOUSE | 280 / 3250 | Y / Y | DATA_SOURCE_TYPE=10; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51827 / BasicCriteriaIncludeClosedRec | Include Closed Receipts / INCLUDECLOSEDREC | 130 / 3500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=40; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18157: SearchPaneAdvancedCriteria — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51828 / SearchPaneAdvCrit | Not populated / Not populated | 70 / 2500 | Y / Y | DATA_SOURCE_TYPE=40; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=20; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4408: ListPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18158 / ListPaneSummary | Not populated | Not populated / Not populated | 60 / 250 | Y / Y | Fixed to top=N; loading=0; nested unit=18158; default=None |
| 18159 / ListPanePanel | Not populated | Not populated / Not populated | 60 / 500 | Y / Y | Fixed to top=N; loading=0; nested unit=18159; default=None |

#### Group 18158: ListPaneSummary — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51829 / ListPaneSummaryReceipts | Receipts / RECEIPTS | 50 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51830 / ListPaneSummaryLines | Lines / LINES | 50 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51831 / ListPaneSummaryUnits | Units / UNITS | 50 / 750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51832 / ListPaneSummaryVolume | Volume / VOLUME | 50 / 1000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18159: ListPanePanel — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51833 / ListPaneDataGrid | Not populated / Not populated | 20 / 2500 | Y / Y | DATA_SOURCE_TYPE=50; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 51833 `ListPaneDataGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 18533 / RECEIPT_ID | RECEIPT_ID / Receipt ID / RECEIPTID | 10 / 10 / 30 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18534 / RECEIPT_ID_TYPE | Not populated / Receipt ID Type / RECEIPTIDTYPE | 10 / 10 / 40 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18535 / COMPANY | Not populated / Company / COMPANY | 10 / 10 / 50 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18536 / TRAILER_ID | Not populated / Trailer ID / TRAILERID | 10 / 10 / 60 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18537 / TRAILER_LOCATION | Not populated / Trailer Location / TRAILERLOCATION | 10 / 10 / 70 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18538 / RECEIPT_DATE | Not populated / Receipt Date / RECEIPTDATE | 30 / 10 / 80 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18539 / CLOSE_DATE | Not populated / Closed Date Time / CLOSEDDATETIME | 30 / 10 / 90 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18540 / LEADING_STS | Not populated / Leading Status / LEADINGSTS | 10 / 10 / 100 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18541 / TRAILING_STS | Not populated / Trailing Status / TRAILINGSTS | 10 / 10 / 110 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18542 / RECEIPT_TYPE | Not populated / Receipt Type / RECEIPTTYPE | 10 / 10 / 120 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18543 / PURCHASE_ORDER_ID | Not populated / Purchase Order ID / PURCHASE_ORDER_ID | 10 / 10 / 130 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18544 / SOURCE_ID | Not populated / Source ID / SOURCEID | 10 / 10 / 140 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18545 / SOURCE_NAME | Not populated / Source / SOURCE | 10 / 10 / 150 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18546 / BOL_NUM_ALPHA | Not populated / BOL Number / BOLNUMBER | 10 / 10 / 160 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18547 / PACKING_LIST_ID | Not populated / Packing List ID / PACKINGLISTID | 10 / 10 / 170 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18548 / PRO_NUM_ALPHA | Not populated / BOL/PRO/Tracking Num / PRONUMBER | 10 / 10 / 180 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18549 / SEAL_ID | Not populated / Seal ID / SEALID | 10 / 10 / 190 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18550 / PRIORITY | Not populated / Priority / PRIORITY | 10 / 10 / 200 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18551 / APPOINTMENT_ID | Not populated / Appointment Scheduled / APPOINTMENTSCHEDULED | 40 / 10 / 220 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18552 / INTERNAL_RECEIPT_NUM | INTERNAL_RECEIPT_NUM / Internal Receipt Number / INTERNALRECEIPTNUM | 10 / 10 / 230 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18553 / Not populated | RECEIPT_ID / Not populated / Not populated | Not populated / 20 / 6750 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18554 / Not populated | INTERNAL_RECEIPT_NUM / Receipt ID Type / RECEIPTIDTYPE | Not populated / 20 / 6750 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18555 / Not populated | RECEIPT_ID / Trailer ID / TRAILERID | Not populated / 30 / 7000 / Not populated | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18556 / LEADINGSTS | Not populated / Leading Status (Numeric) / LEADINGSTSNUMERIC | 20 / 10 / 7500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18557 / TRAILINGSTS | Not populated / Trailing Status (Numeric) / TRAILINGSTSNUMERIC | 20 / 10 / 8000 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18558 / IMMD_NEEDS_REQ_CREATED | Not populated / Immediate Needs Request Created / IMMDNEEDSREQCREATED | 40 / 10 / 8500 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18559 / QC_INSPECTION | Not populated / QC Inspection / QCINSPECTION | 40 / 10 / 8550 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18560 / SCHEDULED_DATE | Not populated / Scheduled Date / SCHEDULEDDATE | 30 / 10 / 8560 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18531 / Not populated | RECOMPILE / Not populated / Not populated | 10 / 60 / 8570 / Not populated | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18530 / ICON | Not populated / Icon / ICON | 10 / 10 / 8600 / 45 | Y / Y / Y | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 18532 / COLOR | Not populated / Color / COLOR | 10 / 10 / 8700 / 1 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=N; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

### Part 4410: DetailPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18164 / DetailPaneHeaderPanel1 | Not populated | Not populated / Not populated | 60 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18164; default=None |
| 18165 / indicatorpane | Not populated | Not populated / Not populated | 60 / 15000 | Y / Y | Fixed to top=N; loading=0; nested unit=18165; default=None |

#### Group 18164: DetailPaneHeaderPanel1 — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51837 / DetailPaneHeaderReceiptID | Not populated / Not populated | 240 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=599; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51838 / DetailPaneHeaderShipFromName | Not populated / Not populated | 30 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=599; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51839 / DetailPaneHeaderTrailingSts | Not populated / Not populated | 30 / 1500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=599; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51840 / DetailPaneHeaderLeadingSts | Not populated / Not populated | 30 / 1750 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=599; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18165: indicatorpane — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51841 / ReceiptInsightWavedIndicatorTileLines | Lines / LINES | 360 / 250 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51842 / ReceiptInsightWavedIndicatorTileContainers | Containers / CONTAINERS | 360 / 500 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

### Part 4409: AssignTrailerModalDialog

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 18160 / AssignTrailerModalDialogForm | Not populated | Not populated / Not populated | 90 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18160; default=None |
| 18161 / AssignTrailerModalDialogHeader | 18160 | Assign Trailer ID / ASSIGNTRAILERID | 110 / 2500 | Y / Y | Fixed to top=N; loading=0; nested unit=18160; default=None |
| 18162 / AssignTrailerModalDialogBody | 18160 | Not populated / Not populated | 120 / 5000 | Y / Y | Fixed to top=N; loading=0; nested unit=18160; default=None |
| 18163 / AssignTrailerModalDialogFooter | 18160 | Not populated / Not populated | 130 / 7500 | Y / Y | Fixed to top=N; loading=0; nested unit=18160; default=None |

#### Group 18162: AssignTrailerModalDialogBody — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51834 / AssignTrailerEditor | Enter a Trailer ID / ENTERTRAILERID | 10 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

#### Group 18163: AssignTrailerModalDialogFooter — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 51835 / AssignTrailerSaveButton | Save / BTN_SAVE | 100 / 2500 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |
| 51836 / AssignTrailerCancelButton | Cancel / BTN_CANCEL | 100 / 5000 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 82 control attributes, 39 events, and 94 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 40882 | 51781 / SaveSearchNameEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40883 | 51781 / SaveSearchNameEditor | data-msg-required | Y / Y / Y | 32 / 0 |
| 40884 | 51790 / InsightMenuActionSaveSearch | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40885 | 51791 / GadgetCalculationQueryMenuAction | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40886 | 51796 / ListPaneMenuActionNew | data-formId | Y / Y / N | 8 / 0 |
| 40887 | 51796 / ListPaneMenuActionNew | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40888 | 51797 / ListPaneMenuActionEdit | data-formId | Y / Y / N | 8 / 0 |
| 40889 | 51797 / ListPaneMenuActionEdit | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40890 | 51798 / ListPaneMenuActionView | data-formId | Y / Y / N | 8 / 0 |
| 40891 | 51799 / ListPaneMenuActionDeleteReceipt | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40892 | 51799 / ListPaneMenuActionDeleteReceipt | data-formId | Y / Y / N | 8 / 0 |
| 40893 | 51799 / ListPaneMenuActionDeleteReceipt | data-divider | Y / Y / N | 8 / 0 |
| 40894 | 51799 / ListPaneMenuActionDeleteReceipt | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40895 | 51800 / ListPaneMenuActionNewContainer | data-formId | Y / Y / N | 8 / 0 |
| 40896 | 51800 / ListPaneMenuActionNewContainer | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40897 | 51801 / ListPaneMenuActionNewLine | data-divider | Y / Y / N | 8 / 0 |
| 40898 | 51801 / ListPaneMenuActionNewLine | data-formId | Y / Y / N | 8 / 0 |
| 40899 | 51801 / ListPaneMenuActionNewLine | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40900 | 51802 / ListPaneMenuActionAssignTrailer | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40901 | 51802 / ListPaneMenuActionAssignTrailer | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40902 | 51803 / ListPaneMenuActionNewAppointment | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40903 | 51803 / ListPaneMenuActionNewAppointment | data-formId | Y / Y / N | 8 / 0 |
| 40904 | 51803 / ListPaneMenuActionNewAppointment | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40905 | 51804 / ListPaneMenuActionEditAppointment | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40906 | 51804 / ListPaneMenuActionEditAppointment | data-formId | Y / Y / N | 8 / 0 |
| 40907 | 51804 / ListPaneMenuActionEditAppointment | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40908 | 51805 / ListPaneMenuActionViewAppointment | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40909 | 51805 / ListPaneMenuActionViewAppointment | data-formId | Y / Y / N | 8 / 0 |
| 40910 | 51806 / ListPaneMenuActionDeleteAppointment | data-formId | Y / Y / N | 6 / 0 |
| 40911 | 51806 / ListPaneMenuActionDeleteAppointment | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40912 | 51806 / ListPaneMenuActionDeleteAppointment | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40913 | 51807 / ListPaneMenuActionCancelClose | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40914 | 51807 / ListPaneMenuActionCancelClose | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40915 | 51808 / ListPaneMenuActionCheckin | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40916 | 51808 / ListPaneMenuActionCheckin | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40917 | 51809 / ListPaneMenuActionCreatePreCheckInContainers | data-allowOnMultiSelect | Y / Y / N | 10 / 0 |
| 40918 | 51809 / ListPaneMenuActionCreatePreCheckInContainers | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40919 | 51810 / ListPaneMenuActionCloseReceipt | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40920 | 51810 / ListPaneMenuActionCloseReceipt | data-allowOnMultiSelect | Y / Y / N | 8 / 0 |
| 40921 | 51811 / ListPaneMenuActionPrintPreviewDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40922 | 51812 / ListPaneMenuActionImmediateNeeds | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40923 | 51813 / ListPaneMenuActionPrintReceiptDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40924 | 51814 / ListPaneMenuActionPrintSelectedReceiptDocs | data-securityCheckpoint | Y / Y / N | 4 / 0 |
| 40925 | 51815 / ListPaneMenuActionYardCheckInOut | data-formId | Y / Y / N | 8 / 0 |
| 40926 | 51815 / ListPaneMenuActionYardCheckInOut | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 40927 | 51816 / BasicCriteriaReceiptId | data-dbcolumn | Y / Y / N | 20 / 0 |
| 40928 | 51816 / BasicCriteriaReceiptId | Lookup | Y / Y / N | 86 / 1 |
| 40929 | 51817 / BasicCriteriaReceiptIdType | data-dbcolumn | Y / Y / N | 30 / 0 |
| 40930 | 51818 / BasicCriteriaItem | data-dbcolumn | Y / Y / N | 8 / 0 |
| 40931 | 51818 / BasicCriteriaItem | Lookup | Y / Y / N | 54 / 0 |
| 40932 | 51819 / SearchPaneCompany | data-dbcolumn | Y / Y / N | 14 / 0 |
| 40933 | 51820 / BasicCriteriaReferenceLicensePlate | data-dbcolumn | Y / Y / N | 32 / 0 |
| 40934 | 51820 / BasicCriteriaReferenceLicensePlate | Lookup | Y / Y / N | 120 / 1 |
| 40935 | 51821 / BasicCriteriaReceivingDock | data-dbcolumn | Y / Y / N | 28 / 0 |
| 40936 | 51821 / BasicCriteriaReceivingDock | Lookup | Y / Y / N | 88 / 1 |
| 40937 | 51822 / BasicCriteriaSourceName | data-dbcolumn | Y / Y / N | 22 / 0 |
| 40938 | 51822 / BasicCriteriaSourceName | Lookup | Y / Y / N | 92 / 0 |
| 40939 | 51823 / BasicCriteriaShipFrom | data-dbcolumn | Y / Y / N | 48 / 0 |
| 40940 | 51823 / BasicCriteriaShipFrom | Lookup | Y / Y / N | 80 / 0 |
| 40941 | 51824 / BasicCriteriaReceiptDate | data-dbcolumn | Y / Y / N | 54 / 0 |
| 40942 | 51824 / BasicCriteriaReceiptDate | data-dateOnly | Y / Y / Y | 8 / 0 |
| 40943 | 51825 / BasicCriteriaInternalReceiptNum | data-dbcolumn | Y / Y / N | 40 / 0 |
| 40944 | 51825 / BasicCriteriaInternalReceiptNum | nullable | Y / Y / Y | 8 / 0 |
| 40945 | 51826 / SearchPaneWarehouse | defaultValue | Y / Y / Y | 32 / 0 |
| 40946 | 51826 / SearchPaneWarehouse | data-dbcolumn | Y / Y / N | 18 / 0 |
| 40947 | 51827 / BasicCriteriaIncludeClosedRec | data-dbcolumn | Y / Y / N | 20 / 0 |
| 40948 | 51827 / BasicCriteriaIncludeClosedRec | data-positiveCondition | Y / Y / N | 0 / 0 |
| 40949 | 51827 / BasicCriteriaIncludeClosedRec | data-negativeCondition | Y / Y / N | 14 / 0 |
| 40950 | 51827 / BasicCriteriaIncludeClosedRec | data-btn-true-resourceKey | Y / Y / N | 32 / 0 |
| 40951 | 51827 / BasicCriteriaIncludeClosedRec | data-btn-false-resourceKey | Y / Y / N | 30 / 0 |
| 40952 | 51829 / ListPaneSummaryReceipts | data-aggregateClause | Y / Y / Y | 54 / 0 |
| 40953 | 51830 / ListPaneSummaryLines | data-aggregateClause | Y / Y / Y | 302 / 0 |
| 40954 | 51831 / ListPaneSummaryUnits | data-aggregateClause | Y / Y / Y | 378 / 0 |
| 40955 | 51832 / ListPaneSummaryVolume | data-aggregateClause | Y / Y / Y | 306 / 0 |
| 40956 | 51833 / ListPaneDataGrid | data-dbtable | Y / Y / N | 58 / 0 |
| 40957 | 51833 / ListPaneDataGrid | multipleSelection | Y / Y / Y | 8 / 0 |
| 40958 | 51833 / ListPaneDataGrid | rowSelectors | Y / Y / Y | 8 / 0 |
| 40959 | 51834 / AssignTrailerEditor | data-rule-required | Y / Y / Y | 8 / 0 |
| 40960 | 51834 / AssignTrailerEditor | data-msg-required | Y / Y / Y | 18 / 1 |
| 40961 | 51837 / DetailPaneHeaderReceiptID | href | Y / Y / Y | 78 / 0 |
| 40962 | 51841 / ReceiptInsightWavedIndicatorTileLines | data-indicatorTileGoToInsight | Y / Y / Y | 266 / 0 |
| 40963 | 51842 / ReceiptInsightWavedIndicatorTileContainers | data-indicatorTileGoToInsight | Y / Y / Y | 294 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 18129 / click | 51782 / SaveSearchSaveButton | _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | Y / Y |
| 18130 / click | 51783 / SaveSearchCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18131 / click | 51785 / GadgetCalculationQuerySaveButton | _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | Y / Y |
| 18132 / click | 51786 / GadgetCalculationQueryCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |
| 18133 / click | 51787 / InsightMenuApply | _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Y / Y |
| 18134 / click | 51788 / InsightMenuActionClearFilters | _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Y / Y |
| 18135 / click | 51789 / InsightMenuActionStopSearch | _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Y / Y |
| 18136 / click | 51790 / InsightMenuActionSaveSearch | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18137 / click | 51791 / GadgetCalculationQueryMenuAction | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18138 / click | 51792 / InsightMenuActionToggleSummary | _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Y / Y |
| 18139 / click | 51793 / InsightMenuActionToggleGroupBy | _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Y / Y |
| 18140 / click | 51794 / InsightMenuActionCollapse | _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Y / Y |
| 18141 / click | 51795 / MenuExportToExcel | _webUi.insightListPaneActions.exportButtonClicked | Not populated | Y / Y |
| 18142 / click | 51796 / ListPaneMenuActionNew | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18143 / click | 51797 / ListPaneMenuActionEdit | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18144 / click | 51798 / ListPaneMenuActionView | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18145 / click | 51799 / ListPaneMenuActionDeleteReceipt | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18146 / click | 51800 / ListPaneMenuActionNewContainer | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18147 / click | 51801 / ListPaneMenuActionNewLine | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18148 / click | 51802 / ListPaneMenuActionAssignTrailer | _webUi.dialog.showModalDialogByEvent | Not populated | Y / Y |
| 18149 / click | 51803 / ListPaneMenuActionNewAppointment | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18150 / click | 51804 / ListPaneMenuActionEditAppointment | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18151 / click | 51805 / ListPaneMenuActionViewAppointment | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18152 / click | 51806 / ListPaneMenuActionDeleteAppointment | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18153 / click | 51807 / ListPaneMenuActionCancelClose | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18154 / click | 51808 / ListPaneMenuActionCheckin | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18155 / click | 51809 / ListPaneMenuActionCreatePreCheckInContainers | _webUi.insightListPaneActions.menuActionPerformPost | Not populated | Y / Y |
| 18156 / click | 51810 / ListPaneMenuActionCloseReceipt | _webUi.insightListPaneActions.menuActionPerformPostForSelection | Not populated | Y / Y |
| 18157 / click | 51811 / ListPaneMenuActionPrintPreviewDocs | _webUi.dialog.printPreviewSelection | Not populated | Y / Y |
| 18158 / click | 51812 / ListPaneMenuActionImmediateNeeds | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18159 / click | 51813 / ListPaneMenuActionPrintReceiptDocs | _webUi.insightListPaneActions.menuActionPerformGet | Not populated | Y / Y |
| 18160 / click | 51814 / ListPaneMenuActionPrintSelectedReceiptDocs | _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | Not populated | Y / Y |
| 18161 / click | 51815 / ListPaneMenuActionYardCheckInOut | _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | Y / Y |
| 18162 / iggridrequesterror | 51833 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridRequestError | Not populated | Y / Y |
| 18163 / iggriddatabound | 51833 / ListPaneDataGrid | _webUi.insightSearchPaneActions.insightGridDataBound | Not populated | Y / Y |
| 18164 / iggridselectionrowselectionchanged | 51833 / ListPaneDataGrid | _webUi.Grid.gridRowSelectionChanged | Not populated | Y / Y |
| 18165 / iggridselectionactiverowchanged | 51833 / ListPaneDataGrid | _webUi.Grid.gridActiveRowChanged | Not populated | Y / Y |
| 18166 / click | 51835 / AssignTrailerSaveButton | _webUi.insightListPaneActions.modalDialogPerformPostForSelection | Not populated | Y / Y |
| 18167 / click | 51836 / AssignTrailerCancelButton | _webUi.dialog.hideModalDialogByEvent | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 26691 / 18129 | GETServiceURL | Y / Y | 76 |
| 26692 / 18129 | queryParameter_Function_ScreenPartId | Y / Y | 98 |
| 26693 / 18129 | queryParameter_Function_UserName | Y / Y | 44 |
| 26694 / 18129 | queryParameter_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26695 / 18129 | POSTServiceURL | Y / Y | 74 |
| 26696 / 18129 | PostData_Function_ScreenPartId | Y / Y | 98 |
| 26697 / 18129 | PostData_Function_UserName | Y / Y | 44 |
| 26698 / 18129 | PostData_Input_SaveSearchNameEditor_SearchName | Y / Y | 10 |
| 26699 / 18129 | PostData_Function_SearchValue | Y / Y | 98 |
| 26700 / 18129 | Post_SuccessCallback | Y / Y | 114 |
| 26701 / 18129 | ModalDialogName | Y / Y | 42 |
| 26702 / 18130 | ModalDialogName | Y / Y | 42 |
| 26703 / 18131 | POSTServiceURL | Y / Y | 144 |
| 26704 / 18131 | Form_Id | Y / Y | 8 |
| 26705 / 18131 | Input_GadgetCalculationQueryNameEditor_Name | Y / Y | 10 |
| 26706 / 18131 | PostData_Function_SearchValue | Y / Y | 98 |
| 26707 / 18131 | Post_SuccessCallback | Y / Y | 114 |
| 26708 / 18131 | ModalDialogName | Y / Y | 56 |
| 26709 / 18132 | ModalDialogName | Y / Y | 56 |
| 26710 / 18136 | ModalDialogName | Y / Y | 42 |
| 26711 / 18137 | ModalDialogName | Y / Y | 56 |
| 26712 / 18142 | URL | Y / Y | 32 |
| 26713 / 18143 | URL | Y / Y | 144 |
| 26714 / 18144 | URL | Y / Y | 144 |
| 26715 / 18145 | ConfirmationMessageCode | Y / Y | 38 |
| 26716 / 18145 | POSTServiceURL | Y / Y | 104 |
| 26717 / 18145 | PostData_Grid_ListPaneDataGrid_InternalReceiptNum | Y / Y | 40 |
| 26718 / 18145 | Post_SuccessCallback | Y / Y | 140 |
| 26719 / 18146 | queryParameter_Grid_ListPaneDataGrid_InternalReceiptNum | Y / Y | 40 |
| 26720 / 18146 | URL | Y / Y | 136 |
| 26721 / 18147 | queryParameter_Grid_ListPaneDataGrid_InternalReceiptNum | Y / Y | 40 |
| 26722 / 18147 | URL | Y / Y | 118 |
| 26723 / 18148 | ModalDialogName | Y / Y | 48 |
| 26724 / 18148 | PrePopulateModalData_AssignTrailerEditor | Y / Y | 20 |
| 26725 / 18149 | URL | Y / Y | 190 |
| 26726 / 18150 | URL | Y / Y | 190 |
| 26727 / 18151 | URL | Y / Y | 190 |
| 26728 / 18152 | ConfirmationMessageCode | Y / Y | 46 |
| 26729 / 18152 | POSTServiceURL | Y / Y | 112 |
| 26730 / 18152 | PostData_Grid_ListPaneDataGrid_InternalReceiptNum | Y / Y | 40 |
| 26731 / 18152 | Post_SuccessCallback | Y / Y | 140 |
| 26732 / 18153 | ConfirmationMessageCode | Y / Y | 36 |
| 26733 / 18153 | POSTServiceURL | Y / Y | 120 |
| 26734 / 18153 | PostData_Grid_ListPaneDataGrid_InternalReceiptNum | Y / Y | 40 |
| 26735 / 18153 | Post_SuccessCallback | Y / Y | 140 |
| 26736 / 18153 | Post_ErrorCallback | Y / Y | 120 |
| 26737 / 18154 | URL | Y / Y | 254 |
| 26738 / 18155 | ConfirmationMessageCode | Y / Y | 40 |
| 26739 / 18155 | POSTServiceURL | Y / Y | 76 |
| 26740 / 18155 | PostData_Grid_ListPaneDataGrid_internalReceiptNum | Y / Y | 40 |
| 26741 / 18155 | PostData_returnContainersCreated | Y / Y | 8 |
| 26742 / 18155 | Post_SuccessCallback | Y / Y | 140 |
| 26743 / 18155 | Post_ErrorCallback | Y / Y | 120 |
| 26744 / 18156 | POSTServiceURL | Y / Y | 102 |
| 26745 / 18156 | PostData_Grid_ListPaneDataGrid_InternalReceiptNum | Y / Y | 40 |
| 26746 / 18156 | Post_SuccessCallback | Y / Y | 140 |
| 26747 / 18156 | Post_ErrorCallback | Y / Y | 120 |
| 26748 / 18157 | queryParameter_Grid_ListPaneDataGrid_internalNum | Y / Y | 40 |
| 26749 / 18157 | printProcess | Y / Y | 6 |
| 26750 / 18158 | URL | Y / Y | 156 |
| 26751 / 18159 | GETServiceURL | Y / Y | 54 |
| 26752 / 18159 | queryParameter_Grid_ListPaneDataGrid_internalNum | Y / Y | 40 |
| 26753 / 18159 | queryParameter_printProcess | Y / Y | 6 |
| 26754 / 18160 | URL | Y / Y | 202 |
| 26755 / 18161 | URL | Y / Y | 204 |
| 26756 / 18165 | POSTServiceURL | Y / Y | 72 |
| 26757 / 18165 | PostData_internalReceiptNum | Y / Y | 40 |
| 26758 / 18165 | PostData_storedProcedure | Y / Y | 52 |
| 26759 / 18165 | EnableAction_ListPaneMenuActionView | Y / Y | 38 |
| 26760 / 18165 | EnableAction_ListPaneMenuActionEdit | Y / Y | 38 |
| 26761 / 18165 | EnableAction_ListPaneMenuActionNewLine | Y / Y | 84 |
| 26762 / 18165 | EnableAction_ListPaneMenuActionCloseReceipt | Y / Y | 38 |
| 26763 / 18165 | EnableAction_ListPaneMenuActionCancelClose | Y / Y | 38 |
| 26764 / 18165 | EnableAction_ListPaneMenuActionDeleteReceipt | Y / Y | 78 |
| 26765 / 18165 | EnableAction_ListPaneMenuActionPrintSelectedReceiptDocs | Y / Y | 38 |
| 26766 / 18165 | EnableAction_ListPaneMenuActionPrintReceiptDocs | Y / Y | 38 |
| 26767 / 18165 | EnableAction_ListPaneMenuActionPrintPreviewDocs | Y / Y | 38 |
| 26768 / 18165 | EnableAction_ListPaneMenuActionCreatePreCheckInContainers | Y / Y | 38 |
| 26769 / 18165 | EnableAction_ListPaneMenuActionAssignTrailer | Y / Y | 38 |
| 26770 / 18165 | EnableAction_ListPaneMenuActionNewContainer | Y / Y | 38 |
| 26771 / 18165 | EnableAction_ListPaneMenuActionImmediateNeeds | Y / Y | 62 |
| 26772 / 18165 | EnableAction_ListPaneMenuActionNewAppointment | Y / Y | 136 |
| 26773 / 18165 | EnableAction_ListPaneMenuActionEditAppointment | Y / Y | 92 |
| 26774 / 18165 | EnableAction_ListPaneMenuActionViewAppointment | Y / Y | 92 |
| 26775 / 18165 | EnableAction_ListPaneMenuActionDeleteAppointment | Y / Y | 46 |
| 26776 / 18165 | EnableAction_ListPaneMenuActionYardCheckInOut | Y / Y | 38 |
| 26777 / 18165 | EnableAction_ListPaneMenuActionCheckin | Y / Y | 84 |
| 26778 / 18166 | POSTServiceURL | Y / Y | 128 |
| 26779 / 18166 | PostData_Grid_ListPaneDataGrid_InternalReceiptNum | Y / Y | 40 |
| 26780 / 18166 | queryParameter_Input_AssignTrailerEditor_TrailerId | Y / Y | 10 |
| 26781 / 18166 | Post_SuccessCallback | Y / Y | 140 |
| 26782 / 18166 | Post_ErrorCallback | Y / Y | 120 |
| 26783 / 18166 | ModalDialogName | Y / Y | 48 |
| 26784 / 18167 | ModalDialogName | Y / Y | 48 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 82 selected candidate rows for this Screen: **81 accepted tokens** and **1 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 40884 | 51790 / Not applicable | data-securityCheckpoint | checkpoint | 23 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40885 | 51791 / Not applicable | data-securityCheckpoint | checkpoint | 29 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40886 | 51796 / Not applicable | data-formId | form_id | 3034 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40887 | 51796 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40888 | 51797 / Not applicable | data-formId | form_id | 3034 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40889 | 51797 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40890 | 51798 / Not applicable | data-formId | form_id | 3034 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40892 | 51799 / Not applicable | data-formId | form_id | 3034 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40894 | 51799 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40895 | 51800 / Not applicable | data-formId | form_id | 3005 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40896 | 51800 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40898 | 51801 / Not applicable | data-formId | form_id | 3035 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40899 | 51801 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40901 | 51802 / Not applicable | data-securityCheckpoint | checkpoint | 27 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40903 | 51803 / Not applicable | data-formId | form_id | 2765 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40904 | 51803 / Not applicable | data-securityCheckpoint | checkpoint | 2 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40906 | 51804 / Not applicable | data-formId | form_id | 2765 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40907 | 51804 / Not applicable | data-securityCheckpoint | checkpoint | 3 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40909 | 51805 / Not applicable | data-formId | form_id | 2765 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40910 | 51806 / Not applicable | data-formId | form_id | 166 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40911 | 51806 / Not applicable | data-securityCheckpoint | checkpoint | 5 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40914 | 51807 / Not applicable | data-securityCheckpoint | checkpoint | 25 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40916 | 51808 / Not applicable | data-securityCheckpoint | checkpoint | 35 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40918 | 51809 / Not applicable | data-securityCheckpoint | checkpoint | 26 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40919 | 51810 / Not applicable | data-securityCheckpoint | checkpoint | 24 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40921 | 51811 / Not applicable | data-securityCheckpoint | checkpoint | 34 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40922 | 51812 / Not applicable | data-securityCheckpoint | checkpoint | 28 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40923 | 51813 / Not applicable | data-securityCheckpoint | checkpoint | 21 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40924 | 51814 / Not applicable | data-securityCheckpoint | checkpoint | 22 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40925 | 51815 / Not applicable | data-formId | form_id | 3052 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40926 | 51815 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40927 | 51816 / Not applicable | data-dbcolumn | database_identifier | RECEIPT_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40929 | 51817 / Not applicable | data-dbcolumn | database_identifier | RECEIPT_ID_TYPE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40930 | 51818 / Not applicable | data-dbcolumn | database_identifier | ITEM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40932 | 51819 / Not applicable | data-dbcolumn | database_identifier | COMPANY | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40933 | 51820 / Not applicable | data-dbcolumn | database_identifier | LICENSE_PLATE_ID | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40935 | 51821 / Not applicable | data-dbcolumn | database_identifier | RECEIVING_DOCK | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40937 | 51822 / Not applicable | data-dbcolumn | database_identifier | SOURCE_NAME | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40939 | 51823 / Not applicable | data-dbcolumn | database_identifier | RECEIPT_HEADER_SHIP_FROM | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40941 | 51824 / Not applicable | data-dbcolumn | database_identifier | RECEIPT_HEADER_RECEIPT_DATE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40943 | 51825 / Not applicable | data-dbcolumn | database_identifier | Internal_Receipt_Num | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40946 | 51826 / Not applicable | data-dbcolumn | database_identifier | WAREHOUSE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40947 | 51827 / Not applicable | data-dbcolumn | database_identifier | CLOSE_DATE | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 40956 | 51833 / Not applicable | data-dbtable | database_identifier | METADATA_INSIGHT_RECEIPT_VIEW | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26691 | 51782 / 18129 | GETServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26695 | 51782 / 18129 | POSTServiceURL | relative_api_path | /general/scaleapi/ScreenPartSearchApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26700 | 51782 / 18129 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveSearchSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26703 | 51785 / 18131 | POSTServiceURL | relative_api_path | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26707 | 51785 / 18131 | Post_SuccessCallback | callback_identifier | _webUi.insightSearchPaneActions.saveGadgetSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26715 | 51799 / 18145 | ConfirmationMessageCode | resource_code | MSG_DELETERECEIPT01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26716 | 51799 / 18145 | POSTServiceURL | relative_api_path | /inbound/scaleapi/ReceiptHeadersApi/Deleted-Receipts | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26717 | 51799 / 18145 | PostData_Grid_ListPaneDataGrid_InternalReceiptNum | grid_field_identifier | INTERNAL_RECEIPT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26718 | 51799 / 18145 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26719 | 51800 / 18146 | queryParameter_Grid_ListPaneDataGrid_InternalReceiptNum | grid_field_identifier | INTERNAL_RECEIPT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26721 | 51801 / 18147 | queryParameter_Grid_ListPaneDataGrid_InternalReceiptNum | grid_field_identifier | INTERNAL_RECEIPT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26728 | 51806 / 18152 | ConfirmationMessageCode | resource_code | MSG_DELETEAPPOINTMENT01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26729 | 51806 / 18152 | POSTServiceURL | relative_api_path | /inbound/scaleapi/ReceiptHeadersApi/Deleted-Appointments | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26730 | 51806 / 18152 | PostData_Grid_ListPaneDataGrid_InternalReceiptNum | grid_field_identifier | INTERNAL_RECEIPT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26731 | 51806 / 18152 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26732 | 51807 / 18153 | ConfirmationMessageCode | resource_code | MSG_CANCELCLOSEVER | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26733 | 51807 / 18153 | POSTServiceURL | relative_api_path | /inbound/scaleapi/ReceiptHeadersApi/cancelled-ClosedReceipts | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26734 | 51807 / 18153 | PostData_Grid_ListPaneDataGrid_InternalReceiptNum | grid_field_identifier | INTERNAL_RECEIPT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26735 | 51807 / 18153 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26736 | 51807 / 18153 | Post_ErrorCallback | callback_identifier | _webUi.insightListPaneActions.postMethodErrorCallbackHandler | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26738 | 51809 / 18155 | ConfirmationMessageCode | resource_code | MSG_PRECHECKINCONT01 | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26740 | 51809 / 18155 | PostData_Grid_ListPaneDataGrid_internalReceiptNum | grid_field_identifier | INTERNAL_RECEIPT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26742 | 51809 / 18155 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26743 | 51809 / 18155 | Post_ErrorCallback | callback_identifier | _webUi.insightListPaneActions.postMethodErrorCallbackHandler | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26744 | 51810 / 18156 | POSTServiceURL | relative_api_path | /inbound/scaleapi/ReceiptHeadersApi/Closed-Receipts | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26745 | 51810 / 18156 | PostData_Grid_ListPaneDataGrid_InternalReceiptNum | grid_field_identifier | INTERNAL_RECEIPT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26746 | 51810 / 18156 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26747 | 51810 / 18156 | Post_ErrorCallback | callback_identifier | _webUi.insightListPaneActions.postMethodErrorCallbackHandler | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26748 | 51811 / 18157 | queryParameter_Grid_ListPaneDataGrid_internalNum | grid_field_identifier | INTERNAL_RECEIPT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26751 | 51813 / 18159 | GETServiceURL | relative_api_path | /general/scaleapi/PrintApi? | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26752 | 51813 / 18159 | queryParameter_Grid_ListPaneDataGrid_internalNum | grid_field_identifier | INTERNAL_RECEIPT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26756 | 51833 / 18165 | POSTServiceURL | relative_api_path | /general/scaleapi/GenericDataBindApi | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26758 | 51833 / 18165 | PostData_storedProcedure | stored_procedure_identifier | RCPT_InsightDetailPaneData | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26778 | 51835 / 18166 | POSTServiceURL | relative_api_path | /inbound/scaleapi/ReceiptHeadersApi/assignedToTrailerId-Receipts | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26779 | 51835 / 18166 | PostData_Grid_ListPaneDataGrid_InternalReceiptNum | grid_field_identifier | INTERNAL_RECEIPT_NUM | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26781 | 51835 / 18166 | Post_SuccessCallback | callback_identifier | _webUi.insightListPaneActions.refreshGridAndCallDefaultSuccessCallback | Y / Y |
| SCREEN_CONTROL_EVENT_PARAMETERS / 26782 | 51835 / 18166 | Post_ErrorCallback | callback_identifier | _webUi.insightListPaneActions.postMethodErrorCallbackHandler | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.
