# SCALE Intelligence project status

Status date: 2026-09-29. Current direction: build an accessible, source-grounded SCALE knowledge base for fast help to novice users, including visually impaired users. The complete interactive intelligence application is not yet built.

Start the next session with [03_SCALE_INTELLIGENCE_MASTER_PROMPT.md](03_SCALE_INTELLIGENCE_MASTER_PROMPT.md). It directs continued functional review, runtime explanation, configuration guidance and SDD reconciliation. The future Insight screen register/navigation and functionality SOP task remains separate.

## Completion and evidence by workstream

| Workstream | Current evidence | Status / remaining work |
| --- | --- | --- |
| AIM acquisition | 2,446/2,453 known article originals: 99.71% | Owner-accepted complete with documented exceptions. No routine acquisition retry pending. |
| SDK acquisition | 363/380 known article originals: 95.53%; 691/734 required original resources retained | Owner-accepted complete with documented exceptions. Known inventory is a lower bound; missing/invalid source content stays visible. |
| Reusable corpus/search | 2,809 article JSONs and FTS5 search entries, preserved originals and reading copies | Existing reference foundation. Search remains qualified by its source gaps; no complete answer engine is claimed. |
| DB structural assessment | 3,022 visible objects; all 1,142 SQL definitions captured in snapshot `20260929T214106Z` | 100% of the observed visible-object inventory structurally documented. This percentage does not measure functional or runtime completeness. |
| Functional object roles | 35/1,656 eligible tables/procedures/functions/views/triggers: 2.11% | 21 tables, eight procedures, two functions, two triggers and two views reviewed. 1,621 remain unreviewed. A role review is narrower than full routine semantics. |
| Help explanations | Eight topics; 35 ordered execution steps; 16 evaluation cases authored | Initial static pilot verified. Complete SCALE functionality coverage and app evaluation remain open. |
| Process families | 34 captured AIM summary families / 62 source articles indexed | Zero families marked fully reconciled to deployment. Indexing is not semantic completion; other capabilities may exist outside these headings. |
| Configuration validation | Five fixed checks succeeded; 107 configuration rows inspected across their separate scopes | Aggregate-only observations retained. No transactional records selected. Full configuration guide, precedence and per-user effective settings remain incomplete. |
| Retained DB telemetry | Statement history for 163 historical object IDs; 154 currently matched and nine unresolved | Useful prioritization evidence, not whole-process elapsed runtime or procedure-call counts. |
| SDD/supporting material | Nine original files inventoried and preserved; eight unique byte contents | Body extraction, fidelity review, product/version mapping and claim reconciliation not yet performed. |
| Insight navigation and SOPs | Future task identified | No screen register, verified navigation or screen-based SOP capture performed. |
| Interactive app/accessibility | Content model and accessibility requirements documented | App implementation, retrieval evaluation, keyboard/screen-reader tests, intended-user acceptance and deployment not performed. |

There is **no defensible single overall completion percentage**. Structural capture, functional interpretation, configuration coverage, measured runtime and application acceptance have different denominators. Full SCALE knowledge completion remains open.

## What the database assessment contains

The observed engine is Azure SQL Database with compatibility level 150. The connection reported `READ_ONLY`; this differs from the catalog `is_read_only` flag, which was false. TLS certificate validation remained enabled. Collection used ODBC independently of the VS Code extension UI.

The object inventory includes 518 tables, 921 stored procedures, 76 functions, 135 views, six triggers, 407 foreign keys, 400 primary keys and associated constraints/defaults/sequence. Every object has JSON documentation; 1,657 principal objects also have Markdown references. Repository SQL copies redact literals/comments and retain original source fingerprints. Private original definitions remain outside Git and OneDrive.

The catalog contains 2,714 static dependencies, including 169 unresolved references. Sixty modules are lexical dynamic-execution candidates. These require targeted review; a static dependency is not automatically a READS/WRITES/CALLS relationship. Layout observations include 120 user tables without primary keys, 22 untrusted foreign keys and one disabled foreign key. They are observed design/review points, not automatically reproduced operational defects.

