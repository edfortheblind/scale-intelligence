# C37 direct column navigation

October 8, 2026. The owner approved C36 and requested "approved, continue" at `e5ca3bc03b592b0c25f36fc14da88465f6c4fe5b`.

Outcome: DONE_WITH_CONCERNS

Delivery state: Programming lookup now links each matching column directly to its captured table row. Commit and remote parity are verified separately at publication.

Product state: The bounded navigation improvement is complete. It adds no source meaning, runtime finding or article-retrieval recovery.

Gate/authority state: Existing source/help and programming-export publication authority applies. Six mobile contracts remain owner-deferred and deployment/correlated timing remains frozen at **0/34**. No new JAWS or intended-user acceptance is claimed.

## Concrete improvement

Column lookup previously showed matched names as plain text and linked only to the table's beginning. Eighty captured tables have more than 50 columns; the largest have 280. For example, finding `IN_PRE_CHECKIN_CTR_CREATION` in `dbo.RECEIPT_HEADER` still required navigating to its 83rd captured column.

Each matching column now has a separate link to a focusable, highlighted row such as `/programming/object/1599344762#column-83`. Link labels include the containing table. Destinations use the captured `column_id`, preserving sparse IDs and exact names. Existing object links, lookup API fields, ordering, pagination and matched-column strings remain unchanged.

The implementation adds a private name-to-ID map to the existing library and optional row IDs to the existing table renderer. Its default rendering is unchanged. The existing scrollable region and focus styling are reused; a scoped target highlight and scroll margin keep the selected row visible. No dependency, script, route, configuration, parser or source regeneration was added.

## Verification

- **127 tests passed**, zero failures/skips: the previous 124-test scope plus three regressions covering exact and partial matches, sparse IDs, contextual link labels, inert unusual names, unchanged API fields and the default table-rendering contract.
- All **16,968 captured column destinations** across **518 table pages** were unique, focusable and reached by rendered matching-column links. Eight literal identifier queries exercised **229 catalog pages and 82,410 link occurrences**. Every checked programming API payload matches the prior implementation. These are navigation checks, separate from semantic article retrieval.
- All **997 routine pages and eight procedure/reference guides** render exactly as before. Removing only the new row ID/focus attributes restores each table page to its C36 HTML, including all relationship evidence. The original 4,033-file export manifest passed without resealing. [Corpus verification](programming-column-verification-c37-20261008.json) records the checks and code identity.
- Fresh served HTTP evaluation preserves all **723 complete article case records**: **723 selected-topic contracts, 676 top-eight, 419 first and 47 misses**. Only the implementation fingerprint changed in `help_app/evaluation.json`.
- A separate fresh-context reviewer passed the frozen code/CSS patch with no blockers or minimality findings. Independent synthetic checks covered 28 baseline/current API payloads, default table output, sparse IDs, escaping and invalid row counts. The reviewer did not author/design the patch or rerun the integrated suite.
- Local Brave checks verified keyboard activation reaches and focuses `column-83`, the captured six-cell row is correct, and the target is visibly highlighted. At 320 px, both lookup and detail pages had 305 px client/scroll widths. Shift+Tab reached the table region and ArrowRight scrolled horizontally. The initial top-edge focus clipping was corrected with a 1rem scroll margin and verified at approximately 16 px below the viewport top.
- Guide-manifest and whitespace checks passed. The task tab was closed, viewport reset, and the identified preview listener on port 52748 was stopped and verified absent. Source exports, historical receipts, article/guide inputs and unrelated Video Rec remain unchanged.

The [checkpoint](continuation37-20261008.json) records commands, preserved evidence, review hashes and output identity. Broad generators, database/runtime checks, completion-report regeneration and JAWS acceptance were not run.

## Continuation

The column-navigation concern is resolved. Preserve capture-bound column IDs, exact source names, the existing lookup API and C36 relationship qualifications. Continue from another concrete source/usability concern; do not reopen accepted work without changed inputs. The **47 article misses**, unresolved source questions, six mobile deferrals and **0/34** deployment/timing freeze remain. Git publication does not establish OneDrive upload, current live schema or deployment.
