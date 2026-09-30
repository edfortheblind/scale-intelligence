# View read models

Snapshot `20260929T214106Z`. This batch adds 129 individually reviewed view contracts and 20 help topics with 60 authored cases. It covers every view outside the five prior view contracts and the separately owned replenishment-request view. Integrated coverage must be verified against all 135 catalog views.

[Machine-readable contracts](mappings/batches/view-read-models.json) ? [Help library](HELP_TOPICS.md)

## Material findings

- SCI_SHIPPING_CONTAINER_VIEW has four retained-branch expressions in a different ordinal order from the current branch. UNION uses positions: World Ease and logistics-unit output mappings differ for retained rows. This is a static source concern; no runtime correction was made.
- Join expansion matters: receipt appointments, immediate needs, VAS assignments, serials and work-order joins can repeat quantities. Independent MIN fields need not represent one coherent component row.
- UNION removes identical projected rows; UNION ALL retains every row. Neither establishes current-source priority, unique business identity or historical completeness.
- Presentation flags, placeholder rows and projected authorization fields do not perform or authorize the named operation. Effective settings and secrets were not queried.
- Availability, catch weight, stored totals and unit labels use different expressions. NULL arithmetic, unordered TOP 1 and row multiplicity remain explicit limits.

## Reviewed views

