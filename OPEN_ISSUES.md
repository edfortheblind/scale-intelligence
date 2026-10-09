# Open issues and owner decisions

Updated **October 9, 2026**. This is the current owner-review register. It supersedes older next-step instructions where they conflict with the closures below. Historical observations, source files and evaluation denominators remain unchanged. An item here is a request for a scope decision or evidence, not authorization to run warehouse operations or change configuration.

Edit **Owner decision** and **Follow-up / notes** under an issue, or reference its ID in a reply. A recommendation is not an approved decision. Related issues share evidence and must not be added together as separate completion percentages.

## Closed by owner instruction

| Section | Current disposition | Retained evidence and limits |
| --- | --- | --- |
| Mobile initial task entries | **CLOSED — accepted as delivered.** | Historical entry sampling remains **15/16**; all 16 menu choices have a disposition. Work Execution was not entered because startup can assign work. No additional entry, repair or operational acceptance is pending under this task. The six separate procedure-source gaps remain in OI-05. |
| Historical runtime identification | **COMPLETED — agent-authored identity/runtime documentation delivered.** | [Historical runtime register](DB%20Architecture/HISTORICAL_RUNTIME_IDENTITIES.md) documents **163/163 IDs**, their retained activity and evidence. **154** have captured catalog names/types; **nine** have explicit unknown-identity dispositions. The nine names are not invented and are no longer an open recovery assignment. This closes historical documentation, not current deployment or process timing. |
| Performance Management | **CLOSED — SCI will no longer be used.** | Historical landing coverage remains **3/4**. SCI form 2669 / screen 75 returned an error during the dated inspection; no retry, diagnosis, repair or SCI acceptance is pending. The other three landing observations remain accepted. Do not reopen this section through the broader screen checklist. |

Previously accepted/closed work also stays closed: AIM and SDK completion dispositions, the approved custom-table exclusion, the installed replacement-LPN disposition, accepted display/JAWS observations, completed source/extraction packages, the Stage Monitor **4/4** requested chart chain, and delivered C34–C44 programming/search/navigation work. Those acceptances do not imply full product, runtime or intended-user acceptance. Source limitations specifically listed below remain qualified.

## Review index

