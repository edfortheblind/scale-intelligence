# Captured table usage review

All 518 captured tables were compared with 997 stored procedures/functions and 1142 total retained source modules. This is a source-correlation report; it does not identify unused tables.

Snapshot: `20260929T214106Z`. The owner accepts the current replica as the documentation baseline.

| Measure | Count |
| --- | ---: |
| Tables with a credited captured reference | 306 |
| Tables with no credited captured reference | 212 |
| P/FN/IF/TF modules scanned | 997 |
| All retained source modules scanned | 1142 |
| Reviewed semantic contracts correlated | 1138 |
| Eligible modules missing a reviewed contract | 0 |
| Runtime SQL/target sites unresolved by this scanner | 85 |
| Cross-source channel differences | 135 |

## How to read the result

A catalog target ID, a reviewed READS/WRITES effect, or a named relation/DML position can establish a captured reference. The JSON records each channel separately, with exact module, source and batch hashes. Contract-associated references retain their original field/index and annotation; their direct or delegated scope is not assumed. Direct module counts use catalog or lexical relation evidence. Precise SELECT/INSERT/UPDATE/DELETE tokens are attributed only by the bounded source parser; a reviewed WRITES effect does not by itself specify which DML statement occurred.

Foreign keys and token/string mentions are separate. A literal containing a table name may be configuration text or part of runtime-built SQL; it is not credited as an executed reference. Static view/module paths and attached-trigger paths do not prove that an application follows them.

The 518-table denominator includes custom, staging and alternate record shapes. A missing reference cannot exclude application-generated SQL, external code, dynamic identifiers or uncaptured historical consumers. No percentage of unused tables is calculated.

## Owner hypotheses

The owner suggested that D_ or date-like names might indicate backup/leftover tables. For Interface_Item_Failure_1024 the owner suggested both a backup table and an item-master-failure purpose; 1024 is not treated as a proven date. These hypotheses remain unconfirmed. The following entries retain their actual captured-reference status; neither a name nor a missing reference establishes lifecycle or purpose.

| Table | Captured reference status | Owner hypothesis |
| --- | --- | --- |
| `dbo.ARCHIVE_PREFERENCES_ORIG20260922` | NO_CAPTURED_REFERENCE | DATE_LIKE_NAME_BACKUP_OR_LEFTOVER |
| `dbo.D_ITEM` | NO_CAPTURED_REFERENCE | D_PREFIX_BACKUP_OR_LEFTOVER |
| `dbo.D_ITEM_CROSS_REFERENCE` | NO_CAPTURED_REFERENCE | D_PREFIX_BACKUP_OR_LEFTOVER |
| `dbo.D_ITEM_LOCATION_ASSIGNMENT` | NO_CAPTURED_REFERENCE | D_PREFIX_BACKUP_OR_LEFTOVER |
| `dbo.D_ITEM_LOCATION_CAPACITY` | NO_CAPTURED_REFERENCE | D_PREFIX_BACKUP_OR_LEFTOVER |
| `dbo.D_ITEM_UNIT_OF_MEASURE` | NO_CAPTURED_REFERENCE | D_PREFIX_BACKUP_OR_LEFTOVER |
| `dbo.D_LOCATION` | NO_CAPTURED_REFERENCE | D_PREFIX_BACKUP_OR_LEFTOVER |
| `dbo.D_LOCATION_INVENTORY` | NO_CAPTURED_REFERENCE | D_PREFIX_BACKUP_OR_LEFTOVER |
| `dbo.D_LOCATION_TEMPLATE` | NO_CAPTURED_REFERENCE | D_PREFIX_BACKUP_OR_LEFTOVER |
| `dbo.D_LOCATION_TYPE` | NO_CAPTURED_REFERENCE | D_PREFIX_BACKUP_OR_LEFTOVER |
| `dbo.D_LOCATION_UNIT_OF_MEASURE` | NO_CAPTURED_REFERENCE | D_PREFIX_BACKUP_OR_LEFTOVER |
| `dbo.Interface_Item_Failure_1024` | NO_CAPTURED_REFERENCE | OWNER_SPECIFIC_BACKUP_OR_LEFTOVER; ITEM_MASTER_FAILURE_RECORDS |
| `dbo.ITEM_fy2015_prices` | NO_CAPTURED_REFERENCE | DATE_LIKE_NAME_BACKUP_OR_LEFTOVER |
| `dbo.RECEIPT_DETAIL_03212014` | NO_CAPTURED_REFERENCE | DATE_LIKE_NAME_BACKUP_OR_LEFTOVER |
| `dbo.RECEIPT_HEADER_03212014` | NO_CAPTURED_REFERENCE | DATE_LIKE_NAME_BACKUP_OR_LEFTOVER |

## Tables without a credited captured reference

Review the JSON non-credit observations, unresolved runtime SQL and external-caller limits before interpreting this list. This list is not a deletion or cleanup recommendation.

