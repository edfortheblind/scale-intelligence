# SCALE functionality help topics

These eight topics are the first source-grounded help content for SCALE Intelligence. They lead with concise answers for warehouse users, followed by execution details and evidence. This is a pilot, not the complete SCALE Intelligence brain.

Runtime here means the ordered behavior and decisions in a process. No business process was executed and whole-process elapsed time is not established. Approved current configuration observations belong in [Configuration validation](CONFIGURATION_VALIDATION.md); attach their scope and capture time when using them in an answer.

The [machine-readable help topics](mappings/help-topics.json) hold claim-linked citations, fingerprints, review states and 16 evaluation cases. The cases are authored but have not been run against a working Intelligence app.

The text uses descriptive headings, short answers and ordered steps without requiring a chart or color. Novice-user and screen-reader acceptance is still pending. Insight screen paths and SOP actions will be registered in the separate navigation task; none are invented here.

## 1. Understanding shipment detail fields

**User question:** Why can a shipment summary field be blank?

**Help answer:** The summary combines the shipment header, containers, dock door and shipment lines. For some line-level fields, SCALE returns a blank summary when the lines contain different non-null values. A blank summary therefore does not always mean information is missing.

**Trigger:** An application detail-pane request bound to SHP_InsightDetailPaneData. The SDK documents the binding pattern; the active screen binding is not established.

**Input context**

- Internal shipment number
- Culture supplied by the screen

**Execution flow**

1. Read the shipment header view and call the status-name function for leading and trailing status. Objects: `SHIPMENT_HEADER_VIEW`, `STSfn_RtrvStsName`. Evidence: `shipment-detail-sql`.
2. Count containers whose tree-unit number equals their internal container number, filtered to the shipment. Objects: `SHIPPING_CONTAINER`. Evidence: `shipment-detail-sql`.
3. Assign a dock-door number through the shipment-view/load join, then read LOCATION. This assignment has no shipment WHERE filter in the captured statement; it is a source-review concern. Objects: `SHIPMENT_HEADER_VIEW`, `SHIPPING_LOAD`, `LOCATION`. Evidence: `shipment-detail-sql`.
4. For USER_DEF1..6, INVOICE and PICK_LIST_ID, return NULL when COUNT(DISTINCT field) exceeds one; otherwise return MIN(field). Objects: `SHIPMENT_DETAIL`. Evidence: `shipment-detail-sql`.

**Configuration dependencies**

- Screen binding determines whether this routine supplies the pane.
- The SDK explains culture-based resources; passing culture does not establish that every deployed field is localized.

**Expected results**

- Four SELECT result sets: header, parent-container count, dock-door information and detail-derived summary values.
- The local dock-door variable assignment does not emit a fifth result set.

**Common explanation paths**

- A blank summary can result from differing line values, all-null values or no matching detail rows. These possibilities do not identify the cause for a specific shipment.
- For an unexpected dock door, the unfiltered assignment is a source-review lead; no incorrect screen result was reproduced.

**Boundaries**

- No shipment records were read.
- The SDK example and deployed signature differ; the deployed contract governs this database.
- Current screen paths and bindings have not been registered.

**Technical evidence**

- `shipment-detail-sql`: [dbo.SHP_InsightDetailPaneData](sql/1633753223.sql), object ID `1633753223`, reading-copy lines 40-88; source-definition SHA-256 `78364f898a329680b446b42f8071be5d2d79484a1592c4108f91a36096650147`. Exact reading-copy SHA-256 `91be70e93fcaf6cd46bdc9ff8ae8fb5923ba31e252460dcaf62dd1e520a7342c`.
- `shipment-detail-sdk`: [How to: Create a Detail Pane Stored Procedure](../SDK/reading/35cdfcbe2823f6394fe2644f35985b4dd4c0b5f9cf4e66f1d6d0d8f7fa5b8339.md), article `35cdfcbe2823f6394fe2644f35985b4dd4c0b5f9cf4e66f1d6d0d8f7fa5b8339`, original SHA-256 `6c46ec3389ead3049deb0ff074e7dad5e36fa23163455fd4aa8613a44804200a`, nodes `n47`, `n80`, `n414`.

