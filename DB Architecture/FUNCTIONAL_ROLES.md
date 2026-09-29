# Reviewed database functional roles

This catalog reviews **35 of 1,656 eligible objects (2.11%)** in snapshot `20260929T214106Z`: 21 tables, eight procedures, two functions, two triggers and two views. The other **1,621 eligible objects remain unreviewed**. Constraints, standalone defaults and the sequence account for the 1,366 objects outside this denominator. The complete structural inventory contains 3,022 objects.

A business domain identifies the warehouse activity an object supports. A functional role identifies its responsibility: shipping state, a shipping read model and a shipping mutation routine have different roles in the same domain. Objects can have several roles. Existing name-derived domain labels remain candidates.

Assignments use specific columns and implementation statements. They do not mark whole routines semantically complete or establish active configuration, activity or permissions. Exact SHA-256 values and inclusive evidence line spans are in the [machine-readable catalog](mappings/functional-roles.json). Bounded independent static evidence review passed. Owner acceptance and operational validation remain separate. Configuration observations are reported separately in [Configuration validation](CONFIGURATION_VALIDATION.md).

## Role vocabulary

| Role | Meaning |
| --- | --- |
| `transactional_state` | Stores mutable business-operation quantities, statuses or execution bookkeeping. |
| `configuration` | Stores parameters, definitions or rules that can govern behavior; values and activation were not inspected. |
| `master_reference` | Stores reusable identities and descriptive attributes referenced across operations. |
| `execution_worklist` | Represents warehouse instruction ordering, assignment and execution state; not the generic vendor process queue. |
| `reporting_read_model` | Projects or aggregates stored data for reading; does not imply materialization or measured workload. |
| `presentation_metadata` | Stores screen/control definitions, binding properties and display settings. |
| `presentation_adapter` | Builds result shapes or selections consumed by a user interface or print-selection flow. |
| `orchestration` | Coordinates conditional database calls or multiple implementation steps; caller transactions remain separate. |
| `transactional_mutation` | Contains explicit persistent INSERT, UPDATE or DELETE behavior affecting operational state. |
| `integration_staging` | Stores interface-shaped payloads and processing indicators; direction, transport and delivery need additional evidence. |
| `audit_history` | Stores events, changes or errors; completeness, retention and immutability are not established. |
| `workflow_selection` | Builds selection logic for executable warehouse work; not necessarily read-only. |
| `utility_transform` | Transforms input into derived values or structured parameters. |
| `event_handler` | Defines trigger behavior for a declared DML event; actual execution was not tested. |

No object is assigned `runtime_queue` in this subset. `SCHEDULED_JOBS` combines configuration with run bookkeeping; `WORK_INSTRUCTION` is an execution worklist. Neither establishes that generic vendor process-queue tables are deployed.

## Coverage

| Type | Reviewed | Eligible | Unreviewed |
| --- | ---: | ---: | ---: |
| Tables | 21 | 518 | 497 |
| Stored procedures | 8 | 921 | 913 |
| Scalar functions | 1 | 66 | 65 |
| Inline table functions | 0 | 1 | 1 |
| Multistatement table functions | 1 | 9 | 8 |
| Views | 2 | 135 | 133 |
| Triggers | 2 | 6 | 4 |

## Object responsibilities

