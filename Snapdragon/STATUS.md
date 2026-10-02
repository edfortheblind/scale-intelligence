# Snapdragon progress

Observation date: 2026-10-02. Recomputed from [coverage.json](inventory/coverage.json).

This is a completed discovery/structural-documentation pass with detailed follow-up still open. Percentages below measure the stated phase, not whole-SCALE completion.

| Phase | Completed / denominator | Progress |
|---|---:|---:|
| Visible menu sections inventoried | 8 / 8 | 100% |
| Screen metadata records mapped | 254 / 254 | 100% |
| Screen dossiers generated | 254 / 254 | 100.0% |
| Visible menu destinations attempted | 63 / 63 | 100.0% |
| Visible menu destinations loaded | 62 / 63 | 98.41% |
| Configured numeric Insight/Monitor routes attempted | 53 / 53 | 100.0% |
| Configured numeric Insight/Monitor routes loaded | 48 / 53 | 90.57% |
| Active-form configuration pages verified | 211 / 211 | 100.0% |
| Full functional/configuration review accepted | 0 / 211 | 0% |

Full review includes conditional states, record detail branches, action/dependency semantics and the other applicable evidence criteria. No overall blended percentage is calculated. Warehouse execution is not required or authorized by this documentation pass.

## Progress by visible menu section

| Section | Attempted | Loaded | Loaded % | Remaining landing issue |
|---|---:|---:|---:|---|
| Receiving | 9/9 | 9/9 | 100.0% | None in landing pass |
| Order Planning | 2/2 | 2/2 | 100.0% | None in landing pass |
| Inventory | 16/16 | 16/16 | 100.0% | None in landing pass |
| Work | 3/3 | 3/3 | 100.0% | None in landing pass |
| Performance Management | 4/4 | 3/4 | 75.0% | Supply Chain Intelligence application error |
| System Management | 6/6 | 6/6 | 100.0% | None in landing pass |
| Shipping | 16/16 | 16/16 | 100.0% | None in landing pass |
| Cross Application | 7/7 | 7/7 | 100.0% | None in landing pass |

## SD-11 Receiving continuation

The table below measures separate Receiving work packages. The original landing sweep above retains its original observation scope.

| Task / measure | Completed / denominator | Progress | State |
|---|---:|---:|---|
| R1 - Scope identities reconciled | 18/18 | 100.0% | complete |
| R2 - Active implementation configuration maps | 17/17 | 100.0% | complete |
| R3 - Menu destinations explained from sources | 9/9 | 100.0% | complete_documentary_scope |
| R4 - Named database dependencies matched | 24/30 | 80.0% | six_snapshot_matches_unresolved |
| R5 - Enablement bindings structurally reviewed | 69/69 | 100.0% | complete_static_scope_runtime_unverified |
| R6 - Detailed live screen reviews completed | 0/9 | 0.0% | expired_session_blocks_continuation |
| R7 - Offline package checks passed | 11/11 | 100.0% | pass |

These percentages measure individual work packages; they are not averaged. SD-11 full Receiving reviews remain 0/9 and installation-wide accepted reviews remain 0/211. The current browser token is expired; prior successful landing evidence remains intact. Configured predicates and source-described effects do not prove live permission, selected-record behavior or service execution.

Read [the Receiving session report](receiving/SESSION_REPORT.md), [functional guide](receiving/FUNCTIONAL_GUIDE.md), [configuration map](receiving/CONFIGURATION.md) and [backend reconciliation](receiving/BACKEND_BINDINGS.md).


Each section has an initial functional note and mapped labels; full per-screen review remains open in every section.

## Completed

- Reviewed Sam's transcript, supplied notes and selected visual frames at a pinned private repository commit.
- Captured 917 FORM rows and classified all 254 screen implementations; preserved inactive and context-dependent entries.
- Captured parts, groups, controls, grid definitions, resource labels and supplementary configuration mappings.
- Mapped 2,306 selected dependency values across 142 screens; 45 candidate values remain omitted. See [dependency mapping](database/DEPENDENCIES.md).
- Navigated all 63 current menu destinations and six additional configured Insight/Monitor routes; recorded outcomes.
- Authored section notes, a current-installation Purchase Order configuration walkthrough, and 254 structural dossiers.

## Pending and access limitations

- Supply Chain Intelligence: configured external application returns an ASP.NET runtime error.
- Five Labor routes: SCALE states that the screen is not licensed. This is the exact observed application category, not a diagnosis of every warning.
- Selected-record Details, context-dependent Transactions, TPM pages, mobile flow states and inactive/legacy entries need their own disposition and applicable functional review; a form-configuration visit is not a runtime visit.
- Shared `/WarehouseMobile` entry does not validate every mobile FORM_ID. Preserve the six previously owner-deferred mobile gaps.
- Action enablement, event/parameter meanings, data-source behavior, conditional criteria, detail tabs and service dependencies remain to be reviewed beyond the demonstrated chain.
- Multi-role/warehouse differences, replica freshness and operational outcomes remain unverified. No configuration save, business transaction, print or export was performed.

See [the roadmap](ROADMAP.md), [the resume entry](RESUME.md), [screen index](screens/INDEX.md), and [completion criteria](reference/COVERAGE_CRITERIA.md).
