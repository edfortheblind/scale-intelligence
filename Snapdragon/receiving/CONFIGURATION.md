# Receiving configuration map — SD-11

This map explains the retained configuration behind nine visible Receiving destinations and their directly declared context forms. It adds no live runtime observation, database refresh, operational action or acceptance.

The fixed scope is **9 menu roots**, **31 explicit data-formId references**, **9 unique target forms**, **17 active screen implementations**, and **18 form identities**. Eight targets have active screen metadata; **form 166 has none**. Expansion stops after this first hop. Other target values remain hash-only and may identify additional branches; they are not silently counted as resolved.

[The machine-readable map](configuration-map.json) preserves every included part, group, control, grid column, attribute/event/parameter identity, safe selected value, parent relationship and six source-file hashes. Null safe values mean omitted or not selected, never an empty runtime requirement.

## Implementation inventory

| Role | Form / screen | Title | Controls | Criteria controls | Action controls | Events / parameters |
|---|---|---|---:|---:|---:|---|
| receiving_menu_root | 4069 / 1512 | Appointment Calendar | 2 | 0 | 1 | 1 / 1 |
| receiving_menu_root | 2796 / 1776 | Purchase Order Insight | 47 | 10 | 25 | 29 / 63 |
| receiving_menu_root | 2797 / 1777 | Purchase Order Line Insight | 38 | 9 | 17 | 21 / 37 |
| receiving_menu_root | 2791 / 1778 | Putaway Group Insight | 33 | 7 | 18 | 22 / 45 |
| receiving_menu_root | 2779 / 1782 | Receipt Container Insight | 51 | 12 | 24 | 28 / 63 |
| receiving_menu_root | 2777 / 1781 | Receipt Insight | 62 | 13 | 35 | 39 / 94 |
| receiving_menu_root | 2780 / 1783 | Receipt Line Insight | 40 | 10 | 17 | 21 / 35 |
| receiving_menu_root | 4106 / 1737 | Receipt Monitoring | 11 | 0 | 2 | 2 / 1 |
| receiving_menu_root | 4038 / 1541 | Receipt Workbench | 9 | 0 | 6 | 3 / 1 |
| direct_linked_context | 2765 / 1539 | Receiving Appointment Schedule | 26 | 0 | 2 | 6 / 2 |
| direct_linked_context | 3005 / 1666 | Receipt Container | 59 | 0 | 2 | 5 / 3 |
| direct_linked_context | 3034 / 1428 | Receipt | 83 | 0 | 3 | 12 / 8 |
| direct_linked_context | 3035 / 1427 | Receipt Line | 82 | 0 | 2 | 14 / 7 |
| direct_linked_context | 3052 / 1562 | Yard Check in & Out | 16 | 0 | 3 | 4 / 2 |
| direct_linked_context | 4049 / 1423 | Purchase Order | 57 | 0 | 2 | 5 / 4 |
| direct_linked_context | 4051 / 1665 | Purchase Order Line | 56 | 0 | 2 | 7 / 4 |
| direct_linked_context | 4052 / 1802 | Receipt From Purchase Order | 25 | 0 | 3 | 6 / 1 |

Criteria counts index groups named Criteria. Action-control counts index recorded control types 100/150; they do not exclude the event bindings of other controls, which remain in the complete map. Numeric enum codes are preserved without inventing a runtime meaning.

## Direct form associations

| Source form | Control ID / name | Attribute ID | Target form | Active target screen |
|---|---|---|---|---|
| 4038 | 42645 / ReceiptListPaneMenuActionNewLine | 32832 | 3035 | 1427 |
| 4038 | 42651 / RECEIPTActionCreate | 32840 | 3034 | 1428 |
| 4069 | 42125 / ListPaneMenuActionNew | 32437 | 2765 | 1539 |
| 2796 | 51615 / ListPaneMenuActionNew | 40727 | 4049 | 1423 |
| 2796 | 51616 / ListPaneMenuActionCopy | 40729 | 4049 | 1423 |
| 2796 | 51617 / ListPaneMenuActionEdit | 40731 | 4049 | 1423 |
| 2796 | 51618 / ListPaneMenuActionView | 40733 | 4049 | 1423 |
| 2796 | 51619 / ListPaneMenuActionDelete | 40734 | 4049 | 1423 |
| 2796 | 51620 / ListPaneMenuActionNewLine | 40737 | 4051 | 1665 |
| 2796 | 51626 / ListPaneMenuActionReceiptFromPO | 40745 | 4052 | 1802 |
| 2797 | 51662 / ListPaneMenuActionCopy | 40776 | 4051 | 1665 |
| 2797 | 51663 / ListPaneMenuActionEdit | 40778 | 4051 | 1665 |
| 2797 | 51664 / ListPaneMenuActionView | 40780 | 4051 | 1665 |
| 2797 | 51665 / ListPaneMenuActionDelete | 40781 | 4051 | 1665 |
| 2777 | 51796 / ListPaneMenuActionNew | 40886 | 3034 | 1428 |
| 2777 | 51797 / ListPaneMenuActionEdit | 40888 | 3034 | 1428 |
| 2777 | 51798 / ListPaneMenuActionView | 40890 | 3034 | 1428 |
| 2777 | 51799 / ListPaneMenuActionDeleteReceipt | 40892 | 3034 | 1428 |
| 2777 | 51800 / ListPaneMenuActionNewContainer | 40895 | 3005 | 1666 |
| 2777 | 51801 / ListPaneMenuActionNewLine | 40898 | 3035 | 1427 |
| 2777 | 51803 / ListPaneMenuActionNewAppointment | 40903 | 2765 | 1539 |
| 2777 | 51804 / ListPaneMenuActionEditAppointment | 40906 | 2765 | 1539 |
| 2777 | 51805 / ListPaneMenuActionViewAppointment | 40909 | 2765 | 1539 |
| 2777 | 51806 / ListPaneMenuActionDeleteAppointment | 40910 | 166 | Unresolved: no active implementation |
| 2777 | 51815 / ListPaneMenuActionYardCheckInOut | 40925 | 3052 | 1562 |
| 2779 | 51858 / ListPaneMenuActionEdit | 40968 | 3005 | 1666 |
| 2779 | 51859 / ListPaneMenuActionDeleteContainers | 40972 | 3005 | 1666 |
| 2779 | 51868 / ListPaneMenuActionView | 40985 | 3005 | 1666 |
| 2780 | 51909 / ListPaneMenuActionEdit | 41024 | 3035 | 1427 |
| 2780 | 51910 / ListPaneMenuActionDeleteReceiptDetails | 41027 | 3035 | 1427 |
| 2780 | 51912 / ListPaneMenuActionView | 41031 | 3035 | 1427 |

Form 166 is `UI_RECVAPPTSCHEDULE`; form 2765 is a separate captured identity. An apparent functional relationship does not authorize replacing one ID with the other. A data-formId association is a configuration dependency, not proof that the user traversed the destination or supplied valid context.

## Appointment Calendar — form 4069, screen 1512

Configured route: `/scale/trans/apptschedule`. Form table/data-source name: `MetaTrans_APPTSCHEDULE`. These names are references; separate backend evidence must resolve what they mean.

Configured structure:
- Part 3474 `CrudDataPane`: group 14501 `ApptScheduleMenuPanel` (0 controls); group 14502 `ApptScheduleActionPanel` (1 controls); group 14500 `ApptScheduleMenu` (0 controls); group 14504 `ApptScheduleCalendarPanel` (1 controls); group 14503 `ApptScheduleCalendarGroup` (0 controls).

Configured action-control bindings:

| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |
|---|---|---|---|---|
| 42125 / New | 13988 click → _webUi.apptScheduleTransaction.newAppointmentClicked | 2 | form=2765 (attribute 32437) | Not populated |

There are 0 incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.

Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact.

## Purchase Order Insight — form 2796, screen 1776

Configured route: `/scale/insights/2796`. Form table/data-source name: `METADATA_INSIGHT_PURCHASE_ORDER_HEADER_VIEW`. These names are references; separate backend evidence must resolve what they mean.

