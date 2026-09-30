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
