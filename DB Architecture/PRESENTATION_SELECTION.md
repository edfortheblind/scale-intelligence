# Presentation selection and configuration behavior

29 bounded stored-procedure contracts, 29 role records, eight help topics and 16 authored questions. These are source interpretations; UI binding and operational acceptance remain separate.

[Exact contracts](mappings/batches/presentation-selection.json)

| Object | Reviewed purpose |
| --- | --- |
| [dbo.MetaTrans_ApptSchedule](sql/405224844.sql) | Supply the appointment-scheduling presentation seed. |
| [dbo.MetaTrans_SignBOL](sql/1221227751.sql) | Supply the bill-of-lading signature presentation seed. |
| [dbo.MetaTrans_TpmPersonalViews](sql/1269227922.sql) | Supply the personal-view presentation seed. |
| [dbo.MetaTrans_TpmSubmit](sql/1285227979.sql) | Supply the TPM submission presentation seed. |
| [dbo.MetaTrans_CycleCountQuickPlan](sql/453225015.sql) | Prepare cycle-count quick-plan fields from two fixed configuration selections. |
| [dbo.MetaTrans_DbTableInfo](sql/485225129.sql) | Describe columns for the object named by a screen-control attribute. |
| [dbo.MetaTrans_GetCycleCountMasterPlan](sql/565225414.sql) | Prepare cycle-count master-plan defaults from scalar configuration lookups. |
| [dbo.MetaTrans_GetItem](sql/677225813.sql) | Select one item description for an item and optional company context. |
| [dbo.MetaTrans_GetItemsForReceiptFromPO](sql/693225870.sql) | Select positive-open purchase-order lines with the ordinary receipt company predicate. |
| [dbo.MetaTrans_GetItemsForTpmReceiptFromPO](sql/709225927.sql) | Select positive-open purchase-order lines for the TPM receipt presentation. |
| [dbo.MetaTrans_GetLocatingZones](sql/725225984.sql) | List locating-zone codes and descriptions under two fixed coded filters. |
| [dbo.MetaTrans_GetLocationTypes](sql/741226041.sql) | List location types and physical dimensions under a fixed active predicate. |
| [dbo.MetaTrans_GetLocationInventory](sql/757226098.sql) | Return location-inventory context after a shipment-named helper call. |
| [dbo.MetaTrans_GetLookup](sql/773226155.sql) | Return lookup-field definitions and passed warehouse presentation values. |
| [dbo.MetaTrans_GetLotUpdateAffectedInventory](sql/789226212.sql) | Show inventory rows affected by an item/lot context without changing them. |
| [dbo.MetaTrans_GetLotUpdateConfirmation](sql/837226383.sql) | Prepare a lot-change confirmation display from existing lot context. |
| [dbo.MetaTrans_GetMonitoringBuilderModel](sql/869226497.sql) | Supply five monitoring-builder metadata result sets. |
| [dbo.MetaTrans_GetReceiptFromPO](sql/933226725.sql) | Select purchase-order header context for receipt presentation. |
| [dbo.MetaTrans_GetTpmReceiptFromPO](sql/981226896.sql) | Select purchase-order header context for TPM receipt presentation. |
| [dbo.MetaTrans_GetShipmentDetailsForCreateReceipt](sql/949226782.sql) | Select shipment detail quantities for create-receipt presentation. |
| [dbo.MetaTrans_GetShipmentForCreateReceipt](sql/965226839.sql) | Select shipment header context for create-receipt presentation. |
| [dbo.MetaTrans_GetTrailerDetails](sql/997226953.sql) | Prepare trailer-entry context from a receipt header. |
| [dbo.MetaTrans_GetTransferContainer](sql/1013227010.sql) | Supply container-transfer context in three result sets. |
| [dbo.MetaTrans_GetTransferShipment](sql/1029227067.sql) | Supply shipment-transfer context after a security-info helper. |
| [dbo.MetaTrans_GetTransferShipmentDetail](sql/1045227124.sql) | Select joined shipment-header/detail context for a transfer line. |
| [dbo.MetaTrans_ManualReplenishment](sql/1093227295.sql) | Supply a localized manual-replenishment presentation seed. |
| [dbo.MetaTrans_Packing](sql/1109227352.sql) | Prepare packing presentation options, security display values and two configuration lists. |
| [dbo.MetaTrans_SinglesPacking](sql/1237227808.sql) | Supply the singles-packing presentation seed and localized label. |
| [dbo.MetaTrans_WorkOrderComponentAllocation](sql/1333228150.sql) | Select work-order component allocation context. |