Configured structure:
- Part 4373 `SaveSearchModalDialog`: group 18037 `SaveSearchModalDialogForm` (0 controls); group 18038 `SaveSearchModalDialogHeader` (0 controls); group 18039 `SaveSearchModalDialogBody` (1 controls); group 18040 `SaveSearchModalDialogFooter` (2 controls).
- Part 4374 `GadgetCalculationQueryDialog`: group 18041 `GadgetCalculationQueryDialogForm` (0 controls); group 18042 `GadgetCalculationQueryDialogHeader` (0 controls); group 18043 `GadgetCalculationQueryDialogBody` (1 controls); group 18044 `GadgetCalculationQueryDialogFooter` (2 controls).
- Part 4375 `InsightMenuPane`: group 18045 `InsightMenu` (0 controls); group 18046 `InsightMenuPanel` (4 controls); group 18047 `InsightMenuFavoritesDropdown` (0 controls); group 18048 `InsightListPaneMenuPanel` (4 controls); group 18049 `MenuExportToExcelPanel` (1 controls); group 18050 `InsightMenuActionsDropdown` (12 controls).
- Part 4376 `SearchPane`: group 18051 `SearchPaneCriteria` (0 controls); group 18052 `SearchPaneBasicCriteria` (9 controls); group 18053 `SearchPaneAdvancedCriteria` (1 controls).
- Part 4377 `ListPane`: group 18054 `ListPaneSummary` (4 controls); group 18055 `ListPanePanel` (1 controls).
- Part 4378 `DetailPane`: group 18056 `DetailPaneHeaderPanel1` (3 controls); group 18057 `indicatorpane` (2 controls).

Configured criteria:

| Control | Label / name | Database field tokens | Type / data-source type |
|---|---|---|---|
| 51627 | Purchase Order | POHEADERPURCHASEORDERID | 10 / None |
| 51628 | Receipt ID | RECEIPT_ID | 10 / None |
| 51629 | Source Name | SOURCE_NAME | 10 / None |
| 51630 | Ship From | SHIP_FROM | 10 / None |
| 51631 | Item | Item | 10 / None |
| 51632 | Company | COMPANY | 280 / 10 |
| 51633 | Warehouse | Warehouse | 280 / 10 |
| 51634 | Created Date Time | CREATED_DATE_TIME | 190 / None |
| 51635 | Include Closed Purchase Orders | POHEADERSTATUS | 130 / None |
| 51636 | SearchPaneAdvCrit | Not populated | 70 / 40 |

Configured action-control bindings:

| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |
|---|---|---|---|---|
| 51601 / Save | 18021 click → _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | queryParameter_Function_ScreenPartId=[value omitted] (parameter 26487); queryParameter_Function_UserName=[value omitted] (parameter 26488); queryParameter_Input_SaveSearchNameEditor_SearchName=[value omitted] (parameter 26489); PostData_Function_ScreenPartId=[value omitted] (parameter 26491); PostData_Function_UserName=[value omitted] (parameter 26492); PostData_Input_SaveSearchNameEditor_SearchName=[value omitted] (parameter 26493); PostData_Function_SearchValue=[value omitted] (parameter 26494) | /general/scaleapi/ScreenPartSearchApi? (parameter 26486); /general/scaleapi/ScreenPartSearchApi (parameter 26490) |
| 51602 / Cancel | 18022 click → _webUi.dialog.hideModalDialogByEvent | Not populated | Not populated | Not populated |
| 51604 / Save | 18023 click → _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | PostData_Function_SearchValue=[value omitted] (parameter 26501) | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved (parameter 26498) |
| 51605 / Cancel | 18024 click → _webUi.dialog.hideModalDialogByEvent | Not populated | Not populated | Not populated |
| 51606 / InsightMenuApply | 18025 click → _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Not populated | Not populated |
| 51607 / InsightMenuActionClearFilters | 18026 click → _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Not populated | Not populated |
| 51608 / InsightMenuActionStopSearch | 18027 click → _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Not populated | Not populated |
| 51609 / InsightMenuActionSaveSearch | 18028 click → _webUi.dialog.showModalDialogByEvent | 23 | Not populated | Not populated |
| 51610 / GadgetCalculationQueryMenuAction | 18029 click → _webUi.dialog.showModalDialogByEvent | 26 | Not populated | Not populated |
| 51611 / Σ | 18030 click → _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Not populated | Not populated |
| 51612 / InsightMenuActionToggleGroupBy | 18031 click → _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Not populated | Not populated |
| 51613 / InsightMenuActionCollapse | 18032 click → _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Not populated | Not populated |
| 51614 / MenuExportToExcel | 18033 click → _webUi.insightListPaneActions.exportButtonClicked | Not populated | Not populated | Not populated |
| 51615 / New | 18034 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 2 | form=4049 (attribute 40727) | Not populated |
| 51616 / Copy | 18035 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 4 | form=4049 (attribute 40729) | Not populated |
| 51617 / Edit | 18036 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 3 | form=4049 (attribute 40731) | Not populated |
| 51618 / View | 18037 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | form=4049 (attribute 40733) | Not populated |
| 51619 / Delete | 18038 click → _webUi.insightListPaneActions.menuActionPerformPost | 5 | form=4049 (attribute 40734); PostData_Grid_ListPaneDataGrid_objectId=ObjectId (parameter 26513); PostData_Grid_ListPaneDataGrid_purchaseOrderId=PurchaseOrderId (parameter 26514) | /inbound/scaleapi/PurchaseOrderApi/PurchaseOrders-Deleted? (parameter 26512) |
| 51620 / New Line | 18039 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 2 | form=4051 (attribute 40737); queryParameter_Grid_ListPaneDataGrid_ObjectId=ObjectId (parameter 26516) | Not populated |
| 51621 / Close | 18040 click → _webUi.insightListPaneActions.menuActionPerformPost | 21 | PostData_Grid_ListPaneDataGrid_objectId=ObjectId (parameter 26520); PostData_Grid_ListPaneDataGrid_purchaseOrderId=PurchaseOrderId (parameter 26521) | /inbound/scaleapi/PurchaseOrderApi/PurchaseOrders-Closed? (parameter 26519) |
| 51622 / Cancel Close | 18041 click → _webUi.insightListPaneActions.menuActionPerformPost | 22 | PostData_Grid_ListPaneDataGrid_objectId=ObjectId (parameter 26525); PostData_Grid_ListPaneDataGrid_purchaseOrderId=PurchaseOrderId (parameter 26526) | /inbound/scaleapi/PurchaseOrderApi/ClosedPurchaseOrders-Cancelled? (parameter 26524) |
| 51623 / Print Preview | 18042 click → _webUi.dialog.printPreviewSelection | 34 | Not populated | Not populated |
| 51624 / Print Default Docs | 18043 click → _webUi.insightListPaneActions.menuActionPerformGet | 24 | Not populated | /general/scaleapi/PrintApi? (parameter 26530) |
| 51625 / Print Selected Docs | 18044 click → _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | 25 | Not populated | Not populated |
| 51626 / Receipt From PO | 18045 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 1 | form=4052 (attribute 40745) | Not populated |

There are 11 incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.

Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact.

## Purchase Order Line Insight — form 2797, screen 1777

Configured route: `/scale/insights/2797`. Form table/data-source name: `METADATA_INSIGHT_PURCHASE_ORDER_DETAIL_VIEW`. These names are references; separate backend evidence must resolve what they mean.

Configured structure:
- Part 4379 `SaveSearchModalDialog`: group 18058 `SaveSearchModalDialogForm` (0 controls); group 18059 `SaveSearchModalDialogHeader` (0 controls); group 18060 `SaveSearchModalDialogBody` (1 controls); group 18061 `SaveSearchModalDialogFooter` (2 controls).
- Part 4380 `GadgetCalculationQueryDialog`: group 18062 `GadgetCalculationQueryDialogForm` (0 controls); group 18063 `GadgetCalculationQueryDialogHeader` (0 controls); group 18064 `GadgetCalculationQueryDialogBody` (1 controls); group 18065 `GadgetCalculationQueryDialogFooter` (2 controls).
- Part 4381 `InsightMenuPane`: group 18066 `InsightMenu` (0 controls); group 18067 `InsightMenuPanel` (4 controls); group 18068 `InsightMenuFavoritesDropdown` (0 controls); group 18069 `InsightListPaneMenuPanel` (4 controls); group 18070 `MenuExportToExcelPanel` (1 controls); group 18071 `InsightMenuActionsDropdown` (4 controls).
- Part 4382 `SearchPane`: group 18072 `SearchPaneCriteria` (0 controls); group 18073 `SearchPaneBasicCriteria` (8 controls); group 18074 `SearchPaneAdvancedCriteria` (1 controls).
- Part 4383 `ListPane`: group 18075 `ListPaneSummary` (4 controls); group 18076 `ListPanePanel` (1 controls).
- Part 4384 `DetailPane`: group 18077 `DetailPaneHeaderPanel1` (5 controls).

