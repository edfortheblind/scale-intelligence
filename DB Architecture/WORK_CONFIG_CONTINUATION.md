# Work and configuration continuation

The current replica is documented as-is under owner attestation. This batch reviews 106 complete procedure bodies. It explains configuration, display models, analytics and work mutations without executing them.

19 thematic help topics and 38 authored questions accompany 106 new procedure contracts; no table-role credit.

## User explanations

### Why adding a default configuration may leave an existing value unchanged

Most reviewed configuration helpers insert only when their own duplicate key is absent. They preserve existing rows. Their keys differ, and the operational-goal helper inserts without a duplicate check. Registering a job, report, alert or interface does not run it.

1. Identify the relevant configuration object and its exact duplicate key.
2. Separate storing a setting from running the configured action.

### Why a blank configuration key can allow another insertion

A blank or NULL key is not handled consistently. Accessorial external symbols and alert descriptions use ordinary equality, which does not match NULL to NULL. The required-interface-field helper even uses different replacements for the two NULL values. Report subreports and mobile-menu parents have different, explicit matching rules.

1. Check whether the supplied value is missing, empty or an actual identifier.
2. Use the specific helper contract before treating an insertion as safely repeatable.

### What the shipping-load serial archive helper actually does

The helper copies the initially matching serial rows, then repeatedly selects and deletes currently matching live rows in batches. Those are separate steps. The source does not establish one protected snapshot for the whole move.

1. Distinguish initial copied rows from later delete eligibility.
2. Use an approved operational workflow for archive work; this documentation performed no archive.

### How customized-screen activation and removal choose related screens

Activation changes the selected screen, changes one other screen in the same form, then finishes the selected flag. The other-screen lookup expects at most one row. Removal deletes a selected non-system hierarchy and then activates system screens for its form. None of these bodies provides rollback for the whole sequence.

1. Check the form and screen identities together.
2. Keep screen activation separate from deleting its controls and layout hierarchy.

### Why a detail model can contain defaults or more than one matching definition

These helpers prepare display data. Item UOM lookup can return both default-company and company-specific rows. Lot attributes combine a template with stored values, and live versus archived lookup paths differ. Mobile-menu descendant counts include lower levels, but do not include the selected parent.

1. Identify the selected item, company, lot or menu identity.
2. Read defaults and display counts as query results, not changes to operational records.

### How dashboard visibility and available choices are prepared

Dashboard and receipt-workbench routines return templates, flags and available choices. Some missing checkpoint values default to allowing a tile. Receipt-workbench authorized preferences are used for one fallback selection, while its returned preference list includes all preferences. A displayed choice is not proof that the caller can successfully perform the action.

1. Distinguish the returned visibility flag, the choice list and the action itself.
2. Inspect the exact checkpoint or preference source for a specific screen.

### What the close-container model can explain

This routine reads a container and its shipment, proposes container-count numbers and returns a carrier-change restriction after finding a previously closed-status container. It does not close the current container. A cause for a container that remains open needs the actual action and its current error or state.

1. Check the displayed count proposal and carrier restriction separately.
2. Use the actual close action and exact message to investigate an open container.

### Why an employee list can differ between users

The employee list always requires active users and can filter by supervisor. When both the SaaS and feature settings are enabled, it also applies a caller-email category rule. A supplied user that cannot be found can therefore produce an empty restricted list.

1. Check whether the supervisor filter is supplied.
2. Keep the feature-controlled email rule separate from employee activity status.

### Why inventory adjustment or transfer screens can show blank defaults

Inventory model routines use different selectors. Some aggregate optional filters when the internal identity is zero; others choose a single minimum identity for a license plate. Mixed values become blank, and several warehouse or destination variables are never assigned. These are screen defaults, not stock changes.

1. Identify whether the request used an internal ID, a license plate or optional filters.
2. Do not interpret a blank aggregate field as proof that all underlying records have that blank value.

### How analytics extracts select time and status ranges

Activity extracts use timestamps greater than the start and up to and including the end. Shipment extracts instead use modification timestamps and a fixed trailing-status range. Detail and container extracts can include rows after a header change. These read queries do not measure a complete business process or make an export exactly once.

1. Compare the relevant activity or modification timestamp with the requested interval.
2. Keep dataset-specific joins and status filters when reconciling counts.

### Why an analytics event can appear more than once

Several extracts join one event to optional item, labor or appointment rows. More than one matching row can multiply an event. The location snapshot also returns per-unit measures under total-named columns, and parent-container quantity is summed from tree-unit membership.

1. Check the exact join keys before comparing row counts with unique events.
2. Distinguish a total from a per-unit value and from a tree aggregate.

### How work-verification controls are derived

Work screens combine profile settings, location verification and security checkpoints. Missing special handling uses a fallback row. The captured general configurator has a positional mismatch in three fallback controls, so its returned labels and values need careful interpretation. These models do not execute warehouse work.

1. Identify the profile sequence, location and special-handling ID.
2. Distinguish configured controls from enforcement by the actual action.

### How cart selection differs from spot assignment

Cart building selects eligible work/container tuples by priority and zone order, then calls the assignment helper. That helper has a tote-and-work-unit path that updates work without calling the spot routine. The cart builder uses a transaction, but its error path contains no explicit rollback handler.

1. Identify whether assignment used the tote/work-unit path or container path.
2. Check container identity and profile sequence when interpreting selected cart spots.

### Why a single work-unit match can bypass profile filters

The work lookup first counts matching work units. Exactly one eligible name takes a branch that does not add the hold or profile work-type restrictions used for multiple matches. The final header query also selects by work-unit name, so its scope is broader than the eligibility subquery.

1. Check whether the first lookup found exactly one work-unit name.
2. Review hold, profile and warehouse rules in the branch actually used.

### What work-created flags do and do not prove

The small work-created helpers set flags; they do not create or verify instructions. The broad work writers insert or replace caller-supplied fields. Header updates and renames can affect every matching work-unit name without a warehouse restriction.

1. Separate a request flag from the presence and condition of its work instructions.
2. Use exact internal identities and scope when interpreting a broad work-unit update.

### How work moves into inactive storage

The shipping-load path selects qualifying closed work, while the work-unit path copies all matching instructions regardless of condition. Both copy an explicit field set and then delete live rows separately. Their stored fields omit some newer work metadata.

1. Distinguish load-qualified deactivation from name-based work-unit deactivation.
2. Treat the copy/delete sequence and its field list as part of the source contract.

### Why a failed split may already have created a new instruction

The split helpers clone the original before checking whether the relevant side quantity can cover the requested split. A later failure has no local rollback. The original and clone also retain different from/to quantities depending on the mode.

1. Check the selected split mode and source versus destination quantity.
2. Treat a failed return as a reason to inspect the authorized workflow state, not to repeat blindly.

### How full, partial, short and overpick updates differ

Full confirmation can move all of one side quantity even when the requested quantity is smaller. Partial confirmation subtracts only the request. Short and underpick rescale totals; overpick has a branch that rescales totals without replacing total quantity. Parent recalculation then sums all children and uses the summed from/to quantities for completion.

1. Identify the confirmation path and compare its from/to/total quantity effects.
2. Check the detail and parent separately after a reported failure.

### How work confirmation advances related record status

Status advancement dispatches by the supplied instruction type. Shipment, receipt, work-order and dock paths use different quantity, mode and configuration rules. The captured batch-status procedure contains only its declaration and comments; its name does not establish a batch update implementation.

1. Identify the instruction type, confirmation mode and related record identity.
2. Keep a configured next status separate from a completed end-to-end workflow.

## Complete reviewed contracts

### dbo.dbc_IAccessorialDetail

Add a rating accessorial detail when its external symbol is absent.

Insert supplied fields into ACCESSORIAL_DETAIL only when no row matches rating ID, rating service, accessorial code and EXTERNAL_SYMBOL. Existing rows are not updated. Parent starts at zero; a non-NULL parent subcode selects TOP 1 matching subcode/rating/service/code and a coded VALUE_TYPE with no ORDER BY. No parent match retains zero. Subcode, value type and header ID are absent from the duplicate guard. A NULL external symbol never matches an existing NULL through equality. UTC timestamp; fixed system/user stamps; supplied process stamp.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/1676181367.sql), lines1–110. Reading SHA256 `78eb05468fa01a92748ff6249411b4d5b604f93ee3efb8d017cc09b2bd837fb5`. Original definition SHA256 `30a9512cebca3ec8abb1232e91cf7a7ff220e1eb6afe42691f87e6fdc728712a`.

### dbo.dbc_IAccessorialHeader

Add a rating accessorial header.

Insert supplied fields into ACCESSORIAL_HEADER only when no row matches rating ID, rating service and accessorial code. Existing rows are not updated. Copies application flags, always-apply and user fields; fixed system-created marker, caller user/process stamps and UTC timestamp. It does not create detail rows.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/1692181424.sql), lines1–78. Reading SHA256 `1060948268cc9f29fef793fcbe43b11604f204b2dbe291d5e8c54554764a607e`. Original definition SHA256 `dc265d59188d51c51a8d2a1e1554eba56cc7138b4dd064969143e14ad513ca22`.

### dbo.dbc_IAdjustmentType

Register an inventory adjustment type and its configuration.

Insert supplied fields into ADJUSTMENT_TYPE only when no row matches adjustment type. Existing rows are not updated. Copies active/class/frozen/work/upload flags, min/max quantity, work master and RF initiation method without validating ranges. UTC and fixed user stamp; no inventory or work is changed.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/1740181595.sql), lines1–89. Reading SHA256 `378e167d678692adb6cdecf64a7c8d6458a30b788e25b091e7552190b93a7c0c`. Original definition SHA256 `fbf7213772090f62d947c646c58b424806ca542c97d1ddabffe1bfd6d1f1a74f`.

### dbo.dbc_IAppIdentifier

Register a barcode application identifier format.

Insert supplied fields into APP_IDENTIFIER only when no row matches APP_IDENTIFIER. Existing rows are not updated. Copies decimal marker, mapped field, title, ASCII separator, length/type, UOM and user fields; fixed system/user markers and UTC. No barcode parsing or mapped-field execution occurs.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/2055326732.sql), lines1–74. Reading SHA256 `b074bc3ed1e0924edf052ccc885487b924b68815e5cced152cbb70b981484281`. Original definition SHA256 `48b9be94867337567acf7c7e0a7064d5ba85040c807344f2523839b2f55462e0`.

### dbo.dbc_IArchivePreferences

Register archive preferences without running an archive.

Insert supplied fields into ARCHIVE_PREFERENCES only when no row matches ARCHIVE_ID. Existing rows are not updated. Copies retention days, data filter, data-object path, prior archive time, run/save flags and metadata; active and system-created are fixed coded flags. UTC and fixed user stamp. NOCOUNT is not set; no retention or date validation.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/1772181709.sql), lines1–85. Reading SHA256 `95c44d916b2f70b8c3c6db819fcaa7df4fce5649f78e2b992979c534fa5c7d82`. Original definition SHA256 `00009d469009ab5c8f5fdbb05a78be5a834ad3e0998c91649ac4c63cd0ae7689`.

### dbo.dbc_IArchiveSerialNumbersInShipLoad

Copy shipment-load serial numbers to archive and delete qualifying live serials.

Insert SN.* into AR_SERIAL_NUMBER through serial-to-container-to-shipment-to-load joins, restricted to the supplied internal load ID. Only if the initial INSERT affects rows, repeatedly delete up to 500 currently matching live serial IDs until a delete affects zero. TOP 500 is unordered and the eligibility query is rerun every iteration.

Outputs: No result set, OUTPUT identity or explicit return protocol; NOCOUNT ON.

Limits: The archive insert and later deletes are not one explicit transaction. Concurrent new qualifying serials can enter later delete batches without having been in the initial copied set. Repeated calls have no archive duplicate guard. SELECT SN.* depends on positional archive/live schema compatibility; NULL load ID matches no rows. No TRY/CATCH or explicit error checks.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/1788181766.sql), lines1–35. Reading SHA256 `727664c3b4275e80d28ee6b6cb3b15924f7e53c8ac2b217d2a554158e58f56b2`. Original definition SHA256 `1f6f9993d62909fe8faeaad3b5756fc59b62daf4ff44106ca70b6e6d5842287b`.

### dbo.dbc_IArchiveTables

Register a table archive row-limit setting.

Insert supplied fields into ARCHIVE_TABLES only when no row matches TABLE_NAME. Existing rows are not updated. Copies MAX_ROWS and user/process fields with UTC and fixed user stamp. It stores configuration only; no table archive is performed and no positive limit check occurs.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/1804181823.sql), lines1–56. Reading SHA256 `8b9167d41b5aaa699439965d4f6d052d1a65378841bbd20066ae28fcd5f4e03d`. Original definition SHA256 `bb97fe058ffd05712006aa2b1c2a663dd121a93b680b9b88d05c03cae1608eda`.

### dbo.dbc_ICarrierEDIReference

Register a carrier EDI reference and its localized resource text.

Insert supplied fields into CARRIER_EDI_REFERENCE only when no row matches rating ID and symbol with CUSTOMER and SHIP_TO both NULL. Existing rows are not updated. First return when RATING_ID does not exist. Customer and ship-to are always NULL. After the guarded insert, call dbc_IResourceFileBase with a fixed resource group and supplied key/text/process stamp even when the reference already existed. Child result sets/errors can propagate; no child return is captured.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/1898802172.sql), lines1–84. Reading SHA256 `8df247ca9299ca06a615ed87c9b74499584e33bc187ba35bee8ab09fec5988b4`. Original definition SHA256 `a810a557241c5b28b04920cded471aa87a1891125c63e4700cc0d45789dd54ec`.

### dbo.dbc_IDocument

Register document layout and printer metadata.

Insert supplied fields into DOCUMENT only when no row matches DOCUMENT. Existing rows are not updated. Copies template/type, international/batch/nested-container/language choices and label/driver/stock fields, UTC and fixed system/user markers. It does not render, print or validate the referenced template.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/1868182051.sql), lines1–92. Reading SHA256 `e139027f8ac43f757460ccd26e06afe8b91ccb3668764e3c274b22c9f58e283a`. Original definition SHA256 `2d40e9aa8b2a9162d41b24d5c0460bab7a9d3d556dc45e0e7a6aee33c4689663`.

### dbo.dbc_IDocumentType

Register a document type and its data/print handlers.

Insert supplied fields into DOCUMENT_TYPE only when no row matches DOCUMENT_TYPE. Existing rows are not updated. Copies classification, preview/default flags, data/detail sources, generator and five print-procedure names. UTC and fixed system/user markers. Stored procedure names are stored as data, not invoked here.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/1930802286.sql), lines1–101. Reading SHA256 `fd78904ea6381ef9a853ebf37a75dae1b18cf350a647bbaeecf6b7babf305855`. Original definition SHA256 `55cfb5b0a0a1e61ad63b3525a92bd9cfbca45fd5633256d6dd4946d2a21b8ccc`.

### dbo.dbc_IGenericAddressHeader

Register a generic-address record category.

