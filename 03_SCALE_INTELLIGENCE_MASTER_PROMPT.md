# SCALE Intelligence master continuation prompt

Revision: SCALE-BRAIN-CONTINUATION-1.0, 2026-09-29.

Use this file as the next-session work instruction for this existing repository. Start by verifying the current checkout and reading the sources below, then carry out the next work. Do not stop at a new plan, a structural inventory or another small pilot when supported functional work remains. Keep truthful checkpoints so work survives a session boundary without repeating completed collection.

## Owner objective

Build the complete, source-grounded knowledge foundation for a central SCALE Intelligence “brain.” It must quickly explain SCALE to people with little or no SCALE experience, including visually impaired users who do not have time to read AIM/SDK, examine the database or interpret implementation documents.

The knowledge must explain what each function does, why it matters, how SCALE executes it, what configuration changes its behavior, its prerequisites, expected results, exceptions and useful checks. Users should receive a direct answer with optional deeper explanation and supporting citations. SQL object names and document navigation are supporting evidence, not the main user experience.

Combine AIM, SDK, observed database structure/code, reviewed configuration observations, configuration guidance and the supplied SDD examples. Preserve product/version/deployment differences. A future separately initiated task will register and navigate Insight screens and document verified SOPs per functionality. Prepare associations for that task; do not invent navigation or claim it has been performed.

## Start here, in order

1. Inspect Git status, branch and the current task's owner instructions. Preserve unrelated changes. Read [PROJECT_STATUS.md](PROJECT_STATUS.md) and [_project/RESUME.md](_project/RESUME.md). The latest owner's instructions override this prompt.
2. Consult `C:/Apps/AEKR/.aekr/AGENTS.md` and its required active governance closure, including the delegation contract when agents are used. Keep AEKR read-only. This consumer uses native manual governance, not an installed AEKR runtime or scaffold. Do not copy AEKR private material, select its provider runners, alter switches or restart unrelated AEKR work.
3. Read [the functional report](DB%20Architecture/SCALE_FUNCTIONAL_REPORT.md), [plan](DB%20Architecture/PLAN.md), [intelligence contract](DB%20Architecture/INTELLIGENCE_CONTRACT.md), [help topics](DB%20Architecture/HELP_TOPICS.md), [functional roles](DB%20Architecture/FUNCTIONAL_ROLES.md), [configuration validation](DB%20Architecture/CONFIGURATION_VALIDATION.md) and [review](DB%20Architecture/evidence/FUNCTIONAL_REVIEW.md).
4. Inspect the current JSON ledgers in `DB Architecture/mappings/` and the verification/manifest in `DB Architecture/evidence/`. Read the [structural assessment](DB%20Architecture/ASSESSMENT.md), [process guide](DB%20Architecture/PROCESS_GUIDE.md), [runtime limits](DB%20Architecture/RUNTIME.md) and [refresh rules](DB%20Architecture/OPERATIONS.md) as needed for the assigned batch.
5. Read [SDD/README.md](SDD/README.md), [_project/DATA_ARCHITECTURE.md](_project/DATA_ARCHITECTURE.md) and the AIM/SDK owner-closure records. Inspect source bodies only when relevant to the current reviewed claim; exclude archive payload from ordinary context and search.
6. Verify [_project/continuation-delivery.json](_project/continuation-delivery.json) and the actual Git refs if delivery parity matters. Never infer OneDrive upload from Git parity.

If external AEKR or the private SQL snapshot is unavailable, report that exact limitation and continue independent work from public-in-repository evidence. Do not fabricate governance loading or silently reconstruct sensitive literals from redacted SQL.

## Current baseline and accepted collection closures

- AIM acquisition is owner-closed with accepted exceptions: 2,446/2,453 known article originals, 99.71%.
- SDK acquisition is owner-closed with accepted exceptions: 363/380 known article originals, 95.53%. Its known denominator is a lower bound; source defects remain recorded.
- The existing search database contains 2,809 AIM/SDK articles. It is not an implemented question-answering application or a completed knowledge model.
- Database snapshot `20260929T214106Z` contains 3,022 visible objects: 518 tables, 921 stored procedures, 76 functions, 135 views, six triggers and associated objects. All 1,142 SQL module definitions were captured. Structural coverage is complete for that observed snapshot; semantic coverage is not.
- The first functional slice has eight help topics, 35 ordered steps, 16 authored evaluation cases and 35 reviewed roles out of 1,656 eligible objects. A role assignment is not a complete routine semantic review. The other 1,621 eligible objects remain unreviewed.
- All 34 captured AIM process-summary families and their 62 articles are indexed. No family is yet marked fully reconciled to deployed execution.
- Five fixed configuration aggregate checks succeeded at 2026-09-29 22:50:28-30 UTC. Those are timestamped replica observations, not present-tense guarantees or effective settings for an individual user.
- Query Store contains statement history for 163 historical object IDs: 154 currently match the catalog, nine do not. Statement execution counts and durations are not procedure-call counts or whole-process elapsed time. Replica freshness is not established.
- Nine supplied SDD/supporting originals are inventoried, including one byte-identical duplicate pair. Their bodies have not yet been extracted/reconciled. The LAND documents identify MAWM; applicability to SCALE must be demonstrated.
- The interactive help app, deployment, app retrieval evaluations, screen-reader/user acceptance and Insight navigation/SOP register have not been implemented or performed.