**Review state:** STATIC_REVIEWED_BOUNDED; bounded independent static evidence review passed; no live process executed.

**Answer evaluation cases — authored, not executed**

- Why is the invoice blank in my summary? Expected: Explain the mixed-value rule and other null possibilities. Must not claim: A particular shipment has conflicting invoices.
- Does the routine return five result sets? Expected: It returns four; a variable-assignment SELECT is not a result set. Must not claim: Five SELECT statements necessarily produce five results.

## 2. Understanding work monitor totals

**User question:** Why are work units, instructions and recently closed work different numbers?

**Help answer:** A work unit can contain more than one instruction. The monitor counts distinct work units, instruction rows and estimated time separately. Its recently closed count uses a separate query restricted to the last hour. These figures measure different things and need not match.

**Trigger:** A monitor request calling WRK_MonitorWorkGroupChartData.

**Input context**

- Filter criteria containing the warehouse
- Culture used for resource labels

**Execution flow**

1. Parse criteria with fn_GetMonitorFilterParameters into a local table variable and extract the warehouse. Objects: `fn_GetMonitorFilterParameters`. Evidence: `work-monitor-sql`.
2. For matching from/to warehouses, group selected instructions by work group and count distinct work units; read configuration descriptions. Objects: `WORK_INSTRUCTION`, `GENERIC_CONFIG_DETAIL`, `RSCMfn_RtrvResource`. Evidence: `work-monitor-sql`.
3. Calculate instruction counts, per-condition work-unit counts and estimated-time sums, then derive condition-specific counts. Objects: `WORK_INSTRUCTION`. Evidence: `work-monitor-sql`.
4. Use WORK_INSTRUCTION_VIEW for the closed-condition count with DATE_TIME_STAMP at or after UTC now minus one hour. Objects: `WORK_INSTRUCTION_VIEW`. Evidence: `work-monitor-sql`.
5. Return chart data and six scalar SELECT results. Objects: `WRK_MonitorWorkGroupChartData`. Evidence: `work-monitor-sql`.

**Configuration dependencies**

- GENERIC_CONFIG_DETAIL supplies work-group descriptions.
- Warehouse and coded type/condition predicates determine inclusion; redacted literals must not be reconstructed by guessing.

**Expected results**

- Chart work units are distinct within work group; the total-work-unit scalar sums distinct counts within condition groups. Equality is not guaranteed.
- Estimated time sums stored estimates; it is not measured elapsed duration.

**Common explanation paths**

- Identify the counting unit, grouping and time window before comparing figures.
- A decrease in recently closed work may reflect the rolling timestamp window. The predicate does not prove that the stamp is the exact completion-event time.

**Boundaries**

- No live work counts were fetched.
- The monitor does not establish end-to-end productivity or process duration.
- A visual chart must have an equivalent text summary in the future help UI.

**Technical evidence**

- `work-monitor-sql`: [dbo.WRK_MonitorWorkGroupChartData](sql/1082799265.sql), object ID `1082799265`, reading-copy lines 17-67; source-definition SHA-256 `9f39d9614e0eb5eebcc4bb6ca304351d4e35a8f0ad00e6dad950ac84e308b92f`. Exact reading-copy SHA-256 `5a34e088b302084eeb2eae90fbfc0726d3a11cf9282f597ac5eab59d37d91e13`.
- `work-monitor-sdk`: [How to: Create Monitor Page Stored Procedure](../SDK/reading/2f1e464b919bbe6d9db8cf9f7a2eb6d5cfd5866b662fd85c0ef3c9c02005b000.md), article `2f1e464b919bbe6d9db8cf9f7a2eb6d5cfd5866b662fd85c0ef3c9c02005b000`, original SHA-256 `8ffbb7c80b927b1c7e10e600060b6bf4e40ee562531deb705745193a32d6fd60`, nodes `n59`, `n97`.