## Presentation defaults and business actions

These reviewed routines return presentation defaults and sometimes a localized label. They do not schedule an appointment, save a signature, submit work, replenish inventory or pack a unit.

1. Identify the presentation seed returned by the body.
2. Use separately evidenced action routines and application bindings to establish what an operator action executes.

## Cycle-count presentation configuration

Quick-plan setup assigns variables from matching configuration rows; duplicate matches have no defined selection order. Master-plan setup uses scalar subqueries, which fail on duplicate matches. Missing coded flags become false BIT values, while neither routine creates a plan.

1. Distinguish assignment lookups from scalar subqueries.
2. Check the exact configuration selector and conversion without assuming a warehouse-specific value.

## Receipt context and company selection

No. Ordinary PO lines use profile authority, company membership and a NULL-company alternative. TPM PO lines omit those checks. Shipment details use membership independently of a restricted profile mode and include NULL or coded-sentinel companies. Header selectors have no user authorization predicate; none creates a receipt.

1. Identify which header or line selector is used.
2. Compare exact predicates; a supplied username alone does not establish authentication.

## Lot-change previews and confirmation

The preview lists matching inventory and the confirmation returns existing lot context with supplied before/after values. Neither changes inventory nor validates the proposed change. Company and lot NULL matching differs between the inventory preview and the outer lot confirmation.

1. Use location NULL or the coded sentinel to select the broad preview branch.
2. Check matching lot context before interpreting the confirmation values.

## Transfer presentation results and helper calls

These bodies select context. Two call a shipment-security-info helper before selecting; the inventory getter passes its location-inventory identifier to that helper. The call alone does not prove valid identifier mapping or enforced authorization, and no direct transfer mutation occurs.

1. Read helper arguments and account for callee result sets separately.
2. Distinguish empty joins, missing scalar status labels and the returned presentation row sets.

## Packing preference and checkpoint display

No. The fallback applies to a NULL preference inside an existing profile row. A missing row makes the scalar result NULL, which leaves packing options unassigned if no preference matches. Checkpoint values are displayed separately; this routine does not pack, close or print.

1. Resolve the profile row and packing-preference selection.
2. Inspect checkpoint display values and the two generic lists separately from action enforcement.

## Item, lookup and monitoring selection boundaries

The item selector uses unordered TOP 1 across exact-company and NULL-company matches. Monitoring suggests MAX(form ID)+1 without reserving it. Lookup warehouse values are returned without filtering. Missing receipt context still returns a trailer seed row, and work-order allocation context does not allocate inventory.

1. Check each selector and returned row count.
2. Establish reservation, authorization and later mutations through separately reviewed callers.

## Screen attribute and object-column description

The routine resolves an object type, then uses either a first-result-set metadata function or INFORMATION_SCHEMA.COLUMNS. The fallback filters TABLE_NAME without TABLE_SCHEMA and has a different result shape. It describes metadata; it does not execute the described business routine.

1. Resolve the configured screen attribute and object identifier.
2. Use the branch-specific output shape and account for metadata visibility and schema naming.

## Evidence limits

Complete retained body structures were read and compared with the private-original redaction and catalog fingerprints. Literal labels remain opaque. Helper effects, application callers, live permission enforcement, effective settings and whole-process time are not inferred. Independent review is separately scoped in the current project receipt.
