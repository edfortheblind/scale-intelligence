# C36 table-to-routine relationship evidence

October 8, 2026. Continues `83a64a7f866080311c1556087522f199efe4404d` under the owner's "Continue."

Outcome: DONE_WITH_CONCERNS

Delivery state: Table pages in the local programming browser now group related routines by their retained evidence and expose exact qualifications beside each link. Commit and remote parity are verified separately at publication.

Product state: The bounded presentation change is complete. It adds no relationship, source review, runtime finding or retrieval recovery.

Gate/authority state: Existing source/help and programming-export publication authority applies. Six mobile contracts remain owner-deferred; deployment/correlated timing remains frozen at **0/34**. Independent review is technical evidence, not new owner or JAWS acceptance.

## Concrete improvement

C35 table pages listed all related routine names together, while the evidence explaining each relationship remained inside separate raw metadata. For `dbo.RECEIPT_HEADER`, that list included 60 routines spanning direct/reviewed references, possible delegation and comment-only mentions.

The table page now has three expandable groups: **Direct static references or reviewed effects**, **Possible delegated access**, and **Mentions and unresolved candidates only**. Each routine has its retained classification and an expandable **Relationship evidence** record. Groups overlap when the source supplies multiple evidence channels; their counts must not be added as unique routines. RECEIPT_HEADER has 43, 15 and 45 memberships respectively, still covering the same 60 routines. The comment-only `dbo.PM_RECEIPTHEADER01` retains source line 17 and `counts_as_routine_reference: false`.

The renderer reuses the existing export correlation function and exact comment records. It filters to the original priority list, preserves reviewed scope and bounded path examples, and retains any unmatched priority ID with an explicit unavailable-classification explanation. No unmatched IDs occur in this capture. No parser, index, route, dependency or configuration was added.

## Verification

- **124 tests passed**, zero failures/skips: the 121-test C35 scope plus three relationship regressions. Tests cover overlapping channels, comment-only evidence, reviewed scope, bounded paths, escaping, non-priority exclusion, unmatched IDs and empty lists.
- All **518 table pages** were rendered and compared against C35. Their HTML outside Related routines is unchanged. All **997 routine pages** are byte-identical to C35 rendering.
- All **7,629 relationship evidence records** across **4,224 distinct routine/table pairs** match the already exported routine evidence exactly. There are zero evidence mismatches, missing priority IDs or unclassified priority IDs. The existing 4,033-file manifest was verified by the library without regeneration. [Corpus verification](programming-relationships-verification-c36-20261008.json) records exact counts and the renderer hash.
- Fresh served HTTP evaluation preserves all **723 complete case records**: **723 contracts, 676 top-eight, 419 first and 47 misses**. Only the implementation fingerprint changed in `help_app/evaluation.json`.
- A fresh-context reviewer identified the original concern, independently checked export correlation, then reviewed the frozen patch and synthetic boundary checks. Final review passed with no blockers. The reviewer did not author the implementation or claim to rerun the integrated test suite.
- Local Brave checks verified Enter on group disclosures, Space on nested evidence, comment-only qualification, Tab focus and keyboard navigation to the linked routine. The expanded table view at 320 px had 305 px client/scroll widths. These are bounded technical checks; no JAWS or intended-user acceptance is claimed.
- Guide-manifest and whitespace checks passed. Exact SQL/layout exports, source corpus, historical receipts and unrelated Video Rec remain unchanged. The preview tab was closed, viewport reset, and the identified loopback listener on port 65094 was stopped and verified absent.

The [checkpoint](continuation36-20261008.json) records commands, preservation, review hashes and changed-output identity. Broad corpus generators, database checks and the completion-report generator were not run: this change affects only relationship presentation, tests and the current handoff.

## Continuation

This relationship-navigation concern is resolved. Preserve the three evidence groups and their overlap; do not turn static references, reviewed effects, mentions or paths into execution claims. The C33 remainder still governs the **47 article misses** and unresolved source questions. Further work needs a concrete source or usability concern. Current live schema, runtime, deployment/timing and deferred mobile work remain outside this checkpoint. Git publication does not establish OneDrive upload or deployment.
