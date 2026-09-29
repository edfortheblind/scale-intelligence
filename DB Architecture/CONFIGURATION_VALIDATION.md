# Reviewed SCALE configuration validation

The owner authorized: “Read a reviewed configuration allowlist now.” This extension answers a narrow question: do selected configuration flags occur in this replica, and in what proportions? It does not retrieve individual configurations, work records, inventory, shipment data, user information or secrets.

The current observation is recorded in [configuration-observations.json](evidence/configuration-observations.json), including start/end times, check hashes, scope and result status. These observations support the [functional help framework](SCALE_FUNCTIONAL_REPORT.md); the configuration does not itself explain every application decision.

## Observed on 2026-09-29 at 22:50:28–30 UTC

All five checks succeeded on the verified read-only replica. None reached its cap. All inspected flags fell into Y or N; NULL and OTHER counts were zero.

| Configuration scope | Rows inspected | Observed flags |
| --- | ---: | --- |
| Allocation-rule headers | 9 | ACTIVE: 9 Y. |
| Locating-rule headers | 36 | ACTIVE: 35 Y, 1 N. DELAYED_LOCATING: 36 N. |
| Work-profile details | 33 | GROUP_ON_RF: 33 Y. AUTOMATIC_PUTAWAY, USE_CROSS_DOCK_LP and ASSIGN_MULTIPLE_WORK_UNITS: 33 N each. |
| Standard inbound/outbound status-flow rows | 26 | MANDATORY: 9 Y/17 N; IN_DEFAULT_FLOW: 16 Y/10 N; CHANGE_ALLOWED: 7 Y/19 N; INCLUDE_IN_INTERFACE_UPLOAD: 1 Y/25 N. |
| Custom inbound/outbound status-flow headers | 3 | ACTIVE: 3 Y. |

For example, the work-profile observation supports “all 33 inspected detail rows had the grouping flag set to Y at that time.” It does not identify the operator's selected profile or prove why a particular task was grouped. That distinction must remain in the help answer.

## Reviewed allowlist

| Check | Configuration source and flags | What it helps explain | What it cannot establish |
| --- | --- | --- | --- |
| Allocation activation | `ALLOCATION_RULE_HEADER.ACTIVE` | Whether allocation-rule headers with Y/N activation flags occur. | Which rule a particular allocation used, rule priority, inventory availability or task success. |
| Locating rules | `LOCATING_RULE_HEADER.ACTIVE`, `DELAYED_LOCATING` | Whether locating configuration includes activation and delayed-processing options. | Which rule applies to a receipt or location, or whether an application service processed it. |
| Work-profile behavior | `WORK_PROFILE_DETAIL.GROUP_ON_RF`, `AUTOMATIC_PUTAWAY`, `USE_CROSS_DOCK_LP`, `ASSIGN_MULTIPLE_WORK_UNITS` | Whether configuration contains grouping, automatic putaway, cross-dock license-plate and multiple-work-unit options. | Which profile or sequence a user selected, whether a feature is enabled elsewhere, or why a specific task appeared. |
| Standard status flow | `FUNCTIONAL_AREA_STATUS_FLOW.MANDATORY`, `IN_DEFAULT_FLOW`, `CHANGE_ALLOWED`, `INCLUDE_IN_INTERFACE_UPLOAD` | The distribution of these flags across combined Inbound/Outbound status-flow configuration. | The meaning of an individual status, a valid transition for a transaction, or successful interface delivery. |
| Custom status-flow activation | `CUSTOM_STATUS_FLOW_HEADER.ACTIVE` | Whether custom inbound/outbound flow headers carry activation flags. | Which flow a warehouse/company uses, its detailed transitions or effective application selection. |

The exact object IDs, column IDs, data types and maximum lengths are fixed in [the checker](../tools/check_scale_configuration.py). Two functional-area predicates use bound values `Inbound` and `Outbound`. No other filter, object or field can be selected through its command line. Sources such as polymorphic `SYSTEM_VALUE`, generic value fields, messages, parameter payloads, printer names and user stamps are excluded.

Schema and source review established that these are dedicated configuration tables and Y/N-style flags. No explicit Y/N check constraint guarantees every stored value. Accordingly, the output counts four buckets per flag: **Y, N, NULL and OTHER**. OTHER reports only a count; it never returns unexpected text. Comparison follows the verified database collation, including its case-insensitive behavior. A default in a schema is not evidence that all existing rows contain that value.

## Reading the result

Each check returns one aggregate row. `sampled_rows` is the number of configuration rows inspected for that check. It is not a count of profiles, processes, transactions or distinct users. In particular, a work profile can have several detail rows.

If fewer than 10,001 rows are returned by the bounded source query, the counts cover that query's selected configuration scope at its execution time. A count of 10,001 triggers `CAPPED_INCOMPLETE`; those counts describe an unordered bounded sample and must not be reported as full-table percentages. Zero rows means no configuration rows matched that exact checked scope at that observation time; it does not prove the feature is unsupported or disabled throughout SCALE.

Different flags are aggregated independently. Counts do not establish which flags coexist on the same configuration row. Checks run separately, so they do not form a transactionally consistent cross-table snapshot. The metadata snapshot and configuration observation also have different capture times.

Read-only replica identity and encrypted certificate validation are checked before any configuration SELECT. Replica freshness is not established as a guaranteed bound. These are replica observations, not proof of the current primary's settings or a user's effective configuration. Client query duration is retained for the check's diagnostics; it is not SCALE process runtime.

## Execution and handling

The collector uses five fixed SELECT queries, a 10,001-source-row ceiling per check, 15-second query timeout, five-second lock timeout, MAXDOP 1, schema drift rejection and a one-row integer-only output contract. Unknown columns, non-integer results, inconsistent counts, wrong database identity, a writable connection or changed field types fail closed. Database procedures/functions are not invoked by these queries. No changes are made to connection permissions.

The metadata-only collector remains unchanged. The separate authorized invocation is:

```powershell
python tools/check_scale_configuration.py --execute-reviewed-allowlist
```

This command must only be used with authority for the current assessment. The flag is an execution guard, not an authorization system. Credential input remains in the protected local credential file; connection strings and driver messages are not written into evidence. Only aggregate integers and check metadata are retained, both in the evidence artifact and a timestamped private receipt. The tool is not exposed to users or the language model as an arbitrary SQL service.

## Future user-specific validation

A production help app would need separately reviewed checks for selected warehouse/company/profile context, application-level authorization, freshness handling, result minimization and audit evidence. It should state, for example, “This profile was configured to group work when checked at [time],” only when the exact scoped check supports that statement. These aggregate observations cannot support that wording.

A full configuration guide must also explain precedence, defaults, overrides, dependencies, version differences and how each setting affects a reviewed process. This initial allowlist is a first validation slice, not completion of that guide. UI navigation and configuration-change SOPs belong to the later Insight screen registration task.