**Review state:** STATIC_REVIEWED_BOUNDED; bounded independent static evidence review passed; no live process executed.

**Answer evaluation cases — authored, not executed**

- Why are there more instructions than work units? Expected: Explain instruction rows versus distinct units. Must not claim: Every work unit contains exactly one instruction.
- Is estimated time how long this work actually took? Expected: The query sums ESTIMATED_TIME. Must not claim: This is a measurement of completed process runtime.

## 3. Understanding which work is offered

**User question:** Why can two users receive different work?

**Help answer:** SCALE considers the user, warehouse, work profile, location or container, grouping, zone access and enabled features when selecting work. A work profile is a set of rules for the work being offered. These inputs can change both eligibility and ordering. The reason for one particular user's result needs that user's authorized context.

**Trigger:** An application request calling WRK_GetWorkInstructionsForExecution.

**Input context**

- User, warehouse, work profile and profile sequence
- Work unit, source location and container context
- Direction, system-directed/cart/cycle-count flags and group number

**Execution flow**

1. In the cart branch, inspect grouping and sequence, read WORK_REGROUP_ORDER and conditionally run a separate dynamic statement. Its body is redacted in the reading copy, so this topic does not certify this branch as read-only. Objects: `WORK_INSTRUCTION`, `WORK_REGROUP_ORDER`, `sp_executesql`. Evidence: `work-selection-sql`.
2. Compare work-profile zone authorization with ZONE and read grouping, initiation, assignment, work-type and container flags. Objects: `ZONE`, `WORK_PROFILE_ZONE_AUTH`, `WORK_PROFILE_DETAIL`. Evidence: `work-selection-sql`.
3. Read system settings and user authorization and evaluate feature flags that select branches. Objects: `SYSTEM_CONFIG_DETAIL`, `USER_PROFILE`, `fn_GetFeatureEnabled`. Evidence: `work-selection-sql`.
4. In relevant system-directed branches, run candidate probes and use their results to choose subsequent filtering and ordering. Objects: `sp_executesql`. Evidence: `work-selection-sql`.
5. Assemble the selected query and execute it with work/user/warehouse/profile/container/group parameters. Objects: `sp_executesql`. Evidence: `work-selection-sql`.

**Configuration dependencies**

- WORK_PROFILE_DETAIL controls grouping, work types, from/to assignment, initiation, multiple work units and container behavior.
- WORK_PROFILE_ZONE_AUTH and ZONE influence zone eligibility.
- USER_PROFILE supplies company and warehouse authorization; user records are outside this help topic.
- SYSTEM_CONFIG_DETAIL and feature checks select branches; a generic configuration-table dump is not an approved diagnostic.

**Expected results**

- Different inputs can select different branches and ordering.
- This explanation describes selection dimensions, not currently available tasks.

**Common explanation paths**

- For different users, compare relevant authorization, profile, zone and task context through approved support paths before asserting a defect.
- For an unexpected work order, examine assignment/grouping/feature branches; do not invent a universal sort order.

**Boundaries**

- Dynamic SQL details are limited by redaction; this is a control-flow review.
- Do not execute this routine as a configuration-only diagnostic.
- No user or operational task records were fetched; current approved configuration facts belong in the separate validation report.

**Technical evidence**

- `work-selection-sql`: [dbo.WRK_GetWorkInstructionsForExecution](sql/51843597.sql), object ID `51843597`, reading-copy lines 46-60, 99-180, 186-283, 320-430, 435-448, 598-667, 740-752; source-definition SHA-256 `eca08945d5ab9ce42fdf8c01403853dd3addf9a62075e31053e20732f7db87cf`. Exact reading-copy SHA-256 `337a1793a82284ecd9d2c95352ab086d5ee8dae4e6e6a8d6025a62198c6678b0`.

