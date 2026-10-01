# SCALE Knowledge local help

Search reviewed explanations, read their ordered steps and open the exact cited passages. The application uses the existing curated knowledge library. The owner accepts the current replica as the documentation baseline; version/build is not a prerequisite for using these explanations.

The current SDD entry is the [SCALE Functionality Reference](../SDD/SCALE_FUNCTIONAL_REFERENCE.md), with an equivalent [printable PDF](<../output/pdf/SCALE Functionality Reference SDD.pdf>) and a [technical source-binding register](../SDD/derived/scale-functional-reference.json). Its 86 entries across 14 chapters synthesize 181 selected records from seven SCALE sources. Implementation examples remain conditional reference guidance; they do not establish core defaults or TAB configuration. Client names and other-product material are excluded from the central reference. Earlier named reading copies remain historical provenance, not competing active SDDs.

Start from the repository root:

```powershell
python tools/serve_help.py --port 8765
```

Open **http://127.0.0.1:8765**. Stop the server with Ctrl+C in its console. It binds only to loopback, reserves its port exclusively on Windows and serves an explicit route allowlist. It never opens a warehouse database connection or executes operational SQL. A second server cannot bind the same active port.

The interface uses native HTML forms, links, headings, lists and expandable source sections. JavaScript is unnecessary and blocked by the response policy. A skip link, visible focus styling, labels, flexible text sizing and narrow-window layout support accessible use. C11 resolved the earlier browser URL block and recorded eight bounded browser/keyboard observations; C13 checked search-result focus and Tab arrival. Current JAWS and broader display owner acceptance are closed (C14/C17). No local JAWS session or complete zoom/reflow/contrast matrix was captured; owner acceptance and observed technical checks remain distinct.

## Answers and sources

Search retrieves authored general guidance; it does not generate a new answer or infer an active configuration. Selecting a topic presents what it does, what happens, what can affect it, expected results, useful checks, evidence limits and sources. Every returned source has an exact identity/hash and cited location. SQL excerpts remain redacted and are not executable examples. Missing evidence remains explicit.

The search field keeps a visible instruction to name the process, screen, setting, or routine. This instruction is associated with the input for assistive technology. A question that omits its subject can match several unrelated processes; search cannot recover an unstated topic. Narrow questions about an unnamed routine, operation or gate now ask for its name or screen/action. Named subjects and identifiers continue through search. Clarification does not count as successful expected-topic retrieval.

The source of truth is `DB Architecture/mappings/help-topics.json` plus its source-bound reviewed routine contracts. Startup verifies source fingerprints. Search ranks short reviewed passages and returns each topic once; exact repeated contract boilerplate stays visible in answers but is omitted from retrieval. Matching routine passages include their supporting source identity. Evaluation questions and expected answers are excluded from the index; authored evaluations are not an independent holdout set. Explicit process names rank before incidental text matches. All source/query text is HTML-escaped; no source scripts, attributes, Markdown or links execute in the page.

Vendor source panels include the complete cited paragraph, list item or table subtree. Nested text keeps readable block boundaries and the original cited node identity; parent nodes no longer produce blank passages merely because their words are in child elements. The article parser is included in the implementation fingerprint, so its changes invalidate older evaluations.

Each reviewed topic heading and business question also has a short index entry, so a long explanation does not bury its introductory wording. The complete explanation and source details remain searchable. This entry uses existing guidance, without importing evaluation questions or expected topics.

Search includes the answer's reviewed limitations and initiating context, as well as short individual explanatory passages. It matches stemmed whole words, preserving exact identifiers while also splitting mixed-case identifiers and adjacent words/numbers. Partial prefixes are not expanded: searching `cap` does not also search `capture`. Normalization affects matching only; displayed source passages retain their original text. An unnamed configuration request such as “explain this setting” asks for its label, screen and intended effect. Name the process or setting to retrieve its reviewed explanation.

This local preview has no application authentication, warehouse/company filtering, external model, cloud hosting or production deployment. It is intended for the authorized local repository user. The existing AIM/SDK search database and provisional SDD extraction are unchanged by app startup; raw SDD bodies are not indexed by this app.

