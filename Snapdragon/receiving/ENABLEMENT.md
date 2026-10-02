# Receiving action enablement

This bounded SD-11 supplement describes 69 retained configuration bindings from the 17 Receiving implementations: 51 `EnableAction_*` parameters and 18 `data-allowOnMultiSelect` attributes. The fixed read-only replica capture matched every original UTF-16LE fingerprint, length, parent, configuration name and flag. No business records or actions were accessed.

Structural extraction: **69/69 (100.00%)**. Predicates: **51/51**. Boolean flags: **18/18** (10 true, 8 false). Runtime predicates exercised: **0/51**.

The parser preserves field names, comparison distinctions and AND/OR grouping. **36/51 predicates contain unresolved bare symbols** (`Closed`, `NULL`, `TRUE`, `True`, `False`); these are not converted to enum/Boolean/null literals. The remaining **15/51** use typed literal operands, but field types, evaluator behavior, selection handling and server eligibility remain unproved. Numeric status constants are not assigned business status names here.

The `EnableAction_` suffix joins to an exact control name within the same implementation. These are recorded bindings from the grid's active-row-change event to action controls; a matching name is not a successful runtime transition. The multi-selection flag likewise records intent, not verified behavior.

Sources: [configuration-map.json](configuration-map.json), [machine-readable review and exact query receipts](enablement-review.json), [fixed collector and parser](../tools/collect_receiving_enablement.py). The review includes source hashes and all source IDs. Raw expressions remain outside this repository.

## Per-form extraction

| Form | Screen | Predicates parsed / candidates | Flags parsed / candidates | Symbol-bearing predicates |
|---|---|---:|---:|---:|
| 4069 | 1512 | 0/0 | 0/0 | 0 |
| 2796 | 1776 | 11/11 | 0/0 | 8 |
| 2797 | 1777 | 4/4 | 0/0 | 0 |
| 2791 | 1778 | 3/3 | 3/3 | 3 |
| 2779 | 1782 | 10/10 | 4/4 | 8 |
| 2777 | 1781 | 19/19 | 10/10 | 17 |
| 2780 | 1783 | 4/4 | 1/1 | 0 |
| 4106 | 1737 | 0/0 | 0/0 | 0 |
| 4038 | 1541 | 0/0 | 0/0 | 0 |
| 2765 | 1539 | 0/0 | 0/0 | 0 |
| 3005 | 1666 | 0/0 | 0/0 | 0 |
| 3034 | 1428 | 0/0 | 0/0 | 0 |
| 3035 | 1427 | 0/0 | 0/0 | 0 |
| 3052 | 1562 | 0/0 | 0/0 | 0 |
| 4049 | 1423 | 0/0 | 0/0 | 0 |
| 4051 | 1665 | 0/0 | 0/0 | 0 |
| 4052 | 1802 | 0/0 | 0/0 | 0 |

Zero entries means this exact captured binding family was absent; it does not mean no enablement or validation exists elsewhere.

## Action predicate bindings

### Form 2777 / screen 1781

Source grid control `51833`, event record `18165`: `iggridselectionactiverowchanged` → `_webUi.Grid.gridActiveRowChanged`.

