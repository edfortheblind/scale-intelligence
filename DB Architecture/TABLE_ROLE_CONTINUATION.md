# Table-role continuation

All 356 reserved table schemas were inspected. This batch adds 355 bounded structural roles and leaves one functional purpose unresolved. It does not establish all callers, lifecycle behavior, effective configuration or runtime outcomes.

Source snapshot: `20260929T214106Z`. The exact JSON binds every captured column, byte length/precision/scale, ordered unique key, index, outgoing foreign key, default, check and trigger record. One complete supporting default definition (`dbo.Set_To_Zero`) was read; no new module contract is credited.

| Measure | Count |
| --- | ---: |
| reserved tables | 356 |
| reviewed roles | 355 |
| schema associations | 356 |
| paired schema reviews | 77 |
| unresolved functional roles | 1 |
| source modules read | 1 |
| new semantic contracts | 0 |
| new help topics | 0 |
| columns reviewed | 10594 |
| unique indexes reviewed | 267 |
| outgoing foreign keys reviewed | 192 |

## Unresolved purpose

`dbo.Interface_Item_Failure_1024` (object 1644689057) remains unreviewed for functional role. Six named item/template/comparison text fields followed by 154 generic column7..column160 fields; all nullable heap, no keys/FKs/defaults. Full schema read, but purpose/field interpretation and any consumer cannot be established without source evidence. No role credit requested.

Named fields: `ITEM`, `IDENTIFIER`, `STORAGE_TEMPLATE`, `SYS1VALUE`, `SYS1VALUEcorrect`, `UoMsCorrect`. A complete schema association is retained without role credit. A retained definition or other authorized source that identifies a producer/consumer and explains the named and generic fields; no name-only purpose assignment.

## Reading boundaries

- Only bounded schema/function meaning is reviewed. All callers, population, deletion, ordering, workflow transitions and runtime outcomes remain outside this batch.
- Required/nullable columns, unique keys, foreign keys and default bindings are schema facts, not current configuration values or application behavior.
- AR-prefix paired shapes are established by complete column comparisons, not by a name-based claim that an archive job copies, retains or deletes rows.
- Character max_length metadata is in bytes. Redacted literal placeholders do not establish default flag values. No transactional rows, operational routines or database connections were used.
- A bound zero default describes the reviewed default expression only; nullable columns still permit explicit NULL.
- No new stored-procedure semantic contract, table lifecycle, live UI, deployment or user acceptance credit is requested.

The 77 paired AR schemas are separate storage shapes. Seventy-four have equal compared column definitions; three contain column differences. The comparison checks name, type, byte length, precision, scale and nullability. Identity, constraints and indexes are reviewed separately and are never inherited from the paired table. No retention workflow is inferred.

## Table roles

### dbo.ACCESSORIAL_DETAIL

Store rating-service accessorial subcodes, values and override requirements.

The composite primary key is rating ID/service/code/subcode; OBJECT_ID is separately unique. Value type, required-for-rating and container-content applicability are stored settings. The header FK is enabled but untrusted; HEADER_ID is indexed without that FK. No rate calculation or rule precedence is established.

Columns: 28. Unique keys: `XPKACCESSORIAL_DETAIL` (`RATING_ID`, `RATING_SERVICE`, `ACCESSORIAL_CODE`, `ACCESSORIAL_SUB_CODE`); `XAK1ACCESSORIAL_DETAIL` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1469248289.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ACCESSORIAL_HEADER

Define accessorial codes within a rating service and rating identifier.

The service/code/rating-ID primary key and separate unique identity coexist. Apply-per-container and always-apply fields store applicability flags. The service/rating FK is untrusted, and flag defaults remain opaque.

Columns: 19. Unique keys: `XPKACCESSORIAL_HEADER` (`RATING_SERVICE`, `ACCESSORIAL_CODE`, `RATING_ID`); `XAK1ACCESSORIAL_HEADER` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1501248403.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ADVANCED_ALLOCATION

Store item, company or item-class allocation percentage and full-location controls.

An identity primary key identifies each row; item and item-class indexes are nonunique. Percentage minimum/maximum columns and full-location flags support a settings role, but no uniqueness or precedence between item and class is enforced by these keys.