**Review state:** STATIC_CONTROL_FLOW_REVIEWED_DYNAMIC_DETAILS_LIMITED; bounded independent static evidence review passed; no live process executed.

**Answer evaluation cases — authored, not executed**

- Why does my colleague receive a different task? Expected: Explain eligibility dimensions and the need for authorized context. Must not claim: The colleague has a particular permission or available task.
- Can Intelligence run this procedure to check configuration? Expected: It is not an approved configuration-only query. Must not claim: The routine's name guarantees no side effects.

## 4. Understanding an inventory adjustment

**User question:** Why can one inventory adjustment involve several operations?

**Help answer:** An adjustment can affect source quantities, destination quantities and serial numbers. The reviewed routine checks inputs and then calls the operations required by its quantity-effect flags. These flags specify which quantity categories should change. It is therefore more than editing one quantity field.

**Trigger:** A caller submits INV_AdjustInv with transaction and source/destination context.

**Input context**

- Quantity, unit, item/company, transaction type and reference
- Source/destination warehouse, location, container and inventory attributes
- Effect flags for on-hand, allocated, in-transit and suspended quantities
- Serial argument group, reversal and optional catch-weight context

**Execution flow**

1. If quantity is null/zero, both locations are null or item is null, create an audit message, call ADT_LogAudit and return before adjustment calls. Objects: `ADT_LogAudit`, `RSCMfn_RtrvMsg`. Evidence: `inventory-adjust-sql`.
2. Convert dates, normalize zero attribute IDs and conditionally read serial-tracking/location-class rules; raise errors for coded disallowed combinations. Objects: `ITEM`, `LOCATION`, `DHfn_TransToSQLDate`. Evidence: `inventory-adjust-sql`.
3. When the serial argument/effect conditions apply, validate and pick serial numbers, returning nonzero child codes immediately. Objects: `INV_ValidateSerialNums`, `INV_PickSerialNumbers`. Evidence: `inventory-adjust-sql`.
4. When source effect flags match, call INV_PickFromLocation and propagate SQL or nonzero child errors. Objects: `INV_PickFromLocation`. Evidence: `inventory-adjust-sql`.
5. When destination flags match, call INV_PutIntoLocation with source attributes passed forward, then conditionally put serial numbers. Objects: `INV_PutIntoLocation`, `INV_PutSerialNumbers`. Evidence: `inventory-adjust-sql`.

**Configuration dependencies**

- ITEM serial tracking and LOCATION class affect conditional validation; those records were not read.
- Caller-supplied effect flags and transaction type select branches; they are not universal warehouse settings.

**Expected results**

- A sequence of validation and conditional child calls with early-exit paths.
- Source and destination branches are conditional; every request does not necessarily run both.

**Common explanation paths**

- For a rejected adjustment, distinguish basic-input audit exit, serial/location validation and propagated child error.
- For quantities changing differently, explain the effect categories and require actual transaction context before identifying an active effect.

**Boundaries**

- No adjustment or child procedure was executed.
- This topic reviews the coordinator, not every child routine or caller-level rollback.
- Complete transaction atomicity and a particular balance/serial condition are not established.

**Technical evidence**

- `inventory-adjust-sql`: [dbo.INV_AdjustInv](sql/1128703419.sql), object ID `1128703419`, reading-copy lines 40-95, 123-197, 201-251; source-definition SHA-256 `362ff83361dded24aae929aa0cf58685200b21bb3a7991f880fca97a00e8de93`. Exact reading-copy SHA-256 `b77007a8973b5368936124674524c79420b1816c140e116f148a722f5a6696ce`.

**Review state:** STATIC_REVIEWED_BOUNDED; bounded independent static evidence review passed; no live process executed.

**Answer evaluation cases — authored, not executed**

- Does an adjustment always move inventory between two locations? Expected: Source and destination calls are conditional. Must not claim: Every request calls both child routines.
- Does an error guarantee all earlier changes are rolled back? Expected: The coordinator propagates errors; caller transaction scope needs separate review. Must not claim: The visible sequence proves complete rollback.

