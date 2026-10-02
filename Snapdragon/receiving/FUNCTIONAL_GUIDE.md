# Receiving: purpose, behavior and configuration

This SD-11 guide explains **nine Receiving menu destinations and eight directly linked active detail/transaction contexts**. It also records one unresolved target, form **166**. The explanation uses retained AIM/SDK passages, selected active SDD configuration passages, the 2026-10-02 screen observations and installed metadata. It adds no new production observation or executed action.

The bounded documentary review covers **9/9 menu destinations (100%)** and gives a disposition for **9/9 directly declared target forms (100%)**: eight have an active implementation and one remains unresolved. These percentages measure this guide's scope. They do not close all applicable screen criteria or establish successful receiving. Record-dependent UI states, current-role permissions, exact validation and service execution remain open.

Use [the configuration map](CONFIGURATION.md) to find exact parts, controls, checkpoints, events and parameters. Use [backend bindings](BACKEND_BINDINGS.md) for the existing static contracts. [The source receipt](source-review.json) contains original hashes and precise source-node bindings. Source codes below link to retained reading copies; their original pages and hashes are in that receipt.

## How the Receiving screens fit together

A purchase order describes expected goods. A receipt is the inbound record used to process goods in the warehouse. Its lines identify items and quantities. Check-in creates receipt containers, also called license plates; locating chooses destination storage, and preferences determine whether putaway work is created. A putaway group groups containers for the relevant putaway flow. Appointments and yard records manage arrival context. The monitor summarizes receipt context and leads back to Insights. This is the documented process relationship, not proof that every warehouse uses every stage. ([A01], n58; [A10], n58; [A11], n58; [A09], n58–64.)

For the six Insights, Basic Criteria narrows the list; Advanced Criteria adds field/operand/value rules. In the retained product description, initial menu entry may show an empty grid until a search is applied, while entry from a tile or monitor carries the caller's filter. An empty initial grid therefore does not establish that no records exist. Selecting a result populates a detail pane; opening a View/Edit or linked identifier opens a separate Details screen. Action availability also depends on selection and security. ([A17], n429–493, n515, n550–565, n614–640.)

The installed landing pass recorded criteria, labels and menus without searching for or retaining warehouse records. Criteria below are representative observed labels, not a complete operand/type/default catalogue. Product references use both **Search** and **Apply Filter**; use the control shown in the installed screen. [Existing landing evidence](../evidence/runtime-root.json) remains the evidence for what was visible.

## Purchase Order Insight — form 2796

Use this header view to find expected orders, examine their source/ship-from context and follow the order into receipts or order lines. Observed criteria include PO, Receipt ID, Source Name, Ship From, Item, Company, Warehouse, created-date range and a closed-order option. The observed list identifies PO, company, status, ship-from and source. ([A01], n58, n180–211; installed landing evidence.)

The product detail pane has **Receipts** and **Lines** tiles. Receipts opens Receipt Insight filtered by PO Object ID and warehouse; Lines opens PO Line Insight with the same context. Target-screen access is required. ([A01], n214–226.)

| Action family | Documented effect and important condition |
|---|---|
| New / Copy / Edit / View / New Line | Open the corresponding header or line context. Copying a header copies selected fields and its lines; View is read-only, while Edit permits only applicable fields. |
| Delete | Deletes the selected order; the reference does not establish a complete installed eligibility matrix. |
| Close / Cancel Close | Close requests confirmation and is disabled for an already closed PO. Cancel Close reopens a closed PO and is disabled for an open PO. |
| Receipt From PO | Opens receipt creation for a PO with open lines; only lines with open quantity are offered. |
| Print Preview / Default / Selected Docs | Preview generates a PDF; default/selected printing depends on document-type setup. These controls have effects beyond merely displaying a menu. |

Sources: [A01], n242–284; [A10], n308–342; [A13], n58. The installed action chain for Close is separately demonstrated in [the PO configuration walkthrough](../screens/purchase-order-configuration.md): control 51621, event 18040, checkpoint 21 and five parameters. That binding does not prove service validation or commit behavior. The general PO status article says linking lines to a receipt closes the PO, but does not explain quantity/partial-receipt eligibility; no broader automatic-close rule is inferred from that abbreviated statement. ([A16], n58–64.)

## Purchase Order Line Insight — form 2797

Use this item/quantity view when the question concerns a particular PO line rather than the whole order. Observed criteria include PO and line/internal identifiers, Item, Company and Warehouse; results distinguish Total Qty, Open Qty and UM. Product documentation describes links on both the PO and line number to their respective detail screens. ([A02], n169–206; installed landing evidence.)

