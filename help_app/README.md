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

When a search result matches a reviewed source detail, expand **Matching detail and source** beneath its general explanation to read that passage, its source name and its limits. The article link opens the full explanation and technical references. A matching passage does not by itself confirm the intended operation or current warehouse behavior.

## Detailed procedure guides

Open **Detailed procedure guides** from the home page or visit `/guides`. The Warehouse Mobile/RF and Cross Application manuals have section navigation and in-app source views. Search on the home page also returns **Procedure guide matches**, linking directly to the matching sections. Existing article results and guide-section results remain separate.

For a known screen-flow number, enter the complete code, such as **SRC400** or **SRC 400**. The guide result opens the catalog's documented destination and states its source limitations. Unknown codes have no catalog match; custom or installation-specific flows may still exist. Questions containing other words continue to use ordinary guide search. The flow catalog also provides descriptive task and menu links for browsing. Under a child heading, use **Procedure context** to read its parent section, including shared prerequisites and conditions. The specific branch remains directly reachable.

Source views display retained text with node identities. Original scripts, live application links and figures are inactive in those views. The manuals retain operational qualifications, source disagreements and the distinction between source procedures and dated navigation observations. They do not connect to SCALE or execute an operation.

## Maintaining the library

The [Warehouse Mobile / RF operator guide](../SDD/RF/README.md) supplies detailed, source-bound procedures and a separate live-navigation record. Its in-app guide search is measured separately from the existing 723-case article-retrieval evaluation. Adding guide results does not change that evaluation's questions, expected topic identities or article rankings.

`tools/help_guides.py` declares the exact guide and evidence paths. `help_app/guide-manifest.json` binds guide text, cited structured articles, source originals and evidence records to reviewed bytes. Startup refuses changed inputs. After reviewing a deliberate guide or source-binding change, rebuild with `python tools/build_help_guides.py`; verify without rewriting with `python tools/build_help_guides.py --check`. The builder checks retained original hashes and adds no network or warehouse access. Restart the server after changes.

The curated article store is `DB Architecture/mappings/help-topics.json`. Topic records supplied by `mappings/batches/` must also be edited there so integration preserves the change. Keep topic IDs, source bindings and authored evaluation questions stable. `article_type: configuration` marks a setup procedure and uses the existing ordered `execution_steps`; optional `related_topics` contains topic IDs.

Write each explanation once. Omit empty or redundant sections. Keep project history, acceptance decisions and evaluation instructions in project records. Preserve original documentation and unique functional caveats; do not infer effective warehouse settings or invent navigation.

`vendor-source-manifest.json` binds parsed vendor articles and reviewed SQL contracts to exact bytes. Deliberate integration refreshes it; startup verifies it and refuses drift. The generated Markdown reading copy is [HELP_TOPICS.md](../DB%20Architecture/HELP_TOPICS.md). The [SCALE Functionality Reference](../SDD/SCALE_FUNCTIONAL_REFERENCE.md) provides broader reference context.

## Verification

```powershell
python -m unittest tests.test_help_guides tests.test_help_app tests.test_help_articles tests.test_retrieval
python tools/build_help_guides.py --check
python tools/evaluate_help.py --serve
python tools/verify_db_docs.py
```

The evaluator exercises HTTP search and selected-topic APIs. Search retrieval and content/citation integrity are separate checks. Questions and expected IDs remain outside the search index. `help_app/evaluation.json` records the current result and fingerprints; project receipts record comparisons and semantic review. These checks do not certify screen-reader usability or installed SCALE behavior.
