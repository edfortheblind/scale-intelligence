# SDD product distinctions and reviewed findings

Only cited portions are reviewed. Full source hashes and exact nodes are in [reviewed-knowledge.json](reviewed-knowledge.json). Later visual/table evidence is an overlay; retained extraction JSON keeps its extraction-time exceptions. See [coverage](REVIEW_COVERAGE.md) and [logical-table audit](TABLE_REVIEW.md).

## Product and document identity

- **SCALE** (`sdd-61bfda888fe30365`): Not established in supplied body; Not established. Training compilation; no exact SCALE release established. Do not inherit a release from nearby files. Sources: [sdd-61bfda888fe30365 b00001, b00002, b00003](reading/sdd-61bfda888fe30365.md#b00001)
- **SCALE 2020** (`sdd-f46806ef53e15f07`): Revision history ends 1.1; Cover 7 January 2026; revision history 29 July 2023. Cover date and revision history differ; neither makes this a SCALE 2026 guide. Sources: [sdd-f46806ef53e15f07 b00001](reading/sdd-f46806ef53e15f07.md#b00001); [sdd-f46806ef53e15f07 b00006](reading/sdd-f46806ef53e15f07.md#b00006); [sdd-f46806ef53e15f07 b00010](reading/sdd-f46806ef53e15f07.md#b00010)
- **SCALE 2021** (`sdd-56008a31665dcc23`): Not established; Not established. Slide 3 names SCALE 2021, but slide 44 mixes ILS 2016 and 2021 paths and the deck uses older screenshot/footer dates. Treat as mixed-era training; no document revision or uniform example release established. Sources: [sdd-56008a31665dcc23 s001-sh003, s003-sh003](reading/sdd-56008a31665dcc23.md#s001-sh003); [sdd-56008a31665dcc23 s044-sh004](reading/sdd-56008a31665dcc23.md#s044-sh004)
- **Manhattan Active SCALE** (`sdd-d4675a92502c23f4`): Not established; Printed 13 August 2026 10:39 AM. Print timestamp is not release date; page 2 limits publishing guidance to Manhattan Active SCALE. Sources: [sdd-d4675a92502c23f4 p001-b001, p001-b006, p002-b004](reading/sdd-d4675a92502c23f4.md#p001-b001)
- **Manhattan Active SCALE** (`sdd-c4c7e01f8ccad48a`): 1.4; Modified 31 August 2023. Document version is separate from product release. Implementation design, not this deployment. Sources: [sdd-c4c7e01f8ccad48a b00010](reading/sdd-c4c7e01f8ccad48a.md#b00010); [sdd-c4c7e01f8ccad48a b00019](reading/sdd-c4c7e01f8ccad48a.md#b00019); [sdd-c4c7e01f8ccad48a b00153](reading/sdd-c4c7e01f8ccad48a.md#b00153); [sdd-c4c7e01f8ccad48a b02436](reading/sdd-c4c7e01f8ccad48a.md#b02436)
- **Manhattan Active SCALE** (`sdd-1c25f20de1eafc3e`): Conflict: cover 1.0; revision history ends 1.3; Modified 10 December 2024. Version conflict retained. Filename agrees with revision history, but cover remains 1.0. Sources: [sdd-1c25f20de1eafc3e p001-b006, p001-b010, p001-b013, p005-b010, p118-t002](reading/sdd-1c25f20de1eafc3e.md#p001-b006)
- **Manhattan Active SCALE** (`sdd-d50ca4a96095c930`): 1.5; Modified 3 September 2024. Implementation design, not this deployment. Sources: [sdd-d50ca4a96095c930 p001-b004, p001-b007, p001-b010, p010-b003](reading/sdd-d50ca4a96095c930.md#p001-b004)
- **Manhattan Active Warehouse Management (MAWM)** (`sdd-de62bfaf88f5d35b`): 2.11; Revision history 29 April 2025. MAWM is a separate product. No SCALE behavioral equivalence inferred. Duplicate original indexed once. Sources: [sdd-de62bfaf88f5d35b b00005](reading/sdd-de62bfaf88f5d35b.md#b00005); [sdd-de62bfaf88f5d35b b00422](reading/sdd-de62bfaf88f5d35b.md#b00422)

## Reviewed claims

### work-monitor

Work Insight groups work by Open, In Progress and Closed and supports reviewing work-unit details.

Two implementation documents describe this behavior; actual screen content and deployed counts are unobserved. Classification: `vendor_behavior`.

[sdd-c4c7e01f8ccad48a b01632](reading/sdd-c4c7e01f8ccad48a.md#b01632); [sdd-d50ca4a96095c930 p071-b003](reading/sdd-d50ca4a96095c930.md#p071-b003)

### covetrus-auto-putaway-timing

The Covetrus SDD warns that automatic putaway can record put confirmation before travel to the destination finishes, excluding that travel from labor-analysis transactions.

An implementation-specific documented concern, not measured timing or a defect established in this deployment. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b02100](reading/sdd-c4c7e01f8ccad48a.md#b02100)

### covetrus-cycle-tolerance

The Covetrus design specifies zero cycle-count tolerances by default, sending discrepancies to review, while a later note calls for positive tolerances to be revisited.

Do not present the design value or unresolved note as active assessed configuration. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01054, b01055, b01056](reading/sdd-c4c7e01f8ccad48a.md#b01054)

### grupo-cycle-tolerance-conflict

The Grupo Julio SDD states current cycle-count tolerance 9999 should be reviewed, then describes a planned zero tolerance requiring reconciliation.

Current-versus-intended distinction within that design is unresolved; neither value applies to the assessed deployment. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p094-b004, p095-b002](reading/sdd-d50ca4a96095c930.md#p094-b004)

### knipper-cart

The Knipper design describes user-built carts, one work unit per shipping container, and serial capture for serial-tracked items.

Named implementation and custom extensions; no equivalence to deployed cart settings established. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p093-b012, p094-b003](reading/sdd-1c25f20de1eafc3e.md#p093-b012)

### land-product-boundary

The LAND design is Manhattan Active Warehouse Management and its latest revision-history entry is 2.11 dated 29 April 2025.

Retain as MAWM comparison material. No SCALE configuration recommendation derives from it. Classification: `implementation_specific_choice`.

[sdd-de62bfaf88f5d35b b00005](reading/sdd-de62bfaf88f5d35b.md#b00005); [sdd-de62bfaf88f5d35b b00422](reading/sdd-de62bfaf88f5d35b.md#b00422)

### label-prerequisites

The SCALE 2021 label deck lists a label file, sometimes a stored procedure, document type, document, routing, optional wave label step, and 203-dpi-compatible printer as label-generation requirements.

Version-specific training. No local print, installed file, printer support or label execution verified. Classification: `vendor_behavior`.

[sdd-56008a31665dcc23 s007-sh004](reading/sdd-56008a31665dcc23.md#s007-sh004)

### insight-publish-boundary

The Insight Architect document describes Stage-to-Production publishing and expressly limits that note to Manhattan Active SCALE users.

Documentation-only association for the future screen register. No UI navigation, publication or deployment performed. Classification: `vendor_behavior`.

[sdd-d4675a92502c23f4 p002-b002, p002-b003, p002-b004](reading/sdd-d4675a92502c23f4.md#p002-b002)

### configuration-order

The HADDAD guide recommends a dependency-aware configuration order while explicitly saying its exact order is not compulsory.

SCALE 2020 example; not a universal migration or activation procedure. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00016, b00017](reading/sdd-f46806ef53e15f07.md#b00016)

### cart-removal-preconditions

The compilation says removing a container clears its group ID and spot; work must be open, grouped and unassigned to a user.

Documented preconditions only; no operational removal performed. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00317, b00318](reading/sdd-61bfda888fe30365.md#b00317)

### cart-grouping-exceptions

Cart grouping excludes serial-number-tracked and catch-weight-tracked items; partial or short picks ungroup batched instructions.

Version-unspecified compilation. Do not infer that every cart method supports the same grouping. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00331, b00332, b00333, b00334, b00337, b00338](reading/sdd-61bfda888fe30365.md#b00331)

### label-contents-timing

The training deck says container-contents labels can print automatically during container creation or manually from Shipping Container Insight after packing.

Training behavior only; no printing or local printer configuration verified. Classification: `vendor_behavior`.

[sdd-56008a31665dcc23 s011-sh005](reading/sdd-56008a31665dcc23.md#s011-sh005)

### label-template-pipeline

The deck shows label-schema connections to stored procedures and field substitutions inside label templates. Its shorthand statement that ZPL pulls SQL data does not establish direct printer-to-database access.

Inference from visible source examples; exact SCALE substitution/runtime contract is not established. No SQL sample is accepted as executable. Classification: `analyst_inference`.

[sdd-56008a31665dcc23 s021-sh004, s036-sh004, s038-sh004](reading/sdd-56008a31665dcc23.md#s021-sh004)

### insight-delete-effect

Deleting a custom Insight screen removes its related configuration records and activates the related base Insight screen.

Documentation-only behavior. No screen was deleted and no deployment state is asserted. Classification: `vendor_behavior`.

[sdd-d4675a92502c23f4 p001-b012, p001-b013](reading/sdd-d4675a92502c23f4.md#p001-b012)

### covetrus-replenishment-strategy-conflict

Covetrus prose names most-available-first for non-lot replenishment, but its following non-lot table lists First In, First Out.

Unresolved source conflict; neither strategy is selected as authoritative. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01144, b01155](reading/sdd-c4c7e01f8ccad48a.md#b01144)

### knipper-replenishment-strategy-conflict

Knipper page 57 prose names most-available-first for non-lot replenishment; page 58 non-lot tables specify First In, First Out.

Visual comparison confirms source disagreement. No default or deployed allocation strategy is inferred. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p057-b003, p058-t005, p058-t006](reading/sdd-1c25f20de1eafc3e.md#p057-b003)

### knipper-appendix-not-completeness

Knipper Appendix A says no key configuration change was identified to the existing workflow, while the body includes future wave-building and configuration choices.

The appendix does not establish that all body proposals were implemented or that no configuration review remains. Classification: `analyst_inference`.

[sdd-1c25f20de1eafc3e p114-b007, p071-b022, p071-b026](reading/sdd-1c25f20de1eafc3e.md#p114-b007)

### grupo-nonuse-boundary

Grupo Julio includes general descriptions of replenishment and bills of material but explicitly says neither replenishment nor Bill of Materials is used in its operation.

General documentation in an SDD does not establish implementation use. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p097-b004, p097-b005, p097-b006, p097-b007](reading/sdd-d50ca4a96095c930.md#p097-b004)

### grupo-wave-flow-variation

The Grupo Julio design lists ten named wave flows with different step sequences; wave master links flow, replenishment master and paperwork master.

Use reviewed logical tables for complete split-page sequences. Names and custom steps are implementation-specific. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p054-b003, p054-t001, p055-t002, p055-t003, p056-t002, p057-t002, p057-t003, p058-t002](reading/sdd-d50ca4a96095c930.md#p054-b003)

### mawm-work-release-engines

LAND MAWM describes Capacity Manager prioritizing resource capacity and Task Release Manager generating/releasing tasks, with a work-release scheduler. Its MHE tasks start Held pending vendor readiness messaging.

MAWM-specific source and AU03 implementation assumption. This is not evidence for SCALE work execution. Classification: `implementation_specific_choice`.

[sdd-de62bfaf88f5d35b b02661, b02662, b02663, b02664, b02665, b02666, b02669](reading/sdd-de62bfaf88f5d35b.md#b02661)

## Diagram and screenshot text descriptions

### Work creation configuration

The wizard proceeds through work creation information, work types, process, criteria and maximums, then finishes. Arrows show this order; they do not prove installed navigation.

Description covers visible meaning; source version and deployment applicability limits remain. No live screen acceptance.

[sdd-61bfda888fe30365 b00007](reading/sdd-61bfda888fe30365.md#b00007)

### Work profile configuration

The profile sequence covers identity, authorized users and warehouses, assignments, zones and sequence records. Adding a sequence covers work types, container picking, assignment, picking and putaway options, success message, then returns to summary and finish.

Description covers visible meaning; source version and deployment applicability limits remain. No live screen acceptance.

[sdd-61bfda888fe30365 b00053](reading/sdd-61bfda888fe30365.md#b00053)

### Work special handling

The flow covers user filter, work types, work zones, two verification groups, picking, override pick, cycle counting and summary.

Description covers visible meaning; source version and deployment applicability limits remain. No live screen acceptance.

[sdd-61bfda888fe30365 b00086](reading/sdd-61bfda888fe30365.md#b00086)

### Work creation flow

System orders creation masters by priority, tests each work request against a master and tries the next master when it does not fit. After requests are associated, ordering attributes sort them, instruction numbers are assigned and work units are created.

Description covers visible meaning; source version and deployment applicability limits remain. No live screen acceptance.

[sdd-61bfda888fe30365 b00702](reading/sdd-61bfda888fe30365.md#b00702)

### Example ordering table

The screenshot lists SHIPMENT_ID, PICK_LOC and ITEM in ascending order. Create Work Unit is Y for SHIPMENT_ID and N for the other two. These are example criteria, not deployment settings.

Description covers visible meaning; source version and deployment applicability limits remain. No live screen acceptance.

[sdd-61bfda888fe30365 b00728](reading/sdd-61bfda888fe30365.md#b00728)

### Non RF work execution

System generates pick lists. An employee receives a list, moves stock from source to destination and optionally records timestamps when available. The completed list goes to a supervisor, who confirms work in Work Insight.

Description covers visible meaning; source version and deployment applicability limits remain. No live screen acceptance.

[sdd-61bfda888fe30365 b00753](reading/sdd-61bfda888fe30365.md#b00753)

### RF work execution

The flow begins with a default or selected profile, then sequence details and system, user or group-user initiation. Eligibility and assignment precede picking. Short, over and partial picks branch separately. Automatic putaway bypasses manual putaway confirmation; optional nesting follows where applicable. Work and profile-sequence loops continue until no work remains.

Description covers visible meaning; source version and deployment applicability limits remain. No live screen acceptance.

[sdd-61bfda888fe30365 b00814](reading/sdd-61bfda888fe30365.md#b00814)

### Picking management

A picker selects a work zone and signs or scans onto available work. Work is assigned, optionally printed and confirmed through start/complete picking. The picker may unassign or hold. At logoff, remaining instructions become available to the next picker; the container proceeds to another zone until all instructions are executed.

Description covers visible meaning; source version and deployment applicability limits remain. No live screen acceptance.

[sdd-61bfda888fe30365 b00867](reading/sdd-61bfda888fe30365.md#b00867)

### System directed work selection

The flow filters available work by priority when that assignment method applies, prefers work already assigned to the user, considers work ahead versus behind the current location, and chooses priority/location/FIFO, location/priority/FIFO or FIFO. It assigns the selected instruction's work unit, retries if assignment fails and returns work in sequence order. Diagram annotations describe concurrency intent, not a proven deployed guarantee.

Description covers visible meaning; source version and deployment applicability limits remain. No live screen acceptance.

[sdd-61bfda888fe30365 b00875](reading/sdd-61bfda888fe30365.md#b00875)

### Document configuration example

The screenshot associates a named document with a document type and template and selects SCALE label output. The displayed template and values are examples. This is one extracted image, not a rendered whole slide.

Description covers visible meaning; source version and deployment applicability limits remain. No live screen acceptance.

[sdd-56008a31665dcc23 s004-sh003](reading/sdd-56008a31665dcc23.md#s004-sh003)

### Document routing example

The routing screenshot shows warehouse, company, customer, ship-to, carrier/service, work type, user and machine criteria. Visible sample values are not inherited as current configuration. The routing selection tab is present but its contents are not visible in this image.

Description covers visible meaning; source version and deployment applicability limits remain. No live screen acceptance.

[sdd-56008a31665dcc23 s006-sh005](reading/sdd-56008a31665dcc23.md#s006-sh005)

### HADDAD receiving dependency diagram

Locations and zones feed locating selection and putaway location groups. Locating selection feeds locating rules; items feed assignment criteria; both join at location-rule assignment. Work group feeds work type and receiving preferences, alongside receipt ID type. Dotted connections lead from rule assignment and preferences to work. Disposition codes appear as a separate configuration box. Arrows express configuration relationships, not database foreign keys.

Static source illustration only; no live behavior, accessibility or deployed values verified.

[sdd-f46806ef53e15f07 b00221](reading/sdd-f46806ef53e15f07.md#b00221)

### HADDAD work dependency diagram

Receipt, shipment-allocation and replenishment criteria feed a work creation master. Work type also feeds that master; work profile and special handling connect to work type. This diagram summarizes dependencies rather than execution ordering.

Static source illustration only; no live behavior, accessibility or deployed values verified.

[sdd-f46806ef53e15f07 b00317](reading/sdd-f46806ef53e15f07.md#b00317)

### HADDAD wave dependency diagram

Wave master connects to criteria, optional maximums, wave flow, replenishment master and container-creation criteria. Wave steps and override data feed flow; allocation also connects to flow. Custom status flow connects to overrides and dock management flow. Carrier/service and locations/zones feed dock carrier assignment and then dock flow. Container type is shown independently.

Static source illustration only; no live behavior, accessibility or deployed values verified.

[sdd-f46806ef53e15f07 b00470](reading/sdd-f46806ef53e15f07.md#b00470)

### HADDAD replenishment quantity and process diagram

The illustration depicts demand quantity minus available quantity as requested quantity. Demand sources are capacity, top-off, wave and pool, filtered by item criteria. Location criteria determine available inventory. Strategy fills, rounds up or rounds down requested quantity; allocation precedes locating, which uses regular and then empty-location criteria. This is conceptual, not a certified numeric implementation.

Static source illustration only; no live behavior, accessibility or deployed values verified.

[sdd-f46806ef53e15f07 b00583](reading/sdd-f46806ef53e15f07.md#b00583)

### Covetrus Cycle Count Plan Insight example

The screen shows plan/date/warehouse filters, an include-released-plans switch, summary tiles for plans, requests, in-review, open and closed, and a plan grid with created/completed dates and count/status columns. Counts and warehouse identifiers belong only to the supplied screenshot.

Static source illustration only; no live behavior, accessibility or deployed values verified.

[sdd-c4c7e01f8ccad48a b01023](reading/sdd-c4c7e01f8ccad48a.md#b01023)

### MAWM non-cubed criteria example

One screenshot shows Non-Cubed Strategy with an active cube-to-capacity criteria. The next explicitly shows Residual Cubing Enabled set to No and later wizard stages disabled. This supports the adjacent LAND non-cubed example only.

Static source illustration only; no live behavior, accessibility or deployed values verified. MAWM only; no SCALE equivalence.

[sdd-de62bfaf88f5d35b b02654, b02657](reading/sdd-de62bfaf88f5d35b.md#b02654)

### MAWM pre-VAS production-order overview

Swimlanes distinguish order management, SAP, MAWM, opening station and SAP manufacturing. SAP creates/releases a production order; MAWM waves and bulk-picks it. Branches route to site-specific staging or sorting, then descriptor labeling and outbound putaway. Outsourced versus in-house VAS changes confirmation handling before SAP goods issue and VAS. This description covers visible major branches; small labels and every integration condition are not certified.

Static source illustration only; no live behavior, accessibility or deployed values verified. MAWM only; no SCALE equivalence.

[sdd-de62bfaf88f5d35b b02180](reading/sdd-de62bfaf88f5d35b.md#b02180)

### MAWM post-VAS goods-receipt overview

Swimlanes distinguish SAP manufacturing, MAWM, SAP and carrier. Outsourced/large orders take bulk receiving; other orders branch into singles or multi-unit receiving. Goods-receipt PIX messages update SAP. Completed sales orders release outbound delivery to an MAWM sales-order wave, then pick/pack, shipping and ship confirmation. The diagram ends with SAP shipment/tracking/invoice and carrier delivery. Only major visible branches are described.

Static source illustration only; no live behavior, accessibility or deployed values verified. MAWM only; no SCALE equivalence.

[sdd-de62bfaf88f5d35b b02183](reading/sdd-de62bfaf88f5d35b.md#b02183)

### Label document type screenshot

The example identifies Shipping Label type 160, label classification, Shipping Container data source and Shipping Label generator. Print procedures include shipping-container and wave-label contexts. These displayed identifiers are examples; the screenshot does not establish current values.

Static source illustration only; no live behavior, accessibility or deployed values verified.

[sdd-56008a31665dcc23 s005-sh005](reading/sdd-56008a31665dcc23.md#s005-sh005)

### Client-specific label ordering example

The label-master criteria screenshot orders by shipping-container type and then shipment ID. The first ordering row creates a break label and the second does not. The surrounding client case explains container-type grouping and a count on the break label.

Static source illustration only; no live behavior, accessibility or deployed values verified.

[sdd-56008a31665dcc23 s033-sh004, s034-sh004](reading/sdd-56008a31665dcc23.md#s033-sh004)

### Label layout before/after example

The paired labels show an enlarged ship-from block, a repositioned postal barcode and a customer-item line beneath SKU. It is a training example of layout changes, not evidence that the barcode scans or meets a current customer specification.

Static source illustration only; no live behavior, accessibility or deployed values verified.

[sdd-56008a31665dcc23 s025-sh004, s029-sh003, s029-sh004, s029-sh005](reading/sdd-56008a31665dcc23.md#s025-sh004)

### Label-schema connection example

The break-label example binds a table alias to a named stored procedure and substitutes its container-type and count fields into label output. Some source screenshot lines are cropped. The source does not document the complete runtime that evaluates these substitutions.

Static source illustration only; no live behavior, accessibility or deployed values verified.

[sdd-56008a31665dcc23 s036-sh004](reading/sdd-56008a31665dcc23.md#s036-sh004)

### Grupo Julio receiving screen sequence

The rendered page shows receiving menu, preference selection, receipt initiation, item/quantity entry, license-plate entry and successful check-in/locate. The caption says Recibo Importacion while the visible selected preference says Recibo Normal; preserve that illustration-label difference.

Static source illustration only; no live behavior, accessibility or deployed values verified.

[sdd-d50ca4a96095c930 p034-b002](reading/sdd-d50ca4a96095c930.md#p034-b002)

### Grupo Julio count execution screenshot

The pictured sequence enters a work unit, location/check digit and quantity, then uses Done from the actions menu. The adjacent text separately describes Verify Bad Count and inconsistent current/planned tolerances; screenshots alone do not resolve those values.

Static source illustration only; no live behavior, accessibility or deployed values verified.

[sdd-d50ca4a96095c930 p094-b002, p094-b004](reading/sdd-d50ca4a96095c930.md#p094-b002)

### Knipper replenishment master example

The screenshot selects Demand from wave and Automatic work creation. It displays a Heavy Case example with priority 5 and Pallet increment. The surrounding prose discusses case and pallet demand, and annotations raise quantity-rule questions; displayed example settings are not universal defaults.

Static source illustration only; no live behavior, accessibility or deployed values verified.

[sdd-1c25f20de1eafc3e p054-b003](reading/sdd-1c25f20de1eafc3e.md#p054-b003)

## Unresolved review and fidelity

- No source proves active settings or exact installed product release in the assessed deployment.
- Knipper cover/version conflict; Grupo Julio cycle-count current/planned tolerance conflict; HADDAD cover/revision-date difference remain explicit.
- Work/Picking compilation release is unspecified; all of its documented rules need version reconciliation.
- MAWM design is excluded from SCALE behavior transfer until claim-specific evidence establishes applicability.
- PDF detected tables include page-border false positives. Candidate tables must not be treated as certified logical tables.
- Extracted source bodies include source examples and notices. No public redistribution or production search eligibility follows.
- Only the listed claims, settings, product markers and visual descriptions received this semantic review; extracted nodes outside their citations remain unreviewed.
- All 45 PPTX slides were visually reviewed after native read-only PowerPoint 16.0 export at 1440x1080. This is static-slide review, not animation, notes, reading-order or font-by-font certification. Several source code screenshots are clipped, notably slides 26, 28, 35 and 36; no complete executable example is inferred.
- DOCX full-page fidelity remains unverified: native Word export failed to finish and produced no PDF. Selected extracted PNG/EMF assets received separate visual review. Untouched extraction JSON retains original extraction-time limitations; this review overlay records later evidence.
- PDF prose, comment balloons and screenshots are distinct evidence. Knipper replenishment UOM annotations question body wording; Knipper and Covetrus non-lot strategy prose conflicts with their tables. These remain unresolved.
- HADDAD b00164 says multiple UMs cannot be created for an item, while surrounding template/item-UM discussion is ambiguous. This sentence is not promoted as a configuration rule.
- The label deck slide 30 contains incomplete-looking SQL examples ending with AND before a closing delimiter. Embedded code and direct-printer SQL semantics are not validated; source references to external label services were not followed or uploaded to.
- Reviewed logical-table overlays preserve split-page continuity and blank cells only for the enumerated tables. All other PDF candidates remain unreviewed.

## PDF continuation — 2026-09-30

Ten new bounded claims and nine visual descriptions supplement the earlier review. Existing claim records are unchanged. PDF strike-through and extraction corrections are documented in the table overlay; no source receives production-index eligibility.

### grupo-receipt-type-validation

Grupo Julio distinguishes Receipt ID Type from the free-format Receipt Type field; the design says SCALE does not validate Receipt Type. REC NAC maps to Receipt Type OC in its example.

[sdd-d50ca4a96095c930 p024-b007, p024-t002](reading/sdd-d50ca4a96095c930.md#p024-b007)

Limit: Named implementation document; no claim about a live interface schema or all SCALE versions.

### grupo-putaway-work-identity

Grupo Julio describes receipt putaway work units identified by Putaway Group ID/LPN and a User Directed work profile; scanning that identity assigns the work unit.

[sdd-d50ca4a96095c930 p042-b015, p042-b017](reading/sdd-d50ca4a96095c930.md#p042-b015)

Limit: The execution paragraph continues onto the next page; this claim covers only identity, initiation and assignment, not the complete confirmation sequence.

### grupo-adjustment-location-boundary

Grupo Julio describes inventory adjustments for located inventory and explicitly excludes the receiving dock location. Negative adjustments use negative quantities; adjustment types can restrict quantities, user access and host upload.

[sdd-d50ca4a96095c930 p088-b004, p088-b007](reading/sdd-d50ca4a96095c930.md#p088-b004)

Limit: Source-described behavior; permissions, quantity limits and upload state were not checked in the assessed deployment.

### grupo-transfer-work-entry

Grupo Julio describes transfer creation from the main/mobile menu or Inventory Insight. Selecting an item/location defaults the from-location and item. Transfer with work must be created on the insight screen; RF can execute that work.

[sdd-d50ca4a96095c930 p089-b006](reading/sdd-d50ca4a96095c930.md#p089-b006)

Limit: The source screenshot is a generic sample, not evidence of currently enabled Create Work or live inventory.

### grupo-extension-strike-through-boundary

The Grupo Julio extension tables visibly strike through EX04, EX07, EX02, EX06 and EX08. Their retained text is historical and must not be promoted to normal approved porting requirements. EX01, EX03, EX05 and EX09 appear unstruck and describe planned porting from 2015 to Active SCALE.

[sdd-d50ca4a96095c930 p103-t001, p103-t002, p103-t003, p104-t001, p104-t002](reading/sdd-d50ca4a96095c930.md#p103-t001)

Limit: Visual styling is absent from raw extracted text. Unstruck planned scope is still not proof of delivery; the struck-through EX07 wording about porting is not an active instruction.

### grupo-actions-excluded

Grupo Julio explicitly lists 21 action items that will not migrate in this project, including AI0003–AI0010 and the additional individually enumerated items in the reviewed table.

[sdd-d50ca4a96095c930 p105-b002, p105-t001](reading/sdd-d50ca4a96095c930.md#p105-b002)

Limit: The excluded list is historical project scope, not a statement that the reported issues currently exist or are resolved in any assessed database.

### knipper-work-order-build-location

Knipper describes host work orders containing the finished item and quantity but no build location. Users supply the build location before allocation, select Allocate all in Work Order Insight, verify allocation/work creation, and release the work order.

[sdd-1c25f20de1eafc3e p062-b009](reading/sdd-1c25f20de1eafc3e.md#p062-b009)

Limit: Comments on the page discuss allocation on release; the authored sequence follows the body, and no automatic-release setting or runtime result is inferred.

### knipper-component-allocation-failure

Knipper says a complete component-allocation failure produces an error and moves the work order into In process; after inventory correction, users can select Allocate All again. For partial failure, the source says successful components still receive work.

[sdd-1c25f20de1eafc3e p063-b012](reading/sdd-1c25f20de1eafc3e.md#p063-b012)

Limit: The partial-failure paragraph continues on page 64, which this batch does not review. Its complete recovery procedure is not claimed.

### knipper-allocation-rejection-body

The revised Knipper body says incomplete shipment-line allocation sends the entire shipment back to the pool on a back order, with rejected shipment status In Pool.

[sdd-1c25f20de1eafc3e p080-b029, p080-b026, p080-b027, p080-b028, p080-b030](reading/sdd-1c25f20de1eafc3e.md#p080-b029)

Limit: Margin comments include This does not happen today followed by Updated and a later resolved note. This is design intent in the revised body, not observed current behavior.

### knipper-pnp-assignment

The Knipper A-PNP allocating-zone example lists Single Item, Dynamically Assigned and Permanent, Not License Plate Tracking, Allocate In Transit, and Inventory Status Available.

[sdd-1c25f20de1eafc3e p079-t002](reading/sdd-1c25f20de1eafc3e.md#p079-t002)

Limit: These are documentary zone characteristics, not a claim about any current location or deployed configuration.

### Grupo Julio illustrative unit hierarchy

Arrows label a small Unit inside an Inner, inners within a Case, and cases above a Pallet. The figure explains nesting levels, with four case outlines and one expanded case. The surrounding text explicitly says it is an example, not the baseline unit-of-measure definition.

[sdd-d50ca4a96095c930 p015-b002, p015-b003](reading/sdd-d50ca4a96095c930.md#p015-b002)

[retained asset 1](assets/sdd-d50ca4a96095c930/61ef915aa65775c4f257ae3f22b22e240270f0708029cac7abe8f0c14e24b2b8.png)

Limit: No numeric pack conversion or live item master is inferred from the drawing.

### Grupo Julio Planned Shipment Insight

The screen places basic criteria and shipment-type/advanced criteria on the left, shipment/line/unit counters above a central selectable shipment grid, and a line summary on the right. The grid groups rows by Wave.

[sdd-d50ca4a96095c930 p051-b002](reading/sdd-d50ca4a96095c930.md#p051-b002)

[retained asset 1](assets/sdd-d50ca4a96095c930/aa3d9bccfefad662698cbfc9ee253a4d07b535c7326b5dd4a686763196dec804.jpeg)

Limit: Document screenshot only; displayed example identities and counts are not current Grupo Julio or assessed warehouse telemetry.

### Grupo Julio inventory-adjustment example

The form shows adjustment type, license plate, location, item/company, lot/expiration, quantity/unit and status. The top-right Adjust action is highlighted; Create work appears dimmed. A small broken-image glyph is visible in the source screenshot.

[sdd-d50ca4a96095c930 p088-b005](reading/sdd-d50ca4a96095c930.md#p088-b005)

[retained asset 1](assets/sdd-d50ca4a96095c930/bf512fb4addc1310c3f2569b0032dd6563a315618293ed745c27294f6be109a8.png)

Limit: No action was invoked; dimming and example values do not prove production permissions, product completeness or required fields.

### Grupo Julio inventory-transfer example

The form adds From location and To location to item, status, company, lot, expiration and quantity/unit fields. The top-right Transfer action is highlighted; Create work is visibly dimmed although the caption calls this transfer with work.

[sdd-d50ca4a96095c930 p089-b006, p089-b007](reading/sdd-d50ca4a96095c930.md#p089-b006)

[retained asset 1](assets/sdd-d50ca4a96095c930/37c36d02e7bbaaab6f427ceff4722e15ef561c10b632a3b051111253f02861c5.png)

Limit: Caption and dimmed control are reported separately. The screenshot does not establish that work creation succeeded or was enabled.

### Knipper Work Order Insight release example

A selected work-order row appears below Orders and finished-item counters. The open Actions menu contains Allocate all and other options; Release at the bottom is outlined in red.

[sdd-1c25f20de1eafc3e p062-b009, p062-b015](reading/sdd-1c25f20de1eafc3e.md#p062-b009)

[retained asset 1](assets/sdd-1c25f20de1eafc3e/b9d932f09cda04d62bd835790034ba58c2e70e33605ddea1d51b52ae54d2e22b.png)

Limit: The figure illustrates the Release control, not successful allocation or release.

### Knipper sample component-pull work creation master

The legacy-style edit dialog shows WO Component Pulls, General/Maximum/User Defined Data tabs, Work Type, Work Unit Field, Creation Method Pre-build, Priority 1, Process, Work Criteria All Components and an Auto Print Documents checkbox. Several dropdown values are clipped at the right edge.

[sdd-1c25f20de1eafc3e p063-b004, p063-b005](reading/sdd-1c25f20de1eafc3e.md#p063-b004)

[retained asset 1](assets/sdd-1c25f20de1eafc3e/3c182c11636f7ee0ee94a40f36a14c1c4f65fa89cb13ff7b402065632630e85e.png)

Limit: Clipped dropdown text is not reconstructed into a full executable configuration. The sample does not supersede the body rule of one component-pick work unit per work order.

### Knipper component-pull RF sequence

Four panels connected left-to-right show work-profile/location entry, two Pick confirmation panels for successive component locations, then Putaway confirmation for all items at the build location. The first panel is labeled System directed, while the adjacent body says user directed.

[sdd-1c25f20de1eafc3e p063-b006, p063-b011](reading/sdd-1c25f20de1eafc3e.md#p063-b006)

[retained asset 1](assets/sdd-1c25f20de1eafc3e/4f8e4f04ecb42f0025da2249b7ebd2a17d99b60ff57307318bd1b723118093e2.png)

Limit: Preserved the screenshot/body direction mismatch. No claim that the pictured workflow is the deployed or final intended profile.

### Knipper Planned Shipment Insight

Basic criteria on the left select Scheduled Ship Date; the central shipment grid groups rows by that date beneath shipment/line/unit counters. A line-count panel appears on the right.

[sdd-1c25f20de1eafc3e p069-b003, p069-b004](reading/sdd-1c25f20de1eafc3e.md#p069-b003)

[retained asset 1](assets/sdd-1c25f20de1eafc3e/22a25e6c14346ed30eb7b58efb902d92002174533cefed6021ff19d5dac12268.png)

Limit: Example dates and counts are screenshot data only; they do not establish current planned shipments.

### Knipper QC exception and Force QC pass illustrations

Five images show a QC failure reason-code dialog, the Actions menu with Force QC pass, a Yes/No confirmation, a green passed-QC message, and process-history rows labeled QC Confirmation / Force QC Pass. Some process-history message and identifier text is truncated at the image edge.

[sdd-1c25f20de1eafc3e p101-b004, p101-b008, p101-b012, p101-b006, p101-b007, p101-b009](reading/sdd-1c25f20de1eafc3e.md#p101-b004)

[retained asset 1](assets/sdd-1c25f20de1eafc3e/51dcc6aac39fa173fe8fbefb01d0054e553e635f31557612ba25affa3073eee8.jpeg), [retained asset 2](assets/sdd-1c25f20de1eafc3e/0747916eedca089cea2cba5991b312ecb23f544ad7b5f57555af0e445b755580.jpeg), [retained asset 3](assets/sdd-1c25f20de1eafc3e/1fa4472048505f5c485a5a873245ed36ee60f96ed33a0bccf295c9320ff4af23.jpeg), [retained asset 4](assets/sdd-1c25f20de1eafc3e/6987f2695f5d76adb5f45a6a1969b05053d1676a0501b72d6f2cd33049488aa1.png), [retained asset 5](assets/sdd-1c25f20de1eafc3e/650deeb88cad335acb4264c681b8dc34f975ab764ac8a6587cbb0001dd6c2b47.png)

Limit: These historical illustrations are not a recommendation to bypass quality review. Comments discuss rare exceptions and distinguish base QC workbench from proposed pallet-level RF extensions. No current authorization or workflow acceptance established.

## Knipper source qualifications — 2026-09-30 delta 2

Ten additional bounded claims and four visual descriptions preserve source distinctions and conflicts. All prior records remain unchanged; the new component-recovery continuation extends the earlier page-63-only claim. Page viewing and candidate disposition do not grant complete semantic or production-index acceptance.

### knipper-interface-channels-and-placeholder-host

Knipper describes API-based downloads into SCALE, XML-file uploads to the host, manual or scheduled interface execution, and configurable failure alerts. The download/upload figures show NetSuite and Boomi, but their adjacent comments explicitly say the host and middleware details still need to be supplied and the pictures updated.

[sdd-1c25f20de1eafc3e p011-b004, p011-b005, p011-b006, p011-b007, p011-b008, p013-b003, p013-b005, p013-b006, p013-b007](reading/sdd-1c25f20de1eafc3e.md#p011-b004)

Limit: The pictured vendor names are illustrative pending-update labels, not verified Knipper systems. No endpoints, schedules, alerts or interface runtime were inspected.

### knipper-receipt-interface-present-future

Knipper describes manual receipt creation for most accounts, with automated receipt downloads only for EDI accounts. The current typical ASN/returns format contains receipt header and detail; a separate three-row header/detail/container table is introduced as a capability Knipper may explore in future.

[sdd-1c25f20de1eafc3e p012-b003, p012-b004, p012-b005](reading/sdd-1c25f20de1eafc3e.md#p012-b003)

Limit: The two tables have different temporal scope. Receipt Order Header, Receipt Order Detail and Receipt Container are source display labels, not established physical SQL identities. No future capability is asserted implemented.

### knipper-manual-receipt-close-upload-qualified

The Knipper body says manually closing a receipt in SCALE uploads a receipt-close inventory transaction. Adjacent comments discuss this as a recommendation to confirm for short receiving; a customer comment says receipts close when remaining inventory is received.

[sdd-1c25f20de1eafc3e p014-b003, p014-b004, p014-b005, p014-b006](reading/sdd-1c25f20de1eafc3e.md#p014-b003)

Limit: Body text and review discussion are preserved separately. The comments do not establish host support or acceptance of short-receipt automatic closure.

### knipper-extension-ex40-collision

Knipper uses EX40 for Custom Receipt from Shipment on page 16 and for Printing multiple work unit document from work insight on page 45. The latter is explicitly conditional on Knipper approval.

[sdd-1c25f20de1eafc3e p016-b008, p045-b003, p045-b004, p045-b005, p045-b007](reading/sdd-1c25f20de1eafc3e.md#p016-b008)

Limit: These passages describe different functions under the same document identifier. They must not be merged solely by EX40, and neither identifies a deployed extension or SQL routine.

### knipper-component-partial-recovery-continuation

The page-63 partial component-allocation failure procedure continues onto page 64: after correcting inventory, select the failed component in the component section and use Allocate to retry it. Successful components already have work. The body recommends verifying component inventory through SCI/Inventory Insight before release.

[sdd-1c25f20de1eafc3e p063-b012, p064-b006, p064-b003, p064-b007, p064-b008, p064-b009, p064-b013](reading/sdd-1c25f20de1eafc3e.md#p063-b012)

Limit: This extends the earlier batch, which had not reviewed page 64. Body wording about work being available immediately after creation coexists with comments requiring work-order release and describing header-level release; immediate availability is not treated as permission to bypass release.

### knipper-post-wave-cancellation-dispute

Knipper describes warehouse-user cancellation from Shipment Insight after wave release: shipment inventory is deallocated and shipping work/containers are removed; picked stock needs an Inventory Management transfer back. Replenishment work is not automatically canceled. The body says cancellation fails while related work is actively executed, but an adjacent comment disputes that behavior and is later marked resolved without a replacement rule.

[sdd-1c25f20de1eafc3e p091-b006, p091-b007, p091-b008](reading/sdd-1c25f20de1eafc3e.md#p091-b006)

Limit: This is a documentary conflict, not a verified runtime rule or an instruction to cancel active work. The body separately limits host changes to In Pool shipments. Current release/version behavior and permissions require independent verification.

### knipper-load-confirm-status-ambiguity

Knipper page 107 first says all shipments must reach Load Confirm Pending, through the Ship Confirm All job, before Confirm Load. Its following paragraph instead says the load leading/trailing statuses should be Ship Confirm Pending when describing avoidance of split shipments.

[sdd-1c25f20de1eafc3e p107-b006](reading/sdd-1c25f20de1eafc3e.md#p107-b006)

Limit: The two status phrases are retained as an unresolved source inconsistency. This review does not select a canonical status predicate, map it to database codes, or assert runtime behavior.

### knipper-workbook-icons-not-reviewed-data

Knipper page 5 presents a Warehouse Stats.xlsx icon and page 113 presents a JKNP_ParkingLot_11122024.xlsx icon under Open Issues. These pages do not expose the workbook cells or issue rows.

[sdd-1c25f20de1eafc3e p005-b003, p005-b004, p113-b003, p113-b005, p113-b006](reading/sdd-1c25f20de1eafc3e.md#p005-b003)

Limit: Local PDF-container inspection found no embedded files and no page-5/page-113 link actions. This establishes only absence from this retained PDF container; it does not assert the external workbooks do not exist. Their contents remain unreviewed.

### knipper-signoff-not-executed-evidence

The retained Knipper sign-off page has blank Signature, Printed Name / Title and Date lines. Its acknowledgement text refers to Memphis, while the earlier scope names Lakewood NJ and Charleston IN distribution centers.

[sdd-1c25f20de1eafc3e p006-b017, p119-b003, p119-b004, p119-b005, p119-b006, p119-b007, p119-b009, p119-b011](reading/sdd-1c25f20de1eafc3e.md#p006-b017)

Limit: The blank form is not evidence of executed customer approval. The place-name mismatch is documentary and is not resolved by this review; the source title Final does not remove it.

### knipper-security-documentary-scope

Knipper Appendix C describes Security Permissions by user, security group, processing function and configuration, with mass assignment to selected windows. It says a user-level record is applied when that employee attempts to access the window.

[sdd-1c25f20de1eafc3e p116-b003](reading/sdd-1c25f20de1eafc3e.md#p116-b003)

Limit: The sample configuration screenshot contains no populated Security for Desktop rows. This source does not prove assessed users, groups, privileges, enforcement, or every conflict-resolution rule.

### Knipper illustrative unit-of-measure nesting

A pallet base supports four drawn cases. The upper-left case shows six inner rectangles; the top-left inner contains four unit marks. Arrows label Unit, Inners, Case and Pallet.

[sdd-1c25f20de1eafc3e p010-b004, p010-b005](reading/sdd-1c25f20de1eafc3e.md#p010-b004)

[retained asset 1](assets/sdd-1c25f20de1eafc3e/61ef915aa65775c4f257ae3f22b22e240270f0708029cac7abe8f0c14e24b2b8.png)

Limit: The text explicitly calls this an example and not the baseline UOMs. Drawing counts are illustrative and do not define configured conversion factors.

### Knipper pending-update interface illustrations

The download drawing flows left to right: NetSuite, Download Feeds arrow, Boomi, an arrow labeled Items/Receipts/Shipments/Work Orders, and SCALE. The upload drawing reverses the endpoints: SCALE, receipt confirmations/shipment confirmations/inventory transactions/item balance, Boomi, Upload Feeds arrow, NetSuite.

[sdd-1c25f20de1eafc3e p011-b004, p011-b006, p011-b007, p011-b008, p013-b003, p013-b005, p013-b006, p013-b007](reading/sdd-1c25f20de1eafc3e.md#p011-b004)

[retained asset 1](assets/sdd-1c25f20de1eafc3e/09ec1846cc57a8733ee3d65748f9f076c719b2687ce52eaca64edc41878ccdcd.jpeg), [retained asset 2](assets/sdd-1c25f20de1eafc3e/98ffcb40506e1fe4249a1fa9bcdcdc7b96510cae95f67aee4b659bb6fbf46931.jpeg)

Limit: Both adjacent comment threads require host/middleware details and picture updates. Endpoint names and connectivity are illustrative, not verified architecture. Arrows do not prove actual transport or execution.

### Knipper high-level outbound flow

Six arrows connect Shipment Creation, Wave Processing, Picking, Packing, Staging and Shipping. The first two boxes are rectangular; the latter four are trapezoids. Their captions respectively describe creating the outbound document, reserving stock/determining pick inventory, retrieving from storage, identifying shipping-box contents, moving containers to staging or pack-and-hold, then assigning transport and confirming departure.

[sdd-1c25f20de1eafc3e p066-b004, p066-b005, p066-b007, p066-b008, p066-b009, p066-b013](reading/sdd-1c25f20de1eafc3e.md#p066-b004)

[retained asset 1](assets/sdd-1c25f20de1eafc3e/0f7d01e73c3eb11604d41381e65623aee934c216a530b9b20992ee529faf5c20.png)

Limit: The source legend associates rectangles with normal system processes and trapezoids with normal user interaction. The text also permits manual wave execution. This is a typical overview, not a complete exception flow or deployment acceptance.

### Knipper Security Permissions configuration example

A desktop Security permissions window contains Search criteria and Search, filter radios All/Configurations/Gadgets and a visibly truncated Pr label, a scrollable two-column list of functions, and a lower Security for Desktop grid with Security level, User/security group and System created columns. The lower grid is empty; a Close button appears at bottom right.

[sdd-1c25f20de1eafc3e p116-b003, p116-b004](reading/sdd-1c25f20de1eafc3e.md#p116-b003)

[retained asset 1](assets/sdd-1c25f20de1eafc3e/6dcc52a41a8e6e96fd82278c389ad827e87ad8aa3231cf41202e2d7d036dfd7f.png)

Limit: No populated permission values are visible. The clipped filter text is not expanded by inference; function labels alone do not prove grants or runtime enforcement.

## Grupo Julio complete page-view continuation

The 77 remaining PDF pages were individually inspected, completing 231/231 PDF page views across the source set. This batch adds bounded interpretations and visual descriptions; it does not certify all semantic content or every embedded screenshot/table. The original source and prior records are preserved.

### Additional reviewed claims

#### grupo-source-authority-and-examples

The Grupo Julio design gives English precedence if its English and Spanish passages differ. Its assumptions also state that screenshots are illustrative and actual options can be configured.

This governs interpretation of this document only. Screenshot values and menus do not establish the assessed deployment, an installed release or verified screen navigation. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p006-b003, p012-b002](reading/sdd-d50ca4a96095c930.md#p006-b003)

#### grupo-interface-migration-boundary

The Grupo Julio migration design selects Web Services for downloads into SCALE and XML files in Azure file storage for ERP reads. It says the older 2015 Direct to Table upload option must be disabled for Item, Receipts and Shipments; interface schedules and frequencies remain for integration testing.

Historical migration intent, not a general claim about all database access or this assessed environment. No host endpoint, schedule or interface execution was verified. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p016-b003](reading/sdd-d50ca4a96095c930.md#p016-b003)

#### grupo-early-receipt-upload-risk

Grupo Julio chooses container-level receipt uploads starting at Putaway Pending to support early ERP availability. The design warns that canceling and receiving an already uploaded container again can duplicate ERP inventory; it recommends uploading at Closed instead, or an operational correction procedure for the chosen early-upload flow.

The document records an implementation tradeoff and a warning, not an observed duplicate, verified remediation or transaction-level idempotency guarantee. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p020-b004, p037-b003, p038-b002](reading/sdd-d50ca4a96095c930.md#p020-b004)

#### grupo-shipping-upload-status-transition

The shipping upload criteria in the Grupo Julio design select shipment or shipment-line upload records and eligible trailing statuses. These criteria trigger upload on a status change, not on the initial shipment download even if that initial status is configured for upload.

Source-described shipping-interface behavior. This does not establish configured statuses, retries, file delivery or ERP receipt in the assessed deployment. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p021-b004, p021-b005, p021-b006](reading/sdd-d50ca4a96095c930.md#p021-b004)

#### grupo-receipt-creation-permission-choice

Grupo Julio chooses to remove manual Receipt Insight creation permission from security groups. The document explicitly says this is not a SCALE limitation. It separately describes full or partial returns using Receipt from Shipment, with optional restriction to supervisors.

Implementation access policy only. Actual user/group grants and enforcement were not inspected. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p025-b002](reading/sdd-d50ca4a96095c930.md#p025-b002)

#### grupo-appointment-open-receipt-precondition

The documented inbound appointment workflow requires a receipt already visible in SCALE and allows appointments only for open receipts. Appointment information includes trailer, dock door, start date/time and end date/time; the design assigns receiving docks manually according to availability.

Documentary workflow association for a future verified screen register; no current navigation, capacity validation or scheduling behavior was exercised. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p028-b004, p029-b004, p029-b005, p029-b008, p030-b004](reading/sdd-d50ca4a96095c930.md#p028-b004)

#### grupo-receipt-exit-versus-close

Leaving a receipt during the described mobile check-in workflow does not close it. The design describes automatic receipt closure after the last LPN is put away when all details are fully received; incomplete receipts require manual closure, and a closed receipt can be reopened for more receiving.

Preserve the distinction between exiting, closing a putaway group and closing a receipt. Receiving-with-groups availability remains qualified by the open issue for Warehouse Mobile 24.1.2278. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p033-b004, p038-b005](reading/sdd-d50ca4a96095c930.md#p033-b004)

#### grupo-putaway-groups-version-conflict

Grupo Julio describes intended receiving and putaway-group workflows, but its unstruck open issue dated 9 August 2024 says Receiving with Putaway Groups is unavailable in Warehouse Mobile 24.1.2278 and gives no expected delivery date.

This unresolved source-version qualification limits the earlier grupo-putaway-work-identity claim and the related group examples. Do not infer that the final document title proves implementation, later release availability or deployment readiness. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p033-b002, p033-b004, p037-b002, p106-b005, p106-b006](reading/sdd-d50ca4a96095c930.md#p033-b002)

#### grupo-receiving-exception-workflow

For missing item weight or dimensions, Grupo Julio calls for correcting the host Item Master and downloading it before receipt. For excess quantity, it calls for another ERP receipt instead of over-receiving. For an incomplete receipt with no further balance expected, it calls for manual closure.

Implementation-specific exception procedures, not universal SCALE restrictions or permission to alter inventory. The same passage also describes coordinating inventory adjustments with the Inventory Team and ERP. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p039-b004](reading/sdd-d50ca4a96095c930.md#p039-b004)

#### grupo-putaway-override-audit

The documented putaway override validates the entered location, updates work and the LPN to the new location, and writes transaction history. The alternative Locate action asks the user to choose a locating rule so SCALE can select the destination; the source says an override can optionally create an activity-based count at the original location.

Documented behavior, not observed runtime or proof that count creation is enabled. Permissions and applicable locating/cycle-count configuration still require deployment evidence. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p044-b002, p044-b004](reading/sdd-d50ca4a96095c930.md#p044-b002)

#### grupo-leading-and-trailing-status

The Grupo Julio design defines shipment trailing status as the least advanced associated status and leading status as the most advanced, derived from the containers for the shipment header.

Source explanation only. This is not a mapping to a reviewed SQL aggregation or evidence of any current shipment state. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p047-b003](reading/sdd-d50ca4a96095c930.md#p047-b003)

#### grupo-allocation-rule-selection

The design says allocation rules may default from the Item Master, arrive through the shipment interface, or be assigned by a wave step before allocation. If no rule is set on the shipment detail, it uses *Default. Active assignment records are checked in priority order; replacing a rule assigned by a previous sequence requires Always Override.

The source does not give a complete precedence rule for every competing item/interface/manual assignment. It first describes selecting lines without rules, so the Always Override statement is retained narrowly for previous sequences. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p061-b003, p062-b003](reading/sdd-d50ca4a96095c930.md#p061-b003)

#### grupo-container-creation-configuration

The container-creation description first handles allocated shippable units as full containers. It groups remaining non-shippable items by Packing Class and associated container group, using weight, volume and critical dimensions. It says an item without an item-unit-of-measure record is treated as having zero dimensions and weight.

General behavior described inside an implementation SDD, not a recommendation to omit dimensions or evidence of deployed cartonization. The document proposes a report to identify missing dimensions. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p065-b002, p066-b002](reading/sdd-d50ca4a96095c930.md#p065-b002)

#### grupo-wave-release-and-hold

Releasing a wave is described as removing the Wave Not Released hold from generated work so picking becomes eligible, and printing applicable wave documents/labels. Hold codes may also be added or removed through Work Insight.

Documentary distinction between running and releasing a wave. It does not establish effective permissions, printer output or all other holds being removed. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p069-b004, p069-b005, p069-b009, p070-b002](reading/sdd-d50ca4a96095c930.md#p069-b004)

#### grupo-shipment-cancellation-conditions

The post-wave cancellation description deallocates the order, deletes created shipping containers and work, and returns the shipment to the pool. Picked items need a separate transfer back to inventory. Shipping work is canceled but replenishment work is not; cancellation fails while related work is actively executed. After release, a warehouse user must cancel because host changes are limited to In Pool.

Historical source contract, not an instruction to cancel operational orders or proof of rollback/atomicity. The SDD separately states that this implementation does not use replenishment. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p070-b006, p071-b002](reading/sdd-d50ca4a96095c930.md#p070-b006)

#### grupo-short-pick-permission-and-reason

In the described footwear flow, a picker needs permission to short pick. The permitted path adjusts quantity and selects a short reason; without permission, the user uses Pass to leave the work suspended and contacts a supervisor.

Implementation example. No specific security grant, reason-code set or assessed user behavior is established. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p074-b002](reading/sdd-d50ca4a96095c930.md#p074-b002)

#### grupo-put-to-light-extension-boundary

Hanging-item picking uses the EX01 Put to Light integration: picking delivers to a pick-and-drop location, a custom mobile sorting step interacts with PTL, and a PTL confirmation sends information back to SCALE to confirm the next pick and putaway. Folded-item flow is described as similar.

The SDD explicitly defers the full behavior to a separate EX01 document. Hardware protocol, retry/error handling and installed custom code are not supplied by this high-level account. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p074-b002, p075-b002](reading/sdd-d50ca4a96095c930.md#p074-b002)

#### grupo-container-edit-location-precondition

Shipping Container Insight is described as supporting container type/content changes and unpacking by setting quantity to pack to zero, followed by repacking. The accompanying note requires the container to be in a location whose subclass is Packing before editing its contents.

Documentary prerequisite, not a verified permission or deployed procedure. Closing a container, editing contents and repacking remain distinct actions. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p078-b002, p079-b006](reading/sdd-d50ca4a96095c930.md#p078-b002)

#### grupo-load-confirm-status-conflict

Grupo Julio page 85 says loads can be confirmed when all shipments are Ship Confirm Pending, while its status list on page 48 says Load Confirm Pending (800) means all shipments have been ship confirmed and the load is ready to confirm. Page 87 describes confirmation moving load, shipment, detail and container statuses to Closed and relieving shipping-dock inventory.

The conflicting prerequisite wording is unresolved. Do not choose one as an executable status gate or infer that an upload file has reached the host. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p048-b013, p048-b014, p048-b015, p085-b005, p087-b002](reading/sdd-d50ca4a96095c930.md#p048-b013)

#### grupo-cycle-count-triggers-and-reconciliation

The design distinguishes plan-based counts, which select items/locations and create a separate work unit per selected location, from activity-based requests after warehouse actions such as short picks or crossing a location quantity threshold. It describes reconciliation as confirming on-hand quantity, updating location inventory, recording an inventory transaction and closing the count request.

Frequency examples, threshold screenshots and the existing 9999-versus-zero tolerance conflict are not active deployment settings. No count or reconciliation was executed. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p091-b005, p092-b005, p092-b006, p096-b004](reading/sdd-d50ca4a96095c930.md#p091-b005)

#### grupo-labor-request-service-detail

The Labor Management description separates the warehouse action, a generated labor request, processing by a continuously checking Labor Management service, and the resulting detail record used by Labor Activity Insight or a report. Untracked activities may be entered through Manual Labor Entry.

Source-described execution stages, not measured service health, timing or throughput. No request table or service instance is inferred from the prose. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p098-b006, p098-b008](reading/sdd-d50ca4a96095c930.md#p098-b006)

#### grupo-labor-plan-prerequisites

Labor plans select labor groups and their processing sequence for estimated labor during wave execution. The labor-plan execution wave step must be included in the flow, and Shipment Labor Planning Criteria determine which shipments contribute for a labor group.

Estimated labor is separate from actual labor activity. The source gives no universal estimate, accurate deployment standard or complete service-to-database mapping. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p099-b004, p099-b006, p100-b002](reading/sdd-d50ca4a96095c930.md#p099-b004)

#### grupo-reporting-and-labor-evidence-limits

The labor-report illustration is explicitly a custom example rather than an existing report, with SCI dependency. The later future-functionality note says labor configuration/time values still need review and SCI reports need development. The performance-management page contains headings for reporting, event management and historical analysis without populated requirements.

An empty requirements section and a sample chart are not report acceptance, verified timing or evidence that no reporting requirement exists. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p101-b004, p102-b002, p108-b005, p108-b006](reading/sdd-d50ca4a96095c930.md#p101-b004)

#### grupo-future-vas-and-inbound-qc

VAS and base Inbound QC are listed as future test candidates, with document updates and additional scope needed if adopted. Their inclusion in future-functionality pages does not establish use in the described migration.

Prospective implementation choices only; neither test completion nor implementation acceptance is documented here. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p107-b009, p107-b010, p107-b011, p107-b012, p108-b003, p108-b004](reading/sdd-d50ca4a96095c930.md#p107-b009)

#### grupo-extension-resolved-disposition

The resolved-issues section records no initial migration for EX02, EX04 and EX06. EX04 is described as replaced by EX09. For EX08, the section says no extension documentation exists, describes multi-select Immediate Needs deletion as a base option, and recommends not porting the extension.

Historical scope evidence only. The struck-through earlier open-issue wording is not promoted over these resolved notes, and no current feature equivalence or custom-code inventory is established. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p106-b017, p107-b002, p107-b003, p107-b004, p107-b005, p107-b006, p107-b007, p107-b008](reading/sdd-d50ca4a96095c930.md#p106-b017)

#### grupo-signoff-not-acceptance

The supplied Grupo Julio final page is a Functional Flow Sign-Off form with blank operations and IT signature, printed-name/title and date lines.

The document title and unsigned form do not establish customer approval, a deployed system or present owner acceptance. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p110-b002, p110-b003, p110-b004, p110-b005, p110-b006, p110-b007, p110-b008, p110-b009, p110-b010, p110-b011, p110-b012, p110-b013, p110-b014](reading/sdd-d50ca4a96095c930.md#p110-b002)

### Additional diagram and screenshot descriptions

#### Receiving upload process-detail example

The Interface process detail window shows sequence 80 and Receiving XML Upload. The Upload tab emphasizes Upload directory with a placeholder Azure storage URL; Shipping, Receiving, Inventory transaction, Shipping delete criteria and Item balance filters are visible without selected values.

Illustrative source screenshot; the placeholder is not a verified endpoint and blank criteria do not prove deployed filtering.

[sdd-d50ca4a96095c930 p023-b002, p020-b005](reading/sdd-d50ca4a96095c930.md#p023-b002)

#### Putaway-group reopening permission example

A Security permissions search for putaway selects Putaway group insight. Its edit dialog shows Form specific permissions with Close checked and Open and Rename unchecked; User and Group fields are blank and System is selected.

The selected example scope does not prove effective employee/group rights. The Warehouse Mobile putaway-group availability issue remains separate.

[sdd-d50ca4a96095c930 p038-b002, p038-b003](reading/sdd-d50ca4a96095c930.md#p038-b002)

#### Putaway confirmation screen sequence

Five overlapping mobile screens and arrows show Work execution, the Putaway profile, entry of a user-directed work unit, Pick confirmation and Putaway confirmation. The final screen shows an entered destination location and GO action, distinguishing work selection, pick and destination confirmation.

Document illustration, not executed navigation. Item, lot and location examples do not establish use in the Grupo or assessed deployment.

[sdd-d50ca4a96095c930 p043-b002, p043-b003, p043-b004](reading/sdd-d50ca4a96095c930.md#p043-b002)

#### Locate action within putaway override

Three mobile views show an Actions menu with Locate highlighted above Override, a Locate dialog with a locating-rule choice, and a Putaway override confirmation showing a different destination. Arrows connect these screens in that order.

The diagram illustrates rule-based locating within an override workflow; it does not prove grants, valid locations or an executed movement.

[sdd-d50ca4a96095c930 p044-b002, p044-b003, p044-b004](reading/sdd-d50ca4a96095c930.md#p044-b002)

#### Outbound process and actor distinction

A left-to-right flow shows Shipment Creation, Wave Processing, Picking, Packing, Staging and Shipping. Rectangles denote processes normally done by the system; trapezoids denote those normally requiring user interaction. Labels describe reserving stock, retrieving inventory, identifying box contents, staging and confirming departure.

High-level typical flow, not an exhaustive dependency graph. It does not make every step automatic or establish this deployment.

[sdd-d50ca4a96095c930 p045-b002, p045-b003, p045-b004](reading/sdd-d50ca4a96095c930.md#p045-b002)

#### Activity-based cycle-count threshold example

The Create new Cycle count threshold window shows Location type Primary; blank Work zone and Movement class; threshold quantity 5.00000; UM Each; days between cycle counts 30; and Inactive unchecked. The threshold and day fields are outlined together.

An illustrative new-record screen is not a saved or active configuration, universal default or proof of exact threshold comparison behavior.

[sdd-d50ca4a96095c930 p093-b002, p092-b005, p092-b006](reading/sdd-d50ca4a96095c930.md#p093-b002)

#### Labor estimate and sequencing examples

The Labor Group Estimation tab shows 0.75 minutes per transaction with Quantity selected and Case checked; Each, Inner Pack and Pallet are unchecked. A separate Labor Plan example contains one detail row, sequence 10 and labor group PTS Labor, showing where group-processing order is represented.

These are different illustrative records. The 0.75 value is an estimate, not measured work duration or an adopted standard; the source later calls for labor-time configuration review.

[sdd-d50ca4a96095c930 p099-b002, p099-b004, p099-b005](reading/sdd-d50ca4a96095c930.md#p099-b002)

## Covetrus inbound and HADDAD container/QC review, 2026-09-30

This bounded batch adds 16 claims and 24 visual descriptions covering 31 previously undescribed distinct assets. Covetrus remains an implementation design with no established product build; HADDAD remains SCALE 2020. Full DOCX page fidelity and deployment acceptance remain open.

### covetrus-checkin-inventory-and-lot-selection

Covetrus separates unloading/manual quality audit from systematic check-in. Check-in creates inventory according to the receiving user's preference. Item receiving scans a receipt and product, enters quantity/UOM, and uses interfaced lot/expiration values when supplied; multiple receipt details for different lots prompt receipt-line selection.

Limit: Bounded design description. Manual quality standards and referenced Track and Trace/GS1/DSCSA extensions are not fully specified in this section; an example screen does not validate a lot or physical quantity.

[sdd-c4c7e01f8ccad48a b00618, b00623, b00628, b00643, b00644, b00645, b00646, b00648, b00650, b00678, b00680](reading/sdd-c4c7e01f8ccad48a.md#b00618)

### covetrus-mobile-exit-is-not-receipt-close

The Covetrus item-receiving design says leaving a receipt on Warehouse Mobile does not close it; the user may return to continue receiving. A separate close action changes receipt state.

Limit: No current mobile session or reopen authorization was observed. Automatic close conditions and host interface timing require their own evidence.

[sdd-c4c7e01f8ccad48a b00661, b00761, b00763](reading/sdd-c4c7e01f8ccad48a.md#b00661)

### covetrus-putaway-groups-design-release-boundary

The Covetrus design describes receiving small quantities of multiple SKUs into putaway groups organized by putaway zone, then closing a full pallet/cart group to create putaway work. Its text excludes DSCSA receiving from this group workflow. These examples coexist with the separate Grupo Julio document's open issue that Warehouse Mobile 24.1.2278 lacks Receiving with Putaway Groups.

Limit: Covetrus v1.4 is a document revision, not a proven mobile build. Its screenshots do not resolve the Grupo Julio 24.1.2278 limitation or prove availability in the assessed deployment.

[sdd-c4c7e01f8ccad48a b00688, b00690, b00699, b00701, b00703, b00711, b00705, b00708, b00713, b00716](reading/sdd-c4c7e01f8ccad48a.md#b00688); [sdd-d50ca4a96095c930 p106-b005, p106-b006](reading/sdd-d50ca4a96095c930.md#p106-b005)

### covetrus-quick-receive-fefo-boundary

Covetrus proposes user-driven quick receiving for heavy items/full single-item single-lot LPNs and some returns, placing product in primary locations. It excludes DSCSA. Because system-driven locating does not run, the design warns that downstream FEFO/FIFO may not be honored when location selection does not consider primary locations first.

Limit: The stated site rationale is not a guarantee of lot rotation. No actual allocation order, configured location selection or receiving execution was observed.

[sdd-c4c7e01f8ccad48a b00721, b00723, b00739, b00749](reading/sdd-c4c7e01f8ccad48a.md#b00721)

### covetrus-return-receiving-site-scope

The Covetrus Fort Worth return design uses downloaded RA receipts, builds multi-item or single-item pallets according to supervisor choice, and defaults return receiving to Quality Hold in a returns location. The same section notes that some other sites quick-receive into primary locations.

Limit: These are site-specific alternatives. Neither Quality Hold nor quick receiving is established as a universal return default; FEFO/FIFO concerns remain explicit.

[sdd-c4c7e01f8ccad48a b00743, b00745, b00747, b00749](reading/sdd-c4c7e01f8ccad48a.md#b00743)

### covetrus-receipt-close-and-reopen

The Covetrus design closes a fully received receipt after putaway of its final LPN. Incomplete receipts whose remaining balance is not expected require manual close. Closing blocks further receiving, while a separate reopen capability is mentioned.

Limit: The source does not define reopen permission, all status transitions, or host reconciliation after reopen; a depicted Close menu is not proof the action ran.

[sdd-c4c7e01f8ccad48a b00761, b00763, b00783](reading/sdd-c4c7e01f8ccad48a.md#b00761)

### covetrus-overage-and-missing-master-exceptions

Covetrus disallows over-receiving and directs excess quantities to a supervisor/new host PO or receipt. Product cannot be checked in without receipt information. An unknown item first requires supervisor/procurement coordination, item-master interface and a new host receipt.

Limit: This records a supplied implementation SOP, not authorization to create a PO, move inventory or change master data. Host/service behavior is not independently verified.

[sdd-c4c7e01f8ccad48a b00777, b00779, b00790, b00792, b00794, b00795, b00799](reading/sdd-c4c7e01f8ccad48a.md#b00777)

### covetrus-damage-and-host-close-boundaries

The design receives damaged product with a Damage Preference, derives a held inventory status from disposition, and locates it to a damaged area. Separately, host manual close updates the receipt header closed-date/time without changing receipt details.

Limit: A host closed timestamp is not evidence of detail-level completion. Recall processing is separately described as a development note and is not established here as delivered behavior.

[sdd-c4c7e01f8ccad48a b00803, b00805, b00807, b00814](reading/sdd-c4c7e01f8ccad48a.md#b00803)

### covetrus-workbench-caption-conflict

The Covetrus text limits Receipt Workbench to supervisor troubleshooting, such as locating failure, and excludes it as the primary receiving workflow. Its adjacent caption says Closing receipt Shortages, but the retained image is Receipt Workbench showing Receipt containers unlocated successfully and Locate Pending container rows.

Limit: The visual description follows the image rather than its inconsistent caption. This example does not prove that any current receipt was closed or unlocated.

[sdd-c4c7e01f8ccad48a b00819, b00821, b00822](reading/sdd-c4c7e01f8ccad48a.md#b00819)

### covetrus-locating-failure-recheck-guard

Covetrus directs locating exceptions to a Supervisor Location and proposes reviewing transaction/process history to understand locating-rule sequences. Its cancellation/re-check-in troubleshooting path is explicitly qualified by if not uploaded.

Limit: Do not remove the not-uploaded guard or infer that uploaded receiving can be safely cancelled/replayed. Host reconciliation, exact status gates and operator authority remain unverified.

[sdd-c4c7e01f8ccad48a b00805, b00828, b00830](reading/sdd-c4c7e01f8ccad48a.md#b00805)

### covetrus-putaway-work-status-flow

The Covetrus design uses LPN/pallet ID as the putaway work unit in a user-directed profile. After LPN scan and pick confirmation, the LPN becomes In Putaway. The user validates the destination; skipped instructions are revisited after the location sequence. Final putaway closes the LPN, updates destination on-hand quantity and makes it eligible for receipt upload.

Limit: Eligibility for upload is not successful host delivery. The image illustrates prompts, not measured timing or a verified current transaction; DSCSA custom serial updates are outside this bounded review.

[sdd-c4c7e01f8ccad48a b00881, b00888, b00890, b00892, b00894, b00896](reading/sdd-c4c7e01f8ccad48a.md#b00881)

### covetrus-location-override-pending-mobile-feasibility

The Covetrus design gives authorized users an Override path to validate a destination, update work/LPN and write transaction history; Locate can instead rerun a selected locating rule. It also retains an open item evaluating license-plate-tracked versus non-tracked mobile scenarios and possible process changes.

Limit: The stated validation checks are documentary, not exhaustive. Mobile feasibility remains open; no assumed override availability, authorization or automatic cycle-count creation follows.

[sdd-c4c7e01f8ccad48a b00903, b00905, b00906, b00908, b00910, b00912, b00915](reading/sdd-c4c7e01f8ccad48a.md#b00903)

### covetrus-item-picture-mismatch

The retained Covetrus item-information screenshot labels the item description as PANACUR SUSP 10% 40DS 1L while its bottle picture visibly says Enrofloxacin. The illustration therefore cannot validate correspondence between item metadata and product image.

Limit: This is a mismatch within a supplied screenshot, not a conclusion about current item master data or the correctness of a physical product.

[sdd-c4c7e01f8ccad48a b00684, b00685](reading/sdd-c4c7e01f8ccad48a.md#b00684)

### haddad-qc-criteria-prose-image-conflict

HADDAD QC prose says the example selects shipping containers from its single warehouse using IS NOT NULL. The cited criteria screenshot instead shows an OR condition over WORK_INSTRUCTION.INCOMING_PD_LOC and WORK_INSTRUCTION.WORK_TYPE; it does not show the described warehouse-null predicate.

Limit: Source conflict unresolved. The visible work-location/work-type filter must not be silently replaced by the prose rule or presented as a current deployment setting.

[sdd-f46806ef53e15f07 b00648, b00649, b00650](reading/sdd-f46806ef53e15f07.md#b00648)

### haddad-qc-evaluation-prose-image-conflict

HADDAD prose chooses the Manual QC evaluation method and says to check Manual on the assignment. The evaluation-method list does contain Manual, but the assignment screenshot has Manual unchecked and Start Work and Wave checked.

Limit: Method catalog existence and assignment enablement are different. The source does not establish which choice was intended or active; the conflicting examples remain explicit rather than becoming a configuration instruction.

[sdd-f46806ef53e15f07 b00652, b00653, b00657, b00658](reading/sdd-f46806ef53e15f07.md#b00652)

### haddad-qc-scope-and-configuration-chain

The HADDAD walkthrough distinguishes inbound QC routing a portion of receipt quantity to inspection from outbound QC inspecting selected shipping containers. Its example builds an assignment by linking selection criteria and evaluation methods, while its manual-QC narrative conflicts with the shown assignment selections.

Limit: This is configuration explanation, not a complete operator SOP or evidence that either QC process executed. The conflicting method selections remain unresolved.

[sdd-f46806ef53e15f07 b00643, b00644, b00648, b00652, b00657, b00658](reading/sdd-f46806ef53e15f07.md#b00643)

### Item-receiving selection and initiation

Three screenshots show Item Level Receiving highlighted in the preference list, a receipt-ID input for that preference, and a subsequent Item input while retaining the receipt context. The first receipt screen contains a Please wait overlay; it is not a completion record.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-c4c7e01f8ccad48a b00663, b00664, b00666, b00667, b00669, b00670](reading/sdd-c4c7e01f8ccad48a.md#b00663)

Assets: [f7397db0dc01dd28ad190446372c4072a57a667edb413facce9e3a2101f40cf6.png](assets/sdd-c4c7e01f8ccad48a/f7397db0dc01dd28ad190446372c4072a57a667edb413facce9e3a2101f40cf6.png); [49f6df998b79c383223abed957a563c3d46bb8b1f56b614cbdbec5048dfa3d6d.png](assets/sdd-c4c7e01f8ccad48a/49f6df998b79c383223abed957a563c3d46bb8b1f56b614cbdbec5048dfa3d6d.png); [f309420913cfe25c80e4dd15dc8ae90a470368334dd7d1317b575c595c8cf4cb.png](assets/sdd-c4c7e01f8ccad48a/f309420913cfe25c80e4dd15dc8ae90a470368334dd7d1317b575c595c8cf4cb.png)

### Item check-in quantity and UOM

The Receipt check in screen displays receipt, item, company and lot, then quantity with an EA (1.00) UOM selector and a quantity-entry field. A Please wait overlay is present. The screenshot illustrates separate item context and entered quantity, without proving acceptance of that quantity.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-c4c7e01f8ccad48a b00671, b00672](reading/sdd-c4c7e01f8ccad48a.md#b00671)

Assets: [84b6fd936c980bfc9c1be49ed2492af90d03f153fa8d3b4cbf79ad255ee2108a.png](assets/sdd-c4c7e01f8ccad48a/84b6fd936c980bfc9c1be49ed2492af90d03f153fa8d3b4cbf79ad255ee2108a.png)

### Receipt item-information panels

One Information panel repeats item, description, company, quantity and UOM over the receipt screen. A second panel includes a scrollable product picture. In the latter, the PANACUR text differs from the Enrofloxacin bottle label; the image is not catalog correctness evidence.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-c4c7e01f8ccad48a b00675, b00676, b00684, b00685](reading/sdd-c4c7e01f8ccad48a.md#b00675)

Assets: [ac5e89706e4d53984db8d62ff944a1ab66c7fa18e665f82a4a89cf4ab40723c1.png](assets/sdd-c4c7e01f8ccad48a/ac5e89706e4d53984db8d62ff944a1ab66c7fa18e665f82a4a89cf4ab40723c1.png); [55890a8609da35dd8829e0de06cbf04d09715fdc804b18007fea92a03b7624fc.png](assets/sdd-c4c7e01f8ccad48a/55890a8609da35dd8829e0de06cbf04d09715fdc804b18007fea92a03b7624fc.png)

### Lot-specific receipt-line selection

The Select a receipt line view shows position 2/2 and ERP line number, item, company, description, lot, quantity and UOM, with a GO control. The surrounding text explains selection when the same item has receipt details for different interfaced lots.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-c4c7e01f8ccad48a b00678, b00680, b00681](reading/sdd-c4c7e01f8ccad48a.md#b00678)

Assets: [f506169c386dade0425bf7cc0617359e1ca42c325b846489e930b3c1caa4cf2e.png](assets/sdd-c4c7e01f8ccad48a/f506169c386dade0425bf7cc0617359e1ca42c325b846489e930b3c1caa4cf2e.png)

### Putaway-group assignment prompts

The first Assign putaway group screen shows a putaway location group name, empty group-ID input and a receipt check-in/locate success banner. The next screen shows a populated group ID alongside license plate, quantity and UOM. Location group and entered putaway group ID are separate displayed fields.

Limit: Covetrus source illustration only; exact mobile build is not established and it does not close the separate Grupo Julio 24.1.2278 limitation.

[sdd-c4c7e01f8ccad48a b00701, b00703, b00705, b00706, b00708, b00709](reading/sdd-c4c7e01f8ccad48a.md#b00701)

Assets: [f7f898be38d87410059687aa51f5f10bcdef778bc61d8f157ac9c0383895e769.png](assets/sdd-c4c7e01f8ccad48a/f7f898be38d87410059687aa51f5f10bcdef778bc61d8f157ac9c0383895e769.png); [7a80dee77d10d2f426f06a462f859d2cca51ec43dfe487552517c7419f872bbf.png](assets/sdd-c4c7e01f8ccad48a/7a80dee77d10d2f426f06a462f859d2cca51ec43dfe487552517c7419f872bbf.png)

### Putaway-group close request and message

The first Close putaway group screen accepts a group ID. The second clears the input and displays Putaway group successfully closed. The accompanying prose associates close with putaway-task creation; the image itself does not show the generated work records.

Limit: A historical screenshot message is not present execution evidence or proof this option exists in every mobile release.

[sdd-c4c7e01f8ccad48a b00711, b00713, b00714, b00716, b00717](reading/sdd-c4c7e01f8ccad48a.md#b00711)

Assets: [7e2ec3421d14f57a995b0d0c66830d96a7d9cfb08acf109bc09075bb24af1ca9.png](assets/sdd-c4c7e01f8ccad48a/7e2ec3421d14f57a995b0d0c66830d96a7d9cfb08acf109bc09075bb24af1ca9.png); [13cc2f3e09a52514d5a688b450e8295e3ec513c274d41f06fed5842a4f15f55d.png](assets/sdd-c4c7e01f8ccad48a/13cc2f3e09a52514d5a688b450e8295e3ec513c274d41f06fed5842a4f15f55d.png)

### Quick Receipt initiation

The two initiation screenshots retain the Quick Receipt preference while moving from a receipt-ID field to an Item field. They illustrate input stages, not the later location validation or a completed receipt.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-c4c7e01f8ccad48a b00721, b00725, b00726, b00728, b00729](reading/sdd-c4c7e01f8ccad48a.md#b00721)

Assets: [193294fd5c0f27ecccad5033d36b7c5d6cdbfcf0879b61d2720b05d95221b1d5.png](assets/sdd-c4c7e01f8ccad48a/193294fd5c0f27ecccad5033d36b7c5d6cdbfcf0879b61d2720b05d95221b1d5.png); [b547620522dbf7643fd3526a12aadc973dcd7336f44f87101a598a69e6d6a2d8.png](assets/sdd-c4c7e01f8ccad48a/b547620522dbf7643fd3526a12aadc973dcd7336f44f87101a598a69e6d6a2d8.png)

### Quick Receipt quantity input

The Receipt check in image shows item context and quantity with an EA (1.00) selector, followed by an editable Quantity field and GO. No putaway location is visible at this stage.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-c4c7e01f8ccad48a b00731, b00732](reading/sdd-c4c7e01f8ccad48a.md#b00731)

Assets: [b8b4819007da6ebafbd7699191caab98d9c8dcc38b946060eec64482eddfca5a.png](assets/sdd-c4c7e01f8ccad48a/b8b4819007da6ebafbd7699191caab98d9c8dcc38b946060eec64482eddfca5a.png)

### Quick Receipt Done action

Although captioned Ready to putaway, the image shows Receipt initiation with an empty Item field and an open Actions menu containing Done. It does not show a putaway success message or final receipt closure.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-c4c7e01f8ccad48a b00734, b00735](reading/sdd-c4c7e01f8ccad48a.md#b00734)

Assets: [b2a4dd776e8402336e21415c422e6b1e7875c4e7242e102df10ab66b86f043e1.png](assets/sdd-c4c7e01f8ccad48a/b2a4dd776e8402336e21415c422e6b1e7875c4e7242e102df10ab66b86f043e1.png)

### Quick receive location entry

The Quick receive screen shows item context, quantity in CS, a license plate, expiration date and a Location input. It differs from the preceding EA entry illustration; no UOM conversion factor or completed movement is inferred from the two sample quantities.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-c4c7e01f8ccad48a b00736, b00737, b00739](reading/sdd-c4c7e01f8ccad48a.md#b00736)

Assets: [6dc7ccd3405ff245d2cef2de0492893726294eae7fcc626fdaf57f5bd0c0e8a4.png](assets/sdd-c4c7e01f8ccad48a/6dc7ccd3405ff245d2cef2de0492893726294eae7fcc626fdaf57f5bd0c0e8a4.png)

### Receipt disposition selection

The receipt check-in screen includes lot and expiration fields and an open Disposition code selector with several quality-control choices. The image demonstrates a selectable disposition input, without defining the status/location effects of each displayed code.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-c4c7e01f8ccad48a b00752, b00754, b00756, b00757](reading/sdd-c4c7e01f8ccad48a.md#b00752)

Assets: [99588e1abc62eec125770a567516fdb3c0a6694d8fde64f2058a6971158123fd.png](assets/sdd-c4c7e01f8ccad48a/99588e1abc62eec125770a567516fdb3c0a6694d8fde64f2058a6971158123fd.png)

### Receipt Insight Close action

Receipt Insight shows a selected receipt at Check In Pending and an Actions menu with Close outlined. The receipt closed-date/time cell is blank. This is an action-selection example, not a record of completed close.

Limit: The same retained asset also appears at b00785 for shortages; it is counted once. Reopen authorization and resulting host state are not shown.

[sdd-c4c7e01f8ccad48a b00761, b00763, b00765, b00766](reading/sdd-c4c7e01f8ccad48a.md#b00761)

Assets: [c3d14346c1c8d5275689e3740db85eb74d95a594fd73137be2fbb2cf2b3f02c7.png](assets/sdd-c4c7e01f8ccad48a/c3d14346c1c8d5275689e3740db85eb74d95a594fd73137be2fbb2cf2b3f02c7.png)

### Receipt Workbench unlocate result

The image is Receipt workbench with separate lines and containers grids. A banner says Receipt containers unlocated successfully; container rows show Locate Pending and the toolbar includes Locate all/Unlocate all. This differs from the adjacent Closing receipt Shortages caption.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-c4c7e01f8ccad48a b00819, b00821, b00822](reading/sdd-c4c7e01f8ccad48a.md#b00819)

Assets: [8858390ef22f2b701bf506e468e914b132278882cae67c2cf4078b7bf67593b8.png](assets/sdd-c4c7e01f8ccad48a/8858390ef22f2b701bf506e468e914b132278882cae67c2cf4078b7bf67593b8.png)

### User-directed putaway prompt sequence

An arrowed composite links Warehouse Mobile work execution to Putaway profile selection and user-directed work-unit input. Lower panels show pick confirmation at the receiving location followed by putaway confirmation prompting for destination and then item. License plate, lot, expiration, quantity and UOM provide context.

Limit: The composite is an illustrative sequence, not a complete interaction recording or proof of Closed/upload status. Source image was inspected at original resolution subject to display scaling.

[sdd-c4c7e01f8ccad48a b00888, b00890, b00892, b00894, b00896, b00897](reading/sdd-c4c7e01f8ccad48a.md#b00888)

Assets: [c911780adf91356bc8177f534355577278a65972860ddbf3676bdc1903926c03.png](assets/sdd-c4c7e01f8ccad48a/c911780adf91356bc8177f534355577278a65972860ddbf3676bdc1903926c03.png)

### Putaway actions

Putaway confirmation displays an Actions menu containing Locate, Override, Pass and Skip over work/location/item context. The screenshot does not show the override validation dialog or permission configuration.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-c4c7e01f8ccad48a b00905, b00906, b00908, b00910, b00912, b00913, b00915](reading/sdd-c4c7e01f8ccad48a.md#b00905)

Assets: [d0d29db44eb2088666196a333f3c86a6baf9d1b36c72f991c9c67e8ee59117ad.png](assets/sdd-c4c7e01f8ccad48a/d0d29db44eb2088666196a333f3c86a6baf9d1b36c72f991c9c67e8ee59117ad.png)

### Container creation strategy example

The configuration grid identifies Container Creation Strategy as key 10 with system value 20; its edit dialog displays Consolidate and Do Not Split. Value required and System created are checked. This ties the visible example code to its displayed label, not to a universal default.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-f46806ef53e15f07 b00619, b00623, b00624](reading/sdd-f46806ef53e15f07.md#b00619)

Assets: [3650f50f7f0d70b2eba39558312ac0a3997b0f85ce81ccf9249cdad000602ac7.png](assets/sdd-f46806ef53e15f07/3650f50f7f0d70b2eba39558312ac0a3997b0f85ce81ccf9249cdad000602ac7.png)

### Default container-creation filter

The criteria dialog shows record type CONT CREAT, filter *Default and table Shipment alloc request. The visible rule is LAUNCH_NUM IS NOT NULL; Inactive is unchecked and System created is checked. An Order by tab is visible but its contents are not shown.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-f46806ef53e15f07 b00626, b00627, b00628](reading/sdd-f46806ef53e15f07.md#b00626)

Assets: [5c2d19bca269f4c09a3be329023c31f77f7c35df0c4704d5bc9dfda35b7ad801.png](assets/sdd-f46806ef53e15f07/5c2d19bca269f4c09a3be329023c31f77f7c35df0c4704d5bc9dfda35b7ad801.png)

### Container class examples

The list shows CS/Carton, PAL/Palette and PCB/PCB Complet. The selected PCB dialog displays UCC code 0 and EPC filter value 0 with Inactive unchecked. These class examples do not establish dimensions or physical capacity.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-f46806ef53e15f07 b00630, b00631](reading/sdd-f46806ef53e15f07.md#b00630)

Assets: [bd8e7f91d55601162b4d73443a2c5163ac06dac9464a043f348e6c5b7205e237.png](assets/sdd-f46806ef53e15f07/bd8e7f91d55601162b4d73443a2c5163ac06dac9464a043f348e6c5b7205e237.png)

### Container type dimensions

The container-type grid lists C5, FAC, PAL and PCB with class and length/width/height in cm. The examples include C5 at 60×40×40 and PCB at 999×999×999. All four show Use as default No and Active Yes; the large PCB values are displayed data, not validated package dimensions.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-f46806ef53e15f07 b00632, b00633, b00634](reading/sdd-f46806ef53e15f07.md#b00632)

Assets: [af9e2b4b79880110270cb46f33d63167bbcc85e9b986b69e5c6baabaf91971ec.png](assets/sdd-f46806ef53e15f07/af9e2b4b79880110270cb46f33d63167bbcc85e9b986b69e5c6baabaf91971ec.png)

### Container group sequencing

The selected Emballage HADDAD group has one visible detail: sequence 10, C5, fill percent 100 and Standard shape. Other group names appear in the grid. The example illustrates ordering and type membership without proving all eligible containers.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-f46806ef53e15f07 b00636, b00637](reading/sdd-f46806ef53e15f07.md#b00636)

Assets: [4a2cce7de709588440ef72ad0904e969af0ecd8b3c8f3e5d4bc1d837035a9bdb.png](assets/sdd-f46806ef53e15f07/4a2cce7de709588440ef72ad0904e969af0ecd8b3c8f3e5d4bc1d837035a9bdb.png)

### Packing-class relationship fields

The selected CUSTOM / Custom Mono Kit packing class has General-tab fields for container group and packing criteria. Both selected values are clipped in their controls; their full text is not inferred. Other rows distinguish style/color/size combinations.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-f46806ef53e15f07 b00639, b00640](reading/sdd-f46806ef53e15f07.md#b00639)

Assets: [2938602a08a6820fd4d1ce2f2a9e854f9114a47f5a329bc7ad7d4e55b0e895a0.png](assets/sdd-f46806ef53e15f07/2938602a08a6820fd4d1ce2f2a9e854f9114a47f5a329bc7ad7d4e55b0e895a0.png)

### QC criteria image conflicting with prose

The QC assignment criteria dialog labels its source Shipping container, while its visible rule uses an OR over WORK_INSTRUCTION.INCOMING_PD_LOC and WORK_INSTRUCTION.WORK_TYPE. No warehouse IS NOT NULL expression is visible, contrary to the next paragraph. Inactive and System created are unchecked.

Limit: Source disagreement is retained. SQL joins, full runtime eligibility and the intended deployment predicate are unestablished; this is not an executable recipe.

[sdd-f46806ef53e15f07 b00648, b00649, b00650](reading/sdd-f46806ef53e15f07.md#b00648)

Assets: [aabd1b8039cf7626aa02412652ecd5ccad42e71eabcbdaac6ad61a668631755b.png](assets/sdd-f46806ef53e15f07/aabd1b8039cf7626aa02412652ecd5ccad42e71eabcbdaac6ad61a668631755b.png)

### QC evaluation-method catalog

The list shows system-created active methods Manual (30), Start Work (20) and Wave (10). The Manual edit dialog repeats identifier 30 and record type QCEVALMETHOD. Catalog presence does not establish which methods an assignment enables.

Limit: Static source example only; does not establish current configuration, successful execution, user authorization or deployed navigation.

[sdd-f46806ef53e15f07 b00652, b00653](reading/sdd-f46806ef53e15f07.md#b00652)

Assets: [74799190661e364a2cd348595d836e67910e0a82c605efe9d77718dc53908aaf.png](assets/sdd-f46806ef53e15f07/74799190661e364a2cd348595d836e67910e0a82c605efe9d77718dc53908aaf.png)

### QC assignment General and method tabs

Two images show the same Quality control Zone assignment. General has priority 2, criteria Quality control and Apply to 1 of 1.00 Containers. The methods tab leaves Manual unchecked and checks Start Work and Wave, contradicting the prose instruction to select Manual.

Limit: The displayed current-container counter is sample state. Method selections conflict with the narrative; priority direction, counter resets, actual sampling and effective deployment are not validated.

[sdd-f46806ef53e15f07 b00657, b00658](reading/sdd-f46806ef53e15f07.md#b00657)

Assets: [18595db9c33b40dc302bda1b4e4d7bb94a1224072da27ed78447a5c2a742e8d6.png](assets/sdd-f46806ef53e15f07/18595db9c33b40dc302bda1b4e4d7bb94a1224072da27ed78447a5c2a742e8d6.png); [b2b780989cf4e6960e92f095ca41db8b7db9444b6466931449e6f48b849b4c8a.png](assets/sdd-f46806ef53e15f07/b2b780989cf4e6960e92f095ca41db8b7db9444b6466931449e6f48b849b4c8a.png)

## Work and picking continuation 2026-09-30

This batch adds 24 source-bound claims, 18 configuration contracts and four asset descriptions. Three newly described assets are status icons; one is blank/decorative. No PDF-page, slide or full DOCX-layout credit is added. The existing partial-close setting is narrowed to the RF execution scope in the source.

### work-picking-creation-request-reservation

Work creation first selects masters for the requesting process and orders them by ascending priority number. It compares each request against the selected master criteria; a matching request is reserved for that master and is not reviewed by a later master. Declined requests are tried against the next master.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. Tie handling and behavior after all masters decline a request are not supplied. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00704, b00706, b00707, b00709, b00711, b00713, b00714, b00716, b00718, b00720](reading/sdd-61bfda888fe30365.md#b00704)

### work-picking-creation-order-and-estimate

After selecting requests, work creation applies the criteria Order By attributes in sequence, assigns an internal instruction number to each detail and uses an applicable estimated work-rate record to estimate instruction time. Work-unit breaks group instructions into units; example order-level or location-level grouping is illustrative.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. Estimated work time is not measured elapsed time. This does not identify which rate or grouping is active. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00722, b00723, b00724, b00726, b00733, b00734, b00736, b00738, b00740, b00742, b00746](reading/sdd-61bfda888fe30365.md#b00722)

### work-picking-wave-replenishment-work-type

When replenishment work is created out of the wave process and Wave Replen Work Type is activated in Work System Values, the source says that special replenishment work type replaces the work type on the creation master.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00741](reading/sdd-61bfda888fe30365.md#b00741)

### work-picking-special-handling-scope

Work special handling supplies verification and processing restrictions in Warehouse Mobile or RF, and the source explicitly excludes Work Insight. The flow also describes constraints selected by item/company, account/company or user profile/work zone/work type, but gives no conflict-resolution order between these scopes.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00080, b00082, b00090, b00091, b00094, b00097, b00100, b00840, b00841, b00842, b00843, b00844](reading/sdd-61bfda888fe30365.md#b00080)

### work-picking-cycle-count-exceptions

Counting license plates can fall back to counting their actual contents when the plate count differs; multi-item locations require individual quantities. Group Count By Item/Company combines quantity across lot, inventory attribute and plate, but a mismatch, added item or enabled lot/plate verification ungroups work. Multiple-item and empty-location counts require individual confirmations.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. The source supplies no tolerance values or observed count outcomes. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00143, b00144, b00145, b00146, b00147, b00148, b00149, b00150](reading/sdd-61bfda888fe30365.md#b00143)

### work-picking-work-type-and-group

A Work Group organizes related activities and can contain multiple Work Types. Work Types identify processing categories; predefined and custom types can be associated with profile processing rules. The work-type description also serves as a numeric voice identifier for Vocollect in this source.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. Example type names are not evidence that those types exist in the assessed deployment. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00171, b00172, b00173, b00176, b00177, b00178, b00180, b00181, b00182, b00183, b00188](reading/sdd-61bfda888fe30365.md#b00171)

### work-picking-cart-container-method-conflict

The cart section describes assigning totes and work units before picking and later says grouping is supported for pick-to-tote carts. A nearby note says only Pick into shipping container is currently supported. These statements conflict within this undated compilation; tote-cart availability is unresolved by this source alone.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. Do not select either account as the installed behavior or infer a release chronology. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00282, b00283, b00285, b00286, b00287, b00288, b00289, b00290, b00291, b00331, b00332, b00336, b00337](reading/sdd-61bfda888fe30365.md#b00282)

### work-picking-cart-actions

Cart picking distinguishes Partial Pick, which asks for confirmation, from Short Pick, which asks for a reason; Skip moves to the next instruction without completing the current quantity. Pass stops the current execution instance and its warning depends on Work System Value 50. Partial or short picking ungroups batched instructions.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. The source does not establish inventory effects for every cart action or every configured value of Work System Value 50. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00304, b00305, b00307, b00309, b00310, b00312, b00314, b00338](reading/sdd-61bfda888fe30365.md#b00304)

### work-picking-cart-start-and-putaway

The cart procedure assigns containers to user-chosen or system-assigned spots, starts picking after assignment and applies configured verifications at confirmation. With put-to-store work and putaway into a container, it requests a container ID and requests a type only for a new container. New Cart allows assignment of another cart before picking the first.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. This is a documentary sequence; it is not verified navigation in the owner environment. The tote-cart conflict is retained separately. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00268, b00269, b00270, b00271, b00275, b00276, b00277, b00278, b00279, b00280, b00281, b00292, b00293, b00294, b00295, b00296, b00297, b00300, b00301, b00302, b00303](reading/sdd-61bfda888fe30365.md#b00268)

### work-picking-system-cart-empty-and-back

System-built carts assign eligible shipping containers to spots at work initiation and show spot, container type and the last four container-ID digits for physical cart building. With no eligible work, Build Cart has no assigned spots. Back returns to profile selection while leaving the newly built cart built.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. Walking-path efficiency is an intended benefit, not a measured timing result. Do not treat the displayed suffix as a unique identifier outside the source UI. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00341, b00360, b00361, b00362, b00363, b00364, b00365, b00366, b00367, b00369, b00370](reading/sdd-61bfda888fe30365.md#b00341)

### work-picking-picking-management-zone-readiness

Picking Management splits work by zone so multiple users can execute portions of a work unit. The selected-zone list includes open, held and assigned units and orders them by Zones Away; the procedure chooses a unit with Zones Away equal to zero as ready for that zone. A user may be assigned multiple work units.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. Displayed availability is not proof that a held unit is executable; the hold rule is separately documented. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00389, b00499, b00501, b00505, b00515, b00652](reading/sdd-61bfda888fe30365.md#b00389)

### work-picking-picking-management-assignment

The documented Picking Management sequence assigns a user and work unit before starting. Details can be reviewed and a pick list can be printed; starting confirms the assignment, and entering an already assigned unit opens completion. Unassign removes the associated user from an open unit, while a unit on hold cannot be unassigned.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. This explains the source sequence without asserting current permissions or registered SOP navigation. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00511, b00513, b00517, b00519, b00521, b00523, b00527, b00528, b00530, b00532, b00534, b00536, b00540, b00545, b00546, b00547, b00549](reading/sdd-61bfda888fe30365.md#b00511)

### work-picking-picking-management-hold-short

In the Complete Picking procedure, normal confirmation performs the pick and closes the work unit. Hold requires a business hold code, leaves the current instructions unconfirmed and blocks actions until release; the source names Work Insight as the release screen. Short Pick requests item and quantity, lot when controlled, then a quality-measures reason before processing the short pick.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. The source paragraph uses both instruction and work-unit terminology. No database status values, current role permissions or live release action are established. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00539, b00540, b00541, b00542](reading/sdd-61bfda888fe30365.md#b00539)

### work-picking-wave-group-capacity

Wave picking groups represent physical picking aids and constrain full and loose container counts and eligible allocation locations/work zones. During the wave, the group step assigns containers created earlier. Group-detail sequences must be unique and process lower numbers first.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. The medium-container sizing hint is source guidance, not a safe capacity calculation for a particular cart. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00554, b00555, b00587, b00589, b00591, b00593, b00598, b00600, b00602, b00604](reading/sdd-61bfda888fe30365.md#b00554)

### work-picking-paper-versus-rf-group

Paper-based group picking consolidates containers into a capacity- and location-defined group during the wave and uses the Group Picking Pick List; the source places it outside work execution. RF group picking operates through work, supports shipping containers or totes, and can introduce a transport container during picking. The two documented methods must not be treated as the same confirmation path.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. No live group creation, printing or warehouse movement was performed. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00622, b00642, b00647](reading/sdd-61bfda888fe30365.md#b00622)

### work-picking-direct-container-packing

When RF picking directly into a shipping container, the source says picking also performs packing: the picked item and quantity are assigned to that container, and more items from the same shipment may be added until it is closed. Picking into a tote groups products for the shipment instead.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. This does not waive container close validations or establish shipping confirmation. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00657](reading/sdd-61bfda888fe30365.md#b00657)

### work-picking-vocollect-boundary

The source describes Vocollect voice picking as a request/response integration: individual TalkMan devices initiate requests and SCALE issues responses. It requires configuration on both sides and Vocollect software on an application or separate server. Its listed capabilities include outbound, user/system-directed picking, final-container or tote picking, equipment types, lot tracking, verification, short picks and spoken comments/text.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. This undated capability list does not establish installed voice equipment, service topology, present product support or execution. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00662, b00664, b00665, b00666, b00667, b00668, b00669, b00670, b00671, b00672, b00673, b00674, b00675, b00676, b00677, b00678, b00679, b00680](reading/sdd-61bfda888fe30365.md#b00662)

### work-picking-nonrf-confirmation-evidence

The non-RF flow generates a work-unit pick list, distributes it to workers and has an administrator record the performed activity in Work Insight. The source requires user/warehouse access to a profile supporting the instruction work type and zones; confirmation includes worker, quantity, check digits, optional recorded times and exception reasons. Its described outbound transition is Ready for Packing or an intervening configured status.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. This outbound example is not a universal status transition for all work types. Recorded operator timestamps do not by themselves establish end-to-end measured runtime. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00757, b00760, b00761, b00763, b00765, b00767, b00769, b00771, b00773, b00775, b00777, b00779, b00781, b00783, b00785, b00786, b00788, b00789, b00791, b00793, b00795, b00797, b00799, b00801, b00803, b00805, b00807](reading/sdd-61bfda888fe30365.md#b00757)

### work-picking-rf-profile-selection

The RF flow first uses the default work profile on the employee user profile. If none is associated, it prompts with user- and warehouse-authorized profiles. Eligible instructions must match profile work type and a work zone accepting the detail equipment type; if no detail matches, the source directs the employee to obtain work from a supervisor.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. The source does not establish full permission precedence or this user current authorization. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00821, b00822, b00823, b00824, b00826, b00827, b00828](reading/sdd-61bfda888fe30365.md#b00821)

### work-picking-rf-initiation-and-prelocate

RF system-directed initiation starts from a nearest-location scan; a location eligible for system-directed work-unit selection can expose a choice subject to the same unit validations as user-directed initiation, including not closed or active. User-directed initiation scans a chosen unit. Starting receipt putaway when the To location is the receiving pre-locate location relocates the receipt container in this documented flow.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. Location ordering details remain constrained by the From Assignment source; physical-distance optimization is not established. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00831, b00832, b00833, b00834](reading/sdd-61bfda888fe30365.md#b00831)

### work-picking-rf-partial-close-scope

The RF flow limits partial-pick-and-close to replenishment and work-order picks when the special-handling option enables it. It removes the remainder from the instruction and closes it; without that behavior the remainder stays available to pick. Partial picking into a tote or shipping container returns to the remaining quantity until all quantity is picked.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. Removing remaining work quantity is not a claim that physical inventory is deleted. The general setting paragraph must be read with this narrower execution scope. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00125, b00851](reading/sdd-61bfda888fe30365.md#b00125)

### work-picking-rf-short-over-pick

The RF flow says a short pick rejects the short quantity and reduces On Hand quantity at the source location. Over-picking increases transaction quantity and processes the pick as complete, but is limited to configured RF replenishment/work-order picks within available location quantity.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. These are documentary effects; no current inventory quantity, full ledger transaction, reason-code policy or observed execution is established. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00123, b00849, b00850, b00852](reading/sdd-61bfda888fe30365.md#b00123)

### work-picking-automatic-putaway-wording-conflict

The settings section calls the option Automatic Putaway, excludes dock-management work and disables Consolidation After Putaway when it is selected. The later RF flow instead names Select After Putaway and says any work scenario. The name and scope differ; the broader flow wording cannot establish equivalence or remove the explicit dock-management exclusion.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. No alias, newer version or live field identity was inferred. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00235, b00236, b00853, b00854, b00855](reading/sdd-61bfda888fe30365.md#b00235)

### work-picking-rf-putaway-followthrough

The RF putaway flow requests a shipping-container ID when putting to a put-to-store location or shipping dock and a type for a new container. It then puts quantity in the specified location, offers nesting when the profile requests it and continues remaining putaway instructions before checking for more profile-detail work.

Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. Nesting remains subject to the separately documented single-shipment and Putaway Into Shipping Container restrictions; the broad flow does not override them. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00234, b00237, b00858, b00859](reading/sdd-61bfda888fe30365.md#b00234)

### Retained asset descriptions

#### Blank field-description source asset

The retained 16 by 16 GIF appears blank at original resolution and when composited on white. It occurs beside Field Descriptions headings in the Picking Management and Wave Picking Group portions; it carries no readable label or process information.

Limit: Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. This is an inspected blank/decorative asset, not a process diagram or evidence of missing hidden text.

[sdd-61bfda888fe30365 b00404, b00563](reading/sdd-61bfda888fe30365.md#b00404)

Assets: [1d600a0343eef0b105f4dd86d1b7572306777214a30e5b8d49e91c153d7bca31.gif](assets/sdd-61bfda888fe30365/1d600a0343eef0b105f4dd86d1b7572306777214a30e5b8d49e91c153d7bca31.gif)

#### Open work-unit status icon

A small outlined document with horizontal blue lines marks an open work unit in the source legend. The first row of table b00510 binds this icon to the explicit text Open work unit.

Limit: Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. The original DOCX relationship in row 1 identifies image5.gif; extracted asset-list order alone cannot establish this mapping.

[sdd-61bfda888fe30365 b00505, b00507, b00508, b00510](reading/sdd-61bfda888fe30365.md#b00505)

Assets: [80b40168ae9cd32aef1337311cddd2fca8c550807d47129a17d605811c40cc89.gif](assets/sdd-61bfda888fe30365/80b40168ae9cd32aef1337311cddd2fca8c550807d47129a17d605811c40cc89.gif)

#### Assigned work-unit status icon

A small person silhouette beside a document marks a work unit with a user assigned in the source legend. The second row of table b00510 supplies the meaning, so the explanation does not require recognizing the icon.

Limit: Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. The original DOCX relationship in row 2 identifies image6.gif. This is a legend meaning, not evidence that an actual unit has been assigned.

[sdd-61bfda888fe30365 b00507, b00508, b00510](reading/sdd-61bfda888fe30365.md#b00507)

Assets: [d436bfc07ebcdf2fee155e49df221e5c8806ecc079486b988953bcbb4c084eaf.gif](assets/sdd-61bfda888fe30365/d436bfc07ebcdf2fee155e49df221e5c8806ecc079486b988953bcbb4c084eaf.gif)

#### Held work-unit status icon

An outlined document overlaid by a red circular stop-like badge with a white cross marks a held work unit in the source legend. The third row of table b00510 explicitly states the hold status; color and shape are supplementary.

Limit: Supplied SCALE Work/Picking compilation; release unspecified. Documented behavior, not observed configuration, a verified Insight SOP, runtime acceptance or a measured efficiency result. The original DOCX relationship in row 3 identifies image7.gif. Held work cannot be processed or unassigned under the cited source rules until released.

[sdd-61bfda888fe30365 b00507, b00508, b00510, b00542, b00546](reading/sdd-61bfda888fe30365.md#b00507)

Assets: [7732b668cccd5cadf15cbd50fa9e81e0f1c9b2d77424b4a712dd3da96420fb48.gif](assets/sdd-61bfda888fe30365/7732b668cccd5cadf15cbd50fa9e81e0f1c9b2d77424b4a712dd3da96420fb48.gif)

### Remaining source conflicts

The compilation describes tote cart picking but also contains a shipping-container-only note. Its automatic-putaway flow uses a different setting name and broader scope than the settings section. Both conflicts remain explicit. Current configuration, full DOCX layout and operational navigation remain unverified.

## Continuation 4 source review

This batch adds 57 claims, 44 setting contracts and 47 visual descriptions covering 57 additional retained assets. The statements preserve source and deployment distinctions. No original source or previous authored record was changed.

### work-picking-override-pick-applicability-boundary

The work special-handling section identifies Override Pick as available for outbound allocation and shipping-container work, replenishment and inventory transfer work. It directs the reader to a separate Override Pick topic for the options.

Supplied SCALE Work/Picking compilation; release unspecified. This is retained documentary evidence, not an observed setting, current screen contract, verified Insight SOP or runtime result. This paragraph supplies applicability only. It does not define replacement-identifier validation or establish a Packing-screen replacement-LPN action. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00133, b00134, b00135](reading/sdd-61bfda888fe30365.md#b00133)

### work-picking-wave-created-receipt-plate-grouping

The grouping example includes receipt containers or license plates created during a wave: three full-case plates allocated from the same location can be verified and confirmed together once during Warehouse Mobile work.

Supplied SCALE Work/Picking compilation; release unspecified. This is retained documentary evidence, not an observed setting, current screen contract, verified Insight SOP or runtime result. The three-case example is illustrative. It does not remove the separately documented serial/catch-weight exceptions, prove cross-item grouping or establish current configuration. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00229, b00230, b00239](reading/sdd-61bfda888fe30365.md#b00229)

### work-picking-cart-removal-selection

The cart-removal procedure distinguishes removing the scanned container from removing all containers on its cart. The all-container path starts from one container on the cart and requires a Yes/No confirmation. Removal clears the shipping container group and spot values; the documented prerequisites are open work, an assigned group and no assigned user.

Supplied SCALE Work/Picking compilation; release unspecified. This is retained documentary evidence, not an observed setting, current screen contract, verified Insight SOP or runtime result. Removal from a cart is not deletion of the shipping-container record. Current permissions and user-visible navigation have not been verified. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00317, b00318, b00320, b00323, b00324, b00327, b00328, b00329](reading/sdd-61bfda888fe30365.md#b00317)

### work-picking-cart-scan-initiation

An already assigned container can be scanned to begin cart picking; the source then asks the user to confirm Begin Picks before moving to pick confirmation.

Supplied SCALE Work/Picking compilation; release unspecified. This is retained documentary evidence, not an observed setting, current screen contract, verified Insight SOP or runtime result. This shortcut does not establish an unassigned-container path. The nearby shipping-container-only versus tote-cart support conflict remains unresolved. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00331, b00332, b00335](reading/sdd-61bfda888fe30365.md#b00331)

### work-picking-picking-field-lists-not-contracts

The Picking Management field lists identify such labels as Zones Away, Hold Code, License Plate and Parent License Plate, and identify a Zone Summary for a multiple-zone selection. Those lists do not themselves specify calculations, validation rules or database mappings.

Supplied SCALE Work/Picking compilation; release unspecified. This is retained documentary evidence, not an observed setting, current screen contract, verified Insight SOP or runtime result. Use the separately reviewed process paragraphs for supported behavior. A field name alone is not evidence of its complete semantic contract. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00404, b00409, b00424, b00440, b00441, b00442, b00443, b00444, b00445, b00469, b00470, b00472, b00476, b00478](reading/sdd-61bfda888fe30365.md#b00404)

### work-picking-picking-group-field-lists

The wave picking-group reference separates header capacity fields from detail records that associate a pick-location group and sequence. Its procedure applies the header before creating detail records.

Supplied SCALE Work/Picking compilation; release unspecified. This is retained documentary evidence, not an observed setting, current screen contract, verified Insight SOP or runtime result. The field list does not add an undocumented capacity default or enforcement rule; use the reviewed capacity and sequence contracts for their stated limits. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00565, b00567, b00568, b00569, b00571, b00572, b00573, b00575, b00576, b00577, b00579, b00580, b00595](reading/sdd-61bfda888fe30365.md#b00565)

### work-picking-work-summary-assignment-terminology

The RF execution flow first says that instructions within a work unit follow the From Assign Method, then explicitly says the system assigns work summaries rather than individual work instructions to the user.

Supplied SCALE Work/Picking compilation; release unspecified. This is retained documentary evidence, not an observed setting, current screen contract, verified Insight SOP or runtime result. Retain both source terms. The cited paragraphs do not define the work-summary data structure or prove a one-to-one relationship between summaries and instructions. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00836, b00837, b00838](reading/sdd-61bfda888fe30365.md#b00836)

### work-picking-creation-print-scope

The creation flow describes immediate pick-list printing for an outbound work unit when Auto Print is enabled. The configuration section warns that also placing the pick-list document type on a document master can print a second set later during paperwork in the same wave.

Supplied SCALE Work/Picking compilation; release unspecified. This is retained documentary evidence, not an observed setting, current screen contract, verified Insight SOP or runtime result. The outbound flow qualification is preserved. No printer, installed document master or actual duplicate print has been observed. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00016, b00744](reading/sdd-61bfda888fe30365.md#b00016)

### label-vendor-compliance-purpose

The deck describes a vendor-compliant label as container identification formatted to the ship-to requirements. Its vendor-label slide says the printer must be accessible through a network share and points to separate printer configuration guidance.

Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established. This is a requirement in the supplied training source, not proof of a current cloud printing topology or a reason to alter network shares. Classification: `vendor_behavior`.

[sdd-56008a31665dcc23 s009-sh003, s009-sh005](reading/sdd-56008a31665dcc23.md#s009-sh003)

### label-shipping-label-identity

A shipping label identifies a shipping container for the carrier and includes ship-from and ship-to information. The deck describes automatic generation during container packing and manifesting; when a company is associated with the container, its name and address supply the ship-from values.

Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established. The source does not establish that every carrier/configuration prints twice, or that generation equals successful physical printing. Classification: `vendor_behavior`.

[sdd-56008a31665dcc23 s010-sh003, s010-sh005](reading/sdd-56008a31665dcc23.md#s010-sh003)

### label-receipt-label-timing-scope

The deck describes receipt-container labels as the inbound counterpart of vendor labels. A brief speaker note says they print during locating, while the later customer-return example asks for a smaller receipt-container label during check-in.

Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established. Keep these different contexts. The note and implementation example do not establish one universal inbound print trigger. Classification: `vendor_behavior`.

[sdd-56008a31665dcc23 s013-sh003, s013-sh005, s013-notes, s042-sh004](reading/sdd-56008a31665dcc23.md#s013-sh003)

### label-combined-wave-label-reference

The vendor-label slide points to a separate Container Contents and Vendor Labels topic when both label types are wanted from a wave. The prerequisite slide separately names a Documents - Labels wave step when wave printing is used.

Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established. The referenced combined-label setup is not reproduced in these slides; the reference alone supplies no complete configuration sequence. Classification: `vendor_behavior`.

[sdd-56008a31665dcc23 s009-sh005, s007-sh004](reading/sdd-56008a31665dcc23.md#s009-sh005)

### label-cart-label-grouping-example

A customer example orders parcel labels by container type, prints a break label carrying the type and count, and adds a container-ID barcode to the contents label so staff can assemble the required cart containers.

Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established. This is a documented design example, not an observed print order, current default or measured cart-building improvement. Classification: `implementation_specific_choice`.

[sdd-56008a31665dcc23 s033-sh004, s034-sh004, s037-sh004, s039-sh004](reading/sdd-56008a31665dcc23.md#s033-sh004)

### label-vendor-template-example

A customer-specific vendor-label example starts from a generic vendor template and changes its layout to the retailer requirements. The displayed example separates ship-from, ship-to, merchandise and carton-identification areas.

Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established. The slide does not prove current retailer compliance or authorize replacement of an installed label file. Classification: `implementation_specific_choice`.

[sdd-56008a31665dcc23 s040-sh004, s041-sh004, s041-sh005](reading/sdd-56008a31665dcc23.md#s040-sh004)

### label-return-label-example

The customer-return example requests a 2 by 3 label for small returned items at check-in and a horizontal layout. Its template and photograph show receipt/return identification, a license plate, item and destination fields.

Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established. The photographed example does not establish its physical dimensions, barcode readability or successful output from the assessed installation. Classification: `implementation_specific_choice`.

[sdd-56008a31665dcc23 s042-sh004, s043-sh004, s043-sh005](reading/sdd-56008a31665dcc23.md#s042-sh004)

### label-wave-print-diagnostic-artifacts

The resource slide describes a WLI wave-label file as containing document type, printer, copy count and errors, and a WLD file as containing ZPL output. It lists both ILS 2016 and ILS 2021 installation paths.

Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established. Treat these as mixed-version training references. File existence, active paths, job state and printer receipt were not inspected; no spool or label file was opened or executed. Classification: `vendor_behavior`.

[sdd-56008a31665dcc23 s044-sh004](reading/sdd-56008a31665dcc23.md#s044-sh004)

### label-speaker-note-context-limit

The notes on the prerequisites, label-types and ZPL-introduction slides repeat an interface-error or shipment-deletion remark that does not match those slides' subjects.

Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established. This is a source-context observation. Do not turn the repeated note into a label workflow, deletion action or interface contract. Classification: `analyst_inference`.

[sdd-56008a31665dcc23 s007-notes, s008-notes, s021-notes](reading/sdd-56008a31665dcc23.md#s007-notes)

### covetrus-adjustment-located-inventory-boundary

The design distinguishes quantity adjustments from physical transfers: adjustments change on-hand inventory and create a transaction history record, while the receiving dock is excluded because Inventory Management adjustments require located inventory. Track-and-trace adjustments have a named EX06 restriction.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The source does not provide the detailed EX06 validation algorithm. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00922, b00924, b00932, b00954, b02210](reading/sdd-c4c7e01f8ccad48a.md#b00922)

### covetrus-manual-adjustment-tool-caution

The Covetrus notes describe supervisor use of a Manual Inventory Adjustment tool and recommend investigating discrepancy causes because manually changing inventory buckets may have cascading effects. Virtual multi-item locations in a Morgue area are used for dummy systemic inventory such as shortages.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. This is historical design context, not authorization to reconcile real inventory or evidence that a current discrepancy has that cause. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00956, b00958](reading/sdd-c4c7e01f8ccad48a.md#b00956)

### covetrus-inventory-transfer-work-boundary

In the design, Inventory Management transfers move stock between warehouse locations. Transfer work is created from the Insight screen so a supervisor can choose the movement and an RF user can execute it; starting from selected inventory defaults the source location and item, while blind initiation requires them.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The image caption says transfer with work, but its Create work action is gray; the screenshot alone does not demonstrate successful work creation. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00965, b00967, b00969](reading/sdd-c4c7e01f8ccad48a.md#b00965)

### covetrus-inventory-status-location-granularity

The Covetrus design receives normal inventory as Available and inbound-QC items as HQ, permits secured status-change types, and records status changes in transaction history. It says a location without license-plate tracking cannot hold the same item partly Available and partly Damaged, and Covetrus does not start one status change by selecting multiple lots.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. These constraints are documented in this implementation example; no deployed inventory or status configuration was read. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00981, b00983, b00985, b00987](reading/sdd-c4c7e01f8ccad48a.md#b00981)

### covetrus-combined-transfer-status-planned

The SDD says Covetrus does not currently use a combined transfer-and-status-change adjustment type but is considering it; adoption would require interface enhancement.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Planned functionality must not be described as enabled. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00989, b00991](reading/sdd-c4c7e01f8ccad48a.md#b00989)

### covetrus-cycle-count-generation-and-verification

Cycle-count plans generate one work unit per selected location. The design also creates activity-based counts after short picks, but a direct screen reroute into counting remains an open item. With Verify Bad Count, an initial discrepancy prompts verification and requires two consecutive equal counts to complete that verification.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Existing zero-tolerance versus positive-tolerance review notes remain unresolved; completing count entry is not proof that a discrepant request is closed. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01012, b01027, b01029, b01031, b01033, b01039, b01041, b01047, b01050, b01052](reading/sdd-c4c7e01f8ccad48a.md#b01012)

### covetrus-cycle-reconciliation-and-extension-status

The described reconciliation flow lets a supervisor enter the correct on-hand quantity for a Pending Review count, then updates inventory, records a transaction and closes the request. The EX25 extension is separately described as preventing a cycle-count plan from closing while a request is pending review, while the body says the recent action remains outside original scope and subject to change control.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Request closure and plan closure are different scopes. The source does not establish deployment of EX25. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01062, b01064, b01066, b01073, b01075, b01084, b02210](reading/sdd-c4c7e01f8ccad48a.md#b01062)

### covetrus-capacity-replenishment-prerequisites

Covetrus describes daily manual capacity replenishment for primary bins in each-unit increments, evaluating permanent active locations below their configured minimum percentage. Item-location assignment and capacity records are required. Threshold-based real-time replenishment is explicitly excluded from go-live even though a later paragraph describes possible scheduled use for fast movers.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The later conditional description does not establish that real-time replenishment was enabled. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01114, b01123, b01125, b01131, b01133, b01139](reading/sdd-c4c7e01f8ccad48a.md#b01114)

### covetrus-outbound-status-meaning

The SDD distinguishes physical shipping stages from shipment status summaries: trailing status is the least advanced container status and leading status the most advanced. In Pool Pending shipments cannot enter a wave; In Pool shipments have no work available; Closed follows shipping-load confirmation.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The status list is documentary. No live counts, transitions or shipment state were observed. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01194, b01199, b01200, b01202, b01203, b01205, b01206, b01208, b01209, b01211, b01212, b01214, b01215, b01219, b01221, b01223, b01224, b01228, b01229, b01240](reading/sdd-c4c7e01f8ccad48a.md#b01194)

### covetrus-shipment-import-and-wave-selection

The Covetrus design imports host shipments on a schedule; validation failures require correction before reprocessing. Its priority or cutoff-time waving can produce multiple loads from one wave. A planned-shipment filter that matches a shipment line includes the entire shipment, and a wave master selects the ordered flow, eligible replenishment masters and paperwork master.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The text describes existing criteria and possible additions; it does not identify the assessed deployment filter records. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01248, b01250, b01263, b01265, b01267, b01269, b01271, b01276, b01318](reading/sdd-c4c7e01f8ccad48a.md#b01248)

### covetrus-wave-overrides-remain-under-review

Covetrus intends to reuse wave flows, masters and override-data steps, while explicitly reviewing whether custom overrides remain necessary with base functionality. The Check for No Work override marks a wave failed when shipment work was not created; other override placeholders are not a complete enumerated implementation contract.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. No override was executed or verified against a deployed customization. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01278, b01280, b01282, b01561, b01566, b01572, b02335](reading/sdd-c4c7e01f8ccad48a.md#b01278)

### covetrus-allocation-rules-and-fallback

The SDD describes allocation-rule sequences attempting remaining demand in order. A shipment detail can receive its rule from the item, interface or wave assignment, and the *Default rule applies when no rule is set. Covetrus favors assignment during the wave while retaining manual or interface choices.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Always Override controls reassignment within the described assignment process; the text does not establish an unconditional precedence among every source of a rule. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01368, b01370, b01371, b01372, b01374, b01381, b01383, b01384, b01385, b01386, b01388, b01390, b01392, b01394](reading/sdd-c4c7e01f8ccad48a.md#b01368)

### covetrus-allocate-complete-host-override

For selected Covetrus order profiles, Allocate Complete requires the whole shipment to be allocatable. The host sends the flag as N, so a wave override must set it for the relevant profiles; direct transfers are explicitly included. Otherwise, the design sends an unallocated portion back to the pool on a backorder with In Pool as rejection status.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Do not generalize the selected profiles or flag value to the assessed deployment. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01399, b01401, b01405, b01407](reading/sdd-c4c7e01f8ccad48a.md#b01399)

### covetrus-container-creation-dimension-boundary

Container creation first separates shippable units, then groups loose items by packing class and associated container group. It uses weight, volume and critical dimensions while trying successive container sizes; an item lacking a unit-of-measure record is treated as zero-dimensional and zero-weight in this description, so Covetrus relies on reports and procedures to identify missing dimensions.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The separately named EX26 3D-cubing extension uses custom stabilizing codes and is listed as new scope and under development, rather than established base deployment. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01412, b01414, b01416, b01418, b01420, b01425, b02246](reading/sdd-c4c7e01f8ccad48a.md#b01412)

### covetrus-three-dimensional-cubing-not-accepted

The Covetrus design names EX26 3D cubing with custom stabilizing codes, marks it outside the approved statement of work and later lists it as an open development issue.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. This is an extension requirement, not a delivered or validated capability. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01425, b02210, b02246](reading/sdd-c4c7e01f8ccad48a.md#b01425)

### covetrus-pallet-strategy-source-qualification

The design uses wave pallet building for TL/LTL, with requirements, a container type and strategy controlling selection, grouping and dimensions. It mentions possible Maximum Height and Weight usage, then names Build Pallets using Height-Weight No Split Item as Covetrus usage. Full allocated pallets are excluded by criteria and pallet-unit conversion is not used.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The possible strategy and named usage are retained as different source statements, not reconciled into a single proven setting. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01448, b01451, b01453, b01455, b01457, b01459, b01463](reading/sdd-c4c7e01f8ccad48a.md#b01448)

### covetrus-dock-assignment-and-cross-wave-staging

The design connects dock assignment to status flows, carrier assignment and anchor criteria, with fallback locations when no eligible dock positions are found. A later wave added to an already staged load can receive a different default staging lane, which Covetrus handles through a manual staging procedure.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The source separately describes shipment-based staging and one staging location per load; their configured reconciliation was not supplied. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01483, b01485, b01487, b01489](reading/sdd-c4c7e01f8ccad48a.md#b01483)

### covetrus-shipping-work-grouping-design

The SDD creates dry pick-and-pass, dry-cart, cooler and special-pick work per shipping container, while pallet work is per wave-built pallet and bulk work is constrained by configured maxima. It explicitly says no shipment-allocation work is created and limited quantity is not a separate work type.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Bulk maxima are described as volume in the work-creation section and volume, weight and instruction count in the execution assumptions; actual configured values are absent. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01493, b01497, b01501, b01510, b01514, b01518, b01522, b01526, b01528, b01532, b01813](reading/sdd-c4c7e01f8ccad48a.md#b01493)

### covetrus-wave-cancel-release-and-hold

The Covetrus description separates cancellation from release: canceling a wave reverses allocations and removes created work and containers, while release removes Wave Not Released holds and prints configured paperwork. Conveyor sites additionally send carton and zone-pick information to WCS through EX04 at release.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. These are source procedures only. No cancellation, release, printing or WCS transmission was performed. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01581, b01585, b01589, b01594, b01595, b01596, b01600, b01605, b01607, b01611, b02202](reading/sdd-c4c7e01f8ccad48a.md#b01581)

### covetrus-post-release-cancellation-guards

For Covetrus, canceling a shipment after wave release removes its shipping work and containers and returns it to the pool, but picked items must be transferred back to stock. Replenishment work is not canceled automatically; active picker execution prevents cancellation. After release only a warehouse user can cancel, while the host can change a shipment only in In Pool status.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The named implementation describes these guards; it does not prove permissions or recovery in the assessed environment. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01619, b01622](reading/sdd-c4c7e01f8ccad48a.md#b01619)

### covetrus-pick-pass-and-cart-validation

Dry pick-and-pass uses the container work unit, location/item validation and zone handoff; if no work exists in the current zone, the container is passed onward. Dry and cooler carts are built by assigning scanned containers to spots before Begin Picks, then validating the destination container for single or multiple spots.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Item validation refers to EX07, whose extension note permits turning validation off for flagged items lacking a barcode. The body flow does not establish universal item scanning. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01713, b01714, b01716, b01718, b01739, b01753, b01754, b01757, b01759, b01761, b01767, b01841, b01842, b01844, b01846, b01848, b01854, b01856, b02210](reading/sdd-c4c7e01f8ccad48a.md#b01713)

### covetrus-short-pick-and-putaway-differences

Several pick flows use Skip to continue remaining instructions and Pass to suspend unresolved work for supervisor review. Short-pick access is secured. The bulk section additionally permits an authorized picker to enter the short quantity and reason, while unauthorized cases go to a hospital area. Bulk picking explicitly confirms putaway to Packing; dry/cart/cooler examples use automatic putaway.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The supervisor-only prose and authorized-picker bulk path must not be flattened into one universal role rule. Auto putaway does not measure physical travel completion. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01686, b01688, b01690, b01703, b01705, b01707, b01741, b01743, b01745, b01763, b01765, b01769, b01823, b01825, b01827, b01829, b01831, b01833, b01850, b01852, b01858](reading/sdd-c4c7e01f8ccad48a.md#b01686)

### covetrus-full-carton-and-content-edit-boundary

When a carton fills during dry pick-and-pass or cart picking, Covetrus marks it for a packing station to unpack and repack into a new container. The Shipping Container Insight description unpacks selected items by setting quantity to pack to zero, then repacks them through Packing; editing contents requires the container to be in a location whose subclass is Packing.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. This supports a named unpack/repack procedure, not a general replacement-LPN eligibility contract. It does not establish permission to substitute arbitrary LPNs or bypass picked-stock controls. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01747, b01806, b01946, b01955](reading/sdd-c4c7e01f8ccad48a.md#b01747)

### covetrus-picking-visual-qc-and-vas-boundary

The design distinguishes visual QC/VAS performed during picking from recorded outbound QC/VAS, citing labor and space constraints. It uses text or item-category displays during picking, while systemic VAS is reserved for Pharmacy and requires confirming the assigned activity before carton close.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. EX13 and EX28 are implementation extensions. A visual check during picking does not demonstrate a recorded QC or VAS transaction. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01442, b01444, b01867, b01876, b01878, b01882, b02210, b02267](reading/sdd-c4c7e01f8ccad48a.md#b01442)

### covetrus-outbound-qc-force-pass-distinction

The Covetrus document first describes normal QC scanning, configurable failure reasons and successful QC before carton close, but separately states that TLC orders often use Force QC pass for a visual-QC process. It also says fuller use would need custom barcode parsing.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Forced pass is an explicitly named implementation choice; it must not be rewritten as proof that every item was scanned or that a failed inspection was physically corrected. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01437, b01891, b01893, b01898, b01903, b02267](reading/sdd-c4c7e01f8ccad48a.md#b01437)

### covetrus-close-container-and-manifest-boundaries

Closing a container marks it packed and prevents adding further items while advancing its configured status flow. Parcel manifesting is described before close. For international parcels, however, the SDD also describes closing each container and a shipment-level manifest after the last close, while its profile and future-function sections place international logistics outside SCALE and list integration as future work.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The international statements conflict in integration scope; no deployed manifest sequence is established. EX11 host invoice printing is a separate extension. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01917, b01919, b01921, b01923, b01925, b01931, b01937, b01258, b02293](reading/sdd-c4c7e01f8ccad48a.md#b01917)

### covetrus-carrier-transfer-and-hospital-boundaries

The SDD describes changing an LTL carrier before truck loading by transferring the shipment to a known load or creating a new carrier load. It calls post-wave carrier changes exceptional and handled by an external procedure. Packing exceptions use a hospital station; pallet corrections can require a status flow containing Packing and a systemic move into a packing location.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The described external procedures are not supplied as verified operator instructions. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01960, b01962, b01964, b01966, b01967, b01981, b02007, b02009](reading/sdd-c4c7e01f8ccad48a.md#b01960)

### covetrus-dock-loading-versus-load-confirmation

Covetrus manually assigns the dock door to a shipping load to generate loading work. Immediate Dock Transfer moves a scanned container and advances it to Ship Confirm Pending. Load confirmation then removes dock inventory, closes load/shipment/detail/container statuses and makes host upload available; afterward the shipment cannot be modified.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The design avoids splitting shipments because of host restrictions, moving unready shipments to another load. Its general status list also names Load Confirm Pending; no live status machine was reconciled. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b02023, b02025, b02032, b02038, b02040, b02052](reading/sdd-c4c7e01f8ccad48a.md#b02023)

### covetrus-parcel-carrier-and-end-of-day-conflict

The parcel section says Covetrus uses only FedEx, excludes FedEx actions from Manifest Insight and requires no FedEx end-of-day processing. The following section nevertheless describes closing a manifest and Allow Multiple Manifests per Day set to Yes, while the earlier order-profile table lists several parcel carriers.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retain the generic procedure and carrier-specific exclusion as a source-scope conflict. Do not prescribe end-of-day closing for FedEx from this material. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01258, b02057, b02061](reading/sdd-c4c7e01f8ccad48a.md#b01258)

### covetrus-label-id-conflict

Covetrus label identifiers are inconsistent: the label register maps Vendor, Container Contents, Shipping, Break and Pallet labels to LBL02 through LBL06, but full-pallet and close-container passages assign different IDs to some labels.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Keep document labels descriptive until the owner supplies authoritative routing definitions. No print job or label certification was performed. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01541, b01543, b01546, b01550, b01660, b01928, b01934, b01935, b02225, b02227](reading/sdd-c4c7e01f8ccad48a.md#b01541)

### haddad-work-creation-selection-and-assignment

The HADDAD walkthrough separates work-request selection and instruction ordering in work criteria, work generation in a work creation master, and work-type/work-zone participation in a work profile. It repeats the configuration chain for receiving, shipment allocation, shipment container, replenishment, inventory transfer and cycle count work.

This describes a configuration dependency chain in the SCALE 2020 example. It does not prove a scheduled caller, a complete runtime precedence contract or an active profile for an assessed user. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00292, b00303, b00304, b00310, b00311, b00312, b00313, b00314, b00315, b00340, b00341, b00342, b00343, b00368](reading/sdd-f46806ef53e15f07.md#b00292)

### haddad-receipt-criteria-parent-container-grouping

The Putaway Work CPO receipt-work example filters locating requests to non-null FROM_LOC and non-null PARENT_CONTAINER_ID, orders by PARENT_CONTAINER_ID ascending with Create work unit set to Yes on that sort row, and links the criterion to a pre-build master whose work unit field is Container id.

The unchecked Create work unit control above the sort grid is a row-entry control; the saved row explicitly says Yes. The screenshot does not prove final instruction counts or how Container id and parent-container grouping interact at runtime. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00216, b00217, b00301, b00303, b00304, b00305](reading/sdd-f46806ef53e15f07.md#b00216)

### haddad-receiving-example-does-not-enable-group-putaway

The RECEP STD PCB example selects Check in and locate (immediate) on RF, but its General tab leaves Execute group putaway unchecked. The prose states immediate locating as a prerequisite for group creation; that prerequisite alone does not establish that the shown preference enables group putaway.

Preserves the distinction between a documented prerequisite and a separately displayed option. No correction to either source account or current configuration is inferred. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00268, b00270, b00271, b00272, b00273](reading/sdd-f46806ef53e15f07.md#b00268)

### haddad-work-profile-example-tab-limit

The receiving section says work-profile detail Work Processing settings define assignment and completion. Its two adjacent example images show a Work type selection and the profile detail-record list, not the contents of Work Processing. The later inspected profile images show work-type, warehouse-access and work-zone selections.

These pictures support associations and authorization surfaces only. They cannot establish assignment/completion modes or the effective access of any current operator. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00292, b00293, b00295, b00356, b00358, b00359, b00360](reading/sdd-f46806ef53e15f07.md#b00292)

### haddad-special-handling-example-verification

HADDAD describes special handling as validations or restrictions for a group of work instructions. Its picking example selects Container verify, location verification None, Item verification and Use converted qty, while Quantity, License plate and Lot verification are unchecked. The key-values image selects Work and names work zone W-Picking PCB.

The work-type text is clipped and is not reconstructed. Receipt putaway choices and several lower override labels are clipped or have no visible selection; the images do not establish a complete precedence or override contract. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00363, b00366, b00370](reading/sdd-f46806ef53e15f07.md#b00363)

### haddad-allocation-example-fallback-and-filter

The HADDAD allocation example links Haddad assignment to Affectation Standard. Its rule details use Reserve PAL, Picking PCB and Picking UVC at sequences 10, 20 and 30. Prose describes falling through to the next selection when nothing is found. Reserve PAL is a selection name; the visible predicate actually names allocation zone A-Reserve PCB.

The name/zone distinction is retained, not silently corrected. Strategy and lot captions are clipped, and neither these screenshots nor their names prove the full runtime allocation contract. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00453, b00454, b00459, b00463, b00464, b00466, b00467](reading/sdd-f46806ef53e15f07.md#b00453)

### haddad-inventory-status-provenance-disagreement

HADDAD prose calls Available and Held normally system-created inventory statuses. The accompanying list shows both active with System created set to No; the Available edit dialog also leaves System created unchecked, despite a historical last-updated user label of System.

Source provenance disagreement is retained. A last-updated user label is not equivalent to the System created flag and does not resolve the discrepancy. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00209, b00210](reading/sdd-f46806ef53e15f07.md#b00209)

### haddad-location-new-versus-edit-state

The location prose describes creating locations and says the initial status is usually Empty. Its adjacent screenshot is titled Edit existing and displays Storage. The same picture shows disabled edit controls, Multi item and Track license plates checked, and Allocate in transit unchecked.

The existing-record picture does not contradict a new-record default or establish universal defaults. The separate small checkboxes select fields to edit; they are not the displayed inventory-option values. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00111, b00112, b00118, b00119](reading/sdd-f46806ef53e15f07.md#b00111)

### haddad-inventory-work-scope-example

For inventory movements requiring user work, HADDAD lists Work Group, Work Type, Work Profile, Work Criteria and Work Creation Master. It describes special handling as optional for changing RF confirmation validation fields. The later transfer/adjustment work-criteria subsection says that part is not used in this warehouse example.

A documented prerequisite chain is separate from the example decision not to use that subsection. It is not evidence that the assessed warehouse uses or avoids inventory work. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00197, b00198, b00199, b00200, b00201, b00202, b00203, b00216, b00217, b00218](reading/sdd-f46806ef53e15f07.md#b00197)

### haddad-replenishment-criteria-um-grouping

The inspected replenishment-work criterion visibly groups the converted quantity UM alternatives PAL or PCB in parentheses. The parenthesized group is combined with AND filters for a non-null item, source warehouse, allocation zone, destination work zone, lot and replenishment master.

This is the visible configuration example, not a query executed or an effective rule observed in the assessed deployment. Its example warehouse, zone, lot and master values must not be generalized. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00335, b00336](reading/sdd-f46806ef53e15f07.md#b00335)

### Retained asset descriptions

#### Routing selection example

The routing-selection tab shows separate device and document drop-downs and a copy-count field set to one. The paired routing-criteria tab is visible but not its rules in this image. User identity and example printer/document names are not reproduced here.

Limit: Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established.

[sdd-56008a31665dcc23 s006-sh006](reading/sdd-56008a31665dcc23.md#s006-sh006)

Assets: [200b3c4fd48311a7b63e4cab2255dd1ef5a85f8d475cf638760e9dcc34ab6119.png](assets/sdd-56008a31665dcc23/200b3c4fd48311a7b63e4cab2255dd1ef5a85f8d475cf638760e9dcc34ab6119.png)

#### Carrier shipping-label example

The portrait example separates the address block, routing code, service line and tracking barcode, with weight and package sequence at the top. It illustrates carrier-shipping identification rather than a list of packed items.

Limit: Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established. Example contact, address and tracking values are omitted; visual inspection cannot validate carrier acceptance or barcode scanning.

[sdd-56008a31665dcc23 s010-sh004](reading/sdd-56008a31665dcc23.md#s010-sh004)

Assets: [bf46bc276ed5d71dd920e424721287363f880966cfbc3c35cef038bc23025ef3.png](assets/sdd-56008a31665dcc23/bf46bc276ed5d71dd920e424721287363f880966cfbc3c35cef038bc23025ef3.png)

#### Container-contents label example

A container header and type appear above shipment/reference fields and a line-item grid with item, description, location and quantity columns. A tracking field is present but empty in this sample.

Limit: Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established.

[sdd-56008a31665dcc23 s011-sh004](reading/sdd-56008a31665dcc23.md#s011-sh004)

Assets: [af523e79cb3a9dd390db0545afd4958cd1a54b279327cbc4041ab9c10fdd2649.png](assets/sdd-56008a31665dcc23/af523e79cb3a9dd390db0545afd4958cd1a54b279327cbc4041ab9c10fdd2649.png)

#### Shipment break-label example

A large Break Label heading is followed by shipment and container identifiers, leaving most of the sample blank. The image illustrates a separator between label groups; it contains no item-content grid.

Limit: Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established.

[sdd-56008a31665dcc23 s012-sh004](reading/sdd-56008a31665dcc23.md#s012-sh004)

Assets: [574b90044d313720c701fdf724b1c9a021b7514372a51f91326057dd3d94cfb1.png](assets/sdd-56008a31665dcc23/574b90044d313720c701fdf724b1c9a021b7514372a51f91326057dd3d94cfb1.png)

#### Receipt-container label example

The sample places a license-plate barcode above destination, receipt identifier/date, item description and quantity with unit of measure. It illustrates inbound container identity and destination information.

Limit: Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established.

[sdd-56008a31665dcc23 s013-sh004](reading/sdd-56008a31665dcc23.md#s013-sh004)

Assets: [64f9775c95eda9fc2141ddc12df353c8a44305f9ed67b4c5c00b4760c2419adb.png](assets/sdd-56008a31665dcc23/64f9775c95eda9fc2141ddc12df353c8a44305f9ed67b4c5c00b4760c2419adb.png)

#### Container-type break-label example

The custom break-label output presents wave number, container type and count in large text. These fields match the customer example's need to assemble cart containers by type.

Limit: Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established.

[sdd-56008a31665dcc23 s037-sh004](reading/sdd-56008a31665dcc23.md#s037-sh004)

Assets: [4d5562848af069d6b28d8b4caedffad054b4ed7366190544a20e96fd1750c281.png](assets/sdd-56008a31665dcc23/4d5562848af069d6b28d8b4caedffad054b4ed7366190544a20e96fd1750c281.png)

#### Container-contents label with identification barcode

The custom contents example adds a wide barcode above the container/type/shipment header and line-item grid. This supplies a scannable container identifier in the design example; no scan test was performed.

Limit: Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established.

[sdd-56008a31665dcc23 s039-sh004](reading/sdd-56008a31665dcc23.md#s039-sh004)

Assets: [dd735c3a95e589ad19f4c750c6466083b14fbe6b09676812d3fd136e87ff64d4.png](assets/sdd-56008a31665dcc23/dd735c3a95e589ad19f4c750c6466083b14fbe6b09676812d3fd136e87ff64d4.png)

#### Vendor-label requirement and output illustrations

Two illustrations organize sender/recipient information above a merchandise grid and a carton barcode. The grids include channel, item/product identifiers, merchandise description, quantity and purchase-order fields. They illustrate the custom-layout example without proving that the layouts satisfy current retailer requirements.

Limit: Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established. Example names, addresses, identifiers and order values are omitted.

[sdd-56008a31665dcc23 s041-sh004, s041-sh005](reading/sdd-56008a31665dcc23.md#s041-sh004)

Assets: [016db705d9e1f9148ebfff112ca4ccf396b1f7f02afbeb97e4b77466be973518.png](assets/sdd-56008a31665dcc23/016db705d9e1f9148ebfff112ca4ccf396b1f7f02afbeb97e4b77466be973518.png); [01e99ac722b6b30675f1f8a9533222148ce35e2d6e01fe237cf97ead87041f6d.png](assets/sdd-56008a31665dcc23/01e99ac722b6b30675f1f8a9533222148ce35e2d6e01fe237cf97ead87041f6d.png)

#### Return label template and photographed example

The template image contains field substitutions for receipt, container/license plate, item and destination, with a highlighted rotation command. The photo shows a horizontally arranged receipt/return reference and license-plate barcode, item text and destination label. The photo's destination value is blank.

Limit: Mixed-era SCALE label training deck: slide 3 names SCALE 2021, while examples and paths include other dates/releases. No current deployment, printer output, carrier certification, executable code or verified screen navigation is established. No template was run, barcode decoded or printer configuration validated; color is unnecessary to understand the description.

[sdd-56008a31665dcc23 s043-sh004, s043-sh005](reading/sdd-56008a31665dcc23.md#s043-sh004)

Assets: [4298f3b8bf6d1031aea397a959385b0ff069a38868adfcbf4c86cd2b9b413d7c.jpeg](assets/sdd-56008a31665dcc23/4298f3b8bf6d1031aea397a959385b0ff069a38868adfcbf4c86cd2b9b413d7c.jpeg); [8d2f89558f68a7457389230acf48679e3c7de89ed8625a96ecbfc91fc524a0ae.png](assets/sdd-56008a31665dcc23/8d2f89558f68a7457389230acf48679e3c7de89ed8625a96ecbfc91fc524a0ae.png)

#### Inventory transfer form and inactive Create work action

The form shows adjustment type, license plate, source and destination locations, item, status, company, lot, expiration, quantity and unit of measure. Transfer is highlighted while Create work appears gray. The surrounding text describes Insight-created transfer work, but this static image does not show that action enabled or completed.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained image individually inspected; full DOCX pagination and actual screen behavior unverified.

[sdd-c4c7e01f8ccad48a b00965, b00967, b00969, b00971, b00972](reading/sdd-c4c7e01f8ccad48a.md#b00965)

Assets: [55d7dc39bc49b361a3c719f251aec25e247755bb4df67cb61968a1dfc7f6af50.png](assets/sdd-c4c7e01f8ccad48a/55d7dc39bc49b361a3c719f251aec25e247755bb4df67cb61968a1dfc7f6af50.png)

#### Cycle-count location and quantity entry sequence

Four panels linked by arrows show user-directed work selection, location/check-digit verification, quantity entry and an Actions menu with Add item and Done. The screenshot still labels the bottom button GO, consistent with the neighboring note that Covetrus planned to remap Go to Done and validate the result.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained image individually inspected; full DOCX pagination and actual screen behavior unverified. The planned button remapping is not visually demonstrated as deployed.

[sdd-c4c7e01f8ccad48a b01039, b01041, b01043, b01044, b01045](reading/sdd-c4c7e01f8ccad48a.md#b01039)

Assets: [7113e00dc397f67e8c1a5e9bbcc1e8d0fbebe3e79e3d0d6eb18599d9c7b27728.png](assets/sdd-c4c7e01f8ccad48a/7113e00dc397f67e8c1a5e9bbcc1e8d0fbebe3e79e3d0d6eb18599d9c7b27728.png)

#### Shipment creation through shipping overview

A left-to-right flow connects Shipment Creation, Wave Processing, Picking, Packing, Staging and Shipping. Its short labels progress from creating an outbound document and reserving stock to retrieving items, identifying box contents, moving containers to a staging or hold location and confirming departure. The source assigns rectangles to normally system-driven stages and trapezoids to normally user-driven stages.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained image individually inspected; full DOCX pagination and actual screen behavior unverified.

[sdd-c4c7e01f8ccad48a b01194, b01196, b01197, b01199, b01200, b01202, b01203, b01205, b01206, b01208, b01209, b01211, b01212, b01214, b01215](reading/sdd-c4c7e01f8ccad48a.md#b01194)

Assets: [091788ef99a086319e335dee777119c5836f68db0911d3fb8627dea75c98a0d7.png](assets/sdd-c4c7e01f8ccad48a/091788ef99a086319e335dee777119c5836f68db0911d3fb8627dea75c98a0d7.png)

#### Wave-master manual mode and replenishment master list

The example Wave master window has Manual selected among Automatic, Manual and Build inactive. Its Replenishment Masters tab uses List instead of All and shows one checked master among several candidates. Other tabs include General, Selection criteria and Warehouses, illustrating that a wave master binds several choices rather than one replenishment rule alone.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained image individually inspected; full DOCX pagination and actual screen behavior unverified. Example checked entries are not active settings of the assessed deployment.

[sdd-c4c7e01f8ccad48a b01306, b01307, b01312, b01318, b01332, b01345](reading/sdd-c4c7e01f8ccad48a.md#b01306)

Assets: [b4a12298550af80c27e154f947f70d42da1b95554827235554b63811ab405078.png](assets/sdd-c4c7e01f8ccad48a/b4a12298550af80c27e154f947f70d42da1b95554827235554b63811ab405078.png)

#### Cart start and destination-container verification

The first image shows a Cart picking container-ID field and an Actions menu with Begin picks and New cart. The second shows Cart container putaway with item, quantity, unit, displayed container and spot, plus an empty Container id confirmation field. Together they illustrate starting a built cart and validating the container at a spot; they do not depict the entire cart-building sequence.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained image individually inspected; full DOCX pagination and actual screen behavior unverified.

[sdd-c4c7e01f8ccad48a b01757, b01759, b01767, b01784, b01785, b01795, b01796](reading/sdd-c4c7e01f8ccad48a.md#b01757)

Assets: [1a533925daa48d4c2be80babba838dfcba2449dc4248318a4e143069f6f6e648.png](assets/sdd-c4c7e01f8ccad48a/1a533925daa48d4c2be80babba838dfcba2449dc4248318a4e143069f6f6e648.png); [39cca9b40da41498c34d7622d8046d090dcebf3b58823ba89c42d1bab5cd2af0.png](assets/sdd-c4c7e01f8ccad48a/39cca9b40da41498c34d7622d8046d090dcebf3b58823ba89c42d1bab5cd2af0.png)

#### QC workbench counts and failure-reason entry

The QC workbench displays item entry, unit of measure, count controls, Print and Submit, with rows for packed, counted and failed quantities and reason codes. The failure image adds a banner requiring reason quantities to match failed quantities and a dialog listing reasons such as damaged, missing, different item and wrong quantity.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained image individually inspected; full DOCX pagination and actual screen behavior unverified. The images show Submit while the body calls the action Confirm; neither label is evidence of the current application screen.

[sdd-c4c7e01f8ccad48a b01893, b01895, b01896, b01898, b01900, b01901](reading/sdd-c4c7e01f8ccad48a.md#b01893)

Assets: [3aa3ad01e03e62a4352cce91fe119c799f96ed40782d4c5812e27ad9ac21a907.png](assets/sdd-c4c7e01f8ccad48a/3aa3ad01e03e62a4352cce91fe119c799f96ed40782d4c5812e27ad9ac21a907.png); [6417384282f9b04dde7572cdb6d989932aa6f9516fa8d0e991bda4e6c51f44b3.png](assets/sdd-c4c7e01f8ccad48a/6417384282f9b04dde7572cdb6d989932aa6f9516fa8d0e991bda4e6c51f44b3.png)

#### Force QC pass as a separate workbench action

The QC workbench Actions menu offers Clear counted quantities, Fill all counted quantities and Force QC pass. This visual supports the text distinction between counting all contents and explicitly forcing a pass; the menu alone does not demonstrate a successful QC result.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained image individually inspected; full DOCX pagination and actual screen behavior unverified.

[sdd-c4c7e01f8ccad48a b01891, b01903, b01905, b01906](reading/sdd-c4c7e01f8ccad48a.md#b01891)

Assets: [aebb985c36eb8eb2e661c1f14eb59bd2ea9ed5b785d16b92ae0ecd52c47b9bdb.png](assets/sdd-c4c7e01f8ccad48a/aebb985c36eb8eb2e661c1f14eb59bd2ea9ed5b785d16b92ae0ecd52c47b9bdb.png)

#### Close-container weight and shipping details

The populated Close container image presents container ID and weight, container count and total containers, carrier and service, container type, dimensions, NMFC code and tracking number. The upper-right action is cropped in the retained image, so its full label and final result are not established by this view.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained image individually inspected; full DOCX pagination and actual screen behavior unverified. Displayed example values are not imported as recommended or active configuration.

[sdd-c4c7e01f8ccad48a b01917, b01919, b01937, b01941, b01942](reading/sdd-c4c7e01f8ccad48a.md#b01917)

Assets: [62848b30de7378602a26d545bc06d5fb0ff90d957bc588bfd3d47bb1c0486625.png](assets/sdd-c4c7e01f8ccad48a/62848b30de7378602a26d545bc06d5fb0ff90d957bc588bfd3d47bb1c0486625.png)

#### Shipping-load dock-door selection

The Shipping Load edit form groups carrier, route, seal/trailer identifiers and a Dock door dropdown. The open dropdown lists numbered doors, while navigation includes Dates, Status, Consolidator, Totals and Reference info. This shows where the design illustrates assigning a door; no Save action or generated loading work is observed.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained image individually inspected; full DOCX pagination and actual screen behavior unverified.

[sdd-c4c7e01f8ccad48a b02023, b02025, b02027, b02028](reading/sdd-c4c7e01f8ccad48a.md#b02023)

Assets: [79707dc2981a2cc80a6380eb6f64abe92b1638fe7ed14c228fa21752442aeac9.png](assets/sdd-c4c7e01f8ccad48a/79707dc2981a2cc80a6380eb6f64abe92b1638fe7ed14c228fa21752442aeac9.png)

#### Load confirmation with leading and trailing statuses

The Shipping load insight grid displays separate Trailing Status and Leading Status columns. The selected example has Ship Confirm Pending in both, while other rows show earlier or mixed stages. The Actions menu includes Confirm alongside Close and print choices, supporting the distinction between reviewing readiness and invoking final confirmation.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained image individually inspected; full DOCX pagination and actual screen behavior unverified. No confirmation was invoked; visible totals are example screen contents, not assessed operational metrics.

[sdd-c4c7e01f8ccad48a b02038, b02040, b02043, b02044, b02052](reading/sdd-c4c7e01f8ccad48a.md#b02038)

Assets: [3bf1f9cc2293b1f8df42ffea08b9318335c8e9d32dd4cb4596223f31f533580c.png](assets/sdd-c4c7e01f8ccad48a/3bf1f9cc2293b1f8df42ffea08b9318335c8e9d32dd4cb4596223f31f533580c.png)

#### Receiving preference General example

RECEP STD PCB selects receiving dock QUA.0001.01.01.01, Available inventory, Receiving work type and Manual license-plate assignment. Work team is blank. Allow over receiving and Create putaway work are checked; Execute group putaway and Cross Dock Immediate Needs are unchecked. Inactive is unchecked.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00269, b00270](reading/sdd-f46806ef53e15f07.md#b00269)

Assets: [ca7f5fdb7d23dfaefc1dd16af5170098bd2648d87c8c85b65b5b0f5b2406184d.png](assets/sdd-f46806ef53e15f07/ca7f5fdb7d23dfaefc1dd16af5170098bd2648d87c8c85b65b5b0f5b2406184d.png)

#### Receiving preference RF example

RECEP STD PCB selects Check in and locate (immediate). Check in, Check in and locate, Quick receive - user and Quick receive - system are other visible options. The workflow name is clipped. Nest during check in, Process immediate needs, Bypass location capacity validation and Override system selected location are unchecked; some controls are visibly disabled.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00271, b00272, b00273](reading/sdd-f46806ef53e15f07.md#b00271)

Assets: [23886f878a29e3ba4f13d7854d2394895972b5ae1f9246954cb64e0e81ecaac1.png](assets/sdd-f46806ef53e15f07/23886f878a29e3ba4f13d7854d2394895972b5ae1f9246954cb64e0e81ecaac1.png)

#### Receiving preference Workbench example

Parent is selected as container locating method and Child is not. Verify item dimensions and Verify item unit of measure are checked. Disposition code required and QC inspection active are unchecked; Reason code required is disabled and unchecked.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00274, b00275](reading/sdd-f46806ef53e15f07.md#b00274)

Assets: [5648bad571b8f1c6325f024e6b7b04bb3623fa591bcdf696e792e3fe5f4a651c.png](assets/sdd-f46806ef53e15f07/5648bad571b8f1c6325f024e6b7b04bb3623fa591bcdf696e792e3fe5f4a651c.png)

#### Receipt disposition code list

D01 through D06 and QC are shown active and not system-created. QC is described as Receipt Quality Control with System value 1 QC-Quality Control. The D01 description is clipped; D02 through D06 show reboxing, restoration, data error, deterioration and other categories in French. No rule-assignment dialog is shown.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00253, b00254](reading/sdd-f46806ef53e15f07.md#b00253)

Assets: [228e67ac8eba1e63ee1f56b4319b5e02a4a1ebdf6dea2c5e06664ae308ee671f.png](assets/sdd-f46806ef53e15f07/228e67ac8eba1e63ee1f56b4319b5e02a4a1ebdf6dea2c5e06664ae308ee671f.png)

#### HADDAD work-profile list

The list contains consolidation, cycle-count, picking, Putaway, Putaway CPO and replenishment profiles, all visible rows marked Active Yes. Several long names are clipped. A row name alone does not reveal its work-processing options or user authorization.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00291, b00292](reading/sdd-f46806ef53e15f07.md#b00291)

Assets: [53220fe74107940cd44ddf1f668617939f9b88ffb0272eda6a99dcf2353812a7.png](assets/sdd-f46806ef53e15f07/53220fe74107940cd44ddf1f668617939f9b88ffb0272eda6a99dcf2353812a7.png)

#### Work-profile type detail and saved row

The detail for PREP ACTIF PCB MSGCOL VAS has sequence 10 and only the matching visible work type checked. The adjacent profile image shows one saved detail row at sequence 10 with that work type. Both images concern this picking-named profile despite appearing in the Receiving section; neither shows the contents of the Work processing tab.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00292, b00293](reading/sdd-f46806ef53e15f07.md#b00292)

Assets: [635e9b1967722917bf9bd0d9f970e35b9611b76dffca7b38948871b4121d8cab.png](assets/sdd-f46806ef53e15f07/635e9b1967722917bf9bd0d9f970e35b9611b76dffca7b38948871b4121d8cab.png); [e989272de5c18cc9f4a5d15dc53abb39a8d3f714c6e580dc75cfa3f47039d481.png](assets/sdd-f46806ef53e15f07/e989272de5c18cc9f4a5d15dc53abb39a8d3f714c6e580dc75cfa3f47039d481.png)

#### Receipt work criteria list

The list shows Putaway Work CPO, Putaway Work PAL, Putaway Work PCB SPCS and Putaway Work UVC as active and not system-created. The third filter-name cell is clipped while its description spells out Putaway Work PCB SPCS.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00300](reading/sdd-f46806ef53e15f07.md#b00300)

Assets: [7a28f27a77eab4017d88c3245950530f98992562ce833c7405b9abdda45c9b21.png](assets/sdd-f46806ef53e15f07/7a28f27a77eab4017d88c3245950530f98992562ce833c7405b9abdda45c9b21.png)

#### Receipt work criteria filter and order

Putaway Work CPO uses record type RECEIPT and Locating request. The filter requires non-null FROM_LOC and PARENT_CONTAINER_ID. The Order by image saves PARENT_CONTAINER_ID Ascending with Create work unit Yes. Its separate row-entry Create work unit checkbox is unchecked. Inactive and System created are unchecked.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00216, b00217, b00301](reading/sdd-f46806ef53e15f07.md#b00216)

Assets: [a97b1cec184d1d984b9c0acdef52ed4aadb7fdcec9996928754602efbb41eb03.png](assets/sdd-f46806ef53e15f07/a97b1cec184d1d984b9c0acdef52ed4aadb7fdcec9996928754602efbb41eb03.png); [e7057dec87aa7edeabdfd5ed8edb2e146db213a51d563f1fa486d4e1929be784.png](assets/sdd-f46806ef53e15f07/e7057dec87aa7edeabdfd5ed8edb2e146db213a51d563f1fa486d4e1929be784.png)

#### Receipt work creation master

Putaway Work CPO shows work type Putaway CPO, work unit Container id, method Pre-build, priority 1, process Receipt Work Criteria and matching work criteria. SRC identifier text is clipped. Auto print documents is unchecked. The Maximums tab exists but its contents are not shown.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00303, b00304, b00305](reading/sdd-f46806ef53e15f07.md#b00303)

Assets: [4cc9655506a8d8c14ddced4624616f1e73bbed64f7c6c6658b11fb76a2fc87ae.png](assets/sdd-f46806ef53e15f07/4cc9655506a8d8c14ddced4624616f1e73bbed64f7c6c6658b11fb76a2fc87ae.png)

#### Dock work criteria list fragment

Three visible list rows read MONO BP, MSGCOL and MSGPAL. The headers are outside the image, so the adjacent No/Yes columns are not independently assigned meanings from this crop.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00326, b00327](reading/sdd-f46806ef53e15f07.md#b00326)

Assets: [095053a530bc965d99f016a4603989fa3b19a315ab36e81597d6a1263770a8b4.png](assets/sdd-f46806ef53e15f07/095053a530bc965d99f016a4603989fa3b19a315ab36e81597d6a1263770a8b4.png)

#### Dock work filter example

MONO BP uses record type DOCKMGMTWRKCRIT and Shipping container. Its conjunction requires SHIPPING_CONTAINER.STATUS_FLOW_NAME equal to MSGPAL, SHIPPING_CONTAINER.PARENT non-null and SHIPMENT_HEADER_VIEW.USER_DEF3 null. The filter name differs from the literal status-flow value and must not replace it. Order by contents are not shown.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00326, b00328](reading/sdd-f46806ef53e15f07.md#b00326)

Assets: [4b2c9a8923ebe74eba8c00f16a6eb7a89afd5201acdb2e2ebdd18353586a62c6.png](assets/sdd-f46806ef53e15f07/4b2c9a8923ebe74eba8c00f16a6eb7a89afd5201acdb2e2ebdd18353586a62c6.png)

#### Replenishment work criteria example

The example uses the Replenishment request table. A visibly parenthesized group selects CONVERTED_QTY_UM PAL or PCB. Surrounding AND filters constrain non-null ITEM, source warehouse, allocation zone, destination work zone, lot and replenishment master.

Limit: Parentheses are visible around the two UM alternatives. This describes the source image only; no SQL was executed and no installed rule, effective value or production recommendation is established.

[sdd-f46806ef53e15f07 b00335, b00336](reading/sdd-f46806ef53e15f07.md#b00335)

Assets: [e5270df7ff721318675c344856e89ebd45b56a4206106c36b7d4f7076717ffbf.png](assets/sdd-f46806ef53e15f07/e5270df7ff721318675c344856e89ebd45b56a4206106c36b7d4f7076717ffbf.png)

#### Two picking work creation examples

PREP ACTIF PCB MSGCOL VAS and PREP ACTIF PCB MON BP VAS both show Pre-build, priority 1 and Auto print documents unchecked. The work-unit field begins Internal instruction; work-type, process, criteria and SRC names are clipped. Both images show General, not Maximums, so no work-size ceiling can be established.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00346, b00347](reading/sdd-f46806ef53e15f07.md#b00346)

Assets: [7d2392c36ee0cdc5ab20921726e72b5ad4783eabfe019312452659055ccb14e0.png](assets/sdd-f46806ef53e15f07/7d2392c36ee0cdc5ab20921726e72b5ad4783eabfe019312452659055ccb14e0.png); [d90b8be5eed025dabda78534e9a3e12971a05a664890df23fcbabd2950d8459f.png](assets/sdd-f46806ef53e15f07/d90b8be5eed025dabda78534e9a3e12971a05a664890df23fcbabd2950d8459f.png)

#### Dock transfer work creation examples

CONSO MSGPAL MONO and CONSO MSG COLIS both show Tree unit id, Pre-build and priority 1. Their work criteria are MONO BP and MSGCOL respectively. Work-type, process and SRC labels are clipped. Auto print documents is unchecked and no Maximums contents are visible.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00349, b00351](reading/sdd-f46806ef53e15f07.md#b00349)

Assets: [2e0ad37bfceaa1bfa81591ddbb7412ebc671d1ffa071afa9d901a4e168bddcb5.png](assets/sdd-f46806ef53e15f07/2e0ad37bfceaa1bfa81591ddbb7412ebc671d1ffa071afa9d901a4e168bddcb5.png); [4691311b9d09e43adeabb0e1d3cbff72289053d6193da943dc5a635a202c2de0.png](assets/sdd-f46806ef53e15f07/4691311b9d09e43adeabb0e1d3cbff72289053d6193da943dc5a635a202c2de0.png)

#### Consolidation work-profile detail

CONSO MSG COLIS detail sequence 10 checks CONSO MSG COLIS in the work-type list. The Work processing tab is visible but unopened, so assignment/completion options cannot be read.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00356, b00358](reading/sdd-f46806ef53e15f07.md#b00356)

Assets: [52d05bff6d122d4f5fef3c1f75f55daebb788c2c6f1efa53be344312a72eaef9.png](assets/sdd-f46806ef53e15f07/52d05bff6d122d4f5fef3c1f75f55daebb788c2c6f1efa53be344312a72eaef9.png)

#### Consolidation profile warehouse access

CONSO MSG COLIS has Warehouse authorization All selected and List unselected; the displayed warehouse 001 row is checked. The authorized-users tab is visible but its contents are not shown.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00295, b00359](reading/sdd-f46806ef53e15f07.md#b00295)

Assets: [f0eb504c2ee54d635cda4ac417c78f6014cba5dc96640ccdbb6dada663a095ac.png](assets/sdd-f46806ef53e15f07/f0eb504c2ee54d635cda4ac417c78f6014cba5dc96640ccdbb6dada663a095ac.png)

#### Consolidation profile work-zone selection

CONSO MSG COLIS shows Work zone selections. W-AGV INJ is unchecked. Visible checked zones include W-AKANEA, W-Consolidation, W-Consolidation perso, W-CTRL, W-Emballage, W-Expedition, W-Perso, W-Picking PCB, W-Picking Samples, W-Picking SPCB, two cell-specific UVC zones, UVC Grade A and Grade B, W-Recep and W-Reserve PCB.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00292, b00360](reading/sdd-f46806ef53e15f07.md#b00292)

Assets: [48cf699fbd1b52020cba1828cd17596e4d6ba617b44d17659420a89d1d9dd9ad.png](assets/sdd-f46806ef53e15f07/48cf699fbd1b52020cba1828cd17596e4d6ba617b44d17659420a89d1d9dd9ad.png)

#### Special-handling key grid

The grid exposes Item, Account, Company, Username, Work type and Work zone columns. The displayed rows have blank first four columns and values under Work type and Work zone, with many clipped identifiers. This illustrates key dimensions but does not prove match precedence or the exact identity of every row.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00363, b00364](reading/sdd-f46806ef53e15f07.md#b00363)

Assets: [8d0e9ee94b3e1b42c00bd36a82141a2f193e1c6a216d62c9b66ae7a3c491a27e.png](assets/sdd-f46806ef53e15f07/8d0e9ee94b3e1b42c00bd36a82141a2f193e1c6a216d62c9b66ae7a3c491a27e.png)

#### Picking special-handling General and Key values

General selects Container verify, location verification None, Item verification and Use converted qty. Quantity, License plate and Lot verification, Close after partial pick and Replenish on outbound are unchecked. Key values selects Work and shows zone W-Picking PCB with a clipped work-type value. Several receipt/override labels are cropped or overlapped; their complete values are not transcribed.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00363, b00366, b00370](reading/sdd-f46806ef53e15f07.md#b00363)

Assets: [388e7307beb19a73f60b9f51a810f00d92c96d08137f9d009ab34ce573ea4c09.png](assets/sdd-f46806ef53e15f07/388e7307beb19a73f60b9f51a810f00d92c96d08137f9d009ab34ce573ea4c09.png); [55eb31da7e539b3c6ef7a93f4fc55b73da160c2823b84493c6479d0f3924e7d8.png](assets/sdd-f46806ef53e15f07/55eb31da7e539b3c6ef7a93f4fc55b73da160c2823b84493c6479d0f3924e7d8.png)

#### Allocation assignment criteria list and predicate

The list contains Haddad assignment and Haddad assignment CPO, both active and not system-created. The displayed Haddad assignment uses Shipment detail and requires COMPANY Haddad, non-null INTERNAL_SHIPMENT_NUM and null USER_DEF3. The CPO predicate is not shown.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00451, b00452, b00453, b00454](reading/sdd-f46806ef53e15f07.md#b00451)

Assets: [ffc13011a23cc5833d85d4a1590aebf59526980ce8991d231e2bb57648e8ff8f.png](assets/sdd-f46806ef53e15f07/ffc13011a23cc5833d85d4a1590aebf59526980ce8991d231e2bb57648e8ff8f.png); [e41f40fdc1aceba45d8666ecd703bb23ab31919c33ff21eefb97b510fa9e1082.png](assets/sdd-f46806ef53e15f07/e41f40fdc1aceba45d8666ecd703bb23ab31919c33ff21eefb97b510fa9e1082.png)

#### Reserve PAL allocation selection

Reserve PAL uses record type ALLOC SEL and Location. The displayed AND filter selects allocation zone A-Reserve PCB, active Y, null inventory attribute 1, location status not Frozen, inventory status Available, warehouse 001 and locating zone not L-Articles CPO. Inactive and System created are unchecked. Order by exists but is unopened.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00456, b00459](reading/sdd-f46806ef53e15f07.md#b00456)

Assets: [c6e26ee8b0d49e48109680c1ecff490a6c22b3ba453bf92e76184148ad147c89.png](assets/sdd-f46806ef53e15f07/c6e26ee8b0d49e48109680c1ecff490a6c22b3ba453bf92e76184148ad147c89.png)

#### Affectation Standard allocation detail sequence

The selected rule has detail 10 Reserve PAL eligible PAL, detail 20 Picking PCB eligible PCB SPCS, and detail 30 Picking UVC eligible UVC. Strategy captions begin Closest Match and lot captions begin Specified lot, but neither is fully visible. The list above marks *Default inactive and several named rules active.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00463, b00464](reading/sdd-f46806ef53e15f07.md#b00463)

Assets: [2f9a68041185b76542ad0d5f1456c189847b7171969f452d8ad74eb38cbd876d.png](assets/sdd-f46806ef53e15f07/2f9a68041185b76542ad0d5f1456c189847b7171969f452d8ad74eb38cbd876d.png)

#### Allocation rule assignment priorities

The list maps priority 10 Haddad assignment to Affectation Standard and 20 Haddad assignment CPO to Affectation CPO; both are active. The priority-10 dialog shows Always override unchecked and Inactive unchecked. The screenshot does not describe priority direction or ties.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00466, b00467](reading/sdd-f46806ef53e15f07.md#b00466)

Assets: [c369bcbec44a539489231092ce6db8633218a1f828485b1c0d03f8f167cc0c18.png](assets/sdd-f46806ef53e15f07/c369bcbec44a539489231092ce6db8633218a1f828485b1c0d03f8f167cc0c18.png)

#### Existing location General options

The Edit existing dialog uses template Stock / Prel and warehouse 001; starting and ending components match. Location class is Inventory Storage, type Palletier and status Storage. Multi item and Track license plates are checked, Allocate in transit unchecked. Disabled controls and separate field-edit checkboxes are visible. It is an existing-location example, not a new-location default screen.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00111, b00112, b00118, b00119](reading/sdd-f46806ef53e15f07.md#b00111)

Assets: [ee1ab3c618eab2aec1825c54e035b4d76ca5e91185a22b2b10378f171005faa0.png](assets/sdd-f46806ef53e15f07/ee1ab3c618eab2aec1825c54e035b4d76ca5e91185a22b2b10378f171005faa0.png)

#### Item-class capacity example

Item class PANTALON has visible rows for Bacs pckg carton alveole and Palletier. Each row shows Min. 0, Max. 100 and a further quantity-looking column 0.00000, but that column heading and the rightmost quantity/UM detail are clipped. No physical quantity or UM is inferred from the partial headers.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00190, b00191, b00192](reading/sdd-f46806ef53e15f07.md#b00190)

Assets: [ebdbabe86db4e5ccbb89610077dfd2835e95fea38741e3c4c650c7342c9266bf.png](assets/sdd-f46806ef53e15f07/ebdbabe86db4e5ccbb89610077dfd2835e95fea38741e3c4c650c7342c9266bf.png)

#### Location quantity UM selection

The existing Stock / Prel location shows Pallet, PCB and SPCS checked and UVC unchecked. Edit quantity um is unchecked and the listed controls are disabled. The image shows membership, not conversion quantities.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00125, b00126](reading/sdd-f46806ef53e15f07.md#b00125)

Assets: [3004e811b38ed16770ab90f608044b873fc308812cfaab801a31889edc6f308d.png](assets/sdd-f46806ef53e15f07/3004e811b38ed16770ab90f608044b873fc308812cfaab801a31889edc6f308d.png)

#### Inventory status provenance example

Available and Held are active with System created No in the list. The selected Available record has type INVSTATUS, Inactive unchecked and System created unchecked. The historical last-updated user label reads System; it does not change the unchecked creation flag.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00209, b00210](reading/sdd-f46806ef53e15f07.md#b00209)

Assets: [1de546cc315bee67362b3e543a2c72e94c36649a867c1a6376d7b62e28bb8a70.png](assets/sdd-f46806ef53e15f07/1de546cc315bee67362b3e543a2c72e94c36649a867c1a6376d7b62e28bb8a70.png)

#### Inventory adjustment-type list

The grid lists stock adjustment, multiple EXOTEC transfer/injection variants, inventory, cycle-count reconciliation, Status Change and Transfert. Some identifiers are clipped. No adjustment edit dialog or Include In Interface Uploads checkbox is visible, so the list cannot establish which types are uploaded.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00213, b00214](reading/sdd-f46806ef53e15f07.md#b00213)

Assets: [52ff9cc9d2234eef743f1e023b0b384833c8902b6ea146812030de506da11ab2.png](assets/sdd-f46806ef53e15f07/52ff9cc9d2234eef743f1e023b0b384833c8902b6ea146812030de506da11ab2.png)

### Additional source qualifications

- Work/Picking b00837-b00838 uses both instruction assignment and work-summary assignment without defining summary structure; retain the distinction rather than equating these records.
- Labels slide 13 speaker-note locating timing and slide 42 customer-return check-in timing have different source contexts; no universal receipt-label trigger is established.
- Labels slides 7, 8 and 21 repeat a speaker-note remark unrelated to their label subjects; it is excluded as workflow authority.
- The label-training deck does not establish current carrier/retailer certification, printer command correctness, installed print paths or successful physical output. Existing clipped/incomplete code limitations remain.
- Covetrus b01033 leaves the short-pick-to-cycle-count screen reroute unresolved; b01084 places the recent cycle-count action outside original scope while b02210 describes EX25 as preventing plan closure with a pending request. No deployment evidence resolves the request-versus-plan distinction.
- Covetrus b01425 and b02246 identify custom EX26 3D cubing as additional scope under development. b02244 also leaves group-container close for dry cart picking open. Neither is counted as delivered functionality.
- Covetrus b01477 describes a load accepting a shipment unless the load is not flagged to stop additional shipments; this negative condition is internally ambiguous and was not converted into an executable load-eligibility rule.
- Covetrus b01487 describes staging by shipment/customer/carrier while b01991 describes one default staging location per load; b01489 separately requires a manual procedure when a later wave receives another default lane. Effective criteria and reconciliation remain unobserved.
- Covetrus label IDs in b01660 and b01928-b01935 disagree with the b02225 label register. Authoritative document routing is needed before deriving an exact print SOP.
- Covetrus b01937 describes international shipment manifesting after final container close, but b01258 places international logistics outside SCALE and b02293 lists parcel integration as future functionality. The implemented integration and timing remain unresolved.
- Covetrus b02057 excludes FedEx end-of-day processing and says no other parcel carrier is used, whereas b02061 gives a generic manifest-close procedure and b01258 lists multiple carrier examples. Do not apply the generic closing step to FedEx without carrier-specific evidence.
- Covetrus b01946 and b01955 support unpack/repack at a Packing-subclass location, but do not specify a general replacement-LPN eligibility contract. This bounded implementation example does not close the remaining general Packing replacement-LPN evidence gap.
- Covetrus b00971 caption calls the picture transfer with work, but Create work appears inactive in the retained image. Cycle-count b01044 still shows GO despite the planned button-remapping note. These pictures do not demonstrate deployment of those choices.
- HADDAD b00209 calls Available/Held normally system-created, while b00210 shows System created No/unchecked. The historical last-updated System user label is distinct; original intended provenance requires a source correction or authoritative record, not inference.
- HADDAD b00454 says USER_DEF3 distinguishes standard/CPO allocation, but only the standard IS NULL predicate is shown. The CPO predicate, allocation-priority direction and Always override semantics are not established by this example.
- HADDAD work-profile prose describes Work Processing assignment/completion settings, but the inspected b00293/b00358 images do not open that tab. Clipped work/SRC/strategy/lot labels and capacity headers are preserved as unknown; full source images or version-matched configuration records would resolve them.

## Continuation 5 source review

This batch adds 42 claims, 42 setting contracts and 68 visual descriptions covering 94 additional retained assets. The statements preserve source and deployment distinctions. No original source or previous authored record was changed.

### covetrus-migration-design-and-example-scope

The SDD proposes upgrading Covetrus from SCALE 2018 to Manhattan Active SCALE across existing distribution centers in phases. It expressly makes screenshots illustrative and configuration names suggested; later facilities may require different flows.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The plan and sign-off submission do not prove migration completion, installed release, deployed screen options or production acceptance. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00075, b00077, b00079, b00194, b00274, b00276](reading/sdd-c4c7e01f8ccad48a.md#b00075)

### covetrus-master-data-company-boundary

The design keeps inventory under separate companies, assigns company on interfaced receipts and shipments, and says items are not shared across companies. Additional companies would pass through a later change-management process.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Company names and location examples are design scope, not a current company or warehouse inventory. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00210, b00211, b00212, b00213, b00217](reading/sdd-c4c7e01f8ccad48a.md#b00210)

### covetrus-master-data-ownership-conflict

The assumptions say dimensions are maintained only in SCALE through diagnostics/manual Cubiscan import and cross-references are maintained directly rather than interfaced. The Item Master Download section nevertheless describes host-maintained conversion, weight and dimension data and lists cross-reference among download fields.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The document does not reconcile field ownership or overwrite rules. Do not derive an authoritative integration mapping from either paragraph alone. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00214, b00218, b00221, b00238, b00343, b00345, b00350, b00356, b00357, b00358, b00359, b00360, b00361](reading/sdd-c4c7e01f8ccad48a.md#b00214)

### covetrus-uom-structure-and-receiving-groups

Covetrus describes a single EA-IP-SB-CS-PL storage template, whole-number quantities, owner-supplied conversion quantities, and Group during check-in enabled for EA/IP/SB/CS. Pallet UOM has no separate cross-reference. The nearby four-level UOM picture is explicitly an example rather than this baseline.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The prose permits cross-references shared across items while describing item/UOM-specific identification; no globally unique barcode constraint is inferred. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00219, b00220, b00221, b00222, b00223, b00224, b00225, b00226, b00227, b00305, b00306](reading/sdd-c4c7e01f8ccad48a.md#b00219)

### covetrus-tracking-exclusions-and-placeholder-lots

The assumptions describe outbound-only serial tracking for selected items, no catch weight, no immediate-needs or cross-docking scope, and no inventory-attribute use. Some legacy lots use dummy expiration dates that are explicitly not used for FEFO; DSCSA workflows are excluded from this document even though extensions are named.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Named tracking restrictions and DSCSA references are not a full regulatory or extension contract. No current item flags, dates or compliance facts were inspected. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00228, b00229, b00230, b00231, b00232, b00233, b00250](reading/sdd-c4c7e01f8ccad48a.md#b00228)

### covetrus-inactive-item-interface-boundary

The source says the host does not send item-master delete messages and obsolete items are not marked inactive; Covetrus instead uses a consistent user-defined item field to identify obsolete or inactive items.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The field name, value vocabulary and downstream enforcement are not supplied, so no automatic exclusion or safe deletion rule is established. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00260, b00343](reading/sdd-c4c7e01f8ccad48a.md#b00260)

### covetrus-storage-and-location-override-design

The design uses mostly single-item locations, with named exception areas for mixed items, and license-plate tracking except in forward case/each pick locations. It maintains forward-pick capacity by item and location. Location UOM override is not intended for use; exceptional receiving uses a manual lowest-UOM procedure and any created overrides are removed manually.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. This is a documented intended arrangement, not permission to change location records or delete overrides in another deployment. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00239, b00240, b00241, b00242, b00243, b00244, b00248, b00261, b00262, b00266](reading/sdd-c4c7e01f8ccad48a.md#b00239)

### covetrus-location-verification-and-sequence-conflicts

The assumptions say location check digits and picking/putaway sequences are not used, with location-template fields determining order. Later replenishment prose requires check-digit confirmation, and shipping-work sections describe picking-sequence ordering.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The general assumptions and later workflow descriptions conflict. No effective location-verification or sorting behavior can be selected without the relevant configuration evidence. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00251, b00252, b00259, b01182, b01493, b01510](reading/sdd-c4c7e01f8ccad48a.md#b00251)

### covetrus-interface-transport-and-unfinalized-schedule

The design uses XML in both directions through Boomi between the host and SCALE, with API calls used to invoke downloads. Touchpoints may run manually or by scheduled job, but final schedules, frequencies and invocation mechanisms remain integration-test decisions; failure notifications are configurable.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Mentioned transport options are not evidence that every supported format or notification is enabled. No interface call or job was executed. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00323, b00325, b00327, b00329, b00331](reading/sdd-c4c7e01f8ccad48a.md#b00323)

### covetrus-host-receipts-without-purchase-order-module

Host purchase orders map one-to-many to SCALE receipts and arrive before goods, but purchase orders themselves are not maintained or interfaced as SCALE purchase-order records. The download contains header/detail information rather than receipt-container information, and receipt XML is staged for validation in SCALE storage.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. ASN receipt type includes lot and expiration information here; it does not establish receipt-container download. No storage endpoint or private message sample is published. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00236, b00369, b00373, b00375, b00376, b00377, b00378, b00379, b00380, b00381, b00382, b00383, b00384, b00385, b00386, b00480, b00483, b00493](reading/sdd-c4c7e01f8ccad48a.md#b00236)

### covetrus-receipt-creation-and-detailed-type-boundaries

The document distinguishes configured Receipt ID Types from the free-format Receipt Type value, which it says is not validated. Covetrus uses interfaced Vendor, Vendor Override, ASN, ASN override, RA and DRP receipt-ID types and excludes manual creation from purchase orders, Receipt Insight, shipments and blind receiving.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. This describes chosen receiving routes; it must not be presented as lack of general SCALE capability. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00249, b00394, b00398, b00500, b00502, b00504, b00506, b00512, b00517, b00520, b00524](reading/sdd-c4c7e01f8ccad48a.md#b00249)

### covetrus-host-shipment-update-cutoff-conflict

The interface section says host shipment updates and deletes can be processed until the shipment is waved. The later cancellation note limits host changes to In Pool and emphasizes that the host cannot cancel after release.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. These are not sufficient to establish an exact allowed transition window between wave membership and release. Preserve the distinction rather than assuming all unreleased waves remain host-editable. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00403, b00422, b00424, b01622](reading/sdd-c4c7e01f8ccad48a.md#b00403)

### covetrus-shipping-integration-assumption-conflicts

The initial assumptions name UPS, USPS and FedEx transportation services, while later parcel text says only FedEx is used. They also describe middleware holding partial upload data when a load-confirmation split occurs, whereas the loading design avoids shipment splits because of host restrictions.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. An exception-handling description does not make splitting the intended normal flow; a supported-service list does not prove active carrier integrations. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00255, b00257, b01258, b02040, b02057](reading/sdd-c4c7e01f8ccad48a.md#b00255)

### covetrus-receipt-upload-container-completion

The receipt-confirmation section describes upload after putaway at container level with a Closed threshold, and separately includes manually closed containers. The upload contains receipt header, detail and container information; the two named receipt-upload settings apply globally across receipt types.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. An upload threshold is not proof that a physical putaway happened, especially for a manually closed container. No host acknowledgement was observed. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00442, b00444, b00446](reading/sdd-c4c7e01f8ccad48a.md#b00442)

### covetrus-shipment-upload-versus-invoice-trigger

The normal shipment-confirmation upload is described after load confirmation and includes header, detail, comments and container information. A separate EX11 trigger sends shipment upload data at the last eligible container close so the host can generate an invoice; a diagnostics API to retrigger upload is described as a development enhancement.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The two triggers serve different described purposes. Duplicate handling, API completion and delivery acknowledgements are not supplied. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00451, b00453, b00455, b00459, b02202](reading/sdd-c4c7e01f8ccad48a.md#b00451)

### covetrus-inventory-upload-eligibility-is-not-universal

The interface section says inventory adjustments and status changes are eligible for host upload, while the adjustment-type section permits suppressing upload for a configured adjustment type. Item balance is described as nightly for initial go-live with a manual reconciliation procedure and possible later schedule changes.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Eligibility does not mean every adjustment is sent. Existing zero-item and receiving-dock exclusions remain part of the documented balance configuration; no reconciliation result is inferred. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00463, b00468, b00470, b00472, b00922](reading/sdd-c4c7e01f8ccad48a.md#b00463)

### covetrus-drp-receipt-correction-restriction

For a mismatch between physical DRP goods and downloaded receipt details, the design describes a documented manual header/detail correction, including lot correction, followed by external shipment/receipt discrepancy handling. It explicitly restricts that procedure to non-track-and-trace items.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. This source description is not authorization to alter real receipt data, substitute lots or bypass traceability controls. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00528, b00530](reading/sdd-c4c7e01f8ccad48a.md#b00528)

### covetrus-licensing-and-receiving-document-handoff

Before receiving paperwork is handed to clerks, Covetrus describes an internal supplier/product licensing check. A validated receipt produces a Receiving Worksheet, used as an aid and journal; the worksheet, packing slip and/or bill of lading form an accounting handoff package after receiving.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The internal licensing procedure and legal criteria are not provided or verified. This records the design handoff without claiming compliance or printing documents. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00548, b00552, b00562, b00564](reading/sdd-c4c7e01f8ccad48a.md#b00548)

### covetrus-external-appointments-versus-reference-workflow

Covetrus schedules inbound appointments outside SCALE and includes SCALE scheduling only as a future reference workflow. That reference requires an associated open receipt and describes trailer, dock and start/end times plus a calendar; outbound appointment scheduling is excluded from this implementation.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The availability of screenshots does not prove Covetrus adopted the reference workflow or that current product limitations match this dated design. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00572, b00575, b00577, b00582, b00584, b00585, b00586, b00587, b00589, b00591](reading/sdd-c4c7e01f8ccad48a.md#b00572)

### covetrus-unloading-pallet-and-metadata-controls

The described unloading flow matches delivery paperwork to a receipt before docking. Seal and truck identifiers are manually added to the receipt header because they are absent from the interface. Mixed pallets are separated into single-item pallets, and lot-tracked goods use single-item/single-lot pallets. Receivers decide whether to use putaway groups while unloading; flagging heavy items on worksheets is a recommendation.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Supplier-compliance checks remain an outside-SCALE, undefined scope item. A recommendation to flag heavy items is not an implemented rule. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00600, b00602, b00604, b00606, b00608, b00610](reading/sdd-c4c7e01f8ccad48a.md#b00600)

### covetrus-trailer-cardinality-conflict

The terminology table describes one receipt per inbound trailer, but the resolved-issues section explicitly answers that one inbound trailer can have multiple receipts.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The inconsistency is preserved. Do not derive a one-receipt uniqueness constraint from the terminology table. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00301, b02258, b02260](reading/sdd-c4c7e01f8ccad48a.md#b00301)

### covetrus-labor-request-processing-and-rollout

Labor Management is described as planned for initial go-live and absent from the previous implementation. A warehouse action generates a request that a continuously running Labor Management service converts into a detail record; the document lists activity/monitoring views and optional reporting components.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. No actual service, queue, timing, rollout completion or worker performance was observed. This source flow does not supply end-to-end process timing. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00270, b02090, b02092, b02097, b02099, b02127](reading/sdd-c4c7e01f8ccad48a.md#b00270)

### covetrus-labor-estimates-require-wave-step

Labor groups describe related users and quantities processed. A labor plan orders the groups for estimated wave labor, and the labor-plan execution step must be in the wave flow. Shipment labor-planning criteria associated with the group determine which shipments or lines contribute.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Estimated labor is separate from measured activity. No example rate or group membership is imported as an operating standard. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b02103, b02108, b02111](reading/sdd-c4c7e01f8ccad48a.md#b02103)

### covetrus-manual-indirect-labor-boundary

The design uses Manual Labor Entry for activities not automatically tracked and gives indirect work such as cleaning as examples. It says indirect labor cannot be tracked from RF, while direct labor includes application actions and physical warehouse tasks.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The listed work types are suggestions and the RF statement belongs to this dated design. No employee record or manual labor transaction was created. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b02097, b02115, b02116, b02117, b02118, b02119, b02120](reading/sdd-c4c7e01f8ccad48a.md#b02097)

### covetrus-conversion-plan-is-not-completion-evidence

The conversion note proposes a production restore into stage, recording subsequent configuration changes, and a one-time inventory-file load by the implementation team. It calls for a later detailed conversion plan covering phased deployment and DSCSA dependencies.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The stated inventory-accuracy assertion is not independently measured. This is historical design context, not a migration runbook or authorization to copy production data, restore a database or load inventory. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b02162, b02164, b02166](reading/sdd-c4c7e01f8ccad48a.md#b02162)

### covetrus-security-permission-scope

The security appendix describes user-level permissions applied when an employee opens a window, group permissions for processing/configuration checkpoints, and mass assignment of selected levels and actions across selected windows.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The text does not resolve conflicting user/group permissions, deny precedence or actual entitlements. No permissions were read from the application or changed. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b02379, b02381, b02383](reading/sdd-c4c7e01f8ccad48a.md#b02379)

### haddad-wave-step-prose-image-scope

HADDAD introduces creating a new wave step, but its adjacent image is an Edit existing Allocation step with identifier 20, API selected and System created checked. The earlier prose says shipped default wave steps cannot be changed and a non-override addition requires custom programming.

The image is evidence of an existing step definition, not a demonstrated new-step creation or authority to modify a system step. Its assembly/class/method values are examples, not deployed call evidence. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00485, b00486, b00488, b00490](reading/sdd-f46806ef53e15f07.md#b00485)

### haddad-wave-masters-manual-examples

The two HADDAD wave-master examples select Manual, priority 1 and a blank Wave maximums field. Auto release and Maintain allocated replenishments upon wave cancellation are unchecked. This agrees with the nearby choice not to define maximums, but does not establish automatic wave launch or replenishment retention.

Several criteria and flow identifiers are clipped. The pictures show saved examples, not a complete configuration export, scheduler or active deployment. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00499, b00505, b00506, b00507](reading/sdd-f46806ef53e15f07.md#b00499)

### haddad-vas-criteria-activity-distinction

The HADDAD VAS criteria list and activity list are different records. The criteria list includes SEEDING1015, while the activity row whose Instructions reads SEEDING1015 visibly selects ITEM1015 as Activity criteria. The activity list shows All containers for each visible row.

Names and instructions do not establish the predicate actually selected. The SEEDING activity name is clipped and its full identifier, intended mapping and execution are not inferred. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00509, b00510, b00511, b00512](reading/sdd-f46806ef53e15f07.md#b00509)

### haddad-cycle-all-filter-prose-image-conflict

HADDAD prose says its All cycle-count location filter selects all active locations across the warehouse. The All filter image instead shows only LOCATION.LOCATION_TEMPLATE equal to Stock / Prel, with no visible ACTIVE predicate.

The source accounts differ. No replacement predicate or assumption about other runtime filters is supplied; do not equate the filter name All with every active location. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00530, b00531, b00532, b00535, b00536, b00537](reading/sdd-f46806ef53e15f07.md#b00530)

### haddad-cycle-annual-date-prose-image-conflict

HADDAD describes CC LOCATION Annuel as selecting locations not counted in the last 360 days. Its screenshot visibly reads LOCATION.LAST_CYCLE_COUNT_DATE > Today + 360.

The displayed operator and plus sign are retained exactly. Intended date-expression semantics, null handling and a corrected rule require authoritative source/configuration evidence; the prose must not silently rewrite the image. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00533, b00538, b00541](reading/sdd-f46806ef53e15f07.md#b00533)

### haddad-cycle-annual-master-not-shown-active

Although the HADDAD narrative describes an annual schedule-based count plan, the pictured Inventaire Annuel master is Inactive and uses All for both item and location selection. It shows maximum counts 300, Randomize and Create work checked, and a checked scheduled-job option whose label is clipped.

The image does not select the separately shown CC LOCATION Annuel filter. No active annual schedule, job definition or executed count is established. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00544, b00545, b00550, b00551](reading/sdd-f46806ef53e15f07.md#b00544)

### haddad-cycle-threshold-key-pattern-gap

HADDAD threshold prose describes lookup by Location Type, Work Zone and Movement Class, then progressively fewer keys. Its inspected threshold rows instead leave Location type and Movement class blank and select individual picking Work zones, with quantity 0 UVC and zero days between counts.

The screenshot contains a work-zone-only key pattern whose exact matching behavior is not explained by that prose sequence. No fallback rule or zero-day runtime meaning is invented. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00553, b00554, b00555, b00556, b00557](reading/sdd-f46806ef53e15f07.md#b00553)

### haddad-work-order-examples-not-implementation-proof

HADDAD explicitly says its example environment had no work-order configuration and this section uses AIM help. The supplied illustrations nonetheless contain an example bill of materials and a default preference screenshot from another named warehouse context. They explain data relationships without proving a HADDAD work-order implementation.

Preserve the declared lack of implementation and mixed example context. The bill-of-material images and default preference are not effective HADDAD settings or a build/release procedure. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00564, b00565, b00568, b00569, b00571, b00572](reading/sdd-f46806ef53e15f07.md#b00564)

### haddad-work-order-bom-revision-and-movement

The HADDAD work-order explanation says components and assembly instructions can come from a bill of materials or be entered when creating an order. It allows component allocation at creation/release or manually, supports work for component and finished-item movement, and describes a new revision number when copying a bill of materials.

This is help-derived behavior summarized by the SCALE 2020 walkthrough, not a demonstrated configured warehouse flow or proof of a current release. Exact allocation triggers and revision-selection precedence are not established. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00564, b00565, b00568](reading/sdd-f46806ef53e15f07.md#b00564)

### haddad-replenishment-selection-role-by-demand

HADDAD distinguishes location criteria that evaluate capacity-based replenishment needs from location criteria that identify destinations for pool/wave demand. Item criteria narrow eligible items for demand-based replenishment; the master ties these criteria to the allocation rule and increment/rounding strategy.

These are documented responsibilities, not an execution trace. Exact numeric demand, capacity, conversion and rounding outcomes need the matching detailed contracts. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00580, b00585, b00586, b00587, b00590, b00599, b00600, b00602, b00604](reading/sdd-f46806ef53e15f07.md#b00580)

### haddad-replenishment-master-name-versus-destination

The inspected Reappro Rot A GRA PCB master uses Demand from wave, Automatic work creation and PCB increment, but its location criterion is Picking UVC. Its demand-UM tab selects PCB and UVC, and its strategy row is sequence 10, strategy 30, Round up to the next whole number increment.

A name containing PCB does not establish a PCB destination. Empty-location and item-criteria fields are clipped. No conversion quantity, prioritization direction or execution result is inferred. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00599, b00600, b00601, b00602, b00603, b00604, b00605](reading/sdd-f46806ef53e15f07.md#b00599)

### haddad-interface-process-presence-versus-active-detail

The HADDAD interface examples distinguish a configured process list from active process details. Receiving Direct Upload is visible at sequence 40 but Inactive is checked, while the inspected Item XML Download and Receiving XML Download examples leave Inactive unchecked.

Static flags establish only the pictured records. They do not establish a scheduled caller, enabled integration, endpoint access, successful transfer or current production state. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00674, b00675, b00676, b00683, b00685](reading/sdd-f46806ef53e15f07.md#b00674)

### haddad-carrier-transform-catalog-not-implementation

Under Carrier Interface, HADDAD shows a generic SCALE Transform catalog and explicitly says No xsl and No shipping interface upload criteria. The subsequent Interface process subsection has no populated text or image in the reviewed source nodes.

A generic transform catalog does not prove a carrier integration. Required carrier mapping, criteria and process evidence remain absent; no end-to-end implementation is inferred. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00694, b00695, b00696, b00697, b00698, b00699, b00700, b00701, b00702, b00703, b00704](reading/sdd-f46806ef53e15f07.md#b00694)

### haddad-printing-paperwork-versus-label-examples

HADDAD says its example needed no Shipment data selection and therefore no paperwork Document master. It separately provides a Label master that selects Print during wave, with label-master criteria, label-selection criteria and a label-classified Document type.

The absence of a paperwork master does not establish that labels are absent. The examples do not prove that any label-master record is bound to an active wave or successfully printed. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00712, b00714, b00715, b00728, b00729, b00730, b00731, b00732](reading/sdd-f46806ef53e15f07.md#b00712)

### haddad-label-two-filter-stages-differ

The inspected label-master criterion allows a nonnegative internal container number and a parenthesized order-type alternative OP or OPB. The separate label-selection criterion shown for the detail tests only OP. These are distinct filter stages; their conditions must not be collapsed into the same rule.

The screenshots show the predicates, not full evaluator/join semantics. Eligibility after all stages and treatment of OPB require the matching label-generation contract. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00728, b00729, b00730, b00732](reading/sdd-f46806ef53e15f07.md#b00728)

### haddad-document-renderer-example-differs-from-ssrs-prose

HADDAD explains how a custom Reporting Services document would be associated with its template, but the adjacent Generic Ship Label example selects SCALE label and a .lbl template. The SSRS prose and label screenshot illustrate different output mechanisms.

Do not treat the label example as a verified SSRS configuration. Source server addresses were not contacted or transferred into this derived guidance. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00722, b00723, b00724, b00725, b00726](reading/sdd-f46806ef53e15f07.md#b00722)

### Retained asset descriptions

#### Generic vendor-label example

The example separates sender, recipient, carrier/pro/bill-of-lading references, postal barcode, purchase-order space, pallet sequence, item/quantity and serial shipping-container barcode. Some reference areas are empty. Its purpose is container and shipment identification in the vendor-label training context.

Limit: Individually inspected retained training image. Mixed-era label examples do not establish installed configuration, valid executable code, physical print quality, barcode scanning or current customer/carrier acceptance. Sample contact, address, order, item and license-plate values are omitted.

[sdd-56008a31665dcc23 s009-sh003, s009-sh004, s009-sh005](reading/sdd-56008a31665dcc23.md#s009-sh003)

Assets: [9921937dc88263824a7c41ee8e5b2eab650ac4a15e7af53b0186394e8783e703.jpeg](assets/sdd-56008a31665dcc23/9921937dc88263824a7c41ee8e5b2eab650ac4a15e7af53b0186394e8783e703.jpeg)

#### Loose-container detail SQL illustration

The visible SELECT returns order-line number, item description, internal container number, item, quantity and original pick location. It joins shipping-container rows to shipment detail through the internal shipment-line key and limits rows by the container parent argument. The image is a query illustration under a Shipment Detail slide heading.

Limit: Individually inspected retained training image. Mixed-era label examples do not establish installed configuration, valid executable code, physical print quality, barcode scanning or current customer/carrier acceptance. Sample contact, address, order, item and license-plate values are omitted. No full installed routine identity, duplicate behavior, transaction contract or execution result is established from this screenshot.

[sdd-56008a31665dcc23 s015-sh003, s015-sh004, s015-sh005](reading/sdd-56008a31665dcc23.md#s015-sh003)

Assets: [54faefcdf007c6f96c822215bb2924eb546d983a5bfb28e159acc0e119c82ed8.png](assets/sdd-56008a31665dcc23/54faefcdf007c6f96c822215bb2924eb546d983a5bfb28e159acc0e119c82ed8.png)

#### Container-contents header procedure excerpt

The crop begins a named container-contents header procedure with an internal-container numeric argument, followed by a SELECT list of shipment, purchase order, container identification/type/counts/location/tracking and user-defined fields. The bottom ends at the shipping-container FROM line.

Limit: Individually inspected retained training image. Mixed-era label examples do not establish installed configuration, valid executable code, physical print quality, barcode scanning or current customer/carrier acceptance. Sample contact, address, order, item and license-plate values are omitted. Joins and predicates below the crop are unavailable; do not invent them or treat this as a complete routine contract. The slide prose calls this shipment header while its title and procedure name identify container contents.

[sdd-56008a31665dcc23 s016-sh003, s016-sh004, s016-sh005](reading/sdd-56008a31665dcc23.md#s016-sh003)

Assets: [59bf45a554a971108daffebdd5b826bbacdb56045fe7075f0ee29dc464e0153a.png](assets/sdd-56008a31665dcc23/59bf45a554a971108daffebdd5b826bbacdb56045fe7075f0ee29dc464e0153a.png)

#### Template file and editor-menu illustrations

Two historical File Explorer images show the ILS 2021 Printing directory with label-template files and Print Data, Print Input and WaveLabels folders. The second has a copied template selected. Both show a context-menu option to edit in Notepad++; surrounding slide text describes copying and renaming a template before replacing its contents.

Limit: Individually inspected retained training image. Mixed-era label examples do not establish installed configuration, valid executable code, physical print quality, barcode scanning or current customer/carrier acceptance. Sample contact, address, order, item and license-plate values are omitted. This describes training screenshots, not a current filesystem inspection or an instruction to replace an installed template.

[sdd-56008a31665dcc23 s018-sh003, s018-sh004, s018-sh005, s019-sh003, s019-sh004, s019-sh005](reading/sdd-56008a31665dcc23.md#s018-sh003)

Assets: [48e51b2400d2e8d79edeaeba6281dd116aa0b5884c2118c203d41157acf005d1.png](assets/sdd-56008a31665dcc23/48e51b2400d2e8d79edeaeba6281dd116aa0b5884c2118c203d41157acf005d1.png); [6af9e526385796e6da4fcc836323025a47ba445457e8d19feec77d356b1c9fe2.png](assets/sdd-56008a31665dcc23/6af9e526385796e6da4fcc836323025a47ba445457e8d19feec77d356b1c9fe2.png)

#### Highlight and pointer overlays

Five small standalone media assets are annotation marks: three yellow highlighter strokes and two tiny red pointers. They occur on the template-file and command-example slides. They contain no readable setting names, workflow steps or configuration values.

Limit: Individually inspected retained training image. Mixed-era label examples do not establish installed configuration, valid executable code, physical print quality, barcode scanning or current customer/carrier acceptance. Sample contact, address, order, item and license-plate values are omitted. These are decorative annotation assets. Their inclusion improves asset accounting and supplies no additional operational behavior or configuration contract.

[sdd-56008a31665dcc23 s018-sh006, s018-sh007, s019-sh006, s022-sh006](reading/sdd-56008a31665dcc23.md#s018-sh006)

Assets: [0258c10b729c9dbba5aa2d25ee7f46f1ae06052658f73a02f882793c89f19c68.png](assets/sdd-56008a31665dcc23/0258c10b729c9dbba5aa2d25ee7f46f1ae06052658f73a02f882793c89f19c68.png); [16ae988bdb3754bb95738a353e3069483b28a1640f8a5a5e3d06795f0918918e.png](assets/sdd-56008a31665dcc23/16ae988bdb3754bb95738a353e3069483b28a1640f8a5a5e3d06795f0918918e.png); [24d0455c5d267e9b5ba390e89ffb9b5ef2cac21fec183c4653acca6de3c17525.png](assets/sdd-56008a31665dcc23/24d0455c5d267e9b5ba390e89ffb9b5ef2cac21fec183c4653acca6de3c17525.png); [61202f481231b9789a4eea6f356197063b7598c5fe6b943d3602f1cb02579f5d.png](assets/sdd-56008a31665dcc23/61202f481231b9789a4eea6f356197063b7598c5fe6b943d3602f1cb02579f5d.png); [d2969ea5454a2d11977692b3c192097b16ba3d545955cf3774a0bf1f2385f0c4.png](assets/sdd-56008a31665dcc23/d2969ea5454a2d11977692b3c192097b16ba3d545955cf3774a0bf1f2385f0c4.png)

#### Label command and substitution excerpt

The tall source image mixes label-format commands with substitutions for sender/recipient fields, carrier references, postal barcode, purchase order, pallet sequence, item/quantity and serial container identification. The right edge cuts off several SQL expressions. The neighboring text lists command categories such as field origin, field data, font, barcode and graphic box.

Limit: Individually inspected retained training image. Mixed-era label examples do not establish installed configuration, valid executable code, physical print quality, barcode scanning or current customer/carrier acceptance. Sample contact, address, order, item and license-plate values are omitted. The command list and cropped code are not a validated printer-language reference. Embedded substitutions are not evidence that a printer itself accesses the database.

[sdd-56008a31665dcc23 s022-sh003, s022-sh004, s022-sh005](reading/sdd-56008a31665dcc23.md#s022-sh003)

Assets: [43cf4f34d4dcb7b27f8a585ba4f099f20214c75d40c421ba99b6c2cbd2f175f0.png](assets/sdd-56008a31665dcc23/43cf4f34d4dcb7b27f8a585ba4f099f20214c75d40c421ba99b6c2cbd2f175f0.png)

#### Photographed receipt-label text wrapping

Two printed receipt-container labels are photographed beside a keyboard. Each has a license-plate barcode, destination location, receipt reference/date, item description and quantity. One item description occupies two lines. The neighboring slide shows an example field-block command for wrapping item-description text.

Limit: Individually inspected retained training image. Mixed-era label examples do not establish installed configuration, valid executable code, physical print quality, barcode scanning or current customer/carrier acceptance. Sample contact, address, order, item and license-plate values are omitted. The photograph does not prove the exact command produced either label, physical dimensions, readable scans or a universal print trigger; handwritten sample notes are not workflow authority.

[sdd-56008a31665dcc23 s023-sh003, s023-sh004, s023-sh005](reading/sdd-56008a31665dcc23.md#s023-sh003)

Assets: [b16d2b92e95e2af199f2238ee4eb6c94299d06ef72d08d5a590a1384ae92941c.png](assets/sdd-56008a31665dcc23/b16d2b92e95e2af199f2238ee4eb6c94299d06ef72d08d5a590a1384ae92941c.png)

#### Font-size code comparison

The two code crops highlight changed font-command dimensions for the sender block and show associated field-origin adjustments. They illustrate the requested enlargement of ship-from information in the customer example.

Limit: Individually inspected retained training image. Mixed-era label examples do not establish installed configuration, valid executable code, physical print quality, barcode scanning or current customer/carrier acceptance. Sample contact, address, order, item and license-plate values are omitted. No font dimensions are promoted to deployment defaults, and clipped expressions do not define complete label data selection.

[sdd-56008a31665dcc23 s025-sh004, s026-sh003, s026-sh004, s026-sh005](reading/sdd-56008a31665dcc23.md#s025-sh004)

Assets: [b87a2c20e3087e75c4e2fd9c754ac87e75600737f09e71ce0f7c05fe7557c434.png](assets/sdd-56008a31665dcc23/b87a2c20e3087e75c4e2fd9c754ac87e75600737f09e71ce0f7c05fe7557c434.png); [e5acf08eb1281f93b17c8dd77612f78262bf4d719cf52d68e82f6c8c3a2ef33c.png](assets/sdd-56008a31665dcc23/e5acf08eb1281f93b17c8dd77612f78262bf4d719cf52d68e82f6c8c3a2ef33c.png)

#### Postal-barcode position comparison

Two short code crops retain the same postal-code substitution and barcode structure while changing the field-origin horizontal value from 11 to 70. Surrounding box commands also differ. The slide describes the intended result as centering the postal barcode.

Limit: Individually inspected retained training image. Mixed-era label examples do not establish installed configuration, valid executable code, physical print quality, barcode scanning or current customer/carrier acceptance. Sample contact, address, order, item and license-plate values are omitted. Intent and visible code changes do not independently prove geometric centering for an arbitrary label size or successful scanning.

[sdd-56008a31665dcc23 s025-sh004, s027-sh003, s027-sh004, s027-sh005](reading/sdd-56008a31665dcc23.md#s025-sh004)

Assets: [3851aa9b23cd937181ad49a313d3316be20e86b943f2d6e615175aecdb3f26d4.png](assets/sdd-56008a31665dcc23/3851aa9b23cd937181ad49a313d3316be20e86b943f2d6e615175aecdb3f26d4.png); [ce3594eb687bc58ac97156960aa204c106e3376fc98533fba74962a621fdbcc2.png](assets/sdd-56008a31665dcc23/ce3594eb687bc58ac97156960aa204c106e3376fc98533fba74962a621fdbcc2.png)

#### Customer-item field addition

The first template crop highlights the SKU caption and shipment-detail item substitution. The second short excerpt adds a Customer Item caption and a customer-item substitution below that SKU line. The source example requests this added field beneath SKU.

Limit: Individually inspected retained training image. Mixed-era label examples do not establish installed configuration, valid executable code, physical print quality, barcode scanning or current customer/carrier acceptance. Sample contact, address, order, item and license-plate values are omitted. The visible data-field names do not establish their current values or the complete query that supplies them.

[sdd-56008a31665dcc23 s025-sh004, s028-sh003, s028-sh004, s028-sh005](reading/sdd-56008a31665dcc23.md#s025-sh004)

Assets: [6efb7663ea53e8c878a7d373c7dcca4ccf8386d1ac4618b47f0aaf133cffacbe.png](assets/sdd-56008a31665dcc23/6efb7663ea53e8c878a7d373c7dcca4ccf8386d1ac4618b47f0aaf133cffacbe.png); [fb1794167d563637237033a0835bdb8d0c424930e4674f711d64cbbb0fde3747.png](assets/sdd-56008a31665dcc23/fb1794167d563637237033a0835bdb8d0c424930e4674f711d64cbbb0fde3747.png)

#### Single-item and mixed-pallet illustrations

The paired vendor-label images keep the same general layout. One displays an item identifier beside SKU; the other displays MIXED PALLET. Both include quantity, pallet sequence, destination/postal and serial shipping-container barcode areas.

Limit: Individually inspected retained training image. Mixed-era label examples do not establish installed configuration, valid executable code, physical print quality, barcode scanning or current customer/carrier acceptance. Sample contact, address, order, item and license-plate values are omitted. The preceding SQL examples end with an incomplete predicate. The two images do not supply that missing condition or prove the exact query generated the labels.

[sdd-56008a31665dcc23 s030-sh003, s030-sh004, s031-sh003, s031-sh004, s031-sh005](reading/sdd-56008a31665dcc23.md#s030-sh003)

Assets: [9b56e9a77e28c976e3a87b214baaad5bbbad4fc081a30cc984ad4c6d0171210d.png](assets/sdd-56008a31665dcc23/9b56e9a77e28c976e3a87b214baaad5bbbad4fc081a30cc984ad4c6d0171210d.png); [a5bce6596df49a096b3470be5c0980ca58ca2fd9ccd86bbbb9111f3b5c7199ff.png](assets/sdd-56008a31665dcc23/a5bce6596df49a096b3470be5c0980ca58ca2fd9ccd86bbbb9111f3b5c7199ff.png)

#### Break-label procedure comparison

The side-by-side SQL images compare a generic break-label procedure with a customer-specific variant. The variant visibly adds container type, launch number and a count expression restricted by matching container type and launch. Both visible outer queries select a container using the internal-container argument and join its shipment.

Limit: Individually inspected retained training image. Mixed-era label examples do not establish installed configuration, valid executable code, physical print quality, barcode scanning or current customer/carrier acceptance. Sample contact, address, order, item and license-plate values are omitted. The image is a design illustration, not an installed definition or execution test. No copied procedure is created or altered by this review.

[sdd-56008a31665dcc23 s035-sh003, s035-sh004](reading/sdd-56008a31665dcc23.md#s035-sh003)

Assets: [6643f1167bc91ff6b526dbca66673a14cce7baa84a42af0ccc3d958851d58e9f.png](assets/sdd-56008a31665dcc23/6643f1167bc91ff6b526dbca66673a14cce7baa84a42af0ccc3d958851d58e9f.png)

#### Container-contents barcode template

The template image binds Header and Detail aliases to named container-content procedures, defines header/row/footer sections, and highlights a barcode using the header container identifier. Rows reference order line, item, description, original pick location and quantity. The barcode addition matches the already described cart-contents output example.

Limit: Individually inspected retained training image. Mixed-era label examples do not establish installed configuration, valid executable code, physical print quality, barcode scanning or current customer/carrier acceptance. Sample contact, address, order, item and license-plate values are omitted. No complete generator/runtime contract or physical output is established by inspecting the template screenshot.

[sdd-56008a31665dcc23 s038-sh003, s038-sh004](reading/sdd-56008a31665dcc23.md#s038-sh003)

Assets: [d527282849af1d086c725c0d1fe16ff70d1c09bf3cfa62e3fd44f34a1fd668b8.png](assets/sdd-56008a31665dcc23/d527282849af1d086c725c0d1fe16ff70d1c09bf3cfa62e3fd44f34a1fd668b8.png)

#### Unit, inner, case and pallet illustration

The diagram nests small units inside an inner package, inner packages inside a case and several cases above a pallet base. Labels identify Unit, Inners, Case and Pallet. It illustrates containment only; the surrounding text explicitly says this four-level picture is not the baseline UOM definition.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified.

[sdd-c4c7e01f8ccad48a b00305, b00306, b00307](reading/sdd-c4c7e01f8ccad48a.md#b00305)

Assets: [7c4eb54466fea529751986aa62d129200ffb6c0b384431cb1b45e7d1e6a52a36.png](assets/sdd-c4c7e01f8ccad48a/7c4eb54466fea529751986aa62d129200ffb6c0b384431cb1b45e7d1e6a52a36.png)

#### Host, middleware and diagnostics download paths

Arrows run from System 21 through Boomi to SCALE and label Items, Receipts and Shipments on both connections. A separate Diagnostics App points directly toward SCALE with Item Master, ILA, ILC and CC Thresholds labels. The image identifies intended information paths, not timings or a verified live integration.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Abbreviations are retained as pictured; detailed field mappings are not supplied by the image.

[sdd-c4c7e01f8ccad48a b00327, b00329, b00339, b00340](reading/sdd-c4c7e01f8ccad48a.md#b00327)

Assets: [21612e8d81bf4c28b103ffaf865f2c58e7b112d3c8fb991a53e297202f1e6f28.png](assets/sdd-c4c7e01f8ccad48a/21612e8d81bf4c28b103ffaf865f2c58e7b112d3c8fb991a53e297202f1e6f28.png)

#### SCALE confirmation and balance upload path

The diagram directs information from SCALE through Boomi to System 21. Both arrows list Receipt Confirmation, Shipment Confirmation, Inventory Transactions and Item Balance, illustrating the middleware handoff for those four message categories.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified.

[sdd-c4c7e01f8ccad48a b00327, b00436, b00437, b00442, b00453, b00463, b00468](reading/sdd-c4c7e01f8ccad48a.md#b00327)

Assets: [9d4bff72d59cc3c1985d8935f6dd33ddd82b51387406de91172e089265f29eb1.png](assets/sdd-c4c7e01f8ccad48a/9d4bff72d59cc3c1985d8935f6dd33ddd82b51387406de91172e089265f29eb1.png)

#### Receipt summary and receipt-line fields

The Receipt insight image shows receipt-level rows with type, company, trailer, date, leading status and trailing status, plus summary tiles. The Receipt line image shows item/company, lot-control and expiration fields and total, open and original quantities with UOM. The images illustrate different levels of detail; example identifiers, dates and quantities are not imported as operational facts.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. The line picture is an edit-style Receipt line form, while its caption calls it Receipt Line Insight; no exact navigation equivalence is assumed.

[sdd-c4c7e01f8ccad48a b00534, b00537, b00538, b00540, b00541](reading/sdd-c4c7e01f8ccad48a.md#b00534)

Assets: [97f0f0faddb2a7d5e42d7d03565160dcfc03d531a638542b348c98b05f4e9390.png](assets/sdd-c4c7e01f8ccad48a/97f0f0faddb2a7d5e42d7d03565160dcfc03d531a638542b348c98b05f4e9390.png); [dda62b5108824df7c1b7dc5042ca22aabe06e6a4f69d23ae8cfa98dbb4eac693.png](assets/sdd-c4c7e01f8ccad48a/dda62b5108824df7c1b7dc5042ca22aabe06e6a4f69d23ae8cfa98dbb4eac693.png)

#### Receipt-container filters and result rows

Receipt container insight pairs filters such as license plate, receipt, item, company, warehouse and group with container result columns for status, item, quantity, UOM and receipt ID. A Show closed control is visible. This separates container-level investigation from receipt-header and receipt-line views.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. The image is illustrative, including its populated filters and rows.

[sdd-c4c7e01f8ccad48a b00534, b00543, b00544](reading/sdd-c4c7e01f8ccad48a.md#b00534)

Assets: [1d91e08ba9601b8e019a6a7848b80a18c1b3af7e340352c4903ac721f4142883.png](assets/sdd-c4c7e01f8ccad48a/1d91e08ba9601b8e019a6a7848b80a18c1b3af7e340352c4903ac721f4142883.png)

#### Receiving-document action and worksheet layout

One screenshot highlights Print selected docs in a Receipt insight Actions menu. The worksheet image has receipt/ERP-order/date headings, warehouse/source sections, a received total and repeated line blocks with item, description, total/open quantities, barcode and dimensional information. It illustrates a paper receiving aid and journal rather than a completed receiving or licensing check.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Displayed addresses, sample product values and identifiers are intentionally not transcribed.

[sdd-c4c7e01f8ccad48a b00548, b00552, b00555, b00556, b00559, b00560, b00564](reading/sdd-c4c7e01f8ccad48a.md#b00548)

Assets: [6784fd69ddf1e8690d683707fb209efb2d4cab325126474078e29e853cee011c.png](assets/sdd-c4c7e01f8ccad48a/6784fd69ddf1e8690d683707fb209efb2d4cab325126474078e29e853cee011c.png); [8f586455f648d7d143f744f3c202088e3283629f0dcb6b1ee2fe52b1ccf1cfcc.png](assets/sdd-c4c7e01f8ccad48a/8f586455f648d7d143f744f3c202088e3283629f0dcb6b1ee2fe52b1ccf1cfcc.png)

#### Reference inbound appointment form and calendar

The scheduling form shows a linked receipt, trailer, start/end dates and times, receiving dock and carrier. The calendar arranges dock doors in rows and hours across columns with appointment blocks. These images explain the optional reference workflow, while the text says Covetrus continues scheduling outside SCALE.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified.

[sdd-c4c7e01f8ccad48a b00572, b00575, b00577, b00579, b00580, b00582, b00589, b00591, b00593, b00594](reading/sdd-c4c7e01f8ccad48a.md#b00572)

Assets: [5f82f1216fa47fc239e66b6b18bb64fab51d6dfcdc5aaeee0a5d31622af2ad2b.png](assets/sdd-c4c7e01f8ccad48a/5f82f1216fa47fc239e66b6b18bb64fab51d6dfcdc5aaeee0a5d31622af2ad2b.png); [d757b33db9c8b15890bc680125c0e3f130fdd8ee34e50f5524f4848e0abf7999.png](assets/sdd-c4c7e01f8ccad48a/d757b33db9c8b15890bc680125c0e3f130fdd8ee34e50f5524f4848e0abf7999.png)

#### Labor-group estimation inputs

The Labor Group window displays an Estimation tab with estimated time per transaction, a choice between Unit of Measure and Quantity, and selectable quantity UOMs. Resource, Planning and Monitoring and User Defined Data tabs are also visible. The sample numeric rate is not a recommended or observed production rate.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified.

[sdd-c4c7e01f8ccad48a b02103, b02104, b02105](reading/sdd-c4c7e01f8ccad48a.md#b02103)

Assets: [8a2615a99623cdd288784f419afe0c2f560e5471d836d84c2baf489df96f5327.png](assets/sdd-c4c7e01f8ccad48a/8a2615a99623cdd288784f419afe0c2f560e5471d836d84c2baf489df96f5327.png)

#### Labor-plan group order and shipment criteria

The Labor Plan example lists a sequence number and labor group under Detail Records with an Inactive checkbox. The Shipment Labor Planning Criteria example selects Shipment Detail and exposes attribute/operator/value controls and a rule list. Together they illustrate ordered group calculation and criteria-based selection, without establishing the deployed filters.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified.

[sdd-c4c7e01f8ccad48a b02108, b02109, b02110, b02111, b02112, b02113](reading/sdd-c4c7e01f8ccad48a.md#b02108)

Assets: [0fab69f0b063c61be8aff276732a80a9293e38d87fcc48b9508077c28767ffc9.png](assets/sdd-c4c7e01f8ccad48a/0fab69f0b063c61be8aff276732a80a9293e38d87fcc48b9508077c28767ffc9.png); [aa8c29048ea025791825926bc3aaeedf51177e02c702b3d1e9fb5b532ca0177c.png](assets/sdd-c4c7e01f8ccad48a/aa8c29048ea025791825926bc3aaeedf51177e02c702b3d1e9fb5b532ca0177c.png)

#### Manual labor entry activity selection

The form has user, activity type and transaction-count fields, with time-tracking and user-defined sections. Its open activity list includes examples such as box building, cleaning, shipping, projects and training; Start is highlighted and Stop appears inactive. The static view does not demonstrate that a labor record was started.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. No displayed user name or sample transaction value is transcribed.

[sdd-c4c7e01f8ccad48a b02097, b02116, b02122, b02123](reading/sdd-c4c7e01f8ccad48a.md#b02097)

Assets: [79afda37a5ea52f6f8108908419a2bc294aae46886e9dffdb4644b6c6c280b6d.png](assets/sdd-c4c7e01f8ccad48a/79afda37a5ea52f6f8108908419a2bc294aae46886e9dffdb4644b6c6c280b6d.png)

#### Labor activity measures and event detail

Labor activity insight displays summary tiles for users, total quantity, total time and average rate. The grid includes activity type, start/end times, actual time, rate per minute, user and activity screen. Visible sign-on and screen-entry/exit examples show that listed events need interpretation; a row alone is not a warehouse productivity measurement.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Displayed employee identities, dates and activity values are not copied as assessed telemetry.

[sdd-c4c7e01f8ccad48a b02097, b02099, b02127, b02129, b02130](reading/sdd-c4c7e01f8ccad48a.md#b02097)

Assets: [0bdd83c69d158706b506fa86b29fb36e79287779240926e8cde2b2efed1f9dfa.png](assets/sdd-c4c7e01f8ccad48a/0bdd83c69d158706b506fa86b29fb36e79287779240926e8cde2b2efed1f9dfa.png)

#### Security permission function and group panels

The screenshot presents a search field and function/configuration list with lock symbols, then a Security for Desktop panel with Security level, User/security group and System created columns. That lower panel is empty in the example, so the image does not establish any granted or denied permission.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified.

[sdd-c4c7e01f8ccad48a b02379, b02381, b02383, b02385, b02386](reading/sdd-c4c7e01f8ccad48a.md#b02379)

Assets: [1c9779b828e3230319272405b22299022fca047a0e027351ef239f1c9a3183ac.png](assets/sdd-c4c7e01f8ccad48a/1c9779b828e3230319272405b22299022fca047a0e027351ef239f1c9a3183ac.png)

#### Cover background and company mark

The first retained image is a white background with broad red diagonal bands and no functional instructions. The second is the Covetrus wordmark with a geometric colored mark. These are decorative or identity assets, supplying no receiving, configuration or process behavior.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Decorative/identity review is counted separately from substantive process images in the private inventory.

[sdd-c4c7e01f8ccad48a b00001, b00009, b00010](reading/sdd-c4c7e01f8ccad48a.md#b00001)

Assets: [89e1814fab81b531265a914e97c8eb30e7668d66e812513f21b17e4f55010d8d.jpg](assets/sdd-c4c7e01f8ccad48a/89e1814fab81b531265a914e97c8eb30e7668d66e812513f21b17e4f55010d8d.jpg); [b4215320cab83194ba548da52225ca715e802b43518063b14684340fe01ba3e9.jpg](assets/sdd-c4c7e01f8ccad48a/b4215320cab83194ba548da52225ca715e802b43518063b14684340fe01ba3e9.jpg)

#### Container-type grid in the wave section

The grid shows C5, FAC, PAL and PCB active with Use as default No. Displayed dimensions include C5 60/40/40, FAC60/50/50, PAL120/80/180 and PCB999/999/999 cm, although trailing decimal digits are clipped. It repeats the container-type subject from the later container-creation section using a distinct image composition; no empty-weight field is visible.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00474, b00475](reading/sdd-f46806ef53e15f07.md#b00474)

Assets: [3ea4155fe1943b366be17441f6cc3d6e06078089587c466e32bc5ec49bb8dbc3.png](assets/sdd-f46806ef53e15f07/3ea4155fe1943b366be17441f6cc3d6e06078089587c466e32bc5ec49bb8dbc3.png)

#### Override wave-step example

Consol Shipments Stats shows priority 1, Custom SQL checked and Inactive unchecked. Its statement invokes a named procedure with a launch-number placeholder. The retained source contains the exact statement; this description neither reproduces nor executes it. The wave-step dropdown text is clipped.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00478, b00479, b00480, b00482](reading/sdd-f46806ef53e15f07.md#b00478)

Assets: [51969d41fb9b8391aeff10bba816439316c72b588ab4e80cc96da548ee6bf608.png](assets/sdd-f46806ef53e15f07/51969d41fb9b8391aeff10bba816439316c72b588ab4e80cc96da548ee6bf608.png)

#### Existing Allocation wave-step API definition

The Edit existing dialog shows identifier 20, description Allocation, API selected, assembly WMW.Jsharp.Inventory.BL, namespace com.pronto.bl.inv, class Allocation and method allocateShipmentsFromLaunch. System created is checked and Inactive unchecked. The record-type field is clipped; this is not a new-step creation screenshot.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00485, b00486, b00488, b00490](reading/sdd-f46806ef53e15f07.md#b00485)

Assets: [133491f29f16f5091c082088b9f9647e6de29dcf3ff9777d2bf804c482044f93.png](assets/sdd-f46806ef53e15f07/133491f29f16f5091c082088b9f9647e6de29dcf3ff9777d2bf804c482044f93.png)

#### Wave flow across three scroll positions

Three pictures of Prélèvement Standard show overlapping ordered rows. Readable labels include Start Wave 10, Replenishment 60, Rule Assignment 80, Allocation 90, Container Creation 120, VAS Assignment 190 and Complete Wave 280. Rows 20, 25, 40, 150, 205 and 210 have clipped captions; other rows are partially outside the viewport. Inactive is unchecked. No complete flow or missing step labels are reconstructed.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00492, b00493, b00494, b00495](reading/sdd-f46806ef53e15f07.md#b00492)

Assets: [a5420e1bb733f42ed70735eedf30250a3901ebee7f9c6a3c2a6cf6d9aac562ae.png](assets/sdd-f46806ef53e15f07/a5420e1bb733f42ed70735eedf30250a3901ebee7f9c6a3c2a6cf6d9aac562ae.png); [510ef293c4230aad10c48f98064d72200e9909711af28b5e0cd384f934081696.png](assets/sdd-f46806ef53e15f07/510ef293c4230aad10c48f98064d72200e9909711af28b5e0cd384f934081696.png); [858d516ba638f46475ef65599004b55ca9b674d8e004e369417a1f397b256d55.png](assets/sdd-f46806ef53e15f07/858d516ba638f46475ef65599004b55ca9b674d8e004e369417a1f397b256d55.png)

#### Wave criterion with partial first condition

Commandes sans Booking uses LNCH CRIT and Shipment detail. The first visible condition starts Shipment_Header_View.INTERNAL_SHIPMENT_NUM IS NOT NUL and is clipped at the edge. The second fully visible condition is AND Shipment_Header_View.USER_DEF2 IS NULL. Inactive and System created are unchecked.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00501, b00502, b00503](reading/sdd-f46806ef53e15f07.md#b00501)

Assets: [fc1270e039c41b6138f8a7fdb2e648b39bede1814abd374ae438393fb8335a25.png](assets/sdd-f46806ef53e15f07/fc1270e039c41b6138f8a7fdb2e648b39bede1814abd374ae438393fb8335a25.png)

#### Manual picking and replenishment wave masters

Vague de PREL Standard and Vague de REAPPRO Standard both select Manual, priority 1 and blank Wave maximums. Auto release and Maintain allocated replenishments upon wave cancellation are unchecked. Inactive is unchecked. Criteria and flow fields are clipped; the other tabs are not opened.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00499, b00505, b00506, b00507](reading/sdd-f46806ef53e15f07.md#b00499)

Assets: [25b6f437d9f1aa84d7842e5a9075c1e9b5e1df9b8665c4d5147a891079d06a2b.png](assets/sdd-f46806ef53e15f07/25b6f437d9f1aa84d7842e5a9075c1e9b5e1df9b8665c4d5147a891079d06a2b.png); [dcfeeffa0efdec1a31b1803182c690f26f4d0c047e4b3b362ad01526875a0279.png](assets/sdd-f46806ef53e15f07/dcfeeffa0efdec1a31b1803182c690f26f4d0c047e4b3b362ad01526875a0279.png)

#### VAS criterion availability examples

COLIS1015, ITEM1015 and SEEDING1015 are active. Rows 1015, Seeding, VAS TEST and VAS TEST COMMANDE are inactive. All visible rows show System created No. No predicate editor is open, so the names alone do not establish eligibility.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00509, b00510](reading/sdd-f46806ef53e15f07.md#b00509)

Assets: [e79dbd40a65c61a3b86bdbd5e2d61ce1fb63e274fb914952f6786e4c9d9f4a36.png](assets/sdd-f46806ef53e15f07/e79dbd40a65c61a3b86bdbd5e2d61ce1fb63e274fb914952f6786e4c9d9f4a36.png)

#### VAS activity fields and differing criteria

Every visible activity row shows application level All containers. COLIS1015 maps to criterion COLIS1015; ITEM1015 maps to ITEM1015. A clipped SEEDING activity name also uses ITEM1015 while its Instructions says SEEDING1015. Rows 1015 and VAS TEST have blank criteria and their own instructions. Execution and the intended SEEDING mapping remain unestablished.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00511, b00512](reading/sdd-f46806ef53e15f07.md#b00511)

Assets: [5ca66b9570b3a947f1e4c3a94831db938579c167ea3039de7e978b83b51cac5f.png](assets/sdd-f46806ef53e15f07/5ca66b9570b3a947f1e4c3a94831db938579c167ea3039de7e978b83b51cac5f.png)

#### Cycle-count configuration relationships

Item connects to Cycle Count Item Criteria, and Location & Zone to Cycle Count Location Criteria; both criteria connect to Cycle Count Master. Cycle Count Work Criteria and Work Type point to Work; Work Type also points to Work Special Handling. Preferences, Custom Views, Threshold and System Values appear as separate boxes without connecting arrows. These are diagram relationships, not database foreign keys or a complete execution order.

Limit: Original EMF decoded with Windows System.Drawing to a private PNG at 2x intrinsic size, then individually viewed; tool display resized 2178x948 to 2048x891. Static relationship review only, no DOCX layout or live behavior.

[sdd-f46806ef53e15f07 b00516](reading/sdd-f46806ef53e15f07.md#b00516)

Assets: [fe855ca12b6d8693b2b6df2fe4430b3ffc047eb7fcd49167b3c9d26605f964b0.emf](assets/sdd-f46806ef53e15f07/fe855ca12b6d8693b2b6df2fe4430b3ffc047eb7fcd49167b3c9d26605f964b0.emf)

#### Cycle-count system-value examples

The grid sets all four activity/planned positive/negative adjustment entries to Ajustement; Auto Print Cycle Count List N; Auto Release Cycle Count Plan Y; group size 50; activity-work SRC 80; work-unit field FromLoc. A clipped create-work description has value Y. Visible rows show System created Yes; these are example values, not independently verified defaults.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00518, b00519, b00520, b00521](reading/sdd-f46806ef53e15f07.md#b00518)

Assets: [fa3444b3b772c677de91715beff5d84a76bb7a05c89f79cfea97de3cdb70106a.png](assets/sdd-f46806ef53e15f07/fa3444b3b772c677de91715beff5d84a76bb7a05c89f79cfea97de3cdb70106a.png)

#### Immediate count and RF bad-count preference

Cambrai - Inventaires checks Perform threshold counts immediately and Verify bad count on RF. Immediate reconcile of bad count is unchecked; four tolerance fields display 0.00000. Work type is Cycle Counting and work team is blank. Full tolerance captions and part of the reconcile label are clipped or overlapped; user assignments are not visible.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00523, b00524, b00525](reading/sdd-f46806ef53e15f07.md#b00523)

Assets: [861fbc1407d139723f88cad437a0744fea613c13087472c17c5a0cd47f5a94d3.png](assets/sdd-f46806ef53e15f07/861fbc1407d139723f88cad437a0744fea613c13087472c17c5a0cd47f5a94d3.png)

#### All cycle-count item filter

All uses CC IT CRIT and Item with the visible predicate ITEM IS NOT NULL. Inactive and System created are unchecked. The top application selector names cycle-count work criteria, while the open dialog and highlighted navigation identify item criteria; the open dialog is the authority for the displayed predicate.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00527, b00528](reading/sdd-f46806ef53e15f07.md#b00527)

Assets: [a1401df35955b096bf6bf21a2b3f98c1c3501ae1659b930071fc8f00fa1a8ff7.png](assets/sdd-f46806ef53e15f07/a1401df35955b096bf6bf21a2b3f98c1c3501ae1659b930071fc8f00fa1a8ff7.png)

#### Cycle-count location filter list

The list contains All and CC LOCATION Annuel, both Active Yes and System created No. This list is repeated as background in the subsequent two filter-dialog images; by itself it contains no predicate.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00531, b00535](reading/sdd-f46806ef53e15f07.md#b00531)

Assets: [964d623701c5aa4452410782b15b50d75da878673410b5f3b3b3f669a1c9984a.png](assets/sdd-f46806ef53e15f07/964d623701c5aa4452410782b15b50d75da878673410b5f3b3b3f669a1c9984a.png)

#### All location criterion limited by template

The All filter uses CC LO CRIT and Location, with only LOCATION.LOCATION_TEMPLATE = Stock / Prel visible. No ACTIVE condition appears. Inactive and System created are unchecked. This differs from the adjacent description of all active locations.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00532, b00536, b00537](reading/sdd-f46806ef53e15f07.md#b00532)

Assets: [94c5182be48ad17cdb714b1ce6ffafb091f339617c17d088b8822586470b66fc.png](assets/sdd-f46806ef53e15f07/94c5182be48ad17cdb714b1ce6ffafb091f339617c17d088b8822586470b66fc.png)

#### Annual date criterion differing from prose

CC LOCATION Annuel uses Location and visibly reads LOCATION.LAST_CYCLE_COUNT_DATE > Today + 360. Inactive and System created are unchecked. The greater-than operator and plus sign are part of the displayed source and are not corrected to fit the prose.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00533, b00538, b00541](reading/sdd-f46806ef53e15f07.md#b00533)

Assets: [07aa640a73b3f465ed764fbd32fd658183d60397946e8e28f8d6278a2afb050b.png](assets/sdd-f46806ef53e15f07/07aa640a73b3f465ed764fbd32fd658183d60397946e8e28f8d6278a2afb050b.png)

#### Inactive annual count master

Inventaire Annuel selects All for item and location, maximum counts300 with a 0 = No max note, Randomize and Create work checked, and Update cycle count work to include all items unchecked. A scheduled-job checkbox is checked but its caption is clipped. Inactive is checked and the list marks Active No. The image establishes no running annual job.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00544, b00550, b00551](reading/sdd-f46806ef53e15f07.md#b00544)

Assets: [3f483d9604197341e8c20b43533788009d8c694c5229183270613f88eb572529.png](assets/sdd-f46806ef53e15f07/3f483d9604197341e8c20b43533788009d8c694c5229183270613f88eb572529.png)

#### Picking-zone threshold examples

Seven visible picking-zone rows have blank Location type and Movement class, quantity 0.00000 UVC and zero days between counts. The selected W-Picking PCB dialog repeats blank location type, the named work zone, threshold 0 and days 0 with Inactive unchecked. A further blank key dropdown has no visible caption. Blank-key and zero-day semantics are not inferred.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00553, b00554, b00555, b00556, b00557](reading/sdd-f46806ef53e15f07.md#b00553)

Assets: [f04da7a7d42fd46be28c3376588892fbad38a36586d8e8760a1bc4de9c2311b2.png](assets/sdd-f46806ef53e15f07/f04da7a7d42fd46be28c3376588892fbad38a36586d8e8760a1bc4de9c2311b2.png)

#### Warehouse filter for cycle-count work

Inventaires Cambrai uses CC WK CRIT and Cycle count request with Cycle_Count_Request.WAREHOUSE =001. Inactive and System created are unchecked; Order by is not opened. The image defines work-request filtering, not the underlying item/location selection.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00559, b00560](reading/sdd-f46806ef53e15f07.md#b00559)

Assets: [1793172c04594b9cfa7d7f7bd5ee4285e9e27d4df3f7ea326b2e850fab183a66.png](assets/sdd-f46806ef53e15f07/1793172c04594b9cfa7d7f7bd5ee4285e9e27d4df3f7ea326b2e850fab183a66.png)

#### Work-order configuration relationships

Item and Location & Zones connect to BOM Configuration. Finished Item Work Criteria and Component Work Criteria connect to WO Work. Work Order Preferences and System Values are separate boxes; Work Order Custom Views is a separate dotted box. The picture does not explain the dotted-line convention or establish runtime ordering.

Limit: Original EMF decoded with Windows System.Drawing to a private PNG at 2x intrinsic size, then individually viewed; tool display resized 2178x678 to 2048x638. No full DOCX rendering or implemented work-order flow is established.

[sdd-f46806ef53e15f07 b00565, b00566](reading/sdd-f46806ef53e15f07.md#b00565)

Assets: [413df60c9cccc5c49ca1143cd723202927b7cb3f203918e03b516c6895d89bbe.emf](assets/sdd-f46806ef53e15f07/413df60c9cccc5c49ca1143cd723202927b7cb3f203918e03b516c6895d89bbe.emf)

#### Illustrative bill of materials component and item tabs

Finished item XYZ and revision 1 use UVC with planned build time 0:0 and blank build location. Components X, Y, Z are each 1.00000 UVC at level 1, sequences 1, 2, 3, with blank From location. Item characteristics show 0.10000 length/width/height and weight, 0.001 volume, but unit selectors are blank. A note says finished-item characteristics are managed by existing item information. This is an illustration within a section declaring no configured work-order environment.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00564, b00565, b00568, b00569](reading/sdd-f46806ef53e15f07.md#b00564)

Assets: [60fe1d43d2837fed6a4dbb1a153fade0dfd113fbd7d2e4bc91fd2ba25bf1d7d9.png](assets/sdd-f46806ef53e15f07/60fe1d43d2837fed6a4dbb1a153fade0dfd113fbd7d2e4bc91fd2ba25bf1d7d9.png); [702d0f84d7bd37ddb1a1bd99fef28cd3c9bd861ad91242350b91d93a3efdd4fd.png](assets/sdd-f46806ef53e15f07/702d0f84d7bd37ddb1a1bd99fef28cd3c9bd861ad91242350b91d93a3efdd4fd.png)

#### Default work-order preference illustration

The *Default preference has blank build/storage locations, inventory status DISPONIBILE and System logistics-unit assignment. Create work and Generate paperwork on release/confirm are unchecked. The status bar names a different warehouse context than the HADDAD examples; this image must not establish HADDAD effective preferences.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00565, b00571, b00572](reading/sdd-f46806ef53e15f07.md#b00565)

Assets: [1f078a3ec9250174b1aed00a4ab8c8c9a7c18d6cc6c5b67b9f0e62976941bac9.png](assets/sdd-f46806ef53e15f07/1f078a3ec9250174b1aed00a4ab8c8c9a7c18d6cc6c5b67b9f0e62976941bac9.png)

#### Replenishment configuration relationships

Replenishment Master connects down to Location Criteria, Item Criteria, Empty Location Criteria and Allocation Rule. Item Criteria uses a dotted outline. A separate Work box points to Replenishment Work Criteria, while Location & Zones and Item boxes have no arrows. This records visible relationships, not foreign keys or process timing.

Limit: Original EMF decoded with Windows System.Drawing to a private PNG at 2x intrinsic size, then individually viewed; tool display resized 2178x678 to 2048x638. Dotted-outline meaning is unspecified; no full DOCX or runtime acceptance.

[sdd-f46806ef53e15f07 b00580, b00581, b00582](reading/sdd-f46806ef53e15f07.md#b00580)

Assets: [afc46c098506fbaaa9589e100fb6874f4c16d3556a57a2acee55f55931687516.emf](assets/sdd-f46806ef53e15f07/afc46c098506fbaaa9589e100fb6874f4c16d3556a57a2acee55f55931687516.emf)

#### Picking UVC replenishment location filter

The Picking UVC dialog uses RPLN CRIT and Location and shows LOCATION.ALLOCATION_ZONE = A-Picking UVC. The list also includes Picking PCB; both are active and not system-created. Order by is unopened, so destination sorting remains unknown.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00585, b00586, b00587, b00588](reading/sdd-f46806ef53e15f07.md#b00585)

Assets: [cc127d57ff799aeceb6b89080d9e299b205577e7bed4cab21cf8890f6f536801.png](assets/sdd-f46806ef53e15f07/cc127d57ff799aeceb6b89080d9e299b205577e7bed4cab21cf8890f6f536801.png)

#### Grouped replenishment item criteria

Articles rotation A GRA uses Item and the visible expression (ITEM.ITEM_CATEGORY5 = A OR ITEM.ITEM_CATEGORY6 = A) AND SHIPMENT_DETAIL.LOT = A. The parentheses are visible. The list contains rotation/sales variants, all active and not system-created. The image does not establish joins or missing-value behavior.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00590, b00591](reading/sdd-f46806ef53e15f07.md#b00590)

Assets: [200d6cb511c1c9eb1ed0108562eb1b12ddb9e33a5951fe21e6453b652145fac0.png](assets/sdd-f46806ef53e15f07/200d6cb511c1c9eb1ed0108562eb1b12ddb9e33a5951fe21e6453b652145fac0.png)

#### Empty-location criteria using zone and lot capacity

Picking PCB Stock Grade A shows ALLOCATION_ZONE = A-Picking PCB AND LOCATING_ZONE = L-Classe A/B AND MAX_LOTS =1. The list contains PCB and UVC variants for GradesA andB, all active. The selected predicate contains no explicit GradeA lot test; Order by is unopened.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00593, b00594, b00596, b00597](reading/sdd-f46806ef53e15f07.md#b00593)

Assets: [e94d047b7cee18d5d29a0e84daadbf8b5a21b8d822cd78f7e13b8b2da312f530.png](assets/sdd-f46806ef53e15f07/e94d047b7cee18d5d29a0e84daadbf8b5a21b8d822cd78f7e13b8b2da312f530.png)

#### Wave-demand replenishment master

Reappro Rot A GRA PCB selects Demand from wave, Automatic work creation, priority 12 and PCB increment. The list shows allocation rule Réappro RSV PCB and location criterion Picking UVC for this row. Clear-reserve all-UM and multiple-excess-request options are unchecked; consolidate requests is disabled/unchecked. Several other radio labels and dropdown values are clipped.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00599, b00600, b00601](reading/sdd-f46806ef53e15f07.md#b00599)

Assets: [c48e1fbbcdb1e77c65ed9ffc399c8192d0b3736b5dbec3138e88afad9cca8aad.png](assets/sdd-f46806ef53e15f07/c48e1fbbcdb1e77c65ed9ffc399c8192d0b3736b5dbec3138e88afad9cca8aad.png)

#### Demand UM membership and replenishment criteria

For Reappro Rot A GRA PCB, Demand ums checks PCB and UVC and leaves Pallet and SPCS unchecked. Replenishment criteria shows location Picking UVC; empty-location and item-criteria identifiers are clipped. The two images are distinct tabs of the same illustrated master.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00602, b00603](reading/sdd-f46806ef53e15f07.md#b00602)

Assets: [0ecc5940b0f09b839e915b66d668b9f10f4839ff7056f315c7adef84d9486f59.png](assets/sdd-f46806ef53e15f07/0ecc5940b0f09b839e915b66d668b9f10f4839ff7056f315c7adef84d9486f59.png); [1675342a3774ab14d60b477e59d3a4d8025aa23ca509aa257040bbacc5b1d61c.png](assets/sdd-f46806ef53e15f07/1675342a3774ab14d60b477e59d3a4d8025aa23ca509aa257040bbacc5b1d61c.png)

#### Replenishment mode and rounding sequence

The master has Wave checked with Manual and Real time unchecked. Its strategy tab contains one visible row: sequence 10, code 30, Round up to the next whole number increment. The image does not supply UM conversion quantities or illustrate multiple strategies.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00604, b00605](reading/sdd-f46806ef53e15f07.md#b00604)

Assets: [1bab0692b36b2e4500ad353e11a498ec80453f42ffbfbbac16619c96ae36addf.png](assets/sdd-f46806ef53e15f07/1bab0692b36b2e4500ad353e11a498ec80453f42ffbfbbac16619c96ae36addf.png); [cb7b28c1e754da61c2eca707a86670eb23115ead91da2d1394fac9fbda912310.png](assets/sdd-f46806ef53e15f07/cb7b28c1e754da61c2eca707a86670eb23115ead91da2d1394fac9fbda912310.png)

#### Replenishment work filter catalog

The list shows rotation/grade/UM-specific filter names, including PAL, PCB and UVC variants, all visible rows active and not system-created. Some descriptions distinguish PCB-to-UVC replenishment. Names alone do not supply their predicates.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00606, b00607, b00608](reading/sdd-f46806ef53e15f07.md#b00606)

Assets: [56b0ae851008daa06e31632d26e6f7f7801d2cdf1fcda6fb07b315da59b8eb02.png](assets/sdd-f46806ef53e15f07/56b0ae851008daa06e31632d26e6f7f7801d2cdf1fcda6fb07b315da59b8eb02.png)

#### Replenishment work filter and sort row

The Reappro Rot A Grade A PCB dialog shows REPLENISH and Replenishment request. FROM_WORK_ZONE IS NOT NULL and LOT = A are fully visible; the master literal and destination work-zone literal are clipped. Order by contains FROM_LOC Ascending with saved Create work unit No. No full predicate is reconstructed.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00607, b00609](reading/sdd-f46806ef53e15f07.md#b00607)

Assets: [11be5dbf286771ab329ee037569734de2c6919fb5d85a3ef97bca24b93e33ea9.png](assets/sdd-f46806ef53e15f07/11be5dbf286771ab329ee037569734de2c6919fb5d85a3ef97bca24b93e33ea9.png); [c742b7fb78f6485ce527f67cf4e814d48c32f13b0dd8df5bdddb906c91d7ac23.png](assets/sdd-f46806ef53e15f07/c742b7fb78f6485ce527f67cf4e814d48c32f13b0dd8df5bdddb906c91d7ac23.png)

#### Interface technical-value catalog

Visible settings include duplicate receipt/shipment IDs allowed on add Y, delimiter vertical bar, date format yyyyMMdd, Receiving Upload Level Header and Upload deleted shipments Y. Directory-valued rows and several longer captions are present but clipped. Source endpoint strings are intentionally not repeated here; they were not contacted.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00666, b00667, b00668](reading/sdd-f46806ef53e15f07.md#b00666)

Assets: [009ad96f10d9764d0ffdf5c4567751bb89e9e2c8f847215e86b520f6d2150fb3.png](assets/sdd-f46806ef53e15f07/009ad96f10d9764d0ffdf5c4567751bb89e9e2c8f847215e86b520f6d2150fb3.png)

#### Receipt-detail delimited-file data map

REDTL uses Receipt Detail Download, action New and Delimited file selected. Available fields are on the left and ordered Selected fields on the right. Visible selected rows include record identifiers, item, company, total quantity, quantity UM, prices and lot. The list scrolls, so this is not a complete field map. System created is checked.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00670, b00671, b00672](reading/sdd-f46806ef53e15f07.md#b00670)

Assets: [24cd2f1a1a5bf3362fe13ee53c733ec03d3a0b82e225455a3019e3a4aa8520d3.png](assets/sdd-f46806ef53e15f07/24cd2f1a1a5bf3362fe13ee53c733ec03d3a0b82e225455a3019e3a4aa8520d3.png)

#### Receiving interface modes and inactive direct upload

Receiving key 10003 shows ordered details for delimited files, interface tables, XML and fixed length, with Download/Upload pairs visible for several modes. The sequence 40 Receiving Direct Upload dialog selects interface-table Upload and UTF-8, shows numeric maximum 50 and batch 0, and has Inactive checked. Other tabs are unopened and the list is incomplete below the viewport.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00674, b00675, b00676](reading/sdd-f46806ef53e15f07.md#b00674)

Assets: [2efdd9c56dd974e9e4aed2ff33feb4f9a505b5b9910ef883e2d87106ccbc7998.png](assets/sdd-f46806ef53e15f07/2efdd9c56dd974e9e4aed2ff33feb4f9a505b5b9910ef883e2d87106ccbc7998.png); [ebd7d5c0a77251bff06e919b46dee44cdc645d251d615939cbaca583953793f0.png](assets/sdd-f46806ef53e15f07/ebd7d5c0a77251bff06e919b46dee44cdc645d251d615939cbaca583953793f0.png)

#### Inventory-transaction XML upload example

Inventory Transaction key 10006 detail 40 selects XML Upload, UTF-8, numeric maximum 50 and batch 0. File extension is ituxml; error and processed extensions are blank. Save processed data and Inactive are unchecked; System created is checked. Full numeric-field captions are clipped.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00674, b00675, b00682](reading/sdd-f46806ef53e15f07.md#b00674)

Assets: [3cf352c5efa500b471d27f08f4037486b86be5ebdcbfbebf361ffc37a4ade652.png](assets/sdd-f46806ef53e15f07/3cf352c5efa500b471d27f08f4037486b86be5ebdcbfbebf361ffc37a4ade652.png)

#### Item XML download example

Item Master key 10004 detail 40 selects XML Download and UTF-8 with numeric maximum 1 and batch 500. Extensions are imxml, imerr and processed txt. Save processed data is checked; Inactive unchecked. The tab label Upload remains visible despite the selected Download process, so the process radio is the evidence for direction.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00674, b00675, b00683](reading/sdd-f46806ef53e15f07.md#b00674)

Assets: [5759ff4f55e2a514da94e49a3f580f7f123069e47baf0e09c85582f092c5c4a8.png](assets/sdd-f46806ef53e15f07/5759ff4f55e2a514da94e49a3f580f7f123069e47baf0e09c85582f092c5c4a8.png)

#### Receiving XML download example

Receiving key 10003 detail 70 selects XML Download and UTF-8 with numeric maximum 10 and batch 500. Extensions are rcxml, rcerr and processed txt. Save processed data is checked; Inactive unchecked. Full numeric-field captions and other tabs remain unreviewed.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00674, b00675, b00685](reading/sdd-f46806ef53e15f07.md#b00674)

Assets: [9c141e7865a29eeb036e9e2f7677c49a4b8dc9347adf9a38d191241f145b9da5.png](assets/sdd-f46806ef53e15f07/9c141e7865a29eeb036e9e2f7677c49a4b8dc9347adf9a38d191241f145b9da5.png)

#### Generic transform catalog under Carrier Interface

Generic config header TRANSFORM is described as SCALE Transform and lists system-created transformations for item, receipt, shipment, legacy download/upload, bills of materials, work orders, order entry and fixed-length conversion. It contains no selected carrier-specific process or configured XSL path.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00694, b00695, b00696, b00698, b00700](reading/sdd-f46806ef53e15f07.md#b00694)

Assets: [57b3f70985f5f6de3f8ad498f8b1e7485106e431aacfe57f2fdef4cae5e385b2.png](assets/sdd-f46806ef53e15f07/57b3f70985f5f6de3f8ad498f8b1e7485106e431aacfe57f2fdef4cae5e385b2.png)

#### Shipping Label document type

Type 160 Shipping Label selects Label and Shipping Label document generator; its data-source caption is clipped. Start WM work has the visible default checkbox checked, while other visible print-procedure defaults are unchecked. Allow print preview is unchecked and SSRS file/folder fields are blank. These defaults are selections within this pictured type, not current system defaults.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00717, b00718, b00719, b00720](reading/sdd-f46806ef53e15f07.md#b00717)

Assets: [9548ea1999b211dcf20711bd7354530f43d0cefe9f32fb58d0761f1c31192355.png](assets/sdd-f46806ef53e15f07/9548ea1999b211dcf20711bd7354530f43d0cefe9f32fb58d0761f1c31192355.png)

#### Generic Ship Label template renderer

Generic Ship Label uses Shipping Label document type, a .lbl template and SCALE label as Printed as. Document criteria and Language are blank/disabled. Other renderer choices are visible, including Reporting services, Crystal, FedEx and External; the image demonstrates none of their execution. It is a label example adjacent to separate SSRS prose.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00724, b00725, b00726](reading/sdd-f46806ef53e15f07.md#b00724)

Assets: [3aff0a817f520ce9554ca647007bd83b3238315f078896200b85ae5550ae5b1d.png](assets/sdd-f46806ef53e15f07/3aff0a817f520ce9554ca647007bd83b3238315f078896200b85ae5550ae5b1d.png)

#### Label master generation and detail links

The illustrated Prefomato master selects Print during wave and shows ShippingLabelGenerator. A second horizontal view exposes Document type Prefomato Label and the separate Label selection criteria field. Data selection is clipped in these views; the later criterion picture supplies its full example identifier. Print at release and Manual are not selected.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00728, b00729, b00730](reading/sdd-f46806ef53e15f07.md#b00728)

Assets: [1268b68b4781bb91cd91083bb86c3bea2af5883a629a1d014441453d00662659.png](assets/sdd-f46806ef53e15f07/1268b68b4781bb91cd91083bb86c3bea2af5883a629a1d014441453d00662659.png); [c70a6607587d6bb0a69cf62c781062cf69f2359c6e319ee6452abc72ef654c56.png](assets/sdd-f46806ef53e15f07/c70a6607587d6bb0a69cf62c781062cf69f2359c6e319ee6452abc72ef654c56.png)

#### Label master criterion detail criterion and label type

Three images show separate records. The master criterion requires INTERNAL_CONTAINER_NUM >=0 and a parenthesized ORDER_TYPE OP-or-OPB group. The detail label-selection criterion requires ORDER_TYPE OP only. The Prefomato Label document type selects Label, Shipping Container data source and Shipping Label generator; Allow print preview is unchecked.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00728, b00731, b00732](reading/sdd-f46806ef53e15f07.md#b00728)

Assets: [aa6717306773fe1007d6b310082ed51fa9a9eb5bf4dc703881c465e5203b67a0.png](assets/sdd-f46806ef53e15f07/aa6717306773fe1007d6b310082ed51fa9a9eb5bf4dc703881c465e5203b67a0.png); [e27cc23c0b4c844d839b6b29563c27af8659e46d3f8650d31f879a9fe91089e4.png](assets/sdd-f46806ef53e15f07/e27cc23c0b4c844d839b6b29563c27af8659e46d3f8650d31f879a9fe91089e4.png); [e5da58e2cd5c70fe20984d4221feef91948320560176d914e1ce9c7871028636.png](assets/sdd-f46806ef53e15f07/e5da58e2cd5c70fe20984d4221feef91948320560176d914e1ce9c7871028636.png)

#### Document-routing eligibility and output selection

Shipping Label Routing criteria shows warehouse 001, mostly blank other fields and lower numeric user-defined values0.00000. Routing selection chooses Generic Ship Label, one copy and a named print device. The device identifier is not needed to explain the relationship and is not reproduced. Criteria blank/zero semantics and actual printer reachability remain unestablished.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00734, b00735, b00736, b00737](reading/sdd-f46806ef53e15f07.md#b00734)

Assets: [e7a8781f1c1136b745ad1273001f915881ffb0bb1fb9ec43d6c4079a8304d910.png](assets/sdd-f46806ef53e15f07/e7a8781f1c1136b745ad1273001f915881ffb0bb1fb9ec43d6c4079a8304d910.png); [f73c35dce4eb9007ffd5b36582c27460fab773f35b563665ec97fad208739d65.png](assets/sdd-f46806ef53e15f07/f73c35dce4eb9007ffd5b36582c27460fab773f35b563665ec97fad208739d65.png)

### Additional source qualifications

- Labels retains three media assets without extracted node associations: two viewed branded backgrounds and one unrendered EMF. They are inventoried separately and receive no authored-description coverage credit in this batch.
- Covetrus b00214 and b00221 assign dimension and cross-reference maintenance to SCALE/direct diagnostics paths, while b00343-b00361 list host download responsibility for corresponding data. Field ownership and overwrite precedence remain unresolved.
- Covetrus b00251 and b00259 reject picking/putaway sequence and location-check-digit use, but b01182, b01493 and b01510 describe those mechanisms later. Source-specific workflow claims must retain this configuration conflict.
- Covetrus b00424 permits host shipment updates/deletes until waving, whereas b01622 names In Pool as the host-change boundary and prohibits host cancellation after release. The exact pre-release wave-state contract remains unestablished.
- Covetrus b00301 describes one receipt per inbound trailer; b02258-b02260 expressly resolve the question as multiple receipts per trailer. No uniqueness constraint is inferred from the terminology table.
- Covetrus b00257 names supported UPS, USPS and FedEx transportation services, extending the earlier b01258-versus-b02057 carrier-scope conflict. The actual carrier mix and effective manifest integrations are not established.
- Covetrus b00255 describes middleware waiting for all shipment-upload data if a load-confirmation split occurs, while b02040 says the design avoids splitting shipments because of host restrictions. Exception handling is not evidence that splitting is the intended normal flow.
- Covetrus b00222 permits cross-reference sharing across items while b00221 describes item/UOM uniqueness. The intended uniqueness key, collision handling and barcode validation contract are not supplied.
- Covetrus b00455 describes a planned diagnostics API to retrigger shipment uploads; duplicate handling, idempotence, authorization and completion are not specified. It remains a design enhancement rather than a verified recovery procedure.
- Covetrus source screenshots are explicitly illustrative (b00274) and suggested configuration names may change (b00276). Inspected images include differing example environments and screen labels; they do not establish a consistent deployed release or verified navigation.
- Covetrus b02162-b02166 describe planned conversion and asserted inventory accuracy but do not provide a completed conversion receipt or independently measured accuracy evidence. No production copy or inventory load is authorized by the SDD.
- Covetrus b02379-b02383 describe user/group/window permission scope but do not establish conflicting permission precedence or actual user entitlements.
- HADDAD cycle-count sources disagree: All is described as all active locations but b00537 shows only Stock / Prel template; annual older-than-360-days prose at b00533 differs from b00541 LAST_CYCLE_COUNT_DATE > Today +360; b00550 annual master is inactive and selects All. Intended predicates and scheduled activation need authoritative clarification, not inferred corrections.
- HADDAD b00557 uses work-zone-only threshold keys, while b00553-b00554 lookup prose does not explain that pattern. Blank-key matching and zero-day/count-threshold behavior remain unestablished.
- HADDAD declares no work-order configuration in its example environment at b00565; BOM/preference images are illustrative and the preference has a different warehouse context. Full component/finished-item work criteria are only headings, with no demonstrated configuration.
- HADDAD b00512 shows a SEEDING activity instruction paired with ITEM1015 rather than the separately listed SEEDING1015 criterion. Intended association and predicates remain unverified.
- HADDAD Carrier Interface provides a generic transform catalog, No xsl and No shipping interface upload criteria, followed by an empty Interface process subsection. This does not establish a complete carrier integration.
- HADDAD label master and label-selection criteria differ on OPB eligibility; exact combined evaluation and downstream label-generation behavior need the matching contract. Screenshots do not establish active wave binding, successful rendering or printer delivery.
