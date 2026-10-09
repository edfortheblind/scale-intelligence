# SCALE Knowledge

SCALE Knowledge explains warehouse processes, configuration choices and common troubleshooting questions. Start with **Configure SCALE** for setup procedures, browse warehouse processes, or search by screen, setting or process name.

```powershell
python tools/serve_help.py --port 8765
```

Open **http://127.0.0.1:8765**. The server binds to loopback only and uses the existing documentation library. It has no warehouse connection or authentication. Stop it with Ctrl+C and restart after changing knowledge or code.

## Articles

Each article introduces its subject, explains the workflow or setup procedure, and includes only relevant settings, outcomes and checks. Installation-specific and version-specific limits remain beside the guidance they qualify. Configuration procedures use documented SCALE screen and field names; they are not recorded walkthroughs of an installed warehouse.

The **Technical reference and sources** section contains supporting routine behavior, documentation excerpts and source identities. Source text and hashes remain available without interrupting the article. Related articles link to a topic's detailed setup procedure instead of repeating it.

The interface uses native HTML forms, links, headings and disclosure controls. JavaScript is unnecessary. A skip link, keyboard focus styling and narrow-window layout support accessible reading.

When a search result matches a reviewed source detail, expand **Matching detail and source** beneath its general explanation to read that passage, its source name and its limits. The article link opens the full explanation and technical references. **Return to search results** revisits your original library query after reading an article or its source, including after searching within that article. The article's **Search SCALE Knowledge** form retains that library query so you can refine it. A matching passage does not by itself confirm the intended operation or current warehouse behavior.

When reading an article, expand **Find in this article** to look for words or a question within its text and reviewed routine details. The selected article stays in view. Eight matching passages appear per page with their source qualifications; article prose retains its article-level sources. Use **Previous page** and **Next page** to read the remaining matches. The range and page count show your position; submitting a new search returns to page one. An article can cover several routines, so read the passage labels and limits. These are text matches, not generated answers. **Search SCALE Knowledge** remains available for searching the whole library.

Select a matching passage's **Source** link to open its exact supporting disclosure and qualification in the full article. **Return to matching passages** restores the article search and page you were reading. The same source links are available in global search results under **Matching detail and source**. Expand **Source identity** to read retained hashes. Article prose without a separate passage citation continues to use the article's sources.

## Detailed procedure guides

Open **Detailed procedure guides** from the home page or visit `/guides`. The Warehouse Mobile/RF and Cross Application manuals have section navigation and in-app source views. Search on the home page also returns **Procedure guide matches**, linking directly to the matching sections. Existing article results and guide-section results remain separate.

Ordinary guide results show a **Section preview:**. An ellipsis marks shortened text, which may omit later steps or qualifications. Open the section title for the full procedure, then use **Procedure context** for shared conditions. Exact SRC results retain their complete catalog qualification.

Guide and TAB design search results retain the original library query. Follow guide sections, cited sources, related design answers or dated owner evidence, then use **Return to search results** to restore that query. The context also follows **All procedure guides** and links opened from that listing. Directly opened guides keep their ordinary browse navigation.

For a known screen-flow number, enter the complete code, such as **SRC400** or **SRC 400**. The guide result opens the catalog's documented destination and states its source limitations. Unknown codes have no catalog match; custom or installation-specific flows may still exist. Questions containing other words continue to use ordinary guide search. The flow catalog also provides descriptive task and menu links for browsing. Under a child heading, use **Procedure context** to read its parent section, including shared prerequisites and conditions. The specific branch remains directly reachable.

Source views display retained text with node identities. Original scripts, live application links and figures are inactive in those views. The manuals retain operational qualifications, source disagreements and the distinction between source procedures and dated navigation observations. They do not connect to SCALE or execute an operation.

## TAB design reference

Open **TAB design reference** from the home page or `/guides`. Home-page searches also show a separate **TAB design matches** group. **Reconciled answers** search the 12 cross-source interpretations, followed by **Individual source claims** from the 69 reviewed topics. Each answer retains its full qualifications and opens a stable reference section with supporting design topics and exact source links. The sources are the official Travis 2022 base and explicitly scoped TRAV3PL 2025 addendum.

TAB results distinguish documentary interpretation, unresolved source details and the owner's dated purchase-order clarification. For example, **Does Travis use purchase orders?** links to the October 8, 2026 owner statement separately from supporting SDD context. **Are receipt container downloads required?** explains the conditional change between the two designs. Neither answer establishes current warehouse configuration or completed operations. Pending decisions remain visible, including the receiving LPN choice, conveyor integration access, Company-item Mobile Add limitation and override-count settings. Article results and procedure-guide results retain their own source scope and ranking.

Where a source claim supports a reconciled answer, **Related reconciled answers** links appear in its search result and reference section. Follow the named answer to read the combined interpretation and its qualifications, including any dated owner clarification. Claims without a reviewed relationship retain the general reconciliation link.