- `dbo.ADJUSTMENT_TYPE_WAREHOUSE_ACCESS` (1629248859): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.APP_ID_TEMPLATE_DTL` (1757249315): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.APP_ID_TEMPLATE_HDR` (1789249429): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.AR_1SHIPPING_CONTAINER` (1885249771): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_APPOINTMENT_SCHEDULE` (1901249828): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.AR_AUDIT_LOG` (1917249885): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_AUDIT_LOG_VALUE` (1877842002): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.AR_CLOSED_MANIFESTS` (1933249942): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_COMMENT_TEXT` (1949249999): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_CYCLE_COUNT_PLAN` (1981250113): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_CYCLE_COUNT_REQUEST` (5835333): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.AR_DELETED_RECEIPT_CONTAINER` (1893842059): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.AR_DIF_INCOMING_MESSAGE` (1997250170): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_DIF_OUTGOING_MESSAGE` (2013250227): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_DOCK_MGMT_WORK_DATA` (2029250284): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_DOWNLOAD_ITEM` (2045250341): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_DOWNLOAD_ORDER_COMMENT` (2061250398): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_DOWNLOAD_ORDER_CONTAINER` (2077250455): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_DOWNLOAD_ORDER_DETAIL` (2093250512): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_DOWNLOAD_ORDER_HEADER` (2109250569): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_DOWNLOAD_PURCHASE_ORDER_DETAIL` (2125250626): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_DOWNLOAD_PURCHASE_ORDER_HEADER` (2141250683): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_DOWNLOAD_RECEIPT_CONTAINER` (9767092): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_DOWNLOAD_RECEIPT_DETAIL` (25767149): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_DOWNLOAD_RECEIPT_HEADER` (41767206): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_INTERFACE_ERROR` (73767320): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_INV_MGMT_WORK_DATA` (89767377): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_LABOR_MANAGEMENT_DETAIL` (105767434): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_LABOR_MANAGEMENT_SUMMARY` (121767491): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_LAUNCH_STATISTICS` (137767548): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_LAUNCH_SUMMARY` (153767605): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_LOCATING_REQUEST` (169767662): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_MULTI_ORDER_PALLET` (1909842116): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.AR_NOTIFICATION_MESSAGE` (233767890): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_ORDER_DETAIL` (249767947): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.AR_ORDER_HEADER` (265768004): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_PURCHASE_ORDER_HEADER` (297768118): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_QUALITY_HISTORY` (313768175): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_RECEIPT_CATCH_WEIGHT_INFO` (1925842173): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.AR_RECEIPT_QUALITY_HISTORY` (409768517): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_REPLENISHMENT_REQUEST` (425768574): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_RFID_HISTORY` (441768631): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_SCAN_AND_WEIGH_REQUESTS` (473768745): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_SHIPMENT_ACCESSORIALS` (521768916): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.AR_SHIPMENT_ALLOC_REQUEST` (537768973): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.AR_SHIPMENT_HEADER_LOCATION` (617769258): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.AR_SHIPPING_CONT_QC_COUNT` (633769315): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.AR_SHIPPING_CONT_QC_EVALUATION` (649769372): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.AR_SHIPPING_CONT_QC_REASON_COD` (665769429): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_SHIPPING_CONT_QC_REASON_CODE` (681769486): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.AR_SHIPPING_CONTAINER_LOCATION` (713769600): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.AR_STATISTICS_VALUE` (745769714): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_SUMMARY_REQUESTS` (761769771): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_TOTE_DETAIL` (1861841945): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.AR_TOTE_HEADER` (1845841888): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_TRANS_HIST_ATTRIBUTES` (777769828): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_UPLOAD_INVENTORY_TRANS` (825769999): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_UPLOAD_ITEM_BALANCE` (841770056): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_UPLOAD_ORDER_COMMENT` (857770113): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_UPLOAD_RECEIPT_CONTAINER` (921770341): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_UPLOAD_RECEIPT_DETAIL` (937770398): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_UPLOAD_RECEIPT_HEADER` (953770455): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_USER_ACTIVITY` (969770512): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_WAREHOUSE_ALERT_REQUEST` (985770569): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_WORK_ORDER_DETAIL` (1941842230): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.AR_WORK_ORDER_HEADER` (1033770740): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.AR_WORK_ORDER_PUTAWAY_UNIT` (1957842287): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.ARCHIVE_PREFERENCES_ORIG20260922` (83843711): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.ASSET_MANAGEMENT_DETAIL` (1113771025): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.ASSET_MANAGEMENT_REQUESTS` (1145771139): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.ASSET_MANAGEMENT_SUMMARY` (1177771253): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.ATTRIBUTE` (1209771367): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL. Identifier tokens occur outside a recognized relation position; column/alias text may explain them.
- `dbo.CARRIER_COMPANY_ACCESS` (1221839665): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.CARRIER_GROUP_DETAIL` (1497772393): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.CARRIER_RATE` (1561772621): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.CARRIER_RATE_BASE_ASSIGN_DTL` (1593772735): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.CARRIER_RATE_BASE_ASSIGN_HDR` (1625772849): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.CARRIER_WAREHOUSE_ACCESS` (1141839380): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.CLOSED_MANIFESTS` (1657772963): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.CONTAINER_GROUP_DETAIL` (1945773989): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.CONTAINER_TYPE_WAREHOUSE_ACCESS` (2073774445): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.CUSTOMER_EPC_ENCODING` (54291253): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.CUSTOMER_KNOWLEDGE_HUB` (772510131): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.CYCLE_COUNT_MASTER` (86291367): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.CYCLE_COUNT_MASTER_WAREHOUSE_ACCESS` (1397840292): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.D_ITEM` (522029191): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.D_ITEM_CROSS_REFERENCE` (538029248): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.D_ITEM_LOCATION_ASSIGNMENT` (554029305): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.D_ITEM_LOCATION_CAPACITY` (618029533): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.D_ITEM_UNIT_OF_MEASURE` (714029875): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.D_LOCATION` (842030331): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.D_LOCATION_INVENTORY` (922030616): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.D_LOCATION_TEMPLATE` (858030388): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.D_LOCATION_TYPE` (730029932): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.D_LOCATION_UNIT_OF_MEASURE` (874030445): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.DOWNLOAD_ITEM_v6` (1276687746): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.EQUIPMENT_TYPE` (1398296041): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Identifier tokens occur outside a recognized relation position; column/alias text may explain them.
- `dbo.EXCHANGE_WEB_PAGE` (1462296269): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.FILE_PROTOCOL_PROPERTIES` (1590296725): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.FILTER_GROUP_BY` (1718297181): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.FILTER_ORDER_BY` (1750297295): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.FISCAL_CALENDAR_DETAIL` (1814297523): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.FISCAL_CALENDAR_HEADER` (1846297637): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.HTTP_PROTOCOL_PROPERTIES` (1959730084): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.INBOUND_WEB_STATISTICS` (50815243): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.Interface_Item_Failure_1024` (1644689057): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Functional purpose remains unresolved. The owner item-master-failure suggestion is retained only as a hypothesis; no role credit is added.
- `dbo.INVENTORY_ADJ_WEB_STATISTICS` (322816212): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.ITEM_CAT_UPDATES` (436352769): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.item_class_GCD_v6` (1260687689): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.ITEM_fy2015_prices` (450816668): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.ITEM_SUBSTITUTE` (530816953): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.ITEM_WEB_STATISTICS` (626817295): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.LABEL_MASTER_DETAIL` (658817409): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.LABEL_PRINT_REQUEST` (722817637): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.LABOR_MANAGEMENT_SUMMARY` (818817979): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.LABOR_PLAN_DTL` (850818093): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.LARGE_TEXT` (914818321): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.LAUNCH_FLOW_DETAIL` (946818435): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.LAUNCH_MAXIMUMS` (1042818777): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.LAUNCH_SUMMARY` (1106819005): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.LBR_PLN_EX_RESULT` (1138819119): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.LOADING_AREA_ASSIGNMENT` (1170819233): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.LOCATING_RULE_DETAIL` (1234819461): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.LOCATION_CONTAINER` (1330819803): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.LOCATION_TEMPLATE` (1426820145): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL. Identifier tokens occur outside a recognized relation position; column/alias text may explain them. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.MENU_FAVORITE` (1826821570): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.NOTIFICATION_ADDRESS` (1986822140): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.NOTIFICATION_MESSAGE` (2018822254): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.ORDER_TEMPLATE_COMMENT` (2146822710): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.ORDER_TEMPLATE_HEADER` (31339176): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.ORDER_TEMPLATE_ITEM` (63339290): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.ORDER_TEMPLATE_SHIP_TO` (95339404): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.OUTBOUND_WEB_STATISTICS` (127339518): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.OVERRIDE_DATA_MASTER` (159339632): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.PACKING_CRITERIA_DETAIL` (223339860): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.PALLET_BUILDING_MASTER_DETAIL` (319340202): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.PAPERWORK_DATA_SELECTION` (383340430): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.PAPERWORK_PRINT_BREAK` (447340658): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.PATCH` (479340772): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.PERFORMANCE_DATA` (511340886): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.PERFORMANCE_MONITOR` (543341000): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.PERFORMANCE_MONITOR_TEMPLATE` (575341114): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.PICK_LOCATION_GROUP_DETAIL` (607341228): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.PICK_LOCATION_GROUP_HEADER` (639341342): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.PICKING_GROUP_DETAIL` (671341456): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.PKCOST_TRIGGER_DETAIL` (735341684): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.PKCOST_TRIGGER_HEADER` (767341798): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.PRE_2006_WORK_AUTHORIZATIONS` (831342026): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.PRINT_DEVICES` (847342083): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.QC_ASSIGNMENT_EVAL_METHOD` (1103342995): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.RATE_BASE_DTL` (1167343223): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.RATE_BASE_HDR` (1199343337): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.RATING_PROFILE` (1327343793): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.RATING_SERVICE_ENDPOINT` (1423344135): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.RECEIPT_CATCH_WEIGHT_INFO` (1455344249): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.RECEIPT_CONTAINER_CATCH_WEIGHT_INFORMATION` (948510758): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.RECEIPT_CONTAINER_CHANGE_LOG` (1519344477): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.RECEIPT_DETAIL_03212014` (1583344705): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.RECEIPT_HEADER_03212014` (1631344876): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.RECEIPT_HEADER_CHANGE_LOG` (1647344933): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.REPLENISHMENT_STRATEGY` (1839345617): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.RESOURCE_FILE_BASE_PREUPGRADE` (661837670): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.RESOURCE_FILE_CUSTOM_PREUPGRADE` (677837727): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.RFID_HISTORY` (1967346073): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.RFID_READER` (1999346187): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.RFID_READER_PROPS` (2031346301): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.SCAN_AND_WEIGH_REQUESTS` (2127346643): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.ScriptHash` (331864249): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.SHIPMENT_CATCH_WEIGHT_INFO` (587865161): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.SHIPPING_CALENDAR` (875866187): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.SHIPPING_CALENDAR_NO_SHIP_DAYS` (907866301): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.SHIPPING_CONT_QC_COUNT` (939866415): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.SHIPPING_CONT_QC_EVALUATION` (971866529): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.SHIPPING_CONT_QC_REASON_CODE` (1003866643): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.SSRS_PRINTING_REQUEST` (1323867783): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Original string-contained identifiers exist but do not prove a table access or executed dynamic SQL.
- `dbo.STATISTICS_CHART` (1355867897): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.STATISTICS_GROUP` (1419868125): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.SUMMARY_REQUESTS` (1611868809): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.TCP_PROTOCOL_PROPERTIES` (1707869151): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.TIME_TRACKING` (1803869493): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.tmp_collist` (1835869607): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.tmp_dbtables` (1851869664): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.tmp_var_table_search` (1867869721): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.TRAV3PL_DOWNLOAD_ITEM` (321540329): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.TRAV3PL_ILA` (449540785): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.TRAV3PL_ILA2` (513541013): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.TRAV3PL_ILC` (1148687290): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.TRAV3PL_ITEM_XREF` (145539702): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.TRAV3PL_IUOM` (497540956): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.TRAV3PL_LI` (1164687347): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.TRAV3PL_TEMP_DOWNLOAD_ITEM` (305540272): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.UPLOAD_APPT_SCHEDULE` (2043870348): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.UPLOAD_INVENTORY_TRANS` (2075870462): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.UPLOAD_ITEM_BALANCE` (2107870576): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.UPLOAD_RECEIPT_CONTAINER` (152387612): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.UPLOAD_RECEIPT_DETAIL` (184387726): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.UPLOAD_RECEIPT_HEADER` (216387840): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.VOCOLLECT_CONTAINERS` (568389094): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.VOCOLLECT_PROFILE_FUNC_ASSIGN` (632389322): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.WAREHOUSE_ALERT_ADDRESS` (760389778): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.WAVE_PRINT_DEVICE` (1016390690): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.WAVE_REPLENISHMENT_MASTER_SELECTION` (1032390747): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.WEB_SCREEN_DATA_DETAIL` (1064390861): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.WEB_USER_CUSTOMER_ASSIGNMENT` (1192391317): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.WEB_USER_ITEM_AUTH` (1224391431): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.WEB_USER_PAGE_AUTHORIZATION` (1256391545): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.WEB_USER_SHIP_TO_ASSIGNMENT` (1288391659): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.WEB_USER_WAREHOUSE_ASSIGNMENT` (1124511385): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.WORK_CREATION_MASTER` (1320391773): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Identifier tokens occur outside a recognized relation position; column/alias text may explain them. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.WORK_ORDER_WEB_STATISTICS` (1512392457): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate.
- `dbo.WORK_PROFILE_HEADER` (1576392685): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.
- `dbo.WORK_PROFILE_WAREHOUSE_ACCESS` (1640392913): No direct credited P/FN/IF/TF reference was found; view/trigger/module paths and non-credit observations remain separate. Foreign-key relationships exist; they do not count as routine usage.

## All table results

| Table | Source status | Direct SP/function modules | Other direct modules | FK in / out |
| --- | --- | ---: | ---: | --- |
| [`dbo.ACCESSORIAL_DETAIL`](objects/1469248289.json) | REFERENCED_IN_CAPTURED_SOURCE | 5 | 0 | 0 / 1 |
| [`dbo.ACCESSORIAL_HEADER`](objects/1501248403.json) | REFERENCED_IN_CAPTURED_SOURCE | 6 | 0 | 1 / 1 |
| [`dbo.ACTION_MENU`](objects/1533248517.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 2 / 0 |
| [`dbo.ACTION_MENU_OPTION`](objects/1565248631.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 2 |
| [`dbo.ADJUSTMENT_TYPE`](objects/1597248745.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 2 / 0 |
| [`dbo.ADJUSTMENT_TYPE_WAREHOUSE_ACCESS`](objects/1629248859.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.ADVANCED_ALLOCATION`](objects/1661248973.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 0 / 0 |
| [`dbo.ALLOCATION_RULE_DETAIL`](objects/1693249087.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 1 |
| [`dbo.ALLOCATION_RULE_HEADER`](objects/1725249201.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 6 / 0 |
| [`dbo.APP_ID_TEMPLATE_DTL`](objects/1757249315.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.APP_ID_TEMPLATE_HDR`](objects/1789249429.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 1 / 0 |
| [`dbo.APP_IDENTIFIER`](objects/1821249543.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 4 / 0 |
| [`dbo.APPOINTMENT_SCHEDULE`](objects/1853249657.json) | REFERENCED_IN_CAPTURED_SOURCE | 13 | 2 | 0 / 1 |
| [`dbo.AR_1SHIPPING_CONTAINER`](objects/1885249771.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_APPOINTMENT_SCHEDULE`](objects/1901249828.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_AUDIT_LOG`](objects/1917249885.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_AUDIT_LOG_VALUE`](objects/1877842002.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_CLOSED_MANIFESTS`](objects/1933249942.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_COMMENT_TEXT`](objects/1949249999.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_CONFIG_DIR_COLLECTED_DATA`](objects/1965250056.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.AR_CYCLE_COUNT_PLAN`](objects/1981250113.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_CYCLE_COUNT_REQUEST`](objects/5835333.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_DELETED_RECEIPT_CONTAINER`](objects/1893842059.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_DIF_INCOMING_MESSAGE`](objects/1997250170.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_DIF_OUTGOING_MESSAGE`](objects/2013250227.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_DOCK_MGMT_WORK_DATA`](objects/2029250284.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_DOWNLOAD_ITEM`](objects/2045250341.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_DOWNLOAD_ORDER_COMMENT`](objects/2061250398.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_DOWNLOAD_ORDER_CONTAINER`](objects/2077250455.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_DOWNLOAD_ORDER_DETAIL`](objects/2093250512.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_DOWNLOAD_ORDER_HEADER`](objects/2109250569.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_DOWNLOAD_PURCHASE_ORDER_DETAIL`](objects/2125250626.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_DOWNLOAD_PURCHASE_ORDER_HEADER`](objects/2141250683.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_DOWNLOAD_RECEIPT_CONTAINER`](objects/9767092.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_DOWNLOAD_RECEIPT_DETAIL`](objects/25767149.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_DOWNLOAD_RECEIPT_HEADER`](objects/41767206.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_IA_WORK_INSTRUCTION`](objects/57767263.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 0 / 0 |
| [`dbo.AR_INTERFACE_ERROR`](objects/73767320.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_INV_MGMT_WORK_DATA`](objects/89767377.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_LABOR_MANAGEMENT_DETAIL`](objects/105767434.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_LABOR_MANAGEMENT_SUMMARY`](objects/121767491.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_LAUNCH_STATISTICS`](objects/137767548.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_LAUNCH_SUMMARY`](objects/153767605.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_LOCATING_REQUEST`](objects/169767662.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_LOCATION_INVENTORY_ATTRIBUTES`](objects/185767719.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 1 | 0 / 0 |
| [`dbo.AR_LOT`](objects/201767776.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 2 | 0 / 0 |
| [`dbo.AR_LOT_ATTRIBUTE`](objects/217767833.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 0 |
| [`dbo.AR_MULTI_ORDER_PALLET`](objects/1909842116.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_NOTIFICATION_MESSAGE`](objects/233767890.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_ORDER_DETAIL`](objects/249767947.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_ORDER_HEADER`](objects/265768004.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_PROCESS_HISTORY`](objects/281768061.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.AR_PURCHASE_ORDER_HEADER`](objects/297768118.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_QUALITY_HISTORY`](objects/313768175.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_RECEIPT_CATCH_WEIGHT_INFO`](objects/1925842173.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_RECEIPT_CONTAINER`](objects/329768232.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 0 / 0 |
| [`dbo.AR_RECEIPT_DETAIL`](objects/345768289.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 2 | 0 / 0 |
| [`dbo.AR_RECEIPT_HEADER`](objects/377768403.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 0 / 0 |
| [`dbo.AR_RECEIPT_QUALITY_HISTORY`](objects/409768517.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_REPLENISHMENT_REQUEST`](objects/425768574.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_RFID_HISTORY`](objects/441768631.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_SCAN_AND_WEIGH_REQUESTS`](objects/473768745.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_SERIAL_NUMBER`](objects/489768802.json) | REFERENCED_IN_CAPTURED_SOURCE | 11 | 1 | 0 / 0 |
| [`dbo.AR_SHIPMENT_ACCESSORIALS`](objects/521768916.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_SHIPMENT_ALLOC_REQUEST`](objects/537768973.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_SHIPMENT_DETAIL`](objects/553769030.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 4 | 0 / 0 |
| [`dbo.AR_SHIPMENT_HEADER`](objects/585769144.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 6 | 0 / 0 |
| [`dbo.AR_SHIPMENT_HEADER_LOCATION`](objects/617769258.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_SHIPPING_CONT_QC_COUNT`](objects/633769315.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_SHIPPING_CONT_QC_EVALUATION`](objects/649769372.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_SHIPPING_CONT_QC_REASON_COD`](objects/665769429.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_SHIPPING_CONT_QC_REASON_CODE`](objects/681769486.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_SHIPPING_CONTAINER`](objects/697769543.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 5 | 0 / 0 |
| [`dbo.AR_SHIPPING_CONTAINER_LOCATION`](objects/713769600.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_SHIPPING_LOAD`](objects/729769657.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 2 | 0 / 0 |
| [`dbo.AR_STATISTICS_VALUE`](objects/745769714.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_SUMMARY_REQUESTS`](objects/761769771.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_TOTE_DETAIL`](objects/1861841945.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_TOTE_HEADER`](objects/1845841888.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_TRANS_HIST_ATTRIBUTES`](objects/777769828.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_TRANSACTION_HISTORY`](objects/793769885.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 1 | 0 / 0 |
| [`dbo.AR_UPLOAD_INVENTORY_TRANS`](objects/825769999.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_UPLOAD_ITEM_BALANCE`](objects/841770056.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_UPLOAD_ORDER_COMMENT`](objects/857770113.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_UPLOAD_ORDER_CONTAINER`](objects/873770170.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 0 / 0 |
| [`dbo.AR_UPLOAD_ORDER_DETAIL`](objects/889770227.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 0 / 0 |
| [`dbo.AR_UPLOAD_ORDER_HEADER`](objects/905770284.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 0 / 0 |
| [`dbo.AR_UPLOAD_RECEIPT_CONTAINER`](objects/921770341.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_UPLOAD_RECEIPT_DETAIL`](objects/937770398.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_UPLOAD_RECEIPT_HEADER`](objects/953770455.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_USER_ACTIVITY`](objects/969770512.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_WAREHOUSE_ALERT_REQUEST`](objects/985770569.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_WORK_INSTRUCTION`](objects/1001770626.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 0 / 0 |
| [`dbo.AR_WORK_ORDER_DETAIL`](objects/1941842230.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_WORK_ORDER_HEADER`](objects/1033770740.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AR_WORK_ORDER_PUTAWAY_UNIT`](objects/1957842287.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.ARCHIVE_PREFERENCES`](objects/1049770797.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 1 | 0 / 0 |
| [`dbo.ARCHIVE_PREFERENCES_ORIG20260922`](objects/83843711.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.ARCHIVE_TABLES`](objects/1081770911.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.ASSET_MANAGEMENT_DETAIL`](objects/1113771025.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.ASSET_MANAGEMENT_REQUESTS`](objects/1145771139.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.ASSET_MANAGEMENT_SUMMARY`](objects/1177771253.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.ATTRIBUTE`](objects/1209771367.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.AUDIT_LOG`](objects/1241771481.json) | REFERENCED_IN_CAPTURED_SOURCE | 6 | 1 | 1 / 0 |
| [`dbo.AUDIT_LOG_VALUE`](objects/1273771595.json) | REFERENCED_IN_CAPTURED_SOURCE | 6 | 0 | 0 / 1 |
| [`dbo.AzureSQLMaintenanceLog`](objects/908582325.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 0 |
| [`dbo.BATCH_SUBMISSION_CONFIG`](objects/1305771709.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 1 / 0 |
| [`dbo.BILL_OF_MATERIALS_DETAIL`](objects/1337771823.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 1 | 0 / 1 |
| [`dbo.BILL_OF_MATERIALS_HEADER`](objects/1369771937.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 1 / 0 |
| [`dbo.CARRIER`](objects/1401772051.json) | REFERENCED_IN_CAPTURED_SOURCE | 8 | 1 | 4 / 4 |
| [`dbo.CARRIER_COMMITMENTS`](objects/1433772165.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 0 / 0 |
| [`dbo.CARRIER_COMPANY_ACCESS`](objects/1221839665.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.CARRIER_EDI_REFERENCE`](objects/1465772279.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 2 |
| [`dbo.CARRIER_GROUP_DETAIL`](objects/1497772393.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.CARRIER_GROUP_HEADER`](objects/1529772507.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 3 / 1 |
| [`dbo.CARRIER_RATE`](objects/1561772621.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.CARRIER_RATE_BASE_ASSIGN_DTL`](objects/1593772735.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 3 |
| [`dbo.CARRIER_RATE_BASE_ASSIGN_HDR`](objects/1625772849.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 1 / 2 |
| [`dbo.CARRIER_WAREHOUSE_ACCESS`](objects/1141839380.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.CATCH_WEIGHT_INFORMATION`](objects/708509903.json) | REFERENCED_IN_CAPTURED_SOURCE | 5 | 2 | 0 / 1 |
| [`dbo.CLOSED_MANIFESTS`](objects/1657772963.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.COMMENT_TEXT`](objects/1689773077.json) | REFERENCED_IN_CAPTURED_SOURCE | 10 | 0 | 0 / 1 |
| [`dbo.COMMENT_TYPE`](objects/1721773191.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 4 / 0 |
| [`dbo.COMMENT_TYPE_DOC_ASSIGNMENT`](objects/1753773305.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 1 |
| [`dbo.COMPANY`](objects/1785773419.json) | REFERENCED_IN_CAPTURED_SOURCE | 18 | 0 | 35 / 1 |
| [`dbo.COMPANY_ACCESS`](objects/1817773533.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 0 / 2 |
| [`dbo.CONFIG_DIR_CdGetIdentityColumn_DATA`](objects/1849773647.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.CONFIG_DIR_COLLECTED_DATA`](objects/1865773704.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.CONSOLIDATION_CRITERIA`](objects/1881773761.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 0 / 0 |
| [`dbo.CONTAINER_CLASS`](objects/1913773875.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 5 / 0 |
| [`dbo.CONTAINER_GROUP_DETAIL`](objects/1945773989.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.CONTAINER_GROUP_HEADER`](objects/1977774103.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 2 / 0 |
| [`dbo.CONTAINER_TYPE`](objects/2009774217.json) | REFERENCED_IN_CAPTURED_SOURCE | 5 | 1 | 4 / 1 |
| [`dbo.CONTAINER_TYPE_AUTHORIZED_COMPANY`](objects/2041774331.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 0 / 2 |
| [`dbo.CONTAINER_TYPE_WAREHOUSE_ACCESS`](objects/2073774445.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.Conversion_ILA`](objects/385540557.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.Conversion_ILC`](objects/1100687119.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.CONVERSION_INVENTORY`](objects/1212687518.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.CUSTOM_STATUS_FLOW_DETAIL`](objects/2105774559.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 1 |
| [`dbo.CUSTOM_STATUS_FLOW_HEADER`](objects/2137774673.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 6 / 1 |
| [`dbo.CUSTOMER`](objects/22291139.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 1 / 0 |
| [`dbo.CUSTOMER_EPC_ENCODING`](objects/54291253.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.CUSTOMER_KNOWLEDGE_HUB`](objects/772510131.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.CYCLE_COUNT_MASTER`](objects/86291367.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 1 / 0 |
| [`dbo.CYCLE_COUNT_MASTER_WAREHOUSE_ACCESS`](objects/1397840292.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.CYCLE_COUNT_PLAN`](objects/118291481.json) | REFERENCED_IN_CAPTURED_SOURCE | 7 | 2 | 1 / 0 |
| [`dbo.CYCLE_COUNT_PREFERENCES`](objects/150291595.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 1 / 0 |
| [`dbo.CYCLE_COUNT_REQUEST`](objects/182291709.json) | REFERENCED_IN_CAPTURED_SOURCE | 18 | 1 | 2 / 1 |
| [`dbo.CYCLE_COUNT_THRESHOLD`](objects/214291823.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 0 |
| [`dbo.D_ITEM`](objects/522029191.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.D_ITEM_CROSS_REFERENCE`](objects/538029248.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.D_ITEM_LOCATION_ASSIGNMENT`](objects/554029305.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.D_ITEM_LOCATION_CAPACITY`](objects/618029533.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.D_ITEM_UNIT_OF_MEASURE`](objects/714029875.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.D_LOCATION`](objects/842030331.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.D_LOCATION_INVENTORY`](objects/922030616.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.D_LOCATION_TEMPLATE`](objects/858030388.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.D_LOCATION_TYPE`](objects/730029932.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.D_LOCATION_UNIT_OF_MEASURE`](objects/874030445.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.DASHBOARD_DATA`](objects/246291937.json) | REFERENCED_IN_CAPTURED_SOURCE | 12 | 0 | 0 / 1 |
| [`dbo.DASHBOARD_TILE_ACCESS`](objects/278292051.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 1 |
| [`dbo.DASHBOARD_WIDGETS`](objects/1557840862.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.DATA_RETRIEVAL_STMT_DETAIL`](objects/310292165.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 2 / 2 |
| [`dbo.DATA_RETRIEVAL_STMT_HEADER`](objects/342292279.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 2 / 0 |
| [`dbo.DATA_RETRIEVAL_STMT_TOKEN`](objects/374292393.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 1 |
| [`dbo.DELETED_RECEIPT_CONTAINER`](objects/406292507.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 0 / 0 |
| [`dbo.DIF_ENDPOINT`](objects/438292621.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 2 | 4 / 1 |
| [`dbo.DIF_EVENT`](objects/470292735.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 2 | 3 / 0 |
| [`dbo.DIF_INCOMING_MESSAGE`](objects/502292849.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 1 | 0 / 2 |
| [`dbo.DIF_OUTGOING_MESSAGE`](objects/534292963.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 1 | 0 / 1 |
| [`dbo.DOCK_AREA_CARRIER_ASSIGNMENT`](objects/566293077.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 0 / 2 |
| [`dbo.DOCK_LOCATION`](objects/598293191.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 1 | 0 / 1 |
| [`dbo.DOCK_MGMT_FLOW_DETAIL`](objects/630293305.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 5 |
| [`dbo.DOCK_MGMT_FLOW_HEADER`](objects/662293419.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 1 / 2 |
| [`dbo.DOCK_MGMT_WORK_DATA`](objects/694293533.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.DOCK_MGR_GRID_CUSTOMIZATION`](objects/726293647.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 1 |
| [`dbo.DOCUMENT`](objects/758293761.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 2 / 1 |
| [`dbo.DOCUMENT_MANAGEMENT`](objects/1922314108.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 1 | 0 / 0 |
| [`dbo.DOCUMENT_ROUTING`](objects/790293875.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 0 / 2 |
| [`dbo.DOCUMENT_TYPE`](objects/822293989.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 0 | 3 / 0 |
| [`dbo.DOWNLOAD_APPT_SCHEDULE`](objects/854294103.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 0 | 0 / 0 |
| [`dbo.DOWNLOAD_ITEM`](objects/886294217.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 0 | 0 / 0 |
| [`dbo.DOWNLOAD_ITEM_v6`](objects/1276687746.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.DOWNLOAD_ORDER_COMMENT`](objects/918294331.json) | REFERENCED_IN_CAPTURED_SOURCE | 8 | 0 | 0 / 1 |
| [`dbo.DOWNLOAD_ORDER_CONTAINER`](objects/950294445.json) | REFERENCED_IN_CAPTURED_SOURCE | 8 | 0 | 0 / 0 |
| [`dbo.DOWNLOAD_ORDER_DETAIL`](objects/982294559.json) | REFERENCED_IN_CAPTURED_SOURCE | 8 | 0 | 0 / 0 |
| [`dbo.DOWNLOAD_ORDER_HEADER`](objects/1014294673.json) | REFERENCED_IN_CAPTURED_SOURCE | 8 | 0 | 0 / 0 |
| [`dbo.DOWNLOAD_ORDER_VAS_ACTIVITY`](objects/1046294787.json) | REFERENCED_IN_CAPTURED_SOURCE | 6 | 0 | 0 / 0 |
| [`dbo.DOWNLOAD_PURCHASE_ORDER_DETAIL`](objects/1078294901.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 0 | 0 / 0 |
| [`dbo.DOWNLOAD_PURCHASE_ORDER_HEADER`](objects/1110295015.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 0 | 0 / 0 |
| [`dbo.DOWNLOAD_RECEIPT_CONTAINER`](objects/1142295129.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 0 | 0 / 0 |
| [`dbo.DOWNLOAD_RECEIPT_DETAIL`](objects/1174295243.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 0 | 0 / 0 |
| [`dbo.DOWNLOAD_RECEIPT_HEADER`](objects/1206295357.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 0 | 0 / 0 |
| [`dbo.DOWNLOAD_SERIAL_NUMBER`](objects/1238295471.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 0 | 0 / 0 |
| [`dbo.DYNAMIC_ACTION`](objects/1270295585.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 2 / 1 |
| [`dbo.DYNAMIC_ACTION_RULE`](objects/1302295699.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 1 |
| [`dbo.DYNAMIC_CALLING_DETAIL`](objects/1334295813.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 0 | 5 / 1 |
| [`dbo.DYNAMIC_CALLING_HEADER`](objects/1366295927.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 1 / 0 |
| [`dbo.EQUIPMENT_TYPE`](objects/1398296041.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.ESTIMATED_WORK_RATES`](objects/1430296155.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 0 / 0 |
| [`dbo.EXCHANGE_WEB_PAGE`](objects/1462296269.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 1 / 0 |
| [`dbo.EXIT_POINT`](objects/1494296383.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 1 / 1 |
| [`dbo.EXIT_POINT_CATEGORY`](objects/1526296497.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 1 / 0 |
| [`dbo.EXIT_POINT_DETAIL`](objects/1558296611.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 1 |
| [`dbo.FEATURE_MANAGEMENT`](objects/2071730483.json) | REFERENCED_IN_CAPTURED_SOURCE | 5 | 0 | 1 / 0 |
| [`dbo.FEATURE_MANAGEMENT_USER`](objects/2103730597.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 2 |
| [`dbo.FILE_PROTOCOL_PROPERTIES`](objects/1590296725.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.FILTER_ATTRIBUTES`](objects/1622296839.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.FILTER_CONFIG_DETAIL`](objects/1654296953.json) | REFERENCED_IN_CAPTURED_SOURCE | 7 | 0 | 7 / 1 |
| [`dbo.FILTER_CONFIG_HEADER`](objects/1686297067.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 3 / 0 |
| [`dbo.FILTER_GROUP_BY`](objects/1718297181.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.FILTER_ORDER_BY`](objects/1750297295.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.FILTER_STATEMENT`](objects/1782297409.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 0 |
| [`dbo.FISCAL_CALENDAR_DETAIL`](objects/1814297523.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.FISCAL_CALENDAR_HEADER`](objects/1846297637.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 2 / 0 |
| [`dbo.FORM`](objects/1878297751.json) | REFERENCED_IN_CAPTURED_SOURCE | 5 | 0 | 7 / 0 |
| [`dbo.FUNCTIONAL_AREA`](objects/1910297865.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 2 / 0 |
| [`dbo.FUNCTIONAL_AREA_STATUS_FLOW`](objects/1942297979.json) | REFERENCED_IN_CAPTURED_SOURCE | 10 | 12 | 0 / 1 |
| [`dbo.GENERIC_ADDRESS_DETAIL`](objects/1974298093.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 1 | 0 / 0 |
| [`dbo.GENERIC_ADDRESS_HEADER`](objects/2006298207.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.GENERIC_CONFIG_DETAIL`](objects/2038298321.json) | REFERENCED_IN_CAPTURED_SOURCE | 40 | 12 | 6 / 1 |
| [`dbo.GENERIC_CONFIG_HEADER`](objects/2070298435.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 1 / 0 |
| [`dbo.GENERIC_IMAGE_DATA`](objects/1890313994.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.HTTP_PROTOCOL_PROPERTIES`](objects/1959730084.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.IA_WORK_INSTRUCTION`](objects/2102298549.json) | REFERENCED_IN_CAPTURED_SOURCE | 6 | 2 | 1 / 6 |
| [`dbo.IMMEDIATE_NEEDS_REQUEST`](objects/2134298663.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 2 | 0 / 2 |
| [`dbo.IMMEDIATE_NEEDS_TRIGGER`](objects/18815129.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 1 / 0 |
| [`dbo.INBOUND_WEB_STATISTICS`](objects/50815243.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.INTERFACE_DATA_MAP_DETAIL`](objects/82815357.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 0 / 1 |
| [`dbo.INTERFACE_DATA_MAP_HEADER`](objects/114815471.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 1 / 1 |
| [`dbo.INTERFACE_DATAMAP_REQ_FIELDS`](objects/146815585.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 1 |
| [`dbo.INTERFACE_DETAIL`](objects/162815642.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 1 / 1 |
| [`dbo.INTERFACE_ERROR`](objects/194815756.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 1 | 0 / 0 |
| [`dbo.INTERFACE_FLOW_STEP`](objects/226815870.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 1 |
| [`dbo.INTERFACE_HEADER`](objects/258815984.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 1 / 0 |
| [`dbo.Interface_Item_Failure_1024`](objects/1644689057.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.INV_MGMT_WORK_DATA`](objects/290816098.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 3 |
| [`dbo.INVENTORY_ADJ_WEB_STATISTICS`](objects/322816212.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.INVENTORY_ARGUMENT`](objects/354816326.json) | REFERENCED_IN_CAPTURED_SOURCE | 8 | 0 | 0 / 0 |
| [`dbo.INVENTORY_STAGING`](objects/1180687404.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 0 |
| [`dbo.ITEM`](objects/386816440.json) | REFERENCED_IN_CAPTURED_SOURCE | 71 | 11 | 2 / 6 |
| [`dbo.ITEM_CAT_UPDATES`](objects/436352769.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.item_class_GCD_v6`](objects/1260687689.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.ITEM_CROSS_REFERENCE`](objects/418816554.json) | REFERENCED_IN_CAPTURED_SOURCE | 8 | 0 | 0 / 1 |
| [`dbo.ITEM_fy2015_prices`](objects/450816668.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.ITEM_LOCATION_ASSIGNMENT`](objects/466816725.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 1 | 0 / 2 |
| [`dbo.ITEM_LOCATION_CAPACITY`](objects/498816839.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 0 / 2 |
| [`dbo.ITEM_SUBSTITUTE`](objects/530816953.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.ITEM_TEMPLATE`](objects/562817067.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 1 / 0 |
| [`dbo.ITEM_UNIT_OF_MEASURE`](objects/594817181.json) | REFERENCED_IN_CAPTURED_SOURCE | 21 | 2 | 0 / 1 |
| [`dbo.ITEM_WEB_STATISTICS`](objects/626817295.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.LABEL_IMAGE_DATA`](objects/825874109.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 1 |
| [`dbo.LABEL_MASTER_DETAIL`](objects/658817409.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 3 |
| [`dbo.LABEL_MASTER_HEADER`](objects/690817523.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 2 / 0 |
| [`dbo.LABEL_PRINT_REQUEST`](objects/722817637.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.LABOR_GROUP`](objects/754817751.json) | REFERENCED_IN_CAPTURED_SOURCE | 6 | 0 | 2 / 0 |
| [`dbo.LABOR_MANAGEMENT_DETAIL`](objects/786817865.json) | REFERENCED_IN_CAPTURED_SOURCE | 10 | 2 | 0 / 0 |
| [`dbo.LABOR_MANAGEMENT_SUMMARY`](objects/818817979.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.LABOR_MGMT_DETAIL_CONSOLIDATION`](objects/1061839095.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 0 |
| [`dbo.LABOR_PLAN_DTL`](objects/850818093.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.LABOR_PLAN_HDR`](objects/882818207.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 2 / 0 |
| [`dbo.LARGE_TEXT`](objects/914818321.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 1 / 0 |
| [`dbo.LAUNCH_FLOW_DETAIL`](objects/946818435.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.LAUNCH_FLOW_HEADER`](objects/978818549.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 2 / 0 |
| [`dbo.LAUNCH_MASTER`](objects/1010818663.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 2 | 1 / 7 |
| [`dbo.LAUNCH_MAXIMUMS`](objects/1042818777.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 1 / 0 |
| [`dbo.LAUNCH_STATISTICS`](objects/1074818891.json) | REFERENCED_IN_CAPTURED_SOURCE | 25 | 8 | 2 / 1 |
| [`dbo.LAUNCH_SUMMARY`](objects/1106819005.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.LBR_PLN_EX_RESULT`](objects/1138819119.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 3 |
| [`dbo.LOADING_AREA_ASSIGNMENT`](objects/1170819233.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.LOCATING_REQUEST`](objects/1202819347.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 3 |
| [`dbo.LOCATING_RULE_DETAIL`](objects/1234819461.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.LOCATING_RULE_HEADER`](objects/1266819575.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 5 / 0 |
| [`dbo.LOCATION`](objects/1298819689.json) | REFERENCED_IN_CAPTURED_SOURCE | 58 | 25 | 8 / 10 |
| [`dbo.LOCATION_CONTAINER`](objects/1330819803.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 1 / 1 |
| [`dbo.LOCATION_INVENTORY`](objects/1362819917.json) | REFERENCED_IN_CAPTURED_SOURCE | 87 | 8 | 4 / 3 |
| [`dbo.LOCATION_INVENTORY_ATTRIBUTES`](objects/1394820031.json) | REFERENCED_IN_CAPTURED_SOURCE | 9 | 2 | 0 / 0 |
| [`dbo.LOCATION_TEMPLATE`](objects/1426820145.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 2 / 0 |
| [`dbo.LOCATION_TYPE`](objects/1458820259.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 2 / 0 |
| [`dbo.LOCATION_UNIT_OF_MEASURE`](objects/1490820373.json) | REFERENCED_IN_CAPTURED_SOURCE | 7 | 2 | 0 / 2 |
| [`dbo.LOOKUP_REFERENCE`](objects/1522820487.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 0 |
| [`dbo.LOT`](objects/1554820601.json) | REFERENCED_IN_CAPTURED_SOURCE | 15 | 4 | 1 / 1 |
| [`dbo.LOT_ATTRIBUTE`](objects/1586820715.json) | REFERENCED_IN_CAPTURED_SOURCE | 6 | 0 | 0 / 2 |
| [`dbo.LOT_ATTRIBUTE_TEMPLATE`](objects/1618820829.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 1 / 1 |
| [`dbo.LOT_TEMPLATE`](objects/1650820943.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 3 / 0 |
| [`dbo.MAIN_UI_SCREEN`](objects/1682821057.json) | REFERENCED_IN_CAPTURED_SOURCE | 7 | 0 | 2 / 1 |
| [`dbo.MAIN_UI_TEMP_FUN_GRP_XREF`](objects/1730821228.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 1 |
| [`dbo.MAIN_UI_TEMPLATE`](objects/1762821342.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 2 / 0 |
| [`dbo.MAIN_UI_WM_LICENSE_XREF`](objects/1794821456.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 0 / 1 |
| [`dbo.MENU_FAVORITE`](objects/1826821570.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.MOVEMENT_CLASS_ANALYSIS`](objects/1858821684.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 1 | 0 / 0 |
| [`dbo.MULTI_ORDER_PALLET`](objects/1890821798.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 4 | 1 / 1 |
| [`dbo.MULTI_SEGMENT_MAPPED_FIELDS`](objects/804510245.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 1 |
| [`dbo.NEXT_NUMBER`](objects/1922821912.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 0 |
| [`dbo.NOTIFICATION`](objects/1954822026.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 2 / 0 |
| [`dbo.NOTIFICATION_ADDRESS`](objects/1986822140.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.NOTIFICATION_MESSAGE`](objects/2018822254.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.OPERATIONAL_GOAL`](objects/2050822368.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 1 |
| [`dbo.ORDER_DETAIL`](objects/2082822482.json) | REFERENCED_IN_CAPTURED_SOURCE | 7 | 2 | 0 / 4 |
| [`dbo.ORDER_HEADER`](objects/2114822596.json) | REFERENCED_IN_CAPTURED_SOURCE | 8 | 3 | 1 / 3 |
| [`dbo.ORDER_TEMPLATE_COMMENT`](objects/2146822710.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.ORDER_TEMPLATE_HEADER`](objects/31339176.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 3 / 0 |
| [`dbo.ORDER_TEMPLATE_ITEM`](objects/63339290.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.ORDER_TEMPLATE_SHIP_TO`](objects/95339404.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.OUTBOUND_WEB_STATISTICS`](objects/127339518.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.OVERRIDE_DATA_MASTER`](objects/159339632.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.PACKING_CLASS`](objects/191339746.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 2 |
| [`dbo.PACKING_CRITERIA_DETAIL`](objects/223339860.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.PACKING_CRITERIA_HEADER`](objects/255339974.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 2 / 0 |
| [`dbo.PACKING_PREFERENCES`](objects/287340088.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 1 / 2 |
| [`dbo.PALLET_BUILDING_MASTER_DETAIL`](objects/319340202.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 4 |
| [`dbo.PALLET_BUILDING_MASTER_HEADER`](objects/351340316.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 2 / 0 |
| [`dbo.PAPERWORK_DATA_SELECTION`](objects/383340430.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 1 / 2 |
| [`dbo.PAPERWORK_MASTER`](objects/415340544.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 3 / 0 |
| [`dbo.PAPERWORK_PRINT_BREAK`](objects/447340658.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 3 |
| [`dbo.PATCH`](objects/479340772.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.PERFORMANCE_DATA`](objects/511340886.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.PERFORMANCE_MONITOR`](objects/543341000.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 1 / 0 |
| [`dbo.PERFORMANCE_MONITOR_TEMPLATE`](objects/575341114.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.PICK_LOCATION_GROUP_DETAIL`](objects/607341228.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.PICK_LOCATION_GROUP_HEADER`](objects/639341342.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 2 / 0 |
| [`dbo.PICKING_GROUP_DETAIL`](objects/671341456.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.PICKING_GROUP_HEADER`](objects/703341570.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 2 / 0 |
| [`dbo.PKCOST_TRIGGER_DETAIL`](objects/735341684.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.PKCOST_TRIGGER_HEADER`](objects/767341798.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 1 / 0 |
| [`dbo.PM_CHARTDATA`](objects/799341912.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 1 / 0 |
| [`dbo.PRE_2006_WORK_AUTHORIZATIONS`](objects/831342026.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.PRINT_DEVICES`](objects/847342083.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 2 / 0 |
| [`dbo.PRO_NUMBER`](objects/879342197.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 1 / 0 |
| [`dbo.PROCESS_HISTORY`](objects/911342311.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 1 | 0 / 0 |
| [`dbo.PURCHASE_ORDER_DETAIL`](objects/943342425.json) | REFERENCED_IN_CAPTURED_SOURCE | 17 | 8 | 0 / 1 |
| [`dbo.PURCHASE_ORDER_HEADER`](objects/975342539.json) | REFERENCED_IN_CAPTURED_SOURCE | 14 | 6 | 2 / 0 |
| [`dbo.PUTAWAY_GROUP`](objects/1007342653.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 2 | 1 / 2 |
| [`dbo.PUTAWAY_GROUP_LOCATION`](objects/1039342767.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 1 / 0 |
| [`dbo.QC_ASSIGNMENT`](objects/1071342881.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 3 / 1 |
| [`dbo.QC_ASSIGNMENT_EVAL_METHOD`](objects/1103342995.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.QUALITY_HISTORY`](objects/1135343109.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 1 | 0 / 1 |
| [`dbo.RATE_BASE_DTL`](objects/1167343223.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 1 / 1 |
| [`dbo.RATE_BASE_HDR`](objects/1199343337.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 2 / 1 |
| [`dbo.RATE_WEIGHT_BREAK_DTL`](objects/1231343451.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 1 / 1 |
| [`dbo.RATE_WEIGHT_BREAK_HDR`](objects/1263343565.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 2 / 0 |
| [`dbo.RATING_ID`](objects/1295343679.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 2 / 0 |
| [`dbo.RATING_PROFILE`](objects/1327343793.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 1 / 0 |
| [`dbo.RATING_SERVICE`](objects/1359343907.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 2 / 1 |
| [`dbo.RATING_SERVICE_ACTION`](objects/1391344021.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.RATING_SERVICE_ENDPOINT`](objects/1423344135.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.RECEIPT_CATCH_WEIGHT_INFO`](objects/1455344249.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 5 |
| [`dbo.RECEIPT_CONTAINER`](objects/1487344363.json) | REFERENCED_IN_CAPTURED_SOURCE | 31 | 6 | 3 / 8 |
| [`dbo.RECEIPT_CONTAINER_CATCH_WEIGHT_INFORMATION`](objects/948510758.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 3 |
| [`dbo.RECEIPT_CONTAINER_CHANGE_LOG`](objects/1519344477.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.RECEIPT_DETAIL`](objects/1551344591.json) | REFERENCED_IN_CAPTURED_SOURCE | 26 | 11 | 3 / 3 |
| [`dbo.RECEIPT_DETAIL_03212014`](objects/1583344705.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.RECEIPT_HEADER`](objects/1599344762.json) | REFERENCED_IN_CAPTURED_SOURCE | 43 | 11 | 5 / 4 |
| [`dbo.RECEIPT_HEADER_03212014`](objects/1631344876.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.RECEIPT_HEADER_CHANGE_LOG`](objects/1647344933.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.RECEIPT_QUALITY_HISTORY`](objects/1679345047.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 0 / 1 |
| [`dbo.RECEIVING_PREFERENCE_USER_AUTHORIZATION`](objects/1711345161.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 2 |
| [`dbo.RECEIVING_PREFERENCES`](objects/1743345275.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 2 / 0 |
| [`dbo.REPLENISHMENT_MASTER`](objects/1775345389.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 3 / 1 |
| [`dbo.REPLENISHMENT_MASTER_WAREHOUSE_ACCESS`](objects/1477840577.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 0 / 2 |
| [`dbo.REPLENISHMENT_REQUEST`](objects/1807345503.json) | REFERENCED_IN_CAPTURED_SOURCE | 9 | 1 | 0 / 3 |
| [`dbo.REPLENISHMENT_STRATEGY`](objects/1839345617.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.REPORT_CONNECTION`](objects/1871345731.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 1 |
| [`dbo.RESOURCE_FILE_BASE`](objects/1903345845.json) | REFERENCED_IN_CAPTURED_SOURCE | 6 | 1 | 0 / 0 |
| [`dbo.RESOURCE_FILE_BASE_PREUPGRADE`](objects/661837670.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.RESOURCE_FILE_CUSTOM`](objects/1935345959.json) | REFERENCED_IN_CAPTURED_SOURCE | 5 | 1 | 0 / 0 |
| [`dbo.RESOURCE_FILE_CUSTOM_PREUPGRADE`](objects/677837727.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.RFID_HISTORY`](objects/1967346073.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.RFID_READER`](objects/1999346187.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 1 / 0 |
| [`dbo.RFID_READER_PROPS`](objects/2031346301.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.ROUTING_GUIDE`](objects/2063346415.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 0 / 3 |
| [`dbo.RULE_SET_ASSIGNMENT`](objects/2095346529.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 0 / 2 |
| [`dbo.SCAN_AND_WEIGH_REQUESTS`](objects/2127346643.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.SCHEDULED_JOBS`](objects/11863109.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 1 |
| [`dbo.SCREEN_CONTROL`](objects/43863223.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 0 | 3 / 2 |
| [`dbo.SCREEN_CONTROL_ATTRIBUTES`](objects/75863337.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 0 / 1 |
| [`dbo.SCREEN_CONTROL_EVENT`](objects/107863451.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 1 / 1 |
| [`dbo.SCREEN_CONTROL_EVENT_PARAMETERS`](objects/139863565.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 1 |
| [`dbo.SCREEN_CONTROL_GRID_COLUMNS`](objects/171863679.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 1 |
| [`dbo.SCREEN_GROUP`](objects/203863793.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 3 / 2 |
| [`dbo.SCREEN_GROUP_COLUMN`](objects/235863907.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 1 / 1 |
| [`dbo.SCREEN_PART`](objects/267864021.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 2 / 1 |
| [`dbo.SCREEN_PART_SEARCH`](objects/299864135.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 1 |
| [`dbo.ScriptHash`](objects/331864249.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.SECURITY`](objects/363864363.json) | REFERENCED_IN_CAPTURED_SOURCE | 7 | 0 | 0 / 2 |
| [`dbo.SECURITY_CHECKPOINT`](objects/395864477.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 0 | 0 / 1 |
| [`dbo.SECURITY_GROUP`](objects/427864591.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 2 / 0 |
| [`dbo.SERIAL_NUM_TEMPLATE`](objects/459864705.json) | REFERENCED_IN_CAPTURED_SOURCE | 14 | 0 | 1 / 0 |
| [`dbo.SERIAL_NUMBER`](objects/491864819.json) | REFERENCED_IN_CAPTURED_SOURCE | 26 | 1 | 0 / 5 |
| [`dbo.SHIFT_TIME`](objects/1093839209.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 0 / 0 |
| [`dbo.SHIPMENT_ACCESSORIALS`](objects/523864933.json) | REFERENCED_IN_CAPTURED_SOURCE | 6 | 1 | 0 / 0 |
| [`dbo.SHIPMENT_ALLOC_REQUEST`](objects/555865047.json) | REFERENCED_IN_CAPTURED_SOURCE | 13 | 1 | 0 / 6 |
| [`dbo.SHIPMENT_CATCH_WEIGHT_INFO`](objects/587865161.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 5 |
| [`dbo.SHIPMENT_DETAIL`](objects/619865275.json) | REFERENCED_IN_CAPTURED_SOURCE | 84 | 12 | 4 / 6 |
| [`dbo.SHIPMENT_DETAIL_VAS_ACTIVITY`](objects/651865389.json) | REFERENCED_IN_CAPTURED_SOURCE | 6 | 2 | 0 / 2 |
| [`dbo.SHIPMENT_HEADER`](objects/683865503.json) | REFERENCED_IN_CAPTURED_SOURCE | 104 | 25 | 6 / 5 |
| [`dbo.SHIPMENT_HEADER_LOCATION`](objects/715865617.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 0 / 3 |
| [`dbo.SHIPMENT_HEADER_VAS_ACTIVITY`](objects/747865731.json) | REFERENCED_IN_CAPTURED_SOURCE | 6 | 1 | 0 / 2 |
| [`dbo.SHIPPER_CODE`](objects/779865845.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 3 / 0 |
| [`dbo.SHIPPER_CROSS_REFERENCE`](objects/811865959.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 1 | 0 / 3 |
| [`dbo.SHIPPING_ADDRESS`](objects/843866073.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 1 | 0 / 0 |
| [`dbo.SHIPPING_CALENDAR`](objects/875866187.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 1 / 0 |
| [`dbo.SHIPPING_CALENDAR_NO_SHIP_DAYS`](objects/907866301.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.SHIPPING_CONT_QC_COUNT`](objects/939866415.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 1 / 2 |
| [`dbo.SHIPPING_CONT_QC_EVALUATION`](objects/971866529.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.SHIPPING_CONT_QC_REASON_CODE`](objects/1003866643.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.SHIPPING_CONT_VAS_ACTIVITY`](objects/1035866757.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 6 | 0 / 2 |
| [`dbo.SHIPPING_CONTAINER`](objects/1067866871.json) | REFERENCED_IN_CAPTURED_SOURCE | 91 | 32 | 9 / 9 |
| [`dbo.SHIPPING_CONTAINER_CATCH_WEIGHT_INFORMATION`](objects/1028511043.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 2 | 0 / 2 |
| [`dbo.SHIPPING_CONTAINER_LOCATION`](objects/1099866985.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 0 / 3 |
| [`dbo.SHIPPING_LOAD`](objects/1131867099.json) | REFERENCED_IN_CAPTURED_SOURCE | 17 | 12 | 1 / 2 |
| [`dbo.SHIPPING_PREFERENCES`](objects/1163867213.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 1 / 2 |
| [`dbo.SLOTTING_ITEM_UP_FIELDS`](objects/1195867327.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.SLOTTING_LOC_UP_FIELDS`](objects/1227867441.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.SLOTTING_MOVES_DOWN_FIELDS`](objects/1259867555.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.SLOTTING_WAREHOUSE_UP_FIELDS`](objects/1291867669.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.SSRS_PRINTING_REQUEST`](objects/1323867783.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.Staging_Generic_Config_Dtl`](objects/1065315105.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 0 |
| [`dbo.STAGING_ILA`](objects/353540443.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 0 |
| [`dbo.Staging_ILC`](objects/1084687062.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 0 |
| [`dbo.STATISTICS_CHART`](objects/1355867897.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 1 / 2 |
| [`dbo.STATISTICS_FIELD`](objects/1387868011.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 1 / 3 |
| [`dbo.STATISTICS_GROUP`](objects/1419868125.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 2 / 1 |
| [`dbo.STATISTICS_SOURCE`](objects/1451868239.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 3 / 0 |
| [`dbo.STATISTICS_VALUE`](objects/1483868353.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 1 |
| [`dbo.STORAGE_TEMPLATE_DETAIL`](objects/1515868467.json) | REFERENCED_IN_CAPTURED_SOURCE | 5 | 0 | 0 / 1 |
| [`dbo.STORAGE_TEMPLATE_HEADER`](objects/1547868581.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 2 / 0 |
| [`dbo.STORE_LOCATION_ASSIGNMENT`](objects/1579868695.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 0 / 2 |
| [`dbo.SUMMARY_REQUESTS`](objects/1611868809.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.SYSTEM_CONFIG_DETAIL`](objects/1643868923.json) | REFERENCED_IN_CAPTURED_SOURCE | 47 | 2 | 0 / 3 |
| [`dbo.SYSTEM_CONFIG_HEADER`](objects/1675869037.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 1 / 0 |
| [`dbo.TCP_PROTOCOL_PROPERTIES`](objects/1707869151.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.TEXT_MESSAGE`](objects/1739869265.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 2 / 0 |
| [`dbo.TEXT_MESSAGE_ASSIGNMENT`](objects/1771869379.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 0 / 1 |
| [`dbo.TIME_TRACKING`](objects/1803869493.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.tmp_collist`](objects/1835869607.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.tmp_dbtables`](objects/1851869664.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.tmp_var_table_search`](objects/1867869721.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.TOTE_DETAIL`](objects/1815729571.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 3 | 0 / 1 |
| [`dbo.TOTE_HEADER`](objects/1783729457.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 3 | 1 / 0 |
| [`dbo.TRACE_FILTER`](objects/1883869778.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 0 |
| [`dbo.TRACE_INFO`](objects/1899869835.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 0 |
| [`dbo.TRAILER_YARD_STATUS`](objects/1915869892.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 4 | 1 / 0 |
| [`dbo.TRANS_HIST_ATTRIBUTES`](objects/1947870006.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 2 | 0 / 0 |
| [`dbo.TRANSACTION_HISTORY`](objects/1979870120.json) | REFERENCED_IN_CAPTURED_SOURCE | 28 | 3 | 0 / 0 |
| [`dbo.TRAV3PL_DOWNLOAD_ITEM`](objects/321540329.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.TRAV3PL_ILA`](objects/449540785.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.TRAV3PL_ILA2`](objects/513541013.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.TRAV3PL_ILC`](objects/1148687290.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.TRAV3PL_ITEM_XREF`](objects/145539702.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.TRAV3PL_IUOM`](objects/497540956.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.TRAV3PL_LI`](objects/1164687347.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.TRAV3PL_TEMP_DOWNLOAD_ITEM`](objects/305540272.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.TRAV_LANE`](objects/2011870234.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 0 / 0 |
| [`dbo.TRAV_PALLET`](objects/2027870291.json) | REFERENCED_IN_CAPTURED_SOURCE | 5 | 0 | 0 / 0 |
| [`dbo.UPLOAD_APPT_SCHEDULE`](objects/2043870348.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.UPLOAD_INVENTORY_TRANS`](objects/2075870462.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.UPLOAD_ITEM_BALANCE`](objects/2107870576.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.UPLOAD_LOCATION_INVENTORY_ATTRIBUTES`](objects/2139870690.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 0 | 0 / 0 |
| [`dbo.UPLOAD_ORDER_COMMENT`](objects/24387156.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 0 | 0 / 1 |
| [`dbo.UPLOAD_ORDER_CONTAINER`](objects/56387270.json) | REFERENCED_IN_CAPTURED_SOURCE | 7 | 1 | 0 / 0 |
| [`dbo.UPLOAD_ORDER_DETAIL`](objects/88387384.json) | REFERENCED_IN_CAPTURED_SOURCE | 8 | 1 | 0 / 0 |
| [`dbo.UPLOAD_ORDER_HEADER`](objects/120387498.json) | REFERENCED_IN_CAPTURED_SOURCE | 8 | 1 | 0 / 0 |
| [`dbo.UPLOAD_RECEIPT_CONTAINER`](objects/152387612.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.UPLOAD_RECEIPT_DETAIL`](objects/184387726.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.UPLOAD_RECEIPT_HEADER`](objects/216387840.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.UPLOAD_SERIAL_NUMBER`](objects/248387954.json) | REFERENCED_IN_CAPTURED_SOURCE | 4 | 0 | 0 / 0 |
| [`dbo.USER_ACTIVITY`](objects/280388068.json) | REFERENCED_IN_CAPTURED_SOURCE | 5 | 1 | 0 / 0 |
| [`dbo.USER_ADJSTMNT_AUTHORIZATION`](objects/312388182.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 2 |
| [`dbo.USER_LAST_ACTIVITY`](objects/1749841546.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.USER_PROFILE`](objects/344388296.json) | REFERENCED_IN_CAPTURED_SOURCE | 25 | 0 | 8 / 10 |
| [`dbo.USER_PROFILE_ACTIVITY`](objects/376388410.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.USER_SETTINGS`](objects/408388524.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 1 |
| [`dbo.VAS_ACTIVITY`](objects/440388638.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 4 | 3 / 1 |
| [`dbo.VENDOR`](objects/472388752.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 1 |
| [`dbo.VERSION`](objects/504388866.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.VIEWER_TEMPLATE`](objects/536388980.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 0 / 2 |
| [`dbo.VOCOLLECT_CONTAINERS`](objects/568389094.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.VOCOLLECT_PROFILE`](objects/600389208.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 1 / 1 |
| [`dbo.VOCOLLECT_PROFILE_FUNC_ASSIGN`](objects/632389322.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.WAREHOUSE`](objects/664389436.json) | REFERENCED_IN_CAPTURED_SOURCE | 31 | 1 | 47 / 0 |
| [`dbo.WAREHOUSE_ACCESS`](objects/696389550.json) | REFERENCED_IN_CAPTURED_SOURCE | 6 | 0 | 0 / 2 |
| [`dbo.WAREHOUSE_ALERT`](objects/728389664.json) | REFERENCED_IN_CAPTURED_SOURCE | 10 | 0 | 3 / 1 |
| [`dbo.WAREHOUSE_ALERT_ADDRESS`](objects/760389778.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.WAREHOUSE_ALERT_CRITERIA`](objects/792389892.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 2 |
| [`dbo.WAREHOUSE_ALERT_REQUEST`](objects/824390006.json) | REFERENCED_IN_CAPTURED_SOURCE | 8 | 0 | 0 / 2 |
| [`dbo.WAREHOUSE_ALERT_TYPE`](objects/856390120.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 3 / 0 |
| [`dbo.WAREHOUSE_ALERT_TYPE_CRITERIA`](objects/888390234.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 1 / 1 |
| [`dbo.WAREHOUSE_COMP_ADDR_DETAIL`](objects/920390348.json) | REFERENCED_IN_CAPTURED_SOURCE | 9 | 0 | 0 / 2 |
| [`dbo.WAREHOUSE_MOBILE_MENU`](objects/952390462.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 1 | 1 / 2 |
| [`dbo.WAVE_MASTER_AUTHORIZED_WAREHOUSES`](objects/984390576.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 1 | 0 / 1 |
| [`dbo.WAVE_PRINT_DEVICE`](objects/1016390690.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.WAVE_REPLENISHMENT_MASTER_SELECTION`](objects/1032390747.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.WEB_SCREEN_DATA_DETAIL`](objects/1064390861.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.WEB_SCREEN_DATA_HEADER`](objects/1096390975.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.WEB_USER`](objects/1128391089.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 6 / 0 |
| [`dbo.WEB_USER_COMPANY_ASSIGNMENT`](objects/1160391203.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 2 |
| [`dbo.WEB_USER_CUSTOMER_ASSIGNMENT`](objects/1192391317.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.WEB_USER_ITEM_AUTH`](objects/1224391431.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.WEB_USER_PAGE_AUTHORIZATION`](objects/1256391545.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.WEB_USER_SHIP_TO_ASSIGNMENT`](objects/1288391659.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.WEB_USER_WAREHOUSE_ASSIGNMENT`](objects/1124511385.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 2 |
| [`dbo.WORK_CREATION_MASTER`](objects/1320391773.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.WORK_INSTRUCTION`](objects/1352391887.json) | REFERENCED_IN_CAPTURED_SOURCE | 98 | 8 | 1 / 7 |
| [`dbo.WORK_ORDER_DETAIL`](objects/1384392001.json) | REFERENCED_IN_CAPTURED_SOURCE | 11 | 3 | 0 / 1 |
| [`dbo.WORK_ORDER_HEADER`](objects/1416392115.json) | REFERENCED_IN_CAPTURED_SOURCE | 7 | 4 | 3 / 0 |
| [`dbo.WORK_ORDER_PREFERENCES`](objects/1448392229.json) | REFERENCED_IN_CAPTURED_SOURCE | 0 | 0 | 1 / 0 |
| [`dbo.WORK_ORDER_PUTAWAY_UNIT`](objects/1480392343.json) | REFERENCED_IN_CAPTURED_SOURCE | 6 | 1 | 0 / 1 |
| [`dbo.WORK_ORDER_WEB_STATISTICS`](objects/1512392457.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 0 |
| [`dbo.WORK_PROFILE_DETAIL`](objects/1544392571.json) | REFERENCED_IN_CAPTURED_SOURCE | 7 | 0 | 0 / 1 |
| [`dbo.WORK_PROFILE_HEADER`](objects/1576392685.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 6 / 0 |
| [`dbo.WORK_PROFILE_USER_AUTH`](objects/1608392799.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 2 |
| [`dbo.WORK_PROFILE_WAREHOUSE_ACCESS`](objects/1640392913.json) | NO_CAPTURED_REFERENCE | 0 | 0 | 0 / 1 |
| [`dbo.WORK_PROFILE_ZONE_AUTH`](objects/1672393027.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 0 / 2 |
| [`dbo.WORK_REGROUP_ORDER`](objects/1704393141.json) | REFERENCED_IN_CAPTURED_SOURCE | 1 | 0 | 0 / 0 |
| [`dbo.WORK_SPECIAL_HANDLING`](objects/1736393255.json) | REFERENCED_IN_CAPTURED_SOURCE | 3 | 0 | 0 / 0 |
| [`dbo.WORK_TYPE`](objects/1768393369.json) | REFERENCED_IN_CAPTURED_SOURCE | 11 | 1 | 7 / 1 |
| [`dbo.ZONE`](objects/1800393483.json) | REFERENCED_IN_CAPTURED_SOURCE | 2 | 0 | 4 / 0 |

## Evidence and limits

[Exact table/module evidence, cross-source differences and input hashes](mappings/table-usage.json).

- A captured source reference establishes a static relationship, not that a module ran, a branch was reached, or a table is currently active.
- NO_CAPTURED_REFERENCE means none of the credited channels in this exact retained corpus identified the table. It does not establish that the table is unused, obsolete, a backup, safe to delete, or absent from external application SQL.
- Dynamic SQL, runtime-selected identifiers, external callers, client-generated SQL, uncaptured jobs and historical/other database code can use tables without a resolvable reference here.
- The bounded lexer recognizes named SQL relation/DML positions and local aliases/CTEs; it is not the SQL Server binder. Unqualified names assume a unique captured name, not verified caller/default-schema resolution. Unsupported or ambiguous syntax remains explicit.
- DDL, DBCC, permission statements and metadata-function arguments are not comprehensively classified by the parser. Their table relationships depend on captured catalog dependencies or reviewed effects; unmatched identifiers/string arguments remain non-credit observations.
- Identifier tokens and string-contained names are separate non-credit observations. Column names and configuration text can match table names; neither proves an executed table access.
- Foreign keys are structural relationships and never count as procedure/function usage. View paths are catalog/source paths; attached trigger paths are possibilities, not proof the event fired.
- Owner backup/leftover and item-master-failure suggestions are hypotheses. Name patterns and missing references do not validate them. No deletion recommendation is made.
- Current replica status is owner-attested. This task documents the captured source as-is and requires no application version/build or extension development.