Existing source alignment contains 689 conservative identifier mentions connecting 120 objects to 140 AIM/SDK articles. A mention supports discovery, not behavioral equivalence. The [process guide](DB%20Architecture/PROCESS_GUIDE.md), [help topics](DB%20Architecture/HELP_TOPICS.md) and [role register](DB%20Architecture/FUNCTIONAL_ROLES.md) contain bounded reviewed interpretations.

## Functional-help foundation delivered

The eight initial topics explain shipment-detail blanks, work-monitor counts, work selection, inventory adjustment, ship confirmation, print selection, receipt/trailer trigger behavior and background/scheduled processing. Each includes a short user answer, input context, ordered flow, configuration dependencies, expected results, evidence and limits.

The [functional report](DB%20Architecture/SCALE_FUNCTIONAL_REPORT.md) makes novice comprehension and accessibility explicit: short answers first, jargon explained, ordered text alternatives, optional supporting detail, keyboard operation, meaningful headings/labels, visible focus and screen-reader announcements. These are design/content requirements. No accessibility-conformance claim is made for an unbuilt application.

Role classifications distinguish transactional data, configuration, master/reference information, reporting/read models, orchestration, integration staging, audit/history and UI metadata. Objects may have several roles. Scheduling tables and work instructions are not automatically classified as the vendor's generic process queue.

The captured AIM names `QUEUE_PROCESS_REQUEST`, `QUEUE_PROCESS`, `QUEUE_SERVICE` and `Q_PROCESS`; none of those exact names occurs in this replica. Existing `SCHEDULED_JOBS` and `BATCH_SUBMISSION_CONFIG` are not proven aliases. This deployment gap remains visible in help answers.

## Configuration and runtime findings

The owner explicitly authorized a reviewed configuration allowlist. Five fixed SELECTs were independently reviewed, tested and executed against the verified read-only replica. Final observation: **2026-09-29 22:50:28-30 UTC**. No query hit its 10,001-row cap. Only aggregate integer counts were retained; no names, free-text values, user records, secrets or transaction rows were returned.

| Reviewed configuration scope | Rows | Observation |
| --- | ---: | --- |
| Allocation-rule headers | 9 | All nine ACTIVE flags Y. |
| Locating-rule headers | 36 | ACTIVE: 35 Y / one N; DELAYED_LOCATING: all N. |
| Work-profile detail rows | 33 | GROUP_ON_RF: all Y. AUTOMATIC_PUTAWAY, USE_CROSS_DOCK_LP and ASSIGN_MULTIPLE_WORK_UNITS: all N. |
| Standard inbound/outbound status-flow rows | 26 | MANDATORY: nine Y; IN_DEFAULT_FLOW: 16 Y; CHANGE_ALLOWED: seven Y; INCLUDE_IN_INTERFACE_UPLOAD: one Y. Remaining values N. |
| Custom inbound/outbound status-flow headers | 3 | All three ACTIVE flags Y. |

All checked flag NULL/OTHER buckets were zero. These are configuration-row counts, not distinct profiles or effective settings for an operator. The five checks ran separately, without a cross-table snapshot guarantee. Replica freshness is unestablished. Evidence and executable scope are in [configuration validation](DB%20Architecture/CONFIGURATION_VALIDATION.md).

Runtime has two separate meanings: processing behavior and measured elapsed execution. The current source review describes selected behavior. Query Store provides 1,795 aggregate rows covering retained statement observations, with primary/geo-primary role attribution recorded. Historical IDs/source versions, irregular intervals and replica capture limits prevent treating this as complete current procedure or application timing. No workload, stored procedure, trigger, report, print command or job was executed to measure runtime.

## Supporting sources and preserved gaps

SDD contains implementation examples, Insight configuration material, label slides, a configuration walkthrough and work/picking material. Two LAND MAWM files are byte-identical; both originals are retained and should yield one indexed content item. Other-deployment settings and MAWM behavior cannot be assumed to apply to this SCALE installation. Document-body extraction and reconciliation are the next parallel workstream.

Accepted AIM/SDK acquisition gaps remain unchanged. AIM retains eight missing resources and 23 broken-anchor occurrences. SDK retains 43 source 404s: 17 article routes, 24 images and two attachments. Three saved attachments fail strict source decoding; 50 attachment examples have source-format diagnostics, with possible overlap. Preserve those originals and qualifications. See [collection closure](_project/COLLECTION_CLOSURE.md).