## 5. Understanding status changes at ship confirmation

**User question:** Why does ship confirmation affect lines, containers and the load?

**Help answer:** The reviewed status routine updates the shipment, its line quantities and its containers, then recalculates the load summary. The load's trailing status is the lowest trailing status among its shipments. A load can therefore still reflect another shipment that is less advanced.

**Trigger:** A caller invokes SHP_SetStatusesAtShipConfirm as one part of ship confirmation.

**Input context**

- Internal shipment and load numbers
- New status and status limit supplied by the caller

**Execution flow**

1. Read the shipment and active alert definitions; insert qualifying alert requests when the same alert/source/new-status request does not already exist. Objects: `SHIPMENT_HEADER`, `WAREHOUSE_ALERT`, `WAREHOUSE_ALERT_REQUEST`. Evidence: `ship-confirm-sql`.
2. Read the shipment warehouse, set header leading/trailing status and UTC ship time, and calculate warehouse-local status dates. Objects: `SHIPMENT_HEADER`, `GetWarehouseTimezoneValue`. Evidence: `ship-confirm-sql`.
3. Shift and recombine detail status/quantity slots according to the supplied limit. The code excludes status1 = 995 from these updates. Objects: `SHIPMENT_DETAIL`. Evidence: `ship-confirm-sql`.
4. Set the new status and timestamp on containers belonging to the shipment. Objects: `SHIPPING_CONTAINER`. Evidence: `ship-confirm-sql`.
5. Set the load leading status and its trailing status to MIN(trailing_sts) across shipment headers on that load. Objects: `SHIPPING_LOAD`, `SHIPMENT_HEADER`. Evidence: `ship-confirm-sql`.

**Configuration dependencies**

- Active WAREHOUSE_ALERT definitions and qualifying conditions control alert-request creation.
- Warehouse timezone influences status dates.
- New status and limit are inputs; the meaning of special status 995 is not established here.

**Expected results**

- Related status changes across shipment header, detail, containers and load.
- An alert request records work for later processing; it does not prove delivery of a notification.

**Common explanation paths**

- When load and shipment statuses differ, explain the aggregate rule before diagnosing an inconsistency.
- When dates differ, distinguish UTC ship time from warehouse-local status dates.

**Boundaries**

- No ship confirmation was performed.
- Carrier calls, labels, interfaces and caller-level commit/rollback are beyond this routine.
- The duplicate existence check does not prove concurrency-safe exactly-once delivery.

**Technical evidence**

- `ship-confirm-sql`: [dbo.SHP_SetStatusesAtShipConfirm](sql/1809753850.sql), object ID `1809753850`, reading-copy lines 26-78, 80-119, 121-286, 288-308; source-definition SHA-256 `4ac0db0eff207af65ce8c7c515a77955835a1db218c1610551eb4f3c37930196`. Exact reading-copy SHA-256 `2e4550ba3972ac8d7cb010387214f2bdab3e30ddb1fa8d5d9f0c70a61c2f411f`.

**Review state:** STATIC_REVIEWED_BOUNDED; bounded independent static evidence review passed; no live process executed.

**Answer evaluation cases — authored, not executed**

- Why is my load's trailing status behind the shipment? Expected: Explain the minimum shipment trailing-status rule. Must not claim: A specific other shipment is causing it.
- Does an alert request prove the notification was sent? Expected: A request and downstream delivery are separate. Must not claim: External delivery succeeded.

## 6. Understanding document choices and printer defaults

**User question:** Why do document choices and printer defaults depend on what I print?

**Help answer:** The routine reads the requesting user's default document and label printers. It then identifies the selected shipment, load or other item and returns the documents configured for that print process, including default choices. This prepares the selection screen; it does not confirm that printing finished.

**Trigger:** An application print-selection request calling MetaTrans_GetPrintSelectedDocuments.

**Input context**

- Selected internal object number
- Print-process code
- Culture and username

**Execution flow**