| View | Grain and output | Main limit |
| --- | --- | --- |
| [dbo.SHIPPING_LOAD_VIEW](sql/12579133.sql) | Load row with aggregate shipment/container/weight/volume values. | NOLOCK reads include nested shipment totals; totals are not an atomic snapshot or physical departure proof. |
| [dbo.SPLIT_SHIPMENT_VIEW](sql/28579190.sql) | One projected shipment-detail row; SPLIT_QUANTITY numeric(19,5) initialized to zero. | The zero split value is presentation data, not a stored mutation or total over every status slot. |
| [dbo.LABOR_MANAGEMENT_DETAIL_VIEW](sql/34359437.sql) | One row per matching labor/item combination; no aggregate. | Missing item preserves labor; repeated matching item rows can multiply it. Does not calculate or enforce labor performance. |
| [dbo.TRAV_MULTI_ORDER_PALLET_VIEW](sql/60579304.sql) | Parentless container with shipment; pallet may be missing. | Warehouse comes from optional pallet and can be NULL. TOP 1 has no order; child location/work-zone arms do not require non-NULL value because AND binds to the self arm. Child item aggregate uses NOLOCK. |
| [dbo.METADATA_INSIGHT_RECEIPT_VIEW](sql/66359551.sql) | Header/detail/appointment/request/container join rows; header totals repeat. | Immediate needs join has no warehouse predicate. Multiple requests, appointments or containers fan out. Scalar lookups can error on multiple matches. No receipt status filter or receiving action. |
| [dbo.VIEWER_MRO](sql/124579532.sql) | Retained shipment header/detail join rows. | No filtering or deduplication. Retained table projection does not prove physical delivery or archive payload inspection. |
| [dbo.VIEWER_PACKAGE](sql/140579589.sql) | DISTINCT full projected package/order rows. | The later INNER JOIN requires a container-parent chain. Textual parent-ID join has no warehouse predicate. Duplicate parent identifiers can multiply intermediate rows; NULL carrier uses the ELSE branch. No carrier confirmation. |
| [dbo.VIEWER_RECEIPTS](sql/156579646.sql) | One projection row per retained receipt detail. | No filter, deduplication or receiving action. Stored quantities and fixed labels do not prove physical receipt. |
| [dbo.WORK_ORDER_DETAIL_VIEW](sql/188579760.sql) | Work-order detail/header/item join rows. | Company-specific and global item matches can both survive and multiply a detail. Missing header/item excludes it. Header quantities repeat; no activity filter. |
| [dbo.YARD_LOCATION_VIEW](sql/204579817.sql) | DOCK_LOCATION row selected by fixed record-type code. | The fixed type label remains opaque; no active, warehouse or authorization predicate exists. |
| [dbo.METADATA_INSIGHT_WORK_VIEW](sql/284580102.sql) | Projection rows from WORK_INSTRUCTION_VIEW with optional type/shipment context. | Fixed text selectors remain opaque. Nested work-view semantics remain a transitive boundary; duplicate scalar location matches can error. CASE quantities are row-level expressions, not totals or executed work. |
| [dbo.METADATA_INSIGHT_DIF_INCOMING_MESSAGE](sql/292248146.sql) | Incoming message joined to its endpoint and event. | Missing endpoint/event hides the message; no enabled/status filter or execution occurs. Message-to-event and message-to-endpoint are separate joins, not endpoint/event consistency validation. |
| [dbo.SHIP_CONT_DOCK_AREA_IN_TRANSIT](sql/300580159.sql) | DISTINCT container projection with dock-area identity and state/display fields. | Inner matches can hide missing status/location mappings or multiply ambiguous ones. State flags encode this branch, not a separate inventory measurement; fixed selectors remain opaque. Duplicate full projection rows collapse. |
| [dbo.METADATA_INSIGHT_DIF_OUTGOING_MESSAGE](sql/308248203.sql) | Outgoing message by matching event and each endpoint for that event. | Multiple endpoints for one event can duplicate message rows; missing event/endpoint excludes a message. No send or retry occurs. |
| [dbo.SHIP_CONT_DOCK_AREA_ON_HAND](sql/316580216.sql) | DISTINCT container projection with dock-area identity and state/display fields. | Inner matches can hide missing status/location mappings or multiply ambiguous ones. State flags encode this branch, not a separate inventory measurement; fixed selectors remain opaque. Duplicate full projection rows collapse. |
| [dbo.SHIP_CONT_DOCK_POS_IN_TRANSIT](sql/332580273.sql) | container projection with parent dock-area identity and position ID and state/display fields. | Inner matches can hide missing status/location mappings or multiply ambiguous ones. State flags encode this branch, not a separate inventory measurement; fixed selectors remain opaque. No DISTINCT in this position/container view. |
| [dbo.SHIP_CONT_DOCK_POS_ON_HAND](sql/348580330.sql) | container projection with parent dock-area identity and position ID and state/display fields. | Inner matches can hide missing status/location mappings or multiply ambiguous ones. State flags encode this branch, not a separate inventory measurement; fixed selectors remain opaque. No DISTINCT in this position/container view. |
| [dbo.METADATA_INSIGHT_PUTWALL_LOCATION_VIEW](sql/356248374.sql) | Location/tote-detail join rows with optional parent and shipment. | No ACTIVE filter. Multiple uncleared tote details fan out; absent tote preserves location. EMPTY display is not a measured inventory-empty proof. |
| [dbo.SHIP_HEADER_DOCK_AREA_IN_TRANS](sql/364580387.sql) | DISTINCT shipment projection with dock-area identity and state/display fields. | Inner matches can hide missing status/location mappings or multiply ambiguous ones. State flags encode this branch, not a separate inventory measurement; fixed selectors remain opaque. Duplicate full projection rows collapse. |
| [dbo.SHIP_HEADER_DOCK_AREA_ON_HAND](sql/380580444.sql) | DISTINCT shipment projection with dock-area identity and state/display fields. | Inner matches can hide missing status/location mappings or multiply ambiguous ones. State flags encode this branch, not a separate inventory measurement; fixed selectors remain opaque. Duplicate full projection rows collapse. |
| [dbo.SHIP_HEADER_DOCK_POS_IN_TRANS](sql/396580501.sql) | DISTINCT shipment projection with parent dock-area identity and state/display fields. | Inner matches can hide missing status/location mappings or multiply ambiguous ones. State flags encode this branch, not a separate inventory measurement; fixed selectors remain opaque. Duplicate full projection rows collapse. |
| [dbo.SHIP_HEADER_DOCK_POS_ON_HAND](sql/412580558.sql) | DISTINCT shipment projection with parent dock-area identity and state/display fields. | Inner matches can hide missing status/location mappings or multiply ambiguous ones. State flags encode this branch, not a separate inventory measurement; fixed selectors remain opaque. Duplicate full projection rows collapse. |
| [dbo.SHIPMENT_HEADER_DOCK_AREA](sql/428580615.sql) | UNION distinct of branch projection rows. | UNION removes identical full rows, not rows sharing only entity identity. Different state-flag values can preserve two rows for the same entity/location. No order or physical movement is performed. |
| [dbo.SHIPMENT_HEADER_DOCK_POS](sql/444580672.sql) | UNION distinct of branch projection rows. | UNION removes identical full rows, not rows sharing only entity identity. Different state-flag values can preserve two rows for the same entity/location. No order or physical movement is performed. |
| [dbo.SHIPPING_CONTAINER_DOCK_AREA](sql/460580729.sql) | UNION distinct of branch projection rows. | UNION removes identical full rows, not rows sharing only entity identity. Different state-flag values can preserve two rows for the same entity/location. No order or physical movement is performed. |
| [dbo.SHIPPING_CONTAINER_DOCK_POS](sql/476580786.sql) | UNION distinct of branch projection rows. | UNION removes identical full rows, not rows sharing only entity identity. Different state-flag values can preserve two rows for the same entity/location. No order or physical movement is performed. |
| [dbo.AUDIT_LOG_VIEW](sql/492580843.sql) | One row per audit-log source row. | No filter or audit write. Decoder implementation and sensitive operational log values are separate; no immutability or successful-call guarantee. |
| [dbo.PRODUCT_RECALL_VIEW](sql/508580900.sql) | Container/header join rows across two UNION ALL inputs. | Overlapping current/retained identities can multiply across both unions. NULL threshold/status excludes rows. This read model neither initiates nor completes a recall. |
| [dbo.SHIPPED_LOT_VIEW](sql/524580957.sql) | Container/header join rows with non-NULL lot. | Empty lot text is not excluded by IS NOT NULL. Overlapping retained/current identities can multiply; missing threshold prevents matches. No physical shipment verification. |
| [dbo.METADATA_INSIGHT_SHIPPED_LOT_VIEW](sql/540581014.sql) | SHIPPED_LOT_VIEW rows with matching item metadata. | Missing item retains the lot row. Repeated matches can multiply it; nested shipped-lot union and threshold semantics remain inherited. No ACTIVE item filter. |
| [dbo.MOVEMENT_CLASS_ANALYSIS_VIEW](sql/572581128.sql) | Movement-analysis rows expanded by optional item/location and APPLY results. | Object-ID choice is global, not per row. Quantity division has no explicit zero guard. APPLY functions can multiply rows; NOLOCK permits inconsistent reads and effective conversion values were not queried. |
| [dbo.CONTAINER_TYPE_AUTHORIZED_COMPANY_VIEW](sql/816057993.sql) | DISTINCT type/description/authorization/company projection. | An absent company mapping yields NULL company. This view lists authorization metadata, not a per-user permission decision. |
| [dbo.DOCK_AREA_EMPTY_POSITION](sql/832058050.sql) | All LOCATION columns for matching position/state. | No ACTIVE or warehouse filter, and no inventory quantity test; the name alone does not prove physical emptiness. |
| [dbo.DOCK_AREA_PERCENTAGE](sql/848058107.sql) | One row per grouped staging-area identity/location/warehouse/subclass/row-count. | IS_AREA_EMPTY tests the area LOCATION_STS, not whether every child is empty. No division/percentage is computed despite the view name; missing children count zero. |
| [dbo.DOCK_AREA_POSITION](sql/864058164.sql) | Grouped location/subclass/dock type/parent with numeric state. | Transit takes precedence over on-hand. No DOCK_LOCATION_TYPE=2 filter; negative/NULL/nonpositive sums fall through and no physical emptiness is proved. |
| [dbo.DOCK_AREA_POSITIONS_CARRIER](sql/880058221.sql) | Grouped position/location/warehouse/carrier. | The container-to-location join does not constrain warehouse; same location text across warehouses can cross-associate. No status/quantity filter. |
| [dbo.DOCK_AREA_POSITIONS_LOAD](sql/896058278.sql) | Grouped position/location/warehouse/load number. | No container warehouse predicate on LOCATION text; an actual matching load is required. No physical load occupancy proof. |
| [dbo.DOCK_DOOR](sql/912058335.sql) | DISTINCT door location row per attached load, or NULL load. | Closed-or-higher load rows fail only the join, preserving the door. No warehouse-specific caller filter or appointment allocation is performed. |
| [dbo.DOCK_MGR_SHIPMENT_HEADER](sql/928058392.sql) | Shipment header row multiplied by matching status lookup rows. | Inner-equivalent joins hide missing mappings and can multiply duplicate mappings; no STATUS_FLOW_NAME predicate is used. |
| [dbo.DOCK_MGR_SHIPPING_CONTAINER](sql/944058449.sql) | Root container grouped with each child LOCATION.DOCK_LOCATION_TYPE. | Roots without direct children are excluded. A root whose children occupy different dock types can produce multiple rows, even identical derived flags. It does not inspect arbitrary descendants. |
| [dbo.DOCK_MGR_SHIPPING_LOAD](sql/960058506.sql) | Load row multiplied by matching status lookup rows. | Missing mappings hide rows; duplicate mappings can fan out. No status-flow-name or closed-state filtering. |
| [dbo.METADATA_INSIGHT_LABOR_ACTIVITY_VIEW](sql/970030787.sql) | One projection row per labor detail; no grouping. | Stored total actual time remains distinct from derived time. Numeric rounding can affect nested division; no aggregation, completion proof or labor mutation. |
| [dbo.DOCUMENT_ROUTING_VIEW](sql/976058563.sql) | Explicit projection of each DOCUMENT_ROUTING row. | No ordering, matching-priority resolution, printer dispatch or current route choice occurs. |
| [dbo.GENERIC_ADDRESS_DETAIL_VIEW](sql/992058620.sql) | One row per GENERIC_ADDRESS source row. | No ACTIVE predicate, authorization enforcement or address validation. |
| [dbo.LOT_VIEW](sql/1056058848.sql) | UNION distinct of wide lot projections with branch archive marker. | Count is rows, not distinct locations, and includes negative quantities. Retained lots use current inventory counts. Scalar description can fail on multiple matches; the fallback branch contains an unqualified warehouse reference and does not provide an explicit item-warehouse equality. Different branch markers preserve otherwise identical lot keys. |
| [dbo.METADATA_INSIGHT_CYCLE_COUNT_PLAN_VIEW](sql/1072058905.sql) | One row per cycle-count plan. | NULL arithmetic can leave total transactions NULL while percentage takes zero branch. Data types govern division and rounding. No count generation, reconciliation or validation action. |
| [dbo.METADATA_INSIGHT_CYCLE_COUNT_REQUEST_VIEW](sql/1088058962.sql) | Cycle-count request/plan inner join rows. | Missing plan excludes request; NULL selectors do not satisfy equality branches. Fixed text codes remain opaque. Flags do not establish authorization or execute either action. |
| [dbo.LOCATION_INVENTORY_ATTRIBUTES_VIEW](sql/1113875135.sql) | One row per location inventory/attribute match, preserving missing attributes. | Shared attribute records repeat for multiple inventory rows. Unreferenced attribute records are not included. No inventory movement or attribute mutation. |
| [dbo.METADATA_INSIGHT_ARCHIVE_DATA_VIEW](sql/1129875192.sql) | One row per preference matching the fixed active flag. | No configured values or paths were queried. This view neither runs archive operations nor reads archived payloads; last date is stored metadata. |
| [dbo.METADATA_INSIGHT_LOT_VIEW](sql/1136059133.sql) | UNION distinct lot rows including branch archive flag. | Count is inventory rows rather than distinct locations, includes negative balances, and uses current inventory for retained lots. Branch markers can preserve the same lot key twice; no item-description scalar lookup here. |
| [dbo.METADATA_INSIGHT_SHIPMENT_POOL_VIEW](sql/1145875249.sql) | Shipment header/detail left-join rows; header totals repeat. | The 80 alternative is already below 300. Missing detail preserves a header; multiple details repeat header totals. Fixed display labels remain opaque. This is distinct from the custom TRAV pool view. |
| [dbo.METADATA_INSIGHT_MANIFEST_VIEW](sql/1152059190.sql) | Exactly one row with seven NULL fields and GETUTCDATE() ship date. | This is not observed manifest data, counts, transmission state or a record of shipment date. |
| [dbo.METADATA_INSIGHT_SHIPMENT_VIEW](sql/1161875306.sql) | Shipment header/detail left-join rows with load and wave context. | Pool and shipment predicates use different leading/trailing fields and are not complements. Missing detail preserves header; line fanout repeats totals. Presentation flags do not confirm or release shipments. |
| [dbo.METADATA_INSIGHT_MOP_VIEW](sql/1168059247.sql) | Container with matching pallet and shipment. | No status filter. AND non-NULL tests constrain only the self arm of the OR; missing/ambiguous child location is not a consistency check. |
| [dbo.METADATA_INSIGHT_TOTE_LINE_VIEW](sql/1177875363.sql) | TOTE_DETAIL row with outer-joined header/work/container/allocation rows. | NULL sorted quantity remains NULL. Unused work/allocation joins can still affect multiplicity; a missing container produces the NULL-parent sort branch. |
| [dbo.METADATA_INSIGHT_PROCESS_HISTORY_VIEW](sql/1184059304.sql) | One row per PROCESS_HISTORY record. | Stored history messages were not queried. No process execution, retry, ordering or immutable-audit guarantee. |
| [dbo.METADATA_INSIGHT_TOTE_VIEW](sql/1193875420.sql) | Potentially one row per tote detail, not one row per tote. | Total line count repeats across detail rows; no details gives NULL total rather than0. No filter on tote condition or completion. |
| [dbo.METADATA_INSIGHT_PURCHASE_ORDER_DETAIL_VIEW](sql/1200059361.sql) | Purchase-order detail/header left-join rows. | Missing header preserves detail. Multiple related receipts have no deterministic selection rule. Status flag is display logic; no close or receive action. |
| [dbo.METADATA_INSIGHT_PURCHASE_ORDER_HEADER_VIEW](sql/1216059418.sql) | Header/detail left-join rows; header fields repeat for every line. | A header with no details remains. Flags can repeat across lines and must not be summed as unique orders. Receipt choice is unspecified among matches. |
| [dbo.METADATA_INSIGHT_PUTAWAYGROUP_VIEW](sql/1232059475.sql) | Group/location/container left-join rows. | No CLOSED filter. Multiple group containers expand group rows; missing location/container preserves group. No putaway execution. |
| [dbo.METADATA_INSIGHT_QUALITY_HISTORY_VIEW](sql/1248059532.sql) | Explicit QUALITY_HISTORY row with UI aliases. | No retention, immutability, completion or inspection accuracy follows from the projection; history rows were not queried. |
| [dbo.METADATA_INSIGHT_RECEIPT_CONTAINER_VIEW](sql/1264059589.sql) | Receipt-container rows expanded by optional header/detail/group matches. | PRE_CHECK_IN_QTY can be NULL when header is closed or SUM has no input. Scalar lookup multiplicity can error; MAX_STATUS is immediate children only. Header totals repeat per container; no receipt or group state change. |
| [dbo.METADATA_INSIGHT_RECEIPT_LINE_VIEW](sql/1280059646.sql) | Receipt detail/header/container/request join rows. | Immediate-needs join has no warehouse predicate. Multiple containers and requests multiply line rows. Indicators are not unique-line counts unless grouped intentionally; missing header preserves detail. |
| [dbo.METADATA_INSIGHT_SHIPMENT_DETAIL_VIEW](sql/1312059760.sql) | Shipment-detail rows repeated for matching VAS activities. | Missing header excludes line. Multiple VAS activities repeat quantities; no DISTINCT or aggregate. Load confirmation and release are stored/presentation values, not actions. |
| [dbo.METADATA_INSIGHT_TPM_ORDER_LINE_STATUS_VIEW](sql/1360059931.sql) | Order detail with matching order header. | Missing header excludes detail; no customer/company/warehouse authorization predicate or current-state freshness check. |
| [dbo.METADATA_INSIGHT_TPM_PURCHASE_ORDER_HEADER_VIEW](sql/1392060045.sql) | Header/detail left-join rows. | Missing detail preserves header. Multiple detail rows repeat order flags. Unlike the other insight header view, POHEADERCOMPANY is populated from header COMPANY; no receipt-selection ordering. |
| [dbo.METADATA_INSIGHT_TPM_PURCHASE_ORDER_LINE_STATUS_VIEW](sql/1408060102.sql) | Purchase-order detail/header inner-join rows. | Unlike METADATA_INSIGHT_PURCHASE_ORDER_DETAIL_VIEW, a missing header excludes detail. Multiple receipt matches have no deterministic preference; no order closure or status mutation. |
| [dbo.METADATA_INSIGHT_SHIPPING_CONTAINER_VIEW](sql/1418540187.sql) | Container/shipment join rows, optionally enriched by parent, load and launch. | NOLOCK is used on container, parent, shipment and load. Global and company-specific item matches can make scalar description fail. Fixed VAS/type/display codes remain opaque. No container status, QC, manifest or shipping action is executed. |
| [dbo.METADATA_INSIGHT_TPM_RECEIPT_HEADER_STATUS_VIEW](sql/1424060159.sql) | Receipt header/detail/purchase-order detail left-join rows. | Missing details preserve header. Header totals repeat per detail; no DISTINCT or aggregate protects against downstream double counting. No header status filter. |
| [dbo.METADATA_INSIGHT_TPM_RECEIPT_LINE_STATUS_VIEW](sql/1440060216.sql) | Receipt detail/header inner-join rows. | Missing header excludes detail. This TPM view does not join immediate needs or containers and does not derive their flags; no receiving action. |
| [dbo.METADATA_INSIGHT_USER_ACTIVITY_VIEW](sql/1456060273.sql) | User-activity row with optional generic type mapping. | Duplicate config matches can multiply activity rows. No active-user filter or session termination occurs; operational user data was not read. |
| [dbo.METADATA_INSIGHT_VAS_VIEW](sql/1472060330.sql) | VAS assignment with matching activity/container/shipment. | Missing required joins hide assignments; no work completion or QC mutation occurs and fixed display labels remain opaque. |
| [dbo.METADATA_INSIGHT_WAREHOUSE_MOBILE_MENU_VIEW](sql/1488060387.sql) | Menu row with optional immediate parent. | No ACTIVE filter or user permission enforcement; missing non-NULL parent ID gives NULL menu group, not a fallback to own name. |
| [dbo.METADATA_INSIGHT_WAVE_VIEW](sql/1504060444.sql) | One row per launch statistics record. | Individual flags and ordered WAVE_STATUS are separate expressions. NULL comparison values can suppress completed classification. Fixed labels/selectors remain opaque; no wave start, release or cancellation occurs. |
| [dbo.METADATA_INSIGHT_WORK_ORDER_DETAIL_VIEW](sql/1520060501.sql) | Work-order detail/header/instruction left-join rows. | Instruction join has no internal-number type, instruction type or condition predicate, and can fan out. COMPLETE is a quantity alias, not a completion Boolean. Missing header preserves detail. |
| [dbo.METADATA_INSIGHT_TPM_ORDER_CONTAINER_STATUS_VIEW](sql/1529980727.sql) | UNION distinct across four container-selection branches. | Different header/container order references can yield different lookup context. Scalar duplicates can error; carrier matches can fan out before UNION. Child checks are immediate only, no retained-source union appears, and tracking links do not prove delivery. |
| [dbo.METADATA_INSIGHT_WORK_ORDER_HEADER_VIEW](sql/1536060558.sql) | One group per internal work-order number. | Independent MIN fields need not describe one component row. Shipment-detail/component/instruction fanout can multiply SUM(TO_QTY); COUNT DISTINCT protects only the shipment count. COMPLETE aliases requested build quantity and NULL WHCOMPANY is a placeholder. No work-order execution. |
| [dbo.METADATA_INSIGHT_TPM_ORDER_STATUS_VIEW](sql/1545980784.sql) | One order row with optional grouped detail/container counts. | No matching aggregate leaves NULL count, not zero. Container count is roots by container INTERNAL_ORDER_NUM, not all descendants or shipment totals. NOLOCK makes counts nonauthoritative for concurrent state. |
| [dbo.METADATA_INSIGHT_WORK_ORDER_LICENSE_PLATE_VIEW](sql/1552060615.sql) | Putaway-unit/header left-join rows. | Missing header preserves unit. Header quantities repeat for each putaway unit; COMPLETE is not a completion flag. No license-plate generation or putaway action. |
| [dbo.METADATA_INSIGHT_WORLD_EASE_GROUP_VIEW](sql/1568060672.sql) | Container with optional shipment and one shipper-code scalar lookup. | Missing shipment/shipper yields NULL context; tied same-company matches have no tie-breaker. No carrier transmit or close operation occurs. |
| [dbo.METADATA_RECEIPT_QUALITY_HISTORY](sql/1584060729.sql) | Receipt-quality row per matching configured reason. | WHERE on GCD null-rejects unmatched reasons, making that relationship effectively inner. Identifier/description matches can multiply rows; missing receipt alone remains permitted. |
| [dbo.METADATA_TRANS_BUILD_WAVE_VIEW](sql/1600060786.sql) | Rows from LAUNCH_MASTER matching one fixed ACTIVE selector. | No warehouse authorization join, wave creation or release is performed. Effective ACTIVE values were not queried. |
| [dbo.METADATA_TRANS_WAVE_FLOW_VIEW](sql/1632060900.sql) | Rows from LAUNCH_FLOW_HEADER matching one fixed ACTIVE selector. | No step execution, ordering, user authorization or validation that a flow is usable. |
| [dbo.METADATA_TRANS_WAVE_MASTER_VIEW](sql/1648060957.sql) | DISTINCT full wave-master/warehouse projections. | Missing authorization rows preserve the active master with NULL warehouse. No caller/user/selected warehouse predicate is applied; projecting authorization metadata is not access enforcement. |
| [dbo.METATRANS_GetBillOfMaterialDetailsView](sql/1664061014.sql) | BOM detail with zero or more matching item definitions. | Both global and company-specific item rows can match and duplicate a component. No explicit precedence, active filter or BOM execution. |
| [dbo.MOVEMENT_CLASS_ANALYSIS_UM_VIEW](sql/1680061071.sql) | Unit-of-measure rows expanded by optional item/config matches. | Fallback is per row here, unlike the global-count choice in MOVEMENT_CLASS_ANALYSIS_VIEW. Specific and global item rows can both match; missing joins preserve unit. No conversion computation or setting update. |
| [dbo.GET_CLIENT_SSO_VIEW](sql/1684513380.sql) | UNION distinct of two system-config selections. | Second branch has no RECORD_TYPE restriction. NULL/nonmatching feature result uses ELSE record type. Same key with different values survives UNION; no precedence or login/token exchange occurs. No returned values or credentials were queried. |
| [dbo.MULTI_ORDER_PALLET_VIEW](sql/1696061128.sql) | Parentless container with matching pallet/shipment. | No status filter or deterministic choice for TOP1. Child null-value arms differ from self due to AND/OR precedence. |
| [dbo.METADATA_INSIGHT_INVENTORY_AGGREGATE_VIEW](sql/1700513437.sql) | Groups include location dimensions, inventory item/company/location/warehouse/lot/permanent and lot frozen flag. | SUM and join multiplicity affect totals. COUNT DISTINCT ignores NULL, so mixed NULL/non-NULL identifiers need not trigger multiple-value sentinel. Availability uses raw nullable arithmetic, unlike displayed coalesced buckets. No mixed-unit normalization; override flag covers only max ID. Aggregate TOTAL_WEIGHT is stored weight sum, separate from catch weight. |
| [dbo.PURCHASE_ORDER_DETAIL_VIEW](sql/1712061185.sql) | Purchase-order detail/header left-join rows. | Missing header preserves detail with NULL warehouse. No status filter, calculated totals or receipt linkage. |
| [dbo.METADATA_INSIGHT_INVENTORY_VIEW](sql/1716513494.sql) | Location/inventory/serial join rows plus optional item/lot metadata. | Serial joins repeat inventory quantities per serial. Weight unit may come from catch-weight metadata even when zero weight causes stored-weight fallback. NULL raw bucket arithmetic falls to zero availability; no unit conversion or unique inventory-row guarantee. NULL item makes ItemCompany NULL. |
| [dbo.PURCHASE_ORDER_HEADER_VIEW](sql/1728061242.sql) | One group per purchase-order header object ID. | Header without details yields zero sums/count. NULL factors are ignored by SUM. Units are not converted before summing; MAX weight unit is a label choice, not validation of homogeneous units. |
| [dbo.METADATA_INSIGHT_TRAN_HIST_VIEW](sql/1732513551.sql) | History row per matching TRANS_HIST_ATTRIBUTES row, or preserved NULL extension. | Attribute rows are not pivoted or aggregated: separate weight/unit/serial attributes stay on separate output rows and unrelated types still expand history. Invalid numeric catch weight becomes NULL; serial join implicit conversion or duplicate matches can still fail/multiply. |
| [dbo.RECEIPT_CONTAINER_VIEW](sql/1744061299.sql) | UNION distinct over current and deleted receipt-container fields. | Deleted branch does not look up a deleted parent. Missing parent gives NULL; repeated parent scalar matches can error. UNION removes identical full rows, not duplicate IDs; no deleted/current provenance flag or restore action. |
| [dbo.METADATA_TRANS_MANUAL_REPLENISHMENT_VIEW](sql/1748513608.sql) | Master/warehouse-access left-join rows. | Authorization condition is in ON and does not filter out a master; NULL or excluded authorization yields NULL joined access. No requested warehouse/user predicate and no replenishment execution. |
| [dbo.RECEIPT_HEADER_VIEW](sql/1760061356.sql) | Receipt header row per matching appointment. | COUNT DISTINCT ignores NULL. No purchase order yields NULL; multiple appointments repeat header totals. Inner grouped sources use NOLOCK. Does not choose one appointment or allocate a dock. |
| [dbo.TRAV_METADATA_INSIGHT_SHIPMENT_POOL_VIEW](sql/1762209428.sql) | Shipment-detail joined row; header totals repeat on each line. | Customer weight is summed after line expansion and can repeat header weight per line; partition omits warehouse/company. No query result order or guaranteed one row per shipment. |
| [dbo.RESOURCE_FILE_BASE_CUSTOM_VIEW](sql/1764513665.sql) | FULL OUTER JOIN row by resource key/group/language. | No custom-wins text expression. NULL join keys do not match, and duplicate identities can multiply pairs. |
| [dbo.sci_receipt_container_view](sql/1776061413.sql) | SELECT * UNION ALL across RECEIPT_CONTAINER and AR_RECEIPT_CONTAINER. | No source flag, duplicate removal or current-source precedence; compatible source schemas are required. No receiving or archive movement. |
| [dbo.STANDALONE_SERVICE_PROPERTIES_VIEW](sql/1780513722.sql) | One scalar row containing selected warehouse and service configuration fields. | Missing scalar config yields NULL; duplicate scalar matches can error. This definition was read only; no returned credential/config values were queried or published. Feature/caller binding and access controls remain external. |
| [dbo.sci_receipt_detail_view](sql/1792061470.sql) | SELECT * UNION ALL across RECEIPT_DETAIL and AR_RECEIPT_DETAIL. | Duplicate identities remain. SELECT * relies on compatible source schemas and does not establish complete retained history or current receipt state. |
| [dbo.TRANSACTION_HISTORY_INVENTORY_ATTRIBUTE_VIEW](sql/1796513779.sql) | Transaction-history rows joined to current/retained attribute projections. | MAX chooses among duplicate attribute values rather than detecting conflicts; values are text before weight conversion. Same attribute ID with differing current/retained fields survives UNION and can multiply history. Invalid weight becomes NULL; implicit ID conversion remains separate. |
| [dbo.TRAV_METADATA_INSIGHT_SHIPPING_CONTAINER_VIEW](sql/1804793737.sql) | Container with matching shipment and optional parent/load/wave. | NOLOCK on core joins. Item scalar can fail when global and specific item records both match. No status filter or warehouse/company authorization predicate; joins/subqueries can alter grain. |
| [dbo.sci_receipt_header_view](sql/1808061527.sql) | SELECT * UNION ALL across RECEIPT_HEADER and AR_RECEIPT_HEADER. | No deduplication, provenance flag or current-over-retained preference. Header presence does not prove receiving completion; source-schema compatibility is required. |
| [dbo.SCI_SHIPMENT_DETAIL_VIEW](sql/1824061584.sql) | UNION distinct over explicit shipment-detail projections. | Identical full projection rows collapse; differing rows with same ID survive. The NULL slot is not observed business data. No source provenance, status filter, unit conversion or shipment mutation. |
| [dbo.SCI_SHIPMENT_HEADER_VIEW](sql/1840061641.sql) | UNION distinct over explicit shipment-header projections. | No branch marker or current-source precedence. Duplicate elimination uses every selected field, not just shipment identity. Stored dates and status values do not prove current operational acceptance. |
| [dbo.SCI_SHIPPING_CONTAINER_VIEW](sql/1856061698.sql) | UNION distinct of explicit current/retained container projections. | UNION aligns by position: retained logistics-unit values populate World Ease output fields and retained World Ease values populate logistics-unit fields, subject to engine type conversion. This is a static definition concern, not a reproduced runtime incident. No provenance flag, deduplication by ID or source preference. |
| [dbo.sci_shipping_load_view](sql/1872061755.sql) | SELECT * UNION ALL of SHIPPING_LOAD and AR_SHIPPING_LOAD. | No source provenance flag, deduplication, current-over-retained precedence or movement occurs. SELECT * depends on compatible source schemas. |
| [dbo.TRAV_METADATA_INSIGHT_MOP_VIEW](sql/1881318012.sql) | Parentless container with matching pallet/shipment. | No status filter. Same child/self OR precedence and nondeterministic TOP1 behavior as the base MOP Insight. |
| [dbo.sci_transaction_history_view](sql/1888061812.sql) | SELECT * UNION ALL of TRANSACTION_HISTORY and AR_TRANSACTION_HISTORY. | No source flag or deduplication; record presence is not immutable/comprehensive history or whole-process timing. |
| [dbo.sci_work_instruction_view](sql/1904061869.sql) | SELECT * UNION ALL across WORK_INSTRUCTION, IA_WORK_INSTRUCTION, AR_WORK_INSTRUCTION and AR_IA_WORK_INSTRUCTION. | No source flag, filtering, deduplication or precedence; an instruction appearing in multiple tables appears multiple times. |
| [dbo.SERIAL_NUMBER_VIEW](sql/1920061926.sql) | SELECT * UNION ALL from SERIAL_NUMBER and AR_SERIAL_NUMBER. | No explicit NOLOCK in this body; caller isolation and source schema compatibility apply. No archive movement or unique serial guarantee. |
| [dbo.Shipment_Detail_VAS_Activity_Grid_View](sql/1936061983.sql) | DISTINCT detail-assignment/activity projection. | The nested container set is selected at shipment level, not restricted to this shipment line. Completion is a derived numeric display value, not an action; scalar detail-to-shipment lookup cardinality is required. |
| [dbo.SHIPMENT_DETAIL_VIEW](sql/1952062040.sql) | Explicit projection UNION distinct across SHIPMENT_DETAIL and AR_SHIPMENT_DETAIL. | Duplicates collapse over projected fields only; no current/retained provenance or source preference. |
| [dbo.SHIPMENT_HEADER_IN_TRANSIT](sql/1968062097.sql) | DISTINCT shipment/location/warehouse rows from two UNION branches. | The second branch lacks the first status threshold and does not check work TO_WHS against shipment warehouse; linked LOCATION branch also lacks warehouse equality. |
| [dbo.SHIPMENT_HEADER_ON_HAND](sql/1984062154.sql) | DISTINCT shipment/location/header-warehouse rows. | No positive inventory quantity, status, leaf hierarchy or container-warehouse predicate; the alias leaf is not a leaf test. |
| [dbo.SHIPMENT_HEADER_ORDER_VIEW](sql/2000062211.sql) | One row per CUSTOMER_PO, INTERNAL_ORDER_NUM and INTERNAL_SHIPMENT_NUM group. | MAX can conceal differing values within a group; derived state is not unanimous per-detail proof and has no application permission check. |
| [dbo.Shipment_Header_VAS_Activity_Grid_View](sql/2016062268.sql) | DISTINCT header-assignment/activity projection. | No matching assignment yields0; ELSE MIN can be NULL. Confirmation does not mutate assignment or prove operational completion beyond stored flags. |
| [dbo.SHIPMENT_HEADER_VIEW](sql/2032062325.sql) | Shipment header with independently grouped detail and parentless-container aggregates. | NOLOCK across all three sources. Root definition is only PARENT IS NULL, not an identifier/status/item filter. No conversion normalizes mixed units; computed view totals can differ from stored header columns. |
| [dbo.SHIPMENT_HEADER_VIEW_SIMPLE](sql/2048062382.sql) | Selected header columns UNION distinct across current and AR tables. | Deduplicate full projected rows; no source priority or freshness/status filter. |
| [dbo.SHIPPING_CONTAINER_IN_TRANSIT](sql/2064062439.sql) | DISTINCT container-or-tree-unit/location/warehouse rows from UNION branches. | Status threshold applies only to first branch. NULL TREE_UNIT comparison falls to own ID. The two branches use different identity normalization and can both return rows. |
| [dbo.SHIPPING_CONTAINER_ON_HAND](sql/2080062496.sql) | DISTINCT normalized container ID/location/warehouse. | No positive quantity or status test; NULL TREE_UNIT falls to own ID. View reports stored location, not physical inventory verification. |
| [dbo.INVENTORY_BALANCE_VIEW](sql/2082314678.sql) | One group per raw warehouse/item/company/quantity-unit/inventory-status tuple. | Negative quantities qualify. Individual bucket SUM can remain NULL. Grouping uses raw company/unit before display fallback, so different groups can appear with the same labels. Unused location join can multiply rows if its key is ambiguous; no inventory adjustment. |
| [dbo.SHIPPING_CONTAINER_ORDER_VIEW](sql/2096062553.sql) | Group by derived container/parent identity, item/company/lot/location/unit/wave/warehouse/shipment/order. | Missing parent/tree can yield NULL display identity; no unit conversion, status filter or duplicate-source correction. NULL-only quantities sum to NULL. |
| [dbo.ITEM_ORDER_QUANTITY_VIEW](sql/2098314735.sql) | One group per detail item, raw company, quantity unit and warehouse. | NULL trailing status excludes row. TOTAL_ORDERED_QUANTITY is total detail quantity, not unallocated or remaining quantity; different units are separate groups. No order, reservation or inventory mutation. |
| [dbo.Shipping_Container_VAS_Activity_Grid_View](sql/2112062610.sql) | DISTINCT container-assignment/activity projection. | NULL completion takes ELSE1; this displayed confirmation does not enforce a completion operation. |
| [dbo.METADATA_INSIGHT_DOCUMENT_MANAGEMENT_VIEW](sql/2114314792.sql) | DOCUMENT_MANAGEMENT row plus fixed icon and FILE_NAME. | No document open or retrieval occurs. A non-NULL source lacking the selected separator gives length -1 and can fail SUBSTRING; NULL source propagates NULL. |
| [dbo.SHIPPING_CONTAINER_VIEW](sql/2128062667.sql) | Explicit projection UNION distinct across current and AR shipping containers. | Rows identical on projected columns collapse; no source precedence, archive movement or freshness check. |
| [dbo.SHIPPING_LOAD_SHIPPING_ADDRESS_VIEW](sql/2144062724.sql) | Load per matching SHIPPING_ADDRESS row, or one NULL-address row. | Multiple address rows repeat load totals. NOLOCK on load and nested summary sources; no address-record-type filter or preferred-address selection. |

