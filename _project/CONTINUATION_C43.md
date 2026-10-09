# C43 return to the programming lookup

October 9, 2026. The owner requested "continue" from C42 commit `dac9179c7bc3e877a7ae71cd011dbc28a39bdba4`.

Outcome: DONE_WITH_CONCERNS

Delivery state: Programming lookup context and return navigation are complete. Commit and remote parity are verified separately at publication.

Product state: Object, column, relationship and SQL links retain the originating lookup text, object-type filter and page. Global article retrieval remains **677/723 top-eight, 433 first and 46 misses**. Programming navigation earns no article-retrieval recovery or semantic-answer acceptance credit.

Gate/authority state: Existing scoped source/help publication authority applies. Six mobile contracts remain deferred; deployment/correlated timing remains **0/34**. No database connection, warehouse operation, runtime observation or new JAWS/intended-user acceptance occurred.

## Concrete concern resolved

The programming lookup `shipment`, filtered to Tables, returns 51 matches over two pages. Its only second-page result is `dbo.WAREHOUSE`; the matching `UPLOAD_SPLIT_CONSOLIDATED_SHIPMENT` column has captured ordinal 56. Both the object and column links previously discarded the query, filter and page. The object's Find programming objects link returned to the unfiltered first page. Following related routines and SQL also lost that lookup context.

**Return to programming results** now restores the original lookup and focuses its results heading. Context survives object-name and column links, related table/routine navigation, and object → captured SQL → object navigation. Submitting **Find objects** with new lookup text or a different object type starts at page one. [Help instructions](../help_app/README.md).

The existing object and SQL routes accept the same optional `q`, `kind` and `page` values as the catalog. They reuse the existing lookup validation: 200-character query limit, declared object kinds, and a positive page within the matching result range. Duplicates and unknown parameters are rejected. Related objects may legitimately fall outside the original result set, so the return context does not restrict relationship navigation.

Return addresses are constructed local catalog URLs. Direct object/SQL links without context retain their previous rendering. Article links, programming API result addresses, downloads, source qualifications and export-integrity checks retain their contracts. No route, dependency, JavaScript, cookie, session, source mapping, persistent index or setting was added.

## Verification

- **175 integrated tests passed**, zero failures/skips, including eight new tests and three updated catalog-link expectations. The new filtered-page regression failed against C42 before implementation.
- All **1,515 object pages** (518 tables and 997 routines) and **997 SQL views** remain byte-identical without context. Their **2,512 context-bearing views** preserve existing content and provide exact return links. Checks cover **13,859 relationship-link occurrences**, **997 object-to-SQL links**, **997 SQL-to-object links** and **5,024 unchanged download-link occurrences**.
- **79 catalog pages** were traversed: all 63 pages across the unfiltered All/procedure/function/table views, plus sixteen pages for `shipment`, `warehouse` and `USER_STAMP` table lookups. All **3,752 object links**, **779 column links/targets** and **144 pagination links** retain exact context and destinations. Their 79 programming-search payloads remain unchanged. Link totals are occurrences across views, not distinct objects or new evidence bindings. [Corpus receipt](programming-context-verification-c43-20261009.json).
- Existing library startup verified all **4,033 retained export files** against the unchanged manifest. Per-artifact hash checks also applied during rendering. The corpus verifier caches only repeated, unchanged lookup results in memory to bound diagnostic work; production lookup behavior and code are unchanged. No baseline was resealed and no database capture occurred.
- Fresh served HTTP article evaluation preserves all **723 complete case records** and **723 selected-topic contracts**. Only the implementation fingerprint changed; there are zero recoveries, losses or ranking changes.
- A separate fresh-context reviewer found no issues in the five-file code/test/instructions patch. It ran **75 focused tests**, independently compared all 1,515 ordinary object pages and 997 SQL views, checked **136 exact synthetic downloads**, **29 API comparisons**, **40 invalid detail contexts**, **24 adversarial context views** and **25 download-query rejections**. Five postload and four startup integrity-failure cases returned 503 while article access remained available. Integrity mutations were confined to temporary synthetic fixtures.
- Local Brave keyboard checks followed the real page-two column 56 → table → `dbo.RPT_BillOfLadingHeader` (`1747409`) → captured SQL → original results. The lookup returned to `shipment`, Tables, page two, with focus on `programming-results`; direct column navigation focused `column-56`. At **320 px**, object and returned-catalog views had equal **305 px** client/scroll widths. The result heading, long column link and page controls remained readable. Changing the query to `warehouse` returned to table page one of four; switching to Stored procedures returned to page one of one. No screen-reader session is claimed.
- Guide-manifest and whitespace checks passed. Programming/knowledge lookup code, article renderer, source/guide/export manifests and historical C42 artifacts retain their baseline bytes. The task tab was closed, viewport reset, and identified Python listener on port **53695**, PID **5804**, stopped and verified absent. Source exports and unrelated `Video Rec/` remain unchanged.

The [checkpoint](continuation43-20261009.json) records commands, reviewed hashes, browser scope and output identities.

## Continuation

The lost-programming-lookup concern is resolved. Preserve strict context validation, exact downloads, source qualifications and the distinction between programming lookup and article search. The **46 article retrieval misses**, unresolved documentary questions, six mobile deferrals and **0/34** deployment/timing freeze remain. Rejected C21 ranking experiments and C39 underscore-alias diagnostics remain closed absent a distinct new justification.

Git parity does not establish OneDrive upload, live schema, deployment or intended-user acceptance.