Insert supplied fields into GENERIC_ADDRESS_HEADER only when no row matches RECORD_TYPE. Existing rows are not updated. Copies description and user/process fields; UTC and fixed system/user markers. No address detail or external address lookup is created.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/2028182621.sql), lines1–58. Reading SHA256 `139b8cb9d58fbe2b7f3a883430de40c5aa703f5f2a9200e233ddf8c1d9014a95`. Original definition SHA256 `c569e01cce5927c877e7a75a6f9ce018db62cd61e8229cba80a0e66bbf3e1c76`.

### dbo.dbc_IInterfaceDataMapDetail

Register one field position in an interface data map.

Insert supplied fields into INTERFACE_DATA_MAP_DETAIL only when no row matches MAP_NAME and POSITION. Existing rows are not updated. Copies field name/length and all user fields. User fields have no declaration defaults here. Duplicate identity ignores field name/length. UTC and fixed user stamp; no mapping execution.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/2044182678.sql), lines1–63. Reading SHA256 `f47bb0d000c107ef3912f5893f333fd095d62103dd87c8bb67e4c993c213c37f`. Original definition SHA256 `f529ba8181720b6d99f1f3fc92174ee9ba424240c1065d0716daf1605248f909`.

### dbo.dbc_IInterfaceDatamapReqFields

Register a required interface field or record-level requirement.

Set POSITION to 1 for NULL FIELD_NAME, otherwise 0. Insert supplied requirement/user/process fields with UTC and fixed user stamp only when record type/action and the ISNULL comparison find no match. Private review establishes the stored-column NULL sentinel differs from the parameter NULL sentinel. Therefore two NULL field names do not compare equal through this guard; it is not NULL-aware deduplication. Existing rows are not updated. NOCOUNT is not set.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/2060182735.sql), lines1–71. Reading SHA256 `fe9f44192031062fb3e6b61b99c24a80bfd1858e90b8dbc9cc9c380936706bf5`. Original definition SHA256 `00c4d0c5e031440cef28880a9649d00ad23e711e9f77e0c7a869f7dde94024a8`.

### dbo.dbc_IInterfaceDetail

Register an interface detail processing configuration.

Insert supplied fields into INTERFACE_DETAIL only when no row matches DTL_KEY_NUM. Existing rows are not updated. Copies active/events/extensions/header/mode/process/limits; encoding defaults 1 and managing-app 0. A coded save-processed-data default is retained in declaration. Parameter dataSourceBatchFile is written to DATA_SOURCE_BATCH_SIZE. UTC, fixed system/user markers. No event or interface work is executed. Private default review confirms save-processed-data defaults to the negative flag.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/2076182792.sql), lines1–104. Reading SHA256 `8234f771238f3cc1c0626c0b9df438f8f0578720d07d35edb634f4520a88867e`. Original definition SHA256 `ea8594c5c9f1e4a0aef0cc24bf9c89801895c20d29a1ea027cdff306b277762b`.

### dbo.dbc_IInterfaceHeader

Register an interface header configuration.

Insert supplied fields into INTERFACE_HEADER only when no row matches HDR_KEY_NUM. Existing rows are not updated. Copies description/user/process fields, UTC and fixed system/user markers. No interface details or processing run are created.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/2092182849.sql), lines1–58. Reading SHA256 `4f1a4a76431a46c696800db33a53262d304fd56d700d2724038796201ddf1362`. Original definition SHA256 `13234b29dcf17ba5c456c0c9263a16cfdacbfea56209b722658b2d798f3c0330`.

### dbo.dbc_IMultiSegmentMappedFields

Register a multi-segment application-identifier field mapping.

Insert supplied fields into MULTI_SEGMENT_MAPPED_FIELDS only when no row matches APP_IDENTIFIER, MAPPED_FIELD and SRC_IDENTIFIER. Existing rows are not updated. Copies auto-execute/auto-fill/remove-AI/system-created caller flags with coded defaults, description and user fields. UTC and fixed user stamp. It stores flags; it does not automatically execute a mapped action. Private defaults: auto-execute, auto-fill and remove-AI are negative; system-created is affirmative.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/56699600.sql), lines1–79. Reading SHA256 `3174b8297b5f00c7b2dcada9710cff17f08e7a21b0f50e1842cebe6f40137050`. Original definition SHA256 `cc3f4571cf7bcec6c84ed1569e3f41a225318f32634b0213d054d56024593938`.

### dbo.dbc_INextNumber

Initialize a next-number sequence configuration without allocating a number.

Insert supplied fields into NEXT_NUMBER only when no row matches NEXT_NUM_KEY. Existing rows are not updated. MAX_VALUE defaults 999999999, MIN_VALUE and NEXT_NUM default 1, but all three parameters are nvarchar(25). No numeric range or min/max ordering validation. Copies UTC and fixed system/user markers; existing counter is preserved.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/72699657.sql), lines1–66. Reading SHA256 `d3045c7370191726b9250afc3560a78fa24d5b349a0b25e00d75a55a75882947`. Original definition SHA256 `0bbae409bfa741021582d105da7e00d8990cb9725ec93712369549e7166f1efc`.

### dbo.dbc_IOperationalGoal

Insert an operational goal configuration.

Unconditionally insert active/calculation/direction/value/start/display-order fields, optional large-text and stored-procedure references, optional warehouse and user fields into OPERATIONAL_GOAL; set UTC and a fixed user marker.

Outputs: No result set or OUTPUT identity; NOCOUNT ON.

Limits: There is no NOT EXISTS guard, unlike many neighboring seed helpers: repeated calls attempt additional rows. StoredProcedure is stored, not executed. NULL warehouse is accepted as an assignment, not interpreted as runtime all-warehouse authorization. No explicit error handler, validation or transaction.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/104699771.sql), lines1–83. Reading SHA256 `66b849210bb412e31b41c2e6ffdf8d11e5bb82a2fa099aff223106ec15dce03a`. Original definition SHA256 `57db1b90d903597414c8b3204c20578bf548ef7a0363b87907bba53305d889fb`.

### dbo.dbc_IPmChartdata

Register a performance-chart data source configuration.

Insert supplied fields into PM_CHARTDATA only when no row matches SEQUENCE. Existing rows are not updated. Copies chart type, date/group/select columns, procedure/table/title and process stamp, UTC and fixed user stamp. It does not query the named table or execute the named routine. Duplicate guard ignores chart type/title.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/120699828.sql), lines1–52. Reading SHA256 `88a2ff73410f201d1df27fa70a804affc448b6da4adac7c1b85cc49dcba7b853`. Original definition SHA256 `9482d51ed991cbf519190ebc410ac655f2901aeed04ee564a4c267d3058f2867`.

### dbo.dbc_IRatingId

Register a rating identifier and carrier behavior flags.

Insert supplied fields into RATING_ID only when no row matches RATING_ID. Existing rows are not updated. Copies active/carrier/server identifiers and EDI/manifest/shipment-rating/container-close flags. UTC and fixed system/user markers. It performs no rating, EDI transmission, manifest close or container update.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/184700056.sql), lines1–78. Reading SHA256 `682ccfc74a0745f7b917d9fd19f278b31a4e77610d34558480c2deee36996340`. Original definition SHA256 `2c68e92f1b4979aa526903d98fe13fe981fb66b72a5751bde6c7786f21f3a593`.

### dbo.dbc_IRatingService

Register a service under a rating identifier.

Insert supplied fields into RATING_SERVICE only when no row matches RATING_ID and RATING_SERVICE. Existing rows are not updated. Copies active/service symbol/user/process fields with UTC/fixed user marker. No explicit parent-rating existence check appears in this body.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/200700113.sql), lines1–62. Reading SHA256 `48f25afd9be97d64f17393891b95387450f50e6322eb81eb3ede42a2b339a389`. Original definition SHA256 `35fa46a60297de319df84ae0b6f94cb67bc674c73c46ec301bc2827fc56e2b2c`.

### dbo.dbc_IRatingServiceAction

Register a rating-service action descriptor.

Insert supplied fields into RATING_SERVICE_ACTION only when no row matches OBJECT_ID. Existing rows are not updated. Uses caller OBJECT_ID rather than generating/returning an identity; copies description/request-response schema names, UTC and fixed user/system markers. No service action is executed.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/216700170.sql), lines1–42. Reading SHA256 `9642839aac3f004efbdbb0733d6084c0350df1852c1731959ccbd53b8b569558`. Original definition SHA256 `70e1b6bae0f7a3da8411542384c42789593a85734aa28bb35c747b648a956817`.

### dbo.dbc_IReportConnection

Register document-to-report retrieval metadata.

Insert supplied fields into REPORT_CONNECTION only when no row matches DOCUMENT, TABLE_NAME and SUBREPORT_NAME normalized by a coded NULL sentinel. Existing rows are not updated. Copies class/routine names and user fields; numeric user fields default zero. UTC and fixed user stamp. It stores a retrieval binding; it does not execute that routine or prove a runtime caller binding. Private review confirms the two NULL-subreport sentinel values are identical.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/232700227.sql), lines1–69. Reading SHA256 `fdce3dd52521dfd24557f190a7f3258103d0ec07f369bd236640c672247a4691`. Original definition SHA256 `af8a3d8654319f8bbb15ae6b75e618102d218a301f12bc23228228e3229ddd47`.

### dbo.dbc_IScheduledJobs

Register a scheduled job configuration.

Insert supplied fields into SCHEDULED_JOBS only when no row matches JOB_NAME and RECORD_TYPE. Existing rows are not updated. Copies parameter data, days/time windows/frequencies, next/last run timestamps and active/system flags exactly from callers. minFrequence maps to MINUTES_FREQUENCY. UTC and caller user/process stamps; no schedule calculation, validation or job launch.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/248700284.sql), lines1–97. Reading SHA256 `791790e5e81daa1c66142c0c40eb60a9ed06836fe02ee8c027c62d577bb7a026`. Original definition SHA256 `5ac85918ae985fa52f2e3687b152e4c8f840610dba941c523b5ba2e30d308879`.

### dbo.dbc_ISlottingItemUpFields

Register a slotting item-upload field definition.

Insert supplied fields into SLOTTING_ITEM_UP_FIELDS only when no row matches SLOTTING_FIELD. Existing rows are not updated. Copies nullable field position, ILS field, default, decimal positions and length, UTC/fixed user stamp. NULL slotting-field identity does not deduplicate existing NULL rows. No upload occurs.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/424700911.sql), lines1–69. Reading SHA256 `c854f3055ab325f074b3af1c0aecb74ccfc56875dfc3c2a159207dcbab9c05aa`. Original definition SHA256 `c29851e3e1e052c67c9855291739890018652a6244e34eb6aea3697bac56d88e`.

### dbo.dbc_ISlottingLocUpFields

Register a slotting location-upload field definition.

Insert supplied fields into SLOTTING_LOC_UP_FIELDS only when no row matches SLOTTING_FIELD. Existing rows are not updated. Copies nullable position, ILS field, default, length/decimal positions and user fields with UTC/fixed user stamp. No field/range validation; NULL identity bypasses equality deduplication. No location data is uploaded.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/440700968.sql), lines1–68. Reading SHA256 `1cb0a03fe36df2c334a7ad6e0681e73b84d8ed8f9ec48c01ba309e8a08612904`. Original definition SHA256 `3af468b9852873f365ac43144df463cb375ab5aefe43b33d04be882d667a1fd8`.

### dbo.dbc_ISlottingMovesDownFields

Register a slotting move-download field definition.

Insert supplied fields into SLOTTING_MOVES_DOWN_FIELDS only when no row matches SLOTTING_FIELD. Existing rows are not updated. Copies position/ILS field/decimal/length/start-position; these parameters have no defaults. Numeric user fields are numeric(14,5). UTC/fixed user stamp. No move or download is performed.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/456701025.sql), lines1–73. Reading SHA256 `235ca09beab6deee716e6285bd0423d5f0898d013d87d3ba34f1ba266e8995e0`. Original definition SHA256 `85ef82443c9ad47bd3552b701f69f79e5876c6321a0ca09d651f167310e2c17d`.

### dbo.dbc_ISlottingWarehouseUpFields

Register a slotting warehouse-upload field definition.

Insert supplied fields into SLOTTING_WAREHOUSE_UP_FIELDS only when no row matches SLOTTING_FIELD. Existing rows are not updated. Copies nullable mapping positions, lengths/defaults and user fields with UTC/fixed user stamp. No warehouse restriction or upload is executed; NULL key equality cannot match an existing NULL.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/472701082.sql), lines1–69. Reading SHA256 `1faa9766aab69391e1ee0b9ad304c2bcf97d7216bc263758a4449a7fa9c691bf`. Original definition SHA256 `2670044a38d49e9a148592a01217b7afde73a0c9a47e8842ac8fb5616d93979c`.

### dbo.dbc_IWarehouseAlert

Register a warehouse alert definition.

Insert supplied fields into WAREHOUSE_ALERT only when no row matches ALERT_TYPE, ACTION and DESCRIPTION. Existing rows are not updated. Copies active/message/title/email-template/priority/web-description and user fields with UTC and fixed system/user markers. Description defaults NULL but duplicate comparison uses equality, allowing repeated NULL-description attempts. This routine sends no alert or email.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/2090802856.sql), lines1–79. Reading SHA256 `e730b61fcd67079cb59682615a3f93de29012c8c80756d522f0fb0d0620873e6`. Original definition SHA256 `e399d7ae47e3c1ca2cdba17f5e4eb29affa80d156ab6eda789966abd922ba30d`.

### dbo.dbc_IWarehouseAlertType

Register defaults for a warehouse alert type.

Insert supplied fields into WAREHOUSE_ALERT_TYPE only when no row matches ALERT_TYPE. Existing rows are not updated. Copies multiple-alert flag/default action/priority/template, dynamic-calling identifier and titles/descriptions with UTC/fixed user stamp. It stores a dynamic identifier without invoking it.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/2106802913.sql), lines1–75. Reading SHA256 `c6c2735ed3fe70d4162f4d7b1e6a8019dec67367a20069ccfa6223988daa97d7`. Original definition SHA256 `5575cd4997943655b8269495a4ac15ac15b303348e5ebdd41d28671e7e0a89bb`.

### dbo.dbc_IWarehouseMobileMenu

Register a mobile menu option under a parent.

Insert supplied fields into WAREHOUSE_MOBILE_MENU only when no row matches MENU_OPTION_NAME and explicit NULL-aware PARENT_OBJECT_ID. Existing rows are not updated. Copies form/source/authorization/submenu/resource/order/active/system/user fields. DATE_TIME_STAMP uses GETDATE(), unlike UTC in adjacent helpers. No permission evaluation, form launch or parent existence check occurs. System-created defaults to the affirmative flag.

Outputs: No direct result set or OUTPUT parameter. No inserted identity is returned.

Limits: Ordinary key equality is NULL-sensitive unless explicitly described. No explicit transaction, locking, duplicate-race prevention or error handler; target constraints and SQL errors still apply. A skipped insert is not reported as an error.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/384720423.sql), lines1–81. Reading SHA256 `e5f734ccaba6d55dde9bf8d0f06f7260641a2665f0b98deb3389cfa7fccc3b89`. Original definition SHA256 `0e0fbf8cb288b2a515505d62f7a5ad665647eec6f6a4ce9422260f176e30568d`.

### dbo.META_ActivateCustomizeScreen

Activate one customized screen and deactivate its other form peer.