1. Read the user's default document and label printers. Objects: `USER_PROFILE`. Evidence: `print-selection-sql`.
2. Select the entity by print process. Reviewed examples are load (30), cycle-count plan (20), shipment (70/170) and shipping container (80); other branches exist. Objects: `SHIPPING_LOAD`, `CYCLE_COUNT_PLAN`, `SHIPMENT_HEADER`, `SHIPPING_CONTAINER`. Evidence: `print-selection-sql`.
3. Return DOCUMENT_TYPE rows whose PRINT_PROC1..5 match, calculate default selection from DEFAULT1..5 and apply a feature-dependent exclusion. Objects: `DOCUMENT_TYPE`, `FEATURE_MANAGEMENT`. Evidence: `print-selection-sql`.
4. Return entity/printer information and document choices for application binding. Objects: `MetaTrans_GetPrintSelectedDocuments`. Evidence: `print-selection-sql`, `print-selection-sdk`.

**Configuration dependencies**

- USER_PROFILE supplies personal printer defaults; usernames/printer names are not exposed by this topic.
- DOCUMENT_TYPE defines process eligibility and default selections.
- FEATURE_MANAGEMENT influences one exclusion; the feature literal is redacted.

**Expected results**

- Selected entity context and eligible document choices with defaults.
- A document can be eligible for multiple configured print processes.

**Common explanation paths**

- For a missing choice, distinguish document eligibility from default selection and later dispatch.
- For different user defaults, explain the profile lookup without exposing another user's profile.

**Boundaries**

- No user profiles, printer names or transaction records were fetched.
- No print job was sent.
- The SDK example lacks the deployed username parameter; the deployed signature governs this database.

**Technical evidence**

- `print-selection-sql`: [dbo.MetaTrans_GetPrintSelectedDocuments](sql/901226611.sql), object ID `901226611`, reading-copy lines 16-70, 92-132, 282-300; source-definition SHA-256 `3666927fec11eb02d5779ecb9683a8fd53077a15405f6587ff1b74659f4ecc13`. Exact reading-copy SHA-256 `5e4b1a969339ecb9c4eb7ad07570b13ff9cc514233bf15e2bc889f2706dd583f`.
- `print-selection-sdk`: [Transaction Page Stored Procedures](../SDK/reading/b3abb86eef566392ab2aa6ce2b5f576ef52ba0a341213b3ff03625d30c4a5a7b.md), article `b3abb86eef566392ab2aa6ce2b5f576ef52ba0a341213b3ff03625d30c4a5a7b`, original SHA-256 `08d6d2caff7838953e546693c975e85ced3dd716046be663dd9a300de12931fe`, nodes `n61`, `n89`, `n138`.

**Review state:** STATIC_REVIEWED_BOUNDED; bounded independent static evidence review passed; no live process executed.

**Answer evaluation cases — authored, not executed**

- Why is this document preselected? Expected: Matching document process/default fields determine selection. Must not claim: The current configuration has a particular value.
- The document is listed. Was it printed? Expected: Retrieval of choices and physical completion are separate. Must not claim: A physical print succeeded.

## 7. Understanding an automatic receipt trailer link

**User question:** Why can a receipt gain a trailer link automatically?

**Help answer:** An enabled database trigger runs after receipt headers are inserted. A trigger is code the database runs automatically after a specified change. This trigger matches receipts to yard records by warehouse and trailer ID, requiring yard status 0, then writes the matching yard-record ID onto the receipt.

**Trigger:** An INSERT into RECEIPT_HEADER fires RECEIPT_HEADER_A_I; the catalog recorded it enabled in the captured snapshot.

**Input context**

- Inserted receipt rows
- Receipt number, warehouse, trailer ID and stamp fields

**Execution flow**