Configured criteria:

| Control | Label / name | Database field tokens | Type / data-source type |
|---|---|---|---|
| 51666 | Purchase Order | PODETAILPURCHASEORDERID | 10 / None |
| 51667 | Receipt ID | RECEIPT_ID | 10 / None |
| 51668 | Item | Item | 10 / None |
| 51669 | Purchase Order Line Number | PODETAILLINENUMBER | 90 / None |
| 51670 | Internal Order Line Number | PODETAILOBJECTID | 90 / None |
| 51671 | Company | COMPANY | 280 / 10 |
| 51672 | Warehouse | Warehouse | 280 / 10 |
| 51673 | Include Closed Purchase Orders | POHEADERSTATUS | 130 / None |
| 51674 | SearchPaneAdvCrit | Not populated | 70 / 40 |

Configured action-control bindings:

| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |
|---|---|---|---|---|
| 51648 / Save | 18050 click → _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | queryParameter_Function_ScreenPartId=[value omitted] (parameter 26550); queryParameter_Function_UserName=[value omitted] (parameter 26551); queryParameter_Input_SaveSearchNameEditor_SearchName=[value omitted] (parameter 26552); PostData_Function_ScreenPartId=[value omitted] (parameter 26554); PostData_Function_UserName=[value omitted] (parameter 26555); PostData_Input_SaveSearchNameEditor_SearchName=[value omitted] (parameter 26556); PostData_Function_SearchValue=[value omitted] (parameter 26557) | /general/scaleapi/ScreenPartSearchApi? (parameter 26549); /general/scaleapi/ScreenPartSearchApi (parameter 26553) |
| 51649 / Cancel | 18051 click → _webUi.dialog.hideModalDialogByEvent | Not populated | Not populated | Not populated |
| 51651 / Save | 18052 click → _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | PostData_Function_SearchValue=[value omitted] (parameter 26564) | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved (parameter 26561) |
| 51652 / Cancel | 18053 click → _webUi.dialog.hideModalDialogByEvent | Not populated | Not populated | Not populated |
| 51653 / InsightMenuApply | 18054 click → _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Not populated | Not populated |
| 51654 / InsightMenuActionClearFilters | 18055 click → _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Not populated | Not populated |
| 51655 / InsightMenuActionStopSearch | 18056 click → _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Not populated | Not populated |
| 51656 / InsightMenuActionSaveSearch | 18057 click → _webUi.dialog.showModalDialogByEvent | 23 | Not populated | Not populated |
| 51657 / GadgetCalculationQueryMenuAction | 18058 click → _webUi.dialog.showModalDialogByEvent | 24 | Not populated | Not populated |
| 51658 / Σ | 18059 click → _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Not populated | Not populated |
| 51659 / InsightMenuActionToggleGroupBy | 18060 click → _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Not populated | Not populated |
| 51660 / InsightMenuActionCollapse | 18061 click → _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Not populated | Not populated |
| 51661 / MenuExportToExcel | 18062 click → _webUi.insightListPaneActions.exportButtonClicked | Not populated | Not populated | Not populated |
| 51662 / Copy | 18063 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 4 | form=4051 (attribute 40776) | Not populated |
| 51663 / Edit | 18064 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 3 | form=4051 (attribute 40778) | Not populated |
| 51664 / View | 18065 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | form=4051 (attribute 40780) | Not populated |
| 51665 / Delete | 18066 click → _webUi.insightListPaneActions.menuActionPerformPost | 5 | form=4051 (attribute 40781); PostData_Grid_ListPaneDataGrid_ObjectId=ObjectId (parameter 26575); PostData_Grid_ListPaneDataGrid_PurchaseOrderId=PurchaseOrderId (parameter 26576); PostData_Grid_ListPaneDataGrid_LineNumber=LineNumber (parameter 26577) | /inbound/scaleapi/PurchaseOrderDetailsApi/PurchaseOrderLines-Deleted? (parameter 26574) |

There are 4 incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.

Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact.

## Putaway Group Insight — form 2791, screen 1778

Configured route: `/scale/insights/2791`. Form table/data-source name: `METADATA_INSIGHT_PUTAWAYGROUP_VIEW`. These names are references; separate backend evidence must resolve what they mean.

Configured structure:
- Part 4385 `SaveSearchModalDialog`: group 18078 `SaveSearchModalDialogForm` (0 controls); group 18079 `SaveSearchModalDialogHeader` (0 controls); group 18080 `SaveSearchModalDialogBody` (1 controls); group 18081 `SaveSearchModalDialogFooter` (2 controls).
- Part 4386 `GadgetCalculationQueryDialog`: group 18082 `GadgetCalculationQueryDialogForm` (0 controls); group 18083 `GadgetCalculationQueryDialogHeader` (0 controls); group 18084 `GadgetCalculationQueryDialogBody` (1 controls); group 18085 `GadgetCalculationQueryDialogFooter` (2 controls).
- Part 4387 `InsightMenuPane`: group 18086 `InsightMenu` (0 controls); group 18087 `InsightMenuPanel` (4 controls); group 18088 `InsightMenuFavoritesDropdown` (0 controls); group 18089 `InsightListPaneMenuPanel` (4 controls); group 18090 `MenuExportToExcelPanel` (1 controls); group 18091 `InsightMenuActionsDropdown` (3 controls).
- Part 4388 `SearchPane`: group 18092 `SearchPaneCriteria` (0 controls); group 18093 `SearchPaneBasicCriteria` (6 controls); group 18094 `SearchPaneAdvancedCriteria` (1 controls).
- Part 4389 `ListPane`: group 18095 `ListPaneSummary` (1 controls); group 18096 `ListPanePanel` (1 controls).
- Part 4390 `RenamePutawayGroupModalDialog`: group 18097 `RenamePutawayGroupModalDialogForm` (0 controls); group 18098 `RenamePutawayGroupModalDialogHeader` (0 controls); group 18099 `RenamePutawayGroupModalDialogBody` (1 controls); group 18100 `RenamePutawayGroupModalDialogFooter` (2 controls).
- Part 4391 `DetailPane`: group 18101 `DetailPaneHeaderPanel1` (2 controls); group 18102 `indicatorpane` (1 controls).

Configured criteria:

| Control | Label / name | Database field tokens | Type / data-source type |
|---|---|---|---|
| 51703 | Putaway Group ID | GROUP_ID | 10 / None |
| 51704 | Putaway Location Name | PUTAWAY_GROUP_LOCATION | 10 / None |
| 51705 | Receipt ID | RECEIPT_ID | 10 / None |
| 51706 | Group Number | INTERNAL_GROUP_NUM | 90 / None |
| 51707 | Warehouse | WAREHOUSE | 280 / 10 |
| 51708 | Show Closed Putaway Groups | CLOSED | 130 / None |
| 51709 | SearchPaneAdvCrit | Not populated | 70 / 40 |

Configured action-control bindings:

| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |
|---|---|---|---|---|
| 51686 / Save | 18071 click → _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | queryParameter_Function_ScreenPartId=[value omitted] (parameter 26587); queryParameter_Function_UserName=[value omitted] (parameter 26588); queryParameter_Input_SaveSearchNameEditor_SearchName=[value omitted] (parameter 26589); PostData_Function_ScreenPartId=[value omitted] (parameter 26591); PostData_Function_UserName=[value omitted] (parameter 26592); PostData_Input_SaveSearchNameEditor_SearchName=[value omitted] (parameter 26593); PostData_Function_SearchValue=[value omitted] (parameter 26594) | /general/scaleapi/ScreenPartSearchApi? (parameter 26586); /general/scaleapi/ScreenPartSearchApi (parameter 26590) |
| 51687 / Cancel | 18072 click → _webUi.dialog.hideModalDialogByEvent | Not populated | Not populated | Not populated |
| 51689 / Save | 18073 click → _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | PostData_Function_SearchValue=[value omitted] (parameter 26601) | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved (parameter 26598) |
| 51690 / Cancel | 18074 click → _webUi.dialog.hideModalDialogByEvent | Not populated | Not populated | Not populated |
| 51691 / InsightMenuApply | 18075 click → _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Not populated | Not populated |
| 51692 / InsightMenuActionClearFilters | 18076 click → _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Not populated | Not populated |
| 51693 / InsightMenuActionStopSearch | 18077 click → _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Not populated | Not populated |
| 51694 / InsightMenuActionSaveSearch | 18078 click → _webUi.dialog.showModalDialogByEvent | 23 | Not populated | Not populated |
| 51695 / GadgetCalculationQueryMenuAction | 18079 click → _webUi.dialog.showModalDialogByEvent | 24 | Not populated | Not populated |
| 51696 / Σ | 18080 click → _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Not populated | Not populated |
| 51697 / InsightMenuActionToggleGroupBy | 18081 click → _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Not populated | Not populated |
| 51698 / InsightMenuActionCollapse | 18082 click → _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Not populated | Not populated |
| 51699 / MenuExportToExcel | 18083 click → _webUi.insightListPaneActions.exportButtonClicked | Not populated | Not populated | Not populated |
| 51700 / Close | 18084 click → _webUi.insightListPaneActions.menuActionPerformPost | 21 | queryParameter_Grid_ListPaneDataGrid_groupId=GROUP_ID (parameter 26608); queryParameter_Grid_ListPaneDataGrid_warehouse=WAREHOUSE (parameter 26609) | Not populated |
| 51701 / Open | 18085 click → _webUi.insightListPaneActions.menuActionPerformPost | 23 | PostData_Grid_ListPaneDataGrid_InternalGroupNum=INTERNAL_GROUP_NUM (parameter 26613) | /inbound/scaleapi/PutawayGroupsApi/Opened-PutawayGroup? (parameter 26612) |
| 51702 / Rename | 18086 click → _webUi.dialog.showModalDialogByEvent | 22 | Not populated | Not populated |
| 51713 / Save | 18091 click → _webUi.insightListPaneActions.modalDialogPerformPost | Not populated | PostData_Grid_ListPaneDataGrid_InternalGroupNum=INTERNAL_GROUP_NUM (parameter 26625); queryParameter_Input_RenamePutawayGroupEditor_GroupId=[value omitted] (parameter 26626) | /inbound/scaleapi/PutawayGroupsApi/Renamed-PutawayGroup? (parameter 26624) |
| 51714 / Cancel | 18092 click → _webUi.dialog.hideModalDialogByEvent | Not populated | Not populated | Not populated |

There are 3 incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.

Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact.

## Receipt Container Insight — form 2779, screen 1782

Configured route: `/scale/insights/2779`. Form table/data-source name: `METADATA_INSIGHT_RECEIPT_CONTAINER_VIEW`. These names are references; separate backend evidence must resolve what they mean.

Configured structure:
- Part 4411 `SaveSearchModalDialog`: group 18166 `SaveSearchModalDialogForm` (0 controls); group 18167 `SaveSearchModalDialogHeader` (0 controls); group 18168 `SaveSearchModalDialogBody` (1 controls); group 18169 `SaveSearchModalDialogFooter` (2 controls).
- Part 4412 `GadgetCalculationQueryDialog`: group 18170 `GadgetCalculationQueryDialogForm` (0 controls); group 18171 `GadgetCalculationQueryDialogHeader` (0 controls); group 18172 `GadgetCalculationQueryDialogBody` (1 controls); group 18173 `GadgetCalculationQueryDialogFooter` (2 controls).
- Part 4413 `InsightMenuPane`: group 18174 `InsightMenu` (0 controls); group 18175 `InsightMenuPanel` (4 controls); group 18176 `InsightMenuFavoritesDropdown` (0 controls); group 18177 `InsightListPaneMenuPanel` (4 controls); group 18178 `MenuExportToExcelPanel` (1 controls); group 18179 `InsightMenuActionsDropdown` (11 controls).
- Part 4414 `SearchPane`: group 18180 `SearchPaneCriteria` (0 controls); group 18181 `SearchPaneBasicCriteria` (11 controls); group 18182 `SearchPaneAdvancedCriteria` (1 controls).
- Part 4415 `ListPane`: group 18183 `ListPaneSummary` (5 controls); group 18184 `ListPanePanel` (1 controls).
- Part 4416 `DetailPane`: group 18185 `DetailPaneHeaderPanel1` (7 controls).

Configured criteria:

| Control | Label / name | Database field tokens | Type / data-source type |
|---|---|---|---|
| 51869 | License Plate | CONTAINER_ID | 10 / None |
| 51870 | Receipt ID | RECEIPT_ID | 10 / None |
| 51871 | ERP Order Line Number | ERP_ORDER_LINE_NUM | 10 / None |
| 51872 | Item | ITEM | 10 / None |
| 51873 | Description | ITEM_DESC | 10 / None |
| 51874 | Company | COMPANY | 280 / 10 |
| 51875 | Warehouse | WAREHOUSE | 280 / 10 |
| 51876 | Internal Receipt Number | INTERNAL_RECEIPT_NUM | 90 / None |
| 51877 | Internal Receipt Line Number | INTERNAL_RECEIPT_LINE_NUM | 90 / None |
| 51878 | Group Number | INTERNAL_GROUP_NUM | 90 / None |
| 51879 | Show Closed | CONTAINER_STATUS | 130 / None |
| 51880 | SearchPaneAdvCrit | Not populated | 70 / 40 |

Configured action-control bindings:

| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |
|---|---|---|---|---|
| 51844 / Save | 18168 click → _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | queryParameter_Function_ScreenPartId=[value omitted] (parameter 26786); queryParameter_Function_UserName=[value omitted] (parameter 26787); queryParameter_Input_SaveSearchNameEditor_SearchName=[value omitted] (parameter 26788); PostData_Function_ScreenPartId=[value omitted] (parameter 26790); PostData_Function_UserName=[value omitted] (parameter 26791); PostData_Input_SaveSearchNameEditor_SearchName=[value omitted] (parameter 26792); PostData_Function_SearchValue=[value omitted] (parameter 26793) | /general/scaleapi/ScreenPartSearchApi? (parameter 26785); /general/scaleapi/ScreenPartSearchApi (parameter 26789) |
| 51845 / Cancel | 18169 click → _webUi.dialog.hideModalDialogByEvent | Not populated | Not populated | Not populated |
| 51847 / Save | 18170 click → _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | PostData_Function_SearchValue=[value omitted] (parameter 26800) | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved (parameter 26797) |
| 51848 / Cancel | 18171 click → _webUi.dialog.hideModalDialogByEvent | Not populated | Not populated | Not populated |
| 51849 / InsightMenuApply | 18172 click → _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Not populated | Not populated |
| 51850 / InsightMenuActionClearFilters | 18173 click → _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Not populated | Not populated |
| 51851 / InsightMenuActionStopSearch | 18174 click → _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Not populated | Not populated |
| 51852 / InsightMenuActionSaveSearch | 18175 click → _webUi.dialog.showModalDialogByEvent | 23 | Not populated | Not populated |
| 51853 / GadgetCalculationQueryMenuAction | 18176 click → _webUi.dialog.showModalDialogByEvent | 29 | Not populated | Not populated |
| 51854 / Σ | 18177 click → _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Not populated | Not populated |
| 51855 / InsightMenuActionToggleGroupBy | 18178 click → _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Not populated | Not populated |
| 51856 / InsightMenuActionCollapse | 18179 click → _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Not populated | Not populated |
| 51857 / MenuExportToExcel | 18180 click → _webUi.insightListPaneActions.exportButtonClicked | Not populated | Not populated | Not populated |
| 51858 / Edit | 18181 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 3 | form=3005 (attribute 40968) | Not populated |
| 51859 / Delete | 18182 click → _webUi.insightListPaneActions.menuActionPerformPostForSelection | 5 | form=3005 (attribute 40972); PostData_Grid_ListPaneDataGrid_InternalReceiptContainerNum=INTERNAL_REC_CONT_NUM (parameter 26809) | /inbound/scaleapi/receiptContainersApi/deleted-Containers (parameter 26808) |
| 51860 / Cancel | 18183 click → _webUi.insightListPaneActions.menuActionPerformPostForSelection | 25 | PostData_Grid_ListPaneDataGrid_InternalReceiptContainerNum=INTERNAL_REC_CONT_NUM (parameter 26813) | /inbound/scaleapi/receiptContainersApi/cancelled-Containers (parameter 26812) |
| 51861 / Immediate Needs | 18184 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 24 | Not populated | Not populated |
| 51862 / Locate | 18185 click → _webUi.receiptContainerInsight.locateReceiptContainer | 26 | Not populated | /inbound/scaleapi/receiptContainersApi/located-Containers (parameter 26817) |
| 51863 / Print Preview | 18186 click → _webUi.dialog.printPreviewSelection | 34 | queryParameter_Grid_ListPaneDataGrid_internalNum=INTERNAL_REC_CONT_NUM (parameter 26819) | Not populated |
| 51864 / Print Default Docs | 18187 click → _webUi.insightListPaneActions.menuActionPerformGet | 21 | queryParameter_Grid_ListPaneDataGrid_internalNum=INTERNAL_REC_CONT_NUM (parameter 26822) | /general/scaleapi/PrintApi? (parameter 26821) |
| 51865 / Print Selected Docs | 18188 click → _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | 22 | Not populated | Not populated |
| 51868 / View | 18191 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | form=3005 (attribute 40985) | Not populated |
| 51866 / Remove From Group | 18189 click → _webUi.insightListPaneActions.menuActionPerformPost | 27 | queryParameter_Grid_ListPaneDataGrid_internalReceiptContainerNum=INTERNAL_REC_CONT_NUM (parameter 26826) | /inbound/scaleapi/receiptContainersApi/Removed-ContainerFromPutawayGroup? (parameter 26825) |
| 51867 / Unlocate | 18190 click → _webUi.insightListPaneActions.menuActionPerformPostForSelection | 28 | PostData_Grid_ListPaneDataGrid_InternalReceiptContainerNum=INTERNAL_REC_CONT_NUM (parameter 26830); PostData_Grid_ListPaneDataGrid_InternalReceiptNum=INTERNAL_RECEIPT_NUM (parameter 26831) | /inbound/scaleapi/receiptContainersApi/Unlocated-ReceiptContainers (parameter 26829) |