Read FORM_ID for the supplied screen. Write its ACTIVE flag to an intermediate value; set the one other screen with the same FORM_ID inactive through a scalar subquery; then mark the selected screen active.

Outputs: No row set, OUTPUT or explicit return protocol; row-count messages are not suppressed.

Limits: More than one other same-form screen makes the scalar subquery fail after the first update. No peer yields no peer update. NULL/missing ID leaves form NULL and no matching writes. No transaction, error handler, system-created check or permission check; partial intermediate state can remain.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/229224217.sql), lines1–42. Reading SHA256 `cc53e6087d29e45fb1629b26140d35bf6ee3adacf531a9181bf5f4bb20eae6b2`. Original definition SHA256 `18d55ff7c62e3d85ca800cd56a176fbddeb24cd8b343db99648f25d21d5b6167`.

### dbo.META_DeactivateCustomizeScreen

Deactivate one customized screen and activate its other form peer.

Read FORM_ID; mark the selected screen with an intermediate flag, activate the scalar-selected different screen in that form, then deactivate the selected screen.

Outputs: No direct row set or OUTPUT; no explicit return or NOCOUNT.

Limits: The other-screen scalar subquery requires at most one row. Multiple peers can error after the intermediate write. Missing/NULL ID does not match. No transaction, caller permission or system-created validation.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/245224274.sql), lines1–45. Reading SHA256 `bef28c04757a1b930723d3073131684da95aa4c0388dc85bfe23d9610f722239`. Original definition SHA256 `0f221cb833a3a6382f1c3d359e701824fddb6d030acb9fdd06a29ecd9889e5e8`.

### dbo.META_DELETECUSTOMIZESCREEN

Delete a selected non-system screen hierarchy and reactivate system screens for its form.

Read selected FORM_ID. In order delete control-event parameters, control events, control attributes, control grid columns, controls, group columns, groups, part searches, parts, screen-license links and the screen. Every delete anchors the exact selected screen/form and SYSTEM_CREATED not affirmative. Finally activate every affirmative system-created screen with that form ID.

Outputs: No result set, OUTPUT or explicit return; no NOCOUNT.

Limits: NULL SYSTEM_CREATED fails the inequality and is not deleted. No explicit transaction, rollback or error checks protect the multi-table sequence. Final system-screen activation is attempted even if selected screen was system-created and all deletion guards skipped. The body does not discover arbitrary foreign-key dependents or prove current permissions.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/261224331.sql), lines1–304. Reading SHA256 `a09c4e128cf2c2038b7363b9daa654df41974fe11a459de027a97f3c749fc64f`. Original definition SHA256 `eb82118af46b6d600918a36376f42710315a5fd9efebc07a117c69e2bd39008f`.

### dbo.MetaDetail_GetBOMComponents

Prepare bill-of-material component rows for a work-order screen.

Select BOM details by internal header ID; multiply per-item needed quantity by caller header quantity for both converted/original need. Emit zero used/on-hand/work-order/allocated values, NULL lot/immediate-needs note, source location/UOM/level. Synthetic line number is negative ROW_NUMBER over BUILD_SEQUENCE; final rows order by BuildLevel then BuildSequence.

Outputs: One result set: BuildSequence,Item,Company,ItemDesc,TotalConvertedQtyNeeded,TotalQtyUsed,OrigTotalQtyNeeded,OnHandQty,Lot,FromLocation,ImmediateNeedsNote,InternalWorkOrderNum,InternalWorkOrderLineNum,Allocated,ConvertedUm,BuildLevel.

Limits: No stock lookup or work-order insert occurs. NULL quantity propagates; NULL header matches none. Sequence ties have no unique tie-breaker; synthetic numbering order differs from final level ordering. No explicit transaction/error handling.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/293224445.sql), lines1–37. Reading SHA256 `0f80e6b0b12ff9cb66ede711fd697ae52b6ce8877f05ec043e61878ff6caf8b0`. Original definition SHA256 `c8c6f655e79382139ef66d8f0b80ddd54bfa6978a363f3a9323b665ccdac7b7f`.

### dbo.MetaDetails_GetITEMUOM

Return item UOM definitions for a selected or default company.

Select UOM rows matching item and either supplied company or NULL company. This returns both company-specific and default rows when both exist; it is not a preferred-row fallback.

Outputs: One unordered result set in exact order SEQUENCE,QUANTITY_UM,CONVERSION_QTY,LENGTH,WIDTH,HEIGHT,WEIGHT,MOVEMENT_CLS,INTERNAL_ITEM_UM.

Limits: Both parameters default NULL; NULL item matches nothing, NULL company selects default-company rows. No TOP/DISTINCT/order/active/warehouse filter. Read-only; no explicit error/transaction handler.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/309224502.sql), lines1–21. Reading SHA256 `b5771f12af56c7742fb182364bc5692f451e403cbf0a41f785a1653cc58befda`. Original definition SHA256 `8dfcc08f158453150a9cb4d4b53e42f6a1909d3b3efd0b066bb84d9c7db00113`.

### dbo.MetaDetails_GetLotAttributes

Return attribute templates and stored values for live or archived lots.

The negative archived flag chooses live LOT/LOT_ATTRIBUTE; every other value, including NULL, takes AR_LOT/AR_LOT_ATTRIBUTE. In live mode missing item with nonzero ID loads lot dimensions; otherwise resolve ID from lot/item/NULL-aware company/warehouse. Archive mode only has the missing-item ID lookup, without the alternate business-key ID lookup. If template is NULL, use matching ITEM template. Left-join selected lot values to all rows of that template.

Outputs: One unordered result set: ObjectId,LOT_TEMPLATE,Attribute,Value,AUTO_FILL_TYPE,AUTO_FILL_FORMAT,PATTERN. Missing attributes remain NULL; missing template yields no rows.

Limits: Culture is unused. Unmatched variable-assignment lookups preserve caller values; multiple matches choose an unordered assignment. Duplicate attribute rows can multiply templates. No execution of auto-fill expressions and no explicit transaction/error handling.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/325224559.sql), lines1–86. Reading SHA256 `5fc8be9eb6aacadb46fc0e0cb5249bf56e949f01b908de5576f2240e7524fe76`. Original definition SHA256 `5f6271dd82d538c07563cf99b26002f4fad0013f7d545438ac16fea23cbc1760`.

### dbo.MetaTpmTrans_Dashboard

Prepare the trading-partner dashboard image and visibility model.

Read WEB_USER type; materialize all security checkpoints for that username and copy checkpoint 1 from seven fixed form IDs. A coded direct-company user type uses its company image/URL or system fallback for NULL/empty company; otherwise full-company authorization or more than one active assigned company uses system images. Remaining users use unordered TOP 1 active assigned company. NULL/empty image falls back both image and URL to system values, even if company URL was present.

Outputs: One scalar row with fixed model/template markers, Culture, Warehouse, Company, CompanyImage,CenterImageUrl,TpmDashboardManhattanSCALE and seven ShowTpm flags in retained projection order.

Limits: Visibility values are returned configuration, not proof of current authenticated caller enforcement. Missing checkpoint/user/config leaves NULL. Separate TOP 1 image and URL queries can select different rows; no order or common snapshot. No error handler or writes.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/389224787.sql), lines1–100. Reading SHA256 `c0def41adf96d27515d2146535731ed54fd7315ea9be47096ec236a84362dba8`. Original definition SHA256 `369e95ad4276dbd072fdf8113de53530d4a6b4d7fc80e94f36a1a2f933598136`.

### dbo.MetaTrans_Dashboard

Prepare the dashboard model, permitted live tiles, widgets and categories.

Read decimal rounding, feature-enabled widgets and report-server URI; materialize security checkpoints for form4046, IDs21–29. Return the scalar template/visibility model and formatted local date. Return active statement tiles under header10004, requiring DASHBOARD_TILE_ACCESS and dynamically resolved FORM checkpoint1. Then return active widgets with their resolved FORM checkpoint1. Both absent checkpoint values default affirmative. Finally return generic-config category identifiers/descriptions.

Outputs: Four result sets: model; tile Id/Description/Link/Stats/Loading/Error; widget Id/Name/Description/URL/Category/IsDefault; category Id/Description, each with coded model markers. No row ordering.

Limits: ShowWidgets is a returned feature flag; widget SELECT is not itself gated by that flag. Missing checkpoint defaults allow inclusion, while duplicate scalar FORM/checkpoint rows can error. FORMAT can fail for invalid culture. No configuration writes or permission enforcement beyond these filters; separate queries lack snapshot.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/469225072.sql), lines1–111. Reading SHA256 `ef9375095e82e8cfdc01cfcb0f3ad1c51b09285a7809dd85357f5247ffca24af`. Original definition SHA256 `2bd39e447d0ffb3377a82aafb28cc7d39f0c013b3f63cacd86b9aff9116e5dff`.

### dbo.MetaTrans_GetCloseContainer

Prepare a close-container screen without closing the container.

Read selected container shipment/warehouse/counts, normalizing its count numbers to zero. Find latest same-shipment container with STATUS>401 ordered by DATE_TIME_STAMP descending. A non-NULL last count sets carrier-change restriction; if selected counts are both zero and last count is below total, propose last+1 and its total. Return selected container, shipment carrier/service and scalar count/restriction/localized text model.

Outputs: Three result sets: container fields/status/user fields, carrier/service header, then proposed counts/restriction/messages. First two use a one-row dummy LEFT JOIN, yielding a NULL-filled row even when missing; numeric user fields become zero.

Limits: No UPDATE, close validation, label/manifest execution or status transition. Latest-time ties are unordered. Culture only localizes strings. Missing selected container leaves scalar count variables NULL; loaded warehouse is unused. Independent reads can change between queries.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/533225300.sql), lines1–129. Reading SHA256 `bd1921dfef85b643940ecbb9af1373de67ba74693f98315adaeae4cbfb749acb`. Original definition SHA256 `578083f24d54af94239a3e0e69064d9efe3fdf2c314c28b6b9ab41afd5004371`.

### dbo.MetaTrans_GetEmployees

List active employees with conditional vendor-user visibility.

Read a feature flag, SaaS application flag and whether caller USER_PROFILE email matches a coded vendor-email pattern. When SaaS and feature are affirmative, NULL user or vendor user can see all active employees; nonvendor user sees employees whose email does not match the vendor pattern. Otherwise return all active employees. Both paths apply optional supervisor equality and left-join supervisor description, ordering employee description ascending.

Outputs: One result set: username, description, department, supervisor and SUPERVISOR_DESCRIPTION; first four aliases are coded in retained source.

Limits: In restricted mode a supplied nonexistent user leaves vendor classification NULL and yields no rows; NULL target email fails NOT LIKE for nonvendor callers. NULL supervisor means no supervisor filter. Ties lack unique ordering. No user changes, explicit authorization context verification, transaction or error handler.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/581225471.sql), lines1–90. Reading SHA256 `cd98fc33aff09600ffac4267a6a2fb030ac75cff948fd8a06c8542cc931bc104`. Original definition SHA256 `81f295f5c9c00cda1dfddd45eb379bf0410968fad7700ac7e7e93f9f84fcc870`.

### dbo.MetaTrans_GetInventory

Return inventory and its extended attributes for a detail screen.

Normalize NULL internal inventory ID to zero. Return TOP1 matching METADATA_INSIGHT_INVENTORY_VIEW row with identity/location/item/quantity/date/total/zone/stamp/user fields and PERMANENT converted to bit for affirmative flag. Separately return TOP1 twenty attributes from LOCATION_INVENTORY_ATTRIBUTES_VIEW.

Outputs: Two result sets, each zero-or-one row without ordering. Exact coded aliases and source expressions are retained in program order.

Limits: Culture is unused. ID is the only filter; warehouse/company are returned fields rather than additional scope. No lookup by license plate and no inventory mutation. Separate views can reflect different moments.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/597225528.sql), lines1–94. Reading SHA256 `93973d53a2d680a5aa26c791b8070bea57bd5039f2dddc3aaed5aa8b3f3ce1b7`. Original definition SHA256 `903e0d4a396421a0ff77085ca271586f4bd295e918fc8173ec18ca48e63c26fb`.

### dbo.MetaTrans_GetInventoryAdjustment

Prepare aggregate inventory defaults for an adjustment screen.

Load default status; normalize two coded sentinel strings and empty input strings to NULL and attribute0 to NULL. All-NULL identity selectors set local ID0; license-plate-only flow chooses minimum inventory ID for at most one distinct item, otherwise -1, excluding three location classes. Aggregate exact selected ID or, for ID<=0, optional selectors with NULL/zero attribute equality and two-class exclusion. String dimensions with multiple distinct values become empty; available quantity becomes zero for multiple locations or nonpositive sum/nonunique item, otherwise SUM(on-hand-allocated-suspense). Attributes clear when more than one row. Fetch expiration by lot name only and thumbnail by item with optional company.

Outputs: One scalar model row even with no matches; supplied nonempty selectors take precedence for several fields. New quantities are zero and coded blank defaults; exact output sequence retained.

Limits: tempWarehouse is never assigned; fallback warehouse stays NULL. ItemDesc and culture inputs are unused. LP minimum-ID choice summarizes only that one row even when same-item LP spans rows; no-row LP yields NULL ID and no aggregate match. Other NULL optional selectors can broaden across companies/warehouses; exclusion subquery uses caller warehouse. COUNT DISTINCT ignores NULL. Lot lookup omits item/company/warehouse; no current stock adjustment or snapshot.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/613225585.sql), lines1–156. Reading SHA256 `9eb3331ea000785c41c702ca633240564af88a24f4b54c8359b6d4e0c2c1c77f`. Original definition SHA256 `f5820bb2d67d61bf6e3cc320128893515daacdb98acd6afe0f95a46b41754811`.

### dbo.MetaTrans_GetInventoryCompanyTransfer

Prepare inventory-company-transfer screen defaults.

If license plate is present and internal ID NULL, select minimum eligible LP/parent inventory ID when at most one distinct item, else -1, excluding three location classes in warehouse. Aggregate only the resulting exact internal ID. Distinct mixed dimensions become empty; attributes clear for multiple rows; user-field tests use COUNT(non-NULL values), not COUNT DISTINCT. Fetch item thumbnail with optional company.

Outputs: One scalar model row; company/item/location/lot/status/license-plate/user fields and attribute ID, plus blank new-company/default placeholders and allLocations=0.

Limits: defaultInventorySts,tempWarehouse,tempToLocation are never assigned and return NULL; culture unused. Multiple-item LP selects -1 and returns blank/NULL aggregates rather than summarizing the entire LP. No eligible ID yields no source data but still a model row. No company transfer, eligibility quantity check or status write occurs.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/629225642.sql), lines1–112. Reading SHA256 `f11d20839d2a1e74f664683e8265fbecc43fcc282c77fba347a371df7a33c43f`. Original definition SHA256 `980d10778eb7f2706482e3436a56a464b875b18f7dc74896ba5223ebef1d2284`.

### dbo.MetaTrans_GetInventoryStatusChange

Prepare defaults for an inventory-status-change screen.

Load default status. NULL internal ID with no LP becomes0; LP-only mode chooses minimum ID for one distinct item, -1 for multiple. Aggregate exact ID, or optional item/company/lot/status/LP/warehouse filters only when ID=0. Mixed distinct string values become empty; attributes clear for multiple rows. Compute quantity/UOM but do not project them. Fetch expiration by lot alone and thumbnail by item/optional company; return current status or default when empty.