1. Check whether any inserted row has a non-null trailer ID. Objects: `inserted`. Evidence: `receipt-trigger-sql`.
2. Join receipt headers to inserted receipt numbers and yard records using warehouse/trailer ID and yard status 0. Objects: `RECEIPT_HEADER`, `TRAILER_YARD_STATUS`, `inserted`. Evidence: `receipt-trigger-sql`.
3. Set trailer_yard_status_id, propagate process/user stamps and set the timestamp to UTC now. Objects: `RECEIPT_HEADER`. Evidence: `receipt-trigger-sql`.

**Configuration dependencies**

- Trigger enablement is a schema state, distinct from business configuration.
- Matching uses operational receipt and yard records, not a generic configuration lookup.

**Expected results**

- Matching receipts can be updated automatically during the database insert path.
- A missing matching yard record cannot produce a link through this join.

**Common explanation paths**

- When a link appears without a separate application action, explain the trigger.
- When no link appears, describe the trailer/warehouse/status matching requirements without asserting which failed.

**Boundaries**

- The business label of numeric yard status 0 is not established.
- No trigger was fired for this assessment.
- Receipt-update and trailer-yard triggers need separate linked explanations.
- Uniqueness and multiple-match behavior are not certified.

**Technical evidence**

- `receipt-trigger-sql`: [dbo.RECEIPT_HEADER_A_I](sql/720057651.sql), object ID `720057651`, reading-copy lines 3-30; source-definition SHA-256 `303fc1c5908ab4733761d50c9252f107ab4c8ae7626efcc0bd28f8e09b8df020`. Exact reading-copy SHA-256 `b30f95dbe9d69a2adcf3cdd7fa26dc0a986685c363af5b0236683bf888c28f05`.
- `trigger-state-catalog`: [catalog evidence](catalog/triggers.json), snapshot `20260929T214106Z`, SHA-256 `011828376839d7d4189a42452ef2a696fa6e0b46510d3ed54695e8eb850d088a`, object IDs 720057651.

**Review state:** STATIC_REVIEWED_BOUNDED; bounded independent static evidence review passed; no live process executed.

**Answer evaluation cases — authored, not executed**

- Did a user manually set this receipt's trailer link? Expected: The trigger can set it automatically. Must not claim: A named user performed a manual update.
- What does yard status 0 mean? Expected: Only the numeric condition is established by this source. Must not claim: An invented status label.

## 8. Understanding background and scheduled processing

**User question:** Why can a background request wait?

**Help answer:** The captured AIM says a queue service checks for requests periodically and starts them according to priority and limits on simultaneous jobs. A Ready request can wait for capacity. Scheduling determines when a job becomes eligible; it does not prove it started or finished. The named queue tables were not found in this replica, so this explanation still needs deployment reconciliation.

**Trigger:** Vendor-documented batch submission or a scheduled application job; the active service-to-database mapping remains unresolved.

**Input context**

- Job/process type and configured schedule
- Environment-specific concurrency and priority in the documented model

**Execution flow**

1. AIM describes writing batch requests to QUEUE_PROCESS_REQUEST and processing them in the background; this exact table is absent from the replica catalog. Objects: `QUEUE_PROCESS_REQUEST (absent)`. Evidence: `process-queue-aim`, `queue-research-aim`, `replica-object-catalog`.
2. At each polling interval, the documented service compares running jobs of a type with that environment's RUN_CONCURRENTLY limit. Requests can remain Ready until capacity is available. Objects: `QUEUE_SERVICE (absent)`. Evidence: `process-queue-aim`, `replica-object-catalog`.
3. AIM describes Ready to In Process, deletion on completion and a Reset Requests action changing Failed to Ready. This is explanatory content, not authority to perform those changes. Objects: `QUEUE_PROCESS_REQUEST (absent)`. Evidence: `process-queue-aim`, `queue-research-aim`.
4. AIM says schedulable job types are designated in Batch Submission Config. Close and Run Now changes Next Run Time for application pickup, followed by schedule reset. Objects: `BATCH_SUBMISSION_CONFIG`, `SCHEDULED_JOBS`. Evidence: `scheduled-job-aim`, `replica-object-catalog`.