There are 10 incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.

Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact.

## Receipt Insight — form 2777, screen 1781

Configured route: `/scale/insights/2777`. Form table/data-source name: `METADATA_INSIGHT_RECEIPT_VIEW`. These names are references; separate backend evidence must resolve what they mean.

Configured structure:
- Part 4404 `SaveSearchModalDialog`: group 18141 `SaveSearchModalDialogForm` (0 controls); group 18142 `SaveSearchModalDialogHeader` (0 controls); group 18143 `SaveSearchModalDialogBody` (1 controls); group 18144 `SaveSearchModalDialogFooter` (2 controls).
- Part 4405 `GadgetCalculationQueryDialog`: group 18145 `GadgetCalculationQueryDialogForm` (0 controls); group 18146 `GadgetCalculationQueryDialogHeader` (0 controls); group 18147 `GadgetCalculationQueryDialogBody` (1 controls); group 18148 `GadgetCalculationQueryDialogFooter` (2 controls).
- Part 4406 `InsightMenuPane`: group 18149 `InsightMenu` (0 controls); group 18150 `InsightMenuPanel` (4 controls); group 18151 `InsightMenuFavoritesDropdown` (0 controls); group 18152 `InsightListPaneMenuPanel` (4 controls); group 18153 `MenuExportToExcelPanel` (1 controls); group 18154 `InsightMenuActionsDropdown` (20 controls).
- Part 4407 `SearchPane`: group 18155 `SearchPaneCriteria` (0 controls); group 18156 `SearchPaneBasicCriteria` (12 controls); group 18157 `SearchPaneAdvancedCriteria` (1 controls).
- Part 4408 `ListPane`: group 18158 `ListPaneSummary` (4 controls); group 18159 `ListPanePanel` (1 controls).
- Part 4410 `DetailPane`: group 18164 `DetailPaneHeaderPanel1` (4 controls); group 18165 `indicatorpane` (2 controls).
- Part 4409 `AssignTrailerModalDialog`: group 18160 `AssignTrailerModalDialogForm` (0 controls); group 18161 `AssignTrailerModalDialogHeader` (0 controls); group 18162 `AssignTrailerModalDialogBody` (1 controls); group 18163 `AssignTrailerModalDialogFooter` (2 controls).

Configured criteria:

| Control | Label / name | Database field tokens | Type / data-source type |
|---|---|---|---|
| 51816 | Receipt ID | RECEIPT_ID | 10 / None |
| 51817 | Receipt ID Type | RECEIPT_ID_TYPE | 80 / 70 |
| 51818 | Item | ITEM | 10 / None |
| 51819 | Company | COMPANY | 280 / 10 |
| 51820 | License Plate | LICENSE_PLATE_ID | 10 / None |
| 51821 | Receiving Dock | RECEIVING_DOCK | 10 / None |
| 51822 | Source Name | SOURCE_NAME | 10 / None |
| 51823 | Ship From | RECEIPT_HEADER_SHIP_FROM | 10 / None |
| 51824 | Receipt Date | RECEIPT_HEADER_RECEIPT_DATE | 190 / None |
| 51825 | Internal Receipt Number | Internal_Receipt_Num | 90 / None |
| 51826 | Warehouse | WAREHOUSE | 280 / 10 |
| 51827 | Include Closed Receipts | CLOSE_DATE | 130 / None |
| 51828 | SearchPaneAdvCrit | Not populated | 70 / 40 |

Configured action-control bindings:

| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |
|---|---|---|---|---|
| 51782 / Save | 18129 click → _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | queryParameter_Function_ScreenPartId=[value omitted] (parameter 26692); queryParameter_Function_UserName=[value omitted] (parameter 26693); queryParameter_Input_SaveSearchNameEditor_SearchName=[value omitted] (parameter 26694); PostData_Function_ScreenPartId=[value omitted] (parameter 26696); PostData_Function_UserName=[value omitted] (parameter 26697); PostData_Input_SaveSearchNameEditor_SearchName=[value omitted] (parameter 26698); PostData_Function_SearchValue=[value omitted] (parameter 26699) | /general/scaleapi/ScreenPartSearchApi? (parameter 26691); /general/scaleapi/ScreenPartSearchApi (parameter 26695) |
| 51783 / Cancel | 18130 click → _webUi.dialog.hideModalDialogByEvent | Not populated | Not populated | Not populated |
| 51785 / Save | 18131 click → _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | PostData_Function_SearchValue=[value omitted] (parameter 26706) | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved (parameter 26703) |
| 51786 / Cancel | 18132 click → _webUi.dialog.hideModalDialogByEvent | Not populated | Not populated | Not populated |
| 51787 / InsightMenuApply | 18133 click → _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Not populated | Not populated |
| 51788 / InsightMenuActionClearFilters | 18134 click → _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Not populated | Not populated |
| 51789 / InsightMenuActionStopSearch | 18135 click → _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Not populated | Not populated |
| 51790 / InsightMenuActionSaveSearch | 18136 click → _webUi.dialog.showModalDialogByEvent | 23 | Not populated | Not populated |
| 51791 / GadgetCalculationQueryMenuAction | 18137 click → _webUi.dialog.showModalDialogByEvent | 29 | Not populated | Not populated |
| 51792 / Σ | 18138 click → _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Not populated | Not populated |
| 51793 / InsightMenuActionToggleGroupBy | 18139 click → _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Not populated | Not populated |
| 51794 / InsightMenuActionCollapse | 18140 click → _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Not populated | Not populated |
| 51795 / MenuExportToExcel | 18141 click → _webUi.insightListPaneActions.exportButtonClicked | Not populated | Not populated | Not populated |
| 51796 / New | 18142 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 2 | form=3034 (attribute 40886) | Not populated |
| 51797 / Edit | 18143 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 3 | form=3034 (attribute 40888) | Not populated |
| 51798 / View | 18144 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | form=3034 (attribute 40890) | Not populated |
| 51799 / Delete | 18145 click → _webUi.insightListPaneActions.menuActionPerformPostForSelection | 5 | form=3034 (attribute 40892); PostData_Grid_ListPaneDataGrid_InternalReceiptNum=INTERNAL_RECEIPT_NUM (parameter 26717) | /inbound/scaleapi/ReceiptHeadersApi/Deleted-Receipts (parameter 26716) |
| 51800 / New Container | 18146 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 2 | form=3005 (attribute 40895); queryParameter_Grid_ListPaneDataGrid_InternalReceiptNum=INTERNAL_RECEIPT_NUM (parameter 26719) | Not populated |
| 51801 / New Line | 18147 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 2 | form=3035 (attribute 40898); queryParameter_Grid_ListPaneDataGrid_InternalReceiptNum=INTERNAL_RECEIPT_NUM (parameter 26721) | Not populated |
| 51802 / Assign Trailer ID | 18148 click → _webUi.dialog.showModalDialogByEvent | 27 | Not populated | Not populated |
| 51803 / New Appointment | 18149 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 2 | form=2765 (attribute 40903) | Not populated |
| 51804 / Edit Appointment | 18150 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 3 | form=2765 (attribute 40906) | Not populated |
| 51805 / View Appointment | 18151 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | form=2765 (attribute 40909) | Not populated |
| 51806 / Delete Appointment | 18152 click → _webUi.insightListPaneActions.menuActionPerformPostForSelection | 5 | form=166 (attribute 40910); PostData_Grid_ListPaneDataGrid_InternalReceiptNum=INTERNAL_RECEIPT_NUM (parameter 26730) | /inbound/scaleapi/ReceiptHeadersApi/Deleted-Appointments (parameter 26729) |
| 51807 / Cancel Close | 18153 click → _webUi.insightListPaneActions.menuActionPerformPostForSelection | 25 | PostData_Grid_ListPaneDataGrid_InternalReceiptNum=INTERNAL_RECEIPT_NUM (parameter 26734) | /inbound/scaleapi/ReceiptHeadersApi/cancelled-ClosedReceipts (parameter 26733) |
| 51808 / Check in | 18154 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 35 | Not populated | Not populated |
| 51809 / Create Pre-Check in Containers | 18155 click → _webUi.insightListPaneActions.menuActionPerformPost | 26 | PostData_Grid_ListPaneDataGrid_internalReceiptNum=INTERNAL_RECEIPT_NUM (parameter 26740) | Not populated |
| 51810 / Close | 18156 click → _webUi.insightListPaneActions.menuActionPerformPostForSelection | 24 | PostData_Grid_ListPaneDataGrid_InternalReceiptNum=INTERNAL_RECEIPT_NUM (parameter 26745) | /inbound/scaleapi/ReceiptHeadersApi/Closed-Receipts (parameter 26744) |
| 51811 / Print Preview | 18157 click → _webUi.dialog.printPreviewSelection | 34 | queryParameter_Grid_ListPaneDataGrid_internalNum=INTERNAL_RECEIPT_NUM (parameter 26748) | Not populated |
| 51812 / Immediate Needs | 18158 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 28 | Not populated | Not populated |
| 51813 / Print Default Docs | 18159 click → _webUi.insightListPaneActions.menuActionPerformGet | 21 | queryParameter_Grid_ListPaneDataGrid_internalNum=INTERNAL_RECEIPT_NUM (parameter 26752) | /general/scaleapi/PrintApi? (parameter 26751) |
| 51814 / Print Selected Docs | 18160 click → _webUi.insightListPaneActions.menuActionOpenUrlInModalDialog | 22 | Not populated | Not populated |
| 51815 / Yard Check in & Out | 18161 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 1 | form=3052 (attribute 40925) | Not populated |
| 51835 / Save | 18166 click → _webUi.insightListPaneActions.modalDialogPerformPostForSelection | Not populated | PostData_Grid_ListPaneDataGrid_InternalReceiptNum=INTERNAL_RECEIPT_NUM (parameter 26779); queryParameter_Input_AssignTrailerEditor_TrailerId=[value omitted] (parameter 26780) | /inbound/scaleapi/ReceiptHeadersApi/assignedToTrailerId-Receipts (parameter 26778) |
| 51836 / Cancel | 18167 click → _webUi.dialog.hideModalDialogByEvent | Not populated | Not populated | Not populated |