Outputs: One scalar model row with identity/context, current/new/default status, attributes, expiration/image and coded user-field/zero numeric defaults.

Limits: tempWarehouse is unassigned. Culture is unused. LP multiple-item -1 does not enter broad ID0 branch. NULL supplied filters under ID0 broaden matching; COUNT DISTINCT ignores NULL. Unscoped lot-name lookup can select unrelated lot expiration. Read-only model; no status transition or error/transaction handler.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/645225699.sql), lines1–117. Reading SHA256 `46f634dbb7e2f7c18bc6c62933a68a278f63612cd96573f90281d961804e8a77`. Original definition SHA256 `10b122586114c20fe3e2ed0d9bd3bb42671b344965a1acbbe4a23e8b0bde9d02`.

### dbo.MetaTrans_GetInventoryTransfer

Prepare inventory-transfer source and destination defaults.

Load default inventory status. Aggregate by exact internal ID or, only for ID0, optional item/company/lot/status/LP/warehouse. Mixed string dimensions become empty; available quantity is positive SUM(on-hand-allocated-suspense) only for one item in at most one location. Attributes clear for multiple inventory rows. Read expiration by lot name alone and thumbnail by item/optional company, then return model with blank destination/default fields.

Outputs: One scalar row; source quantities/UOM and context plus zero requested quantity, destination placeholders, dates/image/attributes/user defaults.

Limits: Explicit NULL internal ID does not behave like its default0 and matches no branch. tempWarehouse and tempToLocation remain NULL. Culture unused; source and parent LP affect filter equally. No transfer validation, write or reservation occurs. Independent unordered assignments can drift.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/661225756.sql), lines1–99. Reading SHA256 `37584494b34992c664a833c04c40408596d3287b0d080e698ad6a17a7b0e2c17`. Original definition SHA256 `d08f73fcbc03056c4315e64d9401982ffffce94d45920b25f56ff7effc3445bd`.

### dbo.MetaTrans_GetRecAppSchedule

Prepare receipt and appointment-schedule screen rows.

Internal receipt number0 returns a scalar blank receipt model with caller warehouse. Every other value queries RECEIPT_HEADER by internal ID and ignores caller warehouse. Then dummy-left-join all APPOINTMENT_SCHEDULE rows for that ID, with NULL date passthrough and numeric user fields normalized to zero.

Outputs: Two result sets: receipt model; appointment model. Receipt result is one default row for0, otherwise zero-or-more matches. Appointment always yields at least one default NULL-filled row, or all matching appointments, with no order.

Limits: Culture unused. NULL ID takes existing-record branch and returns empty first set plus default second row. No dock reservation, appointment insert/update or receipt-close action. No explicit error/transaction handling.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/917226668.sql), lines1–110. Reading SHA256 `0b461b00677a1c00f4eba962cb45c3a818ea06ffefce32e3eb79f95417e02d54`. Original definition SHA256 `49cc069091b48c561452a43ddb837128ee77e4f5877a4273a7730f5b6432d9b0`.

### dbo.MetaTrans_ReceiptWorkbench

Prepare receipt-workbench templates, security flags and configuration choices.

Read 14 checkpoints from form4038 plus new-line/container checkpoints from3035/3005 and UOM override setting. Materialize active receiving preferences authorized for all users or named user. Read user preference/default; only the coded default whose active global row is absent falls back to alphabetically first authorized materialized preference. Return screen model and secondary templates. Return DISTINCT all RECEIVING_PREFERENCES without active/user filter; then active locating rules, four coded generic-config choice sets, status-flow rows and active companies.

Outputs: Ten result sets in source order: main model; auxiliary model; all preferences with aliases plus RP wildcard shape; locating rules; generic choice1; generic choice2; functional statuses; generic choice3; generic choice4; companies. No final ordering except preference fallback lookup.

Limits: Authorized temporary preferences affect fallback selection only; the returned preferences dataset is unrestricted. Missing user leaves fallback variable NULL, not automatically the nested ISNULL default. Scalar user/receipt lookups can error on duplicates. Visibility/security flags are output values; this body does not locate, unlocate, check in, cancel, print or close records. No common snapshot.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1125227409.sql), lines1–186. Reading SHA256 `58798c3a5e9c122243ffc4b30aad0e470eace075a4bf73ad05b392a2f53fa4b3`. Original definition SHA256 `96910cb156e60d43d86167ce788e132a45e60e4b77776ae46182288eb1d4b984`.

### dbo.MetaTrans_ViewAccessorials

Return shipment or container accessorial display models.

Uppercase internal-number type equal to a coded shipment selector takes shipment branch; every other value, including NULL, takes container joined to shipment. Return header/template/carrier/company/freight-term description using scalar generic-config lookup. If any SHIPMENT_ACCESSORIALS has the internal number, return joined header/detail/accessorial rows filtered to affirmative shipment-level or negative container-level respectively. Group by all displayed source values and assign ROW_NUMBER over a constant. Two coded boolean texts are normalized uppercase.

Outputs: One header result set, plus conditional accessorial result set. Existing accessorials at the wrong level can cause an empty second set; no accessorials means the second result set is absent.

Limits: username and culture are unused; no user check or edit occurs. Freight-term scalar lookup can fail on duplicate configuration. Row numbering has no stable order. NULL header values become coded blanks; no warehouse/company input scope. No transaction or error handler.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1301228036.sql), lines1–109. Reading SHA256 `14ce247b4292a9a24867bf3532c9787e8578fab78692ab457c36f45ef3b3e7a5`. Original definition SHA256 `2e26890c12d1c06ead71996bdaeee3db3868544741a9b4e30ed6494f076855f5`.

### dbo.SCI_DATE

Calculate a date span for analytics from operational date columns.

UNION distinct dates from receipt-container expiration, labor start/end, shipment actual/planned/scheduled dates, detail order/planned/requested dates, container manifest, launch end, location count, inventory expiration, history activity, receipt/close/arrival and appointment dates, plus current UTC midnight. Group each resulting date, replacing years below/above coded bounds before outer MIN/ MAX.

Outputs: One row with mindate,maxdate; current UTC midnight ensures a candidate even when source tables are empty.

Limits: No date-window parameter, warehouse scope or NOLOCK hints. Numeric-looking year strings convert through datetime CASE precedence; source NULL dates do not affect aggregate bounds. No fact-table insert or date-dimension creation. No error/transaction handler.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1169751570.sql), lines1–21. Reading SHA256 `12a42d156a9612c5b729c2f51e43f936fa1e2213abc231f595264b6423d0364c`. Original definition SHA256 `f95103e6b0c2c5cb177683b40d1f6a48308c9d9d5957ecbdcd47770ec446d154`.

### dbo.SCI_LOCATION_CAPACITY

Project location capacity for an analytics snapshot.

Select inventory-class locations and left-join LOCATION_TYPE by location type. Return location/zones/templates/status plus capped last-count date. Cap length,width,height and maximum weight at their coded upper limits, normalize missing dimensions to zero and multiply dimensions for max_volume. Add UTC SNAPSHOT_DATE and ten typed NULL user dimensions plus five typed NULL facts.

Outputs: One unordered result set; complete projection order retained. A missing location type returns zero volume/weight and NULL weight UOM.

Limits: No active/warehouse filter, no lower/negative dimension clamp or unit conversion. Type join is not warehouse-scoped. Snapshot date labels query time; no persisted snapshot or consistent multi-statement transaction is created.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1233751798.sql), lines1–18. Reading SHA256 `1582c2ad9e4656b7d2cff2034edfb6f91992fa745e07e63c6af74a5312f98f14`. Original definition SHA256 `5341f6576ff2706339ece5c056b38a71f92ca4ac598b18e8f78a1be1798a2926`.

### dbo.SCI_LOCATION_SNAPSHOT

Project location inventory and item attributes for analytics.

Start from inventory-class LOCATION and left-join inventory on location/warehouse, then ITEM on item and equal company using identical NULL sentinels. Return location/item/quantity/UOM/zone/category/status fields, capped dates, UTC snapshot timestamp and typed NULL extension fields. Normalize on-hand/in-transit to zero. Divide each normalized total weight/volume/value/cost by on-hand, using denominator1 when on-hand is zero or NULL.

Outputs: One unordered result set; empty locations remain as NULL-filled inventory/item rows. Total-named output measures are per-on-hand-unit values, not unchanged source totals.

Limits: No active or quantity filter. Item join can multiply rows if matching identifiers are nonunique. Negative on-hand remains a negative denominator. No persistent snapshot, common transaction or error handling.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1249751855.sql), lines1–17. Reading SHA256 `1a63db794404caed12c5c3bc67458f89e3ec1616dcd6a33e3d4a05541b8b605c`. Original definition SHA256 `19dbeb21a17b9ac6e13a8fb0ed7f024526f808d7ec0f7972bd5ee30ad33a4340`.

### dbo.SCI_PICK_PUT

Project pick/put activity, work quantities and labor measures.

Join transaction history to coded transaction descriptions and WORK_INSTRUCTION_VIEW by internal instruction ID; left-join location and qualified labor detail. Coded from/to event groups differ; destination events additionally require AFTER_ON_HAND_QTY>0. Converted quantity scales work conversion ratio by transaction quantity; unit value/volume/weight divide by work quantity, substituting1 only for zero. A coded labor-process/from branch emits a zero-duration value; direction labels pick versus put. Labor match also requires user/quantity-UOM, process/direction/location and maximum detail ID conditions. Restrict activity timestamp to strictly greater than StartTime and less than or equal to EndTime.

Outputs: One unordered result set with explicit retained-source projection; no TOP or DISTINCT unless stated. No OUTPUT parameters or direct writes.

Limits: NULL endpoints or reversed interval return no ordinary matching events. NOLOCK hints on principal sources permit dirty/inconsistent reads; this is not a reliable exactly-once event feed or process-duration trace. No explicit error handler/transaction. The maximum labor-detail subquery compares outer lmd.date_time_stamp to history time, not the candidate lmd1 timestamp; it groups eligibility by same internal number/from-location. NULL work quantity still makes ratios NULL. Labor joins can multiply a transaction; output execution_time is a linked labor field or coded zero, not measured end-to-end duration.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1265751912.sql), lines1–23. Reading SHA256 `7b3d4e9d81cbad8dae023a8165faf1cedbf4a19e5565d0f4abb6cd3f1bf54a0b`. Original definition SHA256 `18e3e7ce93718efbc62d4c3a36ff81a28f1dcf052b878922b062febd26c6a37e`.

### dbo.SCI_PICK_PUT_COMMON

Project common item dimensions for non-receipt/shipment/work-order pick-put work.

Join history to work view while excluding five coded internal-number types; left-join ITEM when item matches and item company is NULL or equals work company. Return history ID/company/item and item origin/categories/class/color/department/description/division/size/style/NMFC/packing class. Use the coded common source/destination transaction groups. Restrict activity timestamp to strictly greater than StartTime and less than or equal to EndTime.

Outputs: One unordered result set with explicit retained-source projection; no TOP or DISTINCT unless stated. No OUTPUT parameters or direct writes.

Limits: NULL endpoints or reversed interval return no ordinary matching events. NOLOCK hints on principal sources permit dirty/inconsistent reads; this is not a reliable exactly-once event feed or process-duration trace. No explicit error handler/transaction. Company-specific and default ITEM rows can both join; this is not one-row preference fallback. NULL internal-number type fails NOT IN and is excluded.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1281751969.sql), lines1–23. Reading SHA256 `3afac3a8fdc821f44c3ea8136d0fe5500311fbdb17c6c49656b52c05ee46ee6b`. Original definition SHA256 `e1fb0444dfb94e18320af4a3712660d76b3cd92eb777150f38e01a9566120571`.

### dbo.SCI_PICK_PUT_INBOUND

Project receipt-line item dimensions for inbound pick-put analytics.

Join history to work view of the receipt internal-number type and receipt detail by internal line. Left-join ITEM on item plus default-or-matching company. Return receipt-detail categories/class/color/department/description/division/size/style, while origin/NMFC/packing class come from ITEM. Filter coded inbound source/destination event groups. Restrict activity timestamp to strictly greater than StartTime and less than or equal to EndTime.

Outputs: One unordered result set with explicit retained-source projection; no TOP or DISTINCT unless stated. No OUTPUT parameters or direct writes.

Limits: NULL endpoints or reversed interval return no ordinary matching events. NOLOCK hints on principal sources permit dirty/inconsistent reads; this is not a reliable exactly-once event feed or process-duration trace. No explicit error handler/transaction. Missing required receipt detail excludes the event. Default and specific ITEM matches can duplicate it; no additional positive destination balance test from the main pick-put procedure is present.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1297752026.sql), lines1–23. Reading SHA256 `86fa6f6d41f0f699152f0a0fc9679472466e98c65697e46a58dda273cd25c01a`. Original definition SHA256 `0632bf2d4fd07270e0e9054f2aa0e457f5121ce972a9420e9a51b3b7247509dd`.

### dbo.SCI_PICK_PUT_INBOUND_EXT

Project receipt source dimensions for inbound pick-put analytics.

Join history to receipt-type work and receipt header by work INTERNAL_NUM; return pick_put_id,receipt_type,source_id,source_name,source_city,source_state,source_postal_code for coded inbound source/destination event groups. Restrict activity timestamp to strictly greater than StartTime and less than or equal to EndTime.

Outputs: One unordered result set with explicit retained-source projection; no TOP or DISTINCT unless stated. No OUTPUT parameters or direct writes.

Limits: NULL endpoints or reversed interval return no ordinary matching events. NOLOCK hints on principal sources permit dirty/inconsistent reads; this is not a reliable exactly-once event feed or process-duration trace. No explicit error handler/transaction. This header extension joins independently of inbound detail projection; missing header excludes rows. No item/location/warehouse parameter or positive destination-balance filter.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1313752083.sql), lines1–20. Reading SHA256 `966a5594c9aae5a396a565be2a28b0a1a6e3930aec1c4f9c85a791d74556b812`. Original definition SHA256 `ba397e831b86de3a9a75388f4268758be587f0fef786485c30b9fe4d774631d4`.

### dbo.SCI_PICK_PUT_OUTBOUND

Project shipment-line item dimensions for outbound pick-put analytics.

Join history to work view of shipment/dock-management internal-number types and shipment detail by internal line. Return history ID/company/item and shipment-line origin/categories/class/color/department/description/division/size/style/NMFC/packing class. Use the wider outbound source/destination event groups. Restrict activity timestamp to strictly greater than StartTime and less than or equal to EndTime.

Outputs: One unordered result set with explicit retained-source projection; no TOP or DISTINCT unless stated. No OUTPUT parameters or direct writes.

Limits: NULL endpoints or reversed interval return no ordinary matching events. NOLOCK hints on principal sources permit dirty/inconsistent reads; this is not a reliable exactly-once event feed or process-duration trace. No explicit error handler/transaction. No ITEM fallback join. Missing shipment detail excludes the event; no shipment-status filter or positive destination-balance check is applied here.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1329752140.sql), lines1–24. Reading SHA256 `5760fdb172dfa8df867e145b7ed61b19e0239d2f9382bfac6555ce2e14fe19c5`. Original definition SHA256 `264987d71f2ed11980a3955d460d3da149e1f7d75cd2a213753b38044fd21961`.

