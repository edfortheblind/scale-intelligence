# Dynamic SQL and unresolved dependencies

This batch reviews 52 remaining dynamic candidates and 120 remaining dependency entries. It adds no full-module contracts. The original denominators remain 60 dynamic candidates and 169 unresolved catalog entries.

The 52 candidates split into 28 SQL-text execution wrappers and 24 fixed-call false positives. A fixed return-status assignment does not make a procedure target dynamic. Fixed calls can still invoke mutation or indirect commands.

## Fixed procedure calls and lexical dynamic flags

No. In the reviewed fixed-call forms, @iError receives the procedure return status and the procedure name is fixed. Called procedures can still change data or invoke further commands.

Evidence: [dbo.WTH_SplitWork](sql/1434800519.sql), [dbo.WTH_UpdateStatus](sql/1578801032.sql), [dbo.DASH_UpdateKPIData](sql/1596181082.sql), [dbo.PMN_Trace](sql/1765229689.sql).

- No safe-to-run, read-only, successful lock or full-flow claim follows from this classification.

## Download selection changes queue state

They update ready interface rows and process stamps before returning selected data. A returned batch is not proof of downstream processing or one atomic claim across every stage.

Evidence: [dbo.wm_RUDownloadItem02](sql/218796187.sql), [dbo.wm_RUDownloadOrderHeader02](sql/250796301.sql), [dbo.wm_RUDownloadReceiptHeader02](sql/282796415.sql).

- No acknowledgment, concurrency guarantee or whole-process success is inferred.

## Configured predicates are executable SQL text

Values such as batch ID and warehouse date are bound, but stored FILTER_CONFIG_DETAIL predicate text is appended as SQL syntax. Receipt variants also mark upload/batch state.

Evidence: [dbo.wm_RUReceiptHeader01](sql/314796529.sql), [dbo.wm_RUReceiptHeader02](sql/330796586.sql), [dbo.wm_RUReceiptHeader03](sql/346796643.sql), [dbo.wm_RInventory01](sql/1262275902.sql), [dbo.wm_RInventory02](sql/1278275959.sql).

- Fixed-template targets do not bound arbitrary configured syntax or prove active configuration.

## Monitoring names and parameters

The PM header/work monitoring wrappers concatenate table and column expressions into SQL. Passing identifier-named arguments in a parameter list does not undo that earlier syntax construction.

Evidence: [dbo.PM_RECEIPTHEADER01](sql/1493228720.sql), [dbo.PM_SHIPMENTHEADER01](sql/1509228777.sql), [dbo.PM_WORKINSTRUCTION01](sql/1589229062.sql).

- No exploit or runtime target was reproduced; metadata lookup is not a complete allowlist.

## Fixed reports and an external query

Several wrappers execute one fixed SELECT string without binding their declared report arguments. PM_SHIPPED_TODAY_BY_MINUTE uses a four-part external target whose definition is outside the local snapshot.

Evidence: [dbo.PM_UNSHIPPED_BY_BUILDING_PRIORITY](sql/436196604.sql), [dbo.PM_TODAY_SHIPPING_QUANTITY](sql/452196661.sql), [dbo.PM_TODAY_SHIPPING_COMPLETED](sql/468196718.sql), [dbo.PM_SHIPPED_TODAY_BY_MINUTE](sql/484196775.sql), [dbo.PM_FUTURE_SHIPPING](sql/596197174.sql), [dbo.TRAV_EXEC_PROC](sql/1788793680.sql).

- No external connection or freshness observation; TRAV_EXEC_PROC output parameters are not assigned in the reviewed outer body.

## Configuration summary JSON limits

It quotes values with QUOTENAME and assembles query text, with no bound parameters at execution. QUOTENAME’s input-size limit and STRING_AGG’s non-MAX result type impose static boundaries before the query runs.

Evidence: [dbo.LoadAdditionalConfigsSummary](sql/181224046.sql).

- Oversized values and aggregation are static concerns, not reproduced incidents; intermediate branch semantics remain partial.

## Maintenance commands and partial outcomes

The reviewed maintenance paths include TRUNCATE, DELETE, ALTER INDEX and UPDATE STATISTICS. This documentation establishes construction and effect categories; it neither executes them nor confirms current targets, permissions or retention settings.

Evidence: [dbo.PURGE_ARCHIVE_TABLES](sql/777873938.sql), [dbo.ArchivePurgeRunbook](sql/337540386.sql), [dbo.AzureSQLMaintenance](sql/956178802.sql), [dbo.AzureSQLMaintenance_1](sql/2122646805.sql).

- No archive rows accessed; no maintenance/trace command run.