| Object | Business domains | Functional roles | Purpose |
| --- | --- | --- | --- |
| [dbo.LOCATION_INVENTORY](objects/1362819917.md) | inventory | `transactional_state` | Holds location-level inventory state affected by movement routines. |
| [dbo.ITEM](objects/386816440.md) | inventory, shared_reference | `master_reference`, `configuration` | Combines item reference data with item-level warehouse behavior settings. |
| [dbo.COMPANY](objects/1785773419.md) | shared_reference, configuration | `master_reference`, `configuration` | Stores company reference details and company-scoped operational settings. |
| [dbo.WAREHOUSE](objects/664389436.md) | shared_reference, configuration | `master_reference`, `configuration` | Defines warehouse identities and facility-scoped settings. |
| [dbo.LOCATION](objects/1298819689.md) | inventory, work_execution | `master_reference`, `configuration`, `transactional_state` | Combines location definition, movement rules and mutable availability/status fields. |
| [dbo.SHIPMENT_HEADER](objects/683865503.md) | shipping | `transactional_state` | Stores shipment-header progress and shipping-level state. |
| [dbo.SHIPMENT_DETAIL](objects/619865275.md) | shipping, inventory | `transactional_state` | Tracks shipment-line quantities and their progression through status slots. |
| [dbo.SHIPPING_CONTAINER](objects/1067866871.md) | shipping | `transactional_state` | Represents shipping containers, shipment linkage and container hierarchy state. |
| [dbo.SHIPPING_LOAD](objects/1131867099.md) | shipping | `transactional_state` | Tracks shipping-load status and departure/closure information. |
| [dbo.WORK_INSTRUCTION](objects/1352391887.md) | work_execution, inventory | `transactional_state`, `execution_worklist` | Represents warehouse instructions and their ordering, assignment and execution state. |
| [dbo.RECEIPT_HEADER](objects/1599344762.md) | receiving | `transactional_state` | Stores receipt-header progress, unitization timestamps and trailer-yard association. |
| [dbo.RECEIPT_DETAIL](objects/1551344591.md) | receiving, inventory | `transactional_state` | Represents receipt lines and quantities used in receiving and placement. |
| [dbo.SCREEN_CONTROL](objects/43863223.md) | ui_and_reporting, configuration | `presentation_metadata`, `configuration` | Stores metadata used to define and bind user-interface controls. |
| [dbo.SCHEDULED_JOBS](objects/11863109.md) | configuration, work_execution | `configuration`, `transactional_state` | Combines application scheduled-job definitions with last/next-run bookkeeping. |
| [dbo.BATCH_SUBMISSION_CONFIG](objects/1305771709.md) | configuration, work_execution | `configuration` | Describes batch-submission types and their scheduling eligibility. |
| [dbo.TRANSACTION_HISTORY](objects/1979870120.md) | inventory, work_execution, audit | `audit_history` | Stores transaction history with before-and-after inventory/status measures. |
| [dbo.SYSTEM_CONFIG_DETAIL](objects/1643868923.md) | configuration | `configuration` | Stores scoped system-configuration entries and validation metadata. |
| [dbo.DOWNLOAD_ITEM](objects/886294217.md) | integration, inventory | `integration_staging` | Stores item interface payloads with processing-control and error fields. |
| [dbo.UPLOAD_ORDER_HEADER](objects/120387498.md) | integration, shipping | `integration_staging` | Stores order/shipment interface payloads with processing indicators. |
| [dbo.INTERFACE_ERROR](objects/194815756.md) | integration, audit | `audit_history` | Records interface errors and associated process/file references. |
| [dbo.PROCESS_HISTORY](objects/911342311.md) | audit, work_execution | `audit_history` | Stores timestamped process/action history and contextual identifiers. |
| [dbo.INV_AdjustInv](objects/1128703419.md) | inventory | `orchestration` | Coordinates database steps for an inventory adjustment. |
| [dbo.INV_PickFromLocation](objects/1400704388.md) | inventory | `transactional_mutation`, `orchestration` | Implements pick-side inventory changes and associated location/unit handling. |
| [dbo.INV_PutIntoLocation](objects/1464704616.md) | inventory | `transactional_mutation`, `orchestration` | Implements destination-side placement and related attribute/unit processing. |
| [dbo.SHP_SetStatusesAtShipConfirm](objects/1809753850.md) | shipping | `transactional_mutation`, `orchestration` | Applies status changes across the shipment/container/load hierarchy. |
| [dbo.WRK_GetWorkInstructionsForExecution](objects/51843597.md) | work_execution, configuration | `workflow_selection`, `orchestration` | Builds warehouse-work selection from supplied context and configuration. |
| [dbo.WRK_MonitorWorkGroupChartData](objects/1082799265.md) | work_execution, ui_and_reporting | `reporting_read_model`, `presentation_adapter` | Builds work-group chart and monitor summaries from filtered work state. |
| [dbo.SHP_InsightDetailPaneData](objects/1633753223.md) | shipping, ui_and_reporting | `reporting_read_model`, `presentation_adapter` | Builds shipment result sets for the documented DetailPane example. |
| [dbo.MetaTrans_GetPrintSelectedDocuments](objects/901226611.md) | ui_and_reporting, shipping, configuration | `presentation_adapter`, `reporting_read_model` | Returns candidate print documents and defaults for an application printing flow. |
| [dbo.fn_GetMonitorFilterParameters](objects/696701880.md) | ui_and_reporting | `utility_transform` | Parses monitor-filter input into a tabular parameter representation. |
| [dbo.GetWarehouseTimezoneValue](objects/1000702963.md) | configuration, shared_reference | `utility_transform` | Converts a timestamp using a warehouse timezone setting. |
| [dbo.RECEIPT_HEADER_A_I](objects/720057651.md) | receiving | `event_handler`, `transactional_mutation` | Adds trailer-yard linking behavior when receipt headers are inserted. |
| [dbo.work_instruction_outgoing_pd](objects/800057936.md) | work_execution | `event_handler`, `transactional_mutation` | Sets outgoing location metadata during work-instruction insertion. |
| [dbo.WORK_INSTRUCTION_VIEW](objects/172579703.md) | work_execution, ui_and_reporting | `reporting_read_model` | Combines two work-instruction storage sources into one read surface. |
| [dbo.SHIPMENT_HEADER_VIEW](objects/2032062325.md) | shipping, ui_and_reporting | `reporting_read_model` | Provides shipment-header reads enriched with detail/container aggregates. |