### dbo.SCI_PICK_PUT_OUTBOUND_EXT

Project shipment customer and carrier dimensions for outbound pick-put analytics.

Join history to shipment/dock-management work and shipment header by work internal number. Return carrier/group/service/type, customer/name, order type, route and ship-to name/address dimensions plus typed NULL extension dimensions/facts. Use coded outbound source/destination event groups. Restrict activity timestamp to strictly greater than StartTime and less than or equal to EndTime.

Outputs: One unordered result set with explicit retained-source projection; no TOP or DISTINCT unless stated. No OUTPUT parameters or direct writes.

Limits: NULL endpoints or reversed interval return no ordinary matching events. NOLOCK hints on principal sources permit dirty/inconsistent reads; this is not a reliable exactly-once event feed or process-duration trace. No explicit error handler/transaction. No shipment status or detail-line join. This result has no shared snapshot with the separate outbound dimension and primary pick-put datasets.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1345752197.sql), lines1–20. Reading SHA256 `b5c4d8a8d5bf6746ed6a2866d52739f25b839c12df5ad35fa7c38a4a22e0ed58`. Original definition SHA256 `fed875c90e56417be2b3f9ddc9fe7ff06cd59ef9e697161dc1add3a37f89c646`.

### dbo.SCI_PICK_PUT_WORK_ORDER

Project work-order component dimensions for pick-put analytics.

Join history to either of two work-order internal-number types and WORK_ORDER_DETAIL by internal line; left-join ITEM with NULL-company-or-match logic. Work-order detail supplies class/description; ITEM supplies origin/categories/color/department/division/size/style/NMFC/packing class. Apply coded common source/destination event groups. Restrict activity timestamp to strictly greater than StartTime and less than or equal to EndTime.

Outputs: One unordered result set with explicit retained-source projection; no TOP or DISTINCT unless stated. No OUTPUT parameters or direct writes.

Limits: NULL endpoints or reversed interval return no ordinary matching events. NOLOCK hints on principal sources permit dirty/inconsistent reads; this is not a reliable exactly-once event feed or process-duration trace. No explicit error handler/transaction. Default and company-specific ITEM matches may both appear. Missing work-order line excludes history; no work-order status or quantity-positive predicate.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1361752254.sql), lines1–24. Reading SHA256 `267363d1a2551eedc7790457e2bb76913ed682fd84e0893a7eca1def7ee03f53`. Original definition SHA256 `325b49132fcb9ea890fd3db02b29863213bae18b0c9b95f345db199bc6657741`.

### dbo.SCI_RECEIPT_CONTAINER_CHECKIN

Project receipt-container check-in events with receipt and labor context.

Join history to transaction descriptions, location, receipt-container view by container/warehouse/item, receipt detail and receipt header including business receipt-reference equality. Left-join all receipt appointments and labor rows for this container or immediate parent. Labor detail must equal latest ID per internal number/container with the coded check-in screen. Select one coded check-in transaction and exclude one location class. Project quantities, receipt/item/location/appointment/labor dimensions and typed NULL extension fields; divide line value by positive total quantity or1, cap selected dates and normalize missing labor container ID to0. Restrict activity timestamp to strictly greater than StartTime and less than or equal to EndTime.

Outputs: One unordered result set with explicit retained-source projection; no TOP or DISTINCT unless stated. No OUTPUT parameters or direct writes.

Limits: NULL endpoints or reversed interval return no ordinary matching events. NOLOCK hints on principal sources permit dirty/inconsistent reads; this is not a reliable exactly-once event feed or process-duration trace. No explicit error handler/transaction. Appointments and labor matches can multiply events. Labor selection has no event-time upper/lower relation. Parent subquery is scalar and assumes unique view identity. This projection does not perform a check-in.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1377752311.sql), lines1–48. Reading SHA256 `69777a82ee11d338dc172237e590eec4c307128c81472a2ad33393b9800c0eb5`. Original definition SHA256 `fb5a2924bd2936ed1c145e20691cb853252b7f518a812016b6165545fd84991e`.

### dbo.SCI_RECEIPT_CONTAINER_CHECKIN_CANCEL

Project receipt-container check-in cancellation events.

Join history to WAREHOUSE and coded transaction descriptions; left-join location. Require the coded cancellation transaction and non-NULL container ID. Return event/item/company/user/equipment/UOM/location/warehouse/container and location-template dimensions, cap event date and negate quantity as 0-quantity. Restrict activity timestamp to strictly greater than StartTime and less than or equal to EndTime.

Outputs: One unordered result set with explicit retained-source projection; no TOP or DISTINCT unless stated. No OUTPUT parameters or direct writes.

Limits: NULL endpoints or reversed interval return no ordinary matching events. NOLOCK hints on principal sources permit dirty/inconsistent reads; this is not a reliable exactly-once event feed or process-duration trace. No explicit error handler/transaction. No receipt-header/container existence join is required. Location left join has no NOLOCK hint while principal sources do. NULL quantity remains NULL; no cancellation action is performed.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1393752368.sql), lines1–29. Reading SHA256 `4f339ff185647d00fd043e6353fa2e040d5cfcbb5b1657d722cf0bdd4ec6f560`. Original definition SHA256 `c3fbf83b5981d9f5a9ed42b7fd65af5ad5d226e8214047ab519b9e3ae4baaeb9`.

### dbo.SCI_SHIPMENT_DETAIL

Project shipment-line analytics changed within a time window.

Join shipment details to headers, left-join launch statistics by detail launch. Restrict header trailing status to >=900 and <990. Include rows when either header or detail DATE_TIME_STAMP is in (StartTime,EndTime]. Project shipment/customer/address/carrier/item/category/quantity/value/UOM fields, cap selected dates, include wave end and typed NULL extensions.

Outputs: One unordered explicit wide result set; no DISTINCT, TOP, OUTPUT or mutation.

Limits: Principal sources use NOLOCK. Timestamp filter is modification time, not actual shipment time. A header change can include every joined line; a NULL bound gives no matching timestamp branch. No warehouse filter, snapshot or error handler.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1409752425.sql), lines1–20. Reading SHA256 `266c816177e77b8598afae5db472cb55c155b0068b1f8872b1c7e022d068513a`. Original definition SHA256 `3f510b63af08decc2caa85d0f53a10a78641db12998b34e653340b02bfef3428`.

### dbo.SCI_SHIPMENT_HEADER

Project shipment-header analytics changed within a time window.

Left-join launch statistics to header launch. Restrict trailing status >=900 and <990 and header DATE_TIME_STAMP in (StartTime,EndTime]. Return header carrier/customer/ship-to/freight/company and capped scheduling/actual/wave dates, plus typed NULL extensions.

Outputs: One unordered explicit result set.

Limits: NOLOCK reads may be inconsistent. Unlike detail extraction, a detail-only update does not qualify this header. No warehouse parameter, status mutation, date fallback or runtime delivery proof; NULL endpoints match no rows.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1425752482.sql), lines1–21. Reading SHA256 `0a5bbd12021d7618a41b41f9cac951104fd7dafff9e3f96b05b07605f7e8985a`. Original definition SHA256 `7c44444a175c77f8396f86f7b65ee750ae9d3310bbfa4db4d42d6060c8ab95ab`.

### dbo.SCI_SHIPPING_CONTAINER

Project parentless shipment containers for analytics.

Join container to header and optionally its launch statistics. Require header trailing status>=900 and <990, nonplaceholder container type and PARENT IS NULL; parent0 is not included. Include modification window on either header or container. Return capped dates/carrier/customer/container/freight/measures and extension fields. Quantity is correlated SUM over all containers whose TREE_UNIT equals this container internal ID.

Outputs: One unordered explicit result set; quantity aggregate can be NULL.

Limits: NOLOCK on outer sources and quantity subquery. The quantity subquery has no status, shipment, parent or date predicate; tree identity determines scope. NULL container type fails inequality. No container close, quantity write or shared snapshot.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1441752539.sql), lines1–99. Reading SHA256 `f1ff414714b2c45fcc4fa1ab6b0b22eb786c31892cde79bfaa2f71332ecf55ac`. Original definition SHA256 `7668748983f91eabc12d5e4c1b3914667fc17cd8ae7419e27e17f30a05870890`.

### dbo.SRC_CartPickingWorkConfiguratorModel

Return whether cart picking should display user spot assignment.

Read SPOT_ASSIGNMENT_METHOD from every WORK_PROFILE_DETAIL row for a profile into one variable. Return textual true only for the user-assignment method, false otherwise.

Outputs: One scalar row with one unnamed textual boolean column; TOP1 on scalar SELECT has no limiting source effect.

Limits: No profile sequence filter or ORDER BY; multiple detail rows assign an unspecified final value. Missing/NULL profile yields false. No cart allocation, write or error handler.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1985754477.sql), lines1–18. Reading SHA256 `9baeea5ffff4ecd22a08dd0689db57088d6ae451f6a320bd5094d05ef8fd65e9`. Original definition SHA256 `610de424113083803a092095bd012b6e055cdb91a96e14d531719ae46580bb2b`.

### dbo.SRC_ReceivingConfiguratorModel

Return receiving verification flags with a default row.

Project selected WORK_SPECIAL_HANDLING item/quantity/logistics-unit/lot verification flags to textual booleans, UNION an ID0 all-false default, then TOP1 ORDER BY INTERNAL_WORK_SPEC_NUM descending.

Outputs: One row: INTERNAL_WORK_SPEC_NUM,ItemVerify,QuantityVerify,LogisticUnitVerify,LotVerify.

Limits: Positive selected IDs outrank default; missing ID yields default, negative IDs lose to0, ID0 ties can be ambiguous unless UNION collapses identical rows. NULL flag yields false. No receiving work or verification is performed.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/2001754534.sql), lines1–31. Reading SHA256 `d007648321613ce2cada2b480dd31f54cac75a99c65034c9af6dc4dce71c0246`. Original definition SHA256 `ea13797a181d2be87f9b6e462c9cd661fd5fefa223b85aa0225853d41a5fbc1c`.

### dbo.SRC_SystemDirectedWorkConfiguratorModel

Return system-directed-work selection and rename UI settings.

Load source location class and allow-work-selection flag using location/warehouse. Select TOP1 exact profile/sequence. Map assign-multiple and rename flags to booleans; enable work selection only when location allows and rename is negative. Continue-to-next-flow is false when location allows, true otherwise. Choose coded URI/title by rename flag and include caller username/culture/location class.

Outputs: One zero-or-one row with AssignMultipleWorkUnits,DisplayNewWorkUnitField,AllowWorkSelectionOnSystemDirectedWork,ContinueToNextFlowForNewWorkUnitEntry,uri,UserName,Culture,LocationClass,NewWorkUnitEntryTitle.

Limits: Missing profile yields no default row. Unordered duplicate profile/sequence is nondeterministic. NULL location settings follow CASE else branches. Username/culture are echoed, not security checks. No work selection/write or common snapshot.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/2017754591.sql), lines1–39. Reading SHA256 `9afbba472f1ca0fef04250895d864a9f8242b3908b2ed9f5ba56f06c50d2caf6`. Original definition SHA256 `4d23fd92856b1d91c7585e381547775d86e141dd76bbc2b354600e6a97e50b39`.

### dbo.SRC_WorkConfiguratorModel

Build work-execution UI controls from security, location and special-handling settings.

Initialize route/loop and handlers: picking mode enables short/entire/partial/overpick handlers, putaway mode enables short-putaway; receipt type enables pass. Read source location by warehouse, but different destination location lookup omits warehouse. Read form60010 checkpoints for run/bypass/skip/pass/partial/short/entire/full/over/add/override/locate/split/view controls; NULL or affirmative checkpoint maps true and missing row defaults true. Run permission additionally gates override-putaway/locate/override-pick/split, except a missing checkpoint row still uses the outer true default. Read SHIP_CONT_PUT by profile without sequence. Project selected WORK_SPECIAL_HANDLING verification/method/LP/quantity/partial/overpick/cycle-count fields, UNION an ID0 fallback derived partly from source-location verification, then TOP1 ORDER BY internal special ID descending.

Outputs: One wide model row with security/handler/route fields followed by explicit derived-column projection. Critical fallback positional difference: final actual columns are OverridePick,SplitContainer,ShortPutaway,ViewPicks; fallback supplies OverridePick,ShortPutaway,ViewPicks,SplitContainer, so three returned controls receive those shifted fallback values.

Limits: No actual work execution or authorization enforcement is observed. Multiple destination-name/profile/scalar-checkpoint matches can produce unordered values or scalar errors. Missing source location leaves LP/multi-item flags NULL. Positive special ID outranks0; nonpositive/tied rows can select fallback. Real handling uses Location versus Check Digit methods; fallback uses Location Name versus Check Digit. Exact compound verification conditions and numeric/coded modes are retained in source; no runtime caller binding proven.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1340583864.sql), lines1–187. Reading SHA256 `de019f8ea56687ba97ba3de5999131ed9b13de7c8da49ce9c64c34509f70018e`. Original definition SHA256 `b136c0778eeb1d710ce06ddcb00182dbfe9c84baf571670de1ea18c2444cecc6`.

### dbo.WHSM_GetMenuChildRecords

Count system-created descendants under a mobile menu option.

Recursive CTE anchors immediate children of objectId, recursively follows PARENT_OBJECT_ID with UNION ALL, then counts only affirmative SYSTEM_CREATED rows across all descendant levels. The selected parent itself is not counted.

Outputs: One scalar sysCreated COUNT row, zero if no descendants.

Limits: NULL parent selector matches none. No active filter, DISTINCT, cycle guard or MAXRECURSION override; cycles/deep trees can fail and repeated paths can duplicate counts. No menu deletion or authorization check.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/398272824.sql), lines1–15. Reading SHA256 `d9b21584df5c557c30390c88bfea2a6d4a358c5b7f3089d4ee4ed61b72ee4e3a`. Original definition SHA256 `d1e3083489a2793ccc8989c471e8fafc21ba4ad89fc0d63898f4683a5acc824a`.

### dbo.WHSM_InsightDetailPaneData

Return one mobile-menu detail with its parent label.

TOP1 select exact menu OBJECT_ID, left-join parent by PARENT_OBJECT_ID and retrieve source-identifier description through coded generic-config helper.

Outputs: Zero-or-one row: SCALAR,ObjectId,MenuOptionName,SubmenuName,SRCIdentifier,PARENT; no ordering.

Limits: Culture is unused. Missing parent leaves NULL name; helper behavior is separately bounded. No active/user authorization filter, mutation or explicit error handler.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/414272881.sql), lines1–30. Reading SHA256 `3892c12feeccf560936a2bbbed875924720e6f2da1f09307684975fd89cbc967`. Original definition SHA256 `132bedc481069fb9500049affa1b1cf8377d08566123484564c1d50f3cae00cc`.

### dbo.WRK_BuildCart

Select candidate shipping containers and assign them to a cart group.

Read WORK_TYPES for exact profile/sequence and split the coded delimiter into a table. Begin a transaction; choose DISTINCT TOP(cartSpots) joined detail/header/container tuples ordered priority,min/max zone sequence,aging. Require coded shipment internal type, source warehouse, header zone bounds, NULL detail group/hold, empty container position and allowed work type. Container join uses business CONTAINER_ID only with UPDLOCK. Iterate ordered selected tuples, capture child WRK_UpdateWorkInstructionForCartPicking results, commit, then return distinct grouped containers.