| ID | Section / decision | Current measure | State |
| --- | --- | --- | --- |
| [OI-01](#oi-01-receiving-database-dependencies) | Receiving database dependencies | 24/30 exact catalog matches; six unmatched names | Follow-up needed |
| [OI-02](#oi-02-full-applicable-screen-criteria) | Full applicable screen criteria | 0/211 complete checklists; 211/211 configuration visits | Scope decision |
| [OI-03](#oi-03-receiving-full-detailed-reviews) | Receiving full detailed reviews | 0/9 complete checklists; substantial partial coverage | Scope decision; subset of OI-02 |
| [OI-04](#oi-04-receiving-selected-record-contexts) | Receiving selected-record contexts | 4/6 observed; two PO types unobserved | Non-use / deferral decision; subset of OI-03 |
| [OI-05](#oi-05-mobile-workflow-source-gaps) | Mobile workflow source gaps | Six deferred procedure contracts | Use / source decision |
| [OI-06](#oi-06-article-retrieval) | Article retrieval | 677/723 top-eight; 46 misses | Quality / priority decision |
| [OI-07](#oi-07-guide-section-retrieval) | Guide section retrieval | 15/24 exact anchors; nine misses | Quality / priority decision |
| [OI-08](#oi-08-tab-design-questions-and-source-limits) | TAB design questions and source limits | 69 claims / 12 reconciled answers reviewed | Specific source / adoption decisions |
| [OI-09](#oi-09-five-unlicensed-labor-routes) | Five unlicensed Labor routes | Five recorded availability limits | Applicability decision |
| [OI-10](#oi-10-receipt-monitor-environment-equivalence) | Receipt Monitor environment equivalence | Stage 4/4 complete; Production 0/4 observed | Optional new scope decision |
| [OI-11](#oi-11-deployment-and-whole-process-timing) | Deployment and whole-process timing | 0/34 | Frozen; separate authorization required |
| [OI-12](#oi-12-wider-knowledge-and-user-acceptance) | Wider knowledge and user acceptance | No complete whole-product denominator | Future priority / acceptance scope |
| [OI-13](#oi-13-hosted-help-application) | Hosted help application | Local delivery; no hosted acceptance | Future scope, not a current delivery blocker |

## OI-01 Receiving database dependencies

**What is complete.** All 30 unique configured database-facing names were assessed against the retained catalog. **24/30** match exactly: 22 modules have existing static contracts and two are tables. This measures name matching, not whether Receiving works. The SQL snapshot is September 29, 2026; the UI configuration capture is October 2. An unmatched name could be an application model, alias, newer object or another binding mechanism; none of those explanations is established yet.

| Exact unmatched `FORM.TABLE_NAME` value | Form / screen | Follow-up |
| --- | --- | --- |
| `METADATA_RECEIPT_INSIGHT_VIEW` | Receipt Line Insight **2780 / 1783** | Identify the effective data source. Grid control **51927**, attribute **41051**, instead names matched `METADATA_INSIGHT_RECEIPT_LINE_VIEW`. The grid match does not resolve the Form value. |
| `PurchaseOrderDetailView` | Purchase Order Line detail **4051 / 1665** | Identify its model/object definition, or accept technical follow-up as unnecessary for TAB PO non-use. |
| `PurchaseOrderHeaderView` | Purchase Order detail **4049 / 1423** | Same PO non-use choice, separately recorded for this name. |
| `ReceiptContainerView` | Receipt Container detail **3005 / 1666** | Identify the resolved application model or SQL object and mapping. |
| `ReceiptDetail` | Receipt Line detail **3035 / 1427** | Identify the resolved application model or SQL object and mapping. |
| `ReceiptHeaderView` | Receipt detail **3034 / 1428** | Identify the resolved application model or SQL object and mapping. |

**Why it matters.** The documentation cannot yet trace these Form bindings to a proven definition. An exact name match alone would still not prove the effective runtime query, permissions or operational outcome. No configuration repair is justified by this mismatch alone.

**C46 retained-source follow-up (October 9).** A bounded search of active retained SDK, AIM, Snapdragon and database text resolved **0/6** bindings; **24/30** remains unchanged. `ReceiptDetail` also names an XML type in the SDK's `ReceivingDownload.xsd`, appears in AIM interface XML-path guidance and is a local alias for `RECEIPT_DETAIL` in three captured routines. None connects Form 3035 to that definition. The other five names supplied no resolving retained definition. These are search findings within the recorded text scope, not proof that installed models are absent. [Source distinctions and limits](_project/CONTINUATION_C46.md#receiving-binding-follow-up), [exact evidence receipt](_project/receiving-binding-search-c46-20261009.json).

**Suggested follow-up to the SCALE administrator/developer:** “For each exact name above, identify what it resolves to in the installed environment/build: SQL object, application model, alias or obsolete metadata. Supply a dated, read-only definition/mapping or catalog result with the exact schema/name and environment. For Form 2780, explain which binding is effective and why the Form and grid names differ.” A sanitized definition or narrow export is sufficient; credentials and business rows are not needed.

**Decision choices:** (A) Follow up on all six; (B) accept PO non-use for the two PO detail bindings and investigate the other four; (C) accept all six as documented limitations. **Recommendation:** B, subject to the owner's PO applicability decision in OI-04.

**Owner decision:** Pending.
**Follow-up / notes:**

Evidence: [backend assessment](Snapdragon/receiving/BACKEND_BINDINGS.md), [exact bindings](Snapdragon/receiving/backend-bindings.json), [Form configuration map](Snapdragon/receiving/CONFIGURATION.md).

## OI-02 Full applicable screen criteria

**What the measure means.** The retained inventory contains **254 screen dossiers**, including **211 active forms** and 43 inactive records. Configuration visits are **211/211**. **0/211** means no dossier has all ten applicable detailed-review dimensions closed; it does not mean 211 screens were never inspected. The 917 underlying FORM rows are not 917 navigable screens.

The [full checklist](Snapdragon/reference/COVERAGE_CRITERIA.md) requires: identity/availability; navigation; purpose/prerequisites; search/criteria; list behavior; selected-record details; actions and enablement; configuration; data dependencies; and dated evidence/limits. Each dimension needs evidence or a reasoned not-applicable disposition. Loading a page or extracting a configuration tree covers only part of this work.

**Remaining scope by section:**

| Section | Delivered baseline | Decision still needed |
| --- | --- | --- |
| Receiving | Nine roots; see OI-03 and OI-04 | Which remaining branches matter for TAB? |
| Order Planning and Shipping | Menu landing and structural/configuration evidence | Conditional/custom-screen behavior, criteria, details and action semantics to retain in scope. |
| Inventory and Work | Menu landing and structural/configuration evidence | Criteria, contextual entry, dependencies and conditional behavior to retain in scope. |
| Cross Application and System Management | Menu landing and structural/configuration evidence | Remaining applicable details and diagnostics; no automatic expansion into closed Performance Management. |
| Non-menu/contextual records | Inventory includes 28 record-detail templates, 36 contextual transactions and 21 TPM records | Identify needed parent/record/role contexts before claiming a separate review. These category counts are not a new additive denominator. |

**Related collection limits.** The dependency pass retained **2,306 of 2,351 candidate configuration values**. The 45 omissions are 13 empty/null API paths, 29 paths outside the strict collection grammar and three database identifiers outside that grammar. Row IDs, hashes, lengths and reasons remain available; rejected payloads were not retained. These are not 45 proven missing services. Existing control/API/security bindings describe configuration references, not effective permissions or action outcomes. Review specific affected controls only if they matter to an approved screen scope; do not loosen collection rules solely to improve counts.

**Decision choices:** (A) Accept the delivered documentary baseline and close broad exhaustive review with explicit exclusions; (B) name a prioritized set of TAB-used screens and remaining branches; (C) retain the complete applicable checklist backlog. **Recommendation:** B. Specify screens/IDs, environment, role, needed branch and acceptance evidence. Source/configuration explanation can be sufficient where an action would mutate warehouse data.

The owner-closed Mobile initial-entry and Performance Management sections remain closed. Preserve historical **0/211**; the new closures do not turn it into 1/211 or 0/210. Any future working denominator must be explicitly defined and kept separate.

**Owner decision:** Pending.
**Priority screens / exclusions / acceptance criteria:**

Evidence: [criteria](Snapdragon/reference/COVERAGE_CRITERIA.md), [coverage](Snapdragon/inventory/coverage.json), [roadmap](Snapdragon/ROADMAP.md), [task inventory](Snapdragon/inventory/tasks.json), [dependency assessment](Snapdragon/database/DEPENDENCIES.md), [omission rules](Snapdragon/database/SAFE_DEPENDENCY_TOKENS.md).

## OI-03 Receiving full detailed reviews

**What is complete.** Partial coverage includes **9/9** roots, **6/6** advanced-field catalogs, **4/6** selected-record types, **3/3** receipt detail forms, **2/2** Putaway open/closed states, **2/2** calendar modes, **1/1** Workbench receipt context and the subsequently completed **4/4** alternate-Stage Monitor chain. None yet satisfies the entire detailed checklist, so the retained full-review measure is **0/9**. These overlapping measures must not be summed.

| Receiving root / Form ID | Specific remaining context for a decision |
| --- | --- |
| Purchase Order Insight **2796** | Selected PO detail, selected-row action transitions and PO-to-Lines relationship were not observed. TAB PO non-use may justify closure; see OI-04. |
| Purchase Order Line Insight **2797** | Selected-line detail and action transitions were not observed; same non-use decision. |
| Putaway Group Insight **2791** | Open/closed states were observed. Simultaneous multi-selection was not established; Ctrl/Shift attempts left one row selected. |
| Receipt Insight **2777** | Additional statuses, role/permission combinations and conditional actions beyond sampled records. |
| Receipt Line Insight **2780** | Additional item/quantity conditions, action-service semantics and the Form/grid binding discrepancy in OI-01. |
| Receipt Container Insight **2779** | Populated serial-number panel and conditional variants; the sampled serial panel was empty. |
| Appointment Calendar **4069** | Existing appointment event preview/detail; reviewed date ranges contained no event. Both calendar modes were inspected. |
| Receipt Monitoring **4106** | Requested Stage chart-depth inspection is complete. Original-context error and Production equivalence are separate OI-10 choices, not reasons to reopen that completed measure. |
| Receipt Workbench **4038** | Conditional check-in/locating prompts, validation and unsampled lookup branches. The Arrow loaded an existing receipt successfully; earlier magnifier nonresponse is a historical observation. |

**Configuration interpretation limit.** All **69/69** enablement bindings were structurally extracted: 51 predicates and 18 multiselect flags. **36/51** predicates contain unresolved bare symbols; the other 15 typed-literal predicates still lack evaluator/field-type proof. This limits explanation of when actions enable; it is not a confirmed application defect. Additional linked forms/record contexts, including target Form 166 with no active implementation in the captured map, need an explicit applicability decision if selected for review.

**Decision choices:** (A) Accept this documentary baseline with listed limits; (B) select only needed TAB branches from the table; (C) retain all nine for exhaustive checklist completion. **Recommendation:** B, treating the PO branches through OI-04 and requesting legitimate existing records only where necessary. No receipt creation, check-in, locating, closing, printing or work assignment follows from this register.

**Owner decision:** Pending.
**Selected roots / branches / evidence needed:**

Evidence: [Stage report](Snapdragon/receiving/STAGE_SESSION_REPORT.md), [focused continuation](Snapdragon/receiving/FOCUSED_SESSION_REPORT.md), [enablement analysis](Snapdragon/receiving/ENABLEMENT.md), [configuration graph](Snapdragon/receiving/CONFIGURATION.md).

## OI-04 Receiving selected-record contexts

**Observed:** Putaway Group, Receipt, Receipt Line and Receipt Container. **Unobserved:** Purchase Order Insight 2796 and Purchase Order Line Insight 2797. Coverage remains **4/6**.

On October 8, eight valid Production inquiries covered both offered warehouses with Include Closed off/on; all returned zero rows. Earlier authentication failures are separate dated attempts. The owner stated **“Travis doesn't use PO.”** This supports a non-use disposition; it does not establish database-wide absence. There is no outstanding automatic PO search, fake-record task or sign-in handoff.

**Decision choices:** (A) Close the two selected-record types for TAB non-use while retaining 4/6 as observed evidence; (B) leave them deferred; (C) request a separately bounded demonstration using a legitimate existing populated PO context. **Recommendation:** A. The current instruction requested decision context, so this register has not applied that additional closure automatically.

**Owner decision:** Pending.
**Follow-up / notes:**

Evidence: [focused report](Snapdragon/receiving/FOCUSED_SESSION_REPORT.md), [dated Production inquiry receipt](Snapdragon/evidence/selected-context-production-20261008.json).

## OI-05 Mobile workflow source gaps

These **six deferred procedure contracts** are distinct from the now-closed initial task entries. All 45 retained base-flow identities are mapped, but mapping is not a complete procedure or workflow acceptance. Existing legacy RF steps do not establish a missing Warehouse Mobile sequence.

| SRC | Missing source/context | Follow-up and decision |
| --- | --- | --- |
| **230** — adjustment by item/location | Positive steps exist; negative sequence, quantity-sign convention and complete error/authorization behavior are absent. | Confirm whether TAB needs negative adjustments. Obtain the matching mobile procedure, accept non-use, or retain deferral. |
| **280** — adjustment by LP | Negative adjustment sequence and LP/item/quantity context are incomplete. | Same decision, specifically for the LP flow. |
| **340** — Nest | Generic registry label does not establish the installed menu path/context or a complete sequence. | Identify Menu option name, Parent and SRC association; then decide whether its procedure is required. |
| **350** — Blind Receiving | No complete mobile header/detail prompt sequence, required-field set or completion/locating path. Older guidance does not establish the installed mobile contract; conflicting source identifiers remain qualified. | Confirm the used initiation mode/version and obtain the matching procedure/configuration explanation. |
| **360** — Remove | Generic label leaves installed context and the meaning of Remove unresolved. | Identify the menu association and what is removed before requesting the exact sequence. |
| **400** — Warehouse Transfer by LP | Identity is known; distinct prompts, validation, cancellation and completion sequence are missing. | Confirm use and obtain the LP warehouse-transfer procedure. Ordinary LP transfer or SRC390 is not a proven substitute. |

For SRC340/360 the documented lookup is **System Management → Activity Architect → Configure Menu → Search → select result → compare Menu option name, Parent and SRC identifier**. That lookup has not been performed. Form Id can identify a parent without an SRC of its own. A matching written SOP or authorized configuration export, including version and custom overlays if relevant, can supply evidence without running the warehouse workflow.

**Decision choices:** per SRC, close for non-use, keep deferred, or prioritize with an authoritative source/menu mapping. **Recommendation:** decide which six are actually used before commissioning new documentation. Existing deferral remains in force until a decision is recorded.

**Owner decision per SRC:** 230: Pending; 280: Pending; 340: Pending; 350: Pending; 360: Pending; 400: Pending.
**Source owner / follow-up / notes:**

Evidence: [source catalog](SDD/RF/WAREHOUSE_MOBILE_SOURCE_CATALOG.md), [inventory/receiving procedures](SDD/RF/WAREHOUSE_MOBILE_INVENTORY_RECEIVING_FLOWS.md), [C27 evidence limits](_project/CONTINUATION_C27.md).

## OI-06 Article retrieval

The retained **723-case** evaluation finds the expected article in the first eight for **677/723 (93.64%)**, first for **433/723 (59.89%)**, and misses it for **46/723**. All 723 selected-topic presentation contracts pass, but that is a different measure from discovering the article through a free-text question. No automated semantic-answer or user-acceptance claim follows.

The [exact 46 cases below](#appendix-a-46-article-retrieval-misses) make this reviewable. Some short questions need more context; a miss is not by itself proof of an incorrect explanation. Recent navigation improvements do not recover these rankings. Previously rejected ranking probes should not be repeated without a new basis.

**Decision choices:** accept the present retrieval baseline; prioritize named missed cases/topics; or authorize a separately evaluated retrieval design. **Recommendation:** prioritize operationally important cases and define the intended user question/context. Keep original questions, expected IDs, source contents and denominators fixed when measuring improvements; do not rewrite the benchmark to raise the score.

**Owner decision:** Pending.
**Priority case IDs / acceptable behavior:**

Evidence: [complete evaluation](help_app/evaluation.json), [C38 ranking correction](_project/CONTINUATION_C38.md), [C39 scoped lookup and limits](_project/CONTINUATION_C39.md).

## OI-07 Guide section retrieval

The retained guide probe finds the intended guide within six results for **24/24**, but the exact expected section anchor for only **15/24 (62.5%)**. The nine misses are listed in [Appendix B](#appendix-b-nine-guide-anchor-misses). Each already returns a child of the expected parent section; parent-context links help navigation but do not count as exact-anchor recovery. C44 return links also preserve this distinction.

**C46 presentation correction.** Ordinary results now identify **Section preview:** text and mark truncation, directing readers to the full section and its limits. This addresses clipped steps/qualifications without changing ranking: **24/24** guides and **15/24** exact anchors remain unchanged. It does not settle the pending section-ranking decision or the source conflicts. [Correction and verification](_project/CONTINUATION_C46.md).

**Decision choices:** accept child-section plus parent navigation; prioritize particular cases; or authorize a bounded section-ranking change with no new losses. **Recommendation:** review whether the returned child section answers each practical need before deciding that all nine require ranking changes.

**Owner decision:** Pending.
**Priority cases / acceptance rule:**

Evidence: [24-case receipt](_project/guide-navigation-c26.json), [parent-context limits](_project/CONTINUATION_C27.md), [current return navigation](_project/CONTINUATION_C44.md).

## OI-08 TAB design questions and source limits

The official source reconciliation is complete at **69 reviewed claims and 12 reconciled answers**. It retains unresolved design details rather than choosing undocumented settings. The 2022 Travis design is the base; the 2025 TRAV3PL addendum applies only to its explicit additions/changes. Neither proves current implementation.

| Review topic / evidence identifier | Unresolved decision or evidence needed |
| --- | --- |
| Receipt confirmation upload — **R06** | Exact interaction of container In Putaway, receipt/header status, manual close, zero-received and appendix closure wording. Obtain the adopted trigger/configuration explanation if needed operationally. |
| Company propagation — **R07** | Header Company is required, while locating/allocation criteria read detail. Obtain the actual mapping/propagation rule before asserting automatic inheritance. |
| Wave sequence/reuse — **R08** | Relative ordering is documented; a complete sequence/export and company-specific reuse conditions are not established. |
| Extensions and design decisions — **R10** | EX-XX for 1348 printing is unidentified; Pack Size communication, Load Building, allocation sequences/zones, LTL label/BOL migration and full ODWS inventory remain qualified. EX01's documentary Approved label does not establish deployment. |
| Receipt LPN/labels — **TRAVIS-I11** | Source comments leave manual LPN/no SCALE receipt label versus system-generated/next-up labels undecided. Confirm the adopted policy; do not reopen the separately closed replacement-LPN review. |
| Conveyor/WCS — **TRAVIS-I15** | Retained comment leaves WCS access to SCALE table information open under Active SCALE restrictions. Request the adopted access/integration design if still used. |
| Override/activity counts — **TRAVIS-I16** and related short-pick guidance | Source says both not currently used and Yes for putaway-override count creation; comments question actual usage. Confirm the intended policy rather than selecting one conflicting statement as effective. |
| Replenishment work default — **TRAVIS-TO26** | Override work type remains TBD. Dated 2000/10/720 defaults are not verified installed settings. |
| Company/item Mobile limitations and 3PL applicability ? **TRAVIS-I21** | The retained Mobile Add limitation concerns an unexpected item with Company assigned in Item Master; the later promised addition is not verified availability. Confirm whether the addendum's company/item behavior and planned mobile scenarios apply to TAB's intended scope; planned tests are not observed completion. |
| Interface paths and installed values | Source path patterns are templates. Installed paths, jobs and effective values belong to OI-11 if runtime confirmation is required. |
| Document anomalies — **R11** | Blank sign-offs, placeholders, retained comments, the Aaron's VAS item-list name and the Allocation/Locating caption inconsistency need an owner interpretation or corrected authoritative source only if they affect an intended decision. |
| TAB Word physical layout | All **1,667 extracted nodes**, 22 PDF pages and 46 embedded assets were reviewed. The Word document's physical page layout was not rendered; stored page metadata is not a page-by-page visual review. Decide whether that additional layout check is needed. Previously completed visual reviews of other source packages remain closed. |

**Decision choices:** retain the explicit qualifications; identify adopted policies for specific rows; or obtain corrected source/configuration evidence. **Recommendation:** prioritize receipt upload, Company propagation and any used custom integration; accept purely editorial limitations unless they obstruct a decision. No general re-review of all 69 claims is proposed.

**Owner decision:** Pending.
**Selected topics / adopted policy / source owner:**

Evidence: [TAB design reference](SDD/TAB_DESIGN_REFERENCE.md), [claim and reconciliation records](SDD/tab-core/reconciliation.json), [source coverage](SDD/tab-core/text-review-coverage.json).

## OI-09 Five unlicensed Labor routes

The recorded result for **Labor Activity Insight 3050, Labor Monitoring 3051, Employee Scorecard 4097, Employee Timeline 4121 and Intraday Labor Progress 4124** was **“not licensed.”** This is an availability observation, not a diagnosis of permissions or a request to purchase/enable a license.

These routes are presented separately so the owner can explicitly decide whether the Performance Management closure also disposes of them. No new Labor review is automatically scheduled.

**Decision choices:** close for non-use; retain the documented availability limit; or include named routes in a future licensed, authorized review. **Recommendation:** close for non-use if Labor is outside TAB's intended scope.

**Owner decision:** Pending.
**Applicable routes / follow-up:**

Evidence: [navigation observations](Snapdragon/NAVIGATION.md), [task inventory](Snapdragon/inventory/tasks.json).

## OI-10 Receipt Monitor environment equivalence

The requested alternate-Stage chart chain is **4/4 complete**: Date → Receipt ID Type → Vendor → PO. The original Stage-context chart error was not diagnosed or repaired. Production remains **0/4 observed** from a dated expired-token attempt; that does not establish current unavailability or a product failure. Stage observations do not prove Production equivalence, replica freshness or behavior under other roles/warehouses.

**Decision choices:** accept the completed Stage scope with these limits; defer Production equivalence to OI-11; or request a new, bounded read-only Production comparison. **Recommendation:** accept the completed scope unless a specific Production decision requires parity evidence.

**Owner decision:** Pending.
**Required environment / role / comparison, if any:**

Evidence: [focused Monitor report](Snapdragon/receiving/FOCUSED_SESSION_REPORT.md), [Stage observations](Snapdragon/receiving/STAGE_SESSION_REPORT.md).

## OI-11 Deployment and whole-process timing

**FROZEN — 0/34.** All 34 process documents are present, but application/service/job/report/label deployment mapping and correlated whole-process timing have not been accepted. The owner-closed historical runtime register is a separate completed documentation package. Its statement aggregates do not provide end-to-end timing or current deployment identity.

The September 29 programming/catalog snapshot is not live-schema parity. Previously reviewed unresolved references/dynamic candidates remain documented dispositions, not new unfinished static reviews. Resolving active external callers, installed job/service bindings, environment/role differences or current timings requires separate operational evidence and scope.

**Decision choices:** keep frozen; close the future requirement as unnecessary; or explicitly authorize a named process/environment and read-only evidence plan. **Recommendation:** keep frozen until a concrete operational question justifies it. There is no automatic database refresh, runtime capture or deployment action.

**Owner decision:** Frozen pending separate instruction.
**Future process / environment / evidence objective:**

Evidence: [database plan](DB%20Architecture/PLAN.md), [runtime interpretation](DB%20Architecture/RUNTIME.md), [completed historical register](DB%20Architecture/HISTORICAL_RUNTIME_IDENTITIES.md), [project status](PROJECT_STATUS.md).

## OI-12 Wider knowledge and user acceptance

The help corpus has **340 reviewed articles**; the central functionality reference contains **86 entries across 14 chapters**. These are inventories, not proof of complete SCALE knowledge. Unseen questions, whole-product semantic coverage, current installed behavior and broader intended-user/workflow acceptance have no complete agreed denominator. Existing automated/source checks and accepted bounded display/JAWS observations retain their own scope.

**Decision choices:** accept the current library for its documented use; prioritize named missing topics/questions; or define a separate intended-user evaluation with representative tasks and acceptance criteria. **Recommendation:** collect specific TAB questions and intended decisions before expanding the corpus or acceptance program. Preserve already accepted work.

**Owner decision:** Pending.
**Missing topics / intended users / acceptance evidence:**

Evidence: [library overview](README.md), [functionality reference](SDD/SCALE_FUNCTIONAL_REFERENCE.md), [article evaluation limits](help_app/evaluation.json), [current project status](PROJECT_STATUS.md).

## OI-13 Hosted help application

The current help application is delivered locally. Shared hosting, authentication, multiuser operations and deployment acceptance are future scope choices, not prerequisites to completing this documentation handoff. Repository publication and Git parity do not establish a hosted service or OneDrive synchronization.

**Decision choices:** retain local use; defer hosted delivery; or request a separate hosting requirements/design task. **Recommendation:** defer until intended audience, access controls, host ownership and support expectations are defined.

**Owner decision:** Future scope; not authorized by this register.
**Audience / host owner / support needs:**

Evidence: [application instructions](help_app/README.md), [project delivery status](PROJECT_STATUS.md).

## Appendix A: 46 article retrieval misses

Exact questions and expected topics copied from the retained evaluation. These cases are a fixed measurement, not a new claim of semantic failure.

| Case ID | Exact question | Expected topic |
| --- | --- | --- |
| shipment-detail:2 | Does the routine return five result sets? | shipment-detail |
| inventory-adjustment:2 | Does an error guarantee all earlier changes are rolled back? | inventory-adjustment |
| work-monitor-drilldown:2 | Can two identical warehouse filters prove the same result? | work-monitor-drilldown |
| work-monitor-indicators:1 | Does no row mean zero work? | work-monitor-indicators |
| work-inactive-history:2 | Is this always one atomic operation? | work-inactive-history |
| inventory-quantity-buckets:1 | Does reservation prove stock left? | inventory-quantity-buckets |
| inventory-empty-source:2 | Does archival prove commit? | inventory-empty-source |
| inventory-destination-units:1 | Does an attribute ID always survive? | inventory-destination-units |
| inventory-serial-linkage:1 | Does every operation use this check? | inventory-serial-linkage |
| ship-confirm-status-propagation:2 | Can the header status only advance? | ship-confirm-status-propagation |
| receipt-container-id-generation:1 | Can an arbitrary alphanumeric ID pass through unchanged? | receipt-container-id-generation |
| status-action-resolution:1 | Does NULL mean status zero? | status-action-resolution |
| awr-wave-statistics-gate:1 | Can return zero be treated as no changes? | awr-wave-statistics-gate |
| awr-wave-statistics-gate:2 | Are all steps serialized by this gate? | awr-wave-statistics-gate |
| awr-wave-dialog-selection:2 | Does active mean the worker is alive? | awr-wave-dialog-selection |
| awr-order-open-quantity:2 | Are NULL historical quantities treated as zero? | awr-order-open-quantity |
| awr-allocation-conversion:2 | Does the helper reserve more stock? | awr-allocation-conversion |
| awr-capacity-precedence:1 | Does no row return 0 and100 automatically? | awr-capacity-precedence |
| shipping-reprint-dif-request:1 | Does Ready prove the label printed? | shipping-reprint-dif-request |
| shipping-qc-context:3 | Are these settings confirmed for the current warehouse? | shipping-qc-context |
| shipping-container-numbering:2 | Does one failed shipment roll back the entire wave automatically? | shipping-container-numbering |
| shipping-freight-rollup:2 | Does this call a carrier to rate the shipment? | shipping-freight-rollup |
| shipping-freight-rollup:3 | Does it select only TREE_UNIT roots? | shipping-freight-rollup |
| interface-upload-batch-contract:1 | Does In Process prevent a second claimant? | interface-upload-batch-contract |
| interface-upload-batch-contract:3 | Will the serial helper skip records from a previous run? | interface-upload-batch-contract |
| interface-errors-and-retained-views:1 | Does UNION preserve every physical source row? | interface-errors-and-retained-views |
| fn-zone-authorization:2 | Does this check warehouse access? | fn-zone-authorization |
| fn-status-slots:2 | Is NULL same as default zero? | fn-status-slots |
| fn-available-quantity:1 | Are all no-match outputs0? | fn-available-quantity |
| fn-report-text:2 | Does text prove every value is present? | fn-report-text |
| fn-bol-expiration:1 | Does missing shipment always returnNULL? | fn-bol-expiration |
| fn-dashboard-kpis:2 | Are work date windows always a full local calendar day? | fn-dashboard-kpis |
| fn-dashboard-kpis:3 | Does percentage0 always mean no work processed? | fn-dashboard-kpis |
| view-retained-unions:3 | Do retained table references mean archive jobs ran during this review? | view-retained-unions |
| view-inventory-grain:1 | Do two serial rows necessarily mean two separate inventory balances? | view-inventory-grain |
| view-order-quantity-and-balance:1 | Is total ordered quantity net of allocation? | view-order-quantity-and-balance |
| view-document-file-name:2 | What can a missing selected separator cause? | view-document-file-name |
| dynamic-download-claims:2 | Does a successful first stage guarantee the full batch? | dynamic-download-claims |
| dynamic-configured-filters:2 | Does receipt selection prove upload delivered? | dynamic-configured-filters |
| dynamic-fixed-reporting:2 | Is its source the captured local shipment table? | dynamic-fixed-reporting |
| performance-inventory-diagnostics:2 | Should every returned item be automatically corrected or written off? | performance-inventory-diagnostics |
| operations-accessorial-selection:1 | Does a NULL stored override always remain NULL? | operations-accessorial-selection |
| operations-generic-dashboard:1 | Does every numeric-looking data type get summed? | operations-generic-dashboard |
| report-label-cycle-count:2 | Why might a cycle-count request appear more than once? | report-label-cycle-count |
| warehouse-export-field-fallback:1 | Does shipment-detail fallback use internal shipment number? | warehouse-export-field-fallback |
| close-container-model-boundary:2 | Can a missing container still produce display rows? | close-container-model-boundary |

## Appendix B: nine guide anchor misses

Exact questions and expected parent anchors copied from the retained 24-case guide probe. See OI-07 for the existing child-section and parent-navigation qualification.

| Case ID | Exact question | Expected anchor |
| --- | --- | --- |
| C25-RF-01 | How do I receive an item against a trailer when there is more than one receipt line? | [receiving-initiation](SDD/RF/WAREHOUSE_MOBILE_INVENTORY_RECEIVING_FLOWS.md#receiving-initiation) |
| C25-RF-02 | If I change a lot expiration date while transferring inventory, does it affect other locations? | [inventory-adjustments](SDD/RF/WAREHOUSE_MOBILE_INVENTORY_RECEIVING_FLOWS.md#inventory-adjustments) |
| C25-RF-03 | Does Skip during Nest During Check In undo the receipt I just checked in? | [receiving-checkin-variants](SDD/RF/WAREHOUSE_MOBILE_INVENTORY_RECEIVING_FLOWS.md#receiving-checkin-variants) |
| C25-RF-05 | How can I transfer inventory from a location that has inventory attributes? | [location-inquiry](SDD/RF/WAREHOUSE_MOBILE_INVENTORY_RECEIVING_FLOWS.md#location-inquiry) |
| C25-RF-06 | Where are the complete Warehouse Transfer by LP steps for SRC 400? | [warehouse-transfers](SDD/RF/WAREHOUSE_MOBILE_INVENTORY_RECEIVING_FLOWS.md#warehouse-transfers) |
| C25-RF-10 | Why is Partial Pick missing when quantity verification is enabled? | [quantity-exceptions](SDD/RF/WAREHOUSE_MOBILE_WORK_FLOWS.md#quantity-exceptions) |
| C25-RF-11 | During a short pick of serial-tracked stock, will I choose which serial numbers are removed? | [quantity-exceptions](SDD/RF/WAREHOUSE_MOBILE_WORK_FLOWS.md#quantity-exceptions) |
| C25-RF-15 | For Over Pick, must my quantity exceed the pick quantity or the on-hand quantity? | [quantity-exceptions](SDD/RF/WAREHOUSE_MOBILE_WORK_FLOWS.md#quantity-exceptions) |
| C25-RF-17 | Shipping container QC failed. What happens if I decline the rescan? | [shipping-container-qc](SDD/RF/WAREHOUSE_MOBILE_SHIPPING_SUPPORT_FLOWS.md#shipping-container-qc) |