## Prompt, credential and archive disposition

The new root [master continuation prompt](03_SCALE_INTELLIGENCE_MASTER_PROMPT.md) governs the next workflow. The two original root prompts are **retained unchanged**, because they are still used by `tools/collector.py`, SDK policy/revalidation, delivery inventory and verification, and associated tests. Their exact bytes are bound into preflight and owner-authority receipts. Moving them would break active consumers and integrity checks; the owner's condition “if we are not using them anymore” is not satisfied.

The old `00_START_PROMPT.md` and `START_HERE.md` were already archived byte-identically under the ignored local `.aekr/archive/2026-09-29-obsolete-launch-prompts/`, with restoration metadata. Their payload is outside normal AI context. No additional prompt archive move or dependency migration is performed in this handoff.

The former root `dbstring.txt` was moved to `%LOCALAPPDATA%/TAB/SCALE-Intelligence/private/credentials/replica.connection.txt`. The file and credential directory were verified with current-user-only ACLs and inheritance disabled. No credentials are tracked or published. Private raw SQL definitions and working receipts remain outside the repository. Historical OneDrive retention/exposure has not been audited or claimed removed.

## Verification and delivery

The original structural assessment passed independent review; the functional slice passed a fresh-context bounded static audit. Configuration/schema/output boundary tests cover non-read-only identity, schema drift, unknown fields/text, invalid bucket counts and failed schema preflight. Minor provenance/encoding findings were corrected. The [functional review record](DB%20Architecture/evidence/FUNCTIONAL_REVIEW.md) distinguishes audit scope from later coordinator integration edits.

The current DB verifier checks 3,022 object records, 1,142 SQL fingerprints, 689 identifier citations, 62 process-source identities, eight help topics, 15 help-source bindings, 35 role records/61 spans, five configuration contracts, 34 family identities, local links and accidental credential exposure. The closed DB manifest contains 5,982 artifacts. These checks establish artifact integrity, not complete semantics or app acceptance.

Handoff regression run: `python -m unittest discover -s tests` exited 0 with **256 passed, zero failed, zero skipped** in 44.662 seconds. All 5,982 manifested DB artifacts matched their recorded hashes. The four handoff/navigation documents had 53 valid local links; the changed-file credential-value scan found no exposure. A separate reviewer checked the continuation plan, status, routing and active-prompt dependencies without modifying the repository.

The exact current test results, content commit, remote privacy/ref checks, staged-file scope and clean-checkout verification are recorded in [_project/continuation-delivery.json](_project/continuation-delivery.json). The older [_project/db-delivery-checkpoint.json](_project/db-delivery-checkpoint.json) remains evidence for its earlier commit; it does not automatically verify subsequent edits. Publication target is the private `edfortheblind/scale-intelligence` repository, `main`. No application deployment or database mutation is included.

## Next executable work and closure criteria

1. Expand work/inventory functional contracts and role coverage, including dynamic SQL and meaningful read/write/call relationships. Continue through receiving, allocation/waves, shipping/printing, interfaces and remaining domains.
2. In parallel, extract and verify SDD bodies, preserve duplicate/product/version distinctions and build source-grounded configuration guidance.
3. Reconcile every captured process family with deployed implementation and application/service evidence. Expand the help library and evaluate its claims, contradictions and unsupported questions.
4. Identify minimally scoped external evidence needed for execution timing and deployment gaps. Complete independent work while such facts remain unavailable; never invent successful execution or effective configuration.
5. Preserve the separately planned Insight-screen/SOP task and later app/accessibility acceptance. These should consume the reviewed knowledge, not replace it with undocumented click sequences.

Close the knowledge foundation only when required functional coverage, semantic contracts, source/configuration mappings, help content and evidence-gap dispositions are verified and accepted. Report app/SOP/operational acceptance separately.

Outcome: **DONE_WITH_CONCERNS**

Delivery state: Versioned continuation handoff; exact publication evidence is in the delivery receipt.

Product state: Verified static foundation and bounded configuration observations; broader knowledge completion remains open.

Gate/authority state: Owner-authorized handoff publication; final knowledge/app/operational acceptance is not implied.