Outputs: Final result: CONTAINER_ID,CONTAINER_TYPE,GROUP_POSITION ordered position; child spot rows are captured into a table, not directly exposed.

Limits: Distinct is over the whole tuple, not container identity, so one container can consume multiple candidate spots when work attributes differ. TOP ties lack final identity order. Final read uses group and coded instruction type without warehouse. Explicit transaction/UPDLOCK exists, but no TRY/CATCH, XACT_ABORT, rollback or child-return check; an error can leave an open transaction or partial state. NULL/negative limits and splitter behavior remain SQL/helper-dependent.

Transaction: Explicit BEGIN TRANSACTION and COMMIT around cart candidate selection and child assignments; no local TRY/CATCH, rollback or XACT_ABORT. Initial profile parsing and final result query are outside that local pair; ambient transactions remain possible.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/858798467.sql), lines1–87. Reading SHA256 `070e127faa07876c9f4535026a16cad1839790900a955839cab449ce9cc95027`. Original definition SHA256 `e75e2b4c80d02eff37066b9a59771671e2d5f1757b18768c0367b11df64709bc`.

### dbo.WRK_GetWorkUnits

Find candidate work-unit headers from an entered work-unit prefix.

Under two enabled feature checks, blank/NULL work-unit input returns an empty seven-column schema immediately. Otherwise concatenate nonempty WORK_TYPES across profile detail rows, read two configured delimiters and count distinct eligible work units matching exact input or either input+delimiter+wildcard prefix. Eligibility uses unassigned/current user, positive from+to quantity or cycle-count flag, coded instruction type or cycle count, nonclosed condition and from/to warehouse. If exactly one work unit qualifies, return its coded header rows without hold or profile-type restriction. Otherwise recalculate eligible names with HOLD_CODE NULL and filter returned header WORK_TYPE against profile types.

Outputs: One unordered result set: WORK_UNIT,HOLD_CODE,WORK_TYPE,CONDITION,PRIORITY,REFERENCE_ID,FROM_LOC. Count is not returned.

Limits: Outer header query does not repeat warehouse/user/condition predicates, so shared work-unit names can return other matching headers. Exactly-one path bypasses profile/hold filtering. NULL user admits unassigned rows only. LIKE metacharacters in entered text are not escaped; missing delimiter can nullify a prefix branch. Profile concatenation/order and separate count/query reads are not stable snapshots. No writes or explicit error handling.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/67843654.sql), lines1–74. Reading SHA256 `24c5af0fa77633da1b94dbe668479b54dedd78eb17ed84b679603f86ac01a95a`. Original definition SHA256 `f90473091e71dd6ee59c58e51a53598f78bd696caab7be045ed9c62366c7dea7`.

### dbo.WRK_InsertWorkInstruction

Insert one work instruction from a complete caller-supplied field set.

Insert explicit work identity/quantity/location/container/assignment/status/stamp/tree/attribute/profile-zone fields directly. Convert four nullable date strings using datetime style20; convert internal-count and source/destination attribute IDs to NULL unless strictly positive. All other supplied values, including NULL stamps and quantities, pass through.

Outputs: No result set, inserted identity OUTPUT or explicit return; NOCOUNT is not set.

Limits: No duplicate check, defaults, eligibility validation, hierarchy reconciliation or stock mutation is in this body. Invalid date strings can error; target constraints apply. WORK_INSTRUCTION insert can invoke its captured trigger, whose separate contract governs outgoing-PD effects. No explicit transaction/error handler.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (enabled). Trigger event must match the actual DML; an INSERT-only trigger does not fire for UPDATE/DELETE. Existing source-reviewed trigger contracts remain authoritative. The work INSERT can invoke work_instruction_outgoing_pd; its set-level qualifying check can apply outgoing-PD updates to the entire inserted set. Clone fields after INSERT need not equal all original fields.

[Complete retained definition](sql/938798752.sql), lines1–323. Reading SHA256 `743c07e16577fc75f7f3b27f2456905c6316c1882a2b221c222bd57b89594316`. Original definition SHA256 `bb4755a08bb344018fe6a8d000cf7986566249377d31db1e6c9ad79651289bb8`.

### dbo.WRK_InsightDetailPaneData

Return a work-instruction detail pane and optional item image.

TOP1 exact internal instruction from WORK_INSTRUCTION_VIEW; left-join ITEM on item and exact-or-both-NULL company.

Outputs: Zero-or-one unordered row: SCALAR,WorkUnit,WorkType,FromLocation,ToLocation,Condition,InternalInstructionNum,Item,Company,ItemDesc,WebThumbnailImage.

Limits: Culture is unused. Duplicate item matches have no tie-breaker; no warehouse/current-user/status filter. Read-only view of work; no completion or assignment is performed.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/954798809.sql), lines1–44. Reading SHA256 `f077fcd77ed4339ae3a94d8dd96192ec6acb287bf9a033b7c82b5b1fcc2670d4`. Original definition SHA256 `11789b37402adf48cc9c77040493ef3d383dc1f72afed0d12ab816c23e621114`.

### dbo.WRK_MonitorCustomerCategoryChartData

Summarize customer work by customer category.

Parse warehouse. Join WORK_INSTRUCTION to SHIPMENT_HEADER by internal shipment number with two coded internal types and nonclosed condition, matching source OR destination warehouse. Distinct category/work-unit pairs are counted by category; NULL category gets localized display label. Order chart DATA descending. Summary computes per-condition distinct work-unit counts, instruction counts and estimated-time sums, then sums those groups; open/in-process totals use coded conditions. Closed instruction count uses WORK_INSTRUCTION_VIEW and DATE_TIME_STAMP>=UTC minus1hour with the same drill filters.

Outputs: Seven result sets: chart category/data/description/axis/title with next level 1, then total work units, total instructions, estimated time, open instructions, in-process instructions, last-hour closed instructions.

Limits: A work unit represented in multiple conditions can be counted repeatedly in the summed total. Empty SUMs can be NULL while estimated time is normalized0; no closed GROUP BY row leaves its variable NULL. NULL drill filters mean NULL category values only, not all. No instruction-type parent/detail filter. Independent queries can drift; final @@ERROR/GOTO sees only last-statement state, normal return0 and NOCOUNT OFF. Chart ties have no unique order.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/986798923.sql), lines1–91. Reading SHA256 `a774de423da1dc60ad4c87328768e8e72d3fb2ce628cdd715a855092acb9dccd`. Original definition SHA256 `fa57708440fa419c15150e5c5aeaf2d56ddb5671c1095465e2fdd711a3742753`.

### dbo.WRK_MonitorCustomerIndicatorTile

Return one customer-work indicator and matching critical levels.

Parse warehouse and dispatch five coded indicators: distinct work units older than one UTC day in two conditions; priority<=10 in two conditions; held work in two conditions; all work in two conditions; or assigned work in one condition. Both source/destination warehouse qualify. Pass the same distinct-work-unit count into caution/warning helper for each branch.

Outputs: One indicator-specific aggregate row with coded marker,count,caution,warning; unknown selector yields no result set.

Limits: No shipment/customer/internal-type join despite the name. Culture and local caution/warning variables are unused. NULL work-unit values are ignored by COUNT DISTINCT. No work mutation; final @@ERROR/GOTO is not comprehensive error capture; normal0 and NOCOUNT OFF.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1002798980.sql), lines1–86. Reading SHA256 `bf3bb33883d94289081003717533a314e88594c33027f93f555faeec537a4e3e`. Original definition SHA256 `5464a6ba7b930a5b162877d4a2860e8eefb9bf892fa1b60e737f230c79771f7e`.

### dbo.WRK_MonitorCustomerNameChartData

Drill customer-category work to customer names.

Parse warehouse and customer category; translate localized unassigned category to NULL and apply exact-or-both-NULL category predicates. Join WORK_INSTRUCTION to SHIPMENT_HEADER by internal shipment number with two coded internal types and nonclosed condition, matching source OR destination warehouse. Distinct customer-name/work-unit/internal-shipment tuples feed COUNT DISTINCT work unit per customer name. Order chart DATA descending. Summary computes per-condition distinct work-unit counts, instruction counts and estimated-time sums, then sums those groups; open/in-process totals use coded conditions. Closed instruction count uses WORK_INSTRUCTION_VIEW and DATE_TIME_STAMP>=UTC minus1hour with the same drill filters.

Outputs: Seven result sets: chart category/data/description/axis/title with next level 2, then total work units, total instructions, estimated time, open instructions, in-process instructions, last-hour closed instructions.

Limits: A work unit represented in multiple conditions can be counted repeatedly in the summed total. Empty SUMs can be NULL while estimated time is normalized0; no closed GROUP BY row leaves its variable NULL. NULL drill filters mean NULL category values only, not all. No instruction-type parent/detail filter. Independent queries can drift; final @@ERROR/GOTO sees only last-statement state, normal return0 and NOCOUNT OFF. Chart ties have no unique order.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1018799037.sql), lines1–103. Reading SHA256 `7776c7a908be1135fff39a8c8d0afdd7e18c7674a1539a066cf77534f8eb1308`. Original definition SHA256 `e74e004896ee3c4ce2e1d0b3b0987415110dffa79861642cc8b9fa5a74809f22`.

### dbo.WRK_MonitorCustomerShipToChartData

Drill selected customer work to ship-to names.

Parse warehouse plus category/customer name; translate each localized unassigned label to NULL and apply exact-or-both-NULL filters to both. Join WORK_INSTRUCTION to SHIPMENT_HEADER by internal shipment number with two coded internal types and nonclosed condition, matching source OR destination warehouse. Distinct ship-to-name/work-unit/internal-shipment tuples feed COUNT DISTINCT work unit per ship-to name. Order chart DATA descending. Summary computes per-condition distinct work-unit counts, instruction counts and estimated-time sums, then sums those groups; open/in-process totals use coded conditions. Closed instruction count uses WORK_INSTRUCTION_VIEW and DATE_TIME_STAMP>=UTC minus1hour with the same drill filters.

Outputs: Seven result sets: chart category/data/description/axis/title with next level 3, then total work units, total instructions, estimated time, open instructions, in-process instructions, last-hour closed instructions.

Limits: A work unit represented in multiple conditions can be counted repeatedly in the summed total. Empty SUMs can be NULL while estimated time is normalized0; no closed GROUP BY row leaves its variable NULL. NULL drill filters mean NULL category values only, not all. No instruction-type parent/detail filter. Independent queries can drift; final @@ERROR/GOTO sees only last-statement state, normal return0 and NOCOUNT OFF. Chart ties have no unique order.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1034799094.sql), lines1–110. Reading SHA256 `f3c11b2b83280f81cb17516be1b8cad210af092c7b53a24c94afffa6bad94c8c`. Original definition SHA256 `ec350ed3aee3d20c8c6d7ebaf99962d591ac331c6bc85b8a4297ca026d20b9ae`.

### dbo.WRK_MonitorCustomerWorkGroupChartData

Drill selected ship-to work to work groups.

Parse warehouse plus category/customer/ship-to names; translate each unassigned label to NULL and apply all three exact-or-both-NULL filters. Join WORK_INSTRUCTION to SHIPMENT_HEADER by internal shipment number with two coded internal types and nonclosed condition, matching source OR destination warehouse. Distinct work-group/work-unit/internal-shipment tuples feed COUNT DISTINCT work unit per group. Order chart DATA descending. Summary computes per-condition distinct work-unit counts, instruction counts and estimated-time sums, then sums those groups; open/in-process totals use coded conditions. Closed instruction count uses WORK_INSTRUCTION_VIEW and DATE_TIME_STAMP>=UTC minus1hour with the same drill filters.

Outputs: Seven result sets: chart category/data/description/axis/title with next level 4, then total work units, total instructions, estimated time, open instructions, in-process instructions, last-hour closed instructions.

Limits: A work unit represented in multiple conditions can be counted repeatedly in the summed total. Empty SUMs can be NULL while estimated time is normalized0; no closed GROUP BY row leaves its variable NULL. NULL drill filters mean NULL category values only, not all. No instruction-type parent/detail filter. Independent queries can drift; final @@ERROR/GOTO sees only last-statement state, normal return0 and NOCOUNT OFF. Chart ties have no unique order.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1050799151.sql), lines1–119. Reading SHA256 `43833ae9d9bdf48ff379dc044cdb836c7110887d0b297254a4784fe8e0c479f0`. Original definition SHA256 `d761ac13f8d78e6ec52aacff86da73c56c77a8a62a5e814b46c64c8bfcd4b697`.

### dbo.WRK_MonitorCustomerWorkTypeChartData

Drill selected customer work group to work types.

Parse warehouse plus category/customer/ship-to/work group; translate each unassigned label to NULL and apply all four exact-or-both-NULL filters. Join WORK_INSTRUCTION to SHIPMENT_HEADER by internal shipment number with two coded internal types and nonclosed condition, matching source OR destination warehouse. Distinct work-type/work-unit/internal-shipment tuples feed COUNT(work unit), not COUNT DISTINCT, per type; same work unit in different shipments can count more than once. Order chart DATA descending. Summary computes per-condition distinct work-unit counts, instruction counts and estimated-time sums, then sums those groups; open/in-process totals use coded conditions. Closed instruction count uses WORK_INSTRUCTION_VIEW and DATE_TIME_STAMP>=UTC minus1hour with the same drill filters.

Outputs: Seven result sets: chart category/data/description/axis/title with next level -1, then total work units, total instructions, estimated time, open instructions, in-process instructions, last-hour closed instructions.

Limits: A work unit represented in multiple conditions can be counted repeatedly in the summed total. Empty SUMs can be NULL while estimated time is normalized0; no closed GROUP BY row leaves its variable NULL. NULL drill filters mean NULL category values only, not all. No instruction-type parent/detail filter. Independent queries can drift; final @@ERROR/GOTO sees only last-statement state, normal return0 and NOCOUNT OFF. Chart ties have no unique order.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1066799208.sql), lines1–127. Reading SHA256 `f0ff7d48b56e52f169c2dcd4f2a2683a911b3035d7b5cfb4f0054a9d6fd50da2`. Original definition SHA256 `e9c883ab59008c2f4cc293140cfd71d916fd9ec2ea9a0fd94100e4788a969e53`.

### dbo.WRK_UpdateCCWorkCreated

Mark a cycle-count request as having work.

Set WORK_CREATED to a fixed affirmative marker on CYCLE_COUNT_REQUEST where INTERNAL_COUNT_NUM equals SourceKey. No other field or timestamp is written.

Outputs: No result set, OUTPUT or explicit return protocol; NOCOUNT is not set.

Limits: NULL/missing key affects no row without explicit error. There is no work-instruction insertion or verification that work actually exists. No transaction, error handler or optimistic guard.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/1178799607.sql), lines1–17. Reading SHA256 `12b02ec2d3c20ed06a19c3c145d7900ab36ea3b824770134199eff3c804b516e`. Original definition SHA256 `f8394ee19593a19d7b66d68db43aa9d317a2ab3b4c65cec72f70a73a841ab127`.

