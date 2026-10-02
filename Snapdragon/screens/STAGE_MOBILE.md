# Stage Warehouse Mobile: current menu and safe entry states

The renewed **Stage** session at `travstg.manhscale.com` loaded Warehouse Mobile on 2026-10-02. This pass documented all **16 visible task titles** and opened **three initial states** without submitting data. It does not complete a mobile workflow or close any of the six previously owner-deferred mobile procedure gaps.

[Sanitized observation receipt](../evidence/stage-mobile-runtime.json). Notes were recorded from 17:52 to 17:54 UTC; the inspection tab closed at 17:55 UTC. These are browser observation notes, not server or process timings.

| Measure | Completed / denominator | Percentage |
|---|---:|---:|
| Visible menu task titles documented | 16/16 | 100% |
| Initial task entries inspected | 3/16 | 18.75% |
| Navigation returns verified | 3/3 | 100% |
| Full task reviews accepted | 0/16 | 0% |

These measures are separate. Four states were observed: the menu plus three initial task states. Thirteen task entries remain unvisited; their presence in the menu does not establish availability or a safe startup effect.

## Current visible task menu

- Assign Printer
- Close Container
- Close Putaway Group
- Cycle Count Reconciliation
- Immediate Dock Transfer
- Inventory Management
- Clear Putwall Location
- Location Inquiry
- Multiple Order Pallet Nesting
- Putwall Sort
- Receipt Container Nesting
- Receiving
- Remove Cart Container
- Work Execution
- Shipping Container Nesting
- Shipping Container QC

No Form or SRC identifiers were exposed in this pass. Titles were not used to infer a mapping to existing procedure contracts.

## Safely inspected initial states

| Menu entry | Resulting screen | Observed controls and stopping point |
|---|---|---|
| Location Inquiry | Location Inquiry | Blank `Filter On Location, Item, or LP` field, Back arrow and Go. No value entered; Go was not invoked. |
| Receiving | Select Receiving Preference | One available choice and a Back arrow. No preference selected; the choice value was not retained. |
| Inventory Management | Select Adjustment Class | Adjustment, Status Change, Transfer and Warehouse Transfer choices, plus Back arrow. No class selected. |

The footer Back arrow returned to the Warehouse Mobile menu after each observation. No operational Cancel control was used. No search result, receipt, item, license plate, location or work identifier was retained.

A title wait initially expected `Receiving`; the actual state was `Select Receiving Preference`. A fresh DOM snapshot resolved that mismatch without another task click. The SPA also retained prior-state nodes briefly in one accessibility snapshot; current visible DOM snapshots established the actual menu returns.

## Remaining boundaries

The other thirteen task entries were not opened. Their startup behavior, possible work assignment and required context remain unverified. Work Execution was not started. Assign Printer was not opened or changed. Container/group closing, putwall, nesting, quality, transfer and reconciliation actions were not executed.

No application access or expired-token error appeared in the three inspected entry states. This observation does not establish availability for the unvisited entries, other roles, other warehouses or PROD. The earlier PROD session-error evidence remains a separate observation.

Further task entry should follow an established navigation-only startup boundary, then stop before entering/submitting warehouse data or accepting work. Any full procedure review still needs the applicable [coverage criteria](../reference/COVERAGE_CRITERIA.md), exact identity/source mapping and recorded remaining operational limits. The six owner-deferred mobile procedure gaps are unchanged.

## Preservation and verification

Only labels, menu structure, navigation outcomes and sanitized state notes were retained. No credentials, storage, account values, receiving-preference values, business rows, IDs, screenshots, prints or exports were retained. No configuration or security setting was changed.

Temporary tab `986568767` was closed and its absence verified. The owner's Warehouse Mobile tab `986568764` and Dashboard tab `986568705` remained open and unmodified. This note is supplemental to [Snapdragon status](../STATUS.md) and the [Receiving continuation](../receiving/SESSION_REPORT.md); it adds no full Receiving-screen acceptance.