| Action control | Parameter ID | Structural description |
|---|---|---|
| ListPaneMenuActionView (51798) | 26759 | RECEIPT_ID is strictly unequal to unresolved symbol NULL |
| ListPaneMenuActionEdit (51797) | 26760 | RECEIPT_ID is strictly unequal to unresolved symbol NULL |
| ListPaneMenuActionNewLine (51801) | 26761 | (RECEIPT_ID is strictly unequal to unresolved symbol NULL AND CLOSE_DATE strictly equals literal null) |
| ListPaneMenuActionCloseReceipt (51810) | 26762 | CLOSE_DATE strictly equals unresolved symbol NULL |
| ListPaneMenuActionCancelClose (51807) | 26763 | CLOSE_DATE is strictly unequal to unresolved symbol NULL |
| ListPaneMenuActionDeleteReceipt (51799) | 26764 | (LEADINGSTS loosely equals numeric constant 100 AND TRAILINGSTS loosely equals numeric constant 100) |
| ListPaneMenuActionPrintSelectedReceiptDocs (51814) | 26765 | RECEIPT_ID is strictly unequal to unresolved symbol NULL |
| ListPaneMenuActionPrintReceiptDocs (51813) | 26766 | RECEIPT_ID is strictly unequal to unresolved symbol NULL |
| ListPaneMenuActionPrintPreviewDocs (51811) | 26767 | RECEIPT_ID is strictly unequal to unresolved symbol NULL |
| ListPaneMenuActionCreatePreCheckInContainers (51809) | 26768 | RECEIPT_ID is strictly unequal to unresolved symbol NULL |
| ListPaneMenuActionAssignTrailer (51802) | 26769 | CLOSE_DATE strictly equals unresolved symbol NULL |
| ListPaneMenuActionNewContainer (51800) | 26770 | CLOSE_DATE strictly equals unresolved symbol NULL |
| ListPaneMenuActionImmediateNeeds (51812) | 26771 | IMMD_NEEDS_REQ_CREATED strictly equals unresolved symbol TRUE |
| ListPaneMenuActionNewAppointment (51803) | 26772 | (RECEIPT_ID is strictly unequal to unresolved symbol NULL AND APPOINTMENT_ID strictly equals literal false AND LEADINGSTS is at most numeric constant 100) |
| ListPaneMenuActionEditAppointment (51804) | 26773 | (RECEIPT_ID is strictly unequal to unresolved symbol NULL AND APPOINTMENT_ID strictly equals literal true) |
| ListPaneMenuActionViewAppointment (51805) | 26774 | (RECEIPT_ID is strictly unequal to unresolved symbol NULL AND APPOINTMENT_ID strictly equals literal true) |
| ListPaneMenuActionDeleteAppointment (51806) | 26775 | APPOINTMENT_ID strictly equals literal true |
| ListPaneMenuActionYardCheckInOut (51815) | 26776 | TRAILER_ID is strictly unequal to unresolved symbol NULL |
| ListPaneMenuActionCheckin (51808) | 26777 | (RECEIPT_ID is strictly unequal to unresolved symbol NULL AND CLOSE_DATE strictly equals unresolved symbol NULL) |

### Form 2779 / screen 1782

Source grid control `51886`, event record `18195`: `iggridselectionactiverowchanged` → `_webUi.Grid.gridActiveRowChanged`.

| Action control | Parameter ID | Structural description |
|---|---|---|
| ListPaneMenuActionPrintSelectedReceiptContainerDocs (51865) | 26838 | LICENSE_PLATE_ID is strictly unequal to unresolved symbol NULL |
| ListPaneMenuActionPrintPreviewDocs (51863) | 26839 | LICENSE_PLATE_ID is strictly unequal to unresolved symbol NULL |
| ListPaneMenuActionPrintReceiptContainerDocs (51864) | 26840 | LICENSE_PLATE_ID is strictly unequal to unresolved symbol NULL |
| ListPaneMenuActionImmediateNeeds (51861) | 26841 | IMMD_NEEDS_REQ_CREATED strictly equals unresolved symbol TRUE |
| ListPaneMenuActionCancelContainers (51860) | 26842 | CONTAINER_STATUS is at most numeric constant 100 |
| ListPaneMenuActionDeleteContainers (51859) | 26843 | (CONTAINER_STATUS is at most numeric constant 200 AND (MAX_STATUS is at most numeric constant 200 OR MAX_STATUS strictly equals unresolved symbol NULL)) |
| ListPaneMenuActionLocateContainers (51862) | 26844 | CONTAINER_STATUS strictly equals numeric constant 200 |
| ListPaneMenuActionRemoveContainerFromGroup (51866) | 26845 | (GROUP_CLOSED is strictly unequal to unresolved symbol TRUE AND INTERNAL_GROUP_NUM is strictly unequal to unresolved symbol NULL) |
| ListPaneMenuActionEdit (51858) | 26846 | LICENSE_PLATE_ID is strictly unequal to unresolved symbol NULL |
| ListPaneMenuActionUnlocateContainers (51867) | 26847 | (CONTAINER_STATUS is greater than numeric constant 200 AND IMMD_NEEDS_REQ_CREATED is strictly unequal to unresolved symbol TRUE AND GROUP_CLOSED is strictly unequal to unresolved symbol TRUE) |

