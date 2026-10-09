# Resume Snapdragon mapping

## Current owner decisions - 2026-10-09

Use the root [OPEN_ISSUES.md](../OPEN_ISSUES.md) for remaining decisions; it supersedes conflicting next-step wording below. **Mobile initial task entries are closed at the accepted historical 15/16 sampling limit. Performance Management is closed because SCI will not be used.** Do not retry SCI, enter Work Execution or reopen those sections through the full-review backlog.

Receiving dependencies, full applicable criteria, Receiving detailed reviews/selected contexts and six mobile procedure-source gaps are now decision entries OI-01 through OI-05. Five unlicensed Labor routes have a separate applicability entry OI-09. Requested Stage Monitor depth remains complete at 4/4; optional environment parity is OI-10. No new UI/database work is authorized by this register. Existing observation counts and JSON receipts retain their dated meaning. Preserve this current decision section if generated status is refreshed.

The [historical runtime register](../DB%20Architecture/HISTORICAL_RUNTIME_IDENTITIES.md) closes that separate documentation task at 163/163 documented IDs. Deployment/timing remains frozen at 0/34. Existing-target publication authority is recorded in the [October 8 owner instruction](../_project/publication-authority-20261008.json); older private-only wording below is historical.

1. Read the latest owner instruction, [STATUS.md](STATUS.md), [inventory/coverage.json](inventory/coverage.json), [inventory/tasks.json](inventory/tasks.json) and the [verification receipt](evidence/verification.json). Inspect Git state before changing files; preserve unrelated `Video Rec/`.
2. Use [screens/INDEX.md](screens/INDEX.md) and `inventory/screen-registry.json` as the 254-screen snapshot. The 917 FORM rows are not 917 navigable Insights. Preserve 43 inactive records and the base/custom distinction for Shipment form 2735.
3. Do not repeat Sam's transcript review, the 63-menu landing sweep, the six supplemental route checks or the completed 211-form configuration sweep unless new evidence or changed configuration warrants it.
   For SD-11, first read the [focused continuation report](receiving/FOCUSED_SESSION_REPORT.md) and [owner acceptance](receiving/owner-acceptance.json). Prior delivered work is accepted with its reported limits. The requested Monitor chart-level measure is complete at 4/4 in an alternate Stage warehouse. Selected-record contexts remain 4/6; preserve the recorded expired-session attempts separately from successful observations.
4. On October 8, renewed Production access allowed eight valid PO/PO Line inquiries across both offered warehouses, with Include Closed off/on; all returned zero rows. The original warehouse was restored. The owner clarified **"Travis doesn't use PO."** Read the [dated receipt](evidence/selected-context-production-20261008.json). Keep the two selected contexts unobserved and S3 at 4/6; do not infer database-wide absence or technical acceptance. **No further automatic PO discovery or fake-record creation is pending.** Only resume these branches on a separate owner request with a suitable populated context. Rediscover current tabs if needed; do not reopen accepted packages or broaden to other roadmap tasks automatically.
5. Inspect conditional tabs/criteria, selected-record detail layout, action enablement and corresponding event/parameter/data-source semantics. Start from the [selected dependency values](database/DEPENDENCIES.md) already mapped into dossiers; do not repeat their collection. Describe the result for an operator, then bind the claim to exact evidence. Complete every applicable item in [COVERAGE_CRITERIA.md](reference/COVERAGE_CRITERIA.md) before marking a dossier fully reviewed.
6. Attribute application failures precisely. Five Labor routes state `not licensed`; SCI returns an ASP.NET runtime error. Do not generalize those outcomes to other warning links. Use existing configured/observed alternatives and the working form route. No settings/permission/license changes follow from this documentation task.
7. Keep Warehouse Mobile and RF landing observations separate from actual mobile workflow traversal. The six previously owner-deferred mobile procedure gaps remain deferred. Preserve existing corpus/help acceptance and the 0/34 deployment/timing boundary.
8. Exit configuration through Cancel or X, never Save/OK/Publish/Activate/Deactivate/Delete. No transactions, prints or exports are required to document a UI control. Raw query bodies, application rows, credentials and saved-search/account values must not be copied into this folder.
9. Save new evidence incrementally, then regenerate only affected outputs with the commands below. A dated focused inquiry receipt requires coverage regeneration; it does not require structural dossier regeneration unless dossier inputs changed. Verify local links, JSON, graph joins, source hashes and provenance; record exact checks. Normal authorized publication is to the existing private `edfortheblind/scale-intelligence` repository only, without force or unrelated files.

```powershell
python Snapdragon/tools/build_screen_dossiers.py
python Snapdragon/tools/build_coverage.py
python Snapdragon/tools/verify_snapdragon.py
git diff --check -- Snapdragon
```

Do not rerun the live database collector to regenerate prose: the retained metadata suffices. Any later refresh must use its explicit fixed-query modes and private credential path, and must keep SQL/code expressions outside the synchronized tree.

Prior browser inventories retain their dated meaning. The October 8 inspection preserved unrelated user tabs and restored the original warehouse. Inspection tabs are temporary; rediscover current state instead of relying on old tab IDs. Evidence files preserve observation time rather than claiming a permanently available session.