### dbo.WRK_UpdateInventoryWorkCreated

Mark an inventory-management request as having work.

Set WORK_CREATED to a fixed affirmative marker on INV_MGMT_WORK_DATA where INTERNAL_INV_MGT_REQ_NUM equals SourceKey. No other field or timestamp is written.

Outputs: No result set, OUTPUT or explicit return protocol; NOCOUNT is not set.

Limits: NULL/missing key affects no row without explicit error. There is no work-instruction insertion or verification that work actually exists. No transaction, error handler or optimistic guard.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/1210799721.sql), lines1–17. Reading SHA256 `61a4afb5f20b220c88c665290c5ffd6a3b05063ef7840b5e5a6cb40d50223add`. Original definition SHA256 `75f01ffeb679506e634cec5fb48537fe71fe7c3f9a9ef7d08ce090c5aa2d8301`.

### dbo.WRK_UpdateParentInstructionLnk

Set the parent link on all coded detail instructions in a work unit.

Update PARENT_INSTR from caller ParentInstr for exact work-unit name and fixed detail instruction type.

Outputs: No result or OUTPUT; no explicit return/NOCOUNT.

Limits: No warehouse/user/condition filter or parent-existence validation. NULL ParentInstr clears links; NULL work-unit selector matches none. Does not adjust NUMBER_OF_CHILDREN or prevent cycles. No transaction/error handler.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (enabled). Trigger event must match the actual DML; an INSERT-only trigger does not fire for UPDATE/DELETE. Existing source-reviewed trigger contracts remain authoritative.

[Complete retained definition](sql/1226799778.sql), lines1–19. Reading SHA256 `0afe47475cd9c23ed293b550469321b239c706ad7abdbd30a54ad882eda674db`. Original definition SHA256 `0d01fa5136487e5ef8bef5982f84e688dd3c0c7ee5780e30569532b9e19908d3`.

### dbo.WRK_UpdateRecWorkCreated

Mark a locating request as having work.

Set WORK_CREATED to a fixed affirmative marker on LOCATING_REQUEST where INTERNAL_LOC_REQ_NUM equals SourceKey. No other field or timestamp is written.

Outputs: No result set, OUTPUT or explicit return protocol; NOCOUNT is not set.

Limits: NULL/missing key affects no row without explicit error. There is no work-instruction insertion or verification that work actually exists. No transaction, error handler or optimistic guard.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/1242799835.sql), lines1–17. Reading SHA256 `965034099974e83da0e183c7ec367dd74f40b037869d26369196f540f5ea4f40`. Original definition SHA256 `f4cbc970cbd32f2701bce148528371b3eb42aec64c4d013ff706ea24717cf6db`.

### dbo.WRK_UpdateShipContWorkCreated

Mark a shipping container and its allocation request as having work.

First set shipping-container WORK_CREATED affirmative by internal container ID. Then set SHIPMENT_ALLOC_REQUEST WORK_CREATED affirmative for allocation IDs currently selected from that same container.

Outputs: No result set, OUTPUT or explicit return; row-count messages unsuppressed.

Limits: Two separate updates with no transaction/error checks; changing linkage between statements can affect a different request. NULL/missing container matches none. No actual work generation or stock change.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: Captured attached triggers: ship_container_tree_unit_a_i (enabled). Trigger event must match the actual DML; an INSERT-only trigger does not fire for UPDATE/DELETE. Existing source-reviewed trigger contracts remain authoritative.

[Complete retained definition](sql/1274799949.sql), lines1–24. Reading SHA256 `3f0ed00de1713cd0795f180a18985a3909cae235f9884f87da5756f1dde66f66`. Original definition SHA256 `916cc8733037b8ea9f8887d508fc463d1eb787ef909002cf536a5aa0dbe7d18b`.

### dbo.WRK_UpdateWoDtlWorkCreated

Mark a work-order detail as having work.

Set WORK_CREATED to a fixed affirmative marker on WORK_ORDER_DETAIL where INTERNAL_WRK_ORD_LINE_NUM equals SourceKey. No other field or timestamp is written.

Outputs: No result set, OUTPUT or explicit return protocol; NOCOUNT is not set.

Limits: NULL/missing key affects no row without explicit error. There is no work-instruction insertion or verification that work actually exists. No transaction, error handler or optimistic guard.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/1290800006.sql), lines1–17. Reading SHA256 `56adf7a2706d4c4fc9df00488b23437b054a28abe824dbdbc7adf1963b40f177`. Original definition SHA256 `843873d8a2b35c1885b491f3416af100110fafd114d5eebeda3e7471cd2b8309`.

### dbo.WRK_UpdateWoPutawayWorkCreated

Mark a work-order putaway unit as having work.

Set WORK_CREATED to a fixed affirmative marker on WORK_ORDER_PUTAWAY_UNIT where INTERNAL_PUTAWAY_NUM equals SourceKey. No other field or timestamp is written.

Outputs: No result set, OUTPUT or explicit return protocol; NOCOUNT is not set.

Limits: NULL/missing key affects no row without explicit error. There is no work-instruction insertion or verification that work actually exists. No transaction, error handler or optimistic guard.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/1306800063.sql), lines1–17. Reading SHA256 `e24093b3e6661d376645dae6b618a029177b404eaf99aa339cb8adb881fe2a23`. Original definition SHA256 `7e2146f70e7b749084f101e233d61818e6fb4591b0547a9251dbd58f3e59e8f1`.

### dbo.WRK_UpdateWorkInstruction

Replace a work-unit header field set from caller values.

Update all WORK_INSTRUCTION rows whose WORK_UNIT matches caller and INSTRUCTION_TYPE equals a fixed header type. Replace explicit quantities/status/location/assignment/stamps/container/tree/attributes and zone sequence fields. Convert four nullable date strings style20; normalize count/attribute IDs to NULL unless positive.

Outputs: No result set or OUTPUT; NOCOUNT is not set.

Limits: Caller InstructionType parameter is unused: it neither selects nor updates instruction type. WorkUnit is only selector, not renamed. Multiple same-name headers across warehouses can update; no internal-ID or concurrency guard. NULL inputs overwrite fields, invalid dates fail. No hierarchy count recalculation, stock update, transaction or error handler.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (enabled). Trigger event must match the actual DML; an INSERT-only trigger does not fire for UPDATE/DELETE. Existing source-reviewed trigger contracts remain authoritative.

[Complete retained definition](sql/1322800120.sql), lines1–219. Reading SHA256 `361e5ba01cb044632ab3da094d0c2be5442d56ed8484c3b0f82f641f26a3b625`. Original definition SHA256 `d33dc18320dcec1e5cd5048098d024b6ed45908e0117bc5093a3b897fd69422f`.

### dbo.WRK_UpdateWorkInstructionForCartPicking

Attach open shipment work to a cart group and optionally assign a spot.

Read TOTE_PICK by profile without sequence. If tote mode affirmative and both container/work-unit nonempty, update matching work-unit shipment-type nonclosed instructions with transport container/group/sequence0. Otherwise, for a nonempty container, update matching existing transport-container shipment instructions and call SHP_UpdateGroupPosition with rename/assign/group/container/internal-ID/spot parameters.

Outputs: No direct row query; child results can propagate only in the second branch. No OUTPUT parameter or explicit return.

Limits: Tote/work-unit branch does not call the spot helper. No warehouse, user-assignment or hold filter. Child return is ignored and no transaction/error handler appears; multiple profile rows assign unordered. Empty/NULL container means no action.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (enabled). Trigger event must match the actual DML; an INSERT-only trigger does not fire for UPDATE/DELETE. Existing source-reviewed trigger contracts remain authoritative.

[Complete retained definition](sql/1338800177.sql), lines1–38. Reading SHA256 `fcac2f0b1359f3c6452973384804f8998a923de1f93851dfc81180ed88752d15`. Original definition SHA256 `65ab4a3d5455001cebf75707ba4b1c6d7ea7cd6cbc34474e4c5bba814f5b55d1`.

### dbo.WRK_UpdateWorkUnitName

Rename every instruction with a given work-unit name.

Set WORK_UNIT=NewWorkUnit on all exact OldWorkUnit matches, with no other changes.

Outputs: No result set, OUTPUT or explicit return; no NOCOUNT.

Limits: No warehouse, instruction type, status, duplicate-name check or stamp update. NULL new name is written if constraints allow; NULL old name matches no rows. No linked-table rename or explicit error/transaction handling.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (enabled). Trigger event must match the actual DML; an INSERT-only trigger does not fire for UPDATE/DELETE. Existing source-reviewed trigger contracts remain authoritative.

[Complete retained definition](sql/1370800291.sql), lines1–18. Reading SHA256 `6fb574592b6933258d39220f10ffe613bacc6f194d6b5adb28c40560508e7af5`. Original definition SHA256 `456d195ad3005f7cd28e5e0d6b291a4d33a1082b69b5ee30b4b945a9ec06f3e8`.

### dbo.WTH_DeactivateShippingLoadWork

Move eligible closed shipping-load work into inactive storage.

Insert an explicit field projection into IA_WORK_INSTRUCTION for load shipments with shipment/dock-management work whose condition is closed and whose parent is absent/NULL-condition or closed. Preserve source IDs and most fields; clear USER_ASSIGNED, set LOCKED negative and DATE_TIME_STAMP to UTC. Re-run the same joins/eligibility and delete matching live WORK_INSTRUCTION rows.

Outputs: No result set, OUTPUT or explicit return; NOCOUNT ON.

Limits: No enclosing transaction, error check or captured-ID delete set. Concurrent eligibility changes can make insert/delete populations differ; repeated invocation has no inactive duplicate guard. Projection excludes source/destination inventory-attribute IDs and min/max work-zone sequence fields used by the newer work writers. NULL load ID matches none. This is work deactivation, not shipment/load closure.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (enabled). Trigger event must match the actual DML; an INSERT-only trigger does not fire for UPDATE/DELETE. Existing source-reviewed trigger contracts remain authoritative.

[Complete retained definition](sql/1402800405.sql), lines1–234. Reading SHA256 `856e53852bee6d093a7640197da7b4e2016f895a78479652e64cd52beb79604c`. Original definition SHA256 `85d186954ce18fa62ba534991fefef7351bcb23e06e41a12c3e610988a5290ed`.

### dbo.WTH_DeactivateWork

Move all named work-unit instructions into inactive storage.

Insert explicit fields from WORK_INSTRUCTION WITH(NOLOCK) for exact work-unit name into IA_WORK_INSTRUCTION; clear USER_ASSIGNED, set LOCKED negative and timestamp UTC. Then delete live instructions by the same work-unit name.

Outputs: No result, OUTPUT or explicit return; NOCOUNT ON.

Limits: No warehouse, type, condition or completed-work restriction. NOLOCK copy can be inconsistent and subsequent unguarded delete can target a changed population. No local transaction/error handler/duplicate guard. Copy omits inventory-attribute IDs and min/max work-zone sequences. No claim that associated inventory/request rows are archived.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (enabled). Trigger event must match the actual DML; an INSERT-only trigger does not fire for UPDATE/DELETE. Existing source-reviewed trigger contracts remain authoritative.

[Complete retained definition](sql/1418800462.sql), lines1–217. Reading SHA256 `9592ebcf4c14f85141bbbaec75dbc41ec4840224045c8043cc794de402433134`. Original definition SHA256 `730816eeabee7917c537ee1e198e9ccd878f85768d6e44cddcc0cc13db4c48a2`.

### dbo.WTH_SplitWork

Split a work instruction and optionally its replenishment request.

Reject NULL/nonpositive detail ID or quantity with -1. Call WTH_SplitWorkWithReturnInstr using fixed system user and capture the new instruction OUTPUT. Read original internal type/number; if replenishment and confirmMode<>1, call WRK_SPLITREPLENISHMENTREQUEST with quantity/request/new work/new-request variable. Check execution and captured child returns after each call.

Outputs: No direct row set or caller OUTPUT; child results may propagate. New work identity remains local.

Limits: NULL confirmMode bypasses the replenishment-child predicate but chooses the other branch inside the split child. NewRequest is passed without OUTPUT keyword. No wrapper transaction or compensation: a replenishment-child failure can follow successful work splitting.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1434800519.sql), lines1–56. Reading SHA256 `87b879a1c38e9f8ba617ac393e6bab3f474d699c819c33ef06ce807f41f1415e`. Original definition SHA256 `2543b07518bd022774a697c2843630fd069c891284661aa18e947d8d9d18bcc8`.

### dbo.WTH_SplitWorkInPutaway

Split putaway work through a checked wrapper.

Reject NULL/nonpositive quantity or detail ID. Invoke WTH_SplitWorkInPutawayRetInstr with fixed system user and local new-ID OUTPUT; return -1 for immediate SQL failure or propagate child return.

Outputs: No direct result set or caller OUTPUT; child result sets may propagate.

Limits: The wrapper does not expose the newly created identity or start a transaction. Child mutation/trigger/error behavior remains its own contract; no inventory balance change is performed directly.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1450800576.sql), lines1–33. Reading SHA256 `088ac610a7461fcd89aaa47f21d9e13dd3adf4c14a8cf296b8d5bdb043cb68b9`. Original definition SHA256 `4f90faaccc630e62656f6b0c05d36d41241f5b50cfa201c6761e4f29bb861d21`.

### dbo.WTH_SplitWorkInPutawayRetInstr

Clone putaway work into a remainder and keep the requested quantity on the original.

Validate positive quantity/ID; copy explicit fields from original WORK_INSTRUCTION to a new row and assign SCOPE_IDENTITY to OUTPUT. Update clone only when its TO_QTY>=qty: scale converted/weight/volume/value by (QUANTITY-qty)/QUANTITY, subtract qty from total quantity, preserve FROM_QTY and set TO_QTY0. A failed/no-row clone update raises severity18 and returns-1. Set original FROM_QTY0,TO_QTY=qty,QUANTITY=qty, scale totals, clear equipment and set user/process stamps; increment parent NUMBER_OF_CHILDREN.

Outputs: newInternalInstrNum OUTPUT receives copied-row scope identity; no direct row set. It is not initialized before validation.

Limits: Copy happens before sufficiency check; no rollback removes clone on failure. Division by zero is possible for inconsistent QUANTITY even if TO_QTY qualifies. Original update has no quantity guard or row-count check. Parent count NULL remains NULL after +1. Date stamps are copied, not refreshed by later updates. Enabled work-insert trigger may affect clone. No local transaction or snapshot.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (enabled). Trigger event must match the actual DML; an INSERT-only trigger does not fire for UPDATE/DELETE. Existing source-reviewed trigger contracts remain authoritative. The work INSERT can invoke work_instruction_outgoing_pd; its set-level qualifying check can apply outgoing-PD updates to the entire inserted set. Clone fields after INSERT need not equal all original fields.

[Complete retained definition](sql/1466800633.sql), lines1–99. Reading SHA256 `9fda82437626d9ae082a17694cfca84fb7307fcf12e400732e8f74b62cf66db5`. Original definition SHA256 `3f9306a0d0e4f4af6df2e42de34dea32f57cf236d2e962ebba51069a4c717687`.

### dbo.WTH_SplitWorkWithReturnInstr

Clone a work instruction and split source or destination quantities.