### Form 2780 / screen 1783

Source grid control `51927`, event record `18216`: `iggridselectionactiverowchanged` → `_webUi.Grid.gridActiveRowChanged`.

| Action control | Parameter ID | Structural description |
|---|---|---|
| ListPaneMenuActionEdit (51909) | 26879 | INTERNAL_RECEIPT_LINE_NUM is greater than numeric constant 0 |
| ListPaneMenuActionDeleteReceiptDetails (51910) | 26880 | (IS_RECEIPT_CLOSED strictly equals numeric constant 0 AND IS_CONTAINERS_CREATED strictly equals numeric constant 0) |
| ListPaneMenuActionImmediateNeeds (51911) | 26881 | IMMD_NEEDS_REQ_CREATED strictly equals numeric constant 1 |
| ListPaneMenuActionView (51912) | 26882 | INTERNAL_RECEIPT_LINE_NUM is greater than numeric constant 0 |

### Form 2791 / screen 1778

Source grid control `51711`, event record `18090`: `iggridselectionactiverowchanged` → `_webUi.Grid.gridActiveRowChanged`.

| Action control | Parameter ID | Structural description |
|---|---|---|
| ListPaneMenuActionClosePutawayGroup (51700) | 26621 | CLOSED strictly equals unresolved symbol False |
| ListPaneMenuActionRenamePutawayGroup (51702) | 26622 | CLOSED strictly equals unresolved symbol False |
| ListPaneMenuActionOpenPutawayGroup (51701) | 26623 | CLOSED strictly equals unresolved symbol True |

### Form 2796 / screen 1776

Source grid control `51641`, event record `18049`: `iggridselectionactiverowchanged` → `_webUi.Grid.gridActiveRowChanged`.

| Action control | Parameter ID | Structural description |
|---|---|---|
| ListPaneMenuActionCopy (51616) | 26538 | ObjectId is greater than numeric constant 0 |
| ListPaneMenuActionEdit (51617) | 26539 | ObjectId is greater than numeric constant 0 |
| ListPaneMenuActionView (51618) | 26540 | ObjectId is greater than numeric constant 0 |
| ListPaneMenuActionClose (51621) | 26541 | (Status is strictly unequal to unresolved symbol Closed AND PurchaseOrderId is strictly unequal to unresolved symbol NULL) |
| ListPaneMenuActionDelete (51619) | 26542 | PurchaseOrderId is strictly unequal to unresolved symbol NULL |
| ListPaneMenuActionPrintDefaultDocs (51624) | 26543 | PurchaseOrderId is strictly unequal to unresolved symbol NULL |
| ListPaneMenuActionPrintPreviewDocs (51623) | 26544 | PurchaseOrderId is strictly unequal to unresolved symbol NULL |
| ListPaneMenuActionPrintSelectedDocs (51625) | 26545 | PurchaseOrderId is strictly unequal to unresolved symbol NULL |
| ListPaneMenuActionNewLine (51620) | 26546 | (Status is strictly unequal to unresolved symbol Closed AND PurchaseOrderId is strictly unequal to unresolved symbol NULL) |
| ListPaneMenuActionCancelClose (51622) | 26547 | (Status strictly equals unresolved symbol Closed AND PurchaseOrderId is strictly unequal to unresolved symbol NULL) |
| ListPaneMenuActionReceiptFromPO (51626) | 26548 | (ObjectId is strictly unequal to unresolved symbol NULL AND ClosedDateTime strictly equals unresolved symbol NULL AND Lines is greater than numeric constant 0 AND TotalOpenQty is greater than numeric constant 0) |

### Form 2797 / screen 1777

Source grid control `51679`, event record `18070`: `iggridselectionactiverowchanged` → `_webUi.Grid.gridActiveRowChanged`.