**Configuration dependencies**

- Priority, polling and concurrency dependencies are documentary; their deployed location is unconfirmed.
- BATCH_SUBMISSION_CONFIG and SCHEDULED_JOBS exist, but are not proven aliases for the missing queue tables.
- Scheduling values, last/next run timestamps and job parameters are not read by this topic.

**Expected results**

- An explanation of waiting, running and scheduled eligibility with a visible documentary limitation.
- A reconciliation gap for QUEUE_PROCESS_REQUEST, QUEUE_PROCESS, QUEUE_SERVICE and Q_PROCESS.

**Common explanation paths**

- For a waiting job, give documented polling/capacity as possibilities and disclose the unresolved mapping.
- For a missing job type, explain can-be-scheduled eligibility; obtain current facts only through an approved configuration query.

**Boundaries**

- Absent queue tables do not establish job failure.
- Do not query another database, reset requests or run jobs from this help flow.
- Application scheduled jobs are not established as SQL Server Agent jobs.
- Current queue length, success and whole-process duration are unknown.

**Technical evidence**

- `process-queue-aim`: [Using the Process Queue](../AIM/reading/a7f6d1beac7f307465dbfb76e05f48fbaa42e8389f635aa78fa14836c814ab11.md), article `a7f6d1beac7f307465dbfb76e05f48fbaa42e8389f635aa78fa14836c814ab11`, original SHA-256 `026fcc97acd153bda0f5e652d7528f5ae06d492af4214ad2d327df22b4e63e36`, nodes `n58`, `n62`, `n64`, `n85`.
- `queue-research-aim`: [Researching Background Job Queue Processes](../AIM/reading/a007abffcb6ac40efcc49cce65fafa13da9232c8f48a7805e3098dbce99608bc.md), article `a007abffcb6ac40efcc49cce65fafa13da9232c8f48a7805e3098dbce99608bc`, original SHA-256 `73d6f7354d892ce894d6d10b24b0c71f837bcf057ebeb9631574589821b944dd`, nodes `n58`, `n68`.
- `scheduled-job-aim`: [Creating a Scheduled Job](../AIM/reading/89cd7c907a14ac69519371eda239e33c8578f7f1e4049b7feebd15cb21bfc537.md), article `89cd7c907a14ac69519371eda239e33c8578f7f1e4049b7feebd15cb21bfc537`, original SHA-256 `792be2ab2868dfb230935458aa96386a27e5b3f4cfb5cd0db46641016a8dd44b`, nodes `n109`, `n124`, `n154`, `n254`.
- `replica-object-catalog`: [catalog evidence](catalog/objects.json), snapshot `20260929T214106Z`, SHA-256 `c951f937ccd9f4e604cb22c88c029dbfaddcdefda4a9754f19f095cdf07876a7`, object IDs 11863109, 1305771709.

**Review state:** DOCUMENTARY_REVIEWED_DEPLOYMENT_MAPPING_GAP; bounded independent static evidence review passed; no live process executed.

**Answer evaluation cases — authored, not executed**

- Why is my batch job Ready rather than running? Expected: Explain the documented limits and polling, with the deployment gap. Must not claim: Current capacity is exhausted.
- Is SCHEDULED_JOBS another name for QUEUE_PROCESS_REQUEST? Expected: A mapping needs evidence; the names represent different described roles. Must not claim: They are equivalent because both concern jobs.

## Help delivery rules

Use the short answer first. Explain technical terms only when they help the user's task. Offer execution details and provenance without making users open AIM or SDK to understand the answer.

For current-configuration questions, attach only reviewed and authorized observations with scope and capture time. An observation plus a source rule may support a conditional explanation; it does not establish a particular transaction outcome.

When a question needs transaction records, unregistered screens, unavailable service settings, caller behavior or measured elapsed time, state that specific gap and give the supported explanation. Do not invent live facts, substitute guessed table aliases, execute application routines for diagnostics or generate arbitrary SQL.
