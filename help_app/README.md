# SCALE Knowledge local help

Search reviewed explanations, read their ordered steps and open the exact cited passages. The application uses the existing curated knowledge library, including its explicit configuration, product/version and deployment limits.

Start from the repository root:

```powershell
python tools/serve_help.py --port 8765
```

Open **http://127.0.0.1:8765**. Stop the server with Ctrl+C in its console. It binds only to loopback, reserves its port exclusively on Windows and serves an explicit route allowlist. It never opens a warehouse database connection or executes operational SQL. A second server cannot bind the same active port.

The interface uses native HTML forms, links, headings, lists and expandable source sections. JavaScript is unnecessary and blocked by the response policy. A skip link, visible focus styling, labels, flexible text sizing and narrow-window layout support accessible use. Browser, screen-reader and intended-user acceptance remain distinct from HTML/HTTP tests; the current automation environment exposed no usable browser surface.

## Answers and sources

Search retrieves authored general guidance; it does not generate a new answer or infer an active configuration. Selecting a topic presents what it does, what happens, what can affect it, expected results, useful checks, evidence limits and sources. Every returned source has an exact identity/hash and cited location. SQL excerpts remain redacted and are not executable examples. Missing evidence remains explicit.

The source of truth is `DB Architecture/mappings/help-topics.json` plus its source-bound reviewed routine contracts. Startup verifies source fingerprints. Search ranks short reviewed passages and returns each topic once; exact repeated contract boilerplate stays visible in answers but is omitted from retrieval. Matching routine passages include their supporting source identity. Evaluation questions and expected answers are excluded from the index; authored evaluations are not an independent holdout set. Explicit process names rank before incidental text matches. All source/query text is HTML-escaped; no source scripts, attributes, Markdown or links execute in the page.

Search includes the answer's reviewed limitations and initiating context, as well as short individual explanatory passages. It matches stemmed whole words, preserving exact identifiers while also splitting mixed-case identifiers and adjacent words/numbers. Partial prefixes are not expanded: searching `cap` does not also search `capture`. Normalization affects matching only; displayed source passages retain their original text. Include the process or routine name when asking about a particular result, setting or error: a subject-free question can match several reviewed topics.

This local preview has no application authentication, warehouse/company filtering, external model, cloud hosting or production deployment. It is intended for the authorized local repository user. The existing AIM/SDK search database and provisional SDD extraction are unchanged by app startup; raw SDD bodies are not indexed by this app.

Four selected SDD claims support the product, tolerance and label boundary answers. Each binds the reviewed record, original document hash and exact extracted node identities. Source panels expose the reviewed conclusion and locations only. This local use does not make the SDD corpus eligible for production indexing. Retained configuration and statement-timing citations keep their original time and scope limits.

`vendor-source-manifest.json` binds the exact parsed AIM/SDK article bytes and reviewed SQL-contract batch bytes to the knowledge generation and original source identities. Startup rejects altered derivative or contract text even if its original-source hash label was left unchanged. The manifest is refreshed during deliberate batch integration, never silently during app startup.

The 34 process-family explanations also expose 130 previously reviewed documentary refinements. Each selected statement binds its reviewed record, original article, parsed article and exact source-node fingerprints. These supplement the introductory explanation without inventing a new execution order. Installed application behavior and production index eligibility remain unestablished. This local use does not index the entire vendor or SDD corpus.

## Reproduce the evaluation

```powershell
python -m unittest tests.test_help_app tests.test_retrieval tests.test_runtime_profiles
python tools/evaluate_help.py --serve
```

The evaluation exercises actual local HTTP search and selected-topic APIs. It reports free-question retrieval separately from selected-topic content/citation integrity. A known topic selection is not a successful free-question retrieval. Neither metric certifies all expected explanations, absence of all unsupported inferences, intended-user usability or screen-reader operation.

`--serve` starts an isolated ephemeral loopback server and shuts it down after evaluation. To check an already running preview, use `--url http://127.0.0.1:8765` instead. `evaluation.json` records exact question outcomes, source generation and implementation identity. The evaluator rejects a server running older code or knowledge: restart it after edits before rerunning. Run `python tools/evaluate_help.py` without either transport option for an engine-only check, which is labeled separately.

## Maintenance

Preserve source originals and accepted acquisition gaps. Update curated records through reviewed batches, render their reading copies and run the database documentation verifier before treating them as a new knowledge checkpoint. The help server snapshots knowledge at startup; it does not silently reload changing evidence.