## Understanding DIF message view row counts

Incoming messages require their endpoint and event. Outgoing messages join an event to every endpoint associated with that event, so multiple endpoints can repeat a message. Neither view sends or retries a message.

1. Check the distinct incoming versus outgoing endpoint join keys.
2. Count unique message identities deliberately and inspect missing required joins.

Evidence: [dbo.METADATA_INSIGHT_DIF_INCOMING_MESSAGE](sql/292248146.sql), [dbo.METADATA_INSIGHT_DIF_OUTGOING_MESSAGE](sql/308248203.sql).

## Understanding current and retained view combinations

UNION ALL views preserve duplicate rows across current and retained sources. UNION views remove identical full projected rows, while different values for the same identifier can remain. These views provide no current-source preference.

1. Identify UNION versus UNION ALL and the exact selected fields.
2. Use explicit provenance and identity rules in the consuming analysis; no such priority is supplied here.

Evidence: [dbo.sci_shipping_load_view](sql/1872061755.sql), [dbo.sci_transaction_history_view](sql/1888061812.sql), [dbo.sci_work_instruction_view](sql/1904061869.sql), [dbo.SERIAL_NUMBER_VIEW](sql/1920061926.sql), [dbo.sci_receipt_container_view](sql/1776061413.sql), [dbo.sci_receipt_detail_view](sql/1792061470.sql), [dbo.sci_receipt_header_view](sql/1808061527.sql), [dbo.SCI_SHIPMENT_DETAIL_VIEW](sql/1824061584.sql), [dbo.SCI_SHIPMENT_HEADER_VIEW](sql/1840061641.sql), [dbo.SHIPPING_CONTAINER_VIEW](sql/2128062667.sql).

