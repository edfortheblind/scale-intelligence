# Renewed Stage Receiving and Warehouse Mobile review

Observed 2026-10-02 at **travstg.manhscale.com**, following the owner's renewed sign-in and instruction to continue. Starting commit: `ffbb5d7b230702315c0670449031ad12d23feaad`.

The session reached **all nine Receiving destinations**, inspected the six Insight advanced-field catalogs, opened three real Receipt detail forms and compared selected Putaway action states. Warehouse Mobile supplied a 16-task menu and **15 inspected initial task states** across two passes. Work Execution stayed at menu level because its documented startup can assign work. The expired-token blocker from the earlier Production session did not prevent this Stage review.

Outcome: **DONE_WITH_CONCERNS** for the bounded Stage observation pass. SD-11 remains open for the specific branches below. These observations describe Stage; prior Production replica mappings retain their original evidence scope.

## Progress per task

| Task | Completed / denominator | Progress | Meaning |
|---|---:|---:|---|
| S1 - Receiving destinations inspected | 9/9 | 100% | Each root loaded and its available controls were inspected |
| S2 - Insight advanced-field catalogs | 6/6 | 100% | Catalogs inspected and counted; operand/value behavior sampled |
| S3 - Insight selected-record contexts | 4/6 | 66.67% | Receipt, Receipt Line, Receipt Container and Putaway Group; PO/PO Line inquiries returned no rows |
| S4 - Related Receipt detail forms | 3/3 | 100% | Receipt, Receipt Line and Receipt Container forms opened through real row links and exited without saving |
| S5 - Putaway open/closed action states | 2/2 | 100% | One open and one closed group inspected; no action executed |
| S6 - Exposed calendar view modes | 2/2 | 100% | Day and 7 Days, with Previous/Next/Today navigation |
| S7 - Documented monitor chart levels loaded | 1/4 | 25% | Root date chart loaded; drilldown returned an application error |
| S8 - Workbench selected-receipt context | 1/1 | 100% | Documented read-only Arrow loaded an existing receipt after the lookup button failed |
| S9 - Mobile menu titles documented | 16/16 | 100% | Current visible Stage task menu |
| S10 - Mobile initial task entries inspected | 15/16 | 93.75% | Three initial entries plus 12 follow-up entries; Work Execution retained as an explicit operational boundary |
| S11 - Offline package checks | 11/11 | 100% | JSON, links, graph, identity, fingerprints and existing coverage preservation |

The denominators belong to separate tasks and are not averaged. Selected-record evidence is a sample of actual interface states, not every record condition or role. Full field-label lists are retained for PO, PO Line and Putaway; the three Receipt catalogs retain counts, boundary labels and representative samples. **Full Receiving checklist acceptance remains 0/9; installation-wide full acceptance remains 0/211.** The useful completed work above remains complete. [Machine-readable progress](stage-progress.json) binds these counts to the new observation files.

## What was learned

| Screen | New Stage evidence | Remaining branch |
|---|---|---|
| Purchase Order Insight | 92 advanced fields, sampled text/date operands, grouping dialog and 11 no-selection actions | Three inquiry variants returned no rows; selected PO details/action transitions unavailable |
| Purchase Order Line Insight | 92 advanced fields, numeric operand sample, grid and three disabled no-selection actions | Empty inquiries, including a fresh settled recheck; selected-line context unavailable |
| Putaway Group Insight | 20 advanced fields; open/closed result states; action enablement changed with selection; Containers tile navigated to Receipt Container Insight and Back returned | Ctrl/Shift attempts left one selected row; simultaneous multiple selection unestablished |
| Receipt Insight | 167 advanced fields; real row selection; 18 action labels; Receipt form sections inspected | Other record statuses, permission combinations and operational effects remain unverified |
| Receipt Line Insight | 91 advanced fields; real row selection; three action labels; Receipt Line form sections inspected | Other item/quantity conditions and action service behavior remain unverified |
| Receipt Container Insight | 209 advanced fields; real row selection; nine action labels; Receipt Container form sections inspected | Serial-number panel empty for the selected record; populated/conditional variants remain open |
| Appointment Calendar | Day/7 Days, dock/time layout and range navigation | No appointment event in reviewed ranges; selected appointment preview/details unavailable |
| Receipt Monitoring | Populated root date chart, summaries and indicator labels | Date drilldown and Insight navigation returned an internal server error |
| Receipt Workbench | Initial entry/preference shell; later existing-receipt Arrow load exposed Lines, Containers and Receipt Info | Conditional check-in/locating prompts and operational outcomes remain outside this read-only sample |

The Putaway action comparison was concrete: a closed selected group presented Open enabled and Close/Rename disabled; an open selected group reversed that pattern. The comparison uses rendered disabled classes, not merely the existence of links or a click succeeding.

Receipt selected-row contexts changed enabled action counts, and their real detail links supplied record-dependent form layouts. The guide records labels and sections without retaining receipt identifiers, line/container values or record-bearing query parameters.

Workbench's lookup magnifier initially produced no visible response. A retained primary-source instruction identifies the separate Arrow as loading an entered receipt. A visible Receipt ID was used transiently for that inquiry, without saving the identifier. The successful later load supersedes the initial lack of selected context; it does not erase the lookup observation or count Workbench as a second root.