Validate positive ID/qty, copy explicit original fields and set new scope identity OUTPUT before checking quantity. confirmMode<>1 reduces clone FROM_QTY/QUANTITY by qty, scales totals, unlocks clone, then gives original FROM_QTY=qty,TO_QTY0,QUANTITY=qty and clears equipment. ELSE (including NULL mode) reduces clone TO_QTY/QUANTITY, sets clone FROM_QTY0/unlocked, clears clone container fields for non-receipt internal type, then gives original TO_QTY/QUANTITY=qty while preserving its FROM_QTY. Increment parent child count.

Outputs: New instruction identity OUTPUT; no direct result set. Quantity-check no-row branch raises severity18 and returns-1; other immediate checked errors return-1.

Limits: No wrapper transaction: initial clone and earlier updates can survive later failure. Clone sufficiency uses FROM_QTY or TO_QTY, not total QUANTITY, so zero divisor/inconsistent totals can fail. Output is not reset before validation. Clone container-clear update lacks its own error check. NULL internal type fails container-clear inequality. Original/parent row counts are unchecked; copied date stamps remain.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (enabled). Trigger event must match the actual DML; an INSERT-only trigger does not fire for UPDATE/DELETE. Existing source-reviewed trigger contracts remain authoritative. The work INSERT can invoke work_instruction_outgoing_pd; its set-level qualifying check can apply outgoing-PD updates to the entire inserted set. Clone fields after INSERT need not equal all original fields.

[Complete retained definition](sql/1482800690.sql), lines1–149. Reading SHA256 `d7b4cc9c84d76744cb9aa1710feb6141d3037d75344e1ef1d533f2ecbb957c2f`. Original definition SHA256 `a7476992f8f2e6ba528891d8de5b0c889531f4bed973474df841c50c7b2ce1ac`.

### dbo.WTH_UpdateDetailFull

Apply full confirmation quantities to a work detail and refresh its parent.

Require positive detail ID. Direction0 moves all existing FROM_QTY to TO_QTY and zeroes FROM_QTY, guarded only by FROM_QTY>=requested qty; sets equipment/end/completion user if absent and clears team. Direction1 with PD affirmative moves all TO_QTY back into FROM_QTY, zeroes TO_QTY and sets inventory-at-PD; non-PD zeroes TO_QTY and closes only when FROM_QTY<=0. Other directions zero FROM_QTY, with a coded no-source-location internal type also able to zero TO_QTY/close. Optional start time is used only in this last branch. Capture update error/rowcount, raise severity18 on no row, then call WTH_UpdateHeader with parent and captured end time.

Outputs: No direct result or OUTPUT; -1 for invalid ID/SQL/no-row failure or checked child return.

Limits: Requested quantity is not validated positive; full modes consume all existing side quantity rather than subtracting only the request. Guard excludes NULL requested qty. NULL direction uses last branch. No local transaction or user/process stamp assignment in detail update; parent call may fail after mutation. Conditions read pre-update values.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (enabled). Trigger event must match the actual DML; an INSERT-only trigger does not fire for UPDATE/DELETE. Existing source-reviewed trigger contracts remain authoritative.

[Complete retained definition](sql/1498800747.sql), lines1–128. Reading SHA256 `4a17a0f7cad32f1ffa537793b65ed341e3112899f77cc16ff8a347a177e71aa1`. Original definition SHA256 `f6ef930a8de0060c9365480909dd38e5bb6aa17582a9c317723c4dc74f527354`.

### dbo.WTH_UpdateDetailOverPick

Apply overpick quantity and totals to a work detail.

Validate positive detail ID. Direction0 reads source quantity/line into otherwise unused variables, zeroes FROM_QTY, adds requested qty to TO_QTY and changes total QUANTITY by requested-minus-existing source; scale totals/converted qty to that new amount, zeroing them if nonpositive. Every other direction zeroes both sides and scales totals by that formula but does NOT assign QUANTITY; close/completed-user check uses old FROM_QTY-requested. Set end time (preserve existing in second branch), equipment/team; then refresh parent after error/rowcount checks.

Outputs: No result/OUTPUT; no-row raises severity18 and returns-1, child returns checked.

Limits: cPD and current-location inputs are unused. Unlike short/underpick there is no FROM_QTY>=requested guard. NULL/negative qty can propagate; division by zero possible. Existing completed user can be overwritten on closing branch. No local transaction or current-user authorization.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (enabled). Trigger event must match the actual DML; an INSERT-only trigger does not fire for UPDATE/DELETE. Existing source-reviewed trigger contracts remain authoritative.

[Complete retained definition](sql/1514800804.sql), lines1–122. Reading SHA256 `f36093a8c00b1f8d6b1f477731f823e861fd291c4e44b1efd2b01d10108b857f`. Original definition SHA256 `cce2558426169652ecb9ee1e4ff2b6ead8ee213f8411952d8fb1606b634efb96`.

### dbo.WTH_UpdateDetailPartial

Apply partial confirmation to a work detail and refresh its parent.

Validate positive detail ID. Direction0 subtracts requested qty from FROM_QTY, adds it to TO_QTY and sets equipment/end; every other direction subtracts FROM_QTY but leaves TO_QTY unchanged, clears equipment and optionally updates start time. Both require FROM_QTY>=requested and clear team. Capture immediate error/rowcount, raise severity18 if no row, then refresh parent with captured UTC end time.

Outputs: No direct result/OUTPUT; -1 for invalid ID or checked SQL/no-row failure, child return propagated.

Limits: cPD,current-location and user parameters are unused. No positivity validation for requested qty: negative values can increase FROM_QTY. NULL direction takes second branch; NULL qty matches none. Total quantity/totals and detail condition are not changed. No transaction, rollback or optimistic comparison beyond side-quantity inequality.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (enabled). Trigger event must match the actual DML; an INSERT-only trigger does not fire for UPDATE/DELETE. Existing source-reviewed trigger contracts remain authoritative.

[Complete retained definition](sql/1530800861.sql), lines1–99. Reading SHA256 `4326aea167140ab7f288ddc87218d5adde45b9ab910fa25f8794dfdf6ad49fc2`. Original definition SHA256 `28a42f3174091452626e1188940897f33f154fefe240866b72160f4f9db7d8a2`.

### dbo.WTH_UpdateDetailsHeader

Recalculate the parent of a selected work detail.

Reject NULL/nonpositive detail ID; retrieve PARENT_INSTR from exact WORK_INSTRUCTION identity, then call WTH_UpdateHeader and check immediate SQL error/captured child return.

Outputs: No direct rowset or OUTPUT; child results may propagate.

Limits: Missing detail leaves parent NULL and child rejects it. No instruction-type check, warehouse scope, detail write or wrapper transaction.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1959326390.sql), lines1–25. Reading SHA256 `3df170cb207f05d9b81c608015f28ef1dd92547eb3e833d94964a451d5541fad`. Original definition SHA256 `16f6ab9b10a53de81d0882ec73e42fb35d43be70b2c03912d0112232f14ff9a4`.

### dbo.WTH_UpdateDetailShort

Record a short quantity on work detail and rescale its totals.

Require positive detail ID. Direction0 zeroes source, adds requested to destination, sets closed/completed user only if resulting destination<=0. Other directions zero source but preserve destination and close only if destination<=0. Both set total QUANTITY=old quantity-(old source-requested), proportionally rescale converted/weight/volume/value or zero for nonpositive result, set equipment/end, clear team, require FROM_QTY>=requested. Second branch optionally sets start time. Raise severity18 on no-row, then refresh parent using captured end time.

Outputs: No direct rowset/OUTPUT; immediate errors and parent return checked.

Limits: cPD/current-location inputs unused. No positive requested-qty validation; division by zero possible when result positive and old total0. NULL direction uses second branch. Existing completed user may be replaced. No transaction/compensation; detail and parent updates separate.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (enabled). Trigger event must match the actual DML; an INSERT-only trigger does not fire for UPDATE/DELETE. Existing source-reviewed trigger contracts remain authoritative.

[Complete retained definition](sql/1546800918.sql), lines1–119. Reading SHA256 `8e5e951fdc47aa3f83bd27926b38ce7b48932be863e81753e468737318415415`. Original definition SHA256 `638d3e0ce132165aa1ecc43f21517f2bdc5fd6da477cc0d8c82b647410853440`.

### dbo.WTH_UpdateDetailUnderPick

Record an underpick quantity and rescale work totals.

Validate positive detail ID. Direction0 zeroes FROM_QTY, adds requested TO_QTY and closes when resulting destination<=0. Other directions zero source, preserve destination and close when old destination<=0. Set QUANTITY to old total minus old source plus requested and proportionally scale converted/value/volume/weight, with zero for nonpositive resulting total. Set end UTC/equipment, clear team and require FROM_QTY>=requested. Check errors/no-row severity18, then recalculate parent without passing a shared end time.

Outputs: No result/OUTPUT; invalid/no-row/SQL failure returns-1 and child failure propagates.

Limits: cPD/current-location unused. Negative requested quantities can satisfy guard; no positive-qty or zero-divisor validation. Unlike short variant no optional start time or shared end timestamp. Detail/parent operations are not transactional.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (enabled). Trigger event must match the actual DML; an INSERT-only trigger does not fire for UPDATE/DELETE. Existing source-reviewed trigger contracts remain authoritative.

[Complete retained definition](sql/1562800975.sql), lines1–113. Reading SHA256 `23eb9cdddc2307bb0dbda69939bbd3666a4f1d6b52bca097dfa749bc81fa4f18`. Original definition SHA256 `f8ea719f2f73986efa6e68683efed7284553cc2feb6c4a74b52e39193a4fbb82`.

### dbo.WTH_UpdateHeader

Recalculate parent work quantities and completion from all children.

Require positive header ID. Aggregate SUM of seven quantity/value/volume/weight fields from all rows whose PARENT_INSTR matches, without condition/type filtering; overwrite parent totals. When summed from+to is zero, set closed and end time from caller or UTC; otherwise preserve condition and clear end time. Non-NULL userAssigned replaces parent assignee. Set process/time stamps. Separately set completed-by to assigned user for closed parent.

Outputs: No direct rowset/OUTPUT. Invalid ID returns-1; only final UPDATE error is checked.

Limits: Empty child set yields NULL sums, overwrites totals NULL and clears end time while preserving condition. Negative quantities can cancel positive totals and cause closure. Nonzero sums do not reopen a closed condition; later closed-user update still runs. Missing positive header silently updates zero rows. No child-count update, local transaction or snapshot.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: Captured attached triggers: work_instruction_outgoing_pd (enabled). Trigger event must match the actual DML; an INSERT-only trigger does not fire for UPDATE/DELETE. Existing source-reviewed trigger contracts remain authoritative.

[Complete retained definition](sql/258099960.sql), lines1–74. Reading SHA256 `9acb8847acb5420ea7d4c5686eb80141a00a98423a3cbdae3aa3b66c8a21bcd1`. Original definition SHA256 `78fde2ea10d4e5b9b38fc31eae12f2df04db6dccae57d79423d9283cd56e45c8`.

### dbo.WTH_UpdateStatus

Advance shipment, receipt, work-order or dock status after work confirmation.

Shipment type requires positive confirmed quantity: load work/detail state, return if already at/after configured packing-pending threshold, prefer container status flow (with unordered detail fallback), compute adjacent statuses by mode0/1/other; conditionally set container status unless confirmationType2 and move detail quantity to status. Receipt type loads container identity from work INTERNAL_NUM, counts other nonclosed receipt details for that number, then sets in-putaway for qualifying mode0, or advances beyond301 only when mode/quantity completion tests pass and no other work remains. Work-order type mode1/2 derives converted availability and updates line on-hand using a cap comparison, otherwise adds confirmed quantity; call WOHB_UpdateQtyAvailToBuild. Dock-management type delegates to WTH_UpdateStatusDockMgmt.

Outputs: No direct result/OUTPUT. Selected child returns and SQL failures checked; early shipment threshold returns0. Unknown type does nothing.

Limits: No general ID/qty/mode validation. NULL mode/confirmation affects three-valued branches. Work-order conversion divides by QUANTITY; comparison uses computed converted amount but increment uses raw confirmed qty, so no general cap guarantee. WOHB child return is not assigned to iError before stale check. Multiple status calls/line updates are not one transaction. Current status-flow configuration and callers remain unobserved.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No captured DML trigger attached to the direct persistent target tables.

[Complete retained definition](sql/1578801032.sql), lines1–320. Reading SHA256 `5a373b692339f4af2c1c15404dc5507f29e5878a29c4035db35f65ffe7b228f7`. Original definition SHA256 `6ccce9eacdad61531287ae7733108c14c97d6d226f9dfb75debb80e2cbd4dac4`.

### dbo.WTH_UpdateStatusBatch

Expose a captured batch-status procedure declaration with no executable body.

The captured definition declares five parameters followed by AS and comments only. Complete retained source and original hash show no executable SELECT,DML,EXEC or control statement.

Outputs: No defined result-set, OUTPUT or explicit return behavior in the retained body.

Limits: All five parameters are unused. This is a static no-operation body, not evidence that a status batch executes elsewhere or a runtime success contract. No operational execution was performed.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1975326447.sql), lines1–34. Reading SHA256 `1d490e27551aa40005d033c2b2adf3a8886e6d49ad33fa6af74069fcfbb42d33`. Original definition SHA256 `8d138992b03ce6b8116f314e65f11080def911215116c57521fa5b99ff48c5d3`.

### dbo.WTH_UpdateStatusDockMgmt

Advance container and shipment-detail status for a dock-subclass move.

Only modes1/2 act. Join work, container, shipment detail and both warehouse-qualified locations; prefer container custom status flow over detail. Return0 when current container status>=800. If source/destination subclasses differ, select highest mapped destination status for destination warehouse and NULL-aware custom flow. If no mapping, load subclass description and raise severity18 then return-1. If current status differs, set container status then move confirmed line quantity between statuses with checked child returns.

Outputs: No direct result/OUTPUT; other modes or same subclasses perform no status calls.

Limits: Missing joins leave NULL variables, causing comparisons to skip without a diagnostic. NULL subclass equality does not enter change branch. No positive qty validation or warehouse-wide fallback when a custom flow is supplied. Highest status wins; no local transaction means first child can succeed before second fails.

Transaction: No explicit BEGIN TRANSACTION, COMMIT, ROLLBACK, savepoint or SET XACT_ABORT. Caller/session transaction and isolation remain unknown; multiple statements and child calls are not assumed atomic.

Triggers: No direct persistent target; called procedures retain their own mutation/trigger contracts.

[Complete retained definition](sql/1594801089.sql), lines1–118. Reading SHA256 `5b24fa8c3fc4f4227314b7e2d85dda08591632feb6bd269ff13e56561a1d2a7b`. Original definition SHA256 `ae7da301bef12d62ae41a30883ed6b29dd28c3da5fc18b8c5d28dc25ffa53221`.

## Boundaries

Owner-attested current replica, captured snapshot20260929T214106Z. Source documented as-is; no version/build gate or extension work.
Static contracts do not establish actual application callers, authenticated permissions, effective configuration, current rows or live process outcomes.
No database connection, procedure execution, archive action, operational data retrieval or configuration change was performed.
No new table-role, dynamic-backlog or unresolved-dependency credit. Existing reviewed contracts remain immutable.
