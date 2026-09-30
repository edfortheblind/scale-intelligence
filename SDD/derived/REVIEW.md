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

## Continuation 6 source review

This batch adds 59 claims, 48 setting contracts and 209 visual descriptions covering 367 additional retained assets. The statements preserve source and deployment distinctions. No original source or previous authored record was changed.

### covetrus-shipment-versus-receipt-detail-cardinality

Covetrus permits repeated item lines on a shipment, including after order updates, while its receipt assumption limits an item to one detail for the same lot when that lot is interfaced.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. These are design cardinality statements, not verified database uniqueness constraints or a general product rule. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00234, b00235](reading/sdd-c4c7e01f8ccad48a.md#b00234)

### covetrus-hazmat-porting-and-excluded-services

Hazardous-material shipping is outside the stated SOW, yet the document says the existing process will be ported with changes subject to change control. Rate shopping is also excluded, and item price labels are printed outside SCALE.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Existing-process support is not evidence that new hazardous-material functionality was included, certified or delivered. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00245, b00258, b00265](reading/sdd-c4c7e01f8ccad48a.md#b00245)

### covetrus-cart-tote-system-container-meaning

When physical totes are used for cart picking instead of boxes, the Covetrus design treats the pick in SCALE as going into the final shipping container.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Physical receptacle and systemic container identity must not be assumed equivalent in another workflow. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00256](reading/sdd-c4c7e01f8ccad48a.md#b00256)

### covetrus-movement-class-current-versus-recommendation

The design maintains an item movement class for fast or slow movers. Maintaining this at UOM level and using movement-class analysis for slotting are Manhattan recommendations.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The recommendation does not establish implemented UOM-specific classifications or measured slotting benefits. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00365](reading/sdd-c4c7e01f8ccad48a.md#b00365)

### covetrus-redelivery-without-stock-return

The returns section distinguishes redelivery using a new bill of lading from a return to inventory: for redelivery it says the shipment is not broken down and received into stock.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The text supplies no complete redelivery procedure or evidence that any actual shipment was processed. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00392, b00394, b00396, b00398](reading/sdd-c4c7e01f8ccad48a.md#b00392)

### covetrus-receipt-label-placement-and-content

After item check-in, the design locates the LPN, creates putaway work and prints two receipt-container labels to the user belt printer. It places one at the pallet bottom and one at the top, recommending the same face. Listed fields are license plate, non-barcoded SKU, the first five characters of the locating location, lot and expiration date.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. This records label design content and physical placement only; no printing or barcode certification was performed. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00650, b00652, b00654, b00655, b00656, b00657, b00658, b00659](reading/sdd-c4c7e01f8ccad48a.md#b00650)

### covetrus-recall-receiving-development-note

A development note describes locating recalled product with a Recall or held status matching existing inventory and marking the receiving worksheet line with an asterisk.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The development note does not prove deployment, a validated recall control or a complete traceability workflow. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00809](reading/sdd-c4c7e01f8ccad48a.md#b00809)

### covetrus-manual-adjustor-warning-conflict

The Manual Inventory Adjustment image warns that the utility should not be used in production because item placement and quantity adjustment can be unpredictable. This conflicts with the adjacent note describing frequent supervisor use for reconciliation and recommending less use.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The image warning is preserved as source evidence. The historical supervisor-use note is not an endorsement or safe operating procedure. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00958, b00960, b00961](reading/sdd-c4c7e01f8ccad48a.md#b00958)

### covetrus-mobile-location-inquiry-actions

Warehouse Mobile location inquiry searches location inventory and offers inventory actions. The examples show searching by location, item or license plate, viewing separate lot records and opening Adjust, Status change or Transfer from the result.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The displayed on-hand quantity is a system record, not proof of physical quantity or authorization to change it. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00995, b00996, b00999, b01002](reading/sdd-c4c7e01f8ccad48a.md#b00995)

### covetrus-replenishment-increment-source-conflict

The demand-replenishment section requests rounded-up EA quantities after evaluating Each, Inner Pack and Case wave demand. The wave-step section instead requests case or configured-UOM increments and creates in-transit inventory for shipment allocation. A separate passage introduces higher-priority PL replenishment.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. These passages are not reconciled into one effective increment. Master selection and the applicable flow must be established from authorized configuration evidence. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01096, b01108, b01359](reading/sdd-c4c7e01f8ccad48a.md#b01096)

### covetrus-replenishment-physical-layout-and-override-review

Covetrus does not use clear-location over-picking for replenishment. The source attributes non-UOM-specific reserve handling to space/layout restrictions and notes that quantity overrides can create additional replenishment or fulfillment delays. Warehouse Mobile override handling is still under feasibility review, while EX27 describes showing UOM information on the pick screen.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Described labor and delay effects are design risks, not measured performance. A recommended multiple-work-unit enhancement is not a delivered capability. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01102, b01104, b01106, b02250](reading/sdd-c4c7e01f8ccad48a.md#b01102)

### covetrus-replenishment-locating-enhancement-boundary

The document says current locating selects a pick location when that pick location has no inventory, while an enhancement under consideration would use absence of inventory across the DC as the condition.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The proposed condition is not treated as implemented locating behavior. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01110](reading/sdd-c4c7e01f8ccad48a.md#b01110)

### covetrus-replenishment-work-size-and-zone-variation

Replenishment work creation is described as one item from one storage or reserve location, bundled through work group/type/criteria/master configuration. The later execution paragraph allows any configured number of items in its picks. Hi/Low zone criteria vary by DC and are explicitly not standardized.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The one-item statement and configurable multiple-item execution wording remain unresolved; the screenshots do not prove a universal work-unit boundary. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01163, b01165, b01182](reading/sdd-c4c7e01f8ccad48a.md#b01163)

### covetrus-outbound-wave-and-pick-status-details

The status list maps Wave Pending (200) to a wave not yet run, In Wave (201) to an initiated but unreleased run, Picking Pending (300) to released work not yet initiated, and In Picking (301) to at least one assigned instruction. Packing Pending (400) means at least one pick-confirmed instruction; In Packing (401) means at least one packed instruction.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. These definitions belong to this design. A header status alone is not proof that every container completed that stage. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01230, b01231, b01232, b01233, b01234, b01235](reading/sdd-c4c7e01f8ccad48a.md#b01230)

### covetrus-outbound-staging-and-rejection-status-details

The status list describes Staging Pending (600) after all items are picked, packed and/or consolidated; Loading Pending (650) adds the staged possibility. Ship Confirm Pending (700) means at least one closed container, and Load Confirm Pending (800) means all shipments on the load are ship confirmed. Delete Rejected (998) and Rejected (999) distinguish rejected detail quantity slated for deletion from allocation-rejected quantity.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The list is not a verified state machine. Load-confirmation paragraphs use Ship Confirm Pending as a prerequisite, so do not infer an additional mandatory 800 transition from this summary alone. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01236, b01237, b01238, b01239, b01241, b01242](reading/sdd-c4c7e01f8ccad48a.md#b01236)

### covetrus-picking-pending-release-conflict

The status glossary describes Picking Pending as occurring after wave release, while Complete Wave says it sets Picking Pending so shipments are eligible for release. Start Wave is separately described as required and sets shipments to In Wave.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. No exact release transition is selected from these inconsistent descriptions; work hold removal remains a distinct documented release action. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01232, b01354, b01570](reading/sdd-c4c7e01f8ccad48a.md#b01232)

### covetrus-manual-wave-add-and-rejection-consolidation

Selected Planned Shipment results can be added to an existing open wave or a new wave based on a chosen wave master. The new wave gets a next-up identifier and moves shipments out of the pool view. An operational note also describes manually consolidating previously rejected pool shipments into a shipment in process, despite the general assumption that manual consolidation is not used.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The rejection exception and general exclusion are retained together. Dock consolidation is separately excluded; this does not authorize a merge of actual shipments. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00254, b01323, b01325, b01335, b02018](reading/sdd-c4c7e01f8ccad48a.md#b00254)

### covetrus-allocation-priority-performance-review

The source reports allocation-rule assignment priorities above 500 and raises concern about evaluation work when matching lower-priority entries, with cleanup deferred to build review.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Priority values do not prove there are more than 500 rules or quantify execution time. No workload, benchmark or runtime measurement was performed. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01376](reading/sdd-c4c7e01f8ccad48a.md#b01376)

### covetrus-parcel-third-party-billing-override

For selected parcel orders, the design interfaces third-party billing details to the shipment header and uses an override-data wave step to apply them to cartons for FedEx communication. The step scope is marked for build review.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Account numbers and billing addresses are excluded. The description is not an implemented mapping, carrier acceptance or proof that the override is still required. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01430, b01432](reading/sdd-c4c7e01f8ccad48a.md#b01430)

### covetrus-load-build-match-and-ambiguous-stop-flag

Load Building orders wave shipments by carrier, ignores those without a carrier and searches open loads by carrier, scheduled ship date and route. It creates a load when no match exists. The existing-load sentence has a negative stop-additional-shipments condition whose intended truth value is ambiguous.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. No acceptance rule for the stop-additional flag is inferred from the ambiguous wording. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01474, b01476, b01477, b01478](reading/sdd-c4c7e01f8ccad48a.md#b01474)

### covetrus-pallet-and-bulk-work-initiation

Full-pallet picking starts with a user-directed pallet work unit from its internal label. Pallet-build picking starts from a pallet-label barcode and then validates a case container. Bulk picking starts from a break-label work-unit barcode and also verifies the destination container.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The existing label-ID conflict is not resolved here. EX07 item-validation exceptions must be considered separately from these nominal scan flows. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01657, b01658, b01659, b01663, b01665, b01696, b01697, b01698, b01701, b01812, b01813, b01814, b01816](reading/sdd-c4c7e01f8ccad48a.md#b01657)

### covetrus-bulk-work-unit-concatenation-review

A testing note says a custom wave step assigns a shipment/item concatenation as the bulk/reserve work unit. It warns that resulting identifiers can be long or contain special characters and recommends reviewing the override despite reported satisfactory use.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. This is a historical testing assertion, not a validated identifier grammar, maximum length or current barcode compatibility result. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01835](reading/sdd-c4c7e01f8ccad48a.md#b01835)

### covetrus-interleaving-and-caged-warehouse-scope

Task interleaving is excluded and not listed as a Covetrus future initiative. A separate EX10 flow lets an authorized Warehouse Mobile user change the default warehouse for a controlled-substance warehouse physically housed inside another DC building.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Logical warehouse switching is not proof of physical movement or permission to access every warehouse. No authorization mechanism or live entitlement was inspected. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01862, b01869, b02210](reading/sdd-c4c7e01f8ccad48a.md#b01862)

### covetrus-container-close-lookup-path

When a container ID is unavailable to scan, the design describes filtering Shipping Container Insight by shipment ID, selecting the intended container and using Close.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. This is a source-described alternate lookup path, not verified current navigation or evidence that the selected container is eligible to close. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01948, b01949, b01952](reading/sdd-c4c7e01f8ccad48a.md#b01948)

### covetrus-dock-consolidation-and-document-boundaries

Covetrus excludes Warehouse Mobile consolidation, single-order nesting, multi-order pallets and manual shipment consolidation at the dock, while using wave consolidation. The loading section permits printing the bill of lading and packing list before or after load confirmation and prints international commercial invoices outside SCALE.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The EX24 sentence ends with an incomplete prerequisite before generating or printing; that missing condition is not reconstructed. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01997, b02002, b02013, b02018, b02046, b02047, b02048, b02050, b02220](reading/sdd-c4c7e01f8ccad48a.md#b01997)

### covetrus-extension-contract-and-future-boundaries

The generic-data-bind stored-procedure list is N/A pending technical design; the notification list is also undecided. The future section names single-unit packing and container-information-based LPN receiving for DRP orders. These are future or incomplete contracts, not deployed capabilities.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. The separate DSCSA inbound reference remains unavailable; named extensions and future items do not supply executable procedures or field mappings. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b02214, b02235, b02291, b02292](reading/sdd-c4c7e01f8ccad48a.md#b02214)

### covetrus-country-origin-model-and-future

Covetrus says it does not track country of origin in SCALE fields or flags and uses separate item codes when otherwise similar items come from different countries. Using the item-master country-of-origin field is listed as future functionality.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Separate item codes do not prove actual origin information or current allocation behavior. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00264, b02262, b02263, b02289](reading/sdd-c4c7e01f8ccad48a.md#b00264)

### covetrus-selective-qc-and-vas-container-coverage

The assumptions explicitly say that not every container is marked for systemic outbound QC or VAS. Pharmacy VAS is concentrated in selected facilities, while QC Workbench is often used for visual inspection with Force QC Pass.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. This qualifies the reviewed QC/VAS flows without deriving a universal sampling rate, coverage guarantee or completed physical inspection. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00267, b00268](reading/sdd-c4c7e01f8ccad48a.md#b00267)

### covetrus-override-to-generic-configuration-plan

The assumptions describe migrating existing override-data wave steps into generic configuration during build to reduce dependence on Manhattan cloud services for execution.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. This is a design intention. The separate build/testing review of whether overrides remain necessary prevents treating it as a completed replacement or an executable migration plan. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00271, b01282](reading/sdd-c4c7e01f8ccad48a.md#b00271)

### covetrus-dscsa-putaway-serial-handoff

The putaway section says DSCSA receiving updates serial-number status in a custom DSCSA table and refers to a separate inbound-processing specification for details.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. No table identifier, allowed statuses, transition rules or external specification content is supplied here. The note does not establish traceability compliance or deployed database objects. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00898](reading/sdd-c4c7e01f8ccad48a.md#b00898)

### covetrus-wave-document-and-external-visual-check

The paperwork section says selected facilities print a shipment packing list to support an external visual check identified as DEA-related, and states that no other documents are printed in the wave.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. This is a document-scope statement, not validation of the external check or a claim that labels are excluded; labels have a separate preceding subsection. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01539, b01556](reading/sdd-c4c7e01f8ccad48a.md#b01539)

### covetrus-bill-of-materials-and-work-orders-excluded

Bill of Materials and Work Orders are explicitly outside this Covetrus implementation scope; the inventory section also states that work orders are not used.

Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. This is an implementation exclusion, not a statement that SCALE lacks those capabilities. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00269, b00428, b00432, b01190](reading/sdd-c4c7e01f8ccad48a.md#b00269)

### haddad-user-authorization-prose-image-scope

HADDAD says warehouse/company access should be limited to the users who work there, and asks for correct company and warehouse access on each user. The pictured user profile instead selects All for company access, warehouse access, work profiles and adjustment types.

The source does not demonstrate least-privilege assignments or explain whether All includes future records. The sample account is not an approved authorization model. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00043, b00049, b00055, b00056, b00057, b00058](reading/sdd-f46806ef53e15f07.md#b00043)

### haddad-storage-template-um-spelling-conflict

The storage-template prose names UVC, SPCB, PCB and PAL, but its *Default detail screenshot spells the second UM SPCS. The screenshot groups UVC/SPCS/PCB during check-in and leaves PAL ungrouped, with Treat as full percent 100 on every row.

SPCB and SPCS are preserved as differing source strings. The source does not establish whether one is a typo, alias or a separate configured unit. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00136, b00137, b00139](reading/sdd-f46806ef53e15f07.md#b00136)

### haddad-item-uom-note-conflicts-with-image

The item-UOM screenshot shows two sequenced rows for a single item, UVC and PCB, with different conversion quantities. The following note literally says several units of measure cannot be created for a single item.

The screenshot and literal note disagree; this review does not choose an undocumented cardinality constraint or infer how the editor validates duplicate rows. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00158, b00160, b00162, b00164](reading/sdd-f46806ef53e15f07.md#b00158)

### haddad-location-capacity-bypass-boundary

HADDAD says item/location capacity defines a maximum quantity for an item or item class at a location or location type, is considered during putaway and replenishment, and is disregarded for manual location override or RF transfer.

Historical source behavior only. No manual override, RF transfer or actual capacity check was executed. Classification: `vendor_behavior`.

[sdd-f46806ef53e15f07 b00190, b00191](reading/sdd-f46806ef53e15f07.md#b00190)

### haddad-location-type-large-values-not-unlimited

HADDAD says dimensions and weight are optional for location types. Its packing and shipping-dock type screenshots nevertheless populate 9999 in each dimension and maximum-weight field.

The document does not define 9999 as an unlimited sentinel. Those example numbers must not replace the prose statement that values may be omitted. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00092, b00095, b00096](reading/sdd-f46806ef53e15f07.md#b00092)

### haddad-custom-flow-selection-versus-mandatory

HADDAD describes MSGCOL for at most three cases and MSGPAL for more than three. The inspected flow details show status 630 and Appel Akanea 640 unchecked for MSGCOL and checked for MSGPAL, while both rows have Mandatory No.

A status-selection checkbox and the Mandatory column are different fields. These screenshots do not contain the actual case-count predicate, and the main prose directs linking the custom flow through a wave Override step, while its anchored comment qualifies this instruction when the desired flow arrives in the customer download. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00389, b00390, b00391, b00394, b00396, b00401, b00402, b00403, part-comments](reading/sdd-f46806ef53e15f07.md#b00389)

### haddad-dock-anchor-matches-context-gap

Both inspected dock-area anchor criteria display SHIPMENT_HEADER_VIEW.SHIPMENT_ID MATCHES without a literal right-hand value. One also includes a carrier equality. The adjacent prose says eligible dock areas are filtered before the assignment strategy chooses the destination.

The source does not explain MATCHES evaluation context; a missing literal cannot be interpreted as a match-all, invalid filter, or actual shipment selection. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00425, b00427, b00428](reading/sdd-f46806ef53e15f07.md#b00425)

### haddad-putaway-group-definition-consistency

HADDAD says putaway location groups use either location ranges or locating zones, and the method selected for the first group must be used for subsequent groups. Its list illustrates zone-based groups with blank From/To location fields. The prose says the group remains in the parent LPN field after putaway.

This is a source-stated grouping contract, not evidence that grouping is enabled by every receiving preference or that current inventory carries parent groups. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00223, b00224, b00225](reading/sdd-f46806ef53e15f07.md#b00223)

### haddad-dock-carrier-fallback-boundary

HADDAD describes dock carrier-assignment records as optional. When no such records exist, it says dock assignment uses the default locations on the dock-management flow header or detail.

The source does not define a complete precedence algorithm among multiple matching carrier records or between header and detail defaults. No dock assignment was executed. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00412, b00413, b00414, b00415, b00417, b00418](reading/sdd-f46806ef53e15f07.md#b00412)

### haddad-custom-flow-download-comment-exception

The main HADDAD custom-status-flow prose directs linking a flow to a wave-flow Override step. Original comment 66, anchored to that exact paragraph, says this is not always mandatory when the customer supplies the desired status flow in the download document.

The comment records an unresolved author qualification, not a validated precedence rule or proof that a current inbound message supplies this field. Neither the field mapping nor fallback behavior is demonstrated. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00403, part-comments](reading/sdd-f46806ef53e15f07.md#b00403)

### grupo-receiving-documents-current-versus-optional

The Grupo Julio design says the current receiving item document is DOC01 and that the base Receiving Worksheet is not being used at that moment, although it may be used later. Its adjacent configuration note calls that worksheet DOC02, allows possible additional information, and recommends barcoded disposition codes.

Document-specific names and a possible future customization are retained. Neither worksheet adoption nor barcode implementation is verified; DOC02 here is the receiving context and is not a universal document identifier. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p027-b004, p028-b002](reading/sdd-d50ca4a96095c930.md#p027-b004)

### grupo-interface-upload-caption-mismatch

The page-19 section is headed Upload from SCALE to ERP and labels Receipt Confirmation, Shipment Confirmation and Inventory Transactions, but its figure caption reads Interface Download. The page-16 download diagram is separately labelled Item Master, Receipt Download and Shipment Download.

Source-label discrepancy retained. Interface direction comes from the section labels and rendered arrows, not a silent correction of the figure caption. No endpoint, schedule or execution is established. Classification: `analyst_inference`.

[sdd-d50ca4a96095c930 p016-b003, p016-b004, p016-b005, p016-b006, p016-b008, p019-b009, p019-b010, p019-b011, p019-b012, p019-b013, p019-b014](reading/sdd-d50ca4a96095c930.md#p016-b003)

### grupo-carrier-change-transfer-load-boundary

The Shipment Carrier illustration is captioned as a carrier change before adding the shipment to a wave. Separately, the bilingual LTL procedure says that before loading the truck, a carrier change can be handled through Transfer Shipment: use a known destination shipping-load number or create a new shipping load and choose its carrier.

These are separately qualified documentary routes. The source does not establish unrestricted carrier edits after waving, after loading, or after ship confirmation; no current status-flow or permission was tested. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p081-b002, p081-b004, p082-b002, p082-b003, p083-b002](reading/sdd-d50ca4a96095c930.md#p081-b002)

### knipper-appointment-reference-only

The design retains inbound appointment scheduling outside SCALE; the appointment editor and calendar are optional future reference. The source limits appointments to existing open receipts and excludes shipping-load appointment management.

Historical design scope only; no appointment module activation or current operator workflow observed. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p019-b008, p019-b010, p020-b005](reading/sdd-1c25f20de1eafc3e.md#p019-b008)

### knipper-receiving-document-two-form-qualification

The receiving body names DOC01 for all receiving flows, while its resolved comment identifies two forms to port: a receiving worksheet and incoming-material QA inspection form. The selected-documents illustration does not establish the final document-ID mapping or completed port.

Source annotation qualifies the body. Existing form deployment, template versions and print success are unobserved. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p018-b004, p018-b006, p018-b007, p018-b008, p018-b009](reading/sdd-1c25f20de1eafc3e.md#p018-b004)

### knipper-receipt-unlocate-caption-conflict

The page 34 caption says Closing receipt Shortages, but its retained figure displays Receipt Workbench and a successful-unlocate banner with Locate Pending rows. That image cannot be used as evidence of receipt closure.

Visual/source-caption discrepancy only; no application action was performed. Classification: `analyst_inference`.

[sdd-1c25f20de1eafc3e p034-b004, p034-b005, p034-b007](reading/sdd-1c25f20de1eafc3e.md#p034-b004)

### knipper-receiving-serial-extension-boundary

The standard receiving body distinguishes inbound serial-tracked items from ordinary item receiving. The pictured sequence selects Not SN Tracked; the proposed EX37 DSCSA inbound enhancement is separately described as Warehouse Mobile only and dependent on its own extension specification.

No serial capture, DSCSA transaction, extension implementation or compliance result was tested. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p023-b007, p024-b005, p024-b006, p025-b003, p025-b004, p025-b005, p025-b006](reading/sdd-1c25f20de1eafc3e.md#p023-b007)

### knipper-locating-lpn-not-line

A resolved receiving comment says locating always occurs at LPN level even when the same locating rule is assigned to a receipt line. This separates rule assignment from the unit being located.

Historical source clarification; not an observed locating execution. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p023-b004, p023-b005, p023-b006, p023-b007, p023-b008](reading/sdd-1c25f20de1eafc3e.md#p023-b004)

### knipper-returns-custom-receipt-creation-boundary

Return receiving accepts host RA/RMA receipts and some shipment-created receipts, but the requested undeliverable direct-to-practitioner receipt creation from an outbound container is explicitly deferred to a separate custom design. The returns workbench figure does not prove that custom creation path.

Receipt creation and receipt check-in are different source scopes; external design was not supplied/reviewed. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p027-b007, p028-b003, p028-b005, p028-b006, p028-b011](reading/sdd-1c25f20de1eafc3e.md#p027-b007)

### knipper-inventory-adjustment-location-boundary

The source permits Inventory Management adjustments only for located inventory, excluding receiving-dock inventory. Adjustment types can impose quantity bounds, user access and host-upload exclusions; negative quantities represent negative adjustments.

Documented process contract only; no adjustment, authorization or host integration was executed. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p042-b005, p043-b005](reading/sdd-1c25f20de1eafc3e.md#p042-b005)

### knipper-transfer-with-work-and-building-qualification

Transfer-with-work must be created in Insight and may execute on RF. The body describes transfer within one warehouse, but a comment mentions occasional building-to-building transfers; the surrounding passage does not define that broader transfer/interface contract.

Do not generalize a same-warehouse example into a cross-warehouse movement workflow. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p043-b010, p043-b011, p043-b012, p044-b003](reading/sdd-1c25f20de1eafc3e.md#p043-b010)

### knipper-replenishment-unit-grouping-tension

Replenishment Work Creation says one item from one storage/reserve location per work unit; the execution section later permits any number of items as defined by Knipper. The source also says high/low zone setup is not standardized across DCs. Actual grouping cannot be determined from these statements alone.

Clipped filter and sort figures cannot resolve grouping; no complete executable rule was reconstructed. Classification: `analyst_inference`.

[sdd-1c25f20de1eafc3e p059-b005, p060-b004, p061-b003](reading/sdd-1c25f20de1eafc3e.md#p059-b005)

### knipper-realtime-replenishment-future-and-wave-trigger

Threshold-based real-time replenishment is explicitly outside go-live, with possible later adoption. A comment distinguishes manual selection, scheduled real-time evaluation and automatic wave launch-flow replenishment, while the body describes demand running ahead of waves and a comment questions that phrasing.

No scheduler, effective trigger or present enablement established; source wording remains qualified. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p056-b005, p056-b006, p056-b009, p056-b010, p056-b011](reading/sdd-1c25f20de1eafc3e.md#p056-b005)

### knipper-finished-goods-confirmation

The design uses Work Order Insight Confirm, quantity built and a preprinted LPN per putaway unit to consume components and create finished goods. Completed goods are located by configured rules and put away through user-directed work, optionally a dedicated finished-goods profile.

Historical workflow only. Nearby kit test requests marked resolved do not supply executed test results. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p064-b010, p064-b015, p065-b005, p065-b006, p065-b007](reading/sdd-1c25f20de1eafc3e.md#p064-b010)

### knipper-nested-pallet-qc-custom-scope

The packing body calls pallet-level QC EX46. Comments distinguish base support for full cases, unopened full pallets and loose shipper-case containers from custom QC for containers nested on a pallet, and leave the custom RF scope dependent on requirements. The comment request that picker cannot be QC operator is not demonstrated by the image.

A resolved comment marker is not delivered-extension evidence; version-matched base capability and segregation enforcement remain unverified. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p100-b005, p100-b006, p100-b007, p100-b008, p100-b009, p100-b010, p100-b011, p100-b012](reading/sdd-1c25f20de1eafc3e.md#p100-b005)

### knipper-parcel-dock-management-dispute

The dock section describes manual assignment for LTL, while its parcel comments report SCALE2013 configuration/testing, a claim that it was not working and needed a custom extension, then a proposed manual-scanning base solution. This does not establish a settled parcel dock-management design or successful port.

Keep discussion history and proposals distinct from accepted implementation; no external system was inspected. Classification: `analyst_inference`.

[sdd-1c25f20de1eafc3e p106-b003, p106-b005, p106-b006, p106-b007, p106-b008, p106-b009, p106-b010](reading/sdd-1c25f20de1eafc3e.md#p106-b003)

### knipper-manifest-fedex-illustration-conflict

Knipper parcel-manifest prose excludes FedEx actions and end-of-day processing from Manifest Insight and retains UPS/USPS/UPS Mail Innovations; the retained screenshot instead shows FedEx rows. Its sample carrier data does not establish Knipper carrier scope.

Historical prose/screenshot mismatch; no current carrier rules or manifest transactions validated. Classification: `analyst_inference`.

[sdd-1c25f20de1eafc3e p108-b005, p108-b006, p108-b009, p108-b010, p108-b012](reading/sdd-1c25f20de1eafc3e.md#p108-b005)

### Retained asset descriptions

#### Desktop and mobile inventory adjustment forms

The desktop view has adjustment type, location, item/company, lot, quantity/UOM and status inputs, with Adjust highlighted and Create work inactive. The mobile view exposes adjustment type, location, item/company and quantity/UOM entry. Neither image shows a completed adjustment.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Sample identifiers and quantities are omitted.

[sdd-c4c7e01f8ccad48a b00922, b00924, b00926, b00927, b00928, b00929](reading/sdd-c4c7e01f8ccad48a.md#b00922)

Assets: [46fb68df4440cca97a535a59a52427b87123ad3e351bef0004ba6279b764b8fb.png](assets/sdd-c4c7e01f8ccad48a/46fb68df4440cca97a535a59a52427b87123ad3e351bef0004ba6279b764b8fb.png); [bae12a43c735e3502434f1ba6c4c5f512dcf30912f3fb5a453ae8ec5d763f404.png](assets/sdd-c4c7e01f8ccad48a/bae12a43c735e3502434f1ba6c4c5f512dcf30912f3fb5a453ae8ec5d763f404.png)

#### Adjustment types and configurable controls

A two-column type list groups reasons including damage, cycle-count variance, receiving/shipping errors, donation and transfer, with Transfer and Transfer with Work distinct. The edit window shows adjustment classes, quantity limits, initiation by item/location or LP, Create work and frozen-location/interface options, plus user and warehouse access tabs.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. The list is a historical example, not a required complete reason-code vocabulary. Clipped labels and example limits are not reconstructed.

[sdd-c4c7e01f8ccad48a b00940, b00943, b00947, b00949, b00951, b00952, b00954](reading/sdd-c4c7e01f8ccad48a.md#b00940)

Assets: [1c6b7a77ed511b5d7b1b2ae8ca8cbb5da7beaf83f7061d687505021027c5da90.png](assets/sdd-c4c7e01f8ccad48a/1c6b7a77ed511b5d7b1b2ae8ca8cbb5da7beaf83f7061d687505021027c5da90.png); [ea9972553149942af9ecb4046ebb01fcfae4e60b8ead9738b83d319f909d8eda.png](assets/sdd-c4c7e01f8ccad48a/ea9972553149942af9ecb4046ebb01fcfae4e60b8ead9738b83d319f909d8eda.png)

#### Manual inventory adjustor warning and inventory buckets

A prominent warning says this random-adjustment utility should not be used in production because storage and adjusted quantity can be unpredictable. Below it are item/warehouse/company/location/LP inputs, inventory totals and a detail grid with on-hand, in-transit, suspect and available quantities.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. The adjacent prose describing supervisor use conflicts with the warning. No use of this tool is recommended or performed.

[sdd-c4c7e01f8ccad48a b00958, b00960, b00961](reading/sdd-c4c7e01f8ccad48a.md#b00958)

Assets: [7e649f94dd960e398ce9b2ded971faa2b52877559a629d390f7317382bc18fb7.png](assets/sdd-c4c7e01f8ccad48a/7e649f94dd960e398ce9b2ded971faa2b52877559a629d390f7317382bc18fb7.png)

#### Transfer work selection and confirmation

The composite image connects work-profile selection to a system-directed location prompt, a pick confirmation with check-digit input and a putaway confirmation with LP input. Blue arrows show the intended sequence.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. The visible check-digit example is not proof that Covetrus enables check digits; its assumptions say otherwise.

[sdd-c4c7e01f8ccad48a b00967, b00969, b00975, b00976](reading/sdd-c4c7e01f8ccad48a.md#b00967)

Assets: [8c6868d08ef423e49e3e6567cbeb7ca87daaa678038d9d02d1dcaf35b894375d.png](assets/sdd-c4c7e01f8ccad48a/8c6868d08ef423e49e3e6567cbeb7ca87daaa678038d9d02d1dcaf35b894375d.png)

#### Mobile location inquiry and lot records

The first image offers a location, item or LP search. The next shows result one of two with location, item, lot, status and on-hand quantity/UOM. The final image shows the other lot record with Adjust, Status change, Transfer, Previous record and Cancel actions.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Example lots and quantities are excluded; the record does not establish physical inventory.

[sdd-c4c7e01f8ccad48a b00995, b00996, b00997, b00999, b01000, b01002, b01003](reading/sdd-c4c7e01f8ccad48a.md#b00995)

Assets: [2a62082ad1b5f9dce2a17c297236bf277b95cbdd6e200bc04ded9bb00a1592d2.png](assets/sdd-c4c7e01f8ccad48a/2a62082ad1b5f9dce2a17c297236bf277b95cbdd6e200bc04ded9bb00a1592d2.png); [35f8f86873fd8fef657ee0558cfb145f54da9ab94c03143a2ad71378369c6a10.png](assets/sdd-c4c7e01f8ccad48a/35f8f86873fd8fef657ee0558cfb145f54da9ab94c03143a2ad71378369c6a10.png); [7692f0e664a3d4208f271a9562c77366e0ea60fbfeb32d8f915bac6f10b364f6.png](assets/sdd-c4c7e01f8ccad48a/7692f0e664a3d4208f271a9562c77366e0ea60fbfeb32d8f915bac6f10b364f6.png)

#### Cycle-count review and reconciliation forms

Cycle Count Request insight shows a Pending Review row with system/count quantities and Reconcile selected. The reconciliation form has a Set on-hand quantity to field, UOM and count/item/lot/location/LP context, with Reconcile inactive in the pictured incomplete form.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. No final reconciliation or inventory update is shown.

[sdd-c4c7e01f8ccad48a b01062, b01064, b01066, b01068, b01069, b01070, b01071, b01073](reading/sdd-c4c7e01f8ccad48a.md#b01062)

Assets: [9a3850b427468284776cc673880614422f39b57e98a97d13ba5c8537ebe97cd2.png](assets/sdd-c4c7e01f8ccad48a/9a3850b427468284776cc673880614422f39b57e98a97d13ba5c8537ebe97cd2.png); [fe82fc56e55b19969d83eace3633b5e5064388b83997789e810ff2d78e9332b0.png](assets/sdd-c4c7e01f8ccad48a/fe82fc56e55b19969d83eace3633b5e5064388b83997789e810ff2d78e9332b0.png)

#### Mobile reconciliation menu and quantity entry

The menu highlights Cycle count reconciliation. Its entry form shows location, item/company, counted quantity and an on-hand quantity input with UOM and Go. The two images illustrate access and entry, without a success result.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified.

[sdd-c4c7e01f8ccad48a b01075, b01078, b01079, b01081, b01082](reading/sdd-c4c7e01f8ccad48a.md#b01075)

Assets: [546cf4bd88694be669efa009dc07234f35f5c17e2162d891d24a3fd11a435640.png](assets/sdd-c4c7e01f8ccad48a/546cf4bd88694be669efa009dc07234f35f5c17e2162d891d24a3fd11a435640.png); [e09a2748b88117639d82a75226663b7d1ddb2c3864958a209e94f560a8cd1c5e.png](assets/sdd-c4c7e01f8ccad48a/e09a2748b88117639d82a75226663b7d1ddb2c3864958a209e94f560a8cd1c5e.png)

#### Replenishment master demand and work options

The master form shows location-capacity, top-off, pool/wave/RF-demand alternatives, with Demand from wave selected in this example. Priority, allocation rule, replenishment increment and automatic/manual work creation appear beside excess-demand and clear-reserve-location options.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Pictured selections are illustrative; the design text and increment conflicts govern the bounded summary.

[sdd-c4c7e01f8ccad48a b01087, b01088, b01090, b01091](reading/sdd-c4c7e01f8ccad48a.md#b01087)

Assets: [cf7bf26ea15c71e74a20614da8137f162c47c673aa3a10701b9f0896a8ae5c2d.png](assets/sdd-c4c7e01f8ccad48a/cf7bf26ea15c71e74a20614da8137f162c47c673aa3a10701b9f0896a8ae5c2d.png)

#### Manual replenishment selection

Inventory insight highlights Manual replenishment under Actions. The next form lists a selected replenishment master and provides Cancel and Replenish. It shows selection before execution, not completed work creation.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified.

[sdd-c4c7e01f8ccad48a b01114, b01116, b01117, b01119, b01120, b01123, b01125](reading/sdd-c4c7e01f8ccad48a.md#b01114)

Assets: [8bf5505e965bf79fb4e51221a692ff79aacdd06fea3836895d297a594274c359.png](assets/sdd-c4c7e01f8ccad48a/8bf5505e965bf79fb4e51221a692ff79aacdd06fea3836895d297a594274c359.png); [d59a694b4bf1f838a2261973c67c2f4d48cc13290c27643e11702001330d4caa.png](assets/sdd-c4c7e01f8ccad48a/d59a694b4bf1f838a2261973c67c2f4d48cc13290c27643e11702001330d4caa.png)

#### Item-location capacity and replenishment thresholds

The edit form includes maximum quantity/UOM, a location-type or individual-location choice and warehouse. The threshold area contains minimum replenishment percentage, top-off threshold and maximum replenishment fill percentage.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Example numbers are not active settings; real-time replenishment is excluded from go-live in the adjoining prose.

[sdd-c4c7e01f8ccad48a b01131, b01133, b01135, b01136, b01139](reading/sdd-c4c7e01f8ccad48a.md#b01131)

Assets: [0ae38c4b32a19b735a7b4e03ba8a5e7b6745af5579b043820883932b8048529e.png](assets/sdd-c4c7e01f8ccad48a/0ae38c4b32a19b735a7b4e03ba8a5e7b6745af5579b043820883932b8048529e.png)

#### Hi/Low replenishment filters and sorting

The Hi and Low criteria images select the Replenishment request table and show warehouse, source-work-zone and replenishment-mode filters. The separate Hi Order by tab lists ascending attributes and Create work unit flags. Some attribute/filter text is clipped.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Do not reconstruct clipped SQL or field names or promote warehouse examples to current configuration.

[sdd-c4c7e01f8ccad48a b01163, b01165, b01167, b01168, b01171, b01172, b01174, b01175](reading/sdd-c4c7e01f8ccad48a.md#b01163)

Assets: [2fe4d7243828d598fef93998f8f455e2dd144b2780d156bb5188396fa551d6c9.png](assets/sdd-c4c7e01f8ccad48a/2fe4d7243828d598fef93998f8f455e2dd144b2780d156bb5188396fa551d6c9.png); [7789c397be1c2048ff847d6eea4c9214d06db5049aed59360a317c8961723639.png](assets/sdd-c4c7e01f8ccad48a/7789c397be1c2048ff847d6eea4c9214d06db5049aed59360a317c8961723639.png); [e2125b8823eb0eec8b59b19256c85c93eff7630cf9ff4f01bf32961efcafd672.png](assets/sdd-c4c7e01f8ccad48a/e2125b8823eb0eec8b59b19256c85c93eff7630cf9ff4f01bf32961efcafd672.png)

#### Replenishment mobile pick and putaway example

A composite sequence moves from profile selection to system-directed location, pick confirmation and putaway confirmation. Both confirmation screens show location, item, quantity/UOM and highlighted check-digit entry.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. This generic illustration coexists with Covetrus assumptions excluding location check digits; it does not settle the effective mode.

[sdd-c4c7e01f8ccad48a b01182, b01184, b01185, b01186](reading/sdd-c4c7e01f8ccad48a.md#b01182)

Assets: [d85a748dba1904c2b0ec1613f2c65e556d1e69e99f8e0047f0ab502f29baca7c.png](assets/sdd-c4c7e01f8ccad48a/d85a748dba1904c2b0ec1613f2c65e556d1e69e99f8e0047f0ab502f29baca7c.png)

#### Planned-shipment filters and pool results

The first example groups rows by scheduled ship date and displays shipment/line/unit totals. The later example adds cold-chain, HAZMAT and pharmacy-eligibility columns with in-pool filters and a selected shipment. Both show pool selection, not successful waving.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Customer, account, shipment, warehouse and date examples are excluded.

[sdd-c4c7e01f8ccad48a b01250, b01252, b01253, b01323, b01325, b01326, b01327](reading/sdd-c4c7e01f8ccad48a.md#b01250)

Assets: [1055765b063ab8dbfc45b0c5f11b47c0e57dbe0739115f8a933271fc99c16d49.png](assets/sdd-c4c7e01f8ccad48a/1055765b063ab8dbfc45b0c5f11b47c0e57dbe0739115f8a933271fc99c16d49.png); [611c94a15e1737652b1d6ad673db30781b875a8e76119dce8e6cf1ca1d3f9988.png](assets/sdd-c4c7e01f8ccad48a/611c94a15e1737652b1d6ad673db30781b875a8e76119dce8e6cf1ca1d3f9988.png)

#### Ordered wave-flow steps and custom overrides

Twelve individually inspected strips show an ordered flow beginning Start Wave and statistics, interleaving ODWS entries with consolidation, replenishment, allocation, container creation, QC/VAS assignment, pallet/load building, dock assignment and work creation, then labor planning, paperwork and Complete Wave. Some ODWS descriptions are truncated.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Each strip contributes a different visible span of the same flow. Sequence labels establish the pictured order only; clipped custom names and implementation contracts are not guessed.

[sdd-c4c7e01f8ccad48a b01284, b01285, b01286, b01287, b01288, b01289, b01290, b01291, b01292, b01293, b01294, b01295](reading/sdd-c4c7e01f8ccad48a.md#b01284)

Assets: [091bb7e481a3c8b531d2815c9ca07ba5d2747c55f637ae01060a84073252762e.png](assets/sdd-c4c7e01f8ccad48a/091bb7e481a3c8b531d2815c9ca07ba5d2747c55f637ae01060a84073252762e.png); [575a469fb1c8687e3a365cf3b06af87ab8eb890bd6d0002ae81f499bc1ea2d31.png](assets/sdd-c4c7e01f8ccad48a/575a469fb1c8687e3a365cf3b06af87ab8eb890bd6d0002ae81f499bc1ea2d31.png); [7c4e6b48586135cc2be52d8091cab8e76a9b0136dfe8ca1875f368c1e7d67236.png](assets/sdd-c4c7e01f8ccad48a/7c4e6b48586135cc2be52d8091cab8e76a9b0136dfe8ca1875f368c1e7d67236.png); [83a0d369fc3b5e0a1d80accc3658c725f18ed97a2700948b664d370fcebcd852.png](assets/sdd-c4c7e01f8ccad48a/83a0d369fc3b5e0a1d80accc3658c725f18ed97a2700948b664d370fcebcd852.png); [8a7034b50bb98a17969ec0e244bcf94caa98effd306e668aeb9dc40477909919.png](assets/sdd-c4c7e01f8ccad48a/8a7034b50bb98a17969ec0e244bcf94caa98effd306e668aeb9dc40477909919.png); [9db81c5fa71d75efd0058da278710b83f5229dde1bcb84fa204cf168d3febf6f.png](assets/sdd-c4c7e01f8ccad48a/9db81c5fa71d75efd0058da278710b83f5229dde1bcb84fa204cf168d3febf6f.png); [a04a3a9d0e1d7df77862f5e5f26a593b1102aa20d117d476dad2c8cf77e82915.png](assets/sdd-c4c7e01f8ccad48a/a04a3a9d0e1d7df77862f5e5f26a593b1102aa20d117d476dad2c8cf77e82915.png); [a87c1a3a4dea276dae979e853edfb2a85de19318dd9d6f0f708436a571699150.png](assets/sdd-c4c7e01f8ccad48a/a87c1a3a4dea276dae979e853edfb2a85de19318dd9d6f0f708436a571699150.png); [ab372da1fa29aecdab118a8bc22b597a8fed168a206b79cd985a820b2d2ee883.png](assets/sdd-c4c7e01f8ccad48a/ab372da1fa29aecdab118a8bc22b597a8fed168a206b79cd985a820b2d2ee883.png); [d31b545a6e84cf268d5b679cee99ec9603d66056ee119042218668090be1c444.png](assets/sdd-c4c7e01f8ccad48a/d31b545a6e84cf268d5b679cee99ec9603d66056ee119042218668090be1c444.png); [e25bfc0e8d3af3ea09d1072ea328d8187455c5d9ae64c1658e33fc9ca3939781.png](assets/sdd-c4c7e01f8ccad48a/e25bfc0e8d3af3ea09d1072ea328d8187455c5d9ae64c1658e33fc9ca3939781.png); [f8bcd0b797d8617faa1c2c1b4ba0761cdfb7e069f7893a75f2e9cf6ed922bdce.png](assets/sdd-c4c7e01f8ccad48a/f8bcd0b797d8617faa1c2c1b4ba0761cdfb7e069f7893a75f2e9cf6ed922bdce.png)

#### Wave-master tabs and access choices

General shows Manual mode, flow/criteria references, Auto release unchecked and Maintain allocated replenishments upon wave cancellation checked in the example. Selection criteria shows container, labor, pallet and paperwork references. Warehouses shows All or List access with one sample warehouse selected.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Illustrative checked controls are not inferred as effective values outside this pictured master; no retention behavior is established from the checkbox alone.

[sdd-c4c7e01f8ccad48a b01299, b01300, b01302, b01303, b01309, b01310, b01312, b01332](reading/sdd-c4c7e01f8ccad48a.md#b01299)

Assets: [4ac72580e3c937679882afbf6e16bb036138c112dd8aaf565408971a6ce003d8.png](assets/sdd-c4c7e01f8ccad48a/4ac72580e3c937679882afbf6e16bb036138c112dd8aaf565408971a6ce003d8.png); [5ef6009cefd11f5d81635b4bc672501bacc4f26b9d5a7e3bc637ddfccb60450c.png](assets/sdd-c4c7e01f8ccad48a/5ef6009cefd11f5d81635b4bc672501bacc4f26b9d5a7e3bc637ddfccb60450c.png); [7b28bce9c391fa0d225639817d8b78acedc57320b3f4f1e3a24fed2d71221d97.png](assets/sdd-c4c7e01f8ccad48a/7b28bce9c391fa0d225639817d8b78acedc57320b3f4f1e3a24fed2d71221d97.png)

#### Add shipment to existing or new wave

The Add shipment to wave form has an empty existing-wave list, New wave and Save actions, and ship-to/reference sections. It supports the surrounding description of choosing an existing open wave or creating a new one.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. The blank list does not prove that no open wave exists in another warehouse or current deployment.

[sdd-c4c7e01f8ccad48a b01323, b01325, b01329, b01330](reading/sdd-c4c7e01f8ccad48a.md#b01323)

Assets: [b611fa9125b93e79fc3ebf813057e9c6be1a945db9bd6be5b7b321ce2e0f1241.png](assets/sdd-c4c7e01f8ccad48a/b611fa9125b93e79fc3ebf813057e9c6be1a945db9bd6be5b7b321ce2e0f1241.png)

#### Wave run action and active filter

Wave insight has Show active waves enabled, an active row selected and Run/Run select printers highlighted in Actions. This is the action-selection stage; it does not show a completed or successful run.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified.

[sdd-c4c7e01f8ccad48a b01340, b01342, b01343, b01345](reading/sdd-c4c7e01f8ccad48a.md#b01340)

Assets: [26894f8005ccc23f172dabf55a8ed74e5ee8fdc58215c639723fe63c39fe943d.png](assets/sdd-c4c7e01f8ccad48a/26894f8005ccc23f172dabf55a8ed74e5ee8fdc58215c639723fe63c39fe943d.png)

#### Cancel wave and destination options

The first Wave insight image highlights Cancel for a selected completed wave. The subsequent Cancel wave form offers Return to pool and Add to wave for the listed wave shipments. These are distinct cancellation destinations, not a captured final result.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified.

[sdd-c4c7e01f8ccad48a b01581, b01583, b01584, b01585, b01587, b01588](reading/sdd-c4c7e01f8ccad48a.md#b01581)

Assets: [4a17ba850b2acf16e3608b559a1b1d32ec0913e3fa0e7fddc5aa661080842bf4.png](assets/sdd-c4c7e01f8ccad48a/4a17ba850b2acf16e3608b559a1b1d32ec0913e3fa0e7fddc5aa661080842bf4.png); [daf670eb5c03d1c13180739ec92b20ecbadb5e3c314df59c79f97cb37cc058fe.png](assets/sdd-c4c7e01f8ccad48a/daf670eb5c03d1c13180739ec92b20ecbadb5e3c314df59c79f97cb37cc058fe.png)

#### Release and reprint actions

One completed-wave example highlights Release. Another highlights Reprint documents and Reprint labels in the same Actions menu. The pictures distinguish releasing work from requesting replacement paperwork.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Static controls do not show release completion, print delivery or configured printer ownership.

[sdd-c4c7e01f8ccad48a b01594, b01595, b01596, b01598, b01599, b01611, b01614, b01615](reading/sdd-c4c7e01f8ccad48a.md#b01594)

Assets: [58070538af4e5170c9c4d1c04f3940e8a6a7f5b6a090ab4a25df82ffe3f09f8f.png](assets/sdd-c4c7e01f8ccad48a/58070538af4e5170c9c4d1c04f3940e8a6a7f5b6a090ab4a25df82ffe3f09f8f.png); [731df324899deec0ef5d641a6140a5e02c7a3b59f30ae4366eda5682206d9c26.png](assets/sdd-c4c7e01f8ccad48a/731df324899deec0ef5d641a6140a5e02c7a3b59f30ae4366eda5682206d9c26.png)

#### Work detail versus work-group summary

Work insight shows searchable work attributes and header/detail rows grouped by work unit, with open and picked quantity totals. Work monitoring groups open work in a bar chart and displays work-unit, instruction, estimated-time, in-process and recent-close measures alongside risk, priority and hold indicators.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Sample counts and zero estimates are not workload or performance evidence for the assessed environment.

[sdd-c4c7e01f8ccad48a b01632, b01634, b01635, b01637, b01638](reading/sdd-c4c7e01f8ccad48a.md#b01632)

Assets: [4f37a3e32bc15ee71328a858879de13032cdbd9bec36451d1683a099983e5ab5.png](assets/sdd-c4c7e01f8ccad48a/4f37a3e32bc15ee71328a858879de13032cdbd9bec36451d1683a099983e5ab5.png); [5a5f5693128d6ec74d861d979364f2cf1d2a9ee1a9594564a70f8bc4b5e17cc4.png](assets/sdd-c4c7e01f8ccad48a/5a5f5693128d6ec74d861d979364f2cf1d2a9ee1a9594564a70f8bc4b5e17cc4.png)

#### Full-pallet profile and confirmation sequence

Six images show the pallet profile choice, user-directed work-unit entry, then location, item and quantity confirmation. The quantity image includes a wait overlay; the last returns to work-unit entry with a Pick successful banner.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. The pictured success is historical illustration, not execution or acceptance in this assessment.

[sdd-c4c7e01f8ccad48a b01663, b01665, b01667, b01668, b01670, b01671, b01674, b01675, b01677, b01678, b01680, b01681, b01683, b01684](reading/sdd-c4c7e01f8ccad48a.md#b01663)

Assets: [4adf565506623a939d30e6da4dff77d785cba121d15370b6ceccf0738b6eb3c2.png](assets/sdd-c4c7e01f8ccad48a/4adf565506623a939d30e6da4dff77d785cba121d15370b6ceccf0738b6eb3c2.png); [6004836e68fb97eecdf627e8c920c25632f777069ab493093bd955109f752bad.png](assets/sdd-c4c7e01f8ccad48a/6004836e68fb97eecdf627e8c920c25632f777069ab493093bd955109f752bad.png); [b4ab819b2af7c4907a7a403d364808ef64bd7bc72ad925ff8c3c08af358ca4f2.png](assets/sdd-c4c7e01f8ccad48a/b4ab819b2af7c4907a7a403d364808ef64bd7bc72ad925ff8c3c08af358ca4f2.png); [bb5b7fc2f11fa05edc00440b9a998820a18676f0c7c5d979d4c2c819c78072b9.png](assets/sdd-c4c7e01f8ccad48a/bb5b7fc2f11fa05edc00440b9a998820a18676f0c7c5d979d4c2c819c78072b9.png); [d4582885797cb11b676f936ab0788718ecf5bf7d14905f54e4d2534b9c7cdc8c.png](assets/sdd-c4c7e01f8ccad48a/d4582885797cb11b676f936ab0788718ecf5bf7d14905f54e4d2534b9c7cdc8c.png); [ea64a77b700ca32e044fd71b9c8ced4e4a025b1541d75049f98e85396acadca6.png](assets/sdd-c4c7e01f8ccad48a/ea64a77b700ca32e044fd71b9c8ced4e4a025b1541d75049f98e85396acadca6.png)

#### Pick-and-pass work selection and zone actions

Seven images show profile selection, container work-unit entry, location validation, item validation and quantity input. The next image displays a last-item-picked banner and a subsequent location; the final image opens Pass, Short pick and Skip while further work remains visible.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. The caption calls the last image zone complete; the screenshot itself shows an action menu, not proof that all shipment work is complete.

[sdd-c4c7e01f8ccad48a b01718, b01720, b01721, b01722, b01723, b01725, b01726, b01727, b01728, b01730, b01731, b01733, b01734, b01736, b01737, b01739](reading/sdd-c4c7e01f8ccad48a.md#b01718)

Assets: [05eb3b7d962a8a7c286f673190e4eaf98692ecb4d17032481694ff8d1938ac39.png](assets/sdd-c4c7e01f8ccad48a/05eb3b7d962a8a7c286f673190e4eaf98692ecb4d17032481694ff8d1938ac39.png); [160d7a47a84af9ab13a21d0839a9c38a3935746130891d0e36d0a66627cdc6c3.png](assets/sdd-c4c7e01f8ccad48a/160d7a47a84af9ab13a21d0839a9c38a3935746130891d0e36d0a66627cdc6c3.png); [3d558e8ba8af49a10393ef585c2448ae9d5b80c70fcfa9d53971888d3270029c.png](assets/sdd-c4c7e01f8ccad48a/3d558e8ba8af49a10393ef585c2448ae9d5b80c70fcfa9d53971888d3270029c.png); [46b2107e48e51bf8f1d6ca5529d7053060c61457cb1538d6387dd8d160a2f58b.png](assets/sdd-c4c7e01f8ccad48a/46b2107e48e51bf8f1d6ca5529d7053060c61457cb1538d6387dd8d160a2f58b.png); [57a1bbd955e4fef0c3411f1643179ab5fb0cdea2813bcc4f84c0b18180676b44.png](assets/sdd-c4c7e01f8ccad48a/57a1bbd955e4fef0c3411f1643179ab5fb0cdea2813bcc4f84c0b18180676b44.png); [67d4ce5f46eb5c7c7d55a9e6c97805b4f4cea388a744093d70d85f6d30aa56f4.png](assets/sdd-c4c7e01f8ccad48a/67d4ce5f46eb5c7c7d55a9e6c97805b4f4cea388a744093d70d85f6d30aa56f4.png); [a3701025267e9612f7b050d40b25f17021db9aa160f8a002cb6ee827b3e17376.png](assets/sdd-c4c7e01f8ccad48a/a3701025267e9612f7b050d40b25f17021db9aa160f8a002cb6ee827b3e17376.png)

#### Cart container assignment and confirmation

Four images alternate container-ID entry with success banners assigning the first and second spots. They show that each scanned container is assigned a cart position before picking begins.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Pictured container dimensions, IDs and spot count are examples rather than a cart-capacity standard.

[sdd-c4c7e01f8ccad48a b01757, b01759, b01771, b01772, b01775, b01776, b01778, b01779, b01781, b01782](reading/sdd-c4c7e01f8ccad48a.md#b01757)

Assets: [456b4830f42b4c4e41e745fed5d8d1a6ed54fb43ac529fd93f8418ad50fe440e.png](assets/sdd-c4c7e01f8ccad48a/456b4830f42b4c4e41e745fed5d8d1a6ed54fb43ac529fd93f8418ad50fe440e.png); [8f1a3fdaca5bbcc8b78337709555f2b6d63bb3f6316ca8842793a945a1e7f075.png](assets/sdd-c4c7e01f8ccad48a/8f1a3fdaca5bbcc8b78337709555f2b6d63bb3f6316ca8842793a945a1e7f075.png); [c795986bd49de0b790cc9deea6df37b5f8dafba1aeddcb1bb785a8479f6ed06d.png](assets/sdd-c4c7e01f8ccad48a/c795986bd49de0b790cc9deea6df37b5f8dafba1aeddcb1bb785a8479f6ed06d.png); [f41afc36ed85e2ef3fcfb5e4a72faf02bc9a06cd628a53d98e63aa19170150c0.png](assets/sdd-c4c7e01f8ccad48a/f41afc36ed85e2ef3fcfb5e4a72faf02bc9a06cd628a53d98e63aa19170150c0.png)

#### Cart pick confirmation and destination distribution

The first image highlights item validation with a specific container. The next highlights that container for confirmation. A later pick displays Multiple for container and spot; the following Cart container putaway screen requests a particular destination container and shows its spot and quantity.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. The images show successive entry contexts, not an end-to-end quantity or inventory reconciliation.

[sdd-c4c7e01f8ccad48a b01761, b01767, b01786, b01787, b01789, b01790, b01792, b01793, b01798, b01799](reading/sdd-c4c7e01f8ccad48a.md#b01761)

Assets: [019805c6daffad070544185cba488618485b26a111230aba5c4e6f2ee5807ba8.png](assets/sdd-c4c7e01f8ccad48a/019805c6daffad070544185cba488618485b26a111230aba5c4e6f2ee5807ba8.png); [16deded81f6fa2f979423c81b7df6558856638dadd464c6659a448ad30ad3d8d.png](assets/sdd-c4c7e01f8ccad48a/16deded81f6fa2f979423c81b7df6558856638dadd464c6659a448ad30ad3d8d.png); [6dd7846b95e4e46c06344ed9ff5d7fd963b836ce93f3da018b2cb6dde85cf96e.png](assets/sdd-c4c7e01f8ccad48a/6dd7846b95e4e46c06344ed9ff5d7fd963b836ce93f3da018b2cb6dde85cf96e.png); [71677b55a84e3119dd7662f4ab1b5a5587b670fbd09e57dc7bc4364d011692dc.png](assets/sdd-c4c7e01f8ccad48a/71677b55a84e3119dd7662f4ab1b5a5587b670fbd09e57dc7bc4364d011692dc.png)

#### Alternate cart-pick visual reference

The composite starts with Begin picks, proceeds through check-digit and spot confirmation, shows a multiple-container pick distributed into two cart spots, and ends at a putaway-location prompt. Arrows connect the stages.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. This is explicitly an alternate visual reference; its putaway prompt and check digits must not overwrite the nearby Covetrus automatic-putaway and no-check-digit choices.

[sdd-c4c7e01f8ccad48a b01769, b01801, b01803, b01804](reading/sdd-c4c7e01f8ccad48a.md#b01769)

Assets: [972f6f9bfa220b32ee0a202bc71ef7c7a447aeb306325903e0b16225d1a9af56.png](assets/sdd-c4c7e01f8ccad48a/972f6f9bfa220b32ee0a202bc71ef7c7a447aeb306325903e0b16225d1a9af56.png)

#### Bulk-pick work-unit entry

The user-directed screen selects a bulk work profile and provides a work-unit input with Go. A partial wait overlay is visible. It illustrates work initiation only.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. No completed bulk pick, effective work-unit format or measured response time is shown.

[sdd-c4c7e01f8ccad48a b01816, b01818, b01819, b01835](reading/sdd-c4c7e01f8ccad48a.md#b01816)

Assets: [a885f62e853944a8ce52de1734ed4e4255779bc506fb5c161e9ae2606f663e61.png](assets/sdd-c4c7e01f8ccad48a/a885f62e853944a8ce52de1734ed4e4255779bc506fb5c161e9ae2606f663e61.png)

#### Pharmacy VAS instruction and confirmation

The first two VAS insight images display a selected activity with instructions, status and QC-required columns; the second points to Confirm. The final view has no matching rows and a VAS activity confirmation successful banner while Include confirmed activities is off.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Clipped activity instructions are not reconstructed. Disappearance from this filter is not proof that the activity record was deleted.

[sdd-c4c7e01f8ccad48a b01876, b01878, b01880, b01881, b01882, b01884, b01885, b01886, b01887](reading/sdd-c4c7e01f8ccad48a.md#b01876)

Assets: [126d6405d914f560446f073d3802ebb65e8e3072978dce2e468446db5d2fecde.png](assets/sdd-c4c7e01f8ccad48a/126d6405d914f560446f073d3802ebb65e8e3072978dce2e468446db5d2fecde.png); [c9663f925104c880225ef332221d328d711fd441d121952d1c966b3b3f2efe07.png](assets/sdd-c4c7e01f8ccad48a/c9663f925104c880225ef332221d328d711fd441d121952d1c966b3b3f2efe07.png); [fa5b5e8b10f18c5e0a4c9b2051419f80ed9e781e8fcd88368d47e9838014dde4.png](assets/sdd-c4c7e01f8ccad48a/fa5b5e8b10f18c5e0a4c9b2051419f80ed9e781e8fcd88368d47e9838014dde4.png)

#### Force-QC confirmation and process-history evidence

The QC workbench image asks whether to pass QC for the container. The next displays a passed-QC message. The history image records QC Confirmation with Force QC Pass actions, distinguishing this example from a normal successful scan/count match.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. The force-pass result does not establish matching counted and packed quantities or observed physical inspection; sample identifiers and timestamps are excluded.

[sdd-c4c7e01f8ccad48a b01891, b01893, b01898, b01903, b01908, b01910, b01912, b01913](reading/sdd-c4c7e01f8ccad48a.md#b01891)

Assets: [3abf4230c9250a7fe9cda6092431f4eedc84da0f57b6465398c2b4d9e46496cb.png](assets/sdd-c4c7e01f8ccad48a/3abf4230c9250a7fe9cda6092431f4eedc84da0f57b6465398c2b4d9e46496cb.png); [c44f97a28e0b5262c02cb6188ddf5fbfcf9f35832dd323ed06e6ce773a42ca61.png](assets/sdd-c4c7e01f8ccad48a/c44f97a28e0b5262c02cb6188ddf5fbfcf9f35832dd323ed06e6ce773a42ca61.png); [c6dfc02569ca535a91cb3bcb5da8c733496e6932aff88c29c19eb1573c81d9bb.png](assets/sdd-c4c7e01f8ccad48a/c6dfc02569ca535a91cb3bcb5da8c733496e6932aff88c29c19eb1573c81d9bb.png)

#### Close-container weight and shipment lookup

The close form shows container ID and weight with container-information sections. Two Shipping Container Insight images show shipment-filtered container rows; the second highlights Close in Actions. This provides an alternate selection route when the container cannot be scanned.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Visible menu actions do not prove authorization or eligibility, and example weight is not a validated scale reading.

[sdd-c4c7e01f8ccad48a b01919, b01939, b01940, b01948, b01949, b01950, b01952, b01953, b01955](reading/sdd-c4c7e01f8ccad48a.md#b01919)

Assets: [3e68bb7624a0cae05eab13f75b58dd4508e45f3e3bfa0615e9efb726547c339c.png](assets/sdd-c4c7e01f8ccad48a/3e68bb7624a0cae05eab13f75b58dd4508e45f3e3bfa0615e9efb726547c339c.png); [7f18a0c91ce7bc217e9cf5fcc02e1a55a642af0db42c55abebc7a3f3a9f1f484.png](assets/sdd-c4c7e01f8ccad48a/7f18a0c91ce7bc217e9cf5fcc02e1a55a642af0db42c55abebc7a3f3a9f1f484.png); [c6e2d4d6ed615f1af63ce08d8ca4c7895a804612f218b2918c294a9ae6422174.png](assets/sdd-c4c7e01f8ccad48a/c6e2d4d6ed615f1af63ce08d8ca4c7895a804612f218b2918c294a9ae6422174.png)

#### Transfer shipment and create destination load

Shipment insight highlights Transfer shipment. The next form requests a destination load and highlights New. A Shipping Load form then exposes carrier, route, seal, trailer, dock door, PRO and bill-of-lading fields plus Save.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. The last caption refers to destination selection, while the image is the new-load form. It does not show a saved load or completed transfer.

[sdd-c4c7e01f8ccad48a b01962, b01964, b01966, b01967, b01970, b01971, b01972, b01973, b01975, b01976](reading/sdd-c4c7e01f8ccad48a.md#b01962)

Assets: [0a04efcf9504424234a2e020c2eb6c60eaaf0b31ebffeb0b9e8ffc468235234f.png](assets/sdd-c4c7e01f8ccad48a/0a04efcf9504424234a2e020c2eb6c60eaaf0b31ebffeb0b9e8ffc468235234f.png); [69504326c0819f9644e7e16da76b25141df118c391e1a42a0abb7d049202c65c.png](assets/sdd-c4c7e01f8ccad48a/69504326c0819f9644e7e16da76b25141df118c391e1a42a0abb7d049202c65c.png); [717e47dbc1e192cc93ea9f6044525f462fe9bbe254fb1066e83ea57b57a00755.png](assets/sdd-c4c7e01f8ccad48a/717e47dbc1e192cc93ea9f6044525f462fe9bbe254fb1066e83ea57b57a00755.png)

#### Manifest inquiry filters and statuses

Manifest insight displays manifest/open/closed totals, name/rating/warehouse filters, include-open/closed/transmission-file toggles, and result columns for rating, shipper, manifest status, ship date and transmit status. Two FedEx rating examples are visible.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Visible FedEx rows do not establish enabled FedEx actions or settle the surrounding end-of-day processing conflict.

[sdd-c4c7e01f8ccad48a b02057, b02061, b02063, b02064](reading/sdd-c4c7e01f8ccad48a.md#b02057)

Assets: [7908c0bfde87aa141a6bd917c6e756fded94159393ffa4dc2a39c81b3314cb1e.png](assets/sdd-c4c7e01f8ccad48a/7908c0bfde87aa141a6bd917c6e756fded94159393ffa4dc2a39c81b3314cb1e.png)

#### Manhattan Associates front-matter mark

The image is the blue Manhattan Associates wordmark and stylized logo on white, with no process or configuration instructions.

Limit: Covetrus Manhattan Active SCALE implementation design version 1.4, modified 31 August 2023. This is a named implementation example, not the assessed deployment, a universal product guarantee, a verified Insight SOP or runtime acceptance. Retained images individually inspected; full DOCX pagination and actual screen behavior unverified. Identity decoration only.

[sdd-c4c7e01f8ccad48a b00029](reading/sdd-c4c7e01f8ccad48a.md#b00029)

Assets: [c27fca898f7a8776347a1500194ba89d2f4a60747070dbfc895a07b375f0eb55.jpg](assets/sdd-c4c7e01f8ccad48a/c27fca898f7a8776347a1500194ba89d2f4a60747070dbfc895a07b375f0eb55.jpg)

#### HADDAD cover artwork

Three decorative assets: a dark-blue/red geometric background, a very pale Manhattan Associates wordmark, and a Haddad Brands logo. They carry branding rather than configuration settings.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00001](reading/sdd-f46806ef53e15f07.md#b00001)

Assets: [11631ed8c40fc8be756826bc0717a83b5d19f8c4d9a3b6318152e4cf70de2c48.jpg](assets/sdd-f46806ef53e15f07/11631ed8c40fc8be756826bc0717a83b5d19f8c4d9a3b6318152e4cf70de2c48.jpg); [12e15793ec5827c2cf63e56303ac7731a81e657f73bbc3c32ed45f01e587ea69.emf](assets/sdd-f46806ef53e15f07/12e15793ec5827c2cf63e56303ac7731a81e657f73bbc3c32ed45f01e587ea69.emf); [e645ad8397a54221545029a997423c5d14577f0742206a3cf0325e196fda033e.jpeg](assets/sdd-f46806ef53e15f07/e645ad8397a54221545029a997423c5d14577f0742206a3cf0325e196fda033e.jpeg)

#### Configuration-flow legend symbols

Three individually inspected symbols match the adjacent KEY table: solid blue requires configuration, dotted blue denotes optional configuration, and solid green denotes related configuration. These are legend components, not standalone process rules.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00011, b00012](reading/sdd-f46806ef53e15f07.md#b00011)

Assets: [7f3022269a3670fa5a7078263c25bba04d8fe4b4f852ba70cc011a50f260a5d9.emf](assets/sdd-f46806ef53e15f07/7f3022269a3670fa5a7078263c25bba04d8fe4b4f852ba70cc011a50f260a5d9.emf); [98dcf38b82eca95e415782d5d299af7e21d0f0355b198fe6cf0e96e7ed3b24d2.emf](assets/sdd-f46806ef53e15f07/98dcf38b82eca95e415782d5d299af7e21d0f0355b198fe6cf0e96e7ed3b24d2.emf); [f1102ec71b2ebd999ad667adc7562576b643963146c90bd024e73a96406db89f.emf](assets/sdd-f46806ef53e15f07/f1102ec71b2ebd999ad667adc7562576b643963146c90bd024e73a96406db89f.emf)

#### Application and configuration context help

The application question-mark menu offers contents/index and contextual help; the configuration editor Help menu separately offers Contents and index and On Allocation rule. These navigation examples do not show a completed help lookup.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00018, b00019, b00020](reading/sdd-f46806ef53e15f07.md#b00018)

Assets: [334c30b1a2a7956b95820690e29c61a28831f96f6abe0ceb6944e3ba4480b54a.png](assets/sdd-f46806ef53e15f07/334c30b1a2a7956b95820690e29c61a28831f96f6abe0ceb6944e3ba4480b54a.png); [e9bbd1a66de0a5fe7a34c332f912a023b2841812c0d1e6a889fa3941d26665e1.png](assets/sdd-f46806ef53e15f07/e9bbd1a66de0a5fe7a34c332f912a023b2841812c0d1e6a889fa3941d26665e1.png)

#### Technical-value catalog and highlighted environment fields

The catalog includes audit, concurrency, record-limit, rendering, workflow and template-path settings. Yellow highlights mark example environment paths and server fields. Default System Language is en-US; audit of try/catch blocks is Y and audit processing is N. Sample hostnames and paths are intentionally not transcribed.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00024, b00025](reading/sdd-f46806ef53e15f07.md#b00024)

Assets: [266ae1ef49b85be74be07ea4875c8567e31f9ab44cd59d3b8d82e7bab61804a6.png](assets/sdd-f46806ef53e15f07/266ae1ef49b85be74be07ea4875c8567e31f9ab44cd59d3b8d82e7bab61804a6.png)

#### Country activation and rating fields

The country list and France editor show Active Yes / Inactive unchecked. The editor has Suppress State In Rating Yes and Suppress Postal Code In Rating No, with separate external and carrier rating symbols. The selected list row is a different country from the open editor example.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00035, b00036, b00037, b00038, b00039](reading/sdd-f46806ef53e15f07.md#b00035)

Assets: [e37e4dd4b53ddaa1951108af333007b5bfb49064dbb80af7531fb84b37a1a363.png](assets/sdd-f46806ef53e15f07/e37e4dd4b53ddaa1951108af333007b5bfb49064dbb80af7531fb84b37a1a363.png); [206620cb3611c4c35f4082902dcd53221c94daea10572eb7865975cd6c4311d1.png](assets/sdd-f46806ef53e15f07/206620cb3611c4c35f4082902dcd53221c94daea10572eb7865975cd6c4311d1.png)

#### Warehouse address and interface tabs

Two views of the same warehouse show address/time-zone fields and the Interface tab. Upload receipt lines with 0 quantity received and Upload closed receipts with 0 quantity received are checked; Split consolidated shipments on upload is unchecked. Personal, contact and address values are omitted.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00041, b00042](reading/sdd-f46806ef53e15f07.md#b00041)

Assets: [677e9d5878c51f048c3ce207cdbbe45a3d427bddd3ac4d27765b62292935ce33.png](assets/sdd-f46806ef53e15f07/677e9d5878c51f048c3ce207cdbbe45a3d427bddd3ac4d27765b62292935ce33.png); [f9fd5862d7430f865a51b22414929f4e424442486d35976104c6389a35a6fd7e.png](assets/sdd-f46806ef53e15f07/f9fd5862d7430f865a51b22414929f4e424442486d35976104c6389a35a6fd7e.png)

#### Warehouse authorization and PDF directory

The Authorized users view contains multiple checked user entries, while the Miscellaneous view provides the Rendered document pdf file directory and blank slotting fields. The directory is clipped; user names and infrastructure values are omitted.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00043, b00044](reading/sdd-f46806ef53e15f07.md#b00043)

Assets: [4dff38047428d1794a7479b7b92fc2f06a3d4727940b1695cd6657b16c832921.png](assets/sdd-f46806ef53e15f07/4dff38047428d1794a7479b7b92fc2f06a3d4727940b1695cd6657b16c832921.png); [d9d6ccafe0741ed0c92c7f9392a3f2737c6c6c3d08767c254b0d0526175188e3.png](assets/sdd-f46806ef53e15f07/d9d6ccafe0741ed0c92c7f9392a3f2737c6c6c3d08767c254b0d0526175188e3.png)

#### Company General tab

The company General tab has Availability checking checked, blank identifier-prefix fields and Inactive unchecked. This is an Edit existing example, not a creation result.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00046, b00047, b00048](reading/sdd-f46806ef53e15f07.md#b00046)

Assets: [3466880099d51df7a6c840063ac2249d4d9d1743ec5b6502f2f5d380ced058f1.png](assets/sdd-f46806ef53e15f07/3466880099d51df7a6c840063ac2249d4d9d1743ec5b6502f2f5d380ced058f1.png)

#### Company interface and assigned users

The company interface view checks both zero-quantity receipt-upload options and leaves split consolidated shipments unchecked. A separate Assigned users tab shows checked individual entries; identities are omitted.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00049, b00050](reading/sdd-f46806ef53e15f07.md#b00049)

Assets: [72057c8745fd50fbd86ec68f465d2120faa317f92e48923b66c7ab202ab2bf85.png](assets/sdd-f46806ef53e15f07/72057c8745fd50fbd86ec68f465d2120faa317f92e48923b66c7ab202ab2bf85.png); [98f6d73a908945284b43643a58c82e132f73049de5162a7fcbbac08cc3f5adb8.png](assets/sdd-f46806ef53e15f07/98f6d73a908945284b43643a58c82e132f73049de5162a7fcbbac08cc3f5adb8.png)

#### User General and Preferences tabs

The General view selects a default warehouse. The Preferences view exposes cycle-counting, packing, receiving, shipping and work-order processing preferences, default document/label printers, desktop template, RF style sheet and export directory; processing preferences and printers appear blank. Personal and payroll values are omitted.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00052, b00053, b00054](reading/sdd-f46806ef53e15f07.md#b00052)

Assets: [0386857c003910980ab7445b7bc4fd16e93b445cbfc4c55158da0bd9280c19b9.png](assets/sdd-f46806ef53e15f07/0386857c003910980ab7445b7bc4fd16e93b445cbfc4c55158da0bd9280c19b9.png); [8cab27588ccc1179b3ad3c023bc1310e227af8fcbc8d647c75ae3ffdb3717540.png](assets/sdd-f46806ef53e15f07/8cab27588ccc1179b3ad3c023bc1310e227af8fcbc8d647c75ae3ffdb3717540.png)

#### User company and warehouse authorization

Separate Company access and Warehouse access views both select All rather than List. The visible company and warehouse entries are checked. This does not establish the narrower intended authorization described by the prose.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00055, b00056](reading/sdd-f46806ef53e15f07.md#b00055)

Assets: [21280e725354477e208dd6ed40a1153cd256eab701efa51aab8e59918acef88d.png](assets/sdd-f46806ef53e15f07/21280e725354477e208dd6ed40a1153cd256eab701efa51aab8e59918acef88d.png); [58866e8d63550b03cfd86392eb14322fb9ddf2dd67854e937052072e07a2a52a.png](assets/sdd-f46806ef53e15f07/58866e8d63550b03cfd86392eb14322fb9ddf2dd67854e937052072e07a2a52a.png)

#### User work-profile and adjustment authorization

Both Work profile and Authorized adjustment types select All. The Work profile view leaves Default work profile blank; the adjustment view also exposes None and a clipped List option. Individual user identity is omitted.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00057, b00058](reading/sdd-f46806ef53e15f07.md#b00057)

Assets: [9ac325ef08be3e6acad0ee3eaebceaa5b34590f0251dcd93b205ac2256e00599.png](assets/sdd-f46806ef53e15f07/9ac325ef08be3e6acad0ee3eaebceaa5b34590f0251dcd93b205ac2256e00599.png); [bbedc305b330c28f6207deb2a75ceb8f908b1c5b8e57b2488bec594693bc0cf1.png](assets/sdd-f46806ef53e15f07/bbedc305b330c28f6207deb2a75ceb8f908b1c5b8e57b2488bec594693bc0cf1.png)

#### Location configuration dependencies

The Location flow connects Location Type, Location Template, Location Class, Location Status and Zones to Location; Zone Type feeds Zones. Location points to Item Location Capacity and Item Location Assignment. Location Class alone uses the optional dotted symbol in this diagram.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00012, b00061, b00062](reading/sdd-f46806ef53e15f07.md#b00012)

Assets: [fdd4ad1c2e14bed5e20e3fe46ca8031e80c50a92b9eaff0907bcccb1e810d7ca.emf](assets/sdd-f46806ef53e15f07/fdd4ad1c2e14bed5e20e3fe46ca8031e80c50a92b9eaff0907bcccb1e810d7ca.emf)

#### Zone types

Allocation, Locating and Work are listed with System created Yes and Active Yes. This list establishes the illustrated catalog entries, not an exhaustive version-independent set.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00064, b00065](reading/sdd-f46806ef53e15f07.md#b00064)

Assets: [9865e3723d9cd95e877ad000498197039c7755d51a0f7e3bc6f2b75d73867e39.png](assets/sdd-f46806ef53e15f07/9865e3723d9cd95e877ad000498197039c7755d51a0f7e3bc6f2b75d73867e39.png)

#### Location list used as zone-naming illustration

The image under zone naming is a location list, with location template/class/subclass/type/status and zone columns. Visible rows use a consolidation work zone and mixed location statuses; it is not a complete zone-definition list.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00067, b00068, b00069, b00070, b00071, b00072, b00073](reading/sdd-f46806ef53e15f07.md#b00067)

Assets: [bd2c7d624c9d2ec89dc25c1219df36651c1223cbaf7c4742cafd9c4a16e3cc57.png](assets/sdd-f46806ef53e15f07/bd2c7d624c9d2ec89dc25c1219df36651c1223cbaf7c4742cafd9c4a16e3cc57.png)

#### Locating and allocation zone examples

The two zone editors select Locating and Allocation respectively, with matching L- and A- name prefixes. Pick management active is not selected in these views, and Inactive is unchecked.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00074, b00075, b00076](reading/sdd-f46806ef53e15f07.md#b00074)

Assets: [6c377d5a9ef65001ca1592b5b9a76cb109abdc76993b2c231ea167a42271414e.png](assets/sdd-f46806ef53e15f07/6c377d5a9ef65001ca1592b5b9a76cb109abdc76993b2c231ea167a42271414e.png); [ba04205a0d37242bab2d4eae79a53581011ca2913e86c680269e2d5a302615cf.png](assets/sdd-f46806ef53e15f07/ba04205a0d37242bab2d4eae79a53581011ca2913e86c680269e2d5a302615cf.png)

#### Work zones and profile associations

Two Work zone examples check Pick management active and show a Work profile checklist with a mixture of selected and unselected profiles. The selection sets differ between receiving and picking zones; no universal profile assignment follows.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00078, b00079](reading/sdd-f46806ef53e15f07.md#b00078)

Assets: [473d65e54e569bf0751d0123cfb49c137a492126ce550de7a4e84d32b12efa46.png](assets/sdd-f46806ef53e15f07/473d65e54e569bf0751d0123cfb49c137a492126ce550de7a4e84d32b12efa46.png); [ec770e4231e9e6dd0725ac86f0eceb6a33eea13eea56a4edbcdf907055f0fab3.png](assets/sdd-f46806ef53e15f07/ec770e4231e9e6dd0725ac86f0eceb6a33eea13eea56a4edbcdf907055f0fab3.png)

#### Dimension and quantity UM definitions

The editors define centimeters under UMDIMENSN and pallet quantity under UMQUANTITY, with the quantity symbol PAL. These definitions identify units; they do not establish item conversion quantities.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00081, b00082, b00083, b00084, b00085, b00086, b00087, b00088](reading/sdd-f46806ef53e15f07.md#b00081)

Assets: [1a63be9bd18c3fc744083eab5868ed4050f497ccf8a8e93d742340bfa5978bee.png](assets/sdd-f46806ef53e15f07/1a63be9bd18c3fc744083eab5868ed4050f497ccf8a8e93d742340bfa5978bee.png); [3c134faadc05fbe2c285d323cde4929041f0ef6a4f6febbfa5ad9974fa4c3980.png](assets/sdd-f46806ef53e15f07/3c134faadc05fbe2c285d323cde4929041f0ef6a4f6febbfa5ad9974fa4c3980.png)

#### Volume and weight UM definitions

The views show cm3 under UMVOLUME and Kg under UMWEIGHT. The volume dialog is vertically compact/clipped; no hidden fields are inferred.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00089, b00090](reading/sdd-f46806ef53e15f07.md#b00089)

Assets: [efbf91d6cbfcd55557d3d856c0cc57a102d422dd01fde96546ec5c22420da388.png](assets/sdd-f46806ef53e15f07/efbf91d6cbfcd55557d3d856c0cc57a102d422dd01fde96546ec5c22420da388.png); [ffad9befb88465d9d6357a30fbb6cb7382a4197493cad78c10e680829c84458d.png](assets/sdd-f46806ef53e15f07/ffad9befb88465d9d6357a30fbb6cb7382a4197493cad78c10e680829c84458d.png)

#### Location type capacity fields

The list exposes dimensions, dimension UM, maximum weight, weight UM and active state. Two detail examples use 9999 for length, width, height and maximum weight with centimeters/kilograms. The source does not define 9999 as an unlimited sentinel.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00092, b00093, b00095, b00096](reading/sdd-f46806ef53e15f07.md#b00092)

Assets: [f15e341ec86cfcb3bfb9e3db643b534a160d45e10bceed333be603f1591a878b.png](assets/sdd-f46806ef53e15f07/f15e341ec86cfcb3bfb9e3db643b534a160d45e10bceed333be603f1591a878b.png); [27bfacb2a55da74b358ef9d624fbb5716b7ee040ff5ef1bf12dd0d2ad649496f.png](assets/sdd-f46806ef53e15f07/27bfacb2a55da74b358ef9d624fbb5716b7ee040ff5ef1bf12dd0d2ad649496f.png); [acba0e0b699d3ef66304c8eca1d01cfd26ad20761d4ffaab2a00d145e00119c7.png](assets/sdd-f46806ef53e15f07/acba0e0b699d3ef66304c8eca1d01cfd26ad20761d4ffaab2a00d145e00119c7.png)

#### Location status catalog

Empty, Frozen, Picking and Storage appear with System created Yes and Active Yes. The image contains no state-transition logic.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00098, b00099](reading/sdd-f46806ef53e15f07.md#b00098)

Assets: [d2f26a3aea54d7ec12320e80ba41986ac2649fa56205f64759fbfb915ac9045f.png](assets/sdd-f46806ef53e15f07/d2f26a3aea54d7ec12320e80ba41986ac2649fa56205f64759fbfb915ac9045f.png)

#### Location class upload inclusion

The class list displays System value 1 as Y for most shown classes and N for Receiving Pre-Check In and Receiving Pre-Locate. The prose identifies this column as Include in Item Balance Upload.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00101, b00102, b00103, b00104](reading/sdd-f46806ef53e15f07.md#b00101)

Assets: [018c7129a0e525139b1cd6b12aba153ad4d67c0385f09cef3d5a0007ce0ee325.png](assets/sdd-f46806ef53e15f07/018c7129a0e525139b1cd6b12aba153ad4d67c0385f09cef3d5a0007ce0ee325.png)

#### Two location naming templates

Both templates show five segments with lengths 3, 4, 2, 2 and 2 and a dot separator. Stock / Prel uses Numeric for every segment; the receipt/control/shipping template uses Alpha for its first segment and Numeric for the remaining four. Inactive is unchecked.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00106, b00107, b00108](reading/sdd-f46806ef53e15f07.md#b00106)

Assets: [5f33e6f30d3c50c7d2a8f3313a4ff6ccc14e6a0bb56e6e3189019189a63f55df.png](assets/sdd-f46806ef53e15f07/5f33e6f30d3c50c7d2a8f3313a4ff6ccc14e6a0bb56e6e3189019189a63f55df.png); [a8cbab6b049db311911cc450859faab047f19fe644b5298aad0b8a7aa7a0073d.png](assets/sdd-f46806ef53e15f07/a8cbab6b049db311911cc450859faab047f19fe644b5298aad0b8a7aa7a0073d.png)

#### Location zone assignments

The Zones tab contains separate Locating, Allocation and Work zone fields. They are disabled in this Edit existing view until change-selector checkboxes are selected; the image explicitly instructs checking the values to change.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00120, b00122](reading/sdd-f46806ef53e15f07.md#b00120)

Assets: [fbaeb03af748c8c893f37c4c842cb412641d505108af332be93c8526d9894607.png](assets/sdd-f46806ef53e15f07/fbaeb03af748c8c893f37c4c842cb412641d505108af332be93c8526d9894607.png)

#### Location work options

The Work tab shows disabled verification choices None, Check digit and Location, with None selected; incoming/outgoing pickup-dropoff fields are blank, and picking/putaway sequences show zero. Small left-hand checkboxes are edit selectors, not operational booleans.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00123, b00124](reading/sdd-f46806ef53e15f07.md#b00123)

Assets: [09a5e761e60b35d5e26dbea9f44f0ef8b04af79e6eda90b712c87206d19cac4f.png](assets/sdd-f46806ef53e15f07/09a5e761e60b35d5e26dbea9f44f0ef8b04af79e6eda90b712c87206d19cac4f.png)

#### Location Dock tab

The Dock tab is disabled and displays Dock area selected, blank anchor/next/parent-area fields, selection priority zero and a zero size value. The picture alone cannot establish the configured dock count or a working dock assignment.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00127, b00128](reading/sdd-f46806ef53e15f07.md#b00127)

Assets: [3691ebdd2547f042f91b683c3f0d052e2f19c2be3d314ee7d9dadc9ebe9193bf.png](assets/sdd-f46806ef53e15f07/3691ebdd2547f042f91b683c3f0d052e2f19c2be3d314ee7d9dadc9ebe9193bf.png)

#### Location user-defined fields

The User defined data tab shows blank text fields and zero numeric fields, with edit-selector checkboxes beside them. Field labels are clipped, so their full names and business meanings are not inferred.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00129, b00131](reading/sdd-f46806ef53e15f07.md#b00129)

Assets: [1504087dee3a5b30e105c5231237edc310c1603445c7a0d959817149146de705.png](assets/sdd-f46806ef53e15f07/1504087dee3a5b30e105c5231237edc310c1603445c7a0d959817149146de705.png)

#### Item configuration dependencies

The Item flow links warehouse, company, optional item class, item UOM/dimensions and optional item categories to Item. Item Cross Reference points to Item; optional location capacity and item/location assignment branch from its relationship with Location. Country, users, storage template and UOM form additional prerequisite relationships.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00012, b00133, b00134](reading/sdd-f46806ef53e15f07.md#b00012)

Assets: [d1dbf3e21aaa8034579e16f93cffd62ca6424e213f9b10bd48fc4eca6cfb34c3.emf](assets/sdd-f46806ef53e15f07/d1dbf3e21aaa8034579e16f93cffd62ca6424e213f9b10bd48fc4eca6cfb34c3.emf)

#### Default storage-template details

The *Default template has sequences 1 UVC, 2 SPCS, 3 PCB and 4 PAL. Treat as full percent is 100 on all four rows; Group during check in is Yes on the first three and No on PAL. The displayed SPCS spelling differs from SPCB in nearby prose.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00136, b00137, b00138, b00139](reading/sdd-f46806ef53e15f07.md#b00136)

Assets: [130ba78df48baad9846e2b7f5c443779291e14b5e4e3d9f9a076844d6655ae68.png](assets/sdd-f46806ef53e15f07/130ba78df48baad9846e2b7f5c443779291e14b5e4e3d9f9a076844d6655ae68.png)

#### Item-class storage template

The item-class editor selects *Default for Storage Template; the visible class row is active and not system-created. This screenshot supplies the class-to-template illustration already discussed by the prose.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00142, b00144](reading/sdd-f46806ef53e15f07.md#b00142)

Assets: [75cca0651896527646609a000fd466044ef79a805f949c48682427406f76b8e2.png](assets/sdd-f46806ef53e15f07/75cca0651896527646609a000fd466044ef79a805f949c48682427406f76b8e2.png)

#### Item master editor and list

The General item editor has Inventory tracking checked, *Default storage template and a selected item class, while Allocation rule, Locating rule and Packing class are blank. The adjacent catalog shows item/company/class/active columns. Item identifiers and descriptions are omitted.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00148, b00149, b00151, b00152, b00153, b00154, b00155](reading/sdd-f46806ef53e15f07.md#b00148)

Assets: [fe14ff06ed8ae6bf97b6af226551ee3c55d4bce3f54e789811952eca25495bcc.png](assets/sdd-f46806ef53e15f07/fe14ff06ed8ae6bf97b6af226551ee3c55d4bce3f54e789811952eca25495bcc.png); [4f95a1d1ffe646e9b58f2484f288afdbe5793d94fc66eac8c4a8d75295ab3604.png](assets/sdd-f46806ef53e15f07/4f95a1d1ffe646e9b58f2484f288afdbe5793d94fc66eac8c4a8d75295ab3604.png)

#### Item UOM navigation and sequenced rows

The navigation image selects Item UOM. The editor selects Item rather than Item class and shows sequence 1 UVC with conversion quantity 1 and sequence 2 PCB with conversion quantity 10 in one item record, plus dimension/weight columns. This conflicts with the literal nearby assertion that several units cannot be created for one item.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00158, b00159, b00160, b00162, b00164](reading/sdd-f46806ef53e15f07.md#b00158)

Assets: [65e65f7e47f82c303f4bf114013995f13935fc23eb87cfce0f2a6d6f21864205.png](assets/sdd-f46806ef53e15f07/65e65f7e47f82c303f4bf114013995f13935fc23eb87cfce0f2a6d6f21864205.png); [f6b6f515680daf7004310c71437703114eac28a178ae45b2eaf5355e0aef9b63.png](assets/sdd-f46806ef53e15f07/f6b6f515680daf7004310c71437703114eac28a178ae45b2eaf5355e0aef9b63.png)

#### Six item-category catalogs

The six inspected lists show category 01 entries Label/SMS/Stock; category 02 product-status choices; category 03 product families; category 04 a sub-family; category 05 rotation classes A/B/C/Z; and category 06 sales classes A/B/C/Z. Shown entries are active and not system-created. A stale top selector reads Wave steps while the navigation tree identifies the selected item category.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00166, b00167, b00169, b00170, b00171, b00172, b00173, b00175, b00176, b00177, b00179, b00180, b00181, b00182](reading/sdd-f46806ef53e15f07.md#b00166)

Assets: [d30b959b0cd800b6a72b9600b6415f69bd436e4307b6cbaf3f3dc118b3078a8d.png](assets/sdd-f46806ef53e15f07/d30b959b0cd800b6a72b9600b6415f69bd436e4307b6cbaf3f3dc118b3078a8d.png); [30ef503c3eaf0bec1eb3b156e4b1aaf7418b37f2104e80fc553e78a53d0fa84e.png](assets/sdd-f46806ef53e15f07/30ef503c3eaf0bec1eb3b156e4b1aaf7418b37f2104e80fc553e78a53d0fa84e.png); [bfaf95b81e4f707382ab37069c56b6251e3719c4e8fcc7a6f8ce5fea75bca12b.png](assets/sdd-f46806ef53e15f07/bfaf95b81e4f707382ab37069c56b6251e3719c4e8fcc7a6f8ce5fea75bca12b.png); [d0a8bb75e7999967ff0291a589bed8911c485b3768386f60a06af5c63d68ec82.png](assets/sdd-f46806ef53e15f07/d0a8bb75e7999967ff0291a589bed8911c485b3768386f60a06af5c63d68ec82.png); [d12b3d812c819fd9908628a9aeb40742efba4b9c855ada4e5ceda353a100dd37.png](assets/sdd-f46806ef53e15f07/d12b3d812c819fd9908628a9aeb40742efba4b9c855ada4e5ceda353a100dd37.png); [9082f1aff832cf288a298273d665e037ee76c02e8dd587c36e1f9c1f50cd315e.png](assets/sdd-f46806ef53e15f07/9082f1aff832cf288a298273d665e037ee76c02e8dd587c36e1f9c1f50cd315e.png)

#### Item cross-reference records

The list has Item, Company, Cross reference item number and Quantity um columns. Visible rows use UVC; multiple rows reuse cross-reference values, so uniqueness or successful scan resolution cannot be inferred from this illustration. Specific item and barcode values are omitted.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00184, b00186, b00187](reading/sdd-f46806ef53e15f07.md#b00184)

Assets: [f885f6afd31af3c88752681af1daf31e9aa30023bf1cfd1eab3a79dd48e9631a.png](assets/sdd-f46806ef53e15f07/f885f6afd31af3c88752681af1daf31e9aa30023bf1cfd1eab3a79dd48e9631a.png)

#### Inventory-management work dependencies

Work Profile and Work Type feed Work Creation Master, together with Inventory Transfer Work Criteria. Work Creation Master and Adjustment Types point to the related Work node. The diagram does not show execution or complete transaction authorization.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00197, b00198, b00199, b00200, b00201, b00202, b00203, b00204](reading/sdd-f46806ef53e15f07.md#b00197)

Assets: [10ed2f53b5bdfad945526f18a3eeabf5e89b7a2a30fcf5cf7f64fbbde1c11adc.emf](assets/sdd-f46806ef53e15f07/10ed2f53b5bdfad945526f18a3eeabf5e89b7a2a30fcf5cf7f64fbbde1c11adc.emf)

#### Inventory-control technical values

The list shows duplicate serial numbers N, reuse closed license plates N, default inventory status for adjustments Available, item validation Y, location validation Y, inventory tracked by default Y, Use Location UM Overrides N and location check-digit format ZZZ. Other clipped descriptions are not expanded into guessed semantics.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00205, b00206, b00207](reading/sdd-f46806ef53e15f07.md#b00205)

Assets: [e12c77f1e5f47b12854a38cfeea2f2ebfa7902698224531c2f67d3becb610ced.png](assets/sdd-f46806ef53e15f07/e12c77f1e5f47b12854a38cfeea2f2ebfa7902698224531c2f67d3becb610ced.png)

#### Putaway groups defined by zones

The putaway location group list shows populated Locating zone fields with blank From location and To location fields. It illustrates the zone-based grouping choice, with several grade-specific groups.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00223, b00224, b00225](reading/sdd-f46806ef53e15f07.md#b00223)

Assets: [d7ae19570b1c3f007c6c8b3751b01473f8fa7ac61a01a872923d1aecdbb6c0a1.png](assets/sdd-f46806ef53e15f07/d7ae19570b1c3f007c6c8b3751b01473f8fa7ac61a01a872923d1aecdbb6c0a1.png)

#### Receiving location-selection predicates

Both examples require the configured warehouse, non-Frozen status and Active Y. The reserve example additionally uses an allocation zone, an inclusive template-field-2 range and template-field-4 levels 04 through 05; the picking example uses its allocation zone, template field 1 and a locating zone. The Order by tab label is visible, but its settings are not shown.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00228, b00229, b00230, b00231, b00232, b00233, b00234](reading/sdd-f46806ef53e15f07.md#b00228)

Assets: [0206b18bc1b7fa570b98a418b5338f7be792106c2a9cb7483c57028f7a17f623.png](assets/sdd-f46806ef53e15f07/0206b18bc1b7fa570b98a418b5338f7be792106c2a9cb7483c57028f7a17f623.png); [10b42f54fa1b18a0aeddce02283b05da679a4feca2f4011dd24779b92490a820.png](assets/sdd-f46806ef53e15f07/10b42f54fa1b18a0aeddce02283b05da679a4feca2f4011dd24779b92490a820.png)

#### Locating-rule strategy sequence

The rule-detail table begins with a clipped Fill one and only one location strategy followed by several Empty location strategies with different location selections. Delayed locating and Inactive are unchecked. Sequence digits and the final column heading are clipped and are not reconstructed.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00237, b00239](reading/sdd-f46806ef53e15f07.md#b00237)

Assets: [6c375cd435ca063fc076a44b8efde6203e0384f234556487dab72697b70ce9ad.png](assets/sdd-f46806ef53e15f07/6c375cd435ca063fc076a44b8efde6203e0384f234556487dab72697b70ce9ad.png)

#### Locating-assignment criteria in two views

The larger catalog/editor image and the close-up show the same predicate: catch-weight requirement N, a parenthesized receipt-detail LOT or receipt-container LOT alternative, converted quantity UM PCB, a parenthesized item-category-5 or item-category-6 alternative, and QC_INSPECTION N. Both sets of OR alternatives visibly have parentheses; the catalog contains both active and inactive criteria.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00242, b00243](reading/sdd-f46806ef53e15f07.md#b00242)

Assets: [6e69cfae380d9cdc87ef6f184202adfa8a18612783c4e33690817c65daf82783.png](assets/sdd-f46806ef53e15f07/6e69cfae380d9cdc87ef6f184202adfa8a18612783c4e33690817c65daf82783.png); [cade23860ec9eebd747676f80fc4d3cbcd102d99a282975f633b128d496f542a.png](assets/sdd-f46806ef53e15f07/cade23860ec9eebd747676f80fc4d3cbcd102d99a282975f633b128d496f542a.png)

#### Locating assignments and priority

The list maps criteria to locating rules at different priority values. The detail example uses priority 30, with Always override unchecked and Inactive unchecked. The prose says the smallest priority number has greatest importance when criteria overlap.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00246, b00248, b00249, b00250](reading/sdd-f46806ef53e15f07.md#b00246)

Assets: [72a2f242d488838417b537afa39ea7680a84c951eeac2b7194e3bd9f25b0baaa.png](assets/sdd-f46806ef53e15f07/72a2f242d488838417b537afa39ea7680a84c951eeac2b7194e3bd9f25b0baaa.png); [682bb85574f6e5fb8249bb59133ecc9ef8a882f99528c0c693d286a034b8ff37.png](assets/sdd-f46806ef53e15f07/682bb85574f6e5fb8249bb59133ecc9ef8a882f99528c0c693d286a034b8ff37.png)

#### Receipt ID type return flag

The two RCPTIDTYPE editors show STANDARD with Returns No and a return-specific type with Returns Yes. Both are active and not system-created in the pictured state.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00258, b00259, b00261](reading/sdd-f46806ef53e15f07.md#b00258)

Assets: [8cdd7a5d6a1af766a9c4ae3b7caaccd70041bd256603c02626a5d6892171ad53.png](assets/sdd-f46806ef53e15f07/8cdd7a5d6a1af766a9c4ae3b7caaccd70041bd256603c02626a5d6892171ad53.png); [b9958049f9a5124f15a8883f41abb37332c5f307badfd81b64e879a0895779d3.png](assets/sdd-f46806ef53e15f07/b9958049f9a5124f15a8883f41abb37332c5f307badfd81b64e879a0895779d3.png)

#### RF receiving initiation catalog and workflow field

The initiation catalog mixes system-created and non-system-created active rows. The open INITIATIONWORKFLOW example has identifier 150, a header-item workflow description and a clipped Workflow File selection; Inactive and System created are unchecked.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00263, b00264, b00265, b00266](reading/sdd-f46806ef53e15f07.md#b00263)

Assets: [cf9f5e69cd48fe0971346ccc6ff0222f7681b1e73e3d823723218210694611aa.png](assets/sdd-f46806ef53e15f07/cf9f5e69cd48fe0971346ccc6ff0222f7681b1e73e3d823723218210694611aa.png); [92732b4d951a66d3b6c5e36f15efeebca3adf32341d7a5fd6c4755e39b4d519f.png](assets/sdd-f46806ef53e15f07/92732b4d951a66d3b6c5e36f15efeebca3adf32341d7a5fd6c4755e39b4d519f.png)

#### Work groups and work-type mappings

The Work group list includes receiving, picking, packing, shipping and cycle counting. The Work type list maps each type to a group, default priority, labor type and active state. Putaway types belong to Receiving; several replenishment priorities differ and at least one visible replenishment row is inactive.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00278, b00279, b00280, b00282, b00283](reading/sdd-f46806ef53e15f07.md#b00278)

Assets: [a13f5e29acbd501639726d28c6ea8f826fcd712c2b4aa40b14b107ef2882b152.png](assets/sdd-f46806ef53e15f07/a13f5e29acbd501639726d28c6ea8f826fcd712c2b4aa40b14b107ef2882b152.png); [14d70eec851f344fb13dd28cb2e34133437c36921b1497e148a1bd162b74dfc7.png](assets/sdd-f46806ef53e15f07/14d70eec851f344fb13dd28cb2e34133437c36921b1497e148a1bd162b74dfc7.png)

#### Work-profile warehouse and zone selection

The profile Warehouse access view selects All. The Work zone view has a mixture of checked and unchecked zone entries; its Check all control is unchecked. These views establish selected example scope, not operator authorization or execution.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00292, b00295, b00296, b00297](reading/sdd-f46806ef53e15f07.md#b00292)

Assets: [dffb63de664dd9507a4a3879fa516efb056513b20ee8c8ca3cda2e11716a1f4d.png](assets/sdd-f46806ef53e15f07/dffb63de664dd9507a4a3879fa516efb056513b20ee8c8ca3cda2e11716a1f4d.png); [e3a531a38a6896b10b073aae0eb79c481deaa0ec4ab41ca12721a43a7009d9be.png](assets/sdd-f46806ef53e15f07/e3a531a38a6896b10b073aae0eb79c481deaa0ec4ab41ca12721a43a7009d9be.png)

#### Work-system values

The catalog shows RF Session Timeout value 720 minutes, Un-assign work on logout from RF Y, Display Comments during Work on RF N, Display Text Messages during Work on RF N, and Number of instructions per RF Pick screen 10. Many other labels are clipped; these settings are examples rather than validated operating recommendations.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00319, b00320](reading/sdd-f46806ef53e15f07.md#b00319)

Assets: [271fcce653463e4079cff0807726049c887c1ed12e20e2deff709f6ecf031a6f.png](assets/sdd-f46806ef53e15f07/271fcce653463e4079cff0807726049c887c1ed12e20e2deff709f6ecf031a6f.png)

#### Dock-management work criteria

The MSGCOL criterion tests SHIPMENT_DETAIL.STATUS_FLOW_NAME = MSGCOL. The MSGPAL criterion tests its own flow name and additionally requires SHIPMENT_HEADER_VIEW.USER_DEF3 IS NULL. Both select Shipping container as the table and have Inactive unchecked; the Order by tab label is visible, but its settings are not shown.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00326, b00330, b00331, b00340, b00341, b00342, b00343](reading/sdd-f46806ef53e15f07.md#b00326)

Assets: [7d11ced65f13eac6b03dd8099d9680a362d8b2fa7a36b52be117f65609277122.png](assets/sdd-f46806ef53e15f07/7d11ced65f13eac6b03dd8099d9680a362d8b2fa7a36b52be117f65609277122.png); [593d3944f3b74b5dc6631fe91799dbf851b9f7103be2fd6faef578315268b20c.png](assets/sdd-f46806ef53e15f07/593d3944f3b74b5dc6631fe91799dbf851b9f7103be2fd6faef578315268b20c.png)

#### Cycle-count work criterion repeated subject

This earlier-section image shows the same warehouse-scoped cycle-count request filter subject documented later in the cycle-count section. Only the warehouse equality is visible; Inactive is unchecked. It is a distinct retained image, not an additional business rule.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00338, b00339](reading/sdd-f46806ef53e15f07.md#b00338)

Assets: [06bc73dff7ff00921c3fc45138d5aa1dd0ae14a0ad2c86e11a93a31e92d8e4c1.png](assets/sdd-f46806ef53e15f07/06bc73dff7ff00921c3fc45138d5aa1dd0ae14a0ad2c86e11a93a31e92d8e4c1.png)

#### Consolidation work creation master

The illustrated dock-management master uses Tree unit id, Pre-build, priority 1 and MSGPAL work criteria. Auto print documents is unchecked; process and SRC selections are clipped. It adds a distinct master example to the earlier dock-work discussion.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00349, b00353](reading/sdd-f46806ef53e15f07.md#b00349)

Assets: [14ae5dec93e6c8c3610ff1ece707b53187f233bfb0b25ea389670b6a3f3dc523.png](assets/sdd-f46806ef53e15f07/14ae5dec93e6c8c3610ff1ece707b53187f233bfb0b25ea389670b6a3f3dc523.png)

#### Consolidation work-profile detail

The profile detail list contains a single visible work type at sequence 10 and Inactive is unchecked. It shows the Work types list, not the Work Processing detail tab.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00355, b00356, b00357](reading/sdd-f46806ef53e15f07.md#b00355)

Assets: [db4118a6d28784864db2795f5e97c0562be8d4104481a1011f8ec5c4ebf5ec34.png](assets/sdd-f46806ef53e15f07/db4118a6d28784864db2795f5e97c0562be8d4104481a1011f8ec5c4ebf5ec34.png)

#### Outbound configuration relationships

The flow connects Functional Area to Custom Status Flow and Dock Management Flow. Carrier/service and dock carrier assignment feed dock anchor criteria with Location & Zones. Customer/store-location and consolidation branches use optional dotted symbols; Packing Preferences and Shipping Preferences are shown as separate required nodes.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00012, b00374, b00375, b00376, b00377, b00378](reading/sdd-f46806ef53e15f07.md#b00012)

Assets: [cf8e44a1c06d1c5d7a7c243965c43ebab16ab43a552dc05265829b8354b1aa78.emf](assets/sdd-f46806ef53e15f07/cf8e44a1c06d1c5d7a7c243965c43ebab16ab43a552dc05265829b8354b1aa78.emf)

#### Outbound status action and default status

The catalog shows default-status actions with System value 1 equal to 100. The open rejected-shipment action selects In Pool, is active and system-created. The picture does not show a rejection being processed.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00379, b00381](reading/sdd-f46806ef53e15f07.md#b00379)

Assets: [fa15a16cce72d85a4825cd239fe86043028ab4452f9b840a3a0ed85ad8e7a69f.png](assets/sdd-f46806ef53e15f07/fa15a16cce72d85a4825cd239fe86043028ab4452f9b840a3a0ed85ad8e7a69f.png)

#### Functional-area status definitions

Inbound and Outbound appear active and system-created. The Outbound detail lists status numbers, names, related statuses and Mandatory values; the visible Picking Pending row is not mandatory, while the earlier pool/wave rows are mandatory.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00383, b00384, b00385, b00386, b00387](reading/sdd-f46806ef53e15f07.md#b00383)

Assets: [26e85128e9f75a09e717067f7f22d1404e4f01febd29169cb85e63224312aec2.png](assets/sdd-f46806ef53e15f07/26e85128e9f75a09e717067f7f22d1404e4f01febd29169cb85e63224312aec2.png)

#### MSGCOL custom status selections

Five scroll-position images show the MSGCOL Outbound flow. Pool, wave, picking, packing, staging, loading and closing stages are checked in the shown ranges. Status 630 and Appel Akanea 640 are unchecked. The late optional 990 and 994-999 rows shown are unchecked. Several names are clipped; overlapping rows are repeated views, not separate flows.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00389, b00390, b00391, b00392, b00394, b00396, b00398, b00400](reading/sdd-f46806ef53e15f07.md#b00389)

Assets: [fec0857b28b4e56608bad1acce5cac8d0944fbb2b0ec945a16114dca551b9401.png](assets/sdd-f46806ef53e15f07/fec0857b28b4e56608bad1acce5cac8d0944fbb2b0ec945a16114dca551b9401.png); [6e5eea5192c684e53eeab4c8a0bca15285536b17298248dafde3987e7526885f.png](assets/sdd-f46806ef53e15f07/6e5eea5192c684e53eeab4c8a0bca15285536b17298248dafde3987e7526885f.png); [7a5cc91fd0dc96266b7898daea09e8c7f7a0d1988e3e12d2df85beb97e56fdc6.png](assets/sdd-f46806ef53e15f07/7a5cc91fd0dc96266b7898daea09e8c7f7a0d1988e3e12d2df85beb97e56fdc6.png); [0f48c0e1cebacb3014e28313f26e4ecab625611c5bc8fb71322c62c6833d5550.png](assets/sdd-f46806ef53e15f07/0f48c0e1cebacb3014e28313f26e4ecab625611c5bc8fb71322c62c6833d5550.png); [efcb6c8425601165bd7eeb899e3928f79151c71426ad1a5c49b73077efbbcb11.png](assets/sdd-f46806ef53e15f07/efcb6c8425601165bd7eeb899e3928f79151c71426ad1a5c49b73077efbbcb11.png)

#### MSGPAL custom status selections

Three images show MSGPAL Outbound at different scroll positions. Pool/wave/picking/packing/staging and loading/closing rows are checked. Unlike MSGCOL, status 630 and Appel Akanea 640 are checked. Mandatory Yes/No is a separate column from each selection checkbox.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00389, b00401, b00402, b00403](reading/sdd-f46806ef53e15f07.md#b00389)

Assets: [165edb50c91b7f09634708dd60ae7d4884a7346a991af239fadd54c97bf30d20.png](assets/sdd-f46806ef53e15f07/165edb50c91b7f09634708dd60ae7d4884a7346a991af239fadd54c97bf30d20.png); [22ff7a6a4850efadd6a94bcb2e546bc44ab7303edfa4e55d4d2e57fa2e05fdf6.png](assets/sdd-f46806ef53e15f07/22ff7a6a4850efadd6a94bcb2e546bc44ab7303edfa4e55d4d2e57fa2e05fdf6.png); [e98b84a903771a365b79eb00329d858f7723090a11db2d3461fa53169f8a3248.png](assets/sdd-f46806ef53e15f07/e98b84a903771a365b79eb00329d858f7723090a11db2d3461fa53169f8a3248.png)

#### Carrier configuration example and navigation

The carrier editor selects an LTL type with Can be used to ship and Can be used in carrier assignment checked; Inactive is unchecked. The catalog includes a disabled Custom entry and active carrier/service examples. The third image only shows Rating/routing navigation, not additional rating logic.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00405, b00406, b00407, b00408, b00409](reading/sdd-f46806ef53e15f07.md#b00405)

Assets: [b5485d9d1355d9e451baa8b3a31030cc5bb37f710dc443a8a0de2cfd9e6c224c.png](assets/sdd-f46806ef53e15f07/b5485d9d1355d9e451baa8b3a31030cc5bb37f710dc443a8a0de2cfd9e6c224c.png); [78fc4a768c3e58d17259aa633a8ca55c540ba2d1ff87342e23cfb0e87d4dafd0.png](assets/sdd-f46806ef53e15f07/78fc4a768c3e58d17259aa633a8ca55c540ba2d1ff87342e23cfb0e87d4dafd0.png); [952a7902c7b1380f86343ba115f04e0e99d799430f24a0f395d452fe6104a25d.png](assets/sdd-f46806ef53e15f07/952a7902c7b1380f86343ba115f04e0e99d799430f24a0f395d452fe6104a25d.png)

#### Dock carrier/service assignment

The dock-area assignment editor selects Carrier, supplies carrier and service fields, and leaves Carrier group and None unselected. The adjacent list contains active assignments; physical dock identifiers are omitted.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00412, b00413, b00414, b00415](reading/sdd-f46806ef53e15f07.md#b00412)

Assets: [01b51e2b7c61f59ae5b9a838f5078a44c8bfa2b4b8bb697304153ae86119e26f.png](assets/sdd-f46806ef53e15f07/01b51e2b7c61f59ae5b9a838f5078a44c8bfa2b4b8bb697304153ae86119e26f.png); [0b6f94f9a3a348aab52e6892b4c3a0cf597be7bf92c37fa2584d9c1b2498d244.png](assets/sdd-f46806ef53e15f07/0b6f94f9a3a348aab52e6892b4c3a0cf597be7bf92c37fa2584d9c1b2498d244.png)

#### Dock-management flow header and detail rows

The header list shows separate MSGCOL and MSGPAL flows with the same packing default. Two MSGPAL editor views leave Manual dock door assignment unchecked and map statuses to Packing, Staging, a second staging subclass and Dock Door. The visible nest-after-putaway option is checked for the first packing/staging rows and unchecked for later Appel Akanea/loading/ship-confirm rows. Destination codes are omitted.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00417, b00418, b00419, b00420, b00421](reading/sdd-f46806ef53e15f07.md#b00417)

Assets: [e5a2cd71ff01bbf7906bb5451580e8ba51b5d2976d118eb0de08a0debaf7eaeb.png](assets/sdd-f46806ef53e15f07/e5a2cd71ff01bbf7906bb5451580e8ba51b5d2976d118eb0de08a0debaf7eaeb.png); [6ea75d4c4a1d43af4d8da3ef2aa5a3fe58cf73f864ce21e1ba5f9c5e84320bee.png](assets/sdd-f46806ef53e15f07/6ea75d4c4a1d43af4d8da3ef2aa5a3fe58cf73f864ce21e1ba5f9c5e84320bee.png); [4aaa2b9abfcb8773b7068a376aa8336ee9d70089a57dd4c70b16c212a1ece12c.png](assets/sdd-f46806ef53e15f07/4aaa2b9abfcb8773b7068a376aa8336ee9d70089a57dd4c70b16c212a1ece12c.png)

#### Additional shipping dock subclass

The SHPDCKLOCSUBCLS generic configuration header lists Dock Door, Packing and Staging as system-created, while identifier 50 Staging subclass 2 is not system-created. The header-level System created check is distinct from the row-level value.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00422, b00423](reading/sdd-f46806ef53e15f07.md#b00422)

Assets: [fab17d6483656fd041585e9515bb013be1569c4379f858cc225b720021316707.png](assets/sdd-f46806ef53e15f07/fab17d6483656fd041585e9515bb013be1569c4379f858cc225b720021316707.png)

#### Dock-area anchor criteria and match operand

The list has two active criteria and one inactive criterion. Both inspected editors use Shipment header view and SHIPMENT_ID MATCHES with no literal value displayed; the second also tests a carrier. The screenshots alone do not explain the MATCHES evaluation context.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00425, b00426, b00427, b00428](reading/sdd-f46806ef53e15f07.md#b00425)

Assets: [c92f7cabac8aa720edcbc2d565222d3f1ad7a669fa3c791ce5a27fddb001cd74.png](assets/sdd-f46806ef53e15f07/c92f7cabac8aa720edcbc2d565222d3f1ad7a669fa3c791ce5a27fddb001cd74.png); [d8339258505509d6d0ebd3f8509860e72b52ef25898b50c24ae7447e32154a0f.png](assets/sdd-f46806ef53e15f07/d8339258505509d6d0ebd3f8509860e72b52ef25898b50c24ae7447e32154a0f.png); [5243ef183c47ac70277bb50415067da46c1d6a25b39167eb0d652b95155b7576.png](assets/sdd-f46806ef53e15f07/5243ef183c47ac70277bb50415067da46c1d6a25b39167eb0d652b95155b7576.png)

#### Packing, QC and close-container preference tabs

The Packing view selects shipment-ID initiation, Packing work types, In Packing status range, Manual container assignment and Modify workbench mode, with all four pictured user validations unchecked. QC checks Blind QC inspection and Prompt when unknown item counted while Lot verification required is unchecked. Close container checks Assign shipment to load and Allow VAS override, selects Always container id and Auto print at close Prompt; auto manifest and creation during close are unchecked.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00430, b00431, b00432, b00433, b00435, b00436, b00437](reading/sdd-f46806ef53e15f07.md#b00430)

Assets: [389f68f6683a5817db67813259dd0054f1a303b1183405126b04f86731b0c257.png](assets/sdd-f46806ef53e15f07/389f68f6683a5817db67813259dd0054f1a303b1183405126b04f86731b0c257.png); [4e2dd51f6818d582012b703c6d08a9c67c628f9e4debda1b5b72461fd048f46a.png](assets/sdd-f46806ef53e15f07/4e2dd51f6818d582012b703c6d08a9c67c628f9e4debda1b5b72461fd048f46a.png); [fe0bd8c949cb48c640a0f4a6a8c612d46380442735a299ba4180c78781ec8f33.png](assets/sdd-f46806ef53e15f07/fe0bd8c949cb48c640a0f4a6a8c612d46380442735a299ba4180c78781ec8f33.png)

#### Shipping preference General and Work type tabs

The General tab checks Compute delivery date and Transfer failed shipments during load confirm, selects Do not split shipment and a Loading Pending through Ship Confirm Pending range. Auto print, dock-work creation, order creation and manifest-unmanifested options are unchecked. The Work type tab selects Shipping for all three visible process fields.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00439, b00440, b00441](reading/sdd-f46806ef53e15f07.md#b00439)

Assets: [7f45ddf8b326e08e67e29bd027e34b6b296c0e0fd948857c542cb5000cd74558.png](assets/sdd-f46806ef53e15f07/7f45ddf8b326e08e67e29bd027e34b6b296c0e0fd948857c542cb5000cd74558.png); [4eaef12b027b530604cbebe6abcf632803d02c04add0328e4e40f3d87e7a5077.png](assets/sdd-f46806ef53e15f07/4eaef12b027b530604cbebe6abcf632803d02c04add0328e4e40f3d87e7a5077.png)

#### Allocation dependency flow

Item links to Allocation Rule Assignment Criteria; Location & Zones links to Allocation Location Selection and then Allocation Rule. Criteria and rule join at Allocation Rule Assignment. This supplies the visual configuration relationship, not allocation execution.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00446, b00447, b00448, b00449](reading/sdd-f46806ef53e15f07.md#b00446)

Assets: [73ea705d216e1c04f844e0f4f32d5b8330380408f6f72561d3d6de8755588125.png](assets/sdd-f46806ef53e15f07/73ea705d216e1c04f844e0f4f32d5b8330380408f6f72561d3d6de8755588125.png)

#### Container-creation configuration relationships

Container Group branches to Container Shape and Container Type, with Container Dimensions below Type. Container Class is optional/dotted; Container Creation System Values and Container Creation Criteria are separate required nodes. The diagram does not select a strategy.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00012, b00619, b00620](reading/sdd-f46806ef53e15f07.md#b00012)

Assets: [cb318839a50352b9ca95776911dec921157a360f94d17c26e4f1147b6fe26ac2.emf](assets/sdd-f46806ef53e15f07/cb318839a50352b9ca95776911dec921157a360f94d17c26e4f1147b6fe26ac2.emf)

#### Quality-control assignment relationships

QC Assignment branches to QC Assignment Criteria and QC Evaluation Method. The image establishes the configuration relationship only; it cannot resolve the previously documented criteria and evaluation-method conflicts.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00643, b00644, b00645](reading/sdd-f46806ef53e15f07.md#b00643)

Assets: [8c8e031eadbdb175b263979e105c665636ddbf7ca8feb8ecb1d583fd20cb576c.emf](assets/sdd-f46806ef53e15f07/8c8e031eadbdb175b263979e105c665636ddbf7ca8feb8ecb1d583fd20cb576c.emf)

#### Technical Interface navigation

The expanded Technical > Interface tree lists data maps, date format, error references, process, system values and upload criteria. This is a navigation image; it provides no endpoint, schedule or execution evidence.

Limit: Individually inspected retained source image; no full DOCX pagination, current deployment, successful execution, user authorization or universal default is established.

[sdd-f46806ef53e15f07 b00661, b00662, b00663](reading/sdd-f46806ef53e15f07.md#b00661)

Assets: [734d39aae901d80f0fe9511532670b1d7f996e144b83835236ef92df99dcec8a.png](assets/sdd-f46806ef53e15f07/734d39aae901d80f0fe9511532670b1d7f996e144b83835236ef92df99dcec8a.png)

#### Dynamic cubby tote illustration

Two movable plastic totes carry clip-on cubby labels with barcodes. The adjacent MAWM design text associates a cubby label with a tote or gurney and releases it for reuse through Clear Cubby.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b03557, b03558, b03559](reading/sdd-de62bfaf88f5d35b.md#b03557)

Assets: [e8eac2b1f113cd13717dbde9abc2ede63d48282a3ece3b80346a19994c0a6d89.png](assets/sdd-de62bfaf88f5d35b/e8eac2b1f113cd13717dbde9abc2ede63d48282a3ece3b80346a19994c0a6d89.png)

#### Sorter X cubby dividers

Two upright dividers separate piles of garments along a table or conveyor. Each divider carries a cubby barcode label. The surrounding section describes the Sorter X pack-station sorting arrangement.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b03711, b03712, b03717, b03718](reading/sdd-de62bfaf88f5d35b.md#b03711)

Assets: [04edcfa09b861fed0ad97733a5c4cf55b96d965309038ffdb82c5a5bf514e08a.png](assets/sdd-de62bfaf88f5d35b/04edcfa09b861fed0ad97733a5c4cf55b96d965309038ffdb82c5a5bf514e08a.png)

#### Matthews pack-station putwall

A three-by-three grid depicts nine labeled cubbies. The caption identifies a Matthews pack-station putwall; the drawing does not establish the number of active hospital chutes at a deployed station.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b03714, b03719, b03720](reading/sdd-de62bfaf88f5d35b.md#b03714)

Assets: [cb8181a90579da366d823a073a3b6d6492ba81009458fa27ad0c6680566af5a5.png](assets/sdd-de62bfaf88f5d35b/cb8181a90579da366d823a073a3b6d6492ba81009458fa27ad0c6680566af5a5.png)

#### Order-grouped oLPN shipment actions

The Unified Logistics Control illustration selects an order in OLPNs By Order. Its action menu shows Manually Create Shipment, Plan Shipment, Assign To Shipment and Assign To Hub Shipment, with Remove From Shipment disabled. This depicts a source screen state, not an executed assignment.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b04443, b04446](reading/sdd-de62bfaf88f5d35b.md#b04443)

Assets: [2b4428ab0cdd1c2ee73ef825add5281fef8dfbcc0ba7e5da8a6caf75ecdf829f.png](assets/sdd-de62bfaf88f5d35b/2b4428ab0cdd1c2ee73ef825add5281fef8dfbcc0ba7e5da8a6caf75ecdf829f.png)

#### Shipment bill-of-lading details

The source screen combines OLPN, order-grouped OLPN and shipment panels with a shipment-details dialog. The expanded Bill of Lading section shows pickup and delivery stops, a bill-of-lading row and an Edit BOL action. Numbered callouts identify parts of the example.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b04459, b04462](reading/sdd-de62bfaf88f5d35b.md#b04459)

Assets: [c698a24d1d4d4aa325a7ae82b9855464933a00a7e4735724cfc39ad131df519e.png](assets/sdd-de62bfaf88f5d35b/c698a24d1d4d4aa325a7ae82b9855464933a00a7e4735724cfc39ad131df519e.png)

#### Lands End cover branding

The image is a blue Lands End wordmark with a lighthouse. It is branding, with no process, setting or runtime evidence.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b00002](reading/sdd-de62bfaf88f5d35b.md#b00002)

Assets: [5c5464db786397432ee0268dca0ffbcf98f1116951ee638dc18b0fcf1db67bc8.jpeg](assets/sdd-de62bfaf88f5d35b/5c5464db786397432ee0268dca0ffbcf98f1116951ee638dc18b0fcf1db67bc8.jpeg)

#### Dodgeville building outline

A connected building silhouette identifies Building 6 on the left, Building 2 on the right and a receiving marker along the upper edge. The caption identifies Dodgeville Buildings 2 and 6.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b00452, b00453, b00455, b00456](reading/sdd-de62bfaf88f5d35b.md#b00452)

Assets: [9dca95d0a5809780c48f6a16469d12d0bc2ab993d3268938c7f87f38a235862b.png](assets/sdd-de62bfaf88f5d35b/9dca95d0a5809780c48f6a16469d12d0bc2ab993d3268938c7f87f38a235862b.png)

#### Stevens Point building outline

A building footprint with a location marker is labeled Lands End Stevens Point. It conveys site identity and outline only.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b00457, b00458](reading/sdd-de62bfaf88f5d35b.md#b00457)

Assets: [21ed1adae6cc3c41a632902fc00ffa6a5a4e664d896527d2025e6ad6346120ad.png](assets/sdd-de62bfaf88f5d35b/21ed1adae6cc3c41a632902fc00ffa6a5a4e664d896527d2025e6ad6346120ad.png)

#### Reedsburg building outline

A building footprint with a location marker is labeled Lands End Reedsburg. It conveys site identity and outline only.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b00460, b00461](reading/sdd-de62bfaf88f5d35b.md#b00460)

Assets: [3b39cfc8bd5a528a953b0125d0e6b51475a3b60a8e015faf7d61955f1e51141d.png](assets/sdd-de62bfaf88f5d35b/3b39cfc8bd5a528a953b0125d0e6b51475a3b60a8e015faf7d61955f1e51141d.png)

#### Building 2 first-floor plan

The detailed first-floor drawing separates large reserve racks, several active-storage blocks, upper production areas and lower packing-sorter loops. Lines connect these areas and extend toward Building 6. Small labels are dense; no measured distances or effective capacity are inferred.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b00467, b00468](reading/sdd-de62bfaf88f5d35b.md#b00467)

Assets: [0c64f227fb6a3b97164567349962c9c8694b97a654585962648a7317e1a62344.png](assets/sdd-de62bfaf88f5d35b/0c64f227fb6a3b97164567349962c9c8694b97a654585962648a7317e1a62344.png)

#### Building 2 second-floor plan

The second-floor drawing shows reserve storage on the left, active-storage blocks in the center, production areas above, returns on the right and sorter-related areas below. The description follows the visible layout without certifying detailed engineering labels.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b00471, b00472](reading/sdd-de62bfaf88f5d35b.md#b00471)

Assets: [5d0f4a60955fa72c7208c8f1d8cd55bc974a58db71b34b56406e76320a48fa87.png](assets/sdd-de62bfaf88f5d35b/5d0f4a60955fa72c7208c8f1d8cd55bc974a58db71b34b56406e76320a48fa87.png)

#### Building 6 first-floor plan

The drawing places production and active picking above extensive reserve-storage racks. Shipping and receiving docks run along the left side, with an in-fill and palletizing/staging area to the right. It includes marked traffic and no-drive zones; these are retained source annotations, not a current routing instruction.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b00474, b00475](reading/sdd-de62bfaf88f5d35b.md#b00474)

Assets: [12f97adbccaa224965af9608b4557f577f335ff34920685cd79a81468aeee1c2.png](assets/sdd-de62bfaf88f5d35b/12f97adbccaa224965af9608b4557f577f335ff34920685cd79a81468aeee1c2.png)

#### Stevens Point floor plan

The site drawing combines embroidery and heat-press production, sorting and packing, dock access and a long storage area. It also depicts support rooms and offices. The retained drawing is a design reference, not confirmation of current placement.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b00477, b00478](reading/sdd-de62bfaf88f5d35b.md#b00477)

Assets: [7d6e1e5618037b7e996cb50d8a209537b22a49257b9ce3802fd1ff1032d5b004.png](assets/sdd-de62bfaf88f5d35b/7d6e1e5618037b7e996cb50d8a209537b22a49257b9ce3802fd1ff1032d5b004.png)

#### Reedsburg first-floor plan

The first-floor plan places receiving and quality areas at the upper left, extensive reserve racking above active shelves, shipping down the left and a packing sorter below. Capacity annotations belong to the drawing and have not been measured or reconciled to a current site.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b00480, b00481](reading/sdd-de62bfaf88f5d35b.md#b00480)

Assets: [4ec3e2ebd21de680a063021933e754f96259ecaee52d37650a4101182842950c.png](assets/sdd-de62bfaf88f5d35b/4ec3e2ebd21de680a063021933e754f96259ecaee52d37650a4101182842950c.png)

#### Reedsburg second-floor plan

The second-floor plan shows hanging-garment storage and packing at the upper left, a large reserve-storage area, active-picking mezzanine areas and returns processing below. It also depicts support and production rooms.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b00483, b00484](reading/sdd-de62bfaf88f5d35b.md#b00483)

Assets: [40882585db4b1b8ddc3c6f4721cff8a8435de4b5cba81f15dc1098f2581ef9df.png](assets/sdd-de62bfaf88f5d35b/40882585db4b1b8ddc3c6f4721cff8a8435de4b5cba81f15dc1098f2581ef9df.png)

#### Organization and facility hierarchy

The diagram descends from Lands End Inc. at Level 0 through Lands End Distribution Centers at Level 1 to facility organizations at Level 2. Its two branches identify Reedsburg and Dodgeville. The adjacent master-data table places different record categories at different levels.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b00541, b00542, b00543](reading/sdd-de62bfaf88f5d35b.md#b00541)

Assets: [91b6042ea536e1bdd569855240143c7b98d3844cddc444a808517162c15ab3ab.png](assets/sdd-de62bfaf88f5d35b/91b6042ea536e1bdd569855240143c7b98d3844cddc444a808517162c15ab3ab.png)

#### Pallet, case and each illustration

The native media preview shows a stacked pallet with arrows labeled Unit = Each, Case = iLPN and Pallet = iLPN. This matches the nearby LAND MAWM terminology table; it does not define a SCALE license-plate replacement rule.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b00547, b00549, b00553](reading/sdd-de62bfaf88f5d35b.md#b00547)

Assets: [387335127127edcbeace97242b11301c4060725ccb62e9b5ebe7ffa6e8d84a5d.emf](assets/sdd-de62bfaf88f5d35b/387335127127edcbeace97242b11301c4060725ccb62e9b5ebe7ffa6e8d84a5d.emf)

#### Create ASN from PO dialog

The Create ASN From PO illustration contains a required ASN field, an estimated-delivery-date field and Cancel and Submit actions. Sample identifiers are omitted. It is one screen in the documented MAWM PO-to-ASN flow.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b00722, b00723](reading/sdd-de62bfaf88f5d35b.md#b00722)

Assets: [170566cd77b7f913ceccb6ee91b8bfb72ebf8442d797d743eebad7dff79482c4.png](assets/sdd-de62bfaf88f5d35b/170566cd77b7f913ceccb6ee91b8bfb72ebf8442d797d743eebad7dff79482c4.png)

#### Purchase-order line lookup

The Purchase Order Line Lookup illustration provides purchase-order, item, purchase-order-line and vendor search fields. A result can be expanded and selected, with Add To ASN and Cancel actions. Adjacent text describes selecting PO lines and adding them to an ASN.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b00708, b00709, b00710, b00724](reading/sdd-de62bfaf88f5d35b.md#b00708)

Assets: [c97987a8917e7ea1b06edb537242700c053a377180f0030bf87b49112131102e.png](assets/sdd-de62bfaf88f5d35b/c97987a8917e7ea1b06edb537242700c053a377180f0030bf87b49112131102e.png)

#### ASN purchase-order-line summary

The ASN Line illustration lists an assigned purchase order and line, with Find PO/PO Lines, Unassign, Save and Save And Finish actions. The neighboring instructions describe reviewing the added lines before Save And Finish. No source sample identifier is reproduced.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b00711, b00712, b00719, b00720, b00721, b00725](reading/sdd-de62bfaf88f5d35b.md#b00711)

Assets: [1b76aa61e98a7f6fa0858ea838337a41d4104edc4a3c97a2a61b3df5a9c2d9d7.png](assets/sdd-de62bfaf88f5d35b/1b76aa61e98a7f6fa0858ea838337a41d4104edc4a3c97a2a61b3df5a9c2d9d7.png)

#### Single-item bulk allocation diagram

A single LPN containing three units of one item branches to three distribution orders with one unit each. This visualizes the adjacent Singles Bulk Allocation example in the LAND MAWM design; it does not establish equivalent SCALE allocation or container-closing behavior.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b02082, b02083](reading/sdd-de62bfaf88f5d35b.md#b02082)

Assets: [4addf87efe6f76a4c60f48270c3768b276a7f3e3fcd37e57762ac907b5e6c765.png](assets/sdd-de62bfaf88f5d35b/4addf87efe6f76a4c60f48270c3768b276a7f3e3fcd37e57762ac907b5e6c765.png)

#### Order prioritization and work release

The diagram flows from Host/ERP/OMS to warehouse management, then order prioritization and work release. Hot orders take a direct route; standard orders pass through a waiting symbol. Equipment sends availability toward work release and receives assignment from it. No elapsed time or running integration is evidenced.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b02238](reading/sdd-de62bfaf88f5d35b.md#b02238)

Assets: [5e0389cbab76bb8ee14df8ab9b0fff4f16deb025b5bef748055b786f5c1d20bf.png](assets/sdd-de62bfaf88f5d35b/5e0389cbab76bb8ee14df8ab9b0fff4f16deb025b5bef748055b786f5c1d20bf.png)

#### Sorter X cube-to-capacity illustration

The Sorter X Cubing Strategy screenshot shows two active cube-to-capacity rows, with drag handles and priority callouts. Both use Cube to Capacity Minimize Cartons. The prose describes choosing the highest-priority catch-all criterion and changing order before the next wave when supported packing sizes change. Nearby bag-number headings and table entries disagree, so an exact intended size mapping is not resolved here.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b02604, b02605, b02606, b02607, b02608, b02610, b02612, b02614, b02615](reading/sdd-de62bfaf88f5d35b.md#b02604)

Assets: [73388ff4395717ba26a5abf26c480f381c45acad9b5a54f4148e150779e66db0.png](assets/sdd-de62bfaf88f5d35b/73388ff4395717ba26a5abf26c480f381c45acad9b5a54f4148e150779e66db0.png)

#### Pre-VAS cubing screenshot reused in two sections

The same retained image appears under the Sorter A and B section and again under Pre-VAS. Its visible title is Pre-VAS Cubing Strategy, with an active Pre-VAS Logical Container row and Cube to Capacity Minimize Cartons. It cannot substantiate the separate Sorter A and B criterion merely because the earlier caption labels it that way.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b02620, b02621, b02622, b02623, b02630, b02631, b02632, b02633](reading/sdd-de62bfaf88f5d35b.md#b02620)

Assets: [44bc2cba06fa6e79e22be3088a10ab64f601ca72430e143f06ed6361b1ee800f.png](assets/sdd-de62bfaf88f5d35b/44bc2cba06fa6e79e22be3088a10ab64f601ca72430e143f06ed6361b1ee800f.png)

#### Truck Load cubing criteria

The Truck Load Cubing Strategy screenshot shows an active Photo Studio criterion using a PolyMailer Bag and an active Truck Load criterion using BOX; both display Cube to Capacity Minimize Cartons. Adjacent MAWM prose distinguishes one-to-one iLPN/oLPN UOM cubing from cube-to-capacity for remaining unit-pick allocations. It identifies the truck-load criterion as a catch-all.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b02639, b02640, b02641, b02642](reading/sdd-de62bfaf88f5d35b.md#b02639)

Assets: [70234ff6429bbb8fc6136edd68633117de0c200f54293029bd07504b33f1d693.png](assets/sdd-de62bfaf88f5d35b/70234ff6429bbb8fc6136edd68633117de0c200f54293029bd07504b33f1d693.png)

#### Matthews Sorter A and B layout

Two elongated packing-sorter loops, A below and B above, have workstations along their inner edges. The drawing places induction and gurney-dump areas to the left, support rooms above and push-back racks at the upper right. It is a physical layout illustration.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b02700, b02701](reading/sdd-de62bfaf88f5d35b.md#b02700)

Assets: [58b9493b19c3f79d194e2c75df38ce55dc867804aec81ff517b9e50b2fb40d4d.png](assets/sdd-de62bfaf88f5d35b/58b9493b19c3f79d194e2c75df38ce55dc867804aec81ff517b9e50b2fb40d4d.png)

#### Sorter X floor plan

The plan depicts the Packing Sorter X loop with primary manual-induction points, sections of conveyor and several packing stations. A staging-and-storage area sits below the left side. It illustrates arrangement without proving configured routing or equipment throughput.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b02708, b02709](reading/sdd-de62bfaf88f5d35b.md#b02708)

Assets: [2f6fa5dab5e12c136c1d3a11b959739b05e1b723ebc2acadc869adca73fd9029.png](assets/sdd-de62bfaf88f5d35b/2f6fa5dab5e12c136c1d3a11b959739b05e1b723ebc2acadc869adca73fd9029.png)

#### Sorter X logical layout

The simplified layout separates three primary and three secondary sections, manual-feed points and special/Reedsburg chutes around a loop. Numbered diverts describe the source arrangement; the image alone does not establish active or available chute capacity.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b02710, b02711](reading/sdd-de62bfaf88f5d35b.md#b02710)

Assets: [b3ed7a4d8ccba29ddd7438c4367636774ee249c212a88c8a2278ae3acb8fb043.png](assets/sdd-de62bfaf88f5d35b/b3ed7a4d8ccba29ddd7438c4367636774ee249c212a88c8a2278ae3acb8fb043.png)

#### Building 6 HM sorters

The diagram labels HM 1 and HM 2 sorter lines, gurney-fed induction, no-read positions and nonsorted ends. It also shows an overhead cardboard conveyor and nearby packing, sorting and traffic areas. The caption identifies Building 6 first floor.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b02746, b02747](reading/sdd-de62bfaf88f5d35b.md#b02746)

Assets: [3907da3db97d046619173f815f00323aa4b672018112b9f9201a8fa4b30dd5a0.png](assets/sdd-de62bfaf88f5d35b/3907da3db97d046619173f815f00323aa4b672018112b9f9201a8fa4b30dd5a0.png)

#### Stevens Point HM sorter

The drawing routes inbound heat-press product along a primary-sort line with paired destinations. Production stations and thread-storage shelves appear beneath it. The caption identifies Stevens Point HM Sorter 1.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b02748, b02749](reading/sdd-de62bfaf88f5d35b.md#b02748)

Assets: [449a3eda6b5c1501b020bd340cacd2f265866f662358f81fad26aa2769a07159.png](assets/sdd-de62bfaf88f5d35b/449a3eda6b5c1501b020bd340cacd2f265866f662358f81fad26aa2769a07159.png)

#### HM sorter process flow

The native preview divides planning, primary sort and secondary sort between MAWM and a Matthews column. It connects divert assignments and adjustments with picking, induction and completion decisions; primary items are sorted into a gurney and secondary items into a tote. Incomplete sorting has a manual batch-close path, while completion reaches Allow Pack/Close actions. The color key calls green SAP although the lane is Matthews, so system ownership cannot be resolved from color alone.

Limit: LAND Manhattan Active Warehouse Management (MAWM) design evidence only; excluded from SCALE behavior. Source media individually inspected, including native previews where needed. No current configuration, source-screen operation, physical process, full DOCX layout or user acceptance is established. Example order, inventory, LPN and contact values are omitted.

[sdd-de62bfaf88f5d35b b02738, b02739, b02740, b02741, b02742, b02743, b02744, b02750, b02751](reading/sdd-de62bfaf88f5d35b.md#b02738)

Assets: [8b7aedc772b76905d9ebd041c9e578489f2318cf9efbbde2b5d051d05ec0b0c5.emf](assets/sdd-de62bfaf88f5d35b/8b7aedc772b76905d9ebd041c9e578489f2318cf9efbbde2b5d051d05ec0b0c5.emf)

#### Grupo Julio cover and footer branding assets

Individually inspected cover/footer graphics consist of a blue Manhattan Associates logo, a white cover field crossed by a red diagonal ribbon, and the red corner motif repeated on later pages. These are document decoration; the cover's text separately identifies SCALE Solution Design Document version 1.5 and the modified date.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Three decorative assets; no functional workflow or sign-off credit. Page 2's heading anchors the footer occurrence; the raster asset, not that heading, supplies its appearance.

[sdd-d50ca4a96095c930 p001-b004, p001-b007, p001-b010, p002-b002](reading/sdd-d50ca4a96095c930.md#p001-b004)

Assets: [2ca0a08a7b58e858f1ad28f63d4dbc3b63820cb91b9699bd4a3501b1a8e248e5.jpeg](assets/sdd-d50ca4a96095c930/2ca0a08a7b58e858f1ad28f63d4dbc3b63820cb91b9699bd4a3501b1a8e248e5.jpeg); [e45c10d5d350f6e21fac4853d865506e8ed66792900280153a25081a9ff3183d.jpeg](assets/sdd-d50ca4a96095c930/e45c10d5d350f6e21fac4853d865506e8ed66792900280153a25081a9ff3183d.jpeg); [2928bd36ca4c571109223d2edefbfdf5ec9c38337b95f1c3d1a0a05c528bcdf6.jpeg](assets/sdd-d50ca4a96095c930/2928bd36ca4c571109223d2edefbfdf5ec9c38337b95f1c3d1a0a05c528bcdf6.jpeg)

#### Grupo Julio repeated header auxiliary graphic

The retained image displays as a black rectangle in isolation and has a PDF soft mask. It occurs on all 110 pages. Rendered source pages show the JULIO header branding; the extracted component alone contains no readable operational labels. Its description records its auxiliary visual role without treating it as a process diagram.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. One repeated auxiliary asset, counted once; repeated occurrence does not establish 110 new reviewed pages or business rules.

[sdd-d50ca4a96095c930 p001-b004, p001-b010](reading/sdd-d50ca4a96095c930.md#p001-b004)

Assets: [4d7ab2755dc7c99c667bba86f071ea0256055bfb995f7b9df4393a476d20c825.png](assets/sdd-d50ca4a96095c930/4d7ab2755dc7c99c667bba86f071ea0256055bfb995f7b9df4393a476d20c825.png)

#### Grupo Julio second-floor warehouse layout asset

The second-floor plan shows rack areas labelled Colgado and Anaqueles, mezzanine areas, pathways and the Clasificador Cajas conveyor/sorting area. It provides spatial context for the named warehouse design, rather than a SCALE screen or executable locating rule.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Printed dimensions, areas and capacities are design labels, not verified current facility measurements.

[sdd-d50ca4a96095c930 p009-b002](reading/sdd-d50ca4a96095c930.md#p009-b002)

Assets: [a041eefc0cab9a3d8a97ca556637ad0b3819d61d5dbd6dc10d938358930536e6.png](assets/sdd-d50ca4a96095c930/a041eefc0cab9a3d8a97ca556637ad0b3819d61d5dbd6dc10d938358930536e6.png)

#### Grupo Julio download and upload graphic components

Fifteen individually inspected PDF image components assemble into the interface figures on pages 16 and 19. They include server and desktop pictures, silhouettes, dark rectangles and dithered or soft-mask-backed elements. Their complete rendered context shows Host System to SCALE downloads for Item Master, Receipt Download and Shipment Download on page 16, and SCALE to Host System/ERP confirmations and inventory transactions on page 19. The latter sits under Upload from SCALE to ERP although its caption says Interface Download. The surrounding design chooses Web Services into SCALE and XML files in Azure storage out of SCALE, with scheduling still to be determined during integration testing.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Components are not 15 independent workflows. Low-information isolated mask components have no independent semantic credit. Direction and labels require the page composition; implementation choice and unresolved timing remain design evidence.

[sdd-d50ca4a96095c930 p016-b003, p016-b004, p016-b005, p016-b006, p016-b007, p016-b008, p019-b009, p019-b010, p019-b011, p019-b012, p019-b013, p019-b014](reading/sdd-d50ca4a96095c930.md#p016-b003)

Assets: [110d3cb7f10e7a9d9dca8a46e44adc0a8c93546ac7af9536185db9979a00799e.png](assets/sdd-d50ca4a96095c930/110d3cb7f10e7a9d9dca8a46e44adc0a8c93546ac7af9536185db9979a00799e.png); [31f79b63958602d5a66e5d013f17ee25f99e33bad138ddac49fbfd875d3baaaf.png](assets/sdd-d50ca4a96095c930/31f79b63958602d5a66e5d013f17ee25f99e33bad138ddac49fbfd875d3baaaf.png); [548759b7674c7a9037d04b45a0ac831668b70a882db262bc77a2f8b8ac6e0a21.png](assets/sdd-d50ca4a96095c930/548759b7674c7a9037d04b45a0ac831668b70a882db262bc77a2f8b8ac6e0a21.png); [5abb71f34e8cb332674bd788f23ffc382b785d21371ff01b9257277cdddba98a.png](assets/sdd-d50ca4a96095c930/5abb71f34e8cb332674bd788f23ffc382b785d21371ff01b9257277cdddba98a.png); [5ff8f360ac39206edd3c0b775133657dc3aa48fcfcbc2d1047603b6eff1132c9.png](assets/sdd-d50ca4a96095c930/5ff8f360ac39206edd3c0b775133657dc3aa48fcfcbc2d1047603b6eff1132c9.png); [bc89f85a0c095ff1475dceab9ec8779158a5452d9bda6642263ebd4ae398f568.png](assets/sdd-d50ca4a96095c930/bc89f85a0c095ff1475dceab9ec8779158a5452d9bda6642263ebd4ae398f568.png); [c7507dc39832dd113cbca4c6126aadfda4f84f077d5e077244ec93c56b9136e7.png](assets/sdd-d50ca4a96095c930/c7507dc39832dd113cbca4c6126aadfda4f84f077d5e077244ec93c56b9136e7.png); [cc8b1e857b8ed6f1e2614d49a47975d43f932ceccd82e5dd9a8e139a37f39f32.jpeg](assets/sdd-d50ca4a96095c930/cc8b1e857b8ed6f1e2614d49a47975d43f932ceccd82e5dd9a8e139a37f39f32.jpeg); [d80778bfe0de097c3f9950d97fe726be9af9eb2b56dff3b74ccde3724666a9ce.jpeg](assets/sdd-d50ca4a96095c930/d80778bfe0de097c3f9950d97fe726be9af9eb2b56dff3b74ccde3724666a9ce.jpeg); [ebdc9463ee1f168d235597635a90253d268a15e3438775e1956abc76d4f0b851.png](assets/sdd-d50ca4a96095c930/ebdc9463ee1f168d235597635a90253d268a15e3438775e1956abc76d4f0b851.png); [f82a47110339cb327f99ad81efc1e6b6ba6bfc1e77943d3694d7e78b73c69c4a.png](assets/sdd-d50ca4a96095c930/f82a47110339cb327f99ad81efc1e6b6ba6bfc1e77943d3694d7e78b73c69c4a.png); [fa1ef07c7d0a5a9a48725e21fb2b8a21b93ef2d3667f78d61d420978a520962f.png](assets/sdd-d50ca4a96095c930/fa1ef07c7d0a5a9a48725e21fb2b8a21b93ef2d3667f78d61d420978a520962f.png); [02aa1ad6a595ba502deb9df327dee9992471341bfe0431d63cfd4240e82ae52e.png](assets/sdd-d50ca4a96095c930/02aa1ad6a595ba502deb9df327dee9992471341bfe0431d63cfd4240e82ae52e.png); [055cc8b55d423fd424c155662a0d5b41f8b23343b8f6c46ac9e3310123fc59f6.png](assets/sdd-d50ca4a96095c930/055cc8b55d423fd424c155662a0d5b41f8b23343b8f6c46ac9e3310123fc59f6.png); [8b332db9b9ad201179ce9972bfb8e2aaaa87be335dfa2b9db968f44d3bc10a31.png](assets/sdd-d50ca4a96095c930/8b332db9b9ad201179ce9972bfb8e2aaaa87be335dfa2b9db968f44d3bc10a31.png)

#### Grupo Julio Receipt Line Insight asset

The example line-level grid shows receipt/item/company information, total and open quantities, plus receipt/line/container summaries. The surrounding text distinguishes Receipt Insight, Receipt Line Insight and Receipt Container Insight as different views; the image supplies a line-view example.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Displayed identities, quantities and totals are historical sample content.

[sdd-d50ca4a96095c930 p025-b005, p026-b004](reading/sdd-d50ca4a96095c930.md#p025-b005)

Assets: [03fcf5cb51834051c0571f658c55b1c0a810c7211d4144eb71a52ad53ec200d1.png](assets/sdd-d50ca4a96095c930/03fcf5cb51834051c0571f658c55b1c0a810c7211d4144eb71a52ad53ec200d1.png)

#### Grupo Julio Receipt Container Insight asset

The example container-level grid lists license plates, putaway groups, status, item/company and quantity with license-plate, weight and volume summaries. The prose associates Receipt Container Insight with ASNs downloaded or created in SCALE.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Putaway Pending rows and totals are sample display states, not current inventory.

[sdd-d50ca4a96095c930 p025-b005, p026-b006](reading/sdd-d50ca4a96095c930.md#p025-b005)

Assets: [bba78427ab54f73f9b016e44f287e0eb270742f0e8833b4c9dc700d67fd2665c.png](assets/sdd-d50ca4a96095c930/bba78427ab54f73f9b016e44f287e0eb270742f0e8833b4c9dc700d67fd2665c.png)

#### Grupo Julio Receipt Insight overview asset

Receipt Insight filters include receipt/type, item/company, license plate, dock, source, dates and warehouse, with an Include Closed option. The grid shows separate leading and trailing status columns and receipt summary totals. Nearby prose distinguishes this receipt-level view from line and container views.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Mixed example statuses and totals do not demonstrate an effective status-flow configuration.

[sdd-d50ca4a96095c930 p025-b005, p026-b002](reading/sdd-d50ca4a96095c930.md#p025-b005)

Assets: [c67926d376a3a6f01af6867440c75271793b7b969b71580c6c19aeb679af56a6.png](assets/sdd-d50ca4a96095c930/c67926d376a3a6f01af6867440c75271793b7b969b71580c6c19aeb679af56a6.png)

#### Grupo Julio Receiving Worksheet menu and sample assets

One screenshot highlights Print selected docs in Receipt Insight; the other is a Receiving Worksheet example with receipt/ERP/date, item lines, total/open quantities and barcodes. The source says Grupo Julio currently uses its DOC01 item document and does not use the base worksheet at that moment; possible future worksheet use and a DOC02 customization note remain conditional.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. A displayed print command and sample page do not prove a configured printer, generated report, accepted template or installed barcode layout.

[sdd-d50ca4a96095c930 p027-b004, p027-b005, p027-b007, p028-b002](reading/sdd-d50ca4a96095c930.md#p027-b004)

Assets: [a1761f9720c2ede3e38d83a99c4c61bb9ea2555652702a1479f26fca5186eed2.png](assets/sdd-d50ca4a96095c930/a1761f9720c2ede3e38d83a99c4c61bb9ea2555652702a1479f26fca5186eed2.png); [a6a785a146cd10747848e33fce746928f399b5fadd50abe48acf68428008ad56.png](assets/sdd-d50ca4a96095c930/a6a785a146cd10747848e33fce746928f399b5fadd50abe48acf68428008ad56.png)

#### Grupo Julio Schedule Appointment menu asset

A Receipt Insight example highlights Schedule appointment. The bilingual design treats this as an inbound reference workflow requiring a receipt already visible in SCALE and says appointments can be created only for open receipts.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Legacy-looking example interface is not evidence of current navigation; the source's outbound exclusion stays specific to this implementation document.

[sdd-d50ca4a96095c930 p028-b004, p029-b002, p029-b008](reading/sdd-d50ca4a96095c930.md#p028-b004)

Assets: [fe716e9b2c54c638adceb4df362ee0316609442acf31629490bf5112d86afac1.png](assets/sdd-d50ca4a96095c930/fe716e9b2c54c638adceb4df362ee0316609442acf31629490bf5112d86afac1.png)

#### Grupo Julio receiving appointment form asset

The receiving appointment form exposes carrier/trailer, appointment start/end and receiving dock fields with additional panels. The adjacent design note assigns receiving docks manually according to availability; the form does not demonstrate automatic dock optimization.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Sample dates and docks are illustrative; no capacity, scheduling or permission validation occurred.

[sdd-d50ca4a96095c930 p029-b004, p029-b005, p029-b006, p029-b007, p030-b003, p030-b004](reading/sdd-d50ca4a96095c930.md#p029-b004)

Assets: [b97655654c363929799909a17a8972797d5ccb965306e51f4eb31ab1a0a26384.png](assets/sdd-d50ca4a96095c930/b97655654c363929799909a17a8972797d5ccb965306e51f4eb31ab1a0a26384.png)

#### Grupo Julio appointment calendar asset

The calendar arranges dock doors against time columns and shows an appointment detail popup with dock, carrier/trailer, start/end and an edit action. Surrounding text describes viewing and managing appointments and preserves manual dock assignment according to availability.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. A static time slot does not establish resource availability, automatic assignment or a live appointment.

[sdd-d50ca4a96095c930 p030-b004, p031-b002](reading/sdd-d50ca4a96095c930.md#p030-b004)

Assets: [e3f1b119780a0fd66be1490bd40a1aabd3c12f78a62f65f9c96f1ae223a31785.png](assets/sdd-d50ca4a96095c930/e3f1b119780a0fd66be1490bd40a1aabd3c12f78a62f65f9c96f1ae223a31785.png)

#### Grupo Julio receiving mobile sequence media binding

The retained mobile sequence shows receiving menu, preference selection, receipt/item/quantity/license-plate entry and successful check-in/locate. The visible preference is Recibo Normal, while the figure caption and preceding instructions name Recibo Importacion. The text separately states that exiting the mobile receipt does not close it and that a completed putaway group must be closed through its own action.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. This binds the retained media to an already reviewed page-level subject; the caption/preference mismatch is unresolved and does not establish universal required prompts.

[sdd-d50ca4a96095c930 p033-b003, p033-b004, p034-b002, p034-b003](reading/sdd-d50ca4a96095c930.md#p033-b003)

Assets: [403cf22b2587bf788f6f2b43d0b9f2abae20dbc2fb7be424b50d34de035134a0.png](assets/sdd-d50ca4a96095c930/403cf22b2587bf788f6f2b43d0b9f2abae20dbc2fb7be424b50d34de035134a0.png)

#### Grupo Julio Receipt Insight Close menu assets

Two individually viewed images repeat the Receipt Insight Close action at different sizes. The preceding prose describes automatic receipt closure after the last LPN is put away when all lines are complete, and manual closure when incomplete lines will not be received. The shortage discussion requires coordination with the inventory team/ERP for missing product; these images do not remove that qualifier.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Repeated illustration counts as two distinct retained assets, not two workflows. Receipt Close is distinct from Close Container and Close Putaway Group.

[sdd-d50ca4a96095c930 p038-b005, p039-b002, p039-b004, p039-b005](reading/sdd-d50ca4a96095c930.md#p038-b005)

Assets: [4b9766341b2b5dcd2f94d8f03abea3e6212294b28cbb5be0230785a9d7f11262.png](assets/sdd-d50ca4a96095c930/4b9766341b2b5dcd2f94d8f03abea3e6212294b28cbb5be0230785a9d7f11262.png); [b30718263e6c19246846d6bfa4c4fff444de97008971ca0bc64fff304a9c4945.png](assets/sdd-d50ca4a96095c930/b30718263e6c19246846d6bfa4c4fff444de97008971ca0bc64fff304a9c4945.png)

#### Grupo Julio Add Shipment to Wave assets

Planned Shipment Insight shows Add shipment to wave and Add all filtered shipments to wave. Its companion form presents an existing-wave grid and New wave. The bilingual procedure permits an existing open wave or creation using a selected Wave Master; a new wave receives an identifier and groups the selected shipments in the Active view.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Selection, wave-master choice and current statuses were not exercised; sample shipment identities are omitted.

[sdd-d50ca4a96095c930 p058-b006, p059-b002, p059-b003, p059-b005](reading/sdd-d50ca4a96095c930.md#p058-b006)

Assets: [13df44cc8f57f0d40456336408298e68c1f567e266220758df8e05bf0ae28124.png](assets/sdd-d50ca4a96095c930/13df44cc8f57f0d40456336408298e68c1f567e266220758df8e05bf0ae28124.png); [7ce1607f0188a8c34911116dbc66376f451b25dbb7e66e37970aa6a068ab25a2.png](assets/sdd-d50ca4a96095c930/7ce1607f0188a8c34911116dbc66376f451b25dbb7e66e37970aa6a068ab25a2.png)

#### Grupo Julio Run Wave menu asset

Wave Insight displays Run and Run (select printers). The bilingual text says running executes the associated wave flow and moves the wave to Completed. The same page says the Build Wave scheduled job/automatic wave creation is not used in this implementation.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. A completed wave-processing bucket is not shipment completion or delivery; no scheduled job or printer was run.

[sdd-d50ca4a96095c930 p059-b007, p060-b002, p060-b003, p060-b005](reading/sdd-d50ca4a96095c930.md#p059-b007)

Assets: [9a0a038f13c6d3d749433802686ba7568e3eae5fcc1dc9e41d24a213e3db0bee.png](assets/sdd-d50ca4a96095c930/9a0a038f13c6d3d749433802686ba7568e3eae5fcc1dc9e41d24a213e3db0bee.png)

#### Grupo Julio Cancel Wave and disposition assets

The Completed view highlights Cancel; a companion form offers Return to pool or Add to wave. The source describes deallocation and deletion of generated work/containers for cancellation and separate choices for the affected shipments. Later text qualifies post-wave shipment cancellation when inventory has already been picked or a picker has active work.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. A static Cancel command is not permission to cancel every active or picked shipment; replenishment and shipping-work qualifications remain in the source.

[sdd-d50ca4a96095c930 p068-b003, p068-b004, p068-b005, p069-b002, p071-b002](reading/sdd-d50ca4a96095c930.md#p068-b003)

Assets: [e1515dda888f97568445052fa3d22f32cbc268a1ac2d154bdbf398ef3b102a89.jpeg](assets/sdd-d50ca4a96095c930/e1515dda888f97568445052fa3d22f32cbc268a1ac2d154bdbf398ef3b102a89.jpeg); [3c5b3e25dbc720563aeacd1fa7a59859503227fbbab3cd508c85ebfa0869b737.png](assets/sdd-d50ca4a96095c930/3c5b3e25dbc720563aeacd1fa7a59859503227fbbab3cd508c85ebfa0869b737.png)

#### Grupo Julio Release Wave menu asset

Wave Insight highlights Release. The bilingual procedure removes work hold as applicable and prints associated documents/labels as applicable; the following note identifies an initial Wave Not Released hold that release removes.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. The source's 'as applicable' qualifiers are retained; no universal document output or effective hold configuration is inferred.

[sdd-d50ca4a96095c930 p069-b004, p069-b005, p069-b006, p069-b007, p069-b009](reading/sdd-d50ca4a96095c930.md#p069-b004)

Assets: [fc7ecde453a57df9befc842e98a412e4aadfd1cd0d15b9b19b2b7e19fa2102eb.png](assets/sdd-d50ca4a96095c930/fc7ecde453a57df9befc842e98a412e4aadfd1cd0d15b9b19b2b7e19fa2102eb.png)

#### Grupo Julio wave document and label reprint asset

Wave Insight highlights separate Reprint documents and Reprint labels commands. The neighboring text distinguishes reprinting from manual work-hold maintenance in Work Insight.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. No documents or labels were generated, no printer selected and no work hold changed.

[sdd-d50ca4a96095c930 p070-b002, p070-b003, p070-b004](reading/sdd-d50ca4a96095c930.md#p070-b002)

Assets: [6b6f4d91d9e46726a3a12849adb69d0e84c445f72536d66ae4842a98254e1f7e.png](assets/sdd-d50ca4a96095c930/6b6f4d91d9e46726a3a12849adb69d0e84c445f72536d66ae4842a98254e1f7e.png)

#### Grupo Julio Work Monitoring Group asset

The group view summarizes open work by Picking, Receiving, Replenishment, Shipping and Transfer, with work/instruction/time summaries and Open, In progress, Closed last hour, At risk, Priority and On hold tiles. It illustrates the aggregate monitoring view described alongside Work Insight.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Displayed counts and estimated times are historical examples, not warehouse telemetry or accepted labor performance.

[sdd-d50ca4a96095c930 p071-b003, p072-b002, p072-b005](reading/sdd-d50ca4a96095c930.md#p071-b003)

Assets: [035027e629f789819a240eb985e719b32534e3a20356a46943114035697e1e09.png](assets/sdd-d50ca4a96095c930/035027e629f789819a240eb985e719b32534e3a20356a46943114035697e1e09.png)

#### Grupo Julio Work Insight detail asset

Work Insight shows grouped work-unit rows with date/time, instruction type, work type, condition and item context, alongside open and picked quantity totals. It illustrates the more detailed work view discussed separately from aggregate work monitoring.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Displayed work identifiers, quantities, priority and age are source examples, not open work in the assessed deployment.

[sdd-d50ca4a96095c930 p071-b003, p072-b002, p072-b003](reading/sdd-d50ca4a96095c930.md#p071-b003)

Assets: [4d129ea9f391798dee619a582277d5695dacefb719b982cd1530892cdae04b28.png](assets/sdd-d50ca4a96095c930/4d129ea9f391798dee619a582277d5695dacefb719b982cd1530892cdae04b28.png)

#### Grupo Julio Close Container form assets

The paired desktop forms show initial container identification and a populated expanded Close Container view with weight, container count, carrier/service/type, dimensions and tracking-related fields. The bilingual preceding definition says closing identifies a packed/sealed container, prevents adding another item and advances container/shipment status according to the status flow, determining the next staging/dock action.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. The forms do not establish which fields are mandatory, a mobile procedure, a replacement-license-plate rule, a reopening permission or effective status-flow behavior. Existing Packing rule uncertainty remains.

[sdd-d50ca4a96095c930 p076-b004, p077-b002, p077-b003](reading/sdd-d50ca4a96095c930.md#p076-b004)

Assets: [14055d71c7142b2e781df3a8e2d124eadacde20918a30f0cd95509952683f8d1.png](assets/sdd-d50ca4a96095c930/14055d71c7142b2e781df3a8e2d124eadacde20918a30f0cd95509952683f8d1.png); [92762fadd1ae626f9b75e39754e60e6b77f31a1a3882f6548d586b25ed21b9a6.png](assets/sdd-d50ca4a96095c930/92762fadd1ae626f9b75e39754e60e6b77f31a1a3882f6548d586b25ed21b9a6.png)

#### Grupo Julio Shipping Container Insight and Close assets

One image shows Shipping Container Insight filters and example status rows; another highlights Close. The surrounding text allows filtering by shipment and selecting a container before Close/Confirm QC without scanning its ID. Separately, editing contents or unpacking/repacking requires the container to be in a location with subclass Packing, stated in English and Spanish.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Closing, confirming QC and editing contents are distinct operations. Neither a selected Close menu nor a Packing location proves permission to reopen a sealed container or replace an LP.

[sdd-d50ca4a96095c930 p078-b002, p079-b002, p079-b004, p079-b006, p080-b002](reading/sdd-d50ca4a96095c930.md#p078-b002)

Assets: [0304b6ad77893b51087f71d2ab25ecc20dbfaa8997b00432a50bcbb5ba8184fa.png](assets/sdd-d50ca4a96095c930/0304b6ad77893b51087f71d2ab25ecc20dbfaa8997b00432a50bcbb5ba8184fa.png); [e83fdf74c52df46c5bc91ebc6b077523660fc6d58bd63a6355b5fc4d8b645246.jpeg](assets/sdd-d50ca4a96095c930/e83fdf74c52df46c5bc91ebc6b077523660fc6d58bd63a6355b5fc4d8b645246.jpeg)

#### Grupo Julio shipment carrier panel asset

The shipment Carrier panel displays carrier, service, type, route, freight and bill-of-lading context. Its caption specifically identifies changing carrier before adding the shipment to a wave. The following bilingual LTL discussion uses a separately qualified transfer-to-shipping-load route before truck loading.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. The image does not establish unrestricted post-wave carrier editing or current carrier/service master data.

[sdd-d50ca4a96095c930 p081-b002, p081-b004](reading/sdd-d50ca4a96095c930.md#p081-b002)

Assets: [0bafcc009bdf14a6be68c3c825b6496276070e2942a2c41a598069889814a40a.png](assets/sdd-d50ca4a96095c930/0bafcc009bdf14a6be68c3c825b6496276070e2942a2c41a598069889814a40a.png)

#### Grupo Julio Transfer Shipment load-selection assets

Shipment Insight highlights Transfer Shipment; the companion form requests a destination shipping-load number and shows shipment/carrier/status details. In the bilingual LTL carrier-change procedure, a known destination load may be entered or a new shipping load created before the truck is loaded.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Transfer Shipment here concerns shipment/load grouping, distinct from inventory-transfer work; no live load was changed.

[sdd-d50ca4a96095c930 p081-b004, p082-b002, p082-b003](reading/sdd-d50ca4a96095c930.md#p081-b004)

Assets: [08f3cd4e053f3d26fe20a2090004cf0f5ba59c393244e29ef93d656807197ae0.jpeg](assets/sdd-d50ca4a96095c930/08f3cd4e053f3d26fe20a2090004cf0f5ba59c393244e29ef93d656807197ae0.jpeg); [ec803e28e089983347e824b688d04f8bbd1eb9fa8edae645cca2a483cdd60761.png](assets/sdd-d50ca4a96095c930/ec803e28e089983347e824b688d04f8bbd1eb9fa8edae645cca2a483cdd60761.png)

#### Grupo Julio New Shipping Load asset

The New Shipping Load form shows carrier, route, seal, trailer, dock and shipping-document fields, with Closed displayed as No. It illustrates the new-load alternative referenced by the preceding Transfer Shipment procedure.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Visible fields and a sample Closed value do not define mandatory entries, a default for every deployment or a created load.

[sdd-d50ca4a96095c930 p081-b004, p083-b002](reading/sdd-d50ca4a96095c930.md#p081-b004)

Assets: [48072fe7ebc3e360eef0fb944a729a8e94d8339a4803c309a21d7d0d9ff1f3ee.png](assets/sdd-d50ca4a96095c930/48072fe7ebc3e360eef0fb944a729a8e94d8339a4803c309a21d7d0d9ff1f3ee.png)

#### Grupo Julio shipping-load dock selection asset

The Shipping Load form shows dock-door selection. The accompanying bilingual design says dock assignment can create work according to the flow when the shipping preference Create Dock Work On Assigning Load To Dock Door is selected.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. The work-creation result is configuration-dependent; the dropdown alone does not establish effective preference, empty dock or created work.

[sdd-d50ca4a96095c930 p085-b002, p085-b003](reading/sdd-d50ca4a96095c930.md#p085-b002)

Assets: [32e7cd7b188168f349388498ac4e780326f4a8c21ebf5dc116c758b46cb1dc57.png](assets/sdd-d50ca4a96095c930/32e7cd7b188168f349388498ac4e780326f4a8c21ebf5dc116c758b46cb1dc57.png)

#### Grupo Julio shipping-load confirmation menu asset

Shipping Load Insight highlights Confirm, with a selected sample row showing Load Confirm Pending. The adjacent English and Spanish prose instead requires all shipments in a load to be Ship Confirm Pending, describes inventory/dock release and upload at the next job, and discusses transferring not-ready shipments to another load with split-confirmation preferences. Both status labels are preserved.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. The existing prose-versus-image status discrepancy remains unresolved; the image is not proof that its displayed load status satisfies the shipment-level prerequisite or that a confirmation/upload ran.

[sdd-d50ca4a96095c930 p085-b005, p086-b002, p086-b003](reading/sdd-d50ca4a96095c930.md#p085-b005)

Assets: [a73e0af02a86dcab029134adb6d1aa0d6b2a8ff483d0724b61caf891b5d48241.jpeg](assets/sdd-d50ca4a96095c930/a73e0af02a86dcab029134adb6d1aa0d6b2a8ff483d0724b61caf891b5d48241.jpeg)

#### Grupo Julio inventory transfer-work mobile asset

The mobile sequence shows transfer-work profile/location selection, pick check-digit confirmation and putaway license-plate/quantity steps. Nearby prose distinguishes moving inventory between locations from creating transfer work in Insight and then executing that work on RF.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. This concerns inventory movement inside the warehouse, not Transfer Shipment to a shipping load; location, quantity limits and security remain configurable.

[sdd-d50ca4a96095c930 p089-b006, p090-b003](reading/sdd-d50ca4a96095c930.md#p089-b006)

Assets: [aa8652bff9c73cf0b36bef12929ccc1dc56ef77c1bef14bba56011290413e39c.png](assets/sdd-d50ca4a96095c930/aa8652bff9c73cf0b36bef12929ccc1dc56ef77c1bef14bba56011290413e39c.png)

#### Grupo Julio Cycle Count Plan Insight asset

The Cycle Count Plan Insight example lists plans with request/reviewed/open/closed summaries, date/count/error and release information. The preceding prose describes selecting item/location ranges and producing count work units by location, with cadence and zone examples.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Illustrated plan cadence, request counts and statuses are examples rather than a current counting policy or executed plan.

[sdd-d50ca4a96095c930 p091-b005, p091-b006, p091-b007, p091-b008, p092-b002](reading/sdd-d50ca4a96095c930.md#p091-b005)

Assets: [bf2e11496a7bb3297c7a60706a2be9ff3d50e24614b42ed61aa9167292e3b48c.png](assets/sdd-d50ca4a96095c930/bf2e11496a7bb3297c7a60706a2be9ff3d50e24614b42ed61aa9167292e3b48c.png)

#### Grupo Julio cycle-count mobile sequence media binding

The mobile sequence shows count work/location/check-digit steps, item/quantity entry, an empty-location verification and completion. The preceding work-execution text allows system-directed proximity or a specified location. Following text describes Verify Bad Count and two consecutive confirming counts, while preserving the source's current tolerance 9999 versus planned zero-tolerance distinction.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. This binds the retained asset to an already reviewed page-level subject. It does not resolve the tolerance conflict, prove automatic reconciliation or establish the active counting preference.

[sdd-d50ca4a96095c930 p093-b005, p094-b002, p094-b004, p095-b002](reading/sdd-d50ca4a96095c930.md#p093-b005)

Assets: [c1433e855fcc1f40c6a41f2425a6a1f2a80e339595411869911a86190984b7cf.png](assets/sdd-d50ca4a96095c930/c1433e855fcc1f40c6a41f2425a6a1f2a80e339595411869911a86190984b7cf.png)

#### Grupo Julio Cycle Count Request Reconcile asset

Cycle Count Request Insight highlights Reconcile for a Pending Review row showing a difference between system and counted quantity. The source assigns review and reconciliation of discrepancies to the supervisor before the request closes.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. The displayed discrepancy is a historical example; no stock quantity was changed and no supervisor authority was verified.

[sdd-d50ca4a96095c930 p095-b002, p095-b004, p095-b005](reading/sdd-d50ca4a96095c930.md#p095-b002)

Assets: [fb87f8af1f5cf7ff5dbea9d62f2248718bd482fdc8ce08edfa1537a8a3686444.png](assets/sdd-d50ca4a96095c930/fb87f8af1f5cf7ff5dbea9d62f2248718bd482fdc8ce08edfa1537a8a3686444.png)

#### Grupo Julio desktop and mobile reconciliation assets

Three individually inspected assets show the Warehouse Mobile Cycle count reconciliation menu, a desktop form with Set on hand quantity to and UOM/count/plan/item/location context, and a mobile form distinguishing counted quantity from the on-hand quantity entry. The nearby prose describes reconciliation updating inventory records, writing an inventory transaction and closing the request; it also identifies the mobile option.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Shown values do not prescribe the quantity to accept or establish current permissions; execution and the source's unresolved tolerance setting remain unverified.

[sdd-d50ca4a96095c930 p095-b004, p096-b002, p096-b004, p096-b005, p097-b002](reading/sdd-d50ca4a96095c930.md#p095-b004)

Assets: [3287414d6a287677b990142ea86cef2c884ba08428ea6491a573debda1bb2610.png](assets/sdd-d50ca4a96095c930/3287414d6a287677b990142ea86cef2c884ba08428ea6491a573debda1bb2610.png); [e3165645f2b85f33a98e10e547c98d908992299be384b7fb4818890e3a6a17e0.jpeg](assets/sdd-d50ca4a96095c930/e3165645f2b85f33a98e10e547c98d908992299be384b7fb4818890e3a6a17e0.jpeg); [e2deb0f69310fc7f13d9d5445d516745205be140d60ec9a0dd6f6ec5cd1aa2e7.png](assets/sdd-d50ca4a96095c930/e2deb0f69310fc7f13d9d5445d516745205be140d60ec9a0dd6f6ec5cd1aa2e7.png)

#### Grupo Julio shipment labor-planning criteria asset

The sample criteria editor identifies ShipmentDetail and shows a warehouse-equality condition. Nearby prose illustrates associating a labor group with shipment lines originating in a selected work zone. These are different examples of criteria, not evidence that the displayed warehouse predicate implements the work-zone example.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. No predicate is promoted to production SQL or effective labor configuration; sample environment identifiers are omitted.

[sdd-d50ca4a96095c930 p099-b006, p100-b002, p100-b003](reading/sdd-d50ca4a96095c930.md#p099-b006)

Assets: [315d2bd642b896fb2d1369dc7218ebbc177ce001de1a054a5a9bfa7bcac62a78.png](assets/sdd-d50ca4a96095c930/315d2bd642b896fb2d1369dc7218ebbc177ce001de1a054a5a9bfa7bcac62a78.png)

#### Grupo Julio Labor Activity Insight asset

The historical Labor Activity Insight grid includes Sign On, Screen Entry and Screen Exit activities with time, user, screen, actual-rate and labor-group columns. The surrounding text names this screen as the activity view; direct/indirect labor definitions separately describe manual entry for indirect activities rather than RF capture.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. Sample identities, timestamps, zero summaries and rates are not current staff activity, measured performance or an effective monitoring policy.

[sdd-d50ca4a96095c930 p100-b005, p100-b006, p100-b008, p101-b002](reading/sdd-d50ca4a96095c930.md#p100-b005)

Assets: [54507e10cc69c6b460c25b70025408fa49cf8ede8521da939b4242d32bcffdfe.png](assets/sdd-d50ca4a96095c930/54507e10cc69c6b460c25b70025408fa49cf8ede8521da939b4242d32bcffdfe.png)

#### Grupo Julio custom labor-report example asset

The sample Labor Management OSCI report combines a stacked area chart of labor hours with Cases Per Hour and Pallets Per Hour lines. The source explicitly identifies it as a custom example, not an existing report, and notes SCI framework dependency and a dedicated reporting discussion; optional Operational SCI or SSRS may support report development.

Limit: Static source illustration for the named Grupo Julio Active SCALE design v1.5; no deployed configuration, live transactions, permissions, performance or accessibility acceptance established. The chart is not an installed report, accepted specification, benchmark or measured throughput; no SCI/SSRS deployment was observed.

[sdd-d50ca4a96095c930 p101-b004, p101-b005](reading/sdd-d50ca4a96095c930.md#p101-b004)

Assets: [c39f31f10c0d81a1d97005173e6cbb99d8b9942b47e7ceced13a203551a7cd38.jpeg](assets/sdd-d50ca4a96095c930/c39f31f10c0d81a1d97005173e6cbb99d8b9942b47e7ceced13a203551a7cd38.jpeg)

#### Knipper cover artwork

The cover combines a red angled background motif, Knipper logo and Manhattan Associates logo. These three decorative assets contain no functional configuration. Cover document version 1.0 differs from the v1.3 filename/footer designation.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p001-b006, p001-b007, p001-b009, p001-b010, p001-b013, p002-b034](reading/sdd-1c25f20de1eafc3e.md#p001-b006)

Assets: [9384edb01602f1f189d8c2f283d4a76935c2348b5bb75a4eb34653e30777e7e0.jpeg](assets/sdd-1c25f20de1eafc3e/9384edb01602f1f189d8c2f283d4a76935c2348b5bb75a4eb34653e30777e7e0.jpeg); [eaef899015185c4f103949b5249920583723260da72266402498b32d292cdb5c.png](assets/sdd-1c25f20de1eafc3e/eaef899015185c4f103949b5249920583723260da72266402498b32d292cdb5c.png); [b9e4fafe3053faed937ecb6aadb4758d3af190cbe9b14b74e03bec3d108788ef.jpeg](assets/sdd-1c25f20de1eafc3e/b9e4fafe3053faed937ecb6aadb4758d3af190cbe9b14b74e03bec3d108788ef.jpeg)

#### Knipper repeated footer decoration

The red angled footer artwork is decorative. Page2 is the representative inspected context; repeated placement across many pages contributes no additional semantic citation credit.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p002-b001](reading/sdd-1c25f20de1eafc3e.md#p002-b001)

Assets: [2b16f2f8dcb7e116e462f0d8e948824036630885d65a93b83a876f3efef3adef.jpeg](assets/sdd-1c25f20de1eafc3e/2b16f2f8dcb7e116e462f0d8e948824036630885d65a93b83a876f3efef3adef.jpeg)

#### Warehouse statistics workbook icon

Page5 shows an Excel icon beside Warehouse Stats.xlsx; it exposes no workbook cells, statistics or layout drawing. The page says existing layouts are used and drawings are unavailable.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p005-b003, p005-b004, p005-b008](reading/sdd-1c25f20de1eafc3e.md#p005-b003)

Assets: [d0b172e3270639be9ce96d74307553d920592f6e18dcf51c0f029b01e141faab.png](assets/sdd-1c25f20de1eafc3e/d0b172e3270639be9ce96d74307553d920592f6e18dcf51c0f029b01e141faab.png)

#### Receiving worksheet illustrations

Two distinct worksheet examples show receipt identifiers, ERP order field, receiving date, warehouse/source information, total received quantity and per-line quantities, barcodes and measurements. The page15 note describes a customized worksheet to be ported; these samples are not evidence of the final migrated form.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p015-b003, p015-b004, p019-b003](reading/sdd-1c25f20de1eafc3e.md#p015-b003)

Assets: [42c31445cf97e36599e92d0e6bd529e96ea33cb63c6195f95392790714d7f0af.png](assets/sdd-1c25f20de1eafc3e/42c31445cf97e36599e92d0e6bd529e96ea33cb63c6195f95392790714d7f0af.png); [a1761f9720c2ede3e38d83a99c4c61bb9ea2555652702a1479f26fca5186eed2.png](assets/sdd-1c25f20de1eafc3e/a1761f9720c2ede3e38d83a99c4c61bb9ea2555652702a1479f26fca5186eed2.png)

#### Receipt header, line and container examples

Three images separately show Receipt Insight with receipt-level status columns, a Receipt Line editor with item/lot/quantity fields, and Receipt Container Insight with LPN/status/quantity rows. Different sample environments are visible; no row values establish Knipper production data.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p017-b003, p017-b005, p017-b007](reading/sdd-1c25f20de1eafc3e.md#p017-b003)

Assets: [aa8d8a76ca3746dabefa2e6706af4d5a971a141c246bd6c09ce061eb01f4d89a.jpeg](assets/sdd-1c25f20de1eafc3e/aa8d8a76ca3746dabefa2e6706af4d5a971a141c246bd6c09ce061eb01f4d89a.jpeg); [4d32a9bb07594a8dd2e40a3c178fa331398b7e9e70e8c02c5e34cd42c7b9acb4.png](assets/sdd-1c25f20de1eafc3e/4d32a9bb07594a8dd2e40a3c178fa331398b7e9e70e8c02c5e34cd42c7b9acb4.png); [5d10a4b94fcb08ee539fe040f79101a82f8cdabcd51c077926831a5794a0d4ee.png](assets/sdd-1c25f20de1eafc3e/5d10a4b94fcb08ee539fe040f79101a82f8cdabcd51c077926831a5794a0d4ee.png)

#### Receipt document-print selection

Receipt Insight has its Actions menu open with Print selected docs visible. The page calls this Printing Receiving worksheet; adjacent comments clarify two forms to port while the body names DOC01.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p018-b004, p018-b006, p018-b007, p018-b008, p018-b009](reading/sdd-1c25f20de1eafc3e.md#p018-b004)

Assets: [53a7285121b877389383cf277c09b78d78ddfb2ec4c2e6241fd2993f317694dc.png](assets/sdd-1c25f20de1eafc3e/53a7285121b877389383cf277c09b78d78ddfb2ec4c2e6241fd2993f317694dc.png)

#### Optional inbound appointment examples

The appointment editor contains receipt/trailer, start/end date/time and receiving-dock fields. A separate graphical calendar arranges time against dock-door rows. The surrounding design keeps scheduling outside SCALE and provides these windows for possible future/reference use.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p019-b008, p019-b010, p020-b003, p020-b004, p020-b005, p020-b006](reading/sdd-1c25f20de1eafc3e.md#p019-b008)

Assets: [27aaae8dab411569d643098a7b9cf4880c6564ce3d90859a064f8fcf34591a01.png](assets/sdd-1c25f20de1eafc3e/27aaae8dab411569d643098a7b9cf4880c6564ce3d90859a064f8fcf34591a01.png); [06baa213112c6d4a75fc8f3ec7e6658af5a133f52c7edddb18b381f83c03570a.png](assets/sdd-1c25f20de1eafc3e/06baa213112c6d4a75fc8f3ec7e6658af5a133f52c7edddb18b381f83c03570a.png)

#### Standard receiving preference example

The General tab selects QA HOLD and System license-plate assignment, checks Create Putaway Work, and leaves Allow Over Receiving and Execute Group Putaway unchecked. Work type and work team are blank. This is a legacy Edit Existing illustration.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p023-b003, p023-b007](reading/sdd-1c25f20de1eafc3e.md#p023-b003)

Assets: [2d5ed141af62b147bc5721e770bb3b9001e3c0bcdecba58505c8d1196fc45cf0.png](assets/sdd-1c25f20de1eafc3e/2d5ed141af62b147bc5721e770bb3b9001e3c0bcdecba58505c8d1196fc45cf0.png)

#### Item-level Warehouse Mobile receiving sequence

The sequence selects a receiving preference, identifies receipt and item, enters quantity/UM, then displays a license-plate entry before returning to item entry. The selected example says Not SN Tracked and does not demonstrate serial capture or the proposed DSCSA extension.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p023-b007, p024-b004, p024-b005, p024-b006](reading/sdd-1c25f20de1eafc3e.md#p023-b007)

Assets: [82db4e028f18853237769914526f6ca2ee361b714fb249d3bf8c2e153380c126.png](assets/sdd-1c25f20de1eafc3e/82db4e028f18853237769914526f6ca2ee361b714fb249d3bf8c2e153380c126.png)

#### Receipt Workbench and lot-entry examples

One image shows Check in partial quantity with quantity, UM, locating rule and location. A second composite shows a separate Lot entry dialog with lot, expiration date, quantity and UM when lot was not prepopulated. The composite panels contain different sample items, so they are illustrative rather than a proven transaction trace.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p025-b007, p025-b010, p025-b012, p025-b013, p025-b015](reading/sdd-1c25f20de1eafc3e.md#p025-b007)

Assets: [e6810a03f11316a47a549cc19418726e63c673e29179bd920191308fb402d10a.png](assets/sdd-1c25f20de1eafc3e/e6810a03f11316a47a549cc19418726e63c673e29179bd920191308fb402d10a.png); [e8291a4ef1d5da2e8dc4e2b43191c4c4fa57fee3e6cadaa63230d3b741807a94.jpeg](assets/sdd-1c25f20de1eafc3e/e8291a4ef1d5da2e8dc4e2b43191c4c4fa57fee3e6cadaa63230d3b741807a94.jpeg)

#### Damage receiving options and workbench

The preference Workbench tab selects Child locating, requires disposition and verifies item dimensions; Reason Code Required, QC Inspection Active and Verify Item Unit of Measure are unchecked. The workbench example nevertheless has a populated reason code and a disposition value; an optional reason being populated does not make it mandatory.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p025-b014, p026-b003, p026-b004, p026-b005, p027-b005](reading/sdd-1c25f20de1eafc3e.md#p025-b014)

Assets: [f0744dfa5cbb2ef6d97ba3924cee31483bbc01caf9255eadceef57de5df4c3c0.png](assets/sdd-1c25f20de1eafc3e/f0744dfa5cbb2ef6d97ba3924cee31483bbc01caf9255eadceef57de5df4c3c0.png); [3cb09d6a0cea26bb82679f97fdc15d5fde5fcdf6bf6a859298fa2f5913f69027.png](assets/sdd-1c25f20de1eafc3e/3cb09d6a0cea26bb82679f97fdc15d5fde5fcdf6bf6a859298fa2f5913f69027.png)

#### Returns receiving options and workbench

The returns preference selects Child locating, requires disposition and reason codes, verifies dimensions, and leaves QC Inspection Active and Verify Item Unit of Measure unchecked. The adjacent workbench uses a return reason and disposition. Prose says inventory status depends on the return condition and includes Available/Awaiting Client.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p027-b007, p027-b008, p027-b011, p028-b009, p028-b011](reading/sdd-1c25f20de1eafc3e.md#p027-b007)

Assets: [c25a63606546f733fe4ad354bc983796d0839fdabc1f8ffeba1c89c4687e526c.png](assets/sdd-1c25f20de1eafc3e/c25a63606546f733fe4ad354bc983796d0839fdabc1f8ffeba1c89c4687e526c.png); [e168cd3932b83d77889535fdb13cf6a65bcc0c3e411d22e3be06795bb02e5298.png](assets/sdd-1c25f20de1eafc3e/e168cd3932b83d77889535fdb13cf6a65bcc0c3e411d22e3be06795bb02e5298.png)

#### Blind receiving Warehouse Mobile examples

Two source strips show Receiving menu and blind preference, then receipt/item/quantity entry followed by lot, expiration, reason and inventory status screens. The final strip contains a check-in/locate success message in the historical sample; it is not execution performed in this review.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p028-b011, p028-b012, p030-b004](reading/sdd-1c25f20de1eafc3e.md#p028-b011)

Assets: [4ff08e4c36281d0e206f1cf0e0ecae13dd544fcd403e56836ec8d84226687ffc.png](assets/sdd-1c25f20de1eafc3e/4ff08e4c36281d0e206f1cf0e0ecae13dd544fcd403e56836ec8d84226687ffc.png); [9f485d02afb19f35e93d0508735b65da961c45b63e0f56f146437f7b1fa84202.png](assets/sdd-1c25f20de1eafc3e/9f485d02afb19f35e93d0508735b65da961c45b63e0f56f146437f7b1fa84202.png)

#### Disposition-code selection

The RF Receipt check in image opens a disposition-code choice list with multiple Quality Control descriptions distinguished by codes. Surrounding text says site codes overlap and were to be revisited during build; this is not a final normalized catalog.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p030-b004, p031-b003](reading/sdd-1c25f20de1eafc3e.md#p030-b004)

Assets: [05403fa146711934a04f9826f7d977d6535ff4e37bca127b22274f6192e01663.png](assets/sdd-1c25f20de1eafc3e/05403fa146711934a04f9826f7d977d6535ff4e37bca127b22274f6192e01663.png)

#### Receipt Close action repeated on two pages

One retained xref is reused on pages32 and33. Receipt Insight Actions highlights Close. It illustrates both normal close and shortage discussion; a highlighted menu item is not proof that the close occurred.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p031-b003, p032-b003, p032-b013, p033-b004](reading/sdd-1c25f20de1eafc3e.md#p031-b003)

Assets: [22cbd468bdc16a1563b52ed5af47e15084bb299f8913fe7a927d102533cf8585.png](assets/sdd-1c25f20de1eafc3e/22cbd468bdc16a1563b52ed5af47e15084bb299f8913fe7a927d102533cf8585.png)

#### Receipt troubleshooting illustration under closing caption

Page34 captions the image Closing receipt Shortages, but the image is Receipt Workbench with a banner saying receipt containers were unlocated successfully and container rows at Locate Pending. It does not visually demonstrate closing a receipt.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p034-b004, p034-b005, p034-b007](reading/sdd-1c25f20de1eafc3e.md#p034-b004)

Assets: [901fe47ce345ef64262b698cbccf3e788caf26d3954b061050470fc23b8e3546.jpeg](assets/sdd-1c25f20de1eafc3e/901fe47ce345ef64262b698cbccf3e788caf26d3954b061050470fc23b8e3546.jpeg)

#### Putaway execution and action menu

The execution strip selects Putaway work, scans a user-directed work unit, then shows pick and putaway confirmation with location and item validation. The separate Actions menu exposes Locate, Override, Pass and Skip. These reference product samples do not establish which actions a Knipper user may execute.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p039-b003, p039-b004, p039-b005, p041-b003](reading/sdd-1c25f20de1eafc3e.md#p039-b003)

Assets: [e56708a3dd504c387c83ee753436e2a0ab934274a72d97c0033f0be035919417.png](assets/sdd-1c25f20de1eafc3e/e56708a3dd504c387c83ee753436e2a0ab934274a72d97c0033f0be035919417.png); [d8039dabb9a1f280c4520a6d00dfcdc88822f83a02350bbd9cb315e99e596dec.png](assets/sdd-1c25f20de1eafc3e/d8039dabb9a1f280c4520a6d00dfcdc88822f83a02350bbd9cb315e99e596dec.png)

#### Inventory adjustment UI and mobile

The fixed-station adjustment window exposes adjustment type, LPN, location, item, lot/expiration, quantity/UM and status; a separate RF adjustment example prompts for quantity. The examples do not demonstrate a completed adjustment.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p042-b005, p043-b005, p043-b008](reading/sdd-1c25f20de1eafc3e.md#p042-b005)

Assets: [8b83ed51a7295d9c522e9819828e0ae12b6293b898b85c5c5c3c3397bd339cb1.png](assets/sdd-1c25f20de1eafc3e/8b83ed51a7295d9c522e9819828e0ae12b6293b898b85c5c5c3c3397bd339cb1.png); [f5eda18c48a45864d2577ef6b7da1d9eef12ca495f8e9da8f9bc8cfbd031dba7.png](assets/sdd-1c25f20de1eafc3e/f5eda18c48a45864d2577ef6b7da1d9eef12ca495f8e9da8f9bc8cfbd031dba7.png)

#### Inventory transfer and RF work execution

The transfer window provides from/to location, inventory attributes and quantity. The execution strip selects Transfer Work, validates a pick check digit and requests a putaway license plate. The source requires transfer-with-work creation from Insight and permits RF execution.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p043-b012, p044-b003, p045-b005](reading/sdd-1c25f20de1eafc3e.md#p043-b012)

Assets: [afc00c750e018d821c68861732216e76b3cadfeae2911dab0796386e87c86c31.png](assets/sdd-1c25f20de1eafc3e/afc00c750e018d821c68861732216e76b3cadfeae2911dab0796386e87c86c31.png); [aa8652bff9c73cf0b36bef12929ccc1dc56ef77c1bef14bba56011290413e39c.png](assets/sdd-1c25f20de1eafc3e/aa8652bff9c73cf0b36bef12929ccc1dc56ef77c1bef14bba56011290413e39c.png)

#### Mobile Location Inquiry search, result and actions

The search accepts location, item or LP. Separate result images show lot, status, on-hand quantity and UM; the Actions list includes Adjust, Status change, Transfer and Previous record. Comments distinguish this RF view from the fuller Inventory Insight and qualify access by user profile.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p046-b010, p046-b011, p046-b012, p046-b013, p047-b005](reading/sdd-1c25f20de1eafc3e.md#p046-b010)

Assets: [d7e50d58c7b280ee73acfb65842d133fc9bcaa4c281d8931db3dd99ef5176272.png](assets/sdd-1c25f20de1eafc3e/d7e50d58c7b280ee73acfb65842d133fc9bcaa4c281d8931db3dd99ef5176272.png); [9f41a17c466b3447e9abec88ea1f8c3e143482b01846500f5ea691f6adf530a0.png](assets/sdd-1c25f20de1eafc3e/9f41a17c466b3447e9abec88ea1f8c3e143482b01846500f5ea691f6adf530a0.png); [f31dd04b81e9b812c71768f879042c3131c385c50ef77cfa9b29b0ae760ff4f7.jpeg](assets/sdd-1c25f20de1eafc3e/f31dd04b81e9b812c71768f879042c3131c385c50ef77cfa9b29b0ae760ff4f7.jpeg)

#### Cycle Count Plan Insight

Plan Insight displays plan/master/status dates and open/closed/error/released columns with plan/request counters. Source schedules and example client/location criteria are reference examples rather than required universal cycles.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p048-b005, p048-b006, p048-b007, p048-b008, p048-b009, p048-b010](reading/sdd-1c25f20de1eafc3e.md#p048-b005)

Assets: [8b6286e8e43ed9f5490eb593367436c73f1b01ee010b215f57d2635866cdeb99.png](assets/sdd-1c25f20de1eafc3e/8b6286e8e43ed9f5490eb593367436c73f1b01ee010b215f57d2635866cdeb99.png)

#### Cycle count mobile execution

The strip selects a user-directed count work unit, requests location check digit and quantity, and offers Add item/Done. A Verify empty illustration does not demonstrate every promised lot, expiration or LPN field discussed in comments.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p050-b003, p050-b004, p050-b005, p050-b006, p050-b007, p050-b009, p050-b012, p050-b013, p050-b014, p050-b015](reading/sdd-1c25f20de1eafc3e.md#p050-b003)

Assets: [a430ca298324e8d3d46f72e3f6ec42f6028e684d105e25c38cafc197c2116c0a.png](assets/sdd-1c25f20de1eafc3e/a430ca298324e8d3d46f72e3f6ec42f6028e684d105e25c38cafc197c2116c0a.png)

#### Cycle-count reconciliation UI and mobile

Request Insight highlights Reconcile for a Pending Review row. The fixed-station reconciliation form requests Set on hand quantity to; the mobile menu and separate reconciliation form expose the corresponding on-hand quantity entry. These four figures depict available paths, not a completed reconciliation.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p051-b004, p051-b005, p052-b003, p052-b005, p052-b006, p053-b004](reading/sdd-1c25f20de1eafc3e.md#p051-b004)

Assets: [fb87f8af1f5cf7ff5dbea9d62f2248718bd482fdc8ce08edfa1537a8a3686444.png](assets/sdd-1c25f20de1eafc3e/fb87f8af1f5cf7ff5dbea9d62f2248718bd482fdc8ce08edfa1537a8a3686444.png); [e3165645f2b85f33a98e10e547c98d908992299be384b7fb4818890e3a6a17e0.jpeg](assets/sdd-1c25f20de1eafc3e/e3165645f2b85f33a98e10e547c98d908992299be384b7fb4818890e3a6a17e0.jpeg); [72361a1d89665ae27325db1d4a52a163a1c4edd9c89f996e0351a71c2f6c371e.png](assets/sdd-1c25f20de1eafc3e/72361a1d89665ae27325db1d4a52a163a1c4edd9c89f996e0351a71c2f6c371e.png); [e2647162302284b306c5488d1173bea51a6c1ee5011554dd8efd2abec1509bb4.png](assets/sdd-1c25f20de1eafc3e/e2647162302284b306c5488d1173bea51a6c1ee5011554dd8efd2abec1509bb4.png)

#### Demand replenishment master General tab

The legacy example selects Demand from wave and Automatic work creation, priority 5 and Pallet increment. Allocate all UMs to clear reserve location, Create multiple requests for excess demand, and Inactive are unchecked; Consolidate replenishment requests is disabled. Adjacent prose distinguishes case and pallet targets while a site comment says pick-to-zero need not be case-level.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p054-b003, p054-b008, p054-b009, p054-b010, p054-b011](reading/sdd-1c25f20de1eafc3e.md#p054-b003)

Assets: [e9205b88c4e731dae74a5a22c544dff634fd169918b872e5578af5fa60af45f9.png](assets/sdd-1c25f20de1eafc3e/e9205b88c4e731dae74a5a22c544dff634fd169918b872e5578af5fa60af45f9.png)

#### Manual replenishment invocation and master selection

Inventory Insight Actions highlights Manual replenishment; a second window lists a checked master with Replenish and Cancel controls. These images illustrate manual selection while prose separately allows scheduled jobs and requires item location assignment/capacity.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p055-b004, p055-b005, p055-b006, p055-b007, p055-b009, p055-b010](reading/sdd-1c25f20de1eafc3e.md#p055-b004)

Assets: [19680dd55df39417aac578290cf5572620aa43a49b47a5177c05b3ed43d4a094.png](assets/sdd-1c25f20de1eafc3e/19680dd55df39417aac578290cf5572620aa43a49b47a5177c05b3ed43d4a094.png); [ecfc649f1d64d60bfd5748bd89c71c3779569a832d68a53088680d6733444329.png](assets/sdd-1c25f20de1eafc3e/ecfc649f1d64d60bfd5748bd89c71c3779569a832d68a53088680d6733444329.png)

#### Item Location Capacity percentage example

The legacy Item Location Capacity window selects a specific location and shows minimum replenishment threshold 5%, top-off minimum 5%, maximum fill 100%. These are screenshot examples; the text says threshold-based real-time replenishment is excluded from go-live and describes possible later adoption.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p056-b005, p056-b006, p056-b007, p056-b011](reading/sdd-1c25f20de1eafc3e.md#p056-b005)

Assets: [cbcf38295ec9fcca8fafb0c89005fc39acf0de5c91338eb0004daac398716cd8.jpeg](assets/sdd-1c25f20de1eafc3e/cbcf38295ec9fcca8fafb0c89005fc39acf0de5c91338eb0004daac398716cd8.jpeg)

#### High/low replenishment work criteria

Three legacy figures show a high-zone Filter data tab, its Order by tab and a low-zone Filter data tab. Visible filters use warehouse, work-zone alternatives and replenishment mode; right-side clipping prevents reconstruction of the complete Boolean expressions. The sort example has two truncated FROM_TEMP attributes with Create work unit Yes and FROM_LOC with No, all ascending. No hidden attribute suffix or missing parenthesis is inferred.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p059-b005, p059-b006, p060-b003, p060-b004](reading/sdd-1c25f20de1eafc3e.md#p059-b005)

Assets: [f8946d2e4376ca2b37f77da51a8ed8a246e588daf78b6538eff4263aa5b8f161.png](assets/sdd-1c25f20de1eafc3e/f8946d2e4376ca2b37f77da51a8ed8a246e588daf78b6538eff4263aa5b8f161.png); [2c6a4c158b4760fa7225feb00cb1ece00143926b73efe7b5be5237eb1d1f0148.png](assets/sdd-1c25f20de1eafc3e/2c6a4c158b4760fa7225feb00cb1ece00143926b73efe7b5be5237eb1d1f0148.png); [6c9b6a5763a2f3018afeab76e49d3e2aa277d35d06902774b44d4caa873a26f5.png](assets/sdd-1c25f20de1eafc3e/6c9b6a5763a2f3018afeab76e49d3e2aa277d35d06902774b44d4caa873a26f5.png)

#### Replenishment mobile work execution

The strip selects a system-directed replenishment profile and location, then asks for pick and putaway check digits. The body permits configurable location or check-digit validation for destination locations. The source sample profile name differs from the two profile names given in prose.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p061-b003, p061-b004, p061-b005](reading/sdd-1c25f20de1eafc3e.md#p061-b003)

Assets: [4f4331bca87c0912a0781c948889d7052c2f05a3fb060a5f06e802626ee735d5.png](assets/sdd-1c25f20de1eafc3e/4f4331bca87c0912a0781c948889d7052c2f05a3fb060a5f06e802626ee735d5.png)

#### Finished-goods confirmation and putaway

Work Order Insight highlights Confirm; the confirmation window includes quantity/UM, putaway location, lot/expiration and license plate. A separate RF sequence selects the finished-goods work profile and user-directed work, followed by pick and putaway confirmation. Different product examples prevent treating the sequence as a single transaction.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p064-b010, p064-b015, p065-b003, p065-b004, p065-b005, p065-b006, p065-b007](reading/sdd-1c25f20de1eafc3e.md#p064-b010)

Assets: [667b4d4053bd3eeaa88866fee2a100b293c893bd50aa12391a194fb69740a057.jpeg](assets/sdd-1c25f20de1eafc3e/667b4d4053bd3eeaa88866fee2a100b293c893bd50aa12391a194fb69740a057.jpeg); [b020b98e60f958800640952ac0f4316ca9e9602a4e36994dadc9939cb269d852.png](assets/sdd-1c25f20de1eafc3e/b020b98e60f958800640952ac0f4316ca9e9602a4e36994dadc9939cb269d852.png); [710c8e16d6c4237977d9e7efb1e973c915bb24016ea321891a0e24ddb11ba932.png](assets/sdd-1c25f20de1eafc3e/710c8e16d6c4237977d9e7efb1e973c915bb24016ea321891a0e24ddb11ba932.png)

#### Wave Master mode example

The legacy Standard Order example selects Automatic mode with priority 1, default wave criteria, Standard Order flow, blank wave maximums, unchecked Auto release, unchecked Maintain allocated replenishments upon wave cancellation and unchecked Inactive. This example does not establish the mode of every planned Knipper master.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p072-b003, p072-b004, p072-b006](reading/sdd-1c25f20de1eafc3e.md#p072-b003)

Assets: [d8240bdba1c89a37c8350255762b6716786bc88373b62b89a61e6348e2008462.png](assets/sdd-1c25f20de1eafc3e/d8240bdba1c89a37c8350255762b6716786bc88373b62b89a61e6348e2008462.png)

#### Add shipment to wave and new-wave examples

Planned Shipment Insight highlights Add shipment to wave. The new-wave screen offers wave-master templates and a custom-wave area whose Auto release is No. Wave Insight shows an Active wave with planned-shipment totals. Source-specific master names listed in prose are not identical to the generic screenshot templates.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p072-b006, p073-b003, p073-b004, p073-b005, p074-b003, p074-b005](reading/sdd-1c25f20de1eafc3e.md#p072-b006)

Assets: [ea34305d1b25bedb9c4470f1d0fc60984f8739879ef14345eb43daf80fbd8634.png](assets/sdd-1c25f20de1eafc3e/ea34305d1b25bedb9c4470f1d0fc60984f8739879ef14345eb43daf80fbd8634.png); [26febd685d69f1f5bd3b653cf22c5bfb23cb2abe538c3377be01b4d54f3f3ad1.png](assets/sdd-1c25f20de1eafc3e/26febd685d69f1f5bd3b653cf22c5bfb23cb2abe538c3377be01b4d54f3f3ad1.png); [5dfb7a9e0fc51ca285d472ec5ee5ea0f3784a781da541f7de1cce4d15705dff5.png](assets/sdd-1c25f20de1eafc3e/5dfb7a9e0fc51ca285d472ec5ee5ea0f3784a781da541f7de1cce4d15705dff5.png)

#### Wave Insight Run action

The Wave Insight Actions menu highlights Run and separately offers Run (select printers). Body text says confirmed execution follows the associated Wave Flow, and identifies auto-refresh and PTL splitting as extensions rather than demonstrated base behavior.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p075-b004, p075-b005, p075-b006, p075-b009](reading/sdd-1c25f20de1eafc3e.md#p075-b004)

Assets: [35aadfff9e04a125ec3a177367b5c5d4895a73e2c1130857655b1edce96bc4c8.png](assets/sdd-1c25f20de1eafc3e/35aadfff9e04a125ec3a177367b5c5d4895a73e2c1130857655b1edce96bc4c8.png)

#### Cancel wave and destination options

Wave Insight highlights Cancel; a separate Cancel wave window offers Return to pool and Add to wave. The images show available actions, not cancellation execution, and do not resolve the separately recorded active-picking cancellation dispute.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p089-b004, p089-b005, p089-b006](reading/sdd-1c25f20de1eafc3e.md#p089-b004)

Assets: [925443c5d1a132dc80b572da0ac3453166539fbb5109ff568291ed9f600c775a.png](assets/sdd-1c25f20de1eafc3e/925443c5d1a132dc80b572da0ac3453166539fbb5109ff568291ed9f600c775a.png); [6febaae08508fee8c03798a72dc1fae7200222bcd350d76ed15c1bd28bf02dba.png](assets/sdd-1c25f20de1eafc3e/6febaae08508fee8c03798a72dc1fae7200222bcd350d76ed15c1bd28bf02dba.png)

#### Release and reprint wave documents or labels

Two distinct Wave Insight images highlight Release and the Reprint documents/Reprint labels actions. The body associates release with removing Wave Not Released work holds and configured printing; comments locate work hold details in Work Insight.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p089-b009, p089-b010, p090-b004, p090-b008, p090-b009, p090-b010, p091-b004](reading/sdd-1c25f20de1eafc3e.md#p089-b009)

Assets: [820d79b6e92ed225a55e012f8f98fe932d3c0348ee05e12bf428f7e6fc3f14ff.png](assets/sdd-1c25f20de1eafc3e/820d79b6e92ed225a55e012f8f98fe932d3c0348ee05e12bf428f7e6fc3f14ff.png); [823d553f7cbe81e0f1650aaec2bd2c0aa2d9ada6dd4503fae39c919aed973ef9.png](assets/sdd-1c25f20de1eafc3e/823d553f7cbe81e0f1650aaec2bd2c0aa2d9ada6dd4503fae39c919aed973ef9.png)

#### Work Insight and Work Monitoring Group

Work Insight shows grouped work-unit header/detail rows and criteria. Work Monitoring Group shows open work by group and indicator counts for at-risk, priority and held work. These sampled counters are not current warehouse telemetry.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p092-b005, p092-b006, p092-b008](reading/sdd-1c25f20de1eafc3e.md#p092-b005)

Assets: [1c99c15751f4026bfc6fb8893c16965942500b8bc5a87e1c6b15a2e26d42e347.png](assets/sdd-1c25f20de1eafc3e/1c99c15751f4026bfc6fb8893c16965942500b8bc5a87e1c6b15a2e26d42e347.png); [cb8be4048d0fcbcffe49f5eea96a6ab7f83aa847b3648fb356c9554e704cea9d.png](assets/sdd-1c25f20de1eafc3e/cb8be4048d0fcbcffe49f5eea96a6ab7f83aa847b3648fb356c9554e704cea9d.png)

#### Cart picking mobile sequence

The composite selects Work execution and a cart-picking profile, scans containers and Begin picks, then shows location/container validation for different cart spots and a final all-items putaway location. The figure continues the cart-picking discussion; the Full Pallet Pick section starts below and does not reclassify this figure as pallet picking.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p095-b003](reading/sdd-1c25f20de1eafc3e.md#p095-b003)

Assets: [cb14943ff32a74ffb3c4942c6d7544c2682b980397fa6cf999f56ed9018fdb92.png](assets/sdd-1c25f20de1eafc3e/cb14943ff32a74ffb3c4942c6d7544c2682b980397fa6cf999f56ed9018fdb92.png)

#### QC Workbench Pending example

The QC Workbench image is Pending, with item/UM entry, count controls, Print/Submit and rows for packed/counted/failed/reason-code/lot information. It does not display the proposed nested-pallet customization or demonstrate picker/QC operator separation.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p100-b005, p100-b006, p100-b008, p100-b009, p100-b010, p100-b012, p100-b014](reading/sdd-1c25f20de1eafc3e.md#p100-b005)

Assets: [bda78a4360c6acbd843fecdc7ab948e423521676352e4fd110298c6d35704f88.jpeg](assets/sdd-1c25f20de1eafc3e/bda78a4360c6acbd843fecdc7ab948e423521676352e4fd110298c6d35704f88.jpeg)

#### Close Container initiation and details

The first image shows container ID and weight; the second expands container counts, carrier/service, container type, dimensions, NMFC and tracking fields. Neither figure demonstrates successful closing, printing or a current parcel carrier integration.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p102-b004, p102-b005, p102-b006, p102-b007, p103-b003](reading/sdd-1c25f20de1eafc3e.md#p102-b004)

Assets: [b95a80b7dce0e72abf4caa52c8c1b89c8f010df877754a183129ab33f70334c4.png](assets/sdd-1c25f20de1eafc3e/b95a80b7dce0e72abf4caa52c8c1b89c8f010df877754a183129ab33f70334c4.png); [2bec26942bf4197ee15e862f1faf552015931add8133b7a0b1f1a6ea7d66f5fb.png](assets/sdd-1c25f20de1eafc3e/2bec26942bf4197ee15e862f1faf552015931add8133b7a0b1f1a6ea7d66f5fb.png)

#### Shipping Container Insight and Close action

Two distinct images repeat the same screen subject, with the latter outlining Close. The menu also shows edit, QC, dock transfer, manifest, nest and printing actions with some disabled; source availability remains state/security dependent and unverified.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p103-b005, p103-b006, p104-b004, p104-b005](reading/sdd-1c25f20de1eafc3e.md#p103-b005)

Assets: [11aeeb2adf1fe303983a70acd289cb04d540de0b6605877dafea20668f9c9b4f.png](assets/sdd-1c25f20de1eafc3e/11aeeb2adf1fe303983a70acd289cb04d540de0b6605877dafea20668f9c9b4f.png); [d70373fa7e3a3afc8a9dc0d364aaf459f77b0b28b3739c4e83180878a072ee7c.png](assets/sdd-1c25f20de1eafc3e/d70373fa7e3a3afc8a9dc0d364aaf459f77b0b28b3739c4e83180878a072ee7c.png)

#### Shipment transfer and destination-load creation

The sequence shows Shipment Insight Transfer shipment, a transfer form with Destination load and New action, and a Shipping Load editor with carrier and dock-door fields. The source describes an exception carrier-change path before loading and separately says post-wave changes follow an outside-SCALE SOP.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p104-b007, p104-b008, p105-b003, p105-b004, p105-b006](reading/sdd-1c25f20de1eafc3e.md#p104-b007)

Assets: [635add900083c3b749e8db35d9f6c5eb7087b40e40dab30ab31d2ce60b354d10.jpeg](assets/sdd-1c25f20de1eafc3e/635add900083c3b749e8db35d9f6c5eb7087b40e40dab30ab31d2ce60b354d10.jpeg); [beffe2f16164717336af5f96cf4ab9c4e186d5d5b60130a3f35395e1d002b80b.png](assets/sdd-1c25f20de1eafc3e/beffe2f16164717336af5f96cf4ab9c4e186d5d5b60130a3f35395e1d002b80b.png); [cfa03c6236edcb4a0ed7fd4776f9fe9645517a5c31d6416f2ac14b6e37b8c48e.png](assets/sdd-1c25f20de1eafc3e/cfa03c6236edcb4a0ed7fd4776f9fe9645517a5c31d6416f2ac14b6e37b8c48e.png)

#### Shipping Load dock-door selection

The Shipping Load editor opens the Dock door dropdown. The body describes manual dock assignment; the accompanying parcel discussion contains disagreement between a custom-extension request and a proposed manual-scanning base approach.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p106-b006, p106-b007, p106-b008, p106-b009, p106-b010, p106-b011, p106-b014](reading/sdd-1c25f20de1eafc3e.md#p106-b006)

Assets: [c2f59f5900cee0f710f4acc3cb74698f0504b20d672cdde09afb4b58d06d9491.jpeg](assets/sdd-1c25f20de1eafc3e/c2f59f5900cee0f710f4acc3cb74698f0504b20d672cdde09afb4b58d06d9491.jpeg)

#### Shipping Load Insight Confirm action

Shipping Load Insight shows Confirm in Actions and a row with both leading and trailing Ship Confirm Pending. This is a sample screen, not resolution of the body paragraph that separately names Load Confirm Pending as the prerequisite.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p107-b006, p107-b007, p107-b009, p107-b010](reading/sdd-1c25f20de1eafc3e.md#p107-b006)

Assets: [181e599e35a94e999a52398a0da15931712e30ad3deede8b424ac78ed1091fb6.png](assets/sdd-1c25f20de1eafc3e/181e599e35a94e999a52398a0da15931712e30ad3deede8b424ac78ed1091fb6.png)

#### Manifest Insight carrier mismatch

The illustrated Manifest Insight shows FedEx Express and FedEx Ground rows. The surrounding Knipper prose expressly excludes FedEx actions from this screen and names UPS, USPS and UPS Mail Innovations instead. The generic screenshot must not override the historical design carrier scope.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p108-b005, p108-b006, p108-b009, p108-b010, p108-b011, p108-b012, p108-b014](reading/sdd-1c25f20de1eafc3e.md#p108-b005)

Assets: [c5c59652cfe5479ed098a872792497d92995d19d36a502f3dd23d61e7119c0cd.png](assets/sdd-1c25f20de1eafc3e/c5c59652cfe5479ed098a872792497d92995d19d36a502f3dd23d61e7119c0cd.png)

#### Open/resolved issues workbook icon

The same Excel-icon xref appears on both Open Issues and Resolved Issues pages beside the same workbook filename. Neither page reveals workbook cells or proves all issues resolved; the separate Appendix A sentence is not a detailed configuration inventory.

Limit: Original extracted figures and complete relevant PDF pages visually inspected; xref/page membership checked against unchanged original. Historical design illustrations, including legacy and other-context samples, are not current deployment, successful execution or universal defaults. Personal and sample operational values omitted.

[sdd-1c25f20de1eafc3e p113-b003, p113-b005, p113-b006, p114-b003, p114-b004, p114-b005, p114-b006, p114-b007](reading/sdd-1c25f20de1eafc3e.md#p113-b003)

Assets: [e3dfe828c8d626ee2848c53d84b1c272daf69bc3da5fe9e36c781066f4b845ba.png](assets/sdd-1c25f20de1eafc3e/e3dfe828c8d626ee2848c53d84b1c272daf69bc3da5fe9e36c781066f4b845ba.png)

#### Embedded workbook icon

The native EMF preview shows an Excel document icon and a workbook filename. It indicates an embedded-workbook representation in the Covetrus source. No workbook cells, warehouse statistics, configuration values or workbook behavior are established by viewing the icon.

Limit: Covetrus design artifact only; no workbook contents opened, current deployment or full DOCX layout verified. This isolated native preview supersedes the earlier C6 author-time uninspected-media status for this exact asset.

[sdd-c4c7e01f8ccad48a b00114](reading/sdd-c4c7e01f8ccad48a.md#b00114)

Assets: [7b241276437db86c99733240ce19e21ad42d513b3dc45eff46e6f37711d29836.emf](assets/sdd-c4c7e01f8ccad48a/7b241276437db86c99733240ce19e21ad42d513b3dc45eff46e6f37711d29836.emf)

### Additional source qualifications

- Covetrus b00958 describes supervisor use of a manual adjustment utility; b00960 warns against production use. The source does not reconcile the warning with that practice.
- Covetrus b01096 specifies EA rounding for demand replenishment, b01108 introduces priority PL increments, and b01359 describes case/configured-UOM rounding. Effective increment selection remains unestablished.
- Covetrus b01163 describes one item per replenishment work unit, whereas b01182 permits any configured number of items in execution. The exact grouping contract is unresolved.
- Covetrus b01232 places Picking Pending after wave release, while b01570 sets it at Complete Wave before eligibility for release. No exact status transition is chosen.
- Covetrus b00254 excludes manual shipment consolidation but b01335 describes it for rejected pool shipments. The exception scope must be reconciled separately from the dock exclusion in b02018.
- Covetrus b01477 uses an ambiguous negative condition for the stop-additional-shipments flag. Do not derive its truth table from this text.
- Covetrus b01469 introduces containers requiring Packing in their status flow but supplies no following list. Their eligibility criteria remain absent.
- Covetrus b02046 contains an incomplete prerequisite before document generation/printing beside EX24. The missing action and timing are not inferred.
- Covetrus b02210 names EX07 as disabling item validation for flagged non-barcoded items; flag identity and precedence remain unspecified.
- Covetrus b02214 leaves generic-data-bind stored procedures undocumented, b02235 leaves notifications undecided, and b02292 lists DRP container-based LPN receiving as future. These are incomplete design contracts.
- The retained EMF at b00114 remains visually uninspected with the approved renderer unavailable. The inspected decorative JPEG without an extracted node binding receives no reviewed-register asset credit.
- HADDAD original comment 66 qualifies the wave Override association instruction at b00403 when the desired flow is supplied in a customer download; field mapping and precedence remain undocumented.
- HADDAD user access: the prose asks for appropriate restricted access while pictured user company, warehouse, work-profile and adjustment authorization selects All; intended access policy is unresolved.
- HADDAD storage-template detail spells the second quantity UM SPCS while nearby prose uses SPCB; do not normalize identifiers without source clarification.
- HADDAD item-UOM note says multiple UMs cannot be created for a single item, while the inspected editor shows UVC and PCB rows for one item; the intended cardinality rule remains unresolved.
- HADDAD location-type examples use 9999 although prose permits omitted dimension/weight limits; no unlimited-sentinel meaning is documented.
- HADDAD dock anchoring shows SHIPMENT_ID MATCHES with no literal value; its contextual evaluation contract is not established.
- HADDAD custom-flow case thresholds are stated in prose, but this section does not show the selecting wave-override predicate; screenshot status selection is distinct from Mandatory.
- HADDAD retained media image4.jpeg and image5.jpg were individually inspected as decorative branding/background but have no retained node asset binding. They receive no diagram citation credit; full-document layout/header placement is not accepted.
- LAND MAWM scope remains excluded from SCALE behavior. In particular, MAWM truck-load iLPN/oLPN and HM sorter close-container examples cannot fill the AIM inventory replacement-LPN gap.
- LAND b00452 groups three Dodgeville/Stevens Point buildings into one distribution center, while b00453 adds Reedsburg with unknown area values and b00542-b00543 depict separate Reedsburg and Dodgeville facility organizations. The current site topology is not established by resolving these differing design contexts.
- LAND Sorter X container-size headings and rows differ at b02610-b02615; retain the disagreement without selecting an intended bag-size mapping.
- LAND b02622 and b02632 reuse the same Pre-VAS screenshot, although b02623 calls the first occurrence Sorter A & B. The first caption cannot establish the visible criterion as an A/B configuration.
- LAND HM flow b02751 labels the right lane Matthews but its green legend says SAP; adjacent text names Matthews for batch closure. Color alone does not establish system ownership.
- LAND has two inspected decorative media assets (Manhattan branding and red/white cover) without retained node associations. They remain inventoried without authored-description coverage credit.
- Grupo Julio page 19 places Figure 3 captioned Interface Download under Upload from SCALE to ERP; heading, message labels and visual direction remain distinguishable from the caption.
- Grupo Julio receiving media selects Recibo Normal while the caption/instructions name Recibo Importacion; this existing illustration-label difference remains unresolved.
- Grupo Julio retained interface components include black, dithered and soft-mask-backed auxiliary images. Their isolated bytes cannot each support a separate process claim; the complete source-page composition supplies context.
- Grupo Julio Close Container illustrations provide no replacement-license-plate decision rule or proof of reopening a sealed container; Packing workflow and deployment acceptance remain open.
- Grupo Julio shipment labor-planning prose uses a work-zone example while the sample criteria editor shows a warehouse predicate; neither is verified as effective configuration.
- Knipper page 34 closing-shortages caption accompanies an unlocate-success image; source correction is needed before using the image as a close demonstration.
- Knipper receiving status examples differ: standard screenshot QA HOLD, returns prose Available/Awaiting Client, and inventory-status section generic Available/HQ. Client-specific receiving preferences require confirmation; no global precedence is supplied.
- Knipper damage/returns prose describes missing-UOM notification while Verify Item Unit of Measure is unchecked in the illustrated Workbench preferences; exact validation behavior remains unverified.
- Knipper replenishment work grouping says one item/location in creation and any number of items in execution; clipped criteria and truncated sort fields cannot establish the complete grouping rule.
- Knipper demand-replenishment prose and site pick-to-zero annotation differ in increment assumptions; real-time replenishment remains future and its trigger wording is qualified by comments.
- Knipper nested-pallet QC and any corresponding custom RF/operator-separation scope require EX46 specifications and actual implementation evidence.
- Knipper parcel dock-management comments disagree between a needed extension and proposed manual-scanning base solution; successful SCALE2013 behavior/port is unproven.
- Knipper Manifest Insight screenshot contains FedEx rows despite prose excluding FedEx actions; preserve the mismatch and verify version/carrier requirements independently.
- Knipper recurring Excel icons expose no workbook cells; no Parking Lot issue list or Warehouse Stats workbook was available from these PDF figures.
- Knipper PDF cover version 1.0 versus filename/footer v1.3 is documentary metadata inconsistency, not evidence of a particular product build.
- Native media follow-up resolves the prior uninspected status for Covetrus b00114: its EMF is an embedded-workbook icon, not the workbook contents. The separate frozen author receipt remains historical evidence.
- The remaining Labels EMF decodes natively as a one-pixel white preview. It has no retained node association and receives no citation or authored-description credit. This resolves unrendered status only; complete slide/media composition remains a separate boundary.

## Continuation 8 source-text review

This batch adds 32 claims and 9 setting explanations across seven SCALE source bodies. Previous records, source bytes, media descriptions and page/table credit remain unchanged. Source examples are distinct from active deployment.

### haddad-location-generation-increment-examples

HADDAD describes generating a set of locations from a selected template and warehouse using starting and ending values plus increments. For the numeric example 0000 through 1000, it states 1001 locations at increment 0001, 101 at 0010, and two at 1000. Its alpha example treats A to B as increment 1 and A to C as increment 2.

HADDAD SCALE 2020 walkthrough, not observed deployed behavior or a current configuration instruction. The three numeric examples are arithmetically consistent with inclusive endpoints. They do not establish behavior for invalid or zero increments, non-divisible end values, multi-field combinations, alphabet rollover, existing-location collisions or generation limits. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00110, b00111, b00113, b00114, b00115, b00116, b00117](reading/sdd-f46806ef53e15f07.md#b00110)

### haddad-work-order-system-values-source-advice

The HADDAD work-order section says its system values manage work-order processing, are system-created and should not need modification. The guide separately declares that its example environment had no work-order configuration and that this section was based on AIM help.

HADDAD SCALE 2020 walkthrough, not observed deployed behavior or a current configuration instruction. This preserves the guide advice and its lack of implemented work-order examples. It is not an authorization to change values, a universal prohibition on change or evidence of installed defaults. Classification: `configuration_example`.

[sdd-f46806ef53e15f07 b00565, b00573, b00574](reading/sdd-f46806ef53e15f07.md#b00565)

### haddad-print-trigger-overview

HADDAD introduces document and label printing as warehouse-process output and says it usually occurs during the wave or work-creation process.

HADDAD SCALE 2020 walkthrough, not observed deployed behavior or a current configuration instruction. Usually is a source qualification, not an exhaustive trigger list. The separate reviewed label-master, document and routing examples still need their own associations; this overview establishes no active print job or physical output. Classification: `vendor_behavior`.

[sdd-f46806ef53e15f07 b00705, b00706, b00707](reading/sdd-f46806ef53e15f07.md#b00705)

### haddad-guide-explicit-scope-limit

The HADDAD conclusion explicitly describes the guide as a general outline for a very simple configuration, not a comprehensive list of steps, and directs readers to feature-specific Help for details.

This is a documentary scope limit. Completing review of this walkthrough cannot by itself certify a complete SCALE configuration, a deployment or an operator procedure. Classification: `analyst_inference`.

[sdd-f46806ef53e15f07 b00738, b00739](reading/sdd-f46806ef53e15f07.md#b00738)

### insight-edit-existing-custom-screen

The Insight Architect document says to click View All to list customized screens, select the custom screen and click Edit. The custom form is then displayed for modification.

Documentation-only sequence. No screen was opened, edited or published. The excerpt does not establish role permissions, save behavior, version compatibility or the current navigation of a deployed environment. Classification: `vendor_behavior`.

[sdd-d4675a92502c23f4 p001-b010, p001-b011](reading/sdd-d4675a92502c23f4.md#p001-b010)

### work-picking-sequence-add-wizard-name-qualification

Under Add new Sequence, the Work and Picking compilation says to select an existing sequence and add a record, then names the displayed wizard New Work Type and links to Work Type information.

Undated SCALE Work and Picking compilation; the applicable release and current screen navigation are not established. The section and wizard use different names. This review preserves the literal source labels without deciding that one is a typo, inferring the wizard fields or treating this as verified navigation. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00073, b00075, b00076](reading/sdd-61bfda888fe30365.md#b00073)

### work-picking-sign-on-entry-routes

The Picking Management procedure offers two routes to Picking Signon: choose Picking Signon from the desktop, or right-click a work-unit record in Picking Management Explorer and choose Scan On. After work-zone selection, the scan-on route prepopulates the selected work unit in Picking Selection.

Undated SCALE Work and Picking compilation; the applicable release and current screen navigation are not established. These are the source entry routes. They do not establish present permissions, bypass zone/type eligibility or override the previously documented hold and assignment rules. Classification: `vendor_behavior`.

[sdd-61bfda888fe30365 b00498, b00499, b00500, b00501](reading/sdd-61bfda888fe30365.md#b00498)

### label-zpl-source-command-descriptions

Slide 24 of the Labels training deck names ^PR for print rate, ~SD for darkness, ^MD for a relative darkness adjustment and ^FW for default field orientation. It asserts that ^MD persists across label formats until another ^MD or a power cycle, and lists N, R, I and B as normal, 90-degree, 180-degree and 270-degree orientations.

These are assertions in a mixed-era training slide, not independently verified current Zebra command specifications or printer instructions. Persistence, supported values, units, defaults and device compatibility were not tested or checked against vendor documentation. No command was sent to a printer. Classification: `configuration_example`.

[sdd-56008a31665dcc23 s024-sh004](reading/sdd-56008a31665dcc23.md#s024-sh004)

### covetrus-inbound-manual-visual-qc

The Covetrus assumptions explicitly exclude systemic inbound QC and instead describe a manual SOP using visual QC.

Covetrus Manhattan Active SCALE version 1.4 design, modified 31 August 2023; an implementation example, not the assessed deployment or an executed SOP. The manual SOP details and acceptance criteria are not supplied by this sentence. This inbound choice is separate from the already reviewed outbound QC, Force QC Pass and VAS descriptions; it does not prove recorded or completed inspection. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00246](reading/sdd-c4c7e01f8ccad48a.md#b00246)

### covetrus-download-upload-document-terminology

For this Covetrus document, download means a file or information sent from another system and processed by SCALE. Upload means a file generated by SCALE and made available to another system.

Covetrus Manhattan Active SCALE version 1.4 design, modified 31 August 2023; an implementation example, not the assessed deployment or an executed SOP. These terms define direction from the SCALE perspective. They do not prove successful processing, external receipt, acknowledgement, delivery guarantees or the transport used by a particular interface. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00272, b00273](reading/sdd-c4c7e01f8ccad48a.md#b00272)

### covetrus-new-item-dimension-entry-paths

For new items missing weight or dimensions, Covetrus describes capturing dimensions with Cubiscan at its NDSC and updating SCALE through a Boomi export, a diagnostic app or manual entry by operations.

Covetrus Manhattan Active SCALE version 1.4 design, modified 31 August 2023; an implementation example, not the assessed deployment or an executed SOP. These named entry paths do not resolve the previously recorded conflict between SCALE-owned dimensions in the assumptions and host-maintained dimensions in Item Master Download. No field ownership, overwrite precedence, endpoint or successful import is inferred. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b00771, b00773](reading/sdd-c4c7e01f8ccad48a.md#b00771)

### covetrus-special-and-pallet-pick-label-scope

Covetrus gives Special Pick the same stated label combination as Dry Pick: container contents plus vendor or shipping label, with that choice depending on carrier and output ordered by picking sequence. Its wave-label paragraph lists container contents, vendor and pallet labels for Pallet Pick, while the later pallet-build picking paragraph says shipping/vendor, container contents and pallet labels.

Covetrus Manhattan Active SCALE version 1.4 design, modified 31 August 2023; an implementation example, not the assessed deployment or an executed SOP. The source varies the vendor-versus-shipping wording between its pallet-related paragraphs. Keep their contexts and the separately registered label-ID conflicts; the text does not establish one universal pallet print recipe or an authoritative current routing map. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01546, b01548, b01550, b01696, b01697, b01698, b01699, b01701](reading/sdd-c4c7e01f8ccad48a.md#b01546)

### covetrus-wave-result-review-screens

After building and running a wave, the Covetrus design directs the wave supervisor to review its results using full-screen Transaction History Insight and Work Insight before the subsequent cancel-or-release procedures.

Covetrus Manhattan Active SCALE version 1.4 design, modified 31 August 2023; an implementation example, not the assessed deployment or an executed SOP. The sentence names review surfaces, not the result fields, success criteria, permissions or a verified decision rule. No wave was built, reviewed, canceled or released. Classification: `implementation_specific_choice`.

[sdd-c4c7e01f8ccad48a b01574, b01576, b01579, b01592](reading/sdd-c4c7e01f8ccad48a.md#b01574)

### knipper-manual-receipt-packing-list-origin

Knipper distinguishes manual receipt creation in Receipt Insight from creation through Purchase Order Insight: its design uses the former, based on vendor packing lists for most accounts, and explicitly does not use the latter.

This refines the existing manual-versus-EDI account distinction with source-screen and document origin. It does not establish current account configuration or forbid purchase-order receiving in SCALE generally. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p016-b005](reading/sdd-1c25f20de1eafc3e.md#p016-b005)

### knipper-shipment-return-lot-enhancement-boundary

The Knipper receipt-from-shipment passage describes returns of undelivered shipments in their original packaging. It says current receipt lines lack lot information and requests shipment-derived lot population under EX40; a margin request adds expiration date, with details deferred to a separate design.

A comment marked resolved does not supply the missing extension specification or prove implementation. The existing EX40 collision with the work-document feature remains; line-level locate/unlocate is a request here, not an established capability. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p016-b006, p016-b007, p016-b008, p016-b009, p016-b010, p016-b012](reading/sdd-1c25f20de1eafc3e.md#p016-b006)

### knipper-blind-receipt-body-comment-qualification

Knipper page 16 says blind receiving is used in some no-ASN scenarios. A margin comment asks for future blind receiving and a reply says Knipper already uses blind receipts and the document should be updated.

Preserve the body and review discussion separately. They do not date an activation, settle every scenario or prove installed use; the existing blind-receiving preference example remains separately bounded. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p016-b011, p016-b014, p016-b015](reading/sdd-1c25f20de1eafc3e.md#p016-b011)

### sdd-receipt-insight-record-levels

The Knipper and Grupo Julio designs distinguish receipt-level viewing from Receipt Line Insight and Receipt Container Insight for downloaded or created ASNs.

Knipper calls the receipt-level screens Receiving Insight; Grupo calls them Receipt Insight. These historical source labels do not establish current navigation, permissions, ASNs in use or physical SQL table identities. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p016-b016](reading/sdd-1c25f20de1eafc3e.md#p016-b016); [sdd-d50ca4a96095c930 p025-b005](reading/sdd-d50ca4a96095c930.md#p025-b005)

### knipper-title-transfer-customization-boundary

The Knipper locating section records a request to mass-adjust inventory from one item to another for Title Transfer and explicitly treats it as a SCALE extension.

The passage supplies no extension identifier, transaction semantics, permissions or operational procedure. It is not an instruction or proof that a mass adjustment has been implemented. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p038-b017](reading/sdd-1c25f20de1eafc3e.md#p038-b017)

### knipper-dscsa-putaway-ex37-event-boundary

Knipper describes DSCSA putaway as updating a custom serial-number table and recording a Receive event in rTS through an API, referring to the separate EX37 inbound-processing specification.

The external specification, API contract, execution and compliance were not verified. The following inventory-status note continues beyond this packet and supplies no reviewed inspection-completion rule here. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p039-b007](reading/sdd-1c25f20de1eafc3e.md#p039-b007)

### knipper-wave-flow-template-migration-qualification

The Knipper standard-wave-flow example is not its only proposed flow: a review reply says all existing wave flows will migrate and will still be based on that template. The preceding body says existing wave flows and masters are used.

This qualifies the already reviewed standard-wave table. A resolved comment and migration intent do not prove the number, contents or successful migration of actual flows. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p070-b007, p071-b013, p071-b014, p071-b016, p071-b018, p071-b019](reading/sdd-1c25f20de1eafc3e.md#p070-b007)

### knipper-future-build-wave-selection-criteria

In the section explicitly titled Build Wave - Future Use, Knipper proposes scheduled selection using wave criteria associated with a wave master. A matching shipment line includes the entire shipment; all lines need not match. A reply allows multiple criteria producing waves with different flows.

Future build/run behavior is distinct from work release: Automatic runs a built wave, while a comment requests manual release except for the scheduled scenario. No schedule or release policy is inferred from a resolved annotation or from the legacy sample screenshot. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p071-b017, p071-b020, p071-b021, p071-b022, p071-b023, p071-b024, p071-b025, p071-b026, p071-b027, p071-b028](reading/sdd-1c25f20de1eafc3e.md#p071-b017)

### knipper-ex38-address-verification-boundary

Knipper labels its wave address-verification step as custom EX38, Serialization Integration with Rfxcel for Outbound. It describes verifying ship-to addresses with RTS and returning unsuccessfully verified shipments to the pool.

The same paragraph spells the failure-path system RYS rather than RTS. Preserve that documentary inconsistency; do not infer an endpoint, exact returned status, cancellation atomicity or installed integration. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p077-b004](reading/sdd-1c25f20de1eafc3e.md#p077-b004)

### knipper-successive-allocation-sequences

Knipper describes allocation rules as controlling eligible locations, units of measure and allocation strategy. Allocation starts with the first sequence; when that sequence does not allocate 100 percent, subsequent sequences attempt the remaining inventory. An Item Master rule can default onto the shipment detail before interface or wave assignment paths.

This extends rule selection with sequence progression; it does not establish ordering among all assignment sources, live quantities or complete allocation success. The separate Allocate Complete header guard and rejection rules retain their existing qualifications. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p077-b004, p078-b003](reading/sdd-1c25f20de1eafc3e.md#p077-b004)

### knipper-wave-replenishment-fefo-qualification

Knipper wave-replenishment prose evaluates each/case demand against primary picking availability, rounds requests up in case or configured-UOM increments and creates in-transit inventory for shipment allocation. It calls the associated allocation FEFO without the lot-controlled qualification used in the detailed sequence tables.

This additional prose does not resolve the existing non-lot replenishment disagreement between most-available-first and FIFO. No deployed strategy or precedence among these passages is inferred. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p077-b003](reading/sdd-1c25f20de1eafc3e.md#p077-b003)

### knipper-ex13-virtual-location-subwave-transfer

The EX13 Pick to Light Wave Splitting design first assigns orders allocated at virtual locations to groups of PTL locations across subwaves, using most-common items with the fewest lines. A subsequent step moves shipments, allocations and replenishments into a new subwave, then moves replenishment and allocation requests from virtual to assigned PTL locations.

Custom design intent only. The source gives no complete tie-breaker, capacity rule, transactional boundary or verified extension implementation; this is not base allocation behavior. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p075-b006, p080-b031, p080-b032](reading/sdd-1c25f20de1eafc3e.md#p075-b006)

### knipper-cartonization-dimension-diagnostics

Alongside its zero-dimension/weight behavior for an item without a unit-of-measure record, Knipper proposes an oSCI report for missing dimensions among items in the pool and personal-alert notifications to help handle those exceptions.

The diagnostic options are proposals, not shipped reports or active alerts. Missing dimensions and a missing UOM record are distinct conditions; the source does not define every diagnostic predicate. Generic cartonization behavior is already covered by other reviewed SDDs. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p081-b003](reading/sdd-1c25f20de1eafc3e.md#p081-b003)

### knipper-wave-container-identity

The Knipper container-creation section says SCALE determines container count and contents for shipments on the wave and assigns a unique container number to each created container, calling that number a UCC 128.

This preserves the document terminology only. It does not establish barcode syntax, a GS1/SSCC compliance result, identifier scope across systems, counter configuration or any replacement-LPN rule. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p081-b003](reading/sdd-1c25f20de1eafc3e.md#p081-b003)

### knipper-ex17-seasonal-recartonization

Knipper identifies coolers and freezer items needing icepacks or dry ice in shipping containers and assigns special customer cartonization requirements to EX17, Re-Cartonization of Containers based on Season.

This names a custom design dependency without supplying its temperature, quantity, seasonal, carrier or safety rules. No extension behavior or installed cold-chain configuration is established. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p081-b003](reading/sdd-1c25f20de1eafc3e.md#p081-b003)

### knipper-cross-wave-staging-manual-alignment

Knipper describes a staging location selected by customer and carrier, followed by later manual dock-door assignment. When a shipment on another wave joins an already staged load, its default staging lane can differ; the design uses a manual SOP to align the staging-lane status flow with the existing load.

The SOP steps and permission model are not supplied. This does not resolve the separately recorded parcel dock-management dispute, and no automatic consolidation, fallback precedence or current dock configuration is asserted. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p084-b006, p085-b003](reading/sdd-1c25f20de1eafc3e.md#p084-b006)

### grupo-purchase-order-receipt-day-planning

Grupo Julio creates receipts from Purchase Order Insight, particularly for national vendors, grouping the creation around deliveries planned for a given day. It separately describes blind client returns because the incoming products are not known in advance.

These are implementation choices, not a general requirement for SCALE receiving. The separate no-manual-Receipt-Insight permission choice does not prohibit this purchase-order route; no current receipt or client data was inspected. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p024-b011, p025-b003](reading/sdd-d50ca4a96095c930.md#p024-b011)

### grupo-client-return-type-spelling-mismatch

The Grupo Julio receipt-ID table labels client returns DEV CIE, while the receipt-from-shipment passage says the generated Receipt ID Type is DEV CTE.

The source does not establish whether the codes are distinct or one spelling is erroneous. Keep both source contexts and do not choose a canonical code or infer an installed mapping. Classification: `analyst_inference`.

[sdd-d50ca4a96095c930 p024-b007, p025-b002](reading/sdd-d50ca4a96095c930.md#p024-b007)

### grupo-appointment-deletion-entrypoints

Grupo Julio describes deleting an appointment from Receipt Insight by finding the receipt, opening its context menu and choosing Delete Appointment. It also describes a dock-by-day graphical calendar that can preview, schedule, change and delete appointments, with customizable display information and colors.

English and Spanish repetitions are one documentary account. The existing open-receipt scheduling precondition remains; the passage supplies no deletion permission, cancellation side effect or verified current navigation. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p029-b009, p030-b002, p030-b004](reading/sdd-d50ca4a96095c930.md#p029-b009)

### Additional source qualifications

- C8 source-text review preserves the Work and Picking Add new Sequence versus New Work Type wizard naming ambiguity; current release-specific UI evidence is still needed before using that paragraph as an operator route.
- C8 source-text review preserves the Covetrus vendor-versus-shipping label wording across wave Pallet Pick and pallet-build picking paragraphs, in addition to the previously recorded label-ID inconsistencies. It does not choose a current routing definition.
- The new Labels command-description record is expressly a training-slide assertion. Current printer semantics, especially the slide persistence statement, require separate primary vendor verification before operational use. No runnable printer guidance is established.
- C8 Knipper blind-receipt body and margin comments differ about current versus future use; no installed activation or scenario coverage is established.
- C8 Knipper EX38 address-verification prose uses RTS and RYS in one paragraph; the target interface and failure semantics remain unverified.
- C8 Knipper wave-replenishment prose uses FEFO without a lot qualification; it does not resolve the previously recorded non-lot most-available-first versus FIFO disagreement.
- C8 Knipper source-specific extensions EX13, EX17, EX37 and receipt-from-shipment EX40 require separate specifications; source references and resolved comments are not implementation evidence.
- C8 Knipper page-39 inventory-status text continues outside this bounded packet; no inspection-completion transition was added.
- C8 Grupo EX05 required fields depend on the Receiving Preference selecting the extension; installed selection, implementation and ERP receipt are not observed.
- C8 Grupo client-return Receipt ID Type is DEV CIE in the table but DEV CTE in the receipt-from-shipment prose; equivalence or a corrected code is not established.

## Continuation 9 source-text review

This batch adds 13 claims and 5 setting explanations across two SCALE source bodies. Previous records, source bytes, media descriptions and page/table credit remain unchanged. Source examples are distinct from active deployment.

### knipper-c9-inspection-inventory-status-continuation

The Knipper note spanning pages 39–40 says LPN inventory status remains QA Hold, or the status assigned during check-in, after putaway. Once inspection is completed or based on its results, each LPN changes to a new inventory status, naming Available and HOLD FOR DEST AUTH.

This closes the previously bounded page-39 continuation. It distinguishes inventory status from the receipt-container Closed status. The source does not define an automatic trigger, inspection outcomes-to-status mapping, responsible role or equivalence among QA Hold, HQ and other status labels. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p039-b007, p040-b003](reading/sdd-1c25f20de1eafc3e.md#p039-b007)

### knipper-c9-multi-lot-status-change

Knipper describes updating inventory status for multiple selected lots together when managing items for destruction.

This is a source-described multi-selection use case. It does not execute destruction, specify a destruction status, establish transaction atomicity or override the separately documented location/LPN status-mixing constraint. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p046-b007](reading/sdd-1c25f20de1eafc3e.md#p046-b007)

### knipper-c9-activity-count-short-pick-conflict

The Knipper activity-count body says a short pick creates cycle-count work for the affected location. Its adjacent comment says Knipper does not short pick, followed by a reply that the comment can be resolved.

The resolved annotation supplies no replacement trigger or evidence of actual use. Preserve this difference between a configured-trigger claim and operational practice; do not infer that all short picks occur or all counts are generated. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p049-b004, p049-b005, p049-b006](reading/sdd-1c25f20de1eafc3e.md#p049-b004)

### knipper-c9-ptl-count-extension-investigation-boundary

Knipper proposes enhancing EX19 to generate a count automatically for PTL mod locations after work-unit completion in the every-wave picking process. A margin comment warns that an unresolved discrepancy and reconciliation-driven inventory adjustment can keep the wave open and prevent further orders from that location; the reply promises follow-up without defining a remedy.

The body also mixes threshold counts being utilized with a request to enable immediate counts for some work zones. No exact trigger, job configuration, investigation linkage, blocking behavior or implemented fix is established by the proposal and discussion. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p049-b008, p049-b011, p049-b012](reading/sdd-1c25f20de1eafc3e.md#p049-b008)

### knipper-c9-inca-reconciliation-comment

Knipper describes supervisor reconciliation entering correct on-hand quantity, updating inventory and transaction history, and closing the request; mobile reconciliation is also described. A margin comment separately reports confirming a count and then making a manual adjustment to log an Inventory Check and Adjustment Form (INCA) number for drug product.

The reply merely says the comment can be resolved. It does not reconcile those two procedures, specify where to store the INCA number, authorize a second adjustment or establish a compliant operational SOP. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p051-b004, p051-b005, p051-b006, p052-b005](reading/sdd-1c25f20de1eafc3e.md#p051-b004)

### knipper-c9-ex38-pick-serial-contract

Knipper assigns DSCSA outbound picking validation to EX38: the 3PL Pick DSCSA passage names GTIN and serial validation for different UMs, while the LTL picking passage adds company validation and serial capture at multiple UM levels.

This is the same named outbound extension referenced by the previously reviewed address-verification wave step. The separate specification is not supplied here; no payload, packaging hierarchy, serial uniqueness, integration success or compliance result is proven. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p086-b007, p097-b003](reading/sdd-1c25f20de1eafc3e.md#p086-b007)

### knipper-c9-ex19-pick-confirmation-boundary

For both PTL and full-case PTL picking, Knipper describes downloading work-unit messages to the Pick to Light system, executing the pick there, and sending confirmations back. EX19 processes those confirmations to complete SCALE work units and advance status according to the status flow.

Documented custom integration intent only; message shape, partial completion, retries, ordering and idempotency are absent. This is Knipper Pick to Light, distinct from Grupo Julio EX01 Put to Light sorting. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p087-b003, p096-b006, p096-b007](reading/sdd-1c25f20de1eafc3e.md#p087-b003)

### knipper-c9-vvip-print-file-dependency

Knipper describes multiple shipment pack-list templates for customer requirements and an external VVIP printing process for special formats. That process requires an XML input file per wave, to be generated through an extension whose identifier remains TBD.

No file schema, destination, scheduling, external process configuration or completed extension is supplied. Printing intent is not delivery or operational proof. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p088-b005](reading/sdd-1c25f20de1eafc3e.md#p088-b005)

### knipper-c9-wave-no-work-and-complete-state

The Knipper Check for No Work override-data step checks that every shipment has work and marks the wave for failure otherwise. Complete Wave sets shipments to Picking Pending and makes them eligible for release. A separate placeholder acknowledges additional override-data steps for eligibility checks.

The source does not supply SQL, exact failure status, rollback semantics or all additional steps. Complete Wave and release are distinct; Picking Pending does not prove that work has been released or executed. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p088-b005, p088-b006, p088-b007](reading/sdd-1c25f20de1eafc3e.md#p088-b005)

### knipper-c9-cancel-wave-release-boundary

Knipper describes Cancel in the Completed Wave window backing out allocations and deleting work instructions/containers, then returning shipments to the pool or another wave. Its review reply limits this path: a released wave cannot be canceled, nor can work units already In Process be canceled/deleted; it recommends completing work and then canceling the shipment.

This documents the reply to a request to interrupt started waves; the resolved marker is not runtime verification. Keep wave cancellation separate from the existing post-wave shipment-cancellation dispute, whose body and comment differ about active picking. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p088-b009, p088-b010, p088-b013, p088-b014, p088-b015, p089-b005](reading/sdd-1c25f20de1eafc3e.md#p088-b009)

### knipper-c9-machine-type-work-proposal

In response to a request to separate reach-truck and order-picker activity, the Knipper review reply proposes separate work types based on replenished quantity UM, assignable to different users.

The discussion asks whether that approach is acceptable and gives no final machine-based assignment algorithm. Do not infer automatic equipment detection, installed work types or a direct machine-type priority setting from the proposal. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p093-b004, p093-b006, p093-b008, p093-b010, p093-b011](reading/sdd-1c25f20de1eafc3e.md#p093-b004)

### knipper-c9-pick-validation-extension-boundaries

The Knipper cart, full-pallet, LTL and REPS picking descriptions name EX24 for displaying an item alias when present and EX39 for Work Confirmation Item validation. The base-looking pick sequence explicitly references those extensions at the item step.

The source supplies neither extension contract nor its complete validation/error behavior. Generic location/item scanning prose must not be treated as proof that all of these details are base SCALE or installed in the assessed deployment. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p093-b012, p095-b005, p097-b003, p097-b006, p098-b003](reading/sdd-1c25f20de1eafc3e.md#p093-b012)

### grupo-c9-mixed-status-attribute-qualifier

Grupo Julio describes status changes through Inventory Management with transaction-history recording. Its following note restricts holding the same item partly Available and partly Damaged when the location is not license-plate tracked or does not have different inventory attributes.

The note includes both tracking and attribute wording; its use of or does not supply a full truth table or establish the converse as sufficient. Keep it distinct from Knipper’s LPN-only qualification; do not infer a universal inventory identity key or deployed consolidation rule. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p090-b006, p090-b007](reading/sdd-d50ca4a96095c930.md#p090-b006)

### Additional source qualifications

- C9 closes the Knipper page-39 inventory-status sentence with page40; exact inspection transition mappings and deployed status labels remain unverified.
- C9 Knipper short-pick count trigger conflicts with a comment saying short picking is not used; resolution markers do not supply an operational rule.
- C9 Knipper EX19 post-wave counting, INCA recording and LPN count/scan comments leave exact configuration and investigation/reconciliation semantics unresolved.
- C9 Knipper EX19, EX24, EX38, EX39 and TBD VVIP references identify custom dependencies, not complete specifications or installed execution.
- C9 Knipper wave-cancellation reply is distinct from the existing shipment-cancellation dispute; neither source passage is live acceptance.
- C9 Grupo mixed-status note includes a different-inventory-attributes qualifier and ambiguous logical wording; no complete allowed-combination rule is inferred.

## Continuation 10 source-text review

This batch adds 7 claims and 4 setting explanations across three SCALE source bodies. Previous records, source bytes, media descriptions and page/table credit remain unchanged. Source examples are distinct from active deployment.

### knipper-c10-inbound-qc-status-decision

Knipper says all inbound LPNs receive QC Hold although physical inspection selects only some LPNs after putaway to reserve. For QC pass, a user changes QC Hold to Available through Insight or Warehouse Mobile, finding LPNs one lot at a time because the passage says one lot is received on one receipt. For QC failure, the customer decides disposition and LPNs transfer to a designated location.

This adds the earlier pass/fail procedure to the page39–40 continuation. QC Hold, QA Hold, Client Hold and HQ are not equated. The source also describes visual audit before systematic check-in without fully distinguishing that activity from later reserve inspection. It supplies no sampling formula, automatic transition, customer-decision criteria, current SOP or deployment acceptance. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p021-b004, p021-b006, p022-b003, p022-b004, p022-b005, p022-b006, p022-b007, p022-b008, p022-b009, p022-b011](reading/sdd-1c25f20de1eafc3e.md#p021-b004)

### knipper-c10-cubiscan-manual-versus-integration

For new-item dimensions, Knipper describes Cubiscan measurement with manual updates to SCALE by operations. Its margin discussion treats an integration as being reviewed for HLE and requiring a separate detailed design if Knipper proceeds.

Manual data entry and a proposed integration are different paths. A resolved annotation does not prove the integration was approved, implemented or used; the passage supplies no file/API schema, validation limits or measured dimensions. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p032-b008, p032-b009, p032-b010, p032-b011](reading/sdd-1c25f20de1eafc3e.md#p032-b008)

### knipper-c10-bom-component-origin

Knipper places BOM configuration in its implementation scope and uses a BOM when a work order is manually created in SCALE. Downloaded work orders instead carry component items. An OHW review comment mentions manual production-kitting/labeling orders as well as orders loaded from its internal OMS.

This qualifies the body’s host-work-order description without requiring every work order to originate from the host. It supplies no BOM-version selection rule, component substitution or complete download payload, and no order was inspected. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p062-b003, p062-b004, p062-b005, p062-b006, p062-b007, p062-b008, p062-b009](reading/sdd-1c25f20de1eafc3e.md#p062-b003)

### knipper-c10-component-rule-comment-boundary

The Knipper body says each component has an allocation rule. A review comment attributes a BOM Allocate All failure to a line-level allocation rule and requests removal; the reply instead says automatic allocation on Release can be configured and should work when allocation rules are correct.

The reply does not demonstrate that removing component rules is required or resolves the reported failure. It names no configuration key and supplies no reproduced error or implemented correction. The general allocation-on-release capability is also described by HADDAD; the new meaning here is this unresolved relationship between the body, failure report and reply. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p062-b013, p062-b014, p062-b016, p062-b017, p062-b018](reading/sdd-1c25f20de1eafc3e.md#p062-b013)

### knipper-c10-work-order-release-tension

Knipper’s body calls for verifying allocation/work before releasing a work order, while its recovery continuation says successfully created component work is available immediately for user execution. Review replies say release is mandatory to start work and is at header level; they also say a problem with one line will not hold up other lines, responding to a request for line-level release.

The incremental meaning is the reply about line independence and header-level release plus the reported site variation; prior records already cover the generic release sequence and failed-component retry. These passages do not settle the actual release gate or partial-work eligibility. Preserve the body/reply tension rather than treating creation, header release or a resolved discussion as operational proof. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p062-b009, p063-b012, p064-b003, p064-b004, p064-b005, p064-b006, p064-b007, p064-b008, p064-b009](reading/sdd-1c25f20de1eafc3e.md#p062-b009)

### knipper-c10-component-rf-display-reply

In response to a request for component-pick RF details, the Knipper review reply says lot is displayed but expiration date and conversion are not.

This is a scoped documentary reply, not an exhaustive field inventory or live screen test. It does not resolve the separate system-directed screenshot versus user-directed body mismatch, nor establish missing-field behavior in other screens or versions. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p063-b007, p063-b008, p063-b009, p063-b010](reading/sdd-1c25f20de1eafc3e.md#p063-b007)

### grupo-c10-interleaving-outbound-qc-nonuse

Grupo Julio explicitly says it will not use task interleaving and does not currently use outbound QC in the described implementation.

The following generic Close Container description and Shipping Container Insight QC action do not prove that outbound QC is adopted. The separate future discussion of VAS and inbound QC remains distinct. These historical choices do not disable base SCALE features or establish current site settings. Classification: `implementation_specific_choice`.

[sdd-d50ca4a96095c930 p076-b003, p076-b004](reading/sdd-d50ca4a96095c930.md#p076-b003)

### Additional source qualifications

- C10 Knipper inbound QC gives user-driven pass/fail handling but does not equate QC Hold, QA Hold, Client Hold and HQ or fully distinguish unloading visual audit from later selected-LPN inspection timing.
- C10 Knipper Cubiscan integration remains conditional; no detailed integration contract or completed implementation is supplied.
- C10 Knipper component-rule failure comment and allocation-on-release reply do not identify a proven correction; creation-time availability and mandatory header release remain in documentary tension.
- C10 Grupo USER_DEF3 grouping and work-unit maximums lack values/full predicates; EX01 scope and actual configuration remain unverified.
- C10 Cooler Auto Putaway and HADDAD inactive *Default receiving preference are source-specific choices, not deployed or universal defaults.

## Continuation 12 Knipper load and replenishment source packet

Knipper page 84 repeats the reviewed Covetrus Load Building sequence: wave shipments are ordered by carrier, shipments without a carrier are ignored, open loads are matched by carrier, scheduled ship date and route, and a new load is created when no match exists. Both documents retain the ambiguous negative wording around whether a matched load stops additional shipments. These are different named implementations. The page-84 passages provide corroboration only; they add no distinct claim, citation credit or executable stop-flag rule.

### knipper-c12-wave-replenishment-work-creation-scope

In the Knipper wave flow, replenishment work creation applies only to demand-based replenishments already created. The design says this wave step does not change the existing work-creation setup.

This is a Knipper SCALE implementation design statement. It does not establish current deployed behavior, actual work types or the contents of existing setup. It specifies no setting value or trigger timing. Classification: `implementation_specific_choice`.

[sdd-1c25f20de1eafc3e p085-b007](reading/sdd-1c25f20de1eafc3e.md#p085-b007)
