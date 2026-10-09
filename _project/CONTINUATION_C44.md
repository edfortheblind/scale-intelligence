# C44 return from guides and cited sources

October 9, 2026. The owner requested "continue" from C43 commit `41589c40c8da3379dac33df06a7f5debac677d77`.

Outcome: DONE_WITH_CONCERNS

Delivery state: Guide search continuity is complete. Commit and remote parity are verified separately at publication.

Product state: Procedure and TAB design result links retain the originating library query through guides, cited sources, related design answers, evidence and the guide listing. Article retrieval remains **677/723 top-eight, 433 first and 46 misses**. Navigation supplies no retrieval recovery or semantic-answer acceptance credit.

Gate/authority state: Existing scoped source/help publication authority applies to the current public target. Six mobile contracts remain deferred and deployment/correlated timing remains **0/34**. No database connection, warehouse operation, runtime observation or new JAWS/intended-user acceptance occurred.

## Concrete concern resolved

Searching for `SRC400` opened the correct qualified section of the mobile inventory guide, but its link discarded the query. Guide and source navigation offered only general browse destinations. Unlike the C42 article flow, there was no way to restore the originating search through an explicit return link.

**Return to search results** now restores the exact library query and focuses the existing results heading. Procedure-guide and TAB search links preserve their original destination fragments. The query follows guide links, related reconciled answers, all registered source citations, dated owner evidence, and **All procedure guides**. Same-page anchors retain context naturally. Browse links on the home page remain ordinary browse entrypoints. [User instructions](../help_app/README.md).

The existing `/guides`, `/guide/`, `/guide-source/` and `/guide-evidence/` HTML routes accept one optional `search` value of at most 500 characters. Whitespace-only values behave as absent. Duplicate, unknown, malformed or overlong values return 400. The return destination is constructed locally, not accepted from a supplied URL. No-context renderings retain their original bytes.

## Minimum sufficient change

The root cause was omitted context at existing renderer and HTTP boundaries. Existing article/programming flows established the local-query pattern; existing guide functions own all affected links. Extending those functions with standard-library URL serialization was sufficient. Three renderer helpers normalize context, serialize local guide URLs and render the return link; one handler helper validates the query. No generic HTML rewrite, new route, dependency, JavaScript, cookie, session, setting or persistent index was added.

Production changes are **84 inserted and 40 removed lines** in two files; line counts describe the change, not quality. The only public contract addition is the optional parameter on existing HTML views; guide/article/programming APIs, source bindings and search ranking are unchanged. Independent review found no production or minimality issue. Five behavior tests and three existing TAB search-link expectations cover the changed navigation.

## Verification

- **180 integrated tests passed**, zero failures/skips. The SRC400 regression failed against C43 before implementation. An initial fixture used a guide without an evidence link; its replacement lacked citation labels. The test now uses the actual catalog evidence links and inventory citation labels. The final five-test rerun and integrated run passed; production code required no correction.
- All **106 ordinary views** preserve their titles and body bytes: eight guides, 89 sources, eight evidence pages and one guide listing. Their **106 context-bearing views** preserve content and **15,571 ID occurrences**, with 106 exact return links. Empty and whitespace-only context preserve **212 renderings**.
- Across contextual views and bounded search cases, **3,976 local link occurrences** and **3,864 fragment destinations** resolve. **3,447 applicable links** retain context; **413 same-page links** inherit it. These are occurrence counts, not distinct source or object totals.
- **117 bounded search cases** preserve rendered content and **1,948 result-link occurrences**: 24 retained guide probes, 69 claim IDs, 12 reconciliation IDs and 12 C31 probes. This explicitly composed set is not asserted to be identical to the historical 93 TAB cases. Guide/TAB payloads remain unchanged across rendering and their lookup implementation remains equal to C43. [Corpus receipt](guide-search-context-verification-c44-20261009.json).
- Fresh served HTTP evaluation preserves all **723 complete article records** and **723 selected-topic contracts**. Only the implementation fingerprint changed; zero recoveries, losses or ranking changes.
- Fresh-context independent review ran 63 focused tests, found the citation-label fixture error, and verified its correction with a five-test rerun. Its independent loopback probes passed **52 invalid-context rejections**, **32 exact/inert context views**, **7,696 onward link occurrences** and **eight unchanged external/non-guide URLs**. No production findings remained. The reviewer did not author the implementation or repeat the corpus, complete evaluation or browser checks.
- Local Brave keyboard checks followed `SRC400` result → guide heading → captured screenflow source → original search. A new `purchase orders` search reached the dated owner evidence and returned to the exact query. Guide/source/evidence focus targets and returned `results-heading` focus were observed. At **320 px**, owner evidence and returned search had equal **305 px** client/scroll widths and readable return navigation. This is bounded browser evidence, not screen-reader acceptance.
- Guide-manifest and whitespace checks passed. Article/programming renderers and lookup implementations, source/guide/export manifests and historical C43 artifacts retain their baseline bytes. The task tab was closed, viewport reset, and preview port **52805**, identified Python PID **38248**, stopped and verified absent. No export rebuild or snapshot reseal occurred. Archive payload and unrelated `Video Rec/` were untouched.

The [checkpoint](continuation44-20261009.json) records commands, reviewed hashes, limits and changed-output identities.

## Continuation

The lost-guide-search concern is resolved. Preserve strict context validation, source qualifications, exact fragments and the distinction between navigation and answer quality. The **46 article retrieval misses**, unresolved documentary questions, six mobile deferrals and **0/34** deployment/timing freeze remain. Rejected C21 ranking experiments and C39 underscore-alias diagnostics remain closed without a distinct justification.

Git parity does not establish OneDrive upload, live schema, deployment or intended-user acceptance. Continue only from another concrete source/help concern supported by evidence.