Do not reopen accepted AIM/SDK acquisition, repeat failed resource retries, modify originals, change denominator definitions or relabel accepted source gaps as repaired. The owner must explicitly reopen a specific acquisition gap.

## Next task: complete the functionality knowledge, in measured batches

Begin with a source-backed work-execution/inventory batch that extends the current help pilot, while a separate agent performs SDD intake/extraction. Use existing evidence and continue into subsequent functional batches after verification; do not request repeated permission for routine authorized documentation work.

### A. Extend the functional object and execution model

Maintain a complete ledger over the 1,656 tables/procedures/functions/views/triggers eligible for functional role review. Link constraints, defaults and the sequence to the behavior they govern where relevant. Keep domain separate from role and permit multiple roles: transactional state, configuration, master/reference, reporting/read model, orchestration, integration staging, audit/history, execution worklist and presentation metadata.

For each routine/view/trigger under semantic review, capture inputs/defaults/null handling, output shape, reads/writes/calls, ordered branches, status/quantity effects, configuration scope and precedence, error/return handling, transaction ownership, concurrency effects, trigger behavior and external handoffs. Distinguish explicit static references from reviewed READS/WRITES/CALLS. Name matching alone is not a semantic relationship.

Prioritize work execution and monitoring; inventory movement/adjustment/serial/lot; receiving/locating/putaway; allocation/waves/replenishment; packing/shipping/carriers/printing; interfaces/devices; yard/dock; labor/performance/billing; administration and remaining families. Include custom/tenant-style routines and all 60 dynamic-execution candidates and 169 unresolved dependency entries. Prefixes do not prove vendor/custom ownership. Track remaining work explicitly rather than counting generated placeholders as review.

Use private original definitions when needed to inspect dynamic SQL or redacted business conditions. Publish only reviewed non-sensitive conclusions and identifier/line/hash evidence. Do not copy full private definitions, arbitrary strings, comments, credentials or operational data into the repository or an external service.

### B. Reconcile all captured process families

For every family in `mappings/functional-coverage.json`, identify the user goal, initiating event, application/DB/service stages, configuration decisions, outcomes, errors and evidence gaps. Link the appropriate routines and tables only when supported. Add functions not represented by the 34 summary headings when discovered; the headings are not an exhaustive SCALE capability denominator.

Expand `mappings/help-topics.json` and its readable counterpart with short novice answers and deeper reviewed steps. Every substantive claim needs a stable source identity and location. Preserve gaps such as vendor queue identifiers absent from this replica; do not guess aliases or assume a separate database/application service exists.

### C. Extract and reconcile SDD and configuration guidance

Use the relevant installed document/PDF/presentation skills when handling those formats. Preserve all nine originals and their hashes; index the duplicate pair once while retaining both source files. Extract tables, diagrams and text with verifiable document/page/section/slide references. Provide useful text descriptions for diagram meaning. Do not infer document versions solely from filenames after body review becomes possible.

Classify source claims as vendor behavior, implementation-specific choice, configuration example, observed deployment or inference. Record product/version conflicts, especially MAWM versus SCALE. Build a configuration guide explaining each reviewed setting's purpose, scope, accepted values, defaults, precedence, related process and validation method. An SDD sample from another deployment must never be stated as this deployment's active setting.

### D. Expand runtime understanding without operational execution

Document execution behavior and measured runtime separately. Use the existing retained Query Store aggregates only within their observation/version/replica limits. Identify missing application/service/correlation evidence required for full process timing. Do not execute workload, procedures, jobs, reports, labels, DML, benchmarks or monitoring changes to manufacture runtime evidence.

When a required fact cannot be established without an external source, record the exact question, why it matters and what minimally scoped evidence would resolve it. Continue independent work. Do not claim completeness for unresolved application calls or effective user configuration; close such limits only through evidence or explicit owner acceptance of the identified gap.

### E. Prepare verifiable help acceptance

Maintain evaluation questions with expected explanations, forbidden unsupported claims and citations. Cover positive, error, absent/duplicate/stale configuration, denied access, conflicting versions and missing-deployment cases. Run meaningful offline checks now; distinguish them from tests of a future working app.

Answers should follow: **What it does -> What happens -> What can affect it -> What you can check -> More detail and sources**. Define jargon, use short paragraphs and numbered text steps, and avoid relying on charts, color, hover, icons or visual screen position. The eventual interface needs keyboard navigation, visible focus, semantic headings, screen-reader labels/order/status announcements, text resizing and contrast. Actual accessibility acceptance needs intended users and assistive technology; documentation alone cannot prove it.

