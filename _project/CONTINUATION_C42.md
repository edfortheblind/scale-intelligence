# C42 retain the originating article search

October 9, 2026. The owner requested "continue" from C41 commit `d2272809ecfa50d089cb739b59988fc1318769c2`.

Outcome: DONE_WITH_CONCERNS

Delivery state: Query-preserving article/source links and return navigation are complete. Commit and remote parity are verified separately at publication.

Product state: Readers can return to their original library search after reading an article, searching within it or following its source. Global retrieval remains **677/723 top-eight, 433 first and 46 misses**. This navigation change earns no retrieval recovery or semantic-answer acceptance credit.

Gate/authority state: Existing scoped help/publication authority applies. Six mobile contracts remain deferred; deployment/correlated timing remains **0/34**. No database connection, warehouse operation, runtime observation or new JAWS/intended-user acceptance occurred.

## Concrete concern resolved

Searching for `ISNUMERIC` produces four related articles with source details. C41 opened the correct article/source, but discarded the originating query: the destination's library-search field was empty and its navigation offered only Browse topics. An article or source opened separately had no application link back to the original results.

Global article and source links now retain the exact library query. **Return to search results** restores that query and focuses the results heading. The article's **Search SCALE Knowledge** form is prefilled so readers can refine it. **Find in this article** remains a separate query; the application does not automatically execute the library search again inside the article.

The originating query follows related-article links, scoped searches, pagination, exact source links and **Return to matching passages**. A new scoped search resets its page and selected source while retaining the library query. Submitting the library-search form starts a new library search. Ordinary article links from browsing and programming pages keep their prior behavior.

This extends the existing URL helpers, native forms and topic route with one optional `search` context parameter. Blank/whitespace context is omitted; values above 500 characters, duplicates and unknown parameters are rejected. Return addresses are constructed local search URLs, never supplied redirect destinations. Existing find/page validation and source membership remain intact. No route, dependency, JavaScript, session, cookie, persistent index, source mapping, API payload or setting was added. [Help instructions](../help_app/README.md).

## Verification

- **167 integrated tests passed**, zero failures/skips: six new tests plus one updated source-link expectation. A new regression failed against the unmodified C41 result link before implementation. Tests cover served round trips, distinct contexts, source/page reset, related links, input boundaries and inert encoding.
- Across **723 global queries**, all **5,720 result article links** and **2,687 result source links** retain their original destinations and carry the exact query. These are occurrences across queries, not distinct articles or retrieval recoveries.
- All **340 ordinary articles** and **398 scoped result pages** remain byte-identical when no global context is supplied. With context, those **738 pages** add the expected return links and hidden form fields while preserving existing article/source text. The scoped pages retain **1,566 matches**, **1,203 source links** and **116 pagination links**; **135 related-link occurrences** also retain context. Selected-article rendering was checked with global search execution forbidden. [Corpus receipt](article-search-context-verification-c42-20261009.json).
- Home rendering, **10,262 indexed rows**, normalized search rows and **340 article API records** are unchanged. Fresh served HTTP evaluation preserves all **723 complete case records** and **723 selected-topic contracts**; only its implementation fingerprint changed.
- A separate fresh-context reviewer found no issues in the five-file code/test/instructions patch. It ran **66 focused tests**, compared 340 ordinary articles and home against C41, compared 25 HTTP cases, checked ten rejection cases, nine adversarial contexts and three blank contexts, and compared 36 global-result links across four queries. Root separately ran the integrated suite, full corpus/evaluation and browser checks.
- Local Brave keyboard checks traversed global search → article → scoped page two → source → scoped results → original library results. The library query `shipment door` stayed distinct from scoped `shipment`; page two retained matches nine through twelve. Refining the library query to `ISNUMERIC` replaced the old context, and a direct source result returned to that new query without inventing a scoped search. Focus reached the exact source and appropriate result headings.
- At **320 px**, source, article and returned-result views had equal **305 px** client/scroll widths. The return link and its focus outline were visible. No screen-reader session is claimed. The task tab was closed, viewport reset, and the identified Python listener on port **59825**, PID **3596**, stopped and verified absent.
- Guide-manifest and whitespace checks passed. Knowledge code, source/guide/export manifests and historical C41 artifacts retain their prior bytes. The full export integrity verifier was not rerun for this navigation-only change. Source exports and unrelated `Video Rec/` remain unchanged.

The [checkpoint](continuation42-20261009.json) records commands, reviewed hashes, browser scope and output identities. The final renderer change after the preview started restored eight indentation spaces outside a string; reconstructed preview bytes and final AST were verified equivalent, and the corpus check was rerun against final bytes.

## Continuation

The lost-library-query concern is resolved. Preserve the distinction between library search and scoped article search, exact query encoding, source membership and current disclosure defaults. The **46 global retrieval misses**, unresolved documentary questions, six mobile deferrals and **0/34** deployment/timing freeze remain. Prior rejected C21 ranking experiments and C39 underscore-alias diagnostics stay closed absent a distinct new justification.

Git parity does not establish OneDrive upload, live schema, deployment or intended-user acceptance.
