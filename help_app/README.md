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

## Maintaining the library

The [Warehouse Mobile / RF operator guide](../SDD/RF/README.md) supplies detailed, source-bound procedures and a separate live-navigation record. It is a linked documentation supplement; its new text is not part of the application's curated search index or the existing 723-case retrieval evaluation.

The curated article store is `DB Architecture/mappings/help-topics.json`. Topic records supplied by `mappings/batches/` must also be edited there so integration preserves the change. Keep topic IDs, source bindings and authored evaluation questions stable. `article_type: configuration` marks a setup procedure and uses the existing ordered `execution_steps`; optional `related_topics` contains topic IDs.

Write each explanation once. Omit empty or redundant sections. Keep project history, acceptance decisions and evaluation instructions in project records. Preserve original documentation and unique functional caveats; do not infer effective warehouse settings or invent navigation.

`vendor-source-manifest.json` binds parsed vendor articles and reviewed SQL contracts to exact bytes. Deliberate integration refreshes it; startup verifies it and refuses drift. The generated Markdown reading copy is [HELP_TOPICS.md](../DB%20Architecture/HELP_TOPICS.md). The [SCALE Functionality Reference](../SDD/SCALE_FUNCTIONAL_REFERENCE.md) provides broader reference context.

## Verification

```powershell
python -m unittest tests.test_help_app tests.test_help_articles tests.test_retrieval
python tools/evaluate_help.py --serve
python tools/verify_db_docs.py
```

The evaluator exercises HTTP search and selected-topic APIs. Search retrieval and content/citation integrity are separate checks. Questions and expected IDs remain outside the search index. `help_app/evaluation.json` records the current result and fingerprints; project receipts record comparisons and semantic review. These checks do not certify screen-reader usability or installed SCALE behavior.