There are 19 incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.

Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact.

## Receipt Line Insight — form 2780, screen 1783

Configured route: `/scale/insights/2780`. Form table/data-source name: `METADATA_RECEIPT_INSIGHT_VIEW`. These names are references; separate backend evidence must resolve what they mean.

Configured structure:
- Part 4417 `SaveSearchModalDialog`: group 18186 `SaveSearchModalDialogForm` (0 controls); group 18187 `SaveSearchModalDialogHeader` (0 controls); group 18188 `SaveSearchModalDialogBody` (1 controls); group 18189 `SaveSearchModalDialogFooter` (2 controls).
- Part 4418 `GadgetCalculationQueryDialog`: group 18190 `GadgetCalculationQueryDialogForm` (0 controls); group 18191 `GadgetCalculationQueryDialogHeader` (0 controls); group 18192 `GadgetCalculationQueryDialogBody` (1 controls); group 18193 `GadgetCalculationQueryDialogFooter` (2 controls).
- Part 4419 `InsightMenuPane`: group 18194 `InsightMenu` (0 controls); group 18195 `InsightMenuPanel` (4 controls); group 18196 `InsightMenuFavoritesDropdown` (0 controls); group 18197 `InsightListPaneMenuPanel` (4 controls); group 18198 `MenuExportToExcelPanel` (1 controls); group 18199 `InsightMenuActionsDropdown` (4 controls).
- Part 4420 `SearchPane`: group 18200 `SearchPaneCriteria` (0 controls); group 18201 `SearchPaneBasicCriteria` (9 controls); group 18202 `SearchPaneAdvancedCriteria` (1 controls).
- Part 4421 `ListPane`: group 18203 `ListPaneSummary` (4 controls); group 18204 `ListPanePanel` (1 controls).
- Part 4422 `DetailPane`: group 18205 `DetailPaneHeaderPanel1` (5 controls); group 18206 `indicatorpane` (1 controls).

Configured criteria:

| Control | Label / name | Database field tokens | Type / data-source type |
|---|---|---|---|
| 51913 | Receipt ID | Receipt_Id | 10 / None |
| 51914 | Receipt Type | Receipt_Type | 10 / None |
| 51915 | ERP Order Line Number | Erp_Order_Line_Num | 90 / None |
| 51916 | Item | Item | 10 / None |
| 51917 | Description | Item_Desc | 10 / None |
| 51918 | Company | COMPANY | 280 / 10 |
| 51919 | Warehouse | Warehouse | 280 / 10 |
| 51920 | Internal Receipt Number | Internal_Receipt_Num | 90 / None |
| 51921 | Show Closed | CLOSE_DATE | 130 / None |
| 51922 | SearchPaneAdvCrit | Not populated | 70 / 40 |

Configured action-control bindings:

| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |
|---|---|---|---|---|
| 51895 / Save | 18196 click → _webUi.insightListPaneActions.modalDialogPerformGetWithConfirmation | Not populated | queryParameter_Function_ScreenPartId=[value omitted] (parameter 26849); queryParameter_Function_UserName=[value omitted] (parameter 26850); queryParameter_Input_SaveSearchNameEditor_SearchName=[value omitted] (parameter 26851); PostData_Function_ScreenPartId=[value omitted] (parameter 26853); PostData_Function_UserName=[value omitted] (parameter 26854); PostData_Input_SaveSearchNameEditor_SearchName=[value omitted] (parameter 26855); PostData_Function_SearchValue=[value omitted] (parameter 26856) | /general/scaleapi/ScreenPartSearchApi? (parameter 26848); /general/scaleapi/ScreenPartSearchApi (parameter 26852) |
| 51896 / Cancel | 18197 click → _webUi.dialog.hideModalDialogByEvent | Not populated | Not populated | Not populated |
| 51898 / Save | 18198 click → _webUi.insightListPaneActions.menuActionPerformPostForGadget | Not populated | PostData_Function_SearchValue=[value omitted] (parameter 26863) | /general/scaleapi/GadgetCalculationQueryApi/GadgetCalculationQuery-Saved (parameter 26860) |
| 51899 / Cancel | 18199 click → _webUi.dialog.hideModalDialogByEvent | Not populated | Not populated | Not populated |
| 51900 / InsightMenuApply | 18200 click → _webUi.insightSearchPaneActions.searchButtonClicked | Not populated | Not populated | Not populated |
| 51901 / InsightMenuActionClearFilters | 18201 click → _webUi.insightSearchPaneActions.clearButtonClicked | Not populated | Not populated | Not populated |
| 51902 / InsightMenuActionStopSearch | 18202 click → _webUi.insightSearchPaneActions.stopSearchButtonClicked | Not populated | Not populated | Not populated |
| 51903 / InsightMenuActionSaveSearch | 18203 click → _webUi.dialog.showModalDialogByEvent | 23 | Not populated | Not populated |
| 51904 / GadgetCalculationQueryMenuAction | 18204 click → _webUi.dialog.showModalDialogByEvent | 25 | Not populated | Not populated |
| 51905 / Σ | 18205 click → _webUi.insightListPaneActions.toggleSummaryButtonClicked | Not populated | Not populated | Not populated |
| 51906 / InsightMenuActionToggleGroupBy | 18206 click → _webUi.insightListPaneActions.toggleGroupByButtonClicked | Not populated | Not populated | Not populated |
| 51907 / InsightMenuActionCollapse | 18207 click → _webUi.insightListPaneActions.groupByCollapseClicked | Not populated | Not populated | Not populated |
| 51908 / MenuExportToExcel | 18208 click → _webUi.insightListPaneActions.exportButtonClicked | Not populated | Not populated | Not populated |
| 51909 / Edit | 18209 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 3 | form=3035 (attribute 41024) | Not populated |
| 51912 / View | 18212 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | Not populated | form=3035 (attribute 41031) | Not populated |
| 51910 / Delete | 18210 click → _webUi.insightListPaneActions.menuActionPerformPostForSelection | 5 | form=3035 (attribute 41027); PostData_Grid_ListPaneDataGrid_InternalReceiptLineNum=INTERNAL_RECEIPT_LINE_NUM (parameter 26872) | /inbound/scaleapi/ReceiptDetailsApi/Deleted-ReceiptDetails (parameter 26871) |
| 51911 / Immediate Needs | 18211 click → _webUi.insightListPaneActions.menuActionOpenUrlInCurrentTab | 24 | Not populated | Not populated |

