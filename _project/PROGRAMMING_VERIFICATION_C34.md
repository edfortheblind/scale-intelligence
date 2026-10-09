# C34 programming export verification

October 8, 2026. Continues `ab157fe2220314b71627459d15cad780fe2fe48a`.

Outcome: DONE_WITH_CONCERNS

Delivery state: The programming export verifier now checks the complete retained artifact manifest. The bounded defect is fixed and verified. Commit and remote parity are verified separately at publication.

Product state: The existing 921 procedures, 76 functions and 518 table layouts remain unchanged. The correction prevents verification from silently accepting changed routine documentation. It adds no source review, warehouse behavior or deployment evidence.

Authority state: The owner instructed, "all approved until now, continue with the next task". This continues the approved programming-reference work and existing publication authority. The six mobile deferrals and 0/34 deployment/timing freeze remain in force.

## Defect and correction

The earlier `--verify-only` command checked captured SQL, selected structured fields, source bindings and local links. Routine folder manifests did not enumerate every Markdown/JSON file. The command then regenerated the global manifest after a passing check. A changed routine explanation, retained contract or table-reference record could therefore pass and become the newly recorded baseline.

Three regression methods reproduced four failures against the prior implementation: changed routine Markdown was accepted; changed contract and table-reference JSON were accepted; and check-only verification rewrote existing evidence. This identifies a verifier gap, not evidence that the delivered exports were corrupted. The original independent review remains a dated separate check.

Verification now compares all files in the three export folders against the existing global manifest, including indexes and folder manifests. It checks exact inventory membership, unique canonical paths, byte counts and SHA-256 values. Missing, added, renamed, malformed or changed artifacts fail. A missing or invalid manifest fails without recreation. Inventory failure occurs before exported JSON is parsed.

`--verify-only` is read-only by default, including on failure. An optional `--verification-output NEW_PATH.json` saves a new receipt without replacing existing artifacts or entering the source snapshot/export folders. Deliberate rebuilds may establish a new manifest only after source/structural checks and candidate inventory checks pass. The manifest is a local integrity baseline, not an independently signed authenticity guarantee.

## Verification

- **71 tests passed**, zero failures or skips: 13 new verifier tests and 58 existing routine, table, comment and correlation tests. Synthetic build tests exercise successful baseline promotion and failed-build preservation; no full production-corpus rebuild was needed.
- Fresh offline verification passed against the unchanged retained manifest: **4,033 files**, **997 exact routine definitions**, **518 tables**, **16,968 table columns**, **34,742 captured metadata rows**, **58 source-file hashes** and **24,286 local links**. See the [new C34 verification receipt](programming-layout-verification-c34-20261008.json).
- The retained global manifest SHA-256 remains `0af82d1ea9113d10148aea03b4262d85d50de4514d53d7ed4ccb1cc4f4943ac9`.
- Independent review passed 22 manifest checks and three CLI checks covering changed SP/function Markdown and JSON, missing/duplicate manifest rows, unsafe paths, malformed hashes/counts, missing indexes, extra/nested artifacts and invalid JSON. These checks preserved the retained baseline. The [C34 checkpoint](continuation34-20261008.json) records commands, artifact hashes and review scope.
- Original layout files, exact SQL, private snapshot, prior manifests and historical receipts remain unchanged. Article/guide code and evaluation inputs are unchanged; C33's **676/723 top-eight, 419 first and 47 misses** remain prior evidence, not a newly run retrieval evaluation.

Commands:

```powershell
python -m unittest tests.test_programming_layout_verification tests.test_routine_layouts tests.test_table_layouts tests.test_programming_layout_mentions tests.test_table_usage
python tools/build_programming_layout.py --verify-only --verification-output _project/programming-layout-verification-c34-20261008.json
git diff --check
```

No database connection, routine execution, deployment, source regeneration, browser/JAWS acceptance or OneDrive upload was performed. Untracked `Video Rec/` remains outside this change.

## Continuation

The integrity correction is complete. Use the current [programming reference](../DB%20Architecture/PROGRAMMING_LAYOUT.md) and its check-only command for future inspection. Further work needs a concrete source, programming-navigation or help concern; do not reopen completed corpus reviews, owner-deferred mobile work or operational evidence collection automatically. The [C33 remainder](CONTINUATION_C33.md#remaining-work-and-evidence-boundaries) retains the unresolved source and retrieval boundaries.