Copy opens the line in Copy mode. The source says open quantity, line number and internal order-line number are not copied. View/Edit open the appropriate read or edit context; Delete cannot delete multiple PO lines together. The installed landing exposed Copy, Edit and Delete; a documented View action is not evidence that it appeared for this session. ([A02], n221–230; [A10], n389–393.)

Configuration concerns include item and quantity bindings, grid definitions, the context passed to the header/line forms, and role/selection enablement. Neither a linked detail template nor a visible Edit label establishes that every field is editable. The product creation/copy article itself distinguishes read-only field groups by mode; those exact mode-specific rules require installed review.

## Receipt Insight — form 2777

Use the receipt header view to coordinate inbound processing, appointments, trailers and related line/container records. Observed criteria include Receipt ID/type, item, license plate, receiving dock, source, ship-from, receipt dates, Company, Warehouse and internal receipt number. Results include trailer, receipt/closed dates and leading/trailing status. The documented **Lines** and **Containers** tiles carry internal receipt number into the corresponding Insights; Containers counts parent containers. ([A03], n219–273.)

| Action family | Documented effect and eligibility |
|---|---|
| New / Edit / View; New Line / New Container | Open the matching record context. Edit depends on the Change checkpoint; View is the documented alternative without it. |
| Delete | Single or multiple receipts; documented eligibility requires both leading and trailing status to be Check-in Pending. Confirmation commits deletion. |
| Assign Trailer ID | Assigns or replaces trailer IDs for one or more receipts before Closed. A trailer already checked into yard management cannot be changed until yard checkout. |
| New / Edit / View / Delete Appointment | Manage the receiving schedule. Edit/View depends on security; Delete is enabled where an appointment exists. See the unresolved form-166 binding below. |
| Check in | Opens Receipt Workbench for one selected receipt, with receipt and preference context. Opening that workbench is distinct from checking in goods. |
| Pre-check-in containers | Creates containers for eligible receipt details before check-in; this is an operational creation action. |
| Close / Cancel Close | Close sets the close date and is documented as available below Closed, even if receipt quantities have not completed every stage. Cancel Close clears close dates for closed receipts; an ERP-upload warning may appear. |
| Immediate Needs | Opens the related Insight with warehouse context when the documented immediate-needs conditions apply; fulfillment removes that eligibility. |
| Preview / Default / Selected Docs; Yard Check in & Out | Document output depends on configured print procedures/defaults. Yard opens the trailer context; it does not mean the trailer has already been checked in. |

Sources: [A03], n285–366; [A14], n237–267. These are product rules qualified by installed configuration. The original configuration map omits `EnableAction_...` predicate values; the separate [bounded enablement review](ENABLEMENT.md) describes captured expression structure and multi-selection flags without executing them. A generic successful response described in help does not establish rollback or partial-failure behavior for this installation.

## Receipt Line Insight — form 2780

Use this view to investigate item quantities within receipts. Observed criteria include receipt/type, ERP order-line number, item/description, Company, Warehouse and internal receipt number. Results expose total/open quantity and UM, alongside PO and receipt identities. The documented Container tile opens Receipt Container Insight using **Internal Receipt Line Number**; its link is disabled without Run permission on the target. ([A04], n58, n178–208.)

Edit/View open the receipt-line context. Delete requires that no quantity has been checked in. The product explicitly describes a mixed multi-selection deleting eligible rows until it encounters the first ineligible record, then stopping; it is not an all-or-nothing promise. Immediate Needs opens the related investigation context. ([A04], n223–233.)

Keep receipt number, receipt-line number and ERP line number separate. The installed Delete guard is structurally recorded as both `IS_RECEIPT_CLOSED` and `IS_CONTAINERS_CREATED` strictly equaling numeric zero. That is a configured client predicate, not proof of field types, server eligibility or a synonym for the source's no-checked-in-quantity rule. The installed form's table-name reference and list-grid `data-dbtable` do not agree; [backend bindings](BACKEND_BINDINGS.md) preserves both rather than silently correcting one. The exact runtime data source and deletion behavior remain verification items. [Enablement evidence](ENABLEMENT.md) retains parameter 26880 and its control/event context.

## Receipt Container Insight — form 2779

