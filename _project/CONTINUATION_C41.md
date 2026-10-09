# C41 exact article source navigation

October 9, 2026. The owner requested "continue" from C40 commit `fd62318fa6a57e881ab398b74414e672a29416e2`.

Outcome: DONE_WITH_CONCERNS

Delivery state: Exact source links, source disclosure navigation and help instructions are complete. Commit and remote parity are verified separately at publication.

Product state: A source-qualified matching passage now opens its exact supporting disclosure in the full article. Scoped searches retain their query and page, with a return link. Global retrieval remains **677/723 top-eight, 433 first and 46 misses**. This navigation change earns no global retrieval recovery or semantic-answer acceptance credit.

Gate/authority state: Existing source/help publication authority applies. Six mobile contracts remain deferred; deployment/correlated timing stays frozen at **0/34**. No database connection, warehouse operation, runtime observation or new JAWS/intended-user acceptance occurred.

## Concrete concern resolved

Matching passages named their source but provided no direct link to its disclosure. For **Why adding a default configuration may leave an existing value unchanged**, searching `accessorial` finds six passages among an article's 31 source disclosures. The first cites `dbo.dbc_IAccessorialHeader`; readers previously had to locate that source manually. The same gap existed under global search results' **Matching detail and source** controls.

The existing **Source** label now links to the exact cited disclosure. The full article remains present; its technical reference section and selected source open automatically. The source's existing qualification appears beside its retained content, while **Source identity** remains available as a separate closed disclosure. Other sources remain closed. A focusable destination and scroll spacing keep keyboard focus visible.

When opened from **Find in this article**, **Return to matching passages** restores the exact query, selected article and page. Plain article prose retains article-level attribution without an invented passage citation. The [help instructions](../help_app/README.md) describe both navigation paths.

The existing topic route accepts one optional `source` parameter, validated against that article's registered sources before evidence rendering. Unknown or foreign sources return 404; blank or duplicate parameters return 400. Existing search/page validation remains intact. Stable destination IDs encode the source identity without collisions, and URLs/HTML escape special characters. No route, dependency, index, source binding or setting was added.

## Verification

- **161 integrated tests passed**, zero failures/skips, including eight new tests for membership, disclosure state, pagination context, unsourced prose, global links, escaping and served special-character round trips.
- Across **340 articles**, all **1,307 article/source pairs**, representing **1,195 unique cited sources**, have unique focusable targets. Each selected-source view opens only its outer references and requested disclosure; qualification, excerpts and source hashes remain intact, and nested identity stays closed.
- The C40 retained-word probes traversed **398 pages and 1,566 scoped matches**. All **1,203 source-qualified links** retain their exact article, query, page and source identity. The remaining matches retain article-level attribution.
- All **723 evaluation questions** were also rendered as global searches. Their **2,687 exact-source links** map to sources registered for the corresponding articles. These are link occurrences across queries, not distinct sources or retrieval recoveries. [Corpus receipt](article-source-navigation-verification-c41-20261009.json).
- All 340 ordinary article pages equal C40 after removing only the new destination attributes. Scoped/global result HTML equals C40 after removing only new source-link wrappers and destination attributes. Home rendering, **10,262 indexed rows**, normalized search rows and **340 article API records** are unchanged.
- Fresh served HTTP evaluation preserves all **723 complete case records** and **723 selected-topic contracts**. Only the implementation fingerprint changed in `help_app/evaluation.json`; zero recoveries, losses or ranking changes.
- A separate fresh-context reviewer passed the five-file implementation/test/instructions/style patch with no findings. It ran **67 focused tests**, eight retained-source probes spanning six source kinds, nineteen baseline HTTP status comparisons and sixteen additional source-route boundary probes. Root separately ran the integrated suite, corpus, evaluation and browser checks.
- Local Brave keyboard checks followed both scoped and global source links, verified exact destination focus and native disclosure states, and returned to the original scoped results. A page-two check preserved `shipment door`, the ninth-through-thirteenth range and page two. At **320 px**, both source and return views had equal **305 px** client/scroll widths; text, qualification, links and focus remained readable. No screen-reader session is claimed.
- Guide-manifest and whitespace checks passed. Source/guide/export manifests, Knowledge code and historical C40 artifacts retain their baseline bytes. The task tab was closed, viewport reset, and identified Python listener on port **64757**, PID **18972**, stopped and verified absent. The full export integrity verifier was not rerun for this navigation-only change. Source exports and unrelated `Video Rec/` remain unchanged.

The [checkpoint](continuation41-20261009.json) records commands, exact reviewed hashes, browser scope and output identities.

## Continuation

The exact-source navigation concern is resolved. Preserve source membership, qualifications, ordinary disclosure defaults and exact scoped context in future changes. The **46 global retrieval misses**, unresolved documentary questions, six mobile deferrals and **0/34** deployment/timing freeze remain. Rejected C21 ranking experiments and the C39 underscore-alias diagnostic stay closed absent a distinct new justification.

Git parity does not establish OneDrive upload, current live schema, deployment or intended-user acceptance.
