# Runtime evidence and interpretation

Runtime is recorded in three independent layers: vendor-documented lifecycle, deployed static SQL behavior, and observed execution telemetry. The first two explain how a process is intended or coded to work. The third measures only the execution surface actually captured. None substitutes for the other.

## Observed telemetry

Query Store was already enabled and reported `READ_CAPTURE_SECONDARY`, capture mode `AUTO`, one-hour intervals, 87 MB current storage and 100 MB configured maximum. No setting was changed. The export has 1,795 grouped object/replica/interval/execution-type rows linked to 163 historical object IDs. Of these, 154 resolve to the current catalog; nine do not. Intervals span 2025-11-16 16:00 UTC through 2026-09-29 22:00 UTC; this is the earliest/latest retained boundary, not proof of continuous coverage. The last interval had not ended at collection time.

Unresolved historical IDs: `140123840`, `558937363`, `622937591`, `638937648`, `776650110`, `906798638`, `1195463633`, `1574556943`, `1811797812`. Their rows remain in the export; no current object name or reason for absence is invented. For example, ID `776650110` has 637,756 statement executions but cannot be named from the captured current catalog. Historical ID reuse or object changes also prevent assuming that every retained statistic necessarily belongs to the current definition with that ID.

| Query Store group | Observed role_type | Meaning | Export rows |
| --- | ---: | --- | ---: |
| 1 | 1 | Primary | 1,794 |
| 3 | 3 | Geo-Primary | 1 |
| 2 / 4 | 2 / 4 | Secondary / Geo-Secondary | 0 in the object-linked export |

Role labels follow Microsoft's [Query Store replica catalog](https://learn.microsoft.com/en-us/sql/relational-databases/system-catalog-views/sys-query-store-replicas?view=sql-server-ver17). The replica catalog can retain role history; it is not a current-topology inventory. Accessing the data through a read-only connection does not make the historical statistics measurements of that read-only endpoint.

The [runtime JSON](catalog/query_store_runtime.json) preserves replica group, execution type, UTC interval boundaries, statement execution count and execution-weighted elapsed/CPU sums in microseconds. Duration weighting is `SUM(count_executions * avg_duration)`. Divide by the matching sum of counts and then 1,000 for average statement milliseconds. Never average interval averages without weighting, combine execution types into a success-only claim, or calculate p95/p99 from these aggregates. See [runtime statistics semantics](https://learn.microsoft.com/en-us/sql/relational-databases/system-catalog-views/sys-query-store-runtime-stats-transact-sql?view=sql-server-ver17).

Object cards show row counts and statement-execution totals across their retained groups. Use the underlying group/interval data for comparisons. A multi-statement routine can contribute several statement executions per invocation; these totals are **not stored-procedure call counts**. No query text, parameter values, plan XML, SQL handles or application records were exported.

Local procedure, function and trigger cache DMVs returned no matching rows. This means no matching cached statistics were observed at this connection/time/filter. It does not mean those routines are unused. Cached rows can disappear, and function statistics omit TVFs and inlined scalar functions. See [procedure cache statistics](https://learn.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-exec-procedure-stats-transact-sql?view=sql-server-ver17) and [function statistics](https://learn.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-exec-function-stats-transact-sql?view=sql-server-ver17).

## Process runtime contract

Each future reviewed process record needs: user goal, entry point, preconditions, ordered calls, branch/status logic, transaction boundary, errors/retries, external services, configuration dependencies, expected outputs and evidence citations. A measured record additionally needs origin/role, observation period, correlation semantics, duration unit, sample count and missing-stage coverage.

For a warehouse task spanning UI → application service → several database calls → an integration/print endpoint, DB statement durations cannot reconstruct elapsed user-facing completion time. Existing sanitized application telemetry or vendor/IT architecture evidence is needed. Application batch scheduling is distinct from SQL Agent scheduling. No operational queue or configuration rows were read to infer activation.

Current unknowns include application service polling intervals actually configured, active scheduled jobs, queue backlog, retry occurrence, current feature flags, SDK endpoint implementation/version and per-user permissions. Keep these unknown; do not query application records to fill them under this metadata-only mandate.

## Safe answer examples

- “The captured procedure updates shipment, detail, container and load status fields; the caller and configured process determine when it runs.” Cite its SQL/card and relevant AIM process summary.
- “Query Store contains historical statement activity for this object, primarily recorded in the primary role. Complete process duration was not measured.” Cite the group/interval rows.
- “AIM documents a process queue, but the named queue tables were not found in this replica. We cannot confirm this deployment uses that implementation.” Cite the documented identifier and the inventory gap.
