# C25 searchable Warehouse Mobile guides and source corrections

Outcome: DONE_WITH_CONCERNS

Delivery state: The accepted Warehouse Mobile/RF and Cross Application manuals are now readable and searchable inside the local application. Source corrections, accessible navigation and verification receipts are implemented. Normal private publication and final Git parity are verified separately after commit.

Product state: Six procedure guides supply 154 searchable sections; the linked central functionality reference is also readable. Source views bind 87 cited articles and three explicit evidence records. These are application-content counts, not proof of 87 complete operational walkthroughs. The RF catalog contains 82 selected articles and still maps all 45 retained SRC identities and 16 previously observed menu choices.

Gate/authority state: The owner accepted all work presented through C24 and authorized continuation and concern resolution. This batch adds local application behavior and retained-source corrections. No new installed SCALE interaction, warehouse transaction, database connection, acquisition retry or deployment/timing work was performed. Owner acceptance of C24 does not substitute for new execution evidence or new usability acceptance.

## What now works

Open the application with `python tools/serve_help.py --port 8765`. **Detailed procedure guides** on the home page, or `/guides`, opens the full task manuals. Home-page search presents **Procedure guide matches** with direct links to relevant sections. Articles retain their existing result order and API contract. The guide index uses section text and headings; neither authored evaluation questions nor expected destinations enter either search index.

Each guide supplies a contents list, numbered steps, tables and source links. Source views show inert retained text with node identities; they do not activate original scripts, forms, live application URLs or figures. Evidence views display only explicitly listed JSON records without following paths inside them. The central reference's source-binding register is available through its existing link. Unknown resources and mutations remain rejected.

The guide manifest checks document, structured-source, original-source and evidence hashes at startup. `python tools/build_help_guides.py --check` verifies current bindings without rewriting. The reader supports the actual reviewed Markdown vocabulary; unsupported nested lists, fenced code, blockquotes and images fail rather than silently flattening future content. This is not a general Markdown engine.

## Concerns resolved or clarified

- **Document Management:** its dedicated retained article was found through content/search references outside the current TOC. The Cross Application guide now documents Basic Criteria, Apply Filter, List Pane and Detail Pane using exact source nodes. Upload/edit/delete behavior remains unestablished; Manage SOPs remains a different interface.
- **SRC source coverage:** a second retained registry adds corroboration for 44 shared entries. Its labels agree with the 45-entry registry; SRC450 is absent from the alternate list. The union stays 45, with no inferred release order or installed configuration.
- **Over Picking and generic menu labels:** a separate field definition corroborates the configuration meaning without erasing the contradictory mobile action text. A source-backed viewing procedure explains how an administrator can inspect menu/SRC associations. That installed lookup was not performed.
- **Accessible reading:** source abbreviations now have descriptive accessible names; source titles prefer the body heading when metadata names a neighboring screen. Heading depths retain their logical levels, including the deepest GS1 source level through ARIA semantics. The retained source's unusual heading structure is preserved. Narrow tables preserve words and identifiers inside keyboard-scrollable regions. All indexed heading targets exist and accept focus.

## Verification

The [machine-readable receipt](continuation25-20261001.json) binds final output bytes and check results. The [guide evaluation](guide-evaluation-c25.json) preserves all 24 independently authored questions, expected destinations, actual results, source justifications and meaning-review findings.

- `python -m unittest tests.test_help_guides tests.test_help_app tests.test_help_articles tests.test_retrieval`: **exit 0; 63 passed, zero failed, zero skipped**. Fourteen guide tests supplement the 49 existing application/article/retrieval tests.
- `python tools/build_help_guides.py --check`: **exit 0**; seven readable documents, six searchable guides, 87 cited articles and three evidence records.
- `python tools/evaluate_help.py --serve --output .aekr/work/continuation25/article-evaluation-final.json`: **exit 0**; all **723 case records**, questions, expected IDs, returned lists and contract outcomes equal the C24 baseline. Results remain **675/723 top-eight, 419 first, 48 misses; 723 selected-topic contracts passed**. The canonical evaluation was refreshed only for the changed implementation fingerprint.
- Independent HTTP route/render audit: **97 pages, 613 links and 154 indexed anchors**, zero failures. Source views are inert; malformed/unknown routes, disallowed methods and foreign host/origin checks retain their restrictions.
- Independent source checks: **82 original bindings and 89 registry rows**, with no conflicting shared SRC labels. The author also checked 197 links in changed source documents without errors.
- Actual Brave browser checks covered home discovery, combined search, focused section navigation, keyboard citation navigation, readable source headings and the Document Management steps. At a **320-pixel viewport**, document client/scroll widths were both **305 pixels**; table regions scroll internally. A final GS1 check confirmed that the browser exposes logical heading level seven. The viewport was reset, both task tabs closed and all three task preview processes stopped with port closure verified. Original user tabs were not changed.

The 24 guide probes were frozen before implementation/results. **24/24** found the expected guide within six results; **23** placed it first. Exact expected anchors appeared in **15/24** lists, **14** first. Independent inspection found the required meaning in a returned destination for **24/24**, with **20** complete destinations first. Four questions require a later result. Nine exact-anchor misses remain recorded, mostly because useful child sections were returned instead of the expected parent. No question, expectation or ranking rule was changed to improve these figures. This selected source-informed set is not a random user holdout or full semantic acceptance.

## Remaining limits and continuation

The six source-detail entries SRC230/280/350/340/360/400 retain their prior incomplete or ambiguous classifications. Related legacy RF steps do not establish equivalent Warehouse Mobile prompts or sign conventions. Twelve direct referenced targets remain unavailable: two articles and ten images. Other source contradictions remain qualified. The documented source review is bounded; it does not claim that no further documentation exists.

C24's existing-session/sign-out and nesting Back observations remain historical, unverified operational concerns. C25 did not revisit the installed application or replace an RF session. No new screen-reader or warehouse-process acceptance is claimed. The accepted acquisition/display/JAWS dispositions and **0/34 deployment/correlated-timing freeze** remain in force. Existing untracked Video Rec material is preserved.

Continue from the integrated guide baseline. Further search changes should preserve the 723 article cases and the 24 guide probes and compare newly lost as well as recovered results. Resolve named source gaps through relevant evidence or a separately bounded controlled walkthrough; do not enter Work Execution merely to inspect fields when entry may assign work. Historical C24 and earlier receipts retain their original checkpoint meaning.