Mobile's follow-up inspected the remaining 12 safe entries and recorded a disposition for Work Execution. Eleven Back actions returned normally to the menu. In Receipt Container Nesting, Back removed the LP input but left the title and an enabled Go control; a reload restored the menu. No value or Go was submitted, and this observation establishes neither a warehouse mutation nor rollback behavior. The current total is **15/16 entry screens**, with **16/16 menu dispositions** and **0/16 full workflow acceptances**. The original three-entry receipt remains an immutable earlier observation.

Work Execution requires a different scope: a default profile can bypass the selector, and a system-built-cart profile can assign containers before Go. Its [retained procedure](../../SDD/RF/WAREHOUSE_MOBILE_WORK_FLOWS.md#entry-and-profiles) explains that behavior. Opening it merely to inventory fields would exceed this documentation-only pass. The October 1 Mobile walkthrough remains separate historical evidence; its entries are not added to the October 2 numerator.

## Reading paths and evidence

- [Purchase Order, Line and Putaway guide](STAGE_PO_PUTAWAY.md) and [observation receipt](../evidence/stage-po-putaway-runtime.json).
- [Receipt, Line, Container and Workbench follow-up guide](STAGE_RECEIPTS.md) and [observation receipt](../evidence/stage-receipts-runtime.json).
- [Calendar, Monitor and initial Workbench guide](STAGE_MONITOR_WORKBENCH.md) and [observation receipt](../evidence/stage-monitor-workbench-runtime.json).
- [Warehouse Mobile guide](../screens/STAGE_MOBILE.md) and [observation receipt](../evidence/stage-mobile-runtime.json).
- [Remaining Mobile entries and startup boundary](../screens/STAGE_MOBILE_REMAINING.md) and [follow-up observation receipt](../evidence/stage-mobile-remaining-runtime.json).
- [Existing Warehouse Mobile operator manuals](../../SDD/RF/README.md) and [menu-to-procedure source catalog](../../SDD/RF/WAREHOUSE_MOBILE_SOURCE_CATALOG.md#find-a-task-from-the-menu) supply the detailed functional/configuration explanation behind these entry screens. Their 45 retained SRC identities and October 1 observations remain separate from this October 2 Stage pass.
- [Original functional/source explanation](FUNCTIONAL_GUIDE.md), [Production configuration map](CONFIGURATION.md), [backend reconciliation](BACKEND_BINDINGS.md) and [static enablement review](ENABLEMENT.md).

Original AIM/SDK material, replica capture, prior runtime receipts and prior independent audits were preserved. No Stage database collection was performed. Matching Stage routes, labels or individual control IDs do not establish environment-wide parity or remove the six unmatched names in the retained backend reconciliation.

## Remaining work and continuation

1. Obtain legitimate PO/PO Line result context and an appointment event when available; do not manufacture record keys or interpret empty searches as proof that every warehouse is empty.
2. Revisit Monitor's Receipt Type, Vendor and PO drill levels after its application error is resolved, or document their intended behavior with explicit live limitations. No application repair or settings change was authorized by this review.
3. Continue the unsampled lookup, field-validation, multiple-selection, serial/lot and other conditional branches that can be inspected without a warehouse mutation. Record operational boundaries using source/configuration evidence.
4. Preserve the Stage/Production distinction when explaining configuration and dependencies. The current pass supplies installed Stage UI evidence alongside the retained Production snapshot.
5. Continue SD-12 Order Planning/Shipping as the next independent section while retaining SD-11's exact remaining branches. Mobile entry coverage is now 15/16; Work Execution and downstream transactional paths need a separately bounded operational context. The six owner-deferred mobile contracts remain unchanged.

## Verification and boundaries

`python Snapdragon/tools/build_coverage.py` regenerates current status from both the original scope and the new Stage progress. `python -m compileall -q Snapdragon/tools`, `python Snapdragon/tools/verify_snapdragon.py` and `git diff --check` are the package checks. The final verifier records **11 passed, 0 failed, 0 skipped** in [verification.json](../evidence/verification.json). Independent review of the Receiving artifacts is saved in [stage-independent-review.json](../evidence/stage-independent-review.json); its author's Mobile observations are excluded from that independent verdict. The coordinator separately passed [seven initial Mobile receipt consistency checks](../evidence/stage-mobile-coordinator-review.json). A different reviewer checked [both Mobile passes and their source boundary](../evidence/stage-mobile-independent-review.json). These document reviews do not claim a second live traversal.

No warehouse action, operational API/routine, configuration save/publication or print/export occurred. Business-record values were omitted from the documentation and saved evidence. Unsaved dialogs were exited with Cancel/Escape; the editable detail forms were inspected without changes. The user's Dashboard/Mobile tabs were preserved and temporary inspection tabs closed. The unchanged help-app regression suite and real-role accessibility acceptance were not rerun. Deployment/correlated timing stays **0/34** under the existing freeze.

Delivery axis: new Stage documentation and explicit task percentages. Product axis: useful live navigation evidence with named remaining branches. Gate-authority axis: read-only documentation under the owner's authorization; no operational acceptance or configuration-publication authority is inferred. Git publication and remote parity are verified after final packaging and reported in the session handoff.