## Database and credential boundary

- Reuse the captured metadata before opening a new connection. The engine is Azure SQL Database, not an assumed SQL Server 2014 installation. The observed connection was `READ_ONLY` even though the database catalog setting `is_read_only` was false; keep these distinct.
- Protected credential input: `%LOCALAPPDATA%/TAB/SCALE-Intelligence/private/credentials/replica.connection.txt`. Use the existing parser/ODBC builder; never print the file, its values or a connection string. Current file/directory ACLs were restricted to the current user. Do not move credentials back into the repository.
- Exact full private definition snapshot: `%LOCALAPPDATA%/TAB/SCALE-Intelligence/private/db-assessment/20260929T214106Z`. Newer folders may contain identity-only checks; do not choose the latest directory and assume it is a full snapshot.
- Metadata collection and configuration validation are separate. The owner authorized a reviewed configuration allowlist. The five existing fixed checks in `tools/check_scale_configuration.py` are the executable baseline. Refresh only for a concrete need, preserving scope/time/replica limits. Do not broaden to arbitrary config fields, user records or SQL generated by a model. Review any proposed new check's exact table/columns/predicates/bounds/sensitivity and obtain clarification if it crosses the established read scope.
- No transactional rows, customer/order/inventory/work records, secrets, generic value dumps or operational routine execution. ReadOnly intent alone is not sufficient; preserve the current identity/read-only/schema checks, certificate validation, timeouts, caps and aggregate-only output validation.
- Raw definitions and local working receipts stay outside publication. `.aekr/`, credentials, browser state, trace files and local runtime data remain excluded from Git.

## Original prompt disposition

`01_AIM_MASTER_PROMPT.md` and `02_SDK_MASTER_PROMPT.md` remain at root **unchanged** because active collector, SDK authority/revalidation and delivery verification bind their exact paths/bytes. They are retained acquisition/integrity inputs, not instructions to reopen the owner-closed collection. This new file governs continuation workflow subject to current owner instructions and existing accepted source boundaries.

Do not archive them merely to tidy the root. Moving them would require a deliberately authorized dependency migration, updated consumers/authority manifests/tests and restoration evidence. The owner's conditional request to archive unused prompts was evaluated; its condition was not met. Existing private archives are not ordinary context. Reading archive payload needs scoped owner authorization; moving an eligible future obsolete file requires a byte-preserving manifest and restoration mapping.

## Execution, verification and completion

Use bounded agents for independent domains/SDD extraction and a fresh-context reviewer for declared completion. Assign nonoverlapping writes, exact sources, authority, deadlines/retry limits and return contracts. One coordinator owns integration, verification and Git publication. Agent self-review is not an independent audit.

Keep progress updates short and prefixed `orchestration:`, `execution:`, `auditing:`, `shifting:` or `validating pass:`. Report percentages only against explicit denominators. Do not report structural 100%, 2.11% role review or Query Store coverage as overall SCALE-brain completion.

Relevant offline commands:

```powershell
python -m unittest discover -s tests
python tools/verify_db_docs.py
python tools/verify_delivery.py
git diff --check
```

The DB verifier currently uses the protected credential file only for a non-disclosing exposure check, not a connection. On a machine without that input, verify artifact hashes without importing credentials into the checkout and report the exposure check unavailable; do not call that a full verifier pass. The legacy delivery verifier checks the closed AIM/SDK corpus, not semantic completeness. Refresh only affected manifests after curated edits; follow `OPERATIONS.md` to avoid deleting curated records during regeneration.

Complete supported work and record remaining scope after each meaningful batch. Update `PROJECT_STATUS.md`, the existing coverage ledgers, `_project/RESUME.md` and this prompt's baseline when facts change. Preserve older accepted receipts as scoped historical evidence. A session boundary should leave a precise next action, verified changed-output inventory and no falsely completed rows.

Knowledge-foundation completion requires reviewed roles and relevant semantic contracts, reconciled process coverage, verified SDD/configuration source mappings, usable help answers, exact citations, handled contradictions and an explicit disposition for every remaining evidence gap. App/SOP deployment and real-user acceptance are separate work unless the owner explicitly starts them. Do not describe missing work as approval-only pending.

The current handoff's commit/push was explicitly requested. Do not treat this document as authority for future destructive history changes, database mutations, public publication or deployment. When publishing authorized future changes, verify the private repository, inspect the exact diff, scan for secrets, run relevant checks, use a normal non-force push, then verify remote SHA, checkout bytes and clean status. Resolve real conflicts without overwriting others' work.

Finish each handoff with a canonical AEKR outcome and separate delivery/product/authority states, concrete evidence, actual remaining work and the next executable step. Never guarantee completion or runtime behavior that the evidence cannot establish.