## Evidence and interpretation

Each citation refers to the exact artifact whose SHA-256 is recorded in JSON. SQL copies omit literals/comments. Supplemental vendor mentions do not establish deployed semantic equivalence.

### dbo.LOCATION_INVENTORY - `1362819917`

Holds location-level inventory state affected by movement routines.

- **transactional_state:** Location/item/company/lot keys coexist with on-hand, in-transit, allocated and suspense quantities.

Evidence E1: [column contract lines 11 to 50](objects/1362819917.md#L11-L50). Reviewed columns support the stated storage responsibilities.
Evidence E2: [redacted sql lines 497 to 519](sql/1400704388.sql#L497-L519). Conditional location-inventory deletion.
Evidence E3: [redacted sql lines 610 to 614](sql/1400704388.sql#L610-L614). Explicit location-inventory update.

Limits: No stock quantities were read; quantity effects depend on transaction flags and callers.

Supplemental [AIM identifier mention](../AIM/reading/a5abd9742fcb737e5cbc5122fa6fcdf0fc33600b1cc43541b9a6a9718327e038.md) - article `a5abd9742fcb737e5cbc5122fa6fcdf0fc33600b1cc43541b9a6a9718327e038`, node `n370`; semantic equivalence is unestablished.

### dbo.ITEM - `386816440`

Combines item reference data with item-level warehouse behavior settings.

- **master_reference:** Item/company identity, description and product attributes define reusable item records.
- **configuration:** Locating/allocation rules and lot/serial/tracking controls attach behavior settings to an item.

Evidence E1: [column contract lines 12 to 81](objects/386816440.md#L12-L81). Reviewed columns support the stated storage responsibilities.

Limits: A control column does not establish its configured value or enabled behavior.

### dbo.COMPANY - `1785773419`

Stores company reference details and company-scoped operational settings.

- **master_reference:** Company identity, name and addresses provide reusable party information.
- **configuration:** Host-interface source and upload options hold company-level integration settings.

Evidence E1: [column contract lines 11 to 80](objects/1785773419.md#L11-L80). Reviewed columns support the stated storage responsibilities.

Limits: No company records, addresses, endpoints or configured values were read.

### dbo.WAREHOUSE - `664389436`

Defines warehouse identities and facility-scoped settings.

- **master_reference:** Warehouse identity, description and addresses provide facility reference information.
- **configuration:** Timezone and upload options hold facility-scoped processing settings.

Evidence E1: [column contract lines 11 to 67](objects/664389436.md#L11-L67). Reviewed columns support the stated storage responsibilities.
Evidence E2: [redacted sql lines 20 to 25](sql/1000702963.sql#L20-L25). Timezone conversion reads WAREHOUSE.TIME_ZONE.

Limits: The TIME_ZONE column does not establish valid configured values or timezone correctness.

### dbo.LOCATION - `1298819689`

Combines location definition, movement rules and mutable availability/status fields.

- **master_reference:** Warehouse/location identity and zone attributes define reusable location references.
- **configuration:** Picking/putaway sequences and movement controls influence warehouse movement.
- **transactional_state:** Status/locate-lock fields represent mutable state, and inventory code explicitly updates location status.

Evidence E1: [column contract lines 11 to 52](objects/1298819689.md#L11-L52). Reviewed columns support the stated storage responsibilities.
Evidence E2: [redacted sql lines 325 to 340](sql/1400704388.sql#L325-L340). Inventory handling can insert inventory and update LOCATION.LOCATION_STS.

Limits: Current availability, capacity and operator eligibility are unknown.

### dbo.SHIPMENT_HEADER - `683865503`

Stores shipment-header progress and shipping-level state.

- **transactional_state:** Shipment identity, load linkage, leading/trailing statuses and actual ship time encode operational progress.

Evidence E1: [column contract lines 11 to 83](objects/683865503.md#L11-L83). Reviewed columns support the stated storage responsibilities.
Evidence E2: [redacted sql lines 65 to 78](sql/1809753850.sql#L65-L78). Ship-confirm handling updates header status and timestamps.

Limits: Status meanings require documented/configured context; no current shipment progress was observed.

Supplemental [AIM identifier mention](../AIM/reading/1e8e44ed2fc47bbf9f5f517f78b84d204848cba96d0a025c9d19aea589c84c8f.md) - article `1e8e44ed2fc47bbf9f5f517f78b84d204848cba96d0a025c9d19aea589c84c8f`, node `n79`; semantic equivalence is unestablished.

### dbo.SHIPMENT_DETAIL - `619865275`

Tracks shipment-line quantities and their progression through status slots.

- **transactional_state:** Line identity, requested quantity and quantity-at-status slots retain fulfillment-line progress.

Evidence E1: [column contract lines 11 to 111](objects/619865275.md#L11-L111). Reviewed columns support the stated storage responsibilities.
Evidence E2: [redacted sql lines 81 to 119](sql/1809753850.sql#L81-L119). Status/quantity updates preserve the explicit 995 exclusion.

Limits: Column slots alone do not define status meanings or caller-specific transition rules.

Supplemental [AIM identifier mention](../AIM/reading/361fe34d26f81e223b32fc7457d5058772d80cf26549792eb7ae64034aabdea0.md) - article `361fe34d26f81e223b32fc7457d5058772d80cf26549792eb7ae64034aabdea0`, node `n174`; semantic equivalence is unestablished.

### dbo.SHIPPING_CONTAINER - `1067866871`

Represents shipping containers, shipment linkage and container hierarchy state.

- **transactional_state:** Container identity, parent hierarchy, shipment linkage, quantity and manifest/status fields retain packing/shipping state.

Evidence E1: [column contract lines 11 to 58](objects/1067866871.md#L11-L58). Reviewed columns support the stated storage responsibilities.
Evidence E2: [redacted sql lines 289 to 292](sql/1809753850.sql#L289-L292). Ship-confirm handling updates container status.

Limits: Manifest fields do not prove carrier transmission, label printing or successful shipment.

Supplemental [AIM identifier mention](../AIM/reading/321e7f2dfed009b4ccf91e34724e98fc752e91eb1d2c54088d94ab7d0f327107.md) - article `321e7f2dfed009b4ccf91e34724e98fc752e91eb1d2c54088d94ab7d0f327107`, node `n69`; semantic equivalence is unestablished.

### dbo.SHIPPING_LOAD - `1131867099`

Tracks shipping-load status and departure/closure information.

- **transactional_state:** Load identity, progress statuses, closure state and departure timestamps encode transport-load execution state.

Evidence E1: [column contract lines 11 to 50](objects/1131867099.md#L11-L50). Reviewed columns support the stated storage responsibilities.
Evidence E2: [redacted sql lines 295 to 306](sql/1809753850.sql#L295-L306). Load trailing status is derived from child shipment statuses.

Limits: No departure, closure or carrier activity was observed.

Supplemental [SDK identifier mention](../SDK/reading/35cdfcbe2823f6394fe2644f35985b4dd4c0b5f9cf4e66f1d6d0d8f7fa5b8339.md) - article `35cdfcbe2823f6394fe2644f35985b4dd4c0b5f9cf4e66f1d6d0d8f7fa5b8339`, node `n80`; semantic equivalence is unestablished.

### dbo.WORK_INSTRUCTION - `1352391887`

Represents warehouse instructions and their ordering, assignment and execution state.

- **transactional_state:** Conditions, quantities and execution timestamps retain work progress.
- **execution_worklist:** Work unit, sequence, priority, assignment and movement locations support instruction dispatch.

Evidence E1: [column contract lines 14 to 56](objects/1352391887.md#L14-L56). Reviewed columns support the stated storage responsibilities.
Evidence E2: [redacted sql lines 99 to 116](sql/51843597.sql#L99-L116). Work-selection logic reads instruction grouping and sequencing.
Evidence E3: [redacted sql lines 35 to 60](sql/1082799265.sql#L35-L60). Monitoring counts and groups instructions by work and condition.

Limits: This is a warehouse instruction worklist, not evidence that the absent generic QUEUE_PROCESS implementation is deployed. No current task, assignment or quantity was read.

Supplemental [AIM identifier mention](../AIM/reading/a5abd9742fcb737e5cbc5122fa6fcdf0fc33600b1cc43541b9a6a9718327e038.md) - article `a5abd9742fcb737e5cbc5122fa6fcdf0fc33600b1cc43541b9a6a9718327e038`, node `n809`; semantic equivalence is unestablished.

### dbo.RECEIPT_HEADER - `1599344762`

Stores receipt-header progress, unitization timestamps and trailer-yard association.

- **transactional_state:** Receipt identity, leading/trailing statuses and arrival/unitization timestamps retain inbound progress.

Evidence E1: [column contract lines 11 to 91](objects/1599344762.md#L11-L91). Reviewed columns support the stated storage responsibilities.
Evidence E2: [redacted sql lines 3 to 29](sql/720057651.sql#L3-L29). An AFTER INSERT trigger can update trailer-yard association and stamps.

Limits: Actual receipt progress and trailer matching were not observed.

Supplemental [AIM identifier mention](../AIM/reading/a5abd9742fcb737e5cbc5122fa6fcdf0fc33600b1cc43541b9a6a9718327e038.md) - article `a5abd9742fcb737e5cbc5122fa6fcdf0fc33600b1cc43541b9a6a9718327e038`, node `n438`; semantic equivalence is unestablished.

### dbo.RECEIPT_DETAIL - `1551344591`

Represents receipt lines and quantities used in receiving and placement.

- **transactional_state:** Line identity, total/open quantity, item/lot and expected inventory status retain inbound line state.

Evidence E1: [column contract lines 11 to 67](objects/1551344591.md#L11-L67). Reviewed columns support the stated storage responsibilities.

Limits: No current quantities, placement choices or configured putaway rules were read.

Supplemental [AIM identifier mention](../AIM/reading/a5abd9742fcb737e5cbc5122fa6fcdf0fc33600b1cc43541b9a6a9718327e038.md) - article `a5abd9742fcb737e5cbc5122fa6fcdf0fc33600b1cc43541b9a6a9718327e038`, node `n438`; semantic equivalence is unestablished.

### dbo.SCREEN_CONTROL - `43863223`

Stores metadata used to define and bind user-interface controls.

- **presentation_metadata:** Control type, resource key, screen group, data binding and template fields describe screen controls.
- **configuration:** Active, default-state and default-action fields carry configurable control behavior.

Evidence E1: [column contract lines 12 to 39](objects/43863223.md#L12-L39). Reviewed columns support the stated storage responsibilities.

Limits: Actual screen composition, activation and user permissions require records/application evidence not collected here.

Supplemental [SDK identifier mention](../SDK/reading/03b8fac0c26e3ef85f4228bcf5a0d77e4a65f19da066c7ba0e90d6d03def8497.md) - article `03b8fac0c26e3ef85f4228bcf5a0d77e4a65f19da066c7ba0e90d6d03def8497`, node `n255`; semantic equivalence is unestablished.

### dbo.SCHEDULED_JOBS - `11863109`

Combines application scheduled-job definitions with last/next-run bookkeeping.

- **configuration:** Job identity, parameters, recurrence fields, active flag and timezone define scheduling settings.
- **transactional_state:** Last-run and next-run timestamps store scheduler bookkeeping alongside configuration.

Evidence E1: [column contract lines 11 to 38](objects/11863109.md#L11-L38). Reviewed columns support the stated storage responsibilities.

Limits: No schedules or enabled jobs were read; this does not prove SQL Agent use, backlog, polling intervals or actual execution.

Supplemental [AIM identifier mention](../AIM/reading/a5abd9742fcb737e5cbc5122fa6fcdf0fc33600b1cc43541b9a6a9718327e038.md) - article `a5abd9742fcb737e5cbc5122fa6fcdf0fc33600b1cc43541b9a6a9718327e038`, node `n964`; semantic equivalence is unestablished.

### dbo.BATCH_SUBMISSION_CONFIG - `1305771709`

Describes batch-submission types and their scheduling eligibility.

- **configuration:** Record type, parameters, scheduling eligibility and description define batch-submission options.

Evidence E1: [column contract lines 11 to 25](objects/1305771709.md#L11-L25). Reviewed columns support the stated storage responsibilities.

Limits: Submission history, current job state and concrete parameters are not established.

### dbo.TRANSACTION_HISTORY - `1979870120`

Stores transaction history with before-and-after inventory/status measures.

- **audit_history:** Transaction/work identity, actor, activity time and before/after measures describe recorded changes.

Evidence E1: [column contract lines 13 to 53](objects/1979870120.md#L13-L53). Reviewed columns support the stated storage responsibilities.

Limits: Schema does not prove complete logging, immutability or retention.

Supplemental [SDK identifier mention](../SDK/reading/4489584487ad69166a448f4f32b6eb65d720c2573f60926b4fa12d03c8a4164a.md) - article `4489584487ad69166a448f4f32b6eb65d720c2573f60926b4fa12d03c8a4164a`, node `n47`; semantic equivalence is unestablished.

### dbo.SYSTEM_CONFIG_DETAIL - `1643868923`

Stores scoped system-configuration entries and validation metadata.

- **configuration:** System key, record type, lookup/validation metadata and warehouse/company scope surround SYSTEM_VALUE.

Evidence E1: [column contract lines 12 to 31](objects/1643868923.md#L12-L31). Reviewed columns support the stated storage responsibilities.
Evidence E2: [redacted sql lines 270 to 275](sql/51843597.sql#L270-L275). Work selection reads a system value into a numeric selection parameter.

Limits: Configuration values were not read; masking metadata does not establish effective application authorization.

### dbo.DOWNLOAD_ITEM - `886294217`

Stores item interface payloads with processing-control and error fields.

- **integration_staging:** Interface identity/action/condition/error fields accompany item attributes and rules.

Evidence E1: [column contract lines 11 to 25](objects/886294217.md#L11-L25). Reviewed columns support the stated storage responsibilities.

Limits: Payload/control columns support the role; direction, consumer, transport and successful processing are not established from names or columns.

Supplemental [AIM identifier mention](../AIM/reading/e483e9325f41acd0c372563f36ce84946196fbfbb58a029a2a9e95d27941a471.md) - article `e483e9325f41acd0c372563f36ce84946196fbfbb58a029a2a9e95d27941a471`, node `n491`; semantic equivalence is unestablished.

### dbo.UPLOAD_ORDER_HEADER - `120387498`

Stores order/shipment interface payloads with processing indicators.

- **integration_staging:** Interface identity/action/condition/error fields accompany shipment identifiers, statuses and totals.

Evidence E1: [column contract lines 11 to 167](objects/120387498.md#L11-L167). Reviewed columns support the stated storage responsibilities.

Limits: Staging is not proof of transmission or acknowledgment; endpoint, direction and active interface configuration remain unknown.

Supplemental [AIM identifier mention](../AIM/reading/b36fc80a8094d16a00193b48758f3b199d6ceac99362482cb5a1d522cf5d2520.md) - article `b36fc80a8094d16a00193b48758f3b199d6ceac99362482cb5a1d522cf5d2520`, node `n168`; semantic equivalence is unestablished.

### dbo.INTERFACE_ERROR - `194815756`

Records interface errors and associated process/file references.

- **audit_history:** Error identity/message, file references, process/mode, notification flag and identifiers describe error records.

Evidence E1: [column contract lines 11 to 29](objects/194815756.md#L11-L29). Reviewed columns support the stated storage responsibilities.

Limits: No messages, paths or error occurrences were read; retention, completeness and replay/retry semantics are unverified.

Supplemental [AIM identifier mention](../AIM/reading/28b2818dbc393a3087eb0ebbbac822dde8e0c66d514b2097d56939c2bd265e2e.md) - article `28b2818dbc393a3087eb0ebbbac822dde8e0c66d514b2097d56939c2bd265e2e`, node `n58`; semantic equivalence is unestablished.

### dbo.PROCESS_HISTORY - `911342311`

Stores timestamped process/action history and contextual identifiers.

- **audit_history:** Process/action, activity time, identifiers and message columns define process-event records.

Evidence E1: [column contract lines 13 to 20](objects/911342311.md#L13-L20). Reviewed columns support the stated storage responsibilities.

Limits: Schema does not prove start/end pairing, complete process durations or immutable history.

### dbo.INV_AdjustInv - `1128703419`

Coordinates database steps for an inventory adjustment.

- **orchestration:** Conditional serial validation/picking, location pick/put and serial placement calls coordinate the operation.

Evidence E1: [redacted sql lines 138 to 154](sql/1128703419.sql#L138-L154). Audit call and a terminating branch.
Evidence E2: [redacted sql lines 198 to 250](sql/1128703419.sql#L198-L250). Conditional serial/location calls and nonzero error propagation.

Limits: Role review does not establish every flag, status constant or caller transaction; no adjustment was executed.

### dbo.INV_PickFromLocation - `1400704388`

Implements pick-side inventory changes and associated location/unit handling.

- **transactional_mutation:** Explicit location/UOM/inventory updates and deletions change persistent state.
- **orchestration:** Delegated insert/archive/update calls and an application-lock branch coordinate inventory-side work.

Evidence E1: [redacted sql lines 260 to 340](sql/1400704388.sql#L260-L340). Application lock, locked inventory read, inventory insertion and location update.
Evidence E2: [redacted sql lines 432 to 519](sql/1400704388.sql#L432-L519). Serial archival and inventory-related deletion/update paths.
Evidence E3: [redacted sql lines 564 to 614](sql/1400704388.sql#L564-L614). Delegated and explicit location-inventory updates.

Limits: Caller transactions, complete branches and lock-release guarantees remain outside this role review. The shown lock timeout is unbounded; this assessment did not take that lock.

### dbo.INV_PutIntoLocation - `1464704616`

Implements destination-side placement and related attribute/unit processing.

- **transactional_mutation:** Inventory-attribute insertion and location-UOM updates persist destination-side state.
- **orchestration:** Inventory insertion, serial archival, UOM copying and dynamic SQL delegate placement work.

Evidence E1: [redacted sql lines 455 to 470](sql/1464704616.sql#L455-L470). Application lock and locked inventory lookup.
Evidence E2: [redacted sql lines 559 to 595](sql/1464704616.sql#L559-L595). Inventory-attribute insertion and delegated inventory insertion.
Evidence E3: [redacted sql lines 650 to 676](sql/1464704616.sql#L650-L676). Dynamic SQL and destination-UOM copying.
Evidence E4: [redacted sql lines 747 to 758](sql/1464704616.sql#L747-L758). Serial archival and location-UOM update.

Limits: Dynamic bodies and exact flags are redacted; atomicity, all affected objects and a safe manual call contract are not established.

### dbo.SHP_SetStatusesAtShipConfirm - `1809753850`

Applies status changes across the shipment/container/load hierarchy.

- **transactional_mutation:** Persistent writes create alert requests and update shipment/detail/container/load statuses.
- **orchestration:** The routine sequences changes across shipping levels and derives load status from child shipments.

Evidence E1: [redacted sql lines 37 to 78](sql/1809753850.sql#L37-L78). Alert insertion and shipment-header status/time updates.
Evidence E2: [redacted sql lines 81 to 119](sql/1809753850.sql#L81-L119). Detail status/quantity updates preserve the 995 exclusion.
Evidence E3: [redacted sql lines 289 to 306](sql/1809753850.sql#L289-L306). Container and load status changes.

Limits: The surrounding application flow, carrier actions and caller commit/rollback are not established; numeric status meanings require separate evidence.

### dbo.WRK_GetWorkInstructionsForExecution - `51843597`

Builds warehouse-work selection from supplied context and configuration.

- **workflow_selection:** Instruction group/sequence state and scoped settings participate in selection.
- **orchestration:** Multiple dynamic statements include an early grouping path and later candidate probes.

Evidence E1: [redacted sql lines 99 to 140](sql/51843597.sql#L99-L140). Grouping/sequencing and dynamic execution precede later selection.
Evidence E2: [redacted sql lines 270 to 281](sql/51843597.sql#L270-L281). System configuration and existing work process reads.
Evidence E3: [redacted sql lines 374 to 420](sql/51843597.sql#L374-L420). Dynamic candidate probes.

Limits: Do not classify this routine as read-only: redacted dynamic SQL prevents proving all persistent side effects. Exact eligibility, current assignments and active settings remain unknown.

### dbo.WRK_MonitorWorkGroupChartData - `1082799265`

Builds work-group chart and monitor summaries from filtered work state.

- **reporting_read_model:** Counts, grouped work units and estimated-time sums derive monitor measures.
- **presentation_adapter:** Chart-oriented fields and additional summary measures shape results for the caller.

Evidence E1: [redacted sql lines 17 to 39](sql/1082799265.sql#L17-L39). Filter parameters feed chart counts and chart-oriented fields.
Evidence E2: [redacted sql lines 46 to 72](sql/1082799265.sql#L46-L72). Grouped totals and time-bounded closed-work count.

Limits: Arguments, current rows and redacted conditions determine counts; no actual monitor result or user visibility was observed.

Supplemental [SDK identifier mention](../SDK/reading/2f1e464b919bbe6d9db8cf9f7a2eb6d5cfd5866b662fd85c0ef3c9c02005b000.md) - article `2f1e464b919bbe6d9db8cf9f7a2eb6d5cfd5866b662fd85c0ef3c9c02005b000`, node `n97`; semantic equivalence is unestablished.

### dbo.SHP_InsightDetailPaneData - `1633753223`

Builds shipment result sets for the documented DetailPane example.

- **reporting_read_model:** Header, container count, dock and detail scalars are read from shipping objects.
- **presentation_adapter:** Four result sets package values for a DetailPane-style caller.

Evidence E1: [redacted sql lines 40 to 75](sql/1633753223.sql#L40-L75). Header/container reads and dock assignment/lookup.
Evidence E2: [redacted sql lines 78 to 90](sql/1633753223.sql#L78-L90). Final detail-derived result set and procedure end.

Limits: The dock-assignment statement lacks a shipment filter; functional impact was not tested. Screen activation and exact rendered labels are not established.

Supplemental [SDK identifier mention](../SDK/reading/35cdfcbe2823f6394fe2644f35985b4dd4c0b5f9cf4e66f1d6d0d8f7fa5b8339.md) - article `35cdfcbe2823f6394fe2644f35985b4dd4c0b5f9cf4e66f1d6d0d8f7fa5b8339`, node `n80`; semantic equivalence is unestablished.

### dbo.MetaTrans_GetPrintSelectedDocuments - `901226611`

Returns candidate print documents and defaults for an application printing flow.

- **presentation_adapter:** User printer defaults, process branches and document eligibility build print-selection data.
- **reporting_read_model:** The reviewed statements read profile/document/feature information; they do not establish external print execution.

Evidence E1: [redacted sql lines 16 to 43](sql/901226611.sql#L16-L43). Arguments and document/label-printer defaults feed a process branch.
Evidence E2: [redacted sql lines 282 to 300](sql/901226611.sql#L282-L300). Document/feature conditions determine eligible/default selections.

Limits: Selection data is not proof a printer received a job; profile values, labels and active features were not read.

Supplemental [SDK identifier mention](../SDK/reading/b3abb86eef566392ab2aa6ce2b5f576ef52ba0a341213b3ff03625d30c4a5a7b.md) - article `b3abb86eef566392ab2aa6ce2b5f576ef52ba0a341213b3ff03625d30c4a5a7b`, node `n61`; semantic equivalence is unestablished.

### dbo.fn_GetMonitorFilterParameters - `696701880`

Parses monitor-filter input into a tabular parameter representation.

- **utility_transform:** String slicing, delimiter searches and table-variable insertion convert input into filterName/filterValue rows.

Evidence E1: [redacted sql lines 12 to 16](sql/696701880.sql#L12-L16). Declared name/value return table.
Evidence E2: [redacted sql lines 27 to 76](sql/696701880.sql#L27-L76). Looping string slices and parsed-row insertion.

Limits: Redacted delimiters prevent a complete parser grammar or verified input-validation contract.

Supplemental [SDK identifier mention](../SDK/reading/2f1e464b919bbe6d9db8cf9f7a2eb6d5cfd5866b662fd85c0ef3c9c02005b000.md) - article `2f1e464b919bbe6d9db8cf9f7a2eb6d5cfd5866b662fd85c0ef3c9c02005b000`, node `n59`; semantic equivalence is unestablished.

### dbo.GetWarehouseTimezoneValue - `1000702963`

Converts a timestamp using a warehouse timezone setting.

- **utility_transform:** The function supplies a default time, reads warehouse timezone and transforms the date through AT TIME ZONE.

Evidence E1: [redacted sql lines 13 to 26](sql/1000702963.sql#L13-L26). Inputs, default time, WAREHOUSE lookup and transformed return.

Limits: The base timezone literal is redacted; current values, missing-warehouse behavior and DST outcomes were not executed or verified.

### dbo.RECEIPT_HEADER_A_I - `720057651`

Adds trailer-yard linking behavior when receipt headers are inserted.

- **event_handler:** The definition attaches AFTER INSERT behavior to RECEIPT_HEADER.
- **transactional_mutation:** A joined UPDATE sets trailer-yard association and receipt-header stamps.

Evidence E1: [redacted sql lines 3 to 29](sql/720057651.sql#L3-L29). Trigger event, inserted-row predicate and joined header update.

Limits: The inserted-row gate and update scope must be assessed together; execution and operational matching were not tested.

### dbo.work_instruction_outgoing_pd - `800057936`

Sets outgoing location metadata during work-instruction insertion.

- **event_handler:** The definition attaches AFTER INSERT behavior to WORK_INSTRUCTION.
- **transactional_mutation:** A qualifying-row test gates an UPDATE for joined inserted instruction IDs.

Evidence E1: [redacted sql lines 2 to 17](sql/800057936.sql#L2-L17). Trigger event, qualifying-row count and update join.

Limits: The initial gate does not restrict the UPDATE to only qualifying rows; this is static evidence, not a reproduced multi-row defect.

### dbo.WORK_INSTRUCTION_VIEW - `172579703`

Combines two work-instruction storage sources into one read surface.

- **reporting_read_model:** UNION ALL exposes WORK_INSTRUCTION and IA_WORK_INSTRUCTION through a common view.

Evidence E1: [redacted sql lines 5 to 9](sql/172579703.sql#L5-L9). Complete UNION ALL definition.

Limits: The view does not deduplicate; IA_WORK_INSTRUCTION retention/lifecycle and row disjointness are not established.

### dbo.SHIPMENT_HEADER_VIEW - `2032062325`

Provides shipment-header reads enriched with detail/container aggregates.

- **reporting_read_model:** A header projection joins aggregate detail and parent-container totals.

Evidence E1: [redacted sql lines 206 to 227](sql/2032062325.sql#L206-L227). Header and grouped detail/parent-container joins.

Limits: NOLOCK hints are present; result consistency and reporting performance were not measured.

Supplemental [SDK identifier mention](../SDK/reading/35cdfcbe2823f6394fe2644f35985b4dd4c0b5f9cf4e66f1d6d0d8f7fa5b8339.md) - article `35cdfcbe2823f6394fe2644f35985b4dd4c0b5f9cf4e66f1d6d0d8f7fa5b8339`, node `n80`; semantic equivalence is unestablished.

## Using the classification

State and mutation entries locate where workflows store and change progress. Orchestration entries identify coordinated steps. Read models and presentation adapters explain what a screen summarizes. Configuration/master-reference entries identify definitions influencing behavior; staging/history entries locate payloads and activity records. None exposes actual configured values or current business records.

For a shipment-progress question, combine shipping state, the status-mutating procedure and vendor documentation, then identify missing runtime/configuration evidence. For a monitor question, separate the instruction worklist, combined view, filter parser and chart procedure. A role assignment cannot establish that a workflow ran successfully.