## Understanding SCI container positional mapping

The captured SCI_SHIPPING_CONTAINER_VIEW uses different ordering for four columns in its two UNION branches. The retained branch places logistics-unit fields in the current branch World Ease output positions and World Ease fields in logistics-unit positions. This is a static source concern requiring separate runtime and change review.

1. Compare both explicit projections by ordinal position, not matching column name.
2. Preserve the finding without treating this documentation as an executed SQL correction.

Evidence: [dbo.SCI_SHIPPING_CONTAINER_VIEW](sql/1856061698.sql).

## Understanding shipment and load calculated totals

SHIPMENT_HEADER_VIEW calculates detail totals and parentless-container totals separately. Weight, volume and value use a positive manually entered value only with zero root containers, otherwise a root-container sum when roots exist, otherwise detail sums. Load views aggregate these computed rows; address joins may repeat load totals.

1. Check root-container presence and positive manual-value conditions for each measure.
2. Account for load-address multiplicity before further summing the returned totals.

Evidence: [dbo.SHIPMENT_HEADER_VIEW](sql/2032062325.sql), [dbo.SHIPPING_LOAD_VIEW](sql/12579133.sql), [dbo.SHIPPING_LOAD_SHIPPING_ADDRESS_VIEW](sql/2144062724.sql).

