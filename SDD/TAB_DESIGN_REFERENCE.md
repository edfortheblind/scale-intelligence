# TAB core design reference

Reviewed October 8, 2026. The official Travis v1.0 SDD is the base design; the TRAV3PL v1.0 SDD adds the 2025 3PL requirements. Its assumption 18 retains original processes that it does not change. This is a source-grounded reading guide, not a replacement signed SDD or a record of current deployment.

Read the [source register](tab-core-sources.json), [Travis reading copy](tab-core/reading/sdd-716ca4b42b3f00bd.md), [TRAV3PL reading copy](tab-core/reading/sdd-a3f0962080bdc590.md), and [claim and reconciliation register](tab-core/reconciliation.json). Original documents retain their exact bytes and paths.

## How the two designs fit together

The owner identifies both sources as core for TAB. The owner also confirms that Travis does not use PO; no fake PO is needed. Current operational statements and direct runtime evidence remain distinct from historical design. The general [SCALE Functionality Reference](SCALE_FUNCTIONAL_REFERENCE.md) continues to explain product mechanisms without superseding this TAB design.

| Topic | Reconciled interpretation | Evidence |
|---|---|---|
| Base plus conditional addendum | Use the original Travis SDD as the base and the 2025 TRAV3PL SDD for its explicitly changed or added 3PL design. Assumption 18 preserves unmentioned original processes. Apply either as dated design evidence, not current configuration. | [TRAVIS-I01](#travis-i01), [TRAV3PL-P01](#trav3pl-p01) |
| One-company baseline versus new customers | The 2022 one-company Austin baseline and 2025 Company-per-new-customer design address different scopes. New customer zones are recommended; customer-specific locating/allocation configurations and output folders are required by the addendum. These requirements do not prove multiple customers are currently enabled. | [TRAVIS-I02](#travis-i02), [TRAV3PL-P02](#trav3pl-p02), [TRAV3PL-P03](#trav3pl-p03), [TRAV3PL-P10](#trav3pl-p10) |
| Receipt container downloads | The original excludes receipt container downloads. The addendum explicitly allows them when a customer supplies them. Preserve that conditional change; shipping containers remain excluded in both. | [TRAVIS-I04](#travis-i04), [TRAVIS-I05](#travis-i05), [TRAV3PL-P08](#trav3pl-p08), [TRAV3PL-P09](#trav3pl-p09) |
| PO non-use | The owner stated on October 8, 2026 that Travis does not use PO. Receipt-based designs and glossary PO entries do not contradict that statement. Generic screenshot PO examples are not TAB operational evidence. Keep S3 technical coverage 4/6 with PO branches unobserved, stop automatic retries, and create no fake PO. | [TRAVIS-I04](#travis-i04), [TRAVIS-I09](#travis-i09), [TRAVIS-I10](#travis-i10), [TRAV3PL-P08](#trav3pl-p08) |
| Mobile chronology | The original initial-go-live exclusions and the addendum plan to test three functions on 24.7.2575 are chronologically compatible. Neither supplies a completed present-day mobile procedure or runtime acceptance. The six deferred contracts remain deferred. | [TRAVIS-I12](#travis-i12), [TRAVIS-TO15](#travis-to15), [TRAV3PL-P05](#trav3pl-p05) |
| Receipt confirmation wording | Repeated container-level In Putaway wording is the documentary operational intent. Receipt/header, manual-close, zero-received and appendix closure wording leaves exact trigger interaction unresolved. Preserve all source variants; verify effective configuration only in separately authorized runtime work. | [TRAVIS-I06](#travis-i06), [TRAVIS-TO28](#travis-to28), [TRAVIS-TO29](#travis-to29), [TRAV3PL-P11](#trav3pl-p11) |
| Header Company and detail criteria | Company is required on receipt/shipment download headers, while locating/allocation criteria read receipt/shipment detail. Both requirements are retained. No mapping or automatic propagation claim is made. | [TRAV3PL-P08](#trav3pl-p08), [TRAV3PL-P09](#trav3pl-p09), [TRAV3PL-P13](#trav3pl-p13), [TRAV3PL-P15](#trav3pl-p15) |
| Wave sequence dependencies | The addendum supplies Rule Assignment before Allocation and VAS Assignment after Container Creation. Those dependencies qualify reuse but do not fill the original Start/Complete-only wave tables or resolve pending sequence exports. | [TRAVIS-TO02](#travis-to02), [TRAVIS-TO03](#travis-to03), [TRAV3PL-P15](#trav3pl-p15), [TRAV3PL-P16](#trav3pl-p16), [TRAV3PL-P17](#trav3pl-p17) |
| Short pick inventory versus demand | For TAB, preserve Count/suspend as the documented inventory action. Separately preserve Delete Rejected and upload for shipment demand. Generic statements about reducing on-hand must not overwrite that TAB distinction. | [TRAVIS-TO24](#travis-to24) |
| Extensions and unresolved comments | EX01 identifies Custom Item Balance in the modification table; its Approved cell is documentary status. EX-XX for 1348 printing remains unidentified. Pack Size communication, Load Building, allocation sequences, LTL label/BOL migration and full ODWS inventory remain qualified by comments or missing content. | [TRAVIS-I07](#travis-i07), [TRAVIS-TO03](#travis-to03), [TRAVIS-TO05](#travis-to05), [TRAVIS-TO06](#travis-to06), [TRAVIS-TO17](#travis-to17), [TRAVIS-TO19](#travis-to19), [TRAVIS-TO20](#travis-to20), [TRAVIS-TO22](#travis-to22) |
| Blank signoff and retained anomalies | Official core status is the owner instruction. It does not resolve blank signatures, placeholders, retained comments, the unexpected Aaron's VAS item-list name, or the Allocation figure caption error. Preserve those anomalies visibly. | [TRAVIS-TO14](#travis-to14), [TRAVIS-TO30](#travis-to30), [TRAV3PL-P01](#trav3pl-p01), [TRAV3PL-P15](#trav3pl-p15) |
| Neutral reference and help boundary | TAB-specific interpretation uses these core sources first. The neutral SCALE Functionality Reference remains general product guidance. This packet adds documentary interpretation without changing help rankings, app content, SRC mappings, runtime settings or deployment/timing acceptance. | [TRAVIS-I01](#travis-i01), [TRAV3PL-P01](#trav3pl-p01) |

## Source and review limits

Both cover/signature records contain blank signoff fields. The Travis cover dates are April 25 / May 18, 2022; its revision table says May 17. The TRAV3PL cover is February 18 / March 5, 2025 and its revision table says March 5. These are source labels, not acceptance or deployment dates.

All 1,403 DOCX extraction nodes and all 264 PDF extraction nodes were read, including tables and ancillary text. PDF nodes include 238 text blocks and 26 heuristic table candidates, some overlapping. The [coverage ledger](tab-core/text-review-coverage.json) binds exact text and complete-node hashes. Source-reading coverage is 100% of extracted text; it is not semantic or runtime acceptance of every statement.

The [visual review](tab-core/visual-review.json) records 22/22 PDF page renders and the separate DOCX embedded-asset pass. The DOCX physical page layout was not rendered; no claim is made about its stored 87-page count or complete Word pagination. Comments are retained but their original anchor geometry was not reconstructed. Figures and example screenshots remain source illustrations.

Embedded receipt screenshots include generic Purchase Order samples; these do not contradict the owner's PO non-use. The receiving montage shows manual LPN entry while TAB prose specifies system assignment. The putaway illustration omits TAB's Conveyor/TRAV_PALLET/P&D stages. Returns imagery depicts legacy RF. Generic figures containing lots, crossdock, work orders, Pallet Building, FedEx or sample thresholds do not establish TAB adoption. See the asset-specific visual qualifications.

Unresolved placeholders and comments remain in the original/reading copies and in the claim limits below. This documentary packet is not indexed by the functional-help application. Six mobile contracts remain deferred; deployment/correlated timing remains 0/34.

## Original Travis design: inbound and inventory

<a id="travis-i01"></a>
### Source scope and historical baseline

The v1.0 document defines proposed SCALE processes for the Austin TAB facility; its cover records 2022 creation and modification dates with blank functional/detail sign-off dates. It describes an upgrade from SCALE 2016 to Active SCALE 2021, with Rainbow Data Systems, Dell Boomi, Windows and Zebra in its technology baseline.

Qualification: Owner designation as official core SDD does not turn proposed or dated statements into current deployment evidence. MHE vendor includes XXX; Chrome version remains TBD; those values are unresolved.

Source: [b00005](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00005), [b00006](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00006), [b00008](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00008), [b00013](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00013), [b00056](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00056), [b00058](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00058); all 15 anchors in the register.

<a id="travis-i02"></a>
### Units dimensions and master data

The design specifies EA-CS-PL, Kit-CS-PL and Pair-CS-PL storage templates, company configuration with one Austin company, inches and pounds, item-class dimension/UOM defaults for most SKUs, and manual new-item maintenance until an automated download is developed. EA/Kit/Pair and CS are grouped during check-in; Treat as Loose is set at UOM level according to repacking need.

Qualification: Only one dimension set per item/UOM may misstate capacity when packaging varies. The intended Item Master interface is a future objective in this document, not evidence of its completion. One-company scope is historical Austin baseline; any later 3PL design must be reconciled separately.

Source: [b00103](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00103), [b00104](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00104), [b00105](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00105), [b00106](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00106), [b00107](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00107), [b00108](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00108); all 20 anchors in the register.

<a id="travis-i03"></a>
### Interface approach

The upgrade design changes direct-table interfaces to XML file interfaces, with manual or scheduled execution and configurable failure alerts. The Boomi shipment transformation is explicitly part of the planned transition.

Qualification: Schedules and alert activation depend on configuration and are not established here as currently running.

Source: [b00164](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00164), [b00166](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00166), [b00168](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00168), [b00170](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00170), [b00172](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00172), [b00207](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00207); all 7 anchors in the register.

<a id="travis-i04"></a>
### Receipt download

The historical 2016 path uses a received TCN entered into VIM to trigger receipt download. The Active SCALE design instead sends vendor receipt header and detail data after host EDI consumption, potentially before physical arrival; receipt container data is excluded from downloads.

Qualification: Unauthorized returns may lack an interface record and use the separately documented manual/blind alternatives. No PO or PO-line dependency is stated by the assigned receipt design.

Source: [b00199](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00199), [b00201](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00201), [b00203](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00203), [b00287](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00287), [b00309](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00309).

<a id="travis-i05"></a>
### Shipment download

Shipment interfaces contain a warehouse-specific header, one or more details, and optional header/detail comments, with parcel UPS and LTL as the principal shipment types. Shipping Container is explicitly not downloaded.

Qualification: Host updates and deletions are allowed only before waving, refined by both leading/trailing In Pool status in the later validation section.

Source: [b00209](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00209), [b00211](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00211), [b00213](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00213), [b00214](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00214), [b00216](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00216).

<a id="travis-i06"></a>
### Receipt and shipment confirmations

The TAB design repeatedly specifies receipt confirmation at container level when each receipt container reaches In Putaway, replacing the historical detail-level Putaway Pending trigger. Receiving-dock inventory is excluded from Item Balance. Shipment confirmation is generated after Shipping Load confirmation at Closed status 900.

Qualification: b00224 also describes receipt trailing status and manually closed receipts; b00226 uses receipt-status wording. Container-specific statements are the clearer design basis, but actual status-trigger configuration remains unverified.

Source: [b00224](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00224), [b00226](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00226), [b00228](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00228), [b00230](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00230), [b00234](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00234), [b00236](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00236); all 8 anchors in the register.

<a id="travis-i07"></a>
### Inventory interfaces and condition-code preservation

The design permits inventory movements and changes to upload through Inventory Transactions and on-demand/scheduled Item Balance reporting by item and status. TAB uses Inventory Status as Condition Code and requires preservation through shipping docks through a modified Item Balance procedure.

Qualification: The interface passage uses EX-XXX; the later modification table names EX01 Custom Item Balance with documentary Approved status. Neither passage establishes an implemented routine or deployed behavior.

Source: [b00240](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00240), [b00244](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00244), [b00246](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00246), [b01126](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01126).

<a id="travis-i08"></a>
### Interface mutation conditions

Receipt update/delete requires both leading and trailing statuses Check-In Pending. Shipment update/delete requires both statuses In Pool. Interface action codes determine NEW, SAVE, CHANGE or DELETE processing.

Qualification: These are documented validations, not a test receipt or authorization to perform changes.

Source: [b00250](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00250), [b00252](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00252), [b00253](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00253), [b00255](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00255).

<a id="travis-i09"></a>
### Receipt types and documents

The design uses Item Level Receiving for standard receipts and ultimately all Receipt Types. DD250 identifies standard receipts and 1348 returns. The Receiving Worksheet DOC01 is optional, normally replaced by vendor paperwork, and was unlikely to be used at initial go-live. Receipts can be viewed in Receipt Insight.

Qualification: Initial overview excludes returns from its standard-receipt scope; later return sections provide their exceptions rather than establishing a PO flow.

Source: [b00287](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00287), [b00289](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00289), [b00291](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00291), [b00293](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00293), [b00314](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00314), [b00316](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00316); all 12 anchors in the register.

<a id="travis-i10"></a>
### Appointment scheduling capability

The document describes scheduling against an existing receipt from Receipt Insight, entering trailer/dock/start/end, viewing Appointment Calendar, and editing or deleting scheduled appointments. Only open receipts qualify; an appointment must associate with a receipt and cannot be created for a PO.

Qualification: This section uses capability wording and does not independently establish that TAB currently schedules appointments in SCALE.

Source: [b00345](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00345), [b00351](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00351), [b00353](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00353), [b00354](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00354), [b00355](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00355), [b00356](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00356); all 9 anchors in the register.

<a id="travis-i11"></a>
### Item-level receiving mechanics

The recommended path supports Receipt Workbench or Warehouse Mobile Item Level Receiving, single-SKU pallets, locating/work generation during check-in, system-generated LPNs and LBL01 labels. Missing dimensions/UOM information is described as a soft stop that permits receiving to continue. Received inventory starts Putaway Pending before LPN Putaway work.

Qualification: Receiving preference: Header - Item no Disposition Code; Check-in and Locate Immediate; Execute Group Putaway and Process Immediate Needs unchecked. Documented mobile behavior is not current UI/runtime or accessibility acceptance.

Source: [b00383](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00383), [b00387](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00387), [b00388](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00388), [b00391](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00391), [b00393](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00393), [b00395](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00395); all 7 anchors in the register.

<a id="travis-i12"></a>
### Unauthorized returns and blind receiving

Unauthorized returns may be entered manually as a 1348 receipt and received through the standard preference, or received blindly with a generated/editable receipt ID and subsequent disposition code. The document explicitly excludes Warehouse Mobile blind receiving at initial go-live and supplies full-screen Receipt Workbench or legacy RF as interim paths.

Qualification: The Warehouse Mobile Returns Receiving description is conditional future state, qualified by b00311/b00408; availability today is unverified. Blind preference: Blind with Disposition Code, Locate by Child, Execute Group Putaway unchecked.

Source: [b00309](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00309), [b00311](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00311), [b00403](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00403), [b00404](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00404), [b00405](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00405), [b00406](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00406); all 9 anchors in the register.

<a id="travis-i13"></a>
### Receiving damage overage shortage and closure

DD250 damaged goods are first received under A then status-changed for the damaged portion; 1348 returns may enter damaged/unavailable status directly. DD250 over-receiving is prohibited with SDR/return-to-vendor handling; 1348 over-receiving is allowed. Short receipts remain open pending remaining units, subject to a documented three-month archive setting and redownload. Complete receipts close after the last LPN putaway; accidentally closed receipts can be reopened manually.

Qualification: Archive timing is configuration-dependent and historical; no archive access was performed. Closed receipts reject further receipt processing while closed; manual reopening is an explicit exception, not a source contradiction.

Source: [b00418](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00418), [b00420](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00420), [b00421](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00421), [b00422](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00422), [b00423](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00423), [b00427](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00427); all 11 anchors in the register.

<a id="travis-i14"></a>
### Locating rules and putaway work

Initial locating rules/zones are copied from SCALE 2016, assigned by Locating Rule Assignment to receipt detail and manually selectable. Build-phase candidates include single-location F-area strategy, split quantity, system LPNs/LBL01 and rule consolidation. Each located full/partial-pallet LPN becomes a putaway work unit.

Qualification: Candidate enhancements must not be promoted to configured rules without later evidence.

Source: [b00455](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00455), [b00457](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00457), [b00459](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00459), [b00460](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00460), [b00461](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00461), [b00462](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00462); all 9 anchors in the register.

<a id="travis-i15"></a>
### Putaway execution and conveyor extension

Putaway selects the LPN work unit, verifies dock/item quantity, transitions LPNs to In Putaway, and confirms the destination. Full pallets first go to Conveyor then spur P&D via TRAV_PALLET/EX08, with forklift completion to reserve; partial pallets locate directly to inventory, ILA if available. Final putaway closes the LPN and updates location on-hand.

Qualification: TRAV_PALLET/EX08 are design references, not database/routine inspection or runtime verification. Skip/LIFO guidance is conditional on multiple work instructions or putaway groups.

Source: [b00483](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00483), [b00485](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00485), [b00487](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00487), [b00489](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00489), [b00491](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00491), [b00493](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00493).

<a id="travis-i16"></a>
### Putaway override

Authorized users can override a suggested location; the described checks validate location and conflicting directed inventory, update work/LPN records and transaction history, then require putaway confirmation. The Locate action permits manually choosing a locating rule. An activity count at the original location is a capability that TAB did not use.

Qualification: Actual permissions, validation rules and active counts were not inspected.

Source: [b00499](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00499), [b00500](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00500), [b00502](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00502), [b00504](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00504), [b00506](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00506).

<a id="travis-i17"></a>
### Inventory adjustments and transfers

Adjustment/transfer reason types have configurable limits and user permissions. Adjustments record history and may upload or remain SCALE-only; only located inventory can be adjusted, not receiving-dock inventory. Transfers may be initiated from Inventory Insight or Mobile Inventory Management, but transfer work must be created from insight screens and may be executed by RF or Work Insight. Types are copied from SCALE 2016.

Qualification: The proposed user-directed transfer profile uses From Check Digit to avoid overlap with cycle counts using From Loc; EXP01 is proposed to remove P&D for R1 destinations. No executed adjustment/transfer or permission check occurred.

Source: [b00528](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00528), [b00530](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00530), [b00536](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00536), [b00540](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00540), [b00544](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00544), [b00546](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00546); all 8 anchors in the register.

<a id="travis-i18"></a>
### Transfer work extensions

The upgrade proposal adds a user-directed transfer profile using From Check Digit as the work unit to avoid collision with cycle counts using From Loc. It proposes Work Creation - After EXP01 removal of P&D for transfer destinations in floor-level R1.

Qualification: Both statements describe desired setup; implementation and runtime operation remain unverified.

Source: [b00556](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00556), [b00558](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00558).

<a id="travis-i19"></a>
### Inventory condition codes

Inventory Status represents Condition Code: A/B/C available, H damaged, L litigation; G unused at the document date but requiring segregation if adopted. Status changes are permission-controlled and recorded in history. Each LPN can hold only one status per item; non-LP-tracked locations cannot hold the same item in multiple statuses.

Qualification: Current code mappings, permission assignments and license-plate tracking configuration were not verified.

Source: [b00568](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00568), [b00570](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00570), [b00571](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00571), [b00572](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00572), [b00573](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00573), [b00574](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00574); all 10 anchors in the register.

<a id="travis-i20"></a>
### Replenishment

The baseline excludes demand replenishment and uses daily item-location-capacity replenishment in PL/CS increments, scheduled or manually invoked. The specified 48x48x50 threshold is 0%; 48x48x62 uses one tier of cases relative to location capacity. Allocation zones/sequences are copied from 2016. Mobile replenishment is system-directed, confirms pick and active-location check digits, and may rename work units with a TAB-supplied temporary LPN.

Qualification: The exact numeric threshold for 48x48x62 depends on tier quantity and maximum location quantity; neither is established as a universal number here. No current work profile, scheduled job or mobile execution verification.

Source: [b00139](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00139), [b00140](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00140), [b00591](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00591), [b00595](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00595), [b00597](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00597), [b00599](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00599); all 14 anchors in the register.

<a id="travis-i21"></a>
### Cycle count generation and execution

Cycle Count Plans select item/location ranges and create separate location work units; the 2016 configurations are copied forward. Verify Empty activity counts are interleaved with existing work profiles. Mobile execution may add unexpected items. The documented preference verifies bad counts, uses Standard execution and hides system quantity.

Qualification: Generic activity-count trigger examples are not evidence that TAB enables every such trigger.

Source: [b00629](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00629), [b00631](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00631), [b00637](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00637), [b00639](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00639), [b00641](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00641), [b00642](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00642); all 8 anchors in the register.

<a id="travis-i22"></a>
### Cycle count review and reconciliation

Cost-based user tolerances determine automatic inventory adjustment versus Pending Review. A supervisor reconciles out-of-tolerance counts through Cycle Count Request Insight or RF; discrepant recounts require another verification before adjustment. The starting tolerance amount is an unresolved $XXX placeholder.

Qualification: Do not assign a numeric tolerance or infer current permissions from this design. Mobile reconciliation remains documentary evidence only.

Source: [b00654](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00654), [b00656](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00656), [b00659](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00659), [b00661](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00661), [b00667](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00667), [b00669](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00669).

## Original Travis design: outbound and configuration

<a id="travis-to01"></a>
### Outbound intake and carrier routing

Shipments use scheduled XML file downloads. Rejected downloads go to an output folder for review/reprocessing. The design changes LTL carrier assignment from manual post-download selection in SCALE 2016 to Boomi assignment during Active SCALE download; manual exceptions remain available. Existing Pool Views are to become Planned Shipment Filters.

Qualification: This describes intended conversion behavior, not evidence that Boomi mappings or migrated views are deployed.

Source: [b00696](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00696), [b00698](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00698), [b00700](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00700), [b00702](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00702), [b00704](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00704).

<a id="travis-to02"></a>
### Wave masters and conversion sequence

All shipments enter waves; initial Multi-Pack waving performs shipment consolidation and Packing Class assignment. Named batch examples include Parcel, Parcel Tomorrow changing services to UPS Next Day Air, International Parcel grouping labels by shipment and validating required address data, and LTL converting a wave to LTL-Generic when a non-UPS carrier occurs.

Qualification: The Standard and Multi-Pack flow tables list only Start and Complete; comments request current configuration exports. Do not infer a complete executable step sequence.

Source: [b00708](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00708), [b00721](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00721), [b00725](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00725), [b00726](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00726), [b00727](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00727), [b00729](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00729); all 12 anchors in the register.

<a id="travis-to03"></a>
### Incomplete wave flow tables

Both Standard and Multi-Pack tables contain only sequence 10 Start Wave and 1000 Complete Wave. Body says existing 2016 flows will be copied; comments request an export. Later prose describes many intervening steps not represented in these tables.

Qualification: Exact configured sequence is missing.

Source: [b00713](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00713), [b00716](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00716), [b00719](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00719), [b00744](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00744), [part-comments](tab-core/reading/sdd-716ca4b42b3f00bd.md#part-comments).

<a id="travis-to04"></a>
### Carrier-dependent outbound statuses

The source assigns shipment-detail status flow by carrier type. Its specific Parcel flow omits Loading Pending 650; the LTL flow includes 650. Both include 100,200,201,300,301,400,401,700,800,900.

Qualification: Appendix b01295 also lists Staging Pending 600. It is a broader default/status catalogue, not proof 600 belongs in either named TAB carrier flow.

Source: [b00750](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00750), [b00755](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00755), [b01023](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01023), [b01291](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01291), [b01295](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01295).

<a id="travis-to05"></a>
### Packing Class and Pack Size

Multi-Pack assigns shipment-detail Packing Class to constrain co-packing and eligible box groups. The conversion proposes Pack Size-to-SCALE communication so actual container type updates SCALE, extending the existing integration.

Qualification: Comments call for a Pack Size requirements meeting. Two-way communication is proposed, not verified delivered.

Source: [b00764](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00764), [b00766](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00766), [part-comments](tab-core/reading/sdd-716ca4b42b3f00bd.md#part-comments).

<a id="travis-to06"></a>
### Allocation rule assignment and sequences

TAB intends wave-time allocation-rule assignment with manual/interface exceptions. Parcel FIFO sequences use Floor, Shelf, Mezzanine, all EA/CS; LTL uses Floor EA/CS, Shelf EA/CS, Rack CS/PL. Tables specify Available inventory, no clear-location requirement and multiple lots allowed.

Qualification: Comments require confirmation of zones and both sequences; allocation zone A-TBD remains unresolved.

Source: [b00769](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00769), [b00772](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00772), [b00774](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00774), [b00777](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00777), [b00781](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00781), [b00785](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00785); all 8 anchors in the register.

<a id="travis-to07"></a>
### Allocate Complete and rejection

All orders initially have Allocate Complete set to Yes; associates may manually change it for partial allocation. With the flag off, unallocated quantity returns to pool; whole rejected shipments also return to pool. Show All Allocation Failures is Yes.

Qualification: Not proof of current order flags, backorder behavior in every case or a universal all-or-nothing business transaction.

Source: [b00790](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00790), [b00794](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00794), [b00796](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00796), [b01203](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01203).

<a id="travis-to08"></a>
### Container planning and work-unit granularity

Shippable UMs create full containers; loose inventory groups by Packing Class and container group, subject to weight/volume/critical dimensions. Missing UM records are described as zero dimensions and weight. TAB work is one unit per full pallet, case or loose container, ordered by pick sequence.

Qualification: Zero-size fallback is a documented risk/behavior, not a recommendation to omit item UMs.

Source: [b00799](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00799), [b00801](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00801), [b00803](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00803), [b00805](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00805), [b00807](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00807), [b00815](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00815); all 12 anchors in the register.

<a id="travis-to09"></a>
### Wave paperwork and release

Container Contents labels are manually printed through Reprint Wave Labels outside Pack Size; Pack Size applies labels during container creation. No documents are to print at wave release. Release removes Wave Not Released holds. Generic release text also says it prints labels/documents, but the explicit Travis note qualifies that behavior.

Qualification: Do not repeat the generic release bullet as the TAB design without the local override. No actual print verified.

Source: [b00836](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00836), [b00838](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00838), [b00841](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00841), [b00866](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00866), [b00868](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00868), [b00869](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00869); all 9 anchors in the register.

<a id="travis-to10"></a>
### No-work guard and wave completion

The Check for No Work override marks a wave failed when work creation did not produce work for every shipment. Complete Wave moves shipments to Picking Pending, after which release makes work eligible.

Qualification: Override table b01143 is blank; exact step identity and full configuration remain missing.

Source: [b00845](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00845), [b00848](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00848).

<a id="travis-to11"></a>
### Wave and shipment cancellation

Wave cancellation backs out allocations and deletes work/containers. Shipment cancellation after release requires a warehouse user; host changes are limited to In Pool. Picked goods require a separate transfer back. Cancellation fails when related work is actively being executed.

Qualification: Retain as the TAB design rule; do not erase other-source/version conflicts or assert verified service behavior.

Source: [b00856](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00856), [b00860](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00860), [b00884](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00884), [b00886](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00886).

<a id="travis-to12"></a>
### Work priority

System-directed work can sort Priority/Location/FIFO or Location/Priority/FIFO. The source recommends common priorities for proximity and identifies Work Priority Escalation as a future optional adjustment.

Qualification: The source lists alternatives without selecting a single effective configured order.

Source: [b00892](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00892), [b00898](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00898), [b00900](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00900), [b00901](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00901), [b00903](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00903).

<a id="travis-to13"></a>
### VoCollect picking

All TAB picking is described through VoCollect. Full pallet and case picks each get a work unit; loose/TAL=Y inventory gets one unit per container. Full cases require TAL=N. Completion confirms movement to the packing/OV location. Mixed case quantities motivate spoken text warnings and VAS checks.

Qualification: No VoCollect script, integration execution, spoken accessibility or current adoption is verified.

Source: [b00907](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00907), [b00909](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00909), [b00910](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00910), [b00911](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00911), [b00919](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00919), [b00921](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00921); all 23 anchors in the register.

<a id="travis-to14"></a>
### VAS and copied-name anomaly

VAS assignment is intended for wave-created containers holding items with inconsistent case quantities; VAS confirmation precedes close-carton processing. The paragraph unexpectedly says Aaron's will supply the item list.

Qualification: Do not silently replace or generalize the other organization name. Ownership of the item list needs clarification; VAS described as wave-container dependent.

Source: [b00965](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00965), [b00967](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00967), [b00971](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00971), [b00975](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00975).

<a id="travis-to15"></a>
### Outbound QC coverage and station

All containers created during waving are to be flagged for outbound QC; supervisors can also mark containers manually. QC Workbench scans each item, requires configurable discrepancy reasons and successful correction before closing. The document says RF/Warehouse Mobile QC was not yet available.

Qualification: Warehouse Mobile availability statement is dated 2022, not a current product capability determination. It does not close the six owner-deferred mobile contracts.

Source: [b00979](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00979), [b00981](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00981), [b00986](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00986), [b00994](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00994), [b00996](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00996), [b01000](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01000); all 7 anchors in the register.

<a id="travis-to16"></a>
### Close Container and output requirements

Both Parcel and LTL require Close Container. Parcel closes after OV at packing and produces shipping label LBL03; LTL closes before MOP/dock transfer and is described as producing vendor label LBL04. The configured detail status flow produces Parcel 700 or LTL 650.

Qualification: Comments ask whether LTL vendor/shipping labels are produced. Preserve that uncertainty.

Source: [b01008](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01008), [b01010](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01010), [b01013](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01013), [b01014](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01014), [b01018](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01018), [b01019](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01019); all 9 anchors in the register.

<a id="travis-to17"></a>
### 1348 printing extension

Each detail reaching packed-complete is described as triggering EX-XX to print DOC02/1348 through the TAB SSRS environment.

Qualification: EX-XX is an unresolved placeholder; comments ask which extension prints per detail versus the last container. Do not map it to EX01 or claim a deployed implementation.

Source: [b01015](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01015), [b01130](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01130), [part-comments](tab-core/reading/sdd-716ca4b42b3f00bd.md#part-comments).

<a id="travis-to18"></a>
### Packing content changes and carrier exceptions

Container content changes set quantity to pack to zero and repack via Packing; editing requires a Packing location. Shipment Edit can change carrier, or Transfer Shipment moves to an existing/new load and takes its carrier.

Qualification: No current permission or closed-container edit eligibility is established.

Source: [b01029](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01029), [b01031](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01031), [b01038](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01038), [b01041](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01041), [b01043](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01043), [b01045](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01045).

<a id="travis-to19"></a>
### Load building and manual dock assignment

The body proposes wave-based load building by scheduled ship date, carrier and route, a change from 2016. Carrier Service alone does not split a shared-carrier load. Dock/staging destinations are manually decided via Immediate Dock Transfer.

Qualification: Comments explicitly ask Travis to confirm adding Load Building. Record as a proposed change, not finalized configuration.

Source: [b00810](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00810), [b00812](tab-core/reading/sdd-716ca4b42b3f00bd.md#b00812), [b01059](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01059), [b01063](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01063), [b01065](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01065), [b01066](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01066); all 13 anchors in the register.

<a id="travis-to20"></a>
### Load confirmation and Bill of Lading

The source permits load confirmation after all shipments are Ship Confirm Pending; confirmation closes load/shipments/details/containers and relieves shipping-dock inventory. DOC03 Bill of Lading is described as manually printable around confirmation.

Qualification: Comments say BOL was then produced outside SCALE and migration remained undecided. Do not assert deployed SCALE BOL generation.

Source: [b01084](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01084), [b01088](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01088), [b01090](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01090), [b01130](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01130), [part-comments](tab-core/reading/sdd-716ca4b42b3f00bd.md#part-comments).

<a id="travis-to21"></a>
### Parcel manifests and rating

The design permits multiple manifests daily, directs processing through Manifest Insight, and prevents additional containers/changes on closed manifests. New same-day containers enter a new manifest. Progistics is intended; UPS manifest and summary barcode automatic-selection defaults are N; FedEx host value is N/A.

Qualification: The FedEx two-hour transmission sentence is generic source text and does not establish TAB FedEx use or current timing.

Source: [b01094](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01094), [b01098](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01098), [b01104](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01104), [b01108](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01108), [b01109](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01109), [b01111](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01111); all 13 anchors in the register.

<a id="travis-to22"></a>
### Performance and modification inventory gaps

Reporting Requirements has no substantive body. EX01 Custom Item Balance is marked Approved for mixed inventory statuses at shipping docks. DOC01-DOC03 and LBL01-LBL04 are listed; EXP01 Work Creation-After wipes P&D on transfer into R1. ODWS inventory is blank despite several described steps.

Qualification: An Approved cell is documentary status, not deployment evidence. Comments request extension specs, exit-point/ODWS inventory review and SCI reporting decisions.

Source: [b01116](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01116), [b01118](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01118), [b01119](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01119), [b01120](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01120), [b01126](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01126), [b01130](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01130); all 10 anchors in the register.

<a id="travis-to23"></a>
### Inventory controls

Documented choices include no duplicate LPs across warehouses, no duplicate serials, no reuse of closed LPs, Available adjustment status, Held frozen lots, @ duplicate-LP delimiter, three-character alphanumeric check digits, RF user-defined edit enabled, item/location validation Yes and location UM overrides/write-on-item-UM-change No.

Qualification: Comments ask to review existing values to copy from 2016. Item validation Yes versus tracking-default Yes allowing undefined-item adjustments is an apparent textual tension; no precedence is established.

Source: [b01170](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01170), [b01172](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01172), [b01174](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01174), [b01176](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01176), [b01178](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01178), [b01180](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01180); all 20 anchors in the register.

<a id="travis-to24"></a>
### Short pick: inventory versus shipment

Short Pick Inventory Action is Count, suspend transaction quantity, described as not creating inventory-changing transactions except suspense. Separately Default Status for Short Pick is Delete Rejected, rejecting/deleting shorted demand and uploading it; Upload Deleted Shipments is Yes.

Qualification: These are different axes, not contradictory settings. Current runtime and reconciliation timing remain unverified.

Source: [b01197](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01197), [b01315](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01315), [b01361](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01361).

<a id="travis-to25"></a>
### Receiving and cycle-count settings

Locating-rule assignment is Receipt Check In; RF receiving-preference prompting is Yes. Override pick/putaway cycle-count creation is Yes. Activity and planned count adjustments use CC, activity count creates work, count-plan auto-release is No for review, and activity work unit uses Internal Instruction Number.

Qualification: Comments question whether activity counts are used and ask to confirm current count settings/tolerances; retain that unsettled status.

Source: [b01186](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01186), [b01188](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01188), [b01214](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01214), [b01216](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01216), [b01237](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01237), [b01239](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01239); all 12 anchors in the register.

<a id="travis-to26"></a>
### Work defaults and unresolved replenishment override

Documented defaults include no group-container removal on passed work, # work-unit delimiter, RF comments/text enabled, insignificant decimals hidden, Wave Not Released hold, maximum 2000 work records, 10 override locations, and 720-minute RF timeout. Wave-replenishment override work type is TBD.

Qualification: 2000/10/720 are dated documentary settings/default recommendations, not capacity, performance or security validation. Do not resolve TBD automatically.

Source: [b01254](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01254), [b01255](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01255), [b01256](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01256), [b01257](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01257), [b01259](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01259), [b01261](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01261); all 15 anchors in the register.

<a id="travis-to27"></a>
### Inbound/outbound actions and decimals

Inbound statuses are 100/200/300/301/900. New manual receipt containers start Locate Pending, receipts start Check In Pending; canceled check-in returns receipt to Check In Pending and canceled locating returns LPN to Locate Pending. Canceled/rejected shipments return In Pool. Decimal settings are default 0, dimensions 2, quantity 0, value 2, volume 3, weight 2.

Qualification: Do not confuse manually added receipt-container default with the interface initial-status setting, and do not perform the suggested SQL resource update.

Source: [b01287](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01287), [b01300](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01300), [b01302](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01302), [b01304](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01304), [b01306](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01306), [b01311](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01311); all 9 anchors in the register.

<a id="travis-to28"></a>
### Interface policy and unresolved paths

Duplicate receipt/shipment IDs on add are N; zero updates to UD7/UD8 are Y; zero-inventory item-balance upload is No; receiving upload level is Container; shipping download creates Shipments only; split consolidated shipments on upload is N. Input/output/XSL/upload directories all retain a Storage Blob placeholder.

Qualification: Directory examples are unresolved templates, not runnable paths. ERP_ORDER splitting prerequisites are explanatory despite the selected split flag N.

Source: [b01327](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01327), [b01329](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01329), [b01331](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01331), [b01333](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01333), [b01335](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01335), [b01337](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01337); all 14 anchors in the register.

<a id="travis-to29"></a>
### Receipt upload settings and wording conflict

Interfaced receipts begin Check In Pending; shipments begin In Pool. Closed zero-received receipts and zero-received details are uploaded under the documented close-date conditions. The setting headed Upload Receipt Containers At This Status Or Higher is assigned In Putaway.

Qualification: b01363 body describes a receipt-header threshold despite its container heading; b01343 also describes Container upload after closure. Exact container/header/status/closure interaction is unresolved; do not silently repair it.

Source: [b01355](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01355), [b01357](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01357), [b01359](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01359), [b01363](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01363), [b01365](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01365), [b01362](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01362).

<a id="travis-to30"></a>
### Security and document authority

Security supports per-user records, groups, processing/configuration checkpoints and mass assignments. Revision table identifies original v1.0 dated 2022-05-17; header displays 2022-05-18. Signature/date line is blank. All retained nodes have no tracked-change markup, but comments remain and Open Issues directs readers to comments.

Qualification: Blank signatures, unresolved comments and zero tracked revisions cannot establish approval or implementation completion; current owner source designation remains valid.

Source: [b01370](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01370), [b01372](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01372), [b01374](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01374), [b01387](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01387), [b01392](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01392), [b01395](tab-core/reading/sdd-716ca4b42b3f00bd.md#b01395); all 9 anchors in the register.

## TRAV3PL additions and conditions

<a id="trav3pl-p01"></a>
### Scope, date and relationship to the base SDD

The Austin 3PL enablement document v1.0 was created February 18, 2025 and modified March 5, 2025. It describes proposed enablement. Assumption 18 explicitly retains original SDD configurations and processes not mentioned in the addendum.

Qualification: Signature and design-signoff fields are blank; source authority comes from the owner designation, not inferred signed acceptance.

Source: [p001-b007](tab-core/reading/sdd-a3f0962080bdc590.md#p001-b007), [p001-b008](tab-core/reading/sdd-a3f0962080bdc590.md#p001-b008), [p001-b010](tab-core/reading/sdd-a3f0962080bdc590.md#p001-b010), [p001-b011](tab-core/reading/sdd-a3f0962080bdc590.md#p001-b011), [p003-b004](tab-core/reading/sdd-a3f0962080bdc590.md#p003-b004), [p005-b007](tab-core/reading/sdd-a3f0962080bdc590.md#p005-b007); all 7 anchors in the register.

<a id="trav3pl-p02"></a>
### Customer segregation and historical context

The document describes DLA as the single customer at its date, reports a contract-driven physical segregation requirement for another operation, and says additional 3PL operations were not envisioned in the near future.

Qualification: This is a dated statement in the design, not a current customer census, legal interpretation or verified physical layout.

Source: [p003-b005](tab-core/reading/sdd-a3f0962080bdc590.md#p003-b005).

<a id="trav3pl-p03"></a>
### Company, item and zone design

Each new 3PL customer is assigned a Company, also carried by Item Master. SKU uniqueness across companies is a TAB operational choice motivated by VoCollect; it is explicitly not a SCALE limitation. Storage templates depend on item characteristics; dimensions, weight and Treat as Loose are maintained at UM level. New customer locating/allocation/work zones are recommended to separate inventory; permanent pick locations are optional.

Qualification: Customer-specific setup is conditional on onboarding; no such setup was inspected or changed.

Source: [p005-b004](tab-core/reading/sdd-a3f0962080bdc590.md#p005-b004).

<a id="trav3pl-p04"></a>
### Optional lot tracking

Lot tracking can be enabled at Item Master when a customer requires it. The document calls for TAB evaluation and SOP changes across receiving, picking, replenishment, counts, inventory management, packing and outbound QC.

Qualification: Optional capability does not establish existing lot-tracked operations.

Source: [p005-b004](tab-core/reading/sdd-a3f0962080bdc590.md#p005-b004), [p005-b005](tab-core/reading/sdd-a3f0962080bdc590.md#p005-b005), [p005-b006](tab-core/reading/sdd-a3f0962080bdc590.md#p005-b006), [p005-b007](tab-core/reading/sdd-a3f0962080bdc590.md#p005-b007).

<a id="trav3pl-p05"></a>
### Warehouse Mobile testing plans

The addendum plans tests of Warehouse Mobile Blind Receiving, Shipping Container QC and Status Change on version 24.7.2575, which it says were unavailable at the original design date.

Qualification: Will test is not a passed test, current installed-version evidence or closure of the six owner-deferred mobile contracts.

Source: [p005-b007](tab-core/reading/sdd-a3f0962080bdc590.md#p005-b007).

<a id="trav3pl-p06"></a>
### Download architecture

Item Master, Receipt and Shipment downloads use XML. Boomi translates customer formats and places downloads in one Azure Storage input folder, /ils/Interface/Input. Interface execution may be manual or scheduled; failure alerts are configurable.

Qualification: The path is documentary architecture; no connection, schedule, mapping or alert activation was verified.

Source: [p007-b004](tab-core/reading/sdd-a3f0962080bdc590.md#p007-b004), [p007-b007](tab-core/reading/sdd-a3f0962080bdc590.md#p007-b007).

<a id="trav3pl-p07"></a>
### Item Master interface

Host-maintained item information includes Company and item/UM details. Middleware sends creates/changes, with Item XML Download enabled in Interface Process.

Qualification: This defines the 3PL interface design; it does not prove completion of the original SDD future Item Master interface.

Source: [p008-b004](tab-core/reading/sdd-a3f0962080bdc590.md#p008-b004), [p008-b005](tab-core/reading/sdd-a3f0962080bdc590.md#p008-b005), [p008-b006](tab-core/reading/sdd-a3f0962080bdc590.md#p008-b006).

<a id="trav3pl-p08"></a>
### Receipt downloads and blind returns

Receipts arrive in advance with Company at header, and header/detail information. Customer-supplied container information may optionally be interfaced. Unexpected returns may use blind receiving subject to prior customer agreement.

Qualification: Optional container download extends the original SDD exclusion. No PO dependency is introduced.

Source: [p008-b006](tab-core/reading/sdd-a3f0962080bdc590.md#p008-b006), [p009-b003](tab-core/reading/sdd-a3f0962080bdc590.md#p009-b003), [p009-b004](tab-core/reading/sdd-a3f0962080bdc590.md#p009-b004).

<a id="trav3pl-p09"></a>
### Shipment downloads

Shipment header includes Company, with detail records and optional header/detail comments. Host updates/deletes are permitted before waving. Shipping Container records are not downloaded.

Qualification: Header Company must reach the detail-level rule criteria discussed later; propagation/mapping behavior is not demonstrated.

Source: [p009-b005](tab-core/reading/sdd-a3f0962080bdc590.md#p009-b005), [p009-b006](tab-core/reading/sdd-a3f0962080bdc590.md#p009-b006).

<a id="trav3pl-p10"></a>
### Customer-specific upload routing

Receipt Confirmation, Shipment Confirmation, Inventory Transactions and Item Balance are XML outputs. Each customer needs Company-filtered upload criteria and an Interface Process Detail selecting an exclusive output folder; Boomi converts each folder for the destination host.

Qualification: Company-specific routing is a design requirement, not verified isolation. Screenshots are examples, not approved customer identifiers or priorities.

Source: [p010-b004](tab-core/reading/sdd-a3f0962080bdc590.md#p010-b004), [p011-b003](tab-core/reading/sdd-a3f0962080bdc590.md#p011-b003), [p011-b004](tab-core/reading/sdd-a3f0962080bdc590.md#p011-b004), [p011-b007](tab-core/reading/sdd-a3f0962080bdc590.md#p011-b007), [p012-b003](tab-core/reading/sdd-a3f0962080bdc590.md#p012-b003), [p013-b004](tab-core/reading/sdd-a3f0962080bdc590.md#p013-b004); all 10 anchors in the register.

<a id="trav3pl-p11"></a>
### Receipt and shipment upload triggers

The receipt design repeats container-level upload at In Putaway and describes header/detail/container payload information. Shipments upload after Shipping Load confirmation only at Closed status 900.

Qualification: Receipt prose also references receipt trailing status or manual closure; the original appendix adds closure/header wording. Keep exact trigger interaction unresolved until separately verified.

Source: [p010-b004](tab-core/reading/sdd-a3f0962080bdc590.md#p010-b004), [p011-b005](tab-core/reading/sdd-a3f0962080bdc590.md#p011-b005).

<a id="trav3pl-p12"></a>
### Inventory and balance uploads

Inventory movements, adjustments and status changes are eligible for transaction upload. Clearing Include in interface uploads on an Adjustment Type excludes those transactions. Item Balance reports item/status on-hand quantities on demand or by schedule.

Qualification: Eligibility is not evidence that every transaction is uploaded. Filters, exclusions and schedules remain configuration-dependent.

Source: [p012-b004](tab-core/reading/sdd-a3f0962080bdc590.md#p012-b004), [p014-b003](tab-core/reading/sdd-a3f0962080bdc590.md#p014-b003).

<a id="trav3pl-p13"></a>
### Company-based locating configuration

Location Selection chooses eligible zones/UMs; Locating Rule combines selections and strategies. Locating Rule Assignment Criteria filters Company at receipt detail; Locating Rule Assignment joins the criteria and rule for check-in.

Qualification: Receipt download carries Company at header, while criteria use receipt detail. Verify this mapping before operational use; the source does not demonstrate it.

Source: [p015-b005](tab-core/reading/sdd-a3f0962080bdc590.md#p015-b005), [p015-b007](tab-core/reading/sdd-a3f0962080bdc590.md#p015-b007), [p016-b003](tab-core/reading/sdd-a3f0962080bdc590.md#p016-b003), [p016-b004](tab-core/reading/sdd-a3f0962080bdc590.md#p016-b004), [p016-b005](tab-core/reading/sdd-a3f0962080bdc590.md#p016-b005).

<a id="trav3pl-p14"></a>
### Replenishment and counts by customer

Replenishment allocation rules use customer zones. Cycle Count Master and Quick Plan may filter by zones and/or Company. Count frequency and configuration are customer-contract dependent.

Qualification: The addendum does not replace every historical replenishment/count setting with one universal 3PL value.

Source: [p017-b004](tab-core/reading/sdd-a3f0962080bdc590.md#p017-b004), [p017-b005](tab-core/reading/sdd-a3f0962080bdc590.md#p017-b005).

<a id="trav3pl-p15"></a>
### Company-based allocation and wave order

Allocation Location Selection restricts inventory; Allocation Rule combines selections and strategies. Assignment Criteria filters Company at shipment detail; Assignment connects it to the rule. The Rule Assignment wave step must run before Allocation.

Qualification: The diagram caption says Locating configuration under Allocation; its boxes and section concern Allocation. This does not recover missing original complete wave sequences.

Source: [p018-b005](tab-core/reading/sdd-a3f0962080bdc590.md#p018-b005), [p018-b006](tab-core/reading/sdd-a3f0962080bdc590.md#p018-b006), [p018-b007](tab-core/reading/sdd-a3f0962080bdc590.md#p018-b007), [p019-b003](tab-core/reading/sdd-a3f0962080bdc590.md#p019-b003), [p019-b004](tab-core/reading/sdd-a3f0962080bdc590.md#p019-b004), [p019-b005](tab-core/reading/sdd-a3f0962080bdc590.md#p019-b005); all 8 anchors in the register.

<a id="trav3pl-p16"></a>
### Wave reuse, priority and picking zones

Existing Wave Flows and Wave Masters may be reused when steps are not company-specific. Customer requirements may need new or modified Override Data Wave Steps. TAB needs a work-priority SOP; Work Profile Work Zone can restrict workers to areas while existing Work Types are mostly reused.

Qualification: Reuse is conditional. No effective priority policy, ODWS implementation or worker assignment is established.

Source: [p005-b004](tab-core/reading/sdd-a3f0962080bdc590.md#p005-b004), [p020-b006](tab-core/reading/sdd-a3f0962080bdc590.md#p020-b006), [p020-b007](tab-core/reading/sdd-a3f0962080bdc590.md#p020-b007), [p020-b008](tab-core/reading/sdd-a3f0962080bdc590.md#p020-b008).

<a id="trav3pl-p17"></a>
### Customer VAS and outbound QC

Company-filtered VAS Activity Criteria can select customer containers. VAS Assignment follows Container Creation and evaluates all active criteria. VAS assignment requires containers created in Wave; automatic QC assignment likewise requires wave-created containers, with customer-specific QC criteria/assignment available.

Qualification: Preserve the automatic qualifier for QC. The excerpt does not remove the original manual supervisor QC path or establish runtime configuration.

Source: [p020-b008](tab-core/reading/sdd-a3f0962080bdc590.md#p020-b008), [p021-b004](tab-core/reading/sdd-a3f0962080bdc590.md#p021-b004), [p021-b005](tab-core/reading/sdd-a3f0962080bdc590.md#p021-b005).
