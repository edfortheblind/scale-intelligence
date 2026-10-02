# Stage Calendar, Monitor and Workbench review

The initial pass was recorded on **2026-10-02 at 18:00:32 UTC** in the renewed `travstg.manhscale.com` session. All **3/3 assigned menu roots loaded (100%)**. That pass recorded **0/3 full applicable reviews** because record-dependent branches and monitor navigation could not be completed. The separately dated Workbench follow-up below adds later context; the original three-root/25-state receipt and its counts remain unchanged. This is a Stage observation; matching routes and titles do not establish equivalence to the retained Prod replica configuration.

[The sanitized receipt](../evidence/stage-monitor-workbench-runtime.json) records actions, outcomes, boundaries and cleanup. Existing Prod metadata and earlier evidence were not changed. Calendar **4069** and Workbench **4038** are retained reference identities; their Stage configuration IDs were not independently inspected. Monitor **4106** appears explicitly in its runtime URL.

| Root | Entry path | Initial-pass verified surface | Initial-pass limitation |
|---|---|---|---|
| Appointment Calendar | `/scale/trans/apptschedule` | Day/7 Days; dock/time layout; previous/next/Today; Actions menu | No appointment event available for selected-record preview in reviewed current ranges |
| Receipt Monitoring | `/scale/monitors/4106` | Root date chart, totals, indicator labels and breadcrumb | Date drilldown and Insight link returned application server errors |
| Receipt Workbench | `/scale/trans/receiptWorkBench` | Receipt/preference entry, preference options and Actions menu | Receipt lookup produced no dialog/grid/navigation after two attempts |

## Appointment Calendar

The calendar renders Dock Doors against hourly time columns. **2/2 exposed view modes** were exercised: **Day** and **7 Days**. Seven-day Previous/Next moved the range backward/forward by a week; **Today** restored the current range and became disabled. Returning to Day restored the single-day view. All **3/3 navigation controls**—Previous, Next and Today—were exercised. No Month button was exposed, so a Month view was not invoked or inferred.

Actions exposed **New**; it was observed without invocation. Loaded dock resources were present, but the reviewed current-day and seven-day views contained no rendered appointment events. This leaves appointment preview fields, selected-record action availability, View/Edit distinctions and record return behavior unreviewed. It does not establish that other ranges, roles or warehouses have no appointments.

The initial asynchronous shell briefly lacked resource rows; subsequent loaded inspection showed them. The empty shell was not treated as an empty warehouse. No appointment was created, dragged, resized, edited or saved.

## Receipt Monitoring

The root chart **Receipts By Receipt Date** populated with the categories **Past due, Today, Tomorrow, This week, This month and Future**. The total panels were **Total Receipts, Total Receipt Lines and Total Receipt Value**. The three indicator tiles were **Receipts Over 24 Hours Old**, **Pending Putaways Over 4 Hours Old**, and **Receipts With QC**. Numeric results are intentionally absent from this documentation.

The observed hierarchy control was a breadcrumb; no native select dropdown was present. Clicking the rendered **Past due** bar added a receipt-date breadcrumb but retained the root chart and displayed:

> Internal server error. See the audit log for more information.

The **Receipt Dates** breadcrumb returned to the root. After that state settled, **Insight** produced the same server-error category. The URL remained on the monitor and no Receipt Insight criteria/grid or new tab loaded. Further monitor branches stopped after these two equivalent errors; no server cause is inferred.

Only **1/4 documented chart levels** loaded: Receipt Dates. The denominator comes from the [documented monitoring hierarchy](FUNCTIONAL_GUIDE.md#receipt-monitoring--form-4106), source A07 nodes n113–125: Receipt Dates → Receipt Type → Vendor Name → Purchase Order. Receipt Type, Vendor Name and Purchase Order remain unvisited downstream states. The three indicator destinations and Refresh were visible but not exercised. The captured static monitor procedures and the product-described hierarchy remain separate evidence; this observation does not verify their Stage execution or effective configuration.

## Receipt Workbench

The entry shell exposed **Receipt ID**, its enabled lookup magnifier and **Receiving Preference**, together with Refresh, New, Actions, a right-arrow control and a Plus control. Actions expanded to **Cancel** and was collapsed without executing it. The preference dropdown opened with existing options; no selection was changed and option values were not retained.

The receipt lookup magnifier was clicked twice, with intervening state checks. Neither attempt produced a visible lookup dialog, result grid, new tab or route change. No explanatory error message appeared. The recorded category is **no visible response**, not an assumed permission or server diagnosis.

No selected receipt context was obtained in the initial pass. Lines, Containers, nested container sections, result-grid behavior, record details, conditional prompts and context-dependent action enablement were therefore unvisited in that receipt. Check In, Locate, transaction Cancel, New Line, Quick Scan, print/export, save/OK and other operational controls were not invoked. The right-arrow and Plus controls were not used without a selected receipt context during that pass.

## Workbench follow-up — 2026-10-02, 18:14–18:18 UTC

A separate [Stage receipt review and Workbench follow-up](STAGE_RECEIPTS.md#workbench-follow-up) subsequently supplied a legitimate existing-receipt key transiently from the visible Receipt Insight. The documented **Arrow** load was used, following [Workbench source guidance](FUNCTIONAL_GUIDE.md#receipt-workbench--form-4038), A09 node n253. The receiving preference was unchanged, and no processing action was invoked.

That follow-up loaded **Lines, Containers and Receipt Info (3/3 sections)**; both grids contained rows. It inspected the unselected-container Actions menu and visible processing-control labels. This supplies later selected-receipt surface evidence through the Arrow entry path. The earlier magnifier's no-visible-response outcome remains recorded, while selected-container state, nested-child navigation and conditional prompts remain unreviewed. The linked follow-up owns its separate evidence and counts; the initial 25 states are not counted again as completed roots.

## Initial-pass coverage boundaries

| Criterion | Calendar | Monitor | Workbench |
|---|---|---|---|
| Title and landing route | Observed | Observed | Observed |
| Exposed navigation | Day/week/range controls observed | Root breadcrumb observed; drilldown/Insight errors | Entry controls observed; lookup has no visible response |
| Search and list | Calendar view navigation applies; no Insight criteria/grid exposed | Chart context applies; no Insight criteria/grid exposed | Lookup criteria/grid remain unvisited |
| Selected-record details | Blocked by no visible appointment event | Downstream chart/context blocked | Blocked by missing selected receipt |
| Actions | New label observed | Insight attempted; tile destinations unvisited | New/Cancel labels observed; operations unexecuted |
| Configuration/dependencies | Stage metadata unreviewed | Stage bindings/effective indicator setup unreviewed | Stage bindings/preference behavior unreviewed |

The review used one temporary tab, which was closed. The user's Dashboard and Warehouse Mobile tabs and the other agents' tabs were preserved. No business row values, record IDs, aggregate values, account/warehouse values, preference values, raw snapshots or screenshot files were saved. No DB connection, direct API request, configuration save, print/export or warehouse operation occurred. The six deferred mobile gaps and **0/34 deployment/timing freeze** remain unchanged.