Use this view for license plates created/downloaded for receiving. Observed criteria include license plate, group, status, item, receipt, warehouse and internal identifiers. Results include quantity/UM and Status Failed. Documented icons distinguish pre-check-in containers, putaway-group membership and immediate needs; status and icon meanings should be explained in text as well as color. The detail-pane Container ID links to Receipt Container Details. ([A05], n58, n229–271.)

| Action | Documented condition/effect |
|---|---|
| Edit / View | Opens the container context. The article's Edit paragraph incorrectly says receipt line; the installed target is form 3005, so that copied wording is not treated as evidence of a line edit. |
| Cancel | For downloaded/pre-check-in containers before check-in; closes the container and removes its pre-receiving inventory. Parent cancellation also depends on child status. |
| Delete | Removes the container record from the active receipt-container table; Processing Receipts excludes Closed (900) containers and describes retained deleted-container history. |
| Locate | Requires Locate Pending; one or more containers use locating rules and the user's receiving preference, with documented default-preference fallback. |
| Remove From Group | One container at a time, from an open putaway group. |
| Unlocate | Documented as single/multiple eligible-container reversal, with success/partial-success/failure feedback. It was not exposed in the prior landing menu; do not infer current availability from the article. |
| Immediate Needs / Preview / Print | Related inquiry or configured document output; printing is not a harmless inspection step. |

Sources: [A05], n281–338; [A14], n274–304. Workbench guidance further says executed putaway work can prevent unlocating. The product's Cancel/Cancel Check In/Delete narratives are not interchangeable: cancellation of a pre-check-in container is described as status/quantity adjustment, while checked-in cancellation and deletion have different retained-history descriptions. Contradictory procedural wording is listed under gaps below. ([A09], n574, n598, n611–684.)

## Putaway Group Insight — form 2791

Use this view to find containers assigned to a putaway group, and inspect whether the group is open or closed. Observed criteria include group ID, destination location, receipt, internal group number and warehouse; the list shows group, warehouse and closed state. The product Containers tile opens Receipt Container Insight limited to the selected group, subject to target security. ([A06], n58, n139–186.)

Close and Rename are documented for open groups; Open is documented for closed groups. The runtime landing exposed those three actions. Removing a container is documented through Receipt Container Insight and requires an open group. A group close is not evidence that physical putaway has completed. Group assignment during locating depends on receiving preference, destination/group configuration and the applicable flow. ([A06], n200–208; [A05], n319; [A09], n547–553.)

## Receipt Monitoring — form 4106

Use the monitor to prioritize inbound work and then open matching receipt/work inquiries. The product describes the chart hierarchy **Receipt Dates → Receipt Type → Vendor Name → Purchase Order**. Insight carries the selected graph context into Receipt Insight. Totals report receipts, receipt lines and value for that context; changing warehouse changes the population. ([A07], n113–154.)

The documented tiles concern open receipts with items checked in over 24 hours ago, pending receipt putaway work over four hours old, and receipts with pending inbound QC. The putaway tile leads to Work Insight. The prior installed landing verified these labels, Refresh and the Insight entry, not numerical results or chart drilldowns. ([A07], n161–173.)

