# Documentation plan and acceptance boundary

Owner scope: document SCALE database functionality and process behavior for the intelligence app, without importing operational data. Existing AIM/SDK collection remains closed with its accepted exceptions. The SDD source work is a separate concurrent owner request.

| Work package | Result / present status | Acceptance evidence / remaining work |
| --- | --- | --- |
| 1. Governance and access | Executed | Read-only AEKR consultation, bounded delegated architects, one DB writer, independent auditor; verified encrypted read-only Azure connection. No AEKR runtime/scaffold claim. |
| 2. Structural inventory | Captured and reconciled | 3,022 objects, columns/parameters/constraints/indexes/storage/feature metadata, all 1,142 module definitions, start/end object consistency. Three unavailable engine surfaces remain explicit. |
| 3. Reference documentation | Generated | Every object JSON; human references for tables/routines/views/triggers/sequence; redacted source and original hashes; exact dependency graph and unresolved edges. |
| 4. AIM/SDK alignment | Conservative automated crosswalk plus selected reviewed dossiers | Source ID/hash/node citations. Exact identifiers are evidence of a mention, not behavioral equivalence. Common prose names are excluded unless qualified. Review remaining associations by business claim. |
| 5. Process documentation | All captured AIM Process Summary articles indexed; selected deployed workflows explained | Expand reviewed input/output/branch/error/transaction/caller contracts for all routines. Generated cards explicitly mark unreviewed business semantics. Prioritize custom objects and dynamic SQL. |
| 6. Runtime evidence | Existing aggregate telemetry captured | 163 historical IDs have Query Store statement history: 154 match current objects and nine are unresolved. Complete process duration, active scheduler configuration and application orchestration are unavailable from this metadata-only boundary. |
| 7. Intelligence integration design | Contract and answer policy documented | Build retrieval/evaluation later against the user's app design. No app, embeddings, deployment or autonomous SQL execution is introduced here. |

## Next documentation passes

1. Review the 60 dynamic-execution candidates and 169 unresolved dependency entries using the private definitions. Recover identifier-only relationships with source locations; publish sensitive constants only after explicit sensitivity review. Keep external calls and unknown runtime-selected targets unresolved.
2. Review tenant-style/custom modules and high-activity inventory/work/shipping entry points first. Link each claim to an exact SQL hash/line and AIM/SDK node. Compare the captured implementation with the documented example rather than assuming equality.
3. Work through receiving/putaway, inventory/serial/lot, allocation/waving/replenishment, work execution, packing/ship confirmation, interfaces, printing, labor/yard, billing, history/alerts and system administration. The [process index](PROCESS_INDEX.md) provides the existing vendor explanation for every captured process summary.
4. For each procedure/function, document output shape, null behavior, branch conditions, status meanings, effect ownership, caller transactions and error propagation. Use static analysis; do not execute routines. Mark source-derived interpretations separately from accepted user explanations.
5. Reconcile documentary queue names that are absent from the replica, and identify application-server configuration/exit-point sources through an existing sanitized architecture handoff. This is an external evidence requirement, not permission to read operational tables or change the deployment.
6. Evaluate representative questions with a SCALE SME. Require citations, correct distinction between documented/general behavior and observed deployment, and an explicit unknown response when evidence is absent. Record owner acceptance separately from technical validation.

## Completion measures

Track four denominators independently: visible objects structurally documented; routines semantically reviewed; vendor processes aligned to deployment; processes with complete operational runtime evidence. Structural coverage must not be reported as semantic or runtime completion. Every missing definition, unmatched process, unresolved dependency and absent runtime source remains visible.

The current deliverable is a verified structural assessment, reusable source evidence and initial process explanation set. It is not a claim that all 921 procedures or every SCALE application process has received a full semantic/operational review. No recurring monitoring, new subscription or external publication is required to use this documentation locally.