C19 replaced five legacy SDD bindings with four neutral functionality-reference bindings. The selected reference entries retain exact source-record, original-document and retained-node identities through the technical register. This is a bounded citation integration, not automatic indexing of the complete central document or original source corpus. Retained configuration and statement-timing citations keep their original time and scope limits. Independent source/code audits passed, and all 41 final central-PDF pages were reviewed. See the [C19 reference review](../_project/REFERENCE_SDD_C19.md) and [retrieval comparison](../_project/retrieval-change-continuation19.json) for the frozen implementation and validation result.

`vendor-source-manifest.json` binds the exact parsed AIM/SDK article bytes and reviewed SQL-contract batch bytes to the knowledge generation and original source identities. Startup rejects altered derivative or contract text even if its original-source hash label was left unchanged. The manifest is refreshed during deliberate batch integration, never silently during app startup.

The 34 process-family explanations also expose 130 previously reviewed documentary refinements. Each selected statement binds its reviewed record, original article, parsed article and exact source-node fingerprints. These supplement the introductory explanation without inventing a new execution order. Installed application behavior and production index eligibility remain unestablished. This local use does not index the entire vendor or SDD corpus.

## Reproduce the evaluation

The final C19 served HTTP evaluation passed **723/723 selected-topic contracts**, with **684/723 top-eight (94.61%), 417/723 first (57.68%) and 39 misses**. The 721 unchanged authored cases retained 682 top-eight and 416 first, with zero recoveries or new misses. Of those result lists, 662 were identical and 59 changed rank. Two new neutral cases returned two top-eight and one first result. Two other-product cases were excluded, while two former implementation-specific questions received neutral replacements; all four scope-changed cases were baseline passes. These are explicit scope changes, not recovered misses.

All [23 in-scope known scenarios](../_project/help-question-continuation19.json) were preserved, with QS-18 separately excluded. C19 verification recorded 70 relevant tests passing, with zero failures or skips. Final database verification passed. Private publication and exact remote parity are recorded separately after commit. The next active work is source-grounded resolution of the 39 remaining search gaps, using the existing per-case assessments without repeating completed reference or integration work.

The preserved historical C18 result is **686/725 top-eight, 420/725 first and 39 misses**, with 725/725 selected-topic contracts. The [C18 source assessment](../_project/RETRIEVAL_SOURCE_ASSESSMENT_C18.md) found zero new document-driven resolutions: 19 cases needed a referent, five already had useful alternatives, and 15 retained missing distinctions. The central reference does not by itself establish that these misses are solved; source quality, search relevance and selected-topic integrity remain separate measures.

The [operator/configuration guide](../DB%20Architecture/OPERATOR_CONFIGURATION_HELP.md) adds plain explanations for work profiles, Work Insight versus mobile, picking checks, Packing, container closure, receiving and printing. The [24-question scenario review](../_project/HELP_QUESTION_REVIEW.md) records a separate manual assessment. Its follow-up is known-scenario remediation because baseline findings informed the changes; no scenario questions are indexed.

```powershell
python -m unittest tests.test_help_app tests.test_retrieval tests.test_runtime_profiles
python tools/evaluate_help.py --serve
```

The evaluation exercises actual local HTTP search and selected-topic APIs. It reports free-question retrieval separately from selected-topic content/citation integrity. A known topic selection is not a successful free-question retrieval. Neither metric certifies all expected explanations, absence of all unsupported inferences, intended-user usability or screen-reader operation.

`--serve` starts an isolated ephemeral loopback server and shuts it down after evaluation. To check an already running preview, use `--url http://127.0.0.1:8765` instead. `evaluation.json` records exact question outcomes, source generation and implementation identity. The evaluator rejects a server running older code or knowledge: restart it after edits before rerunning. Run `python tools/evaluate_help.py` without either transport option for an engine-only check, which is labeled separately.

## Maintenance

Preserve source originals and accepted acquisition gaps. Update curated records through reviewed batches, render their reading copies and run the database documentation verifier before treating them as a new knowledge checkpoint. The help server snapshots knowledge at startup; it does not silently reload changing evidence.