## Understanding work-order summary quantities

The summary independently takes MIN of many component fields while grouping by work order. Components, shipment details and instructions join before SUM(TO_QTY), so fanout can multiply that sum. COUNT DISTINCT protects the dependent shipment count only; COMPLETE is an alias of requested build quantity.

1. Distinguish independent MIN fields, COUNT DISTINCT and SUM behavior.
2. Treat COMPLETE as its source quantity and inspect instruction joins that lack type predicates.

Evidence: [dbo.METADATA_INSIGHT_WORK_ORDER_DETAIL_VIEW](sql/1520060501.sql), [dbo.METADATA_INSIGHT_WORK_ORDER_HEADER_VIEW](sql/1536060558.sql), [dbo.METADATA_INSIGHT_WORK_ORDER_LICENSE_PLATE_VIEW](sql/1552060615.sql).

## Understanding inventory detail and aggregate grain

Detailed inventory joins serial numbers, which can repeat inventory quantities. The aggregate view groups location, item, company, lot, permanent state and location dimensions, uses MIN/sentinels for other fields, and counts distinct logistics units. Availability uses raw nullable quantity arithmetic and clamps negative or nonmatching comparisons to zero.

1. Choose the intended inventory key and account for serial expansion before summing.
2. Check raw arithmetic, NULL behavior, mixed units and the aggregate override test that uses only MAX inventory ID.