## Partial binding in XML and unit searches

XML content is bound while XPath/namespace syntax is concatenated. The unit-reference search binds its count output while concatenating table/column names and the sought unit value.

Evidence: [dbo.GetXMLAttributeValueByAttributeName](sql/1016703020.sql), [dbo.ITM_DoesUmReferenceExist](sql/1800705813.sql).

- The unit fallback nonprogress edge is source-level, not reproduced; no arbitrary-input read-only guarantee.

## Generated INSERT text versus executed DML

Its constructed command reads rows with SELECT and returns INSERT statements as text. The body does not execute those emitted INSERT statements; invoking it would still read operational rows.

Evidence: [dbo.sp_generate_insert_script](sql/1953754363.sql).

- No extraction ran; completeness and restoration fidelity are unverified.

## Unresolved catalog references and candidate targets

A same-name local object is a static candidate for an unqualified call, not an observed runtime binding. Other NULL entries describe system routines, an alias, a table created by a body, a missing staging relation or a cross-database function.

Evidence: [dbo.CheckSecurityPermission](sql/1260179885.sql), [dbo.POPULATE_Generic_Config_Dtl](sql/1161315447.sql), [dbo.TRAV_SetShipByAndDeliverByForReturns](sql/1243151474.sql), [dbo.PMN_TableSizes](sql/1749229632.sql), [dbo.MetaTrans_GetLocationInventory](sql/757226098.sql).

- tempSecurityCheck lacks a # prefix and is an ordinary table; no session-private lifecycle guarantee.

