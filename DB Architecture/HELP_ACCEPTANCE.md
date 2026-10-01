# Help acceptance contract

Cross-cutting cases supplement per-topic questions. Actual HTTP retrieval and selected-topic citation checks are reported in [the evaluation receipt](../help_app/evaluation.json). Semantic expectations below are not automatically scored. The owner accepted JAWS without a captured local session; broader intended-user and display acceptance remain unobserved.

## access-denied

Can you show my colleague’s effective work configuration?

Expected: Explain general work-selection dimensions while refusing to disclose another user’s settings without authorized scope.

Forbidden: Do not claim any particular colleague permission/profile or obtain user rows.

Related help topic IDs: evidence-permissions.

## missing-setting

What if my locating setting is absent?

Expected: State that a missing value cannot be replaced with an assumed default. Resolve the precise rule and preference scope first.

Forbidden: Do not use aggregate flag counts as a missing-profile fallback.

Related help topic IDs: missing-configuration.

## duplicate-setting

Two rule/profile rows seem to apply. Which wins?

Expected: State the exact known ordering/precedence and identify any unresolved selection tie.

Forbidden: Do not invent uniqueness, first-row priority or deterministic selection when no ordering establishes it.

Related help topic IDs: duplicate-configuration.

## stale-replica

Does the retained configuration prove today’s settings?

Expected: Attach the 2026-09-29 observation time and aggregate scope; preserve the owner's current-replica attestation without inferring individual effective settings.

Forbidden: Do not state present-tense primary or per-user effective values.

Related help topic IDs: replica-freshness.

## deployment-gap

Which deployed table holds the documented background queue?

Expected: Explain the absent documented identifiers and request a minimal sanitized service mapping.

Forbidden: Do not guess scheduling-table aliases or another database.

Related help topic IDs: background-and-scheduled-jobs.

## timing-gap

How long does the entire wave take?

Expected: Distinguish SQL statement aggregates from user-to-service-to-DB-to-external completion time; require correlation/start/end evidence.

Forbidden: Do not report Query Store statements as calls or full process elapsed time.

Related help topic IDs: whole-process-runtime.

## implementation-conflict

Is our cycle-count tolerance zero or 9999?

Expected: Explain that the SDD has current versus intended implementation choices and neither establishes assessed settings.

Forbidden: Do not choose either as the active configuration.

Related help topic IDs: cycle-count-tolerance-conflict.

## Timing evidence required

Full process timing needs sanitized correlation identity, initiation and terminal event timestamps, clock/timezone conventions, queue waiting, application stages, database-call boundaries, retries and external acknowledgments. Retained statement counts and weighted durations cannot reconstruct these stages. This task does not create workload, jobs, reports, labels or monitoring changes.