Evidence: [dbo.METADATA_INSIGHT_INVENTORY_AGGREGATE_VIEW](sql/1700513437.sql), [dbo.METADATA_INSIGHT_INVENTORY_VIEW](sql/1716513494.sql).

## Understanding catch weight and transaction attribute grain

METADATA_INSIGHT_TRAN_HIST_VIEW applies each linked attribute row separately, with CASE values and no pivot. TRANSACTION_HISTORY_INVENTORY_ATTRIBUTE_VIEW instead aggregates selected attribute types with MAX. In detailed inventory, a nonzero combined catch weight replaces stored total weight, while the weight-unit choice is evaluated separately.

1. Distinguish row-per-attribute APPLY from MAX-based attribute aggregation.
2. Check TRY_CAST outcomes and independent catch-weight versus weight-unit fallback.

Evidence: [dbo.METADATA_INSIGHT_TRAN_HIST_VIEW](sql/1732513551.sql), [dbo.TRANSACTION_HISTORY_INVENTORY_ATTRIBUTE_VIEW](sql/1796513779.sql), [dbo.METADATA_INSIGHT_INVENTORY_VIEW](sql/1716513494.sql).

## Understanding dock occupancy display states

Dock views use selected location statuses, fixed class/subclass filters or summed inventory buckets. One quantity view prioritizes positive transit over positive on-hand quantity; nonpositive or NULL sums fall through. The staging-area empty flag tests the area status, not whether every child is empty.

