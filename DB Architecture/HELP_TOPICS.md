# SCALE functionality help

Understand warehouse processes, configure SCALE and diagnose common results. Available screens and effective settings depend on your installation.

## Configure SCALE

- [Configuring a work profile and its sequence rules](#work-profile-configuration)
- [Configuring packing preferences for users](#packing-preference-configuration)
- [Printing packing and closing documents](#packing-label-printing)
- [Configuring over-receiving and receipt execution](#receiving-overage-configuration)
- [Receiving returns or damaged stock](#returns-damage-status)
- [Keeping container contents together or separate](#packing-classes-and-criteria)
- [Packing station container choices: company and warehouse access](#packing-container-type-eligibility)

<a id="shipment-detail"></a>

## Understanding shipment detail fields

The summary combines the shipment header, containers, dock door and shipment lines. For some line-level fields, SCALE returns a blank summary when the lines contain different non-null values. A blank summary therefore does not always mean information is missing.

A shipment detail pane requests summary data.

### How it works

1. Read the shipment header view and call the status-name function for leading and trailing status.
2. Count containers whose tree-unit number equals their internal container number, filtered to the shipment.
3. Assign a dock-door number through the shipment-view/load join, then read LOCATION.
4. For USER_DEF1..6, INVOICE and PICK_LIST_ID, return NULL when COUNT(DISTINCT field) exceeds one; otherwise return MIN(field).

### Settings and prerequisites

- The screen must be bound to this detail routine; culture is supplied by the screen.


### Results

- Four result sets provide the header, parent-container count, dock door and line-derived summary values. A variable-assignment SELECT is not a fifth result set.


### Troubleshooting

- A blank line-derived summary can also occur when all relevant values are null or no detail rows match.


### Limits

- The dock-door lookup has no shipment filter in its assignment statement, so an unexpected door requires checking that lookup.
- The SDK example differs from this database routine's signature.


<details>
<summary>Technical reference and sources</summary>

`shipment-detail-sql`: [dbo.SHP_InsightDetailPaneData](sql/1633753223.sql); source-definition SHA-256 `78364f898a329680b446b42f8071be5d2d79484a1592c4108f91a36096650147`, reading-copy SHA-256 `91be70e93fcaf6cd46bdc9ff8ae8fb5923ba31e252460dcaf62dd1e520a7342c`, one-based inclusive lines [[40, 88]].

`shipment-detail-sdk`: [How to: Create a Detail Pane Stored Procedure](../SDK/reading/35cdfcbe2823f6394fe2644f35985b4dd4c0b5f9cf4e66f1d6d0d8f7fa5b8339.md); SDK article `35cdfcbe2823f6394fe2644f35985b4dd4c0b5f9cf4e66f1d6d0d8f7fa5b8339`, original SHA-256 `6c46ec3389ead3049deb0ff074e7dad5e36fa23163455fd4aa8613a44804200a`, nodes n47, n80, n414.

</details>

<a id="work-monitor"></a>

## Understanding work monitor totals

A work unit can contain several instructions, so work-unit and instruction totals need not match. Estimated time is a planning value, not measured elapsed time.

A work monitor requests chart and summary data.

### How it works

1. Parse the warehouse filter and select nonclosed detail instructions for the chart.
2. Count distinct work units within each chart condition, sum those counts for the total, count instruction rows separately and aggregate estimated time.
3. Count closed detail instructions in active and inactive storage whose timestamps fall within the rolling one-hour window. Return six summary result sets after the chart.

### Settings and prerequisites

- The warehouse filter, grouping and condition define which work contributes to each total.


### Results

- The routine returns seven result sets. Empty input can produce NULL for some sums, zero estimated time and zero recently closed instructions.


### Troubleshooting

- Check missing or duplicate filters before interpreting an empty result as an empty warehouse.


### Limits

- The rolling timestamp window does not establish exact completion-event time or throughput. The SDK example has a different result-set count.


<details>
<summary>Technical reference and sources</summary>

`work-batch-1082799265`: [dbo.WRK_MonitorWorkGroupChartData](sql/1082799265.sql); source-definition SHA-256 `9f39d9614e0eb5eebcc4bb6ca304351d4e35a8f0ad00e6dad950ac84e308b92f`, reading-copy SHA-256 `5a34e088b302084eeb2eae90fbfc0726d3a11cf9282f597ac5eab59d37d91e13`, one-based inclusive lines [[1, 79]].

`work-batch-172579703`: [dbo.WORK_INSTRUCTION_VIEW](sql/172579703.sql); source-definition SHA-256 `8e8dadbd10a8e2f71f85701252fe2cec66c136c883e63de03dc7a6277e777a9d`, reading-copy SHA-256 `f8ad80899fdf8de790c7a4e5df028bf9981cc3f774a55f1a3f99538f86e109c2`, one-based inclusive lines [[1, 9]].

`work-monitor-sdk-batch`: [How to: Create Monitor Page Stored Procedure](../SDK/reading/2f1e464b919bbe6d9db8cf9f7a2eb6d5cfd5866b662fd85c0ef3c9c02005b000.md); SDK article `2f1e464b919bbe6d9db8cf9f7a2eb6d5cfd5866b662fd85c0ef3c9c02005b000`, original SHA-256 `8ffbb7c80b927b1c7e10e600060b6bf4e40ee562531deb705745193a32d6fd60`, nodes n47, n56, n59, n62, n97.

`work-monitor-aim-batch`: [Using the Work Monitoring: Group Screen](../AIM/reading/b77c848bec2898b6a573aa878319bb07181352908f6b6a8fa4c55b919d5c310c.md); AIM article `b77c848bec2898b6a573aa878319bb07181352908f6b6a8fa4c55b919d5c310c`, original SHA-256 `e7454d5ac265ba5499c91ce066c85d0f11970444a47dbdeff73646aa726d66ad`, nodes n58, n60, n64, n114, n122.

</details>

<a id="work-selection"></a>

## Understanding which work is offered

SCALE selects work using the employee, warehouse, work profile, location and container context. Different eligibility and ordering rules can therefore offer different work to two users.

The application requests candidate work for an operator.

### How it works

1. Cart regrouping can calculate and persist detail-instruction sequence before selecting candidates.
2. Read profile/sequence options, authorization and features, then build eligibility and ordering.
3. In eligible system-directed branches, probe priority and exact/greater/lower locations before executing the final parameter-bound candidate query.

### Settings and prerequisites

- Some profile options are read by profile alone without a defined selection order; others also use the requested sequence. Multiple detail rows can affect which settings are combined.
- The relevant performance branch falls back to a 2000-row cap when its configured cap is missing or invalid.


### Troubleshooting

- Compare the active profile and requested sequence with warehouse, work type, zone, equipment and location eligibility.


### Limits

- The cart branch can update stored instruction sequence, so this routine is not a read-only diagnostic.
- This routine does not itself advance through every profile sequence. Configured sort expressions and equivalence between performance and legacy paths remain unresolved.


### Related articles

- [Configuring a work profile and its sequence rules](#work-profile-configuration)

<details>
<summary>Technical reference and sources</summary>

`work-batch-51843597`: [dbo.WRK_GetWorkInstructionsForExecution](sql/51843597.sql); source-definition SHA-256 `eca08945d5ab9ce42fdf8c01403853dd3addf9a62075e31053e20732f7db87cf`, reading-copy SHA-256 `337a1793a82284ecd9d2c95352ab086d5ee8dae4e6e6a8d6025a62198c6678b0`, one-based inclusive lines [[1, 752]].

`work-batch-680701823`: [dbo.fn_GetFeatureEnabled](sql/680701823.sql); source-definition SHA-256 `097700a5c953e7c7e7ad3c9c07e33ce4fb97ed8c874ce1742e50ca9a6561f8b6`, reading-copy SHA-256 `77e132ef10237d4ba41dc2326eb114aa18def1a75579f7db4b065d6856aa260e`, one-based inclusive lines [[1, 19]].

`work-profile-aim-batch`: [Work Profile Configuration](../AIM/reading/c8c2ec9d410d0d0b34795db2c5e9739a523f1f43dcff53a075dd003d3728b917.md); AIM article `c8c2ec9d410d0d0b34795db2c5e9739a523f1f43dcff53a075dd003d3728b917`, original SHA-256 `0fcfb997f9066a6d12582752fc7bf54ee9dcd66684b04d9089ee43de8758be90`, nodes n60, n63, n65.

</details>

<a id="inventory-adjustment"></a>

## Understanding an inventory adjustment

An inventory adjustment can change source quantities, destination quantities and serial records. The caller's effect flags identify which quantity categories should change.

A caller submits INV_AdjustInv with transaction and source/destination context.

### How it works

1. If quantity is null/zero, both locations are null or item is null, create an audit message, call ADT_LogAudit and return before adjustment calls.
2. Convert dates, normalize zero attribute IDs and conditionally read serial-tracking/location-class rules; raise errors for coded disallowed combinations.
3. When the serial argument/effect conditions apply, validate and pick serial numbers, returning nonzero child codes immediately.
4. When source effect flags match, call INV_PickFromLocation and propagate SQL or nonzero child errors.
5. When destination flags match, call INV_PutIntoLocation with source attributes passed forward, then conditionally put serial numbers.

### Settings and prerequisites

- Item serial tracking and location class control validation. Transaction type and quantity-effect flags are supplied by the caller.


### Troubleshooting

- For a rejected adjustment, distinguish a basic-input exit from serial/location validation or an error returned by a child operation.


### Limits

- Source and destination changes are conditional. Caller-level rollback and whole-transaction atomicity cannot be determined from this coordinating routine alone.


<details>
<summary>Technical reference and sources</summary>

`inventory-adjust-sql`: [dbo.INV_AdjustInv](sql/1128703419.sql); source-definition SHA-256 `362ff83361dded24aae929aa0cf58685200b21bb3a7991f880fca97a00e8de93`, reading-copy SHA-256 `b77007a8973b5368936124674524c79420b1816c140e116f148a722f5a6696ce`, one-based inclusive lines [[40, 95], [123, 197], [201, 251]].

</details>

<a id="ship-confirm"></a>

## Understanding status changes at ship confirmation

Ship confirmation updates related shipment, line and container statuses, then recalculates the load summary. A load can still reflect another shipment that is less advanced.

A caller invokes SHP_SetStatusesAtShipConfirm as one part of ship confirmation.

### How it works

1. Read the shipment and active alert definitions; insert qualifying alert requests when the same alert/source/new-status request does not already exist.
2. Read the shipment warehouse, set header leading/trailing status and UTC ship time, and calculate warehouse-local status dates.
3. Shift and recombine detail status/quantity slots according to the supplied limit. The code excludes status1 = 995 from these updates.
4. Set the new status and timestamp on containers belonging to the shipment.
5. Set the load leading status and its trailing status to MIN(trailing_sts) across shipment headers on that load.

### Settings and prerequisites

- Active warehouse-alert definitions and qualifying conditions govern alert-request creation.
- Warehouse timezone controls local status dates. The new status and status limit are supplied by the caller.


### Troubleshooting

- Compare UTC ship time with warehouse-local status dates when displayed dates differ.


### Limits

- An alert request requires later processing; its creation does not confirm notification delivery.
- This status routine does not cover carrier calls, labels, interfaces or caller-level rollback. Its duplicate check alone does not establish exactly-once alert delivery.


<details>
<summary>Technical reference and sources</summary>

`ship-confirm-sql`: [dbo.SHP_SetStatusesAtShipConfirm](sql/1809753850.sql); source-definition SHA-256 `4ac0db0eff207af65ce8c7c515a77955835a1db218c1610551eb4f3c37930196`, reading-copy SHA-256 `2e4550ba3972ac8d7cb010387214f2bdab3e30ddb1fa8d5d9f0c70a61c2f411f`, one-based inclusive lines [[26, 78], [80, 119], [121, 286], [288, 308]].

</details>

<a id="print-documents"></a>

## Understanding document choices and printer defaults

Document choices depend on the selected entity and print process. The user profile supplies printer defaults, while document types determine which forms are eligible.

An application print-selection request calling MetaTrans_GetPrintSelectedDocuments.

### How it works

1. Read the user's default document and label printers.
2. Select the entity by print process. Reviewed examples are load (30), cycle-count plan (20), shipment (70/170) and shipping container (80); other branches exist.
3. Return DOCUMENT_TYPE rows whose PRINT_PROC1..5 match, calculate default selection from DEFAULT1..5 and apply a feature-dependent exclusion.
4. Return entity/printer information and document choices for application binding.

### Settings and prerequisites

- A feature-dependent rule excludes some choices.


### Troubleshooting

- For a missing document, check process eligibility first, then its default-selection flag. A default controls initial selection, not whether the document is available.


### Limits

- This routine prepares document selection; it does not send a job or confirm physical printing. The SDK example lacks the username parameter used by this database routine.


### Related articles

- [Printing packing and closing documents](#packing-label-printing)

<details>
<summary>Technical reference and sources</summary>

`print-selection-sql`: [dbo.MetaTrans_GetPrintSelectedDocuments](sql/901226611.sql); source-definition SHA-256 `3666927fec11eb02d5779ecb9683a8fd53077a15405f6587ff1b74659f4ecc13`, reading-copy SHA-256 `5e4b1a969339ecb9c4eb7ad07570b13ff9cc514233bf15e2bc889f2706dd583f`, one-based inclusive lines [[16, 70], [92, 132], [282, 300]].

`print-selection-sdk`: [Transaction Page Stored Procedures](../SDK/reading/b3abb86eef566392ab2aa6ce2b5f576ef52ba0a341213b3ff03625d30c4a5a7b.md); SDK article `b3abb86eef566392ab2aa6ce2b5f576ef52ba0a341213b3ff03625d30c4a5a7b`, original SHA-256 `08d6d2caff7838953e546693c975e85ced3dd716046be663dd9a300de12931fe`, nodes n61, n89, n138.

</details>

<a id="receiving-trailer-link"></a>

## Understanding an automatic receipt trailer link

A database trigger can link a new receipt to an existing yard record automatically, without a separate trailer-assignment action.

An INSERT into RECEIPT_HEADER fires RECEIPT_HEADER_A_I; the catalog recorded it enabled in the captured snapshot.

### How it works

1. Check whether any inserted row has a non-null trailer ID.
2. Join receipt headers to inserted receipt numbers and yard records using warehouse/trailer ID and yard status 0.
3. Set trailer_yard_status_id, propagate process/user stamps and set the timestamp to UTC now.

### Settings and prerequisites

- The trigger must be enabled. Matching depends on receipt and yard records rather than a general business preference.


### Troubleshooting

- When no link appears, compare the receipt warehouse and trailer ID with a yard record in numeric status 0. A missing match cannot create the link.


### Limits

- The business name for yard status 0 and behavior with multiple matching yard records are not established. This insert trigger does not describe later receipt or yard updates.


### Related articles

- [Yard Management: purpose and processing](#process-yard-management)

<details>
<summary>Technical reference and sources</summary>

`receipt-trigger-sql`: [dbo.RECEIPT_HEADER_A_I](sql/720057651.sql); source-definition SHA-256 `303fc1c5908ab4733761d50c9252f107ab4c8ae7626efcc0bd28f8e09b8df020`, reading-copy SHA-256 `b30f95dbe9d69a2adcf3cdd7fa26dc0a986685c363af5b0236683bf888c28f05`, one-based inclusive lines [[3, 30]].

`trigger-state-catalog`: [DB Architecture/catalog/triggers.json](catalog/triggers.json); SHA-256 `011828376839d7d4189a42452ef2a696fa6e0b46510d3ed54695e8eb850d088a`; objects [720057651].

</details>

<a id="background-and-scheduled-jobs"></a>

## Understanding background and scheduled processing

A background request can wait for the queue service's next poll or for capacity. A schedule makes a job eligible; it does not guarantee that the job has started.

A batch submission or scheduled application job requests background processing.

### How it works

1. A batch submission creates a queue request for background handling.
2. At each poll, the service compares running jobs with the environment's RUN_CONCURRENTLY limit for that job type. Requests remain Ready while capacity is unavailable.
3. A request changes from Ready to In Process and is deleted after completion. Reset Requests changes a failed request back to Ready.
4. For scheduled jobs, Close and Run Now changes Next Run Time for application pickup; the recurring schedule is reset afterward.

### Settings and prerequisites

- Job priority, polling interval and per-type concurrency govern dispatch.
- Batch Submission Config determines which job types can be scheduled.


### Limits

- The queue tables named by AIM are absent from the available database snapshot. Existing scheduling tables are not established aliases for them.
- Application scheduled jobs are not necessarily SQL Server Agent jobs.


### Related articles

- [Technical: purpose and processing](#process-technical)

<details>
<summary>Technical reference and sources</summary>

`process-queue-aim`: [Using the Process Queue](../AIM/reading/a7f6d1beac7f307465dbfb76e05f48fbaa42e8389f635aa78fa14836c814ab11.md); AIM article `a7f6d1beac7f307465dbfb76e05f48fbaa42e8389f635aa78fa14836c814ab11`, original SHA-256 `026fcc97acd153bda0f5e652d7528f5ae06d492af4214ad2d327df22b4e63e36`, nodes n58, n62, n64, n85.

`queue-research-aim`: [Researching Background Job Queue Processes](../AIM/reading/a007abffcb6ac40efcc49cce65fafa13da9232c8f48a7805e3098dbce99608bc.md); AIM article `a007abffcb6ac40efcc49cce65fafa13da9232c8f48a7805e3098dbce99608bc`, original SHA-256 `73d6f7354d892ce894d6d10b24b0c71f837bcf057ebeb9631574589821b944dd`, nodes n58, n68.

`scheduled-job-aim`: [Creating a Scheduled Job](../AIM/reading/89cd7c907a14ac69519371eda239e33c8578f7f1e4049b7feebd15cb21bfc537.md); AIM article `89cd7c907a14ac69519371eda239e33c8578f7f1e4049b7feebd15cb21bfc537`, original SHA-256 `792be2ab2868dfb230935458aa96386a27e5b3f4cfb5cd0db46641016a8dd44b`, nodes n109, n124, n154, n254.

`replica-object-catalog`: [DB Architecture/catalog/objects.json](catalog/objects.json); SHA-256 `c951f937ccd9f4e604cb22c88c029dbfaddcdefda4a9754f19f095cdf07876a7`; objects [11863109, 1305771709].

</details>

<a id="process-allocation"></a>

## Allocation: purpose and processing

Allocation chooses which storage locations will supply a request for product. Work creation then turns the allocated quantity into warehouse tasks.

The allocation step runs in a wave before work creation.

### How it works

1. Apply allocation-rule sequences in numeric order; each sequence combines eligible locations with a selection strategy.
2. Reserve selected inventory when pick confirmation is used. The documented alternative removes inventory when the load is confirmed.

### Settings and prerequisites

- Item and location characteristics affect candidate eligibility and order.


### Limits

- When rules cannot fill a request, later sequences and the status-action policy determine partial allocation, rejection or return to the pool.


### Related articles

- [Work: purpose and processing](#process-work)
- [Keeping container contents together or separate](#packing-classes-and-criteria)

<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Shipment priority ordering precedes rule selection: shipment line, then item, then *Default. Convert quantities using the item or applicable item-class UOM record, then process numbered rule sequences. Source: `process-claim-process-documentary-allocation-r01`.
- Allocation combines immutable eligibility checks with optional location filters and strategy ordering. Available quantity subtracts allocated and suspense quantities; allowing in-transit allocation adds in-transit quantity. A blank location UOM list permits all UOMs. Source: `process-claim-process-documentary-allocation-r02`.
- Partial allocation creates requests for fulfilled quantities and tries later sequences. Exhausted rules invoke shipment-splitting and rejection/pool behavior governed by status actions; allocate-complete can reject an entire shipment. The figure labels exhaustion status 999, while prose gives richer status-action branches. Source: `process-claim-process-documentary-allocation-r03`.
- Closest Match orders location-inventory records, not summed physical-location totals. Over-allocation from permanent assignments is restricted to shipment allocation, non-LP locations and non-lot items. Thread count is controlled by Technical Values. Source: `process-claim-process-documentary-allocation-r04`.

`family-allocation-aim`: [Allocation Process Summary: Functionality](../AIM/reading/a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3.md); AIM article `a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3`, original SHA-256 `4bb0846eaeda14b5bf3a42ee4d3887811eb92d8143191fcdfba8c732c51c2043`, nodes n67, n69, n71, n73, n75.

`process-claim-process-documentary-allocation-r01`: [process-documentary-allocation-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `ddce678160d1a3e22927381b053831b377477a33e443243712846ee10137e534`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-allocation-r02`: [process-documentary-allocation-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `ebb402da0a02a0d83ffaf8def156f6b5e1403b1ab318648a9d0c89190c338182`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-allocation-r03`: [process-documentary-allocation-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `107d777a62be3f49c1234b2a305d099176c8f553a9de9f372cb35374b6ac3754`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-allocation-r04`: [process-documentary-allocation-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `1c08d812c6ee7c298b9a5ec6c071d2db08494629a83964f7d85842e4fc6ec3df`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-billing-management-integration"></a>

## Billing Management Integration: purpose and processing

The documented integration sends SCALE data to a separate Billing Management application so warehouse work can support third-party charges.

A configured integration uploads SCALE data to Billing Management.

### How it works

1. Upload relevant system data to the separate billing application.
2. The billing application calculates, tracks and charges for warehouse work.

### Settings and prerequisites

- Integration trigger headers/details, the target XML schema and output directory define the exchange.


### Limits

- An inline billing trigger needs a corresponding coded event check; adding a trigger record alone does not create a new event.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- A configured event such as load confirmation triggers processing; manual triggers are also possible. The vendor source describes Billing Management as a separate product and requires SQL Server for this integration. Source: `process-claim-process-documentary-billing-management-integration-r01`.
- The active trigger header identifies a root detail with no parent; its data query is mapped into XML, then child details are traversed. Process history records trigger success/failure and output goes to the configured directory for later pickup. Source: `process-claim-process-documentary-billing-management-integration-r02`.
- Inline trigger records need a corresponding coded event check; defining a record alone does not create a new trigger point. Manual triggers still require appropriate SQL and the target XML schema. Source: `process-claim-process-documentary-billing-management-integration-r03`.

`family-billing-management-integration-aim`: [Billing Management Integration Process Summary: Functionality](../AIM/reading/07dfda3003b2e06f5c5ab468f983c79caca43080bedaf1f3d7554f6321715a41.md); AIM article `07dfda3003b2e06f5c5ab468f983c79caca43080bedaf1f3d7554f6321715a41`, original SHA-256 `de2b53f4e532ff96b20d7797a0d17b4447c55e256519ecab5bf5e786b51d2d92`, nodes n65.

`process-claim-process-documentary-billing-management-integration-r01`: [process-documentary-billing-management-integration-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `36cd26ada91a9778ae47445021417cf98425ae22a440e037c8eed7da11458cbf`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-billing-management-integration-r02`: [process-documentary-billing-management-integration-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `81b7a33564867225e78df82a53ee71ca596ea25505cc329a01763d91178c0d21`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-billing-management-integration-r03`: [process-documentary-billing-management-integration-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `5004dd27baf1dc2a7474f7fa954d457dda2b386c52dd71726632a128de20e601`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-carrier-management"></a>

## Carrier Management: purpose and processing

Carrier management controls carrier selection and shipping rules. Routing guides, shipping calendars and estimated container counts can affect the available shipping choices.

Carrier assignment or rating during outbound processing.

### How it works

1. Use routing guides to identify a carrier or group for a customer/company and weight or container range.
2. Apply carrier no-ship calendars; wave container estimates can be used for rating.

### Settings and prerequisites

- Carrier records may inherit shared setup; additional shipping services have separate settings.


### Limits

- With Use Rating in Selection disabled, selection can favor delivery days rather than the cheapest rate. Closed manifests prevent further container changes.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Routing runs from a wave for all included shipments or from Shipment Insight for a selected unassigned shipment. Interactive rate shopping is separate and excludes in-process waves and ship-confirmed shipments. Source: `process-claim-process-documentary-carrier-management-r01`.
- Eligible routing guides are ordered by customer/ship-to and routing code, then lowest priority number for ties. A guide chooses a carrier or a carrier group; commitment and date/postal support filter group members before rating engines return rates. Source: `process-claim-process-documentary-carrier-management-r02`.
- Parcel manifesting can follow packing/closing or a manual request. Manifest state distinguishes blank, Error, Manifested and Closed; remanifesting is permitted until closure, after which containers cannot be changed or removed. Source: `process-claim-process-documentary-carrier-management-r03`.
- The diagram includes Use Rating in Selection: its No branch chooses best delivery days. This qualifier should accompany simplified cheapest-carrier explanations. Progistics/FedEx architecture details are retained vendor-era descriptions, not evidence of current deployed services. Source: `process-claim-process-documentary-carrier-management-r04`.

`family-carrier-management-aim`: [Carrier Management Process Summary: Functionality](../AIM/reading/0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4.md); AIM article `0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4`, original SHA-256 `6cae75f2a3d61f172808f8acc5a96ad0bc3875fc54c44c6a26bfe7d8b8ae2bd2`, nodes n65, n67, n69, n71, n73, n75.

`process-claim-process-documentary-carrier-management-r01`: [process-documentary-carrier-management-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `70fda6edae0d024737758a00f871a6f28df712be4d1ab3fdc430e3a1e7302cf0`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-carrier-management-r02`: [process-documentary-carrier-management-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `a910e686a31c1addb92cc2965c3357a94906e7b0fede8668938ce3c2329b56c0`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-carrier-management-r03`: [process-documentary-carrier-management-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `aee9ca87dc622715344ca1266205a4bc56545c83439a29f4b9708cab5235cd05`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-carrier-management-r04`: [process-documentary-carrier-management-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `2220e7e3c91578f1089498e3606bcef06b9189e91e4e7c3ea96da7385b0e1d99`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-container-creation-in-the-wave"></a>

## Container Creation in the Wave: purpose and processing

A wave can create shipping containers for allocated line quantities. A container strategy determines how those quantities are combined or split.

The container-creation wave step executes.

### How it works

1. Use the allocated shipment-line quantities as the input to container creation.
2. Apply the configured strategy to determine the containers and distribute quantities.

### Settings and prerequisites

- Choose Consolidate And Do Not Split, Split And Do Not Consolidate, Consolidate And Split Only Once, or 3D Cubing. Packing classes and criteria determine eligible types and compatible contents.


### Limits

- Wave containers created from allocation requests cannot later be linked to RF pick/putaway work through the existing-container path described in AIM.


### Related articles

- [Keeping container contents together or separate](#packing-classes-and-criteria)

<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Container creation is a wave step after allocation, with four named strategies: Consolidate And Do Not Split, Split And Do Not Consolidate, Consolidate And Split Only Once, and 3D Cubing. Source: `process-claim-process-documentary-container-creation-in-the-wave-r01`.
- Create full-UOM containers first unless Treat as Loose applies; then sort loose quantities by packing class and criteria ordering. Packing class comes from the shipment line or *Default, and determines the container group. Source: `process-claim-process-documentary-container-creation-in-the-wave-r02`.
- Usable container volume includes fill percent. Stabilization adds padding on both sides of each dimension. 3D cubing tries Same Pack, Default Pack, Two-Item Pack and Three-Item Pack in order, stopping at success; fixed orientation or nonstackability can invoke 2D packing. Source: `process-claim-process-documentary-container-creation-in-the-wave-r03`.
- An invalid default stabilization code falls back to zero and logs process history. The source expressly does not support creating wave containers from allocation requests and later RF picking/putaway into those existing shipping containers because the work cannot be linked. Source: `process-claim-process-documentary-container-creation-in-the-wave-r04`.

`family-container-creation-in-the-wave-aim`: [Container Creation in the Wave Process Summary: Functionality](../AIM/reading/ac1a4d877d9ffe1b990794887848f749622dd7c2cd0a9ad41e79766deab74780.md); AIM article `ac1a4d877d9ffe1b990794887848f749622dd7c2cd0a9ad41e79766deab74780`, original SHA-256 `bf4db6f7da1b69fb0d340568d3638f92ca64c2a646be9f5f2f756715e2983c15`, nodes n65.

`process-claim-process-documentary-container-creation-in-the-wave-r01`: [process-documentary-container-creation-in-the-wave-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `8b7942b091861481aa28d9a581a3ae43433d16ea25599db2eebe7a4482f0f03a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-container-creation-in-the-wave-r02`: [process-documentary-container-creation-in-the-wave-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `4f42cbf634545f0c1ca858e2075e5e958c9d3b0f1b9176ae0c7506de23a82e14`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-container-creation-in-the-wave-r03`: [process-documentary-container-creation-in-the-wave-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `0a51181428e511d73902bf8801d7e93e32ac252a2f6cfa32217b2f1a7d665789`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-container-creation-in-the-wave-r04`: [process-documentary-container-creation-in-the-wave-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `e1a1687fea5b177c8705e82f310cfc65eafe36ffdabbbb1d01b21d630c59bbce`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-cycle-counting"></a>

## Cycle Counting: purpose and processing

Cycle counting compares a physical location count with SCALE inventory and resolves any discrepancy.

A user creates a count plan, or the system creates activity-driven count instructions.

### How it works

1. Select work through a plan-based or activity-driven count request.
2. Physically verify whether the location inventory matches the recorded inventory.

### Settings and prerequisites

- Create Work determines RF/work execution versus paperwork. Immediate Reconcile of Bad Count and Min/Max tolerances control automatic adjustment or Pending Review.


### Limits

- A plan remains incomplete while count requests or pending reconciliations remain open.


### Related articles

- [Configuring a work profile and its sequence rules](#work-profile-configuration)

<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Counts originate from reusable master plans, one-time quick plans, or location activity. Plans may be scheduled; activity counts are immediate only when preferences and work execution allow it. Source: `process-claim-process-documentary-cycle-counting-r01`.
- Requests identify location/item/company/lot/LP, not a frozen quantity. In-transit-only inventory is treated as absent for request creation. Duplicate pending requests suppress new requests at the location; inactive locations are excluded while frozen locations can be counted. Source: `process-claim-process-documentary-cycle-counting-r02`.
- Create-work choices determine RF/work execution versus paperwork. Immediate Reconcile of Bad Count and tolerance Min/Max govern automatic adjustment or Pending Review. Plan execution is complete only after open requests and pending reconciliations are resolved. Source: `process-claim-process-documentary-cycle-counting-r03`.
- Standard counts do not prompt for catch weight; within-tolerance adjustment uses average weight, while blind count prompts and distinguishes new versus existing inventory. The LP diagram adds recount, added-LP review and uncounted-LP checks. LP diagram quantity-timing wording differs from general prose, so exact On Hand/Suspense timing needs reconciliation. Source: `process-claim-process-documentary-cycle-counting-r04`.
- The plan-based diagram labels both final more-counts branches No, although one ends execution and the other displays the next count. The activity-driven diagram supplies the expected Yes/No split; the plan-based label ambiguity is not silently corrected. Source: `process-claim-process-documentary-cycle-counting-r05`.

`family-cycle-counting-aim`: [Cycle Counting Process Summary: Functionality](../AIM/reading/548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3.md); AIM article `548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3`, original SHA-256 `62b53306bb40dde023f7fe8b495cff98a3604c93e7613707f4547202de3ae47c`, nodes n66.

`process-claim-process-documentary-cycle-counting-r01`: [process-documentary-cycle-counting-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `c137a822746bbb7a5ad25e5767a46b056d2c673d39dae58fc24c46d79d744ef8`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-cycle-counting-r02`: [process-documentary-cycle-counting-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `e57683a9fd62eab93c65b58cceca344d4eef0e9bde0bd3a4aaa1b53ea4c1a900`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-cycle-counting-r03`: [process-documentary-cycle-counting-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `573afbe8a3de74e3eeda5a2c7a644bcca0c56c03f9de709977da493d954f14a6`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-cycle-counting-r04`: [process-documentary-cycle-counting-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `e8f7cb0209b9554dd1da200ba55d6284794aeb856818afdaa8d7fb35e48420c7`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-cycle-counting-r05`: [process-documentary-cycle-counting-r05](mappings/process-documentary-review.json); reviewed-record SHA-256 `14f34a47105c336a3723b94b3199305384b054fe1e2483c5c4a8727c1ef64c26`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-device-integration-framework"></a>

## Device Integration Framework: purpose and processing

The Device Integration Framework exchanges messages between SCALE and warehouse automation such as conveyors and pick-to-light systems.

Equipment exchanges messages, or files arrive for a configured transfer process.

### How it works

1. The configured file transfer reads supported files from designated folders into incoming-message handling.
2. Configured post-processing can change an extension, move the file and insert an incoming-message record for subsequent processing.

### Settings and prerequisites

- From directory, file extension, polling interval and Insert Message control incoming file handling; outgoing messages have separate retry settings.


### Limits

- A file receipt or message acknowledgment confirms a communication stage, not completion of the warehouse action.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Incoming TCP messages pass through the communication service into DIF_INCOMING_MESSAGE, then the processing service dispatches the configured custom API or IDiFAPI event execution path. A heartbeat is acknowledged without the ordinary table-write path. Source: `process-claim-process-documentary-device-integration-framework-r01`.
- File transfer is incoming-only. From directory/extension, polling sleep, rename/move and Insert Message determine whether a file becomes an incoming-message record. A separate Web API path is described for MHE submissions. Source: `process-claim-process-documentary-device-integration-framework-r02`.
- Incoming persistence success/failure determines ACK/NAK when enabled. Outgoing messages are read from DIF_OUTGOING_MESSAGE and retried a configured number of times; missing configured heartbeat ACK shuts the endpoint down and writes history. Insight screens support manual error reset. Source: `process-claim-process-documentary-device-integration-framework-r03`.

`family-device-integration-framework-aim`: [Device Integration Framework Process Summary: Functionality](../AIM/reading/6678efaf48f28c0a44b2e1460d2ab6c18050a333a56de1c53ba503cb274c6b60.md); AIM article `6678efaf48f28c0a44b2e1460d2ab6c18050a333a56de1c53ba503cb274c6b60`, original SHA-256 `74bb52247a8d357f0ae9e8639f45f24337864b942d0f0c28254ea313a5f68966`, nodes n65, n67, n69.

`process-claim-process-documentary-device-integration-framework-r01`: [process-documentary-device-integration-framework-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `3c2e7f4ed9f08579af059c54ceb9fae0f7a56ee61b16bd521984a86ef2f50563`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-device-integration-framework-r02`: [process-documentary-device-integration-framework-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `3bbf194aa7201a81d91ff81a85c5ddf6827da6ca1b4b0077882511ad2c79fe18`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-device-integration-framework-r03`: [process-documentary-device-integration-framework-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `0eb40c034253153003061f9321625fed09d08421932fc961a54634a34e0d820e`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-dock-management"></a>

## Dock Management: purpose and processing

Dock management tracks containers through packing-area consolidation, staging and truck loading. These stages use distinct inventory-tracked locations and can be enabled separately.

Shipment containers reach the outbound dock area.

### How it works

1. Consolidate items or containers at a packing-area location when that process is enabled.
2. Use staging locations and dock-door locations for enabled staging and loading stages.

### Settings and prerequisites

- Consolidation, staging and loading are enabled independently. Create Next Move controls subsequent work creation.


### Limits

- Immediate RF dock transfer requires no open or in-process container work and the relevant next-move option disabled.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Dock handling separates consolidation near packing, staging after container close, and loading into dock-door locations. Each area may have positions. The assignment strategy orders areas with positions, areas without positions, then positions; a closed position falls back to its parent area. Source: `process-claim-process-documentary-dock-management-r01`.
- Create Next Move controls work creation at close-container/RF-putaway decisions for packing/staging subclasses. Immediate RF transfers require no open/in-process container work and the relevant next-move setting disabled. Source: `process-claim-process-documentary-dock-management-r02`.
- The assignment diagram distinguishes missing flow header from missing detail: allocation can fail back to pool with process history when no header exists, while default-location fallbacks handle other branches. During dock assignment a missing header retains the prior allocation location. These figure-specific outcomes must not be merged into a single universal fallback. Source: `process-claim-process-documentary-dock-management-r03`.
- Dock-door assignment excludes doors assigned to open loads. The composite figure distinguishes actual assignment/reassignment, which adjusts inventory and creates work, from preassignment, which marks a future location. RF Immediate Dock Transfer is explicitly a no-next-work path. Source: `process-claim-process-documentary-dock-management-r04`.

`family-dock-management-aim`: [Dock Management Process Summary: Functionality](../AIM/reading/9857f2ac70834cdabe3e8245f2ee06c0451ed99523ada65852b8863953ad7b1c.md); AIM article `9857f2ac70834cdabe3e8245f2ee06c0451ed99523ada65852b8863953ad7b1c`, original SHA-256 `d3c20015a2fe617a03fced72f7bc976f250507efe52b67d6febe460194ff44c3`, nodes n65.

`process-claim-process-documentary-dock-management-r01`: [process-documentary-dock-management-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `5f4046493c4e8e371c0761488b689aab10e6d0fae7a9b7434a49737c6b1f4ed1`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-dock-management-r02`: [process-documentary-dock-management-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `55a43fc874a276d0095f5bb458183ba40c1d29fc817333bcea6b1f0cc40c1c06`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-dock-management-r03`: [process-documentary-dock-management-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `ae7286a3130887f844ff46b1cb4c77f91435cc1c84c79d472032edd020258590`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-dock-management-r04`: [process-documentary-dock-management-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `73f4ffb24e907d147c3547d7878bcbb98e9d6ccda5f54190a2c8dba494a3da7c`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-gs1-barcode"></a>

## GS1 Barcode: purpose and processing

A GS1 barcode carries several data elements, such as item, quantity and lot, in one label.

A barcode is interpreted during a supported process; label creation can occur in a wave or when closing a container.

### How it works

1. Interpret barcode segments using the applicable application-identifier template.
2. The documented wave and close-container processes can generate GS1 labels from configured templates.

### Settings and prerequisites

- The receiving preference selects an application-identifier template with scan count, segment order and manual-verification options.


### Limits

- The inbound parsing template does not define the physical layout of an outbound label.


### Related articles

- [Configuring over-receiving and receipt execution](#receiving-overage-configuration)

<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Inbound RF receiving scans labels containing multiple application identifiers, rather than a single item identifier; outbound GS1 labels can print from the wave or close-container process. Source: `process-claim-process-documentary-gs1-barcode-r01`.
- A receiving-preference AI template specifies scan count, segment order and manual verification. It controls inbound parsing, not the physical layout of an outbound label; generic outbound labels are customization starting points. Source: `process-claim-process-documentary-gs1-barcode-r02`.

`family-gs1-barcode-aim`: [GS1 Barcode Process Summary: Functionality](../AIM/reading/5f876e2632897c1569720f398a7ed5a564bc2d5792bad79a2a06d674e41e6069.md); AIM article `5f876e2632897c1569720f398a7ed5a564bc2d5792bad79a2a06d674e41e6069`, original SHA-256 `56aefab9a84d3879c034c2d09a2f71c62781a1cbd314d2c38c6254e205c88c6c`, nodes n64, n66, n68.

`process-claim-process-documentary-gs1-barcode-r01`: [process-documentary-gs1-barcode-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `ea6f34c0c30c9a3c4a94a2ff93c6a0009c703139e2c4b33bc3caa5b587e82674`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-gs1-barcode-r02`: [process-documentary-gs1-barcode-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `ff3c16fe4385b5e880674e0a813bcc37ce643d9e75fd7538af025300d0e113c3`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-general-system-concepts"></a>

## General System Concepts: purpose and processing

Warehouse, company and user setup establish the context and access rules for SCALE activity.

An authorized user opens a function in a configured warehouse.

### How it works

1. Associate transactions with a warehouse; the vendor summary requires at least one warehouse.
2. The captured window-security description checks user-level records when present and otherwise references system-level records.

### Settings and prerequisites

- Company setup supports multi-company processing. User profiles contain preferences and company authorizations.


### Limits

- Access depends on the applicable user and system security records; the documented default does not identify an employee's current permissions.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Every transaction is associated with a warehouse and at least one warehouse is required. Multi-company distribution is optional; source instructions distinguish defining two or more companies from leaving company setup unused. Source: `process-claim-process-documentary-general-system-concepts-r01`.
- A user profile supplies preferences and access authorization. On window access the documented precedence checks user-level security records first and otherwise system-level security. Relaxed and highly restrictive approaches are configuration choices. Source: `process-claim-process-documentary-general-system-concepts-r02`.
- The article describes a permissive default security posture, but that statement is vendor documentation, not evidence of this deployment's current permissions. Access behavior and effective overrides require separate application configuration evidence. Source: `process-claim-process-documentary-general-system-concepts-r03`.

`family-general-system-concepts-aim`: [General System Concepts Process Summary: Functionality](../AIM/reading/85149c7693291207b2c43b2565198094a6af1ad3eaa3cb03fe2dfa28c7a351d1.md); AIM article `85149c7693291207b2c43b2565198094a6af1ad3eaa3cb03fe2dfa28c7a351d1`, original SHA-256 `2abb64aa793ebb9b72cbcfc007af8c24f6508deebb57bcf432a46085bd48bfaf`, nodes n76, n81, n86, n91, n93, n95, n97, n100.

`process-claim-process-documentary-general-system-concepts-r01`: [process-documentary-general-system-concepts-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `d2ded1209478ca37f1d11a5d2c2215f205f46a2d6b4ef2c289ffeeed9c677ca4`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-general-system-concepts-r02`: [process-documentary-general-system-concepts-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `d99a40b51dc67c2c17c362476b028fc101729478c35b34ba09506074eda18ae8`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-general-system-concepts-r03`: [process-documentary-general-system-concepts-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `a3d44b860b5163ed3b56f0a044b842342b7358e2edcc030cf6cc904d4fe723f6`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-immediate-needs"></a>

## Immediate Needs: purpose and processing

Immediate needs record product that cannot yet fulfill a shipment, work order, replenishment or short pick. Newly received stock can then be allocated to fill that shortage.

A supported request cannot be completely fulfilled.

### How it works

1. Log an immediate-needs request for the unmet quantity.
2. Use newly received quantity to fulfill the need; requests for the same item are considered using their priorities.
3. The documented viewer removes the request after fulfillment closes it.

### Settings and prerequisites

- Shortage triggers must be active and the item eligible. Each trigger supplies a request priority that can be changed for an individual request.


### Limits

- Locate By Parent does not fulfill immediate needs, and work-order build locations are not eligible allocation destinations for these requests.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Configured shortage triggers can log needs from shipment allocation, short picks, replenishment allocation and work-order component allocation. Trigger activation and item eligibility are required; Add BOM Component Lines components/finished items are excluded. Source: `process-claim-process-documentary-immediate-needs-r01`.
- Receipt locating checks validity, removes stale requests, and uses new inventory to fulfill needs. A whole LP for one need may cross-dock; put-to-store needs can split child containers; residual quantity uses normal locating. Source: `process-claim-process-documentary-immediate-needs-r02`.
- Immediate-needs locating rule precedence is shipment line, system default, then original LP location/rule; after assignment another rule is not attempted. Putaway-group membership independently determines group fulfillment and residual putaway. Source: `process-claim-process-documentary-immediate-needs-r03`.
- Locate By Parent does not fulfill immediate needs. Work-order build locations are prohibited for immediate-needs allocation. Request priority orders competing needs for the same item, and fulfilled requests close/disappear from the viewer. Source: `process-claim-process-documentary-immediate-needs-r04`.

`family-immediate-needs-aim`: [Immediate Needs Process Summary: Functionality](../AIM/reading/5dc3ad182d2fa6eed29085709e0c784b0b831ddb4bf10e21616b711279fd1c2d.md); AIM article `5dc3ad182d2fa6eed29085709e0c784b0b831ddb4bf10e21616b711279fd1c2d`, original SHA-256 `f909c9c7b964714a286e52d66ffbc21159ed3371740322e650197b40dd19d0e3`, nodes n65, n67, n69.

`process-claim-process-documentary-immediate-needs-r01`: [process-documentary-immediate-needs-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `e1156de07c7b606c8b57997b718ec6f500526da0b7c1b32b3f2ebf381bdb434b`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-immediate-needs-r02`: [process-documentary-immediate-needs-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `ddd66b377d455d8ed72ee9cabec07f8e0bc3c2276754a3900765d41333e70695`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-immediate-needs-r03`: [process-documentary-immediate-needs-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `b62d108f138c8977016d1c2d46886afbe5eef75f87015c0808627d221f46ff4a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-immediate-needs-r04`: [process-documentary-immediate-needs-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `a95c2a2f42336fcd7b3e7c783687e375b3aa0a9f2e249b4ebb82bf763f8e48f9`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-interface"></a>

## Interface: purpose and processing

Interfaces exchange records between SCALE and an order system.

A manual or scheduled upload/download starts.

### How it works

1. Process appropriate files or records from earliest to latest last-modified time.
2. Record detailed errors for failures; when processing several files, continue with other files after a file-data error.

### Settings and prerequisites

- Process definitions set data type, transaction cap and file extension. Upload criteria select records; the process-detail output directory takes precedence over the interface system value.


### Limits

- File-level continuation after an error does not define record-level rollback, retry or duplicate-handling behavior.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Users or scheduled jobs initiate uploads/downloads. File processing orders files by modification time, while records within a file retain file order. ERP is a documentary placeholder for the sending/receiving system. Source: `process-claim-process-documentary-interface-r01`.
- Delimited/fixed-length/direct input is prepared as legacy XML; XML input is already in the required format. Before/after custom steps surround business processing. Direct mode uses transfer tables before valid records reach production tables. Source: `process-claim-process-documentary-interface-r02`.
- Process records control data type, transaction cap and file extension. Upload criteria restrict eligible records; output directory precedence is process detail then interface system value. Record IDs must be unique across headers and details. Source: `process-claim-process-documentary-interface-r03`.
- Download creates success/process and error XML files plus history/alerts. Failure in one file does not prevent other files from processing. This does not establish per-record transaction atomicity, retry idempotence or the deployed custom ERP parser. Source: `process-claim-process-documentary-interface-r04`.

`family-interface-aim`: [Interface Process Summary: Functionality](../AIM/reading/178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e.md); AIM article `178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e`, original SHA-256 `16a5da0368ba8d3c53860134e3270982414a29c92ad4c62f1c13da24e4067a7c`, nodes n66, n68.

`process-claim-process-documentary-interface-r01`: [process-documentary-interface-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `e0975b391f83b50273ba9b4f009baae4fe94b5e0c12885abe7189d8fb1b5d277`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-interface-r02`: [process-documentary-interface-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `d7071a22b74c2b69cabbf1c0c38424f577dcec3323ec191b93a7010a482b08d3`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-interface-r03`: [process-documentary-interface-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `6d87f04a77da9bfe4c5bcaeaf8057402b3356565752a01952c3d362bfaa10a3a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-interface-r04`: [process-documentary-interface-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `10217ad015d0dc270614d7951ef3d6560f9dde80fcf4598abba8b53249e69d39`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-inventory-management"></a>

## Inventory Management: purpose and processing

Inventory management corrects stock through adjustments, transfers and status changes outside ordinary picking or putaway. License-plate transactions can handle mixed product together.

An authorized user completes an inventory adjustment or transfer.

### How it works

1. Process the selected adjustment type according to its adjustment class.
2. Apply the documented inventory change when the transaction completes; license-plate tracking can extend the context.

### Settings and prerequisites

- Adjustment type controls quantity limits and frozen-location permissions; its class determines the available transaction fields.


### Limits

- Lot Insight restricts adjustments, transfers and status changes when inventory attributes are linked. Work creation for adjustments is not supported by the RF adjustment flow.


### Related articles

- [Receiving returns or damaged stock](#returns-damage-status)

<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Desktop/Insight or RF adjustment requests correct stock outside ordinary pick/putaway. RF presents only user/warehouse-authorized adjustment types, and fields vary by adjustment class. Source: `process-claim-process-documentary-inventory-management-r01`.
- RF quantity adjustments/transfers validate inventory tracking, configured item/location checks, existing contents and multi-item eligibility. Status changes verify that the item exists at the nominated location. Validation failure returns the user for another value. Source: `process-claim-process-documentary-inventory-management-r02`.
- Some desktop adjustment/transfer types create work: stock becomes in transit at the destination and transfers reserve the source. This work-creation option is not supported during RF inventory adjustments. Quantity bounds and frozen-location permissions belong to adjustment types. Source: `process-claim-process-documentary-inventory-management-r03`.
- Full-quantity negative adjustments/transfers do not prompt for catch weight; partial quantities can default from average weight, and work-based actions capture weight during execution. Lot Insight restrictions apply when inventory attributes are linked; lot status/expiry edits propagate across matching item/company/lot inventory. Source: `process-claim-process-documentary-inventory-management-r04`.

`family-inventory-management-aim`: [Inventory Management Process Summary: Functionality](../AIM/reading/9c9b2f34d8c2aeee8291236b7db3a8d7712db3a3188eda0681cc00157c1ccdfe.md); AIM article `9c9b2f34d8c2aeee8291236b7db3a8d7712db3a3188eda0681cc00157c1ccdfe`, original SHA-256 `9fe93dc5c192f74ebe3d424157aa85d024f7079485cbc7e9c9c475c794e7eee6`, nodes n66, n68, n70, n74, n75, n76.

`process-claim-process-documentary-inventory-management-r01`: [process-documentary-inventory-management-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `d024ea71daa06ff1cef46bca55a21c00d432ef105c78989fc5bdc36e130229ac`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-inventory-management-r02`: [process-documentary-inventory-management-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `910038728fabb6da1f066626e7e59de32b2e55906c446d63f4d2eb1f31093a22`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-inventory-management-r03`: [process-documentary-inventory-management-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `8f27f409f96c6b4ea4b2392b02f1e7ce680e387e584f3c4bd7f65eb5d479977a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-inventory-management-r04`: [process-documentary-inventory-management-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `889b7af5b1471ec7a73d40beba2a11f61f3cf79c8c61ca74793e604782cc6d4f`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-inventory-tracking"></a>

## Inventory Tracking: purpose and processing

Inventory tracking records a product's location, quantity state and identifiers throughout its warehouse journey.

Product enters, moves through or leaves the warehouse.

### How it works

1. Track product location and state through its warehouse journey.
2. Use quantity categories and applicable lot, serial, weight and attribute identification.

### Settings and prerequisites

- Quantity categories distinguish On Hand, In Transit, Allocated and Suspense. Lot, serial, catch-weight and attribute controls provide additional identification.
- Lot and serial templates define identifier structures. Inventory attributes add named fields for receiving, allocation and interfaces.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Inventory buckets distinguish physical On Hand, incoming In Transit, reserved Allocated and count-related Suspense. The basic Available calculation is On Hand minus Allocated minus Suspense; this introductory formula should not erase the allocation article's configured in-transit variant. Source: `process-claim-process-documentary-inventory-tracking-r01`.
- Lot and serial templates define identifier structures; master/minor serials have different display roles. Inventory attributes are twenty named fields usable across receiving, allocation and ERP interfaces for LP and non-LP stock. Source: `process-claim-process-documentary-inventory-tracking-r02`.
- Movement-class analysis uses scheduled historical-demand data to support placement decisions. It describes a planning capability, not observed throughput, active schedules or an automatically proven best location. Source: `process-claim-process-documentary-inventory-tracking-r03`.

`family-inventory-tracking-aim`: [Inventory Tracking Process Summary: Functionality](../AIM/reading/de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c.md); AIM article `de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c`, original SHA-256 `b87db78c2d841a850fc229481eabccd5eea820d3fee31495a2578a92707c5a88`, nodes n64.

`process-claim-process-documentary-inventory-tracking-r01`: [process-documentary-inventory-tracking-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `4e8cfe44fc3465c74ff62b3c84426f4cd7f6612a36798954186f0a5fe8f8b880`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-inventory-tracking-r02`: [process-documentary-inventory-tracking-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `c3ff6f74c692854bf6e91ac3df58949e64921f7d62e2d9696fcfb642dc56e12e`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-inventory-tracking-r03`: [process-documentary-inventory-tracking-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `e937cf69dd2a5b131a50d92b9f29c60fce4a38bd399bcac67b5a0ba810e1357f`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-item"></a>

## Item: purpose and processing

Item setup defines product characteristics and the rules used to handle that product.

An item is configured or supplied through interface/shipment-line data.

### How it works

1. Use item characteristics and handling controls when processing the product.
2. In the documented optional-item-master path, reference values supplied on shipment lines.

### Settings and prerequisites

- Allocation and locating rules, unit-of-measure breakdown, dimensions and tracking options govern product handling. Company context matters when several companies use SCALE.


### Limits

- The optional item-master path depends on process-specific validation requirements.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Item records can be interfaced or maintained in SCALE. The source permits optional item-master setup and fallback to shipment-line values; that general statement must be reconciled with process-specific validation flags before use. Source: `process-claim-process-documentary-item-r01`.
- Item templates control ID structure; item UOM breakdown and dimensions support capacity calculations. Alternate items replace unavailable/obsolete items, while substitutes address out-of-stock items. Item cross-references allow UPC/EAN-14 identification during processing. Source: `process-claim-process-documentary-item-r02`.

`family-item-aim`: [Item Process Summary: Functionality](../AIM/reading/d805afb741af2fe0359ea6a96de0677c5ef0bb1532f7454099e15ce9f148c9b0.md); AIM article `d805afb741af2fe0359ea6a96de0677c5ef0bb1532f7454099e15ce9f148c9b0`, original SHA-256 `ac7b4d20dd4c56102e0606305932bbc6c3688cab1a4fdf0f3a6a141f6c0505a7`, nodes n64.

`process-claim-process-documentary-item-r01`: [process-documentary-item-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `603c50ae8cef5a283b9839ff448c8328f280fe1fe47dc569e9370f23e8e5d7cf`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-item-r02`: [process-documentary-item-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `49c24ceca2bf364f9991d78870f70cede39f9afe49029a5378e899f57912d452`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-ltl-rating"></a>

## LTL Rating: purpose and processing

Less-than-truckload rating calculates freight charges from the shipment route, weight and freight class.

An LTL shipment is rated.

### How it works

1. Determine a rate base using warehouse origin, shipment destination and any additional configured criteria.
2. Rate each freight class and weight, total mixed classes and check carrier minimums.
3. Apply the documented deficit-weight comparison against the next weight break.

### Settings and prerequisites

- Rate bases contain class/weight breaks. FAK can rate different actual freight classes at one agreed class.


### Limits

- The AIM worked example has a conflicting rate-table value; use the configured rate base to calculate charges.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Select a valid rate base by effective criteria, origin/destination and shipment characteristics. Rate each LTL class using shipment weight breaks, total charges, apply minimums and compare deficit-weight alternatives; mixed-class deficit uses the lowest class. Source: `process-claim-process-documentary-ltl-rating-r01`.
- FAK can rate different actual classes at an agreed class. Scenario minimum-charge precedence is detail before header. Rates and postal codes in examples are illustrative and not current carrier prices. Source: `process-claim-process-documentary-ltl-rating-r02`.
- The scenario calls 42.50 the rate for a 600-pound shipment, while the preceding table places 42.50 under <500 and 41.80 under <1000. Retain this source inconsistency; do not promote its numeric example into an executable rating oracle. Source: `process-claim-process-documentary-ltl-rating-r03`.

`family-ltl-rating-aim`: [LTL Rating Process Summary: Functionality](../AIM/reading/66f522d9ea61a79265d4f554eefaa3cf9eb580ca5083eb1e4a3282e7a7c55376.md); AIM article `66f522d9ea61a79265d4f554eefaa3cf9eb580ca5083eb1e4a3282e7a7c55376`, original SHA-256 `ecf370ae2e20127447eeb2276766ecffcb7d9e7f73ecd56a1097f70a134337d2`, nodes n67, n69, n71, n73, n75, n77.

`process-claim-process-documentary-ltl-rating-r01`: [process-documentary-ltl-rating-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `7d827ad83f30fd3595626296283fd2d51702adff89b28dff4a4c3982bf431b2d`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-ltl-rating-r02`: [process-documentary-ltl-rating-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `fb4748785ea9dd57037ba6b365cdad024f25b7c64d6e45720d8b59ceb9604b47`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-ltl-rating-r03`: [process-documentary-ltl-rating-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `0d20c67808427800d64976a6f71034f327e5247813af77997584bed49aa3ef44`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-labor-management"></a>

## Labor Management: purpose and processing

Labor management records warehouse activity and supports comparing staffing plans with measured productivity.

Workers perform supported warehouse actions.

### How it works

1. Generate labor data from supported work execution, packing and receiving activities.
2. Use the recorded data to assess productivity and compare labor plans with expectations.

### Settings and prerequisites

- Labor groups define staffing, hours, unit of measure and estimated time per transaction. Wave-step placement determines work-line versus shipment-line planning.


### Limits

- Planned labor time is an estimate; it is separate from elapsed time and measured employee performance.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Warehouse actions produce labor requests which a continuing labor service turns into detail records; untracked duties can be manually entered. A labor-plan wave step separately estimates required labor. Source: `process-claim-process-documentary-labor-management-r01`.
- Labor plans order labor groups; groups carry staffing, hours, UOM and estimated time per transaction. Scenario calculations distinguish one transaction per UOM demand from one per quantity, producing different workload estimates. Source: `process-claim-process-documentary-labor-management-r02`.
- The example estimates do not measure runtime or actual employee performance. Direct and indirect labor are separately defined, and observed productivity requires actual authorized labor records and processing evidence. Source: `process-claim-process-documentary-labor-management-r03`.
- The plan diagram distinguishes work-line versus shipment-line planning according to placement relative to work creation. When a line qualifies for multiple groups, its displayed result comes from the last processed group. Source: `process-claim-process-documentary-labor-management-r04`.

`family-labor-management-aim`: [Labor Management Process Summary: Functionality](../AIM/reading/7dd4c71c4fffda7e9ee1126c5142b92f5d6ebf82faf4a4f204c59dfe5f1bfd65.md); AIM article `7dd4c71c4fffda7e9ee1126c5142b92f5d6ebf82faf4a4f204c59dfe5f1bfd65`, original SHA-256 `54c9034017f6e99c435f01fb8113c4cbb342583be0357d049f2bf4364b00d066`, nodes n68.

`process-claim-process-documentary-labor-management-r01`: [process-documentary-labor-management-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `652963c90728ac6d2e42b4a79884857b38c25919bd843580a5cc0a146bd06edf`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-labor-management-r02`: [process-documentary-labor-management-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `9258a50e24d09766bb68ccdfdf2fead976d8ec8d5b3697656f0a9bb77b5b3c11`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-labor-management-r03`: [process-documentary-labor-management-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `2d3ce19c31e6048b87bc927ebf259bdc2e295d97e5cd616a81b7d5fc55a4907a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-labor-management-r04`: [process-documentary-labor-management-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `538071fcf6b711dbc04ac6fafe7ee30a10d0c7021a85ae906d5380a56402a9f9`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-locating"></a>

## Locating: purpose and processing

Locating chooses a storage destination for checked-in product. Creating putaway work is a separate decision.

Checked-in containers are submitted for locating.

### How it works

1. Select the applicable locating rule, using the parent rule when locating by parent and the nested-container rule when locating by child.
2. Evaluate rule sequences in numeric order, applying each location selection and strategy.
3. If both Delayed Locating and Create Putaway Work are active, locate with work to the receiving pre-locate location; otherwise use rule details.

### Settings and prerequisites

- Rules can be assigned on the item or through rule-set assignment. Location selections, capacity and Split Quantity constrain the chosen destination.


### Limits

- If no sequence can place the quantity, locating can fail. A destination assignment alone does not establish physical putaway.


### Related articles

- [Unexpected putaway destination: ordered rules and decision history](#locating-destination-triage)
- [Configuring over-receiving and receipt execution](#receiving-overage-configuration)

<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Receipt check-in precedes locating, which chooses storage and may create putaway instructions according to receiving preferences. Process History explains decisions; Transaction History records actual locating events. Source: `process-claim-process-documentary-locating-r01`.
- Numbered locating sequences combine strategy and eligible-location selection. Style consolidation is child-container-only; Empty Location does not use another item's permanent assignment, and Fill One And Only One does not continue to other locations once its selected location fills. Source: `process-claim-process-documentary-locating-r02`.
- Delayed Locating requires both the rule flag and Create Putaway Work. Parent locating uses the parent rule and child locating the nested container's rule; otherwise normal rule details apply. Source: `process-claim-process-documentary-locating-r03`.

`family-locating-aim`: [Locating Process Summary: Functionality](../AIM/reading/4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa.md); AIM article `4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa`, original SHA-256 `e215745a6d81b87363e12c8d05d0ac51d7b6337430ce4b448bc6edcedf67b24a`, nodes n64, n66, n81, n83, n85, n87, n90, n94, n96, n98, n102, n105, n108, n113.

`process-claim-process-documentary-locating-r01`: [process-documentary-locating-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `b0e9bd813eb936a3bb782fe999d42f4b07337ca3972cf83684e45ec04c304876`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-locating-r02`: [process-documentary-locating-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `1bdb4498552b3ab8d265aafa532ee7ef93eb2eb868450fbf7d50af071af357c0`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-locating-r03`: [process-documentary-locating-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `6ca56203900d31b85abdcd8fd9b71f6c15621760092373a9678359abfde010aa`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-location"></a>

## Location: purpose and processing

A location is a defined place for inventory or an intermediate handoff between warehouse activities.

Warehouse locations are defined and referenced by warehouse work.

### How it works

1. Associate a location with a location type where common dimensions and quantity limits are needed.
2. Use movement-class rules to identify the types of product allowed in that location.

### Settings and prerequisites

- Location templates define identifiers and separators; location classes define operational purpose.


### Related articles

- [Unexpected putaway destination: ordered rules and decision history](#locating-destination-triage)

<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Location types share dimensions and quantity maximums; movement classes restrict product placement. Templates define structured IDs and separators, while predefined location classes identify purpose. Source: `process-claim-process-documentary-location-r01`.
- Permanent item assignments support non-inventory products. Pickup/dropoff locations are intermediate handoffs: one worker can deposit product and another transport it onward, rather than treating P&D as the final destination. Source: `process-claim-process-documentary-location-r02`.

`family-location-aim`: [Location Process Summary: Functionality](../AIM/reading/21428da0ae44e13ca2c0bcefba196f6df8418538d3c715c19189eea8ec30c5ae.md); AIM article `21428da0ae44e13ca2c0bcefba196f6df8418538d3c715c19189eea8ec30c5ae`, original SHA-256 `d517ff8730848df37cb3418877be0cb80e0e68650ed39845945145bad5425462`, nodes n63.

`process-claim-process-documentary-location-r01`: [process-documentary-location-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `d8a486d619e9a7231c3e448877598b37126b7f1c117b0c149f719aea93f3e52d`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-location-r02`: [process-documentary-location-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `2f242af9fe0335ec4432c545ab251e9d896d66e9b1848a2da356210b0a6d516a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-multi-language-support"></a>

## Multi-Language Support: purpose and processing

Language behavior depends on which SCALE interface is being used and which translations are installed. Desktop, browser, RF device and TPM settings are described separately in the captured documentation.

A user opens an interface or online help.

### How it works

1. Use the applicable translated resources; the documented desktop path follows Windows-user language and other application screens follow browser language.
2. RF language can be selected on the device; the documented TPM language uses its server-side web-user setting.
3. For online help, use a matching language folder when available, otherwise fall back to the base help.

### Settings and prerequisites

- Translated resource files and help must exist; choosing a language does not create its translations. The System Text Editor Translation Wizard supports resource export and import.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Translated TRP resources supply display text. Remote-desktop system-menu windows follow Windows user language; other application screens follow browser language. RF language can be set on the device independently. Source: `process-claim-process-documentary-multi-language-support-r01`.
- TPM website language is server/Web User configuration controlled in this source. Online help looks for the user-language folder and falls back to base help when it is absent; this does not establish translation availability or present product-version behavior. Source: `process-claim-process-documentary-multi-language-support-r02`.
- The System Text Editor Translation Wizard supports export/import and copying existing resource values for translation. Language selection, resource translation and translated help are distinct setup tasks. Source: `process-claim-process-documentary-multi-language-support-r03`.

`family-multi-language-support-aim`: [Multi-Language Support Process Summary: Functionality](../AIM/reading/3e7f7707cbad374ac9e9f33aea0d9c046ee877c02eff247d8fd4776e6a8038ea.md); AIM article `3e7f7707cbad374ac9e9f33aea0d9c046ee877c02eff247d8fd4776e6a8038ea`, original SHA-256 `1b7d8d6f4ca55bcae49fb22b6cf405789100c3d2c1f8b11214c085cad5b45a33`, nodes n63, n80, n82, n87, n92, n97, n102, n104.

`process-claim-process-documentary-multi-language-support-r01`: [process-documentary-multi-language-support-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `14e0ee3b4298b6b0fd66ba2be6ce6d0e519c647fa60755b93dce315702d66c7b`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-multi-language-support-r02`: [process-documentary-multi-language-support-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `04c7b2cbc92a5fa2c35d04f581d6055778894e9887b9a019cab79d438bbe8f46`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-multi-language-support-r03`: [process-documentary-multi-language-support-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `b441f7785c149ee741acdbcafc127ab1ae3b3df09d9361a06b2c00923693865b`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-packing-shipping"></a>

## Packing/Shipping: purpose and processing

Packing places shipment contents into containers. Shipping takes those containers through outbound dock processing and confirmation.

Allocated/picked shipment quantities enter the applicable packing and shipping flow.

### How it works

1. Associate lines with containers, validate items and generate packing labels in the documented packing process.
2. Manage packed shipments at the dock through load confirmation and departure processing.

### Settings and prerequisites

- Packing Preferences govern entry and close behavior; work profiles govern mobile picking into containers.


### Limits

- Pending QC blocks container closure; pending VAS follows its override setting. Container grouping requires the same shipment and does not itself change rating or routing.


### Related articles

- [Configuring packing preferences for users](#packing-preference-configuration)
- [Using the Packing screen](#packing-screen-guide)
- [Container will not close: packing, QC, VAS and weight](#container-close-checks)

<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Packing associates shipment contents to containers; closing collects container/weight data and prevents further packing. Bypass packing depends on Create Containers at Closing or wave-created containers. Source: `process-claim-process-documentary-packing-shipping-r01`.
- RF nesting checks container existence, an open parent and same-shipment membership before linking child ID/contents to the parent. A parent may be newly created during the flow. Source: `process-claim-process-documentary-packing-shipping-r02`.
- The close-container figure validates shipment/container, shipment membership and released wave; pending VAS requires an override while pending QC blocks. It adds an international on-the-fly restriction and notes RF/web-service international manifesting is unsupported in this documented flow. Source: `process-claim-process-documentary-packing-shipping-r03`.
- The close figure sequences manifesting, container/child status advancement, configured paperwork, optional load assignment, next dock move and transaction history. Grouping containers requires a common shipment and does not itself affect carrier rating/routing. Source: `process-claim-process-documentary-packing-shipping-r04`.

`family-packing-shipping-aim`: [Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md); AIM article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`, original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`, nodes n65.

`process-claim-process-documentary-packing-shipping-r01`: [process-documentary-packing-shipping-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `9cac984395960da8cd5a2970d4525b8e6b5a9858ac792e67e5c43710debf7fe9`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-packing-shipping-r02`: [process-documentary-packing-shipping-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `5056a96ad4f8d87b3ed8c2ac812c39d6f67a3be09ca4d8d69b6e5c5812a8268a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-packing-shipping-r03`: [process-documentary-packing-shipping-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `fba63fc12af40bdf1e25cb08616a2e76be781726d599e1a197f98b1e3eab7bc1`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-packing-shipping-r04`: [process-documentary-packing-shipping-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `a7c319c0625283ad681f68ad2195de5129e077f6413284699b89f624904e574a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-paperwork"></a>

## Paperwork: purpose and processing

Paperwork produces documents and labels for warehouse activity.

A configured inbound or outbound processing point requests documents or labels.

### How it works

1. Choose the configured document/label template for the processing point.
2. Use the configured renderer/printer, such as the vendor-described reporting or label application.

### Settings and prerequisites

- Document types and routing select the template and destination. Customized templates belong in the application Printing directory; Progistics uses its own templates.


### Limits

- Document generation, print-service dispatch and physical printer output are separate stages.


### Related articles

- [Printing packing and closing documents](#packing-label-printing)

<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Manual or process events such as wave, container close and shipment/load confirmation generate paperwork. The source names SSRS and Progistics as rendering/printing options. Source: `process-claim-process-documentary-paperwork-r01`.
- Custom templates belong in the application Printing directory; the source separately says Progistics uses its own unmodifiable templates. Successful document generation is not evidence of printer delivery. Source: `process-claim-process-documentary-paperwork-r02`.
- The SSRS diagram separates document-data submission, PDF rendering/storage, an SSRS print-request record, SCALE Printing Service detection, DynamicPDF PrintManager forwarding and physical printer output. Source: `process-claim-process-documentary-paperwork-r03`.

`family-paperwork-aim`: [Paperwork Process Summary: Functionality](../AIM/reading/55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56.md); AIM article `55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56`, original SHA-256 `f7d597f378321afb3251784f133a91d233a2f24534422bf53cfcefa420168688`, nodes n66.

`process-claim-process-documentary-paperwork-r01`: [process-documentary-paperwork-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `1465ad6fd62cb08ac0171af4b3e7fc25636b490331218f58fed538079d0803b2`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-paperwork-r02`: [process-documentary-paperwork-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `fcd5e78f9690e02a8b73a6c6949701a196f9815dfd5868ab9de3478e8ef5ba40`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-paperwork-r03`: [process-documentary-paperwork-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `b801ad2969fe0b0f4a0592baf2a0b393c94d855ea22f926107ee8532ea644ecf`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-performance-management"></a>

## Performance Management: purpose and processing

History, alerts and reports help explain warehouse activity. Transaction history records inventory changes; process history records system decisions.

A warehouse event, decision, discrepancy or configured alert condition occurs.

### How it works

1. Record the relevant transaction, process, quality or receipt-quality history described by the vendor.
2. Create an alert request for a configured condition. A scheduled alert job subsequently processes it into alert output.

### Settings and prerequisites

- Alert output can be history, email or both. Alert priority and the scheduled processing job are separate controls.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- The source separates transaction history for inventory effects, process history for decisions, quality history for discrepancies/reason codes, and receipt quality history for receiving milestones. Each supports a different troubleshooting question. Source: `process-claim-process-documentary-performance-management-r01`.
- An alert condition writes a request; the warehouse-alert scheduled job turns it into an alert and configured history/email effects. Alert priority and scheduled reporting/processes are distinct controls. Source: `process-claim-process-documentary-performance-management-r02`.
- History can record success or failure, but this article does not supply measured durations, active alert schedules or observed notifications for the assessed warehouse. Source: `process-claim-process-documentary-performance-management-r03`.

`family-performance-management-aim`: [Performance Management Process Summary](../AIM/reading/b9f415be06c542c5d9cfde6e82f215db824f5cfc894b21e3c1db55c08bdb7b3c.md); AIM article `b9f415be06c542c5d9cfde6e82f215db824f5cfc894b21e3c1db55c08bdb7b3c`, original SHA-256 `e416ac0d38d63480fb6f4326ad6e321d40c0d947b7c6a77295d33305e4846363`, nodes n63, n87, n91, n94, n97, n100, n104, n109.

`process-claim-process-documentary-performance-management-r01`: [process-documentary-performance-management-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `b4d04dbaae3a9fcba98ad7556361d0aa38b774fe45ef17a20ad24ab3eeafadff`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-performance-management-r02`: [process-documentary-performance-management-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `4a09b7b6da14d904e0cb1b6b8af07b0a099b47475793ab84652594d57a5c8b0c`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-performance-management-r03`: [process-documentary-performance-management-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `05036b664edc0224bd2beee85c943a0ef48f01f70a9bb05623d75fa37928c8b3`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-quality-control"></a>

## Quality Control: purpose and processing

Quality control holds eligible inbound product or outbound containers for inspection before normal processing continues.

Eligible inbound items are received, or outbound containers are selected for QC.

### How it works

1. For inbound QC, route a portion to inspection and hold the remaining quantity in the inspection status; disposition after inspection depends on the result.
2. For outbound QC, assign during the wave, at eligible work start or through an authorized manual action.
3. Evaluate active QC assignment rules in ascending priority and mark a matching container QC Pending; resolve failures before continuation.

### Settings and prerequisites

- Inbound eligibility is configured on the item. Work-start outbound assignment applies to existing wave-created containers, not containers newly introduced during RF picking.


### Limits

- Inbound QC supports license plates created during check-in, not downloaded receipt containers.


### Related articles

- [Receiving returns or damaged stock](#returns-damage-status)
- [Container will not close: packing, QC, VAS and weight](#container-close-checks)

<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Inbound QC samples receipt quantities for inspection and holds related inventory in QC status. It supports LPs created by check-in, not downloaded receipt containers. Outbound QC is assigned in a wave, at existing-container work start or by an authorized manual action. Source: `process-claim-process-documentary-quality-control-r01`.
- Outbound active assignment records are evaluated in ascending priority; the first match marks QC Pending and its assignment reason, while all matching records have their current container counts incremented. Source: `process-claim-process-documentary-quality-control-r02`.
- Inbound inspection requires manual transfer/status resolution; outbound failures must be resolved before the next status. The inbound diagram's diamond asks whether the item is already in QC, routes No to normal locating and Yes onward; preserve this potentially confusing source wording rather than silently reversing the branch. Source: `process-claim-process-documentary-quality-control-r03`.

`family-quality-control-aim`: [Quality Control Process Summary: Functionality](../AIM/reading/7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff.md); AIM article `7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff`, original SHA-256 `51b07421090b73e4d97f4a49f4d74557d4ca6d71bb35156614a6e641675ce7ce`, nodes n64, n87, n92, n96, n99, n102, n104, n106.

`process-claim-process-documentary-quality-control-r01`: [process-documentary-quality-control-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `c8c6e5feef31fbad55da36036f86717bd93c7f9314f1ede5f1589dd4b73375e0`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-quality-control-r02`: [process-documentary-quality-control-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `5ad1ee240c0af33175ddf6fd726896c8ef1b073baef4556f698f245ed0132590`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-quality-control-r03`: [process-documentary-quality-control-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `08b716c86945b38afb05ecfd6d774c0273fd3eb00b54493e87c97a604b7b6b77`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-receiving"></a>

## Receiving: purpose and processing

Receiving checks arriving product into SCALE and prepares it for storage.

Product arrives against an interfaced or application-created receipt.

### How it works

1. Check in quantity and create receipt containers, consolidating into the largest unit of measure the quantity accommodates.
2. Allow uncheck/recheck while successful locating has not occurred.
3. Locate the checked-in containers using the separate locating process.

### Settings and prerequisites

- Receiving Preferences choose the initiation and execution method, tracking prompts and whether locating creates putaway work. Storage templates govern grouping during check-in.


### Limits

- Without putaway work, locating can put quantity On Hand at its destination before the physical movement occurs.


### Related articles

- [Configuring over-receiving and receipt execution](#receiving-overage-configuration)
- [Receiving prompts for lot and serial numbers](#receiving-lot-serial-prompts)

<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Desktop receiving starts with an interfaced receipt or receipt creation from Insight/Workbench, shipment or PO. RF initiation depends on receiving preference and can use header/item, header/container, blind, item or container entry; the prose calls these four types but enumerates more variants. Source: `process-claim-process-documentary-receiving-r01`.
- Check-in converts quantities using item then item-class UOM, optionally verifies the breakdown without changing master UOM, groups by storage-template settings, captures tracking data and assigns LP IDs. Locate then processes explicit parent/child units through ordered rules and capacity checks. Source: `process-claim-process-documentary-receiving-r02`.
- Locating-rule assignment can occur at line creation or check-in; mixed-item containers cannot use a single item fallback. Explicit item/location capacity takes precedence over the dimensional/volumetric fallback. Delayed locating requires both its rule flag and Create Putaway Work. Source: `process-claim-process-documentary-receiving-r03`.
- If no eligible location fits and sequences are exhausted, locating fails. With putaway work, quantity is allocated at receiving and in transit to destination; without work it becomes On Hand during locating before physical movement. Quick-receiving Skip does not reprompt: use Workbench or LP-initiation receiving later. Source: `process-claim-process-documentary-receiving-r04`.
- RF receiving is workflow-driven and configurable per user; shipped activities can be changed. Thus the static process diagrams do not prove the effective screen order of the deployed receiving workflow. Source: `process-claim-process-documentary-receiving-r05`.

`family-receiving-aim`: [Receiving Process Summary: Functionality](../AIM/reading/b9c3ffa9a81498cb548bdb61d00ba2dd34e5bfb79695f24b28a31d26d9eb8369.md); AIM article `b9c3ffa9a81498cb548bdb61d00ba2dd34e5bfb79695f24b28a31d26d9eb8369`, original SHA-256 `b34355dc06ff7bda053191f657f72735d152012a6fe33cee1a2f714c9453d8b2`, nodes n65.

`process-claim-process-documentary-receiving-r01`: [process-documentary-receiving-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `ee68a65ad7a4302f72986256e4a4c4c518c08e04c544f98a9bbc69bc359a3d35`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-receiving-r02`: [process-documentary-receiving-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `7990bae420d4645b4c515f4457f46b1c49d27c0e714a75b20dcac97d9472a1d0`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-receiving-r03`: [process-documentary-receiving-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `5d0087500b307b1ebd2f983a9b26f5e7b417b4df7dc9b2a554d5c626b2541fae`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-receiving-r04`: [process-documentary-receiving-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `5068671cd08091e6160bd22206dc3cecc594b77381aa38d5bc5592d97bcbab81`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-receiving-r05`: [process-documentary-receiving-r05](mappings/process-documentary-review.json); reviewed-record SHA-256 `22bcee7ce13614120d8af300958f129a36114980be798363492a992aa1b1c91f`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-replenishment"></a>

## Replenishment: purpose and processing

Replenishment moves stock from bulk storage toward forward picking locations. A request identifies the need; movement work directs its execution.

A manual request, configured wave step or real-time minimum-threshold condition starts replenishment.

### How it works

1. Use the replenishment master and allocation rule to obtain product from bulk and represent quantity in transit to the forward location.
2. Apply a fill or whole-increment rounding strategy to the requested quantity.
3. For wave-generated requests, automatic work needs both a work-creation wave step and an Automatic Create Work Method; manual and real-time requests follow the master method.

### Settings and prerequisites

- Thresholds can be defined at location/location-type or item/item-class scope. Fill Destination ignores Maximum Replenishment Percentage; rounding strategies use replenishment increments.


### Limits

- Real-time replenishment marks a location for scheduled processing; it does not promise immediate physical movement.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Replenishment can be manual, wave-demand, pool-demand or real-time capacity based. Real-time means a threshold event marks a location for a scheduled job, not necessarily immediate physical movement. Masters and item/location criteria select and order the work. Source: `process-claim-process-documentary-replenishment-r01`.
- Demand UOM determines eligible demand; replenishment increment determines the moved unit. Capacity fullness uses On Hand plus In Transit against maximum quantity. The location threshold comparison is less-than-or-equal in the flow text. Source allocation rule precedence is replenishment master, item, then *Default. Source: `process-claim-process-documentary-replenishment-r02`.
- Fill Location targets capacity; round-up/down respects replenishment increments. The location-need example calculates target fill minus On Hand/In Transit despite a reversed subtraction phrase. Excess-demand requests can queue for the same permanent location; subsequent threshold activity marks requests for later work creation. Source: `process-claim-process-documentary-replenishment-r03`.
- Consolidate with Existing Requests supports many small waves and scheduled larger moves. Work-type priority orders competing replenishment methods. Create Work Method distinguishes automatic, manual/scheduled and none; none can mark destination stock On Hand before paperwork-driven physical movement. Source: `process-claim-process-documentary-replenishment-r04`.
- RF short-pick replenishment is conditional on work special handling. Its figure checks whether in-transit quantity can cover the shortage, raises related work priority when sufficient, and lets the user confirm the short pick or return and wait/partially pick. Source: `process-claim-process-documentary-replenishment-r05`.

`family-replenishment-aim`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138.

`process-claim-process-documentary-replenishment-r01`: [process-documentary-replenishment-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `d65ff19a4c0892267e8db5cbad7acabd5b335f8795e6d7b2e4bb2dcf35ddff14`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-replenishment-r02`: [process-documentary-replenishment-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `f742cc5d9218b7e03eca9776cf860d5be6b8baefe6b664aacc4e1216cd38f894`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-replenishment-r03`: [process-documentary-replenishment-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `e20faea0c277a70dfc0197d18800eb69f6ffca2a1c5578b9bc3b34ab950373f1`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-replenishment-r04`: [process-documentary-replenishment-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `4315b75181641edb619a086f93efb0c51e840cc61c5a65ec9b13f00e183d9dc3`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-replenishment-r05`: [process-documentary-replenishment-r05](mappings/process-documentary-review.json); reviewed-record SHA-256 `32eb1de2165521e94718210c9be461b6327b313ab958226a3615e80a92b7ad0b`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-retail"></a>

## Retail: purpose and processing

Retail functionality supports distributing product to multiple stores and cross-docking received product toward outbound delivery. Cross-docking moves product through receiving to shipping without the ordinary storage path.

Store orders are processed or received product is designated for cross-docking.

### How it works

1. Use store orders, also called distros, to distribute product to multiple store destinations.
2. Where configured, transfer received product to the shipping dock for customer delivery.

### Settings and prerequisites

- Put-to-store requires a PTS location class, eligible items, locating rules, receiving preferences, work profiles and store-location assignment criteria.


### Limits

- The documented split put-to-store flow excludes serial tracking; cross-docking supports it.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Retail distribution turns placeholder order lines bearing mark-for stores into store shipments and supports receiving-time cross-dock or put-to-store handling. Source: `process-claim-process-documentary-retail-r01`.
- Put-to-store needs a PTS location class, item immediate-needs eligibility, locating rules, preferences/work profiles and store-location assignment criteria. These are documentary prerequisites, not evidence of enabled configuration. Source: `process-claim-process-documentary-retail-r02`.
- Shipment distribution consolidates into an eligible open shipment or creates a new shipment, converts mark-for to ship-to, then allocates inventory or creates immediate need. Receiving can cross-dock an entire qualifying LP or split need quantity from inventory remainder; put-to-store assignment determines the need destination. Source: `process-claim-process-documentary-retail-r03`.
- Lot tracking is supported. The scenarios exclude serial tracking when splitting receipt containers for put-to-store/residual inventory but support it for cross-dock. An unlocated split put-to-store container is directed to Shipping Dock on relocation in the documented scenario. Source: `process-claim-process-documentary-retail-r04`.

`family-retail-aim`: [Retail Process Summary: Functionality](../AIM/reading/d66501685943e369aafe700282173d0b45d991727af47ccc51e47478b4a362fe.md); AIM article `d66501685943e369aafe700282173d0b45d991727af47ccc51e47478b4a362fe`, original SHA-256 `a1a9a1e3afc8fdfb208c84f118d9b70cb9741ea40636bdbf944a8aace23d8d7d`, nodes n68.

`process-claim-process-documentary-retail-r01`: [process-documentary-retail-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `d1cbc6619b4f37dbed1166436fbfe53a1aaf7170b276f5778dbce90378bcb0c0`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-retail-r02`: [process-documentary-retail-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `9397003e51ab278936c02b1d93892b346323ed71c4a17dab48f12f2eaed9f8ca`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-retail-r03`: [process-documentary-retail-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `a2221ab0bcc3474d91dc517557b036aaf4f6eeafccd317e3d6f26e903c97aea8`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-retail-r04`: [process-documentary-retail-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `4587feba1398672d965c1a9affd724f914588e8534c4d5e4152069cd7dc4572a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-returns"></a>

## Returns: purpose and processing

Returns processing records returned goods, their condition and the work needed to prepare them for storage.

Returned merchandise arrives at the receiving dock.

### How it works

1. Check in and locate the returned items.
2. Arrange items into putaway location groups so related items or items in the same locating zone can move together.

### Settings and prerequisites

- Disposition and reason collection are optional controls. When used, they affect inventory condition and locating; putaway-group capacity can trigger group closure.


### Limits

- Closing a returns putaway group creates work; physical putaway still follows.


### Related articles

- [Receiving returns or damaged stock](#returns-damage-status)

<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Returned goods use a receipt generated from a shipment or a blind receipt; consolidation groups allow good/bad returned product to be handled together before putaway. Source: `process-claim-process-documentary-returns-r01`.
- Workbench check-in confirms quantity and optionally reason/disposition, assigns or verifies LP IDs and locating rules, finds a returns putaway group, then closes the group to create putaway work. Manual repair/repackaging follows for applicable returns. Source: `process-claim-process-documentary-returns-r02`.
- Reason/disposition are not described as universally mandatory; when used they affect condition and locating. Failure to find a group prevents locate. Group closing may be manual or maximum-unit driven and the group can be reopened to remove a container. Source: `process-claim-process-documentary-returns-r03`.
- The documented return flow ends with work created and manual processing completed; physical putaway is still awaited, so group close alone does not prove stock reached its final location. Source: `process-claim-process-documentary-returns-r04`.

`family-returns-aim`: [Returns Process Summary: Functionality](../AIM/reading/ab511acd0eb85811a8567d2fc518dc5865a8177edddadafe02ff1c95ed87d456.md); AIM article `ab511acd0eb85811a8567d2fc518dc5865a8177edddadafe02ff1c95ed87d456`, original SHA-256 `875b8f400ce5607b4ff4cea042183deff1cd8de801a72f01876ec507a40e2987`, nodes n65.

`process-claim-process-documentary-returns-r01`: [process-documentary-returns-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `b8dcba4786dbe501f11cfeb5621f53dbf60bbc123f89f752b018e550862fa354`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-returns-r02`: [process-documentary-returns-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `56946db08b20a616c6f297c19c72c3a774f6c899a416495ac63d79261cc100f0`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-returns-r03`: [process-documentary-returns-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `96b3411d87b6f962e50add41652867555b6931e3f417b85601c931195a7ca299`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-returns-r04`: [process-documentary-returns-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `34b4b2d8da626551075d78140424c6110250495dbc8ebe2c13ad737af87e3058`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-status"></a>

## Status: purpose and processing

Statuses describe progress through receiving or shipping. Leading and trailing header values summarize the most and least advanced line progress.

A receipt or shipment line enters a status flow and processing advances.

### How it works

1. Use the line’s assigned custom flow, or the default flow when no custom flow is assigned.
2. Process the configured statuses in sequence and update parent progress as lines and containers advance.
3. Interpret leading and trailing status together. For the documented no-work receiving path, locating can lead to Closed without a work-confirmation step.

### Settings and prerequisites

- Define and assign custom flows before interface processing. They can omit stages present in the default flow.


### Limits

- A header summarizes its lines; a single status does not show that every line has reached the same stage.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Status flows define the permitted sequence of a line and the leading/most-advanced and trailing/least-advanced header status. A default flow applies when none is assigned; an interfaced or custom flow can alter the path. Source: `process-claim-process-documentary-status-r01`.
- Documented inbound progression includes 100 Check In Pending, 200 Locate Pending, 300 Putaway Pending, 301 In Putaway and 900 Closed. When no putaway work is created, the text allows 200 to 900 without establishing physical storage completion. Source: `process-claim-process-documentary-status-r02`.
- Outbound examples distinguish pool, wave, picking, packing, staging/loading, ship/load confirmation and delivered states. Special outcomes include 994 Complete Rejected To Pool, 995 Finished Item Allocated, 996 Component Allocated, 997 Immediate Need Pending, 998 Delete Rejected and 999 Rejected; these are source flow definitions rather than verified deployment settings. Source: `process-claim-process-documentary-status-r03`.
- Custom flows can omit steps and should be assigned before interface processing. Interpret header status with its leading/trailing semantics and associated container/line state; a single header code is not proof every line completed that stage. Source: `process-claim-process-documentary-status-r04`.

`family-status-aim`: [Status Process Summary: Functionality](../AIM/reading/5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d.md); AIM article `5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d`, original SHA-256 `2cc05e7c1cef1d68ccd7fc8901c12905c61f6b49b9e3d4d1a3ae28f3a0f59119`, nodes n63, n74, n80, n83, n86, n89, n92, n96, n103, n106, n109, n112, n115, n121, n124, n127, n130, n133, n136, n139, n142, n145, n148, n151, n154, n157, n160, n163, n166, n169, n172, n175, n178, n182, n185, n190.

`process-claim-process-documentary-status-r01`: [process-documentary-status-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `e96c2465c694d4114bb844ee1b4724aecc4e3f4190d977afe85ac763be8e46ca`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-status-r02`: [process-documentary-status-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `f0cbc78d52c3dd4674eab7499f4687beea0f19d11667ac7d82862a1e80e95ddc`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-status-r03`: [process-documentary-status-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `9b5b60b53e7f47ef6a2f09b0bc2e2b3a3be23d7f2847744a2a8d0a0771bf9827`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-status-r04`: [process-documentary-status-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `e621ad32d2867ffb8872266f4093a26d1a7edd60ce7ad7c2e5f844b4a5904b8a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-technical"></a>

## Technical: purpose and processing

Background processing lets SCALE accept batch work and perform it through a queue service.

An application batch process submits background work.

### How it works

1. The documented service writes a process request.
2. Process requests in the background according to the configured thread priority.

### Settings and prerequisites

- Priority, polling, concurrency and service configuration determine how background processing is dispatched.


### Limits

- The documented queue identifiers have not been matched to the available database snapshot; the active queue implementation may differ.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Process Queuing Service records a real-time batch request in ProcessQueueRequest for a background thread to process by priority; Background Job Queue Insight provides the documented monitoring surface. Source: `process-claim-process-documentary-technical-r01`.
- Scheduled jobs enqueue repeated work for batch processing. Custom viewers can select searches, results, actions, colours/icons and one or two header/detail tables; decimal presentation uses the Windows separator. Source: `process-claim-process-documentary-technical-r02`.
- The source describes XML web services callable by third-party software through a reachable web server. It does not establish deployed endpoints, authorization policy, retries, idempotency or a running queue worker. Source: `process-claim-process-documentary-technical-r03`.

`family-technical-aim`: [Technical Process Summary: Functionality](../AIM/reading/62470f051ed57f24c0d7d9e59111662d32d64353aee9f242c70a9c048d6b3311.md); AIM article `62470f051ed57f24c0d7d9e59111662d32d64353aee9f242c70a9c048d6b3311`, original SHA-256 `491f681174642377dd197e62fc880b3fdcf9a7d737ce1d6611e228ae528363ea`, nodes n63, n68.

`process-claim-process-documentary-technical-r01`: [process-documentary-technical-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `ffd35254d10924ef81aad9d0e625685f6bb50d676b57f6a6b79a0decaafc28d2`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-technical-r02`: [process-documentary-technical-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `27976a9adc34b95831180f0672db92ba3d32f1f06e499a756c5fadfbf52f3be7`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-technical-r03`: [process-documentary-technical-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `e08413bd9a8ab8eb2a2c0bb2b31abf879e8dddf92284ac9ae76089073a3d5013`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-trading-partner-management"></a>

## Trading Partner Management: purpose and processing

Trading Partner Management provides a website for order entry, status research and inventory collaboration.

An authorized trading partner uses a configured TPM website.

### How it works

1. Provide the configured order-entry, status, statistics and inventory-information functions.
2. Apply the website’s company context and presentation setup.

### Settings and prerequisites

- External users require a Customer ID and authorized companies. Branding, language and event-based email templates are separately configurable.


### Limits

- TPM is a separate website whose availability and access depend on the installation.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- TPM exposes web inquiry/order collaboration and statistics/inventory views. Internal users can see warehouse information across companies; external users are limited to their own records and allowed companies, with a Customer ID required for external users. Source: `process-claim-process-documentary-trading-partner-management-r01`.
- Company branding and external single-company or selected multi-company access are configurable. The figure uses different illustrative business names from the prose; both illustrate role/company scope rather than actual tenant identities. Source: `process-claim-process-documentary-trading-partner-management-r02`.
- Documented functions include purchase-order/shipment creation, order-status research, statistics by criteria in HTML/XML, inventory inquiry, and email alerts on configured status/document events with templates and recipients. Source: `process-claim-process-documentary-trading-partner-management-r03`.

`family-trading-partner-management-aim`: [Trading Partner Management Process Summary: Functionality](../AIM/reading/30da060b42a91d41911358c40ad130de83d9dee39759303024cfdf8ad73ec5a7.md); AIM article `30da060b42a91d41911358c40ad130de83d9dee39759303024cfdf8ad73ec5a7`, original SHA-256 `70c06d03187e0259c8678d60bd71d16d3f215f7e6512f1eaceda34b5c2ff5585`, nodes n63.

`process-claim-process-documentary-trading-partner-management-r01`: [process-documentary-trading-partner-management-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `eacf9c6c89ab24f53085811b0b106145fd2b3f302c8fe25f22b50fd70d9db3b2`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-trading-partner-management-r02`: [process-documentary-trading-partner-management-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `024f91be180fecfccdc4dba496776438d925949250c7d7769eec353e75b4e677`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-trading-partner-management-r03`: [process-documentary-trading-partner-management-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `bfaa309cda57db472bfd36ff45d4d014d2875fee770e8670b1c009ff40f59f98`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-wave"></a>

## Wave: purpose and processing

A wave groups selected shipments and runs the outbound steps defined by its master.

A configured wave is run against selected orders.

### How it works

1. Use the wave master to determine processing steps.
2. Execute those configured steps to move orders into outbound processing and create the required entities.

### Settings and prerequisites

- The wave master defines shipment criteria, capacity limits, ordered steps and Auto Release. Paperwork must follow the steps that generate its data.


### Limits

- A shipment is not split across waves. One shipment exceeding a master maximum remains in the pool. Run and Release are separate stages.


### Related articles

- [Keeping container contents together or separate](#packing-classes-and-criteria)
- [Printing packing and closing documents](#packing-label-printing)

<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Build associates pooled shipments to authorized wave masters, considering lower shipment/master priority numbers first and applying wave criteria. Run executes the configured flow; Release makes generated work and documents available to the floor. Source: `process-claim-process-documentary-wave-r01`.
- Maximums constrain shipment counts/details/units/value/weight/volume. A shipment is never split across waves; one exceeding a master maximum by itself stays in the pool. Criteria failures are retried against later masters. Source: `process-claim-process-documentary-wave-r02`.
- Automatic, manual, build-inactive and scheduled modes are documented in Functionality. The main flow diagram shows only automatic versus user-run branches. Auto Release is a separate setting; completion of Run does not by itself establish release. Source: `process-claim-process-documentary-wave-r03`.
- The pallet-building diagram requires Container Creation before Pallet Building and Pallet Building before Work Creation. It tests eligibility and fit using the master strategy, creates a new pallet container when necessary, and nests shipping containers. Source: `process-claim-process-documentary-wave-r04`.
- Paperwork should follow steps producing its data. The master defaults to *Default; sequential data selection and ordering, document type/generator, routing guide and template produce a batch document. Print-break sequences distribute copies, otherwise the routing guide supplies the printer. Source: `process-claim-process-documentary-wave-r05`.
- Pick groups separate full cases from loose containers, evaluate source locations against sequence ranges/zones, and create another group on maximum overflow. All contents of a loose container must qualify; containers matching no sequence remain outside a pick group. Source: `process-claim-process-documentary-wave-r06`.
- Paperwork step 6 contains an unrelated locating-rule sentence at n252. The reviewed paperwork guidance relies on the surrounding document generation/routing steps and does not treat that sentence as a supported locating requirement. Source: `process-claim-process-documentary-wave-r07`.

`family-wave-aim`: [Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md); AIM article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`, original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`, nodes n65.

`process-claim-process-documentary-wave-r01`: [process-documentary-wave-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `b2f122bc860bec0f9f32b06db12d19435eb4b50258ef1064517dc13307d067fe`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-wave-r02`: [process-documentary-wave-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `f2f39370b526a3b6817f9071806f659147ff853039c3e770928059dc84607272`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-wave-r03`: [process-documentary-wave-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `c2ed6d2c2e87df39a46a4fdd74891acfe846a630e420cbadf193bac0baf75747`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-wave-r04`: [process-documentary-wave-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `0f429c438190c5592b83f4e09477601ce491278a5c8865efa3ff59f550174720`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-wave-r05`: [process-documentary-wave-r05](mappings/process-documentary-review.json); reviewed-record SHA-256 `cc8baa94b9f8e7c26af646c92a68633fd850ccc7d88c90544bcf3d4410716677`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-wave-r06`: [process-documentary-wave-r06](mappings/process-documentary-review.json); reviewed-record SHA-256 `27b897669b08bba4ed865b369586f184d867506a4dd20ca57ccbb4c928a51d57`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-wave-r07`: [process-documentary-wave-r07](mappings/process-documentary-review.json); reviewed-record SHA-256 `d009e5824c7cc63c5cc302c5cf0a6bcdf8276b4f35c266643da29829f4f3ec4e`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-work"></a>

## Work: purpose and processing

Work creation turns warehouse needs into instructions. Employees execute those instructions through picking, putaway, counting and other activities.

An allocation, inventory adjustment, replenishment or other supported need requests work.

### How it works

1. Determine which entities need work using configured values and create work units/instructions.
2. An employee performs the action specified by the instruction, such as a pick or cycle count.

### Settings and prerequisites

- Work-creation masters select and group requests; work profiles and special handling govern execution.


### Limits

- Printing a pick list does not confirm the physical work.


### Related articles

- [Configuring a work profile and its sequence rules](#work-profile-configuration)
- [Work unit remains open: confirmation and holds](#work-completion-checks)

<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Allocation, adjustment or replenishment needs initiate creation of work units; physical execution is a separate employee action. Paper group picking runs outside regular work execution, whereas RF group picking can maintain work while users pick into shipping containers or totes. Source: `process-claim-process-documentary-work-r01`.
- Creation filters masters by requesting process, then uses lower priority numbers first and reserves matching requests so later masters do not reprocess them. Order By values sequence requests, instruction numbers identify details, estimated rates support planned time and configured breaks form work units. Source: `process-claim-process-documentary-work-r02`.
- Wave Replen Work Type can override the creation-master work type for wave replenishment. Auto Print applies to outbound work. The illustrated Order By example uses SHIPMENT_ID, PICK_LOC and ITEM ascending, with the work-unit break only on SHIPMENT_ID. Source: `process-claim-process-documentary-work-r03`.
- Non-RF users move goods from pick lists and an authorized administrator records worker, times, quantity, exception reason and confirmation in Work Insight. Confirmation advances to Ready for Packing or the configured intermediate status; the document does not equate pick-list printing with execution. Source: `process-claim-process-documentary-work-r04`.
- RF sign-on selects the default work profile or an authorized alternative. Work type and zone/equipment must fit its details; no eligible instruction sends the employee to a supervisor. System-, user-, or group-user initiation precedes assignment; receipt pre-locate destinations can trigger relocation. Source: `process-claim-process-documentary-work-r05`.
- Special handling can require location/quantity verification, maximum pickup and authorized location/lot/LP overrides. Short picks reject the short quantity and decrement source On Hand. Partial-pick closure and replenishment/work-order over-pick availability depend on handling settings. Source: `process-claim-process-documentary-work-r06`.
- Putaway may be automatic under the documented profile setting or explicitly confirmed, with shipping-container identification and optional nesting. Zone-based Picking Management permits multiple employees to execute parts of a work unit, unlike the ordinary single-user description. Source: `process-claim-process-documentary-work-r07`.
- System-directed selection first considers work eligibility, already assigned work and work ahead of the current location. Its configured assignment method determines priority/location/FIFO ordering. An unsuccessful assignment retries selection to address concurrency; returned work still executes in sequence order. Source: `process-claim-process-documentary-work-r08`.

`family-work-aim`: [Work Process Summary: Functionality](../AIM/reading/76770f4602f9b9e52b4fce3fb8973ffa25b3e882ead4fd0e2faea14766f877a3.md); AIM article `76770f4602f9b9e52b4fce3fb8973ffa25b3e882ead4fd0e2faea14766f877a3`, original SHA-256 `8fe175033aa7df42a105d4f6f4761a35c333680abae209074c8a16c16cad10e6`, nodes n65.

`process-claim-process-documentary-work-r01`: [process-documentary-work-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `eed5e75793124c8e6ca44c8d0bbb20c6e1d22cea7f7047da1d3428c2d8a2235a`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-r02`: [process-documentary-work-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `8c8fc8b17a48fc0c9d69027639da91aed74771dff2677ec46c635bad761a72cc`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-r03`: [process-documentary-work-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `cdc464f733884a5775bfcdd64a94ea07fd6678960f3d7862b6e75189294eb185`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-r04`: [process-documentary-work-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `8511a39f23b9eaa145dc68b51a7298ff311acc17ae023bc5bd6c5546d7740497`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-r05`: [process-documentary-work-r05](mappings/process-documentary-review.json); reviewed-record SHA-256 `c76cea34b1bc54c10610e8c0b83fc408222f6745a736ba9ea4d6f2098877d1e2`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-r06`: [process-documentary-work-r06](mappings/process-documentary-review.json); reviewed-record SHA-256 `64fb8d4906c0039fbb297361c704860d4c680571a210a95062b3d02eee7da30d`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-r07`: [process-documentary-work-r07](mappings/process-documentary-review.json); reviewed-record SHA-256 `418c97bfaeb103c08f5ef78f54858cb241a9d150a84a4f6086e372900c81adbe`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-r08`: [process-documentary-work-r08](mappings/process-documentary-review.json); reviewed-record SHA-256 `a63467067006437303e58188d0a3adaeefe53245d739f3f677e6a7f4be7b891b`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-work-order"></a>

## Work Order: purpose and processing

A work order manages assembly of a finished item from components and the movement associated with that assembly.

A work order is created or released, or components are manually allocated.

### How it works

1. Use the selected bill of material/revision or entered components and instructions.
2. Allocate components automatically at creation/release when configured, or manually.
3. Use work creation to move components and finished items, or use the documented paperwork-based path.

### Settings and prerequisites

- BOM revisions distinguish versions of the finished item. Create Work requires matching component and finished-item work criteria.


### Limits

- Without Create Work, SCALE can transfer On Hand quantities automatically while physical delivery of the components and finished items is still required.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- A user or Work Order Creation wave step creates assembly work using a BOM or manually entered finished-item/component/instruction data. BOM revisions support multiple versions; manually entered information is not maintained as a reusable BOM. Source: `process-claim-process-documentary-work-order-r01`.
- Components can be allocated on creation, on release, or manually later. A BOM quantity increase applies only when configured and its minimum is reached. Release then drives movement of components to the build location and assembly/confirmation of finished items. Source: `process-claim-process-documentary-work-order-r02`.
- Create Work plus matching component/finished-item criteria creates movement work and In Transit stock. Without Create Work the application transfers On Hand automatically; physical component/finished-item delivery is still required and may be guided by paperwork. Source: `process-claim-process-documentary-work-order-r03`.
- The source supports finished-item breakdown into components, manually or automatically printed picking/instruction/putaway lists, and interfaces for work orders/BOMs. These statements do not establish installed interface configuration or demonstrated disassembly. Source: `process-claim-process-documentary-work-order-r04`.
- The diagram first calls creation-time allocation allocation of the finished item, while prose describes components. Its last box delivers finished items to storage; prose n121 says build location despite preceding storage movement. Both inconsistencies are retained rather than resolved into a deployment claim. Source: `process-claim-process-documentary-work-order-r05`.
- When Create Work is enabled but no component work-criteria record applies, the prose calls for deallocating components, creating a suitable criteria record and allocating again. Missing finished-item criteria also prevents movement-work creation. This is documentary recovery guidance, not an authorized operational action. Source: `process-claim-process-documentary-work-order-r06`.

`family-work-order-aim`: [Work Order Process Summary: Functionality](../AIM/reading/7ce64df7dccc3aa20a98d55da3bebc5982d6628fd234699353055014fb625c05.md); AIM article `7ce64df7dccc3aa20a98d55da3bebc5982d6628fd234699353055014fb625c05`, original SHA-256 `acdec9a54988db2a6a542b95a64220f7f40bd22747ad02d5849c6fa77a826383`, nodes n64.

`process-claim-process-documentary-work-order-r01`: [process-documentary-work-order-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `1671514a167f59dc0b455c46981842ef5c919db19e536297d7f7d824081212b6`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-order-r02`: [process-documentary-work-order-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `04140335c6bd787bdbfac9d96636276a296e61c9e4567868bfb5216708c607c8`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-order-r03`: [process-documentary-work-order-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `34f50ed44046b42e1969775e64e3b624a5b9c572339b0bdd4ede926fa28d1377`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-order-r04`: [process-documentary-work-order-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `1e62f3ec50120b462b8df39b3fe24570bdb4ab6ddfbd87290fc3e2e70988f7d4`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-order-r05`: [process-documentary-work-order-r05](mappings/process-documentary-review.json); reviewed-record SHA-256 `3fc5af994823647bbbdd48e512dd457b27c81b8debf5c59d1b8120cfe386927c`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-work-order-r06`: [process-documentary-work-order-r06](mappings/process-documentary-review.json); reviewed-record SHA-256 `aee84b3d68083306e3ed2f58e7070d92236101aa6e1470e8a8d47a29a465b18f`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="process-yard-management"></a>

## Yard Management: purpose and processing

Yard management tracks arriving trailers, their yard and dock locations, and final checkout.

A trailer arrives and is checked into a yard location.

### How it works

1. Assign the arriving trailer to a yard or queuing location.
2. Move it within the yard or to the receiving dock when ready.
3. After its inbound processing finishes, move it back to the yard or check it out.

### Settings and prerequisites

- A receipt/trailer association is required; appointments are optional. Yard spaces are defined as dock locations.


### Limits

- A yard-location assignment identifies an intended destination; it does not confirm the trailer has moved.


<details>
<summary>Technical reference and sources</summary>

Additional process details:

- Yard management tracks arriving trailers through guard check-in, yard/dock movement, inbound processing and guard checkout. A receipt must carry a trailer ID for the documented check-in process; appointments are optional. Source: `process-claim-process-documentary-yard-management-r01`.
- Yard spaces are defined as dock locations in SCALE. The guard can assign a yard destination or an available Receiving Dock; an appointment can default that dock. The example assumes a fenced yard and an existing receipt/trailer association. Source: `process-claim-process-documentary-yard-management-r02`.
- RF yard jockey moves identify trailer and destination. A previously assigned destination defaults unless the trailer is already there, in which case Receiving Dock defaults. After inbound processing the trailer can return to storage before full-screen checkout. Source: `process-claim-process-documentary-yard-management-r03`.
- The retained summaries state receipt/trailer eligibility and dock availability but do not specify all collision, concurrent-move, checkout-validation or exception-recovery rules; those remain application/configuration gaps. Source: `process-claim-process-documentary-yard-management-r04`.

`family-yard-management-aim`: [Yard Management Process Summary: Functionality](../AIM/reading/ea0dcdbe8b292306e502eb84dc28fca30d15b41c916d24a683648f70412fd7a9.md); AIM article `ea0dcdbe8b292306e502eb84dc28fca30d15b41c916d24a683648f70412fd7a9`, original SHA-256 `85deed38d0afc11b33c579084e36ad8b555b9d554a1b6a6061670c08991e683b`, nodes n68.

`process-claim-process-documentary-yard-management-r01`: [process-documentary-yard-management-r01](mappings/process-documentary-review.json); reviewed-record SHA-256 `4949bfa4f1a97ed4646723a51b560e3566a185d1c39e951f312a40ad2a6f492e`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-yard-management-r02`: [process-documentary-yard-management-r02](mappings/process-documentary-review.json); reviewed-record SHA-256 `d7eac545fe6a6276610c1c1806099ffa71deeaf5e12b116713a6b48951ec8151`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-yard-management-r03`: [process-documentary-yard-management-r03](mappings/process-documentary-review.json); reviewed-record SHA-256 `bb37ea41d02a067885823bb6cf5c4ffed1476e1d248290be5c8b45051249057d`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

`process-claim-process-documentary-yard-management-r04`: [process-documentary-yard-management-r04](mappings/process-documentary-review.json); reviewed-record SHA-256 `9dbba8b2bdd56b93427096627e2bbc4cabea123f922fb594b5a5bd4c8e38f63e`. Exact source articles and node fingerprints are preserved in the register. Local documentary guidance only; deployed application behavior and production indexing remain unestablished.

</details>

<a id="work-monitor-drilldown"></a>

## Understanding a work-type drilldown

The work-type chart shows distinct work units by type for one warehouse and work group, alongside instruction and estimate totals. An unassigned or missing group value selects work with no group; it does not select every group.

### How it works

1. Parse warehouse and group from monitor criteria.
2. Filter group and warehouse, join type descriptions and return chart plus six totals.

### Settings and prerequisites

- The documented criteria format ends with a semicolon; duplicate/malformed filter values can change parsing or assignment.


### Limits

- AIM describes a group-to-type-to-user drilldown; the active application binding determines the available navigation.


<details>
<summary>Technical reference and sources</summary>

`work-batch-1114799379`: [dbo.WRK_MonitorWorkTypeChartData](sql/1114799379.sql); source-definition SHA-256 `c094149193856f701257522bdf9e7e64e31624686764322302f64c790e697d89`, reading-copy SHA-256 `80cd2be3bcea0460ebdd96d291dca2d574aaf5b9fcb49ad74a8d0a87bd86e1d1`, one-based inclusive lines [[1, 86]].

`work-batch-696701880`: [dbo.fn_GetMonitorFilterParameters](sql/696701880.sql); source-definition SHA-256 `6a84305decd91c089def46c688ab6b14bdff8047447004738868e761ea3ab38d`, reading-copy SHA-256 `a791255fa4c57ea50523da58aaf70dee7debfd5714a3b89c68186fab24e07b9a`, one-based inclusive lines [[1, 77]].

`work-monitor-aim-batch`: [Using the Work Monitoring: Group Screen](../AIM/reading/b77c848bec2898b6a573aa878319bb07181352908f6b6a8fa4c55b919d5c310c.md); AIM article `b77c848bec2898b6a573aa878319bb07181352908f6b6a8fa4c55b919d5c310c`, original SHA-256 `e7454d5ac265ba5499c91ce066c85d0f11970444a47dbdeff73646aa726d66ad`, nodes n58, n60, n64, n114, n122.

`work-monitor-sdk-batch`: [How to: Create Monitor Page Stored Procedure](../SDK/reading/2f1e464b919bbe6d9db8cf9f7a2eb6d5cfd5866b662fd85c0ef3c9c02005b000.md); SDK article `2f1e464b919bbe6d9db8cf9f7a2eb6d5cfd5866b662fd85c0ef3c9c02005b000`, original SHA-256 `8ffbb7c80b927b1c7e10e600060b6bf4e40ee562531deb705745193a32d6fd60`, nodes n47, n56, n59, n62, n97.

</details>

<a id="work-monitor-indicators"></a>

## Understanding work indicator tiles

Each tile asks a different question: aging work, urgent priority, held work, open/in-process work, or assigned in-process work. It counts distinct work units and evaluates the supplied caution and warning rules separately. The reviewed tiles do not include the chart's detail-instruction restriction, so their counts need not match. A recognized tile returns one row even when its count is zero. An unknown or NULL tile selector returns no result set from these branches; absence of a result is different from an empty work count.

### How it works

1. Choose the requested tile condition and warehouse.
2. Count distinct work units using that condition.
3. Evaluate caution and warning expressions separately.

### Settings and prerequisites

- Aging uses a timestamp earlier than UTC now minus one day; urgent priority is at most 10.
- Threshold expressions are caller input; missing/invalid expressions are not proven safe defaults.


### Limits

- Caution and warning are evaluated separately; the routine does not define a combined severity or display color.


<details>
<summary>Technical reference and sources</summary>

`work-batch-1098799322`: [dbo.WRK_MonitorWorkGroupIndicatorTile](sql/1098799322.sql); source-definition SHA-256 `1fa29b306e20cb73efa8593268dfb059893ccc4c271a8456e5755d677802ff96`, reading-copy SHA-256 `3e6ac90c5c4a31ae31bbf43221697a2682362a77fbeb8b943078757d8ff604ae`, one-based inclusive lines [[1, 93]].

`work-batch-664701766`: [dbo.fn_GetCriticalLevel](sql/664701766.sql); source-definition SHA-256 `a7776f274c63b4702627b0a49e627ef923d40a1ed8324d3520aa20f356c59bf9`, reading-copy SHA-256 `5ba598cb928904c8c41397628cf5036892d5bbe3b18284135432081867c62fe2`, one-based inclusive lines [[1, 47]].

</details>

<a id="work-inactive-history"></a>

## Understanding inactive work storage

Closed work can remain visible after deactivation because monitors can read active and inactive storage together. This transfers work records; it does not move inventory.

### How it works

1. Copy selected closed headers and details to inactive instruction storage.
2. Delete matching active records using the routine's scope.
3. Read the combined work view after the transfer.

### Settings and prerequisites

- The batch procedure's first TOP 10000 applies only to its header insert; later operations have wider scope.
- Copy/delete atomicity depends on caller transaction behavior, which has not been supplied.


### Results

- The combined view uses UNION ALL, so it preserves duplicate IDs across active and inactive storage.


### Limits

- Retention duration, scheduling and audit immutability depend on the surrounding system.
- Cleanup changes stored records and is not a read-only diagnostic.


<details>
<summary>Technical reference and sources</summary>

`work-batch-874798524`: [dbo.WRK_DeactivateInactiveWork](sql/874798524.sql); source-definition SHA-256 `85a1da558d9fedb44df9c4eba99f763312296fd29602b1c76f0d41bb37da58a2`, reading-copy SHA-256 `69eb0afbab68d08b67604fcdbf964ebfc889b55c98fd0eafa049924018c6f9b4`, one-based inclusive lines [[1, 81]].

`work-batch-890798581`: [dbo.WRK_DeactivateWork](sql/890798581.sql); source-definition SHA-256 `298db8cd6df14b0deb5c1cdc45be5f769c317a8ae4656bd22bfb1b99211e77af`, reading-copy SHA-256 `1810216ab801e6b9730ea7e24731f8342eebc305c708959cb447e8a40dc4e65b`, one-based inclusive lines [[1, 33]].

`work-batch-172579703`: [dbo.WORK_INSTRUCTION_VIEW](sql/172579703.sql); source-definition SHA-256 `8e8dadbd10a8e2f71f85701252fe2cec66c136c883e63de03dc7a6277e777a9d`, reading-copy SHA-256 `f8ad80899fdf8de790c7a4e5df028bf9981cc3f774a55f1a3f99538f86e109c2`, one-based inclusive lines [[1, 9]].

</details>

<a id="work-group-assignment"></a>

## Understanding grouping and assignment changes

Changing a work group writes the group number and sequence without assigning a worker. Unassigning is a separate operation that clears group, user and team fields for the selected process subset.

### How it works

1. For a nonempty work unit, set its group and reset sequences before sequencing the applicable details.
2. The separate unassign operation clears group/user/team and writes supplied audit stamps for its group/process scope.

### Settings and prerequisites

- These routines do not validate warehouse or user authorization.
- A NULL group can reset sequences without matching the subsequent sequencing step.


### Limits

- Caller order, reservation, authorization and concurrency controls are not established.


<details>
<summary>Technical reference and sources</summary>

`work-batch-1354800234`: [dbo.WRK_UpdateWorkInstructionForSystemDirectedWorkUnitSelection](sql/1354800234.sql); source-definition SHA-256 `90ed3a212453ab909163e439de1686e2e655c2ce808b00ab82806a0dcc42829f`, reading-copy SHA-256 `6f6de83a4c739d9ec3bcb15210763b7d0e0bfa7fcd2adb79ea56bac9b89c5a0a`, one-based inclusive lines [[1, 40]].

`work-batch-1146799493`: [dbo.WRK_UnAssignGroupForSystemDirectedWork](sql/1146799493.sql); source-definition SHA-256 `97cab821663d34900b38963b0ed1cdfe0b48ede4060361f0de88b606db1e475b`, reading-copy SHA-256 `230e30dce4728e4905ba4e43efa47aaf74d43f9569714ee98807f81b475340d7`, one-based inclusive lines [[1, 30]].

</details>

<a id="work-feature-scope"></a>

## Understanding feature scope in work selection

The feature resolver uses the global flag and, when the global flag is N, a matching user override.

### How it works

1. Read the named feature and matching user override.
2. Return the resolved flag.

### Settings and prerequisites

- Global Y returns Y. Global N returns the matching user override, or N without one.
- Missing or unexpected configuration can return NULL; duplicate matches can fail.
- Removed and product-release fields are not evaluated by this function.


### Limits

- This feature flag alone does not establish effective access rights or application use.


<details>
<summary>Technical reference and sources</summary>

`work-batch-680701823`: [dbo.fn_GetFeatureEnabled](sql/680701823.sql); source-definition SHA-256 `097700a5c953e7c7e7ad3c9c07e33ce4fb97ed8c874ce1742e50ca9a6561f8b6`, reading-copy SHA-256 `77e132ef10237d4ba41dc2326eb114aa18def1a75579f7db4b065d6856aa260e`, one-based inclusive lines [[1, 19]].

</details>

<a id="inventory-quantity-buckets"></a>

## Understanding inventory quantity categories

On-hand means product physically at a location. Allocated means quantity reserved to leave; in-transit means quantity expected to arrive. The vendor describes available as on-hand minus allocated minus suspense. Movement code changes these categories separately, and selected availability checks can include in-transit quantity when the location rule permits it.

### How it works

1. Caller supplies separate effects for the four quantities.
2. Source/destination add, subtract or retain each category separately.
3. Selected checks consider location class and in-transit allocation rule.

### Settings and prerequisites

- Caller effects and LOCATION.ALLOCATE_IN_TRANSIT change reviewed branches.
- Adjustment types that create work can reserve transfer quantity at the source and mark destination quantity as in transit.


### Results

- A reservation can change allocated quantity separately from on-hand.


### Limits

- The general available-quantity formula and conditional in-transit checks have different scopes; use the rule for the selected operation.


<details>
<summary>Technical reference and sources</summary>

`inventory-1128703419-sql`: [dbo.INV_AdjustInv](sql/1128703419.sql); source-definition SHA-256 `362ff83361dded24aae929aa0cf58685200b21bb3a7991f880fca97a00e8de93`, reading-copy SHA-256 `b77007a8973b5368936124674524c79420b1816c140e116f148a722f5a6696ce`, one-based inclusive lines [[40, 251]].

`inventory-1400704388-sql`: [dbo.INV_PickFromLocation](sql/1400704388.sql); source-definition SHA-256 `ee688bd90536748cd6f1eeb1015d39199a62236adeb6ebe97b79d6bbde31398c`, reading-copy SHA-256 `75f63d082a4062e9b815f5797a8c53d333828c5cf2bec75cea0e22c978d999d2`, one-based inclusive lines [[82, 828]].

`inventory-1464704616-sql`: [dbo.INV_PutIntoLocation](sql/1464704616.sql); source-definition SHA-256 `6c20f44f12558f31d9ca6765c33a8952275f46ab5718fbe209f5266735494142`, reading-copy SHA-256 `8986ffa4b9635c50100e3f8b6b00a2b4a29f3cc25f0f8357337d80ac760579de`, one-based inclusive lines [[102, 1234]].

`inventory-tracking-aim`: [Inventory Tracking Process Summary: Functionality](../AIM/reading/de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c.md); AIM article `de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c`, original SHA-256 `b87db78c2d841a850fc229481eabccd5eea820d3fee31495a2578a92707c5a88`, nodes n64, n87, n90, n93, n96, n99, n108, n113, n115, n120, n125.

`inventory-management-aim`: [Inventory Management Process Summary: Functionality](../AIM/reading/9c9b2f34d8c2aeee8291236b7db3a8d7712db3a3188eda0681cc00157c1ccdfe.md); AIM article `9c9b2f34d8c2aeee8291236b7db3a8d7712db3a3188eda0681cc00157c1ccdfe`, original SHA-256 `9fe93dc5c192f74ebe3d424157aa85d024f7079485cbc7e9c9c475c794e7eee6`, nodes n66, n68, n99, n118, n120, n124, n128, n129, n130, n135, n136, n137.

</details>

<a id="inventory-empty-source"></a>

## Understanding empty source inventory

When resulting on-hand, allocated, in-transit and suspense quantities are all zero, the source routine can remove nonpermanent inventory. It handles serial, unit-of-measure and catch-weight links first. Permanent inventory follows a different retention path.

### How it works

1. Calculate four new quantities and determine permanent-row state.
2. For empty nonpermanent inventory, archive remaining serials and detach/delete unit rows based on destination effects.
3. Remove eligible catch-weight links and delete inventory using initial-quantity predicates, or update retained inventory.

### Settings and prerequisites

- Destination effects, container tracking and catch-weight rules determine how linked records are handled.


### Limits

- A failure does not establish rollback; that depends on the calling transaction.


<details>
<summary>Technical reference and sources</summary>

`inventory-1400704388-sql`: [dbo.INV_PickFromLocation](sql/1400704388.sql); source-definition SHA-256 `ee688bd90536748cd6f1eeb1015d39199a62236adeb6ebe97b79d6bbde31398c`, reading-copy SHA-256 `75f63d082a4062e9b815f5797a8c53d333828c5cf2bec75cea0e22c978d999d2`, one-based inclusive lines [[82, 828]].

`inventory-1144703476-sql`: [dbo.INV_ArchiveSerialNumbers](sql/1144703476.sql); source-definition SHA-256 `8084142916ec21e90dc8dac17e3a94bcec1c29b8e7a014b78866de919dddde28`, reading-copy SHA-256 `04dd003e9e71b5835e433bb4d09046ce0bfd11ea201ffa3bad6b7299ebf88dc0`, one-based inclusive lines [[11, 54]].

</details>

<a id="inventory-destination-units"></a>

## Understanding destination units and attributes

Placement can create or update destination inventory, reuse equal attributes or copy an attribute set. It also transfers, copies or removes unit-of-measure details to fit the destination. Location rules and transaction context determine the path, so internal IDs need not remain the same.

### How it works

1. Validate destination context and choose existing inventory versus insertion.
2. Reuse or copy inventory attributes when required.
3. Reassign or clean unit rows with dynamic statements and fallback copy/insert handling.
4. Handle lot, location, catch-weight and history steps.

### Settings and prerequisites

- Location class, multi-item/container rules, status context and attribute equality affect placement.


### Results

- An attribute ID returned to the caller can differ.


### Limits

- Nested helper behavior and a transaction covering every placement step are not established.


<details>
<summary>Technical reference and sources</summary>

`inventory-1464704616-sql`: [dbo.INV_PutIntoLocation](sql/1464704616.sql); source-definition SHA-256 `6c20f44f12558f31d9ca6765c33a8952275f46ab5718fbe209f5266735494142`, reading-copy SHA-256 `8986ffa4b9635c50100e3f8b6b00a2b4a29f3cc25f0f8357337d80ac760579de`, one-based inclusive lines [[102, 1234]].

</details>

<a id="inventory-serial-linkage"></a>

## Understanding serial checks during movement

Serial-controlled movement checks the selected serial groups at the source, then transfers their inventory links. Serial-row count and serial-group quantity are different measures.

### How it works

1. Match source inventory and conditionally compare distinct serial groups with quantity.
2. Check qualifying selected linkage; clear source links and return rows updated.
3. Look up destination inventory and assign its ID to selected serials.

### Settings and prerequisites

- Item mode, transaction type, argument group and inventory keys govern checks.


### Results

- Passing one check does not prove destination linkage or complete movement.


### Limits

- The destination lookup has no explicit no-match rejection; absent inventory can leave or set a NULL link.


<details>
<summary>Technical reference and sources</summary>

`inventory-1608705129-sql`: [dbo.INV_ValidateSerialNums](sql/1608705129.sql); source-definition SHA-256 `635cdaa6102b251268a77aa102478e353ad7c6338c735be219e55fc28293dc79`, reading-copy SHA-256 `70213db8195a3b7768feef0636aea877a4a94807ac056c4de7dcbaeb68f836be`, one-based inclusive lines [[15, 104]].

`inventory-1416704445-sql`: [dbo.INV_PickSerialNumbers](sql/1416704445.sql); source-definition SHA-256 `41ed0b852e3c05fc6e788779755b0fdfd82181718a504824e167b6d297f54627`, reading-copy SHA-256 `e763924616e0e97b2f8d56b00a30978cb815a76741550b7a1e65fefd04d9e535`, one-based inclusive lines [[15, 69]].

`inventory-1480704673-sql`: [dbo.INV_PutSerialNumbers](sql/1480704673.sql); source-definition SHA-256 `561ea31684660c57b362b2c48503a9ab9d363ff0d628392be422d2c7f578ba1f`, reading-copy SHA-256 `e74eed30a9c38f95239e7174a80c3a36689bca0de3ecdc49c5eacb4a55752a1d`, one-based inclusive lines [[14, 48]].

`inventory-tracking-aim`: [Inventory Tracking Process Summary: Functionality](../AIM/reading/de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c.md); AIM article `de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c`, original SHA-256 `b87db78c2d841a850fc229481eabccd5eea820d3fee31495a2578a92707c5a88`, nodes n64, n87, n90, n93, n96, n99, n108, n113, n115, n120, n125.

</details>

<a id="inventory-lot-lifecycle"></a>

## Understanding lot creation and cleanup

A lot identifies a group of product. Movement helpers can create a missing lot and attach supplied attributes. When the remaining-inventory test permits cleanup, another helper copies the lot and attributes to history and deletes active rows. This does not by itself prove the warehouse has no stock.

### How it works

1. Read template/frozen-status context and insert a missing lot for a supported location.
2. Parse supplied attributes and insert them for the newly created lot.
3. Test remaining qualifying inventory outside departing context; copy lot/attributes before active deletion.

### Settings and prerequisites

- Item lot template, configured frozen status, location class and departure context govern behavior.


### Results

- Create-if-missing leaves existing lot/attributes unchanged.


### Limits

- Cleanup uses row existence with exclusions, not a warehouse quantity SUM.
- Retention, immutability and atomic copy/delete are not established.


<details>
<summary>Technical reference and sources</summary>

`inventory-1432704502-sql`: [dbo.INV_ProcessLotInNewInventory](sql/1432704502.sql); source-definition SHA-256 `9b2752c744893bc557774452348a3ceca5cb15a04f65b4ad08cbe1b6702e0b41`, reading-copy SHA-256 `3f5cd7b8b517b41c09ea4cb9df5422be5f94fd61aa93668b0dca27ea12d2b261`, one-based inclusive lines [[17, 113]].

`inventory-1256703875-sql`: [dbo.INV_InsertLotAttributes](sql/1256703875.sql); source-definition SHA-256 `9a6c77a44c7a5865ec1e0275b993a8987a72d53c0b9366b91fdbc21b8127cc6d`, reading-copy SHA-256 `a1a3c696a9ef59cbeb3bd70f6a1a07ad5d2b91da8542a0667d0440d40c07fee5`, one-based inclusive lines [[17, 55]].

`inventory-1448704559-sql`: [dbo.INV_ProcessLotWhenEmptyingInv](sql/1448704559.sql); source-definition SHA-256 `9c536bc1ce6c131124da2001272c85a187f6cf05a6e0e8469071a37153ed244a`, reading-copy SHA-256 `ab5e0948a8c84b089c949d96817e91f33021fc81cbdd87f6809a36893826964d`, one-based inclusive lines [[22, 175]].

`inventory-tracking-aim`: [Inventory Tracking Process Summary: Functionality](../AIM/reading/de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c.md); AIM article `de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c`, original SHA-256 `b87db78c2d841a850fc229481eabccd5eea820d3fee31495a2578a92707c5a88`, nodes n64, n87, n90, n93, n96, n99, n108, n113, n115, n120, n125.

</details>

<a id="inventory-activity-count"></a>

## Understanding a count after picking

Activity-driven cycle counts check physical stock after work such as picking. An on-hand reduction can trigger a threshold check before a count request is created or updated.

### How it works

1. After on-hand reduction, sum item/company source inventory and call threshold logic.
2. Match active thresholds, check elapsed days and convert units if required.
3. Return/clean up or call request helpers when conditions permit.

### Settings and prerequisites

- The active threshold must match the location dimensions, quantity/unit and required days since the last count.
- AIM also describes an immediate/pending RF preference; its effective setting and the request-helper behavior require separate confirmation.


### Limits

- The checker can delete matching requests and work; it is not a read-only diagnostic.


<details>
<summary>Technical reference and sources</summary>

`inventory-1400704388-sql`: [dbo.INV_PickFromLocation](sql/1400704388.sql); source-definition SHA-256 `ee688bd90536748cd6f1eeb1015d39199a62236adeb6ebe97b79d6bbde31398c`, reading-copy SHA-256 `75f63d082a4062e9b815f5797a8c53d333828c5cf2bec75cea0e22c978d999d2`, one-based inclusive lines [[82, 828]].

`inventory-1160703533-sql`: [dbo.INV_CheckLocThreshold](sql/1160703533.sql); source-definition SHA-256 `2883358067877b581e4e951f5f0518cdd4998a2a913bd3bfc34fd8387ff7978a`, reading-copy SHA-256 `1723eed69b74a258bec467e61523165fb454c8a3088169c068050265307c7065`, one-based inclusive lines [[4, 205]].

`inventory-cyclecount-aim`: [Cycle Counting Process Summary: Functionality](../AIM/reading/548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3.md); AIM article `548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3`, original SHA-256 `62b53306bb40dde023f7fe8b495cff98a3604c93e7613707f4547202de3ae47c`, nodes n66, n104, n106.

</details>

<a id="receipt-trailer-association"></a>

## Understanding receipt and yard links

Three triggers maintain receipt-to-yard links. Receipt insertion links matching yard rows with coded status 0. An update targeting the trailer ID refreshes that link and can clear it when no matching yard row exists. A newly inserted yard record can attach existing unlinked receipts, but uses a different status rule.

A receipt is inserted, an UPDATE targets its TRAILER_ID column, or a yard record is inserted.

### How it works

1. Receipt INSERT joins a matching trailer, warehouse and yard status.
2. Trailer-column UPDATE uses a left join, so a missing match clears the yard ID.
3. Yard insertion attaches matching unlinked receipts except trailing status 900, without testing inserted yard status.

### Settings and prerequisites

- Check the triggering event, matching warehouse/trailer, existing link and coded status predicates before attributing a changed association.
- Changing only warehouse does not satisfy UPDATE(TRAILER_ID).


### Results

- Yard link/stamps may change; no physical trailer movement or receiving quantity changes are performed by these bodies.


### Limits

- Numeric predicates are not verified business-status labels.
- AIM requires receipt/trailer association for yard processing; these triggers provide only one implementation component.


<details>
<summary>Technical reference and sources</summary>

`rs-batch-720057651`: [dbo.RECEIPT_HEADER_A_I](sql/720057651.sql); source-definition SHA-256 `303fc1c5908ab4733761d50c9252f107ab4c8ae7626efcc0bd28f8e09b8df020`, reading-copy SHA-256 `b30f95dbe9d69a2adcf3cdd7fa26dc0a986685c363af5b0236683bf888c28f05`, one-based inclusive lines [[1, 30]].

`rs-batch-736057708`: [dbo.RECEIPT_HEADER_A_U](sql/736057708.sql); source-definition SHA-256 `869374807869d44285da28c23b6c61363c21f2a5a3c9c475ec9815c139dbf576`, reading-copy SHA-256 `716ca062537be2d52d536067457f15f1c8f08a26567cc2f2fbe0cec1e0b29beb`, one-based inclusive lines [[1, 33]].

`rs-batch-784057879`: [dbo.TRAILER_YARD_STATUS_A_I](sql/784057879.sql); source-definition SHA-256 `5fe380b8d5dc1a4eed01274a19298df78be15267687612881f5e0b6fdd31ecf7`, reading-copy SHA-256 `254d9fee5b3ae0c9cb521ea2cfad05a774f3bb9b9f5f3ee77516c967819b3042`, one-based inclusive lines [[1, 25]].

`rs-yard-aim`: [Yard Management Process Summary: Functionality](../AIM/reading/ea0dcdbe8b292306e502eb84dc28fca30d15b41c916d24a683648f70412fd7a9.md); AIM article `ea0dcdbe8b292306e502eb84dc28fca30d15b41c916d24a683648f70412fd7a9`, original SHA-256 `85deed38d0afc11b33c579084e36ad8b555b9d554a1b6a6061670c08991e683b`, nodes n68.

</details>

<a id="shipping-container-tree"></a>

## Understanding parent container identifiers

On insertion, a parentless shipping container with a missing or negative tree-unit number receives its own internal container number as the tree unit. Existing zero/positive tree values and child containers are not changed by this trigger.

### How it works

1. Join inserted IDs and initialize only qualifying roots.

### Settings and prerequisites

- Later parent changes are outside this INSERT trigger.


### Limits

- This does not create child containers, pack items or calculate physical capacity.


<details>
<summary>Technical reference and sources</summary>

`rs-batch-768057822`: [dbo.ship_container_tree_unit_a_i](sql/768057822.sql); source-definition SHA-256 `983d20e677855a6c27be40e5e79dbb924b57049fb24c95ddd8379a7db420cba7`, reading-copy SHA-256 `5efb0120bcc089cce081aee93c19d4a7443b04335431765aac6b3006766278b1`, one-based inclusive lines [[1, 13]].

</details>

<a id="shipment-accessorial-identifiers"></a>

## Understanding accessorial identifier normalization

An insert or update with a negative accessorial internal number triggers normalization. SCALE updates negative rows sharing the computed shipment-or-container association, including existing rows outside the inserted set.

An INSERT or UPDATE of SHIPMENT_ACCESSORIALS includes a negative internal number.

### How it works

1. Check for a negative internal number in inserted.
2. Use container number when present/nonzero, otherwise shipment number; update matching negative association rows.

### Settings and prerequisites

- Inspect association-key rules and trigger event before assuming a one-row effect.
- Recursion behavior depends on captured body plus uncaptured engine settings and replacement values.


### Results

- INTERNAL_NUM is normalized; no charge calculation or carrier call is in this trigger.


<details>
<summary>Technical reference and sources</summary>

`rs-batch-752057765`: [dbo.shipment_accessorials_a_i](sql/752057765.sql); source-definition SHA-256 `57493c497fd6f83c50aa9dcd8a1a1718f29d62d6028c32174ac5978031c08ec5`, reading-copy SHA-256 `2a2157c7562c8aea7899564ba9ca4ea29d41b6f4f2588af925b7a9eefafe3f23`, one-based inclusive lines [[1, 31]].

</details>

<a id="ship-confirm-status-propagation"></a>

## Understanding ship-confirm database changes

Ship confirmation writes supplied statuses, adjusts quantities-at-status, timestamps records and queues matching alerts.

### How it works

1. Queue matching active alert requests with duplicate-looking requests excluded by a read check.
2. Write header status, UTC ship time and warehouse-local status dates.
3. Shift and consolidate detail status slots except numeric 995, then update containers and the supplied load.

### Settings and prerequisites

- The caller supplies status and limit; this body does not validate the permitted transition or shipment/load relationship.
- Timezone configuration changes local calendar dates; it is not the same as UTC timestamps.
- Separate statements and NOLOCK duplicate checks need caller transaction/concurrency evidence.


### Results

- No result set; persistent status/quantity-at-status writes and alert requests.


### Limits

- These writes do not establish carrier acceptance, physical departure, print output or alert delivery.
- Detail-history ordering, nullable quantities and repeated-call behavior depend on caller rules.


<details>
<summary>Technical reference and sources</summary>

`rs-batch-1809753850`: [dbo.SHP_SetStatusesAtShipConfirm](sql/1809753850.sql); source-definition SHA-256 `4ac0db0eff207af65ce8c7c515a77955835a1db218c1610551eb4f3c37930196`, reading-copy SHA-256 `2e4550ba3972ac8d7cb010387214f2bdab3e30ddb1fa8d5d9f0c70a61c2f411f`, one-based inclusive lines [[1, 310]].

`rs-batch-1000702963`: [dbo.GetWarehouseTimezoneValue](sql/1000702963.sql); source-definition SHA-256 `6f264491b5ea0bf792fd3243a00196414237a5791c66fdd12d8a225cc3bb3a77`, reading-copy SHA-256 `6b5bdff46dfcee6ee4cf96dd5356cf4034277711d5b7749bcdb558dab325a3e4`, one-based inclusive lines [[1, 27]].

`rs-shipping-aim`: [Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md); AIM article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`, original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`, nodes n65.

`rs-status-aim`: [Status Process Summary: Functionality](../AIM/reading/5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d.md); AIM article `5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d`, original SHA-256 `2cc05e7c1cef1d68ccd7fc8901c12905c61f6b49b9e3d4d1a3ae28f3a0f59119`, nodes n63, n74, n80, n89, n190.

</details>

<a id="receipt-container-id-generation"></a>

## Understanding receipt container identifier generation

This helper generates a numeric receipt-container identifier, even though its input parameter is text. Nonnumeric input can fail conversion, and leading zeros can disappear during numeric conversion. It checks the supplied input as an external identifier and also uses it as the internal numeric receipt-container key for the UPDATE. The name does not guarantee global uniqueness or safe concurrent allocation.

### How it works

1. Check three existing identifier surfaces and choose a candidate by maxima or a fallback search.
2. Write the candidate using the supplied input as INTERNAL_REC_CONT_NUM filter.
3. Return candidate; a collision branch also returns it before the UPDATE.

### Settings and prerequisites

- Clarify the caller's parameter meaning and numeric format before operational use.
- No reservation, sequence allocator or collision-proof transaction is present.


### Results

- One or two scalar result sets depending on collision branch, plus possible persistent identifier update.


### Limits

- A result emitted before UPDATE is not evidence that the change succeeded.
- Exact literal exclusion pattern and external caller contract remain open.


<details>
<summary>Technical reference and sources</summary>

`rs-batch-2103678542`: [dbo.REC_CreateNewUniqueContainerId](sql/2103678542.sql); source-definition SHA-256 `e9d88fd0465a9b2502c1ded581f41f9af3eefd3e932a9f7b72178a7c81213077`, reading-copy SHA-256 `bdc04cd2a06b69859e4321248666d20781243da1a4dfbdb896e1d4536d568a1c`, one-based inclusive lines [[1, 59]].

`rs-receiving-aim`: [Receiving Process Summary: Functionality](../AIM/reading/b9c3ffa9a81498cb548bdb61d00ba2dd34e5bfb79695f24b28a31d26d9eb8369.md); AIM article `b9c3ffa9a81498cb548bdb61d00ba2dd34e5bfb79695f24b28a31d26d9eb8369`, original SHA-256 `b34355dc06ff7bda053191f657f72735d152012a6fe33cee1a2f714c9453d8b2`, nodes n65.

</details>

<a id="locating-rule-lookup"></a>

## Understanding locating rule retrieval

The locating-rule helper returns a matching rule header, including inactive headers. Locating itself selects storage destinations through rule sequences and strategies; additional processing creates and performs putaway work.

### How it works

1. Find the exact rule name and return its header columns.

### Settings and prerequisites

- For the documented pre-locate path, both Delayed Locating and Create Putaway Work must be enabled in the applicable receiving preference.


### Limits

- Rule assignment and strategy execution are outside this header lookup.


<details>
<summary>Technical reference and sources</summary>

`rs-batch-1175323597`: [dbo.wm_RLocatingRuleHeader01](sql/1175323597.sql); source-definition SHA-256 `ed9b72e6316f9cf56f69035b4fdd6c5bde7f8b8ae802d74bd533167bdb502dc4`, reading-copy SHA-256 `9037fc534df0ef023708507d2628bf752b18614d9263bb469740dfce3e512660`, one-based inclusive lines [[1, 16]].

`rs-locating-aim`: [Locating Process Summary: Functionality](../AIM/reading/4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa.md); AIM article `4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa`, original SHA-256 `e215745a6d81b87363e12c8d05d0ac51d7b6337430ce4b448bc6edcedf67b24a`, nodes n64, n102, n105, n113.

</details>

<a id="status-action-resolution"></a>

## Understanding action-to-status mapping

The status helper maps an action to a configured system-status identity, then finds its numeric status within the requested functional area. It returns NULL when a mapping is missing. It does not decide whether a particular transaction may take that action.

### How it works

1. Select the action mapping for the chosen configuration branch.
2. Match system status within the supplied functional area and return the numeric status.

### Settings and prerequisites

- Check both mapping layers and functional area through an approved configuration review.
- No custom-flow, active, user or warehouse scope is applied here.


### Results

- Scalar numeric status or NULL; duplicate matches lack deterministic selection.


<details>
<summary>Technical reference and sources</summary>

`rs-batch-2113754933`: [dbo.STSfn_RtrvStsForAction](sql/2113754933.sql); source-definition SHA-256 `d29a4028a34493427fb0a94cb5cc3bfae2009ea854346fd9ddb41a21bfa243e6`, reading-copy SHA-256 `554a8cd67dceb9ecaa61f3ce2864629bce9628df5e8a8a7e53de3fd3194ed2ac`, one-based inclusive lines [[1, 49]].

`rs-status-aim`: [Status Process Summary: Functionality](../AIM/reading/5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d.md); AIM article `5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d`, original SHA-256 `2cc05e7c1cef1d68ccd7fc8901c12905c61f6b49b9e3d4d1a3ae28f3a0f59119`, nodes n63, n74, n80, n89, n190.

</details>

<a id="awr-wave-membership"></a>

## Add, remove and transfer shipment wave membership

These helpers update wave membership, selected statuses and stamps. Add assigns pending status to the header but raises detail status only when lower. Transfer leaves statuses unchanged. Remove resets wave number to zero and changes only matching pending detail statuses. None performs inventory allocation or work execution.

### How it works

1. Single-shipment and whole-wave helpers have different predicates and error coverage.
2. Statements are separate and no body-owned rollback makes them atomic.

### Settings and prerequisites

- Caller supplies wave/status values; timezone helper controls status dates.


### Limits

- PREVIOUS_WAVE_NUM is assigned destination by add/transfer; it is not a reliable prior-wave history here.


<details>
<summary>Technical reference and sources</summary>

`awr-batch-254272311`: [dbo.WAVE_AddShipment](sql/254272311.sql); source-definition SHA-256 `5085fbe586aaa6405f4da485d05e9b932062cf6c01d8af88331711e0e63340a3`, reading-copy SHA-256 `98713bd8ec243afa861446d6a031047579ae3961a77b67c00e76862fc578a8c4`, one-based inclusive lines [[1, 49]].

`awr-batch-286272425`: [dbo.WAVE_RemoveShipment](sql/286272425.sql); source-definition SHA-256 `95fd900f2a9e8ce53bb8861437e9adf836131f2a7516f01ecec9f099915f2431`, reading-copy SHA-256 `e7a828577c253f09c3310f35084e1f4866b878c5de06acad18c5aeb017040709`, one-based inclusive lines [[1, 49]].

`awr-batch-302272482`: [dbo.WAVE_RemoveShipments](sql/302272482.sql); source-definition SHA-256 `aef859b097a906558318c04830c586b10248a2596eb5878b20b31e426f28b256`, reading-copy SHA-256 `15bc982cefad1b4dcdc74a4dc182d09082d5ce9e555d00591c9637b3a1dffc94`, one-based inclusive lines [[1, 48]].

`awr-batch-318272539`: [dbo.WAVE_TransferShipment](sql/318272539.sql); source-definition SHA-256 `57275dbbc84078fd2ead5b1947ed516d75997a9659b84c83cd0fecf7a48f90f7`, reading-copy SHA-256 `c3cec44eae385a2bac38f77c3dd5323a8a7612d786aad0696150680f747285a0`, one-based inclusive lines [[1, 43]].

`awr-wave-aim`: [Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md); AIM article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`, original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`, nodes n65.

</details>

<a id="awr-wave-statistics-gate"></a>

## Wave progress and statistics refresh

A zero return value does not distinguish a rejected wave step from a completed statistics refresh. Guard rejection returns zero; the normal path also returns zero because COMMIT resets the row count. The routine updates totals and progress for selected steps, rather than running the complete wave.

### How it works

1. Warehouse read uses NOLOCK; conflict checks use TABLOCKX only for coded guarded steps.
2. Totals use shipment view aggregates; COMMIT clears the rowcount later returned.

### Settings and prerequisites

- Coded step guards and existing unit labels; effective wave master and token meanings remain external.


### Limits

- The source aggregates use NOLOCK and may not represent one consistent database state.


<details>
<summary>Technical reference and sources</summary>

`awr-batch-334272596`: [dbo.WAVE_UpdateStatistics](sql/334272596.sql); source-definition SHA-256 `546e774b431f3f8f90633d4f8168813672cee15ad0d58b0bd054df91e900fe98`, reading-copy SHA-256 `358d358cdf9e80bbd58b79b4ba5262eb446997bb3a7a898b76b5e921b78f02f9`, one-based inclusive lines [[1, 56]].

`awr-batch-350272653`: [dbo.WAVE_UpdateStatistics01](sql/350272653.sql); source-definition SHA-256 `957b07c6d47fae96c4edb9b81e167c9727803d9b737a46da23b05c79d3ca4da5`, reading-copy SHA-256 `8026bb16d0256cfa3e34753d399d1fa40e29b8acd464d549daaf8602e16aa194`, one-based inclusive lines [[1, 88]].

`awr-wave-aim`: [Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md); AIM article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`, original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`, nodes n65.

</details>

<a id="awr-wave-dialog-selection"></a>

## Wave dialog seeds and active-wave list

The reviewed bodies only return dialog context. NewWave variants project one row; BuildWave projects constants once per master row. The active-wave list checks last-step NULL/empty and warehouse, not whether a process is currently running.

### How it works

1. No wave INSERT or execution call is present.
2. Last-step emptiness is the entire reviewed active predicate.

### Settings and prerequisites

- Transfer defaults to N only when omitted in GetNewWave; explicit NULL is preserved.


### Limits

- Dialog save/run and permissions remain external.


<details>
<summary>Technical reference and sources</summary>

`awr-batch-421224901`: [dbo.MetaTrans_BuildWave](sql/421224901.sql); source-definition SHA-256 `4a8182bb2d955c507e5f2070c1987b1aa49247658832433d444a451deb528f9c`, reading-copy SHA-256 `84cef4b66e9066dbf4d14640b889b32ef010c53becf0707af9e099d13978e300`, one-based inclusive lines [[1, 18]].

`awr-batch-885226554`: [dbo.MetaTrans_GetNewWave](sql/885226554.sql); source-definition SHA-256 `71e56a3f5c38594da551d713c52c218cc72913048962dcd8e6b0c5aa64c92ef1`, reading-copy SHA-256 `0012ba65a4622ba563c1ab0a8bd37f358c15b6d18e087ee48389f89724672730`, one-based inclusive lines [[1, 29]].

`awr-batch-916198314`: [dbo.MetaTrans_NewWave](sql/916198314.sql); source-definition SHA-256 `095a6540c74ba5691234b6594e44c3749af017404a644d53e7ddbaef88832942`, reading-copy SHA-256 `b733884bdf89d5f58d4785f71dc7da49e12c6b1f500ed1450adbc295ef229fc2`, one-based inclusive lines [[1, 25]].

`awr-batch-277224388`: [dbo.MetadataTransActiveWavesForWarehouse](sql/277224388.sql); source-definition SHA-256 `dbd1ce664938e31bece6068a01994f58493948727f58782cbc9c3ab45f4e6b42`, reading-copy SHA-256 `078f574b4af65d9ecb99e380d1a95a950fc80cf8a5c335a065148bfb29808400`, one-based inclusive lines [[1, 20]].

`awr-wave-aim`: [Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md); AIM article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`, original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`, nodes n65.

</details>

<a id="awr-completion-status"></a>

## Completion status helpers

Each helper changes only its specified entity. Container/detail setters accept the supplied status directly. Header setters preserve each NULL/zero/negative status input but accept any positive input, including a lower status. Load progression uses separate asymmetric comparisons.

### How it works

1. Container/detail/header/load writes are independent calls.
2. Load leading rises; trailing may fall or rise from old<=201.

### Settings and prerequisites

- Caller status values; warehouse timezone for header status dates.


### Results

- Entity status/stamp writes only.


### Limits

- No validation of a full allowed transition, quantity-history shift or whole-wave completion.


<details>
<summary>Technical reference and sources</summary>

`awr-batch-1276179942`: [dbo.CompleteWave_UpdateContSts](sql/1276179942.sql); source-definition SHA-256 `97bd0b58fc5926cb79c1d43f8e7ee7ea176c8dd88c28cf914e0249547d4ac2b2`, reading-copy SHA-256 `28ea81593bbdc47d8b840e297ad407494b3d430a7927a1567255400ada249ac8`, one-based inclusive lines [[1, 23]].

`awr-batch-1292179999`: [dbo.CompleteWave_UpdateDtlSts](sql/1292179999.sql); source-definition SHA-256 `23d06bf0905e956c006823e38c421886e3dc31f039f4a1e1d169b379b2f7082c`, reading-copy SHA-256 `076603d6073ca9c7cdfa326726c4df77482142976e66645e73d62409e19aecb4`, one-based inclusive lines [[1, 24]].

`awr-batch-1308180056`: [dbo.CompleteWave_UpdateHdrSts](sql/1308180056.sql); source-definition SHA-256 `aa0fed67b4db0541e6ca62f8dd17f37d2910dce20e19d0d0aea28298f3b4dbc7`, reading-copy SHA-256 `e1bc1e7760c9c2e8c25c2ca71e2aa01e69e9371bce443b51871f2bea7d661022`, one-based inclusive lines [[1, 54]].

`awr-batch-1356180227`: [dbo.CompleteWave_UpdateShipLdSts](sql/1356180227.sql); source-definition SHA-256 `00dda8667f322b7be40135d54e7db90d10187a2e443de2f513bdc41b56273999`, reading-copy SHA-256 `33ef3191963ae79f10b57d789626dafb99df5a75b998b78a8fc062def77b723d`, one-based inclusive lines [[1, 37]].

`awr-wave-aim`: [Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md); AIM article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`, original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`, nodes n65.

</details>

<a id="awr-order-open-quantity"></a>

## Order condition and open quantity

The detail helper replaces OPEN_QTY using eligible status slots from the supplied wave and matching order/ERP line. The order-header helper separately writes a supplied condition.

### How it works

1. First status must meet release bound; included slots are released<=status<shipped.
2. Separate procedures have separate effects.

### Settings and prerequisites

- Caller supplies status bounds, wave and condition.


### Limits

- Other waves and header/line consistency are not automatically reconciled.
- A NULL quantity in an included slot makes that shipment row contribution NULL. SUM ignores that contribution; if all contributions are NULL, OPEN_QTY can remain NULL.


<details>
<summary>Technical reference and sources</summary>

`awr-batch-1324180113`: [dbo.CompleteWave_UpdateOdrDtlCond](sql/1324180113.sql); source-definition SHA-256 `2b50f05d8e8fee884c5c3dfd29d6c3bac9837ebe5443d5e7d769aee955a430a6`, reading-copy SHA-256 `b5dce494366abfcc2734de0791fbee747c75861e1c8cb67a3624cd9179ae8586`, one-based inclusive lines [[1, 47]].

`awr-batch-1340180170`: [dbo.CompleteWave_UpdateOdrHdrCond](sql/1340180170.sql); source-definition SHA-256 `43f25720c05a71f2eccdc88388d1822814425c0108d9a9fecaed70fb154cfed4`, reading-copy SHA-256 `e2b4af66378327687a5f34123e503468e68f934e15b3107a03915a3ad9a3d1e8`, one-based inclusive lines [[1, 30]].

</details>

<a id="awr-cancel-replenishment"></a>

## Replenishment cancellation quantities

Replenishment cancellation removes matching instructions, subtracts source allocated and destination in-transit quantities, and calls history helpers within a transaction. A later rollback can retain a zero return code from the first successful history call, so zero alone does not confirm cancellation. The destination lookup uses the request source warehouse.

### How it works

1. Source uses TOP 1 without order or captured-quantity equality guard.
2. Destination uses FROM_WHS/TO_LOC and equality guards; later rollback can retain error variable zero.

### Settings and prerequisites

- Typed request/work-created exclusion and null-safe identity predicates.


<details>
<summary>Technical reference and sources</summary>

`awr-batch-988178916`: [dbo.CancelWave_DeallocationOfRepReq](sql/988178916.sql); source-definition SHA-256 `6fb6dc36455306494a92c644a7e863b69098bd54cfb5715c920cb6d46cbc8260`, reading-copy SHA-256 `ebda03e703ec6002f5089f4de170ea826e869e8ff12073e97c88abdd75be220c`, one-based inclusive lines [[1, 153]].

`awr-batch-142271912`: [dbo.TranHist_RepDeallocation](sql/142271912.sql); source-definition SHA-256 `dae0a7dc9b51e00703d2d9e50886e69a11fa817a02b783f391bbf514111b106d`, reading-copy SHA-256 `267465b2544a653b253820b4c9e78452950869c81f56e55f0070c74014876b60`, one-based inclusive lines [[1, 71]].

`awr-replenishment-aim`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138.

</details>

<a id="awr-cancel-loads"></a>

## Wave cancellation load and history helpers

The load-status helper aggregates only shipments outside the wave and updates load statuses only when both aggregates are positive. With none remaining, it keeps old load statuses, then detaches matching wave headers. The history-named snapshot helper only returns data; separate helpers perform persistence.

### How it works

1. Shipment order-header child calls are sequential; load aggregates exclude the supplied wave.
2. No-remaining aggregate does not reset load statuses; snapshot helper does not INSERT history.

### Settings and prerequisites

- Caller wave and snapshot direction; current other-wave statuses.


### Limits

- No complete atomic cancellation or history persistence proven.


<details>
<summary>Technical reference and sources</summary>

`awr-batch-1004178973`: [dbo.CancelWave_UpdateOrderHeader](sql/1004178973.sql); source-definition SHA-256 `fa314e580bba0716ed949e0a5d3141b67703310b304f1625283c83289e9975fe`, reading-copy SHA-256 `4c4b6ab7e27a4b9286b12f2150cbd04589c2fd668574656ca257082c648b0c63`, one-based inclusive lines [[1, 48]].

`awr-batch-1020179030`: [dbo.CancelWave_UpdateShipLdSts](sql/1020179030.sql); source-definition SHA-256 `0a4d386b576546d885594a0a39c94e15543631e4aec0d134ff70994107bb89f7`, reading-copy SHA-256 `a235ff8adf4c9e93b36f33b94731d69df3337b6adc6ba3be731de055b1719f13`, one-based inclusive lines [[1, 62]].

`awr-batch-1032703077`: [dbo.HIST_LocationInvForCancelledWave](sql/1032703077.sql); source-definition SHA-256 `838a2eae3be7a624d931fabac5e7191d89686bc9cf66f35b75da896a9d13322f`, reading-copy SHA-256 `c09a4a805b07c76023645304cc78e12fe5210c909404b0c73809f6ee3ee88315`, one-based inclusive lines [[1, 58]].

`awr-wave-aim`: [Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md); AIM article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`, original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`, nodes n65.

</details>

<a id="awr-allocation-conversion"></a>

## Allocation unit conversion selection

The body chooses integer conversion candidates and maximum unit sequence, with item-class fallback only when no item-specific units exist. Its outer join does not carry the grouped allocation ID back to the target, so deterministic per-request largest-pack selection is not established from this body.

### How it works

1. Item-specific existence suppresses class fallback; conversion factor is used as a divisor.
2. Factor/item/company/class joins and sequence selection update wave requests.

### Settings and prerequisites

- UOM factor, sequence, item/company/class records and coded NULL sentinel.


### Results

- Converted quantity/UM and dimensions, not new inventory reservations.


### Limits

- No divide-by-zero guard or demonstrated uniqueness of multiple matching candidates.


<details>
<summary>Technical reference and sources</summary>

`awr-batch-1834801944`: [dbo.ALC_UpdateShipAllocReqFP](sql/1834801944.sql); source-definition SHA-256 `685ea5d76caaa726566fb586f62e549fc12b192be11a3fcf3e9f5d51a9401956`, reading-copy SHA-256 `04f74553073971af9cd383ea7375c6cbe1ab33c0582ef70ae70f6a0e98e60838`, one-based inclusive lines [[1, 142]].

`awr-allocation-aim`: [Allocation Process Summary: Functionality](../AIM/reading/a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3.md); AIM article `a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3`, original SHA-256 `4bb0846eaeda14b5bf3a42ee4d3887811eb92d8143191fcdfba8c732c51c2043`, nodes n67, n69, n71, n73, n75.

</details>

<a id="awr-allocation-split"></a>

## Allocation split and destination association

The split first reduces the source, then copies a new request through a destination-location join. It has no local transaction or input-bound checks. A missing destination can leave the source reduced with no new row. Equal/full split can expose division by zero in the second statement; output uses session-wide @@IDENTITY.

### How it works

1. Insert reads the updated source and destination metadata.
2. Destination change and container allocation relink are distinct calls.

### Settings and prerequisites

- Destination LOCATION in allocation TO_WHS supplies templates/zone.


### Limits

- No stock movement or atomic caller sequence proved.


<details>
<summary>Technical reference and sources</summary>

`awr-batch-1388180341`: [dbo.DAS_SplitAllocsAcrossToLocs](sql/1388180341.sql); source-definition SHA-256 `a54fbb3485e5009b6fc342a3270b133864502b3ba9b8c403bbd28506b0a19299`, reading-copy SHA-256 `61dfbb007648170cefd1052c9b49f50ae8eabba8451fbe66384cf9ac2af81718`, one-based inclusive lines [[1, 85]].

`awr-batch-1404180398`: [dbo.DAS_UpdateAllocsToLoc](sql/1404180398.sql); source-definition SHA-256 `ed11d74cd227bec11106124017cbdd2454c10f079951f7154babaff004ccf137`, reading-copy SHA-256 `a527bc32567208f0db3b03322552712a641464e33d1f204d7cf5715405f4ff9a`, one-based inclusive lines [[1, 41]].

`awr-batch-1420180455`: [dbo.DAS_UpdateContsAllocNum](sql/1420180455.sql); source-definition SHA-256 `dac698b94e0927381f3c11bb224aca047fc5a974334f04a1e224d4a3c6e100cc`, reading-copy SHA-256 `ffb6ed3845e8400798570d52d8201e9fb387c8840d38ce40735d9059c2b152f7`, one-based inclusive lines [[1, 32]].

`awr-allocation-aim`: [Allocation Process Summary: Functionality](../AIM/reading/a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3.md); AIM article `a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3`, original SHA-256 `4bb0846eaeda14b5bf3a42ee4d3887811eb92d8143191fcdfba8c732c51c2043`, nodes n67, n69, n71, n73, n75.

</details>

<a id="awr-capacity-precedence"></a>

## Replenishment capacity fallback

Replenishment capacity is returned through maximum quantity, minimum percentage and unit-of-measure output parameters. Their incoming values affect fallback because the routine does not initialize them. Default substitutions apply only to a matching configuration row; no match can leave the incoming values unchanged.

### How it works

1. Specific location includes warehouse; type query does not.
2. Company-NULL/class fallbacks depend on current output state.

### Settings and prerequisites

- Incoming output values, item/class, location/type and company candidates determine which fallback is reached.
- Item/location, item/type and class queries use different warehouse scopes; matching company rows have no defined order.


### Results

- Capacity settings through output parameters.


### Limits

- Capacity settings do not measure available stock or determine the final replenishment quantity.


<details>
<summary>Technical reference and sources</summary>

`awr-batch-23319493`: [dbo.INV_RtrvRplnLocCapacity](sql/23319493.sql); source-definition SHA-256 `a823a0b517a7ca1932ac889954c9a67e143fc42558304c36b8e4897c2ac76ecb`, reading-copy SHA-256 `43396e6c7991646988e2f6da79d277b3b24d29a13de5bb00f596bc96abdafb50`, one-based inclusive lines [[1, 106]].

`awr-replenishment-aim`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138.

</details>

<a id="awr-mark-replenishment"></a>

## Marking a location for replenishment evaluation

The procedure sets RPLN_EVALUATION=Y only through the real-time-enabled branch and requests process history. It does not allocate product, create a replenishment request, create work or move stock. Vendor documentation makes subsequent work creation depend on wave steps and replenishment-master method.

### How it works

1. Already-marked, newly-marked and ineligible branches set message outputs.
2. Localization and history helper calls do not establish downstream execution.
3. Those helpers only set WORK_CREATED=Y.

### Settings and prerequisites

- REAL_TIME_RPLN, RPLN_EVALUATION, culture, replenishment master and configured work-creation wave step.


### Limits

- No rowcount proof in mark output and no return capture from history.


<details>
<summary>Technical reference and sources</summary>

`awr-batch-197224103`: [dbo.MarkLocationforReplenishment](sql/197224103.sql); source-definition SHA-256 `87af8736b8b290e6ae49bbe1a464b892fe2c8db6744345f90660eb1dae6b5504`, reading-copy SHA-256 `9679de63cd615ef991516e9773f4585ae32206e2750c961ea4bf9d47f7da03f6`, one-based inclusive lines [[1, 81]].

`awr-batch-1162799550`: [dbo.WRK_UpdateAllocWorkCreated](sql/1162799550.sql); source-definition SHA-256 `c6c22ac326a03b9d18165f964a319d0b15c6c8deba7cbe7a54884174f8f34e75`, reading-copy SHA-256 `8759b02229458138516896a52d9044058ea11f3462af8d84d6842eff87dd381a`, one-based inclusive lines [[1, 17]].

`awr-batch-1258799892`: [dbo.WRK_UpdateReplenWorkCreated](sql/1258799892.sql); source-definition SHA-256 `d8bb925f1b0d1ceae3817e7152e25370e5d59620007f7267828f8a77653eaa1d`, reading-copy SHA-256 `cc0ae15c67f2e91cc68843f1d91b8670f7ec31c23bfcec96087b1ca80fe9f6d6`, one-based inclusive lines [[1, 17]].

`awr-replenishment-aim`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138.

`awr-work-aim`: [Work Process Summary: Functionality](../AIM/reading/76770f4602f9b9e52b4fce3fb8973ffa25b3e882ead4fd0e2faea14766f877a3.md); AIM article `76770f4602f9b9e52b4fce3fb8973ffa25b3e882ead4fd0e2faea14766f877a3`, original SHA-256 `8fe175033aa7df42a105d4f6f4761a35c333680abae209074c8a16c16cad10e6`, nodes n65.

</details>

<a id="awr-replenishment-split"></a>

## Replenishment split orientation

The original request retains the supplied quantity. The inserted request gets old minus supplied, and the separately supplied instruction is linked to the new request. No upper bound, instruction association check or local transaction guarantees a valid atomic split.

### How it works

1. Copy the original request into a new row, retaining its original value and timestamp fields.
2. Update the two request quantities and link the supplied instruction in subsequent statements; the helper has no local transaction spanning them.

### Settings and prerequisites

- Caller quantity, original request, instruction ID and current request conversion quantities.


### Limits

- No automatic instruction quantity adjustment or physical stock transfer.


<details>
<summary>Technical reference and sources</summary>

`awr-batch-1130799436`: [dbo.WRK_SplitReplenishmentRequest](sql/1130799436.sql); source-definition SHA-256 `288fe4e78fb6b6e2018a6b91b6e5e1130c6102b8993bdab8ffbd89769e295173`, reading-copy SHA-256 `8c90a5e42ea4e71a65660da82fb8c75cd08ade333e45fc62aaa31be151ff9798`, one-based inclusive lines [[1, 190]].

`awr-replenishment-aim`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138.

</details>

<a id="awr-replenishment-counts"></a>

## Replenishment counts and projections

The replenishment count combines two count rows with UNION, so equal counts collapse. Its joined branch may count several instructions for one request. The detail pane and request view use different row scopes.

### How it works

1. Marked/uncreated and created/open-work predicates differ.
2. Detail and view outputs have their own granularity.

### Settings and prerequisites

- Include-marked flag defaults Y; item/company/destination and instruction conditions.


### Limits

- The request view joins inventory without attribute identity, which can repeat a request. These outputs are not guaranteed distinct-request totals.


<details>
<summary>Technical reference and sources</summary>

`awr-batch-1656705300`: [dbo.INVfn_DoOpenRplnExist](sql/1656705300.sql); source-definition SHA-256 `96bc9f1de22a1e469ce0b6cfbfb9f6925c0ce97e01d021626c25032eb926d0eb`, reading-copy SHA-256 `e77620d3a791fe8d958ca3268f5e2571ce6c60f76e938d4315f6ca1f8cb36860`, one-based inclusive lines [[1, 108]].

`awr-batch-2085230829`: [dbo.Replenishment_InsightDetailPaneData](sql/2085230829.sql); source-definition SHA-256 `f12c4f7444b1e930a8ea85c7dc6b5bc2252935f0afd990871a4b4b69d8994da7`, reading-copy SHA-256 `b766d1cd02e2a90c334acf78045964aa607159aaa860ae6d6d380ae627a509b4`, one-based inclusive lines [[1, 53]].

`awr-batch-588581185`: [dbo.REPLENISHMENT_REQUEST_VIEW](sql/588581185.sql); source-definition SHA-256 `49bf8b618c45fd917f145537aa149e784b441a25da02c9c8f335b7101ad01164`, reading-copy SHA-256 `8a039f44aea5b60f15fdc2ebb19fa7bdd1049665213de256ae82981394469eb4`, one-based inclusive lines [[1, 37]].

`awr-replenishment-aim`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138.

</details>

<a id="awr-wave-metrics"></a>

## Stored wave metric meaning

The wave metric wrapper copies LAUNCH_STATISTICS.TOTAL_QTY, also used by TotalQuantity, into statistics storage. Rejected metrics use status-slot formulas with baseline adjustments and nullable quantity arithmetic. These values describe stored reporting calculations rather than physical completion.

### How it works

1. Interpret each metric using its stored field or status-slot formula.
2. Treat independently read metrics as separate observations; the reads do not guarantee one consistent snapshot.

### Settings and prerequisites

- Statistics field metadata, original-line baseline, numeric998/999 slot predicates and resource language.


### Results

- Stored scalar metrics or display/count result sets.


### Limits

- Whole-process duration, distinct work units and actual warehouse completion remain unproven.


<details>
<summary>Technical reference and sources</summary>

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

</details>

<a id="awr-statistics-store"></a>

## Statistics read and save contracts

The getter preserves a non-NULL incoming output when no value row matches, then replaces only NULL with zero. Missing field metadata raises severity18. The saver first reads a row ID then updates or inserts; no local transaction or uniqueness guarantee on field/source key makes it an atomic upsert.

### How it works

1. Missing metadata raises an error before value access.
2. Getter output retention differs from a universal default; saver uses a separate existence read.

### Settings and prerequisites

- Named source/field records; nullable VALUE and nonnullable SOURCE_KEY/FIELD_ID in captured catalog.


### Results

- Scalar output or stored value/timestamp.


### Limits

- Captured unique index is on OBJECT_ID, not field/source-key pair; concurrent duplicate inserts are not prevented by this helper.


<details>
<summary>Technical reference and sources</summary>

`awr-batch-2033754648`: [dbo.STAT_GetStatisticsValue](sql/2033754648.sql); source-definition SHA-256 `2b187097652bf3221303daf896762acedcc800c78aeb05ad4d0cef50170ad0e6`, reading-copy SHA-256 `750620577d3d522119825e726da77f100d9b378ba2534ae5ff8d0d699cc463f3`, one-based inclusive lines [[1, 51]].

`awr-batch-2049754705`: [dbo.STAT_SaveStatisticsValue](sql/2049754705.sql); source-definition SHA-256 `b18253df77c59b847fc77747b7863f56a1090ee3e9a5fd3382843e7187134e90`, reading-copy SHA-256 `2308df3f07a595e298335163da2fb106a93bb89b0d0c68de0ff7229343526ef5`, one-based inclusive lines [[1, 81]].

</details>

<a id="awr-zero-inventory-cleanup"></a>

## Zero inventory cleanup after wave replenishment

Wave replenishment cleanup first finds candidates using company, lot and attributes. Within each candidate location, it then uses the broader location/item/warehouse identity: it retains the minimum inventory ID, deletes other rows whose four quantities are zero, and clears lot and attribute identity on a retained all-zero row.

### How it works

1. Permanent flag and request identity qualify cursor candidates.
2. Inner minimum/delete predicates omit company/lot/attributes.

### Settings and prerequisites

- Wave-linked replenishment destinations and stored inventory identity/quantities.


### Limits

- READ_ONLY applies to the cursor; the procedure still deletes and updates inventory rows.


<details>
<summary>Technical reference and sources</summary>

`awr-batch-1288703989`: [dbo.INV_LaunchCancelWithReplenish](sql/1288703989.sql); source-definition SHA-256 `102af372e49cd51071456d065963afa682a821737b65b31674c0d939a1c593f4`, reading-copy SHA-256 `ed2fe8a5b640dee867ac779ff92f01f46bff25d77f71c1856ebd85974aa73f4f`, one-based inclusive lines [[1, 71]].

`awr-replenishment-aim`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138.

</details>

<a id="shipping-print-selection-contract"></a>

## Understanding print selection and wave reprint context

Print selection returns entity context, eligible document definitions and user printer defaults. Wave reprint procedures also return context.

### How it works

1. Read the selected user printer defaults and entity context for the print-process code.
2. Match eligible DOCUMENT_TYPE slots and default flags, then apply the captured feature-dependent exclusion.
3. Hand the selection to the configured application/renderer; confirm completion separately.

### Settings and prerequisites

- Match the print-process code and entity ID with the user profile and document process/default pairs.
- Printer selection requires CLOSED N; the two reprint context getters do not.
- Manifest-close context returns flags only.


### Limits

- An unsupported process can change result-set count. Feature/document selector labels remain opaque in the public copy.


<details>
<summary>Technical reference and sources</summary>

`si-sql-901226611`: [dbo.MetaTrans_GetPrintSelectedDocuments](sql/901226611.sql); source-definition SHA-256 `3666927fec11eb02d5779ecb9683a8fd53077a15405f6587ff1b74659f4ecc13`, reading-copy SHA-256 `5e4b1a969339ecb9c4eb7ad07570b13ff9cc514233bf15e2bc889f2706dd583f`, one-based inclusive lines [[1, 300]].

`si-sql-1141227466`: [dbo.MetaTrans_ReprintWaveDocs](sql/1141227466.sql); source-definition SHA-256 `e23906cbe0481399347b52850ad52895665365ab3c9fceafb2c3826c63cd78ac`, reading-copy SHA-256 `2a9c4a205d4664eb31d5b05e2c4e1e371ce4226e52e3b8e93e62c818e5e8f0bf`, one-based inclusive lines [[1, 24]].

`si-sql-1157227523`: [dbo.MetaTrans_ReprintWaveLabels](sql/1157227523.sql); source-definition SHA-256 `9a1278b37f028a3c9eda4d3528137c42b62b791a68d17fda6cf766a7a5fcfd69`, reading-copy SHA-256 `7766e5f3b22064864bd42044700f4d547fecefd60f01de0fbe491e32bafebbbf`, one-based inclusive lines [[1, 29]].

`si-sql-1317228093`: [dbo.MetaTrans_WavePrinterSelection](sql/1317228093.sql); source-definition SHA-256 `7df8394d082c7ac31df3b5000ad6956143e8c5b6bb4d6406fa30108d35e1b543`, reading-copy SHA-256 `72bd2f5e450a76a5c3ce8d92d07acc9ab8448a00b55830b9fea1a620ceda671e`, one-based inclusive lines [[1, 27]].

`si-sql-437224958`: [dbo.MetaTrans_CloseManifest](sql/437224958.sql); source-definition SHA-256 `72f957ca0d830d9b07b195e7b591e4f940d41d7e117a440cac57d6b8662b913a`, reading-copy SHA-256 `f4fd13543fdeaf35d58f0405162b5e2d51ff59573924aab194c5ecb98dbbbcb1`, one-based inclusive lines [[1, 44]].

`si-aim-paperwork`: [Paperwork Process Summary: Functionality](../AIM/reading/55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56.md); AIM article `55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56`, original SHA-256 `f7d597f378321afb3251784f133a91d233a2f24534422bf53cfcefa420168688`, nodes n66.

</details>

<a id="shipping-label-image-contract"></a>

## Finding stored labels and label-print parameters

The label-image helper retrieves both ordinary and return-label images for an internal container number; DOCUMENT_TYPE does not filter them. The separate print-parameter helper looks up a text container ID without applying its Warehouse argument.

### How it works

1. Identify whether the request is for stored binary images or print parameters.
2. Image lookup selects returns flag Y and ordinary flag N; parameter lookup uses text container ID and fixed document/process selectors.
3. Inspect missing or ambiguous matches before attributing the result to a printer.

### Settings and prerequisites

- Multiple matching images or container IDs are assigned without a defined order.


### Results

- One result row can contain NULL values; no label is printed.


<details>
<summary>Technical reference and sources</summary>

`si-sql-968702849`: [dbo.GetShippingLabelImage](sql/968702849.sql); source-definition SHA-256 `104e0e9fdb4b3433bae8abcc1df91e5d2e9d89a4c8f3bb7ca9d3984946bbbf8c`, reading-copy SHA-256 `b930acfbbbaf54dcdcbc3f2fbd7db8235474da5324809a621f04680d2ca55fc7`, one-based inclusive lines [[1, 25]].

`si-sql-1458208345`: [dbo.TRAV_EX01_GetPrintLabelDetails](sql/1458208345.sql); source-definition SHA-256 `9ebb1fca557dc1f0a5ee388bc4b2b80a432d5c2c18f73976bd7b10e6c37b5ee4`, reading-copy SHA-256 `801dafc379a1026593c605529c9d746d5311e90d03187a4ac2985dc2b81ec775`, one-based inclusive lines [[1, 39]].

`si-aim-paperwork`: [Paperwork Process Summary: Functionality](../AIM/reading/55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56.md); AIM article `55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56`, original SHA-256 `f7d597f378321afb3251784f133a91d233a2f24534422bf53cfcefa420168688`, nodes n66.

</details>

<a id="shipping-reprint-dif-request"></a>

## Understanding queued reprint requests

The reprint routine selects non-NULL container IDs in the specified wave at status 300 and queues Ready DIF messages.

### How it works

1. Select qualifying container IDs through a cursor.
2. Concatenate each ID into a fixed message envelope and insert a Ready DIF request.
3. Require downstream processing and printer evidence to establish completion.

### Settings and prerequisites

- Routing constants and the business meaning of status 300 depend on deployment configuration.


### Results

- The success and error output parameters are not assigned.


### Limits

- There is no deduplication check; rerunning can enqueue the same request again. Earlier messages can remain after a partial failure.
- The interpolated container ID is not wrapped in an escaping function.


<details>
<summary>Technical reference and sources</summary>

`si-sql-1877178033`: [dbo.TRAV_EX01_ReprintPS](sql/1877178033.sql); source-definition SHA-256 `ef3adbf166398ee94cf47eba345fa5599f41dd1c9018e67129200e70f2cf48d0`, reading-copy SHA-256 `bf50fa0cd04470f27387bfd64645e6661e6bd390963643a9d1ca166cbf156590`, one-based inclusive lines [[1, 47]].

`si-aim-device-integration-framework`: [Device Integration Framework Process Summary: Functionality](../AIM/reading/6678efaf48f28c0a44b2e1460d2ab6c18050a333a56de1c53ba503cb274c6b60.md); AIM article `6678efaf48f28c0a44b2e1460d2ab6c18050a333a56de1c53ba503cb274c6b60`, original SHA-256 `74bb52247a8d357f0ae9e8639f45f24337864b942d0f0c28254ea313a5f68966`, nodes n65, n67, n69.

</details>

<a id="shipping-qc-context"></a>

## Understanding QC settings versus QC execution

The context routine combines user packing-preference flags, system configuration and security checkpoint values into three result sets. It does not inspect containers, assign QC, force a pass or enforce an action itself.

### How it works

1. Resolve the existing user packing preference and its NULL fallback.
2. Read checkpoint values for menu 4005 and relevant action IDs.
3. Return scalar options and two lookup lists; leave action enforcement to the consuming application.

### Settings and prerequisites

- Missing user is different from existing user with a NULL preference.
- No ACTIVE packing-preference filter is applied.
- Warehouse is passed through rather than filtering configuration.


<details>
<summary>Technical reference and sources</summary>

`si-sql-1205227694`: [dbo.MetaTrans_ShippingContainerQC](sql/1205227694.sql); source-definition SHA-256 `a8609932a94cc98e355d12ff46d95f4502a3f22b47b8a06f607467fcc66d7287`, reading-copy SHA-256 `aad03af2d2969904b5975d7ff2a5a7e7e8e584e3874ede1de2017bfb74404295`, one-based inclusive lines [[1, 86]].

`si-aim-quality-control`: [Quality Control Process Summary: Functionality](../AIM/reading/7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff.md); AIM article `7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff`, original SHA-256 `51b07421090b73e4d97f4a49f4d74557d4ca6d71bb35156614a6e641675ce7ce`, nodes n64, n87, n92, n96, n99, n102, n104, n106.

</details>

<a id="shipping-carrier-active-lookups"></a>

## Understanding active carrier and group lookup

Carrier and group lookups return an exact active carrier/service combination or an exact active group.

### How it works

1. Match the requested carrier/service or group identity.
2. Require the captured active Y flag.
3. Rating, calendars, inheritance and authorization are handled outside these lookups.

### Settings and prerequisites

- A NULL carrier service matches only a NULL service; names are exact selectors.


<details>
<summary>Technical reference and sources</summary>

`si-sql-1038275104`: [dbo.wm_RCarrier02](sql/1038275104.sql); source-definition SHA-256 `be1eac3701e5820739b90e02dca6d64a4d1de29c66c9566546719acece666968`, reading-copy SHA-256 `f71b5cbac4bfd04abebfc3d5708693bd3948ae30af0a9f48cc6d6f2471faa237`, one-based inclusive lines [[1, 19]].

`si-sql-487321146`: [dbo.wm_RCarrierGroupHeader02](sql/487321146.sql); source-definition SHA-256 `aba52ef92c08e5631757f220480e4aa17043dff1c53d7e661719e9a4ffcbca7d`, reading-copy SHA-256 `1b81939ce17c487886ce3201791234dc0b95ed894e25536b197691a851b164d5`, one-based inclusive lines [[1, 14]].

`si-aim-carrier-management`: [Carrier Management Process Summary: Functionality](../AIM/reading/0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4.md); AIM article `0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4`, original SHA-256 `6cae75f2a3d61f172808f8acc5a96ad0bc3875fc54c44c6a26bfe7d8b8ae2bd2`, nodes n65, n67, n69, n71, n73, n75.

</details>

<a id="shipping-presentation-selection"></a>

## Understanding shipment selection, consolidation, split and manifest context

The reviewed presentation procedures retrieve selected shipment data. ShipmentSelection can return multiple same-ID, same-warehouse shipments without a company predicate. Consolidate, Split and Manifesting context procedures do not perform those operations.

### How it works

1. Resolve the supplied internal shipment number.
2. Retrieve operation-specific header and line/context data.
3. Separate retrieved context from later authorized mutation, carrier interaction and confirmation.

### Settings and prerequisites

- Split context returns QUANTITY_AT_STS1 rather than the sum of all status slots.


<details>
<summary>Technical reference and sources</summary>

`si-sql-549225357`: [dbo.MetaTrans_GetConsolidateShipment](sql/549225357.sql); source-definition SHA-256 `dc13cd2686221c2b7ab530dd7bc840eef91310028ca89fb25f08754c9a73c2a6`, reading-copy SHA-256 `3c0eb5b70eb6e9ed3a7dedec067bc761802149fd9d1c69c5c97281891c2e29aa`, one-based inclusive lines [[1, 50]].

`si-sql-1173227580`: [dbo.MetaTrans_ShipmentLevelManifesting](sql/1173227580.sql); source-definition SHA-256 `659e148107d821b847008f1c270a55c738e60440b1c544412db5ee213ae3aed3`, reading-copy SHA-256 `7cbd2d550140b4a15d02fd563ec97f67640d9bc12f2211eab5035bc42db6abc0`, one-based inclusive lines [[1, 48]].

`si-sql-1189227637`: [dbo.MetaTrans_ShipmentSelection](sql/1189227637.sql); source-definition SHA-256 `ed972bb85579a24ea077e2c866d43a4dca97191478e7f18fb8de3a628e7bf383`, reading-copy SHA-256 `87e02bfb47b9ffc5544cfbc4b8f95847a7cd140d41eb26de0f32a792c7185723`, one-based inclusive lines [[1, 34]].

`si-sql-1253227865`: [dbo.MetaTrans_SplitShipment](sql/1253227865.sql); source-definition SHA-256 `817d4f4c313c01bbbaf3a6693802218bad55d3954dd9c630863c61309281cbf3`, reading-copy SHA-256 `cdc338b776d2f58df9224a594d8444744778020ce179ed572295b17229901c82`, one-based inclusive lines [[1, 40]].

`si-aim-packing-shipping`: [Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md); AIM article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`, original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`, nodes n65.

</details>

<a id="shipping-container-numbering"></a>

## Understanding X-of-Y container numbering

Shipment numbering assigns ordinals to identified top-level tree roots and resets identified immediate children to zero. Wave numbering invokes that helper inside one transaction per shipment; the body does not provide one whole-wave transaction.

### How it works

1. Capture qualifying shipment roots using NOLOCK and order by internal ID.
2. Assign root ordinal/total and reset identified immediate children.
3. For a wave, capture shipments and invoke the helper in separate BEGIN/COMMIT pairs.

### Settings and prerequisites

- Unidentified or deeper descendant rows are outside the explicit child-reset set.
- Ambient caller transactions alter persistence of nested COMMITs.
- Both helper membership reads and wave selection use NOLOCK.


### Results

- Stored count fields change; they do not count shipped item quantity.


<details>
<summary>Technical reference and sources</summary>

`si-sql-1825753907`: [dbo.SHP_SetXOfYForShipment](sql/1825753907.sql); source-definition SHA-256 `6138990c3d8b535c1f0f0e59e51759c1bff6453b3993d66ec98838a5853ab0e7`, reading-copy SHA-256 `b33b779388b005dc88897d324961f1cac5e94a87b1d55442c5f09b1a7c958042`, one-based inclusive lines [[1, 72]].

`si-sql-1841753964`: [dbo.SHP_SetXOfYForWave](sql/1841753964.sql); source-definition SHA-256 `59ded51ef67d4b5c9b3d47f650b92ac40138e5090e23401d16c835d16a55bd4a`, reading-copy SHA-256 `9614323a7b317198223865290dae354c3e909e35a43f7cdc5e2c58816c350d9c`, one-based inclusive lines [[1, 42]].

`si-aim-packing-shipping`: [Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md); AIM article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`, original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`, nodes n65.

</details>

<a id="shipping-container-location-flow"></a>

## Understanding container counts, location and status flow

The helpers answer different questions: a row count over selected immediate contents, one distinct location under a branch-specific scope, and one unordered non-NULL status flow from a recursive subtree. None alone proves every descendant is consistent.

### How it works

1. Distinguish row count from item quantities and distinct items.
2. Determine whether the location helper uses tree-unit rows or its direct-child fallback.
3. Treat a returned status flow as one candidate, not unanimous subtree agreement.

### Settings and prerequisites

- Location fallback applies ITEM IS NOT NULL only to its self-row arm.
- A NULL location group can contribute to the multiple-location result.
- Status-flow TOP 1 has no precedence or explicit recursion override.


### Results

- Count, location-or-NULL and zero/one flow result are separate contracts.


<details>
<summary>Technical reference and sources</summary>

`si-sql-183320063`: [dbo.SHIPCONTfn_RtrvItemContentsCount](sql/183320063.sql); source-definition SHA-256 `19c48c50d81ada0265588fba418932bfcd8f115b3642211f8888518e79b4be76`, reading-copy SHA-256 `8cd31ecdf574fb0a9e559bf3502d773c66e31f1581c9da79412749ccacbb40bb`, one-based inclusive lines [[1, 13]].

`si-sql-1585753052`: [dbo.SHIPCONTfn_RtrvCurrentLocation](sql/1585753052.sql); source-definition SHA-256 `36f5f2b97785dfde30dea9415e5435c293d5b9362509ab309441bbc5382d0510`, reading-copy SHA-256 `305665728201896ae9fb4bec8a76c789f8066ff0a60665d9b4ac868777f09b2f`, one-based inclusive lines [[1, 56]].

`si-sql-1601753109`: [dbo.SHP_GetStatusFlowFromContainer](sql/1601753109.sql); source-definition SHA-256 `398ef6bb8da32645ca2d59ca5a49321469cb3c73a6cf501da0dee841a3770c3a`, reading-copy SHA-256 `e8cb620ee625a0d6dc8569047b4f461337584b5bf0ba7b590b548f01832a6379`, one-based inclusive lines [[1, 19]].

`si-aim-packing-shipping`: [Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md); AIM article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`, original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`, nodes n65.

</details>

<a id="shipping-group-and-transfer"></a>

## Understanding shipping group and transfer mutations

These helpers have narrow and different scopes: one moves below-threshold container IDs, one transfers a detail and comments, one updates group/spot and optional names, and one clears work-linked groups. Caller orchestration must coordinate broader shipment consistency.

### How it works

1. Inspect the captured row selector and whether it is rechecked at mutation time.
2. Apply only the documented container, detail/comment or work-group changes.
3. Check broader line, allocation, header and hierarchy consistency in caller logic.

### Settings and prerequisites

- Container move captures status eligibility once.
- Group spot MAX+1 lacks a serialization protocol.
- Remove-group work joins do not repeat a warehouse restriction on every group member.


<details>
<summary>Technical reference and sources</summary>

`si-sql-1761753679`: [dbo.SHP_MoveContainersBelowStatusToShipment](sql/1761753679.sql); source-definition SHA-256 `66578467f49f16f6a0bf18f5b1e56f84e1e95cc5e860cff14c209c28223bc984`, reading-copy SHA-256 `d5fdba96869d06fa5d19ae5c771068175d7502ab3548f2eff7f6734327cea592`, one-based inclusive lines [[1, 49]].

`si-sql-1889754135`: [dbo.SHP_TransferDtlForShipDistr](sql/1889754135.sql); source-definition SHA-256 `040b0b859417adb0a6cac2b4536b8d846d3de3fd61ed07c02b510a7a714bddf6`, reading-copy SHA-256 `3b32586064dd8716a9fb81947952662531e969ebfadc46313e9198c3363d2d84`, one-based inclusive lines [[1, 45]].

`si-sql-1921754249`: [dbo.SHP_UpdateGroupPosition](sql/1921754249.sql); source-definition SHA-256 `d7c7dc4c6cbc59a4c0fc564b4b486c5ba1697b6c273f61ff4390767095d4553e`, reading-copy SHA-256 `e30e15c76228b00916e258feced6ec9d3d8e5e0b9d357ee5597088e4c49e050b`, one-based inclusive lines [[1, 80]].

`si-sql-1793753793`: [dbo.SHP_RemoveContainerGroup](sql/1793753793.sql); source-definition SHA-256 `1a284f0d2441d4d0eb4ebb4069084b82a3df94ce5be76b95bae9a88d481c5623`, reading-copy SHA-256 `dcc30cdcafc522ca49af63f228142ff1e977376c20386bf3bdf8a47596f62853`, one-based inclusive lines [[1, 68]].

`si-aim-packing-shipping`: [Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md); AIM article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`, original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`, nodes n65.

</details>

<a id="shipping-split-contract"></a>

## Understanding split quantity boundaries and output IDs

Both split helpers reject NULL or nonpositive inputs, but neither completely enforces an upper quantity bound. The allocation helper leaves requested quantity on the original and remainder on the clone; the container helper leaves remainder on the original and requested quantity on the clone.

### How it works

1. Validate source existence, positive quantity and upper bound in the caller before invoking mutation.
2. Observe each helper cloning and scaling its documented original/clone quantities.
3. Coordinate the work inside an appropriate caller transaction and handle returned IDs/errors without assuming outputs were cleared.

### Settings and prerequisites

- Missing source is not rejected by a row-count check.
- Zero source quantities can cause division by zero.
- Container parent output is assigned only in the optional parent branch.


### Results

- A bounded split storage operation whose safe composition depends on caller validation.


<details>
<summary>Technical reference and sources</summary>

`si-sql-1857754021`: [dbo.SHP_SplitAllocRequest](sql/1857754021.sql); source-definition SHA-256 `ee2756601d5c6200db2a1782b7dd1fd04289eb269c4f21e39317eab04ef783ab`, reading-copy SHA-256 `0e489448cc68859b587f4b6a0b6dd99567545f4d919ef8039d6badbd91f7548c`, one-based inclusive lines [[1, 248]].

`si-sql-1873754078`: [dbo.SHP_SplitShippingContainer](sql/1873754078.sql); source-definition SHA-256 `c36346d5d5c9638356025fcb246c39c6f703f680f6d9f6f0d1b438361a7711c9`, reading-copy SHA-256 `e3edb38119c092ab33df1377dfb5aba89e6d62b525bffffd46b6f83906129826`, one-based inclusive lines [[1, 468]].

`si-aim-packing-shipping`: [Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md); AIM article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`, original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`, nodes n65.

</details>

<a id="shipping-deallocation-history"></a>

## Understanding deallocation output mode and history

Deallocation changes inventory in both direction branches. outputMode selects whether the procedure returns captured before-state and allocation data or writes history; it does not select a preview mode.

### How it works

1. Select requests through the OR of nonzero wave and shipment selectors.
2. Deduct source allocated quantity or destination in-transit quantity and capture before/after inventory.
3. Choose output rows without history for mode 1, or insert calculated per-shipment history for other modes.

### Settings and prerequisites

- Both zero selectors select nothing; two supplied nonzero selectors broaden selection by OR.
- Source matching includes logistics unit/attribute identity; destination matching does not.
- History expiry/status calculations do not update those fields in inventory.


### Limits

- The procedure sets XACT_ABORT and rethrows errors but begins no transaction.


<details>
<summary>Technical reference and sources</summary>

`si-sql-1777753736`: [dbo.SHP_ProcessShipmentDeallocationAndHistory](sql/1777753736.sql); source-definition SHA-256 `865388ce418d98c0d9b4b18f3df6afb06012fd545bbe17bea9ae4db6b4b627ae`, reading-copy SHA-256 `f18280d27aa4363baa8792339597984ae1343cedc6ddd5def504a91b42377b99`, one-based inclusive lines [[1, 519]].

`si-aim-packing-shipping`: [Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md); AIM article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`, original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`, nodes n65.

</details>

<a id="shipping-freight-rollup"></a>

## Understanding header freight rollups

The routine sums four stored charge fields from selected manifest-state containers with a text parent-container test, then replaces header values. It makes no carrier-rating request. SQL SUM can return NULL when no eligible amounts exist; the body does not turn that into zero.

### How it works

1. Select shipment containers by captured manifest states and parent-text-ID rule.
2. Sum total/base freight, discount and accessorial amount.
3. Replace header amounts with the aggregate variables.

### Settings and prerequisites

- Container eligibility uses the manifest-state constants in the routine and PARENT_CONTAINER_ID text rather than tree-root metadata.


<details>
<summary>Technical reference and sources</summary>

`si-sql-1905754192`: [dbo.SHP_UpdateFreightCharges](sql/1905754192.sql); source-definition SHA-256 `9e0c91de8aeca9682ff71a9df755c3654ae87e2a8be4e5dbace123dc15ef044b`, reading-copy SHA-256 `17648d4f5b20ea5082715abc277f935363d4a0e5b5519cde942d638329337884`, one-based inclusive lines [[1, 48]].

`si-aim-carrier-management`: [Carrier Management Process Summary: Functionality](../AIM/reading/0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4.md); AIM article `0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4`, original SHA-256 `6cae75f2a3d61f172808f8acc5a96ad0bc3875fc54c44c6a26bfe7d8b8ae2bd2`, nodes n65, n67, n69, n71, n73, n75.

</details>

<a id="interface-configuration-selection"></a>

## Understanding interface configuration retrieval

The getters retrieve map headers/details, interface headers/details and flow-step rows. Only the detail-by-header getter explicitly orders by SEQUENCE. Flow-step retrieval does not execute a step and does not specify step order.

### How it works

1. Choose the correct key, record type, direction and mode for the requested getter.
2. Apply exact predicates or the prefix LIKE pattern.
3. Let a separately evidenced executor determine enabled steps, execution order and transport behavior.

### Settings and prerequisites

- Map prefix is not escaped as literal text.
- No ACTIVE predicate appears in the reviewed interface-detail getters.
- Map-header Mode uses numeric(9) in one variant and numeric(1) in another.


<details>
<summary>Technical reference and sources</summary>

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

</details>

<a id="interface-upload-batch-contract"></a>

## Understanding upload claims and serial staging

The batch routine updates header and linked child staging conditions and process stamps. Its claim branch can restamp rows already In Process, and downstream child scope follows the batch stamp. The serial helper inserts selected payload rows without an explicit rerun deduplication check.

### How it works

1. Claim matching-detail non-Processed headers or advance matching-detail In Process headers.
2. Update linked child records using batch-stamped parent/link selections.
3. Create selected serial payload rows; rely on separately evidenced transport/acknowledgment for delivery completion.

### Settings and prerequisites

- BatchId reuse can broaden child selection.
- NULL interface conditions fail equality/inequality filters.
- Claim result uses unordered TOP 1; later result returns all batch-stamped headers.


### Results

- Staging-state and payload changes only.


<details>
<summary>Technical reference and sources</summary>

`si-sql-410796871`: [dbo.wm_RUUploadOrderHeader01](sql/410796871.sql); source-definition SHA-256 `3876d48607c73128008c4c4cffc66ee145227e3f86e869c50e71898eb377fa9e`, reading-copy SHA-256 `490d5acf6415262167580113676971da683b26cc405a8b3b089850dde2a6dab6`, one-based inclusive lines [[1, 102]].

`si-sql-654273736`: [dbo.wm_InsertUploadSerialNumber](sql/654273736.sql); source-definition SHA-256 `8392967ca80eddb5aa46cffdda9e918cac45181532cad45c98a854b8e7bf3b51`, reading-copy SHA-256 `0e224f17a85d54d8b5ae0c563252504373ce11edfbd0d46796d98e5decf9f4da`, one-based inclusive lines [[1, 50]].

`si-aim-interface`: [Interface Process Summary: Functionality](../AIM/reading/178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e.md); AIM article `178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e`, original SHA-256 `16a5da0368ba8d3c53860134e3270982414a29c92ad4c62f1c13da24e4067a7c`, nodes n66, n68.

</details>

<a id="interface-cleanup-variants"></a>

## Understanding interface cleanup differences

Interface cleanup differs by routine: order cleanup 01 selects Processed rows and includes VAS activity; cleanup 02 ignores condition and omits VAS. Receipt cleanup deletes seven table sets by process stamp, with one appointment link-type filter. Upload cleanup removes linked details and headers.

### How it works

1. Identify the exact routine and its stamp, condition and link predicates.
2. Follow the observed DELETE order and direct row-count behavior.
3. Coordinate caller transaction, constraints and any omitted dependent cleanup before operational use.

### Settings and prerequisites

- No reviewed cleanup checks transport acknowledgment.
- Receipt cleanup deletes purchase-order header before detail.
- Upload child selection follows header link IDs, not child stamp.


<details>
<summary>Technical reference and sources</summary>

`si-sql-231320234`: [dbo.wm_DDownloadItem01](sql/231320234.sql); source-definition SHA-256 `6787be2194c61c7b821864ef1f006bbaf335dca1fe8c87740fb309c9423dd063`, reading-copy SHA-256 `c6785318233e09f12e30ef699ffa064e079bfda63c097ab8f45d27af24abfaf8`, one-based inclusive lines [[1, 15]].

`si-sql-247320291`: [dbo.wm_DDownloadOrderHeader01](sql/247320291.sql); source-definition SHA-256 `acda811f23be5b381cea02842a6c22da618ad66664fb622b26b166ed708367f1`, reading-copy SHA-256 `936705d417b9f7329c7a38597cc3059f1a7e9990e308f36e77ebfb878de53f52`, one-based inclusive lines [[1, 41]].

`si-sql-263320348`: [dbo.wm_DDownloadOrderHeader02](sql/263320348.sql); source-definition SHA-256 `aa139d7a62107feacc06198fb792f211f5b2e914693f8c106a24b68010f2e901`, reading-copy SHA-256 `96e48c7169c12896af4f1ab1acad73d85781aa29d80d69b772081f856a114fc5`, one-based inclusive lines [[1, 31]].

`si-sql-446272995`: [dbo.wm_DDownloadReceiptHeader01](sql/446272995.sql); source-definition SHA-256 `b78f2b8348ba772fde150a5b014da1bba3b449bbf27d8e89232d686d906f49af`, reading-copy SHA-256 `818454460b0aea692d6b197b6ab6d19ecb7555bbc47194cfbb56ffcc9b20dc06`, one-based inclusive lines [[1, 48]].

`si-sql-375320747`: [dbo.wm_DUploadOrderHeader01](sql/375320747.sql); source-definition SHA-256 `0967dfbd38bff6b2c24173d06e25db6cd59156fc067d8a6475ecf7a67dd2c8e8`, reading-copy SHA-256 `865eb26fda32bbacc7196b0ec7899277df36b51ed5f4b7583787a29761006fc4`, one-based inclusive lines [[1, 12]].

`si-aim-interface`: [Interface Process Summary: Functionality](../AIM/reading/178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e.md); AIM article `178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e`, original SHA-256 `16a5da0368ba8d3c53860134e3270982414a29c92ad4c62f1c13da24e4067a7c`, nodes n66, n68.

</details>

<a id="interface-errors-and-retained-views"></a>

## Understanding interface error and retained-data views

The error view projects stored error fields; the detail pane selects one stored error. Three upload views combine current and retained tables with UNION distinct over selected columns. None performs delivery, retry, archive movement or freshness checks.

### How it works

1. Use source identity and query predicates to distinguish error details from current/retained upload projections.
2. Account for UNION removing duplicate projected rows and the absence of source precedence.
3. Require independent current processing and delivery evidence.

### Settings and prerequisites

- Views have no built-in warehouse/company/process-stamp or age filter.
- Omitted processing columns may distinguish source rows that collapse in the projection.


### Results

- Read-model rows, not a processing outcome.


<details>
<summary>Technical reference and sources</summary>

`si-sql-1008058677`: [dbo.INTERFACE_ERROR_VIEW](sql/1008058677.sql); source-definition SHA-256 `7fe87cf6cc30090995bc9698ba995a8f36db3e92c260d7ec5a072d605df4b796`, reading-copy SHA-256 `fd3d58614f44b8a4eb119d4d1a9cd658e014fdd1218e58bb57a0fd9dfacf4084`, one-based inclusive lines [[1, 55]].

`si-sql-1112703362`: [dbo.INT_ErrorInsightDetailPaneData](sql/1112703362.sql); source-definition SHA-256 `1c009799b0bed787caa23dfa58c0f46fa89c1395da34bf0e638f13e9769772ce`, reading-copy SHA-256 `8a5d30ac4125a5bed42f645adcd7cea0ca399bf77b0eedca9499dd93110d12d6`, one-based inclusive lines [[1, 21]].

`si-sql-76579361`: [dbo.UPLOAD_ORDER_CONTAINER_VIEW](sql/76579361.sql); source-definition SHA-256 `e0950a014a1ea20f353ea4fe6d7b96f03bfa9153bc38b6f29d9fd105ff5fe466`, reading-copy SHA-256 `a1185d228ad5ac6848a4b311b6abd89098df531c9b5c1569a7a079641c4c8d1e`, one-based inclusive lines [[1, 14]].

`si-sql-92579418`: [dbo.UPLOAD_ORDER_DETAIL_VIEW](sql/92579418.sql); source-definition SHA-256 `645d9edd663071d91cd1fb0a2d604b888806d159a9cf78ed7cd557194806b3a6`, reading-copy SHA-256 `0c42d30f7d227cb91ce22583fb7af6006b03892ca5d4c01ba0b830470e214470`, one-based inclusive lines [[1, 12]].

`si-sql-108579475`: [dbo.UPLOAD_ORDER_HEADER_VIEW](sql/108579475.sql); source-definition SHA-256 `e1f54a42b23b4374757679fe61d6b1d84e4e7594bf5106e36e3cce1bc9ad8063`, reading-copy SHA-256 `384be9c6177aaedf538839b7d6e957496d4d99a7334b94717390ddb634036f45`, one-based inclusive lines [[1, 14]].

`si-aim-interface`: [Interface Process Summary: Functionality](../AIM/reading/178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e.md); AIM article `178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e`, original SHA-256 `16a5da0368ba8d3c53860134e3270982414a29c92ad4c62f1c13da24e4067a7c`, nodes n66, n68.

</details>

<a id="fn-security-precedence"></a>

## Security helper precedence

Security helpers use different precedence rules. fn_GetSecurityValues selects a whole User, Group, then System row. Per-form checkpoint fallback occurs only when no characters were produced, and its group query omits a level filter. The all-form helper falls back globally, so one user form can suppress defaults for other forms. SecurityPermissionEnabled instead reads Group, User, System by username and returns 1 when no string exists.

### How it works

1. Select the helper used by the calling form and apply its own lookup and fallback rules.

### Settings and prerequisites

- Form/user/group metadata and literal checkpoint Y; each function has its own lookup predicates.


### Limits

- No actual authentication, policy enforcement or reproduced bypass is claimed.


<details>
<summary>Technical reference and sources</summary>

`fn-batch-712701937`: [dbo.fn_GetSecurityValues](sql/712701937.sql); source-definition SHA-256 `22b109a4c5e256958164ca72301276d2b4c370c3428067a0d64afc343a9747ae`, reading-copy SHA-256 `d8f5363c8994a7584c0cfaa919e45fb316f63afb072e9f860a5ce897a71d9c3a`, one-based inclusive lines [[1, 25]].

`fn-batch-1537752881`: [dbo.SECfn_GetSecurityCheckPoint](sql/1537752881.sql); source-definition SHA-256 `38d14d4aeea90769186caccc3cb3c89dfed0ce8a29f18dea5fe3fc3befdd4f0d`, reading-copy SHA-256 `c4a7601977699c27104c3efe8fe21655ce4427a3e25ca945c2c830b78f1e2a05`, one-based inclusive lines [[1, 90]].

`fn-batch-1553752938`: [dbo.SECfn_GetSecurityCheckPointByUsername](sql/1553752938.sql); source-definition SHA-256 `8db1ca3222c47321dd84b941840093b4f67a2c64ff6a425f2536481484f646f9`, reading-copy SHA-256 `64451910e2e609e8ed1bbc80c24f84935405925d849d4c2165e3573299216bb0`, one-based inclusive lines [[1, 83]].

`fn-batch-1569752995`: [dbo.SecurityPermissionEnabled](sql/1569752995.sql); source-definition SHA-256 `d278b6d565114eee28d3c306f626b984abe0a930a4324f8d34a47f5d67b8792c`, reading-copy SHA-256 `3cd8783e1bf1f78e777d09764a9d7d0cb6f8a169a07198898e86c81b660b0e5e`, one-based inclusive lines [[1, 59]].

</details>

<a id="fn-zone-authorization"></a>

## Work zone predicate

The work-zone function tests whether a profile is associated with a zone. A NULL zone returns 1 even when the profile is missing. This result does not authenticate a user or establish warehouse access, instruction eligibility or permission for an action.

### How it works

1. Supply the work profile and zone; interpret a returned 1 only as the function's profile/zone result.

### Settings and prerequisites

- WORK_PROFILE_ZONE_AUTH and supplied profile/zone.


<details>
<summary>Technical reference and sources</summary>

`fn-batch-1784705756`: [dbo.IsWorkZoneAuthorized](sql/1784705756.sql); source-definition SHA-256 `bdf68f05968a32ef681c513dcd37c83f664eff76590d4f3871cd4fdb086cef21`, reading-copy SHA-256 `035a9a8e5ff73606a157d9281f451844957ddf369ea10440a3f7e84534843279`, one-based inclusive lines [[1, 35]].

</details>

<a id="fn-status-slots"></a>

## Status-slot helpers

Status-slot helpers use the supplied position order. One counts slots before the first zero; another stops at zero or 994 and above, returning the previous slot. Equality helpers return the first matching slot or quantity without summing repeated statuses. They do not sort inputs or validate transitions.

### How it works

1. Read the ten slots in supplied order and return the first stopping or matching position.

### Settings and prerequisites

- Declared defaults require function DEFAULT syntax where applicable; explicit NULL is preserved.


<details>
<summary>Technical reference and sources</summary>

`fn-batch-87319721`: [dbo.SDBfn_GetLeadingStsPos](sql/87319721.sql); source-definition SHA-256 `afc65f7aca0986bc2d0cce7c4027480bfddd8c5374d00e8f78b0c836d9763485`, reading-copy SHA-256 `75e24dc32c022b49e9ae1ef8259d6a4d7d20e7a212ea0bd93e502da409a3ff2a`, one-based inclusive lines [[1, 53]].

`fn-batch-103319778`: [dbo.SDBfn_GetPosOfSts](sql/103319778.sql); source-definition SHA-256 `7b5320a480b25dfafc3fca4f9215dfd2a3bc4b92abe58fec21f6e581641fb574`, reading-copy SHA-256 `a4febbe1bba3d81e14f75bba057704a27156923f7567c51ba6d3f7db929eb747`, one-based inclusive lines [[1, 54]].

`fn-batch-119319835`: [dbo.SDBfn_GetQtyAtSts](sql/119319835.sql); source-definition SHA-256 `88219b7cc4ed1a4e8a07c29b8e74c7d21a8b5fa8a47e02f116768f9731b3a9a3`, reading-copy SHA-256 `cec4f35d23749ea41dedc0b5bde42cb091103e5ace76558bfdb19ac3c53c9af1`, one-based inclusive lines [[1, 65]].

`fn-batch-1489752710`: [dbo.SDBfn_GetLeadingStsInRange](sql/1489752710.sql); source-definition SHA-256 `a86ef1de164c8b461f9662614540f44abae6f0a0ca8d65d011fc44c4ab7520fe`, reading-copy SHA-256 `d983babb35bd0186e33e7bd52de87bb136df6fa7c95f0e69dd67fe6ff180efbe`, one-based inclusive lines [[1, 64]].

</details>

<a id="fn-status-flow"></a>

## Status flow lookup

A non-NULL flow name selects custom-flow detail; a missing adjacent status returns NULL without falling back to the default flow. Only a NULL flow name selects the functional-area default. Direction 0 moves backward; all other values, including NULL, move forward. The name and number helpers return status mappings.

### How it works

1. Use the selected flow, functional area, current status and direction to interpret the adjacent-status result; use mapping helpers separately for names and numbers.

### Settings and prerequisites

- Custom/default configuration versus fixed text dictionaries are distinct sources.


### Limits

- No allowed-action validation or current deployment code meaning proved.


<details>
<summary>Technical reference and sources</summary>

`fn-batch-199320120`: [dbo.STSfn_RtrvSts](sql/199320120.sql); source-definition SHA-256 `35f5e751c799263ef2f7cf8051726000ec17cabf4d2220568f721020b92d2eca`, reading-copy SHA-256 `798df960ce7117d9a12671aa5b4862e86d1a4ffb5dc0f4ac4101d756def6a97e`, one-based inclusive lines [[1, 32]].

`fn-batch-2097754876`: [dbo.STSfn_RtrvAdjacentSts](sql/2097754876.sql); source-definition SHA-256 `a680fd4a640ac0e3369654f225eed7effb75ed0bbb3da182baedc833ee67ebf8`, reading-copy SHA-256 `37c643687b36d5dd0a7c222b996c4821e3723e0ee9c355e2a2eaf348f4e0b4b5`, one-based inclusive lines [[1, 80]].

`fn-batch-2129754990`: [dbo.STSfn_RtrvStsName](sql/2129754990.sql); source-definition SHA-256 `34396254e9d462224b9c832dcb07bd2dd75c8e04ade87b67e70d0c7f6a906fa3`, reading-copy SHA-256 `506d9632b31e9f2c080c0534f30d3ccac129455bfe0b613fba0995904d4123f4`, one-based inclusive lines [[1, 24]].

`fn-batch-1165247206`: [dbo.ILSStatusToText](sql/1165247206.sql); source-definition SHA-256 `ef97d9cf81e90c958da1ee40d44db209e1dfb62b9aeb9cb021c379fb8f5d477b`, reading-copy SHA-256 `c34079d4edd4433a65aa59bb8bcee7e069ce82f61949392a05117e9ad81eba2c`, one-based inclusive lines [[1, 41]].

`fn-batch-1149247149`: [dbo.ILSTransactionTypeToText_fn](sql/1149247149.sql); source-definition SHA-256 `3cfdc175880a2c18650309ac12634c2f3e5bfe6dd7b6de7f5efe4c554e77de5e`, reading-copy SHA-256 `891f9ea679937163cfc8107e227a64b4ca98d03a75fbbbbdd22864e194227743`, one-based inclusive lines [[1, 73]].

</details>

<a id="fn-timezones"></a>

## Timezone and week helpers

SCI_DST_CONVERT uses the email-matched user's default warehouse and ignores its warehouse input. SCI_DST_CONVERT_WHSE treats whse directly as a timezone name. GetWarehouseDate returns a local date. Week helpers convert to warehouse time only when the date input is NULL; week boundaries depend on DATEFIRST.

### How it works

1. Identify whether the input is a warehouse, timezone name or already supplied timestamp before applying the selected helper.

### Settings and prerequisites

- Warehouse TIME_ZONE, user email/default warehouse, session DATEFIRST and supplied timestamp convention.


<details>
<summary>Technical reference and sources</summary>

`fn-batch-984702906`: [dbo.GetWarehouseDate](sql/984702906.sql); source-definition SHA-256 `391a708682dc02899dcb31e53b122d2d7f9bdca98c0916f61ecfca5531282e85`, reading-copy SHA-256 `66af5d2ba92e0faa690d5638b023e1b44f8452846715eeab3964a2e06752e9f3`, one-based inclusive lines [[1, 21]].

`fn-batch-1185751627`: [dbo.SCI_DST_CONVERT](sql/1185751627.sql); source-definition SHA-256 `c6445858ffd6f48208975ffb8fda4416990fb9aec0ce6d5501c57dfbca1476ba`, reading-copy SHA-256 `f6a3eff734ab05e0a1902be18072c6dd12349a55ddc460c5d735bcb75a504041`, one-based inclusive lines [[1, 27]].

`fn-batch-1201751684`: [dbo.SCI_DST_CONVERT_WHSE](sql/1201751684.sql); source-definition SHA-256 `c8a2f1cad1e03c35b06cbc848a42f1c1cbc3b269bf6e4cf2e4fd4deeb1454d11`, reading-copy SHA-256 `4a9d907fcc88d07d9957fe9b24c53a23ac34f75e4fc63b9c5dd2d029f0f28d06`, one-based inclusive lines [[1, 29]].

`fn-batch-1628181196`: [dbo.DATEFn_GetWeekEndDate](sql/1628181196.sql); source-definition SHA-256 `10cb0bd397602b22ac1de255a299a6475f89fb62e46c94b5d8b6c9561588107d`, reading-copy SHA-256 `143df6dbfbcf9df86d23b63735fece17bd4ecd63d942fc582a588e149a7db9ff`, one-based inclusive lines [[1, 34]].

`fn-batch-1644181253`: [dbo.DATEFn_GetWeekStartDate](sql/1644181253.sql); source-definition SHA-256 `c8ed097a9c4ad69866b705f05a3c7d3fb41c307042948706426b80aca6f87062`, reading-copy SHA-256 `41ebc9e48b98ee047fbbcd9e63fbfadfc10090af68fcb1410188fe1195e4366c`, one-based inclusive lines [[1, 33]].

</details>

<a id="fn-date-transforms"></a>

## Date-only and fractional-second transforms

The fractional-second helper removes the millisecond component. The date helpers either remove time through string conversion, return a time on the SQL base date, or reconstruct a compact date from fixed character positions. Their return types and accepted date ranges differ.

### How it works

1. Choose the helper by required output type, then check its input format and supported date range.

### Settings and prerequisites

- SQL date parsing/session conventions; DATEONLY returns narrower SMALLDATETIME.


### Limits

- No timezone transformation in these pure helpers.


<details>
<summary>Technical reference and sources</summary>

`fn-batch-7319436`: [dbo.DHfn_TransToSQLDate](sql/7319436.sql); source-definition SHA-256 `c7acd1f3957c68bfc203ab1cbf34cf1842bd22b11dfc20aee30cf98072d18d55`, reading-copy SHA-256 `9dee7afbcf89d8cda0ab222e67641f6ea22a646f2320caf4f409dcb0f65730b8`, one-based inclusive lines [[1, 31]].

`fn-batch-2122802970`: [dbo.DHfn_GetDateNoTime](sql/2122802970.sql); source-definition SHA-256 `737f5c78ca1304fa662bc0f28f84a78817b5fb06aed53ab365b0381251c5face`, reading-copy SHA-256 `c8728c790eadc21ad0f0e4ff6f72fe79b361bb053a10767bdee7f364ecded1d7`, one-based inclusive lines [[1, 20]].

`fn-batch-2138803027`: [dbo.DHfn_RoundToSec](sql/2138803027.sql); source-definition SHA-256 `2f890b85076da91d1599c6170a149f98904f42879e281b8a994535bfc8b7f42f`, reading-copy SHA-256 `ed6170e741eac969a82c4ff64e98f3fbdaccc9ee017cb5d5a0bfaf9802e0445c`, one-based inclusive lines [[1, 19]].

`fn-batch-621245268`: [dbo.TimeOnly](sql/621245268.sql); source-definition SHA-256 `95a41b07b2549186a3598be22d484e3cd89a4dc141592abc7184d99fc6926714`, reading-copy SHA-256 `b551352bc82aaa939f4b6c3134e53e2d406c7deba12117db928bc832f3c0b1fd`, one-based inclusive lines [[1, 9]].

`fn-batch-1421248118`: [dbo.DATEONLY](sql/1421248118.sql); source-definition SHA-256 `8ed9e947bcbd240db21f0641d8244a7c82ea564acf186a0c8d67cbbfd05aaac0`, reading-copy SHA-256 `133e151229b30fb8ab68fad63826f0a5cea5b48505c846f7a876772228c1df0b`, one-based inclusive lines [[1, 9]].

</details>

<a id="fn-resource-fallback"></a>

## Resource and description fallback

Resource lookup returns empty text for a NULL or empty key. Otherwise it selects the supplied or configured language, tries custom, base and English text, then returns the key. Message lookup uses a different missing-language early return and missing-key marker. Generic description lookup falls back to the raw description only when the resource key is NULL.

### How it works

1. Resolve the language and resource source using the selected text helper.

### Settings and prerequisites

- Language system config, custom/base resource records and generic SYS1VALUE.


<details>
<summary>Technical reference and sources</summary>

`fn-batch-1089751285`: [dbo.RSCMfn_RtrvMsg](sql/1089751285.sql); source-definition SHA-256 `9a0f76e6d31142ac4462d2810bb660cfd13b029d83be4f5b32f7b0294763b612`, reading-copy SHA-256 `f146f8b0a419fda4a5f0592c24548c9b1cb2394cf5ac6a1899bd3885ba339288`, one-based inclusive lines [[1, 68]].

`fn-batch-1105751342`: [dbo.RSCMfn_RtrvResource](sql/1105751342.sql); source-definition SHA-256 `e36ed8e461c4e98a3fdf1b037ec4f4145a603dc6a3190f42079db1103680e949`, reading-copy SHA-256 `7c9d25958f7928d70de4fa85be0750c5061fdf8f1adce770b2bbda19071c55bc`, one-based inclusive lines [[1, 88]].

`fn-batch-632701652`: [dbo.DYNAMICCALLINGfn_RtrvDesc](sql/632701652.sql); source-definition SHA-256 `6b52fd3ce04820d87da9bc98996a44cf668d09a8474deebd8a24d2e8d299e30d`, reading-copy SHA-256 `4a3945ec8121fc483857a4d6b9ba9e53f88d3e5ae045bbd3ebe9f44773360798`, one-based inclusive lines [[1, 23]].

`fn-batch-728701994`: [dbo.GENCONFIGfn_RtrvDesc](sql/728701994.sql); source-definition SHA-256 `49e08a800de20112f9cdf77219920f318cf3de674e7d8bebb1e270b5cd566a93`, reading-copy SHA-256 `cf978b4558998c36dc2d801d7a55301474c000f04103acaf9e095f144899a2bc`, one-based inclusive lines [[1, 23]].

`fn-batch-744702051`: [dbo.GENCONFIGfn_RtrvTranslatedDesc](sql/744702051.sql); source-definition SHA-256 `4318d1bad662d4606d7b7192d34662cb8e9107d188c9fa9d728d89ba200e33ab`, reading-copy SHA-256 `1f3cae94eb8d23df5954411c1760ea511791c0338b9a1617f7c4fddd52864d19`, one-based inclusive lines [[1, 37]].

`fn-batch-2088706839`: [dbo.LABORCONFIGfn_RtrvDesc](sql/2088706839.sql); source-definition SHA-256 `a8760f9e5ba2e94b964b49964e816ae5bf2146ba37473d9f759028617b24cd40`, reading-copy SHA-256 `7a26922e22e0973ccecad3add524cc2bdbf5bfaf32252667e43f731b6f3ad4dd`, one-based inclusive lines [[1, 31]].

</details>

<a id="fn-available-quantity"></a>

## Available-quantity branch differences

Availability results depend on the selected function and branch. SUM branches return NULL when no rows match; the attribute-specific nonaggregate branch retains its initial zero, and multiple matches can supply one unordered value. The function excluding in-transit stock also changes parent logistics-unit, lot and filter rules, so its result is not simply the other function minus in-transit quantity.

### How it works

1. Identify the function, attribute flags and location rule before interpreting a zero, NULL or negative availability result.

### Settings and prerequisites

- showAll/includeAttributes flags, location allocate-in-transit flag, identity and optional filters.


### Limits

- Computed availability does not reserve inventory or clamp negative results.


<details>
<summary>Technical reference and sources</summary>

`fn-batch-1672705357`: [dbo.INVfn_GetAvailableQuantity](sql/1672705357.sql); source-definition SHA-256 `3cfeb39bf87e1d36c1516d7d150a8c85a3568fd20c167a87576117ecc5717943`, reading-copy SHA-256 `b24fb55c3b9ba7677438d86735943afbd54168d0e47a91906d3dbc664c44e086`, one-based inclusive lines [[1, 115]].

`fn-batch-1688705414`: [dbo.INVfn_GetAvailableQuantityWithoutInTransit](sql/1688705414.sql); source-definition SHA-256 `0dda45c21e00295cc58776454d12fab9db9d647a3cb2785c10b1e983811c40f1`, reading-copy SHA-256 `c20daeca1816f7e30d1ff931a1f0eec06ed8bd7eccf7b0ed85ca9308301326bf`, one-based inclusive lines [[1, 83]].

`fn-batch-1640705243`: [dbo.INVfn_AreInvAttributeValuesSame](sql/1640705243.sql); source-definition SHA-256 `8dd4d454c785319ebb8986929e860e007d07228e98c1de59b5b74525c2dbae19`, reading-copy SHA-256 `c67a204561da81005427972c7aea9318dbfc07b36ead546cdac42afd732842f7`, one-based inclusive lines [[1, 65]].

</details>

<a id="fn-uom-precedence"></a>

## Unit conversion fallback

The retrieval functions generally stop at the first stage with rows, and the stages differ by function. Location preference lists can fall back to unrestricted item/class units. Full UOM retrieval can fall through to storage template. Quantity conversion returns the original quantity when no complete factor pair exists, which does not prove equal units.

### How it works

1. Use the selected function's set-level fallback chain and return its unit rows or converted quantity.

### Settings and prerequisites

- Location UOM list/container tracking, item/company/class factors and storage-template details.


### Limits

- No quantity reservation or verified current configuration; zero divisors and local-return primary keys can fail.


<details>
<summary>Technical reference and sources</summary>

`fn-batch-1704705471`: [dbo.INVfn_RtrvConversionInfoForItemAndLocation](sql/1704705471.sql); source-definition SHA-256 `a67e46b48f0a27e8b3e466e306c4139b776ed85c633834ad364e224a2178b1ec`, reading-copy SHA-256 `4fd09fe0ff426d2b9c0fc4990c383c21bd09df5b8d854fb25223eb96db5644bf`, one-based inclusive lines [[1, 165]].

`fn-batch-1816705870`: [dbo.ITMfn_CalcQtyForReqUm](sql/1816705870.sql); source-definition SHA-256 `7eb9af90b6a7d7d82b9b3d83d189d054d27e8bb34c85b13052d52790365808fa`, reading-copy SHA-256 `0299d93edc38fb585f8ec11a5b4d4147f0a9334e64675e2e49abb8eb0746eb4c`, one-based inclusive lines [[1, 145]].

`fn-batch-1832705927`: [dbo.ITMfn_RtrvUnitOfMeasure](sql/1832705927.sql); source-definition SHA-256 `dc69c718e8f685a3e228648e392a91e28d6ff02a41043142ea21fb44c0bd34ae`, reading-copy SHA-256 `7cd5d4dfaa7e8b66800c0cf6c5a3b2e6c8841f874015d83b966c36a730366a93`, one-based inclusive lines [[1, 350]].

</details>

<a id="fn-item-measurements"></a>

## Item measurement defaults

INVfn_RtrvItemInfo looks up unit-of-measure measurements only when override is NULL. Any other value skips that lookup and leaves volume and weight at their zero substitutions. Both item-info helpers return one row even when item or unit lookup fails; zero can therefore mean missing data rather than a measured product value.

### How it works

1. Check the item/company and unit-of-measure rows: the base helper uses sequence 1, while the general helper uses the requested unit.

### Limits

- Location/warehouse inputs in these bodies are unused.


<details>
<summary>Technical reference and sources</summary>

`fn-batch-397244470`: [dbo.INVfn_RtrvItemInfoForBaseUM](sql/397244470.sql); source-definition SHA-256 `38f525af3c344e3503182885cb075ea92cd39f871c41c38a4a3bb90c58e4d71f`, reading-copy SHA-256 `b2a3d4fc54de140df178ebf596ff27d3484563db86165e8b52a2cf5b2c859bd3`, one-based inclusive lines [[1, 135]].

`fn-batch-1720705528`: [dbo.INVfn_RtrvItemInfo](sql/1720705528.sql); source-definition SHA-256 `cbaadbfd9f044ea64ca136f8101b49c378acc1816d88a19e457c7c857a8ea41f`, reading-copy SHA-256 `b5706d1ffe11080b76a3957270794d9bd48a46970c26a6011c5c16695f7b4edb`, one-based inclusive lines [[1, 143]].

</details>

<a id="fn-catch-weight"></a>

## Catch-weight unit sources

Catch-weight unit lookup first requires the item's catch-weight flag to be Y. It tries a supplied or resolved inventory ID, item/class base units, other inventory for that item/company across warehouses, then active generic units. Source codes identify the selected stage; a fallback weight of 1 is not a measurement.

### How it works

1. Resolve the unit source in the function's stated fallback order and return its source code.

### Settings and prerequisites

- Item catch-weight flag, optional inventory ID, UOM/catch-weight records and generic units.


### Limits

- The attribute lookup compares the inventory internal ID with the attribute object ID.


<details>
<summary>Technical reference and sources</summary>

`fn-batch-1736705585`: [dbo.INVfn_RtrvWeightUM](sql/1736705585.sql); source-definition SHA-256 `8c22595f9add252f0816620c217a97dde51ae67ff595ca89be204dd93267a0f1`, reading-copy SHA-256 `3faa8494302faeb74f33dde3c2959d419b5d3dd84450ef530fc128a8f86f8a27`, one-based inclusive lines [[1, 205]].

</details>

<a id="fn-report-text"></a>

## Bounded report text

Report-text helpers return up to 2,000 characters of varchar text and stop before appending more, without reporting how many values were omitted. Serial helpers combine current and retained tables with UNION ALL and sequence-0 template rules. Invoice, purchase-order and bill-of-lading helpers use their own DISTINCT keys. Conversion to varchar can lose Unicode characters.

### How it works

1. Identify the report helper's ordering and distinct key before treating its returned text as a complete list.

### Settings and prerequisites

- Document/comment assignments, serial templates and routine-specific ordering/deduplication.


### Limits

- The separate audit-text helper has a 30,000-character limit.


<details>
<summary>Technical reference and sources</summary>

`fn-batch-961750829`: [dbo.RPTfn_GetCommentText](sql/961750829.sql); source-definition SHA-256 `d4cd400f9b2c976a322d75b25eb889d1de9d99fe8252e24fc645095d70c9737d`, reading-copy SHA-256 `673d84c0164e9b58791ae586aff4c9cba82290af4429ad218ab1a5cc94ea4b6b`, one-based inclusive lines [[1, 74]].

`fn-batch-977750886`: [dbo.RPTfn_GetInvoiceNumberText](sql/977750886.sql); source-definition SHA-256 `84e86c7e5da3d13b48044b71b9d113e8d471a734be2c0a7f6aa4f69d75189866`, reading-copy SHA-256 `6aaf3ad83791297612d2b886057a9d0a3c63098d205d2355ffb8f3a5778b63b4`, one-based inclusive lines [[1, 59]].

`fn-batch-993750943`: [dbo.RPTfn_GetLocInvSernText](sql/993750943.sql); source-definition SHA-256 `45db181f2b4414c33a6242601aae0c29c594c314d35fbb70f5b98b20d08a70f7`, reading-copy SHA-256 `6538d56a546441646c10f40fcd6869ea5b2d10370e6e0cba93d0a37b6967a7e4`, one-based inclusive lines [[1, 107]].

`fn-batch-1009751000`: [dbo.RPTfn_GetMultiStopBOLNums](sql/1009751000.sql); source-definition SHA-256 `8185ed3a4b458f72b548e619be918c281de67bdb406106ac16a56a3072d3dabf`, reading-copy SHA-256 `6b5d7ffdabf0f3577a425601ec77c7e85f74bd2b722127322c8f1766b484fc0b`, one-based inclusive lines [[1, 61]].

`fn-batch-1025751057`: [dbo.RPTfn_GetPurchaseOrderText](sql/1025751057.sql); source-definition SHA-256 `88d146d9c2c7782997b4eb45bbd6bb0fc369b896f700e51262c9875da6d44543`, reading-copy SHA-256 `0d2756c982ee42f2d4b414f5bd40e0d90f811a3eac90f7120819c669e0e17df7`, one-based inclusive lines [[1, 59]].

`fn-batch-1041751114`: [dbo.RPTfn_GetShipContSernText](sql/1041751114.sql); source-definition SHA-256 `3c48f11888e703adc260581ed9c51c93c0dd7acad74d683ac1407d4ebd379d5c`, reading-copy SHA-256 `437e907f7bbaead0de1a9eaa24cc81f9472f9786b4882e956e735cb7af91a1fa`, one-based inclusive lines [[1, 99]].

`fn-batch-1057751171`: [dbo.RPTfn_GetUnderlyingBOLNums](sql/1057751171.sql); source-definition SHA-256 `079f1e350807585cdb7c2992eff75a08b037a0769abb21bc1c16edc9b6abd2b4`, reading-copy SHA-256 `ff3ef86c68022e867cfb2f3473b85dc71a165b72c3c8aafb78160b88cde68db0`, one-based inclusive lines [[1, 56]].

`fn-batch-631165494`: [dbo.fn_AuditLogValueReturnValue](sql/631165494.sql); source-definition SHA-256 `3cab73e11b00d439a734d07ec1e3abdff92d8cc1964e4f795f4ef827a108bfc2`, reading-copy SHA-256 `f1fd2debe8e6868e2a0e3fed8f4b3e369bb7df9998f90e3379dd09516fb41079`, one-based inclusive lines [[1, 23]].

</details>

<a id="fn-bol-expiration"></a>

## BOL ordinals and lot expiration selection

BOL stop helper returns a shipment-row ordinal when found, but can return the last stored stop sequence when not found. Multi-stop formatting counts distinct stop/BOL pairs. Lot expiration chooses the greatest object ID across current/archive, not the greatest date or an explicit live-table preference.

### How it works

1. Use the load/shipment identity for BOL selection or item/company/warehouse/lot identity for expiry selection.

### Settings and prerequisites

- Supplied load/shipment/type or lot identity; catalog source references only.


### Limits

- Tie order and current/archive authority remain unestablished.


<details>
<summary>Technical reference and sources</summary>

`fn-batch-945750772`: [dbo.RPTfn_GetBOLStopNum](sql/945750772.sql); source-definition SHA-256 `4883900dba68177f822c7d6f74d97de5e169690d8a22b704e84c605d3af01dd9`, reading-copy SHA-256 `39746dfc1fad63ccc44b42915a33302bda0e7b9e13712c5c853a997727224462`, one-based inclusive lines [[1, 78]].

`fn-batch-1009751000`: [dbo.RPTfn_GetMultiStopBOLNums](sql/1009751000.sql); source-definition SHA-256 `8185ed3a4b458f72b548e619be918c281de67bdb406106ac16a56a3072d3dabf`, reading-copy SHA-256 `6b5d7ffdabf0f3577a425601ec77c7e85f74bd2b722127322c8f1766b484fc0b`, one-based inclusive lines [[1, 61]].

`fn-batch-1229247434`: [dbo.GetLotExpirationDateForUpload](sql/1229247434.sql); source-definition SHA-256 `3bcc910cdce41cdf4c9d606da5734b81bdbed5f16f29a36024a1675c3901b19f`, reading-copy SHA-256 `d89376f4ae2db5a7d66c94e3484e4f52aa8d6a8e085361dedf1b32862d9b7280`, one-based inclusive lines [[1, 25]].

</details>

<a id="fn-suggestions"></a>

## Identifier and sequence suggestions

Identifier helpers suggest values without reserving them. Screen sequence uses MAX + 25 and can return NULL for an empty group. Project instance uses maximum + 1 across the collected tables. Work-unit naming uses a lexical maximum and padded suffix. Concurrent callers can receive the same suggestion.

### How it works

1. Treat the suggested identifier as a candidate; allocation and uniqueness enforcement belong to the caller that stores it.

### Settings and prerequisites

- Screen metadata, collected project/mapping tables, configured delimiter and existing work-unit names.


<details>
<summary>Technical reference and sources</summary>

`fn-batch-341224616`: [dbo.METAfn_GetNextScreenControlSequence](sql/341224616.sql); source-definition SHA-256 `b7a0e8192b5ef687f5fd52885994547d0e11b4fa4666f5a40d19a84fdf073492`, reading-copy SHA-256 `3175de7db0f59b7a0ecab279941cdf212922708e71c82cda0fa2338c92f46805`, one-based inclusive lines [[1, 26]].

`fn-batch-357224673`: [dbo.METAfn_GetScreenControl](sql/357224673.sql); source-definition SHA-256 `fbfe9b41b7382a7bed84fd4276f6bd32f8f9bfc86c68dba9ade8f49c7074be0a`, reading-copy SHA-256 `0c44b1f8250192c5ace16d5b9436450e14c4124044bdd1dddd2ca0d040d5a9b4`, one-based inclusive lines [[1, 32]].

`fn-batch-373224730`: [dbo.METAfn_GetScreenGroup](sql/373224730.sql); source-definition SHA-256 `88d4d99722714b43b16eab68a970c286029283e12af633c6e6e5a0b6af3d4d80`, reading-copy SHA-256 `7e06a28402de584f802b0e9834fd18d5a110880482b668d5af68252ac29fa3c5`, one-based inclusive lines [[1, 35]].

`fn-batch-936702735`: [dbo.GetNextProjectInstance](sql/936702735.sql); source-definition SHA-256 `cecd2d678b1f0eb3568e59107ea98d25955de432d18822d3583999b65241e7e3`, reading-copy SHA-256 `e8ae23a7bfb8e002bc9363bc620f9c8ef3b4d7b3728c8e8113cb7b724631a6dc`, one-based inclusive lines [[1, 25]].

`fn-batch-1386800348`: [dbo.WRTRV_RtrvUniqueWorkUnit](sql/1386800348.sql); source-definition SHA-256 `8e8418583ade26a090653e5264ac89042f31557b6b3615a1ef0225c1ab72e259`, reading-copy SHA-256 `9b3b5f343d15a7c27bd88f1a9ffad44ef2d349cf0b209b9ff361e5671f2e31f9`, one-based inclusive lines [[1, 71]].

`fn-batch-1244179828`: [dbo.CdGetIdentityColumn](sql/1244179828.sql); source-definition SHA-256 `f3a33830c50db730ebe148a04b4b36fe281fe29850b0c0589e1bfe97fed176ae`, reading-copy SHA-256 `21215e3939eaa73443c8f0940fbeb9700c4dbbaef3b79e205ce2329b7cd11322`, one-based inclusive lines [[1, 35]].

</details>

<a id="fn-string-xml"></a>

## String and XML transforms

Split IDs use ROW_NUMBER over no meaningful ordering, so original order is not guaranteed. List modifiers parse unescaped constructed XML, deduplicate additions, remove matching tokens and extract nvarchar100 values; they do not preserve original order or arbitrary XML-sensitive content. Endpoint/key-value XML helpers format data without calling an endpoint.

### How it works

1. Apply the selected split, list-modification or XML-formatting operation to the supplied values.

### Settings and prerequisites

- Separators, fixed XML namespace/path/wrapper and database collation.


### Limits

- Not general CSV, XML schema validation, URI encoding or remote execution.


<details>
<summary>Technical reference and sources</summary>

`fn-batch-760702108`: [dbo.GENfn_SplitString](sql/760702108.sql); source-definition SHA-256 `9eef7558ae3df7ac8e7eb8ea98c4ac3a2f8eb8878f9364166898561430605f0d`, reading-copy SHA-256 `be36fb3ce73fe73a074c709ca5a39936c32c4bd36904deeb01fcfd98f3e03a9d`, one-based inclusive lines [[1, 24]].

`fn-batch-1349228207`: [dbo.ModifyCharacterSeparatedStringList](sql/1349228207.sql); source-definition SHA-256 `8f8c897ba1881f701dd1594b2d5def358ce58f36c9b3ca94288de4a52f24968b`, reading-copy SHA-256 `10206e05fa7e7da53011045400dc9012b8ba7a0aafcd4583517c662056cf6118`, one-based inclusive lines [[1, 75]].

`fn-batch-1365228264`: [dbo.ModifyCommaSeparatedStringList](sql/1365228264.sql); source-definition SHA-256 `bf5550bdde12e2114cb02e2cdfda8bf46e31b7cfd3401a1c5615bbb2f0e40375`, reading-copy SHA-256 `4af9be2299d23a2c7e0492778b21b37b5c4b0443502b4dd5d541bcd1f0ba7210`, one-based inclusive lines [[1, 77]].

`fn-batch-824702336`: [dbo.GetActionEndPointXMLValues](sql/824702336.sql); source-definition SHA-256 `aaa84df8df4ebd73f7d3746866e07e382a7e24f827ce19ab2f8cb85a3e13f206`, reading-copy SHA-256 `813aafb655dd5526e29c00781b0f8935e1c9b761d4837e97b972086c88745897`, one-based inclusive lines [[1, 61]].

`fn-batch-1372180284`: [dbo.ConvertKeyValueTableToXML](sql/1372180284.sql); source-definition SHA-256 `a39cbf1ab04f459d9b6b140d6f1aaa7b404dce6998366cde6b6300adafc1e7ff`, reading-copy SHA-256 `6cc2941847bc473fa490d7beffda96dea43b2289eca4269cb29d300a1217a8d3`, one-based inclusive lines [[1, 22]].

`fn-batch-536701310`: [dbo.DBHfn_TransDOToDBFieldName](sql/536701310.sql); source-definition SHA-256 `14aed26faca168301b0b5fb5451f2b1e2d11af8f0099c14f9d3614c749bdd613`, reading-copy SHA-256 `7f01e7c3e1343ede5eeeae6b965b19fcbd8dc496267b5410c5934f54434e5fbe`, one-based inclusive lines [[1, 61]].

`fn-batch-167320006`: [dbo.SHfn_LastIndexOf](sql/167320006.sql); source-definition SHA-256 `59a0108114922ebb6d6adb9cc5734b2653314fde7d2ff6ef58087471824a0af3`, reading-copy SHA-256 `e993837bbab916348402720bc453587024822c5decc3dbf08b7c78f6d75f1c35`, one-based inclusive lines [[1, 37]].

`fn-batch-94271741`: [dbo.TpmOrderContainerStatus_TrackingLink](sql/94271741.sql); source-definition SHA-256 `d0826d82c2802381d7c8682899a875594ac29238df897731e82d9e526fc358ec`, reading-copy SHA-256 `4764cebe0c5829f3da03b13b2a8fdc8064dcb61796741f83f5649f7bc2fd0e12`, one-based inclusive lines [[1, 13]].

</details>

<a id="fn-checkdigit-extrema"></a>

## Small numeric transforms

The check-digit formula is 10 minus the weighted sum modulo 10. A zero remainder, or missing or empty concatenated input, returns 10. The decimal least/greatest helpers retain NULL when the first argument is NULL even if later values exist. Their default decimal scale does not preserve arbitrary fractions.

### How it works

1. For decimal comparisons, check the first argument and declared precision/scale; for the check digit, interpret 10 as a possible formula result.

### Settings and prerequisites

- Fixed source arithmetic/patterns; no external labeling-standard certification.


<details>
<summary>Technical reference and sources</summary>

`fn-batch-101223761`: [dbo.LBLfn_Checkdigit_86_BarnesAndNobles](sql/101223761.sql); source-definition SHA-256 `77acd09cc8c2fc65e385a44ce1225a427614f4701a0444a1ca24114435bcb2c9`, reading-copy SHA-256 `4210f5a09d6685c0c49b5d78fe7b906ceff839d55309bc784475cd8708baac38`, one-based inclusive lines [[1, 60]].

`fn-batch-1277247605`: [dbo.fn_least](sql/1277247605.sql); source-definition SHA-256 `06ddca556ab179f1ce48ef26d81f426a92a02a5a99184ec20d84400519b3820a`, reading-copy SHA-256 `2b7e35dbe75b7611a271db96d535d2048e6de843dc5ace308875f64cb1899093`, one-based inclusive lines [[1, 31]].

`fn-batch-1293247662`: [dbo.fn_greatest](sql/1293247662.sql); source-definition SHA-256 `100bd03c20647489002ed3adfa0c35bd92f5726d21dfda347f6d479f9a9fb1c4`, reading-copy SHA-256 `d8bccafdde324700119baec2f05afe1e317f2b2cbd65934887570dd68522ced9`, one-based inclusive lines [[1, 31]].

`fn-batch-1261247548`: [dbo.fn_record_type](sql/1261247548.sql); source-definition SHA-256 `f63852b7b670cc7cff38a78b3c230b0ec3c6ed69281865ce186a833f77edae71`, reading-copy SHA-256 `c6b852359d0e2a41e0a57a8420c0e056e4fe6c0c5b8604034bff12d1df664535`, one-based inclusive lines [[1, 78]].

</details>

<a id="fn-dashboard-kpis"></a>

## Dashboard KPI semantics

Dashboard KPI IDs use different definitions. Some return fixed numbers; others count joined rows, apply saved dashboard formulas or use selected time intervals. Dock shortest, longest and average intervals have different no-data behavior. Work days span UTC start plus 24 hours, which may differ from a local daylight-saving day. Unknown type/ID returns 0; missing scalar data may return NULL or a percentage fallback of 0.

### How it works

1. Select the KPI type and identifier, then use that branch's formula and time interval.

### Settings and prerequisites

- Supplied date pair, warehouse timezone, stored dashboard values, hard-coded IDs and status/type predicates.


### Limits

- These indicators do not measure a complete end-to-end warehouse process.


<details>
<summary>Technical reference and sources</summary>

`fn-batch-1612181139`: [dbo.DASHFn_GetKPIValue](sql/1612181139.sql); source-definition SHA-256 `e20ff4b9bc482e35be0cee571ee0374b9e6f18f7379718c0ac29711ad6d1d577`, reading-copy SHA-256 `eb1cf3fccc19e9cdaca90a9011a207abd2eb8367b218a653c47f26ea57c8c9b1`, one-based inclusive lines [[1, 553]].

`fn-batch-1628181196`: [dbo.DATEFn_GetWeekEndDate](sql/1628181196.sql); source-definition SHA-256 `10cb0bd397602b22ac1de255a299a6475f89fb62e46c94b5d8b6c9561588107d`, reading-copy SHA-256 `143df6dbfbcf9df86d23b63735fece17bd4ecd63d942fc582a588e149a7db9ff`, one-based inclusive lines [[1, 34]].

`fn-batch-1644181253`: [dbo.DATEFn_GetWeekStartDate](sql/1644181253.sql); source-definition SHA-256 `c8ed097a9c4ad69866b705f05a3c7d3fb41c307042948706426b80aca6f87062`, reading-copy SHA-256 `41ebc9e48b98ee047fbbcd9e63fbfadfc10090af68fcb1410188fe1195e4366c`, one-based inclusive lines [[1, 33]].

</details>

<a id="evidence-permissions"></a>

## Understanding permissions and personal configuration

This help library explains general work-selection rules. It does not access individual users, permissions or effective profiles. A colleague’s settings cannot be inferred from configuration totals or from the parameters a procedure accepts.

### How it works

1. Work selection accepts a user and warehouse and applies profile and sequence rules.
2. The retained configuration checks aggregate fixed fields. They do not identify the profile applied to an individual operator.

### Settings and prerequisites

- User, warehouse, profile, sequence and feature settings can change the work-selection path.


### Troubleshooting

- For an individual access problem, use an authorized, sanitized explanation of the relevant permission/profile and application binding; do not provide another person’s operational data.


### Limits

- No user-specific permission decision or access-control result is established by this prototype.


<details>
<summary>Technical reference and sources</summary>

`work-batch-51843597`: [dbo.WRK_GetWorkInstructionsForExecution](sql/51843597.sql); source-definition SHA-256 `eca08945d5ab9ce42fdf8c01403853dd3addf9a62075e31053e20732f7db87cf`, reading-copy SHA-256 `337a1793a82284ecd9d2c95352ab086d5ee8dae4e6e6a8d6025a62198c6678b0`, one-based inclusive lines [[1, 752]].

`retained-config-observation`: [DB Architecture/evidence/configuration-observations.json](evidence/configuration-observations.json); SHA-256 `65b601ee627c80ad3920d3e4bd04722b6af3f77b0ba981e75527eeccb1bc9264`. Timestamped aggregate evidence; individual effective settings remain unestablished.

</details>

<a id="missing-configuration"></a>

## Handling missing locating settings

Missing locating settings have no universal SCALE fallback. The result depends on the exact rule, assignment and receiving preference.

### How it works

1. Locating selects a storage destination through a rule and strategy.
2. Inspect the missing-value branch for the selected setting; the introductory locating passage does not define every case.

### Settings and prerequisites

- The documented delayed-locating path requires both Delayed Locating and Create Putaway Work.


### Troubleshooting

- Identify the rule, item or rule-set assignment and receiving preference, then check the missing-value behavior for that exact setting.


### Limits

- An absent setting must not be treated as enabled, disabled or first-match without its specific fallback definition.


<details>
<summary>Technical reference and sources</summary>

`family-locating-aim`: [Locating Process Summary: Functionality](../AIM/reading/4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa.md); AIM article `4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa`, original SHA-256 `e215745a6d81b87363e12c8d05d0ac51d7b6337430ce4b448bc6edcedf67b24a`, nodes n64, n66, n81, n83, n85, n87, n90, n94, n96, n98, n102, n105, n108, n113.

</details>

<a id="duplicate-configuration"></a>

## Configuration precedence and overlapping rules

The winner depends on the exact query or application rule. In the reviewed work selector, some options use profile alone and others also use sequence. Do not assume that the first displayed row wins or that a primary key on an unrelated field makes the selection unique.

### How it works

1. Identify the statement and its actual profile, sequence, warehouse and user filters.
2. Inspect its ordering, uniqueness constraints and fallback. Where no unique ordering is established, retain the selection ambiguity.

### Settings and prerequisites

- Changing sequence scope can change which rows qualify. Different routines can use different precedence.


### Troubleshooting

- Compare only the needed sanitized keys and the applicable rule’s ordering; do not execute the work selector as a read-only diagnostic because a branch changes instruction sequence.


### Limits

- This explains an ambiguity to check; it does not establish that duplicate rows exist here.


<details>
<summary>Technical reference and sources</summary>

`work-batch-51843597`: [dbo.WRK_GetWorkInstructionsForExecution](sql/51843597.sql); source-definition SHA-256 `eca08945d5ab9ce42fdf8c01403853dd3addf9a62075e31053e20732f7db87cf`, reading-copy SHA-256 `337a1793a82284ecd9d2c95352ab086d5ee8dae4e6e6a8d6025a62198c6678b0`, one-based inclusive lines [[1, 752]].

</details>

<a id="replica-freshness"></a>

## What retained configuration checks can tell you

Five retained configuration checks describe aggregate fields observed on 29 September 2026 at 22:50:28-30 UTC. They do not identify an individual user's effective preference or a particular action's outcome.

### How it works

1. Match the requested setting to the check's recorded scope and observation time.
2. Use profile assignment and sequence precedence to determine which configuration applies to a particular user.

### Troubleshooting

- For a user-specific question, check the assigned profile or preference and its selection sequence.


<details>
<summary>Technical reference and sources</summary>

`retained-config-observation`: [DB Architecture/evidence/configuration-observations.json](evidence/configuration-observations.json); SHA-256 `65b601ee627c80ad3920d3e4bd04722b6af3f77b0ba981e75527eeccb1bc9264`. Timestamped aggregate evidence; individual effective settings remain unestablished.

</details>

<a id="product-version-compatibility"></a>

## Design revisions and release applicability

A design revision, training date or printed date does not establish the release or configuration of an installed SCALE system. The functionality reference explains documented mechanisms with local limits. Example values, proposed extensions and unresolved comments do not become universal defaults or deployed behavior.

Distinguishing a document revision or training date from supported product behavior.

### How it works

1. Use the relevant functionality entry and its supporting source locations.
2. Keep release dependencies, configuration choices and unresolved limitations attached to the explanation.
3. An implementation example does not establish an active setting or prove that a feature is enabled in the current workflow.

### Settings and prerequisites

- Release support, effective configuration and design revision are separate facts.


### Limits

- Design examples and proposed extensions do not establish installed functionality.


<details>
<summary>Technical reference and sources</summary>

`sdd-function-reference-applicability`: [SCALE functionality reference](../SDD/SCALE_FUNCTIONAL_REFERENCE.md#reference-applicability); reviewed-entry SHA-256 `6b60d3731e2b786ea5030d55b8f82259efd3fe4ed48dc0f4959075ab974c2352`. Neutral references: R03, R04, R07, R02. [Exact source bindings](../SDD/derived/scale-functional-reference.json). Reference functionality with local limits; current deployment behavior is not established.

</details>

<a id="cycle-count-tolerance-conflict"></a>

## Understanding cycle-count tolerance and review

Cycle-count verification can require two consecutive equal counts. Counts outside the applicable tolerance can move to Pending Review for reconciliation.

### How it works

1. Verify Bad Count repeats a discrepant count; two consecutive equal counts establish the reported quantity in the described workflow.
2. Counts outside the user's tolerance move to Pending Review. An authorized reviewer reconciles the correct on-hand quantity and closes the request.
3. Check whether a separate plan-closing restriction applies to this workflow.

### Settings and prerequisites

- Establish tolerance units, scope and recount/reconciliation permissions for the applicable configuration.


### Limits

- Example values such as 0 or 9999 do not define a universal default or the active warehouse tolerance.
- The recorded restriction on closing an entire plan is a separate extension, not base behavior.


<details>
<summary>Technical reference and sources</summary>

`family-cycle-counting-aim`: [Cycle Counting Process Summary: Functionality](../AIM/reading/548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3.md); AIM article `548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3`, original SHA-256 `62b53306bb40dde023f7fe8b495cff98a3604c93e7613707f4547202de3ae47c`, nodes n66.

`sdd-function-count-verification-reconciliation`: [SCALE functionality reference](../SDD/SCALE_FUNCTIONAL_REFERENCE.md#count-verification-reconciliation); reviewed-entry SHA-256 `84b3107952f9df2c331731c0a1f1c973dcdea0eee69d2c69d63c5ce49afb6966`. Neutral references: R05, R07. [Exact source bindings](../SDD/derived/scale-functional-reference.json). Reference functionality with local limits; current deployment behavior is not established.

</details>

<a id="whole-process-runtime"></a>

## Understanding wave duration and statement timing

The retained Query Store evidence cannot answer the whole-wave duration. It contains statement statistics for 163 historical object IDs. A statement can execute several times inside a procedure, and a wave can include application, queue, database and external stages. Statement counts are not procedure-call counts.

### How it works

1. Keep object, replica group, execution type and retained interval dimensions with statement statistics.
2. A weighted mean combines recorded statement executions; it is not a start-to-finish wave time or a sum of all application stages.
3. A process measurement requires correlated start/end events, stage boundaries, retries and completion acknowledgment across the involved components.

### Settings and prerequisites

- Queue delay, configuration choices, asynchronous work, retries and external completion can fall outside SQL statement measurements.


### Troubleshooting

- Use a sanitized event-schema example with correlation ID and UTC stage start/end semantics, plus observation time and process scope. Do not execute warehouse work to manufacture a timing result.


### Limits

- Current object-name matches do not establish the historical definition used by Query Store. Missing history does not prove a routine is unused. No continuous interval coverage is assumed.


<details>
<summary>Technical reference and sources</summary>

`family-wave-aim`: [Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md); AIM article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`, original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`, nodes n65.

`retained-statement-timing`: [DB Architecture/catalog/query_store_runtime.json](catalog/query_store_runtime.json); SHA-256 `e2d9c165500485a9db06156da434e9455141d0c796770787daee7a05c1e66dd1`. Timestamped aggregate evidence; individual effective settings remain unestablished.

</details>

<a id="label-prerequisites"></a>

## Checking label prerequisites before assuming print success

A label needs a definition, document type, document association and output route. Setup depends on the intended business event and printing path.

### How it works

1. Identify the label file, document type, document definition and output routing for the intended business event.
2. Some labels use a stored procedure. Wave-driven output may require the Documents and Labels step.
3. Check printer capability against the label definition and actual device. A returned document choice does not establish physical output.

### Limits

- Mixed-release training does not establish installed printer capability or a complete setup sequence for every label.


<details>
<summary>Technical reference and sources</summary>

`sdd-function-label-prerequisites`: [SCALE functionality reference](../SDD/SCALE_FUNCTIONAL_REFERENCE.md#label-prerequisites); reviewed-entry SHA-256 `6a9cf745f2f4f3c9c75f005dc62365045f7cd4d85e375aa73d71014406ff697b`. Neutral references: R03. [Exact source bindings](../SDD/derived/scale-functional-reference.json). Reference functionality with local limits; current deployment behavior is not established.

</details>

<a id="view-dif-message-grain"></a>

## Understanding DIF message view row counts

Incoming messages require their endpoint and event. Outgoing messages join an event to every endpoint associated with that event, so multiple endpoints can repeat a message. Neither view sends or retries a message.

### How it works

1. Check the distinct incoming versus outgoing endpoint join keys.
2. Count unique message identities deliberately and inspect missing required joins.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-292248146`: [dbo.METADATA_INSIGHT_DIF_INCOMING_MESSAGE](sql/292248146.sql); source-definition SHA-256 `2a2f39a7df359c2c7510ebc6028c5bb02697957031f6b0e130e7ae4aa4846111`, reading-copy SHA-256 `3202016d9607f94810058bcc64168366b413346f06a9d4398ec3b83192edad61`, one-based inclusive lines [[1, 73]].

`vr-sql-308248203`: [dbo.METADATA_INSIGHT_DIF_OUTGOING_MESSAGE](sql/308248203.sql); source-definition SHA-256 `e52026f55fe4ebf7b02e6b1cb35a89f4ebe75508ec0c98fed6dbc4c5db83075d`, reading-copy SHA-256 `920f4eaf46ab7ace81868bd42a0cbcf62370ba9d345f2487e8d2e93a11ae84cf`, one-based inclusive lines [[1, 67]].

</details>

<a id="view-retained-unions"></a>

## Understanding current and retained view combinations

UNION ALL views preserve duplicate rows across current and retained sources. UNION views remove identical full projected rows, while different values for the same identifier can remain. These views provide no current-source preference.

### How it works

1. Identify UNION versus UNION ALL and the exact selected fields.
2. Use explicit provenance and identity rules in the consuming analysis; no such priority is supplied here.

<details>
<summary>Technical reference and sources</summary>

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

</details>

<a id="view-sci-container-ordinals"></a>

## Understanding SCI container positional mapping

SCI_SHIPPING_CONTAINER_VIEW places four columns in different positions across its UNION branches. In the retained branch, logistics-unit values occupy World Ease output positions, and World Ease values occupy logistics-unit positions. Consumers therefore cannot assume that each output column has the same meaning in both branches.

### How it works

1. Compare both explicit projections by ordinal position, not matching column name.
2. Preserve the finding without treating this documentation as an executed SQL correction.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-1856061698`: [dbo.SCI_SHIPPING_CONTAINER_VIEW](sql/1856061698.sql); source-definition SHA-256 `49b997dcee467fc13e08c807b014f31ff38269d418cae0e10aa626eed0019826`, reading-copy SHA-256 `fbae0fd5d61c72106d9b1329c2fdfc97e2f6913080b4b6852f7e132090daa1c8`, one-based inclusive lines [[1, 277]].

</details>

<a id="view-shipment-total-precedence"></a>

## Understanding shipment and load calculated totals

SHIPMENT_HEADER_VIEW calculates detail totals and parentless-container totals separately. Weight, volume and value use a positive manually entered value only with zero root containers, otherwise a root-container sum when roots exist, otherwise detail sums. Load views aggregate these computed rows; address joins may repeat load totals.

### How it works

1. Check root-container presence and positive manual-value conditions for each measure.
2. Account for load-address multiplicity before further summing the returned totals.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-2032062325`: [dbo.SHIPMENT_HEADER_VIEW](sql/2032062325.sql); source-definition SHA-256 `36084903723b6b4976ecce27eb9329e5cde1e6d420be7abb67a2971d6bb3b10d`, reading-copy SHA-256 `f7fa46262701aacff5832542d3c3132abdd77e2968c8eceb83a90d01f9c1b2c6`, one-based inclusive lines [[1, 227]].

`vr-sql-12579133`: [dbo.SHIPPING_LOAD_VIEW](sql/12579133.sql); source-definition SHA-256 `e2a719745733afff2fc5232ddd842488ba4b1073264f9183dbb3de113f429c25`, reading-copy SHA-256 `948596099804885bbd1d8ce966adbf5de33a96a400e5cdfa1cd3d377350e9fea`, one-based inclusive lines [[1, 67]].

`vr-sql-2144062724`: [dbo.SHIPPING_LOAD_SHIPPING_ADDRESS_VIEW](sql/2144062724.sql); source-definition SHA-256 `0d1dc7974860d51765d32a5edc24ba341251ffb2da081dc95a290058624517af`, reading-copy SHA-256 `138f2c4d9c6cf7c0cc90e5f5722cf748ed6cf7502abcfb957b9f9b1238f2bd09`, one-based inclusive lines [[1, 83]].

</details>

<a id="view-work-order-aggregation"></a>

## Understanding work-order summary quantities

The summary independently takes MIN of many component fields while grouping by work order. Components, shipment details and instructions join before SUM(TO_QTY), so fanout can multiply that sum. COUNT DISTINCT protects the dependent shipment count only; COMPLETE is an alias of requested build quantity. Because each minimum is calculated separately, the summary can combine values from different components and should not be read as one component record.

### How it works

1. Distinguish independent MIN fields, COUNT DISTINCT and SUM behavior.
2. Treat COMPLETE as its source quantity and inspect instruction joins that lack type predicates.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-1520060501`: [dbo.METADATA_INSIGHT_WORK_ORDER_DETAIL_VIEW](sql/1520060501.sql); source-definition SHA-256 `d07229992367efe1328320df2b2b4fce30421e13926091d7b84c4d94113fd87a`, reading-copy SHA-256 `20f8d258716aef638f7815d585c62e54ee911ef737b4c95bcca4b3ea59e6c164`, one-based inclusive lines [[1, 114]].

`vr-sql-1536060558`: [dbo.METADATA_INSIGHT_WORK_ORDER_HEADER_VIEW](sql/1536060558.sql); source-definition SHA-256 `efd52d0e2b288b1d2c83beb729ebc8f1927a3566fc5944e000559ae3b634341e`, reading-copy SHA-256 `5be81109a2bb645e72760df7f3889f688f94f66ec5a9297df344a96e04eb30f8`, one-based inclusive lines [[1, 135]].

`vr-sql-1552060615`: [dbo.METADATA_INSIGHT_WORK_ORDER_LICENSE_PLATE_VIEW](sql/1552060615.sql); source-definition SHA-256 `8d1666a023a8f98d7594c46fc4094f2920a709540d8a5d22d295abbe05ca32cd`, reading-copy SHA-256 `31607a4a0266b8cf9d34bd5525f27976afdecd90e1c9279f47c073874f0baf97`, one-based inclusive lines [[1, 95]].

</details>

<a id="view-inventory-grain"></a>

## Understanding inventory detail and aggregate grain

Detailed inventory joins serial numbers, which can repeat inventory quantities. The aggregate view groups location, item, company, lot, permanent state and location dimensions, uses MIN/sentinels for other fields, and counts distinct logistics units. Availability uses raw nullable quantity arithmetic and clamps negative or nonmatching comparisons to zero.

### How it works

1. Choose the intended inventory key and account for serial expansion before summing.
2. Check raw arithmetic, NULL behavior, mixed units and the aggregate override test that uses only MAX inventory ID.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-1700513437`: [dbo.METADATA_INSIGHT_INVENTORY_AGGREGATE_VIEW](sql/1700513437.sql); source-definition SHA-256 `7445faf7060be5c9b34966c41ddce135368a397d00fafd720957bb0657f367d8`, reading-copy SHA-256 `dfba1733225450f86aa32468c4953a56e0b6b81da5229f33bafa904c2de620e8`, one-based inclusive lines [[1, 165]].

`vr-sql-1716513494`: [dbo.METADATA_INSIGHT_INVENTORY_VIEW](sql/1716513494.sql); source-definition SHA-256 `33d99cda1a46997f70f5b04fe29f72ab9562a39a5379a55206935aa947f50603`, reading-copy SHA-256 `3827c98cbb279c708d87146efeb3c21bd9d12421f7b7b0ac6edf286fa063ef8f`, one-based inclusive lines [[1, 153]].

</details>

<a id="view-catch-weight-and-history"></a>

## Understanding catch weight and transaction attribute grain

METADATA_INSIGHT_TRAN_HIST_VIEW applies each linked attribute row separately, with CASE values and no pivot. TRANSACTION_HISTORY_INVENTORY_ATTRIBUTE_VIEW instead aggregates selected attribute types with MAX. In detailed inventory, a nonzero combined catch weight replaces stored total weight, while the weight-unit choice is evaluated separately.

### How it works

1. Distinguish row-per-attribute APPLY from MAX-based attribute aggregation.
2. Check TRY_CAST outcomes and independent catch-weight versus weight-unit fallback.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-1732513551`: [dbo.METADATA_INSIGHT_TRAN_HIST_VIEW](sql/1732513551.sql); source-definition SHA-256 `b26a2afe0617a618063ec8ea437e4138aead85d98f8951ec1028d9e6cf1a690a`, reading-copy SHA-256 `9a096d5195787df12c19962982137b7c4c68aa9c4d89b2ee1ef1ba637c74f826`, one-based inclusive lines [[1, 82]].

`vr-sql-1796513779`: [dbo.TRANSACTION_HISTORY_INVENTORY_ATTRIBUTE_VIEW](sql/1796513779.sql); source-definition SHA-256 `cf823b5e6940584fd2da6108d8d0f27bf7a7019e2bdf16f75c897fa55e2be438`, reading-copy SHA-256 `ef28f79875318288c3d93527c4069b9ab651145fb5e6cb0d7afd2a7b832f1bb8`, one-based inclusive lines [[1, 65]].

`vr-sql-1716513494`: [dbo.METADATA_INSIGHT_INVENTORY_VIEW](sql/1716513494.sql); source-definition SHA-256 `33d99cda1a46997f70f5b04fe29f72ab9562a39a5379a55206935aa947f50603`, reading-copy SHA-256 `3827c98cbb279c708d87146efeb3c21bd9d12421f7b7b0ac6edf286fa063ef8f`, one-based inclusive lines [[1, 153]].

</details>

<a id="view-dock-display-states"></a>

## Understanding dock occupancy display states

Dock views use selected location statuses, fixed class/subclass filters or summed inventory buckets. One quantity view prioritizes positive transit over positive on-hand quantity; nonpositive or NULL sums fall through. The staging-area empty flag tests the area status, not whether every child is empty.

### How it works

1. Read the exact status/quantity rule used by the selected view.
2. Distinguish child-position counts from area status and root-container grouping by child dock type.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-832058050`: [dbo.DOCK_AREA_EMPTY_POSITION](sql/832058050.sql); source-definition SHA-256 `6b0ab4cdf42e75d0ce59bf77b63bd55dc6283a6c0b1c9929c09dcbf534b45c39`, reading-copy SHA-256 `e34d8b742d87113ade3c6ac9392e4fc1e93f7302ce612da026154f854ab6bd0a`, one-based inclusive lines [[1, 15]].

`vr-sql-848058107`: [dbo.DOCK_AREA_PERCENTAGE](sql/848058107.sql); source-definition SHA-256 `ec6149855e83dce2850e9d24fcc075aac9c6fc0f28111c5dff1b383bb6bd10a6`, reading-copy SHA-256 `21186b60cac350eb4c6fa179aa21cd933302f20e5e66f3014630f9c6e6ae66b2`, one-based inclusive lines [[1, 48]].

`vr-sql-864058164`: [dbo.DOCK_AREA_POSITION](sql/864058164.sql); source-definition SHA-256 `a446831754c75dc23af78a4a9e9b69541e5d3e54568ebfc08866dd4dac4df986`, reading-copy SHA-256 `ebaf9a6c4cb63f1654ec47b2f00833c7e712743b5925b200f99ee6a5c4ba4829`, one-based inclusive lines [[1, 54]].

`vr-sql-912058335`: [dbo.DOCK_DOOR](sql/912058335.sql); source-definition SHA-256 `b403389829b5bad84f994feea8291f307fea58efa8b3289babab53b23c607ad6`, reading-copy SHA-256 `ff4104eab0fc3a4167fa589fa83a51b0d82ccf4a3bb5b30333bf0aa383acf003`, one-based inclusive lines [[1, 37]].

`vr-sql-944058449`: [dbo.DOCK_MGR_SHIPPING_CONTAINER](sql/944058449.sql); source-definition SHA-256 `9b91b096f828483ecfeeaed385cd9f2659cc1ffd908c926f83c1d6a55ac20bb5`, reading-copy SHA-256 `36b93111232f74047ce83e7c7a3b1938adcca4cced6f8861aedf4b988b6ce341`, one-based inclusive lines [[1, 182]].

</details>

<a id="view-warehouse-text-joins"></a>

## Understanding warehouse boundaries in location views

Some dock-position views join container LOCATION to LOCATION text without a warehouse predicate. Shipment transit-location branches also differ in warehouse and status checks. Other container transit-location joins explicitly include warehouse. The exact view and branch matter.

### How it works

1. Compare LOCATION text plus warehouse predicates in each branch.
2. Do not transfer a status threshold or warehouse condition from one UNION branch to another.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-880058221`: [dbo.DOCK_AREA_POSITIONS_CARRIER](sql/880058221.sql); source-definition SHA-256 `4a16a8cf287c173a7e85c04ee6f6852ea850665302a3c724e4209f0b73729e56`, reading-copy SHA-256 `f53cff9f8e7fd8b23c3f743c3969c6c6b1c9cfe78119fce8b12e880bc663b301`, one-based inclusive lines [[1, 36]].

`vr-sql-896058278`: [dbo.DOCK_AREA_POSITIONS_LOAD](sql/896058278.sql); source-definition SHA-256 `abbcefedc5af3711db64f159d700b9c6fa1ca597e2f42fd6f66f016a6a28345e`, reading-copy SHA-256 `717b9c00f5d5cab68c19f6ea09cfafb06d34371a855e90b77669a86456ed1edf`, one-based inclusive lines [[1, 39]].

`vr-sql-1968062097`: [dbo.SHIPMENT_HEADER_IN_TRANSIT](sql/1968062097.sql); source-definition SHA-256 `06202ce4c3d82c072edfbfd52fd4e83b86bd55cff0e5b561b2c566ce793f631f`, reading-copy SHA-256 `d1366e29bb5958e00e493bf1341d5706aaf9a4a932ff9287d72b972aa6467bf7`, one-based inclusive lines [[1, 37]].

`vr-sql-1984062154`: [dbo.SHIPMENT_HEADER_ON_HAND](sql/1984062154.sql); source-definition SHA-256 `e1f7a139477a3198ec22f399d6b21ce7dc7615a36130a0db07872831dffd9752`, reading-copy SHA-256 `52ba63a7c93ee51057f69fc3b8c866a0c5115702747a06e46a5c0a17f0360b3e`, one-based inclusive lines [[1, 17]].

`vr-sql-2064062439`: [dbo.SHIPPING_CONTAINER_IN_TRANSIT](sql/2064062439.sql); source-definition SHA-256 `d414228ed5daa28951c4a2b5a9e2e28abf58697b8efc11ffe37cc049a0558ff7`, reading-copy SHA-256 `f2ed5620adfc85abc109215c263d3da89a41d070a2eb5a8c4716e26b25b70796`, one-based inclusive lines [[1, 36]].

`vr-sql-2080062496`: [dbo.SHIPPING_CONTAINER_ON_HAND](sql/2080062496.sql); source-definition SHA-256 `17ddec810b0bfefb76ccb4349821b477032cfcc5222ab2ab265b9b548c345d9e`, reading-copy SHA-256 `4ffb1376173d07374279b17e8a1ed37c70c59d5ba2c1de2a8899028538d9a46a`, one-based inclusive lines [[1, 14]].

</details>

<a id="view-mop-selection"></a>

## Understanding multi-order pallet location choices

MOP views use unordered TOP 1 selections for child/self location and work zone. AND conditions bind only to the self arm in those OR expressions, so child rows may satisfy an arm even with NULL values. Some views require a pallet, while one reads warehouse from an optional pallet join.

### How it works

1. Check parentless/container status and required versus optional pallet joins.
2. Inspect TOP 1 ordering and OR/AND grouping before assuming a unique non-NULL location.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-60579304`: [dbo.TRAV_MULTI_ORDER_PALLET_VIEW](sql/60579304.sql); source-definition SHA-256 `dd08fdd66721638245356796f6f6dcf944bb05083155fb872d9a01053ba0fb46`, reading-copy SHA-256 `1e9eab07c041b7d8da36338cfc6e48cdbc0f466d95b76bea63ba9ee2f732810a`, one-based inclusive lines [[1, 29]].

`vr-sql-1168059247`: [dbo.METADATA_INSIGHT_MOP_VIEW](sql/1168059247.sql); source-definition SHA-256 `7d9ef9354f879edc7d0c372ef124ae96330f30e1db736d887c3d625dc32b780d`, reading-copy SHA-256 `7cdbd6b8dc6528b1c9e4e32c28330991ff54797b654db551b452cf595ea20125`, one-based inclusive lines [[1, 42]].

`vr-sql-1696061128`: [dbo.MULTI_ORDER_PALLET_VIEW](sql/1696061128.sql); source-definition SHA-256 `0fec1979536c17ba24ce40776034e4e7a325be02330ebd7008e94c494e62a859`, reading-copy SHA-256 `4c21521afa35830ed923121ba8542aaa8496920d34221b806031688ed0dcdb80`, one-based inclusive lines [[1, 35]].

`vr-sql-1881318012`: [dbo.TRAV_METADATA_INSIGHT_MOP_VIEW](sql/1881318012.sql); source-definition SHA-256 `6b90c44761ffd4fd787d7fe70cf43d9db054a5a7f1a170fb236b65aab94dfff1`, reading-copy SHA-256 `0331976f5fe29b0b7e7313878d7cb3289f6a8726cdc28358d81c1fae7249e4c4`, one-based inclusive lines [[1, 44]].

</details>

<a id="view-presentation-rows"></a>

## Understanding placeholder and display-only view fields

The manifest presentation view returns one row of NULL placeholders plus current UTC time without reading a manifest table. The split view initializes a numeric split quantity to zero. Wave and cycle-count CASE flags classify stored fields; selecting these views does not execute their named operations.

### How it works

1. Distinguish literal/NULL/time expressions from stored business values.
2. Read ordered CASE precedence without interpreting display flags as action authorization.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-1152059190`: [dbo.METADATA_INSIGHT_MANIFEST_VIEW](sql/1152059190.sql); source-definition SHA-256 `4d111160cd7af35cd4f6de92b12909775eb701db91b132efc3cbd8d30b91f456`, reading-copy SHA-256 `82249b9a0e4040911baaa5fa5e9612f9de507b0917e3d80516a1983a6217291a`, one-based inclusive lines [[1, 20]].

`vr-sql-28579190`: [dbo.SPLIT_SHIPMENT_VIEW](sql/28579190.sql); source-definition SHA-256 `066904bd36fed4cf824c0a7f1f2ad67716787de9ecbd3a40a20e86ed9b1c19d4`, reading-copy SHA-256 `7f73b3ff53101008855ae9f6edc1c5e687552a996f48a3448a5a0313e2b2b0fd`, one-based inclusive lines [[1, 20]].

`vr-sql-1504060444`: [dbo.METADATA_INSIGHT_WAVE_VIEW](sql/1504060444.sql); source-definition SHA-256 `be9dde31aac7ba763ae3924fbeb00d2391aca524d88d16883beaae66a5901e65`, reading-copy SHA-256 `06a6941ce343421b5285fa5bbde8e44cab8dc0fc6a436b5c26fc225e112d34e1`, one-based inclusive lines [[1, 57]].

`vr-sql-1088058962`: [dbo.METADATA_INSIGHT_CYCLE_COUNT_REQUEST_VIEW](sql/1088058962.sql); source-definition SHA-256 `4d16c5f8697beb3d5f1792d86c5afdbc7bdf3c84ff826ee9a4c1efea3f6258d0`, reading-copy SHA-256 `9b80a7121bdac90a8b5db67a084def5e942f4a636bd66c188d1629bbacdcee07`, one-based inclusive lines [[1, 57]].

</details>

<a id="view-authorization-projections"></a>

## Understanding authorization metadata in selection views

Container-type, wave-master, manual replenishment and menu views expose authorization metadata. Their bodies do not bind a caller identity to a selected warehouse/company. LEFT JOIN conditions can preserve a master with NULL authorization rows; some views also expose inactive definitions.

### How it works

1. Separate projected authorization fields from WHERE predicates enforcing a caller scope.
2. Account for unmatched LEFT JOIN authorization rows and per-view ACTIVE filters.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-816057993`: [dbo.CONTAINER_TYPE_AUTHORIZED_COMPANY_VIEW](sql/816057993.sql); source-definition SHA-256 `cbb75813e70d728a0d4ce6831b3881bc9d63fe92856a8db194f86e2a3caeb6df`, reading-copy SHA-256 `c2f81b2054fdcb6b9eef6875ad23b4ce29205b331ca825a99a1c089bba1d0ba6`, one-based inclusive lines [[1, 12]].

`vr-sql-1648060957`: [dbo.METADATA_TRANS_WAVE_MASTER_VIEW](sql/1648060957.sql); source-definition SHA-256 `90b4c7af8d4e13fad184962323adc2c589e49211d33be71e7375dacca3270448`, reading-copy SHA-256 `15d7bd64f4094e83c0e1f216ce9b3c1f5644f5aed18b53b9b7a25f80de7b5d9f`, one-based inclusive lines [[1, 24]].

`vr-sql-1748513608`: [dbo.METADATA_TRANS_MANUAL_REPLENISHMENT_VIEW](sql/1748513608.sql); source-definition SHA-256 `442f344c95bee2e6e4f3e6b9f6e9ecfd2300b8b95994e5a096f1f04306a652ac`, reading-copy SHA-256 `aff6798e34e7ea1f49cc897ce5872978f23e3343222eb2c353ec3475e4e4b768`, one-based inclusive lines [[1, 20]].

`vr-sql-1488060387`: [dbo.METADATA_INSIGHT_WAREHOUSE_MOBILE_MENU_VIEW](sql/1488060387.sql); source-definition SHA-256 `36b6a79062054930feb131269541bd33e8661ef771d60ea04f09576dbcbab026`, reading-copy SHA-256 `a84ce02cb8b6fa97555137daa388281b643fd013d90e100da81fd606e78667b8`, one-based inclusive lines [[1, 38]].

</details>

<a id="view-configuration-and-resources"></a>

## Understanding service configuration and resource projections

The SSO view combines feature-selected record types with a fixed-key lookup that has no record-type restriction. The standalone service view uses scalar configuration lookups and an unordered TOP 1 active warehouse. The resource view returns BASE_TEXT and CUSTOM_TEXT separately without selecting an effective override.

### How it works

1. Compare scalar cardinality, feature selection and the second SSO branch scope.
2. Keep source structure separate from actual settings, login success and effective text resolution.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-1684513380`: [dbo.GET_CLIENT_SSO_VIEW](sql/1684513380.sql); source-definition SHA-256 `a50d82bf4f7030e998c267bc2ed16b176824cb64b2dffcb815cf98fa3cd485e9`, reading-copy SHA-256 `3b0729f3c470e6866379fe8ff417bf96e547ca1bbe2fef7a00a0bdf962f0729b`, one-based inclusive lines [[1, 18]].

`vr-sql-1780513722`: [dbo.STANDALONE_SERVICE_PROPERTIES_VIEW](sql/1780513722.sql); source-definition SHA-256 `7775fae513dd0bfcf23df4dd906ef7ca4a72fe345fb921e5d44b42422aef831a`, reading-copy SHA-256 `70f3b1f6ed7e19c23cd04c85ce3816861b6665831ccdc2a8df77fbed353a8035`, one-based inclusive lines [[1, 8]].

`vr-sql-1764513665`: [dbo.RESOURCE_FILE_BASE_CUSTOM_VIEW](sql/1764513665.sql); source-definition SHA-256 `b9ddde99971851781db136bb275f0a3504e0bd483c2cd5797b20d4c9a287f49d`, reading-copy SHA-256 `c9b4f27a4ec07a78ac0909f40a6054964853d9d875268eed5fbe16cec3455d2a`, one-based inclusive lines [[1, 18]].

</details>

<a id="view-purchase-order-grain"></a>

## Understanding purchase-order detail, header and TPM views

Insight header views expand headers by detail and repeat open/closed flags. Their receipt lookup is TOP 1 without ordering. TPM line status requires a header through INNER JOIN, whereas the non-TPM detail insight uses LEFT JOIN. The base header aggregate groups by header ID and calculates detail sums without unit normalization.

### How it works

1. Identify header expansion versus header aggregation and INNER versus LEFT joins.
2. Check unordered receipt selection, repeated flags and weight-unit interpretation.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-1200059361`: [dbo.METADATA_INSIGHT_PURCHASE_ORDER_DETAIL_VIEW](sql/1200059361.sql); source-definition SHA-256 `2d079e18cfa6ef645d552000bfdd03c4f1ee7f13d9c23038fab762ebe372cb56`, reading-copy SHA-256 `40ab0f565a0f2aa543fcd885bc521fb217798a3634e0244f546ac306934284e9`, one-based inclusive lines [[1, 106]].

`vr-sql-1216059418`: [dbo.METADATA_INSIGHT_PURCHASE_ORDER_HEADER_VIEW](sql/1216059418.sql); source-definition SHA-256 `3f25ef3f7d12c52b5208cc92dd319607b2dfcbd1522f408e89d603fed36e4136`, reading-copy SHA-256 `c8426978e5642bcf4dfcdbb729f3dbed8c0556de7f2d72766771802c0ea4a719`, one-based inclusive lines [[1, 106]].

`vr-sql-1392060045`: [dbo.METADATA_INSIGHT_TPM_PURCHASE_ORDER_HEADER_VIEW](sql/1392060045.sql); source-definition SHA-256 `a24958c20941bfa881f345c1070ec9cd94946b22c4223405c8f9b9df62537053`, reading-copy SHA-256 `2cd03728c8608fab64fa2d463feac634ba51371c78e722b4efaaefef5aa8e2c3`, one-based inclusive lines [[1, 104]].

`vr-sql-1408060102`: [dbo.METADATA_INSIGHT_TPM_PURCHASE_ORDER_LINE_STATUS_VIEW](sql/1408060102.sql); source-definition SHA-256 `5a37289deac7d6816dac887a014f293fb234a98966ac26015ea702aaae37bf07`, reading-copy SHA-256 `5e22de6bd15ae873caaa213c3ef3d388ccbf0c156bdcb727c04170c63233ef6b`, one-based inclusive lines [[1, 106]].

`vr-sql-1728061242`: [dbo.PURCHASE_ORDER_HEADER_VIEW](sql/1728061242.sql); source-definition SHA-256 `3e1944edd254a2253e0bd2dcc2848ab920b45990b1c3ee00537ee973cd835da1`, reading-copy SHA-256 `33b346640a53c4bef519d29661b03dd82bfc1c52eaeebc015d974ee046ffdc46`, one-based inclusive lines [[1, 67]].

</details>

<a id="view-receipt-fanout"></a>

## Understanding receipt detail and appointment fanout

Receipt insight combines lines, appointments, containers and unfulfilled immediate-needs requests. Multiple matches can multiply rows; immediate needs are joined by item/company without warehouse. Receipt header view also repeats headers per appointment. Container pre-check-in quantity uses open receipt sums minus status-100 container quantities and may be NULL.

### How it works

1. Choose a header, line, container or appointment grain explicitly before aggregation.
2. Check missing scalar matches, open-header conditions and the immediate-needs join scope.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-66359551`: [dbo.METADATA_INSIGHT_RECEIPT_VIEW](sql/66359551.sql); source-definition SHA-256 `8138418852744dd64fc1c41f93dfc26489c2ee9c8ff85334e10d6ea6379c9e5f`, reading-copy SHA-256 `7ad94e80f06088ea709136819e9017633db4f5501ba1870a161c520e1252abf2`, one-based inclusive lines [[1, 188]].

`vr-sql-1264059589`: [dbo.METADATA_INSIGHT_RECEIPT_CONTAINER_VIEW](sql/1264059589.sql); source-definition SHA-256 `d09314eaeb80377b549829194015db69545f2b137b0b930b9ef54d954a0ca653`, reading-copy SHA-256 `1a90b5e81947f4cdf94929c864f365684a689a165b75cc24df525063f4a451b2`, one-based inclusive lines [[1, 222]].

`vr-sql-1280059646`: [dbo.METADATA_INSIGHT_RECEIPT_LINE_VIEW](sql/1280059646.sql); source-definition SHA-256 `85d83e311d2f3d45df4186e0d33abba393f3dd9d492d3ff6fb506e49bc7df575`, reading-copy SHA-256 `ecb27e1ccd04eaafdce6768137bfd18ef391bbafd8ed51043f5a326b84b8fdff`, one-based inclusive lines [[1, 109]].

`vr-sql-1760061356`: [dbo.RECEIPT_HEADER_VIEW](sql/1760061356.sql); source-definition SHA-256 `637c57d529c928e9fe050f3ec03c1570b806e2c9da0f14bd6001e10e61d66c37`, reading-copy SHA-256 `f1bb1f5f29945484395931376c25f8eb53e8180e3d919447ca7834eddcdaec73`, one-based inclusive lines [[1, 100]].

</details>

<a id="view-shipment-pool-grain"></a>

## Understanding shipment pool and shipment insight boundaries

The standard pool filters leading status below 300, with a redundant status-80 alternative. Shipment insight uses trailing status at least 300 or leading status at least 300 with trailing 80. These are different predicates, not complements. Line expansion repeats header totals; the custom TRAV pool additionally sums header weight after line expansion by customer.

### How it works

1. Compare leading and trailing status fields rather than relying on view names.
2. Account for detail/VAS expansion and the custom customer window sum before aggregating.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-1145875249`: [dbo.METADATA_INSIGHT_SHIPMENT_POOL_VIEW](sql/1145875249.sql); source-definition SHA-256 `18bc8c74ed9231e6592501442ff2df9ceb7a292d9f2c526db3a2096d089ab747`, reading-copy SHA-256 `cfecb225abe0e11513da84dc579d9f543156046cf977022a2f05b474a2e395f3`, one-based inclusive lines [[1, 338]].

`vr-sql-1161875306`: [dbo.METADATA_INSIGHT_SHIPMENT_VIEW](sql/1161875306.sql); source-definition SHA-256 `cf73c25210b300bc4f2ae24e5790afda5ec684ada7a2985744e6efff2990b872`, reading-copy SHA-256 `d2266c863e92100586a58330a615a8ba35f66aec4e9b2c9b4118eedb74f9e59f`, one-based inclusive lines [[1, 384]].

`vr-sql-1762209428`: [dbo.TRAV_METADATA_INSIGHT_SHIPMENT_POOL_VIEW](sql/1762209428.sql); source-definition SHA-256 `44cbb2c0a60090472dc9778e574ae7bfdab34bf73e31dc9818375deae96d9c95`, reading-copy SHA-256 `bc0e4fe4a3faca252f271a9ef891c8d5301f75ec6b7e8594dbdcfc24fbb02c40`, one-based inclusive lines [[1, 56]].

`vr-sql-1312059760`: [dbo.METADATA_INSIGHT_SHIPMENT_DETAIL_VIEW](sql/1312059760.sql); source-definition SHA-256 `1173ac6377ed89331911dfcad276df2286fa9a314b935de02fb3056c9a977da0`, reading-copy SHA-256 `a41f1950bac5681c0cf513c6f467b69af69ff608371ac58c209ed1b1b31ad391`, one-based inclusive lines [[1, 191]].

</details>

<a id="view-lot-and-recall"></a>

## Understanding lot counts and shipped-lot scope

Lot views count matching LOCATION_INVENTORY rows with any nonzero quantity bucket, including negative values, rather than DISTINCT locations. Retained lots use current inventory for the count. Recall and shipped-lot views combine current and retained containers/headers with UNION ALL and apply a status-function threshold; shipped lots additionally require non-NULL LOT.

### How it works

1. Distinguish row count from distinct location count and current inventory from retained lot metadata.
2. Inspect UNION ALL overlap, strict threshold comparison and non-NULL lot filtering.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-1056058848`: [dbo.LOT_VIEW](sql/1056058848.sql); source-definition SHA-256 `587f154c878df46bc6bfbc0db06d6446b0d4c2baedb1063e0948161d889be5ed`, reading-copy SHA-256 `7cfee44af6e873e39636e23aa49d51febb732be7bc9101a0c7e460bb974413ba`, one-based inclusive lines [[1, 37]].

`vr-sql-1136059133`: [dbo.METADATA_INSIGHT_LOT_VIEW](sql/1136059133.sql); source-definition SHA-256 `7b825dfff952e8b29e222a7421cc68a04b643507782813c70e0680ea0462c3ba`, reading-copy SHA-256 `77ccabca0af6299da811042c6a1c848e03b380d67a28199c1e18051f5b6b3483`, one-based inclusive lines [[1, 27]].

`vr-sql-508580900`: [dbo.PRODUCT_RECALL_VIEW](sql/508580900.sql); source-definition SHA-256 `afad8eef17d2fd5b8698c52d9ed5e68e532288042624c233e5788bfb61c54d5e`, reading-copy SHA-256 `d5d40616670431d03c255355ae305a784bb130e0b880f8fd5c4d192e4b0dbd8b`, one-based inclusive lines [[1, 37]].

`vr-sql-524580957`: [dbo.SHIPPED_LOT_VIEW](sql/524580957.sql); source-definition SHA-256 `8a42deb5ef42b477fbf2940a6f3736fc190a5ecc6eb185f39ce1ac6b533651bb`, reading-copy SHA-256 `bba2aa51538f9d4f3539bc1d8a0d4572c1224b2096a7ba06cba90bcb3ed1b66f`, one-based inclusive lines [[1, 37]].

`vr-sql-540581014`: [dbo.METADATA_INSIGHT_SHIPPED_LOT_VIEW](sql/540581014.sql); source-definition SHA-256 `49b855a895d64cce9b882138ac9a914cfc24b89d3bcd5ebc81901fcb66650a10`, reading-copy SHA-256 `9ed4f6ec9f1b33af4fc0b8770e7a9700cda60e53d997109ebf25cd62cf83a733`, one-based inclusive lines [[1, 107]].

</details>

<a id="view-vas-and-qc-displays"></a>

## Understanding VAS confirmation and QC context

The container VAS view maps one negative completion value to zero and every other value, including NULL, to one. Shipment-level and line-level views derive MIN-based confirmation over selected containers with different empty-result handling. QC history joins may exclude rows through a reason-type filter after a LEFT JOIN. None of these selections completes VAS or QC.

### How it works

1. Read each CASE, MIN and empty-set fallback separately.
2. Check whether WHERE predicates null-reject rows from an apparent LEFT JOIN.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-2112062610`: [dbo.Shipping_Container_VAS_Activity_Grid_View](sql/2112062610.sql); source-definition SHA-256 `9db866c55d3f1c3482ee523a5f46bfae265ab51dbf0e7d27049eec2638cf83e6`, reading-copy SHA-256 `b8d1dd9e86096b5f5826c253a9cbfc9d1de57a290b8aee5ff366a5d2b0c83ae4`, one-based inclusive lines [[1, 29]].

`vr-sql-1936061983`: [dbo.Shipment_Detail_VAS_Activity_Grid_View](sql/1936061983.sql); source-definition SHA-256 `9af6ff539945520f3c115fad8328ee3177bb360a2ed3b570277bf172c88fe878`, reading-copy SHA-256 `209fb5eae6c1bf35ac4bbe4fd0e52df18dff53f18069076e4fba363107a9f1ca`, one-based inclusive lines [[1, 64]].

`vr-sql-2016062268`: [dbo.Shipment_Header_VAS_Activity_Grid_View](sql/2016062268.sql); source-definition SHA-256 `08eae1f6eafdc81c813e60a1533c24bc9b83809dfba213df9d4d7abeec699c6d`, reading-copy SHA-256 `e0d39a649fb5082459649b4b803b1539e28e1743c588c111b9113baa717805df`, one-based inclusive lines [[1, 41]].

`vr-sql-1584060729`: [dbo.METADATA_RECEIPT_QUALITY_HISTORY](sql/1584060729.sql); source-definition SHA-256 `4b669a31828ac0bfca676f39414de2a809f6dee667c53e7e45deee791abd8c9a`, reading-copy SHA-256 `2aa6e6b3917e92236ec639a26e407c5ff329e72f49a31b0a3d13bff7234ff725`, one-based inclusive lines [[1, 12]].

`vr-sql-1472060330`: [dbo.METADATA_INSIGHT_VAS_VIEW](sql/1472060330.sql); source-definition SHA-256 `50328ce6d6b3434a45074fbfc6fa5e7150a9b1f7db50cc8493670e968acbd03b`, reading-copy SHA-256 `247627cee3791801fe159efb69027d008e3a6c78e19c4979e44113f0f431f70a`, one-based inclusive lines [[1, 32]].

</details>

<a id="view-order-quantity-and-balance"></a>

## Understanding ordered quantity and balance aggregates

The ordered-quantity view sums shipment-detail total quantity for headers whose trailing status is below 900, grouping by item, raw company, unit and warehouse. The inventory-balance view instead sums selected nonzero quantity buckets for qualifying location classes. Display fallbacks for company or unit do not merge the underlying groups.

### How it works

1. Identify total quantity versus remaining/available demand and the header threshold.
2. Preserve unit/status grouping and distinguish NULL absent aggregates from zero.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-2098314735`: [dbo.ITEM_ORDER_QUANTITY_VIEW](sql/2098314735.sql); source-definition SHA-256 `253e7d32a2318f74a0a177b2eac976a0fedf047ad33ab7a346ff68dba9d91e32`, reading-copy SHA-256 `fba76d3cd79a30c1e21b460780ad1ac5263adfff809864bae07cc33284476765`, one-based inclusive lines [[1, 22]].

`vr-sql-2082314678`: [dbo.INVENTORY_BALANCE_VIEW](sql/2082314678.sql); source-definition SHA-256 `180001b8eafa7cd2433112045f75883b7bed1a9febf312bd21ba8850a1157894`, reading-copy SHA-256 `f67de157ef6896a3b4cda4d405bc6ad697fe29a17321bc1be89581f0a6b8876f`, one-based inclusive lines [[1, 36]].

`vr-sql-1545980784`: [dbo.METADATA_INSIGHT_TPM_ORDER_STATUS_VIEW](sql/1545980784.sql); source-definition SHA-256 `bd8c493f153ba180b2a2305766025e47c80573dae7e74b025fbfdcfdc8f903a8`, reading-copy SHA-256 `77c04e6fa2fc6308556036b2d9c483a5fcb8090c44f0d174689cd4ad94780c29`, one-based inclusive lines [[1, 42]].

</details>

<a id="view-document-file-name"></a>

## Understanding managed-document file-name extraction

The document-management view projects metadata and derives a file name through reverse, substring and a selected path separator. It does not open or retrieve the document. A non-NULL source without the selected separator can yield a negative substring length; NULL source propagates NULL.

### How it works

1. Treat stored source/path text as metadata; actual file access is outside the view.
2. Check NULL and missing-separator behavior in the expression.

<details>
<summary>Technical reference and sources</summary>

`vr-sql-2114314792`: [dbo.METADATA_INSIGHT_DOCUMENT_MANAGEMENT_VIEW](sql/2114314792.sql); source-definition SHA-256 `03057d5b147812c56fb50da0074910e2f8ef6b56e7f674e35cb63edebf1c920d`, reading-copy SHA-256 `5cad362ebc8813cbb6978a7d8d1739b7df4d017b170e1fec251802a7909167f2`, one-based inclusive lines [[1, 27]].

</details>

<a id="dynamic-fixed-exec"></a>

## Fixed procedure calls and lexical dynamic flags

In a fixed procedure call, @iError receives the procedure return status; it is not executable SQL text. The called procedure can still change data or invoke further commands, so a fixed target does not make the call read-only.

### How it works

1. Separate a return-status assignment from an EXEC(SQL-text) expression.
2. Retain fixed callee identity and caller-dependent catalog gaps.

### Settings and prerequisites

- Effective caller/default schema and system/callee behavior remain separate.


### Troubleshooting

- DB Architecture/DYNAMIC_DEPENDENCIES.md


### Limits

- Fixed calls do not establish successful locking or completion of the surrounding workflow.


<details>
<summary>Technical reference and sources</summary>

`dynamic-dependency-1434800519`: [dbo.WTH_SplitWork](sql/1434800519.sql); source-definition SHA-256 `2543b07518bd022774a697c2843630fd069c891284661aa18e947d8d9d18bcc8`, reading-copy SHA-256 `87b879a1c38e9f8ba617ac393e6bab3f474d699c819c33ef06ce807f41f1415e`, one-based inclusive lines [[38, 41], [48, 51]].

`dynamic-dependency-1578801032`: [dbo.WTH_UpdateStatus](sql/1578801032.sql); source-definition SHA-256 `6ccce9eacdad61531287ae7733108c14c97d6d226f9dfb75debb80e2cbd4dac4`, reading-copy SHA-256 `5a373b692339f4af2c1c15404dc5507f29e5878a29c4035db35f65ffe7b228f7`, one-based inclusive lines [[195, 198], [201, 204], [242, 245], [257, 260], [305, 308], [313, 316]].

`dynamic-dependency-1596181082`: [dbo.DASH_UpdateKPIData](sql/1596181082.sql); source-definition SHA-256 `4d2fad95cccde0c5510066f86ee392e025c79ff0fdebd4e4378b79d24b16d3d3`, reading-copy SHA-256 `5d7032242fca0bd9c7033fe0d6cf5958c146663141801c921f0da09dd0f077b6`, one-based inclusive lines [[37, 40], [42, 46], [50, 53], [55, 59], [63, 66], [68, 72], [76, 79], [81, 85]].

`dynamic-dependency-1765229689`: [dbo.PMN_Trace](sql/1765229689.sql); source-definition SHA-256 `64187595661f95f3143de5e5af0969862756ce9d5ca0137d2419dfd3418fe186`, reading-copy SHA-256 `6ae37a5ee4f6dcb21298138bc8ad983f2b4b98831f2469f073ca1cc57d66a5f5`, one-based inclusive lines [[25, 28], [82, 89], [99, 106], [116, 123], [138, 141], [144, 293], [314, 319], [325, 328], [336, 355], [363, 378], [386, 389], [392, 395], [402, 405], [408, 411], [418, 421], [424, 427]].

</details>

<a id="dynamic-download-claims"></a>

## Download selection changes queue state

Download-selection routines update ready interface rows and process stamps before returning data. Selection therefore changes queue state.

### How it works

1. Convert numeric record limit into TOP syntax.
2. Bind state/stamp values and run ordered UPDATE stages.
3. Return data after marking and any static child updates.

### Settings and prerequisites

- Process stamps coordinate the selected records; the calling workflow determines downstream processing.


### Results

- UPDATE targets are the specified DOWNLOAD_* tables, with separate source-defined stage limits.


### Limits

- A returned batch does not establish downstream acknowledgment or one atomic claim across every stage.


<details>
<summary>Technical reference and sources</summary>

`dynamic-dependency-218796187`: [dbo.wm_RUDownloadItem02](sql/218796187.sql); source-definition SHA-256 `d3c4dc47d509aff7982a0cedfde1a3664a003dc8637ede157efb6bd7d0b6446f`, reading-copy SHA-256 `fc8951b193e915c05e3a77a8a9414f5b3d4bd8252b1d4ec973227aa6b63527ca`, one-based inclusive lines [[1, 51]].

`dynamic-dependency-250796301`: [dbo.wm_RUDownloadOrderHeader02](sql/250796301.sql); source-definition SHA-256 `1cfe27215a2d90d97ac2c1a01d30f88b94b86546a65d56460d8ca03c49bc26d4`, reading-copy SHA-256 `db06daa3a43db5e7f77a5f40c94a4de7e63fca981d7eac3c866e8d469bb7d515`, one-based inclusive lines [[1, 313]].

`dynamic-dependency-282796415`: [dbo.wm_RUDownloadReceiptHeader02](sql/282796415.sql); source-definition SHA-256 `648d41b1389bca28b2af1a67aac280c09df55a5979374df476e2a5e2a351c6ce`, reading-copy SHA-256 `398653ec4df1003d103aae9d2078f985235f6937efde21b50ed8492434a110e4`, one-based inclusive lines [[1, 323]].

</details>

<a id="dynamic-configured-filters"></a>

## Configured predicates are executable SQL text

Values such as batch ID and warehouse date are bound, but stored FILTER_CONFIG_DETAIL predicate text is appended as SQL syntax. Receipt variants also mark upload/batch state. A receipt batch mark identifies rows selected for subsequent processing. It does not establish that an external system received the receipt; that outcome requires separate delivery evidence.

### How it works

1. Resolve a filter name and warehouse date.
2. Append the stored predicate suffix to fixed templates.
3. Execute with the separate bound values.

### Settings and prerequisites

- Filter name/record type lookup and WAREHOUSE timezone lookup; effective values unobserved.


### Results

- Receipt routines UPDATE container/header records; inventory templates SELECT projections.


### Troubleshooting

- DB Architecture/DYNAMIC_DEPENDENCIES.md


### Limits

- Fixed-template targets do not bound arbitrary configured syntax or prove active configuration.


<details>
<summary>Technical reference and sources</summary>

`dynamic-dependency-314796529`: [dbo.wm_RUReceiptHeader01](sql/314796529.sql); source-definition SHA-256 `eb37f482b9d009aee040d6d00903b039d6073b4faeeef4ef5a46c1c95f61d2e9`, reading-copy SHA-256 `85e7d344146cf5c46432ea961e07275b46d187d947df6888b32511c91f42923c`, one-based inclusive lines [[1, 140]].

`dynamic-dependency-330796586`: [dbo.wm_RUReceiptHeader02](sql/330796586.sql); source-definition SHA-256 `37360be2efe79e5dac8f52afbdab88c6e1fa82a03eeba2ec55bd7f1db20e7570`, reading-copy SHA-256 `33e226d65c5963d182f5db832b3643283f625c14cc60ade3a0f9fe44fc3ab155`, one-based inclusive lines [[1, 157]].

`dynamic-dependency-346796643`: [dbo.wm_RUReceiptHeader03](sql/346796643.sql); source-definition SHA-256 `454bd71df901d53cd87b55fa63f728b62a11e8ab79d8cbcbad7faf7d2456afec`, reading-copy SHA-256 `4fcfe968349063ded85619aa2b7603a4a9d84890799ea7245d60beb87a7f77b8`, one-based inclusive lines [[1, 148]].

`dynamic-dependency-1262275902`: [dbo.wm_RInventory01](sql/1262275902.sql); source-definition SHA-256 `388bf2fb844dea9d364e52d496ebc55224bb9e802b798f7139202733ab88822a`, reading-copy SHA-256 `63da859bd38f50e0d43fade7c99cb92fd67fde6cb7921be3ca75fa03831bfbe1`, one-based inclusive lines [[1, 113]].

`dynamic-dependency-1278275959`: [dbo.wm_RInventory02](sql/1278275959.sql); source-definition SHA-256 `e65fc078c83708ba673f822f136d8419f0e9e6f326433cdd69f29032c56a82f5`, reading-copy SHA-256 `08c7a8063aff6f00d4ea08fc330d677d5bfb77df6f6975bf1793ef7123ec50d7`, one-based inclusive lines [[1, 181]].

</details>

<a id="dynamic-monitoring-identifiers"></a>

## Monitoring names and parameters

The PM header/work monitoring wrappers concatenate table and column expressions into SQL. Passing identifier-named arguments in a parameter list does not undo that earlier syntax construction.

### How it works

1. Look up column metadata.
2. Build aggregation syntax from supplied names/expressions.
3. Bind dates/warehouse and execute the chosen branch.

### Settings and prerequisites

- Caller validation and schema selection are not captured.


### Limits

- A metadata lookup is not a complete allowlist for the constructed identifiers.


<details>
<summary>Technical reference and sources</summary>

`dynamic-dependency-1493228720`: [dbo.PM_RECEIPTHEADER01](sql/1493228720.sql); source-definition SHA-256 `0468d6270fb9a7ecd6c5158de57bc9d517f21c888d9bd9e23109401b5b791fa3`, reading-copy SHA-256 `e9ef5f101d553ca8fc0d24fad416ddf462d3cade1836b4deb4dfd3555478cf41`, one-based inclusive lines [[1, 119]].

`dynamic-dependency-1509228777`: [dbo.PM_SHIPMENTHEADER01](sql/1509228777.sql); source-definition SHA-256 `39fd49a36af9221431254682119ebd88a29cbc5a6dfb406f7ce546c731cd3f6d`, reading-copy SHA-256 `423254d99f711648165f399fa3d77ce8420d5d564a18b646a097b57cc7018148`, one-based inclusive lines [[1, 120]].

`dynamic-dependency-1589229062`: [dbo.PM_WORKINSTRUCTION01](sql/1589229062.sql); source-definition SHA-256 `e74f141db3d0be0b4d5fa0ef380d672f06d5e3bd649588fc451d8a01f5a72c32`, reading-copy SHA-256 `9ac5ebefb930f5c0c1c24db87855d0445af8fa3216d34b207088ee3f3dab68f7`, one-based inclusive lines [[1, 142]].

</details>

<a id="dynamic-fixed-reporting"></a>

## Fixed reports and an external query

Several wrappers execute one fixed SELECT string without binding their declared report arguments. PM_SHIPPED_TODAY_BY_MINUTE uses a four-part external target whose definition is outside the local snapshot.

### How it works

1. Distinguish fixed SQL strings from caller-constructed SQL.
2. Check actual interpolation/binding before attributing filtering to a declared parameter.

### Settings and prerequisites

- Fixed private constants are not effective configuration evidence.


### Troubleshooting

- DB Architecture/DYNAMIC_DEPENDENCIES.md


### Limits

- TRAV_EXEC_PROC does not assign its output parameters in the outer routine.


<details>
<summary>Technical reference and sources</summary>

`dynamic-dependency-436196604`: [dbo.PM_UNSHIPPED_BY_BUILDING_PRIORITY](sql/436196604.sql); source-definition SHA-256 `2bc2653d634ae4462b8054dafb50fcb8a3cbb08c445d759cc515ca112e3fac0c`, reading-copy SHA-256 `a00d98f6831485f5de5ec4a2992e725669e1bd2a58405ca54bd5648617f693bd`, one-based inclusive lines [[1, 109]].

`dynamic-dependency-452196661`: [dbo.PM_TODAY_SHIPPING_QUANTITY](sql/452196661.sql); source-definition SHA-256 `883b3520d5d5f6ac18f163aed5653fdb663a02c9bd218bd6188a87226bf4a30b`, reading-copy SHA-256 `f17a4a93f91498550bb210609d56c462afd83abeec77ce78e1059040c526f61d`, one-based inclusive lines [[1, 36]].

`dynamic-dependency-468196718`: [dbo.PM_TODAY_SHIPPING_COMPLETED](sql/468196718.sql); source-definition SHA-256 `a1a73798cd48ad72f0fcb7986413ba4e2294df207a4fa5ddb33b03dd6b8812fc`, reading-copy SHA-256 `51a5c5eb207299bcf5870fac0ae8b17487ccd9ab7be1b78bf81a2b1d789bf136`, one-based inclusive lines [[1, 54]].

`dynamic-dependency-484196775`: [dbo.PM_SHIPPED_TODAY_BY_MINUTE](sql/484196775.sql); source-definition SHA-256 `a1f66bf6e9116acd0756f776693d0861a175838c299af8ac7a212db6d5306e9b`, reading-copy SHA-256 `6346be18c8f40a8acc4e92d1f5a01fbc7f3fb0956a93af96c7e000936fdfbf9b`, one-based inclusive lines [[1, 43]].

`dynamic-dependency-596197174`: [dbo.PM_FUTURE_SHIPPING](sql/596197174.sql); source-definition SHA-256 `eb69c841a0d355831774445718464a2ff87521cf4e1713ab69c397a795abf05d`, reading-copy SHA-256 `aa1226c6803651697e6d29aa9d1499338674b7a24acda3744a49f35cfe4523a8`, one-based inclusive lines [[1, 57]].

`dynamic-dependency-1788793680`: [dbo.TRAV_EXEC_PROC](sql/1788793680.sql); source-definition SHA-256 `22679dc1bed3fcfd2524b0d1dd71d7de2b3a6be511f25e29fc4684adc79cfdfc`, reading-copy SHA-256 `645b67a0b5bb731e4423259c170311bf42ffada1d26047665f4366869f6f7457`, one-based inclusive lines [[1, 69]].

</details>

<a id="dynamic-configuration-summary"></a>

## Configuration summary JSON limits

The configuration summary builds a query from JSON using QUOTENAME and STRING_AGG, then executes the text without bound parameters.

### How it works

1. Parse nested JSON into a temporary table.
2. Quote and aggregate values, then choose fixed templates by recognized keys.
3. Remove a leading UNION prefix and execute nonempty text.

### Settings and prerequisites

- Recognized keys select fixed query templates.


### Limits

- QUOTENAME limits input length, and the non-MAX STRING_AGG result has a size limit. Oversized input can fail before execution.
- Intermediate branch semantics remain only partially documented.


<details>
<summary>Technical reference and sources</summary>

`dynamic-dependency-181224046`: [dbo.LoadAdditionalConfigsSummary](sql/181224046.sql); source-definition SHA-256 `7a4677693db618182ff148632027de75556094412774dc0f0332b4bf55d3beed`, reading-copy SHA-256 `13480cd8e5d714719971dba937f66737472a080a72c5f2912f1b4dc68e6c2bd3`, one-based inclusive lines [[2, 65], [1337, 1348]].

</details>

<a id="dynamic-maintenance-effects"></a>

## Maintenance commands and partial outcomes

Maintenance routines can truncate tables, delete rows, rebuild indexes and update statistics. Their target selection depends on environment checks, preferences and catalog metadata. Each command has its own execution and error behavior; a partly completed run can leave earlier changes in place.

### How it works

1. Identify environment/preferences/catalog target selection.
2. Separate quoted identifiers from unbound concatenated syntax.
3. Account for per-command error handling and separate executions.

### Settings and prerequisites

- Archive preferences, live metadata/DMVs and environment predicates determine current reach.


### Results

- Azure maintenance catches individual command errors and continues; archive paths do not guarantee one atomic purge.


### Troubleshooting

- DB Architecture/DYNAMIC_DEPENDENCIES.md


<details>
<summary>Technical reference and sources</summary>

`dynamic-dependency-777873938`: [dbo.PURGE_ARCHIVE_TABLES](sql/777873938.sql); source-definition SHA-256 `29275b82cdbb77039cef45ab224e6f21736054631693006470af944d6f171c2b`, reading-copy SHA-256 `fb14357c701b5b5047a9c41a6fe7b6d6eac0229ff4b32470624d94a36c9c59f8`, one-based inclusive lines [[1, 32]].

`dynamic-dependency-337540386`: [dbo.ArchivePurgeRunbook](sql/337540386.sql); source-definition SHA-256 `d11a70296e18cf71eb1d916903d2682cc081ccbed1022a51b5944a8f8a44c1c3`, reading-copy SHA-256 `0d341af9b5c2479a3e820cdbe9bc0415082f4d7b9a22edddc2fd06ef3ce90227`, one-based inclusive lines [[44, 90], [239, 243], [821, 1247]].

`dynamic-dependency-956178802`: [dbo.AzureSQLMaintenance](sql/956178802.sql); source-definition SHA-256 `6ca30420775ab5d138dbdcbc31e33c7fb25823c657af7d8bab3f7867e06957c2`, reading-copy SHA-256 `3193f62b3a13faa55eaf64f004a88d4cbb81cf1e93048af35a1780bcd75c9055`, one-based inclusive lines [[1, 246]].

`dynamic-dependency-2122646805`: [dbo.AzureSQLMaintenance_1](sql/2122646805.sql); source-definition SHA-256 `34abe0f45532c7643bcd4ab5dee09e1a72876d88ea30156d14c473dc0269fc4e`, reading-copy SHA-256 `9153ba3f75d37b8fbd07d4ce5258fef01b99e6af0c9699642d4471e32dfa6d56`, one-based inclusive lines [[1, 269]].

</details>

<a id="dynamic-xml-and-units"></a>

## Partial binding in XML and unit searches

The XML and unit-reference helpers bind some values while constructing other parts of the SQL command as text.

### How it works

1. GetXMLAttributeValueByAttributeName binds XML as @content but concatenates nodeXpath and optional xmlnsDeclarations into query syntax.
2. ITM_DoesUmReferenceExist concatenates metadata table/column names and UMToDelete. Its bound UMCount OUTPUT only returns the count; it does not parameterize the sought unit.
3. Malformed generated syntax can fail without a local TRY/CATCH. The fallback unit-list loop has no outer current-row increment, so an unmatched first list can prevent progress.

### Limits

- Identifier quoting and caller validation are not established by these bodies. The behavior for arbitrary inputs is not guaranteed to be read-only.


<details>
<summary>Technical reference and sources</summary>

`dynamic-dependency-1016703020`: [dbo.GetXMLAttributeValueByAttributeName](sql/1016703020.sql); source-definition SHA-256 `8e0cf55b396eac4dcfb3b832443980df2c61ad6e64709d2304616275dbd22f74`, reading-copy SHA-256 `fe1d403bbfc2472281d11051f05877dc0f11d304052c77afad16403231e35b77`, one-based inclusive lines [[1, 51]].

`dynamic-dependency-1800705813`: [dbo.ITM_DoesUmReferenceExist](sql/1800705813.sql); source-definition SHA-256 `1f9b6411439c03821be1c5ddddb411d9296bce58b7847510d5810a6f2e0aa265`, reading-copy SHA-256 `4b47295a3c695d74a010537e4711f5e678915ff85820a37c51c78b95687dd49d`, one-based inclusive lines [[1, 108]].

</details>

<a id="dynamic-script-generator"></a>

## Generated INSERT text versus executed DML

The script generator builds a SELECT that returns INSERT statements as text. It does not execute those emitted statements, but running the generator still reads the selected table rows.

### How it works

1. Select tables/columns from metadata.
2. Build a SELECT that formats INSERT text by legacy type cases.
3. Return generated scripts as values.

### Settings and prerequisites

- Catalog mask, current data and legacy type handling govern output.


### Results

- Generated data scripts, not applied inserts.


### Troubleshooting

- DB Architecture/DYNAMIC_DEPENDENCIES.md


### Limits

- Generated scripts are not guaranteed to provide a complete or faithful restore.


<details>
<summary>Technical reference and sources</summary>

`dynamic-dependency-1953754363`: [dbo.sp_generate_insert_script](sql/1953754363.sql); source-definition SHA-256 `70717108c7e2ac3419d717ab9e34d7bc497116e59fdc147ebdecfcfaf4422249`, reading-copy SHA-256 `8b297ae6ac0bc7e7b222226b1805378cc090562366a0c9ed18264b3fb89d4adb`, one-based inclusive lines [[1, 223]].

</details>

<a id="dynamic-catalog-null"></a>

## Unresolved catalog references and candidate targets

A NULL referenced_id means the catalog did not resolve an object identity. Depending on the source expression, it can represent an unqualified call, system routine, alias, runtime-created table, missing staging relation or cross-database function.

### How it works

1. Locate the source expression associated with the unresolved catalog reference.
2. Compare the expression with available local object identities without assuming a match.
3. Keep external, system and runtime-created dependencies explicit.

### Settings and prerequisites

- An unqualified name depends on caller/default-schema resolution. A same-name local object is a candidate, not proof of the runtime binding.


### Limits

- tempSecurityCheck lacks a # prefix and is an ordinary table; no session-private lifecycle guarantee.


<details>
<summary>Technical reference and sources</summary>

`dynamic-dependency-1260179885`: [dbo.CheckSecurityPermission](sql/1260179885.sql); source-definition SHA-256 `3da1644940792611c12d9c16dd79331d3756e63812f445f5793e31fc64c8ec38`, reading-copy SHA-256 `3a7152c88007566a73bc3c23eac5138d07a7d9ef6563361d7fb04f57e1526949`, one-based inclusive lines [[7, 54], [57, 75], [78, 95], [97, 118]].

`dynamic-dependency-1161315447`: [dbo.POPULATE_Generic_Config_Dtl](sql/1161315447.sql); source-definition SHA-256 `055de6a55870ac9bfa7bbdd167f8985c3cad475502046fd52bdc79b805fbb103`, reading-copy SHA-256 `6c722bd216bb7321a1ff4cd0336b0dae1a34ea8c9220260dc6649dc65b5f6b35`, one-based inclusive lines [[25, 54], [57, 60], [64, 67], [72, 75], [80, 83], [118, 121], [143, 146], [152, 155], [162, 165], [172, 175], [261, 264], [277, 280]].

`dynamic-dependency-1243151474`: [dbo.TRAV_SetShipByAndDeliverByForReturns](sql/1243151474.sql); source-definition SHA-256 `6d4b771b199f60b23fef165b35cd8f1dd7e84b25a81787d434cc2270a7ff592b`, reading-copy SHA-256 `83dc0b45a6b4f5dcc8bf5c21cdd0961b29b1186b7302c49e4965664e34df9924`, one-based inclusive lines [[24, 28]].

`dynamic-dependency-1749229632`: [dbo.PMN_TableSizes](sql/1749229632.sql); source-definition SHA-256 `fe7f2c8786f650bed9f59e9f92e4123168993c0c0228d764b5be90cdf4b66582`, reading-copy SHA-256 `26a79b56c4bdab93dbb64540d521c31645dd79998a98b258ca49f8bd6e240e8b`, one-based inclusive lines [[23, 26]].

`dynamic-dependency-757226098`: [dbo.MetaTrans_GetLocationInventory](sql/757226098.sql); source-definition SHA-256 `99f8c2c6b630a5dbbb7625d9ea2f7ef39693346a051402a6dfc1953f1fd99d16`, reading-copy SHA-256 `5964e05ca822965aadec38fd8a8a8e3c1e09c46d1a91ca978ca6f66e66f722ea`, one-based inclusive lines [[15, 18]].

</details>

<a id="labor-monitor-window"></a>

## Labor monitor counts and time windows

The routines use different record sources, timestamp columns and filters. Some count instructions or distinct users; condition-group totals can double-count a work unit. A browser-midnight tile differs from rolling one-hour windows, and unsupported tile codes return no tile.

### How it works

1. Select the exact monitor routine and filter context.
2. Compare END_DATE_TIME, DATE_TIME_STAMP and browser-midnight predicates before comparing counts.

<details>
<summary>Technical reference and sources</summary>

`lya-sql-117223818`: [dbo.LBR_MonitorLaborGroupsChartData](sql/117223818.sql); source-definition SHA-256 `5b9d2542886ce534925aeaab2783b4b4a6f4d8327938ac99a7c922abf4f22766`, reading-copy SHA-256 `93c622b315fc4dcbdf6006546cde463309058d804eba14eab47f3bc5295890c2`, one-based inclusive lines [[1, 89]].

`lya-sql-133223875`: [dbo.LBR_MonitorLaborIndicatorTiles](sql/133223875.sql); source-definition SHA-256 `cfe5548be2c3316f83cf1094eaf46e651e6b523a5085d918b50fb1882f2046c2`, reading-copy SHA-256 `40372014f3159eec989f741a27af84749eacd97693dcf845684ca931b60e41d6`, one-based inclusive lines [[1, 87]].

`lya-sql-149223932`: [dbo.LBR_MonitorLaborUsersChartData](sql/149223932.sql); source-definition SHA-256 `20d5f6145bae08cc63225f08cfb936eb3ec2608cb7e11c3a5a0513f9d1278970`, reading-copy SHA-256 `8c5deceb5b8392979deeda348fe3f2fd1fd85ba43593c6fea4f9827c2a1f12b2`, one-based inclusive lines [[1, 105]].

`lya-sql-970798866`: [dbo.WRK_MonitorAssignedUserChartData](sql/970798866.sql); source-definition SHA-256 `e3527047cd4e252e9e4b3ee3d24504a2836e654aa330ec8e4c86ebedae5bf3ed`, reading-copy SHA-256 `07d8eb7fbd0ff6db0d91e97c6cc20855576f4f9b459c2c1f09c1cc924d9994a4`, one-based inclusive lines [[1, 92]].

</details>

<a id="labor-active-intraday"></a>

## Intraday labor estimates and active-user counts

It counts distinct users with sufficiently recent eligible activity, using group tolerance or 30 minutes. Work quantity, formatted labor-time grouping, throughput and NULL work-group joins affect estimates. These results do not establish attendance or end-to-end elapsed duration.

### How it works

1. Compare eligible source windows, hold configuration and work-type selection.
2. Inspect NULL work-group joins and grouped formatted durations before interpreting calculated hours.

<details>
<summary>Technical reference and sources</summary>

`lya-sql-904702621`: [dbo.GetIntraDayLaborProgressActiveEmployees](sql/904702621.sql); source-definition SHA-256 `98bd01b391cbd101f076ce233cf63435caae67fde88a595439739c471370fe97`, reading-copy SHA-256 `bff5d5667f9ee823543c5afd9ed82fffeeb2baf65e1925aa3a3accbd284c8928`, one-based inclusive lines [[1, 54]].

`lya-sql-920702678`: [dbo.GetIntraDayLaborProgressWorkDetails](sql/920702678.sql); source-definition SHA-256 `e391fe7e8ebe3a915c7f13f707650f29758f932b29255503827b920b41ced916`, reading-copy SHA-256 `23bd57d825fd973754f126160037931abcdd63fda7d2ae1edac4ced564750e63`, one-based inclusive lines [[1, 270]].

</details>

<a id="labor-dashboard-refresh"></a>

## Stored labor dashboard values and refresh

The reader pivots MAX stored values without checking expiry. The refresh routine either replaces all five KPI identifiers when one is missing or updates only expired rows. NULL expiry can prevent refresh, and duplicate identifiers are not rejected by the completeness test.

### How it works

1. Check the stored identifier coverage and timestamp/expiry values through an authorized process.
2. Distinguish the read procedure from the separate refresh procedure and its caller transaction.

<details>
<summary>Technical reference and sources</summary>

`lya-sql-1468180626`: [dbo.DASH_GetLaborKPIData](sql/1468180626.sql); source-definition SHA-256 `72b83bdf3b2a71b028499a395d5e4280ed18dffd5e7f5dfab41d16144ac73064`, reading-copy SHA-256 `d1d992ab90844e4cbe2b4e3e6b78a32dd1ec7994e5bf38ff4ae647e4259f774b`, one-based inclusive lines [[1, 34]].

`lya-sql-1548180911`: [dbo.DASH_RefreshLabor](sql/1548180911.sql); source-definition SHA-256 `1b9f06070ad9dcedb58cf1d4162b99f8d97839726b3651a83c2d1f1b27987e11`, reading-copy SHA-256 `7dedd3092fc7168cbc66aef35fd238537daa124f1b516a67e6df40d674c97829`, one-based inclusive lines [[1, 142]].

</details>

<a id="labor-log-and-consolidation"></a>

## Labor entry context and consolidation groups

The two MetaTrans log helpers return fixed presentation rows only. The grouping helper returns candidate group identifiers without persisting a consolidation. SaveUserLastActivityEndTime stores a supplied timestamp without enforcing that it increases.

### How it works

1. Identify whether the caller requested screen context, grouping or timestamp storage.
2. Validate split identifiers and ordering before relying on group assignments.

<details>
<summary>Technical reference and sources</summary>

`lya-sql-1061227181`: [dbo.MetaTrans_IndirectLaborWorkbenchLog](sql/1061227181.sql); source-definition SHA-256 `9c5d5fa4742dbca47f085b7bedeff31b7d1cfd39c3835679975eeef8097eb664`, reading-copy SHA-256 `9cf4511b5d6cc8285735d74442bacb5f817a7a2e225c0361380a4e504da3f05c`, one-based inclusive lines [[1, 26]].

`lya-sql-1077227238`: [dbo.MetaTrans_ManualLaborActivityLog](sql/1077227238.sql); source-definition SHA-256 `8bdaa98f3f7e1502093bc698bdf239d7b57f23ff22a5d33626b3ef4eab268d1f`, reading-copy SHA-256 `b0116ffb09dd95a772066f0d5db2df218368bcb9cfe07715a9174b536b0c5a9f`, one-based inclusive lines [[1, 35]].

`lya-sql-776702165`: [dbo.Get_LaborActivityGroupsForConsolidation](sql/776702165.sql); source-definition SHA-256 `afa627cc06f9215d24ce264bd893266d03a006b3c8a07c18d35282a21394c22c`, reading-copy SHA-256 `9acbf82e26c6b92ca246c1893c2145472bac16aeb4548e2f4d36e1d496fcad4b`, one-based inclusive lines [[1, 76]].

`lya-sql-1153751513`: [dbo.SaveUserLastActivityEndTime](sql/1153751513.sql); source-definition SHA-256 `eb3253481a69eb134ce793a9bf5c63803870566cbfa3cc56c32d70c3a556aabb`, reading-copy SHA-256 `e31c570393b014ad18c37574ab5b5129d8c303f310a66e60a6cc81ddca7a0ade`, one-based inclusive lines [[1, 25]].

</details>

<a id="labor-report-and-export"></a>

## Labor reports and incremental export windows

The labor-type detail report uses inclusive START_DATE_TIME bounds. The user-summary detail routine has no date or warehouse filter. The SCI export uses DATE_TIME_STAMP greater than start and at most end, with non-NULL completion time and coded activity exclusions.

### How it works

1. Identify the exact report/export procedure.
2. Compare the field and boundary operators used for its time window.

<details>
<summary>Technical reference and sources</summary>

`lya-sql-209748150`: [dbo.RPT_LaborTypeSummaryDetails](sql/209748150.sql); source-definition SHA-256 `9029cec7bb53581a36f0d5324bb2bbeabb4f22acb6623f3c44278884f4b95f69`, reading-copy SHA-256 `ff90fe87519049581334ba783b6f7a7868459990d0f972f0a7b1710c190531d7`, one-based inclusive lines [[1, 52]].

`lya-sql-801750259`: [dbo.RPT_UserSummaryReportDetails](sql/801750259.sql); source-definition SHA-256 `ee47a550a9691264fe274606ec9e1805a58ca8e80278162762b9db46238396ed`, reading-copy SHA-256 `57b0bb648ed2e919fca33099639d3f805d9310f4ab3a8a990e9427bec6dc7a0f`, one-based inclusive lines [[1, 40]].

`lya-sql-1217751741`: [dbo.SCI_LABOR_MANAGEMENT_DETAIL](sql/1217751741.sql); source-definition SHA-256 `68e6fa79f7f8633231388a0035ffdc2b4b413e7ea1b744d5ee106f164ed46cbc`, reading-copy SHA-256 `1869e26f5032a0e67f39d026b068821d6a8093b58f896883f0feef64913165db`, one-based inclusive lines [[1, 58]].

</details>

<a id="security-registration"></a>

## Security registration and profile cleanup

The registration routines insert missing records and leave existing records unchanged. Profile cleanup performs nine deletes and a final activity insert without its own transaction. None of these bodies authenticates the caller or proves an action is authorized.

### How it works

1. Review the exact insertion key or deletion order and caller authorization.
2. Use the separately established caller transaction and constraints when assessing partial failure.

<details>
<summary>Technical reference and sources</summary>

`lya-sql-392700797`: [dbo.dbc_ISecurity](sql/392700797.sql); source-definition SHA-256 `cee4d3bba96a24a7083890878af2b97cbbdae66638efb404ba1a6a95b747ffa0`, reading-copy SHA-256 `52e5d012ca3d3634ba7436e40f232df9990986a941003b499026ee277c62bb66`, one-based inclusive lines [[1, 81]].

`lya-sql-408700854`: [dbo.dbc_ISecurityCheckpoint](sql/408700854.sql); source-definition SHA-256 `d40e68a5b6b75a62b64997f27eb58d348753d02d55f2ddca74b94df7e3ec872e`, reading-copy SHA-256 `e3a53f9dc32a5c735258033367aa186a16807a1bf2d9ee92285a9052fcf4f64d`, one-based inclusive lines [[1, 43]].

`lya-sql-544720993`: [dbo.dbc_ISecurityGroup](sql/544720993.sql); source-definition SHA-256 `0e299f769fefc249677a18a55b92f2a38823ad6ec1fc04385a02a6f70abe28b9`, reading-copy SHA-256 `38b23608a9608c6a318e980a79c453f9ce5cb0c4d3bfa466801522779d0f3158`, one-based inclusive lines [[1, 38]].

`lya-sql-568701424`: [dbo.DeleteUserProfileReferences](sql/568701424.sql); source-definition SHA-256 `88ea64d9e486103b1610a284585251e8dcba3ef732ac2171752d07e88ad201be`, reading-copy SHA-256 `cd532e390b24b1eafa31a8cbe112bf08c34051992ffe408a5078cbc3d88a3336`, one-based inclusive lines [[1, 23]].

`lya-sql-1783325763`: [dbo.wm_RUserProfile01](sql/1783325763.sql); source-definition SHA-256 `b7ca66b78fac083d282aae183c61af97163a4245ea4e9a99bc2e084631e7184a`, reading-copy SHA-256 `30caa49713d149e004af6c7b7b7f8ea4eb97bca63c1e82607208a3b3687c0525`, one-based inclusive lines [[1, 13]].

</details>

<a id="security-form-selection"></a>

## Security form branches and checkpoint display

Security form selection has two different branches. The all-forms branch applies active-form, parent and restricted-ID rules, with a supplied authorized-user bypass. The explicit-user branch selects SECURITY and checkpoint matches without repeating those filters. Resource text and checkpoint values do not authenticate the caller.

### How it works

1. Determine @allForms and inspect the branch-specific predicates.
2. Resolve culture/resource fallback separately from permission enforcement.

<details>
<summary>Technical reference and sources</summary>

`lya-sql-1505752767`: [dbo.SEC_GetCheckpointsWithResourceFileKeys](sql/1505752767.sql); source-definition SHA-256 `8a8f2947995425158e21f5ece3967a21d77ddeec46ae04fcb34eba2018873fd5`, reading-copy SHA-256 `304c8150657d2db85f73afa970a27dcd407183345f3936592a7deedbe158deb6`, one-based inclusive lines [[1, 18]].

`lya-sql-1521752824`: [dbo.SEC_GetSecurityForms](sql/1521752824.sql); source-definition SHA-256 `2c2783d30ff5a68af64fe7d4cf98797afcb376c3bcadd88e71d35b4dcfb05bc6`, reading-copy SHA-256 `d08e5849fa6457e733713eb7b5292304205bd6c6906bccec0782ad73554ca3aa`, one-based inclusive lines [[1, 94]].

</details>

<a id="security-migration-staging"></a>

## Security migration report persistent staging

It creates, fills, updates and drops an ordinary table named tempSecurityCheck. The name has no # prefix. It reports old-enabled/new-disabled permission mappings, but concurrent calls can collide and failure before the final DROP can leave the table behind.

### How it works

1. Review the create/populate/compare sequence and persistent staging target.
2. Establish caller isolation and failure cleanup before any separately authorized execution.

<details>
<summary>Technical reference and sources</summary>

`lya-sql-1260179885`: [dbo.CheckSecurityPermission](sql/1260179885.sql); source-definition SHA-256 `3da1644940792611c12d9c16dd79331d3756e63812f445f5793e31fc64c8ec38`, reading-copy SHA-256 `3a7152c88007566a73bc3c23eac5138d07a7d9ef6563361d7fb04f57e1526949`, one-based inclusive lines [[1, 120]].

</details>

<a id="yard-visibility-counts"></a>

## Yard visibility detail and total differences

Detail includes actual or scheduled trailer locations; header totals join actual locations only. Receipt and appointment joins can multiply rows and sums, while only selected identifiers are counted distinctly. NOLOCK also limits consistent interpretation.

### How it works

1. Compare actual-versus-scheduled location selection.
2. Inspect receipt/detail/appointment multiplicity before comparing counts or quantities.

<details>
<summary>Technical reference and sources</summary>

`lya-sql-897750601`: [dbo.RPT_YardVisibilityDetails](sql/897750601.sql); source-definition SHA-256 `26718c433878b346d9a92193274c40b0dc3305a3ac42900e3b1d1ae4bdf734b7`, reading-copy SHA-256 `364338dd58b6702b5fc1d3caaaf6a2f5fbbab2f5d4b8bc79efd686cd795b8c90`, one-based inclusive lines [[1, 65]].

`lya-sql-913750658`: [dbo.RPT_YardVisibilityHdrDetails](sql/913750658.sql); source-definition SHA-256 `bfc500f0d5f038d6b2f48c1acdd6d3e360368aa5e6c7cbaad7fec2ab9ef63871`, reading-copy SHA-256 `828d2cc84ecb361d1cef791542243769d4396378090743241978588ea9d82a7a`, one-based inclusive lines [[1, 53]].

`lya-sql-929750715`: [dbo.RPT_YardVisibilityRcptDetails](sql/929750715.sql); source-definition SHA-256 `db9c5b5a4f8aa3cb2dd494bd37169d35eece2d7b502a05ca6cc58fff443a64ab`, reading-copy SHA-256 `620629b49184359589e3c1845032df9a0068367e5f6a6876323219ab419b9e0a`, one-based inclusive lines [[1, 34]].

</details>

<a id="dock-work-context"></a>

## Dock transfer context, work flags and grid settings

The transfer context routine only returns container and shipment selections. A different dock-work routine updates a flag then calls a container helper, even if the source lookup produces NULL. Grid customization is a separate insert-if-missing operation.

### How it works

1. Identify the context getter versus work-state mutation.
2. Account for unordered TOP 1 context and the delegated container update.

<details>
<summary>Technical reference and sources</summary>

`lya-sql-501225186`: [dbo.MetaTrans_DockLocationTransfer](sql/501225186.sql); source-definition SHA-256 `a1057b5823ca1a1b2b853fc2dff111719715ab2cc9d62ef422f022252840a60b`, reading-copy SHA-256 `3a17e72847a3330f8f96977b6e44ae17b314474996e20fbe0567825c5d75e6b3`, one-based inclusive lines [[1, 61]].

`lya-sql-1194799664`: [dbo.WRK_UpdateDockWorkCreated](sql/1194799664.sql); source-definition SHA-256 `d61c4da4cfb5550e242ce652ac4d5f638d7969b78beaffc94e0329edb8e05fce`, reading-copy SHA-256 `ad959e6a4d1bc657b60c55c421837b37b833ee0b6611bda2f53cc30a3eb14040`, one-based inclusive lines [[1, 17]].

`lya-sql-1852181994`: [dbo.dbc_IDockMgrGridCustomization](sql/1852181994.sql); source-definition SHA-256 `ef9ff3946f6b49d7c91d795098fa62cf4e613378c5e65d7eb32e22eb15ddd87f`, reading-copy SHA-256 `fb30c88764b63faebb2f38107d28e3eb75f5c3a15c8516c5c8c995137bbce84a`, one-based inclusive lines [[1, 75]].

</details>

<a id="activity-session-time"></a>

## Session timeout units and activity samples

The timeout routine divides elapsed seconds by 86400.0, so its interval is in days. The sampling report generates 30-second timestamps and counts overlapping session rows by coded user type, not distinct employees; its recursion has no duration cap.

### How it works

1. Interpret the timeout unit from the expression.
2. Bound a separately authorized sampling request and distinguish sessions from people.

<details>
<summary>Technical reference and sources</summary>

`lya-sql-762798125`: [dbo.wm_UUserActivity01](sql/762798125.sql); source-definition SHA-256 `11ee2a4eef1aee0796b25de7d62f43d27756d9218e15fdd2d231263f81191f23`, reading-copy SHA-256 `749147d0d712f4bc5781b80fb13f410c0099519f1ba49e24082acecbb9f8cb2f`, one-based inclusive lines [[1, 16]].

`lya-sql-1781229746`: [dbo.PMN_UserActivity](sql/1781229746.sql); source-definition SHA-256 `d5ee9d6737ec5fe123ba8701cba6b4a1865cdbdf081e198b008b4e8fa886a1d4`, reading-copy SHA-256 `cd5f2894d24655e1322419509453f005ffa9222d9be7414907ad0e5148221bc6`, one-based inclusive lines [[1, 36]].

</details>

<a id="inventory-diagnostic-counts"></a>

## Inventory diagnostic count definitions

The age reports filter inventory record timestamps. Negative-history reports count negative after-state transaction records, not transitions or distinct locations. The shipping mismatch compares on-hand quantity only; allocated quantity is displayed but not compared, and missing shipping aggregates are excluded.

### How it works

1. Read the source predicate and counting unit before interpreting a report title.
2. Check NULL joins, server-local time windows and location/warehouse identity.

<details>
<summary>Technical reference and sources</summary>

`lya-sql-1127675065`: [dbo.RPT_CSO_UserLocationsGreaterThan1DayOldDetails](sql/1127675065.sql); source-definition SHA-256 `9e80edc67826f0a4dbc3d3a8cb25d5dc029f2fd1a2d75161e09361ac92f6b466`, reading-copy SHA-256 `5e75132f83fa26294a69240cd163ac13cc0437f0e0edf1181ac02e4f583b416a`, one-based inclusive lines [[1, 10]].

`lya-sql-1143675122`: [dbo.RPT_CSO_UserLocationsGreaterThan1DayOldCount](sql/1143675122.sql); source-definition SHA-256 `098e14ab23e328f4c6498a94319d0741e5e1e54e14a2e395e5d19b8b87f0f3b4`, reading-copy SHA-256 `0e64e4d22aff9c6ce57fe7723284399539bafa4889ac98797f6dbdecd1bcadeb`, one-based inclusive lines [[1, 9]].

`lya-sql-1207675350`: [dbo.RPT_CSO_TimesALocationHasGoneNegativeInPast30DaysDetails](sql/1207675350.sql); source-definition SHA-256 `3aba4a35459e9cfd28314537720996d9476ccf427908d6ac5bc037d5a32817d8`, reading-copy SHA-256 `da476425861e2412b880c7b9770f406b0f4f52e694325d379621c3a4813b6749`, one-based inclusive lines [[1, 7]].

`lya-sql-1223675407`: [dbo.RPT_CSO_TimesALocationHasGoneNegativeInPast30DaysCount](sql/1223675407.sql); source-definition SHA-256 `3fcfe1774411c9a7251f251706ef68d0ddd560f43cc7b6322427d835f680e987`, reading-copy SHA-256 `d14b3da654f3e0388cee13b387432593ea77d113400950d885cedf1993b9ac52`, one-based inclusive lines [[1, 7]].

`lya-sql-1239675464`: [dbo.RPT_CSO_ShipDockOnHandandAllocatedQtyNotEqualShippingQtyDetails](sql/1239675464.sql); source-definition SHA-256 `125ada3ba8651a11148a2c92cd48f573206866ac5f096b77ea7b436e12fc479b`, reading-copy SHA-256 `fb9722d9326764486b0e16ad75eebd681ea9d88c8186359f3bd50c6270ebf230`, one-based inclusive lines [[1, 17]].

`lya-sql-1255675521`: [dbo.RPT_CSO_ShipDockOnHandandAllocatedQtyNotEqualShippingQtyCount](sql/1255675521.sql); source-definition SHA-256 `9508411e119668a95499d88ca84aa183e5a2662f7951aea40c11be34f8199800`, reading-copy SHA-256 `f2b7495bec1fef64d657361ed0bf48a3b60fe49e8cf058144672ba68b4671d2d`, one-based inclusive lines [[1, 17]].

</details>

<a id="bom-detail-context"></a>

## Bill-of-material inventory context

The bill-of-material detail lookup tests inventory existence by item, location and warehouse without checking company or available quantity. It also returns item attributes, configuration status and distinct detail rows. Finding a row does not reserve stock or assemble a product.

### How it works

1. Check the exact item and company join separately from inventory existence.
2. Use separately evidenced availability and reservation rules for operational decisions.

<details>
<summary>Technical reference and sources</summary>

`lya-sql-517225243`: [dbo.METATRANS_GetBillOfMaterialDetails](sql/517225243.sql); source-definition SHA-256 `529f145823395e317c31abc9f54522c5313bbbdbdf10a53fb3a52240e76bec73`, reading-copy SHA-256 `e53da17201f345ceff382eac7efd0f7161e0d3019dc8e511ed4a3ac083d33ca2`, one-based inclusive lines [[1, 41]].

</details>

<a id="bill-of-lading-shape"></a>

## Bill-of-lading address and line selection

The container branch includes internal MOP number and container type; the shipment-detail fallback omits those columns. Address selection follows record existence and address-1 selectors, so an individual NULL address field does not necessarily fall back to another source.

### How it works

1. Review the header address CASE selection and coded freight category.
2. Determine whether any container exists before binding the second result shape.

<details>
<summary>Technical reference and sources</summary>

`lya-sql-1747409`: [dbo.RPT_BillOfLadingHeader](sql/1747409.sql); source-definition SHA-256 `48256710075b2127cf3a9449fe2853611b5ef8b777c726914b9afea225677ecb`, reading-copy SHA-256 `f8a689cd3ff373f8d417e55c35efabd701dca460d6a2d7e63b8e6bd26dfdaf63`, one-based inclusive lines [[1, 483]].

</details>

<a id="performance-cache-read-refresh"></a>

## Cached dashboard reads and refreshes

The receiving, shipping and work getters read stored cache values. The general KPI getter calls an area refresher first and also updates expiration metadata across warehouses. Reading a saved value does not prove that it is current.

### How it works

1. The receiving, shipping and work getters read stored KPI values without testing expiry.
2. The general KPI getter updates expiry metadata across warehouses, calls its selected area refresher, then pivots cached text.

### Results

- Named KPI fields from cached VALUE text; missing identifiers can be NULL.


### Limits

- PIVOT MAX over text can select a duplicate value independently of its timestamp; it does not select the latest row or the largest numeric value.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-1484180683`: [dbo.DASH_GetReceivingKPIData](sql/1484180683.sql); source-definition SHA-256 `cce27b1ea6d3e8276a62488c41310bdd0ac121bd33e941d12227a62cddb01d5b`, reading-copy SHA-256 `91569309c7c9c0e0b1b5258f3f0e518748e051f91db151dcb0a459a26d3dc265`, one-based inclusive lines [[1, 88]].

`pbm-batch-1500180740`: [dbo.DASH_GetShippingKPIData](sql/1500180740.sql); source-definition SHA-256 `a5aa5295d1a59bda015da72dc07327e3236ad39f348be50ecb6f2d48fdfa9d83`, reading-copy SHA-256 `e3efc0f1f898eb46c685b4c87a6041d738ca5575d1ed3739e97d32b1a817b232`, one-based inclusive lines [[1, 103]].

`pbm-batch-1516180797`: [dbo.DASH_GetWorkKPIData](sql/1516180797.sql); source-definition SHA-256 `e4ae4b3e8a048446ffe3b8c778f53e94d10fa96b9557128f44eae029357a9cd3`, reading-copy SHA-256 `7c3be4a907964bf5089a8c296b2876ba0057d652484a0183e450ef53c081da47`, one-based inclusive lines [[1, 43]].

`pbm-batch-1452180569`: [dbo.DASH_GetKPIData](sql/1452180569.sql); source-definition SHA-256 `965bf404d737c9b4a1aa1804a048548ad2d223e39dfa20abb999d7027ef1754b`, reading-copy SHA-256 `368426eee16389cec8d8f755cd3294d72fb3c3ceb1637c6a0f53ae18852596c3`, one-based inclusive lines [[1, 243]].

</details>

<a id="performance-cache-rebuild"></a>

## Dashboard cache completeness and expiration

Dashboard refresh checks whether every required identifier is present. It rebuilds incomplete sets and refreshes complete sets in groups when any group member is stale.

### How it works

1. Check for 13 distinct receiving IDs, 15 shipping IDs or 28 work IDs. Duplicates do not invalidate coverage.
2. Missing coverage deletes/reinserts the set; any stale member causes its full group to update.

### Troubleshooting

- A missing expiration setting can fail a NOT NULL insert; the column default of 5 does not replace an explicitly supplied NULL.
- Refresh uses a strict less-than expiration comparison; equality does not count as expired.


### Limits

- A rebuild uses separate deletion and insert statements; whole-rebuild atomicity depends on the calling transaction.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-1532180854`: [dbo.DASH_RefreshInboundData](sql/1532180854.sql); source-definition SHA-256 `36d3632ebc6a2fca5334509e082e36f96b9f92d8314e8ad96daa9bca4b51eb7c`, reading-copy SHA-256 `7b87fd482468f23947a100209cdb0c254c8d67ff3a68d17cac08e05be12a85dc`, one-based inclusive lines [[1, 111]].

`pbm-batch-1564180968`: [dbo.DASH_RefreshOutboundData](sql/1564180968.sql); source-definition SHA-256 `8a771c5ab2b07268d2af4418cf49865773de9f976133456e05fe8b3192abbbcf`, reading-copy SHA-256 `62d3742469277b64f4739ec7aaa5932cdadf7e80aa5e82534b1f0e47c5de5a91`, one-based inclusive lines [[1, 109]].

`pbm-batch-1580181025`: [dbo.DASH_RefreshWorkData](sql/1580181025.sql); source-definition SHA-256 `6fd060dedf623795e82a35d27ad03da554f0e9c6c0a2420e10e723f348724c4b`, reading-copy SHA-256 `17493deb322cbede626f07469f4441ad9c1a7fe23ba29c70b4a1e5b0b03f0444`, one-based inclusive lines [[1, 142]].

</details>

<a id="performance-capture-history"></a>

## Dashboard snapshot history

Dashboard history selects the latest stored planned/actual snapshot in each time window. Capture inserts snapshot pairs and removes rows older than 14 hours. The current point may come from an older retained row; a window without a snapshot is displayed as zero.

### How it works

1. Count planned and actual headers, then insert two cache rows when the freshness count is at most 1.
2. Select TOP 1 by timestamp inside each inclusive window and concatenate the points from oldest to current.

### Results

- Seven text-encoded numeric points and a fixed timeline label.


### Troubleshooting

- Two fresh rows for the same identifier can satisfy the freshness count even if the other identifier is absent.


### Limits

- Snapshot values are not interval event counts or process duration.
- Receipt appointment joins can multiply header counts because there is no DISTINCT.
- The oldest receiving window spans 13 to 12 hours before now; shipping spans 14 to 12 hours before now.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-1436180512`: [dbo.DASH_CaptureDashboardData](sql/1436180512.sql); source-definition SHA-256 `3fbd5de9cd2ae17b1c3563b8ba98d28ec7ee1bf170cd7a9ddbf0cd4625debf8d`, reading-copy SHA-256 `4051064c7062a0de172b44170a26887c352da6e472b6f2eb072de8f8b9db6f12`, one-based inclusive lines [[1, 97]].

`pbm-batch-1484180683`: [dbo.DASH_GetReceivingKPIData](sql/1484180683.sql); source-definition SHA-256 `cce27b1ea6d3e8276a62488c41310bdd0ac121bd33e941d12227a62cddb01d5b`, reading-copy SHA-256 `91569309c7c9c0e0b1b5258f3f0e518748e051f91db151dcb0a459a26d3dc265`, one-based inclusive lines [[1, 88]].

`pbm-batch-1500180740`: [dbo.DASH_GetShippingKPIData](sql/1500180740.sql); source-definition SHA-256 `a5aa5295d1a59bda015da72dc07327e3236ad39f348be50ecb6f2d48fdfa9d83`, reading-copy SHA-256 `e3efc0f1f898eb46c685b4c87a6041d738ca5575d1ed3739e97d32b1a817b232`, one-based inclusive lines [[1, 103]].

</details>

<a id="performance-dashboard-lock"></a>

## Dashboard update locking

Dashboard refresh requires an Exclusive application lock. Only return code 0 enters the refresh branch; code 1, meaning the lock was granted after waiting, skips it.

### How it works

1. Request the fixed area lock with a 10-millisecond timeout. Its name has no warehouse suffix.
2. On return code 0, refresh the dashboard and explicitly release the lock.

### Results

- A conditional refresh call; no forwarded success or lock result.


### Troubleshooting

- Expiration is updated before the lock is requested.


### Limits

- The lock uses the default transaction ownership, but the body starts no transaction. The caller must provide its transaction lifecycle.
- Exception cleanup is not coded.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-1596181082`: [dbo.DASH_UpdateKPIData](sql/1596181082.sql); source-definition SHA-256 `4d2fad95cccde0c5510066f86ee392e025c79ff0fdebd4e4378b79d24b16d3d3`, reading-copy SHA-256 `5d7032242fca0bd9c7033fe0d6cf5958c146663141801c921f0da09dd0f077b6`, one-based inclusive lines [[1, 87]].

</details>

<a id="performance-pm-membership"></a>

## Performance monitor warehouse filtering

Most selected counters use the supplied username to filter profile and warehouse-access tables. Their membership query is a cross join, so even the All branch depends on at least one access-table row existing. It is a report filter and does not authenticate the supplied name.

### How it works

1. An empty parameter becomes NULL and permits non-NULL source warehouses.
2. Profile All or the coded restricted mode qualifies warehouse membership through the exact subquery.

### Results

- COUNT counters return0 for no matches; the shipped-lines SUM can return NULL.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-1477228663`: [dbo.PM_ReceiptContainer01](sql/1477228663.sql); source-definition SHA-256 `d544662235615fbf2c77dc035ad60d6e42aa728010aa46513514beebf2da65ed`, reading-copy SHA-256 `0e337f92aeb4a3dce5ba2dd52a4a74429b947a9acf39cf59b35138f5a099c37f`, one-based inclusive lines [[1, 57]].

`pbm-batch-1525228834`: [dbo.PM_ShipmentHeader02](sql/1525228834.sql); source-definition SHA-256 `4eaa018d766e5fa6c62fc833982f0318e29caf2439778291ab72f6c4d0985867`, reading-copy SHA-256 `148186ce0a0fcc7b7d2f34531a5afbe258d51ecd2ba11967f98f9f3d628a6bb2`, one-based inclusive lines [[1, 50]].

`pbm-batch-1541228891`: [dbo.PM_ShipmentHeader03](sql/1541228891.sql); source-definition SHA-256 `07e8ffb260b7a2f3428f28a1b7ed721c5842442cc35ff34518819bec3cf5b48e`, reading-copy SHA-256 `1f8c50d36ae30ec6fbe156db71d75c6c4d3a1e677241c43c02c5f5899df6170d`, one-based inclusive lines [[1, 59]].

`pbm-batch-1557228948`: [dbo.PM_ShipmentHeader04](sql/1557228948.sql); source-definition SHA-256 `9d8b2c10979b9e6bb896602c2f4a9d34fb002730bac912246a7ca7b6d467c112`, reading-copy SHA-256 `b62df89e9fd5e2e1dd9db416e00c8fd4fa952742bd6cb0965d7789336d34a2d6`, one-based inclusive lines [[1, 52]].

`pbm-batch-1605229119`: [dbo.PM_WorkInstruction02](sql/1605229119.sql); source-definition SHA-256 `bb6c6f49ca043e2a88f6871dfd8c07503735bddcb5a4de573a01802349b2322d`, reading-copy SHA-256 `1344470bfb147c09c3fe4e9647bf2445d3566ae5af0582fb2c94e2d337792ed9`, one-based inclusive lines [[1, 54]].

</details>

<a id="performance-pm-day-boundary"></a>

## Performance monitor daily boundaries

Daily performance monitors use UTC calendar boundaries. Receipt counts use container timestamps; shipped-line sums use the shipment view's actual ship time.

### How it works

1. Convert GETUTCDATE to midnight to establish the start.
2. Select with BETWEEN from that midnight through the following midnight, including both endpoints.

### Results

- One receipt-container count or shipped-line SUM with the supplied report membership filter.


### Troubleshooting

- An empty COUNT returns 0, while an empty SUM returns NULL.


### Limits

- The inclusive end boundary can count next midnight in adjacent reports.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-1477228663`: [dbo.PM_ReceiptContainer01](sql/1477228663.sql); source-definition SHA-256 `d544662235615fbf2c77dc035ad60d6e42aa728010aa46513514beebf2da65ed`, reading-copy SHA-256 `0e337f92aeb4a3dce5ba2dd52a4a74429b947a9acf39cf59b35138f5a099c37f`, one-based inclusive lines [[1, 57]].

`pbm-batch-1541228891`: [dbo.PM_ShipmentHeader03](sql/1541228891.sql); source-definition SHA-256 `07e8ffb260b7a2f3428f28a1b7ed721c5842442cc35ff34518819bec3cf5b48e`, reading-copy SHA-256 `1f8c50d36ae30ec6fbe156db71d75c6c4d3a1e677241c43c02c5f5899df6170d`, one-based inclusive lines [[1, 59]].

</details>

<a id="performance-alert-summary"></a>

## Open processed alert summary

The alert summary groups requests marked processed Y that have no closed timestamp and match one of two coded action categories. It joins alert and type records, groups by description and priority, and returns a count and latest activity time for each group.

### How it works

1. Require processed Y, no close timestamp, selected action and warehouse comparison.
2. Group description/priority and return count plus latest activity.

### Results

- Zero or more priority groups; no alert is closed or modified.


### Limits

- No username or warehouse-access check is in this body.
- Different types with the same description/priority can merge; duplicate joins can multiply counts.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-1573229005`: [dbo.PM_WarehouseAlert](sql/1573229005.sql); source-definition SHA-256 `cd6ec46a6e3466a2141d86390e4ad6103efb0e5adb1e4eb085cd313e1b2347b3`, reading-copy SHA-256 `4da7e1b704475a17b4bf9eff39e69a6f738b00970155c21c5d171f73e7b7328f`, one-based inclusive lines [[1, 44]].

</details>

<a id="performance-activity-six-results"></a>

## Activity summary result sets

Activity summary returns six result sets with different event and counting rules. Wave totals require launches fully inside the interval; received lines use a concatenated key; work groups use end times. Shipping and creation totals use their own timestamps.

### How it works

1. Waved, received, completed work groups, confirmed shipments, created shipments, created receipts.
2. Distinct IDs and summed view totals are different measures; inclusive date bounds apply where written.

### Results

- The work-group result can be empty while scalar aggregate result sets still return zero.


### Limits

- No single end-to-end process duration or universal warehouse filter is supplied.
- Concatenated receipt-line keys can collide; view duplicate rows can affect sums.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-1621229176`: [dbo.PMN_ActivitySummary](sql/1621229176.sql); source-definition SHA-256 `f4852429a4b20cc005f97a8e6ef679613e8599777eb82c3053fac26f35365470`, reading-copy SHA-256 `60f840c0869d988c7d7a03f60d9d0bfcaa5ad37b971d6e2c83cdea9a4d854817`, one-based inclusive lines [[1, 59]].

</details>

<a id="performance-activity-buckets"></a>

## Thirty-second activity series

Each activity sample summarizes the preceding 30 seconds. The first sample is placed at the requested start, so its bucket begins before that start. Subsequent sample times must be earlier than the requested end; no final partial bucket is added.

### How it works

1. Create the first sample at start, then advance by 30 seconds.
2. For each sample, include activity timestamps at or after sample minus 30 seconds and strictly before the sample.

### Results

- Ordered endpoint rows with counts/sums; empty buckets show zero.


### Limits

- NULL, reversed or equal bounds still produce the anchor row.
- The recursive sample generator has no duration or recursion-count cap.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-1701229461`: [dbo.PMN_LoadConfirmActivity](sql/1701229461.sql); source-definition SHA-256 `070d5cfb8bfd820d40591669e2a33a604e071e0b5289a92c817706f5864ebbdf`, reading-copy SHA-256 `df3217d599d30e0fae127f35868baea0e3528b5beab4ec06dcb780508185844a`, one-based inclusive lines [[1, 39]].

`pbm-batch-1717229518`: [dbo.PMN_ReceiptsCreatedActivity](sql/1717229518.sql); source-definition SHA-256 `b419a06f9745afd894e4ac25162df9dd35b3cae06869069b305e5f0895f25f71`, reading-copy SHA-256 `a53e3fb57a6cdb05ff527c4211ed83687b550ad99e03a75dd0ddb0c917e63eb7`, one-based inclusive lines [[1, 36]].

`pbm-batch-1733229575`: [dbo.PMN_ShipmentsCreatedActivity](sql/1733229575.sql); source-definition SHA-256 `c598c6f19358359009d9114d7fcada65d114933c645e44373543ab01a7254d51`, reading-copy SHA-256 `862e9d8d1fce3118466fe9d8e01ca8b69e559b904d20dffa5ef6c210b38f5d9f`, one-based inclusive lines [[1, 37]].

</details>

<a id="performance-wave-sampling"></a>

## Active wave samples

Wave sampling measures workload active at each sample time. A wave can contribute to several samples, so the series does not count newly started waves or measure elapsed duration.

### How it works

1. Generate samples from the start in 30-second increments before the end.
2. Use launch start<=sample and end>=sample, then sum shipment and line totals.

### Limits

- A launch with a NULL end time does not satisfy the overlap condition.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-1797229803`: [dbo.PMN_WaveActivity](sql/1797229803.sql); source-definition SHA-256 `a9e074e69c0c57aeeaf09dd1eef3707c8eccb33229dbe229748a5b03984615e3`, reading-copy SHA-256 `e7cd393778912f91e93dfbffc03a5e887023db164ef2180bc327bd7cb89abc6b`, one-based inclusive lines [[1, 36]].

</details>

<a id="performance-inventory-diagnostics"></a>

## Inventory diagnostic predicates

Inventory diagnostics return rows that meet each query's comparison rules. Those rules use different keys, warehouse sides and exclusions; some compare aggregates, some omit logistics-unit matching, and several use NOLOCK. A returned discrepancy requires context before it identifies a confirmed inventory defect.

### How it works

1. No-work tests omit logistics-unit matching; mismatch tests use their documented from/to warehouse fields.
2. Missing sides, company omissions and duplicate matches can change findings.

### Results

- Diagnostic rows/counts, with no repair or status mutation.


### Limits

- NOLOCK can return inconsistent reads.
- The unit-of-measure comparison joins item without company.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-1463676262`: [dbo.RPT_CSO_LocationsWithInTransitQtyButNoWorkExistsDetails](sql/1463676262.sql); source-definition SHA-256 `386011c55e03ad577efc80d88d3171effbf07bde806d0f8a7c1170ca07fd8baa`, reading-copy SHA-256 `8e07b56cf96931208daa18a09cc23e3df74c7b1dfcabcf639227520142b51aa9`, one-based inclusive lines [[1, 17]].

`pbm-batch-1527676490`: [dbo.RPT_CSO_LocationsWithAllocatedQtyButNoWorkExistsDetails](sql/1527676490.sql); source-definition SHA-256 `4fcbe4d36b101dc8670c9a5ef0bc6cd981ee24ffd89cdd18c0758e061821dd53`, reading-copy SHA-256 `5e4763c546a66f15e38ceb084561e0d47b3c3bd0bb13e403a044bb82f95472bc`, one-based inclusive lines [[1, 18]].

`pbm-batch-1559676604`: [dbo.RPT_CSO_LocationsWhereInTransitQtyNotEqualWorkQtyDetails](sql/1559676604.sql); source-definition SHA-256 `cff0fc9af13d96cc5f941dfc87a2fce6bc48708669bff72526b9492b2e9fe987`, reading-copy SHA-256 `f327ce68d919a2d89c79531ba0fc0f2a296641526a161eada07ae46f808ed1bc`, one-based inclusive lines [[1, 26]].

`pbm-batch-1591676718`: [dbo.RPT_CSO_LocationsWhereAllocatedQtyNotEqualWorkQtyDetails](sql/1591676718.sql); source-definition SHA-256 `a5b78f6d6588173c7adc7953cf8b82719eaf2c852c342d5894b7b060e5652d1d`, reading-copy SHA-256 `e5d7c53669c6d0843675caac6c763a360fc8d46ee64b4836cdf0e59f5c8df459`, one-based inclusive lines [[1, 21]].

`pbm-batch-1367675920`: [dbo.RPT_CSO_LocationsWithNonbaseUMDetails](sql/1367675920.sql); source-definition SHA-256 `218ca49a4badd54ca5268b8cda6561efdc3cc3ede6cbe3ed368058c516fcaa30`, reading-copy SHA-256 `94fa66f6a39147e5aaccf52015a7e866100bfb6de0e1065624b90cabf050feb3`, one-based inclusive lines [[1, 8]].

</details>

<a id="performance-inventory-status"></a>

## Inventory status exception scope

NULL status qualifies only under the written permanent/location-class/quantity conditions. The separate missing-identifier check uses NOT IN the configured status identifiers. An empty value is selected only if it is absent from that configuration set.

### How it works

1. Apply permanent flag, location-class membership and positive on-hand/in-transit tests.
2. Independently test the status identifier against the configured set.

### Troubleshooting

- An empty string and NULL follow different predicates.


### Limits

- A NULL in the configured NOT IN set can suppress findings for unmatched status values.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-1655676946`: [dbo.RPT_CSO_InventoryRecordsWithEmptyOrNullInventoryStatusDetails](sql/1655676946.sql); source-definition SHA-256 `2e018357062554f4200ade6df9418c0989eb0abc0eb8a850ecb05ddef7d9da6d`, reading-copy SHA-256 `152f3fd38ae1dd828ee18958d04c21bc1880f728a73610ad22f676f76f092268`, one-based inclusive lines [[1, 13]].

`pbm-batch-1671677003`: [dbo.RPT_CSO_InventoryRecordsWithEmptyOrNullInventoryStatusCount](sql/1671677003.sql); source-definition SHA-256 `3a74655dba3b2ddd7222692d575633455eac724eb38fca338e61587607e444b2`, reading-copy SHA-256 `a7f7b7d24f132b88cf21ed5492f8a298f34b4ff046fd4ec8541e0da9b6c43316`, one-based inclusive lines [[1, 12]].

</details>

<a id="performance-audit-denominators"></a>

## Audit and deadlock diagnostic counts

The seven-day audit total counts headers. The detail report instead joins value rows, excludes one coded method and groups by class, method and text. Deadlock reports count either joined rows or distinct value texts. These are different counting units and need not produce equal totals.

### How it works

1. Choose the report by the required counting unit: headers, joined value rows, distinct texts or detail groups.
2. The rolling 7- and 14-day windows use GETDATE and header logged time; detail ordering can use value timestamps.

### Limits

- Distinct text is not proven unique deadlock incident identity.
- Detail groups need not equal header or joined-row counts.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-1159675179`: [dbo.RPT_CSO_UniqueDeadlockRecordsLast14Days](sql/1159675179.sql); source-definition SHA-256 `64b3febc3e533554399b8b8c1d926f7b11c4c7933025a0f2ab92528b932da0f8`, reading-copy SHA-256 `4a620dfe9bb45a844d6ff276f25e308e6cf77ec5999c2faccf87e2bac0990723`, one-based inclusive lines [[1, 10]].

`pbm-batch-1175675236`: [dbo.RPT_CSO_TotalDeadlockRecordsLast14Days](sql/1175675236.sql); source-definition SHA-256 `e4aae3ddb431c61e504429733c09bada74c226bdfad10842aab93ff2e1d08149`, reading-copy SHA-256 `1356e0ebfedfc12e8b13c3597617a908ad285b5c74cba3046162d7747cbdb342`, one-based inclusive lines [[1, 10]].

`pbm-batch-1703677117`: [dbo.RPT_CSO_DeadlockRecordDetailsLast14Days](sql/1703677117.sql); source-definition SHA-256 `79d8106385d1c9c0154223324dcc9c1b505c8b72eb12148168149f99615463bf`, reading-copy SHA-256 `d0618651c40ae1a94353b769cd6d9373c39e4ee5820c525dc6cdde7758c3e357`, one-based inclusive lines [[1, 9]].

`pbm-batch-1719677174`: [dbo.RPT_CSO_AuditLogsLast7DaysDetails](sql/1719677174.sql); source-definition SHA-256 `06bef7f449c29a15e1b3d6d7921c45d72dcade716c92b05432766e767dc2e7d2`, reading-copy SHA-256 `21268df399bb3361e71b54834c4e4fb6967af76c0e9157063d8cbd819404ea48`, one-based inclusive lines [[1, 11]].

`pbm-batch-1735677231`: [dbo.RPT_CSO_AuditLogsLast7DaysCount](sql/1735677231.sql); source-definition SHA-256 `e20b74be30c9321bfc34b757ab988d4d487aac4246373abffa165c82235f6888`, reading-copy SHA-256 `752311b1da184612bdd5a7b6d0e6493276210da4074710292c6575bffd08ec5a`, one-based inclusive lines [[1, 8]].

</details>

<a id="performance-concurrency-peak"></a>

## Sampled concurrent-user peak

Concurrent-user peak is an hourly sample of distinct users in retained logon history. Short sessions between samples may be missed.

### How it works

1. Use earliest retained logon through current server time.
2. Inclusive logon-to-selected-end intervals, DISTINCT username and strict greater-than peak replacement.

### Results

- One display string with peak count and sampled timestamp.


### Limits

- NULL session ends can exclude sessions. With no history, the routine returns its initialized count of 0 and current time.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-1687677060`: [dbo.RPT_CSO_HighestNbrConcurrentUsrsEver](sql/1687677060.sql); source-definition SHA-256 `ab938ec1c83b0d89d882e7ee2b435743c2e568904a1c3a7e0378df4aa503c544`, reading-copy SHA-256 `0bf2a2fb03dd06a3d7489cf866c8d76d058af3d486e4f3a2e63b388e9b6142d2`, one-based inclusive lines [[1, 40]].

</details>

<a id="performance-rate-weight-config"></a>

## Weight-break configuration inserts

Weight-break helpers insert missing configuration. The header helper preserves an existing name; the detail helper requires that header and skips an identical minimum/maximum range. Neither updates existing rows or calculates a freight charge.

### How it works

1. A new name inserts supplied header values; an existing name is unchanged.
2. Require the named header and suppress only an exact header/minimum/maximum duplicate.

### Results

- Zero or one intended configuration insert; no generated-key or price result.


### Troubleshooting

- Explicit NULL inputs differ from omitted inputs whose declared default is zero; required-column constraints still apply.


### Limits

- No overlap, minimum<=maximum, active eligibility or invoice calculation validation.
- No captured unique name/range key or local concurrency guard; duplicate header names can make the detail scalar lookup fail.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-168699999`: [dbo.dbc_IRateWeightBreakHdr](sql/168699999.sql); source-definition SHA-256 `4766988fe55d970bff20e7d8729be924812f61048b1eda2ec10596d8d0cbef96`, reading-copy SHA-256 `75353b3a2aaa8f9904facc069abb3aae515182ac8f6d190ee47bb54351f8d44e`, one-based inclusive lines [[1, 63]].

`pbm-batch-152699942`: [dbo.dbc_IRateWeightBreakDtl](sql/152699942.sql); source-definition SHA-256 `71a634c562d704441b5fe63408325d456228c171e0f748e8aee6dac38077a8b9`, reading-copy SHA-256 `c902ad302af70b0de107f639a92e93f34bb17a24525de2e5bc7d6735f0f49b76`, one-based inclusive lines [[1, 66]].

</details>

<a id="performance-maintenance-ddl"></a>

## Maintenance helper side effects

Maintenance helpers can rename objects, drop columns or constraints, and drop or recreate indexes. Their executable DDL uses caller-supplied identifiers and syntax.

### How it works

1. Name checks vary: some are global constraint-name tests, others inspect a column or index.
2. DropColumn recursion is inside the base-column guard and its second tested prefix differs from the prefix passed recursively. DropIndex recursion is outside its base-index guard. Index replacement can fail after dropping the old index.

### Troubleshooting

- Caller-supplied identifiers and syntax are concatenated without QUOTENAME or bound values. Drop/create operations have no local transaction.


### Limits

- Actual targets, permissions, DDL triggers and caller transactions determine the effects.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-1584724698`: [dbo.dba_DropForeignKeyConstraint](sql/1584724698.sql); source-definition SHA-256 `1930a6ae3f683734f3021eecbac3b4a2a41b49180b0f935a354e74307a4415c6`, reading-copy SHA-256 `f400f056f14c51990f6066a5d02b2934851356d90d556af24c8524b7a1a77314`, one-based inclusive lines [[1, 28]].

`pbm-batch-1600724755`: [dbo.dba_DropDefaultKeyConstraint](sql/1600724755.sql); source-definition SHA-256 `b5a8d7178c2a2ca344830a97a296e919bd0f7c33fa7473938de0f36ca3b4db71`, reading-copy SHA-256 `325625cc4fcf0a4bff4a8e39384624a609843f6dc57a3e0a277b79c39ff4c824`, one-based inclusive lines [[1, 28]].

`pbm-batch-1616724812`: [dbo.dba_DropColumn](sql/1616724812.sql); source-definition SHA-256 `ae5163703c756a410f37e3ddb7a09672d4c2fecb8e9a76a133d61b997a617c77`, reading-copy SHA-256 `4dcba91818434675c2f243c1ae1079d4d36dc960c1586f1ab0bc6da1b908113a`, one-based inclusive lines [[1, 60]].

`pbm-batch-1632724869`: [dbo.dba_AddForeignKeyConstraint](sql/1632724869.sql); source-definition SHA-256 `160faed899264cab635b19544bf60bf834ac700a2b6e7ce6d50103f664c69fb1`, reading-copy SHA-256 `d7e408d2ffb9a30a03048aa5cbcba9e3d2193e69ee76d8ba3336da8a0432bb41`, one-based inclusive lines [[1, 31]].

`pbm-batch-1660181310`: [dbo.dba_RenameTable](sql/1660181310.sql); source-definition SHA-256 `e74a4b4337c9960248c9e4649b56e5b22725712b204e3525fe631ca0eb6e8a42`, reading-copy SHA-256 `b7c23daf3c1d4758389fa66a593f412530d2961baa90cc5f98808db5550ad96f`, one-based inclusive lines [[1, 23]].

`pbm-batch-1866802058`: [dbo.dba_DropIndex](sql/1866802058.sql); source-definition SHA-256 `48bfe4d4c57b57339823c12d1a7e8ba18f309f09d4c6c081c4842b1241fdbec5`, reading-copy SHA-256 `7ace8acbc5d1d29a731719567cb8fcb8bfa29b057585d771c099606cffaa5917`, one-based inclusive lines [[1, 20]].

`pbm-batch-1882802115`: [dbo.dba_UpdateIndex](sql/1882802115.sql); source-definition SHA-256 `11d7917f4b43883359045cf89a1c6e921bdcded6067699b42c4cabd43bc67eb6`, reading-copy SHA-256 `8020d94c32c8d6e8f0e65a90a559fbde5a6a97676ed4e0446127f191983533b1`, one-based inclusive lines [[1, 37]].

</details>

<a id="performance-index-statistics"></a>

## Index diagnostic context

One routine reads physical statistics for a supplied database ID; the other joins usage counters to current-database metadata. Name resolution and database filtering have important limits. Neither routine rebuilds an index or establishes a maintenance decision.

### How it works

1. Physical-stat names resolve in current context; an unresolved DB_ID can become a wildcard.
2. Usage joins omit a database-ID predicate; indexes absent from the DMV are omitted. Top-five table counts use legacy catalog metadata.

### Troubleshooting

- An index absent from usage results is not necessarily unused.


### Limits

- Usage counters are not procedure-call totals, and catalog row counts are not a COUNT(*) of table data.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-1669229347`: [dbo.PMN_IndexFragmentation](sql/1669229347.sql); source-definition SHA-256 `d070200a576d9f841401a025faa5e619992d400fe4eae585ec404ef12e433181`, reading-copy SHA-256 `d903ea872a09361cee3d003bc56d8be0200a25cdb36b9f69e75c25746e5c16ac`, one-based inclusive lines [[1, 23]].

`pbm-batch-1685229404`: [dbo.PMN_IndexUsage](sql/1685229404.sql); source-definition SHA-256 `9d8ce763d76597bc6d5685dec972422854f0797fa0db6d89c3a72d61536b89c0`, reading-copy SHA-256 `dda9927c62eb17e381c1f41b17d00887e5c7930af372b119ecde9d99c5fec176`, one-based inclusive lines [[1, 22]].

`pbm-batch-1191675293`: [dbo.RPT_CSO_TopFiveTablesByRecordCount](sql/1191675293.sql); source-definition SHA-256 `9da6ea127d8788d112c324fc1709db7b9ddceacc5baa2fd4ff5e8427893eac6f`, reading-copy SHA-256 `5d067d000c52691b494f4f19c291a53197337c88ecc83bb8227eb4d97147f9f8`, one-based inclusive lines [[1, 12]].

</details>

<a id="performance-space-used"></a>

## Database and table size result sets

The size helper obtains database output from sp_spaceused, then gathers table-specific output through sp_msForEachTable. It returns the collected table rows by name.

### How it works

1. The first helper emits its own result sets.
2. INSERT EXEC populates fixed-width text size fields and returns ordered rows.

### Troubleshooting

- Size columns are returned as text, without numeric conversion.


### Limits

- System-helper support, permissions and enumeration completeness depend on the deployment.
- INSERT EXEC result shape or nesting restrictions can fail; the body has no failure handler.


<details>
<summary>Technical reference and sources</summary>

`pbm-batch-1749229632`: [dbo.PMN_TableSizes](sql/1749229632.sql); source-definition SHA-256 `fe7f2c8786f650bed9f59e9f92e4123168993c0c0228d764b5be90cdf4b66582`, reading-copy SHA-256 `26a79b56c4bdab93dbb64540d521c31645dd79998a98b258ca49f8bd6e240e8b`, one-based inclusive lines [[1, 27]].

</details>

<a id="presentation-seed-actions"></a>

## Presentation defaults and business actions

These reviewed routines return presentation defaults and sometimes a localized label. They do not schedule an appointment, save a signature, submit work, replenish inventory or pack a unit.

### How it works

1. Identify the presentation seed returned by the body.
2. Use separately evidenced action routines and application bindings to establish what an operator action executes.

### Results

- Only presentation data is selected. This body does not execute the business action named in the procedure.


<details>
<summary>Technical reference and sources</summary>

`ps-sql-405224844`: [dbo.MetaTrans_ApptSchedule](sql/405224844.sql); source-definition SHA-256 `e5f3242fb337bec38007586b0427e735272981edeabdc2fa7fd082ca1b125f2d`, reading-copy SHA-256 `f47ea8e881cad32ce9c7a84d574c93486a4903ff028faa66f6cbc40718a7fec9`, one-based inclusive lines [[1, 18]].

`ps-sql-1221227751`: [dbo.MetaTrans_SignBOL](sql/1221227751.sql); source-definition SHA-256 `b2bd7cd1588d8d3847836e84f844da77873238c32b747e0e420052f99e8f039d`, reading-copy SHA-256 `e64d0333057afccec991467d857e3cee263c9c5108503b8a7bd8edbe427b2eb5`, one-based inclusive lines [[1, 22]].

`ps-sql-1269227922`: [dbo.MetaTrans_TpmPersonalViews](sql/1269227922.sql); source-definition SHA-256 `ddcdf40c0a146207cc857985c6a27abb3c1117ec415f926201f688a885a0b38c`, reading-copy SHA-256 `968dc080c554ae2bd816ce20ec43bce51ab8c92b60de381825952e84591ba356`, one-based inclusive lines [[1, 13]].

`ps-sql-1285227979`: [dbo.MetaTrans_TpmSubmit](sql/1285227979.sql); source-definition SHA-256 `0eab9e8a4a0b41bf32046303563c46287138b8edaa59e7f4a9a5203b368da5f8`, reading-copy SHA-256 `95c1cd37613b32149b076f3a4337f007eca7fbf764abda510f9830f20c79816f`, one-based inclusive lines [[1, 17]].

`ps-sql-1093227295`: [dbo.MetaTrans_ManualReplenishment](sql/1093227295.sql); source-definition SHA-256 `5a0fdb19ed3a07938c25c17de6b542db41f539c1f4a3fbbda604061f3fe297f7`, reading-copy SHA-256 `5bb245395a2a7584994a3ee169bb7cac0b6120844d3dc566c1770d70fbf21c75`, one-based inclusive lines [[1, 15]].

`ps-sql-1237227808`: [dbo.MetaTrans_SinglesPacking](sql/1237227808.sql); source-definition SHA-256 `5c7ba6c5bda4ad8b969ca4f29b37a897b2bc851a4de1aee6700fb25ec5334be2`, reading-copy SHA-256 `95d0dc7bf38d7c17389f0644fdda8d2aef891ebc93fcb238bf507205f0a6ed7e`, one-based inclusive lines [[1, 26]].

</details>

<a id="cycle-count-presentation-defaults"></a>

## Cycle-count presentation configuration

Quick-plan setup assigns variables from matching configuration rows; duplicate matches have no defined selection order. Master-plan setup uses scalar subqueries, which fail on duplicate matches. Missing coded flags become false BIT values, while neither routine creates a plan.

### How it works

1. Distinguish assignment lookups from scalar subqueries.
2. Check the exact configuration selector and conversion without assuming a warehouse-specific value.

<details>
<summary>Technical reference and sources</summary>

`ps-sql-453225015`: [dbo.MetaTrans_CycleCountQuickPlan](sql/453225015.sql); source-definition SHA-256 `3adea788440dda21f38351393bb4879838af652ebb709337372641d53764749b`, reading-copy SHA-256 `b9918f115ea89a54cf2e63d052f7f519282d5450df86757b3545640a0e789417`, one-based inclusive lines [[1, 74]].

`ps-sql-565225414`: [dbo.MetaTrans_GetCycleCountMasterPlan](sql/565225414.sql); source-definition SHA-256 `64dadd8b8607e94a7e3a6d29b476ccf821ff4081d54f83b416c6161d2351e0ee`, reading-copy SHA-256 `63a0b69eca099c7cab0e8f127ac4ce3b7121e19361ce7a7e4bce98344a218251`, one-based inclusive lines [[1, 21]].

</details>

<a id="receipt-presentation-company-filters"></a>

## Receipt context and company selection

Receipt source selectors apply different company rules. Ordinary purchase-order lines use profile authority, company membership and a NULL-company alternative; TPM purchase-order lines omit those checks. Shipment details use company membership independently of restricted-profile mode and allow NULL or coded-sentinel companies. Header selectors have no user-authorization predicate. These routines return receipt context without creating a receipt.

### How it works

1. Identify which header or line selector is used.
2. Compare exact predicates; a supplied username alone does not establish authentication.

### Results

- Only presentation data is selected. This body does not execute the business action named in the procedure.


<details>
<summary>Technical reference and sources</summary>

`ps-sql-693225870`: [dbo.MetaTrans_GetItemsForReceiptFromPO](sql/693225870.sql); source-definition SHA-256 `7a8b6c892c3671ddf709aac30a7d4df3a7322dc8ffd9365f475029796f574c7a`, reading-copy SHA-256 `64f3074b40be9465ea1a18623d0e04870369cda9010be6442b2f478a68bad468`, one-based inclusive lines [[1, 42]].

`ps-sql-709225927`: [dbo.MetaTrans_GetItemsForTpmReceiptFromPO](sql/709225927.sql); source-definition SHA-256 `d60705a80f9000e6fda5545f3a8284f9f58bf8262e23c9ae8a35535c6d191b19`, reading-copy SHA-256 `6864b7e5532ab71305861994ec8e23130c63c15b0d860e114c6d10f03a2cafaa`, one-based inclusive lines [[1, 31]].

`ps-sql-933226725`: [dbo.MetaTrans_GetReceiptFromPO](sql/933226725.sql); source-definition SHA-256 `8b3cac7cd767528b9d033e9138ef15a10bcad47ca5378251b5550a1d074bd532`, reading-copy SHA-256 `fa87aecaae4ef175c302a33f900dc11d15dcd982f4be9935bb8d058510bd30e8`, one-based inclusive lines [[1, 36]].

`ps-sql-981226896`: [dbo.MetaTrans_GetTpmReceiptFromPO](sql/981226896.sql); source-definition SHA-256 `4ef75b51780dc870c4447b747dfd2c45f4d5645786e598f9e58e7c107ee2084c`, reading-copy SHA-256 `3edd484685e34be712e850d00e376f695b7580db6848475313429ef49ed250d9`, one-based inclusive lines [[1, 50]].

`ps-sql-949226782`: [dbo.MetaTrans_GetShipmentDetailsForCreateReceipt](sql/949226782.sql); source-definition SHA-256 `d70a34d7e0e12e6b39d7f121a6444deed417c55f0ef12dc7847435f9065d8665`, reading-copy SHA-256 `7a91794f9ae2a658cb76b5f3f9e4d88772572014de5b6447bbf315c077f1e759`, one-based inclusive lines [[1, 29]].

`ps-sql-965226839`: [dbo.MetaTrans_GetShipmentForCreateReceipt](sql/965226839.sql); source-definition SHA-256 `a4a14c9730dbadcfe47a0eb56665e1f312bce2a302b88342605930075523e95e`, reading-copy SHA-256 `d24436e1be732a34a25c9899c20c246735790da208d21058a708445113b1a5e0`, one-based inclusive lines [[1, 41]].

</details>

<a id="lot-change-presentation"></a>

## Lot-change previews and confirmation

The preview lists matching inventory and the confirmation returns existing lot context with supplied before/after values. Neither changes inventory nor validates the proposed change. Company and lot NULL matching differs between the inventory preview and the outer lot confirmation.

### How it works

1. Use location NULL or the coded sentinel to select the broad preview branch.
2. Check matching lot context before interpreting the confirmation values.

<details>
<summary>Technical reference and sources</summary>

`ps-sql-789226212`: [dbo.MetaTrans_GetLotUpdateAffectedInventory](sql/789226212.sql); source-definition SHA-256 `999cfa4e698d29c6ae9ce9b64de786e86d308e047526a6dd47b1d4220c9cf758`, reading-copy SHA-256 `c50ea83c8db9a9f892d11f0f3c2ff774040578edf5372c8a909a6645f2d3c8c4`, one-based inclusive lines [[1, 51]].

`ps-sql-837226383`: [dbo.MetaTrans_GetLotUpdateConfirmation](sql/837226383.sql); source-definition SHA-256 `e71293a45a1c55c8b15925a02811e86560b965ccb01283ba9296a7e96a667e87`, reading-copy SHA-256 `6cab67c7a1b2cf7006c02f2f2468e51a687010663d964fd9e84cf0c1066e0dcc`, one-based inclusive lines [[1, 47]].

</details>

<a id="transfer-presentation-context"></a>

## Transfer presentation results and helper calls

These bodies select context. Two call a shipment-security-info helper before selecting; the inventory getter passes its location-inventory identifier to that helper. The call alone does not prove valid identifier mapping or enforced authorization, and no direct transfer mutation occurs.

### How it works

1. Read helper arguments and account for callee result sets separately.
2. Distinguish empty joins, missing scalar status labels and the returned presentation row sets.

### Results

- Only presentation data is selected. This body does not execute the business action named in the procedure.


<details>
<summary>Technical reference and sources</summary>

`ps-sql-757226098`: [dbo.MetaTrans_GetLocationInventory](sql/757226098.sql); source-definition SHA-256 `99f8c2c6b630a5dbbb7625d9ea2f7ef39693346a051402a6dfc1953f1fd99d16`, reading-copy SHA-256 `5964e05ca822965aadec38fd8a8a8e3c1e09c46d1a91ca978ca6f66e66f722ea`, one-based inclusive lines [[1, 27]].

`ps-sql-1013227010`: [dbo.MetaTrans_GetTransferContainer](sql/1013227010.sql); source-definition SHA-256 `1bbc7836ca49da3272bf0e16451466e696e104e3a1b136739b225cdebd61e229`, reading-copy SHA-256 `c60c42f21524b76895db0c6d46eb6b0cf3126b30f06657114061b63f20328854`, one-based inclusive lines [[1, 57]].

`ps-sql-1029227067`: [dbo.MetaTrans_GetTransferShipment](sql/1029227067.sql); source-definition SHA-256 `6fa625795ba4a91cfac6d7db4887d983673059991cb754a8c8cb9fc54d1b3a9f`, reading-copy SHA-256 `553beea9a10b7fa47a5d7eb41b7bfd4a7ed471c31460285df391162d91464bf6`, one-based inclusive lines [[1, 45]].

`ps-sql-1045227124`: [dbo.MetaTrans_GetTransferShipmentDetail](sql/1045227124.sql); source-definition SHA-256 `1a572d5ba6e59600a95e6dfc03e46b513f786ccdfd73a751650bf40590ff0f05`, reading-copy SHA-256 `50ef54708e3a1344fd6f21736567ddc9c9aa954efe21c8c5cb665ab8adc2d2ee`, one-based inclusive lines [[1, 39]].

</details>

<a id="packing-presentation-configuration"></a>

## Packing preference and checkpoint display

The fallback applies to a NULL preference inside an existing profile row. A missing row makes the scalar result NULL, which leaves packing options unassigned if no preference matches. Checkpoint values are displayed separately; this routine does not pack, close or print.

### How it works

1. Resolve the profile row and packing-preference selection.
2. Inspect checkpoint display values and the two generic lists separately from action enforcement.

<details>
<summary>Technical reference and sources</summary>

`ps-sql-1109227352`: [dbo.MetaTrans_Packing](sql/1109227352.sql); source-definition SHA-256 `cb930f470847596a019b9f9e75851814cb3842a85a524cf5b402ea87685819dc`, reading-copy SHA-256 `736df22832cd0bf57f0cf670fd86afd57f26e414ec5185530d9e111325a617e7`, one-based inclusive lines [[1, 77]].

</details>

<a id="presentation-selection-boundaries"></a>

## Item, lookup and monitoring selection boundaries

The item selector uses unordered TOP 1 across exact-company and NULL-company matches. Monitoring suggests MAX(form ID)+1 without reserving it. Lookup warehouse values are returned without filtering. Missing receipt context still returns a trailer seed row, and work-order allocation context does not allocate inventory.

### How it works

1. Check each selector and returned row count.
2. Establish reservation, authorization and later mutations through separately reviewed callers.

### Results

- Only presentation data is selected. This body does not execute the business action named in the procedure.


<details>
<summary>Technical reference and sources</summary>

`ps-sql-677225813`: [dbo.MetaTrans_GetItem](sql/677225813.sql); source-definition SHA-256 `bca8946dfa8b2a89d06dc5ff61fdf400f176af4ff45f42c5132e4378e6d1ce0a`, reading-copy SHA-256 `d03f23192e0fad4c348b4958e3be83e0ffbdfd60612f4be0b340736c8c991ff3`, one-based inclusive lines [[1, 26]].

`ps-sql-773226155`: [dbo.MetaTrans_GetLookup](sql/773226155.sql); source-definition SHA-256 `23aa6cbaa0df77db9b1e4f54787d4860427ebc7b695ce090f2b5f91294ad44d9`, reading-copy SHA-256 `6e814eb187167bb0834a3d5c5ca93128ff6612f0c61facce014a305a4859add0`, one-based inclusive lines [[1, 60]].

`ps-sql-869226497`: [dbo.MetaTrans_GetMonitoringBuilderModel](sql/869226497.sql); source-definition SHA-256 `266052c75173363c1496cd1969f7d4b9f2a57024c949642ef6ead7f7a0389f2d`, reading-copy SHA-256 `906f47f5af041484e2931989e79b784d35c64c787154494c17be7edf3389a2bb`, one-based inclusive lines [[1, 51]].

`ps-sql-725225984`: [dbo.MetaTrans_GetLocatingZones](sql/725225984.sql); source-definition SHA-256 `72b519b144661f2a1eebe3731e043807ceadffd7d94104d5faf5e040feaab679`, reading-copy SHA-256 `a6d369eceb8f0b562d5c173b4fdd4330d2f17bc0eda63d3f7924f34fec50f278`, one-based inclusive lines [[1, 22]].

`ps-sql-741226041`: [dbo.MetaTrans_GetLocationTypes](sql/741226041.sql); source-definition SHA-256 `8e0485b9c527364b858ba3bccb42574db766df3156b69b062b8a9724745b059e`, reading-copy SHA-256 `a5e9106f37a4111b00b1bc22647ae6a574ba12cd1858991de94b754d98e29c9b`, one-based inclusive lines [[1, 23]].

`ps-sql-997226953`: [dbo.MetaTrans_GetTrailerDetails](sql/997226953.sql); source-definition SHA-256 `9019a1a35fc69108ff352158d06ec249022f96eaff598d778c48fde3ac6d89b3`, reading-copy SHA-256 `6b23f5c10af2636a2fe5fcc8d113f600c479255a99b489022484fdfcecd18740`, one-based inclusive lines [[1, 43]].

`ps-sql-1333228150`: [dbo.MetaTrans_WorkOrderComponentAllocation](sql/1333228150.sql); source-definition SHA-256 `b9163b14edead282daa4749ad55cccb4a2eafd02b1e18308d980bae9e7c410f0`, reading-copy SHA-256 `c2ea083020fa5398df532d83c72229dbe2ec422362ac5717d20daf4ffcd6571e`, one-based inclusive lines [[1, 35]].

</details>

<a id="screen-metadata-description"></a>

## Screen attribute and object-column description

The routine resolves an object type, then uses either a first-result-set metadata function or INFORMATION_SCHEMA.COLUMNS. The fallback filters TABLE_NAME without TABLE_SCHEMA and has a different result shape. It describes metadata; it does not execute the described business routine.

### How it works

1. Resolve the configured screen attribute and object identifier.
2. Use the branch-specific output shape and account for metadata visibility and schema naming.

<details>
<summary>Technical reference and sources</summary>

`ps-sql-485225129`: [dbo.MetaTrans_DbTableInfo](sql/485225129.sql); source-definition SHA-256 `478f0c5cee280d36898452f30dbc274dca644b1b0a41ada8a2685e7652aba18f`, reading-copy SHA-256 `97218f5392e526f300a80e1c6e373ec7d5b10f7993a1b8ac4fc23c48eb665ab7`, one-based inclusive lines [[1, 55]].

</details>

<a id="admin-seeding-overwrite"></a>

## Why configuration seed calls may preserve old settings

Many administration seed routines insert only when their key is absent. Repeating a call with a changed description or flag can therefore leave the existing row untouched. The action-menu routine also skips when another menu already has the same description.

### How it works

1. Identify the exact routine and its duplicate key; do not assume all seed routines behave alike.
2. Check whether a matching row makes the insert a no-op; the reviewed bodies do not return a uniform success row.

### Settings and prerequisites

- Caller active flag is stored; SYSTEM_CREATED and USER_STAMP are coded literals, not a current-user lookup.
- Existing record-type settings are preserved, including CAN_BE_SCHEDULED.
- Header flags are stored, not evaluated; existing keys are left unchanged.
- SYSTEM_CREATED has an opaque string default; supported endpoint types describe stored metadata, not observed service capability.
- Existing description is preserved.
- Existing exit-point settings are not updated. Runtime hook selection and category semantics need caller evidence.
- No resource, screen or user permission is created by this body itself. Existing form IDs are not updated even if other supplied fields change.
- This header write does not insert or change system configuration detail values.
- No template assignment or rendered screen is established by the seed.


<details>
<summary>Technical reference and sources</summary>

`adm-sql-1708181481`: [dbo.dbc_IActionMenu](sql/1708181481.sql); source-definition SHA-256 `17bb848b46a7acbeeaec6bf4190096769515c5b59ae306a1644e5fb3588fbd49`, reading-copy SHA-256 `b591547ee9a4aa395514d1d0212847e840eb0605dbc526dbfc3db53a785d673d`, one-based inclusive lines [[1, 61]].

`adm-sql-1820181880`: [dbo.dbc_IBatchSubmissionConfig](sql/1820181880.sql); source-definition SHA-256 `988e40900b2d1b9a54180504871ddda8c2bd221ef2fc0eefb3bf525b983b728e`, reading-copy SHA-256 `2e2722e54abdfd7d6186741d484f023176349218267d8ed1fc512f47bfb4182b`, one-based inclusive lines [[1, 63]].

`adm-sql-1836181937`: [dbo.dbc_IDataRetrievalStmtHeader](sql/1836181937.sql); source-definition SHA-256 `e12c7c4810373969a8100571a99738952e57ce48fc86ec2b3caf0c991c9e5b70`, reading-copy SHA-256 `b32fb3d435df077cda7fc434fb4f3d138f83d666bf6a23b511a9da39855ce9f1`, one-based inclusive lines [[1, 66]].

`adm-sql-1932182279`: [dbo.dbc_IDynamicCallingHeader](sql/1932182279.sql); source-definition SHA-256 `7c67574c1369ab61f419daeb06a6971a4a217929205a50909fbd63cffc6bffe1`, reading-copy SHA-256 `8e687c505e16b00aea6c4cf174a0623ebb1ea84f59393efb7f643a6c9093daea`, one-based inclusive lines [[1, 38]].

`adm-sql-1946802343`: [dbo.dbc_IExitPointCategory](sql/1946802343.sql); source-definition SHA-256 `9a85920dda275416b376202eaf98fc5f8eaa7d633f3aef735d46e4124fb08be2`, reading-copy SHA-256 `ecd5dcd6ff750841a886f6adae91aee493471d5476a058005181ad4727819de2`, one-based inclusive lines [[1, 33]].

`adm-sql-1948182336`: [dbo.dbc_IExitPoint](sql/1948182336.sql); source-definition SHA-256 `5ac7064222adac54cca79e222f43c98d4bfb6ee26e6ab5cdd40a9db3700dca72`, reading-copy SHA-256 `83ba3bbbf81221fbe42846926807aed364a83df642886461bcce50d850523d3b`, one-based inclusive lines [[1, 64]].

`adm-sql-2012182564`: [dbo.dbc_IForm](sql/2012182564.sql); source-definition SHA-256 `f15c3a61fedbc11b4a7b9a87f4bc96235b6d923ec0a3fa7ba2c9341fb98c233f`, reading-copy SHA-256 `d6f1e1a551d4f123e3a19d4ba9bbf8b5a8b6238bab7841004fbc96990eac9b56`, one-based inclusive lines [[1, 65]].

`adm-sql-2074802799`: [dbo.dbc_ISystemConfigHeader](sql/2074802799.sql); source-definition SHA-256 `0815e1f959b4f211857d328a276e27e3fbbeb8935152de14bb5bc254be89c051`, reading-copy SHA-256 `7cbb8e2811a5f72afc6d25605975e9c0d4252f0213d25f36634416d206e1af4a`, one-based inclusive lines [[1, 34]].

`adm-sql-2140183020`: [dbo.dbc_IMainUiTemplate](sql/2140183020.sql); source-definition SHA-256 `14924a3b9238c457b8a60a9ee2baf8f30335170b3c11a993b258cb9e12f48ab0`, reading-copy SHA-256 `d62db712ef9355749a50c6c950df8b49cf6a33605c9a72bfcde75893a248285f`, one-based inclusive lines [[1, 63]].

</details>

<a id="admin-generic-replacement"></a>

## Generic configuration updates replace omitted values

The generic configuration header and detail routines update existing records as well as insert missing ones. Their update branch assigns every listed field. Omitting an optional value supplies its default, often NULL, which can clear the old value. They do not validate detail values against the header definition.

### How it works

1. Determine whether the record-type or record-type/identifier key already exists.
2. Review all supplied values and defaults because the update is not a partial patch.

### Settings and prerequisites

- Changing header metadata does not migrate or validate stored GENERIC_CONFIG_DETAIL values.


<details>
<summary>Technical reference and sources</summary>

`adm-sql-2026802628`: [dbo.dbc_IGenericConfigDetail](sql/2026802628.sql); source-definition SHA-256 `75e13a1ce054a7b936af2b304536b2ea89aa6e93f5c72796fcde56648d5e6a26`, reading-copy SHA-256 `787fc7552c1632d12fffcb3ee862192e09ab81d01ea194d8041858f9880e28de`, one-based inclusive lines [[1, 108]].

`adm-sql-2042802685`: [dbo.dbc_IGenericConfigHeader](sql/2042802685.sql); source-definition SHA-256 `dee0a6ff0f721422fbbce2758a4a99e9d710b7a0880e12a58489b22bbaccc10a`, reading-copy SHA-256 `1cc19b146e76042f668465bb9fc1e76c25b1d17559a74d10da0b821bace98ae1`, one-based inclusive lines [[1, 255]].

</details>

<a id="admin-feature-setting"></a>

## Feature setting updates and unused removed input

The feature-management routine inserts a missing feature or updates its enabled flag, product-release field and modification stamps. The removed input is unused. A stored enabled flag alone does not prove that an application feature is currently available to a user.

### How it works

1. Use the feature name to distinguish the insert and update branch.
2. Confirm application consumption and user permissions separately from the metadata write.

### Settings and prerequisites

- Update preserves CREATED_DATE and USER_STAMP. Storing ENABLED does not prove that every application caller consults this feature.


<details>
<summary>Technical reference and sources</summary>

`adm-sql-1980182450`: [dbo.dbc_IFeatureManagement](sql/1980182450.sql); source-definition SHA-256 `3ada2ff7e30b33578aeb3d98f0033112634d0fc7f31ce2212eaa2fc81cf0cf18`, reading-copy SHA-256 `a3d4063bc6df142fcf0439cfd27ad8bf5d5292bb2f943ba35a55aa8f65de3daf`, one-based inclusive lines [[1, 40]].

</details>

<a id="admin-action-registration"></a>

## Action menus, missing endpoints and repeated rules

An action definition needs an endpoint lookup; a menu option resolves a menu and optionally an action. Missing lookups can cause a required-field failure, while the menu option allows a NULL action. The rule routine appends each rule without checking for an existing copy. These routines register metadata and do not run an action.

### How it works

1. Resolve endpoint/action/menu identities using each body’s stated predicate.
2. Distinguish required menu or endpoint identities from nullable menu-option actions, and inspect rule duplication separately.

### Settings and prerequisites

- ACTIVE and ALWAYS_AVAILABLE are stored; existing action names are preserved.
- Rule text is stored without semantic validation.
- The menu duplicate guard uses menu/sequence and ignores action, shortcut and separator; new values do not refresh an existing entry.


<details>
<summary>Technical reference and sources</summary>

`adm-sql-1884182108`: [dbo.dbc_IDynamicAction](sql/1884182108.sql); source-definition SHA-256 `29495ad805336cb5215d0c3784ead178264d76260bf58b9d62d94c8ec12790a8`, reading-copy SHA-256 `b39032bd478feb33486bcc5306de5875a992cb0cfda39a65a17d6e0f76b5b712`, one-based inclusive lines [[1, 79]].

`adm-sql-1900182165`: [dbo.dbc_IDynamicActionRule](sql/1900182165.sql); source-definition SHA-256 `8a886bff2be381dbcd5cd5f0dd5cff6a7aacdc04d502824a0803fafde127452a`, reading-copy SHA-256 `007d9cf10b4f75e9d59348c571183f77b1072e03fd65d9602ea76b3007381a93`, one-based inclusive lines [[1, 67]].

`adm-sql-1724181538`: [dbo.dbc_IActionMenuOption](sql/1724181538.sql); source-definition SHA-256 `46991e6c0429391de0ecde9d82129913f0bbf02eded38a5c9af1c98a36788afe`, reading-copy SHA-256 `a79be4748e07d08c1d18aaf050be75b566efed48c686b647dbf096ec375d7e7e`, one-based inclusive lines [[1, 79]].

</details>

<a id="admin-endpoint-exit-registration"></a>

## Endpoint and exit-point definitions do not execute hooks

Endpoint definitions describe code or transport bindings. Exit-point definitions describe named hooks and ordered parameters. The reviewed routines store those definitions without loading code, contacting a URI or invoking the hook. Existing definitions usually remain unchanged when the seed key already exists.

### How it works

1. Read the endpoint or hook definition identity and required parent references.
2. Treat active flags and supported types as metadata until installed caller and service evidence establishes how they are used.

### Settings and prerequisites

- The body neither connects to the URI nor loads assemblies. HTTP_HEADERS and TIME_OUT are not supplied by this procedure; omitted-column database behavior applies.
- SYSTEM_CREATED has an opaque string default; supported endpoint types describe stored metadata, not observed service capability.
- Existing description is preserved.
- Existing exit-point settings are not updated. Runtime hook selection and category semantics need caller evidence.
- This records parameter metadata without binding values or invoking an exit point.


<details>
<summary>Technical reference and sources</summary>

`adm-sql-1916182222`: [dbo.dbc_IDynamicCallingDetail](sql/1916182222.sql); source-definition SHA-256 `219b1136d35f6be65ef712f9a69e61e963048eb6501c2ba22a15a800b9258fcb`, reading-copy SHA-256 `0685e5db616688ba9177e96eec024fa30152ee99b10abcb89c1b6efc63c2a25e`, one-based inclusive lines [[1, 105]].

`adm-sql-1932182279`: [dbo.dbc_IDynamicCallingHeader](sql/1932182279.sql); source-definition SHA-256 `7c67574c1369ab61f419daeb06a6971a4a217929205a50909fbd63cffc6bffe1`, reading-copy SHA-256 `8e687c505e16b00aea6c4cf174a0623ebb1ea84f59393efb7f643a6c9093daea`, one-based inclusive lines [[1, 38]].

`adm-sql-1946802343`: [dbo.dbc_IExitPointCategory](sql/1946802343.sql); source-definition SHA-256 `9a85920dda275416b376202eaf98fc5f8eaa7d633f3aef735d46e4124fb08be2`, reading-copy SHA-256 `ecd5dcd6ff750841a886f6adae91aee493471d5476a058005181ad4727819de2`, one-based inclusive lines [[1, 33]].

`adm-sql-1948182336`: [dbo.dbc_IExitPoint](sql/1948182336.sql); source-definition SHA-256 `5ac7064222adac54cca79e222f43c98d4bfb6ee26e6ab5cdd40a9db3700dca72`, reading-copy SHA-256 `83ba3bbbf81221fbe42846926807aed364a83df642886461bcce50d850523d3b`, one-based inclusive lines [[1, 64]].

`adm-sql-1964182393`: [dbo.dbc_IExitPointDetail](sql/1964182393.sql); source-definition SHA-256 `16733c1527f00541b7e21149a94616c809068ec9f8a674c4698b90ac3fb56f28`, reading-copy SHA-256 `465dc69d5db1815a7a7d0c8bfa0ed56e3cf68ef82390ef534b4dab8fa7f26fad`, one-based inclusive lines [[1, 64]].

</details>

<a id="admin-filter-registration"></a>

## Filter definitions, ordered terms and shared attributes

Filter setup stores a record-type definition, a named filter and ordered expression terms. These seed routines do not run the filter or check its expression grammar. Attribute definitions use one global attribute key: supplying another record type does not create another same-named attribute.

### How it works

1. Identify the record type and filter name, then the sequence of each term.
2. Check field-type and expression meaning through the consuming implementation; stored text alone is not execution evidence.

### Settings and prerequisites

- Existing filter text, record-type settings and ordered terms are preserved.
- The attribute duplicate guard and primary key both use ATTRIBUTE alone, without RECORD_TYPE.


<details>
<summary>Technical reference and sources</summary>

`adm-sql-1962802400`: [dbo.dbc_IFilterConfigDetail](sql/1962802400.sql); source-definition SHA-256 `c545c437939ab220d1bdc40933557cf3be258ccb3ae1e362302fc27ae009250b`, reading-copy SHA-256 `509da87fb8cf9e09307cd25f36eca5edd9195806c79e679b24887d62da286368`, one-based inclusive lines [[1, 66]].

`adm-sql-1978802457`: [dbo.dbc_IFilterConfigHeader](sql/1978802457.sql); source-definition SHA-256 `ea88e7518c39559b9b653845d0c4a07e10d3bf553e9422a3489eb41e4bdcc78f`, reading-copy SHA-256 `837bec565498c48f1f476b26ad6def16221d3988f98a080f1c8b7df53a005040`, one-based inclusive lines [[1, 75]].

`adm-sql-1994802514`: [dbo.dbc_IFilterStatement](sql/1994802514.sql); source-definition SHA-256 `9b902027aa4a3a9236c0d99b9470396892cbb2a823c85e2a94c834adc78efc3e`, reading-copy SHA-256 `3e6d2b72c77ce3990f63c3ea63804ea5fa9d8e30eaddb66ab8c5e1c3202ff341`, one-based inclusive lines [[1, 77]].

`adm-sql-1996182507`: [dbo.dbc_IFilterAttributes](sql/1996182507.sql); source-definition SHA-256 `c0526d66f440c2f9622883fc207675910e57ae6e3d594ad8fd988bcd0313a6d6`, reading-copy SHA-256 `9eccc3fdc47784344b93d9c69a2a736680e7b70b7817f31bcfecb2c1093e699f`, one-based inclusive lines [[1, 65]].

</details>

<a id="admin-form-setup"></a>

## Form setup is a sequence of metadata helper calls

Form setup wrappers call separate helpers for the base form, display resources and checkpoint definitions. Viewer setup additionally creates viewer and screen metadata. No wrapper starts a transaction or compensates for a later helper failure, so complete setup depends on caller transaction behavior and all child calls succeeding.

### How it works

1. Follow the exact wrapper’s helper order; process, configuration and viewer forms use different checkpoints.
2. Verify child definitions and the caller transaction before assuming the entire setup is atomic or effective permissions exist.

### Settings and prerequisites

- String flags/resource groups are fixed opaque selectors; this wrapper passes the object identifier to FORM but creates no MAIN_UI_SCREEN record.
- The helper receives caller tableName and usedByGenerator plus a fixed opaque security flag; checkpoint registration does not prove effective user access.
- The screen helper receives objectIdentifier, while the FORM helper call does not. This is metadata construction, not a verified rendered viewer or access grant.
- Distinct helpResourceKey behavior differentiates this wrapper from dbc_IConfigForm. No actual screen interaction is verified.
- No resource, screen or user permission is created by this body itself. Existing form IDs are not updated even if other supplied fields change.


<details>
<summary>Technical reference and sources</summary>

`adm-sql-136699885`: [dbo.dbc_IProcessForm](sql/136699885.sql); source-definition SHA-256 `7978d27c1bb46877447a11a48cc3a9b65e04adbe49e30596067a37b92b0ff6ac`, reading-copy SHA-256 `bca533586f7beca41bc103c469f0d55f70ec0dd1bd840733ad5ee541eabc87b9`, one-based inclusive lines [[1, 63]].

`adm-sql-1914802229`: [dbo.dbc_IConfigForm](sql/1914802229.sql); source-definition SHA-256 `99e03d28ccead976dfd5c1b4a408424e1e4cd279bd050c09dc43135627cf303c`, reading-copy SHA-256 `cc71ecc5d813cbf7d135a5581bba58209d824ab03c8903023391b5dd68b918b7`, one-based inclusive lines [[1, 79]].

`adm-sql-1957582012`: [dbo.dbc_IViewerForm](sql/1957582012.sql); source-definition SHA-256 `55c81ca32b702da85f40cb6194af86ed9d4dd0e14e9a0077dc690850f67bfb8f`, reading-copy SHA-256 `275e4c92c1aa295e78892c2dc5fc9a54fc508dae9199e36d8335bcf6498f1159`, one-based inclusive lines [[1, 105]].

`adm-sql-2053582354`: [dbo.dbc_IGenericConfigForm](sql/2053582354.sql); source-definition SHA-256 `0dd7c48236c92b42f5e24d26dbb2230e98cb031c46bdd8333fec05ae938bf154`, reading-copy SHA-256 `bf52955d4e3ae16c3d0fa430621935c84abbfefe5dc7cd79de4eee1bbe75aa4b`, one-based inclusive lines [[1, 86]].

`adm-sql-2012182564`: [dbo.dbc_IForm](sql/2012182564.sql); source-definition SHA-256 `f15c3a61fedbc11b4a7b9a87f4bc96235b6d923ec0a3fa7ba2c9341fb98c233f`, reading-copy SHA-256 `d6f1e1a551d4f123e3a19d4ba9bbf8b5a8b6238bab7841004fbc96990eac9b56`, one-based inclusive lines [[1, 65]].

</details>

<a id="admin-metadata-form-paths"></a>

## Insight, details and transaction form registrations differ

Metadata-form wrappers register paths with numeric type 6. Insight builds the path from the form ID; details and transaction forms use a lowercased abbreviation.

### How it works

1. Select the wrapper used by the captured definition and follow its path construction and helper arguments.
2. Check the registered restriction/default identifiers through the screen component that consumes them.

### Settings and prerequisites

- Details and transaction forms pass restriction/default identifiers to the screen helper; the wrapper does not interpret those rules. Insight passes neither identifier.
- Only the transaction wrapper has the additional checkpoint-1/checkpoint-3 tail, including a repeated checkpoint-1 call.


### Limits

- A registered path does not by itself establish the active application route.


<details>
<summary>Technical reference and sources</summary>

`adm-sql-1989582126`: [dbo.dbc_IMetadataTransactionForm](sql/1989582126.sql); source-definition SHA-256 `fc26eff4a79905049ea477d8728956f598938897e8285a08f6195943228f3490`, reading-copy SHA-256 `ac3b2cb3de8632ab53a8cc88f04651d3893cdf2735aba6b73599dd8d27a27722`, one-based inclusive lines [[1, 91]].

`adm-sql-2005582183`: [dbo.dbc_IMetadataInsightForm](sql/2005582183.sql); source-definition SHA-256 `b30bd3743b515a9eaebc70669fcc2d5a19f81b7703b8d55d104e12e9f5ad34ff`, reading-copy SHA-256 `7156d25990cb14efed9a61e6ac2b67361c89e1f21b7070d80df2b65de32a8aca`, one-based inclusive lines [[1, 80]].

`adm-sql-2021582240`: [dbo.dbc_IMetadataDetailsForm](sql/2021582240.sql); source-definition SHA-256 `57896a4fdb2c6da86ebd2ca991b3f416699f0bddb00a604ce49c41de15ed1283`, reading-copy SHA-256 `e95eaafaabc5f8857b43fc8ec36a54e24e3abfc1d7aff0fdc8de6b7a5d37950b`, one-based inclusive lines [[1, 88]].

</details>

<a id="admin-main-ui-mapping"></a>

## Screen counts, templates and license associations

Screen setup checks the existing form rows, may replace the requested active flag, and uses a count guard before inserting. The table also enforces uniqueness on form ID plus active value. Template and license mapping routines register associations; they do not establish user access or license entitlement.

### How it works

1. Distinguish form ID from screen object ID: one license helper selects every screen for the form, while Original selects one screen identity.
2. Keep count guards, table constraints and current application access separate; concurrent safety is not established by an existence check.

### Settings and prerequisites

- The intended count guard and coded flag substitution are static evidence, not a concurrency guarantee or execution acceptance. PathType defaults 1; menu visibility default is opaque. Caller restrictions/defaults identifiers are stored without interpretation.
- No template assignment or rendered screen is established by the seed.
- Selection is by template name and functional group only; ACTIVE is not tested.
- This variant selects by FORM_ID; it does not test screen ACTIVE and does not validate license entitlement.
- Caller supplies the screen object identity; the procedure stores a mapping, not an entitlement grant.


<details>
<summary>Technical reference and sources</summary>

`adm-sql-2124182963`: [dbo.dbc_IMainUiScreen](sql/2124182963.sql); source-definition SHA-256 `145e298d167807d6d6364dc08e2148e0e0a41f66c2a247318bf50c80b966c318`, reading-copy SHA-256 `8132e6c957040ce527763c47397163e4bec96660a357689fe99edee73f4946db`, one-based inclusive lines [[1, 105]].

`adm-sql-2140183020`: [dbo.dbc_IMainUiTemplate](sql/2140183020.sql); source-definition SHA-256 `14924a3b9238c457b8a60a9ee2baf8f30335170b3c11a993b258cb9e12f48ab0`, reading-copy SHA-256 `d62db712ef9355749a50c6c950df8b49cf6a33605c9a72bfcde75893a248285f`, one-based inclusive lines [[1, 63]].

`adm-sql-8699429`: [dbo.dbc_IMainUiTemplateFunGrpXref](sql/8699429.sql); source-definition SHA-256 `eae153bfb7c4cc56e11d57c5b8fc0f66fbc7bc08eabad0cd8e05bc1f78e741e1`, reading-copy SHA-256 `2e076e1f1eb2994a855aa3e58ee09fc40050459ccdbd0448b623baa820e46f07`, one-based inclusive lines [[1, 62]].

`adm-sql-24699486`: [dbo.dbc_IMainUiWmLicenseXref](sql/24699486.sql); source-definition SHA-256 `fc090bd49f1a730e72c00504569a7cd324ac82c3464bf22c663475679e60c21b`, reading-copy SHA-256 `257012b40dc256a6359fab0116a98a2246673253d679fe443a1c24f9e8828bc4`, one-based inclusive lines [[1, 69]].

`adm-sql-40699543`: [dbo.dbc_IMainUiWmLicenseXrefOriginal](sql/40699543.sql); source-definition SHA-256 `2cd646769852510c0afae971a58e4d235a39c67695ba872020ce2d6c4722aec4`, reading-copy SHA-256 `2fec9184e7b74d491156bd25af60fd5c1b6c9b9e1c3444bd55f6edb6cfaa0177`, one-based inclusive lines [[1, 65]].

</details>

<a id="admin-lookup-status-metadata"></a>

## Lookup setup and status-flow metadata boundaries

Lookup setup stores table/field descriptions and can add resource text. Its optional configuration-record-type comparison is not NULL-safe. Status-flow setup stores area/status metadata.

### How it works

1. Check lookup record/table/configuration keys and the optional resource-text branch independently.
2. Read the exact functional-area/status key for status configuration; use separate transaction and caller evidence for operational effects.

### Settings and prerequisites

- The resource-text call is independently conditional, so it can still run when the insert finds an existing row.
- Existing area/status rows are preserved. No lookup query or transaction-status change runs in these registration bodies.


<details>
<summary>Technical reference and sources</summary>

`adm-sql-2108182906`: [dbo.dbc_ILookupReference](sql/2108182906.sql); source-definition SHA-256 `32d52fa56c6cc487b5566ee7dd4bc413114cd20d8edbabaa26cd2119bb341582`, reading-copy SHA-256 `e41bd6a942faa0c5f91295000687f543fb045508ebdbc7e6fe7906bb57082d46`, one-based inclusive lines [[1, 143]].

`adm-sql-2010802571`: [dbo.dbc_IFunctionalAreaStatusFlow](sql/2010802571.sql); source-definition SHA-256 `d56675fc6aae6f512898f76fce7e642f3c3bb77416b2d16f2cd153e71f0002d6`, reading-copy SHA-256 `c60e909f4d585a654692589eb9a89fc4ecfe6a51d1574ed15ee2fa51efd14700`, one-based inclusive lines [[1, 75]].

</details>

<a id="admin-screen-control-seeding"></a>

## Screen parts, groups and controls preserve existing definitions

Screen setup stores parts, groups, layout columns, controls, attributes and event definitions. Most helpers preserve an existing name within its parent. The attribute helper also compares the value, so changing a value can add another row instead of replacing the old one. Event and parameter registration does not execute an event.

### How it works

1. Check the exact parent identity and duplicate key before interpreting repeated setup.
2. Treat active flags, CSS, tokens and event metadata as definitions until a rendered application and caller behavior are separately verified.

### Settings and prerequisites

- Duplicate selection ignores SCREEN_GROUP_COLUMN_ID, sequence and active state; settings are metadata, not evidence of accessible behavior.
- Guard includes the attribute value but ignores active/property flags and tokens. Existing matching triples are preserved; no token substitution occurs here.
- Stores event metadata only; does not raise an event or invoke an event handler.
- Existing parameter values are preserved; registering a parameter does not execute the event.
- Stored parent/nesting metadata does not prove runtime loading order or UI interaction.
- Existing column name/group pairs preserve earlier CSS and sequence; no rendered layout is established.
- Existing part/screen pairs are preserved; source metadata does not verify the actual current screen composition.


<details>
<summary>Technical reference and sources</summary>

`adm-sql-264700341`: [dbo.dbc_IScreenControl](sql/264700341.sql); source-definition SHA-256 `2c0b9b52e11e384454139a41bef8756899648581f600ad3815b78d4c43df8341`, reading-copy SHA-256 `b7f1469f61bf566dc6173e743bfe7dcdeb9450f2e19e3a953506e325a062ee0b`, one-based inclusive lines [[1, 100]].

`adm-sql-280700398`: [dbo.dbc_IScreenControlAttributes](sql/280700398.sql); source-definition SHA-256 `51b19d4bf5befde5f3111431081c2f19a01cb8ea1e0850aeafef060586a7899f`, reading-copy SHA-256 `ee7aaa36ed53d2a027d833b25b5943ef04955d4a51bca0a003cc274f6b166476`, one-based inclusive lines [[1, 382]].

`adm-sql-296700455`: [dbo.dbc_IScreenControlEvent](sql/296700455.sql); source-definition SHA-256 `22c5ae3ef180d76b7474708e902fdf9b7dae2fecd9260e24a220c8a83bf6efe8`, reading-copy SHA-256 `661e041f8c7a2f69ebf659d994f7a2e560a6306bae28343f06f84689cc8b7be8`, one-based inclusive lines [[1, 67]].

`adm-sql-312700512`: [dbo.dbc_IScreenControlEventParameters](sql/312700512.sql); source-definition SHA-256 `4ef69a7aa05ac95c1e4e4a2048e08eaece9934644b07576f7463f152749eaffb`, reading-copy SHA-256 `05a2633bc8df8982129b4685418e18f1221ea5a2824c42aba2b6e494616d5c71`, one-based inclusive lines [[1, 64]].

`adm-sql-344700626`: [dbo.dbc_IScreenGroup](sql/344700626.sql); source-definition SHA-256 `dd166291fed3530fdf2d8a94793d34d77117385deec6a0f7f794ee363c07fd2c`, reading-copy SHA-256 `4179d7332b263cea9d1c20df3011a9ad5fe903f4a0b149f7f2ac707c00ff9378`, one-based inclusive lines [[1, 98]].

`adm-sql-360700683`: [dbo.dbc_IScreenGroupColumn](sql/360700683.sql); source-definition SHA-256 `ca1f0b22784dd639daa31f41ca03a7e3871d57c2b7d007ae4e48437a9acb1771`, reading-copy SHA-256 `a0843b0748243052721fff7daa1d78c8ce2e154241e65d45e73ebc2dfcd89a0f`, one-based inclusive lines [[1, 63]].

`adm-sql-376700740`: [dbo.dbc_IScreenPart](sql/376700740.sql); source-definition SHA-256 `de9b51d9653629b83502b79bb5875f6127573a20178455132d5c9737891e354f`, reading-copy SHA-256 `6c1094b9823450557b2fadb0243dea2e98e07e83a8a158343ed385512922dff7`, one-based inclusive lines [[1, 84]].

</details>

<a id="admin-grid-viewer-seeding"></a>

## Grid and viewer bindings are metadata, with distinct duplicate rules

Grid setup stores expressions and display/edit flags. Viewer setup stores header/detail bindings. Grid duplicate checks normalize NULL field names using zero; web-screen setup identifies existing records by screen name alone.

### How it works

1. Inspect the stored field flags and the actual database constraints separately.
2. Use the component consuming the binding to determine query execution and display behavior.

### Settings and prerequisites

- Grid duplicate checks ignore sequence, flags and width. IS_PRIMARY_KEY is UI metadata and creates no database constraint.
- The grid helper uses server-local GETDATE; other seed helpers use explicit UTC calls.
- Viewer-form setup passes engineType 0, preserves existing bindings and does not execute the data source.
- Supplying a different company does not create another header with the same screen name.


<details>
<summary>Technical reference and sources</summary>

`adm-sql-328700569`: [dbo.dbc_IScreenControlGridColumns](sql/328700569.sql); source-definition SHA-256 `d90d598f82a1711875f29ed12b00ebc6d4dbc65d2e8eb6dd0a8a64288839a37d`, reading-copy SHA-256 `a13a940fb1e1c070497b5ba6c79d307959a50a34d768c4e635f8af147953ef9d`, one-based inclusive lines [[1, 105]].

`adm-sql-504701196`: [dbo.dbc_IViewerTemplate](sql/504701196.sql); source-definition SHA-256 `9019a95068042bd4f03a312dea77f58f86ad20522cf8776fd79f55529b1baae0`, reading-copy SHA-256 `46403b4b49d9b5cad0e8a58da9629182f52994aeabc9841d056f141c53a81b1f`, one-based inclusive lines [[1, 69]].

`adm-sql-520701253`: [dbo.dbc_IWebScreenDataHeader](sql/520701253.sql); source-definition SHA-256 `5a5b7a2ce8ddf2966965bb9f359632196cec1f0a765e366bb30da1424bc0bd7d`, reading-copy SHA-256 `a0e96ea38cac538644dbaa9bc1200cf076c8113cb7739acbd4b1d7516611ff46`, one-based inclusive lines [[1, 85]].

</details>

<a id="admin-resource-text-conflict"></a>

## Existing resource text can raise a setup error

The resource helper preserves an existing language/group/key. If a new text value compares unequal to the stored text, it raises SQL error severity 18 instead of updating the text. This matters to form wrappers that call it after earlier setup steps. System-configuration detail setup also preserves an existing key, but has no corresponding custom text-conflict check.

### How it works

1. Identify language, resource group and key, then compare the source text under the database comparison rules.
2. Treat the SQL error and caller transaction separately; these helpers supply no automatic rollback for earlier wrapper effects.

### Settings and prerequisites

- Comparison follows SQL collation. Repeating an existing key with equal text preserves previous field lengths, decimals and stamps; no language fallback is selected.
- Existing SYSTEM_VALUE contents are preserved.


<details>
<summary>Technical reference and sources</summary>

`adm-sql-2058802742`: [dbo.dbc_IResourceFileBase](sql/2058802742.sql); source-definition SHA-256 `ecd1996aac6ef6e26d02ab4eea1c5b30505c00741fb7f1f2d84e63270c744580`, reading-copy SHA-256 `79779ec7839fea11894d3b7f829770af515ca1ccd11f1705de84065ddf7f4e65`, one-based inclusive lines [[1, 69]].

`adm-sql-488701139`: [dbo.dbc_ISystemConfigDetail](sql/488701139.sql); source-definition SHA-256 `a00293e9faf58207fcaac574c11ae6683fb6a72f6b8822770cc04c1eb9c68596`, reading-copy SHA-256 `e7e91fc3151d797df5337f00db6ddcf83ed1f143a56798c9806725bba82b481a`, one-based inclusive lines [[1, 49]].

</details>

<a id="putaway-groups-version-limit"></a>

## Putaway group availability by release

Putaway groups combine received containers into a movement unit, such as a pallet or cart. Grouping can use destination ranges or locating zones.

### How it works

1. Select the destination grouping used by the receiving workflow.
2. In the documented receiving examples, build and close the group before creating group work.
3. Confirm that the applicable receiving workflow supports putaway groups before using this pattern.

### Settings and prerequisites

- Receiving preferences, group setup and execution-workflow support determine availability.


### Limits

- The reference records Receiving with Putaway Groups as unavailable in Warehouse Mobile 24.1.2278. It does not establish support or continued absence in later releases.


<details>
<summary>Technical reference and sources</summary>

`sdd-function-putaway-groups`: [SCALE functionality reference](../SDD/SCALE_FUNCTIONAL_REFERENCE.md#putaway-groups); reviewed-entry SHA-256 `2a30970d247eedfb103fdc56e1c74278a460c29082539ed44a196907c22f7a83`. Neutral references: R05, R07, R02. [Exact source bindings](../SDD/derived/scale-functional-reference.json). Reference functionality with local limits; current deployment behavior is not established.

</details>

<a id="cycle-count-request-not-created"></a>

## Why a cycle-count request may not be created

A request can be skipped because the minimum time since the last count has not elapsed, or because another open request already covers the same inventory identity. The duplicate check spans plans. The creation routine also uses the last insertion result, so its final return alone does not prove that nothing was created earlier.

### How it works

1. Check the location, inventory identity and applicable count threshold.
2. Distinguish a time-threshold skip from an existing-request duplicate; inspect the existing request through an authorized application view.
3. A final return based on the last insertion cannot determine whether an earlier request was created; inspect the resulting request set.

### Settings and prerequisites

- Threshold selectors allow NULL wildcards for location type, work zone and movement class. A caller-supplied plan changes launch selection, inventory scope and the work path.
- Group size controls one local increment. Work-created initial flag depends on two coded create-work values. Existing request duplication ignores the caller plan/group/launch.
- Location, warehouse and inventory identity determine request selection. Permanent assignment changes how empty locations are handled.


<details>
<summary>Technical reference and sources</summary>

`icc-sql-1068179201`: [dbo.CCP_CreateCCRequest](sql/1068179201.sql); source-definition SHA-256 `b7dc50d6cfe86c6378357d52288b0dd0151f734f4cfe297a43c337da755c8a54`, reading-copy SHA-256 `4fbae264092473429a19aa87075e24b42c059d931996530ebb97c736cad8a1b1`, one-based inclusive lines [[1, 422]].

`icc-sql-1132179429`: [dbo.CCP_InsertCCRequest](sql/1132179429.sql); source-definition SHA-256 `b37d03b13fc380d5856a7b45870f638d34fe44cb4605f81fd19c9b595e531775`, reading-copy SHA-256 `c88742ad609d1d99d1f68426f803e164b0dabc7c8da778a60abe4b53386e75af`, one-based inclusive lines [[1, 187]].

`icc-sql-1052179144`: [dbo.CCP_CheckToUpdateCCRequest](sql/1052179144.sql); source-definition SHA-256 `34df4f8f009bc26af9590d3b0cf42e5cafe8e2fa6d2ff5dc6e653865c8806269`, reading-copy SHA-256 `8f005bae62f9bc7840bc36e67011f919b16983c654f172ce482ffce2083a00c8`, one-based inclusive lines [[1, 398]].

</details>

<a id="cycle-count-plan-counters"></a>

## Why cycle-count plan totals may overlap

The cycle-count plan's open total includes reviewed requests. Adding open, reviewed and closed can therefore double-count requests. The detail pane mixes stored plan values with separate work and transaction counts.

### How it works

1. Read each counter according to its source category; do not sum overlapping categories.
2. Separate a plan completion stamp from proof that all related application work is complete.

### Settings and prerequisites

- Plan ID alone scopes recalculation and update; there is no warehouse or user-authorization predicate. Completion stamping requires MASTER_NAME and no nonclosed requests.
- The caller supplies group size and warehouse; flags are coded rather than read as effective settings.
- Work is counted by reference, requests by plan ID, and transactions by reference plus warehouse and type 40. Equal totals do not prove equal populations.


<details>
<summary>Technical reference and sources</summary>

`icc-sql-1036179087`: [dbo.CCB_UpdateCCPlan](sql/1036179087.sql); source-definition SHA-256 `d9aee133797db49bfb8176eb8c58f50e412c20bf9c6fa9fcc2f97fc9ccea2a37`, reading-copy SHA-256 `5018f25a656381f75bbb8e07131b2540d1f8cba928f28bd0c93f93685ad57e8a`, one-based inclusive lines [[1, 64]].

`icc-sql-1850802001`: [dbo.CCP_InsertCCPlan](sql/1850802001.sql); source-definition SHA-256 `b1604fc8850781e48899efc2e984ef545d9b4cb227c67daed6b30a4c20d45ced`, reading-copy SHA-256 `5c321140f55835c0c24898c50e765baaaf9a95144da005e5e18404b8bb411702`, one-based inclusive lines [[1, 55]].

`icc-sql-1148179486`: [dbo.CCP_InsightDetailPaneData](sql/1148179486.sql); source-definition SHA-256 `954993ab12939bce820d8275dc59d4dc10264f72da197c80c4be7261704cacc1`, reading-copy SHA-256 `bfb33483873fc862947e9050a5452f1e36ad2e2f4fcf54e552da6e3d3232abad`, one-based inclusive lines [[1, 56]].

</details>

<a id="cycle-count-work-creation"></a>

## How cycle-count preferences affect work creation

Cycle-count work creation reads the user cycle-count preference for work type and team, then work-type defaults for priority and group. It also needs the source-identifier configuration. The bulk routine creates detail instructions and an aggregate parent; the logistics-unit routine creates one detail using existing work. These paths have different effects.

### How it works

1. Identify which work-creation path the application uses.
2. Check the assigned preference, work type and required source-identifier setting using authorized configuration screens.
3. Review the resulting parent and detail work separately; a successful insert is not a completed count.

### Settings and prerequisites

- Default precedence follows user preference, cycle-count preference, then work type, together with source-identifier and work-unit-field settings.
- Source identifier comes from a coded SYSTEM_CONFIG_DETAIL key/type. Existing work supplies type/team/priority/group; the request supplies inventory dimensions.
- Caller identity plus coded instruction/internal-number types defines scope; no active user setting is loaded.


<details>
<summary>Technical reference and sources</summary>

`icc-sql-1100179315`: [dbo.CCP_CreateWorkFromRequest](sql/1100179315.sql); source-definition SHA-256 `59d0a4fa4e706f59c8bd2d20c6416966d8596988ff10a92960d4e51f6f3ee89a`, reading-copy SHA-256 `4cb9d1cd1dc5215763fabb420710d15464fa6e44d6c76d4686124cd60a69e0d9`, one-based inclusive lines [[1, 400]].

`icc-sql-1084179258`: [dbo.CCP_CreateWorkForLogisticsUnit](sql/1084179258.sql); source-definition SHA-256 `fd8425ab52e7eab527dc2e07f9d5bad611bc01b91529a32a0e3b592b2a7847d7`, reading-copy SHA-256 `f1ccc7f8d41e3944ae698da8614ebcf6a1c263db693001bed6934c1eebcea77f`, one-based inclusive lines [[1, 210]].

`icc-sql-1212179714`: [dbo.CCP_UpdateWorkForNewInventory](sql/1212179714.sql); source-definition SHA-256 `670ed105ae229e4f9f896e236e9575840b703870493cd6540fca4afc0028ad8e`, reading-copy SHA-256 `c472dea819e4c7e7a802548231e45eb05763c2d3ada3ae56bd34fb1236c15602`, one-based inclusive lines [[1, 44]].

</details>

<a id="cycle-count-work-reconciliation"></a>

## Why count work identity and sequence can differ

Count-request reconciliation can move or remove related work and can merge work units. Several selectors use different identity fields or scopes. Empty-location cleanup removes selected work without deleting the request; merging can remove an old parent and its remaining children. These source rules explain possible behavior but do not identify the cause of a particular stuck work unit.

### How it works

1. Inspect the request, parent/detail work relationship and work-unit context in an authorized view.
2. Keep request existence, open-work count, work sequence and merge outcome separate.
3. Escalate a specific stuck record with its exact application message and sanitized state; do not infer a repair from a count alone.

### Settings and prerequisites

- Selection uses exact plan/warehouse and opaque condition selectors, not current-user access or a caller-confirmed process state.
- Warehouse/location/condition scope applies to lookup; subsequent writes use internal count ID only. No caller access or work-condition filter is applied.
- An empty-item request qualifies regardless of its request CONDITION; selected work filters are hard-coded rather than the similarly named caller parameters.
- Current-parent lookups use work unit and coded type without warehouse qualification. Destination plan/launch equivalence is assumed in assignments, not verified.
- Internal ID only; no explicit warehouse/company authorization. Culture does not change either output.


<details>
<summary>Technical reference and sources</summary>

`icc-sql-1180179600`: [dbo.CCP_UpdateCCRequest](sql/1180179600.sql); source-definition SHA-256 `e32d2732c03a0767bac99854e137ed7af396a88bf759042db61a716dcb11df71`, reading-copy SHA-256 `00179a22c428b2782f348c731207dc690912e8f178417b58074d9148b69e44f6`, one-based inclusive lines [[1, 69]].

`icc-sql-1196179657`: [dbo.CCP_UpdateCCRequestWithWork](sql/1196179657.sql); source-definition SHA-256 `72eab8ce3a952d731a3c7dd3b646864c02fc715232eeabb210737cf8dd47448c`, reading-copy SHA-256 `f72ee105c5bb9afdb784ee031f001934a1d3c1372cf96545c929f0962c6c54ce`, one-based inclusive lines [[1, 79]].

`icc-sql-1116179372`: [dbo.CCP_DeleteCCWorkInstrForEmptyLoc](sql/1116179372.sql); source-definition SHA-256 `2b212574bf3d562b7c6d703b5715eaa2d5c14d3c7cb174bcf5936459bc4e2994`, reading-copy SHA-256 `40f50cdd1db8abf5cd63b65dd41c15ee9800320fd6fae8e52a5a29514673ee99`, one-based inclusive lines [[1, 56]].

`icc-sql-1164179543`: [dbo.CCP_MergeCCRequestsFromDifferentWorkUnits](sql/1164179543.sql); source-definition SHA-256 `6da2617035b0692b47dd15581d6923ecbaab0a3aef373adbdf21f274424e1cf6`, reading-copy SHA-256 `771ac651c57fb0dafa9f444e42b959d898e025098ecd7bb96ed13e47f359f2a9`, one-based inclusive lines [[1, 111]].

`icc-sql-1228179771`: [dbo.CCR_InsightDetailPaneData](sql/1228179771.sql); source-definition SHA-256 `5ba7e6eea1f7e269924025a00187344098a194b0c0c5a6e37f4de566395c9557`, reading-copy SHA-256 `d412a50242c928fa7bdae813672be19fb3aadfe2cfa951a6c7e02bb8d8db687e`, one-based inclusive lines [[1, 40]].

</details>

<a id="inventory-optimistic-quantity-update"></a>

## Why an inventory update can affect no row

The source and destination update routines require all four initial quantities to still match. If another change has occurred, no row may be updated even when the SQL return code is zero. The caller must check the affected-row output. Clearing stock metadata also differs between the source and destination paths.

### How it works

1. Compare the expected initial allocated, in-transit, on-hand and suspense quantities with the authorized current record.
2. Check the affected-row output as well as the return code before treating the quantity change as complete.

### Settings and prerequisites

- Coded default inventory-status setting is used only for the metadata-empty branch.
- Coded default status used for empty state; item defaults depend on item/company/UOM/location/warehouse. Existing metadata has explicit precedence.


<details>
<summary>Technical reference and sources</summary>

`icc-sql-1528704844`: [dbo.INV_UpdateFromLocInv](sql/1528704844.sql); source-definition SHA-256 `f76598a7a60fc7a72a8c509571a9c8e740d8734a8a2ca94044b602ab1717b117`, reading-copy SHA-256 `e83f7306d59033ca7d911f7175885090ede4f7f0e621eb92ae488361aaf27c1f`, one-based inclusive lines [[1, 154]].

`icc-sql-1560704958`: [dbo.INV_UpdateToLocInv](sql/1560704958.sql); source-definition SHA-256 `f3833f1f32f42eb4cce2175fa8471503297fd9fc0ee0fe93175ab8cf46705495`, reading-copy SHA-256 `a89d5104d5d411bb9b5e1c3e82702781ac2155083ddc875b0d96370812f9ecfe`, one-based inclusive lines [[1, 289]].

</details>

<a id="inventory-location-create-defaults"></a>

## How destination inventory defaults and restrictions are selected

New inventory uses location rules, item defaults and supplied source values. A missing location may be created with fixed defaults. Supplying only a volume or weight override still enables a shared override mode, so the other total can become NULL. UOM copying also has its own location and partial-mode rules.

### How it works

1. Review the destination location class and multi-item rule before interpreting a rejected addition.
2. Check both override values and the applicable UOM; a missing value is not necessarily filled automatically.

### Settings and prerequisites

- Location class, multi-item flags, item defaults and one reference-type exemption govern eligible additions.
- A newly created location uses coded defaults, not a location template. The caller supplies its warehouse/location.
- The UOM-copy path has no destination-warehouse predicate or source/destination warehouse join. Repeated location names can broaden its destination scope.
- A coded flag chooses location-UOM dimensions or the item-default helper; this body applies no conversion factor.


<details>
<summary>Technical reference and sources</summary>

`icc-sql-1240703818`: [dbo.INV_InsertLocationInventory](sql/1240703818.sql); source-definition SHA-256 `bf9192018e74b2769fd9c7c625427ea2b7a69f93679fc175bc18bb93063f6e42`, reading-copy SHA-256 `bbd3622bb394f46cef6a5faf15b4052ea9878fa99d31dffefeacf8cb82fd3074`, one-based inclusive lines [[1, 350]].

`icc-sql-1224703761`: [dbo.INV_InsertLocation](sql/1224703761.sql); source-definition SHA-256 `872275d252698011e576942e68f9d2b0c83c7fac592f391953fdb240e3740ba9`, reading-copy SHA-256 `febb0ba80f1135601bd7cd42a8858d84b5c8e32ab0d4f52cbf64ae58a6c763db`, one-based inclusive lines [[1, 39]].

`icc-sql-1176703590`: [dbo.INV_CopyLocUmsForDestInventory](sql/1176703590.sql); source-definition SHA-256 `0139e742135894e22a1dda7b0e280604bf60ad8a7fc0e6c42fc00050dd010f66`, reading-copy SHA-256 `8c780c40b0e0b8553c291dae3bd31ebbb2c203eb0edd686bd003412d1d9b066a`, one-based inclusive lines [[1, 78]].

`icc-sql-1576705015`: [dbo.INV_UpdateTotalsonLocInv](sql/1576705015.sql); source-definition SHA-256 `cc823c3246d820baf8b8e6d7d16ba31f2e9fa99a160ae19669d7d3ff15e62e56`, reading-copy SHA-256 `cc92dcd6391d77654c4c7b7cff6173a9f62301c9522919b1a73584719a3b1242`, one-based inclusive lines [[1, 60]].

</details>

<a id="inventory-insight-count-scopes"></a>

## Why Inventory Insight counts can differ from the selected detail

Insight detail panes combine several result sets. Inventory detail can be selected by inventory identity while its related-work counts use the caller item and location context. Load tiles mix stored totals with a line count. Lot transaction counts use item, company, lot and warehouse. These counts are useful context, not a complete diagnosis or permission to close work.

### How it works

1. Confirm that the selected row and the caller context refer to the same inventory.
2. Check what each count includes before comparing it with another screen.

### Settings and prerequisites

- Counts have different scopes: immediate needs use item/company/warehouse, BOM uses item/company only. Detail inventory ID does not validate the caller context.
- Internal load ID only; status names use coded functional-area selectors.
- History scope uses inventory dimensions, not lot OBJECT_ID in history or a date restriction.


<details>
<summary>Technical reference and sources</summary>

`icc-sql-1272703932`: [dbo.INV_InsightDetailPaneData](sql/1272703932.sql); source-definition SHA-256 `ac23dca7032953dbb5ca16e307696bd637e198a723775b264d315cc9693f751f`, reading-copy SHA-256 `2531cd70d8eec5225b29cee8307244e614d77d419504dcfc9ba5d3d5339888f7`, one-based inclusive lines [[1, 267]].

`icc-sql-1304704046`: [dbo.INV_LoadInsightDetailPaneData](sql/1304704046.sql); source-definition SHA-256 `528cf307f9b3b6bb392840fef785ebc52372e1f254a81890c1a4d506b211516e`, reading-copy SHA-256 `02544b814969a0cfeb128feea54cf6f6e02accfff69a0293e3c20fa2e2d9cb94`, one-based inclusive lines [[1, 53]].

`icc-sql-1320704103`: [dbo.INV_LotInsightDetailPaneData](sql/1320704103.sql); source-definition SHA-256 `68b555d66b61feb1e243f65bf7524b8ba10a118cd9a480535dbd99e5f0abfde9`, reading-copy SHA-256 `e5e2fa885aa73accd57b2d800fb989b67356c5299e3ba70e438de53f40ff3491`, one-based inclusive lines [[1, 53]].

</details>

<a id="inventory-monitor-scope"></a>

## Why inventory monitor tiles and drilldowns can disagree

Some monitor tiles display distinct work units while their warning thresholds count instruction rows. Drilldown summaries also differ in scope: the location-type frozen-empty tile omits the selected zone, and frozen-empty exclusions compare location names across warehouses. A difference can therefore reflect the query rules; it does not by itself prove missing inventory.

### How it works

1. Compare the displayed measure with the caution/warning measure.
2. Check selected warehouse, zone and type, then the exact scope of the summary tile.

### Settings and prerequisites

- Warehouse is parsed from criteria. Caution/warning expressions are passed to a helper; the almost-empty quantity threshold is fixed at 10.
- Location/status grouping can count one location more than once when view rows expose different statuses.
- Culture localizes NULL zone/type/template categories.


### Limits

- The location-type frozen-empty tile omits the selected zone; frozen-empty inventory exclusions compare location names without a warehouse restriction.


<details>
<summary>Technical reference and sources</summary>

`icc-sql-1336704160`: [dbo.INV_MonitorInventoryIndicatorTile](sql/1336704160.sql); source-definition SHA-256 `0b144f9e0ccf7718b0512397908eeb56a3059d674bcd016b83a92635f6893a3d`, reading-copy SHA-256 `9ca9261209ef6def9900c046f67256a02f003d69ca7e39017067b1e81816ce68`, one-based inclusive lines [[1, 83]].

`icc-sql-1352704217`: [dbo.INV_MonitorLocationChartData](sql/1352704217.sql); source-definition SHA-256 `3130773aec0011554b0804f5a0a6b21c00566b4efd98eccba4d0855b09a2adc7`, reading-copy SHA-256 `67e1118085c909c794a7c17ff0952b0186c0969f86124be5e9b4fd2236ee4e0d`, one-based inclusive lines [[1, 63]].

`icc-sql-1368704274`: [dbo.INV_MonitorLocationTypeChartData](sql/1368704274.sql); source-definition SHA-256 `5c5debe11aeb50b42a37805c0d3fc0db83df8a5892e40e2b8512a7d99bab7bd0`, reading-copy SHA-256 `db28f519afb2683b026275f10bb571abaae3dace62f4fd2b5bbd22e2ead6f7e8`, one-based inclusive lines [[1, 71]].

`icc-sql-1384704331`: [dbo.INV_MonitorTemplateFieldChartData](sql/1384704331.sql); source-definition SHA-256 `bbd828a8252d98403bac4e5cb13483eaae345ccdcde6ba6e1e8111f0e76f8cc1`, reading-copy SHA-256 `b3db98fd59e004de08c2948b8598387eaf43464d0b2cc9ff1e5986cde390f4d0`, one-based inclusive lines [[1, 99]].

</details>

<a id="inventory-lot-replenishment-history"></a>

## How inventory changes affect lot status, replenishment and history

Lot status is summarized from distinct location-inventory statuses. Replenishment evaluation uses capacity, minimum percentage and existing requests; it can mark a request without creating work. Inventory history computes before/after values from caller inputs and delegates storage. A history value is therefore not independent confirmation of an actual stock change.

### How it works

1. Separate inventory state, lot summary, replenishment request and transaction history.
2. For a specific discrepancy, retain the exact screen message and relevant sanitized workflow context.

### Settings and prerequisites

- Item/company/lot/warehouse scope only, with no quantity, frozen-lot or active-location filter.
- Location type, item class and capacity/unit-of-measure helpers determine the threshold.
- User shipping preference applies for one coded transaction. Location class/container tracking changes container fallback. Caller supplies initial quantities rather than this routine rereading inventory.
- One coded argument name selects serial validation; no warehouse/company predicate on the serial identity.
- Group ID alone scopes deletion; no user, warehouse or argument-name predicate.


<details>
<summary>Technical reference and sources</summary>

`icc-sql-39319550`: [dbo.INV_UpdateLotStatus](sql/39319550.sql); source-definition SHA-256 `425623b0b53820eecc2632376eb1aef159abd1f064ba10a982404c0a560d18f5`, reading-copy SHA-256 `690a2754ef58123a014bfac90aea0b86e69ec3e8a49aa7938930fcbf701cf39b`, one-based inclusive lines [[1, 62]].

`icc-sql-1544704901`: [dbo.INV_UpdateLocation](sql/1544704901.sql); source-definition SHA-256 `bf0f3b85509467ecc4ce29f2c3b910cde5eaeefab80569e4209c8ebd83d6c540`, reading-copy SHA-256 `ad6cbda55c2def8dfa8601251f3b893ac1f3c390c3ddfea91ebdd79d680318dd`, one-based inclusive lines [[1, 273]].

`icc-sql-1496704730`: [dbo.INV_SaveHistInvChg](sql/1496704730.sql); source-definition SHA-256 `d69abcd6bfa890ca75ffb7d6670c4b61e4feb1576dbe41fe79154d50e2486dcc`, reading-copy SHA-256 `90604c2d1b6522ada1cb3a9808f1ef2909538780199b72dc9fa5b9c8fb7636b0`, one-based inclusive lines [[1, 382]].

`icc-sql-1208703704`: [dbo.INV_InsertArgument](sql/1208703704.sql); source-definition SHA-256 `ad0a5254709ec04a501bbcf18cd0926ee9f06c538bb79ca848a3edd33a6be2a7`, reading-copy SHA-256 `712931b3de4dd5339afd757c6648d9dbdb3015f8d32a343f59954c6ab7d3d705`, one-based inclusive lines [[1, 57]].

`icc-sql-1192703647`: [dbo.INV_DeleteArgumentGroup](sql/1192703647.sql); source-definition SHA-256 `9d9a6aa54208a8643467628db6de468a64ac24538c43e7711c9709f55bde6e01`, reading-copy SHA-256 `d9895eb6632c8a3aa6fb696c8b66b35d46a23a14a4e9328ef654df482f509f24`, one-based inclusive lines [[1, 20]].

</details>

<a id="inventory-company-catch-weight"></a>

## Company transfer and catch-weight boundaries

Company transfer requires eligible positive stock with no allocated, in-transit or suspense quantity. It may merge destination stock and reconcile serials, lots and catch weight. Catch-weight updates have separate container and inventory paths; the container path adjusts only the immediate parent. A container weight update is not a container-close operation.

### How it works

1. Check transfer eligibility and destination identity before interpreting the result.
2. Distinguish catch weight from container status and closure requirements.
3. Use application error/state evidence for an open container; these routines do not establish the cause or close it.

### Settings and prerequisites

- Two feature helper calls gate catch-weight behavior; current feature values are unobserved. Catch-weight-required ITEM existence is not company-scoped.
- Work-type/group controls the inventory proportional-delta branch; the shipping branch does not use that work-type test.


<details>
<summary>Technical reference and sources</summary>

`icc-sql-1512704787`: [dbo.INV_TransferCompany](sql/1512704787.sql); source-definition SHA-256 `4dfc5f4d8526e36ccbb1c0dee6b56728d39694adbd658be783bbbbc98ca801ba`, reading-copy SHA-256 `ef048510e76f35a133fbdbd5dcfa0838fd5407e22c239c71c4ebb3944ef41dc0`, one-based inclusive lines [[1, 638]].

`icc-sql-1592705072`: [dbo.INV_UpsertCatchWeightInfo](sql/1592705072.sql); source-definition SHA-256 `1ec62e20e4a14a131b110c0346adc7dcdcf5235967821ce5934f32eef89aca3e`, reading-copy SHA-256 `a830f111dfed6a99a95b01f1aa28557922da5f6f840b4e1bcc678fc5e1967106`, one-based inclusive lines [[1, 196]].

</details>

<a id="operations-shipment-pane"></a>

## Why shipment detail panels can show unexpected shared fields

The panels summarize stored shipment, line and lot data. A common field may be blank when lines disagree. In the shipment header panel, the dock lookup has no shipment filter, so the returned dock can come from another shipment.

### How it works

1. The header common-value checks use COUNT DISTINCT, which ignores NULL values.
2. The dock variable is assigned from an unfiltered shipment/load join without an ordering rule.
3. These queries display data and do not pick, ship or change a dock assignment.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1633753223`: [dbo.SHP_InsightDetailPaneData](sql/1633753223.sql); source-definition SHA-256 `78364f898a329680b446b42f8071be5d2d79484a1592c4108f91a36096650147`, reading-copy SHA-256 `91be70e93fcaf6cd46bdc9ff8ae8fb5923ba31e252460dcaf62dd1e520a7342c`, one-based inclusive lines [[1, 90]].

`ops-sql-1649753280`: [dbo.SHP_LineInsightDetailPaneData](sql/1649753280.sql); source-definition SHA-256 `5f5cd39cfaee049d31b327677449ac806392ffc58247a63aac55329a775f47f3`, reading-copy SHA-256 `d830be8b5f0188abc253732a3ea15b43bbf934b196747cfe86c5bfd4d1f62d4b`, one-based inclusive lines [[1, 34]].

`ops-sql-1665753337`: [dbo.SHP_LotInsightDetailPaneData](sql/1665753337.sql); source-definition SHA-256 `82641e4f7b810752fb98a499d44fcdf000db3d4d94eccc475a2d6a5bc60a4414`, reading-copy SHA-256 `f7973187384addf779bef5769b0e00c3e435523838bcd6dd6cae73083544db33`, one-based inclusive lines [[1, 24]].

`ops-sql-1617753166`: [dbo.SHP_InsighInPoolDetailPaneData](sql/1617753166.sql); source-definition SHA-256 `106dcd23d87b15df2cb7e9871945d5929122a46da6afee581b61ec29dd032a56`, reading-copy SHA-256 `f9e394a9d5866e941111b5ebd70e8e88c15d1dc399a8b8ebbe40234405474dfb`, one-based inclusive lines [[1, 28]].

</details>

<a id="operations-container-pane"></a>

## Why a container panel count differs from its work count

Container panels use different scopes for children, work and order status. A child count can cover direct children while work is counted across a recursive subtree. Item and lot joins can also repeat a displayed row.

### How it works

1. The shipping-container panel item join can include a company-specific and generic item; the lot join omits warehouse.
2. The displayed serial flag comes from item tracking configuration, not a count of recorded serials.
3. The order-status panel requires a matching detail aggregate despite its LEFT JOIN.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1937754306`: [dbo.SHPContainer_InsightListPaneData](sql/1937754306.sql); source-definition SHA-256 `2616f3ea63cdf4f88870f6cc5d081c563d3bf55b8a3f83b4d2d1dfe9841b9976`, reading-copy SHA-256 `3043d908da3a0b1584c239bb4c7702774e46e0d0556c75238bc22d86ec8ec47b`, one-based inclusive lines [[1, 93]].

`ops-sql-78271684`: [dbo.TpmOrderContainerStatus_InsightDetailPaneData](sql/78271684.sql); source-definition SHA-256 `88e23ff83c3e2f58a2e713405fb29ca55f12f888d8a74797971e9646f5129144`, reading-copy SHA-256 `b956647c63c50650cdd907633e300722009ca3beadf7dbebc809895ec99a5429`, one-based inclusive lines [[1, 52]].

`ops-sql-110271798`: [dbo.TpmOrderLineStatus_InsightDetailPaneData](sql/110271798.sql); source-definition SHA-256 `50711eaba4cb46aa2e7a02d1df080c34df1bd582e2400f94ce06587573a4cf39`, reading-copy SHA-256 `8430c94303d7ceb051405fafaf77b041125024ce0a5ed83119af33117b4e06d9`, one-based inclusive lines [[1, 33]].

`ops-sql-126271855`: [dbo.TpmOrderStatus_InsightDetailPaneData](sql/126271855.sql); source-definition SHA-256 `e9a6ffe1f6f32f41c7b57a8aa426ab9c9d9617efb5d2f3af9bdf2b1095daaa4b`, reading-copy SHA-256 `a239e2c66e90f7caa9f348a363a625219d17b77d7c783a9acbc277494967bf39`, one-based inclusive lines [[1, 37]].

</details>

<a id="operations-work-order-pane"></a>

## Why work-order counts and putaway fields can be ambiguous

Work-order panels summarize stored work and related shipments. The same shipment can appear in two status counts when its lines lie on both sides of the boundary. Available-to-build quantity uses the smallest grouped component coverage ratio, capped at one before subtracting quantity already built.

### How it works

1. Putaway lookup by unit ID lacks a warehouse filter; separate unordered TOP 1 lookups need not select the same candidate.
2. A zero component-needed total can cause division by zero. Missing detail groups leave coverage at one.
3. A feature flag determines whether the resulting build quantity keeps fractions or is floored; negative results are not clamped.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-794798239`: [dbo.WOD_LineInsightDetailPaneData](sql/794798239.sql); source-definition SHA-256 `e6b2ee71e6f585f895d03a922a47526632fdb2639088ff862b7ae6116ac01a46`, reading-copy SHA-256 `b2b3b76908be7a025cfe05ebc3f0d1a08867022b520992505c0ea1bdc4225178`, one-based inclusive lines [[1, 60]].

`ops-sql-810798296`: [dbo.WOH_InsightDetailPaneData](sql/810798296.sql); source-definition SHA-256 `49b57e38e54621cb5df417abf867ed0d6991df10ee5c1d624350de1c2f27a9d0`, reading-copy SHA-256 `6f8c383ae74a161ac96ec5e8ed220c1a3f85c0b2a2034caf4a1eba8394fee68c`, one-based inclusive lines [[1, 94]].

`ops-sql-842798410`: [dbo.WOLP_InsightDetailPaneData](sql/842798410.sql); source-definition SHA-256 `239f1056af4d833a2de286b0acb3cf87506476fa5c154af87dfe2ed0629d0b54`, reading-copy SHA-256 `25a0d8d2e1e0723d052cea54db51bdf4e7f1cf7040c485babbbf75678e3f0f62`, one-based inclusive lines [[1, 59]].

`ops-sql-826798353`: [dbo.WOHB_UpdateQtyAvailToBuild](sql/826798353.sql); source-definition SHA-256 `8f4c14182c44098d8be3c6c788620a5cb9ca11fe952efe23cc5c54b45316e85b`, reading-copy SHA-256 `5c2d31b35fcb6385c52ab7e0e4b47b1a1a2a50c7a368afc55d3d6cecf76cf2e3`, one-based inclusive lines [[1, 99]].

</details>

<a id="operations-receipt-panels"></a>

## What receipt, purchase-order and history panels establish

These panels read the selected receipt, purchase order, container or stored history. Their result is evidence of the fields and relationships selected by the query. It does not perform receiving, putaway, inspection or a purchase-order change.

### How it works

1. Use the internal identifier expected by the exact panel; each body has its own joins and missing-row rules.
2. A stored process or transaction-history entry is separate from independent confirmation of physical work.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1925230259`: [dbo.RCPT_ContainerInsightDetailPaneData](sql/1925230259.sql); source-definition SHA-256 `08332a2b2546baaf9cd455d2852387e8f58bcf72b860b5b3a35d4bebb5473d96`, reading-copy SHA-256 `86bee6a46c4a78b4eaf2c0107ba5d190584930c05bb7164616d0d45bdf751550`, one-based inclusive lines [[1, 35]].

`ops-sql-1941230316`: [dbo.RCPT_ContainerInsightListPaneData](sql/1941230316.sql); source-definition SHA-256 `2da160466138d8ca498082710dc0ee9a8bb8ca21dbfb1ec5e47b5bc6a84755fe`, reading-copy SHA-256 `2f4b589f5892265e33f51c997809e4fb307d05dd9d428427fe43de83fbf26b7d`, one-based inclusive lines [[1, 21]].

`ops-sql-1957230373`: [dbo.RCPT_InsightDetailPaneData](sql/1957230373.sql); source-definition SHA-256 `b3a3141eaf4ed5d9b2986c7f8d458c6dcb3b348957a681d0840c9bd68e90e22a`, reading-copy SHA-256 `6e5a5a809c5cac310c2af3222eca0c6b312109a87c7b093534f1642241be693f`, one-based inclusive lines [[1, 31]].

`ops-sql-1973230430`: [dbo.RCPT_InsightListPaneData](sql/1973230430.sql); source-definition SHA-256 `c7f0b3dd3c4e9cd886b0e2741b400d7833d9cdf68db3900259d0f14324b8849d`, reading-copy SHA-256 `35aa08ba84e249d162e02ec71e00299d18bf60ce43be0680936321ed99208d96`, one-based inclusive lines [[1, 18]].

`ops-sql-1989230487`: [dbo.RCPT_LineInsightDetailPaneData](sql/1989230487.sql); source-definition SHA-256 `c9cdf963853d66969639ec8170a1962cd545430b75059e9c75341039906bbc3a`, reading-copy SHA-256 `25597435a6cef76b696c45d82ff65e27d88c1ce8f9a2294d06fcff54dc6f7871`, one-based inclusive lines [[1, 39]].

`ops-sql-1813229860`: [dbo.POD_InsightDetailPaneData](sql/1813229860.sql); source-definition SHA-256 `91bbe5f4c3e49d66337cce702be73dc37902c8e5cac05ad00deaf9aaefed7f2e`, reading-copy SHA-256 `537a43f31865445afc5bade3baadd124778ff497c7862b247469707b97925cd4`, one-based inclusive lines [[1, 30]].

`ops-sql-1829229917`: [dbo.POH_InsightDetailPaneData](sql/1829229917.sql); source-definition SHA-256 `da37786c1a449670022f74448cb26605b6c72580eb7822b4cea816ba75e03697`, reading-copy SHA-256 `41a6a7fb7248ce377b7298dd119416860f0f2a4eace498c6827cd9d5b2f62e16`, one-based inclusive lines [[1, 42]].

`ops-sql-1845229974`: [dbo.POH_TpmInsightDetailPaneData](sql/1845229974.sql); source-definition SHA-256 `dc8bcc04fcc2bc8c1c1fecea3fa37493fa3a7d4617f388a96728e1a82b179b14`, reading-copy SHA-256 `d4d72401081b7799708634cb9b47ce528e07e8bbcfe3dc39258829a54db8c28c`, one-based inclusive lines [[1, 40]].

`ops-sql-1861230031`: [dbo.PROCHST_InsightDetailPaneData](sql/1861230031.sql); source-definition SHA-256 `06000af4dfca580a74584d2d20fb19d4e5871d42e1ead298f3c909750e245dd0`, reading-copy SHA-256 `bdf3094e93eafacbede2b1eb8c1331a95e0428ecbac724c8242123d8d35f696b`, one-based inclusive lines [[1, 57]].

`ops-sql-1893230145`: [dbo.QLTYHST_InsightDetailPaneData](sql/1893230145.sql); source-definition SHA-256 `f1545c06df777bba6a65c08a87cfeb4267a04d61a440f2902ccd2e9dffa8eb28`, reading-copy SHA-256 `bcc97bc3a57ba6eaaf3621b1f2f2bdf8c89ec0ee976e57edb2d85ed2c191825f`, one-based inclusive lines [[1, 32]].

`ops-sql-1624705186`: [dbo.InventoryInsightDetailPaneTransactionHistoryData](sql/1624705186.sql); source-definition SHA-256 `ed8a0e6be59ce8f6bbdf6e0945a895756f7f64791337a0c403eecb648567a5b5`, reading-copy SHA-256 `fd89376f48a27ed260bd9df9e3e981769ea1139fbfded0b1c156ea26cfa18fe2`, one-based inclusive lines [[1, 31]].

</details>

<a id="operations-other-panels"></a>

## Why a detail panel can use a different identity than expected

The panel helpers have specific identity and join rules. The tote-detail helper looks up a tote header using the supplied detail identifier directly, without following a parent relationship. The movement-analysis panel includes a context row even when its later data selection is empty.

### How it works

1. Check which identifier the panel actually uses; a DetailPaneData name does not guarantee a parent lookup.
2. Interpret each returned row set separately, including a context row that may accompany an empty data set.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-14271456`: [dbo.TH_InsightDetailPaneData](sql/14271456.sql); source-definition SHA-256 `99842dc29d01f2d0f1e23203cc4d52838c7d95109febd24ba85ef2754368615d`, reading-copy SHA-256 `a72847b66d3dc0602f9c962e12aab8fc0f1f4ce9e7333126418dbf801543a59c`, one-based inclusive lines [[1, 28]].

`ops-sql-174272026`: [dbo.TRNHST_InsightDetailPaneData](sql/174272026.sql); source-definition SHA-256 `d7a03dfcec2418cd9c635cfde5833e03be0d3a283eef1bc847293f347df6b75b`, reading-copy SHA-256 `50033ada47b498f34e4eb77c5654cbc6bb5eb56727fd4b7da1eb476dc5ba5293`, one-based inclusive lines [[1, 30]].

`ops-sql-190272083`: [dbo.UA_InsightDetailPaneData](sql/190272083.sql); source-definition SHA-256 `637300733fb7b725151bd4ccaa7daecba7f6f08aba75b1b11f919bc739c15d1a`, reading-copy SHA-256 `b891967c341fce8e5080ef4d651781cf5ad703618b95386fb564b4a236590626`, one-based inclusive lines [[1, 22]].

`ops-sql-213224160`: [dbo.MCA_InsightDetailPaneData](sql/213224160.sql); source-definition SHA-256 `34399acd3cda52499beb57e3c4b58ec05cf1218465d9c76c0baab7f2f289dfe3`, reading-copy SHA-256 `3fe98d316cc66828ba6e3073097eab45d6ecf9712d1f8b52a3f2f7980d1458e4`, one-based inclusive lines [[1, 35]].

`ops-sql-382272767`: [dbo.WEG_InsightDetailPaneData](sql/382272767.sql); source-definition SHA-256 `88d6649ef1c69261a4ecdd0e0c2f3b7068cc8c604a8876cd26e77ef64528436b`, reading-copy SHA-256 `f48f9dd2c81378dd72c6b803310e6eb2de2299cda9efd7a68c61cd10ab2290cf`, one-based inclusive lines [[1, 31]].

`ops-sql-584701481`: [dbo.DIM_InsightDetailPaneData](sql/584701481.sql); source-definition SHA-256 `af93ddfbb056d60a76caf0a52110292db609d124dfc639d88d9d62a765bd7b5c`, reading-copy SHA-256 `e5f257bcd5eabbcdb20ba45b40bdf416bef0d061efa673adff752b5e9f91cc8e`, one-based inclusive lines [[1, 18]].

`ops-sql-600701538`: [dbo.DM_InsightDetailPaneData](sql/600701538.sql); source-definition SHA-256 `b0a7a4eea9d845b84762a839a9a71cc140dfcc9120e40041884ed2ddf020d4a9`, reading-copy SHA-256 `8a7af6a60894b7ab3097f778c52dcdc30b6edfa47f436721b661f59620b89b6c`, one-based inclusive lines [[1, 33]].

`ops-sql-616701595`: [dbo.DOM_InsightDetailPaneData](sql/616701595.sql); source-definition SHA-256 `b43dbb3b77c4b93e602dfd425c610bf5b1489e98d05a22c14991e669ac228a68`, reading-copy SHA-256 `8af1875b9fba452f2328cb1c5b6b2e51ec07b5fef11b146138c9d9a5b70624b1`, one-based inclusive lines [[1, 18]].

`ops-sql-892178574`: [dbo.AD_InsightDetailPaneData](sql/892178574.sql); source-definition SHA-256 `858628db39efcab120c5184af1f078c394bd4c3bdb1cc3eff6e824a4da326835`, reading-copy SHA-256 `3fd6a1218a7d5403b5b61af3fe9785df59fa6042f0c446e7b9d1d8298eb24cc6`, one-based inclusive lines [[1, 20]].

`ops-sql-924178688`: [dbo.ADT_InsightDetailPaneData](sql/924178688.sql); source-definition SHA-256 `9aca3adf7db49d7f04c3a8bff77b4f3765893eaf10f5e6215b91de1a3051edf2`, reading-copy SHA-256 `5c07ea0246316ae5b5a7c56b21621ec37c9f24264670c797b6f5d35d79f6fbaa`, one-based inclusive lines [[1, 27]].

`ops-sql-1073751228`: [dbo.RQH_InsightDetailPaneData](sql/1073751228.sql); source-definition SHA-256 `2e29d63ec1acfe8df5d7cd6b1f9ad8dbc1686f0b78311d9d5735166812c13034`, reading-copy SHA-256 `68710e948d7ac845079bc1a7a91686ceeaef8a984b31de4b4e855027ef2e5254`, one-based inclusive lines [[1, 29]].

`ops-sql-1096703305`: [dbo.IN_InsightDetailPaneData](sql/1096703305.sql); source-definition SHA-256 `71498a5c1d76cf2c790b6210c402a106acb7c7b7c7b1e2705b833acf28f575cb`, reading-copy SHA-256 `67ec081774a8e52997b97bef4d23cc3a5753a532af26b6c6417fc2bd38f96a67`, one-based inclusive lines [[1, 30]].

`ops-sql-1461228606`: [dbo.PGPT_InsightDetailPaneData](sql/1461228606.sql); source-definition SHA-256 `7c5fe7690607dc9631272874071990e77b129dfb6def1c61f36f279fd18f241e`, reading-copy SHA-256 `44beb41fdee4b18218f2bb26ed7c0a39bc4fca12cd8d281c50cb9c0dec39a842`, one-based inclusive lines [[1, 28]].

`ops-sql-1745753622`: [dbo.SHP_MOPInsightDetailPaneData](sql/1745753622.sql); source-definition SHA-256 `346a4a23dcf7c162f5a312b832c366618a70134baac4c79793fa18c0cb312df9`, reading-copy SHA-256 `ad925b45f7affc5187e882ba8a55578d64e9eb7d43bd161938b3c12c2f3e227e`, one-based inclusive lines [[1, 21]].

`ops-sql-1877230088`: [dbo.PWL_InsightDetailPaneData](sql/1877230088.sql); source-definition SHA-256 `f9a4a1202a360989717814ae7b69df79b7912d484dcad89de4c76a915358a743`, reading-copy SHA-256 `7f8ae3d4ab4fe7b5990b20d23be939d5abadf678feb28e5e1a49ed5bff7aa04f`, one-based inclusive lines [[1, 23]].

`ops-sql-2072706782`: [dbo.LA_InsightDetailPaneData](sql/2072706782.sql); source-definition SHA-256 `a440c9f7b222c92a94e669617fb4dc57c2a31fa4961faa51052a5bdc3035ad50`, reading-copy SHA-256 `e5112c2878ea89fd838948da9b420f56ea1deffbbbc06f4b8730f39369e4051e`, one-based inclusive lines [[1, 23]].

`ops-sql-2145755047`: [dbo.TD_InsightDetailPaneData](sql/2145755047.sql); source-definition SHA-256 `a702b60f5fbda493511362b526ab058ba5606295442375107401d2c31546f6d8`, reading-copy SHA-256 `bd5019fe9961c1449441409d286d2c51ffab40fc8c4b3cb2501c87481bb56bef`, one-based inclusive lines [[1, 24]].

</details>

<a id="operations-serial-uniqueness"></a>

## Why a serial uniqueness check can miss a duplicate

The check changes scope according to duplicate-serial configuration and the supplied item context. A missing object identifier is especially significant: the default NULL value makes the exclusion comparison fail to match existing serial rows, so the routine can report unique despite a duplicate.

### How it works

1. Receipt container context takes precedence over location inventory, then shipping container.
2. One branch compares item, company and template; another compares item only; the global branch checks serial text across the table.
3. The routine returns a check result and does not create a uniqueness constraint or insert a serial.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-206272140`: [dbo.ValidateSerialNumberIsUnique](sql/206272140.sql); source-definition SHA-256 `398d383007dee4dea1142c5f0344b106fc440706a5461c1dd8e18b072f7973f5`, reading-copy SHA-256 `2cd84fc25ee61c92d30b43ac636bd30cd004af907ae08ef560ff32c024315ac0`, one-based inclusive lines [[1, 140]].

</details>

<a id="operations-receipt-status-rollup"></a>

## How container status changes reach a receipt header

The container helper updates the selected status and rolls the minimum child status up its parent chain. The receipt header then combines container statuses with open detail quantity and can queue a close alert. These are database changes, separate from physical receipt completion.

### How it works

1. A missing positive ancestor or a cycle has no explicit loop guard.
2. Header close date is set on a change to the configured closed status and is not cleared on reopening.
3. The alert check prevents an existing matching request in the query, but its NOLOCK check is not a concurrency guarantee.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1909230202`: [dbo.RCB_SetStatus](sql/1909230202.sql); source-definition SHA-256 `62ad853ddc49e7960ed6bdcc8a2dcc96851aea27b1296f1fdd6ca788c1d994a1`, reading-copy SHA-256 `5a7fe96644b388612309018b3d3a825022b907c5fb09a141ec9f3051db4ae351`, one-based inclusive lines [[1, 67]].

`ops-sql-1121751399`: [dbo.RTH_UpdateHeader](sql/1121751399.sql); source-definition SHA-256 `c0ab4f803e766695698fd12ec2d7d282e6b80b2fc8f1c8e1bf766e9fb364537b`, reading-copy SHA-256 `4a4c6a68831f6ebf8291d688a837c3659cdbcc2fc4c317e8346e558c5a942378`, one-based inclusive lines [[1, 125]].

</details>

<a id="operations-shipment-status-rollup"></a>

## How shipment and load status rollups retry

Shipment and load helpers calculate a status range and update only when the stored old statuses still match. They retry without a fixed limit. NULL old statuses can affect both change detection and matching, while alert insertion can occur before the shipment update succeeds.

### How it works

1. The load fallback repeats the minimum-status test and does not reliably repair a nonpositive maximum.
2. Order completion checks only detail status1 below 900; it does not inspect all ten status buckets.
3. The bodies do not supply an encompassing transaction for the whole chain.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-71319664`: [dbo.SCB_SetStatus](sql/71319664.sql); source-definition SHA-256 `55591eeef196c8ce6b5026732541813d2ce7fad1d7cf6fa646a159c9a79a24a5`, reading-copy SHA-256 `3e49bbb87349f31132602011d753773c02a01100c661fd4632da26e043fa9c84`, one-based inclusive lines [[1, 58]].

`ops-sql-2065754762`: [dbo.STH_UpdateHeader](sql/2065754762.sql); source-definition SHA-256 `94304e8fe246dc7c4a5c67dccb38c2246029d095efa7c246803d1bfc51a738f8`, reading-copy SHA-256 `363c6a189e422cd4fa34382a8cedee3a7e543130d41a857d6a91d687e72a4bf0`, one-based inclusive lines [[1, 224]].

`ops-sql-2081754819`: [dbo.STH_UpdateLoad](sql/2081754819.sql); source-definition SHA-256 `b3179e7999357d29e0ae1356feb1e0f249295107a557a3bc4147ab4f82f0035a`, reading-copy SHA-256 `7d45c6b1323129eb40418c9ba67aaabdd3b347dc0738fcac012e6430c5d66711`, one-based inclusive lines [[1, 111]].

`ops-sql-1515152443`: [dbo.STH_UpdateOrderStatus](sql/1515152443.sql); source-definition SHA-256 `dfd2f996cee9a80ad56290d63c6a85bc8ae67c3efc3396d6495482e6b58119d4`, reading-copy SHA-256 `1356b148c8375fd1b62f3407888364a49b2dcc81b19d26801f023ec9527f734e`, one-based inclusive lines [[1, 77]].

</details>

<a id="operations-status-bucket-move"></a>

## Why quantity movement variants can leave different header statuses

Both helpers move quantity between the ten shipment-detail status buckets. The unsuffixed helper refreshes the shipment header when the leading or trailing status changes. The 01 variant stops after updating the detail.

### How it works

1. The source status must exist and the remaining source quantity cannot be negative.
2. There is no explicit rejection of a negative move amount or a guard against an eleventh occupied status.
3. UPDLOCK is present, but a transaction spanning the read and write must come from the caller.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1457752596`: [dbo.SDB_MoveQtyToSts](sql/1457752596.sql); source-definition SHA-256 `fa104e94e393842afe3be154df8f564aa49c281569187ab1b23288ebf7f12c64`, reading-copy SHA-256 `a254de63173809d545ffdff76add2f835b6b50276f91da5dd2a38ec86a9b260c`, one-based inclusive lines [[1, 414]].

`ops-sql-1473752653`: [dbo.SDB_MoveQtyToSts01](sql/1473752653.sql); source-definition SHA-256 `777b07b9857f25008e51fe7d4282d9e37c8897d75a36387d2e7dd3d8622179dd`, reading-copy SHA-256 `8c547ca0dacd2a5b4ceed97f66a2732fdafe848e0b899c5e06032bec327d76a8`, one-based inclusive lines [[1, 403]].

</details>

<a id="operations-rejected-detail"></a>

## What transferring a rejected detail copies and resets

The transfer helper copies a detail to another shipment, resets its status buckets and marks the original rejected. It copies existing total quantity, weight, volume and value to the new line rather than recomputing them from the supplied moved quantity. A separate cancellation helper subtracts shipment totals from an order and can subtract again if repeated.

### How it works

1. The transfer owns a transaction and rethrows caught errors; its rollback can include an existing caller transaction.
2. Original status-bucket quantities are not all cleared when original totals become zero.
3. Header child return codes are not captured by the transfer, so a nonzero return without an exception is different from a caught failure.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-158271969`: [dbo.TransferRejectedDetail](sql/158271969.sql); source-definition SHA-256 `62d929b26c6189a4c719ccb3aeac93f384f8fad07c2d07f35b8c12b6b904206b`, reading-copy SHA-256 `e139e86309559d55ebfb12cd638e4738225425bdee11e9187f9766db5a784349`, one-based inclusive lines [[1, 417]].

`ops-sql-972178859`: [dbo.CancelShipment_UpdateOrderHeader](sql/972178859.sql); source-definition SHA-256 `fa45c5ac9c5519c8176ffd830a1ac2959682871f422e9c7e1e43a8becd7bf97d`, reading-copy SHA-256 `2fcf462ecc8bda41c970d582fd5a944a17732b66ca63cef80ce5bf1fda866e2d`, one-based inclusive lines [[1, 55]].

</details>

<a id="operations-warehouse-alerts"></a>

## Why an alert request can be deleted during validation

The batch helper sends selected requests to inbound or outbound validators. A validator deletes a request when its receipt or shipment status is missing, or when a configured criterion fails. It does not send an alert or mark the batch processed.

### How it works

1. Inbound criteria compare text even for numeric fields. Outbound lines, value and weight use numeric casts with zero default scale.
2. No criteria leaves the request intact. NULL comparisons can avoid marking a failure.
3. Deletion uses the supplied request identifier without an added warehouse ownership check.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-215320177`: [dbo.WAP_ValAllRequests](sql/215320177.sql); source-definition SHA-256 `30f3523512d26c37785c744c474da555ac213d6c4ac2a5f6736c9b2bc8fa17a5`, reading-copy SHA-256 `6f4381b8a6fb902e90393d9714b2a8d5770e58d5e9e5f5fc3551d6eb6ba0cfd4`, one-based inclusive lines [[1, 50]].

`ops-sql-222272197`: [dbo.WAP_ValInboundReq](sql/222272197.sql); source-definition SHA-256 `68368f319ba78aed29284628e5c90e2a66702edb5dc3dfdde3dba63c3f1a0896`, reading-copy SHA-256 `4d53ab0ceeeba972e969a35f992fcd510d70630d1e120c446da1f5597d517acd`, one-based inclusive lines [[1, 158]].

`ops-sql-238272254`: [dbo.WAP_ValOutboundReq](sql/238272254.sql); source-definition SHA-256 `ddf1cee1d15514f6c8f372d8769afd31bf6c604a64c2990d9acd538d3e94ef2e`, reading-copy SHA-256 `e19da5ba26fae02e3d604c43c778987f0da2172328e9c9b031b9a05f3beba34b`, one-based inclusive lines [[1, 209]].

</details>

<a id="operations-audit-history"></a>

## Why an audit record can lack a short value

The audit logger creates a header and passes optional values to a chunk helper. That helper uses a strict length comparison, so a one-character value and a final one-character remainder after a 1998-character chunk can be omitted. Process-history logging separately depends on an activation flag that a caller may supply.

### How it works

1. The chunk length uses LEN, which ignores trailing spaces.
2. Audit header and value writes are not wrapped in a local transaction.
3. A non-NULL process-history activation flag bypasses its configuration lookup.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-908178631`: [dbo.ADT_IAuditLogValue](sql/908178631.sql); source-definition SHA-256 `17484604cc41cc0b15d8dab63ef28d465cfeb0498856a1cb5d9ff884ee85ef0d`, reading-copy SHA-256 `fc84c5c1e44c9eaa51a889abc1dc5a6b141e3a0d874089c415bd811f5d6fab9f`, one-based inclusive lines [[1, 52]].

`ops-sql-940178745`: [dbo.ADT_LogAudit](sql/940178745.sql); source-definition SHA-256 `192b4b60c48e6d6b917d9653c3676e7f6c309afa5fa97384f8e2693951ac9f54`, reading-copy SHA-256 `f6ee6692e6c0666053d1570e18f013f1557a338d7efd48f33f60acbb830a7cc2`, one-based inclusive lines [[1, 170]].

`ops-sql-1064703191`: [dbo.HIST_SaveProcHist](sql/1064703191.sql); source-definition SHA-256 `dde4e8f66307129ea6420040714e240d9bb07c5b21424c46b2e2f51e321e88d9`, reading-copy SHA-256 `e75c1217030612a4c1b6920abc46392ed9b20022c308345c88c3c12b1562ea65`, one-based inclusive lines [[1, 69]].

</details>

<a id="operations-transaction-history"></a>

## Why a history error can occur after rows were inserted

Transaction-history helpers record or infer quantities; they do not independently prove the inventory operation. The general logger inserts history and attributes before some serial checks. Without a caller rollback, a later error can leave partial history.

### How it works

1. The general logger captures @@IDENTITY, which can be affected by trigger inserts.
2. Deallocation-history running balances depend on consecutive rows from an unordered insert, and the comparison tuple omits company.
3. Supplying both wave and shipment identifiers broadens the deallocation selection through OR.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1048703134`: [dbo.HIST_LogShipDeAlloc](sql/1048703134.sql); source-definition SHA-256 `9b40e0f2fc36538cd52d2481e8bd24ea3704b9efddae4d4d7be307f14d42e99f`, reading-copy SHA-256 `eb4dc9afbff124a01323072bf27af77b956da8613a9da0d0b9e5eebcc328d045`, one-based inclusive lines [[1, 208]].

`ops-sql-1080703248`: [dbo.HIST_SaveTransHist](sql/1080703248.sql); source-definition SHA-256 `297e8e60397483a4632abda22909979ff21bb643a5db203f069303883f4a1cfc`, reading-copy SHA-256 `d37efb6fe5e229784c5b29dfc438664bd755accf35b4753f82b9b48949ba761d`, one-based inclusive lines [[1, 384]].

</details>

<a id="operations-deactivate-work"></a>

## What deactivating a work unit changes

Deactivation copies the work unit to inactive storage and then deletes its active instructions. The helper has no local transaction around those two steps and does not check a completion condition. The reconciliation wrapper selects a narrower set first, updates a condition and calls deactivation.

### How it works

1. Copy uses NOLOCK while the later delete selects the work unit again.
2. The reconciliation count applies to its filtered instructions, not every instruction for the work unit.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-552701367`: [dbo.DeactivateWork](sql/552701367.sql); source-definition SHA-256 `819132075487b4a743f956e210d2d580996ba4143b07f3f7adf977a30c477379`, reading-copy SHA-256 `5e256e6d3d260b1e6b9e8c4c457c75965fed741f90115e1e95f62c2aef59163b`, one-based inclusive lines [[1, 216]].

`ops-sql-988842885`: [dbo.TRAV_CC_Reconcile](sql/988842885.sql); source-definition SHA-256 `936ee7a19d583060b46ed552301c7242ef28f1ec890eb81336f6dac43848a57e`, reading-copy SHA-256 `56fdac8b5520e6a7304c06415b5ac1579465dee9d777430999d31ae216ead830`, one-based inclusive lines [[1, 60]].

</details>

<a id="operations-work-creation"></a>

## Why pallet destinations can be overwritten after work creation

Work-creation callbacks collect selected work instructions and upsert pallet destinations by work-unit name. More than one destination for a work unit can overwrite the same pallet row in an unspecified order. The outgoing-location callback can replace an existing value, including with NULL when no mapping branch matches.

### How it works

1. EX02 also copies WORK_UNIT into instruction USER_DEF1; EX08 does not.
2. Pallet renaming reads an old name from instruction USER_DEF1 and updates pallet rows without a warehouse filter.
3. A stored callback definition does not establish that the application invokes it.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-148507908`: [dbo.TRAV_EX02_WorkCreationAfterExitPoint](sql/148507908.sql); source-definition SHA-256 `f75744d09743e4ccffc78fac5ed6f92e3cdb53cbaba78efcaa20d7b6d933719d`, reading-copy SHA-256 `6465aef65ed20d3ea71102284b4a221eb9a3649852c4ef02004df7bdb8ee89a7`, one-based inclusive lines [[1, 99]].

`ops-sql-1323151759`: [dbo.TRAV_EX08_WorkCreationAfterExitPoint](sql/1323151759.sql); source-definition SHA-256 `33f78951a2b397351374bb6fab66ca656242d7623b605b99e02019d17a9d606b`, reading-copy SHA-256 `f788af52057875bd913fd88c0816601311712b6965670551aa122caeddbc759c`, one-based inclusive lines [[1, 97]].

`ops-sql-1941581955`: [dbo.EXP_WorkCreationAfterExitPoint](sql/1941581955.sql); source-definition SHA-256 `56ac88720b6f8f12f58a2be021f322163151c574895268334178973215220855`, reading-copy SHA-256 `3a1899d38fb991b627af7f1fda166caa2e04fc1e079e75affa0068c950545120`, one-based inclusive lines [[1, 70]].

`ops-sql-132507851`: [dbo.TRAV_UpdateWorkUnitName](sql/132507851.sql); source-definition SHA-256 `c48518646822ddba7088240c6cb3735d5d0d47b20d4634f2bf85bd5de7944edb`, reading-copy SHA-256 `a56d68963bf53fa4990b201d28f6bdc9fb4b66691fcb319b828aae7abb259156`, one-based inclusive lines [[1, 36]].

</details>

<a id="operations-lane-priority"></a>

## Why escalation can change more than one instruction

Lane insertion checks only the lane/work-unit pair. The escalation jobs mark lanes by work unit and, when any instruction has missing priority or priority above three, set every instruction for that work unit to three. Existing lower priorities can therefore also change.

### How it works

1. The existence check and insert have no concurrency protection against duplicate pairs.
2. EX08 additionally maintains pallet rows and mapped outgoing locations; its NOT IN cleanup can be suppressed by a NULL work-unit value.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1522208573`: [dbo.TRAV_EX02LANEDataProcess](sql/1522208573.sql); source-definition SHA-256 `e304b1fec819b45b2f21adceaed7eccf387861000a2ef8ee6e119e5b59369115`, reading-copy SHA-256 `d50227b545135be5c65b61f7a3ab9b6434903c544cdf107f41c4a58879f3b515`, one-based inclusive lines [[1, 13]].

`ops-sql-1538208630`: [dbo.TRAV_EX02_ScheduledJob](sql/1538208630.sql); source-definition SHA-256 `10484880fcded0896e91c5c4cc52de519030c9f3139bbf8048435243f210173d`, reading-copy SHA-256 `0c48dafd94ef90dfe2445ae7fc17cacd4382cf8c70bc7d1254b39fa0610ce534`, one-based inclusive lines [[1, 49]].

`ops-sql-1339151816`: [dbo.TRAV_EX08_ScheduledJob](sql/1339151816.sql); source-definition SHA-256 `51079ad2fba65f10840e10bd23083fda3078dcf45618c4251ea569df5c27d796`, reading-copy SHA-256 `0b27501c833ef363ecca4f45e0a497e7ce431e7a5a98fe2cc40adcfb787b2ba9`, one-based inclusive lines [[1, 136]].

</details>

<a id="operations-dif-queues"></a>

## What a wave or pallet queue success means

These helpers set a wave flag or insert DIF queue messages. A success output does not confirm that an external system received or processed the message. Some wrappers assign success without checking whether any row was inserted or updated.

### How it works

1. Wave enqueue requires the stored selection flag and looks up an event and endpoint without ordering.
2. Pallet outgoing data comes from the selected work unit plus a padded next number; missing values can make the payload NULL.
3. The mark-for-PS helper sets success even when no launch row matched.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1474208402`: [dbo.TRAV_EX01_InsertDataForPS](sql/1474208402.sql); source-definition SHA-256 `679415b21020ef4dc72c25ace20ebe6b4d30d1345c02a5ff110426a5d9561d4c`, reading-copy SHA-256 `00c0316c2133ba6b9e3534e5e143627aec5782a23b6188698b389a9553612730`, one-based inclusive lines [[1, 40]].

`ops-sql-1490208459`: [dbo.TRAV_EX01_ResendPSData](sql/1490208459.sql); source-definition SHA-256 `b8793d03b4738af086ab02adc67263ee7e3e3e6f67cc8f9181300bd47cd55d1b`, reading-copy SHA-256 `bfc4b76d431263dbc3489886885293c218592fcbb897e4d5ffc24d40ad6d9b7a`, one-based inclusive lines [[1, 34]].

`ops-sql-1602208858`: [dbo.TRAV_EXP_ReleaseWaveAfter](sql/1602208858.sql); source-definition SHA-256 `a2f6c29ad94db9bcbb7d617e65e5ba7d3523db5615ccc71a27ade5b488c482f3`, reading-copy SHA-256 `2799f91737f1560e4358ca0ad27754e9dfd629f6d5a971aba6a668f99da9ffeb`, one-based inclusive lines [[1, 21]].

`ops-sql-1861177976`: [dbo.TRAV_EX01_MarkForPS](sql/1861177976.sql); source-definition SHA-256 `90c18322d18e23f9651d549358c2c1ebce06d8c99956a9d6cdce5d51781fbf01`, reading-copy SHA-256 `0b8d4c1869970b145994a54058a4e4687e400e2a42f025c8b68f24b077040b61`, one-based inclusive lines [[1, 23]].

`ops-sql-1849317898`: [dbo.TRAV_EX02_SCALEtoWCSDIFOutUpdate](sql/1849317898.sql); source-definition SHA-256 `0e1a8a9b0830bf77e837a823799141ce8757d4fd095c7822a487aeb74d54b3a9`, reading-copy SHA-256 `c6b04903bbd88ac9d465aa5ab8042adc2074b738b45a99f451f9177e59e492c5`, one-based inclusive lines [[1, 45]].

</details>

<a id="operations-packsize-export"></a>

## Why carton export quantities and sequence differ by helper

The carton export helpers rank containers by pick-count grouping and source location. The EX01 helper casts quantity to a whole number; EX06 keeps its stored fractional quantity. Separate dimension and pallet helpers change stored values and do not establish a completed export.

### How it works

1. Parent-child export joins use text container IDs without warehouse or company scope.
2. Dimension update matches container ID only and converts supplied text before multiplying volume.
3. Pallet-weight validation can return a success-shaped row, an error-shaped row or no result set; stored weight text is converted to decimal.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1355151873`: [dbo.TRAV_EX06_GetPackSizeWaveContainerData](sql/1355151873.sql); source-definition SHA-256 `dd69ccd0d880e604f0c62eb4362ba51d3850f8cd3620214f7d755677f7ddd216`, reading-copy SHA-256 `b41a6f0ecf570c477a18c980dae822b6de32a12feb30d0043a7543b9e36f0703`, one-based inclusive lines [[1, 129]].

`ops-sql-1833317841`: [dbo.TRAV_EX01_GetPackSizeWaveContainerData](sql/1833317841.sql); source-definition SHA-256 `80b2b4b30f1b587abacca43981d32aefd72da291bb799c51caf56a38a0dc34fe`, reading-copy SHA-256 `59acecdea4054b593d21464509e953dee8696244cfd523e1eb7e0770d1324139`, one-based inclusive lines [[1, 59]].

`ops-sql-1746209371`: [dbo.TRAV_EX01_UpdateContainerDetails](sql/1746209371.sql); source-definition SHA-256 `cd9c76eb0f115e333dd88e997701969d07349b48af4a2067e58ba3ef8d11ed97`, reading-copy SHA-256 `58fd0c2d01e5f2592b5a7dbaa3655a57721ba1b18ccf6b7460b153e14d555378`, one-based inclusive lines [[1, 27]].

`ops-sql-1570208744`: [dbo.TRAV_EX06UpdateMOPValues](sql/1570208744.sql); source-definition SHA-256 `9fcff46598be0b118036aedb709e1ea532300ba884ce9f3a5080b43375032597`, reading-copy SHA-256 `eec450473b974b5a9b522809252df8b29de003030ff82d3f901d08f3bf714c28`, one-based inclusive lines [[1, 12]].

`ops-sql-1586208801`: [dbo.EX06ValidateMOPNum_Weights](sql/1586208801.sql); source-definition SHA-256 `63449bc016c6ea7de9286a8c6016328f1405fb58d93d9d9abaed2da2aae38b2f`, reading-copy SHA-256 `0dc14ccacb3943ac4e7825743fcf04ef612ff6e30d339355fe6b7cb860af1420`, one-based inclusive lines [[1, 34]].

</details>

<a id="operations-rf-quantity"></a>

## Where the RF quantity warning comes from

The RF helper generates JavaScript that compares the form quantity to one configured maximum. It does not itself validate a scan or prove that the browser ran the code. Its configuration lookup has no warehouse filter even though it extracts warehouse and user from session XML.

### How it works

1. A missing maximum can make the generated return value NULL; duplicate configuration rows can fail the scalar lookup.
2. The XML helper parameterizes the document but concatenates the supplied XPath and namespace syntax.
3. Informational messages from this helper can contain session and debugging content.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-940582439`: [dbo.TRAV_EXP_RfCheckInAddValidationJavascript](sql/940582439.sql); source-definition SHA-256 `6abcaad37eb3747411030d04c6ac2122aa32cea4a168387fb60c6380453e4e0d`, reading-copy SHA-256 `dea13aef19c3fabc88b32ae012752e975ae6bdad03f71f35154ae7795b427592`, one-based inclusive lines [[1, 71]].

`ops-sql-1016703020`: [dbo.GetXMLAttributeValueByAttributeName](sql/1016703020.sql); source-definition SHA-256 `8e0cf55b396eac4dcfb3b832443980df2c61ad6e64709d2304616275dbd22f74`, reading-copy SHA-256 `fe1d403bbfc2472281d11051f05877dc0f11d304052c77afad16403231e35b77`, one-based inclusive lines [[1, 51]].

</details>

<a id="operations-inventory-staging"></a>

## Why inventory staging can be replaced before validation finishes

Inventory staging is cleared globally before the selected warehouse conversion rows are copied and checked. A validation error can therefore leave the new staging data in place. The loader later processes positive quantities with an empty processing flag, using a child inventory-adjustment routine.

### How it works

1. The loader commits each successful adjustment before marking staging and updating received timestamps.
2. Some grouped validation subqueries can fail when more than one offending group exists.
3. The received-date update omits the inventory attribute identifier and may stamp several matching records.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1228687575`: [dbo.POPULATE_INVENTORY_STAGING](sql/1228687575.sql); source-definition SHA-256 `5110b933a7a54008f1430603ab1e507b9728867fc36c91bc680cb467470f2b63`, reading-copy SHA-256 `8e29b5c94117c1edc1423703830dead301349a3c1ccdf12d5f3971f26a39accf`, one-based inclusive lines [[1, 649]].

`ops-sql-1244687632`: [dbo.LOAD_INVENTORY](sql/1244687632.sql); source-definition SHA-256 `ad9db4eb978a95dd46ce7146c90c60c243e03ae60d59a89810ecb4c7aeb64536`, reading-copy SHA-256 `75e3020977fa44aafecec61bb55923bfe7672143617a50fb579cce8e1e71f452`, one-based inclusive lines [[1, 207]].

</details>

<a id="operations-assignment-capacity-loads"></a>

## Why a warehouse argument does not always limit a conversion load

The assignment and capacity conversion routines use warehouse scope inconsistently. Their cleanup and staging clears can affect every warehouse. Capacity loader v2 ignores the warehouse argument for insertion and marks every staging row after its bulk operation.

### How it works

1. Assignment load inserts the assignment first, commits, then creates or marks permanent inventory and updates staging.
2. Capacity population copies all conversion rows after a global staging clear.
3. Capacity loader reads @@ERROR only after a separate SET statement, so its error check is not a reliable capture of the insert error.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-401540614`: [dbo.POPULATE_Staging_ILA](sql/401540614.sql); source-definition SHA-256 `cf7473b219a9a794d313749bbc5556deaec9408d8f9f862ba6a6986e6cfd88e3`, reading-copy SHA-256 `f3068dbea6f9fb3abf4e5c22dc41707608fe462a549299af86b3a8d796e01123`, one-based inclusive lines [[1, 325]].

`ops-sql-417540671`: [dbo.LOAD_ILA](sql/417540671.sql); source-definition SHA-256 `e4db894036775462d983e8c175f4bee5ea6d5f3142dabcd9759b5fbc21945860`, reading-copy SHA-256 `84d05735cbbcdd61bc86be285bad6bbed669d526bdafa588e46bc8888cae8877`, one-based inclusive lines [[1, 219]].

`ops-sql-1116687176`: [dbo.POPULATE_STAGING_ILC](sql/1116687176.sql); source-definition SHA-256 `45d8207f0053503a86a85d8d78b9e396e2c43d76b54a7af7d93d48810bac75c7`, reading-copy SHA-256 `cd35ac1c798ffd0c4fc8aac2aed7d0a2abf40a343801fb927732998f7c61fed7`, one-based inclusive lines [[1, 293]].

`ops-sql-1132687233`: [dbo.LOAD_ILC_v2](sql/1132687233.sql); source-definition SHA-256 `ded7b2bc1103606f8f5a96b4883e621f2ad1c4b2c40cb5b1cd4927c636ace5fb`, reading-copy SHA-256 `6f861eb40d4df89f72bc7dd2b0283f28513efc9eb06316635fd3d60f66203e8b`, one-based inclusive lines [[1, 77]].

</details>

<a id="operations-configuration-loads"></a>

## What generic configuration staging changes

Generic configuration population normalizes raw rows and validates a requested record type, then clears the whole staging table before copying that type. The loader inserts selected staged rows one at a time. The separate configuration-summary helper counts selected existing configuration; it does not load those rows.

### How it works

1. Raw normalization is broader than the requested record type.
2. Loader success commits the configuration insert before marking its staging row processed.
3. Existing configuration conflicts are checked during population; the loader itself does not perform an upsert.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1161315447`: [dbo.POPULATE_Generic_Config_Dtl](sql/1161315447.sql); source-definition SHA-256 `055de6a55870ac9bfa7bbdd167f8985c3cad475502046fd52bdc79b805fbb103`, reading-copy SHA-256 `6c722bd216bb7321a1ff4cd0336b0dae1a34ea8c9220260dc6649dc65b5f6b35`, one-based inclusive lines [[1, 304]].

`ops-sql-1145315390`: [dbo.Load_Generic_Config_Dtl](sql/1145315390.sql); source-definition SHA-256 `773f9858112a045190d4a8b260fb6c2083ed4eada7b19c0d3ab57a10e9cde652`, reading-copy SHA-256 `3d513388cb15ba60fa09118ae1715eb5288d6728662d94984ab59ef0dbb98d73`, one-based inclusive lines [[1, 135]].

`ops-sql-181224046`: [dbo.LoadAdditionalConfigsSummary](sql/181224046.sql); source-definition SHA-256 `7a4677693db618182ff148632027de75556094412774dc0f0332b4bf55d3beed`, reading-copy SHA-256 `13480cd8e5d714719971dba937f66737472a080a72c5f2912f1b4dc68e6c2bd3`, one-based inclusive lines [[1, 1348]].

</details>

<a id="operations-accessorial-selection"></a>

## Why accessorial choices or values are missing

Accessorial choices depend on the shipment carrier and service matching rating configuration. Container branches apply extra per-container and contents rules. A missing required join can return no choices; an existing override value may fall back to the detail default when it is NULL.

### How it works

1. Detail lookup only runs for a positive header identifier.
2. Override lookups are scalar and can fail if multiple matching assignments exist.
3. These helpers list configuration and stored values; they do not rate or charge the shipment.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-808702279`: [dbo.GetAccessorialDetails](sql/808702279.sql); source-definition SHA-256 `65aa9c135e8661c0da19133dd663644acb9bb590dba2f92f2ef8ea3f718ac1dc`, reading-copy SHA-256 `dc850eb19ad91cd4c1b122f3dda2ad3bdce9a39af3e45d6d414232e84a528544`, one-based inclusive lines [[1, 99]].

`ops-sql-856702450`: [dbo.GetAvailableAccessorials](sql/856702450.sql); source-definition SHA-256 `2f35ca16feb3c60315f027b6ee8049898a2e1345a757a23a15b00249c10a5cc6`, reading-copy SHA-256 `7e9ce4d358f9be7e05aa7d7c66a3f7adf516be071edf62a47bf98adb3870e727`, one-based inclusive lines [[1, 66]].

</details>

<a id="operations-putaway-group"></a>

## How a parent logistics unit is assigned

The parent-logistics helper identifies group inventory in a requested location class and updates it only when the candidate class is not spread over multiple locations. Its joins and the separate consolidation lookup have scope limits that can affect which record is chosen.

### How it works

1. The parent-logistics LOCATION join uses location text without warehouse equality; company is not matched.
2. The consolidation helper selects one container ID candidate before its final warehouse filter, without trying another candidate when that filter fails.
3. The receipt attribute lookup returns attribute rows linked by receipt-container IDs; it does not create attributes.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1445228549`: [dbo.PG_UpdateParentLogisticsUnit](sql/1445228549.sql); source-definition SHA-256 `d652f8d4d1416b837f8928b43bb8eec931ea42dd4e723bc35c7b11d6bd8f2983`, reading-copy SHA-256 `6918b29c237d3c476e731337bceec76701ce39dbf5ace615ed655da654043cb2`, one-based inclusive lines [[1, 53]].

`ops-sql-648701709`: [dbo.FetchLPDetails](sql/648701709.sql); source-definition SHA-256 `e428c1fcdfcd4d86ff1e81d6e522277cc575805945d571e257d4cfd758e99a59`, reading-copy SHA-256 `7819e69be7f6a98b53e93ee377c7599da24b227fc63757ccafdb0a3197f7ea03`, one-based inclusive lines [[1, 19]].

`ops-sql-872702507`: [dbo.GetConsolidateAfterPutaway](sql/872702507.sql); source-definition SHA-256 `f4eb69ab9eb9958204cd10cc662502cf638bc198fedd6ab138a9c42488ac9985`, reading-copy SHA-256 `1fee11a3e7d426bfaaf6f49c870fa2eb9d9b1cf1c8b8e5ad0e793e1ba75bd4d6`, one-based inclusive lines [[1, 60]].

`ops-sql-1137751456`: [dbo.Rtv_LocationInventoryAttributes](sql/1137751456.sql); source-definition SHA-256 `9198e6c0e903f20865b68dd7bb7b8d8700a8654d70e445358a11b38e682102db`, reading-copy SHA-256 `167832b96af4331ec96422d1746e7bbda505db6e277e1d0d5d2b32e21b305dc3`, one-based inclusive lines [[1, 15]].

</details>

<a id="operations-server-paths"></a>

## What rewriting server paths affects

The path setter rewrites a fixed set of configuration keys and the PDF directory of every warehouse. It chooses separators using fixed HTTPS patterns. It does not check whether a directory exists or whether the application can use it.

### How it works

1. The warehouse PDF-directory UPDATE has no WHERE clause.
2. NULL input takes the alternate branch and can write NULL through concatenation.
3. The path reader returns UNION ALL rows without deduplicating them or checking path access.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-46271570`: [dbo.TOOLBOX_GetServerPathValues](sql/46271570.sql); source-definition SHA-256 `61694df5f2de430532b2beb6eeefbf8fa24cbd2dde39fec8ea1a547db3d7d802`, reading-copy SHA-256 `4296cd42f3326b5b1820b0c1865738945c147b1c045e0ff91c82cf8f1453b67d`, one-based inclusive lines [[1, 50]].

`ops-sql-62271627`: [dbo.TOOLBOX_SetServerPathValues](sql/62271627.sql); source-definition SHA-256 `519e167fe5da4d051ff06aaa903a3c6b5df68ee7b52ab5abfdecfc29bc775d50`, reading-copy SHA-256 `ca73a2fd682025fb652f269f1b58578cce20b35549daa1be3119f2e5e4a203f9`, one-based inclusive lines [[1, 157]].

</details>

<a id="operations-maintenance-controls"></a>

## Why maintenance dummy mode is not a preview

Maintenance procedures execute queued commands. Dummy mode broadens selection; it is not a dry run. Other helpers can reseed a shipping-load identity or alter columns and overwrite values.

### How it works

1. Even an invalid maintenance operation can reach persistent log-table creation.
2. The two Azure maintenance variants use different index options and statistics sampling commands.
3. The column helper in check-constraint mode can run an unfiltered UPDATE setting the column to the supplied default.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-956178802`: [dbo.AzureSQLMaintenance](sql/956178802.sql); source-definition SHA-256 `6ca30420775ab5d138dbdcbc31e33c7fb25823c657af7d8bab3f7867e06957c2`, reading-copy SHA-256 `3193f62b3a13faa55eaf64f004a88d4cbb81cf1e93048af35a1780bcd75c9055`, one-based inclusive lines [[1, 246]].

`ops-sql-2122646805`: [dbo.AzureSQLMaintenance_1](sql/2122646805.sql); source-definition SHA-256 `34abe0f45532c7643bcd4ab5dee09e1a72876d88ea30156d14c473dc0269fc4e`, reading-copy SHA-256 `9153ba3f75d37b8fbd07d4ce5258fef01b99e6af0c9699642d4471e32dfa6d56`, one-based inclusive lines [[1, 269]].

`ops-sql-366272710`: [dbo.WC_UpdateWorkStats](sql/366272710.sql); source-definition SHA-256 `30d3cbb654bd3fe8bf72be8f54b81727cc1f87c7ae060925ea16b707c47599ea`, reading-copy SHA-256 `ac5c883b3a33f26c4499601ea64589ac27c17967b3155a2ca05e8b0e4623d8b1`, one-based inclusive lines [[1, 14]].

`ops-sql-1893178090`: [dbo.TRAV_RESEED_DB](sql/1893178090.sql); source-definition SHA-256 `18b08d376374864742ce6c944abd095d9beb9f55753758e372ebf3aa8b7ae48e`, reading-copy SHA-256 `a9579c60864bef4374e7a4d070e942b3088545b57dda7cb270dcdcc15c25b8da`, one-based inclusive lines [[1, 13]].

`ops-sql-1536724527`: [dbo.dba_UpdateColumn](sql/1536724527.sql); source-definition SHA-256 `f4e98f1e8badf01dce764af764884e370e63e9f6a50dae9e8e400b4e186f71b2`, reading-copy SHA-256 `677f4bd11982363af2357c177754a9482845c1e19e23e8eaedb3e5f84aef3768`, one-based inclusive lines [[1, 117]].

</details>

<a id="operations-archive-control"></a>

## What the archive purge helpers can change

The archive helpers contain destructive database operations. The simple purge helper builds TRUNCATE commands for catalog-selected names behind fixed server/database checks. The runbook rewrites archive preferences, filter records and scheduled-job settings, and immediately runs eligible truncations and delete loops. Process-history and transaction-history type purges have no age predicate. A routine name or stored definition is not proof that a purge was executed.

### How it works

1. The simple guard combines its server and database allowlists with OR, not AND.
2. Catalog contents and fixed name patterns determine which tables the dynamic commands target.
3. Runbook delete limits apply per cursor pass, not to the whole invocation. Selected TRUNCATE operations have no row cap, and the body has no encompassing transaction or rollback handler.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-777873938`: [dbo.PURGE_ARCHIVE_TABLES](sql/777873938.sql); source-definition SHA-256 `29275b82cdbb77039cef45ab224e6f21736054631693006470af944d6f171c2b`, reading-copy SHA-256 `fb14357c701b5b5047a9c41a6fe7b6d6eac0229ff4b32470624d94a36c9c59f8`, one-based inclusive lines [[1, 32]].

`ops-sql-337540386`: [dbo.ArchivePurgeRunbook](sql/337540386.sql); source-definition SHA-256 `d11a70296e18cf71eb1d916903d2682cc081ccbed1022a51b5944a8f8a44c1c3`, reading-copy SHA-256 `0d341af9b5c2479a3e820cdbe9bc0415082f4d7b9a22edddc2fd06ef3ce90227`, one-based inclusive lines [[1, 1247]].

</details>

<a id="operations-trace-controls"></a>

## Why trace-control variants may not run as expected

Trace routines control SQL tracing and event sessions. Captured variants have compatibility differences: one uses legacy column names, and another passes two arguments to a captured child that accepts one.

### How it works

1. Event-session condition 1 drops and recreates three sessions before starting them; condition 0 stops them.
2. The SQL trace string filter is declared without a length and can truncate to one character.
3. Trace variants use fixed target locations; confirm the selected platform-specific routine and target before operational use.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1419152101`: [dbo.trace_ILS](sql/1419152101.sql); source-definition SHA-256 `dd15af1a313caaed18245235b39f42eb00ac91ad3766ee2709f455ef1dea7c08`, reading-copy SHA-256 `73f669f19381eb62be1535b59d26e623b807a303e0aa75d53a6af653ee0dcaa9`, one-based inclusive lines [[1, 391]].

`ops-sql-1765229689`: [dbo.PMN_Trace](sql/1765229689.sql); source-definition SHA-256 `64187595661f95f3143de5e5af0969862756ce9d5ca0137d2419dfd3418fe186`, reading-copy SHA-256 `6ae37a5ee4f6dcb21298138bc8ad983f2b4b98831f2469f073ca1cc57d66a5f5`, one-based inclusive lines [[1, 434]].

`ops-sql-1653229290`: [dbo.PMN_EVENT_SESSION](sql/1653229290.sql); source-definition SHA-256 `fccf22863cefb0712336b613cd98f977d244d41c9d7011ffe5ebc2b14dc34a99`, reading-copy SHA-256 `a25bb422849efdefdbae77118f8bbc07406f9a35b5005021ba97a500ed538290`, one-based inclusive lines [[1, 106]].

`ops-sql-1637229233`: [dbo.PMN_Cycle_Trace](sql/1637229233.sql); source-definition SHA-256 `17c755ff9fef57269907207628c78d1fe3d7a03f6b1608778163ac91d7656011`, reading-copy SHA-256 `a92b33dd80a3b39711c64458c72b8e5141908e967a80cbdceed671694b6a12fd`, one-based inclusive lines [[1, 14]].

`ops-sql-2117582582`: [dbo.cycle_trace](sql/2117582582.sql); source-definition SHA-256 `dc9b1fc18eb070a4cc6e72c433d8e51cd0c7e53654bbe4db3c2d050c32bb0fa7`, reading-copy SHA-256 `b79aafca2f3ec2cf47fd17c1f2caf92fa2dc783e80fe3d62e0134a75560c7374`, one-based inclusive lines [[1, 6]].

</details>

<a id="operations-movement-analysis"></a>

## Why movement totals may not equal transaction totals

Movement analysis replaces a warehouse summary using recent history, optional retained history and zero-hit inventory. Joined inventory or generic item rows can multiply history. UNION can also collapse equal aggregates from current and retained sources. Zero-hit rows use on-hand quantity, while hit rows use movement quantity.

### How it works

1. The permanent-only branch joins inventory without matching item, logistics unit or attribute ID.
2. The date window ends at tomorrow UTC midnight.
3. The delete and rebuild have no local transaction.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1381228321`: [dbo.MOVECLS_MineMovementClassAnalysisData](sql/1381228321.sql); source-definition SHA-256 `b54e222c65816d92a5c2c1a22e0dcd618aeea8c3634899b2482a456eda88912d`, reading-copy SHA-256 `ee5290d5a5a425459a72c65b45feafba7c996a17f49ca71fb756942590fef883`, one-based inclusive lines [[1, 209]].

`ops-sql-213224160`: [dbo.MCA_InsightDetailPaneData](sql/213224160.sql); source-definition SHA-256 `34399acd3cda52499beb57e3c4b58ec05cf1218465d9c76c0baab7f2f289dfe3`, reading-copy SHA-256 `3fe98d316cc66828ba6e3073097eab45d6ecf9712d1f8b52a3f2f7980d1458e4`, one-based inclusive lines [[1, 35]].

</details>

<a id="operations-shipment-monitors"></a>

## Why shipment monitor tiles do not add up

Monitor charts and tiles use different status and time predicates. Total shipments, work in progress and picking not started are separate queries, not a required partition. Some load tiles display row counts while their caution and warning checks use distinct load counts.

### How it works

1. WIP uses leading status above 300 and trailing below 700; not-started requires both statuses 300.
2. Future-load selection compares a timestamp to today at midnight, so a later time today can qualify.
3. Labor last-hour queries use UTC and have no upper time bound.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1681753394`: [dbo.SHP_MonitorCustomerCategoryChartData](sql/1681753394.sql); source-definition SHA-256 `e4449d518c28ebd2bfd6417399e2ae4cd6778f5504c77aa38ecd78cb31bb2740`, reading-copy SHA-256 `16b5a53bc0d267498b4562ba6363cc87523e885bef7f336cec9fa8b6eb764e0b`, one-based inclusive lines [[1, 63]].

`ops-sql-1697753451`: [dbo.SHP_MonitorCustomerShipToChartData](sql/1697753451.sql); source-definition SHA-256 `e197ec562c1aac74932bc92e82ad2e9593c2bd5f0197b6188c7c4e6a1038053d`, reading-copy SHA-256 `65c49c87ecea52b52b3c2e9e93d4a388f35918b714ea7067a4bd1958b92984f6`, one-based inclusive lines [[1, 69]].

`ops-sql-1713753508`: [dbo.SHP_MonitorShipmentChartData](sql/1713753508.sql); source-definition SHA-256 `92150122f413aad486f0eb1c041b9ef0b3c531bb255c38aabb82dd5fb85e362e`, reading-copy SHA-256 `75b9e118f68fd89d91a22dae8053a96f6bea7d668bca0878e2f5904ba397cf73`, one-based inclusive lines [[1, 47]].

`ops-sql-1729753565`: [dbo.SHP_MonitorShipmentIndicatorTile](sql/1729753565.sql); source-definition SHA-256 `8322edef5c3016563fed3210aee40cbcd4918c43565761946ce29c5b30a46a44`, reading-copy SHA-256 `29cdfce501dde7ce487f6c2dcb2e1d900db785cc88a4536d239f7fd93ddb05e7`, one-based inclusive lines [[1, 62]].

`ops-sql-165223989`: [dbo.LBR_MonitorWorkTypesChartData](sql/165223989.sql); source-definition SHA-256 `4cfd574857570c3d1208df1190b17571782842b434377de0acedb9eb2bedad8d`, reading-copy SHA-256 `10c492699e777fa568313c6fc9fe55e60d1802de7f66c9072f9e14c919f030b5`, one-based inclusive lines [[1, 95]].

</details>

<a id="operations-receipt-monitors"></a>

## Why receipt date charts and purchase-order drill-down disagree

Receipt date categories overlap, so their totals should not be added as separate receipts. The purchase-order drill-down assigns grouped results to variables and returns one chart row, so several purchase orders can collapse to one unordered group. Its week definitions also differ between chart/value and count queries.

### How it works

1. The date chart totals all open headers in its summary, including headers without a receipt date.
2. The PO chart uses DATEPART week/year while its count summary uses an explicit week range.
3. Receipt aging uses UTC timestamps; the quality tile does not require an open header.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-2005230544`: [dbo.RCPT_MonitorReceiptsDatesChartData](sql/2005230544.sql); source-definition SHA-256 `1ccf8c41858fa679eb81088d6a2b34dc59088a5f567ae0ea95069a0a55547713`, reading-copy SHA-256 `333ec84b9ad9fe856c18e5c680f64022da1d92e877c745d23b5b12fc4d1329c3`, one-based inclusive lines [[1, 104]].

`ops-sql-2021230601`: [dbo.RCPT_MonitorReceiptsIndicatorTiles](sql/2021230601.sql); source-definition SHA-256 `f1e41927116cc4a7ccd2ab0833787d023796dd73ae8c3307f11f5182880b62b1`, reading-copy SHA-256 `b1683476e5fcb622b75daa4e8a5a9d1a813190fc9fd716b2ad378fa3ca58e2ab`, one-based inclusive lines [[1, 60]].

`ops-sql-2037230658`: [dbo.RCPT_MonitorReceiptsPoChartData](sql/2037230658.sql); source-definition SHA-256 `4a039a36c46593890546da00c94041269d91ceeabd88cf7c216ceeca27bf8109`, reading-copy SHA-256 `1780da3242e16ed41fb13aa015b76ac7a905731d539d8af99e4e2afbc75938b1`, one-based inclusive lines [[1, 150]].

`ops-sql-2053230715`: [dbo.RCPT_MonitorReceiptsTypesChartData](sql/2053230715.sql); source-definition SHA-256 `59f2720d70f4c6340da4d680016f9d6d6e48a5dc9dfe1eca7adf67b87fc8480f`, reading-copy SHA-256 `93c690c38992a76946361b1ccd7e14a84e155095f49cafd5b4aaf8190bf00261`, one-based inclusive lines [[1, 124]].

`ops-sql-2069230772`: [dbo.RCPT_MonitorReceiptsVendorNamesChartData](sql/2069230772.sql); source-definition SHA-256 `2485d7fc0394409715df436eef96c7ffea9e3dafcf4b3ef2904ccd620f0a1ad7`, reading-copy SHA-256 `ee76d169ad6c8193014de4ee7810ea76ebb5067704fa96d5e3cd95eae1934294`, one-based inclusive lines [[1, 136]].

</details>

<a id="operations-fixed-shipping-dashboards"></a>

## Why shipping dashboards ignore supplied filters or count lines

Several shipping dashboards use fixed queries even when their signatures accept dates, columns or warehouse. Some count detail rows, others group by ERP order before counting. A fixed gadget returns 55 without reading operational data. These differences explain why similarly named totals can disagree.

### How it works

1. Finished-today chart queries include all planned dates from today onward, not only today.
2. Grid defaults use datetime zero, not the current date.
3. The per-minute helper reads a fixed external object, so its result also depends on that external source.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-436196604`: [dbo.PM_UNSHIPPED_BY_BUILDING_PRIORITY](sql/436196604.sql); source-definition SHA-256 `2bc2653d634ae4462b8054dafb50fcb8a3cbb08c445d759cc515ca112e3fac0c`, reading-copy SHA-256 `a00d98f6831485f5de5ec4a2992e725669e1bd2a58405ca54bd5648617f693bd`, one-based inclusive lines [[1, 109]].

`ops-sql-452196661`: [dbo.PM_TODAY_SHIPPING_QUANTITY](sql/452196661.sql); source-definition SHA-256 `883b3520d5d5f6ac18f163aed5653fdb663a02c9bd218bd6188a87226bf4a30b`, reading-copy SHA-256 `f17a4a93f91498550bb210609d56c462afd83abeec77ce78e1059040c526f61d`, one-based inclusive lines [[1, 36]].

`ops-sql-468196718`: [dbo.PM_TODAY_SHIPPING_COMPLETED](sql/468196718.sql); source-definition SHA-256 `a1a73798cd48ad72f0fcb7986413ba4e2294df207a4fa5ddb33b03dd6b8812fc`, reading-copy SHA-256 `51a5c5eb207299bcf5870fac0ae8b17487ccd9ab7be1b78bf81a2b1d789bf136`, one-based inclusive lines [[1, 54]].

`ops-sql-484196775`: [dbo.PM_SHIPPED_TODAY_BY_MINUTE](sql/484196775.sql); source-definition SHA-256 `a1f66bf6e9116acd0756f776693d0861a175838c299af8ac7a212db6d5306e9b`, reading-copy SHA-256 `6346be18c8f40a8acc4e92d1f5a01fbc7f3fb0956a93af96c7e000936fdfbf9b`, one-based inclusive lines [[1, 43]].

`ops-sql-596197174`: [dbo.PM_FUTURE_SHIPPING](sql/596197174.sql); source-definition SHA-256 `eb69c841a0d355831774445718464a2ff87521cf4e1713ab69c397a795abf05d`, reading-copy SHA-256 `aa1226c6803651697e6d29aa9d1499338674b7a24acda3744a49f35cfe4523a8`, one-based inclusive lines [[1, 57]].

`ops-sql-1307151702`: [dbo.TRAV_Gadget_AFZeroDay](sql/1307151702.sql); source-definition SHA-256 `9b6e67dab6177d3d3d21816267be2bc807c53022475ea2bd96db2c2448fcef7f`, reading-copy SHA-256 `cc3abbbfbada59d8177ba2e1ee91f266cf42d1f864b99124653f2d17d4c3df0d`, one-based inclusive lines [[1, 54]].

`ops-sql-1995154153`: [dbo.ShipRec_FinishedToday_STZChart](sql/1995154153.sql); source-definition SHA-256 `5c496edca1315542dbd21fcadc96e450ffd015d8c3a66ce711c13049247106cd`, reading-copy SHA-256 `2d6a299bcbf65bc7f56e1035637fde15297d83a8f6837a8390ebe396eb0e39ae`, one-based inclusive lines [[1, 40]].

`ops-sql-2011154210`: [dbo.ShipRec_FinishedToday_MCChart](sql/2011154210.sql); source-definition SHA-256 `8b4027e67cddec6f56d524194052036c004be725a8a6f1097144c81cb2cc8261`, reading-copy SHA-256 `40e1a2aa2a541eedccdcf7c7411e1de655557a19e30ffcf877c214ee33fd58b9`, one-based inclusive lines [[1, 39]].

`ops-sql-2027154267`: [dbo.ShipRec_FinishedToday_Grid2](sql/2027154267.sql); source-definition SHA-256 `02ca2fac20324c046be6fbed5d8cbc8ba721debf6b15285655b52539e82722ea`, reading-copy SHA-256 `f61108aed45aae5f8251af086293ef148073c42d66e06d3441fc9dab5d421a46`, one-based inclusive lines [[1, 67]].

`ops-sql-2043154324`: [dbo.ShipRec_FinishedToday_Grid1](sql/2043154324.sql); source-definition SHA-256 `8ce862e66ac3d1d78fa8a9ba294440a4399f1452f00f96c9efe5971c92251fae`, reading-copy SHA-256 `f2d7e981b0ed83024745e8281c245f4c7e28f0eecf0b2263b4b7b1f9a8cc7440`, one-based inclusive lines [[1, 48]].

`ops-sql-2059154381`: [dbo.ShipRec_FinishedToday_AFChart](sql/2059154381.sql); source-definition SHA-256 `3adcd7a649188d521077b3e483cbdccbe9b978a46ff510211e1abda57bf6cc6e`, reading-copy SHA-256 `17db9195495c364958c6d609aab06cd58ea3d3d55563bc1a6cd91f9d31d06c94`, one-based inclusive lines [[1, 42]].

`ops-sql-2075154438`: [dbo.ShipRec_CurrentWorkTotals](sql/2075154438.sql); source-definition SHA-256 `355c4810db8c99822435a8624cd4a84b4ac557efba8b7c40e908b9da057fccc2`, reading-copy SHA-256 `7073c5ecf0172518c59de2d15bd11f38af2b4bf32e92512b076f318290da4b93`, one-based inclusive lines [[1, 86]].

</details>

<a id="operations-generic-dashboard"></a>

## How generic dashboard metrics choose count or sum

Generic metric helpers use the caller-selected table and columns to build a query. They sum only when metadata says the selected type is exactly numeric; other types use COUNT, apart from the COUNT(*) special case. The date interval includes both endpoints. The end date is an exact timestamp: midnight includes that instant but excludes later times on the same day. The helper does not expand it to the end of a calendar day.

### How it works

1. Table and column syntax is concatenated; only data values are parameterized.
2. An omitted warehouse still excludes rows whose relevant warehouse fields are NULL.
3. Only the shipment helper adds a final grouping order.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1493228720`: [dbo.PM_RECEIPTHEADER01](sql/1493228720.sql); source-definition SHA-256 `0468d6270fb9a7ecd6c5158de57bc9d517f21c888d9bd9e23109401b5b791fa3`, reading-copy SHA-256 `e9ef5f101d553ca8fc0d24fad416ddf462d3cade1836b4deb4dfd3555478cf41`, one-based inclusive lines [[1, 119]].

`ops-sql-1509228777`: [dbo.PM_SHIPMENTHEADER01](sql/1509228777.sql); source-definition SHA-256 `39fd49a36af9221431254682119ebd88a29cbc5a6dfb406f7ce546c731cd3f6d`, reading-copy SHA-256 `423254d99f711648165f399fa3d77ce8420d5d564a18b646a097b57cc7018148`, one-based inclusive lines [[1, 120]].

`ops-sql-1589229062`: [dbo.PM_WORKINSTRUCTION01](sql/1589229062.sql); source-definition SHA-256 `e74f141db3d0be0b4d5fa0ef380d672f06d5e3bd649588fc451d8a01f5a72c32`, reading-copy SHA-256 `9ac5ebefb930f5c0c1c24db87855d0445af8fa3216d34b207088ee3f3dab68f7`, one-based inclusive lines [[1, 142]].

</details>

<a id="operations-wave-statistics"></a>

## Why saved wave statistics can be NULL or negative

Wave statistics use specific container predicates and previously saved values. Rejected and consolidated shipments are residual formulas, not direct counts of those states. Missing prior values can produce NULL, and the formulas do not clamp negative results.

### How it works

1. Full-container statistic counts qualifying rows, while pallet statistic counts distinct tree units.
2. Immediate-needs quantity sums status 997 across ten buckets and does not replace every NULL with zero.
3. Each helper saves through STAT_SaveStatisticsValue; it is not a read-only display query.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1626801203`: [dbo.WVST_FullContainers](sql/1626801203.sql); source-definition SHA-256 `7cdf0a6778d339721baec4599e9b2f590c3b61892c0bedb7ab8ffff0696db759`, reading-copy SHA-256 `e66f7c844c76eaecdf31a04eb04bcd58d5cb4c67a9420e66d337d923e139d955`, one-based inclusive lines [[1, 33]].

`ops-sql-1642801260`: [dbo.WVST_ImmediateNeedsQuantity](sql/1642801260.sql); source-definition SHA-256 `9a5f65fb09959287b4eafe7628d7c9bcf2bf9d67280a73e678e79405d10595b0`, reading-copy SHA-256 `850002ef17533df19399712a6032432f156d34e0a0e3ea9984c7f036adcccca9`, one-based inclusive lines [[1, 37]].

`ops-sql-1690801431`: [dbo.WVST_LooseContainers](sql/1690801431.sql); source-definition SHA-256 `af1d676c9e50a009ba5ea9b4e2c587e43a3b69b45b74f817b4f8f84334a1ef0d`, reading-copy SHA-256 `4c424b23fbb0cf1d006c657971b08465d2eb5a2d81087de7160eb7c9a3ab4b6f`, one-based inclusive lines [[1, 45]].

`ops-sql-1706801488`: [dbo.WVST_Pallets](sql/1706801488.sql); source-definition SHA-256 `86bd6d32d8ddbbe91ff7e7ab4824b0bad5fbfa51867e5aa68af19e319ce6bfcb`, reading-copy SHA-256 `e23bb7106a1fbc4bd0425a2b2274226c0fbaeff0c4bb4baec26540030dd58995`, one-based inclusive lines [[1, 33]].

`ops-sql-1738801602`: [dbo.WVST_ShipmentsConsolidated](sql/1738801602.sql); source-definition SHA-256 `1e0dc5339d122839b1d89da01e20a259c4df0c34e07621c62b7518087a549f5a`, reading-copy SHA-256 `4c428117ca496ef92fdc42fdfbc8a300ee6fd203ef967410802cd67b4b5bf9b1`, one-based inclusive lines [[1, 42]].

`ops-sql-1754801659`: [dbo.WVST_ShipmentsRejected](sql/1754801659.sql); source-definition SHA-256 `89c5f9a1352dc00a801305349938c71b9063a89a3539039561777fa5e3c9572a`, reading-copy SHA-256 `5e657e8bc1f2516722dc95e167df821e4ace2270eea541b18362739139276f41`, one-based inclusive lines [[1, 42]].

</details>

<a id="operations-custom-labels"></a>

## Why custom container labels show unexpected counts or RFID text

Custom label headers combine container data with shipment-level RFID rules and a container breakdown. Their label-count expression is based on header join rows, which work-instruction matches can multiply. The details list direct children plus an eligible self item, with separate row numbering in each branch.

### How it works

1. RFID classification can inspect all shipment details instead of only the selected container’s line.
2. The standalone RFID helper uses a scalar subquery that can fail for multiple joined detail rows.
3. The unsuffixed header adds an item-category field; its date-named variant remains a separate implementation.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1259151531`: [dbo.TRAV_LBL_ContainerContentsHeader_20160212](sql/1259151531.sql); source-definition SHA-256 `97e407982207ed6fd12021855e5cedd9c032dc0b6d0710e6f02c161f45fa064c`, reading-copy SHA-256 `5341def8fa8dbcd6f65b14a4bc3fad7a14c1acaffabf66f47bf9dad4832f0437`, one-based inclusive lines [[1, 147]].

`ops-sql-1275151588`: [dbo.TRAV_LBL_ContainerContentsHeader](sql/1275151588.sql); source-definition SHA-256 `90eaee7ee1882a194131e794d456b2a3dd9e4a64ae62974ea958e52164adea72`, reading-copy SHA-256 `000e45cb736ba5d0b3c2150a989f1527240d724b2979e1f36659b6f066a8cc63`, one-based inclusive lines [[1, 148]].

`ops-sql-1291151645`: [dbo.TRAV_LBL_ContainerContentsDetails](sql/1291151645.sql); source-definition SHA-256 `ce79ffd75052c42c8fe904c2472b9ab07f011b5e29a20cd3ab55b7efb35c1b18`, reading-copy SHA-256 `fafcc80ab9adb221f6bff15cc57d1737fe83ef2e05e2499e74ce0b89e2ef6b0c`, one-based inclusive lines [[1, 73]].

`ops-sql-1211151360`: [dbo.TRAVIS_RFID_totag](sql/1211151360.sql); source-definition SHA-256 `b7c182e7f07fd19f3aa495dd8622a0c1c297a45cef48a0ab975621e6c720cdd5`, reading-copy SHA-256 `a722d97a0abf27715a885d61d16100b47a36eab33e585d24ed90382439c13241`, one-based inclusive lines [[1, 31]].

`ops-sql-1387151987`: [dbo.TRAV_BreakLabel](sql/1387151987.sql); source-definition SHA-256 `42b2eb1b953578d9d7b042370298deadaeac84b3b87b7e46072262887c2b83e4`, reading-copy SHA-256 `87c9eb0a2a1d18df7fb8d485e9d28ea52d3f23e5e87b181236e0f9aab837e0a6`, one-based inclusive lines [[1, 19]].

</details>

<a id="operations-number-and-string-helpers"></a>

## What next-number and string helpers guarantee

The number helpers update or consume counters according to their own rules. They do not complete the business operation that later uses the number. String helpers use SQL substring and replacement behavior; a replacement token can overlap a longer numbered token.

### How it works

1. The general next-number update returns the prior counter value and changes the stored next value.
2. A missing counter key can leave the caller output unchanged.
3. The element helper uses LEN and caller position directly; empty delimiters can prevent useful progress.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-55319607`: [dbo.NNR_RtrvNextLaunchNum](sql/55319607.sql); source-definition SHA-256 `f67b476a4ff0ac7115a7b88e444448948ab8073cdb53f595e9e366b4c7281878`, reading-copy SHA-256 `7525a202005281627ef34a11b406b8a83145d14e83603054a9334d8aab0b732a`, one-based inclusive lines [[1, 45]].

`ops-sql-1397228378`: [dbo.NNR_GETNEXTGROUPNUMBER](sql/1397228378.sql); source-definition SHA-256 `b78747237bb0ee39b91774f7603ff9a38b599c294a0a3aea1e197547b0f7646d`, reading-copy SHA-256 `c92cee612b3dac83314bf7948a5e59cdaef9db6ff06e38521d6312279f89e4da`, one-based inclusive lines [[1, 25]].

`ops-sql-1413228435`: [dbo.NNR_GetNextNumber](sql/1413228435.sql); source-definition SHA-256 `e2d3e039e59370f1f5f7836a50f920014fba88b6e004f4b31e0f1ca8a04d9d2e`, reading-copy SHA-256 `1acbc159a11ce0f18bf5ac04ef69a7af85b4d969ea1ab58f4bf9927132cb894f`, one-based inclusive lines [[1, 31]].

`ops-sql-1429228492`: [dbo.NNR_GetNextNumberWithResult](sql/1429228492.sql); source-definition SHA-256 `19edd9be12930cbd5a9d837913481ed6ac8e0fced2057a7272e6656d63f6a02c`, reading-copy SHA-256 `7ee825faf24c65121910424d981dfeedc32e5bd7b196a4c6c4c26bd3a521ec67`, one-based inclusive lines [[1, 28]].

`ops-sql-135319892`: [dbo.SH_FillStringWithVarData](sql/135319892.sql); source-definition SHA-256 `5ab7ce3bc817e3f164fe00cd93cad23fc98ebf4118cfb15b9d807d64851995d5`, reading-copy SHA-256 `7365c94a42e32ad34d08d99b8d112f7a5744b4dc3fca4338e496ff7cf9b3b4bc`, one-based inclusive lines [[1, 32]].

`ops-sql-151319949`: [dbo.SH_GetNextElement](sql/151319949.sql); source-definition SHA-256 `fb3930556e27ead482e9451e8561792296ce9d4dbda9970036acbeff52c55d69`, reading-copy SHA-256 `b4814196b95dc7a4c1e51ffe6b155e32f12fec5264e9967565b2c45dd506edd1`, one-based inclusive lines [[1, 31]].

</details>

<a id="operations-miscellaneous-side-effects"></a>

## Why helper names do not prove a read-only operation

The exact body determines what a helper does. TRAV_EXEC_PROC creates a fixed metadata view, empty-load cleanup deletes load headers, and return-date update changes shipment dates through a cross-database workday function. Other helpers only select preview metadata, security context or recent history.

### How it works

1. The return-date update joins back by shipment ID without warehouse or company scope.
2. The unit-reference helper concatenates identifiers and values into SQL; its list loop lacks an increment and can repeat indefinitely.
3. Preview selection returns document metadata without printing it.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1788793680`: [dbo.TRAV_EXEC_PROC](sql/1788793680.sql); source-definition SHA-256 `22679dc1bed3fcfd2524b0d1dd71d7de2b3a6be511f25e29fc4684adc79cfdfc`, reading-copy SHA-256 `645b67a0b5bb731e4423259c170311bf42ffada1d26047665f4366869f6f7457`, one-based inclusive lines [[1, 69]].

`ops-sql-1371151930`: [dbo.TRAV_delete_empty_loads](sql/1371151930.sql); source-definition SHA-256 `88a9631c14e63de39b85d1aeae74d764b9b7b46c6036c9a632092dfc11de3e6a`, reading-copy SHA-256 `502858f7ba21cdc092d2c25c685338568ea41241a6b2cbc68af7c478f2aa4ebf`, one-based inclusive lines [[1, 18]].

`ops-sql-1243151474`: [dbo.TRAV_SetShipByAndDeliverByForReturns](sql/1243151474.sql); source-definition SHA-256 `6d4b771b199f60b23fef165b35cd8f1dd7e84b25a81787d434cc2270a7ff592b`, reading-copy SHA-256 `83dc0b45a6b4f5dcc8bf5c21cdd0961b29b1186b7302c49e4965664e34df9924`, one-based inclusive lines [[1, 38]].

`ops-sql-2099048`: [dbo.AddViewerActionRules](sql/2099048.sql); source-definition SHA-256 `e31eac14640778da9939ce890bfbd5aceaf287d4c9014bc1963fe13762a635e9`, reading-copy SHA-256 `b629ba6a7624c5a8f3bf58e23c209fe7ab1c6bd2acfea89e49a7c5f2d765c8cb`, one-based inclusive lines [[1, 35]].

`ops-sql-336720252`: [dbo.DeleteDefaultViewerSettings](sql/336720252.sql); source-definition SHA-256 `a4c7cc8f0e9424466d395673509eec33dc88fb7623df5a61a4339d66740c35ba`, reading-copy SHA-256 `d86df2737245848d15f252e136b0d182cf387dec02aa80b3ba9688be1d820022`, one-based inclusive lines [[1, 23]].

`ops-sql-888702564`: [dbo.GetGenericImageData](sql/888702564.sql); source-definition SHA-256 `8cdc91ff62e19b2c29117f43960a73af7084e9022b47c41dd3885a2e76a4bcc1`, reading-copy SHA-256 `217c8a38bf36c6031b1fe80c2a4c1b4d0ac601be1f8cc7818b7f46957f48a4b8`, one-based inclusive lines [[1, 35]].

`ops-sql-952702792`: [dbo.GetPreviewDocument](sql/952702792.sql); source-definition SHA-256 `4b577d64abccfe405d36231a597f3445b97ab4b054fce2d8bc468729851baba7`, reading-copy SHA-256 `c5dcd8ce646131dc930deeaf49cc4ba5d661d069677d1a6aee7b35f9b613e23e`, one-based inclusive lines [[1, 33]].

`ops-sql-1969754420`: [dbo.SpGetBuildVersion](sql/1969754420.sql); source-definition SHA-256 `7c7bb1f8359528dd3e0145bb8bffac4aa7189abdbd507138349dcdc80633aacc`, reading-copy SHA-256 `e171866fbcb287e111e568811916186e5c9af0997144b01cd72a051698279275`, one-based inclusive lines [[1, 15]].

`ops-sql-792702222`: [dbo.GET_SHIPMENT_SECURITY_INFO](sql/792702222.sql); source-definition SHA-256 `0ff46d29d1dc9c85c9b676d6c83c63688736796c889f1fafde904fa7c906ed42`, reading-copy SHA-256 `15523f995232c5307eb61210abb7fcec7650b05f3bf3fc61b6bf544141baa2ff`, one-based inclusive lines [[1, 59]].

`ops-sql-1800705813`: [dbo.ITM_DoesUmReferenceExist](sql/1800705813.sql); source-definition SHA-256 `1f9b6411439c03821be1c5ddddb411d9296bce58b7847510d5810a6f2e0aa265`, reading-copy SHA-256 `4b47295a3c695d74a010537e4711f5e678915ff85820a37c51c78b95687dd49d`, one-based inclusive lines [[1, 108]].

`ops-sql-1227151417`: [dbo.TRAV_Wave_Allocation_Failure](sql/1227151417.sql); source-definition SHA-256 `f54c9f28750deaed5d86cd5fdd44337dfbcd14c7019d561289056c0f2113dccf`, reading-copy SHA-256 `497b72c177857ccb53438b1fdee33cc420206e67e0bd1f5292410089c28a92c1`, one-based inclusive lines [[1, 67]].

`ops-sql-30271513`: [dbo.ThrowError](sql/30271513.sql); source-definition SHA-256 `55e62ee99e224883992ff561168ae0c664740a0415ebf3e9070b2d0b8cf58856`, reading-copy SHA-256 `d0f385b740e68e217096882369d75ecbc13aa012799a519ff6749446f3f53366`, one-based inclusive lines [[1, 6]].

</details>

<a id="operations-insert-script-text"></a>

## What the INSERT script generator actually returns

The INSERT script generator reads matching tables dynamically and returns SQL text. It does not execute the returned INSERT or IDENTITY_INSERT commands.

### How it works

1. A NULL table-name mask selects broadly; generated table reads have no row filter.
2. Legacy type rules and bounded string buffers can truncate or misrepresent wide names, values and rows.
3. The returned text is not a verified backup, migration or successful restore.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-1953754363`: [dbo.sp_generate_insert_script](sql/1953754363.sql); source-definition SHA-256 `70717108c7e2ac3419d717ab9e34d7bc497116e59fdc147ebdecfcfaf4422249`, reading-copy SHA-256 `8b297ae6ac0bc7e7b222226b1805378cc090562366a0c9ed18264b3fb89d4adb`, one-based inclusive lines [[1, 223]].

</details>

<a id="operations-configuration-summary"></a>

## Why a configuration summary can omit a selected group

The summary builds selected count queries from a JSON selection. It reads configuration and only writes local temporary state. An empty selection can produce no result set; that differs from a count query returning zero.

### How it works

1. The reviewed dynamic templates read 73 fixed source tables through 78 SELECT templates; an invocation need not select them all.
2. System configuration has an extra detail-side exclusion, so its LEFT JOIN does not guarantee an empty header appears with zero.
3. Counts differ by branch: some count rows, some non-NULL detail fields, and the carrier-reference branch counts distinct rating identifiers. There is no final result ordering.

<details>
<summary>Technical reference and sources</summary>

`ops-sql-181224046`: [dbo.LoadAdditionalConfigsSummary](sql/181224046.sql); source-definition SHA-256 `7a4677693db618182ff148632027de75556094412774dc0f0332b4bf55d3beed`, reading-copy SHA-256 `13480cd8e5d714719971dba937f66737472a080a72c5f2912f1b4dc68e6c2bd3`, one-based inclusive lines [[1, 1348]].

</details>

<a id="work-completion-checks"></a>

## Work unit remains open: confirmation and holds

A completed pick does not necessarily finish its work unit. Other picks, putaway, an unpicked remainder or a release hold may still be outstanding.

### How it works

1. In Work Insight, inspect the header condition, hold, assigned user/team and each open or in-process detail.
2. Header confirmation executes every open and in-process detail beneath it. Header or multiple-row confirmation supports full picks; partial, short or over picks and serial entry require a single detail.
3. A mobile partial pick normally leaves the remaining quantity open. Close After Partial Pick can close the remainder only for supported replenishment or work-order picks.
4. Skip moves past an instruction; Pass stops processing the work unit. Neither completes outstanding quantity. Putaway may still need confirmation.
5. Remove Hold cannot clear a wave-not-released, cycle-count-plan-not-released or work-order-not-released hold. Resolve the corresponding release condition.

### Related articles

- [Work Insight and Warehouse Mobile: choosing the screen](#work-insight-and-mobile)
- [Configuring a work profile and its sequence rules](#work-profile-configuration)

<details>
<summary>Technical reference and sources</summary>

`operator-work-insight`: [Using the Work Insight Screen](../AIM/reading/bc959a12270971649a68dcdb9ae1ed10ccdae19f400bb17d963723993fb0761a.md); AIM article `bc959a12270971649a68dcdb9ae1ed10ccdae19f400bb17d963723993fb0761a`, original SHA-256 `7b2d787921f8461f5e3ddac94209dee77ec801dbd75afafc457f0221d6af5503`, nodes n58, n244, n249, n252, n255, n256, n291, n299, n303, n307, n316, n317, n321, n324, n327, n330, n333, n336, n344, n348, n353, n363, n367, n371, n372, n373, n374, n378, n387.

`operator-work-mobile`: [Warehouse Mobile Work Execution](../AIM/reading/c0b8a4482e4b858f753b52028b7a8e806ba5240c1d5303379719af3082ece1a0.md); AIM article `c0b8a4482e4b858f753b52028b7a8e806ba5240c1d5303379719af3082ece1a0`, original SHA-256 `30c399f928385a34bb09dda88b73256c5516efb08501b8060ebf15dbd1b72c9c`, nodes n58, n110, n113, n126, n148, n155, n162, n173, n181, n186, n214, n215, n216, n225, n233, n241, n248, n260, n262, n263, n266, n267, n273, n275, n277, n279, n281, n287, n294, n295, n296, n396, n401, n407, n414, n416, n493, n495, n497, n507, n588, n611, n612, n616, n617, n619, n620, n622, n623, n624, n625, n670, n675, n677, n678, n679, n680, n681, n698, n714, n722, n723, n724, n725, n726, n734, n735, n736.

</details>

<a id="work-insight-and-mobile"></a>

## Work Insight and Warehouse Mobile: choosing the screen

Work Insight manages instructions across a work unit. Warehouse Mobile guides an operator through picking and putaway, including scans and confirmations.

### How it works

1. In Work Insight, use filters and the detail pane to find work. Management actions include user/team assignment, priorities, holds, unassignment, overrides and paperwork.
2. Edit requires Change access. User/team assignments apply to headers, and header priority changes affect details. Unassign requires inactive header work and clears both user and team.
3. Warehouse Mobile starts from an authorized profile and work unit. Work Special Handling determines location, item, quantity, license-plate and lot verification.
4. Mobile offers Skip, Pass, short or partial picks and permitted overrides. Work Insight supports full-pick confirmation at header or multiple-row level; exceptional quantities and serial prompts use one detail.

### Settings and prerequisites

- Security checkpoints determine which actions are available. A control documented for one screen may not exist on the other.


### Related articles

- [Configuring a work profile and its sequence rules](#work-profile-configuration)
- [Pick fails or requests a reason: verification and short picks](#pick-verification-and-errors)

<details>
<summary>Technical reference and sources</summary>

`operator-work-insight`: [Using the Work Insight Screen](../AIM/reading/bc959a12270971649a68dcdb9ae1ed10ccdae19f400bb17d963723993fb0761a.md); AIM article `bc959a12270971649a68dcdb9ae1ed10ccdae19f400bb17d963723993fb0761a`, original SHA-256 `7b2d787921f8461f5e3ddac94209dee77ec801dbd75afafc457f0221d6af5503`, nodes n58, n244, n249, n252, n255, n256, n291, n299, n303, n307, n316, n317, n321, n324, n327, n330, n333, n336, n344, n348, n353, n363, n367, n371, n372, n373, n374, n378, n387.

`operator-work-mobile`: [Warehouse Mobile Work Execution](../AIM/reading/c0b8a4482e4b858f753b52028b7a8e806ba5240c1d5303379719af3082ece1a0.md); AIM article `c0b8a4482e4b858f753b52028b7a8e806ba5240c1d5303379719af3082ece1a0`, original SHA-256 `30c399f928385a34bb09dda88b73256c5516efb08501b8060ebf15dbd1b72c9c`, nodes n58, n110, n113, n126, n148, n155, n162, n173, n181, n186, n214, n215, n216, n225, n233, n241, n248, n260, n262, n263, n266, n267, n273, n275, n277, n279, n281, n287, n294, n295, n296, n396, n401, n407, n414, n416, n493, n495, n497, n507, n588, n611, n612, n616, n617, n619, n620, n622, n623, n624, n625, n670, n675, n677, n678, n679, n680, n681, n698, n714, n722, n723, n724, n725, n726, n734, n735, n736.

</details>

<a id="work-profile-configuration"></a>

## Configuring a work profile and its sequence rules

A work profile defines who can execute work and the sequence rules used to select and complete it. Each user can be associated with one work profile at a time.

### How to configure

1. On the work-profile header, set Authorized Users, Warehouse Access, Work Team/Equipment Type and Work Zone. Select Apply, then New to open a detail record.
2. Enter a unique Sequence Number and select Work Types. Details run in numeric order; selecting no types means all types. SCALE moves to the next sequence after available work for the current types is complete.
3. On Work Processing, set Work Initiation Method to User Initiated, Cart Picking or System Initiated. For system-directed work, choose From Assign Method: Priority/Location/FIFO, Location/Priority/FIFO or FIFO. Set To Assign Method to LIFO or Location for putaway.
4. Set Container Picking Method to Pick Into Shipping Container, Pick Into Tote or None. Choose the required putaway options. Automatic Putaway excludes Consolidation After Putaway and is unsupported for dock-management work.
5. In User Profile, select the authorized default work profile if mobile should bypass profile selection. Configure field verification separately in Work Special Handling.

### Settings and prerequisites

- Assign Multiple Work Units requires system-directed work and the receiving-dock location option Allow work unit selection on system-directed work.


### Related articles

- [Printing packing and closing documents](#packing-label-printing)
- [Understanding which work is offered](#work-selection)

<details>
<summary>Technical reference and sources</summary>

`operator-work-profile`: [Creating Work Profiles](../AIM/reading/671ff642f3216ae5a948a064d208b7b4bf66e0f9e75327a7802cd2f83a97d544.md); AIM article `671ff642f3216ae5a948a064d208b7b4bf66e0f9e75327a7802cd2f83a97d544`, original SHA-256 `77322984b236e8069442ab059c6c735ac231870c5aeaa6618b96b06eead1e20d`, nodes n58, n172, n175, n177, n180, n183, n185, n194, n196, n198, n202, n211, n218, n232, n254, n263, n270, n289.

`operator-work-mobile`: [Warehouse Mobile Work Execution](../AIM/reading/c0b8a4482e4b858f753b52028b7a8e806ba5240c1d5303379719af3082ece1a0.md); AIM article `c0b8a4482e4b858f753b52028b7a8e806ba5240c1d5303379719af3082ece1a0`, original SHA-256 `30c399f928385a34bb09dda88b73256c5516efb08501b8060ebf15dbd1b72c9c`, nodes n58, n110, n113, n126, n148, n155, n162, n173, n181, n186, n214, n215, n216, n225, n233, n241, n248, n260, n262, n263, n266, n267, n273, n275, n277, n279, n281, n287, n294, n295, n296, n396, n401, n407, n414, n416, n493, n495, n497, n507, n588, n611, n612, n616, n617, n619, n620, n622, n623, n624, n625, n670, n675, n677, n678, n679, n680, n681, n698, n714, n722, n723, n724, n725, n726, n734, n735, n736.

</details>

<a id="pick-verification-and-errors"></a>

## Pick fails or requests a reason: verification and short picks

A failed verification field and a short pick follow different paths. Identify the failing field and whether the pick was already accepted before retrying.

### How it works

1. Check the highlighted location/check digit, item, quantity, shipping container, license plate or lot field. Work Special Handling takes precedence over location-level verification.
2. Each enabled verification must pass. Submitting the last valid field processes the pick; a success message or move to putaway can indicate that submission has already succeeded.
3. Follow the short-pick reason-code flow; Work Insight requires a reason. A partial pick instead keeps the unpicked remainder open unless a supported close-after-partial option applies.
4. Ungroup batched work with different attributes before a short or partial pick. The separate Partial Pick action is unavailable without permission or when quantity verification is enabled.
5. Check the short-pick inventory policy before proceeding. Some no-count options automatically remove serial numbers; a reason code alone does not select this policy.

### Settings and prerequisites

- Work Special Handling controls verification and short-pick behavior. User permissions and inventory-control policy also apply.


### Related articles

- [Work unit remains open: confirmation and holds](#work-completion-checks)
- [Choosing a replacement license plate during picking](#replacement-license-plate)

<details>
<summary>Technical reference and sources</summary>

`operator-work-mobile`: [Warehouse Mobile Work Execution](../AIM/reading/c0b8a4482e4b858f753b52028b7a8e806ba5240c1d5303379719af3082ece1a0.md); AIM article `c0b8a4482e4b858f753b52028b7a8e806ba5240c1d5303379719af3082ece1a0`, original SHA-256 `30c399f928385a34bb09dda88b73256c5516efb08501b8060ebf15dbd1b72c9c`, nodes n58, n110, n113, n126, n148, n155, n162, n173, n181, n186, n214, n215, n216, n225, n233, n241, n248, n260, n262, n263, n266, n267, n273, n275, n277, n279, n281, n287, n294, n295, n296, n396, n401, n407, n414, n416, n493, n495, n497, n507, n588, n611, n612, n616, n617, n619, n620, n622, n623, n624, n625, n670, n675, n677, n678, n679, n680, n681, n698, n714, n722, n723, n724, n725, n726, n734, n735, n736.

`operator-work-insight`: [Using the Work Insight Screen](../AIM/reading/bc959a12270971649a68dcdb9ae1ed10ccdae19f400bb17d963723993fb0761a.md); AIM article `bc959a12270971649a68dcdb9ae1ed10ccdae19f400bb17d963723993fb0761a`, original SHA-256 `7b2d787921f8461f5e3ddac94209dee77ec801dbd75afafc457f0221d6af5503`, nodes n58, n244, n249, n252, n255, n256, n291, n299, n303, n307, n316, n317, n321, n324, n327, n330, n333, n336, n344, n348, n353, n363, n367, n371, n372, n373, n374, n378, n387.

</details>

<a id="packing-screen-guide"></a>

## Using the Packing screen

Packing records which shipment items and quantities are placed in each shipping container.

### How it works

1. Enter the identifier selected by Packing Preferences Initiation Field, such as shipment number, ERP order or invoice. SCALE displays open lines; it reports no available lines when nothing remains. Shipments on unreleased waves are ineligible.
2. Choose Existing for a container already associated with the shipment or New for another container. Manual assignment accepts an entered ID; System generates it. An existing container retains its type.
3. With Validate Item enabled, scan or enter the item/cross-reference and quantity. Otherwise select a grid row and use its quantity controls. Read header and line instructions.
4. Select Pack for the entered quantity or Pack All for all remaining item quantities. Fully packed lines leave the grid and totals update. Serial and catch-weight tracking may require additional entry.
5. Open the Error-column checkbox for a failed row and review Status Info. After complete packing, Close opens Close Container; closure still has its own checks.

### Limits

- AIM's basic Packing procedure excludes unpicked lines, while Packing Preferences permits a range starting at In Picking. The effective Status Range determines eligibility.


### Related articles

- [Configuring packing preferences for users](#packing-preference-configuration)
- [Packing station container choices: company and warehouse access](#packing-container-type-eligibility)
- [Container will not close: packing, QC, VAS and weight](#container-close-checks)

<details>
<summary>Technical reference and sources</summary>

`operator-packing-screen`: [Packing a Container](../AIM/reading/9b67b9530e31965bd804c9ba287844c4c4e58e604703f6bffbfb9b24b1d819ac.md); AIM article `9b67b9530e31965bd804c9ba287844c4c4e58e604703f6bffbfb9b24b1d819ac`, original SHA-256 `d583b87e4904b3186103603a6378e213a5be4aafb82bc936b3397b0b6bd6be57`, nodes n59, n138, n141, n144, n147, n150, n161, n164, n167, n169, n172, n175, n178, n186, n188, n193, n195, n198, n202, n206, n210, n213, n216, n224, n227, n231, n233, n236, n243, n252, n255, n258.

`operator-packing-preferences`: [Establishing Packing Preferences](../AIM/reading/b11f0ebd7cbea45a5ee74c4fce6f70b1c1851343ff369ef90ee6cabd60514a60.md); AIM article `b11f0ebd7cbea45a5ee74c4fce6f70b1c1851343ff369ef90ee6cabd60514a60`, original SHA-256 `0e2e312bae162513a7cf5930ac06edc6e2a231a9c66d499231453b25038c2e34`, nodes n58, n135, n139, n142, n145, n148, n151, n154, n157, n161, n164, n166, n170, n172, n174, n177, n181, n183, n185, n188, n190, n194, n196, n199, n208, n212, n215, n218, n229, n236, n239, n248, n253, n256, n258, n262.

</details>

<a id="packing-preference-configuration"></a>

## Configuring packing preferences for users

Packing Preferences defines shipment entry, item and quantity validation, container IDs and closing behavior for its assigned users.

### How to configure

1. Open Packing Preferences, create a named record with a description and select its Assigned Users. *Default receives users without a specific packing preference, including newly created users.
2. Set Initiation Field and Status Range for the expected identifiers and eligible lines. Select Validate Item for item/quantity entry fields; clear it for grid selection. Select Allow Over Packing only when packing more than the available shipment-line quantity is intended.
3. Set Container Assignment Method to System or Manual. Select Verify Container ID to reset the field to New after packing; clear it to retain the previous container and its type.
4. Set quantity entry using the documented behavior: Require Entry Of Quantity unchecked leaves Packed Quantity at zero for manual entry. Packing Work Type records labor; packing does not create work instructions.
5. On Close Container, choose Auto Manifest at Close, Assign Shipment To Load and the pending-VAS policy. With Allow VAS Override cleared, pending VAS blocks closing; selected, it offers an override and records its use. Set Auto Print at Close to Yes, Prompt or No.

### Settings and prerequisites

- Shipping Container Workbench Mode is independent: Modify edits lot/quantity, while Verify confirms the actual contents.
- The Quality Control tab applies to the full-screen QC Workbench, not RF Shipping Container QC.


### Limits

- Allow Container Creation During Close applies only to the remote-desktop system-menu Close Container screen.
- VAS override differs at load confirmation: selected, it allows confirmation while leaving VAS Pending and writes no override history.


### Related articles

- [Printing packing and closing documents](#packing-label-printing)
- [Packing station container choices: company and warehouse access](#packing-container-type-eligibility)
- [Container will not close: packing, QC, VAS and weight](#container-close-checks)

<details>
<summary>Technical reference and sources</summary>

`operator-packing-preferences`: [Establishing Packing Preferences](../AIM/reading/b11f0ebd7cbea45a5ee74c4fce6f70b1c1851343ff369ef90ee6cabd60514a60.md); AIM article `b11f0ebd7cbea45a5ee74c4fce6f70b1c1851343ff369ef90ee6cabd60514a60`, original SHA-256 `0e2e312bae162513a7cf5930ac06edc6e2a231a9c66d499231453b25038c2e34`, nodes n58, n135, n139, n142, n145, n148, n151, n154, n157, n161, n164, n166, n170, n172, n174, n177, n181, n183, n185, n188, n190, n194, n196, n199, n208, n212, n215, n218, n229, n236, n239, n248, n253, n256, n258, n262.

</details>

<a id="container-close-checks"></a>

## Container will not close: packing, QC, VAS and weight

A container can remain open because packing is incomplete, quality control has not passed, value-added services are pending, or its weight cannot be accepted.

### How it works

1. Identify the container and confirm that packing is complete. In Close Container, check its type, weight and applicable carrier/service.
2. Resolve pending or failed QC before closing. Being physically full does not satisfy a required inspection.
3. For pending VAS, Allow VAS Override determines whether closing is blocked or offers an override choice. Using that close override writes transaction history.
4. Weight outside tolerance can require confirmation. With desktop Use Scale Weight, a service failure appears in audit information and a client configuration failure in client event logs. RemoteApp/RDP uses wedge input instead.
5. After a successful close, the container cannot accept additional items. Manifesting, printing and load assignment follow their separate preference and integration settings.

### Limits

- At load confirmation, the VAS override can leave VAS Pending without writing history; that behavior differs from the close-container override.


### Related articles

- [Configuring packing preferences for users](#packing-preference-configuration)
- [Printing packing and closing documents](#packing-label-printing)

<details>
<summary>Technical reference and sources</summary>

`operator-close-container`: [Closing a Container](../AIM/reading/f992a81240ef21071a0c60e111f7a41770da3bcd1ad4ca55d2f3db634e255a7f.md); AIM article `f992a81240ef21071a0c60e111f7a41770da3bcd1ad4ca55d2f3db634e255a7f`, original SHA-256 `be502f76ac9fe2ec6ac77845a740c73838548bea5c04b30b17d80b3594db2913`, nodes n58, n63, n66, n69, n72, n135, n138, n143, n145, n147, n149, n155, n157, n158, n160, n163, n170, n180, n188, n195, n197, n200, n203, n205.

`operator-packing-preferences`: [Establishing Packing Preferences](../AIM/reading/b11f0ebd7cbea45a5ee74c4fce6f70b1c1851343ff369ef90ee6cabd60514a60.md); AIM article `b11f0ebd7cbea45a5ee74c4fce6f70b1c1851343ff369ef90ee6cabd60514a60`, original SHA-256 `0e2e312bae162513a7cf5930ac06edc6e2a231a9c66d499231453b25038c2e34`, nodes n58, n135, n139, n142, n145, n148, n151, n154, n157, n161, n164, n166, n170, n172, n174, n177, n181, n183, n185, n188, n190, n194, n196, n199, n208, n212, n215, n218, n229, n236, n239, n248, n253, n256, n258, n262.

`operator-packing-screen`: [Packing a Container](../AIM/reading/9b67b9530e31965bd804c9ba287844c4c4e58e604703f6bffbfb9b24b1d819ac.md); AIM article `9b67b9530e31965bd804c9ba287844c4c4e58e604703f6bffbfb9b24b1d819ac`, original SHA-256 `d583b87e4904b3186103603a6378e213a5be4aafb82bc936b3397b0b6bd6be57`, nodes n59, n138, n141, n144, n147, n150, n161, n164, n167, n169, n172, n175, n178, n186, n188, n193, n195, n198, n202, n206, n210, n213, n216, n224, n227, n231, n233, n236, n243, n252, n255, n258.

`operator-mobile-close`: [Warehouse Mobile Close Container](../AIM/reading/b33a75f313a267b2873999318c8752e9ddbe07fbd8201653f8f3aa6b757253b5.md); AIM article `b33a75f313a267b2873999318c8752e9ddbe07fbd8201653f8f3aa6b757253b5`, original SHA-256 `9993e9e6a1c1b0d3c7db41486e42317efc9499c4bcd71a7fc83ed80680a63475`, nodes n56, n57, n82, n84, n87, n88, n90, n91, n92, n93, n94, n95, n96, n97, n98, n111, n112, n113, n114, n115, n119, n120, n121, n122.

</details>

<a id="packing-label-printing"></a>

## Printing packing and closing documents

Set the print event, eligible document types and printer assignment together. A printer assignment alone does not enable automatic printing.

### How to configure

1. In Packing Preferences, set Auto Print at Close to Yes for all packing documents, Prompt for document selection, or No to suppress automatic printing. Manual printing remains available with No.
2. For final-container documents, select Close Last Container on the document type. Ordinary closing with unpacked quantities does not qualify; the desktop article describes a separate create-container-at-close exception.
3. For mobile labels, open Assign Printer from the Warehouse Mobile main menu, enter or scan the label-printer name and tap Go. An invalid name produces an error. Confirm the assignment in User Profile, Preference > Default Label; Actions > Clear removes it.
4. For work-start labels, select Print at WM Work Start on the work profile and Start WM Work on the document type. This event applies to work created from shipping containers.

### Limits

- A successful container close does not confirm printer connectivity or physical output.


### Related articles

- [Understanding document choices and printer defaults](#print-documents)
- [Configuring packing preferences for users](#packing-preference-configuration)

<details>
<summary>Technical reference and sources</summary>

`operator-close-container`: [Closing a Container](../AIM/reading/f992a81240ef21071a0c60e111f7a41770da3bcd1ad4ca55d2f3db634e255a7f.md); AIM article `f992a81240ef21071a0c60e111f7a41770da3bcd1ad4ca55d2f3db634e255a7f`, original SHA-256 `be502f76ac9fe2ec6ac77845a740c73838548bea5c04b30b17d80b3594db2913`, nodes n58, n63, n66, n69, n72, n135, n138, n143, n145, n147, n149, n155, n157, n158, n160, n163, n170, n180, n188, n195, n197, n200, n203, n205.

`operator-packing-preferences`: [Establishing Packing Preferences](../AIM/reading/b11f0ebd7cbea45a5ee74c4fce6f70b1c1851343ff369ef90ee6cabd60514a60.md); AIM article `b11f0ebd7cbea45a5ee74c4fce6f70b1c1851343ff369ef90ee6cabd60514a60`, original SHA-256 `0e2e312bae162513a7cf5930ac06edc6e2a231a9c66d499231453b25038c2e34`, nodes n58, n135, n139, n142, n145, n148, n151, n154, n157, n161, n164, n166, n170, n172, n174, n177, n181, n183, n185, n188, n190, n194, n196, n199, n208, n212, n215, n218, n229, n236, n239, n248, n253, n256, n258, n262.

`operator-printer`: [Warehouse Mobile Assign Printer](../AIM/reading/d3ded73e3c4cd4c058cf366dac2337cea31f922628ab7fb9f72351db3f110daa.md); AIM article `d3ded73e3c4cd4c058cf366dac2337cea31f922628ab7fb9f72351db3f110daa`, original SHA-256 `6d4c5deaf1244fe9dd8ea64f69538f29f9fd831b459cf94b1eac89f326d24d68`, nodes n57, n74, n75, n76, n77, n78, n79, n80, n81, n82, n89, n90, n91, n92.

`operator-work-profile`: [Creating Work Profiles](../AIM/reading/671ff642f3216ae5a948a064d208b7b4bf66e0f9e75327a7802cd2f83a97d544.md); AIM article `671ff642f3216ae5a948a064d208b7b4bf66e0f9e75327a7802cd2f83a97d544`, original SHA-256 `77322984b236e8069442ab059c6c735ac231870c5aeaa6618b96b06eead1e20d`, nodes n58, n172, n175, n177, n180, n183, n185, n194, n196, n198, n202, n211, n218, n232, n254, n263, n270, n289.

</details>

<a id="receiving-overage-configuration"></a>

## Configuring over-receiving and receipt execution

Receiving Preferences controls over-receiving, check-in execution and putaway-work creation for the employees authorized to select it.

### How to configure

1. Create or open the receiving preference. On General, select Allow Over Receiving to permit quantities above the receipt line's Original Total Quantity; leave it cleared to disallow that capability. RF over-receiving with this setting enabled produces no warning or override.
2. On Authorized Users, choose List to restrict access if needed. A new preference initially authorizes all users, and one user may be authorized for several preferences. Confirm which preference the receiving flow selects.
3. Set Execution Method to Check In, batch or immediate Check In and Locate, or a Quick Receive method. For check-in/locate, select Create Putaway Work to create and release putaway instructions. Cleared, locating places quantity On Hand at the destination before physical delivery. Quick Receive-User and Quick Receive-System create no putaway work.
4. Use Single Unit Scan only with compatible settings. It is disabled by Allow Over Receiving, manual license-plate assignment, required disposition, QC inspection, or item-dimension/unit-of-measure verification.

### Related articles

- [Receiving returns or damaged stock](#returns-damage-status)
- [Receiving prompts for lot and serial numbers](#receiving-lot-serial-prompts)

<details>
<summary>Technical reference and sources</summary>

`operator-receiving-preferences`: [Defining Receiving Preferences](../AIM/reading/94624e721fdc8b17b7fdcc4232de4870a98eedbb852d63a0230abd86008588b2.md); AIM article `94624e721fdc8b17b7fdcc4232de4870a98eedbb852d63a0230abd86008588b2`, original SHA-256 `ec5aff1b03fb4b19047dc23da46208b9ef62b09fc111e5fd53f1d97beef8bbc1`, nodes n58, n139, n143, n145, n147, n151, n153, n155, n160, n168, n192, n205, n210, n213, n216, n221, n225, n228, n231, n234, n237, n240, n243, n251.

</details>

<a id="returns-damage-status"></a>

## Receiving returns or damaged stock

Returned or damaged goods need a receiving policy for condition capture and an allocation policy that prevents unsuitable stock from shipping.

### How to configure

1. In the receiving preference, set Default Inventory Status to the intended initial condition, such as hold or damaged, for items checked in through this flow.
2. Select Disposition Code Required to collect item condition. If a reason is also required, enable Reason Code Required and define receiving reasons in Quality History Reason Codes with process Receiving.
3. Select QC Inspection Active when check-in should evaluate each item for QC eligibility. This does not replace disposition collection or allocation controls.
4. Configure allocation rules to exclude held or damaged inventory as required. SCALE does not automatically prevent allocation because an inventory status is named unavailable or hold.

### Related articles

- [Configuring over-receiving and receipt execution](#receiving-overage-configuration)
- [Returns: purpose and processing](#process-returns)

<details>
<summary>Technical reference and sources</summary>

`operator-receiving-preferences`: [Defining Receiving Preferences](../AIM/reading/94624e721fdc8b17b7fdcc4232de4870a98eedbb852d63a0230abd86008588b2.md); AIM article `94624e721fdc8b17b7fdcc4232de4870a98eedbb852d63a0230abd86008588b2`, original SHA-256 `ec5aff1b03fb4b19047dc23da46208b9ef62b09fc111e5fd53f1d97beef8bbc1`, nodes n58, n139, n143, n145, n147, n151, n153, n155, n160, n168, n192, n205, n210, n213, n216, n221, n225, n228, n231, n234, n237, n240, n243, n251.

`operator-inventory-status`: [Reviewing Inventory Statuses](../AIM/reading/ac3f13ba881f41d48d5cb58449fb1b516d4bbfbfea3b948c6c5428ab9832abdd.md); AIM article `ac3f13ba881f41d48d5cb58449fb1b516d4bbfbfea3b948c6c5428ab9832abdd`, original SHA-256 `0bd4e0f169a33304679bc48a66b6ad0322701aa171a145b366c2e8c74225fac7`, nodes n58, n87, n90.

</details>

<a id="packing-classes-and-criteria"></a>

## Keeping container contents together or separate

Packing classes define eligible container groups; packing criteria define which shipment-line values must agree for items to share a container.

### How to configure

1. Create a packing class with a name and description. Assign it to the shipment line or item as needed. An existing shipment-line value takes precedence; item setup supplies the line default when interfaced, and *Default applies when neither supplies a class.
2. On the class, select Container Group for wave container choices and Packing Criteria for the content-compatibility rules.
3. In Packing Criteria, create the named header and its details. Set each detail's Sequence and Field Name; items must match every configured shipment-line field. Select OK to save each detail.
4. Set Required for the intended full-screen Packing response: selected blocks mismatches; cleared offers a warning and confirmation. Wave container creation and RF pick/pack always require matching fields, regardless of Required.

### Related articles

- [Container Creation in the Wave: purpose and processing](#process-container-creation-in-the-wave)
- [Packing station container choices: company and warehouse access](#packing-container-type-eligibility)

<details>
<summary>Technical reference and sources</summary>

`operator-packing-classes`: [Working With Packing Classes](../AIM/reading/3ff5fb22a9c9e784bbfd20177c44b01634dd3b5559a647ce820724ff201fed31.md); AIM article `3ff5fb22a9c9e784bbfd20177c44b01634dd3b5559a647ce820724ff201fed31`, original SHA-256 `4ad39a8ac9898c6016ed142ac7cdd87fcf50a0a71019ed828fcb66673fed11fe`, nodes n58, n60, n61, n63, n65, n68, n71, n72, n109, n111, n113.

`operator-packing-criteria`: [Creating Packing Criteria Records](../AIM/reading/ecb1502a71d0ed8f2279e48af9324bf72bc24b5a2e2fde3ada94ce41214c40ae.md); AIM article `ecb1502a71d0ed8f2279e48af9324bf72bc24b5a2e2fde3ada94ce41214c40ae`, original SHA-256 `5d5920706e49ffa1d662bc3d5a3378e29805181a8c62f073fd5a7a29c015046e`, nodes n58, n100, n104, n106, n110, n114, n121.

</details>

<a id="replacement-license-plate"></a>

## Choosing a replacement license plate during picking

Override Pick can replace the selected license plate when the work type, permissions and verification rules allow it. Item identity alone does not establish eligibility.

### How it works

1. Confirm that the work is an eligible outbound allocation/container, replenishment or inventory-transfer task. License-plate replacement requires Override Pick security and the override and LP-verification options in Work Special Handling.
2. Check Allow Override To Different Quantity, Container Verify and Group Picks By Loc/LP where applicable. The mobile override flow permits defined different-quantity cases; the work-execution examples are not a universal equal-quantity rule.
3. Check location and lot override settings separately. The same-location lot examples apply to specific replenishment or full-unit shipping-container cases.
4. Complete the required pallet and nested-container scans. An accepted override updates location inventory, work instructions and related records.

### Troubleshooting

- For a rejected replacement, compare item, location, lot, quantity/unit and tracking with the exact validation error.


### Related articles

- [Pick fails or requests a reason: verification and short picks](#pick-verification-and-errors)
- [Configuring a work profile and its sequence rules](#work-profile-configuration)

<details>
<summary>Technical reference and sources</summary>

`operator-override-pick`: [Warehouse Mobile Override Pick](../AIM/reading/f586c2d66cc03deffc95bea01eb4a2ab97713125c8aabc4d2e37f152b3ddf672.md); AIM article `f586c2d66cc03deffc95bea01eb4a2ab97713125c8aabc4d2e37f152b3ddf672`, original SHA-256 `2daf50f9f30d561e009801c64ce9b84faac53646cd0d3be1d7066115039417c4`, nodes n57, n71, n75, n76, n78, n79, n82, n85, n89, n92, n94, n97, n98, n100, n104, n108, n109, n129, n131, n133, n163, n169, n170, n184, n186, n188, n192, n194, n196, n198, n200, n205, n206, n207, n213, n214, n215.

`operator-work-mobile`: [Warehouse Mobile Work Execution](../AIM/reading/c0b8a4482e4b858f753b52028b7a8e806ba5240c1d5303379719af3082ece1a0.md); AIM article `c0b8a4482e4b858f753b52028b7a8e806ba5240c1d5303379719af3082ece1a0`, original SHA-256 `30c399f928385a34bb09dda88b73256c5516efb08501b8060ebf15dbd1b72c9c`, nodes n58, n110, n113, n126, n148, n155, n162, n173, n181, n186, n214, n215, n216, n225, n233, n241, n248, n260, n262, n263, n266, n267, n273, n275, n277, n279, n281, n287, n294, n295, n296, n396, n401, n407, n414, n416, n493, n495, n497, n507, n588, n611, n612, n616, n617, n619, n620, n622, n623, n624, n625, n670, n675, n677, n678, n679, n680, n681, n698, n714, n722, n723, n724, n725, n726, n734, n735, n736.

</details>

<a id="desktop-mobile-packing"></a>

## Desktop packing and mobile picking/closing settings

Desktop Packing enters shipment lines into containers. Mobile work execution can pick directly into containers, while Mobile Close Container is a separate action.

### How it works

1. Desktop Packing uses the assigned packing preference for initiation, eligible statuses, item/quantity entry and container assignment.
2. Mobile pick/pack uses Work Profile Container Picking Method and Work Special Handling. Picking into a shipping container, picking into a tote and no RF pick/pack are distinct modes.
3. Mobile Close Container identifies a container and displays system and actual weights. The operator can accept calculated weight or enter a measured value; tolerance can require confirmation.
4. Apply screen-specific options only to their documented flow. Packing Preferences QC settings govern the full-screen QC Workbench, and create-container-during-close applies to the remote-desktop system-menu screen.

### Related articles

- [Configuring packing preferences for users](#packing-preference-configuration)
- [Configuring a work profile and its sequence rules](#work-profile-configuration)

<details>
<summary>Technical reference and sources</summary>

`operator-packing-preferences`: [Establishing Packing Preferences](../AIM/reading/b11f0ebd7cbea45a5ee74c4fce6f70b1c1851343ff369ef90ee6cabd60514a60.md); AIM article `b11f0ebd7cbea45a5ee74c4fce6f70b1c1851343ff369ef90ee6cabd60514a60`, original SHA-256 `0e2e312bae162513a7cf5930ac06edc6e2a231a9c66d499231453b25038c2e34`, nodes n58, n135, n139, n142, n145, n148, n151, n154, n157, n161, n164, n166, n170, n172, n174, n177, n181, n183, n185, n188, n190, n194, n196, n199, n208, n212, n215, n218, n229, n236, n239, n248, n253, n256, n258, n262.

`operator-work-profile`: [Creating Work Profiles](../AIM/reading/671ff642f3216ae5a948a064d208b7b4bf66e0f9e75327a7802cd2f83a97d544.md); AIM article `671ff642f3216ae5a948a064d208b7b4bf66e0f9e75327a7802cd2f83a97d544`, original SHA-256 `77322984b236e8069442ab059c6c735ac231870c5aeaa6618b96b06eead1e20d`, nodes n58, n172, n175, n177, n180, n183, n185, n194, n196, n198, n202, n211, n218, n232, n254, n263, n270, n289.

`operator-work-mobile`: [Warehouse Mobile Work Execution](../AIM/reading/c0b8a4482e4b858f753b52028b7a8e806ba5240c1d5303379719af3082ece1a0.md); AIM article `c0b8a4482e4b858f753b52028b7a8e806ba5240c1d5303379719af3082ece1a0`, original SHA-256 `30c399f928385a34bb09dda88b73256c5516efb08501b8060ebf15dbd1b72c9c`, nodes n58, n110, n113, n126, n148, n155, n162, n173, n181, n186, n214, n215, n216, n225, n233, n241, n248, n260, n262, n263, n266, n267, n273, n275, n277, n279, n281, n287, n294, n295, n296, n396, n401, n407, n414, n416, n493, n495, n497, n507, n588, n611, n612, n616, n617, n619, n620, n622, n623, n624, n625, n670, n675, n677, n678, n679, n680, n681, n698, n714, n722, n723, n724, n725, n726, n734, n735, n736.

`operator-mobile-close`: [Warehouse Mobile Close Container](../AIM/reading/b33a75f313a267b2873999318c8752e9ddbe07fbd8201653f8f3aa6b757253b5.md); AIM article `b33a75f313a267b2873999318c8752e9ddbe07fbd8201653f8f3aa6b757253b5`, original SHA-256 `9993e9e6a1c1b0d3c7db41486e42317efc9499c4bcd71a7fc83ed80680a63475`, nodes n56, n57, n82, n84, n87, n88, n90, n91, n92, n93, n94, n95, n96, n97, n98, n111, n112, n113, n114, n115, n119, n120, n121, n122.

</details>

<a id="lot-and-tracking-prompts"></a>

## Understanding lot, license-plate and serial prompts

Tracking prompts depend on the item, location and operation. Grouped work and full-unit containers can follow different verification rules.

### How it works

1. In mobile work, configured Work Special Handling verifies lots for lot-controlled quantities and license plates for LP-tracked locations before submitting the instruction.
2. For receipt putaway, parent locating can group nested containers sharing a destination without item/lot verification; child locating honors those checks. Entire Quantity has a separate quantity-verification exception.
3. Desktop Packing can request serials for outbound or inventory tracking. Mobile full-unit containers created in the wave have a documented no-serial-prompt exception.
4. In full-screen QC, Lot Verification Required changes entry fields and item/lot grouping. Keep it stable during an active inspection: disabling it can lose the association between failed quantities and their lots.

### Related articles

- [Receiving prompts for lot and serial numbers](#receiving-lot-serial-prompts)
- [Configuring a work profile and its sequence rules](#work-profile-configuration)

<details>
<summary>Technical reference and sources</summary>

`operator-work-mobile`: [Warehouse Mobile Work Execution](../AIM/reading/c0b8a4482e4b858f753b52028b7a8e806ba5240c1d5303379719af3082ece1a0.md); AIM article `c0b8a4482e4b858f753b52028b7a8e806ba5240c1d5303379719af3082ece1a0`, original SHA-256 `30c399f928385a34bb09dda88b73256c5516efb08501b8060ebf15dbd1b72c9c`, nodes n58, n110, n113, n126, n148, n155, n162, n173, n181, n186, n214, n215, n216, n225, n233, n241, n248, n260, n262, n263, n266, n267, n273, n275, n277, n279, n281, n287, n294, n295, n296, n396, n401, n407, n414, n416, n493, n495, n497, n507, n588, n611, n612, n616, n617, n619, n620, n622, n623, n624, n625, n670, n675, n677, n678, n679, n680, n681, n698, n714, n722, n723, n724, n725, n726, n734, n735, n736.

`operator-packing-screen`: [Packing a Container](../AIM/reading/9b67b9530e31965bd804c9ba287844c4c4e58e604703f6bffbfb9b24b1d819ac.md); AIM article `9b67b9530e31965bd804c9ba287844c4c4e58e604703f6bffbfb9b24b1d819ac`, original SHA-256 `d583b87e4904b3186103603a6378e213a5be4aafb82bc936b3397b0b6bd6be57`, nodes n59, n138, n141, n144, n147, n150, n161, n164, n167, n169, n172, n175, n178, n186, n188, n193, n195, n198, n202, n206, n210, n213, n216, n224, n227, n231, n233, n236, n243, n252, n255, n258.

`operator-packing-preferences`: [Establishing Packing Preferences](../AIM/reading/b11f0ebd7cbea45a5ee74c4fce6f70b1c1851343ff369ef90ee6cabd60514a60.md); AIM article `b11f0ebd7cbea45a5ee74c4fce6f70b1c1851343ff369ef90ee6cabd60514a60`, original SHA-256 `0e2e312bae162513a7cf5930ac06edc6e2a231a9c66d499231453b25038c2e34`, nodes n58, n135, n139, n142, n145, n148, n151, n154, n157, n161, n164, n166, n170, n172, n174, n177, n181, n183, n185, n188, n190, n194, n196, n199, n208, n212, n215, n218, n229, n236, n239, n248, n253, n256, n258, n262.

</details>

<a id="support-evidence-for-runtime"></a>

## Describing a runtime problem for support

A useful support report identifies the exact action, the last successful step and the message that stopped progress.

### How it works

1. For work execution, report header versus detail, work type, remaining pick/putaway, any hold and the field being verified. State whether submission showed success or advanced the screen.
2. For Packing, provide the initiation field, remaining lines, Status Info and row error. For Close Container, identify QC/VAS indications and manual versus scale weight entry.
3. For configuration, provide the setting label, screen/tab and applicable preference or profile. A count of profiles does not identify the one in use.
4. For printing, identify the expected event: work start, close or last-container close. Include the document type, assigned printer and exact error.

### Troubleshooting

- Include the expected result and whether one flow or several are affected. Omit credentials, personal data and transaction exports.


<details>
<summary>Technical reference and sources</summary>

`operator-work-insight`: [Using the Work Insight Screen](../AIM/reading/bc959a12270971649a68dcdb9ae1ed10ccdae19f400bb17d963723993fb0761a.md); AIM article `bc959a12270971649a68dcdb9ae1ed10ccdae19f400bb17d963723993fb0761a`, original SHA-256 `7b2d787921f8461f5e3ddac94209dee77ec801dbd75afafc457f0221d6af5503`, nodes n58, n244, n249, n252, n255, n256, n291, n299, n303, n307, n316, n317, n321, n324, n327, n330, n333, n336, n344, n348, n353, n363, n367, n371, n372, n373, n374, n378, n387.

`operator-work-mobile`: [Warehouse Mobile Work Execution](../AIM/reading/c0b8a4482e4b858f753b52028b7a8e806ba5240c1d5303379719af3082ece1a0.md); AIM article `c0b8a4482e4b858f753b52028b7a8e806ba5240c1d5303379719af3082ece1a0`, original SHA-256 `30c399f928385a34bb09dda88b73256c5516efb08501b8060ebf15dbd1b72c9c`, nodes n58, n110, n113, n126, n148, n155, n162, n173, n181, n186, n214, n215, n216, n225, n233, n241, n248, n260, n262, n263, n266, n267, n273, n275, n277, n279, n281, n287, n294, n295, n296, n396, n401, n407, n414, n416, n493, n495, n497, n507, n588, n611, n612, n616, n617, n619, n620, n622, n623, n624, n625, n670, n675, n677, n678, n679, n680, n681, n698, n714, n722, n723, n724, n725, n726, n734, n735, n736.

`operator-packing-screen`: [Packing a Container](../AIM/reading/9b67b9530e31965bd804c9ba287844c4c4e58e604703f6bffbfb9b24b1d819ac.md); AIM article `9b67b9530e31965bd804c9ba287844c4c4e58e604703f6bffbfb9b24b1d819ac`, original SHA-256 `d583b87e4904b3186103603a6378e213a5be4aafb82bc936b3397b0b6bd6be57`, nodes n59, n138, n141, n144, n147, n150, n161, n164, n167, n169, n172, n175, n178, n186, n188, n193, n195, n198, n202, n206, n210, n213, n216, n224, n227, n231, n233, n236, n243, n252, n255, n258.

`operator-close-container`: [Closing a Container](../AIM/reading/f992a81240ef21071a0c60e111f7a41770da3bcd1ad4ca55d2f3db634e255a7f.md); AIM article `f992a81240ef21071a0c60e111f7a41770da3bcd1ad4ca55d2f3db634e255a7f`, original SHA-256 `be502f76ac9fe2ec6ac77845a740c73838548bea5c04b30b17d80b3594db2913`, nodes n58, n63, n66, n69, n72, n135, n138, n143, n145, n147, n149, n155, n157, n158, n160, n163, n170, n180, n188, n195, n197, n200, n203, n205.

`operator-packing-preferences`: [Establishing Packing Preferences](../AIM/reading/b11f0ebd7cbea45a5ee74c4fce6f70b1c1851343ff369ef90ee6cabd60514a60.md); AIM article `b11f0ebd7cbea45a5ee74c4fce6f70b1c1851343ff369ef90ee6cabd60514a60`, original SHA-256 `0e2e312bae162513a7cf5930ac06edc6e2a231a9c66d499231453b25038c2e34`, nodes n58, n135, n139, n142, n145, n148, n151, n154, n157, n161, n164, n166, n170, n172, n174, n177, n181, n183, n185, n188, n190, n194, n196, n199, n208, n212, n215, n218, n229, n236, n239, n248, n253, n256, n258, n262.

</details>

<a id="report-label-gs1-data"></a>

## Why a GS1 label can show a fallback instead of one item or serial

The label helper checks whether the selected container can be represented by one item, lot and serial. Its search covers a limited number of nested container levels. Multiple serial rows can trigger a fallback, including the same serial present in both current and retained records. The quantity is not always a total of everything in the container.

### How it works

1. The direct item-container path sets quantity to 1 and uses the container type as its unit. The alternate cursor path groups descendants and retains the current group quantity.
2. The descendant checks cover the selected container and up to three child levels. Active and retained serial rows are combined without deduplication.
3. The header removes the first two characters of the container ID and keeps at most 18 more; it does not validate a prefix.
4. The lot-expiry lookup has no warehouse filter. Multiple matching lot rows assign the expiry variable without a defined order.
5. The cursor fallback tests @@CURSOR_ROWS < 1, which also includes negative row-count reporting. Cursor defaults and runtime count behavior determine whether that branch means no qualifying rows.

### Limits

- These procedures prepare data; a returned dataset does not establish physical printing or completed warehouse work.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-21223476`: [dbo.LBL_GS1AILabelDetail](sql/21223476.sql); source-definition SHA-256 `07394ca9b42eafba549683e29f8d851b428d38de439861e7aa0bbc23c8b451b6`, reading-copy SHA-256 `a6b13543f94328d4d61ef7f648702b1cfeb6ed7e3fd8fcb94ec8392a3b333439`, one-based inclusive lines [[1, 264]].

`rptlbl-sql-37223533`: [dbo.LBL_GS1AILabelHeader](sql/37223533.sql); source-definition SHA-256 `0eccf6c21fc799f3d89a3116883bc4204a3ed8150c854578f2156c0b68723381`, reading-copy SHA-256 `c4bce8c5862e5f570fc8b8d597b543c5276608142bd681c3baa44049dac38f45`, one-based inclusive lines [[1, 51]].

</details>

<a id="report-label-simple-labels"></a>

## Where location, break and finished-good label fields come from

These label routines read stored fields for the selected record. The location label converts on-hand quantity to a whole number and formats expiration as a date. The finished-good label reads the putaway unit; the break label joins its container to the shipment. Reading these fields does not move stock or print a label.

### How it works

1. A missing optional company keeps the location row but leaves company output blank. Integer conversion can lose fractional quantity.
2. The break label requires a matching shipment; the finished-good label reads its stored item, quantity and destination directly.

<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-53223590`: [dbo.LBL_LocationInventory](sql/53223590.sql); source-definition SHA-256 `ed7bfcd49e6ddad1c30a3a643011e8d2ac7dd6aa48a4ebfebc66489e1529f295`, reading-copy SHA-256 `e2b363338948fa1c37d0d913a6a306f7cb3d5ab43bc1ac6f897f2bda481adf91`, one-based inclusive lines [[1, 39]].

`rptlbl-sql-5223419`: [dbo.LBL_FinishedGoodPutaway](sql/5223419.sql); source-definition SHA-256 `11a37446ca6c9fe601b3497c0fa1845dfd4d7bc7d97cb5bc35d0fd6a3de828e1`, reading-copy SHA-256 `dc876b963c2157cfb1331bc56caea6b6ca17e03fbcb4b10d0baa75e7e8ceb8e1`, one-based inclusive lines [[1, 30]].

`rptlbl-sql-2104706896`: [dbo.LBL_BreakLabel](sql/2104706896.sql); source-definition SHA-256 `c5868485fcadfde5d358e3e51d9c39c1711ec74750c747cbf8297097f16faa2d`, reading-copy SHA-256 `729fc9a345bc1acd51267633e3a5d584cfa14edd2567b6bc82251786b31fb20b`, one-based inclusive lines [[1, 37]].

</details>

<a id="report-label-work-labels"></a>

## Why a work-instruction label header and details can differ

The header reads the parent work unit when the selected instruction has a parent. The detail helper either groups the children of a parent instruction or selects the chosen child. It adds quantities and chooses the smallest unit text; it does not convert quantities between units.

### How it works

1. Compare whether the selected instruction has a parent before comparing header and detail identities.
2. A displayed unit chosen by MIN does not establish that all quantities use one unit.

### Limits

- These procedures prepare data; a returned dataset does not establish physical printing or completed warehouse work.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-69223647`: [dbo.LBL_WorkInstructionDetail](sql/69223647.sql); source-definition SHA-256 `4918f492b72028daa83ff751d2faeacf19c89e1b2311d2305140e19875b97036`, reading-copy SHA-256 `3d1f4bbd5eba6b7b882710333edf3fa26c8e2798849298c21dd4e21540699b31`, one-based inclusive lines [[1, 36]].

`rptlbl-sql-85223704`: [dbo.LBL_WorkInstructionHeader](sql/85223704.sql); source-definition SHA-256 `339f946f028ebe21c108417630e0bf50bf52b9e81a26ae1ccc0c2ea117d72719`, reading-copy SHA-256 `bd279101068c78e00d7053a396b210be11136c7bcfc7134103fbde0474def198`, one-based inclusive lines [[1, 29]].

</details>

<a id="report-label-cycle-count"></a>

## Why a cycle-count report can omit a group or repeat a request

The cycle-count detail reports select requests from a plan and join matching location inventory. A positive group number narrows the results. The other branch still excludes requests whose group is NULL. Multiple matching inventory records can repeat a request; the report does not total them into one row.

### How it works

1. The inventory join includes location, warehouse, item, company, lot and logistics unit. Missing inventory is allowed by the left join.
2. The serial version adds helper-produced serial text; the header reads plan metadata separately.

### Limits

- The dataset supplies report values; printing and completion of warehouse work occur elsewhere in the application.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-17747466`: [dbo.RPT_CCListDetailsWSerns](sql/17747466.sql); source-definition SHA-256 `767b4b01dab920df30adb4146c22cbed3c3cc8d74cb2df2ff99bac14ed521c63`, reading-copy SHA-256 `0a65f5e55fd647fd488e782c62d8bbf70b709548c85cc2382830b6cf392f34b5`, one-based inclusive lines [[1, 85]].

`rptlbl-sql-145747922`: [dbo.RPT_CycleCountListDetails](sql/145747922.sql); source-definition SHA-256 `170e85d73cc8d3f84f145b1962178a73b11ab5b18206753524808366e05fcd78`, reading-copy SHA-256 `fdeaeb506940fb1d16cd40630d5fc83aa25d3181b168c5aa89fe2453e4d3cd38`, one-based inclusive lines [[1, 86]].

`rptlbl-sql-161747979`: [dbo.RPT_CycleCountListHeader](sql/161747979.sql); source-definition SHA-256 `7cfc49655628af1609141c6f11b7cfb518fe3e7759e98e72eb3fedd7ad6b2fe6`, reading-copy SHA-256 `ce46452060d5b65538d3a95b7a01177bd510a3c80f8420d4573e15e715c5155a`, one-based inclusive lines [[1, 43]].

</details>

<a id="report-label-po-receipts"></a>

## Why purchase-order receipt reports show different totals or blanks

One report shows each linked receipt line, so the purchase-order quantity repeats beside several receipts. Another groups receipt quantities under purchase-order display fields. Their missing-receipt values differ: some fields become zero while others stay NULL. Repeated purchase-order quantities should not be added as separate orders.

### How it works

1. The receipt-row version keeps individual receipt matches. The summary groups by displayed purchase-order fields rather than the detail object ID.
2. A header with no detail rows can show a line count of zero while quantity sums stay NULL.

### Limits

- These procedures prepare data; a returned dataset does not establish physical printing or completed warehouse work.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-305748492`: [dbo.RPT_POStatusDetailsAndReceipts](sql/305748492.sql); source-definition SHA-256 `f962063e0b43cebc036162b51bdf08726ca1900b82659b5df61849b30615e283`, reading-copy SHA-256 `8fd8709a76180493cf140fa3d039bcf8a33ba21f06b74dc23604d67759a5d8c9`, one-based inclusive lines [[1, 66]].

`rptlbl-sql-321748549`: [dbo.RPT_PurchaseOrderDetails](sql/321748549.sql); source-definition SHA-256 `c6acd48e92b47a555c0d5fa0cf3391b30b0671a1eea530e021673472dcac5d8d`, reading-copy SHA-256 `9e18a63bf06424ad43a40048f8d6de569e8021f5f7ad62c32e4e0b2199b76c95`, one-based inclusive lines [[1, 39]].

`rptlbl-sql-337748606`: [dbo.RPT_PurchaseOrderHeader](sql/337748606.sql); source-definition SHA-256 `1705077497aa284b2b7a32c0997ef0b3bb2532af08df5d1a2e863a0818db697f`, reading-copy SHA-256 `b9b6d9da113d80c1bdc0900dad25e3a3c3f7ee8e824ed1b266c12fd4bfffdee0`, one-based inclusive lines [[1, 41]].

`rptlbl-sql-353748663`: [dbo.RPT_PurchaseOrderStatusDetails](sql/353748663.sql); source-definition SHA-256 `f8b6c30b94759b714e72cd863e0deeb6f230da32eba731e63e012147b9fbecf9`, reading-copy SHA-256 `4c01f7b08e55ec2c5c9e28a2f72d68ab0e3fb5a7e6362fdca15ef6707c8c4d16`, one-based inclusive lines [[1, 66]].

`rptlbl-sql-369748720`: [dbo.RPT_PurchaseOrderStatusHeader](sql/369748720.sql); source-definition SHA-256 `cc4b5c79a402019713de4d5faa74720511feb3f3865c60466094e4d4b3f8d307`, reading-copy SHA-256 `777bab3f8304d685d0873800a6404e6dac20b5ed750df325a380eb3db237fb97`, one-based inclusive lines [[1, 53]].

</details>

<a id="report-label-receipt-status"></a>

## How receipt status reports choose container quantities

Receipt status totals use selected container status numbers and only containers whose type is NULL. Empty sets can produce blank totals. The detail-with-containers report can retain a detail with no container, yet exclude a detail whose existing containers all have a non-NULL type.

### How it works

1. The header sums status 200, 300, 301 and 900 into separate named quantity fields. It does not change those statuses.
2. The receiving worksheet repeats the receipt header total for each line; its DOCUMENT_TYPE parameter is unused.

### Limits

- The dataset supplies report values; printing and completion of warehouse work occur elsewhere in the application.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-417748891`: [dbo.RPT_ReceiptStatusDetails](sql/417748891.sql); source-definition SHA-256 `ab0cdb15d601f3e935ec02f36d3c5a88aa6bb7d4d3e42fbdc43e3088ebb85d94`, reading-copy SHA-256 `e395c38df15969a4e2352d233699f09d0db3d5a65332c92273818e1780e0b318`, one-based inclusive lines [[1, 40]].

`rptlbl-sql-433748948`: [dbo.RPT_ReceiptStatusDtlsAndConts](sql/433748948.sql); source-definition SHA-256 `b65850523cd24263797dad4c47c159247bf8181b742811b5fe75513fd692500d`, reading-copy SHA-256 `03342c4e9614ff5a7b142ce1ae5767a2c257e5edda54a45bd6bcdbc9ca89816c`, one-based inclusive lines [[1, 70]].

`rptlbl-sql-449749005`: [dbo.RPT_ReceiptStatusHeader](sql/449749005.sql); source-definition SHA-256 `547474e23113f8ced86d97d6e7d58bbe8880a744ce17cf8da6143d77eef691a5`, reading-copy SHA-256 `80a8fca67469fe8f7188cb43438475dfdae8928362533372146a51baece99afc`, one-based inclusive lines [[1, 101]].

`rptlbl-sql-465749062`: [dbo.RPT_ReceivingWorksheet](sql/465749062.sql); source-definition SHA-256 `ebe979086b18f6ce73db053e08b0a019400fbc600d0d77ca02b348c34037d14c`, reading-copy SHA-256 `d5b9d638acaafceef945714fe65f0f28c2f137be47b8344cfa974c3be8c8daa0`, one-based inclusive lines [[1, 56]].

</details>

<a id="report-label-receipt-putaway"></a>

## Which receipt containers appear on a putaway list

The detail report lists direct children of the selected receipt container. A child qualifies when it has a destination or matches the coded failed-status condition. The header describes the selected container itself. Neither report performs a putaway or recursively lists every descendant.

### How it works

1. Details join receipt lines and sort by destination then item. They show stored converted and base quantities separately.
2. The header requires the matching receipt header and has no detail eligibility filter.

<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-113747808`: [dbo.RPT_ContPutawayListDetails](sql/113747808.sql); source-definition SHA-256 `a6680844e4a127d4fa23424a51d10774a46c5d835ffadfeb401d16b5f27d0142`, reading-copy SHA-256 `602bbb804812704f80fb999b33f2c727f7c2b5f7211a978b7c5ae13f5c14d21b`, one-based inclusive lines [[1, 74]].

`rptlbl-sql-129747865`: [dbo.RPT_ContPutawayListHeader](sql/129747865.sql); source-definition SHA-256 `ff00979255d064c1e16abb256152797987f5c6ab94da2365f751ef8806352a78`, reading-copy SHA-256 `cbb6d46ab17598b1850c148099974623161dc98fe922d3539930c7565b9281db`, one-based inclusive lines [[1, 80]].

</details>

<a id="report-label-packing-scope"></a>

## Why packing-list versions include different containers

Packing-list variants use different container selection rules. Some use stored tree membership; the SSRS versions walk parent links from selected roots. A root may appear in one version and be excluded by another. The recursive queries do not add a shipment check to every descendant step.

### How it works

1. Compare the root selection and the descendant predicate in the exact routine. Stored tree membership and recursive parent traversal are not interchangeable.
2. The SSRS versions use UNION ALL and a limited text path for sorting; they have no custom cycle guard or MAXRECURSION override.

### Limits

- The dataset supplies report values; printing and completion of warehouse work occur elsewhere in the application.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-49747580`: [dbo.RPT_ContainerPackListDetails](sql/49747580.sql); source-definition SHA-256 `6220a1dbe702607632c9bcc63d4d74fdc7e3dab752fe0f7b81e1fbcd3a19fc9d`, reading-copy SHA-256 `3658489fe9fc69a7ea5ae3ed81c1dabcf8a2efa6f8f00c8d22b6eb8a5d2be515`, one-based inclusive lines [[1, 88]].

`rptlbl-sql-65747637`: [dbo.RPT_ContainerPackListDetailsForSSRS](sql/65747637.sql); source-definition SHA-256 `9be05930b2b4a26456acb654584e9cd31031626f249c5d2d028e811878ab9d4e`, reading-copy SHA-256 `e54bcbc7c3d5803b7d617434915e0fbeca8ecf69782bf051b27de9caada17f59`, one-based inclusive lines [[1, 127]].

`rptlbl-sql-593749518`: [dbo.RPT_ShipmentPackListDetails](sql/593749518.sql); source-definition SHA-256 `3ff547a7f75b52fe7dfa3ddf546021df106027f01fd8b8b6910646eeb62d2086`, reading-copy SHA-256 `4c5a040b3231190b45f1322029b0fe0caa1199dd8342fe212a18bb6800f071ff`, one-based inclusive lines [[1, 74]].

`rptlbl-sql-609749575`: [dbo.RPT_ShipmentPackListDetailsForSSRS](sql/609749575.sql); source-definition SHA-256 `94322ba507929a7c47f6d0391d98c7eac37dcf36060ec8acab7dd2c7452933c7`, reading-copy SHA-256 `a373be44a2622d031925ce26c6b87e3b09012c8772b9a279f1b2e60d87f23007`, one-based inclusive lines [[1, 96]].

</details>

<a id="report-label-packing-serials"></a>

## How serial text is added to a packing list

Serial packing lists call a helper that returns serial display text for each selected container. They do not directly join one report row per serial. The SSRS variant also walks parent links and rejoins the selected container, while other variants use stored tree membership. The source does not prove that a serial or container was physically shipped.

### How it works

1. The report calls RPTfn_GetShipContSernText for a container identity; the helper text is one projected value. Its internal behavior is a separate contract.
2. Shipment-detail joins and the SSRS container rejoin can affect row multiplicity. The source container quantity is not a count of serial text entries.

<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-97747751`: [dbo.RPT_ContPackListWSernsDetails](sql/97747751.sql); source-definition SHA-256 `662d1c8562272b2c36763dead7a68dd35fea72dbcf912d558b64b1954f53a9b2`, reading-copy SHA-256 `397746c63ce4ff6b4c21c73fff2f7529ca7364b22e9e05f7d04e1f2905fce497`, one-based inclusive lines [[1, 89]].

`rptlbl-sql-737750031`: [dbo.RPT_ShipPackListWSernsDetails](sql/737750031.sql); source-definition SHA-256 `a5edb3a95b56eda16e1e5816e2544bf2d152d37bdf11c696231f4f5c316064f5`, reading-copy SHA-256 `dac7b4f3b118731027269c366f33c20da0ba813cea5b6d0ac8e3ad95579f92f4`, one-based inclusive lines [[1, 74]].

`rptlbl-sql-753750088`: [dbo.RPT_ShipPackListWSernsDetailsForSSRS](sql/753750088.sql); source-definition SHA-256 `ee56691c917069254ab2d9275dbda6f47a147803dcd444c0519e63c8a4961eb4`, reading-copy SHA-256 `86d2b0ec88d3c69f86173f82b7fb45747289ea057c27aa50dc39e1e5b659356f`, one-based inclusive lines [[1, 112]].

</details>

<a id="report-label-container-contents"></a>

## Which items and purchase order appear on a container contents label

The detail helper lists direct children and can also include the selected container itself when it has an item and container ID. It does not automatically include grandchildren. The header chooses one candidate purchase order without a defined order, so that value does not prove every line has the same purchase order.

### How it works

1. Both detail branches require a matching shipment detail. The self branch has item and container-ID checks that the direct-child branch does not have.
2. Details combine with UNION ALL; a self-referential row could qualify twice. The header keeps its container when the optional purchase-order candidate is missing.

### Limits

- The dataset supplies report values; printing and completion of warehouse work occur elsewhere in the application.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-2120706953`: [dbo.LBL_ContainerContentsDetails](sql/2120706953.sql); source-definition SHA-256 `37cd794c12a3006b2146f5d7339935791c386319c9b84497175e60e1f8191683`, reading-copy SHA-256 `581ba012bab6d73a538f5f2045b95fbf603ffebefc2c16cb552d6efca512a12e`, one-based inclusive lines [[1, 76]].

`rptlbl-sql-2136707010`: [dbo.LBL_ContainerContentsHeader](sql/2136707010.sql); source-definition SHA-256 `e310066f9c284463bbc9fb3456098fa293092d3e7f17494b25af13b1a5fd1785`, reading-copy SHA-256 `41e7c36aba4d7e1e5e5bea5dff5ffeb87c326b74f653c114df36b378a7ca853f`, one-based inclusive lines [[1, 70]].

</details>

<a id="report-label-packing-components"></a>

## Where packing-list component quantities come from

Component packing data first uses an associated positive work-order number. Without that path it can use the highest BOM revision. A positive work-order number with no matching component does not automatically fall back to the BOM. The latest revision lookup does not test an active flag or effective date.

### How it works

1. Identify whether the routine is scoped to a shipment or a shipment line.
2. Tied BOM candidates or multiple matching components can create multiple output rows; quantity is computed from the selected source.

### Limits

- These procedures prepare data; a returned dataset does not establish physical printing or completed warehouse work.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-689749860`: [dbo.RPT_ShipPackListWCompsComps](sql/689749860.sql); source-definition SHA-256 `7ac5114389c716c0f90895608d0386f350021a6b2bd65ca52078ea12f9d093a6`, reading-copy SHA-256 `5f7e4f972ae1672d7021b8ceb5d668f8e440693e4d2faf3713ba1e99eb363c6f`, one-based inclusive lines [[1, 94]].

`rptlbl-sql-705749917`: [dbo.RPT_ShipPackListWCompsCompsForSSRS](sql/705749917.sql); source-definition SHA-256 `2a88d4bf1d5705ccb798a50b524145761dbb88e22d5fbaa10c80dede3a70d717`, reading-copy SHA-256 `6960b4c7eac2821c85347ff0b02251bcbee1f29a46d1bd0e5fba80ff897a3089`, one-based inclusive lines [[1, 72]].

`rptlbl-sql-721749974`: [dbo.RPT_ShipPackListWCompsDetails](sql/721749974.sql); source-definition SHA-256 `673203708c6d333c33b106e021a5d7be11f5b659807096bab27184ece1376151`, reading-copy SHA-256 `27a8a466ef5f1784a5890ab0722493bd595327bd4936223b125171e6361cd1cb`, one-based inclusive lines [[1, 77]].

</details>

<a id="report-label-header-address"></a>

## Why report ship-from addresses can remain blank

Several report headers prefer a warehouse-company address, then a company address, then the warehouse. They choose the source by whether a matching row exists. A blank field in the preferred row does not automatically fall back to the same field in the next source.

### How it works

1. Check which address row wins before investigating an individual missing phone, country or address line.
2. The SSRS packing header container count subtracts distinct non-NULL parent IDs among named containers from the named-container count; it is not a universal root count.

### Limits

- The dataset supplies report values; printing and completion of warehouse work occur elsewhere in the application.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-33747523`: [dbo.RPT_CommonShipmentHeaderInfo](sql/33747523.sql); source-definition SHA-256 `2efcafcbc2343fe27333f6e293566741f536a8d94b57929c95fb162f72b6bd98`, reading-copy SHA-256 `3f3f1311d58f2417830c5b4a3d8c4c8e15756224abf76644729feb23539edcec`, one-based inclusive lines [[1, 166]].

`rptlbl-sql-81747694`: [dbo.RPT_ContainerPackListHeader](sql/81747694.sql); source-definition SHA-256 `d1a2261ce1874ce32964706bd45a16d695b11d84ce9353bc460d3606dfe8b6bc`, reading-copy SHA-256 `47fd9b17e8c33bc2f8ecb8209d573560812e497b74dece308cb544db20bfd436`, one-based inclusive lines [[1, 145]].

`rptlbl-sql-273748378`: [dbo.RPT_OrderPickListHeader](sql/273748378.sql); source-definition SHA-256 `d9cb7c153c3973029c49db859600956249bb772c486ee7b9693ba7b328c7c7f8`, reading-copy SHA-256 `7f0f99a20bd84475438acc41406d386e51dc8ab31ca148bb95abcb7648c6ac63`, one-based inclusive lines [[1, 144]].

`rptlbl-sql-625749632`: [dbo.RPT_ShipmentPackListHeader](sql/625749632.sql); source-definition SHA-256 `1c39a57e43ab2b05f5ebbaa06b97120bc508604ce400bf5f530445a9ebe36f38`, reading-copy SHA-256 `160aae348676d053c0c1c32ac041324911daa5f6df4fe75a797b85e1e4f5eb37`, one-based inclusive lines [[1, 138]].

`rptlbl-sql-641749689`: [dbo.RPT_ShipmentPackListHeaderForSSRS](sql/641749689.sql); source-definition SHA-256 `3314184825c6eaf58a515f579ab1053282fc5ffefd508f9f4bd590769c21dcfb`, reading-copy SHA-256 `12441d3c2f43247b78e14253b3ce4e9c262641cc06ccbce3aeb39228f3dfd505`, one-based inclusive lines [[1, 250]].

`rptlbl-sql-2133231000`: [dbo.RPT_BatchPickListHeader](sql/2133231000.sql); source-definition SHA-256 `25ab525a8537f439c2900e91085052adb3b93d9666ccf25704054ea3e417f764`, reading-copy SHA-256 `13960d8c42e56ea6c182f2ae6ec1643341016a56c6f528459f2b54a924233f7c`, one-based inclusive lines [[1, 101]].

</details>

<a id="report-label-pick-quantities"></a>

## Why allocation and shipment pick-list backorders differ

The allocation pick list subtracts allocated quantity from requested quantity. The shipment pick list subtracts total quantity instead. Both clamp a nonpositive difference to zero, and both use their own quantity basis for extended weight and price. NULL values can leave the calculated result blank.

### How it works

1. Allocation rows come from shipment allocation requests and show from-location; shipment rows come from shipment detail and show pick-location.
2. These procedures read existing quantities; they do not allocate or pick inventory.

<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-2101230886`: [dbo.RPT_AllocationPickListDetails](sql/2101230886.sql); source-definition SHA-256 `d3d84aee5aa0016e1d7d6f43d178e92e3dc51b053de5ba1584f0923c542537c4`, reading-copy SHA-256 `eae1f520d098056221ae9a680d65d6004b17e52e9f57897db8b1ac362da7c800`, one-based inclusive lines [[1, 78]].

`rptlbl-sql-657749746`: [dbo.RPT_ShipmentPickListDetails](sql/657749746.sql); source-definition SHA-256 `78b287f7384c1d83cba8fb03966a65329c788925606d53e37b37b0b24ec5d935`, reading-copy SHA-256 `a2b9dfb6272733e246b51863f7693299f01e8609f987c426cf81dfd387059f5b`, one-based inclusive lines [[1, 78]].

</details>

<a id="report-label-batch-order-pick"></a>

## Why batch and order pick lists handle missing detail differently

Both detail reports select child instructions of the requested parent and use a coded instruction type. The order pick report requires a matching shipment detail. The batch pick report keeps the instruction when the shipment detail is missing, leaving its optional detail fields blank.

### How it works

1. The detail sort is sequence, source location and item. Parent header routines select the instruction identified by the parameter.
2. Report comment helpers receive DOCUMENT_TYPE; this does not itself establish a rendered document.

### Limits

- The dataset supplies report values; printing and completion of warehouse work occur elsewhere in the application.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-257748321`: [dbo.RPT_OrderPickListDetails](sql/257748321.sql); source-definition SHA-256 `8d21624aae02fff1923444cc51f1b94c30784bf813e8e265b04f811f84b98bc8`, reading-copy SHA-256 `221036e2f57351ec7dee3d58d7f0a524c56ce5385e537a14079895e5d356f0e6`, one-based inclusive lines [[1, 72]].

`rptlbl-sql-2117230943`: [dbo.RPT_BatchPickListDetails](sql/2117230943.sql); source-definition SHA-256 `2373c4a268f974deba0f5630e735831cc1af0ecef9f0e23e1da55b8eac845a58`, reading-copy SHA-256 `b88fbc0157ccff8e33b650853c0f9f20dcadb957db438d022e63008a348a1147`, one-based inclusive lines [[1, 80]].

`rptlbl-sql-273748378`: [dbo.RPT_OrderPickListHeader](sql/273748378.sql); source-definition SHA-256 `d9cb7c153c3973029c49db859600956249bb772c486ee7b9693ba7b328c7c7f8`, reading-copy SHA-256 `7f0f99a20bd84475438acc41406d386e51dc8ab31ca148bb95abcb7648c6ac63`, one-based inclusive lines [[1, 144]].

`rptlbl-sql-2133231000`: [dbo.RPT_BatchPickListHeader](sql/2133231000.sql); source-definition SHA-256 `25ab525a8537f439c2900e91085052adb3b93d9666ccf25704054ea3e417f764`, reading-copy SHA-256 `13960d8c42e56ea6c182f2ae6ec1643341016a56c6f528459f2b54a924233f7c`, one-based inclusive lines [[1, 101]].

</details>

<a id="report-label-picking-group"></a>

## How a picking-group report displays container quantities

The picking-group report joins each selected group container to its shipment line and immediate parent. The displayed container type can come from the parent. Separate coded conditions decide whether the display quantity is the stored quantity or one, and whether the display unit is a quantity unit or container type.

### How it works

1. Only the immediate parent is consulted; there is no recursive type lookup.
2. The two conditions use separately redacted literals, so their equivalence is not assumed. Rows sort by location and group position.

### Limits

- These procedures prepare data; a returned dataset does not establish physical printing or completed warehouse work.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-289748435`: [dbo.RPT_PickingGroupPickList](sql/289748435.sql); source-definition SHA-256 `ae9eaf4c3479cd330070c99511ccdc2551da1b80c00d8881ac81871272c4fd46`, reading-copy SHA-256 `0adfad9edbc3225494da707a1b8e8a6bdb32fdb38adc42e49ed93b9492f971ef`, one-based inclusive lines [[1, 83]].

</details>

<a id="report-label-replenishment"></a>

## Why replenishment report rows or headers can be missing

The request detail report filters by master, launch and a coded work-created value, then groups stored quantities by location, item, lot, units and user fields. Its header takes one matching row and can show launch -1 when launch statistics are absent. A separate work-instruction report also requires item descriptions to match.

### How it works

1. Grouping preserves differences in destination, lot, units and user fields; it does not convert units.
2. The header order does not break ties between matching warehouses. A description mismatch can exclude an instruction even when its item matches.

### Limits

- The dataset supplies report values; printing and completion of warehouse work occur elsewhere in the application.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-481749119`: [dbo.RPT_ReplenishmentWorkPickList](sql/481749119.sql); source-definition SHA-256 `cf47dd8f996105f98ab773e57562c486dea673392b178f173f8592f1a2b4625d`, reading-copy SHA-256 `1ad65ec463bbcefbb73d52583c41818c3e157ab8d73d737a2cde120c4701b259`, one-based inclusive lines [[1, 65]].

`rptlbl-sql-497749176`: [dbo.RPT_ReplenPickListDetails](sql/497749176.sql); source-definition SHA-256 `d58fa1c396d7cc23914f7774a7f2ef105ceabcdd751035dc0d4c031358419b93`, reading-copy SHA-256 `eda872cfe4f3b6933e398df8c37c605a38e09b6a8fc094e983c6d181de19efd2`, one-based inclusive lines [[1, 89]].

`rptlbl-sql-513749233`: [dbo.RPT_ReplenPickListHeader](sql/513749233.sql); source-definition SHA-256 `0927e249b9672510adf92f21788f255d1be3a5df4cd7e742f41d535f07506e6a`, reading-copy SHA-256 `ff11c0d28c6991adab18a4a6ee07b0e987c68e6a11722bc812702530b3956ca6`, one-based inclusive lines [[1, 56]].

</details>

<a id="report-label-work-orders"></a>

## What work-order assembly, component and putaway reports show

Assembly details show stored build levels and sequences. Component picks show only details matching the coded allocated flag and use stored needed quantities. The putaway report selects a putaway unit and joins its work-order header. Reading these reports does not build, allocate or move inventory.

### How it works

1. Assembly instructions sort by build level and sequence; component picks sort by source location.
2. The header and putaway unit must match their supplied internal identifiers; the putaway join requires an existing work-order header.

<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-817750316`: [dbo.RPT_WOAssmblyInstrsDetails](sql/817750316.sql); source-definition SHA-256 `69672f6b3b4f412c38bcd809394de9fa2184fdcb3ebeb881f0d734b7b25ea8f4`, reading-copy SHA-256 `3259ec399ced3ea0b5bf71faa46e832e868bb305fe3db173c0225b93eb8ab60e`, one-based inclusive lines [[1, 57]].

`rptlbl-sql-833750373`: [dbo.RPT_WOAssmblyInstrsHeader](sql/833750373.sql); source-definition SHA-256 `b556c58a55ca4d65333dbef0c7222aeef49d08c0df27218037a69dd3e76310be`, reading-copy SHA-256 `e5d30818c6346be08493d6edf7e62cb21bc8b5d35d6c6b2cb72c9e03f8874867`, one-based inclusive lines [[1, 53]].

`rptlbl-sql-849750430`: [dbo.RPT_WOComponentPickListDetails](sql/849750430.sql); source-definition SHA-256 `5ee22266197de43b9d9bc7383179c8f154e45b7b69a788b1ceccf7db3caf209a`, reading-copy SHA-256 `88c538343cb9bc167d3e8b946452b1aa037095f3b1e852d90bc6b45b03f1f1e2`, one-based inclusive lines [[1, 55]].

`rptlbl-sql-865750487`: [dbo.RPT_WOComponentPickListHeader](sql/865750487.sql); source-definition SHA-256 `1be417b4c5b09d3ee6ee988beed5c7a53338ef357bd576c9c5d4d87133a5e1fb`, reading-copy SHA-256 `14f00c8542fb0fcdf58ccb51fdb88e520458938e323f6adb174b26bf0a6ed597`, one-based inclusive lines [[1, 56]].

`rptlbl-sql-881750544`: [dbo.RPT_WOPutawayList](sql/881750544.sql); source-definition SHA-256 `c342e225aef3e10b229dd790b1806883b7518dec142c340b4333b3725ad9296c`, reading-copy SHA-256 `814b18ace3bcab0de0c50adde6ddb6dd662f8388e50bb03df90589ead47db615`, one-based inclusive lines [[1, 68]].

</details>

<a id="report-label-appointments"></a>

## Why a receiving appointment is shown only at certain hours

The daily schedule creates 24 hourly rows, then attaches an appointment at its start hour or end hour. It does not fill every hour in between. The day input is compared to a date at midnight, so a time-bearing day input can leave the appointment side empty. Multiple appointments can share an hour.

### How it works

1. The daily schedule requires exact dock and warehouse. Its trailer annotation counts matching trailer IDs across receipt headers without a date or warehouse restriction.
2. The date-range summary includes both boundary dates and counts appointment join rows, not distinct receipts; repeated appointments can repeat receipt totals.

### Limits

- The dataset supplies report values; printing and completion of warehouse work occur elsewhere in the application.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-385748777`: [dbo.RPT_RecApptDaySchedule](sql/385748777.sql); source-definition SHA-256 `dc830feb48f8bbdc0e030a488d777fc3d6c175eeeeb7d464b5bc30930384a623`, reading-copy SHA-256 `550015680dcf96af3a6e593b042074815e09b6815481fa67a4e14f8bfe36f114`, one-based inclusive lines [[1, 112]].

`rptlbl-sql-401748834`: [dbo.RPT_RecApptHeaderInfo](sql/401748834.sql); source-definition SHA-256 `29a879cab2d74ebf55bbaca9c1472c4df7a6cd85e5e0e7c5b1b196ebb0cbb49e`, reading-copy SHA-256 `fbefef9395547ee13e73d5dfd227a8cd892d95b54a6b6ffa5a5861d1c6f1b614`, one-based inclusive lines [[1, 65]].

</details>

<a id="report-label-load-manifest"></a>

## Why load container detail and carrier totals do not match row for row

Load container details select containers whose parent is NULL. Carrier totals come from shipment-view totals grouped by carrier and service. Those are different sources and groupings. The header chooses one available weight unit without a tie-breaking order, so it does not prove that every container uses that unit.

### How it works

1. Manifest details sort shipments by route and stop and use helpers for PO and comment text. Freight-term configuration can multiply rows when its join is not unique.
2. A missing warehouse suppresses the load header; the optional carrier row requires service IS NULL.

### Limits

- These procedures prepare data; a returned dataset does not establish physical printing or completed warehouse work.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-529749290`: [dbo.RPT_ShipContListDetails](sql/529749290.sql); source-definition SHA-256 `e0ec28200d16cf2b6f2dce318b4922e8426140a50a2689366927ae3695397f22`, reading-copy SHA-256 `3177f4b94723599ac20278f5190c24ec7afd5f8f9e6089b2b4d185aa256e81b3`, one-based inclusive lines [[1, 58]].

`rptlbl-sql-545749347`: [dbo.RPT_ShipContListHeader](sql/545749347.sql); source-definition SHA-256 `c757769691279d328ff8148482f9d46807cdc248f8726bbb7e93a9d17f2b6138`, reading-copy SHA-256 `9ea4714576c86aab54bc3610b5949685de56701b37fc80a400fb23e77e9cfd38`, one-based inclusive lines [[1, 76]].

`rptlbl-sql-561749404`: [dbo.RPT_ShipContListTotals](sql/561749404.sql); source-definition SHA-256 `b603413bfa572a5186d61ff90e004177a4c593e5034a366f3fe9a8db56790099`, reading-copy SHA-256 `cf01705e1d184874739603823d3bb4d13fb1db123c45f3087037d0411f19cafc`, one-based inclusive lines [[1, 49]].

`rptlbl-sql-769750145`: [dbo.RPT_TruckManifestDetails](sql/769750145.sql); source-definition SHA-256 `63aa0f9936e993b4627ffbc458ef213606aa72f2dcb7bbafb63f139a6a31a5e3`, reading-copy SHA-256 `4bc60b1827402dd7e35fa7b905b838cdad1507e98d9acbcbbc6a519b1cdcdac9`, one-based inclusive lines [[1, 83]].

`rptlbl-sql-785750202`: [dbo.RPT_TruckManifestHeader](sql/785750202.sql); source-definition SHA-256 `618fd143b1dfd227db2467ece4746cae7bef53f4f1b4c169a33fbe54d8341e28`, reading-copy SHA-256 `77cd1efca902d56cecdc032b77835ddaea54aec5432f31a60efb6cf80ab21bb0`, one-based inclusive lines [[1, 70]].

</details>

<a id="report-label-vas"></a>

## Why value-added activity and container lists have different row counts

The activity report returns individual activity rows joined to an activity name. The container report returns a container when at least one activity exists, so multiple activities do not multiply that container through the EXISTS check. Neither report filters to only incomplete activities.

### How it works

1. Both exclude a coded container type; NULL types also fail the inequality condition.
2. The container list uses NOLOCK and does not require the activity master row that the activity detail join requires.

### Limits

- The dataset supplies report values; printing and completion of warehouse work occur elsewhere in the application.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-577749461`: [dbo.RPT_ShipContVasActivityList](sql/577749461.sql); source-definition SHA-256 `4600e6037ce2445a8fe460c4f2f337e0420f752262964c43bdae03ba2e58168b`, reading-copy SHA-256 `38b3d19f7b3147806ec272d998bbcc492d87d6928268e4e86e36fd602c837d1b`, one-based inclusive lines [[1, 45]].

`rptlbl-sql-673749803`: [dbo.RPT_ShipmentVasActivityListDetails](sql/673749803.sql); source-definition SHA-256 `a3b619932bad5789cb5f53b09fdbe41b51aeeaa926b88b193564ae9ebb393765`, reading-copy SHA-256 `ce4dc0364182abbecfee7c6baee8182f2d773af03bb0a236eca8ffbd9b0ca228`, one-based inclusive lines [[1, 44]].

</details>

<a id="report-label-master-bol"></a>

## How consolidated and multi-stop master BOL datasets differ

Both procedures return a header and a separate container result set. The consolidated version uses a load shipping-address row for the destination and includes all container levels. The multi-stop version takes the shipment with the highest stop sequence and includes containers matching the tree root or its direct tree-parent relationship.

### How it works

1. Ship-from company is chosen only when the load has one distinct non-NULL company; NULL company values do not increase that count.
2. The highest stop sequence has no tie breaker. Both detail outputs use customer PO when non-NULL, otherwise ERP order, without a final order guarantee.

### Limits

- These procedures prepare data; a returned dataset does not establish physical printing or completed warehouse work.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-225748207`: [dbo.RPT_MasterBOLConsolHeader](sql/225748207.sql); source-definition SHA-256 `15d629bb0654a955c18cc8633a33ff548b74406f1bc5eb35af37553c78407aed`, reading-copy SHA-256 `7b0085b32620a571405675ec2b8d2453b1db4ab335bd1fc3b0d66cecd9275af1`, one-based inclusive lines [[1, 211]].

`rptlbl-sql-241748264`: [dbo.RPT_MasterBOLMultiStopHeader](sql/241748264.sql); source-definition SHA-256 `26c9283c225013b4edd096f80e30bd3a769b8718f4eec64337fed1932805199a`, reading-copy SHA-256 `e96f1038afd23e1d5325d1261b7bbbb82d4939993873d218e141dc55165155af`, one-based inclusive lines [[1, 212]].

</details>

<a id="report-label-invoice-export"></a>

## Why a commercial invoice dataset can be empty

The commercial invoice requires a matching country configuration and at least one named container. Without those matches, it can return no lines. It repeats shipment container totals beside each line and only falls back to retained detail totals when an existing container group has a NULL sum. The export declaration uses different fields and formatting rules.

### How it works

1. Container totals count all named container rows, including nested ones; adding repeated line totals can overcount a shipment.
2. Both datasets cast quantities to whole numbers and amounts to fixed decimals. The export declaration uses the execution date and tests some flags only for NULL, not their values.

### Limits

- The dataset supplies report values; printing and completion of warehouse work occur elsewhere in the application.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-839062125`: [dbo.RPT_Travis_Commercial_Invoice](sql/839062125.sql); source-definition SHA-256 `a5533775b484bdb87b1522afc803aae93e66bc365d4d54d24a91d7eebe9a876f`, reading-copy SHA-256 `487066ef3c3d583b4e9a66261ef48c1c060168664f2efc2e3fc5fa06f48ffb40`, one-based inclusive lines [[1, 81]].

`rptlbl-sql-487672785`: [dbo.RPT_Shippers_Export_Declaration](sql/487672785.sql); source-definition SHA-256 `c8c2e485fbf6a2c2d61e02307e9cdb2cc830ced90cc318653044d47f62a8ddd6`, reading-copy SHA-256 `10fea0955730e0113fb564371c77873e99a30495c8f64f1c8ab2e15175f3953f`, one-based inclusive lines [[1, 116]].

</details>

<a id="report-label-exchange"></a>

## Why an exchange-shipment report shows receipt data

The reviewed exchange report reads receipt header and receipt detail. Its status field is the receipt trailing status, and extended price is receipt total quantity times item net price. The report name does not mean that the procedure creates an exchange shipment.

### How it works

1. The header filters the internal receipt number; details sort by ERP order line and item.
2. NULL quantity or price leaves extended price NULL.

<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-177748036`: [dbo.RPT_ExchangeShipmentDetails](sql/177748036.sql); source-definition SHA-256 `9c50aeb0e45c11e898304b9ba6c9aee82bac158ade408861739339befc1a48ec`, reading-copy SHA-256 `fa64556193ca14fc39f10a1f6acbf4150538ec116edd1c9655a383b2b41446c6`, one-based inclusive lines [[1, 54]].

`rptlbl-sql-193748093`: [dbo.RPT_ExchangeShipmentHeader](sql/193748093.sql); source-definition SHA-256 `c37b65345a84fc75c544f19092d56334e20e7a51c7c154a4dc52d15ecd197e78`, reading-copy SHA-256 `78f04006d5acee4ed9adcf5d28d533d1ddcef8087b0a201e31f5c1b80df3a829`, one-based inclusive lines [[1, 58]].

</details>

<a id="report-label-1348-current"></a>

## How the unsuffixed 1348 procedure selects and formats its data

The unsuffixed 1348 procedure starts with a selected parent container and its direct children by text container identifiers. It reads each matched shipment line, uses line metadata for formatting, and applies its eligibility expression. It does not execute a printer. The chosen quantity can differ from the stored line total when status 2 is 999.

### How it works

1. Completed quantity adds qualifying quantities from ten status slots using threshold 600. Eligibility compares that sum with requested quantity, with a separate coded MARK_FOR override.
2. Formatting uses detail user_def6 and detail priority; another prefixed field uses detail user_def5. The procedure does not join item cross-reference.
3. The effective total quantity becomes quantity_at_sts1 when status2 is 999. Integer and fixed-width formatting can lose fractions or width; DISTINCT removes identical projected rows.

<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-2071678428`: [dbo.RPT_1348](sql/2071678428.sql); source-definition SHA-256 `5c4e385d3c0d349af069f6345f0a065438560139bda810810ef7a4c35c1b1743`, reading-copy SHA-256 `c2db3529419dcff22f75410c4e596f9f9f4328ebeba735c89d7c7aefcae7058c`, one-based inclusive lines [[1, 210]].

</details>

<a id="report-label-1348-variants"></a>

## Why 1348 reprints and named variants can produce different results

The captured 1348 procedures are separate implementations. Some take a container number, others a shipment ID or load input. Several reprint variants calculate an eligibility flag without filtering on it. Older variants also use different status thresholds, metadata sources and item-reference joins. A date suffix alone does not establish which version an application selects.

### How it works

1. The shipment-ID reprints join both shipment and line identities; the load reprint joins its detail by line and compares a text load input directly with SHIPPING_LOAD_NUM.
2. Archive2 adds item/unit cross-reference; the 20220315 variant joins cross-reference by item alone; the unsuffixed body instead uses detail user_def5.
3. The 20200807 variant tests the length of header priority but formats detail priority. The 20170913 variant formats header priority and uses threshold 650.

### Limits

- The selected dataset still requires rendering and an output route before physical printing can be confirmed.


<details>
<summary>Technical reference and sources</summary>

`rptlbl-sql-1943677972`: [dbo.RPT_1348_Reprinting_byLOAD](sql/1943677972.sql); source-definition SHA-256 `c6a4de87ff78808422d6823aa2084c4e2eb129f15d4e8f7b906fcb2c72b9904f`, reading-copy SHA-256 `179d8ff54b2f76726d01a96931faca770a94566d1be687e766eeeec72536a279`, one-based inclusive lines [[1, 160]].

`rptlbl-sql-1959678029`: [dbo.RPT_1348_Reprinting_Archive2](sql/1959678029.sql); source-definition SHA-256 `7b262919a58d5a84785e32e9fc22c21d87775993b99cc06930f1a3d050abaaff`, reading-copy SHA-256 `0b65b774d243fa7e53c0893d9b918146d4b1cb801c43d6c4cd3272314f512a83`, one-based inclusive lines [[1, 172]].

`rptlbl-sql-1975678086`: [dbo.RPT_1348_Reprinting_Archive](sql/1975678086.sql); source-definition SHA-256 `5cd1d51862a282c5a458ac3f14f5f48ec174eb2afde3baec57adc188985f6486`, reading-copy SHA-256 `9df7888a36a6eccf7b3a580014ba448e752deda0394abfaff63a62848a000ee1`, one-based inclusive lines [[1, 167]].

`rptlbl-sql-1991678143`: [dbo.RPT_1348_bak20121206](sql/1991678143.sql); source-definition SHA-256 `a3c77f7f993310bed067397f4196bc051c11321c437aba431ec75a3fe76459b2`, reading-copy SHA-256 `eaa669a5be8ea55fcb60a6f7a595149f01c37f5e9d2fc2890c4941021f8e63dc`, one-based inclusive lines [[1, 84]].

`rptlbl-sql-2007678200`: [dbo.RPT_1348_bak20120921](sql/2007678200.sql); source-definition SHA-256 `355eaae408cc83ea117c96ec219ddd4ba26c293b7baaa071aec4fed61188c764`, reading-copy SHA-256 `b8a41a6db2f06810b1b81ade87b8014f9dad0fae59290354e9af7253c6198a14`, one-based inclusive lines [[1, 80]].

`rptlbl-sql-2023678257`: [dbo.RPT_1348_20220315](sql/2023678257.sql); source-definition SHA-256 `780abc99a24349c61543b8600e50ea916850674b2c4de2e2ad54ede8a75bb1e6`, reading-copy SHA-256 `3e38ba5e16ea3df624470bf7460eb059815ee6aeb8407062cff922f634ff91a3`, one-based inclusive lines [[1, 175]].

`rptlbl-sql-2039678314`: [dbo.RPT_1348_20200807](sql/2039678314.sql); source-definition SHA-256 `8e37da73fd9d668e9b9748fc54565e2cff1f82f4df1dc6b5ee7beb8bfc4f7c1f`, reading-copy SHA-256 `864480e6c6f9f0b753fb69b43c3b669d22a8c8eff8952ee3d955f54fdf3708ac`, one-based inclusive lines [[1, 168]].

`rptlbl-sql-2055678371`: [dbo.RPT_1348_20170913](sql/2055678371.sql); source-definition SHA-256 `bb815c37c7f5ec46e9134ebcbe62641f41ac55c10a4642cca7d9c8cef3b1ec79`, reading-copy SHA-256 `f8d771abec45d974241bd38b23ced4e110eedd7529f161baaa06146f6dbbeccd`, one-based inclusive lines [[1, 160]].

`rptlbl-sql-2071678428`: [dbo.RPT_1348](sql/2071678428.sql); source-definition SHA-256 `5c4e385d3c0d349af069f6345f0a065438560139bda810810ef7a4c35c1b1743`, reading-copy SHA-256 `c2db3529419dcff22f75410c4e596f9f9f4328ebeba735c89d7c7aefcae7058c`, one-based inclusive lines [[1, 210]].

</details>

<a id="warehouse-read-write-behavior"></a>

## Does a warehouse lookup change records?

Check the exact routine. Some calls only read data, while interface claim routines also change processing markers. For example, the transaction-history RU routine is read-only, the shipment RU routine marks a batch, and the accessorial-header lookup returns every header despite accepting an accessorial-code input.

### How it works

1. Identify the captured routine and its actual body; prefixes are not proof of behavior.
2. Distinguish returned rows, output parameters and explicit RETURN values.
3. For interface claims, inspect the writes before treating the returned rows as a simple lookup.

### Settings and prerequisites

- Processing conditions: claim ready or NULL rows as in process; output excludes processed rows. The leading unnamed value identifies an item-download record.
- The output uses fixed receiving-interface-batch, new-action and processed-condition labels and a slash-separated tree path. The projected UTC stamp is rounded to seconds. These are returned interface labels, not writes to the source container rows.
- The excluded IN_CONFIRMATION selector is affirmative. NULL load confirmation fails the inequality, and shipments lacking a matching shipping load fail the inner join.
- The attribute selectors identify catch weight and its unit. TRY_CAST uses numeric(14,5); multiple values aggregate independently, and invalid weight text contributes NULL.


<details>
<summary>Technical reference and sources</summary>

`wh-access-423320918`: [dbo.wm_RAccessorialHeader01](sql/423320918.sql); source-definition SHA-256 `ad427eda18d38991216a72198845f76a8f6ef68e12e71822b8a2aea039c58bec`, reading-copy SHA-256 `d9ff727dce7b03b6a71cc52c338ffd55fd7da252dee451c6e2f6e237377f102a`, one-based inclusive lines [[1, 7]].

`wh-access-1543324908`: [dbo.wm_RShipmentHeader03](sql/1543324908.sql); source-definition SHA-256 `dceceb30e35e2b91b4109bf06fc3bcacff1ef11b370f19846330aa3fb4ca7ad7`, reading-copy SHA-256 `307654abdb63ae383bc23c84b8746719c5c6f5d07209732ca56a343c8f149c1a`, one-based inclusive lines [[1, 19]].

`wh-access-202796130`: [dbo.wm_RUDownloadItem01](sql/202796130.sql); source-definition SHA-256 `0481d364c1d5dfa9f69c2f5210e91dd7be58f4dbd87e9a84c31080762a5dd2ba`, reading-copy SHA-256 `bb729f29a111e3b1151718bbb0c10a5c5a2fed2e22c06ab26f2766f0d0db9c11`, one-based inclusive lines [[1, 32]].

`wh-access-298796472`: [dbo.wm_RUReceiptContainer05](sql/298796472.sql); source-definition SHA-256 `2ea9347a7a42f8c1a926028cc9cbcfba0af697cb4c0b637c170c3a2528321b26`, reading-copy SHA-256 `0b47cacc34fd20613858d266716a3e795364b7dd276787bad3d8017662acb9d2`, one-based inclusive lines [[1, 280]].

`wh-access-362796700`: [dbo.wm_RUShipmentHeader01](sql/362796700.sql); source-definition SHA-256 `f92c971152f7344666dc342ba35eddace8bc23e5043a5030897cb35f209923bf`, reading-copy SHA-256 `aa37bbe662648c8e48bfeda219512e9dcf2ebef9d133e2d3ef528aeb967ee89a`, one-based inclusive lines [[1, 32]].

`wh-access-394796814`: [dbo.wm_RUTransactionHistory01](sql/394796814.sql); source-definition SHA-256 `f0c4c8c009a04f0e9799463342769335f29379b0d0a56cf6846348611d39e9b8`, reading-copy SHA-256 `f20bc26258fe0ad5b39953d4cb6113e790a656ddddf993e3b12156ae9bef1869`, one-based inclusive lines [[1, 47]].

</details>

<a id="warehouse-customer-vendor-fallback"></a>

## Why can a customer or vendor lookup return several matches?

Several lookups include a company-specific record and a generic record whose company is blank in database terms (NULL). Most return all matches. Customer variant 04 alone limits the result to one, ranking specific ship-to and company combinations before generic combinations. Vendor and customer sort rules differ.

### How it works

1. Check whether ship-to or ship-from must match exactly, may be NULL, or must be NULL on both sides.
2. Read the variant-specific ordering before interpreting the first row.
3. Treat tied preferred rows as unresolved unless another source establishes uniqueness.

<details>
<summary>Technical reference and sources</summary>

`wh-access-663321773`: [dbo.wm_RCustomer02](sql/663321773.sql); source-definition SHA-256 `61ecdc262dac18e41071e3adfcc84e51506872f0627f45812ecd6022e28af813`, reading-copy SHA-256 `358682b56705cda761cbed4f18207466ad93ef76f62a520b91b70050e774ec6f`, one-based inclusive lines [[1, 17]].

`wh-access-679321830`: [dbo.wm_RCustomer03](sql/679321830.sql); source-definition SHA-256 `eeeae98980d16d61fa9e9c6ab2a6a3c6f09b99ecb37edc67007666cb5821e99c`, reading-copy SHA-256 `d1bbe38e051cee5dfe7a795ec01077d1dbac9a04d1274d75c46ea7694b8d49b4`, one-based inclusive lines [[1, 19]].

`wh-access-1150275503`: [dbo.wm_RCustomer04](sql/1150275503.sql); source-definition SHA-256 `6fc2a30d08607d0084d6035ca31b076bbb20c339fe1ab972da48bb117ea643c2`, reading-copy SHA-256 `81a1a016fdfd10b393e54b617cfefddc988d6a5881c00d1fc86915692cddc4cb`, one-based inclusive lines [[1, 34]].

`wh-access-1799325820`: [dbo.wm_RVendor02](sql/1799325820.sql); source-definition SHA-256 `42decbef14f27719c2714867ab66eb7fd68d24fd883cde21ee19c93073151086`, reading-copy SHA-256 `d964e56409d8d24a38cbc44782442522d583935df47a39ced40cbadae49aa857`, one-based inclusive lines [[1, 22]].

`wh-access-1815325877`: [dbo.wm_RVendor03](sql/1815325877.sql); source-definition SHA-256 `9f9c5f782ccad87a0fb4f41957da0e40fab8df6ac790b9c718e85d6abcdcb6e3`, reading-copy SHA-256 `1bc3654fb2814450337afb66f295308027b6482c169596d5ae99024b7892e740`, one-based inclusive lines [[1, 20]].

</details>

<a id="warehouse-item-company-matching"></a>

## How do item lookups handle company and cross-references?

Item lookups have different company rules. Some require exact company or both values NULL; others include generic items. Cross-reference joins can return the same item more than once. Item variant 03 does not prove that an item belongs to only one company; variant 11 separately counts all item rows.

### How it works

1. Identify the exact item variant and company predicate.
2. Separate generic fallback from exact-or-both-NULL matching.
3. Check join multiplication and explicit uniqueness tests before assuming a single item.

### Settings and prerequisites

- Company normalization uses one nonempty character as the NULL replacement. Two NULL values match, and NULL also matches that exact sentinel value; an empty string remains distinct.


<details>
<summary>Technical reference and sources</summary>

`wh-access-967322856`: [dbo.wm_RItem02](sql/967322856.sql); source-definition SHA-256 `f4bf752f718d736d3aec71dcabe678e6a0f1d81d2568abe5d9b0d57c8d39cf1a`, reading-copy SHA-256 `4b00de68b8e60620ba58cde80518b7fa695a7dff7f8e3d4fee60bdb4b2048c3a`, one-based inclusive lines [[1, 16]].

`wh-access-983322913`: [dbo.wm_RItem03](sql/983322913.sql); source-definition SHA-256 `92c6aaf834a30991538a05ab1bc22c87af86a83191b8bd75b7d3a40237bc0543`, reading-copy SHA-256 `9d711d386b983a6318544e822763932c01bf7693935e50dfe25420a1ffd676cc`, one-based inclusive lines [[1, 19]].

`wh-access-999322970`: [dbo.wm_RItem04](sql/999322970.sql); source-definition SHA-256 `7edfc644c19d5e67000ac922fd10fde4d6ec980f46e14a37e99e44d378d57dc3`, reading-copy SHA-256 `b175af401105e549c1295a3634b06d5d58dbc0122fdef827425b4d0af90e7be4`, one-based inclusive lines [[1, 16]].

`wh-access-1015323027`: [dbo.wm_RItem05](sql/1015323027.sql); source-definition SHA-256 `9d5db87cd4591ddfbb7768121b88595a85f7ac8a2d278acfc43c90c14f2d6634`, reading-copy SHA-256 `c20333af4a7a6e3c7ea18d23609d1d1720f9196c2ebb6070e8b5c1e9d7e0d29d`, one-based inclusive lines [[1, 16]].

`wh-access-1031323084`: [dbo.wm_RItem06](sql/1031323084.sql); source-definition SHA-256 `a8cb09c869ec30d377cad7600003f877068941a3d7e395b60815492020d118da`, reading-copy SHA-256 `ef089dcdbe67a0ab26e544b821bb397ccb8aa54013e3e4c5040d2dd13698df8f`, one-based inclusive lines [[1, 19]].

`wh-access-1047323141`: [dbo.wm_RItem07](sql/1047323141.sql); source-definition SHA-256 `3e83b111dbd9afe9f125ad197823dbb51c0f6b92d7c35b1e54d9086b3e3b3e20`, reading-copy SHA-256 `8a5640329fc6e7dbbcd35d964b08aa332c879042cde628d680b66d65b6bd8c6e`, one-based inclusive lines [[1, 18]].

`wh-access-1294276016`: [dbo.wm_RItem08](sql/1294276016.sql); source-definition SHA-256 `bfe2fb8d09b32f7a5b46af094a7b5ebd755982c183e2bce6d34ded7042229b12`, reading-copy SHA-256 `c62b7cc5d98d0ca3abea1191db76fa57f9a0cb8efb65ac8a7783d08b4e4b6ade`, one-based inclusive lines [[1, 20]].

`wh-access-1342276187`: [dbo.wm_RItem11](sql/1342276187.sql); source-definition SHA-256 `33781c9e7e56953de582a9e967bed611ca34469ff104e8c1a66ecc3fc10cf9c3`, reading-copy SHA-256 `c5442922aba529e8ec1b3be6ecfc2340b76ad06c507fdb192afb97c8252a7eea`, one-based inclusive lines [[1, 19]].

`wh-access-1358276244`: [dbo.wm_RItemCrossReference02](sql/1358276244.sql); source-definition SHA-256 `57f208adf502e1aa2a020e778ab58b08fd166b0453f0a5c029bd9f70b84e5550`, reading-copy SHA-256 `709d7f50c2d30364f56ff94196e87d79a1806df991240978de2d5241a2c4150d`, one-based inclusive lines [[1, 20]].

`wh-access-1063323198`: [dbo.wm_RItemCrossReference03](sql/1063323198.sql); source-definition SHA-256 `b28edde52649e3d3b0a40908e1a75750ab2945b1e4b6fe6616af22d949a3a0c4`, reading-copy SHA-256 `6fa075ea96fc777ebb32739b96c3f0c1cdfb6d6dd6bd7a551b0862676f9e8f8a`, one-based inclusive lines [[1, 17]].

</details>

<a id="warehouse-unit-fallback-sequence"></a>

## How are item units and their sequence selected?

Unit lookup 02 falls back by an entire set: exact item/company, then generic item, then item class. Other variants branch on whether an item was supplied. The sequence helper calculates a candidate number; the update helper shifts qualifying existing sequences. Neither helper creates the new unit row.

### How it works

1. Distinguish set-level fallback from choosing a fallback separately for each unit.
2. Check whether a NULL item switches the lookup to item class.
3. Treat sequence calculation, shifting and insertion as separate steps with caller-owned coordination.

### Settings and prerequisites

- The literals inside EXISTS projections are irrelevant to membership; those subqueries test row existence, not the projection value.
- All four storage-template fallback literals name the default template; this fallback applies when the selected item's template is NULL. No matching item yields no template row instead of automatically creating a default item.


<details>
<summary>Technical reference and sources</summary>

`wh-access-1374276301`: [dbo.wm_RItemUnitOfMeasure02](sql/1374276301.sql); source-definition SHA-256 `9c8b466bf824b5132c162de3c0ace4894e678e31e75ff11f6669034205cdd85c`, reading-copy SHA-256 `ed3dda5a3c24d436d5ab23aca4aaa5f754fa9e7fa0de029e8e45b5029f78b2df`, one-based inclusive lines [[1, 40]].

`wh-access-1111323369`: [dbo.wm_RItemUnitOfMeasure03](sql/1111323369.sql); source-definition SHA-256 `8b6901c374f26fc47d089d3adc00b2167edc168fba794af6885c077ce7618109`, reading-copy SHA-256 `8108119efd28f6f1fdd19058ca212f86a5d0c35b5be52cb190107ed4965a6982`, one-based inclusive lines [[1, 26]].

`wh-access-1127323426`: [dbo.wm_RItemUnitOfMeasure04](sql/1127323426.sql); source-definition SHA-256 `f65bd443214253bffee4b79909281d1d4802d3aeaf0b02626d5ed559dbee8bb8`, reading-copy SHA-256 `795799ff0c58b3e1aeb3485f3f4af88259e1675638c7c1c3d46ba673075f2368`, one-based inclusive lines [[1, 25]].

`wh-access-1198627313`: [dbo.wm_RItemUnitOfMeasure07](sql/1198627313.sql); source-definition SHA-256 `df9f82f4dda8ff9d4548afecc282aeb8d4c226999d6a6fb3ddb76d48495be330`, reading-copy SHA-256 `f3455a8cda21208f5b7d31c2787b20a1255d4114b4685a0757f4599993f8b623`, one-based inclusive lines [[1, 79]].

`wh-access-590273508`: [dbo.wm_IItemUnitOfMeasure01](sql/590273508.sql); source-definition SHA-256 `f2df23871927c54ea6dd6af7644018bd7a0a2ff0a09b504107bdd4ef8d922c97`, reading-copy SHA-256 `1e7a9108c3110b60c12f4505f152f4a5f98e38c87ea6a91b82f061feccb9fcef`, one-based inclusive lines [[1, 110]].

`wh-access-1170103209`: [dbo.wm_UItemUnitOfMeasure08](sql/1170103209.sql); source-definition SHA-256 `422cf97e2ee33d1b806e2f310a1b01932b8a6330f3558244c70719e095678405`, reading-copy SHA-256 `8fc3ba206e858761c6504bcef06d5dbcbbb829816cf65d96ecfd178214e8f9d4`, one-based inclusive lines [[1, 44]].

</details>

<a id="warehouse-comment-interface-context"></a>

## Why do operational and upload comments differ?

Comment routines can read operational comments or an upload copy depending on interface link. Their line rules differ: one treats line zero as including an operational NULL line, another uses ordinary equality, and a positive internal number can control whether an extra filter applies. The delete routine uses exact key equality.

### How it works

1. Identify operational versus upload branch from the interface-link input.
2. Compare line-zero and NULL handling in the chosen routine.
3. Do not assume a displayed comment will match the delete predicate.

<details>
<summary>Technical reference and sources</summary>

`wh-access-1054275161`: [dbo.wm_RCommentText03](sql/1054275161.sql); source-definition SHA-256 `227747a79ecb46d9e733b113f6858c5a03df87a413736410ae7b670018319499`, reading-copy SHA-256 `fe68f97bbb7ac0467aece3d8c681b26c3d0ed86daf21be8f8ddff059c068ceb9`, one-based inclusive lines [[1, 21]].

`wh-access-1070275218`: [dbo.wm_RCommentText04](sql/1070275218.sql); source-definition SHA-256 `8efaea286d4321f8ff47c328722fd8852dcb7252136a54c00756d8568b1d5074`, reading-copy SHA-256 `183c214342fa9493b7d61bfc78998ab6a1f42507d5677b6e14644cefe1ef072a`, one-based inclusive lines [[1, 20]].

`wh-access-1086275275`: [dbo.wm_RCommentText05](sql/1086275275.sql); source-definition SHA-256 `506bddd81ded6848c6e01fcff73d42d2757ea6973a08ad879d48f6db3627ca75`, reading-copy SHA-256 `c9d2783cabbbf3c527f6025d51734a65d690eb5a845f0d9010d9f7a7f43957d5`, one-based inclusive lines [[1, 29]].

`wh-access-1102275332`: [dbo.wm_RCommentText06](sql/1102275332.sql); source-definition SHA-256 `1126e6016289a48c6812c93c52ad7cf656202d2677feaaca7e7cac1878f4c5cc`, reading-copy SHA-256 `ec692d5c747dfa2b8c438382d099475227b7db1c45d0d1c46ec7781288f3b1db`, one-based inclusive lines [[1, 17]].

`wh-access-430272938`: [dbo.wm_DCommentText01](sql/430272938.sql); source-definition SHA-256 `2422b0f0a3b28218b21643454668bbdd374929f98dab7339d42d06490f770d1e`, reading-copy SHA-256 `2c547b12bbc2b664dd10fcf764965cdadd97a3624700f59d7418dca6079db893`, one-based inclusive lines [[1, 23]].

</details>

<a id="warehouse-receipt-purchase-order-selection"></a>

## Which receipt and purchase-order records are selected?

Business IDs are not the only scope. Some receipt and purchase-order lookups require warehouse and an open header, while others do not. A positive purchase-order line narrows one receipt-detail lookup; zero, negative or NULL line input selects all lines for that order. Projected columns also differ between variants.

### How it works

1. Use the routine with the needed warehouse and open/closed restrictions.
2. Check whether company/type/ERP-order values use ordinary equality or explicit NULL normalization.
3. Check the output projection before treating joined receipt/header rows as detail-only data.

### Settings and prerequisites

- ERP-order and receipt-type NULL normalization uses the same nonempty one-character sentinel within the applicable variants. NULLs match one another and can collide with a real sentinel value. ERP line uses ordinary equality; the warehouse-scoped variant also requires ordinary warehouse equality.


<details>
<summary>Technical reference and sources</summary>

`wh-access-1582277042`: [dbo.wm_RPurchaseOrderDetail02](sql/1582277042.sql); source-definition SHA-256 `a18babf85c66a77272278670ad74cc64b4254bc79c1b366852412041ce84dbf7`, reading-copy SHA-256 `9ee7635de7dacd485533a13bafd1329d4ccf3b823e64428309b539089ffa786a`, one-based inclusive lines [[1, 22]].

`wh-access-1598277099`: [dbo.wm_RPurchaseOrderDetail03](sql/1598277099.sql); source-definition SHA-256 `2b887d559c8ebe63a8b17f7354a454be655ee4afa35e775b511b59275b81e0cf`, reading-copy SHA-256 `da6da4bd4529f529734ac5360c80dc1c3fdf08f0cc73df8717657d4f84576163`, one-based inclusive lines [[1, 17]].

`wh-access-1614277156`: [dbo.wm_RPurchaseOrderDetail04](sql/1614277156.sql); source-definition SHA-256 `383eff7047a50a896e121edb15b65e6ea6c4f1683cb3e9d785dd04e3df7178a4`, reading-copy SHA-256 `71704e80b347a7046c669c9b9c41bbf094079e03e06710a1b450b896330ac125`, one-based inclusive lines [[1, 54]].

`wh-access-1662277327`: [dbo.wm_RPurchaseOrderHeader03](sql/1662277327.sql); source-definition SHA-256 `b84018983b39d570a004221a799b201cfef220aebda8f6f88fbd5cae9c65eb30`, reading-copy SHA-256 `21207af6796d0d2ee1f8b97a0b7c5ef721f8a116cc7984db15ae0d62df1bb1d2`, one-based inclusive lines [[1, 19]].

`wh-access-1303324053`: [dbo.wm_RReceiptContainer02](sql/1303324053.sql); source-definition SHA-256 `d8e85ef48a15d41e9fe9f6e738c001ce1b6394b27e2863bbee170d71c3d7065e`, reading-copy SHA-256 `ca331a3afffdd377e6e81ce8927c50ff62c63fb5590e2b8d3d04e76020712adc`, one-based inclusive lines [[1, 23]].

`wh-access-1335324167`: [dbo.wm_RReceiptContainer04](sql/1335324167.sql); source-definition SHA-256 `b57b8b05948d3ad4b744dc2ebb0156df252da077404de0b0be2827fd29eb5448`, reading-copy SHA-256 `93f28e1ac7e1843a5ec27c9fbbd3922bf63f61de20512d1e6a29cc686a804690`, one-based inclusive lines [[1, 18]].

`wh-access-1678277384`: [dbo.wm_RReceiptDetail02](sql/1678277384.sql); source-definition SHA-256 `ceaa1e2c606ff00eb98023ab256fd1b2befa7611907372c88787e4de45735d4a`, reading-copy SHA-256 `69a42c74a112647040d6ea3672acbdb2e856c40cd8436b793a489293fca17624`, one-based inclusive lines [[1, 22]].

`wh-access-1367324281`: [dbo.wm_RReceiptDetail03](sql/1367324281.sql); source-definition SHA-256 `bc1e7dd728460f1a1abec21b853780c8508bc8d00920146c4b8a538abadda8f7`, reading-copy SHA-256 `ec436acdd079bd0c9caded9516f2bde830c94f8285ab41edd561ceae55348aed`, one-based inclusive lines [[1, 22]].

`wh-access-1694277441`: [dbo.wm_RReceiptDetail05](sql/1694277441.sql); source-definition SHA-256 `a137bc4a5f232d22739e20c24fafbe9e6b2df99faf96a493f0bca2d9aa413484`, reading-copy SHA-256 `7e2ed7b196ec1e27f5d66d6ca233f8fe5d9c9886d8fef330586c5698a3db94c6`, one-based inclusive lines [[1, 27]].

`wh-access-1710277498`: [dbo.wm_RReceiptDetail06](sql/1710277498.sql); source-definition SHA-256 `da30be58ef1a647b4e183517ba587d299c173e92ec899f0f7c1f98ff73736672`, reading-copy SHA-256 `9de29e33df90118d3eea3ab1d4e5360a5a24d54ee556f275cfa679a9a3ef79a4`, one-based inclusive lines [[1, 33]].

`wh-access-1726277555`: [dbo.wm_RReceiptDetail07](sql/1726277555.sql); source-definition SHA-256 `04d0825306cfc00543acd148bd34524e46a86212f412129971c8906734efae58`, reading-copy SHA-256 `a225b1c09b0205a2407f297118356c0b764e3a75566e0e79733d042ac0097a54`, one-based inclusive lines [[1, 35]].

`wh-access-1415324452`: [dbo.wm_RReceiptHeader02](sql/1415324452.sql); source-definition SHA-256 `508147730ab10df14bc0e914fafd22469022c8b6afa2e97ee371f2afcbd4e29b`, reading-copy SHA-256 `0f5eb8f50e32c63ac25b451e2568e8291bc59643248b67a9d2005b2f7264df7e`, one-based inclusive lines [[1, 21]].

`wh-access-1431324509`: [dbo.wm_RReceiptHeader03](sql/1431324509.sql); source-definition SHA-256 `54042188db26b0835dff8ee832308694a46e2363df37a76845438e9ca1750dac`, reading-copy SHA-256 `df08ed6936b1c967093fffc6259aafa501278bc3c8da970fab51c2a9e1233960`, one-based inclusive lines [[1, 22]].

`wh-access-1742277612`: [dbo.wm_RReceiptHeader07](sql/1742277612.sql); source-definition SHA-256 `0d96504694f5826f4e50a834ffb8096e68295fc343d91f4ae0937662b368ea53`, reading-copy SHA-256 `160718e0d3dae774736ee681cd3dde76941c80a70f15d5466da4f756471d697d`, one-based inclusive lines [[1, 28]].

`wh-access-1758277669`: [dbo.wm_RReceiptHeader08](sql/1758277669.sql); source-definition SHA-256 `acc1b76f3f9b5217cf8a16c0192ca42c80b9ded3884fed69f8a116cd902ef8aa`, reading-copy SHA-256 `f5769cfcee00c0b4cf70a93833c72414928d28e0f3d7af1009b35d33b6cb0bd7`, one-based inclusive lines [[1, 26]].

</details>

<a id="warehouse-receipt-upload-candidates"></a>

## How are receipt upload candidates chosen?

The read-only candidate routines use container status, receipt closure and parent-container relationships. Variant 05 adds completed-detail checks. Variant 06 contains a comparison to NULL that does not act like an is-not-NULL test. A configuration branch can include closed unbatched receipts without qualifying containers; these reads do not claim a batch.

### How it works

1. Identify the candidate variant and status threshold.
2. Distinguish completed-detail, header-status and closed-receipt alternatives.
3. Keep candidate selection separate from batch marking and completed delivery.

### Settings and prerequisites

- An interface configuration setting controls whether closed receipts without containers are included when its value is affirmative.
- Variant 06 has ANSI_NULLS enabled, so CLOSE_DATE <> NULL does not identify a closed receipt.


<details>
<summary>Technical reference and sources</summary>

`wh-access-558625033`: [dbo.wm_RReceiptHeader04](sql/558625033.sql); source-definition SHA-256 `aca8d2e9934014c733538e844fa7590c1a377c662df3bc5f6dd737e20a23a8a9`, reading-copy SHA-256 `1110bfb2f48f1057f0cdea363407cb13c289fa58516d5dd15bd80f96c947ee51`, one-based inclusive lines [[1, 99]].

`wh-access-542624976`: [dbo.wm_RReceiptHeader05](sql/542624976.sql); source-definition SHA-256 `0058a08761daa5f70af4d7608a439552141b2ee600487af623e9cc1c32722bf3`, reading-copy SHA-256 `c0c05df16fb90669ebdd37f8ec3e4ff6a97a838fa961b2a5fd659d07e9046495`, one-based inclusive lines [[1, 139]].

`wh-access-526624919`: [dbo.wm_RReceiptHeader06](sql/526624919.sql); source-definition SHA-256 `5c770d6726a7a2b999a721058e4719aa80a9abbc159d492c05a1245e612f6ab3`, reading-copy SHA-256 `671a4f0c1250bcf7a6f920307342a047212e4e1e5eb5ad2be1a196b8e602b061`, one-based inclusive lines [[1, 148]].

</details>

<a id="warehouse-receipt-batch-marking"></a>

## What changes when receipt upload batches are selected?

The three receipt RU routines mark qualifying containers and headers with a batch, then return matching headers. They differ in completion and status conditions. Company and warehouse flags also differ: variant 03 lets the warehouse line-upload flag qualify a detail even when a company exists. Clearing a batch is a separate two-table update.

### How it works

1. Compare the exact RU variant; do not substitute conditions from similarly named read-only routines.
2. Apply the documented company/warehouse precedence for each marking step.
3. Account for four separate dynamic writes and a later read; there is no encompassing transaction in these bodies.

### Settings and prerequisites

- RUReceiptHeader01 first marks unbatched line containers at or above Sts, then parents with NULL/zero line number whose children bear BatchId. It marks closed unbatched headers under zero-quantity-line or zero-container upload flags. Company settings take precedence; warehouse fallback applies only when the relevant company is NULL. The line-upload flag adds no detail-quantity test.
- RUReceiptHeader02 adds positive-line/header/detail matching and requires detail OPEN_QTY=0 or exactly one closed matching header, with no container below Sts for that detail. Parent marking also joins receipt detail by receipt number. Header flag rules follow variant 01. These predicates differ from the read-only RReceiptHeader05 variant.
- RUReceiptHeader03 selects positive-line containers when both header statuses reach Sts, or the header is closed and minimum container status reaches Sts. Its warehouse line-upload flag can qualify a row even with a company present; zero-container warehouse fallback still requires NULL header company. Unlike read-only RReceiptHeader06, it uses IS NOT NULL and >= comparisons.
- Optional filters are appended after AND without parentheses, so an OR in stored filter text retains normal SQL operator precedence.


<details>
<summary>Technical reference and sources</summary>

`wh-access-314796529`: [dbo.wm_RUReceiptHeader01](sql/314796529.sql); source-definition SHA-256 `eb37f482b9d009aee040d6d00903b039d6073b4faeeef4ef5a46c1c95f61d2e9`, reading-copy SHA-256 `85e7d344146cf5c46432ea961e07275b46d187d947df6888b32511c91f42923c`, one-based inclusive lines [[1, 140]].

`wh-access-330796586`: [dbo.wm_RUReceiptHeader02](sql/330796586.sql); source-definition SHA-256 `37360be2efe79e5dac8f52afbdab88c6e1fa82a03eeba2ec55bd7f1db20e7570`, reading-copy SHA-256 `33e226d65c5963d182f5db832b3643283f625c14cc60ade3a0f9fe44fc3ab155`, one-based inclusive lines [[1, 157]].

`wh-access-346796643`: [dbo.wm_RUReceiptHeader03](sql/346796643.sql); source-definition SHA-256 `454bd71df901d53cd87b55fa63f728b62a11e8ab79d8cbcbad7faf7d2456afec`, reading-copy SHA-256 `4fcfe968349063ded85619aa2b7603a4a9d84890799ea7245d60beb87a7f77b8`, one-based inclusive lines [[1, 148]].

`wh-access-618797612`: [dbo.wm_UReceiptInterfaceBatch](sql/618797612.sql); source-definition SHA-256 `535d325b205407dba77f0931d69e972dbdadcf99aa450a1654ba0f3bba9f5caf`, reading-copy SHA-256 `7e98c8d3e150f3edb7a4e1fc0a57bef3acb60e75aed1f547be66296c8df20a20`, one-based inclusive lines [[1, 14]].

</details>

<a id="warehouse-container-tree-scope"></a>

## Why can a receipt container tree include other batch roots?

The recursive receipt export has an anchor where every NULL-parent container qualifies. Its batch restriction applies to the zero-parent alternative and to recursive children. This can include roots outside the requested batch. Other container lookups read immediate children only, and shipping roots require NULL rather than the receipt rule of NULL or zero.

### How it works

1. Separate a root-selection predicate from recursive child selection.
2. Apply AND-before-OR precedence to the captured anchor.
3. Treat tree output order as a text path order, not numeric container ordering or a cycle guarantee.

### Settings and prerequisites

- The output uses fixed receiving-interface-batch, new-action and processed-condition labels and a slash-separated tree path. The projected UTC stamp is rounded to seconds. These are returned interface labels, not writes to the source container rows.


<details>
<summary>Technical reference and sources</summary>

`wh-access-1319324110`: [dbo.wm_RReceiptContainer03](sql/1319324110.sql); source-definition SHA-256 `5615321aa51fcfc9f83a81efafd9c0bf40a5b6b60d42b70edcdb1c667f8c154e`, reading-copy SHA-256 `310a06378662bd15c0881bb1c6dda642ff84d8dfecacb5055d45e5c4b539b0d7`, one-based inclusive lines [[1, 17]].

`wh-access-1335324167`: [dbo.wm_RReceiptContainer04](sql/1335324167.sql); source-definition SHA-256 `b57b8b05948d3ad4b744dc2ebb0156df252da077404de0b0be2827fd29eb5448`, reading-copy SHA-256 `93f28e1ac7e1843a5ec27c9fbbd3922bf63f61de20512d1e6a29cc686a804690`, one-based inclusive lines [[1, 18]].

`wh-access-1639325250`: [dbo.wm_RShippingContainer04](sql/1639325250.sql); source-definition SHA-256 `1cde22ea8a3e3c770e1eba75d0035b47eb5b7141871f72fca9a4a9572d08d7cf`, reading-copy SHA-256 `912b7d948a6059c8fc656dcc1191fabfcc22c599d6f7acb49e49df71854dc4f9`, one-based inclusive lines [[1, 22]].

`wh-access-1655325307`: [dbo.wm_RShippingContainer05](sql/1655325307.sql); source-definition SHA-256 `9a05f5ed0a7c3ce5669c7a2614ec4b2e4df2a9314f4444572023f6f923918b3d`, reading-copy SHA-256 `0ec11a122b38b3346a3373c4285617e4c642770050d5a085dc1f098ca05a523d`, one-based inclusive lines [[1, 20]].

`wh-access-298796472`: [dbo.wm_RUReceiptContainer05](sql/298796472.sql); source-definition SHA-256 `2ea9347a7a42f8c1a926028cc9cbcfba0af697cb4c0b637c170c3a2528321b26`, reading-copy SHA-256 `0b47cacc34fd20613858d266716a3e795364b7dd276787bad3d8017662acb9d2`, one-based inclusive lines [[1, 280]].

</details>

<a id="warehouse-serial-archive-reading"></a>

## How are serial numbers combined with archives and uploads?

Some serial lookups read only operational rows; others combine operational and archive rows with UNION ALL. The latter preserve duplicates. Template-aware branches usually include no-template serials and template sequence zero. Upload context can select source serial IDs through upload records rather than returning the upload record itself.

### How it works

1. Check whether archives participate and whether the operation uses UNION ALL.
2. Check no-template and template-sequence-zero branches.
3. Keep upload-record identities distinct from original serial identities.

### Settings and prerequisites

- All four attribute-type selectors identify serial-number references in transaction history.


<details>
<summary>Technical reference and sources</summary>

`wh-access-1790277783`: [dbo.wm_RSerialNumber02](sql/1790277783.sql); source-definition SHA-256 `c625af79ce03aed899ab40de39620ba5022f0a79f5d3fdd541bb6a6b7d64a037`, reading-copy SHA-256 `2d565d7a778f0b6725a4eb9f2b40a38c4daa3e28b148835fcd52f3de33ba28e0`, one-based inclusive lines [[1, 28]].

`wh-access-1854278011`: [dbo.wm_RSerialNumber06](sql/1854278011.sql); source-definition SHA-256 `1e4cccf8c73bb4a5e4b043765be5e152578b1a331d16dc5f791ccff20cba3fed`, reading-copy SHA-256 `dc649660ec1e333b38405e29d05f0c4e53878620741615dfabbfb786110d9a41`, one-based inclusive lines [[1, 43]].

`wh-access-1870278068`: [dbo.wm_RSerialNumber07](sql/1870278068.sql); source-definition SHA-256 `983a0bb38735f4261280229197222b17d38ccbb4c2ac877de074f0c687bd64c3`, reading-copy SHA-256 `d6a59bded643ee7b3a1b3997d845772969e8cddca0f0b1e2e6914d98ee8d4492`, one-based inclusive lines [[1, 24]].

`wh-access-1886278125`: [dbo.wm_RSerialNumber08](sql/1886278125.sql); source-definition SHA-256 `3fb61e191a079cb6887285f2846eccdd45681e0305f62c65ed71f3207a3220ab`, reading-copy SHA-256 `e6c332f4540e9a4a5771ef63eb162682bff31160625b03ec09d8a4bdce14aff6`, one-based inclusive lines [[1, 49]].

`wh-access-1902278182`: [dbo.wm_RSerialNumber09](sql/1902278182.sql); source-definition SHA-256 `860ffcc5956b7e50a61b1fbdbf7ac450a434736f61e8cb408bb8dfb107d62e12`, reading-copy SHA-256 `9830414e877e3e2bc8e578c8046aff6abede28b1c9542e58e7c004ebfbffb0c7`, one-based inclusive lines [[1, 40]].

`wh-access-1918278239`: [dbo.wm_RSerialNumber10](sql/1918278239.sql); source-definition SHA-256 `4d94faaaf51cef20bf3ec739abca5042be9342d4b72667c1e8e2a521143731d2`, reading-copy SHA-256 `dc801f6629280a53cb45c14945dd11395aaf994bbfa013b4a610829daf4ba66b`, one-based inclusive lines [[1, 89]].

`wh-access-1934278296`: [dbo.wm_RSerialNumber11](sql/1934278296.sql); source-definition SHA-256 `42e979211bc937f9594265843785b9f6672ca2f95aef8590b1572567995d0ff8`, reading-copy SHA-256 `9a9b91f338ae48572df5ef48cf081ddcf5c467437ca80f0389d0f7c23cedbfba`, one-based inclusive lines [[1, 52]].

</details>

<a id="warehouse-inventory-attribute-resolution"></a>

## How are inventory attributes resolved across history and upload?

Attribute reads can use operational, archive or upload context. The history lookup combines selected operational/archive attribute columns before joining history links. The upload helper writes matching attribute rows and then deletes a caller-selected upload row even if no replacement matched; that is a mutation with separate statements.

### How it works

1. Identify whether the source is operational, archive or upload data.
2. Distinguish an operational-first fallback from a union of sources.
3. Review the insert/delete helper as a multi-statement change with possible zero or multiple replacement rows.

### Settings and prerequisites

- All 44 ISNULL replacements use the same one-character sentinel. Each pair matches two NULL values, or NULL to that sentinel value; empty strings remain distinct.
- The transaction-history attribute selector identifies inventory-attribute references.


<details>
<summary>Technical reference and sources</summary>

`wh-access-638273679`: [dbo.wm_InsertLocationInventoryAttributes](sql/638273679.sql); source-definition SHA-256 `b31581673601826fecd5b28559a8bfeea8d3bc6f61139f88205ba1cb70008f67`, reading-copy SHA-256 `d27373a1ebdf90696641227213db0ce93a62d7319ae0f925b7b4c206e34e484b`, one-based inclusive lines [[1, 135]].

`wh-access-1422276472`: [dbo.wm_RLocationInventoryAttributes01](sql/1422276472.sql); source-definition SHA-256 `c4ddde67312621a2640edde82ec4bef47c0652bb38647c755facdb62f89c5076`, reading-copy SHA-256 `ff776e9e157f0f5cc511daf2fc89cdbf1fb551db6b025bb509d42218ab976e55`, one-based inclusive lines [[1, 22]].

`wh-access-1454276586`: [dbo.wm_RLocationInventoryAttributes03](sql/1454276586.sql); source-definition SHA-256 `63e7a295cb8d0a90aa10293d55c8b5a1fe9ea50488ae9004a9d1d0e55c189c91`, reading-copy SHA-256 `e0b8e92663e457783bf0c31c68e5da7b0ec275a0ee527ccbe1d391730e89fca9`, one-based inclusive lines [[1, 27]].

`wh-access-1470276643`: [dbo.wm_RLocationInventoryAttributes04](sql/1470276643.sql); source-definition SHA-256 `4c14a825be1b0297a95d62adedd0113e761873e83176350e52f0bc5f64b1fbdd`, reading-copy SHA-256 `d1f225d1624e672f04c898d4bba7c412b73b8dfb93a46b590e71c2908e1fefbb`, one-based inclusive lines [[1, 15]].

</details>

<a id="warehouse-shipment-upload-context"></a>

## Why does shipment lookup return an upload copy?

Shipment lookup context can be controlled by interface link or by a positive trailing-status input. Positive status switches several header routines to upload order headers; zero, negative or NULL switches them to operational shipment headers. Operational and upload detail filters are not always the same.

### How it works

1. Identify whether context is selected by interface link or trailing status.
2. Check warehouse, company and excluded-closed-status restrictions for that exact variant.
3. Do not infer an operational status transition from a read of an upload copy.

### Settings and prerequisites

- The fixed interface condition denotes system-deletion upload records.


<details>
<summary>Technical reference and sources</summary>

`wh-access-1479324680`: [dbo.wm_RShipmentDetail01](sql/1479324680.sql); source-definition SHA-256 `0124afd264304c7c3d7751ed1e145fc616c77b5467e70d801adddd8788c9d869`, reading-copy SHA-256 `18abc6e8641aaa60e8e9ec218aa4f5f7b879d3e0818ff8fb19d822ad76ada5f0`, one-based inclusive lines [[1, 20]].

`wh-access-1511324794`: [dbo.wm_RShipmentDetail03](sql/1511324794.sql); source-definition SHA-256 `13985fd1478e74ea1bf4a718cc360b9df337c3d561144c3148b75eb735e47240`, reading-copy SHA-256 `6f7d5ed6dd57f37bdc8de97c15cdcdfc4208646bf9def4cc16b16211c437ac7f`, one-based inclusive lines [[1, 27]].

`wh-access-2062278752`: [dbo.wm_RShipmentDetail04](sql/2062278752.sql); source-definition SHA-256 `fd9f25e72ee627628b80661bf1e988837c2acc48bec7800990b6d5495479a920`, reading-copy SHA-256 `8610899bdd4f8dc010c5fa966e6d5c3826a433d93c2f9bd79a98abe71c73069a`, one-based inclusive lines [[1, 32]].

`wh-access-10795446`: [dbo.wm_RShipmentHeader01](sql/10795446.sql); source-definition SHA-256 `fea4a5d0e2d18128ea587176fad0161b0f44258a983552d874443f7892036c94`, reading-copy SHA-256 `dec1cf0cd2cfa234fbff5f46ad93790dcbac862676de2240ed799952be5a6738`, one-based inclusive lines [[1, 26]].

`wh-access-26795503`: [dbo.wm_RShipmentHeader02](sql/26795503.sql); source-definition SHA-256 `0ba056a43d479f09249280b432874bc9b6437ba8517f41d9715d1f5d88984cc7`, reading-copy SHA-256 `8ef5f4e9ba31243b4d27223872d6ecf5d8ea40e13d0400f5585f44cd31aa4881`, one-based inclusive lines [[1, 23]].

`wh-access-42795560`: [dbo.wm_RShipmentHeader07](sql/42795560.sql); source-definition SHA-256 `072879e97eb61e9eff6cc23c080327f783de3d9d2b6e6733a2d070ca6f017697`, reading-copy SHA-256 `1e85f409844d7e5cf64b000c53372b6d8eff5d882ed0b2ca7f1b49528f40d04a`, one-based inclusive lines [[1, 23]].

`wh-access-1575325022`: [dbo.wm_RShipmentHeader10](sql/1575325022.sql); source-definition SHA-256 `27406d6fe5317ce6c64f852e8e5bbcfcb15e70df168b34872ffd317c6855b2a6`, reading-copy SHA-256 `7ea852e78530da85ab9a7f95b3765ca07b91c68ee2641a3f58c478d896f350cb`, one-based inclusive lines [[1, 25]].

`wh-access-1767325706`: [dbo.wm_RUploadOrderHeader01](sql/1767325706.sql); source-definition SHA-256 `a49016103888bc154292eb9ae05788281403595e1122150927f6de810d277a2d`, reading-copy SHA-256 `761c59cf9e0f4ba391efb6bb7662377d2eadaa6e240e31b0956e559578408342`, one-based inclusive lines [[1, 15]].

`wh-access-1570104634`: [dbo.wm_RUploadOrderHeader02](sql/1570104634.sql); source-definition SHA-256 `b5b42afbcbbf1ba3c0669a9ebf1dcbbb44a2fc1f139623ad4f7fcdc8e5f234d1`, reading-copy SHA-256 `1d95570e17c3ba0ffed53c868b9f782205c0a8ccabc210214c527cd4aca3b48f`, one-based inclusive lines [[1, 16]].

</details>

<a id="warehouse-shipment-batch-claim"></a>

## Can shipment batch selection overwrite an existing marker?

The status-based batch selector first captures eligible unbatched shipment IDs, then marks them. The wave-based selector overwrites the batch on all headers for the wave without checking an existing batch. Both return all headers with the supplied batch, which can include earlier rows if the batch ID is reused.

### How it works

1. Distinguish status/load eligibility from the wave-only update.
2. Keep selection time separate from update time for the status-based routine.
3. Treat resetting a marker as a separate update, not proof that external delivery completed.

### Settings and prerequisites

- The excluded IN_CONFIRMATION selector is affirmative. NULL load confirmation fails the inequality, and shipments lacking a matching shipping load fail the inner join.
- The fixed process-stamp value identifies this reset procedure rather than preserving the prior caller process stamp.


<details>
<summary>Technical reference and sources</summary>

`wh-access-2082106458`: [dbo.wm_RShipmentHeader05](sql/2082106458.sql); source-definition SHA-256 `188a74612c50191117c6389a2640d09e5f191189c368ad036ff797c5965f7a66`, reading-copy SHA-256 `d030a657403ffae180558e52823861774c4e29a8524749d821bdf2bf9a1a5f3b`, one-based inclusive lines [[1, 16]].

`wh-access-362796700`: [dbo.wm_RUShipmentHeader01](sql/362796700.sql); source-definition SHA-256 `f92c971152f7344666dc342ba35eddace8bc23e5043a5030897cb35f209923bf`, reading-copy SHA-256 `aa37bbe662648c8e48bfeda219512e9dcf2ebef9d133e2d3ef528aeb967ee89a`, one-based inclusive lines [[1, 32]].

`wh-access-378796757`: [dbo.wm_RUShipmentHeader02](sql/378796757.sql); source-definition SHA-256 `04c0760f00d5f3bd7f006528e39bf7dee407da986677b43ed712dd90e74d2663`, reading-copy SHA-256 `23d39a9205277f608f93b795acc3b718ad31b32da1a085fd1ff90c14e2e0cca5`, one-based inclusive lines [[1, 22]].

`wh-access-698797897`: [dbo.wm_UShipmentHeader02](sql/698797897.sql); source-definition SHA-256 `35e2902d3b3b7638b587b338703fa39978eb0315b02a91b9edda6d5f60d6d1d6`, reading-copy SHA-256 `e53cb59a79d1161b66b08378c24e58f3c2046128d042e95c7c2281156d938cc6`, one-based inclusive lines [[1, 13]].

</details>

<a id="warehouse-download-item-claim"></a>

## How are downloaded items claimed for processing?

Item claim routines change ready or NULL processing conditions to in process and attach a process stamp before returning records. Variant 02 limits its candidate IDs in order and also reports whether ready records remain. A later routine marks every row for a stamp processed. Reusing or omitting stamps can make selection misleading.

### How it works

1. Provide distinct caller context when assessing a claim; the body does not validate stamp uniqueness.
2. Separate the candidate limit from the rows returned for an already-used stamp.
3. Interpret the remaining-record result as a global readiness check, not a processing-success result.

### Settings and prerequisites

- Variant 02 selects TOP MaxRecords candidate IDs ordered by INTERFACE_RECORD_ID. Its dynamic UPDATE binds condition and process stamp, while the numeric limit is inserted as text; negative or NULL limits have no explicit handling.
- Returned rows exclude Processed records and include an item-download record marker. AreRecordsRemaining returns a string-valued affirmative/negative digit for any ready or NULL-condition row.
- Marking a stamp Processed updates all rows for that stamp, regardless of their previous state.


<details>
<summary>Technical reference and sources</summary>

`wh-access-202796130`: [dbo.wm_RUDownloadItem01](sql/202796130.sql); source-definition SHA-256 `0481d364c1d5dfa9f69c2f5210e91dd7be58f4dbd87e9a84c31080762a5dd2ba`, reading-copy SHA-256 `bb729f29a111e3b1151718bbb0c10a5c5a2fed2e22c06ab26f2766f0d0db9c11`, one-based inclusive lines [[1, 32]].

`wh-access-218796187`: [dbo.wm_RUDownloadItem02](sql/218796187.sql); source-definition SHA-256 `d3c4dc47d509aff7982a0cedfde1a3664a003dc8637ede157efb6bd7d0b6446f`, reading-copy SHA-256 `fc8951b193e915c05e3a77a8a9414f5b3d4bd8252b1d4ec973227aa6b63527ca`, one-based inclusive lines [[1, 51]].

`wh-access-1911326219`: [dbo.wm_UDownloadItem01](sql/1911326219.sql); source-definition SHA-256 `aa51da01a60ebe04171beb023b292c015ca825eefcea8504a95b892f6bdcdc3d`, reading-copy SHA-256 `e07359b044bae664682da133028208d9fd557cd52dc55ef47c6f15c83b1e8ecf`, one-based inclusive lines [[1, 17]].

</details>

<a id="warehouse-download-order-family"></a>

## What is included in a downloaded order family?

Order claims can mark headers, details, containers, comments and VAS records, then return separate record sets. Linked children can make the returned family larger than the requested root limit. The processed, error and reset routines have different guards; one processed routine deliberately skips records still marked in process, and another omits VAS records.

### How it works

1. Read the exact root and orphan selection rules rather than assuming every link points to a header.
2. Count the six data result sets separately from the remaining-record indicator.
3. Choose the documented status-update contract; similar routine suffixes are not interchangeable.

### Settings and prerequisites

- Processing conditions: ready or NULL records are claimed as in process; linked-header/detail eligibility and returned rows exclude processed and error conditions. Six leading markers distinguish shipment header, detail, container, comment, header VAS and detail VAS records. Header VAS uses ERP line NULL or nonpositive; detail VAS uses positive line.
- Claim stage order is order header, orphan detail, orphan container, orphan comment, orphan VAS. Each TOP subquery is ordered by INTERFACE_RECORD_ID and selects ready-or-NULL rows; only the header lacks orphan tests. Container orphan conditions are NULL link OR link absent from headers OR link absent from containers OR parent link absent from containers. Comment/VAS orphan tests use OR across absent header/detail. All stages mark in process; returned rows exclude processed and error. The aggregate uses UNION of table counts, so equal count values deduplicate, but the final greater-than-zero test still expresses whether any included count is positive. No SQL error recovery validates the budget or stored condition values.
- The assigned condition denotes processed, while rows currently in process are excluded. NULL current condition is also excluded by inequality. This is not an in-process-to-processed transition.
- The assigned condition denotes processed; every stamp-matching row in its four target tables is eligible.
- Only error-condition rows for the stamp are reset to NULL, enabling later ready-or-NULL claim logic. This body does not clear the process stamp.
- Only in-process rows for the stamp are changed to error condition.


<details>
<summary>Technical reference and sources</summary>

`wh-access-234796244`: [dbo.wm_RUDownloadOrderHeader01](sql/234796244.sql); source-definition SHA-256 `b694675765365f3d3d777111a525b0333b4a5c432433bc382303c44b912924bf`, reading-copy SHA-256 `01a61db4b5779d3403fa1df927382adb936d83c25b36dade7497367130ead7b9`, one-based inclusive lines [[1, 162]].

`wh-access-250796301`: [dbo.wm_RUDownloadOrderHeader02](sql/250796301.sql); source-definition SHA-256 `1cfe27215a2d90d97ac2c1a01d30f88b94b86546a65d56460d8ca03c49bc26d4`, reading-copy SHA-256 `db06daa3a43db5e7f77a5f40c94a4de7e63fca981d7eac3c866e8d469bb7d515`, one-based inclusive lines [[1, 313]].

`wh-access-1927326276`: [dbo.wm_UDownloadOrderHeader01](sql/1927326276.sql); source-definition SHA-256 `e76a0399e40cb6ac69b5229d1f0ca1f22d53d12ac3e50bf940ca05584fcf1703`, reading-copy SHA-256 `0319c8f3a6083135c0ace8cced9b44db1ec0e8d0d9c2cbd142b5b603e31558d0`, one-based inclusive lines [[1, 45]].

`wh-access-1943326333`: [dbo.wm_UDownloadOrderHeader02](sql/1943326333.sql); source-definition SHA-256 `8cb58cec7e599bf15f5036aad781e4c8f49b682feb2aefbaf40791433a5a0842`, reading-copy SHA-256 `99d93646bcd8723763a8e222b0e1552fd19cee42c68ad5392a807648d3580299`, one-based inclusive lines [[1, 35]].

`wh-access-458797042`: [dbo.wm_UDownloadOrderHeader03](sql/458797042.sql); source-definition SHA-256 `d058d1988a3694ba9b0762d173619f32d11fce02e0162cbe47cda19978048461`, reading-copy SHA-256 `a6079b3984a4a9a682bfb7c31a06c523a6e021935554e38542bb1557f77507e0`, one-based inclusive lines [[1, 44]].

`wh-access-474797099`: [dbo.wm_UDownloadOrderHeader04](sql/474797099.sql); source-definition SHA-256 `7cfcc7325acc54dd6b94e11ebc621a6d4cbcf020016cd94847a3f7aedff86f1a`, reading-copy SHA-256 `10f36b3c513741ded06267311a51b5d8c0da19a53e3562663cad5c878279c2ce`, one-based inclusive lines [[1, 44]].

</details>

<a id="warehouse-download-receipt-family"></a>

## What can the receipt download remaining flag miss?

Receipt download claims include purchase-order and receipt records, containers, serials and appointments. The limited variant returns seven data sets, but its remaining-record flag checks only five receipt-side tables. Ready purchase-order rows can therefore remain without making that final flag positive.

### How it works

1. Distinguish the seven returned record families from the five tables used for remaining-work detection.
2. Review appointment link-type filters at the stage where they actually appear.
3. Keep these database marker changes separate from receiving inventory or confirming external delivery.

### Settings and prerequisites

- Ready or NULL-condition rows are marked In Process. Results and most parent eligibility exclude Processed, without the order family's extra Error exclusion. The seven outputs identify purchase-order header/detail, receipt header/detail/container, serial and appointment records.
- Limited selection proceeds through purchase-order header, orphan purchase-order detail, receipt header, orphan receipt detail, orphan receipt container, orphan receiving appointment, then orphan serial. Each TOP candidate set orders by INTERFACE_RECORD_ID.
- Container orphan detection uses OR between its receipt-header/container absence checks; serial detection uses AND between receipt-header and serial-table absence checks. Propagated appointments do not repeat the candidate stage's receiving-link filter.
- The final flag combines counts with UNION. Equal counts may collapse, but this does not change whether any checked table has remaining rows.
- The later completion updates use Processed; appointment updates additionally require the receiving link type.


<details>
<summary>Technical reference and sources</summary>

`wh-access-266796358`: [dbo.wm_RUDownloadReceiptHeader01](sql/266796358.sql); source-definition SHA-256 `a7c0b80d20999809d02df268cd010036560a1175067d1b28b6651e480587377c`, reading-copy SHA-256 `fc31dde01c1d5828a012d7773c4fa00799915ca45f582c013652b9a8fb278419`, one-based inclusive lines [[1, 149]].

`wh-access-282796415`: [dbo.wm_RUDownloadReceiptHeader02](sql/282796415.sql); source-definition SHA-256 `648d41b1389bca28b2af1a67aac280c09df55a5979374df476e2a5e2a351c6ce`, reading-copy SHA-256 `398653ec4df1003d103aae9d2078f985235f6937efde21b50ed8492434a110e4`, one-based inclusive lines [[1, 323]].

`wh-access-490797156`: [dbo.wm_UDownloadReceiptHeader01](sql/490797156.sql); source-definition SHA-256 `1a08ceea9b5f8f13583c398a31a665b5352078de11abc4d61ab7fea58c6a50fe`, reading-copy SHA-256 `706daeb42c834cfcb22f8e8d66fe7a443b037e19f0fc0cc9fecdeb547d67bd7f`, one-based inclusive lines [[1, 55]].

</details>

<a id="warehouse-inventory-balance-variants"></a>

## Why can inventory export include zero balances?

Inventory variant 01 returns eligible nonzero location balances. Variant 02 adds zero-balance rows for item/company and warehouse combinations with no eligible nonzero inventory. That added branch is not filtered by the optional criteria applied to existing inventory. Neither base query automatically restricts rows to the warehouse used for date calculation.

### How it works

1. Compare the nonzero-balance branch with the synthetic zero-balance branch.
2. Check location-class exclusion and the four quantity tests.
3. Apply filter scope separately: the date warehouse is not an automatic row warehouse filter.

### Settings and prerequisites

- Query behavior: read LOCATION_INVENTORY left joined to CATCH_WEIGHT_INFORMATION by internal location-inventory ID. Exclude location classes whose generic configuration disables inclusion; require at least one non-NULL, nonzero allocated, on-hand, in-transit or suspense quantity. Add location and inventory-attribute left joins only when nonempty extracted filter criteria exist. The optional criteria are enclosed in parentheses. Return 48 expressions in the listed order, including internal identity twice (first under its own name and later OBJECT_ID), a newly generated UTC stamp, catch weight and catch-weight unit. Order by INTERNAL_LOCATION_INV. The warehouse input supplies only WarehouseDate for use by optional filter text; the base query has no warehouse equality predicate. Blank or missing filter criteria skip the extra filter, while multiple named configuration rows cause the scalar subquery to fail. Text after the first WHERE marker is used; absent markers are not explicitly rejected. The filter content is dynamic syntax rather than a parameter value.
- Query behavior: use the same nonzero location-inventory eligibility and location-class exclusion as variant 01, projecting 47 fields with OBJECT_ID first and no second internal-identity column. Append UNION ALL synthetic zero-balance rows from ITEM cross joined with every WAREHOUSE when no eligible nonzero inventory exists for that item, normalized company and warehouse. Synthetic rows take item descriptive/user fields and warehouse code, zero quantities/cost/value/volume/weight, fresh UTC timestamp and NULL location/attribute/catch-weight fields. The optional stored filter is applied only to the first inventory branch, not the synthetic branch or its NOT EXISTS test. There is no final ORDER BY, item/warehouse ACTIVE restriction or direct filterWarehouse equality. The normalized company comparison equates NULL with its fixed single-character sentinel.


<details>
<summary>Technical reference and sources</summary>

`wh-access-1262275902`: [dbo.wm_RInventory01](sql/1262275902.sql); source-definition SHA-256 `388bf2fb844dea9d364e52d496ebc55224bb9e802b798f7139202733ab88822a`, reading-copy SHA-256 `63da859bd38f50e0d43fade7c99cb92fd67fde6cb7921be3ca75fa03831bfbe1`, one-based inclusive lines [[1, 113]].

`wh-access-1278275959`: [dbo.wm_RInventory02](sql/1278275959.sql); source-definition SHA-256 `e65fc078c83708ba673f822f136d8419f0e9e6f326433cdd69f29032c56a82f5`, reading-copy SHA-256 `08c7a8063aff6f00d4ea08fc330d677d5bfb77df6f6975bf1793ef7123ec50d7`, one-based inclusive lines [[1, 181]].

</details>

<a id="warehouse-master-insert-validation"></a>

## Do item and lot inserts validate business rules?

These insert routines store the supplied item, unit, lot, attribute or serial values. Their bodies do not perform the broader template, conversion, expiration or uniqueness checks that a caller may need. Several return a new identity, but the item cross-reference and unit inserts have unused identity-named inputs and return no generated identity.

### How it works

1. Read parameter types and declaration defaults separately from table constraints.
2. Check whether a generated identity is actually assigned to an OUTPUT parameter.
3. Keep database insertion separate from application-level business validation.

<details>
<summary>Technical reference and sources</summary>

`wh-access-558273394`: [dbo.wm_IItem01](sql/558273394.sql); source-definition SHA-256 `9b09fad688ef0f2cbace0d3f535e2e193d106ca6a5f0c764939b02de34062004`, reading-copy SHA-256 `d564bc57c897e61fb4948d63a2530fd5ae853c23a7761532cd981d63dbc519d9`, one-based inclusive lines [[1, 260]].

`wh-access-574273451`: [dbo.wm_IItemCrossReference01](sql/574273451.sql); source-definition SHA-256 `859785406fb7282d9d8577512022643d92b7ffa555238c43c5d029ec90135ed1`, reading-copy SHA-256 `f5df85fd2a8c0eda59b8b1aa7bfd7ce6dcd75c7fa86547ecf764b4bacdeef9da`, one-based inclusive lines [[1, 70]].

`wh-access-590273508`: [dbo.wm_IItemUnitOfMeasure01](sql/590273508.sql); source-definition SHA-256 `f2df23871927c54ea6dd6af7644018bd7a0a2ff0a09b504107bdd4ef8d922c97`, reading-copy SHA-256 `1e7a9108c3110b60c12f4505f152f4a5f98e38c87ea6a91b82f061feccb9fcef`, one-based inclusive lines [[1, 110]].

`wh-access-606273565`: [dbo.wm_ILot01](sql/606273565.sql); source-definition SHA-256 `e8cb4dce568aa06ab75dda7dcaddd1bf6d5e210829eb8fc767f6d42e2ffb1242`, reading-copy SHA-256 `12621366289ea80b1af3917181b8b313572cc662ed5ecdbf9b1045775d9d5b38`, one-based inclusive lines [[1, 70]].

`wh-access-622273622`: [dbo.wm_ILotAttribute01](sql/622273622.sql); source-definition SHA-256 `ccf762ab33c59a20163d5becc02a4b2e910f814505156cb86023398236ccec85`, reading-copy SHA-256 `1a4168d05210b57adcf0b203f88bbfd7c4175990eae6e9c1f89d4f1f4304ce20`, one-based inclusive lines [[1, 58]].

`wh-access-798274249`: [dbo.wm_ISerialNumber01](sql/798274249.sql); source-definition SHA-256 `fd473c4f8371dd32860061dc30868d21aa87c67297dcc8b7df04607e60777707`, reading-copy SHA-256 `039b15127e01a5ffbe14459def434b7ae5b9580ce58a7c8da74336f1386bed8d`, one-based inclusive lines [[1, 71]].

</details>

<a id="warehouse-broad-update-null-behavior"></a>

## Do update routines preserve fields when NULL is supplied?

Most listed fields are replaced directly, including NULLs; these are broad updates, not partial patches. Exceptions are explicit: order-header NULL order date reuses its old value, shipment detail NULL export fields fall back to a header, and shipment-header load zero becomes NULL. Insert and update parameter sets also differ.

### How it works

1. Identify exactly which columns the chosen update assigns.
2. Apply only its explicit fallback rules; do not generalize one exception to other fields.
3. Check omitted update columns and the lack of an old-version predicate before assuming an unchanged record.

<details>
<summary>Technical reference and sources</summary>

`wh-access-506797213`: [dbo.wm_UOrderDetail01](sql/506797213.sql); source-definition SHA-256 `9dc4a9a23c1f536cca320eb1c6223bbaeeb26dc700bf1fe4c3cfe6b221ead8fc`, reading-copy SHA-256 `2cc43996891fcc2a56809635f7f379f74149caec494315681b93a3232cbfe062`, one-based inclusive lines [[1, 270]].

`wh-access-522797270`: [dbo.wm_UOrderHeader01](sql/522797270.sql); source-definition SHA-256 `e010ae5cd8d70bee18e112f9d63bb0d6acd62483318be1fc6bb64c4ab7b80cd5`, reading-copy SHA-256 `3d0dc88a3c40490f64951cb9cfce6d6f1b21db4f9be69d3634d4cb4176d4a915`, one-based inclusive lines [[1, 251]].

`wh-access-570797441`: [dbo.wm_UReceiptContainer01](sql/570797441.sql); source-definition SHA-256 `2370b64f78d2c7c9d295787ae41d8fdc4aa8f7ff868ddf4ebc20b02d94025cb5`, reading-copy SHA-256 `09185012d9006c7cdbbae658068b96a2d39958b966d7e087cd1aac374f5aaac3`, one-based inclusive lines [[1, 125]].

`wh-access-586797498`: [dbo.wm_UReceiptDetail01](sql/586797498.sql); source-definition SHA-256 `ea0966696619afe9c2db323b75cc22280076b5478bfacec0f6393315fe08a87a`, reading-copy SHA-256 `fdd611e09aa0d32f67934922bf7caa7ecdfe79c0c0141ea20d971ad186faa4f1`, one-based inclusive lines [[1, 179]].

`wh-access-602797555`: [dbo.wm_UReceiptHeader01](sql/602797555.sql); source-definition SHA-256 `4b0fd5c1c02fad4d6488f971621280cf611b2b06344adfb180b16154fc4d6339`, reading-copy SHA-256 `2aa02ec2347c7c2dc08f8212be50d02711cd5241b11cb2bbe9f7b454324fb6a6`, one-based inclusive lines [[1, 170]].

`wh-access-650797726`: [dbo.wm_UShipmentDetail01](sql/650797726.sql); source-definition SHA-256 `a951f773f7166f4a4a27e7e4406dbfa85258fa503a8e44ad0b699a4251b0eb20`, reading-copy SHA-256 `8f9dcfba3a631880ddd9e05a6792ba111534edeadce843389d9667bfef42adec`, one-based inclusive lines [[1, 332]].

`wh-access-682797840`: [dbo.wm_UShipmentHeader01](sql/682797840.sql); source-definition SHA-256 `c43a342ccae0e721c05ca72a58940376477deb2c75caab84c61eb90f0f0043fa`, reading-copy SHA-256 `af0b1e3940e72e90013c5a8e1c22fb6f5a69d1aee401afbd64660927200a0304`, one-based inclusive lines [[1, 325]].

`wh-access-730798011`: [dbo.wm_UShippingContainer01](sql/730798011.sql); source-definition SHA-256 `83c9ea247d28b260513786f126bb5ad53b58713d8aebf4f21d845875f0057885`, reading-copy SHA-256 `0490a2cb83dd98a148a35f6bd155f5c3be8ee652072fa89dc06126830caf5511`, one-based inclusive lines [[1, 151]].

</details>

<a id="warehouse-export-field-fallback"></a>

## Where do shipment-detail export fields come from?

Shipment-detail insert and update preserve non-NULL caller export fields. For NULL classification, validated license or expiration, they read the corresponding header fields by business shipment ID. The lookup does not restrict warehouse or company and has no ordering when several headers share that ID.

### How it works

1. Check whether each export input is NULL independently.
2. Read the header lookup key; internal shipment input does not narrow that lookup.
3. Do not treat copied values as export-license validation or regulatory approval.

<details>
<summary>Technical reference and sources</summary>

`wh-access-846274420`: [dbo.wm_IShipmentDetail01](sql/846274420.sql); source-definition SHA-256 `083878955ff2cb74f4752fe658075528cd12dc92809b0bfcc420bb1e8817bbf3`, reading-copy SHA-256 `487b2f87939490ac42223d202c14db2013b051f25157661916847af7f63a7ef6`, one-based inclusive lines [[1, 483]].

`wh-access-650797726`: [dbo.wm_UShipmentDetail01](sql/650797726.sql); source-definition SHA-256 `a951f773f7166f4a4a27e7e4406dbfa85258fa503a8e44ad0b699a4251b0eb20`, reading-copy SHA-256 `8f9dcfba3a631880ddd9e05a6792ba111534edeadce843389d9667bfef42adec`, one-based inclusive lines [[1, 332]].

</details>

<a id="warehouse-shipping-container-initialization"></a>

## How is a new shipping container tree identifier set?

The insert stores a QC status of zero and uses the supplied location when original pick location is NULL. If tree unit is NULL, it updates the new container to use its own identity. The captured insert trigger also initializes parentless NULL or negative tree units. The later broad update assigns tree unit directly and does not repeat the insert fallback.

### How it works

1. Separate insert-supplied values from the captured trigger effect.
2. Check the procedure fallback for NULL tree unit even on a child container.
3. Do not assume the update recalculates original pick location or QC status.

<details>
<summary>Technical reference and sources</summary>

`wh-access-910274648`: [dbo.wm_IShippingContainer01](sql/910274648.sql); source-definition SHA-256 `21161401feb735fb1943dda5041a497a46a1f9bd59bb604d4d46d62ff3a934fe`, reading-copy SHA-256 `e73572e377a75f0597e214147521718abd93cc8e100a0a92e751ae292439f79f`, one-based inclusive lines [[1, 235]].

`wh-access-730798011`: [dbo.wm_UShippingContainer01](sql/730798011.sql); source-definition SHA-256 `83c9ea247d28b260513786f126bb5ad53b58713d8aebf4f21d845875f0057885`, reading-copy SHA-256 `0490a2cb83dd98a148a35f6bd155f5c3be8ee652072fa89dc06126830caf5511`, one-based inclusive lines [[1, 151]].

</details>

<a id="warehouse-delete-and-count"></a>

## What does a delete affected-row count include?

Most delete routines remove rows from one table and return that statement count. Purchase-order-header delete first removes its details and then the header, returning the sum. The body does not wrap those two deletions in a transaction. Counts do not establish that all related records were cleaned up or that a whole business operation succeeded.

### How it works

1. Read the explicit target tables and their deletion order.
2. Distinguish the statement count from a sum across statements.
3. Account for constraints, trigger effects and caller transaction boundaries separately.

<details>
<summary>Technical reference and sources</summary>

`wh-access-279320405`: [dbo.wm_DOrderDetail01](sql/279320405.sql); source-definition SHA-256 `43d595a82c300147fa511daefdd7d3c3b23c55fb6354bf5cc420d91a2def3b77`, reading-copy SHA-256 `267fff0ab12b5d8ff3fe8dbbb2dc4ce41a8fcf3304847dabeb61d1ae5f99af40`, one-based inclusive lines [[1, 15]].

`wh-access-478273109`: [dbo.wm_DPurchaseOrderHeader01](sql/478273109.sql); source-definition SHA-256 `2b4f2dd8a57a368a65953a1b76c6aa014d469a71c3fda23be7e408d27e663064`, reading-copy SHA-256 `7421ee08afe3bb2a19db4d00b42f6867327ca62d04eaf73ec15de56e49590dc1`, one-based inclusive lines [[1, 23]].

`wh-access-311320519`: [dbo.wm_DShipmentDetail01](sql/311320519.sql); source-definition SHA-256 `6787200e34e9e7d14a35ac92f59e8fc36f448673c294b1af427d57b43b10826b`, reading-copy SHA-256 `2ae14b38ba371c0dbd72b5e7e3eb25a612d2170ee5a77b5e67062c944aa26b8b`, one-based inclusive lines [[1, 15]].

`wh-access-327320576`: [dbo.wm_DShipmentHeader01](sql/327320576.sql); source-definition SHA-256 `c8dd6d4cfcc665a022caed71d9d5a694a82320de85d0b050ccf8518e524043f3`, reading-copy SHA-256 `94e44df605d8d11ce982dfc09d4a7a535a786991eb812a17c62bda2a97d2f57f`, one-based inclusive lines [[1, 15]].

`wh-access-343320633`: [dbo.wm_DShippingContainer01](sql/343320633.sql); source-definition SHA-256 `f7f113156f0283392118d0fe43b43e293c452877a73b1905bc63c7cbc355c05d`, reading-copy SHA-256 `757ffdfe31092851ae370572c8c6bf4ac485737391c42c6189fbf5b143cbd8cd`, one-based inclusive lines [[1, 15]].

`wh-access-359320690`: [dbo.wm_DShippingLoad01](sql/359320690.sql); source-definition SHA-256 `3f3d3b490b0d7806eb2834b90aac20bb4a433ecd5f588e448dc497451a0fded0`, reading-copy SHA-256 `f8366e8d880c885b3f29541fe6e9b776e705bd08e66c9326b42a2d94d942ac22`, one-based inclusive lines [[1, 15]].

`wh-access-391320804`: [dbo.wm_DWarehouseAlert01](sql/391320804.sql); source-definition SHA-256 `69b2c6761cac26797c0b90ac6359280e678b55554b02ede9e075d166ce08f4ff`, reading-copy SHA-256 `f34353e41be82567b2d3f741bc43c5e16777108a23c8e1c3d41c7be368aae0cc`, one-based inclusive lines [[1, 15]].

</details>

<a id="warehouse-appointment-alert-storage"></a>

## Do appointment and alert routines complete an operational action?

Appointment routines store schedule values; the update can change every appointment for one internal receipt. Alert routines store definitions or request records, and process-history insert records a supplied message. These bodies do not send email, execute the named action or prove that work was completed.

### How it works

1. Separate a stored definition/request/history entry from execution.
2. For appointment updates, check the internal-receipt predicate rather than assuming one appointment ID.
3. Treat caller-supplied processed/closed fields as stored values until operational evidence establishes their meaning.

<details>
<summary>Technical reference and sources</summary>

`wh-access-526273280`: [dbo.wm_IAppointmentSchedule01](sql/526273280.sql); source-definition SHA-256 `824a5025746ae11888cb3fba1edfae0ee55505ecaa885b1fcb58798a9fc69292`, reading-copy SHA-256 `bd49f6634ce6fa8340a8962becd111d6bb612068791f65319f1b6e87cc0c74da`, one-based inclusive lines [[1, 62]].

`wh-access-702273907`: [dbo.wm_IProcessHistory01](sql/702273907.sql); source-definition SHA-256 `98bfe309e8e2a46ec49da6b1ce0c925c59858b90e03899fd263595c874b8ac92`, reading-copy SHA-256 `3608eedaa98d633b03ea6e090e17226e3f24d8fd9f8cfe6cf420db26e61dd1e0`, one-based inclusive lines [[1, 72]].

`wh-access-942274762`: [dbo.wm_IWarehouseAlert01](sql/942274762.sql); source-definition SHA-256 `884a2224fc447125ede5d0b069fa92bd3a1881f5624dfe183c8345947b6a33e6`, reading-copy SHA-256 `aaf54e0d3dc9720672006cbac19290fae82ca5de4777ae8f3a5f6841267be572`, one-based inclusive lines [[1, 74]].

`wh-access-958274819`: [dbo.wm_IWarehouseAlertRequest01](sql/958274819.sql); source-definition SHA-256 `c1f15668f4caec2605ceabafbf85cebc3606ccb72947c2d1983e9bfab3286697`, reading-copy SHA-256 `15274f2c3d88990def7ccaa0bffad41f5ee924a81ac62efed564da9884aaa4d7`, one-based inclusive lines [[1, 92]].

`wh-access-442796985`: [dbo.wm_UAppointmentSchedule01](sql/442796985.sql); source-definition SHA-256 `d37094b7432d2e1f30c5efcb82ff571032d3554f582f2928e65c800ae2fdad6b`, reading-copy SHA-256 `69166abe4f7351be779f1352b99eb75880290096b7a5f9cd18925f8e6ef09746`, one-based inclusive lines [[1, 47]].

`wh-access-778798182`: [dbo.wm_UWarehouseAlert01](sql/778798182.sql); source-definition SHA-256 `86dc02bf12a7060526a3b43d2b67914348dcb837de9a863b7cfc5f71ed483dfd`, reading-copy SHA-256 `e80addc5cdf6d6d259f36487353708f71817ce61a0a637e03175a2649c26a300`, one-based inclusive lines [[1, 57]].

</details>

<a id="warehouse-qc-resource-defaults"></a>

## When do packing and display defaults apply?

The outbound-QC lookup uses a user packing preference whenever that reference is non-NULL; a missing referenced preference does not fall back. Resource lookup gives matching custom keys precedence over base keys. Storage-template defaults apply to explicit NULL values, while missing configuration rows may simply produce no result.

### How it works

1. Distinguish a NULL setting from a reference to a missing record.
2. Check custom-key precedence independently of whether the custom text is populated.
3. Treat these as selection rules; no current effective user setting was queried.

### Settings and prerequisites

- NULL packing-preference selection uses the default packing preference. A non-NULL user reference retains precedence even when the target record is missing.
- NULL storage-template input uses the default template, but an absent template record returns no row.
- Item-class configuration also maps NULL SYS1VALUE to the default storage-template name.


<details>
<summary>Technical reference and sources</summary>

`wh-access-974274876`: [dbo.wm_OutboundQCScanMode](sql/974274876.sql); source-definition SHA-256 `6ced4c95fc0775c8c1ebaa726049157b01e41609bbeb635ee8f3f6d7fe125806`, reading-copy SHA-256 `7167640ad382033083cdcac41ecfbe9cee7d171d24859becb5b8d7150748f24c`, one-based inclusive lines [[1, 16]].

`wh-access-1447324566`: [dbo.wm_RResource01](sql/1447324566.sql); source-definition SHA-256 `0ed3a9addeb3fdde99eb299b5d542b7d77d6c0c9fb43c3192b6d2aab0843a120`, reading-copy SHA-256 `f28aec0ff4a3c3c7d2cd8e6566fe19fb6ee25ab1276140c3619051c163911aca`, one-based inclusive lines [[1, 20]].

`wh-access-1687325421`: [dbo.wm_RStorageTemplateDetail03](sql/1687325421.sql); source-definition SHA-256 `4626a63dd5cc28752023c412dd436f8eae143982478d384f84e504a2e5d3a36f`, reading-copy SHA-256 `9bc00803add01b09665cbf39c45d9e87ccb448dd1958063368749b6ca1dd91a0`, one-based inclusive lines [[1, 16]].

`wh-access-1719325535`: [dbo.wm_RStorageTemplateHeader02](sql/1719325535.sql); source-definition SHA-256 `67c7d3f0fb9f72313dd72f50cdf555c03095cca02f6bd57a76f09bc424e14ee8`, reading-copy SHA-256 `4e463011853151392840ec5eb903e4c6e60b314046a9ed97f2ca467410d81836`, one-based inclusive lines [[1, 17]].

</details>

<a id="warehouse-history-catch-weight"></a>

## How is catch weight added to transaction history?

The batch history read adds catch weight and unit from history attributes. Invalid numeric weight text becomes NULL, and multiple weights/units are reduced using separate maxima. This can select a weight and a unit from different attribute rows. The general candidate reader uses configured transaction types and additional adjustment-type gates.

### How it works

1. Separate candidate selection from reading an already-marked batch.
2. Inspect numeric conversion and independent aggregation of weight and unit.
3. Do not infer history mutation or completed external delivery from the returned rows.

### Settings and prerequisites

- Upload-enabled transaction-type configuration determines candidate eligibility. Types matching the 40, 50 or 60 prefix families additionally require INCLUDE_IN_INTERFACE_UPLOAD on the adjustment-type reference.
- Catch-weight text is converted with TRY_CAST to numeric(14,5).


<details>
<summary>Technical reference and sources</summary>

`wh-access-1730105204`: [dbo.wm_RTransactionHistory01](sql/1730105204.sql); source-definition SHA-256 `b1a9a6dc71687c16644352c192e8941b0ef54906bafc50373845b344fd516c8a`, reading-copy SHA-256 `fc71681a10dae0a34ab2524488ea3778ce5a9a8a42ee3a4f48c7a71c72ae6e86`, one-based inclusive lines [[1, 33]].

`wh-access-394796814`: [dbo.wm_RUTransactionHistory01](sql/394796814.sql); source-definition SHA-256 `f0c4c8c009a04f0e9799463342769335f29379b0d0a56cf6846348611d39e9b8`, reading-copy SHA-256 `f20bc26258fe0ad5b39953d4cb6113e790a656ddddf993e3b12156ae9bef1869`, one-based inclusive lines [[1, 47]].

</details>

<a id="configuration-seed-preservation"></a>

## Why adding a default configuration may leave an existing value unchanged

Most reviewed configuration helpers insert only when their own duplicate key is absent. They preserve existing rows. Their keys differ, and the operational-goal helper inserts without a duplicate check. Registering a job, report, alert or interface does not run it.

### How it works

1. Identify the relevant configuration object and its exact duplicate key.
2. Separate storing a setting from running the configured action.

<details>
<summary>Technical reference and sources</summary>

`work-config-1676181367`: [dbo.dbc_IAccessorialDetail](sql/1676181367.sql); source-definition SHA-256 `30a9512cebca3ec8abb1232e91cf7a7ff220e1eb6afe42691f87e6fdc728712a`, reading-copy SHA-256 `78eb05468fa01a92748ff6249411b4d5b604f93ee3efb8d017cc09b2bd837fb5`, one-based inclusive lines [[1, 110]].

`work-config-1692181424`: [dbo.dbc_IAccessorialHeader](sql/1692181424.sql); source-definition SHA-256 `dc265d59188d51c51a8d2a1e1554eba56cc7138b4dd064969143e14ad513ca22`, reading-copy SHA-256 `1060948268cc9f29fef793fcbe43b11604f204b2dbe291d5e8c54554764a607e`, one-based inclusive lines [[1, 78]].

`work-config-1740181595`: [dbo.dbc_IAdjustmentType](sql/1740181595.sql); source-definition SHA-256 `fbf7213772090f62d947c646c58b424806ca542c97d1ddabffe1bfd6d1f1a74f`, reading-copy SHA-256 `378e167d678692adb6cdecf64a7c8d6458a30b788e25b091e7552190b93a7c0c`, one-based inclusive lines [[1, 89]].

`work-config-2055326732`: [dbo.dbc_IAppIdentifier](sql/2055326732.sql); source-definition SHA-256 `48b9be94867337567acf7c7e0a7064d5ba85040c807344f2523839b2f55462e0`, reading-copy SHA-256 `b074bc3ed1e0924edf052ccc885487b924b68815e5cced152cbb70b981484281`, one-based inclusive lines [[1, 74]].

`work-config-1772181709`: [dbo.dbc_IArchivePreferences](sql/1772181709.sql); source-definition SHA-256 `00009d469009ab5c8f5fdbb05a78be5a834ad3e0998c91649ac4c63cd0ae7689`, reading-copy SHA-256 `95c44d916b2f70b8c3c6db819fcaa7df4fce5649f78e2b992979c534fa5c7d82`, one-based inclusive lines [[1, 85]].

`work-config-1788181766`: [dbo.dbc_IArchiveSerialNumbersInShipLoad](sql/1788181766.sql); source-definition SHA-256 `1f6f9993d62909fe8faeaad3b5756fc59b62daf4ff44106ca70b6e6d5842287b`, reading-copy SHA-256 `727664c3b4275e80d28ee6b6cb3b15924f7e53c8ac2b217d2a554158e58f56b2`, one-based inclusive lines [[1, 35]].

`work-config-1804181823`: [dbo.dbc_IArchiveTables](sql/1804181823.sql); source-definition SHA-256 `bb97fe058ffd05712006aa2b1c2a663dd121a93b680b9b88d05c03cae1608eda`, reading-copy SHA-256 `8b9167d41b5aaa699439965d4f6d052d1a65378841bbd20066ae28fcd5f4e03d`, one-based inclusive lines [[1, 56]].

`work-config-1898802172`: [dbo.dbc_ICarrierEDIReference](sql/1898802172.sql); source-definition SHA-256 `a810a557241c5b28b04920cded471aa87a1891125c63e4700cc0d45789dd54ec`, reading-copy SHA-256 `8df247ca9299ca06a615ed87c9b74499584e33bc187ba35bee8ab09fec5988b4`, one-based inclusive lines [[1, 84]].

`work-config-1868182051`: [dbo.dbc_IDocument](sql/1868182051.sql); source-definition SHA-256 `2d40e9aa8b2a9162d41b24d5c0460bab7a9d3d556dc45e0e7a6aee33c4689663`, reading-copy SHA-256 `e139027f8ac43f757460ccd26e06afe8b91ccb3668764e3c274b22c9f58e283a`, one-based inclusive lines [[1, 92]].

`work-config-1930802286`: [dbo.dbc_IDocumentType](sql/1930802286.sql); source-definition SHA-256 `55cfb5b0a0a1e61ad63b3525a92bd9cfbca45fd5633256d6dd4946d2a21b8ccc`, reading-copy SHA-256 `fd78904ea6381ef9a853ebf37a75dae1b18cf350a647bbaeecf6b7babf305855`, one-based inclusive lines [[1, 101]].

`work-config-2028182621`: [dbo.dbc_IGenericAddressHeader](sql/2028182621.sql); source-definition SHA-256 `c569e01cce5927c877e7a75a6f9ce018db62cd61e8229cba80a0e66bbf3e1c76`, reading-copy SHA-256 `139b8cb9d58fbe2b7f3a883430de40c5aa703f5f2a9200e233ddf8c1d9014a95`, one-based inclusive lines [[1, 58]].

`work-config-2044182678`: [dbo.dbc_IInterfaceDataMapDetail](sql/2044182678.sql); source-definition SHA-256 `f529ba8181720b6d99f1f3fc92174ee9ba424240c1065d0716daf1605248f909`, reading-copy SHA-256 `f47bb0d000c107ef3912f5893f333fd095d62103dd87c8bb67e4c993c213c37f`, one-based inclusive lines [[1, 63]].

`work-config-2060182735`: [dbo.dbc_IInterfaceDatamapReqFields](sql/2060182735.sql); source-definition SHA-256 `00c4d0c5e031440cef28880a9649d00ad23e711e9f77e0c7a869f7dde94024a8`, reading-copy SHA-256 `fe9f44192031062fb3e6b61b99c24a80bfd1858e90b8dbc9cc9c380936706bf5`, one-based inclusive lines [[1, 71]].

`work-config-2076182792`: [dbo.dbc_IInterfaceDetail](sql/2076182792.sql); source-definition SHA-256 `ea8594c5c9f1e4a0aef0cc24bf9c89801895c20d29a1ea027cdff306b277762b`, reading-copy SHA-256 `8234f771238f3cc1c0626c0b9df438f8f0578720d07d35edb634f4520a88867e`, one-based inclusive lines [[1, 104]].

`work-config-2092182849`: [dbo.dbc_IInterfaceHeader](sql/2092182849.sql); source-definition SHA-256 `13234b29dcf17ba5c456c0c9263a16cfdacbfea56209b722658b2d798f3c0330`, reading-copy SHA-256 `4f1a4a76431a46c696800db33a53262d304fd56d700d2724038796201ddf1362`, one-based inclusive lines [[1, 58]].

`work-config-56699600`: [dbo.dbc_IMultiSegmentMappedFields](sql/56699600.sql); source-definition SHA-256 `cc3f4571cf7bcec6c84ed1569e3f41a225318f32634b0213d054d56024593938`, reading-copy SHA-256 `3174b8297b5f00c7b2dcada9710cff17f08e7a21b0f50e1842cebe6f40137050`, one-based inclusive lines [[1, 79]].

`work-config-72699657`: [dbo.dbc_INextNumber](sql/72699657.sql); source-definition SHA-256 `0bbae409bfa741021582d105da7e00d8990cb9725ec93712369549e7166f1efc`, reading-copy SHA-256 `d3045c7370191726b9250afc3560a78fa24d5b349a0b25e00d75a55a75882947`, one-based inclusive lines [[1, 66]].

`work-config-104699771`: [dbo.dbc_IOperationalGoal](sql/104699771.sql); source-definition SHA-256 `57db1b90d903597414c8b3204c20578bf548ef7a0363b87907bba53305d889fb`, reading-copy SHA-256 `66b849210bb412e31b41c2e6ffdf8d11e5bb82a2fa099aff223106ec15dce03a`, one-based inclusive lines [[1, 83]].

`work-config-120699828`: [dbo.dbc_IPmChartdata](sql/120699828.sql); source-definition SHA-256 `9482d51ed991cbf519190ebc410ac655f2901aeed04ee564a4c267d3058f2867`, reading-copy SHA-256 `88a2ff73410f201d1df27fa70a804affc448b6da4adac7c1b85cc49dcba7b853`, one-based inclusive lines [[1, 52]].

`work-config-184700056`: [dbo.dbc_IRatingId](sql/184700056.sql); source-definition SHA-256 `2c68e92f1b4979aa526903d98fe13fe981fb66b72a5751bde6c7786f21f3a593`, reading-copy SHA-256 `682ccfc74a0745f7b917d9fd19f278b31a4e77610d34558480c2deee36996340`, one-based inclusive lines [[1, 78]].

`work-config-200700113`: [dbo.dbc_IRatingService](sql/200700113.sql); source-definition SHA-256 `35fa46a60297de319df84ae0b6f94cb67bc674c73c46ec301bc2827fc56e2b2c`, reading-copy SHA-256 `48f25afd9be97d64f17393891b95387450f50e6322eb81eb3ede42a2b339a389`, one-based inclusive lines [[1, 62]].

`work-config-216700170`: [dbo.dbc_IRatingServiceAction](sql/216700170.sql); source-definition SHA-256 `70e1b6bae0f7a3da8411542384c42789593a85734aa28bb35c747b648a956817`, reading-copy SHA-256 `9642839aac3f004efbdbb0733d6084c0350df1852c1731959ccbd53b8b569558`, one-based inclusive lines [[1, 42]].

`work-config-232700227`: [dbo.dbc_IReportConnection](sql/232700227.sql); source-definition SHA-256 `af8a3d8654319f8bbb15ae6b75e618102d218a301f12bc23228228e3229ddd47`, reading-copy SHA-256 `fdce3dd52521dfd24557f190a7f3258103d0ec07f369bd236640c672247a4691`, one-based inclusive lines [[1, 69]].

`work-config-248700284`: [dbo.dbc_IScheduledJobs](sql/248700284.sql); source-definition SHA-256 `5ac85918ae985fa52f2e3687b152e4c8f840610dba941c523b5ba2e30d308879`, reading-copy SHA-256 `791790e5e81daa1c66142c0c40eb60a9ed06836fe02ee8c027c62d577bb7a026`, one-based inclusive lines [[1, 97]].

`work-config-424700911`: [dbo.dbc_ISlottingItemUpFields](sql/424700911.sql); source-definition SHA-256 `c29851e3e1e052c67c9855291739890018652a6244e34eb6aea3697bac56d88e`, reading-copy SHA-256 `c854f3055ab325f074b3af1c0aecb74ccfc56875dfc3c2a159207dcbab9c05aa`, one-based inclusive lines [[1, 69]].

`work-config-440700968`: [dbo.dbc_ISlottingLocUpFields](sql/440700968.sql); source-definition SHA-256 `3af468b9852873f365ac43144df463cb375ab5aefe43b33d04be882d667a1fd8`, reading-copy SHA-256 `1cb0a03fe36df2c334a7ad6e0681e73b84d8ed8f9ec48c01ba309e8a08612904`, one-based inclusive lines [[1, 68]].

`work-config-456701025`: [dbo.dbc_ISlottingMovesDownFields](sql/456701025.sql); source-definition SHA-256 `85ef82443c9ad47bd3552b701f69f79e5876c6321a0ca09d651f167310e2c17d`, reading-copy SHA-256 `235ca09beab6deee716e6285bd0423d5f0898d013d87d3ba34f1ba266e8995e0`, one-based inclusive lines [[1, 73]].

`work-config-472701082`: [dbo.dbc_ISlottingWarehouseUpFields](sql/472701082.sql); source-definition SHA-256 `2670044a38d49e9a148592a01217b7afde73a0c9a47e8842ac8fb5616d93979c`, reading-copy SHA-256 `1faa9766aab69391e1ee0b9ad304c2bcf97d7216bc263758a4449a7fa9c691bf`, one-based inclusive lines [[1, 69]].

`work-config-2090802856`: [dbo.dbc_IWarehouseAlert](sql/2090802856.sql); source-definition SHA-256 `e399d7ae47e3c1ca2cdba17f5e4eb29affa80d156ab6eda789966abd922ba30d`, reading-copy SHA-256 `e730b61fcd67079cb59682615a3f93de29012c8c80756d522f0fb0d0620873e6`, one-based inclusive lines [[1, 79]].

`work-config-2106802913`: [dbo.dbc_IWarehouseAlertType](sql/2106802913.sql); source-definition SHA-256 `5575cd4997943655b8269495a4ac15ac15b303348e5ebdd41d28671e7e0a89bb`, reading-copy SHA-256 `c6c2735ed3fe70d4162f4d7b1e6a8019dec67367a20069ccfa6223988daa97d7`, one-based inclusive lines [[1, 75]].

`work-config-384720423`: [dbo.dbc_IWarehouseMobileMenu](sql/384720423.sql); source-definition SHA-256 `0e0fbf8cb288b2a515505d62f7a5ad665647eec6f6a4ce9422260f176e30568d`, reading-copy SHA-256 `e5f734ccaba6d55dde9bf8d0f06f7260641a2665f0b98deb3389cfa7fccc3b89`, one-based inclusive lines [[1, 81]].

</details>

<a id="configuration-null-duplicate-keys"></a>

## Why a blank configuration key can allow another insertion

A blank or NULL key is not handled consistently. Accessorial external symbols and alert descriptions use ordinary equality, which does not match NULL to NULL. The required-interface-field helper even uses different replacements for the two NULL values. Report subreports and mobile-menu parents have different, explicit matching rules.

### How it works

1. Check whether the supplied value is missing, empty or an actual identifier.
2. Use the specific helper contract before treating an insertion as safely repeatable.

<details>
<summary>Technical reference and sources</summary>

`work-config-1676181367`: [dbo.dbc_IAccessorialDetail](sql/1676181367.sql); source-definition SHA-256 `30a9512cebca3ec8abb1232e91cf7a7ff220e1eb6afe42691f87e6fdc728712a`, reading-copy SHA-256 `78eb05468fa01a92748ff6249411b4d5b604f93ee3efb8d017cc09b2bd837fb5`, one-based inclusive lines [[1, 110]].

`work-config-2060182735`: [dbo.dbc_IInterfaceDatamapReqFields](sql/2060182735.sql); source-definition SHA-256 `00c4d0c5e031440cef28880a9649d00ad23e711e9f77e0c7a869f7dde94024a8`, reading-copy SHA-256 `fe9f44192031062fb3e6b61b99c24a80bfd1858e90b8dbc9cc9c380936706bf5`, one-based inclusive lines [[1, 71]].

`work-config-232700227`: [dbo.dbc_IReportConnection](sql/232700227.sql); source-definition SHA-256 `af8a3d8654319f8bbb15ae6b75e618102d218a301f12bc23228228e3229ddd47`, reading-copy SHA-256 `fdce3dd52521dfd24557f190a7f3258103d0ec07f369bd236640c672247a4691`, one-based inclusive lines [[1, 69]].

`work-config-2090802856`: [dbo.dbc_IWarehouseAlert](sql/2090802856.sql); source-definition SHA-256 `e399d7ae47e3c1ca2cdba17f5e4eb29affa80d156ab6eda789966abd922ba30d`, reading-copy SHA-256 `e730b61fcd67079cb59682615a3f93de29012c8c80756d522f0fb0d0620873e6`, one-based inclusive lines [[1, 79]].

`work-config-384720423`: [dbo.dbc_IWarehouseMobileMenu](sql/384720423.sql); source-definition SHA-256 `0e0fbf8cb288b2a515505d62f7a5ad665647eec6f6a4ce9422260f176e30568d`, reading-copy SHA-256 `e5f734ccaba6d55dde9bf8d0f06f7260641a2665f0b98deb3389cfa7fccc3b89`, one-based inclusive lines [[1, 81]].

</details>

<a id="serial-archive-copy-delete"></a>

## What the shipping-load serial archive helper actually does

The helper copies the initially matching serial rows, then repeatedly selects and deletes currently matching live rows in batches. Those are separate steps. The source does not establish one protected snapshot for the whole move.

### How it works

1. Distinguish initial copied rows from later delete eligibility.
2. Account for rows that become eligible between the initial copy and a later deletion batch.

### Limits

- Copying and deletion need a coordinated operational archive workflow; the helper does not establish one protected snapshot.


<details>
<summary>Technical reference and sources</summary>

`work-config-1788181766`: [dbo.dbc_IArchiveSerialNumbersInShipLoad](sql/1788181766.sql); source-definition SHA-256 `1f6f9993d62909fe8faeaad3b5756fc59b62daf4ff44106ca70b6e6d5842287b`, reading-copy SHA-256 `727664c3b4275e80d28ee6b6cb3b15924f7e53c8ac2b217d2a554158e58f56b2`, one-based inclusive lines [[1, 35]].

</details>

<a id="custom-screen-activation"></a>

## How customized-screen activation and removal choose related screens

Activation changes the selected screen, changes one other screen in the same form, then finishes the selected flag. The other-screen lookup expects at most one row. Removal deletes a selected non-system hierarchy and then activates system screens for its form. None of these bodies provides rollback for the whole sequence.

### How it works

1. Check the form and screen identities together.
2. Keep screen activation separate from deleting its controls and layout hierarchy.

<details>
<summary>Technical reference and sources</summary>

`work-config-229224217`: [dbo.META_ActivateCustomizeScreen](sql/229224217.sql); source-definition SHA-256 `18d55ff7c62e3d85ca800cd56a176fbddeb24cd8b343db99648f25d21d5b6167`, reading-copy SHA-256 `cc53e6087d29e45fb1629b26140d35bf6ee3adacf531a9181bf5f4bb20eae6b2`, one-based inclusive lines [[1, 42]].

`work-config-245224274`: [dbo.META_DeactivateCustomizeScreen](sql/245224274.sql); source-definition SHA-256 `0f221cb833a3a6382f1c3d359e701824fddb6d030acb9fdd06a29ecd9889e5e8`, reading-copy SHA-256 `bef28c04757a1b930723d3073131684da95aa4c0388dc85bfe23d9610f722239`, one-based inclusive lines [[1, 45]].

`work-config-261224331`: [dbo.META_DELETECUSTOMIZESCREEN](sql/261224331.sql); source-definition SHA-256 `eb82118af46b6d600918a36376f42710315a5fd9efebc07a117c69e2bd39008f`, reading-copy SHA-256 `a09c4e128cf2c2038b7363b9daa654df41974fe11a459de027a97f3c749fc64f`, one-based inclusive lines [[1, 304]].

</details>

<a id="detail-model-selection"></a>

## Why a detail model can contain defaults or more than one matching definition

These helpers prepare display data. Item UOM lookup can return both default-company and company-specific rows. Lot attributes combine a template with stored values, and live versus archived lookup paths differ. Mobile-menu descendant counts include lower levels, but do not include the selected parent.

### How it works

1. Identify the selected item, company, lot or menu identity.
2. Read defaults and display counts as query results, not changes to operational records.

<details>
<summary>Technical reference and sources</summary>

`work-config-293224445`: [dbo.MetaDetail_GetBOMComponents](sql/293224445.sql); source-definition SHA-256 `c8c6f655e79382139ef66d8f0b80ddd54bfa6978a363f3a9323b665ccdac7b7f`, reading-copy SHA-256 `0f80e6b0b12ff9cb66ede711fd697ae52b6ce8877f05ec043e61878ff6caf8b0`, one-based inclusive lines [[1, 37]].

`work-config-309224502`: [dbo.MetaDetails_GetITEMUOM](sql/309224502.sql); source-definition SHA-256 `8dfcc08f158453150a9cb4d4b53e42f6a1909d3b3efd0b066bb84d9c7db00113`, reading-copy SHA-256 `b5771f12af56c7742fb182364bc5692f451e403cbf0a41f785a1653cc58befda`, one-based inclusive lines [[1, 21]].

`work-config-325224559`: [dbo.MetaDetails_GetLotAttributes](sql/325224559.sql); source-definition SHA-256 `5f6271dd82d538c07563cf99b26002f4fad0013f7d545438ac16fea23cbc1760`, reading-copy SHA-256 `5fc8be9eb6aacadb46fc0e0cb5249bf56e949f01b908de5576f2240e7524fe76`, one-based inclusive lines [[1, 86]].

`work-config-398272824`: [dbo.WHSM_GetMenuChildRecords](sql/398272824.sql); source-definition SHA-256 `d1e3083489a2793ccc8989c471e8fafc21ba4ad89fc0d63898f4683a5acc824a`, reading-copy SHA-256 `d9b21584df5c557c30390c88bfea2a6d4a358c5b7f3089d4ee4ed61b72ee4e3a`, one-based inclusive lines [[1, 15]].

`work-config-414272881`: [dbo.WHSM_InsightDetailPaneData](sql/414272881.sql); source-definition SHA-256 `132bedc481069fb9500049affa1b1cf8377d08566123484564c1d50f3cae00cc`, reading-copy SHA-256 `3892c12feeccf560936a2bbbed875924720e6f2da1f09307684975fd89cbc967`, one-based inclusive lines [[1, 30]].

</details>

<a id="dashboard-visibility-defaults"></a>

## How dashboard visibility and available choices are prepared

Dashboard and receipt-workbench routines return templates, flags and available choices. Some missing checkpoint values default to allowing a tile. Receipt-workbench authorized preferences are used for one fallback selection, while its returned preference list includes all preferences. A displayed choice is not proof that the caller can successfully perform the action.

### How it works

1. Distinguish the returned visibility flag, the choice list and the action itself.
2. Inspect the exact checkpoint or preference source for a specific screen.

<details>
<summary>Technical reference and sources</summary>

`work-config-389224787`: [dbo.MetaTpmTrans_Dashboard](sql/389224787.sql); source-definition SHA-256 `369e95ad4276dbd072fdf8113de53530d4a6b4d7fc80e94f36a1a2f933598136`, reading-copy SHA-256 `c0def41adf96d27515d2146535731ed54fd7315ea9be47096ec236a84362dba8`, one-based inclusive lines [[1, 100]].

`work-config-469225072`: [dbo.MetaTrans_Dashboard](sql/469225072.sql); source-definition SHA-256 `2bd39e447d0ffb3377a82aafb28cc7d39f0c013b3f63cacd86b9aff9116e5dff`, reading-copy SHA-256 `ef9375095e82e8cfdc01cfcb0f3ad1c51b09285a7809dd85357f5247ffca24af`, one-based inclusive lines [[1, 111]].

`work-config-1125227409`: [dbo.MetaTrans_ReceiptWorkbench](sql/1125227409.sql); source-definition SHA-256 `96910cb156e60d43d86167ce788e132a45e60e4b77776ae46182288eb1d4b984`, reading-copy SHA-256 `58798c3a5e9c122243ffc4b30aad0e470eace075a4bf73ad05b392a2f53fa4b3`, one-based inclusive lines [[1, 186]].

</details>

<a id="close-container-model-boundary"></a>

## What the close-container model can explain

This routine reads a container and its shipment, proposes container-count numbers and returns a carrier-change restriction after finding a previously closed-status container. It does not close the current container. A cause for a container that remains open needs the actual action and its current error or state.

### How it works

1. Check the displayed count proposal and carrier restriction separately.
2. Use the actual close action and exact message to investigate an open container.

<details>
<summary>Technical reference and sources</summary>

`work-config-533225300`: [dbo.MetaTrans_GetCloseContainer](sql/533225300.sql); source-definition SHA-256 `578083f24d54af94239a3e0e69064d9efe3fdf2c314c28b6b9ab41afd5004371`, reading-copy SHA-256 `bd1921dfef85b643940ecbb9af1373de67ba74693f98315adaeae4cbfb749acb`, one-based inclusive lines [[1, 129]].

</details>

<a id="employee-list-scope"></a>

## Why an employee list can differ between users

The employee list requires active users and applies a supervisor filter when one is supplied. When both SaaS and feature settings are enabled, it also filters by the caller's email category. In that mode, a NULL caller parameter bypasses the category test, but a supplied name missing from USER_PROFILE leaves the category NULL and returns no employees.

### How it works

1. Check whether the supervisor filter is supplied.
2. Keep the feature-controlled email rule separate from employee activity status.

<details>
<summary>Technical reference and sources</summary>

`work-config-581225471`: [dbo.MetaTrans_GetEmployees](sql/581225471.sql); source-definition SHA-256 `81f295f5c9c00cda1dfddd45eb379bf0410968fad7700ac7e7e93f9f84fcc870`, reading-copy SHA-256 `cd98fc33aff09600ffac4267a6a2fb030ac75cff948fd8a06c8542cc931bc104`, one-based inclusive lines [[1, 90]].

</details>

<a id="inventory-screen-aggregate-defaults"></a>

## Why inventory adjustment or transfer screens can show blank defaults

Inventory model routines use different selectors. Some aggregate optional filters when the internal identity is zero; others choose a single minimum identity for a license plate. Mixed values become blank, and several warehouse or destination variables are never assigned. These are screen defaults, not stock changes.

### How it works

1. Identify whether the request used an internal ID, a license plate or optional filters.
2. Do not interpret a blank aggregate field as proof that all underlying records have that blank value.

<details>
<summary>Technical reference and sources</summary>

`work-config-597225528`: [dbo.MetaTrans_GetInventory](sql/597225528.sql); source-definition SHA-256 `903e0d4a396421a0ff77085ca271586f4bd295e918fc8173ec18ca48e63c26fb`, reading-copy SHA-256 `93973d53a2d680a5aa26c791b8070bea57bd5039f2dddc3aaed5aa8b3f3ce1b7`, one-based inclusive lines [[1, 94]].

`work-config-613225585`: [dbo.MetaTrans_GetInventoryAdjustment](sql/613225585.sql); source-definition SHA-256 `f5820bb2d67d61bf6e3cc320128893515daacdb98acd6afe0f95a46b41754811`, reading-copy SHA-256 `9eb3331ea000785c41c702ca633240564af88a24f4b54c8359b6d4e0c2c1c77f`, one-based inclusive lines [[1, 156]].

`work-config-629225642`: [dbo.MetaTrans_GetInventoryCompanyTransfer](sql/629225642.sql); source-definition SHA-256 `980d10778eb7f2706482e3436a56a464b875b18f7dc74896ba5223ebef1d2284`, reading-copy SHA-256 `f11d20839d2a1e74f664683e8265fbecc43fcc282c77fba347a371df7a33c43f`, one-based inclusive lines [[1, 112]].

`work-config-645225699`: [dbo.MetaTrans_GetInventoryStatusChange](sql/645225699.sql); source-definition SHA-256 `10b122586114c20fe3e2ed0d9bd3bb42671b344965a1acbbe4a23e8b0bde9d02`, reading-copy SHA-256 `46f634dbb7e2f7c18bc6c62933a68a278f63612cd96573f90281d961804e8a77`, one-based inclusive lines [[1, 117]].

`work-config-661225756`: [dbo.MetaTrans_GetInventoryTransfer](sql/661225756.sql); source-definition SHA-256 `d08f73fcbc03056c4315e64d9401982ffffce94d45920b25f56ff7effc3445bd`, reading-copy SHA-256 `37584494b34992c664a833c04c40408596d3287b0d080e698ad6a17a7b0e2c17`, one-based inclusive lines [[1, 99]].

`work-config-917226668`: [dbo.MetaTrans_GetRecAppSchedule](sql/917226668.sql); source-definition SHA-256 `49cc069091b48c561452a43ddb837128ee77e4f5877a4273a7730f5b6432d9b0`, reading-copy SHA-256 `0b461b00677a1c00f4eba962cb45c3a818ea06ffefce32e3eb79f95417e02d54`, one-based inclusive lines [[1, 110]].

</details>

<a id="analytics-window-boundaries"></a>

## How analytics extracts select time and status ranges

Activity extracts use timestamps greater than the start and up to and including the end. Shipment extracts instead use modification timestamps and a fixed trailing-status range. Detail and container extracts can include rows after a header change. These read queries do not measure a complete business process or make an export exactly once.

### How it works

1. Compare the relevant activity or modification timestamp with the requested interval.
2. Keep dataset-specific joins and status filters when reconciling counts.

<details>
<summary>Technical reference and sources</summary>

`work-config-1169751570`: [dbo.SCI_DATE](sql/1169751570.sql); source-definition SHA-256 `f95103e6b0c2c5cb177683b40d1f6a48308c9d9d5957ecbdcd47770ec446d154`, reading-copy SHA-256 `12a42d156a9612c5b729c2f51e43f936fa1e2213abc231f595264b6423d0364c`, one-based inclusive lines [[1, 21]].

`work-config-1233751798`: [dbo.SCI_LOCATION_CAPACITY](sql/1233751798.sql); source-definition SHA-256 `5341f6576ff2706339ece5c056b38a71f92ca4ac598b18e8f78a1be1798a2926`, reading-copy SHA-256 `1582c2ad9e4656b7d2cff2034edfb6f91992fa745e07e63c6af74a5312f98f14`, one-based inclusive lines [[1, 18]].

`work-config-1249751855`: [dbo.SCI_LOCATION_SNAPSHOT](sql/1249751855.sql); source-definition SHA-256 `19dbeb21a17b9ac6e13a8fb0ed7f024526f808d7ec0f7972bd5ee30ad33a4340`, reading-copy SHA-256 `1a63db794404caed12c5c3bc67458f89e3ec1616dcd6a33e3d4a05541b8b605c`, one-based inclusive lines [[1, 17]].

`work-config-1265751912`: [dbo.SCI_PICK_PUT](sql/1265751912.sql); source-definition SHA-256 `18e3e7ce93718efbc62d4c3a36ff81a28f1dcf052b878922b062febd26c6a37e`, reading-copy SHA-256 `7b3d4e9d81cbad8dae023a8165faf1cedbf4a19e5565d0f4abb6cd3f1bf54a0b`, one-based inclusive lines [[1, 23]].

`work-config-1281751969`: [dbo.SCI_PICK_PUT_COMMON](sql/1281751969.sql); source-definition SHA-256 `e1fb0444dfb94e18320af4a3712660d76b3cd92eb777150f38e01a9566120571`, reading-copy SHA-256 `3afac3a8fdc821f44c3ea8136d0fe5500311fbdb17c6c49656b52c05ee46ee6b`, one-based inclusive lines [[1, 23]].

`work-config-1297752026`: [dbo.SCI_PICK_PUT_INBOUND](sql/1297752026.sql); source-definition SHA-256 `0632bf2d4fd07270e0e9054f2aa0e457f5121ce972a9420e9a51b3b7247509dd`, reading-copy SHA-256 `86fa6f6d41f0f699152f0a0fc9679472466e98c65697e46a58dda273cd25c01a`, one-based inclusive lines [[1, 23]].

`work-config-1313752083`: [dbo.SCI_PICK_PUT_INBOUND_EXT](sql/1313752083.sql); source-definition SHA-256 `ba397e831b86de3a9a75388f4268758be587f0fef786485c30b9fe4d774631d4`, reading-copy SHA-256 `966a5594c9aae5a396a565be2a28b0a1a6e3930aec1c4f9c85a791d74556b812`, one-based inclusive lines [[1, 20]].

`work-config-1329752140`: [dbo.SCI_PICK_PUT_OUTBOUND](sql/1329752140.sql); source-definition SHA-256 `264987d71f2ed11980a3955d460d3da149e1f7d75cd2a213753b38044fd21961`, reading-copy SHA-256 `5760fdb172dfa8df867e145b7ed61b19e0239d2f9382bfac6555ce2e14fe19c5`, one-based inclusive lines [[1, 24]].

`work-config-1345752197`: [dbo.SCI_PICK_PUT_OUTBOUND_EXT](sql/1345752197.sql); source-definition SHA-256 `fed875c90e56417be2b3f9ddc9fe7ff06cd59ef9e697161dc1add3a37f89c646`, reading-copy SHA-256 `b5c4d8a8d5bf6746ed6a2866d52739f25b839c12df5ad35fa7c38a4a22e0ed58`, one-based inclusive lines [[1, 20]].

`work-config-1361752254`: [dbo.SCI_PICK_PUT_WORK_ORDER](sql/1361752254.sql); source-definition SHA-256 `325b49132fcb9ea890fd3db02b29863213bae18b0c9b95f345db199bc6657741`, reading-copy SHA-256 `267363d1a2551eedc7790457e2bb76913ed682fd84e0893a7eca1def7ee03f53`, one-based inclusive lines [[1, 24]].

`work-config-1377752311`: [dbo.SCI_RECEIPT_CONTAINER_CHECKIN](sql/1377752311.sql); source-definition SHA-256 `fb5a2924bd2936ed1c145e20691cb853252b7f518a812016b6165545fd84991e`, reading-copy SHA-256 `69777a82ee11d338dc172237e590eec4c307128c81472a2ad33393b9800c0eb5`, one-based inclusive lines [[1, 48]].

`work-config-1393752368`: [dbo.SCI_RECEIPT_CONTAINER_CHECKIN_CANCEL](sql/1393752368.sql); source-definition SHA-256 `c3fbf83b5981d9f5a9ed42b7fd65af5ad5d226e8214047ab519b9e3ae4baaeb9`, reading-copy SHA-256 `4f339ff185647d00fd043e6353fa2e040d5cfcbb5b1657d722cf0bdd4ec6f560`, one-based inclusive lines [[1, 29]].

`work-config-1409752425`: [dbo.SCI_SHIPMENT_DETAIL](sql/1409752425.sql); source-definition SHA-256 `3f510b63af08decc2caa85d0f53a10a78641db12998b34e653340b02bfef3428`, reading-copy SHA-256 `266c816177e77b8598afae5db472cb55c155b0068b1f8872b1c7e022d068513a`, one-based inclusive lines [[1, 20]].

`work-config-1425752482`: [dbo.SCI_SHIPMENT_HEADER](sql/1425752482.sql); source-definition SHA-256 `7c44444a175c77f8396f86f7b65ee750ae9d3310bbfa4db4d42d6060c8ab95ab`, reading-copy SHA-256 `0a5bbd12021d7618a41b41f9cac951104fd7dafff9e3f96b05b07605f7e8985a`, one-based inclusive lines [[1, 21]].

`work-config-1441752539`: [dbo.SCI_SHIPPING_CONTAINER](sql/1441752539.sql); source-definition SHA-256 `7668748983f91eabc12d5e4c1b3914667fc17cd8ae7419e27e17f30a05870890`, reading-copy SHA-256 `f1ff414714b2c45fcc4fa1ab6b0b22eb786c31892cde79bfaa2f71332ecf55ac`, one-based inclusive lines [[1, 99]].

</details>

<a id="analytics-join-multiplicity"></a>

## Why an analytics event can appear more than once

Several extracts join one event to optional item, labor or appointment rows. More than one matching row can multiply an event. The location snapshot also returns per-unit measures under total-named columns, and parent-container quantity is summed from tree-unit membership.

### How it works

1. Check the exact join keys before comparing row counts with unique events.
2. Distinguish a total from a per-unit value and from a tree aggregate.

<details>
<summary>Technical reference and sources</summary>

`work-config-1249751855`: [dbo.SCI_LOCATION_SNAPSHOT](sql/1249751855.sql); source-definition SHA-256 `19dbeb21a17b9ac6e13a8fb0ed7f024526f808d7ec0f7972bd5ee30ad33a4340`, reading-copy SHA-256 `1a63db794404caed12c5c3bc67458f89e3ec1616dcd6a33e3d4a05541b8b605c`, one-based inclusive lines [[1, 17]].

`work-config-1265751912`: [dbo.SCI_PICK_PUT](sql/1265751912.sql); source-definition SHA-256 `18e3e7ce93718efbc62d4c3a36ff81a28f1dcf052b878922b062febd26c6a37e`, reading-copy SHA-256 `7b3d4e9d81cbad8dae023a8165faf1cedbf4a19e5565d0f4abb6cd3f1bf54a0b`, one-based inclusive lines [[1, 23]].

`work-config-1281751969`: [dbo.SCI_PICK_PUT_COMMON](sql/1281751969.sql); source-definition SHA-256 `e1fb0444dfb94e18320af4a3712660d76b3cd92eb777150f38e01a9566120571`, reading-copy SHA-256 `3afac3a8fdc821f44c3ea8136d0fe5500311fbdb17c6c49656b52c05ee46ee6b`, one-based inclusive lines [[1, 23]].

`work-config-1297752026`: [dbo.SCI_PICK_PUT_INBOUND](sql/1297752026.sql); source-definition SHA-256 `0632bf2d4fd07270e0e9054f2aa0e457f5121ce972a9420e9a51b3b7247509dd`, reading-copy SHA-256 `86fa6f6d41f0f699152f0a0fc9679472466e98c65697e46a58dda273cd25c01a`, one-based inclusive lines [[1, 23]].

`work-config-1361752254`: [dbo.SCI_PICK_PUT_WORK_ORDER](sql/1361752254.sql); source-definition SHA-256 `325b49132fcb9ea890fd3db02b29863213bae18b0c9b95f345db199bc6657741`, reading-copy SHA-256 `267363d1a2551eedc7790457e2bb76913ed682fd84e0893a7eca1def7ee03f53`, one-based inclusive lines [[1, 24]].

`work-config-1377752311`: [dbo.SCI_RECEIPT_CONTAINER_CHECKIN](sql/1377752311.sql); source-definition SHA-256 `fb5a2924bd2936ed1c145e20691cb853252b7f518a812016b6165545fd84991e`, reading-copy SHA-256 `69777a82ee11d338dc172237e590eec4c307128c81472a2ad33393b9800c0eb5`, one-based inclusive lines [[1, 48]].

`work-config-1441752539`: [dbo.SCI_SHIPPING_CONTAINER](sql/1441752539.sql); source-definition SHA-256 `7668748983f91eabc12d5e4c1b3914667fc17cd8ae7419e27e17f30a05870890`, reading-copy SHA-256 `f1ff414714b2c45fcc4fa1ab6b0b22eb786c31892cde79bfaa2f71332ecf55ac`, one-based inclusive lines [[1, 99]].

</details>

<a id="work-configurator-controls"></a>

## How work-verification controls are derived

Work screens combine profile settings, location verification and security checkpoints. Missing special handling uses a fallback row. The captured general configurator has a positional mismatch in three fallback controls, so its returned labels and values need careful interpretation. These models do not execute warehouse work.

### How it works

1. Identify the profile sequence, location and special-handling ID.
2. Distinguish configured controls from enforcement by the actual action.

<details>
<summary>Technical reference and sources</summary>

`work-config-1985754477`: [dbo.SRC_CartPickingWorkConfiguratorModel](sql/1985754477.sql); source-definition SHA-256 `610de424113083803a092095bd012b6e055cdb91a96e14d531719ae46580bb2b`, reading-copy SHA-256 `9baeea5ffff4ecd22a08dd0689db57088d6ae451f6a320bd5094d05ef8fd65e9`, one-based inclusive lines [[1, 18]].

`work-config-2001754534`: [dbo.SRC_ReceivingConfiguratorModel](sql/2001754534.sql); source-definition SHA-256 `ea13797a181d2be87f9b6e462c9cd661fd5fefa223b85aa0225853d41a5fbc1c`, reading-copy SHA-256 `d007648321613ce2cada2b480dd31f54cac75a99c65034c9af6dc4dce71c0246`, one-based inclusive lines [[1, 31]].

`work-config-2017754591`: [dbo.SRC_SystemDirectedWorkConfiguratorModel](sql/2017754591.sql); source-definition SHA-256 `4d23fd92856b1d91c7585e381547775d86e141dd76bbc2b354600e6a97e50b39`, reading-copy SHA-256 `9afbba472f1ca0fef04250895d864a9f8242b3908b2ed9f5ba56f06c50d2caf6`, one-based inclusive lines [[1, 39]].

`work-config-1340583864`: [dbo.SRC_WorkConfiguratorModel](sql/1340583864.sql); source-definition SHA-256 `b136c0778eeb1d710ce06ddcb00182dbfe9c84baf571670de1ea18c2444cecc6`, reading-copy SHA-256 `de019f8ea56687ba97ba3de5999131ed9b13de7c8da49ce9c64c34509f70018e`, one-based inclusive lines [[1, 187]].

</details>

<a id="cart-building-and-spots"></a>

## How cart selection differs from spot assignment

Cart building selects eligible work/container tuples by priority and zone order, then calls the assignment helper. That helper has a tote-and-work-unit path that updates work without calling the spot routine. The cart builder uses a transaction, but its error path contains no explicit rollback handler.

### How it works

1. Identify whether assignment used the tote/work-unit path or container path.
2. Check container identity and profile sequence when interpreting selected cart spots.

<details>
<summary>Technical reference and sources</summary>

`work-config-858798467`: [dbo.WRK_BuildCart](sql/858798467.sql); source-definition SHA-256 `e75e2b4c80d02eff37066b9a59771671e2d5f1757b18768c0367b11df64709bc`, reading-copy SHA-256 `070e127faa07876c9f4535026a16cad1839790900a955839cab449ce9cc95027`, one-based inclusive lines [[1, 87]].

`work-config-1338800177`: [dbo.WRK_UpdateWorkInstructionForCartPicking](sql/1338800177.sql); source-definition SHA-256 `65ab4a3d5455001cebf75707ba4b1c6d7ea7cd6cbc34474e4c5bba814f5b55d1`, reading-copy SHA-256 `fcac2f0b1359f3c6452973384804f8998a923de1f93851dfc81180ed88752d15`, one-based inclusive lines [[1, 38]].

</details>

<a id="work-unit-selection-scope"></a>

## Why a single work-unit match can bypass profile filters

The work lookup first counts matching work units. Exactly one eligible name takes a branch that does not add the hold or profile work-type restrictions used for multiple matches. The final header query also selects by work-unit name, so its scope is broader than the eligibility subquery.

### How it works

1. Check whether the first lookup found exactly one work-unit name.
2. Review hold, profile and warehouse rules in the branch actually used.

<details>
<summary>Technical reference and sources</summary>

`work-config-67843654`: [dbo.WRK_GetWorkUnits](sql/67843654.sql); source-definition SHA-256 `f90473091e71dd6ee59c58e51a53598f78bd696caab7be045ed9c62366c7dea7`, reading-copy SHA-256 `24c5af0fa77633da1b94dbe668479b54dedd78eb17ed84b679603f86ac01a95a`, one-based inclusive lines [[1, 74]].

</details>

<a id="work-created-and-work-written"></a>

## What work-created flags do and do not prove

The small work-created helpers set flags; they do not create or verify instructions. The broad work writers insert or replace caller-supplied fields. Header updates and renames can affect every matching work-unit name without a warehouse restriction.

### How it works

1. Separate a request flag from the presence and condition of its work instructions.
2. Use exact internal identities and scope when interpreting a broad work-unit update.

<details>
<summary>Technical reference and sources</summary>

`work-config-938798752`: [dbo.WRK_InsertWorkInstruction](sql/938798752.sql); source-definition SHA-256 `bb4755a08bb344018fe6a8d000cf7986566249377d31db1e6c9ad79651289bb8`, reading-copy SHA-256 `743c07e16577fc75f7f3b27f2456905c6316c1882a2b221c222bd57b89594316`, one-based inclusive lines [[1, 323]].

`work-config-1178799607`: [dbo.WRK_UpdateCCWorkCreated](sql/1178799607.sql); source-definition SHA-256 `f8394ee19593a19d7b66d68db43aa9d317a2ab3b4c65cec72f70a73a841ab127`, reading-copy SHA-256 `12b02ec2d3c20ed06a19c3c145d7900ab36ea3b824770134199eff3c804b516e`, one-based inclusive lines [[1, 17]].

`work-config-1210799721`: [dbo.WRK_UpdateInventoryWorkCreated](sql/1210799721.sql); source-definition SHA-256 `75f01ffeb679506e634cec5fb48537fe71fe7c3f9a9ef7d08ce090c5aa2d8301`, reading-copy SHA-256 `61a4afb5f20b220c88c665290c5ffd6a3b05063ef7840b5e5a6cb40d50223add`, one-based inclusive lines [[1, 17]].

`work-config-1226799778`: [dbo.WRK_UpdateParentInstructionLnk](sql/1226799778.sql); source-definition SHA-256 `0d01fa5136487e5ef8bef5982f84e688dd3c0c7ee5780e30569532b9e19908d3`, reading-copy SHA-256 `0afe47475cd9c23ed293b550469321b239c706ad7abdbd30a54ad882eda674db`, one-based inclusive lines [[1, 19]].

`work-config-1242799835`: [dbo.WRK_UpdateRecWorkCreated](sql/1242799835.sql); source-definition SHA-256 `f4cbc970cbd32f2701bce148528371b3eb42aec64c4d013ff706ea24717cf6db`, reading-copy SHA-256 `965034099974e83da0e183c7ec367dd74f40b037869d26369196f540f5ea4f40`, one-based inclusive lines [[1, 17]].

`work-config-1274799949`: [dbo.WRK_UpdateShipContWorkCreated](sql/1274799949.sql); source-definition SHA-256 `916cc8733037b8ea9f8887d508fc463d1eb787ef909002cf536a5aa0dbe7d18b`, reading-copy SHA-256 `3f0ed00de1713cd0795f180a18985a3909cae235f9884f87da5756f1dde66f66`, one-based inclusive lines [[1, 24]].

`work-config-1290800006`: [dbo.WRK_UpdateWoDtlWorkCreated](sql/1290800006.sql); source-definition SHA-256 `843873d8a2b35c1885b491f3416af100110fafd114d5eebeda3e7471cd2b8309`, reading-copy SHA-256 `56adf7a2706d4c4fc9df00488b23437b054a28abe824dbdbc7adf1963b40f177`, one-based inclusive lines [[1, 17]].

`work-config-1306800063`: [dbo.WRK_UpdateWoPutawayWorkCreated](sql/1306800063.sql); source-definition SHA-256 `7e2146f70e7b749084f101e233d61818e6fb4591b0547a9251dbd58f3e59e8f1`, reading-copy SHA-256 `e24093b3e6661d376645dae6b618a029177b404eaf99aa339cb8adb881fe2a23`, one-based inclusive lines [[1, 17]].

`work-config-1322800120`: [dbo.WRK_UpdateWorkInstruction](sql/1322800120.sql); source-definition SHA-256 `d33dc18320dcec1e5cd5048098d024b6ed45908e0117bc5093a3b897fd69422f`, reading-copy SHA-256 `361e5ba01cb044632ab3da094d0c2be5442d56ed8484c3b0f82f641f26a3b625`, one-based inclusive lines [[1, 219]].

`work-config-1370800291`: [dbo.WRK_UpdateWorkUnitName](sql/1370800291.sql); source-definition SHA-256 `456d195ad3005f7cd28e5e0d6b291a4d33a1082b69b5ee30b4b945a9ec06f3e8`, reading-copy SHA-256 `6fb574592b6933258d39220f10ffe613bacc6f194d6b5adb28c40560508e7af5`, one-based inclusive lines [[1, 18]].

</details>

<a id="work-deactivation-scope"></a>

## How work moves into inactive storage

The shipping-load path selects qualifying closed work, while the work-unit path copies all matching instructions regardless of condition. Both copy an explicit field set and then delete live rows separately. Their stored fields omit some newer work metadata.

### How it works

1. Distinguish load-qualified deactivation from name-based work-unit deactivation.
2. Treat the copy/delete sequence and its field list as part of the source contract.

<details>
<summary>Technical reference and sources</summary>

`work-config-1402800405`: [dbo.WTH_DeactivateShippingLoadWork](sql/1402800405.sql); source-definition SHA-256 `85d186954ce18fa62ba534991fefef7351bcb23e06e41a12c3e610988a5290ed`, reading-copy SHA-256 `856e53852bee6d093a7640197da7b4e2016f895a78479652e64cd52beb79604c`, one-based inclusive lines [[1, 234]].

`work-config-1418800462`: [dbo.WTH_DeactivateWork](sql/1418800462.sql); source-definition SHA-256 `730816eeabee7917c537ee1e198e9ccd878f85768d6e44cddcc0cc13db4c48a2`, reading-copy SHA-256 `9592ebcf4c14f85141bbbaec75dbc41ec4840224045c8043cc794de402433134`, one-based inclusive lines [[1, 217]].

</details>

<a id="work-splitting-failure-boundary"></a>

## Why a failed split may already have created a new instruction

Work splitting clones the instruction before checking whether the selected source or destination quantity covers the split. A later failure has no local rollback, and the original and clone retain different from/to quantities according to mode.

### How it works

1. Check the selected split mode and source versus destination quantity.
2. A NULL confirmation mode makes the comparison with 1 unknown, selecting destination/putaway quantities in WTH_SplitWorkWithReturnInstr. The wrapper also skips its conditional replenishment-request split.
3. Treat a failed return as a reason to inspect the authorized workflow state, not to repeat blindly.

<details>
<summary>Technical reference and sources</summary>

`work-config-1434800519`: [dbo.WTH_SplitWork](sql/1434800519.sql); source-definition SHA-256 `2543b07518bd022774a697c2843630fd069c891284661aa18e947d8d9d18bcc8`, reading-copy SHA-256 `87b879a1c38e9f8ba617ac393e6bab3f474d699c819c33ef06ce807f41f1415e`, one-based inclusive lines [[1, 56]].

`work-config-1450800576`: [dbo.WTH_SplitWorkInPutaway](sql/1450800576.sql); source-definition SHA-256 `4f90faaccc630e62656f6b0c05d36d41241f5b50cfa201c6761e4f29bb861d21`, reading-copy SHA-256 `088ac610a7461fcd89aaa47f21d9e13dd3adf4c14a8cf296b8d5bdb043cb68b9`, one-based inclusive lines [[1, 33]].

`work-config-1466800633`: [dbo.WTH_SplitWorkInPutawayRetInstr](sql/1466800633.sql); source-definition SHA-256 `3f9306a0d0e4f4af6df2e42de34dea32f57cf236d2e962ebba51069a4c717687`, reading-copy SHA-256 `9fda82437626d9ae082a17694cfca84fb7307fcf12e400732e8f74b62cf66db5`, one-based inclusive lines [[1, 99]].

`work-config-1482800690`: [dbo.WTH_SplitWorkWithReturnInstr](sql/1482800690.sql); source-definition SHA-256 `a7476992f8f2e6ba528891d8de5b0c889531f4bed973474df841c50c7b2ce1ac`, reading-copy SHA-256 `d7b4cc9c84d76744cb9aa1710feb6141d3037d75344e1ef1d533f2ecbb957c2f`, one-based inclusive lines [[1, 149]].

</details>

<a id="work-confirmation-quantity-differences"></a>

## How full, partial, short and overpick updates differ

Full confirmation can move all of one side quantity even when the requested quantity is smaller. Partial confirmation subtracts only the request. Short and underpick rescale totals; overpick has a branch that rescales totals without replacing total quantity. Parent recalculation then sums all children and uses the summed from/to quantities for completion.

### How it works

1. Identify the confirmation path and compare its from/to/total quantity effects.
2. Check the detail and parent separately after a reported failure.

<details>
<summary>Technical reference and sources</summary>

`work-config-1498800747`: [dbo.WTH_UpdateDetailFull](sql/1498800747.sql); source-definition SHA-256 `f6ef930a8de0060c9365480909dd38e5bb6aa17582a9c317723c4dc74f527354`, reading-copy SHA-256 `4a17a0f7cad32f1ffa537793b65ed341e3112899f77cc16ff8a347a177e71aa1`, one-based inclusive lines [[1, 128]].

`work-config-1514800804`: [dbo.WTH_UpdateDetailOverPick](sql/1514800804.sql); source-definition SHA-256 `cce2558426169652ecb9ee1e4ff2b6ead8ee213f8411952d8fb1606b634efb96`, reading-copy SHA-256 `f36093a8c00b1f8d6b1f477731f823e861fd291c4e44b1efd2b01d10108b857f`, one-based inclusive lines [[1, 122]].

`work-config-1530800861`: [dbo.WTH_UpdateDetailPartial](sql/1530800861.sql); source-definition SHA-256 `28a42f3174091452626e1188940897f33f154fefe240866b72160f4f9db7d8a2`, reading-copy SHA-256 `4326aea167140ab7f288ddc87218d5adde45b9ab910fa25f8794dfdf6ad49fc2`, one-based inclusive lines [[1, 99]].

`work-config-1546800918`: [dbo.WTH_UpdateDetailShort](sql/1546800918.sql); source-definition SHA-256 `638d3e0ce132165aa1ecc43f21517f2bdc5fd6da477cc0d8c82b647410853440`, reading-copy SHA-256 `8e5e951fdc47aa3f83bd27926b38ce7b48932be863e81753e468737318415415`, one-based inclusive lines [[1, 119]].

`work-config-1562800975`: [dbo.WTH_UpdateDetailUnderPick](sql/1562800975.sql); source-definition SHA-256 `f8ea719f2f73986efa6e68683efed7284553cc2feb6c4a74b52e39193a4fbb82`, reading-copy SHA-256 `23eb9cdddc2307bb0dbda69939bbd3666a4f1d6b52bca097dfa749bc81fa4f18`, one-based inclusive lines [[1, 113]].

`work-config-258099960`: [dbo.WTH_UpdateHeader](sql/258099960.sql); source-definition SHA-256 `78fde2ea10d4e5b9b38fc31eae12f2df04db6dccae57d79423d9283cd56e45c8`, reading-copy SHA-256 `9acb8847acb5420ea7d4c5686eb80141a00a98423a3cbdae3aa3b66c8a21bcd1`, one-based inclusive lines [[1, 74]].

</details>

<a id="work-status-dispatch"></a>

## How work confirmation advances related record status

Status advancement dispatches by the supplied instruction type. Shipment, receipt, work-order and dock paths use different quantity, mode and configuration rules. The captured batch-status procedure contains only its declaration and comments; its name does not establish a batch update implementation.

### How it works

1. Identify the instruction type, confirmation mode and related record identity.
2. Keep a configured next status separate from a completed end-to-end workflow.

<details>
<summary>Technical reference and sources</summary>

`work-config-1959326390`: [dbo.WTH_UpdateDetailsHeader](sql/1959326390.sql); source-definition SHA-256 `16f6ab9b10a53de81d0882ec73e42fb35d43be70b2c03912d0112232f14ff9a4`, reading-copy SHA-256 `3df170cb207f05d9b81c608015f28ef1dd92547eb3e833d94964a451d5541fad`, one-based inclusive lines [[1, 25]].

`work-config-1578801032`: [dbo.WTH_UpdateStatus](sql/1578801032.sql); source-definition SHA-256 `6ccce9eacdad61531287ae7733108c14c97d6d226f9dfb75debb80e2cbd4dac4`, reading-copy SHA-256 `5a373b692339f4af2c1c15404dc5507f29e5878a29c4035db35f65ffe7b228f7`, one-based inclusive lines [[1, 320]].

`work-config-1975326447`: [dbo.WTH_UpdateStatusBatch](sql/1975326447.sql); source-definition SHA-256 `8d138992b03ce6b8116f314e65f11080def911215116c57521fa5b99ff48c5d3`, reading-copy SHA-256 `1d490e27551aa40005d033c2b2adf3a8886e6d49ad33fa6af74069fcfbb42d33`, one-based inclusive lines [[1, 34]].

`work-config-1594801089`: [dbo.WTH_UpdateStatusDockMgmt](sql/1594801089.sql); source-definition SHA-256 `ae7da301bef12d62ae41a30883ed6b29dd28c3da5fc18b8c5d28dc25ffa53221`, reading-copy SHA-256 `5b24fa8c3fc4f4227314b7e2d85dda08591632feb6bd269ff13e56561a1d2a7b`, one-based inclusive lines [[1, 118]].

</details>

<a id="work-cancellation-paths"></a>

## Stuck work: deletion, wave cancellation and receipt reversal

Work deletion, wave cancellation, Unlocate and Cancel Check In reverse different stages. Choose the route from the work origin, completed confirmations and actual product location.

### How it works

1. Compare the work type, originating wave or receipt, From/To locations, license plate, lot and remaining details with the last confirmed movement and transaction history.
2. Work Insight Delete removes instructions and supporting allocations and can update shipment records. Its restrictions include not-closed work, active work, unreleased-wave work and specified replenishment, transfer and shipment links.
3. Cancel Wave applies after Run and before Release. Eligibility checks may reject cancellation. Replenishment serving another wave may be retained, extracted or prevent cancellation according to the wave configuration.
4. Cancel Check In applies only before locating. For located receipt product, Unlocate is separate and is disallowed after created work has executed. Cancel Check In restores open receipt quantity; an interface-upload warning also requires ERP reconciliation.
5. If recorded confirmations disagree with physical location, resolve that discrepancy before selecting a reversal. Retain the exact rejection and last successful confirmation for support.

### Settings and prerequisites

- Default Status When Shipment Is Rejected supplies shipment statuses for the documented deletion route.


### Limits

- The Work Insight source literally lists work that is not closed as a deletion restriction; this article does not reverse that wording into permission to delete open work.
- The documentation provides no universal reversal for partially moved or already executed work.


### Related articles

- [Work unit remains open: confirmation and holds](#work-completion-checks)

<details>
<summary>Technical reference and sources</summary>

`operator-work-processing`: [Processing Work](../AIM/reading/2a849da2c18bc5244f4e44f5346f871a765c86c96d43a011314a5857cfea60c5.md); AIM article `2a849da2c18bc5244f4e44f5346f871a765c86c96d43a011314a5857cfea60c5`, original SHA-256 `2a00aeeb302e41866c8b8f4b91bb84245976cb5fb4366177c3185b2ab3488cb0`, nodes n121, n123, n139, n151, n173, n189, n215, n324, n369, n377, n389, n406, n442, n444, n453, n456.

`operator-wave-cancel`: [Canceling a Wave](../AIM/reading/f95431ca9a42f8cc326def4b0c44563876797b45e44e9268cf9b9a4d634f5f9f.md); AIM article `f95431ca9a42f8cc326def4b0c44563876797b45e44e9268cf9b9a4d634f5f9f`, original SHA-256 `9bfe45cfd7a4942002d0107110ae7c8149a7ada1ef9853347fdce43ad290c3e2`, nodes n58, n65, n68, n92, n125, n188, n195, n200, n335.

`operator-receipt-workbench`: [Checking In and Locating Product (Receipt Workbench)](../AIM/reading/a357eac1f7ebf1b8fcf6edee90c086783da65f07d18fbdcc06236891e314cebc.md); AIM article `a357eac1f7ebf1b8fcf6edee90c086783da65f07d18fbdcc06236891e314cebc`, original SHA-256 `d17a1f9b5a6e3db726b8fdce3c6368c6702a56e6b32b98c5c864c0e4885d4d01`, nodes n206, n233, n237, n267, n434, n435, n438, n480, n486, n489, n492, n495, n512, n574, n598, n611, n613, n636.

`operator-container-insight`: [Using the Shipping Container Insight Screen](../AIM/reading/56f58af05b639903354ee78fe799f51fefee04136179aa4cf2c434fc9c82a65a.md); AIM article `56f58af05b639903354ee78fe799f51fefee04136179aa4cf2c434fc9c82a65a`, original SHA-256 `4a61e596554a32153d6b748d38952aabd4ec8a0cc84295a3b78214b5d2c0ce0a`, nodes n58, n283, n319, n332, n336, n354, n364, n385, n430, n434.

</details>

<a id="locating-destination-triage"></a>

## Unexpected putaway destination: ordered rules and decision history

A location can look empty and still fail putaway eligibility. Locating rules evaluate ordered strategies, selected locations, units and capacity.

### How it works

1. Identify the receipt container's locating rule. Receipt Workbench Destination shows the rule after check-in and the destination after locating. Parent locating uses the parent rule; child locating uses the nested container's rule.
2. Read details in ascending sequence. Each strategy applies only to its Location Selection and sort; locations outside that selection are not candidates.
3. Check the strategy's restrictions. Empty Location excludes another item's permanent assignment; same-lot consolidation requires a matching lot; Fill One And Only One Location stops at the selected location.
4. Check quantity, unit and capacity. Item/location capacity takes precedence over multi-item volume calculation. Split Quantity permits a remainder to continue to another detail, but a serial-linked receipt container cannot be split.
5. Delayed Locating plus Create Putaway Work uses a receiving pre-locate location. Otherwise normal details apply. Quick Receive can ask for a location when none is found.
6. Use Process History for decisions and failures and Transaction History for actual locating events. Compare the recorded rule, sequence and reason with the intended destination.

### Limits

- There is no documented universal exception-location fallback. Process History may not list every rejected candidate.


### Related articles

- [Locating: purpose and processing](#process-locating)

<details>
<summary>Technical reference and sources</summary>

`operator-locating-process`: [Locating Process Summary: Functionality](../AIM/reading/4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa.md); AIM article `4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa`, original SHA-256 `e215745a6d81b87363e12c8d05d0ac51d7b6337430ce4b448bc6edcedf67b24a`, nodes n64, n66, n83, n87, n94, n96, n102, n105, n108, n113.

`operator-locating-rules`: [Defining Locating Rules](../AIM/reading/a3869416433c59c85b566e9a0be734881a8f8c0a3757934f651c97c14db936eb.md); AIM article `a3869416433c59c85b566e9a0be734881a8f8c0a3757934f651c97c14db936eb`, original SHA-256 `1a22af46e7904e61aa299862372a5f075f9ac75fa4cdc4773ca65f46b6952ab4`, nodes n58, n62, n112, n115, n118, n122, n125, n131, n134.

`operator-receipt-workbench`: [Checking In and Locating Product (Receipt Workbench)](../AIM/reading/a357eac1f7ebf1b8fcf6edee90c086783da65f07d18fbdcc06236891e314cebc.md); AIM article `a357eac1f7ebf1b8fcf6edee90c086783da65f07d18fbdcc06236891e314cebc`, original SHA-256 `d17a1f9b5a6e3db726b8fdce3c6368c6702a56e6b32b98c5c864c0e4885d4d01`, nodes n206, n233, n237, n267, n434, n435, n438, n480, n486, n489, n492, n495, n512, n574, n598, n611, n613, n636.

`operator-mobile-receiving`: [Warehouse Mobile Receiving](../AIM/reading/21b18b42c82e530935c24cb0848bb4d666bef09aa74cbd6ce61dd8b24e457e99.md); AIM article `21b18b42c82e530935c24cb0848bb4d666bef09aa74cbd6ce61dd8b24e457e99`, original SHA-256 `c778b2f4c14458602e67139dffde7a0b7bf1315cbe7b33f3df785ab0bf26bd13`, nodes n276, n311, n329, n357, n360, n363, n367, n371, n418, n420, n423, n430, n432, n433, n435, n450, n454, n462, n464, n466, n475, n477, n478, n479, n480, n797.

</details>

<a id="receiving-lot-serial-prompts"></a>

## Receiving prompts for lot and serial numbers

Receiving collects the tracking information required for the item and receiving flow. Existing receipt-line values and grouping can change which prompts appear.

### How it works

1. On the item, check Lot Controlled and Lot Template, then Serial Number flow options and Template. Lot templates define ID structure; serial tracking can apply to inbound, inventory or outbound. Without a serial template, free-format characters are permitted.
2. Mobile lot-controlled receiving can request a lot with or without a template. A template may populate lot and expiration values; without one, the flow can still request lot, expiration/frozen state and inventory status.
3. Check whether the receipt line already supplies the lot. Existing lot data can supply expiration/status; a change may require Confirm Lot Update.
4. Serial prompts follow checked-in quantity. Duplicate entries are rejected and configured formats validated. The nested-parent flow has separate support for inbound/inventory serials supplied through the interface and for outbound-only tracking.
5. Receipt Workbench collects values through Lot Entry and Serial Number Entry during check-in. Its sequence differs from mobile, so identify the actual screen and selected receiving preference.
6. When check-in splits quantity among containers, tracking may be requested for each. Check the storage template's Group During Check In and unit-of-measure breakdown.

### Related articles

- [Configuring over-receiving and receipt execution](#receiving-overage-configuration)

<details>
<summary>Technical reference and sources</summary>

`operator-item-tracking`: [Defining Items](../AIM/reading/505c5c4630e085fc146ea8699fd6ca8b29c4f269b413b1ce93e0e981d01241b2.md); AIM article `505c5c4630e085fc146ea8699fd6ca8b29c4f269b413b1ce93e0e981d01241b2`, original SHA-256 `fe23b80dc74ea96572b3a0f913853b8c6ab28e85fb76932b44d53aa1a42caf83`, nodes n58, n153, n155, n157, n159, n282, n284, n286, n291, n301.

`operator-mobile-receiving`: [Warehouse Mobile Receiving](../AIM/reading/21b18b42c82e530935c24cb0848bb4d666bef09aa74cbd6ce61dd8b24e457e99.md); AIM article `21b18b42c82e530935c24cb0848bb4d666bef09aa74cbd6ce61dd8b24e457e99`, original SHA-256 `c778b2f4c14458602e67139dffde7a0b7bf1315cbe7b33f3df785ab0bf26bd13`, nodes n276, n311, n329, n357, n360, n363, n367, n371, n418, n420, n423, n430, n432, n433, n435, n450, n454, n462, n464, n466, n475, n477, n478, n479, n480, n797.

`operator-receipt-workbench`: [Checking In and Locating Product (Receipt Workbench)](../AIM/reading/a357eac1f7ebf1b8fcf6edee90c086783da65f07d18fbdcc06236891e314cebc.md); AIM article `a357eac1f7ebf1b8fcf6edee90c086783da65f07d18fbdcc06236891e314cebc`, original SHA-256 `d17a1f9b5a6e3db726b8fdce3c6368c6702a56e6b32b98c5c864c0e4885d4d01`, nodes n206, n233, n237, n267, n434, n435, n438, n480, n486, n489, n492, n495, n512, n574, n598, n611, n613, n636.

</details>

<a id="packing-container-type-eligibility"></a>

## Packing station container choices: company and warehouse access

Container types define package dimensions and limits. Company and warehouse access determine which types are available for manual packing and related container actions.

### How to configure

1. In Container Types, set Company Access and Warehouse Access for the shipment context. Company authorization applies when the shipment has a company; warehouse authorization applies whether that field is blank or filled.
2. In User Profile, assign Packing Preferences; a blank value uses *Default. That preference controls initiation and manual/system container IDs. It does not replace type authorization, and an existing packed container retains its type.
3. Define a type for each package used. Set its dimensions, Maximum Weight including the empty container, and Weight Tolerance for the difference between estimated and actual weight at close.
4. Configure wave container eligibility through packing classes, groups and types, and pallet eligibility through pallet-building criteria and masters. These paths do not use the manual Company Access/Warehouse Access checks.
5. Use Use As Default only for scan-and-weigh creation when no type is interfaced. Selecting it sets Company Access to All; it has no stated effect outside that scan-and-weigh default.

### Limits

- Workstation setup supports document routing and printing; it does not define a separate packing-station container-type list in the cited instructions.


### Related articles

- [Keeping container contents together or separate](#packing-classes-and-criteria)
- [Configuring packing preferences for users](#packing-preference-configuration)

<details>
<summary>Technical reference and sources</summary>

`operator-container-types`: [Defining Container Types](../AIM/reading/b8520236e77bf1d9729a56d56a398123183351403f9a3eff7e86595795483b9e.md); AIM article `b8520236e77bf1d9729a56d56a398123183351403f9a3eff7e86595795483b9e`, original SHA-256 `ab44226d2496a7f8cc604d66ede0285a6c10a1d78bffb5e3a6d09f677e62e18e`, nodes n58, n66, n128, n131, n139, n145, n148, n150, n155.

`operator-user-preferences`: [Defining User Profiles](../AIM/reading/80b3ffb7968806f7f9c954f5e2af42c649492c456ff19cd59e91cecca1bd3f51.md); AIM article `80b3ffb7968806f7f9c954f5e2af42c649492c456ff19cd59e91cecca1bd3f51`, original SHA-256 `07be810ab7cb93c9ffe412176f460f3987f253e766b84616a9b003235d28de6f`, nodes n58, n172, n189.

`operator-packing-screen`: [Packing a Container](../AIM/reading/9b67b9530e31965bd804c9ba287844c4c4e58e604703f6bffbfb9b24b1d819ac.md); AIM article `9b67b9530e31965bd804c9ba287844c4c4e58e604703f6bffbfb9b24b1d819ac`, original SHA-256 `d583b87e4904b3186103603a6378e213a5be4aafb82bc936b3397b0b6bd6be57`, nodes n59, n138, n141, n144, n147, n150, n161, n164, n167, n169, n172, n175, n178, n186, n188, n193, n195, n198, n202, n206, n210, n213, n216, n224, n227, n231, n233, n236, n243, n252, n255, n258.

`operator-workstation`: [Workstation Configuration](../AIM/reading/b8d6ad6ff9d28497e03fe77e2e384a39d93718f9fb7bb39c83706b3b8c603bf7.md); AIM article `b8d6ad6ff9d28497e03fe77e2e384a39d93718f9fb7bb39c83706b3b8c603bf7`, original SHA-256 `6a8ab82f7c10053906a23d880f9e729facc1b53225db46d271c4123935020ab0`, nodes n58.

</details>

<a id="packing-replacement-lp-context"></a>

## Packing and mobile Close Container: SCALE base workflow

Packing and Warehouse Mobile Close Container accept different inputs. Packing identifies shipment items and quantities; Mobile Close Container identifies the shipping container and its weight.

### How it works

1. In Warehouse Mobile Close Container, enter or scan Container ID. A valid container retrieves its ID, System Weight and Actual Weight.
2. Tap Go to use system weight, or enter Actual Weight and tap Go. Weight includes the container type and item contents; a value outside tolerance prompts confirmation. Success displays Container is Closed.
3. In Packing, initiate with the preference's shipment, ERP order or invoice identifier. The screen lists eligible open lines; unreleased waves and the configured Status Range affect availability.
4. Choose an existing shipping container or create a new ID according to Container Assignment Method. Existing containers retain their type. Scan an item/cross-reference when Validate Item is enabled; otherwise select its row and quantity.
5. Select Pack or Pack All. Completed lines disappear and totals update; serial or catch-weight items may need additional entry. Read a failed row through its Error checkbox.
6. After packing is complete, Close opens the closing workflow. Successful closure advances status and prevents further packing; optional manifesting, printing and load assignment follow separate settings.
7. QC must be resolved and pending VAS follows its preference. Creating a new container during close is a separate remote-desktop system-menu option; it is not part of the described Warehouse Mobile route.

### Related articles

- [Using the Packing screen](#packing-screen-guide)
- [Configuring packing preferences for users](#packing-preference-configuration)
- [Container will not close: packing, QC, VAS and weight](#container-close-checks)

<details>
<summary>Technical reference and sources</summary>

`operator-mobile-close`: [Warehouse Mobile Close Container](../AIM/reading/b33a75f313a267b2873999318c8752e9ddbe07fbd8201653f8f3aa6b757253b5.md); AIM article `b33a75f313a267b2873999318c8752e9ddbe07fbd8201653f8f3aa6b757253b5`, original SHA-256 `9993e9e6a1c1b0d3c7db41486e42317efc9499c4bcd71a7fc83ed80680a63475`, nodes n56, n57, n82, n84, n87, n88, n90, n91, n92, n93, n94, n95, n96, n97, n98, n111, n112, n113, n114, n115, n119, n120, n121, n122.

`operator-packing-screen`: [Packing a Container](../AIM/reading/9b67b9530e31965bd804c9ba287844c4c4e58e604703f6bffbfb9b24b1d819ac.md); AIM article `9b67b9530e31965bd804c9ba287844c4c4e58e604703f6bffbfb9b24b1d819ac`, original SHA-256 `d583b87e4904b3186103603a6378e213a5be4aafb82bc936b3397b0b6bd6be57`, nodes n59, n138, n141, n144, n147, n150, n161, n164, n167, n169, n172, n175, n178, n186, n188, n193, n195, n198, n202, n206, n210, n213, n216, n224, n227, n231, n233, n236, n243, n252, n255, n258.

`operator-packing-preferences`: [Establishing Packing Preferences](../AIM/reading/b11f0ebd7cbea45a5ee74c4fce6f70b1c1851343ff369ef90ee6cabd60514a60.md); AIM article `b11f0ebd7cbea45a5ee74c4fce6f70b1c1851343ff369ef90ee6cabd60514a60`, original SHA-256 `0e2e312bae162513a7cf5930ac06edc6e2a231a9c66d499231453b25038c2e34`, nodes n58, n135, n139, n142, n145, n148, n151, n154, n157, n161, n164, n166, n170, n172, n174, n177, n181, n183, n185, n188, n190, n194, n196, n199, n208, n212, n215, n218, n229, n236, n239, n248, n253, n256, n258, n262.

`operator-close-container`: [Closing a Container](../AIM/reading/f992a81240ef21071a0c60e111f7a41770da3bcd1ad4ca55d2f3db634e255a7f.md); AIM article `f992a81240ef21071a0c60e111f7a41770da3bcd1ad4ca55d2f3db634e255a7f`, original SHA-256 `be502f76ac9fe2ec6ac77845a740c73838548bea5c04b30b17d80b3594db2913`, nodes n58, n63, n66, n69, n72, n135, n138, n143, n145, n147, n149, n155, n157, n158, n160, n163, n170, n180, n188, n195, n197, n200, n203, n205.

</details>

<a id="unpack-repack-container"></a>

## Moving packed items: unpack, repack or nest

Use Update Packed Quantity to remove an item quantity from a loose packed container. Use nesting to move an intact child container. These actions change different parts of the container structure.

### How it works

1. In Shipping Container Insight, select an individual item in a loose packed container. Update Packed Quantity is unavailable for parent and full-container records.
2. Enter the quantity that should remain. To remove 2 from 8, enter 6. SCALE unpacks the difference and records history; serial or catch-weight items require the identifiers or weights being removed.
3. Repack through Packing only when the shipment line has available quantity and the destination is an eligible open container. A closed destination cannot accept additional items.
4. For a whole child container, use the eligible Nest/Combine or re-nest flow. Same-shipment and dock requirements apply; active work can block the action. Combining loose containers nests one under the other rather than merging their quantities.
5. Check source/destination status, work, release and security restrictions. After the permitted operation, confirm remaining source quantity, destination contents and transaction history against the physical contents.

### Limits

- The sources do not establish a general reopen action or blanket permission to unpack closed containers or repack between unrelated shipments.


### Related articles

- [Using the Packing screen](#packing-screen-guide)
- [Packing station container choices: company and warehouse access](#packing-container-type-eligibility)

<details>
<summary>Technical reference and sources</summary>

`operator-container-insight`: [Using the Shipping Container Insight Screen](../AIM/reading/56f58af05b639903354ee78fe799f51fefee04136179aa4cf2c434fc9c82a65a.md); AIM article `56f58af05b639903354ee78fe799f51fefee04136179aa4cf2c434fc9c82a65a`, original SHA-256 `4a61e596554a32153d6b748d38952aabd4ec8a0cc84295a3b78214b5d2c0ce0a`, nodes n58, n283, n319, n332, n336, n354, n364, n385, n430, n434.

`operator-unpack-quantity`: [Quantity In Container Field](../AIM/reading/a1faa0e1355de431b077b9a3474599d133c6df165074b84f2689fab45de39271.md); AIM article `a1faa0e1355de431b077b9a3474599d133c6df165074b84f2689fab45de39271`, original SHA-256 `4dd83973786658f3453dbe6c9ff71f4ad0badfe2085939e03f7bfaf6217bcfb4`, nodes n58.

`operator-packing-screen`: [Packing a Container](../AIM/reading/9b67b9530e31965bd804c9ba287844c4c4e58e604703f6bffbfb9b24b1d819ac.md); AIM article `9b67b9530e31965bd804c9ba287844c4c4e58e604703f6bffbfb9b24b1d819ac`, original SHA-256 `d583b87e4904b3186103603a6378e213a5be4aafb82bc936b3397b0b6bd6be57`, nodes n59, n138, n141, n144, n147, n150, n161, n164, n167, n169, n172, n175, n178, n186, n188, n193, n195, n198, n202, n206, n210, n213, n216, n224, n227, n231, n233, n236, n243, n252, n255, n258.

`operator-close-container`: [Closing a Container](../AIM/reading/f992a81240ef21071a0c60e111f7a41770da3bcd1ad4ca55d2f3db634e255a7f.md); AIM article `f992a81240ef21071a0c60e111f7a41770da3bcd1ad4ca55d2f3db634e255a7f`, original SHA-256 `be502f76ac9fe2ec6ac77845a740c73838548bea5c04b30b17d80b3594db2913`, nodes n58, n63, n66, n69, n72, n135, n138, n143, n145, n147, n149, n155, n157, n158, n160, n163, n170, n180, n188, n195, n197, n200, n203, n205.

`operator-container-nesting`: [Nesting a Container](../AIM/reading/7b4a6ef1c835af34ee3893ec7445fc39b81925227dcfef1fff39adfb2392e9e9.md); AIM article `7b4a6ef1c835af34ee3893ec7445fc39b81925227dcfef1fff39adfb2392e9e9`, original SHA-256 `d8d9012cd890755545465652842cd70ec20c1f653a492c150f23c34327568d33`, nodes n58, n60, n139, n214, n217, n226, n229, n232, n235, n238, n389, n392, n395, n398, n407, n410.

</details>
