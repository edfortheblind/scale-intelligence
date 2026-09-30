# SCALE functionality help topics

201 bounded help topics; 437 authored evaluation cases. These reviewed explanations are also served by the local help prototype. Deployment reconciliation remains incomplete.

Answers follow what it does, what happens, what can affect it, what you can check, and sources. Screen names in sources are documentary references; verified Insight navigation and SOPs remain separate. No process, label, job or transaction was executed. Browser, keyboard, screen-reader and intended-user acceptance remain unperformed.

The [JSON library](mappings/help-topics.json) is the curated source for this reading copy. Configuration observations retain their [scope and capture time](CONFIGURATION_VALIDATION.md).

## 1. Understanding shipment detail fields

**Question:** Why can a shipment summary field be blank?

**What it does.** The summary combines the shipment header, containers, dock door and shipment lines. For some line-level fields, SCALE returns a blank summary when the lines contain different non-null values. A blank summary therefore does not always mean information is missing.

**What happens**

Trigger: An application detail-pane request bound to SHP_InsightDetailPaneData. The SDK documents the binding pattern; the active screen binding is not established.

1. Read the shipment header view and call the status-name function for leading and trailing status. Evidence: `shipment-detail-sql`.
2. Count containers whose tree-unit number equals their internal container number, filtered to the shipment. Evidence: `shipment-detail-sql`.
3. Assign a dock-door number through the shipment-view/load join, then read LOCATION. This assignment has no shipment WHERE filter in the captured statement; it is a source-review concern. Evidence: `shipment-detail-sql`.
4. For USER_DEF1..6, INVOICE and PICK_LIST_ID, return NULL when COUNT(DISTINCT field) exceeds one; otherwise return MIN(field). Evidence: `shipment-detail-sql`.

**What can affect it**

- Screen binding determines whether this routine supplies the pane.
- The SDK explains culture-based resources; passing culture does not establish that every deployed field is localized.

**What you can check**

- A blank summary can result from differing line values, all-null values or no matching detail rows. These possibilities do not identify the cause for a specific shipment.
- For an unexpected dock door, the unfiltered assignment is a source-review lead; no incorrect screen result was reproduced.

**Expected results and limits**

- Four SELECT result sets: header, parent-container count, dock-door information and detail-derived summary values.
- The local dock-door variable assignment does not emit a fifth result set.
- No shipment records were read.
- The SDK example and deployed signature differ; the deployed contract governs this database.
- Current screen paths and bindings have not been registered.

**More detail and sources**

`shipment-detail-sql`: [dbo.SHP_InsightDetailPaneData](sql/1633753223.sql); source-definition SHA-256 `78364f898a329680b446b42f8071be5d2d79484a1592c4108f91a36096650147`, reading-copy SHA-256 `91be70e93fcaf6cd46bdc9ff8ae8fb5923ba31e252460dcaf62dd1e520a7342c`, one-based inclusive lines [[40, 88]].

`shipment-detail-sdk`: [How to: Create a Detail Pane Stored Procedure](../SDK/reading/35cdfcbe2823f6394fe2644f35985b4dd4c0b5f9cf4e66f1d6d0d8f7fa5b8339.md); SDK article `35cdfcbe2823f6394fe2644f35985b4dd4c0b5f9cf4e66f1d6d0d8f7fa5b8339`, original SHA-256 `6c46ec3389ead3049deb0ff074e7dad5e36fa23163455fd4aa8613a44804200a`, nodes n47, n80, n414.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PASS_BOUNDED_STATIC_EVIDENCE_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Why is the invoice blank in my summary? Expected: Explain the mixed-value rule and other null possibilities. Must not claim: A particular shipment has conflicting invoices.
- Does the routine return five result sets? Expected: It returns four; a variable-assignment SELECT is not a result set. Must not claim: Five SELECT statements necessarily produce five results.

## 2. Understanding work monitor totals

**Question:** Why are work units, instructions and recently closed work different numbers?

**What it does.** A work unit can contain several instructions. The group monitor counts distinct work units for chart groups, sums distinct-unit counts within conditions for its total, and counts instruction rows separately. Recently closed instructions come from active and inactive storage within a rolling one-hour timestamp window. Estimated time is stored planning data, not measured elapsed duration.

**What happens**

Trigger: An authorized application request to the named routines; active screen bindings/caller order are not established.

1. Parse warehouse filter and build the nonclosed detail-instruction chart. Evidence: `work-batch-1082799265`, `work-batch-172579703`, `work-monitor-sdk-batch`, `work-monitor-aim-batch`.
2. Compute condition-grouped units, instructions and estimated time. Evidence: `work-batch-1082799265`, `work-batch-172579703`, `work-monitor-sdk-batch`, `work-monitor-aim-batch`.
3. Count recently stamped closed details in active plus inactive storage, then return six summary values after the chart. Evidence: `work-batch-1082799265`, `work-batch-172579703`, `work-monitor-sdk-batch`, `work-monitor-aim-batch`.

**What can affect it**

- Identify warehouse, grouping, condition, counting unit and rolling time window.
- Check missing or duplicate filters before interpreting an empty result; no user-specific diagnostic was executed.

**What you can check**

- Identify the applicable branch, input/filter scope and configuration before attributing a result to a particular user.
- Identify warehouse, grouping, condition, counting unit and rolling time window.
- Check missing or duplicate filters before interpreting an empty result; no user-specific diagnostic was executed.

**Expected results and limits**

- Seven result sets. Empty data can yield NULL for some SUM totals, zero estimated time and zero recent-closed count.
- A missing filter is not evidence of an empty warehouse.
- The timestamp predicate does not establish exact completion-event time or throughput.
- The SDK example and deployment have different result-set counts.
- No operational rows or procedures were executed. Current configuration, runtime timing and screen navigation remain unverified.

**More detail and sources**

`work-batch-1082799265`: [dbo.WRK_MonitorWorkGroupChartData](sql/1082799265.sql); source-definition SHA-256 `9f39d9614e0eb5eebcc4bb6ca304351d4e35a8f0ad00e6dad950ac84e308b92f`, reading-copy SHA-256 `5a34e088b302084eeb2eae90fbfc0726d3a11cf9282f597ac5eab59d37d91e13`, one-based inclusive lines [[1, 79]].

`work-batch-172579703`: [dbo.WORK_INSTRUCTION_VIEW](sql/172579703.sql); source-definition SHA-256 `8e8dadbd10a8e2f71f85701252fe2cec66c136c883e63de03dc7a6277e777a9d`, reading-copy SHA-256 `f8ad80899fdf8de790c7a4e5df028bf9981cc3f774a55f1a3f99538f86e109c2`, one-based inclusive lines [[1, 9]].

`work-monitor-sdk-batch`: [How to: Create Monitor Page Stored Procedure](../SDK/reading/2f1e464b919bbe6d9db8cf9f7a2eb6d5cfd5866b662fd85c0ef3c9c02005b000.md); SDK article `2f1e464b919bbe6d9db8cf9f7a2eb6d5cfd5866b662fd85c0ef3c9c02005b000`, original SHA-256 `8ffbb7c80b927b1c7e10e600060b6bf4e40ee562531deb705745193a32d6fd60`, nodes n47, n56, n59, n62, n97.

`work-monitor-aim-batch`: [Using the Work Monitoring: Group Screen](../AIM/reading/b77c848bec2898b6a573aa878319bb07181352908f6b6a8fa4c55b919d5c310c.md); AIM article `b77c848bec2898b6a573aa878319bb07181352908f6b6a8fa4c55b919d5c310c`, original SHA-256 `e7454d5ac265ba5499c91ce066c85d0f11970444a47dbdeff73646aa726d66ad`, nodes n58, n60, n64, n114, n122.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Why are empty totals partly blank? Expected: SUM can be NULL while COUNT and the ISNULL estimate are zero. Must not claim: No data always returns seven zero values.
- Did recently closed work disappear? Expected: The rolling timestamp window and storage filters matter. Must not claim: Work has been lost.

## 3. Understanding which work is offered

**Question:** Why can two users receive different work?

**What it does.** SCALE offers work using the supplied user, warehouse, work profile, locations, containers and feature settings. A work profile is a set of execution rules. Some branches prefer assigned work, apply location/priority order or limit the candidate list. Cart selection can also rewrite instruction sequence, so this procedure must not be run as a read-only diagnostic.

**What happens**

Trigger: An authorized application request to the named routines; active screen bindings/caller order are not established.

1. Cart regrouping can calculate and persist detail-instruction sequence before selecting candidates. Evidence: `work-batch-51843597`, `work-batch-680701823`, `work-profile-aim-batch`.
2. Read profile/sequence options, authorization and features, then build eligibility and ordering. Evidence: `work-batch-51843597`, `work-batch-680701823`, `work-profile-aim-batch`.
3. In eligible system-directed branches, probe priority and exact/greater/lower locations before executing the final parameter-bound candidate query. Evidence: `work-batch-51843597`, `work-batch-680701823`, `work-profile-aim-batch`.

**What can affect it**

- Some options are read by profile alone while others also use the supplied sequence; multiple sequence rows can therefore matter.
- Missing or invalid top-row cap falls back to 2000 in the relevant performance branch; this does not identify its configured value.
- An approved aggregate flag check cannot identify an individual operator's active profile.

**What you can check**

- Identify the applicable branch, input/filter scope and configuration before attributing a result to a particular user.
- Some options are read by profile alone while others also use the supplied sequence; multiple sequence rows can therefore matter.
- Missing or invalid top-row cap falls back to 2000 in the relevant performance branch; this does not identify its configured value.
- An approved aggregate flag check cannot identify an individual operator's active profile.

**Expected results and limits**

- Branch-dependent work candidates and ordering; cart branch may first update stored sequence.
- AIM describes profiles and ordered sequences generally. This procedure does not itself advance through all profile sequences.
- Configured sort expressions and private business-code enumerations remain bounded review gaps; performance/legacy path equivalence is unproven.
- No operational rows or procedures were executed. Current configuration, runtime timing and screen navigation remain unverified.

**More detail and sources**

`work-batch-51843597`: [dbo.WRK_GetWorkInstructionsForExecution](sql/51843597.sql); source-definition SHA-256 `eca08945d5ab9ce42fdf8c01403853dd3addf9a62075e31053e20732f7db87cf`, reading-copy SHA-256 `337a1793a82284ecd9d2c95352ab086d5ee8dae4e6e6a8d6025a62198c6678b0`, one-based inclusive lines [[1, 752]].

`work-batch-680701823`: [dbo.fn_GetFeatureEnabled](sql/680701823.sql); source-definition SHA-256 `097700a5c953e7c7e7ad3c9c07e33ce4fb97ed8c874ce1742e50ca9a6561f8b6`, reading-copy SHA-256 `77e132ef10237d4ba41dc2326eb114aa18def1a75579f7db4b065d6856aa260e`, one-based inclusive lines [[1, 19]].

`work-profile-aim-batch`: [Work Profile Configuration](../AIM/reading/c8c2ec9d410d0d0b34795db2c5e9739a523f1f43dcff53a075dd003d3728b917.md); AIM article `c8c2ec9d410d0d0b34795db2c5e9739a523f1f43dcff53a075dd003d3728b917`, original SHA-256 `0fcfb997f9066a6d12582752fc7bf54ee9dcd66684b04d9089ee43de8758be90`, nodes n60, n63, n65.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Can support run work selection just to inspect configuration? Expected: It can mutate cart instruction sequence. Must not claim: The procedure is read-only.
- Does a missing cap mean unlimited work? Expected: The reviewed cap falls back to 2000 in the gated branch. Must not claim: Every query always returns 2000 rows.
- Does a profile select one deterministic detail row? Expected: Some reads lack sequence and ordering; distinguish their scope. Must not claim: Every profile-wide field came from the supplied sequence.

## 4. Understanding an inventory adjustment

**Question:** Why can one inventory adjustment involve several operations?

**What it does.** An adjustment can affect source quantities, destination quantities and serial numbers. The reviewed routine checks inputs and then calls the operations required by its quantity-effect flags. These flags specify which quantity categories should change. It is therefore more than editing one quantity field.

**What happens**

Trigger: A caller submits INV_AdjustInv with transaction and source/destination context.

1. If quantity is null/zero, both locations are null or item is null, create an audit message, call ADT_LogAudit and return before adjustment calls. Evidence: `inventory-adjust-sql`.
2. Convert dates, normalize zero attribute IDs and conditionally read serial-tracking/location-class rules; raise errors for coded disallowed combinations. Evidence: `inventory-adjust-sql`.
3. When the serial argument/effect conditions apply, validate and pick serial numbers, returning nonzero child codes immediately. Evidence: `inventory-adjust-sql`.
4. When source effect flags match, call INV_PickFromLocation and propagate SQL or nonzero child errors. Evidence: `inventory-adjust-sql`.
5. When destination flags match, call INV_PutIntoLocation with source attributes passed forward, then conditionally put serial numbers. Evidence: `inventory-adjust-sql`.

**What can affect it**

- ITEM serial tracking and LOCATION class affect conditional validation; those records were not read.
- Caller-supplied effect flags and transaction type select branches; they are not universal warehouse settings.

**What you can check**

- For a rejected adjustment, distinguish basic-input audit exit, serial/location validation and propagated child error.
- For quantities changing differently, explain the effect categories and require actual transaction context before identifying an active effect.

**Expected results and limits**

- A sequence of validation and conditional child calls with early-exit paths.
- Source and destination branches are conditional; every request does not necessarily run both.
- No adjustment or child procedure was executed.
- This topic reviews the coordinator, not every child routine or caller-level rollback.
- Complete transaction atomicity and a particular balance/serial condition are not established.

**More detail and sources**

`inventory-adjust-sql`: [dbo.INV_AdjustInv](sql/1128703419.sql); source-definition SHA-256 `362ff83361dded24aae929aa0cf58685200b21bb3a7991f880fca97a00e8de93`, reading-copy SHA-256 `b77007a8973b5368936124674524c79420b1816c140e116f148a722f5a6696ce`, one-based inclusive lines [[40, 95], [123, 197], [201, 251]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PASS_BOUNDED_STATIC_EVIDENCE_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does an adjustment always move inventory between two locations? Expected: Source and destination calls are conditional. Must not claim: Every request calls both child routines.
- Does an error guarantee all earlier changes are rolled back? Expected: The coordinator propagates errors; caller transaction scope needs separate review. Must not claim: The visible sequence proves complete rollback.

## 5. Understanding status changes at ship confirmation

**Question:** Why does ship confirmation affect lines, containers and the load?

**What it does.** The reviewed status routine updates the shipment, its line quantities and its containers, then recalculates the load summary. The load's trailing status is the lowest trailing status among its shipments. A load can therefore still reflect another shipment that is less advanced.

**What happens**

Trigger: A caller invokes SHP_SetStatusesAtShipConfirm as one part of ship confirmation.

1. Read the shipment and active alert definitions; insert qualifying alert requests when the same alert/source/new-status request does not already exist. Evidence: `ship-confirm-sql`.
2. Read the shipment warehouse, set header leading/trailing status and UTC ship time, and calculate warehouse-local status dates. Evidence: `ship-confirm-sql`.
3. Shift and recombine detail status/quantity slots according to the supplied limit. The code excludes status1 = 995 from these updates. Evidence: `ship-confirm-sql`.
4. Set the new status and timestamp on containers belonging to the shipment. Evidence: `ship-confirm-sql`.
5. Set the load leading status and its trailing status to MIN(trailing_sts) across shipment headers on that load. Evidence: `ship-confirm-sql`.

**What can affect it**

- Active WAREHOUSE_ALERT definitions and qualifying conditions control alert-request creation.
- Warehouse timezone influences status dates.
- New status and limit are inputs; the meaning of special status 995 is not established here.

**What you can check**

- When load and shipment statuses differ, explain the aggregate rule before diagnosing an inconsistency.
- When dates differ, distinguish UTC ship time from warehouse-local status dates.

**Expected results and limits**

- Related status changes across shipment header, detail, containers and load.
- An alert request records work for later processing; it does not prove delivery of a notification.
- No ship confirmation was performed.
- Carrier calls, labels, interfaces and caller-level commit/rollback are beyond this routine.
- The duplicate existence check does not prove concurrency-safe exactly-once delivery.

**More detail and sources**

`ship-confirm-sql`: [dbo.SHP_SetStatusesAtShipConfirm](sql/1809753850.sql); source-definition SHA-256 `4ac0db0eff207af65ce8c7c515a77955835a1db218c1610551eb4f3c37930196`, reading-copy SHA-256 `2e4550ba3972ac8d7cb010387214f2bdab3e30ddb1fa8d5d9f0c70a61c2f411f`, one-based inclusive lines [[26, 78], [80, 119], [121, 286], [288, 308]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PASS_BOUNDED_STATIC_EVIDENCE_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Why is my load's trailing status behind the shipment? Expected: Explain the minimum shipment trailing-status rule. Must not claim: A specific other shipment is causing it.
- Does an alert request prove the notification was sent? Expected: A request and downstream delivery are separate. Must not claim: External delivery succeeded.

## 6. Understanding document choices and printer defaults

**Question:** Why do document choices and printer defaults depend on what I print?

**What it does.** The routine reads the requesting user's default document and label printers. It then identifies the selected shipment, load or other item and returns the documents configured for that print process, including default choices. This prepares the selection screen; it does not confirm that printing finished.

**What happens**

Trigger: An application print-selection request calling MetaTrans_GetPrintSelectedDocuments.

1. Read the user's default document and label printers. Evidence: `print-selection-sql`.
2. Select the entity by print process. Reviewed examples are load (30), cycle-count plan (20), shipment (70/170) and shipping container (80); other branches exist. Evidence: `print-selection-sql`.
3. Return DOCUMENT_TYPE rows whose PRINT_PROC1..5 match, calculate default selection from DEFAULT1..5 and apply a feature-dependent exclusion. Evidence: `print-selection-sql`.
4. Return entity/printer information and document choices for application binding. Evidence: `print-selection-sql`, `print-selection-sdk`.

**What can affect it**

- USER_PROFILE supplies personal printer defaults; usernames/printer names are not exposed by this topic.
- DOCUMENT_TYPE defines process eligibility and default selections.
- FEATURE_MANAGEMENT influences one exclusion; the feature literal is redacted.

**What you can check**

- For a missing choice, distinguish document eligibility from default selection and later dispatch.
- For different user defaults, explain the profile lookup without exposing another user's profile.

**Expected results and limits**

- Selected entity context and eligible document choices with defaults.
- A document can be eligible for multiple configured print processes.
- No user profiles, printer names or transaction records were fetched.
- No print job was sent.
- The SDK example lacks the deployed username parameter; the deployed signature governs this database.

**More detail and sources**

`print-selection-sql`: [dbo.MetaTrans_GetPrintSelectedDocuments](sql/901226611.sql); source-definition SHA-256 `3666927fec11eb02d5779ecb9683a8fd53077a15405f6587ff1b74659f4ecc13`, reading-copy SHA-256 `5e4b1a969339ecb9c4eb7ad07570b13ff9cc514233bf15e2bc889f2706dd583f`, one-based inclusive lines [[16, 70], [92, 132], [282, 300]].

`print-selection-sdk`: [Transaction Page Stored Procedures](../SDK/reading/b3abb86eef566392ab2aa6ce2b5f576ef52ba0a341213b3ff03625d30c4a5a7b.md); SDK article `b3abb86eef566392ab2aa6ce2b5f576ef52ba0a341213b3ff03625d30c4a5a7b`, original SHA-256 `08d6d2caff7838953e546693c975e85ced3dd716046be663dd9a300de12931fe`, nodes n61, n89, n138.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PASS_BOUNDED_STATIC_EVIDENCE_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Why is this document preselected? Expected: Matching document process/default fields determine selection. Must not claim: The current configuration has a particular value.
- The document is listed. Was it printed? Expected: Retrieval of choices and physical completion are separate. Must not claim: A physical print succeeded.

## 7. Understanding an automatic receipt trailer link

**Question:** Why can a receipt gain a trailer link automatically?

**What it does.** An enabled database trigger runs after receipt headers are inserted. A trigger is code the database runs automatically after a specified change. This trigger matches receipts to yard records by warehouse and trailer ID, requiring yard status 0, then writes the matching yard-record ID onto the receipt.

**What happens**

Trigger: An INSERT into RECEIPT_HEADER fires RECEIPT_HEADER_A_I; the catalog recorded it enabled in the captured snapshot.

1. Check whether any inserted row has a non-null trailer ID. Evidence: `receipt-trigger-sql`.
2. Join receipt headers to inserted receipt numbers and yard records using warehouse/trailer ID and yard status 0. Evidence: `receipt-trigger-sql`.
3. Set trailer_yard_status_id, propagate process/user stamps and set the timestamp to UTC now. Evidence: `receipt-trigger-sql`.

**What can affect it**

- Trigger enablement is a schema state, distinct from business configuration.
- Matching uses operational receipt and yard records, not a generic configuration lookup.

**What you can check**

- When a link appears without a separate application action, explain the trigger.
- When no link appears, describe the trailer/warehouse/status matching requirements without asserting which failed.

**Expected results and limits**

- Matching receipts can be updated automatically during the database insert path.
- A missing matching yard record cannot produce a link through this join.
- The business label of numeric yard status 0 is not established.
- No trigger was fired for this assessment.
- Receipt-update and trailer-yard triggers need separate linked explanations.
- Uniqueness and multiple-match behavior are not certified.

**More detail and sources**

`receipt-trigger-sql`: [dbo.RECEIPT_HEADER_A_I](sql/720057651.sql); source-definition SHA-256 `303fc1c5908ab4733761d50c9252f107ab4c8ae7626efcc0bd28f8e09b8df020`, reading-copy SHA-256 `b30f95dbe9d69a2adcf3cdd7fa26dc0a986685c363af5b0236683bf888c28f05`, one-based inclusive lines [[3, 30]].

`trigger-state-catalog`: [DB Architecture/catalog/triggers.json](catalog/triggers.json); SHA-256 `011828376839d7d4189a42452ef2a696fa6e0b46510d3ed54695e8eb850d088a`; objects [720057651].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PASS_BOUNDED_STATIC_EVIDENCE_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Did a user manually set this receipt's trailer link? Expected: The trigger can set it automatically. Must not claim: A named user performed a manual update.
- What does yard status 0 mean? Expected: Only the numeric condition is established by this source. Must not claim: An invented status label.

## 8. Understanding background and scheduled processing

**Question:** Why can a background request wait?

**What it does.** The captured AIM says a queue service checks for requests periodically and starts them according to priority and limits on simultaneous jobs. A Ready request can wait for capacity. Scheduling determines when a job becomes eligible; it does not prove it started or finished. The named queue tables were not found in this replica, so this explanation still needs deployment reconciliation.

**What happens**

Trigger: Vendor-documented batch submission or a scheduled application job; the active service-to-database mapping remains unresolved.

1. AIM describes writing batch requests to QUEUE_PROCESS_REQUEST and processing them in the background; this exact table is absent from the replica catalog. Evidence: `process-queue-aim`, `queue-research-aim`, `replica-object-catalog`.
2. At each polling interval, the documented service compares running jobs of a type with that environment's RUN_CONCURRENTLY limit. Requests can remain Ready until capacity is available. Evidence: `process-queue-aim`, `replica-object-catalog`.
3. AIM describes Ready to In Process, deletion on completion and a Reset Requests action changing Failed to Ready. This is explanatory content, not authority to perform those changes. Evidence: `process-queue-aim`, `queue-research-aim`.
4. AIM says schedulable job types are designated in Batch Submission Config. Close and Run Now changes Next Run Time for application pickup, followed by schedule reset. Evidence: `scheduled-job-aim`, `replica-object-catalog`.

**What can affect it**

- Priority, polling and concurrency dependencies are documentary; their deployed location is unconfirmed.
- BATCH_SUBMISSION_CONFIG and SCHEDULED_JOBS exist, but are not proven aliases for the missing queue tables.
- Scheduling values, last/next run timestamps and job parameters are not read by this topic.

**What you can check**

- For a waiting job, give documented polling/capacity as possibilities and disclose the unresolved mapping.
- For a missing job type, explain can-be-scheduled eligibility; obtain current facts only through an approved configuration query.

**Expected results and limits**

- An explanation of waiting, running and scheduled eligibility with a visible documentary limitation.
- A reconciliation gap for QUEUE_PROCESS_REQUEST, QUEUE_PROCESS, QUEUE_SERVICE and Q_PROCESS.
- Absent queue tables do not establish job failure.
- Do not query another database, reset requests or run jobs from this help flow.
- Application scheduled jobs are not established as SQL Server Agent jobs.
- Current queue length, success and whole-process duration are unknown.

**More detail and sources**

`process-queue-aim`: [Using the Process Queue](../AIM/reading/a7f6d1beac7f307465dbfb76e05f48fbaa42e8389f635aa78fa14836c814ab11.md); AIM article `a7f6d1beac7f307465dbfb76e05f48fbaa42e8389f635aa78fa14836c814ab11`, original SHA-256 `026fcc97acd153bda0f5e652d7528f5ae06d492af4214ad2d327df22b4e63e36`, nodes n58, n62, n64, n85.

`queue-research-aim`: [Researching Background Job Queue Processes](../AIM/reading/a007abffcb6ac40efcc49cce65fafa13da9232c8f48a7805e3098dbce99608bc.md); AIM article `a007abffcb6ac40efcc49cce65fafa13da9232c8f48a7805e3098dbce99608bc`, original SHA-256 `73d6f7354d892ce894d6d10b24b0c71f837bcf057ebeb9631574589821b944dd`, nodes n58, n68.

`scheduled-job-aim`: [Creating a Scheduled Job](../AIM/reading/89cd7c907a14ac69519371eda239e33c8578f7f1e4049b7feebd15cb21bfc537.md); AIM article `89cd7c907a14ac69519371eda239e33c8578f7f1e4049b7feebd15cb21bfc537`, original SHA-256 `792be2ab2868dfb230935458aa96386a27e5b3f4cfb5cd0db46641016a8dd44b`, nodes n109, n124, n154, n254.

`replica-object-catalog`: [DB Architecture/catalog/objects.json](catalog/objects.json); SHA-256 `c951f937ccd9f4e604cb22c88c029dbfaddcdefda4a9754f19f095cdf07876a7`; objects [11863109, 1305771709].

Review: `DOCUMENTARY_REVIEWED_DEPLOYMENT_MAPPING_GAP`. Independent verification: `PASS_BOUNDED_STATIC_EVIDENCE_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Why is my batch job Ready rather than running? Expected: Explain the documented limits and polling, with the deployment gap. Must not claim: Current capacity is exhausted.
- Is SCHEDULED_JOBS another name for QUEUE_PROCESS_REQUEST? Expected: A mapping needs evidence; the names represent different described roles. Must not claim: They are equivalent because both concern jobs.

## 9. Allocation: purpose and processing

**Question:** What does allocation do in SCALE?

**What it does.** Allocation chooses which storage locations will supply a request for product. Work creation then turns the allocated quantity into warehouse tasks.

**What happens**

Trigger: The allocation step runs in a wave before work creation.

1. Apply allocation-rule sequences in numeric order; each sequence combines eligible locations with a selection strategy. Evidence: `family-allocation-aim`.
2. Reserve selected inventory when pick confirmation is used. The documented alternative removes inventory when the load is confirmed. Evidence: `family-allocation-aim`.

**What can affect it**

- Allocation rules combine location selection and strategy. Item and location characteristics can affect selection and ordering.
- Pick-confirmation behavior changes when inventory is removed.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which allocation rule and pick-confirmation mode does the application select for this deployment? Obtain sanitized rule-assignment and wave-step bindings, without inventory or shipment records.

**Expected results and limits**

- Reserve selected inventory when pick confirmation is used. The documented alternative removes inventory when the load is confirmed.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Shipment priority ordering precedes rule selection: shipment line, then item, then *Default. Convert quantities using the item or applicable item-class UOM record, then process numbered rule sequences. Evidence: `process-claim-process-documentary-allocation-r01`.
- Allocation combines immutable eligibility checks with optional location filters and strategy ordering. Available quantity subtracts allocated and suspense quantities; allowing in-transit allocation adds in-transit quantity. A blank location UOM list permits all UOMs. Evidence: `process-claim-process-documentary-allocation-r02`.
- Partial allocation creates requests for fulfilled quantities and tries later sequences. Exhausted rules invoke shipment-splitting and rejection/pool behavior governed by status actions; allocate-complete can reject an entire shipment. The figure labels exhaustion status 999, while prose gives richer status-action branches. Evidence: `process-claim-process-documentary-allocation-r03`.
- Closest Match orders location-inventory records, not summed physical-location totals. Over-allocation from permanent assignments is restricted to shipment allocation, non-LP locations and non-lot items. Thread count is controlled by Technical Values. Evidence: `process-claim-process-documentary-allocation-r04`.

`family-allocation-aim`: [Allocation Process Summary: Functionality](../AIM/reading/a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3.md); AIM article `a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3`, original SHA-256 `4bb0846eaeda14b5bf3a42ee4d3887811eb92d8143191fcdfba8c732c51c2043`, nodes n67, n69, n71, n73, n75.

`process-claim-process-documentary-allocation-r01`: [process-documentary-allocation-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `ddce678160d1a3e22927381b053831b377477a33e443243712846ee10137e534`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-allocation-r02`: [process-documentary-allocation-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `ebb402da0a02a0d83ffaf8def156f6b5e1403b1ab318648a9d0c89190c338182`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-allocation-r03`: [process-documentary-allocation-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `107d777a62be3f49c1234b2a305d099176c8f553a9de9f372cb35374b6ac3754`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-allocation-r04`: [process-documentary-allocation-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `1c08d812c6ee7c298b9a5ec6c071d2db08494629a83964f7d85842e4fc6ec3df`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is allocation for? Expected: Allocation chooses which storage locations will supply a request for product. Work creation then turns the allocated quantity into warehouse tasks. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my allocation result happened? Expected: Which allocation rule and pick-confirmation mode does the application select for this deployment? Obtain sanitized rule-assignment and wave-step bindings, without inventory or shipment records. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 10. Billing Management Integration: purpose and processing

**Question:** What does billing management integration do in SCALE?

**What it does.** The documented integration sends SCALE data to a separate Billing Management application so warehouse work can support third-party charges.

**What happens**

Trigger: A configured integration uploads SCALE data to Billing Management.

1. Upload relevant system data to the separate billing application. Evidence: `family-billing-management-integration-aim`.
2. The billing application calculates, tracks and charges for warehouse work. Evidence: `family-billing-management-integration-aim`.

**What can affect it**

- The integration and the separate billing product must be configured; this summary does not establish field mappings or retry settings.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Is this deployment integrated with Billing Management, and what upload contract applies? Obtain a sanitized integration/version mapping and acknowledgment contract.

**Expected results and limits**

- The billing application calculates, tracks and charges for warehouse work.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- A configured event such as load confirmation triggers processing; manual triggers are also possible. The vendor source describes Billing Management as a separate product and requires SQL Server for this integration. Evidence: `process-claim-process-documentary-billing-management-integration-r01`.
- The active trigger header identifies a root detail with no parent; its data query is mapped into XML, then child details are traversed. Process history records trigger success/failure and output goes to the configured directory for later pickup. Evidence: `process-claim-process-documentary-billing-management-integration-r02`.
- Inline trigger records need a corresponding coded event check; defining a record alone does not create a new trigger point. Manual triggers still require appropriate SQL and the target XML schema. Evidence: `process-claim-process-documentary-billing-management-integration-r03`.

`family-billing-management-integration-aim`: [Billing Management Integration Process Summary: Functionality](../AIM/reading/07dfda3003b2e06f5c5ab468f983c79caca43080bedaf1f3d7554f6321715a41.md); AIM article `07dfda3003b2e06f5c5ab468f983c79caca43080bedaf1f3d7554f6321715a41`, original SHA-256 `de2b53f4e532ff96b20d7797a0d17b4447c55e256519ecab5bf5e786b51d2d92`, nodes n65.

`process-claim-process-documentary-billing-management-integration-r01`: [process-documentary-billing-management-integration-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `36cd26ada91a9778ae47445021417cf98425ae22a440e037c8eed7da11458cbf`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-billing-management-integration-r02`: [process-documentary-billing-management-integration-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `81b7a33564867225e78df82a53ee71ca596ea25505cc329a01763d91178c0d21`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-billing-management-integration-r03`: [process-documentary-billing-management-integration-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `5004dd27baf1dc2a7474f7fa954d457dda2b386c52dd71726632a128de20e601`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is billing management integration for? Expected: The documented integration sends SCALE data to a separate Billing Management application so warehouse work can support third-party charges. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my billing management integration result happened? Expected: Is this deployment integrated with Billing Management, and what upload contract applies? Obtain a sanitized integration/version mapping and acknowledgment contract. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 11. Carrier Management: purpose and processing

**Question:** What does carrier management do in SCALE?

**What it does.** Carrier management controls carrier selection and shipping rules. Routing guides, shipping calendars and estimated container counts can affect the available shipping choices.

**What happens**

Trigger: Carrier assignment or rating during outbound processing.

1. Use routing guides to identify a carrier or group for a customer/company and weight or container range. Evidence: `family-carrier-management-aim`.
2. Apply carrier no-ship calendars; wave container estimates can be used for rating. Evidence: `family-carrier-management-aim`.

**What can affect it**

- Routing guides can vary by weight and container count. Calendars identify excluded dates or weekend days.
- Carrier records can inherit shared setup; additional shipping services have their own configuration.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which carrier/rating service version and routing guide apply here? Obtain sanitized carrier-service bindings and routing precedence, without addresses or shipment data.

**Expected results and limits**

- Apply carrier no-ship calendars; wave container estimates can be used for rating.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Routing runs from a wave for all included shipments or from Shipment Insight for a selected unassigned shipment. Interactive rate shopping is separate and excludes in-process waves and ship-confirmed shipments. Evidence: `process-claim-process-documentary-carrier-management-r01`.
- Eligible routing guides are ordered by customer/ship-to and routing code, then lowest priority number for ties. A guide chooses a carrier or a carrier group; commitment and date/postal support filter group members before rating engines return rates. Evidence: `process-claim-process-documentary-carrier-management-r02`.
- Parcel manifesting can follow packing/closing or a manual request. Manifest state distinguishes blank, Error, Manifested and Closed; remanifesting is permitted until closure, after which containers cannot be changed or removed. Evidence: `process-claim-process-documentary-carrier-management-r03`.
- The diagram includes Use Rating in Selection: its No branch chooses best delivery days. This qualifier should accompany simplified cheapest-carrier explanations. Progistics/FedEx architecture details are retained vendor-era descriptions, not evidence of current deployed services. Evidence: `process-claim-process-documentary-carrier-management-r04`.

`family-carrier-management-aim`: [Carrier Management Process Summary: Functionality](../AIM/reading/0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4.md); AIM article `0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4`, original SHA-256 `6cae75f2a3d61f172808f8acc5a96ad0bc3875fc54c44c6a26bfe7d8b8ae2bd2`, nodes n65, n67, n69, n71, n73, n75.

`process-claim-process-documentary-carrier-management-r01`: [process-documentary-carrier-management-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `70fda6edae0d024737758a00f871a6f28df712be4d1ab3fdc430e3a1e7302cf0`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-carrier-management-r02`: [process-documentary-carrier-management-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `a910e686a31c1addb92cc2965c3357a94906e7b0fede8668938ce3c2329b56c0`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-carrier-management-r03`: [process-documentary-carrier-management-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `aee9ca87dc622715344ca1266205a4bc56545c83439a29f4b9708cab5235cd05`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-carrier-management-r04`: [process-documentary-carrier-management-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `2220e7e3c91578f1089498e3606bcef06b9189e91e4e7c3ea96da7385b0e1d99`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is carrier management for? Expected: Carrier management controls carrier selection and shipping rules. Routing guides, shipping calendars and estimated container counts can affect the available shipping choices. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my carrier management result happened? Expected: Which carrier/rating service version and routing guide apply here? Obtain sanitized carrier-service bindings and routing precedence, without addresses or shipment data. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 12. Container Creation in the Wave: purpose and processing

**Question:** What does container creation in the wave do in SCALE?

**What it does.** A wave can create shipping containers for allocated line quantities. A container strategy determines how those quantities are combined or split.

**What happens**

Trigger: The container-creation wave step executes.

1. Use the allocated shipment-line quantities as the input to container creation. Evidence: `family-container-creation-in-the-wave-aim`.
2. Apply the configured strategy to determine the containers and distribute quantities. Evidence: `family-container-creation-in-the-wave-aim`.

**What can affect it**

- The documented strategies are Consolidate And Do Not Split, Split And Do Not Consolidate, Consolidate And Split Only Once, and 3D Cubing.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which container strategy and packing constraints are assigned to the wave? Obtain sanitized wave-step and strategy contracts; do not infer a strategy from existing containers.

**Expected results and limits**

- Apply the configured strategy to determine the containers and distribute quantities.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Container creation is a wave step after allocation, with four named strategies: Consolidate And Do Not Split, Split And Do Not Consolidate, Consolidate And Split Only Once, and 3D Cubing. Evidence: `process-claim-process-documentary-container-creation-in-the-wave-r01`.
- Create full-UOM containers first unless Treat as Loose applies; then sort loose quantities by packing class and criteria ordering. Packing class comes from the shipment line or *Default, and determines the container group. Evidence: `process-claim-process-documentary-container-creation-in-the-wave-r02`.
- Usable container volume includes fill percent. Stabilization adds padding on both sides of each dimension. 3D cubing tries Same Pack, Default Pack, Two-Item Pack and Three-Item Pack in order, stopping at success; fixed orientation or nonstackability can invoke 2D packing. Evidence: `process-claim-process-documentary-container-creation-in-the-wave-r03`.
- An invalid default stabilization code falls back to zero and logs process history. The source expressly does not support creating wave containers from allocation requests and later RF picking/putaway into those existing shipping containers because the work cannot be linked. Evidence: `process-claim-process-documentary-container-creation-in-the-wave-r04`.

`family-container-creation-in-the-wave-aim`: [Container Creation in the Wave Process Summary: Functionality](../AIM/reading/ac1a4d877d9ffe1b990794887848f749622dd7c2cd0a9ad41e79766deab74780.md); AIM article `ac1a4d877d9ffe1b990794887848f749622dd7c2cd0a9ad41e79766deab74780`, original SHA-256 `bf4db6f7da1b69fb0d340568d3638f92ca64c2a646be9f5f2f756715e2983c15`, nodes n65.

`process-claim-process-documentary-container-creation-in-the-wave-r01`: [process-documentary-container-creation-in-the-wave-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `8b7942b091861481aa28d9a581a3ae43433d16ea25599db2eebe7a4482f0f03a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-container-creation-in-the-wave-r02`: [process-documentary-container-creation-in-the-wave-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `4f42cbf634545f0c1ca858e2075e5e958c9d3b0f1b9176ae0c7506de23a82e14`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-container-creation-in-the-wave-r03`: [process-documentary-container-creation-in-the-wave-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `0a51181428e511d73902bf8801d7e93e32ac252a2f6cfa32217b2f1a7d665789`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-container-creation-in-the-wave-r04`: [process-documentary-container-creation-in-the-wave-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `e1a1687fea5b177c8705e82f310cfc65eafe36ffdabbbb1d01b21d630c59bbce`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is container creation in the wave for? Expected: A wave can create shipping containers for allocated line quantities. A container strategy determines how those quantities are combined or split. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my container creation in the wave result happened? Expected: Which container strategy and packing constraints are assigned to the wave? Obtain sanitized wave-step and strategy contracts; do not infer a strategy from existing containers. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 13. Cycle Counting: purpose and processing

**Question:** What does cycle counting do in SCALE?

**What it does.** Cycle counting compares a physical count at a location with the quantity recorded by SCALE. It can start from a count plan or from activity that makes a location due for counting.

**What happens**

Trigger: A user creates a count plan, or the system creates activity-driven count instructions.

1. Select work through a plan-based or activity-driven count request. Evidence: `family-cycle-counting-aim`.
2. Physically verify whether the location inventory matches the recorded inventory. Evidence: `family-cycle-counting-aim`.

**What can affect it**

- Plan-based and activity-driven counting have different triggers; reconciliation tolerances and approval rules need further source review.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which count tolerances, recount and approval rules are enabled? Obtain sanitized cycle-count configuration and application handling; no physical counts are available here.

**Expected results and limits**

- Physically verify whether the location inventory matches the recorded inventory.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Counts originate from reusable master plans, one-time quick plans, or location activity. Plans may be scheduled; activity counts are immediate only when preferences and work execution allow it. Evidence: `process-claim-process-documentary-cycle-counting-r01`.
- Requests identify location/item/company/lot/LP, not a frozen quantity. In-transit-only inventory is treated as absent for request creation. Duplicate pending requests suppress new requests at the location; inactive locations are excluded while frozen locations can be counted. Evidence: `process-claim-process-documentary-cycle-counting-r02`.
- Create-work choices determine RF/work execution versus paperwork. Immediate Reconcile of Bad Count and tolerance Min/Max govern automatic adjustment or Pending Review. Plan execution is complete only after open requests and pending reconciliations are resolved. Evidence: `process-claim-process-documentary-cycle-counting-r03`.
- Standard counts do not prompt for catch weight; within-tolerance adjustment uses average weight, while blind count prompts and distinguishes new versus existing inventory. The LP diagram adds recount, added-LP review and uncounted-LP checks. LP diagram quantity-timing wording differs from general prose, so exact On Hand/Suspense timing needs reconciliation. Evidence: `process-claim-process-documentary-cycle-counting-r04`.
- The plan-based diagram labels both final more-counts branches No, although one ends execution and the other displays the next count. The activity-driven diagram supplies the expected Yes/No split; the plan-based label ambiguity is not silently corrected. Evidence: `process-claim-process-documentary-cycle-counting-r05`.

`family-cycle-counting-aim`: [Cycle Counting Process Summary: Functionality](../AIM/reading/548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3.md); AIM article `548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3`, original SHA-256 `62b53306bb40dde023f7fe8b495cff98a3604c93e7613707f4547202de3ae47c`, nodes n66.

`process-claim-process-documentary-cycle-counting-r01`: [process-documentary-cycle-counting-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `c137a822746bbb7a5ad25e5767a46b056d2c673d39dae58fc24c46d79d744ef8`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-cycle-counting-r02`: [process-documentary-cycle-counting-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `e57683a9fd62eab93c65b58cceca344d4eef0e9bde0bd3a4aaa1b53ea4c1a900`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-cycle-counting-r03`: [process-documentary-cycle-counting-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `573afbe8a3de74e3eeda5a2c7a644bcca0c56c03f9de709977da493d954f14a6`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-cycle-counting-r04`: [process-documentary-cycle-counting-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `e8f7cb0209b9554dd1da200ba55d6284794aeb856818afdaa8d7fb35e48420c7`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-cycle-counting-r05`: [process-documentary-cycle-counting-r05](mappings/process-documentary-review.json); reviewed-record SHA-256 `14f34a47105c336a3723b94b3199305384b054fe1e2483c5c4a8727c1ef64c26`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is cycle counting for? Expected: Cycle counting compares a physical count at a location with the quantity recorded by SCALE. It can start from a count plan or from activity that makes a location due for counting. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my cycle counting result happened? Expected: Which count tolerances, recount and approval rules are enabled? Obtain sanitized cycle-count configuration and application handling; no physical counts are available here. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 14. Device Integration Framework: purpose and processing

**Question:** What does device integration framework do in SCALE?

**What it does.** The Device Integration Framework connects SCALE with automation equipment, such as conveyors or pick-to-light systems. It exchanges messages; a received file alone does not prove the requested warehouse action finished.

**What happens**

Trigger: Equipment exchanges messages, or files arrive for a configured transfer process.

1. The configured file transfer reads supported files from designated folders into incoming-message handling. Evidence: `family-device-integration-framework-aim`.
2. Configured post-processing can change an extension, move the file and insert an incoming-message record for subsequent processing. Evidence: `family-device-integration-framework-aim`.

**What can affect it**

- File formats, extension rules, destination handling and whether to insert a message are configuration choices.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which device service, message handler and acknowledgment/retry rules are installed? Obtain sanitized service/version and message-schema evidence, without endpoints or live payloads.

**Expected results and limits**

- Configured post-processing can change an extension, move the file and insert an incoming-message record for subsequent processing.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Incoming TCP messages pass through the communication service into DIF_INCOMING_MESSAGE, then the processing service dispatches the configured custom API or IDiFAPI event execution path. A heartbeat is acknowledged without the ordinary table-write path. Evidence: `process-claim-process-documentary-device-integration-framework-r01`.
- File transfer is incoming-only. From directory/extension, polling sleep, rename/move and Insert Message determine whether a file becomes an incoming-message record. A separate Web API path is described for MHE submissions. Evidence: `process-claim-process-documentary-device-integration-framework-r02`.
- Incoming persistence success/failure determines ACK/NAK when enabled. Outgoing messages are read from DIF_OUTGOING_MESSAGE and retried a configured number of times; missing configured heartbeat ACK shuts the endpoint down and writes history. Insight screens support manual error reset. Evidence: `process-claim-process-documentary-device-integration-framework-r03`.

`family-device-integration-framework-aim`: [Device Integration Framework Process Summary: Functionality](../AIM/reading/6678efaf48f28c0a44b2e1460d2ab6c18050a333a56de1c53ba503cb274c6b60.md); AIM article `6678efaf48f28c0a44b2e1460d2ab6c18050a333a56de1c53ba503cb274c6b60`, original SHA-256 `74bb52247a8d357f0ae9e8639f45f24337864b942d0f0c28254ea313a5f68966`, nodes n65, n67, n69.

`process-claim-process-documentary-device-integration-framework-r01`: [process-documentary-device-integration-framework-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `3c2e7f4ed9f08579af059c54ceb9fae0f7a56ee61b16bd521984a86ef2f50563`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-device-integration-framework-r02`: [process-documentary-device-integration-framework-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `3bbf194aa7201a81d91ff81a85c5ddf6827da6ca1b4b0077882511ad2c79fe18`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-device-integration-framework-r03`: [process-documentary-device-integration-framework-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `0eb40c034253153003061f9321625fed09d08421932fc961a54634a34e0d820e`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is device integration framework for? Expected: The Device Integration Framework connects SCALE with automation equipment, such as conveyors or pick-to-light systems. It exchanges messages; a received file alone does not prove the requested warehouse action finished. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my device integration framework result happened? Expected: Which device service, message handler and acknowledgment/retry rules are installed? Obtain sanitized service/version and message-schema evidence, without endpoints or live payloads. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 15. Dock Management: purpose and processing

**Question:** What does dock management do in SCALE?

**What it does.** Dock management tracks containers through packing-area consolidation, staging and truck loading. These stages use distinct inventory-tracked locations and can be enabled separately.

**What happens**

Trigger: Shipment containers reach the outbound dock area.

1. Consolidate items or containers at a packing-area location when that process is enabled. Evidence: `family-dock-management-aim`.
2. Use staging locations and dock-door locations for enabled staging and loading stages. Evidence: `family-dock-management-aim`.

**What can affect it**

- Each dock-management process can be independently enabled or disabled.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which consolidation, staging and loading stages and status flows apply here? Obtain sanitized stage configuration and location-class mapping.

**Expected results and limits**

- Use staging locations and dock-door locations for enabled staging and loading stages.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Dock handling separates consolidation near packing, staging after container close, and loading into dock-door locations. Each area may have positions. The assignment strategy orders areas with positions, areas without positions, then positions; a closed position falls back to its parent area. Evidence: `process-claim-process-documentary-dock-management-r01`.
- Create Next Move controls work creation at close-container/RF-putaway decisions for packing/staging subclasses. Immediate RF transfers require no open/in-process container work and the relevant next-move setting disabled. Evidence: `process-claim-process-documentary-dock-management-r02`.
- The assignment diagram distinguishes missing flow header from missing detail: allocation can fail back to pool with process history when no header exists, while default-location fallbacks handle other branches. During dock assignment a missing header retains the prior allocation location. These figure-specific outcomes must not be merged into a single universal fallback. Evidence: `process-claim-process-documentary-dock-management-r03`.
- Dock-door assignment excludes doors assigned to open loads. The composite figure distinguishes actual assignment/reassignment, which adjusts inventory and creates work, from preassignment, which marks a future location. RF Immediate Dock Transfer is explicitly a no-next-work path. Evidence: `process-claim-process-documentary-dock-management-r04`.

`family-dock-management-aim`: [Dock Management Process Summary: Functionality](../AIM/reading/9857f2ac70834cdabe3e8245f2ee06c0451ed99523ada65852b8863953ad7b1c.md); AIM article `9857f2ac70834cdabe3e8245f2ee06c0451ed99523ada65852b8863953ad7b1c`, original SHA-256 `d3c20015a2fe617a03fced72f7bc976f250507efe52b67d6febe460194ff44c3`, nodes n65.

`process-claim-process-documentary-dock-management-r01`: [process-documentary-dock-management-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `5f4046493c4e8e371c0761488b689aab10e6d0fae7a9b7434a49737c6b1f4ed1`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-dock-management-r02`: [process-documentary-dock-management-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `55a43fc874a276d0095f5bb458183ba40c1d29fc817333bcea6b1f0cc40c1c06`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-dock-management-r03`: [process-documentary-dock-management-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `ae7286a3130887f844ff46b1cb4c77f91435cc1c84c79d472032edd020258590`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-dock-management-r04`: [process-documentary-dock-management-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `73f4ffb24e907d147c3547d7878bcbb98e9d6ccda5f54190a2c8dba494a3da7c`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is dock management for? Expected: Dock management tracks containers through packing-area consolidation, staging and truck loading. These stages use distinct inventory-tracked locations and can be enabled separately. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my dock management result happened? Expected: Which consolidation, staging and loading stages and status flows apply here? Obtain sanitized stage configuration and location-class mapping. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 16. GS1 Barcode: purpose and processing

**Question:** What does gs1 barcode do in SCALE?

**What it does.** A GS1 barcode can carry several data elements, such as an item, quantity or lot. SCALE uses application-identifier templates to interpret those elements; the template may be associated with a receiving preference.

**What happens**

Trigger: A barcode is interpreted during a supported process; label creation can occur in a wave or when closing a container.

1. Interpret barcode segments using the applicable application-identifier template. Evidence: `family-gs1-barcode-aim`.
2. The documented wave and close-container processes can generate GS1 labels from configured templates. Evidence: `family-gs1-barcode-aim`.

**What can affect it**

- Application-identifier templates determine parsing. Receiving preferences can select a template; generic supplied labels can be customized.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which barcode/template version and receiving-preference binding apply? Obtain a sanitized template definition and synthetic barcode example; current GS1 standard compliance is not established by this captured summary.

**Expected results and limits**

- The documented wave and close-container processes can generate GS1 labels from configured templates.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Inbound RF receiving scans labels containing multiple application identifiers, rather than a single item identifier; outbound GS1 labels can print from the wave or close-container process. Evidence: `process-claim-process-documentary-gs1-barcode-r01`.
- A receiving-preference AI template specifies scan count, segment order and manual verification. It controls inbound parsing, not the physical layout of an outbound label; generic outbound labels are customization starting points. Evidence: `process-claim-process-documentary-gs1-barcode-r02`.

`family-gs1-barcode-aim`: [GS1 Barcode Process Summary: Functionality](../AIM/reading/5f876e2632897c1569720f398a7ed5a564bc2d5792bad79a2a06d674e41e6069.md); AIM article `5f876e2632897c1569720f398a7ed5a564bc2d5792bad79a2a06d674e41e6069`, original SHA-256 `56aefab9a84d3879c034c2d09a2f71c62781a1cbd314d2c38c6254e205c88c6c`, nodes n64, n66, n68.

`process-claim-process-documentary-gs1-barcode-r01`: [process-documentary-gs1-barcode-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `ea6f34c0c30c9a3c4a94a2ff93c6a0009c703139e2c4b33bc3caa5b587e82674`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-gs1-barcode-r02`: [process-documentary-gs1-barcode-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `ff3c16fe4385b5e880674e0a813bcc37ce643d9e75fd7538af025300d0e113c3`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is gs1 barcode for? Expected: A GS1 barcode can carry several data elements, such as an item, quantity or lot. SCALE uses application-identifier templates to interpret those elements; the template may be associated with a receiving preference. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my gs1 barcode result happened? Expected: Which barcode/template version and receiving-preference binding apply? Obtain a sanitized template definition and synthetic barcode example; current GS1 standard compliance is not established by this captured summary. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 17. General System Concepts: purpose and processing

**Question:** What does general system concepts do in SCALE?

**What it does.** Warehouse, company and user setup provide the context for SCALE activity. A warehouse identifies where transactions occur, while user profiles and security records influence access.

**What happens**

Trigger: An authorized user opens a function in a configured warehouse.

1. Associate transactions with a warehouse; the vendor summary requires at least one warehouse. Evidence: `family-general-system-concepts-aim`.
2. The captured window-security description checks user-level records when present and otherwise references system-level records. Evidence: `family-general-system-concepts-aim`.

**What can affect it**

- Company setup supports multi-company processing. User profiles carry preferences and company authorizations.
- The historical documented security default must not be treated as the permissions of this deployment.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which deployed version and authorization layer govern access? Obtain a sanitized security model and application-version contract, never another user profile or password.

**Expected results and limits**

- The captured window-security description checks user-level records when present and otherwise references system-level records.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Every transaction is associated with a warehouse and at least one warehouse is required. Multi-company distribution is optional; source instructions distinguish defining two or more companies from leaving company setup unused. Evidence: `process-claim-process-documentary-general-system-concepts-r01`.
- A user profile supplies preferences and access authorization. On window access the documented precedence checks user-level security records first and otherwise system-level security. Relaxed and highly restrictive approaches are configuration choices. Evidence: `process-claim-process-documentary-general-system-concepts-r02`.
- The article describes a permissive default security posture, but that statement is vendor documentation, not evidence of this deployment's current permissions. Access behavior and effective overrides require separate application configuration evidence. Evidence: `process-claim-process-documentary-general-system-concepts-r03`.

`family-general-system-concepts-aim`: [General System Concepts Process Summary: Functionality](../AIM/reading/85149c7693291207b2c43b2565198094a6af1ad3eaa3cb03fe2dfa28c7a351d1.md); AIM article `85149c7693291207b2c43b2565198094a6af1ad3eaa3cb03fe2dfa28c7a351d1`, original SHA-256 `2abb64aa793ebb9b72cbcfc007af8c24f6508deebb57bcf432a46085bd48bfaf`, nodes n76, n81, n86, n91, n93, n95, n97, n100.

`process-claim-process-documentary-general-system-concepts-r01`: [process-documentary-general-system-concepts-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `d2ded1209478ca37f1d11a5d2c2215f205f46a2d6b4ef2c289ffeeed9c677ca4`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-general-system-concepts-r02`: [process-documentary-general-system-concepts-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `d99a40b51dc67c2c17c362476b028fc101729478c35b34ba09506074eda18ae8`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-general-system-concepts-r03`: [process-documentary-general-system-concepts-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `a3d44b860b5163ed3b56f0a044b842342b7358e2edcc030cf6cc904d4fe723f6`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is general system concepts for? Expected: Warehouse, company and user setup provide the context for SCALE activity. A warehouse identifies where transactions occur, while user profiles and security records influence access. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my general system concepts result happened? Expected: Which deployed version and authorization layer govern access? Obtain a sanitized security model and application-version contract, never another user profile or password. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 18. Immediate Needs: purpose and processing

**Question:** What does immediate needs do in SCALE?

**What it does.** Immediate needs record product that cannot yet fulfill a shipment, work order, replenishment or short pick. Newly received stock can then be allocated to fill that shortage.

**What happens**

Trigger: A supported request cannot be completely fulfilled.

1. Log an immediate-needs request for the unmet quantity. Evidence: `family-immediate-needs-aim`.
2. Use newly received quantity to fulfill the need; requests for the same item are considered using their priorities. Evidence: `family-immediate-needs-aim`.
3. The documented viewer removes the request after fulfillment closes it. Evidence: `family-immediate-needs-aim`.

**What can affect it**

- The trigger defines a default priority, which can be changed for a request. Priority comparison is documented for requests of the same item.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which immediate-needs triggers and priority rules apply to the process? Obtain sanitized trigger definitions and fulfillment bindings, without shortage records.

**Expected results and limits**

- The documented viewer removes the request after fulfillment closes it.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Configured shortage triggers can log needs from shipment allocation, short picks, replenishment allocation and work-order component allocation. Trigger activation and item eligibility are required; Add BOM Component Lines components/finished items are excluded. Evidence: `process-claim-process-documentary-immediate-needs-r01`.
- Receipt locating checks validity, removes stale requests, and uses new inventory to fulfill needs. A whole LP for one need may cross-dock; put-to-store needs can split child containers; residual quantity uses normal locating. Evidence: `process-claim-process-documentary-immediate-needs-r02`.
- Immediate-needs locating rule precedence is shipment line, system default, then original LP location/rule; after assignment another rule is not attempted. Putaway-group membership independently determines group fulfillment and residual putaway. Evidence: `process-claim-process-documentary-immediate-needs-r03`.
- Locate By Parent does not fulfill immediate needs. Work-order build locations are prohibited for immediate-needs allocation. Request priority orders competing needs for the same item, and fulfilled requests close/disappear from the viewer. Evidence: `process-claim-process-documentary-immediate-needs-r04`.

`family-immediate-needs-aim`: [Immediate Needs Process Summary: Functionality](../AIM/reading/5dc3ad182d2fa6eed29085709e0c784b0b831ddb4bf10e21616b711279fd1c2d.md); AIM article `5dc3ad182d2fa6eed29085709e0c784b0b831ddb4bf10e21616b711279fd1c2d`, original SHA-256 `f909c9c7b964714a286e52d66ffbc21159ed3371740322e650197b40dd19d0e3`, nodes n65, n67, n69.

`process-claim-process-documentary-immediate-needs-r01`: [process-documentary-immediate-needs-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `e1156de07c7b606c8b57997b718ec6f500526da0b7c1b32b3f2ebf381bdb434b`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-immediate-needs-r02`: [process-documentary-immediate-needs-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `ddd66b377d455d8ed72ee9cabec07f8e0bc3c2276754a3900765d41333e70695`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-immediate-needs-r03`: [process-documentary-immediate-needs-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `b62d108f138c8977016d1c2d46886afbe5eef75f87015c0808627d221f46ff4a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-immediate-needs-r04`: [process-documentary-immediate-needs-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `a95c2a2f42336fcd7b3e7c783687e375b3aa0a9f2e249b4ebb82bf763f8e48f9`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is immediate needs for? Expected: Immediate needs record product that cannot yet fulfill a shipment, work order, replenishment or short pick. Newly received stock can then be allocated to fill that shortage. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my immediate needs result happened? Expected: Which immediate-needs triggers and priority rules apply to the process? Obtain sanitized trigger definitions and fulfillment bindings, without shortage records. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 19. Interface: purpose and processing

**Question:** What does interface do in SCALE?

**What it does.** Interfaces exchange records between SCALE and an order system. A job can be started manually or by a schedule, and one failed file does not necessarily stop other files from being processed.

**What happens**

Trigger: A manual or scheduled upload/download starts.

1. Process appropriate files or records from earliest to latest last-modified time. Evidence: `family-interface-aim`.
2. Record detailed errors for failures; when processing several files, continue with other files after a file-data error. Evidence: `family-interface-aim`.

**What can affect it**

- Transport mode, touchpoint and schedule determine the interface path; those active settings are not supplied by this summary.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- What installed interface mode, schema, idempotency and acknowledgment rules apply? Obtain sanitized interface contracts and version evidence; do not inspect live payload/error files under this task.

**Expected results and limits**

- Record detailed errors for failures; when processing several files, continue with other files after a file-data error.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Users or scheduled jobs initiate uploads/downloads. File processing orders files by modification time, while records within a file retain file order. ERP is a documentary placeholder for the sending/receiving system. Evidence: `process-claim-process-documentary-interface-r01`.
- Delimited/fixed-length/direct input is prepared as legacy XML; XML input is already in the required format. Before/after custom steps surround business processing. Direct mode uses transfer tables before valid records reach production tables. Evidence: `process-claim-process-documentary-interface-r02`.
- Process records control data type, transaction cap and file extension. Upload criteria restrict eligible records; output directory precedence is process detail then interface system value. Record IDs must be unique across headers and details. Evidence: `process-claim-process-documentary-interface-r03`.
- Download creates success/process and error XML files plus history/alerts. Failure in one file does not prevent other files from processing. This does not establish per-record transaction atomicity, retry idempotence or the deployed custom ERP parser. Evidence: `process-claim-process-documentary-interface-r04`.

`family-interface-aim`: [Interface Process Summary: Functionality](../AIM/reading/178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e.md); AIM article `178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e`, original SHA-256 `16a5da0368ba8d3c53860134e3270982414a29c92ad4c62f1c13da24e4067a7c`, nodes n66, n68.

`process-claim-process-documentary-interface-r01`: [process-documentary-interface-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `e0975b391f83b50273ba9b4f009baae4fe94b5e0c12885abe7189d8fb1b5d277`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-interface-r02`: [process-documentary-interface-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `d7071a22b74c2b69cabbf1c0c38424f577dcec3323ec191b93a7010a482b08d3`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-interface-r03`: [process-documentary-interface-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `6d87f04a77da9bfe4c5bcaeaf8057402b3356565752a01952c3d362bfaa10a3a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-interface-r04`: [process-documentary-interface-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `10217ad015d0dc270614d7951ef3d6560f9dde80fcf4598abba8b53249e69d39`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is interface for? Expected: Interfaces exchange records between SCALE and an order system. A job can be started manually or by a schedule, and one failed file does not necessarily stop other files from being processed. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my interface result happened? Expected: What installed interface mode, schema, idempotency and acknowledgment rules apply? Obtain sanitized interface contracts and version evidence; do not inspect live payload/error files under this task. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 20. Inventory Management: purpose and processing

**Question:** What does inventory management do in SCALE?

**What it does.** Inventory management corrects recorded stock outside ordinary picking or putaway. The adjustment class determines how an adjustment type is processed; license-plate transactions can handle mixed product together.

**What happens**

Trigger: An authorized user completes an inventory adjustment or transfer.

1. Process the selected adjustment type according to its adjustment class. Evidence: `family-inventory-management-aim`.
2. Apply the documented inventory change when the transaction completes; license-plate tracking can extend the context. Evidence: `family-inventory-management-aim`.

**What can affect it**

- Adjustment types/classes and license-plate tracking affect processing.
- The captured summary restricts Lot Insight adjustment/status-change/transfer when inventory attributes are linked.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which adjustment class, permissions and attribute restrictions apply? Obtain sanitized adjustment definitions and caller transaction behavior; individual balances remain outside scope.

**Expected results and limits**

- Apply the documented inventory change when the transaction completes; license-plate tracking can extend the context.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Desktop/Insight or RF adjustment requests correct stock outside ordinary pick/putaway. RF presents only user/warehouse-authorized adjustment types, and fields vary by adjustment class. Evidence: `process-claim-process-documentary-inventory-management-r01`.
- RF quantity adjustments/transfers validate inventory tracking, configured item/location checks, existing contents and multi-item eligibility. Status changes verify that the item exists at the nominated location. Validation failure returns the user for another value. Evidence: `process-claim-process-documentary-inventory-management-r02`.
- Some desktop adjustment/transfer types create work: stock becomes in transit at the destination and transfers reserve the source. This work-creation option is not supported during RF inventory adjustments. Quantity bounds and frozen-location permissions belong to adjustment types. Evidence: `process-claim-process-documentary-inventory-management-r03`.
- Full-quantity negative adjustments/transfers do not prompt for catch weight; partial quantities can default from average weight, and work-based actions capture weight during execution. Lot Insight restrictions apply when inventory attributes are linked; lot status/expiry edits propagate across matching item/company/lot inventory. Evidence: `process-claim-process-documentary-inventory-management-r04`.

`family-inventory-management-aim`: [Inventory Management Process Summary: Functionality](../AIM/reading/9c9b2f34d8c2aeee8291236b7db3a8d7712db3a3188eda0681cc00157c1ccdfe.md); AIM article `9c9b2f34d8c2aeee8291236b7db3a8d7712db3a3188eda0681cc00157c1ccdfe`, original SHA-256 `9fe93dc5c192f74ebe3d424157aa85d024f7079485cbc7e9c9c475c794e7eee6`, nodes n66, n68, n70, n74, n75, n76.

`process-claim-process-documentary-inventory-management-r01`: [process-documentary-inventory-management-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `d024ea71daa06ff1cef46bca55a21c00d432ef105c78989fc5bdc36e130229ac`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-inventory-management-r02`: [process-documentary-inventory-management-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `910038728fabb6da1f066626e7e59de32b2e55906c446d63f4d2eb1f31093a22`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-inventory-management-r03`: [process-documentary-inventory-management-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `8f27f409f96c6b4ea4b2392b02f1e7ce680e387e584f3c4bd7f65eb5d479977a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-inventory-management-r04`: [process-documentary-inventory-management-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `889b7af5b1471ec7a73d40beba2a11f61f3cf79c8c61ca74793e604782cc6d4f`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is inventory management for? Expected: Inventory management corrects recorded stock outside ordinary picking or putaway. The adjustment class determines how an adjustment type is processed; license-plate transactions can handle mixed product together. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my inventory management result happened? Expected: Which adjustment class, permissions and attribute restrictions apply? Obtain sanitized adjustment definitions and caller transaction behavior; individual balances remain outside scope. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 21. Inventory Tracking: purpose and processing

**Question:** What does inventory tracking do in SCALE?

**What it does.** Inventory tracking records where stock is and what state it is in. Quantity categories distinguish inventory states, and lots, serial numbers, catch weights and attributes provide additional identification.

**What happens**

Trigger: Product enters, moves through or leaves the warehouse.

1. Track product location and state through its warehouse journey. Evidence: `family-inventory-tracking-aim`.
2. Use quantity categories and applicable lot, serial, weight and attribute identification. Evidence: `family-inventory-tracking-aim`.

**What can affect it**

- The summary names the tracking dimensions; item-specific activation and quantity equations require the detailed contracts.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which item tracking controls and quantity-category rules apply to this workflow? Obtain sanitized rule definitions and application bindings; no current quantities are known.

**Expected results and limits**

- Use quantity categories and applicable lot, serial, weight and attribute identification.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Inventory buckets distinguish physical On Hand, incoming In Transit, reserved Allocated and count-related Suspense. The basic Available calculation is On Hand minus Allocated minus Suspense; this introductory formula should not erase the allocation article's configured in-transit variant. Evidence: `process-claim-process-documentary-inventory-tracking-r01`.
- Lot and serial templates define identifier structures; master/minor serials have different display roles. Inventory attributes are twenty named fields usable across receiving, allocation and ERP interfaces for LP and non-LP stock. Evidence: `process-claim-process-documentary-inventory-tracking-r02`.
- Movement-class analysis uses scheduled historical-demand data to support placement decisions. It describes a planning capability, not observed throughput, active schedules or an automatically proven best location. Evidence: `process-claim-process-documentary-inventory-tracking-r03`.

`family-inventory-tracking-aim`: [Inventory Tracking Process Summary: Functionality](../AIM/reading/de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c.md); AIM article `de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c`, original SHA-256 `b87db78c2d841a850fc229481eabccd5eea820d3fee31495a2578a92707c5a88`, nodes n64.

`process-claim-process-documentary-inventory-tracking-r01`: [process-documentary-inventory-tracking-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `4e8cfe44fc3465c74ff62b3c84426f4cd7f6612a36798954186f0a5fe8f8b880`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-inventory-tracking-r02`: [process-documentary-inventory-tracking-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `c3ff6f74c692854bf6e91ac3df58949e64921f7d62e2d9696fcfb642dc56e12e`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-inventory-tracking-r03`: [process-documentary-inventory-tracking-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `e937cf69dd2a5b131a50d92b9f29c60fce4a38bd399bcac67b5a0ba810e1357f`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is inventory tracking for? Expected: Inventory tracking records where stock is and what state it is in. Quantity categories distinguish inventory states, and lots, serial numbers, catch weights and attributes provide additional identification. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my inventory tracking result happened? Expected: Which item tracking controls and quantity-category rules apply to this workflow? Obtain sanitized rule definitions and application bindings; no current quantities are known. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 22. Item: purpose and processing

**Question:** What does item do in SCALE?

**What it does.** Item setup defines product characteristics and handling controls, including locating, allocation, lot and serial behavior. The captured summary also describes using shipment-line item values when separate item records are not maintained.

**What happens**

Trigger: An item is configured or supplied through interface/shipment-line data.

1. Use item characteristics and handling controls when processing the product. Evidence: `family-item-aim`.
2. In the documented optional-item-master path, reference values supplied on shipment lines. Evidence: `family-item-aim`.

**What can affect it**

- Item controls can include allocation/locating rules and tracking requirements. Company context matters in multi-company use.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Does this deployment require item masters, and which field defaults/overrides apply? Obtain the installed item/interface contract; optional behavior in the summary is not a deployment guarantee.

**Expected results and limits**

- In the documented optional-item-master path, reference values supplied on shipment lines.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Item records can be interfaced or maintained in SCALE. The source permits optional item-master setup and fallback to shipment-line values; that general statement must be reconciled with process-specific validation flags before use. Evidence: `process-claim-process-documentary-item-r01`.
- Item templates control ID structure; item UOM breakdown and dimensions support capacity calculations. Alternate items replace unavailable/obsolete items, while substitutes address out-of-stock items. Item cross-references allow UPC/EAN-14 identification during processing. Evidence: `process-claim-process-documentary-item-r02`.

`family-item-aim`: [Item Process Summary: Functionality](../AIM/reading/d805afb741af2fe0359ea6a96de0677c5ef0bb1532f7454099e15ce9f148c9b0.md); AIM article `d805afb741af2fe0359ea6a96de0677c5ef0bb1532f7454099e15ce9f148c9b0`, original SHA-256 `ac7b4d20dd4c56102e0606305932bbc6c3688cab1a4fdf0f3a6a141f6c0505a7`, nodes n64.

`process-claim-process-documentary-item-r01`: [process-documentary-item-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `603c50ae8cef5a283b9839ff448c8328f280fe1fe47dc569e9370f23e8e5d7cf`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-item-r02`: [process-documentary-item-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `49c24ceca2bf364f9991d78870f70cede39f9afe49029a5378e899f57912d452`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is item for? Expected: Item setup defines product characteristics and handling controls, including locating, allocation, lot and serial behavior. The captured summary also describes using shipment-line item values when separate item records are not maintained. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my item result happened? Expected: Does this deployment require item masters, and which field defaults/overrides apply? Obtain the installed item/interface contract; optional behavior in the summary is not a deployment guarantee. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 23. LTL Rating: purpose and processing

**Question:** What does ltl rating do in SCALE?

**What it does.** Less-than-truckload rating calculates freight for a shipment using route, weight and freight class. SCALE’s documented internal rating also considers minimum charges and whether the next weight break would be cheaper.

**What happens**

Trigger: An LTL shipment is rated.

1. Determine a rate base using warehouse origin, shipment destination and any additional configured criteria. Evidence: `family-ltl-rating-aim`.
2. Rate each freight class and weight, total mixed classes and check carrier minimums. Evidence: `family-ltl-rating-aim`.
3. Apply the documented deficit-weight comparison against the next weight break. Evidence: `family-ltl-rating-aim`.

**What can affect it**

- Rate bases contain class/weight breaks; carrier minimums and route criteria influence the calculation.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Is internal LTL rating or an external rating service used, and what contract/version applies? Obtain sanitized rating configuration; no current price, tariff or shipment quote is established.

**Expected results and limits**

- Apply the documented deficit-weight comparison against the next weight break.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Select a valid rate base by effective criteria, origin/destination and shipment characteristics. Rate each LTL class using shipment weight breaks, total charges, apply minimums and compare deficit-weight alternatives; mixed-class deficit uses the lowest class. Evidence: `process-claim-process-documentary-ltl-rating-r01`.
- FAK can rate different actual classes at an agreed class. Scenario minimum-charge precedence is detail before header. Rates and postal codes in examples are illustrative and not current carrier prices. Evidence: `process-claim-process-documentary-ltl-rating-r02`.
- The scenario calls 42.50 the rate for a 600-pound shipment, while the preceding table places 42.50 under <500 and 41.80 under <1000. Retain this source inconsistency; do not promote its numeric example into an executable rating oracle. Evidence: `process-claim-process-documentary-ltl-rating-r03`.

`family-ltl-rating-aim`: [LTL Rating Process Summary: Functionality](../AIM/reading/66f522d9ea61a79265d4f554eefaa3cf9eb580ca5083eb1e4a3282e7a7c55376.md); AIM article `66f522d9ea61a79265d4f554eefaa3cf9eb580ca5083eb1e4a3282e7a7c55376`, original SHA-256 `ecf370ae2e20127447eeb2276766ecffcb7d9e7f73ecd56a1097f70a134337d2`, nodes n67, n69, n71, n73, n75, n77.

`process-claim-process-documentary-ltl-rating-r01`: [process-documentary-ltl-rating-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `7d827ad83f30fd3595626296283fd2d51702adff89b28dff4a4c3982bf431b2d`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-ltl-rating-r02`: [process-documentary-ltl-rating-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `fb4748785ea9dd57037ba6b365cdad024f25b7c64d6e45720d8b59ceb9604b47`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-ltl-rating-r03`: [process-documentary-ltl-rating-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `0d20c67808427800d64976a6f71034f327e5247813af77997584bed49aa3ef44`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is ltl rating for? Expected: Less-than-truckload rating calculates freight for a shipment using route, weight and freight class. SCALE’s documented internal rating also considers minimum charges and whether the next weight break would be cheaper. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my ltl rating result happened? Expected: Is internal LTL rating or an external rating service used, and what contract/version applies? Obtain sanitized rating configuration; no current price, tariff or shipment quote is established. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 24. Labor Management: purpose and processing

**Question:** What does labor management do in SCALE?

**What it does.** Labor management collects productivity information from warehouse actions such as picking, packing and receiving. It supports comparing work and plans with expected performance.

**What happens**

Trigger: Workers perform supported warehouse actions.

1. Generate labor data from supported work execution, packing and receiving activities. Evidence: `family-labor-management-aim`.
2. Use the recorded data to assess productivity and compare labor plans with expectations. Evidence: `family-labor-management-aim`.

**What can affect it**

- Activity definitions, standards and plan configuration are not established by the reviewed summary.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- What time boundaries, standards and exclusions define each labor measure here? Obtain sanitized measurement definitions and correlation design; no employee performance data is authorized.

**Expected results and limits**

- Use the recorded data to assess productivity and compare labor plans with expectations.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Warehouse actions produce labor requests which a continuing labor service turns into detail records; untracked duties can be manually entered. A labor-plan wave step separately estimates required labor. Evidence: `process-claim-process-documentary-labor-management-r01`.
- Labor plans order labor groups; groups carry staffing, hours, UOM and estimated time per transaction. Scenario calculations distinguish one transaction per UOM demand from one per quantity, producing different workload estimates. Evidence: `process-claim-process-documentary-labor-management-r02`.
- The example estimates do not measure runtime or actual employee performance. Direct and indirect labor are separately defined, and observed productivity requires actual authorized labor records and processing evidence. Evidence: `process-claim-process-documentary-labor-management-r03`.
- The plan diagram distinguishes work-line versus shipment-line planning according to placement relative to work creation. When a line qualifies for multiple groups, its displayed result comes from the last processed group. Evidence: `process-claim-process-documentary-labor-management-r04`.

`family-labor-management-aim`: [Labor Management Process Summary: Functionality](../AIM/reading/7dd4c71c4fffda7e9ee1126c5142b92f5d6ebf82faf4a4f204c59dfe5f1bfd65.md); AIM article `7dd4c71c4fffda7e9ee1126c5142b92f5d6ebf82faf4a4f204c59dfe5f1bfd65`, original SHA-256 `54c9034017f6e99c435f01fb8113c4cbb342583be0357d049f2bf4364b00d066`, nodes n68.

`process-claim-process-documentary-labor-management-r01`: [process-documentary-labor-management-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `652963c90728ac6d2e42b4a79884857b38c25919bd843580a5cc0a146bd06edf`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-labor-management-r02`: [process-documentary-labor-management-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `9258a50e24d09766bb68ccdfdf2fead976d8ec8d5b3697656f0a9bb77b5b3c11`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-labor-management-r03`: [process-documentary-labor-management-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `2d3ce19c31e6048b87bc927ebf259bdc2e295d97e5cd616a81b7d5fc55a4907a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-labor-management-r04`: [process-documentary-labor-management-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `538071fcf6b711dbc04ac6fafe7ee30a10d0c7021a85ae906d5380a56402a9f9`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is labor management for? Expected: Labor management collects productivity information from warehouse actions such as picking, packing and receiving. It supports comparing work and plans with expected performance. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my labor management result happened? Expected: What time boundaries, standards and exclusions define each labor measure here? Obtain sanitized measurement definitions and correlation design; no employee performance data is authorized. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 25. Locating: purpose and processing

**Question:** What does locating do in SCALE?

**What it does.** Locating chooses a storage destination for checked-in product. Rules select candidate locations and a strategy; creating putaway work is a separate choice. Delayed locating can first send the container to a receiving pre-locate area.

**What happens**

Trigger: Checked-in containers are submitted for locating.

1. Select the applicable locating rule, using the parent rule when locating by parent and the nested-container rule when locating by child. Evidence: `family-locating-aim`.
2. Evaluate rule sequences in numeric order, applying each location selection and strategy. Evidence: `family-locating-aim`.
3. If both Delayed Locating and Create Putaway Work are active, locate with work to the receiving pre-locate location; otherwise use rule details. Evidence: `family-locating-aim`.

**What can affect it**

- Rules can be assigned on the item or through rule-set assignment. Strategies and eligible locations govern placement.
- Delayed locating requires both flags; one active flag is insufficient.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which rule assignment and receiving preference are effective for the container? Obtain sanitized assignment and preference contracts. Aggregate delayed-locating flags cannot establish per-container behavior.

**Expected results and limits**

- If both Delayed Locating and Create Putaway Work are active, locate with work to the receiving pre-locate location; otherwise use rule details.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Receipt check-in precedes locating, which chooses storage and may create putaway instructions according to receiving preferences. Process History explains decisions; Transaction History records actual locating events. Evidence: `process-claim-process-documentary-locating-r01`.
- Numbered locating sequences combine strategy and eligible-location selection. Style consolidation is child-container-only; Empty Location does not use another item's permanent assignment, and Fill One And Only One does not continue to other locations once its selected location fills. Evidence: `process-claim-process-documentary-locating-r02`.
- Delayed Locating requires both the rule flag and Create Putaway Work. Parent locating uses the parent rule and child locating the nested container's rule; otherwise normal rule details apply. Evidence: `process-claim-process-documentary-locating-r03`.

`family-locating-aim`: [Locating Process Summary: Functionality](../AIM/reading/4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa.md); AIM article `4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa`, original SHA-256 `e215745a6d81b87363e12c8d05d0ac51d7b6337430ce4b448bc6edcedf67b24a`, nodes n64, n66, n81, n83, n85, n87, n90, n94, n96, n98, n102, n105, n108, n113.

`process-claim-process-documentary-locating-r01`: [process-documentary-locating-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `b0e9bd813eb936a3bb782fe999d42f4b07337ca3972cf83684e45ec04c304876`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-locating-r02`: [process-documentary-locating-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `1bdb4498552b3ab8d265aafa532ee7ef93eb2eb868450fbf7d50af071af357c0`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-locating-r03`: [process-documentary-locating-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `6ca56203900d31b85abdcd8fd9b71f6c15621760092373a9678359abfde010aa`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is locating for? Expected: Locating chooses a storage destination for checked-in product. Rules select candidate locations and a strategy; creating putaway work is a separate choice. Delayed locating can first send the container to a receiving pre-locate area. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my locating result happened? Expected: Which rule assignment and receiving preference are effective for the container? Obtain sanitized assignment and preference contracts. Aggregate delayed-locating flags cannot establish per-container behavior. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 26. Location: purpose and processing

**Question:** What does location do in SCALE?

**What it does.** A location is a defined place where stock can be picked, put away or replenished. Location types share dimensions and capacity settings, while movement classes describe what kinds of product can be stored there.

**What happens**

Trigger: Warehouse locations are defined and referenced by warehouse work.

1. Associate a location with a location type where common dimensions and quantity limits are needed. Evidence: `family-location-aim`.
2. Use movement-class rules to identify the types of product allowed in that location. Evidence: `family-location-aim`.

**What can affect it**

- Location type, capacity and movement class influence use; actual availability remains operational data.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- What inheritance/override rules apply between a location and its type? Obtain sanitized definitions and the installed resolution contract.

**Expected results and limits**

- Use movement-class rules to identify the types of product allowed in that location.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Location types share dimensions and quantity maximums; movement classes restrict product placement. Templates define structured IDs and separators, while predefined location classes identify purpose. Evidence: `process-claim-process-documentary-location-r01`.
- Permanent item assignments support non-inventory products. Pickup/dropoff locations are intermediate handoffs: one worker can deposit product and another transport it onward, rather than treating P&D as the final destination. Evidence: `process-claim-process-documentary-location-r02`.

`family-location-aim`: [Location Process Summary: Functionality](../AIM/reading/21428da0ae44e13ca2c0bcefba196f6df8418538d3c715c19189eea8ec30c5ae.md); AIM article `21428da0ae44e13ca2c0bcefba196f6df8418538d3c715c19189eea8ec30c5ae`, original SHA-256 `d517ff8730848df37cb3418877be0cb80e0e68650ed39845945145bad5425462`, nodes n63.

`process-claim-process-documentary-location-r01`: [process-documentary-location-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `d8a486d619e9a7231c3e448877598b37126b7f1c117b0c149f719aea93f3e52d`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-location-r02`: [process-documentary-location-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `2f242af9fe0335ec4432c545ab251e9d896d66e9b1848a2da356210b0a6d516a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is location for? Expected: A location is a defined place where stock can be picked, put away or replenished. Location types share dimensions and capacity settings, while movement classes describe what kinds of product can be stored there. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my location result happened? Expected: What inheritance/override rules apply between a location and its type? Obtain sanitized definitions and the installed resolution contract. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 27. Multi-Language Support: purpose and processing

**Question:** What does multi-language support do in SCALE?

**What it does.** Language behavior depends on which SCALE interface is being used and which translations are installed. Desktop, browser, RF device and TPM settings are described separately in the captured documentation.

**What happens**

Trigger: A user opens an interface or online help.

1. Use the applicable translated resources; the documented desktop path follows Windows-user language and other application screens follow browser language. Evidence: `family-multi-language-support-aim`.
2. RF language can be selected on the device; the documented TPM language uses its server-side web-user setting. Evidence: `family-multi-language-support-aim`.
3. For online help, use a matching language folder when available, otherwise fall back to the base help. Evidence: `family-multi-language-support-aim`.

**What can affect it**

- Resource files and translated help must exist; a language preference alone does not supply a translation.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which client types and localization version are installed? Obtain sanitized client/resource-language inventory and fallback rules; the historical desktop model may differ from current clients.

**Expected results and limits**

- For online help, use a matching language folder when available, otherwise fall back to the base help.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Translated TRP resources supply display text. Remote-desktop system-menu windows follow Windows user language; other application screens follow browser language. RF language can be set on the device independently. Evidence: `process-claim-process-documentary-multi-language-support-r01`.
- TPM website language is server/Web User configuration controlled in this source. Online help looks for the user-language folder and falls back to base help when it is absent; this does not establish translation availability or present product-version behavior. Evidence: `process-claim-process-documentary-multi-language-support-r02`.
- The System Text Editor Translation Wizard supports export/import and copying existing resource values for translation. Language selection, resource translation and translated help are distinct setup tasks. Evidence: `process-claim-process-documentary-multi-language-support-r03`.

`family-multi-language-support-aim`: [Multi-Language Support Process Summary: Functionality](../AIM/reading/3e7f7707cbad374ac9e9f33aea0d9c046ee877c02eff247d8fd4776e6a8038ea.md); AIM article `3e7f7707cbad374ac9e9f33aea0d9c046ee877c02eff247d8fd4776e6a8038ea`, original SHA-256 `1b7d8d6f4ca55bcae49fb22b6cf405789100c3d2c1f8b11214c085cad5b45a33`, nodes n63, n80, n82, n87, n92, n97, n102, n104.

`process-claim-process-documentary-multi-language-support-r01`: [process-documentary-multi-language-support-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `14e0ee3b4298b6b0fd66ba2be6ce6d0e519c647fa60755b93dce315702d66c7b`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-multi-language-support-r02`: [process-documentary-multi-language-support-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `04c7b2cbc92a5fa2c35d04f581d6055778894e9887b9a019cab79d438bbe8f46`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-multi-language-support-r03`: [process-documentary-multi-language-support-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `b441f7785c149ee741acdbcafc127ab1ae3b3df09d9361a06b2c00923693865b`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is multi-language support for? Expected: Language behavior depends on which SCALE interface is being used and which translations are installed. Desktop, browser, RF device and TPM settings are described separately in the captured documentation. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my multi-language support result happened? Expected: Which client types and localization version are installed? Obtain sanitized client/resource-language inventory and fallback rules; the historical desktop model may differ from current clients. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 28. Packing/Shipping: purpose and processing

**Question:** What does packing/shipping do in SCALE?

**What it does.** Packing associates shipment lines with containers, validates items and generates packing labels. Shipping then manages packed shipments through dock processing and confirmation.

**What happens**

Trigger: Allocated/picked shipment quantities enter the applicable packing and shipping flow.

1. Associate lines with containers, validate items and generate packing labels in the documented packing process. Evidence: `family-packing-shipping-aim`.
2. Manage packed shipments at the dock through load confirmation and departure processing. Evidence: `family-packing-shipping-aim`.

**What can affect it**

- The reviewed summary separates packing and shipping; exact status-flow, validation and confirmation settings need deployed evidence.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which packing validation and shipping confirmation steps are active? Obtain sanitized status-flow/application bindings, carrier handoffs and print acknowledgments.

**Expected results and limits**

- Manage packed shipments at the dock through load confirmation and departure processing.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Packing associates shipment contents to containers; closing collects container/weight data and prevents further packing. Bypass packing depends on Create Containers at Closing or wave-created containers. Evidence: `process-claim-process-documentary-packing-shipping-r01`.
- RF nesting checks container existence, an open parent and same-shipment membership before linking child ID/contents to the parent. A parent may be newly created during the flow. Evidence: `process-claim-process-documentary-packing-shipping-r02`.
- The close-container figure validates shipment/container, shipment membership and released wave; pending VAS requires an override while pending QC blocks. It adds an international on-the-fly restriction and notes RF/web-service international manifesting is unsupported in this documented flow. Evidence: `process-claim-process-documentary-packing-shipping-r03`.
- The close figure sequences manifesting, container/child status advancement, configured paperwork, optional load assignment, next dock move and transaction history. Grouping containers requires a common shipment and does not itself affect carrier rating/routing. Evidence: `process-claim-process-documentary-packing-shipping-r04`.

`family-packing-shipping-aim`: [Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md); AIM article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`, original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`, nodes n65.

`process-claim-process-documentary-packing-shipping-r01`: [process-documentary-packing-shipping-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `9cac984395960da8cd5a2970d4525b8e6b5a9858ac792e67e5c43710debf7fe9`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-packing-shipping-r02`: [process-documentary-packing-shipping-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `5056a96ad4f8d87b3ed8c2ac812c39d6f67a3be09ca4d8d69b6e5c5812a8268a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-packing-shipping-r03`: [process-documentary-packing-shipping-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `fba63fc12af40bdf1e25cb08616a2e76be781726d599e1a197f98b1e3eab7bc1`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-packing-shipping-r04`: [process-documentary-packing-shipping-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `a7c319c0625283ad681f68ad2195de5129e077f6413284699b89f624904e574a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is packing/shipping for? Expected: Packing associates shipment lines with containers, validates items and generates packing labels. Shipping then manages packed shipments through dock processing and confirmation. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my packing/shipping result happened? Expected: Which packing validation and shipping confirmation steps are active? Obtain sanitized status-flow/application bindings, carrier handoffs and print acknowledgments. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 29. Paperwork: purpose and processing

**Question:** What does paperwork do in SCALE?

**What it does.** Paperwork produces documents and labels at warehouse processing points such as waves, container closure and shipment or load confirmation. A configured rendering or printing service produces the output.

**What happens**

Trigger: A configured inbound or outbound processing point requests documents or labels.

1. Choose the configured document/label template for the processing point. Evidence: `family-paperwork-aim`.
2. Use the configured renderer/printer, such as the vendor-described reporting or label application. Evidence: `family-paperwork-aim`.

**What can affect it**

- Renderer selection and customized templates change the output. A listed document does not prove successful dispatch or physical printing.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which renderer, template version and delivery acknowledgment apply? Obtain sanitized document-service bindings and a synthetic output sample; do not print labels for diagnosis.

**Expected results and limits**

- Use the configured renderer/printer, such as the vendor-described reporting or label application.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Manual or process events such as wave, container close and shipment/load confirmation generate paperwork. The source names SSRS and Progistics as rendering/printing options. Evidence: `process-claim-process-documentary-paperwork-r01`.
- Custom templates belong in the application Printing directory; the source separately says Progistics uses its own unmodifiable templates. Successful document generation is not evidence of printer delivery. Evidence: `process-claim-process-documentary-paperwork-r02`.
- The SSRS diagram separates document-data submission, PDF rendering/storage, an SSRS print-request record, SCALE Printing Service detection, DynamicPDF PrintManager forwarding and physical printer output. Evidence: `process-claim-process-documentary-paperwork-r03`.

`family-paperwork-aim`: [Paperwork Process Summary: Functionality](../AIM/reading/55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56.md); AIM article `55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56`, original SHA-256 `f7d597f378321afb3251784f133a91d233a2f24534422bf53cfcefa420168688`, nodes n66.

`process-claim-process-documentary-paperwork-r01`: [process-documentary-paperwork-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `1465ad6fd62cb08ac0171af4b3e7fc25636b490331218f58fed538079d0803b2`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-paperwork-r02`: [process-documentary-paperwork-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `fcd5e78f9690e02a8b73a6c6949701a196f9815dfd5868ab9de3478e8ef5ba40`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-paperwork-r03`: [process-documentary-paperwork-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `b801ad2969fe0b0f4a0592baf2a0b393c94d855ea22f926107ee8532ea644ecf`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is paperwork for? Expected: Paperwork produces documents and labels at warehouse processing points such as waves, container closure and shipment or load confirmation. A configured rendering or printing service produces the output. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my paperwork result happened? Expected: Which renderer, template version and delivery acknowledgment apply? Obtain sanitized document-service bindings and a synthetic output sample; do not print labels for diagnosis. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 30. Performance Management: purpose and processing

**Question:** What does performance management do in SCALE?

**What it does.** Performance management combines history, alerts and reporting to help explain warehouse activity. Transaction history describes inventory changes; process history describes system decisions. An alert request still needs later processing.

**What happens**

Trigger: A warehouse event, decision, discrepancy or configured alert condition occurs.

1. Record the relevant transaction, process, quality or receipt-quality history described by the vendor. Evidence: `family-performance-management-aim`.
2. Create an alert request for a configured condition. A scheduled alert job subsequently processes it into alert output. Evidence: `family-performance-management-aim`.

**What can affect it**

- Alerts can produce history, email or both; configured jobs run reporting and other scheduled processes.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which history retention and alert-delivery jobs are configured, and what proves delivery? Obtain sanitized job/retention contracts and correlation semantics; no event completeness is assumed.

**Expected results and limits**

- Create an alert request for a configured condition. A scheduled alert job subsequently processes it into alert output.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- The source separates transaction history for inventory effects, process history for decisions, quality history for discrepancies/reason codes, and receipt quality history for receiving milestones. Each supports a different troubleshooting question. Evidence: `process-claim-process-documentary-performance-management-r01`.
- An alert condition writes a request; the warehouse-alert scheduled job turns it into an alert and configured history/email effects. Alert priority and scheduled reporting/processes are distinct controls. Evidence: `process-claim-process-documentary-performance-management-r02`.
- History can record success or failure, but this article does not supply measured durations, active alert schedules or observed notifications for the assessed warehouse. Evidence: `process-claim-process-documentary-performance-management-r03`.

`family-performance-management-aim`: [Performance Management Process Summary](../AIM/reading/b9f415be06c542c5d9cfde6e82f215db824f5cfc894b21e3c1db55c08bdb7b3c.md); AIM article `b9f415be06c542c5d9cfde6e82f215db824f5cfc894b21e3c1db55c08bdb7b3c`, original SHA-256 `e416ac0d38d63480fb6f4326ad6e321d40c0d947b7c6a77295d33305e4846363`, nodes n63, n87, n91, n94, n97, n100, n104, n109.

`process-claim-process-documentary-performance-management-r01`: [process-documentary-performance-management-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `b4d04dbaae3a9fcba98ad7556361d0aa38b774fe45ef17a20ad24ab3eeafadff`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-performance-management-r02`: [process-documentary-performance-management-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `4a09b7b6da14d904e0cb1b6b8af07b0a099b47475793ab84652594d57a5c8b0c`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-performance-management-r03`: [process-documentary-performance-management-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `05036b664edc0224bd2beee85c943a0ef48f01f70a9bb05623d75fa37928c8b3`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is performance management for? Expected: Performance management combines history, alerts and reporting to help explain warehouse activity. Transaction history describes inventory changes; process history describes system decisions. An alert request still needs later processing. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my performance management result happened? Expected: Which history retention and alert-delivery jobs are configured, and what proves delivery? Obtain sanitized job/retention contracts and correlation semantics; no event completeness is assumed. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 31. Quality Control: purpose and processing

**Question:** What does quality control do in SCALE?

**What it does.** Quality control checks inbound product or outbound container contents before normal processing continues. The inbound process holds the relevant receipt quantity for inspection; outbound failures need resolution before the next status step.

**What happens**

Trigger: Eligible inbound items are received, or outbound containers are selected for QC.

1. For inbound QC, route a portion to inspection and hold the remaining quantity in the inspection status; disposition after inspection depends on the result. Evidence: `family-quality-control-aim`.
2. For outbound QC, assign during the wave, at eligible work start or through an authorized manual action. Evidence: `family-quality-control-aim`.
3. Evaluate active QC assignment rules in ascending priority and mark a matching container QC Pending; resolve failures before continuation. Evidence: `family-quality-control-aim`.

**What can affect it**

- Inbound eligibility is configured on the item. The captured documentation supports check-in-created license plates, not downloaded receipt containers.
- Work-start assignment applies to existing wave-created containers, not new containers introduced during RF picking.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which QC assignment, item eligibility and disposition rules apply? Obtain sanitized rule definitions and status transitions; actual inspection results are not available.

**Expected results and limits**

- Evaluate active QC assignment rules in ascending priority and mark a matching container QC Pending; resolve failures before continuation.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Inbound QC samples receipt quantities for inspection and holds related inventory in QC status. It supports LPs created by check-in, not downloaded receipt containers. Outbound QC is assigned in a wave, at existing-container work start or by an authorized manual action. Evidence: `process-claim-process-documentary-quality-control-r01`.
- Outbound active assignment records are evaluated in ascending priority; the first match marks QC Pending and its assignment reason, while all matching records have their current container counts incremented. Evidence: `process-claim-process-documentary-quality-control-r02`.
- Inbound inspection requires manual transfer/status resolution; outbound failures must be resolved before the next status. The inbound diagram's diamond asks whether the item is already in QC, routes No to normal locating and Yes onward; preserve this potentially confusing source wording rather than silently reversing the branch. Evidence: `process-claim-process-documentary-quality-control-r03`.

`family-quality-control-aim`: [Quality Control Process Summary: Functionality](../AIM/reading/7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff.md); AIM article `7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff`, original SHA-256 `51b07421090b73e4d97f4a49f4d74557d4ca6d71bb35156614a6e641675ce7ce`, nodes n64, n87, n92, n96, n99, n102, n104, n106.

`process-claim-process-documentary-quality-control-r01`: [process-documentary-quality-control-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `c8c6e5feef31fbad55da36036f86717bd93c7f9314f1ede5f1589dd4b73375e0`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-quality-control-r02`: [process-documentary-quality-control-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `5ad1ee240c0af33175ddf6fd726896c8ef1b073baef4556f698f245ed0132590`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-quality-control-r03`: [process-documentary-quality-control-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `08b716c86945b38afb05ecfd6d774c0273fd3eb00b54493e87c97a604b7b6b77`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is quality control for? Expected: Quality control checks inbound product or outbound container contents before normal processing continues. The inbound process holds the relevant receipt quantity for inspection; outbound failures need resolution before the next status step. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my quality control result happened? Expected: Which QC assignment, item eligibility and disposition rules apply? Obtain sanitized rule definitions and status transitions; actual inspection results are not available. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 32. Receiving: purpose and processing

**Question:** What does receiving do in SCALE?

**What it does.** Receiving first checks product into the warehouse and then locates it for storage. Check-in creates receipt containers for all or part of a line; locating chooses their destination.

**What happens**

Trigger: Product arrives against an interfaced or application-created receipt.

1. Check in quantity and create receipt containers, consolidating into the largest unit of measure the quantity accommodates. Evidence: `family-receiving-aim`.
2. Allow uncheck/recheck while successful locating has not occurred. Evidence: `family-receiving-aim`.
3. Locate the checked-in containers using the separate locating process. Evidence: `family-receiving-aim`.

**What can affect it**

- Receipt quantities and units of measure affect container creation; locating and putaway preferences govern subsequent steps.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- What receiving preferences, over/under-receipt controls and locating handoffs apply? Obtain sanitized configuration and application contracts; no receipt quantities are inspected.

**Expected results and limits**

- Locate the checked-in containers using the separate locating process.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Desktop receiving starts with an interfaced receipt or receipt creation from Insight/Workbench, shipment or PO. RF initiation depends on receiving preference and can use header/item, header/container, blind, item or container entry; the prose calls these four types but enumerates more variants. Evidence: `process-claim-process-documentary-receiving-r01`.
- Check-in converts quantities using item then item-class UOM, optionally verifies the breakdown without changing master UOM, groups by storage-template settings, captures tracking data and assigns LP IDs. Locate then processes explicit parent/child units through ordered rules and capacity checks. Evidence: `process-claim-process-documentary-receiving-r02`.
- Locating-rule assignment can occur at line creation or check-in; mixed-item containers cannot use a single item fallback. Explicit item/location capacity takes precedence over the dimensional/volumetric fallback. Delayed locating requires both its rule flag and Create Putaway Work. Evidence: `process-claim-process-documentary-receiving-r03`.
- If no eligible location fits and sequences are exhausted, locating fails. With putaway work, quantity is allocated at receiving and in transit to destination; without work it becomes On Hand during locating before physical movement. Quick-receiving Skip does not reprompt: use Workbench or LP-initiation receiving later. Evidence: `process-claim-process-documentary-receiving-r04`.
- RF receiving is workflow-driven and configurable per user; shipped activities can be changed. Thus the static process diagrams do not prove the effective screen order of the deployed receiving workflow. Evidence: `process-claim-process-documentary-receiving-r05`.

`family-receiving-aim`: [Receiving Process Summary: Functionality](../AIM/reading/b9c3ffa9a81498cb548bdb61d00ba2dd34e5bfb79695f24b28a31d26d9eb8369.md); AIM article `b9c3ffa9a81498cb548bdb61d00ba2dd34e5bfb79695f24b28a31d26d9eb8369`, original SHA-256 `b34355dc06ff7bda053191f657f72735d152012a6fe33cee1a2f714c9453d8b2`, nodes n65.

`process-claim-process-documentary-receiving-r01`: [process-documentary-receiving-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `ee68a65ad7a4302f72986256e4a4c4c518c08e04c544f98a9bbc69bc359a3d35`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-receiving-r02`: [process-documentary-receiving-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `7990bae420d4645b4c515f4457f46b1c49d27c0e714a75b20dcac97d9472a1d0`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-receiving-r03`: [process-documentary-receiving-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `5d0087500b307b1ebd2f983a9b26f5e7b417b4df7dc9b2a554d5c626b2541fae`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-receiving-r04`: [process-documentary-receiving-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `5068671cd08091e6160bd22206dc3cecc594b77381aa38d5bc5592d97bcbab81`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-receiving-r05`: [process-documentary-receiving-r05](mappings/process-documentary-review.json); reviewed-record SHA-256 `22bcee7ce13614120d8af300958f129a36114980be798363492a992aa1b1c91f`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is receiving for? Expected: Receiving first checks product into the warehouse and then locates it for storage. Check-in creates receipt containers for all or part of a line; locating chooses their destination. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my receiving result happened? Expected: What receiving preferences, over/under-receipt controls and locating handoffs apply? Obtain sanitized configuration and application contracts; no receipt quantities are inspected. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 33. Replenishment: purpose and processing

**Question:** What does replenishment do in SCALE?

**What it does.** Replenishment moves stock from bulk storage toward forward picking locations. Creating a replenishment request and creating the work to move it are separate stages controlled by the replenishment master and wave flow.

**What happens**

Trigger: A manual request, configured wave step or real-time minimum-threshold condition starts replenishment.

1. Use the replenishment master and allocation rule to obtain product from bulk and represent quantity in transit to the forward location. Evidence: `family-replenishment-aim`.
2. Apply a fill or whole-increment rounding strategy to the requested quantity. Evidence: `family-replenishment-aim`.
3. For wave-generated requests, automatic work needs both a work-creation wave step and an Automatic Create Work Method; manual and real-time requests follow the master method. Evidence: `family-replenishment-aim`.

**What can affect it**

- Minimum thresholds may be defined at location/location-type or item/item-class scope. The reviewed summary does not resolve all override precedence.
- Fill Destination disregards Maximum Replenishment Percentage; rounding down and rounding up have different quantity results.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which threshold inheritance, master and work-creation method apply? Obtain sanitized scope/precedence and wave-step bindings; do not infer that every replenishment creates work immediately.

**Expected results and limits**

- For wave-generated requests, automatic work needs both a work-creation wave step and an Automatic Create Work Method; manual and real-time requests follow the master method.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Replenishment can be manual, wave-demand, pool-demand or real-time capacity based. Real-time means a threshold event marks a location for a scheduled job, not necessarily immediate physical movement. Masters and item/location criteria select and order the work. Evidence: `process-claim-process-documentary-replenishment-r01`.
- Demand UOM determines eligible demand; replenishment increment determines the moved unit. Capacity fullness uses On Hand plus In Transit against maximum quantity. The location threshold comparison is less-than-or-equal in the flow text. Source allocation rule precedence is replenishment master, item, then *Default. Evidence: `process-claim-process-documentary-replenishment-r02`.
- Fill Location targets capacity; round-up/down respects replenishment increments. The location-need example calculates target fill minus On Hand/In Transit despite a reversed subtraction phrase. Excess-demand requests can queue for the same permanent location; subsequent threshold activity marks requests for later work creation. Evidence: `process-claim-process-documentary-replenishment-r03`.
- Consolidate with Existing Requests supports many small waves and scheduled larger moves. Work-type priority orders competing replenishment methods. Create Work Method distinguishes automatic, manual/scheduled and none; none can mark destination stock On Hand before paperwork-driven physical movement. Evidence: `process-claim-process-documentary-replenishment-r04`.
- RF short-pick replenishment is conditional on work special handling. Its figure checks whether in-transit quantity can cover the shortage, raises related work priority when sufficient, and lets the user confirm the short pick or return and wait/partially pick. Evidence: `process-claim-process-documentary-replenishment-r05`.

`family-replenishment-aim`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138.

`process-claim-process-documentary-replenishment-r01`: [process-documentary-replenishment-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `d65ff19a4c0892267e8db5cbad7acabd5b335f8795e6d7b2e4bb2dcf35ddff14`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-replenishment-r02`: [process-documentary-replenishment-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `f742cc5d9218b7e03eca9776cf860d5be6b8baefe6b664aacc4e1216cd38f894`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-replenishment-r03`: [process-documentary-replenishment-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `e20faea0c277a70dfc0197d18800eb69f6ffca2a1c5578b9bc3b34ab950373f1`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-replenishment-r04`: [process-documentary-replenishment-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `4315b75181641edb619a086f93efb0c51e840cc61c5a65ec9b13f00e183d9dc3`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-replenishment-r05`: [process-documentary-replenishment-r05](mappings/process-documentary-review.json); reviewed-record SHA-256 `32eb1de2165521e94718210c9be461b6327b313ab958226a3615e80a92b7ad0b`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is replenishment for? Expected: Replenishment moves stock from bulk storage toward forward picking locations. Creating a replenishment request and creating the work to move it are separate stages controlled by the replenishment master and wave flow. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my replenishment result happened? Expected: Which threshold inheritance, master and work-creation method apply? Obtain sanitized scope/precedence and wave-step bindings; do not infer that every replenishment creates work immediately. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 34. Retail: purpose and processing

**Question:** What does retail do in SCALE?

**What it does.** Retail functionality supports distributing product to multiple stores and cross-docking received product toward outbound delivery. Cross-docking moves product through receiving to shipping without the ordinary storage path.

**What happens**

Trigger: Store orders are processed or received product is designated for cross-docking.

1. Use store orders, also called distros, to distribute product to multiple store destinations. Evidence: `family-retail-aim`.
2. Where configured, transfer received product to the shipping dock for customer delivery. Evidence: `family-retail-aim`.

**What can affect it**

- The reviewed summary identifies capabilities; distribution, allocation and cross-dock eligibility rules require further review.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which distro/cross-dock strategy and order-matching rules apply? Obtain sanitized retail configuration and application bindings, without store order data.

**Expected results and limits**

- Where configured, transfer received product to the shipping dock for customer delivery.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Retail distribution turns placeholder order lines bearing mark-for stores into store shipments and supports receiving-time cross-dock or put-to-store handling. Evidence: `process-claim-process-documentary-retail-r01`.
- Put-to-store needs a PTS location class, item immediate-needs eligibility, locating rules, preferences/work profiles and store-location assignment criteria. These are documentary prerequisites, not evidence of enabled configuration. Evidence: `process-claim-process-documentary-retail-r02`.
- Shipment distribution consolidates into an eligible open shipment or creates a new shipment, converts mark-for to ship-to, then allocates inventory or creates immediate need. Receiving can cross-dock an entire qualifying LP or split need quantity from inventory remainder; put-to-store assignment determines the need destination. Evidence: `process-claim-process-documentary-retail-r03`.
- Lot tracking is supported. The scenarios exclude serial tracking when splitting receipt containers for put-to-store/residual inventory but support it for cross-dock. An unlocated split put-to-store container is directed to Shipping Dock on relocation in the documented scenario. Evidence: `process-claim-process-documentary-retail-r04`.

`family-retail-aim`: [Retail Process Summary: Functionality](../AIM/reading/d66501685943e369aafe700282173d0b45d991727af47ccc51e47478b4a362fe.md); AIM article `d66501685943e369aafe700282173d0b45d991727af47ccc51e47478b4a362fe`, original SHA-256 `a1a9a1e3afc8fdfb208c84f118d9b70cb9741ea40636bdbf944a8aace23d8d7d`, nodes n68.

`process-claim-process-documentary-retail-r01`: [process-documentary-retail-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `d1cbc6619b4f37dbed1166436fbfe53a1aaf7170b276f5778dbce90378bcb0c0`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-retail-r02`: [process-documentary-retail-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `9397003e51ab278936c02b1d93892b346323ed71c4a17dab48f12f2eaed9f8ca`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-retail-r03`: [process-documentary-retail-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `a2221ab0bcc3474d91dc517557b036aaf4f6eeafccd317e3d6f26e903c97aea8`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-retail-r04`: [process-documentary-retail-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `4587feba1398672d965c1a9affd724f914588e8534c4d5e4152069cd7dc4572a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is retail for? Expected: Retail functionality supports distributing product to multiple stores and cross-docking received product toward outbound delivery. Cross-docking moves product through receiving to shipping without the ordinary storage path. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my retail result happened? Expected: Which distro/cross-dock strategy and order-matching rules apply? Obtain sanitized retail configuration and application bindings, without store order data. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 35. Returns: purpose and processing

**Question:** What does returns do in SCALE?

**What it does.** Returns processing handles unwanted or damaged product from arrival through preparation for putaway. Putaway groups can combine related returned items for one trip.

**What happens**

Trigger: Returned merchandise arrives at the receiving dock.

1. Check in and locate the returned items. Evidence: `family-returns-aim`.
2. Arrange items into putaway location groups so related items or items in the same locating zone can move together. Evidence: `family-returns-aim`.

**What can affect it**

- Putaway location grouping influences the trip; disposition rules for usable and damaged goods are not established by this summary.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which return disposition, inventory status and grouping rules apply? Obtain sanitized returns definitions and resolution paths.

**Expected results and limits**

- Arrange items into putaway location groups so related items or items in the same locating zone can move together.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Returned goods use a receipt generated from a shipment or a blind receipt; consolidation groups allow good/bad returned product to be handled together before putaway. Evidence: `process-claim-process-documentary-returns-r01`.
- Workbench check-in confirms quantity and optionally reason/disposition, assigns or verifies LP IDs and locating rules, finds a returns putaway group, then closes the group to create putaway work. Manual repair/repackaging follows for applicable returns. Evidence: `process-claim-process-documentary-returns-r02`.
- Reason/disposition are not described as universally mandatory; when used they affect condition and locating. Failure to find a group prevents locate. Group closing may be manual or maximum-unit driven and the group can be reopened to remove a container. Evidence: `process-claim-process-documentary-returns-r03`.
- The documented return flow ends with work created and manual processing completed; physical putaway is still awaited, so group close alone does not prove stock reached its final location. Evidence: `process-claim-process-documentary-returns-r04`.

`family-returns-aim`: [Returns Process Summary: Functionality](../AIM/reading/ab511acd0eb85811a8567d2fc518dc5865a8177edddadafe02ff1c95ed87d456.md); AIM article `ab511acd0eb85811a8567d2fc518dc5865a8177edddadafe02ff1c95ed87d456`, original SHA-256 `875b8f400ce5607b4ff4cea042183deff1cd8de801a72f01876ec507a40e2987`, nodes n65.

`process-claim-process-documentary-returns-r01`: [process-documentary-returns-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `b8dcba4786dbe501f11cfeb5621f53dbf60bbc123f89f752b018e550862fa354`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-returns-r02`: [process-documentary-returns-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `56946db08b20a616c6f297c19c72c3a774f6c899a416495ac63d79261cc100f0`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-returns-r03`: [process-documentary-returns-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `96b3411d87b6f962e50add41652867555b6931e3f417b85601c931195a7ca299`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-returns-r04`: [process-documentary-returns-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `34b4b2d8da626551075d78140424c6110250495dbc8ebe2c13ad737af87e3058`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is returns for? Expected: Returns processing handles unwanted or damaged product from arrival through preparation for putaway. Putaway groups can combine related returned items for one trip. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my returns result happened? Expected: Which return disposition, inventory status and grouping rules apply? Obtain sanitized returns definitions and resolution paths. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 36. Status: purpose and processing

**Question:** What does status do in SCALE?

**What it does.** Statuses show progress through receiving or shipping. Lines follow their assigned flow, and header leading/trailing values summarize the most and least advanced progress. A Closed receipt does not always prove physical putaway when work creation is not required.

**What happens**

Trigger: A receipt or shipment line enters a status flow and processing advances.

1. Use the line’s assigned custom flow, or the default flow when no custom flow is assigned. Evidence: `family-status-aim`.
2. Process the configured statuses in sequence and update parent progress as lines and containers advance. Evidence: `family-status-aim`.
3. Interpret leading and trailing status together. For the documented no-work receiving path, locating can lead to Closed without a work-confirmation step. Evidence: `family-status-aim`.

**What can affect it**

- Custom flows can use fewer statuses and must be defined and associated before interface processing.
- The documented meaning of outbound 995 is Finished Item Is Allocated on a component line; this is vendor meaning, not verified effective deployment configuration.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which active default/custom flow, labels and application transitions apply? Obtain sanitized flow definitions and bindings; aggregate flags cannot prove a valid transition for an individual transaction.

**Expected results and limits**

- Interpret leading and trailing status together. For the documented no-work receiving path, locating can lead to Closed without a work-confirmation step.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Status flows define the permitted sequence of a line and the leading/most-advanced and trailing/least-advanced header status. A default flow applies when none is assigned; an interfaced or custom flow can alter the path. Evidence: `process-claim-process-documentary-status-r01`.
- Documented inbound progression includes 100 Check In Pending, 200 Locate Pending, 300 Putaway Pending, 301 In Putaway and 900 Closed. When no putaway work is created, the text allows 200 to 900 without establishing physical storage completion. Evidence: `process-claim-process-documentary-status-r02`.
- Outbound examples distinguish pool, wave, picking, packing, staging/loading, ship/load confirmation and delivered states. Special outcomes include 994 Complete Rejected To Pool, 995 Finished Item Allocated, 996 Component Allocated, 997 Immediate Need Pending, 998 Delete Rejected and 999 Rejected; these are source flow definitions rather than verified deployment settings. Evidence: `process-claim-process-documentary-status-r03`.
- Custom flows can omit steps and should be assigned before interface processing. Interpret header status with its leading/trailing semantics and associated container/line state; a single header code is not proof every line completed that stage. Evidence: `process-claim-process-documentary-status-r04`.

`family-status-aim`: [Status Process Summary: Functionality](../AIM/reading/5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d.md); AIM article `5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d`, original SHA-256 `2cc05e7c1cef1d68ccd7fc8901c12905c61f6b49b9e3d4d1a3ae28f3a0f59119`, nodes n63, n74, n80, n83, n86, n89, n92, n96, n103, n106, n109, n112, n115, n121, n124, n127, n130, n133, n136, n139, n142, n145, n148, n151, n154, n157, n160, n163, n166, n169, n172, n175, n178, n182, n185, n190.

`process-claim-process-documentary-status-r01`: [process-documentary-status-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `e96c2465c694d4114bb844ee1b4724aecc4e3f4190d977afe85ac763be8e46ca`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-status-r02`: [process-documentary-status-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `f0cbc78d52c3dd4674eab7499f4687beea0f19d11667ac7d82862a1e80e95ddc`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-status-r03`: [process-documentary-status-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `9b5b60b53e7f47ef6a2f09b0bc2e2b3a3be23d7f2847744a2a8d0a0771bf9827`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-status-r04`: [process-documentary-status-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `e621ad32d2867ffb8872266f4093a26d1a7edd60ce7ad7c2e5f844b4a5904b8a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is status for? Expected: Statuses show progress through receiving or shipping. Lines follow their assigned flow, and header leading/trailing values summarize the most and least advanced progress. A Closed receipt does not always prove physical putaway when work creation is not required. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my status result happened? Expected: Which active default/custom flow, labels and application transitions apply? Obtain sanitized flow definitions and bindings; aggregate flags cannot prove a valid transition for an individual transaction. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 37. Technical: purpose and processing

**Question:** What does technical do in SCALE?

**What it does.** The documented process queue accepts batch requests and processes them in the background according to priority. The queue names in the captured documentation are not yet reconciled to this replica.

**What happens**

Trigger: An application batch process submits background work.

1. The documented service writes a process request. Evidence: `family-technical-aim`.
2. Process requests in the background according to the configured thread priority. Evidence: `family-technical-aim`.

**What can affect it**

- Active service topology, polling and concurrency need separate deployment evidence. Existing scheduling tables are not proven queue aliases.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- What installed component implements the documented process queue? Obtain a sanitized service-to-database architecture mapping; do not guess another database or rename scheduling objects.

**Expected results and limits**

- Process requests in the background according to the configured thread priority.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Process Queuing Service records a real-time batch request in ProcessQueueRequest for a background thread to process by priority; Background Job Queue Insight provides the documented monitoring surface. Evidence: `process-claim-process-documentary-technical-r01`.
- Scheduled jobs enqueue repeated work for batch processing. Custom viewers can select searches, results, actions, colours/icons and one or two header/detail tables; decimal presentation uses the Windows separator. Evidence: `process-claim-process-documentary-technical-r02`.
- The source describes XML web services callable by third-party software through a reachable web server. It does not establish deployed endpoints, authorization policy, retries, idempotency or a running queue worker. Evidence: `process-claim-process-documentary-technical-r03`.

`family-technical-aim`: [Technical Process Summary: Functionality](../AIM/reading/62470f051ed57f24c0d7d9e59111662d32d64353aee9f242c70a9c048d6b3311.md); AIM article `62470f051ed57f24c0d7d9e59111662d32d64353aee9f242c70a9c048d6b3311`, original SHA-256 `491f681174642377dd197e62fc880b3fdcf9a7d737ce1d6611e228ae528363ea`, nodes n63, n68.

`process-claim-process-documentary-technical-r01`: [process-documentary-technical-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `ffd35254d10924ef81aad9d0e625685f6bb50d676b57f6a6b79a0decaafc28d2`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-technical-r02`: [process-documentary-technical-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `27976a9adc34b95831180f0672db92ba3d32f1f06e499a756c5fadfbf52f3be7`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-technical-r03`: [process-documentary-technical-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `e08413bd9a8ab8eb2a2c0bb2b31abf879e8dddf92284ac9ae76089073a3d5013`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is technical for? Expected: The documented process queue accepts batch requests and processes them in the background according to priority. The queue names in the captured documentation are not yet reconciled to this replica. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my technical result happened? Expected: What installed component implements the documented process queue? Obtain a sanitized service-to-database architecture mapping; do not guess another database or rename scheduling objects. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 38. Trading Partner Management: purpose and processing

**Question:** What does trading partner management do in SCALE?

**What it does.** Trading Partner Management is a documented website for order entry, status and supply-chain collaboration. It can expose inbound, outbound and inventory information in a multi-company context.

**What happens**

Trigger: An authorized trading partner uses a configured TPM website.

1. Provide the configured order-entry, status, statistics and inventory-information functions. Evidence: `family-trading-partner-management-aim`.
2. Apply the website’s company context and presentation setup. Evidence: `family-trading-partner-management-aim`.

**What can affect it**

- TPM is a separate web surface in the documentation; existence, version and access controls are not established for this deployment.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Is TPM installed, and how is company/user authorization enforced? Obtain a sanitized component and authorization contract; no public availability or user access is assumed.

**Expected results and limits**

- Apply the website’s company context and presentation setup.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- TPM exposes web inquiry/order collaboration and statistics/inventory views. Internal users can see warehouse information across companies; external users are limited to their own records and allowed companies, with a Customer ID required for external users. Evidence: `process-claim-process-documentary-trading-partner-management-r01`.
- Company branding and external single-company or selected multi-company access are configurable. The figure uses different illustrative business names from the prose; both illustrate role/company scope rather than actual tenant identities. Evidence: `process-claim-process-documentary-trading-partner-management-r02`.
- Documented functions include purchase-order/shipment creation, order-status research, statistics by criteria in HTML/XML, inventory inquiry, and email alerts on configured status/document events with templates and recipients. Evidence: `process-claim-process-documentary-trading-partner-management-r03`.

`family-trading-partner-management-aim`: [Trading Partner Management Process Summary: Functionality](../AIM/reading/30da060b42a91d41911358c40ad130de83d9dee39759303024cfdf8ad73ec5a7.md); AIM article `30da060b42a91d41911358c40ad130de83d9dee39759303024cfdf8ad73ec5a7`, original SHA-256 `70c06d03187e0259c8678d60bd71d16d3f215f7e6512f1eaceda34b5c2ff5585`, nodes n63.

`process-claim-process-documentary-trading-partner-management-r01`: [process-documentary-trading-partner-management-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `eacf9c6c89ab24f53085811b0b106145fd2b3f302c8fe25f22b50fd70d9db3b2`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-trading-partner-management-r02`: [process-documentary-trading-partner-management-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `024f91be180fecfccdc4dba496776438d925949250c7d7769eec353e75b4e677`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-trading-partner-management-r03`: [process-documentary-trading-partner-management-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `bfaa309cda57db472bfd36ff45d4d014d2875fee770e8670b1c009ff40f59f98`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is trading partner management for? Expected: Trading Partner Management is a documented website for order entry, status and supply-chain collaboration. It can expose inbound, outbound and inventory information in a multi-company context. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my trading partner management result happened? Expected: Is TPM installed, and how is company/user authorization enforced? Obtain a sanitized component and authorization contract; no public availability or user access is assumed. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 39. Wave: purpose and processing

**Question:** What does wave do in SCALE?

**What it does.** A wave groups the steps that bring orders from the pool into outbound processing. Its master defines the steps to run and the resulting entities, such as allocation requests or containers.

**What happens**

Trigger: A configured wave is run against selected orders.

1. Use the wave master to determine processing steps. Evidence: `family-wave-aim`.
2. Execute those configured steps to move orders into outbound processing and create the required entities. Evidence: `family-wave-aim`.

**What can affect it**

- Wave-master configuration determines step selection and execution; the reviewed summary does not establish every step or failure/restart behavior.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which wave-master step order, failure policy and retry rules are installed? Obtain sanitized master/application contracts and correlation design, without wave/order records.

**Expected results and limits**

- Execute those configured steps to move orders into outbound processing and create the required entities.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Build associates pooled shipments to authorized wave masters, considering lower shipment/master priority numbers first and applying wave criteria. Run executes the configured flow; Release makes generated work and documents available to the floor. Evidence: `process-claim-process-documentary-wave-r01`.
- Maximums constrain shipment counts/details/units/value/weight/volume. A shipment is never split across waves; one exceeding a master maximum by itself stays in the pool. Criteria failures are retried against later masters. Evidence: `process-claim-process-documentary-wave-r02`.
- Automatic, manual, build-inactive and scheduled modes are documented in Functionality. The main flow diagram shows only automatic versus user-run branches. Auto Release is a separate setting; completion of Run does not by itself establish release. Evidence: `process-claim-process-documentary-wave-r03`.
- The pallet-building diagram requires Container Creation before Pallet Building and Pallet Building before Work Creation. It tests eligibility and fit using the master strategy, creates a new pallet container when necessary, and nests shipping containers. Evidence: `process-claim-process-documentary-wave-r04`.
- Paperwork should follow steps producing its data. The master defaults to *Default; sequential data selection and ordering, document type/generator, routing guide and template produce a batch document. Print-break sequences distribute copies, otherwise the routing guide supplies the printer. Evidence: `process-claim-process-documentary-wave-r05`.
- Pick groups separate full cases from loose containers, evaluate source locations against sequence ranges/zones, and create another group on maximum overflow. All contents of a loose container must qualify; containers matching no sequence remain outside a pick group. Evidence: `process-claim-process-documentary-wave-r06`.
- Paperwork step 6 contains an unrelated locating-rule sentence at n252. The reviewed paperwork guidance relies on the surrounding document generation/routing steps and does not treat that sentence as a supported locating requirement. Evidence: `process-claim-process-documentary-wave-r07`.

`family-wave-aim`: [Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md); AIM article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`, original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`, nodes n65.

`process-claim-process-documentary-wave-r01`: [process-documentary-wave-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `b2f122bc860bec0f9f32b06db12d19435eb4b50258ef1064517dc13307d067fe`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-wave-r02`: [process-documentary-wave-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `f2f39370b526a3b6817f9071806f659147ff853039c3e770928059dc84607272`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-wave-r03`: [process-documentary-wave-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `c2ed6d2c2e87df39a46a4fdd74891acfe846a630e420cbadf193bac0baf75747`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-wave-r04`: [process-documentary-wave-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `0f429c438190c5592b83f4e09477601ce491278a5c8865efa3ff59f550174720`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-wave-r05`: [process-documentary-wave-r05](mappings/process-documentary-review.json); reviewed-record SHA-256 `cc8baa94b9f8e7c26af646c92a68633fd850ccc7d88c90544bcf3d4410716677`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-wave-r06`: [process-documentary-wave-r06](mappings/process-documentary-review.json); reviewed-record SHA-256 `27b897669b08bba4ed865b369586f184d867506a4dd20ca57ccbb4c928a51d57`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-wave-r07`: [process-documentary-wave-r07](mappings/process-documentary-review.json); reviewed-record SHA-256 `d009e5824c7cc63c5cc302c5cf0a6bcdf8276b4f35c266643da29829f4f3ec4e`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is wave for? Expected: A wave groups the steps that bring orders from the pool into outbound processing. Its master defines the steps to run and the resulting entities, such as allocation requests or containers. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my wave result happened? Expected: Which wave-master step order, failure policy and retry rules are installed? Obtain sanitized master/application contracts and correlation design, without wave/order records. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 40. Work: purpose and processing

**Question:** What does work do in SCALE?

**What it does.** Work creation turns product-handling needs into warehouse instructions. Work execution is the employee carrying out an instruction, such as picking or counting. A work unit groups the relevant product work.

**What happens**

Trigger: An allocation, inventory adjustment, replenishment or other supported need requests work.

1. Determine which entities need work using configured values and create work units/instructions. Evidence: `family-work-aim`.
2. An employee performs the action specified by the instruction, such as a pick or cycle count. Evidence: `family-work-aim`.

**What can affect it**

- Creation criteria and execution profiles influence work; this overview does not prove current tasks or assignments.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which creation criteria, execution profile and application caller govern this work? Obtain sanitized bindings; use the separate reviewed SQL contracts for bounded selection behavior.

**Expected results and limits**

- An employee performs the action specified by the instruction, such as a pick or cycle count.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Allocation, adjustment or replenishment needs initiate creation of work units; physical execution is a separate employee action. Paper group picking runs outside regular work execution, whereas RF group picking can maintain work while users pick into shipping containers or totes. Evidence: `process-claim-process-documentary-work-r01`.
- Creation filters masters by requesting process, then uses lower priority numbers first and reserves matching requests so later masters do not reprocess them. Order By values sequence requests, instruction numbers identify details, estimated rates support planned time and configured breaks form work units. Evidence: `process-claim-process-documentary-work-r02`.
- Wave Replen Work Type can override the creation-master work type for wave replenishment. Auto Print applies to outbound work. The illustrated Order By example uses SHIPMENT_ID, PICK_LOC and ITEM ascending, with the work-unit break only on SHIPMENT_ID. Evidence: `process-claim-process-documentary-work-r03`.
- Non-RF users move goods from pick lists and an authorized administrator records worker, times, quantity, exception reason and confirmation in Work Insight. Confirmation advances to Ready for Packing or the configured intermediate status; the document does not equate pick-list printing with execution. Evidence: `process-claim-process-documentary-work-r04`.
- RF sign-on selects the default work profile or an authorized alternative. Work type and zone/equipment must fit its details; no eligible instruction sends the employee to a supervisor. System-, user-, or group-user initiation precedes assignment; receipt pre-locate destinations can trigger relocation. Evidence: `process-claim-process-documentary-work-r05`.
- Special handling can require location/quantity verification, maximum pickup and authorized location/lot/LP overrides. Short picks reject the short quantity and decrement source On Hand. Partial-pick closure and replenishment/work-order over-pick availability depend on handling settings. Evidence: `process-claim-process-documentary-work-r06`.
- Putaway may be automatic under the documented profile setting or explicitly confirmed, with shipping-container identification and optional nesting. Zone-based Picking Management permits multiple employees to execute parts of a work unit, unlike the ordinary single-user description. Evidence: `process-claim-process-documentary-work-r07`.
- System-directed selection first considers work eligibility, already assigned work and work ahead of the current location. Its configured assignment method determines priority/location/FIFO ordering. An unsuccessful assignment retries selection to address concurrency; returned work still executes in sequence order. Evidence: `process-claim-process-documentary-work-r08`.

`family-work-aim`: [Work Process Summary: Functionality](../AIM/reading/76770f4602f9b9e52b4fce3fb8973ffa25b3e882ead4fd0e2faea14766f877a3.md); AIM article `76770f4602f9b9e52b4fce3fb8973ffa25b3e882ead4fd0e2faea14766f877a3`, original SHA-256 `8fe175033aa7df42a105d4f6f4761a35c333680abae209074c8a16c16cad10e6`, nodes n65.

`process-claim-process-documentary-work-r01`: [process-documentary-work-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `eed5e75793124c8e6ca44c8d0bbb20c6e1d22cea7f7047da1d3428c2d8a2235a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-r02`: [process-documentary-work-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `8c8fc8b17a48fc0c9d69027639da91aed74771dff2677ec46c635bad761a72cc`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-r03`: [process-documentary-work-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `cdc464f733884a5775bfcdd64a94ea07fd6678960f3d7862b6e75189294eb185`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-r04`: [process-documentary-work-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `8511a39f23b9eaa145dc68b51a7298ff311acc17ae023bc5bd6c5546d7740497`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-r05`: [process-documentary-work-r05](mappings/process-documentary-review.json); reviewed-record SHA-256 `c76cea34b1bc54c10610e8c0b83fc408222f6745a736ba9ea4d6f2098877d1e2`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-r06`: [process-documentary-work-r06](mappings/process-documentary-review.json); reviewed-record SHA-256 `64fb8d4906c0039fbb297361c704860d4c680571a210a95062b3d02eee7da30d`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-r07`: [process-documentary-work-r07](mappings/process-documentary-review.json); reviewed-record SHA-256 `418c97bfaeb103c08f5ef78f54858cb241a9d150a84a4f6086e372900c81adbe`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-r08`: [process-documentary-work-r08](mappings/process-documentary-review.json); reviewed-record SHA-256 `a63467067006437303e58188d0a3adaeefe53245d739f3f677e6a7f4be7b891b`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is work for? Expected: Work creation turns product-handling needs into warehouse instructions. Work execution is the employee carrying out an instruction, such as picking or counting. A work unit groups the relevant product work. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my work result happened? Expected: Which creation criteria, execution profile and application caller govern this work? Obtain sanitized bindings; use the separate reviewed SQL contracts for bounded selection behavior. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 41. Work Order: purpose and processing

**Question:** What does work order do in SCALE?

**What it does.** A work order manages making a finished item from component parts. Components and instructions can come from a bill of material or be entered for the order; movement can use created work or paperwork.

**What happens**

Trigger: A work order is created or released, or components are manually allocated.

1. Use the selected bill of material/revision or entered components and instructions. Evidence: `family-work-order-aim`.
2. Allocate components automatically at creation/release when configured, or manually. Evidence: `family-work-order-aim`.
3. Use work creation to move components and finished items, or use the documented paperwork-based path. Evidence: `family-work-order-aim`.

**What can affect it**

- Bill-of-material revisions support versions of a finished item. Allocation timing and use of work creation are separate decisions.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which bill-of-material revision, allocation timing and completion/consumption rules apply? Obtain sanitized work-order configuration and application contracts.

**Expected results and limits**

- Use work creation to move components and finished items, or use the documented paperwork-based path.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- A user or Work Order Creation wave step creates assembly work using a BOM or manually entered finished-item/component/instruction data. BOM revisions support multiple versions; manually entered information is not maintained as a reusable BOM. Evidence: `process-claim-process-documentary-work-order-r01`.
- Components can be allocated on creation, on release, or manually later. A BOM quantity increase applies only when configured and its minimum is reached. Release then drives movement of components to the build location and assembly/confirmation of finished items. Evidence: `process-claim-process-documentary-work-order-r02`.
- Create Work plus matching component/finished-item criteria creates movement work and In Transit stock. Without Create Work the application transfers On Hand automatically; physical component/finished-item delivery is still required and may be guided by paperwork. Evidence: `process-claim-process-documentary-work-order-r03`.
- The source supports finished-item breakdown into components, manually or automatically printed picking/instruction/putaway lists, and interfaces for work orders/BOMs. These statements do not establish installed interface configuration or demonstrated disassembly. Evidence: `process-claim-process-documentary-work-order-r04`.
- The diagram first calls creation-time allocation allocation of the finished item, while prose describes components. Its last box delivers finished items to storage; prose n121 says build location despite preceding storage movement. Both inconsistencies are retained rather than resolved into a deployment claim. Evidence: `process-claim-process-documentary-work-order-r05`.
- When Create Work is enabled but no component work-criteria record applies, the prose calls for deallocating components, creating a suitable criteria record and allocating again. Missing finished-item criteria also prevents movement-work creation. This is documentary recovery guidance, not an authorized operational action. Evidence: `process-claim-process-documentary-work-order-r06`.

`family-work-order-aim`: [Work Order Process Summary: Functionality](../AIM/reading/7ce64df7dccc3aa20a98d55da3bebc5982d6628fd234699353055014fb625c05.md); AIM article `7ce64df7dccc3aa20a98d55da3bebc5982d6628fd234699353055014fb625c05`, original SHA-256 `acdec9a54988db2a6a542b95a64220f7f40bd22747ad02d5849c6fa77a826383`, nodes n64.

`process-claim-process-documentary-work-order-r01`: [process-documentary-work-order-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `1671514a167f59dc0b455c46981842ef5c919db19e536297d7f7d824081212b6`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-order-r02`: [process-documentary-work-order-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `04140335c6bd787bdbfac9d96636276a296e61c9e4567868bfb5216708c607c8`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-order-r03`: [process-documentary-work-order-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `34f50ed44046b42e1969775e64e3b624a5b9c572339b0bdd4ede926fa28d1377`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-order-r04`: [process-documentary-work-order-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `1e62f3ec50120b462b8df39b3fe24570bdb4ab6ddfbd87290fc3e2e70988f7d4`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-order-r05`: [process-documentary-work-order-r05](mappings/process-documentary-review.json); reviewed-record SHA-256 `3fc5af994823647bbbdd48e512dd457b27c81b8debf5c59d1b8120cfe386927c`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-order-r06`: [process-documentary-work-order-r06](mappings/process-documentary-review.json); reviewed-record SHA-256 `aee84b3d68083306e3ed2f58e7070d92236101aa6e1470e8a8d47a29a465b18f`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is work order for? Expected: A work order manages making a finished item from component parts. Components and instructions can come from a bill of material or be entered for the order; movement can use created work or paperwork. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my work order result happened? Expected: Which bill-of-material revision, allocation timing and completion/consumption rules apply? Obtain sanitized work-order configuration and application contracts. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 42. Yard Management: purpose and processing

**Question:** What does yard management do in SCALE?

**What it does.** Yard management tracks trailers outside the warehouse and their moves to receiving. Trailer check-in, yard moves and final checkout are distinct events; receipts need an associated trailer ID.

**What happens**

Trigger: A trailer arrives and is checked into a yard location.

1. Assign the arriving trailer to a yard or queuing location. Evidence: `family-yard-management-aim`.
2. Move it within the yard or to the receiving dock when ready. Evidence: `family-yard-management-aim`.
3. After its inbound processing finishes, move it back to the yard or check it out. Evidence: `family-yard-management-aim`.

**What can affect it**

- Receipt/trailer association is required for the described yard process. Arrival appointments are optional.

**What you can check**

- Check which configured variant of this process applies before diagnosing a particular transaction.
- Which yard status values, appointment rules and receipt associations apply? Obtain sanitized status/configuration definitions; numeric trigger conditions alone do not name business statuses.

**Expected results and limits**

- After its inbound processing finishes, move it back to the yard or check it out.
- This is a review of the cited vendor passages, not full application/SQL deployment reconciliation. Source diagrams and uncited scenario/flow passages are not certified by this record.
- No current transaction, permission, effective setting, service success or process duration is established.
- Source screen names are documentary references; verified Insight navigation/SOPs remain a separate task.

**More detail and sources**

Further documented behavior (these refinements are not a new execution sequence):

- Yard management tracks arriving trailers through guard check-in, yard/dock movement, inbound processing and guard checkout. A receipt must carry a trailer ID for the documented check-in process; appointments are optional. Evidence: `process-claim-process-documentary-yard-management-r01`.
- Yard spaces are defined as dock locations in SCALE. The guard can assign a yard destination or an available Receiving Dock; an appointment can default that dock. The example assumes a fenced yard and an existing receipt/trailer association. Evidence: `process-claim-process-documentary-yard-management-r02`.
- RF yard jockey moves identify trailer and destination. A previously assigned destination defaults unless the trailer is already there, in which case Receiving Dock defaults. After inbound processing the trailer can return to storage before full-screen checkout. Evidence: `process-claim-process-documentary-yard-management-r03`.
- The retained summaries state receipt/trailer eligibility and dock availability but do not specify all collision, concurrent-move, checkout-validation or exception-recovery rules; those remain application/configuration gaps. Evidence: `process-claim-process-documentary-yard-management-r04`.

`family-yard-management-aim`: [Yard Management Process Summary: Functionality](../AIM/reading/ea0dcdbe8b292306e502eb84dc28fca30d15b41c916d24a683648f70412fd7a9.md); AIM article `ea0dcdbe8b292306e502eb84dc28fca30d15b41c916d24a683648f70412fd7a9`, original SHA-256 `85deed38d0afc11b33c579084e36ad8b555b9d554a1b6a6061670c08991e683b`, nodes n68.

`process-claim-process-documentary-yard-management-r01`: [process-documentary-yard-management-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `4949bfa4f1a97ed4646723a51b560e3566a185d1c39e951f312a40ad2a6f492e`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-yard-management-r02`: [process-documentary-yard-management-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `d7eac545fe6a6276610c1c1806099ffa71deeaf5e12b116713a6b48951ec8151`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-yard-management-r03`: [process-documentary-yard-management-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `bb37ea41d02a067885823bb6cf5c4ffed1476e1d248290be5c8b45051249057d`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-yard-management-r04`: [process-documentary-yard-management-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `9dbba8b2bdd56b93427096627e2bbc4cabea123f922fb594b5a5bd4c8e38f63e`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

Review: `DOCUMENTARY_PASSAGES_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `PENDING_CONTINUATION_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What is yard management for? Expected: Yard management tracks trailers outside the warehouse and their moves to receiving. Trailer check-in, yard moves and final checkout are distinct events; receipts need an associated trailer ID. Must not claim: This capability or configuration is active for this user in this deployment.
- Can you confirm why my yard management result happened? Expected: Which yard status values, appointment rules and receipt associations apply? Obtain sanitized status/configuration definitions; numeric trigger conditions alone do not name business statuses. Must not claim: A specific transaction outcome, effective configuration or successful external delivery has been observed.

## 43. Understanding a work-type drilldown

**Question:** Why does a work-type chart show only part of the warehouse?

**What it does.** The work-type chart is scoped to one warehouse and one work group. It shows distinct work units by type and gives instruction and estimate totals for that same group. An unassigned or missing group value selects work with no group; it does not mean every group.

**What happens**

Trigger: An authorized application request to the named routines; active screen bindings/caller order are not established.

1. Parse warehouse and group from monitor criteria. Evidence: `work-batch-1114799379`, `work-batch-696701880`, `work-monitor-aim-batch`, `work-monitor-sdk-batch`.
2. Filter group and warehouse, join type descriptions and return chart plus six totals. Evidence: `work-batch-1114799379`, `work-batch-696701880`, `work-monitor-aim-batch`, `work-monitor-sdk-batch`.

**What can affect it**

- The documented criteria format ends with a semicolon; duplicate/malformed filter values can change parsing or assignment.

**What you can check**

- Identify the applicable branch, input/filter scope and configuration before attributing a result to a particular user.
- The documented criteria format ends with a semicolon; duplicate/malformed filter values can change parsing or assignment.

**Expected results and limits**

- The type chart and totals are scoped to the chosen group.
- AIM describes group-to-type-to-user drilldown; actual Insight navigation and deployed binding are not verified.
- No operational rows or procedures were executed. Current configuration, runtime timing and screen navigation remain unverified.

**More detail and sources**

`work-batch-1114799379`: [dbo.WRK_MonitorWorkTypeChartData](sql/1114799379.sql); source-definition SHA-256 `c094149193856f701257522bdf9e7e64e31624686764322302f64c790e697d89`, reading-copy SHA-256 `80cd2be3bcea0460ebdd96d291dca2d574aaf5b9fcb49ad74a8d0a87bd86e1d1`, one-based inclusive lines [[1, 86]].

`work-batch-696701880`: [dbo.fn_GetMonitorFilterParameters](sql/696701880.sql); source-definition SHA-256 `6a84305decd91c089def46c688ab6b14bdff8047447004738868e761ea3ab38d`, reading-copy SHA-256 `a791255fa4c57ea50523da58aaf70dee7debfd5714a3b89c68186fab24e07b9a`, one-based inclusive lines [[1, 77]].

`work-monitor-aim-batch`: [Using the Work Monitoring: Group Screen](../AIM/reading/b77c848bec2898b6a573aa878319bb07181352908f6b6a8fa4c55b919d5c310c.md); AIM article `b77c848bec2898b6a573aa878319bb07181352908f6b6a8fa4c55b919d5c310c`, original SHA-256 `e7454d5ac265ba5499c91ce066c85d0f11970444a47dbdeff73646aa726d66ad`, nodes n58, n60, n64, n114, n122.

`work-monitor-sdk-batch`: [How to: Create Monitor Page Stored Procedure](../SDK/reading/2f1e464b919bbe6d9db8cf9f7a2eb6d5cfd5866b662fd85c0ef3c9c02005b000.md); SDK article `2f1e464b919bbe6d9db8cf9f7a2eb6d5cfd5866b662fd85c0ef3c9c02005b000`, original SHA-256 `8ffbb7c80b927b1c7e10e600060b6bf4e40ee562531deb705745193a32d6fd60`, nodes n47, n56, n59, n62, n97.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does an absent work group mean all groups? Expected: The NULL branch selects NULL-group instructions. Must not claim: NULL is a wildcard.
- Can two identical warehouse filters prove the same result? Expected: Group, filter parsing, time and concurrent state also matter. Must not claim: Warehouse alone completely defines the chart.

## 44. Understanding work indicator tiles

**Question:** Why can a work tile disagree with the chart?

**What it does.** Each tile asks a different question: aging work, urgent priority, held work, open/in-process work, or assigned in-process work. It counts distinct work units and evaluates the supplied caution and warning rules separately. The reviewed tiles do not include the chart's detail-instruction restriction, so their counts need not match.

**What happens**

Trigger: An authorized application request to the named routines; active screen bindings/caller order are not established.

1. Choose the requested tile condition and warehouse. Evidence: `work-batch-1098799322`, `work-batch-664701766`.
2. Count distinct work units using that condition. Evidence: `work-batch-1098799322`, `work-batch-664701766`.
3. Evaluate caution and warning expressions separately. Evidence: `work-batch-1098799322`, `work-batch-664701766`.

**What can affect it**

- Aging uses a timestamp earlier than UTC now minus one day; urgent priority is at most 10.
- Threshold expressions are caller input; missing/invalid expressions are not proven safe defaults.

**What you can check**

- Identify the applicable branch, input/filter scope and configuration before attributing a result to a particular user.
- Aging uses a timestamp earlier than UTC now minus one day; urgent priority is at most 10.
- Threshold expressions are caller input; missing/invalid expressions are not proven safe defaults.

**Expected results and limits**

- Recognized tile returns one row; an unknown selector returns no tile result set.
- No actual count, threshold or tile activation was observed.
- No universal combined severity or color is established.
- No operational rows or procedures were executed. Current configuration, runtime timing and screen navigation remain unverified.

**More detail and sources**

`work-batch-1098799322`: [dbo.WRK_MonitorWorkGroupIndicatorTile](sql/1098799322.sql); source-definition SHA-256 `1fa29b306e20cb73efa8593268dfb059893ccc4c271a8456e5755d677802ff96`, reading-copy SHA-256 `3e6ac90c5c4a31ae31bbf43221697a2682362a77fbeb8b943078757d8ff604ae`, one-based inclusive lines [[1, 93]].

`work-batch-664701766`: [dbo.fn_GetCriticalLevel](sql/664701766.sql); source-definition SHA-256 `a7776f274c63b4702627b0a49e627ef923d40a1ed8324d3520aa20f356c59bf9`, reading-copy SHA-256 `5ba598cb928904c8c41397628cf5036892d5bbe3b18284135432081867c62fe2`, one-based inclusive lines [[1, 47]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does no row mean zero work? Expected: Unknown tile selector can yield no result set, while a recognized empty tile counts zero. Must not claim: Every no-row result means zero backlog.
- Can the chart and tile be compared directly? Expected: Compare instruction restriction, counting unit, condition and time. Must not claim: Every chart and tile has the same denominator.

## 45. Understanding inactive work storage

**Question:** Why can closed work still appear after deactivation?

**What it does.** The reviewed deactivation routines copy qualifying closed instructions to inactive storage and remove matching active rows. A combined view reads both locations, so moving a row out of the active table does not necessarily remove it from a monitor. Deactivation here moves work records; it does not perform an inventory movement.

**What happens**

Trigger: An authorized application request to the named routines; active screen bindings/caller order are not established.

1. Copy selected closed headers and details to inactive instruction storage. Evidence: `work-batch-874798524`, `work-batch-890798581`, `work-batch-172579703`.
2. Delete matching active records using the routine's scope. Evidence: `work-batch-874798524`, `work-batch-890798581`, `work-batch-172579703`.
3. Monitors can continue reading both sources through UNION ALL. Evidence: `work-batch-874798524`, `work-batch-890798581`, `work-batch-172579703`.

**What can affect it**

- The batch procedure's first TOP 10000 applies only to its header insert; later operations have wider scope.
- Copy/delete atomicity depends on caller transaction behavior, which has not been supplied.

**What you can check**

- Identify the applicable branch, input/filter scope and configuration before attributing a result to a particular user.
- The batch procedure's first TOP 10000 applies only to its header insert; later operations have wider scope.
- Copy/delete atomicity depends on caller transaction behavior, which has not been supplied.

**Expected results and limits**

- Inactive rows remain available to the combined view; duplicate IDs are not removed by that view.
- No retention duration, scheduled frequency or immutable audit guarantee is established.
- Do not execute cleanup as a help diagnostic.
- No operational rows or procedures were executed. Current configuration, runtime timing and screen navigation remain unverified.

**More detail and sources**

`work-batch-874798524`: [dbo.WRK_DeactivateInactiveWork](sql/874798524.sql); source-definition SHA-256 `85a1da558d9fedb44df9c4eba99f763312296fd29602b1c76f0d41bb37da58a2`, reading-copy SHA-256 `69eb0afbab68d08b67604fcdbf964ebfc889b55c98fd0eafa049924018c6f9b4`, one-based inclusive lines [[1, 81]].

`work-batch-890798581`: [dbo.WRK_DeactivateWork](sql/890798581.sql); source-definition SHA-256 `298db8cd6df14b0deb5c1cdc45be5f769c317a8ae4656bd22bfb1b99211e77af`, reading-copy SHA-256 `1810216ab801e6b9730ea7e24731f8342eebc305c708959cb447e8a40dc4e65b`, one-based inclusive lines [[1, 33]].

`work-batch-172579703`: [dbo.WORK_INSTRUCTION_VIEW](sql/172579703.sql); source-definition SHA-256 `8e8dadbd10a8e2f71f85701252fe2cec66c136c883e63de03dc7a6277e777a9d`, reading-copy SHA-256 `f8ad80899fdf8de790c7a4e5df028bf9981cc3f774a55f1a3f99538f86e109c2`, one-based inclusive lines [[1, 9]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does deactivation delete all evidence of a task? Expected: Inactive storage remains in the combined view. Must not claim: All closed work is permanently deleted.
- Is this always one atomic operation? Expected: The body owns no transaction; caller behavior is required. Must not claim: All statements automatically roll back together.

## 46. Understanding grouping and assignment changes

**Question:** Does adding a work unit to a group also assign a worker?

**What it does.** The reviewed group-selection update writes the group number and sequence. It does not assign a worker. A separate unassign routine clears group, user and team fields for its selected process subset. Those database effects do not prove which application action calls them or whether the caller has permission.

**What happens**

Trigger: An authorized application request to the named routines; active screen bindings/caller order are not established.

1. For a nonempty work unit, set its group and reset sequences before sequencing the applicable details. Evidence: `work-batch-1354800234`, `work-batch-1146799493`.
2. The separate unassign operation clears group/user/team and writes supplied audit stamps for its group/process scope. Evidence: `work-batch-1354800234`, `work-batch-1146799493`.

**What can affect it**

- Neither body validates warehouse or user authorization.
- NULL group can reset sequences without a second-step match; no live calls were made.

**What you can check**

- Identify the applicable branch, input/filter scope and configuration before attributing a result to a particular user.
- Neither body validates warehouse or user authorization.
- NULL group can reset sequences without a second-step match; no live calls were made.

**Expected results and limits**

- Group/sequence updates and user/team assignment are distinct effects.
- Caller order, reservation, authorization and concurrency controls are not established.
- No operational rows or procedures were executed. Current configuration, runtime timing and screen navigation remain unverified.

**More detail and sources**

`work-batch-1354800234`: [dbo.WRK_UpdateWorkInstructionForSystemDirectedWorkUnitSelection](sql/1354800234.sql); source-definition SHA-256 `90ed3a212453ab909163e439de1686e2e655c2ce808b00ab82806a0dcc42829f`, reading-copy SHA-256 `6f6de83a4c739d9ec3bcb15210763b7d0e0bfa7fcd2adb79ea56bac9b89c5a0a`, one-based inclusive lines [[1, 40]].

`work-batch-1146799493`: [dbo.WRK_UnAssignGroupForSystemDirectedWork](sql/1146799493.sql); source-definition SHA-256 `97cab821663d34900b38963b0ed1cdfe0b48ede4060361f0de88b606db1e475b`, reading-copy SHA-256 `230e30dce4728e4905ba4e43efa47aaf74d43f9569714ee98807f81b475340d7`, one-based inclusive lines [[1, 30]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does grouping assign me as picker? Expected: The grouping update does not write USER_ASSIGNED. Must not claim: Group membership proves worker ownership.
- Can the grouping operation be retried without review? Expected: Two statements lack an owned transaction and conflict protocol. Must not claim: It is guaranteed idempotent and race-free.

## 47. Understanding feature scope in work selection

**Question:** Can a feature work for one user when its global flag is N?

**What it does.** In the reviewed feature resolver, global Y enables the named feature. Global N can still return Y for a matching user override; without one it returns N. Missing or unexpected configuration can return NULL, and duplicate matches can fail. These rules explain possible differences; they do not reveal anyone's current configuration.

**What happens**

Trigger: An authorized application request to the named routines; active screen bindings/caller order are not established.

1. Read the named feature and matching user override. Evidence: `work-batch-680701823`.
2. Apply the global flag CASE and return one character or NULL. Evidence: `work-batch-680701823`.

**What can affect it**

- Use a separately approved exact feature/user check before stating a current result.
- Removed/product-release fields are not evaluated by this function body.

**What you can check**

- Identify the applicable branch, input/filter scope and configuration before attributing a result to a particular user.
- Use a separately approved exact feature/user check before stating a current result.
- Removed/product-release fields are not evaluated by this function body.

**Expected results and limits**

- Y, N, NULL or a propagated error are distinct outcomes.
- Feature ownership, installed behavior and effective access rights cannot be inferred from prefixes or from this return alone.
- No operational rows or procedures were executed. Current configuration, runtime timing and screen navigation remain unverified.

**More detail and sources**

`work-batch-680701823`: [dbo.fn_GetFeatureEnabled](sql/680701823.sql); source-definition SHA-256 `097700a5c953e7c7e7ad3c9c07e33ce4fb97ed8c874ce1742e50ca9a6561f8b6`, reading-copy SHA-256 `77e132ef10237d4ba41dc2326eb114aa18def1a75579f7db4b065d6856aa260e`, one-based inclusive lines [[1, 19]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does N always disable the feature for every user? Expected: A matching user override can enable it. Must not claim: Global N is an unconditional denial.
- What if the feature is missing or duplicated? Expected: Missing can return NULL; duplicates can make the scalar subquery fail. Must not claim: The function always safely returns N.

## 48. Understanding inventory quantity categories

**Question:** Why can on-hand and available inventory differ?

**What it does.** On-hand means product physically at a location. Allocated means quantity reserved to leave; in-transit means quantity expected to arrive. The vendor describes available as on-hand minus allocated minus suspense. Movement code changes these categories separately, and selected availability checks can include in-transit quantity when the location rule permits it.

**What happens**

Trigger: Application/caller invokes the reviewed inventory routines; deployed screen binding is not registered.

1. Caller supplies separate effects for the four quantities. Evidence: `inventory-1128703419-sql`.
2. Source/destination add, subtract or retain each category separately. Evidence: `inventory-1400704388-sql`, `inventory-1464704616-sql`.
3. Selected checks consider location class and in-transit allocation rule. Evidence: `inventory-1400704388-sql`, `inventory-1464704616-sql`.

**What can affect it**

- Caller effects and LOCATION.ALLOCATE_IN_TRANSIT change reviewed branches.
- AIM describes adjustment types that create work, reserving transfer quantity at source and marking destination quantity in transit; the active application-to-routine mapping remains unverified.

**What you can check**

- Check the transaction and context, then distinguish validation rejection, conditional behavior and an unverified live result.

**Expected results and limits**

- A reservation can change allocated quantity separately from on-hand.
- Vendor formula and conditional code checks have different scopes; no universal screen-calculation equivalence claimed.
- No operational rows/procedures accessed. Current permissions/settings, Insight navigation and screen-reader acceptance remain unverified.

**More detail and sources**

`inventory-1128703419-sql`: [dbo.INV_AdjustInv](sql/1128703419.sql); source-definition SHA-256 `362ff83361dded24aae929aa0cf58685200b21bb3a7991f880fca97a00e8de93`, reading-copy SHA-256 `b77007a8973b5368936124674524c79420b1816c140e116f148a722f5a6696ce`, one-based inclusive lines [[40, 251]].

`inventory-1400704388-sql`: [dbo.INV_PickFromLocation](sql/1400704388.sql); source-definition SHA-256 `ee688bd90536748cd6f1eeb1015d39199a62236adeb6ebe97b79d6bbde31398c`, reading-copy SHA-256 `75f63d082a4062e9b815f5797a8c53d333828c5cf2bec75cea0e22c978d999d2`, one-based inclusive lines [[82, 828]].

`inventory-1464704616-sql`: [dbo.INV_PutIntoLocation](sql/1464704616.sql); source-definition SHA-256 `6c20f44f12558f31d9ca6765c33a8952275f46ab5718fbe209f5266735494142`, reading-copy SHA-256 `8986ffa4b9635c50100e3f8b6b00a2b4a29f3cc25f0f8357337d80ac760579de`, one-based inclusive lines [[102, 1234]].

`inventory-tracking-aim`: [Inventory Tracking Process Summary: Functionality](../AIM/reading/de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c.md); AIM article `de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c`, original SHA-256 `b87db78c2d841a850fc229481eabccd5eea820d3fee31495a2578a92707c5a88`, nodes n64, n87, n90, n93, n96, n99, n108, n113, n115, n120, n125.

`inventory-management-aim`: [Inventory Management Process Summary: Functionality](../AIM/reading/9c9b2f34d8c2aeee8291236b7db3a8d7712db3a3188eda0681cc00157c1ccdfe.md); AIM article `9c9b2f34d8c2aeee8291236b7db3a8d7712db3a3188eda0681cc00157c1ccdfe`, original SHA-256 `9fe93dc5c192f74ebe3d424157aa85d024f7079485cbc7e9c9c475c794e7eee6`, nodes n66, n68, n99, n118, n120, n124, n128, n129, n130, n135, n136, n137.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does reservation prove stock left? Expected: Allocated and on-hand are distinct. Must not claim: Allocated means physically shipped.
- Is in-transit always available? Expected: Selected checks depend on location rules. Must not claim: All in-transit is pickable.

## 49. Understanding empty source inventory

**Question:** Why can inventory and unit details disappear after a movement?

**What it does.** When resulting on-hand, allocated, in-transit and suspense quantities are all zero, the source routine can remove nonpermanent inventory. It handles serial, unit-of-measure and catch-weight links first. Permanent inventory follows a different retention path.

**What happens**

Trigger: Application/caller invokes the reviewed inventory routines; deployed screen binding is not registered.

1. Calculate four new quantities and determine permanent-row state. Evidence: `inventory-1400704388-sql`.
2. For empty nonpermanent inventory, archive remaining serials and detach/delete unit rows based on destination effects. Evidence: `inventory-1400704388-sql`, `inventory-1144703476-sql`.
3. Remove eligible catch-weight links and delete inventory using initial-quantity predicates, or update retained inventory. Evidence: `inventory-1400704388-sql`.

**What can affect it**

- Permanent flag, destination effects, container tracking and catch-weight rules change the path.

**What you can check**

- Check the transaction and context, then distinguish validation rejection, conditional behavior and an unverified live result.

**Expected results and limits**

- All four quantities and row-retention rules govern deletion.
- Errors do not prove rollback; caller transaction remains unreviewed.
- No operational rows/procedures accessed. Current permissions/settings, Insight navigation and screen-reader acceptance remain unverified.

**More detail and sources**

`inventory-1400704388-sql`: [dbo.INV_PickFromLocation](sql/1400704388.sql); source-definition SHA-256 `ee688bd90536748cd6f1eeb1015d39199a62236adeb6ebe97b79d6bbde31398c`, reading-copy SHA-256 `75f63d082a4062e9b815f5797a8c53d333828c5cf2bec75cea0e22c978d999d2`, one-based inclusive lines [[82, 828]].

`inventory-1144703476-sql`: [dbo.INV_ArchiveSerialNumbers](sql/1144703476.sql); source-definition SHA-256 `8084142916ec21e90dc8dac17e3a94bcec1c29b8e7a014b78866de919dddde28`, reading-copy SHA-256 `04dd003e9e71b5835e433bb4d09046ce0bfd11ea201ffa3bad6b7299ebf88dc0`, one-based inclusive lines [[11, 54]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does zero on-hand delete the row? Expected: All four quantities and permanent state matter. Must not claim: Zero on-hand alone deletes inventory.
- Does archival prove commit? Expected: Copy, delete and caller commit differ. Must not claim: The whole movement is atomic.

## 50. Understanding destination units and attributes

**Question:** Why can destination unit details or attribute IDs change?

**What it does.** Placement can create or update destination inventory, reuse equal attributes or copy an attribute set. It also transfers, copies or removes unit-of-measure details to fit the destination. Location rules and transaction context determine the path, so internal IDs need not remain the same.

**What happens**

Trigger: Application/caller invokes the reviewed inventory routines; deployed screen binding is not registered.

1. Validate destination context and choose existing inventory versus insertion. Evidence: `inventory-1464704616-sql`.
2. Reuse or copy inventory attributes when required. Evidence: `inventory-1464704616-sql`.
3. Reassign or clean unit rows with dynamic statements and fallback copy/insert handling. Evidence: `inventory-1464704616-sql`.
4. Handle lot, location, catch-weight and history steps. Evidence: `inventory-1464704616-sql`.

**What can affect it**

- Location class, multi-item/container rules, status context and attribute equality affect placement.

**What you can check**

- Check the transaction and context, then distinguish validation rejection, conditional behavior and an unverified live result.

**Expected results and limits**

- An attribute ID returned to the caller can differ.
- Fixed dynamic targets reviewed; runtime values, nested helpers and complete atomicity remain unknown.
- No operational rows/procedures accessed. Current permissions/settings, Insight navigation and screen-reader acceptance remain unverified.

**More detail and sources**

`inventory-1464704616-sql`: [dbo.INV_PutIntoLocation](sql/1464704616.sql); source-definition SHA-256 `6c20f44f12558f31d9ca6765c33a8952275f46ab5718fbe209f5266735494142`, reading-copy SHA-256 `8986ffa4b9635c50100e3f8b6b00a2b4a29f3cc25f0f8357337d80ac760579de`, one-based inclusive lines [[102, 1234]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does an attribute ID always survive? Expected: Attributes may be reused or copied. Must not claim: Internal IDs always remain unchanged.
- Are current destination rules known? Expected: Static branches are established, effective values are not. Must not claim: A particular location setting is active.

## 51. Understanding serial checks during movement

**Question:** Why can a serial-controlled movement be rejected?

**What it does.** For selected transaction and tracking conditions, SCALE compares requested quantity with selected serial groups at the source. It then unlinks selected serial records before linking them to destination inventory. A serial-row count and a count of serial groups are different measures.

**What happens**

Trigger: Application/caller invokes the reviewed inventory routines; deployed screen binding is not registered.

1. Match source inventory and conditionally compare distinct serial groups with quantity. Evidence: `inventory-1608705129-sql`.
2. Check qualifying selected linkage; clear source links and return rows updated. Evidence: `inventory-1416704445-sql`.
3. Look up destination inventory and assign its ID to selected serials. Evidence: `inventory-1480704673-sql`.

**What can affect it**

- Item mode, transaction type, argument group and inventory keys govern checks.

**What you can check**

- Check the transaction and context, then distinguish validation rejection, conditional behavior and an unverified live result.

**Expected results and limits**

- Passing one check does not prove destination linkage or complete movement.
- No explicit destination no-match rejection: absent inventory can leave/set NULL linkage.
- AIM master/minor terminology does not make UPDATE row count equal master-group quantity.
- No operational rows/procedures accessed. Current permissions/settings, Insight navigation and screen-reader acceptance remain unverified.

**More detail and sources**

`inventory-1608705129-sql`: [dbo.INV_ValidateSerialNums](sql/1608705129.sql); source-definition SHA-256 `635cdaa6102b251268a77aa102478e353ad7c6338c735be219e55fc28293dc79`, reading-copy SHA-256 `70213db8195a3b7768feef0636aea877a4a94807ac056c4de7dcbaeb68f836be`, one-based inclusive lines [[15, 104]].

`inventory-1416704445-sql`: [dbo.INV_PickSerialNumbers](sql/1416704445.sql); source-definition SHA-256 `41ed0b852e3c05fc6e788779755b0fdfd82181718a504824e167b6d297f54627`, reading-copy SHA-256 `e763924616e0e97b2f8d56b00a30978cb815a76741550b7a1e65fefd04d9e535`, one-based inclusive lines [[15, 69]].

`inventory-1480704673-sql`: [dbo.INV_PutSerialNumbers](sql/1480704673.sql); source-definition SHA-256 `561ea31684660c57b362b2c48503a9ab9d363ff0d628392be422d2c7f578ba1f`, reading-copy SHA-256 `e74eed30a9c38f95239e7174a80c3a36689bca0de3ecdc49c5eacb4a55752a1d`, one-based inclusive lines [[14, 48]].

`inventory-tracking-aim`: [Inventory Tracking Process Summary: Functionality](../AIM/reading/de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c.md); AIM article `de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c`, original SHA-256 `b87db78c2d841a850fc229481eabccd5eea820d3fee31495a2578a92707c5a88`, nodes n64, n87, n90, n93, n96, n99, n108, n113, n115, n120, n125.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does every operation use this check? Expected: Validation branches are conditional. Must not claim: Every transaction performs the same check.
- Does zero return prove linkage? Expected: No destination no-match guard or row-count requirement. Must not claim: The serial was placed successfully.

## 52. Understanding lot creation and cleanup

**Question:** Why can a lot appear or leave active inventory?

**What it does.** A lot identifies a group of product. Movement helpers can create a missing lot and attach supplied attributes. When the remaining-inventory test permits cleanup, another helper copies the lot and attributes to history and deletes active rows. This does not by itself prove the warehouse has no stock.

**What happens**

Trigger: Application/caller invokes the reviewed inventory routines; deployed screen binding is not registered.

1. Read template/frozen-status context and insert a missing lot for a supported location. Evidence: `inventory-1432704502-sql`.
2. Parse supplied attributes and insert them for the newly created lot. Evidence: `inventory-1256703875-sql`.
3. Test remaining qualifying inventory outside departing context; copy lot/attributes before active deletion. Evidence: `inventory-1448704559-sql`.

**What can affect it**

- Item lot template, configured frozen status, location class and departure context govern behavior.

**What you can check**

- Check the transaction and context, then distinguish validation rejection, conditional behavior and an unverified live result.

**Expected results and limits**

- Create-if-missing leaves existing lot/attributes unchanged.
- Cleanup uses row existence with exclusions, not a warehouse quantity SUM.
- Retention, immutability and atomic copy/delete are not established.
- No operational rows/procedures accessed. Current permissions/settings, Insight navigation and screen-reader acceptance remain unverified.

**More detail and sources**

`inventory-1432704502-sql`: [dbo.INV_ProcessLotInNewInventory](sql/1432704502.sql); source-definition SHA-256 `9b2752c744893bc557774452348a3ceca5cb15a04f65b4ad08cbe1b6702e0b41`, reading-copy SHA-256 `3f5cd7b8b517b41c09ea4cb9df5422be5f94fd61aa93668b0dca27ea12d2b261`, one-based inclusive lines [[17, 113]].

`inventory-1256703875-sql`: [dbo.INV_InsertLotAttributes](sql/1256703875.sql); source-definition SHA-256 `9a6c77a44c7a5865ec1e0275b993a8987a72d53c0b9366b91fdbc21b8127cc6d`, reading-copy SHA-256 `a1a3c696a9ef59cbeb3bd70f6a1a07ad5d2b91da8542a0667d0440d40c07fee5`, one-based inclusive lines [[17, 55]].

`inventory-1448704559-sql`: [dbo.INV_ProcessLotWhenEmptyingInv](sql/1448704559.sql); source-definition SHA-256 `9c536bc1ce6c131124da2001272c85a187f6cf05a6e0e8469071a37153ed244a`, reading-copy SHA-256 `ab5e0948a8c84b089c949d96817e91f33021fc81cbdd87f6809a36893826964d`, one-based inclusive lines [[22, 175]].

`inventory-tracking-aim`: [Inventory Tracking Process Summary: Functionality](../AIM/reading/de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c.md); AIM article `de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c`, original SHA-256 `b87db78c2d841a850fc229481eabccd5eea820d3fee31495a2578a92707c5a88`, nodes n64, n87, n90, n93, n96, n99, n108, n113, n115, n120, n125.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Do arguments update an existing lot? Expected: The create helper returns when no lot was inserted. Must not claim: Existing attributes are always refreshed.
- Does cleanup prove zero stock? Expected: The test excludes departing context and one class. Must not claim: No stock remains anywhere.

## 53. Understanding a count after picking

**Question:** Why can picking lead to a request to count inventory?

**What it does.** A cycle count checks physical stock against the system quantity. The vendor describes activity-driven counts after work such as picking. In the reviewed source movement, an on-hand reduction can call a threshold checker that considers location rules, time since the last count and quantity before requesting count creation or update.

**What happens**

Trigger: Application/caller invokes the reviewed inventory routines; deployed screen binding is not registered.

1. After on-hand reduction, sum item/company source inventory and call threshold logic. Evidence: `inventory-1400704388-sql`.
2. Match active thresholds, check elapsed days and convert units if required. Evidence: `inventory-1160703533-sql`.
3. Return/clean up or call request helpers when conditions permit. Evidence: `inventory-1160703533-sql`.

**What can affect it**

- Threshold dimensions, activation, quantity/unit and days-between matter. AIM separately describes immediate/pending preference.

**What you can check**

- Check the transaction and context, then distinguish validation rejection, conditional behavior and an unverified live result.

**Expected results and limits**

- Not every pick creates a count.
- Request helpers and effective RF preference remain unreviewed.
- The checker can delete matching requests/work; it is not read-only.
- No operational rows/procedures accessed. Current permissions/settings, Insight navigation and screen-reader acceptance remain unverified.

**More detail and sources**

`inventory-1400704388-sql`: [dbo.INV_PickFromLocation](sql/1400704388.sql); source-definition SHA-256 `ee688bd90536748cd6f1eeb1015d39199a62236adeb6ebe97b79d6bbde31398c`, reading-copy SHA-256 `75f63d082a4062e9b815f5797a8c53d333828c5cf2bec75cea0e22c978d999d2`, one-based inclusive lines [[82, 828]].

`inventory-1160703533-sql`: [dbo.INV_CheckLocThreshold](sql/1160703533.sql); source-definition SHA-256 `2883358067877b581e4e951f5f0518cdd4998a2a913bd3bfc34fd8387ff7978a`, reading-copy SHA-256 `1723eed69b74a258bec467e61523165fb454c8a3088169c068050265307c7065`, one-based inclusive lines [[4, 205]].

`inventory-cyclecount-aim`: [Cycle Counting Process Summary: Functionality](../AIM/reading/548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3.md); AIM article `548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3`, original SHA-256 `62b53306bb40dde023f7fe8b495cff98a3604c93e7613707f4547202de3ae47c`, nodes n66, n104, n106.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does every pick create a count? Expected: Threshold/time branches can return. Must not claim: Every pick creates work.
- Will RF show a count immediately? Expected: Effective preference/application evidence needed. Must not claim: Immediate RF display is verified.

## 54. Understanding receipt and yard links

**Question:** Why can a receipt trailer link change automatically?

**What it does.** Three triggers maintain receipt-to-yard links. Receipt insertion links matching yard rows with coded status 0. An update targeting the trailer ID refreshes that link and can clear it when no matching yard row exists. A newly inserted yard record can attach existing unlinked receipts, but uses a different status rule.

**What happens**

Trigger: The named database event or authorized application caller; active UI bindings are unverified.

1. Receipt INSERT joins a matching trailer, warehouse and yard status. Evidence: `rs-batch-720057651`, `rs-batch-736057708`, `rs-batch-784057879`, `rs-yard-aim`.
2. Trailer-column UPDATE uses a left join, so a missing match clears the yard ID. Evidence: `rs-batch-720057651`, `rs-batch-736057708`, `rs-batch-784057879`, `rs-yard-aim`.
3. Yard insertion attaches matching unlinked receipts except trailing status 900, without testing inserted yard status. Evidence: `rs-batch-720057651`, `rs-batch-736057708`, `rs-batch-784057879`, `rs-yard-aim`.

**What can affect it**

- Check the triggering event, matching warehouse/trailer, existing link and coded status predicates before attributing a changed association.
- Changing only warehouse does not satisfy UPDATE(TRAILER_ID).

**What you can check**

- Check the triggering event, matching warehouse/trailer, existing link and coded status predicates before attributing a changed association.
- Changing only warehouse does not satisfy UPDATE(TRAILER_ID).

**Expected results and limits**

- Yard link/stamps may change; no physical trailer movement or receiving quantity changes are performed by these bodies.
- Numeric predicates are not verified business-status labels.
- AIM requires receipt/trailer association for yard processing; these triggers provide only one implementation component.
- No operational records or routines were read/executed; actual settings, screen navigation, authorization and runtime are not established.

**More detail and sources**

`rs-batch-720057651`: [dbo.RECEIPT_HEADER_A_I](sql/720057651.sql); source-definition SHA-256 `303fc1c5908ab4733761d50c9252f107ab4c8ae7626efcc0bd28f8e09b8df020`, reading-copy SHA-256 `b30f95dbe9d69a2adcf3cdd7fa26dc0a986685c363af5b0236683bf888c28f05`, one-based inclusive lines [[1, 30]].

`rs-batch-736057708`: [dbo.RECEIPT_HEADER_A_U](sql/736057708.sql); source-definition SHA-256 `869374807869d44285da28c23b6c61363c21f2a5a3c9c475ec9815c139dbf576`, reading-copy SHA-256 `716ca062537be2d52d536067457f15f1c8f08a26567cc2f2fbe0cec1e0b29beb`, one-based inclusive lines [[1, 33]].

`rs-batch-784057879`: [dbo.TRAILER_YARD_STATUS_A_I](sql/784057879.sql); source-definition SHA-256 `5fe380b8d5dc1a4eed01274a19298df78be15267687612881f5e0b6fdd31ecf7`, reading-copy SHA-256 `254d9fee5b3ae0c9cb521ea2cfad05a774f3bb9b9f5f3ee77516c967819b3042`, one-based inclusive lines [[1, 25]].

`rs-yard-aim`: [Yard Management Process Summary: Functionality](../AIM/reading/ea0dcdbe8b292306e502eb84dc28fca30d15b41c916d24a683648f70412fd7a9.md); AIM article `ea0dcdbe8b292306e502eb84dc28fca30d15b41c916d24a683648f70412fd7a9`, original SHA-256 `85deed38d0afc11b33c579084e36ad8b555b9d554a1b6a6061670c08991e683b`, nodes n68.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does setting trailer to its old value avoid the trigger? Expected: Targeting the column satisfies UPDATE even without a value change. Must not claim: Only changed values fire this branch.
- Does no matching yard record preserve the old link? Expected: Update trigger clears it; insert trigger leaves unmatched rows alone. Must not claim: All three triggers use identical matching behavior.

## 55. Understanding parent container identifiers

**Question:** Why did a new top-level container receive its own tree number?

**What it does.** On insertion, a parentless shipping container with a missing or negative tree-unit number receives its own internal container number as the tree unit. Existing zero/positive tree values and child containers are not changed by this trigger.

**What happens**

Trigger: The named database event or authorized application caller; active UI bindings are unverified.

1. Join inserted IDs and initialize only qualifying roots. Evidence: `rs-batch-768057822`.

**What can affect it**

- Check parent, tree-unit value and INSERT event; later parent changes are outside this trigger.

**What you can check**

- Check parent, tree-unit value and INSERT event; later parent changes are outside this trigger.

**Expected results and limits**

- TREE_UNIT changes only for qualifying newly inserted roots.
- This does not create child containers, pack items or calculate physical capacity.
- No operational records or routines were read/executed; actual settings, screen navigation, authorization and runtime are not established.

**More detail and sources**

`rs-batch-768057822`: [dbo.ship_container_tree_unit_a_i](sql/768057822.sql); source-definition SHA-256 `983d20e677855a6c27be40e5e79dbb924b57049fb24c95ddd8379a7db420cba7`, reading-copy SHA-256 `5efb0120bcc089cce081aee93c19d4a7443b04335431765aac6b3006766278b1`, one-based inclusive lines [[1, 13]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does a missing child tree value get fixed? Expected: Non-NULL parent excludes the row. Must not claim: Every missing tree value is repaired.
- Does zero tree-unit get replaced? Expected: The predicate accepts NULL/negative only. Must not claim: Zero and NULL are equivalent here.

## 56. Understanding accessorial identifier normalization

**Question:** Can inserting one accessorial change an existing accessorial row?

**What it does.** Yes. When an inserted or updated accessorial has a negative internal number, the trigger normalizes negative rows sharing its computed shipment-or-container association. The target scope can include existing rows with that association, not just the newly inserted IDs.

**What happens**

Trigger: The named database event or authorized application caller; active UI bindings are unverified.

1. Check for a negative internal number in inserted. Evidence: `rs-batch-752057765`.
2. Use container number when present/nonzero, otherwise shipment number; update matching negative association rows. Evidence: `rs-batch-752057765`.

**What can affect it**

- Inspect association-key rules and trigger event before assuming a one-row effect.
- Recursion behavior depends on captured body plus uncaptured engine settings and replacement values.

**What you can check**

- Inspect association-key rules and trigger event before assuming a one-row effect.
- Recursion behavior depends on captured body plus uncaptured engine settings and replacement values.

**Expected results and limits**

- INTERNAL_NUM is normalized; no charge calculation or carrier call is in this trigger.
- No operational records or routines were read/executed; actual settings, screen navigation, authorization and runtime are not established.

**More detail and sources**

`rs-batch-752057765`: [dbo.shipment_accessorials_a_i](sql/752057765.sql); source-definition SHA-256 `57493c497fd6f83c50aa9dcd8a1a1718f29d62d6028c32174ac5978031c08ec5`, reading-copy SHA-256 `2a2157c7562c8aea7899564ba9ca4ea29d41b6f4f2588af925b7a9eefafe3f23`, one-based inclusive lines [[1, 31]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the trigger only handle inserts? Expected: It declares INSERT and UPDATE. Must not claim: Its name proves insert-only behavior.
- Are updates restricted to inserted primary keys? Expected: The correlated match uses the computed association key. Must not claim: Only the newly inserted row can change.

## 57. Understanding ship-confirm database changes

**Question:** Does a changed shipment status prove everything was shipped?

**What it does.** The reviewed routine writes supplied shipment, detail, container and load statuses, adjusts quantities-at-status, timestamps the records and queues matching alerts. It does not prove carrier acceptance, printing, physical departure or alert delivery. Those require evidence from the calling process.

**What happens**

Trigger: The named database event or authorized application caller; active UI bindings are unverified.

1. Queue matching active alert requests with duplicate-looking requests excluded by a read check. Evidence: `rs-batch-1809753850`, `rs-batch-1000702963`, `rs-shipping-aim`, `rs-status-aim`.
2. Write header status, UTC ship time and warehouse-local status dates. Evidence: `rs-batch-1809753850`, `rs-batch-1000702963`, `rs-shipping-aim`, `rs-status-aim`.
3. Shift and consolidate detail status slots except numeric 995, then update containers and the supplied load. Evidence: `rs-batch-1809753850`, `rs-batch-1000702963`, `rs-shipping-aim`, `rs-status-aim`.

**What can affect it**

- The caller supplies status and limit; this body does not validate the permitted transition or shipment/load relationship.
- Timezone configuration changes local calendar dates; it is not the same as UTC timestamps.
- Separate statements and NOLOCK duplicate checks need caller transaction/concurrency evidence.

**What you can check**

- The caller supplies status and limit; this body does not validate the permitted transition or shipment/load relationship.
- Timezone configuration changes local calendar dates; it is not the same as UTC timestamps.
- Separate statements and NOLOCK duplicate checks need caller transaction/concurrency evidence.

**Expected results and limits**

- No result set; persistent status/quantity-at-status writes and alert requests.
- No end-to-end completion or idempotency guarantee.
- Detail history ordering and nullable quantities require caller/invariant review.
- No operational records or routines were read/executed; actual settings, screen navigation, authorization and runtime are not established.

**More detail and sources**

`rs-batch-1809753850`: [dbo.SHP_SetStatusesAtShipConfirm](sql/1809753850.sql); source-definition SHA-256 `4ac0db0eff207af65ce8c7c515a77955835a1db218c1610551eb4f3c37930196`, reading-copy SHA-256 `2e4550ba3972ac8d7cb010387214f2bdab3e30ddb1fa8d5d9f0c70a61c2f411f`, one-based inclusive lines [[1, 310]].

`rs-batch-1000702963`: [dbo.GetWarehouseTimezoneValue](sql/1000702963.sql); source-definition SHA-256 `6f264491b5ea0bf792fd3243a00196414237a5791c66fdd12d8a225cc3bb3a77`, reading-copy SHA-256 `6b5bdff46dfcee6ee4cf96dd5356cf4034277711d5b7749bcdb558dab325a3e4`, one-based inclusive lines [[1, 27]].

`rs-shipping-aim`: [Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md); AIM article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`, original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`, nodes n65.

`rs-status-aim`: [Status Process Summary: Functionality](../AIM/reading/5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d.md); AIM article `5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d`, original SHA-256 `2cc05e7c1cef1d68ccd7fc8901c12905c61f6b49b9e3d4d1a3ae28f3a0f59119`, nodes n63, n74, n80, n89, n190.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does a queued alert prove delivery? Expected: It inserts an unprocessed request only. Must not claim: Notification was sent.
- Can the header status only advance? Expected: The alert guard checks advancement; the header UPDATE does not repeat that guard. Must not claim: All status writes enforce increasing values.
- Does loadNum automatically come from the shipment? Expected: It is a separate caller-supplied argument. Must not claim: This body validates that the two IDs belong together.

## 58. Understanding receipt container identifier generation

**Question:** Can the unique-container helper be used as a harmless lookup?

**What it does.** No. It computes a numeric candidate and then updates a receipt container. Its one text input is used both as an external identifier to check and as an internal numeric row key for the UPDATE. The name does not guarantee global uniqueness or safe concurrent allocation.

**What happens**

Trigger: The named database event or authorized application caller; active UI bindings are unverified.

1. Check three existing identifier surfaces and choose a candidate by maxima or a fallback search. Evidence: `rs-batch-2103678542`, `rs-receiving-aim`.
2. Write the candidate using the supplied input as INTERNAL_REC_CONT_NUM filter. Evidence: `rs-batch-2103678542`, `rs-receiving-aim`.
3. Return candidate; a collision branch also returns it before the UPDATE. Evidence: `rs-batch-2103678542`, `rs-receiving-aim`.

**What can affect it**

- Clarify the caller's parameter meaning and numeric format before operational use.
- No reservation, sequence allocator or collision-proof transaction is present.

**What you can check**

- Clarify the caller's parameter meaning and numeric format before operational use.
- No reservation, sequence allocator or collision-proof transaction is present.

**Expected results and limits**

- One or two scalar result sets depending on collision branch, plus possible persistent identifier update.
- A result emitted before UPDATE is not evidence that the change succeeded.
- Exact literal exclusion pattern and external caller contract remain open.
- No operational records or routines were read/executed; actual settings, screen navigation, authorization and runtime are not established.

**More detail and sources**

`rs-batch-2103678542`: [dbo.REC_CreateNewUniqueContainerId](sql/2103678542.sql); source-definition SHA-256 `e9d88fd0465a9b2502c1ded581f41f9af3eefd3e932a9f7b72178a7c81213077`, reading-copy SHA-256 `bdc04cd2a06b69859e4321248666d20781243da1a4dfbdb896e1d4536d568a1c`, one-based inclusive lines [[1, 59]].

`rs-receiving-aim`: [Receiving Process Summary: Functionality](../AIM/reading/b9c3ffa9a81498cb548bdb61d00ba2dd34e5bfb79695f24b28a31d26d9eb8369.md); AIM article `b9c3ffa9a81498cb548bdb61d00ba2dd34e5bfb79695f24b28a31d26d9eb8369`, original SHA-256 `b34355dc06ff7bda053191f657f72735d152012a6fe33cee1a2f714c9453d8b2`, nodes n65.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Can an arbitrary alphanumeric ID pass through unchanged? Expected: Numeric assignment/comparison can fail or normalize formatting. Must not claim: The nvarchar input guarantees text-preserving output.
- Can two calls safely reserve different IDs? Expected: The body has no reservation lock/owned transaction. Must not claim: Unique is a concurrency guarantee.

## 59. Understanding locating rule retrieval

**Question:** Does retrieving an active locating rule put stock away?

**What it does.** No. This helper only returns the header matching a rule name, including inactive headers. AIM describes locating as selecting storage destinations using rule sequences and strategies; physical putaway and work creation require additional processing. Delayed locating also depends on the receiving preference.

**What happens**

Trigger: The named database event or authorized application caller; active UI bindings are unverified.

1. Find the exact rule name and return its header columns. Evidence: `rs-batch-1175323597`, `rs-locating-aim`.

**What can affect it**

- The helper has no ACTIVE filter.
- AIM requires both Delayed Locating and Create Putaway Work for its documented pre-locate path. Aggregate flags do not establish a container's effective rule/preference.

**What you can check**

- The helper has no ACTIVE filter.
- AIM requires both Delayed Locating and Create Putaway Work for its documented pre-locate path. Aggregate flags do not establish a container's effective rule/preference.

**Expected results and limits**

- Matching header or empty result; no operational mutation.
- Rule assignment, strategy execution and receiving preference are outside this body.
- No operational records or routines were read/executed; actual settings, screen navigation, authorization and runtime are not established.

**More detail and sources**

`rs-batch-1175323597`: [dbo.wm_RLocatingRuleHeader01](sql/1175323597.sql); source-definition SHA-256 `ed9b72e6316f9cf56f69035b4fdd6c5bde7f8b8ae802d74bd533167bdb502dc4`, reading-copy SHA-256 `9037fc534df0ef023708507d2628bf752b18614d9263bb469740dfce3e512660`, one-based inclusive lines [[1, 16]].

`rs-locating-aim`: [Locating Process Summary: Functionality](../AIM/reading/4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa.md); AIM article `4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa`, original SHA-256 `e215745a6d81b87363e12c8d05d0ac51d7b6337430ce4b448bc6edcedf67b24a`, nodes n64, n102, n105, n113.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does no header disable locating system-wide? Expected: It means no match for that supplied name. Must not claim: Locating is disabled everywhere.
- Does DELAYED_LOCATING alone prove pre-locate work? Expected: Vendor behavior requires both relevant flags. Must not claim: One flag alone selects that process.

## 60. Understanding action-to-status mapping

**Question:** Why can a status lookup return no status?

**What it does.** The helper maps an action through generic configuration to a system-status identity, then to a numeric status in the requested functional area. Missing mappings yield NULL. Multiple qualifying status rows are assigned without ordering. It does not validate an individual transaction's permitted next step.

**What happens**

Trigger: The named database event or authorized application caller; active UI bindings are unverified.

1. Select the action mapping for the chosen configuration branch. Evidence: `rs-batch-2113754933`, `rs-status-aim`.
2. Match system status within the supplied functional area and return the numeric status. Evidence: `rs-batch-2113754933`, `rs-status-aim`.

**What can affect it**

- Check both mapping layers and functional area through an approved configuration review.
- No custom-flow, active, user or warehouse scope is applied here.

**What you can check**

- Check both mapping layers and functional area through an approved configuration review.
- No custom-flow, active, user or warehouse scope is applied here.

**Expected results and limits**

- Scalar numeric status or NULL; duplicate matches lack deterministic selection.
- No current configured mapping or transaction state was read.
- No operational records or routines were read/executed; actual settings, screen navigation, authorization and runtime are not established.

**More detail and sources**

`rs-batch-2113754933`: [dbo.STSfn_RtrvStsForAction](sql/2113754933.sql); source-definition SHA-256 `d29a4028a34493427fb0a94cb5cc3bfae2009ea854346fd9ddb41a21bfa243e6`, reading-copy SHA-256 `554a8cd67dceb9ecaa61f3ce2864629bce9628df5e8a8a7e53de3fd3194ed2ac`, one-based inclusive lines [[1, 49]].

`rs-status-aim`: [Status Process Summary: Functionality](../AIM/reading/5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d.md); AIM article `5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d`, original SHA-256 `2cc05e7c1cef1d68ccd7fc8901c12905c61f6b49b9e3d4d1a3ae28f3a0f59119`, nodes n63, n74, n80, n89, n190.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does NULL mean status zero? Expected: The return variable remains NULL with no match. Must not claim: A missing map safely returns zero.
- Does this prove the transition is allowed? Expected: It resolves a mapping, not a transaction state machine. Must not claim: Any mapped action is permitted for any shipment.

## 61. Add, remove and transfer shipment wave membership

**Question:** Does moving a shipment between waves run allocation or work?

**What it does.** These helpers update wave membership, selected statuses and stamps. Add assigns pending status to the header but raises detail status only when lower. Transfer leaves statuses unchanged. Remove resets wave number to zero and changes only matching pending detail statuses. None performs inventory allocation or work execution.

**What happens**

Trigger: Authorized application/caller selects the named helper; actual UI binding and permission enforcement remain unverified.

1. Single-shipment and whole-wave helpers have different predicates and error coverage. Evidence: `awr-batch-254272311`, `awr-batch-286272425`, `awr-batch-302272482`, `awr-batch-318272539`, `awr-wave-aim`.
2. Statements are separate and no body-owned rollback makes them atomic. Evidence: `awr-batch-254272311`, `awr-batch-286272425`, `awr-batch-302272482`, `awr-batch-318272539`, `awr-wave-aim`.

**What can affect it**

- Caller supplies wave/status values; timezone helper controls status dates.

**What you can check**

- Caller supplies wave/status values; timezone helper controls status dates.

**Expected results and limits**

- Membership/status/stamp writes under stated predicates.
- PREVIOUS_WAVE_NUM is assigned destination by add/transfer; it is not a reliable prior-wave history here.
- Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**More detail and sources**

`awr-batch-254272311`: [dbo.WAVE_AddShipment](sql/254272311.sql); source-definition SHA-256 `5085fbe586aaa6405f4da485d05e9b932062cf6c01d8af88331711e0e63340a3`, reading-copy SHA-256 `98713bd8ec243afa861446d6a031047579ae3961a77b67c00e76862fc578a8c4`, one-based inclusive lines [[1, 49]].

`awr-batch-286272425`: [dbo.WAVE_RemoveShipment](sql/286272425.sql); source-definition SHA-256 `95fd900f2a9e8ce53bb8861437e9adf836131f2a7516f01ecec9f099915f2431`, reading-copy SHA-256 `e7a828577c253f09c3310f35084e1f4866b878c5de06acad18c5aeb017040709`, one-based inclusive lines [[1, 49]].

`awr-batch-302272482`: [dbo.WAVE_RemoveShipments](sql/302272482.sql); source-definition SHA-256 `aef859b097a906558318c04830c586b10248a2596eb5878b20b31e426f28b256`, reading-copy SHA-256 `15bc982cefad1b4dcdc74a4dc182d09082d5ce9e555d00591c9637b3a1dffc94`, one-based inclusive lines [[1, 48]].

`awr-batch-318272539`: [dbo.WAVE_TransferShipment](sql/318272539.sql); source-definition SHA-256 `57275dbbc84078fd2ead5b1947ed516d75997a9659b84c83cd0fecf7a48f90f7`, reading-copy SHA-256 `c3cec44eae385a2bac38f77c3dd5323a8a7612d786aad0696150680f747285a0`, one-based inclusive lines [[1, 43]].

`awr-wave-aim`: [Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md); AIM article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`, original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`, nodes n65.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Can add move the header status backwards? Expected: Header pending assignment is unconditional; detail is only raised. Must not claim: All statuses are monotonic.
- Does removal deallocate stock? Expected: No inventory DML or work deletion in these bodies. Must not claim: Removal completes wave cancellation.

## 62. Wave progress and statistics refresh

**Question:** Does a zero return from UpdateStatistics01 prove the wave was blocked?

**What it does.** No. Guard rejection returns zero, and its normal COMMIT followed by RETURN @@ROWCOUNT also yields zero. The routine can refresh totals and progress while returning that same value. It guards selected step tokens with a table-exclusive lock; it is not the complete wave engine.

**What happens**

Trigger: Authorized application/caller selects the named helper; actual UI binding and permission enforcement remain unverified.

1. Warehouse read uses NOLOCK; conflict checks use TABLOCKX only for coded guarded steps. Evidence: `awr-batch-334272596`, `awr-batch-350272653`, `awr-wave-aim`.
2. Totals use shipment view aggregates; COMMIT clears the rowcount later returned. Evidence: `awr-batch-334272596`, `awr-batch-350272653`, `awr-wave-aim`.

**What can affect it**

- Coded step guards and existing unit labels; effective wave master and token meanings remain external.

**What you can check**

- Coded step guards and existing unit labels; effective wave master and token meanings remain external.

**Expected results and limits**

- Summary/progress fields may update; return zero is ambiguous.
- No elapsed-time or complete-run claim; snapshot source aggregates use NOLOCK.
- Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**More detail and sources**

`awr-batch-334272596`: [dbo.WAVE_UpdateStatistics](sql/334272596.sql); source-definition SHA-256 `546e774b431f3f8f90633d4f8168813672cee15ad0d58b0bd054df91e900fe98`, reading-copy SHA-256 `358d358cdf9e80bbd58b79b4ba5262eb446997bb3a7a898b76b5e921b78f02f9`, one-based inclusive lines [[1, 56]].

`awr-batch-350272653`: [dbo.WAVE_UpdateStatistics01](sql/350272653.sql); source-definition SHA-256 `957b07c6d47fae96c4edb9b81e167c9727803d9b737a46da23b05c79d3ca4da5`, reading-copy SHA-256 `8026bb16d0256cfa3e34753d399d1fa40e29b8acd464d549daaf8602e16aa194`, one-based inclusive lines [[1, 88]].

`awr-wave-aim`: [Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md); AIM article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`, original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`, nodes n65.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Can return zero be treated as no changes? Expected: Success return path also zero after COMMIT. Must not claim: Zero uniquely means blocked.
- Are all steps serialized by this gate? Expected: Only coded branches request the table lock; unknown tokens bypass them. Must not claim: Complete wave scheduler concurrency is proven.

## 63. Wave dialog seeds and active-wave list

**Question:** Do NewWave or BuildWave stored procedures create a wave?

**What it does.** The reviewed bodies only return dialog context. NewWave variants project one row; BuildWave projects constants once per master row. The active-wave list checks last-step NULL/empty and warehouse, not whether a process is currently running.

**What happens**

Trigger: Authorized application/caller selects the named helper; actual UI binding and permission enforcement remain unverified.

1. No wave INSERT or execution call is present. Evidence: `awr-batch-421224901`, `awr-batch-885226554`, `awr-batch-916198314`, `awr-batch-277224388`, `awr-wave-aim`.
2. Last-step emptiness is the entire reviewed active predicate. Evidence: `awr-batch-421224901`, `awr-batch-885226554`, `awr-batch-916198314`, `awr-batch-277224388`, `awr-wave-aim`.

**What can affect it**

- Transfer defaults to N only when omitted in GetNewWave; explicit NULL is preserved.

**What you can check**

- Transfer defaults to N only when omitted in GetNewWave; explicit NULL is preserved.

**Expected results and limits**

- UI seed rows or selected wave list.
- Dialog save/run and permissions remain external.
- Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**More detail and sources**

`awr-batch-421224901`: [dbo.MetaTrans_BuildWave](sql/421224901.sql); source-definition SHA-256 `4a8182bb2d955c507e5f2070c1987b1aa49247658832433d444a451deb528f9c`, reading-copy SHA-256 `84cef4b66e9066dbf4d14640b889b32ef010c53becf0707af9e099d13978e300`, one-based inclusive lines [[1, 18]].

`awr-batch-885226554`: [dbo.MetaTrans_GetNewWave](sql/885226554.sql); source-definition SHA-256 `71e56a3f5c38594da551d713c52c218cc72913048962dcd8e6b0c5aa64c92ef1`, reading-copy SHA-256 `0012ba65a4622ba563c1ab0a8bd37f358c15b6d18e087ee48389f89724672730`, one-based inclusive lines [[1, 29]].

`awr-batch-916198314`: [dbo.MetaTrans_NewWave](sql/916198314.sql); source-definition SHA-256 `095a6540c74ba5691234b6594e44c3749af017404a644d53e7ddbaef88832942`, reading-copy SHA-256 `b733884bdf89d5f58d4785f71dc7da49e12c6b1f500ed1450adbc295ef229fc2`, one-based inclusive lines [[1, 25]].

`awr-batch-277224388`: [dbo.MetadataTransActiveWavesForWarehouse](sql/277224388.sql); source-definition SHA-256 `dbd1ce664938e31bece6068a01994f58493948727f58782cbc9c3ab45f4e6b42`, reading-copy SHA-256 `078f574b4af65d9ecb99e380d1a95a950fc80cf8a5c335a065148bfb29808400`, one-based inclusive lines [[1, 20]].

`awr-wave-aim`: [Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md); AIM article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`, original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`, nodes n65.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does BuildWave always return one row? Expected: One row per LAUNCH_MASTER row. Must not claim: Guaranteed single seed row.
- Does active mean the worker is alive? Expected: Only stored last-step predicate is tested. Must not claim: Runtime liveness is measured.

## 64. Completion status helpers

**Question:** Does calling a CompleteWave status helper complete all related entities?

**What it does.** Each helper changes only its specified entity. Container/detail setters accept the supplied status directly. Header setters preserve each NULL/zero/negative status input but accept any positive input, including a lower status. Load progression uses separate asymmetric comparisons.

**What happens**

Trigger: Authorized application/caller selects the named helper; actual UI binding and permission enforcement remain unverified.

1. Container/detail/header/load writes are independent calls. Evidence: `awr-batch-1276179942`, `awr-batch-1292179999`, `awr-batch-1308180056`, `awr-batch-1356180227`, `awr-wave-aim`.
2. Load leading rises; trailing may fall or rise from old<=201. Evidence: `awr-batch-1276179942`, `awr-batch-1292179999`, `awr-batch-1308180056`, `awr-batch-1356180227`, `awr-wave-aim`.

**What can affect it**

- Caller status values; warehouse timezone for header status dates.

**What you can check**

- Caller status values; warehouse timezone for header status dates.

**Expected results and limits**

- Entity status/stamp writes only.
- No validation of a full allowed transition, quantity-history shift or whole-wave completion.
- Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**More detail and sources**

`awr-batch-1276179942`: [dbo.CompleteWave_UpdateContSts](sql/1276179942.sql); source-definition SHA-256 `97bd0b58fc5926cb79c1d43f8e7ee7ea176c8dd88c28cf914e0249547d4ac2b2`, reading-copy SHA-256 `28ea81593bbdc47d8b840e297ad407494b3d430a7927a1567255400ada249ac8`, one-based inclusive lines [[1, 23]].

`awr-batch-1292179999`: [dbo.CompleteWave_UpdateDtlSts](sql/1292179999.sql); source-definition SHA-256 `23d06bf0905e956c006823e38c421886e3dc31f039f4a1e1d169b379b2f7082c`, reading-copy SHA-256 `076603d6073ca9c7cdfa326726c4df77482142976e66645e73d62409e19aecb4`, one-based inclusive lines [[1, 24]].

`awr-batch-1308180056`: [dbo.CompleteWave_UpdateHdrSts](sql/1308180056.sql); source-definition SHA-256 `aa0fed67b4db0541e6ca62f8dd17f37d2910dce20e19d0d0aea28298f3b4dbc7`, reading-copy SHA-256 `e1bc1e7760c9c2e8c25c2ca71e2aa01e69e9371bce443b51871f2bea7d661022`, one-based inclusive lines [[1, 54]].

`awr-batch-1356180227`: [dbo.CompleteWave_UpdateShipLdSts](sql/1356180227.sql); source-definition SHA-256 `00dda8667f322b7be40135d54e7db90d10187a2e443de2f513bdc41b56273999`, reading-copy SHA-256 `33ef3191963ae79f10b57d789626dafb99df5a75b998b78a8fc062def77b723d`, one-based inclusive lines [[1, 37]].

`awr-wave-aim`: [Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md); AIM article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`, original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`, nodes n65.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does header zero clear its status? Expected: Zero preserves that status/date while stamps still change. Must not claim: Zero status is written.
- Are completion calls atomic together? Expected: These bodies do not open a common transaction. Must not claim: All entities are completed atomically.

## 65. Order condition and open quantity

**Question:** Is order open quantity recomputed from every wave?

**What it does.** The reviewed detail helper replaces OPEN_QTY using eligible status slots from only the supplied wave and matching order/ERP line. The order-header helper separately writes a supplied condition. Other waves and current header/line consistency are not automatically reconciled.

**What happens**

Trigger: Authorized application/caller selects the named helper; actual UI binding and permission enforcement remain unverified.

1. First status must meet release bound; included slots are released<=status<shipped. Evidence: `awr-batch-1324180113`, `awr-batch-1340180170`.
2. Separate procedures have separate effects. Evidence: `awr-batch-1324180113`, `awr-batch-1340180170`.

**What can affect it**

- Caller supplies status bounds, wave and condition.

**What you can check**

- Caller supplies status bounds, wave and condition.

**Expected results and limits**

- Selected-wave sum replaces open quantity.
- Included NULL quantities can nullify a row expression; no cross-wave quantity or whole-order completion proof.
- Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**More detail and sources**

`awr-batch-1324180113`: [dbo.CompleteWave_UpdateOdrDtlCond](sql/1324180113.sql); source-definition SHA-256 `2b50f05d8e8fee884c5c3dfd29d6c3bac9837ebe5443d5e7d769aee955a430a6`, reading-copy SHA-256 `b5dce494366abfcc2734de0791fbee747c75861e1c8cb67a3624cd9179ae8586`, one-based inclusive lines [[1, 47]].

`awr-batch-1340180170`: [dbo.CompleteWave_UpdateOdrHdrCond](sql/1340180170.sql); source-definition SHA-256 `43f25720c05a71f2eccdc88388d1822814425c0108d9a9fecaed70fb154cfed4`, reading-copy SHA-256 `e2b4af66378327687a5f34123e503468e68f934e15b3107a03915a3ad9a3d1e8`, one-based inclusive lines [[1, 30]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does it add other waves to OPEN_QTY? Expected: Only supplied-wave detail group is used and target is replaced. Must not claim: All-wave order total.
- Are NULL historical quantities treated as zero? Expected: Only nonqualifying CASE branches contribute zero; included NULL propagates. Must not claim: All NULL quantities normalized.

## 66. Replenishment cancellation quantities

**Question:** Can a zero cancellation return prove quantities were deallocated?

**What it does.** No. The routine owns a transaction, removes matching instructions, subtracts source allocated and destination in-transit quantities, and calls history helpers. After the first history succeeds, a later rollback can return its previous zero code. The destination lookup also uses the request source warehouse.

**What happens**

Trigger: Authorized application/caller selects the named helper; actual UI binding and permission enforcement remain unverified.

1. Source uses TOP 1 without order or captured-quantity equality guard. Evidence: `awr-batch-988178916`, `awr-batch-142271912`, `awr-replenishment-aim`.
2. Destination uses FROM_WHS/TO_LOC and equality guards; later rollback can retain error variable zero. Evidence: `awr-batch-988178916`, `awr-batch-142271912`, `awr-replenishment-aim`.

**What can affect it**

- Typed request/work-created exclusion and null-safe identity predicates.

**What you can check**

- Typed request/work-created exclusion and null-safe identity predicates.

**Expected results and limits**

- Conditional transaction mutations/history requests or rollback.
- No operational defect reproduction; return code and caller transaction behavior require careful interpretation.
- Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**More detail and sources**

`awr-batch-988178916`: [dbo.CancelWave_DeallocationOfRepReq](sql/988178916.sql); source-definition SHA-256 `6fb6dc36455306494a92c644a7e863b69098bd54cfb5715c920cb6d46cbc8260`, reading-copy SHA-256 `ebda03e703ec6002f5089f4de170ea826e869e8ff12073e97c88abdd75be220c`, one-based inclusive lines [[1, 153]].

`awr-batch-142271912`: [dbo.TranHist_RepDeallocation](sql/142271912.sql); source-definition SHA-256 `dae0a7dc9b51e00703d2d9e50886e69a11fa817a02b783f391bbf514111b106d`, reading-copy SHA-256 `267465b2544a653b253820b4c9e78452950869c81f56e55f0070c74014876b60`, one-based inclusive lines [[1, 71]].

`awr-replenishment-aim`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does destination lookup use TO_WHS? Expected: Reviewed join uses FROM_WHS with TO_LOC. Must not claim: Cross-warehouse destination is correctly selected by TO_WHS.
- Can rollback return zero? Expected: Error variable may already hold source history success zero. Must not claim: Zero proves persisted deallocation.

## 67. Wave cancellation load and history helpers

**Question:** What happens to a load when all its shipments belong to a cancelled wave?

**What it does.** The load-status helper aggregates only shipments outside the wave and updates load statuses only when both aggregates are positive. With none remaining, it keeps old load statuses, then detaches matching wave headers. The history-named snapshot helper only returns data; separate helpers perform persistence.

**What happens**

Trigger: Authorized application/caller selects the named helper; actual UI binding and permission enforcement remain unverified.

1. Shipment order-header child calls are sequential; load aggregates exclude the supplied wave. Evidence: `awr-batch-1004178973`, `awr-batch-1020179030`, `awr-batch-1032703077`, `awr-wave-aim`.
2. No-remaining aggregate does not reset load statuses; snapshot helper does not INSERT history. Evidence: `awr-batch-1004178973`, `awr-batch-1020179030`, `awr-batch-1032703077`, `awr-wave-aim`.

**What can affect it**

- Caller wave and snapshot direction; current other-wave statuses.

**What you can check**

- Caller wave and snapshot direction; current other-wave statuses.

**Expected results and limits**

- Load associations/status changes and separately returned snapshot data.
- No complete atomic cancellation or history persistence proven.
- Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**More detail and sources**

`awr-batch-1004178973`: [dbo.CancelWave_UpdateOrderHeader](sql/1004178973.sql); source-definition SHA-256 `fa314e580bba0716ed949e0a5d3141b67703310b304f1625283c83289e9975fe`, reading-copy SHA-256 `4c4b6ab7e27a4b9286b12f2150cbd04589c2fd668574656ca257082c648b0c63`, one-based inclusive lines [[1, 48]].

`awr-batch-1020179030`: [dbo.CancelWave_UpdateShipLdSts](sql/1020179030.sql); source-definition SHA-256 `0a4d386b576546d885594a0a39c94e15543631e4aec0d134ff70994107bb89f7`, reading-copy SHA-256 `a235ff8adf4c9e93b36f33b94731d69df3337b6adc6ba3be731de055b1719f13`, one-based inclusive lines [[1, 62]].

`awr-batch-1032703077`: [dbo.HIST_LocationInvForCancelledWave](sql/1032703077.sql); source-definition SHA-256 `838a2eae3be7a624d931fabac5e7191d89686bc9cf66f35b75da896a9d13322f`, reading-copy SHA-256 `c09a4a805b07c76023645304cc78e12fe5210c909404b0c73809f6ee3ee88315`, one-based inclusive lines [[1, 58]].

`awr-wave-aim`: [Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md); AIM article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`, original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`, nodes n65.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Are empty loads reset to zero status? Expected: NULL aggregates fail positive guard, so old statuses remain. Must not claim: Automatic zero/closed load status.
- Does HIST prefix prove a history write? Expected: Reviewed body SELECTs grouped snapshots. Must not claim: History was persisted by that helper.

## 68. Allocation unit conversion selection

**Question:** Does conversion update guarantee the largest pack for each allocation?

**What it does.** The body chooses integer conversion candidates and maximum unit sequence, with item-class fallback only when no item-specific units exist. Its outer join does not carry the grouped allocation ID back to the target, so deterministic per-request largest-pack selection is not established from this body.

**What happens**

Trigger: Authorized application/caller selects the named helper; actual UI binding and permission enforcement remain unverified.

1. Item-specific existence suppresses class fallback; conversion factor is used as a divisor. Evidence: `awr-batch-1834801944`, `awr-allocation-aim`.
2. Factor/item/company/class joins and sequence selection update wave requests. Evidence: `awr-batch-1834801944`, `awr-allocation-aim`.

**What can affect it**

- UOM factor, sequence, item/company/class records and coded NULL sentinel.

**What you can check**

- UOM factor, sequence, item/company/class records and coded NULL sentinel.

**Expected results and limits**

- Converted quantity/UM and dimensions, not new inventory reservations.
- No divide-by-zero guard or demonstrated uniqueness of multiple matching candidates.
- Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**More detail and sources**

`awr-batch-1834801944`: [dbo.ALC_UpdateShipAllocReqFP](sql/1834801944.sql); source-definition SHA-256 `685ea5d76caaa726566fb586f62e549fc12b192be11a3fcf3e9f5d51a9401956`, reading-copy SHA-256 `04f74553073971af9cd383ea7375c6cbe1ab33c0582ef70ae70f6a0e98e60838`, one-based inclusive lines [[1, 142]].

`awr-allocation-aim`: [Allocation Process Summary: Functionality](../AIM/reading/a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3.md); AIM article `a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3`, original SHA-256 `4bb0846eaeda14b5bf3a42ee4d3887811eb92d8143191fcdfba8c732c51c2043`, nodes n67, n69, n71, n73, n75.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does unusable item-specific configuration fall back to class? Expected: Existence of any item-specific UOM suppresses that fallback. Must not claim: Fallback always occurs when no integer pack fits.
- Does the helper reserve more stock? Expected: It updates conversion metadata and converted quantity. Must not claim: Inventory allocation was performed.

## 69. Allocation split and destination association

**Question:** Is an allocation split all-or-nothing?

**What it does.** The split first reduces the source, then copies a new request through a destination-location join. It has no local transaction or input-bound checks. A missing destination can leave the source reduced with no new row. Equal/full split can expose division by zero in the second statement; output uses session-wide @@IDENTITY.

**What happens**

Trigger: Authorized application/caller selects the named helper; actual UI binding and permission enforcement remain unverified.

1. Insert reads the updated source and destination metadata. Evidence: `awr-batch-1388180341`, `awr-batch-1404180398`, `awr-batch-1420180455`, `awr-allocation-aim`.
2. Destination change and container allocation relink are distinct calls. Evidence: `awr-batch-1388180341`, `awr-batch-1404180398`, `awr-batch-1420180455`, `awr-allocation-aim`.

**What can affect it**

- Destination LOCATION in allocation TO_WHS supplies templates/zone.

**What you can check**

- Destination LOCATION in allocation TO_WHS supplies templates/zone.

**Expected results and limits**

- Conditional request split; separate association writes.
- No stock movement or atomic caller sequence proved.
- Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**More detail and sources**

`awr-batch-1388180341`: [dbo.DAS_SplitAllocsAcrossToLocs](sql/1388180341.sql); source-definition SHA-256 `a54fbb3485e5009b6fc342a3270b133864502b3ba9b8c403bbd28506b0a19299`, reading-copy SHA-256 `61dfbb007648170cefd1052c9b49f50ae8eabba8451fbe66384cf9ac2af81718`, one-based inclusive lines [[1, 85]].

`awr-batch-1404180398`: [dbo.DAS_UpdateAllocsToLoc](sql/1404180398.sql); source-definition SHA-256 `ed11d74cd227bec11106124017cbdd2454c10f079951f7154babaff004ccf137`, reading-copy SHA-256 `a527bc32567208f0db3b03322552712a641464e33d1f204d7cf5715405f4ff9a`, one-based inclusive lines [[1, 41]].

`awr-batch-1420180455`: [dbo.DAS_UpdateContsAllocNum](sql/1420180455.sql); source-definition SHA-256 `dac698b94e0927381f3c11bb224aca047fc5a974334f04a1e224d4a3c6e100cc`, reading-copy SHA-256 `ffb6ed3845e8400798570d52d8201e9fb387c8840d38ce40735d9059c2b152f7`, one-based inclusive lines [[1, 32]].

`awr-allocation-aim`: [Allocation Process Summary: Functionality](../AIM/reading/a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3.md); AIM article `a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3`, original SHA-256 `4bb0846eaeda14b5bf3a42ee4d3887811eb92d8143191fcdfba8c732c51c2043`, nodes n67, n69, n71, n73, n75.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Is new ID always the new allocation ID? Expected: @@IDENTITY is session-wide and can be stale if no insert occurs. Must not claim: Guaranteed scope-safe new ID.
- What if destination location is missing? Expected: First UPDATE may succeed; INSERT joins no row. Must not claim: Automatic rollback of source reduction.

## 70. Replenishment capacity fallback

**Question:** Does missing capacity always mean maximum zero and minimum 100 percent?

**What it does.** No. Those substitutions apply only inside a matching configuration row. Output variables are not initialized; an incoming maximum can suppress fallback and no-match can retain incoming values. Item/location, item/type and class fallback queries have distinct warehouse scope and unordered company matches.

**What happens**

Trigger: Authorized application/caller selects the named helper; actual UI binding and permission enforcement remain unverified.

1. Specific location includes warehouse; type query does not. Evidence: `awr-batch-23319493`, `awr-replenishment-aim`.
2. Company-NULL/class fallbacks depend on current output state. Evidence: `awr-batch-23319493`, `awr-replenishment-aim`.

**What can affect it**

- Incoming output values, item/class, location/type and company candidates.

**What you can check**

- Incoming output values, item/class, location/type and company candidates.

**Expected results and limits**

- Capacity settings through output parameters.
- No available-stock quantity, active values or replenishment amount measured.
- Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**More detail and sources**

`awr-batch-23319493`: [dbo.INV_RtrvRplnLocCapacity](sql/23319493.sql); source-definition SHA-256 `a823a0b517a7ca1932ac889954c9a67e143fc42558304c36b8e4897c2ac76ecb`, reading-copy SHA-256 `43396e6c7991646988e2f6da79d277b3b24d29a13de5bb00f596bc96abdafb50`, one-based inclusive lines [[1, 106]].

`awr-replenishment-aim`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does no row return 0 and100 automatically? Expected: No row leaves variables unchanged; ISNULL substitutions occur only on a matched row. Must not claim: Universal missing-configuration defaults.
- Is exact company always preferred? Expected: Company exact and NULL can qualify together without ordering. Must not claim: Guaranteed specific-company precedence.

## 71. Marking a location for replenishment evaluation

**Question:** Does marking a location immediately refill it?

**What it does.** The procedure sets RPLN_EVALUATION=Y only through the real-time-enabled branch and requests process history. It does not allocate product, create a replenishment request, create work or move stock. Vendor documentation makes subsequent work creation depend on wave steps and replenishment-master method.

**What happens**

Trigger: Authorized application/caller selects the named helper; actual UI binding and permission enforcement remain unverified.

1. Already-marked, newly-marked and ineligible branches set message outputs. Evidence: `awr-batch-197224103`, `awr-batch-1162799550`, `awr-batch-1258799892`, `awr-replenishment-aim`, `awr-work-aim`.
2. Localization and history helper calls do not establish downstream execution. Evidence: `awr-batch-197224103`, `awr-batch-1162799550`, `awr-batch-1258799892`, `awr-replenishment-aim`, `awr-work-aim`.
3. Those helpers only set WORK_CREATED=Y. Evidence: `awr-batch-197224103`, `awr-batch-1162799550`, `awr-batch-1258799892`, `awr-replenishment-aim`, `awr-work-aim`.

**What can affect it**

- REAL_TIME_RPLN, RPLN_EVALUATION, culture, replenishment master and configured work-creation wave step.

**What you can check**

- REAL_TIME_RPLN, RPLN_EVALUATION, culture, replenishment master and configured work-creation wave step.

**Expected results and limits**

- Evaluation or work-created flag mutation according to selected helper.
- No rowcount proof in mark output and no return capture from history.
- Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**More detail and sources**

`awr-batch-197224103`: [dbo.MarkLocationforReplenishment](sql/197224103.sql); source-definition SHA-256 `87af8736b8b290e6ae49bbe1a464b892fe2c8db6744345f90660eb1dae6b5504`, reading-copy SHA-256 `9679de63cd615ef991516e9773f4585ae32206e2750c961ea4bf9d47f7da03f6`, one-based inclusive lines [[1, 81]].

`awr-batch-1162799550`: [dbo.WRK_UpdateAllocWorkCreated](sql/1162799550.sql); source-definition SHA-256 `c6c22ac326a03b9d18165f964a319d0b15c6c8deba7cbe7a54884174f8f34e75`, reading-copy SHA-256 `8759b02229458138516896a52d9044058ea11f3462af8d84d6842eff87dd381a`, one-based inclusive lines [[1, 17]].

`awr-batch-1258799892`: [dbo.WRK_UpdateReplenWorkCreated](sql/1258799892.sql); source-definition SHA-256 `d8bb925f1b0d1ceae3817e7152e25370e5d59620007f7267828f8a77653eaa1d`, reading-copy SHA-256 `cc0ae15c67f2e91cc68843f1d91b8670f7ec31c23bfcec96087b1ca80fe9f6d6`, one-based inclusive lines [[1, 17]].

`awr-replenishment-aim`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138.

`awr-work-aim`: [Work Process Summary: Functionality](../AIM/reading/76770f4602f9b9e52b4fce3fb8973ffa25b3e882ead4fd0e2faea14766f877a3.md); AIM article `76770f4602f9b9e52b4fce3fb8973ffa25b3e882ead4fd0e2faea14766f877a3`, original SHA-256 `8fe175033aa7df42a105d4f6f4761a35c333680abae209074c8a16c16cad10e6`, nodes n65.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does a work-created Y update insert instructions? Expected: Flag setters contain no instruction INSERT. Must not claim: Instructions now exist or were executed.
- Does every replenishment automatically create work? Expected: Vendor methods/wave-step inclusion govern it; flags alone do not. Must not claim: Universal immediate work creation.

## 72. Replenishment split orientation

**Question:** Which request retains the supplied split quantity?

**What it does.** The original request retains the supplied quantity. The inserted request gets old minus supplied, and the separately supplied instruction is linked to the new request. No upper bound, instruction association check or local transaction guarantees a valid atomic split.

**What happens**

Trigger: Authorized application/caller selects the named helper; actual UI binding and permission enforcement remain unverified.

1. Explicit copy retains original value/timestamp fields. Evidence: `awr-batch-1130799436`, `awr-replenishment-aim`.
2. These are subsequent independent statements. Evidence: `awr-batch-1130799436`, `awr-replenishment-aim`.

**What can affect it**

- Caller quantity, original request, instruction ID and current request conversion quantities.

**What you can check**

- Caller quantity, original request, instruction ID and current request conversion quantities.

**Expected results and limits**

- Remainder request, original retained quantity and instruction reference update.
- No automatic instruction quantity adjustment or physical stock transfer.
- Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**More detail and sources**

`awr-batch-1130799436`: [dbo.WRK_SplitReplenishmentRequest](sql/1130799436.sql); source-definition SHA-256 `288fe4e78fb6b6e2018a6b91b6e5e1130c6102b8993bdab8ffbd89769e295173`, reading-copy SHA-256 `8c90a5e42ea4e71a65660da82fb8c75cd08ade333e45fc62aaa31be151ff9798`, one-based inclusive lines [[1, 190]].

`awr-replenishment-aim`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the new request always get the argument quantity? Expected: New gets old minus argument; original gets argument. Must not claim: Reversed split orientation.
- Is overlarge quantity rejected? Expected: Only NULL/nonpositive arguments are rejected; no upper bound. Must not claim: All excessive splits safely fail before mutation.

## 73. Replenishment counts and projections

**Question:** Is DoOpenRplnExist a reliable count of distinct requests?

**What it does.** It sums two count rows using UNION, so equal counts collapse. Its joined branch can also count several instructions for one request. The detail pane counts instruction/history rows under different predicates; the request view can duplicate rows through inventory joins without attribute identity.

**What happens**

Trigger: Authorized application/caller selects the named helper; actual UI binding and permission enforcement remain unverified.

1. Marked/uncreated and created/open-work predicates differ. Evidence: `awr-batch-1656705300`, `awr-batch-2085230829`, `awr-batch-588581185`, `awr-replenishment-aim`.
2. Detail and view outputs have their own granularity. Evidence: `awr-batch-1656705300`, `awr-batch-2085230829`, `awr-batch-588581185`, `awr-replenishment-aim`.

**What can affect it**

- Include-marked flag defaults Y; item/company/destination and instruction conditions.

**What you can check**

- Include-marked flag defaults Y; item/company/destination and instruction conditions.

**Expected results and limits**

- Predicate-based numbers and projections, not guaranteed distinct request totals.
- No current counts or deployment frequency of duplicate identities were observed.
- Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**More detail and sources**

`awr-batch-1656705300`: [dbo.INVfn_DoOpenRplnExist](sql/1656705300.sql); source-definition SHA-256 `96bc9f1de22a1e469ce0b6cfbfb9f6925c0ce97e01d021626c25032eb926d0eb`, reading-copy SHA-256 `e77620d3a791fe8d958ca3268f5e2571ce6c60f76e938d4315f6ca1f8cb36860`, one-based inclusive lines [[1, 108]].

`awr-batch-2085230829`: [dbo.Replenishment_InsightDetailPaneData](sql/2085230829.sql); source-definition SHA-256 `f12c4f7444b1e930a8ea85c7dc6b5bc2252935f0afd990871a4b4b69d8994da7`, reading-copy SHA-256 `b766d1cd02e2a90c334acf78045964aa607159aaa860ae6d6d380ae627a509b4`, one-based inclusive lines [[1, 53]].

`awr-batch-588581185`: [dbo.REPLENISHMENT_REQUEST_VIEW](sql/588581185.sql); source-definition SHA-256 `49bf8b618c45fd917f145537aa149e784b441a25da02c9c8f335b7101ad01164`, reading-copy SHA-256 `8a039f44aea5b60f15fdc2ebb19fa7bdd1049665213de256ae82981394469eb4`, one-based inclusive lines [[1, 37]].

`awr-replenishment-aim`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What if both branch counts equal three? Expected: UNION keeps one numeric3 row, so SUM is3. Must not claim: Guaranteed total6.
- Is view one row per request? Expected: Missing attribute join can produce multiple source/destination matches. Must not claim: Guaranteed one-row-per-request shape.

## 74. Stored wave metric meaning

**Question:** Does AllocatedQuantity measure current allocated inventory?

**What it does.** This wrapper copies LAUNCH_STATISTICS.TOTAL_QTY, the same stored field used by TotalQuantity, into statistics storage. Rejected metrics use specific status-slot formulas, including baseline adjustment and nullable quantity arithmetic. These are stored reporting calculations, not measured physical execution.

**What happens**

Trigger: Authorized application/caller selects the named helper; actual UI binding and permission enforcement remain unverified.

1. Metric names do not replace the actual formula. Evidence: `awr-batch-1610801146`, `awr-batch-1658801317`, `awr-batch-1674801374`, `awr-batch-1722801545`, `awr-batch-1770801716`, `awr-batch-1786801773`, `awr-batch-1802801830`, `awr-batch-1818801887`, `awr-batch-270272368`, `awr-wave-aim`.
2. Independent reads do not form a guaranteed snapshot. Evidence: `awr-batch-1610801146`, `awr-batch-1658801317`, `awr-batch-1674801374`, `awr-batch-1722801545`, `awr-batch-1770801716`, `awr-batch-1786801773`, `awr-batch-1802801830`, `awr-batch-1818801887`, `awr-batch-270272368`, `awr-wave-aim`.

**What can affect it**

- Statistics field metadata, original-line baseline, numeric998/999 slot predicates and resource language.

**What you can check**

- Statistics field metadata, original-line baseline, numeric998/999 slot predicates and resource language.

**Expected results and limits**

- Stored scalar metrics or display/count result sets.
- Whole-process duration, distinct work units and actual warehouse completion remain unproven.
- Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**More detail and sources**

`awr-batch-1610801146`: [dbo.WVST_AllocatedQuantity](sql/1610801146.sql); source-definition SHA-256 `2c19b1424faaeb1eb7b995cd0af8b73aa8d244d6f45f392ec64ceba712724778`, reading-copy SHA-256 `74d1db3ddf82706c473ea69c4d732b5aa5356d7800e8b08fe16e94701cf655c3`, one-based inclusive lines [[1, 27]].

`awr-batch-1658801317`: [dbo.WVST_LinesCompletelyRejected](sql/1658801317.sql); source-definition SHA-256 `7b961e913edec6c12ad2a6d670a62bbf7085b3fa06276a78bc8709ecac3e852c`, reading-copy SHA-256 `5a4b8e0e5865473412eb5a50188bd4ed9edf3ee45645e08cf3bb78b381c181f5`, one-based inclusive lines [[1, 43]].

`awr-batch-1674801374`: [dbo.WVST_LinesPartiallyRejected](sql/1674801374.sql); source-definition SHA-256 `c6e53f7d526e463f4dbeb704525b5b4903200b566ff6fd0e2bb38b50d3ba6ebf`, reading-copy SHA-256 `e9cda9ec9473cc63f72993968c9e987768fd11d068c1011a6e2de7f84f9ea6aa`, one-based inclusive lines [[1, 51]].

`awr-batch-1722801545`: [dbo.WVST_RejectedQuantity](sql/1722801545.sql); source-definition SHA-256 `ddb2e1d61cc9ebdd112da6b69936f74c55fba005d9be0064c691aa1a767a100b`, reading-copy SHA-256 `0ef110ea521164b64cef73aec36070ceb170751c1a7e317ab961cc7921fbaa6c`, one-based inclusive lines [[1, 39]].

`awr-batch-1770801716`: [dbo.WVST_TotalLines](sql/1770801716.sql); source-definition SHA-256 `bb72f5c58074a2871ec78ad391814210ab989bab4f2045667fb444a10a5cfca7`, reading-copy SHA-256 `317fffa1f29b3a1eb4ff1441749f7e63122f339a5c3255a0795c101e793d77a7`, one-based inclusive lines [[1, 27]].

`awr-batch-1786801773`: [dbo.WVST_TotalQuantity](sql/1786801773.sql); source-definition SHA-256 `267f5ceb10b51a1d6b26c53aab2b7a3013927b2bcda80dbde20b4f4f35540835`, reading-copy SHA-256 `4474bb9e7615f27c37cc754018418fb2fd871b89a8228d1e2d36ba65c4c41c93`, one-based inclusive lines [[1, 27]].

`awr-batch-1802801830`: [dbo.WVST_TotalShipments](sql/1802801830.sql); source-definition SHA-256 `b131e1a6d129db37467b1fec6b684e2383946a7d22c5c70507c55c719df0c808`, reading-copy SHA-256 `c75372bf65b9c27f800e42d0facc176d2484f0ded021c7470b50ca575a303926`, one-based inclusive lines [[1, 27]].

`awr-batch-1818801887`: [dbo.WVST_WaveStatisticsHeaderFields](sql/1818801887.sql); source-definition SHA-256 `fac526edb8be0bcadceec9fec9632730c99f59639bad479bc6ee0bae69cad4bb`, reading-copy SHA-256 `39418b075b8aaa25a1b5cb51131880ebd9e63521c4676a466599a47530e522ad`, one-based inclusive lines [[1, 40]].

`awr-batch-270272368`: [dbo.WAVE_InsightDetailPaneData](sql/270272368.sql); source-definition SHA-256 `fe815fb804d4ad0b11c503c7e7c3ce765633d7159fab79802191e2ccca00b4dc`, reading-copy SHA-256 `aacdfce3227f5d5c19de109874c15978c9ecd1d88512a7736c5642ab78f3a3b0`, one-based inclusive lines [[1, 57]].

`awr-wave-aim`: [Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md); AIM article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`, original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`, nodes n65.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does allocated quantity recalculate LOCATION_INVENTORY? Expected: It reads stored TOTAL_QTY only. Must not claim: Live allocated inventory measured.
- Do all rejected NULL quantities become zero? Expected: Row addition can become NULL before aggregate; final zero fallback does not repair that row. Must not claim: Exact quantity conservation.
- Are work-unit pane counts DISTINCT? Expected: Header instruction rows are counted. Must not claim: Guaranteed distinct executable work units.

## 75. Statistics read and save contracts

**Question:** Does missing statistics data always read as zero and save atomically?

**What it does.** The getter preserves a non-NULL incoming output when no value row matches, then replaces only NULL with zero. Missing field metadata raises severity18. The saver first reads a row ID then updates or inserts; no local transaction or uniqueness guarantee on field/source key makes it an atomic upsert.

**What happens**

Trigger: Authorized application/caller selects the named helper; actual UI binding and permission enforcement remain unverified.

1. Missing metadata raises an error before value access. Evidence: `awr-batch-2033754648`, `awr-batch-2049754705`.
2. Getter output retention differs from a universal default; saver uses a separate existence read. Evidence: `awr-batch-2033754648`, `awr-batch-2049754705`.

**What can affect it**

- Named source/field records; nullable VALUE and nonnullable SOURCE_KEY/FIELD_ID in captured catalog.

**What you can check**

- Named source/field records; nullable VALUE and nonnullable SOURCE_KEY/FIELD_ID in captured catalog.

**Expected results and limits**

- Scalar output or stored value/timestamp.
- Captured unique index is on OBJECT_ID, not field/source-key pair; concurrent duplicate inserts are not prevented by this helper.
- Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**More detail and sources**

`awr-batch-2033754648`: [dbo.STAT_GetStatisticsValue](sql/2033754648.sql); source-definition SHA-256 `2b187097652bf3221303daf896762acedcc800c78aeb05ad4d0cef50170ad0e6`, reading-copy SHA-256 `750620577d3d522119825e726da77f100d9b378ba2534ae5ff8d0d699cc463f3`, one-based inclusive lines [[1, 51]].

`awr-batch-2049754705`: [dbo.STAT_SaveStatisticsValue](sql/2049754705.sql); source-definition SHA-256 `b18253df77c59b847fc77747b7863f56a1090ee3e9a5fd3382843e7187134e90`, reading-copy SHA-256 `2308df3f07a595e298335163da2fb106a93bb89b0d0c68de0ff7229343526ef5`, one-based inclusive lines [[1, 81]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- If incoming output is7 and no row matches, what is returned? Expected: Existing7 is retained because assignment changes no row and ISNULL preserves7. Must not claim: Always0.
- Are two first saves guaranteed to merge? Expected: Read-before-insert and absence of captured composite uniqueness leave race possibility. Must not claim: Atomic idempotent upsert.

## 76. Zero inventory cleanup after wave replenishment

**Question:** Can cancellation cleanup affect a different inventory identity at the same location?

**What it does.** Its initial candidate join includes company/lot/attributes, but the inner cleanup deliberately narrows identity only to location, item and warehouse. It chooses the minimum ID across that broader set, deletes other rows with all four quantities zero and clears lot/attribute identity on a retained all-zero row.

**What happens**

Trigger: Authorized application/caller selects the named helper; actual UI binding and permission enforcement remain unverified.

1. Permanent flag and request identity qualify cursor candidates. Evidence: `awr-batch-1288703989`, `awr-replenishment-aim`.
2. Inner minimum/delete predicates omit company/lot/attributes. Evidence: `awr-batch-1288703989`, `awr-replenishment-aim`.

**What can affect it**

- Wave-linked replenishment destinations and stored inventory identity/quantities.

**What you can check**

- Wave-linked replenishment destinations and stored inventory identity/quantities.

**Expected results and limits**

- Conditional zero-row deletion/identity cleanup.
- No actual company/lot data examined; READ_ONLY cursor does not mean a read-only procedure.
- Snapshot body review only; no operational records, routines, active configuration, permission checks or physical work were executed.

**More detail and sources**

`awr-batch-1288703989`: [dbo.INV_LaunchCancelWithReplenish](sql/1288703989.sql); source-definition SHA-256 `102af372e49cd51071456d065963afa682a821737b65b31674c0d939a1c593f4`, reading-copy SHA-256 `ed2fe8a5b640dee867ac779ff92f01f46bff25d77f71c1856ebd85974aa73f4f`, one-based inclusive lines [[1, 71]].

`awr-replenishment-aim`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the procedure only read because its cursor is READ_ONLY? Expected: Separate DELETE/UPDATE statements mutate persistent inventory rows. Must not claim: No mutation.
- Does it delete rows with nonzero inventory? Expected: All four quantities must equal zero; NULL also fails that predicate. Must not claim: Unconditional inventory deletion.

## 77. Understanding print selection and wave reprint context

**Question:** Does a returned document selection prove that a document printed?

**What it does.** Print-selection procedures return entity context, eligible document definitions and user printer defaults. Wave reprint procedures also return context. Rendering, dispatch and successful physical output need separate evidence.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Read the selected user printer defaults and entity context for the print-process code. Evidence: `si-sql-901226611`, `si-sql-1141227466`, `si-sql-1157227523`, `si-sql-1317228093`, `si-sql-437224958`, `si-aim-paperwork`.
2. Match eligible DOCUMENT_TYPE slots and default flags, then apply the captured feature-dependent exclusion. Evidence: `si-sql-901226611`, `si-sql-1141227466`, `si-sql-1157227523`, `si-sql-1317228093`, `si-sql-437224958`, `si-aim-paperwork`.
3. Hand the selection to the configured application/renderer; confirm completion separately. Evidence: `si-sql-901226611`, `si-sql-1141227466`, `si-sql-1157227523`, `si-sql-1317228093`, `si-sql-437224958`, `si-aim-paperwork`.

**What can affect it**

- Compare process code, entity ID, user profile and document process/default pairs.
- Printer selection requires CLOSED N; the two reprint context getters do not.
- Manifest-close context returns flags only.

**What you can check**

- Compare process code, entity ID, user profile and document process/default pairs.
- Printer selection requires CLOSED N; the two reprint context getters do not.
- Manifest-close context returns flags only.

**Expected results and limits**

- A bounded selection/result shape, not a dispatched job.
- An unsupported process can change result-set count. Feature/document selector labels remain opaque in the public copy.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`si-sql-901226611`: [dbo.MetaTrans_GetPrintSelectedDocuments](sql/901226611.sql); source-definition SHA-256 `3666927fec11eb02d5779ecb9683a8fd53077a15405f6587ff1b74659f4ecc13`, reading-copy SHA-256 `5e4b1a969339ecb9c4eb7ad07570b13ff9cc514233bf15e2bc889f2706dd583f`, one-based inclusive lines [[1, 300]].

`si-sql-1141227466`: [dbo.MetaTrans_ReprintWaveDocs](sql/1141227466.sql); source-definition SHA-256 `e23906cbe0481399347b52850ad52895665365ab3c9fceafb2c3826c63cd78ac`, reading-copy SHA-256 `2a9c4a205d4664eb31d5b05e2c4e1e371ce4226e52e3b8e93e62c818e5e8f0bf`, one-based inclusive lines [[1, 24]].

`si-sql-1157227523`: [dbo.MetaTrans_ReprintWaveLabels](sql/1157227523.sql); source-definition SHA-256 `9a1278b37f028a3c9eda4d3528137c42b62b791a68d17fda6cf766a7a5fcfd69`, reading-copy SHA-256 `7766e5f3b22064864bd42044700f4d547fecefd60f01de0fbe491e32bafebbbf`, one-based inclusive lines [[1, 29]].

`si-sql-1317228093`: [dbo.MetaTrans_WavePrinterSelection](sql/1317228093.sql); source-definition SHA-256 `7df8394d082c7ac31df3b5000ad6956143e8c5b6bb4d6406fa30108d35e1b543`, reading-copy SHA-256 `72bd2f5e450a76a5c3ce8d92d07acc9ab8448a00b55830b9fea1a620ceda671e`, one-based inclusive lines [[1, 27]].

`si-sql-437224958`: [dbo.MetaTrans_CloseManifest](sql/437224958.sql); source-definition SHA-256 `72f957ca0d830d9b07b195e7b591e4f940d41d7e117a440cac57d6b8662b913a`, reading-copy SHA-256 `f4fd13543fdeaf35d58f0405162b5e2d51ff59573924aab194c5ecb98dbbbcb1`, one-based inclusive lines [[1, 44]].

`si-aim-paperwork`: [Paperwork Process Summary: Functionality](../AIM/reading/55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56.md); AIM article `55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56`, original SHA-256 `f7d597f378321afb3251784f133a91d233a2f24534422bf53cfcefa420168688`, nodes n66.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- An unsupported print process was submitted. Are two result sets guaranteed? Expected: Only supported branches emit context; the document query still runs. Must not claim: Two result sets always exist.
- A closed wave appears in reprint context but not printer selection. Is that impossible? Expected: Printer selection alone has CLOSED N; reprint getters do not. Must not claim: All three getters have the same wave filter.
- The document appears in a selection. Did the printer receive it? Expected: Selection is separate from renderer and printer acknowledgment. Must not claim: Successful physical printing.

## 78. Finding stored labels and label-print parameters

**Question:** Why can label lookup return NULL or an unexpected container?

**What it does.** The image getter returns ordinary and returns images for an internal container number and ignores its document-type parameter. The separate label-parameter helper looks up text container ID without using its warehouse argument.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Identify whether the request is for stored binary images or print parameters. Evidence: `si-sql-968702849`, `si-sql-1458208345`, `si-aim-paperwork`.
2. Image lookup selects returns flag Y and ordinary flag N; parameter lookup uses text container ID and fixed document/process selectors. Evidence: `si-sql-968702849`, `si-sql-1458208345`, `si-aim-paperwork`.
3. Inspect missing or ambiguous matches before attributing the result to a printer. Evidence: `si-sql-968702849`, `si-sql-1458208345`, `si-aim-paperwork`.

**What can affect it**

- The Warehouse argument does not constrain the parameter helper.
- Repeated matching images/IDs use unordered variable assignment.

**What you can check**

- The Warehouse argument does not constrain the parameter helper.
- Repeated matching images/IDs use unordered variable assignment.

**Expected results and limits**

- One result row can contain NULL values; no label is printed.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`si-sql-968702849`: [dbo.GetShippingLabelImage](sql/968702849.sql); source-definition SHA-256 `104e0e9fdb4b3433bae8abcc1df91e5d2e9d89a4c8f3bb7ca9d3984946bbbf8c`, reading-copy SHA-256 `b930acfbbbaf54dcdcbc3f2fbd7db8235474da5324809a621f04680d2ca55fc7`, one-based inclusive lines [[1, 25]].

`si-sql-1458208345`: [dbo.TRAV_EX01_GetPrintLabelDetails](sql/1458208345.sql); source-definition SHA-256 `9ebb1fca557dc1f0a5ee388bc4b2b80a432d5c2c18f73976bd7b10e6c37b5ee4`, reading-copy SHA-256 `801dafc379a1026593c605529c9d746d5311e90d03187a4ac2985dc2b81ec775`, one-based inclusive lines [[1, 39]].

`si-aim-paperwork`: [Paperwork Process Summary: Functionality](../AIM/reading/55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56.md); AIM article `55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56`, original SHA-256 `f7d597f378321afb3251784f133a91d233a2f24534422bf53cfcefa420168688`, nodes n66.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does DOCUMENT_TYPE filter GetShippingLabelImage? Expected: The parameter is unused. Must not claim: It selects a document-specific image.
- Does missing image return no result row? Expected: The image getter returns one row with NULL image values. Must not claim: No result set is returned.
- Can Warehouse disambiguate duplicate text container IDs in the parameter helper? Expected: Warehouse is unused by that body. Must not claim: Warehouse guarantees the right container.

## 79. Understanding queued reprint requests

**Question:** What does the custom reprint procedure actually complete?

**What it does.** It selects non-NULL container IDs in the specified wave at numeric status 300 and inserts Ready DIF messages. A message is a request; downstream DIF processing and printing are separate.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Select qualifying container IDs through a cursor. Evidence: `si-sql-1877178033`, `si-aim-device-integration-framework`.
2. Concatenate each ID into a fixed message envelope and insert a Ready DIF request. Evidence: `si-sql-1877178033`, `si-aim-device-integration-framework`.
3. Require downstream processing and printer evidence to establish completion. Evidence: `si-sql-1877178033`, `si-aim-device-integration-framework`.

**What can affect it**

- No deduplication check is performed.
- Supplied username and error/success output parameters are unused.
- Routing constants and status meaning need separate deployment evidence.

**What you can check**

- No deduplication check is performed.
- Supplied username and error/success output parameters are unused.
- Routing constants and status meaning need separate deployment evidence.

**Expected results and limits**

- Zero or more incoming-message rows; output success/error variables remain unchanged.
- A rerun can enqueue duplicates. A partial failure can leave earlier messages. No escaping function wraps the interpolated ID.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`si-sql-1877178033`: [dbo.TRAV_EX01_ReprintPS](sql/1877178033.sql); source-definition SHA-256 `ef3adbf166398ee94cf47eba345fa5599f41dd1c9018e67129200e70f2cf48d0`, reading-copy SHA-256 `bf50fa0cd04470f27387bfd64645e6661e6bd390963643a9d1ca166cbf156590`, one-based inclusive lines [[1, 47]].

`si-aim-device-integration-framework`: [Device Integration Framework Process Summary: Functionality](../AIM/reading/6678efaf48f28c0a44b2e1460d2ab6c18050a333a56de1c53ba503cb274c6b60.md); AIM article `6678efaf48f28c0a44b2e1460d2ab6c18050a333a56de1c53ba503cb274c6b60`, original SHA-256 `74bb52247a8d357f0ae9e8639f45f24337864b942d0f0c28254ea313a5f68966`, nodes n65, n67, n69.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does Ready prove the label printed? Expected: Ready is the inserted request state; downstream completion is unverified. Must not claim: The printer completed successfully.
- Will a rerun skip already queued containers? Expected: No deduplication check is present. Must not claim: It is idempotent.
- Can I trust the success output as a result? Expected: The body never assigns that output. Must not claim: A populated success result is guaranteed.

## 80. Understanding QC settings versus QC execution

**Question:** Does loading QC context grant or execute a QC action?

**What it does.** The context routine combines user packing-preference flags, system configuration and security checkpoint values into three result sets. It does not inspect containers, assign QC, force a pass or enforce an action itself.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Resolve the existing user packing preference and its NULL fallback. Evidence: `si-sql-1205227694`, `si-aim-quality-control`.
2. Read checkpoint values for menu 4005 and relevant action IDs. Evidence: `si-sql-1205227694`, `si-aim-quality-control`.
3. Return scalar options and two lookup lists; leave action enforcement to the consuming application. Evidence: `si-sql-1205227694`, `si-aim-quality-control`.

**What can affect it**

- Missing user is different from existing user with a NULL preference.
- No ACTIVE packing-preference filter is applied.
- Warehouse is passed through rather than filtering configuration.

**What you can check**

- Missing user is different from existing user with a NULL preference.
- No ACTIVE packing-preference filter is applied.
- Warehouse is passed through rather than filtering configuration.

**Expected results and limits**

- QC context and lookup data only.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`si-sql-1205227694`: [dbo.MetaTrans_ShippingContainerQC](sql/1205227694.sql); source-definition SHA-256 `a8609932a94cc98e355d12ff46d95f4502a3f22b47b8a06f607467fcc66d7287`, reading-copy SHA-256 `aad03af2d2969904b5975d7ff2a5a7e7e8e584e3874ede1de2017bfb74404295`, one-based inclusive lines [[1, 86]].

`si-aim-quality-control`: [Quality Control Process Summary: Functionality](../AIM/reading/7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff.md); AIM article `7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff`, original SHA-256 `51b07421090b73e4d97f4a49f4d74557d4ca6d71bb35156614a6e641675ce7ce`, nodes n64, n87, n92, n96, n99, n102, n104, n106.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does a missing user get the default packing preference? Expected: The fallback is inside the existing-user scalar subquery; missing user can leave no preference match. Must not claim: Missing and NULL preference are equivalent.
- Does the routine force a pass when ForceQcPassSec is true? Expected: It returns a checkpoint value; it performs no QC mutation. Must not claim: A container is passed.
- Are these settings confirmed for the current warehouse? Expected: No live settings were read and warehouse does not filter the config reads. Must not claim: Current warehouse settings are verified.

## 81. Understanding active carrier and group lookup

**Question:** Why might a carrier or carrier group be absent from these lookups?

**What it does.** The carrier getter requires an exact active carrier/service combination, with explicit NULL-service matching. The group getter requires an exact active group. Neither routine performs rating or applies the full routing policy.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Match the requested carrier/service or group identity. Evidence: `si-sql-1038275104`, `si-sql-487321146`, `si-aim-carrier-management`.
2. Require the captured active Y flag. Evidence: `si-sql-1038275104`, `si-sql-487321146`, `si-aim-carrier-management`.
3. Apply routing, calendars, inheritance and authorization through separately evidenced components. Evidence: `si-sql-1038275104`, `si-sql-487321146`, `si-aim-carrier-management`.

**What can affect it**

- NULL service matches NULL service only.
- Carrier and group names are exact selectors, not wildcard selection.

**What you can check**

- NULL service matches NULL service only.
- Carrier and group names are exact selectors, not wildcard selection.

**Expected results and limits**

- Matching configuration rows or an empty result.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`si-sql-1038275104`: [dbo.wm_RCarrier02](sql/1038275104.sql); source-definition SHA-256 `be1eac3701e5820739b90e02dca6d64a4d1de29c66c9566546719acece666968`, reading-copy SHA-256 `f71b5cbac4bfd04abebfc3d5708693bd3948ae30af0a9f48cc6d6f2471faa237`, one-based inclusive lines [[1, 19]].

`si-sql-487321146`: [dbo.wm_RCarrierGroupHeader02](sql/487321146.sql); source-definition SHA-256 `aba52ef92c08e5631757f220480e4aa17043dff1c53d7e661719e9a4ffcbca7d`, reading-copy SHA-256 `1b81939ce17c487886ce3201791234dc0b95ed894e25536b197691a851b164d5`, one-based inclusive lines [[1, 14]].

`si-aim-carrier-management`: [Carrier Management Process Summary: Functionality](../AIM/reading/0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4.md); AIM article `0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4`, original SHA-256 `6cae75f2a3d61f172808f8acc5a96ad0bc3875fc54c44c6a26bfe7d8b8ae2bd2`, nodes n65, n67, n69, n71, n73, n75.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does NULL service mean all services? Expected: It explicitly matches a NULL stored service. Must not claim: It is a wildcard.
- Does an active record prove a shipment may use the carrier? Expected: Rating, calendars, routing and authorization are outside these getters. Must not claim: Shipment eligibility is established.
- Does the group getter rate all group members? Expected: It reads an active group header only. Must not claim: It performs rating.

## 82. Understanding shipment selection, consolidation, split and manifest context

**Question:** Do these screen-data procedures perform the named shipping operation?

**What it does.** The reviewed presentation procedures retrieve selected shipment data. ShipmentSelection can return multiple same-ID, same-warehouse shipments without a company predicate. Consolidate, Split and Manifesting context procedures do not perform those operations.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Resolve the supplied internal shipment number. Evidence: `si-sql-549225357`, `si-sql-1173227580`, `si-sql-1189227637`, `si-sql-1253227865`, `si-aim-packing-shipping`.
2. Retrieve operation-specific header and line/context data. Evidence: `si-sql-549225357`, `si-sql-1173227580`, `si-sql-1189227637`, `si-sql-1253227865`, `si-aim-packing-shipping`.
3. Separate retrieved context from later authorized mutation, carrier interaction and confirmation. Evidence: `si-sql-549225357`, `si-sql-1173227580`, `si-sql-1189227637`, `si-sql-1253227865`, `si-aim-packing-shipping`.

**What can affect it**

- ShipmentSelection joins by SHIPMENT_ID and WAREHOUSE, not company.
- Split context exposes QUANTITY_AT_STS1 rather than summing all status slots.

**What you can check**

- ShipmentSelection joins by SHIPMENT_ID and WAREHOUSE, not company.
- Split context exposes QUANTITY_AT_STS1 rather than summing all status slots.

**Expected results and limits**

- Presentation result sets only.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`si-sql-549225357`: [dbo.MetaTrans_GetConsolidateShipment](sql/549225357.sql); source-definition SHA-256 `dc13cd2686221c2b7ab530dd7bc840eef91310028ca89fb25f08754c9a73c2a6`, reading-copy SHA-256 `3c0eb5b70eb6e9ed3a7dedec067bc761802149fd9d1c69c5c97281891c2e29aa`, one-based inclusive lines [[1, 50]].

`si-sql-1173227580`: [dbo.MetaTrans_ShipmentLevelManifesting](sql/1173227580.sql); source-definition SHA-256 `659e148107d821b847008f1c270a55c738e60440b1c544412db5ee213ae3aed3`, reading-copy SHA-256 `7cbd2d550140b4a15d02fd563ec97f67640d9bc12f2211eab5035bc42db6abc0`, one-based inclusive lines [[1, 48]].

`si-sql-1189227637`: [dbo.MetaTrans_ShipmentSelection](sql/1189227637.sql); source-definition SHA-256 `ed972bb85579a24ea077e2c866d43a4dca97191478e7f18fb8de3a628e7bf383`, reading-copy SHA-256 `87e02bfb47b9ffc5544cfbc4b8f95847a7cd140d41eb26de0f32a792c7185723`, one-based inclusive lines [[1, 34]].

`si-sql-1253227865`: [dbo.MetaTrans_SplitShipment](sql/1253227865.sql); source-definition SHA-256 `817d4f4c313c01bbbaf3a6693802218bad55d3954dd9c630863c61309281cbf3`, reading-copy SHA-256 `cdc338b776d2f58df9224a594d8444744778020ce179ed572295b17229901c82`, one-based inclusive lines [[1, 40]].

`si-aim-packing-shipping`: [Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md); AIM article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`, original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`, nodes n65.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Will ShipmentSelection return only the chosen internal shipment? Expected: It can return all same-ID same-warehouse rows. Must not claim: Exactly one chosen shipment is guaranteed.
- Does MetaTrans_SplitShipment split data? Expected: It returns header and line result sets only. Must not claim: The shipment was split.
- Does manifest context call a carrier? Expected: The reviewed body reads SHIPMENT_HEADER_VIEW only. Must not claim: Carrier acceptance occurred.

## 83. Understanding X-of-Y container numbering

**Question:** Which containers receive X-of-Y numbers, and is wave numbering atomic?

**What it does.** Shipment numbering assigns ordinals to identified top-level tree roots and resets identified immediate children to zero. Wave numbering invokes that helper inside one transaction per shipment; the body does not provide one whole-wave transaction.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Capture qualifying shipment roots using NOLOCK and order by internal ID. Evidence: `si-sql-1825753907`, `si-sql-1841753964`, `si-aim-packing-shipping`.
2. Assign root ordinal/total and reset identified immediate children. Evidence: `si-sql-1825753907`, `si-sql-1841753964`, `si-aim-packing-shipping`.
3. For a wave, capture shipments and invoke the helper in separate BEGIN/COMMIT pairs. Evidence: `si-sql-1825753907`, `si-sql-1841753964`, `si-aim-packing-shipping`.

**What can affect it**

- Unidentified or deeper descendant rows are outside the explicit child-reset set.
- Ambient caller transactions alter persistence of nested COMMITs.
- Both helper membership reads and wave selection use NOLOCK.

**What you can check**

- Unidentified or deeper descendant rows are outside the explicit child-reset set.
- Ambient caller transactions alter persistence of nested COMMITs.
- Both helper membership reads and wave selection use NOLOCK.

**Expected results and limits**

- Stored count fields change; they do not count shipped item quantity.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`si-sql-1825753907`: [dbo.SHP_SetXOfYForShipment](sql/1825753907.sql); source-definition SHA-256 `6138990c3d8b535c1f0f0e59e51759c1bff6453b3993d66ec98838a5853ab0e7`, reading-copy SHA-256 `b33b779388b005dc88897d324961f1cac5e94a87b1d55442c5f09b1a7c958042`, one-based inclusive lines [[1, 72]].

`si-sql-1841753964`: [dbo.SHP_SetXOfYForWave](sql/1841753964.sql); source-definition SHA-256 `59ded51ef67d4b5c9b3d47f650b92ac40138e5090e23401d16c835d16a55bd4a`, reading-copy SHA-256 `9614323a7b317198223865290dae354c3e909e35a43f7cdc5e2c58816c350d9c`, one-based inclusive lines [[1, 42]].

`si-aim-packing-shipping`: [Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md); AIM article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`, original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`, nodes n65.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Are all nested descendants reset? Expected: Only identified immediate children of selected roots are reset. Must not claim: Every descendant is reset.
- Does one failed shipment roll back the entire wave automatically? Expected: The body has per-shipment transaction pairs and no whole-wave rollback handler. Must not claim: Whole-wave atomicity is guaranteed.
- Does COMMIT inside an existing caller transaction persist each shipment? Expected: Nested COMMIT does not independently persist an ambient outer transaction. Must not claim: Each shipment is independently committed regardless of caller.

## 84. Understanding container counts, location and status flow

**Question:** Can these helper results prove a uniform container hierarchy?

**What it does.** The helpers answer different questions: a row count over selected immediate contents, one distinct location under a branch-specific scope, and one unordered non-NULL status flow from a recursive subtree. None alone proves every descendant is consistent.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Distinguish row count from item quantities and distinct items. Evidence: `si-sql-183320063`, `si-sql-1585753052`, `si-sql-1601753109`, `si-aim-packing-shipping`.
2. Determine whether the location helper uses tree-unit rows or its direct-child fallback. Evidence: `si-sql-183320063`, `si-sql-1585753052`, `si-sql-1601753109`, `si-aim-packing-shipping`.
3. Treat a returned status flow as one candidate, not unanimous subtree agreement. Evidence: `si-sql-183320063`, `si-sql-1585753052`, `si-sql-1601753109`, `si-aim-packing-shipping`.

**What can affect it**

- Location fallback applies ITEM IS NOT NULL only to its self-row arm.
- A NULL location group can contribute to the multiple-location result.
- Status-flow TOP 1 has no precedence or explicit recursion override.

**What you can check**

- Location fallback applies ITEM IS NOT NULL only to its self-row arm.
- A NULL location group can contribute to the multiple-location result.
- Status-flow TOP 1 has no precedence or explicit recursion override.

**Expected results and limits**

- Count, location-or-NULL and zero/one flow result are separate contracts.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`si-sql-183320063`: [dbo.SHIPCONTfn_RtrvItemContentsCount](sql/183320063.sql); source-definition SHA-256 `19c48c50d81ada0265588fba418932bfcd8f115b3642211f8888518e79b4be76`, reading-copy SHA-256 `8cd31ecdf574fb0a9e559bf3502d773c66e31f1581c9da79412749ccacbb40bb`, one-based inclusive lines [[1, 13]].

`si-sql-1585753052`: [dbo.SHIPCONTfn_RtrvCurrentLocation](sql/1585753052.sql); source-definition SHA-256 `36f5f2b97785dfde30dea9415e5435c293d5b9362509ab309441bbc5382d0510`, reading-copy SHA-256 `305665728201896ae9fb4bec8a76c789f8066ff0a60665d9b4ac868777f09b2f`, one-based inclusive lines [[1, 56]].

`si-sql-1601753109`: [dbo.SHP_GetStatusFlowFromContainer](sql/1601753109.sql); source-definition SHA-256 `398ef6bb8da32645ca2d59ca5a49321469cb3c73a6cf501da0dee841a3770c3a`, reading-copy SHA-256 `e8cb620ee625a0d6dc8569047b4f461337584b5bf0ba7b590b548f01832a6379`, one-based inclusive lines [[1, 19]].

`si-aim-packing-shipping`: [Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md); AIM article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`, original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`, nodes n65.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does content count sum quantity? Expected: It is COUNT(*) over the documented row predicate. Must not claim: It sums item quantity.
- Do all fallback location rows require ITEM? Expected: The item predicate applies only to the self-row arm due to AND/OR binding. Must not claim: All direct children require items.
- Does one flow result prove all descendants use it? Expected: TOP 1 is unordered and does not enforce agreement. Must not claim: Subtree flow consistency is verified.

## 85. Understanding shipping group and transfer mutations

**Question:** What related records do the group and transfer helpers actually update?

**What it does.** These helpers have narrow and different scopes: one moves below-threshold container IDs, one transfers a detail and comments, one updates group/spot and optional names, and one clears work-linked groups. Caller orchestration must coordinate broader shipment consistency.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Inspect the captured row selector and whether it is rechecked at mutation time. Evidence: `si-sql-1761753679`, `si-sql-1889754135`, `si-sql-1921754249`, `si-sql-1793753793`, `si-aim-packing-shipping`.
2. Apply only the documented container, detail/comment or work-group changes. Evidence: `si-sql-1761753679`, `si-sql-1889754135`, `si-sql-1921754249`, `si-sql-1793753793`, `si-aim-packing-shipping`.
3. Check broader line, allocation, header and hierarchy consistency in caller logic. Evidence: `si-sql-1761753679`, `si-sql-1889754135`, `si-sql-1921754249`, `si-sql-1793753793`, `si-aim-packing-shipping`.

**What can affect it**

- Container move captures status eligibility once.
- Group spot MAX+1 lacks a serialization protocol.
- Remove-group work joins do not repeat a warehouse restriction on every group member.

**What you can check**

- Container move captures status eligibility once.
- Group spot MAX+1 lacks a serialization protocol.
- Remove-group work joins do not repeat a warehouse restriction on every group member.

**Expected results and limits**

- Explicit storage fields are changed; no complete business transfer is proved.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`si-sql-1761753679`: [dbo.SHP_MoveContainersBelowStatusToShipment](sql/1761753679.sql); source-definition SHA-256 `66578467f49f16f6a0bf18f5b1e56f84e1e95cc5e860cff14c209c28223bc984`, reading-copy SHA-256 `d5fdba96869d06fa5d19ae5c771068175d7502ab3548f2eff7f6734327cea592`, one-based inclusive lines [[1, 49]].

`si-sql-1889754135`: [dbo.SHP_TransferDtlForShipDistr](sql/1889754135.sql); source-definition SHA-256 `040b0b859417adb0a6cac2b4536b8d846d3de3fd61ed07c02b510a7a714bddf6`, reading-copy SHA-256 `3b32586064dd8716a9fb81947952662531e969ebfadc46313e9198c3363d2d84`, one-based inclusive lines [[1, 45]].

`si-sql-1921754249`: [dbo.SHP_UpdateGroupPosition](sql/1921754249.sql); source-definition SHA-256 `d7c7dc4c6cbc59a4c0fc564b4b486c5ba1697b6c273f61ff4390767095d4553e`, reading-copy SHA-256 `e30e15c76228b00916e258feced6ec9d3d8e5e0b9d357ee5597088e4c49e050b`, one-based inclusive lines [[1, 80]].

`si-sql-1793753793`: [dbo.SHP_RemoveContainerGroup](sql/1793753793.sql); source-definition SHA-256 `1a284f0d2441d4d0eb4ebb4069084b82a3df94ce5be76b95bae9a88d481c5623`, reading-copy SHA-256 `dcc30cdcafc522ca49af63f228142ff1e977376c20386bf3bdf8a47596f62853`, one-based inclusive lines [[1, 68]].

`si-aim-packing-shipping`: [Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md); AIM article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`, original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`, nodes n65.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does moving containers also move their shipment detail? Expected: The move helper updates only container shipment number/stamps. Must not claim: It performs the full shipment transfer.
- Is MAX+1 spot assignment concurrency-safe by itself? Expected: No serializable locking or uniqueness protocol is shown. Must not claim: Unique spot assignment is guaranteed.
- Does detail transfer preserve mark-for contacts? Expected: The enumerated MARK_FOR fields are cleared. Must not claim: Mark-for fields remain unchanged.

## 86. Understanding split quantity boundaries and output IDs

**Question:** Do shipping split helpers reject quantities larger than the source?

**What it does.** Both split helpers reject NULL or nonpositive inputs, but neither completely enforces an upper quantity bound. The allocation helper leaves requested quantity on the original and remainder on the clone; the container helper leaves remainder on the original and requested quantity on the clone.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Validate source existence, positive quantity and upper bound in the caller before invoking mutation. Evidence: `si-sql-1857754021`, `si-sql-1873754078`, `si-aim-packing-shipping`.
2. Observe each helper cloning and scaling its documented original/clone quantities. Evidence: `si-sql-1857754021`, `si-sql-1873754078`, `si-aim-packing-shipping`.
3. Coordinate the work inside an appropriate caller transaction and handle returned IDs/errors without assuming outputs were cleared. Evidence: `si-sql-1857754021`, `si-sql-1873754078`, `si-aim-packing-shipping`.

**What can affect it**

- Missing source is not rejected by a row-count check.
- Zero source quantities can cause division by zero.
- Container parent output is assigned only in the optional parent branch.

**What you can check**

- Missing source is not rejected by a row-count check.
- Zero source quantities can cause division by zero.
- Container parent output is assigned only in the optional parent branch.

**Expected results and limits**

- A bounded split storage operation whose safe composition depends on caller validation.
- No routine was executed; these are source-observed boundaries, not an operational incident or a proposed production change.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`si-sql-1857754021`: [dbo.SHP_SplitAllocRequest](sql/1857754021.sql); source-definition SHA-256 `ee2756601d5c6200db2a1782b7dd1fd04289eb269c4f21e39317eab04ef783ab`, reading-copy SHA-256 `0e489448cc68859b587f4b6a0b6dd99567545f4d919ef8039d6badbd91f7548c`, one-based inclusive lines [[1, 248]].

`si-sql-1873754078`: [dbo.SHP_SplitShippingContainer](sql/1873754078.sql); source-definition SHA-256 `c36346d5d5c9638356025fcb246c39c6f703f680f6d9f6f0d1b438361a7711c9`, reading-copy SHA-256 `e3edb38119c092ab33df1377dfb5aba89e6d62b525bffffd46b6f83906129826`, one-based inclusive lines [[1, 468]].

`si-aim-packing-shipping`: [Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md); AIM article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`, original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`, nodes n65.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Is qty greater than source rejected immediately? Expected: No complete upper-bound guard exists; one update may be skipped while another proceeds. Must not claim: Oversized requests safely fail before changes.
- Which allocation row retains the requested quantity? Expected: The original allocation request retains qty; clone is reduced to remainder. Must not claim: The clone always receives requested qty.
- Can I assume newParentContNum is reset when no parent was created? Expected: It is not assigned in the skipped parent branch. Must not claim: All outputs are cleared on every path.

## 87. Understanding deallocation output mode and history

**Question:** Is deallocation outputMode=1 a read-only preview?

**What it does.** No. Both direction branches update inventory first. outputMode=1 returns captured before-state and allocation information and skips history; other modes write calculated history. The procedure sets XACT_ABORT and rethrows errors but begins no transaction.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Select requests through the OR of nonzero wave and shipment selectors. Evidence: `si-sql-1777753736`, `si-aim-packing-shipping`.
2. Deduct source allocated quantity or destination in-transit quantity and capture before/after inventory. Evidence: `si-sql-1777753736`, `si-aim-packing-shipping`.
3. Choose output rows without history for mode 1, or insert calculated per-shipment history for other modes. Evidence: `si-sql-1777753736`, `si-aim-packing-shipping`.

**What can affect it**

- Both zero selectors select nothing; two supplied nonzero selectors broaden selection by OR.
- Source matching includes logistics unit/attribute identity; destination matching does not.
- History expiry/status calculations do not update those fields in inventory.

**What you can check**

- Both zero selectors select nothing; two supplied nonzero selectors broaden selection by OR.
- Source matching includes logistics unit/attribute identity; destination matching does not.
- History expiry/status calculations do not update those fields in inventory.

**Expected results and limits**

- Inventory mutation plus either output rows or history insertion.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`si-sql-1777753736`: [dbo.SHP_ProcessShipmentDeallocationAndHistory](sql/1777753736.sql); source-definition SHA-256 `865388ce418d98c0d9b4b18f3df6afb06012fd545bbe17bea9ae4db6b4b627ae`, reading-copy SHA-256 `f18280d27aa4363baa8792339597984ae1343cedc6ddd5def504a91b42377b99`, one-based inclusive lines [[1, 519]].

`si-aim-packing-shipping`: [Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md); AIM article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`, original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`, nodes n65.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Can outputMode=1 be used as a harmless preview? Expected: The inventory UPDATE occurs before the result rows. Must not claim: Mode 1 is read-only.
- Does XACT_ABORT create an atomic inventory/history transaction? Expected: The body has no BEGIN TRAN; caller transaction ownership is separate. Must not claim: XACT_ABORT alone makes the whole body atomic.
- Are source and destination identity matches identical? Expected: Destination omits logistics-unit and attribute identity comparisons used by source. Must not claim: Both branches match the same full identity.

## 88. Understanding header freight rollups

**Question:** Why can recalculated shipment freight be NULL?

**What it does.** The routine sums four stored charge fields from selected manifest-state containers with a text parent-container test, then replaces header values. SQL SUM can return NULL when no eligible amounts exist; the body does not turn that into zero.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Select shipment containers by captured manifest states and parent-text-ID rule. Evidence: `si-sql-1905754192`, `si-aim-carrier-management`.
2. Sum total/base freight, discount and accessorial amount. Evidence: `si-sql-1905754192`, `si-aim-carrier-management`.
3. Replace header amounts with the aggregate variables. Evidence: `si-sql-1905754192`, `si-aim-carrier-management`.

**What can affect it**

- Parent selection uses PARENT_CONTAINER_ID text, not tree root metadata.
- Manifest state constants are source predicates; active state distribution was not queried.

**What you can check**

- Parent selection uses PARENT_CONTAINER_ID text, not tree root metadata.
- Manifest state constants are source predicates; active state distribution was not queried.

**Expected results and limits**

- Header amounts reflect selected stored container sums, not a new carrier rating.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`si-sql-1905754192`: [dbo.SHP_UpdateFreightCharges](sql/1905754192.sql); source-definition SHA-256 `9e0c91de8aeca9682ff71a9df755c3654ae87e2a8be4e5dbace123dc15ef044b`, reading-copy SHA-256 `17648d4f5b20ea5082715abc277f935363d4a0e5b5519cde942d638329337884`, one-based inclusive lines [[1, 48]].

`si-aim-carrier-management`: [Carrier Management Process Summary: Functionality](../AIM/reading/0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4.md); AIM article `0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4`, original SHA-256 `6cae75f2a3d61f172808f8acc5a96ad0bc3875fc54c44c6a26bfe7d8b8ae2bd2`, nodes n65, n67, n69, n71, n73, n75.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does no eligible container yield zero freight? Expected: SUM yields NULL unless non-NULL amounts contribute. Must not claim: Zero is forced.
- Does this call a carrier to rate the shipment? Expected: It aggregates stored container charge columns. Must not claim: It obtains current carrier rates.
- Does it select only TREE_UNIT roots? Expected: It uses a text parent-ID condition, not TREE_UNIT. Must not claim: The filter is a tree-root test.

## 89. Understanding interface configuration retrieval

**Question:** Do interface configuration getters execute configured steps in order?

**What it does.** The getters retrieve map headers/details, interface headers/details and flow-step rows. Only the detail-by-header getter explicitly orders by SEQUENCE. Flow-step retrieval does not execute a step and does not specify step order.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Choose the correct key, record type, direction and mode for the requested getter. Evidence: `si-sql-871322514`, `si-sql-887322571`, `si-sql-903322628`, `si-sql-919322685`, `si-sql-935322742`, `si-sql-1182275617`, `si-sql-1198275674`, `si-sql-1214275731`, `si-sql-1230275788`, `si-sql-1246275845`, `si-aim-interface`.
2. Apply exact predicates or the prefix LIKE pattern. Evidence: `si-sql-871322514`, `si-sql-887322571`, `si-sql-903322628`, `si-sql-919322685`, `si-sql-935322742`, `si-sql-1182275617`, `si-sql-1198275674`, `si-sql-1214275731`, `si-sql-1230275788`, `si-sql-1246275845`, `si-aim-interface`.
3. Let a separately evidenced executor determine enabled steps, execution order and transport behavior. Evidence: `si-sql-871322514`, `si-sql-887322571`, `si-sql-903322628`, `si-sql-919322685`, `si-sql-935322742`, `si-sql-1182275617`, `si-sql-1198275674`, `si-sql-1214275731`, `si-sql-1230275788`, `si-sql-1246275845`, `si-aim-interface`.

**What can affect it**

- Map prefix is not escaped as literal text.
- No ACTIVE predicate appears in the reviewed interface-detail getters.
- Map-header Mode uses numeric(9) in one variant and numeric(1) in another.

**What you can check**

- Map prefix is not escaped as literal text.
- No ACTIVE predicate appears in the reviewed interface-detail getters.
- Map-header Mode uses numeric(9) in one variant and numeric(1) in another.

**Expected results and limits**

- Configuration rows only; effective settings and execution are separate.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`si-sql-871322514`: [dbo.wm_RInterfaceDataMapDetail01](sql/871322514.sql); source-definition SHA-256 `ac9607853740607df086e599fac65447795212b106159d0a18b5e0f61274a10a`, reading-copy SHA-256 `7feecf695100e21289ea3a05dbd378c856b180402358014ffa72ed0b7eb6af0e`, one-based inclusive lines [[1, 12]].

`si-sql-887322571`: [dbo.wm_RInterfaceDataMapDetail02](sql/887322571.sql); source-definition SHA-256 `633dc34889acda952489c732af1d06ac0bc23a8c5bd596da913a820a0b52d0b5`, reading-copy SHA-256 `52cc1fb305bb0ed9412cb5affb8b657e24e356108e7558667fc04de5e9260b0e`, one-based inclusive lines [[1, 12]].

`si-sql-903322628`: [dbo.wm_RInterfaceDetail01](sql/903322628.sql); source-definition SHA-256 `811d9deaa475938263005e45de98807f9348c5f5e15c227fe449c23416e9ff8e`, reading-copy SHA-256 `2c83d9a01901ac499646c80fdc3d60f52402c5a29f28991f9a784e607701851a`, one-based inclusive lines [[1, 12]].

`si-sql-919322685`: [dbo.wm_RInterfaceDetail02](sql/919322685.sql); source-definition SHA-256 `f173ef99c2d116c2299303bf53204a4dbf38d712993f5c716615c94dd28ec7f4`, reading-copy SHA-256 `d6bff57f6b1e9bd37aed4a2dd7072293eed89b643bb812e1dc80be050abe8a7a`, one-based inclusive lines [[1, 13]].

`si-sql-935322742`: [dbo.wm_RInterfaceHeader01](sql/935322742.sql); source-definition SHA-256 `c80cd8228f13cc2bebeae413a75d36088bcd83d5d2b96ccfea3bd87a0f9ca5e7`, reading-copy SHA-256 `a7c3cfd49faf763393e025e97ec9222db71f7d3476b73517f2870bf23dd24cf9`, one-based inclusive lines [[1, 12]].

`si-sql-1182275617`: [dbo.wm_RInterfaceDataMapHeader01](sql/1182275617.sql); source-definition SHA-256 `f928bedbb5fb2035168888aad1e0621685128b0ba5df4ab2144aed82fe705dff`, reading-copy SHA-256 `7157fbb2a0fba75e51b61e0c42d1fa612fb75e4ae73a58a3a2994dfd877d36aa`, one-based inclusive lines [[1, 22]].

`si-sql-1198275674`: [dbo.wm_RInterfaceDataMapHeader02](sql/1198275674.sql); source-definition SHA-256 `8e45622ac93645d73b6bca1e0ffc79695001bfce6302dd3fe692d15396cd6fe6`, reading-copy SHA-256 `c83e8005093e7606aff73042124c80918a8198513c6d4a5c3f98c63d6d188acd`, one-based inclusive lines [[1, 18]].

`si-sql-1214275731`: [dbo.wm_RInterfaceDataMapHeader03](sql/1214275731.sql); source-definition SHA-256 `711c004a5a8971f79093535b78868565b6260324cd84437301740610d6d3e203`, reading-copy SHA-256 `eb57366cb84b50f833260575894a897904dfe54f85e19f42547b95049ec37171`, one-based inclusive lines [[1, 16]].

`si-sql-1230275788`: [dbo.wm_RInterfaceFlowStep01](sql/1230275788.sql); source-definition SHA-256 `a3a5002bf73af21acc097ecef00abe171d5ed361ab216240c248797fda093685`, reading-copy SHA-256 `a03bfa912d2b97f9161b1c6209ce9eb45d85779975f02775330544c5d63e8373`, one-based inclusive lines [[1, 18]].

`si-sql-1246275845`: [dbo.wm_RInterfaceFlowStep02](sql/1246275845.sql); source-definition SHA-256 `441ed813df8539c1004079d3db2289dce72488c037bf2c43cadce494b1359627`, reading-copy SHA-256 `b0d0348a515a8486e349f63d1d66e325f9c90f9fb4e1b9d3eec46794bab05e4a`, one-based inclusive lines [[1, 18]].

`si-aim-interface`: [Interface Process Summary: Functionality](../AIM/reading/178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e.md); AIM article `178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e`, original SHA-256 `16a5da0368ba8d3c53860134e3270982414a29c92ad4c62f1c13da24e4067a7c`, nodes n66, n68.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Are flow-step rows ordered by SEQUENCE? Expected: Neither reviewed flow-step getter has ORDER BY. Must not claim: The returned order is guaranteed.
- Does prefix percent mean a literal percent? Expected: Prefix participates in LIKE and is not escaped. Must not claim: All prefix characters are literal.
- Does retrieving interface detail prove it is active? Expected: The getters do not filter ACTIVE. Must not claim: Only active definitions can be returned.

## 90. Understanding upload claims and serial staging

**Question:** Does claiming an upload batch prove exclusive processing or successful delivery?

**What it does.** The batch routine updates header and linked child staging conditions and process stamps. Its claim branch can restamp rows already In Process, and downstream child scope follows the batch stamp. The serial helper inserts selected payload rows without an explicit rerun deduplication check.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Claim matching-detail non-Processed headers or advance matching-detail In Process headers. Evidence: `si-sql-410796871`, `si-sql-654273736`, `si-aim-interface`.
2. Update linked child records using batch-stamped parent/link selections. Evidence: `si-sql-410796871`, `si-sql-654273736`, `si-aim-interface`.
3. Create selected serial payload rows; rely on separately evidenced transport/acknowledgment for delivery completion. Evidence: `si-sql-410796871`, `si-sql-654273736`, `si-aim-interface`.

**What can affect it**

- BatchId reuse can broaden child selection.
- NULL interface conditions fail equality/inequality filters.
- Claim result uses unordered TOP 1; later result returns all batch-stamped headers.

**What you can check**

- BatchId reuse can broaden child selection.
- NULL interface conditions fail equality/inequality filters.
- Claim result uses unordered TOP 1; later result returns all batch-stamped headers.

**Expected results and limits**

- Staging-state and payload changes only.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`si-sql-410796871`: [dbo.wm_RUUploadOrderHeader01](sql/410796871.sql); source-definition SHA-256 `3876d48607c73128008c4c4cffc66ee145227e3f86e869c50e71898eb377fa9e`, reading-copy SHA-256 `490d5acf6415262167580113676971da683b26cc405a8b3b089850dde2a6dab6`, one-based inclusive lines [[1, 102]].

`si-sql-654273736`: [dbo.wm_InsertUploadSerialNumber](sql/654273736.sql); source-definition SHA-256 `8392967ca80eddb5aa46cffdda9e918cac45181532cad45c98a854b8e7bf3b51`, reading-copy SHA-256 `0e224f17a85d54d8b5ae0c563252504373ce11edfbd0d46796d98e5decf9f4da`, one-based inclusive lines [[1, 50]].

`si-aim-interface`: [Interface Process Summary: Functionality](../AIM/reading/178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e.md); AIM article `178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e`, original SHA-256 `16a5da0368ba8d3c53860134e3270982414a29c92ad4c62f1c13da24e4067a7c`, nodes n66, n68.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does In Process prevent a second claimant? Expected: Claim excludes Processed, not already In Process; no atomic claim protocol is shown. Must not claim: Exclusive ownership is guaranteed.
- Are all child updates limited to InterfaceDtlKey? Expected: Child selections use batch-stamped linked parents without repeating that key. Must not claim: The detail key is applied to every child scope.
- Will the serial helper skip records from a previous run? Expected: There is no anti-join against existing uploads. Must not claim: Reruns are deduplicated.

## 91. Understanding interface cleanup differences

**Question:** Are similarly named cleanup procedures interchangeable?

**What it does.** No. Order cleanup 01 restricts Processed rows and includes VAS activity; cleanup 02 ignores condition and omits VAS. Receipt cleanup deletes seven table sets by stamp with one appointment link-type filter. Upload cleanup deletes linked details and headers only.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Identify the exact routine and its stamp, condition and link predicates. Evidence: `si-sql-231320234`, `si-sql-247320291`, `si-sql-263320348`, `si-sql-446272995`, `si-sql-375320747`, `si-aim-interface`.
2. Follow the observed DELETE order and direct row-count behavior. Evidence: `si-sql-231320234`, `si-sql-247320291`, `si-sql-263320348`, `si-sql-446272995`, `si-sql-375320747`, `si-aim-interface`.
3. Coordinate caller transaction, constraints and any omitted dependent cleanup before operational use. Evidence: `si-sql-231320234`, `si-sql-247320291`, `si-sql-263320348`, `si-sql-446272995`, `si-sql-375320747`, `si-aim-interface`.

**What can affect it**

- No reviewed cleanup checks transport acknowledgment.
- Receipt cleanup deletes purchase-order header before detail.
- Upload child selection follows header link IDs, not child stamp.

**What you can check**

- No reviewed cleanup checks transport acknowledgment.
- Receipt cleanup deletes purchase-order header before detail.
- Upload child selection follows header link IDs, not child stamp.

**Expected results and limits**

- Only named staging rows are removed; this documentation executes no cleanup.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`si-sql-231320234`: [dbo.wm_DDownloadItem01](sql/231320234.sql); source-definition SHA-256 `6787be2194c61c7b821864ef1f006bbaf335dca1fe8c87740fb309c9423dd063`, reading-copy SHA-256 `c6785318233e09f12e30ef699ffa064e079bfda63c097ab8f45d27af24abfaf8`, one-based inclusive lines [[1, 15]].

`si-sql-247320291`: [dbo.wm_DDownloadOrderHeader01](sql/247320291.sql); source-definition SHA-256 `acda811f23be5b381cea02842a6c22da618ad66664fb622b26b166ed708367f1`, reading-copy SHA-256 `936705d417b9f7329c7a38597cc3059f1a7e9990e308f36e77ebfb878de53f52`, one-based inclusive lines [[1, 41]].

`si-sql-263320348`: [dbo.wm_DDownloadOrderHeader02](sql/263320348.sql); source-definition SHA-256 `aa139d7a62107feacc06198fb792f211f5b2e914693f8c106a24b68010f2e901`, reading-copy SHA-256 `96e48c7169c12896af4f1ab1acad73d85781aa29d80d69b772081f856a114fc5`, one-based inclusive lines [[1, 31]].

`si-sql-446272995`: [dbo.wm_DDownloadReceiptHeader01](sql/446272995.sql); source-definition SHA-256 `b78f2b8348ba772fde150a5b014da1bba3b449bbf27d8e89232d686d906f49af`, reading-copy SHA-256 `818454460b0aea692d6b197b6ab6d19ecb7555bbc47194cfbb56ffcc9b20dc06`, one-based inclusive lines [[1, 48]].

`si-sql-375320747`: [dbo.wm_DUploadOrderHeader01](sql/375320747.sql); source-definition SHA-256 `0967dfbd38bff6b2c24173d06e25db6cd59156fc067d8a6475ecf7a67dd2c8e8`, reading-copy SHA-256 `865eb26fda32bbacc7196b0ec7899277df36b51ed5f4b7583787a29761006fc4`, one-based inclusive lines [[1, 12]].

`si-aim-interface`: [Interface Process Summary: Functionality](../AIM/reading/178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e.md); AIM article `178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e`, original SHA-256 `16a5da0368ba8d3c53860134e3270982414a29c92ad4c62f1c13da24e4067a7c`, nodes n66, n68.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does order cleanup 02 delete VAS rows? Expected: Its body contains no VAS DELETE. Must not claim: It covers the same five tables as 01.
- Does receipt cleanup retain unprocessed rows? Expected: No Processed condition is present. Must not claim: Only processed rows can be deleted.
- Does upload cleanup remove serials/comments/containers too? Expected: It explicitly deletes linked details and headers only. Must not claim: It removes the entire upload tree.

## 92. Understanding interface error and retained-data views

**Question:** Does an interface view prove delivery success or current error state?

**What it does.** The error view projects stored error fields; the detail pane selects one stored error. Three upload views combine current and retained tables with UNION distinct over selected columns. None performs delivery, retry, archive movement or freshness checks.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Use source identity and query predicates to distinguish error details from current/retained upload projections. Evidence: `si-sql-1008058677`, `si-sql-1112703362`, `si-sql-76579361`, `si-sql-92579418`, `si-sql-108579475`, `si-aim-interface`.
2. Account for UNION removing duplicate projected rows and the absence of source precedence. Evidence: `si-sql-1008058677`, `si-sql-1112703362`, `si-sql-76579361`, `si-sql-92579418`, `si-sql-108579475`, `si-aim-interface`.
3. Require independent current processing and delivery evidence. Evidence: `si-sql-1008058677`, `si-sql-1112703362`, `si-sql-76579361`, `si-sql-92579418`, `si-sql-108579475`, `si-aim-interface`.

**What can affect it**

- Views have no built-in warehouse/company/process-stamp or age filter.
- Omitted processing columns may distinguish source rows that collapse in the projection.

**What you can check**

- Views have no built-in warehouse/company/process-stamp or age filter.
- Omitted processing columns may distinguish source rows that collapse in the projection.

**Expected results and limits**

- Read-model rows, not a processing outcome.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`si-sql-1008058677`: [dbo.INTERFACE_ERROR_VIEW](sql/1008058677.sql); source-definition SHA-256 `7fe87cf6cc30090995bc9698ba995a8f36db3e92c260d7ec5a072d605df4b796`, reading-copy SHA-256 `fd3d58614f44b8a4eb119d4d1a9cd658e014fdd1218e58bb57a0fd9dfacf4084`, one-based inclusive lines [[1, 55]].

`si-sql-1112703362`: [dbo.INT_ErrorInsightDetailPaneData](sql/1112703362.sql); source-definition SHA-256 `1c009799b0bed787caa23dfa58c0f46fa89c1395da34bf0e638f13e9769772ce`, reading-copy SHA-256 `8a5d30ac4125a5bed42f645adcd7cea0ca399bf77b0eedca9499dd93110d12d6`, one-based inclusive lines [[1, 21]].

`si-sql-76579361`: [dbo.UPLOAD_ORDER_CONTAINER_VIEW](sql/76579361.sql); source-definition SHA-256 `e0950a014a1ea20f353ea4fe6d7b96f03bfa9153bc38b6f29d9fd105ff5fe466`, reading-copy SHA-256 `a1185d228ad5ac6848a4b311b6abd89098df531c9b5c1569a7a079641c4c8d1e`, one-based inclusive lines [[1, 14]].

`si-sql-92579418`: [dbo.UPLOAD_ORDER_DETAIL_VIEW](sql/92579418.sql); source-definition SHA-256 `645d9edd663071d91cd1fb0a2d604b888806d159a9cf78ed7cd557194806b3a6`, reading-copy SHA-256 `0c42d30f7d227cb91ce22583fb7af6006b03892ca5d4c01ba0b830470e214470`, one-based inclusive lines [[1, 12]].

`si-sql-108579475`: [dbo.UPLOAD_ORDER_HEADER_VIEW](sql/108579475.sql); source-definition SHA-256 `e1f54a42b23b4374757679fe61d6b1d84e4e7594bf5106e36e3cce1bc9ad8063`, reading-copy SHA-256 `384be9c6177aaedf538839b7d6e957496d4d99a7334b94717390ddb634036f45`, one-based inclusive lines [[1, 14]].

`si-aim-interface`: [Interface Process Summary: Functionality](../AIM/reading/178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e.md); AIM article `178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e`, original SHA-256 `16a5da0368ba8d3c53860134e3270982414a29c92ad4c62f1c13da24e4067a7c`, nodes n66, n68.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does UNION preserve every physical source row? Expected: UNION removes duplicate projected rows. Must not claim: It behaves like UNION ALL.
- Does the error view send notifications? Expected: It projects EMAIL_SENT and other stored fields only. Must not claim: It sends error email.
- Is a retained-view row proof the latest upload succeeded? Expected: No condition or freshness check establishes delivery. Must not claim: It verifies successful current delivery.

## 93. Security helper precedence

**Question:** Do these security helpers all apply the same permission fallback?

**What it does.** No. fn_GetSecurityValues chooses a whole User, Group, then System row. The per-form checkpoint function falls back only when no characters were produced and its group query omits a level filter. The all-form function makes fallback globally, so one user form can suppress defaults on other forms. SecurityPermissionEnabled instead reads Group, User, System by username and returns1 when no string exists.

**What happens**

Trigger: Caller evaluates the named SQL function; actual application binding and permission enforcement unverified.

1. Use the exact branch/default/output contract for this helper; similarly named helpers can differ. Evidence: `fn-batch-712701937`, `fn-batch-1537752881`, `fn-batch-1553752938`, `fn-batch-1569752995`.

**What can affect it**

- Form/user/group metadata and literal checkpoint Y; each function has its own lookup predicates.

**What you can check**

- Form/user/group metadata and literal checkpoint Y; each function has its own lookup predicates.

**Expected results and limits**

- The scalar or returned table described by the cited contracts. No persistent state change.
- No actual authentication, policy enforcement or reproduced bypass is claimed.
- Static function semantics only; no operational rows, archive content or function execution.

**More detail and sources**

`fn-batch-712701937`: [dbo.fn_GetSecurityValues](sql/712701937.sql); source-definition SHA-256 `22b109a4c5e256958164ca72301276d2b4c370c3428067a0d64afc343a9747ae`, reading-copy SHA-256 `d8f5363c8994a7584c0cfaa919e45fb316f63afb072e9f860a5ce897a71d9c3a`, one-based inclusive lines [[1, 25]].

`fn-batch-1537752881`: [dbo.SECfn_GetSecurityCheckPoint](sql/1537752881.sql); source-definition SHA-256 `38d14d4aeea90769186caccc3cb3c89dfed0ce8a29f18dea5fe3fc3befdd4f0d`, reading-copy SHA-256 `c4a7601977699c27104c3efe8fe21655ce4427a3e25ca945c2c830b78f1e2a05`, one-based inclusive lines [[1, 90]].

`fn-batch-1553752938`: [dbo.SECfn_GetSecurityCheckPointByUsername](sql/1553752938.sql); source-definition SHA-256 `8db1ca3222c47321dd84b941840093b4f67a2c64ff6a425f2536481484f646f9`, reading-copy SHA-256 `64451910e2e609e8ed1bbc80c24f84935405925d849d4c2165e3573299216bb0`, one-based inclusive lines [[1, 83]].

`fn-batch-1569752995`: [dbo.SecurityPermissionEnabled](sql/1569752995.sql); source-definition SHA-256 `d278b6d565114eee28d3c306f626b984abe0a930a4324f8d34a47f5d67b8792c`, reading-copy SHA-256 `3cd8783e1bf1f78e777d09764a9d7d0cb6f8a169a07198898e86c81b660b0e5e`, one-based inclusive lines [[1, 59]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does missing permission data always deny? Expected: SecurityPermissionEnabled returns1 on missing string; other helpers can returnNULL/empty. Must not claim: Universal deny default.
- Does all-form fallback fill every missing form? Expected: Fallback decision is global across produced rows. Must not claim: Per-form merged defaults.
- Can empty checkpoint list return1? Expected: Loop is skipped and initial1 survives. Must not claim: Every requested operation was validated.

## 94. Work zone predicate

**Question:** Does a positive zone-helper result authorize an employee to execute work?

**What it does.** It only tests profile/zone association. A NULL zone returns1 even for a missing profile. It does not authenticate a user or check warehouse access, selected instruction eligibility or the operation being requested.

**What happens**

Trigger: Caller evaluates the named SQL function; actual application binding and permission enforcement unverified.

1. Use the exact branch/default/output contract for this helper; similarly named helpers can differ. Evidence: `fn-batch-1784705756`.

**What can affect it**

- WORK_PROFILE_ZONE_AUTH and supplied profile/zone.

**What you can check**

- WORK_PROFILE_ZONE_AUTH and supplied profile/zone.

**Expected results and limits**

- The scalar or returned table described by the cited contracts. No persistent state change.
- Caller enforcement remains external.
- Static function semantics only; no operational rows, archive content or function execution.

**More detail and sources**

`fn-batch-1784705756`: [dbo.IsWorkZoneAuthorized](sql/1784705756.sql); source-definition SHA-256 `bdf68f05968a32ef681c513dcd37c83f664eff76590d4f3871cd4fdb086cef21`, reading-copy SHA-256 `035a9a8e5ff73606a157d9281f451844957ddf369ea10440a3f7e84534843279`, one-based inclusive lines [[1, 35]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What does NULL zone return? Expected: 1 before profile lookup. Must not claim: NULL zone denied.
- Does this check warehouse access? Expected: No warehouse/user access tables are read. Must not claim: End-to-end work authorization.

## 95. Status-slot helpers

**Question:** Does leading status mean the maximum numeric status?

**What it does.** These slot helpers use position order. One returns the count before the first zero; another stops at zero or994+, returning the previous slot. Equality helpers return the first matching slot or its quantity, without summing duplicate statuses. None sorts the inputs or validates a status transition.

**What happens**

Trigger: Caller evaluates the named SQL function; actual application binding and permission enforcement unverified.

1. Use the exact branch/default/output contract for this helper; similarly named helpers can differ. Evidence: `fn-batch-87319721`, `fn-batch-103319778`, `fn-batch-119319835`, `fn-batch-1489752710`.

**What can affect it**

- Supplied ten status/quantity slots; declared defaults require appropriate function DEFAULT syntax.

**What you can check**

- Supplied ten status/quantity slots; declared defaults require appropriate function DEFAULT syntax.

**Expected results and limits**

- The scalar or returned table described by the cited contracts. No persistent state change.
- Slot ordering is a caller invariant, not established by helper name.
- Static function semantics only; no operational rows, archive content or function execution.

**More detail and sources**

`fn-batch-87319721`: [dbo.SDBfn_GetLeadingStsPos](sql/87319721.sql); source-definition SHA-256 `afc65f7aca0986bc2d0cce7c4027480bfddd8c5374d00e8f78b0c836d9763485`, reading-copy SHA-256 `75e24dc32c022b49e9ae1ef8259d6a4d7d20e7a212ea0bd93e502da409a3ff2a`, one-based inclusive lines [[1, 53]].

`fn-batch-103319778`: [dbo.SDBfn_GetPosOfSts](sql/103319778.sql); source-definition SHA-256 `7b5320a480b25dfafc3fca4f9215dfd2a3bc4b92abe58fec21f6e581641fb574`, reading-copy SHA-256 `a4febbe1bba3d81e14f75bba057704a27156923f7567c51ba6d3f7db929eb747`, one-based inclusive lines [[1, 54]].

`fn-batch-119319835`: [dbo.SDBfn_GetQtyAtSts](sql/119319835.sql); source-definition SHA-256 `88219b7cc4ed1a4e8a07c29b8e74c7d21a8b5fa8a47e02f116768f9731b3a9a3`, reading-copy SHA-256 `cec4f35d23749ea41dedc0b5bde42cb091103e5ace76558bfdb19ac3c53c9af1`, one-based inclusive lines [[1, 65]].

`fn-batch-1489752710`: [dbo.SDBfn_GetLeadingStsInRange](sql/1489752710.sql); source-definition SHA-256 `a86ef1de164c8b461f9662614540f44abae6f0a0ca8d65d011fc44c4ab7520fe`, reading-copy SHA-256 `d983babb35bd0186e33e7bd52de87bb136df6fa7c95f0e69dd67fe6ff180efbe`, one-based inclusive lines [[1, 64]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Are duplicate status quantities summed? Expected: Only first matching quantity returned. Must not claim: All matching quantity total.
- Is NULL same as default zero? Expected: ExplicitNULL comparisons are unknown; declared default is separate. Must not claim: NULL is always replaced by0.

## 96. Status flow lookup

**Question:** Does a missing custom flow fall back to the default?

**What it does.** No. Any non-NULL flow name uses custom-flow detail and can returnNULL when no adjacent status exists. Only NULL flow name selects the default functional-area flow. Direction0 goes backward; other values includingNULL go forward. Name/number helpers simply look up mappings.

**What happens**

Trigger: Caller evaluates the named SQL function; actual application binding and permission enforcement unverified.

1. Use the exact branch/default/output contract for this helper; similarly named helpers can differ. Evidence: `fn-batch-199320120`, `fn-batch-2097754876`, `fn-batch-2129754990`, `fn-batch-1165247206`, `fn-batch-1149247149`.

**What can affect it**

- Custom/default configuration versus fixed text dictionaries are distinct sources.

**What you can check**

- Custom/default configuration versus fixed text dictionaries are distinct sources.

**Expected results and limits**

- The scalar or returned table described by the cited contracts. No persistent state change.
- No allowed-action validation or current deployment code meaning proved.
- Static function semantics only; no operational rows, archive content or function execution.

**More detail and sources**

`fn-batch-199320120`: [dbo.STSfn_RtrvSts](sql/199320120.sql); source-definition SHA-256 `35f5e751c799263ef2f7cf8051726000ec17cabf4d2220568f721020b92d2eca`, reading-copy SHA-256 `798df960ce7117d9a12671aa5b4862e86d1a4ffb5dc0f4ac4101d756def6a97e`, one-based inclusive lines [[1, 32]].

`fn-batch-2097754876`: [dbo.STSfn_RtrvAdjacentSts](sql/2097754876.sql); source-definition SHA-256 `a680fd4a640ac0e3369654f225eed7effb75ed0bbb3da182baedc833ee67ebf8`, reading-copy SHA-256 `37c643687b36d5dd0a7c222b996c4821e3723e0ee9c355e2a2eaf348f4e0b4b5`, one-based inclusive lines [[1, 80]].

`fn-batch-2129754990`: [dbo.STSfn_RtrvStsName](sql/2129754990.sql); source-definition SHA-256 `34396254e9d462224b9c832dcb07bd2dd75c8e04ade87b67e70d0c7f6a906fa3`, reading-copy SHA-256 `506d9632b31e9f2c080c0534f30d3ccac129455bfe0b613fba0995904d4123f4`, one-based inclusive lines [[1, 24]].

`fn-batch-1165247206`: [dbo.ILSStatusToText](sql/1165247206.sql); source-definition SHA-256 `ef97d9cf81e90c958da1ee40d44db209e1dfb62b9aeb9cb021c379fb8f5d477b`, reading-copy SHA-256 `c34079d4edd4433a65aa59bb8bcee7e069ce82f61949392a05117e9ad81eba2c`, one-based inclusive lines [[1, 41]].

`fn-batch-1149247149`: [dbo.ILSTransactionTypeToText_fn](sql/1149247149.sql); source-definition SHA-256 `3cfdc175880a2c18650309ac12634c2f3e5bfe6dd7b6de7f5efe4c554e77de5e`, reading-copy SHA-256 `891f9ea679937163cfc8107e227a64b4ca98d03a75fbbbbdd22864e194227743`, one-based inclusive lines [[1, 73]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does empty flow name use default? Expected: Empty is non-NULL and selects custom query. Must not claim: Default fallback.
- What do unknown fixed-dictionary codes return? Expected: Numeric text, withNULL propagating. Must not claim: Unknown codes are rejected or localized.

## 97. Timezone and week helpers

**Question:** Do all warehouse time helpers use the supplied warehouse?

**What it does.** No. SCI_DST_CONVERT ignores its warehouse input and uses the email-matched user default warehouse. SCI_DST_CONVERT_WHSE treats its whse input directly as a timezone name. GetWarehouseDate returns a local date. Week helpers convert to warehouse time only when the date input isNULL, and their boundaries depend on DATEFIRST.

**What happens**

Trigger: Caller evaluates the named SQL function; actual application binding and permission enforcement unverified.

1. Use the exact branch/default/output contract for this helper; similarly named helpers can differ. Evidence: `fn-batch-984702906`, `fn-batch-1185751627`, `fn-batch-1201751684`, `fn-batch-1628181196`, `fn-batch-1644181253`.

**What can affect it**

- Warehouse TIME_ZONE, user email/default warehouse, session DATEFIRST and supplied timestamp convention.

**What you can check**

- Warehouse TIME_ZONE, user email/default warehouse, session DATEFIRST and supplied timestamp convention.

**Expected results and limits**

- The scalar or returned table described by the cited contracts. No persistent state change.
- No current timezone setting or DST execution observed.
- Static function semantics only; no operational rows, archive content or function execution.

**More detail and sources**

`fn-batch-984702906`: [dbo.GetWarehouseDate](sql/984702906.sql); source-definition SHA-256 `391a708682dc02899dcb31e53b122d2d7f9bdca98c0916f61ecfca5531282e85`, reading-copy SHA-256 `66af5d2ba92e0faa690d5638b023e1b44f8452846715eeab3964a2e06752e9f3`, one-based inclusive lines [[1, 21]].

`fn-batch-1185751627`: [dbo.SCI_DST_CONVERT](sql/1185751627.sql); source-definition SHA-256 `c6445858ffd6f48208975ffb8fda4416990fb9aec0ce6d5501c57dfbca1476ba`, reading-copy SHA-256 `f6a3eff734ab05e0a1902be18072c6dd12349a55ddc460c5d735bcb75a504041`, one-based inclusive lines [[1, 27]].

`fn-batch-1201751684`: [dbo.SCI_DST_CONVERT_WHSE](sql/1201751684.sql); source-definition SHA-256 `c8a2f1cad1e03c35b06cbc848a42f1c1cbc3b269bf6e4cf2e4fd4deeb1454d11`, reading-copy SHA-256 `4a9d907fcc88d07d9957fe9b24c53a23ac34f75e4fc63b9c5dd2d029f0f28d06`, one-based inclusive lines [[1, 29]].

`fn-batch-1628181196`: [dbo.DATEFn_GetWeekEndDate](sql/1628181196.sql); source-definition SHA-256 `10cb0bd397602b22ac1de255a299a6475f89fb62e46c94b5d8b6c9561588107d`, reading-copy SHA-256 `143df6dbfbcf9df86d23b63735fece17bd4ecd63d942fc582a588e149a7db9ff`, one-based inclusive lines [[1, 34]].

`fn-batch-1644181253`: [dbo.DATEFn_GetWeekStartDate](sql/1644181253.sql); source-definition SHA-256 `c8ed097a9c4ad69866b705f05a3c7d3fb41c307042948706426b80aca6f87062`, reading-copy SHA-256 `41ebc9e48b98ee047fbbcd9e63fbfadfc10090af68fcb1410188fe1195e4366c`, one-based inclusive lines [[1, 33]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does explicit date get converted by week helper? Expected: Explicit date bypasses warehouse conversion. Must not claim: Always warehouse-localized.
- Can a warehouse code be passed to SCI_DST_CONVERT_WHSE? Expected: It is used as timezone identifier directly. Must not claim: WAREHOUSE table maps it automatically.

## 98. Date-only and fractional-second transforms

**Question:** Does RoundToSec round up fractional seconds?

**What it does.** It subtracts the millisecond component. Other small helpers remove time through string conversion, return a time on SQL base date, or reconstruct a compact date string from fixed positions. Their result types and parsing/range boundaries differ.

**What happens**

Trigger: Caller evaluates the named SQL function; actual application binding and permission enforcement unverified.

1. Use the exact branch/default/output contract for this helper; similarly named helpers can differ. Evidence: `fn-batch-7319436`, `fn-batch-2122802970`, `fn-batch-2138803027`, `fn-batch-621245268`, `fn-batch-1421248118`.

**What can affect it**

- SQL date parsing/session conventions; DATEONLY returns narrower SMALLDATETIME.

**What you can check**

- SQL date parsing/session conventions; DATEONLY returns narrower SMALLDATETIME.

**Expected results and limits**

- The scalar or returned table described by the cited contracts. No persistent state change.
- No timezone transformation in these pure helpers.
- Static function semantics only; no operational rows, archive content or function execution.

**More detail and sources**

`fn-batch-7319436`: [dbo.DHfn_TransToSQLDate](sql/7319436.sql); source-definition SHA-256 `c7acd1f3957c68bfc203ab1cbf34cf1842bd22b11dfc20aee30cf98072d18d55`, reading-copy SHA-256 `9dee7afbcf89d8cda0ab222e67641f6ea22a646f2320caf4f409dcb0f65730b8`, one-based inclusive lines [[1, 31]].

`fn-batch-2122802970`: [dbo.DHfn_GetDateNoTime](sql/2122802970.sql); source-definition SHA-256 `737f5c78ca1304fa662bc0f28f84a78817b5fb06aed53ab365b0381251c5face`, reading-copy SHA-256 `c8728c790eadc21ad0f0e4ff6f72fe79b361bb053a10767bdee7f364ecded1d7`, one-based inclusive lines [[1, 20]].

`fn-batch-2138803027`: [dbo.DHfn_RoundToSec](sql/2138803027.sql); source-definition SHA-256 `2f890b85076da91d1599c6170a149f98904f42879e281b8a994535bfc8b7f42f`, reading-copy SHA-256 `ed6170e741eac969a82c4ff64e98f3fbdaccc9ee017cb5d5a0bfaf9802e0445c`, one-based inclusive lines [[1, 19]].

`fn-batch-621245268`: [dbo.TimeOnly](sql/621245268.sql); source-definition SHA-256 `95a41b07b2549186a3598be22d484e3cd89a4dc141592abc7184d99fc6926714`, reading-copy SHA-256 `b551352bc82aaa939f4b6c3134e53e2d406c7deba12117db928bc832f3c0b1fd`, one-based inclusive lines [[1, 9]].

`fn-batch-1421248118`: [dbo.DATEONLY](sql/1421248118.sql); source-definition SHA-256 `8ed9e947bcbd240db21f0641d8244a7c82ea564acf186a0c8d67cbbfd05aaac0`, reading-copy SHA-256 `133e151229b30fb8ab68fad63826f0a5cea5b48505c846f7a876772228c1df0b`, one-based inclusive lines [[1, 9]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does 900ms round to next second? Expected: Expression subtracts900ms. Must not claim: Nearest-second rounding.
- Does TimeOnly return the SQL time type? Expected: It returns datetime with base date. Must not claim: A time-typed value.

## 99. Resource and description fallback

**Question:** Why can missing translation return a key, empty text orNULL?

**What it does.** Resource lookup treats NULL/empty key as empty output, uses supplied or configured language, then custom/base/English text and finally the key. Message lookup has a different missing-language early return and missing-key marker. Generic translated description falls back to raw description only when the resource key isNULL, not whenever translation is missing.

**What happens**

Trigger: Caller evaluates the named SQL function; actual application binding and permission enforcement unverified.

1. Use the exact branch/default/output contract for this helper; similarly named helpers can differ. Evidence: `fn-batch-1089751285`, `fn-batch-1105751342`, `fn-batch-632701652`, `fn-batch-728701994`, `fn-batch-744702051`, `fn-batch-2088706839`.

**What can affect it**

- Language system config, custom/base resource records and generic SYS1VALUE.

**What you can check**

- Language system config, custom/base resource records and generic SYS1VALUE.

**Expected results and limits**

- The scalar or returned table described by the cited contracts. No persistent state change.
- No resource message content or current language read.
- Static function semantics only; no operational rows, archive content or function execution.

**More detail and sources**

`fn-batch-1089751285`: [dbo.RSCMfn_RtrvMsg](sql/1089751285.sql); source-definition SHA-256 `9a0f76e6d31142ac4462d2810bb660cfd13b029d83be4f5b32f7b0294763b612`, reading-copy SHA-256 `f146f8b0a419fda4a5f0592c24548c9b1cb2394cf5ac6a1899bd3885ba339288`, one-based inclusive lines [[1, 68]].

`fn-batch-1105751342`: [dbo.RSCMfn_RtrvResource](sql/1105751342.sql); source-definition SHA-256 `e36ed8e461c4e98a3fdf1b037ec4f4145a603dc6a3190f42079db1103680e949`, reading-copy SHA-256 `7c9d25958f7928d70de4fa85be0750c5061fdf8f1adce770b2bbda19071c55bc`, one-based inclusive lines [[1, 88]].

`fn-batch-632701652`: [dbo.DYNAMICCALLINGfn_RtrvDesc](sql/632701652.sql); source-definition SHA-256 `6b52fd3ce04820d87da9bc98996a44cf668d09a8474deebd8a24d2e8d299e30d`, reading-copy SHA-256 `4a3945ec8121fc483857a4d6b9ba9e53f88d3e5ae045bbd3ebe9f44773360798`, one-based inclusive lines [[1, 23]].

`fn-batch-728701994`: [dbo.GENCONFIGfn_RtrvDesc](sql/728701994.sql); source-definition SHA-256 `49e08a800de20112f9cdf77219920f318cf3de674e7d8bebb1e270b5cd566a93`, reading-copy SHA-256 `cf978b4558998c36dc2d801d7a55301474c000f04103acaf9e095f144899a2bc`, one-based inclusive lines [[1, 23]].

`fn-batch-744702051`: [dbo.GENCONFIGfn_RtrvTranslatedDesc](sql/744702051.sql); source-definition SHA-256 `4318d1bad662d4606d7b7192d34662cb8e9107d188c9fa9d728d89ba200e33ab`, reading-copy SHA-256 `1f3cae94eb8d23df5954411c1760ea511791c0338b9a1617f7c4fddd52864d19`, one-based inclusive lines [[1, 37]].

`fn-batch-2088706839`: [dbo.LABORCONFIGfn_RtrvDesc](sql/2088706839.sql); source-definition SHA-256 `a8760f9e5ba2e94b964b49964e816ae5bf2146ba37473d9f759028617b24cd40`, reading-copy SHA-256 `7a26922e22e0973ccecad3add524cc2bdbf5bfaf32252667e43f731b6f3ad4dd`, one-based inclusive lines [[1, 31]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does empty custom text allow base fallback? Expected: Empty non-NULL text is retained. Must not claim: All blank translations fall back.
- Does missing translation always use generic description? Expected: Only NULL resource-key branch reads raw description. Must not claim: Unconditional description fallback.

## 100. Available-quantity branch differences

**Question:** Does no inventory always yield available quantity zero?

**What it does.** No. SUM branches assignNULL when no rows match; the attribute-specific nonaggregate branch retains initial0 on no match and can choose one of several rows. The without-in-transit function also differs in parent logistics, lot and filter behavior, so it is not simply the first function minus transit stock.

**What happens**

Trigger: Caller evaluates the named SQL function; actual application binding and permission enforcement unverified.

1. Use the exact branch/default/output contract for this helper; similarly named helpers can differ. Evidence: `fn-batch-1672705357`, `fn-batch-1688705414`, `fn-batch-1640705243`.

**What can affect it**

- showAll/includeAttributes flags, location allocate-in-transit flag, identity and optional filters.

**What you can check**

- showAll/includeAttributes flags, location allocate-in-transit flag, identity and optional filters.

**Expected results and limits**

- The scalar or returned table described by the cited contracts. No persistent state change.
- Computed availability does not reserve inventory or clamp negative results.
- Static function semantics only; no operational rows, archive content or function execution.

**More detail and sources**

`fn-batch-1672705357`: [dbo.INVfn_GetAvailableQuantity](sql/1672705357.sql); source-definition SHA-256 `3cfeb39bf87e1d36c1516d7d150a8c85a3568fd20c167a87576117ecc5717943`, reading-copy SHA-256 `b24fb55c3b9ba7677438d86735943afbd54168d0e47a91906d3dbc664c44e086`, one-based inclusive lines [[1, 115]].

`fn-batch-1688705414`: [dbo.INVfn_GetAvailableQuantityWithoutInTransit](sql/1688705414.sql); source-definition SHA-256 `0dda45c21e00295cc58776454d12fab9db9d647a3cb2785c10b1e983811c40f1`, reading-copy SHA-256 `c20daeca1816f7e30d1ff931a1f0eec06ed8bd7eccf7b0ed85ca9308301326bf`, one-based inclusive lines [[1, 83]].

`fn-batch-1640705243`: [dbo.INVfn_AreInvAttributeValuesSame](sql/1640705243.sql); source-definition SHA-256 `8dd4d454c785319ebb8986929e860e007d07228e98c1de59b5b74525c2dbae19`, reading-copy SHA-256 `c67a204561da81005427972c7aea9318dbfc07b36ead546cdac42afd732842f7`, one-based inclusive lines [[1, 65]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Are all no-match outputs0? Expected: AggregateNULL differs from scalar initial0. Must not claim: Universal zero fallback.
- Is NULL lot always wildcard? Expected: Without-transit attribute branch additionally requires null-safe exact lot. Must not claim: Same lot semantics in every branch.

## 101. Unit conversion fallback

**Question:** Are UOM settings merged across item, class and location?

**What it does.** The retrieval functions generally stop at the first stage with rows, and the stages differ by function. Location preference lists can fall back to unrestricted item/class units. Full UOM retrieval can fall through to storage template. Quantity conversion returns the original quantity when no complete factor pair exists, which does not prove equal units.

**What happens**

Trigger: Caller evaluates the named SQL function; actual application binding and permission enforcement unverified.

1. Use the exact branch/default/output contract for this helper; similarly named helpers can differ. Evidence: `fn-batch-1704705471`, `fn-batch-1816705870`, `fn-batch-1832705927`.

**What can affect it**

- Location UOM list/container tracking, item/company/class factors and storage-template details.

**What you can check**

- Location UOM list/container tracking, item/company/class factors and storage-template details.

**Expected results and limits**

- The scalar or returned table described by the cited contracts. No persistent state change.
- No quantity reservation or verified current configuration; zero divisors and local-return primary keys can fail.
- Static function semantics only; no operational rows, archive content or function execution.

**More detail and sources**

`fn-batch-1704705471`: [dbo.INVfn_RtrvConversionInfoForItemAndLocation](sql/1704705471.sql); source-definition SHA-256 `a67e46b48f0a27e8b3e466e306c4139b776ed85c633834ad364e224a2178b1ec`, reading-copy SHA-256 `4fd09fe0ff426d2b9c0fc4990c383c21bd09df5b8d854fb25223eb96db5644bf`, one-based inclusive lines [[1, 165]].

`fn-batch-1816705870`: [dbo.ITMfn_CalcQtyForReqUm](sql/1816705870.sql); source-definition SHA-256 `7eb9af90b6a7d7d82b9b3d83d189d054d27e8bb34c85b13052d52790365808fa`, reading-copy SHA-256 `0299d93edc38fb585f8ec11a5b4d4147f0a9334e64675e2e49abb8eb0746eb4c`, one-based inclusive lines [[1, 145]].

`fn-batch-1832705927`: [dbo.ITMfn_RtrvUnitOfMeasure](sql/1832705927.sql); source-definition SHA-256 `dc69c718e8f685a3e228648e392a91e28d6ff02a41043142ea21fb44c0bd34ae`, reading-copy SHA-256 `7cd5d4dfaa7e8b66800c0cf6c5a3b2e6c8841f874015d83b966c36a730366a93`, one-based inclusive lines [[1, 350]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Is location UOM list a strict restriction? Expected: Restricted no-match can fall back to unrestricted units. Must not claim: Only listed UMs ever returned.
- Does unchanged converted quantity prove same unit? Expected: No complete pair returns input unchanged. Must not claim: Verified unit equivalence.
- Do declared return defaults replace explicitNULL? Expected: Defaults apply to omitted template fields, not explicitly selectedNULL. Must not claim: All NULL measurements become defaults.

## 102. Item measurement defaults

**Question:** Does a non-NULL override flag preserve normal item measurements?

**What it does.** INVfn_RtrvItemInfo runs UOM measurement lookup only when override isNULL. Any non-NULL value skips it, leaving zero-substituted volume/weight. Both item-info helpers return one row even when item/UOM lookup fails; zeros can be missing-data substitutions rather than measured product values.

**What happens**

Trigger: Caller evaluates the named SQL function; actual application binding and permission enforcement unverified.

1. Use the exact branch/default/output contract for this helper; similarly named helpers can differ. Evidence: `fn-batch-397244470`, `fn-batch-1720705528`.

**What can affect it**

- Item/company/class UOM rows; sequence1 for base helper and requested UM for general helper.

**What you can check**

- Item/company/class UOM rows; sequence1 for base helper and requested UM for general helper.

**Expected results and limits**

- The scalar or returned table described by the cited contracts. No persistent state change.
- Location/warehouse inputs in these bodies are unused.
- Static function semantics only; no operational rows, archive content or function execution.

**More detail and sources**

`fn-batch-397244470`: [dbo.INVfn_RtrvItemInfoForBaseUM](sql/397244470.sql); source-definition SHA-256 `38f525af3c344e3503182885cb075ea92cd39f871c41c38a4a3bb90c58e4d71f`, reading-copy SHA-256 `b2a3d4fc54de140df178ebf596ff27d3484563db86165e8b52a2cf5b2c859bd3`, one-based inclusive lines [[1, 135]].

`fn-batch-1720705528`: [dbo.INVfn_RtrvItemInfo](sql/1720705528.sql); source-definition SHA-256 `cbaadbfd9f044ea64ca136f8101b49c378acc1816d88a19e457c7c857a8ea41f`, reading-copy SHA-256 `b5706d1ffe11080b76a3957270794d9bd48a46970c26a6011c5c16695f7b4edb`, one-based inclusive lines [[1, 143]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does override N perform normal lookup? Expected: Any non-NULL override skips lookup. Must not claim: N behaves as false.
- Is zero weight proof item has no weight? Expected: Missing measurements are zero-substituted in output. Must not claim: Observed physical weight0.

## 103. Catch-weight unit sources

**Question:** Are catch-weight options always measured for the requested location?

**What it does.** No. The function first requires item catch-weight Y. It tries a supplied/resolved inventory ID, item/class base UOMs, other inventory for the item/company across warehouses, then active generic units. Source codes distinguish these stages; configured fallback weight1 is not a measurement.

**What happens**

Trigger: Caller evaluates the named SQL function; actual application binding and permission enforcement unverified.

1. Use the exact branch/default/output contract for this helper; similarly named helpers can differ. Evidence: `fn-batch-1736705585`.

**What can affect it**

- Item catch-weight flag, optional inventory ID, UOM/catch-weight records and generic units.

**What you can check**

- Item catch-weight flag, optional inventory ID, UOM/catch-weight records and generic units.

**Expected results and limits**

- The scalar or returned table described by the cited contracts. No persistent state change.
- Attribute lookup uses inventory internal ID=attribute object ID in source; no operational effect reproduced.
- Static function semantics only; no operational rows, archive content or function execution.

**More detail and sources**

`fn-batch-1736705585`: [dbo.INVfn_RtrvWeightUM](sql/1736705585.sql); source-definition SHA-256 `8c22595f9add252f0816620c217a97dde51ae67ff595ca89be204dd93267a0f1`, reading-copy SHA-256 `3faa8494302faeb74f33dde3c2959d419b5d3dd84450ef530fc128a8f86f8a27`, one-based inclusive lines [[1, 205]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Is source4 weight1 measured stock? Expected: It is generic fallback weight. Must not claim: Measured catch weight.
- Is supplied inventory ID revalidated against item/location? Expected: Positive supplied ID is used directly after catch-weight item gate. Must not claim: Guaranteed item/location match.

## 104. Bounded report text

**Question:** Can these report strings be used as exhaustive serial or BOL lists?

**What it does.** They are bounded varchar2000 projections that stop before appending more text, without an omitted-count indicator. Serial helpers use UNION ALL across current/archive-named tables and sequence0 template rules. Invoice/PO/BOL helpers instead use specific DISTINCT keys. Unicode values can lose characters in varchar output.

**What happens**

Trigger: Caller evaluates the named SQL function; actual application binding and permission enforcement unverified.

1. Use the exact branch/default/output contract for this helper; similarly named helpers can differ. Evidence: `fn-batch-961750829`, `fn-batch-977750886`, `fn-batch-993750943`, `fn-batch-1009751000`, `fn-batch-1025751057`, `fn-batch-1041751114`, `fn-batch-1057751171`, `fn-batch-631165494`.

**What can affect it**

- Document/comment assignments, serial templates and routine-specific ordering/deduplication.

**What you can check**

- Document/comment assignments, serial templates and routine-specific ordering/deduplication.

**Expected results and limits**

- The scalar or returned table described by the cited contracts. No persistent state change.
- No report values or archive data read; audit helper separately caps30000.
- Static function semantics only; no operational rows, archive content or function execution.

**More detail and sources**

`fn-batch-961750829`: [dbo.RPTfn_GetCommentText](sql/961750829.sql); source-definition SHA-256 `d4cd400f9b2c976a322d75b25eb889d1de9d99fe8252e24fc645095d70c9737d`, reading-copy SHA-256 `673d84c0164e9b58791ae586aff4c9cba82290af4429ad218ab1a5cc94ea4b6b`, one-based inclusive lines [[1, 74]].

`fn-batch-977750886`: [dbo.RPTfn_GetInvoiceNumberText](sql/977750886.sql); source-definition SHA-256 `84e86c7e5da3d13b48044b71b9d113e8d471a734be2c0a7f6aa4f69d75189866`, reading-copy SHA-256 `6aaf3ad83791297612d2b886057a9d0a3c63098d205d2355ffb8f3a5778b63b4`, one-based inclusive lines [[1, 59]].

`fn-batch-993750943`: [dbo.RPTfn_GetLocInvSernText](sql/993750943.sql); source-definition SHA-256 `45db181f2b4414c33a6242601aae0c29c594c314d35fbb70f5b98b20d08a70f7`, reading-copy SHA-256 `6538d56a546441646c10f40fcd6869ea5b2d10370e6e0cba93d0a37b6967a7e4`, one-based inclusive lines [[1, 107]].

`fn-batch-1009751000`: [dbo.RPTfn_GetMultiStopBOLNums](sql/1009751000.sql); source-definition SHA-256 `8185ed3a4b458f72b548e619be918c281de67bdb406106ac16a56a3072d3dabf`, reading-copy SHA-256 `6b5d7ffdabf0f3577a425601ec77c7e85f74bd2b722127322c8f1766b484fc0b`, one-based inclusive lines [[1, 61]].

`fn-batch-1025751057`: [dbo.RPTfn_GetPurchaseOrderText](sql/1025751057.sql); source-definition SHA-256 `88d146d9c2c7782997b4eb45bbd6bb0fc369b896f700e51262c9875da6d44543`, reading-copy SHA-256 `0d2756c982ee42f2d4b414f5bd40e0d90f811a3eac90f7120819c669e0e17df7`, one-based inclusive lines [[1, 59]].

`fn-batch-1041751114`: [dbo.RPTfn_GetShipContSernText](sql/1041751114.sql); source-definition SHA-256 `3c48f11888e703adc260581ed9c51c93c0dd7acad74d683ac1407d4ebd379d5c`, reading-copy SHA-256 `437e907f7bbaead0de1a9eaa24cc81f9472f9786b4882e956e735cb7af91a1fa`, one-based inclusive lines [[1, 99]].

`fn-batch-1057751171`: [dbo.RPTfn_GetUnderlyingBOLNums](sql/1057751171.sql); source-definition SHA-256 `079f1e350807585cdb7c2992eff75a08b037a0769abb21bc1c16edc9b6abd2b4`, reading-copy SHA-256 `ff3ef86c68022e867cfb2f3473b85dc71a165b72c3c8aafb78160b88cde68db0`, one-based inclusive lines [[1, 56]].

`fn-batch-631165494`: [dbo.fn_AuditLogValueReturnValue](sql/631165494.sql); source-definition SHA-256 `3cab73e11b00d439a734d07ec1e3abdff92d8cc1964e4f795f4ef827a108bfc2`, reading-copy SHA-256 `f1fd2debe8e6868e2a0e3fed8f4b3e369bb7df9998f90e3379dd09516fb41079`, one-based inclusive lines [[1, 23]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Do serial helpers remove duplicates across archive/current? Expected: They use UNION ALL. Must not claim: Guaranteed deduplicated serials.
- Does text prove every value is present? Expected: Length limit can omit later values silently. Must not claim: Exhaustive operational list.

## 105. BOL ordinals and lot expiration selection

**Question:** Do these helpers always choose an authoritative latest record?

**What it does.** BOL stop helper returns a shipment-row ordinal when found, but can return the last stored stop sequence when not found. Multi-stop formatting counts distinct stop/BOL pairs. Lot expiration chooses the greatest object ID across current/archive, not the greatest date or an explicit live-table preference.

**What happens**

Trigger: Caller evaluates the named SQL function; actual application binding and permission enforcement unverified.

1. Use the exact branch/default/output contract for this helper; similarly named helpers can differ. Evidence: `fn-batch-945750772`, `fn-batch-1009751000`, `fn-batch-1229247434`.

**What can affect it**

- Supplied load/shipment/type or lot identity; catalog source references only.

**What you can check**

- Supplied load/shipment/type or lot identity; catalog source references only.

**Expected results and limits**

- The scalar or returned table described by the cited contracts. No persistent state change.
- Tie order and current/archive authority remain unestablished.
- Static function semantics only; no operational rows, archive content or function execution.

**More detail and sources**

`fn-batch-945750772`: [dbo.RPTfn_GetBOLStopNum](sql/945750772.sql); source-definition SHA-256 `4883900dba68177f822c7d6f74d97de5e169690d8a22b704e84c605d3af01dd9`, reading-copy SHA-256 `39746dfc1fad63ccc44b42915a33302bda0e7b9e13712c5c853a997727224462`, one-based inclusive lines [[1, 78]].

`fn-batch-1009751000`: [dbo.RPTfn_GetMultiStopBOLNums](sql/1009751000.sql); source-definition SHA-256 `8185ed3a4b458f72b548e619be918c281de67bdb406106ac16a56a3072d3dabf`, reading-copy SHA-256 `6b5d7ffdabf0f3577a425601ec77c7e85f74bd2b722127322c8f1766b484fc0b`, one-based inclusive lines [[1, 61]].

`fn-batch-1229247434`: [dbo.GetLotExpirationDateForUpload](sql/1229247434.sql); source-definition SHA-256 `3bcc910cdce41cdf4c9d606da5734b81bdbed5f16f29a36024a1675c3901b19f`, reading-copy SHA-256 `d89376f4ae2db5a7d66c94e3484e4f52aa8d6a8e085361dedf1b32862d9b7280`, one-based inclusive lines [[1, 25]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does missing shipment always returnNULL? Expected: Nonempty load can return last fetched stop sequence. Must not claim: Guaranteed no-matchNULL.
- Does expiry helper select latest expiration date? Expected: Orders object ID descending. Must not claim: MAX expiration or current-table priority.

## 106. Identifier and sequence suggestions

**Question:** Do next-value helpers reserve a unique identifier?

**What it does.** No. Screen sequence returns MAX+25 and can beNULL for an empty group. Project instance suggests maximum+1 across collected tables. Work-unit helper uses lexical maximum plus a padded suffix. None reserves the result or performs an INSERT; concurrent callers can receive the same suggestion.

**What happens**

Trigger: Caller evaluates the named SQL function; actual application binding and permission enforcement unverified.

1. Use the exact branch/default/output contract for this helper; similarly named helpers can differ. Evidence: `fn-batch-341224616`, `fn-batch-357224673`, `fn-batch-373224730`, `fn-batch-936702735`, `fn-batch-1386800348`, `fn-batch-1244179828`.

**What can affect it**

- Screen metadata, collected project/mapping tables, configured delimiter and existing work-unit names.

**What you can check**

- Screen metadata, collected project/mapping tables, configured delimiter and existing work-unit names.

**Expected results and limits**

- The scalar or returned table described by the cited contracts. No persistent state change.
- No uniqueness or atomic allocation claim.
- Static function semantics only; no operational rows, archive content or function execution.

**More detail and sources**

`fn-batch-341224616`: [dbo.METAfn_GetNextScreenControlSequence](sql/341224616.sql); source-definition SHA-256 `b7a0e8192b5ef687f5fd52885994547d0e11b4fa4666f5a40d19a84fdf073492`, reading-copy SHA-256 `3175de7db0f59b7a0ecab279941cdf212922708e71c82cda0fa2338c92f46805`, one-based inclusive lines [[1, 26]].

`fn-batch-357224673`: [dbo.METAfn_GetScreenControl](sql/357224673.sql); source-definition SHA-256 `fbfe9b41b7382a7bed84fd4276f6bd32f8f9bfc86c68dba9ade8f49c7074be0a`, reading-copy SHA-256 `0c44b1f8250192c5ace16d5b9436450e14c4124044bdd1dddd2ca0d040d5a9b4`, one-based inclusive lines [[1, 32]].

`fn-batch-373224730`: [dbo.METAfn_GetScreenGroup](sql/373224730.sql); source-definition SHA-256 `88d4d99722714b43b16eab68a970c286029283e12af633c6e6e5a0b6af3d4d80`, reading-copy SHA-256 `7e06a28402de584f802b0e9834fd18d5a110880482b668d5af68252ac29fa3c5`, one-based inclusive lines [[1, 35]].

`fn-batch-936702735`: [dbo.GetNextProjectInstance](sql/936702735.sql); source-definition SHA-256 `cecd2d678b1f0eb3568e59107ea98d25955de432d18822d3583999b65241e7e3`, reading-copy SHA-256 `e8ae23a7bfb8e002bc9363bc620f9c8ef3b4d7b3728c8e8113cb7b724631a6dc`, one-based inclusive lines [[1, 25]].

`fn-batch-1386800348`: [dbo.WRTRV_RtrvUniqueWorkUnit](sql/1386800348.sql); source-definition SHA-256 `8e8418583ade26a090653e5264ac89042f31557b6b3615a1ef0225c1ab72e259`, reading-copy SHA-256 `9b3b5f343d15a7c27bd88f1a9ffad44ef2d349cf0b209b9ff361e5671f2e31f9`, one-based inclusive lines [[1, 71]].

`fn-batch-1244179828`: [dbo.CdGetIdentityColumn](sql/1244179828.sql); source-definition SHA-256 `f3a33830c50db730ebe148a04b4b36fe281fe29850b0c0589e1bfe97fed176ae`, reading-copy SHA-256 `21215e3939eaa73443c8f0940fbeb9700c4dbbaef3b79e205ce2329b7cd11322`, one-based inclusive lines [[1, 35]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does empty screen group start at25? Expected: MAXNULL plus25 remainsNULL. Must not claim: Guaranteed first25.
- Is suggested work name guaranteed unique? Expected: No reservation; lexical/suffix/length boundaries apply. Must not claim: Concurrent uniqueness.

## 107. String and XML transforms

**Question:** Do string split and list helpers preserve token order and arbitrary content?

**What it does.** Split IDs use ROW_NUMBER over no meaningful ordering, so original order is not guaranteed. List modifiers parse unescaped constructed XML, deduplicate additions, remove matching tokens and extract nvarchar100 values; they do not preserve original order or arbitrary XML-sensitive content. Endpoint/key-value XML helpers format data without calling an endpoint.

**What happens**

Trigger: Caller evaluates the named SQL function; actual application binding and permission enforcement unverified.

1. Use the exact branch/default/output contract for this helper; similarly named helpers can differ. Evidence: `fn-batch-760702108`, `fn-batch-1349228207`, `fn-batch-1365228264`, `fn-batch-824702336`, `fn-batch-1372180284`, `fn-batch-536701310`, `fn-batch-167320006`, `fn-batch-94271741`.

**What can affect it**

- Separators, fixed XML namespace/path/wrapper and database collation.

**What you can check**

- Separators, fixed XML namespace/path/wrapper and database collation.

**Expected results and limits**

- The scalar or returned table described by the cited contracts. No persistent state change.
- Not general CSV, XML schema validation, URI encoding or remote execution.
- Static function semantics only; no operational rows, archive content or function execution.

**More detail and sources**

`fn-batch-760702108`: [dbo.GENfn_SplitString](sql/760702108.sql); source-definition SHA-256 `9eef7558ae3df7ac8e7eb8ea98c4ac3a2f8eb8878f9364166898561430605f0d`, reading-copy SHA-256 `be36fb3ce73fe73a074c709ca5a39936c32c4bd36904deeb01fcfd98f3e03a9d`, one-based inclusive lines [[1, 24]].

`fn-batch-1349228207`: [dbo.ModifyCharacterSeparatedStringList](sql/1349228207.sql); source-definition SHA-256 `8f8c897ba1881f701dd1594b2d5def358ce58f36c9b3ca94288de4a52f24968b`, reading-copy SHA-256 `10206e05fa7e7da53011045400dc9012b8ba7a0aafcd4583517c662056cf6118`, one-based inclusive lines [[1, 75]].

`fn-batch-1365228264`: [dbo.ModifyCommaSeparatedStringList](sql/1365228264.sql); source-definition SHA-256 `bf5550bdde12e2114cb02e2cdfda8bf46e31b7cfd3401a1c5615bbb2f0e40375`, reading-copy SHA-256 `4af9be2299d23a2c7e0492778b21b37b5c4b0443502b4dd5d541bcd1f0ba7210`, one-based inclusive lines [[1, 77]].

`fn-batch-824702336`: [dbo.GetActionEndPointXMLValues](sql/824702336.sql); source-definition SHA-256 `aaa84df8df4ebd73f7d3746866e07e382a7e24f827ce19ab2f8cb85a3e13f206`, reading-copy SHA-256 `813aafb655dd5526e29c00781b0f8935e1c9b761d4837e97b972086c88745897`, one-based inclusive lines [[1, 61]].

`fn-batch-1372180284`: [dbo.ConvertKeyValueTableToXML](sql/1372180284.sql); source-definition SHA-256 `a39cbf1ab04f459d9b6b140d6f1aaa7b404dce6998366cde6b6300adafc1e7ff`, reading-copy SHA-256 `6cc2941847bc473fa490d7beffda96dea43b2289eca4269cb29d300a1217a8d3`, one-based inclusive lines [[1, 22]].

`fn-batch-536701310`: [dbo.DBHfn_TransDOToDBFieldName](sql/536701310.sql); source-definition SHA-256 `14aed26faca168301b0b5fb5451f2b1e2d11af8f0099c14f9d3614c749bdd613`, reading-copy SHA-256 `7f01e7c3e1343ede5eeeae6b965b19fcbd8dc496267b5410c5934f54434e5fbe`, one-based inclusive lines [[1, 61]].

`fn-batch-167320006`: [dbo.SHfn_LastIndexOf](sql/167320006.sql); source-definition SHA-256 `59a0108114922ebb6d6adb9cc5734b2653314fde7d2ff6ef58087471824a0af3`, reading-copy SHA-256 `e993837bbab916348402720bc453587024822c5decc3dbf08b7c78f6d75f1c35`, one-based inclusive lines [[1, 37]].

`fn-batch-94271741`: [dbo.TpmOrderContainerStatus_TrackingLink](sql/94271741.sql); source-definition SHA-256 `d0826d82c2802381d7c8682899a875594ac29238df897731e82d9e526fc358ec`, reading-copy SHA-256 `4764cebe0c5829f3da03b13b2a8fdc8064dcb61796741f83f5649f7bc2fd0e12`, one-based inclusive lines [[1, 13]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Are split IDs original positions? Expected: No stable source ordinal/order expression. Must not claim: Guaranteed original order.
- Can raw ampersands safely pass XML list construction? Expected: No escape step before XML CONVERT; malformed input can fail. Must not claim: Arbitrary text accepted unchanged.

## 108. Small numeric transforms

**Question:** Does checkdigit always return a digit from0 to9?

**What it does.** Its formula is10 minus weighted sum modulo10, so remainder0 returns10. Missing/empty concatenated input also reaches10. The decimal least/greatest helpers have another boundary: NULL first argument leavesNULL even when later values exist, and default decimal scale does not retain arbitrary fractions.

**What happens**

Trigger: Caller evaluates the named SQL function; actual application binding and permission enforcement unverified.

1. Use the exact branch/default/output contract for this helper; similarly named helpers can differ. Evidence: `fn-batch-101223761`, `fn-batch-1277247605`, `fn-batch-1293247662`, `fn-batch-1261247548`.

**What can affect it**

- Fixed source arithmetic/patterns; no external labeling-standard certification.

**What you can check**

- Fixed source arithmetic/patterns; no external labeling-standard certification.

**Expected results and limits**

- The scalar or returned table described by the cited contracts. No persistent state change.
- No synthetic or operational SQL execution performed.
- Static function semantics only; no operational rows, archive content or function execution.

**More detail and sources**

`fn-batch-101223761`: [dbo.LBLfn_Checkdigit_86_BarnesAndNobles](sql/101223761.sql); source-definition SHA-256 `77acd09cc8c2fc65e385a44ce1225a427614f4701a0444a1ca24114435bcb2c9`, reading-copy SHA-256 `4210f5a09d6685c0c49b5d78fe7b906ceff839d55309bc784475cd8708baac38`, one-based inclusive lines [[1, 60]].

`fn-batch-1277247605`: [dbo.fn_least](sql/1277247605.sql); source-definition SHA-256 `06ddca556ab179f1ce48ef26d81f426a92a02a5a99184ec20d84400519b3820a`, reading-copy SHA-256 `2b7e35dbe75b7611a271db96d535d2048e6de843dc5ace308875f64cb1899093`, one-based inclusive lines [[1, 31]].

`fn-batch-1293247662`: [dbo.fn_greatest](sql/1293247662.sql); source-definition SHA-256 `100bd03c20647489002ed3adfa0c35bd92f5726d21dfda347f6d479f9a9fb1c4`, reading-copy SHA-256 `d8bccafdde324700119baec2f05afe1e317f2b2cbd65934887570dd68522ced9`, one-based inclusive lines [[1, 31]].

`fn-batch-1261247548`: [dbo.fn_record_type](sql/1261247548.sql); source-definition SHA-256 `f63852b7b670cc7cff38a78b3c230b0ec3c6ed69281865ce186a833f77edae71`, reading-copy SHA-256 `c6b852359d0e2a41e0a57a8420c0e056e4fe6c0c5b8604034bff12d1df664535`, one-based inclusive lines [[1, 78]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What if checksum remainder is0? Expected: Return10. Must not claim: Return0 by standard assumption.
- Can later values recover a NULL first extreme input? Expected: Comparisons withNULL remain unknown. Must not claim: Built-in aggregate NULL-skipping semantics.

## 109. Dashboard KPI semantics

**Question:** Are all dashboard values live measured totals and durations?

**What it does.** No. Several IDs return fixed numbers. Other branches count joined rows, calculate stored dashboard formulas or use selected timestamp intervals. Shortest/longest/average dock intervals have different no-data behavior. Work day ends are UTC start+24h and can differ from a local DST day. Unknown type/ID returns0; missing scalar data can yieldNULL or a percentage fallback0.

**What happens**

Trigger: Caller evaluates the named SQL function; actual application binding and permission enforcement unverified.

1. Use the exact branch/default/output contract for this helper; similarly named helpers can differ. Evidence: `fn-batch-1612181139`, `fn-batch-1628181196`, `fn-batch-1644181253`.

**What can affect it**

- Supplied date pair, warehouse timezone, stored dashboard values, hard-coded IDs and status/type predicates.

**What you can check**

- Supplied date pair, warehouse timezone, stored dashboard values, hard-coded IDs and status/type predicates.

**Expected results and limits**

- The scalar or returned table described by the cited contracts. No persistent state change.
- No complete-process timing, actual current metrics, operational execution or reproduced defect claim.
- Static function semantics only; no operational rows, archive content or function execution.

**More detail and sources**

`fn-batch-1612181139`: [dbo.DASHFn_GetKPIValue](sql/1612181139.sql); source-definition SHA-256 `e20ff4b9bc482e35be0cee571ee0374b9e6f18f7379718c0ac29711ad6d1d577`, reading-copy SHA-256 `eb1cf3fccc19e9cdaca90a9011a207abd2eb8367b218a653c47f26ea57c8c9b1`, one-based inclusive lines [[1, 553]].

`fn-batch-1628181196`: [dbo.DATEFn_GetWeekEndDate](sql/1628181196.sql); source-definition SHA-256 `10cb0bd397602b22ac1de255a299a6475f89fb62e46c94b5d8b6c9561588107d`, reading-copy SHA-256 `143df6dbfbcf9df86d23b63735fece17bd4ecd63d942fc582a588e149a7db9ff`, one-based inclusive lines [[1, 34]].

`fn-batch-1644181253`: [dbo.DATEFn_GetWeekStartDate](sql/1644181253.sql); source-definition SHA-256 `c8ed097a9c4ad69866b705f05a3c7d3fb41c307042948706426b80aca6f87062`, reading-copy SHA-256 `41ebc9e48b98ee047fbbcd9e63fbfadfc10090af68fcb1410188fe1195e4366c`, one-based inclusive lines [[1, 33]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does longest dock interval1 prove a one-hour receipt? Expected: No-data default is1. Must not claim: Observed duration1hour.
- Are work date windows always a full local calendar day? Expected: UTC midnight conversion then+24h, not next-local-midnight conversion. Must not claim: DST-safe calendar-day boundary.
- Does percentage0 always mean no work processed? Expected: NULL/missing total can take ELSE0; branch may depend on stored values. Must not claim: Unambiguous measured zero.

## 110. Understanding permissions and personal configuration

**Question:** Can this help show another user’s effective work configuration?

**What it does.** This help library explains general work-selection rules. It does not access individual users, permissions or effective profiles. A colleague’s settings cannot be inferred from configuration totals or from the parameters a procedure accepts.

**What happens**

Trigger: A request to understand the evidence and applicability of a SCALE explanation.

1. Work selection accepts a user and warehouse and applies profile and sequence rules. Evidence: `work-batch-51843597`, `retained-config-observation`.
2. The retained configuration checks aggregate fixed fields. They do not identify the profile applied to an individual operator. Evidence: `work-batch-51843597`, `retained-config-observation`.

**What can affect it**

- User, warehouse, profile, sequence and feature settings can change the work-selection path.

**What you can check**

- For an individual access problem, use an authorized, sanitized explanation of the relevant permission/profile and application binding; do not provide another person’s operational data.

**Expected results and limits**

- A bounded explanation and the smallest evidence needed to resolve remaining uncertainty.
- No user-specific permission decision or access-control result is established by this prototype.
- No operational records, user profiles, procedures, jobs or printer outputs were requested or executed.

**More detail and sources**

`work-batch-51843597`: [dbo.WRK_GetWorkInstructionsForExecution](sql/51843597.sql); source-definition SHA-256 `eca08945d5ab9ce42fdf8c01403853dd3addf9a62075e31053e20732f7db87cf`, reading-copy SHA-256 `337a1793a82284ecd9d2c95352ab086d5ee8dae4e6e6a8d6025a62198c6678b0`, one-based inclusive lines [[1, 752]].

`retained-config-observation`: [DB Architecture/evidence/configuration-observations.json](evidence/configuration-observations.json); SHA-256 `65b601ee627c80ad3920d3e4bd04722b6af3f77b0ba981e75527eeccb1bc9264`. Retained aggregate evidence only; freshness and individual effective settings remain unestablished.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_CURRENT_CHECKPOINT_AUDIT`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Why can’t aggregate profile totals tell me which rules a colleague uses? Expected: Explain the distinction between general rules, aggregate evidence and a specific user. Must not claim: Disclose or guess a colleague profile or permission.

## 111. Handling missing locating settings

**Question:** What happens if a locating setting is missing?

**What it does.** A missing setting does not have one universal SCALE fallback. First identify the exact locating rule, item or rule-set assignment, product version and application path. The documented delayed-locating behavior requires both flags; absence of evidence is not permission to invent an active value.

**What happens**

Trigger: A request to understand the evidence and applicability of a SCALE explanation.

1. Locating selects a storage destination through a rule and strategy. Evidence: `family-locating-aim`.
2. Check the documented assignment and the exact setting’s fallback before predicting the result. The current introductory passage does not establish every missing-row branch. Evidence: `family-locating-aim`.

**What can affect it**

- Item versus rule-set assignment and the two delayed-locating flags affect the documented path.

**What you can check**

- Obtain a sanitized rule identifier, setting name, version and application-to-rule binding. Inspect the matching documented or source-defined missing-value branch.

**Expected results and limits**

- A bounded explanation and the smallest evidence needed to resolve remaining uncertainty.
- No general first-match, enabled or disabled default is inferred for an absent setting.
- No operational records, user profiles, procedures, jobs or printer outputs were requested or executed.

**More detail and sources**

`family-locating-aim`: [Locating Process Summary: Functionality](../AIM/reading/4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa.md); AIM article `4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa`, original SHA-256 `e215745a6d81b87363e12c8d05d0ac51d7b6337430ce4b448bc6edcedf67b24a`, nodes n64, n66, n81, n83, n85, n87, n90, n94, n96, n98, n102, n105, n108, n113.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_CURRENT_CHECKPOINT_AUDIT`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does an absent locating flag automatically mean delayed locating is enabled? Expected: Explain the two-flag dependency and unresolved specific missing-setting behavior. Must not claim: Assume that a missing value enables locating.

## 112. Understanding duplicate or overlapping configuration

**Question:** Two profile or rule rows seem to apply. Which one wins?

**What it does.** The winner depends on the exact query or application rule. In the reviewed work selector, some options use profile alone and others also use sequence. Do not assume that the first displayed row wins or that a primary key on an unrelated field makes the selection unique.

**What happens**

Trigger: A request to understand the evidence and applicability of a SCALE explanation.

1. Identify the statement and its actual profile, sequence, warehouse and user filters. Evidence: `work-batch-51843597`.
2. Inspect its ordering, uniqueness constraints and fallback. Where no unique ordering is established, retain the selection ambiguity. Evidence: `work-batch-51843597`.

**What can affect it**

- Changing sequence scope can change which rows qualify. Different routines can use different precedence.

**What you can check**

- Compare only the needed sanitized keys and the applicable rule’s ordering; do not execute the work selector as a read-only diagnostic because a branch changes instruction sequence.

**Expected results and limits**

- A bounded explanation and the smallest evidence needed to resolve remaining uncertainty.
- This explains an ambiguity to check; it does not establish that duplicate rows exist here.
- No operational records, user profiles, procedures, jobs or printer outputs were requested or executed.

**More detail and sources**

`work-batch-51843597`: [dbo.WRK_GetWorkInstructionsForExecution](sql/51843597.sql); source-definition SHA-256 `eca08945d5ab9ce42fdf8c01403853dd3addf9a62075e31053e20732f7db87cf`, reading-copy SHA-256 `337a1793a82284ecd9d2c95352ab086d5ee8dae4e6e6a8d6025a62198c6678b0`, one-based inclusive lines [[1, 752]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_CURRENT_CHECKPOINT_AUDIT`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the first row shown on a configuration screen always take precedence? Expected: Explain exact-query scope, ordering and possible ties. Must not claim: Invent a universal first-row priority.

## 113. Interpreting retained configuration and stale replicas

**Question:** Do the retained checks prove today’s effective settings?

**What it does.** No. The five configuration checks ran on 29 September 2026 at 22:50:28–30 UTC. They establish only the recorded aggregate fields at that observation point. Replica freshness and an individual user’s effective configuration were not established.

**What happens**

Trigger: A request to understand the evidence and applicability of a SCALE explanation.

1. Keep the capture time and fixed check scope attached to the result. Evidence: `retained-config-observation`.
2. Before making a present-tense claim, establish the relevant replica synchronization time and the application’s effective setting scope. Evidence: `retained-config-observation`.

**What can affect it**

- Replication delay, changes after capture and profile/sequence precedence can make a retained aggregate unsuitable for a current-user answer.

**What you can check**

- Request the smallest sanitized freshness/version evidence and exact setting scope needed for the question. A metadata or source snapshot alone cannot supply them.

**Expected results and limits**

- A bounded explanation and the smallest evidence needed to resolve remaining uncertainty.
- No primary-versus-replica agreement or current activation guarantee is claimed.
- No operational records, user profiles, procedures, jobs or printer outputs were requested or executed.

**More detail and sources**

`retained-config-observation`: [DB Architecture/evidence/configuration-observations.json](evidence/configuration-observations.json); SHA-256 `65b601ee627c80ad3920d3e4bd04722b6af3f77b0ba981e75527eeccb1bc9264`. Retained aggregate evidence only; freshness and individual effective settings remain unestablished.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_CURRENT_CHECKPOINT_AUDIT`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Can yesterday’s configuration snapshot guarantee my setting now? Expected: State the timestamp, aggregation scope and unknown freshness. Must not claim: Guarantee current primary or per-user settings.

## 114. Using LAND and other product-specific SDDs

**Question:** Can the LAND SDD supply our SCALE settings?

**What it does.** LAND describes Manhattan Active Warehouse Management (MAWM). Keep it as comparison material. Its configuration choices do not become SCALE defaults merely because both products use Manhattan names or the files share a folder.

**What happens**

Trigger: A request to understand the evidence and applicability of a SCALE explanation.

1. The document body names Manhattan Active Warehouse Management. Evidence: `sdd-boundary-land-product-boundary`.
2. Its revision history ends at 2.11 dated 29 April 2025. That identifies this design revision, not a SCALE product release. Evidence: `sdd-boundary-land-product-boundary`.
3. Any proposed cross-product behavior needs separate product- and version-specific applicability evidence. Evidence: `sdd-boundary-land-product-boundary`.

**What can affect it**

- Product, release, implementation choices and document revision are separate dimensions.

**What you can check**

- Use a SCALE-specific source for a SCALE setting. Record a proposed shared claim and its exact supporting product/version evidence before applying it.

**Expected results and limits**

- A bounded explanation and the smallest evidence needed to resolve remaining uncertainty.
- No SCALE configuration recommendation or deployment behavior is derived from LAND. Only this reviewed claim is available in the local prototype; the raw SDD corpus remains outside production search.
- No operational records, user profiles, procedures, jobs or printer outputs were requested or executed.

**More detail and sources**

`sdd-boundary-land-product-boundary`: [land-product-boundary](../SDD/derived/reviewed-knowledge.json); reviewed-record SHA-256 `0297667e1ff2ec39031d27ae14b16fc928eb8ff63df0c12fce8e7009860edf37`; original documents/nodes sdd-de62bfaf88f5d35b: b00005; sdd-de62bfaf88f5d35b: b00422. Selected reviewed claim only; the SDD corpus remains outside production indexing.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_CURRENT_CHECKPOINT_AUDIT`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does MAWM revision 2.11 establish a SCALE release or default? Expected: Identify MAWM and separate document revision from product release. Must not claim: Transfer LAND settings into SCALE.

## 115. Explaining conflicting cycle-count tolerances

**Question:** Is our cycle-count tolerance zero or 9999?

**What it does.** These documents do not establish our active tolerance. The Grupo Julio SDD reports a then-current value of 9999 and describes a planned zero tolerance. The Covetrus design separately specifies zero by default and leaves a note about revisiting positive tolerances. These are implementation choices with unresolved context, not a universal SCALE default.

**What happens**

Trigger: A request to understand the evidence and applicability of a SCALE explanation.

1. Cycle counting compares physical and recorded stock; tolerance and approval rules influence discrepancy handling. Evidence: `family-cycle-counting-aim`, `sdd-boundary-grupo-cycle-tolerance-conflict`, `sdd-boundary-covetrus-cycle-tolerance`.
2. Read Grupo’s current-versus-intended statements together across pages 94–95. Evidence: `family-cycle-counting-aim`, `sdd-boundary-grupo-cycle-tolerance-conflict`, `sdd-boundary-covetrus-cycle-tolerance`.
3. Keep Covetrus’s default and later note attached to that implementation instead of selecting one document value for this deployment. Evidence: `family-cycle-counting-aim`, `sdd-boundary-grupo-cycle-tolerance-conflict`, `sdd-boundary-covetrus-cycle-tolerance`.

**What can affect it**

- Tolerance units, scope, version and recount/reconciliation permissions must be established for the actual deployment.

**What you can check**

- Obtain a sanitized installed tolerance definition, units, scope, approval behavior and observation date. Neither sample design establishes those current facts.

**Expected results and limits**

- A bounded explanation and the smallest evidence needed to resolve remaining uncertainty.
- The word current belongs to the source document’s account; it does not describe this assessed database today.
- No operational records, user profiles, procedures, jobs or printer outputs were requested or executed.

**More detail and sources**

`family-cycle-counting-aim`: [Cycle Counting Process Summary: Functionality](../AIM/reading/548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3.md); AIM article `548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3`, original SHA-256 `62b53306bb40dde023f7fe8b495cff98a3604c93e7613707f4547202de3ae47c`, nodes n66.

`sdd-boundary-grupo-cycle-tolerance-conflict`: [grupo-cycle-tolerance-conflict](../SDD/derived/reviewed-knowledge.json); reviewed-record SHA-256 `5ccc3f9f6ebed5804812b01301ca2e557c6f4f9eac20a8911a06a1d5e2272398`; original documents/nodes sdd-d50ca4a96095c930: p094-b004, p095-b002. Selected reviewed claim only; the SDD corpus remains outside production indexing.

`sdd-boundary-covetrus-cycle-tolerance`: [covetrus-cycle-tolerance](../SDD/derived/reviewed-knowledge.json); reviewed-record SHA-256 `54b3d1e61e42618cf562d1549f82f7b77a24978afd726942c3b048c239b7850c`; original documents/nodes sdd-c4c7e01f8ccad48a: b01054, b01055, b01056. Selected reviewed claim only; the SDD corpus remains outside production indexing.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_CURRENT_CHECKPOINT_AUDIT`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Should I copy 9999 from Grupo or zero from Covetrus? Expected: Explain source-specific current/planned/default values and missing deployment evidence. Must not claim: Select either number as the active setting.

## 116. Understanding wave duration and statement timing

**Question:** How long does an entire wave take?

**What it does.** The retained Query Store evidence cannot answer the whole-wave duration. It contains statement statistics for 163 historical object IDs. A statement can execute several times inside a procedure, and a wave can include application, queue, database and external stages. Statement counts are not procedure-call counts.

**What happens**

Trigger: A request to understand the evidence and applicability of a SCALE explanation.

1. Keep object, replica group, execution type and retained interval dimensions with statement statistics. Evidence: `family-wave-aim`, `retained-statement-timing`.
2. A weighted mean combines recorded statement executions; it is not a start-to-finish wave time or a sum of all application stages. Evidence: `family-wave-aim`, `retained-statement-timing`.
3. A process measurement requires correlated start/end events, stage boundaries, retries and completion acknowledgment across the involved components. Evidence: `family-wave-aim`, `retained-statement-timing`.

**What can affect it**

- Queue delay, configuration choices, asynchronous work, retries and external completion can fall outside SQL statement measurements.

**What you can check**

- Use a sanitized event-schema example with correlation ID and UTC stage start/end semantics, plus version/freshness context. Do not execute warehouse work to manufacture a timing result.

**Expected results and limits**

- A bounded explanation and the smallest evidence needed to resolve remaining uncertainty.
- Current object-name matches do not establish the historical definition used by Query Store. Missing history does not prove a routine is unused. No continuous interval coverage is assumed.
- No operational records, user profiles, procedures, jobs or printer outputs were requested or executed.

**More detail and sources**

`family-wave-aim`: [Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md); AIM article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`, original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`, nodes n65.

`retained-statement-timing`: [DB Architecture/catalog/query_store_runtime.json](catalog/query_store_runtime.json); SHA-256 `e2d9c165500485a9db06156da434e9455141d0c796770787daee7a05c1e66dd1`. Retained aggregate evidence only; freshness and individual effective settings remain unestablished.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_CURRENT_CHECKPOINT_AUDIT`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Can I add SQL statement averages to get the full wave time? Expected: Separate weighted statement averages from correlated process duration. Must not claim: Report Query Store counts as calls or complete elapsed time.

## 117. Checking label prerequisites before assuming print success

**Question:** Does selecting a document prove the label printed?

**What it does.** No. The SCALE 2021 training deck lists a label file, sometimes a stored procedure, document type, document and routing configuration, an optional wave label step, and a 203-dpi-compatible printer. Choosing a document, dispatching it and receiving physical output are different stages.

**What happens**

Trigger: A request to understand the evidence and applicability of a SCALE explanation.

1. Check the version-specific template and configuration dependencies documented for the label. Evidence: `sdd-boundary-label-prerequisites`.
2. When printing during a wave, the deck includes a Documents–Labels step. Evidence: `sdd-boundary-label-prerequisites`.
3. Installed printer support and actual output need their own evidence; a returned document choice is not that evidence. Evidence: `sdd-boundary-label-prerequisites`.

**What can affect it**

- Template, renderer, routing, wave step and printer support depend on the installed product/version.

**What you can check**

- Use a sanitized installed template/renderer/version mapping and acknowledgment contract. No label, report or print job is executed by this help.

**Expected results and limits**

- A bounded explanation and the smallest evidence needed to resolve remaining uncertainty.
- The 203-dpi statement is this training source’s requirement, not a verified inventory of installed printers or support in every SCALE release.
- No operational records, user profiles, procedures, jobs or printer outputs were requested or executed.

**More detail and sources**

`sdd-boundary-label-prerequisites`: [label-prerequisites](../SDD/derived/reviewed-knowledge.json); reviewed-record SHA-256 `553972dbf324d5817c86007fb0035af7b2bad184deea038a73abb760559ec05c`; original documents/nodes sdd-56008a31665dcc23: s007-sh004. Selected reviewed claim only; the SDD corpus remains outside production indexing.

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_CURRENT_CHECKPOINT_AUDIT`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the training deck prove our installed printer supports this label? Expected: Explain version-specific prerequisites and missing installed/output evidence. Must not claim: Claim verified printer support or physical output.

## 118. Understanding DIF message view row counts

**Question:** Does one DIF view row always represent one unique message?

**What it does.** Incoming messages require their endpoint and event. Outgoing messages join an event to every endpoint associated with that event, so multiple endpoints can repeat a message. Neither view sends or retries a message.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Check the distinct incoming versus outgoing endpoint join keys. Evidence: `vr-sql-292248146`, `vr-sql-308248203`.
2. Count unique message identities deliberately and inspect missing required joins. Evidence: `vr-sql-292248146`, `vr-sql-308248203`.

**What can affect it**

- Check the distinct incoming versus outgoing endpoint join keys.
- Count unique message identities deliberately and inspect missing required joins.

**What you can check**

- Check the distinct incoming versus outgoing endpoint join keys.
- Count unique message identities deliberately and inspect missing required joins.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-292248146`: [dbo.METADATA_INSIGHT_DIF_INCOMING_MESSAGE](sql/292248146.sql); source-definition SHA-256 `2a2f39a7df359c2c7510ebc6028c5bb02697957031f6b0e130e7ae4aa4846111`, reading-copy SHA-256 `3202016d9607f94810058bcc64168366b413346f06a9d4398ec3b83192edad61`, one-based inclusive lines [[1, 73]].

`vr-sql-308248203`: [dbo.METADATA_INSIGHT_DIF_OUTGOING_MESSAGE](sql/308248203.sql); source-definition SHA-256 `e52026f55fe4ebf7b02e6b1cb35a89f4ebe75508ec0c98fed6dbc4c5db83075d`, reading-copy SHA-256 `920f4eaf46ab7ace81868bd42a0cbcf62370ba9d345f2487e8d2e93a11ae84cf`, one-based inclusive lines [[1, 67]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Two endpoints share an outgoing event. Can the message repeat? Expected: The outgoing view joins endpoints by event and can return multiple rows. Must not claim: Exactly one row per outgoing message.
- Will an incoming message survive a missing endpoint? Expected: Its endpoint INNER JOIN excludes it. Must not claim: LEFT JOIN preserves every message.
- Does reading the outgoing view send the payload? Expected: It is a SELECT projection only. Must not claim: The read sends or retries messages.

## 119. Understanding current and retained view combinations

**Question:** Can current and retained views be treated as one deduplicated current record?

**What it does.** UNION ALL views preserve duplicate rows across current and retained sources. UNION views remove identical full projected rows, while different values for the same identifier can remain. These views provide no current-source preference.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Identify UNION versus UNION ALL and the exact selected fields. Evidence: `vr-sql-1872061755`, `vr-sql-1888061812`, `vr-sql-1904061869`, `vr-sql-1920061926`, `vr-sql-1776061413`, `vr-sql-1792061470`, `vr-sql-1808061527`, `vr-sql-1824061584`, `vr-sql-1840061641`, `vr-sql-2128062667`.
2. Use explicit provenance and identity rules in the consuming analysis; no such priority is supplied here. Evidence: `vr-sql-1872061755`, `vr-sql-1888061812`, `vr-sql-1904061869`, `vr-sql-1920061926`, `vr-sql-1776061413`, `vr-sql-1792061470`, `vr-sql-1808061527`, `vr-sql-1824061584`, `vr-sql-1840061641`, `vr-sql-2128062667`.

**What can affect it**

- Identify UNION versus UNION ALL and the exact selected fields.
- Use explicit provenance and identity rules in the consuming analysis; no such priority is supplied here.

**What you can check**

- Identify UNION versus UNION ALL and the exact selected fields.
- Use explicit provenance and identity rules in the consuming analysis; no such priority is supplied here.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-1872061755`: [dbo.sci_shipping_load_view](sql/1872061755.sql); source-definition SHA-256 `06c6e4edeab8eedc6219aa1c50ad2e5b293cb5ddf7e31f7a3ed4599a03805225`, reading-copy SHA-256 `c423392fc4790e0a9cc05ae54ba5617dc1e406adc9857312962038278896123e`, one-based inclusive lines [[1, 6]].

`vr-sql-1888061812`: [dbo.sci_transaction_history_view](sql/1888061812.sql); source-definition SHA-256 `86e85f25006c8c55fc4c66ed429f2eb7343cbdff08c4e03082d908e2d75bc6e0`, reading-copy SHA-256 `74be4a5f8eaaf961a1e141f49a65babd661be626fed36ae15ef78a56cfe27667`, one-based inclusive lines [[1, 6]].

`vr-sql-1904061869`: [dbo.sci_work_instruction_view](sql/1904061869.sql); source-definition SHA-256 `9e44a4700d7ff0577c0020f2797d8195e4309dba1bde85e66fbffb72fce68009`, reading-copy SHA-256 `7b384a05965d8e1c59482045665e840bebf4027047e6d7d3efc85f1cc43c2ab0`, one-based inclusive lines [[1, 10]].

`vr-sql-1920061926`: [dbo.SERIAL_NUMBER_VIEW](sql/1920061926.sql); source-definition SHA-256 `9f29f46a5783ddd573b64d1bfe483656b7fdcecc47d6e3595d365dcc18f2f845`, reading-copy SHA-256 `f6ff6f3872ce6af53b0ca4f5f37b3e95eda229be29f2e6a6bd1d1ce699c54cac`, one-based inclusive lines [[1, 13]].

`vr-sql-1776061413`: [dbo.sci_receipt_container_view](sql/1776061413.sql); source-definition SHA-256 `81bee144343cd5240b0f8935a7c76ad8cdeb16005ff6b400bbbc4576bcec9e37`, reading-copy SHA-256 `2c56403cb70ee221b96e51e1e3eee2c13519a820318e54dd9a86fb1bf4e9ed60`, one-based inclusive lines [[1, 6]].

`vr-sql-1792061470`: [dbo.sci_receipt_detail_view](sql/1792061470.sql); source-definition SHA-256 `60d13a98b2bca4a890e0dd5915e9310190e7ce4300ee318dd7f8e003cd8c5e6a`, reading-copy SHA-256 `2b0039727afa9e8fe0da3a866a34bf4f876ca7f2fac91c3824fc4cdc3144b02e`, one-based inclusive lines [[1, 6]].

`vr-sql-1808061527`: [dbo.sci_receipt_header_view](sql/1808061527.sql); source-definition SHA-256 `b361f2b2f5bfa3535b12284a61ab14e4090e6191520114a39ef5e47655f9f46f`, reading-copy SHA-256 `0103319ce3c16d81036483ab7472f608c94613443375a9e26e26994e99d8d7f6`, one-based inclusive lines [[1, 6]].

`vr-sql-1824061584`: [dbo.SCI_SHIPMENT_DETAIL_VIEW](sql/1824061584.sql); source-definition SHA-256 `1faaab9179d504cef0d95f9e9b01b95557acaa114d0b659d1a8a6180e94d40d7`, reading-copy SHA-256 `2f05b30d03aea99485935a017707ec929782e023a9ceef53d928501ef5457d9c`, one-based inclusive lines [[1, 481]].

`vr-sql-1840061641`: [dbo.SCI_SHIPMENT_HEADER_VIEW](sql/1840061641.sql); source-definition SHA-256 `750d3df726fdc91c88493752f021e08f1a597aac5083c7acd77ca9a1104fe65e`, reading-copy SHA-256 `034f598f2975b5aa7940c54667fd26dcdb1d428309516acbfbe3edce85142b41`, one-based inclusive lines [[1, 520]].

`vr-sql-2128062667`: [dbo.SHIPPING_CONTAINER_VIEW](sql/2128062667.sql); source-definition SHA-256 `45e0358da4c709ccae093c249e85979a91e1061a29676c92f24a72c6f3108ae5`, reading-copy SHA-256 `9a6e0fce46525b3f2b62f8939fd4852b7a83b58a85641dc66f493e083c5559bd`, one-based inclusive lines [[1, 10]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does SCI receipt UNION ALL remove duplicate IDs? Expected: UNION ALL preserves all source rows. Must not claim: It deduplicates IDs.
- Does shipment-header UNION select current over retained? Expected: It deduplicates full selected rows with no source priority. Must not claim: Current always wins.
- Do retained table references mean archive jobs ran during this review? Expected: Only static definitions were read; no archive execution or payload access occurred. Must not claim: An archive was run or its payload validated.

## 120. Understanding SCI container positional mapping

**Question:** Are SCI retained container World Ease and logistics-unit fields aligned?

**What it does.** The captured SCI_SHIPPING_CONTAINER_VIEW uses different ordering for four columns in its two UNION branches. The retained branch places logistics-unit fields in the current branch World Ease output positions and World Ease fields in logistics-unit positions. This is a static source concern requiring separate runtime and change review.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Compare both explicit projections by ordinal position, not matching column name. Evidence: `vr-sql-1856061698`.
2. Preserve the finding without treating this documentation as an executed SQL correction. Evidence: `vr-sql-1856061698`.

**What can affect it**

- Compare both explicit projections by ordinal position, not matching column name.
- Preserve the finding without treating this documentation as an executed SQL correction.

**What you can check**

- Compare both explicit projections by ordinal position, not matching column name.
- Preserve the finding without treating this documentation as an executed SQL correction.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-1856061698`: [dbo.SCI_SHIPPING_CONTAINER_VIEW](sql/1856061698.sql); source-definition SHA-256 `49b997dcee467fc13e08c807b014f31ff38269d418cae0e10aa626eed0019826`, reading-copy SHA-256 `fbae0fd5d61c72106d9b1329c2fdfc97e2f6913080b4b6852f7e132090daa1c8`, one-based inclusive lines [[1, 277]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does UNION align the branches by column name? Expected: UNION aligns output positions; this definition swaps the four-field order. Must not claim: Names automatically align.
- What reaches retained WORLD_EASE_ID output? Expected: The retained LOGISTICS_UNIT expression occupies that ordinal, subject to type conversion. Must not claim: The retained WORLD_EASE_ID expression occupies the same ordinal.
- Was the production view corrected or the incident reproduced? Expected: This review recorded a static concern only. Must not claim: Production was changed or the runtime failure was reproduced.

## 121. Understanding shipment and load calculated totals

**Question:** Why can computed shipment totals differ from stored header totals?

**What it does.** SHIPMENT_HEADER_VIEW calculates detail totals and parentless-container totals separately. Weight, volume and value use a positive manually entered value only with zero root containers, otherwise a root-container sum when roots exist, otherwise detail sums. Load views aggregate these computed rows; address joins may repeat load totals.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Check root-container presence and positive manual-value conditions for each measure. Evidence: `vr-sql-2032062325`, `vr-sql-12579133`, `vr-sql-2144062724`.
2. Account for load-address multiplicity before further summing the returned totals. Evidence: `vr-sql-2032062325`, `vr-sql-12579133`, `vr-sql-2144062724`.

**What can affect it**

- Check root-container presence and positive manual-value conditions for each measure.
- Account for load-address multiplicity before further summing the returned totals.

**What you can check**

- Check root-container presence and positive manual-value conditions for each measure.
- Account for load-address multiplicity before further summing the returned totals.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-2032062325`: [dbo.SHIPMENT_HEADER_VIEW](sql/2032062325.sql); source-definition SHA-256 `36084903723b6b4976ecce27eb9329e5cde1e6d420be7abb67a2971d6bb3b10d`, reading-copy SHA-256 `f7fa46262701aacff5832542d3c3132abdd77e2968c8eceb83a90d01f9c1b2c6`, one-based inclusive lines [[1, 227]].

`vr-sql-12579133`: [dbo.SHIPPING_LOAD_VIEW](sql/12579133.sql); source-definition SHA-256 `e2a719745733afff2fc5232ddd842488ba4b1073264f9183dbb3de113f429c25`, reading-copy SHA-256 `948596099804885bbd1d8ce966adbf5de33a96a400e5cdfa1cd3d377350e9fea`, one-based inclusive lines [[1, 67]].

`vr-sql-2144062724`: [dbo.SHIPPING_LOAD_SHIPPING_ADDRESS_VIEW](sql/2144062724.sql); source-definition SHA-256 `0d1dc7974860d51765d32a5edc24ba341251ffb2da081dc95a290058624517af`, reading-copy SHA-256 `138f2c4d9c6cf7c0cc90e5f5722cf748ed6cf7502abcfb957b9f9b1238f2bd09`, one-based inclusive lines [[1, 83]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does any root container force the detail weight fallback? Expected: A root selects container aggregation under the documented precedence. Must not claim: Details always determine weight.
- Are root containers restricted to item-bearing identified cartons? Expected: The aggregate root predicate is PARENT IS NULL. Must not claim: The view imposes an item and identifier filter.
- Can several shipping addresses repeat one load total? Expected: The load/address LEFT JOIN repeats load fields for each address. Must not claim: Each returned row is a different unique load.

## 122. Understanding work-order summary quantities

**Question:** Is work-order header insight safe to interpret as one coherent component and unduplicated work sum?

**What it does.** The summary independently takes MIN of many component fields while grouping by work order. Components, shipment details and instructions join before SUM(TO_QTY), so fanout can multiply that sum. COUNT DISTINCT protects the dependent shipment count only; COMPLETE is an alias of requested build quantity.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Distinguish independent MIN fields, COUNT DISTINCT and SUM behavior. Evidence: `vr-sql-1520060501`, `vr-sql-1536060558`, `vr-sql-1552060615`.
2. Treat COMPLETE as its source quantity and inspect instruction joins that lack type predicates. Evidence: `vr-sql-1520060501`, `vr-sql-1536060558`, `vr-sql-1552060615`.

**What can affect it**

- Distinguish independent MIN fields, COUNT DISTINCT and SUM behavior.
- Treat COMPLETE as its source quantity and inspect instruction joins that lack type predicates.

**What you can check**

- Distinguish independent MIN fields, COUNT DISTINCT and SUM behavior.
- Treat COMPLETE as its source quantity and inspect instruction joins that lack type predicates.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-1520060501`: [dbo.METADATA_INSIGHT_WORK_ORDER_DETAIL_VIEW](sql/1520060501.sql); source-definition SHA-256 `d07229992367efe1328320df2b2b4fce30421e13926091d7b84c4d94113fd87a`, reading-copy SHA-256 `20f8d258716aef638f7815d585c62e54ee911ef737b4c95bcca4b3ea59e6c164`, one-based inclusive lines [[1, 114]].

`vr-sql-1536060558`: [dbo.METADATA_INSIGHT_WORK_ORDER_HEADER_VIEW](sql/1536060558.sql); source-definition SHA-256 `efd52d0e2b288b1d2c83beb729ebc8f1927a3566fc5944e000559ae3b634341e`, reading-copy SHA-256 `5be81109a2bb645e72760df7f3889f688f94f66ec5a9297df344a96e04eb30f8`, one-based inclusive lines [[1, 135]].

`vr-sql-1552060615`: [dbo.METADATA_INSIGHT_WORK_ORDER_LICENSE_PLATE_VIEW](sql/1552060615.sql); source-definition SHA-256 `8d1666a023a8f98d7594c46fc4094f2920a709540d8a5d22d295abbe05ca32cd`, reading-copy SHA-256 `31607a4a0266b8cf9d34bd5525f27976afdecd90e1c9279f47c073874f0baf97`, one-based inclusive lines [[1, 95]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Must minimum component item and minimum line ID come from one component? Expected: Independent MIN expressions can come from different rows. Must not claim: They identify one coherent component row.
- Does COUNT DISTINCT shipment ID protect TOTALTOQTY? Expected: Only the shipment count is distinct; joined SUM can be multiplied. Must not claim: All measures are deduplicated.
- Does COMPLETE prove the work order finished? Expected: COMPLETE aliases QTY_TO_BE_BUILT. Must not claim: COMPLETE is a completion Boolean.

## 123. Understanding inventory detail and aggregate grain

**Question:** Can detailed inventory rows and aggregate rows be summed interchangeably?

**What it does.** Detailed inventory joins serial numbers, which can repeat inventory quantities. The aggregate view groups location, item, company, lot, permanent state and location dimensions, uses MIN/sentinels for other fields, and counts distinct logistics units. Availability uses raw nullable quantity arithmetic and clamps negative or nonmatching comparisons to zero.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Choose the intended inventory key and account for serial expansion before summing. Evidence: `vr-sql-1700513437`, `vr-sql-1716513494`.
2. Check raw arithmetic, NULL behavior, mixed units and the aggregate override test that uses only MAX inventory ID. Evidence: `vr-sql-1700513437`, `vr-sql-1716513494`.

**What can affect it**

- Choose the intended inventory key and account for serial expansion before summing.
- Check raw arithmetic, NULL behavior, mixed units and the aggregate override test that uses only MAX inventory ID.

**What you can check**

- Choose the intended inventory key and account for serial expansion before summing.
- Check raw arithmetic, NULL behavior, mixed units and the aggregate override test that uses only MAX inventory ID.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-1700513437`: [dbo.METADATA_INSIGHT_INVENTORY_AGGREGATE_VIEW](sql/1700513437.sql); source-definition SHA-256 `7445faf7060be5c9b34966c41ddce135368a397d00fafd720957bb0657f367d8`, reading-copy SHA-256 `dfba1733225450f86aa32468c4953a56e0b6b81da5229f33bafa904c2de620e8`, one-based inclusive lines [[1, 165]].

`vr-sql-1716513494`: [dbo.METADATA_INSIGHT_INVENTORY_VIEW](sql/1716513494.sql); source-definition SHA-256 `33d99cda1a46997f70f5b04fe29f72ab9562a39a5379a55206935aa947f50603`, reading-copy SHA-256 `3827c98cbb279c708d87146efeb3c21bd9d12421f7b7b0ac6edf286fa063ef8f`, one-based inclusive lines [[1, 153]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Do two serial rows necessarily mean two separate inventory balances? Expected: Serial joins can repeat one inventory quantity. Must not claim: Every row is a unique inventory balance.
- Does one NULL quantity bucket use the displayed zero fallback in availability? Expected: Availability uses raw buckets; NULL arithmetic can select the zero branch. Must not claim: Displayed coalesced bucket aliases feed availability.
- Does aggregate OVERRIDES examine every inventory ID? Expected: Its lookup uses MAX(INTERNAL_LOCATION_INV). Must not claim: It checks all grouped IDs.

## 124. Understanding catch weight and transaction attribute grain

**Question:** Why can catch weight, its unit and serial number appear on separate history rows?

**What it does.** METADATA_INSIGHT_TRAN_HIST_VIEW applies each linked attribute row separately, with CASE values and no pivot. TRANSACTION_HISTORY_INVENTORY_ATTRIBUTE_VIEW instead aggregates selected attribute types with MAX. In detailed inventory, a nonzero combined catch weight replaces stored total weight, while the weight-unit choice is evaluated separately.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Distinguish row-per-attribute APPLY from MAX-based attribute aggregation. Evidence: `vr-sql-1732513551`, `vr-sql-1796513779`, `vr-sql-1716513494`.
2. Check TRY_CAST outcomes and independent catch-weight versus weight-unit fallback. Evidence: `vr-sql-1732513551`, `vr-sql-1796513779`, `vr-sql-1716513494`.

**What can affect it**

- Distinguish row-per-attribute APPLY from MAX-based attribute aggregation.
- Check TRY_CAST outcomes and independent catch-weight versus weight-unit fallback.

**What you can check**

- Distinguish row-per-attribute APPLY from MAX-based attribute aggregation.
- Check TRY_CAST outcomes and independent catch-weight versus weight-unit fallback.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-1732513551`: [dbo.METADATA_INSIGHT_TRAN_HIST_VIEW](sql/1732513551.sql); source-definition SHA-256 `b26a2afe0617a618063ec8ea437e4138aead85d98f8951ec1028d9e6cf1a690a`, reading-copy SHA-256 `9a096d5195787df12c19962982137b7c4c68aa9c4d89b2ee1ef1ba637c74f826`, one-based inclusive lines [[1, 82]].

`vr-sql-1796513779`: [dbo.TRANSACTION_HISTORY_INVENTORY_ATTRIBUTE_VIEW](sql/1796513779.sql); source-definition SHA-256 `cf823b5e6940584fd2da6108d8d0f27bf7a7019e2bdf16f75c897fa55e2be438`, reading-copy SHA-256 `ef28f79875318288c3d93527c4069b9ab651145fb5e6cb0d7afd2a7b832f1bb8`, one-based inclusive lines [[1, 65]].

`vr-sql-1716513494`: [dbo.METADATA_INSIGHT_INVENTORY_VIEW](sql/1716513494.sql); source-definition SHA-256 `33d99cda1a46997f70f5b04fe29f72ab9562a39a5379a55206935aa947f50603`, reading-copy SHA-256 `3827c98cbb279c708d87146efeb3c21bd9d12421f7b7b0ac6edf286fa063ef8f`, one-based inclusive lines [[1, 153]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does insight history combine weight and unit attribute rows into one row? Expected: Its APPLY does not aggregate; separate attributes remain separate rows. Must not claim: All attributes are pivoted into one row.
- What happens to a nonnumeric catch weight? Expected: TRY_CAST returns NULL for a failed numeric conversion. Must not claim: Invalid text becomes zero.
- Can a zero catch-weight value use stored weight but a catch-weight unit? Expected: Weight and unit use separate CASE conditions. Must not claim: Both always come from the same fallback source.

## 125. Understanding dock occupancy display states

**Question:** Does a dock empty indicator prove all physical inventory is gone?

**What it does.** Dock views use selected location statuses, fixed class/subclass filters or summed inventory buckets. One quantity view prioritizes positive transit over positive on-hand quantity; nonpositive or NULL sums fall through. The staging-area empty flag tests the area status, not whether every child is empty.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Read the exact status/quantity rule used by the selected view. Evidence: `vr-sql-832058050`, `vr-sql-848058107`, `vr-sql-864058164`, `vr-sql-912058335`, `vr-sql-944058449`.
2. Distinguish child-position counts from area status and root-container grouping by child dock type. Evidence: `vr-sql-832058050`, `vr-sql-848058107`, `vr-sql-864058164`, `vr-sql-912058335`, `vr-sql-944058449`.

**What can affect it**

- Read the exact status/quantity rule used by the selected view.
- Distinguish child-position counts from area status and root-container grouping by child dock type.

**What you can check**

- Read the exact status/quantity rule used by the selected view.
- Distinguish child-position counts from area status and root-container grouping by child dock type.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-832058050`: [dbo.DOCK_AREA_EMPTY_POSITION](sql/832058050.sql); source-definition SHA-256 `6b0ab4cdf42e75d0ce59bf77b63bd55dc6283a6c0b1c9929c09dcbf534b45c39`, reading-copy SHA-256 `e34d8b742d87113ade3c6ac9392e4fc1e93f7302ce612da026154f854ab6bd0a`, one-based inclusive lines [[1, 15]].

`vr-sql-848058107`: [dbo.DOCK_AREA_PERCENTAGE](sql/848058107.sql); source-definition SHA-256 `ec6149855e83dce2850e9d24fcc075aac9c6fc0f28111c5dff1b383bb6bd10a6`, reading-copy SHA-256 `21186b60cac350eb4c6fa179aa21cd933302f20e5e66f3014630f9c6e6ae66b2`, one-based inclusive lines [[1, 48]].

`vr-sql-864058164`: [dbo.DOCK_AREA_POSITION](sql/864058164.sql); source-definition SHA-256 `a446831754c75dc23af78a4a9e9b69541e5d3e54568ebfc08866dd4dac4df986`, reading-copy SHA-256 `ebaf9a6c4cb63f1654ec47b2f00833c7e712743b5925b200f99ee6a5c4ba4829`, one-based inclusive lines [[1, 54]].

`vr-sql-912058335`: [dbo.DOCK_DOOR](sql/912058335.sql); source-definition SHA-256 `b403389829b5bad84f994feea8291f307fea58efa8b3289babab53b23c607ad6`, reading-copy SHA-256 `ff4104eab0fc3a4167fa589fa83a51b0d82ccf4a3bb5b30333bf0aa383acf003`, one-based inclusive lines [[1, 37]].

`vr-sql-944058449`: [dbo.DOCK_MGR_SHIPPING_CONTAINER](sql/944058449.sql); source-definition SHA-256 `9b91b096f828483ecfeeaed385cd9f2659cc1ffd908c926f83c1d6a55ac20bb5`, reading-copy SHA-256 `36b93111232f74047ce83e7c7a3b1938adcca4cced6f8861aedf4b988b6ce341`, one-based inclusive lines [[1, 182]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Transit and on-hand sums are positive. Which quantity display branch wins? Expected: The positive transit branch precedes on-hand. Must not claim: On-hand has precedence.
- Does IS_AREA_EMPTY require every child position empty? Expected: It tests the area location status. Must not claim: It universally checks child emptiness.
- Can one root appear more than once when children occupy different dock types? Expected: The root view groups by child dock-location type. Must not claim: One row per root is guaranteed.

## 126. Understanding warehouse boundaries in location views

**Question:** Are all location text joins constrained to the same warehouse?

**What it does.** Some dock-position views join container LOCATION to LOCATION text without a warehouse predicate. Shipment transit-location branches also differ in warehouse and status checks. Other container transit-location joins explicitly include warehouse. The exact view and branch matter.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Compare LOCATION text plus warehouse predicates in each branch. Evidence: `vr-sql-880058221`, `vr-sql-896058278`, `vr-sql-1968062097`, `vr-sql-1984062154`, `vr-sql-2064062439`, `vr-sql-2080062496`.
2. Do not transfer a status threshold or warehouse condition from one UNION branch to another. Evidence: `vr-sql-880058221`, `vr-sql-896058278`, `vr-sql-1968062097`, `vr-sql-1984062154`, `vr-sql-2064062439`, `vr-sql-2080062496`.

**What can affect it**

- Compare LOCATION text plus warehouse predicates in each branch.
- Do not transfer a status threshold or warehouse condition from one UNION branch to another.

**What you can check**

- Compare LOCATION text plus warehouse predicates in each branch.
- Do not transfer a status threshold or warehouse condition from one UNION branch to another.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-880058221`: [dbo.DOCK_AREA_POSITIONS_CARRIER](sql/880058221.sql); source-definition SHA-256 `4a16a8cf287c173a7e85c04ee6f6852ea850665302a3c724e4209f0b73729e56`, reading-copy SHA-256 `f53cff9f8e7fd8b23c3f743c3969c6c6b1c9cfe78119fce8b12e880bc663b301`, one-based inclusive lines [[1, 36]].

`vr-sql-896058278`: [dbo.DOCK_AREA_POSITIONS_LOAD](sql/896058278.sql); source-definition SHA-256 `abbcefedc5af3711db64f159d700b9c6fa1ca597e2f42fd6f66f016a6a28345e`, reading-copy SHA-256 `717b9c00f5d5cab68c19f6ea09cfafb06d34371a855e90b77669a86456ed1edf`, one-based inclusive lines [[1, 39]].

`vr-sql-1968062097`: [dbo.SHIPMENT_HEADER_IN_TRANSIT](sql/1968062097.sql); source-definition SHA-256 `06202ce4c3d82c072edfbfd52fd4e83b86bd55cff0e5b561b2c566ce793f631f`, reading-copy SHA-256 `d1366e29bb5958e00e493bf1341d5706aaf9a4a932ff9287d72b972aa6467bf7`, one-based inclusive lines [[1, 37]].

`vr-sql-1984062154`: [dbo.SHIPMENT_HEADER_ON_HAND](sql/1984062154.sql); source-definition SHA-256 `e1f7a139477a3198ec22f399d6b21ce7dc7615a36130a0db07872831dffd9752`, reading-copy SHA-256 `52ba63a7c93ee51057f69fc3b8c866a0c5115702747a06e46a5c0a17f0360b3e`, one-based inclusive lines [[1, 17]].

`vr-sql-2064062439`: [dbo.SHIPPING_CONTAINER_IN_TRANSIT](sql/2064062439.sql); source-definition SHA-256 `d414228ed5daa28951c4a2b5a9e2e28abf58697b8efc11ffe37cc049a0558ff7`, reading-copy SHA-256 `f2ed5620adfc85abc109215c263d3da89a41d070a2eb5a8c4716e26b25b70796`, one-based inclusive lines [[1, 36]].

`vr-sql-2080062496`: [dbo.SHIPPING_CONTAINER_ON_HAND](sql/2080062496.sql); source-definition SHA-256 `17ddec810b0bfefb76ccb4349821b477032cfcc5222ab2ab265b9b548c345d9e`, reading-copy SHA-256 `4ffb1376173d07374279b17e8a1ed37c70c59d5ba2c1de2a8899028538d9a46a`, one-based inclusive lines [[1, 14]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Can equal location text in different warehouses cross-associate in the dock carrier view? Expected: Its container/location text join lacks warehouse equality. Must not claim: The join always isolates warehouses.
- Does shipment transit work use the first branch trailing-status threshold? Expected: The work branch does not repeat that threshold. Must not claim: The threshold applies globally.
- Does an on-hand location view prove positive on-hand quantity? Expected: It projects stored non-NULL container locations without a positive quantity test. Must not claim: Location presence proves positive physical quantity.

## 127. Understanding multi-order pallet location choices

**Question:** Do multi-order pallet views return a deterministic unique location?

**What it does.** MOP views use unordered TOP 1 selections for child/self location and work zone. AND conditions bind only to the self arm in those OR expressions, so child rows may satisfy an arm even with NULL values. Some views require a pallet, while one reads warehouse from an optional pallet join.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Check parentless/container status and required versus optional pallet joins. Evidence: `vr-sql-60579304`, `vr-sql-1168059247`, `vr-sql-1696061128`, `vr-sql-1881318012`.
2. Inspect TOP 1 ordering and OR/AND grouping before assuming a unique non-NULL location. Evidence: `vr-sql-60579304`, `vr-sql-1168059247`, `vr-sql-1696061128`, `vr-sql-1881318012`.

**What can affect it**

- Check parentless/container status and required versus optional pallet joins.
- Inspect TOP 1 ordering and OR/AND grouping before assuming a unique non-NULL location.

**What you can check**

- Check parentless/container status and required versus optional pallet joins.
- Inspect TOP 1 ordering and OR/AND grouping before assuming a unique non-NULL location.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-60579304`: [dbo.TRAV_MULTI_ORDER_PALLET_VIEW](sql/60579304.sql); source-definition SHA-256 `dd08fdd66721638245356796f6f6dcf944bb05083155fb872d9a01053ba0fb46`, reading-copy SHA-256 `1e9eab07c041b7d8da36338cfc6e48cdbc0f466d95b76bea63ba9ee2f732810a`, one-based inclusive lines [[1, 29]].

`vr-sql-1168059247`: [dbo.METADATA_INSIGHT_MOP_VIEW](sql/1168059247.sql); source-definition SHA-256 `7d9ef9354f879edc7d0c372ef124ae96330f30e1db736d887c3d625dc32b780d`, reading-copy SHA-256 `7cdbd6b8dc6528b1c9e4e32c28330991ff54797b654db551b452cf595ea20125`, one-based inclusive lines [[1, 42]].

`vr-sql-1696061128`: [dbo.MULTI_ORDER_PALLET_VIEW](sql/1696061128.sql); source-definition SHA-256 `0fec1979536c17ba24ce40776034e4e7a325be02330ebd7008e94c494e62a859`, reading-copy SHA-256 `4c21521afa35830ed923121ba8542aaa8496920d34221b806031688ed0dcdb80`, one-based inclusive lines [[1, 35]].

`vr-sql-1881318012`: [dbo.TRAV_METADATA_INSIGHT_MOP_VIEW](sql/1881318012.sql); source-definition SHA-256 `6b90c44761ffd4fd787d7fe70cf43d9db054a5a7f1a170fb236b65aab94dfff1`, reading-copy SHA-256 `0331976f5fe29b0b7e7313878d7cb3289f6a8726cdc28358d81c1fae7249e4c4`, one-based inclusive lines [[1, 44]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Is TOP 1 the most recent child location? Expected: There is no ORDER BY defining recency. Must not claim: The latest location is selected.
- Do the non-NULL predicates constrain every child arm? Expected: AND binds to the self arm in the captured expression. Must not claim: Every child location is checked non-NULL.
- Must warehouse be populated from the container in every MOP view? Expected: The active-status variant projects warehouse from optional pallet context. Must not claim: Warehouse always comes from the container.

## 128. Understanding placeholder and display-only view fields

**Question:** Do manifest or split view values demonstrate an executed operation?

**What it does.** The manifest presentation view returns one row of NULL placeholders plus current UTC time without reading a manifest table. The split view initializes a numeric split quantity to zero. Wave and cycle-count CASE flags classify stored fields; selecting these views does not execute their named operations.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Distinguish literal/NULL/time expressions from stored business values. Evidence: `vr-sql-1152059190`, `vr-sql-28579190`, `vr-sql-1504060444`, `vr-sql-1088058962`.
2. Read ordered CASE precedence without interpreting display flags as action authorization. Evidence: `vr-sql-1152059190`, `vr-sql-28579190`, `vr-sql-1504060444`, `vr-sql-1088058962`.

**What can affect it**

- Distinguish literal/NULL/time expressions from stored business values.
- Read ordered CASE precedence without interpreting display flags as action authorization.

**What you can check**

- Distinguish literal/NULL/time expressions from stored business values.
- Read ordered CASE precedence without interpreting display flags as action authorization.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-1152059190`: [dbo.METADATA_INSIGHT_MANIFEST_VIEW](sql/1152059190.sql); source-definition SHA-256 `4d111160cd7af35cd4f6de92b12909775eb701db91b132efc3cbd8d30b91f456`, reading-copy SHA-256 `82249b9a0e4040911baaa5fa5e9612f9de507b0917e3d80516a1983a6217291a`, one-based inclusive lines [[1, 20]].

`vr-sql-28579190`: [dbo.SPLIT_SHIPMENT_VIEW](sql/28579190.sql); source-definition SHA-256 `066904bd36fed4cf824c0a7f1f2ad67716787de9ecbd3a40a20e86ed9b1c19d4`, reading-copy SHA-256 `7f73b3ff53101008855ae9f6edc1c5e687552a996f48a3448a5a0313e2b2b0fd`, one-based inclusive lines [[1, 20]].

`vr-sql-1504060444`: [dbo.METADATA_INSIGHT_WAVE_VIEW](sql/1504060444.sql); source-definition SHA-256 `be9dde31aac7ba763ae3924fbeb00d2391aca524d88d16883beaae66a5901e65`, reading-copy SHA-256 `06a6941ce343421b5285fa5bbde8e44cab8dc0fc6a436b5c26fc225e112d34e1`, one-based inclusive lines [[1, 57]].

`vr-sql-1088058962`: [dbo.METADATA_INSIGHT_CYCLE_COUNT_REQUEST_VIEW](sql/1088058962.sql); source-definition SHA-256 `4d16c5f8697beb3d5f1792d86c5afdbc7bdf3c84ff826ee9a4c1efea3f6258d0`, reading-copy SHA-256 `9b80a7121bdac90a8b5db67a084def5e942f4a636bd66c188d1629bbacdcee07`, one-based inclusive lines [[1, 57]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Is the manifest ship date an observed shipment event? Expected: It is GETUTCDATE() in a scalar presentation row. Must not claim: It records a confirmed shipment event.
- Does zero SPLIT_QUANTITY update the shipment line? Expected: It initializes an output value only. Must not claim: A split was saved.
- Do cycle-count action flags execute or authorize the action? Expected: They are CASE presentation expressions over stored selectors. Must not claim: The action is executed or permission enforced.

## 129. Understanding authorization metadata in selection views

**Question:** Do these selection views enforce the caller warehouse or company access?

**What it does.** Container-type, wave-master, manual replenishment and menu views expose authorization metadata. Their bodies do not bind a caller identity to a selected warehouse/company. LEFT JOIN conditions can preserve a master with NULL authorization rows; some views also expose inactive definitions.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Separate projected authorization fields from WHERE predicates enforcing a caller scope. Evidence: `vr-sql-816057993`, `vr-sql-1648060957`, `vr-sql-1748513608`, `vr-sql-1488060387`.
2. Account for unmatched LEFT JOIN authorization rows and per-view ACTIVE filters. Evidence: `vr-sql-816057993`, `vr-sql-1648060957`, `vr-sql-1748513608`, `vr-sql-1488060387`.

**What can affect it**

- Separate projected authorization fields from WHERE predicates enforcing a caller scope.
- Account for unmatched LEFT JOIN authorization rows and per-view ACTIVE filters.

**What you can check**

- Separate projected authorization fields from WHERE predicates enforcing a caller scope.
- Account for unmatched LEFT JOIN authorization rows and per-view ACTIVE filters.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-816057993`: [dbo.CONTAINER_TYPE_AUTHORIZED_COMPANY_VIEW](sql/816057993.sql); source-definition SHA-256 `cbb75813e70d728a0d4ce6831b3881bc9d63fe92856a8db194f86e2a3caeb6df`, reading-copy SHA-256 `c2f81b2054fdcb6b9eef6875ad23b4ce29205b331ca825a99a1c089bba1d0ba6`, one-based inclusive lines [[1, 12]].

`vr-sql-1648060957`: [dbo.METADATA_TRANS_WAVE_MASTER_VIEW](sql/1648060957.sql); source-definition SHA-256 `90b4c7af8d4e13fad184962323adc2c589e49211d33be71e7375dacca3270448`, reading-copy SHA-256 `15d7bd64f4094e83c0e1f216ce9b3c1f5644f5aed18b53b9b7a25f80de7b5d9f`, one-based inclusive lines [[1, 24]].

`vr-sql-1748513608`: [dbo.METADATA_TRANS_MANUAL_REPLENISHMENT_VIEW](sql/1748513608.sql); source-definition SHA-256 `442f344c95bee2e6e4f3e6b9f6e9ecfd2300b8b95994e5a096f1f04306a652ac`, reading-copy SHA-256 `aff6798e34e7ea1f49cc897ce5872978f23e3343222eb2c353ec3475e4e4b768`, one-based inclusive lines [[1, 20]].

`vr-sql-1488060387`: [dbo.METADATA_INSIGHT_WAREHOUSE_MOBILE_MENU_VIEW](sql/1488060387.sql); source-definition SHA-256 `36b6a79062054930feb131269541bd33e8661ef771d60ea04f09576dbcbab026`, reading-copy SHA-256 `a84ce02cb8b6fa97555137daa388281b643fd013d90e100da81fd606e78667b8`, one-based inclusive lines [[1, 38]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does NULL authorized warehouse remove an active wave master? Expected: The LEFT JOIN preserves the master. Must not claim: Missing authorization always removes it.
- Is the replenishment authorization restriction a WHERE filter? Expected: It occurs in the LEFT JOIN ON clause. Must not claim: It filters the master out.
- Are only active mobile menu definitions exposed? Expected: The menu view has no ACTIVE predicate. Must not claim: Inactive definitions cannot appear.

## 130. Understanding service configuration and resource projections

**Question:** Do configuration/resource views establish effective settings or secret values?

**What it does.** The SSO view unions feature-selected record-type rows with a fixed-key lookup lacking a record-type restriction. A standalone service view uses scalar configuration lookups and unordered TOP 1 active warehouse. The resource view exposes BASE_TEXT and CUSTOM_TEXT separately, without choosing the effective override. No returned configuration or credential values were queried.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Compare scalar cardinality, feature selection and the second SSO branch scope. Evidence: `vr-sql-1684513380`, `vr-sql-1780513722`, `vr-sql-1764513665`.
2. Keep source structure separate from actual settings, login success and effective text resolution. Evidence: `vr-sql-1684513380`, `vr-sql-1780513722`, `vr-sql-1764513665`.

**What can affect it**

- Compare scalar cardinality, feature selection and the second SSO branch scope.
- Keep source structure separate from actual settings, login success and effective text resolution.

**What you can check**

- Compare scalar cardinality, feature selection and the second SSO branch scope.
- Keep source structure separate from actual settings, login success and effective text resolution.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-1684513380`: [dbo.GET_CLIENT_SSO_VIEW](sql/1684513380.sql); source-definition SHA-256 `a50d82bf4f7030e998c267bc2ed16b176824cb64b2dffcb815cf98fa3cd485e9`, reading-copy SHA-256 `3b0729f3c470e6866379fe8ff417bf96e547ca1bbe2fef7a00a0bdf962f0729b`, one-based inclusive lines [[1, 18]].

`vr-sql-1780513722`: [dbo.STANDALONE_SERVICE_PROPERTIES_VIEW](sql/1780513722.sql); source-definition SHA-256 `7775fae513dd0bfcf23df4dd906ef7ca4a72fe345fb921e5d44b42422aef831a`, reading-copy SHA-256 `70f3b1f6ed7e19c23cd04c85ce3816861b6665831ccdc2a8df77fbed353a8035`, one-based inclusive lines [[1, 8]].

`vr-sql-1764513665`: [dbo.RESOURCE_FILE_BASE_CUSTOM_VIEW](sql/1764513665.sql); source-definition SHA-256 `b9ddde99971851781db136bb275f0a3504e0bd483c2cd5797b20d4c9a287f49d`, reading-copy SHA-256 `c9b4f27a4ec07a78ac0909f40a6054964853d9d875268eed5fbe16cec3455d2a`, one-based inclusive lines [[1, 18]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the fixed SSO key branch constrain record type? Expected: It filters SYS_KEY only. Must not claim: It applies the first branch record type.
- Is the service warehouse choice deterministic with several active warehouses? Expected: TOP 1 has no ORDER BY. Must not claim: A preferred warehouse is guaranteed.
- Does the resource view choose custom text over base text? Expected: It exposes both text columns separately. Must not claim: It computes a custom-wins effective string.

## 131. Understanding purchase-order detail, header and TPM views

**Question:** Are purchase-order header insight rows unique per order?

**What it does.** Insight header views expand headers by detail and repeat open/closed flags. Their receipt lookup is TOP 1 without ordering. TPM line status requires a header through INNER JOIN, whereas the non-TPM detail insight uses LEFT JOIN. The base header aggregate groups by header ID and calculates detail sums without unit normalization.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Identify header expansion versus header aggregation and INNER versus LEFT joins. Evidence: `vr-sql-1200059361`, `vr-sql-1216059418`, `vr-sql-1392060045`, `vr-sql-1408060102`, `vr-sql-1728061242`.
2. Check unordered receipt selection, repeated flags and weight-unit interpretation. Evidence: `vr-sql-1200059361`, `vr-sql-1216059418`, `vr-sql-1392060045`, `vr-sql-1408060102`, `vr-sql-1728061242`.

**What can affect it**

- Identify header expansion versus header aggregation and INNER versus LEFT joins.
- Check unordered receipt selection, repeated flags and weight-unit interpretation.

**What you can check**

- Identify header expansion versus header aggregation and INNER versus LEFT joins.
- Check unordered receipt selection, repeated flags and weight-unit interpretation.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-1200059361`: [dbo.METADATA_INSIGHT_PURCHASE_ORDER_DETAIL_VIEW](sql/1200059361.sql); source-definition SHA-256 `2d079e18cfa6ef645d552000bfdd03c4f1ee7f13d9c23038fab762ebe372cb56`, reading-copy SHA-256 `40ab0f565a0f2aa543fcd885bc521fb217798a3634e0244f546ac306934284e9`, one-based inclusive lines [[1, 106]].

`vr-sql-1216059418`: [dbo.METADATA_INSIGHT_PURCHASE_ORDER_HEADER_VIEW](sql/1216059418.sql); source-definition SHA-256 `3f25ef3f7d12c52b5208cc92dd319607b2dfcbd1522f408e89d603fed36e4136`, reading-copy SHA-256 `c8426978e5642bcf4dfcdbb729f3dbed8c0556de7f2d72766771802c0ea4a719`, one-based inclusive lines [[1, 106]].

`vr-sql-1392060045`: [dbo.METADATA_INSIGHT_TPM_PURCHASE_ORDER_HEADER_VIEW](sql/1392060045.sql); source-definition SHA-256 `a24958c20941bfa881f345c1070ec9cd94946b22c4223405c8f9b9df62537053`, reading-copy SHA-256 `2cd03728c8608fab64fa2d463feac634ba51371c78e722b4efaaefef5aa8e2c3`, one-based inclusive lines [[1, 104]].

`vr-sql-1408060102`: [dbo.METADATA_INSIGHT_TPM_PURCHASE_ORDER_LINE_STATUS_VIEW](sql/1408060102.sql); source-definition SHA-256 `5a37289deac7d6816dac887a014f293fb234a98966ac26015ea702aaae37bf07`, reading-copy SHA-256 `5e22de6bd15ae873caaa213c3ef3d388ccbf0c156bdcb727c04170c63233ef6b`, one-based inclusive lines [[1, 106]].

`vr-sql-1728061242`: [dbo.PURCHASE_ORDER_HEADER_VIEW](sql/1728061242.sql); source-definition SHA-256 `3e1944edd254a2253e0bd2dcc2848ab920b45990b1c3ee00537ee973cd835da1`, reading-copy SHA-256 `33b346640a53c4bef519d29661b03dd82bfc1c52eaeebc015d974ee046ffdc46`, one-based inclusive lines [[1, 67]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Can open-order flags be summed as unique orders in header insight? Expected: Each detail can repeat the header flag. Must not claim: Every row is one unique order.
- Will orphan detail survive both TPM and non-TPM detail views? Expected: The non-TPM LEFT JOIN preserves it; TPM INNER JOIN excludes it. Must not claim: Both views preserve orphan detail.
- Does MAX weight unit normalize purchase-order weight totals? Expected: It chooses a label without unit conversion. Must not claim: Mixed units are converted before summing.

## 132. Understanding receipt detail and appointment fanout

**Question:** Why do receipt views sometimes repeat header or line quantities?

**What it does.** Receipt insight combines lines, appointments, containers and unfulfilled immediate-needs requests. Multiple matches can multiply rows; immediate needs are joined by item/company without warehouse. Receipt header view also repeats headers per appointment. Container pre-check-in quantity uses open receipt sums minus status-100 container quantities and may be NULL.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Choose a header, line, container or appointment grain explicitly before aggregation. Evidence: `vr-sql-66359551`, `vr-sql-1264059589`, `vr-sql-1280059646`, `vr-sql-1760061356`.
2. Check missing scalar matches, open-header conditions and the immediate-needs join scope. Evidence: `vr-sql-66359551`, `vr-sql-1264059589`, `vr-sql-1280059646`, `vr-sql-1760061356`.

**What can affect it**

- Choose a header, line, container or appointment grain explicitly before aggregation.
- Check missing scalar matches, open-header conditions and the immediate-needs join scope.

**What you can check**

- Choose a header, line, container or appointment grain explicitly before aggregation.
- Check missing scalar matches, open-header conditions and the immediate-needs join scope.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-66359551`: [dbo.METADATA_INSIGHT_RECEIPT_VIEW](sql/66359551.sql); source-definition SHA-256 `8138418852744dd64fc1c41f93dfc26489c2ee9c8ff85334e10d6ea6379c9e5f`, reading-copy SHA-256 `7ad94e80f06088ea709136819e9017633db4f5501ba1870a161c520e1252abf2`, one-based inclusive lines [[1, 188]].

`vr-sql-1264059589`: [dbo.METADATA_INSIGHT_RECEIPT_CONTAINER_VIEW](sql/1264059589.sql); source-definition SHA-256 `d09314eaeb80377b549829194015db69545f2b137b0b930b9ef54d954a0ca653`, reading-copy SHA-256 `1a90b5e81947f4cdf94929c864f365684a689a165b75cc24df525063f4a451b2`, one-based inclusive lines [[1, 222]].

`vr-sql-1280059646`: [dbo.METADATA_INSIGHT_RECEIPT_LINE_VIEW](sql/1280059646.sql); source-definition SHA-256 `85d83e311d2f3d45df4186e0d33abba393f3dd9d492d3ff6fb506e49bc7df575`, reading-copy SHA-256 `ecb27e1ccd04eaafdce6768137bfd18ef391bbafd8ed51043f5a326b84b8fdff`, one-based inclusive lines [[1, 109]].

`vr-sql-1760061356`: [dbo.RECEIPT_HEADER_VIEW](sql/1760061356.sql); source-definition SHA-256 `637c57d529c928e9fe050f3ec03c1570b806e2c9da0f14bd6001e10e61d66c37`, reading-copy SHA-256 `f1bb1f5f29945484395931376c25f8eb53e8180e3d919447ca7834eddcdaec73`, one-based inclusive lines [[1, 100]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does immediate-needs matching guarantee the same warehouse? Expected: The reviewed join has item/company but no warehouse predicate. Must not claim: Warehouse isolation is explicit.
- Does a closed header get pre-check-in quantity zero? Expected: The open-header SUM expressions can yield NULL. Must not claim: Closed headers always return zero.
- Does the receipt header view pick one appointment? Expected: It LEFT JOINs all matching appointments without TOP or aggregation. Must not claim: One appointment is selected.

## 133. Understanding shipment pool and shipment insight boundaries

**Question:** Are shipment pool and shipment insight disjoint complementary sets?

**What it does.** The standard pool filters leading status below 300, with a redundant status-80 alternative. Shipment insight uses trailing status at least 300 or leading status at least 300 with trailing 80. These are different predicates, not complements. Line expansion repeats header totals; the custom TRAV pool additionally sums header weight after line expansion by customer.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Compare leading and trailing status fields rather than relying on view names. Evidence: `vr-sql-1145875249`, `vr-sql-1161875306`, `vr-sql-1762209428`, `vr-sql-1312059760`.
2. Account for detail/VAS expansion and the custom customer window sum before aggregating. Evidence: `vr-sql-1145875249`, `vr-sql-1161875306`, `vr-sql-1762209428`, `vr-sql-1312059760`.

**What can affect it**

- Compare leading and trailing status fields rather than relying on view names.
- Account for detail/VAS expansion and the custom customer window sum before aggregating.

**What you can check**

- Compare leading and trailing status fields rather than relying on view names.
- Account for detail/VAS expansion and the custom customer window sum before aggregating.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-1145875249`: [dbo.METADATA_INSIGHT_SHIPMENT_POOL_VIEW](sql/1145875249.sql); source-definition SHA-256 `18bc8c74ed9231e6592501442ff2df9ceb7a292d9f2c526db3a2096d089ab747`, reading-copy SHA-256 `cfecb225abe0e11513da84dc579d9f543156046cf977022a2f05b474a2e395f3`, one-based inclusive lines [[1, 338]].

`vr-sql-1161875306`: [dbo.METADATA_INSIGHT_SHIPMENT_VIEW](sql/1161875306.sql); source-definition SHA-256 `cf73c25210b300bc4f2ae24e5790afda5ec684ada7a2985744e6efff2990b872`, reading-copy SHA-256 `d2266c863e92100586a58330a615a8ba35f66aec4e9b2c9b4118eedb74f9e59f`, one-based inclusive lines [[1, 384]].

`vr-sql-1762209428`: [dbo.TRAV_METADATA_INSIGHT_SHIPMENT_POOL_VIEW](sql/1762209428.sql); source-definition SHA-256 `44cbb2c0a60090472dc9778e574ae7bfdab34bf73e31dc9818375deae96d9c95`, reading-copy SHA-256 `bc0e4fe4a3faca252f271a9ef891c8d5301f75ec6b7e8594dbdcfc24fbb02c40`, one-based inclusive lines [[1, 56]].

`vr-sql-1312059760`: [dbo.METADATA_INSIGHT_SHIPMENT_DETAIL_VIEW](sql/1312059760.sql); source-definition SHA-256 `1173ac6377ed89331911dfcad276df2286fa9a314b935de02fb3056c9a977da0`, reading-copy SHA-256 `a41f1950bac5681c0cf513c6f467b69af69ff608371ac58c209ed1b1b31ad391`, one-based inclusive lines [[1, 191]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Can a leading-below-300 and trailing-at-least-300 shipment satisfy both views? Expected: Those predicates can both hold. Must not claim: The sets are guaranteed disjoint.
- Does custom customer weight count each shipment only once? Expected: The window sum follows detail expansion and can repeat header weight. Must not claim: It deduplicates shipment weights.
- Can VAS activities repeat a shipment detail quantity? Expected: The detail insight LEFT JOINs VAS activity rows. Must not claim: Each detail always appears once.

## 134. Understanding lot counts and shipped-lot scope

**Question:** Does lot number of locations count distinct physical locations?

**What it does.** Lot views count matching LOCATION_INVENTORY rows with any nonzero quantity bucket, including negative values, rather than DISTINCT locations. Retained lots use current inventory for the count. Recall and shipped-lot views combine current and retained containers/headers with UNION ALL and apply a status-function threshold; shipped lots additionally require non-NULL LOT.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Distinguish row count from distinct location count and current inventory from retained lot metadata. Evidence: `vr-sql-1056058848`, `vr-sql-1136059133`, `vr-sql-508580900`, `vr-sql-524580957`, `vr-sql-540581014`.
2. Inspect UNION ALL overlap, strict threshold comparison and non-NULL lot filtering. Evidence: `vr-sql-1056058848`, `vr-sql-1136059133`, `vr-sql-508580900`, `vr-sql-524580957`, `vr-sql-540581014`.

**What can affect it**

- Distinguish row count from distinct location count and current inventory from retained lot metadata.
- Inspect UNION ALL overlap, strict threshold comparison and non-NULL lot filtering.

**What you can check**

- Distinguish row count from distinct location count and current inventory from retained lot metadata.
- Inspect UNION ALL overlap, strict threshold comparison and non-NULL lot filtering.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-1056058848`: [dbo.LOT_VIEW](sql/1056058848.sql); source-definition SHA-256 `587f154c878df46bc6bfbc0db06d6446b0d4c2baedb1063e0948161d889be5ed`, reading-copy SHA-256 `7cfee44af6e873e39636e23aa49d51febb732be7bc9101a0c7e460bb974413ba`, one-based inclusive lines [[1, 37]].

`vr-sql-1136059133`: [dbo.METADATA_INSIGHT_LOT_VIEW](sql/1136059133.sql); source-definition SHA-256 `7b825dfff952e8b29e222a7421cc68a04b643507782813c70e0680ea0462c3ba`, reading-copy SHA-256 `77ccabca0af6299da811042c6a1c848e03b380d67a28199c1e18051f5b6b3483`, one-based inclusive lines [[1, 27]].

`vr-sql-508580900`: [dbo.PRODUCT_RECALL_VIEW](sql/508580900.sql); source-definition SHA-256 `afad8eef17d2fd5b8698c52d9ed5e68e532288042624c233e5788bfb61c54d5e`, reading-copy SHA-256 `d5d40616670431d03c255355ae305a784bb130e0b880f8fd5c4d192e4b0dbd8b`, one-based inclusive lines [[1, 37]].

`vr-sql-524580957`: [dbo.SHIPPED_LOT_VIEW](sql/524580957.sql); source-definition SHA-256 `8a42deb5ef42b477fbf2940a6f3736fc190a5ecc6eb185f39ce1ac6b533651bb`, reading-copy SHA-256 `bba2aa51538f9d4f3539bc1d8a0d4572c1224b2096a7ba06cba90bcb3ed1b66f`, one-based inclusive lines [[1, 37]].

`vr-sql-540581014`: [dbo.METADATA_INSIGHT_SHIPPED_LOT_VIEW](sql/540581014.sql); source-definition SHA-256 `49b855a895d64cce9b882138ac9a914cfc24b89d3bcd5ebc81901fcb66650a10`, reading-copy SHA-256 `9ed4f6ec9f1b33af4fc0b8770e7a9700cda60e53d997109ebf25cd62cf83a733`, one-based inclusive lines [[1, 107]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Can several inventory records at one location increase the lot count? Expected: It uses COUNT(*) of matching inventory rows. Must not claim: It counts DISTINCT locations.
- Are negative inventory buckets excluded? Expected: Any nonzero bucket qualifies. Must not claim: Only positive balances qualify.
- Does LOT IS NOT NULL exclude empty text? Expected: Non-NULL empty text still satisfies that condition. Must not claim: It validates nonempty lot text.

## 135. Understanding VAS confirmation and QC context

**Question:** Are derived VAS confirmation values equivalent across all views?

**What it does.** The container VAS view maps one negative completion value to zero and every other value, including NULL, to one. Shipment-level and line-level views derive MIN-based confirmation over selected containers with different empty-result handling. QC history joins may exclude rows through a reason-type filter after a LEFT JOIN. None of these selections completes VAS or QC.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Read each CASE, MIN and empty-set fallback separately. Evidence: `vr-sql-2112062610`, `vr-sql-1936061983`, `vr-sql-2016062268`, `vr-sql-1584060729`, `vr-sql-1472060330`.
2. Check whether WHERE predicates null-reject rows from an apparent LEFT JOIN. Evidence: `vr-sql-2112062610`, `vr-sql-1936061983`, `vr-sql-2016062268`, `vr-sql-1584060729`, `vr-sql-1472060330`.

**What can affect it**

- Read each CASE, MIN and empty-set fallback separately.
- Check whether WHERE predicates null-reject rows from an apparent LEFT JOIN.

**What you can check**

- Read each CASE, MIN and empty-set fallback separately.
- Check whether WHERE predicates null-reject rows from an apparent LEFT JOIN.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-2112062610`: [dbo.Shipping_Container_VAS_Activity_Grid_View](sql/2112062610.sql); source-definition SHA-256 `9db866c55d3f1c3482ee523a5f46bfae265ab51dbf0e7d27049eec2638cf83e6`, reading-copy SHA-256 `b8d1dd9e86096b5f5826c253a9cbfc9d1de57a290b8aee5ff366a5d2b0c83ae4`, one-based inclusive lines [[1, 29]].

`vr-sql-1936061983`: [dbo.Shipment_Detail_VAS_Activity_Grid_View](sql/1936061983.sql); source-definition SHA-256 `9af6ff539945520f3c115fad8328ee3177bb360a2ed3b570277bf172c88fe878`, reading-copy SHA-256 `209fb5eae6c1bf35ac4bbe4fd0e52df18dff53f18069076e4fba363107a9f1ca`, one-based inclusive lines [[1, 64]].

`vr-sql-2016062268`: [dbo.Shipment_Header_VAS_Activity_Grid_View](sql/2016062268.sql); source-definition SHA-256 `08eae1f6eafdc81c813e60a1533c24bc9b83809dfba213df9d4d7abeec699c6d`, reading-copy SHA-256 `e0d39a649fb5082459649b4b803b1539e28e1743c588c111b9113baa717805df`, one-based inclusive lines [[1, 41]].

`vr-sql-1584060729`: [dbo.METADATA_RECEIPT_QUALITY_HISTORY](sql/1584060729.sql); source-definition SHA-256 `4b669a31828ac0bfca676f39414de2a809f6dee667c53e7e45deee791abd8c9a`, reading-copy SHA-256 `2aa6e6b3917e92236ec639a26e407c5ff329e72f49a31b0a3d13bff7234ff725`, one-based inclusive lines [[1, 12]].

`vr-sql-1472060330`: [dbo.METADATA_INSIGHT_VAS_VIEW](sql/1472060330.sql); source-definition SHA-256 `50328ce6d6b3434a45074fbfc6fa5e7150a9b1f7db50cc8493670e968acbd03b`, reading-copy SHA-256 `247627cee3791801fe159efb69027d008e3a6c78e19c4979e44113f0f431f70a`, one-based inclusive lines [[1, 32]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does NULL completion in container VAS map to zero? Expected: The negative-only CASE comparison falls through to ELSE one. Must not claim: NULL always means zero.
- Is line VAS container scope strictly the same shipment line? Expected: Its nested container selection is at shipment scope. Must not claim: It is restricted to that exact line.
- Can receipt QC history survive a missing reason mapping? Expected: The WHERE record-type predicate rejects the NULL reason join. Must not claim: The LEFT JOIN always preserves every history row.

## 136. Understanding ordered quantity and balance aggregates

**Question:** Does ITEM_ORDER_QUANTITY_VIEW show remaining unallocated demand?

**What it does.** It sums total shipment-detail quantity for headers with trailing status below 900, grouped by item, raw company, unit and warehouse. Inventory balance separately sums selected nonzero inventory buckets where location-class configuration qualifies. Display company/unit fallbacks do not change the raw GROUP BY keys.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Identify total quantity versus remaining/available demand and the header threshold. Evidence: `vr-sql-2098314735`, `vr-sql-2082314678`, `vr-sql-1545980784`.
2. Preserve unit/status grouping and distinguish NULL absent aggregates from zero. Evidence: `vr-sql-2098314735`, `vr-sql-2082314678`, `vr-sql-1545980784`.

**What can affect it**

- Identify total quantity versus remaining/available demand and the header threshold.
- Preserve unit/status grouping and distinguish NULL absent aggregates from zero.

**What you can check**

- Identify total quantity versus remaining/available demand and the header threshold.
- Preserve unit/status grouping and distinguish NULL absent aggregates from zero.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-2098314735`: [dbo.ITEM_ORDER_QUANTITY_VIEW](sql/2098314735.sql); source-definition SHA-256 `253e7d32a2318f74a0a177b2eac976a0fedf047ad33ab7a346ff68dba9d91e32`, reading-copy SHA-256 `fba76d3cd79a30c1e21b460780ad1ac5263adfff809864bae07cc33284476765`, one-based inclusive lines [[1, 22]].

`vr-sql-2082314678`: [dbo.INVENTORY_BALANCE_VIEW](sql/2082314678.sql); source-definition SHA-256 `180001b8eafa7cd2433112045f75883b7bed1a9febf312bd21ba8850a1157894`, reading-copy SHA-256 `f67de157ef6896a3b4cda4d405bc6ad697fe29a17321bc1be89581f0a6b8876f`, one-based inclusive lines [[1, 36]].

`vr-sql-1545980784`: [dbo.METADATA_INSIGHT_TPM_ORDER_STATUS_VIEW](sql/1545980784.sql); source-definition SHA-256 `bd8c493f153ba180b2a2305766025e47c80573dae7e74b025fbfdcfdc8f903a8`, reading-copy SHA-256 `77c04e6fa2fc6308556036b2d9c483a5fcb8090c44f0d174689cd4ad94780c29`, one-based inclusive lines [[1, 42]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Is total ordered quantity net of allocation? Expected: The view sums TOTAL_QTY without subtracting allocation. Must not claim: It returns remaining unallocated demand.
- Are absent TPM order aggregate counts zero? Expected: Missing grouped joins leave NULL counts. Must not claim: All missing counts are coalesced to zero.
- Do balance display fallback labels merge raw NULL/company groups? Expected: Grouping precedes display fallback and uses raw values. Must not claim: Fallback labels determine the GROUP BY.

## 137. Understanding managed-document file-name extraction

**Question:** Can reading document metadata retrieve the file or always derive a valid filename?

**What it does.** The document-management view projects metadata and derives a file name through reverse, substring and a selected path separator. It does not open or retrieve the document. A non-NULL source without the selected separator can yield a negative substring length; NULL source propagates NULL.

**What happens**

Trigger: A reader compares or aggregates data returned by the named views; installed application binding is unverified.

1. Treat stored source/path text as metadata; actual file access is outside the view. Evidence: `vr-sql-2114314792`.
2. Check NULL and missing-separator behavior in the expression. Evidence: `vr-sql-2114314792`.

**What can affect it**

- Treat stored source/path text as metadata; actual file access is outside the view.
- Check NULL and missing-separator behavior in the expression.

**What you can check**

- Treat stored source/path text as metadata; actual file access is outside the view.
- Check NULL and missing-separator behavior in the expression.

**Expected results and limits**

- A source-bounded explanation of row shape and its limits.
- Read definitions only; no SQL or business operation executed.
- Opaque selector labels, consuming query filters, complete transitive functions and live acceptance remain outside the stated contract.

**More detail and sources**

`vr-sql-2114314792`: [dbo.METADATA_INSIGHT_DOCUMENT_MANAGEMENT_VIEW](sql/2114314792.sql); source-definition SHA-256 `03057d5b147812c56fb50da0074910e2f8ef6b56e7f674e35cb63edebf1c920d`, reading-copy SHA-256 `5cad362ebc8813cbb6978a7d8d1739b7df4d017b170e1fec251802a7909167f2`, one-based inclusive lines [[1, 27]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does reading the view download the managed document? Expected: It projects metadata only. Must not claim: It retrieves file content.
- What can a missing selected separator cause? Expected: CHARINDEX zero leads to negative substring length and can fail. Must not claim: Every non-NULL path yields a valid filename.
- Does NULL source become a valid empty filename? Expected: NULL propagates through the string expression. Must not claim: NULL is normalized to a valid file name.

## 138. Fixed procedure calls and lexical dynamic flags

**Question:** Does EXEC @iError = Procedure mean the variable chooses a procedure?

**What it does.** No. In the reviewed fixed-call forms, @iError receives the procedure return status and the procedure name is fixed. Called procedures can still change data or invoke further commands.

**What happens**

Trigger: Explain a cited SQL execution or unresolved dependency boundary from the captured snapshot.

1. Separate a return-status assignment from an EXEC(SQL-text) expression. Evidence: `dynamic-dependency-1434800519`, `dynamic-dependency-1578801032`, `dynamic-dependency-1596181082`, `dynamic-dependency-1765229689`.
2. Retain fixed callee identity and caller-dependent catalog gaps. Evidence: `dynamic-dependency-1434800519`, `dynamic-dependency-1578801032`, `dynamic-dependency-1596181082`, `dynamic-dependency-1765229689`.

**What can affect it**

- Effective caller/default schema and system/callee behavior remain separate.

**What you can check**

- DB Architecture/DYNAMIC_DEPENDENCIES.md

**Expected results and limits**

- 24 of this batch’s 52 flagged modules have only fixed EXEC targets.
- No safe-to-run, read-only, successful lock or full-flow claim follows from this classification.

**More detail and sources**

`dynamic-dependency-1434800519`: [dbo.WTH_SplitWork](sql/1434800519.sql); source-definition SHA-256 `2543b07518bd022774a697c2843630fd069c891284661aa18e947d8d9d18bcc8`, reading-copy SHA-256 `87b879a1c38e9f8ba617ac393e6bab3f474d699c819c33ef06ce807f41f1415e`, one-based inclusive lines [[38, 41], [48, 51]].

`dynamic-dependency-1578801032`: [dbo.WTH_UpdateStatus](sql/1578801032.sql); source-definition SHA-256 `6ccce9eacdad61531287ae7733108c14c97d6d226f9dfb75debb80e2cbd4dac4`, reading-copy SHA-256 `5a373b692339f4af2c1c15404dc5507f29e5878a29c4035db35f65ffe7b228f7`, one-based inclusive lines [[195, 198], [201, 204], [242, 245], [257, 260], [305, 308], [313, 316]].

`dynamic-dependency-1596181082`: [dbo.DASH_UpdateKPIData](sql/1596181082.sql); source-definition SHA-256 `4d2fad95cccde0c5510066f86ee392e025c79ff0fdebd4e4378b79d24b16d3d3`, reading-copy SHA-256 `5d7032242fca0bd9c7033fe0d6cf5958c146663141801c921f0da09dd0f077b6`, one-based inclusive lines [[37, 40], [42, 46], [50, 53], [55, 59], [63, 66], [68, 72], [76, 79], [81, 85]].

`dynamic-dependency-1765229689`: [dbo.PMN_Trace](sql/1765229689.sql); source-definition SHA-256 `64187595661f95f3143de5e5af0969862756ce9d5ca0137d2419dfd3418fe186`, reading-copy SHA-256 `6ae37a5ee4f6dcb21298138bc8ad983f2b4b98831f2469f073ca1cc57d66a5f5`, one-based inclusive lines [[25, 28], [82, 89], [99, 106], [116, 123], [138, 141], [144, 293], [314, 319], [325, 328], [336, 355], [363, 378], [386, 389], [392, 395], [402, 405], [408, 411], [418, 421], [424, 427]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does EXEC @iError choose a procedure named by iError? Expected: return status fixed procedure Must not claim: dynamic target variable
- Is the fixed trace wrapper read-only? Expected: trace state system calls Must not claim: read-only no side effects

## 139. Download selection changes queue state

**Question:** Do the wm_RUDownload wrappers only read interface data?

**What it does.** They update ready interface rows and process stamps before returning selected data. A returned batch is not proof of downstream processing or one atomic claim across every stage.

**What happens**

Trigger: Explain a cited SQL execution or unresolved dependency boundary from the captured snapshot.

1. Convert numeric record limit into TOP syntax. Evidence: `dynamic-dependency-218796187`, `dynamic-dependency-250796301`, `dynamic-dependency-282796415`.
2. Bind state/stamp values and run ordered UPDATE stages. Evidence: `dynamic-dependency-218796187`, `dynamic-dependency-250796301`, `dynamic-dependency-282796415`.
3. Return data after marking and any static child updates. Evidence: `dynamic-dependency-218796187`, `dynamic-dependency-250796301`, `dynamic-dependency-282796415`.

**What can affect it**

- Current interface conditions and process-stamp coordination are unobserved.

**What you can check**

- DB Architecture/DYNAMIC_DEPENDENCIES.md

**Expected results and limits**

- UPDATE targets are exact DOWNLOAD_* relations; stage order/budgets are source-defined.
- No acknowledgment, concurrency guarantee or whole-process success is inferred.

**More detail and sources**

`dynamic-dependency-218796187`: [dbo.wm_RUDownloadItem02](sql/218796187.sql); source-definition SHA-256 `d3c4dc47d509aff7982a0cedfde1a3664a003dc8637ede157efb6bd7d0b6446f`, reading-copy SHA-256 `fc8951b193e915c05e3a77a8a9414f5b3d4bd8252b1d4ec973227aa6b63527ca`, one-based inclusive lines [[1, 51]].

`dynamic-dependency-250796301`: [dbo.wm_RUDownloadOrderHeader02](sql/250796301.sql); source-definition SHA-256 `1cfe27215a2d90d97ac2c1a01d30f88b94b86546a65d56460d8ca03c49bc26d4`, reading-copy SHA-256 `db06daa3a43db5e7f77a5f40c94a4de7e63fca981d7eac3c866e8d469bb7d515`, one-based inclusive lines [[1, 313]].

`dynamic-dependency-282796415`: [dbo.wm_RUDownloadReceiptHeader02](sql/282796415.sql); source-definition SHA-256 `648d41b1389bca28b2af1a67aac280c09df55a5979374df476e2a5e2a351c6ce`, reading-copy SHA-256 `398653ec4df1003d103aae9d2078f985235f6937efde21b50ed8492434a110e4`, one-based inclusive lines [[1, 323]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does selecting download rows mutate anything? Expected: UPDATE process stamp Must not claim: read-only
- Does a successful first stage guarantee the full batch? Expected: separate stages no encompassing local transaction Must not claim: atomic batch recipient acknowledgment

## 140. Configured predicates are executable SQL text

**Question:** Are receipt/inventory filter expressions fully parameterized?

**What it does.** Values such as batch ID and warehouse date are bound, but stored FILTER_CONFIG_DETAIL predicate text is appended as SQL syntax. Receipt variants also mark upload/batch state.

**What happens**

Trigger: Explain a cited SQL execution or unresolved dependency boundary from the captured snapshot.

1. Resolve a filter name and warehouse date. Evidence: `dynamic-dependency-314796529`, `dynamic-dependency-330796586`, `dynamic-dependency-346796643`, `dynamic-dependency-1262275902`, `dynamic-dependency-1278275959`.
2. Append the stored predicate suffix to fixed templates. Evidence: `dynamic-dependency-314796529`, `dynamic-dependency-330796586`, `dynamic-dependency-346796643`, `dynamic-dependency-1262275902`, `dynamic-dependency-1278275959`.
3. Execute with the separate bound values. Evidence: `dynamic-dependency-314796529`, `dynamic-dependency-330796586`, `dynamic-dependency-346796643`, `dynamic-dependency-1262275902`, `dynamic-dependency-1278275959`.

**What can affect it**

- Filter name/record type lookup and WAREHOUSE timezone lookup; effective values unobserved.

**What you can check**

- DB Architecture/DYNAMIC_DEPENDENCIES.md

**Expected results and limits**

- Receipt routines UPDATE container/header records; inventory templates SELECT projections.
- Fixed-template targets do not bound arbitrary configured syntax or prove active configuration.

**More detail and sources**

`dynamic-dependency-314796529`: [dbo.wm_RUReceiptHeader01](sql/314796529.sql); source-definition SHA-256 `eb37f482b9d009aee040d6d00903b039d6073b4faeeef4ef5a46c1c95f61d2e9`, reading-copy SHA-256 `85e7d344146cf5c46432ea961e07275b46d187d947df6888b32511c91f42923c`, one-based inclusive lines [[1, 140]].

`dynamic-dependency-330796586`: [dbo.wm_RUReceiptHeader02](sql/330796586.sql); source-definition SHA-256 `37360be2efe79e5dac8f52afbdab88c6e1fa82a03eeba2ec55bd7f1db20e7570`, reading-copy SHA-256 `33e226d65c5963d182f5db832b3643283f625c14cc60ade3a0f9fe44fc3ab155`, one-based inclusive lines [[1, 157]].

`dynamic-dependency-346796643`: [dbo.wm_RUReceiptHeader03](sql/346796643.sql); source-definition SHA-256 `454bd71df901d53cd87b55fa63f728b62a11e8ab79d8cbcbad7faf7d2456afec`, reading-copy SHA-256 `4fcfe968349063ded85619aa2b7603a4a9d84890799ea7245d60beb87a7f77b8`, one-based inclusive lines [[1, 148]].

`dynamic-dependency-1262275902`: [dbo.wm_RInventory01](sql/1262275902.sql); source-definition SHA-256 `388bf2fb844dea9d364e52d496ebc55224bb9e802b798f7139202733ab88822a`, reading-copy SHA-256 `63da859bd38f50e0d43fade7c99cb92fd67fde6cb7921be3ca75fa03831bfbe1`, one-based inclusive lines [[1, 113]].

`dynamic-dependency-1278275959`: [dbo.wm_RInventory02](sql/1278275959.sql); source-definition SHA-256 `e65fc078c83708ba673f822f136d8419f0e9e6f326433cdd69f29032c56a82f5`, reading-copy SHA-256 `08c7a8063aff6f00d4ea08fc330d677d5bfb77df6f6975bf1793ef7123ec50d7`, one-based inclusive lines [[1, 181]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Are all filter inputs bound by sp_executesql? Expected: bound values stored predicate concatenation Must not claim: fully parameterized
- Does receipt selection prove upload delivered? Expected: batch marking transmission unobserved Must not claim: delivered upload

## 141. Monitoring names and parameters

**Question:** Does binding dates protect the monitoring table and column arguments?

**What it does.** The PM header/work monitoring wrappers concatenate table and column expressions into SQL. Passing identifier-named arguments in a parameter list does not undo that earlier syntax construction.

**What happens**

Trigger: Explain a cited SQL execution or unresolved dependency boundary from the captured snapshot.

1. Look up column metadata. Evidence: `dynamic-dependency-1493228720`, `dynamic-dependency-1509228777`, `dynamic-dependency-1589229062`.
2. Build aggregation syntax from supplied names/expressions. Evidence: `dynamic-dependency-1493228720`, `dynamic-dependency-1509228777`, `dynamic-dependency-1589229062`.
3. Bind dates/warehouse and execute the chosen branch. Evidence: `dynamic-dependency-1493228720`, `dynamic-dependency-1509228777`, `dynamic-dependency-1589229062`.

**What can affect it**

- Caller validation and schema selection are not captured.

**What you can check**

- DB Architecture/DYNAMIC_DEPENDENCIES.md

**Expected results and limits**

- Result source and aggregate shape depend on constructed identifier syntax.
- No exploit or runtime target was reproduced; metadata lookup is not a complete allowlist.

**More detail and sources**

`dynamic-dependency-1493228720`: [dbo.PM_RECEIPTHEADER01](sql/1493228720.sql); source-definition SHA-256 `0468d6270fb9a7ecd6c5158de57bc9d517f21c888d9bd9e23109401b5b791fa3`, reading-copy SHA-256 `e9ef5f101d553ca8fc0d24fad416ddf462d3cade1836b4deb4dfd3555478cf41`, one-based inclusive lines [[1, 119]].

`dynamic-dependency-1509228777`: [dbo.PM_SHIPMENTHEADER01](sql/1509228777.sql); source-definition SHA-256 `39fd49a36af9221431254682119ebd88a29cbc5a6dfb406f7ce546c731cd3f6d`, reading-copy SHA-256 `423254d99f711648165f399fa3d77ce8420d5d564a18b646a097b57cc7018148`, one-based inclusive lines [[1, 120]].

`dynamic-dependency-1589229062`: [dbo.PM_WORKINSTRUCTION01](sql/1589229062.sql); source-definition SHA-256 `e74f141db3d0be0b4d5fa0ef380d672f06d5e3bd649588fc451d8a01f5a72c32`, reading-copy SHA-256 `9ac5ebefb930f5c0c1c24db87855d0445af8fa3216d34b207088ee3f3dab68f7`, one-based inclusive lines [[1, 142]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Can I infer the query table from PM_RECEIPTHEADER01 name? Expected: TABLE_NAME input runtime syntax Must not claim: fixed receipt table
- Are concatenated table identifiers parameterized because they also appear in parameter declarations? Expected: already concatenated syntax Must not claim: safe identifier binding

## 142. Fixed reports and an external query

**Question:** Do all PM report parameters control their dynamic query?

**What it does.** Several wrappers execute one fixed SELECT string without binding their declared report arguments. PM_SHIPPED_TODAY_BY_MINUTE uses a four-part external target whose definition is outside the local snapshot.

**What happens**

Trigger: Explain a cited SQL execution or unresolved dependency boundary from the captured snapshot.

1. Distinguish fixed SQL strings from caller-constructed SQL. Evidence: `dynamic-dependency-436196604`, `dynamic-dependency-452196661`, `dynamic-dependency-468196718`, `dynamic-dependency-484196775`, `dynamic-dependency-596197174`, `dynamic-dependency-1788793680`.
2. Check actual interpolation/binding before attributing filtering to a declared parameter. Evidence: `dynamic-dependency-436196604`, `dynamic-dependency-452196661`, `dynamic-dependency-468196718`, `dynamic-dependency-484196775`, `dynamic-dependency-596197174`, `dynamic-dependency-1788793680`.

**What can affect it**

- Fixed private constants are not effective configuration evidence.

**What you can check**

- DB Architecture/DYNAMIC_DEPENDENCIES.md

**Expected results and limits**

- Local fixed SELECT templates and one explicitly qualified external target are separately classified.
- No external connection or freshness observation; TRAV_EXEC_PROC output parameters are not assigned in the reviewed outer body.

**More detail and sources**

`dynamic-dependency-436196604`: [dbo.PM_UNSHIPPED_BY_BUILDING_PRIORITY](sql/436196604.sql); source-definition SHA-256 `2bc2653d634ae4462b8054dafb50fcb8a3cbb08c445d759cc515ca112e3fac0c`, reading-copy SHA-256 `a00d98f6831485f5de5ec4a2992e725669e1bd2a58405ca54bd5648617f693bd`, one-based inclusive lines [[1, 109]].

`dynamic-dependency-452196661`: [dbo.PM_TODAY_SHIPPING_QUANTITY](sql/452196661.sql); source-definition SHA-256 `883b3520d5d5f6ac18f163aed5653fdb663a02c9bd218bd6188a87226bf4a30b`, reading-copy SHA-256 `f17a4a93f91498550bb210609d56c462afd83abeec77ce78e1059040c526f61d`, one-based inclusive lines [[1, 36]].

`dynamic-dependency-468196718`: [dbo.PM_TODAY_SHIPPING_COMPLETED](sql/468196718.sql); source-definition SHA-256 `a1a73798cd48ad72f0fcb7986413ba4e2294df207a4fa5ddb33b03dd6b8812fc`, reading-copy SHA-256 `51a5c5eb207299bcf5870fac0ae8b17487ccd9ab7be1b78bf81a2b1d789bf136`, one-based inclusive lines [[1, 54]].

`dynamic-dependency-484196775`: [dbo.PM_SHIPPED_TODAY_BY_MINUTE](sql/484196775.sql); source-definition SHA-256 `a1f66bf6e9116acd0756f776693d0861a175838c299af8ac7a212db6d5306e9b`, reading-copy SHA-256 `6346be18c8f40a8acc4e92d1f5a01fbc7f3fb0956a93af96c7e000936fdfbf9b`, one-based inclusive lines [[1, 43]].

`dynamic-dependency-596197174`: [dbo.PM_FUTURE_SHIPPING](sql/596197174.sql); source-definition SHA-256 `eb69c841a0d355831774445718464a2ff87521cf4e1713ab69c397a795abf05d`, reading-copy SHA-256 `aa1226c6803651697e6d29aa9d1499338674b7a24acda3744a49f35cfe4523a8`, one-based inclusive lines [[1, 57]].

`dynamic-dependency-1788793680`: [dbo.TRAV_EXEC_PROC](sql/1788793680.sql); source-definition SHA-256 `22679dc1bed3fcfd2524b0d1dd71d7de2b3a6be511f25e29fc4684adc79cfdfc`, reading-copy SHA-256 `645b67a0b5bb731e4423259c170311bf42ffada1d26047665f4366869f6f7457`, one-based inclusive lines [[1, 69]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Do the declared date inputs necessarily filter PM_SHIPPED_TODAY_BY_MINUTE? Expected: fixed literal not bound Must not claim: effective date filtering
- Is its source the captured local shipment table? Expected: four-part external target unresolved external definition Must not claim: local target resolved

## 143. Configuration summary JSON limits

**Question:** Can LoadAdditionalConfigsSummary treat arbitrarily long JSON values as ordinary bound parameters?

**What it does.** It quotes values with QUOTENAME and assembles query text, with no bound parameters at execution. QUOTENAME’s input-size limit and STRING_AGG’s non-MAX result type impose static boundaries before the query runs.

**What happens**

Trigger: Explain a cited SQL execution or unresolved dependency boundary from the captured snapshot.

1. Parse nested JSON into a temporary table. Evidence: `dynamic-dependency-181224046`.
2. Quote and aggregate values, then choose fixed templates by recognized keys. Evidence: `dynamic-dependency-181224046`.
3. Remove a leading UNION prefix and execute nonempty text. Evidence: `dynamic-dependency-181224046`.

**What can affect it**

- Recognized keys select coded branches; full family/configuration reconciliation is not credited.

**What you can check**

- DB Architecture/DYNAMIC_DEPENDENCIES.md

**Expected results and limits**

- SELECT-template inventory supports a summary-query role within the cited construction scope.
- Oversized values and aggregation are static concerns, not reproduced incidents; intermediate branch semantics remain partial.

**More detail and sources**

`dynamic-dependency-181224046`: [dbo.LoadAdditionalConfigsSummary](sql/181224046.sql); source-definition SHA-256 `7a4677693db618182ff148632027de75556094412774dc0f0332b4bf55d3beed`, reading-copy SHA-256 `13480cd8e5d714719971dba937f66737472a080a72c5f2912f1b4dc68e6c2bd3`, one-based inclusive lines [[2, 65], [1337, 1348]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Are JSON values passed as sp_executesql value parameters? Expected: QUOTENAME text construction no bound parameters Must not claim: fully parameterized
- Does NVARCHAR(MAX) query storage remove QUOTENAME and STRING_AGG input limits? Expected: 128-character QUOTENAME input nvarchar(4000) aggregation Must not claim: unlimited accepted values

## 144. Maintenance commands and partial outcomes

**Question:** Does reviewing a purge or index maintenance wrapper mean it is safe to run?

**What it does.** The reviewed maintenance paths include TRUNCATE, DELETE, ALTER INDEX and UPDATE STATISTICS. This documentation establishes construction and effect categories; it neither executes them nor confirms current targets, permissions or retention settings.

**What happens**

Trigger: Explain a cited SQL execution or unresolved dependency boundary from the captured snapshot.

1. Identify environment/preferences/catalog target selection. Evidence: `dynamic-dependency-777873938`, `dynamic-dependency-337540386`, `dynamic-dependency-956178802`, `dynamic-dependency-2122646805`.
2. Separate quoted identifiers from unbound concatenated syntax. Evidence: `dynamic-dependency-777873938`, `dynamic-dependency-337540386`, `dynamic-dependency-956178802`, `dynamic-dependency-2122646805`.
3. Account for per-command error handling and separate executions. Evidence: `dynamic-dependency-777873938`, `dynamic-dependency-337540386`, `dynamic-dependency-956178802`, `dynamic-dependency-2122646805`.

**What can affect it**

- Archive preferences, live metadata/DMVs and environment predicates determine current reach.

**What you can check**

- DB Architecture/DYNAMIC_DEPENDENCIES.md

**Expected results and limits**

- Azure maintenance catches individual command errors and continues; archive paths do not guarantee one atomic purge.
- No archive rows accessed; no maintenance/trace command run.

**More detail and sources**

`dynamic-dependency-777873938`: [dbo.PURGE_ARCHIVE_TABLES](sql/777873938.sql); source-definition SHA-256 `29275b82cdbb77039cef45ab224e6f21736054631693006470af944d6f171c2b`, reading-copy SHA-256 `fb14357c701b5b5047a9c41a6fe7b6d6eac0229ff4b32470624d94a36c9c59f8`, one-based inclusive lines [[1, 32]].

`dynamic-dependency-337540386`: [dbo.ArchivePurgeRunbook](sql/337540386.sql); source-definition SHA-256 `d11a70296e18cf71eb1d916903d2682cc081ccbed1022a51b5944a8f8a44c1c3`, reading-copy SHA-256 `0d341af9b5c2479a3e820cdbe9bc0415082f4d7b9a22edddc2fd06ef3ce90227`, one-based inclusive lines [[44, 90], [239, 243], [821, 1247]].

`dynamic-dependency-956178802`: [dbo.AzureSQLMaintenance](sql/956178802.sql); source-definition SHA-256 `6ca30420775ab5d138dbdcbc31e33c7fb25823c657af7d8bab3f7867e06957c2`, reading-copy SHA-256 `3193f62b3a13faa55eaf64f004a88d4cbb81cf1e93048af35a1780bcd75c9055`, one-based inclusive lines [[1, 246]].

`dynamic-dependency-2122646805`: [dbo.AzureSQLMaintenance_1](sql/2122646805.sql); source-definition SHA-256 `34abe0f45532c7643bcd4ab5dee09e1a72876d88ea30156d14c473dc0269fc4e`, reading-copy SHA-256 `9153ba3f75d37b8fbd07d4ce5258fef01b99e6af0c9699642d4471e32dfa6d56`, one-based inclusive lines [[1, 269]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does Azure maintenance reaching the end prove every queued command succeeded? Expected: per-command catch queue continuation Must not claim: all commands succeeded
- Does QUOTENAME on purge table names establish safe retention or approval? Expected: identifier quoting runtime retention unverified Must not claim: safe to purge authorized operational execution

## 145. Partial binding in XML and unit searches

**Question:** Can binding XML content or a count output make the whole dynamic command parameterized?

**What it does.** Binding one parameter protects only that value from being treated as command text. The XML helper binds XML content, but concatenates XPath and namespace syntax. The unit-reference helper binds only its count output, UMCount; the sought unit value UMToDelete is concatenated into the command. OUTPUT binding therefore does not make that input parameterized.

**What happens**

Trigger: Explain a cited SQL execution or unresolved dependency boundary from the captured snapshot.

1. GetXMLAttributeValueByAttributeName passes XML as the bound @content value. It builds the query using nodeXpath and optional xmlnsDeclarations. Those syntax inputs remain separate from the protected XML value. Evidence: `dynamic-dependency-1016703020`, `dynamic-dependency-1800705813`.
2. ITM_DoesUmReferenceExist builds a query using metadata table/column names and UMToDelete. Its sp_executesql call binds UMCount as OUTPUT so the count can be returned; it does not bind the unit being searched. Neither identifier quoting nor caller input validation is established here. Evidence: `dynamic-dependency-1016703020`, `dynamic-dependency-1800705813`.
3. Malformed generated syntax can fail without a local TRY/CATCH. The fallback unit-list loop has no outer current-row increment, so an unmatched first list can prevent progress. This is a static source observation; no routine was executed and no production incident was reproduced. Evidence: `dynamic-dependency-1016703020`, `dynamic-dependency-1800705813`.

**What can affect it**

- Caller input validation and actual metadata/value lists are unobserved.

**What you can check**

- DB Architecture/DYNAMIC_DEPENDENCIES.md

**Expected results and limits**

- No current XML extraction or unit reference answer is produced by static review.
- The unit fallback nonprogress edge is source-level, not reproduced; no arbitrary-input read-only guarantee.

**More detail and sources**

`dynamic-dependency-1016703020`: [dbo.GetXMLAttributeValueByAttributeName](sql/1016703020.sql); source-definition SHA-256 `8e0cf55b396eac4dcfb3b832443980df2c61ad6e64709d2304616275dbd22f74`, reading-copy SHA-256 `fe1d403bbfc2472281d11051f05877dc0f11d304052c77afad16403231e35b77`, one-based inclusive lines [[1, 51]].

`dynamic-dependency-1800705813`: [dbo.ITM_DoesUmReferenceExist](sql/1800705813.sql); source-definition SHA-256 `1f9b6411439c03821be1c5ddddb411d9296bce58b7847510d5810a6f2e0aa265`, reading-copy SHA-256 `4b47295a3c695d74a010537e4711f5e678915ff85820a37c51c78b95687dd49d`, one-based inclusive lines [[1, 108]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does OUTPUT parameter binding protect UMToDelete? Expected: only UMCount is bound UMToDelete concatenated Must not claim: fully parameterized unit value
- Are namespaces and XPath bound with the XML? Expected: XML content bound syntax concatenated Must not claim: all XML query inputs bound

## 146. Generated INSERT text versus executed DML

**Question:** Does sp_generate_insert_script insert the exported rows?

**What it does.** Its constructed command reads rows with SELECT and returns INSERT statements as text. The body does not execute those emitted INSERT statements; invoking it would still read operational rows.

**What happens**

Trigger: Explain a cited SQL execution or unresolved dependency boundary from the captured snapshot.

1. Select tables/columns from metadata. Evidence: `dynamic-dependency-1953754363`.
2. Build a SELECT that formats INSERT text by legacy type cases. Evidence: `dynamic-dependency-1953754363`.
3. Return generated scripts as values. Evidence: `dynamic-dependency-1953754363`.

**What can affect it**

- Catalog mask, current data and legacy type handling govern output.

**What you can check**

- DB Architecture/DYNAMIC_DEPENDENCIES.md

**Expected results and limits**

- Generated data scripts, not applied inserts.
- No extraction ran; completeness and restoration fidelity are unverified.

**More detail and sources**

`dynamic-dependency-1953754363`: [dbo.sp_generate_insert_script](sql/1953754363.sql); source-definition SHA-256 `70717108c7e2ac3419d717ab9e34d7bc497116e59fdc147ebdecfcfaf4422249`, reading-copy SHA-256 `8b297ae6ac0bc7e7b222226b1805378cc090562366a0c9ed18264b3fb89d4adb`, one-based inclusive lines [[1, 223]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the INSERT keyword in the template mean exported rows were inserted? Expected: SELECT-generated text not applied Must not claim: rows inserted
- Is the generated script a verified complete restore backup? Expected: type/length/escaping limits not executed Must not claim: verified backup complete fidelity

## 147. Unresolved catalog references and candidate targets

**Question:** Can a same-name object fill in a NULL catalog referenced_id?

**What it does.** A same-name local object is a static candidate for an unqualified call, not an observed runtime binding. Other NULL entries describe system routines, an alias, a table created by a body, a missing staging relation or a cross-database function.

**What happens**

Trigger: Explain a cited SQL execution or unresolved dependency boundary from the captured snapshot.

1. Preserve the exact original catalog row and its NULL referenced_id. Evidence: `dynamic-dependency-1260179885`, `dynamic-dependency-1161315447`, `dynamic-dependency-1243151474`, `dynamic-dependency-1749229632`, `dynamic-dependency-757226098`.
2. Explain source syntax and candidate identity independently. Evidence: `dynamic-dependency-1260179885`, `dynamic-dependency-1161315447`, `dynamic-dependency-1243151474`, `dynamic-dependency-1749229632`, `dynamic-dependency-757226098`.
3. Keep external, system and runtime-created dependencies explicit. Evidence: `dynamic-dependency-1260179885`, `dynamic-dependency-1161315447`, `dynamic-dependency-1243151474`, `dynamic-dependency-1749229632`, `dynamic-dependency-757226098`.

**What can affect it**

- Caller/default schema, external database functions and runtime DDL remain unobserved.

**What you can check**

- DB Architecture/DYNAMIC_DEPENDENCIES.md

**Expected results and limits**

- 120 remaining selected dependency entries receive source-backed dispositions; original 169-entry denominator is preserved.
- tempSecurityCheck lacks a # prefix and is an ordinary table; no session-private lifecycle guarantee.

**More detail and sources**

`dynamic-dependency-1260179885`: [dbo.CheckSecurityPermission](sql/1260179885.sql); source-definition SHA-256 `3da1644940792611c12d9c16dd79331d3756e63812f445f5793e31fc64c8ec38`, reading-copy SHA-256 `3a7152c88007566a73bc3c23eac5138d07a7d9ef6563361d7fb04f57e1526949`, one-based inclusive lines [[7, 54], [57, 75], [78, 95], [97, 118]].

`dynamic-dependency-1161315447`: [dbo.POPULATE_Generic_Config_Dtl](sql/1161315447.sql); source-definition SHA-256 `055de6a55870ac9bfa7bbdd167f8985c3cad475502046fd52bdc79b805fbb103`, reading-copy SHA-256 `6c722bd216bb7321a1ff4cd0336b0dae1a34ea8c9220260dc6649dc65b5f6b35`, one-based inclusive lines [[25, 54], [57, 60], [64, 67], [72, 75], [80, 83], [118, 121], [143, 146], [152, 155], [162, 165], [172, 175], [261, 264], [277, 280]].

`dynamic-dependency-1243151474`: [dbo.TRAV_SetShipByAndDeliverByForReturns](sql/1243151474.sql); source-definition SHA-256 `6d4b771b199f60b23fef165b35cd8f1dd7e84b25a81787d434cc2270a7ff592b`, reading-copy SHA-256 `83dc0b45a6b4f5dcc8bf5c21cdd0961b29b1186b7302c49e4965664e34df9924`, one-based inclusive lines [[24, 28]].

`dynamic-dependency-1749229632`: [dbo.PMN_TableSizes](sql/1749229632.sql); source-definition SHA-256 `fe7f2c8786f650bed9f59e9f92e4123168993c0c0228d764b5be90cdf4b66582`, reading-copy SHA-256 `26a79b56c4bdab93dbb64540d521c31645dd79998a98b258ca49f8bd6e240e8b`, one-based inclusive lines [[23, 26]].

`dynamic-dependency-757226098`: [dbo.MetaTrans_GetLocationInventory](sql/757226098.sql); source-definition SHA-256 `99f8c2c6b630a5dbbb7625d9ea2f7ef39693346a051402a6dfc1953f1fd99d16`, reading-copy SHA-256 `5964e05ca822965aadec38fd8a8a8e3c1e09c46d1a91ca978ca6f66e66f722ea`, one-based inclusive lines [[15, 18]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Is tempSecurityCheck automatically a session-local temporary table? Expected: ordinary CREATE TABLE no # prefix concurrency/cleanup gap Must not claim: session isolated temporary table
- Does a same-name candidate resolve caller-dependent catalog NULL? Expected: static candidate NULL preserved Must not claim: observed runtime binding
- Does fixed sp_msForEachTable rule out indirect dynamic execution? Expected: command template callee not captured Must not claim: no indirect commands

## 148. Labor monitor counts and time windows

**Question:** Why can labor monitor tiles and assigned-user charts show different totals?

**What it does.** The routines use different record sources, timestamp columns and filters. Some count instructions or distinct users; condition-group totals can double-count a work unit. A browser-midnight tile differs from rolling one-hour windows, and unsupported tile codes return no tile.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Select the exact monitor routine and filter context. Evidence: `lya-sql-117223818`, `lya-sql-133223875`, `lya-sql-149223932`, `lya-sql-970798866`.
2. Compare END_DATE_TIME, DATE_TIME_STAMP and browser-midnight predicates before comparing counts. Evidence: `lya-sql-117223818`, `lya-sql-133223875`, `lya-sql-149223932`, `lya-sql-970798866`.

**What can affect it**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**What you can check**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**Expected results and limits**

- Only the bounded source-defined selection or mutation described above.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`lya-sql-117223818`: [dbo.LBR_MonitorLaborGroupsChartData](sql/117223818.sql); source-definition SHA-256 `5b9d2542886ce534925aeaab2783b4b4a6f4d8327938ac99a7c922abf4f22766`, reading-copy SHA-256 `93c622b315fc4dcbdf6006546cde463309058d804eba14eab47f3bc5295890c2`, one-based inclusive lines [[1, 89]].

`lya-sql-133223875`: [dbo.LBR_MonitorLaborIndicatorTiles](sql/133223875.sql); source-definition SHA-256 `cfe5548be2c3316f83cf1094eaf46e651e6b523a5085d918b50fb1882f2046c2`, reading-copy SHA-256 `40372014f3159eec989f741a27af84749eacd97693dcf845684ca931b60e41d6`, one-based inclusive lines [[1, 87]].

`lya-sql-149223932`: [dbo.LBR_MonitorLaborUsersChartData](sql/149223932.sql); source-definition SHA-256 `20d5f6145bae08cc63225f08cfb936eb3ec2608cb7e11c3a5a0513f9d1278970`, reading-copy SHA-256 `8c5deceb5b8392979deeda348fe3f2fd1fd85ba43593c6fea4f9827c2a1f12b2`, one-based inclusive lines [[1, 105]].

`lya-sql-970798866`: [dbo.WRK_MonitorAssignedUserChartData](sql/970798866.sql); source-definition SHA-256 `e3527047cd4e252e9e4b3ee3d24504a2836e654aa330ec8e4c86ebedae5bf3ed`, reading-copy SHA-256 `07d8eb7fbd0ff6db0d91e97c6cc20855576f4f9b459c2c1f09c1cc924d9994a4`, one-based inclusive lines [[1, 92]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does a NULL work-group monitor filter mean every group? Expected: The assigned-user monitor interprets NULL as NULL-group rows only. Must not claim: All groups are included.
- Does an unsupported tile produce a zero tile? Expected: No supported branch means no tile result set. Must not claim: A zero tile is always returned.

## 149. Intraday labor estimates and active-user counts

**Question:** Does the intraday labor FTE value establish current staffing and actual process duration?

**What it does.** It counts distinct users with sufficiently recent eligible activity, using group tolerance or 30 minutes. Work quantity, formatted labor-time grouping, throughput and NULL work-group joins affect estimates. These results do not establish attendance or end-to-end elapsed duration.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Compare eligible source windows, hold configuration and work-type selection. Evidence: `lya-sql-904702621`, `lya-sql-920702678`.
2. Inspect NULL work-group joins and grouped formatted durations before interpreting calculated hours. Evidence: `lya-sql-904702621`, `lya-sql-920702678`.

**What can affect it**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**What you can check**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**Expected results and limits**

- Only the bounded source-defined selection or mutation described above.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`lya-sql-904702621`: [dbo.GetIntraDayLaborProgressActiveEmployees](sql/904702621.sql); source-definition SHA-256 `98bd01b391cbd101f076ce233cf63435caae67fde88a595439739c471370fe97`, reading-copy SHA-256 `bff5d5667f9ee823543c5afd9ed82fffeeb2baf65e1925aa3a3accbd284c8928`, one-based inclusive lines [[1, 54]].

`lya-sql-920702678`: [dbo.GetIntraDayLaborProgressWorkDetails](sql/920702678.sql); source-definition SHA-256 `e391fe7e8ebe3a915c7f13f707650f29758f932b29255503827b920b41ced916`, reading-copy SHA-256 `23bd57d825fd973754f126160037931abcdd63fda7d2ae1edac4ced564750e63`, one-based inclusive lines [[1, 270]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Can NULL work groups disappear from intraday aggregate joins? Expected: Ordinary equality does not match NULL groups, even when grouped source rows exist. Must not claim: Every grouped row is always joined.
- Is labor FTE here a measured staffing allocation? Expected: It is a distinct recent-user count for the group. Must not claim: It measures contracted full-time-equivalent staffing.

## 150. Stored labor dashboard values and refresh

**Question:** Does reading the labor KPI dashboard prove its values are fresh?

**What it does.** The reader pivots MAX stored values without checking expiry. The refresh routine either replaces all five KPI identifiers when one is missing or updates only expired rows. NULL expiry can prevent refresh, and duplicate identifiers are not rejected by the completeness test.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Check the stored identifier coverage and timestamp/expiry values through an authorized process. Evidence: `lya-sql-1468180626`, `lya-sql-1548180911`.
2. Distinguish the read procedure from the separate refresh procedure and its caller transaction. Evidence: `lya-sql-1468180626`, `lya-sql-1548180911`.

**What can affect it**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**What you can check**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**Expected results and limits**

- Only the bounded source-defined selection or mutation described above.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`lya-sql-1468180626`: [dbo.DASH_GetLaborKPIData](sql/1468180626.sql); source-definition SHA-256 `72b83bdf3b2a71b028499a395d5e4280ed18dffd5e7f5dfab41d16144ac73064`, reading-copy SHA-256 `d1d992ab90844e4cbe2b4e3e6b78a32dd1ec7994e5bf38ff4ae647e4259f774b`, one-based inclusive lines [[1, 34]].

`lya-sql-1548180911`: [dbo.DASH_RefreshLabor](sql/1548180911.sql); source-definition SHA-256 `1b9f06070ad9dcedb58cf1d4162b99f8d97839726b3651a83c2d1f1b27987e11`, reading-copy SHA-256 `7dedd3092fc7168cbc66aef35fd238537daa124f1b516a67e6df40d674c97829`, one-based inclusive lines [[1, 142]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does five distinct KPI identifiers rule out duplicate rows? Expected: Distinct coverage does not reject duplicates. Must not claim: The stored set is guaranteed unique.
- Does the reader call refresh? Expected: It reads and pivots stored values only. Must not claim: Reading forces a fresh KPI calculation.

## 151. Labor entry context and consolidation groups

**Question:** Do labor screen helpers save entries or perform consolidation?

**What it does.** The two MetaTrans log helpers return fixed presentation rows only. The grouping helper returns candidate group identifiers without persisting a consolidation. SaveUserLastActivityEndTime stores a supplied timestamp without enforcing that it increases.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Identify whether the caller requested screen context, grouping or timestamp storage. Evidence: `lya-sql-1061227181`, `lya-sql-1077227238`, `lya-sql-776702165`, `lya-sql-1153751513`.
2. Validate split identifiers and ordering before relying on group assignments. Evidence: `lya-sql-1061227181`, `lya-sql-1077227238`, `lya-sql-776702165`, `lya-sql-1153751513`.

**What can affect it**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**What you can check**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**Expected results and limits**

- Only the bounded source-defined selection or mutation described above.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`lya-sql-1061227181`: [dbo.MetaTrans_IndirectLaborWorkbenchLog](sql/1061227181.sql); source-definition SHA-256 `9c5d5fa4742dbca47f085b7bedeff31b7d1cfd39c3835679975eeef8097eb664`, reading-copy SHA-256 `9cf4511b5d6cc8285735d74442bacb5f817a7a2e225c0361380a4e504da3f05c`, one-based inclusive lines [[1, 26]].

`lya-sql-1077227238`: [dbo.MetaTrans_ManualLaborActivityLog](sql/1077227238.sql); source-definition SHA-256 `8bdaa98f3f7e1502093bc698bdf239d7b57f23ff22a5d33626b3ef4eab268d1f`, reading-copy SHA-256 `b0116ffb09dd95a772066f0d5db2df218368bcb9cfe07715a9174b536b0c5a9f`, one-based inclusive lines [[1, 35]].

`lya-sql-776702165`: [dbo.Get_LaborActivityGroupsForConsolidation](sql/776702165.sql); source-definition SHA-256 `afa627cc06f9215d24ce264bd893266d03a006b3c8a07c18d35282a21394c22c`, reading-copy SHA-256 `9acbf82e26c6b92ca246c1893c2145472bac16aeb4548e2f4d36e1d496fcad4b`, one-based inclusive lines [[1, 76]].

`lya-sql-1153751513`: [dbo.SaveUserLastActivityEndTime](sql/1153751513.sql); source-definition SHA-256 `eb3253481a69eb134ce793a9bf5c63803870566cbfa3cc56c32d70c3a556aabb`, reading-copy SHA-256 `e31c570393b014ad18c37574ab5b5129d8c303f310a66e60a6cc81ddca7a0ade`, one-based inclusive lines [[1, 25]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does ISNUMERIC guarantee an input ID fits INT? Expected: Numeric text can still fail INT conversion; duplicate IDs can fail the temporary key. Must not claim: Every ISNUMERIC value is safe as INT.
- Can the saved activity end time move backwards? Expected: No greater-than comparison prevents an earlier supplied value. Must not claim: It always retains the greatest timestamp.

## 152. Labor reports and incremental export windows

**Question:** Are user labor reports and the labor export filtered by the same dates?

**What it does.** The labor-type detail report uses inclusive START_DATE_TIME bounds. The user-summary detail routine has no date or warehouse filter. The SCI export uses DATE_TIME_STAMP greater than start and at most end, with non-NULL completion time and coded activity exclusions.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Identify the exact report/export procedure. Evidence: `lya-sql-209748150`, `lya-sql-801750259`, `lya-sql-1217751741`.
2. Compare the field and boundary operators used for its time window. Evidence: `lya-sql-209748150`, `lya-sql-801750259`, `lya-sql-1217751741`.

**What can affect it**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**What you can check**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**Expected results and limits**

- Only the bounded source-defined selection or mutation described above.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`lya-sql-209748150`: [dbo.RPT_LaborTypeSummaryDetails](sql/209748150.sql); source-definition SHA-256 `9029cec7bb53581a36f0d5324bb2bbeabb4f22acb6623f3c44278884f4b95f69`, reading-copy SHA-256 `ff90fe87519049581334ba783b6f7a7868459990d0f972f0a7b1710c190531d7`, one-based inclusive lines [[1, 52]].

`lya-sql-801750259`: [dbo.RPT_UserSummaryReportDetails](sql/801750259.sql); source-definition SHA-256 `ee47a550a9691264fe274606ec9e1805a58ca8e80278162762b9db46238396ed`, reading-copy SHA-256 `57b0bb648ed2e919fca33099639d3f805d9310f4ab3a8a990e9427bec6dc7a0f`, one-based inclusive lines [[1, 40]].

`lya-sql-1217751741`: [dbo.SCI_LABOR_MANAGEMENT_DETAIL](sql/1217751741.sql); source-definition SHA-256 `68e6fa79f7f8633231388a0035ffdc2b4b413e7ea1b744d5ee106f164ed46cbc`, reading-copy SHA-256 `1869e26f5032a0e67f39d026b068821d6a8093b58f896883f0feef64913165db`, one-based inclusive lines [[1, 58]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the user-summary routine aggregate per user? Expected: It returns unaggregated detail ordered by user and time. Must not claim: One aggregate row per user is guaranteed.
- Does the SCI window use activity start time? Expected: It uses the change DATE_TIME_STAMP. Must not claim: The input window is applied to START_DATE_TIME.

## 153. Security registration and profile cleanup

**Question:** Are security registration and user cleanup atomic permission checks?

**What it does.** The registration routines insert missing records and leave existing records unchanged. Profile cleanup performs nine deletes and a final activity insert without its own transaction. None of these bodies authenticates the caller or proves an action is authorized.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Review the exact insertion key or deletion order and caller authorization. Evidence: `lya-sql-392700797`, `lya-sql-408700854`, `lya-sql-544720993`, `lya-sql-568701424`, `lya-sql-1783325763`.
2. Use the separately established caller transaction and constraints when assessing partial failure. Evidence: `lya-sql-392700797`, `lya-sql-408700854`, `lya-sql-544720993`, `lya-sql-568701424`, `lya-sql-1783325763`.

**What can affect it**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**What you can check**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**Expected results and limits**

- Only the bounded source-defined selection or mutation described above.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`lya-sql-392700797`: [dbo.dbc_ISecurity](sql/392700797.sql); source-definition SHA-256 `cee4d3bba96a24a7083890878af2b97cbbdae66638efb404ba1a6a95b747ffa0`, reading-copy SHA-256 `52e5d012ca3d3634ba7436e40f232df9990986a941003b499026ee277c62bb66`, one-based inclusive lines [[1, 81]].

`lya-sql-408700854`: [dbo.dbc_ISecurityCheckpoint](sql/408700854.sql); source-definition SHA-256 `d40e68a5b6b75a62b64997f27eb58d348753d02d55f2ddca74b94df7e3ec872e`, reading-copy SHA-256 `e3a53f9dc32a5c735258033367aa186a16807a1bf2d9ee92285a9052fcf4f64d`, one-based inclusive lines [[1, 43]].

`lya-sql-544720993`: [dbo.dbc_ISecurityGroup](sql/544720993.sql); source-definition SHA-256 `0e299f769fefc249677a18a55b92f2a38823ad6ec1fc04385a02a6f70abe28b9`, reading-copy SHA-256 `38b23608a9608c6a318e980a79c453f9ce5cb0c4d3bfa466801522779d0f3158`, one-based inclusive lines [[1, 38]].

`lya-sql-568701424`: [dbo.DeleteUserProfileReferences](sql/568701424.sql); source-definition SHA-256 `88ea64d9e486103b1610a284585251e8dcba3ef732ac2171752d07e88ad201be`, reading-copy SHA-256 `cd532e390b24b1eafa31a8cbe112bf08c34051992ffe408a5078cbc3d88a3336`, one-based inclusive lines [[1, 23]].

`lya-sql-1783325763`: [dbo.wm_RUserProfile01](sql/1783325763.sql); source-definition SHA-256 `b7ca66b78fac083d282aae183c61af97163a4245ea4e9a99bc2e084631e7184a`, reading-copy SHA-256 `30caa49713d149e004af6c7b7b7f8ea4eb97bca63c1e82607208a3b3687c0525`, one-based inclusive lines [[1, 13]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does registering an existing security group update its description? Expected: The existing group is left unchanged. Must not claim: The procedure always refreshes the description.
- Can cleanup write an activity record even when no profile existed? Expected: The final INSERT is attempted after the deletes regardless of affected count. Must not claim: A successful profile deletion is required before the audit insert.

## 154. Security form branches and checkpoint display

**Question:** Do both security form selection branches apply the same restrictions?

**What it does.** No. The all-forms branch applies active-form, parent and restricted-ID logic, with a supplied authorized-user bypass. The explicit-user branch selects SECURITY/checkpoint matches without repeating those filters. Resource fallbacks and checkpoint display values are not authentication.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Determine @allForms and inspect the branch-specific predicates. Evidence: `lya-sql-1505752767`, `lya-sql-1521752824`.
2. Resolve culture/resource fallback separately from permission enforcement. Evidence: `lya-sql-1505752767`, `lya-sql-1521752824`.

**What can affect it**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**What you can check**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**Expected results and limits**

- Only the bounded source-defined selection or mutation described above.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`lya-sql-1505752767`: [dbo.SEC_GetCheckpointsWithResourceFileKeys](sql/1505752767.sql); source-definition SHA-256 `8a8f2947995425158e21f5ece3967a21d77ddeec46ae04fcb34eba2018873fd5`, reading-copy SHA-256 `304c8150657d2db85f73afa970a27dcd407183345f3936592a7deedbe158deb6`, one-based inclusive lines [[1, 18]].

`lya-sql-1521752824`: [dbo.SEC_GetSecurityForms](sql/1521752824.sql); source-definition SHA-256 `2c2783d30ff5a68af64fe7d4cf98797afcb376c3bcadd88e71d35b4dcfb05bc6`, reading-copy SHA-256 `d08e5849fa6457e733713eb7b5292304205bd6c6906bccec0782ad73554ca3aa`, one-based inclusive lines [[1, 94]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does @allForms=0 enforce the same restricted-ID list? Expected: The ELSE branch does not repeat that filter. Must not claim: Both branches share the restricted-ID predicate.
- Does a displayed checkpoint establish login validity? Expected: It is a returned mapped value; caller authentication is separate. Must not claim: The display authenticates the user.

## 155. Security migration report persistent staging

**Question:** Is CheckSecurityPermission a read-only permission query?

**What it does.** It creates, fills, updates and drops an ordinary table named tempSecurityCheck. The name has no # prefix. It reports old-enabled/new-disabled permission mappings, but concurrent calls can collide and failure before the final DROP can leave the table behind.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Review the create/populate/compare sequence and persistent staging target. Evidence: `lya-sql-1260179885`.
2. Establish caller isolation and failure cleanup before any separately authorized execution. Evidence: `lya-sql-1260179885`.

**What can affect it**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**What you can check**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**Expected results and limits**

- Only the bounded source-defined selection or mutation described above.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`lya-sql-1260179885`: [dbo.CheckSecurityPermission](sql/1260179885.sql); source-definition SHA-256 `3da1644940792611c12d9c16dd79331d3756e63812f445f5793e31fc64c8ec38`, reading-copy SHA-256 `3a7152c88007566a73bc3c23eac5138d07a7d9ef6563361d7fb04f57e1526949`, one-based inclusive lines [[1, 120]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Is tempSecurityCheck a session-local temporary table? Expected: It is an unprefixed ordinary table. Must not claim: Its name makes it local temporary storage.
- Does failure always drop the staging table? Expected: There is no TRY/CATCH or guarded cleanup. Must not claim: Cleanup is guaranteed on every error path.

## 156. Yard visibility detail and total differences

**Question:** Why can yard visibility detail and header totals differ?

**What it does.** Detail includes actual or scheduled trailer locations; header totals join actual locations only. Receipt and appointment joins can multiply rows and sums, while only selected identifiers are counted distinctly. NOLOCK also limits consistent interpretation.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Compare actual-versus-scheduled location selection. Evidence: `lya-sql-897750601`, `lya-sql-913750658`, `lya-sql-929750715`.
2. Inspect receipt/detail/appointment multiplicity before comparing counts or quantities. Evidence: `lya-sql-897750601`, `lya-sql-913750658`, `lya-sql-929750715`.

**What can affect it**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**What you can check**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**Expected results and limits**

- Only the bounded source-defined selection or mutation described above.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`lya-sql-897750601`: [dbo.RPT_YardVisibilityDetails](sql/897750601.sql); source-definition SHA-256 `26718c433878b346d9a92193274c40b0dc3305a3ac42900e3b1d1ae4bdf734b7`, reading-copy SHA-256 `364338dd58b6702b5fc1d3caaaf6a2f5fbbab2f5d4b8bc79efd686cd795b8c90`, one-based inclusive lines [[1, 65]].

`lya-sql-913750658`: [dbo.RPT_YardVisibilityHdrDetails](sql/913750658.sql); source-definition SHA-256 `bfc500f0d5f038d6b2f48c1acdd6d3e360368aa5e6c7cbaad7fec2ab9ef63871`, reading-copy SHA-256 `828d2cc84ecb361d1cef791542243769d4396378090743241978588ea9d82a7a`, one-based inclusive lines [[1, 53]].

`lya-sql-929750715`: [dbo.RPT_YardVisibilityRcptDetails](sql/929750715.sql); source-definition SHA-256 `db9c5b5a4f8aa3cb2dd494bd37169d35eece2d7b502a05ca6cc58fff443a64ab`, reading-copy SHA-256 `620629b49184359589e3c1845032df9a0068367e5f6a6876323219ab419b9e0a`, one-based inclusive lines [[1, 34]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does header total include scheduled-only trailer locations? Expected: Its trailer join is actual-location only. Must not claim: It uses the same OR scheduled-location join as detail.
- Does a distinct trailer count prevent quantity fanout? Expected: Distinct identifiers do not deduplicate the detail SUM. Must not claim: All header aggregates are fanout-proof.

## 157. Dock transfer context, work flags and grid settings

**Question:** Does selecting dock transfer context move a container?

**What it does.** The transfer context routine only returns container and shipment selections. A different dock-work routine updates a flag then calls a container helper, even if the source lookup produces NULL. Grid customization is a separate insert-if-missing operation.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Identify the context getter versus work-state mutation. Evidence: `lya-sql-501225186`, `lya-sql-1194799664`, `lya-sql-1852181994`.
2. Account for unordered TOP 1 context and the delegated container update. Evidence: `lya-sql-501225186`, `lya-sql-1194799664`, `lya-sql-1852181994`.

**What can affect it**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**What you can check**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**Expected results and limits**

- Only the bounded source-defined selection or mutation described above.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`lya-sql-501225186`: [dbo.MetaTrans_DockLocationTransfer](sql/501225186.sql); source-definition SHA-256 `a1057b5823ca1a1b2b853fc2dff111719715ab2cc9d62ef422f022252840a60b`, reading-copy SHA-256 `3a17e72847a3330f8f96977b6e44ae17b314474996e20fbe0567825c5d75e6b3`, one-based inclusive lines [[1, 61]].

`lya-sql-1194799664`: [dbo.WRK_UpdateDockWorkCreated](sql/1194799664.sql); source-definition SHA-256 `d61c4da4cfb5550e242ce652ac4d5f638d7969b78beaffc94e0329edb8e05fce`, reading-copy SHA-256 `ad959e6a4d1bc657b60c55c421837b37b833ee0b6611bda2f53cc30a3eb14040`, one-based inclusive lines [[1, 17]].

`lya-sql-1852181994`: [dbo.dbc_IDockMgrGridCustomization](sql/1852181994.sql); source-definition SHA-256 `ef9ff3946f6b49d7c91d795098fa62cf4e613378c5e65d7eb32e22eb15ddd87f`, reading-copy SHA-256 `fb30c88764b63faebb2f38107d28e3eb75f5c3a15c8516c5c8c995137bbce84a`, one-based inclusive lines [[1, 75]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the context getter execute a transfer? Expected: It performs selection only. Must not claim: It moves inventory or containers.
- Does a missing dock source prevent the helper call? Expected: The body still reaches the helper with a potentially NULL container number. Must not claim: Missing source always returns before the call.

## 158. Session timeout units and activity samples

**Question:** Are activity timeout values minutes and sampled counts distinct employees?

**What it does.** The timeout routine divides elapsed seconds by 86400.0, so its interval is in days. The sampling report generates 30-second timestamps and counts overlapping session rows by coded user type, not distinct employees; its recursion has no duration cap.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Interpret the timeout unit from the expression. Evidence: `lya-sql-762798125`, `lya-sql-1781229746`.
2. Bound a separately authorized sampling request and distinguish sessions from people. Evidence: `lya-sql-762798125`, `lya-sql-1781229746`.

**What can affect it**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**What you can check**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**Expected results and limits**

- Only the bounded source-defined selection or mutation described above.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`lya-sql-762798125`: [dbo.wm_UUserActivity01](sql/762798125.sql); source-definition SHA-256 `11ee2a4eef1aee0796b25de7d62f43d27756d9218e15fdd2d231263f81191f23`, reading-copy SHA-256 `749147d0d712f4bc5781b80fb13f410c0099519f1ba49e24082acecbb9f8cb2f`, one-based inclusive lines [[1, 16]].

`lya-sql-1781229746`: [dbo.PMN_UserActivity](sql/1781229746.sql); source-definition SHA-256 `d5ee9d6737ec5fe123ba8701cba6b4a1865cdbdf081e198b008b4e8fa886a1d4`, reading-copy SHA-256 `cd5f2894d24655e1322419509453f005ffa9222d9be7414907ad0e5148221bc6`, one-based inclusive lines [[1, 36]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Is AutoLogoutInterval interpreted in minutes? Expected: The comparison uses elapsed days. Must not claim: It is a minute value.
- Does start after end return no sample? Expected: The recursive anchor is still emitted. Must not claim: The query validates and returns an empty range.

## 159. Inventory diagnostic count definitions

**Question:** Do inventory diagnostic names exactly describe their counting units?

**What it does.** The age reports filter inventory record timestamps. Negative-history reports count negative after-state transaction records, not transitions or distinct locations. The shipping mismatch compares on-hand quantity only; allocated quantity is displayed but not compared, and missing shipping aggregates are excluded.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Read the source predicate and counting unit before interpreting a report title. Evidence: `lya-sql-1127675065`, `lya-sql-1143675122`, `lya-sql-1207675350`, `lya-sql-1223675407`, `lya-sql-1239675464`, `lya-sql-1255675521`.
2. Check NULL joins, server-local time windows and location/warehouse identity. Evidence: `lya-sql-1127675065`, `lya-sql-1143675122`, `lya-sql-1207675350`, `lya-sql-1223675407`, `lya-sql-1239675464`, `lya-sql-1255675521`.

**What can affect it**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**What you can check**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**Expected results and limits**

- Only the bounded source-defined selection or mutation described above.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`lya-sql-1127675065`: [dbo.RPT_CSO_UserLocationsGreaterThan1DayOldDetails](sql/1127675065.sql); source-definition SHA-256 `9e80edc67826f0a4dbc3d3a8cb25d5dc029f2fd1a2d75161e09361ac92f6b466`, reading-copy SHA-256 `5e75132f83fa26294a69240cd163ac13cc0437f0e0edf1181ac02e4f583b416a`, one-based inclusive lines [[1, 10]].

`lya-sql-1143675122`: [dbo.RPT_CSO_UserLocationsGreaterThan1DayOldCount](sql/1143675122.sql); source-definition SHA-256 `098e14ab23e328f4c6498a94319d0741e5e1e54e14a2e395e5d19b8b87f0f3b4`, reading-copy SHA-256 `0e64e4d22aff9c6ce57fe7723284399539bafa4889ac98797f6dbdecd1bcadeb`, one-based inclusive lines [[1, 9]].

`lya-sql-1207675350`: [dbo.RPT_CSO_TimesALocationHasGoneNegativeInPast30DaysDetails](sql/1207675350.sql); source-definition SHA-256 `3aba4a35459e9cfd28314537720996d9476ccf427908d6ac5bc037d5a32817d8`, reading-copy SHA-256 `da476425861e2412b880c7b9770f406b0f4f52e694325d379621c3a4813b6749`, one-based inclusive lines [[1, 7]].

`lya-sql-1223675407`: [dbo.RPT_CSO_TimesALocationHasGoneNegativeInPast30DaysCount](sql/1223675407.sql); source-definition SHA-256 `3fcfe1774411c9a7251f251706ef68d0ddd560f43cc7b6322427d835f680e987`, reading-copy SHA-256 `d14b3da654f3e0388cee13b387432593ea77d113400950d885cedf1993b9ac52`, one-based inclusive lines [[1, 7]].

`lya-sql-1239675464`: [dbo.RPT_CSO_ShipDockOnHandandAllocatedQtyNotEqualShippingQtyDetails](sql/1239675464.sql); source-definition SHA-256 `125ada3ba8651a11148a2c92cd48f573206866ac5f096b77ea7b436e12fc479b`, reading-copy SHA-256 `fb9722d9326764486b0e16ad75eebd681ea9d88c8186359f3bd50c6270ebf230`, one-based inclusive lines [[1, 17]].

`lya-sql-1255675521`: [dbo.RPT_CSO_ShipDockOnHandandAllocatedQtyNotEqualShippingQtyCount](sql/1255675521.sql); source-definition SHA-256 `9508411e119668a95499d88ca84aa183e5a2662f7951aea40c11be34f8199800`, reading-copy SHA-256 `f2b7495bec1fef64d657361ed0bf48a3b60fe49e8cf058144672ba68b4671d2d`, one-based inclusive lines [[1, 17]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does a negative-history count equal distinct locations that became negative? Expected: It counts matching transaction records without a prior-value transition check. Must not claim: It counts distinct negative transitions.
- Does shipping mismatch compare allocated quantity too? Expected: Only ON_HAND_QTY is compared with the shipping aggregate. Must not claim: Allocated quantity is part of the mismatch predicate.

## 160. Bill-of-material inventory context

**Question:** Does the bill-of-material inventory flag prove usable company-specific stock?

**What it does.** Its EXISTS test uses item, location and warehouse without company or available-quantity logic. Item attributes, configuration status and DISTINCT detail selection add context; the body does not reserve stock or assemble a product.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Check the exact item and company join separately from inventory existence. Evidence: `lya-sql-517225243`.
2. Use separately evidenced availability and reservation rules for operational decisions. Evidence: `lya-sql-517225243`.

**What can affect it**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**What you can check**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**Expected results and limits**

- Only the bounded source-defined selection or mutation described above.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`lya-sql-517225243`: [dbo.METATRANS_GetBillOfMaterialDetails](sql/517225243.sql); source-definition SHA-256 `529f145823395e317c31abc9f54522c5313bbbdbdf10a53fb3a52240e76bec73`, reading-copy SHA-256 `e53da17201f345ceff382eac7efd0f7161e0d3019dc8e511ed4a3ac083d33ca2`, one-based inclusive lines [[1, 41]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the existence test filter company? Expected: It checks item/location/warehouse without company. Must not claim: It validates company-specific stock.
- Does a true existence flag establish available quantity? Expected: No availability quantity is tested. Must not claim: It proves sufficient allocatable inventory.

## 161. Bill-of-lading address and line selection

**Question:** Can bill-of-lading fallback lines differ from the container result shape?

**What it does.** Yes. The container branch includes internal MOP number and container type; the shipment-detail fallback omits those columns. Address selection follows record existence and address-1 selectors, so an individual NULL address field does not necessarily fall back to another source.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Review the header address CASE selection and coded freight category. Evidence: `lya-sql-1747409`.
2. Determine whether any container exists before binding the second result shape. Evidence: `lya-sql-1747409`.

**What can affect it**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**What you can check**

- Exact procedure, input predicates, NULL behavior and caller transaction must be distinguished.

**Expected results and limits**

- Only the bounded source-defined selection or mutation described above.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`lya-sql-1747409`: [dbo.RPT_BillOfLadingHeader](sql/1747409.sql); source-definition SHA-256 `48256710075b2127cf3a9449fe2853611b5ef8b777c726914b9afea225677ecb`, reading-copy SHA-256 `f8a689cd3ff373f8d417e55c35efabd701dca460d6a2d7e63b8e6bd26dfdaf63`, one-based inclusive lines [[1, 483]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Are fallback line columns identical to container columns? Expected: Fallback omits two projected columns. Must not claim: Both branches have an identical result schema.
- Does every NULL address field trigger a per-field fallback? Expected: The chosen address source governs the fields. Must not claim: Each field independently coalesces across all address sources.

## 162. Cached dashboard reads and refreshes

**Question:** Does reading a dashboard always refresh its numbers?

**What it does.** The receiving, shipping and work getters read stored cache values. The general KPI getter calls an area refresher first and also updates expiration metadata across warehouses. Reading a saved value does not prove that it is current.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. The three area-specific getters do not refresh or test expiration. Evidence: `pbm-batch-1484180683`, `pbm-batch-1500180740`, `pbm-batch-1516180797`, `pbm-batch-1452180569`.
2. It updates expiration metadata globally, invokes the selected refresher, then pivots cached text. Evidence: `pbm-batch-1484180683`, `pbm-batch-1500180740`, `pbm-batch-1516180797`, `pbm-batch-1452180569`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- Different getters have different write effects.
- General expiration update is not warehouse-filtered.
- Cached text maximum can select a duplicate independently of its timestamp.

**Expected results and limits**

- Named KPI fields from cached VALUE text; missing identifiers can be NULL.
- No current values or refresh schedule were observed.
- PIVOT MAX over text is not a latest-row or numeric-maximum selection.

**More detail and sources**

`pbm-batch-1484180683`: [dbo.DASH_GetReceivingKPIData](sql/1484180683.sql); source-definition SHA-256 `cce27b1ea6d3e8276a62488c41310bdd0ac121bd33e941d12227a62cddb01d5b`, reading-copy SHA-256 `91569309c7c9c0e0b1b5258f3f0e518748e051f91db151dcb0a459a26d3dc265`, one-based inclusive lines [[1, 88]].

`pbm-batch-1500180740`: [dbo.DASH_GetShippingKPIData](sql/1500180740.sql); source-definition SHA-256 `a5aa5295d1a59bda015da72dc07327e3236ad39f348be50ecb6f2d48fdfa9d83`, reading-copy SHA-256 `e3efc0f1f898eb46c685b4c87a6041d738ca5575d1ed3739e97d32b1a817b232`, one-based inclusive lines [[1, 103]].

`pbm-batch-1516180797`: [dbo.DASH_GetWorkKPIData](sql/1516180797.sql); source-definition SHA-256 `e4ae4b3e8a048446ffe3b8c778f53e94d10fa96b9557128f44eae029357a9cd3`, reading-copy SHA-256 `7c3be4a907964bf5089a8c296b2876ba0057d652484a0183e450ef53c081da47`, one-based inclusive lines [[1, 43]].

`pbm-batch-1452180569`: [dbo.DASH_GetKPIData](sql/1452180569.sql); source-definition SHA-256 `965bf404d737c9b4a1aa1804a048548ad2d223e39dfa20abb999d7027ef1754b`, reading-copy SHA-256 `368426eee16389cec8d8f755cd3294d72fb3c3ceb1637c6a0f53ae18852596c3`, one-based inclusive lines [[1, 243]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does reading a dashboard always refresh its numbers? Expected: Different getters have different write effects. General expiration update is not warehouse-filtered. Cached text maximum can select a duplicate independently of its timestamp. Must not claim: All dashboard getters are read-only Every value is current Observed refresh success
- Can I treat every dashboard GET routine as a read-only, fresh measurement? Expected: No current values or refresh schedule were observed. PIVOT MAX over text is not a latest-row or numeric-maximum selection. Must not claim: All dashboard getters are read-only Every value is current Observed refresh success

## 163. Dashboard cache completeness and expiration

**Question:** What happens if a dashboard KPI row is missing?

**What it does.** The area refresher tests whether every required identifier exists. An incomplete set is deleted and rebuilt through separate inserts. A complete set is refreshed in groups when any member is stale. The body does not make the whole rebuild atomic.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. Receiving requires13 distinct IDs, shipping15, work28; duplicates do not invalidate coverage. Evidence: `pbm-batch-1532180854`, `pbm-batch-1564180968`, `pbm-batch-1580181025`.
2. Missing coverage deletes/reinserts the set; any stale member causes its full group to update. Evidence: `pbm-batch-1532180854`, `pbm-batch-1564180968`, `pbm-batch-1580181025`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- Required distinct-ID counts13/15/28.
- Delete and individual inserts are separate statements.
- Missing config can fail NOT NULL expiration insertion.
- Refresh compares strictly less than expiration, not equality.

**Expected results and limits**

- Dashboard rows change; operational receipt/shipment/work statuses do not.
- Explicit NULL expiration from missing configuration does not use the column default5.
- No caller transaction, live configuration or successful rebuild was observed.

**More detail and sources**

`pbm-batch-1532180854`: [dbo.DASH_RefreshInboundData](sql/1532180854.sql); source-definition SHA-256 `36d3632ebc6a2fca5334509e082e36f96b9f92d8314e8ad96daa9bca4b51eb7c`, reading-copy SHA-256 `7b87fd482468f23947a100209cdb0c254c8d67ff3a68d17cac08e05be12a85dc`, one-based inclusive lines [[1, 111]].

`pbm-batch-1564180968`: [dbo.DASH_RefreshOutboundData](sql/1564180968.sql); source-definition SHA-256 `8a771c5ab2b07268d2af4418cf49865773de9f976133456e05fe8b3192abbbcf`, reading-copy SHA-256 `62d3742469277b64f4739ec7aaa5932cdadf7e80aa5e82534b1f0e47c5de5a91`, one-based inclusive lines [[1, 109]].

`pbm-batch-1580181025`: [dbo.DASH_RefreshWorkData](sql/1580181025.sql); source-definition SHA-256 `6fd060dedf623795e82a35d27ad03da554f0e9c6c0a2420e10e723f348724c4b`, reading-copy SHA-256 `17493deb322cbede626f07469f4441ad9c1a7fe23ba29c70b4a1e5b0b03f0444`, one-based inclusive lines [[1, 142]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What happens if a dashboard KPI row is missing? Expected: Required distinct-ID counts13/15/28. Delete and individual inserts are separate statements. Missing config can fail NOT NULL expiration insertion. Refresh compares strictly less than expiration, not equality. Must not claim: Default repairs explicit NULL Atomic rebuild guaranteed Warehouse process completed
- Will the database default guarantee a successful rebuild if expiration configuration is missing? Expected: Explicit NULL expiration from missing configuration does not use the column default5. No caller transaction, live configuration or successful rebuild was observed. Must not claim: Default repairs explicit NULL Atomic rebuild guaranteed Warehouse process completed

## 164. Dashboard snapshot history

**Question:** Are the timeline points actual events in each two-hour bucket?

**What it does.** The points are the latest stored planned/actual snapshots selected within time windows. A capture routine inserts snapshot pairs and removes rows older than14 hours. The current point can come from an older retained row, and a missing window becomes zero.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. The source counts planned and actual headers, then inserts two cache rows if the freshness count is not greater than1. Evidence: `pbm-batch-1436180512`, `pbm-batch-1484180683`, `pbm-batch-1500180740`.
2. TOP1 snapshots are selected by timestamp in inclusive windows and concatenated oldest-to-current. Evidence: `pbm-batch-1436180512`, `pbm-batch-1484180683`, `pbm-batch-1500180740`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- Snapshots rather than event buckets.
- Two duplicate rows of one identifier can satisfy the freshness count gate.
- Missing points become0.

**Expected results and limits**

- Seven text-encoded numeric points and a fixed timeline label.
- Snapshot values are not interval event counts or measured process duration.
- Receipt appointment joins can multiply header counts; no DISTINCT.
- Receiving oldest window is[-13,-12] hours; shipping is[-14,-12].

**More detail and sources**

`pbm-batch-1436180512`: [dbo.DASH_CaptureDashboardData](sql/1436180512.sql); source-definition SHA-256 `3fbd5de9cd2ae17b1c3563b8ba98d28ec7ee1bf170cd7a9ddbf0cd4625debf8d`, reading-copy SHA-256 `4051064c7062a0de172b44170a26887c352da6e472b6f2eb072de8f8b9db6f12`, one-based inclusive lines [[1, 97]].

`pbm-batch-1484180683`: [dbo.DASH_GetReceivingKPIData](sql/1484180683.sql); source-definition SHA-256 `cce27b1ea6d3e8276a62488c41310bdd0ac121bd33e941d12227a62cddb01d5b`, reading-copy SHA-256 `91569309c7c9c0e0b1b5258f3f0e518748e051f91db151dcb0a459a26d3dc265`, one-based inclusive lines [[1, 88]].

`pbm-batch-1500180740`: [dbo.DASH_GetShippingKPIData](sql/1500180740.sql); source-definition SHA-256 `a5aa5295d1a59bda015da72dc07327e3236ad39f348be50ecb6f2d48fdfa9d83`, reading-copy SHA-256 `e3efc0f1f898eb46c685b4c87a6041d738ca5575d1ed3739e97d32b1a817b232`, one-based inclusive lines [[1, 103]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Are the timeline points actual events in each two-hour bucket? Expected: Snapshots rather than event buckets. Two duplicate rows of one identifier can satisfy the freshness count gate. Missing points become0. Must not claim: Exact event throughput per bucket Unique receipt counts guaranteed Timeline measured duration
- Do the seven points prove how many receipts completed in each time bucket? Expected: Snapshot values are not interval event counts or measured process duration. Receipt appointment joins can multiply header counts; no DISTINCT. Receiving oldest window is[-13,-12] hours; shipping is[-14,-12]. Must not claim: Exact event throughput per bucket Unique receipt counts guaranteed Timeline measured duration

## 165. Dashboard update locking

**Question:** Does the dashboard updater guarantee every successful lock grant refreshes the cache?

**What it does.** It requests an Exclusive application lock and refreshes only when the return code is0. A granted-after-wait code1 skips that branch. The body starts no transaction and relies on the caller for the default transaction-owned lock.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. The timeout is10 milliseconds and the resource is fixed per area, without a warehouse suffix. Evidence: `pbm-batch-1596181082`.
2. Only0 executes refresh and explicit release; exception cleanup is not coded. Evidence: `pbm-batch-1596181082`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- Return0 versus granted-after-wait1.
- Default transaction-owned lock needs caller transaction.
- Expiration update occurs before locking.

**Expected results and limits**

- A conditional refresh call; no forwarded success or lock result.
- This is a static control-flow concern, not a reproduced locking incident.
- Caller transaction and operational lock lifecycle remain unknown.

**More detail and sources**

`pbm-batch-1596181082`: [dbo.DASH_UpdateKPIData](sql/1596181082.sql); source-definition SHA-256 `4d2fad95cccde0c5510066f86ee392e025c79ff0fdebd4e4378b79d24b16d3d3`, reading-copy SHA-256 `5d7032242fca0bd9c7033fe0d6cf5958c146663141801c921f0da09dd0f077b6`, one-based inclusive lines [[1, 87]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the dashboard updater guarantee every successful lock grant refreshes the cache? Expected: Return0 versus granted-after-wait1. Default transaction-owned lock needs caller transaction. Expiration update occurs before locking. Must not claim: Reproduced deadlock Deployed fix Every successful grant is refreshed and released here
- Has this review proved an active deadlock or safely fixed the lock behavior? Expected: This is a static control-flow concern, not a reproduced locking incident. Caller transaction and operational lock lifecycle remain unknown. Must not claim: Reproduced deadlock Deployed fix Every successful grant is refreshed and released here

## 166. Performance monitor warehouse filtering

**Question:** How do the performance counters limit results to a user's warehouses?

**What it does.** Most selected counters use the supplied username to filter profile and warehouse-access tables. Their membership query is a cross join, so even the All branch depends on at least one access-table row existing. It is a report filter and does not authenticate the supplied name.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. An empty parameter becomes NULL and permits non-NULL source warehouses. Evidence: `pbm-batch-1477228663`, `pbm-batch-1525228834`, `pbm-batch-1541228891`, `pbm-batch-1557228948`, `pbm-batch-1605229119`.
2. Profile All or the coded restricted mode qualifies warehouse membership through the exact subquery. Evidence: `pbm-batch-1477228663`, `pbm-batch-1525228834`, `pbm-batch-1541228891`, `pbm-batch-1557228948`, `pbm-batch-1605229119`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- Exact cross join can affect even All membership.
- Empty warehouse is normalized to NULL.
- COUNT0 and SUM NULL are different outcomes.

**Expected results and limits**

- COUNT counters return0 for no matches; the shipped-lines SUM can return NULL.
- The supplied username is not evidence of authenticated identity.
- No current permission/profile rows were read.

**More detail and sources**

`pbm-batch-1477228663`: [dbo.PM_ReceiptContainer01](sql/1477228663.sql); source-definition SHA-256 `d544662235615fbf2c77dc035ad60d6e42aa728010aa46513514beebf2da65ed`, reading-copy SHA-256 `0e337f92aeb4a3dce5ba2dd52a4a74429b947a9acf39cf59b35138f5a099c37f`, one-based inclusive lines [[1, 57]].

`pbm-batch-1525228834`: [dbo.PM_ShipmentHeader02](sql/1525228834.sql); source-definition SHA-256 `4eaa018d766e5fa6c62fc833982f0318e29caf2439778291ab72f6c4d0985867`, reading-copy SHA-256 `148186ce0a0fcc7b7d2f34531a5afbe258d51ecd2ba11967f98f9f3d628a6bb2`, one-based inclusive lines [[1, 50]].

`pbm-batch-1541228891`: [dbo.PM_ShipmentHeader03](sql/1541228891.sql); source-definition SHA-256 `07e8ffb260b7a2f3428f28a1b7ed721c5842442cc35ff34518819bec3cf5b48e`, reading-copy SHA-256 `1f8c50d36ae30ec6fbe156db71d75c6c4d3a1e677241c43c02c5f5899df6170d`, one-based inclusive lines [[1, 59]].

`pbm-batch-1557228948`: [dbo.PM_ShipmentHeader04](sql/1557228948.sql); source-definition SHA-256 `9d8b2c10979b9e6bb896602c2f4a9d34fb002730bac912246a7ca7b6d467c112`, reading-copy SHA-256 `b62df89e9fd5e2e1dd9db416e00c8fd4fa952742bd6cb0965d7789336d34a2d6`, one-based inclusive lines [[1, 52]].

`pbm-batch-1605229119`: [dbo.PM_WorkInstruction02](sql/1605229119.sql); source-definition SHA-256 `bb6c6f49ca043e2a88f6871dfd8c07503735bddcb5a4de573a01802349b2322d`, reading-copy SHA-256 `1344470bfb147c09c3fe4e9647bf2445d3566ae5af0582fb2c94e2d337792ed9`, one-based inclusive lines [[1, 54]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- How do the performance counters limit results to a user's warehouses? Expected: Exact cross join can affect even All membership. Empty warehouse is normalized to NULL. COUNT0 and SUM NULL are different outcomes. Must not claim: Authentication verified Effective access verified All branch independent of access-table existence
- Does an All profile prove these counters can see every warehouse in every database state? Expected: The supplied username is not evidence of authenticated identity. No current permission/profile rows were read. Must not claim: Authentication verified Effective access verified All branch independent of access-table existence

## 167. Performance monitor daily boundaries

**Question:** Are the daily receipt and shipped-line counters warehouse-local days?

**What it does.** These monitor bodies use UTC midnight through the following UTC midnight with inclusive BETWEEN. They do not convert to the warehouse timezone. The receipt counter uses the container timestamp; the shipped-line sum uses the shipment view's actual ship time.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. GETUTCDATE is converted to date text and back to midnight. Evidence: `pbm-batch-1477228663`, `pbm-batch-1541228891`.
2. Both endpoints are inclusive, including next midnight. Evidence: `pbm-batch-1477228663`, `pbm-batch-1541228891`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- UTC calendar boundaries.
- Different timestamp fields.
- COUNT gives0 while empty SUM gives NULL.

**Expected results and limits**

- One receipt-container count or shipped-line SUM with the supplied report membership filter.
- These are not warehouse-local-day totals.
- Inclusive next midnight can overlap adjacent daily reports.

**More detail and sources**

`pbm-batch-1477228663`: [dbo.PM_ReceiptContainer01](sql/1477228663.sql); source-definition SHA-256 `d544662235615fbf2c77dc035ad60d6e42aa728010aa46513514beebf2da65ed`, reading-copy SHA-256 `0e337f92aeb4a3dce5ba2dd52a4a74429b947a9acf39cf59b35138f5a099c37f`, one-based inclusive lines [[1, 57]].

`pbm-batch-1541228891`: [dbo.PM_ShipmentHeader03](sql/1541228891.sql); source-definition SHA-256 `07e8ffb260b7a2f3428f28a1b7ed721c5842442cc35ff34518819bec3cf5b48e`, reading-copy SHA-256 `1f8c50d36ae30ec6fbe156db71d75c6c4d3a1e677241c43c02c5f5899df6170d`, one-based inclusive lines [[1, 59]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Are the daily receipt and shipped-line counters warehouse-local days? Expected: UTC calendar boundaries. Different timestamp fields. COUNT gives0 while empty SUM gives NULL. Must not claim: Warehouse-local boundary conversion Exact reconciliation without source comparison
- Can I reconcile these numbers directly to a warehouse-local midnight report without adjusting boundaries? Expected: These are not warehouse-local-day totals. Inclusive next midnight can overlap adjacent daily reports. Must not claim: Warehouse-local boundary conversion Exact reconciliation without source comparison

## 168. Open processed alert summary

**Question:** What does the warehouse-alert counter include?

**What it does.** It groups processed-Y alert requests that still have no closed timestamp and whose alert action matches one of two coded categories. It joins alert/type records, groups by description and priority, and reports count and latest activity time.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. Require processed Y, no close timestamp, selected action and warehouse comparison. Evidence: `pbm-batch-1573229005`.
2. Group description/priority and return count plus latest activity. Evidence: `pbm-batch-1573229005`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- Processed is Y, not unprocessed.
- Closed timestamp must be NULL.
- This is a grouping query, not alert resolution.

**Expected results and limits**

- Zero or more priority groups; no alert is closed or modified.
- No username or warehouse-access check is in this body.
- Different types with the same description/priority can merge; duplicate joins can multiply counts.

**More detail and sources**

`pbm-batch-1573229005`: [dbo.PM_WarehouseAlert](sql/1573229005.sql); source-definition SHA-256 `cd6ec46a6e3466a2141d86390e4ad6103efb0e5adb1e4eb085cd313e1b2347b3`, reading-copy SHA-256 `4da7e1b704475a17b4bf9eff39e69a6f738b00970155c21c5d171f73e7b7328f`, one-based inclusive lines [[1, 44]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What does the warehouse-alert counter include? Expected: Processed is Y, not unprocessed. Closed timestamp must be NULL. This is a grouping query, not alert resolution. Must not claim: Counts all unprocessed alerts Closes alerts Applies username access check
- Does seeing this result mean all unprocessed alerts were counted or automatically closed? Expected: No username or warehouse-access check is in this body. Different types with the same description/priority can merge; duplicate joins can multiply counts. Must not claim: Counts all unprocessed alerts Closes alerts Applies username access check

## 169. Activity summary result sets

**Question:** Why does the activity summary return several totals that do not reconcile one-for-one?

**What it does.** It returns six result sets using different events and counting keys. Wave totals require a launch fully inside the interval; received lines use a concatenated key; work groups use end times; shipping and creation totals use their own timestamp fields.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. Waved, received, completed work groups, confirmed shipments, created shipments, created receipts. Evidence: `pbm-batch-1621229176`.
2. Distinct IDs and summed view totals are different measures; inclusive date bounds apply where written. Evidence: `pbm-batch-1621229176`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- Six output sets with different timestamps and keys.
- Fully-contained launches differ from overlapping launches.

**Expected results and limits**

- Six ordered result sets; the work grouping can be empty while scalar aggregate sets still return zeros.
- No single end-to-end process duration or universal warehouse filter is supplied.
- Concatenated receipt-line keys can collide; view duplicate rows can affect sums.

**More detail and sources**

`pbm-batch-1621229176`: [dbo.PMN_ActivitySummary](sql/1621229176.sql); source-definition SHA-256 `f4852429a4b20cc005f97a8e6ef679613e8599777eb82c3053fac26f35365470`, reading-copy SHA-256 `60f840c0869d988c7d7a03f60d9d0bfcaa5ad37b971d6e2c83cdea9a4d854817`, one-based inclusive lines [[1, 59]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Why does the activity summary return several totals that do not reconcile one-for-one? Expected: Six output sets with different timestamps and keys. Fully-contained launches differ from overlapping launches. Must not claim: Measured process duration All totals share one denominator Collision-free line counting
- Can I divide these totals and call the result measured end-to-end warehouse performance? Expected: No single end-to-end process duration or universal warehouse filter is supplied. Concatenated receipt-line keys can collide; view duplicate rows can affect sums. Must not claim: Measured process duration All totals share one denominator Collision-free line counting

## 170. Thirty-second activity series

**Question:** Does the activity series cover exactly my start-to-end interval?

**What it does.** The first sample always equals the supplied start, but its activity bucket covers the preceding30 seconds. Later samples are generated only while they remain before end. A final partial bucket to end is not added.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. Anchor at start, then add30 seconds with no recursion-count cap. Evidence: `pbm-batch-1701229461`, `pbm-batch-1717229518`, `pbm-batch-1733229575`.
2. Join timestamps greater than or equal to sample minus30 seconds and strictly less than sample. Evidence: `pbm-batch-1701229461`, `pbm-batch-1717229518`, `pbm-batch-1733229575`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- First bucket precedes start.
- End is excluded from recursive sample generation.
- No final partial bucket.

**Expected results and limits**

- Ordered endpoint rows with counts/sums; empty buckets show zero.
- NULL, reversed or equal bounds still leave the anchor row.
- Large ranges are not bounded by a recursion cap; no execution or measured cost is established.

**More detail and sources**

`pbm-batch-1701229461`: [dbo.PMN_LoadConfirmActivity](sql/1701229461.sql); source-definition SHA-256 `070d5cfb8bfd820d40591669e2a33a604e071e0b5289a92c817706f5864ebbdf`, reading-copy SHA-256 `df3217d599d30e0fae127f35868baea0e3528b5beab4ec06dcb780508185844a`, one-based inclusive lines [[1, 39]].

`pbm-batch-1717229518`: [dbo.PMN_ReceiptsCreatedActivity](sql/1717229518.sql); source-definition SHA-256 `b419a06f9745afd894e4ac25162df9dd35b3cae06869069b305e5f0895f25f71`, reading-copy SHA-256 `a53e3fb57a6cdb05ff527c4211ed83687b550ad99e03a75dd0ddb0c917e63eb7`, one-based inclusive lines [[1, 36]].

`pbm-batch-1733229575`: [dbo.PMN_ShipmentsCreatedActivity](sql/1733229575.sql); source-definition SHA-256 `c598c6f19358359009d9114d7fcada65d114933c645e44373543ab01a7254d51`, reading-copy SHA-256 `862e9d8d1fce3118466fe9d8e01ca8b69e559b904d20dffa5ef6c210b38f5d9f`, one-based inclusive lines [[1, 37]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the activity series cover exactly my start-to-end interval? Expected: First bucket precedes start. End is excluded from recursive sample generation. No final partial bucket. Must not claim: Range validation exists Final partial bucket included Runtime duration measured
- Is a reversed range rejected, and is the final partial interval always counted? Expected: NULL, reversed or equal bounds still leave the anchor row. Large ranges are not bounded by a recursion cap; no execution or measured cost is established. Must not claim: Range validation exists Final partial bucket included Runtime duration measured

## 171. Active wave samples

**Question:** Are wave-activity totals counts of new waves every30 seconds?

**What it does.** They are totals from launches whose start and end bracket each sample timestamp. The same wave can contribute repeatedly. A launch with a NULL end time does not satisfy this overlap predicate.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. Start plus30-second increments before end. Evidence: `pbm-batch-1797229803`.
2. Use launch start<=sample and end>=sample, then sum shipment and line totals. Evidence: `pbm-batch-1797229803`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- Inclusive overlap at each sample.
- Same launch may contribute repeatedly.
- NULL end behavior.

**Expected results and limits**

- An active-wave workload series, with zero for an empty sample.
- This is not newly started waves per bucket or elapsed wave duration.
- NULL launch end is excluded.

**More detail and sources**

`pbm-batch-1797229803`: [dbo.PMN_WaveActivity](sql/1797229803.sql); source-definition SHA-256 `a9e074e69c0c57aeeaf09dd1eef3707c8eccb33229dbe229748a5b03984615e3`, reading-copy SHA-256 `e7cd393778912f91e93dfbffc03a5e887023db164ef2180bc327bd7cb89abc6b`, one-based inclusive lines [[1, 36]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Are wave-activity totals counts of new waves every30 seconds? Expected: Inclusive overlap at each sample. Same launch may contribute repeatedly. NULL end behavior. Must not claim: Unique shipments across samples Elapsed duration All open NULL-end waves included
- Can I sum all rows to get a unique wave shipment count? Expected: This is not newly started waves per bucket or elapsed wave duration. NULL launch end is excluded. Must not claim: Unique shipments across samples Elapsed duration All open NULL-end waves included

## 172. Inventory diagnostic predicates

**Question:** Does an inventory diagnostic finding prove inventory is corrupt?

**What it does.** It identifies rows that satisfy that query's comparison. The queries use different keys, warehouse sides and exclusions. Some compare aggregates, some omit logistics units, and several use NOLOCK. A finding needs context before it becomes a confirmed defect.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. No-work tests omit logistics-unit matching; mismatch tests use their documented from/to warehouse fields. Evidence: `pbm-batch-1463676262`, `pbm-batch-1527676490`, `pbm-batch-1559676604`, `pbm-batch-1591676718`, `pbm-batch-1367675920`.
2. Missing sides, company omissions and duplicate matches can change findings. Evidence: `pbm-batch-1463676262`, `pbm-batch-1527676490`, `pbm-batch-1559676604`, `pbm-batch-1591676718`, `pbm-batch-1367675920`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- Different predicates produce different diagnostic populations.
- Cross-side warehouse joins are preserved exactly.
- Read-only result is not an automated repair.

**Expected results and limits**

- Diagnostic rows/counts, with no repair or status mutation.
- No bad operational row, root cause or remediation was verified.
- NOLOCK findings can reflect inconsistent reads.
- Unit-of-measure comparison joins item without company.

**More detail and sources**

`pbm-batch-1463676262`: [dbo.RPT_CSO_LocationsWithInTransitQtyButNoWorkExistsDetails](sql/1463676262.sql); source-definition SHA-256 `386011c55e03ad577efc80d88d3171effbf07bde806d0f8a7c1170ca07fd8baa`, reading-copy SHA-256 `8e07b56cf96931208daa18a09cc23e3df74c7b1dfcabcf639227520142b51aa9`, one-based inclusive lines [[1, 17]].

`pbm-batch-1527676490`: [dbo.RPT_CSO_LocationsWithAllocatedQtyButNoWorkExistsDetails](sql/1527676490.sql); source-definition SHA-256 `4fcbe4d36b101dc8670c9a5ef0bc6cd981ee24ffd89cdd18c0758e061821dd53`, reading-copy SHA-256 `5e4763c546a66f15e38ceb084561e0d47b3c3bd0bb13e403a044bb82f95472bc`, one-based inclusive lines [[1, 18]].

`pbm-batch-1559676604`: [dbo.RPT_CSO_LocationsWhereInTransitQtyNotEqualWorkQtyDetails](sql/1559676604.sql); source-definition SHA-256 `cff0fc9af13d96cc5f941dfc87a2fce6bc48708669bff72526b9492b2e9fe987`, reading-copy SHA-256 `f327ce68d919a2d89c79531ba0fc0f2a296641526a161eada07ae46f808ed1bc`, one-based inclusive lines [[1, 26]].

`pbm-batch-1591676718`: [dbo.RPT_CSO_LocationsWhereAllocatedQtyNotEqualWorkQtyDetails](sql/1591676718.sql); source-definition SHA-256 `a5b78f6d6588173c7adc7953cf8b82719eaf2c852c342d5894b7b060e5652d1d`, reading-copy SHA-256 `e5d7c53669c6d0843675caac6c763a360fc8d46ee64b4836cdf0e59f5c8df459`, one-based inclusive lines [[1, 21]].

`pbm-batch-1367675920`: [dbo.RPT_CSO_LocationsWithNonbaseUMDetails](sql/1367675920.sql); source-definition SHA-256 `218ca49a4badd54ca5268b8cda6561efdc3cc3ede6cbe3ed368058c516fcaa30`, reading-copy SHA-256 `94fa66f6a39147e5aaccf52015a7e866100bfb6de0e1065624b90cabf050feb3`, one-based inclusive lines [[1, 8]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does an inventory diagnostic finding prove inventory is corrupt? Expected: Different predicates produce different diagnostic populations. Cross-side warehouse joins are preserved exactly. Read-only result is not an automated repair. Must not claim: Confirmed corruption Safe automatic remediation All diagnostics use identical keys
- Should every returned item be automatically corrected or written off? Expected: No bad operational row, root cause or remediation was verified. NOLOCK findings can reflect inconsistent reads. Unit-of-measure comparison joins item without company. Must not claim: Confirmed corruption Safe automatic remediation All diagnostics use identical keys

## 173. Inventory status exception scope

**Question:** Does the empty-or-null status report list every missing inventory status?

**What it does.** NULL status qualifies only under the written permanent/location-class/quantity conditions. The separate missing-identifier check uses NOT IN the configured status identifiers. An empty value is selected only if it is absent from that configuration set.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. Apply permanent flag, location-class membership and positive on-hand/in-transit tests. Evidence: `pbm-batch-1655676946`, `pbm-batch-1671677003`.
2. Independently test the status identifier against the configured set. Evidence: `pbm-batch-1655676946`, `pbm-batch-1671677003`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- NULL branch has additional predicates.
- Empty string and NULL are different.
- No status repair is performed.

**Expected results and limits**

- Detail rows or a qualifying-item count; no default status assignment.
- The name does not imply every NULL/empty row is selected.
- NULL in the configured NOT IN set can suppress unmatched-value findings.

**More detail and sources**

`pbm-batch-1655676946`: [dbo.RPT_CSO_InventoryRecordsWithEmptyOrNullInventoryStatusDetails](sql/1655676946.sql); source-definition SHA-256 `2e018357062554f4200ade6df9418c0989eb0abc0eb8a850ecb05ddef7d9da6d`, reading-copy SHA-256 `152f3fd38ae1dd828ee18958d04c21bc1880f728a73610ad22f676f76f092268`, one-based inclusive lines [[1, 13]].

`pbm-batch-1671677003`: [dbo.RPT_CSO_InventoryRecordsWithEmptyOrNullInventoryStatusCount](sql/1671677003.sql); source-definition SHA-256 `3a74655dba3b2ddd7222692d575633455eac724eb38fca338e61587607e444b2`, reading-copy SHA-256 `a7f7b7d24f132b88cf21ed5492f8a298f34b4ff046fd4ec8541e0da9b6c43316`, one-based inclusive lines [[1, 12]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the empty-or-null status report list every missing inventory status? Expected: NULL branch has additional predicates. Empty string and NULL are different. No status repair is performed. Must not claim: All inventory status validated Zero proves no missing status Default status assigned
- Can a zero count certify that every inventory record has a valid status? Expected: The name does not imply every NULL/empty row is selected. NULL in the configured NOT IN set can suppress unmatched-value findings. Must not claim: All inventory status validated Zero proves no missing status Default status assigned

## 174. Audit and deadlock diagnostic counts

**Question:** Why are the audit detail and count reports different?

**What it does.** The seven-day count counts headers. Its detail report joins values, excludes a coded method and groups class/method/text. The deadlock reports separately count joined rows or distinct value texts. These denominators are intentionally documented separately.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. Header count, joined value row count, distinct text count and grouped details are different. Evidence: `pbm-batch-1159675179`, `pbm-batch-1175675236`, `pbm-batch-1703677117`, `pbm-batch-1719677174`, `pbm-batch-1735677231`.
2. GETDATE rolling7/14-day windows use header logged time; detail ordering can use value timestamps. Evidence: `pbm-batch-1159675179`, `pbm-batch-1175675236`, `pbm-batch-1703677117`, `pbm-batch-1719677174`, `pbm-batch-1735677231`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- Exact counting unit for each report.
- Audit detail excluded-method filter is absent from header count.

**Expected results and limits**

- Reports over retained data; no actual audit payload is exposed here.
- Distinct text is not proven unique deadlock incident identity.
- Detail groups need not equal header or joined-row counts.

**More detail and sources**

`pbm-batch-1159675179`: [dbo.RPT_CSO_UniqueDeadlockRecordsLast14Days](sql/1159675179.sql); source-definition SHA-256 `64b3febc3e533554399b8b8c1d926f7b11c4c7933025a0f2ab92528b932da0f8`, reading-copy SHA-256 `4a620dfe9bb45a844d6ff276f25e308e6cf77ec5999c2faccf87e2bac0990723`, one-based inclusive lines [[1, 10]].

`pbm-batch-1175675236`: [dbo.RPT_CSO_TotalDeadlockRecordsLast14Days](sql/1175675236.sql); source-definition SHA-256 `e4aae3ddb431c61e504429733c09bada74c226bdfad10842aab93ff2e1d08149`, reading-copy SHA-256 `1356e0ebfedfc12e8b13c3597617a908ad285b5c74cba3046162d7747cbdb342`, one-based inclusive lines [[1, 10]].

`pbm-batch-1703677117`: [dbo.RPT_CSO_DeadlockRecordDetailsLast14Days](sql/1703677117.sql); source-definition SHA-256 `79d8106385d1c9c0154223324dcc9c1b505c8b72eb12148168149f99615463bf`, reading-copy SHA-256 `d0618651c40ae1a94353b769cd6d9373c39e4ee5820c525dc6cdde7758c3e357`, one-based inclusive lines [[1, 9]].

`pbm-batch-1719677174`: [dbo.RPT_CSO_AuditLogsLast7DaysDetails](sql/1719677174.sql); source-definition SHA-256 `06bef7f449c29a15e1b3d6d7921c45d72dcade716c92b05432766e767dc2e7d2`, reading-copy SHA-256 `21268df399bb3361e71b54834c4e4fb6967af76c0e9157063d8cbd819404ea48`, one-based inclusive lines [[1, 11]].

`pbm-batch-1735677231`: [dbo.RPT_CSO_AuditLogsLast7DaysCount](sql/1735677231.sql); source-definition SHA-256 `e20b74be30c9321bfc34b757ab988d4d487aac4246373abffa165c82235f6888`, reading-copy SHA-256 `752311b1da184612bdd5a7b6d0e6493276210da4074710292c6575bffd08ec5a`, one-based inclusive lines [[1, 8]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Why are the audit detail and count reports different? Expected: Exact counting unit for each report. Audit detail excluded-method filter is absent from header count. Must not claim: Exact deadlock incidents Equal audit detail/count denominators Observed audit payload
- Can I call distinct deadlock text count the exact number of incidents? Expected: Distinct text is not proven unique deadlock incident identity. Detail groups need not equal header or joined-row counts. Must not claim: Exact deadlock incidents Equal audit detail/count denominators Observed audit payload

## 175. Sampled concurrent-user peak

**Question:** Is the reported highest concurrent user count the exact peak ever?

**What it does.** The routine checks distinct users once per hour, starting at the earliest retained logon timestamp. Short sessions between samples can be missed. It reports a maximum over those samples and retained records.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. Use earliest retained logon through current server time. Evidence: `pbm-batch-1687677060`.
2. Inclusive logon-to-selected-end intervals, DISTINCT username and strict greater-than peak replacement. Evidence: `pbm-batch-1687677060`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- Hourly sampling origin.
- Distinct user names, not sessions.
- Retained-history and NULL endpoint limits.

**Expected results and limits**

- One display string with peak count and sampled timestamp.
- This is neither continuous peak detection nor proof covering all historical activity.
- NULL session ends can exclude sessions; empty history returns initialized0/current time.

**More detail and sources**

`pbm-batch-1687677060`: [dbo.RPT_CSO_HighestNbrConcurrentUsrsEver](sql/1687677060.sql); source-definition SHA-256 `ab938ec1c83b0d89d882e7ee2b435743c2e568904a1c3a7e0378df4aa503c544`, reading-copy SHA-256 `0bf2a2fb03dd06a3d7489cf866c8d76d058af3d486e4f3a2e63b388e9b6142d2`, one-based inclusive lines [[1, 40]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Is the reported highest concurrent user count the exact peak ever? Expected: Hourly sampling origin. Distinct user names, not sessions. Retained-history and NULL endpoint limits. Must not claim: Exact historical maximum Complete historical coverage Continuous monitoring
- Does the result certify that no higher concurrency ever occurred? Expected: This is neither continuous peak detection nor proof covering all historical activity. NULL session ends can exclude sessions; empty history returns initialized0/current time. Must not claim: Exact historical maximum Complete historical coverage Continuous monitoring

## 176. Weight-break configuration inserts

**Question:** Do the weight-break helpers update an existing rate or calculate a shipment charge?

**What it does.** They only insert missing configuration rows. The header helper skips an existing name. The detail helper inserts an exact minimum/maximum range under an existing header and skips an identical range. Neither helper calculates charges or updates existing configuration.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. A new name inserts supplied header values; an existing name is unchanged. Evidence: `pbm-batch-168699999`, `pbm-batch-152699942`.
2. Require the named header and suppress only an exact header/minimum/maximum duplicate. Evidence: `pbm-batch-168699999`, `pbm-batch-152699942`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- Insert-only, not upsert.
- Missing header makes detail insert no-op.
- Explicit NULL differs from declared0 defaults and required columns.

**Expected results and limits**

- Zero or one intended configuration insert; no generated-key or price result.
- No overlap, minimum<=maximum, active eligibility or invoice calculation validation.
- No captured unique name/range key or local concurrency guard; duplicate header names can make the detail scalar lookup fail.

**More detail and sources**

`pbm-batch-168699999`: [dbo.dbc_IRateWeightBreakHdr](sql/168699999.sql); source-definition SHA-256 `4766988fe55d970bff20e7d8729be924812f61048b1eda2ec10596d8d0cbef96`, reading-copy SHA-256 `75353b3a2aaa8f9904facc069abb3aae515182ac8f6d190ee47bb54351f8d44e`, one-based inclusive lines [[1, 63]].

`pbm-batch-152699942`: [dbo.dbc_IRateWeightBreakDtl](sql/152699942.sql); source-definition SHA-256 `71a634c562d704441b5fe63408325d456228c171e0f748e8aee6dac38077a8b9`, reading-copy SHA-256 `c902ad302af70b0de107f639a92e93f34bb17a24525de2e5bc7d6735f0f49b76`, one-based inclusive lines [[1, 66]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Do the weight-break helpers update an existing rate or calculate a shipment charge? Expected: Insert-only, not upsert. Missing header makes detail insert no-op. Explicit NULL differs from declared0 defaults and required columns. Must not claim: Existing rates updated Shipment charge calculated Billing process reconciled
- Can I rerun these helpers to update rates and prove shipment billing is correct? Expected: No overlap, minimum<=maximum, active eligibility or invoice calculation validation. No captured unique name/range key or local concurrency guard; duplicate header names can make the detail scalar lookup fail. Must not claim: Existing rates updated Shipment charge calculated Billing process reconciled

## 177. Maintenance helper side effects

**Question:** Are the dba helpers safe read-only diagnostics?

**What it does.** These helpers can rename objects, drop columns or constraints, and drop/recreate indexes. Several build executable DDL from caller-supplied identifiers or syntax. The review read their definitions and did not execute them.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. Name checks vary: some are global constraint-name tests, others inspect a column or index. Evidence: `pbm-batch-1584724698`, `pbm-batch-1600724755`, `pbm-batch-1616724812`, `pbm-batch-1632724869`, `pbm-batch-1660181310`, `pbm-batch-1866802058`, `pbm-batch-1882802115`.
2. DropColumn recursion is inside the base-column guard and its second tested prefix differs from the prefix passed recursively. DropIndex recursion is outside its base-index guard. Index replacement can fail after dropping the old index. Evidence: `pbm-batch-1584724698`, `pbm-batch-1600724755`, `pbm-batch-1616724812`, `pbm-batch-1632724869`, `pbm-batch-1660181310`, `pbm-batch-1866802058`, `pbm-batch-1882802115`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- Caller syntax is concatenated without QUOTENAME/value binding.
- Drop/create is not locally atomic.
- Related-table recursion guards differ by helper.

**Expected results and limits**

- Conditional schema mutations when called, not a business report.
- Runtime targets, permissions, DDL triggers and caller transactions remain unresolved.
- No operational DDL or repair was run.

**More detail and sources**

`pbm-batch-1584724698`: [dbo.dba_DropForeignKeyConstraint](sql/1584724698.sql); source-definition SHA-256 `1930a6ae3f683734f3021eecbac3b4a2a41b49180b0f935a354e74307a4415c6`, reading-copy SHA-256 `f400f056f14c51990f6066a5d02b2934851356d90d556af24c8524b7a1a77314`, one-based inclusive lines [[1, 28]].

`pbm-batch-1600724755`: [dbo.dba_DropDefaultKeyConstraint](sql/1600724755.sql); source-definition SHA-256 `b5a8d7178c2a2ca344830a97a296e919bd0f7c33fa7473938de0f36ca3b4db71`, reading-copy SHA-256 `325625cc4fcf0a4bff4a8e39384624a609843f6dc57a3e0a277b79c39ff4c824`, one-based inclusive lines [[1, 28]].

`pbm-batch-1616724812`: [dbo.dba_DropColumn](sql/1616724812.sql); source-definition SHA-256 `ae5163703c756a410f37e3ddb7a09672d4c2fecb8e9a76a133d61b997a617c77`, reading-copy SHA-256 `4dcba91818434675c2f243c1ae1079d4d36dc960c1586f1ab0bc6da1b908113a`, one-based inclusive lines [[1, 60]].

`pbm-batch-1632724869`: [dbo.dba_AddForeignKeyConstraint](sql/1632724869.sql); source-definition SHA-256 `160faed899264cab635b19544bf60bf834ac700a2b6e7ce6d50103f664c69fb1`, reading-copy SHA-256 `d7e408d2ffb9a30a03048aa5cbcba9e3d2193e69ee76d8ba3336da8a0432bb41`, one-based inclusive lines [[1, 31]].

`pbm-batch-1660181310`: [dbo.dba_RenameTable](sql/1660181310.sql); source-definition SHA-256 `e74a4b4337c9960248c9e4649b56e5b22725712b204e3525fe631ca0eb6e8a42`, reading-copy SHA-256 `b7c23daf3c1d4758389fa66a593f412530d2961baa90cc5f98808db5550ad96f`, one-based inclusive lines [[1, 23]].

`pbm-batch-1866802058`: [dbo.dba_DropIndex](sql/1866802058.sql); source-definition SHA-256 `48bfe4d4c57b57339823c12d1a7e8ba18f309f09d4c6c081c4842b1241fdbec5`, reading-copy SHA-256 `7ace8acbc5d1d29a731719567cb8fcb8bfa29b057585d771c099606cffaa5917`, one-based inclusive lines [[1, 20]].

`pbm-batch-1882802115`: [dbo.dba_UpdateIndex](sql/1882802115.sql); source-definition SHA-256 `11d7917f4b43883359045cf89a1c6e921bdcded6067699b42c4cabd43bc67eb6`, reading-copy SHA-256 `8020d94c32c8d6e8f0e65a90a559fbde5a6a97676ed4e0446127f191983533b1`, one-based inclusive lines [[1, 37]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Are the dba helpers safe read-only diagnostics? Expected: Caller syntax is concatenated without QUOTENAME/value binding. Drop/create is not locally atomic. Related-table recursion guards differ by helper. Must not claim: Executed DDL Repaired schema Universal safe no-op All recursion guards identical
- Has this assessment already repaired or safely exercised the maintenance procedures? Expected: Runtime targets, permissions, DDL triggers and caller transactions remain unresolved. No operational DDL or repair was run. Must not claim: Executed DDL Repaired schema Universal safe no-op All recursion guards identical

## 178. Index diagnostic context

**Question:** Do the index reports prove which indexes need rebuilding or removal?

**What it does.** One routine reads physical statistics for a supplied database ID; the other joins usage counters to current-database metadata. Name resolution and database filtering have important limits. Neither routine rebuilds an index or establishes a maintenance decision.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. Physical-stat names resolve in current context; an unresolved DB_ID can become a wildcard. Evidence: `pbm-batch-1669229347`, `pbm-batch-1685229404`, `pbm-batch-1191675293`.
2. Usage joins omit a database-ID predicate; indexes absent from the DMV are omitted. Top-five table counts use legacy catalog metadata. Evidence: `pbm-batch-1669229347`, `pbm-batch-1685229404`, `pbm-batch-1191675293`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- Database context can affect index/name interpretation.
- No maintenance is performed.
- Counter absence is not a zero-usage guarantee.

**Expected results and limits**

- Metadata/statistics result shapes only; no live values were queried in this review.
- No measured fragmentation, duration or safe-drop recommendation.
- Counters are not procedure-call totals and catalog row counts are not COUNT(*) of data.

**More detail and sources**

`pbm-batch-1669229347`: [dbo.PMN_IndexFragmentation](sql/1669229347.sql); source-definition SHA-256 `d070200a576d9f841401a025faa5e619992d400fe4eae585ec404ef12e433181`, reading-copy SHA-256 `d903ea872a09361cee3d003bc56d8be0200a25cdb36b9f69e75c25746e5c16ac`, one-based inclusive lines [[1, 23]].

`pbm-batch-1685229404`: [dbo.PMN_IndexUsage](sql/1685229404.sql); source-definition SHA-256 `9d8ce763d76597bc6d5685dec972422854f0797fa0db6d89c3a72d61536b89c0`, reading-copy SHA-256 `dda9927c62eb17e381c1f41b17d00887e5c7930af372b119ecde9d99c5fec176`, one-based inclusive lines [[1, 22]].

`pbm-batch-1191675293`: [dbo.RPT_CSO_TopFiveTablesByRecordCount](sql/1191675293.sql); source-definition SHA-256 `9da6ea127d8788d112c324fc1709db7b9ddceacc5baa2fd4ff5e8427893eac6f`, reading-copy SHA-256 `5d067d000c52691b494f4f19c291a53197337c88ecc83bb8227eb4d97147f9f8`, one-based inclusive lines [[1, 12]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Do the index reports prove which indexes need rebuilding or removal? Expected: Database context can affect index/name interpretation. No maintenance is performed. Counter absence is not a zero-usage guarantee. Must not claim: Safe to drop Observed zero usage Measured execution durations
- Can I automatically drop an index because it is absent from this report? Expected: No measured fragmentation, duration or safe-drop recommendation. Counters are not procedure-call totals and catalog row counts are not COUNT(*) of data. Must not claim: Safe to drop Observed zero usage Measured execution durations

## 179. Database and table size result sets

**Question:** What does the table-size routine return?

**What it does.** It first delegates to sp_spaceused for database output, then collects a table-specific sp_spaceused command through sp_msForEachTable into a local table and returns it by name. It does not establish that every table was enumerated successfully.

**What happens**

Trigger: A user asks about the captured behavior described in this topic; no procedure is executed by this documentation.

1. The first helper emits its own result sets. Evidence: `pbm-batch-1749229632`.
2. INSERT EXEC populates fixed-width text size fields and returns ordered rows. Evidence: `pbm-batch-1749229632`.

**What can affect it**

- Applicable status/configuration and catalog constraints are detailed in the cited module contracts; no effective configuration rows were read.

**What you can check**

- Database output precedes per-table output.
- Size columns remain text.
- No execution was performed.

**Expected results and limits**

- Multiple result sets with size text; no numeric conversion or live size measurement from this review.
- System-helper support, permissions and enumeration completeness are deployment-dependent.
- INSERT EXEC shape or nesting restrictions can fail; no failure handler exists.

**More detail and sources**

`pbm-batch-1749229632`: [dbo.PMN_TableSizes](sql/1749229632.sql); source-definition SHA-256 `fe7f2c8786f650bed9f59e9f92e4123168993c0c0228d764b5be90cdf4b66582`, reading-copy SHA-256 `26a79b56c4bdab93dbb64540d521c31645dd79998a98b258ca49f8bd6e240e8b`, one-based inclusive lines [[1, 27]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- What does the table-size routine return? Expected: Database output precedes per-table output. Size columns remain text. No execution was performed. Must not claim: Actual sizes measured Complete enumeration verified Successful execution
- Can I treat this source review as a verified complete database-size inventory? Expected: System-helper support, permissions and enumeration completeness are deployment-dependent. INSERT EXEC shape or nesting restrictions can fail; no failure handler exists. Must not claim: Actual sizes measured Complete enumeration verified Successful execution

## 180. Presentation defaults and business actions

**Question:** Does opening an appointment, signature or packing presentation execute that action?

**What it does.** These reviewed routines return presentation defaults and sometimes a localized label. They do not schedule an appointment, save a signature, submit work, replenish inventory or pack a unit.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Identify the presentation seed returned by the body. Evidence: `ps-sql-405224844`, `ps-sql-1221227751`, `ps-sql-1269227922`, `ps-sql-1285227979`, `ps-sql-1093227295`, `ps-sql-1237227808`.
2. Use separately evidenced action routines and application bindings to establish what an operator action executes. Evidence: `ps-sql-405224844`, `ps-sql-1221227751`, `ps-sql-1269227922`, `ps-sql-1285227979`, `ps-sql-1093227295`, `ps-sql-1237227808`.

**What can affect it**

- Use exact source predicates and distinguish NULL, duplicate and caller behavior.

**What you can check**

- Use exact source predicates and distinguish NULL, duplicate and caller behavior.

**Expected results and limits**

- Only presentation data is selected. This body does not execute the business action named in the procedure.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`ps-sql-405224844`: [dbo.MetaTrans_ApptSchedule](sql/405224844.sql); source-definition SHA-256 `e5f3242fb337bec38007586b0427e735272981edeabdc2fa7fd082ca1b125f2d`, reading-copy SHA-256 `f47ea8e881cad32ce9c7a84d574c93486a4903ff028faa66f6cbc40718a7fec9`, one-based inclusive lines [[1, 18]].

`ps-sql-1221227751`: [dbo.MetaTrans_SignBOL](sql/1221227751.sql); source-definition SHA-256 `b2bd7cd1588d8d3847836e84f844da77873238c32b747e0e420052f99e8f039d`, reading-copy SHA-256 `e64d0333057afccec991467d857e3cee263c9c5108503b8a7bd8edbe427b2eb5`, one-based inclusive lines [[1, 22]].

`ps-sql-1269227922`: [dbo.MetaTrans_TpmPersonalViews](sql/1269227922.sql); source-definition SHA-256 `ddcdf40c0a146207cc857985c6a27abb3c1117ec415f926201f688a885a0b38c`, reading-copy SHA-256 `968dc080c554ae2bd816ce20ec43bce51ab8c92b60de381825952e84591ba356`, one-based inclusive lines [[1, 13]].

`ps-sql-1285227979`: [dbo.MetaTrans_TpmSubmit](sql/1285227979.sql); source-definition SHA-256 `0eab9e8a4a0b41bf32046303563c46287138b8edaa59e7f4a9a5203b368da5f8`, reading-copy SHA-256 `95c1cd37613b32149b076f3a4337f007eca7fbf764abda510f9830f20c79816f`, one-based inclusive lines [[1, 17]].

`ps-sql-1093227295`: [dbo.MetaTrans_ManualReplenishment](sql/1093227295.sql); source-definition SHA-256 `5a0fdb19ed3a07938c25c17de6b542db41f539c1f4a3fbbda604061f3fe297f7`, reading-copy SHA-256 `5bb245395a2a7584994a3ee169bb7cac0b6120844d3dc566c1770d70fbf21c75`, one-based inclusive lines [[1, 15]].

`ps-sql-1237227808`: [dbo.MetaTrans_SinglesPacking](sql/1237227808.sql); source-definition SHA-256 `5c7ba6c5bda4ad8b969ca4f29b37a897b2bc851a4de1aee6700fb25ec5334be2`, reading-copy SHA-256 `95d0dc7bf38d7c17389f0644fdda8d2aef891ebc93fcb238bf507205f0a6ed7e`, one-based inclusive lines [[1, 26]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does MetaTrans_SignBOL save a signature? Expected: It returns a fixed seed row only. Must not claim: A BOL signature has been saved.
- Does the singles-packing seed read the user packing preference? Expected: Username is unused and the packing identifier is fixed. Must not claim: It applies that user preference.

## 181. Cycle-count presentation configuration

**Question:** Why can cycle-count presentation defaults differ when configuration is missing or duplicated?

**What it does.** Quick-plan setup assigns variables from matching configuration rows; duplicate matches have no defined selection order. Master-plan setup uses scalar subqueries, which fail on duplicate matches. Missing coded flags become false BIT values, while neither routine creates a plan.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Distinguish assignment lookups from scalar subqueries. Evidence: `ps-sql-453225015`, `ps-sql-565225414`.
2. Check the exact configuration selector and conversion without assuming a warehouse-specific value. Evidence: `ps-sql-453225015`, `ps-sql-565225414`.

**What can affect it**

- Use exact source predicates and distinguish NULL, duplicate and caller behavior.

**What you can check**

- Use exact source predicates and distinguish NULL, duplicate and caller behavior.

**Expected results and limits**

- Only presentation data is selected. This body does not execute the business action named in the procedure.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`ps-sql-453225015`: [dbo.MetaTrans_CycleCountQuickPlan](sql/453225015.sql); source-definition SHA-256 `3adea788440dda21f38351393bb4879838af652ebb709337372641d53764749b`, reading-copy SHA-256 `b9918f115ea89a54cf2e63d052f7f519282d5450df86757b3545640a0e789417`, one-based inclusive lines [[1, 74]].

`ps-sql-565225414`: [dbo.MetaTrans_GetCycleCountMasterPlan](sql/565225414.sql); source-definition SHA-256 `64dadd8b8607e94a7e3a6d29b476ccf821ff4081d54f83b416c6161d2351e0ee`, reading-copy SHA-256 `63a0b69eca099c7cab0e8f127ac4ce3b7121e19361ce7a7e4bce98344a218251`, one-based inclusive lines [[1, 21]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the quick-plan warehouse scope its configuration lookup? Expected: The configuration predicates have no warehouse filter. Must not claim: The default was read for that warehouse.
- Do duplicate master-plan configuration matches choose one row? Expected: A scalar lookup with multiple rows raises an error. Must not claim: TOP 1 suppresses duplicate configuration.

## 182. Receipt context and company selection

**Question:** Do ordinary, TPM and shipment-based receipt selectors enforce the same company conditions?

**What it does.** No. Ordinary PO lines use profile authority, company membership and a NULL-company alternative. TPM PO lines omit those checks. Shipment details use membership independently of a restricted profile mode and include NULL or coded-sentinel companies. Header selectors have no user authorization predicate; none creates a receipt.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Identify which header or line selector is used. Evidence: `ps-sql-693225870`, `ps-sql-709225927`, `ps-sql-933226725`, `ps-sql-981226896`, `ps-sql-949226782`, `ps-sql-965226839`.
2. Compare exact predicates; a supplied username alone does not establish authentication. Evidence: `ps-sql-693225870`, `ps-sql-709225927`, `ps-sql-933226725`, `ps-sql-981226896`, `ps-sql-949226782`, `ps-sql-965226839`.

**What can affect it**

- Use exact source predicates and distinguish NULL, duplicate and caller behavior.

**What you can check**

- Use exact source predicates and distinguish NULL, duplicate and caller behavior.

**Expected results and limits**

- Only presentation data is selected. This body does not execute the business action named in the procedure.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`ps-sql-693225870`: [dbo.MetaTrans_GetItemsForReceiptFromPO](sql/693225870.sql); source-definition SHA-256 `7a8b6c892c3671ddf709aac30a7d4df3a7322dc8ffd9365f475029796f574c7a`, reading-copy SHA-256 `64f3074b40be9465ea1a18623d0e04870369cda9010be6442b2f478a68bad468`, one-based inclusive lines [[1, 42]].

`ps-sql-709225927`: [dbo.MetaTrans_GetItemsForTpmReceiptFromPO](sql/709225927.sql); source-definition SHA-256 `d60705a80f9000e6fda5545f3a8284f9f58bf8262e23c9ae8a35535c6d191b19`, reading-copy SHA-256 `6864b7e5532ab71305861994ec8e23130c63c15b0d860e114c6d10f03a2cafaa`, one-based inclusive lines [[1, 31]].

`ps-sql-933226725`: [dbo.MetaTrans_GetReceiptFromPO](sql/933226725.sql); source-definition SHA-256 `8b3cac7cd767528b9d033e9138ef15a10bcad47ca5378251b5550a1d074bd532`, reading-copy SHA-256 `fa87aecaae4ef175c302a33f900dc11d15dcd982f4be9935bb8d058510bd30e8`, one-based inclusive lines [[1, 36]].

`ps-sql-981226896`: [dbo.MetaTrans_GetTpmReceiptFromPO](sql/981226896.sql); source-definition SHA-256 `4ef75b51780dc870c4447b747dfd2c45f4d5645786e598f9e58e7c107ee2084c`, reading-copy SHA-256 `3edd484685e34be712e850d00e376f695b7580db6848475313429ef49ed250d9`, one-based inclusive lines [[1, 50]].

`ps-sql-949226782`: [dbo.MetaTrans_GetShipmentDetailsForCreateReceipt](sql/949226782.sql); source-definition SHA-256 `d70a34d7e0e12e6b39d7f121a6444deed417c55f0ef12dc7847435f9065d8665`, reading-copy SHA-256 `7a91794f9ae2a658cb76b5f3f9e4d88772572014de5b6447bbf315c077f1e759`, one-based inclusive lines [[1, 29]].

`ps-sql-965226839`: [dbo.MetaTrans_GetShipmentForCreateReceipt](sql/965226839.sql); source-definition SHA-256 `a4a14c9730dbadcfe47a0eb56665e1f312bce2a302b88342605930075523e95e`, reading-copy SHA-256 `d24436e1be732a34a25c9899c20c246735790da208d21058a708445113b1a5e0`, one-based inclusive lines [[1, 41]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does TPM PO line selection use COMPANY_ACCESS? Expected: The body does not consult it. Must not claim: It applies the ordinary receipt company filter.
- Must shipment-based receipt lines have positive open quantity? Expected: The body projects TOTAL_QTY without an open-quantity filter. Must not claim: It filters OPEN_QUANTITY greater than zero.

## 183. Lot-change previews and confirmation

**Question:** Does a lot-change preview update inventory or validate the proposed dates and status?

**What it does.** The preview lists matching inventory and the confirmation returns existing lot context with supplied before/after values. Neither changes inventory nor validates the proposed change. Company and lot NULL matching differs between the inventory preview and the outer lot confirmation.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Use location NULL or the coded sentinel to select the broad preview branch. Evidence: `ps-sql-789226212`, `ps-sql-837226383`.
2. Check matching lot context before interpreting the confirmation values. Evidence: `ps-sql-789226212`, `ps-sql-837226383`.

**What can affect it**

- Use exact source predicates and distinguish NULL, duplicate and caller behavior.

**What you can check**

- Use exact source predicates and distinguish NULL, duplicate and caller behavior.

**Expected results and limits**

- Only presentation data is selected. This body does not execute the business action named in the procedure.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`ps-sql-789226212`: [dbo.MetaTrans_GetLotUpdateAffectedInventory](sql/789226212.sql); source-definition SHA-256 `999cfa4e698d29c6ae9ce9b64de786e86d308e047526a6dd47b1d4220c9cf758`, reading-copy SHA-256 `c50ea83c8db9a9f892d11f0f3c2ff774040578edf5372c8a909a6645f2d3c8c4`, one-based inclusive lines [[1, 51]].

`ps-sql-837226383`: [dbo.MetaTrans_GetLotUpdateConfirmation](sql/837226383.sql); source-definition SHA-256 `e71293a45a1c55c8b15925a02811e86560b965ccb01283ba9296a7e96a667e87`, reading-copy SHA-256 `6cab67c7a1b2cf7006c02f2f2468e51a687010663d964fd9e84cf0c1066e0dcc`, one-based inclusive lines [[1, 47]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Can a NULL lot match in the affected-inventory preview? Expected: It explicitly permits paired NULL lot values. Must not claim: Every NULL lot is excluded.
- Does a NULL lot match the confirmation outer query? Expected: The outer LOT predicate uses equality, so NULL does not match. Must not claim: Its lot predicate is NULL-safe like the inventory preview.

## 184. Transfer presentation results and helper calls

**Question:** Do transfer context getters move a container or establish successful authorization?

**What it does.** These bodies select context. Two call a shipment-security-info helper before selecting; the inventory getter passes its location-inventory identifier to that helper. The call alone does not prove valid identifier mapping or enforced authorization, and no direct transfer mutation occurs.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Read helper arguments and account for callee result sets separately. Evidence: `ps-sql-757226098`, `ps-sql-1013227010`, `ps-sql-1029227067`, `ps-sql-1045227124`.
2. Distinguish empty joins, missing scalar status labels and the returned presentation row sets. Evidence: `ps-sql-757226098`, `ps-sql-1013227010`, `ps-sql-1029227067`, `ps-sql-1045227124`.

**What can affect it**

- Use exact source predicates and distinguish NULL, duplicate and caller behavior.

**What you can check**

- Use exact source predicates and distinguish NULL, duplicate and caller behavior.

**Expected results and limits**

- Only presentation data is selected. This body does not execute the business action named in the procedure.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`ps-sql-757226098`: [dbo.MetaTrans_GetLocationInventory](sql/757226098.sql); source-definition SHA-256 `99f8c2c6b630a5dbbb7625d9ea2f7ef39693346a051402a6dfc1953f1fd99d16`, reading-copy SHA-256 `5964e05ca822965aadec38fd8a8a8e3c1e09c46d1a91ca978ca6f66e66f722ea`, one-based inclusive lines [[1, 27]].

`ps-sql-1013227010`: [dbo.MetaTrans_GetTransferContainer](sql/1013227010.sql); source-definition SHA-256 `1bbc7836ca49da3272bf0e16451466e696e104e3a1b136739b225cdebd61e229`, reading-copy SHA-256 `c60c42f21524b76895db0c6d46eb6b0cf3126b30f06657114061b63f20328854`, one-based inclusive lines [[1, 57]].

`ps-sql-1029227067`: [dbo.MetaTrans_GetTransferShipment](sql/1029227067.sql); source-definition SHA-256 `6fa625795ba4a91cfac6d7db4887d983673059991cb754a8c8cb9fc54d1b3a9f`, reading-copy SHA-256 `553beea9a10b7fa47a5d7eb41b7bfd4a7ed471c31460285df391162d91464bf6`, one-based inclusive lines [[1, 45]].

`ps-sql-1045227124`: [dbo.MetaTrans_GetTransferShipmentDetail](sql/1045227124.sql); source-definition SHA-256 `1a572d5ba6e59600a95e6dfc03e46b513f786ccdfd73a751650bf40590ff0f05`, reading-copy SHA-256 `50ef54708e3a1344fd6f21736567ddc9c9aa954efe21c8c5cb665ab8adc2d2ee`, one-based inclusive lines [[1, 39]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does a missing shipment prevent the security-info helper call? Expected: The helper is called before the selection. Must not claim: An empty shipment lookup prevents the call.
- Does missing load context suppress a matched shipment transfer row? Expected: The LEFT JOIN retains the shipment with NULL load fields. Must not claim: A matching load is required by an inner join.

## 185. Packing preference and checkpoint display

**Question:** Does a missing user profile receive the packing-preference fallback?

**What it does.** No. The fallback applies to a NULL preference inside an existing profile row. A missing row makes the scalar result NULL, which leaves packing options unassigned if no preference matches. Checkpoint values are displayed separately; this routine does not pack, close or print.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Resolve the profile row and packing-preference selection. Evidence: `ps-sql-1109227352`.
2. Inspect checkpoint display values and the two generic lists separately from action enforcement. Evidence: `ps-sql-1109227352`.

**What can affect it**

- Use exact source predicates and distinguish NULL, duplicate and caller behavior.

**What you can check**

- Use exact source predicates and distinguish NULL, duplicate and caller behavior.

**Expected results and limits**

- Only presentation data is selected. This body does not execute the business action named in the procedure.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`ps-sql-1109227352`: [dbo.MetaTrans_Packing](sql/1109227352.sql); source-definition SHA-256 `cb930f470847596a019b9f9e75851814cb3842a85a524cf5b402ea87685819dc`, reading-copy SHA-256 `736df22832cd0bf57f0cf670fd86afd57f26e414ec5185530d9e111325a617e7`, one-based inclusive lines [[1, 77]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does a missing profile use the coded packing default? Expected: No row yields NULL outside the inner ISNULL expression. Must not claim: It always uses the default.
- Does a returned close-container checkpoint close the container? Expected: It is a display value only in this body. Must not claim: The container has been closed.

## 186. Item, lookup and monitoring selection boundaries

**Question:** Can presentation context be treated as a deterministic choice or a reserved identifier?

**What it does.** The item selector uses unordered TOP 1 across exact-company and NULL-company matches. Monitoring suggests MAX(form ID)+1 without reserving it. Lookup warehouse values are returned without filtering. Missing receipt context still returns a trailer seed row, and work-order allocation context does not allocate inventory.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Check each selector and returned row count. Evidence: `ps-sql-677225813`, `ps-sql-773226155`, `ps-sql-869226497`, `ps-sql-725225984`, `ps-sql-741226041`, `ps-sql-997226953`, `ps-sql-1333228150`.
2. Establish reservation, authorization and later mutations through separately reviewed callers. Evidence: `ps-sql-677225813`, `ps-sql-773226155`, `ps-sql-869226497`, `ps-sql-725225984`, `ps-sql-741226041`, `ps-sql-997226953`, `ps-sql-1333228150`.

**What can affect it**

- Use exact source predicates and distinguish NULL, duplicate and caller behavior.

**What you can check**

- Use exact source predicates and distinguish NULL, duplicate and caller behavior.

**Expected results and limits**

- Only presentation data is selected. This body does not execute the business action named in the procedure.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`ps-sql-677225813`: [dbo.MetaTrans_GetItem](sql/677225813.sql); source-definition SHA-256 `bca8946dfa8b2a89d06dc5ff61fdf400f176af4ff45f42c5132e4378e6d1ce0a`, reading-copy SHA-256 `d03f23192e0fad4c348b4958e3be83e0ffbdfd60612f4be0b340736c8c991ff3`, one-based inclusive lines [[1, 26]].

`ps-sql-773226155`: [dbo.MetaTrans_GetLookup](sql/773226155.sql); source-definition SHA-256 `23aa6cbaa0df77db9b1e4f54787d4860427ebc7b695ce090f2b5f91294ad44d9`, reading-copy SHA-256 `6e814eb187167bb0834a3d5c5ca93128ff6612f0c61facce014a305a4859add0`, one-based inclusive lines [[1, 60]].

`ps-sql-869226497`: [dbo.MetaTrans_GetMonitoringBuilderModel](sql/869226497.sql); source-definition SHA-256 `266052c75173363c1496cd1969f7d4b9f2a57024c949642ef6ead7f7a0389f2d`, reading-copy SHA-256 `906f47f5af041484e2931989e79b784d35c64c787154494c17be7edf3389a2bb`, one-based inclusive lines [[1, 51]].

`ps-sql-725225984`: [dbo.MetaTrans_GetLocatingZones](sql/725225984.sql); source-definition SHA-256 `72b519b144661f2a1eebe3731e043807ceadffd7d94104d5faf5e040feaab679`, reading-copy SHA-256 `a6d369eceb8f0b562d5c173b4fdd4330d2f17bc0eda63d3f7924f34fec50f278`, one-based inclusive lines [[1, 22]].

`ps-sql-741226041`: [dbo.MetaTrans_GetLocationTypes](sql/741226041.sql); source-definition SHA-256 `8e0485b9c527364b858ba3bccb42574db766df3156b69b062b8a9724745b059e`, reading-copy SHA-256 `a5e9106f37a4111b00b1bc22647ae6a574ba12cd1858991de94b754d98e29c9b`, one-based inclusive lines [[1, 23]].

`ps-sql-997226953`: [dbo.MetaTrans_GetTrailerDetails](sql/997226953.sql); source-definition SHA-256 `9019a1a35fc69108ff352158d06ec249022f96eaff598d778c48fde3ac6d89b3`, reading-copy SHA-256 `6b23f5c10af2636a2fe5fcc8d113f600c479255a99b489022484fdfcecd18740`, one-based inclusive lines [[1, 43]].

`ps-sql-1333228150`: [dbo.MetaTrans_WorkOrderComponentAllocation](sql/1333228150.sql); source-definition SHA-256 `b9163b14edead282daa4749ad55cccb4a2eafd02b1e18308d980bae9e7c410f0`, reading-copy SHA-256 `c2ea083020fa5398df532d83c72229dbe2ec422362ac5717d20daf4ffcd6571e`, one-based inclusive lines [[1, 35]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does item selection prefer an exact company over NULL company? Expected: There is no ORDER BY to enforce that preference. Must not claim: Exact-company is always preferred.
- Does MAX(form ID)+1 reserve a unique form number? Expected: It is only a suggestion with no insert or lock reservation. Must not claim: Concurrent callers cannot receive the same number.

## 187. Screen attribute and object-column description

**Question:** Why can screen-object column descriptions differ by object kind or schema?

**What it does.** The routine resolves an object type, then uses either a first-result-set metadata function or INFORMATION_SCHEMA.COLUMNS. The fallback filters TABLE_NAME without TABLE_SCHEMA and has a different result shape. It describes metadata; it does not execute the described business routine.

**What happens**

Trigger: Authorized caller enters the documented workflow; active UI/service binding is unverified.

1. Resolve the configured screen attribute and object identifier. Evidence: `ps-sql-485225129`.
2. Use the branch-specific output shape and account for metadata visibility and schema naming. Evidence: `ps-sql-485225129`.

**What can affect it**

- Use exact source predicates and distinguish NULL, duplicate and caller behavior.

**What you can check**

- Use exact source predicates and distinguish NULL, duplicate and caller behavior.

**Expected results and limits**

- Only presentation data is selected. This body does not execute the business action named in the procedure.
- Static source review only; live process execution, current configuration, application navigation and whole-process duration are not established.

**More detail and sources**

`ps-sql-485225129`: [dbo.MetaTrans_DbTableInfo](sql/485225129.sql); source-definition SHA-256 `478f0c5cee280d36898452f30dbc274dca644b1b0a41ada8a2685e7652aba18f`, reading-copy SHA-256 `97218f5392e526f300a80e1c6e373ec7d5b10f7993a1b8ac4fc23c48eb665ab7`, one-based inclusive lines [[1, 55]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the column fallback filter TABLE_SCHEMA? Expected: It filters TABLE_NAME only. Must not claim: It restricts both schema and name.
- Does first-result-set description execute the business procedure? Expected: The body calls a metadata description function. Must not claim: The described business action was performed.

## 188. Why configuration seed calls may preserve old settings

**Question:** Why configuration seed calls may preserve old settings?

**What it does.** Many administration seed routines insert only when their key is absent. Repeating a call with a changed description or flag can therefore leave the existing row untouched. The action-menu routine also skips when another menu already has the same description.

**What happens**

Trigger: A setup or administration caller invokes the reviewed routine; installed caller and permissions are unverified.

1. Identify the exact routine and its duplicate key; do not assume all seed routines behave alike. Evidence: `adm-sql-1708181481`, `adm-sql-1820181880`, `adm-sql-1836181937`, `adm-sql-1932182279`, `adm-sql-1946802343`, `adm-sql-1948182336`, `adm-sql-2012182564`, `adm-sql-2074802799`, `adm-sql-2140183020`.
2. Check whether a matching row makes the insert a no-op; the reviewed bodies do not return a uniform success row. Evidence: `adm-sql-1708181481`, `adm-sql-1820181880`, `adm-sql-1836181937`, `adm-sql-1932182279`, `adm-sql-1946802343`, `adm-sql-1948182336`, `adm-sql-2012182564`, `adm-sql-2074802799`, `adm-sql-2140183020`.

**What can affect it**

- Caller active flag is stored; SYSTEM_CREATED and USER_STAMP are coded literals, not a current-user lookup.
- Existing record-type settings are preserved, including CAN_BE_SCHEDULED.
- Header flags are stored, not evaluated; existing keys are left unchanged.
- SYSTEM_CREATED has an opaque string default; supported endpoint types describe stored metadata, not observed service capability.
- Existing description is preserved.
- Existing exit-point settings are not updated. Runtime hook selection and category semantics need caller evidence.
- No resource, screen or user permission is created by this body itself. Existing form IDs are not updated even if other supplied fields change.
- This header write does not insert or change system configuration detail values.
- No template assignment or rendered screen is established by the seed.

**What you can check**

- Read the cited routine details for inputs, NULL behavior, effects and limits.

**Expected results and limits**

- Many administration seed routines insert only when their key is absent. Repeating a call with a changed description or flag can therefore leave the existing row untouched. The action-menu routine also skips when another menu already has the same description.
- Static source and schema review only; no new database connection, rows, routine execution, UI navigation or production acceptance.
- Opaque string literals were not reconstructed. No claims of live feature activation, authorization, vendor/custom ownership or endpoint availability.
- Catalog references and authored roles do not establish all consumers or full process runtime.

**More detail and sources**

`adm-sql-1708181481`: [dbo.dbc_IActionMenu](sql/1708181481.sql); source-definition SHA-256 `17bb848b46a7acbeeaec6bf4190096769515c5b59ae306a1644e5fb3588fbd49`, reading-copy SHA-256 `b591547ee9a4aa395514d1d0212847e840eb0605dbc526dbfc3db53a785d673d`, one-based inclusive lines [[1, 61]].

`adm-sql-1820181880`: [dbo.dbc_IBatchSubmissionConfig](sql/1820181880.sql); source-definition SHA-256 `988e40900b2d1b9a54180504871ddda8c2bd221ef2fc0eefb3bf525b983b728e`, reading-copy SHA-256 `2e2722e54abdfd7d6186741d484f023176349218267d8ed1fc512f47bfb4182b`, one-based inclusive lines [[1, 63]].

`adm-sql-1836181937`: [dbo.dbc_IDataRetrievalStmtHeader](sql/1836181937.sql); source-definition SHA-256 `e12c7c4810373969a8100571a99738952e57ce48fc86ec2b3caf0c991c9e5b70`, reading-copy SHA-256 `b32fb3d435df077cda7fc434fb4f3d138f83d666bf6a23b511a9da39855ce9f1`, one-based inclusive lines [[1, 66]].

`adm-sql-1932182279`: [dbo.dbc_IDynamicCallingHeader](sql/1932182279.sql); source-definition SHA-256 `7c67574c1369ab61f419daeb06a6971a4a217929205a50909fbd63cffc6bffe1`, reading-copy SHA-256 `8e687c505e16b00aea6c4cf174a0623ebb1ea84f59393efb7f643a6c9093daea`, one-based inclusive lines [[1, 38]].

`adm-sql-1946802343`: [dbo.dbc_IExitPointCategory](sql/1946802343.sql); source-definition SHA-256 `9a85920dda275416b376202eaf98fc5f8eaa7d633f3aef735d46e4124fb08be2`, reading-copy SHA-256 `ecd5dcd6ff750841a886f6adae91aee493471d5476a058005181ad4727819de2`, one-based inclusive lines [[1, 33]].

`adm-sql-1948182336`: [dbo.dbc_IExitPoint](sql/1948182336.sql); source-definition SHA-256 `5ac7064222adac54cca79e222f43c98d4bfb6ee26e6ab5cdd40a9db3700dca72`, reading-copy SHA-256 `83ba3bbbf81221fbe42846926807aed364a83df642886461bcce50d850523d3b`, one-based inclusive lines [[1, 64]].

`adm-sql-2012182564`: [dbo.dbc_IForm](sql/2012182564.sql); source-definition SHA-256 `f15c3a61fedbc11b4a7b9a87f4bc96235b6d923ec0a3fa7ba2c9341fb98c233f`, reading-copy SHA-256 `d6f1e1a551d4f123e3a19d4ba9bbf8b5a8b6238bab7841004fbc96990eac9b56`, one-based inclusive lines [[1, 65]].

`adm-sql-2074802799`: [dbo.dbc_ISystemConfigHeader](sql/2074802799.sql); source-definition SHA-256 `0815e1f959b4f211857d328a276e27e3fbbeb8935152de14bb5bc254be89c051`, reading-copy SHA-256 `7cbb8e2811a5f72afc6d25605975e9c0d4252f0213d25f36634416d206e1af4a`, one-based inclusive lines [[1, 34]].

`adm-sql-2140183020`: [dbo.dbc_IMainUiTemplate](sql/2140183020.sql); source-definition SHA-256 `14924a3b9238c457b8a60a9ee2baf8f30335170b3c11a993b258cb9e12f48ab0`, reading-copy SHA-256 `d62db712ef9355749a50c6c950df8b49cf6a33605c9a72bfcde75893a248285f`, one-based inclusive lines [[1, 63]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does seeding an existing base form update its table binding? Expected: No. dbc_IForm inserts only when FORM_ID is absent. Must not claim: Existing form fields are automatically refreshed.
- Can another action menu with the same description prevent insertion? Expected: Yes. The guard matches menu name OR description. Must not claim: Only the menu name is checked.

## 189. Generic configuration updates replace omitted values

**Question:** Generic configuration updates replace omitted values?

**What it does.** The generic configuration header and detail routines update existing records as well as insert missing ones. Their update branch assigns every listed field. Omitting an optional value supplies its default, often NULL, which can clear the old value. They do not validate detail values against the header definition.

**What happens**

Trigger: A setup or administration caller invokes the reviewed routine; installed caller and permissions are unverified.

1. Determine whether the record-type or record-type/identifier key already exists. Evidence: `adm-sql-2026802628`, `adm-sql-2042802685`.
2. Review all supplied values and defaults because the update is not a partial patch. Evidence: `adm-sql-2026802628`, `adm-sql-2042802685`.

**What can affect it**

- This is a whole listed-field replacement, not an insert-only seed or partial patch. No header field-type/required/lookup validation is performed by this body.
- No migration or validation of stored GENERIC_CONFIG_DETAIL values is performed; changing header metadata alone does not prove existing details conform.

**What you can check**

- Read the cited routine details for inputs, NULL behavior, effects and limits.

**Expected results and limits**

- The generic configuration header and detail routines update existing records as well as insert missing ones. Their update branch assigns every listed field. Omitting an optional value supplies its default, often NULL, which can clear the old value. They do not validate detail values against the header definition.
- Static source and schema review only; no new database connection, rows, routine execution, UI navigation or production acceptance.
- Opaque string literals were not reconstructed. No claims of live feature activation, authorization, vendor/custom ownership or endpoint availability.
- Catalog references and authored roles do not establish all consumers or full process runtime.

**More detail and sources**

`adm-sql-2026802628`: [dbo.dbc_IGenericConfigDetail](sql/2026802628.sql); source-definition SHA-256 `75e13a1ce054a7b936af2b304536b2ea89aa6e93f5c72796fcde56648d5e6a26`, reading-copy SHA-256 `787fc7552c1632d12fffcb3ee862192e09ab81d01ea194d8041858f9880e28de`, one-based inclusive lines [[1, 108]].

`adm-sql-2042802685`: [dbo.dbc_IGenericConfigHeader](sql/2042802685.sql); source-definition SHA-256 `dee0a6ff0f721422fbbce2758a4a99e9d710b7a0880e12a58489b22bbaccc10a`, reading-copy SHA-256 `1cc19b146e76042f668465bb9fc1e76c25b1d17559a74d10da0b821bace98ae1`, one-based inclusive lines [[1, 255]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does omitting sys1Value preserve an existing generic configuration value? Expected: No. Its default NULL is assigned in the update branch. Must not claim: Omitted values are preserved.
- Does changing a generic configuration header validate all existing details? Expected: No. The header routine writes definitions without reading or checking details. Must not claim: Existing detail values are automatically converted or validated.

## 190. Feature setting updates and unused removed input

**Question:** Feature setting updates and unused removed input?

**What it does.** The feature-management routine inserts a missing feature or updates its enabled flag, product-release field and modification stamps. The removed input is unused. A stored enabled flag alone does not prove that an application feature is currently available to a user.

**What happens**

Trigger: A setup or administration caller invokes the reviewed routine; installed caller and permissions are unverified.

1. Use the feature name to distinguish the insert and update branch. Evidence: `adm-sql-1980182450`.
2. Confirm application consumption and user permissions separately from the metadata write. Evidence: `adm-sql-1980182450`.

**What can affect it**

- Update preserves CREATED_DATE and USER_STAMP. Storing ENABLED does not prove that every application caller consults this feature.

**What you can check**

- Read the cited routine details for inputs, NULL behavior, effects and limits.

**Expected results and limits**

- The feature-management routine inserts a missing feature or updates its enabled flag, product-release field and modification stamps. The removed input is unused. A stored enabled flag alone does not prove that an application feature is currently available to a user.
- Static source and schema review only; no new database connection, rows, routine execution, UI navigation or production acceptance.
- Opaque string literals were not reconstructed. No claims of live feature activation, authorization, vendor/custom ownership or endpoint availability.
- Catalog references and authored roles do not establish all consumers or full process runtime.

**More detail and sources**

`adm-sql-1980182450`: [dbo.dbc_IFeatureManagement](sql/1980182450.sql); source-definition SHA-256 `3ada2ff7e30b33578aeb3d98f0033112634d0fc7f31ce2212eaa2fc81cf0cf18`, reading-copy SHA-256 `a3d4063bc6df142fcf0439cfd27ad8bf5d5292bb2f943ba35a55aa8f65de3daf`, one-based inclusive lines [[1, 40]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does dbc_IFeatureManagement apply the removed argument? Expected: No. The parameter is declared but unused. Must not claim: The removed flag is changed.
- Does updating a feature reset its creation date? Expected: No. CREATED_DATE is supplied on insert and omitted from update. Must not claim: The original creation date is replaced.

## 191. Action menus, missing endpoints and repeated rules

**Question:** Action menus, missing endpoints and repeated rules?

**What it does.** An action definition needs an endpoint lookup; a menu option resolves a menu and optionally an action. Missing lookups can cause a required-field failure, while the menu option allows a NULL action. The rule routine appends each rule without checking for an existing copy. These routines register metadata and do not run an action.

**What happens**

Trigger: A setup or administration caller invokes the reviewed routine; installed caller and permissions are unverified.

1. Resolve endpoint/action/menu identities using each body’s stated predicate. Evidence: `adm-sql-1884182108`, `adm-sql-1900182165`, `adm-sql-1724181538`.
2. Distinguish required menu or endpoint identities from nullable menu-option actions, and inspect rule duplication separately. Evidence: `adm-sql-1884182108`, `adm-sql-1900182165`, `adm-sql-1724181538`.

**What can affect it**

- ACTIVE and ALWAYS_AVAILABLE are saved; endpoint code is not invoked. Existing action names are not refreshed.
- Rule text is stored as data, not executed or semantically validated here.
- Duplicate guard ignores action, shortcut and separator; changing supplied values does not update an existing menu/sequence.

**What you can check**

- Read the cited routine details for inputs, NULL behavior, effects and limits.

**Expected results and limits**

- An action definition needs an endpoint lookup; a menu option resolves a menu and optionally an action. Missing lookups can cause a required-field failure, while the menu option allows a NULL action. The rule routine appends each rule without checking for an existing copy. These routines register metadata and do not run an action.
- Static source and schema review only; no new database connection, rows, routine execution, UI navigation or production acceptance.
- Opaque string literals were not reconstructed. No claims of live feature activation, authorization, vendor/custom ownership or endpoint availability.
- Catalog references and authored roles do not establish all consumers or full process runtime.

**More detail and sources**

`adm-sql-1884182108`: [dbo.dbc_IDynamicAction](sql/1884182108.sql); source-definition SHA-256 `29495ad805336cb5215d0c3784ead178264d76260bf58b9d62d94c8ec12790a8`, reading-copy SHA-256 `b39032bd478feb33486bcc5306de5875a992cb0cfda39a65a17d6e0f76b5b712`, one-based inclusive lines [[1, 79]].

`adm-sql-1900182165`: [dbo.dbc_IDynamicActionRule](sql/1900182165.sql); source-definition SHA-256 `8a886bff2be381dbcd5cd5f0dd5cff6a7aacdc04d502824a0803fafde127452a`, reading-copy SHA-256 `007d9cf10b4f75e9d59348c571183f77b1072e03fd65d9602ea76b3007381a93`, one-based inclusive lines [[1, 67]].

`adm-sql-1724181538`: [dbo.dbc_IActionMenuOption](sql/1724181538.sql); source-definition SHA-256 `46991e6c0429391de0ecde9d82129913f0bbf02eded38a5c9af1c98a36788afe`, reading-copy SHA-256 `a79be4748e07d08c1d18aaf050be75b566efed48c686b647dbf096ec375d7e7e`, one-based inclusive lines [[1, 79]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does registering a dynamic action invoke its endpoint? Expected: No. It resolves and stores an endpoint ID. Must not claim: The service was called.
- Is adding the same dynamic action rule twice automatically deduplicated? Expected: No. dbc_IDynamicActionRule has an unconditional insert after lookup. Must not claim: Duplicate logical rules are always suppressed.

## 192. Endpoint and exit-point definitions do not execute hooks

**Question:** Endpoint and exit-point definitions do not execute hooks?

**What it does.** Endpoint definitions describe code or transport bindings. Exit-point definitions describe named hooks and ordered parameters. The reviewed routines store those definitions without loading code, contacting a URI or invoking the hook. Existing definitions usually remain unchanged when the seed key already exists.

**What happens**

Trigger: A setup or administration caller invokes the reviewed routine; installed caller and permissions are unverified.

1. Read the endpoint or hook definition identity and required parent references. Evidence: `adm-sql-1916182222`, `adm-sql-1932182279`, `adm-sql-1946802343`, `adm-sql-1948182336`, `adm-sql-1964182393`.
2. Treat active flags and supported types as metadata until installed caller and service evidence establishes how they are used. Evidence: `adm-sql-1916182222`, `adm-sql-1932182279`, `adm-sql-1946802343`, `adm-sql-1948182336`, `adm-sql-1964182393`.

**What can affect it**

- The body neither connects to the URI nor loads assemblies. HTTP_HEADERS and TIME_OUT are not supplied by this procedure; omitted-column database behavior applies.
- SYSTEM_CREATED has an opaque string default; supported endpoint types describe stored metadata, not observed service capability.
- Existing description is preserved.
- Existing exit-point settings are not updated. Runtime hook selection and category semantics need caller evidence.
- This records parameter metadata without binding values or invoking an exit point.

**What you can check**

- Read the cited routine details for inputs, NULL behavior, effects and limits.

**Expected results and limits**

- Endpoint definitions describe code or transport bindings. Exit-point definitions describe named hooks and ordered parameters. The reviewed routines store those definitions without loading code, contacting a URI or invoking the hook. Existing definitions usually remain unchanged when the seed key already exists.
- Static source and schema review only; no new database connection, rows, routine execution, UI navigation or production acceptance.
- Opaque string literals were not reconstructed. No claims of live feature activation, authorization, vendor/custom ownership or endpoint availability.
- Catalog references and authored roles do not establish all consumers or full process runtime.

**More detail and sources**

`adm-sql-1916182222`: [dbo.dbc_IDynamicCallingDetail](sql/1916182222.sql); source-definition SHA-256 `219b1136d35f6be65ef712f9a69e61e963048eb6501c2ba22a15a800b9258fcb`, reading-copy SHA-256 `0685e5db616688ba9177e96eec024fa30152ee99b10abcb89c1b6efc63c2a25e`, one-based inclusive lines [[1, 105]].

`adm-sql-1932182279`: [dbo.dbc_IDynamicCallingHeader](sql/1932182279.sql); source-definition SHA-256 `7c67574c1369ab61f419daeb06a6971a4a217929205a50909fbd63cffc6bffe1`, reading-copy SHA-256 `8e687c505e16b00aea6c4cf174a0623ebb1ea84f59393efb7f643a6c9093daea`, one-based inclusive lines [[1, 38]].

`adm-sql-1946802343`: [dbo.dbc_IExitPointCategory](sql/1946802343.sql); source-definition SHA-256 `9a85920dda275416b376202eaf98fc5f8eaa7d633f3aef735d46e4124fb08be2`, reading-copy SHA-256 `ecd5dcd6ff750841a886f6adae91aee493471d5476a058005181ad4727819de2`, one-based inclusive lines [[1, 33]].

`adm-sql-1948182336`: [dbo.dbc_IExitPoint](sql/1948182336.sql); source-definition SHA-256 `5ac7064222adac54cca79e222f43c98d4bfb6ee26e6ab5cdd40a9db3700dca72`, reading-copy SHA-256 `83ba3bbbf81221fbe42846926807aed364a83df642886461bcce50d850523d3b`, one-based inclusive lines [[1, 64]].

`adm-sql-1964182393`: [dbo.dbc_IExitPointDetail](sql/1964182393.sql); source-definition SHA-256 `16733c1527f00541b7e21149a94616c809068ec9f8a674c4698b90ac3fb56f28`, reading-copy SHA-256 `465dc69d5db1815a7a7d0c8bfa0ed56e3cf68ef82390ef534b4dab8fa7f26fad`, one-based inclusive lines [[1, 64]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does seeding a dynamic calling URI test that service? Expected: No. The URI is stored without a network call. Must not claim: The endpoint is reachable or authenticated.
- Does a NULL exit-point parameter sequence safely suppress duplicates? Expected: No. Equality is not NULL-safe; the unique index can still reject another matching NULL-key combination. Must not claim: The existence check guarantees a no-op.

## 193. Filter definitions, ordered terms and shared attributes

**Question:** Filter definitions, ordered terms and shared attributes?

**What it does.** Filter setup stores a record-type definition, a named filter and ordered expression terms. These seed routines do not run the filter or check its expression grammar. Attribute definitions use one global attribute key: supplying another record type does not create another same-named attribute.

**What happens**

Trigger: A setup or administration caller invokes the reviewed routine; installed caller and permissions are unverified.

1. Identify the record type and filter name, then the sequence of each term. Evidence: `adm-sql-1962802400`, `adm-sql-1978802457`, `adm-sql-1994802514`, `adm-sql-1996182507`.
2. Check field-type and expression meaning through the consuming implementation; stored text alone is not execution evidence. Evidence: `adm-sql-1962802400`, `adm-sql-1978802457`, `adm-sql-1994802514`, `adm-sql-1996182507`.

**What can affect it**

- The supplied filter string is stored and never executed here; existing filter text is not overwritten.
- No join text or table name is executed; existing record-type settings remain unchanged.
- Sequence defines stored position; existing terms are preserved, and no filter execution occurs.
- The duplicate guard uses ATTRIBUTE alone, not RECORD_TYPE; the captured primary key also uses ATTRIBUTE alone.

**What you can check**

- Read the cited routine details for inputs, NULL behavior, effects and limits.

**Expected results and limits**

- Filter setup stores a record-type definition, a named filter and ordered expression terms. These seed routines do not run the filter or check its expression grammar. Attribute definitions use one global attribute key: supplying another record type does not create another same-named attribute.
- Static source and schema review only; no new database connection, rows, routine execution, UI navigation or production acceptance.
- Opaque string literals were not reconstructed. No claims of live feature activation, authorization, vendor/custom ownership or endpoint availability.
- Catalog references and authored roles do not establish all consumers or full process runtime.

**More detail and sources**

`adm-sql-1962802400`: [dbo.dbc_IFilterConfigDetail](sql/1962802400.sql); source-definition SHA-256 `c545c437939ab220d1bdc40933557cf3be258ccb3ae1e362302fc27ae009250b`, reading-copy SHA-256 `509da87fb8cf9e09307cd25f36eca5edd9195806c79e679b24887d62da286368`, one-based inclusive lines [[1, 66]].

`adm-sql-1978802457`: [dbo.dbc_IFilterConfigHeader](sql/1978802457.sql); source-definition SHA-256 `ea88e7518c39559b9b653845d0c4a07e10d3bf553e9422a3489eb41e4bdcc78f`, reading-copy SHA-256 `837bec565498c48f1f476b26ad6def16221d3988f98a080f1c8b7df53a005040`, one-based inclusive lines [[1, 75]].

`adm-sql-1994802514`: [dbo.dbc_IFilterStatement](sql/1994802514.sql); source-definition SHA-256 `9b902027aa4a3a9236c0d99b9470396892cbb2a823c85e2a94c834adc78efc3e`, reading-copy SHA-256 `3e6d2b72c77ce3990f63c3ea63804ea5fa9d8e30eaddb66ab8c5e1c3202ff341`, one-based inclusive lines [[1, 77]].

`adm-sql-1996182507`: [dbo.dbc_IFilterAttributes](sql/1996182507.sql); source-definition SHA-256 `c0526d66f440c2f9622883fc207675910e57ae6e3d594ad8fd988bcd0313a6d6`, reading-copy SHA-256 `9eccc3fdc47784344b93d9c69a2a736680e7b70b7817f31bcfecb2c1093e699f`, one-based inclusive lines [[1, 65]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Can I seed the same filter attribute separately for two record types? Expected: The reviewed guard and primary key use ATTRIBUTE alone, so an existing name is preserved. Must not claim: Record type is part of the attribute key.
- Does storing filter text validate its syntax or balanced parentheses? Expected: No. The reviewed seed bodies do not validate or execute the expression. Must not claim: The filter has been executed successfully.

## 194. Form setup is a sequence of metadata helper calls

**Question:** Form setup is a sequence of metadata helper calls?

**What it does.** Form setup wrappers call separate helpers for the base form, display resources and checkpoint definitions. Viewer setup additionally creates viewer and screen metadata. No wrapper starts a transaction or compensates for a later helper failure, so complete setup depends on caller transaction behavior and all child calls succeeding.

**What happens**

Trigger: A setup or administration caller invokes the reviewed routine; installed caller and permissions are unverified.

1. Follow the exact wrapper’s helper order; process, configuration and viewer forms use different checkpoints. Evidence: `adm-sql-136699885`, `adm-sql-1914802229`, `adm-sql-1957582012`, `adm-sql-2053582354`, `adm-sql-2012182564`.
2. Verify child definitions and the caller transaction before assuming the entire setup is atomic or effective permissions exist. Evidence: `adm-sql-136699885`, `adm-sql-1914802229`, `adm-sql-1957582012`, `adm-sql-2053582354`, `adm-sql-2012182564`.

**What can affect it**

- String flags/resource groups are fixed opaque selectors; this wrapper passes the object identifier to FORM but creates no MAIN_UI_SCREEN record.
- The helper receives caller tableName and usedByGenerator plus a fixed opaque security flag; checkpoint registration does not prove effective user access.
- The screen helper receives objectIdentifier, while the FORM helper call does not. This is metadata construction, not a verified rendered viewer or access grant.
- Distinct helpResourceKey behavior differentiates this wrapper from dbc_IConfigForm. No actual screen interaction is verified.
- No resource, screen or user permission is created by this body itself. Existing form IDs are not updated even if other supplied fields change.

**What you can check**

- Read the cited routine details for inputs, NULL behavior, effects and limits.

**Expected results and limits**

- Form setup wrappers call separate helpers for the base form, display resources and checkpoint definitions. Viewer setup additionally creates viewer and screen metadata. No wrapper starts a transaction or compensates for a later helper failure, so complete setup depends on caller transaction behavior and all child calls succeeding.
- Static source and schema review only; no new database connection, rows, routine execution, UI navigation or production acceptance.
- Opaque string literals were not reconstructed. No claims of live feature activation, authorization, vendor/custom ownership or endpoint availability.
- Catalog references and authored roles do not establish all consumers or full process runtime.

**More detail and sources**

`adm-sql-136699885`: [dbo.dbc_IProcessForm](sql/136699885.sql); source-definition SHA-256 `7978d27c1bb46877447a11a48cc3a9b65e04adbe49e30596067a37b92b0ff6ac`, reading-copy SHA-256 `bca533586f7beca41bc103c469f0d55f70ec0dd1bd840733ad5ee541eabc87b9`, one-based inclusive lines [[1, 63]].

`adm-sql-1914802229`: [dbo.dbc_IConfigForm](sql/1914802229.sql); source-definition SHA-256 `99e03d28ccead976dfd5c1b4a408424e1e4cd279bd050c09dc43135627cf303c`, reading-copy SHA-256 `cc71ecc5d813cbf7d135a5581bba58209d824ab03c8903023391b5dd68b918b7`, one-based inclusive lines [[1, 79]].

`adm-sql-1957582012`: [dbo.dbc_IViewerForm](sql/1957582012.sql); source-definition SHA-256 `55c81ca32b702da85f40cb6194af86ed9d4dd0e14e9a0077dc690850f67bfb8f`, reading-copy SHA-256 `275e4c92c1aa295e78892c2dc5fc9a54fc508dae9199e36d8335bcf6498f1159`, one-based inclusive lines [[1, 105]].

`adm-sql-2053582354`: [dbo.dbc_IGenericConfigForm](sql/2053582354.sql); source-definition SHA-256 `0dd7c48236c92b42f5e24d26dbb2230e98cb031c46bdd8333fec05ae938bf154`, reading-copy SHA-256 `bf52955d4e3ae16c3d0fa430621935c84abbfefe5dc7cd79de4eee1bbe75aa4b`, one-based inclusive lines [[1, 86]].

`adm-sql-2012182564`: [dbo.dbc_IForm](sql/2012182564.sql); source-definition SHA-256 `f15c3a61fedbc11b4a7b9a87f4bc96235b6d923ec0a3fa7ba2c9341fb98c233f`, reading-copy SHA-256 `d6f1e1a551d4f123e3a19d4ba9bbf8b5a8b6238bab7841004fbc96990eac9b56`, one-based inclusive lines [[1, 65]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Are all form-registration steps automatically one transaction? Expected: No explicit wrapper transaction or rollback is present; caller/session rules govern. Must not claim: The wrapper guarantees atomic setup.
- Does generic configuration form help always use formKeyName? Expected: No. It passes the separate helpResourceKey to the help-resource call. Must not claim: Title and help necessarily use the same key.

## 195. Insight, details and transaction form registrations differ

**Question:** Insight, details and transaction form registrations differ?

**What it does.** These wrappers register metadata forms and screen paths with numeric path type 6. Insight builds its path using the form ID. Details and transaction forms use a lowercased abbreviation and pass restriction/default identifiers. The transaction wrapper has an extra checkpoint tail. Registration does not prove the current screen route or actual navigation.

**What happens**

Trigger: A setup or administration caller invokes the reviewed routine; installed caller and permissions are unverified.

1. Select the wrapper used by the captured definition and follow its path construction and helper arguments. Evidence: `adm-sql-1989582126`, `adm-sql-2005582183`, `adm-sql-2021582240`.
2. Establish current screen navigation and effective restrictions separately; literal prefixes remain opaque in this review. Evidence: `adm-sql-1989582126`, `adm-sql-2005582183`, `adm-sql-2021582240`.

**What can affect it**

- Restrictions/defaults identifiers are passed to the screen helper; their rules are not interpreted here. The repeated checkpoint-1 call is preserved, not deduplicated in this explanation.
- This wrapper passes no restrictions/defaults identifiers. Source registration does not establish current Insight navigation or screen acceptance.
- Unlike the transaction wrapper, the body ends after menu-resource calls and has no extra checkpoint-1/checkpoint-3 tail.

**What you can check**

- Read the cited routine details for inputs, NULL behavior, effects and limits.

**Expected results and limits**

- These wrappers register metadata forms and screen paths with numeric path type 6. Insight builds its path using the form ID. Details and transaction forms use a lowercased abbreviation and pass restriction/default identifiers. The transaction wrapper has an extra checkpoint tail. Registration does not prove the current screen route or actual navigation.
- Static source and schema review only; no new database connection, rows, routine execution, UI navigation or production acceptance.
- Opaque string literals were not reconstructed. No claims of live feature activation, authorization, vendor/custom ownership or endpoint availability.
- Catalog references and authored roles do not establish all consumers or full process runtime.

**More detail and sources**

`adm-sql-1989582126`: [dbo.dbc_IMetadataTransactionForm](sql/1989582126.sql); source-definition SHA-256 `fc26eff4a79905049ea477d8728956f598938897e8285a08f6195943228f3490`, reading-copy SHA-256 `ac3b2cb3de8632ab53a8cc88f04651d3893cdf2735aba6b73599dd8d27a27722`, one-based inclusive lines [[1, 91]].

`adm-sql-2005582183`: [dbo.dbc_IMetadataInsightForm](sql/2005582183.sql); source-definition SHA-256 `b30bd3743b515a9eaebc70669fcc2d5a19f81b7703b8d55d104e12e9f5ad34ff`, reading-copy SHA-256 `7156d25990cb14efed9a61e6ac2b67361c89e1f21b7070d80df2b65de32a8aca`, one-based inclusive lines [[1, 80]].

`adm-sql-2021582240`: [dbo.dbc_IMetadataDetailsForm](sql/2021582240.sql); source-definition SHA-256 `57896a4fdb2c6da86ebd2ca991b3f416699f0bddb00a604ce49c41de15ed1283`, reading-copy SHA-256 `e95eaafaabc5f8857b43fc8ec36a54e24e3abfc1d7aff0fdc8de6b7a5d37950b`, one-based inclusive lines [[1, 88]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Do Insight and details registration build paths from the same input? Expected: No. Insight uses formId text; details uses the lowercased abbreviation. Must not claim: Both routes are the same or verified live.
- Does transaction form registration call checkpoint 1 only once? Expected: No. It calls checkpoint 1 earlier and again in its tail, then checkpoint 3. Must not claim: There is only one checkpoint-1 call.

## 196. Screen counts, templates and license associations

**Question:** Screen counts, templates and license associations?

**What it does.** Screen setup checks the existing form rows, may replace the requested active flag, and uses a count guard before inserting. The table also enforces uniqueness on form ID plus active value. Template and license mapping routines register associations; they do not establish user access or license entitlement.

**What happens**

Trigger: A setup or administration caller invokes the reviewed routine; installed caller and permissions are unverified.

1. Distinguish form ID from screen object ID: one license helper selects every screen for the form, while Original selects one screen identity. Evidence: `adm-sql-2124182963`, `adm-sql-2140183020`, `adm-sql-8699429`, `adm-sql-24699486`, `adm-sql-40699543`.
2. Keep count guards, table constraints and current application access separate; concurrent safety is not established by an existence check. Evidence: `adm-sql-2124182963`, `adm-sql-2140183020`, `adm-sql-8699429`, `adm-sql-24699486`, `adm-sql-40699543`.

**What can affect it**

- The intended count guard and coded flag substitution are static evidence, not a concurrency guarantee or execution acceptance. PathType defaults 1; menu visibility default is opaque. Caller restrictions/defaults identifiers are stored without interpretation.
- No template assignment or rendered screen is established by the seed.
- Selection is by template name and functional group only; ACTIVE is not tested.
- This variant selects by FORM_ID; it does not test screen ACTIVE and does not validate license entitlement.
- Caller supplies the screen object identity; the procedure stores a mapping, not an entitlement grant.

**What you can check**

- Read the cited routine details for inputs, NULL behavior, effects and limits.

**Expected results and limits**

- Screen setup checks the existing form rows, may replace the requested active flag, and uses a count guard before inserting. The table also enforces uniqueness on form ID plus active value. Template and license mapping routines register associations; they do not establish user access or license entitlement.
- Static source and schema review only; no new database connection, rows, routine execution, UI navigation or production acceptance.
- Opaque string literals were not reconstructed. No claims of live feature activation, authorization, vendor/custom ownership or endpoint availability.
- Catalog references and authored roles do not establish all consumers or full process runtime.

**More detail and sources**

`adm-sql-2124182963`: [dbo.dbc_IMainUiScreen](sql/2124182963.sql); source-definition SHA-256 `145e298d167807d6d6364dc08e2148e0e0a41f66c2a247318bf50c80b966c318`, reading-copy SHA-256 `8132e6c957040ce527763c47397163e4bec96660a357689fe99edee73f4946db`, one-based inclusive lines [[1, 105]].

`adm-sql-2140183020`: [dbo.dbc_IMainUiTemplate](sql/2140183020.sql); source-definition SHA-256 `14924a3b9238c457b8a60a9ee2baf8f30335170b3c11a993b258cb9e12f48ab0`, reading-copy SHA-256 `d62db712ef9355749a50c6c950df8b49cf6a33605c9a72bfcde75893a248285f`, one-based inclusive lines [[1, 63]].

`adm-sql-8699429`: [dbo.dbc_IMainUiTemplateFunGrpXref](sql/8699429.sql); source-definition SHA-256 `eae153bfb7c4cc56e11d57c5b8fc0f66fbc7bc08eabad0cd8e05bc1f78e741e1`, reading-copy SHA-256 `2e076e1f1eb2994a855aa3e58ee09fc40050459ccdbd0448b623baa820e46f07`, one-based inclusive lines [[1, 62]].

`adm-sql-24699486`: [dbo.dbc_IMainUiWmLicenseXref](sql/24699486.sql); source-definition SHA-256 `fc090bd49f1a730e72c00504569a7cd324ac82c3464bf22c663475679e60c21b`, reading-copy SHA-256 `257012b40dc256a6359fab0116a98a2246673253d679fe443a1c24f9e8828bc4`, one-based inclusive lines [[1, 69]].

`adm-sql-40699543`: [dbo.dbc_IMainUiWmLicenseXrefOriginal](sql/40699543.sql); source-definition SHA-256 `2cd646769852510c0afae971a58e4d235a39c67695ba872020ce2d6c4722aec4`, reading-copy SHA-256 `2fec9184e7b74d491156bd25af60fd5c1b6c9b9e1c3444bd55f6edb6cfaa0177`, one-based inclusive lines [[1, 65]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the non-Original license helper select one screen object ID? Expected: No. It selects MAIN_UI_SCREEN by FORM_ID and may process multiple screen rows. Must not claim: It is identical to the Original screen-ID variant.
- Does the main UI screen guard reject every form that already has one row? Expected: Its stated aggregate threshold is greater than 1, so one row is not rejected by that count condition alone; constraints separately govern acceptance. Must not claim: The count condition is a zero-existing-row test.

## 197. Lookup setup and status-flow metadata boundaries

**Question:** Lookup setup and status-flow metadata boundaries?

**What it does.** Lookup setup stores table and field descriptions and can add resource text. Its optional configuration-record-type comparison is not NULL-safe. Status-flow setup inserts area/status metadata but does not move a warehouse transaction to a new status. Neither body proves the settings selected by an active user.

**What happens**

Trigger: A setup or administration caller invokes the reviewed routine; installed caller and permissions are unverified.

1. Check lookup record/table/configuration keys and the optional resource-text branch independently. Evidence: `adm-sql-2108182906`, `adm-sql-2010802571`.
2. Read the exact functional-area/status key for status configuration; use separate transaction and caller evidence for operational effects. Evidence: `adm-sql-2108182906`, `adm-sql-2010802571`.

**What can affect it**

- No lookup query executes here. The resource call is independently conditional and can have effects after a no-op insert.
- The body stores status configuration without changing transaction status or checking effective warehouse/company flow. Existing area/status rows remain unchanged.

**What you can check**

- Read the cited routine details for inputs, NULL behavior, effects and limits.

**Expected results and limits**

- Lookup setup stores table and field descriptions and can add resource text. Its optional configuration-record-type comparison is not NULL-safe. Status-flow setup inserts area/status metadata but does not move a warehouse transaction to a new status. Neither body proves the settings selected by an active user.
- Static source and schema review only; no new database connection, rows, routine execution, UI navigation or production acceptance.
- Opaque string literals were not reconstructed. No claims of live feature activation, authorization, vendor/custom ownership or endpoint availability.
- Catalog references and authored roles do not establish all consumers or full process runtime.

**More detail and sources**

`adm-sql-2108182906`: [dbo.dbc_ILookupReference](sql/2108182906.sql); source-definition SHA-256 `32d52fa56c6cc487b5566ee7dd4bc413114cd20d8edbabaa26cd2119bb341582`, reading-copy SHA-256 `e41bd6a942faa0c5f91295000687f543fb045508ebdbc7e6fe7906bb57082d46`, one-based inclusive lines [[1, 143]].

`adm-sql-2010802571`: [dbo.dbc_IFunctionalAreaStatusFlow](sql/2010802571.sql); source-definition SHA-256 `d56675fc6aae6f512898f76fce7e642f3c3bb77416b2d16f2cd153e71f0002d6`, reading-copy SHA-256 `c60e909f4d585a654692589eb9a89fc4ecfe6a51d1574ed15ee2fa51efd14700`, one-based inclusive lines [[1, 75]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- If lookup insertion is skipped, can resource text still be processed? Expected: Yes. The non-NULL recordTypeText branch is evaluated after the insert independently. Must not claim: A skipped insert skips all later work.
- Does seeding FUNCTIONAL_AREA_STATUS_FLOW change a shipment status? Expected: No. It writes status-flow configuration only. Must not claim: A shipment or receipt status was changed.

## 198. Screen parts, groups and controls preserve existing definitions

**Question:** Screen parts, groups and controls preserve existing definitions?

**What it does.** Screen setup stores parts, groups, layout columns, controls, attributes and event definitions. Most helpers preserve an existing name within its parent. The attribute helper also compares the value, so changing a value can add another row instead of replacing the old one. Event and parameter registration does not execute an event.

**What happens**

Trigger: A setup or administration caller invokes the reviewed routine; installed caller and permissions are unverified.

1. Check the exact parent identity and duplicate key before interpreting repeated setup. Evidence: `adm-sql-264700341`, `adm-sql-280700398`, `adm-sql-296700455`, `adm-sql-312700512`, `adm-sql-344700626`, `adm-sql-360700683`, `adm-sql-376700740`.
2. Treat active flags, CSS, tokens and event metadata as definitions until a rendered application and caller behavior are separately verified. Evidence: `adm-sql-264700341`, `adm-sql-280700398`, `adm-sql-296700455`, `adm-sql-312700512`, `adm-sql-344700626`, `adm-sql-360700683`, `adm-sql-376700740`.

**What can affect it**

- Duplicate selection ignores SCREEN_GROUP_COLUMN_ID, sequence and active state; settings are metadata, not evidence of accessible behavior.
- Guard includes the attribute value but ignores active/property flags and tokens. Existing matching triples are preserved; no token substitution occurs here.
- Stores event metadata only; does not raise an event or invoke an event handler.
- Existing parameter values are preserved; registering a parameter does not execute the event.
- Stored parent/nesting metadata does not prove runtime loading order or UI interaction.
- Existing column name/group pairs preserve earlier CSS and sequence; no rendered layout is established.
- Existing part/screen pairs are preserved; source metadata does not verify the actual current screen composition.

**What you can check**

- Read the cited routine details for inputs, NULL behavior, effects and limits.

**Expected results and limits**

- Screen setup stores parts, groups, layout columns, controls, attributes and event definitions. Most helpers preserve an existing name within its parent. The attribute helper also compares the value, so changing a value can add another row instead of replacing the old one. Event and parameter registration does not execute an event.
- Static source and schema review only; no new database connection, rows, routine execution, UI navigation or production acceptance.
- Opaque string literals were not reconstructed. No claims of live feature activation, authorization, vendor/custom ownership or endpoint availability.
- Catalog references and authored roles do not establish all consumers or full process runtime.

**More detail and sources**

`adm-sql-264700341`: [dbo.dbc_IScreenControl](sql/264700341.sql); source-definition SHA-256 `2c0b9b52e11e384454139a41bef8756899648581f600ad3815b78d4c43df8341`, reading-copy SHA-256 `b7f1469f61bf566dc6173e743bfe7dcdeb9450f2e19e3a953506e325a062ee0b`, one-based inclusive lines [[1, 100]].

`adm-sql-280700398`: [dbo.dbc_IScreenControlAttributes](sql/280700398.sql); source-definition SHA-256 `51b19d4bf5befde5f3111431081c2f19a01cb8ea1e0850aeafef060586a7899f`, reading-copy SHA-256 `ee7aaa36ed53d2a027d833b25b5943ef04955d4a51bca0a003cc274f6b166476`, one-based inclusive lines [[1, 382]].

`adm-sql-296700455`: [dbo.dbc_IScreenControlEvent](sql/296700455.sql); source-definition SHA-256 `22c5ae3ef180d76b7474708e902fdf9b7dae2fecd9260e24a220c8a83bf6efe8`, reading-copy SHA-256 `661e041f8c7a2f69ebf659d994f7a2e560a6306bae28343f06f84689cc8b7be8`, one-based inclusive lines [[1, 67]].

`adm-sql-312700512`: [dbo.dbc_IScreenControlEventParameters](sql/312700512.sql); source-definition SHA-256 `4ef69a7aa05ac95c1e4e4a2048e08eaece9934644b07576f7463f152749eaffb`, reading-copy SHA-256 `05a2633bc8df8982129b4685418e18f1221ea5a2824c42aba2b6e494616d5c71`, one-based inclusive lines [[1, 64]].

`adm-sql-344700626`: [dbo.dbc_IScreenGroup](sql/344700626.sql); source-definition SHA-256 `dd166291fed3530fdf2d8a94793d34d77117385deec6a0f7f794ee363c07fd2c`, reading-copy SHA-256 `4179d7332b263cea9d1c20df3011a9ad5fe903f4a0b149f7f2ac707c00ff9378`, one-based inclusive lines [[1, 98]].

`adm-sql-360700683`: [dbo.dbc_IScreenGroupColumn](sql/360700683.sql); source-definition SHA-256 `ca1f0b22784dd639daa31f41ca03a7e3871d57c2b7d007ae4e48437a9acb1771`, reading-copy SHA-256 `a0843b0748243052721fff7daa1d78c8ce2e154241e65d45e73ebc2dfcd89a0f`, one-based inclusive lines [[1, 63]].

`adm-sql-376700740`: [dbo.dbc_IScreenPart](sql/376700740.sql); source-definition SHA-256 `de9b51d9653629b83502b79bb5875f6127573a20178455132d5c9737891e354f`, reading-copy SHA-256 `6c1094b9823450557b2fadb0243dea2e98e07e83a8a158343ed385512922dff7`, one-based inclusive lines [[1, 84]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does adding a new value for an existing control attribute necessarily replace the old row? Expected: No. The guard includes ATTRIBUTE_VALUE, so a different value can be inserted as another row. Must not claim: The old attribute value is overwritten.
- Can changing gridColumn create a second event with the same event ID and control? Expected: No. That helper duplicate guard uses EVENT_ID and SCREEN_CONTROL_ID only. Must not claim: Grid column participates in that duplicate key.

## 199. Grid and viewer bindings are metadata, with distinct duplicate rules

**Question:** Grid and viewer bindings are metadata, with distinct duplicate rules?

**What it does.** Grid setup stores expressions and edit/display flags; viewer setup stores header/detail bindings. They do not execute the data source or create database keys. Grid duplicate checks normalize NULL field names using zero, while web-screen setup preserves an existing screen name even when a different company is supplied.

**What happens**

Trigger: A setup or administration caller invokes the reviewed routine; installed caller and permissions are unverified.

1. Distinguish a UI primary-key flag from a real database constraint. Evidence: `adm-sql-328700569`, `adm-sql-504701196`, `adm-sql-520701253`.
2. Check the actual duplicate predicate and data-source consumer; note that the grid helper uses GETDATE, unlike the explicit UTC calls in the other reviewed seed helpers. Evidence: `adm-sql-328700569`, `adm-sql-504701196`, `adm-sql-520701253`.

**What can affect it**

- Duplicate guard ignores sequence, flags and width. IS_PRIMARY_KEY is stored UI metadata; it creates no database key. Server local-time semantics of GETDATE must not be silently relabeled as explicit UTC.
- The viewer-form wrapper passes engineType 0. Existing form bindings are not updated and no viewer query is run.
- The duplicate guard uses SCREEN_NAME alone, not COMPANY; supplying another company does not create a second same-named header through this routine.

**What you can check**

- Read the cited routine details for inputs, NULL behavior, effects and limits.

**Expected results and limits**

- Grid setup stores expressions and edit/display flags; viewer setup stores header/detail bindings. They do not execute the data source or create database keys. Grid duplicate checks normalize NULL field names using zero, while web-screen setup preserves an existing screen name even when a different company is supplied.
- Static source and schema review only; no new database connection, rows, routine execution, UI navigation or production acceptance.
- Opaque string literals were not reconstructed. No claims of live feature activation, authorization, vendor/custom ownership or endpoint availability.
- Catalog references and authored roles do not establish all consumers or full process runtime.

**More detail and sources**

`adm-sql-328700569`: [dbo.dbc_IScreenControlGridColumns](sql/328700569.sql); source-definition SHA-256 `d90d598f82a1711875f29ed12b00ebc6d4dbc65d2e8eb6dd0a8a64288839a37d`, reading-copy SHA-256 `a13a940fb1e1c070497b5ba6c79d307959a50a34d768c4e635f8af147953ef9d`, one-based inclusive lines [[1, 105]].

`adm-sql-504701196`: [dbo.dbc_IViewerTemplate](sql/504701196.sql); source-definition SHA-256 `9019a95068042bd4f03a312dea77f58f86ad20522cf8776fd79f55529b1baae0`, reading-copy SHA-256 `46403b4b49d9b5cad0e8a58da9629182f52994aeabc9841d056f141c53a81b1f`, one-based inclusive lines [[1, 69]].

`adm-sql-520701253`: [dbo.dbc_IWebScreenDataHeader](sql/520701253.sql); source-definition SHA-256 `5a5b7a2ce8ddf2966965bb9f359632196cec1f0a765e366bb30da1424bc0bd7d`, reading-copy SHA-256 `a0e96ea38cac538644dbaa9bc1200cf076c8113cb7739acbd4b1d7516611ff46`, one-based inclusive lines [[1, 85]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the grid IS_PRIMARY_KEY flag create a database primary key? Expected: No. It is a value stored in SCREEN_CONTROL_GRID_COLUMNS. Must not claim: A SQL primary key is created.
- Does web-screen setup use company as part of its duplicate guard? Expected: No. It checks SCREEN_NAME alone. Must not claim: Same screen names are independently seeded per company.

## 200. Existing resource text can raise a setup error

**Question:** Existing resource text can raise a setup error?

**What it does.** The resource helper preserves an existing language/group/key. If a new text value compares unequal to the stored text, it raises SQL error severity 18 instead of updating the text. This matters to form wrappers that call it after earlier setup steps. System-configuration detail setup also preserves an existing key, but has no corresponding custom text-conflict check.

**What happens**

Trigger: A setup or administration caller invokes the reviewed routine; installed caller and permissions are unverified.

1. Identify language, resource group and key, then compare the source text under the database comparison rules. Evidence: `adm-sql-2058802742`, `adm-sql-488701139`.
2. Treat the SQL error and caller transaction separately; these helpers supply no automatic rollback for earlier wrapper effects. Evidence: `adm-sql-2058802742`, `adm-sql-488701139`.

**What can affect it**

- Comparison follows SQL collation. Repeating an existing key with equal text preserves previous field lengths, decimals and stamps; no language fallback is selected.
- Existing values are not overwritten; this static review reads no actual polymorphic SYSTEM_VALUE contents.

**What you can check**

- Read the cited routine details for inputs, NULL behavior, effects and limits.

**Expected results and limits**

- The resource helper preserves an existing language/group/key. If a new text value compares unequal to the stored text, it raises SQL error severity 18 instead of updating the text. This matters to form wrappers that call it after earlier setup steps. System-configuration detail setup also preserves an existing key, but has no corresponding custom text-conflict check.
- Static source and schema review only; no new database connection, rows, routine execution, UI navigation or production acceptance.
- Opaque string literals were not reconstructed. No claims of live feature activation, authorization, vendor/custom ownership or endpoint availability.
- Catalog references and authored roles do not establish all consumers or full process runtime.

**More detail and sources**

`adm-sql-2058802742`: [dbo.dbc_IResourceFileBase](sql/2058802742.sql); source-definition SHA-256 `ecd1996aac6ef6e26d02ab4eea1c5b30505c00741fb7f1f2d84e63270c744580`, reading-copy SHA-256 `79779ec7839fea11894d3b7f829770af515ca1ccd11f1705de84065ddf7f4e65`, one-based inclusive lines [[1, 69]].

`adm-sql-488701139`: [dbo.dbc_ISystemConfigDetail](sql/488701139.sql); source-definition SHA-256 `a00293e9faf58207fcaac574c11ae6683fb6a72f6b8822770cc04c1eb9c68596`, reading-copy SHA-256 `e7e91fc3151d797df5337f00db6ddcf83ed1f143a56798c9806725bba82b481a`, one-based inclusive lines [[1, 49]].

Review: `STATIC_REVIEWED_BOUNDED`. Independent verification: `PENDING_COORDINATOR_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does supplying new text to an existing resource key update its label? Expected: No. Unequal text raises RAISERROR at severity 18/state 1; existing text is preserved. Must not claim: The label is automatically replaced.
- Does the resource helper treat NULL as unequal to existing text? Expected: No. A NULL inequality comparison is UNKNOWN and does not enter that branch. Must not claim: NULL always triggers the conflict error.

## 201. Putaway groups: design intent and mobile version limits

**Question:** Does a documented putaway-group workflow prove it is available in my Warehouse Mobile version?

**What it does.** No. The Grupo Julio example describes receiving and putting away items as a group, but also records that receiving with putaway groups was unavailable in Warehouse Mobile 24.1.2278 on 9 August 2024. The document gives no delivery date. Confirm the installed version and supported workflow before applying that design to your warehouse.

**What happens**

Trigger: Comparing an implementation design with a mobile version or an installed warehouse.

1. The design describes receiving items into a putaway group and moving the group together. These paragraphs explain intended behavior in that implementation. Evidence: `sdd-boundary-grupo-putaway-groups-version-conflict`.
2. The same document keeps an open issue stating that receiving with putaway groups was unavailable in Warehouse Mobile 24.1.2278, with no expected date. A final document title does not remove that qualification. Evidence: `sdd-boundary-grupo-putaway-groups-version-conflict`.
3. Use version-matched release or application evidence to determine support in the installed system. Captured database tables and views do not establish the mobile screen, feature availability or effective receiving preference. Evidence: `sdd-boundary-grupo-putaway-groups-version-conflict`.

**What can affect it**

- Receiving preferences and group assignments describe choices; their presence does not establish mobile support or current activation.

**What you can check**

- Check the installed Warehouse Mobile build and version-matched feature or release evidence.
- Check the applicable receiving workflow and configuration using a sanitized configuration contract; do not infer values from another implementation.

**Expected results and limits**

- A distinction between intended design, its historical version limitation, and the current deployment question that remains unanswered.
- No claim is made about later versions, a delivery date or this deployment.
- No live receiving, putaway or screen-navigation test was performed.
- Raw SDD production indexing remains disabled. Only the selected reviewed claim is bound in this local help topic.

**More detail and sources**

`sdd-boundary-grupo-putaway-groups-version-conflict`: [grupo-putaway-groups-version-conflict](../SDD/derived/reviewed-knowledge.json); reviewed-record SHA-256 `a2ca3e7862ed92bbdbbcfc7a4ddf97ddad7a8235b0f2b3cab3565c084b13127a`; original documents/nodes sdd-d50ca4a96095c930: p033-b002, p033-b004, p037-b002, p106-b005, p106-b006. Selected reviewed claim only; the SDD corpus remains outside production indexing.

Review: `DOCUMENTARY_VERSION_CONFLICT_REVIEWED_DEPLOYMENT_OPEN`. Independent verification: `SEE_CURRENT_CHECKPOINT_REVIEW`.

**Answer evaluation expectations**

Actual local HTTP retrieval and selected-topic citation checks are reported separately in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored.

- Does the Grupo Julio putaway-group design prove Warehouse Mobile 24.1.2278 supports it? Expected: intended workflow and open issue differ unavailable in cited version current deployment unknown Must not claim: feature is enabled here all later versions lack it
- When did receiving with putaway groups become available after the 24.1.2278 issue? Expected: no delivery date in cited issue later release evidence required Must not claim: invented release date final title proves delivery
