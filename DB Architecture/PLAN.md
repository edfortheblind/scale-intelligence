# Documentation plan and acceptance boundary

Owner scope: build the evidence for an accessible SCALE knowledge base that quickly explains functionality and execution behavior to novice users without requiring AIM/SDK/DB research. Do not import transactional data. The owner separately authorized a reviewed configuration allowlist. Existing AIM/SDK collection remains closed with its accepted exceptions; SDD samples supply design context after source reconciliation. Insight screen registration/navigation and functionality SOPs are a future task.

The primary deliverable is now the [SCALE functional report](SCALE_FUNCTIONAL_REPORT.md), supported by [help topics](HELP_TOPICS.md), [reviewed object roles](FUNCTIONAL_ROLES.md), [configuration validation](CONFIGURATION_VALIDATION.md) and the [process-family coverage ledger](mappings/functional-coverage.json). Structural completeness remains a separate measure.

| Work package | Result / present status | Acceptance evidence / remaining work |
| --- | --- | --- |
| 1. Governance and access | Executed | Read-only AEKR consultation, bounded delegated architects, one DB writer, independent auditor; verified encrypted read-only Azure connection. No AEKR runtime/scaffold claim. |
| 2. Structural inventory | Captured and reconciled | 3,022 objects, columns/parameters/constraints/indexes/storage/feature metadata, all 1,142 module definitions, start/end object consistency. Three unavailable engine surfaces remain explicit. |
| 3. Reference documentation | Generated | Every object JSON; human references for tables/routines/views/triggers/sequence; redacted source and original hashes; exact dependency graph and unresolved edges. |
| 4. AIM/SDK alignment | Conservative automated crosswalk plus selected reviewed dossiers | Source ID/hash/node citations. Exact identifiers are evidence of a mention, not behavioral equivalence. Common prose names are excluded unless qualified. Review remaining associations by business claim. |
| 5. Process documentation | All 1,138 eligible module contracts and all 34 captured process families have bounded review | Preserve complete captured static review; reconcile application callers, effective configuration and external handoffs only from supported evidence. One table purpose remains unestablished. |
| 6. Runtime evidence | Existing aggregate telemetry captured | 163 historical IDs have Query Store statement history: 154 match current objects and nine are unresolved. Complete process duration, active scheduler configuration and application orchestration are unavailable from this metadata-only boundary. |
| 7. Intelligence integration design | Contract and answer policy documented | Local curated help/search and actual HTTP evaluation implemented. Production deployment, authentication, intended-user and assistive-technology acceptance remain open. No autonomous SQL endpoint. |

## Next documentation passes

1. Preserve the completed 921 stored-procedure contracts and 517 table roles in the [object ledger](mappings/object-review-ledger.json). `dbo.Interface_Item_Failure_1024` remains purpose-unconfirmed after the bounded source/reference search. All 60 dynamic-execution candidates and 169 unresolved dependency entries already have bounded dispositions; catalog NULL targets, runtime-selected targets and external callers remain distinct evidence gaps.
2. Improve source-supported help answers and question retrieval without repeating reviewed module bodies or indexing evaluation questions. Link each claim to exact SQL hash/line or AIM/SDK nodes. Compare the captured implementation with the documented example rather than assuming equality; prefixes alone do not establish ownership.
3. Extend source-supported behavior across the remaining families, including administration and screen-definition consumers. The [process index](PROCESS_INDEX.md) supplies the captured vendor process-summary explanations; all 34 families have documentary review, while their full deployment reconciliation remains open. Continue SDD claim, table and figure review after the completed 231/231 PDF-page visual pass; full DOCX page fidelity remains open.
4. When new source evidence resolves a contract limitation, update the owning batch and revalidate its citations and generated records. Preserve output shape, null behavior, branch conditions, status meanings, effect ownership, caller transactions and error propagation. Use static analysis; do not execute routines. Mark source-derived interpretations separately from accepted user explanations.
5. Reconcile documentary queue names that are absent from the replica, and identify application-server configuration/exit-point sources through an existing sanitized architecture handoff. The approved configuration allowlist provides only its declared aggregate flag observations; other operational sources and deployment changes remain outside it.
6. Evaluate representative questions with a SCALE SME and novice users, including visually impaired users. Require useful plain-language answers, keyboard/screen-reader acceptance of the eventual app, citations, correct distinction between documented/general behavior and observed deployment, and an explicit unknown response when evidence is absent. Record owner acceptance separately from technical validation.

## Completion measures

Track four denominators independently: visible objects structurally documented; routines semantically reviewed; vendor processes aligned to deployment; processes with complete operational runtime evidence. Structural coverage must not be reported as semantic or runtime completion. Every missing definition, unmatched process, unresolved dependency and absent runtime source remains visible.

The current deliverable includes a verified structural assessment, bounded static contracts for all captured eligible modules and reviewed process explanations. Static contract coverage does not establish application orchestration, current settings or measured operational behavior. No recurring monitoring or new subscription is required to use this documentation locally.

## Current continuation checkpoint

The hash-bound [section completion report](../_project/COMPLETION_REPORT.md) owns the current counts, evaluation bindings and denominators. [Project status](../PROJECT_STATUS.md) identifies the latest verification and publication receipts. Earlier continuation receipts remain immutable evidence for their own captured outputs.

Continue uncited SDD semantics and assets, caller/deployment reconciliation where evidence is available, remaining help-quality gaps and user interaction evidence. The 231 PDF page views and 45 slide views are already complete; they do not establish all claims or raster tables. Insight navigation and SOP registration remain a separately initiated future task.