Columns: 19. Unique keys: `XPKADVANCED_ALLOCATION` (`INTERNAL_ADV_ALLOC_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1661248973.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ALLOCATION_RULE_DETAIL

Store allocation-rule sequence entries with strategy, location selection and eligible units.

OBJECT_ID is the primary key and ALLOCATION_NAME has a trusted FK to the rule header. Sequence is a required field but not a unique key, so duplicate sequence values are structurally possible. LOT defaults to zero; strategy and location selection are nullable. Their runtime evaluation order is outside the schema.

Columns: 19. Unique keys: `XPKALLOCATION_RULE_DETAIL` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1693249087.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ALLOCATION_RULE_HEADER

Define named allocation-rule descriptions and active flags.

ALLOCATION_NAME is the primary key; description and active are required. The header identifies rules referenced by detail rows without describing how allocation executes them.

Columns: 14. Unique keys: `XPKALLOCATION_RULE_HEADER` (`ALLOCATION_NAME`). Outgoing foreign keys: 0.

[Captured object](objects/1725249201.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.APPOINTMENT_SCHEDULE

Store appointment start/end and dock information linked optionally to a receipt.

The identity primary key distinguishes appointments. INTERNAL_RECEIPT_NUM is nullable and has a trusted receipt-header FK; its index is nonunique. Start and end times are nullable, with no captured check enforcing interval ordering or one appointment per receipt.

Columns: 16. Unique keys: `XPKAPPOINTMENT_SCHEDULE` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1853249657.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.APP_IDENTIFIER

Define barcode application-identifier formats, lengths, units and mapped fields.

APP_IDENTIFIER is the primary key. String length/type and decimal indicator are required; separator ASCII code is nullable and constrained to 0 through 255 when supplied. The schema does not implement scan parsing or validate a configured format string.

Columns: 22. Unique keys: `XPKAPP_IDENTIFIER` (`APP_IDENTIFIER`). Outgoing foreign keys: 0.

[Captured object](objects/1821249543.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.APP_ID_TEMPLATE_DTL

Associate ordered scan-template entries with application identifiers and mapped fields.

Identity rows reference both a template header and application identifier through trusted FKs. Scan number and sequence are required but have no captured combined uniqueness. Check-digit and mapped-field columns store controls without proving enforcement during scans.

Columns: 19. Unique keys: `XPKAPP_ID_TEMPLATE_DTL` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/1757249315.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.APP_ID_TEMPLATE_HDR

Store scan-template names, scan counts and verification/FNC1 options.

OBJECT_ID is the only primary key; template name is required but not uniquely constrained in the captured indexes. Number-of-scans, verification, FNC1 and active fields are required. No configured values or actual prompt sequence are established.

Columns: 18. Unique keys: `XPKAPP_ID_TEMPLATE_HDR` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1789249429.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ARCHIVE_PREFERENCES

Store retention-process configuration, history-day limits and last-run timestamps.

ARCHIVE_ID is the primary key. Process, save/run/active flags, history days and storage type are required; path/filter and last-run timestamp are nullable. This describes configuration storage only, not a verified scheduled run, retention outcome or access to retained records.

Columns: 24. Unique keys: `XPKARCHIVE_PREFERENCES` (`ARCHIVE_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1049770797.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ARCHIVE_PREFERENCES_ORIG20260922

Store a structurally corresponding copy of retention-preference fields.

All column names/types/nullability match ARCHIVE_PREFERENCES, while this table is a heap with no captured defaults or unique key. The name does not establish when or how it was copied, whether it is used, or which rows are authoritative.

Columns: 24. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/83843711.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ARCHIVE_TABLES

Store a table-name registry with per-table maximum-row settings.

TABLE_NAME is the primary key and MAX_ROWS is required with a bound default. Schema does not prove which retention caller consumes the registry, interprets the limit or performs deletion.

Columns: 13. Unique keys: `XPKARCHIVE_TABLES` (`TABLE_NAME`). Outgoing foreign keys: 0.

[Captured object](objects/1081770911.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_1SHIPPING_CONTAINER

Represent an alternate container hierarchy, quantities, shipment references and manifest measurements schema.

The combined fields INTERNAL_CONTAINER_NUM, PARENT, QUANTITY, MANIFEST_STATE support this record-shape interpretation. The paired SHIPPING_CONTAINER schema has 81 equal column definitions across name, type, byte length, precision, scale and nullability. Fields absent here: INTERNAL_MOP_NUMBER, QC_STATUS, QC_ASSIGNMENT_ID, PALLET_UM_CONVERSION_IDENTIFIER, PALLET_UM_CONVERSION_PARENT_UM, MMS_PIECE_ID. ITEM differs (max_length: 50 here versus 100 in counterpart). Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 82. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1885249771.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_APPOINTMENT_SCHEDULE

Represent an alternate receipt-to-dock appointment interval schema.

The combined fields INTERNAL_RECEIPT_NUM, DOCK, APPT_DATE_TIME, END_DATE_TIME support this record-shape interpretation. The paired APPOINTMENT_SCHEDULE schema has 16 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 16. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1901249828.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_AUDIT_LOG

Represent an alternate method/class audit-event context and machine/time coordinates schema.

The combined fields METHOD_NAME, CLASS_NAME, CONTEXT, MACHINE_NAME, LOGGED_DATE_TIME support this record-shape interpretation. The paired AUDIT_LOG schema has 19 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 19. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1917249885.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_AUDIT_LOG_VALUE

Represent an alternate typed values associated with an audit internal identifier schema.

The combined fields INTERNAL_ID, FIELD_TYPE, VALUE support this record-shape interpretation. The paired AUDIT_LOG_VALUE schema has 15 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 15. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1877842002.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_CLOSED_MANIFESTS

Represent an alternate shipper/carrier manifest closure date, sequence and pickup reference schema.

The combined fields SHIPPER_CODE, CARRIER_SYMBOL, DATE_CLOSED, IN_CLOSURE, SEQUENCE, PICKUP_RECORD_NUMBER support this record-shape interpretation. The paired CLOSED_MANIFESTS schema has 18 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 18. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1933249942.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_COMMENT_TEXT

Represent an alternate typed comment text attached to record and line identifiers schema.

The combined fields RECORD_TYPE, INTERNAL_NUM, INTERNAL_LINE_NUM, COMMENT_TYPE, TEXT support this record-shape interpretation. The paired COMMENT_TEXT schema has 17 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 17. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1949249999.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_CONFIG_DIR_COLLECTED_DATA

Represent an alternate project-instance query text representation schema.

The combined fields PROJECT_NAME, PROJECT_INSTANCE, QUERY support this record-shape interpretation. The paired CONFIG_DIR_COLLECTED_DATA schema has 4 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 4. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1965250056.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_CYCLE_COUNT_PLAN

Represent an alternate count-plan creation/completion, totals and adjustment-type references schema.

The combined fields MASTER_NAME, CREATED_DATE, COMPLETED_DATE, TOTAL_OPEN, TOTAL_REVIEWED, NEGATIVE_ADJ_TYPE, POSITIVE_ADJ_TYPE support this record-shape interpretation. The paired CYCLE_COUNT_PLAN schema has 28 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 28. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1981250113.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_CYCLE_COUNT_REQUEST

Represent an alternate location/item count request with counted and system quantities schema.

The combined fields LOCATION, ITEM, QUANTITY_COUNTED, SYSTEM_QUANTITY, COUNTED_BY_USER, CONDITION support this record-shape interpretation. The paired CYCLE_COUNT_REQUEST schema has 39 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 39. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/5835333.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_DELETED_RECEIPT_CONTAINER

Represent an alternate receipt-container quantity, status and source/destination reference shape schema.

The combined fields INTERNAL_REC_CONT_NUM, INTERNAL_RECEIPT_NUM, QUANTITY, STATUS, FROM_LOCATION, TO_LOCATION support this record-shape interpretation. The paired DELETED_RECEIPT_CONTAINER schema has 64 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 64. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1893842059.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_DIF_INCOMING_MESSAGE

Represent an alternate incoming-message envelope, multipart payload, timings and error representation schema.

The combined fields MSG_ID, ENCODING, SOURCE_ID, ENDPOINT_ID, EVENT_ID, DATA, MSG_PART30, ERROR_DETAILS support this record-shape interpretation. The paired DIF_INCOMING_MESSAGE schema has 54 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 54. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1997250170.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_DIF_OUTGOING_MESSAGE

Represent an alternate outgoing-message event, status, multipart payload and error representation schema.

The combined fields MSG_ID, EVENT_ID, STATUS, DATA, MSG_PART30, ERROR_DETAILS support this record-shape interpretation. The paired DIF_OUTGOING_MESSAGE schema has 47 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 47. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/2013250227.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_DOCK_MGMT_WORK_DATA

Represent an alternate dock movement source/destination, container and quantity representation schema.

The combined fields FROM_WAREHOUSE, FROM_LOC, TO_LOC, INTERNAL_CONTAINER_NUM, QUANTITY, WORK_CREATED support this record-shape interpretation. The paired DOCK_MGMT_WORK_DATA schema has 38 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 38. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/2029250284.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_DOWNLOAD_ITEM

Represent an alternate item interface payload with allocation/locating references and ten unit/dimension groups schema.

The combined fields INTERFACE_RECORD_ID, ITEM, ALLOCATION_RULE, LOCATING_RULE, CONVERSION_QTY_10, QUANTITY_UM_10, INBOUND_QC_ELIGIBLE support this record-shape interpretation. The paired DOWNLOAD_ITEM schema has 280 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 280. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/2045250341.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_DOWNLOAD_ORDER_COMMENT

Represent an alternate order-comment interface envelope with shipment/line reference and text schema.

The combined fields INTERFACE_RECORD_ID, INTERFACE_LINK_ID, SHIPMENT_ID, ERP_ORDER_LINE_NUM, TEXT support this record-shape interpretation. The paired DOWNLOAD_ORDER_COMMENT schema has 20 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 20. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/2061250398.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_DOWNLOAD_ORDER_CONTAINER

Represent an alternate order-container interface payload with dimensions, quantities and temporary shipment references schema.

The combined fields INTERFACE_RECORD_ID, CONTAINER_ID, QUANTITY, TMP_INTERNAL_SHIPMENT_NUM, TRACKING_NUMBER support this record-shape interpretation. The paired DOWNLOAD_ORDER_CONTAINER schema has 60 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 60. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/2077250455.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_DOWNLOAD_ORDER_DETAIL

Represent an alternate order-line interface payload with item, allocation quantities and packing attributes schema.

The combined fields INTERFACE_RECORD_ID, ITEM, INITIAL_QTY, OPEN_QTY, PACKING_CLASS, MINIMUM_ALLOC_PCT support this record-shape interpretation. The paired DOWNLOAD_ORDER_DETAIL schema has 130 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 130. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/2093250512.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_DOWNLOAD_ORDER_HEADER

Represent an alternate order-header interface payload with customer/delivery addresses, shipping dates and freight values schema.

The combined fields INTERFACE_RECORD_ID, CUSTOMER, SHIP_TO, SCHEDULED_SHIP_DATE, TOTAL_FREIGHT_CHARGE support this record-shape interpretation. The paired DOWNLOAD_ORDER_HEADER schema has 159 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 159. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/2109250569.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_DOWNLOAD_PURCHASE_ORDER_DETAIL

Represent an alternate purchase-order line interface payload with item and total/open quantities schema.

The combined fields INTERFACE_RECORD_ID, PURCHASE_ORDER_OBJECT_ID, LINE_NUMBER, ITEM, TOTAL_QUANTITY, OPEN_QUANTITY support this record-shape interpretation. The paired DOWNLOAD_PURCHASE_ORDER_DETAIL schema has 49 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 49. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/2125250626.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_DOWNLOAD_PURCHASE_ORDER_HEADER

Represent an alternate purchase-order interface header with status and source/ship-from addresses schema.

The combined fields INTERFACE_RECORD_ID, PURCHASE_ORDER_ID, STATUS, SHIP_FROM, SOURCE_ID support this record-shape interpretation. The paired DOWNLOAD_PURCHASE_ORDER_HEADER schema has 48 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 48. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/2141250683.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_DOWNLOAD_RECEIPT_CONTAINER

Represent an alternate receipt-container interface payload with parent links, movements and converted quantity schema.

The combined fields INTERFACE_RECORD_ID, INTERFACE_PARENT_LINK_ID, CONTAINER_ID, FROM_LOCATION, TO_LOCATION, CONVERTED_LOC_QTY support this record-shape interpretation. The paired DOWNLOAD_RECEIPT_CONTAINER schema has 49 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 49. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/9767092.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_DOWNLOAD_RECEIPT_DETAIL

Represent an alternate receipt-line interface payload with item, totals, units and purchase-order reference schema.

The combined fields INTERFACE_RECORD_ID, ITEM, TOTAL_QTY, QUANTITY_UM, PURCHASE_ORDER_ID, PURCHASE_ORDER_LINE_NUMBER support this record-shape interpretation. The paired DOWNLOAD_RECEIPT_DETAIL schema has 77 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 77. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/25767149.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_DOWNLOAD_RECEIPT_HEADER

Represent an alternate receipt-header interface envelope with arrival schedule, source and carrier attributes schema.

The combined fields INTERFACE_RECORD_ID, RECEIPT_ID, SCHEDULED_DATE_TIME, ARRIVED_DATE_TIME, SOURCE_ID, CARRIER support this record-shape interpretation. The paired DOWNLOAD_RECEIPT_HEADER schema has 66 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 66. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/41767206.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_IA_WORK_INSTRUCTION

Represent an alternate instruction sequence, assignment, source/destination and container representation schema.

The combined fields INTERNAL_INSTRUCTION_NUM, WORK_UNIT, SEQUENCE, CONDITION, USER_ASSIGNED, FROM_LOC, TO_LOC, LOCKED support this record-shape interpretation. The paired IA_WORK_INSTRUCTION schema has 102 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 102. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/57767263.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_INTERFACE_ERROR

Represent an alternate interface error-message/file references and twenty external identifier slots schema.

The combined fields INTERNAL_ERROR_NUMBER, ORIGINAL_FILE_PATH, ERROR_FILE_PATH, ERROR_MSG, REFERENCE_ID20 support this record-shape interpretation. The paired INTERFACE_ERROR schema has 40 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 40. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/73767320.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_INV_MGMT_WORK_DATA

Represent an alternate inventory adjustment/movement work payload with item quantities and source/destination attributes schema.

The combined fields INTERNAL_INV_MGT_REQ_NUM, ADJUSTMENT_TYPE, ITEM, QUANTITY, FROM_LOC, TO_LOC, WORK_CREATED support this record-shape interpretation. The paired INV_MGMT_WORK_DATA schema has 72 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 72. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/89767377.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_LABOR_MANAGEMENT_DETAIL

Represent an alternate labor activity interval, measured totals, rate/goal and work references schema.

The combined fields ACTIVITY_TYPE, USER_NAME, START_DATE_TIME, END_DATE_TIME, TOTAL_ACTUAL_TIME, ACTUAL_RATE, GOAL_RATE, WORK_UNIT support this record-shape interpretation. The paired LABOR_MANAGEMENT_DETAIL schema has 56 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 56. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/105767434.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_LABOR_MANAGEMENT_SUMMARY

Represent an alternate user/activity monthly labor totals schema.

The combined fields ACTIVITY_TYPE, USER_NAME, MONTH, YEAR, TOTAL_ACTUAL_TIME, TOTAL_TRANSACTIONS, TOTAL_LABOR_COST support this record-shape interpretation. The paired LABOR_MANAGEMENT_SUMMARY schema has 30 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 30. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/121767491.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_LAUNCH_STATISTICS

Represent an alternate launch/wave status, step, timings and quantity totals schema.

The combined fields INTERNAL_LAUNCH_NUM, LAUNCH_FLOW, CURRENT_LAUNCH_STEP, TOTAL_SHIPMENTS, LAUNCH_DATE_TIME_STARTED, RELEASED support this record-shape interpretation. The paired LAUNCH_STATISTICS schema has 37 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 37. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/137767548.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_LAUNCH_SUMMARY

Represent an alternate dated warehouse launch quantity and measurement totals schema.

The combined fields LAUNCH_DATE, warehouse, TOTAL_SHIPMENTS, TOTAL_QTY, TOTAL_WEIGHT, TOTAL_VOLUME support this record-shape interpretation. The paired LAUNCH_SUMMARY schema has 23 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 23. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/153767605.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_LOCATING_REQUEST

Represent an alternate item/container locating request with quantities, destination, receipt references and sequence schema.

The combined fields INTERNAL_LOC_REQ_NUM, ITEM, LOCATE_QTY, TO_LOC, PUTAWAY_SEQ, INTERNAL_RECEIPT_LINE_NUM support this record-shape interpretation. The paired LOCATING_REQUEST schema has 86 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 86. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/169767662.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_LOCATION_INVENTORY_ATTRIBUTES

Represent an alternate twenty inventory-attribute slots and shipping-container reference schema.

The combined fields OBJECT_ID, LOC_INV_ATTRIBUTE1, LOC_INV_ATTRIBUTE20, INTERNAL_SHIPPING_CONTAINER_NUM support this record-shape interpretation. The paired LOCATION_INVENTORY_ATTRIBUTES schema has 32 equal column definitions across name, type, byte length, precision, scale and nullability. OBJECT_ID differs (is_nullable: True here versus False in counterpart). Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 33. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/185767719.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_MULTI_ORDER_PALLET

Represent an alternate warehouse pallet identifier and internal number schema.

The combined fields INTERNAL_MOP_NUMBER, MULTI_ORDER_PALLET_ID, WAREHOUSE support this record-shape interpretation. The paired MULTI_ORDER_PALLET schema has 14 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 14. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1909842116.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_NOTIFICATION_MESSAGE

Represent an alternate notification message, file reference, status and delivery/creation times schema.

The combined fields NOTIFICATION, MESSAGE, FILE_PATH, STATUS, DELIVERED_DATE_TIME_STAMP, CREATION_DATE_TIME_STAMP support this record-shape interpretation. The paired NOTIFICATION_MESSAGE schema has 18 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 18. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/233767890.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_ORDER_DETAIL

Represent an alternate order-line item, customer/ship-to context and initial/open/shipped quantities schema.

The combined fields INTERNAL_ORDER_DTL_NUM, INTERNAL_ORDER_NUM, ITEM, INITIAL_QTY, OPEN_QTY, SHIPPED_QTY support this record-shape interpretation. The paired ORDER_DETAIL schema has 126 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 126. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/249767947.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_ORDER_HEADER

Represent an alternate order identity, condition, destination and shipment totals schema.

The combined fields INTERNAL_ORDER_NUM, ERP_ORDER, CONDITION, SHIP_TO, TOTAL_SHIPMENTS, WEIGHT_SHIPPED support this record-shape interpretation. The paired ORDER_HEADER schema has 114 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 114. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/265768004.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_PROCESS_HISTORY

Represent an alternate warehouse process/action event, identifiers and message schema.

The combined fields PROCESS, ACTION, ACTIVITY_DATE_TIME, IDENTIFIER1, IDENTIFIER4, MESSAGE support this record-shape interpretation. The paired PROCESS_HISTORY schema has 21 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 21. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/281768061.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_PURCHASE_ORDER_HEADER

Represent an alternate purchase-order identity, status, warehouse and source/ship-from context schema.

The combined fields PURCHASE_ORDER_ID, STATUS, WAREHOUSE, SOURCE_ID, SHIP_FROM, CLOSED_DATE_TIME support this record-shape interpretation. The paired PURCHASE_ORDER_HEADER schema has 45 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 45. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/297768118.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_QUALITY_HISTORY

Represent an alternate user/item quality-event work and reason references schema.

The combined fields USER_NAME, WORK_TYPE, ACTIVITY_DATE_TIME, ITEM, REASON_CODE, WORK_INSTRUCTION_NUM support this record-shape interpretation. The paired QUALITY_HISTORY schema has 27 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 27. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/313768175.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_RECEIPT_CATCH_WEIGHT_INFO

Represent an alternate receipt-line/container catch weight with item, lot, serial and unit schema.

The combined fields CONTAINER_NUM, INTERNAL_RECEIPT_LINE_NUM, ITEM, LOT, SERIAL_NUM, CATCH_WEIGHT, WEIGHT_UM support this record-shape interpretation. The paired RECEIPT_CATCH_WEIGHT_INFO schema has 22 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 22. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1925842173.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_RECEIPT_CONTAINER

Represent an alternate receipt-container identity, quantity, status and movement references schema.

The combined fields INTERNAL_REC_CONT_NUM, INTERNAL_RECEIPT_NUM, QUANTITY, STATUS, FROM_LOCATION, TO_LOCATION, CREATED_BY support this record-shape interpretation. The paired RECEIPT_CONTAINER schema has 64 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 64. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/329768232.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_RECEIPT_DETAIL

Represent an alternate receipt-line item, total/open quantities and purchase-order references schema.

The combined fields INTERNAL_RECEIPT_LINE_NUM, INTERNAL_RECEIPT_NUM, ITEM, TOTAL_QTY, OPEN_QTY, PURCHASE_ORDER_DETAIL_ID support this record-shape interpretation. The paired RECEIPT_DETAIL schema has 83 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 83. Unique keys: `XPKAR_RECEIPT_DETAIL` (`INTERNAL_RECEIPT_LINE_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/345768289.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_RECEIPT_HEADER

Represent an alternate receipt identity, carrier/source information, timings and leading/trailing statuses schema.

The combined fields INTERNAL_RECEIPT_NUM, RECEIPT_ID, CARRIER, SOURCE_ID, LEADING_STS, TRAILING_STS support this record-shape interpretation. The paired RECEIPT_HEADER schema has 83 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 83. Unique keys: `XPKAR_RECEIPT_HEADER` (`INTERNAL_RECEIPT_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/377768403.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_RECEIPT_QUALITY_HISTORY

Represent an alternate receipt quality-event item, expected/actual dates, quantities and reason schema.

The combined fields INTERNAL_RECEIPT_LINE_NUM, ITEM, OVER_QUANTITY, QUANTITY_SHORTAGE, EXPECTED_RECEIPT_DATE, ACTUAL_RECEIPT_DATE, REASON_CODE support this record-shape interpretation. The paired RECEIPT_QUALITY_HISTORY schema has 31 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 31. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/409768517.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_REPLENISHMENT_REQUEST

Represent an alternate allocated replenishment quantity, item, locations and work-creation flags schema.

The combined fields INTERNAL_RPLN_REQ_NUM, ITEM, ALLOCATED_QTY, FROM_LOC, TO_LOC, WORK_CREATED, REPLENISHMENT_MODE support this record-shape interpretation. The paired REPLENISHMENT_REQUEST schema has 67 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 67. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/425768574.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_RFID_HISTORY

Represent an alternate RFID event/device, container and activity message representation schema.

The combined fields EVENT, DEVICE, CONTAINER_NUM, CONTAINER_ID, EPC, MESSAGE, ACTIVITY_DATE_TIME support this record-shape interpretation. The paired RFID_HISTORY schema has 23 equal column definitions across name, type, byte length, precision, scale and nullability. PROCESS_STAMP differs (type_name: nvarchar here versus varchar in counterpart; max_length: 200 here versus 100 in counterpart). Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 24. Unique keys: `XPKAR_RFID_HISTORY` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/441768631.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_SCAN_AND_WEIGH_REQUESTS

Represent an alternate typed request string and processed flag schema.

The combined fields INTERNAL_REQUEST_NUM, REQUEST_TYPE, REQUEST_STRING, PROCESSED support this record-shape interpretation. The paired SCAN_AND_WEIGH_REQUESTS schema has 15 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 15. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/473768745.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_SHIPMENT_ACCESSORIALS

Represent an alternate shipment/container accessorial code, value and freight-charge amounts schema.

The combined fields INTERNAL_NUM, SHIPMENT_LEVEL, ACCESSORIAL_CODE, ACCESSORIAL_SUB_CODE, VALUE, CARRIER_FREIGHT_CHARGE support this record-shape interpretation. The paired SHIPMENT_ACCESSORIALS schema has 23 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 23. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/521768916.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_SHIPMENT_ALLOC_REQUEST

Represent an alternate shipment-line allocation request with allocated quantity and source/destination schema.

The combined fields INTERNAL_SHIP_ALLOC_NUM, INTERNAL_SHIPMENT_LINE_NUM, ITEM, ALLOCATED_QTY, FROM_LOC, TO_LOC, WORK_CREATED support this record-shape interpretation. The paired SHIPMENT_ALLOC_REQUEST schema has 99 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 99. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/537768973.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_SHIPMENT_DETAIL

Represent an alternate shipment-line item, total quantity, ten quantity/status slots and packing attributes schema.

The combined fields INTERNAL_SHIPMENT_LINE_NUM, ITEM, TOTAL_QTY, STATUS1, QUANTITY_AT_STS1, STATUS10, QUANTITY_AT_STS10, PACKING_CLASS support this record-shape interpretation. The paired SHIPMENT_DETAIL schema has 158 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 158. Unique keys: `XPKAR_SHIPMENT_DETAIL` (`INTERNAL_SHIPMENT_LINE_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/553769030.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_SHIPMENT_HEADER

Represent an alternate shipment identity, leading/trailing status, routing/address and shipment-date representation schema.

The combined fields INTERNAL_SHIPMENT_NUM, SHIPMENT_ID, LEADING_STS, TRAILING_STS, SHIP_TO, SCHEDULED_SHIP_DATE, ACTUAL_SHIP_DATE_TIME support this record-shape interpretation. The paired SHIPMENT_HEADER schema has 169 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 169. Unique keys: `XPKAR_SHIPMENT_HEADER` (`INTERNAL_SHIPMENT_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/585769144.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_SHIPMENT_HEADER_LOCATION

Represent an alternate shipment-header to location/subclass identifier association schema.

The combined fields SHIPMENT_HEADER, LOCATION, LOCATION_SUBCLASS support this record-shape interpretation. The paired SHIPMENT_HEADER_LOCATION schema has 15 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 15. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/617769258.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_SHIPPING_CONTAINER

Represent an alternate shipping-container hierarchy, item quantities, manifest and QC references schema.

The combined fields INTERNAL_CONTAINER_NUM, PARENT, ITEM, QUANTITY, MANIFEST_STATE, QC_STATUS, QC_ASSIGNMENT_ID support this record-shape interpretation. The paired SHIPPING_CONTAINER schema has 88 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 88. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/697769543.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_SHIPPING_CONTAINER_LOCATION

Represent an alternate shipping-container to location/subclass identifier association schema.

The combined fields SHIPPING_CONTAINER, LOCATION, LOCATION_SUBCLASS support this record-shape interpretation. The paired SHIPPING_CONTAINER_LOCATION schema has 15 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 15. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/713769600.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_SHIPPING_CONT_QC_COUNT

Represent an alternate container/item count quantity with company, lot and unit schema.

The combined fields INTERNAL_CONTAINER_NUM, ITEM, COMPANY, LOT, COUNTED_QUANTITY, QUANTITY_UM support this record-shape interpretation. The paired SHIPPING_CONT_QC_COUNT schema has 18 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 18. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/633769315.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_SHIPPING_CONT_QC_EVALUATION

Represent an alternate QC assignment/container association and matched flag schema.

The combined fields QC_ASSIGNMENT_ID, INTERNAL_CONTAINER_NUM, MATCHED support this record-shape interpretation. The paired SHIPPING_CONT_QC_EVALUATION schema has 15 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 15. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/649769372.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_SHIPPING_CONT_QC_REASON_COD

Represent an alternate QC count reason and failed quantity schema.

The combined fields QC_COUNT_ID, REASON_CODE, FAILED_QUANTITY support this record-shape interpretation. The paired SHIPPING_CONT_QC_REASON_CODE schema has 15 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 15. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/665769429.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_SHIPPING_CONT_QC_REASON_CODE

Represent an alternate QC count reason and failed quantity schema.

The combined fields QC_COUNT_ID, REASON_CODE, FAILED_QUANTITY support this record-shape interpretation. The paired SHIPPING_CONT_QC_REASON_CODE schema has 15 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 15. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/681769486.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_SHIPPING_LOAD

Represent an alternate warehouse/carrier load status, departure timing and trailer/seal references schema.

The combined fields INTERNAL_LOAD_NUM, CARRIER, LEADING_STS, TRAILING_STS, LOAD_CLOSED, TRAILER_ID, SEAL_ID support this record-shape interpretation. The paired SHIPPING_LOAD schema has 41 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 41. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/729769657.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_STATISTICS_VALUE

Represent an alternate numeric statistic value identified by source key and field identifier schema.

The combined fields SOURCE_KEY, FIELD_ID, VALUE support this record-shape interpretation. The paired STATISTICS_VALUE schema has 15 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 15. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/745769714.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_SUMMARY_REQUESTS

Represent an alternate typed summary request with old and new text representations schema.

The combined fields REQUEST_NUM, RECORD_TYPE, REQUEST_TYPE, OLD_STRING, NEW_STRING support this record-shape interpretation. The paired SUMMARY_REQUESTS schema has 16 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 16. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/761769771.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_TOTE_DETAIL

Represent an alternate tote shipment/container/instruction references and sorted/pack quantities schema.

The combined fields TOTE_HEADER_ID, INTERNAL_SHIPMENT_NUM, INTERNAL_CONTAINER_NUM, INTERNAL_INSTRUCTION_NUM, SORTED_QUANTITY, QUANTITY_TO_PACK support this record-shape interpretation. The paired TOTE_DETAIL schema has 33 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 33. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1861841945.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_TOTE_HEADER

Represent an alternate warehouse tote identity, assigned user, condition and sorting flag schema.

The combined fields WAREHOUSE, TOTE_ID, USER_ASSIGNED, CONDITION, MARK_FOR_SORTING support this record-shape interpretation. The paired TOTE_HEADER schema has 17 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 17. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1845841888.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_TRANSACTION_HISTORY

Represent an alternate transaction identity, item/location, before/after quantities and statuses schema.

The combined fields TRANSACTION_TYPE, ITEM, LOCATION, BEFORE_ON_HAND_QTY, AFTER_ON_HAND_QTY, BEFORE_STS, AFTER_STS support this record-shape interpretation. The paired TRANSACTION_HISTORY schema has 51 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 51. Unique keys: `XPKAR_TRANSACTION_HISTORY` (`INTERNAL_ID`). Outgoing foreign keys: 0.

[Captured object](objects/793769885.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_TRANS_HIST_ATTRIBUTES

Represent an alternate typed attribute value associated with a history link identifier schema.

The combined fields LINK_ID, ATTRIBUTE_TYPE, ATTRIBUTE_VALUE support this record-shape interpretation. The paired TRANS_HIST_ATTRIBUTES schema has 15 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 15. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/777769828.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_UPLOAD_INVENTORY_TRANS

Represent an alternate inventory-transaction interface envelope with before/after quantities and statuses schema.

The combined fields INTERFACE_RECORD_ID, INTERFACE_ACTION_CODE, INTERFACE_ERROR, BEFORE_ON_HAND_QTY, AFTER_ON_HAND_QTY, BEFORE_STS, AFTER_STS support this record-shape interpretation. The paired UPLOAD_INVENTORY_TRANS schema has 51 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 51. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/825769999.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_UPLOAD_ITEM_BALANCE

Represent an alternate item-balance interface envelope with quantity buckets and valuation totals schema.

The combined fields INTERFACE_RECORD_ID, ITEM, ALLOCATED_QTY, ON_HAND_QTY, SUSPENSE_QTY, IN_TRANSIT_QTY, TOTAL_VALUE support this record-shape interpretation. The paired UPLOAD_ITEM_BALANCE schema has 37 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 37. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/841770056.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_UPLOAD_ORDER_COMMENT

Represent an alternate order-comment interface text with parent/line identifiers schema.

The combined fields INTERFACE_RECORD_ID, INTERFACE_LINK_ID, INTERNAL_NUM, INTERNAL_LINE_NUM, TEXT support this record-shape interpretation. The paired UPLOAD_ORDER_COMMENT schema has 21 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 21. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/857770113.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_UPLOAD_RECEIPT_CONTAINER

Represent an alternate receipt-container interface envelope with quantity, dimensions and internal references schema.

The combined fields INTERFACE_RECORD_ID, CONTAINER_ID, QUANTITY, LENGTH, WIDTH, HEIGHT, INTERNAL_REC_CONT_NUM support this record-shape interpretation. The paired UPLOAD_RECEIPT_CONTAINER schema has 59 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 59. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/921770341.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_UPLOAD_RECEIPT_DETAIL

Represent an alternate receipt-line interface envelope with item, totals and internal/purchase-order references schema.

The combined fields INTERFACE_RECORD_ID, ITEM, TOTAL_QTY, INTERNAL_RECEIPT_LINE_NUM, PURCHASE_ORDER_ID, PURCHASE_ORDER_LINE_NUMBER support this record-shape interpretation. The paired UPLOAD_RECEIPT_DETAIL schema has 84 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 84. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/937770398.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_UPLOAD_RECEIPT_HEADER

Represent an alternate receipt-header interface envelope with arrival/closure times, source and totals schema.

The combined fields INTERFACE_RECORD_ID, RECEIPT_ID, ARRIVED_DATE_TIME, CLOSE_DATE, SOURCE_ID, TOTAL_QTY support this record-shape interpretation. The paired UPLOAD_RECEIPT_HEADER schema has 76 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 76. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/953770455.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_USER_ACTIVITY

Represent an alternate user/session device, logon, last action and logoff timestamps schema.

The combined fields GUID, USER_NAME, USER_TYPE, DEVICE, LOGON_DATE_TIME, LAST_ACTION_DATE_TIME, LOGOFF_DATE_TIME support this record-shape interpretation. The paired USER_ACTIVITY schema has 22 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 22. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/969770512.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_WAREHOUSE_ALERT_REQUEST

Represent an alternate alert request source, message, processed flag and review/closure stamps schema.

The combined fields INTERNAL_ALERT_REQ_NUM, INTERNAL_SOURCE_NUM, MESSAGE, PROCESSED, REVIEWED_DATE_TIME, CLOSED_DATE_TIME support this record-shape interpretation. The paired WAREHOUSE_ALERT_REQUEST schema has 25 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 25. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/985770569.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_WORK_INSTRUCTION

Represent an alternate work-unit instruction sequence, condition, assignment and movement quantities schema.

The combined fields INTERNAL_INSTRUCTION_NUM, WORK_UNIT, SEQUENCE, CONDITION, USER_ASSIGNED, FROM_QTY, TO_QTY, LOCKED support this record-shape interpretation. The paired WORK_INSTRUCTION schema has 102 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 102. Unique keys: `XPKAR_WORK_INSTRUCTION` (`INTERNAL_INSTRUCTION_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1001770626.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_WORK_ORDER_DETAIL

Represent an alternate work-order component item/build sequence with needed/used quantities schema.

The combined fields INTERNAL_WORK_ORDER_NUM, ITEM, BUILD_SEQUENCE, BUILD_LEVEL, QTY_NEEDED_PER_ITEM, TOTAL_QTY_NEEDED, TOTAL_QTY_USED support this record-shape interpretation. The paired WORK_ORDER_DETAIL schema has 51 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 51. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1941842230.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_WORK_ORDER_HEADER

Represent an alternate build order identity, item, quantities, condition and completion dates schema.

The combined fields INTERNAL_WORK_ORDER_NUM, WORK_ORDER_ID, ITEM, QTY_TO_BE_BUILT, QTY_BUILT, CONDITION, COMPLETION_DATE_TIME support this record-shape interpretation. The paired WORK_ORDER_HEADER schema has 48 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 48. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1033770740.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AR_WORK_ORDER_PUTAWAY_UNIT

Represent an alternate work-order putaway-unit quantity, item, location and launch reference schema.

The combined fields INTERNAL_PUTAWAY_NUM, PUTAWAY_UNIT_ID, INTERNAL_WORK_ORDER_NUM, QUANTITY, ITEM, LOCATION, LAUNCH_NUM support this record-shape interpretation. The paired WORK_ORDER_PUTAWAY_UNIT schema has 35 equal column definitions across name, type, byte length, precision, scale and nullability. Identity, indexes, keys, foreign keys and defaults are bound separately to this table; the counterpart does not supply constraints absent here. No producer, retention period, move/delete rule, delivery success or live state is inferred.

Columns: 35. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1957842287.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ASSET_MANAGEMENT_DETAIL

Represent warehouse/session/work-type asset-activity totals and time intervals.

The primary key orders warehouse, SESSION_ID, IDENTIFIER_NUM and WORK_TYPE. Required START_DATE_TIME and END_DATE_TIME accompany nullable actual time, instruction/work-unit counts, quantity and labor-cost measurements. USER_NAME, EQUIPMENT_TYPE and REFERENCE_ID are nullable descriptive context. Bound default 652581413 is captured for numeric measures; its reviewed definition is zero. No foreign key supplies a session or user relationship, and no aggregation formula or time-unit interpretation is established.

Columns: 32. Unique keys: `XPKASSET_MANAGEMENT_DETAIL` (`warehouse`, `SESSION_ID`, `IDENTIFIER_NUM`, `WORK_TYPE`). Outgoing foreign keys: 0.

[Captured object](objects/1113771025.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ASSET_MANAGEMENT_REQUESTS

Represent an asset-management request identifier, optional text payload and processed flag.

The identity INTERNAL_REQUEST_NUM is the primary key. REQUEST_STRING is nullable and PROCESSED is required; the schema does not define a payload grammar, processor, retry order or meanings of the processed values. The two numeric user fields bind to default 652581413, whose reviewed definition is zero. No foreign key supplies a detail/session link.

Columns: 14. Unique keys: `XPKASSET_MANAGEMENT_REQUESTS` (`INTERNAL_REQUEST_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1145771139.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ASSET_MANAGEMENT_SUMMARY

Store work/labor quantity, time, cost, weight and volume summaries by optional dimensions.

Identity key distinguishes rows; warehouse, user, team, item and summary date are nullable. Stored totals and hourly measures do not prove their calculation, freshness or observed productivity.

Columns: 40. Unique keys: `XPKASSET_MANAGEMENT_SUMMARY` (`INTERNAL_ASSET_SUM_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1177771253.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ATTRIBUTE

Associate an attribute name with a form-key name.

The combined form-key/attribute primary key defines membership, with no attribute value or expression column and no captured foreign key.

Columns: 13. Unique keys: `XPKATTRIBUTE` (`FORM_KEY_NAME`, `ATTRIBUTE`). Outgoing foreign keys: 0.

[Captured object](objects/1209771367.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AUDIT_LOG

Store logged application method/class/context and optional warehouse/machine metadata.

Identity key and required logged timestamp support event-record storage; optional context and nonunique timestamp indexes do not prove complete or immutable auditing.

Columns: 19. Unique keys: `XPKAUDIT_LOG` (`INTERNAL_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1241771481.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AUDIT_LOG_VALUE

Store typed textual values attached to audit-log records.

Identity key plus required trusted parent FK supports multiple value rows per log. FIELD_TYPE is indexed but not unique with INTERNAL_ID; no interpretation of its codes is established.

Columns: 15. Unique keys: `XPKAUDIT_LOG_VALUE` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1273771595.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.AzureSQLMaintenanceLog

Store command text, timing and status-message records for maintenance reporting.

Identity bigint is the key; operation/start/end times and status are nullable. A logged command string does not prove execution or successful maintenance.

Columns: 7. Unique keys: `PK__AzureSQL__3213E83F729ACE1C` (`id`). Outgoing foreign keys: 0.

[Captured object](objects/908582325.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.BILL_OF_MATERIALS_DETAIL

Store component quantities, build sequence/level and optional allocation/source settings for a bill of materials.

Identity rows have a trusted required header FK. Quantity-per-item and unit are required; sequence is not uniquely constrained. Nullable increase-quantity controls do not establish their runtime formula.

Columns: 35. Unique keys: `PK_BILL_OF_MATERIALS_DETAIL` (`INTERNAL_BOM_DETAIL_NUM`). Outgoing foreign keys: 1.

[Captured object](objects/1337771823.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.BILL_OF_MATERIALS_HEADER

Store finished-item build definitions, revision identifiers and instructions.

Identity is the primary key; item/revision is not a captured unique key. Build time is planned data, and item dimensions/cost/location are optional. Active and based-on-item flags have opaque defaults.

Columns: 36. Unique keys: `PK_BILL_OF_MATERIALS_HEADER` (`INTERNAL_BOM_HEADER_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1369771937.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CARRIER_COMMITMENTS

Store carrier/service destination ranges and dated delivery-day commitments.

Identity key permits multiple rows for the same carrier/range; geography and effective dates are nullable, with no interval or priority check. Delivery days are configured data, not observed transit time.

Columns: 22. Unique keys: `XPKCARRIER_COMMITMENTS` (`INTERNAL_CARRIER_COM_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1433772165.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CARRIER_COMPANY_ACCESS

Associate carrier identities with companies.

Required carrier and company fields have trusted FKs but no unique pair key. Rows express authorization metadata; actual caller permission enforcement is outside this schema.

Columns: 14. Unique keys: `XPKCARRIER_COMPANY_ACCESS` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/1221839665.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CARRIER_EDI_REFERENCE

Store carrier-rating reference symbols and values scoped by customer, ship-to and company.

A unique composite key supplements the identity key; rating ID and company have nullable trusted FKs. Parent-customer and resource-key fields do not establish lookup precedence or outbound EDI success.

Columns: 20. Unique keys: `XPKCARRIER_EDI_REFERENCE` (`OBJECT_ID`); `XAK1CARRIER_EDI_REFERENCE` (`RATING_ID`, `SYMBOL`, `CUSTOMER`, `SHIP_TO`, `COMPANY`). Outgoing foreign keys: 2.

[Captured object](objects/1465772279.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CARRIER_GROUP_DETAIL

Store carrier/service membership and preference factors within a carrier group.

Identity rows have a nullable trusted group FK; carrier/service and preference factor are nullable. No unique membership key or selection/rating algorithm is established.

Columns: 16. Unique keys: `XPKCARRIER_GROUP_DETAIL` (`INTERNAL_CARRIER_GROUP_NUM`). Outgoing foreign keys: 1.

[Captured object](objects/1497772393.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CARRIER_RATE

Store numeric rates at rate-base and weight-break detail intersections.

Required trusted FKs link both dimensions; identity is the only unique key, so the pair is not structurally unique. The schema does not enforce positive rates or establish charge calculation.

Columns: 15. Unique keys: `XPKCARRIER_RATE` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/1561772621.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CARRIER_RATE_BASE_ASSIGN_DTL

Store sequenced geography/date/filter choices linking carrier assignments to rate bases.

Required assignment-header FK and optional rate-base/filter FKs are trusted. Sequence is not unique within header; postal and date intervals have no captured ordering check.

Columns: 24. Unique keys: `XPKCARRIER_RATE_BASE_ASSIGN_DT` (`OBJECT_ID`). Outgoing foreign keys: 3.

[Captured object](objects/1593772735.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CARRIER_RATE_BASE_ASSIGN_HDR

Store carrier/company scope and active state for rate-base assignments.

Identity key, optional trusted carrier/company FKs and required active flag define the header. No carrier/service uniqueness or effective assignment selection is proven.

Columns: 17. Unique keys: `XPKCARRIER_RATE_BASE_ASSIGN_HD` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/1625772849.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CARRIER_WAREHOUSE_ACCESS

Associate carrier identities with warehouses.

Both fields are required trusted FKs; only identity is unique. This is an authorization association, not evidence an application checks the requesting user or warehouse.

Columns: 14. Unique keys: `XPKCARRIER_WAREHOUSE_ACCESS` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/1141839380.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CLOSED_MANIFESTS

Store shipper/carrier closure identifiers, timestamps and sequence information.

Primary key includes shipper, carrier symbol, closed date and sequence; identity is separately unique and sequence defaults to one. IN_CLOSURE and pickup reference do not prove manifest dispatch or carrier acknowledgment.

Columns: 18. Unique keys: `XPKCLOSED_MANIFESTS` (`SHIPPER_CODE`, `CARRIER_SYMBOL`, `DATE_CLOSED`, `SEQUENCE`); `XAK1CLOSED_MANIFESTS` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1657772963.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.COMMENT_TEXT

Store typed comments associated with optional record and line identifiers.

Identity key and trusted comment-type FK support multiple comments per entity. Record/line indexes are nonunique and the generic entity IDs have no captured FK to their business targets.

Columns: 17. Unique keys: `XPKCOMMENT_TEXT` (`INTERNAL_COMMENT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1689773077.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.COMMENT_TYPE

Define comment descriptions, communication-method codes and active flags.

Comment type is the primary key; communication method and active state are required stored values, without a captured delivery implementation.

Columns: 15. Unique keys: `XPKCOMMENT_TYPE` (`COMMENT_TYPE`). Outgoing foreign keys: 0.

[Captured object](objects/1721773191.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.COMMENT_TYPE_DOC_ASSIGNMENT

Associate comment types with document types.

Composite primary key prevents duplicate comment/document pairs; only comment type has a captured outgoing FK. The association does not establish actual document rendering.

Columns: 13. Unique keys: `XPKCOMMENT_TYPE_DOC_ASSIGNMENT` (`COMMENT_TYPE`, `DOCUMENT_TYPE`). Outgoing foreign keys: 1.

[Captured object](objects/1753773305.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CONFIG_DIR_COLLECTED_DATA

Store project-instance query text with a timestamp.

The four required fields form a heap without unique key or foreign keys. Query text storage does not prove execution, project completeness or a safe executable command.

Columns: 4. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1865773704.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CONFIG_DIR_CdGetIdentityColumn_DATA

Store table/column identity-value comparison text and an operation code.

All five fields are nullable and the table is a heap without uniqueness. Original/current values are text, so no numeric identity advance, execution or authoritative state is proven.

Columns: 5. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1849773647.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CONSOLIDATION_CRITERIA

Register table-field names with required flags.

TABLE_FIELD is the primary key and REQUIRED is mandatory. The schema identifies a criterion registry but cannot prove its business consumer or consolidation algorithm.

Columns: 13. Unique keys: `XPKCONSOLIDATION_CRITERIA` (`TABLE_FIELD`). Outgoing foreign keys: 0.

[Captured object](objects/1881773761.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CONTAINER_CLASS

Define container class descriptions and optional identification codes.

Class is the primary key; active is required, while UCC and EPC filter values are nullable. No container allocation or barcode encoding occurs in this schema.

Columns: 16. Unique keys: `XPKCONTAINER_CLASS` (`CONTAINER_CLASS`). Outgoing foreign keys: 0.

[Captured object](objects/1913773875.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CONTAINER_GROUP_DETAIL

Order container-type choices within named groups with fill/shape settings.

Group/sequence is uniquely constrained in addition to the identity key; trusted FKs reference type and header. Fill percent is nullable and no range check constrains it to 0 through 100. Sequence uniqueness is distinct from runtime selection order.

Columns: 17. Unique keys: `XPKCONTAINER_GROUP_DETAIL` (`OBJECT_ID`); `X_UNIQUE_CONTAINER_GROUP_DETAIL` (`CONTAINER_GROUP`, `SEQUENCE`). Outgoing foreign keys: 2.

[Captured object](objects/1945773989.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CONTAINER_GROUP_HEADER

Define named active container groups.

The group-name primary key supplies the parent for detail choices; description is optional. Active state is stored but actual eligibility filtering requires caller evidence.

Columns: 14. Unique keys: `XPKCONTAINER_GROUP_HEADER` (`CONTAINER_GROUP`). Outgoing foreign keys: 0.

[Captured object](objects/1977774103.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CONTAINER_TYPE

Define container dimensions, tare/maximum weight and authorization-mode settings.

Type is the primary key and nullable class has a trusted FK. Physical measures are nullable and unconstrained by captured checks; default/active/authorization flags do not establish usable capacity or user eligibility by themselves.

Columns: 29. Unique keys: `XPKCONTAINER_TYPE` (`CONTAINER_TYPE`). Outgoing foreign keys: 1.

[Captured object](objects/2009774217.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CONTAINER_TYPE_AUTHORIZED_COMPANY

Associate container types with companies.

Required trusted company and type FKs coexist with an identity-only unique key. Duplicate pairs are not blocked by a captured key; actual authorization enforcement is outside this association.

Columns: 14. Unique keys: `XPKCONTAINER_TYPE_AUTHORIZED_COMPANY` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/2041774331.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CONTAINER_TYPE_WAREHOUSE_ACCESS

Associate container types with warehouses.

Both required references have trusted FKs, while only identity is unique. The table records scope associations without proving how the master authorization-mode flag or caller consumes them.

Columns: 14. Unique keys: `XPKCONTAINER_TYPE_WAREHOUSE_ACCESS` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/2073774445.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CONVERSION_INVENTORY

Store nullable inventory-conversion-shaped payload fields and error text.

Heap columns cover item, location, warehouse, LP/parent, lot, serial and attributes; quantity and weight are varchar rather than numeric. No captured key, FK or check establishes valid inventory or an approved import path.

Columns: 28. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1212687518.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CUSTOMER

Store customer/ship-to identity, contact/address data and inheritance flags.

Only the internal identity is unique; customer, company and ship-to indexes are nonunique. Many values have corresponding inheritance flags, but schema alone does not establish parent resolution or fallback precedence.

Columns: 95. Unique keys: `XPKCUSTOMER` (`INTERNAL_CUSTOMER_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/22291139.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CUSTOMER_EPC_ENCODING

Associate customer identities and optional container classes with EPC encoding settings.

Trusted customer/class FKs and required single-item/multi-item flags identify configuration scope. Identity-only uniqueness permits multiple candidate mappings; no encoding selection algorithm is established.

Columns: 17. Unique keys: `XPKCUSTOMER_EPC_ENCODING` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/54291253.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CUSTOMER_KNOWLEDGE_HUB

Store document identifiers, keys, notes and upload-status text.

Identity is the only unique key; document ID/key are required without a captured customer FK or unique document constraint. Upload-status storage does not prove a completed upload or document accessibility.

Columns: 8. Unique keys: `XPK_CUSTOMER_KNOWLEDGE_HUB` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/772510131.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CUSTOM_STATUS_FLOW_DETAIL

Associate distinct numeric statuses with a named custom flow.

Flow/status has a unique key and flow has a trusted header FK. Identity is the primary key; schema contains no separate sequence or transition-permission condition, so numeric ordering behavior requires source evidence.

Columns: 14. Unique keys: `XPKCUSTOM_STATUS_FLOW_DETAIL` (`OBJECT_ID`); `XAK1CUSTOM_STATUS_FLOW_DETAIL` (`FLOW_NAME`, `status`). Outgoing foreign keys: 1.

[Captured object](objects/2105774559.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.CUSTOM_STATUS_FLOW_HEADER

Define named status flows within functional areas.

Flow name is the primary key and functional area has a trusted required FK. Active and description are mandatory; association of a flow to any transaction remains outside these rows.

Columns: 15. Unique keys: `XPKCUSTOM_STATUS_FLOW_HEADER` (`FLOW_NAME`). Outgoing foreign keys: 1.

[Captured object](objects/2137774673.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.Conversion_ILA

Store nullable item/location-assignment-shaped rows.

Heap fields include internal item-location number, item/company, warehouse, allocation location and quantity unit. No key, FK, default or validation proves intended conversion use or production assignment validity.

Columns: 17. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/385540557.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.Conversion_ILC

Store nullable item/location-capacity-shaped rows.

Heap fields include maximum quantity, replenishment thresholds and item/location/warehouse scope. All fields are nullable without constraints; percentage column types alone do not enforce sensible limits or prove a migration process.

Columns: 23. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1100687119.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DASHBOARD_TILE_ACCESS

Associate user names with dashboard statement-detail tiles.

Identity key and required trusted tile FK define access metadata; username has no captured outgoing FK and user/tile pair is not unique. Enforcement by a caller is not established.

Columns: 14. Unique keys: `XPKDASHBOARD_TILE_ACCESS` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/278292051.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DASHBOARD_WIDGETS

Define uniquely named dashboard widgets and their URL/default/active flags.

Widget ID has a unique key separate from identity. Required URL text stores a destination reference without proving reachability or authorization.

Columns: 18. Unique keys: `XPK_DASHBOARD_WIDGETS` (`OBJECT_ID`); `XUNIQUE_DASHBOARD_WIDGETS` (`WIDGET_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1557840862.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DATA_RETRIEVAL_STMT_DETAIL

Store retrieval statements/procedure names and optional drilldown metadata under a header.

Required header and optional form references have trusted FKs; primary key is supplied, not identity. SQL/connection text and custom flags are configuration payload, not proof of safe execution or active navigation.

Columns: 23. Unique keys: `XPKDATA_RETRIEVAL_STMT_DETAIL` (`STMT_DETAIL_KEY_NUM`). Outgoing foreign keys: 2.

[Captured object](objects/310292165.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DATA_RETRIEVAL_STMT_TOKEN

Store typed token names for a retrieval-statement header.

Required trusted header FK and identity key permit repeated token names per header. ROW_VERSION is numeric with zero default, not SQL Server rowversion concurrency enforcement.

Columns: 16. Unique keys: `XPKDATA_RETRIEVAL_STMT_TOKEN` (`INTERNAL_TOKEN_NUM`). Outgoing foreign keys: 1.

[Captured object](objects/374292393.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DELETED_RECEIPT_CONTAINER

Store receipt-container-shaped identifiers, status, quantity and movement/QC context.

Internal container number is the primary key; many receipt/line/company/rule indexes have no outgoing FKs. The name and fields do not prove a deletion event, retention completeness or safe recreation of a container.

Columns: 64. Unique keys: `XPKDELETED_RECEIPT_CONTAINER` (`INTERNAL_REC_CONT_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/406292507.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DIF_ENDPOINT

Associate named endpoint-handler definitions and direction codes with optional events.

Identity key and nullable trusted event FK define configuration links; name is not uniquely constrained. Stored handler/direction does not establish a running or reachable service.

Columns: 16. Unique keys: `XPKDIF_ENDPOINT` (`ENDPOINT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/438292621.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DIF_EVENT

Store enabled event execution identifiers and threading options.

Identity key and required execution identifier/enabled flag describe event configuration. Multi-threaded has an opaque default; schema does not implement dispatch or guarantee serialization.

Columns: 16. Unique keys: `XPKDIF_EVENT` (`EVENT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/470292735.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DIF_OUTGOING_MESSAGE

Store outgoing message data, event linkage, status and error details.

Required trusted event FK and identity key support message storage with up to thirty optional parts. Stored status/error fields do not prove send, retry, acknowledgment or exactly-once delivery.

Columns: 47. Unique keys: `XPKDIF_OUTGOING_MESSAGE` (`MSG_ID`). Outgoing foreign keys: 1.

[Captured object](objects/534292963.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DOCK_AREA_CARRIER_ASSIGNMENT

Associate each dock-area location with optional carrier/service or carrier group.

DOCK_AREA is uniquely indexed and has a trusted location FK; carrier group has a trusted optional FK. Uniqueness is per dock area, not carrier, and active defaults remain opaque.

Columns: 17. Unique keys: `XPKDOCK_AREA_CARRIER_ASSIGN` (`OBJECT_ID`); `XIF664DOCK_AREA_CARRIER_ASSIGN` (`DOCK_AREA`). Outgoing foreign keys: 2.

[Captured object](objects/566293077.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DOCK_LOCATION

Identify dock area/position combinations within warehouses.

Warehouse/area/position is the primary key, with separate unique identity and trusted warehouse FK. Multi-shipment and active fields store controls without proving actual occupancy or shipment movement.

Columns: 20. Unique keys: `XPKDOCK_LOCATION` (`warehouse`, `DOCK_LOCATION_AREA`, `DOCK_LOCATION_POSITION`); `XAK1DOCK_LOCATION` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/598293191.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DOCK_MGMT_FLOW_DETAIL

Store status-specific dock subclass, default location and strategy references.

Trusted header/generic/dynamic-calling FKs exist; the default-location FK is untrusted. Header/status has no unique key. Create-next-move/nesting fields are settings, not verified work creation.

Columns: 20. Unique keys: `XPKDOCK_MGMT_FLOW_DETAIL` (`OBJECT_ID`). Outgoing foreign keys: 5.

[Captured object](objects/630293305.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DOCK_MGMT_FLOW_HEADER

Store warehouse/custom-status-flow dock configuration and default location.

Identity is unique; warehouse/flow index is nonunique. Custom-flow FK is trusted and default-location FK untrusted. Manual-dock-door flag has an opaque default; fallback logic requires caller evidence.

Columns: 16. Unique keys: `XPKDOCK_MGMT_FLOW_HEADER` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/662293419.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DOCK_MGMT_WORK_DATA

Store proposed movement/container context with grouping and work-created indicators.

Identity key; group/work-created and tree/work-created indexes are nonunique. Source/destination/quantity fields are nullable with no outgoing FK, so a flag does not prove complete physical movement.

Columns: 38. Unique keys: `XPKDOCK_MGMT_WORK_DATA` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/694293533.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DOCK_MGR_GRID_CUSTOMIZATION

Store dock-grid visible properties, positions and column widths by perspective.

Identity key and trusted perspective FK define display metadata. Column width defaults to 50; position/property combinations are not unique, and actual display order remains caller behavior.

Columns: 18. Unique keys: `XPKDOCK_MGR_GRID_CUSTOMIZATION` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/726293647.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DOCUMENT

Define named document templates, type and formatting/transformation options.

Document name is primary key and document type has a trusted FK. Required batch/international flags and optional printer symbols describe definitions, not generated output or a successful renderer.

Columns: 26. Unique keys: `XPKDOCUMENT` (`DOCUMENT`). Outgoing foreign keys: 1.

[Captured object](objects/758293761.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DOCUMENT_MANAGEMENT

Store external document sources and notes associated with generic references.

Identity key, required reference type/category/ID and document-source text support document metadata. Generic reference numbers, company and warehouse have no captured FKs; access or upload success is not established.

Columns: 20. Unique keys: `XPK_GENERIC_DOCUMENT_MANAGEMENT_DATA` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1922314108.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DOCUMENT_ROUTING

Store document/printer/copy choices with optional routing dimensions.

Identity is unique, while the multi-dimension index is not. Document FK is untrusted and device FK trusted. Required copies has a bound default; no priority or unique-match routing algorithm follows from the schema.

Columns: 28. Unique keys: `XPKDOCUMENT_ROUTING` (`INTERNAL_DOCUMENT_NUM`). Outgoing foreign keys: 2.

[Captured object](objects/790293875.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.DOWNLOAD_ITEM_v6

Store nullable item-interface-shaped attributes and action/condition fields.

All columns are nullable in a heap without keys, defaults or FKs; item/company and tracking fields are text while costs are numeric. The version suffix does not establish an active importer or release compatibility.

Columns: 33. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1276687746.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.D_ITEM

Store item-definition-shaped values largely as text.

The heap has required textual identifiers and tracking/active fields but no keys/FKs. Prices, internal item number and several normally numeric-looking values are nvarchar, so this is not evidence of authoritative typed item configuration.

Columns: 78. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/522029191.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.D_ITEM_CROSS_REFERENCE

Store item cross-reference-shaped text values.

Required text internal number/item/reference/company fields coexist without unique keys or FKs. Optional UOM/GS1 fields do not establish valid lookup or barcode resolution.

Columns: 18. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/538029248.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.D_ITEM_LOCATION_ASSIGNMENT

Store item/warehouse/allocation-location assignment-shaped text rows.

Required identifiers and user timestamp fields have no key or FK enforcement. No operational item-location assignment or import consumer is established.

Columns: 17. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/554029305.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.D_ITEM_LOCATION_CAPACITY

Store item/location capacity and replenishment-threshold values as text.

Required maximum quantity and minimum replenishment percentage are nvarchar, and the heap has no keys/checks. Values cannot be assumed numeric, valid or effective capacity controls.

Columns: 23. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/618029533.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.D_ITEM_UNIT_OF_MEASURE

Store item-unit conversion, dimensions and handling flags as text.

Conversion/size/weight are required strings and no unique identity/sequence or FK is captured. Schema shape alone does not establish valid conversion arithmetic or a migration pipeline.

Columns: 31. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/714029875.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.D_LOCATION

Store location-definition-shaped fields with predominantly textual controls.

The heap has required warehouse/location/status and a numeric object ID without uniqueness or identity. Text sequence/row-version/control values do not prove actual location configuration or concurrency behavior.

Columns: 53. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/842030331.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.D_LOCATION_INVENTORY

Store inventory-bucket-shaped rows and item/location/container descriptors.

Quantity buckets are required numeric(18,0), while value/cost/weight/volume and internal identifiers are strings. No keys or FKs establish uniqueness or correspondence with operational inventory.

Columns: 47. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/922030616.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.D_LOCATION_TEMPLATE

Store location-template segment definitions largely as text.

Five length fields are required strings, with required first-segment type/description and optional later descriptors. Heap storage does not enforce a unique template or correct identifier generation.

Columns: 29. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/858030388.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.D_LOCATION_TYPE

Store location dimensions and weight-capacity values as text.

Required length/width/height/maximum-weight strings and active flag have no key/check/FK enforcement. No numeric capacity or active operational type is established.

Columns: 19. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/730029932.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.D_LOCATION_UNIT_OF_MEASURE

Store location/inventory-unit conversion and dimension fields as text.

Required warehouse/location/internal-inventory and numeric-looking text values have no uniqueness or FK enforcement. This shape is not a verified unit conversion or inventory movement.

Columns: 31. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/874030445.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.EQUIPMENT_TYPE

Define equipment types with optional quantity, weight and volume limits.

Equipment type is primary key and active is required. Limit quantities and units are nullable; no positivity checks or actual work assignment enforcement is established.

Columns: 20. Unique keys: `XPKEQUIPMENT_TYPE` (`EQUIPMENT_TYPE`). Outgoing foreign keys: 0.

[Captured object](objects/1398296041.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ESTIMATED_WORK_RATES

Store estimated throughput/cost rates by optional work type and zone.

Identity key permits multiple candidate rows; up to ten unit/rate pairs and work/weight/volume rates are nullable. These stored estimates are not observed employee productivity or elapsed runtime.

Columns: 41. Unique keys: `XPKESTIMATED_WORK_RATES` (`INTERNAL_ESTIMATED_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1430296155.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.EXCHANGE_WEB_PAGE

Define named web-page/report descriptors and optional retrieval-statement identifiers.

Page name is the key; statement number has no captured FK. Report type defaults to zero; required page type/active and optional report text do not establish a deployed route.

Columns: 18. Unique keys: `XPKEXCHANGE_WEB_PAGE` (`WEB_PAGE_NAME`). Outgoing foreign keys: 0.

[Captured object](objects/1462296269.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.FILE_PROTOCOL_PROPERTIES

Store file-transfer directory/extension and polling/message-insertion settings for endpoints.

Required trusted endpoint FK and identity key permit multiple property rows per endpoint. Sleep defaults to 1000 without unit inference here; directory fields were not read as actual paths or contacted.

Columns: 19. Unique keys: `XPKFILE_PROTOCOL_PROPERTIES` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1590296725.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.FILTER_GROUP_BY

Store ordered grouping attributes and break settings for named record filters.

Primary key order is record type, filter name, sequence. Attribute and create-break are required, with optional break value and no outgoing FKs. Actual grouping/query construction requires a consumer.

Columns: 17. Unique keys: `XPKFILTER_GROUP_BY` (`RECORD_TYPE`, `FILTER_NAME`, `SEQUENCE`). Outgoing foreign keys: 0.

[Captured object](objects/1718297181.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.FILTER_ORDER_BY

Store ordered sort attributes and direction codes for named record filters.

Primary key order is sequence, record type, filter name. Direction is an opaque required flag; no captured FK or expression validation establishes safe executable sort clauses.

Columns: 16. Unique keys: `XPKFILTER_ORDER_BY` (`SEQUENCE`, `RECORD_TYPE`, `FILTER_NAME`). Outgoing foreign keys: 0.

[Captured object](objects/1750297295.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.FISCAL_CALENDAR_DETAIL

Store dated fiscal periods within named calendars.

Year/period/calendar is the composite key and calendar has a trusted FK. Dates are nullable, with no check enforcing range order or nonoverlap.

Columns: 16. Unique keys: `XPKFISCAL_CALENDAR_DETAIL` (`FISCAL_YEAR`, `FISCAL_PERIOD`, `FISCAL_CALENDAR_NAME`). Outgoing foreign keys: 1.

[Captured object](objects/1814297523.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.FISCAL_CALENDAR_HEADER

Define named active fiscal calendars.

Calendar name is primary key, active is required and description optional. Actual reporting-period assignment or scheduling is not established by header storage.

Columns: 14. Unique keys: `XPKFISCAL_CALENDAR_HEADER` (`FISCAL_CALENDAR_NAME`). Outgoing foreign keys: 0.

[Captured object](objects/1846297637.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.FUNCTIONAL_AREA

Define named functional areas, descriptions and active/system-created flags.

Functional area is the primary key and serves as a status-flow reference target. Stored flags do not prove authorization or availability of an application module.

Columns: 15. Unique keys: `XPKFUNCTIONAL_AREA` (`FUNCTIONAL_AREA`). Outgoing foreign keys: 0.

[Captured object](objects/1910297865.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.GENERIC_ADDRESS_DETAIL

Store typed address identifiers and optional contact/postal details.

Record type/identifier is primary key, with no captured FK to the similarly named header. Required active flag has an opaque default; addresses or contact values were not queried.

Columns: 26. Unique keys: `XPKGENERIC_ADDRESS_DETAIL` (`RECORD_TYPE`, `IDENTIFIER`). Outgoing foreign keys: 0.

[Captured object](objects/1974298093.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.GENERIC_ADDRESS_HEADER

Define named address-record categories and descriptions.

Record type is primary key; system-created is required with an opaque default. Header storage does not enforce related detail membership through a captured FK.

Columns: 14. Unique keys: `XPKGENERIC_ADDRESS_HEADER` (`RECORD_TYPE`). Outgoing foreign keys: 0.

[Captured object](objects/2006298207.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.GENERIC_IMAGE_DATA

Store binary images associated with typed internal identifiers.

Identity key and required entity number/type, binary payload and image timestamp define generic attachments. There is no entity FK or unique attachment rule; format validity and external access are unverified.

Columns: 17. Unique keys: `XPKGENERIC_IMAGE_DATA` (`INTERNAL_IMAGE_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1890313994.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.HTTP_PROTOCOL_PROPERTIES

Store outgoing endpoint identifiers and optional retry/timeout controls.

Identity key and nullable trusted endpoint FK allow multiple rows per endpoint. Retry counts/interval/timeout have no captured range checks or units; no endpoint or credential value was accessed.

Columns: 17. Unique keys: `XPKHTTP_PROTOCOL` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1959730084.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.INBOUND_WEB_STATISTICS

Store dated receipt totals by company and optional item/vendor dimensions.

Identity key and nonunique date/item-company indexes do not impose a unique reporting grain. Quantity, value, weight, cost and location totals are stored summaries, not a verified aggregation or current performance observation.

Columns: 33. Unique keys: `PK_INBOUND_WEB_STATISTICS` (`INTERNAL_IN_STAT_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/50815243.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.INTERFACE_DATAMAP_REQ_FIELDS

Store required-field mapping descriptors by record type/action/position.

Despite its XPK name, the clustered index is nonunique and not a primary key. Record type has a trusted FK; numeric field/position and optional field name do not prove inbound validation enforcement.

Columns: 16. Unique keys: None captured. Outgoing foreign keys: 1.

[Captured object](objects/146815585.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.INVENTORY_ADJ_WEB_STATISTICS

Store dated adjustment/transfer/status-change counts and quantity summaries.

Identity key with nonunique date and item/company indexes allows repeated reporting dimensions. Net/positive/negative fields do not establish formulas or deduplication.

Columns: 29. Unique keys: `XPKINVENTORY_ADJ_WEB_STATISTIC` (`INTERNAL_INV_ADJ_STAT_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/322816212.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.INVENTORY_STAGING

Store inventory-shaped staging rows with item/location, quantity, lot and LP data.

Only identity is required and unique; every other field is nullable, with no FK/check validation. This supports a staging-shaped payload role without establishing an active import, reconciled inventory or approved consumer.

Columns: 27. Unique keys: `PkcInventorystagingObjectid` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1180687404.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.INV_MGMT_WORK_DATA

Store adjustment-linked movement/work request context and quantity/item attributes.

Identity key; required group, adjustment number/type/class and item coexist with trusted optional company/from/to warehouse FKs. Numeric zero defaults and work-created flag do not prove execution or physical movement.

Columns: 72. Unique keys: `XPKINV_MGMT_WORK_DATA` (`INTERNAL_INV_MGT_REQ_NUM`). Outgoing foreign keys: 3.

[Captured object](objects/290816098.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ITEM_CAT_UPDATES

Store optional item/category comparison fields.

Four nullable text columns form a heap with no key or constraints. Item/category8/category3/item2 structure does not prove which update was intended, executed or current.

Columns: 4. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/436352769.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ITEM_CROSS_REFERENCE

Associate item references with company, optional UOM and application identifiers.

Identity is primary key; item/company and cross-reference indexes are nonunique. Only application identifier has a trusted FK, so unique barcode-to-item resolution is not established.

Columns: 18. Unique keys: `XPKITEM_CROSS_REFERENCE` (`INTERNAL_ITEM_CROSS_NUM`). Outgoing foreign keys: 1.

[Captured object](objects/418816554.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ITEM_WEB_STATISTICS

Store dated item-level shipping, receiving, adjustment, build and inventory summaries.

Identity key and nonunique history-date/item-company indexes do not enforce one row per reporting grain. The many stored totals and bucket fields require writer/aggregation evidence before interpretation as metrics.

Columns: 70. Unique keys: `PK_ITEM_WEB_STATISTICS` (`INTERNAL_ITEM_STAT_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/626817295.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ITEM_fy2015_prices

Store optional item/list-price pairs.

Both columns are nullable in a heap without keys. Numeric list price supports a price-payload shape; the year-like name does not establish its dates, authority or current pricing use.

Columns: 2. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/450816668.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LABEL_MASTER_DETAIL

Store sequenced document/generator/filter definitions under label masters.

Trusted header/document-type/filter FKs support configuration links; sequence is not uniquely constrained by header. Required generating-class text is not evidence that custom code is present or executes.

Columns: 18. Unique keys: `XPKLABEL_MASTER_DETAIL` (`OBJECT_ID`). Outgoing foreign keys: 3.

[Captured object](objects/658817409.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LABEL_MASTER_HEADER

Define uniquely named label masters with selection and print-option settings.

Name is a unique key separate from identity; print option and active are required. Optional selection text and opaque system-created default do not prove actual print behavior.

Columns: 18. Unique keys: `XPKLABEL_MASTER_HEADER` (`OBJECT_ID`); `XAK1LABEL_MASTER_HEADER` (`NAME`). Outgoing foreign keys: 0.

[Captured object](objects/690817523.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LABEL_PRINT_REQUEST

Store label file/device requests with processing timestamps and status.

Identity key and nonunique status index support request storage; file/device, copies and inserted/process-start/process-end timestamps are nullable; DATE_TIME_STAMP is required. A row or completed-looking status is not evidence of physical printer output.

Columns: 21. Unique keys: `XPKLABEL_PRINT_REQUEST` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/722817637.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LABOR_GROUP

Store staffing, time-per-transaction, throughput and tolerance settings for labor groups.

Identity is the primary key; group name has no captured unique key. Several required numeric controls default to zero, while throughput/tolerance defaults are redacted. Planning values are not observed staffing or productivity.

Columns: 25. Unique keys: `XPKLABOR_GROUP` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/754817751.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LABOR_MANAGEMENT_DETAIL

Store user/activity records with timing, quantities, goals and warehouse/work references.

Identity key and nonunique activity/user/time indexes allow many activity records. Actual-time is text; end time and closed/manual flags are nullable. No captured FK or check establishes elapsed-time calculation, attendance or completed work.

Columns: 56. Unique keys: `XPKLABOR_MANAGEMENT_DETAIL` (`INTERNAL_DETAIL_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/786817865.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LABOR_MANAGEMENT_SUMMARY

Store user/activity monthly summary totals.

Identity is unique; warehouse/user/activity/month/year are not a unique combination. Actual-time is text and totals nullable, so aggregation formula and duplicate handling require consumer/writer evidence.

Columns: 30. Unique keys: `XPKLABOR_MANAGEMENT_SUMMARY` (`INTERNAL_SUM_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/818817979.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LABOR_MGMT_DETAIL_CONSOLIDATION

Store consolidated user/activity intervals, counts and planning comparisons.

Required start/end/count and warehouse fields coexist with text total-time and optional tolerance/throughput. Only identity is unique, with no interval-order check or proof of nonoverlapping source activities.

Columns: 28. Unique keys: `XPK_LABOR_MGMT_DETAIL_CONSOLIDATION` (`INTERNAL_CONSOLIDATION_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1061839095.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LABOR_PLAN_DTL

Associate labor plans with sequenced labor-group identifiers/names.

Required plan FK is trusted; group object ID has no captured FK and plan/sequence is not unique. The schema does not decide which group applies when several match.

Columns: 16. Unique keys: `XPKLABOR_PLAN_DTL` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/850818093.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LABOR_PLAN_HDR

Store named active labor-plan headers.

Identity is primary key, while required plan name is not uniquely constrained. The header does not establish a scheduled or executed planning calculation.

Columns: 15. Unique keys: `XPKLABOR_PLAN_HDR` (`LABOR_PLAN_ID`). Outgoing foreign keys: 0.

[Captured object](objects/882818207.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LARGE_TEXT

Store ordered text chunks by textual GUID and sequence.

Composite primary key distinguishes chunks; GUID is nvarchar, not uniqueidentifier. Required text is limited to 4000 bytes metadata length; assembly order, encoding and completeness require a caller.

Columns: 14. Unique keys: `XPKLARGE_TEXT` (`GUID`, `SEQUENCE`). Outgoing foreign keys: 0.

[Captured object](objects/914818321.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LAUNCH_FLOW_DETAIL

Store uniquely sequenced named steps within a launch flow.

Flow/sequence is uniquely constrained and flow has a trusted FK; identity has both primary and redundant unique indexes. Step names have no captured FK or proof of executable order enforcement.

Columns: 15. Unique keys: `XPKLAUNCH_FLOW_DETAIL` (`OBJECT_ID`); `XAK1LAUNCH_FLOW_DETAIL` (`OBJECT_ID`); `X_UNIQUE_LAUNCH_FLOW_DETAIL` (`LAUNCH_FLOW`, `SEQUENCE`). Outgoing foreign keys: 1.

[Captured object](objects/946818435.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LAUNCH_FLOW_HEADER

Define named active launch-flow headers.

Flow name is primary key; description and active are required. Header storage does not prove a wave uses or has completed this flow.

Columns: 14. Unique keys: `XPKLAUNCH_FLOW_HEADER` (`LAUNCH_FLOW`). Outgoing foreign keys: 0.

[Captured object](objects/978818549.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LAUNCH_MAXIMUMS

Store named wave-size limits for shipments, lines, quantity, value, weight and volume.

Name is primary key and all limit values are nullable with bound defaults. No captured checks or caller rules establish whether zero/NULL means unlimited, forbidden or another behavior.

Columns: 21. Unique keys: `XPKLAUNCH_MAXIMUMS` (`LAUNCH_MAXIMUMS`). Outgoing foreign keys: 0.

[Captured object](objects/1042818777.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LAUNCH_SUMMARY

Store launch-date/warehouse summary totals.

Date/warehouse is the primary key, with separately unique identity. Shipment/line/quantity/value/weight/volume totals are nullable stored summaries, not proven event counts or observed physical throughput.

Columns: 23. Unique keys: `XPKLAUNCH_SUMMARY` (`LAUNCH_DATE`, `warehouse`); `XAK1LAUNCH_SUMMARY` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1106819005.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LBR_PLN_EX_RESULT

Store wave/group labor estimates, staffing inputs and refresh metadata.

Trusted FKs link required group/wave and optional plan. Identity alone is unique; required estimated labor and staffing values are not measured runtime, and refresh zero default does not establish freshness.

Columns: 29. Unique keys: `XPKLBR_PLN_EX_RESULT` (`LBR_PLN_EX_RESULT_ID`). Outgoing foreign keys: 3.

[Captured object](objects/1138819119.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LOADING_AREA_ASSIGNMENT

Associate wave/carrier records with optional route and load area.

Identity key and required trusted wave FK allow multiple assignments per wave/carrier. Load area is nullable text with no location FK; actual routing priority or loading completion is not established.

Columns: 16. Unique keys: `XPKLOADING_AREA_ASSIGNMENT` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1170819233.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LOCATION_CONTAINER

Store container/item/lot quantity descriptors at warehouse locations.

Identity is primary key and external container ID is only nonuniquely indexed. Only company has a captured FK; location/warehouse index is not referential enforcement or proof of physical stock.

Columns: 24. Unique keys: `XPKLOCATION_CONTAINER` (`INTERNAL_CONTAINER_NUM`). Outgoing foreign keys: 1.

[Captured object](objects/1330819803.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LOCATION_TEMPLATE

Define structured location identifier segments and separators.

Template name is primary key; first field length/type are required and later segments nullable. Five separators are optional; bound numeric defaults and type names do not implement validation or identifier generation.

Columns: 33. Unique keys: `XPKLOCATION_TEMPLATE` (`LOCATION_TEMPLATE`). Outgoing foreign keys: 0.

[Captured object](objects/1426820145.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LOT_ATTRIBUTE_TEMPLATE

Define sequenced attribute patterns/autofill settings for a lot template.

Required trusted lot-template FK and identity key allow repeated sequence values per template. Pattern/format/type are nullable; parsing or automatic value generation is not established.

Columns: 18. Unique keys: `XPKLOT_ATTRIBUTE_TEMPLATE` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1618820829.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.LOT_TEMPLATE

Define named lot patterns and optional autofill type/format.

Lot-template name is primary key with required description/active. Optional pattern and format strings are configuration definitions, not evidence of a valid or generated lot identifier.

Columns: 17. Unique keys: `XPKLOT_TEMPLATE` (`LOT_TEMPLATE`). Outgoing foreign keys: 0.

[Captured object](objects/1650820943.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.MENU_FAVORITE

Store user-named form shortcuts with paths and active flags.

Identity key and trusted form FK define shortcut metadata. User/form/name combinations are not unique and username has no captured FK; saved path does not prove permission or current navigation.

Columns: 17. Unique keys: `XPKMENU_FAVORITE` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1826821570.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.MOVEMENT_CLASS_ANALYSIS

Store item/location movement-analysis quantities, days and hit counts.

Identity key allows repeated item/company/warehouse/location rows. Required total quantity and optional days/hits do not establish the analysis window, aggregation or an automatic placement decision.

Columns: 21. Unique keys: `XPKMOVEMENTCLASSANALYSIS` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1858821684.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.MULTI_ORDER_PALLET

Identify warehouse-scoped multi-order pallets.

Internal identity is primary key and warehouse has a trusted FK; external pallet ID index is nonunique. Container nesting or physical pallet contents are not established by this header.

Columns: 14. Unique keys: `XPKMULTI_ORDER_PALLET` (`INTERNAL_MOP_NUMBER`). Outgoing foreign keys: 1.

[Captured object](objects/1890821798.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.MULTI_SEGMENT_MAPPED_FIELDS

Map application identifiers to named fields with scan/autofill controls.

Required trusted application-identifier FK and identity key permit multiple mappings. Auto-execute/autofill/remove-AI flags have opaque defaults; schema alone does not parse or execute scan actions.

Columns: 20. Unique keys: `XPKMULTI_SEGMENT_MAPPED_FIELDS` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/804510245.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.NEXT_NUMBER

Store named textual next/minimum/maximum number values.

Key name is primary key; next, minimum and maximum are nvarchar. Defaults 1 and 999999999 do not prove numeric validity, atomic increment, uniqueness across callers or overflow behavior.

Columns: 16. Unique keys: `XPKNEXT_NUMBER` (`NEXT_NUM_KEY`). Outgoing foreign keys: 0.

[Captured object](objects/1922821912.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.NOTIFICATION

Define uniquely named notification templates and active states.

Name is unique separate from identity; subject/message are optional text. Stored template and active flag do not establish a sent message or reachable recipient.

Columns: 17. Unique keys: `XPKNOTIFICATION` (`OBJECT_ID`); `XUKNOTIFICATION` (`NAME`). Outgoing foreign keys: 0.

[Captured object](objects/1954822026.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.NOTIFICATION_ADDRESS

Associate notifications with delivery mechanisms, addresses and optional templates.

Required trusted FKs reference notification and dynamic-calling detail. Identity-only uniqueness permits multiple destinations; include-file flag is opaque and no delivery execution is established.

Columns: 18. Unique keys: `XPKNOTIFICATION_ADDRESS` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/1986822140.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.NOTIFICATION_MESSAGE

Store notification-message content, status and creation/delivery timestamps.

Required trusted notification FK and identity key support message records. Delivered timestamp is nullable and status text mandatory; neither independently proves recipient receipt or successful transport.

Columns: 18. Unique keys: `XPKNOTIFICATIONMESSAGE` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/2018822254.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.OPERATIONAL_GOAL

Store display goals and calculation descriptors with optional text/procedure references.

Identity key and optional composite LARGE_TEXT FK coexist with required direction/starting/goal/calculation values. Procedure-name storage does not prove execution or measured attainment.

Columns: 24. Unique keys: `XPKOPERATIONAL_GOAL` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/2050822368.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ORDER_TEMPLATE_COMMENT

Store sequenced comments under order templates.

Template/sequence is primary key with trusted header FK. Optional item sequence/comment type have no captured target FKs; generated order comments require caller evidence.

Columns: 16. Unique keys: `XPKORDER_TEMPLATE_COMMENT` (`ORDER_TEMPLATE`, `SEQUENCE`). Outgoing foreign keys: 1.

[Captured object](objects/2146822710.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ORDER_TEMPLATE_HEADER

Store named order defaults, customer/address and shipping descriptors.

Template name is primary key; most business fields are nullable and no outgoing FKs are captured. Defaults do not establish actual order creation or inheritance precedence.

Columns: 48. Unique keys: `XPK_ORDER_TEMPLATE_HEADER` (`ORDER_TEMPLATE`). Outgoing foreign keys: 0.

[Captured object](objects/31339176.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ORDER_TEMPLATE_ITEM

Store sequenced item/quantity/price defaults under order templates.

Template/sequence primary key and trusted header FK define membership. Item/internal-item identifiers have no captured FK and quantity is nullable; no stock reservation or order line creation is proven.

Columns: 23. Unique keys: `XPKORDER_TEMPLATE_ITEM` (`ORDER_TEMPLATE`, `SEQUENCE`). Outgoing foreign keys: 1.

[Captured object](objects/63339290.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ORDER_TEMPLATE_SHIP_TO

Store sequenced customer/ship-to address defaults under order templates.

Template/sequence primary key and trusted header FK allow multiple address entries. Customer/company/ship-to are optional without target FKs; selection and address validation require a caller.

Columns: 42. Unique keys: `XPKORDER_TEMPLATE_SHIP_TO` (`ORDER_TEMPLATE`, `SEQUENCE`). Outgoing foreign keys: 1.

[Captured object](objects/95339404.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.OUTBOUND_WEB_STATISTICS

Store dated item/customer shipping, rejection and short-pick summaries.

Identity key and nonunique history-date/item-company indexes do not enforce a reporting grain. Stored totals have no proven formula, freshness or event deduplication in this schema.

Columns: 39. Unique keys: `PK_OUTBOUND_WEB_STATISTICS` (`INTERNAL_OUT_STAT_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/127339518.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.OVERRIDE_DATA_MASTER

Define named data-selection and table/field override configuration.

Identifier is primary key; wave step, priority and target/value strings are nullable. Numeric row version defaults to zero and does not implement concurrency; custom SQL flags/text references do not prove safe or active execution.

Columns: 24. Unique keys: `XPKOVERRIDE_DATA_MASTER` (`IDENTIFIER`). Outgoing foreign keys: 0.

[Captured object](objects/159339632.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PACKING_CLASS

Associate named packing classes with optional container groups, criteria and strategy names.

Trusted optional FKs reference group and criteria headers; packing class is primary key. Strategy is text without a captured FK; actual mixing, eligibility and fallback behavior need caller/documentary evidence.

Columns: 17. Unique keys: `XPKPACKING_CLASS` (`PACKING_CLASS`). Outgoing foreign keys: 2.

[Captured object](objects/191339746.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PACKING_CRITERIA_DETAIL

Store uniquely sequenced packing criterion fields and required/active flags.

Criteria/sequence unique key supplements identity; required trusted header FK ensures parent membership. TABLE_FIELD text and flags do not by themselves enforce item compatibility.

Columns: 18. Unique keys: `XPKPACKING_CRITERIA_DETAIL` (`INTERNAL_PACK_CRIT_NUM`); `XAK1PACKING_CRITERIA_DETAIL` (`PACKING_CRITERIA`, `SEQUENCE`). Outgoing foreign keys: 1.

[Captured object](objects/223339860.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PACKING_CRITERIA_HEADER

Define named packing-criteria sets with active/system-created flags.

Criteria name is primary key; all header controls are required with opaque flag defaults. A configured header does not establish effective assignment to a shipment or packing class.

Columns: 15. Unique keys: `XPKPACKING_CRITERIA_HEADER` (`PACKING_CRITERIA`). Outgoing foreign keys: 0.

[Captured object](objects/255339974.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PALLET_BUILDING_MASTER_DETAIL

Link sequenced pallet-build choices to filters, strategies and container types.

Trusted FKs reference header, container type, optional filter and required dynamic strategy. Header/sequence is not uniquely constrained; no runtime selection, fit test or actual pallet construction is proven.

Columns: 17. Unique keys: `XPKPALLET_BUILDING_MASTER_DETA` (`OBJECT_ID`). Outgoing foreign keys: 4.

[Captured object](objects/319340202.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PALLET_BUILDING_MASTER_HEADER

Define named active pallet-building masters.

Identity is primary key and name has no captured unique constraint. Active has an opaque default; actual wave assignment and completed pallet building remain outside the schema.

Columns: 15. Unique keys: `XPKPALLET_BUILDING_MASTER_HEAD` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/351340316.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PAPERWORK_DATA_SELECTION

Associate sequenced paperwork selections with optional document types.

Sequence/master composite primary key and trusted master/type FKs define the settings. Selection text is nullable; neither ordering execution nor document generation follows from the schema alone.

Columns: 15. Unique keys: `XPKPAPERWORK_DATA_SELECTION` (`SELECT_SEQ`, `PAPERWORK_MASTER`). Outgoing foreign keys: 2.

[Captured object](objects/383340430.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PAPERWORK_MASTER

Define named paperwork masters and print-option codes.

Master name is primary key; description/active/print option are required and print option defaults to one. Code meaning and effective wave assignment require separate evidence.

Columns: 15. Unique keys: `XPKPAPERWORK_MASTER` (`PAPERWORK_MASTER`). Outgoing foreign keys: 0.

[Captured object](objects/415340544.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PAPERWORK_PRINT_BREAK

Associate paperwork selection/printer sequences with devices and document counts.

Master/printer-sequence/selection-sequence is primary key; trusted FKs link master, optional device and exact selection pair. Nullable document count and bound default do not prove actual copies dispatched.

Columns: 16. Unique keys: `XPKPAPERWORK_PRINT_BREAK` (`PAPERWORK_MASTER`, `PRINTER_SEQ`, `SELECT_SEQ`). Outgoing foreign keys: 3.

[Captured object](objects/447340658.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PATCH

Store patch identifiers with optional descriptions and version text.

Patch name is primary key. Stored text is provenance metadata, not evidence that a deployment or every component is at that patch level.

Columns: 3. Unique keys: `XPKPATCH` (`PATCH`). Outgoing foreign keys: 0.

[Captured object](objects/479340772.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PERFORMANCE_DATA

Store named transaction timing measurements and optional parameter text.

Identity key and required elapsed-milliseconds/machine/timestamp support measurement records. No observed rows or instrumentation boundary were reviewed, so this does not establish end-to-end timings or safe parameter disclosure.

Columns: 15. Unique keys: `PK_Performance_Data` (`Object_ID`). Outgoing foreign keys: 0.

[Captured object](objects/511340886.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PERFORMANCE_MONITOR

Store monitor interval and lock-owner metadata.

Identity key; start/end/locked-by are nullable and no interval check or locking protocol is captured. Required user-defined numeric fields do not establish a running monitor or mutual exclusion.

Columns: 15. Unique keys: `PK__PERFORMA__6697C5CC6318A919` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/543341000.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PERFORMANCE_MONITOR_TEMPLATE

Associate monitors with server/template strings and monitoring flags.

Required trusted monitor FK and identity key allow multiple templates. Monitor flag has an opaque default; no server address or actual template process was accessed.

Columns: 16. Unique keys: `PK__PERFORMA__6697C5CCCBEC4FDA` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/575341114.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PKCOST_TRIGGER_DETAIL

Store ordered billing-trigger element mappings and retrieval-statement references.

Header/sequence composite key and trusted header/optional statement FKs define a mapping tree shape. Parent-element is text without self-FK; element names and active flags do not prove event processing or XML output.

Columns: 20. Unique keys: `XPKPKCOST_TRIGGER_DETAIL` (`HEADER_KEY_NUM`, `SEQUENCE`). Outgoing foreign keys: 2.

[Captured object](objects/735341684.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PKCOST_TRIGGER_HEADER

Define billing-trigger activity/code, template and event identifiers.

Supplied header key is primary key; required event ID has no captured FK. These trigger-named rows are configuration, not SQL DML triggers or proof a new event hook exists.

Columns: 20. Unique keys: `XPKPKCOST_TRIGGER_HEADER` (`HEADER_KEY_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/767341798.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PM_CHARTDATA

Store chart titles/types, selected/group/date columns and procedure names.

Identity key is unique while sequence is not. Required table/procedure strings are presentation/query configuration without proof of executable validity or current chart results.

Columns: 20. Unique keys: `XPKPM_CHARTDATA` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/799341912.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PRE_2006_WORK_AUTHORIZATIONS

Store table-scoped user/team/zone/equipment/profile authorization-shaped text.

Required table name and otherwise nullable fields form a heap with no keys/FKs. The historical-looking name does not prove age, active authorization use or enforcement.

Columns: 9. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/831342026.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PRINT_DEVICES

Define named print devices and driver/stock/shared-device descriptors.

Device name is primary key; qualified name is required and warehouse-access field is optional text. This registry does not verify installation, reachability, routing eligibility or physical output.

Columns: 19. Unique keys: `XPKPRINT_DEVICES` (`DEVICE_NAME`). Outgoing foreign keys: 0.

[Captured object](objects/847342083.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.PRO_NUMBER

Store named carrier-number ranges, next value and format/check-digit settings.

Set name is primary key; from/to/next are required numeric fields with bound defaults, but no check enforces ordered ranges and no concurrency-safe allocator is proved.

Columns: 19. Unique keys: `XPKPRO_NUMBER` (`SET_NAME`). Outgoing foreign keys: 0.

[Captured object](objects/879342197.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.QC_ASSIGNMENT

Define uniquely named QC selection criteria, priority/frequency and current counter.

Name is unique in addition to identity; criteria has a trusted required FK. Stored counters and active flag do not implement frequency evaluation or prove a container selected for QC.

Columns: 20. Unique keys: `XPKQC_ASSIGNMENT` (`OBJECT_ID`); `XAK1QC_ASSIGNMENT` (`NAME`). Outgoing foreign keys: 1.

[Captured object](objects/1071342881.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.QC_ASSIGNMENT_EVAL_METHOD

Associate QC assignments with named evaluation methods.

Identity key and required trusted assignment FK permit duplicate method names per assignment. Schema does not choose manual versus work/wave execution or prove an event triggers evaluation.

Columns: 14. Unique keys: `XPQC_ASSIGNMENT_EVAL_METHOD` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1103342995.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.QUALITY_HISTORY

Store warehouse/user quality-reason events with optional work/order/item references.

Identity key; activity time and reason are nullable, with company the only captured FK. History shape does not establish error completeness, causality or successful remediation.

Columns: 27. Unique keys: `PK_QUALITY_HISTORY` (`INTERNAL_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1135343109.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RATE_BASE_DTL

Store class-level minimum charges within a rate base.

Required trusted header FK and identity key permit repeated class entries. Above/below-break numeric values have no captured positive-value check or rate formula.

Columns: 16. Unique keys: `XPKRATE_BASE_DTL` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1167343223.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RATE_BASE_HDR

Define rate bases linked to weight-break sets with minimum charges.

Required trusted weight-break-header FK and identity key identify configuration. Rate-base name is not uniquely constrained; active and minimum charges do not establish an effective carrier rate.

Columns: 18. Unique keys: `XPKRATE_BASE_HDR` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1199343337.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RATING_ID

Define rating/carrier/server symbols and manifest/rating flags.

Rating ID is primary key; carrier symbol index is nonunique. Required flags plus opaque defaults describe controls without proving external service availability or manifest completion.

Columns: 21. Unique keys: `XPKRATING_ID` (`RATING_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1295343679.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RATING_PROFILE

Store named ship-confirm rerating and theoretical-container settings.

Profile name is primary key; weight/volume and their units are nullable and rerate flag required. Theoretical values are planning inputs, not measured container attributes or verified rerating.

Columns: 18. Unique keys: `XPKRATING_PROFILE` (`PROFILE_NAME`). Outgoing foreign keys: 0.

[Captured object](objects/1327343793.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RATING_SERVICE

Associate rating IDs and named services with service symbols.

Composite rating-ID/service primary key and separately unique identity coexist. Rating-ID FK is enabled but untrusted; active state does not prove service execution or availability.

Columns: 16. Unique keys: `XPKRATING_SERVICE` (`RATING_ID`, `RATING_SERVICE`); `XAK1RATING_SERVICE` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1359343907.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RATING_SERVICE_ACTION

Define action descriptions and optional request/response schema identifiers.

Supplied numeric object ID is primary key without identity. Schema names are optional strings, not validated schemas or an executable action binding.

Columns: 8. Unique keys: `XPKRATING_SERVICE_ACTION` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1391344021.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RATING_SERVICE_ENDPOINT

Store rating-service/action identifiers and optional dynamic-calling references.

Only identity is a captured unique key and there are no outgoing FKs despite several reference-shaped fields. Dynamic-calling ID is text, so consistent linkage and endpoint invocation are unproven.

Columns: 9. Unique keys: `XPKRATING_SERVICE_ENDPOINT` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1423344135.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RECEIPT_CATCH_WEIGHT_INFO

Store catch-weight values with receipt/header/line/container and optional item/lot/serial context.

Supplied record ID is primary key; trusted FKs link header, line, container, optional company and warehouse. Independent FKs do not prove all references belong to the same receipt, and weight/UOM are nullable.

Columns: 22. Unique keys: `XPKRECEIPT_CATCH_WEIGHT_INFO` (`RECORD_ID`). Outgoing foreign keys: 5.

[Captured object](objects/1455344249.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RECEIPT_CONTAINER_CATCH_WEIGHT_INFORMATION

Store required container catch-weight amounts and units linked to receipt entities.

Identity key and three required trusted receipt FKs support multiple weights per container. Nonunique filtered indexes use IS NOT NULL on required fields; they do not enforce one weight or cross-reference consistency.

Columns: 17. Unique keys: `PK_RECEIPT_CONT_CATCH_WEIGHT` (`OBJECT_ID`). Outgoing foreign keys: 3.

[Captured object](objects/948510758.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RECEIPT_CONTAINER_CHANGE_LOG

Store receipt/container change descriptors and quantity/weight/value snapshots.

Identity key without outgoing FKs; numeric-looking status and measures are nullable float. Change type and timestamps do not prove complete audit coverage or exact financial/inventory arithmetic.

Columns: 20. Unique keys: `XPKRECEIPT_CONTAINER_CHANGE_LOG` (`INTERNAL_SUM_CHANGE_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1519344477.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RECEIPT_DETAIL_03212014

Store receipt-line-shaped item, quantity, status-flow and purchase-order references.

This heap retains an identity property but no unique key, defaults or FKs. The dated suffix does not establish creation chronology, active use or equivalence to the current receipt detail schema.

Columns: 83. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1583344705.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RECEIPT_HEADER_03212014

Store receipt-header-shaped identifiers, addresses, summary statuses and timing fields.

Heap with identity property but no key/FK/defaults. Leading/trailing fields are stored values, and the dated name cannot establish authority, retention process or observed receipt completion.

Columns: 82. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1631344876.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RECEIPT_HEADER_CHANGE_LOG

Store receipt summary change descriptors and counts.

Identity key; most fields including record timestamp are nullable. Trailing status uses float; absent FKs and event constraints mean audit completeness and state-transition meaning remain unproven.

Columns: 16. Unique keys: `XPKRECEIPT_HEADER_CHANGE_LOG` (`INTERNAL_SUM_CHANGE_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1647344933.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RECEIPT_QUALITY_HISTORY

Store receipt quantity/overage/shortage and reason/timing history.

Identity key and trusted warehouse FK coexist with optional receipt/line references without FKs. Stored discrepancy quantities do not prove which rule triggered them or current receipt state.

Columns: 31. Unique keys: `XPKRECEIPT_QUALITY_HISTORY` (`INTERNAL_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1679345047.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.REPORT_CONNECTION

Associate document definitions with retrieval classes, tables, procedures and subreports.

Identity key with required document FK that is enabled but untrusted. Reference strings do not prove executable/report bindings or successful rendering.

Columns: 17. Unique keys: `XPKREPORT_CONNECTION` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1871345731.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RESOURCE_FILE_BASE_PREUPGRADE

Store language/group/key translation-shaped text and formatting fields.

Required language/group/key plus identity property occur in a heap without uniqueness or defaults. The preupgrade name does not prove history, fallback precedence or current display use.

Columns: 18. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/661837670.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RESOURCE_FILE_CUSTOM_PREUPGRADE

Store custom translation-shaped text with optional parent identifiers.

Heap with identity property and no key/FK enforcement; parent is optional numeric. Resource language/group/key fields do not establish parent resolution, override precedence or historical authority.

Columns: 19. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/677837727.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RFID_HISTORY

Store device/container RFID event descriptions and activity timestamps.

Identity key with nonunique event/device/EPC/container indexes. No outgoing FKs or event validation establish complete scan coverage, valid EPCs or physical movement.

Columns: 24. Unique keys: `XPKRFID_HISTORY` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1967346073.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RFID_READER

Store reader names and optional dynamic-calling identifiers.

Identity key; both name and calling ID are nullable without captured FK. This registry does not establish installed reader hardware or an executable handler.

Columns: 14. Unique keys: `XPKRFID_READER` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1999346187.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RFID_READER_PROPS

Store optional name/value properties associated with readers.

Identity key and nullable trusted reader FK permit duplicate property names. Property values are arbitrary text; no hardware connection or configuration validity is verified.

Columns: 15. Unique keys: `XPKRFID_READER_PROPS` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/2031346301.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ROUTING_GUIDE

Store carrier-routing criteria across geography, customer, weight/volume and priority.

Identity key, optional trusted company/carrier-group/class FKs and many nullable bounds define choices. No unique routing name, interval checks or winner/priority algorithm is established by schema.

Columns: 43. Unique keys: `XPKROUTING_GUIDE` (`INTERNAL_ID`). Outgoing foreign keys: 3.

[Captured object](objects/2063346415.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.RULE_SET_ASSIGNMENT

Associate uniquely prioritized functional-area criteria with optional locating/allocation rules.

Area/priority is uniquely constrained; locating/allocation references have trusted FKs. Record/filter names lack captured FKs; active/override flags and numeric row version do not prove evaluation or effective assignment.

Columns: 21. Unique keys: `XPKRULE_SET_ASSIGNMENT` (`OBJECT_ID`); `XUNIQUE_RULE_SET_ASSIGNMENT` (`FUNCTIONAL_AREA`, `PRIORITY`). Outgoing foreign keys: 2.

[Captured object](objects/2095346529.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SCAN_AND_WEIGH_REQUESTS

Store typed scan/weigh request strings and processed flags.

Identity key, required request type/processed and nullable payload support request-state storage. No uniqueness, dispatch, acknowledgment or physical weighing success follows from the flag.

Columns: 15. Unique keys: `XPKSCAN_AND_WEIGH_REQUESTS` (`INTERNAL_REQUEST_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/2127346643.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SCREEN_PART_SEARCH

Store user-specific named search values for screen parts.

Identity key and trusted screen-part FK; user/name combinations lack uniqueness and username has no FK. Stored search text does not prove query safety or actual screen behavior.

Columns: 16. Unique keys: `XPKSCREEN_PART_SEARCH` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/299864135.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SECURITY_CHECKPOINT

Define numbered security checkpoints within forms.

Form/checkpoint composite key and trusted form FK identify checkpoint metadata. Resource key and system-created are nullable; no user privilege or enforcement is established by definitions alone.

Columns: 15. Unique keys: `XPKSECURITY_CHECKPOINT` (`FORM_ID`, `CHECK_POINT`). Outgoing foreign keys: 1.

[Captured object](objects/395864477.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SECURITY_GROUP

Store named security-group descriptions and active states.

Only identity is unique; required group name is not uniquely constrained. No membership or authorization enforcement follows from this header schema.

Columns: 15. Unique keys: `XPKSECURITY_GROUP` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/427864591.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SERIAL_NUM_TEMPLATE

Store named sequenced serial patterns and duplicate/range-entry controls.

Identity key with nonunique name index permits repeated sequence/name entries. Required pattern and flags are definitions, not validation execution or a guarantee serial values are unique.

Columns: 19. Unique keys: `XPKSERIAL_NUM_TEMPLATE` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/459864705.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SHIFT_TIME

Define shift IDs per warehouse with textual start/end times.

Shift/warehouse is uniquely constrained alongside identity. Time fields are nvarchar and warehouse has no captured FK; interval validity, timezone and overnight interpretation are not enforced here.

Columns: 17. Unique keys: `XPK_SHIFT_TIME` (`OBJECT_ID`); `XUNIQUE_SHIFT_TIME` (`SHIFT_ID`, `WAREHOUSE`). Outgoing foreign keys: 0.

[Captured object](objects/1093839209.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SHIPMENT_CATCH_WEIGHT_INFO

Store shipment/line/container catch-weight records and optional item tracking context.

Record ID is primary key; required header FK is untrusted while line/container and optional warehouse/company FKs are trusted. Independent references do not prove cross-entity consistency; UOM is nullable.

Columns: 22. Unique keys: `XPKSHIPMENT_CATCH_WEIGHT_INFO` (`RECORD_ID`). Outgoing foreign keys: 5.

[Captured object](objects/587865161.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SHIPMENT_DETAIL_VAS_ACTIVITY

Associate shipment lines with VAS definitions and optional instructions.

Required trusted line/activity FKs and identity key permit multiple entries per pair. The table contains no completion flag, so association does not prove completed service.

Columns: 15. Unique keys: `XPKSHIP_DETAIL_VAS_ACTIVITY` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/651865389.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SHIPMENT_HEADER_LOCATION

Associate shipments with location identities and subclasses.

All three required references have trusted FKs; only identity is unique, allowing multiple associations. Location linkage is not proof of physical shipment position.

Columns: 15. Unique keys: `XPKSHIPMENT_HEADER_LOCATION` (`OBJECT_ID`). Outgoing foreign keys: 3.

[Captured object](objects/715865617.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SHIPMENT_HEADER_VAS_ACTIVITY

Associate shipment headers with VAS definitions and optional instructions.

Required trusted shipment/activity FKs and identity key permit multiple pair rows. No completion field or process execution is established by header association.

Columns: 15. Unique keys: `XPKSHIP_HEADER_VAS_ACTIVITY` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/747865731.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SHIPPER_CODE

Define named shippers and contact/meter/employer identifiers.

Shipper code is primary key and contact name/phone are required. Optional carrier-specific numbers are metadata fields; no account, credentials or active carrier acceptance was checked.

Columns: 19. Unique keys: `XPKSHIPPER_CODE` (`SHIPPER_CODE`). Outgoing foreign keys: 0.

[Captured object](objects/779865845.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SHIPPER_CROSS_REFERENCE

Associate shippers with warehouses/companies and default flags.

Trusted required warehouse/shipper and optional company FKs exist; only identity is unique. Multiple default candidates are structurally possible, so default resolution needs caller evidence.

Columns: 16. Unique keys: `XPKSHIPPER_CROSS_REFERENCE` (`INTERNAL_CROSS_REF_NUM`). Outgoing foreign keys: 3.

[Captured object](objects/811865959.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SHIPPING_ADDRESS

Store typed shipping address records with optional load references.

Identity key; load is nonuniquely indexed without a captured FK. Optional address fields and record-type code do not prove delivery validity or one address per load/type.

Columns: 26. Unique keys: `XPKSHIPPING_ADDRESS` (`INTERNAL_SHIP_ADDRESS_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/843866073.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SHIPPING_CALENDAR

Define named shipping calendars with weekend exclusion flags.

Calendar name is primary key and active/weekend flags are required. Schema does not establish which carrier or order uses the calendar or how shipping dates are calculated.

Columns: 16. Unique keys: `XPKSHIPPING_CALENDAR` (`CALENDAR`). Outgoing foreign keys: 0.

[Captured object](objects/875866187.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SHIPPING_CALENDAR_NO_SHIP_DAYS

Store dated shipping-calendar exclusions and descriptions.

Identity key; calendar is required but has no captured FK and date is nullable. No unique calendar/date key or exclusion enforcement is established.

Columns: 15. Unique keys: `XPKSHIPPING_CALENDAR_NO_SHIP_DAYS` (`INTERNAL_SHIP_CALENDAR_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/907866301.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SHIPPING_CONTAINER_LOCATION

Associate shipping containers with locations and subclasses.

Required trusted container/location/generic-subclass FKs and identity key permit multiple rows. This association alone does not prove actual location, next move or consistent descendants.

Columns: 15. Unique keys: `XPKSHIPPING_CONTAINER_LOCATION` (`OBJECT_ID`). Outgoing foreign keys: 3.

[Captured object](objects/1099866985.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SHIPPING_CONT_QC_COUNT

Store item-level counted quantities for shipping containers.

Container FK is trusted; optional company FK uses SET_NULL on delete. Identity-only uniqueness permits several count records per item/lot/container; counts do not prove QC pass or inventory reconciliation.

Columns: 18. Unique keys: `XPKSHIPPING_CONT_QC_COUNT` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/939866415.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SHIPPING_CONT_QC_EVALUATION

Store whether QC assignments matched shipping containers.

Required trusted assignment/container FKs and identity key permit repeated evaluation pairs. MATCHED is a required text flag without captured value check; it is not a completion/approval guarantee.

Columns: 15. Unique keys: `XPKSHIPPING_CONT_QC_EVALUATION` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/971866529.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SHIPPING_CONT_QC_REASON_CODE

Attach failure quantities and reason-code text to container QC counts.

Required trusted count FK and identity key permit multiple reasons. Failed quantity has no captured nonnegative or sum-bound check, and reason text has no FK to a reason registry.

Columns: 15. Unique keys: `XPKSHIPPING_CONT_QC_REASON_COD` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1003866643.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SHIPPING_CONT_VAS_ACTIVITY

Store container VAS instructions and completion flags.

Required trusted container/activity FKs and identity key define associations; completed is a required char with opaque default. Stored completion does not prove physical service or action authorization.

Columns: 17. Unique keys: `XPKSHIP_CONT_VAS_ACTIVITY` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/1035866757.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SHIPPING_PREFERENCES

Define named shipping status bounds, work/manifest/transfer/printing controls.

Preference name is primary key; selected work types have trusted FKs. No check orders low/high ship-confirm statuses; RFID endpoint defaults numerically to zero in a text column and split mode to one. Flag semantics and effective selection require caller evidence.

Columns: 28. Unique keys: `XPKSHIPPING_PREFERENCES` (`PREFERENCE_NAME`). Outgoing foreign keys: 2.

[Captured object](objects/1163867213.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SLOTTING_ITEM_UP_FIELDS

Store item slotting-interface field positions, formatting and default mappings.

Identity key; position/name/length/decimal/ILS field/default are nullable and numeric flag required. No unique position or parser/transport implementation is established.

Columns: 19. Unique keys: `XPKSLOTTING_ITEM_UP_FIELDS` (`INTERNAL_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1195867327.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SLOTTING_LOC_UP_FIELDS

Store location slotting-interface field positions and formatting mappings.

Identity key and nullable field/format/default descriptors mirror the item mapping shape. Required numeric flag has an opaque default; actual export order and validation remain caller behavior.

Columns: 19. Unique keys: `XPKSLOTTING_LOC_UP_FIELDS` (`INTERNAL_REQ_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1227867441.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SLOTTING_MOVES_DOWN_FIELDS

Store required slotting-move field positions, offsets and mapping descriptors.

Identity key with required position/start/length/decimal/ILS fields has no uniqueness or range checks. Schema does not prove an imported move or safe field slicing.

Columns: 19. Unique keys: `XPKSLOTTING_MOVES_DOWN_FIELDS` (`INTERNAL_REQ_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1259867555.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SLOTTING_WAREHOUSE_UP_FIELDS

Store warehouse slotting-interface field positions and formatting mappings.

Identity key; nullable mapping fields and required numeric flag define export-shaped configuration. Actual warehouse upload, field precedence and default application are unverified.

Columns: 19. Unique keys: `XPKSLOTTING_WAREHOUSE_UP_FIELDS` (`INTERNAL_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1291867669.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SSRS_PRINTING_REQUEST

Store report print requests, device/copies/status and business-entity references.

Identity key; copies defaults to one and priority/launch to zero. Reference numbers have no captured FKs and processing/rendering times are optional; stored status does not prove output or measured end-to-end duration.

Columns: 41. Unique keys: `XPKSSRS_PRINTING_REQUEST` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1323867783.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.STAGING_ILA

Store item/location assignment-shaped records with a processed marker.

Heap retains identity property but no key/FK. Warehouse/item/allocation-location are required, company optional and processed default opaque; no successful assignment/import is established.

Columns: 18. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/353540443.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.STATISTICS_CHART

Associate chart titles with required statistical sources and optional groups.

Identity key and trusted source/group FKs define chart metadata. The schema does not ensure the selected group belongs to the same source or that data is fresh.

Columns: 15. Unique keys: `XPKSTATISTICS_CHART` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/1355867897.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.STATISTICS_GROUP

Define named sequenced groups within statistical sources.

Identity key and trusted required source FK permit repeated names/sequences per source. Actual chart ordering or aggregation requires caller evidence.

Columns: 15. Unique keys: `XPKSTATISTICS_GROUP` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1419868125.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.STORAGE_TEMPLATE_HEADER

Define named active storage templates.

Template name is primary key; description and active are required. Unit breakdown, conversion behavior and effective item assignment require detail/caller evidence.

Columns: 14. Unique keys: `XPKSTORAGE_TEMPLATE_HEADER` (`STORAGE_TEMPLATE`). Outgoing foreign keys: 0.

[Captured object](objects/1547868581.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.STORE_LOCATION_ASSIGNMENT

Store sequenced warehouse/customer criteria and put-to-store location descriptors.

Trusted warehouse/optional company FKs coexist with nullable customer/ship-to/location text. Sequence is not unique, and no actual location choice or putaway is proven.

Columns: 20. Unique keys: `XPKSTORE_LOCATION_ASSIGNMENT` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/1579868695.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.SUMMARY_REQUESTS

Store typed summary requests containing old/new string payloads.

Request number is primary key with a bound default rather than identity; request and record types are required. No queue consumption, successful summary update or payload format is established.

Columns: 16. Unique keys: `XPKSUMMARY_REQUESTS` (`REQUEST_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1611868809.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.ScriptHash

Store unique binary hash values with process/timestamp metadata.

Hash is varbinary(32) primary key; algorithm, script identity and enforcement consumer are not present. A row cannot be treated as proof a script is trusted or executed.

Columns: 3. Unique keys: `XPKScriptHash` (`Hash`). Outgoing foreign keys: 0.

[Captured object](objects/331864249.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.Staging_Generic_Config_Dtl

Store generic-configuration-shaped values with a processed marker.

Identity key, required record type/identifier and optional system/user values lack a unique record-type/identifier pair. Opaque flags/processed defaults do not establish import validity or successful configuration activation.

Columns: 31. Unique keys: `PkcGCDstagingObjectid` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1065315105.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.Staging_ILC

Store item/location capacity-shaped rows with optional processing state.

Heap has identity property without key/FK; capacity/threshold/scope fields are nullable. No range checks or import consumer establishes effective replenishment settings.

Columns: 24. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1084687062.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TCP_PROTOCOL_PROPERTIES

Store endpoint-linked TCP framing, connection, retry and heartbeat settings.

Identity key and optional trusted endpoint FK; retries/interval default zero and incoming queue count 100. No port bounds, units, actual network values or service behavior are verified from configuration schema.

Columns: 39. Unique keys: `XPKDIF_PROTOCOL_TCP` (`PROTOCOL_TCP_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1707869151.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TEXT_MESSAGE

Define named active message text and communication-method codes.

Message ID is primary key; text optional and communication method required. Stored text does not prove display, notification dispatch or user acknowledgment.

Columns: 15. Unique keys: `XPKTEXT_MESSAGE` (`MESSAGE_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1739869265.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TEXT_MESSAGE_ASSIGNMENT

Associate text messages with optional item/account/company scope.

Identity key and required trusted message FK permit multiple scope matches. No item/account/company FKs or selection precedence are established.

Columns: 16. Unique keys: `XPKTEXT_MESSAGE_ASSIGNMENT` (`INTERNAL_TEXT_MESS_NUM`). Outgoing foreign keys: 1.

[Captured object](objects/1771869379.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TIME_TRACKING

Store per-user scheduled hours, breaks, dates and weekday flags.

Username has a unique trusted FK, separately from identity. Required dates/hours and flags have no range/interval checks; the table describes scheduling settings, not attendance or payroll proof.

Columns: 26. Unique keys: `XPKTIME_TRACKING` (`OBJECT_ID`); `XIF593TIME_TRACKING` (`USER_NAME`). Outgoing foreign keys: 1.

[Captured object](objects/1803869493.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TOTE_DETAIL

Store tote item/quantity sorting and shipment/container/work references.

Identity key and required tote-header FK that is untrusted; other numeric entity references lack captured FKs. Sort/location flags and zero quantity-to-pack default do not prove completed sorting, packing or inventory movement.

Columns: 33. Unique keys: `XPKTOTE_DETAIL` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1815729571.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TOTE_HEADER

Store tote condition, optional warehouse/ID/user and sorting flag.

Identity is unique while tote-ID/condition/warehouse index is nonunique. Optional external tote ID and assigned user do not prove unique physical tote identity or authorization.

Columns: 17. Unique keys: `XPKTOTE_HEADER` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1783729457.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TRACE_FILTER

Store trace filter column/operator/value descriptors and active state.

Heap with nullable column/comparison/logical codes and required opaque-default active flag. No key, target binding or trace execution is established.

Columns: 7. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1883869778.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TRACE_INFO

Store trace identifiers, file-name metadata and maximum size.

Heap has required trace ID without unique key; file/size are nullable. Schema does not prove an active trace, accessible file or captured event completeness.

Columns: 4. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1899869835.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TRANS_HIST_ATTRIBUTES

Store typed attribute values linked by generic numeric history identifiers.

Identity key and nonunique link/type index permit multiple attributes of the same type. No captured link FK or value interpretation establishes a unique pivot or complete history context.

Columns: 15. Unique keys: `XPKTRANS_HIST_ATTRIBUTES` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/1947870006.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TRAV3PL_DOWNLOAD_ITEM

Store nullable item-interface-shaped action, condition and product attributes.

Heap without keys/FKs/defaults; most controls are text, costs numeric, and column39 has no established meaning. Structural payload review does not identify an active importer or infer the custom prefix function.

Columns: 39. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/321540329.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TRAV3PL_ILA

Store nullable item/allocation-location assignment-shaped rows.

Heap fields include integer internal number and textual warehouse/item/location; timestamp is text. No uniqueness, conversion validity or active consumer is established.

Columns: 17. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/449540785.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TRAV3PL_ILA2

Store a reduced nullable item/location assignment payload.

Eight fields cover item/company/warehouse/location/unit/user/time with integer internal number; no key/FK/defaults. The numbered suffix does not prove precedence or a successful second-stage conversion.

Columns: 8. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/513541013.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TRAV3PL_ILC

Store nullable item/location capacity and replenishment-threshold payloads.

Heap has numeric maximum/percentage values but textual timestamp and no constraints. Shape does not establish effective capacity, valid percentage ranges or an approved import path.

Columns: 23. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1148687290.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TRAV3PL_ITEM_XREF

Store nullable item/cross-reference and barcode-related payload fields.

Heap has integer internal number but text timestamp/user numeric fields. No unique reference, valid item linkage or active lookup behavior is established.

Columns: 18. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/145539702.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TRAV3PL_IUOM

Store nullable item unit-of-measure conversion and dimension payloads.

Numeric conversion/size/weight and textual sequence/timestamp occur without key/FK/checks. No valid conversion hierarchy, type coercion or import completion is proved.

Columns: 31. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/497540956.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TRAV3PL_LI

Store nullable inventory-location bucket and tracking payloads.

Heap quantities/value/cost are numeric; lot and weight/volume units have short nvarchar(2-byte) metadata lengths. No uniqueness or operational inventory consistency follows from this payload shape.

Columns: 47. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1164687347.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TRAV3PL_TEMP_DOWNLOAD_ITEM

Store wide item-interface payloads with ten repeated UOM/dimension/reference groups.

Required record ID/action plus many nullable typed fields form a heap without keys/FKs/defaults. Repeated fields support item import shape, but TEMP in the name does not make this a session temp table or prove a consumer.

Columns: 280. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/305540272.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TRAV_LANE

Store lane/work-unit associations and optional pallet/priority flags.

Required lane/work-unit text forms a heap without uniqueness or FKs. Schema does not establish active pallet location, priority escalation logic or lane capacity.

Columns: 4. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/2011870234.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.TRAV_PALLET

Store work-unit/location/lane associations with timestamps.

Required three identifiers and timestamp form a heap without keys/FKs. No one-to-one lane/pallet relationship or physical pallet move is established.

Columns: 6. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/2027870291.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.UPLOAD_APPT_SCHEDULE

Store appointment-interface records with action/link/status/error metadata.

Supplied numeric record ID is primary key; receipt/dock/date are nullable and link ID textual. Process-stamp index is nonunique; no transfer/acknowledgment or valid receipt linkage is proved.

Columns: 19. Unique keys: `XPKUPLOAD_APPT_SCHEDULE` (`INTERFACE_RECORD_ID`). Outgoing foreign keys: 0.

[Captured object](objects/2043870348.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.UPLOAD_INVENTORY_TRANS

Store inventory-transaction interface payloads including before/after quantity buckets.

Record ID is supplied with a bound default and primary key; context and before/after fields are nullable. No FK or completed delivery/transaction guarantee follows from stored action/condition text.

Columns: 51. Unique keys: `XPKUPLOAD_INVENTORY_TRANS` (`INTERFACE_RECORD_ID`). Outgoing foreign keys: 0.

[Captured object](objects/2075870462.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.UPLOAD_ITEM_BALANCE

Store interface snapshots of item inventory buckets and totals.

Identity record key and process-stamp index allow repeated item/warehouse/lot states. No unique snapshot grain, current balance or upload success is established.

Columns: 37. Unique keys: `XPKUPLOAD_ITEM_BALANCE` (`INTERFACE_RECORD_ID`). Outgoing foreign keys: 0.

[Captured object](objects/2107870576.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.UPLOAD_RECEIPT_CONTAINER

Store receipt-container interface payloads and link/action/error metadata.

Identity key; link ID is nullable text, receipt/container references have no FKs, and quantities use numeric(14,5). Zero numeric defaults do not establish receipt execution or successful delivery.

Columns: 59. Unique keys: `XPKUPLOAD_RECEIPT_CONTAINER` (`INTERFACE_RECORD_ID`). Outgoing foreign keys: 0.

[Captured object](objects/152387612.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.UPLOAD_RECEIPT_DETAIL

Store receipt-line interface payloads and a required numeric link identifier.

Identity key with nonunique receipt-line/process indexes; interface link is numeric, unlike container link text. No captured FK proves header linkage, and condition/error storage does not prove transfer success.

Columns: 84. Unique keys: `XPKUPLOAD_RECEIPT_DETAIL` (`INTERFACE_RECORD_ID`). Outgoing foreign keys: 0.

[Captured object](objects/184387726.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.UPLOAD_RECEIPT_HEADER

Store receipt-header interface payloads with addresses, quantities and milestones.

Identity key and required action code; receipt identity and most business fields are nullable without FKs. Nonunique receipt/process indexes do not establish one record per receipt or completed delivery.

Columns: 76. Unique keys: `XPKUPLOAD_RECEIPT_HEADER` (`INTERFACE_RECORD_ID`). Outgoing foreign keys: 0.

[Captured object](objects/216387840.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.USER_LAST_ACTIVITY

Store a last-activity end timestamp per user name.

Username is primary key and timestamp required, with no captured user FK. A stored timestamp is not evidence of current presence, login or attendance.

Columns: 13. Unique keys: `XPK_USER_LAST_ACTIVITY` (`USER_NAME`). Outgoing foreign keys: 0.

[Captured object](objects/1749841546.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.USER_PROFILE_ACTIVITY

Store named activity records associated with user-name text.

Identity key; username/activity/timestamp are required without a user FK or unique pair. This shape does not establish full audit completeness or current user authorization.

Columns: 14. Unique keys: `XPKUSER_PROFILE_ACTIVITY` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/376388410.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.USER_SETTINGS

Store user/machine roaming and upgrade-setting flags.

Required trusted user FK and identity key permit multiple rows per user/machine. Both flags have opaque defaults; precedence and actual profile synchronization are not established.

Columns: 16. Unique keys: `XPKUSER_SETTINGS` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/408388524.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.VAS_ACTIVITY

Define uniquely named VAS activities with optional selection criteria and instructions.

Name is unique alongside identity; filter FK is trusted and optional. Application-level defaults to zero without code interpretation; activity definitions do not prove execution/completion.

Columns: 17. Unique keys: `XPKVAS_ACTIVITY` (`OBJECT_ID`); `XAK1VAS_ACTIVITY` (`NAME`). Outgoing foreign keys: 1.

[Captured object](objects/440388638.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.VENDOR

Store vendor/ship-from identity, contact data and inheritance/verification flags.

Identity is the only unique key; optional company FK is trusted. Required vendor/name flags and nullable parent/ship-from fields do not establish unique vendor scope or inheritance/receiving validation behavior.

Columns: 43. Unique keys: `XPKVENDOR` (`INTERNAL_VENDOR_NUM`). Outgoing foreign keys: 1.

[Captured object](objects/472388752.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.VERSION

Store build identifiers and optional service-pack/version text.

Build is primary key. This is schema/provenance metadata only, not a request for user build information or evidence of every deployed component.

Columns: 3. Unique keys: `XPKVERSION` (`BUILD`). Outgoing foreign keys: 0.

[Captured object](objects/504388866.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.VOCOLLECT_CONTAINERS

Store work-unit/container identifiers, types and status for voice-work context.

Identity key; all operational identifiers/status are nullable with no FKs. Schema does not establish actual container assignment, device state or supported voice workflow.

Columns: 16. Unique keys: `XPKVOCOLLECT_CONTAINERS` (`OBJECT_ID`). Outgoing foreign keys: 0.

[Captured object](objects/568389094.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.VOCOLLECT_PROFILE

Store region-keyed voice-work options and optional work-profile bindings.

Region is primary key and work profile has a trusted optional FK. Many prompt/skip/label/delivery options are nullable text; lot-ID length defaults zero. No hardware or prompt behavior is inferred.

Columns: 49. Unique keys: `XPKVOCOLLECT_PROFILE` (`REGION`). Outgoing foreign keys: 1.

[Captured object](objects/600389208.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.VOCOLLECT_PROFILE_FUNC_ASSIGN

Associate voice-profile regions with function identifiers.

Identity key and nullable region FK that is untrusted permit repeated function assignments. No function execution or active authorization is proven.

Columns: 14. Unique keys: `XPKVOCOLLECT_PROFILE_FUNC_ASSI` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/632389322.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WAREHOUSE_ACCESS

Associate users with warehouses through unique pairs.

Warehouse/user pair is unique in addition to identity; both FKs are trusted. Access records are authorization metadata, not evidence every caller enforces the association.

Columns: 14. Unique keys: `XPKWAREHOUSE_ACCESS` (`OBJECT_ID`); `XAK1WAREHOUSE_ACCESS` (`OBJECT_ID`); `X_UNIQUE_WAREHOUSE_ACCESS` (`warehouse`, `USER_NAME`). Outgoing foreign keys: 2.

[Captured object](objects/696389550.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WAREHOUSE_ALERT_ADDRESS

Store email destinations/templates linked to warehouse alerts.

Identity key and required trusted alert FK allow multiple addresses. Required email text does not validate an address or prove notification delivery.

Columns: 15. Unique keys: `XPKWAREHOUSE_ALERT_ADDRESS` (`INTERNAL_ADDRESS_NUM`). Outgoing foreign keys: 1.

[Captured object](objects/760389778.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WAREHOUSE_ALERT_CRITERIA

Store configured criterion values for particular alerts.

Alert/type/name composite key and trusted alert/criterion-definition FKs establish membership. Stored values remain text; criteria evaluation and actual alert creation are unverified.

Columns: 15. Unique keys: `XPKWAREHOUSE_ALERT_CRITERIA` (`INTERNAL_ALERT_NUM`, `ALERT_TYPE`, `NAME`). Outgoing foreign keys: 2.

[Captured object](objects/792389892.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WAREHOUSE_ALERT_TYPE

Define alert types and default priority/action/template metadata.

Alert type is primary key, description and allow-multiple flag required. Dynamic-calling identifier and defaults do not create an event hook or prove scheduled alert execution.

Columns: 20. Unique keys: `XPKWAREHOUSE_ALERT_TYPE` (`ALERT_TYPE`). Outgoing foreign keys: 0.

[Captured object](objects/856390120.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WAREHOUSE_ALERT_TYPE_CRITERIA

Define typed named criteria and optional operators for alert types.

Type/name primary key with trusted alert-type FK. Required flag has an opaque default and operator text has no grammar check, so evaluation remains caller behavior.

Columns: 16. Unique keys: `XPKWAREHOUSE_ALERT_TYPE_CRITER` (`ALERT_TYPE`, `NAME`). Outgoing foreign keys: 1.

[Captured object](objects/888390234.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WAREHOUSE_COMP_ADDR_DETAIL

Store ship-from, freight-billing and returns addresses per warehouse/company.

Warehouse/company pair is unique in addition to identity, with trusted FKs to both. Required ship-from fields do not prove postal validity or active selection for any document.

Columns: 47. Unique keys: `XPKWAREHOUSE_COMP_ADDR_DTL` (`OBJECT_ID`); `XIE1WAREHOUSE_COMP_ADDR_DTL` (`WAREHOUSE`, `COMPANY`). Outgoing foreign keys: 2.

[Captured object](objects/920390348.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WAREHOUSE_MOBILE_MENU

Store mobile menu hierarchy, form links, resource keys and authorization descriptors.

Identity key; form FK trusted and self-parent FK untrusted. Menu name/sequence are not unique and active is text. No currently visible menu, screen route or user authorization is established.

Columns: 23. Unique keys: `XPKWAREHOUSE_MOBILE_MENU` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/952390462.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WAVE_MASTER_AUTHORIZED_WAREHOUSES

Associate warehouse names with launch-master name text.

Identity key and trusted warehouse FK; launch name has no captured FK and the pair is not unique. This scope metadata does not prove wave authorization enforcement.

Columns: 14. Unique keys: `XPKWAVE_MASTER_AUTHORIZED_WAREHOUSES` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/984390576.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WAVE_PRINT_DEVICE

Store wave-number printer-choice records.

Heap retains identity property but no unique key/FKs. Wave number required and document/label printers optional; no single-choice precedence or successful print dispatch is established.

Columns: 15. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1016390690.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WAVE_REPLENISHMENT_MASTER_SELECTION

Associate launch masters with replenishment masters.

Both required names have trusted FKs; identity alone is unique, so repeated pairs are possible. The association does not prove selection order or generated replenishment work.

Columns: 14. Unique keys: `XPKWAVE_REPLENISHMENT_MASTER_SELECTION` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/1032390747.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WEB_SCREEN_DATA_DETAIL

Store sequenced screen field/lookup definitions and required flags.

Internal-screen/sequence composite key; screen name and field required, company optional, no captured FKs. Metadata does not establish runtime validation or rendered navigation.

Columns: 19. Unique keys: `PK_WEB_SCREEN_DATA_DETAIL` (`INTERNAL_SCREEN_NUM`, `SEQUENCE`). Outgoing foreign keys: 0.

[Captured object](objects/1064390861.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WEB_USER

Store web-user identity, authorization modes, language and profile metadata.

User name is primary key; authorization/language/type flags are required, with optional password-storage field. No credential values or storage algorithm were inspected, and schema does not establish authentication or effective privileges.

Columns: 30. Unique keys: `XPKWEB_USER` (`WEB_USER`). Outgoing foreign keys: 0.

[Captured object](objects/1128391089.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WEB_USER_COMPANY_ASSIGNMENT

Associate web users with companies through unique pairs.

Company/user pair is unique and both required FKs trusted. Association metadata does not prove application enforcement or current user's access.

Columns: 14. Unique keys: `XPKWEB_USER_COMPANY_ASSIGNMENT` (`OBJECT_ID`); `X_UNIQUE_WEB_USER_COMPANY_ASSIGNMENT` (`COMPANY`, `WEB_USER`). Outgoing foreign keys: 2.

[Captured object](objects/1160391203.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WEB_USER_CUSTOMER_ASSIGNMENT

Associate web users with customer-name and optional company scope.

Supplied record ID is primary key; user/company FKs trusted but customer has no captured FK or pair uniqueness. Current permission resolution remains outside the schema.

Columns: 15. Unique keys: `XPKWEB_USER_CUSTOMER_ASSIGNMENT` (`RECORD_ID`). Outgoing foreign keys: 2.

[Captured object](objects/1192391317.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WEB_USER_ITEM_AUTH

Associate web users with item-selection names.

User/selection composite key and trusted user FK prevent duplicate pairs. Selection name has no captured FK; no selected inventory, filter execution or permission enforcement is established.

Columns: 13. Unique keys: `XPKWEB_USER_ITEM_AUTH` (`WEB_USER`, `ITEM_SELECTION`). Outgoing foreign keys: 1.

[Captured object](objects/1224391431.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WEB_USER_PAGE_AUTHORIZATION

Associate web users with exchange pages through unique pairs.

Composite user/page key and trusted FKs to both define membership. Actual route authentication/authorization is a separate caller contract.

Columns: 13. Unique keys: `XPKWEB_USER_PAGE_AUTHORIZATION` (`WEB_USER`, `WEB_PAGE_NAME`). Outgoing foreign keys: 2.

[Captured object](objects/1256391545.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WEB_USER_SHIP_TO_ASSIGNMENT

Associate web users with ship-to selection names.

Identity key and trusted user FK permit duplicate user/selection pairs. No captured selection FK or execution proves effective ship-to access.

Columns: 14. Unique keys: `XPKWEB_USER_SHIP_TO_ASSIGNMENT` (`INTERNAL_SHIP_ASSIGN_NUM`). Outgoing foreign keys: 1.

[Captured object](objects/1288391659.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WEB_USER_WAREHOUSE_ASSIGNMENT

Associate web users with warehouses through unique pairs.

Warehouse/user pair is unique alongside identity and both FKs trusted. Stored association alone does not prove all application routes enforce warehouse scope.

Columns: 14. Unique keys: `XPKWEB_USER_WAREHOUSE_ASSIGNMENT` (`OBJECT_ID`); `X_UNIQUE_WEB_USER_WAREHOUSE_ASSIGNMENT` (`WAREHOUSE`, `WEB_USER`). Outgoing foreign keys: 2.

[Captured object](objects/1124511385.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WORK_CREATION_MASTER

Define named work-creation criteria, work type, priority and unit/size limits.

Name is primary key and required work type has a trusted FK. Filter/process/method are required strings; nullable maximums and auto-print flag do not establish actual work creation, order or default-limit meaning.

Columns: 28. Unique keys: `XPKWORK_CREATION_MASTER` (`WORK_CREATION_NAME`). Outgoing foreign keys: 1.

[Captured object](objects/1320391773.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WORK_ORDER_HEADER

Store build-order item quantities, instructions, milestones and condition.

Identity key; external order ID is required but not unique. No outgoing FKs/checks establish item validity, quantity conservation or completed assembly; planned build time is not observed execution time.

Columns: 48. Unique keys: `PK_WORK_ORDER_HEADER` (`INTERNAL_WORK_ORDER_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1416392115.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WORK_ORDER_PREFERENCES

Define named work-order creation, paperwork, location and inventory-status controls.

Preference name is primary key; default locations are nullable strings without FKs. Required create-work/print flags and ID method do not establish effective user selection or physical putaway.

Columns: 21. Unique keys: `PK_WORK_ORDER_PREFERENCES` (`PREFERENCE_NAME`). Outgoing foreign keys: 0.

[Captured object](objects/1448392229.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WORK_ORDER_PUTAWAY_UNIT

Store quantity/location/item units linked to work orders for putaway.

Identity key and required trusted work-order FK; external putaway ID is not unique and location/wave references lack captured FKs. Work-created flag does not prove physical movement or completion.

Columns: 35. Unique keys: `PK_WORK_ORDER_PUTAWAY_UNIT` (`INTERNAL_PUTAWAY_NUM`). Outgoing foreign keys: 1.

[Captured object](objects/1480392343.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WORK_ORDER_WEB_STATISTICS

Store dated item work-order build totals and fiscal dimensions.

Identity key with nonunique date/item-company indexes permits duplicate reporting dimensions. Nullable built quantity/weight/value/cost totals require aggregation evidence, not runtime inference.

Columns: 30. Unique keys: `XPKWORK_ORDER_WEB_STATISTICS` (`INTERNAL_WORK_ORD_STAT_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1512392457.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WORK_PROFILE_HEADER

Define named work profiles with equipment/team/region and warehouse-authorization modes.

Profile name is primary key; active and warehouse authorization required, while equipment/team/region are optional without captured FKs. Header does not establish current user's effective profile or eligible work.

Columns: 18. Unique keys: `XPKWORK_PROFILE_HEADER` (`WORK_PROFILE`). Outgoing foreign keys: 0.

[Captured object](objects/1576392685.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WORK_PROFILE_USER_AUTH

Associate work profiles with optional users.

Required profile and nullable user have trusted FKs, but the pair is not unique. Nullable username does not imply public access; authorization interpretation requires a caller.

Columns: 14. Unique keys: `XPKWORK_PROFILE_USER_AUTH` (`OBJECT_ID`). Outgoing foreign keys: 2.

[Captured object](objects/1608392799.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WORK_PROFILE_WAREHOUSE_ACCESS

Associate work profiles with warehouse-name scope.

Identity key and trusted required profile FK; warehouse is required text without a captured warehouse FK or unique pair. Effective work eligibility and access enforcement are not established.

Columns: 14. Unique keys: `XPKWORK_PROFILE_WAREHOUSE_ACCESS` (`OBJECT_ID`). Outgoing foreign keys: 1.

[Captured object](objects/1640392913.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.WORK_SPECIAL_HANDLING

Store scoped item/location/quantity verification and pick/putaway exception controls.

Identity key; item/account/user/work-type/zone/company scope fields are nullable without FKs. Required flags and numeric defaults PUTAWAY_WITH_LU=3 and SHIP_CONT_VER_METH=1 do not establish meanings, matching precedence or effective operator settings.

Columns: 39. Unique keys: `XPKWORK_SPECIAL_HANDLING` (`INTERNAL_WORK_SPEC_NUM`). Outgoing foreign keys: 0.

[Captured object](objects/1736393255.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.item_class_GCD_v6

Store nullable generic-configuration-shaped item-class fields.

Nine nullable fields form a heap without keys/FKs/defaults. Record-type/identifier/system-value shape supports a configuration payload, while suffix and name do not establish version compatibility or active import.

Columns: 9. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1260687689.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.tmp_collist

Store column-name, length and order metadata-shaped rows.

All three fields are nullable in an ordinary catalogued user-table heap, not a session-local temporary table. No consumer, unique ordering or cleanup lifecycle is established.

Columns: 3. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1835869607.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.tmp_dbtables

Store table-name metadata with an identity counter.

Ordinary user-table heap has identity property but no primary/unique key. NAME is nullable; table-ID values do not prove correspondence to database object IDs or a safe temporary lifecycle.

Columns: 2. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1851869664.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)

### dbo.tmp_var_table_search

Store search-variable and table-column-name text pairs.

Both fields are nullable in an ordinary user-table heap with no keys/defaults/FKs. No search execution, query safety or session isolation is established.

Columns: 2. Unique keys: None captured. Outgoing foreign keys: 0.

[Captured object](objects/1867869721.json) · [Exact schema/evidence bindings](mappings/batches/table-role-continuation.json)