| Action control | Parameter ID | Structural description |
|---|---|---|
| ListPaneMenuActionCopy (51662) | 26582 | (PurchaseOrderObjectId is greater than numeric constant 0 AND IsPurchaseOrderClosed strictly equals numeric constant 0) |
| ListPaneMenuActionEdit (51663) | 26583 | PurchaseOrderObjectId is greater than numeric constant 0 |
| ListPaneMenuActionView (51664) | 26584 | PurchaseOrderObjectId is greater than numeric constant 0 |
| ListPaneMenuActionDelete (51665) | 26585 | IsPurchaseOrderClosed strictly equals numeric constant 0 |

## Multi-selection attributes

| Form / screen | Control | Attribute ID | Configured Boolean |
|---|---|---|---|
| 2791 / 1778 | ListPaneMenuActionClosePutawayGroup (51700) | 40809 | false |
| 2791 / 1778 | ListPaneMenuActionOpenPutawayGroup (51701) | 40811 | false |
| 2791 / 1778 | ListPaneMenuActionRenamePutawayGroup (51702) | 40813 | false |
| 2777 / 1781 | ListPaneMenuActionDeleteReceipt (51799) | 40891 | true |
| 2777 / 1781 | ListPaneMenuActionAssignTrailer (51802) | 40900 | true |
| 2777 / 1781 | ListPaneMenuActionNewAppointment (51803) | 40902 | false |
| 2777 / 1781 | ListPaneMenuActionEditAppointment (51804) | 40905 | false |
| 2777 / 1781 | ListPaneMenuActionViewAppointment (51805) | 40908 | false |
| 2777 / 1781 | ListPaneMenuActionDeleteAppointment (51806) | 40912 | true |
| 2777 / 1781 | ListPaneMenuActionCancelClose (51807) | 40913 | true |
| 2777 / 1781 | ListPaneMenuActionCheckin (51808) | 40915 | false |
| 2777 / 1781 | ListPaneMenuActionCreatePreCheckInContainers (51809) | 40917 | false |
| 2777 / 1781 | ListPaneMenuActionCloseReceipt (51810) | 40920 | true |
| 2779 / 1782 | ListPaneMenuActionDeleteContainers (51859) | 40970 | true |
| 2779 / 1782 | ListPaneMenuActionCancelContainers (51860) | 40974 | true |
| 2779 / 1782 | ListPaneMenuActionLocateContainers (51862) | 40977 | true |
| 2779 / 1782 | ListPaneMenuActionUnlocateContainers (51867) | 40983 | true |
| 2780 / 1783 | ListPaneMenuActionDeleteReceiptDetails (51910) | 41026 | true |

## Boundaries and validation

- AST and descriptions describe configured expressions; they do not execute or validate the application's evaluator.
- Closed, NULL, TRUE, True and False remain unresolved symbols. Case is preserved; no coercion or substitution is assumed.
- A predicate with only typed literals still has unproved field types, selection handling and runtime eligibility.
- Multi-selection flags are configured Boolean values, not proof of multi-row behavior, action visibility or permission.
- Only six root Insights contain the 51 captured EnableAction parameters. Absence in the other 11 implementations does not prove absent validation.
- No business rows, stored-routine invocation, API/HTTP requests, mutations, expression evaluation or selected-record runtime tests occurred.
- Raw expressions remain solely in the private LocalAppData assessment area. Original captures and the Receiving configuration map are unchanged.
- Form 166 remains a context association without an active screen implementation; this review does not resolve that limitation.

The parser accepts only whitelisted field identifiers, numeric constants 0/1/100/200, exact lowercase Boolean/null literals, the five explicitly unresolved symbols, comparisons, AND/OR and parentheses. It rejects calls, strings, property/index access, statements, assignments, comments, arithmetic and unknown identifiers. It never evaluates input.

A drift in any source value, parent, name or flag blocks the whole capture from semantic extraction. Offline negative checks cover metadata drift, private-value tampering and out-of-grammar inputs. Source hashes are rechecked before each offline build. Original configuration-map counts remain unchanged; this separate supplement resolves only the bounded extraction task.