1. Read the exact status/quantity rule used by the selected view.
2. Distinguish child-position counts from area status and root-container grouping by child dock type.

Evidence: [dbo.DOCK_AREA_EMPTY_POSITION](sql/832058050.sql), [dbo.DOCK_AREA_PERCENTAGE](sql/848058107.sql), [dbo.DOCK_AREA_POSITION](sql/864058164.sql), [dbo.DOCK_DOOR](sql/912058335.sql), [dbo.DOCK_MGR_SHIPPING_CONTAINER](sql/944058449.sql).

## Understanding warehouse boundaries in location views

Some dock-position views join container LOCATION to LOCATION text without a warehouse predicate. Shipment transit-location branches also differ in warehouse and status checks. Other container transit-location joins explicitly include warehouse. The exact view and branch matter.

1. Compare LOCATION text plus warehouse predicates in each branch.
2. Do not transfer a status threshold or warehouse condition from one UNION branch to another.

Evidence: [dbo.DOCK_AREA_POSITIONS_CARRIER](sql/880058221.sql), [dbo.DOCK_AREA_POSITIONS_LOAD](sql/896058278.sql), [dbo.SHIPMENT_HEADER_IN_TRANSIT](sql/1968062097.sql), [dbo.SHIPMENT_HEADER_ON_HAND](sql/1984062154.sql), [dbo.SHIPPING_CONTAINER_IN_TRANSIT](sql/2064062439.sql), [dbo.SHIPPING_CONTAINER_ON_HAND](sql/2080062496.sql).

## Understanding multi-order pallet location choices

MOP views use unordered TOP 1 selections for child/self location and work zone. AND conditions bind only to the self arm in those OR expressions, so child rows may satisfy an arm even with NULL values. Some views require a pallet, while one reads warehouse from an optional pallet join.

1. Check parentless/container status and required versus optional pallet joins.
2. Inspect TOP 1 ordering and OR/AND grouping before assuming a unique non-NULL location.

Evidence: [dbo.TRAV_MULTI_ORDER_PALLET_VIEW](sql/60579304.sql), [dbo.METADATA_INSIGHT_MOP_VIEW](sql/1168059247.sql), [dbo.MULTI_ORDER_PALLET_VIEW](sql/1696061128.sql), [dbo.TRAV_METADATA_INSIGHT_MOP_VIEW](sql/1881318012.sql).

## Understanding placeholder and display-only view fields

The manifest presentation view returns one row of NULL placeholders plus current UTC time without reading a manifest table. The split view initializes a numeric split quantity to zero. Wave and cycle-count CASE flags classify stored fields; selecting these views does not execute their named operations.

1. Distinguish literal/NULL/time expressions from stored business values.
2. Read ordered CASE precedence without interpreting display flags as action authorization.

Evidence: [dbo.METADATA_INSIGHT_MANIFEST_VIEW](sql/1152059190.sql), [dbo.SPLIT_SHIPMENT_VIEW](sql/28579190.sql), [dbo.METADATA_INSIGHT_WAVE_VIEW](sql/1504060444.sql), [dbo.METADATA_INSIGHT_CYCLE_COUNT_REQUEST_VIEW](sql/1088058962.sql).

## Understanding authorization metadata in selection views

Container-type, wave-master, manual replenishment and menu views expose authorization metadata. Their bodies do not bind a caller identity to a selected warehouse/company. LEFT JOIN conditions can preserve a master with NULL authorization rows; some views also expose inactive definitions.

1. Separate projected authorization fields from WHERE predicates enforcing a caller scope.
2. Account for unmatched LEFT JOIN authorization rows and per-view ACTIVE filters.

Evidence: [dbo.CONTAINER_TYPE_AUTHORIZED_COMPANY_VIEW](sql/816057993.sql), [dbo.METADATA_TRANS_WAVE_MASTER_VIEW](sql/1648060957.sql), [dbo.METADATA_TRANS_MANUAL_REPLENISHMENT_VIEW](sql/1748513608.sql), [dbo.METADATA_INSIGHT_WAREHOUSE_MOBILE_MENU_VIEW](sql/1488060387.sql).

## Understanding service configuration and resource projections

The SSO view unions feature-selected record-type rows with a fixed-key lookup lacking a record-type restriction. A standalone service view uses scalar configuration lookups and unordered TOP 1 active warehouse. The resource view exposes BASE_TEXT and CUSTOM_TEXT separately, without choosing the effective override. No returned configuration or credential values were queried.