At the end of each TAB claim, expand **All cited source passages** to reach every passage registered for that claim, including retained source comments. Each link identifies its source and location. These citations support the recorded interpretation; unresolved decisions remain unresolved.

Source links open escaped, inert extracted text with node locations. Both original documents and their extracted packets are fingerprint-checked at startup. Source figures and page layout are not reproduced. The lookup is available through `/api/tab-design-search?q=...`: `results` retains individual claims and the additive `reconciliations` array supplies full cross-source answers, readable states and supporting links. The owner evidence view displays only the exact dated statement and its limits. Article and procedure endpoints retain their existing behavior.

## Database programming reference

Choose **Find programming objects** on the home page, or open `/programming`. Search by object name, schema-qualified name, object ID or table-column name. Full identifiers rank before partial name matches. Use the object-type filter and page links to browse all **921 procedures, 76 functions and 518 tables**. The column lookup covers **16,968 captured table columns**; results name the matching columns and their tables.

Select a matching column name to jump to its highlighted, focusable row in the table layout. Open an object for parameters or columns, qualified relationship groups and expandable captured details. Table pages group related routines by direct/reviewed references, possible delegation and mentions, with the captured evidence beside each link. Inspect that evidence before treating a relationship as access.

**Return to programming results** restores your original lookup text, object type and result page after reading an object, a related object or its captured SQL. Changing the lookup text or object type with **Find objects** starts at page one.

On a routine page, **Articles citing this routine** links to reviewed explanations tied to that captured source. An article may cover a wider process; use **Find in this article** to locate its relevant details. Routine pages also link to inert SQL text and byte-exact downloads. Markdown and JSON downloads preserve the complete exported documentation. All content describes the September 29 capture.

The programming lookup uses the existing export manifest and needs no private database snapshot or database connection. It loads on first use, verifies the complete artifact inventory, and rechecks every requested source file. Changed exports produce an unavailable response; use the [read-only programming verifier](../DB%20Architecture/PROGRAMMING_LAYOUT.md#rebuild-and-verify) before restarting. Article, procedure-guide and TAB search retain their separate behavior.

`/api/programming/search` accepts one optional `q`, `kind` (`all`, `procedure`, `function`, `table`) and positive `page`. Responses include the capture identity, scope, total count, pagination and match reasons. The object/file routes accept only known numeric object IDs and declared export types. The preview remains loopback-only and read-only.

## Maintaining the library

The [Warehouse Mobile / RF operator guide](../SDD/RF/README.md) supplies detailed, source-bound procedures and a separate live-navigation record. Its in-app guide search is measured separately from the existing 723-case article-retrieval evaluation. Adding guide results does not change that evaluation's questions, expected topic identities or article rankings.

`tools/help_guides.py` declares the exact guide and evidence paths. `help_app/guide-manifest.json` binds guide text, cited structured articles, source originals and evidence records to reviewed bytes. Startup refuses changed inputs. After reviewing a deliberate guide or source-binding change, rebuild with `python tools/build_help_guides.py`; verify without rewriting with `python tools/build_help_guides.py --check`. The builder checks retained original hashes and adds no network or warehouse access. Restart the server after changes.

The curated article store is `DB Architecture/mappings/help-topics.json`. Topic records supplied by `mappings/batches/` must also be edited there so integration preserves the change. Keep topic IDs, source bindings and authored evaluation questions stable. `article_type: configuration` marks a setup procedure and uses the existing ordered `execution_steps`; optional `related_topics` contains topic IDs.

Write each explanation once. Omit empty or redundant sections. Keep project history, acceptance decisions and evaluation instructions in project records. Preserve original documentation and unique functional caveats; do not infer effective warehouse settings or invent navigation.

`vendor-source-manifest.json` binds parsed vendor articles and reviewed SQL contracts to exact bytes. Deliberate integration refreshes it; startup verifies it and refuses drift. The generated Markdown reading copy is [HELP_TOPICS.md](../DB%20Architecture/HELP_TOPICS.md). The [SCALE Functionality Reference](../SDD/SCALE_FUNCTIONAL_REFERENCE.md) provides broader reference context.

## Verification

```powershell
python -m unittest tests.test_help_guides tests.test_guide_search_context tests.test_help_app tests.test_help_articles tests.test_retrieval tests.test_article_find tests.test_article_sources tests.test_article_search_context
python -m unittest tests.test_programming_library tests.test_programming_context
python tools/build_help_guides.py --check
python tools/evaluate_help.py --serve
python tools/verify_db_docs.py
```

The evaluator exercises HTTP search and selected-topic APIs. Search retrieval and content/citation integrity are separate checks. Questions and expected IDs remain outside the search index. `help_app/evaluation.json` records the current result and fingerprints; project receipts record comparisons and semantic review. These checks do not certify screen-reader usability or installed SCALE behavior.