The [static backend review](BACKEND_BINDINGS.md#receipt-monitoring) finds overlapping date buckets: adding every chart category can double-count receipts. Its captured PO-level summary marker also needs frontend reconciliation. Neither default threshold wording nor a procedure name proves current warehouse configuration, timing accuracy or successful refresh. Grouping, drilldown procedures and indicator settings are configuration dependencies, not accepted analytics semantics.

## Appointment Calendar — form 4069

Use this calendar to see inbound appointments by receiving dock and time. The installed landing showed Dock Doors, hourly columns, Today/previous/next, Day/7 Days and New. Product documentation describes selecting an appointment to preview dock, carrier, trailer and start/end time; Edit or View depends on permission. Warehouse selection refreshes appointments without necessarily changing the displayed time range. ([A08], n58–68, n119–179, n259.)

New can begin from the action menu or selected dock/time region and opens form 2765. A receipt, receiving dock and appointment times provide context. Appointments cannot be created after items have been checked in; the scheduling reference says fields become disabled above Check-in Pending. These are documented prerequisites; required-field and overlapping-slot validation were not exercised. ([A08], n269–320; [A12], n58, n105–121.)

Calendar configuration has several layers. `header`, `views` and `buttonTextForViews` control view buttons, duration and resource text. `eventDetailFields` pairs resource keys with API fields; `eventsApiURL` identifies the provider. Separate SDK pages describe adding preview fields/colors through an Appointment Calendar Events SQL–Modify exit point, while another describes a custom API route. These are documented customization approaches, not interchangeable proof of what this tenant runs. Direct metadata edits may be overwritten by upgrades. ([S01], n47–54, n176–222; [S02], n47–54; [S03], n44, n107–149; [S04], n41–48, n97–143; [S05], n47–50, n109–203.)

AIM mentions a configurable Today offset, but the retained Full Calendar Now Indicator SDK page has no substantive instructional body. This review therefore does not name an unverified offset attribute or prescribe a change. ([A08], n154–156; [S06].)

## Receipt Workbench — form 4038

Use the workbench to process a receipt's lines and containers under a receiving preference. Prior live evidence covers only its receipt/preference entry shell. The following processing behavior is **product-source explanation**, not a performed transaction or observed downstream state. ([A09], n58–64, n206–241.)

The documented Lines accordion offers full, partial and all-line check-in; check-in creates containers, which appear under Containers. A selected receipt and appropriate receiving preference are prerequisites. Closed receipts cannot accept receipt-line check-in, although the source distinguishes operations on existing containers. Nesting adds parent/child context and child-count navigation. Quick-scan Item/Company entry initiates a quantity prompt rather than merely filtering the grid. ([A09], n60, n253–425.)

Preferences and item definitions can trigger license-plate, inbound QC, UM, dimensions, reason/disposition, lot, serial and catch-weight prompts. Those conditional screens remain a state checklist, not visited branches. Locating uses rules, capacity and UM constraints; preference-controlled work creation distinguishes creation of putaway work from treating quantity as on-hand at the chosen destination. Delayed locating also depends on the locating rule and Create Putaway Work combination. ([A09], n206–241, n443–495.)

Locate, Locate All, Unlocate, Unlocate All, group assignment, Cancel Check In, Cancel All, New Line and printing are documented processing controls. Executed putaway work can prevent unlocate. Cancel Check In is documented for unlocated product and returns quantity to the open line; prior interface upload can require ERP reconciliation. Pre-check-in cancellation has separate status/quantity rules. The source's conflicting Cancel Container wording prevents treating every cancel path as identical. ([A09], n506–615, n636–749.)

Important preference choices include default dock/status, work type, over-receiving, Create Putaway Work, Execute Group Putaway, LP assignment, immediate-needs processing, execution method and parent/child locating. A default named in product guidance is not a confirmed installed value. The selected SDD walkthrough also explains that overlapping locating-rule criteria make assignment priority important; its tenant choices are not adopted here. ([A15], n58, n143–160, n189–225; [D01], b00250, b00268–b00269.) The retained `MetaTrans_ReceiptWorkbench` contract prepares ten presentation result sets and security flags; it does not execute check-in or locate. See [backend bindings](BACKEND_BINDINGS.md#workbench-and-related-entry-screens).

## Direct detail and transaction contexts

These eight active contexts are explicitly referenced by retained root controls. Their base paths require legitimate record/workflow context; a bare path is not a constructed record URL. The complete association list is in [CONFIGURATION.md](CONFIGURATION.md#direct-form-associations).

| Form / screen | Purpose and source-supported sections | Remaining distinction |
|---|---|---|
| 4049 / 1423 — Purchase Order | Header/reference, source, ship-from, lines, dates/totals and user-defined sections. Copy includes selected header fields and lines. ([A10], n304–344.) | Create, copy, edit and view modes have different editable fields. |
| 4051 / 1665 — PO Line | Item, quantity, dimensions, characteristics, reference, categories and user-defined sections. ([A10], n355–393.) | Copy excludes open quantity and line identities; exact installed validation remains open. |
| 3034 / 1428 — Receipt | Receipt identity, source, ship-from, status, carrier, dates, lines and totals. ([A11], n385–419.) | New Line can remain open for successive entries; Cancel returns to the receipt. No entry was submitted. |
| 3035 / 1427 — Receipt Line | Item/lot, quantity, dimensions, characteristics, putaway, reference and category sections. ([A11], n429–454.) | Entry source and mode matter; the product mentions a New action not present in the prior line-Insight landing. |
| 3005 / 1666 — Receipt Container | Container/LP and parent, location/locating rule, contents, status/failure, dates, serial and reference context. ([A14], n101, n218–230.) | Configuration has these fields; none establishes a selected-record state or permits copying business values. |
| 4052 / 1802 — Receipt From PO | Header/source context and open PO lines. A new receipt can be created or lines added to an existing compatible open receipt. Percent/quantity/manual allocation affects proposed receipt quantities. ([A13], n58, n153–184.) | Existing receipt must share company/vendor context; creation service semantics remain separate from the screen seed. |
| 2765 / 1539 — Receiving Appointment Schedule | Receipt, trailer, dock and start/end schedule fields. ([A12], n58, n105–121.) | Check-in status and user permission constrain changes. Do not confuse this modern context with form 166. |
| 3052 / 1562 — Yard Check in & Out | Trailer, current/initial yard location, optional destination yard/dock and appointment context. Initial yard location is documented as required for check-in. ([A18], n58, n107–160.) | Check In/Out and OK can change yard state; the older source's OK instruction is not an inspection instruction. |

**Unresolved target 166:** Receipt Insight's Delete Appointment control 51806 has `data-formId` attribute 40910 pointing to `UI_RECVAPPTSCHEDULE` form 166. The captured registry has no active implementation for that form. This attribute may provide action/security context; it does not prove that the control navigates to form 166. Preserve the reference and its uncertainty; do not replace it with form 2765 or infer that the action is broken, harmless or unauthorized solely from this metadata.

## Configuration and error interpretation

The current first-hop map contains 17 active implementations, 697 controls, 225 events and 371 parameters. Its 164 indexed action controls include navigation/UI buttons; they are not 164 verified business actions. It preserves 338 accepted dependency tokens and three omitted values. Checkpoints, handlers, form targets and selected service paths show bindings.

The separate [enablement supplement](ENABLEMENT.md) describes 69 selected bindings: 51 action predicates and 18 multi-selection flags. It structurally parses all 69. Of the 51 predicates, 36 contain unresolved symbols (`NULL`, `TRUE`, `True`, `False` or `Closed`), which are not silently converted to literals or status values. The remaining 15 use typed literal operands, but field types, evaluator behavior, role/selection effects and server validation remain unproved. **Zero predicates were exercised at runtime.** Static expression structure improves the configuration explanation without completing action eligibility or business behavior.

Separately, [backend mapping](BACKEND_BINDINGS.md) resolves 24 of 30 distinct configured names exactly against retained catalog metadata and reuses 22 bounded static contracts. Some configured names have no exact match. Join fan-out means raw query rows need not equal unique receipt/line/container counts. A matched object, a presentation seed or a returned permission flag does not prove runtime availability or action success.

An application Security Access Violation page can reflect an invalid form/detail identity, screen licensing, permissions or company/warehouse access according to the product reference. It is not a universal diagnosis of a bad link. Follow observed/configured context and retain the exact failure category. No new error was reproduced in this source-only pass. ([A17], n664–684.)

## Remaining work and source conflicts

- **Selected-record/UI state:** verify applicable detail accordions, target navigation, back/cancel behavior, empty/error states, action enablement, field operands and validation under legitimate context. A visible menu does not prove its action is enabled.
- **Service contracts:** resolve action/controller behavior, partial failures and side effects separately from query/presentation procedures. No routine, API action, print, export, search, save or warehouse transaction was executed for this guide.
- **Source differences:** PO automatic-close wording is abbreviated; Receipt Container Edit text contains a receipt-line copy error; Workbench pre-check-in cancellation is described as closing/zeroing in n668 but later n684 says delete. The guide preserves the distinction and does not choose an unverified universal behavior.
- **Version/tenant limits:** references describe base product and documented versions. Calendar custom-API and exit-point examples differ; the Now Indicator page is substantively empty. Custom screens, permissions, preferences and replica freshness can change actual behavior.
- **Unresolved form:** target 166 remains a distinct known gap. The eight resolved context implementations are structurally mapped, not all live-reviewed.
- **Preserved scope:** the six owner-deferred mobile gaps and deployment/correlated-timing freeze at 0/34 are unchanged. No help-app, central SDD or original source was edited.

## Source reading links

| Code | Retained document |
|---|---|
| [A01] | Using the Purchase Order Insight Screen |
| [A02] | Using the Purchase Order Line Insight Screen |
| [A03] | Using the Receipt Insight Screen |
| [A04] | Using the Receipt Line Insight Screen |
| [A05] | Using the Receipt Container Insight Screen |
| [A06] | Using the Putaway Group Insight Screen |
| [A07] | Using the Receipt Monitoring Screen |
| [A08] | Appointment Calendar Screen |
| [A09] | Checking In and Locating Product (Receipt Workbench) |
| [A10] | Creating a Purchase Order in SCALE |
| [A11] | Creating a Receipt and Receipt Line |
| [A12] | Creating/Viewing Receipt Appointments |
| [A13] | Creating Receipts From Purchase Orders |
| [A14] | Processing Receipts |
| [A15] | Defining Receiving Preferences |
| [A16] | Reviewing Purchase Order Status Values |
| [A17] | Introduction to Insight Screens |
| [A18] | Using the Yard Check In and Out Screen |
| [S01] | Customize Appointment Calendar Preview Fields |
| [S02] | Customize Appointment Calendar Colors |
| [S03] | Customize the Calendar Event Preview |
| [S04] | Appointment Calendar Events SQL–Modify Exit Point |
| [S05] | Change the Days Viewed for a Calendar |
| [S06] | Customize the Full Calendar Now Indicator — content gap |
| [D01] | Configuration walkthrough — selected active passages, neutral source R02 |

[A01]: ../../AIM/reading/d2aab9eeb5e3111216fba46f880c0d40fbb2f0f85affbe6eaecd7a9152db59ce.md
[A02]: ../../AIM/reading/d97a049a5bc275a358857b638fa9dff8ec0499618251a2e0900f013de50cca02.md
[A03]: ../../AIM/reading/412a59949739c4404d7f5302249c471e133131d8b92c0e69d52ccb3fb5343f5e.md
[A04]: ../../AIM/reading/4c1bee3e8e4b6a4d373b8462f2e7a7d302913f3914f6fd9b09b8b9d7af85ba05.md
[A05]: ../../AIM/reading/b3e2988a6bfd87db32dec50f4bd9e8f27fd92377c4fe2616a56f55a41d5fb024.md
[A06]: ../../AIM/reading/2a03c5a28b63380fb7cdd58bfb2ffb971e705d9e387c004ac53cf6f5256c3b0f.md
[A07]: ../../AIM/reading/341662a0fdec97c53bc2c3b79816754bca388ae03b804ad43b6ecf795ff3c852.md
[A08]: ../../AIM/reading/c8dde724a07ae9c26e6f44982a0dbe3b649fb49855a107d2b03d76b696974f7d.md
[A09]: ../../AIM/reading/a357eac1f7ebf1b8fcf6edee90c086783da65f07d18fbdcc06236891e314cebc.md
[A10]: ../../AIM/reading/130679dfff7000eaf52b861d7511a6d14f9a325823d62ec9b9f2da4e272877ef.md
[A11]: ../../AIM/reading/819737ec46ea63973259964fb951c9f43b42c18355d46f4a5c9bb9992d45a21a.md
[A12]: ../../AIM/reading/1e177683ead3d4dbf24684d72666831cb828dfcf3bec8775a1997fcba8c88b69.md
[A13]: ../../AIM/reading/eb705e577b50e2097e333cbfac934ef01b8368cb6eacdaaf247e09740415ac21.md
[A14]: ../../AIM/reading/cdd035231269b9e86ef14a592f83a10888f073e35b300f82b60fe7301b4832ee.md
[A15]: ../../AIM/reading/94624e721fdc8b17b7fdcc4232de4870a98eedbb852d63a0230abd86008588b2.md
[A16]: ../../AIM/reading/2a527c5e7d8e6767787122c58edd13a2907206b5a7cd1f1e9b541bbc51546b85.md
[A17]: ../../AIM/reading/444e9b8e14a977178c9ff48b972dd65c076a4adda44c3dfacddf94a4a6c24d22.md
[A18]: ../../AIM/reading/63557a7eda0f03c25ef554d62301e077ad82c7bb733521f134b06323a8ebe65d.md
[S01]: ../../SDK/reading/855028c920ba7aae714399c4e37ac1d03edd26ea0322cda033d9ebf1514a3d50.md
[S02]: ../../SDK/reading/b9f62c9138798c590332509786a802833aa708a429cf04566e681f2409a76e2a.md
[S03]: ../../SDK/reading/9ad122d67ba90067d028ed060aea86ac9dc3138d1440eb55e1685580b1e533a7.md
[S04]: ../../SDK/reading/f9f8853841b05bab6720162ed231eefae6f188525739b19263da80e888270759.md
[S05]: ../../SDK/reading/ae0fe62bf41a537c7c074b0e96bdcdd21b2ef2ffa00c0514098d745b4ca0e0a5.md
[S06]: ../../SDK/reading/105eb85e6c169c8f255adc2818e77af583b4e68f2314066b9decad6c15808456.md
[D01]: ../../SDD/derived/reading/sdd-f46806ef53e15f07.md