1. Compare scalar cardinality, feature selection and the second SSO branch scope.
2. Keep source structure separate from actual settings, login success and effective text resolution.

Evidence: [dbo.GET_CLIENT_SSO_VIEW](sql/1684513380.sql), [dbo.STANDALONE_SERVICE_PROPERTIES_VIEW](sql/1780513722.sql), [dbo.RESOURCE_FILE_BASE_CUSTOM_VIEW](sql/1764513665.sql).

## Understanding purchase-order detail, header and TPM views

Insight header views expand headers by detail and repeat open/closed flags. Their receipt lookup is TOP 1 without ordering. TPM line status requires a header through INNER JOIN, whereas the non-TPM detail insight uses LEFT JOIN. The base header aggregate groups by header ID and calculates detail sums without unit normalization.

1. Identify header expansion versus header aggregation and INNER versus LEFT joins.
2. Check unordered receipt selection, repeated flags and weight-unit interpretation.

Evidence: [dbo.METADATA_INSIGHT_PURCHASE_ORDER_DETAIL_VIEW](sql/1200059361.sql), [dbo.METADATA_INSIGHT_PURCHASE_ORDER_HEADER_VIEW](sql/1216059418.sql), [dbo.METADATA_INSIGHT_TPM_PURCHASE_ORDER_HEADER_VIEW](sql/1392060045.sql), [dbo.METADATA_INSIGHT_TPM_PURCHASE_ORDER_LINE_STATUS_VIEW](sql/1408060102.sql), [dbo.PURCHASE_ORDER_HEADER_VIEW](sql/1728061242.sql).

## Understanding receipt detail and appointment fanout

Receipt insight combines lines, appointments, containers and unfulfilled immediate-needs requests. Multiple matches can multiply rows; immediate needs are joined by item/company without warehouse. Receipt header view also repeats headers per appointment. Container pre-check-in quantity uses open receipt sums minus status-100 container quantities and may be NULL.

1. Choose a header, line, container or appointment grain explicitly before aggregation.
2. Check missing scalar matches, open-header conditions and the immediate-needs join scope.

Evidence: [dbo.METADATA_INSIGHT_RECEIPT_VIEW](sql/66359551.sql), [dbo.METADATA_INSIGHT_RECEIPT_CONTAINER_VIEW](sql/1264059589.sql), [dbo.METADATA_INSIGHT_RECEIPT_LINE_VIEW](sql/1280059646.sql), [dbo.RECEIPT_HEADER_VIEW](sql/1760061356.sql).

## Understanding shipment pool and shipment insight boundaries

The standard pool filters leading status below 300, with a redundant status-80 alternative. Shipment insight uses trailing status at least 300 or leading status at least 300 with trailing 80. These are different predicates, not complements. Line expansion repeats header totals; the custom TRAV pool additionally sums header weight after line expansion by customer.

1. Compare leading and trailing status fields rather than relying on view names.
2. Account for detail/VAS expansion and the custom customer window sum before aggregating.

Evidence: [dbo.METADATA_INSIGHT_SHIPMENT_POOL_VIEW](sql/1145875249.sql), [dbo.METADATA_INSIGHT_SHIPMENT_VIEW](sql/1161875306.sql), [dbo.TRAV_METADATA_INSIGHT_SHIPMENT_POOL_VIEW](sql/1762209428.sql), [dbo.METADATA_INSIGHT_SHIPMENT_DETAIL_VIEW](sql/1312059760.sql).

## Understanding lot counts and shipped-lot scope

Lot views count matching LOCATION_INVENTORY rows with any nonzero quantity bucket, including negative values, rather than DISTINCT locations. Retained lots use current inventory for the count. Recall and shipped-lot views combine current and retained containers/headers with UNION ALL and apply a status-function threshold; shipped lots additionally require non-NULL LOT.

1. Distinguish row count from distinct location count and current inventory from retained lot metadata.
2. Inspect UNION ALL overlap, strict threshold comparison and non-NULL lot filtering.

Evidence: [dbo.LOT_VIEW](sql/1056058848.sql), [dbo.METADATA_INSIGHT_LOT_VIEW](sql/1136059133.sql), [dbo.PRODUCT_RECALL_VIEW](sql/508580900.sql), [dbo.SHIPPED_LOT_VIEW](sql/524580957.sql), [dbo.METADATA_INSIGHT_SHIPPED_LOT_VIEW](sql/540581014.sql).

## Understanding VAS confirmation and QC context

The container VAS view maps one negative completion value to zero and every other value, including NULL, to one. Shipment-level and line-level views derive MIN-based confirmation over selected containers with different empty-result handling. QC history joins may exclude rows through a reason-type filter after a LEFT JOIN. None of these selections completes VAS or QC.

1. Read each CASE, MIN and empty-set fallback separately.
2. Check whether WHERE predicates null-reject rows from an apparent LEFT JOIN.

Evidence: [dbo.Shipping_Container_VAS_Activity_Grid_View](sql/2112062610.sql), [dbo.Shipment_Detail_VAS_Activity_Grid_View](sql/1936061983.sql), [dbo.Shipment_Header_VAS_Activity_Grid_View](sql/2016062268.sql), [dbo.METADATA_RECEIPT_QUALITY_HISTORY](sql/1584060729.sql), [dbo.METADATA_INSIGHT_VAS_VIEW](sql/1472060330.sql).

## Understanding ordered quantity and balance aggregates

It sums total shipment-detail quantity for headers with trailing status below 900, grouped by item, raw company, unit and warehouse. Inventory balance separately sums selected nonzero inventory buckets where location-class configuration qualifies. Display company/unit fallbacks do not change the raw GROUP BY keys.

1. Identify total quantity versus remaining/available demand and the header threshold.
2. Preserve unit/status grouping and distinguish NULL absent aggregates from zero.

Evidence: [dbo.ITEM_ORDER_QUANTITY_VIEW](sql/2098314735.sql), [dbo.INVENTORY_BALANCE_VIEW](sql/2082314678.sql), [dbo.METADATA_INSIGHT_TPM_ORDER_STATUS_VIEW](sql/1545980784.sql).

## Understanding managed-document file-name extraction

The document-management view projects metadata and derives a file name through reverse, substring and a selected path separator. It does not open or retrieve the document. A non-NULL source without the selected separator can yield a negative substring length; NULL source propagates NULL.

1. Treat stored source/path text as metadata; actual file access is outside the view.
2. Check NULL and missing-separator behavior in the expression.

Evidence: [dbo.METADATA_INSIGHT_DOCUMENT_MANAGEMENT_VIEW](sql/2114314792.sql).

## Verification and completion limits

Every credited view has a manually authored semantic note, complete-body source span, reading-copy hash and original-definition fingerprint. Private verification compares original structure to the redacted reading copy and checks safe control/fallback invariants without publishing raw SQL, comments or opaque literals.

The batch has no dynamic-SQL candidates or unresolved catalog dependencies. Its 20 topics and 60 cases require coordinator integration and application evaluation. All 129 contracts are SELECT-only source explanations; no view, function, process or external interface was executed. Complete view-body coverage remains separate from transitive behavior, production acceptance and the remaining non-view module backlog.