There are 4 incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.

Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact.

## Receipt Monitoring — form 4106, screen 1737

Configured route: `/scale/monitors/4106`. Form table/data-source name: `not populated`. These names are references; separate backend evidence must resolve what they mean.

Configured structure:
- Part 4198 `MonitorMenuPane`: group 17446 `MonitorMenuPanel` (0 controls); group 17447 `MonitorMenuBreadCrumbPanel` (1 controls); group 17448 `MonitorMenuActionPanel` (2 controls).
- Part 4199 `monitorchartPane`: group 17449 `MonitorPaneSummary` (3 controls); group 17450 `ListPaneHighchart` (1 controls).
- Part 4200 `monitorindicatorpane`: group 17451 `indicatorpane` (4 controls).

Configured action-control bindings:

| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |
|---|---|---|---|---|
| 50436 / MNU_RECEIPT_MONITORINGRefresh | 17412 click → _webUi.monitor.refreshButtonClicked | Not populated | Not populated | Not populated |
| 50437 / Insight | 17413 click → _webUi.monitor.jumpToInsight | Not populated | Not populated | Not populated |

There are 0 incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.

Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact.

## Receipt Workbench — form 4038, screen 1541

Configured route: `/scale/trans/receiptWorkBench`. Form table/data-source name: `MetaTrans_ReceiptWorkbench`. These names are references; separate backend evidence must resolve what they mean.

Configured structure:
- Part 3506 `CrudDataPane`: group 14675 `RECEIPTMenu` (0 controls); group 14676 `RECEIPTMenuPanel` (1 controls); group 14679 `RECEIPTContainerInitiationGroup` (0 controls); group 14680 `RECEIPTContainerPanel` (4 controls); group 14678 `RECEIPTMenuPanelActions` (2 controls); group 14677 `RECEIPTActionsDropdown` (2 controls).

Configured action-control bindings:

| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |
|---|---|---|---|---|
| 42650 / RECEIPTActionStart | 14143 click → _webUi.receiptWorkbenchTransaction.loadReceiptWorkBenchScreen | 1 | Not populated | Not populated |
| 42651 / RECEIPTActionCreate | 14144 click → _webUi.receiptWorkbenchTransaction.openCreateReceipt | 2 | form=3034 (attribute 32840) | Not populated |
| 42648 / RECEIPTActionRefresh | Not populated | 1 | Not populated | Not populated |
| 42647 / New | Not populated | Not populated | Not populated | Not populated |
| 42645 / New Line | Not populated | 2 | form=3035 (attribute 32832) | Not populated |
| 42646 / Cancel | 14142 click → _webUi.receiptWorkbenchTransaction.cancel | Not populated | Not populated | Not populated |

There are 0 incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.

Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact.

## Receiving Appointment Schedule — form 2765, screen 1539

Configured route: `/scale/trans/recappschedule`. Form table/data-source name: `MetaTrans_GetRecAppSchedule`. These names are references; separate backend evidence must resolve what they mean.

Configured structure:
- Part 3504 `CrudDataPane`: group 14662 `RecApptScheduleMenu` (0 controls); group 14663 `RecApptScheduleMenuPanel` (3 controls); group 14664 `RecAppScheduleMainAccordion` (0 controls); group 14665 `RecAppScheduleScheduleSubAccordion` (6 controls); group 14666 `RecAppScheduleShipFromSubAccordion` (9 controls); group 14667 `RecAppScheduleUserDefinedSubAccordion` (8 controls).

Configured action-control bindings:

| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |
|---|---|---|---|---|
| 42593 / Save | 14130 click → _webUi.detailsScreenBinding.invokePUTWebService | 3 | Not populated | /inbound/scaleapi/recappscheduleapi/save? (parameter 19328) |
| 42594 / Cancel | 14131 click → _webUi.detailsScreenBinding.cancel | Not populated | Not populated | Not populated |

There are 0 incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.

Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact.

## Receipt Container — form 3005, screen 1666

Configured route: `/scale/details/receiptcontainer`. Form table/data-source name: `ReceiptContainerView`. These names are references; separate backend evidence must resolve what they mean.

Configured structure:
- Part 3887 `CrudDataPane`: group 16255 `ReceiptContainerMenuGroup` (0 controls); group 16256 `ReceiptContainerMenuPanel` (3 controls); group 16257 `ReceiptContainerDetailMainAccordion` (0 controls); group 16258 `ReceiptContainerContainersInfoSubAccordion` (18 controls); group 16259 `ReceiptContainerContentsSubAccordion` (12 controls); group 16260 `ReceiptContainerStatusInfoSubAccordion` (3 controls); group 16261 `ReceiptContainerDatesInfoSubAccordion` (3 controls); group 16262 `ReceiptContainerSerialNumberSubAccordion` (1 controls); group 16263 `ReceiptContainerReferenceinfoSubAccordion` (11 controls); group 16264 `ReceiptContainerUserDefinedSubAccordion` (8 controls).

Configured action-control bindings:

| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |
|---|---|---|---|---|
| 47518 / Save | 16156 click → _webUi.receiptDetails.save | 2, 3 | Not populated | /inbound/scaleapi/receiptContainersApi/save? (parameter 22990); /inbound/scaleapi/receiptContainersApi/save (parameter 22992) |
| 47519 / Cancel | 16157 click → _webUi.receiptDetails.cancel | Not populated | Not populated | Not populated |

There are 0 incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.

Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact.

## Receipt — form 3034, screen 1428

Configured route: `/scale/details/receipt`. Form table/data-source name: `ReceiptHeaderView`. These names are references; separate backend evidence must resolve what they mean.

Configured structure:
- Part 3188 `CrudDataPane`: group 13398 `ReceiptHeaderReferenceinfoTitleSubAccordion` (9 controls); group 13395 `ReceiptMenu` (0 controls); group 13396 `ReceiptHeaderMenuPanel` (3 controls); group 13399 `ReceiptHeaderSourceTitleSubAccordion` (14 controls); group 13400 `ReceiptHeaderShipFromTitleSubAccordion` (14 controls); group 13401 `ReceiptHeaderStatusTitleSubAccordion` (9 controls); group 13402 `ReceiptHeaderCarrierTitleSubAccordion` (8 controls); group 13403 `ReceiptHeaderDatesTitleSubAccordion` (8 controls); group 13404 `ReceiptHeaderLinesTitleSubAccordion` (2 controls); group 13405 `ReceiptHeaderTotalsTitleSubAccordion` (8 controls); group 13397 `ReceiptHeaderDetailMainAccordion` (0 controls); group 13406 `ReceiptHeaderUserDefinedTitleSubAccordion` (8 controls).

Configured action-control bindings:

| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |
|---|---|---|---|---|
| 38983 / Save | 12822 click → _webUi.receiptDetails.save | 2, 3 | Not populated | /inbound/scaleapi/receiptHeadersApi/save (parameter 17429); /inbound/scaleapi/receiptHeadersApi/save? (parameter 17432) |
| 38984 / Cancel | 12823 click → _webUi.detailsScreenBinding.cancel | Not populated | Not populated | Not populated |
| 39048 / Add | 12832 click → _webUi.detailsScreenActions.menuActionOpenUrlInCurrentTab | 2 | form=3035 (attribute 29749) | Not populated |

There are 0 incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.

Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact.

## Receipt Line — form 3035, screen 1427