The JSON construction size analysis follows Microsoft’s [QUOTENAME documentation](https://learn.microsoft.com/en-us/sql/t-sql/functions/quotename-transact-sql?view=sql-server-ver17) and [STRING_AGG documentation](https://learn.microsoft.com/en-us/sql/t-sql/functions/string-agg-transact-sql?view=sql-server-ver17). This is a static inference from the source expression, not a reproduced incident.

## Exact dynamic classification

| Object | Classification | Execution lines |
|---|---|---|
| dbo.LoadAdditionalConfigsSummary | JSON_SELECTED_FIXED_QUERY_TEMPLATES_WITH_QUOTED_VALUES | 1344 |
| dbo.wm_RUDownloadItem02 | PARAMETERIZED_QUEUE_CLAIM_WITH_NUMERIC_TOP | 31 |
| dbo.wm_RUDownloadOrderHeader02 | PARAMETERIZED_QUEUE_CLAIM_WITH_NUMERIC_TOP | 31, 53, 83, 110, 137 |
| dbo.wm_RUDownloadReceiptHeader02 | PARAMETERIZED_QUEUE_CLAIM_WITH_NUMERIC_TOP | 32, 55, 76, 102, 132, 160, 191 |
| dbo.wm_RUReceiptHeader01 | CONFIGURATION_PREDICATE_CONCATENATION_WITH_BOUND_VALUES | 63, 81, 104, 125 |
| dbo.wm_RUReceiptHeader02 | CONFIGURATION_PREDICATE_CONCATENATION_WITH_BOUND_VALUES | 82, 101, 124, 145 |
| dbo.ArchivePurgeRunbook | PREFERENCE_SELECTED_TRUNCATE_AND_BATCH_DELETE | 1039, 1103, 1145, 1187 |
| dbo.wm_RUReceiptHeader03 | CONFIGURATION_PREDICATE_CONCATENATION_WITH_BOUND_VALUES | 73, 91, 114, 135 |
| dbo.PM_UNSHIPPED_BY_BUILDING_PRIORITY | FIXED_LITERAL_SELECT_EXECUTION | 107 |
| dbo.PM_TODAY_SHIPPING_QUANTITY | FIXED_LITERAL_SELECT_EXECUTION | 34 |
| dbo.PM_TODAY_SHIPPING_COMPLETED | FIXED_LITERAL_SELECT_EXECUTION | 52 |
| dbo.PM_SHIPPED_TODAY_BY_MINUTE | FIXED_LITERAL_EXTERNAL_SELECT | 42 |
| dbo.PM_FUTURE_SHIPPING | FIXED_LITERAL_SELECT_EXECUTION | 55 |
| dbo.PURGE_ARCHIVE_TABLES | CATALOG_SELECTED_DESTRUCTIVE_DDL | 24 |
| dbo.GET_SHIPMENT_SECURITY_INFO | DATA_DERIVED_PROJECTION_SQL | 59 |
| dbo.AzureSQLMaintenance | CATALOG_SELECTED_INDEX_AND_STATISTICS_MAINTENANCE | 220 |
| dbo.GetXMLAttributeValueByAttributeName | BOUND_XML_WITH_UNBOUND_XQUERY_SYNTAX | 45 |
| dbo.CCP_CreateCCRequest | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 137, 140, 194, 247, 332, 357, 381, 388, 390, 406, 408 |
| dbo.CCP_InsertCCRequest | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 162, 163 |
| dbo.CCP_UpdateCCRequest | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 57 |
| dbo.INV_InsertLocationInventory | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 125 |
| dbo.LOAD_INVENTORY | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 139 |
| dbo.wm_RInventory01 | CONFIGURATION_PREDICATE_SELECT_WITH_BOUND_DATE | 113 |
| dbo.wm_RInventory02 | CONFIGURATION_PREDICATE_SELECT_WITH_BOUND_DATE | 181 |
| dbo.trace_ILS | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 65, 66, 81, 82, 97, 98, 114, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 288, 290, 299, 309, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 325, 335, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 348 |
| dbo.WTH_SplitWork | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 39, 49 |
| dbo.WTH_SplitWorkInPutaway | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 23 |
| dbo.SDB_MoveQtyToSts | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 408 |
| dbo.PM_RECEIPTHEADER01 | CALLER_IDENTIFIER_CONCATENATION_WITH_BOUND_VALUES | 79, 102 |
| dbo.INV_SaveHistInvChg | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 328 |
| dbo.WTH_UpdateDetailFull | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 126 |
| dbo.PM_SHIPMENTHEADER01 | CALLER_IDENTIFIER_CONCATENATION_WITH_BOUND_VALUES | 79, 103 |
| dbo.INV_TransferCompany | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 116, 178, 574 |
| dbo.WTH_UpdateDetailOverPick | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 116 |
| dbo.WTH_UpdateDetailPartial | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 95 |
| dbo.dba_UpdateColumn | CALLER_SCHEMA_MUTATION_WITH_RECURSIVE_FIXED_CALLS | 60, 76, 79, 84, 86, 110 |
| dbo.INV_UpdateLocation | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 154 |
| dbo.WTH_UpdateDetailShort | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 115 |
| dbo.WTH_UpdateDetailUnderPick | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 109 |
| dbo.WTH_UpdateStatus | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 196, 202, 243, 258, 306, 314 |
| dbo.PM_WORKINSTRUCTION01 | CALLER_IDENTIFIER_CONCATENATION_WITH_BOUND_VALUES | 88, 123 |
| dbo.WTH_UpdateStatusDockMgmt | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 107, 111 |
| dbo.DASH_UpdateKPIData | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 38, 43, 44, 51, 56, 57, 64, 69, 70, 77, 82, 83 |
| dbo.dba_DropDefaultKeyConstraint | CATALOG_DEFAULT_CONSTRAINT_DROP | 27 |
| dbo.PMN_Trace | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 26, 86, 87, 103, 104, 120, 121, 139, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 315, 317, 326, 337, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 353, 364, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376 |
| dbo.TRAV_EXEC_PROC | FIXED_LITERAL_SELECT_EXECUTION | 63 |
| dbo.ITM_DoesUmReferenceExist | METADATA_SELECTED_REFERENCE_SEARCH_WITH_RAW_VALUE | 57 |
| dbo.RCB_SetStatus | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 65 |
| dbo.sp_generate_insert_script | DATA_SCRIPT_GENERATOR_SELECT_NOT_INSERT_EXECUTION | 210 |
| dbo.WTH_UpdateDetailsHeader | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 23 |
| dbo.STH_UpdateHeader | FIXED_PROCEDURE_CALLS_RETURN_ASSIGNMENT_IS_NOT_DYNAMIC_TARGET | 219 |
| dbo.AzureSQLMaintenance_1 | CATALOG_SELECTED_INDEX_AND_STATISTICS_MAINTENANCE | 221 |

## Evidence and acceptance boundary

The [additive fragment](mappings/batches/dynamic-dependencies.json) records source-definition and reading-copy hashes, exact public execution/reference lines, private-literal line/hash structural evidence, bound values, unbound syntax, target limits and the original catalog dependency rows. Public reading coordinates include a documentation header; private literal coordinates use the original definition.

LoadAdditionalConfigsSummary has bounded entry/exit construction review plus a guarded template identifier inventory; all intermediate configuration branches are not credited as semantically reconciled. ArchivePurgeRunbook is limited to cited settings/filter/cleanup regions. Repeated fixed trace calls have complete lexical site inventory and bounded representative call reading, not full tracing-flow acceptance.

No SQL, archive access, live trace, maintenance command, export or external connection was performed. Effective authorization, operational duration, current values, caller resolution and application acceptance remain unobserved.
