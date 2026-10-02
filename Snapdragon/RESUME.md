# Resume Snapdragon mapping

1. Read the latest owner instruction, [STATUS.md](STATUS.md), [inventory/coverage.json](inventory/coverage.json), [inventory/tasks.json](inventory/tasks.json) and the [verification receipt](evidence/verification.json). Inspect Git state before changing files; preserve unrelated `Video Rec/`.
2. Use [screens/INDEX.md](screens/INDEX.md) and `inventory/screen-registry.json` as the 254-screen snapshot. The 917 FORM rows are not 917 navigable Insights. Preserve 43 inactive records and the base/custom distinction for Shipment form 2735.
3. Do not repeat Sam's transcript review, the 63-menu landing sweep, the six supplemental route checks or the completed 211-form configuration sweep unless new evidence or changed configuration warrants it.
   For SD-11, first read the [focused continuation report](receiving/FOCUSED_SESSION_REPORT.md) and [owner acceptance](receiving/owner-acceptance.json). Prior delivered work is accepted with its reported limits. The requested Monitor chart-level measure is complete at 4/4 in an alternate Stage warehouse. Selected-record contexts remain 4/6; preserve the recorded expired-session attempts separately from successful observations.
4. Resume the remaining Purchase Order 2796 and PO Line 2797 selected-record contexts when an authenticated, populated context is available. Both connected browser and user-tab inventories last showed the owner's tabs on Stage; a Production PO handoff tab still reported an expired token. Rediscover current tabs and verify the actual host/session. Resolve record context through legitimate visible read-only links; do not invent record IDs or invoke business actions. Do not reopen accepted packages or broaden to other roadmap tasks without a new owner instruction.
5. Inspect conditional tabs/criteria, selected-record detail layout, action enablement and corresponding event/parameter/data-source semantics. Start from the [selected dependency values](database/DEPENDENCIES.md) already mapped into dossiers; do not repeat their collection. Describe the result for an operator, then bind the claim to exact evidence. Complete every applicable item in [COVERAGE_CRITERIA.md](reference/COVERAGE_CRITERIA.md) before marking a dossier fully reviewed.
6. Attribute application failures precisely. Five Labor routes state `not licensed`; SCI returns an ASP.NET runtime error. Do not generalize those outcomes to other warning links. Use existing configured/observed alternatives and the working form route. No settings/permission/license changes follow from this documentation task.
7. Keep Warehouse Mobile and RF landing observations separate from actual mobile workflow traversal. The six previously owner-deferred mobile procedure gaps remain deferred. Preserve existing corpus/help acceptance and the 0/34 deployment/timing boundary.
8. Exit configuration through Cancel or X, never Save/OK/Publish/Activate/Deactivate/Delete. No transactions, prints or exports are required to document a UI control. Raw query bodies, application rows, credentials and saved-search/account values must not be copied into this folder.
9. Save new evidence incrementally, then regenerate structural dossiers and coverage with the commands below. Verify local links, JSON, graph joins, source hashes and provenance; record exact checks. Normal authorized publication is to the existing private `edfortheblind/scale-intelligence` repository only, without force or unrelated files.

```powershell
python Snapdragon/tools/build_screen_dossiers.py
python Snapdragon/tools/build_coverage.py
python Snapdragon/tools/verify_snapdragon.py
git diff --check -- Snapdragon
```

Do not rerun the live database collector to regenerate prose: the retained metadata suffices. Any later refresh must use its explicit fixed-query modes and private credential path, and must keep SQL/code expressions outside the synchronized tree.

The owner's original three browser tabs were preserved. Inspection tabs are temporary; rediscover current state instead of relying on old tab IDs. Evidence files preserve observation time rather than claiming a permanently available session.
