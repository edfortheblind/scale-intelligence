# Snapdragon documentation roadmap

Started 2026-10-02. Scope: understand Sam's training, identify installed navigable forms and screens, inspect their functional and configuration surfaces, and preserve source-grounded mapping in this folder.

## Work sequence

1. Review the private `edfortheblind/sp-insight-screen` training repository at an exact commit. Record navigation steps and distinguish demonstrated tenants from the current installation.
2. Discover the installed form/screen/configuration graph from allowlisted, read-only replica configuration metadata and the current user's visible menus. Keep form IDs, screen IDs, screen parts, groups and controls separate.
3. Reconcile actual menu destinations with configured routes. Visit each discoverable safe screen route and record its title, fields, tabs, search/filter controls, actions, child navigation and access outcome.
4. Inspect configuration chains and document what each setting controls, prerequisites and limits. Record visible actions without executing warehouse transactions or saving configuration. Exit configuration inspection through Cancel or X when offered; never Save or OK.
5. Cross-reference product documentation and training. Keep observed behavior, configuration metadata, reference behavior and unverified inference distinct.
6. Produce per-section progress, completed/pending tasks, a resumable inventory and verification receipt. Update counts from explicit denominators; never count an attempted or denied page as successfully inspected.

## Coverage rules

- The initial scope denominator is **unknown until discovery completes**. No overall completion percentage is asserted while it remains unknown.
- Report metadata inventory, route validation, functional documentation and configuration-chain review separately.
- A form can bind multiple screens. A route can repeat in several menu sections. Deduplicate routes for navigation but preserve all menu and configuration relationships.
- Discovery is scoped to the replica snapshot, installed metadata and the current browser role. Hidden, inactive, externally hosted or record-dependent screens remain explicit categories.
- A working page proves availability at the observation time. It does not prove warehouse execution, configuration-save behavior, accessibility acceptance or replica freshness.
- Record malformed application links and access errors individually; do not label every warning as a security violation or every warning as harmless.
- Preserve the existing SCALE corpus and help application, owner-deferred mobile gaps, 0/34 deployment/timing boundary and unrelated `Video Rec/` files.

## Deliverables

| Location | Purpose |
|---|---|
| `training/` | Sam's training review, provenance, demonstrated navigation and caveats |
| `inventory/` | Forms/screens/routes, relationships and coverage denominator |
| `database/` | Metadata collection receipt and configuration mapping |
| `evidence/` | Dated navigation observations with business rows excluded |
| `screens/` | Screen-level functionality/configuration documentation |
| `reference/` | AIM/SDK source-grounded Snapdragon model |
| `tools/` | Bounded collection and documentation verification helpers |
| `STATUS.md` | Current counts, percentages, completed and pending work |

## Current state

The discovery and structural-documentation pass is complete. Read [STATUS.md](STATUS.md) for recomputed percentages and [inventory/tasks.json](inventory/tasks.json) for the task register. All 254 configured screen records have a dossier; all 211 active-form configuration pages were inspected. All 63 visible menu destinations and six additional numeric routes were attempted, with 63 successful runtime landings across the combined 69-route set.

The next work is detailed functional/configuration review: record-dependent detail pages, conditional transaction states, action enablement and dependency semantics. Five Labor routes report not licensed; the external SCI route returns an application error. A loaded screen, a generated dossier and a fully reviewed function retain separate status.

SD-11 Receiving is in progress. The [source/configuration session report](receiving/SESSION_REPORT.md) tracks nine menu destinations, nine directly referenced Form identities and 17 active implementations. The subsequent [Stage session report](receiving/STAGE_SESSION_REPORT.md) records renewed sign-in, all nine Receiving landings, sampled record details and supplemental Warehouse Mobile entry states. Keep Stage observations separate from the retained Production replica snapshot. Remaining branches include empty PO/PO Line inquiries, appointment context, Monitor server errors and unsampled conditional states; the old expired-token observation is historical.

## Recommended continuation order

1. Receiving: complete PO/receipt/line/container record-detail and parameter semantics, using the verified PO chain as the pattern.
2. Order Planning and Shipping: distinguish active Shipment customization from the inactive base, then map planning, packing, QC, container and manifest conditional states.
3. Inventory and Work: map conditional adjustment/transfer entry states, work-order details, criteria groups and action prerequisites.
4. Cross Application, System and Performance: map view/detail dialogs and diagnostic actions; retain SCI and Labor exceptions separately.
5. Review the 28 record-detail templates, 36 contextual transactions, 21 TPM records, mobile entry variants and other non-menu records as explicit categories. Obtain legitimate context through observed navigation; do not fabricate parameters or claim shared routes are separate visited functions.
6. Reconcile configuration semantics and applicable coverage criteria for every active dossier. Do not require warehouse mutations to complete documentary understanding; label any unverified effect accurately.