Configured route: `/scale/details/receiptdetail`. Form table/data-source name: `ReceiptDetail`. These names are references; separate backend evidence must resolve what they mean.

Configured structure:
- Part 3187 `CrudDataPane`: group 13384 `ReceiptDetailMenu` (0 controls); group 13385 `ReceiptDetailMenuPanel` (3 controls); group 13387 `ReceiptDetailItemInfoSubAccordion` (7 controls); group 13386 `ReceiptDetailMainAccordion` (0 controls); group 13388 `ReceiptDetailQuantityInfoSubAccordion` (6 controls); group 13389 `ReceiptDetailItemDimensionSubAccordion` (14 controls); group 13390 `ReceiptDetailItemCharacteristicsSubAccordion` (12 controls); group 13391 `ReceiptDetailProcessingValuesSubAccordion` (6 controls); group 13392 `ReceiptDetailReferenceInfoSubAccordion` (16 controls); group 13393 `ReceiptDetailCategoriesSubAccordion` (10 controls); group 13394 `ReceiptDetailUserDefinedSubAccordion` (8 controls).

Configured action-control bindings:

| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |
|---|---|---|---|---|
| 38902 / Save | 12809 click → _webUi.receiptDetailDetails.performPut | Not populated | Not populated | /inbound/scaleapi/receiptdetailsapi/save? (parameter 17422) |
| 38901 / Cancel | 12808 click → _webUi.receiptDetailDetails.cancel | Not populated | Not populated | Not populated |

There are 0 incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.

Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact.

## Yard Check in & Out — form 3052, screen 1562

Configured route: `/scale/trans/yardcheckinout`. Form table/data-source name: `MetaTrans_GetTrailerDetails`. These names are references; separate backend evidence must resolve what they mean.

Configured structure:
- Part 3532 `CrudDataPane`: group 14789 `YardCheckInOutMenuPanel` (2 controls); group 14788 `YardCheckInOutMenu` (0 controls); group 14792 `YardCheckInCheckOutMenuPanel` (5 controls); group 14790 `MenuActionsDropdown` (1 controls); group 14791 `YardCheckInCheckOutIdGroup` (0 controls); group 14793 `UserDefinedFieldsMainAccordion` (0 controls); group 14794 `UserDefinedSubAccordion` (8 controls).

Configured action-control bindings:

| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |
|---|---|---|---|---|
| 42874 / Check Out | 14209 click → _webUi.yardCheckinOutTransaction.onCheckOutClick | Not populated | Not populated | /inbound/scaleapi/YardsApi/Trailer-CheckedOut (parameter 19355) |
| 42875 / Check in | 14210 click → _webUi.yardCheckinOutTransaction.onCheckInClick | Not populated | Not populated | /inbound/scaleapi/YardsApi/Trailer-CheckedIn (parameter 19356) |
| 42876 / Cancel | 14211 click → _webUi.detailsScreenBinding.cancel | Not populated | Not populated | Not populated |

There are 0 incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.

Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact.

## Purchase Order — form 4049, screen 1423

Configured route: `/scale/details/purchaseorder`. Form table/data-source name: `PurchaseOrderHeaderView`. These names are references; separate backend evidence must resolve what they mean.

Configured structure:
- Part 3183 `CrudDataPane`: group 13347 `InventoryAttributesMenu` (0 controls); group 13348 `InventoryAttributesMenuPanel` (3 controls); group 13350 `PurchaseOrderReferenceInfoSubAccordion` (5 controls); group 13349 `PurchaseOrderMainAccordion` (0 controls); group 13351 `PurchaseOrderSourceSubAccordion` (14 controls); group 13352 `PurchaseOrderShipFromSubAccordion` (14 controls); group 13353 `PurchaseOrderLinesSubAccordion` (1 controls); group 13354 `PurchaseOrderDatesSubAccordion` (5 controls); group 13355 `PurchaseOrderTotalsSubAccordion` (7 controls); group 13356 `PurchaseOrderUserDefinedSubAccordion` (8 controls).

Configured action-control bindings:

| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |
|---|---|---|---|---|
| 38703 / Save | 12791 click → _webUi.purchaseOrderDetails.save | 2, 3 | Not populated | /inbound/scaleapi/PurchaseOrderApi/save (parameter 17411); /inbound/scaleapi/PurchaseOrderApi/save? (parameter 17412) |
| 38702 / Cancel | 12790 click → _webUi.detailsScreenBinding.cancel | Not populated | Not populated | Not populated |

There are 0 incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.

Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact.

## Purchase Order Line — form 4051, screen 1665

Configured route: `/scale/details/purchaseorderline`. Form table/data-source name: `PurchaseOrderDetailView`. These names are references; separate backend evidence must resolve what they mean.

Configured structure:
- Part 3886 `CrudDataPane`: group 16245 `PurchaseOrderLineMenu` (0 controls); group 16246 `PurchaseOrderLineMenuPanel` (3 controls); group 16248 `PurchaseOrderLineItemInfoSubAccordion` (4 controls); group 16247 `PurchaseOrderLineMainAccordion` (0 controls); group 16249 `PurchaseOrderLineQuantityInfoSubAccordion` (4 controls); group 16250 `PurchaseOrderLineItemDimensionSubAccordion` (12 controls); group 16251 `PurchaseOrderLineItemCharacteristicsSubAccordion` (8 controls); group 16252 `PurchaseOrderLineReferenceInfoSubAccordion` (7 controls); group 16253 `PurchaseOrderLineCategoriesSubAccordion` (10 controls); group 16254 `UserDefinedSubAccordion` (8 controls).

Configured action-control bindings:

| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |
|---|---|---|---|---|
| 47464 / Save | 16150 click → _webUi.purchaseOrderLineDetails.save | 2, 3 | Not populated | /inbound/scaleapi/PurchaseOrderDetailsApi/save? (parameter 22986); /inbound/scaleapi/PurchaseOrderDetailsApi/save? (parameter 22987) |
| 47463 / Cancel | 16149 click → _webUi.detailsScreenBinding.cancel | Not populated | Not populated | Not populated |

There are 0 incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.

Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact.

## Receipt From Purchase Order — form 4052, screen 1802

Configured route: `/scale/trans/receiptFromPO`. Form table/data-source name: `MetaTrans_GetReceiptFromPO`. These names are references; separate backend evidence must resolve what they mean.

Configured structure:
- Part 4537 `MainDataPane`: group 18602 `ReceiptFromPOMenu` (0 controls); group 18603 `ReceiptFromPOMenuPanel` (3 controls); group 18605 `MainSubPanel` (3 controls); group 18607 `ItemsSubAccordion` (6 controls); group 18604 `ReceiptFromPOMainPanel` (0 controls); group 18606 `ReceiptFromPOAccordion` (0 controls); group 18608 `SourceInfoSubAccordion` (13 controls).

Configured action-control bindings:

| Control / label | Event ID and handler | Checkpoint | Context/target bindings | Service/procedure |
|---|---|---|---|---|
| 52702 / Save | 18650 click → _webUi.receiptFromPOTransaction.createReceiptFromPO | Not populated | Not populated | /inbound/scaleapi/ReceiptHeadersApi/Created-ReceiptsFromPO (parameter 27747) |
| 52703 / Cancel | 18651 click → _webUi.detailsScreenBinding.cancel | Not populated | Not populated | Not populated |
| 52707 / Update All Lines | 18652 click → _webUi.receiptFromPOTransaction.updateAllLinesClicked | Not populated | Not populated | Not populated |

There are 0 incoming EnableAction parameter references associated by exact control name. Their predicate values are not retained, so eligibility and multi-selection rules remain unproved. The JSON preserves every reference's source control, event and parameter ID.

Detail/input context remains conditional: all configured group/control identities are mapped, but selected-record data, runtime mandatory fields, operand choices, field validation, action outcomes and permissions are not established by this artifact.

## Dependency and verification boundaries

The JSON `named_dependencies` array binds every selected table/data-source, procedure and API reference to its exact source row and owning screen/control. Backend object semantics belong in the separately authored backend mapping. Source hashes identify the retained snapshot, not current deployment freshness.

The generator uses only local JSON and standard-library processing, reusing the existing dossier loader's dependency provenance checks. It refuses changes to the approved denominator. It performs no connection, browser action, configuration write, print, export or transaction.

Rebuild: `python Snapdragon/tools/build_receiving_map.py`. Map generation covers 17/17 included implementations; full functional review/acceptance is a separate criterion and is not awarded here.
